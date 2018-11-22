program WZPR132;

uses
  Forms,
  main in 'main.pas' {Form1},
  datamd in 'datamd.pas' {dm: TDataModule},
  debit_bysupp in 'debit_bysupp.pas' {Form2},
  supplier_search in 'supplier_search.pas' {Form_supp},
  curr_search in 'curr_search.pas' {form_curr},
  prepay_supp in 'prepay_supp.pas' {Form3},
  invt_recept in 'invt_recept.pas' {Form_invtship},
  debit_returen in 'debit_returen.pas' {Form4},
  invt_sendback in 'invt_sendback.pas' {Form_sendback};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '½èÏî±¸Íü';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
