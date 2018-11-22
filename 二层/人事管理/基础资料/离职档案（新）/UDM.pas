unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    con1: TADOConnection;
    qrytemp: TADOQuery;
    qry_updateDep: TADOQuery;
    qry_tmp: TADOQuery;
    qry_tmp2: TADOQuery;
    qry_tmp1: TADOQuery;
    qry_altSave: TADOQuery;
    qry_Empmsg: TADOQuery;
    qry_Empmsgrkey: TIntegerField;
    qry_Empmsgemployeecode: TWideStringField;
    qry_Empmsgchinesename: TWideStringField;
    qry_Empmsgdepartmentname: TWideStringField;
    qry_Empmsgstatus: TWordField;
    qry_Empmsgrankname: TWideStringField;
    qry_Empmsgrank: TIntegerField;
    qry_Empmsgsexy: TStringField;
    qry_Empmsgwagetype: TIntegerField;
    qry_Empmsgondutytime: TDateTimeField;
    qry_Empmsgoutdutytime: TDateTimeField;
    qry_Empmsgprovince: TWideStringField;
    qry_EmpmsgIDCard: TWideStringField;
    qry_Empmsgdepartmentid: TIntegerField;
    qry_Empmsgpposition: TWideStringField;
    qry_Empmsgemploy_type: TWideStringField;
    qry_Empmsgdepartmentname_1: TWideStringField;
    qry_Empmsgposition: TIntegerField;
    qry_Empmsgemploy_type_rkey: TIntegerField;
    qry_Empmsgold_reason: TIntegerField;
    qry_Empmsgoold_reason: TWideStringField;
    ds_msg: TDataSource;
    qry_detail: TADOQuery;
    ds_detail: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pg_index: integer;
    data05_rkey: string;

    AUTag: Integer;
    FZTime: TDateTime;
    program_rkey: integer;
    Selsql:string;

    function OpenQry(qry:TADOquery;ssql:string):string;
    function execsql(qry:TADOquery;ssql:string):string;
    function GetOne(FN,ssql:string;qry:TADOquery):Variant;
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
  if not qrytemp.IsEmpty  then
  Result:=qrytemp.fieldbyname(fn).Value;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
 dm.Selsql:=dm.qry_Empmsg.sql.Text;

end;

end.
