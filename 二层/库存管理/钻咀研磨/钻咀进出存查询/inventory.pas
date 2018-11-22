unit inventory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, ADODB,ComObj, Excel2000,ClipBrd,
  Menus, Buttons, Math;

type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ado0022: TADOQuery;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Label1: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    BitBtn5: TBitBtn;
    PopupMenu2: TPopupMenu;
    ado0022GRN_NUMBER: TStringField;
    ado0022CREATE_DATE: TDateTimeField;
    ado0022SYSTEM_DATE: TDateTimeField;
    ado0022EMPL_CODE: TStringField;
    ado0022EMPLOYEE_NAME: TStringField;
    ado0022handle_name: TStringField;
    ado0022REMARK219: TStringField;
    ado0022INV_PART_NUMBER: TStringField;
    ado0022INV_PART_DESCRIPTION: TStringField;
    ado0022CODE: TStringField;
    ado0022SUPPLIER_NAME: TStringField;
    ado0022ABBR_NAME: TStringField;
    ado0022LOCATION_CODE: TStringField;
    ado0022LOCATION_NAME: TStringField;
    ado0022OH_degree: TWordField;
    ado0022QUANTITY: TIntegerField;
    ado0022QUAN_ON_HAND: TIntegerField;
    ado0022QUAN_ALLOC: TIntegerField;
    ado0022REMARK220: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn5Click(Sender: TObject);
    procedure NClick(Sender: TObject);
    procedure CopyDbDataToExcel(Args:array of const);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
  public
    { Public declarations }
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
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 form1.Show;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
 try
  form_report := tform_report.Create(application);
  ado0022.DisableControls;       //切断与DBgrid控件的联系加快显示速度
  form_report.ppReport2.Print;
  ado0022.EnableControls;
 finally
  form_report.free;
 end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
 CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  field_name:='GRN_NUMBER';
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
  edit3.Text:='';
  if (column.ReadOnly) and (column.FieldName<>field_name) then
  begin
    field_name:=column.FieldName;
    label3.Caption := column.Title.Caption;
    edit3.SetFocus;
    ado0022.Sort:=column.FieldName+' ASC';
  end;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm2.NClick(Sender: TObject);
var
 i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  for i:=0 to dbgrid1.FieldCount-1 do
    if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
    begin
      dbgrid1.Columns[i].Visible:=(sender as tmenuItem).Checked;
      break;
    end;
end;

procedure TForm2.FormActivate(Sender: TObject);
var
 i:byte;
 item:TMenuItem;
begin
  for i:=1 to dbgrid1.FieldCount do
  begin
    item:=TmenuItem.Create(self);
    item.Caption:=dbgrid1.Columns[i-1].Title.Caption;
    if dbgrid1.Columns[i-1].Visible then
      item.Checked:=true;
    item.OnClick:=NClick;
    PopupMenu2.Items.Add(item);
  end;
end;

end.
