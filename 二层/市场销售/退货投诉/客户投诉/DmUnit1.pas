
unit DmUnit1;

//Provider=SQLOLEDB.1;Password=WZtopcberp_1077;Persist Security Info=True;User ID=wzsp;Initial Catalog=WISDOMPCB;Data Source=172.16.1.57;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=W119;Use Encryption for Data=False;Tag with column collation when possible=False

interface

uses
  SysUtils, Classes, DB, ADODB,DateUtils;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQALL2: TADOQuery;
    TemADOQuery1: TADOQuery;
    ADOSSeepValueData0004: TADOStoredProc;
    ADOSSeepValueData0004SeedValue: TStringField;
    TemADOQuery: TADOQuery;
    ADOQ0101: TADOQuery;
    ADOQ34: TADOQuery;
    ADOQALL2RKEY: TAutoIncField;
    ADOQALL2LOG_NUMBER: TStringField;
    ADOQALL2CUSTOMER_PART_PTR: TIntegerField;
    ADOQALL2CSI_USER_PTR: TIntegerField;
    ADOQALL2CUSTOMER_PTR: TIntegerField;
    ADOQALL2LOG_DATE: TDateTimeField;
    ADOQALL2SHIP_DATE: TDateTimeField;
    ADOQALL2QTY: TFloatField;
    ADOQALL2ANALYSIS: TStringField;
    ADOQALL2AFTER_ACTION: TStringField;
    ADOQALL2STATUS: TSmallintField;
    ADOQALL2CLOSED_BY_PTR: TIntegerField;
    ADOQALL2CLOSED_DATE: TDateTimeField;
    ADOQALL2DEALT_BY_PTR: TIntegerField;
    ADOQALL2DEALT_DATE: TDateTimeField;
    ADOQALL2LOSS_AMT: TIntegerField;
    ADOQALL2RESULT: TStringField;
    ADOQALL2CONTENT: TStringField;
    ADOQALL2CUST_CODE: TStringField;
    ADOQALL2CUSTOMER_NAME: TStringField;
    ADOQALL2MANU_PART_NUMBER: TStringField;
    ADOQALL2MANU_PART_DESC: TStringField;
    ADOQALL2Mystatus: TStringField;
    ADOQALL2Close_EMPLOYEE_NAME: TStringField;
    ADOQALL2Dealt_EMPLOYEE_NAME: TStringField;
    ADOQALL2Ent_EMPLOYEE_NAME: TStringField;
    ADOQ0101RKEY: TAutoIncField;
    ADOQ0101LOG_NUMBER: TStringField;
    ADOQ0101CUSTOMER_PART_PTR: TIntegerField;
    ADOQ0101CSI_USER_PTR: TIntegerField;
    ADOQ0101CUSTOMER_PTR: TIntegerField;
    ADOQ0101LOG_DATE: TDateTimeField;
    ADOQ0101SHIP_DATE: TDateTimeField;
    ADOQ0101QTY: TFloatField;
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
    ADOQ0118: TADOQuery;
    ADOQ0118RKEY: TAutoIncField;
    ADOQ0118SOURCE_PTR: TIntegerField;
    ADOQ0118defect_ptr: TIntegerField;
    ADOQ0118RESP_DEPT_PTR: TIntegerField;
    ADOQ39: TADOQuery;
    ADOQ34RKEY: TIntegerField;
    ADOQ34DEPT_CODE: TStringField;
    ADOQ34DEPT_NAME: TStringField;
    ADOQ39RKEY: TIntegerField;
    ADOQ39REJ_CODE: TStringField;
    ADOQ39REJECT_DESCRIPTION: TStringField;
    ADOQ0118MyREJ_CODE: TStringField;
    ADOQ0118MyREJECT_DESCRIPTION: TStringField;
    ADOQ0118MyDEPT_CODE: TStringField;
    ADOQ0118MyDEPT_NAME: TStringField;
    ADOQ0118FLAG: TBooleanField;
    ADOQ0118Qty: TIntegerField;
    ADOQ0101DEFECT_MAIN: TWideStringField;
    ADOQ0101CYCLES: TWideStringField;
    ADOQ0101UNIT_PTR: TIntegerField;
    ADOQALL2DEFECT_MAIN: TWideStringField;
    ADOQALL2CYCLES: TWideStringField;
    ADOQALL2UNIT_PTR: TIntegerField;
    ADOQALL2Unit_Name: TStringField;
    ADO148: TADOQuery;
    ADO148rkey: TIntegerField;
    ADO148rec_no: TIntegerField;
    ADO148SOURCE_PTR: TIntegerField;
    ADO148file_name: TStringField;
    ADO148in_date: TDateTimeField;
    ADO148remark: TStringField;
    ADOQALL2dept_names: TMemoField;
    ADOQALL2if_send: TBooleanField;
    ADOQALL2Ssend: TStringField;
    ADOQ0101EFFECT_TP: TStringField;
    ADOQALL2EFFECT_TP: TStringField;
    ADOQALL2CType: TIntegerField;
    ADOQ0101if_send: TBooleanField;
    ADOQ0101CType: TIntegerField;
    procedure ADOQALL2CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function Get_ServerDatetime(var valDateTime,valDate,valdt : string ; var valymd:tdatetime):boolean;
    function Get_Data0004():string;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

function TDM.Get_ServerDatetime(var valDateTime, valDate,valdt: string ;
                                var valymd:tdatetime): boolean;
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

procedure TDM.ADOQALL2CalcFields(DataSet: TDataSet);
begin
  {if  ADOQALL2REJECT_DEFECT_FLAG.AsString  = 'R' then
      begin
          ADOQALL2MyREJECT_DEFECT_FLAG.AsString := '报废';
      end
  else if  ADOQALL2REJECT_DEFECT_FLAG.AsString = 'D' then
      begin
          ADOQALL2MyREJECT_DEFECT_FLAG.AsString := '不良/投诉';
      end ;{}

  case  ADOQALL2.FieldByName('status').AsInteger of
      0 : ADOQALL2.FieldByName('Mystatus').Asstring := '待提交';
      1 : ADOQALL2.FieldByName('Mystatus').Asstring := '已提交';
      2 : ADOQALL2.FieldByName('Mystatus').Asstring := '已受理';
      3 : ADOQALL2.FieldByName('Mystatus').Asstring := '已结案';
  end;
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

  //ADOQ0118.FieldByName().FieldKind
end;

end.
