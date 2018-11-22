program D181;

uses
  Forms,
  PasProduceRecord in 'PasProduceRecord.pas' {FrmProduceRecord},
  PasDM in 'PasDM.pas' {DM: TDataModule},
  PasNewPdRecord in 'PasNewPdRecord.pas' {FrmNewPdRecord},
  PasPropertyType in 'PasPropertyType.pas' {FrmPropertyType},
  PasPublic in 'PasPublic.pas',
  PasQuery in 'PasQuery.pas' {FrmQuery};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'VCP线生产记录';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmProduceRecord, FrmProduceRecord);
  Application.Run;
end.
