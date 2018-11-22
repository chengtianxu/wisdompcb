program WZPCBCut;

uses
  Forms,
  Calc in '..\Common\Calc.pas',
  CalcHelper in '..\Common\CalcHelper.pas',
  CalcParam in '..\Common\CalcParam.pas',
  MainFrm in '..\Common\MainFrm.pas' {frmMain1},
  ProgressFrm in '..\Common\ProgressFrm.pas' {frmProgress},
  IRetIntf in '..\Common\IRetIntf.pas',
  SheetAddFrm in '..\Common\SheetAddFrm.pas' {frmAddSheet},
  SheetListFrm in '..\Common\SheetListFrm.pas' {frmSheetList},
  Adapter in '..\common\Adapter.pas',
  DrawEngine_2 in '..\Common\DrawEngine_2.pas',
  ZKCalc in '..\Common\ZKCalc.pas',
  OptionFrm in '..\Common\OptionFrm.pas' {frmOption},
  Manu_Cut in '..\Common\Manu_Cut.pas' {frmManuCut};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain1, frmMain1);
  Application.CreateForm(TfrmSheetList, frmSheetList);
  Application.Run;
end.
