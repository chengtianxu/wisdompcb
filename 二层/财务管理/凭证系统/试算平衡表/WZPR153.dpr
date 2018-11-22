program WZPR153;

uses
  Forms,
  uMain in 'uMain.pas' {FMain},
  uMD in 'uMD.pas' {DM: TDataModule},
  uAcctSearch in 'uAcctSearch.pas' {FAcctSearch},
  uProgress in 'uProgress.pas' {FProgress},
  uDLShow in 'uDLShow.pas' {FrmDLShow},
  AcctNote in 'AcctNote.pas' {FrmAcctNote};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := ' ‘À„∆Ω∫‚±Ì';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
