program WZCP098;

uses
  Forms,
  damo in 'damo.pas' {dm: TDataModule},
  Browse in 'Browse.pas' {frmBrowse},
  condition in 'condition.pas' {frmCondition},
  Detail in 'Detail.pas' {frmDetail},
  FindPO in 'FindPO.pas' {frmFindPO},
  FindShip in 'FindShip.pas' {frmFindShip};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Ω” ’ÕÀªı';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmBrowse, frmBrowse);
  Application.CreateForm(TfrmCondition, frmCondition);
  Application.Run;
end.
