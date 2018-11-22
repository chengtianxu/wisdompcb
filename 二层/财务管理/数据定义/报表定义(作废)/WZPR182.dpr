program WZPR182;

uses
  Forms,
  main in 'main.pas' {Form1},
  voucher_report in 'voucher_report.pas' {Form_voucherreport},
  damo in 'damo.pas' {dm: TDataModule},
  ufrmGl in 'ufrmGl.pas' {frmGL},
  ufrmDetail in 'ufrmDetail.pas' {frmDetail};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '财务报表格式调整';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
