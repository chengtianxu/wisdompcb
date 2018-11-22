program EP006;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  Datamodule in 'Datamodule.pas' {DM: TDataModule},
  Frm_tree_u in 'Frm_tree_u.pas' {Frm_tree},
  PasEntries in 'PasEntries.pas' {FrmEntries};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '会计分录序时簿';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrm_tree, Frm_tree);
  Application.Run;
end.
