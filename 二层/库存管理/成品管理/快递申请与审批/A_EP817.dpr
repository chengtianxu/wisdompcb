program A_EP817;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {frmMain},
  DM in 'DM.pas' {dm1: TDataModule},
  WZ_gUnit,
  Dialogs,
  TranCmpFrm in 'TranCmpFrm.pas' {frmTranBaseInfo},
  AddNewBillFrm in 'AddNewBillFrm.pas' {frmAddNewBill},
  ToUserHistory in 'ToUserHistory.pas' {frmToUserHistory},
  StockPassFrm in 'StockPassFrm.pas' {frmStockPass},
  SaveBillFrm in 'SaveBillFrm.pas' {frmSaveBill},
  ViewFrm in 'ViewFrm.pas' {frmView};

//{$DEFINE DEBUGMODE}

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '快递申请与审批';
  Application.CreateForm(Tdm1, dm1);
  {$IFDEF DEBUGMODE}
  FillDebugUser(gUser);
  dm1.con1.Close;
  dm1.con1.LoginPrompt := False;
  dm1.con1.ConnectionString := gUser.DBConnectString;
  dm1.con1.Open();
  Application.CreateForm(TfrmMain, frmMain);
  frmMain.Caption := '快递申请与审批' + ' ' + gUser.DBName;
  {$ELSE}
  case App_Init(dm1.con1,gUser) of
    0: ShowMessage('程序启动失败，请联系管理员！');
    1:
    begin
      Application.CreateForm(TfrmMain, frmMain);
      frmMain.Caption := '快递申请与审批' + ' ' + gUser.DBName;
    end;
    2: ShowMessage('同一数据库中只能启动一起！');
  else
  end;
  {$ENDIF}
  Application.Run;
end.
