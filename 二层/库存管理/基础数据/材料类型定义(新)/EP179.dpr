program EP179;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  edit_invt in 'edit_invt.pas' {Form2},
  edit_ies in 'edit_ies.pas' {Form3},
  IES_search in 'IES_search.pas' {Form_ies},
  invgroup_search in 'invgroup_search.pas' {Form4},
  AcctSearch in 'AcctSearch.pas' {Form_Acct},
  QrySet in 'QrySet.pas' {Qry};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '≤ƒ¡œ¿‡–Õ';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
