program Project538;

uses
  Forms,
  pasProject in 'pasProject.pas' {frmProject},
  PasDM in 'PasDM.pas' {DM: TDataModule},
  PasQuery in 'PasQuery.pas' {FrmQuery},
  pasSetFieldName in 'pasSetFieldName.pas' {frmSetFieldName},
  sumqryfrm in 'sumqryfrm.pas' {frmsumqry},
  sumqryehfrm in 'sumqryehfrm.pas' {frmqrysumeh};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'π§≥Ã≈…π§';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmProject, frmProject);
  Application.Run;
end.
