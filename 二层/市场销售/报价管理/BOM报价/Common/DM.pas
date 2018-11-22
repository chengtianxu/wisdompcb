unit DM;

interface

uses
  SysUtils, Classes, Provider, DB, ADODB, Datasnap.DBClient;

type
  Tdm1 = class(TDataModule)
    con1: TADOConnection;
    cdsLookup278: TClientDataSet;
    atncfldLookup278rkey: TAutoIncField;
    strngfldLookup278PARAMETER_NAME: TStringField;
    strngfldLookup278PARAMETER_DESC: TStringField;
    strngfldLookup278datatype: TStringField;
    strngfldLookup278CATEGORY: TStringField;
    strngfldLookup278UNIT_CODE: TStringField;
    cdslookup34: TClientDataSet;
    atncfldcdslookup34RKEY: TAutoIncField;
    strngfldcdslookup34DEPT_CODE: TStringField;
    strngfldcdslookup34DEPT_NAME: TStringField;
    cdslookup496: TClientDataSet;
    atncfldcdslookup496rkey: TAutoIncField;
    strngfldcdslookup496GROUP_NAME: TStringField;
    strngfldcdslookup496GROUP_DESC: TStringField;
    strngfldcdslookup496SPEC_RKEY: TStringField;
    qrytmp: TADOQuery;
    spAfterSave: TADOStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetLookUpData;
    function GetSvrNowTime: TDateTime;
    function GetServerRegion(ACon: TADOConnection): string;
  end;

var
  dm1: Tdm1;

implementation

{$R *.dfm}


function Tdm1.GetServerRegion(ACon: TADOConnection): string;
  function GetServerIP: string;
  var
    I: Integer;
    tmpS: string;
  begin
    tmpS := ACon.ConnectionString;
    for I := Pos(string('Data Source='),string(ACon.ConnectionString)) to Length(ACon.ConnectionString) do
    begin
      if ACon.ConnectionString[I] = ';' then Break;
      tmpS := tmpS + ACon.ConnectionString[I];
      if ACon.ConnectionString[I] = '=' then tmpS := '';
    end;
    Result := tmpS;
  end;
var
  LServrIP: string;
  PosIndex: Integer;
  I: Integer;
  IPSec2: string;
begin
  LServrIP := GetServerIP;
  PosIndex := 0;
  for I := 1 to Length(LServrIP) do
  begin
    if LServrIP[I] = '.' then
    begin
      Inc(PosIndex);
      Continue;
    end;
    if PosIndex = 1 then
    begin
      IPSec2 := IPSec2 + LServrIP[I];
    end;
  end;
  case StrToIntdef(IPSec2,-1) of
    16:
    begin
      Result := '深圳';
    end;
    17:
    begin
      Result := '梅州';
    end;
    18:
    begin
      Result := '东莞';
    end;
  else
    Result := '未知'
  end;
end;

procedure Tdm1.GetLookUpData;
var
  lads: TADODataSet;
  ldsp: TDataSetProvider;
begin
  lads := TADODataSet.Create(Self);
  ldsp := TDataSetProvider.Create(Self);
  try
    lads.Connection := con1;
    ldsp.DataSet := lads;
    //278
    lads.Close;
    lads.CommandText := 'SELECT d278.rkey,d278.PARAMETER_NAME,d278.PARAMETER_DESC,case d278.DATA_TYPE when 1 then ''数字'' when 2 then ''字符'' end as datatype, ' +
                        ' case d278.CATEGORY_PTR when 2 then ''全局'' when 3 then ''制程'' end as CATEGORY, ' +
                        ' d02.UNIT_CODE ' +
                        ' FROM data0278 d278 inner join data0002 d02 on d02.RKEY = d278.UNIT_PTR';
    lads.Open;
    cdsLookup278.Data := ldsp.Data;

    //34
    lads.Close;
    lads.CommandText := 'select DEPT_CODE,DEPT_NAME,RKEY from data0034';
    lads.Open;
    cdslookup34.Data := ldsp.Data;

    //496
    lads.Close;
    lads.CommandText := 'SELECT GROUP_NAME,GROUP_DESC,RKEY,SPEC_RKEY FROM data0496';
    lads.Open;
    cdslookup496.Data := ldsp.Data;
  finally
    lads.Free;
    ldsp.Free;
  end;
end;


function Tdm1.GetSvrNowTime: TDateTime;
begin
  qrytmp.Close;
  qrytmp.SQL.Text := 'select getdate() as nowtime';
  qrytmp.Open;
  Result := qrytmp.FieldByName('nowtime').AsDateTime;
end;

end.
