program wzpr8321;

uses
  Forms,
  main in 'main.pas' {frm_main},
  damo in 'damo.pas' {DM: TDataModule},
  QuerySet in 'QuerySet.pas' {frmQuerySet},
  ColsDisplaySet_unt in 'ColsDisplaySet_unt.pas' {ColsDisplaySet_frm},
  formMultiSelectedItem in 'formMultiSelectedItem.pas' {frmMultiSelectedItem};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '非设备类型保养计划';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_main, frm_main);
  Application.CreateForm(TfrmQuerySet, frmQuerySet);
  Application.Run;
end.
