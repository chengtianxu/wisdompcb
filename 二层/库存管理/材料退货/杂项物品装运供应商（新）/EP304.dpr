program EP304;

uses
  Forms,
  main in 'main.pas' {frm_main},
  damo in 'damo.pas' {DM: TDataModule},
  QuerySet in 'QuerySet.pas' {frmQuerySet},
  shipped_meth in 'shipped_meth.pas' {Frm_shipped},
  shipmeth_search in 'shipmeth_search.pas' {form_shipmethod},
  miscreport in 'miscreport.pas' {Form_miscreport};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '装运到供应商(非生产物料)';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_main, frm_main);
  Application.CreateForm(TfrmQuerySet, frmQuerySet);
  Application.Run;
end.
