unit collect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,  Grids, StdCtrls,mxcommon, Buttons,
  Excel2000, OleServer, DBGrids, DB, ADODB,ComObj,  ComCtrls,
  MXPIVSRC,MXDB, MXGRID, Mxstore, Mxarrays,
  TeEngine, Series, TeeProcs, Chart, ExtDlgs,ClipBrd,Mask, ToolWin;


   //   Mask, ToolWin,


type
  TForm2 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGrid1: TDBGrid;
    DecisionGrid1: TDecisionGrid;
    TabSheet3: TTabSheet;
    ADO102: TADOQuery;
    ADO102ENT_DATE: TDateTimeField;
    ADO102ABBR_NAME: TStringField;
    ADO102jin_e: TFloatField;
    ADO102mianji: TFloatField;
    ADO102pcs: TFloatField;
    ADO60: TADOQuery;
    ADO60ENT_DATE: TDateTimeField;
    ADO60SALES_ORDER: TStringField;
    ADO60CUST_CODE: TStringField;
    ADO60PO_NUMBER: TStringField;
    ADO60ANALYSIS_CODE_1: TStringField;
    ADO60PARTS_ORDERED: TFloatField;
    ADO60PART_PRICE: TFloatField;
    ADO60jin_e: TFloatField;
    ADO60ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ADO60part_c: TWordField;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1jin_e: TFloatField;
    ADOQuery1mianji: TFloatField;
    ADOQuery1pcs: TFloatField;
    Chart1: TChart;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    UpDown1: TUpDown;
    Edit2: TEdit;
    Series1: TBarSeries;
    Label4: TLabel;
    ComboBox2: TComboBox;
    CheckBox1: TCheckBox;
    PrintDialog1: TPrintDialog;
    SavePictureDialog1: TSavePictureDialog;
    DecisionPivot1: TDecisionPivot;
    ADO60MANU_PART_DESC: TStringField;
    ADO60MANU_PART_NUMBER: TStringField;
    ADO64_60: TADOQuery;
    ADO64_60SALES_ORDER: TStringField;
    ADO64_60CUST_CODE: TStringField;
    ADO64_60PO_NUMBER: TStringField;
    ADO64_60ANALYSIS_CODE_1: TStringField;
    ADO64_60PARTS_ORDERED: TIntegerField;
    ADO64_60PART_PRICE: TFloatField;
    ADO64_60ENT_DATE: TDateTimeField;
    ADO64_60jin_e: TFloatField;
    ADO64_60MANU_PART_DESC: TStringField;
    ADO64_60ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ADO64_60part_c: TWordField;
    ADO64_60MANU_PART_NUMBER: TStringField;
    ADO64_102: TADOQuery;
    ADO64_102ent_date: TDateTimeField;
    ADO64_102ABBR_NAME: TStringField;
    ADO64_102jin_e: TFloatField;
    ADO64_102mianji: TFloatField;
    ADO64_102pcs: TIntegerField;
    DecisionCube2: TDecisionCube;
    DecisionSource2: TDecisionSource;
    DecisionCube1: TDecisionCube;
    DecisionSource1: TDecisionSource;
    ADOQuery2: TADOQuery;
    ADOQuery2ABBR_NAME: TStringField;
    ADOQuery2jin_e: TFloatField;
    ADOQuery2mianji: TFloatField;
    ADOQuery2pcs: TIntegerField;
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DecisionGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  end;

var
  Form2: TForm2;
//  function GetAvailableMem: Integer;
implementation

uses damo, main;

{$R *.dfm}
procedure TForm2.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
var
  bm: TBookmark;
  col, row: Integer;
  sline: String;
  mem: TMemo;
  ExcelApp: Variant;
begin
if pagecontrol1.ActivePageIndex=1 then
 begin
   Screen.Cursor := crHourglass;
   bm := DBGrid1.DataSource.DataSet.GetBookmark;
   DBGrid1.DataSource.DataSet.DisableControls;
   DBGrid1.DataSource.DataSet.First;

    // create the Excel object
   ExcelApp := CreateOleObject('Excel.Application');
   ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
   ExcelApp.WorkBooks[1].WorkSheets[1].Name := pagecontrol1.ActivePage.Caption;

    // First we send the data to a memo
    // works faster than doing it directly to Excel
    mem := TMemo.Create(Self);
    mem.Visible := false;
    mem.Parent := Form2;
    mem.Clear;
    sline := '';

    // add the info for the column names
    for col := 0 to DBGrid1.FieldCount-1 do
     sline := sline + DBGrid1.Fields[col].DisplayLabel + #9;
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
    ExcelApp.Workbooks[1].WorkSheets[pagecontrol1.ActivePage.Caption].Paste;
    ExcelApp.Visible := true;
    FreeAndNil(mem);
  //  FreeAndNil(ExcelApp);
    DBGrid1.DataSource.DataSet.GotoBookmark(bm);
    DBGrid1.DataSource.DataSet.FreeBookmark(bm);
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end
 else
 if pagecontrol1.ActivePageIndex=0 then
  begin
   Screen.Cursor := crHourglass;
    // create the Excel object
   ExcelApp := CreateOleObject('Excel.Application');
   ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
   ExcelApp.WorkBooks[1].WorkSheets[1].Name := pagecontrol1.ActivePage.Caption;
    // First we send the data to a memo
    // works faster than doing it directly to Excel
    mem := TMemo.Create(Self);
    mem.Visible := false;
    mem.Parent := Form2;
    mem.Clear;
    sline := '';
    // add the info for the column names
    for col := 0 to decisiongrid1.ColCount-2 do
     sline := sline + decisiongrid1.Cells[col-1,-1] + #9;
    mem.Lines.Add(sline);
    // get the data into the memo
    for row := 0 to decisiongrid1.RowCount-3 do
     begin
      sline := '';
      for col := 0 to decisiongrid1.ColCount-2 do
       sline := sline + decisiongrid1.Cells[col-1,row] + #9;
      mem.Lines.Add(sline);
     end;
    // we copy the data to the clipboard
    mem.SelectAll;
    mem.CopyToClipboard;
// if needed, send it to Excel if not, we already have it in the clipboard
    ExcelApp.Workbooks[1].WorkSheets[pagecontrol1.ActivePage.Caption].Paste;
    ExcelApp.Visible := true;
    FreeAndNil(mem);
  //  FreeAndNil(ExcelApp);
    Screen.Cursor := crDefault;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if form1.ComboBox1.ItemIndex=0 then
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ADO60.SQL.Text)
 else
else
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ADO64_60.SQL.Text)
end;

procedure TForm2.DecisionGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(ADO102.SQL.Text);
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
if form1.ComboBox1.ItemIndex=0 then
 begin
  adoquery1.first;
  adoquery1.DisableControls;
  while not self.adoquery1.Eof do
   begin
    Series1.Add(self.ADOQuery1jin_e.Value,self.ADOQuery1ABBR_NAME.Value);
    adoquery1.Next;
   end;
  adoquery1.first;
  adoquery1.EnableControls;
 end
else
 begin
  adoquery2.first;
  adoquery2.DisableControls;
  while not self.adoquery2.Eof do
   begin
    Series1.Add(self.ADOQuery2jin_e.Value,self.ADOQuery2ABBR_NAME.Value);
    adoquery2.Next;
   end;
  adoquery2.first;
  adoquery2.EnableControls;
 end;

end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
chart1.View3D:=self.CheckBox1.Checked;
end;

procedure TForm2.Edit2Change(Sender: TObject);
begin
self.Chart1.MaxPointsPerPage:=updown1.Position;
end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
begin
chart1.NextPage;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
chart1.PreviousPage;
end;

procedure TForm2.SpeedButton7Click(Sender: TObject);
begin
  IF Chart1.view3doptions.Zoom>1 THEN
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom-2;
end;

procedure TForm2.SpeedButton6Click(Sender: TObject);
begin
  IF Chart1.view3doptions.Zoom<300 THEN
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom+2;
end;

procedure TForm2.SpeedButton4Click(Sender: TObject);
begin
if self.SavePictureDialog1.Execute then
chart1.SaveToBitmapFile(self.SavePictureDialog1.FileName+'.bmp');
end;

procedure TForm2.SpeedButton5Click(Sender: TObject);
begin
if self.PrintDialog1.Execute then
self.Chart1.Print;
end;

procedure TForm2.ComboBox2Change(Sender: TObject);
begin
if form1.ComboBox1.ItemIndex=0 then
case  combobox2.ItemIndex of
 0:
 begin
 series1.Clear;
 adoquery1.DisableControls;
 while not self.adoquery1.Eof do
  begin
   Series1.Add(self.ADOQuery1jin_e.Value,self.ADOQuery1ABBR_NAME.Value);
   adoquery1.Next;
  end;
  adoquery1.first;
  self.Series1.ValueFormat:='0.00';
  chart1.LeftAxis.Title.Caption:=combobox2.Text;
  adoquery1.EnableControls;
 end;
1:
begin
 series1.Clear;
adoquery1.DisableControls;
while not self.adoquery1.Eof do
 begin
  Series1.Add(self.ADOQuery1mianji.Value,self.ADOQuery1ABBR_NAME.Value);
  adoquery1.Next;
 end;
  adoquery1.first;
  self.Series1.ValueFormat:='0.000';
  chart1.LeftAxis.Title.Caption:=combobox2.Text;
  adoquery1.EnableControls;
end;
2:
begin
 series1.Clear;
adoquery1.DisableControls;
while not self.adoquery1.Eof do
 begin
  Series1.Add(self.ADOQuery1pcs.Value,self.ADOQuery1ABBR_NAME.Value);
  adoquery1.Next;
 end;
   adoquery1.first;
   self.Series1.ValueFormat:='0';
   chart1.LeftAxis.Title.Caption:=combobox2.Text;
adoquery1.EnableControls;
end;
end
else
case  combobox2.ItemIndex of
 0:
 begin
  series1.Clear;
  adoquery2.DisableControls;
  while not adoquery2.Eof do
   begin
    Series1.Add(ADOQuery2jin_e.Value,self.ADOQuery2ABBR_NAME.Value);
    adoquery2.Next;
   end;
  adoquery2.first;
  self.Series1.ValueFormat:='0.00';
  chart1.LeftAxis.Title.Caption:=combobox2.Text;
  adoquery2.EnableControls;
 end;
1:
 begin
  series1.Clear;
  adoquery2.DisableControls;
  while not adoquery2.Eof do
  begin
   Series1.Add(ADOQuery2mianji.Value,ADOQuery2ABBR_NAME.Value);
   adoquery2.Next;
  end;
  adoquery2.first;
  self.Series1.ValueFormat:='0.000';
  chart1.LeftAxis.Title.Caption:=combobox2.Text;
  adoquery2.EnableControls;
 end;
2:
begin
 series1.Clear;
 adoquery2.DisableControls;
 while not self.adoquery2.Eof do
 begin
  Series1.Add(self.ADOQuery2pcs.Value,self.ADOQuery2ABBR_NAME.Value);
  adoquery2.Next;
 end;
   adoquery2.first;
   self.Series1.ValueFormat:='0';
   chart1.LeftAxis.Title.Caption:=combobox2.Text;
 adoquery2.EnableControls;
end;
end;

end;

procedure TForm2.PageControl1Change(Sender: TObject);
begin
if pagecontrol1.ActivePageIndex=2 then
begin
 combobox2.Enabled:=true;
 checkbox1.Enabled:=true;
end
else
begin
 combobox2.Enabled:=false;
 checkbox1.Enabled:=false;
end;
end;

 {
function GetAvailableMem: Integer;

const

  MaxInt: Int64 = High(Integer);

var

  MemStats: TMemoryStatus;

  Available: Int64;

begin

  GlobalMemoryStatus(MemStats);

  if (MemStats.dwAvailPhys > MaxInt) or (Longint(MemStats.dwAvailPhys) = -1) then

    Available := MaxInt

  else

    Available := MemStats.dwAvailPhys;

  if (MemStats.dwAvailPageFile > MaxInt) or (Longint(MemStats.dwAvailPageFile) = -1) then

    Inc(Available, MaxInt div 2)

  else

    Inc(Available, MemStats.dwAvailPageFile div 2);

  if Available > MaxInt then

    Result := MaxInt

  else

    Result := Available;

end;




initialization

  Mxarrays.SetMemoryCapacity(GetAvailableMem);
    {}
end.
