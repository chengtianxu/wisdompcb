program ep0552;

uses
  Forms,
  main in 'main.pas' {Frm_0552},
  demo in 'demo.pas' {DM: TDataModule},
  form_budget1 in 'form_budget1.pas' {form_budget},
  name in 'name.pas' {Frm_name};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '过期物料短信通知定义';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_0552, Frm_0552);
  Application.Run;
end.
