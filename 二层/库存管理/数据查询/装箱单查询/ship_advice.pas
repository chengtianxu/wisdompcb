unit ship_advice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, ExtCtrls,ComObj,Excel2000,ClipBrd,
  Buttons;

type
  TForm3 = class(TForm)
    ADO530: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADO530delivery_no: TStringField;
    ADO530invoice_number: TStringField;
    ADO530CUST_CODE: TStringField;
    ADO530cartons_no: TIntegerField;
    ADO530charge: TFloatField;
    ADO530MAWB_NO: TStringField;
    ADO530HAWB_NO: TStringField;
    ADO530FLIGHT_NO: TStringField;
    ADO530DEPA_DATE: TDateTimeField;
    ADO530SALES_ORDER: TStringField;
    ADO530SHIPMENT_NO: TSmallintField;
    ADO530PO_NUMBER: TStringField;
    ADO530PO_DATE: TDateTimeField;
    ADO530part_price: TFloatField;
    ADO530amount: TFloatField;
    Panel1: TPanel;
    ADO530QUAN_SHIPPED: TIntegerField;
    ADO530shipadvice_no: TStringField;
    ADO530ATTN: TStringField;
    ADO530ATTN1: TStringField;
    ADO530ATTN_CC: TStringField;
    ADO530ADV_FROM: TStringField;
    ADO530ADV_FROM_CC: TStringField;
    ADO530SHIP_FROM: TStringField;
    ADO530TO_PORT: TStringField;
    ADO530FAX_NO: TStringField;
    ADO530SHIP_TO_PHONE: TStringField;
    ADO530FAX_TO: TStringField;
    ADO530MANU_PART_NUMBER: TStringField;
    ADO530TDATE: TDateTimeField;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
uses main,  report_pk,common;
{$R *.dfm}

procedure TForm3.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ado530.SQL.Text);
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
form1.Show;
close;
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
form1.Show;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
try
 form_report:=tform_report.Create(application);
 {应增加程序判断用户的权限是否可以显示价格字段}
  if strtoint(vprev)<=2 then       //权限
   begin
    form_report.ppDBText29.Visible:=false;
    form_report.ppDBText30.Visible:=false;
   end;
 ado530.DisableControls;
 form_report.ppReport2.Print;
 ado530.EnableControls;
finally
 form_report.free;
end;
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


procedure TForm3.BitBtn1Click(Sender: TObject);
begin
form1.Show;
close;
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
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

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
    try
       form_report:=tform_report.Create(application);
       {应增加程序判断用户的权限是否可以显示价格字段}
        if strtoint(vprev)<=2 then       //权限
         begin
          form_report.ppDBText29.Visible:=false;
          form_report.ppDBText30.Visible:=false;
         end;
       ado530.DisableControls;
       form_report.ppReport2.Print;
       ado530.EnableControls;
    finally
        form_report.free;
    end;
end;

end.
