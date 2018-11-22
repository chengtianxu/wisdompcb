program WZCP007;

uses
  Forms,
  main in 'main.pas' {Form1},
  edit in 'edit.pas' {Form2},
  Unit1 in 'Unit1.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '产品分类';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
