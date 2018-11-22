program EP160;

uses
  Forms,
  Mail_u in 'Mail_u.pas' {FrmMain},
  DM_u in 'DM_u.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '×ê¾×Î»ÖÃ¶¨Òå';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
