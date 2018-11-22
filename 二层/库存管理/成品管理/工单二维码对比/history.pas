unit history;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ComCtrls, Grids, DBGridEh, ExtCtrls, DM;

type
  TfrmHistroy = class(TForm)
    pnl1: TPanel;
    eh1: TDBGridEh;
    btn1: TButton;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    lbl1: TLabel;
    ads1: TADODataSet;
    ds1: TDataSource;
    ads1WORK_ORDER_NUMBER: TStringField;
    ads1MANU_PART_NUMBER: TStringField;
    ads1MANU_PART_DESC: TStringField;
    ads1Bar2D: TStringField;
    ads1DTime: TDateTimeField;
    ads1succ: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistroy: TfrmHistroy;

implementation

{$R *.dfm}

procedure TfrmHistroy.FormShow(Sender: TObject);
begin
  dtp1.DateTime := Now();
  dtp2.DateTime := Now();

  btn1Click(nil);
end;

procedure TfrmHistroy.btn1Click(Sender: TObject);
begin
  ads1.Close;
  ads1.Parameters.ParamByName('t1').Value := dtp1.DateTime;
  ads1.Parameters.ParamByName('t2').Value := dtp2.DateTime;
  ads1.Open;
end;

//Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security Info=True;User ID=WZPCBConnect;Initial Catalog=WISDOMPCB;Data Source=172.18.0.8;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=CHENGTX-PC;Use Encryption for Data=False;Tag with column collation when possible=False
end.
