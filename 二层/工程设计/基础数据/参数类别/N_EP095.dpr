program N_EP095;

uses
  Forms,
  Main_data095 in 'Main_data095.pas' {frmMain_data095},
  Edit_Data0277 in 'Edit_Data0277.pas' {frmEdit_Data0277};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '工程参数类别库';
  Application.CreateForm(TfrmMain_data095, frmMain_data095);
  Application.Run;
end.
