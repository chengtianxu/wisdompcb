program WZPRGLCX;

uses
  Forms,
  Frm_main_u in 'Frm_main_u.pas' {Frm_main},
  AcctSearch in 'AcctSearch.pas' {FrmAcctSearch},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  ufrmGl in 'ufrmGl.pas' {frmGL},
  uDLShow in 'uDLShow.pas' {FrmDLShow},
  AcctNote in 'AcctNote.pas' {FrmAcctNote};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '◊‹’ ≤È—Ø';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.Run;
end.
