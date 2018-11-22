program QWZPR274;

uses
  Forms,
  BaseUnit1 in 'BaseUnit1.pas' {BaseForm1},
  MainBaseUnit274 in 'MainBaseUnit274.pas' {MainBaseForm274},
  DMUnit1 in 'DMUnit1.pas' {DM: TDataModule},
  EditBaseUnit2 in 'EditBaseUnit2.pas' {EditBaseForm2},
  PrintUnit2 in 'PrintUnit2.pas' {PrintForm2},
  AuditInfoUnit2 in 'AuditInfoUnit2.pas' {AuditInfoForm2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '-øÏ∞Â±®º€…Û∫À';
  Application.CreateForm(TMainBaseForm274, MainBaseForm274);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
