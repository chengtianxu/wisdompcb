unit inv_minxi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls,ComObj, Excel2000, ClipBrd;

type
  TForm9 = class(TForm)
    Panel1: TPanel;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit3: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ado0022: TADOQuery;
    ado0022INV_PART_NUMBER: TStringField;
    ado0022GROUP_NAME: TStringField;
    ado0022WAREHOUSE_CODE: TStringField;
    ado0022code23: TStringField;
    ado0022QUAN_ON_HAND: TFloatField;
    ado0022CURR_CODE: TStringField;
    ado0022PRICE: TFloatField;
    ado0022LOCATION: TStringField;
    ado0022UNIT_NAME: TStringField;
    ado0022EXPIRE_DATE: TDateTimeField;
    ado0022INV_DESCRIPTION: TStringField;
    ado0022inv_name: TStringField;
    ado0022PO_REV_NO: TStringField;
    ado0022GRN_NUMBER: TStringField;
    ado0022BARCODE_ID: TStringField;
    ado0022ship_DATE: TDateTimeField;
    ado0022tax_2: TBCDField;
    ado0022EXCHANGE_RATE: TBCDField;
    ado0022notax_price: TBCDField;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    field_name:string;    
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses main;

{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
begin
 close;
end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//self.ado0022.UpdateBatch();
 form1.Show;
end;

procedure TForm9.Button2Click(Sender: TObject);
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
     if DBGrid1.Columns[col].Visible = true then
      sline := sline + DBGrid1.Fields[col].DisplayLabel + #9;
    mem.Add(sline);

    // get the data into the memo
    for row := 0 to DBGrid1.DataSource.DataSet.RecordCount-1 do
    begin
      sline := '';
      for col := 0 to DBGrid1.FieldCount-1 do
       if DBGrid1.Columns[col].Visible = true then
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

procedure TForm9.FormCreate(Sender: TObject);
begin
field_name:='INV_PART_NUMBER';
end;

procedure TForm9.Edit3Change(Sender: TObject);
begin
if (trim(edit3.Text)<>'') then
 Ado0022.Filter := field_name+' like ''%'+Trim(Edit3.Text)+'%'''
else
 self.ado0022.filter := '';
end;

procedure TForm9.DBGrid1TitleClick(Column: TColumn);
begin
 if (column.ReadOnly=true) and
    (column.FieldName<>field_name) then
 begin
  field_name:=column.FieldName;
  label3.Caption := column.Title.Caption;
  edit3.SetFocus;
  self.ado0022.Sort:= column.FieldName;

 end;
end;

procedure TForm9.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ado0022.SQL.Text);
 if (ssCtrl in shift) and (key=46) then  abort;
 if (ssAlt in shift) and (key=45) then abort;
end;

end.
