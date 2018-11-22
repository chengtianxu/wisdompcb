unit uReptForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave;

type
  TForm1 = class(TForm)
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    RvDataSetConnection1: TRvDataSetConnection;
    ADOQRept: TADOQuery;
    ADOQReptVOUCHER: TStringField;
    ADOQReptATTACHED: TSmallintField;
    ADOQReptFYEAR: TIntegerField;
    ADOQReptPERIOD: TSmallintField;
    ADOQReptDESCRIPTION: TStringField;
    ADOQReptGL_ACC_NUMBER: TStringField;
    ADOQReptGL_DESCRIPTION: TStringField;
    ADOQReptCURR_CODE: TStringField;
    ADOQReptEXCH_RATE: TFloatField;
    ADOQReptD_C: TStringField;
    ADOQReptAMOUNT: TBCDField;
    ADOQReptDAmount: TFloatField;
    ADOQReptCAmount: TFloatField;
    procedure ADOQReptCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ADOQReptCalcFields(DataSet: TDataSet);
begin
if ADOQRept.FieldByName('D_C').AsString='D' then
    ADOQRept.FieldByName('DAmount').asstring:=ADOQRept.FieldByName('AMOUNT').Value
  else
    ADOQRept.FieldByName('CAmount').asstring:=ADOQRept.FieldByName('AMOUNT').Value;

end;

end.
