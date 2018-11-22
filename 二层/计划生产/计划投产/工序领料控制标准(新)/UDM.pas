unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    con1: TADOConnection;
    qry_temp: TADOQuery;
    qry_selProcess: TADOQuery;
    qry_SelMateriel: TADOQuery;
    qry_SelMan: TADOQuery;
    qry1: TADOQuery;
    blnfld_selProcessIsSelected: TBooleanField;
    atncfld_selProcessrkey: TAutoIncField;
    strngfld_selProcessdept_code: TStringField;
    strngfld_selProcessdept_name: TStringField;
    blnfld_SelMaterielIsSelected: TBooleanField;
    atncfld_SelMaterielrkey: TAutoIncField;
    strngfld_SelMaterielDSDesigner: TStringField;
    strngfld_SelMaterielDSDesigner2: TStringField;
    strngfld_SelMaterielDSDesigner3: TStringField;
   // qry_SelMan: TADOQuery;
    strngfld_SelMaterielDSDesigner5: TStringField;
    fltfld_SelMaterielDSDesigner6: TFloatField;
    fltfld_SelMaterielDSDesigner7: TFloatField;
    blnfld_SelManIsSelected: TBooleanField;
    atncfld_SelManrkey: TAutoIncField;
    strngfld_SelManuser_login_name: TStringField;
    strngfld_SelManuser_full_name: TStringField;
    qry_SelManDSDesigner: TStringField;
    qry_SelManDSDesigner2: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    EFlag: integer;//�༭״̬
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
