program OutInBedRoomMsg;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {FrmMain},
  DM in 'DM.pas' {damo: TDataModule},
  OutInInfoFrm in 'OutInInfoFrm.pas' {FrmOutInInfo},
  UpInDate in 'UpInDate.pas' {FrmIndate},
  UpOutDate in 'UpOutDate.pas' {FrmOutdate},
  WInfo in 'WInfo.pas' {FrmWInfo},
  common in 'common.pas',
  Pick_Item_Single in 'Pick_Item_Single.pas' {frmPick_Item_Single};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '搬入搬出管理';
  Application.CreateForm(Tdamo, damo);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TfrmPick_Item_Single, frmPick_Item_Single);
  Application.Run;
end.
