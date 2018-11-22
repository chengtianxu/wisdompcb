program WZPR0516;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  ass_add in 'ass_add.pas' {Form_add},
  ass_edit in 'ass_edit.pas' {Form_edit};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '¹Ì¶¨×Ê²ú×´Ì¬';
  Application.CreateForm(TDM, DM);  
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
