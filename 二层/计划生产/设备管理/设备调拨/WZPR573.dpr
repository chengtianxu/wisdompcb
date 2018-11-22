program WZPR573;

uses
  Forms,
  Main in 'Main.pas' {Frm_Main},
  dmo in 'dmo.pas' {DM: TDataModule},
  addequipment in 'addequipment.pas' {Frm_addequipment},
  Pick_Item_Single in 'D:\vss_lyh\程序公共单位\Pick_Item_Single.pas' {frmPick_Item_Single},
  common in 'D:\vss_lyh\程序公共单位\common.pas',
  Search in 'Search.pas' {Frm_Search};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '设备调拨处理';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_Main, Frm_Main);
  Application.Run;
end.
