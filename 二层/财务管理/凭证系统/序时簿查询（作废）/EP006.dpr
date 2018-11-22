program EP006;

uses
  Forms,
  Main in 'Main.pas' {FrmMain},
  NoteList in 'NoteList.pas' {FrmList},
  Datamodule in 'Datamodule.pas' {DM: TDataModule},
  ProgressBar in 'ProgressBar.pas' {FrmProgress},
  Report0 in 'Report0.pas' {FrmReport0},
  Frm_tree_u in 'Frm_tree_u.pas' {Frm_tree};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '会计分录序时簿';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrm_tree, Frm_tree);
  Application.Run;
end.
