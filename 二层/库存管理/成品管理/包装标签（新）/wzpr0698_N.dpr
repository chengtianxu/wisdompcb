program wzpr0698_N;

{$R 'CallerResource.res' 'CallerResource.rc'}

uses
  Forms,
  Dialogs,
  DM in 'DM.pas' {DM1: TDataModule},
  gFilterFrm in 'gFilterFrm.pas' {frmFilter},
  MainFrm in 'MainFrm.pas' {frmMain},
  Pick_Item_Single in 'Pick_Item_Single.pas' {frmPick_Item_Single},
  WZ_gUnit in 'WZ_gUnit.pas',
  searchso in 'searchso.pas' {searchso_Form},
  BaseFrm in 'ReportFrm\BaseFrm.pas' {frmBase},
  HW1806Frm in 'ReportFrm\HW1806Frm.pas' {frm1806},
  PrintUnit in 'PrintUnit.pas',
  HWZD1915Frm in 'ReportFrm\HWZD1915Frm.pas' {frmHWZD1915},
  ZXKX2303Frm in 'ReportFrm\ZXKX2303Frm.pas' {frmZXKX2303},
  HS2258Frm in 'ReportFrm\HS2258Frm.pas' {frmHS2258},
  MRMT2104Frm in 'ReportFrm\MRMT2104Frm.pas' {frmMRMT2104},
  CLS1901Frm in 'ReportFrm\CLS1901Frm.pas' {frmCLS1901},
  DaHua2390Frm in 'ReportFrm\DaHua2390Frm.pas' {frmDaHua2390},
  HighPermitFrm in 'HighPermitFrm.pas' {frmHighPermit},
  MD5 in 'MD5.pas',
  FrmJump in 'FrmJump.pas' {frmJmp},
  DYH7100Frm in 'ReportFrm\DYH7100Frm.pas' {frmDYH7100},
  HQ6095Frm in 'ReportFrm\HQ6095Frm.pas' {frmHQ6095},
  TCL6298Frm in 'ReportFrm\TCL6298Frm.pas' {frmTCL6298},
  WT6259Frm in 'ReportFrm\WT6259Frm.pas' {frmWT6259},
  JC6378Frm in 'ReportFrm\JC6378Frm.pas' {frm6378},
  YYD7340Frm in 'ReportFrm\YYD7340Frm.pas' {frmYYD7340},
  BaseReportFrm in 'ReportFrm\BaseReportFrm.pas' {frmBaseReportFrm},
  HS7325Frm in 'ReportFrm\HS7325Frm.pas' {frmHS7325},
  DEll7364Frm in 'ReportFrm\DELL7364Frm.pas' {frmDell7364},
  CreateOutTag in 'ReportFrm\CreateOutTag.pas' {frmCreateOutTag};

//{$DEFINE DEBUGMODE}

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '新包装标签打印';
  Application.CreateForm(Tdm1, dm1);
  {$IFDEF DEBUGMODE}
  FillDebugUser(gUser);
  dm1.con1.Close;
  dm1.con1.LoginPrompt := False;
  dm1.con1.ConnectionString := gUser.DBConnectString;
  dm1.con1.Open();
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.Caption := '新包装标签打印' + ' ' + gUser.DBName;
  Application.CreateForm(TfrmFilter, frmFilter);  
  {$ELSE}
  case App_Init(dm1.con1,gUser) of
    0: ShowMessage('程序启动失败，请联系管理员！');
    1:
    begin
      Application.CreateForm(TfrmMain, frmMain);
      frmMain.Caption := '新包装标签打印' + ' ' + gUser.DBName;
      Application.CreateForm(TfrmFilter, frmFilter);
    end;
    2: ShowMessage('同一数据库中只能启动一起！');
  else
  end;
  {$ENDIF}
  Application.Run;
end.
