program WZPR836;

uses
  Forms,
  UMain in 'UMain.pas' {frmMain},
  UDM in 'UDM.pas' {DM: TDataModule},
  Ureport in 'Ureport.pas' {frmReport},
  Uedit in 'Uedit.pas' {frmEdit},
  UMtrlCheck in 'UMtrlCheck.pas' {frmMtrlCheck},
  USelMaterial in 'USelMaterial.pas' {frmSelMaterial},
  UAuthInfo in 'UAuthInfo.pas' {frmAuthInfo},
  UReqDetail in 'UReqDetail.pas' {frmReqDetail},
  UQry in 'UQry.pas' {frmQry},
  UReqDetail2 in 'UReqDetail2.pas' {frmReqDetail2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '设备部领料申请';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
