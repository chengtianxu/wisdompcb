program ERPSvr;

uses
  System.ShareMem,
  Vcl.Forms,
  MainFrm in 'MainFrm.pas' {frmMain},
  ServerMethodsUnit1 in 'ServerMethodsUnit1.pas' {ServerMethods1: TDSServerModule},
  ServerContainerUnit1 in 'ServerContainerUnit1.pas' {ServerContainer1: TDataModule},
  DM in 'DM.pas' {dm1: TDataModule};

{$R *.res}

begin
  //ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TServerContainer1, ServerContainer1);
  Application.CreateForm(Tdm1, dm1);
  Application.Run;
end.

