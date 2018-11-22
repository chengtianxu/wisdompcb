unit Totals;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBCtrls, ExtCtrls, DBGrids, Buttons, Mask,
  Menus, TeEngine, Series, TeeProcs, Chart, ComCtrls, ToolWin, ImgList,
  Excel2000, OleServer,ClipBrd,ComObj;

type
  TFrmTotals = class(TForm)
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    SpeedButton4: TSpeedButton;
    ImageList1: TImageList;
    ImageList2: TImageList;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton14: TToolButton;
    ToolButton3: TToolButton;
    ToolButton8: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton13: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Edit11: TEdit;
    UpDown1: TUpDown;
    ToolButton16: TToolButton;
    CheckBox1: TCheckBox;
    Chart1: TChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    StringGrid1: TStringGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit11Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTotals: TFrmTotals;

implementation
uses main, Report2, ProgressBar, Report, Unit2;

{$R *.dfm}

procedure TFrmTotals.SpeedButton4Click(Sender: TObject);
begin
    Application.CreateForm(TFrmReport2, FrmReport2);
    FrmReport2.QRLabel5.Caption:=datetostr(FrmMain.datetimepicker1.Date);
    FrmReport2.QRLabel8.Caption:=datetostr(FrmMain.datetimepicker2.Date);
    frmmain.adoords.Filtered :=true;
    frmmain.adoords.Filter :='amt_all >=0';
    FrmReport2.QuickRep1.Preview ;
    FrmReport2.Free ;
    frmmain.adoords.Filtered :=false;
end;

procedure TFrmTotals.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFrmTotals.FormCreate(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='客户';
  stringgrid1.Cells[1,0]:='客户名称';
  stringgrid1.Cells[2,0]:='订货金额';
  stringgrid1.Cells[3,0]:='已交货总金额';
  stringgrid1.Cells[4,0]:='准期交货金额';
  stringgrid1.Cells[5,0]:='延期交货金额';
  stringgrid1.Cells[6,0]:='准期交货率';
end;

procedure TFrmTotals.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  If acol>1 then
  if trim(Stringgrid1.Cells[aCol,aRow])<>'' then
    Stringgrid1.Canvas.TextRect(rect,rect.right-Stringgrid1.Canvas.TextWidth(Stringgrid1.Cells[aCol,aRow])-2,
        rect.Top+2, Stringgrid1.Cells[aCol,aRow]);
end;

procedure TFrmTotals.ToolButton3Click(Sender: TObject);
begin
  Chart1.Print ;
  Messagedlg('打印完毕！',mtinformation,[mbOk],0);
end;

procedure TFrmTotals.ToolButton4Click(Sender: TObject);
begin
  IF chart1.view3doptions.Zoom<300 THEN
    chart1.view3doptions.Zoom := chart1.view3doptions.Zoom+2;
end;

procedure TFrmTotals.ToolButton5Click(Sender: TObject);
begin
  IF chart1.view3doptions.Zoom>1 THEN
    chart1.view3doptions.Zoom := chart1.view3doptions.Zoom-2;
end;

procedure TFrmTotals.ToolButton6Click(Sender: TObject);
begin
  IF chart1.view3doptions.HorizOffset>-500 THEN
    chart1.view3doptions.HorizOffset :=
    chart1.view3doptions.HorizOffset-5;
end;

procedure TFrmTotals.ToolButton7Click(Sender: TObject);
begin
  IF chart1.view3doptions.HorizOffset<500 THEN
    chart1.view3doptions.HorizOffset :=
    chart1.view3doptions.HorizOffset+5;
end;

procedure TFrmTotals.ToolButton11Click(Sender: TObject);
begin
  IF chart1.view3doptions.VertOffset>-500 THEN
    chart1.view3doptions.VertOffset :=
    chart1.view3doptions.VertOffset-5;
end;

procedure TFrmTotals.ToolButton12Click(Sender: TObject);
begin
  IF chart1.view3doptions.VertOffset<500 THEN
    chart1.view3doptions.VertOffset :=
    chart1.view3doptions.VertOffset+5;
end;

procedure TFrmTotals.ToolButton9Click(Sender: TObject);
begin
  IF chart1.Chart3DPercent<96 THEN
    chart1.Chart3DPercent := chart1.Chart3DPercent+5;
end;

procedure TFrmTotals.ToolButton10Click(Sender: TObject);
begin
  IF chart1.Chart3DPercent>5 THEN
    chart1.Chart3DPercent := chart1.Chart3DPercent-5;
end;

procedure TFrmTotals.ToolButton1Click(Sender: TObject);
begin
Chart1.PreviousPage;
end;

procedure TFrmTotals.ToolButton2Click(Sender: TObject);
begin
chart1.NextPage ;
end;

procedure TFrmTotals.CheckBox1Click(Sender: TObject);
begin
  chart1.View3D:=checkbox1.Checked ;
  toolbutton4.Enabled:=checkbox1.Checked ;
  toolbutton5.Enabled:=checkbox1.Checked ;
  toolbutton6.Enabled:=checkbox1.Checked ;
  toolbutton7.Enabled:=checkbox1.Checked ;
  toolbutton9.Enabled:=checkbox1.Checked ;
  toolbutton10.Enabled:=checkbox1.Checked ;
  toolbutton11.Enabled:=checkbox1.Checked ;
  toolbutton12.Enabled:=checkbox1.Checked ;
end;

procedure TFrmTotals.SpeedButton1Click(Sender: TObject);
var
  asheet:Variant;
  i,j:integer;
  tslist:tstringlist;
  vstr:string;
begin
  if messagedlg('要把数据资料导出到EXCEL文件吗?',mtconfirmation,[mbYes,mbNo],0)<>mrYes then exit;
  try
  asheet:=CreateOleObject( 'Excel.Application' );
  except
    messagedlg('是否正确安装了EXCEL？',mtinformation,[mbok],0);
    Abort;
  end;
  try
  Screen.Cursor := crHourglass;
  asheet.Workbooks.Add;
  asheet.WorkSheets[1].Activate;
//  asheet.workbooks[1].worksheets.add;  //增加页面
  asheet.activeSheet.Name :='准期交货表现汇总分析';
  tslist:=tstringlist.Create;
  vstr:=#9+#9+ asheet.activeSheet.Name ;
  tslist.Add(vstr);
  vstr:='';
  for j:=0 to stringgrid1.RowCount -1  do
   begin
    for i:=0 to stringgrid1.ColCount -1  do
        vstr:=vstr+#9+stringgrid1.cells[i,j] ;
    tslist.add(vstr);
    vstr:='';
   end;

    clipboard.Clear;
    Clipboard.AsText:=tsList.Text;
    asheet.activeSheet.paste;
    tslist.Clear;
   tslist.free;
   asheet.visible:=true;

   finally
     Screen.Cursor := crDefault;
   end;
end;

procedure TFrmTotals.Edit11Change(Sender: TObject);
begin
  Chart1.MaxPointsPerPage:=strtoint(Edit11.text);
end;

procedure TFrmTotals.SpeedButton2Click(Sender: TObject);
begin
    FrmReport3:= TFrmReport3.Create(Application);
    frmReport3.QRLabel1.Caption :='准期交货表现分析';
    FrmReport3.QRChart1.Chart.View3D :=checkbox1.Checked ;
    FrmReport3.Series1.Assign(series1);
    FrmReport3.Series2.Assign(series2);
    FrmReport3.QRChart1.Chart.MaxPointsPerPage :=chart1.MaxPointsPerPage ;
    FrmReport3.QRLabel10.Caption :='  (From:'+datetostr(FrmMain.DateTimePicker1.Date)+' To:'+datetostr(FrmMain.DateTimePicker2.Date)+')';
    FrmReport3.QRchart1.chart.LeftAxis.Maximum:=chart1.LeftAxis.Maximum;
    FrmReport3.QRchart1.Chart.LeftAxis.Minimum:=chart1.LeftAxis.Minimum;
    FrmReport3.QuickRep1.Preview ;
    FrmReport3.Free ;
end;

end.
