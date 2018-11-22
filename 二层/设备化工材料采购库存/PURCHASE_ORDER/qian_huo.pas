unit qian_huo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ADODB, Grids, DBGrids,ComObj, Excel2000,
  ClipBrd;

type
  TForm21 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    ADOQuery1INV_NAME: TStringField;
    ADOQuery1INV_DESCRIPTION: TStringField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1PO_NUMBER: TStringField;
    ADOQuery1REQ_DATE: TDateTimeField;
    ADOQuery1QUAN_ORD: TFloatField;
    ADOQuery1QUAN_RECD: TFloatField;
    ADOQuery1quan_qh: TFloatField;
    ADOQuery1UNIT_NAME: TStringField;
    ADOQuery1PO_TYPE: TStringField;
    ADOQuery1INV_PART_NUMBER: TStringField;
    ADOQuery1PO_REV_NO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }

   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd(var Message: TMessage);
  public
    { Public declarations }
  end;

var
  Form21: TForm21;

implementation

uses damo;

{$R *.dfm}
procedure TForm21.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
  begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
    dbgrid1.DataSource.DataSet.MoveBy(1)
   else
    dbgrid1.DataSource.DataSet.MoveBy(-1)
  end
 else
  begin
   OldGridWnd(Message);
  end;
end;

procedure TForm21.FormCreate(Sender: TObject);
begin
adoquery1.Open;

field_name:=dbgrid1.Columns[1].FieldName;
adoquery1.Sort:= field_name;
DateSeparator := '-';
ShortDateFormat := 'yyyy-mm-dd';
OldGridWnd := DBGrid1.WindowProc;
DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm21.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (field_name<>column.FieldName) then
adoquery1.Sort:= column.FieldName;

if (column.ReadOnly=true) and (field_name<>column.FieldName) then
 begin
  for i:=0 to dbgrid1.Columns.Count-1 do
   dbgrid1.Columns[i].Title.Color:=clBtnface;
  column.Title.Color:=clRed;
  field_name:=column.FieldName;
  label1.Caption:=column.Title.Caption;
  edit1.SetFocus;
 end;
end;

procedure TForm21.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  adoquery1.Filter := self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  adoquery1.Filter := '';
end;

procedure TForm21.Button2Click(Sender: TObject);
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
    mem.Clear;
    sline := '';

    // add the info for the column names
    for col := 0 to DBGrid1.FieldCount-1 do
     sline := sline + DBGrid1.Columns[col].Title.Caption + #9;
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
