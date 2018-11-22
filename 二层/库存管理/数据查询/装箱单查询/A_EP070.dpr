program A_EP070;

uses
  Forms,
  main in 'main.pas' {Form1},
  packlist in 'packlist.pas' {Form2},
  part_search in 'part_search.pas' {Form_CustPart},
  customer_search in 'customer_search.pas' {Form_Customer},
  ship_advice in 'ship_advice.pas' {Form3},
  invoice_sql in 'invoice_sql.pas' {Form4},
  toolinvoice in 'toolinvoice.pas' {Form5},
  report_pk in 'report_pk.pas' {Form_report},
  curr_search in 'curr_search.pas' {form_empl},
  PasFieldShow in 'PasFieldShow.pas' {frmFieldShow};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '装箱单及发票查询';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmFieldShow, frmFieldShow);
  Application.Run;
end.
