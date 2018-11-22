unit UDm;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    con1: TADOConnection;
    qry_temp: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure OpenQry(qry:TADOquery;ssql:string);
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

end.
