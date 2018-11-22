unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADO0456: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ADO0457: TADOQuery;
    ADOnow: TADOQuery;
    ADO0456WAREHOUSE_NAME: TStringField;
    ADO0456SUPPLIER_NAME: TStringField;
    ADO0456PO_NUMBER: TStringField;
    ADO0456goods_type: TStringField;
    ADO0456goods_guige: TStringField;
    ADO0456goods_name: TStringField;
    ADO0456rohs: TStringField;
    ADO0456unit_price: TBCDField;
    ADO0456QUAN_RECD: TBCDField;
    ADO0456EMPLOYEE_NAME: TStringField;
    ADO0456GRN_NUMBER: TStringField;
    ADO0456DELIVER_NUMBER: TStringField;
    ADO0457EMPLOYEE_NAME: TStringField;
    ADO0457goods_name: TStringField;
    ADO0457goods_type: TStringField;
    ADO0457goods_guige: TStringField;
    ADO0457QUANTITY: TBCDField;
    ADO0457RTN_QUANTITY: TBCDField;
    ADO0457rohs: TStringField;
    ADO0457QUAN_ON_HAND: TBCDField;
    ADO0457GON_NUMBER: TStringField;
    ADO0457WAREHOUSE_NAME: TStringField;
    ADO0457DEPT_NAME: TStringField;
    ADO0457CREATE_DATE: TDateTimeField;
    ADO0457unit_price: TBCDField;
    ADO0456CODE: TStringField;
    ADO0456WAREHOUSE_CODE: TStringField;
    ADO0456EMPL_CODE: TStringField;
    ADO0457EMPL_CODE: TStringField;
    ADO0457WAREHOUSE_CODE: TStringField;
    ADO0457DEPT_CODE: TStringField;
    ADOnowUNIT_NAME: TStringField;
    ADOnowgoods_name: TStringField;
    ADOnowgoods_guige: TStringField;
    ADOnowgoods_type: TStringField;
    ADOnowDSDesigner: TBCDField;
    ADOnowWAREHOUSE_CODE: TStringField;
    ADOnowWAREHOUSE_NAME: TStringField;
    ADOnowSUPPLIER_NAME: TStringField;
    ADOnowCODE: TStringField;
    ADOnowDSDesigner2: TBCDField;
    ADOnowDSDesigner3: TBCDField;
    ADO0456EXCH_RATE: TBCDField;
    ADO0457exch_rate: TBCDField;
    ADOnowDSDesigner4: TBCDField;
    ADO0456abbr_name: TStringField;
    ADO0456state_tax: TBCDField;
    ADO0456DSDesigner: TBCDField;
    ADO0456ship_DATE: TDateTimeField;
    ADO0456DSDesigner2: TStringField;
    ADO0456DSDesigner3: TStringField;
    ADO0457DSDesigner: TStringField;
    ADO0457DSDesigner2: TStringField;
    ADOnowDSDesigner5: TStringField;
    ADO0457DSDesigner3: TBCDField;
    ADO0457DSDesigner4: TBCDField;
    ADO0457DSDesigner5: TBCDField;
    ADO0457DSDesigner6: TBCDField;
    ADO0457ref_number: TStringField;
    ADOnowstate_tax: TBCDField;
    ADOnowDSDesigner6: TBCDField;
    ADO0456DSDesigner4: TStringField;
    ADOnowDSDesigner7: TStringField;
    ADOnowDSDesigner8: TStringField;
    ADOnowship_DATE: TDateTimeField;
    ADOnowREF_NUMBER: TStringField;
    ADOnowPO_NUMBER: TStringField;
    ADO0457Cut_NO: TStringField;
    ADO0457DSDesigner7: TStringField;
    ADO0456DSDesigner5: TBCDField;
    ADO0456DSDesigner6: TBCDField;
    ADO0456DSDesigner7: TStringField;
    ADO0457DSDesigner8: TStringField;
    ADOQuery1: TADOQuery;
    AdoCutoff: TADOQuery;
    Ado255: TADOQuery;
    Ado256: TADOQuery;
    Ado255CutoffDate: TDateTimeField;
    Ado255Operator05: TIntegerField;
    Ado255OperatorDate: TDateTimeField;
    Ado255Remark: TStringField;
    Ado256CutoffDate: TDateTimeField;
    Ado256Rkey235: TIntegerField;
    Ado256Stock: TFloatField;
    AdoQry255: TADOQuery;
    AdoQry256: TADOQuery;
    AdoQry256goods_name: TStringField;
    AdoQry256goods_guige: TStringField;
    AdoQry256goods_type: TStringField;
    AdoQry256UNIT_NAME: TStringField;
    AdoQry256DSDesigner: TStringField;
    AdoQry256WAREHOUSE_CODE: TStringField;
    AdoQry256SUPPLIER_NAME: TStringField;
    AdoQry256CODE: TStringField;
    AdoQry256DSDesigner2: TStringField;
    AdoQry256DSDesigner3: TBCDField;
    AdoQry256DSDesigner4: TBCDField;
    AdoQry256DSDesigner5: TStringField;
    AdoQry256state_tax: TBCDField;
    AdoQry256DSDesigner6: TBCDField;
    AdoQry256ship_DATE: TDateTimeField;
    AdoQry256DSDesigner7: TBCDField;
    AdoQry256DSDesigner8: TBCDField;
    AdoQry256REF_NUMBER: TStringField;
    AdoQry256PO_NUMBER: TStringField;
    AdoQry256CutoffDate: TDateTimeField;
    AdoQry256Stock: TFloatField;
    AdoQry256DSDesigner9: TFloatField;
    AdoQry255CutoffDate: TDateTimeField;
    AdoQry255Operator05: TIntegerField;
    AdoQry255OperatorDate: TDateTimeField;
    AdoQry255Remark: TStringField;
    AdoQry255EMPLOYEE_NAME: TStringField;
    AdoQry256ABBR_NAME: TStringField;
    ADO0457DSDesigner9: TStringField;
    AdoQry256DSDesigner10: TFloatField;
    ADO0456DATE_RECD: TDateTimeField;
    ADOnowDATE_RECD: TDateTimeField;
    ADO0456cust_decl: TStringField;
    ADOnowcust_decl: TStringField;
    ADO0456REF_NUMBER: TStringField;
    ADOnowrkey235: TAutoIncField;
    procedure ADOnowBeforeInsert(DataSet: TDataSet);
    procedure ADOnowBeforeDelete(DataSet: TDataSet);
    procedure ADOnowBeforeEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation
   uses common;
{$R *.dfm}

procedure Tdm.ADOnowBeforeInsert(DataSet: TDataSet);
begin
Abort;
end;

procedure Tdm.ADOnowBeforeDelete(DataSet: TDataSet);
begin
Abort;
end;

procedure Tdm.ADOnowBeforeEdit(DataSet: TDataSet);
begin
  if (StrToInt(vprev)=1) or (StrToInt(vprev)= 3) then
  begin
    MessageDlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Abort;
  end;
end;

end.

