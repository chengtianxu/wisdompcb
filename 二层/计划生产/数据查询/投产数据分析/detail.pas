unit detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh,
  TeEngine, Series, TeeProcs, Chart, ExtDlgs;

type
  Tdetail_form = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    CheckBox1: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ComboBox1: TComboBox;
    Label4: TLabel;
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
    PrintDialog1: TPrintDialog;
    SavePictureDialog1: TSavePictureDialog;
    Eh1: TDBGridEh;
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Eh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure getdata(ttype:byte);
  public
    { Public declarations }
  end;

var
  detail_form: Tdetail_form;

implementation
uses damo,common,condition;

{$R *.dfm}

procedure Tdetail_form.getdata(ttype:byte);
var total:real;  //汇总数
begin
 case combobox1.ItemIndex of
  0:
  begin
    series1.Clear;
    dm.aq492.DisableControls;
    while not dm.aq492.Eof do
    begin
      Series1.Add(dm.aq492.Fields[2].Value,dm.aq492.Fields[0].AsString);
      dm.aq492.Next;
    end;
    dm.aq492.first;
    self.Series1.ValueFormat:='#,###';
    chart1.LeftAxis.Title.Caption:=combobox1.Text;
    dm.aq492.EnableControls;
  end;
  1:
  begin
    series1.Clear;
    dm.aq492.DisableControls;
    while not dm.aq492.Eof do
    begin
      Series1.Add(dm.aq492.Fields[3].Value,dm.aq492.Fields[0].AsString);
      dm.aq492.Next;
    end;
    dm.aq492.first;
    self.Series1.ValueFormat:='#,##0.00';
    chart1.LeftAxis.Title.Caption:=combobox1.Text;
    dm.aq492.EnableControls;
  end;
  2:
  begin
    series1.Clear;
    dm.aq492.DisableControls;
    while not dm.aq492.Eof do
    begin
      Series1.Add(dm.aq492.Fields[4].Value,dm.aq492.Fields[0].AsString);
      dm.aq492.Next;
    end;
    dm.aq492.first;
    self.Series1.ValueFormat:='#,###';
    chart1.LeftAxis.Title.Caption:=combobox1.Text;
    dm.aq492.EnableControls;
  end;
  3:
  begin
    series1.Clear;
    dm.aq492.DisableControls;
    while not dm.aq492.Eof do
    begin
      Series1.Add(dm.aq492.Fields[5].Value,dm.aq492.Fields[0].AsString);
      dm.aq492.Next;
    end;
    dm.aq492.first;
    self.Series1.ValueFormat:='#,##0.00';
    chart1.LeftAxis.Title.Caption:=combobox1.Text;
    dm.aq492.EnableControls;
  end;





  end;


{  dm.aq492.First;
  if ttype=0 then //按面积
    total:=strtofloat(eh1.getfootervalue(0,eh1.Columns[3]))
  else total:=strtofloat(eh1.getfootervalue(0,eh1.Columns[2]));
  chart1.LeftAxis.Title.Caption:=combobox1.Text;
  series1.Clear;
  with dm.aq492 do
   while not Eof do
   begin
    if ttype=0 then  //按面积(统一按两位小数计算)
      if condition_form.RadioGroup2.ItemIndex in [2,3,4] then  //按厂编,月份,日期
        series1.Add(100*strtofloat(format('%.2f',[Fields[3].asfloat]))/total,Fields[0].AsString) //算出每组数据所占的百分比
      else series1.Add(100*strtofloat(format('%.2f',[Fields[3].asfloat]))/total,Fields[1].AsString)
    else  //按pcs
      if condition_form.RadioGroup2.ItemIndex in [2,3,4] then
        series1.Add(100*strtofloat(format('%.2f',[Fields[2].asfloat]))/total,Fields[0].AsString)
      else series1.Add(100*strtofloat(format('%.2f',[Fields[2].asfloat]))/total,Fields[1].AsString);
    next;
   end;
  dm.aq492.First; }
end;

procedure Tdetail_form.ComboBox1Change(Sender: TObject);
begin
  getdata(combobox1.ItemIndex);
end;

procedure Tdetail_form.CheckBox1Click(Sender: TObject);
begin
  chart1.View3D:=checkbox1.Checked;
end;

procedure Tdetail_form.Edit2Change(Sender: TObject);
begin
  chart1.MaxPointsPerPage:=updown1.Position;
end;

procedure Tdetail_form.SpeedButton3Click(Sender: TObject);
begin
  chart1.NextPage;
end;

procedure Tdetail_form.SpeedButton2Click(Sender: TObject);
begin
  chart1.PreviousPage;
end;

procedure Tdetail_form.SpeedButton7Click(Sender: TObject);
begin
  if Chart1.view3doptions.Zoom>1 THEN
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom-2;
end;

procedure Tdetail_form.SpeedButton6Click(Sender: TObject);
begin
  if Chart1.view3doptions.Zoom<300 THEN
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom+2;
end;

procedure Tdetail_form.SpeedButton4Click(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
    chart1.SaveToBitmapFile(self.SavePictureDialog1.FileName+'.bmp');
end;

procedure Tdetail_form.SpeedButton5Click(Sender: TObject);
begin
  if PrintDialog1.Execute then
    Chart1.Print;
end;

procedure Tdetail_form.PageControl1Change(Sender: TObject);
begin
 if pagecontrol1.ActivePageIndex=1 then
 begin
   checkbox1.Enabled:=true;
   combobox1.Enabled:=true;
   speedbutton1.Enabled:=false;
 end
 else begin
   checkbox1.Enabled:=false;
   combobox1.Enabled:=false;
   speedbutton1.Enabled:=true;
 end;
end;

procedure Tdetail_form.BitBtn1Click(Sender: TObject);
begin
  dm.aq492.Close;
  close;
end;

procedure Tdetail_form.SpeedButton1Click(Sender: TObject);
begin   //导出到excel
  if not dm.aq492.IsEmpty then
    Export_dbGridEH_to_Excel(eh1,tabsheet1.Caption);
end;

procedure Tdetail_form.FormShow(Sender: TObject);
begin
 case condition_form.RadioGroup2.ItemIndex of
   0:
   begin
    eh1.Columns[0].Title.caption:='客户代码';
    eh1.Columns[1].Title.caption:='客户名称';
   end;
   1:
   begin
    eh1.Columns[0].Title.caption:='类别代码';
    eh1.Columns[1].Title.caption:='产品类别名称';
   end;
   2:
   begin
    eh1.Columns[0].Title.caption:='本厂编号';
    eh1.Columns[1].Title.caption:='客户型号';
   end;
   3:eh1.Columns[0].Title.caption:='月份';
   4:eh1.Columns[0].Title.caption:='日期';
 end; //完成case
  if condition_form.RadioGroup2.ItemIndex in [3,4] then
    eh1.Columns[1].Visible:=false; //如果按月份和日期统计则隐藏首列
  TabSheet1.Caption:=condition_form.RadioGroup2.Items[condition_form.RadioGroup2.itemindex]+TabSheet1.Caption;
  chart1.Title.Text.Text:='汇总数据对比图('+condition_form.RadioGroup2.Items[condition_form.RadioGroup2.itemindex]+')';
  getdata(combobox1.ItemIndex);  //获取数据
end;

procedure Tdetail_form.Eh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
   showmessage(dm.aq492.SQL.Text);
end;

end.
