program A_ep302;

uses
  Forms,
  main in 'main.pas' {main_form};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '工具费用分析';
  Application.CreateForm(Tmain_form, main_form);
  Application.Run;
end.
