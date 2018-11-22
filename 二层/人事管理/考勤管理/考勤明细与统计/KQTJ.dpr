program KQTJ;

uses
  Forms,
  WZ_gUnit,
  Dialogs,
  MainFrm in 'MainFrm.pas' {frmMain},
  DMFrm in 'DMFrm.pas' {DM1: TDataModule},
  CalcUnit in 'CalcUnit.pas',
  ModiyFrm in 'ModiyFrm.pas' {frmModify},
  NatureCardFrm in 'NatureCardFrm.pas' {frmNatureCard},
  MutiAddCard in 'MutiAddCard.pas' {frmMutiAddCard},
  ReqView in 'ReqView.pas' {frmReqView},
  SumFrm in 'SumFrm.pas' {frmSum},
  IniPickMonthFrm in 'IniPickMonthFrm.pas' {frmIniPickMonth},
  PasCheck in 'PasCheck.pas' {frmCheck},
  gFilterFrm in 'gFilterFrm.pas' {frmFilter},
  OUTFrm in 'OUTFrm.pas' {frmOUT};

{$R *.res}

//{$DEFINE DEBUGMODE}

begin
  Application.Initialize;
  Application.Title := '考勤明细与统计';
  Application.CreateForm(TDM1, DM1);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmFilter, gFilterFrom);
  DM1.IniLookDB;       //20160421add
   //  FillDebugUser(gUser);
//    {$IFDEF DEBUGMODE}
//  FillDebugUser(gUser);
//  dm1.con1.Close;
//  dm1.con1.LoginPrompt := False;
//  dm1.con1.ConnectionString := gUser.DBConnectString;
//  dm1.con1.Open();
//
//  Application.CreateForm(TfrmMain, frmMain);
//  Application.CreateForm(TfrmFilter, gFilterFrom);
//  DM1.IniLookDB;
//  frmMain.Caption := '考勤明细与统计' + ' ' + gUser.DBName;
//  {$ELSE}
//  case App_Init(dm1.con1,gUser) of
//    0: ShowMessage('程序启动失败，请联系管理员！');
//    1:
//    begin
//      Application.CreateForm(TfrmMain, frmMain);
//      Application.CreateForm(TfrmFilter, gFilterFrom);
//      DM1.IniLookDB;
//      frmMain.Caption := '考勤明细与统计' + ' ' + gUser.DBName;
//    end;
//    2: ShowMessage('同一数据库中只能启动一起！');
//  else
//  end;
//  {$ENDIF}
  Application.Run;

end.
