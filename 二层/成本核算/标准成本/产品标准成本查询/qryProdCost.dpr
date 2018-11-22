program qryProdCost;

uses
  Forms,
  main in 'main.pas' {frmMain},
  QuerySet in 'QuerySet.pas' {frmQuerySet};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '产品成本查询';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmQuerySet, frmQuerySet);
  Application.Run;
end.
