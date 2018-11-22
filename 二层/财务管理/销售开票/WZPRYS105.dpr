program WZPRYS105;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  ysdetail in 'ysdetail.pas' {Form_ysdetail},
  misctooliv in 'misctooliv.pas' {Form_misctooliv},
  AcctSearch in 'AcctSearch.pas' {Form_Acct},
  curr_search in 'curr_search.pas' {form_curr},
  voucher_dictionary in 'voucher_dictionary.pas' {Form_dictionary},
  ASSIGN in 'ASSIGN.pas' {Form_ASSIGN},
  voucher_report in 'voucher_report.pas' {Form_voucherreport},
  rma in 'rma.pas' {Form_rma},
  cutdate in 'cutdate.pas' {Form_cutdate},
  QuerySet in 'QuerySet.pas' {frmQuerySet},
  Modify in 'Modify.pas' {Form_modify};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ÏúÊÛ¿ªÆ±';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
