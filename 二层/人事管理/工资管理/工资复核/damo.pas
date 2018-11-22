unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1checkdate: TDateTimeField;
    ADOQuery1checkyearmonth: TWideStringField;
    ADOQuery1ischeck: TIntegerField;
    ADOQuery1checkman: TIntegerField;
    ADOQuery1status: TIntegerField;
    ADOQuery1checkdesc: TWideStringField;
    ADOQuery1actived: TIntegerField;
    ADOQuery1S_checkman: TStringField;
    ADOQuery1S_ischeck: TStringField;
    ADOQuery1S_actived: TStringField;
    ADOTMP: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }

    function OpenQry(qry:TADOquery;ssql:string):string;
    function execsql(qry:TADOquery;ssql:string):string;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}
function Tdm.OpenQry(qry:TADOquery;ssql:string):string;
begin
   with qry do
   begin
   close;
   sql.Clear;
   sql.Add(ssql) ;
   open;
   end;
end;

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
