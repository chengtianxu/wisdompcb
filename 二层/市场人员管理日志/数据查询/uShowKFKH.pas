unit uShowKFKH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmShowKFKH = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit1: TEdit;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GMRS: TEdit;
    ZYCP: TEdit;
    PCBYL: TEdit;
    TXDZ: TEdit;
    TXDH: TEdit;
    TXRXM: TEdit;
    HZYX: TRadioGroup;
    BitBtn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    procedure Get714();
  public
    { Public declarations }
  end;

var
  frmShowKFKH: TfrmShowKFKH;

implementation

uses uDM;

{$R *.dfm}
procedure TfrmShowKFKH.Get714();
var
 i,j:integer;
begin
 for i:=0 to ControlCount-1 do
  begin
   if Controls[i].ClassName ='TEdit' then
    for j:=0 to dm.ADS714.FieldCount-1 do
     if Controls[i].Name =dm.ADS714.Fields[j].FieldName then
      (Controls[i] as TEdit).Text:=dm.ADS714.Fields[j].Value;
   if Controls[i].ClassName ='TRadioGroup' then
    for j:=0 to dm.ADS714.FieldCount-1 do
     if Controls[i].Name =dm.ADS714.Fields[j].FieldName then
      (Controls[i] as TRadioGroup).ItemIndex:=dm.ADS714.Fields[j].Value;
  end; //end for
 //¿Í»§
 dm.AQery.Close ;
 dm.AQery.SQL.Text:='select *  from data0010 where rkey='+dm.ADS714.FieldByName('PTR10').AsString;
 dm.AQery.Open ;
 if dm.AQery.RecordCount<>0 then
  begin
   edit1.Text :=dm.AQery.FieldValues['CUST_CODE'];
   Label2.Caption:=dm.AQery.FieldValues['CUSTOMER_NAME'];

  end
 else
  begin
   edit1.Text :=dm.ADS714.FieldValues['KHMC'];
   Label2.Caption:=dm.ADS714.FieldValues['KHMC'];

  end;

end;
procedure TfrmShowKFKH.FormShow(Sender: TObject);
begin
  Get714();
end;

procedure TfrmShowKFKH.SpeedButton2Click(Sender: TObject);
begin
 close;
end;

end.
