program A_WZPR304;

uses
  Forms,
  main in 'main.pas' {Form1},
  data_module in 'data_module.pas' {dm: TDataModule},
  ADED_RECE in 'ADED_RECE.pas' {Form2},
  eip_search in 'eip_search.pas' {Form_episearch},
  received_search in 'received_search.pas' {Form3},
  curr_search in 'curr_search.pas' {curr_form},
  expressions in 'expressions.pas' {Form4},
  ColsDisplaySet_unt in 'ColsDisplaySet_unt.pas' {ColsDisplaySet_frm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '外发加工审核/对帐';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
