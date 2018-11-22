unit unionCon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, Menus;

type
  TFrmunionCon = class(TForm)
    lb_1: TLabel;
    edt_1: TEdit;
    edt_2: TEdit;
    lb_2: TLabel;
    lb_11: TLabel;
    edt_3: TEdit;
    lb_13: TLabel;
    edt_4: TEdit;
    bbt_11: TBitBtn;
    pnl1: TPanel;
    bbt_1: TBitBtn;
    bbt_2: TBitBtn;
    pnl2: TPanel;
    pnl3: TPanel;
    bbt_5: TBitBtn;
    bbt_6: TBitBtn;
    bbt_Save: TBitBtn;
    chk_1: TCheckBox;
    label6: TLabel;
    dgh_grd1: TDBGridEh;
    lb_4: TLabel;
    bbt_Cancel: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure bbt_SaveClick(Sender: TObject);
    procedure bbt_11Click(Sender: TObject);
    procedure edt_4DblClick(Sender: TObject);
    procedure bbt_1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbt_5Click(Sender: TObject);
    procedure dgh_grd1ColExit(Sender: TObject);
    procedure bbt_6Click(Sender: TObject);
    procedure bbt_2Click(Sender: TObject);
    procedure bbt_CancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
    OldGridWnd : TWndMethod;
    procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  FrmunionCon: TFrmunionCon;
  tag: Integer;
  ConName: string;

implementation

uses dm,common, DB, Pick_WorkShop, SetHoliday;
{$R *.dfm}

procedure TFrmunionCon.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
  if Message.Msg = WM_MOUSEWHEEL then
  begin
    IsNeg := Short(Message.WParamHi) < 0;
    if IsNeg then dgh_grd1.DataSource.DataSet.MoveBy(1)
    else
      dgh_grd1.DataSource.DataSet.MoveBy(-1);
    bbt_11.Enabled := False;
    bbt_5.Enabled := True;
    edt_1.Text := damo.qry725.FieldValues['ControlItemName'];
    edt_2.Text := damo.qry725.FieldValues['TarNum'];
    edt_3.Text := Damo.qry725.FieldValues['TarDellTax'];
    edt_4.Text := damo.qry725.FieldValues['name'];
    if damo.qry725.FieldValues['ItemType'] = 0 then  chk_1.Checked := True
    else chk_1.Checked := False;
    edt_2.ReadOnly := True;
    edt_3.ReadOnly := True;
    edt_1.Enabled := False;
    edt_4.Enabled := False;
    edt_2.Font.Color := clGray;
    edt_3.Font.Color := clGray;
  end
  else
   OldGridWnd(Message);
end;

procedure TFrmunionCon.bbt_SaveClick(Sender: TObject);
var
  Contype, ConRkey: Integer;
begin
  if strtoint(vprev) <> 4 then
  begin
    messagedlg('对不起! 您没有该功能的设置权限',mtinformation,[mbok],0);
    Exit;
  end;
  if (Trim(edt_1.Text) = '') or (Trim(edt_2.Text) = '') or (Trim(edt_3.Text) = '') or (Trim(edt_4.Text) = '') then
  begin
    ShowMessage('您输入的信息不全，请重新输入！');
    Exit;
  end;
  if MessageDlg('确定要保存该条记录？', mtInformation, [mbYes, mbNo], 1) = mryes then
  begin

  if tag = 0 then
  begin
    if chk_1.Checked then Contype := 0
    else Contype := 2;
    with Damo.qrytemp do
    begin
      //插入725表
      Close;
      SQL.Clear;
      SQL.Text := Format('insert into data0725 values(''%s'', %f, %f,%d,%d)'
        , [Trim(edt_1.Text), StrToFloat(Trim(edt_2.Text)), StrToFloat(Trim(edt_3.Text)),Contype,0]);
      ExecSQL;
      //找出插入725的rkey
      Close;
      SQL.Clear;
      SQL.Text := 'select rkey from data0725 where ControlItemName=' + QuotedStr(edt_1.Text);
      Open;
      ConRkey := FieldValues['rkey'];
      //插入726表
      Close;
      SQL.Clear;
      SQL.Text := 'insert into data0726(Con_ptr, ConProItem_ptr) '
        + 'select ' + IntToStr(ConRkey) + ', rkey from data0034 where rkey in  '+ label6.Caption;
      ExecSQL;
    end;
  end;
  
  if tag = 1 then
  begin
    with Damo.qrytemp do
    begin
      //更新725表
      Close;
      SQL.Clear;
      SQL.Text := Format('update data0725 set ControlItemName=''%s'', TarNum=%f, TarDellTax=%f where rkey = %d '
        , [edt_1.Text, StrToFloat(edt_2.Text), StrToFloat(edt_3.Text), Damo.qry725.FieldByName('rkey').AsInteger]);

      ExecSQL;
    end
  end;
  end;
  damo.qry725.Close;
  damo.qry725.Open;
end;


//所含工序
procedure TFrmunionCon.bbt_11Click(Sender: TObject);
begin
  with TfrmPick_WorkShop.Create(Application)do
  try
  if Edt_4.Text<>'' then
    adsPickWorkShop.CommandText:=
    adsPickWorkShop.CommandText+' where ttype =1 and rkey not in '+label6.Caption;

    adsPickWorkShop.CommandText:=
    adsPickWorkShop.CommandText+' order by dept_Code';
    Enter(0);
    if ShowModal = mrok then
    begin
      cdsPickWorkShop.First;
      Label6.Caption:=Copy(label6.Caption,1,Length(label6.Caption)-1);
      if Length(Label6.Caption)>1 then
       label6.Caption:=label6.Caption+',';
      while not cdsPickWorkShop.Eof do
      begin
       if cdsPickWorkShop.FieldByName('IsSelected').AsBoolean then
        begin
         Edt_4.Text:=Edt_4.Text+cdsPickWorkShop.fieldbyName('Dept_Code').AsString+';';
         if cdsPickWorkShop.RecNo<>cdsPickWorkShop.RecordCount then
          label6.Caption:=label6.Caption+cdsPickWorkShop.fieldbyName('rkey').AsString+','
         else
          label6.Caption:=label6.Caption+cdsPickWorkShop.fieldbyName('rkey').AsString+')';
        end;
        cdsPickWorkShop.next;
      end;
    end;
  finally
    release;
  end;
end;

procedure TFrmunionCon.edt_4DblClick(Sender: TObject);
begin
  edt_4.Text:='';
  label6.Caption:='(,';
end;

procedure TFrmunionCon.bbt_1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmunionCon.FormShow(Sender: TObject);
begin
  damo.qry725.Close;
  damo.qry725.Open;
  edt_1.Text := damo.qry725.FieldValues['ControlItemName'];
  edt_2.Text := damo.qry725.FieldValues['TarNum'];
  edt_3.Text := Damo.qry725.FieldValues['TarDellTax'];
  edt_4.Text := damo.qry725.FieldValues['name'];
end;

procedure TFrmunionCon.bbt_5Click(Sender: TObject);
begin
  if strtoint(vprev) <> 4 then
  begin
    messagedlg('对不起! 您没有该功能的设置权限',mtinformation,[mbok],0);
    Exit;
  end;
  ConName := edt_1.Text;
  tag := 1;
  edt_2.ReadOnly := False;
  edt_3.ReadOnly := False;
  edt_4.Enabled := False;
  edt_2.Font.Color := clWindowText;
  edt_3.Font.Color := clWindowText;
  edt_2.SetFocus;
end;

procedure TFrmunionCon.dgh_grd1ColExit(Sender: TObject);
begin
  bbt_11.Enabled := False;
  bbt_5.Enabled := True;
  edt_1.Text := damo.qry725.FieldValues['ControlItemName'];
  edt_2.Text := damo.qry725.FieldValues['TarNum'];
  edt_3.Text := Damo.qry725.FieldValues['TarDellTax'];
  edt_4.Text := damo.qry725.FieldValues['name'];
  if damo.qry725.FieldValues['ItemType'] = 0 then  chk_1.Checked := True
  else chk_1.Checked := False;
  edt_2.ReadOnly := True;
  edt_3.ReadOnly := True;
  edt_1.Enabled := False;
  edt_4.Enabled := False;
  edt_2.Font.Color := clGray;
  edt_3.Font.Color := clGray;
end;

procedure TFrmunionCon.bbt_6Click(Sender: TObject);
begin
  if strtoint(vprev) <> 4 then
  begin
    messagedlg('对不起! 您没有该功能的设置权限',mtinformation,[mbok],0);
    Exit;
  end;
  bbt_11.Enabled := True;
  tag := 0;
  edt_1.Enabled := True;
  edt_4.Enabled := True;
  bbt_6.Enabled := True;
  edt_1.ReadOnly := False;
  edt_2.ReadOnly := False;
  edt_3.ReadOnly := False;
  edt_1.Text := '';
  edt_2.Text := '';
  edt_3.Text := '';
  edt_4.Text := '';
  edt_2.Font.Color := clWindowText;
  edt_3.Font.Color := clWindowText;
end;

procedure TFrmunionCon.bbt_2Click(Sender: TObject);
begin
  Damo.qry725.Close;
  Damo.qry725.Open;
  edt_2.Font.Color := clGray;
  edt_3.Font.Color := clGray;
end;

procedure TFrmunionCon.bbt_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmunionCon.FormCreate(Sender: TObject);
begin
 OldGridWnd := dgh_grd1.WindowProc;
 dgh_grd1.WindowProc := NewGridWnd;
end;

procedure TFrmunionCon.N1Click(Sender: TObject);
var
  Ord, OldRkey: Integer;
begin
  Ord := dgh_grd1.Row;
  with damo.qrytemp do
  begin
    SQL.Clear;
    SQL.Text := 'select rkey from data0725 where Ord=' + IntToStr(Ord - 1);
    Open;
    OldRkey := FieldValues['rkey'];

    SQL.Text := 'update data0725 set Ord=' + IntToStr(Ord - 1) + ' where rkey=' + IntToStr(damo.qry725.FieldValues['rkey']);
    ExecSQL;
    SQL.Text := 'update data0725 set Ord=' + IntToStr(Ord) + ' where rkey=' + IntToStr(OldRkey);
    ExecSQL;
  end;
  damo.qry725.Close;
  damo.qry725.Open;
end;

procedure TFrmunionCon.PopupMenu1Popup(Sender: TObject);
begin
  if Damo.qry725.FieldByName('Ord').AsInteger <=1 then  N1.Enabled := False
  else  N1.Enabled := True;
  if Damo.qry725.FieldByName('Ord').AsInteger >= Damo.qry725.RecordCount then  N2.Enabled := False
  else  N2.Enabled := True;
end;

procedure TFrmunionCon.N2Click(Sender: TObject);
var
  Ord, OldRkey: Integer;
begin
  Ord := dgh_grd1.Row;
  with damo.qrytemp do
  begin
    SQL.Clear;
    SQL.Text := 'select rkey from data0725 where Ord=' + IntToStr(Ord + 1);
    Open;
    OldRkey := FieldValues['rkey'];

    SQL.Text := 'update data0725 set Ord=' + IntToStr(Ord + 1) + ' where rkey=' + IntToStr(damo.qry725.FieldValues['rkey']);
    ExecSQL;
    SQL.Text := 'update data0725 set Ord=' + IntToStr(Ord) + ' where rkey=' + IntToStr(OldRkey);
    ExecSQL;
  end;
  damo.qry725.Close;
  damo.qry725.Open;
end;

procedure TFrmunionCon.N3Click(Sender: TObject);
begin
  FrmHoliday := TFrmHoliday.Create(Application);
  FrmHoliday.ShowModal;
  FrmHoliday.Free;
end;

end.
