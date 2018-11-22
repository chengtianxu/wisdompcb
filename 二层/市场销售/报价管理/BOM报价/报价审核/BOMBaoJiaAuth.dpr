program BOMBaoJiaAuth;

uses
  MidasLib,
  Vcl.Dialogs,
  Vcl.Forms,
  BOMBaoJiaEditFrm in '..\报价单\BOMBaoJiaEditFrm.pas' {frmEditBOMBaoJia},
  BOMBaoJiaInputPCsSize in '..\报价单\BOMBaoJiaInputPCsSize.pas' {frmBOMPaoJiainPutPCSSize},
  BOMBaoJiaMainFrm in '..\报价单\BOMBaoJiaMainFrm.pas' {frmMainBOMBaoJia},
  BomBaoJiaQueryFrm in '..\报价单\BomBaoJiaQueryFrm.pas' {frmBomBaoJiaQuery},
  BOMPricePrintSetFrm in '..\报价单\BOMPricePrintSetFrm.pas' {frmBomPricePrintSet},
  CalcImpl in '..\报价单\CalcImpl.pas',
  CalcIntf in '..\报价单\CalcIntf.pas',
  RptDM in '..\报价单\RptDM.pas' {dmRpt: TDataModule},
  RptDMOut in '..\报价单\RptDMOut.pas' {dmRptOut: TDataModule},
  ShenPiFrm in '..\报价单\ShenPiFrm.pas' {frmShenPi},
  DataIntf in '..\Common\DataIntf.pas',
  DBImpl in '..\Common\DBImpl.pas',
  DM in '..\Common\DM.pas' {dm1: TDataModule},
  WZ_gUnit in '..\Common\WZ_gUnit.pas';

{$R *.res}

//{$DEFINE DEBUGMODE}

begin
  Application.Initialize;
  Application.Title := 'BOM报价审核';
  Application.CreateForm(Tdm1, dm1);
  {$IFDEF DEBUGMODE}
  FillDebugUser(gUser);
  //gUser.User_Permit := '1';
//  gUser.User_Ptr := '1284';
  dm1.con1.Close;
  dm1.con1.LoginPrompt := False;
  dm1.con1.ConnectionString := gUser.DBConnectString;
  dm1.con1.Open();
  dm1.GetLookUpData;
  Application.CreateForm(TfrmMainBOMBaoJia, frmMainBOMBaoJia);
  frmMainBOMBaoJia.FIsAuth := True;
  frmMainBOMBaoJia.Caption := 'BOM报价审核' + ' ' + gUser.DBName;
  {$ELSE}
  case App_Init(dm1.con1,gUser) of
    0: ShowMessage('程序启动失败，请联系管理员！');
    1:
    begin
      dm1.GetLookUpData;
      Application.CreateForm(TfrmMainBOMBaoJia, frmMainBOMBaoJia);
      frmMainBOMBaoJia.Caption := 'BOM报价审核' + ' ' + gUser.DBName;
      frmMainBOMBaoJia.FIsAuth := True;
    end;
    2: ShowMessage('同一数据库中只能启动一起！');
  else
  end;
  {$ENDIF}
  Application.Run;

end.
