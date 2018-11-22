program A_WZCX451;

uses
  Forms,
  ProgressBar in 'ProgressBar.pas' {FrmProgress},
  uMain in 'uMain.pas' {frmMain},
  uMD in 'uMD.pas' {DM: TDataModule},
  uShow in 'uShow.pas' {frmShow},
  uWoShow in 'uWoShow.pas' {FrmWoShow},
  lining_cost in 'lining_cost.pas' {Form_lining},
  Unit_lot in 'Unit_lot.pas' {Form_lot},
  Unit_lotmb1 in 'Unit_lotmb1.pas' {Form_lotmb1},
  Unit_lotmb2 in 'Unit_lotmb2.pas' {Form_lotmb2},
  Unit_lotmb3 in 'Unit_lotmb3.pas' {Form_lotmb3},
  QuerySet in 'QuerySet.pas' {frmQuerySet},
  shipcost in 'shipcost.pas' {frm_shipcost},
  DetailFrm in 'DetailFrm.pas' {Frm_detail};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '³É±¾·ÖÎö';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TFrm_detail, Frm_detail);
  Application.Run;
end.
