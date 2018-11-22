unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB,DateUtils,Dialogs,Controls,mask,StrUtils;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    ADOQ416: TADOQuery;
    Tmp: TADOQuery;
    ADOQ53: TADOQuery;
    DS1: TDataSource;
    DS2: TDataSource;
    ADOQ416rkey: TAutoIncField;
    ADOQ416number: TStringField;
    ADOQ416type: TWordField;
    ADOQ416empl_ptr: TIntegerField;
    ADOQ416sys_date: TDateTimeField;
    ADOQ416warehouse_ptr: TIntegerField;
    ADOQ416dept_ptr: TIntegerField;
    ADOQ416quantity: TBCDField;
    ADOQ416reference: TStringField;
    ADOQ416so_ptr: TIntegerField;
    ADOQ416EMPLOYEE_NAME: TStringField;
    ADOQ416dept_code: TStringField;
    ADOQ416dept_name: TStringField;
    ADOQ53RKEY: TAutoIncField;
    ADOQ53NPAD_PTR: TIntegerField;
    ADOQ53LOC_PTR: TIntegerField;
    ADOQ53CUST_PART_PTR: TIntegerField;
    ADOQ53mo_ptr: TIntegerField;
    ADOQ53QUANTITY: TBCDField;
    ADOQ53REFERENCE_NUMBER: TStringField;
    ADOQ53CODE: TStringField;
    ADOQ53LOCATION: TStringField;
    ADOQ53PROD_CODE: TStringField;
    ADOQ53PRODUCT_NAME: TStringField;
    ADOQ53CUT_NO: TStringField;
    ADOQ53PRODUCT_DESC: TStringField;
    ADO416_1: TADOQuery;
    ADO53_1: TADOQuery;
    ADOQ53remark8: TMemoField;
    procedure ADOQ416AfterScroll(DataSet: TDataSet);
  private

  public
    function GetNo(edt:TMaskEdit;ikey:string;tp:integer=0):boolean;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}


procedure TDM.ADOQ416AfterScroll(DataSet: TDataSet);
begin
  if not ADOQ416.IsEmpty then
  begin
    ADOQ53.Close ;
    ADOQ53.Parameters.ParamValues['rkey416'] := ADOQ416rkey.AsInteger;
    ADOQ53.Open ;
  end else
    ADOQ53.Close ;
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
        if sL<>'' then
          DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                           'where rkey='+ikey+' and SEED_VALUE='''+edt.Text+''''
        else
          DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=cast(SEED_VALUE as int)+1 '+
                           'where rkey='+ikey+' and SEED_VALUE='''+edt.Text+'''';
        DM.Tmp.ExecSQL;
      end;

    end;
  end else if DM.Tmp.Fields[1].AsInteger=3 then begin      //系统产生，但可修改
    edt.ReadOnly:=false;
    if tp=0 then
      edt.Text:=DM.Tmp.Fields[0].AsString
    else begin
      DM.Tmp.Close;
        if sL<>'' then
          DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                           'where rkey='+ikey+' and SEED_VALUE='''+edt.Text+''''
        else  //全是数字
          DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=cast(SEED_VALUE as int)+1 '+
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
        if sL<>'' then
          DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                           'where rkey='+ikey+' and SEED_VALUE='''+edt.Text+''''
        else
          DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=cast(SEED_VALUE as int)+1 '+
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
