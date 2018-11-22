unit analysis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ComCtrls, ExtCtrls, StdCtrls, Buttons,
  Math,Excel2000,ClipBrd,ComObj, Menus, DBGrids;

type
 TExcludeColumns = set of 0..255;

type
  TForm2 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    DBGridEh1: TDBGridEh;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    sgrid1: TStringGrid;
    PageControl3: TPageControl;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    PageControl4: TPageControl;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    Sgrid2: TStringGrid;
    BitBtn2: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    PageControl5: TPageControl;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    Sgrid3: TStringGrid;
    TabSheet13: TTabSheet;
    PageControl6: TPageControl;
    TabSheet14: TTabSheet;
    Sgrid4: TStringGrid;
    TabSheet15: TTabSheet;
    TabSheet16: TTabSheet;
    PageControl7: TPageControl;
    TabSheet17: TTabSheet;
    TabSheet18: TTabSheet;
    Sgrid5: TStringGrid;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
   procedure SetOptimalGridCellWidth(sg: TStringGrid;
      ExcludeColumns: TExcludeColumns);
   procedure sum_stringgrid(sg: TStringGrid);
   procedure sum_rejsgrid(sg: TStringGrid);
  procedure CopyDbDataToExcel(Args:array of const;title_caption:string);
  procedure CopysgridToExcel(sg: TStringGrid;title_caption:string);
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses damo;

{$R *.dfm}
procedure TForm2.sum_stringgrid(sg: TStringGrid);
var
 std_number:array of currency;
 i,j:integer;
begin
 setlength(std_number,sg.ColCount-3);
 for i:=low(std_number) to high(std_number) do
  std_number[i]:=0;
 for i:=2 to sg.RowCount-2 do
 for j:=3 to sg.ColCount-1 do
 if trim(sg.Cells[j,i])<>'' then
  std_number[j-3]:=std_number[j-3]+strtocurr(sg.Cells[j,i]);
sg.Cells[2,sg.RowCount-1]:='合计';
 for i:=low(std_number) to high(std_number) do
  sg.Cells[i+3,sg.RowCount-1]:=formatfloat('#,##0.00',std_number[i]);
end;

procedure TForm2.sum_rejsgrid(sg: TStringGrid);
var
 std_number:array of currency;
 i,j:integer;
begin
 setlength(std_number,sg.ColCount-2);
 for i:=low(std_number) to high(std_number) do
  std_number[i]:=0;
 for i:=1 to sg.RowCount-2 do
 for j:=2 to sg.ColCount-1 do
 if trim(sg.Cells[j,i])<>'' then
  std_number[j-2]:=std_number[j-2]+strtocurr(sg.Cells[j,i]);
  
sg.Cells[1,sg.RowCount-1]:='合计';

 for i:=low(std_number) to high(std_number) do
  sg.Cells[i+2,sg.RowCount-1]:=formatfloat('#,##0.00',std_number[i]);

if std_number[4]>0 then
 sg.Cells[7,sg.RowCount-1]:=formatfloat('0.00', //报废成本率%
               std_number[2]/std_number[4]*100);

if std_number[3]>0 then
 sg.Cells[8,sg.RowCount-1]:=formatfloat('0.00', //报废面积率%
               std_number[1]/std_number[3]*100);
end;

procedure TForm2.CopysgridToExcel(sg: TStringGrid;title_caption:string);
var
 iCount, jCount: Integer;
 XLApp: Variant;
 Sheet: Variant;
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

  XLApp.WorkBooks[1].WorkSheets[1].Name := title_caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[title_caption];
  for iCount := 0 to sg.ColCount - 1 do
   Sheet.Cells[1, iCount + 1 ] := sg.Cells[icount,0];

  for jcount :=1 to sg.RowCount-1 do
   for iCount := 0 to sg.ColCount - 1 do
    Sheet.Cells[jCount + 1, iCount + 1] := sg.Cells[iCount,jcount];

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
end;

procedure Tform2.CopyDbDataToExcel(Args:array of const;title_caption:string);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
 I: Integer;
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
 XLApp.SheetsInNewWorkbook := High(Args) + 1;

 for I := Low(Args) to High(Args) do
 begin
   XLApp.WorkBooks[1].WorkSheets[I+1].Name := title_caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[title_caption];
   if not TDBGrideh(Args[I].VObject).DataSource.DataSet.Active then
    begin
     Screen.Cursor := crDefault;
     Exit;
    end;
   TDBGrideh(Args[I].VObject).DataSource.DataSet.DisableControls;
   TDBGrideh(Args[I].VObject).DataSource.DataSet.first;

   v_cloumn:=0;
   for iCount := 0 to TDBGrideh(Args[I].VObject).Columns.Count - 1 do
    if TDBGrideh(Args[I].VObject).Columns.Items[iCount].Visible=true then
     Sheet.Cells[1, iCount + 1 - v_cloumn] :=
     TDBGrideh(Args[I].VObject).Columns.Items[iCount].Title.Caption
    else
     inc(v_cloumn);

   jCount := 1;
   while not TDBGrideh(Args[I].VObject).DataSource.DataSet.Eof do
   begin
     v_cloumn:=0;
     for iCount := 0 to TDBGrideh(Args[I].VObject).Columns.Count - 1 do
      if TDBGrideh(Args[I].VObject).Columns.Items[iCount].Visible=true then
       Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
       TDBGrideh(Args[I].VObject).Columns.Items[iCount].Field.AsString
      else
       inc(v_cloumn);
     Inc(jCount);
     TDBGrideh(Args[I].VObject).DataSource.DataSet.Next;
   end;

   XlApp.Visible := True;
   TDBGrideh(Args[I].VObject).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;
end;

procedure tform2.SetOptimalGridCellWidth(sg: TStringGrid;
  ExcludeColumns: TExcludeColumns);
 var
  i : Integer;
  j : Integer;
  max_width : Integer;
begin
with sg do
 begin
  Canvas.Font.Assign(Font);
  for i := 0 to (ColCount - 1) do
  begin
   if i in ExcludeColumns then Continue;
   max_width := 0;
   for j := 0 to (RowCount - 1) do
    max_width := Math.Max(max_width,Canvas.TextWidth(Cells[i,j]));
   if max_width > 0 then
    ColWidths[i] := max_width + 4
   else
    ColWidths[i] := DefaultColWidth;
  end; { for }
 end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin

pagecontrol1.ActivePageIndex:=0;
 sgrid1.Cells[0,0]:='库存类型';
 sgrid1.Cells[1,0]:='项目说明';
 sgrid1.Cells[0,1]:='一,库存材料';
 sgrid1.Cells[1,1]:='实际成本';
 sgrid1.Cells[0,2]:='二,在制品';
 sgrid1.Cells[1,2]:='材料成本';
 sgrid1.Cells[0,3]:='二,在制品';
 sgrid1.Cells[1,3]:='制造费用';
 sgrid1.Cells[0,4]:='三,半成品';
 sgrid1.Cells[1,4]:='材料成本';
 sgrid1.Cells[0,5]:='三,半成品';
 sgrid1.Cells[1,5]:='制造费用';
 sgrid1.Cells[0,6]:='四,产成品';
 sgrid1.Cells[1,6]:='材料成本';
 sgrid1.Cells[0,7]:='四,产成品';
 sgrid1.Cells[1,7]:='制造费用';
 sgrid1.Cells[1,8]:='合计';

 sgrid2.Cells[0,1]:='序号';
 sgrid2.Cells[1,1]:='代码';
 sgrid2.Cells[2,0]:='成本中心';
 sgrid2.Cells[2,1]:='名称';

 sgrid3.Cells[0,1]:='序号';
 sgrid3.Cells[1,1]:='代码';
 sgrid3.Cells[2,0]:='成本中心';
 sgrid3.Cells[2,1]:='名称';

 sgrid4.Cells[0,1]:='序号';
 sgrid4.Cells[1,1]:='代码';
 sgrid4.Cells[2,0]:='材料类型';
 sgrid4.Cells[2,1]:='名称';

 sgrid5.Cells[0,0]:='序号';
 sgrid5.Cells[1,0]:='期间';
 sgrid5.Cells[2,0]:='报废数量';
 sgrid5.Cells[3,0]:='报废面积';
 sgrid5.Cells[4,0]:='报废成本';
 sgrid5.Cells[5,0]:='销售面积';
 sgrid5.Cells[6,0]:='销售金额';
 sgrid5.Cells[7,0]:='报废成本率%';
 sgrid5.Cells[8,0]:='报废面积率%';

 SetOptimalGridCellWidth(sgrid1,[0,1]);  //使所有stringgrid单元格宽度自适应
 self.sum_stringgrid(sgrid2);
 self.sum_stringgrid(sgrid3);
 self.sum_stringgrid(sgrid4);
 self.sum_rejsgrid(sgrid5);
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm2.N1Click(Sender: TObject);
begin
self.CopyDbDataToExcel([dbgrideh1],n1.Caption);
end;

procedure TForm2.N2Click(Sender: TObject);
begin
self.CopysgridToExcel(sgrid1,n2.Caption);
end;

procedure TForm2.N3Click(Sender: TObject);
begin
self.CopysgridToExcel(sgrid2,n3.Caption);
end;

procedure TForm2.N4Click(Sender: TObject);
begin
self.CopysgridToExcel(sgrid3,n4.Caption);
end;

procedure TForm2.N5Click(Sender: TObject);
begin
self.CopysgridToExcel(sgrid4,n5.Caption);
end;

procedure TForm2.N6Click(Sender: TObject);
begin
self.CopysgridToExcel(sgrid5,n6.Caption);
end;

end.
