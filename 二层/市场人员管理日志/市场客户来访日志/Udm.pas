unit Udm;

interface

uses
  SysUtils, Classes, DB, ADODB, MASK, COMMON,Dialogs,StrUtils;

type
  TDM = class(TDataModule)
    ADO722: TADOQuery;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADO722rkey: TAutoIncField;
    ADO722LogNo: TStringField;
    ADO722CustName: TStringField;
    ADO722VistDate: TDateTimeField;
    ADO722visitors: TStringField;
    ADO722visitedMan: TStringField;
    ADO722Comp_BckGrd: TStringField;
    ADO722Prod_type: TStringField;
    ADO722PCB_Req: TStringField;
    ADO722Exp_quan: TStringField;
    ADO722Close_Acc: TStringField;
    ADO722Quality_Req: TStringField;
    ADO722Ques_Answ: TStringField;
    ADO722Conclusion: TStringField;
    ADO722others: TStringField;
    ADO722isUpdate: TBooleanField;
    ADO722status: TIntegerField;
    ADO722ReportID: TIntegerField;
    ADO722Ent_Date: TDateTimeField;
    ADO722AuditID: TIntegerField;
    ADO722AuditRemark: TStringField;
    ADO722AuditDate: TDateTimeField;
    ADO722status_c: TStringField;
    ADO722USER_FULL_NAME: TStringField;
    ADO722USER_LOGIN_NAME: TStringField;
    ADO722USER_FULL_NAME_A: TStringField;
    ADO722USER_LOGIN_NAME_A: TStringField;
    Tmp: TADOQuery;
    ADO722_1: TADOQuery;
    DataSource2: TDataSource;
    ADO493: TADOQuery;
    DataSource3: TDataSource;
    ADO493Company_Name: TStringField;
    ADO493Company_Icon: TBlobField;
  private
    { Private declarations }
  public
  function GetNo(edt:TMaskEdit;ikey:string;tp:integer=0):boolean;
    { Public declarations }
  end;

var
  DM: TDM;
  Frkey722:integer;
implementation

{$R *.dfm}

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
      DM.Tmp.SQL.Text:='select top 1 LogNo from '+table_name+' where LogNo='''+edt.Text+'''';
      DM.Tmp.Open;
      if not DM.Tmp.IsEmpty then
      begin
        showmessage('单号重复,请重新输入...');
        exit;
      end ;

      DM.Tmp.Close;
      DM.Tmp.SQL.Text:='select top 1 LogNo from '+table_name+' order by LogNo desc';
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
      iL:=length(s);
      for i:=iL downto 1 do
        if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;    
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
