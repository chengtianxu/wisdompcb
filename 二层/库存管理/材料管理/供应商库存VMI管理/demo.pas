unit demo;

interface

uses
   SysUtils, Classes, DB, ADODB,windows, DBClient, Provider,mask,Dialogs,StrUtils;

type
  Tdm = class(TDataModule)
    tmpt: TADOQuery;
    ADOConnection1: TADOConnection;
    ADS70: TADODataSet;
    ADS70RKEY: TIntegerField;
    ADS70PO_TYPE: TStringField;
    ADS70PO_NUMBER: TStringField;
    ADS70CONFIRMATION_NUMBER: TStringField;
    ADS70PO_DATE: TDateTimeField;
    ADS70CODE: TStringField;
    ADS70SUPPLIER_NAME: TStringField;
    ADS70abbr_suppname: TStringField;
    ADS70abbr_warename: TStringField;
    ADS70WAREHOUSE_POINTER: TIntegerField;
    ADS70WAREHOUSE_CODE: TStringField;
    ADS70WAREHOUSE_NAME: TStringField;
    ADS70CURRENCY_PTR: TIntegerField;
    ADS70CURR_CODE: TStringField;
    ADS70CURR_NAME: TStringField;
    ADS70EXCHANGE_RATE: TFloatField;
    ADS70DEPT_NAME: TStringField;
    ADS70SHIPTO_ADDRESS: TStringField;
    ADS70SUPPLIER_POINTER: TIntegerField;
    ADO71: TADOQuery;
    ADO134: TADOQuery;
    ADO134_1: TADOQuery;
    ADO134_1RKEY: TAutoIncField;
    ADO134_1GRN_PTR: TIntegerField;
    ADO134_1INVENTORY_PTR: TIntegerField;
    ADO134_1SOURCE_PTR: TIntegerField;
    ADO134_1LOCATION_PTR: TIntegerField;
    ADO134_1UNIT_PTR: TIntegerField;
    ADO134_1QUANTITY: TBCDField;
    ADO134_1QUAN_ON_HAND: TBCDField;
    ADO134_1QUAN_RETURNED: TBCDField;
    ADO134_1tax_price: TBCDField;
    ADO134_1PRICE: TBCDField;
    ADO134_1TAX_2: TBCDField;
    ADO134_1BARCODE_ID: TStringField;
    ADO134_1SUPPLIER2: TStringField;
    ADO134_1EXPIRE_DATE: TDateTimeField;
    ADO134_1rohs: TStringField;
    ADO134_1UNIT_NAME: TStringField;
    ADO134_1INV_PART_NUMBER: TStringField;
    ADO134_1INV_name: TStringField;
    ADO134_1inv_DESCRIPTION: TStringField;
    ADO134_1LOCATION: TStringField;
    ADOQuery1: TADOQuery;
    ADO148: TADOQuery;
    ADO148rkey: TAutoIncField;
    ADO148GON_NUMBER: TStringField;
    ADO148warehouse_ptr: TIntegerField;
    ADO148TTYPE: TSmallintField;
    ADO148CREATE_DATE: TDateTimeField;
    ADO148CREATE_BY: TIntegerField;
    ADO148RECD_BY: TIntegerField;
    ADO148REF_NUMBER: TStringField;
    ADO149: TADOQuery;
    ADO149INVENTORY_PTR: TIntegerField;
    ADO149GON_PTR: TIntegerField;
    ADO149D0134_PTR: TIntegerField;
    ADO149QUANTITY: TBCDField;
    ADO149RTN_QUANTITY: TBCDField;
    ADO149tax_price: TBCDField;
    ADO149TAX_2: TBCDField;
    ADO148supplier_ptr: TIntegerField;
    ADO148status: TWordField;
    ADOtemp: TADOQuery;
    ado04: TADOQuery;
    ado04SEED_VALUE: TStringField;
    ado04SEED_FLAG: TWordField;
    tmp: TADOQuery;
    DSQry: TDataSource;
    ADOQry: TADOQuery;
    AutoIncField1: TAutoIncField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    BCDField1: TBCDField;
    BCDField2: TBCDField;
    BCDField3: TBCDField;
    BCDField4: TBCDField;
    BCDField5: TBCDField;
    BCDField6: TBCDField;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    StringField3: TStringField;
    StringField4: TStringField;
    ADOQryINV_NAME: TStringField;
    ADOQryINV_DESCRIPTION: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    AutoIncField2: TAutoIncField;
    StringField14: TStringField;
    StringField15: TStringField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    BCDField7: TBCDField;
    IntegerField9: TIntegerField;
    SmallintField1: TSmallintField;
    DateTimeField2: TDateTimeField;
    IntegerField10: TIntegerField;
    StringField16: TStringField;
    DateTimeField3: TDateTimeField;
    StringField17: TStringField;
    ADO134RKEY: TAutoIncField;
    ADO134GRN_PTR: TIntegerField;
    ADO134INVENTORY_PTR: TIntegerField;
    ADO134SOURCE_PTR: TIntegerField;
    ADO134LOCATION_PTR: TIntegerField;
    ADO134UNIT_PTR: TIntegerField;
    ADO134QUANTITY: TBCDField;
    ADO134QUAN_ON_HAND: TBCDField;
    ADO134QUAN_RETURNED: TBCDField;
    ADO134tax_price: TBCDField;
    ADO134PRICE: TBCDField;
    ADO134TAX_2: TBCDField;
    ADO134BARCODE_ID: TStringField;
    ADO134SUPPLIER2: TStringField;
    ADO134EXPIRE_DATE: TDateTimeField;
    ADO134rohs: TStringField;
    ADS133: TADOQuery;
    ADS133RKEY: TAutoIncField;
    ADS133GRN_NUMBER: TStringField;
    ADS133DELIVER_NUMBER: TStringField;
    ADS133warehouse_ptr: TIntegerField;
    ADS133SUPP_PTR: TIntegerField;
    ADS133currency_ptr: TIntegerField;
    ADS133exch_rate: TBCDField;
    ADS133PO_PTR: TIntegerField;
    ADS133TTYPE: TSmallintField;
    ADS133CREATE_DATE: TDateTimeField;
    ADS133CREATE_BY: TIntegerField;
    ADS133ship_DATE: TDateTimeField;
    ADS133ship_BY: TStringField;
    ADS133REF_NUMBER: TStringField;
    ADS133warehouse_code: TStringField;
    ADS133warehouse_name: TStringField;
    ADS133code: TStringField;
    ADS133supplier_name: TStringField;
    ADS133curr_code: TStringField;
    ADS133curr_name: TStringField;
    ADS133employee_name: TStringField;
    ADS133po_number: TStringField;
    ADS133stype: TStringField;
    ADS133abbr_name: TStringField;
    ADS134: TADOQuery;
    ADS134RKEY: TAutoIncField;
    ADS134GRN_PTR: TIntegerField;
    ADS134INVENTORY_PTR: TIntegerField;
    ADS134SOURCE_PTR: TIntegerField;
    ADS134LOCATION_PTR: TIntegerField;
    ADS134UNIT_PTR: TIntegerField;
    ADS134QUANTITY: TBCDField;
    ADS134QUAN_ON_HAND: TBCDField;
    ADS134QUAN_RETURNED: TBCDField;
    ADS134tax_price: TBCDField;
    ADS134PRICE: TBCDField;
    ADS134TAX_2: TBCDField;
    ADS134BARCODE_ID: TStringField;
    ADS134SUPPLIER2: TStringField;
    ADS134EXPIRE_DATE: TDateTimeField;
    ADS134rohs: TStringField;
    ADS134inv_part_number: TStringField;
    ADS134inv_name: TStringField;
    ADS134inv_part_description: TStringField;
    ADS134location: TStringField;
    ADS134unit_name: TStringField;
    ADS134quan_ord: TFloatField;
    ADS134quan_recd: TFloatField;
    ADO71RKEY: TAutoIncField;
    ADO71INV_NAME: TStringField;
    ADO71INV_DESCRIPTION: TStringField;
    ADO71QUAN_ORD: TFloatField;
    ADO71QUAN_RECD: TFloatField;
    ADO71REQ_DATE: TDateTimeField;
    ADO71extra_req: TStringField;
    ADO71UNIT_NAME: TStringField;
    ADO71WO_PTR: TIntegerField;
    ADO71PURCHASE_UNIT_PTR: TIntegerField;
    ADO71TAX_2: TBCDField;
    ADO71STOCK_BASE: TFloatField;
    ADO71CONVERSION_FACTOR: TFloatField;
    ADO71INVT_PTR: TIntegerField;
    ADO71CRITICAL_MATL_FLAG: TWordField;
    ADO71SHELF_LIFE: TSmallintField;
    ADO71pr_unitname: TStringField;
    ADO71QUAN_IN_INSP: TFloatField;
    ADO71INV_PART_NUMBER: TStringField;
    ADO71tax_price: TFloatField;
    ADO71avl_flag: TStringField;
    ADO71rohs: TStringField;
    ADO71DSDesigner: TFloatField;
    aq16: TADOQuery;
    aq16rkey: TIntegerField;
    aq16LOCATION: TStringField;
    Aq134: TADOQuery;
    Aq134RKEY: TIntegerField;
    Aq134QUAN_ORD: TFloatField;
    Aq134QUAN_RECD: TFloatField;
    Aq134tax_PRICE: TFloatField;
    Aq134WO_PTR: TIntegerField;
    Aq134PURCHASE_UNIT_PTR: TIntegerField;
    Aq134TAX_2: TBCDField;
    Aq134CONVERSION_FACTOR: TFloatField;
    Aq134INVT_PTR: TIntegerField;
    Aq134QUANTITY: TBCDField;
    Aq134BARCODE_ID: TStringField;
    Aq134EXPIRE_DATE: TDateTimeField;
    Aq134INV_PART_NUMBER: TStringField;
    Aq134INV_NAME: TStringField;
    Aq134STOCK_BASE: TFloatField;
    Aq134SHELF_LIFE: TSmallintField;
    Aq134INV_DESCRIPTION: TStringField;
    Aq134UNIT_NAME: TStringField;
    Aq134pr_unitname: TStringField;
    Aq134LOCATION: TStringField;
    Aq134LOCATION_PTR: TIntegerField;
    Aq134UNIT_PTR: TIntegerField;
    Aq134rohs: TStringField;
    Aq134SUPPLIER2: TStringField;
    Aq134avl_flag: TStringField;
    ADO133: TADOQuery;
    ADO133RKEY: TAutoIncField;
    ADO133GRN_NUMBER: TStringField;
    ADO133DELIVER_NUMBER: TStringField;
    ADO133warehouse_ptr: TIntegerField;
    ADO133SUPP_PTR: TIntegerField;
    ADO133currency_ptr: TIntegerField;
    ADO133exch_rate: TBCDField;
    ADO133PO_PTR: TIntegerField;
    ADO133TTYPE: TSmallintField;
    ADO133CREATE_DATE: TDateTimeField;
    ADO133CREATE_BY: TIntegerField;
    ADO133ship_DATE: TDateTimeField;
    ADO133ship_BY: TStringField;
    ADO133REF_NUMBER: TStringField;
    DS133: TDataSource;
    DS134: TDataSource;
    procedure ADS70AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
     FCurrDate:Tdatetime;
     function GetNo(edt:TMaskEdit;table_name:string;tp:integer=0):boolean;
     procedure update04(table_name:string);
  end;

var
  dm: Tdm;
  Frkey133:integer;
  function Power(x, y : extended) : extended;
implementation

{$R *.dfm}
function Tdm.GetNo(edt:TMaskEdit;table_name:string;tp:integer=0):boolean;
var
i,iL:integer;
s,sL:string;
B:boolean;
begin
result:=false;
  dm.ADOtemp.Close;
  dm.ADOtemp.SQL.Text:='select SEED_VALUE,seed_flag from data0004  where table_name =:table_name';
  dm.ADOtemp.Parameters[0].Value:=table_name;
  dm.ADOtemp.Open;
  if dm.ADOtemp.IsEmpty or (dm.ADOtemp.Fields[1].AsInteger=1) then exit;

  s:=trim(dm.ADOtemp.Fields[0].AsString);
  if dm.ADOtemp.Fields[1].AsInteger=2 then        //固定字首,系统可自动产生号码，也可输入号码(填充断号)
  begin
    iL:=length(s);
    for i:=iL downto 1 do
      if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;
    edt.editmask:=copy(s,1,i)+'!'+copy('9999999999',i+1,iL-i)+';1;_';
    edt.ReadOnly:=false;
    if tp=0 then
      edt.Text:=s
    else begin
      dm.ADOtemp.Close;
      dm.ADOtemp.SQL.Text:='select top 1 LogNo from '+table_name+' where LogNo='''+edt.Text+'''';
      dm.ADOtemp.Open;
      if not dm.ADOtemp.IsEmpty then
      begin
        showmessage('编号重复,请重新输入!');
        exit;
      end ;

      dm.ADOtemp.Close;
      dm.ADOtemp.SQL.Text:='select top 1 LogNo from '+table_name+' order by LogNo desc';
      dm.ADOtemp.Open;
      if dm.ADOtemp.IsEmpty or (dm.ADOtemp.Fields[0].AsString<=edt.Text) then
      begin
        dm.ADOtemp.Close;
        dm.ADOtemp.SQL.Text:='update data0004 set SEED_VALUE='''+copy(edt.Text,1,i)+rightstr('00000'+inttostr(strtoint(rightstr(edt.Text,length(edt.Text)-i))+1),length(edt.Text)-i)+
                         '''  where table_name=:table_name';
        dm.ADOtemp.Parameters[0].Value:=table_name;
        dm.ADOtemp.ExecSQL;
      end;

    end;
  end else if dm.ADOtemp.Fields[1].AsInteger=3 then begin      //系统产生，但可修改
    edt.ReadOnly:=false;
    if tp=0 then
      edt.Text:=dm.ADOtemp.Fields[0].AsString
    else begin
      iL:=length(s);
      for i:=iL downto 1 do
        if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;    
      dm.ADOtemp.Close;
      dm.ADOtemp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                       'where table_name=:table_name and SEED_VALUE='''+edt.Text+'''';
      dm.ADOtemp.Parameters[0].Value:=table_name;
      if dm.ADOtemp.ExecSQL=0  then
      begin
        showmessage('单号重复,请重新输入!');
        exit;
      end;
    end;
  end else if dm.ADOtemp.Fields[1].AsInteger=4 then begin  //只能系统产生
    edt.ReadOnly:=true;
    if tp=0 then
      edt.Text:=dm.ADOtemp.Fields[0].AsString
    else begin
      iL:=length(s);
      for i:=iL downto 1 do
        if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;

      B:=true;
      while B do
      begin
        dm.ADOtemp.Close;
        dm.ADOtemp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                         'where table_name=:table_name and SEED_VALUE='''+edt.Text+'''';
        dm.ADOtemp.Parameters[0].Value:=table_name;
        if dm.ADOtemp.ExecSQL=0 then
        begin
          dm.ADOtemp.Close;
          dm.ADOtemp.SQL.Text:='select SEED_VALUE  from data0004  where table_name=:table_name';
          dm.ADOtemp.Parameters[0].Value:=table_name;
          dm.ADOtemp.Open;
          edt.Text:=dm.ADOtemp.Fields[0].AsString;
        end else
          B:=false;
      end;
    end;
  end ;
  result:=true;
end;

procedure Tdm.ADS70AfterScroll(DataSet: TDataSet);
begin
 dm.ADO71.close;
 dm.ADO71.Parameters[0].Value:=dm.ADS70RKEY.Value;
 dm.ADO71.Open;
end;
procedure Tdm.update04(table_name:string);
var
 i,v_length:integer;
 v_last,v_seed,new_seed:string;
begin
 dm.ado04.Close;
 dm.ado04.Parameters[0].Value:=table_name;
 dm.ado04.Open;
 v_seed:=dm.ado04SEED_VALUE.Value;
 if dm.ado04SEED_FLAG.Value<>1 then
 begin
 v_length := length(v_seed);
 for i := v_length downto 1 do
  if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.ado04.Edit; //使前缀不变后缀加1
    dm.ado04SEED_VALUE.Value := new_seed;
    dm.ado04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.ado04.Edit;
     dm.ado04SEED_VALUE.Value := new_seed;
     dm.ado04.Post;
    end;
 end;
end;
function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
end;
end.
