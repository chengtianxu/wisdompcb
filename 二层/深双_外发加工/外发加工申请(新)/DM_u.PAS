unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB,mask,Dialogs,Variants,StrUtils;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    wzdata300: TADOQuery;
    DataSource1: TDataSource;
    adowz300: TADOQuery;
    DataSource2: TDataSource;
    ADO301: TADOQuery;
    DataSource3: TDataSource;
    wzdata300rkey: TAutoIncField;
    wzdata300status: TWordField;
    wzdata300DEPT_NAME: TStringField;
    wzdata300DEPT_CODE: TStringField;
    wzdata300CODE: TStringField;
    wzdata300SUPPLIER_NAME: TStringField;
    wzdata300ABBR_NAME: TStringField;
    wzdata300WAREHOUSE_CODE: TStringField;
    wzdata300WAREHOUSE_NAME: TStringField;
    wzdata300warehouse_abbname: TStringField;
    wzdata300ent_data: TDateTimeField;
    wzdata300EMPL_CODE: TStringField;
    wzdata300EMPLOYEE_NAME: TStringField;
    wzdata300CURR_CODE: TStringField;
    wzdata300CURR_NAME: TStringField;
    wzdata300auth_code: TStringField;
    wzdata300PURCHASE_APPROV_DESC: TStringField;
    adowz300rkey: TAutoIncField;
    adowz300status: TWordField;
    adowz300supp_ptr: TIntegerField;
    adowz300dept_ptr: TIntegerField;
    adowz300empl_ptr: TIntegerField;
    adowz300ent_data: TDateTimeField;
    adowz300refer_date: TDateTimeField;
    adowz300warehouse_ptr: TIntegerField;
    adowz300auth_ptr: TIntegerField;
    adowz300currency_ptr: TIntegerField;
    adowz300CONTACT_NAME: TStringField;
    adowz300CONT_PHONE: TStringField;
    adowz300TAX_cate: TStringField;
    adowz300pay_method: TStringField;
    adowz300deli_address: TStringField;
    adowz300SHIPPING_METHOD: TStringField;
    adowz300remark: TStringField;
    wzdata300v_status: TStringField;
    wzdata300refer_date: TDateTimeField;
    wzdata300AUTH_ptr: TIntegerField;
    ADOwz302: TADOQuery;
    ADOwz302epiboly_ptr: TIntegerField;
    ADOwz302user_ptr: TIntegerField;
    ADOwz302ranking: TWordField;
    ADOwz302auth_flag: TStringField;
    wzdata300epiboly_number: TStringField;
    adowz300epiboly_number: TStringField;
    Aqwz302: TADOQuery;
    Aqwz302user_id: TStringField;
    Aqwz302user_full_name: TStringField;
    Aqwz302auth_date: TDateTimeField;
    Aqwz302ranking: TWordField;
    Aqwz302remark: TStringField;
    Aqwz302auth_flag: TStringField;
    DataSource4: TDataSource;
    adowz300exch_rate: TBCDField;
    ADO301RKEY: TAutoIncField;
    ADO301EPIBOLY_PTR: TIntegerField;
    ADO301CUSTPART_PTR: TIntegerField;
    ADO301RETURN_QTY: TIntegerField;
    ADO301UNIT_NAME: TStringField;
    ADO301STANDARD: TStringField;
    ADO301AREA_SQM: TBCDField;
    ADO301AREA_SQF: TBCDField;
    ADO301LAYER: TWordField;
    ADO301THINK: TBCDField;
    ADO301MIN_aperture: TBCDField;
    ADO301REQ_DATE: TDateTimeField;
    ADO301REMARTK: TStringField;
    ADO301reject_qty: TIntegerField;
    ADO301PART_NUMBER: TStringField;
    ADO301PART_DESC: TStringField;
    Tmp: TADOQuery;
    ADO301QUANTITY: TIntegerField;
    ADO301RECEVIED_QTY: TIntegerField;
    DataSource5: TDataSource;
    ADO305: TADOQuery;
    ADO305rkey301: TIntegerField;
    ADO305wo_ptr: TIntegerField;
    ADO305Quantity: TIntegerField;
    ADO305WORK_ORDER_NUMBER: TStringField;
    ADO301rec: TIntegerField;
    ADOQuery1: TADOQuery;
    tmp2: TADOQuery;
    ADO493: TADOQuery;
    DataSource6: TDataSource;
    ADO493DSDesigner: TStringField;
    ADO493DSDesigner2: TStringField;
    ADO493DSDesigner3: TStringField;
    ADO493DSDesigner4: TBlobField;
    ADO493DSDesigner5: TStringField;
    ADO301CUST_CODE: TStringField;
    ADO301ABBR_NAME: TStringField;
    qry1Tmp: TADOQuery;
    ADO301PRICE: TBCDField;
    ADO301set_qty: TIntegerField;
    ADO301Cu_THK: TStringField;
    ADO301prod_type: TStringField;
    ADO301seq_no: TSmallintField;
    ADO305rkey: TAutoIncField;
    ADO305EPIBOLY_PTR: TIntegerField;
    ADO305seq_no: TSmallintField;
    tmp3: TADOQuery;
    procedure adowz300AfterDelete(DataSet: TDataSet);
    procedure ADO301CalcFields(DataSet: TDataSet);
    procedure ADO305CalcFields(DataSet: TDataSet);
    procedure ADO301AfterScroll(DataSet: TDataSet);
    procedure wzdata300AfterScroll(DataSet: TDataSet);
    procedure ADO301BeforeDelete(DataSet: TDataSet);
    procedure ADO305BeforeDelete(DataSet: TDataSet);
  private

  public
    function GetNo(edt:TMaskEdit;ikey:string;tp:integer=0):boolean;
  end;

var
  DM: TDM;
  dept_code,dept_name:string;
  iFlag:integer;     //是否有工单

implementation

{$R *.dfm}

procedure TDM.adowz300AfterDelete(DataSet: TDataSet);
begin
  messagedlg('数据被成功删除!',mtinformation,[mbok],0);
end;

procedure TDM.ADO301CalcFields(DataSet: TDataSet);
begin
  if ADO301CUSTPART_PTR.AsString<>'' then
  begin
    Tmp.Close;
    Tmp.SQL.Text:='select MANU_PART_NUMBER,MANU_PART_DESC from data0025 where rkey='+ADO301CUSTPART_PTR.AsString;
    Tmp.Open;

    ADO301PART_NUMBER.Value:=Tmp.Fields[0].AsString;
    ADO301PART_DESC.Value:=Tmp.Fields[1].AsString;
  end;
  if not (ADO301.State in [dsEdit, dsInsert]) then
  begin
    Tmp.Close;
    Tmp.SQL.Text:='SELECT top 1 dbo.Data0010.CUST_CODE, dbo.Data0010.ABBR_NAME '+
                  'FROM Data0010 INNER JOIN dbo.Data0025 ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY '+
                  'where dbo.Data0025.RKEY='+ADO301CUSTPART_PTR.AsString;
    Tmp.Open;
    ADO301CUST_CODE.Value:=Tmp.Fields[0].AsString;
    ADO301ABBR_NAME.Value:=Tmp.Fields[1].AsString;
  end;

  if ADO301.RecNo=-1 then
    ADO301Rec.Value:=-999
  else
    ADO301Rec.Value:=ADO301.RecNo-1000;
end;

procedure TDM.ADO305CalcFields(DataSet: TDataSet);
begin
  if ADO305wo_ptr.AsString<>'' then
  begin
    Tmp.Close;
    Tmp.SQL.Text:='select WORK_ORDER_NUMBER from data0006 where rkey='+ADO305wo_ptr.AsString;
    Tmp.Open;
    ADO305WORK_ORDER_NUMBER.Value:=Tmp.Fields[0].AsString;
  end;
end;

procedure TDM.ADO301AfterScroll(DataSet: TDataSet);
begin
//  ShowMessage(ADO301.SQL.Text+wzdata300rkey.AsString);
  if (iFlag=0) and not ADO305.Filtered  then exit;
  if ADO301seq_no.AsString<>'' then
  begin
//   ADO305.Filter:='rkey301='+ADO301RKEY.AsString ;


     ADO305.Filter:='seq_no='+ADO301seq_no.AsString ;
     //ShowMessage(ADO301seq_no.AsString);

     
//    ADO305.Parameters[1].Value:=ADO301seq_no.AsString ;
  end
  else if ADO301Rec.AsString<>'' then
  begin
//   ADO305.Filter:='rkey301='+ADO301Rec.AsString  ;
    ADO305.Filter:='rkey301='+ADO301Rec.AsString  ;           ////不懂
  end;
end;

procedure TDM.wzdata300AfterScroll(DataSet: TDataSet);
begin
  ADO301.Close;
  ADO301.Parameters[0].Value:=wzdata300rkey.Value;
  ADO301.Open;
  ADO301.First;
end;

procedure TDM.ADO301BeforeDelete(DataSet: TDataSet);
begin
  if iFlag=0 then exit;
  ADO305.Filter:='seq_no='+ ADO301seq_no.AsString;
  ADO305.First;
  while not ADO305.Eof do ADO305.Delete;
//  ADO305.Filter:='rkey301<0 and rkey301>='+ADO301Rec.AsString  ;
//  ADO305.First;
//  while not ADO305.Eof do
//  begin
//    ADO305.Edit;
//    ADO305rkey301.Value:=ADO305rkey301.AsInteger-1;
//    ADO305.Next;
//  end;
end;

procedure TDM.ADO305BeforeDelete(DataSet: TDataSet);
begin
  ADO301.Edit;
  ADO301QUANTITY.Value:=ADO301QUANTITY.AsInteger-ADO305Quantity.AsInteger;
  ADO301.Post;
end;

function TDM.GetNo(edt: TMaskEdit; ikey: string; tp: integer): boolean;
var i,iL:integer;
    s,sL:string;
    B:boolean;
    table_name:string;
begin

  DM.Tmp.Close;
  DM.Tmp.SQL.Text:='select SEED_VALUE,seed_flag,table_name  from data0004  where rkey ='+ikey;
  DM.Tmp.Open;
  if (DM.Tmp.IsEmpty) or (DM.Tmp.Fields[1].AsInteger=1) then
   result:=false
  else
   begin
  s:=trim(DM.Tmp.Fields[0].AsString);
  table_name:=trim(DM.Tmp.Fields[2].AsString);
  if DM.Tmp.Fields[1].AsInteger=3 then
   begin      //系统产生，但可修改
    edt.ReadOnly:=false;
    if tp=0 then
      edt.Text:=DM.Tmp.Fields[0].AsString
    else
     begin
      iL:=length(s);
      for i:=iL downto 1 do
        if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;
      DM.Tmp.Close;
      DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                       'where rkey='+ikey+' and SEED_VALUE='''+edt.Text+'''';
      if DM.Tmp.ExecSQL=0  then
      begin
        if ADOConnection1.InTransaction then ADOConnection1.RollbackTrans;
        showmessage('单号重复,请重新输入...');
        exit;
      end;
     end;
   end
  else
  if DM.Tmp.Fields[1].AsInteger=4 then
   begin  //只能系统产生
    edt.ReadOnly:=true;
    if tp=0 then
      edt.Text:=DM.Tmp.Fields[0].AsString
    else begin
      iL:=length(s);
      for i:=iL downto 1 do
        if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;

      B:=true;
      while B do
      begin
        DM.Tmp.Close;
        DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                         'where rkey='+ikey+' and SEED_VALUE='''+edt.Text+'''';
        if DM.Tmp.ExecSQL=0 then
        begin
          DM.Tmp.Close;
          DM.Tmp.SQL.Text:='select SEED_VALUE  from data0004  where rkey ='+ikey;
          DM.Tmp.Open;
          edt.Text:=DM.Tmp.Fields[0].AsString;
        end else
          B:=false;
      end;
    end;
  end ;
  result:=true;
 end;
end;

end.
