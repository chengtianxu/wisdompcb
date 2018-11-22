unit total_daytimeout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, DB, ADODB,
  ComCtrls,Excel2000,OleServer,ComObj;

type
  TForm3 = class(TForm)
    ADOQuery1: TADOQuery;
    ADOQuery1DEPT_CODE: TStringField;
    ADOQuery1DEPT_NAME: TStringField;
    ADOQuery1total_pcs: TIntegerField;
    ADOQuery1total_pan: TIntegerField;
    ADOQuery1total_sqft: TFloatField;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ADOQuery1out_date: TStringField;
    ADOQuery1total_sq: TFloatField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    aqdate48: TADOQuery;
    aqdate48out_date: TStringField;
    aqdate48total_pcs: TIntegerField;
    aqdate48total_pan: TIntegerField;
    aqdate48total_sqft: TFloatField;
    aqdate48total_sq: TFloatField;
    Label1: TLabel;
    ComboBox1: TComboBox;
    aqdept48: TADOQuery;
    aqdept48dept_code: TStringField;
    aqdept48dept_name: TStringField;
    aqdept48total_pcs: TIntegerField;
    aqdept48total_pan: TIntegerField;
    aqdept48total_sqft: TFloatField;
    aqdept48total_sq: TFloatField;
    sgrid1: TStringGrid;
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
   function return_row(date:string):integer;
   function return_col(dept_code:string):integer;    
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses term,common;

{$R *.dfm}
function TForm3.return_row(date: string): integer;
begin
if aqdate48.Locate('out_date',date,[]) then
 result:=aqdate48.RecNo
else
 result:=0;
end;

function TForm3.return_col(dept_code: string): integer;
begin
if self.aqdept48.Locate('DEPT_CODE',dept_code,[]) then
 result:=aqdept48.RecNo
else
 result:=0;
end;

procedure TForm3.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text);
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
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

  XLApp.WorkBooks[1].WorkSheets[1].Name := self.Caption+pagecontrol1.ActivePage.Caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption+pagecontrol1.ActivePage.Caption];
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
  sheet.cells[1,1]:=self.Caption+pagecontrol1.ActivePage.Caption;
  sheet.cells[1,1].font.size:=18;
  sheet.cells[1,1].font.bold:=true;
  sheet.cells[2,1]:='产出期间从:'+datetimetostr(ADOQuery1.Parameters.ParamValues['dtpk1']);
  sheet.cells[3,1]:='到        :'+datetimetostr(ADOQuery1.Parameters.ParamValues['dtpk2']);

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  dbgrideh1.DataSource.DataSet.First;
  dbgrideh1.DataSource.DataSet.EnableControls;
// Export_dbGridEH_to_Excel(dbgrideh1,self.Caption+pagecontrol1.ActivePage.Caption)
 end
else
 begin
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

  XLApp.WorkBooks[1].WorkSheets[1].Name := self.Caption+pagecontrol1.ActivePage.Caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption+pagecontrol1.ActivePage.Caption];
  for iCount := 0 to sgrid1.ColCount - 1 do
    Sheet.Cells[1, iCount + 1] := sgrid1.Cells[icount, 0];

  for jcount := 1 to sgrid1.RowCount - 1 do
    for iCount := 0 to sgrid1.ColCount - 1 do
      Sheet.Cells[jCount + 1, iCount + 1] := sgrid1.Cells[iCount, jcount];


  sheet.rows[1].insert;
  sheet.rows[1].insert;
  sheet.rows[1].insert;
  sheet.cells[1,1]:=self.Caption+pagecontrol1.ActivePage.Caption;
  sheet.cells[1,1].font.size:=18;
  sheet.cells[1,1].font.bold:=true;
  sheet.cells[2,1]:='产出期间从:'+datetimetostr(ADOQuery1.Parameters.ParamValues['dtpk1']);
  sheet.cells[3,1]:='到        :'+datetimetostr(ADOQuery1.Parameters.ParamValues['dtpk2']);

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
 end;
{if pagecontrol1.ActivePageIndex=0 then
 Export_dbGridEH_to_Excel(dbgrideh1,self.Caption+pagecontrol1.ActivePage.Caption)
else
  Export_Grid_to_Excel(sgrid1,self.Caption+pagecontrol1.ActivePage.Caption);
 {}
end;

procedure TForm3.PageControl1Change(Sender: TObject);
begin
if pagecontrol1.ActivePageIndex=0 then
 combobox1.Enabled:=false
else
 combobox1.Enabled:=true; 
end;

procedure TForm3.FormActivate(Sender: TObject);
var
 i:integer;
begin
sgrid1.RowCount:=sgrid1.RowCount+self.aqdate48.RecordCount;
sgrid1.ColCount:=sgrid1.ColCount+self.aqdept48.RecordCount;

sgrid1.Cells[0,1]:='日:时';
sgrid1.Cells[sgrid1.ColCount-1,1]:='汇总';
sgrid1.Cells[0,sgrid1.RowCount-1]:='汇总';

aqdate48.First;
for i:=1 to aqdate48.RecordCount do
 begin
  sgrid1.Cells[0,i+1]:=self.aqdate48out_date.AsString;
  if form_condition.RadioGroup2.ItemIndex=0 then
   sgrid1.Cells[sgrid1.ColCount-1,i+1]:=self.aqdate48total_sq.AsString
  else
   sgrid1.Cells[sgrid1.ColCount-1,i+1]:=self.aqdate48total_sqft.AsString;
  aqdate48.Next;
 end;

 aqdept48.First;
for i:=1 to aqdept48.RecordCount do
 begin
  sgrid1.Cells[i,0]:=self.aqdept48DEPT_CODE.Value;
  sgrid1.Cells[i,1]:=self.aqdept48DEPT_NAME.Value;

  if form_condition.RadioGroup2.ItemIndex=0 then
   sgrid1.Cells[i,sgrid1.RowCount-1]:=self.aqdept48total_sq.AsString
  else
   sgrid1.Cells[i,sgrid1.RowCount-1]:=self.aqdept48total_sqft.AsString;
  aqdept48.Next;
 end;

self.ADOQuery1.DisableControls;
self.ADOQuery1.First;
while not adoquery1.Eof do
begin
if form_condition.RadioGroup2.ItemIndex=0 then
 sgrid1.Cells[return_col(self.ADOQuery1DEPT_CODE.Value),
              return_row(self.ADOQuery1out_date.Value)+1]:=
              ADOQuery1total_sq.AsString
else
 sgrid1.Cells[return_col(self.ADOQuery1DEPT_CODE.Value),
              return_row(self.ADOQuery1out_date.Value)+1]:=
              ADOQuery1total_sqft.AsString;

 self.ADOQuery1.Next;
end;
adoquery1.First;
self.ADOQuery1.EnableControls;

end;

procedure TForm3.ComboBox1Change(Sender: TObject);
var
 i:integer;
begin
aqdate48.First;
for i:=1 to aqdate48.RecordCount do
 begin
  case combobox1.ItemIndex of
  0:
  sgrid1.Cells[sgrid1.ColCount-1,i+1]:=self.aqdate48total_pcs.AsString;
  1:
  sgrid1.Cells[sgrid1.ColCount-1,i+1]:=self.aqdate48total_pan.AsString;
  2:
  if form_condition.RadioGroup2.ItemIndex=0 then
   sgrid1.Cells[sgrid1.ColCount-1,i+1]:=self.aqdate48total_sq.AsString
  else
   sgrid1.Cells[sgrid1.ColCount-1,i+1]:=self.aqdate48total_sqft.AsString;
  end;
  aqdate48.Next;
 end;

 aqdept48.First;
for i:=1 to aqdept48.RecordCount do
 begin
  case combobox1.ItemIndex of
  0:
  sgrid1.Cells[i,sgrid1.RowCount-1]:=self.aqdept48total_pcs.AsString;
  1:
  sgrid1.Cells[i,sgrid1.RowCount-1]:=self.aqdept48total_pan.AsString;
  2:
  if form_condition.RadioGroup2.ItemIndex=0 then
   sgrid1.Cells[i,sgrid1.RowCount-1]:=self.aqdept48total_sq.AsString
  else
   sgrid1.Cells[i,sgrid1.RowCount-1]:=self.aqdept48total_sqft.AsString;
  end;
  aqdept48.Next;
 end;


self.ADOQuery1.DisableControls;
self.ADOQuery1.First;
while not adoquery1.Eof do
begin
 case combobox1.ItemIndex of
 0:
 sgrid1.Cells[return_col(self.ADOQuery1DEPT_CODE.Value),
              return_row(self.ADOQuery1out_date.Value)+1]:=
              ADOQuery1total_pcs.AsString;
 1:
 sgrid1.Cells[return_col(self.ADOQuery1DEPT_CODE.Value),
              return_row(self.ADOQuery1out_date.Value)+1]:=
              ADOQuery1total_pan.AsString;
 2:
 if form_condition.RadioGroup2.ItemIndex=0 then
  sgrid1.Cells[return_col(self.ADOQuery1DEPT_CODE.Value),
               return_row(self.ADOQuery1out_date.Value)+1]:=
               ADOQuery1total_sq.AsString
 else
  sgrid1.Cells[return_col(self.ADOQuery1DEPT_CODE.Value),
               return_row(self.ADOQuery1out_date.Value)+1]:=
               ADOQuery1total_sqft.AsString;
 end;
 self.ADOQuery1.Next;
end;
 adoquery1.First;
 ADOQuery1.EnableControls;
end;

end.
