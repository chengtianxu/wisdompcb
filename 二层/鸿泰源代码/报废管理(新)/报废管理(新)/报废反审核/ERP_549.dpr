program ERP_549;

uses
  Forms,
  Dialogs,
  gFilterFrm in 'gFilterFrm.pas' {frmFilter},
  MainFrm in 'MainFrm.pas' {frmMain},
  Pick_Item_Single in 'Pick_Item_Single.pas' {frmPick_Item_Single},
  WZ_gUnit in 'WZ_gUnit.pas',
  DM in 'DM.pas' {DM1: TDataModule},
  ViewInfoFrm in 'ViewInfoFrm.pas' {frmViewInfo},
  ReturnNoteFrm in 'ReturnNoteFrm.pas' {frmNoteRetrun},
  gBFUnit in '..\gUnit\gBFUnit.pas';

//{$DEFINE DEBUGMODE}
{$R *.res}

begin
  Application.Initialize;
  Application.Title := '报废反审核';
  Application.CreateForm(Tdm1, dm1);
  {$IFDEF DEBUGMODE}
  FillDebugUser(gUser);
  dm1.con1.Close;
  dm1.con1.LoginPrompt := False;
  dm1.con1.ConnectionString := gUser.DBConnectString;
  dm1.con1.Open();
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.Caption := '报废反审核' + ' ' + gUser.DBName;
  Application.CreateForm(TfrmFilter, frmFilter);  
  {$ELSE}
  case App_Init(dm1.con1,gUser) of
    0: ShowMessage('程序启动失败，请联系管理员！');
    1:
    begin
      Application.CreateForm(TfrmMain, frmMain);
      frmMain.Caption := '报废反审核' + ' ' + gUser.DBName;
      Application.CreateForm(TfrmFilter, frmFilter);
    end;
    2: ShowMessage('同一数据库中只能启动一起！');
  else
  end;
  {$ENDIF}
  Application.Run;
end.
