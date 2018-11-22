program PCBERP;

uses
  Forms,
  datamodule in 'datamodule.pas' {DM: TDataModule},
  MainForm in 'MainForm.pas' {FrmMainMenu},
  WndFlash in 'WndFlash.pas' {FrmWndFlash},
  ActiveFiles in 'ActiveFiles.pas' {FrmActiveFiles},
  splash in 'splash.pas' {SplashForm},
  About in 'About.pas' {AboutBox},
  ChgPass in 'ChgPass.pas' {FrmChgPass},
  ActiveUsers in 'ActiveUsers.pas' {FrmActiveUsers},
  Warning in 'Warning.pas' {FrmWarning},
  MAIN in 'MAIN.pas' {Form_loing},
  md5 in 'md5.pas';

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'PCB企业资源计划';
  Application.CreateForm(TForm_loing, Form_loing);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
