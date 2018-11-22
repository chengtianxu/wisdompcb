unit reject_custcode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, ADODB, Grids,
  DBGridEh, TeEngine, Series, TeeProcs, Chart, ExtDlgs;

type
  TForm7 = class(TForm)
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
    DBGridEh1: TDBGridEh;
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
    ADOQuery1sqft_total: TFloatField;
    ADOQuery1CUST_CODE: TStringField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1qty_total: TIntegerField;
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
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses common, main;

{$R *.dfm}

procedure TForm7.BitBtn1Click(Sender: TObject);
begin
 self.ADOQuery1.Close;
 close;
end;

procedure TForm7.SpeedButton1Click(Sender: TObject);
begin
if pagecontrol1.ActivePageIndex=0 then
 Export_dbGridEH_to_Excel(dbgrideh1,tabsheet1.Caption)
end;

procedure TForm7.PageControl1Change(Sender: TObject);
begin
if pagecontrol1.ActivePageIndex=1 then
begin
 combobox2.Enabled:=true;
 checkbox1.Enabled:=true;
 speedbutton1.Enabled:=false;
end
else
begin
 combobox2.Enabled:=false;
 checkbox1.Enabled:=false;
 speedbutton1.Enabled:=true;
end;
end;

procedure TForm7.SpeedButton5Click(Sender: TObject);
begin
if self.PrintDialog1.Execute then
self.Chart1.Print;
end;

procedure TForm7.SpeedButton4Click(Sender: TObject);
begin
if self.SavePictureDialog1.Execute then
chart1.SaveToBitmapFile(self.SavePictureDialog1.FileName+'.bmp');
end;

procedure TForm7.SpeedButton6Click(Sender: TObject);
begin
  IF Chart1.view3doptions.Zoom<300 THEN
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom+2;
end;

procedure TForm7.SpeedButton7Click(Sender: TObject);
begin
  IF Chart1.view3doptions.Zoom>1 THEN
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom-2;
end;

procedure TForm7.SpeedButton2Click(Sender: TObject);
begin
chart1.PreviousPage;
end;

procedure TForm7.SpeedButton3Click(Sender: TObject);
begin
chart1.NextPage;
end;

procedure TForm7.Edit2Change(Sender: TObject);
begin
self.Chart1.MaxPointsPerPage:=updown1.Position;
end;

procedure TForm7.CheckBox1Click(Sender: TObject);
begin
chart1.View3D:=self.CheckBox1.Checked;
end;

procedure TForm7.ComboBox2Change(Sender: TObject);
begin
case  combobox2.ItemIndex of

0:
begin
 series1.Clear;
adoquery1.DisableControls;
while not self.adoquery1.Eof do
 begin
  Series1.Add(self.ADOQuery1sqft_total.Value,self.ADOQuery1ABBR_NAME.AsString);
  adoquery1.Next;
 end;
  adoquery1.first;
  self.Series1.ValueFormat:='0.00';
  chart1.LeftAxis.Title.Caption:=combobox2.Text;
  adoquery1.EnableControls;
end;
1:
begin
 series1.Clear;
adoquery1.DisableControls;
while not self.adoquery1.Eof do
 begin
  Series1.Add(self.ADOQuery1qty_total.Value,self.ADOQuery1ABBR_NAME.AsString);
  adoquery1.Next;
 end;
   adoquery1.first;
   self.Series1.ValueFormat:='0';
   chart1.LeftAxis.Title.Caption:=combobox2.Text;
adoquery1.EnableControls;
end;
end;
end;

procedure TForm7.FormActivate(Sender: TObject);
begin
ComboBox2Change(combobox2);
end;

procedure TForm7.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text);
end;

end.
