unit data_module;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    Aqwz22: TADOQuery;
    ADO456: TADOQuery;
    ADOQuery2: TADOQuery;
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
    ADO456warehouse_ptr: TIntegerField;
    aq16: TADOQuery;
    aq16rkey: TIntegerField;
    aq16LOCATION: TStringField;
    Aqwz22LOCATION_PTR_FROM: TIntegerField;
    Aqwz22LOCATION_PTR: TIntegerField;
    Aqwz22INVENTORY_PTR: TIntegerField;
    Aqwz22PRICE: TBCDField;
    Aqwz22TAX_2: TBCDField;
    Aqwz22SHELF_LIFE: TSmallintField;
    Aqwz22rohs: TStringField;
    Aqwz22SUPPLIER2: TStringField;
    Aqwz22CONVERSION_FACTOR: TFloatField;
    Aqwz22rkey: TIntegerField;
    DataSource3: TDataSource;
    Aqwz235: TADOQuery;
    Aqwz235DESCRIPTION: TStringField;
    Aqwz235GUI_GE: TStringField;
    Aqwz235DESCRIPTION2: TStringField;
    Aqwz235UNIT_NAME: TStringField;
    Aqwz235QUAN_RECD: TBCDField;
    Aqwz235LOCATION: TStringField;
    Aqwz235REF_NUMBER: TStringField;
    Aqwz235unit_price: TBCDField;
    Aqwz235state_tax: TBCDField;
    Aqwz235rohs: TStringField;
    Aqwz235QUAN_ORD: TFloatField;
    Aqwz456: TADODataSet;
    Aqwz456RKEY: TIntegerField;
    Aqwz456GRN_NUMBER: TStringField;
    Aqwz456DELIVER_NUMBER: TStringField;
    Aqwz456CODE: TStringField;
    Aqwz456SUPPLIER_NAME: TStringField;
    Aqwz456ABBR_NAME: TStringField;
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
    Aqwz456exch_rate: TBCDField;
    Aqwz456v_type: TStringField;
    Aqwz456v_status: TStringField;
    Aqwz456gon_number: TStringField;
    Aqwz456rkey148: TIntegerField;
    Aqwz22cust_decl: TStringField;
    Aqwz22STOCK_BASE: TBCDField;
    Aqwz22SHELF_LIFE_1: TSmallintField;
    Aqwz22spec_place: TStringField;
    Aqwz456EMPLOYEE_NAME2: TStringField;
    Aqwz456EMPL_CODE2: TStringField;
    Aqwz456AUDITED_DATE: TDateTimeField;
    Aqwz22tdate: TDateTimeField;
    Aqwz456selected: TBooleanField;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Aqwz456BeforeDelete(DataSet: TDataSet);
    procedure Aqwz456selectedChange(Sender: TField);
    procedure Aqwz456AfterOpen(DataSet: TDataSet);
    procedure Aqwz456AfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    count:Integer;
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

uses main;

{$R *.dfm}

procedure Tdm.DataSource1DataChange(Sender: TObject; Field: TField);
begin
with form1 do
if self.Aqwz456TTYPE.Value=2 then
 begin
  dbgrid3.BringToFront;
 end
else
 begin
  dbgrid2.BringToFront;
 end;
end;

procedure Tdm.Aqwz456BeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

procedure Tdm.Aqwz456selectedChange(Sender: TField);
begin
  if Aqwz456selected.Value=True then
    count:=count+ 1
  else
    count:=count-1;

end;

procedure Tdm.Aqwz456AfterOpen(DataSet: TDataSet);
begin
count :=0;
end;

procedure Tdm.Aqwz456AfterClose(DataSet: TDataSet);
begin
  Form1.CheckBox7.Checked := False;
end;

end.
