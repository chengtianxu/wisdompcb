program EP084;

uses
  Forms,
  main in 'MAIN.PAS' {Form1},
  edit_lo in 'EDIT_LO.PAS' {Form2},
  warehouse_search in 'warehouse_search.pas' {Form_wh},
  damo in 'damo.pas' {dm: TDataModule},
  QrySet in 'QrySet.pas' {Qry};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '≤÷ø‚∂®“Â';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TQry, Qry);
  Application.Run;
end.
