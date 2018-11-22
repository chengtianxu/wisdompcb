unit damo;

interface

uses
  SysUtils, Classes, DB,Variants, ADODB;

type
  Tdm = class(TDataModule)
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    ADOQuery2: TADOQuery;
    DataSource1: TDataSource;
    AQ9711: TADOQuery;
    AQ04: TADOStoredProc;
    AQ04CONTROL_NO_LENGTH: TSmallintField;
    AQ04SEED_VALUE: TStringField;
    AQ04SEED_FLAG: TWordField;
    ADO64: TADOQuery;
    DataSource2: TDataSource;
    ADO64rkey: TAutoIncField;
    ADO64shipment_no: TSmallintField;
    ADO64date_shipped: TDateTimeField;
    ADO64quan_shipped: TIntegerField;
    ADO64employee_name: TStringField;
    ADOQuery1rma_number: TStringField;
    ADOQuery1rma_date: TDateTimeField;
    ADOQuery1QTY_AUTH: TIntegerField;
    ADOQuery1so_ptr: TIntegerField;
    ADOQuery1RMA_STATUS: TSmallintField;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1customer_ptr: TIntegerField;
    ADOQuery1customer_part_ptr: TIntegerField;
    ADOQuery1sales_order: TStringField;
    ADOQuery1shipment_ptr: TIntegerField;
    ADOQuery1qty_recd: TIntegerField;
    ADOQuery1cust_code: TStringField;
    ADOQuery1rma_type: TStringField;
    ADOQuery1status: TStringField;
    ADO64quan_credited: TIntegerField;
    ADO64qty_aval: TIntegerField;
    ADOQuery1abbr_name: TStringField;
    ADOQuery1PART_PRICE: TFloatField;
    ADOQuery1MANU_part_number: TStringField;
    ADOQuery1MANU_PART_DESC: TStringField;
    ADOQuery1warehouse_name: TStringField;
    ADOQuery1rmatype: TStringField;
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
   EMPLOYEE_name:string;
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

procedure Tdm.ADOQuery1CalcFields(DataSet: TDataSet);
begin
 if adoquery1.FieldValues['so_ptr']=null then
  adoquery1.FieldValues['rma_type'] := '按部件'
 else
  adoquery1.FieldValues['rma_type'] := '从装运';

 case adoquery1.FieldValues['rma_status'] of
  1:adoquery1.FieldValues['status']:='未提交';
  2:adoquery1.FieldValues['status']:='待入仓';
  3:adoquery1.FieldValues['status']:='已入仓';
  4:adoquery1.FieldValues['status']:='已充帐';
 end;
 
end;

end.
