program A_EP075_cw;

uses
  Forms,
  WZ_gUnit,
  Dialogs,
  SysUtils,
  MainFrm in 'MainFrm.pas' {frmMain},
  DM in 'DM.pas' {dm1: TDataModule},
  gFilterFrm in 'gFilterFrm.pas' {frmFilter},
  NewFrm in 'NewFrm.pas' {frmNew},
  BMListFrm in 'BMListFrm.pas' {frmBMList},
  FSHReqFrm in 'FSHReqFrm.pas' {frmFSHReq1},
  QryWorkList in 'QryWorkList.pas' {frmWork},
  gBFUnit in 'gBFUnit.pas';

//{$DEFINE DEBUGMODE}

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '特殊报废';
  Application.CreateForm(Tdm1, dm1);
  Application.CreateForm(TfrmMain, frmMain);
  {$IFDEF DEBUGMODE}
  FillDebugUser(gUser);
  dm1.con1.Close;
  dm1.con1.LoginPrompt := False;
  dm1.con1.ConnectionString := gUser.DBConnectString;
  dm1.con1.Open();
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.Caption := '报废管理(财务部)' + ' ' + gUser.DBName;
  {$ELSE}
  case App_Init(dm1.con1,gUser) of
    0: ShowMessage('程序启动失败，请联系管理员！');
    1:
    begin
      Application.CreateForm(TfrmMain, frmMain);
      
      frmMain.Caption := '报废管理(财务部)' + ' ' + gUser.DBName;
    end;
    2: ShowMessage('同一数据库中只能启动一起！');
  else
  end;
  {$ENDIF}
  Application.Run;
end.
