unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Mxstore, MXDB, MXGRID, ExtCtrls, MXPIVSRC, Grids,
  DBGrids, ComCtrls, StdCtrls, Buttons, DBGridEh, ExtDlgs, TeEngine,
  Series, TeeProcs, Chart,Excel2000,OleServer,ComObj;

type
  TForm1 = class(TForm)
    aq48: TADOQuery;
    DataSource1: TDataSource;
    aq48total_pcs: TIntegerField;
    aq48total_pan: TIntegerField;
    aq48total_sqft: TFloatField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    aq48DEPT_CODE: TStringField;
    aq48DEPT_NAME: TStringField;
    aq48PROD_CODE: TStringField;
    aq48PRODUCT_NAME: TStringField;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    adoquery1dept_code: TStringField;
    adoquery1dept_name: TStringField;
    adoquery1total_pcs: TIntegerField;
    adoquery1total_pan: TIntegerField;
    adoquery1total_sqft: TFloatField;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    TabSheet3: TTabSheet;
    Chart1: TChart;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    UpDown1: TUpDown;
    Edit2: TEdit;
    Series1: TBarSeries;
    SavePictureDialog1: TSavePictureDialog;
    PrintDialog1: TPrintDialog;
    CheckBox1: TCheckBox;
    ComboBox2: TComboBox;
    Label4: TLabel;
    ADOQuery1total_sq: TFloatField;
    aq48total_sq: TFloatField;
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses term,common;

{$R *.dfm}

procedure TForm1.BitBtn2Click(Sender: TObject);
var
  iCount, jCount, v_cloumn: Integer;
  XLApp: Variant;
  Sheet: Variant;
begin
if pagecontrol1.ActivePageIndex=0 then
 begin
  if dbgrideh1.DataSource.DataSet.IsEmpty then exit;
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;
  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := tabsheet1.Caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[tabsheet1.Caption];
  dbgrideh1.DataSource.DataSet.DisableControls;
  dbgrideh1.DataSource.DataSet.first;

  v_cloumn := 0;
  for iCount := 0 to dbgrideh1.Columns.Count - 1 do
    if dbgrideh1.Columns.Items[iCount].Visible = true then
      Sheet.Cells[1, iCount + 1 - v_cloumn] :=
        dbgrideh1.Columns[iCount].Title.Caption
    else
      inc(v_cloumn);

  jCount := 1;
  while not dbgrideh1.DataSource.DataSet.Eof do
  begin
    v_cloumn := 0;
    for iCount := 0 to dbgrideh1.Columns.Count - 1 do
      if dbgrideh1.Columns[iCount].Visible = true then
        Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
          dbgrideh1.Columns[iCount].Field.AsString
      else
        inc(v_cloumn);
    Inc(jCount);
    dbgrideh1.DataSource.DataSet.Next;
  end;

  sheet.rows[1].insert;
  sheet.rows[1].insert;
  sheet.rows[1].insert;
  sheet.cells[1,1]:=self.Caption+tabsheet1.Caption;
  sheet.cells[1,1].font.size:=18;
  sheet.cells[1,1].font.bold:=true;
  sheet.cells[2,1]:='产出期间从:'+datetimetostr(ADOQuery1.Parameters.ParamValues['dtpk1']);
  sheet.cells[3,1]:='到        :'+datetimetostr(ADOQuery1.Parameters.ParamValues['dtpk2']);

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  dbgrideh1.DataSource.DataSet.First;
  dbgrideh1.DataSource.DataSet.EnableControls;
end
else
if pagecontrol1.ActivePageIndex=1 then
 begin
  if dbgrideh2.DataSource.DataSet.IsEmpty then exit;
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;
  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := tabsheet2.Caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[tabsheet2.Caption];
  dbgrideh2.DataSource.DataSet.DisableControls;
  dbgrideh2.DataSource.DataSet.first;

  v_cloumn := 0;
  for iCount := 0 to dbgrideh2.Columns.Count - 1 do
    if dbgrideh2.Columns.Items[iCount].Visible = true then
      Sheet.Cells[1, iCount + 1 - v_cloumn] :=
        dbgrideh2.Columns[iCount].Title.Caption
    else
      inc(v_cloumn);

  jCount := 1;
  while not dbgrideh2.DataSource.DataSet.Eof do
  begin
    v_cloumn := 0;
    for iCount := 0 to dbgrideh2.Columns.Count - 1 do
      if dbgrideh2.Columns[iCount].Visible = true then
        Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
          dbgrideh2.Columns[iCount].Field.AsString
      else
        inc(v_cloumn);
    Inc(jCount);
    dbgrideh2.DataSource.DataSet.Next;
  end;

  sheet.rows[1].insert;
  sheet.rows[1].insert;
  sheet.rows[1].insert;
  sheet.cells[1,1]:=self.Caption+tabsheet2.Caption;
  sheet.cells[1,1].font.size:=18;
  sheet.cells[1,1].font.bold:=true;
  sheet.cells[2,1]:='产出期间从:'+datetimetostr(aq48.Parameters.ParamValues['dtpk1']);
  sheet.cells[3,1]:='到        :'+datetimetostr(aq48.Parameters.ParamValues['dtpk2']);

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  dbgrideh2.DataSource.DataSet.First;
  dbgrideh2.DataSource.DataSet.EnableControls;
 end;
end;

procedure TForm1.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(aq48.SQL.Text);
end;

procedure TForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text);
end;

procedure TForm1.Edit2Change(Sender: TObject);
begin
self.Chart1.MaxPointsPerPage:=updown1.Position;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
chart1.NextPage;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
chart1.PreviousPage;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
  IF Chart1.view3doptions.Zoom>1 THEN
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom-2;
end;

procedure TForm1.SpeedButton5Click(Sender: TObject);
begin
  IF Chart1.view3doptions.Zoom<300 THEN
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom+2;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
if self.SavePictureDialog1.Execute then
chart1.SaveToBitmapFile(self.SavePictureDialog1.FileName+'.bmp');
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
if self.PrintDialog1.Execute then
self.Chart1.Print;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
chart1.View3D:=self.CheckBox1.Checked;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
adoquery1.DisableControls;
while not self.adoquery1.Eof do
 begin
  if form_condition.RadioGroup2.ItemIndex=0 then
   Series1.Add(self.ADOQuery1total_sq.Value,self.adoquery1dept_name.Value)
  else
   Series1.Add(self.adoquery1total_sqft.Value,self.adoquery1dept_name.Value);
  adoquery1.Next;
 end;
adoquery1.first;
adoquery1.EnableControls;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
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

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
case  combobox2.ItemIndex of
 0:
begin
 series1.Clear;
 adoquery1.DisableControls;
 while not self.adoquery1.Eof do
 begin
  Series1.Add(self.adoquery1total_pcs.Value,self.adoquery1dept_name.Value);
  adoquery1.Next;
 end;
 adoquery1.first;
 self.Series1.ValueFormat:='0';
 chart1.LeftAxis.Title.Caption:=combobox2.Text;
 adoquery1.EnableControls;
end;
1:
begin
 series1.Clear;
 adoquery1.DisableControls;
 while not self.adoquery1.Eof do
 begin
  Series1.Add(self.adoquery1total_pan.Value,self.adoquery1dept_name.Value);
  adoquery1.Next;
 end;
 adoquery1.first;
 self.Series1.ValueFormat:='0';
 chart1.LeftAxis.Title.Caption:=combobox2.Text;
 adoquery1.EnableControls;
end;
2:
begin
 series1.Clear;
 adoquery1.DisableControls;
 while not self.adoquery1.Eof do
 begin
  if form_condition.RadioGroup2.ItemIndex=0 then
   Series1.Add(self.ADOQuery1total_sq.Value,adoquery1dept_name.Value)
  else
   Series1.Add(self.adoquery1total_sqft.Value,adoquery1dept_name.Value);
  adoquery1.Next;
 end;
 adoquery1.first;
 self.Series1.ValueFormat:='0.00';
 chart1.LeftAxis.Title.Caption:=combobox2.Text;
 adoquery1.EnableControls;
end;
end;
end;

end.
