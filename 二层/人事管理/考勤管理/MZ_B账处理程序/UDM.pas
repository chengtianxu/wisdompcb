unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    qrytemp: TADOQuery;
    con1: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenQry(qry:TADOquery;ssql:string);
    procedure execsql(qry:TADOquery;ssql:string);
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure Tdm.OpenQry(qry:TADOquery;ssql:string);
begin
   with qry do
   begin
   close;
   sql.Clear;
   sql.Add(ssql) ;
   open;
   end;
end;

procedure Tdm.execsql(qry:TADOquery;ssql:string);
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
