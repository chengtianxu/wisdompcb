unit uTotalChart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons,  ComCtrls, TeeProcs,
  TeEngine, Chart, Series, Grids, DBGrids, ExtDlgs;

type
  TfrmTotalChart = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Chart1: TChart;
    Series1: TPieSeries;
    Label6: TLabel;
    ComboBox1: TComboBox;
    Chart2: TChart;
    Label1: TLabel;
    ComboBox2: TComboBox;
    Series2: TPieSeries;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    TabSheet2: TTabSheet;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Chart3: TChart;
    Series3: TBarSeries;
    DBGrid1: TDBGrid;
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    SpeedButton10: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    UpDown1: TUpDown;
    Edit1: TEdit;
    PrintDialog1: TPrintDialog;
    SavePictureDialog1: TSavePictureDialog;
    Label4: TLabel;
    Edit2: TEdit;
    BitBtn6: TBitBtn;
    SpeedButton1: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
  private
    warehouse:string;
    procedure SetKH(); //客户达成率分析
  public
    _DDSQL,_KHSQL,_SOTPSQL,_TTYPSQL:string;
  end;

var
  frmTotalChart: TfrmTotalChart;

implementation

uses uDM,constvar,pick_item_single;

{$R *.dfm}

procedure TfrmTotalChart.FormShow(Sender: TObject);
begin
 warehouse:='';
 DateTimePicker1.Date:=now-30;
 DateTimePicker2.Date:=now;
 SpeedButton1Click(sender);
end;
//订单达成率分析
procedure TfrmTotalChart.SetKH();
begin
  Series3.Clear;
  if dm.AQryKH.RecordCount=0 then exit;
  dm.AQryKH.First;
  while not dm.AQryKH.Eof do
  begin
    if dm.AQryKH.FieldValues['dcy']=null then
      Series3.Add(0,dm.AQryKH.FieldValues['ABBR_NAME'])
    else
      Series3.Add(dm.AQryKH.FieldValues['dcy'],dm.AQryKH.FieldValues['ABBR_NAME']);
    dm.AQryKH.Next;
  end;
end;
//加工类型
procedure TfrmTotalChart.ComboBox1Change(Sender: TObject);
begin
  Series1.Clear;
  if dm.AQrySOTP.RecordCount=0 then exit;
  dm.AQrySOTP.First;
  while not dm.AQrySOTP.Eof do
  begin
    if combobox1.ItemIndex=0 then
      Series1.Add(dm.AQrySOTP.FieldValues['sumNumber'],dm.AQrySOTP.FieldValues['CType'])
    else
      Series1.Add(dm.AQrySOTP.FieldValues['SQ'],dm.AQrySOTP.FieldValues['CType']);
    dm.AQrySOTP.Next;
  end;
  Series1.ValueFormat:='0.00';
  Chart1.LeftAxis.AxisValuesFormat:='0';
  Chart1.LeftAxis.Title.Caption:=combobox1.Text;
  Chart1.Title.Text[0]:=''+combobox1.Text+'分析图';
end;
//样板，量产板类型
procedure TfrmTotalChart.ComboBox2Change(Sender: TObject);
begin
  Series2.Clear;
  if dm.AQryTTYP.RecordCount=0 then exit;
  dm.AQryTTYP.First;
  while not dm.AQryTTYP.Eof do
  begin
    if combobox2.ItemIndex=0 then
      Series2.Add(dm.AQryTTYP.FieldValues['sumNumber'],dm.AQryTTYP.FieldValues['CType'])
    else
      Series2.Add(dm.AQryTTYP.FieldValues['SQ'],dm.AQryTTYP.FieldValues['CType']);
    dm.AQryTTYP.Next;
  end;
  Series2.ValueFormat:='0.00';
  Chart2.LeftAxis.AxisValuesFormat:='0';
  Chart2.LeftAxis.Title.Caption:=combobox2.Text;
  Chart2.Title.Text[0]:=''+combobox2.Text+'分析图';
end;

procedure TfrmTotalChart.SpeedButton1Click(Sender: TObject);
var vstr:string;
begin
 vstr:=' where CONF_DATE>='''+datetostr(DateTimePicker1.Date)+''''+#13
       +' and CONF_DATE<='''+datetostr(DateTimePicker2.Date)+''''+warehouse+#13;
 dm.AQrySOTP.Close ;
 DM.AQrySOTP.SQL.Text:=_SOTPSQL+vstr+' GROUP BY Data0060.so_tp';
 dm.AQrySOTP.Open ;
 ComboBox1Change(Sender);               //加工类型

 dm.AQryTTYP.Close;
 dm.AQryTTYP.SQL.Text:=_TTYPSQL+vstr+' GROUP BY Data0025.TTYPE';
 dm.AQryTTYP.Open ;
 ComboBox2Change(Sender);               //样板，量产板

 vstr:=' where'+#13
        + '(dbo.Data0060.STATUS = 4)'+#13
        +' and Data0060.ENT_DATE>='''+datetostr(DateTimePicker1.Date)+''''+#13
        +' and Data0060.ENT_DATE<='''+datetostr(DateTimePicker2.Date)+''''+#13
        +warehouse+#13
        +' GROUP BY '+#13
        +'Data0060.SALES_ORDER, '+#13
        +'dbo.Data0060.PARTS_ORDERED,'+#13
        +'Data0060.SCH_DATE';
 dm.AQryDD.Close ;
 DM.AQryDD.SQL.Text:=_DDSQL+vstr;
 dm.AQryDD.Open ;               //订单达成率分析

 vstr:=Memo1.lines.text+#13
        +'Data0060.ENT_DATE>='''+datetostr(DateTimePicker1.Date)+''''+#13
        +' and Data0060.ENT_DATE<='''+datetostr(DateTimePicker2.Date)+''''+#13
        +warehouse+#13;
 vstr:=vstr+Memo2.Lines.Text +#13
       +'Data0060.ENT_DATE>='''+datetostr(DateTimePicker1.Date)+''''+#13
       +' and Data0060.ENT_DATE<='''+datetostr(DateTimePicker2.Date)+''''+#13
       +warehouse+#13;
 vstr:=vstr+Memo3.Lines.Text;
 dm.AQryKH.Close ;
 DM.AQryKH.SQL.Text:=vstr;
 dm.AQryKH.Open ;
 dm.AQryKH.Sort:='dcy DESC';
 SetKH();               //客户达成率分析
end;
//
procedure TfrmTotalChart.BitBtn1Click(Sender: TObject);
begin
  close;
end;


procedure TfrmTotalChart.SpeedButton2Click(Sender: TObject);
begin
 Chart3.PreviousPage;
end;

procedure TfrmTotalChart.SpeedButton3Click(Sender: TObject);
begin
 Chart3.NextPage;
end;
//打印图片
procedure TfrmTotalChart.SpeedButton10Click(Sender: TObject);
var
 dd:TSpeedButton;
begin

 dd:=Sender as TSpeedButton;
 if dd.Name='SpeedButton10' then
  if PrintDialog1.Execute then
   Chart3.Print;
 if dd.Name='SpeedButton3' then
  if PrintDialog1.Execute then
   Chart2.Print;
end;
//保存图片
procedure TfrmTotalChart.SpeedButton9Click(Sender: TObject);
var
 dd:TSpeedButton;
begin

 dd:=Sender as TSpeedButton;
 if dd.Name='SpeedButton9' then
  if SavePictureDialog1.Execute then
   chart3.SaveToBitmapFile(SavePictureDialog1.FileName+'.bmp');

 if dd.Name='SpeedButton4' then
  if SavePictureDialog1.Execute then
   chart2.SaveToBitmapFile(SavePictureDialog1.FileName+'.bmp');

end;
//放大
procedure TfrmTotalChart.SpeedButton11Click(Sender: TObject);
begin
 IF Chart3.View3DOptions.Zoom<100 THEN
    Chart3.View3DOptions.Zoom := Chart3.View3DOptions.Zoom+2;

end;
//缩小
procedure TfrmTotalChart.SpeedButton12Click(Sender: TObject);
begin
  IF Chart3.View3DOptions.Zoom>1 THEN
    Chart3.View3DOptions.Zoom := Chart3.View3DOptions.Zoom-2;

end;
//显示柱状图的个数
procedure TfrmTotalChart.Edit1Change(Sender: TObject);
begin
  Chart3.MaxPointsPerPage:=updown1.Position;
end;

procedure TfrmTotalChart.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.AQryDD.SQL.Text);
end;

procedure TfrmTotalChart.BitBtn6Click(Sender: TObject);
var inputvar:PDlgInput;
begin
  frmpick_item_single:=Tfrmpick_item_single.Create(application);
  inputvar.Fields:='warehouse_code/工厂代码/130,warehouse_name/工厂名称/240';
  inputvar.Sqlstr:='select rkey,warehouse_code,warehouse_name from data0015 order by warehouse_code';
  inputvar.KeyField:='warehouse_code';
  inputvar.InPut_value:=edit2.Text;
  inputvar.AdoConn:=dm.conn;
  frmpick_item_single.InitForm_New(inputvar);
  if (frmpick_item_single.ShowModal=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
    edit2.Text:=trim(frmpick_item_single.adsPick.FieldValues['warehouse_code'])
  else edit2.SetFocus;
  frmpick_item_single.adsPick.Close;
  frmpick_item_single.Free;
end;

procedure TfrmTotalChart.Edit2Change(Sender: TObject);
begin
  with dm.aqtmp do
  begin
    sql.Text:='select rkey from data0015 where warehouse_code='''+trim(edit2.Text)+'''';
    open;
    if not isempty then
      warehouse:=' and data0060.ship_reg_tax_id='''+inttostr(fieldvalues['rkey'])+''''
    else warehouse:='';
    close;
  end;
end;

procedure TfrmTotalChart.Edit2Exit(Sender: TObject);
begin
  if trim(edit2.Text)<>'' then
  with dm.aqtmp do
  begin
    sql.Text:='select rkey from data0015 where warehouse_code='''+trim(edit2.Text)+'''';
    open;
    if isempty then
    begin
      showmessage('工厂代码输入错误，请重新输入！');
      edit2.Text:='';
      edit2.SetFocus;
    end;
    close;
  end;
end;

end.
