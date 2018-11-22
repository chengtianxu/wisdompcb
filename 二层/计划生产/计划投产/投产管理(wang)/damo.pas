unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB, Provider, DBClient;

type
  TFieldEvent = procedure(Sender: TField) of object;

  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADS60: TADODataSet;
    ADS60SALES_ORDER: TStringField;
    ADS60MANU_PART_NUMBER: TStringField;
    ADS60MANU_PART_DESC: TStringField;
    ADS60CUST_CODE: TStringField;
    ADS60PO_NUMBER: TStringField;
    ADS60PROD_CODE: TStringField;
    ADS60PRODUCT_NAME: TStringField;
    ADS60PARTS_ORDERED: TFloatField;
    ADS60TO_BE_PLANNED: TIntegerField;
    ADS60SCH_DATE: TDateTimeField;
    ADS60so_oldnew: TStringField;
    ADS60planned_date: TDateTimeField;
    ADS60sostyle: TStringField;
    ADS60prodrel: TStringField;
    ADS60auth_style: TStringField;
    ADS60MyBOM_STATUS: TStringField;
    ADS60MI_status: TStringField;
    ADS60PROD_REL: TStringField;
    ADS60ONHOLD_PLANNING_FLAG: TWordField;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADS60rkey: TIntegerField;
    ADS60ent_date: TDateTimeField;
    ADS60PURCHASE_ORDER_PTR: TIntegerField;
    ADS60CUST_PART_PTR: TIntegerField;
    ADS60REFERENCE_NUMBER: TStringField;
    ADOQuery2: TADOQuery;
    ADS60SHIP_REG_TAX_ID: TIntegerField;
    ADS60OPT_LOT_SIZE: TIntegerField;
    ADS60EST_SCRAP: TFloatField;
    AQY492: TADOQuery;
    AQY492rkey: TAutoIncField;
    AQY492TTYPE: TWordField;
    AQY492CUT_NO: TStringField;
    AQY492SO_NO: TStringField;
    AQY492BOM_PTR: TIntegerField;
    AQY492PLANNED_QTY: TIntegerField;
    AQY492ISSUED_QTY: TIntegerField;
    AQY492SCH_COMPL_DATE: TDateTimeField;
    AQY492ISSUE_DATE: TDateTimeField;
    AQY492CREATED_BY_PTR: TIntegerField;
    AQY492UPANEL1: TIntegerField;
    AQY492PANEL_1_QTY: TIntegerField;
    AQY492UPANEL2: TIntegerField;
    AQY492PANEL_2_QTY: TIntegerField;
    AQY492remark: TStringField;
    AQY492ORD_REQ_QTY: TIntegerField;
    AQY492TSTATUS: TWordField;
    AQY492mrb_ptr: TIntegerField;
    AQY492Con_Flag: TSmallintField;
    AQY492pnl1_size: TStringField;
    AQY492pnl2_size: TStringField;
    AQY492analysis_code_3: TStringField;
    AQY492WHOUSE_PTR: TIntegerField;
    aqy04: TADOQuery;
    aqy04CONTROL_NO_LENGTH: TSmallintField;
    aqy04SEED_FLAG: TWordField;
    aqy04SEED_VALUE: TStringField;
    AQY06: TADOQuery;
    AQY06WORK_ORDER_NUMBER: TStringField;
    AQY06CUT_NO: TStringField;
    AQY06PANEL_A_B: TIntegerField;
    AQY06BOM_PTR: TIntegerField;
    AQY06PROD_STATUS: TSmallintField;
    AQY06QUAN_SCH: TFloatField;
    AQY06PANELS: TIntegerField;
    AQY06ENT_DATETIME: TDateTimeField;
    AQY06SCH_COMPL_DATE: TDateTimeField;
    AQY06PARTS_PER_PANEL: TFloatField;
    AQY06panel_ln: TFloatField;
    AQY06panel_wd: TFloatField;
    AQY06pnl_size: TStringField;
    AQY06WIPMAT_STATUS: TSmallintField;
    AQY468: TADOQuery;
    AQY468CUT_NO: TStringField;
    AQY468SO_NO: TStringField;
    AQY468STEP: TSmallintField;
    AQY468DEPT_PTR: TIntegerField;
    AQY468INVENT_PTR: TIntegerField;
    AQY468QUAN_BOM: TFloatField;
    AQY468STATUS: TSmallintField;
    AQY468VENDOR: TStringField;
    AQY468Invent_or: TSmallintField;
    AQY468printit: TStringField;
    AQY06BEGIN_STEP_NO: TSmallintField;
    AQY06RELEASE_DATE: TDateTimeField;
    AQY06rkey: TAutoIncField;
    AQY06employee_ptr: TIntegerField;
    AQY492waitfor_release: TIntegerField;
    AQY492wip_qty: TIntegerField;
    AQY06remark_pnls: TFloatField;
    ADS60compl_date: TDateTimeField;
    ADS60QTY_ON_HAND: TIntegerField;
    ADS60warehouse_code: TStringField;
    AQY06ppc_flag: TSmallintField;
    ADS60spell_sq: TFloatField;
    AQY06WHOUSE_PTR: TIntegerField;
    AQY492COMPLETED: TIntegerField;
    ADS60CUSTOMER_PTR: TIntegerField;
    AQY06LOT_NUMBER: TStringField;
    ADOQuery3: TADOQuery;
    ADO279: TADOQuery;
    ADOQuery4: TADOQuery;
    ADO279PARAMETER_DESC: TStringField;
    ADO279PRODUCTION_FLAG: TIntegerField;
    ADO279spec_rkey: TStringField;
    DataSource2: TDataSource;
    AQY06CUTNO_WO: TStringField;
    DataSource5: TDataSource;
    ads494: TADODataSet;
    ads494PARAMETER_VALUE: TStringField;
    ads494step_number: TSmallintField;
    DataSource3: TDataSource;
    AQ0499: TADODataSet;
    AQ0499PARAMETER_PTR: TIntegerField;
    AQ0499DEF_VALUE: TStringField;
    AQ0499SEQ_NO: TSmallintField;
    AQ0499PARAMETER_NAME: TStringField;
    AQ0499PARAMETER_DESC: TStringField;
    AQ0499UNIT_NAME: TStringField;
    AQ0499inv_group_ptr: TIntegerField;
    aqQnty: TADOQuery;
    aqQntyMANU_PART_NUMBER: TStringField;
    aqQntySALES_ORDER: TStringField;
    aqQntyQTY_ON_HAND: TFloatField;
    ADS60parts_margin: TFloatField;
    aqQnty1: TADOQuery;
    aqQnty1RKEY: TAutoIncField;
    aqQnty1MANU_PART_NUMBER: TStringField;
    aqQnty1SALES_ORDER: TStringField;
    aqQnty1QTY_ON_HAND: TFloatField;
    aqQnty1WAREHOUSE_CODE: TStringField;
    aqQnty1ABBR_NAME: TStringField;
    aqQnty1LOCATION: TStringField;
    aqQnty1MFG_DATE: TDateTimeField;
    aqQnty1PO_NUMBER: TStringField;
    aqQnty1spec_place: TStringField;
    aqQnty1sType: TStringField;
    dsQnty1: TDataSource;
    cdsQnty1: TClientDataSet;
    dspQnty1: TDataSetProvider;
    cdsQnty1RKEY: TAutoIncField;
    cdsQnty1MANU_PART_NUMBER: TStringField;
    cdsQnty1SALES_ORDER: TStringField;
    cdsQnty1QTY_ON_HAND: TFloatField;
    cdsQnty1WAREHOUSE_CODE: TStringField;
    cdsQnty1ABBR_NAME: TStringField;
    cdsQnty1LOCATION: TStringField;
    cdsQnty1MFG_DATE: TDateTimeField;
    cdsQnty1PO_NUMBER: TStringField;
    cdsQnty1spec_place: TStringField;
    cdsQnty1sType: TStringField;
    aqQnty1IsSelected: TWordField;
    cdsQnty1IsSelected: TSmallintField;
    aqTmp: TADOQuery;
    ADS60order_sq: TFloatField;
    ADS60SAMPLE_NR: TStringField;
    aqQnty1youxiaoqi: TDateTimeField;
    cdsQnty1youxiaoqi: TDateTimeField;
    ADS60state: TStringField;
    qrytmp: TADOQuery;
    ADS60rkey25: TIntegerField;
    AQY468supplier_ptr: TIntegerField;
    ads494PARAMETER_NAME: TStringField;
    ads494PARAMETER_DESC: TStringField;
    ads494seq_no: TSmallintField;
    ads494UNIT_NAME: TStringField;
    ads494datatype: TStringField;
    ads494SPEC_RKEY: TStringField;
    ADS60ANALYSIS_CODE_1: TStringField;
    ADS60set_qty: TIntegerField;
    ADS60ttype: TWordField;
    ADS60ANCESTOR_PTR: TIntegerField;
    AQY468offcut_qty: TIntegerField;
    ADS60P_CODE: TWordField;
    ADS60PRIORITY_name: TStringField;
    AQY06PRIORITY_CODE: TWordField;
    ADOQuery5: TADOQuery;
    ADOQuery6: TADOQuery;
    ADOQuery5MANU_PART_NUMBER: TStringField;
    ADOQuery5spec_rkey: TStringField;
    ADOQuery5PARAMETER_VALUE: TStringField;
    ADOQuery6MANU_PART_NUMBER: TStringField;
    ADOQuery6spec_rkey: TStringField;
    ADOQuery6PARAMETER_VALUE: TStringField;
    ADS60ORIG_CUSTOMER: TStringField;
    qry53: TADOQuery;
    ADS60PARTS_RETURNED: TFloatField;
    ADS60REPUT_APPR_BY: TIntegerField;
    qry53RKEY: TAutoIncField;
    qry53WHSE_PTR: TIntegerField;
    qry53LOC_PTR: TIntegerField;
    qry53WORK_ORDER_PTR: TIntegerField;
    qry53CUST_PART_PTR: TIntegerField;
    qry53QUANTITY: TFloatField;
    qry53QTY_ON_HAND: TFloatField;
    qry53QTY_ALLOC: TFloatField;
    qry53MFG_DATE: TDateTimeField;
    qry53RMA_PTR: TIntegerField;
    qry53NPAD_PTR: TIntegerField;
    qry53REFERENCE_NUMBER: TStringField;
    qry53USER_DATE: TDateTimeField;
    qry53barcode_ptr: TIntegerField;
    qry53DEPT_PTR: TIntegerField;
    qry53STEP: TSmallintField;
    qry53PANELS: TIntegerField;
    qry53EMPLOYEE_PTR: TIntegerField;
    qry53PO_NUMBER: TStringField;
    qry53cost_pcs: TFloatField;
    qry53spec_place: TStringField;
    qry53matl_ovhd_pcs: TFloatField;
    qry53OVHD_COST: TFloatField;
    qry53PLANNED_QTY: TFloatField;
    qry53ovhd1_pcs: TFloatField;
    qry53outsource_pcs: TFloatField;
    qry53rkey58: TIntegerField;
    qry53ischaban: TIntegerField;
    qry53zhouqi: TStringField;
    AQY492cite_qryonhand: TIntegerField;
    AQY492operation_rate: TBCDField;
    aqQnty1barcode_ptr: TIntegerField;
    cdsQnty1barcode_ptr: TIntegerField;
    ADS60AUDITED_DATE: TDateTimeField;
    ADS60tobeplanned_sq: TFloatField;
    ADS60strtype: TStringField;
    ADOTMP1: TADOQuery;
    AQY492BOM_UPDATE: TWordField;
    ADS60CONF_DATE: TDateTimeField;
    procedure cdsQnty1IsSelectedChange(Sender: TField);
    procedure aqQnty1BeforeClose(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    qty,selectQty:Integer;
    ChkRkey: TStringList;
    { Private declarations }
  public
    { Public declarations }
    function find_wip_code():string;
    procedure update_25lot(rkey25:integer);
    procedure SqlOpen(ASql: string);
    procedure CalcQty;
    procedure CancelChk;
    procedure ClearChk;
  end;

var
  DM: TDM;

implementation

uses Dialogs;

{$R *.dfm}

{ TDM }

function TDM.find_wip_code: string;
begin
with adoquery1 do
 begin
  close;
  sql.Text:='select top 1 wip_code from data0400 where status=0';
  open;
  if not isempty then
   result:=fieldbyname('wip_code').AsString
  else
   result:='';
  close;
 end;
end;

procedure TDM.SqlOpen(ASql: string);
begin
  qrytmp.Close;
  qrytmp.SQL.Clear;
  qrytmp.SQL.Add(ASql);
  qrytmp.Open;
end;

procedure TDM.update_25lot(rkey25: integer);
begin
  with adoquery1 do
  begin
    close;
    sql.Text:='update data0025 '+
                'set LAST_SO_DATE= getdate() '+
                'where rkey='+inttostr(rkey25);
    ExecSQL;
  end;
end;

procedure TDM.cdsQnty1IsSelectedChange(Sender: TField);          //20170615 mark by zsp
var
  FieldOnChang: TFieldEvent;
  Findex:Integer;
begin
  FieldOnChang:= cdsQnty1IsSelected.OnChange;
  if cdsQnty1IsSelected.AsInteger = 1 then
  begin
    if qty - selectQty > 0 then
    begin
      if qry53.Locate('RKEY',cdsQnty1RKEY.Value,[]) then
      begin
        qry53.Edit;
        qry53.FieldByName('barcode_ptr').Value := DM.ADS60rkey.Value;
        qry53.Post;
        selectqty:= selectqty + cdsQnty1QTY_ON_HAND.AsInteger;
//        ChkRkey.Add(DM.cdsQnty1RKEY.AsString);
      end;
    end
    else
    begin
      ShowMessage('入库数量已经超订单数量，不能绑定');
      cdsQnty1IsSelected.OnChange:= nil;
      try
        cdsQnty1.Edit;
        cdsQnty1IsSelected.AsInteger:= 0;
        cdsQnty1.Post;
      finally
        cdsQnty1IsSelected.OnChange:= FieldOnChang;
      end;
    end;
  end
  else
  begin
    if qry53.Locate('RKEY',cdsQnty1RKEY.Value,[]) then
    begin
      qry53.Edit;
      qry53.FieldByName('barcode_ptr').Value:= cdsQnty1barcode_ptr.value;
      qry53.Post;
//      ChkRkey.Delete(ChkRkey.IndexOf(DM.cdsQnty1RKEY.AsString));
      selectqty:= selectqty - cdsQnty1QTY_ON_HAND.AsInteger;
    end;
  end;
end;

procedure TDM.CalcQty;
begin
  selectqty:=0;
  qty:= ADS60PARTS_ORDERED.AsInteger + ads60PARTS_RETURNED.asinteger - ADS60REPUT_APPR_BY.AsInteger;

  cdsQnty1.DisableControls;
  try                                                                 //20170615 mark by zsp
    with cdsQnty1 do
    begin
      First;
      while not Eof do
      begin
        if FieldByName('IsSelected').AsInteger = 1 then
          selectqty:= selectqty + FieldByname('QTY_ON_HAND').AsInteger;
        Next;
      end;
    end;
//    selectqty:= 10000000;
  finally
    cdsQnty1.EnableControls;
  end;
end;

procedure TDM.aqQnty1BeforeClose(DataSet: TDataSet);
begin
  selectQty:=0;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  ChkRkey:= TStringList.Create;
  ChkRkey.Sorted := True;
  ChkRkey.Duplicates := dupIgnore;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  ChkRkey.Free;
end;

procedure TDM.CancelChk;
var
  i:Integer;
begin
  for i:=0 to ChkRkey.Count-1 do
  begin
    if cdsQnty1.Locate('rkey',ChkRkey[i],[]) then
    begin
      cdsQnty1.Edit;
      cdsQnty1IsSelected.AsInteger:= 0;
      cdsQnty1.Post;
    end;
  end;
end;

procedure TDM.ClearChk;
begin
  ChkRkey.Clear;
end;

end.
