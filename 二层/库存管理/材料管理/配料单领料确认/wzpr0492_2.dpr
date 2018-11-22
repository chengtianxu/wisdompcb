program wzpr0492_2;

uses
  Forms,
  main in 'main.pas' {Form_main},
  demo in 'demo.pas' {DM: TDataModule},
  Usel in 'Usel.pas' {Form_sel},
  Uwhere in 'Uwhere.pas' {Form_where};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '配料单领料确认';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_main, Form_main);
  Application.Run;
end.
