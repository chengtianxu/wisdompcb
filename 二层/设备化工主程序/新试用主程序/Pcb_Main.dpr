program Pcb_Main;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  dmcon in 'dmcon.pas' {dm: TDataModule},
  LogIn in 'LogIn.pas' {frmLogin},
  App_List in 'App_List.pas' {frmApp_List},
  ChgPass in 'ChgPass.pas' {FrmChgPass},
  File_Download in 'File_Download.pas' {frmFile_Download};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmFile_Download, frmFile_Download);
  Application.Run;
end.
