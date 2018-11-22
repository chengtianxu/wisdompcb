program wzprclsh105;

uses
  Forms,
  AcctNote in 'AcctNote.pas' {FrmAcctNote},
  uDM in 'uDM.pas' {DM: TDataModule},
  uMain in 'uMain.pas' {main},
  voucher_report in 'voucher_report.pas' {Form_voucherreport},
  uRpCons in 'uRpCons.pas' {mul_Rp};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '∆æ÷§-≥ˆƒ……Û∫À';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tmain, main);
  Application.Run;
end.
