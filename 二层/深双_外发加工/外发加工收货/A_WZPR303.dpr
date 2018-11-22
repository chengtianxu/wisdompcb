program A_WZPR303;

uses
  Forms,
  main in 'main.pas' {Form1},
  data_module in 'data_module.pas' {dm: TDataModule},
  ADED_RECE in 'ADED_RECE.pas' {Form2},
  eip_search in 'eip_search.pas' {Form_episearch},
  received_search in 'received_search.pas' {Form3},
  term in 'term.pas' {Form4},
  empl_search in 'empl_search.pas' {form_technics},
  inv_search in 'inv_search.pas' {form_inv},
  supplier_search in 'supplier_search.pas' {Form_supp};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '外发加工收货';
  Application.CreateForm(Tdm, dm);  
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
