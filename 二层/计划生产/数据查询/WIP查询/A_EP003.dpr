program A_EP003;

uses
  Forms,
  DataSheet in 'DataSheet.pas' {frmDataSheet},
  QuerySet in 'QuerySet.pas' {frmQuerySet},
  DM in 'DM.pas' {dmcon: TDataModule},
  nowipso in 'nowipso.pas' {Form_nowipso},
  term in 'term.pas' {Form_condition};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'WIP生产状况查询';
  Application.CreateForm(Tdmcon, dmcon);
  Application.CreateForm(TfrmDataSheet, frmDataSheet);
  Application.Run;
end.
