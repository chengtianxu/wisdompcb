{SELECT TOP 100 PERCENT
CONVERT(datetime, CONVERT(varchar, Data0058.TDATETIME, 101), 101) as reject_date,
       SUM(dbo.Data0058.QTY_REJECT) AS qty_total,
ROUND(SUM(dbo.Data0058.QTY_REJECT * dbo.Data0025.unit_sq), 2) AS sqft_total
FROM dbo.Data0058 INNER JOIN
      dbo.Data0039 ON dbo.Data0058.REJECT_PTR = dbo.Data0039.RKEY INNER JOIN
      dbo.Data0034 ON
      dbo.Data0058.RESP_DEPT_PTR = dbo.Data0034.RKEY INNER JOIN
      dbo.Data0006 ON dbo.Data0058.WO_PTR = dbo.Data0006.RKEY INNER JOIN
      dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RKEY INNER JOIN
      dbo.Data0010 ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY INNER JOIN
      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY
WHERE (dbo.Data0058.TTYPE = 0) AND
      (dbo.Data0058.TDATETIME >= :dtpk1) AND
      (dbo.Data0058.TDATETIME <= :dtpk2)
GROUP BY CONVERT(datetime, CONVERT(varchar, Data0058.TDATETIME, 101), 101)
ORDER BY CONVERT(datetime, CONVERT(varchar, Data0058.TDATETIME, 101), 101)
}

unit reject_day;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, ADODB, Grids,
  DBGridEh, TeEngine, Series, TeeProcs, Chart, ExtDlgs;

type
  TForm2 = class(TForm)
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
    ADOQuery1reject_date: TDateTimeField;
    ADOQuery1sqft_total: TFloatField;
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
  Form2: TForm2;

implementation

uses main,common;

{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
 self.ADOQuery1.Close;
 close;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
if pagecontrol1.ActivePageIndex=0 then
 Export_dbGridEH_to_Excel(dbgrideh1,tabsheet1.Caption)
end;

procedure TForm2.PageControl1Change(Sender: TObject);
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

procedure TForm2.SpeedButton5Click(Sender: TObject);
begin
if self.PrintDialog1.Execute then
self.Chart1.Print;
end;

procedure TForm2.SpeedButton4Click(Sender: TObject);
begin
if self.SavePictureDialog1.Execute then
chart1.SaveToBitmapFile(self.SavePictureDialog1.FileName+'.bmp');
end;

procedure TForm2.SpeedButton6Click(Sender: TObject);
begin
  IF Chart1.view3doptions.Zoom<300 THEN
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom+2;
end;

procedure TForm2.SpeedButton7Click(Sender: TObject);
begin
  IF Chart1.view3doptions.Zoom>1 THEN
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom-2;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
chart1.PreviousPage;
end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
begin
chart1.NextPage;
end;

procedure TForm2.Edit2Change(Sender: TObject);
begin
self.Chart1.MaxPointsPerPage:=updown1.Position;
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
chart1.View3D:=self.CheckBox1.Checked;
end;

procedure TForm2.ComboBox2Change(Sender: TObject);
begin
case  combobox2.ItemIndex of

0:
begin
 series1.Clear;
adoquery1.DisableControls;
while not self.adoquery1.Eof do
 begin
  Series1.Add(self.ADOQuery1sqft_total.Value,self.ADOQuery1reject_date.AsString);
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
  Series1.Add(self.ADOQuery1qty_total.Value,self.ADOQuery1reject_date.AsString);
  adoquery1.Next;
 end;
   adoquery1.first;
   self.Series1.ValueFormat:='0';
   chart1.LeftAxis.Title.Caption:=combobox2.Text;
adoquery1.EnableControls;
end;
end;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
ComboBox2Change(combobox2);
end;

procedure TForm2.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(adoquery1.SQL.Text);
end;

end.
