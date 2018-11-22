program A_wzpr193;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  layer_list in 'layer_list.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '标准层压结构';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
