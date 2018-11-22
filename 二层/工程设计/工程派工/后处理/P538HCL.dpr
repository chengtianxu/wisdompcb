program P538HCL;

uses
  Forms,
  Main in 'Main.pas' {Form_main},
  DAMO in 'DAMO.pas' {DM: TDataModule},
  Query in 'Query.pas' {FrmQuery};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '∫Û¥¶¿Ì';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_main, Form_main);
  Application.Run;
end.
