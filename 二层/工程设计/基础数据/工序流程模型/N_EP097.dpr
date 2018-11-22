program N_EP097;

uses
  Forms,
  Edit_Data0505 in 'Edit_Data0505.pas' {frmEdit_Data0505},
  Main_097 in 'Main_097.pas' {frmMain_097},
//  ProcessShow in '..\common\ProcessShow.pas' s{frmProcessShow},
  Dlg_Copy in 'Dlg_Copy.pas' {frmDlg_Copy};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '智能流程设计模型';
  Application.CreateForm(TfrmMain_097, frmMain_097);
  Application.Run;
end.
