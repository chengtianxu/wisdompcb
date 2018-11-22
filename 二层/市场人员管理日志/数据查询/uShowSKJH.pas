unit uShowSKJH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons;

type
  TfrmShowSKJH = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    HJYS: TEdit;
    DQYS: TEdit;
    YSJE: TEdit;
    SKRQ: TDateTimePicker;
    HZSTATUS: TRadioGroup;
    CQTS: TEdit;
    CQJE: TEdit;
    Label10: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    procedure Get713();
  public
    { Public declarations }
  end;

var
  frmShowSKJH: TfrmShowSKJH;

implementation

uses uDM;

{$R *.dfm}
procedure TfrmShowSKJH.Get713();
var
 i,j:integer;
begin
 for i:=0 to ControlCount-1 do
  begin
   if Controls[i].ClassName ='TEdit' then
    for j:=0 to dm.ADS713.FieldCount-1 do
     if Controls[i].Name =dm.ADS713.Fields[j].FieldName then
      (Controls[i] as TEdit).Text:=dm.ADS713.Fields[j].Value;
   if Controls[i].ClassName ='TDateTimePicker' then
    for j:=0 to dm.ADS713.FieldCount-1 do
     if Controls[i].Name =dm.ADS713.Fields[j].FieldName then
      (Controls[i] as TDateTimePicker).Date :=dm.ADS713.Fields[j].Value;
  end; //end for
 //合作意向
 HZSTATUS.ItemIndex:=dm.ADS713.FieldValues['HZSTATUS'];
 //客户
 dm.AQery.Close ;
 dm.AQery.SQL.Text:='select *  from data0010 where rkey='+dm.ADS713.FieldByName('PTR10').AsString;
 dm.AQery.Open ;

 edit1.Text :=dm.AQery.FieldValues['CUST_CODE'];
 Label2.Caption:=dm.AQery.FieldValues['CUSTOMER_NAME'];

end;
procedure TfrmShowSKJH.FormShow(Sender: TObject);
begin
 Get713();
end;

procedure TfrmShowSKJH.SpeedButton2Click(Sender: TObject);
begin
 close;
end;

end.
