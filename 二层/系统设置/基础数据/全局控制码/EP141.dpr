program EP141;

uses
  Forms,
  Editor in 'Editor.pas' {Form_Editor},
  dmo in 'dmo.pas' {DM: TDataModule},
  control in 'CONTROL.PAS' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '¿ØÖÆºÅÂë';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
