unit datamd;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ACt: TADOConnection;
    ADOQuery1: TADOQuery;
    aq132: TADOQuery;
    DataSource1: TDataSource;
    aq132MEMO_NUMBER: TStringField;
    aq132CODE: TStringField;
    aq132ABBR_NAME: TStringField;
    aq132AMOUNT: TBCDField;
    aq132AVL_AMT: TBCDField;
    aq132MEMO_DATE: TDateTimeField;
    aq132MEMO_TP: TSmallintField;
    aq132REF_NUMBER: TStringField;
    aq132EX_RATE: TBCDField;
    aq132CURR_CODE: TStringField;
    aq132CURR_NAME: TStringField;
    aq132EMPLOYEE_NAME: TStringField;
    aq132MATL_TOT: TBCDField;
    aq132MISC_TOT: TBCDField;
    aq132FED_TAX: TBCDField;
    aq132v_type: TStringField;
    aq132rkey: TIntegerField;
    ADOsp04: TADOStoredProc;
    ADOsp04CONTROL_NO_LENGTH: TSmallintField;
    ADOsp04SEED_VALUE: TStringField;
    ADOsp04SEED_FLAG: TWordField;
    ADO132: TADOQuery;
    ADO132RKEY: TAutoIncField;
    ADO132MEMO_NUMBER: TStringField;
    ADO132SUPP_PTR: TIntegerField;
    ADO132SRCE_PTR: TIntegerField;
    ADO132MEMO_TP: TSmallintField;
    ADO132EMPL_PTR: TIntegerField;
    ADO132MEMO_DATE: TDateTimeField;
    ADO132ENT_DATE: TDateTimeField;
    ADO132AMOUNT: TBCDField;
    ADO132AVL_AMT: TBCDField;
    ADO132MATL_TOT: TBCDField;
    ADO132SHIPPING: TBCDField;
    ADO132MISC_TOT: TBCDField;
    ADO132FED_TAX: TBCDField;
    ADO132CURRENCY_PTR: TIntegerField;
    ADO132EX_RATE: TBCDField;
    ADO132CASH_DISC: TBCDField;
    ADO132PURCH_DISC: TBCDField;
    ADO132REF_NUMBER: TStringField;
    ADO132CHECK_PTR: TIntegerField;
    aq132supplier_name: TStringField;
    aq132check_ptr: TIntegerField;
    aq132SUPP_PTR: TIntegerField;
    aq132CURRENCY_PTR: TIntegerField;
    aq132ent_date: TDateTimeField;
    procedure aq132CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

procedure Tdm.aq132CalcFields(DataSet: TDataSet);
begin
case self.aq132memo_tp.Value of
 1:self.aq132v_type.Value:='保留备用';
 2:self.aq132v_type.Value:='其它备忘';
 3:self.aq132v_type.Value:='退货备忘';
 4:self.aq132v_type.Value:='预付备忘';
end;
end;

end.
