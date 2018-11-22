unit standpo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls,ComObj, Excel2000,ClipBrd;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1PO_NUMBER: TStringField;
    ADOQuery1PO_DATE: TDateTimeField;
    ADOQuery1FOB: TStringField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    ADOQuery1INV_PART_NUMBER: TStringField;
    ADOQuery1CODE: TStringField;
    ADOQuery1QUAN_ORD: TFloatField;
    ADOQuery1PRICE: TFloatField;
    ADOQuery1CURR_CODE: TStringField;
    ADOQuery1UNIT_NAME: TStringField;
    ADOQuery1total: TFloatField;
    ADOQuery1STATUS: TWordField;
    ADOQuery1v_status: TStringField;
    ADOQuery1inv_part_description: TStringField;
    ADOQuery1QUAN_RECD: TFloatField;
    ADOQuery1no_recd: TFloatField;
    ADOQuery1PO_REV_NO: TStringField;
    ADOQuery1DATE_EDITED: TDateTimeField;
    ADOQuery1EXPIRED_DATE: TDateTimeField;
    ADOQuery1recd_date: TDateTimeField;
    ADOQuery1req_date: TDateTimeField;
    ADOQuery1ANALYSIS_CODE_2: TStringField;
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses main;

{$R *.dfm}

procedure TForm4.ADOQuery1CalcFields(DataSet: TDataSet);
begin
 case adoquery1status.Value of
  1: adoquery1v_status.Value := '待审核';
  2: adoquery1v_status.Value := '被退回';
  3: adoquery1v_status.Value := '已保留';
  4: adoquery1v_status.Value := '已暂缓';
  5: adoquery1v_status.Value := '已审核';
  6: adoquery1v_status.Value := '已收货';
  7: adoquery1v_status.Value := '已完成';
  8: adoquery1v_status.Value := '未提交';
 end;
end;

procedure TForm4.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
form1.show;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
 form1.show;
 close;
end;

procedure TForm4.Button2Click(Sender: TObject);
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

procedure TForm4.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text);
end;

end.
