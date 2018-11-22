program WZPR723;

uses
  Forms,
  main in 'main.pas' {Form_Main},
  demo in 'demo.pas' {dm: TDataModule},
  detail in 'detail.pas' {Form_Detail},
  audit in 'audit.pas' {Form_Audit},
  report_data in 'report_data.pas' {Form_Report},
  Condition in 'Condition.pas' {Form_Condition};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '公务外出单';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm_Main, Form_Main);
  Application.Run;
end.
