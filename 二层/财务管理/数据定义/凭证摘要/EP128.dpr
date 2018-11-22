program EP128;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  dig_add in 'dig_add.pas' {Form_add},
  dig_edit in 'dig_edit.pas' {Form_edit};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ƾ֤ժҪ�ֵ�';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
