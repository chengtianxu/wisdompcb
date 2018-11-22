program DormitoryMsg;

uses
  Forms,
  PasMain in 'PasMain.pas' {frmMain},
  DAMO in 'DAMO.pas' {DM: TDataModule},
  PasDModify in 'PasDModify.pas' {frmDModify},
  PasRModify in 'PasRModify.pas' {frmRModify},
  PasBModify in 'PasBModify.pas' {frmBModify};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '员工宿舍定义';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
