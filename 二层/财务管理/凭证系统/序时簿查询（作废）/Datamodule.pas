unit Datamodule;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOData0493: TADODataSet;
    AdoData0106: TADODataSet;
    AdoData0106VOUCHER: TStringField;
    AdoData0106ENTERED_DT: TDateTimeField;
    AdoData0106operator: TStringField;
    AdoData0106auditor: TStringField;
    AdoData0106Postman: TStringField;
    AdoData0106DESCRIPTION: TStringField;
    AdoData0106D_C: TStringField;
    AdoData0106AMOUNT: TBCDField;
    AdoData0106GL_ACC_NUMBER: TStringField;
    AdoData0106GL_DESCRIPTION: TStringField;
    AdoData0106father_desc: TStringField;
    AdoData0106grandfather_desc: TStringField;
    AdoData0106self_desc: TWideStringField;
    AdoData0106CURR_CODE: TStringField;
    AdoData0106exch_rate: TBCDField;
    tmp: TADOQuery;
    procedure AdoData0106CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.AdoData0106CalcFields(DataSet: TDataSet);
begin
self.AdoData0106self_desc.Value:=trim(self.AdoData0106GL_DESCRIPTION.Value);
if self.AdoData0106father_desc.Value<>'' then
begin
 self.AdoData0106self_desc.Value:=trim(self.AdoData0106father_desc.Value)+'-'+
                                       self.AdoData0106self_desc.Value;
if self.AdoData0106grandfather_desc.Value<>'' then
 self.AdoData0106self_desc.Value:=trim(self.AdoData0106grandfather_desc.Value)+'-'+
                                       self.AdoData0106self_desc.Value;
end;
end;

end.
