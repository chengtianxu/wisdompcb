unit uEditGY;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, DBGridEh, StdCtrls, Buttons, DBGrids;

type
  TfrmEditGY = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Label1: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    N3: TMenuItem;
    Label2: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    Edit3: TEdit;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    Edit5: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
  private

    function Save346And351(var pv346rk:integer):boolean;
   
  public
    _348New:boolean;
  end;

var
  frmEditGY: TfrmEditGY;

implementation

uses uBaseGY, uDM, Pick_Item_Single,ConstVar;

{$R *.dfm}
//设置Data0351.seq_no

//
function TfrmEditGY.Save346And351(var pv346rk:integer):boolean;
var
 i:integer;
begin
try
  dm.Qery.Close ;
  if _348New then   //*************保存346******************//
  begin
    dm.Qery.SQL.Text:='INSERT INTO dbo.Data0346'+#13
      +' (ROW_NAME,ROW_VALUE,prod_route_ptr,KLAmount,sampleAmount)'+#13
      +' VALUES ('''+trim(edit1.Text)+''','+#13
      +trim(edit2.Text)+','+inttostr(Edit3.Tag)+','+trim(Edit4.Text)+','+trim(Edit5.Text)+')';
    dm.Qery.ExecSQL ;
    dm.Qery.SQL.Text:='SELECT IDENT_CURRENT(''Data0346'') AS rkey';
    dm.Qery.Open ;
    if dm.Qery.RecordCount>0 then
    begin
      pv346rk:=dm.Qery.FieldValues['rkey'];
    end;
  end
  else
  begin
    pv346rk:=dm.Qery346.FieldValues['rkey'];
    if _348New=false then
    begin
      dm.Qery.SQL.Text:='update Data0346'+#13
        +' set ROW_NAME='''+trim(edit1.Text)+''','+#13
        +' ROW_VALUE='+trim(edit2.Text)+','+#13
        +' prod_route_ptr='+inttostr(Edit3.Tag)+','+#13
        +' KLAmount='+trim(edit4.Text)+','+#13
        +' sampleAmount='+trim(edit5.Text)+#13
        +' where rkey='+dm.Qery346.Fieldbyname('rkey').AsString;
     dm.Qery.ExecSQL ;
    end;
   end;

 dm.Qery351.First ;  //*************保存351******************//

  i:=1;
  while not dm.Qery351.Eof do
   begin
    dm.Qery.SQL.Text:='INSERT INTO dbo.Data0351'+#13
      +' (D0346_PTR, D0348_PTR,seq_no, DEFT_SELECTED)'+#13
      +' VALUES ('+inttostr(pv346rk)+','+#13
      +dm.Qery351D0348_PTR.AsString+','+inttostr(i)+','+#13
      +'1)';
    dm.Qery.ExecSQL ;
    inc(i);
    dm.Qery351.Next ;
   end;

   result:=true;
except
on E: Exception do
  begin
   messagedlg(e.Message,mtwarning,[mbcancel],0);
   result:=false;
  end;
end;

end;

//保存
procedure TfrmEditGY.BitBtn1Click(Sender: TObject);
var
 v346rk:integer;
begin

  if trim(edit1.Text)='' then
  begin
    messagedlg('产品类别不能为空！', mtwarning,[mbcancel],0);
    exit;
  end;
  if trim(edit2.Text)='' then edit2.Text:='0';
  if trim(edit4.Text)='' then edit4.Text:='0';
  if trim(edit5.Text)='' then edit5.Text:='0';
//  try
//    if trim(edit2.Text)='' then edit2.Text:='0';
//      strtofloat(trim(edit2.Text));
//  except
//    on E: Exception do
//    begin
//      messagedlg('价格必须是数值！',mtwarning,[mbcancel],0);
//      exit;
//    end;
//  end;
 { if dm.Qery351.RecordCount =0 then
     begin
      messagedlg('请选择工艺！',mtwarning,[mbcancel],0);
      exit;
     end;
  }
  if _348New then
  begin
    if dm.Qery346.Locate('ROW_NAME',trim(edit1.Text),[]) then
    begin
      messagedlg('产品类别：'+dm.Qery346.FieldValues['ROW_NAME']+'已经存在！',mtwarning,[mbcancel],0);
      exit;
    end;
  end;
 try
   dm.Conn.BeginTrans;
   if _348New=false then
     if dm.Qery348.RecordCount>0 then
     begin
       dm.Qery.Close ;
       dm.Qery.SQL.Text:='delete from data0351 where D0346_PTR='+dm.Qery348.Fieldbyname('D0346_PTR').AsString;
       dm.Qery.ExecSQL;
     end;
   v346rk:=0;
   if Save346And351(v346rk) then
   begin
     dm.Conn.CommitTrans;
   end;
  {if _348New=false then
    v346rk:=dm.Qery346.FieldValues['rkey'];}

   dm.Qery346.Close;
   dm.Qery346.Open ;

   dm.Qery346.Locate('rkey',v346rk,[]);
   close;
 except
   on E: Exception do
   begin
     dm.Conn.RollbackTrans;
     messagedlg(e.Message,mtwarning,[mbcancel],0);
   end;
 end;
end;
//退出
procedure TfrmEditGY.BitBtn2Click(Sender: TObject);
begin
 close;
end;
//新增工艺
procedure TfrmEditGY.N1Click(Sender: TObject);
begin
 try
  Application.CreateForm(TfrmBaseGY, frmBaseGY);
  if frmBaseGY.ShowModal=mrok then
   begin
    if dm.Qery351.Locate('D0348_PTR',frmBaseGY.ADOQuery1.FieldValues['rkey'],[]) then
     messagedlg('工艺重复!',mtwarning,[mbcancel],0)
    else
     begin
      dm.Qery351.Append;
      dm.Qery351ADDER_NAME.Value:=frmBaseGY.ADOQuery1.FieldValues['ADDER_NAME'];
      dm.Qery351D0348_PTR.Value:=frmBaseGY.ADOQuery1.FieldValues['rkey'];

     end;
   end;
   dm.Qery351.Last ;
 finally
  frmBaseGY.free;
 end;
end;
//编辑工艺
procedure TfrmEditGY.N2Click(Sender: TObject);
begin
 try
  if dm.Qery351.RecordCount=0 then exit;
  Application.CreateForm(TfrmBaseGY, frmBaseGY);
  frmBaseGY.Edit1.Text := trim(dm.Qery351.FieldValues['ADDER_NAME']);
  if frmBaseGY.ShowModal=mrok then
   begin
    dm.Qery351.Edit;
    dm.Qery351ADDER_NAME.Value:=frmBaseGY.ADOQuery1.FieldValues['ADDER_NAME'];
    dm.Qery351D0348_PTR.Value:=frmBaseGY.ADOQuery1.FieldValues['rkey'];
   end;
 finally
  frmBaseGY.free;
 end;
end;
//删除

procedure TfrmEditGY.N3Click(Sender: TObject);
begin
 try
  dm.Qery351.Delete;

 finally
  
 end;
end;

procedure TfrmEditGY.BitBtn3Click(Sender: TObject);
var
  InputVar: PDlgInput;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(Application);
  try
    InputVar.Fields := 'code/代码/100,qte_approv_desc/描述/300';
    InputVar.Sqlstr := 'select rkey,code,qte_approv_desc from data0264';
    InputVar.AdoConn := DM.Conn;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Label4.Caption := frmPick_Item_Single.adsPick.Fieldbyname('qte_approv_desc').AsString;
      Edit3.Text := frmPick_Item_Single.adsPick.FieldValues['code'];
      Edit3.Tag := StrToInt(frmPick_Item_Single.adsPick.FieldValues['rkey']);
      Edit3.Font.Color:=clwindowtext;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TfrmEditGY.Edit3Exit(Sender: TObject);
begin
  if Trim(Edit3.Text)<>'' then
  begin
    with DM.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey,code,qte_approv_desc from data0264 where code='''+trim(Edit3.Text)+'''';
      Open;
      if IsEmpty then
      begin
        ShowMessage('请选择正确的报价审批流程');
        Edit3.SetFocus;
        Exit;
      end
      else
      begin
        Edit3.Text:=FieldValues['code'];
        Edit3.Tag:=StrToInt(FieldValues['rkey']);
        Label4.Caption:=FieldValues['qte_approv_desc'];
      end;
    end;
  end
  else
    Edit3.Tag:=0;
end;

procedure TfrmEditGY.Edit3Change(Sender: TObject);
begin
  if Trim(Edit3.Text)='' then
    Label4.Caption:='';
end;

procedure TfrmEditGY.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Trim(Edit3.Text)<>'' then
  begin
    with DM.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey,code,qte_approv_desc from data0264 where code='''+trim(Edit3.Text)+'''';
      Open;
      if not IsEmpty then
      begin
        Edit3.Text:=FieldValues['code'];
        Edit3.Tag:=StrToInt(FieldValues['rkey']);
        Label4.Caption:=FieldValues['qte_approv_desc'];
      end;
    end;
  end
end;

procedure TfrmEditGY.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9','.',#8]) then key:= #0;
end;

end.
