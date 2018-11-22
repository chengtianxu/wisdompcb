program PPDistrib;

uses
  Forms,
  uBrowse in 'uBrowse.pas' {frmBrowse},
  uDM in 'uDM.pas' {DM: TDataModule},
  condition in 'condition.pas' {frmCondition},
  uChooseWO in 'uChooseWO.pas' {frmChooseWO},
  uDetail in 'uDetail.pas' {frmDetail},
  uAddDetail in 'uAddDetail.pas' {frmAddDetail},
  Pick_Item_Single_Other in 'Pick_Item_Single_Other.pas' {frmPick_Item_Single_Other},
  uBatchAddDetail in 'uBatchAddDetail.pas' {frmBatchAddDetail};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'PP≈‰¡œµ•';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmBrowse, frmBrowse);
  Application.CreateForm(TfrmCondition, frmCondition);
  Application.Run;
end.
