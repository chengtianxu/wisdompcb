unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    ado0214: TADOQuery;
    ado0214RKEY: TAutoIncField;
    ado0214FG_COUNT_CODE: TStringField;
    ado0214DATE_CREATED: TDateTimeField;
    ado0214EMPLOYEE_PTR: TIntegerField;
    ado0214BEG_LOCCODE_PTR: TIntegerField;
    ado0214END_LOCCODE_PTR: TIntegerField;
    ado0214BEG_CUSTPART_PTR: TIntegerField;
    ado0214END_CUSTPART_PTR: TIntegerField;
    ado0214STATUS: TWordField;
    ado0214EMPLOYEE_NAME: TStringField;
    ado0214EMPL_CODE: TStringField;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADO0215: TADOQuery;
    ADOData0215: TADODataSet;
    Aq0215: TADOQuery;
    ADO0113: TADOQuery;
    checkout: TADOQuery;
    checkoutPRODUCT_GROUP_NAME: TStringField;
    checkoutPRODUCT_NAME: TStringField;
    checkoutLOCATION: TStringField;
    checkoutEMPLOYEE_NAME: TStringField;
    checkoutnew_price: TBCDField;
    checkoutold_quantity: TBCDField;
    checkoutQUANTITY: TBCDField;
    checkoutstatus: TWordField;
    checkoutcheck_no: TStringField;
    checkoutv_status: TStringField;
    difference: TADOQuery;
    differencePRODUCT_GROUP_NAME: TStringField;
    differencePRODUCT_NAME: TStringField;
    differenceLOCATION: TStringField;
    differenceEMPLOYEE_NAME: TStringField;
    differencenew_price: TBCDField;
    differenceold_quantity: TBCDField;
    differenceQUANTITY: TBCDField;
    differencediff_stock: TBCDField;
    differencediff_price: TBCDField;
    ADO493: TADOQuery;
    checkoutnewquantity: TStringField;
    checkoutPROD_CODE: TStringField;
    checkoutPRODUCT_DESC: TStringField;
    ado0214v_status: TStringField;
//    procedure ado0214CalcFields(DataSet: TDataSet);
    procedure checkoutCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}
//
//procedure Tdm.ado0214CalcFields(DataSet: TDataSet);
//begin
////if self.ADO0214STATUS.Value=0 then
//// self.ADO0214v_status.AsString:='进行中'
////else
////if self.ADO0214STATUS.Value=1 then
//// self.ADO0214v_status.AsString:='已完成';
//end;

procedure Tdm.checkoutCalcFields(DataSet: TDataSet);
begin
if dm.checkoutstatus.Value=0 then
dm.checkoutv_status.Value:='未输入'
else
if dm.checkoutstatus.Value=1 then
 dm.checkoutv_status.Value:='已输入'
else
 dm.checkoutv_status.Value:='已完成';
if dm.checkoutQUANTITY.Value=-2 then
dm.checkoutnewquantity.Value:=''
else dm.checkoutnewquantity.Value:=dm.checkoutQUANTITY.AsString;


end;


end.
