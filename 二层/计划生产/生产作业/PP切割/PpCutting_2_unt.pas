unit PpCutting_2_unt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SingleDataSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, dxSkinscxPCPainter, //cxPCdxBarPopupMenu,
  dxSkinsdxBarPainter, Menus, ppEndUsr, ppBands, ppPrnabl, ppClass,
  ppCtrls, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, DB,
  DBClient, cds, Provider, ADODB, dxBar, cxClasses, ImgList, ActnList,
  Grids, DBGridEh, ToolWin, ComCtrls, cxPC, StdCtrls, RzPanel, ExtCtrls,
  dxStatusBar;

type
  TPpCutting_2_frm = class(TSingleDataSet_f)
    cdsMainCDSDesigner: TStringField;
    cdsMainCDSDesigner2: TStringField;
    cdsMainCDSDesigner3: TStringField;
    cdsMainpanel: TBCDField;
    cdsMainpanel2: TBCDField;
    cdsMainCDSDesigner4: TIntegerField;
    cdsMainPP: TIntegerField;
    cdsMainPP2: TBCDField;
    cdsMainPP3: TBCDField;
    cdsMainCDSDesigner5: TWideStringField;
  private
    procedure RightsSetDataSetReadOnly;  override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PpCutting_2_frm: TPpCutting_2_frm;

implementation

{$R *.dfm}

procedure TPpCutting_2_frm.RightsSetDataSetReadOnly;
begin
  begin
    cdsMain.ReadOnly:=True;
    DghMain.ReadOnly:=True;
  end;
end;

end.
