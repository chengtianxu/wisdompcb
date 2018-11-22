unit UPrtBCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppBands, ppCtrls, ppBarCod, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppEndUsr;

type
  TfrmPrtBCode = class(TForm)
    pdbprtempcode: TppDBPipeline;
    dsDS1: TDataSource;
    qryEmpCode: TADOQuery;
    prprt1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDesigner1: TppDesigner;
    wdstrngfldEmpCodeemployeecode: TWideStringField;
    pdbrcd1: TppDBBarCode;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrtBCode: TfrmPrtBCode;

implementation
    uses udm;
{$R *.dfm}

end.
