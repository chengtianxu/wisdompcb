unit DM;

interface

uses
  SysUtils, Classes, DB, ADODB,WZ_gUnit;

type
  Tdm1 = class(TDataModule)
    con1: TADOConnection;
    qrytmp: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function SqlOpen(AStr: string): Boolean;
    function GetServerDatetime(): TDateTime;
    function IS_Stock_Inventorying: boolean;
    function GetServerRegion: string;
  end;


var
  dm1: Tdm1;

implementation

{$R *.dfm}


function TDM1.GetServerRegion: string;
  function GetServerIP: string;
  var
    I: Integer;
    tmpS: string;
  begin
    tmpS := gUser.DBConnectString;
    for I := pos('Data Source=',gUser.DBConnectString) to Length(gUser.DBConnectString) do
    begin
      if gUser.DBConnectString[I] = ';' then Break;
      tmpS := tmpS + gUser.DBConnectString[I];
      if gUser.DBConnectString[I] = '=' then tmpS := '';
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
    168,18:
    begin
      Result := '东莞';
    end;
  else
    Result := '未知'
  end;
end;

function Tdm1.GetServerDatetime: TDateTime;
begin
  if SqlOpen('select getdate() as DTime') then
  begin
    Result := qrytmp.fieldbyname('DTime').AsDateTime;
  end else
    Result := 0;
end;

function Tdm1.SqlOpen(AStr: string): Boolean;
begin
//  Result := False;
  qrytmp.Close;
  qrytmp.SQL.Clear;
  qrytmp.SQL.Add(AStr);
  qrytmp.Open;
  Result := True;
end;

function Tdm1.IS_Stock_Inventorying: boolean; //判断在制品是否在盘点
begin                                   //在盘点返回为TRUE,无盘点返回为FALSE
  if SqlOpen('select * from data0400 where status=0') then
  begin
    Result := not qrytmp.IsEmpty;
  end else
    Result := True;
end;

end.

