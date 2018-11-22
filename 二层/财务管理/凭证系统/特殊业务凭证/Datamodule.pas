unit Datamodule;

interface

uses
  SysUtils, Classes, DB, ADODB,Variants;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOData0128: TADODataSet;
    ADOData0508: TADODataSet;
    ADOQ0106: TADODataSet;
    ADOData0103: TADODataSet;
    Ado105: TADOQuery;
    Ado105rkey: TAutoIncField;
    Ado105voucher: TStringField;
    Ado105TRANS_TYPE: TSmallintField;
    Ado105entered_dt: TDateTimeField;
    Ado105status: TSmallintField;
    Ado105FYEAR: TIntegerField;
    Ado105PERIOD: TSmallintField;
    Ado105employee_name: TStringField;
    Ado105cstatus: TStringField;
    ADOQ: TADOQuery;
    ADOQ0001: TADOQuery;
    Ado105vTranType: TStringField;
    ADOQ0106GL_ACC_NUMBER: TStringField;
    ADOQ0106GL_DESCRIPTION: TStringField;
    ADOQ0106CURR_NAME: TStringField;
    ADOQ0106tGL_DESCRIPTION: TStringField;
    ADOQ0106pGL_DESCRIPTION: TStringField;
    ADOQ0106GL_HEADER_PTR: TIntegerField;
    ADOQ0106RKEY: TIntegerField;
    ADOQ0106GL_ACCT_NO_PTR: TIntegerField;
    ADOQ0106REF_NUMBER: TStringField;
    ADOQ0106DESCRIPTION: TStringField;
    ADOQ0106SRCE_PTR: TIntegerField;
    ADOQ0106AMOUNT: TBCDField;
    ADOQ0106D_C: TStringField;
    ADOQ0106FYEAR: TIntegerField;
    ADOQ0106PERIOD: TSmallintField;
    ADOQ0106INV_PTR: TIntegerField;
    ADOQ0106UNIT_PTR: TIntegerField;
    ADOQ0106CURR_PTR: TIntegerField;
    ADOQ0106PRICE: TFloatField;
    ADOQ0106EXCH_RATE: TFloatField;
    ADOData0103RKEY: TAutoIncField;
    ADOData0103CURR_TP: TWordField;
    ADOData0103CURR_PTR: TIntegerField;
    ADOData0103DSDesigner: TStringField;
    ADOData0103DSDesigner2: TStringField;
    ADOData0103GL_ACC_NUMBER: TStringField;
    ADOData0103description_2: TStringField;
    ADOQ0001rkey: TAutoIncField;
    ADOQ0001curr_code: TStringField;
    ADOQ0001curr_name: TStringField;
    ADOQ0001exch_rate: TFloatField;
    Ado105ATTACHED: TSmallintField;
    ADOData0001: TADOQuery;
    Ado105VOU_TYPE: TSmallintField;
    ADOQuery1: TADOQuery;
    Ado105ENTERED_BY_EMPL_PTR: TIntegerField;
    ADOQ0106curr_code: TStringField;
    Ado105BATCH_NUMBER: TStringField;
    Ado105SPECIAL_POSTING: TStringField;
    ADOQ0106description_2: TStringField;
    ADOData0508RKEY: TSmallintField;
    ADOData0508CLASS1: TSmallintField;
    ADOData0508CLASS2: TSmallintField;
    ADOData0508CLASS3: TSmallintField;
    ADOData0508CLASS4: TSmallintField;
    ADOData0508CLASS5: TSmallintField;
    ADOData0508CLASS6: TSmallintField;
    ADOData0508OPEN_DATE: TDateTimeField;
    ADOData0508RESET_FLAG: TSmallintField;
    ADOData0508CURR_FYEAR: TIntegerField;
    ADOData0508CURR_PERIOD: TSmallintField;
    ADOData0508DEPRE_FLAG: TSmallintField;
    ADOData0508INITIALIZED: TSmallintField;
    ADOData0508AP_FLAG: TStringField;
    ADOData0508AR_FLAG: TStringField;
    ADOData0508STOCK_FLAG: TStringField;
    ADOData0508CONTROL_DATE: TDateTimeField;
    ADOData0508fin_control1: TWordField;
    ADOData0508fin_control2: TWordField;
    ADOData0508fasset_initlized: TStringField;
    procedure Ado105CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses Main;

{$R *.dfm}

procedure TDM.Ado105CalcFields(DataSet: TDataSet);
begin
  case Ado105.FieldByName('STATUS').asinteger of
    0:Ado105.FieldByName('cstatus').asstring:='未审核';
    1:Ado105.FieldByName('cstatus').asstring:='会计已审';
    2:Ado105.FieldByName('cstatus').asstring:='主管已审';
    3:Ado105.FieldByName('cstatus').asstring:='已登帐';
    4:Ado105.FieldByName('cstatus').asstring:='出管已审';
    5:self.Ado105cstatus.Value:='被作废';
  end;
end;

end.
