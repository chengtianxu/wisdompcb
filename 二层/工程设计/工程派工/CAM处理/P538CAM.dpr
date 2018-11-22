program P538CAM;

uses
  Forms,
  pasProject in 'pasProject.pas' {Frm_CamMain},
  PasDM in 'PasDM.pas' {DM: TDataModule},
  PasQuery in 'PasQuery.pas' {FrmQuery},
  pasSetFieldName in 'pasSetFieldName.pas' {frm_SetField},
  OrderSearch in 'OrderSearch.pas' {Frm_OderSearch};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '工程CAM处理';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_CamMain, Frm_CamMain);
  Application.CreateForm(TFrm_OderSearch, Frm_OderSearch);
  Application.Run;
end.
