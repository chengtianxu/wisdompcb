unit formWorkRecord01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SingleDataSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  ppEndUsr, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, DB, DBClient, cds, Provider, ADODB,
  dxBar, cxClasses, ImgList, ActnList, Grids, DBGridEh, ToolWin, ComCtrls,
  cxPC, StdCtrls, RzPanel, ExtCtrls, dxStatusBar,  Menus;

type
  TfrmWorkRecord01 = class(TSingleDataSet_f)
    cdsMainUSER_FULL_NAME: TStringField;
    cdsMainMainExecStat: TStringField;
    cdsMainRecord_date: TDateTimeField;
    cdsMainremark: TWideStringField;
  private
    { Private declarations }
  public
    procedure RightsSetDataSetReadOnly;  override;
    { Public declarations }
  end;

var
  frmWorkRecord01: TfrmWorkRecord01;

implementation

{$R *.dfm}

procedure TfrmWorkRecord01.RightsSetDataSetReadOnly;
begin
  begin
    cdsMain.ReadOnly:=True;
    DghMain.ReadOnly:=True;
  end;
end;

end.
