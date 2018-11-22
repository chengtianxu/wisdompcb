unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, ADODB,ComObj, Excel2000,ClipBrd,
  Menus, Buttons, DBGridEh;
type
  TForm_Main = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    BtQry: TBitBtn;
    BtClose: TBitBtn;
    BtBrush: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    BtnExcel: TBitBtn;
    BitBtn5: TBitBtn;
    PopupMenu2: TPopupMenu;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    procedure BtCloseClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtBrushClick(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BtnExcelClick(Sender: TObject);
    procedure CopyDbDataToExcel(Args:array of const);
    procedure BtQryClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
  private
    { Private declarations }
   field_name:string;
   sSql :string;
   PreColumn: TColumnEh;
   procedure init;
  public
    { Public declarations }
  end;

var
  Form_Main: TForm_Main;

implementation

uses demo, ScrapDetail,common, searchfs, Condition;

{$R *.dfm}

procedure TForm_Main.BtCloseClick(Sender: TObject);
begin
Application.Terminate;
end;
procedure TForm_Main.init;
begin
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  sSql:=dm.ADS574.CommandText;
  dm.ADS574.CommandText:=sSql;
  dm.ADS574.Parameters[0].Value:=common.getsystem_date(dm.temp,1)-15;
  dm.ADS574.Parameters[1].Value:=common.getsystem_date(dm.temp,1)+1;
  dm.ADS574.Close;
  dm.ADS574.Open;
end;
procedure TForm_Main.CopyDbDataToExcel(Args:array of const);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
 I: Integer;
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
 XLApp.SheetsInNewWorkbook := High(Args) + 1;

 for I := Low(Args) to High(Args) do
 begin
   XLApp.WorkBooks[1].WorkSheets[I+1].Name := self.Caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
   if not TDBGridEh(Args[I].VObject).DataSource.DataSet.Active then
    begin
     Screen.Cursor := crDefault;
     Exit;
    end;
   TDBGridEh(Args[I].VObject).DataSource.DataSet.DisableControls;
   TDBGridEh(Args[I].VObject).DataSource.DataSet.first;

   v_cloumn:=0;
   for iCount := 0 to TDBGridEh(Args[I].VObject).Columns.Count - 1 do
    if TDBGridEh(Args[I].VObject).Columns.Items[iCount].Visible=true then
     Sheet.Cells[1, iCount + 1 - v_cloumn] :=
     TDBGridEh(Args[I].VObject).Columns.Items[iCount].Title.Caption
    else
     inc(v_cloumn);

   jCount := 1;
   while not TDBGridEh(Args[I].VObject).DataSource.DataSet.Eof do
   begin
     v_cloumn:=0;
     for iCount := 0 to TDBGridEh(Args[I].VObject).Columns.Count - 1 do
      if TDBGridEh(Args[I].VObject).Columns.Items[iCount].Visible=true then
       Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
       TDBGridEh(Args[I].VObject).Columns.Items[iCount].Field.AsString
      else
       inc(v_cloumn);
     Inc(jCount);
     TDBGridEh(Args[I].VObject).DataSource.DataSet.Next;
   end;

   XlApp.Visible := True;
   TDBGridEh(Args[I].VObject).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;
end;

procedure TForm_Main.N1Click(Sender: TObject);
begin
case Tmenuitem(Sender).Tag of
0,1:
with TForm_ScrapDetail.Create(nil) do//新增和编辑
try
Ftag:=Tmenuitem(Sender).Tag;
initd;
DBEdit8.Visible:=false;
DBEdit9.Visible:=false;
DBEdit10.Visible:=false;
DBEdit11.Visible:=false;
Label14.Visible:=false;
Label15.Visible:=false;
Label16.Visible:=false;
Label17.Visible:=false;
if ShowModal=mrok then
begin
dm.ADO574.Close;
dm.ADO574.Open;
dm.ADO574.Locate('rkey',rkey574,[]);
end;
finally
Form_ScrapDetail.Free;
dm.ADO574.Close;
end;
2:
with TForm_ScrapDetail.Create(nil) do//检查
try
Ftag:=Tmenuitem(Sender).Tag;
initd;
if ShowModal=mrok then
begin
dm.ADO574.Close;
dm.ADO574.Open;
dm.ADO574.Locate('rkey',rkey574,[]);
end;
finally
Form_ScrapDetail.Free;
dm.ADO574.Close;
end;
3:
begin  //删除
        if MessageBox(Handle,'确定删除此报废记录吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
          dm.temp.Close;
          dm.temp.SQL.Text:='delete from data0574 where rkey=:rkey574 and status=0' ;
          dm.temp.Parameters[0].Value:=dm.ADS574rkey.Value;
          if dm.temp.ExecSQL<>1 then
            showmessage('删除记录失败,此记录的状态不能进行此操作!');
          BtBrushClick(nil);
end;
5:
 begin   //仓库确认
 dm.temp.Close;
 dm.temp.SQL.Text:='update data0574 set status=1,warehouse_date=getdate()'+
                      ',warehouse_user='+user_ptr+
                      'where rkey=:rkey and status=0';
 dm.temp.Parameters[0].Value:=dm.ADS574rkey.Value;
 if dm.temp.ExecSQL=0 then
 showmessage('确认失败,此记录的状态不能进行此操作!');
 BtBrushClick(nil);
 end;
6:
 begin   //财务复审
 dm.temp.Close;
 dm.temp.SQL.Text:='update data0574 set status=2,financial_date=getdate()'+
                   ',financial_user='+user_ptr+
                   'where rkey=:rkey and status=1';
 dm.temp.Parameters[0].Value:=dm.ADS574rkey.Value;
 dm.ADOQuery1.Close; //修改设备主表状态为报废
 dm.ADOQuery1.SQL.Text:='update data0417 set active_flag=5'+
                         'where rkey=:rkey417';
 dm.ADOQuery1.Parameters[0].Value:=dm.ADS574fasset_ptr.Value;
 if (dm.temp.ExecSQL=0) or (dm.ADOQuery1.ExecSQL=0) then
 showmessage('审核失败,此记录的状态不能进行此操作!');
 BtBrushClick(nil);
 end;
7:
begin   //总经理审核
dm.temp.Close;
dm.temp.SQL.Text:='update data0574 set status=3,manage_date=getdate()'+
                  ',manage_user='+user_ptr+
                  'where rkey=:rkey and status=2';
dm.temp.Parameters[0].Value:=dm.ADS574rkey.Value;
if dm.temp.ExecSQL=0 then
showmessage('审核失败,此记录的状态不能进行此操作!');
BtBrushClick(nil);
end;
end;
end;
procedure TForm_Main.FormCreate(Sender: TObject);
begin
if not App_Init(dm.ADOCon) then
  begin
   ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
   application.Terminate;
  end;
  //dm.ADOCon.Open;
  self.Caption:=application.Title;
  //user_ptr:='1587';
  //vprev:='2';
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-MM-dd';
  LongDateFormat := 'yyyy-mm-dd HH:mm:ss';
 field_name:='allocate_number';
 init;
end;
procedure TForm_Main.BitBtn2Click(Sender: TObject);
begin
edit1.Text:='';
edit1.SetFocus;
end;

procedure TForm_Main.BtBrushClick(Sender: TObject);
begin
dm.ADS574.Close;
dm.ADS574.Open;
end;

procedure TForm_Main.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;State:
  TGridDrawState);
begin
  if dm.ADS574status.Value =0 then
  DBGridEh1.Canvas.Font.Color := clred
  else if dm.ADS574status.Value =1 then
  DBGridEh1.Canvas.Font.Color := clTeal
  else if dm.ADS574status.Value =2 then
  DBGridEh1.Canvas.Font.Color := clGreen;
  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm_Main.PopupMenu1Popup(Sender: TObject);
begin
  n1.Enabled:=vprev='2';//新增
  if dm.ADS574.IsEmpty then
  begin
    n2.Enabled:=false;    //编辑
    n3.Enabled:=false;    //检查
    n4.Enabled:=false;    //删除
    n6.Enabled:=false;    //仓库确认
    n7.Enabled:=false;    //财务复审
    n8.Enabled:=false;   //总经理审核
  end
  else
  begin
    n1.Enabled:=vprev='2';  //新增
    n2.Enabled:=(vprev='2') and (dm.ADS574status.Value=0);//编辑
    n3.Enabled:=true;//检查
    n4.Enabled:=(vprev='2') and (dm.ADS574status.Value=0);//删除
    n6.Enabled:=(vprev='2') and (dm.ADS574status.Value=0);//仓库确认
    n7.Enabled:=(vprev='2') and (dm.ADS574status.Value=1);//财务复审
    n8.Enabled:=(vprev='4') and (dm.ADS574status.Value=2); //总经理审核
  end;
end;


procedure TForm_Main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(dm.ADS574.CommandText);
end;

procedure TForm_Main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.ADS574.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.ADS574.Sort:=Column.FieldName+' DESC';
  end;

  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
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

procedure TForm_Main.Edit1Change(Sender: TObject);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      DBGridEh1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TForm_Main.BtnExcelClick(Sender: TObject);
begin
CopyDbDataToExcel([DBGridEh1]);
end;

procedure TForm_Main.BtQryClick(Sender: TObject);
var i:integer;
    Sqlstr:string;
begin
  if Form_Condition=nil then  Form_Condition:=TForm_Condition.Create(Application);
  if Form_Condition.ShowModal=mrok then
  begin
    dm.ADS574.Close;
    dm.ADS574.Parameters[0].Value:=formatdatetime('YYYY/MM/DD',form_condition.DateTimePicker1.Date);
    dm.ADS574.Parameters[1].Value:=form_condition.DateTimePicker2.Date+1;
    for i:=1 to Form_Condition.sgrid1.RowCount-2 do
      if Form_Condition.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+Form_Condition.sgrid1.Cells[2,i];
    dm.ADS574.CommandText:=sSql+Sqlstr;
    dm.ADS574.Open;
    DBGridEh1.DataSource:=nil;
    DBGridEh1.DataSource:=dm.DataSource1;
  end;
end;

procedure TForm_Main.BitBtn5Click(Sender: TObject);
begin
popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm_Main.N10Click(Sender: TObject);
var
 i:byte;
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
else
 begin
  for i:=0 to DBGridEh1.FieldCount-1 do
  if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    DBGridEh1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;


end.
