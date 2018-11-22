program WZCX489;

uses
  Forms,
  main in 'main.pas' {frm_main},
  damo in 'damo.pas' {dm: TDataModule},
  condition in 'condition.pas' {frm_condition},
  INFrm in 'INFrm.pas' {frmIN};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '半成品分配查询';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tfrm_main, frm_main);
  Application.CreateForm(Tfrm_condition, frm_condition);
  Application.CreateForm(TfrmIN, frmIN);
  Application.Run;
end.
