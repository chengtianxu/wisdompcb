unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    con1: TADOConnection;
    qry_temp: TADOQuery;
    qry_temp2: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
   PFLag: integer;  //±à¼­×´Ì¬£»
   PBNo : string ;
  procedure OpenQry(qry:TADOquery;ssql:string);
  procedure execsql(qry:TADOquery;ssql:string);
  function GetOne(FN,ssql:string;qry:TADOquery):Variant;


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
  if not qry_temp.IsEmpty  then
  Result:=qry_temp.fieldbyname(fn).Value;
end;


end.
