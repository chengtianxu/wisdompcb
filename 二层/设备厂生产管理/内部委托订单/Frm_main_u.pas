unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ADODB;

type
  TFrm_main = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BtClose: TBitBtn;
    BtBrush: TBitBtn;
    BtQry: TBitBtn;
    Edit1: TEdit;
    Panel3: TPanel;
    Grd1: TDBGridEh;
    Splitter1: TSplitter;
    Grd2: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N12: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    N9: TMenuItem;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    PopupMenu2: TPopupMenu;
    N6: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BtCloseClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure Grd2Enter(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    FsCheck,FsSearch:string;
    FactGrd:TObject;
    procedure init;
  public

  end;

var
  Frm_main: TFrm_main;

implementation
 uses common,DM_u,Frm_QrySet_u,Frm_detail_u, UpdatePrice;
{$R *.dfm}

procedure TFrm_main.FormCreate(Sender: TObject);
begin
  if not App_Init(dm.ADOCon ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;


 // dm.ADOCon.Open;
 // user_ptr := '3';
 // vprev := '4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  init;
end;

procedure TFrm_main.BtCloseClick(Sender: TObject);
begin
  Frm_QrySet.Free;
  close;
end;

procedure TFrm_main.Edit1Change(Sender: TObject);
begin
  if Grd1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        Grd1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if Grd1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Grd1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      Grd1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TFrm_main.BtBrushClick(Sender: TObject);
var
  i:integer;
begin
  if DM.ADO70.IsEmpty then exit;
  i := DM.ADO70rkey.AsInteger ;
  DM.ADO70.Close;
  DM.ADO70.Open;
  DM.ADO70.Locate('rkey',i,[]);
end;

procedure TFrm_main.Grd1TitleClick(Column: TColumnEh);
begin
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ADO70.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ADO70.Sort:=Column.FieldName+' DESC';
  end;
  DM.ADO70AfterScroll(DM.ADO70);
  if Grd1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure TFrm_main.init;
begin
  field_name := Grd1.Columns[0].FieldName;
  PreColumn := Grd1.Columns[0];
  Grd1.Columns[0].Title.Color := clred ;
  sSql:=DM.ADO70.SQL.Text;
  FsSearch:=' where wzcp0070.type=2 and wzcp0070.sales_date>getdate()-14 ';
  CheckBox1Click(nil);
  FactGrd:=Grd1;
end;

procedure TFrm_main.Grd1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  if dm.ADO70status.Value = 6 then
     Grd1.Canvas.Font.Color := clred
  else if dm.ADO70status.Value = 2 then
     Grd1.Canvas.Font.Color := clTeal //cllime
  else if dm.ADO70status.Value = 1 then
     Grd1.Canvas.Font.Color := clfuchsia
  else if dm.ADO70status.Value = 3 then
     Grd1.Canvas.Font.Color := clGreen ;
  //else if dm.ADO70status.Value = 4 then
  //   Grd1.Canvas.Font.Color := clinfobk;
  Grd1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TFrm_main.PopupMenu1Popup(Sender: TObject);
begin
  if DM.ADO70.IsEmpty then
  begin
    n2.Enabled:=false;    //编辑
    n3.Enabled:=false;    //检查
    n4.Enabled:=false;    //提交
    n5.Enabled:=false;    //删除
    n10.Enabled:=false;    //copy
    n9.Enabled:=false;    //cancel
  end
  else
  begin
    n2.Enabled:=(dm.ADO70status.AsInteger in [1,6]) ;
    n3.Enabled := true;
    n4.Enabled := dm.ADO70status.AsInteger=1;
    n5.Enabled:=(dm.ADO70status.AsInteger in [1,6]) ;
    n10.Enabled:=true;
    n9.Enabled:=dm.ADO70status.AsInteger=2;
  end;
end;

procedure TFrm_main.BtQryClick(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Frm_QrySet=nil then  Frm_QrySet:=TFrm_QrySet.Create(Application);
  if Frm_QrySet.ShowModal=mrok then
  begin
    for i:=1 to Frm_QrySet.sgrid1.RowCount-2 do
      if Frm_QrySet.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Frm_QrySet.sgrid1.Cells[2,i];
    FsSearch:=' where wzcp0070.type=2 and wzcp0070.sales_date>='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker1.Date)+
              ''' and wzcp0070.sales_date-1<='''+formatdatetime('YYYY/MM/DD',Frm_QrySet.DateTimePicker2.Date)+''' '+Sqlstr;
    CheckBox1Click(nil);
  end;
end;

procedure TFrm_main.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.ADO70.SQL.Text);
end;

procedure TFrm_main.N1Click(Sender: TObject);
begin
  if (Tmenuitem(Sender).Tag in [0,1,3,4,10,11]) and ((strtoint(vprev)=1) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    abort;
  end;

  case Tmenuitem(Sender).Tag of
  0,1,2,10: with TFrm_detail.Create(nil) do
       try
         Ftag:=Tmenuitem(Sender).Tag;
         FGrd:=Grd2;
         initd;
         if showmodal=mrok then
         begin
           DM.ADO70.Close;
           DM.ADO70.Open;
           DM.ADO70.Locate('rkey',Frkey70,[]);
         end;
       finally
         free;
         DM.ADO70_1.Close;
         DM.ADO70_1.Close;
       end;
   3:begin    //提交
       DM.tmp.Close;
       DM.tmp.SQL.Text:='update wzcp0070 set status=2 where rkey='+DM.ADO70rkey.AsString+' and status=1' ;
       if DM.tmp.ExecSQL=0 then
         showmessage('订单状态发生改变而未能成功提交!');
       BtBrushClick(nil);
     end;

   4: begin
        if MessageBox(Handle,'确定删除此订单吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
        DM.tmp.Close;
        DM.tmp.SQL.Text:='delete from wzcp0070  where rkey='+DM.ADO70rkey.AsString+' and status in (1,6)';
        if DM.tmp.ExecSQL<>1 then
          showmessage('删除数据失败,订单状态已发生变化...')
        else
          DM.ADO70.Prior;
        BtBrushClick(nil);
      end;
   11: begin
        if MessageBox(Handle,'确定取消提交此订单吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
        DM.tmp.Close;
        DM.tmp.SQL.Text:='update wzcp0070 set status=1 where rkey='+DM.ADO70rkey.AsString+' and status=2';
        if DM.tmp.ExecSQL<>1 then
          showmessage('取消提交此订单失败,数据状态已发生变化...');
        BtBrushClick(nil);
      end;
  end;
end;

procedure TFrm_main.FormShow(Sender: TObject);
begin
  Grd1TitleClick(PreColumn);
end;

procedure TFrm_main.CheckBox1Click(Sender: TObject);
var i:integer;
begin
  FsCheck:=' and wzcp0070.status in (-1,';
  for i:=0 to GroupBox1.ControlCount-1 do
  begin
    if GroupBox1.Controls[i] is  TCheckBox then
      if TCheckBox(GroupBox1.Controls[i]).Checked then FsCheck:=FsCheck+inttostr(GroupBox1.Controls[i].Tag)+',';
  end;
  FsCheck:=FsCheck+'-2) ';
  DM.ADO70.SQL.Text:=sSql+FsSearch+FsCheck+' order by wzcp0070.sales_order';
  DM.ADO70.Close;
  DM.ADO70.Open;
end;

procedure TFrm_main.N6Click(Sender: TObject);
begin
  if strtoint(vprev)<>4 then
  begin
    messagedlg('对不起!您没有该权限',mtinformation,[mbok],0);
    abort;
  end;
  with dm.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select 1 from Data0053 t53 inner join Data0492 t492 on t53.mo_ptr = t492.rkey');
    SQL.Add('where t492.PRINTED_BY_PTR = '+dm.ADO71rkey.AsString);
    Open;
  end;
  if DM.tmp.RecordCount = 0 then
  begin
    with TfrmUpdatePrice.Create(nil) do
    try
      DM.ADO71_2.Close;
      DM.ADO71_2.Parameters[0].Value:= dm.ADO71rkey.AsInteger;
      DM.ADO71_2.Open;
      if ShowModal = mrOK then
      begin
        dm.ADO71_2.UpdateBatch();
        BtBrush.Click;
      end;
    finally
      free;
    end;
  end
  else
    ShowMsg('该订单已入库,不允许修改',1);
end;

procedure TFrm_main.Grd2Enter(Sender: TObject);
begin
  FactGrd:=Sender;
end;

end.
