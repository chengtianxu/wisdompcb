program EmployeecarMsg;

uses
  Forms,
  PasMain in 'PasMain.pas' {frmMain},
  DAMO in 'DAMO.pas' {DM: TDataModule},
  PasSend in 'PasSend.pas' {frmSend},
  PasQuery in 'PasQuery.pas' {frmQuery};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '¿¼ÇÚ·¢¿¨ÍË¿¨';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
