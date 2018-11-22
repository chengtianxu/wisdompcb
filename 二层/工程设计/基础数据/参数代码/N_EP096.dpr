program N_Ep096;

uses
  Forms,
  Main_data096 in 'Main_data096.pas' {frmMain_data096},
  Edit_Data0278 in 'Edit_Data0278.pas' {frmEdit_Data0278};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '工程参数设定';
  Application.CreateForm(TfrmMain_data096, frmMain_data096);
  Application.Run;
end.
