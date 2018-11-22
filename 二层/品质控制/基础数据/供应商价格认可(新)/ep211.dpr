program ep211;

uses
  Forms,
  main in 'main.pas' {frmMain},
  damo in 'damo.pas' {DM: TDataModule},
  price_info in 'price_info.pas' {frmEdit},
  QuerySet in 'QuerySet.pas' {frmQuerySet};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '供应商资格认可（AVL）';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmQuerySet, frmQuerySet);
  Application.Run;
end.
