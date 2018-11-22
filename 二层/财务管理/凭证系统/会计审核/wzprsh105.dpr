program wzprsh105;

uses
  Forms,
  uMain in 'uMain.pas' {main},
  uDM in 'uDM.pas' {DM: TDataModule},
  AcctNote in 'AcctNote.pas' {FrmAcctNote},
  voucher_report in 'voucher_report.pas' {Form_voucherreport},
  uRpCons in 'uRpCons.pas' {mul_Rp};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '∆æ÷§-ª·º∆…Û∫À';
  Application.CreateForm(TDM, DM);  
  Application.CreateForm(Tmain, main);
  Application.Run;
end.
