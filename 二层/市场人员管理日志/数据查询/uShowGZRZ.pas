unit uShowGZRZ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, DBCtrls;

type
  TfrmShowGZRZ = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    TJSTATUS: TRadioGroup;
    YSSTATUS: TRadioGroup;
    Memo1: TMemo;
    Edit2: TEdit;
    CJRQ: TDateTimePicker;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    BRLJ: TEdit;
    RZYBL: TEdit;
    RZID: TEdit;
    Edit3: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    procedure Get708();
  public
    { Public declarations }
  end;

var
  frmShowGZRZ: TfrmShowGZRZ;

implementation

uses uDM;

{$R *.dfm}
//获取信息
procedure TfrmShowGZRZ.Get708();
var
 i,j:integer;
begin
 for i:=0 to ControlCount-1 do
  begin
   if Controls[i].ClassName ='TEdit' then
    for j:=0 to dm.AQery708.FieldCount-1 do
     if Controls[i].Name =dm.AQery708.Fields[j].FieldName then
      (Controls[i] as TEdit).Text:=dm.AQery708.Fields[j].Value;
   if Controls[i].ClassName ='TRadioGroup' then
    for j:=0 to dm.AQery708.FieldCount-1 do
     if Controls[i].Name =dm.AQery708.Fields[j].FieldName then
      (Controls[i] as TRadioGroup).ItemIndex:=dm.AQery708.Fields[j].Value;
   if Controls[i].ClassName ='TDateTimePicker' then
    for j:=0 to dm.AQery708.FieldCount-1 do
     if Controls[i].Name =dm.AQery708.Fields[j].FieldName then
      (Controls[i] as TDateTimePicker).Date :=dm.AQery708.Fields[j].Value;
  end; //end for

 // 创建人
 dm.AQery5.Close;
 dm.AQery5.Parameters.ParamValues['rky']:=dm.AQery708.FieldByName('USEPTR').Value;
 dm.AQery5.Open;
 edit2.Text :=dm.AQery5.FieldValues['EMPLOYEE_NAME'];
 edit3.Text:=dm.AQery5.FieldValues['ZY'];//职位
 memo1.Text:=dm.AQery708Note.Value;
end;

procedure TfrmShowGZRZ.FormShow(Sender: TObject);
begin
 Get708();
end;

procedure TfrmShowGZRZ.SpeedButton2Click(Sender: TObject);
begin
 close;
end;

end.
