unit DM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm1 = class(TDataModule)
    con1: TADOConnection;
    qrytmp: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function GetSvrTime: TDateTime;
    function DatetimeToStr(ADt: TDateTime): string;
    function GetuserName05(ARkey: Integer): string;
  end;

var                                     
  dm1: Tdm1;

implementation

{$R *.dfm}

{ Tdm1 }

function Tdm1.DatetimeToStr(ADt: TDateTime): string;
begin
  Result := FormatDateTime('yyyy-MM-dd hh:mm:ss',ADt);
end;

function Tdm1.GetSvrTime: TDateTime;
begin
  qrytmp.close;
  qrytmp.SQL.Text := 'select getdate() as nowtime';
  qrytmp.Open;
  Result := qrytmp.fieldByName('nowtime').AsDateTime;
end;

function Tdm1.GetuserName05(ARkey: Integer): string;
begin
  qrytmp.close;
  qrytmp.SQL.Text := 'select EMPLOYEE_NAME from data0005 where rkey = '  + IntToStr(ARkey);
  qrytmp.Open;
  Result := qrytmp.fieldByName('EMPLOYEE_NAME').AsString;
end;

end.
