unit mature_invoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, ExtCtrls, Menus, Buttons, StdCtrls,
  ComObj,Excel2000,ClipBrd;

type
  TForm3 = class(TForm)
    Aq107: TADOQuery;
    DataSource1: TDataSource;
    Aq107INVOICE_NO: TStringField;
    Aq107CODE: TStringField;
    Aq107ABBR_NAME: TStringField;
    Aq107SUPPLIER_NAME: TStringField;
    Aq107CURR_NAME: TStringField;
    Aq107INV_TP: TWordField;
    Aq107EMPLOYEE_NAME: TStringField;
    Aq107WAREHOUSE_CODE: TStringField;
    Aq107WAREHOUSE_NAME: TStringField;
    Aq107INV_DATE: TDateTimeField;
    Aq107DUE_DATE: TDateTimeField;
    Aq107tax_invoice_amt: TBCDField;
    Aq107tax_invoice_date: TDateTimeField;
    Aq107tax_invoice_ref: TStringField;
    Aq107INV_TOTAL: TBCDField;
    Aq107pay_amt: TBCDField;
    Aq107EX_RATE: TBCDField;
    Aq107mature_yamt: TBCDField;
    Aq107mature_bamt: TBCDField;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    BitBtn1: TBitBtn;
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
    N18: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
   field_name:string; 
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses datamd;

{$R *.dfm}

procedure TForm3.FormShow(Sender: TObject);
begin
field_name:='INVOICE_NO';     //Éè±¸¹ýÂË×Ö¶Î
end;

procedure TForm3.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;
 end
else
 edit1.SetFocus;
end;


procedure TForm3.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
  aq107.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  aq107.Filter:='';
end;

procedure TForm3.Button2Click(Sender: TObject);
var
   bm: TBookmark;
   col, row: Integer;
   sline: String;
   mem: TStringList;
   ExcelApp: Variant;
begin
  if DBGrid1.DataSource.DataSet.IsEmpty then exit;
    Screen.Cursor := crHourglass;
    DBGrid1.DataSource.DataSet.DisableControls;
    bm := DBGrid1.DataSource.DataSet.GetBookmark;
    DBGrid1.DataSource.DataSet.First;

    // create the Excel object
     ExcelApp := CreateOleObject('Excel.Application');
     ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
     ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;

    // First we send the data to a memo
    // works faster than doing it directly to Excel
    mem := TStringList.Create;
    sline := '';

    // add the info for the column names
    for col := 0 to DBGrid1.FieldCount-1 do
     if dbgrid1.Columns[col].Visible then
      sline := sline + DBGrid1.Fields[col].DisplayLabel + #9;
    mem.Add(sline);

    // get the data into the memo
    for row := 0 to DBGrid1.DataSource.DataSet.RecordCount-1 do
     begin
      sline := '';
      for col := 0 to DBGrid1.FieldCount-1 do
      if dbgrid1.Columns[col].Visible then
        sline := sline + DBGrid1.Fields[col].AsString + #9;
      mem.Add(sline);
      DBGrid1.DataSource.DataSet.Next;
     end;

    // we copy the data to the clipboard
    clipboard.Clear;
    Clipboard.AsText:=mem.Text;

    // if needed, send it to Excel
    // if not, we already have it in the clipboard
    ExcelApp.Workbooks[1].WorkSheets[Caption].Paste;
    ExcelApp.Visible := true;
    mem.Free;
    clipboard.Clear;
  //  FreeAndNil(ExcelApp);
    DBGrid1.DataSource.DataSet.GotoBookmark(bm);
    DBGrid1.DataSource.DataSet.FreeBookmark(bm);
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
self.Aq107.Open;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
 popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm3.N1Click(Sender: TObject);
begin
(sender as tmenuitem).Checked:=not (sender as tmenuitem).Checked;

dbgrid1.Columns[(sender as tmenuitem).Tag].Visible:=(sender as tmenuitem).Checked

end;

procedure TForm3.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(Aq107.SQL.Text);
end;

end.
