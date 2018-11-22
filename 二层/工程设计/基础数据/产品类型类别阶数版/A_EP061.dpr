program A_EP061;

uses
  Forms,
  main in 'main.pas' {Frm_Main},
  editprodcode in 'editprodcode.pas' {Frm_ProdCode},
  category in 'category.pas' {Frm_Category},
  demo in 'demo.pas' {DM: TDataModule},
  QuerySet in 'QuerySet.pas' {frmQuerySet};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '产品类型';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_Main, Frm_Main);
  Application.CreateForm(TfrmQuerySet, frmQuerySet);
  Application.Run;
end.
