unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB,windows;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    tmp: TADOQuery;
    AQ68: TADOQuery;
    AQ68rkey: TIntegerField;
    AQ68po_req_number: TStringField;
    AQ68status: TWordField;
    AQ68flag: TStringField;
    AQ68req_date: TDateTimeField;
    AQ68req_by: TIntegerField;
    AQ68buyer_ptr: TIntegerField;
    AQ68empl_code: TStringField;
    AQ68employee_name: TStringField;
    AQ68v_status: TStringField;
    AQ68v_flag: TStringField;
    AQ68department_name: TStringField;
    AQ68data275_ptr: TIntegerField;
    AQ68auth_date: TDateTimeField;
    AQ68TOTAL: TBCDField;
    AQ68AUTH_TYPE: TIntegerField;
    AQ68abbr_name: TStringField;
    AQ68ent_date: TDateTimeField;
    AQ68edited_date: TDateTimeField;
    AQ69: TADOQuery;
    AQ69RKEY: TAutoIncField;
    AQ69PURCH_REQ_PTR: TIntegerField;
    AQ69INVT_PTR: TIntegerField;
    AQ69SUPP_PTR: TIntegerField;
    AQ69PO_LINK_PTR: TIntegerField;
    AQ69REQ_DATE: TDateTimeField;
    AQ69QUANTITY: TFloatField;
    AQ69UNIT_PTR: TIntegerField;
    AQ69o_i_flag: TWordField;
    AQ69reply_date: TDateTimeField;
    AQ69reason: TStringField;
    AQ69extra_req: TStringField;
    AQ69inv_name: TStringField;
    AQ69inv_part_number: TStringField;
    AQ69inv_description: TStringField;
    AQ69unit_code: TStringField;
    AQ69unit_name: TStringField;
    AQ204: TADOQuery;
    AQ204RKEY: TAutoIncField;
    AQ204PURCHASE_REQ_PTR: TIntegerField;
    AQ204DESCRIPTION_1: TStringField;
    AQ204GUI_GE: TStringField;
    AQ204DESCRIPTION_2: TStringField;
    AQ204G_L_PTR: TIntegerField;
    AQ204QUANTITY_REQUIRED: TFloatField;
    AQ204REQ_DATE: TDateTimeField;
    AQ204o_i_flag: TWordField;
    AQ204reply_date: TDateTimeField;
    AQ204reason: TStringField;
    AQ204UNIT_CODE: TStringField;
    AQ204UNIT_NAME: TStringField;
    DS2: TDataSource;
    DS3: TDataSource;
    DS1: TDataSource;
    AQ68warehouse_code: TStringField;
    AQ68PURCHASE_APPROV_DESC: TStringField;
    AQ68DESCRIPTION: TStringField;
    AQ68code94: TStringField;
    AQ68code362: TStringField;
    AQ68USER_PTR: TIntegerField;
    AQ68APPD_BY: TIntegerField;
    AQ68WHSE_PTR: TIntegerField;
    AQ68budget_ptr: TIntegerField;
    AQ68NPAD_PTR: TIntegerField;
    AQ68EDITED_BY_USER_PTR: TIntegerField;
    AQ68EDITED_BY_EMP_PTR: TIntegerField;
    AQ68CURRENY_PTR: TIntegerField;
    AQ68EXCHANGE_RATE: TFloatField;
    AQ68v_year: TSmallintField;
    AQ68v_month: TSmallintField;
    ADO11: TADOQuery;
    AQ69CONVERSION_FACTOR: TFloatField;
    tmp1: TADOQuery;
    AQ68USER_FULL_NAME: TStringField;
    AQ68ranking: TWordField;
    AQ68authUser_ptr: TIntegerField;
    AQ68auth_flag: TStringField;
    AQ68rkey276: TAutoIncField;
    AQ69avl_flag: TStringField;
    AQ68authdate276: TDateTimeField;
    AQ69CurrStQty: TFloatField;
    ADOstdprice: TADOQuery;
    ADOstdpriceQUANTITY: TFloatField;
    ADOstdpriceUNIT_PRICE: TFloatField;
    ADOstdpriceREQ_DATE: TDateTimeField;
    ADOstdpriceUNIT_NAME: TStringField;
    ADOstdpriceCURR_NAME: TStringField;
    ADOstdpriceABBR_NAME: TStringField;
    ADOstdpriceo_i_flag: TWordField;
    ADOstdpricein_out: TStringField;
    ADOmicprice: TADOQuery;
    ADOmicpriceDESCRIPTION_1: TStringField;
    ADOmicpriceGUI_GE: TStringField;
    ADOmicpriceQUANTITY_REQUIRED: TFloatField;
    ADOmicpriceUNIT_PRICE: TFloatField;
    ADOmicpriceREQ_DATE: TDateTimeField;
    ADOmicpriceo_i_flag: TWordField;
    ADOmicpriceCURR_NAME: TStringField;
    ADOmicpriceABBR_NAME: TStringField;
    ADOmicpriceUNIT_NAME: TStringField;
    ADOmicpricein_out: TStringField;
    ADO28: TADOQuery;
    ADO28PRICE_1: TFloatField;
    ADO28AVL_FLAG: TStringField;
    ADO28LEAD_TIME: TSmallintField;
    ADO28TAX_2: TFloatField;
    ADO28CURR_NAME: TStringField;
    ADO28UNIT_NAME: TStringField;
    ADO28ABBR_NAME: TStringField;
    ADO28avl_type: TStringField;
    AQ69qty_zaitu: TFloatField;
    AQ68user_name: TStringField;
    AQ68user_phone: TStringField;
    AQ69CRITICAL_MATL: TStringField;
    AQ69VMI_QTY: TBCDField;
    AQ69IF_urgency: TBooleanField;
    AQ69req_quantity: TBCDField;
    AQ204IF_urgency: TBooleanField;
    AQ204req_quantity: TBCDField;
    procedure AQ68CalcFields(DataSet: TDataSet);
    procedure AQ68AfterScroll(DataSet: TDataSet);
    procedure AQ68AfterOpen(DataSet: TDataSet);
  private

  public

  end;

var
  DM: TDM;
  H_mainFrm:Thandle;
implementation

{$R *.dfm}

procedure TDM.AQ68CalcFields(DataSet: TDataSet);
begin
 if AQ68flag.Value='S' then
   dm.AQ68v_flag.Value :='生产物料'
 else
   dm.AQ68v_flag.Value :='杂项物料';

 case AQ68status.Value of
  7 : AQ68v_status.Value := '未提交';
  1 : AQ68v_status.Value := '待审批';
  2 : AQ68v_status.Value := '待采购';
  3 : AQ68v_status.Value := '已批准';
  4 : AQ68v_status.Value := '被退回';
  5 : AQ68v_status.Value := '请购单已撤消';
  6 : AQ68v_status.Value := '请购单已处理';
 end;
end;

procedure TDM.AQ68AfterScroll(DataSet: TDataSet);
begin
  if DataSet.FieldByName('flag').AsString='S' then
  begin
    AQ69.Close;
    AQ69.Parameters[0].Value:=DataSet.FieldValues['rkey'];
    AQ69.Open;
    sendmessage(H_mainFrm,5678,0,0);
  end else
   begin
    AQ204.Close;
    AQ204.Parameters[0].Value:=DataSet.Fieldbyname('rkey').Value;
    AQ204.Open;
    sendmessage(H_mainFrm,5678,1,0);
   end;
end;

procedure TDM.AQ68AfterOpen(DataSet: TDataSet);
begin
  AQ69.Close;
  AQ69.Parameters[0].Value:=DataSet.Fieldbyname('rkey').Value;
  AQ69.Open;
  AQ204.Close;
  AQ204.Parameters[0].Value:=DataSet.Fieldbyname('rkey').Value;
  AQ204.Open;
end;

end.
