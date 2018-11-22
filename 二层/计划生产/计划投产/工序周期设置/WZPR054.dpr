program WZPR054;

uses
  Forms,
  form_Cycle in 'form_Cycle.pas' {frm_Cycle},
  form_ProcessCycle in 'form_ProcessCycle.pas' {frm_ProcessCycle},
  DM_unt in '..\..\..\Comm_1(D7)\DM_unt.pas' {DM_frm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.Title := '工序周期设置';
  Application.CreateForm(TDM_frm, DM_frm);
  Application.CreateForm(Tfrm_ProcessCycle, frm_ProcessCycle);
  Application.Run;
end.
