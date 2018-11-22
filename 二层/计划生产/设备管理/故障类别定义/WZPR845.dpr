program WZPR845;

uses
  Forms,
  DM_unt in '..\..\..\Comm_1(D7)\DM_unt.pas' {DM_frm: TDataModule},
  form_FaultName in 'form_FaultName.pas' {frm_FaultName};

{$R *.res}

begin
  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.Title := '故障类别定义';
  Application.CreateForm(TDM_frm, DM_frm);
  Application.CreateForm(Tfrm_FaultName, frm_FaultName);
  Application.Run;
end.
