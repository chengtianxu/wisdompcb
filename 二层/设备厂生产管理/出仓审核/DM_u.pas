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
    ADO60: TADOQuery;
    ADO63: TADOQuery;
    ADO60rkey: TIntegerField;
    ADO60sales_order: TStringField;
    ADO60sales_date: TDateTimeField;
    ADO60customer_ptr: TIntegerField;
    ADO60type: TWordField;
    ADO60status: TWordField;
    ADO60ship_method: TStringField;
    ADO60location: TStringField;
    ADO60SALES_REP_PTR: TIntegerField;
    ADO60ent_date: TDateTimeField;
    ADO60ent_user_ptr: TIntegerField;
    ADO60currency_ptr: TIntegerField;
    ADO60exch_rate: TBCDField;
    ADO60total_amount: TBCDField;
    ADO60CONTACT_NAME: TStringField;
    ADO60CONT_PHONE: TStringField;
    ADO60TAX_cate: TStringField;
    ADO60pay_method: TStringField;
    ADO60invoice_ptr: TIntegerField;
    ADO60remark: TStringField;
    ADO60CUST_CODE: TStringField;
    ADO60CUSTOMER_NAME: TStringField;
    ADO60CURR_CODE: TStringField;
    ADO60CURR_NAME: TStringField;
    ADO60sorder: TStringField;
    ADO60EMPL_CODE: TStringField;
    ADO60EMPLOYEE_NAME: TStringField;
    ADO60status_c: TStringField;
    ADO63rkey: TIntegerField;
    ADO63so_ptr: TIntegerField;
    ADO63prod_ptr: TIntegerField;
    ADO63location_ptr: TIntegerField;
    ADO63cp71_ptr: TIntegerField;
    ADO63quantity: TBCDField;
    ADO63price: TBCDField;
    ADO63tax_rate: TBCDField;
    ADO63returen_qty: TBCDField;
    ADO63remark: TStringField;
    ADO63CODE: TStringField;
    ADO63LOCATION: TStringField;
    ADO63PROD_CODE: TStringField;
    ADO63PRODUCT_NAME: TStringField;
    ADO63PRODUCT_DESC: TStringField;
    ADO60EMPL_CODE_a: TStringField;
    ADO60EMPLOYEE_NAME_a: TStringField;
    ADO60CONF_BY_EMPL_PTR: TIntegerField;
    ADO60CONF_DATE: TDateTimeField;
    ADO60MO_PTR: TIntegerField;
    ADO60rkey70: TIntegerField;
    ADO63D0468_PTR: TIntegerField;
    ADO63UNIT_NAME: TStringField;
    procedure ADO60AfterScroll(DataSet: TDataSet);
  private

  public    
     function GetNo(edt:TMaskEdit;ikey:string;tp:integer=0):boolean;
  end;

var
  DM: TDM;
  Frkey60:integer;
implementation

{$R *.dfm}

procedure TDM.ADO60AfterScroll(DataSet: TDataSet);
begin
  ADO63.Close;
  ADO63.Parameters[0].Value:=DataSet.FieldValues['rkey'];
  ADO63.Open;
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
      DM.Tmp.SQL.Text:='select top 1 number from '+table_name+' where number='''+edt.Text+'''';
      DM.Tmp.Open;
      if not DM.Tmp.IsEmpty then
      begin
        showmessage('单号重复,请重新输入...');
        exit;
      end ;

      DM.Tmp.Close;
      DM.Tmp.SQL.Text:='select top 1 number from '+table_name+' order by number desc';
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
      DM.Tmp.Close;
      DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                       'where rkey='+ikey+' and SEED_VALUE='''+edt.Text+'''';
      if DM.Tmp.ExecSQL=0  then
      begin
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

end.
