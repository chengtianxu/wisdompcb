program A_EP216;

uses
  Forms,
  Main in 'Main.pas' {FrmMain},
  ProgressBar in 'ProgressBar.pas' {FrmProgress};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '订单交付准备';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
