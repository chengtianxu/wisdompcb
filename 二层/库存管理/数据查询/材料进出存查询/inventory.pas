unit inventory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, ADODB,ComObj, Excel2000,ClipBrd,
  Menus, Buttons, DBCtrls;

type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    ado0022: TADOQuery;
    ado0022INV_PART_NUMBER: TStringField;
    ado0022WAREHOUSE_CODE: TStringField;
    ado0022GRN_NUMBER: TStringField;
    ado0022code23: TStringField;
    ado0022QUANTITY: TFloatField;
    ado0022QUAN_ON_HAND: TFloatField;
    ado0022CURR_CODE: TStringField;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ado0022PO_NUMBER: TStringField;
    ado0022inv_group_name: TStringField;
    ado0022PRICE: TFloatField;
    Edit3: TEdit;
    Label3: TLabel;
    ado0022INV_NAME: TStringField;
    ado0022INV_DESCRIPTION: TStringField;
    ado0022UNIT_NAME: TStringField;
    ado0022PO_REV_NO: TStringField;
    ado0022EMPLOYEE_NAME: TStringField;
    ado0022LOCATION: TStringField;
    ado0022TAX_2: TBCDField;
    ado0022ship_DATE: TDateTimeField;
    ado0022DELIVER_NUMBER: TStringField;
    ado0022BARCODE_ID: TStringField;
    ado0022SUPPLIER2: TStringField;
    ado0022rohs: TStringField;
    ado0022EXPIRE_DATE: TDateTimeField;
    ado0022CODE: TStringField;
    BitBtn5: TBitBtn;
    ado0022DSDesigner3: TBCDField;
    ado0022DSDesigner: TBCDField;
    ado0022DSDesigner2: TBCDField;
    ado0022DSDesigner4: TBCDField;
    Edit4: TEdit;
    Label4: TLabel;
    ado0022DSDesigner5: TFloatField;
    PopupMenu1: TPopupMenu;
    ado0022GROUP_DESC: TStringField;
    ado0022DSDesigner6: TFloatField;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ado0022cust_decl: TStringField;
    ado0022v_type: TStringField;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn2: TBitBtn;
    ado0022TAX_ID_NUMBER: TStringField;
    ado0022reason: TStringField;
    ado0022po_emplname: TStringField;
    ado0022spec_place: TStringField;
    ADOQuery1: TADOQuery;
    ado0022rkey16: TAutoIncField;
    ado0022IQC: TStringField;
    ado0022IQC2: TDateTimeField;
    ado0022QUAN_RTNED_FM_FACT: TFloatField;
    ado0022GLPTR_STATUS: TBooleanField;
    ado0022strstatus: TStringField;
    ado0022IQCstatus: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn5Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure CopyDbDataToExcel(Args:array of const);
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
   PreColumn: TColumn;
   field_name:string;
    procedure item_click(sender:TObject);
  public
    { Public declarations }
   stardate,enddate:string;  
  end;

var
  Form2: TForm2;

implementation
uses  main, invt_report;
{$R *.dfm}

procedure Tform2.CopyDbDataToExcel(Args:array of const);
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
   if not TDBGrid(Args[I].VObject).DataSource.DataSet.Active then
    begin
     Screen.Cursor := crDefault;
     Exit;
    end;
   TDBGrid(Args[I].VObject).DataSource.DataSet.DisableControls;
   TDBGrid(Args[I].VObject).DataSource.DataSet.first;

   v_cloumn:=0;
   for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
    if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
     Sheet.Cells[1, iCount + 1 - v_cloumn] :=
     TDBGrid(Args[I].VObject).Columns.Items[iCount].Title.Caption
    else
     inc(v_cloumn);

   jCount := 1;
   while not TDBGrid(Args[I].VObject).DataSource.DataSet.Eof do
   begin
     v_cloumn:=0;
     for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
      if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
       Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
       TDBGrid(Args[I].VObject).Columns.Items[iCount].Field.AsString
      else
       inc(v_cloumn);
     Inc(jCount);
     TDBGrid(Args[I].VObject).DataSource.DataSet.Next;
   end;

   XlApp.Visible := True;
   TDBGrid(Args[I].VObject).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
 form1.show;
 close;
end;

procedure TForm2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ado0022.SQL.Text);
   if (key=40) and        //如果是下箭头如果是最后一条记录
  (ado0022.RecNo=ado0022.RecordCount) then abort;
 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录
end;

procedure TForm2.Button3Click(Sender: TObject);
begin

 PopupMenu2.Popup(Mouse.CursorPos.X,Mouse.CursorPos.y);
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
 CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 field_name:='INV_PART_NUMBER';
end;

procedure TForm2.Edit3Change(Sender: TObject);
begin
if trim(edit3.Text)<>'' then
 Ado0022.Filter := field_name+' like ''%'+Trim(Edit3.Text)+'%'''
else
 ado0022.Filter := '';
end;

procedure TForm2.DBGrid1TitleClick(Column: TColumn);
begin
// if (column.Field.DataType in [ftString,ftWideString]) and
//    (column.FieldName<>field_name) then
// begin
//  field_name:=column.FieldName;
//  label3.Caption := column.Title.Caption;
//  edit3.SetFocus;
//  ado0022.Sort:=column.FieldName+' ASC';

  ado0022.Sort:=Column.FieldName;
  if (column.ReadOnly) and (field_name<>column.FieldName) then
  begin
    label3.Caption:=column.Title.Caption;
    self.field_name:=column.FieldName;
    edit3.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
    edit3.SetFocus;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm2.N9Click(Sender: TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TForm2.item_click(sender: TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TForm2.FormActivate(Sender: TObject);
var
 i:byte;
 item:TMenuItem;
begin
  for i:=0 to dbgrid1.FieldCount-1 do
  begin
   item:=TmenuItem.Create(self);
   item.Caption:=dbgrid1.Columns[i].Title.Caption;
   if dbgrid1.Columns[i].Visible then
    item.Checked:=true;
   item.OnClick:=item_click;
   self.PopupMenu1.Items.Add(item);
  end;
  if form2.PopupMenu1.Tag<=2 then
  begin
    for i:=12 to 18 do self.PopupMenu1.Items[i].Enabled:=false;
  end;
end;

procedure TForm2.N1Click(Sender: TObject);
begin
 try
  Form_report:=TForm_report.Create(Application);
  Form_report.ppReport2.Reset;
  Form_report.ppReport2.Template.FileName:=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'received_inventory.rtm';
  Form_report.ppReport2.Template.LoadFromFile;
  Form_report.ppReport2.SaveAsTemplate:=True;
  Form_report.ppDesigner2.ShowModal;
 finally
   Form_report.Free;
 end;
end;

procedure TForm2.N2Click(Sender: TObject);
begin
 try
  form_report := tform_report.Create(application);
  ado0022.DisableControls;       //切断与DBgrid控件的联系加快显示速度

  Form_report.ppReport2.Reset;
  Form_report.ppReport2.Template.FileName:=
      stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'received_inventory.rtm';
  Form_report.ppReport2.Template.LoadFromFile;
  Form_report.ppReport2.SaveAsTemplate:=False;
  Form_report.ppLabel18.Caption:=self.stardate;
  Form_report.ppLabel19.Caption:=self.enddate;
  form_report.ppReport2.Print;
  ado0022.EnableControls;
 finally
  form_report.free;
 end;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  if form2.PopupMenu1.Tag=4 then
  begin
    Self.ado0022cust_decl.ReadOnly:=False;
    Self.ado0022spec_place.ReadOnly:=False;
  end;
    field_name:=DBGrid1.Columns[0].FieldName;
    PreColumn:=DBGrid1.Columns[0];
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
     if MessageBox(Handle,'确定导出EXCEL表吗?','提示',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2)=IDNO	then exit;
     CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
 {try
  form_report := tform_report.Create(application);
  ado0022.DisableControls;       //切断与DBgrid控件的联系加快显示速度
  form_report.ppReport2.Print;
  ado0022.EnableControls;
 finally
  form_report.free;
 end;}
 PopupMenu2.Popup(Mouse.CursorPos.X,Mouse.CursorPos.y);
end;

procedure TForm2.DBGrid1CellClick(Column: TColumn);
begin
  if Trim(ado0022rkey16.AsString)<>'' then
  begin
    with ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select rkey,location,rkey_16 from data0176 where rkey_16='+ado0022rkey16.AsString);
      Open;
      DBGrid1.Columns[32].PickList.Clear;
      if not IsEmpty then
      begin
        while not Eof do
        begin
          DBGrid1.Columns[32].PickList.Add(FieldValues['location']);
          Next;
        end;
      end;
    end;
  end;
end;

end.
