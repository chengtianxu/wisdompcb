program A_EP081_WF;

uses
  Forms,
  main in '..\手工外发过数\main.pas' {frmMain},
  DM in '..\手工外发过数\DM.pas' {dmcon: TDataModule},
  WO_Count in '..\手工外发过数\WO_Count.pas' {frmWO_Count},
  Dlg_WO_Qty in '..\手工外发过数\Dlg_WO_Qty.pas' {frmDlg_WO_Qty};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '手工外发过数';
  Application.CreateForm(Tdmcon, dmcon);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
