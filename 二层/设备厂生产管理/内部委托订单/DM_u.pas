unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB,windows, DBClient, Provider,mask,Dialogs,StrUtils;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    tmp: TADOQuery;
    DS1: TDataSource;
    DS2: TDataSource;
    ADO70: TADOQuery;
    ADO71: TADOQuery;
    ADO70_1: TADOQuery;
    ADO71_1: TADOQuery;
    ADO70rkey: TAutoIncField;
    ADO70sales_order: TStringField;
    ADO70sales_date: TDateTimeField;
    ADO70customer_ptr: TIntegerField;
    ADO70type: TWordField;
    ADO70status: TWordField;
    ADO70ship_method: TStringField;
    ADO70location: TStringField;
    ADO70SALES_REP_PTR: TIntegerField;
    ADO70ent_date: TDateTimeField;
    ADO70ent_user_ptr: TIntegerField;
    ADO70currency_ptr: TIntegerField;
    ADO70exch_rate: TBCDField;
    ADO70total_amount: TBCDField;
    ADO70entrust_deptptr: TIntegerField;
    ADO70produce_deptptr: TIntegerField;
    ADO70CONTACT_NAME: TStringField;
    ADO70CONT_PHONE: TStringField;
    ADO70TAX_cate: TStringField;
    ADO70pay_method: TStringField;
    ADO70CONF_BY_EMPL_PTR: TIntegerField;
    ADO70CONF_DATE: TDateTimeField;
    ADO70remark: TStringField;
    ADO70EMPL_CODE: TStringField;
    ADO70EMPLOYEE_NAME: TStringField;
    ADO70DEPT_CODE: TStringField;
    ADO70DEPT_NAME: TStringField;
    ADO70CURR_CODE: TStringField;
    ADO70CURR_NAME: TStringField;
    ADO70status_c: TStringField;
    DS3: TDataSource;
    ADO08: TADOQuery;
    ADO08PROD_CODE: TStringField;
    ADO08PRODUCT_NAME: TStringField;
    ADO08PRODUCT_DESC: TStringField;
    ADO08new_price: TBCDField;
    ADO08qty_onhand: TBCDField;
    ADO08rkey: TAutoIncField;
    ADO08type_c: TStringField;
    ADO70DEPT_CODE_t: TStringField;
    ADO70DEPT_NAME_t: TStringField;
    ADO71_2: TADOQuery;
    ADO71rkey: TIntegerField;
    ADO71so_ptr: TIntegerField;
    ADO71prod_ptr: TIntegerField;
    ADO71quantity: TBCDField;
    ADO71price: TBCDField;
    ADO71tax_rate: TBCDField;
    ADO71QTY_PLANED: TBCDField;
    ADO71PARTS_SHIPPED: TBCDField;
    ADO71returen_qty: TBCDField;
    ADO71complete_date: TDateTimeField;
    ADO71remark: TStringField;
    ADO71PROD_CODE: TStringField;
    ADO71PRODUCT_NAME: TStringField;
    ADO71PRODUCT_desc: TStringField;
    ADO71_2rkey: TAutoIncField;
    ADO71_2so_ptr: TIntegerField;
    ADO71_2prod_ptr: TIntegerField;
    ADO71_2quantity: TBCDField;
    ADO71_2price: TBCDField;
    ADO71_2tax_rate: TBCDField;
    ADO71_2QTY_PLANED: TBCDField;
    ADO71_2PARTS_SHIPPED: TBCDField;
    ADO71_2returen_qty: TBCDField;
    ADO71_2complete_date: TDateTimeField;
    ADO71_2remark: TStringField;
    ADO71_2PROD_CODE: TStringField;
    ADO71_2PRODUCT_NAME: TStringField;
    ADO71_2PRODUCT_desc: TStringField;
    procedure ADO70AfterScroll(DataSet: TDataSet);
  private

  public    
     function GetNo(edt:TMaskEdit;ikey:string;tp:integer=0):boolean;
  end;

var
  DM: TDM;
  Frkey70:integer;
implementation

{$R *.dfm}

procedure TDM.ADO70AfterScroll(DataSet: TDataSet);
begin
  ADO71.Close;
  ADO71.Parameters[0].Value:=DataSet.FieldValues['rkey'];
  ADO71.Open;
end;

function TDM.GetNo(edt: TMaskEdit; ikey: string;tp:integer=0):boolean;
var i,iL:integer;
    s,sL:string;
    B:boolean;
    table_name:string;
begin
  result:=false;
  DM.Tmp.Close;
  DM.Tmp.SQL.Text:='select SEED_VALUE,seed_flag,table_name  from data0004  where rkey ='+ikey;
  DM.Tmp.Open;
  if DM.Tmp.IsEmpty or (DM.Tmp.Fields[1].AsInteger=1) then   //完全手动
  begin
    result:=true;
    exit;
  end;

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
      DM.Tmp.SQL.Text:='select top 1 sales_order from '+table_name+' where sales_order='''+edt.Text+'''';
      DM.Tmp.Open;
      if not DM.Tmp.IsEmpty then
      begin
        showmessage('单号重复,请重新输入...');
        exit;
      end ;

      DM.Tmp.Close;
      DM.Tmp.SQL.Text:='select top 1 sales_order from '+table_name+' order by sales_order desc';
      DM.Tmp.Open;
      if DM.Tmp.IsEmpty or (DM.Tmp.Fields[0].AsString<=edt.Text) then
      begin
        DM.Tmp.Close;
        if sL<>'' then
          DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                           'where rkey='+ikey
        else
          DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=cast(SEED_VALUE as int)+1 '+
                           'where rkey='+ikey;
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
        if sL<>'' then
          DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                           'where rkey='+ikey
        else  //全是数字
          DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=cast(SEED_VALUE as int)+1 '+
                           'where rkey='+ikey;
      DM.Tmp.ExecSQL;
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
        if sL<>'' then
          DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                           'where rkey='+ikey+' and SEED_VALUE='''+edt.Text+''''
        else
          DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=cast(SEED_VALUE as int)+1 '+
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


end.
