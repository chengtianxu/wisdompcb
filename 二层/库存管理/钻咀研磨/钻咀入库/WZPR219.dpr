program WZPR219;

uses
  Forms,
  main in 'main.pas' {Form_main},
  damo in 'damo.pas' {dm: TDataModule},
  condition in 'condition.pas' {Form_condition},
  detail in 'detail.pas' {Form_detail},
  adddetail in 'adddetail.pas' {Form_adddetail};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '×ê¾×Ö±½ÓÈë¿â';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm_main, Form_main);
  Application.CreateForm(TForm_condition, Form_condition);
  Application.Run;
end.
