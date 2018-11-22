program YWY195_N;

uses
  Forms,
  PasClerkTiCH in 'PasClerkTiCH.pas' {frmClerkTiCH},
  PasDM in 'PasDM.pas' {DM: TDataModule},
  PasSetClerk in 'PasSetClerk.pas' {frmSetClerk},
  PasQuery in 'PasQuery.pas' {FrmQuery};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ÒµÎñ½±½ðºËËã';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmClerkTiCH, frmClerkTiCH);
  Application.Run;
end.
