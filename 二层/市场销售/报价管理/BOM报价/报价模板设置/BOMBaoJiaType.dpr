program BOMBaoJiaType;

uses
  Vcl.Forms,
  Vcl.Dialogs,
  WZ_gUnit,
  BOMBaoJiaTypeMainFrm in 'BOMBaoJiaTypeMainFrm.pas' {frmMainBOMBaoJiaType},
  DM in '..\Common\DM.pas' {dm1: TDataModule},
  BOMBaojiaTypeEditFrm in 'BOMBaojiaTypeEditFrm.pas' {frmBomBaoJiaTypeEdit},
  AddTypeDeptFrm in 'AddTypeDeptFrm.pas' {frmAddTypeDept},
  BOMBaoJiaAddNewType in 'BOMBaoJiaAddNewType.pas' {frmBOMBaoJiaAddNewType},
  BOMBaoJiaTypeEditCaiLiao in 'BOMBaoJiaTypeEditCaiLiao.pas' {frmBomBaoJiaTypeEditCaiLiao},
  BOMBaoJiaTypeAddGolbParamFrm in 'BOMBaoJiaTypeAddGolbParamFrm.pas' {frmBOMBaoJiaTypeAddGolbParam};

{$R *.res}

//{$DEFINE DEBUGMODE}

begin
  Application.Initialize;
  Application.Title := 'BOM报价类型流程定义';
  Application.CreateForm(Tdm1, dm1);
  {$IFDEF DEBUGMODE}
  FillDebugUser(gUser);
  dm1.con1.Close;
  dm1.con1.LoginPrompt := False;
  //dm1.con1.ConnectionString := gUser.DBConnectString;
  dm1.con1.Open();
  dm1.GetLookUpData;
  Application.CreateForm(TfrmMainBOMBaoJiaType, frmMainBOMBaoJiaType);
  frmMainBOMBaoJiaType.Caption := 'BOM报价类型流程定义' + ' ' + gUser.DBName;
  {$ELSE}
  case App_Init(dm1.con1,gUser) of
    0: ShowMessage('程序启动失败，请联系管理员！');
    1:
    begin
      dm1.GetLookUpData;
      Application.CreateForm(TfrmMainBOMBaoJiaType, frmMainBOMBaoJiaType);
      frmMainBOMBaoJiaType.Caption := 'BOM报价类型流程定义' + ' ' + gUser.DBName;
    end;
    2: ShowMessage('同一数据库中只能启动一起！');
  else
  end;
  {$ENDIF}
  Application.Run;
end.
