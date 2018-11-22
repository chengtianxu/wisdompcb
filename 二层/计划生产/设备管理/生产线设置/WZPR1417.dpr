program WZPR1417;

uses
  Forms,
  FASSET_set1_unt in 'FASSET_set1_unt.pas' {FASSET_set_frm},
  DM_unt in '..\..\..\Comm_1(D7)\DM_unt.pas' {DM_frm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '生产线设置';
  Application.CreateForm(TDM_frm, DM_frm);
  Application.CreateForm(TFASSET_set_frm, FASSET_set_frm);
  
  Application.Run;
end.
