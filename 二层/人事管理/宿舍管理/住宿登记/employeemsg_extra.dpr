program employeemsg_extra;

uses
  Forms,
  UpdateMrm in 'UpdateMrm.pas' {UpdateFrm},
  Damo in 'Damo.pas' {DM: TDataModule},
  MainFrm in 'MainFrm.pas' {FrmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '×¡ËÞµÇ¼Ç';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
