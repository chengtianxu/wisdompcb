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
    Excel1: TMenuItem;
    procedure N4Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Excel1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
   v_colwidth: array[0..7] of integer;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd(var Message: TMessage);
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses damo, Employee_search, supplier_search, REPORT_r;

{$R *.dfm}
procedure tform3.NewGridWnd(var Message: TMessage);
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

procedure TForm3.N4Click(Sender: TObject);
begin
 close;
end;

procedure TForm3.N8Click(Sender: TObject);
var
 i:byte;
begin
 try
  dm.aq0493.Open;
  form_report:=tform_report.Create(application);
 with dm.ADO2211 do
  begin
   active:=false;
   Parameters[2].Value := dm.adoquery2rkey.Value;
   active:=true;
   if not isempty then
    for i:=1 to 4 do
     form_report.QRMemo1.Lines.Add(fieldbyname('note_pad_line_'+inttostr(i)).AsString);
   close;
  end;
  form_report.QRMemo2.Lines.Add(dm.ADoquery2BILLING_ADDRESS_1.Value);
  form_report.QRDBText2.DataSet:=dm.adoquery2;
  form_report.QRDBText3.DataSet:=dm.adoquery2;
  form_report.QRDBText4.DataSet:=dm.adoquery2;
  form_report.QRDBText5.DataSet:=dm.adoquery2;
  form_report.QRDBText6.DataSet:=dm.adoquery2;
  form_report.QRDBText7.DataSet:=dm.adoquery2;
  form_report.QRDBText8.DataSet:=dm.adoquery2;
  form_report.QRDBText9.DataSet:=dm.adoquery2;
  form_report.QRDBText10.DataSet:=dm.adoquery2;
  form_report.QRDBText11.DataSet:=dm.adoquery2;
  form_report.QRDBText12.DataSet:=dm.adoquery2;
  form_report.QRDBText13.DataSet:=dm.adoquery2;
  form_report.QRDBText14.DataSet:=dm.adoquery2;
  form_report.QRDBText15.DataSet:=dm.adoquery2;  
  form_report.QRLabel12.Caption := dm.adoquery2SHIPPING_METHOD.Value;  //装运方法
  form_report.QRLabel13.Caption := dm.adoquery2REFERENCE_NUMBER.Value;       //参考号码
  form_report.QRLabel19.Caption:= dm.ADOQuery2QUANTITY.AsString;
  form_report.QRLabel29.Caption := formatfloat('0.000',dm.ADOQuery2QUANTITY.Value*dm.ADOQuery2UNIT_PRICE.Value);
  form_report.QuickRep1.Preview;
 finally
  form_report.free;
 end;
end;

procedure TForm3.N5Click(Sender: TObject);
begin
form_supp:=tform_supp.Create(application);
if form_supp.ShowModal=mrok then
 dm.adoquery2.Filter := 'code like '''+trim(form_supp.ADOQuery1CODE.AsString)+'%''';
form_supp.Free;
end;

procedure TForm3.N6Click(Sender: TObject);
var
 str:string;
begin
 str:='';
 if inputquery('物品名称过滤','请输入要过滤的物品名称:            ',str) then
  if trim(str)<>'' then
   dm.adoquery2.Filter := 'DESCRIPTION like '''+trim(str)+'%'''
  else
   dm.adoquery2.Filter := '';
end;

procedure TForm3.N7Click(Sender: TObject);
begin
frmempl:=tfrmempl.Create(application);
if frmempl.ShowModal=mrok then
 dm.adoquery2.Filter := 'employee_name like '''+trim(frmempl.ADOQuery1employee_name.Value)+'%''';
frmempl.Free;
end;

procedure TForm3.N9Click(Sender: TObject);
begin
 dm.adoquery2.Filter := '';
end;

procedure TForm3.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  begin
   showmessage(dm.adoquery2.sql.Text);
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

procedure TForm3.FormShow(Sender: TObject);
var
 i:byte;
begin
 for i:=0 to 7 do self.v_colwidth[i]:=dbgrid1.Columns[i].Width;
end;

procedure TForm3.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=0 to 7 do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-848)*v_colwidth[i]/820);
end;
procedure TForm3.FormCreate(Sender: TObject);
begin
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;  
end;

end.
