program DrillReport;

uses
  Forms,
  Pas_Main in 'Pas_Main.pas' {Frm_Main},
  DM in 'DM.pas' {TDM: TDataModule},
  Pas_DrillMain in 'Pas_DrillMain.pas' {Frm_DrillMain},
  Pas_InventoryCorrect in 'Pas_InventoryCorrect.pas' {Frm_InventoryCorrect};
//  PasJiTai in 'PasJiTai.pas' {frmJiTai};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '×ê¾×ÔÂÄ©Æ½ºâ±í';
  Application.CreateForm(TTDM, TDM);
  Application.CreateForm(TFrm_DrillMain, Frm_DrillMain);
//  Application.CreateForm(TfrmJiTai, frmJiTai);
  Application.Run;
end.
