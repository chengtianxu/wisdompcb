program WZ_CardMgr;


{$R 'CallerResource.res' 'CallerResource.rc'}

uses
  Forms,
  Dialogs,
  MainFrm in 'MainFrm.pas' {frmMain},
  WZ_gUnit in 'WZ_gUnit.pas',
  DMFrm in 'DMFrm.pas' {DM1: TDataModule},
  Eastriver_API in 'Eastriver_API.pas',
  Eastriver_Helper in 'Eastriver_Helper.pas',
  DataMgr in 'DataMgr.pas';

{$R *.res}

//{$DEFINE DEBUGMODE}

begin
  Application.Initialize;
  Application.Title := '考勤卡采集';
  Application.CreateForm(TDM1, DM1);
  {$IFDEF DEBUGMODE}
  FillDebugUser(gUser);
  dm1.con1.Close;
  dm1.con1.LoginPrompt := False;
  dm1.con1.ConnectionString := gUser.DBConnectString;
  dm1.con1.Open();
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.Caption := '考勤卡采集' + ' ' + gUser.DBName;
  if frmMain.CheckOperatorLock then Exit;
  {$ELSE}
  case App_Init(dm1.con1,gUser) of
    0: ShowMessage('程序启动失败，请联系管理员！');
    1:
    begin
      Application.CreateForm(TfrmMain, frmMain);
      frmMain.Caption := '考勤卡采集' + ' ' + gUser.DBName;
      if frmMain.CheckOperatorLock then Exit;
    end;
    2: ShowMessage('同一数据库中只能启动一起！');
  else
  end;
//      Application.CreateForm(TfrmMain, frmMain);
//      frmMain.Caption := '考勤卡采集' + ' ' + gUser.DBName;
//      if frmMain.CheckOperatorLock then Exit;
  {$ENDIF}
  if LoadDll(DLL_NAME) then
    Application.Run
  else
    ShowMessage('加载接口动态库失败');
  FreeDll;
end.
