unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    qry_temp: TADOQuery;
    con1: TADOConnection;
    qry_temp2: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function OpenQry(qry:TADOquery;ssql:string):string;
   function  execsql(qry:TADOquery;ssql:string):string;
   function  GetOne(FN,ssql:string;qry:TADOquery):Variant;
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
   //close;
   sql.Clear;
   sql.Add(ssql) ;
   execsql;
   end;

end;

function Tdm.GetOne(FN,ssql:string;qry:TADOquery):Variant;
begin

 result:='';

  with qry do
  begin
   close;
   sql.clear;
   sql.text:=ssql;
   Open;
  end;
  if not qry.IsEmpty  then
  Result:=qry.fieldbyname(fn).Value;
end;


end.
