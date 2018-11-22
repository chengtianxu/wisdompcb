unit PasDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    Ado10: TADOQuery;
    Ado10RKEY: TIntegerField;
    Ado10CUST_CODE: TStringField;
    Ado10ABBR_NAME: TStringField;
    Ado10EMPLOYEE_NAME: TStringField;
    Ado10FED_TAX_ID_NO: TStringField;
    Ado10CURR_NAME: TStringField;
    tmp: TADOQuery;
    Ado10Proportion: TFloatField;
    DataSource1: TDataSource;
    aqd114: TADODataSet;
    aqd114REFERENCE_NO: TStringField;
    aqd114VOUCHER: TStringField;
    aqd114STATUS: TSmallintField;
    aqd114RKEY: TIntegerField;
    aqd114TDATE: TDateTimeField;
    aqd114status114: TWordField;
    aqd114EMPLOYEE_NAME: TStringField;
    aqd114CURR_CODE: TStringField;
    aqd114CURR_NAME: TStringField;
    aqd114EXCHANGE_RATE: TFloatField;
    aqd114BANK_NAME: TStringField;
    aqd114CUST_CODE: TStringField;
    aqd114CUSTOMER_NAME: TStringField;
    aqd114ABBR_NAME: TStringField;
    aqd114TTYPE: TWordField;
    aqd114AMOUNT: TFloatField;
    aqd114v_ttype: TStringField;
    aqd114v_status: TStringField;
    aqd114v_status114: TStringField;
    aqd114bal_amount: TFloatField;
    aqd114stand_amount: TFloatField;
    aqd114empl_ptr: TIntegerField;
    aqd114PO_NUMBER: TStringField;
    aqd114MANU_PART_NUMBER: TStringField;
    aqd114all_shipqty: TIntegerField;
    aqd114remark: TStringField;
    aqd114DEBIT_AMOUNT: TFloatField;
    aqd114dz_amount: TFloatField;
    aqd114warehouse_code: TStringField;
    aqd114abbrname15: TStringField;
    aqd114Proportion: TFloatField;
    aqd114MIN_STATE_TAX: TBCDField;
    aqd114NotAMOUNT: TFloatField;
    aqd114pAMOUNT: TFloatField;
    aqd114psAMOUNT: TFloatField;
    aqd114FED_TAX_ID_NO: TStringField;
    aqd114sales_rep_name: TStringField;
    Ado10status_s: TStringField;
    Ado10Remark: TStringField;
    aqd114Remark125: TStringField;
    Ado10brokerage: TFloatField;
    aqd114brokerage: TFloatField;
    aqd114pbAMOUNT: TFloatField;
    aqd114jMomey: TCurrencyField;
    Ado10iStatus: TSmallintField;
    procedure aqd114CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.aqd114CalcFields(DataSet: TDataSet);
begin
  DataSet.fieldBYName('jMomey').AsFloat:=DataSet.fieldBYName('NotAMOUNT').AsCurrency-dataset.FieldByName('pbAMOUNT').AsCurrency;
  DataSet.fieldBYName('pAMOUNT').AsFloat:=(DataSet.fieldBYName('NotAMOUNT').AsCurrency-dataset.FieldByName('pbAMOUNT').AsCurrency)*dataset.FieldByName('Proportion').AsFloat*0.01;
  DataSet.fieldBYName('psAMOUNT').AsFloat:=(DataSet.fieldBYName('NotAMOUNT').AsCurrency-dataset.FieldByName('pbAMOUNT').AsCurrency)*dataset.FieldByName('Proportion').AsFloat*0.01*0.1;
end;

end.
