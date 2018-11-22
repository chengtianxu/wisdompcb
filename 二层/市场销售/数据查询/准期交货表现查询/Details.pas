unit Details;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBCtrls, ExtCtrls, DBGrids, Buttons, Mask,
  Menus, TeEngine, Series, TeeProcs, Chart, ComCtrls, ToolWin, Excel2000,
  OleServer, ImgList,ClipBrd,ComObj;

type
  TFrmDetails = class(TForm)
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    SpeedButton4: TSpeedButton;
    SpeedButton1: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    StringGrid1: TStringGrid;
    ImageList1: TImageList;
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
    ToolButton16: TToolButton;
    CheckBox1: TCheckBox;
    Chart1: TChart;
    ImageList2: TImageList;
    Series1: TPieSeries;
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
    procedure CheckBox1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDetails: TFrmDetails;

implementation
uses main, Report0, ProgressBar;

{$R *.dfm}

procedure TFrmDetails.SpeedButton4Click(Sender: TObject);
begin
    Application.CreateForm(TFrmReport0, FrmReport0);
    FrmReport0.QRLabel5.Caption:=datetostr(FrmMain.datetimepicker1.Date);
    FrmReport0.QRLabel8.Caption:=datetostr(FrmMain.datetimepicker2.Date);
    FrmReport0.QuickRep1.Preview ;
    FrmReport0.Free ;
end;

procedure TFrmDetails.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFrmDetails.FormCreate(Sender: TObject);
begin
  stringgrid1.Cells[0,0]:='客户';
  stringgrid1.Cells[1,0]:='本厂编号';
  //stringgrid1.Cells[2,0]:='版本';
  stringgrid1.Cells[3,0]:='订单号';
  stringgrid1.Cells[4,0]:='订货数量';
  stringgrid1.Cells[5,0]:='交货期';
  stringgrid1.Cells[6,0]:='准期订单数';
  stringgrid1.Cells[7,0]:='延期订单数';
  stringgrid1.Cells[8,0]:='准期金额';
  stringgrid1.Cells[9,0]:='延期金额';
  stringgrid1.ColWidths[2] := -1;
end;

procedure TFrmDetails.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  If (acol=4) or (acol=6)  or (acol=7) or(acol=8) or (acol=9) then
  if trim(Stringgrid1.Cells[aCol,aRow])<>'' then
    Stringgrid1.Canvas.TextRect(rect,rect.right-Stringgrid1.Canvas.TextWidth(Stringgrid1.Cells[aCol,aRow])-2,
        rect.Top+2, Stringgrid1.Cells[aCol,aRow]);
end;

procedure TFrmDetails.ToolButton3Click(Sender: TObject);
begin
  Chart1.Print ;
  Messagedlg('打印完毕！',mtinformation,[mbOk],0);
end;

procedure TFrmDetails.ToolButton4Click(Sender: TObject);
begin
  IF chart1.view3doptions.Zoom<300 THEN
    chart1.view3doptions.Zoom := chart1.view3doptions.Zoom+2;
end;

procedure TFrmDetails.ToolButton5Click(Sender: TObject);
begin
  IF chart1.view3doptions.Zoom>1 THEN
    chart1.view3doptions.Zoom := chart1.view3doptions.Zoom-2;
end;

procedure TFrmDetails.ToolButton6Click(Sender: TObject);
begin
  IF chart1.view3doptions.HorizOffset>-500 THEN
    chart1.view3doptions.HorizOffset :=
    chart1.view3doptions.HorizOffset-5;
end;

procedure TFrmDetails.ToolButton7Click(Sender: TObject);
begin
  IF chart1.view3doptions.HorizOffset<500 THEN
    chart1.view3doptions.HorizOffset :=
    chart1.view3doptions.HorizOffset+5;
end;

procedure TFrmDetails.ToolButton11Click(Sender: TObject);
begin
  IF chart1.view3doptions.VertOffset>-500 THEN
    chart1.view3doptions.VertOffset :=
    chart1.view3doptions.VertOffset-5;
end;

procedure TFrmDetails.ToolButton12Click(Sender: TObject);
begin
  IF chart1.view3doptions.VertOffset<500 THEN
    chart1.view3doptions.VertOffset :=
    chart1.view3doptions.VertOffset+5;
end;

procedure TFrmDetails.ToolButton9Click(Sender: TObject);
begin
  IF chart1.Chart3DPercent<96 THEN
    chart1.Chart3DPercent := chart1.Chart3DPercent+5;
end;

procedure TFrmDetails.ToolButton10Click(Sender: TObject);
begin
  IF chart1.Chart3DPercent>5 THEN
    chart1.Chart3DPercent := chart1.Chart3DPercent-5;
end;

procedure TFrmDetails.CheckBox1Click(Sender: TObject);
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

procedure TFrmDetails.SpeedButton1Click(Sender: TObject);
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
  asheet.activeSheet.Name :='准期交货表现明细分析';
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

end.
