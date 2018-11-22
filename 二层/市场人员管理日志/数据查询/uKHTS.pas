unit uKHTS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TfrmKHTS = class(TForm)
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    SL: TEdit;
    note: TMemo;
    GJQK: TMemo;
    JJBF: TMemo;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    JJSX: TDateTimePicker;
    Label9: TLabel;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    procedure Get710();
  public

  end;

var
  frmKHTS: TfrmKHTS;

implementation

uses  uDM;

{$R *.dfm}

//获取
procedure TfrmKHTS.Get710();
var
 i,j:integer;
begin
 for i:=0 to ControlCount-1 do
  begin
   if Controls[i].ClassName ='TEdit' then
    for j:=0 to dm.ADS710.FieldCount-1 do
     if Controls[i].Name =dm.ADS710.Fields[j].FieldName then
      (Controls[i] as TEdit).Text:=dm.ADS710.Fields[j].Value;
   if Controls[i].ClassName ='TMemo' then
    for j:=0 to dm.ADS710.FieldCount-1 do
     if Controls[i].Name =dm.ADS710.Fields[j].FieldName then
      (Controls[i] as TMemo).Lines.Text:=dm.ADS710.Fields[j].Value;
   if Controls[i].ClassName ='TDateTimePicker' then
    for j:=0 to dm.ADS710.FieldCount-1 do
     if Controls[i].Name =dm.ADS710.Fields[j].FieldName then
      (Controls[i] as TDateTimePicker).Date :=dm.ADS710.Fields[j].Value;
  end; //end for
 //客户
 dm.AQery.Close ;
 dm.AQery.SQL.Text:='select *  from data0010 where rkey='+dm.ADS710.FieldByName('PTR10').AsString;
 dm.AQery.Open ;
 if dm.AQery.RecordCount<>0 then
  begin
   edit1.Text :=dm.AQery.FieldValues['CUST_CODE'];
   Label2.Caption:=dm.AQery.FieldValues['CUSTOMER_NAME'];

  end;
 //产品
 dm.AQery.Close ;
 dm.AQery.SQL.Text:='select RKEY, MANU_PART_NUMBER, MANU_PART_DESC  from data0025 where rkey='+dm.ADS710.FieldByName('PTR50').AsString;
 dm.AQery.Open ;
 if dm.AQery.RecordCount<>0 then
  begin
   edit2.Text :=dm.AQery.FieldValues['MANU_PART_NUMBER'];
   Label4.Caption:=dm.AQery.FieldValues['MANU_PART_DESC'];
  end;

end;
procedure TfrmKHTS.FormShow(Sender: TObject);
begin
  Get710();
end;

//保存
procedure TfrmKHTS.SpeedButton2Click(Sender: TObject);
begin
 CLOSE;
end;

end.
