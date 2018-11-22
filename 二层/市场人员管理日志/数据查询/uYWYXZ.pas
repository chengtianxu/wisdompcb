unit uYWYXZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, ComCtrls, Mask, DBCtrls;

type
  TfrmYWYXZ = class(TForm)
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    TXDH: TEdit;
    TXDZ: TEdit;
    TXRXM: TEdit;
    TXRZC: TEdit;
    TXSJ: TDateTimePicker;
    HDRR: TMemo;
    HZYX: TRadioGroup;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    KHMC: TEdit;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    Label10: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private

    procedure Get711();
  public

  end;

var
  frmYWYXZ: TfrmYWYXZ;

implementation

uses uDM;

{$R *.dfm}

procedure TfrmYWYXZ.Get711();
var
 i,j:integer;
begin
 for i:=0 to ControlCount-1 do
  begin
   if Controls[i].ClassName ='TEdit' then
    for j:=0 to dm.ADS711.FieldCount-1 do
     if Controls[i].Name =dm.ADS711.Fields[j].FieldName then
      (Controls[i] as TEdit).Text:=dm.ADS711.Fields[j].Value;
   if Controls[i].ClassName ='TMemo' then
    for j:=0 to dm.ADS711.FieldCount-1 do
     if Controls[i].Name =dm.ADS711.Fields[j].FieldName then
      (Controls[i] as TMemo).Lines.Text:=dm.ADS711.Fields[j].Value;
   if Controls[i].ClassName ='TDateTimePicker' then
    for j:=0 to dm.ADS711.FieldCount-1 do
     if Controls[i].Name =dm.ADS711.Fields[j].FieldName then
      (Controls[i] as TDateTimePicker).Date :=dm.ADS711.Fields[j].Value;
   if Controls[i].ClassName ='TRadioGroup' then
    for j:=0 to dm.ADS711.FieldCount-1 do
     if Controls[i].Name =dm.ADS711.Fields[j].FieldName then
      (Controls[i] as TRadioGroup).ItemIndex :=dm.ADS711.Fields[j].Value;

  end; //end for
 //客户
 dm.AQery.Close ;
 dm.AQery.SQL.Text:='select *  from data0010 where rkey='+dm.ADS711.FieldByName('PTR10').AsString;
 dm.AQery.Open ;
 if dm.AQery.RecordCount<>0 then
  begin
   edit1.Text :=dm.AQery.FieldValues['CUST_CODE'];
   Label2.Caption:=dm.AQery.FieldValues['CUSTOMER_NAME'];
  end
 else
  begin

  end;

end;
procedure TfrmYWYXZ.FormShow(Sender: TObject);
begin

  Get711();
end;
//客户
procedure TfrmYWYXZ.BitBtn1Click(Sender: TObject);
begin

end;
//保存
procedure TfrmYWYXZ.SpeedButton2Click(Sender: TObject);
begin
 close;
end;

end.
