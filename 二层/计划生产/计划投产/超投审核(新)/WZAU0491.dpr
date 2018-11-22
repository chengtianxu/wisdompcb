program WZAU0491;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {dm: TDataModule},
  condition in 'condition.pas' {Form_condition},
  PasWeiXin in 'PasWeiXin.pas' {frmWeiXin},
  UAuditDetail in 'UAuditDetail.pas' {frmAuditDetail};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '≥¨Õ∂…Û∫À';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm_condition, Form_condition);
  Application.Run;
end.
