unit SelectOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, ADODB,ComObj, Excel2000,ClipBrd,
  Menus, Buttons;

type
  TForm_SelectOut = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit3: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1GON_NUMBER: TStringField;
    ADOQuery1DSDesigner: TStringField;
    ADOQuery1INV_PART_NUMBER: TStringField;
    ADOQuery1INV_NAME: TStringField;
    ADOQuery1INV_DESCRIPTION: TStringField;
    ADOQuery1GROUP_NAME: TStringField;
    ADOQuery1QUANTITY: TBCDField;
    ADOQuery1rtn_quantity: TBCDField;
    ADOQuery1ref_number: TStringField;
    ADOQuery1CURR_CODE: TStringField;
    ADOQuery1BARCODE_ID: TStringField;
    ADOQuery1inv_group_name: TStringField;
    ADOQuery1TAX_2: TBCDField;
    ADOQuery1tax_price: TBCDField;
    ADOQuery1SUPPLIER2: TStringField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1UNIT_NAME: TStringField;
    ADOQuery1create_date: TDateTimeField;
    ADOQuery1rohs: TStringField;
    ADOQuery1GRN_NUMBER: TStringField;
    ADOQuery1DSDesigner2: TStringField;
    ADOQuery1DSDesigner3: TStringField;
    ADOQuery1LOCATION: TStringField;
    BitBtn5: TBitBtn;
    ADOQuery1DSDesigner4: TStringField;
    ADOQuery1code: TStringField;
    ADOQuery1po_number: TStringField;
    PopupMenu1: TPopupMenu;
    ADOQuery1Price: TBCDField;
    ADOQuery1DSDesigner5: TBCDField;
    ADOQuery1DSDesigner6: TBCDField;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    ADOQuery1workhour_abbr: TStringField;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button2Click(Sender: TObject);
    procedure CopyDbDataToExcel(Args:array of const);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    field_name:string;
    procedure item_click(sender:TObject); 
  public
    { Public declarations }
  end;

var
  Form_SelectOut: TForm_SelectOut;

implementation

uses demo;

{$R *.dfm}

procedure TForm_SelectOut.Button1Click(Sender: TObject);
begin
close;
end;

procedure TForm_SelectOut.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text);
end;

procedure TForm_SelectOut.FormCreate(Sender: TObject);
begin
field_name:='GON_NUMBER';
end;

procedure TForm_SelectOut.Edit3Change(Sender: TObject);
begin
if trim(edit3.Text)<>'' then
adoquery1.Filter := field_name+' like ''%'+Trim(Edit3.Text)+'%'''
else
adoquery1.Filter := '';
end;

procedure TForm_SelectOut.DBGrid1TitleClick(Column: TColumn);
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

procedure Tform_Selectout.CopyDbDataToExcel(Args:array of const);
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


procedure TForm_SelectOut.Button2Click(Sender: TObject);
begin
 CopyDbDataToExcel([dbgrid1]);
end;
procedure TForm_SelectOut.item_click(Sender: TObject);
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

procedure TForm_SelectOut.BitBtn5Click(Sender: TObject);
begin
popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm_SelectOut.FormActivate(Sender: TObject);
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
   item.OnClick:=self.item_click;
   self.PopupMenu1.Items.Add(item);
  end;
  if form_Selectout.PopupMenu1.tag<=2 then
  begin
    for i:=13 to 17 do self.PopupMenu1.Items[i].Enabled:=false;
  end;

end;
end.
