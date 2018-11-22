program wzpr107;

uses
  Forms,
  main in 'main.pas' {Form1},
  datamd in 'datamd.pas' {dm: TDataModule},
  invt_recept in 'invt_recept.pas' {Form_invtrecept},
  edadd_dealinvoice in 'edadd_dealinvoice.pas' {Form2},
  supp_invtrecept in 'supp_invtrecept.pas' {Form_suppinvtrecept},
  tax_invoice in 'tax_invoice.pas' {Form3},
  misc_dealinvoice in 'misc_dealinvoice.pas' {Form4},
  warehouse_search in 'warehouse_search.pas' {Form_wh},
  supplier_search in 'supplier_search.pas' {Form_supp},
  curr_search in 'curr_search.pas' {form_curr};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '”¶∏∂’ øÓ»Î’ ';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
