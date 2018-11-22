unit UPub;

interface
uses
  windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DBCtrls,
  VCLCom, StdVcl, DBClient, Grids, DBGrids, ExtCtrls, ComCtrls, Menus, dbtables, DBCtrlsEh,
  DB, ADODB, Provider, variants, winsock, Midas, ComConst, MyClass, Pick_Item_Single, ConstVar,
  OleServer, Excel2000, StdCtrls, ComObj, DBGridEh, JPEG, DateUtils, math, WinProcs, IdFTP, IdFTPCommon;


   function GetOne(FN,ssql:string):Variant;
   function OpenQry(ssql:string):string;

   
implementation
          uses  UDM;
 
function GetOne(FN,ssql:string):Variant;
begin

 result:='';
 try
  with dm.qrytemp do

  begin
   close;
   sql.clear;
   sql.text:=ssql;
   Open;
  end;
  if not DM.qrytemp.IsEmpty  then
  Result:=DM.qrytemp.fieldbyname(fn).Value;
  except on e: exception do
  begin
   ShowMessage('³ö´í£º'+e.Message);
  exit;
  end;
  end;

end;


function OpenQry(ssql:string):string;
var
  Errstr:string;
begin
 try
   result:='';
   with dm.qrytemp do
   begin
   close;
   sql.Clear;
   sql.Add(ssql) ;
   open;
   end;
  except on e:exception do
  begin
   Errstr:='´íÎó£º'+e.Message;
   ShowMessage(Errstr);
   //exit;
  end;
 end;
 result:=Errstr;
end;

function execsql(ssql:string):string;
var
  Errstr:string;
begin
 try
   result:='';
   with dm.qrytemp do
   begin
   close;
   sql.Clear;
   sql.Add(ssql) ;
   execsql;
   end;
  except on e:exception do
  begin
   Errstr:='´íÎó£º'+e.Message;
   ShowMessage(Errstr);
   //exit;
  end;
 end;
 result:=Errstr;
end;




end.
