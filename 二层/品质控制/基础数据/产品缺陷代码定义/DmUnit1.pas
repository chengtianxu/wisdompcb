unit DmUnit1;

interface

uses
  SysUtils, Classes, DB, ADODB,DateUtils;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQALL2: TADOQuery;
    TemADOQuery1: TADOQuery;
    ADOQALL2RKEY: TAutoIncField;
    ADOQALL2REJ_CODE: TStringField;
    ADOQALL2REJECT_DESCRIPTION: TStringField;
    ADOQALL2REJECT_DEFECT_FLAG: TStringField;
    AD39: TADOQuery;
    AD40: TADOQuery;
    AD34: TADOQuery;
    AD39RKEY: TAutoIncField;
    AD39REJ_CODE: TStringField;
    AD39REJECT_DESCRIPTION: TStringField;
    AD39REJECT_DEFECT_FLAG: TStringField;
    AD40RKEY: TAutoIncField;
    AD40REJECT_CODE_PTR: TIntegerField;
    AD40DEPT_PTR: TIntegerField;
    AD34RKEY: TAutoIncField;
    AD34DEPT_CODE: TStringField;
    AD34DEPT_NAME: TStringField;
    AD40MyDEPT_CODE: TStringField;
    AD40MyDEPT_NAME: TStringField;
    ADOSSeepValueData0004: TADOStoredProc;
    ADOSSeepValueData0004SeedValue: TStringField;
    AD39rej_type: TWordField;
    ADOQALL2Myrej_type: TStringField;
    ADOQALL2FQCBugSName: TStringField;
    AD39FQCBugsCode: TWordField;
  private
    { Private declarations }
  public
    { Public declarations }
    seed_flag:integer;
//    function Get_ServerDatetime(var valDateTime,valDate,valdt : string ; var valymd:tdatetime):boolean;
    function Get_Data0004():string;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}
{
function TDM.Get_ServerDatetime(var valDateTime, valDate,valdt: string ;var valymd:tdatetime): boolean;
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
  valdt := valdt + dm.TemADOQuery1.fieldbyname('vm').AsString;
  valdt := valdt + dm.TemADOQuery1.fieldbyname('vd').AsString;
  dm.TemADOQuery1.Close ;
  result := true;

end;
}
function TDM.Get_Data0004: string;
var
  vseed2:string;
begin
  result := '';
  TemADOQuery1.Close ;
  TemADOQuery1.SQL.Clear ;
  TemADOQuery1.SQL.Add('SELECT * from data0004 WHERE rkey = 15');
  TemADOQuery1.Prepared ;
  TemADOQuery1.Open ;
  vseed2 := TemADOQuery1.fieldbyname('seed_value').AsString ;
  seed_flag:=  TemADOQuery1.FieldByName('SEED_FLAG').Value;
  TemADOQuery1.Close ;

  
  ADOSSeepValueData0004.Close ;
  ADOSSeepValueData0004.Parameters.ParamValues['@RKEY0004'] := 15 ;
  ADOSSeepValueData0004.Parameters.ParamValues['@ttype'] := 0;
  ADOSSeepValueData0004.Parameters.ParamValues['@ttype2'] := 0;
  ADOSSeepValueData0004.Parameters.ParamValues['@tablwname'] := 'data0039' ;
  ADOSSeepValueData0004.Parameters.ParamValues['@FieldNamw'] := 'REJ_CODE';
  ADOSSeepValueData0004.Prepared ;
  ADOSSeepValueData0004.Open ;

  if  seed_flag<>1 then
   vseed2 := dm.ADOSSeepValueData0004SeedValue.Value
  else
   vseed2 :='';
   
  ADOSSeepValueData0004.Close ;
  result := vseed2;


end;

end.
