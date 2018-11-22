unit uSKJH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls, ComCtrls;

type
  TfrmSKJH = class(TForm)
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Edit1: TEdit;
    HJYS: TEdit;
    DQYS: TEdit;
    JHYS: TEdit;
    JHRQ: TDateTimePicker;
    HZSTATUS: TRadioGroup;
    CQTS: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    procedure Get707();
  public

  end;

var
  frmSKJH: TfrmSKJH;

implementation

uses uDM;

{$R *.dfm}
procedure TfrmSKJH.Get707();
var
 i,j:integer;
begin
 for i:=0 to ControlCount-1 do
  begin
   if Controls[i].ClassName ='TEdit' then
    for j:=0 to dm.ADS707.FieldCount-1 do
     if Controls[i].Name =dm.ADS707.Fields[j].FieldName then
      (Controls[i] as TEdit).Text:=dm.ADS707.Fields[j].Value;
   if Controls[i].ClassName ='TDateTimePicker' then
    for j:=0 to dm.ADS707.FieldCount-1 do
     if Controls[i].Name =dm.ADS707.Fields[j].FieldName then
      (Controls[i] as TDateTimePicker).Date:=dm.ADS707.Fields[j].Value;
  end; //end for
 //合作意向
 HZSTATUS.ItemIndex:=dm.ADS707.FieldValues['HZSTATUS'];
 //客户
 dm.AQery.Close ;
 dm.AQery.SQL.Text:='select *  from data0010 where rkey='+dm.ADS707.FieldByName('PTR10').AsString;
 dm.AQery.Open ;

 edit1.Text :=dm.AQery.FieldValues['CUST_CODE'];
 Label2.Caption:=dm.AQery.FieldValues['CUSTOMER_NAME'];

end;
procedure TfrmSKJH.FormShow(Sender: TObject);
begin
  Get707();
end;
//客户
procedure TfrmSKJH.BitBtn1Click(Sender: TObject);
begin

end;
//保存
procedure TfrmSKJH.SpeedButton2Click(Sender: TObject);
begin
 close;
end;

end.
