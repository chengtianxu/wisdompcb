unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB, DBClient, Provider,windows;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    ADO160: TADOQuery;
    ADO219: TADOQuery;
    ADO220: TADOQuery;
    ADO270: TADOQuery;
    tmp: TADOQuery;
    DS219: TDataSource;
    ADO219RKEY: TAutoIncField;
    ADO219GRN_NUMBER: TStringField;
    ADO219CREATE_DATE: TDateTimeField;
    ADO219SYSTEM_DATE: TDateTimeField;
    ADO219TTYPE: TWordField;
    ADO219location_fromptr: TIntegerField;
    ADO219location_endptr: TIntegerField;
    ADO219CREATE_BY: TIntegerField;
    ADO219handle_name: TStringField;
    ADO219REMARK: TStringField;
    ADO160location_code: TStringField;
    ADO160location_name: TStringField;
    ADO160INV_PART_NUMBER: TStringField;
    ADO160oh_degree: TWordField;
    ADO160Quan_valid: TIntegerField;
    ADO160rkey17: TAutoIncField;
    ADO160rkey160: TAutoIncField;
    ADO160rkey220: TAutoIncField;
    DS160: TDataSource;
    ADO160inv_part_description: TStringField;
    ADO160type: TWordField;
    ADO160supplier_ptr: TIntegerField;
    PR160: TDataSetProvider;
    CDS160: TClientDataSet;
    ADO160grn_number: TStringField;
    ADO160create_date: TDateTimeField;
    ADO160Type_c: TStringField;
    tmp1: TADOQuery;
    ADO160remark: TStringField;
    ADO219_1: TADOQuery;
    ADO220_1: TADOQuery;
    DS219_1: TDataSource;
    DS220_1: TDataSource;
    ADO219_1RKEY: TIntegerField;
    ADO219_1GRN_NUMBER: TStringField;
    ADO219_1CREATE_DATE: TDateTimeField;
    ADO219_1TTYPE: TWordField;
    ADO219_1location_fromptr: TIntegerField;
    ADO219_1location_endptr: TIntegerField;
    ADO219_1CREATE_BY: TIntegerField;
    ADO219_1handle_name: TStringField;
    ADO219_1REMARK: TStringField;
    ADO219_1ttype_c: TStringField;
    ADO219_1location_code: TStringField;
    ADO219_1employee_name: TStringField;
    ADO220_1OH_degree: TWordField;
    ADO220_1QUANTITY: TIntegerField;
    ADO220_1REMARK: TStringField;
    ADO220_1inv_part_number: TStringField;
    ADO220_1abbr_name: TStringField;
    ADO220_1location_code: TStringField;
    ADO219_2: TADOQuery;
    ADO220_2: TADOQuery;
    DS219_2: TDataSource;
    DS220_2: TDataSource;
    ADO220_2QUANTITY: TIntegerField;
    ADO220_2OH_degree: TWordField;
    ADO220_2REMARK: TStringField;
    ADO220_2inv_part_number: TStringField;
    ADO220_2abbr_name: TStringField;
    ADO220_2location_Name: TStringField;
    ADO219_2RKEY: TAutoIncField;
    ADO219_2GRN_NUMBER: TStringField;
    ADO219_2CREATE_DATE: TDateTimeField;
    ADO219_2SYSTEM_DATE: TDateTimeField;
    ADO219_2TTYPE: TWordField;
    ADO219_2location_fromptr: TIntegerField;
    ADO219_2location_endptr: TIntegerField;
    ADO219_2CREATE_BY: TIntegerField;
    ADO219_2handle_name: TStringField;
    ADO219_2REMARK: TStringField;
    ADO219_2ttype_c: TStringField;
    ADO219_2location_code: TStringField;
    ADO219_2employee_name: TStringField;
    dp160: TDataSetProvider;
    cds160a: TClientDataSet;
    procedure ADO219_1AfterScroll(DataSet: TDataSet);
    procedure ADO219_2AfterScroll(DataSet: TDataSet);
    procedure ADO219_1location_codeGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ADO220_1location_codeGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    { Private declarations }
  public
    procedure Get_ServerDatetime(var valDateTime,valDate,valdt : string ; var valymd:tdatetime);
    function Get_Data0004(tp:integer;sNo:string='^'):string;
    function Get0073(Rkey:Integer):string;
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

{ TDM }
function Tdm.Get0073(Rkey: Integer): string;
var tmpAdo:TADOQuery;
    sRkey:string;
begin
  try
    tmpAdo:=TADOQuery.Create(Self);
    tmpAdo.Connection:=ADOCon;
    tmpAdo.Close;
    tmpAdo.SQL.Clear;
    tmpAdo.SQL.Add('select * from dbo.data0073 where Rkey=:Rkey');
    tmpAdo.Parameters.ParamByName('Rkey').Value:=Rkey;
    tmpAdo.Open;
    if not tmpAdo.Eof then
    begin
      if (tmpAdo.FieldByName('EMPLOYEE_PTR').Value='') then sRkey:=''
      else sRkey:=IntToStr(tmpAdo.FieldByName('EMPLOYEE_PTR').AsInteger);
    end;
    if ((sRkey<>'')) then
    begin
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Add('select * from dbo.data0005 where Rkey=:Rkey');
      tmpAdo.Parameters.ParamByName('Rkey').Value:=StrToInt(sRkey);
      tmpAdo.Open;
      if not tmpAdo.Eof then
      begin
        Result:=tmpAdo.FieldByName('EMPLOYEE_NAME').AsString;
      end else
        Result:='';
    end else
    begin
      windows.messagebox(0,'操作提示','基本信息错误',MB_ICONSTOP);
    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
  end;
end;

function TDM.Get_Data0004(tp: integer; sNo: string): string;
var sL,s:string;
    B:boolean;
    i:integer;
begin
  result := '';
  if tp=0 then
  begin
    DM.Tmp.Close;
    DM.Tmp.SQL.Text:='select SEED_VALUE  from data0004  where rkey =63';
    DM.Tmp.Open;
    result :=DM.Tmp.Fields[0].AsString;
  end else begin
    sL:='0';
    s:=sNo;
    for i:=length(s) downto 1 do
      if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;

    B:=true;
    while B do
    begin
      DM.Tmp.Close;
      DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                       'where rkey=63 and SEED_VALUE='''+sNo+'''';
      if DM.Tmp.ExecSQL=0 then
      begin
        DM.Tmp.Close;
        DM.Tmp.SQL.Text:='select SEED_VALUE  from data0004  where rkey =63';
        DM.Tmp.Open;
        sNo:=DM.Tmp.Fields[0].AsString;
      end else
        B:=false;
    end;
    result :=sNo ;
  end;

end;

procedure TDM.Get_ServerDatetime(var valDateTime, valDate, valdt: string;
  var valymd: tdatetime);
begin
  dm.Tmp.Close ;
  Tmp.SQL.Text:='select getdate() as vdt,DATENAME(yyyy, getdate()) as vy,DATENAME(mm, getdate()) as vm,DATENAME(dd, getdate()) as vd';
  Tmp.Open ;
  valymd := dm.Tmp.fieldbyname('vdt').AsDateTime ;
  valDateTime := datetimetostr(dm.Tmp.fieldbyname('vdt').asdatetime);
  valDate := datetostr(dm.Tmp.fieldbyname('vdt').asdatetime);
  valdt := copy(dm.Tmp.fieldbyname('vy').AsString,3,2);
  valdt := valdt + copy('00',1,2 - length(trim(dm.Tmp.fieldbyname('vm').AsString))) + dm.Tmp.fieldbyname('vm').AsString;
  valdt := valdt + copy('00',1,2 - length(trim(dm.Tmp.fieldbyname('vd').AsString))) + dm.Tmp.fieldbyname('vd').AsString;
  dm.Tmp.Close ;
end;

procedure TDM.ADO219_1AfterScroll(DataSet: TDataSet);
begin
  ADO220_1.close;
  ADO220_1.Parameters[0].Value:=ADO219_1RKEY.Value;
  ADO220_1.Open;
end;

procedure TDM.ADO219_2AfterScroll(DataSet: TDataSet);
begin
  ADO220_2.close;
  ADO220_2.Parameters[0].Value:=ADO219_2RKEY.Value;
  ADO220_2.Open;
end;

procedure TDM.ADO219_1location_codeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var tmpAdo:TADOQuery;
begin
  try
    tmpAdo:=TADOQuery.Create(Self);
    tmpAdo.Connection:=ADOCon;
    tmpAdo.Close;
    tmpAdo.SQL.Clear;
    tmpAdo.SQL.Add('select * from dbo.data0160 where LOCATION_CODE=:LOCATION_CODE');
    tmpAdo.Parameters.ParamByName('LOCATION_CODE').Value:=Sender.AsString;
    tmpAdo.Open;
    if (tmpAdo.RecordCount>0) then
    begin
      Text:=tmpAdo.FieldByName('LOCATION_NAME').AsString;
    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
  end;
end;

procedure TDM.ADO220_1location_codeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var tmpAdo:TADOQuery;
begin
  try
    tmpAdo:=TADOQuery.Create(Self);
    tmpAdo.Connection:=ADOCon;
    tmpAdo.Close;
    tmpAdo.SQL.Clear;
    tmpAdo.SQL.Add('select * from dbo.data0160 where LOCATION_CODE=:LOCATION_CODE');
    tmpAdo.Parameters.ParamByName('LOCATION_CODE').Value:=Sender.AsString;
    tmpAdo.Open;
    if (tmpAdo.RecordCount>0) then
    begin
      Text:=tmpAdo.FieldByName('LOCATION_NAME').AsString;
    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
  end;
end;

end.
