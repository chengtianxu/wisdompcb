unit detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, ADODB, Grids,
  DBGridEh, TeEngine, Series, TeeProcs, Chart, ExtDlgs;

type
  Tdetail_form = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    ComboBox2: TComboBox;
    CheckBox1: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Eh1: TDBGridEh;
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
    ADOQuery1code: TStringField;
    ADOQuery1name: TStringField;
    ADOQuery1qty_total: TFloatField;
    ADOQuery1sqft_total: TFloatField;
    ADOQuery1sqft_total_bb: TFloatField;
    ADOQuery1top_sqft_total_bb: TFloatField;
    ADOQuery1top_sqft_total: TFloatField;
    chk1: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Eh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chk1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ttype,v_bb:byte;  //分类索引
    ttype_name:string;  //分类名称
  end;

var
  detail_form: Tdetail_form;

implementation

uses common, demo;

{$R *.dfm}

procedure Tdetail_form.FormActivate(Sender: TObject);
begin
  case ttype of  //分类汇总索引
   0:
   begin
     eh1.Columns[0].Title.caption:='日期';
     eh1.Columns[1].Visible:=false;
     chk1.Visible:=false;
   end;
   1:
   begin
     eh1.Columns[0].Title.caption:='月份';
     eh1.Columns[1].Visible:=false;
   end;
   2:
   begin
     eh1.Columns[0].Title.caption:='工序代码';
     eh1.Columns[1].Title.caption:='工序名称';
     chk1.caption:='按工序名称';
   end;
   3:
   begin
     eh1.Columns[0].Title.caption:='缺陷代码';
     eh1.Columns[1].Title.caption:='缺陷名称';
     chk1.caption:='按缺陷名称';
   end;
   4:
   begin
     eh1.Columns[0].Title.caption:='类型代码';
     eh1.Columns[1].Title.caption:='类型名称';
     chk1.caption:='按类型名称';
   end;
   5:
   begin
     eh1.Columns[0].Title.caption:='客户代码';
     eh1.Columns[1].Title.caption:='客户名称';
      chk1.caption:='按客户名称';
   end;
   6:
   begin
     eh1.Columns[0].Title.caption:='本厂编号';
     eh1.Columns[1].Title.caption:='客户型号';
     chk1.caption:='按客户型号';
   end;
   7:  //17-5-19增加按责任工序和缺陷汇总
   begin
     eh1.Columns[0].Title.caption:='工序名称';
     eh1.Columns[1].Title.caption:='缺陷名称';
     chk1.caption:='按缺陷名称';
   end;

  end;

   chk1.Visible:=false;

  if self.v_bb=0 then
   Eh1.Columns[3].FieldName:='sqft_total'
  else
   Eh1.Columns[3].FieldName:='sqft_total_bb';
  //2017-2-17增加顶层面积
  if self.v_bb=0 then
   Eh1.Columns[4].FieldName:='top_sqft_total'
  else
   Eh1.Columns[4].FieldName:='top_sqft_total_bb';

  Tabsheet1.Caption:=ttype_name+'-'+Tabsheet1.Caption;
  chart1.Title.Text.Text:='报废数据对比图('+ttype_name+')';
  ComboBox2Change(combobox2);
end;

procedure Tdetail_form.SpeedButton1Click(Sender: TObject);
begin
  if (not adoquery1.IsEmpty) then
    Export_dbGridEH_to_Excel(eh1,tabsheet1.Caption)
end;

procedure Tdetail_form.PageControl1Change(Sender: TObject);
begin
  if pagecontrol1.ActivePageIndex=1 then
  begin
    combobox2.Enabled:=true;
    checkbox1.Enabled:=true;
    speedbutton1.Enabled:=false;
    if eh1.Columns[1].Visible= true then
     begin
     chk1.Visible:=true;
     chk1.Checked:=false;
     end;
  end
  else begin
    combobox2.Enabled:=false;
    checkbox1.Enabled:=false;
    speedbutton1.Enabled:=true;
    chk1.Visible:=false;
  end;
end;

procedure Tdetail_form.SpeedButton5Click(Sender: TObject);
begin
  if self.PrintDialog1.Execute then
    self.Chart1.Print;
end;

procedure Tdetail_form.SpeedButton4Click(Sender: TObject);
begin
  if self.SavePictureDialog1.Execute then
    chart1.SaveToBitmapFile(self.SavePictureDialog1.FileName+'.bmp');
end;

procedure Tdetail_form.SpeedButton6Click(Sender: TObject);
begin
  if Chart1.view3doptions.Zoom<300 then
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom+2;
end;

procedure Tdetail_form.SpeedButton7Click(Sender: TObject);
begin
  if Chart1.view3doptions.Zoom>1 then
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom-2;
end;

procedure Tdetail_form.SpeedButton2Click(Sender: TObject);
begin
  chart1.PreviousPage;
end;

procedure Tdetail_form.SpeedButton3Click(Sender: TObject);
begin
  chart1.NextPage;
end;

procedure Tdetail_form.Edit2Change(Sender: TObject);
begin
  self.Chart1.MaxPointsPerPage:=updown1.Position;
end;

procedure Tdetail_form.CheckBox1Click(Sender: TObject);
begin
  chart1.View3D:=self.CheckBox1.Checked;
end;

procedure Tdetail_form.ComboBox2Change(Sender: TObject);
begin
 if chk1.Checked=False  then
 begin
   case combobox2.ItemIndex of
    0:                      //按面积
    begin
      series1.Clear;
      adoquery1.DisableControls;
      while not self.adoquery1.Eof do
      begin
        if self.v_bb=0 then
         Series1.Add(self.ADOQuery1sqft_total.Value,self.ADOQuery1code.AsString)
        else
         Series1.Add(self.ADOQuery1sqft_total_bb.Value,self.ADOQuery1code.AsString);
        adoquery1.Next;
      end;
      adoquery1.first;
      self.Series1.ValueFormat:='0.00';
      chart1.LeftAxis.Title.Caption:=combobox2.Text;
      adoquery1.EnableControls;
    end;
    1:                  //按数量
    begin
      series1.Clear;
      adoquery1.DisableControls;
      while not self.adoquery1.Eof do
      begin
        Series1.Add(self.ADOQuery1qty_total.Value,self.ADOQuery1code.AsString);
        adoquery1.Next;
      end;
      adoquery1.first;
      self.Series1.ValueFormat:='0';
      chart1.LeftAxis.Title.Caption:=combobox2.Text;
      adoquery1.EnableControls;
    end;
   end; //end case
 end
 else
  begin
   case combobox2.ItemIndex of
    0:                      //按面积
    begin
      series1.Clear;
      adoquery1.DisableControls;
      while not self.adoquery1.Eof do
      begin
        if self.v_bb=0 then
         Series1.Add(self.ADOQuery1sqft_total.Value,self.ADOQuery1name.AsString)
        else
         Series1.Add(self.ADOQuery1sqft_total_bb.Value,self.ADOQuery1name.AsString);
        adoquery1.Next;
      end;
      adoquery1.first;
      self.Series1.ValueFormat:='0.00';
      chart1.LeftAxis.Title.Caption:=combobox2.Text;
      adoquery1.EnableControls;
    end;
    1:                  //按数量
    begin
      series1.Clear;
      adoquery1.DisableControls;
      while not self.adoquery1.Eof do
      begin
        Series1.Add(self.ADOQuery1qty_total.Value,self.ADOQuery1name.AsString);
        adoquery1.Next;
      end;
      adoquery1.first;
      self.Series1.ValueFormat:='0';
      chart1.LeftAxis.Title.Caption:=combobox2.Text;
      adoquery1.EnableControls;
    end;
   end; //end case
 end
end;

procedure Tdetail_form.Eh1KeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(adoquery1.SQL.Text);
end;

procedure Tdetail_form.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure Tdetail_form.chk1Click(Sender: TObject);
begin
  if chk1.Checked then
 ComboBox2Change(combobox2);
end;

end.
