program WZCP89;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {FrmMain},
  EditFrm in 'EditFrm.pas' {FrmEdit},
  Damo in 'Damo.pas' {DM: TDataModule},
  FinishFrm in 'FinishFrm.pas' {FrmFinish},
  QueFrm in 'QueFrm.pas' {FrmQue};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '外发加工收货';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmQue, FrmQue);
  Application.Run;
end.
