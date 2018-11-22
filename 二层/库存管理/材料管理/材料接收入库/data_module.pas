unit data_module;

interface

uses
  SysUtils,Classes,DB,ADODB,ActnList,windows,DBClient,Provider,mask,Dialogs,StrUtils;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    Aqwz22: TADOQuery;
    ADO456: TADOQuery;
    ADO22: TADOQuery;
    ADOQuery2: TADOQuery;
    Aq22: TADOQuery;
    Aqwz22INV_PART_NUMBER: TStringField;
    Aqwz22INV_NAME: TStringField;
    Aqwz22INV_DESCRIPTION: TStringField;
    Aqwz22LOCATION: TStringField;
    Aqwz22QUANTITY: TBCDField;
    Aqwz22UNIT_NAME: TStringField;
    Aqwz22BARCODE_ID: TStringField;
    Aqwz22EXPIRE_DATE: TDateTimeField;
    ADO456RKEY: TAutoIncField;
    ADO456GRN_NUMBER: TStringField;
    ADO456DELIVER_NUMBER: TStringField;
    ADO456SUPP_PTR: TIntegerField;
    ADO456PO_PTR: TIntegerField;
    ADO456TTYPE: TWordField;
    ADO456STATUS: TWordField;
    ADO456CREATE_DATE: TDateTimeField;
    ADO456CREATE_BY: TIntegerField;
    ADO456ship_DATE: TDateTimeField;
    ADO456ship_BY: TStringField;
    ADO456AUDITED_BY: TIntegerField;
    ADO456AUDITED_DATE: TDateTimeField;
    ADO456REF_NUMBER: TStringField;
    ADO456PRINTED: TStringField;
    ado04: TADOQuery;
    ado04SEED_VALUE: TStringField;
    ado04SEED_FLAG: TWordField;
    ADO22RKEY: TAutoIncField;
    ADO22GRN_PTR: TIntegerField;
    ADO22INVENTORY_PTR: TIntegerField;
    ADO22SOURCE_PTR: TIntegerField;
    ADO22LOCATION_PTR: TIntegerField;
    ADO22QUANTITY: TBCDField;
    ADO22TAX_2: TBCDField;
    ADO22QUAN_ON_HAND: TBCDField;
    ADO22LOCATION_PTR_FROM: TIntegerField;
    ADO22BARCODE_ID: TStringField;
    ADO22EXPIRE_DATE: TDateTimeField;
    ADO456warehouse_ptr: TIntegerField;
    Aq22RKEY: TIntegerField;
    Aq22QUAN_ORD: TBCDField;
    Aq22QUAN_RECD: TBCDField;
    Aq22WO_PTR: TIntegerField;
    Aq22PURCHASE_UNIT_PTR: TIntegerField;
    Aq22TAX_2: TBCDField;
    Aq22CONVERSION_FACTOR: TBCDField;
    Aq22INVT_PTR: TIntegerField;
    Aq22QUANTITY: TBCDField;
    Aq22BARCODE_ID: TStringField;
    Aq22EXPIRE_DATE: TDateTimeField;
    Aq22INV_PART_NUMBER: TStringField;
    Aq22INV_NAME: TStringField;
    Aq22INV_DESCRIPTION: TStringField;
    Aq22UNIT_NAME: TStringField;
    Aq22pr_unitname: TStringField;
    Aq22LOCATION: TStringField;
    Aq22LOCATION_PTR: TIntegerField;
    Aq22LOCATION_PTR_FROM: TIntegerField;
    Aq22SHELF_LIFE: TSmallintField;
    aq16: TADOQuery;
    aq16rkey: TIntegerField;
    aq16LOCATION: TStringField;
    Aqwz22LOCATION_PTR_FROM: TIntegerField;
    Aqwz22LOCATION_PTR: TIntegerField;
    Aqwz22INVENTORY_PTR: TIntegerField;
    Aqwz22TAX_2: TBCDField;
    Aqwz22SHELF_LIFE: TSmallintField;
    Aqwz456: TADODataSet;
    Aqwz456RKEY: TAutoIncField;
    Aqwz456GRN_NUMBER: TStringField;
    Aqwz456DELIVER_NUMBER: TStringField;
    Aqwz456CODE: TStringField;
    Aqwz456SUPPLIER_NAME: TStringField;
    Aqwz456ship_DATE: TDateTimeField;
    Aqwz456STATUS: TSmallintField;
    Aqwz456TTYPE: TSmallintField;
    Aqwz456REF_NUMBER: TStringField;
    Aqwz456PO_NUMBER: TStringField;
    Aqwz456PO_PTR: TIntegerField;
    Aqwz456EMPLOYEE_NAME: TStringField;
    Aqwz456EMPL_CODE: TStringField;
    Aqwz456WAREHOUSE_CODE: TStringField;
    Aqwz456WAREHOUSE_NAME: TStringField;
    Aqwz456ship_BY: TStringField;
    Aqwz456CURR_CODE: TStringField;
    Aqwz456CURR_NAME: TStringField;
    Aqwz456warehouse_ptr: TIntegerField;
    Aqwz456DEPT_NAME: TStringField;
    Aqwz456SUPP_PTR: TIntegerField;
    Aqwz456PRINTED: TStringField;
    Aqwz456currency_ptr: TIntegerField;
    Aqwz456v_status: TStringField;
    Aqwz456v_type: TStringField;
    ADO456currency_ptr: TIntegerField;
    ADO456dealiv_ptr: TIntegerField;
    ADO22SUPPLIER2: TStringField;
    ADO22rohs: TStringField;
    Aqwz22rohs: TStringField;
    Aqwz22SUPPLIER2: TStringField;
    Aq22rohs: TStringField;
    Aq22SUPPLIER2: TStringField;
    Aq22tax_PRICE: TFloatField;
    ADO235: TADOQuery;
    DataSource3: TDataSource;
    Aqwz235: TADOQuery;
    Aqwz235DESCRIPTION: TStringField;
    Aqwz235GUI_GE: TStringField;
    Aqwz235DESCRIPTION2: TStringField;
    Aqwz235UNIT_NAME: TStringField;
    Aqwz235QUAN_RECD: TBCDField;
    Aqwz235LOCATION: TStringField;
    Aqwz235REF_NUMBER: TStringField;
    aq235: TADOQuery;
    aq235UNIT_PTR: TIntegerField;
    aq235DESCRIPTION: TStringField;
    aq235GUI_GE: TStringField;
    aq235QUANTITY_RECEIVED: TFloatField;
    aq235QUAN_ORD: TFloatField;
    aq235rohs: TStringField;
    aq235REF_NUMBER: TStringField;
    aq235QUAN_RECD: TBCDField;
    aq235location_ptr: TIntegerField;
    aq235RKEY: TIntegerField;
    aq235tax_price: TFloatField;
    aq235STATE_TAX: TBCDField;
    aq235LOCATION: TStringField;
    aq235UNIT_NAME: TStringField;
    aq235DESCRIPTION2: TStringField;
    ADO22TTYPE: TSmallintField;
    ADO22TDATE: TDateTimeField;
    Aqwz235rohs: TStringField;
    Aq22avl_flag: TStringField;
    ADO456po_type: TStringField;
    ADO22STATUS: TStringField;
    Aqwz456FacNm: TStringField;
    tmp: TADOQuery;
    tmp1: TADOQuery;
    ADO22STOCK_BASE: TBCDField;
    Aq22STOCK_BASE: TFloatField;
    Aqwz22STOCK_BASE: TBCDField;
    Aqwz22cust_decl: TStringField;
    ADO22spec_place: TStringField;
    Aq22spec_place: TStringField;
    Aqwz22spec_place: TStringField;
    ActionList1: TActionList;
    ADO456VMIOUT_PTR: TIntegerField;
    Aqwz456gon_number: TStringField;
    Aqwz456rkey148: TIntegerField;
    ADOtemp: TADOQuery;
    ADO148: TADOQuery;
    ADO148rkey: TAutoIncField;
    ADO148GON_NUMBER: TStringField;
    ADO148warehouse_ptr: TIntegerField;
    ADO148TTYPE: TSmallintField;
    ADO148CREATE_DATE: TDateTimeField;
    ADO148CREATE_BY: TIntegerField;
    ADO148RECD_BY: TIntegerField;
    ADO148REF_NUMBER: TStringField;
    ADO148supplier_ptr: TIntegerField;
    ADO148status: TWordField;
    ADO149: TADOQuery;
    ADO149INVENTORY_PTR: TIntegerField;
    ADO149GON_PTR: TIntegerField;
    ADO149D0134_PTR: TIntegerField;
    ADO149QUANTITY: TBCDField;
    ADO149RTN_QUANTITY: TBCDField;
    ADO149tax_price: TBCDField;
    ADO149TAX_2: TBCDField;
    Aqwz149: TADOQuery;
    Aqwz149rkey: TAutoIncField;
    Aqwz149quantity: TBCDField;
    Aqwz149tax_price: TBCDField;
    Aqwz149tax_2: TBCDField;
    Aqwz149quan_on_hand: TBCDField;
    aq134: TADOQuery;
    aq134RKEY: TAutoIncField;
    aq134GRN_PTR: TIntegerField;
    aq134INVENTORY_PTR: TIntegerField;
    aq134SOURCE_PTR: TIntegerField;
    aq134LOCATION_PTR: TIntegerField;
    aq134UNIT_PTR: TIntegerField;
    aq134QUANTITY: TBCDField;
    aq134QUAN_ON_HAND: TBCDField;
    aq134QUAN_RETURNED: TBCDField;
    aq134tax_price: TBCDField;
    aq134PRICE: TBCDField;
    aq134TAX_2: TBCDField;
    aq134BARCODE_ID: TStringField;
    aq134SUPPLIER2: TStringField;
    aq134EXPIRE_DATE: TDateTimeField;
    aq134rohs: TStringField;
    ADO04_724: TADOQuery;
    ADO04_724SEED_VALUE: TStringField;
    ADO04_724SEED_FLAG: TWordField;
    Aq22Tdate: TDateTimeField;
    Aqwz22Tdate: TDateTimeField;
    Aqwz456create_date: TDateTimeField;
    ds176: TDataSource;
    aq176: TADOQuery;
    aq176rkey: TAutoIncField;
    aq176location: TWideStringField;
    aq176rkey_16: TIntegerField;
    at176: TADOTable;
    at176rkey: TAutoIncField;
    at176location: TWideStringField;
    at176rkey_16: TIntegerField;
    aq16_15: TADOQuery;
    aq16_15rkey: TAutoIncField;
    aq16_15code: TStringField;
    aq16_15location: TStringField;
    aq16_15location_type: TWordField;
    aq16_15whouse_ptr: TIntegerField;
    aq16_15warehouse_code: TStringField;
    aq16_15warehouse_name: TStringField;
    aq16_15abbr_name: TStringField;
    aq16_15type: TStringField;
    at176code: TStringField;
    at176MainLocation: TStringField;
    at176abbr_name: TStringField;
    at176type: TStringField;
    ADO22PACKING_SLIP_FLAG: TStringField;
    Aq22if_caf: TWideStringField;
    Aq22rohs22: TStringField;
    Aq22PACKING_SLIP_FLAG: TStringField;
    ADO22cust_decl: TStringField;
    ADO22tax_price: TBCDField;
    Aqwz22price: TBCDField;
    ADO22QUAN_RTNED_FM_FACT: TFloatField;
    Aqwz22QUAN_RTNED_FM_FACT: TFloatField;
    Aq22QUAN_RTNED_FM_FACT: TFloatField;
    Aqwz22EMPLOYEE_NAME: TStringField;
    Aqwz22DEPT_NAME: TStringField;
    Aqwz22EMPL_CODE: TStringField;
    Aqwz22DEPT_CODE: TStringField;
    Aqwz235DEPT_CODE: TStringField;
    Aqwz235DEPT_NAME: TStringField;
    Aqwz235EMPL_CODE: TStringField;
    Aqwz235EMPLOYEE_NAME: TStringField;
    Aqwz22source_ptr: TIntegerField;
    Aq22QUAN_IN_INSP: TBCDField;
    Aqwz22rkey: TAutoIncField;
    Aqwz456ABBR_NAME: TStringField;
    Aqwz235_1: TADOQuery;
    Aqwz235_1goods_name: TStringField;
    Aqwz235_1goods_guige: TStringField;
    Aqwz235_1goods_type: TStringField;
    Aqwz235_1UNIT_NAME: TStringField;
    Aqwz235_1QUAN_RECD: TBCDField;
    Aqwz235_1LOCATION: TStringField;
    Aqwz235_1REF_NUMBER: TStringField;
    Aqwz235_1rohs: TStringField;
    Aqwz235_1unit_price: TBCDField;
    Aqwz235_1state_tax: TBCDField;
    Aqwz235_1DATE_RECD: TDateTimeField;
    Aqwz235_1unit_ptr: TIntegerField;
    Aqwz235_1location_ptr: TIntegerField;
    Aqwz235_1EMPL_PTR: TIntegerField;
    aq75: TADOQuery;
    aq75ADOQuery: TADOQuery;
    aq75IntegerField: TIntegerField;
    aq75StringField: TStringField;
    aq75rkey: TIntegerField;
    aq75DESCRIPTION: TStringField;
    Aqwz235goods_name: TStringField;
    Aqwz235goods_guige: TStringField;
    Aqwz235goods_type: TStringField;
    ADO22D0134_PTR: TIntegerField;
    Aqwz456EMPLOYEE_NAME_1: TStringField;
    Aq22rkey391: TIntegerField;
    Aq22d0134_ptr: TIntegerField;
    Aqwz22rkey391: TIntegerField;
    Aqwz22d0134_ptr: TIntegerField;
    ADO22SUPPLIER_PTR: TIntegerField;
    ADO22DISCOUNT: TFloatField;
    ADO22QUAN_IN_INSP: TBCDField;
    ADO22QUAN_TO_BE_SHIPPED: TBCDField;
    ADO22QUAN_TO_BE_STOCKED: TBCDField;
    ADO22QUAN_RETURNED: TBCDField;
    ADO22QUAN_SCRAPPED: TBCDField;
    ADO22QUAN_STOCKED: TFloatField;
    ADO22QUAN_ISSUED_TO_FACT: TFloatField;
    ADO22GL_HEADER_PTR: TIntegerField;
    ADO22GLPTR_STATUS: TBooleanField;
    ADO22rkey391: TIntegerField;
    ADO22IF_SEND: TBooleanField;
    Aqwz235cust_decl: TStringField;
    ADO235RKEY: TAutoIncField;
    ADO235GRN_PTR: TIntegerField;
    ADO235D0072_PTR: TIntegerField;
    ADO235EMPL_PTR: TIntegerField;
    ADO235DATE_RECD: TDateTimeField;
    ADO235QUAN_RECD: TBCDField;
    ADO235REF_NUMBER: TStringField;
    ADO235QUAN_ON_HAND: TBCDField;
    ADO235quan_to_ship: TFloatField;
    ADO235quan_returned: TFloatField;
    ADO235unit_price: TBCDField;
    ADO235state_tax: TBCDField;
    ADO235rohs: TStringField;
    ADO235unit_ptr: TIntegerField;
    ADO235location_ptr: TIntegerField;
    ADO235goods_name: TStringField;
    ADO235goods_guige: TStringField;
    ADO235goods_type: TStringField;
    ADO235GL_HEADER_PTR: TIntegerField;
    ADO235GLPTR_STATUS: TBooleanField;
    ADO235cust_decl: TStringField;
    Aqwz22CONVERSION_FACTOR: TFloatField;
    Aqwz22status391: TIntegerField;
    ADO235avl_flag: TStringField;
    ADO235IQC_FLAG: TBooleanField;
    aq235avl_flag: TStringField;
    Aqwz235avl_flag: TStringField;
    Aqwz235rkey: TAutoIncField;
    ADO456exch_rate: TFloatField;
    Aqwz456exch_rate: TFloatField;
    ADO22PRICE: TFloatField;
    ADO22ORIG_ABBRNAME: TStringField;
    Aq22ORIG_ABBRNAME: TStringField;
    Aqwz22ORIG_ABBRNAME: TStringField;
    procedure Aqwz456CalcFields(DataSet: TDataSet);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }

  public
    { Public declarations }
   function find_maxdate():tdatetime;
   function GetNo(edt:TMaskEdit;table_name:string;tp:integer=0):boolean;
  end;

var
  dm: Tdm;

implementation

uses main;

{$R *.dfm}


function Tdm.find_maxdate: tdatetime;
begin
 with ADOQuery2 do
  begin
   close;
   sql.Clear;
   sql.Add('SELECT isnull(MAX(MATL_DATE),0) AS MATL_DATE');
   sql.Add('FROM Data0444');
   open;
   result:=fieldbyname('MATL_DATE').AsDateTime;
  end;
end;
function Tdm.GetNo(edt:TMaskEdit; table_name:string;tp:integer=0):boolean;
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
procedure Tdm.Aqwz456CalcFields(DataSet: TDataSet);
begin
 case aqwz456status.Value of
  1 : aqwz456v_status.Value := '未提交';
  2 : aqwz456v_status.Value := '待审核';
  3 : aqwz456v_status.Value := '已审核';
  4 : aqwz456v_status.Value := '已记帐';
  5 : aqwz456v_status.Value := '已付款';
  6 : aqwz456v_status.Value := '被退回';
 end;

end;

procedure Tdm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
with form1 do
if (self.Aqwz456TTYPE.Value=2) or (self.Aqwz456TTYPE.Value=6) then
 begin
  dbgrid3.BringToFront;
 end
else
 begin
  dbgrid2.BringToFront;
 end;

end;
end.














