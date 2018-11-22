unit Report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DM, common, DB, ADODB, ppDB, ppDBPipe, ppEndUsr, ppComm,
  ppRelatv, ppProd, ppClass, ppReport, ppBands, ppCache, ppCtrls, ppPrnabl;

type
  TFrmRep = class(TForm)
    prprt1: TppReport;
    pdsgnr1: TppDesigner;
    pdbpln2: TppDBPipeline;
    ds1: TDataSource;
    qry1: TADOQuery;
    phdrbnd1: TppHeaderBand;
    pdtlbnd1: TppDetailBand;
    pftrbnd1: TppFooterBand;
    wdstrngfldqry1DSDesigner: TWideStringField;
    fltfldqry1DSDesigner2: TFloatField;
    fltfldqry1DSDesigner3: TFloatField;
    fltfldqry1DSDesigner4: TFloatField;
    fltfldqry1DSDesigner5: TFloatField;
    fltfldqry1DSDesigner6: TFloatField;
    fltfldqry1WIP: TFloatField;
    fltfldqry1DSDesigner7: TFloatField;
    fltfldqry1DSDesigner8: TFloatField;
    fltfldqry1DSDesigner9: TFloatField;
    fltfldqry1DSDesigner10: TFloatField;
    fltfldqry1DSDesigner11: TFloatField;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRep: TFrmRep;

implementation

{$R *.dfm}

end.
