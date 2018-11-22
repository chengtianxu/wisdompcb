program A_EP178;

uses
  Forms,
  Main in 'Main.pas' {FrmMain},
  Details in 'Details.pas' {FrmDetails},
  Report0 in 'Report0.pas' {FrmReport0},
  Totals in 'Totals.pas' {FrmTotals},
  Report2 in 'Report2.pas' {FrmReport2},
  ProgressBar in 'ProgressBar.pas' {FrmProgress},
  rep_search in 'rep_search.pas' {rep_form},
  Unit2 in 'Unit2.pas' {FrmReport3};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '准期交货表现分析';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
