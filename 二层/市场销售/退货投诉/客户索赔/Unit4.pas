unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons, DateUtils, ComCtrls, ExtCtrls, TeEngine, Series,
  TeeProcs, Chart, DBGridEh, ExtDlgs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdFTP;

type
  TForm4 = class(TForm)
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    DT1: TDateTimePicker;
    Label1: TLabel;
    DT2: TDateTimePicker;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBGridEh1: TDBGridEh;
    Chart1: TChart;
    Edit2: TEdit;
    Series1: TBarSeries;
    BitBtn2: TBitBtn;
    SpeedButton5: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Edit1: TEdit;
    UpDown2: TUpDown;
    PrintDialog1: TPrintDialog;
    SavePictureDialog1: TSavePictureDialog;
    IdFTP1: TIdFTP;
    ComboBox1: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

uses Udemo,common;

{$R *.dfm}

procedure TForm4.BitBtn1Click(Sender: TObject);

var i:Integer;
   pcs,area:Double;
   status:string;
begin
 case ComboBox1.ItemIndex of
  0:status:='2';
  1:status:='3';
  2:status:='2,3';
 end;
 case RadioGroup1.ItemIndex of
  0:
  begin
   DM.ADOhz.Close;
   DM.ADOhz.SQL.Text:= 'SELECT dbo.Data0010.ABBR_NAME AS 客户, SUM(dbo.data0597.Number) AS 数量, SUM(dbo.data0597.spmoney) AS 金额 '+
                     'FROM dbo.data0597 INNER JOIN  dbo.Data0010 ON dbo.data0597.rkey10 = dbo.Data0010.RKEY '+
                     'WHERE (data0597.status in ('+status+')) AND  (dbo.data0597.submit_date > '+ QuotedStr(FormatDateTime('YYYY/MM/DD',DT1.Date))+' ) AND (dbo.data0597.submit_date < '+ QuotedStr(FormatDateTime('YYYY/MM/DD',DT2.Date))+') '+
                     'GROUP BY dbo.Data0010.ABBR_NAME';

   DM.ADOhz.Open;
   series1.Clear;
   dm.ADOhz.DisableControls;
   while not dm.ADOhz.Eof do
   begin
    Series1.Add(dm.ADOhz.FieldValues['金额'],dm.ADOhz.FieldValues['客户']);
    dm.ADOhz.Next;
   end;
   dm.ADOhz.first;
   self.Series1.ValueFormat:='#,###';
   chart1.LeftAxis.Title.Caption:='金额';
   dm.ADOhz.EnableControls;
  end;
  1:
  begin
    DM.ADOhz.Close;
   DM.ADOhz.SQL.Text:='SELECT dbo.data0609.Number25 as 本厂编号,SUM(dbo.data0609.Number) AS 数量, SUM(dbo.data0609.spUnitPrice) AS 金额  '+
                      'FROM dbo.data0597 INNER JOIN dbo.data0609 ON dbo.data0597.rkey = dbo.data0609.rkey597 '+
                      'WHERE (data0597.status in ('+status+')) AND  (dbo.data0597.submit_date > '+ QuotedStr(FormatDateTime('YYYY/MM/DD',DT1.Date))+' ) AND (dbo.data0597.submit_date < '+ QuotedStr(FormatDateTime('YYYY/MM/DD',DT2.Date))+') '+
                      'GROUP BY dbo.data0609.Number25 ';

  DM.ADOhz.open;
   series1.Clear;
   dm.ADOhz.DisableControls;
   while not dm.ADOhz.Eof do
   begin
    Series1.Add(dm.ADOhz.FieldValues['金额'],dm.ADOhz.FieldValues['本厂编号']);
    dm.ADOhz.Next;
   end;
   dm.ADOhz.first;
   self.Series1.ValueFormat:='#,###';
   chart1.LeftAxis.Title.Caption:='金额';
   dm.ADOhz.EnableControls;
  end;
  3:
  begin
    DM.ADOhz.Close;
   DM.ADOhz.SQL.Text:='SELECT  convert(varchar,data0597.submit_date,23) as 日期, sum(dbo.data0597.Number) as 数量, ' +
                      'sum(dbo.data0597.spmoney) as 金额 FROM data0597 '+
                      'WHERE (data0597.status in ('+status+')) AND  (dbo.data0597.submit_date > '+ QuotedStr(FormatDateTime('YYYY/MM/DD',DT1.Date))+' ) AND (dbo.data0597.submit_date < '+ QuotedStr(FormatDateTime('YYYY/MM/DD',DT2.Date))+') '+
                      'GROUP BY convert(varchar,data0597.submit_date,23)';

  DM.ADOhz.open;
   series1.Clear;
   dm.ADOhz.DisableControls;
   while not dm.ADOhz.Eof do
   begin
    Series1.Add(dm.ADOhz.FieldValues['金额'],dm.ADOhz.FieldValues['日期']+' 日');
    dm.ADOhz.Next;
   end;
   dm.ADOhz.first;
   self.Series1.ValueFormat:='#,###';
   chart1.LeftAxis.Title.Caption:='金额';
   dm.ADOhz.EnableControls;
  end;
  2:
  begin
   DM.ADOhz.Close;
   DM.ADOhz.SQL.Text:='SELECT  month(data0597.submit_date)as 月份,   sum(dbo.data0597.Number) as 数量,  sum(dbo.data0597.spmoney) as 金额 '+
                      'FROM data0597 '+
                      'WHERE (data0597.status in ('+status+')) AND  (dbo.data0597.submit_date > '+ QuotedStr(FormatDateTime('YYYY/MM/DD',DT1.Date))+' ) AND (dbo.data0597.submit_date < '+ QuotedStr(FormatDateTime('YYYY/MM/DD',DT2.Date))+') '+
                      'GROUP BY month(data0597.submit_date)';
                      
  DM.ADOhz.open;
   series1.Clear;
   dm.ADOhz.DisableControls;
   while not dm.ADOhz.Eof do
   begin
    Series1.Add(dm.ADOhz.FieldValues['金额'],dm.ADOhz.FieldByName('月份').AsString+'月');
    dm.ADOhz.Next;
   end;
   dm.ADOhz.first;
   self.Series1.ValueFormat:='#,###';
   chart1.LeftAxis.Title.Caption:='金额';
   dm.ADOhz.EnableControls;
  end;

 end;
  DBGridEh1.Columns.Items[0].Width:=120;
  DBGridEh1.Columns.Items[1].Width:=100;
  DBGridEh1.Columns.Items[2].Width:=200;
//--------------求和----------------------
 while not dm.ADOhz.Eof do
 begin
  pcs:=pcs+dm.ADOhz.FieldValues['数量'];
  area:=area+dm.ADOhz.FieldValues['金额'];
  dm.ADOhz.Next;
 end;
 DBGridEh1.FooterRowCount:=1;//新添加一行脚注
 DBGridEh1.SumList.Active:=true;
 for i:=0 to DBGridEh1.Columns.Count-1 do
 begin
  DBGridEh1.Columns[i].Footer.FieldName:=DBGridEh1.Columns[i].Title.Caption;
  DBGridEh1.FooterColor:= clBtnFace;
  DBGridEh1.Columns[0].Footer.ValueType:=fvtStaticText;
  DBGridEh1.Columns[0].Footer.Value:='数量/金额';
  DBGridEh1.Columns[0].Footer.Alignment:=tacenter;

  DBGridEh1.Columns[1].Footer.ValueType:=fvtStaticText;
  DBGridEh1.Columns[2].Footer.ValueType:=fvtStaticText;


  DBGridEh1.Columns[1].Footer.Value:=FloatToStr(pcs);
  DBGridEh1.Columns[2].Footer.Value:=FloatToStr(area);

 end;


  end;

procedure TForm4.FormShow(Sender: TObject);
begin

 radioGroup1.ItemIndex:=0;
 dt1.Date:=now-dayof(now)+1; //当前月的第一天
 dt2.Date:=now+1; //
 ComboBox1.ItemIndex:=1;
end;



procedure TForm4.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
 showmessage(dm.ADOhz.SQL.Text);
end;

procedure TForm4.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
   if gdSelected in State then
    Exit;
  if DM.ADOhz.RecNo mod 2 = 0 then
    DBGridEh1.Canvas.Brush.Color := clInfoBk
  else
    DBGridEh1.Canvas.Brush.Color := RGB(191, 255, 223);
    DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    DBGridEh1.Canvas.Pen.Color := $00C08000;
    DBGridEh1.Canvas.MoveTo(Rect.Left, Rect.Bottom);
    DBGridEh1.Canvas.LineTo(Rect.Right, Rect.Bottom);
    DBGridEh1.Canvas.MoveTo(Rect.Right, Rect.Top);
    DBGridEh1.Canvas.LineTo(Rect.Right, Rect.Bottom);
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
  if DM.adohz.IsEmpty then exit;
 Export_dbGridEH_to_Excel(DBGridEh1,'品质索赔申请')
end;

procedure TForm4.SpeedButton5Click(Sender: TObject);
begin
   if PrintDialog1.Execute then
    Chart1.Print;
end;

procedure TForm4.SpeedButton4Click(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
    chart1.SaveToBitmapFile(self.SavePictureDialog1.FileName+'.bmp');
end;

procedure TForm4.SpeedButton6Click(Sender: TObject);
begin
  if Chart1.view3doptions.Zoom<300 THEN
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom+2;
end;

procedure TForm4.SpeedButton7Click(Sender: TObject);
begin
   if Chart1.view3doptions.Zoom>1 THEN
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom-2;
end;

procedure TForm4.SpeedButton2Click(Sender: TObject);
begin
 chart1.PreviousPage;
end;

procedure TForm4.SpeedButton3Click(Sender: TObject);
begin
 chart1.NextPage;
end;

procedure TForm4.Edit1Change(Sender: TObject);
begin
chart1.MaxPointsPerPage:=updown2.Position;
end;

end.
