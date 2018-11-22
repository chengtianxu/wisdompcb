unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    con1: TADOConnection;
    qry_temp: TADOQuery;
    qry_Class: TADOQuery;
    qry_LClass: TADOQuery;
    qry_holiday: TADOQuery;
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

{$R *.dfm}

end.
