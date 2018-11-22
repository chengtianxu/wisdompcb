program LOT_MRBCheck;

uses
  Forms,
  WZ_gUnit,
  Dialogs,
  DM in 'DM.pas' {DM1: TDataModule},
  BFMgr in 'BFMgr.pas',
  DeptFrm in 'DeptFrm.pas' {frmDeptList},
  FanGongFrm in 'FanGongFrm.pas' {frmFG1},
  HeBingGongDan in 'HeBingGongDan.pas',
  FilterFrm in 'FilterFrm.pas' {frmFilter},
  MainFrm in 'MainFrm.pas' {frmMain},
  gBFUnit in '..\报废管理(新)\gUnit\gBFUnit.pas',
  NewFrm in '..\报废管理(新)\报废输入\NewFrm.pas' {frmNew},
  BMListFrm in '..\报废管理(新)\报废输入\BMListFrm.pas' {frmBMList};

{$R *.res}

//{$DEFINE DEBUGMODE}
begin
  Application.Initialize;
  Application.Title := 'LOT_MRB鉴定';
  Application.CreateForm(Tdm1, dm1);
  {$IFDEF DEBUGMODE}
  FillDebugUser(gUser);
  dm1.con1.Close;
  dm1.con1.LoginPrompt := False;
  dm1.con1.ConnectionString := gUser.DBConnectString;
  dm1.con1.Open();
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.Caption := 'LOT_MRB鉴定' + ' ' + gUser.DBName;
  Application.CreateForm(TfrmDeptList, frmDeptList);
  Application.CreateForm(TfrmFG1, frmFG1);
  Application.CreateForm(TfrmFilter, frmFilter);
  {$ELSE}
  case App_Init(dm1.con1,gUser) of
    0: ShowMessage('程序启动失败，请联系管理员！');
    1:
    begin
      Application.CreateForm(TfrmMain, frmMain);
      frmMain.Caption := 'LOT_MRB鉴定' + ' ' + gUser.DBName;
      Application.CreateForm(TfrmDeptList, frmDeptList);
      Application.CreateForm(TfrmFG1, frmFG1);
      Application.CreateForm(TfrmFilter, frmFilter);    
    end;
    2: ShowMessage('同一数据库中只能启动一起！');
  else
  end;
  {$ENDIF}
  Application.Run;
end.

