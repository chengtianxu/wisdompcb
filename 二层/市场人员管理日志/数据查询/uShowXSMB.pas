unit uShowXSMB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Spin;

type
  TfrmshowXSMB = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    YJH: TSpinEdit;
    MJH: TSpinEdit;
    YJHJE: TEdit;
    LJJE: TEdit;
    MJHJE: TEdit;
    YZNBL: TEdit;
    YWWJE: TEdit;
    WWZNBL: TEdit;
    RadioGroup1: TRadioGroup;
    Edit15: TEdit;
    DateTimePicker1: TDateTimePicker;
    Panel1: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    SQJHJE: TEdit;
    SQWCJE: TEdit;
    SQXCJE: TEdit;
    SQWCBL: TEdit;
    Panel2: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    BQMBJE: TEdit;
    BQJHJE: TEdit;
    BQXCJE: TEdit;
    BQJHBL: TEdit;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    JHID: TEdit;
    Edit1: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    procedure Get704();
  public
    { Public declarations }
  end;

var
  frmshowXSMB: TfrmshowXSMB;

implementation

uses uDM;

{$R *.dfm}
procedure TfrmshowXSMB.Get704();
var
 i,j:integer;
begin
 for i:=0 to ControlCount-1 do
  begin
   if Controls[i].ClassName ='TEdit' then
    for j:=0 to dm.AQery704.FieldCount-1 do
     if Controls[i].Name =dm.AQery704.Fields[j].FieldName then
      (Controls[i] as TEdit).Text:=dm.AQery704.Fields[j].Value;
   if Controls[i].ClassName ='TSpinEdit' then
    for j:=0 to dm.AQery704.FieldCount-1 do
     if Controls[i].Name =dm.AQery704.Fields[j].FieldName then
      (Controls[i] as TSpinEdit).Value:=dm.AQery704.Fields[j].Value;

  end;
 for i:=0 to Panel1.ControlCount-1 do
  if Panel1.Controls[i].ClassName ='TEdit' then
   for j:=0 to dm.AQery704.FieldCount-1 do
    if Panel1.Controls[i].Name =dm.AQery704.Fields[j].FieldName then
      (Panel1.Controls[i] as TEdit).Text:=dm.AQery704.Fields[j].Value;
 for i:=0 to Panel2.ControlCount-1 do
  if Panel2.Controls[i].ClassName ='TEdit' then
   for j:=0 to dm.AQery704.FieldCount-1 do
    if Panel2.Controls[i].Name =dm.AQery704.Fields[j].FieldName then
      (Panel2.Controls[i] as TEdit).Text:=dm.AQery704.Fields[j].Value;
 BQMBJE.Text:=MJHJE.Text;
 //创建人
 dm.AQery5.Close ;
 dm.AQery5.Parameters.ParamValues['rky']:=dm.AQery704.FieldByName('CJRPTR').Value;
 dm.AQery5.Open ;
 edit15.Text :=dm.AQery5.FieldValues['EMPLOYEE_NAME'];

 edit1.Text:=dm.AQery5.FieldValues['ZY'];//职位


 //创建时间
 DateTimePicker1.Date:=dm.AQery704.FieldValues['CJRQ'];
 //自我鉴定
 RadioGroup1.ItemIndex:=dm.AQery704.FieldValues['status'];
 //备注
 memo1.Text:=dm.AQery704.FieldValues['Note'];
end;
procedure TfrmshowXSMB.FormCreate(Sender: TObject);
begin
//
end;

procedure TfrmshowXSMB.FormShow(Sender: TObject);
begin
 Get704();
end;

procedure TfrmshowXSMB.SpeedButton2Click(Sender: TObject);
begin
 close;
end;

end.
