program WZPR103;

uses
  Forms,
  Frm_Main_u in 'Frm_Main_u.pas' {Frm_Main},
  DM_u in 'DM_u.pas' {DM: TDataModule},
  Frm_tree_u in 'Frm_tree_u.pas' {Frm_tree},
  PubFunc in 'PubFunc.pas',
  Frm_hint_u in 'Frm_hint_u.pas' {F_hint};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '会计科目定义';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_Main, Frm_Main);
  Application.Run;
end.
