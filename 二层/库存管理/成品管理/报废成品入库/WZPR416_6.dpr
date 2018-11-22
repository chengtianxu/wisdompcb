program WZPR416_6;

uses
  Forms,
  Main in 'Main.pas' {frm_main},
  damo in 'damo.pas' {DM: TDataModule},
  Storage in 'Storage.pas' {frm_Storage},
  Scrap in 'Scrap.pas' {frm_Scrap},
  QuerySet in 'QuerySet.pas' {frmQuerySet};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '报废成品入库';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_main, frm_main);
  Application.CreateForm(TfrmQuerySet, frmQuerySet);
  Application.Run;
end.
