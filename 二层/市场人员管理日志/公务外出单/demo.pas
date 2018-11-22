unit demo;

interface

uses
  SysUtils, Classes, DB, ADODB,windows, DBClient, Provider,mask,Dialogs,StrUtils;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADO723: TADOQuery;
    ADO723LogNo: TStringField;
    ADO723salesID: TIntegerField;
    ADO723CUSTOMER_NAME: TStringField;
    ADO723BILLING_ADDRESS_1: TStringField;
    ADO723apply_date: TDateTimeField;
    ADO723goout_date: TDateTimeField;
    ADO723return_date: TDateTimeField;
    ADO723ent_date: TDateTimeField;
    ADO723goout_reason: TStringField;
    ADO723AuditID: TIntegerField;
    ADO723Audit_Date: TDateTimeField;
    ADO723AuditRemark: TStringField;
    ADO723status: TWordField;
    ADO723status_c: TStringField;
    ADO723USER_FULL_NAME: TStringField;
    ADO723USER_LOGIN_NAME: TStringField;
    ADO723USER_FULL_NAME_A: TStringField;
    ADO723USER_LOGIN_NAME_A: TStringField;
    DataSource1: TDataSource;
    ADO723_1: TADOQuery;
    ADOtemp: TADOQuery;
    DataSource2: TDataSource;
    ADO73: TADOQuery;
    ADO73EMPLOYEE_NAME: TStringField;
    ADO73DEPT_NAME: TStringField;
    ADO73TPOSTION: TStringField;
    ADO73EMPL_CODE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetNo(edt:TMaskEdit;itable:string;tp:integer=0):boolean;
  end;

var
  dm: Tdm;
  Fno723:string;
implementation

{$R *.dfm}
 function Tdm.GetNo(edt:TMaskEdit; itable:string;tp:integer=0):boolean;
var i,iL:integer;
    s,sL:string;
    B:boolean;
    table_name:string;
begin
  result:=false;
  dm.ADOtemp.Close;
  dm.ADOtemp.SQL.Text:='select SEED_VALUE,seed_flag,table_name  from data0004  where table_name =:table_name';
  dm.ADOtemp.Parameters[0].Value:=itable;
  dm.ADOtemp.Open;
  if dm.ADOtemp.IsEmpty or (dm.ADOtemp.Fields[1].AsInteger=1) then exit;

  s:=trim(dm.ADOtemp.Fields[0].AsString);
  table_name:=trim(dm.ADOtemp.Fields[2].AsString);
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
        dm.ADOtemp.Parameters[0].Value:=itable;
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
      dm.ADOtemp.Parameters[0].Value:=itable;
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
        dm.ADOtemp.Parameters[0].Value:=itable;
        if dm.ADOtemp.ExecSQL=0 then
        begin
          dm.ADOtemp.Close;
          dm.ADOtemp.SQL.Text:='select SEED_VALUE  from data0004  where table_name=:table_name';
          dm.ADOtemp.Parameters[0].Value:=itable;
          dm.ADOtemp.Open;
          edt.Text:=dm.ADOtemp.Fields[0].AsString;
        end else
          B:=false;
      end;
    end;
  end ;
  result:=true;
end;

end.
