unit sales_customer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGridEh, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, ExtDlgs, TeEngine, Series, TeeProcs, Chart;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    ComboBox2: TComboBox;
    CheckBox1: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBGridEh1: TDBGridEh;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    DBGridEh2: TDBGridEh;
    DataSource2: TDataSource;
    ADOQuery1CUST_CODE: TStringField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1order_qty: TFloatField;
    ADOQuery1sqft_qty: TFloatField;
    ADOQuery1amount_total: TFloatField;
    ADOQuery2CUST_CODE: TStringField;
    ADOQuery2ABBR_NAME: TStringField;
    ADOQuery2order_qty: TFloatField;
    ADOQuery2sqft_qty: TFloatField;
    ADOQuery2amount_total: TFloatField;
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
    ADOQuery1MANU_PART_NUMBER: TStringField;
    ADOQuery1MANU_PART_DESC: TStringField;
    ADOQuery3: TADOQuery;
    ADOQuery3CUST_CODE: TStringField;
    ADOQuery3ABBR_NAME: TStringField;
    ADOQuery3MANU_PART_NUMBER: TStringField;
    ADOQuery3MANU_PART_DESC: TStringField;
    ADOQuery3order_qty: TIntegerField;
    ADOQuery3sqft_qty: TFloatField;
    ADOQuery3amount_total: TFloatField;
    ADOQuery4: TADOQuery;
    ADOQuery4CUST_CODE: TStringField;
    ADOQuery4ABBR_NAME: TStringField;
    ADOQuery4order_qty: TIntegerField;
    ADOQuery4sqft_qty: TFloatField;
    ADOQuery4amount_total: TFloatField;
    procedure PageControl1Change(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses damo,common, main;

{$R *.dfm}

procedure TForm3.PageControl1Change(Sender: TObject);
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

procedure TForm3.SpeedButton5Click(Sender: TObject);
begin
if self.PrintDialog1.Execute then
self.Chart1.Print;
end;

procedure TForm3.SpeedButton4Click(Sender: TObject);
begin
if self.SavePictureDialog1.Execute then
chart1.SaveToBitmapFile(self.SavePictureDialog1.FileName+'.bmp');
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
 close;
end;

procedure TForm3.SpeedButton6Click(Sender: TObject);
begin
  IF Chart1.view3doptions.Zoom<300 THEN
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom+2;
end;

procedure TForm3.SpeedButton7Click(Sender: TObject);
begin
  IF Chart1.view3doptions.Zoom>1 THEN
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom-2;
end;

procedure TForm3.SpeedButton2Click(Sender: TObject);
begin
chart1.PreviousPage;
end;

procedure TForm3.SpeedButton3Click(Sender: TObject);
begin
chart1.NextPage;
end;

procedure TForm3.Edit2Change(Sender: TObject);
begin
self.Chart1.MaxPointsPerPage:=updown1.Position;
end;

procedure TForm3.CheckBox1Click(Sender: TObject);
begin
chart1.View3D:=self.CheckBox1.Checked;
end;

procedure TForm3.ComboBox2Change(Sender: TObject);
begin
if form1.ComboBox1.ItemIndex=0 then
case  combobox2.ItemIndex of
 0:
 begin
 series1.Clear;
adoquery2.DisableControls;
while not self.adoquery2.Eof do
 begin
  Series1.Add(self.ADOQuery2amount_total.Value,self.ADOQuery2ABBR_NAME.Value);
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
while not self.adoquery2.Eof do
 begin
  Series1.Add(self.ADOQuery2sqft_qty.Value,self.ADOQuery2ABBR_NAME.Value);
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
  Series1.Add(self.ADOQuery2order_qty.Value,self.ADOQuery2ABBR_NAME.Value);
  adoquery2.Next;
 end;
   adoquery2.first;
   self.Series1.ValueFormat:='0';
   chart1.LeftAxis.Title.Caption:=combobox2.Text;
adoquery2.EnableControls;
end;
end  //endcase
else
case  combobox2.ItemIndex of
 0:
 begin
 series1.Clear;
adoquery4.DisableControls;
while not self.adoquery4.Eof do
 begin
  Series1.Add(self.ADOQuery4amount_total.Value,self.ADOQuery4ABBR_NAME.Value);
  adoquery4.Next;
 end;
adoquery4.first;
   self.Series1.ValueFormat:='0.00';
   chart1.LeftAxis.Title.Caption:=combobox2.Text;
adoquery4.EnableControls;
 end;
1:
begin
 series1.Clear;
adoquery4.DisableControls;
while not self.adoquery4.Eof do
 begin
  Series1.Add(self.ADOQuery4sqft_qty.Value,self.ADOQuery4ABBR_NAME.Value);
  adoquery4.Next;
 end;
  adoquery4.first;
  self.Series1.ValueFormat:='0.000';
  chart1.LeftAxis.Title.Caption:=combobox2.Text;
  adoquery4.EnableControls;
end;
2:
begin
 series1.Clear;
adoquery4.DisableControls;
while not self.adoquery4.Eof do
 begin
  Series1.Add(self.ADOQuery4order_qty.Value,self.ADOQuery4ABBR_NAME.Value);
  adoquery4.Next;
 end;
   adoquery4.first;
   self.Series1.ValueFormat:='0';
   chart1.LeftAxis.Title.Caption:=combobox2.Text;
adoquery4.EnableControls;
end;
end; //endcase

end;

procedure TForm3.FormActivate(Sender: TObject);
begin
ComboBox2Change(combobox2);
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
if pagecontrol1.ActivePageIndex=0 then
 Export_dbGridEH_to_Excel(dbgrideh1,tabsheet1.Caption)
else
 if pagecontrol1.ActivePageIndex=1 then
  Export_dbGridEH_to_Excel(dbgrideh2,tabsheet2.Caption);
end;

procedure TForm3.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if form1.ComboBox1.ItemIndex=0 then
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text)
 else
else
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(adoquery2.SQL.Text)
end;

procedure TForm3.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if form1.ComboBox1.ItemIndex=0 then
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(adoquery2.SQL.Text)
 else
else 
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(adoquery4.SQL.Text)

end;

end.
