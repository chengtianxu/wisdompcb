unit standpo_subtotal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ExtCtrls, Grids, DBGrids,ComObj, Excel2000,ClipBrd,
  ComCtrls, MXPIVSRC, MXDB, MXGRID, Mxstore, TeEngine, Series, TeeProcs,
  Chart, Buttons, ExtDlgs,Mxarrays;

type
  TForm7 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ADOanalysis: TADOStoredProc;
    ADOanalysisgroup_name: TStringField;
    ADOanalysisABBR_NAME: TStringField;
    ADOanalysispurch_quan: TFloatField;
    ADOanalysispurch_amount: TFloatField;
    ADOanalysispurch_total_qty: TFloatField;
    ADOanalysispurch_total_amount: TFloatField;
    ADOanalysisqty_percent: TFloatField;
    ADOanalysismoney_percent: TFloatField;
    DataSource2: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBGrid2: TDBGrid;
    DecisionCube1: TDecisionCube;
    DecisionGrid1: TDecisionGrid;
    DecisionSource1: TDecisionSource;
    DecisionPivot1: TDecisionPivot;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    TabSheet4: TTabSheet;
    Chart1: TChart;
    Series1: TBarSeries;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox2: TComboBox;
    ADOquery1: TADOStoredProc;
    ADOquery1PO_NUMBER: TStringField;
    ADOquery1EMPLOYEE_NAME: TStringField;
    ADOquery1ABBR_NAME: TStringField;
    ADOquery1PO_DATE: TDateTimeField;
    ADOquery1FOB: TStringField;
    ADOquery1PO_REV_NO: TStringField;
    ADOquery1ANALYSIS_CODE_1: TStringField;
    ADOquery1DISCOUNT2_DAYS: TSmallintField;
    ADOquery1STATUS: TWordField;
    ADOquery1total_money: TFloatField;
    ADOquery1CURR_NAME: TStringField;
    ADOquery1supp_abbrname: TStringField;
    ADOquery1PO_TYPE: TStringField;
    ADOquery1ANALYSIS_CODE_2: TStringField;
    ADOquery1ANALYSIS_CODE_3: TStringField;
    ADOquery1ANALYSIS_CODE_4: TStringField;
    ADOquery1ANALYSIS_CODE_5: TStringField;
    ADOquery1SHIPTO_ADDRESS: TStringField;
    ADOquery1in_out: TStringField;
    ADOquery1ttype: TStringField;
    ADOquery1po_stat: TStringField;
    ADObalan: TADOStoredProc;
    CheckBox1: TCheckBox;
    UpDown1: TUpDown;
    Edit2: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SavePictureDialog1: TSavePictureDialog;
    SpeedButton4: TSpeedButton;
    PrintDialog1: TPrintDialog;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Aq19: TADOQuery;
    Aq19rkey: TIntegerField;
    Aq19inv_group_name: TStringField;
    Aq19inv_group_desc: TStringField;
    TabSheet5: TTabSheet;
    ADOgroup_balan: TADOStoredProc;
    Chart2: TChart;
    Series2: TBarSeries;
    ComboBox3: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox4: TComboBox;
    ADOgroup_balanABBR_NAME: TStringField;
    ADOgroup_balanpurch_quan: TFloatField;
    ADOgroup_balanpurch_amount: TFloatField;
    ADOgroup_balanqty_percent: TFloatField;
    ADOgroup_balanamoney_percent: TFloatField;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    Edit3: TEdit;
    UpDown2: TUpDown;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure ADOquery1CalcFields(DataSet: TDataSet);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
    po_fieldname,pota_fieldname:string;
    v_colwidth: array of integer;
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
//  function GetAvailableMem: Integer;

implementation

uses main;

{$R *.dfm}

procedure TForm7.Button2Click(Sender: TObject);
var
   bm: TBookmark;
   col, row: Integer;
   sline: String;
   mem: TStringList;
   ExcelApp: Variant;
begin
if self.PageControl1.ActivePageIndex=0 then
 begin
    Screen.Cursor := crHourglass;
    DBGrid1.DataSource.DataSet.DisableControls;
    bm := DBGrid1.DataSource.DataSet.GetBookmark;
    DBGrid1.DataSource.DataSet.First;

    // create the Excel object
     ExcelApp := CreateOleObject('Excel.Application');
     ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
     ExcelApp.WorkBooks[1].WorkSheets[1].Name := pagecontrol1.ActivePage.Caption;

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
    ExcelApp.Workbooks[1].WorkSheets[pagecontrol1.ActivePage.Caption].Paste;
    ExcelApp.Visible := true;
    mem.Free;
    clipboard.Clear;
  //  FreeAndNil(ExcelApp);
    DBGrid1.DataSource.DataSet.GotoBookmark(bm);
    DBGrid1.DataSource.DataSet.FreeBookmark(bm);
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
 end
else
 if self.PageControl1.ActivePageIndex=1 then
  begin
    Screen.Cursor := crHourglass;
    DBGrid2.DataSource.DataSet.DisableControls;
    bm := DBGrid2.DataSource.DataSet.GetBookmark;
    DBGrid2.DataSource.DataSet.First;

    // create the Excel object
     ExcelApp := CreateOleObject('Excel.Application');
     ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
     ExcelApp.WorkBooks[1].WorkSheets[1].Name := pagecontrol1.ActivePage.Caption;

    // First we send the data to a memo
    // works faster than doing it directly to Excel
    mem := TStringList.Create;
    sline := '';

    // add the info for the column names
    for col := 0 to DBGrid2.FieldCount-1 do
      sline := sline + DBGrid2.Fields[col].DisplayLabel + #9;
    mem.Add(sline);

    // get the data into the memo
    for row := 0 to DBGrid2.DataSource.DataSet.RecordCount-1 do
     begin
      sline := '';
      for col := 0 to DBGrid2.FieldCount-1 do
        sline := sline + DBGrid2.Fields[col].AsString + #9;
      mem.Add(sline);
      DBGrid2.DataSource.DataSet.Next;
     end;

    // we copy the data to the clipboard
    clipboard.Clear;
    Clipboard.AsText:=mem.Text;

    // if needed, send it to Excel
    // if not, we already have it in the clipboard
    ExcelApp.Workbooks[1].WorkSheets[pagecontrol1.ActivePage.Caption].Paste;
    ExcelApp.Visible := true;
    mem.Free;
    clipboard.Clear;
  //  FreeAndNil(ExcelApp);
    DBGrid2.DataSource.DataSet.GotoBookmark(bm);
    DBGrid2.DataSource.DataSet.FreeBookmark(bm);
    DBGrid2.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end
 else
  begin
   Screen.Cursor := crHourglass;
    // create the Excel object
   ExcelApp := CreateOleObject('Excel.Application');
   ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
   ExcelApp.WorkBooks[1].WorkSheets[1].Name := pagecontrol1.ActivePage.Caption;
    // First we send the data to a memo
    // works faster than doing it directly to Excel
    mem := TStringList.Create;
    sline := '';
    // add the info for the column names
    for col := 0 to decisiongrid1.ColCount-2 do
     sline := sline + decisiongrid1.Cells[col-1,-1] + #9;
    mem.Add(sline);
    // get the data into the memo
    for row := 0 to decisiongrid1.RowCount-3 do
     begin
      sline := '';
      for col := 0 to decisiongrid1.ColCount-2 do
       sline := sline + decisiongrid1.Cells[col-1,row] + #9;
      mem.Add(sline);
     end;
    // we copy the data to the clipboard
    clipboard.Clear;
    Clipboard.AsText:=mem.Text;

// if needed, send it to Excel if not, we already have it in the clipboard
    ExcelApp.Workbooks[1].WorkSheets[pagecontrol1.ActivePage.Caption].Paste;
    ExcelApp.Visible := true;
    mem.Free;
    clipboard.Clear;
  //  FreeAndNil(ExcelApp);
    Screen.Cursor := crDefault;
  end;
end;

procedure TForm7.FormShow(Sender: TObject);
var
 i:byte;
begin
setlength(v_colwidth,dbgrid2.FieldCount);
for i:=0 to high(v_colwidth) do v_colwidth[i]:=dbgrid2.Columns[i].Width;
end;

procedure TForm7.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=low(v_colwidth) to high(v_colwidth) do
  dbgrid2.Columns[i].Width:=v_colwidth[i]+round((dbgrid2.Width-768)*v_colwidth[i]/742);
end;

procedure TForm7.FormActivate(Sender: TObject);
begin
self.po_fieldname:='PO_NUMBER';
self.pota_fieldname:='group_name';
self.Series1.Clear;

while not self.ADObalan.Eof do
 begin
  Series1.Add(ADObalan.FieldValues['purch_amount'],ADObalan.Fields[0].value);
  ADObalan.Next;
 end;
while not self.ADOgroup_balan.Eof do
 begin
  Series2.Add(self.ADOgroup_balanpurch_amount.Value,self.ADOgroup_balanABBR_NAME.Value);
  self.ADOgroup_balan.Next;
 end;
chart2.Title.Text[0]:=combobox3.Text+combobox4.Text+'供应商对比图'; 
pagecontrol1.ActivePageIndex:=0;
end;

procedure TForm7.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
 begin
  if pagecontrol1.ActivePageIndex=0 then
   adoquery1.Filter:=self.po_fieldname+' like ''%'+trim(edit1.Text)+'%'' '
  else
   adoanalysis.Filter:=self.pota_fieldname+' like ''%'+trim(edit1.Text)+'%'' ';
 end
else
 begin
  if pagecontrol1.ActivePageIndex=0 then
   adoquery1.Filter:=''
  else
   adoanalysis.Filter:='';
 end;
end;

procedure TForm7.PageControl1Change(Sender: TObject);
begin
 edit1.Enabled:=true;
 combobox1.Enabled:=false;
 combobox2.Enabled:=false;
 checkbox1.Enabled:=false;
 button2.Enabled:=true;
 if edit1.Text<>'' then edit1.Text:='';
if pagecontrol1.ActivePageIndex=0 then
 begin
  label2.Visible:=false;
  label1.Visible:=true;
 end
else
 if pagecontrol1.ActivePageIndex=1 then
  begin
   label2.Visible:=true;
   label1.Visible:=false;
  end
 else
  if pagecontrol1.ActivePageIndex=2 then
   begin
    edit1.Enabled:=false;
   end
  else
   if pagecontrol1.ActivePageIndex=3 then
   begin
    combobox1.Enabled:=true;
    combobox2.Enabled:=true;
    checkbox1.Enabled:=true;
    edit1.Enabled:=false;
    button2.Enabled:=false;
   end
   else
    begin
     checkbox1.Enabled:=true;
     edit1.Enabled:=false;
     button2.Enabled:=false;
    end;
end;

procedure TForm7.DBGrid1TitleClick(Column: TColumn);
begin
if (po_fieldname<>column.FieldName) and
   (column.ReadOnly) then
 begin
  self.po_fieldname := column.FieldName;
  self.Label1.Caption := column.Title.Caption;
  edit1.SetFocus;
 end;
end;

procedure TForm7.DBGrid2TitleClick(Column: TColumn);
begin
if (pota_fieldname<>column.FieldName) and
   (column.ReadOnly) then
 begin
  self.pota_fieldname:=column.FieldName;
  self.Label2.Caption:=column.Title.Caption;
  edit1.SetFocus;
 end;
end;

procedure TForm7.ADOquery1CalcFields(DataSet: TDataSet);
begin
 case Adoquery1status.Value of
  1: adoquery1po_stat.Value := '待审核';
  2: adoquery1po_stat.Value := '被退回';
  3: adoquery1po_stat.Value := '已保留';
  4: adoquery1po_stat.Value := '已暂缓';
  5: adoquery1po_stat.Value := '已审核';
  6: adoquery1po_stat.Value := '已收货';
  7: adoquery1po_stat.Value := '已完成';
  8: adoquery1po_stat.Value := '未提交';
 end;

 if adoquery1PO_TYPE.Value = 'S' then
  adoquery1Ttype.Value := '生产物料'
 else
  adoquery1Ttype.Value := '非生产物料';

 if adoquery1discount2_days.Value=0 then
  adoquery1in_out.Value := '国内'
 else
  adoquery1in_out.Value := '国外';
end;

procedure TForm7.CheckBox1Click(Sender: TObject);
begin
chart1.View3D:=self.CheckBox1.Checked;
chart2.View3D:=self.CheckBox1.Checked;
end;

procedure TForm7.ComboBox2Change(Sender: TObject);
begin
case combobox2.ItemIndex of
0:begin
   self.Series1.Clear;
   self.ADObalan.First;
   while not self.ADObalan.Eof do
    begin
     Series1.Add(ADObalan.FieldValues['purch_amount'],ADObalan.Fields[0].value);
     ADObalan.Next;
    end;
   self.Series1.ValueFormat:='0.00';
   self.Chart1.LeftAxis.AxisValuesFormat:='0';
   chart1.LeftAxis.Title.Caption:=combobox2.Text;
   chart1.Title.Text[0]:=combobox1.Text+combobox2.Text+'对比图';
  end;
1:begin
   self.Series1.Clear;
   self.ADObalan.First;
   while not self.ADObalan.Eof do
    begin
     Series1.Add(ADObalan.FieldValues['purch_quan'],ADObalan.Fields[0].value);
     ADObalan.Next;
    end;
   self.Series1.ValueFormat:='0.00';
   self.Chart1.LeftAxis.AxisValuesFormat:='0';
   chart1.LeftAxis.Title.Caption:=combobox2.Text;
   chart1.Title.Text[0]:=combobox1.Text+combobox2.Text+'对比图';
  end;
2:begin
   self.Series1.Clear;
   self.ADObalan.First;
   while not self.ADObalan.Eof do
    begin
     Series1.Add(ADObalan.FieldValues['amoney_percent'],ADObalan.Fields[0].value);
     ADObalan.Next;
    end;
   self.Series1.ValueFormat:='0.0000%';
   self.Chart1.LeftAxis.AxisValuesFormat:='0%';
   chart1.LeftAxis.Title.Caption:=combobox2.Text;
   chart1.Title.Text[0]:=combobox1.Text+combobox2.Text+'对比图';
  end;
3:begin
   self.Series1.Clear;
   self.ADObalan.First;
   while not self.ADObalan.Eof do
    begin
     Series1.Add(ADObalan.FieldValues['qty_percent'],ADObalan.Fields[0].value);
     ADObalan.Next;
    end;
   self.Series1.ValueFormat:='0.0000%';
   self.Chart1.LeftAxis.AxisValuesFormat:='0%';
   chart1.LeftAxis.Title.Caption:=combobox2.Text;
   chart1.Title.Text[0]:=combobox1.Text+combobox2.Text+'对比图';
  end;
end;
end;

procedure TForm7.ComboBox1Change(Sender: TObject);
begin
self.ADObalan.Close;
self.ADObalan.Parameters[4].Value:=combobox1.ItemIndex;
self.ADObalan.Open;
self.ComboBox2Change(sender);
end;

procedure TForm7.Edit2Change(Sender: TObject);
begin
self.Chart1.MaxPointsPerPage:=updown1.Position;
end;

procedure TForm7.SpeedButton2Click(Sender: TObject);
begin
chart1.NextPage;

end;

procedure TForm7.SpeedButton1Click(Sender: TObject);
begin
chart1.PreviousPage;
end;

procedure TForm7.SpeedButton3Click(Sender: TObject);
begin
if self.SavePictureDialog1.Execute then
chart1.SaveToBitmapFile(self.SavePictureDialog1.FileName+'.bmp');
end;

procedure TForm7.SpeedButton4Click(Sender: TObject);
begin
if self.PrintDialog1.Execute then
self.Chart1.Print;
end;

procedure TForm7.SpeedButton6Click(Sender: TObject);
begin
  IF Chart1.view3doptions.Zoom>1 THEN
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom-2;
end;

procedure TForm7.SpeedButton5Click(Sender: TObject);
begin
  IF Chart1.view3doptions.Zoom<300 THEN
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom+2;
end;

procedure TForm7.ComboBox3Change(Sender: TObject);
begin
self.Aq19.MoveBy(combobox3.ItemIndex+1-aq19.RecNo);
self.ADOgroup_balan.Close;
self.ADOgroup_balan.Parameters[4].Value:=self.Aq19rkey.Value;
self.ADOgroup_balan.Open;
self.ComboBox4Change(sender);
end;

procedure TForm7.ComboBox4Change(Sender: TObject);
begin
case combobox4.ItemIndex of
0:begin                             //采购金额
   self.Series2.Clear;
   self.ADOgroup_balan.First;
   while not self.ADOgroup_balan.Eof do
    begin
     Series2.Add(ADOgroup_balanpurch_amount.Value,ADOgroup_balanABBR_NAME.Value);
     ADOgroup_balan.Next;
    end;
   self.Series2.ValueFormat:='0.00';
   self.Chart2.LeftAxis.AxisValuesFormat:='0';
   chart2.LeftAxis.Title.Caption:=combobox4.Text;
   chart2.Title.Text[0]:=combobox3.Text+combobox4.Text+'供应商对比图';
  end;
1:begin                            //采购数量
   self.Series2.Clear;
   self.ADOgroup_balan.First;
   while not self.ADOgroup_balan.Eof do
    begin
     Series2.Add(self.ADOgroup_balanpurch_quan.Value,ADOgroup_balanABBR_NAME.Value);
     ADOgroup_balan.Next;
    end;
   self.Series2.ValueFormat:='0.00';
   self.Chart2.LeftAxis.AxisValuesFormat:='0';
   chart2.LeftAxis.Title.Caption:=combobox4.Text;
   chart2.Title.Text[0]:=combobox3.Text+combobox4.Text+'供应商对比图';
  end;
2:begin                                //金额百分比
   self.Series2.Clear;
   self.ADOgroup_balan.First;
   while not self.ADOgroup_balan.Eof do
    begin
     Series2.Add(self.ADOgroup_balanamoney_percent.Value,ADOgroup_balanABBR_NAME.Value);
     ADOgroup_balan.Next;
    end;
   self.Series2.ValueFormat:='0.0000%';
   self.Chart2.LeftAxis.AxisValuesFormat:='0%';
   chart2.LeftAxis.Title.Caption:=combobox4.Text;
   chart2.Title.Text[0]:=combobox3.Text+combobox4.Text+'供应商对比图';
  end;
3:begin                              //数量百分比
   self.Series2.Clear;
   self.ADOgroup_balan.First;
   while not self.ADOgroup_balan.Eof do
    begin
     Series2.Add(self.ADOgroup_balanqty_percent.Value,ADOgroup_balanABBR_NAME.Value);
     ADOgroup_balan.Next;
    end;
   self.Series2.ValueFormat:='0.0000%';
   self.Chart2.LeftAxis.AxisValuesFormat:='0%';
   chart2.LeftAxis.Title.Caption:=combobox4.Text;
   chart2.Title.Text[0]:=combobox3.Text+combobox4.Text+'供应商对比图';
  end;
end;
end;

procedure TForm7.Edit3Change(Sender: TObject);
begin
self.Chart2.MaxPointsPerPage:=updown2.Position;
end;

procedure TForm7.SpeedButton12Click(Sender: TObject);
begin
chart2.NextPage;
end;

procedure TForm7.SpeedButton11Click(Sender: TObject);
begin
chart2.PreviousPage;
end;

procedure TForm7.SpeedButton10Click(Sender: TObject);
begin
  IF Chart2.view3doptions.Zoom>1 THEN
    Chart2.view3doptions.Zoom := Chart2.view3doptions.Zoom-2;
end;

procedure TForm7.SpeedButton9Click(Sender: TObject);
begin
  IF Chart2.view3doptions.Zoom<300 THEN
    Chart2.view3doptions.Zoom := Chart2.view3doptions.Zoom+2;
end;

procedure TForm7.SpeedButton8Click(Sender: TObject);
begin
if self.SavePictureDialog1.Execute then
chart2.SaveToBitmapFile(self.SavePictureDialog1.FileName+'.bmp');
end;

procedure TForm7.SpeedButton7Click(Sender: TObject);
begin
if self.PrintDialog1.Execute then
self.Chart2.Print;
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
