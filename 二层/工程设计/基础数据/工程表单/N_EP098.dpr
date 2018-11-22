program N_EP098;

uses
  Forms,
  Main_098 in 'Main_098.pas' {frmMain_098},
  Edit_Data0280 in 'Edit_Data0280.pas' {frmEdit_Data0280},
  SetRowCol in 'SetRowCol.pas' {frmSetRowCol};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '工程表单管理';
  Application.CreateForm(TfrmMain_098, frmMain_098);
  Application.Run;
end.
