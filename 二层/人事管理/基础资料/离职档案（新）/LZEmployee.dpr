program LZEmployee;

uses
  Forms,
  UPub in 'UPub.pas',
  UModiOutTime in 'UModiOutTime.pas' {FrmModiOutTime},
  UPreAdd in 'UPreAdd.pas' {FrmAdd},
  UQry in 'UQry.pas' {FrmQry},
  USendedQuitMsg in 'USendedQuitMsg.pas' {FrmSendedQuitMsg},
  USendQuitMsg in 'USendQuitMsg.pas' {FrmSendQuitMsg},
  UMain in 'UMain.pas' {FrmMain},
  USelEmp in 'USelEmp.pas' {FrmSelEmp},
  UDM in 'UDM.pas' {DM: TDataModule},
  UNote in 'UNote.pas' {frmNote};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
