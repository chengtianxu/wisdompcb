unit PP_Qty1_unt;

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
  TPP_Qty1_frm = class(TSingleDataSet_f)
    cdsMainEMPL_CODE: TStringField;
    cdsMainEMPLOYEE_NAME: TStringField;
    cdsMainMANU_PART_NUMBER: TStringField;
    cdsMainTYPE: TStringField;
    cdsMainrkey: TAutoIncField;
    cdsMainpanel_ln: TBCDField;
    cdsMainpanel_wd: TBCDField;
    cdsMainmanuf_qty: TIntegerField;
    cdsMainpanel_qty: TIntegerField;
    cdsMainpp_quota_len: TBCDField;
    cdsMainpp_quota_roll: TBCDField;
    cdsMainrkey733: TIntegerField;
  private
    procedure RightsSetDataSetReadOnly;  override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PP_Qty1_frm: TPP_Qty1_frm;

implementation

{$R *.dfm}

procedure TPP_Qty1_frm.RightsSetDataSetReadOnly;
begin
  begin
    cdsMain.ReadOnly:=True;
    DghMain.ReadOnly:=True;
  end;
end;

end.
