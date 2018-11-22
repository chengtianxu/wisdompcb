program WZPR0214;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {dm: TDataModule},
  count_add in 'count_add.pas' {Form_add},
  count_search in 'count_search.pas' {Form_loc_search},
  count_pro_search in 'count_pro_search.pas' {Form_pro_search},
  count_input in 'count_input.pas' {Form_input},
  count_empl_search in 'count_empl_search.pas' {Form_empl_search},
  reporter_form1 in 'reporter_form1.pas' {Form_reporter1},
  reporter_form2 in 'reporter_form2.pas' {Form_reporter2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '≥…∆∑ø‚¥Ê≈Ãµ„';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
