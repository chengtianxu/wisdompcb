unit received_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ExtCtrls, Grids, DBGrids, StdCtrls, ComCtrls,ComObj,
  Excel2000,ClipBrd;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dtpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    ADOQuery1GRN_NUMBER: TStringField;
    ADOQuery1DELIVER_NUMBER: TStringField;
    ADOQuery1INV_PART_NUMBER: TStringField;
    ADOQuery1INV_NAME: TStringField;
    ADOQuery1INV_DESCRIPTION: TStringField;
    ADOQuery1QUANTITY: TBCDField;
    ADOQuery1PRICE: TBCDField;
    ADOQuery1TAX_2: TBCDField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1abbr_warehouse: TStringField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    ADOQuery1ship_DATE: TDateTimeField;
    ADOQuery1CURR_NAME: TStringField;
    ADOQuery1EXCHANGE_RATE: TBCDField;
    ADOQuery1BARCODE_ID: TStringField;
    ADOQuery1EXPIRE_DATE: TDateTimeField;
    ADOQuery1TTYPE: TWordField;
    ADOQuery1PO_NUMBER: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure dtpk1Exit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
   field_name:string;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses data_module, main;

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
begin
dtpk1.Date:=form1.dtpk1.Date;
dtpk2.Date:=form1.DTPk2.Date;
self.ADOQuery1.Close;
self.ADOQuery1.Parameters[0].Value:=dtpk1.Date;
self.ADOQuery1.Parameters[1].Value:=dtpk2.Date+1;
self.ADOQuery1.Open;
field_name:='GRN_NUMBER';
end;

procedure TForm3.Edit1Change(Sender: TObject);
begin
 if trim(edit1.Text)<>'' then
  adoquery1.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  adoquery1.Filter:='';
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

procedure TForm3.dtpk1Exit(Sender: TObject);
begin
self.ADOQuery1.Close;
self.ADOQuery1.Parameters[0].Value:=dtpk1.Date;
self.ADOQuery1.Parameters[1].Value:=dtpk2.Date+1;
self.ADOQuery1.Open;
end;

procedure TForm3.Button2Click(Sender: TObject);
var
   bm: TBookmark;
   col, row: Integer;
   sline: String;
   mem: TStringList;
   ExcelApp: Variant;
begin
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
      sline := sline + DBGrid1.Fields[col].DisplayLabel + #9;
    mem.Add(sline);

    // get the data into the memo
    for row := 0 to DBGrid1.DataSource.DataSet.RecordCount-1 do
     begin
      sline := '';
      for col := 0 to DBGrid1.FieldCount-1 do
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

end.
