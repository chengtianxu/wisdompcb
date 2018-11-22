program P538YS;

uses
  Forms,
  pasProject in 'pasProject.pas' {Frm_YsMain},
  PasDM in 'PasDM.pas' {DM: TDataModule},
  PasQuery in 'PasQuery.pas' {FrmQuery},
  pasSetFieldName in 'pasSetFieldName.pas' {frm_SetField},
  OrderSearch in 'OrderSearch.pas' {Frm_OderSearch};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'π§≥Ã‘§…Û';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_YsMain, Frm_YsMain);
  Application.CreateForm(TFrm_OderSearch, Frm_OderSearch);
  Application.Run;
end.
