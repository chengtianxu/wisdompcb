program BOMBaoJiaDept;

uses
  Vcl.Forms,
  Vcl.Dialogs,
  WZ_gUnit,
  BOMBaoJiaDeptMainFrm in 'BOMBaoJiaDeptMainFrm.pas' {frmMainBOMBaoJiaDept},
  DM in '..\Common\DM.pas' {dm1: TDataModule},
  BOMBaoJiaDeptEditFrm in 'BOMBaoJiaDeptEditFrm.pas' {frmBOMBaoJiaDeptEdit},
  BOMBaoJiaDeptAddParamFrm in 'BOMBaoJiaDeptAddParamFrm.pas' {frmBOMBaoJiaDeptAddParam},
  BOMBaoJiaDeptEditAddMGroup in 'BOMBaoJiaDeptEditAddMGroup.pas' {frmBOMBaoJiaDeptEditMGroup},
  BOMBaoJia2Dtable in 'BOMBaoJia2Dtable.pas' {frmBOMBaoJiaEdit2Dtable},
  BOMBaoJiaAdd2DTableFrm in 'BOMBaoJiaAdd2DTableFrm.pas' {frmBOMBaoJiaAdd2dTable},
  BOMBaoJia2DTableEditFrm in 'BOMBaoJia2DTableEditFrm.pas' {frmBOMBaoJia2DTableEdit},
  BOMBaoJiaCommonCalcstrFrm in 'BOMBaoJiaCommonCalcstrFrm.pas' {frmBOMBaoJiaCommonCalcstr};

{$R *.res}

//{$DEFINE DEBUGMODE}

begin
  Application.Initialize;
  Application.Title := 'BOM报价成本中心';
  Application.CreateForm(Tdm1, dm1);
  {$IFDEF DEBUGMODE}
  FillDebugUser(gUser);
  dm1.con1.Close;
  dm1.con1.LoginPrompt := False;
  dm1.con1.ConnectionString := gUser.DBConnectString;
  dm1.con1.Open();
  dm1.GetLookUpData;
  Application.CreateForm(TfrmMainBOMBaoJiaDept, frmMainBOMBaoJiaDept);
  frmMainBOMBaoJiaDept.Caption := 'BOM报价成本中心' + ' ' + gUser.DBName;
  {$ELSE}
  case App_Init(dm1.con1,gUser) of
    0: ShowMessage('程序启动失败，请联系管理员！');
    1:
    begin
      dm1.GetLookUpData;
      Application.CreateForm(TfrmMainBOMBaoJiaDept, frmMainBOMBaoJiaDept);
      frmMainBOMBaoJiaDept.Caption := 'BOM报价成本中心' + ' ' + gUser.DBName;
    end;
    2: ShowMessage('同一数据库中只能启动一起！');
  else
  end;
  {$ENDIF}
  Application.Run;

end.
