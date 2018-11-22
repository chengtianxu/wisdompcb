program CKBQ;

uses
  Forms,
  WZ_gUnit,
  Dialogs,
  MainFrm in 'MainFrm.pas' {frmMain},
  TagReadFrm in 'TagReadFrm.pas' {frmTagRead},
  DM in 'DM.pas' {dm1: TDataModule},
  TagCompareFrm in 'TagCompareFrm.pas' {frmBarComp},
  PrintFrm in 'PrintFrm.pas' {frmPrint},
  CmpHisFrm in 'CmpHisFrm.pas' {frmCmpHis},
  InOutFrm in 'InOutFrm.pas' {frmInOut},
  InOutHisFrm in 'InOutHisFrm.pas' {frmInOutHis},
  ResetPlaceFrm in 'ResetPlaceFrm.pas' {frmResetPlace},
  CmpFrmNew in 'CmpFrmNew.pas' {frmCmpNew},
  TagInfo in 'TagInfo.pas' {frmTagInfo},
  InOutHisZhouQiSetFrm in 'InOutHisZhouQiSetFrm.pas' {frmZhouQiSet};

//{$DEFINE DEBUGMODE}

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '仓库华为标签';
  Application.CreateForm(Tdm1, dm1);
  {$IFDEF DEBUGMODE}
  FillDebugUser(gUser);
  dm1.con1.Close;
  dm1.con1.LoginPrompt := False;
  dm1.con1.ConnectionString := gUser.DBConnectString;
  dm1.con1.Open();
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.Caption := '仓库华为标签' + ' ' + gUser.DBName;
  {$ELSE}
  case App_Init(dm1.con1,gUser) of
    0: ShowMessage('程序启动失败，请联系管理员！');
    1:
    begin
      Application.CreateForm(TfrmMain, frmMain);
      frmMain.Caption := '仓库华为标签' + ' ' + gUser.DBName;
    end;
    2: ShowMessage('同一数据库中只能启动一起！');
  else
  end;
  {$ENDIF}
  Application.Run;
end.
