unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    con1: TADOConnection;
    qrytemp: TADOQuery;
    ADO148: TADOQuery;
    ADO148rkey: TIntegerField;
    ADO148rec_no: TIntegerField;
    ADO148SOURCE_PTR: TIntegerField;
    ADO148file_name: TStringField;
    ADO148in_date: TDateTimeField;
    ADO148remark: TStringField;
    ADOQ0101: TADOQuery;
    ADOQ0101RKEY: TAutoIncField;
    ADOQ0101LOG_NUMBER: TStringField;
    ADOQ0101CUSTOMER_PART_PTR: TIntegerField;
    ADOQ0101CSI_USER_PTR: TIntegerField;
    ADOQ0101CUSTOMER_PTR: TIntegerField;
    ADOQ0101LOG_DATE: TDateTimeField;
    ADOQ0101SHIP_DATE: TDateTimeField;
    ADOQ0101QTY: TFloatField;
    ADOQ0101EFFECT_TP: TStringField;
    ADOQ0101ANALYSIS: TStringField;
    ADOQ0101AFTER_ACTION: TStringField;
    ADOQ0101STATUS: TSmallintField;
    ADOQ0101CLOSED_BY_PTR: TIntegerField;
    ADOQ0101CLOSED_DATE: TDateTimeField;
    ADOQ0101DEALT_BY_PTR: TIntegerField;
    ADOQ0101DEALT_DATE: TDateTimeField;
    ADOQ0101LOSS_AMT: TIntegerField;
    ADOQ0101RESULT: TStringField;
    ADOQ0101CONTENT: TStringField;
    ADOQ0101DEFECT_MAIN: TWideStringField;
    ADOQ0101CYCLES: TWideStringField;
    ADOQ0101UNIT_PTR: TIntegerField;
    TemADOQuery1: TADOQuery;
    TemADOQuery: TADOQuery;
    ADOSSeepValueData0004: TADOStoredProc;
    ADOSSeepValueData0004SeedValue: TStringField;
    ADOQ39: TADOQuery;
    ADOQ39RKEY: TIntegerField;
    ADOQ39REJ_CODE: TStringField;
    ADOQ39REJECT_DESCRIPTION: TStringField;
    ADOQ34: TADOQuery;
    ADOQ34RKEY: TIntegerField;
    ADOQ34DEPT_CODE: TStringField;
    ADOQ34DEPT_NAME: TStringField;
    ADOQ0101if_send: TBooleanField;
    ADOQ0101CType: TIntegerField;
    ADOQ0118: TADOQuery;
    ADOQ0118RKEY: TAutoIncField;
    ADOQ0118SOURCE_PTR: TIntegerField;
    ADOQ0118defect_ptr: TIntegerField;
    ADOQ0118RESP_DEPT_PTR: TIntegerField;
    ADOQ0118MyREJ_CODE: TStringField;
    ADOQ0118MyREJECT_DESCRIPTION: TStringField;
    ADOQ0118MyDEPT_CODE: TStringField;
    ADOQ0118MyDEPT_NAME: TStringField;
    ADOQ0118FLAG: TBooleanField;
    ADOQ0118Qty: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function OpenQry(qry:TADOquery;ssql:string):string;
   function  execsql(qry:TADOquery;ssql:string):string;
   function Get_ServerDatetime(var valDateTime,valDate,valdt : string ; var valymd:tdatetime):boolean;
   function Get_Data0004():string;
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

function TDM.Get_ServerDatetime(var valDateTime, valDate, valdt: string;
  var valymd: tdatetime): boolean;
begin
  result := false;
  if TemADOQuery1.Active then dm.TemADOQuery1.Close ;
  TemADOQuery1.SQL.Clear ;
  TemADOQuery1.SQL.Add('select getdate() as vdt,DATENAME(yyyy, getdate()) as vy,DATENAME(mm, getdate()) as vm,DATENAME(dd, getdate()) as vd');
  TemADOQuery1.Prepared ;
  TemADOQuery1.Open ;
  valymd := dm.TemADOQuery1.fieldbyname('vdt').AsDateTime ;
  valDateTime := datetimetostr(dm.TemADOQuery1.fieldbyname('vdt').asdatetime);
  valDate := datetostr(dm.TemADOQuery1.fieldbyname('vdt').asdatetime);
  valdt := copy(dm.TemADOQuery1.fieldbyname('vy').AsString,3,2);
  valdt := valdt + copy('00',1,2 - length(trim(dm.TemADOQuery1.fieldbyname('vm').AsString))) + dm.TemADOQuery1.fieldbyname('vm').AsString;
  valdt := valdt + copy('00',1,2 - length(trim(dm.TemADOQuery1.fieldbyname('vd').AsString))) + dm.TemADOQuery1.fieldbyname('vd').AsString;
  //showmessage(vdt);
  dm.TemADOQuery1.Close ;
  result := true;
end;

function TDM.Get_Data0004: string;
var
  vseed2:string;
begin
  result := '';
  if TemADOQuery1.Active then TemADOQuery1.Close ;
  TemADOQuery1.SQL.Clear ;
  TemADOQuery1.SQL.Add('SELECT * from data0004 WHERE rkey = 2 ');
  TemADOQuery1.Prepared ;
  TemADOQuery1.Open ;
  vseed2 := TemADOQuery1.fieldbyname('seed_value').AsString ;
  TemADOQuery1.Close ;

  if dm.ADOSSeepValueData0004.Active then dm.ADOSSeepValueData0004.Close ;
  ADOSSeepValueData0004.Parameters.ParamValues['@RKEY0004'] := 2 ;
  ADOSSeepValueData0004.Parameters.ParamValues['@ttype'] := 0 ;
  ADOSSeepValueData0004.Parameters.ParamValues['@ttype2'] := 0 ;
  ADOSSeepValueData0004.Parameters.ParamValues['@tablwname'] := 'data0101' ;
  ADOSSeepValueData0004.Parameters.ParamValues['@FieldNamw'] := 'LOG_NUMBER' ;
  ADOSSeepValueData0004.Prepared ;
  ADOSSeepValueData0004.Open ;
  vseed2 := dm.ADOSSeepValueData0004SeedValue.Value ;
  ADOSSeepValueData0004.Close ;
  result := vseed2;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
//  if not ADOQ39.Active  then ADOQ39.Open;
//  if not ADOQ34.Active  then ADOQ34.Open;

end;

end.
