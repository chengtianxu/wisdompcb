program wzpr260;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  AcctNote in 'AcctNote.pas' {FrmAcctNote};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '现金银行日记帐';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
