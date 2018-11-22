program ep120;

uses
  Forms,
  main in 'main.pas' {mainform},
  damo in 'damo.pas' {dm: TDataModule},
  detail in 'detail.pas' {detail_form},
  condition in 'condition.pas' {condition_form},
  empl in 'empl.pas' {empl_search};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'πÕ‘±…Ë÷√';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tmainform, mainform);
  Application.CreateForm(Tcondition_form, condition_form);
  Application.Run;
end.
