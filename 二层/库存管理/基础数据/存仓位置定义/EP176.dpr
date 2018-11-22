program EP176;

uses
  Forms,
  UMain in 'UMain.pas' {frmMain},
  UDM in 'UDM.pas' {DM: TDataModule},
  Uedit176 in 'Uedit176.pas' {frmEdit176},
  qrcode in 'qrcode.pas',
  USelLocation in 'USelLocation.pas' {FrmSelLocation},
  UQry in 'UQry.pas' {frmQry};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '¥Ê≤÷Œª÷√∂®“Â';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmQry, frmQry);
  Application.Run;
end.
