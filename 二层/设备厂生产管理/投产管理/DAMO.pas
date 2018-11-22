unit DAMO;

interface

uses
  SysUtils, Classes, DB, ADODB, common;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADS492: TADODataSet;
    DataSource1: TDataSource;
    ADS492CUT_NO: TStringField;
    ADS492SO_NO: TStringField;
    ADS492PLANNED_QTY: TIntegerField;
    ADS492ISSUED_QTY: TIntegerField;
    ADS492SCH_COMPL_DATE: TDateTimeField;
    ADS492ISSUE_DATE: TDateTimeField;
    ADS492rkey: TAutoIncField;
    ADS492TSTATUS: TWordField;
    ADS492REMARK: TStringField;
    ADS492FG_QTY: TIntegerField;
    ADS492WIP_QTY: TIntegerField;
    ADS492QTY_REJECT: TIntegerField;
    ADS492ORD_REQ_QTY: TIntegerField;
    ADS492EMPLOYEE_NAME: TStringField;
    ADS492PROD_CODE: TStringField;
    ADS492PRODUCT_NAME: TStringField;
    ADS492PRODUCT_DESC: TStringField;
    ADS492DEPT_CODE: TStringField;
    ADS492DEPT_NAME: TStringField;
    ADS492v_ttype: TStringField;
    ADOQuery1: TADOQuery;
    aqy04: TADOQuery;
    aqy04CONTROL_NO_LENGTH: TSmallintField;
    aqy04SEED_FLAG: TWordField;
    aqy04SEED_VALUE: TStringField;
    ADOQuery2: TADOQuery;
    ADS492PRINTED_BY_PTR: TIntegerField;
    ADS492mrb_ptr: TIntegerField;
    ADS492BOM_PTR: TIntegerField;
    ADS492WHOUSE_PTR: TIntegerField;
    ADS492warehouse_code: TStringField;
    DataSource2: TDataSource;
    ADS468: TADODataSet;
    ADS468INV_PART_NUMBER: TStringField;
    ADS468INV_NAME: TStringField;
    ADS468INV_DESCRIPTION: TStringField;
    ADS468QUAN_BOM: TFloatField;
    ADS468QUAN_ISSUED: TFloatField;
    ADS468UNIT_NAME: TStringField;
    ADS468DSDesigner2: TStringField;
    ADS468VENDOR: TStringField;
    ADS468CUT_NO: TStringField;
    ADS468RKEY: TIntegerField;
    ADS468STATUS: TSmallintField;
    ADS468QUAN_ON_HAND: TBCDField;
    ADS468DSDesigner: TStringField;
    ADS492_P: TADODataSet;
    ADS468_P: TADODataSet;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    ADS492_PCUT_NO: TStringField;
    ADS492_PDSDesigner: TStringField;
    ADS492_PDSDesigner2: TStringField;
    ADS492_PDSDesigner3: TIntegerField;
    ADS492_PDSDesigner4: TIntegerField;
    ADS492_PDSDesigner5: TDateTimeField;
    ADS492_PDSDesigner6: TDateTimeField;
    ADS492_Prkey: TAutoIncField;
    ADS492_PTSTATUS: TWordField;
    ADS492_PDSDesigner7: TStringField;
    ADS492_PDSDesigner8: TStringField;
    ADS492_PDSDesigner9: TStringField;
    ADS492_PDSDesigner10: TStringField;
    ADS492_PDSDesigner11: TStringField;
    ADS492_PDSDesigner12: TStringField;
    ADS492_PDSDesigner13: TStringField;
    ADS492_Pv_ttype: TStringField;
    ADS492_PDSDesigner14: TStringField;
    ADS492_PDSDesigner15: TStringField;
    ADS492_PDSDesigner16: TStringField;
    ADS492_PDSDesigner17: TDateTimeField;
    ADS468_PDSDesigner: TStringField;
    ADS468_PDSDesigner2: TStringField;
    ADS468_PDSDesigner3: TStringField;
    ADS468_PDSDesigner4: TBCDField;
    ADS468_PRKEY: TIntegerField;
    ADS468_PDSDesigner5: TStringField;
    ADS468_PDSDesigner6: TFloatField;
    ADS468_PDSDesigner7: TFloatField;
    ADS468_PDSDesigner8: TStringField;
    ADS468_PSTATUS: TSmallintField;
    ADS468_PDSDesigner9: TStringField;
    ADS468_PDSDesigner10: TStringField;
    ADS492cutno: TStringField;
    ADS492_PDSDesigner18: TStringField;
    ADS468number: TStringField;
    ADS492CUST_CODE: TStringField;
    ADS492ABBR_NAME: TStringField;
    ADS492price: TBCDField;
    ADS492dept_names: TStringField;
    qrytemp: TADOQuery;
    ADOCommand1: TADOCommand;
    ADS0493: TADODataSet;
    ADS0493EMPL_CODE: TStringField;
    ADS0493EMPLOYEE_NAME: TStringField;
    ADS0493Rkey: TIntegerField;
    ADS0493D492_ptr: TIntegerField;
    ADS0493OldSTATUS: TWordField;
    ADS0493TSTATUS: TWordField;
    ADS0493Oper_date: TDateTimeField;
    ADS0493Oper_Empl: TIntegerField;
    ADS0493remark: TWideStringField;
    ADS492v_TSTATUS: TStringField;
    ADS492ctrl: TIntegerField;
    ADS0493DSDesigner: TStringField;
    ADOQuery3: TADOQuery;
    ADS492RHour: TBCDField;
    ADS492PHour: TBCDField;
    ADS492ARHour: TBCDField;
    strngfldADS492progress: TStringField;
    tmp: TADOQuery;
    procedure ADS492CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
      function OpenQry(qry:TADOquery;ssql:string):string;
   function  execsql(qry:TADOquery;ssql:string):string;
   function  GetOne(FN,ssql:string;qry:TADOquery):Variant;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

function Tdm.OpenQry(qry:TADOquery;ssql:string):string;
begin

   with qry do
   begin
   close;
   sql.Clear;
   sql.Add(ssql) ;
   open;
   end;

end;

function Tdm.execsql(qry:TADOquery;ssql:string):string;
begin

   with qry do
   begin
   //close;
   sql.Clear;
   sql.Add(ssql) ;
   execsql;
   end;

end;

function Tdm.GetOne(FN,ssql:string;qry:TADOquery):Variant;
begin

 result:='';

  with qry do
  begin
   close;
   sql.clear;
   sql.text:=ssql;
   Open;
  end;
  if not qry.IsEmpty  then
  Result:=qry.fieldbyname(fn).Value;
end;

procedure TDM.ADS492CalcFields(DataSet: TDataSet);
begin
  case ADS492TSTATUS.AsInteger of
    0 :  ADS492v_TSTATUS.AsString := '已审核' ;
    1 :  ADS492v_TSTATUS.AsString := '未审核';
    2 :  ADS492v_TSTATUS.AsString := '不审核';
    3 :  ADS492v_TSTATUS.AsString := '已取消';
    4 :  ADS492v_TSTATUS.AsString := '已完工';
    5 :  ADS492v_TSTATUS.AsString := '已暂停';
  end;
end;

end.
