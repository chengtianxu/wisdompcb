program wzprcx105;

uses
  Forms,
  AcctNote in 'AcctNote.pas' {FrmAcctNote},
  uDM in 'uDM.pas' {DM: TDataModule},
  uMain in 'uMain.pas' {main},
  voucher_report in 'voucher_report.pas' {Form_voucherreport},
  uRpCons in 'uRpCons.pas' {mul_Rp},
  condition in 'condition.pas' {Form_condition},
  Frm_tree_u in 'Frm_tree_u.pas' {Frm_tree};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ƾ֤-ƾ֤��ѯ';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tmain, main);
  Application.Run;
end.
