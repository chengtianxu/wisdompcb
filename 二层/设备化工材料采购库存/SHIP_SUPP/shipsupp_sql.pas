unit shipsupp_sql;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Menus, StdCtrls,ComObj, Excel2000, DB, ADODB;

type
  TForm3 = class(TForm)
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    PopupMenu1: TPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    Memo1: TMemo;
    Excel1: TMenuItem;
    N10: TMenuItem;
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Excel1Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses damo, report_r, Employee_search, supplier_search, SCORE_DATE;

{$R *.dfm}

procedure TForm3.N4Click(Sender: TObject);
begin
 close;
end;

procedure TForm3.N5Click(Sender: TObject);
begin
form_supp:=tform_supp.Create(application);
if form_supp.ShowModal=mrok then
 dm.ADOStoredProc1.Filter := 'code like '''+trim(form_supp.ADOQuery1CODE.AsString)+'%''';
form_supp.Free;
end;

procedure TForm3.N6Click(Sender: TObject);
var
 str:string;
begin
 str:='';
 if inputquery('材料名称过滤','请输入要过滤的材料名称:            ',str) then
  if trim(str)<>'' then
   dm.ADOStoredProc1.Filter := 'inv_part_number like '''+trim(str)+'%'''
  else
   dm.ADOStoredProc1.Filter := '';
end;

procedure TForm3.N7Click(Sender: TObject);
begin
frmempl:=tfrmempl.Create(application);
if frmempl.ShowModal=mrok then
 dm.ADOStoredProc1.Filter := 'employee_name like '''+trim(frmempl.ADOQuery1employee_name.Value)+'%''';
frmempl.Free;
end;

procedure TForm3.N9Click(Sender: TObject);
begin
 dm.ADOStoredProc1.Filter := '';
end;

procedure TForm3.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  begin
   showmessage(memo1.Text);
   memo1.SelectAll;
   memo1.CopyToClipboard;
  end;
end;

procedure TForm3.Excel1Click(Sender: TObject);
 var
   bm: TBookmark;
   col, row: Integer;
   sline: String;
   mem: TMemo;
   ExcelApp: Variant;
 begin
    if dbgrid1.DataSource.DataSet.IsEmpty then exit;
    Screen.Cursor := crHourglass;
    DBGrid1.DataSource.DataSet.DisableControls;
    bm := DBGrid1.DataSource.DataSet.GetBookmark;
    DBGrid1.DataSource.DataSet.First;

    // create the Excel object
     ExcelApp := CreateOleObject('Excel.Application');
     ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
     ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;
    // ExcelApp.workbooks[1].worksheets[1].Columns.ColumnWidth :=19;
    // First we send the data to a memo 可以设置宽度
    // works faster than doing it directly to Excel
    mem := TMemo.Create(Self);
    mem.Visible := false;
    mem.Parent := Form3;
    mem.Clear;
    sline := '';

    // add the info for the column names
    for col := 0 to DBGrid1.FieldCount-1 do
     sline := sline + DBGrid1.Columns[col].Title.Caption + #9;
    mem.Lines.Add(sline);

    // get the data into the memo
    for row := 0 to DBGrid1.DataSource.DataSet.RecordCount-1 do
     begin
      sline := '';
      for col := 0 to DBGrid1.FieldCount-1 do
        sline := sline + DBGrid1.Fields[col].AsString + #9;
      mem.Lines.Add(sline);
      DBGrid1.DataSource.DataSet.Next;
     end;

    // we copy the data to the clipboard
    mem.SelectAll;
    mem.CopyToClipboard;

    // if needed, send it to Excel
    // if not, we already have it in the clipboard
      ExcelApp.Workbooks[1].WorkSheets[Caption].Paste;
      ExcelApp.Visible := true;
    FreeAndNil(mem);
   // FreeAndNil(ExcelApp);
    DBGrid1.DataSource.DataSet.GotoBookmark(bm);
    DBGrid1.DataSource.DataSet.FreeBookmark(bm);
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;

procedure TForm3.N8Click(Sender: TObject);
begin
 try
  form_report:=tform_report.Create(application);
  form_report.ADO22.Close;
  form_report.ADO22.Parameters[0].Value:=dm.ADOStoredProc1rkey.Value;
  form_report.ADO22.Open;
  form_report.ADO95.Close;
  form_report.ADO95.Parameters[0].Value:=dm.adostoredproc1rkey95.value;
  form_report.ADO95.Open;
  with dm.ADO2211 do
   begin
    active:=false;
    Parameters[2].Value := dm.ADOStoredProc1rkey.Value;
    active:=true;
   end;
   
  form_report.ppReport1.Print;
 finally
  form_report.free;
 end;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dm.ADOStoredProc1.Close;
end;

procedure TForm3.N10Click(Sender: TObject);
begin
 form_date:=tform_date.Create(application);
 form_date.DateTimePicker1.Date:=dm.ADOStoredProc1.Parameters[1].Value;
 form_date.DateTimePicker2.Date:=dm.ADOStoredProc1.Parameters[2].Value-1;
 if form_date.ShowModal=mrok then
  begin
    dm.ADOStoredProc1.Close;
    dm.ADOStoredProc1.Parameters.ParamValues['@star_date']:=
        form_date.DateTimePicker1.Date;
    dm.ADOStoredProc1.Parameters.ParamValues['@end_date']:=
        form_date.DateTimePicker2.Date+1;
    dm.ADOStoredProc1.Open;
  end;
 form_date.Free;
end;

end.
