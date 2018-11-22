program BOMBaoJia;
{$R 'CallerResource.res' 'CallerResource.rc'}
uses
  Forms,
  MidasLib,
  Vcl.Dialogs,

  BOMBaoJiaMainFrm in 'BOMBaoJiaMainFrm.pas' {frmMainBOMBaoJia},
  BOMBaoJiaEditFrm in 'BOMBaoJiaEditFrm.pas' {frmEditBOMBaoJia},
  DM in '..\Common\DM.pas' {dm1: TDataModule},
  CalcIntf in 'CalcIntf.pas',
  CalcImpl in 'CalcImpl.pas',
  BOMBaoJiaInputPCsSize in 'BOMBaoJiaInputPCsSize.pas' {frmBOMPaoJiainPutPCSSize},
  BomBaoJiaQueryFrm in 'BomBaoJiaQueryFrm.pas' {frmBomBaoJiaQuery},
  RptDM in 'RptDM.pas' {dmRpt: TDataModule},
  BOMPricePrintSetFrm in 'BOMPricePrintSetFrm.pas' {frmBomPricePrintSet},
  RptDMOut in 'RptDMOut.pas' {dmRptOut: TDataModule},
  ShenPiFrm in 'ShenPiFrm.pas' {frmShenPi},
  WZ_gUnit;

{$R *.res}

//{$DEFINE DEBUGMODE}

begin
  Application.Initialize;
  Application.Title := 'BOM报价单';
  Application.CreateForm(Tdm1, dm1);
  {$IFDEF DEBUGMODE}
  FillDebugUser(gUser);
//  gUser.User_Permit := '1';
  //gUser.User_Ptr := '1284';
  dm1.con1.Close;
  dm1.con1.LoginPrompt := False;
  dm1.con1.ConnectionString := gUser.DBConnectString;
  dm1.con1.Open();
  dm1.GetLookUpData;
  Application.CreateForm(TfrmMainBOMBaoJia, frmMainBOMBaoJia);
  frmMainBOMBaoJia.Caption := 'BOM报价单' + ' ' + gUser.DBName;
  {$ELSE}
  case App_Init(dm1.con1,gUser) of
    0: ShowMessage('程序启动失败，请联系管理员！');
    1:
    begin
      dm1.GetLookUpData;
      Application.CreateForm(TfrmMainBOMBaoJia, frmMainBOMBaoJia);
      frmMainBOMBaoJia.Caption := 'BOM报价单' + ' ' + gUser.DBName;
    end;
    2: ShowMessage('同一数据库中只能启动一起！');
  else
  end;
  {$ENDIF}
  Application.Run;

end.
