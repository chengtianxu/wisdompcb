unit uKFKH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls;

type
  TfrmKFKH = class(TForm)
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
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    procedure Get706();
  public

  end;

var
  frmKFKH: TfrmKFKH;

implementation

uses uDM;

{$R *.dfm}

procedure TfrmKFKH.Get706();
var
 i,j:integer;
begin
 for i:=0 to ControlCount-1 do
  begin
   if Controls[i].ClassName ='TEdit' then
    for j:=0 to dm.ADS706.FieldCount-1 do
     if Controls[i].Name =dm.ADS706.Fields[j].FieldName then
      (Controls[i] as TEdit).Text:=dm.ADS706.Fields[j].Value;
   if Controls[i].ClassName ='TRadioGroup' then
    for j:=0 to dm.ADS706.FieldCount-1 do
     if Controls[i].Name =dm.ADS706.Fields[j].FieldName then
      (Controls[i] as TRadioGroup).ItemIndex:=dm.ADS706.Fields[j].Value;
  end; //end for
 //客户
 dm.AQery.Close ;
 dm.AQery.SQL.Text:='select *  from data0010 where rkey='+dm.ADS706.FieldByName('PTR10').AsString;
 dm.AQery.Open ;
 if dm.AQery.RecordCount<>0 then
  begin
   edit1.Text :=dm.AQery.FieldValues['CUST_CODE'];
   Label2.Caption:=dm.AQery.FieldValues['CUSTOMER_NAME'];

  end
 else
  begin
   edit1.Text :=dm.ADS706.FieldValues['KHMC'];
   Label2.Caption:=dm.ADS706.FieldValues['KHMC'];

  end;

end;
procedure TfrmKFKH.FormCreate(Sender: TObject);
begin
//
end;

procedure TfrmKFKH.FormShow(Sender: TObject);
begin

  Get706();
end;
//客户
procedure TfrmKFKH.BitBtn1Click(Sender: TObject);
begin

end;
//保存
procedure TfrmKFKH.SpeedButton1Click(Sender: TObject);

begin
 
end;
//退出
procedure TfrmKFKH.SpeedButton2Click(Sender: TObject);
begin
 close;
end;

end.
