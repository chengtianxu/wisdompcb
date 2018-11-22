unit SelectAll;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, ADODB,ComObj, Excel2000,ClipBrd,
  Menus, Buttons;

type
  TForm_SelectAll = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit3: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    BitBtn5: TBitBtn;
    ADOQuery1INV_PART_NUMBER: TStringField;
    ADOQuery1INV_NAME: TStringField;
    ADOQuery1INV_DESCRIPTION: TStringField;
    ADOQuery1GROUP_NAME: TStringField;
    ADOQuery1code23: TStringField;
    ADOQuery1QUAN_ON_HAND: TBCDField;
    ADOQuery1CURR_CODE: TStringField;
    ADOQuery1tax_price: TBCDField;
    ADOQuery1LOCATION: TStringField;
    ADOQuery1UNIT_NAME: TStringField;
    ADOQuery1EXPIRE_DATE: TDateTimeField;
    ADOQuery1BARCODE_ID: TStringField;
    ADOQuery1TAX_2: TBCDField;
    ADOQuery1GRN_NUMBER: TStringField;
    ADOQuery1WAREHOUSE_CODE: TStringField;
    ADOQuery1ship_DATE: TDateTimeField;
    ADOQuery1rohs: TStringField;
    ADOQuery1SUPPLIER2: TStringField;
    ADOQuery1exch_rate: TBCDField;
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
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    ADOQuery1inv_group_name: TStringField;
    N18: TMenuItem;
    N19: TMenuItem;
    procedure CopyDbDataToExcel(Args:array of const);
    procedure Button2Click(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
  public
    { Public declarations }
  end;

var
  Form_SelectAll: TForm_SelectAll;

implementation

uses demo;

{$R *.dfm}

procedure TForm_SelectAll.CopyDbDataToExcel(Args:array of const);
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

procedure TForm_SelectAll.Button2Click(Sender: TObject);
begin
CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm_SelectAll.Edit3Change(Sender: TObject);
begin
if trim(edit3.Text)<>'' then
 adoquery1.Filter := field_name+' like ''%'+Trim(Edit3.Text)+'%'''
else
 adoquery1.Filter := '';
end;

procedure TForm_SelectAll.Button1Click(Sender: TObject);
begin
close;
end;

procedure TForm_SelectAll.FormCreate(Sender: TObject);
begin
field_name:='INV_PART_NUMBER';
end;

procedure TForm_SelectAll.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text);
end;

procedure TForm_SelectAll.DBGrid1TitleClick(Column: TColumn);
begin
 if (column.ReadOnly) and
    (column.FieldName<>field_name) then
 begin
  field_name:=column.FieldName;
  label3.Caption := column.Title.Caption;
  edit3.SetFocus;
  adoquery1.Sort:=column.FieldName+' ASC';
 end;
end;

procedure TForm_SelectAll.BitBtn5Click(Sender: TObject);
begin
popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm_SelectAll.N1Click(Sender: TObject);
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

end.
