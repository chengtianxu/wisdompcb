program SalaryJL;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {FrmMain},
  damo in 'damo.pas' {DM: TDataModule},
  AddFrm in 'AddFrm.pas' {FrmAdd},
  QueFrm in 'QueFrm.pas' {FrmQue},
  EditFrm in 'EditFrm.pas' {FrmEdit},
  choiseFrm2 in 'choiseFrm2.pas' {frmchoise2},
  ExcelFrm in 'ExcelFrm.pas' {FrmExcel},
  TrainFrm in 'TrainFrm.pas' {FrmTrain},
  DetailFrm in 'DetailFrm.pas' {FrmDetail};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'µ÷Ð½¼ÇÂ¼';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmQue, FrmQue);
  Application.Run;
end.
