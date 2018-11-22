program A_EP061;

uses
  Forms,
  main in 'main.pas' {Form1},
  editprodcode in 'editprodcode.pas' {Form2},
  searchgroup in 'searchgroup.pas' {Form3},
  accountsearch in 'accountsearch.pas' {Form_acct},
  iesmodel_search in 'iesmodel_search.pas' {Form_iesmodel},
  layerpre_search in 'layerpre_search.pas' {Form_layerpre};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '产品类型';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
