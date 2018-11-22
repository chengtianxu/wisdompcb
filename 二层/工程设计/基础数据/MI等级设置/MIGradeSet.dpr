program MIGradeSet;

uses
  Forms,
  WZ_gUnit,
  Dialogs,
  MainFrm in 'MainFrm.pas' {frmMain},
  DMFrm in 'DMFrm.pas' {DM1: TDataModule},
  EditFrm in 'EditFrm.pas' {frmEdit},
  DeptAddFrm in 'DeptAddFrm.pas' {frmAddDept},
  ParamAddFrm in 'ParamAddFrm.pas' {frmParamAdd};

{$R *.res}

//{$DEFINE DEBUGMODE}

begin
  Application.Initialize;
  Application.Title := 'MI等级设置';
  Application.CreateForm(Tdm1, dm1);
  {$IFDEF DEBUGMODE}
  FillDebugUser(gUser);
  dm1.con1.Close;
  dm1.con1.LoginPrompt := False;
  dm1.con1.ConnectionString := gUser.DBConnectString;
  dm1.con1.Open();
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.Caption := 'MI等级设置' + ' ' + gUser.DBName;
  {$ELSE}
  case App_Init(dm1.con1,gUser) of
    0: ShowMessage('程序启动失败，请联系管理员！');
    1:
    begin
      Application.CreateForm(TfrmMain, frmMain);
      frmMain.Caption := 'MI等级设置' + ' ' + gUser.DBName;
    end;
    2: ShowMessage('同一数据库中只能启动一起！');
  else
  end;
  {$ENDIF}
  Application.Run;
end.
