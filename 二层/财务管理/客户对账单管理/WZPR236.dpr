program WZPR236;

uses
  Forms,
  Main in 'Main.pas' {Form_Main},
  Demo in 'Demo.pas' {DM: TDataModule},
  Detail in 'Detail.pas' {Form_Detail},
  ASSIGN in 'ASSIGN.pas' {Form_ASSIGN},
  QuerySet in 'QuerySet.pas' {frmQuerySet},
  rma in 'rma.pas' {Form_rma},
  misctooliv in 'misctooliv.pas' {Form_misctooliv},
  frmReport in 'frmReport.pas' {Form_Report};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '客户对帐单';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_Main, Form_Main);
  Application.Run;
end.
