program ep065;

uses
  Forms,
  main in 'main.pas' {Form_main},
  damo in 'damo.pas' {dm: TDataModule},
  budget in 'budget.pas' {form_budget},
  Pick_WorkShop in 'Pick_WorkShop.pas' {frmPick_WorkShop},
  QuerySet in 'QuerySet.pas' {frmQuerySet};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '«Îπ∫–Ë«Û‘§À„';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm_main, Form_main);
  Application.CreateForm(TfrmQuerySet, frmQuerySet);
  Application.Run;
end.
