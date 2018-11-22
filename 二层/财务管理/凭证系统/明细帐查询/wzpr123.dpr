program wzpr123;

uses
  Forms,
  AcctSearch in 'AcctSearch.pas' {FrmAcctSearch},
  Main in 'Main.pas' {FrmMain},
  ProgressBar in 'ProgressBar.pas' {FrmProgress},
  uDM in 'uDM.pas' {DM: TDataModule},
  voucher_report in 'voucher_report.pas' {Form_voucherreport},
  AcctNote in 'AcctNote.pas' {FrmAcctNote},
  ufrmDetail in 'ufrmDetail.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '明细分类帐查询';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
