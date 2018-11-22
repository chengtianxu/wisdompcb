program WZPR174;

uses
  Forms,
  main in 'main.pas' {Frm_main},
  dmo in 'dmo.pas' {DM: TDataModule},
  Delivery in 'Delivery.pas' {Frm_Delivery},
  add in 'add.pas' {Frm_add};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '回复交期更改审核';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
