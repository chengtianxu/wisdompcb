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
    adowz300type: TWordField;
    ADO301PRICE: TBCDField;
    ADO301AMOUNT: TBCDField;
    aqPrint: TADOQuery;
    aqPrintWAREHOUSE_NAME: TStringField;
    aqPrintADDRESS_LINE_1: TStringField;
    aqPrintMyPhone: TStringField;
    aqPrintMyFax: TStringField;
    aqPrintSUPPLIER_NAME: TStringField;
    aqPrintBILLING_ADDRESS_1: TStringField;
    aqPrintPHONE: TStringField;
    aqPrintFAX: TStringField;
    aqPrintCONTACT_NAME: TStringField;
    aqPrintCONT_PHONE: TStringField;
    aqPrintTAX_cate: TStringField;
    aqPrintpay_method: TStringField;
    aqPrintRKEY: TAutoIncField;
    aqPrintEPIBOLY_PTR: TIntegerField;
    aqPrintCUSTPART_PTR: TIntegerField;
    aqPrintQUANTITY: TIntegerField;
    aqPrintRECEVIED_QTY: TIntegerField;
    aqPrintRETURN_QTY: TIntegerField;
    aqPrintPRICE: TBCDField;
    aqPrintUNIT_NAME: TStringField;
    aqPrintSTANDARD: TStringField;
    aqPrintAREA_SQM: TBCDField;
    aqPrintAREA_SQF: TBCDField;
    aqPrintLAYER: TWordField;
    aqPrintTHINK: TBCDField;
    aqPrintMIN_aperture: TBCDField;
    aqPrintREQ_DATE: TDateTimeField;
    aqPrintREMARTK: TStringField;
    aqPrintreject_qty: TIntegerField;
    aqPrintMANU_PART_DESC: TStringField;
    aqPrintAMOUNT: TBCDField;
    dsPrint: TDataSource;
    aqPrintTotalAmount: TBCDField;
    aqPrinttextTotalAmt: TStringField;
    aqPrintdeli_address: TStringField;
    aqPrintSHIPPING_METHOD: TStringField;
    adowz300ent_addr: TStringField;
    adowz300ent_CONT_NAME: TStringField;
    adowz300ent_CONT_PHONE: TStringField;
    adowz300ContractNo: TStringField;
    aqPrintent_addr: TStringField;
    aqPrintent_CONT_NAME: TStringField;
    aqPrintent_CONT_PHONE: TStringField;
    aqPrintContractNo: TStringField;
    ADO301set_qty: TIntegerField;
    ADO301Cu_THK: TStringField;
    ADO301prod_type: TStringField;
    aqPrintset_qty: TIntegerField;
    aqPrintCu_THK: TStringField;
    aqPrintprod_type: TStringField;
    aqPrintSTANDARD1: TStringField;
    aqPrintTHINK1: TStringField;
    aqPrintMANU_PART_NUMBER: TStringField;
    aqPrintrmk: TStringField;
    procedure adowz300AfterDelete(DataSet: TDataSet);
    procedure ADO301CalcFields(DataSet: TDataSet);
    procedure ADO305CalcFields(DataSet: TDataSet);
    procedure ADO301AfterScroll(DataSet: TDataSet);
    procedure wzdata300AfterScroll(DataSet: TDataSet);
    procedure ADO301BeforeDelete(DataSet: TDataSet);
    procedure ADO305BeforeDelete(DataSet: TDataSet);
    procedure aqPrintCalcFields(DataSet: TDataSet);
  private

  public
    function GetNo(edt:TMaskEdit;ikey:string;tp:integer=0):boolean;
  end;

var
  DM: TDM;
  system_date,sys_shortdate :tdatetime;
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

  ADO301.FieldByName('AMOUNT').AsCurrency:=ADO301.FieldByName('QUANTITY').AsCurrency*ADO301.FieldByName('PRICE').AsCurrency;
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
  if (iFlag=0) and not ADO305.Filtered  then exit;
  if ADO301RKEY.AsString<>'' then
   ADO305.Filter:='rkey301='+ADO301RKEY.AsString
  else if ADO301Rec.AsString<>'' then
   ADO305.Filter:='rkey301='+ADO301Rec.AsString  ;
end;

procedure TDM.wzdata300AfterScroll(DataSet: TDataSet);
begin
  ADO301.Close;
  ADO301.Parameters[0].Value:=wzdata300rkey.Value;
  ADO301.Open;
end;

procedure TDM.ADO301BeforeDelete(DataSet: TDataSet);
begin
  if iFlag=0 then exit;
  ADO305.First;
  while not ADO305.Eof do ADO305.Delete;
  ADO305.Filter:='rkey301<0 and rkey301>='+ADO301Rec.AsString  ;
  ADO305.First;
  while not ADO305.Eof do
  begin
    ADO305.Edit;
    ADO305rkey301.Value:=ADO305rkey301.AsInteger-1;
    ADO305.Next;
  end;
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
  result:=false;
  DM.Tmp.Close;
  DM.Tmp.SQL.Text:='select SEED_VALUE,seed_flag,table_name  from data0004  where rkey ='+ikey;
  DM.Tmp.Open;
  if DM.Tmp.IsEmpty or (DM.Tmp.Fields[1].AsInteger=1) then exit;

  s:=trim(DM.Tmp.Fields[0].AsString);
  table_name:=trim(DM.Tmp.Fields[2].AsString);
  if DM.Tmp.Fields[1].AsInteger=2 then        //固定字首,系统可自动产生号码，也可输入号码(填充断号)
  begin
    iL:=length(s);
    for i:=iL downto 1 do
      if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;
    edt.editmask:=copy(s,1,i)+'!'+copy('9999999999',i+1,iL-i)+';1;_';
    edt.ReadOnly:=false;
    if tp=0 then
      edt.Text:=s
    else begin
      DM.Tmp.Close;
      DM.Tmp.SQL.Text:='select top 1 epiboly_number from '+table_name+' where epiboly_number='''+edt.Text+'''';
      DM.Tmp.Open;
      if not DM.Tmp.IsEmpty then
      begin
        if ADOConnection1.InTransaction then ADOConnection1.RollbackTrans;
        showmessage('单号重复,请重新输入...');
        exit;
      end ;

      DM.Tmp.Close;
      DM.Tmp.SQL.Text:='select top 1 epiboly_number from '+table_name+' order by epiboly_number desc';
      DM.Tmp.Open;
      if DM.Tmp.IsEmpty or (DM.Tmp.Fields[0].AsString<=edt.Text) then
      begin
        DM.Tmp.Close;
        DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE='''+copy(edt.Text,1,i)+rightstr('00000'+inttostr(strtoint(rightstr(edt.Text,length(edt.Text)-i))+1),length(edt.Text)-i)+
                         '''  where rkey='+ikey;
        DM.Tmp.ExecSQL;
      end;

    end;
  end else if DM.Tmp.Fields[1].AsInteger=3 then begin      //系统产生，但可修改
    edt.ReadOnly:=false;
    if tp=0 then
      edt.Text:=DM.Tmp.Fields[0].AsString
    else begin
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
  end else if DM.Tmp.Fields[1].AsInteger=4 then begin  //只能系统产生
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

procedure TDM.aqPrintCalcFields(DataSet: TDataSet);
  function NumToChar(const n: Real): string;  //可以到万亿，并且可以随便扩大范围
  const cNum: WideString = '零壹贰叁肆伍陆柒捌玖--万仟佰拾亿仟佰拾万仟佰拾元角分';
  cCha:array[0..1, 0..12]of string =
  (('零元','零拾','零佰','零仟','零万','零亿','亿万','零零零','零零','零万','零亿','亿万','零元'),
  ('元','零','零','零','万','亿','亿','零','零','万','亿','亿','元'));
  var i: Integer;
    sNum,sTemp : WideString;
  begin
    result:='';
    sNum:= format('%15d',[round(n * 100)]);
    for i :=0 to 14 do
    begin
      stemp:= copy(snum,i+1,1);
      if stemp=' ' then
        continue
      else
        result := result + cNum[strtoint(stemp)+1] + cNum[i+13];
    end;
    for i:= 0 to 12 do Result := StringReplace(Result, cCha[0,i],cCha[1,i],[rfReplaceAll]);
     if pos('零分',result)=0  then
       Result := StringReplace(Result,'零角','零',[rfReplaceAll])
     else
       Result := StringReplace(Result,'零角','整',[rfReplaceAll]);
    Result:=StringReplace(Result,'零分','',[rfReplaceAll]);
  end;
begin
  aqPrint.FieldByName('AMOUNT').AsCurrency:=aqPrint.FieldByName('QUANTITY').AsCurrency*aqPrint.FieldByName('PRICE').AsCurrency;
  aqPrint.FieldByName('textTotalAmt').AsString:= NumToChar(aqPrint.FieldByName('TotalAmount').AsCurrency);
  aqPrint.FieldByName('STANDARD1').AsString:= aqPrint.FieldByName('STANDARD').AsString+'/'+aqPrint.FieldByName('set_qty').AsString;
  aqPrint.FieldByName('THINK1').AsString:= aqPrint.FieldByName('THINK').AsString+'mm '+aqPrint.FieldByName('Cu_THK').AsString;                
//  ShowMessage(aqPrint.FieldByName('TotalAmount').AsString);
//  ShowMessage(aqPrint.FieldByName('textTotalAmt').AsString);
end;

end.
