unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, Menus, DB, ADODB,
  ComObj,Excel2000;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    BitBtn6: TBitBtn;
    BtQry: TBitBtn;
    DBGridEh1: TDBGridEh;
    PopupMenu2: TPopupMenu;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    BitBtn2: TBitBtn;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    PopupMenu3: TPopupMenu;
    N11: TMenuItem;
    N12: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
  private
    { Private declarations }
   sql_text:string;
   PreColumn: TColumnEh;
   procedure item_click(sender:TObject);
  public
    { Public declarations }

  end;

var
  Form1: TForm1;

implementation

uses DAMO,common, details, condition, packreport;

{$R *.dfm}

procedure tform1.item_click(sender:TObject);
var i:byte;
begin
 (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
 if (sender as tmenuItem).Checked then
 begin
  for i:=0 to DBGridEh1.FieldCount-1 do
  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGridEh1.Columns[i].Visible:=true;
    break;
   end;
 end
 else begin
  for i:=0 to DBGridEh1.FieldCount-1 do
  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGridEh1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
close;
application.Terminate;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
 popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
  curr_date:tdatetime;
begin
if dm.ADOConnection1.Connected then
 begin
  curr_date:=getsystem_date(dm.ADOQuery1,1);
  dm.ADS698.Close;
  dm.ADS698.Parameters[0].Value:=curr_date-7;
  dm.ADS698.Parameters[1].Value:=curr_date+1;
  dm.ADS698.Open;
  sql_text := dm.ADS698.CommandText;
  PreColumn := DBGridEh1.Columns[0];
  for i:=1 to DBGridEh1.Columns.Count do
  begin
    item := TmenuItem.Create(self) ;
    item.Caption := DBGridEh1.Columns[i-1].Title.Caption ;
    if DBGridEh1.Columns[i-1].Visible then
      item.Checked := true ;
    item.OnClick := item_click ;
    self.PopupMenu2.Items.Add(item) ;
  end;
 end;
end;

procedure TForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADS698.CommandText);
end;

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   dm.ADS698.IndexFieldNames:=Column.FieldName;
  end
  else begin
   column.Title.SortMarker:=smDownEh;
   dm.ADS698.IndexFieldNames:=Column.FieldName+' DESC';
  end;

  if (PreColumn.FieldName<>column.FieldName)  and
  //(dm.ADS698.Fields.FieldByName(PreColumn.FieldName).DataType in [ftString,ftWideString]) then
     (column.Field.DataType in [ftString,ftWideString]) then
// (PreColumn.Field.DataType  in [ftString,ftWideString]) then
//  (not column.ReadOnly) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   dm.ADS698.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else dm.ADS698.filter := '';
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 v_rkey: integer;
begin
v_rkey := 0;
if not dm.ADS698.IsEmpty then  v_rkey := dm.ADS698rkey.Value;
 dm.ADS698.Close;
 dm.ADS698.Open;
if v_rkey > 0 then  dm.ADS698.Locate('rkey',v_rkey,[]);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
if not dm.ADS698.IsEmpty then
Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not app_init(dm.ADOConnection1) then
   begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
   end;
 self.Caption:=application.Title;

 // user_ptr:='3';
 // vprev:='2';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

end;

procedure TForm1.BtQryClick(Sender: TObject);
var i:byte;
begin
 with condition_form do
 begin
  dtpk1.Date:= strtodate(formatdatetime('yyyy-mm-dd',dm.ADS698.Parameters.ParamValues['dtpk1']));
  dtpk2.Date:= strtodate(formatdatetime('yyyy-mm-dd',dm.ADS698.Parameters.ParamValues['dtpk2']));
  if ShowModal=mrok then
  with dm.ADS698 do
   begin
    close;
    CommandText:=self.sql_text+#13;
    for i:=1 to condition_form.SGrid1.RowCount-2 do
      CommandText:=CommandText+condition_form.SGrid1.Cells[2,i]+#13;
    Parameters.ParamValues['dtpk1']:=strtodatetime(formatdatetime('yyyy-mm-dd',condition_form.dtpk1.Date));
    Parameters.ParamValues['dtpk2']:=strtodatetime(formatdatetime('yyyy-mm-dd',condition_form.dtpk2.Date));
    open;
   end;
 end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 showmsg('对不起,您只有本程序的只读权限',1)
else
try
//1 application.CreateForm(Tdetails_Form,details_Form);
 details_Form:= Tdetails_Form.Create(application);  //2
//with Tdetails_Form.Create(Application) do
 details_Form.aded_flag:=2;
 if details_Form.ShowModal=mrok then
  begin
   dm.ADS698.Close;
   dm.ADS698.Open;
   dm.ADS698.Locate('pack_number',details_form.Edit1.Text,[]);
  end;
finally
  details_Form.free;
end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
try
//1 application.CreateForm(Tdetails_Form,details_Form);
 details_Form:= Tdetails_Form.Create(application);  //2
//with Tdetails_Form.Create(Application) do
 details_Form.aded_flag:=3;
 details_Form.btnSave.Enabled:=false;
 details_Form.BitBtn4.Enabled:=false;
 details_Form.StringGrid1.PopupMenu:=nil;
 details_Form.stringgrid1.Options:=details_Form.stringgrid1.Options+[gorowselect];
 details_Form.Edit6.ReadOnly:=true;
 details_Form.Edit1.ReadOnly:=true;

 if details_Form.ShowModal=mrok then
  begin
   dm.ADS698.Close;
   dm.ADS698.Open;
   dm.ADS698.Locate('pack_number',details_form.Edit1.Text,[]);
  end;
finally
  details_Form.free;
end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 showmsg('对不起,您只有本程序的只读权限',1)
else
 if Msg_Dlg_Ask('你真的确定要删除标签记录吗?','删除确认',1) then
  try
   dm.ADOConnection1.BeginTrans;
   with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='delete data0698 '+
            'where rkey='+inttostr(dm.ADS698rkey.Value);
    ExecSQL;
   end;
   dm.ADOConnection1.CommitTrans;
   showmsg('删除操作成功',1);
   BitBtn3Click(nil);
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.ADS698.IsEmpty then
 begin
  n2.Enabled:=false;
  n3.Enabled:=false;
  n4.Enabled:=false;
  n9.Enabled:=false;
  n10.Enabled:=false;
  n6.Enabled:=false;
 end
else
 begin
  n2.Enabled:=true;
  n3.Enabled:=true;
  n4.Enabled:=true;
  n9.Enabled:=true;
  n10.Enabled:=true;
  n6.Enabled:=true;
 end;
end;

procedure TForm1.N6Click(Sender: TObject);
var
 iCount, jCount: Integer;
 XLApp: Variant;
 Sheet: Variant;

begin


 Screen.Cursor := crHourGlass;
 if not VarIsEmpty(XLApp) then
  begin
   XLApp.DisplayAlerts := False;
   XLApp.Quit;
   VarClear(XLApp);
  end;

  try
   XLApp := CreateOleObject('Excel.Application');
  except
   Screen.Cursor := crDefault;
   Exit;
  end;

  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := dm.ADS698PO_NUMBER.Value;
  Sheet := XLApp.Workbooks[1].WorkSheets[XLApp.WorkBooks[1].WorkSheets[1].Name];

with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select order_no as ''序号'',' +
  'MANU_PART_NUMBER as ''本厂编号'',MANU_PART_DESC as ''客户型号'',ANALYSIS_CODE_2 as ''客户物料号'', '+
          'PO_NUMBER as ''客户订单号'',qty as ''数量'',code as ''代码'','+
          'lotno as ''批次'',barcode_id as ''条形码'',description as ''描述'',notes as ''备注'' '+
          'from data0699 where pack_ptr ='+dm.ADS698rkey.AsString+
          ' order by order_no';
  open;
 end;

  for iCount := 0 to dm.ADOQuery1.FieldCount-1 do
   Sheet.Cells[1, iCount + 1 ] :=dm.ADOQuery1.Fields[icount].DisplayLabel;

  for jcount :=1 to dm.ADOQuery1.RecordCount do
   begin
    for iCount := 0 to dm.ADOQuery1.FieldCount-1 do
    begin
      if dm.ADOQuery1.Fields[icount].DataType=ftString then
        Sheet.Cells[jCount + 1, iCount + 1].NumberFormatLocal:='@';
    Sheet.Cells[jCount + 1, iCount + 1] := dm.ADOQuery1.Fields[icount].AsString;
    end;
    dm.ADOQuery1.Next;
   end;
  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  dm.adoquery1.close;
end;



procedure TForm1.N7Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 showmsg('对不起,您只有本程序的只读权限',1)
else
try
//1 application.CreateForm(Tdetails_Form,details_Form);
 details_Form:= Tdetails_Form.Create(application);  //2
//with Tdetails_Form.Create(Application) do
 details_Form.aded_flag:=1;
 details_Form.Edit13.Text:='内箱';
 if details_Form.ShowModal=mrok then
  begin
   dm.ADS698.Close;
   dm.ADS698.Open;
   dm.ADS698.Locate('pack_number',details_form.Edit1.Text,[]);
  end;
finally
  details_Form.free;
end;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 showmsg('对不起,您只有本程序的只读权限',1)
else
try
//1 application.CreateForm(Tdetails_Form,details_Form);
 details_Form:= Tdetails_Form.Create(application);  //2
//with Tdetails_Form.Create(Application) do
 details_Form.aded_flag:=1;
 details_Form.Edit13.Text:='外箱';
 if details_Form.ShowModal=mrok then
  begin
   dm.ADS698.Close;
   dm.ADS698.Open;
   dm.ADS698.Locate('pack_number',details_form.Edit1.Text,[]);
  end;
finally
  details_Form.free;
end;
end;

procedure TForm1.N9Click(Sender: TObject);
begin
try
  packreport_form:= Tpackreport_form.Create(application);
  packreport_form.ppReport1.Reset;
  packreport_form.ppReport1.Template.FileName :=
    stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'PACK_mark.rtm';
  packreport_form.ppReport1.Template.LoadFromFile;

  packreport_form.ppReport1.SaveAsTemplate:=false;
  packreport_form.ppReport1.Print;
finally
  packreport_form.Free;
end;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
try
  packreport_form:= Tpackreport_form.Create(application);
  packreport_form.ppReport2.Reset;
  packreport_form.ppReport2.Template.FileName :=
    stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'PACK_NOmark.rtm';
  packreport_form.ppReport2.Template.LoadFromFile;

  packreport_form.ppReport2.SaveAsTemplate:=false;
  packreport_form.ppReport2.Print;
finally
  packreport_form.Free;
end;
end;

procedure TForm1.N11Click(Sender: TObject);
begin
try
packreport_form:= Tpackreport_form.Create(application);
packreport_form.ppReport1.Reset;
packreport_form.ppReport1.Template.FileName :=
  stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
    'PACK_mark.rtm';
packreport_form.ppReport1.Template.LoadFromFile;
packreport_form.ppReport1.SaveAsTemplate:=true;
packreport_form.ppdesigner1.ShowModal;
finally
packreport_form.Free;
end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
 PopupMenu3.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.N12Click(Sender: TObject);
begin
try
packreport_form:= Tpackreport_form.Create(application);
packreport_form.ppReport2.Reset;
packreport_form.ppReport2.Template.FileName :=
  stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
    'PACK_NOmark.rtm';
packreport_form.ppReport2.Template.LoadFromFile;
packreport_form.ppReport2.SaveAsTemplate:=true;
packreport_form.ppDesigner2.ShowModal;
finally
packreport_form.Free;
end;
end;

end.
