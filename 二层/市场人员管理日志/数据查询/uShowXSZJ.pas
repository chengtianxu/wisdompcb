unit uShowXSZJ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ExtCtrls, ComCtrls, Buttons;

type
  TfrmShowXSZJ = class(TForm)
    Label9: TLabel;
    Label12: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BQDD: TEdit;
    BQSK: TEdit;
    BQTS: TEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    BQYP: TEdit;
    YPZLC: TEdit;
    YZLBL: TEdit;
    YPSF: TEdit;
    YPSFJE: TEdit;
    YPMS: TEdit;
    YPMSJE: TEdit;
    YPGZ: TEdit;
    YPGZJE: TEdit;
    YPKZLC: TEdit;
    GroupBox3: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    BQKM: TEdit;
    KMZLC: TEdit;
    KMQR: TEdit;
    KMSF: TEdit;
    KMSFJE: TEdit;
    KMMS: TEdit;
    KMMSJE: TEdit;
    KMGZ: TEdit;
    KMGZJE: TEdit;
    GroupBox4: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    BQCSJ: TEdit;
    CSJZLC: TEdit;
    CSJQR: TEdit;
    CSJSF: TEdit;
    CSJSFJE: TEdit;
    CSJMS: TEdit;
    CSJMSJE: TEdit;
    CSJGZ: TEdit;
    CSJGZJE: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    CJRQ: TDateTimePicker;
    QJStatus: TRadioGroup;
    ZJND: TSpinEdit;
    ZJQJ: TSpinEdit;
    Note: TMemo;
    ZWPJ: TRadioGroup;
    ZJID: TEdit;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    Edit3: TEdit;
    StatusBar1: TStatusBar;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
   procedure Get712();
  public
    { Public declarations }
  end;

var
  frmShowXSZJ: TfrmShowXSZJ;

implementation

uses uDM;

{$R *.dfm}
procedure TfrmShowXSZJ.Get712();
var
 i,j,f:integer;
begin
 for i:=0 to ControlCount-1 do
  begin
   if Controls[i].ClassName ='TGroupBox' then
    begin
     for j:=0 to TGroupBox(Controls[i]).ControlCount-1 do
       if TGroupBox(Controls[i]).Controls[j].ClassName ='TEdit' then
        for f:=0 to dm.AQery712.FieldCount-1 do
         if TGroupBox(Controls[i]).Controls[j].Name =dm.AQery712.Fields[f].FieldName then
          (TGroupBox(Controls[i]).Controls[j] as TEdit).Text:=dm.AQery712.Fields[f].Value;
    end;
   if Controls[i].ClassName ='TMemo' then
    for j:=0 to dm.AQery712.FieldCount-1 do
     if Controls[i].Name =dm.AQery712.Fields[j].FieldName then
      (Controls[i] as TMemo).Lines.Text:=dm.AQery712.Fields[j].Value;
   if Controls[i].ClassName ='TDateTimePicker' then
    for j:=0 to dm.AQery712.FieldCount-1 do
     if Controls[i].Name =dm.AQery712.Fields[j].FieldName then
      (Controls[i] as TDateTimePicker).Date :=dm.AQery712.Fields[j].Value;
   if Controls[i].ClassName ='TRadioGroup' then
    for j:=0 to dm.AQery712.FieldCount-1 do
     if Controls[i].Name =dm.AQery712.Fields[j].FieldName then
      (Controls[i] as TRadioGroup).ItemIndex :=dm.AQery712.Fields[j].Value;
   if Controls[i].ClassName ='TSpinEdit' then
    for j:=0 to dm.AQery712.FieldCount-1 do
     if Controls[i].Name =dm.AQery712.Fields[j].FieldName then
      (Controls[i] as TSpinEdit).Value :=dm.AQery712.Fields[j].Value;
  end; //end for
 //总结ID
 ZJID.Text:=dm.AQery712.FieldValues['ZJID'];
 //销售目标
 Edit1.Text:=dm.AQery712.FieldByName('MJHJE').AsString;

 //创建人
 dm.AQery5.Close;
 dm.AQery5.Parameters.ParamValues['rky']:=dm.AQery712.FieldByName('USEPTR').Value;
 dm.AQery5.Open;

 edit2.Text:=dm.AQery5.FieldValues['EMPLOYEE_NAME']; //创建人
 edit3.Text:=dm.AQery5.FieldValues['ZY'];            //职位

end;
procedure TfrmShowXSZJ.FormShow(Sender: TObject);
begin
 Get712();
end;

procedure TfrmShowXSZJ.SpeedButton2Click(Sender: TObject);
begin
 close;
end;

end.
