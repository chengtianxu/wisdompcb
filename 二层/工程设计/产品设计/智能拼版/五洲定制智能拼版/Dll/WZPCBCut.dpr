library WZPCBCut;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }
uses
  Windows,
  GdiPlus in 'GdiPlus.pas',
  CalcHelper in '..\Common\CalcHelper.pas',
  CalcParam in '..\Common\CalcParam.pas',
  MainFrm in '..\Common\MainFrm.pas' {frmMain1},
  ProgressFrm in '..\Common\ProgressFrm.pas' {frmProgress},
  SheetAddFrm in '..\Common\SheetAddFrm.pas' {frmSheetAdd},
  Calc in '..\Common\Calc.pas',
  DrawEngine_2 in '..\Common\DrawEngine_2.pas',
  IRetIntf in '..\Common\IRetIntf.pas',
  Adapter in '..\Common\Adapter.pas';

procedure DLLEntryPoint(Reason: integer);
begin
  case Reason of
    DLL_PROCESS_ATTACH: ;//messagebox(0, '已经进入入口', 'DLL_PROCESS_ATTACH', 0);
    DLL_PROCESS_DETACH: ;//messagebox(0, '退出了DLL', 'DLL_PROCESS_DETACH', 0);
  end;
end;

exports
  ShowPCBCutFrm;

{$R *.res}
begin
   { 重定义入口指针 }
  DllProc := @DLLEntryPoint;
   { 载入入口状态，这个必须的 }
  DLLEntryPoint(DLL_PROCESS_ATTACH);
end.
