unit PpCutting5_unt;

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
  TPpCutting5_frm = class(TSingleDataSet_f)
    cdsMainINV_PART_NUMBER: TStringField;
    cdsMainINV_NAME: TStringField;
    cdsMainINV_DESCRIPTION: TStringField;
    cdsMainUNIT_CODE: TStringField;
    cdsMainSUPPLIER2: TStringField;
    cdsMainBARCODE_ID: TStringField;
    cdsMainABBR_NAME: TStringField;
    cdsMainGRN_NUMBER: TStringField;
    cdsMainDELIVER_NUMBER: TStringField;
    cdsMainrkey733: TIntegerField;
    cdsMainrkey730: TIntegerField;
    cdsMainpp_quota_len: TBCDField;
    cdsMainpp_quota_roll: TBCDField;
    cdsMainIES_PARAMETER_VALUE3: TStringField;
  private
    procedure RightsSetDataSetReadOnly;  override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PpCutting5_frm: TPpCutting5_frm;

implementation

{$R *.dfm}

procedure TPpCutting5_frm.RightsSetDataSetReadOnly;
begin
  begin
    cdsMain.ReadOnly:=True;
    DghMain.ReadOnly:=True;
  end;
end;

end.
