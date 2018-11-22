program Emp_Punishiment;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {FrmMain},
  QueFrm in 'QueFrm.pas' {FrmQue},
  Damo in 'Damo.pas' {DM: TDataModule},
  EditFrm in 'EditFrm.pas' {FrmEdit},
  EditFrms in 'EditFrms.pas' {FrmEdits},
  ExcelFrm in 'ExcelFrm.pas' {FrmExcel};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Õý¸º¼¨Ð§';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmQue, FrmQue);
  Application.Run;
end.
