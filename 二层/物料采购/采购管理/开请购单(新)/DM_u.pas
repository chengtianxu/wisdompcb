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
    AQ69PO_LINK_PTR: TIntegerField;
    AQ69REQ_DATE: TDateTimeField;
    AQ69QUANTITY: TFloatField;
    AQ69UNIT_PTR: TIntegerField;
    AQ69o_i_flag: TWordField;
    AQ69reason: TStringField;
    AQ69extra_req: TStringField;
    AQ69inv_name: TStringField;
    AQ69inv_part_number: TStringField;
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
    AQ68CURRENY_PTR: TIntegerField;
    AQ68EXCHANGE_RATE: TFloatField;
    AQ68v_year: TSmallintField;
    AQ68v_month: TSmallintField;
    ADO11: TADOQuery;
    AQ69CONVERSION_FACTOR: TFloatField;
    AQ17: TADODataSet;
    tmp1: TADOQuery;
    AQ69avl_flag: TStringField;
    AQ204reply_date: TDateTimeField;
    AQ69reply_date: TDateTimeField;
    AQ69req_unit_ptr: TIntegerField;
    AQ69unit_code_1: TStringField;
    AQ69INV_DESCRIPTION: TStringField;
    AQ69_1: TADOQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField1: TFloatField;
    DateTimeField1: TDateTimeField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    DateTimeField2: TDateTimeField;
    WordField1: TWordField;
    StringField8: TStringField;
    FloatField2: TFloatField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField9: TStringField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    AutoIncField1: TAutoIncField;
    AQ204_1: TADOQuery;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    FloatField3: TFloatField;
    DateTimeField3: TDateTimeField;
    StringField14: TStringField;
    StringField15: TStringField;
    DateTimeField4: TDateTimeField;
    WordField2: TWordField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    AutoIncField2: TAutoIncField;
    DS2_1: TDataSource;
    DS3_1: TDataSource;
    AQ68REQ_TYPE: TStringField;
    AQ68user_name: TStringField;
    AQ68user_phone: TStringField;
    AQ69CRITICAL_MATL: TStringField;
    AQ69_1CRITICAL_MATL_FLAG: TWordField;
    AQ69IF_urgency: TBooleanField;
    AQ69req_quantity: TBCDField;
    AQ204IF_urgency: TBooleanField;
    AQ204req_quantity: TBCDField;
    AQ69_1IF_urgency: TBooleanField;
    AQ69_1req_quantity: TBCDField;
    AQ204_1IF_urgency: TBooleanField;
    AQ204_1req_quantity: TBCDField;
    AQ69CONSIGN_ONHAND_QTY: TIntegerField;
    AQ69REPORT_VALUE2: TIntegerField;
    procedure AQ68CalcFields(DataSet: TDataSet);
    procedure AQ68AfterScroll(DataSet: TDataSet);
    procedure AQ68AfterOpen(DataSet: TDataSet);
    procedure AQ69CalcFields(DataSet: TDataSet);
    procedure AQ204CalcFields(DataSet: TDataSet);
    procedure AQ69NewRecord(DataSet: TDataSet);
    procedure AQ204NewRecord(DataSet: TDataSet);
    procedure AQ17AfterOpen(DataSet: TDataSet);
    procedure AQ69AfterPost(DataSet: TDataSet);
    procedure AQ204AfterPost(DataSet: TDataSet);
  private
    ReqDate:Tdatetime;
  public

  end;

var
  DM: TDM;
  dept_code,dept_name,rkey05,pr_id,whs_ptr:string;
  system_date : TDateTime;
  H_mainFrm:Thandle;
  D17Ok:boolean;

implementation

{$R *.dfm}

procedure TDM.AQ68CalcFields(DataSet: TDataSet);
begin
 if AQ68flag.Value='S' then
   dm.AQ68v_flag.Value :='生产物料'
 else if AQ68flag.Value='M' then
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
    AQ69_1.Close;
    AQ69_1.Parameters[0].Value:=DataSet.FieldValues['rkey'];
    AQ69_1.Open;
    sendmessage(H_mainFrm,6789,0,0);
  end else begin
    AQ204_1.Close;
    AQ204_1.Parameters[0].Value:=DataSet.Fieldbyname('rkey').Value;
    AQ204_1.Open;
    sendmessage(H_mainFrm,6789,1,0);
  end;
end;

procedure TDM.AQ68AfterOpen(DataSet: TDataSet);
begin
  AQ69.Close;
  AQ69.Parameters[0].Value:=DataSet.Fieldbyname('rkey').AsInteger;
  AQ69.Open;
  AQ204.Close;
  AQ204.Parameters[0].Value:=DataSet.Fieldbyname('rkey').Value;
  AQ204.Open;
  AQ68AfterScroll(DataSet);
end;

procedure TDM.AQ69CalcFields(DataSet: TDataSet);
begin
  if AQ69INVT_PTR.AsString<>'' then
  begin
    tmp.Close;
    tmp.SQL.Text:='select top 1 inv_part_number,inv_description,inv_name,'+
           'CRITICAL_MATL_FLAG,CONSIGN_ONHAND_QTY,REPORT_VALUE2 from data0017 where rkey='+AQ69INVT_PTR.AsString;
    tmp.Open;
    AQ69inv_part_number.Value:=tmp.Fields[0].AsString;
    AQ69inv_description.Value:=tmp.Fields[1].AsString;
    AQ69inv_name.Value:=tmp.Fields[2].AsString;
    if tmp.Fields[3].AsInteger=1 then
     AQ69CRITICAL_MATL.Value:='是'
    else
     AQ69CRITICAL_MATL.Value:='否';
    AQ69CONSIGN_ONHAND_QTY.Value:=tmp.Fields[4].AsInteger;
    AQ69REPORT_VALUE2.Value:=tmp.Fields[5].AsInteger;

  end;
  if AQ69UNIT_PTR.AsString<>'' then    //采购单位
  begin
    tmp.Close;
    tmp.SQL.Text:='select top 1 unit_code,unit_name from data0002 where rkey='+AQ69UNIT_PTR.AsString;
    tmp.Open;
    AQ69unit_code.Value:=tmp.Fields[0].AsString;
    AQ69unit_name.Value:=tmp.Fields[1].AsString;
  end;
  if AQ69req_unit_ptr.AsString<>'' then    //存货单位
  begin
    tmp.Close;
    tmp.SQL.Text:='select top 1 unit_code,unit_name from data0002 where rkey='+AQ69req_unit_ptr.AsString;
    tmp.Open;
    AQ69unit_code_1.Value:=tmp.Fields[0].AsString;
  end;
end;

procedure TDM.AQ204CalcFields(DataSet: TDataSet);
begin
  if AQ204G_L_PTR.AsString<>'' then
  begin
    tmp.Close;
    tmp.SQL.Text:='select top 1 unit_code,unit_name from data0002 where rkey='+AQ204G_L_PTR.AsString;
    tmp.Open;
    AQ204UNIT_CODE.Value:=tmp.Fields[0].AsString;
    AQ204UNIT_name.Value:=tmp.Fields[1].AsString;
  end;
end;

procedure TDM.AQ69NewRecord(DataSet: TDataSet);
begin
  if ReqDate=0 then
    AQ69REQ_DATE.Value:=system_date
  else
    AQ69REQ_DATE.Value:=ReqDate;
  AQ69IF_urgency.Value:=False;
end;

procedure TDM.AQ204NewRecord(DataSet: TDataSet);
begin
  if ReqDate=0 then
   AQ204REQ_DATE.Value:=system_date
  else
   AQ204REQ_DATE.Value:=ReqDate;
  AQ204IF_urgency.Value:=False;
end;

procedure TDM.AQ17AfterOpen(DataSet: TDataSet);
begin
 D17Ok:=true;
end;

procedure TDM.AQ69AfterPost(DataSet: TDataSet);
begin
   ReqDate:=AQ69REQ_DATE.Value;
end;

procedure TDM.AQ204AfterPost(DataSet: TDataSet);
begin
   ReqDate:=AQ204REQ_DATE.Value;
end;

end.


