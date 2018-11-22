program WZPR811;

uses
  Forms,
  DM_unt in '..\..\..\Comm_1(D7)\DM_unt.pas' {DM_frm: TDataModule},
  formMainCycl in 'formMainCycl.pas' {frmMainCycl};

{$R *.res}

begin
  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.Title := '保养周期设置';
  Application.CreateForm(TDM_frm, DM_frm);
  Application.CreateForm(TfrmMainCycl, frmMainCycl);
  Application.Run;
end.
