program WZCP008;

uses
  Forms,
  uWZCPMain in 'uWZCPMain.pas' {Form1},
  uNewForm in 'uNewForm.pas' {Form2},
  uCPCItem in 'uCPCItem.pas' {formCitem},
  uDM in 'uDM.pas' {DataModule1: TDataModule},
  uPublic in 'uPublic.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
