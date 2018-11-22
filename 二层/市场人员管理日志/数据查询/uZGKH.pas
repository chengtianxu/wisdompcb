unit uZGKH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmZGKH = class(TForm)
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    BQJHDD: TEdit;
    BQJHYP: TEdit;
    CPStatus: TRadioGroup;
    BQJHJE: TEdit;
    ZYCL: TEdit;
    CPSL: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    XYSTATUS: TRadioGroup;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    procedure Get705();
  public

  end;

var
  frmZGKH: TfrmZGKH;

implementation

uses  uDM;

{$R *.dfm}
procedure TfrmZGKH.Get705();
var
 i,j:integer;
begin
 for i:=0 to ControlCount-1 do
  begin
   if Controls[i].ClassName ='TEdit' then
    for j:=0 to dm.ADS705.FieldCount-1 do
     if Controls[i].Name =dm.ADS705.Fields[j].FieldName then
      (Controls[i] as TEdit).Text:=dm.ADS705.Fields[j].Value;
   if Controls[i].ClassName ='TRadioGroup' then
    for j:=0 to dm.ADS705.FieldCount-1 do
     if Controls[i].Name =dm.ADS705.Fields[j].FieldName then
      (Controls[i] as TRadioGroup).ItemIndex:=dm.ADS705.Fields[j].Value;
  end; //end for
 //客户
 dm.AQery.Close ;
 dm.AQery.SQL.Text:='select *  from data0010 where rkey='+dm.ADS705.FieldByName('PTR10').AsString;
 dm.AQery.Open ;
 edit1.Text :=dm.AQery.FieldValues['CUST_CODE'];
 Label8.Caption:=dm.AQery.FieldValues['CUSTOMER_NAME'];

 //业务员
 dm.AQery.Close ;
 dm.AQery.SQL.Text:='select *  from data0005 where rkey='+dm.ADS705.FieldByName('PTR5').AsString;
 dm.AQery.Open ;
 edit2.Text :=dm.AQery.FieldValues['EMPL_CODE'];
 Label9.Caption:=dm.AQery.FieldValues['EMPLOYEE_NAME'];



end;
procedure TfrmZGKH.FormCreate(Sender: TObject);
begin
//
end;

procedure TfrmZGKH.FormShow(Sender: TObject);
begin

  Get705();
end;
//客户
procedure TfrmZGKH.BitBtn1Click(Sender: TObject);
begin

end;
//业务员
procedure TfrmZGKH.BitBtn2Click(Sender: TObject);
begin

end;
//保存
procedure TfrmZGKH.SpeedButton2Click(Sender: TObject);
begin
 close;
end;

end.
