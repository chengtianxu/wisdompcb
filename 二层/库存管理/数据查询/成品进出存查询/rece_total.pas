unit rece_total;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Grids, DBGrids, ExtCtrls,ComObj,Excel2000,ClipBrd,
  Buttons, DBGridEh;

type
  TForm6 = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1rece_total: TFloatField;
    ADOQuery1PROD_CODE: TStringField;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    ADOQuery1so_mianqi: TFloatField;
    ADOQuery1in_weight: TFloatField;
    ADOQuery1MANU_PART_NUMBER: TStringField;
    ADOQuery1MANU_PART_DESC: TStringField;
    ADOQuery1analysis_code_2: TStringField;
    ADOQuery1layers: TWordField;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    ADOQuery1SAMPLE_NR: TStringField;
    ADOQuery1total_cost: TFloatField;
    ADOQuery1notax_amout_b: TFloatField;
    ADOQuery1tax_amout_b: TFloatField;
    DBGridEh1: TDBGridEh;
    BitBtn2: TBitBtn;
    ADOQuery1ORIG_CUSTOMER: TStringField;
    ADOQuery1cust_code: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses main,common;

{$R *.dfm}

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form1.Show;
end;

procedure TForm6.Button1Click(Sender: TObject);
begin
 close;
end;

procedure TForm6.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TForm6.BitBtn4Click(Sender: TObject);
var
   bm: TBookmark;
   col, row: Integer;
   sline: String;
   mem: TStringList;
   ExcelApp: Variant;
 begin
    Screen.Cursor := crHourglass;
    DBGrideh1.DataSource.DataSet.DisableControls;
    bm := DBGrideh1.DataSource.DataSet.GetBookmark;
    DBGrideh1.DataSource.DataSet.First;

    // create the Excel object
     ExcelApp := CreateOleObject('Excel.Application');
     ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
     ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;

    // First we send the data to a memo
    // works faster than doing it directly to Excel
    mem := TStringList.Create;
    sline := '';

    // add the info for the column names
    for col := 0 to DBGrideh1.FieldCount-1 do
     sline := sline + DBGrideh1.Fields[col].DisplayLabel + #9;
    mem.Add(sline);

    // get the data into the memo
    for row := 0 to DBGrideh1.DataSource.DataSet.RecordCount-1 do
     begin
      sline := '';
      for col := 0 to DBGrideh1.FieldCount-1 do
       sline := sline + DBGrideh1.Fields[col].AsString + #9;
      mem.Add(sline);
      DBGrideh1.DataSource.DataSet.Next;
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
    DBGrideh1.DataSource.DataSet.GotoBookmark(bm);
    DBGrideh1.DataSource.DataSet.FreeBookmark(bm);
    DBGrideh1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;

procedure TForm6.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text);
end;

procedure TForm6.BitBtn2Click(Sender: TObject);
begin
common.Export_dbGridEH_to_Excel(dbgrideh1,self.Caption);
end;

end.
