unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, Mask,
  DBCtrls,OleServer, Excel2000,ComObj,db, ComCtrls,dateutils;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    Edit1: TEdit;
    PopupMenu1: TPopupMenu;
    DBGridEh1: TDBGridEh;
    Label6: TLabel;
    Edit4: TEdit;
    UpDown1: TUpDown;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure BitBtn6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure BitBtn4Click(Sender: TObject);
    procedure UpDown1ChangingEx(Sender: TObject; var AllowChange: Boolean;
      NewValue: Smallint; Direction: TUpDownDirection);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;
    sql_text:string;
    procedure item_click(sender:TObject);
    procedure add_eddtrustsales(status:integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo,common, condition, add_detail;

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

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.add_eddtrustsales(status: integer);
begin
 try
 application.CreateForm(Tform2,form2);
 form2.status:=status;
 if form2.ShowModal=mrok then
 begin
  dm.ADS153.Close;
  dm.ADS153.Open;
  dm.ADS153.Locate('rkey',dm.ADOQuery1.FieldValues['rkey'],[]);
  dm.ADOQuery1.Close;
 end;
finally
  form2.free;
end;
end;

procedure TForm1.FormShow(Sender: TObject);
var
 i:integer;
 item:TMenuItem;
 curr_date:tdatetime;
begin
if  dm.ADOConnection1.Connected then
 begin
  curr_date := getsystem_date(dm.adoquery1,1);
  dm.ADS153.Close;
  dm.ADS153.Parameters.ParamByName('dtpk1').Value:=curr_date-dayof(curr_date)+1;
  dm.ADS153.Parameters.ParamByName('dtpk2').Value:=curr_date;
  dm.ADS153.Open;
  sql_text := dm.ADS153.CommandText;
  PreColumn := DBGridEH1.Columns[0];
  for i:=1 to DBGrideh1.Columns.Count do
  begin
    item := TmenuItem.Create(self) ;
    item.Caption := dbgrideh1.Columns[i-1].Title.Caption ;
    if dbgrideh1.Columns[i-1].Visible then
      item.Checked := true ;
    item.OnClick := item_click ;
    self.PopupMenu1.Items.Add(item) ;
  end;
end;  
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 close;
 application.Terminate;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 rkey:integer;
begin
  rkey:=dm.ADS153rkey.Value;
  dm.ADS153.Close;
  dm.ADS153.Open;
  if rkey>0 then  dm.ADS153.Locate('rkey',rkey,[]);
end;

procedure TForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADS153.CommandText);
end;

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   dm.ADS153.IndexFieldNames:=Column.FieldName;
  end
  else begin
   column.Title.SortMarker:=smDownEh;
   dm.ADS153.IndexFieldNames:=Column.FieldName+' DESC';
  end;

  if (column.ReadOnly) and (PreColumn.FieldName<>column.FieldName) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
  iCount, jCount, v_cloumn: Integer;
  XLApp: Variant;
  Sheet: Variant;
begin
  if dbgrideh1.DataSource.DataSet.IsEmpty then exit;
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

  XLApp.WorkBooks[1].WorkSheets[1].Name := self.Caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
  dbgrideh1.DataSource.DataSet.DisableControls;
  dbgrideh1.DataSource.DataSet.first;

  v_cloumn := 0;
  for iCount := 0 to dbgrideh1.Columns.Count - 1 do
    if dbgrideh1.Columns.Items[iCount].Visible = true then
      Sheet.Cells[1, iCount + 1 - v_cloumn] :=
        dbgrideh1.Columns[iCount].Title.Caption
    else
      inc(v_cloumn);

  jCount := 1;
  while not dbgrideh1.DataSource.DataSet.Eof do
  begin
    v_cloumn := 0;
    for iCount := 0 to dbgrideh1.Columns.Count - 1 do
      if dbgrideh1.Columns[iCount].Visible = true then
       begin
        if dbgrideh1.Columns[iCount].Field.DataType=ftString then
          Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn].NumberFormatLocal:='@';
        Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
          dbgrideh1.Columns[iCount].Field.AsString;
       end   
      else
        inc(v_cloumn);
    Inc(jCount);
    dbgrideh1.DataSource.DataSet.Next;
  end;

  sheet.rows[1].insert;
  sheet.rows[1].insert;
  sheet.rows[1].insert;
  sheet.cells[1,1]:=self.Caption;
  sheet.cells[1,1].font.size:=18;
  sheet.cells[1,1].font.bold:=true;
  sheet.cells[2,1]:='产出期间从:'+datetimetostr(dm.ADS153.Parameters.ParamValues['dtpk1']);
  sheet.cells[3,1]:='到        :'+datetimetostr(dm.ADS153.Parameters.ParamValues['dtpk2']);

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  dbgrideh1.DataSource.DataSet.First;
  dbgrideh1.DataSource.DataSet.EnableControls;
end;

procedure TForm1.UpDown1ChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
begin
dbgrideh1.FrozenCols :=newvalue;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   dm.ADS153.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else dm.ADS153.filter := '';
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var i:byte;
begin
 with form_condition do
 begin
  dtpk1.Date:= strtodate(formatdatetime('yyyy-mm-dd',dm.ADS153.Parameters.ParamValues['dtpk1']));
  dtpk2.Date:= strtodate(formatdatetime('yyyy-mm-dd',dm.ADS153.Parameters.ParamValues['dtpk2']));
  if ShowModal=mrok then
   with dm.ADS153 do
   begin
     close;
     CommandText:=self.sql_text;
     for i:=1 to form_condition.SGrid1.RowCount-2 do
       CommandText:=CommandText+form_condition.SGrid1.Cells[2,i]+#13;
     Parameters.ParamValues['dtpk1']:=strtodatetime(formatdatetime('yyyy-mm-dd',form_condition.dtpk1.Date));
     Parameters.ParamValues['dtpk2']:=strtodatetime(formatdatetime('yyyy-mm-dd',form_condition.dtpk2.Date));
     open;
   end;
 end;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限',mtinformation,[mbok],0)
else
 add_eddtrustsales(0);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not app_init(dm.ADOConnection1) then
   begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
   end;
 self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

//user_ptr:='3';
//vprev:='2';
end;

procedure TForm1.N2Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限',mtinformation,[mbok],0)
else
 add_eddtrustsales(1);
end;

procedure TForm1.PopupMenu2Popup(Sender: TObject);
begin

if dm.ADS153delivery_no.Value<>'' then
 begin
  n2.Enabled:=false;
  n3.Enabled:=false;
 end
else
if not dm.ADS153.IsEmpty then
 begin
  n2.Enabled:=true;
  n3.Enabled:=true;
 end
else
 begin
  n2.Enabled:=false;
  n3.Enabled:=false;
 end;

end;

procedure TForm1.N3Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限',mtinformation,[mbok],0)
else
begin
 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey from data0153 where rkey ='+dm.ADS153rkey.AsString+
            '  and QUANTITY=QTY_ON_HAND';
  open;
 end;
if dm.ADOQuery1.IsEmpty then
 showmsg('入库记录库存发生变化不允许删除！',1)
else
if messagedlg('您确定要删除该条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 try
  dm.ADOConnection1.BeginTrans;
   with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='delete data0153 where rkey ='+dm.ADS153rkey.AsString;
    ExecSQL;
   end;
   bitbtn3click(nil);
   dm.ADOConnection1.CommitTrans;
   showmsg('删除操作成功',1);
  except
  on E: Exception do
   begin
    dm.ADOConnection1.RollbackTrans;
    messagedlg(E.Message,mterror,[mbcancel],0);
   end;
  end;
end;
end;

end.
