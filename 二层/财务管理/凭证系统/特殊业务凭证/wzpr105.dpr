program wzpr105;

uses
  Forms,
  Main in 'Main.pas' {FrmMain},
  AcctNote in 'AcctNote.pas' {FrmAcctNote},
  AcctSearch in 'AcctSearch.pas' {FrmAcctSearch},
  BankSearch in 'BankSearch.pas' {FrmBankSearch},
  Datamodule in 'Datamodule.pas' {DM: TDataModule},
  Dictionary in 'Dictionary.pas' {FrmDictionary},
  voucher_report in 'voucher_report.pas' {Form_voucherreport},
  curr_search in 'curr_search.pas' {Form_Curr},
  vouchersearch in 'vouchersearch.pas' {Form_vouchersearch};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '特殊业务凭证';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
