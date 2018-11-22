unit dmo;

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs;

type
  TDM = class(TDataModule)
    ADOConn: TADOConnection;
    ADO10: TADODataSet;
    DataSource1: TDataSource;
    ADO10RKEY: TAutoIncField;
    ADO10CUST_CODE: TStringField;
    ADO10CUSTOMER_NAME: TStringField;
    ADOStandard: TADODataSet;
    ADOTool: TADODataSet;
    ADOSundry: TADODataSet;
    ADONoReturnMemo: TADODataSet;
    ADOQuery1: TADOQuery;
    ADOItems0: TADOQuery;
    ADOItems0amount: TFloatField;
    ADOItems0category: TStringField;
    ADOReturnMemo: TADODataSet;
    ADOStandardreq_no: TAutoIncField;
    ADOStandardrkey10: TAutoIncField;
    ADOStandardCUST_CODE: TStringField;
    ADOStandardABBR_NAME: TStringField;
    ADOStandardCUSTOMER_NAME: TStringField;
    ADOStandardRKEY: TAutoIncField;
    ADOStandardinvoice_number: TStringField;
    ADOStandardCURR_CODE: TStringField;
    ADOStandardEXCHANGE_RATE: TFloatField;
    ADOStandardPOSTED_DATE: TDateTimeField;
    ADOStandardINVOICE_DATE: TDateTimeField;
    ADOStandardINVOICE_TOTAL: TBCDField;
    ADOStandardamount_paid: TBCDField;
    ADOStandardamt_payable: TBCDField;
    ADOStandardPO_NUMBER: TStringField;
    ADOStandardMANU_PART_NUMBER: TStringField;
    ADOStandardMANU_PART_DESC: TStringField;
    ADOStandardANALYSIS_CODE_2: TStringField;
    ADOStandardLAYERS: TWordField;
    ADOStandardPRODUCT_NAME: TStringField;
    ADOStandardANALYSIS_CODE_1: TStringField;
    ADOStandardunit_sq: TFloatField;
    ADOStandarddelivery_no: TStringField;
    ADOStandardSALES_ORDER: TStringField;
    ADOStandardDATE_SHIPPED: TDateTimeField;
    ADOStandardquan_shipped: TBCDField;
    ADOStandardovsh_qty: TIntegerField;
    ADOStandardPARTS_ALLOC: TFloatField;
    ADOStandardTAX_2: TBCDField;
    ADOStandardRUSH_CHARGE_AMOUNT: TFloatField;
    ADOStandardamt_shipped: TFloatField;
    ADOStandarddelivery_price: TFloatField;
    ADOStandardMISC_INV_DESCRIPTION: TStringField;
    ADOStandardcost_2: TFloatField;
    ADOStandardGLPTR_STATUS: TBooleanField;
    ADOStandardso_tp: TStringField;
    ADOStandardSupp_name: TStringField;
    ADOStandardREF_NUMBER: TStringField;
    ADOStandardcust_decl: TStringField;
    ADOStandardPARTS_ORDERED: TFloatField;
    ADOStandardFactory_name: TStringField;
    ADOToolreq_no: TAutoIncField;
    ADOToolrkey10: TAutoIncField;
    ADOToolCUST_CODE: TStringField;
    ADOToolABBR_NAME: TStringField;
    ADOToolCUSTOMER_NAME: TStringField;
    ADOToolRKEY: TAutoIncField;
    ADOToolinvoice_number: TStringField;
    ADOToolCURR_CODE: TStringField;
    ADOToolEXCHANGE_RATE: TFloatField;
    ADOToolPOSTED_DATE: TDateTimeField;
    ADOToolINVOICE_DATE: TDateTimeField;
    ADOToolINVOICE_TOTAL: TBCDField;
    ADOToolamount_paid: TBCDField;
    ADOToolamt_payable: TBCDField;
    ADOToolPO_NUMBER: TStringField;
    ADOToolMANU_PART_NUMBER: TStringField;
    ADOToolMANU_PART_DESC: TStringField;
    ADOToolANALYSIS_CODE_2: TStringField;
    ADOToolLAYERS: TWordField;
    ADOToolPRODUCT_NAME: TStringField;
    ADOToolANALYSIS_CODE_1: TStringField;
    ADOToolunit_sq: TFloatField;
    ADOTooldelivery_no: TStringField;
    ADOToolSALES_ORDER: TStringField;
    ADOTooldate_shipped: TStringField;
    ADOToolquan_shipped: TIntegerField;
    ADOToolovsh_qty: TIntegerField;
    ADOToolPARTS_ALLOC: TStringField;
    ADOTooltax_2: TBCDField;
    ADOToolRUSH_CHARGE_AMOUNT: TBCDField;
    ADOToolamt_shipped: TBCDField;
    ADOTooldelivery_price: TBCDField;
    ADOToolcost_2: TIntegerField;
    ADOToolGLPTR_STATUS: TBooleanField;
    ADOToolso_tp: TStringField;
    ADOToolSupp_name: TStringField;
    ADOToolREF_NUMBER: TStringField;
    ADOToolcust_decl: TStringField;
    ADOToolPARTS_ORDERED: TFloatField;
    ADOToolFactory_name: TStringField;
    ADOSundryreq_no: TAutoIncField;
    ADOSundryrkey10: TAutoIncField;
    ADOSundryCUST_CODE: TStringField;
    ADOSundryABBR_NAME: TStringField;
    ADOSundryCUSTOMER_NAME: TStringField;
    ADOSundryRKEY: TAutoIncField;
    ADOSundryinvoice_number: TStringField;
    ADOSundryCURR_CODE: TStringField;
    ADOSundryEXCHANGE_RATE: TFloatField;
    ADOSundryPOSTED_DATE: TDateTimeField;
    ADOSundryINVOICE_DATE: TDateTimeField;
    ADOSundryINVOICE_TOTAL: TBCDField;
    ADOSundryamount_paid: TBCDField;
    ADOSundryamt_payable: TBCDField;
    ADOSundryPO_NUMBER: TStringField;
    ADOSundryMANU_PART_NUMBER: TStringField;
    ADOSundryMANU_PART_DESC: TStringField;
    ADOSundryANALYSIS_CODE_2: TStringField;
    ADOSundryLAYERS: TStringField;
    ADOSundryPRODUCT_NAME: TStringField;
    ADOSundryANALYSIS_CODE_1: TStringField;
    ADOSundryunit_sq: TStringField;
    ADOSundrydelivery_no: TStringField;
    ADOSundrySALES_ORDER: TStringField;
    ADOSundrydate_shipped: TStringField;
    ADOSundryquan_shipped: TIntegerField;
    ADOSundryovsh_qty: TIntegerField;
    ADOSundryPARTS_ALLOC: TStringField;
    ADOSundrytax_2: TBCDField;
    ADOSundryRUSH_CHARGE_AMOUNT: TBCDField;
    ADOSundryamt_shipped: TBCDField;
    ADOSundrydelivery_price: TBCDField;
    ADOSundryMISC_INV_DESCRIPTION: TStringField;
    ADOSundrycost_2: TIntegerField;
    ADOSundryGLPTR_STATUS: TBooleanField;
    ADOSundryso_tp: TStringField;
    ADOSundrySupp_name: TStringField;
    ADOSundryREF_NUMBER: TStringField;
    ADOSundrycust_decl: TStringField;
    ADOSundryPARTS_ORDERED: TIntegerField;
    ADOSundryFactory_name: TStringField;
    ADOReturnMemoreq_no: TAutoIncField;
    ADOReturnMemorkey10: TAutoIncField;
    ADOReturnMemoCUST_CODE: TStringField;
    ADOReturnMemoABBR_NAME: TStringField;
    ADOReturnMemoCUSTOMER_NAME: TStringField;
    ADOReturnMemoRKEY: TAutoIncField;
    ADOReturnMemoinvoice_number: TStringField;
    ADOReturnMemoCURR_CODE: TStringField;
    ADOReturnMemoEXCHANGE_RATE: TFloatField;
    ADOReturnMemoPOSTED_DATE: TDateTimeField;
    ADOReturnMemoinvoice_date: TDateTimeField;
    ADOReturnMemoinvoice_total: TBCDField;
    ADOReturnMemoamount_paid: TBCDField;
    ADOReturnMemoamt_payable: TBCDField;
    ADOReturnMemoPO_NUMBER: TStringField;
    ADOReturnMemoMANU_PART_NUMBER: TStringField;
    ADOReturnMemoMANU_PART_DESC: TStringField;
    ADOReturnMemoANALYSIS_CODE_2: TStringField;
    ADOReturnMemoLAYERS: TWordField;
    ADOReturnMemoPRODUCT_NAME: TStringField;
    ADOReturnMemoANALYSIS_CODE_1: TStringField;
    ADOReturnMemounit_sq: TFloatField;
    ADOReturnMemodelivery_no: TStringField;
    ADOReturnMemoSALES_ORDER: TStringField;
    ADOReturnMemodate_shipped: TDateTimeField;
    ADOReturnMemoquan_shipped: TIntegerField;
    ADOReturnMemoovsh_qty: TIntegerField;
    ADOReturnMemoPARTS_ALLOC: TFloatField;
    ADOReturnMemotax_2: TBCDField;
    ADOReturnMemoRUSH_CHARGE_AMOUNT: TFloatField;
    ADOReturnMemoamt_shipped: TFloatField;
    ADOReturnMemodelivery_price: TFloatField;
    ADOReturnMemoMISC_INV_DESCRIPTION: TStringField;
    ADOReturnMemocost_2: TFloatField;
    ADOReturnMemoGLPTR_STATUS: TBooleanField;
    ADOReturnMemoso_tp: TStringField;
    ADOReturnMemoSupp_name: TStringField;
    ADOReturnMemoREF_NUMBER: TStringField;
    ADOReturnMemocust_decl: TStringField;
    ADOReturnMemoPARTS_ORDERED: TFloatField;
    ADOReturnMemoFactory_name: TStringField;
    ADONoReturnMemoreq_no: TAutoIncField;
    ADONoReturnMemorkey10: TAutoIncField;
    ADONoReturnMemoCUST_CODE: TStringField;
    ADONoReturnMemoABBR_NAME: TStringField;
    ADONoReturnMemoCUSTOMER_NAME: TStringField;
    ADONoReturnMemoRKEY: TAutoIncField;
    ADONoReturnMemoinvoice_number: TStringField;
    ADONoReturnMemoCURR_CODE: TStringField;
    ADONoReturnMemoexchange_rate: TFloatField;
    ADONoReturnMemoPOSTED_DATE: TDateTimeField;
    ADONoReturnMemoinvoice_date: TDateTimeField;
    ADONoReturnMemoinvoice_total: TBCDField;
    ADONoReturnMemoamount_paid: TBCDField;
    ADONoReturnMemoamt_payable: TBCDField;
    ADONoReturnMemoPO_NUMBER: TStringField;
    ADONoReturnMemoMANU_PART_NUMBER: TStringField;
    ADONoReturnMemoMANU_PART_DESC: TStringField;
    ADONoReturnMemoANALYSIS_CODE_2: TStringField;
    ADONoReturnMemoLAYERS: TStringField;
    ADONoReturnMemoPRODUCT_NAME: TStringField;
    ADONoReturnMemoANALYSIS_CODE_1: TStringField;
    ADONoReturnMemounit_sq: TStringField;
    ADONoReturnMemodelivery_no: TStringField;
    ADONoReturnMemoSALES_ORDER: TStringField;
    ADONoReturnMemodate_shipped: TStringField;
    ADONoReturnMemoquan_shipped: TIntegerField;
    ADONoReturnMemoovsh_qty: TIntegerField;
    ADONoReturnMemoPARTS_ALLOC: TStringField;
    ADONoReturnMemotax_2: TBCDField;
    ADONoReturnMemoRUSH_CHARGE_AMOUNT: TBCDField;
    ADONoReturnMemoamt_shipped: TBCDField;
    ADONoReturnMemodelivery_price: TBCDField;
    ADONoReturnMemoMISC_INV_DESCRIPTION: TStringField;
    ADONoReturnMemocost_2: TIntegerField;
    ADONoReturnMemoGLPTR_STATUS: TBooleanField;
    ADONoReturnMemoso_tp: TStringField;
    ADONoReturnMemoSupp_name: TStringField;
    ADONoReturnMemoREF_NUMBER: TStringField;
    ADONoReturnMemocust_decl: TStringField;
    ADONoReturnMemoPARTS_ORDERED: TIntegerField;
    ADONoReturnMemoFactory_name: TStringField;
    ADOToolMISC_INV_DESCRIPTION: TStringField;
    ADOStandardassign_type: TStringField;
    ADOToolassign_type: TStringField;
    ADOSundryassign_type: TStringField;
    ADOReturnMemoassign_type: TStringField;
    ADONoReturnMemoassign_type: TStringField;
    ADOStandardrate_margin: TBCDField;
    ADOToolrate_margin: TStringField;
    ADOSundryrate_margin: TStringField;
    ADOReturnMemorate_margin: TStringField;
    ADONoReturnMemorate_margin: TStringField;
    ADOToolORIG_CUSTOMER: TStringField;
    ADOStandardORIG_CUSTOMER: TStringField;
    ADOSundryORIG_CUSTOMER: TStringField;
    ADOReturnMemoORIG_CUSTOMER: TStringField;
    ADONoReturnMemoORIG_CUSTOMER: TStringField;
    ADO10_1: TADODataSet;
    ADO10_1RKEY: TAutoIncField;
    ADO10_1CUST_CODE: TStringField;
    ADO10_1CUSTOMER_NAME: TStringField;
    ADOStandardsttype: TStringField;
    ADOToolsttype: TStringField;
    ADOSundrysttype: TStringField;
    ADOReturnMemosttype: TStringField;
    ADONoReturnMemosttype: TStringField;
    qry_010: TADOQuery;
    qry_010RKEY: TAutoIncField;
    qry_010CUST_CODE: TStringField;
    qry_010CUSTOMER_NAME: TStringField;
    ADOStandardbzfp: TStringField;
    ADOStandardEMPLOYEE_NAME: TStringField;
    ADOStandardFED_TAX_ID_NO: TStringField;
    ADOStandardchmj: TFloatField;
    ADOToolEMPLOYEE_NAME: TStringField;
    ADOToolFED_TAX_ID_NO: TStringField;
    ADOToolchmj: TIntegerField;
    ADOToolType: TStringField;
    ADOSundryTYPE: TStringField;
    ADOSundryEMPLOYEE_NAME: TStringField;
    ADOSundryFED_TAX_ID_NO: TStringField;
    ADOSundrychmj: TIntegerField;
    ADOReturnMemoEMPLOYEE_NAME: TStringField;
    ADOReturnMemoFED_TAX_ID_NO: TStringField;
    ADOReturnMemoTYPE: TStringField;
    ADONoReturnMemoEMPLOYEE_NAME: TStringField;
    ADONoReturnMemoFED_TAX_ID_NO: TStringField;
    ADONoReturnMemochmj: TIntegerField;
    ADONoReturnMemoTYPE: TStringField;
    ADOReturnMemochmj: TFloatField;
    ADOStandardROW_NAME: TStringField;
    ADOToolROW_NAME: TStringField;
    ADOSundryROW_NAME: TStringField;
    ADOReturnMemoROW_NAME: TStringField;
    ADONoReturnMemoROW_NAME: TStringField;
    ADOStandardset_qty: TIntegerField;
    ADOToolset_qty: TIntegerField;
    ADOReturnMemoset_qty: TIntegerField;
    ADONoReturnMemoset_qty: TStringField;
    ADOSundryset_qty: TStringField;
    procedure ADOToolCalcFields(DataSet: TDataSet);
    procedure ADOStandardCalcFields(DataSet: TDataSet);
    procedure ADOSundryCalcFields(DataSet: TDataSet);
    procedure ADOReturnMemoCalcFields(DataSet: TDataSet);
    procedure ADONoReturnMemoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADOToolCalcFields(DataSet: TDataSet);
begin
  with AdoItems0 do
  begin
    close;
    parameters.ParamByName('rkey').Value := ADOToolRKEY.Value;
    open;
  end;
  if not AdoItems0.IsEmpty then
  begin
    AdoItems0.First;
    with AdoItems0 do
    while not eof do
    begin
      ADOToolMISC_INV_DESCRIPTION.Value:=trim(ADOToolMISC_INV_DESCRIPTION.Value)+ ' '+
       AdoItems0.FieldByName('category').AsString+':'+AdoItems0.FieldByName('amount').AsString;
      next;
    end;
  end;
  DataSet.FieldByName('TYPE').Value :='工具发票';
end;

procedure TDM.ADOStandardCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('TYPE').Value := '标准发票' ;
end;

procedure TDM.ADOSundryCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('TYPE').Value := '杂项发票' ;
end;

procedure TDM.ADOReturnMemoCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('TYPE').Value := '退货备忘' ;
end;

procedure TDM.ADONoReturnMemoCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('TYPE').Value := '无退货备忘' ;
end;

end.
