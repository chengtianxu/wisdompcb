program EP093;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {dm: TDataModule},
  IQC_Form in 'IQC_Form.pas' {Form_IQC},
  Bug_form in 'Bug_form.pas' {Form_bug},
  bugser_form in 'bugser_form.pas' {Form_bugser};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '¿â´æ²ÄÁÏ¼ì²é';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);

 // Application.CreateForm(TForm_IQC, Form_IQC);
//  Application.CreateForm(TForm_bug, Form_bug);
//  Application.CreateForm(TForm_bugser, Form_bugser);
  Application.Run;
end.
