program EP185;

uses
  Forms,
  MAIN0 in 'MAIN0.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '公司信息载入';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
