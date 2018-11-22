unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    con: TADOConnection;
    qry_temp: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
   function OpenQry(qry:TADOquery;ssql:string):string;
   function  execsql(qry:TADOquery;ssql:string):string;
   function  GetOne(FN,ssql:string;qry:TADOquery):Variant;
   function Isnum(Astr:string):Boolean;
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

function TDM.Isnum(Astr: string): Boolean;
var
i:integer;
begin
 
  for i:=1 to length(Astr) do
  if not (Astr[i] in ['0'..'9']) then
  begin
  result:=false;
  exit;
  end; 
  result:=true; 

end;

end.
