program WZPR156;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  condition in 'condition.pas' {Form_condition},
  add_detail in 'add_detail.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '成品寄售直接入库';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm_condition, Form_condition);
  Application.Run;
end.
