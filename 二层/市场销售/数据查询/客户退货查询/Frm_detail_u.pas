unit Frm_detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, ADODB, Grids,
  DBGridEh, TeEngine, Series, TeeProcs, Chart, ExtDlgs;

type
  TFrm_detail = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
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
    Series2: TBarSeries;
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
    procedure Eh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private

  public
    ttype:byte;         //分类索引
    ttype_name:string;  //分类名称
  end;

var
  Frm_detail: TFrm_detail;

implementation

uses common;

{$R *.dfm}

procedure TFrm_detail.SpeedButton1Click(Sender: TObject);
begin
  if (not adoquery1.IsEmpty) then Export_dbGridEH_to_Excel(eh1,tabsheet1.Caption)
end;

procedure TFrm_detail.PageControl1Change(Sender: TObject);
begin
  if pagecontrol1.ActivePageIndex=1 then
  begin
    checkbox1.Enabled:=true;
    speedbutton1.Enabled:=false;
  end else begin
    checkbox1.Enabled:=false;
    speedbutton1.Enabled:=true;
  end;
end;

procedure TFrm_detail.SpeedButton5Click(Sender: TObject);
begin
  if PrintDialog1.Execute then   Chart1.Print;
end;

procedure TFrm_detail.SpeedButton4Click(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
    chart1.SaveToBitmapFile(SavePictureDialog1.FileName+'.bmp');
end;

procedure TFrm_detail.SpeedButton6Click(Sender: TObject);
begin
  if Chart1.view3doptions.Zoom<300 then
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom+2;
end;

procedure TFrm_detail.SpeedButton7Click(Sender: TObject);
begin
  if Chart1.view3doptions.Zoom>1 then
    Chart1.view3doptions.Zoom := Chart1.view3doptions.Zoom-2;
end;

procedure TFrm_detail.SpeedButton2Click(Sender: TObject);
begin
  chart1.PreviousPage;
end;

procedure TFrm_detail.SpeedButton3Click(Sender: TObject);
begin
  chart1.NextPage;
end;

procedure TFrm_detail.Edit2Change(Sender: TObject);
begin
  Chart1.MaxPointsPerPage:=updown1.Position;
end;

procedure TFrm_detail.CheckBox1Click(Sender: TObject);
begin
  chart1.View3D:=CheckBox1.Checked;
end;

procedure TFrm_detail.Eh1KeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then showmessage(adoquery1.SQL.Text);
end;

procedure TFrm_detail.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_detail.FormShow(Sender: TObject);
var
  i:Integer;
begin
  case ttype of
   0:
   begin
     ADOQuery1.Fields[0].DisplayLabel:='日期';
     ADOQuery1.Fields[1].DisplayLabel:='数量';
     ADOQuery1.Fields[2].DisplayLabel:='面积';
   end;
   1:
   begin
     ADOQuery1.Fields[0].DisplayLabel:='月份';
     ADOQuery1.Fields[1].DisplayLabel:='数量';
     ADOQuery1.Fields[2].DisplayLabel:='面积';
   end;
   2:
   begin
     ADOQuery1.Fields[0].DisplayLabel:='客户代码';
     ADOQuery1.Fields[1].DisplayLabel:='客户名称';
     ADOQuery1.Fields[2].DisplayLabel:='数量';
     ADOQuery1.Fields[3].DisplayLabel:='面积';
   end;
   3:
   begin
     ADOQuery1.Fields[0].DisplayLabel:='本厂编号';
     ADOQuery1.Fields[1].DisplayLabel:='数量';
     ADOQuery1.Fields[2].DisplayLabel:='面积';
   end;
   4:
   begin
     ADOQuery1.Fields[0].DisplayLabel:='产品类型代码';
     ADOQuery1.Fields[1].DisplayLabel:='产品类型名称';
     ADOQuery1.Fields[2].DisplayLabel:='数量';
     ADOQuery1.Fields[3].DisplayLabel:='面积';
   end;  
  end;
  Eh1.Columns[0].Footer.valuetype:=fvtStaticText;
  Eh1.Columns[0].Footer.value:='合 计';
  case Self.ttype of
    2,4:for i:=2 to 3 do
      begin
        Eh1.Columns[i].Footer.valuetype:=fvtSum;
        Eh1.Columns[i].Footer.fieldname:=ADOQuery1.Fields[i].FullName;
      end ;
  else ;
    for i:=1 to 2 do
    begin
      Eh1.Columns[i].Footer.valuetype:=fvtSum;
      Eh1.Columns[i].Footer.fieldname:=ADOQuery1.Fields[i].FullName;
    end;  
  end;

  Tabsheet1.Caption:=ttype_name+'-'+Tabsheet1.Caption;
  chart1.Title.Text.Text:='汇总数据对比图('+ttype_name+')';
  series1.Clear;
  adoquery1.DisableControls;
  while not self.adoquery1.Eof do
  begin
    case ttype of
      2,4:
      begin
        Series1.Add(ADOQuery1.Fields[2].Value,ADOQuery1.Fields[1].AsString);
        Series2.Add(ADOQuery1.Fields[3].Value,ADOQuery1.Fields[1].AsString);
      end;
    else
      Series1.Add(ADOQuery1.Fields[1].Value,ADOQuery1.Fields[0].AsString);
      Series2.Add(ADOQuery1.Fields[2].Value,ADOQuery1.Fields[0].AsString);
    end;
    adoquery1.Next;
  end;
  adoquery1.first;
  self.Series1.ValueFormat:='#,##0';
  Self.Series2.ValueFormat:='#,##0.######';
  chart1.LeftAxis.Title.Caption:=ttype_name;
  adoquery1.EnableControls;
end;

end.
