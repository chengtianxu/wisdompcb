program WZAU457;

uses
  Forms,
  main in 'main.pas' {Form1},
  forpro_form in 'forpro_form.pas' {Form_forpro},
  nopro_form in 'nopro_form.pas' {Form_nopro},
  damo in 'damo.pas' {dm: TDataModule},
  mulprint_form in 'mulprint_form.pas' {Form_mulprint},
  report_form in 'report_form.pas' {Form_report1},
  report2_form in 'report2_form.pas' {Form_report2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '³ö¿âµ¥ÉóºË';
  Application.CreateForm(Tdm, dm);  
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
