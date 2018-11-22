program WZPR847;

uses
  Forms,
  form_Main in 'form_Main.pas' {frm_Main},
  form_DM in 'form_DM.pas' {DM: TDataModule},
  SelectItemUnit in 'SelectItemUnit.pas' {frmSelectItem},
  Statistics_unt in 'Statistics_unt.pas' {Statistics_frm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '设备管理数据评比';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_Main, frm_Main);
  Application.CreateForm(TfrmSelectItem, frmSelectItem);
  //Application.CreateForm(TStatistics_frm, Statistics_frm);
  Application.Run;
end.
