unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB, ppDB, ppDBPipe, ppBands, ppCtrls, Graphics,
  ppBarCod, jpeg, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, ppEndUsr;

type
  TDM = class(TDataModule)
    con1: TADOConnection;
    qry_temp: TADOQuery;
    qry_rpt: TADOQuery;
    qry_rptlocation: TWideStringField;
    ds_rpt: TDataSource;
    ppDesigner1: TppDesigner;
    pdbprt1: TppDBPipeline;
    ppRpt: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppimg1: TppImage;
    pplbl2: TppLabel;
    pplbl1: TppLabel;
    ppFooterBand2: TppFooterBand;
  private
    { Private declarations }
  public
    function OpenQry(qry:TADOquery;ssql:string):string;
    function  execsql(qry:TADOquery;ssql:string):string;
    function  GetOne(FN,ssql:string;qry:TADOquery):Variant;
    procedure Get2DCodeBmp(AText: string;APic: TPicture);
  end;

var
  DM: TDM;

implementation
          uses qrcode;
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

procedure TDM.Get2DCodeBmp(AText: string;APic: TPicture);
var
  LCode2d: TQRCodeGraphic;
  LbtMap: TGraphic;
begin
  LCode2d := TQRCodeGraphic.Create();
  try
    LCode2d.Margin := 3;
    LCode2d.BlockSize := 2;
//    LCode2d.Width:=8;
//    LCode2d.Height:=6;
    LCode2d.Text := AText;
    APic.Assign(LCode2d);
  finally
    LCode2d.Free;
  end;
end;

end.
