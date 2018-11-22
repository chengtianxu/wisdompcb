unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    con1: TADOConnection;
    qry_temp: TADOQuery;
    qry1: TADOQuery;
    blnfldqry1IsSelected: TBooleanField;
    atncfldqry1rkey: TAutoIncField;
    strngfldqry1dept_code: TStringField;
    strngfldqry1dept_name: TStringField;
  private
    { Private declarations }

  public
    { Public declarations }
    EditOrAdd: integer;
    Mrkey: integer;
    function  execsql(qry:TADOquery;ssql:string):string;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

function Tdm.execsql(qry:TADOquery;ssql:string):string;
begin

   with qry do
   begin
   close;
   sql.Clear;
   sql.Add(ssql) ;
   execsql;
   end;
end;

end.
