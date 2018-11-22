program N_EP167;

uses
  Forms,
  Main_167 in 'Main_167.pas' {frmMain_167},
  Edit_Data0348 in 'Edit_Data0348.pas' {frmEdit_Data0348};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '报价规则设置';
  Application.CreateForm(TfrmMain_167, frmMain_167);
  Application.Run;
end.
