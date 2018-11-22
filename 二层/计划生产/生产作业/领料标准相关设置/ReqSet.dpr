program ReqSet;

uses
  Forms,
  UMain in 'UMain.pas' {frmMain},
  UDM in 'UDM.pas' {DM: TDataModule},
  UQry in 'UQry.pas' {FrmQry},
  UDayMOdi in 'UDayMOdi.pas' {FrmDayModi},
  UProcessModi in 'UProcessModi.pas' {frmProcessModi};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '领料标准相关设置';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
