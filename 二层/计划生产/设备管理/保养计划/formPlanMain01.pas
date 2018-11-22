unit formPlanMain01;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SingleDataSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  ppEndUsr, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, DB, DBClient, cds, Provider, ADODB,
  dxBar, cxClasses, ImgList, ActnList, Grids, DBGridEh, ToolWin, ComCtrls,
  cxPC, StdCtrls, RzPanel, ExtCtrls, dxStatusBar, Menus;

type
  TfrmPlanMain01 = class(TSingleDataSet_f)
    cdsMainFASSET_NAME: TStringField;
    cdsMainMainExecStat: TStringField;
    cdsMainUser_Full_Name: TStringField;
    cdsMainImpact: TStringField;
    cdsMainDEPT_NAME: TStringField;
    cdsMainABBR_NAME: TStringField;
    cdsMainequipment_grade: TStringField;
    cdsMainLOCATION: TStringField;
    cdsMainrkey: TAutoIncField;
    cdsMainPlanMainDate: TDateTimeField;
    cdsMainDeviNumb: TStringField;
    cdsMainDeviType: TStringField;
    cdsMainMainCycl: TStringField;
    cdsMainRKEY832: TIntegerField;
    cdsMainStarMainTime: TDateTimeField;
    cdsMainActuCompTime: TDateTimeField;
    cdsMainMainImpl: TWideStringField;
    cdsMainRemarks: TStringField;
    cdsMainTimeCons: TBCDField;
    cdsMainMainAcce_UserPtr: TIntegerField;
    cdsMainStdTimeCons: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPlanMain01: TfrmPlanMain01;

implementation

{$R *.dfm}

end.
