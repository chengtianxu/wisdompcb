program WZPR0515;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  ass_add in 'ass_add.pas' {Form_add},
  ass_edit in 'ass_edit.pas' {Form_edit};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '定资产变动方式';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  //Application.CreateForm(TForm_add, Form_add);
 // Application.CreateForm(TForm_edit, Form_edit);
  Application.Run;
end.
