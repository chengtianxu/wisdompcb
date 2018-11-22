unit UDM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh,
  DB, ADODB;

type
  TDM = class(TDataModule)
    con1: TADOConnection;
    qry_temp: TADOQuery;
    qry_temp2: TADOQuery;
    qry_Main: TADOQuery;
    ds: TDataSource;
    procedure qry_MainAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
      program_rkey: integer;
      check_flag: integer;
     change_flag: integer;
    

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


procedure TDM.qry_MainAfterScroll(DataSet: TDataSet);
begin
  if not dm.qry_Main.Eof then
  begin
    check_flag:=DataSet.FieldValues['…Û∫À'];
    change_flag:=dataset.FieldValues['±‰÷µÀ¯∂®'];
  end;
end;

end.
