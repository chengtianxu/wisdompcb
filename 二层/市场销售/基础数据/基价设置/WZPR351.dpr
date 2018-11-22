program WZPR351;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  uDM in 'uDM.pas' {DM: TDataModule},
  uEditGY in 'uEditGY.pas' {frmEditGY},
  uBaseGY in 'uBaseGY.pas' {frmBaseGY},
  Pick_Item_Single in '..\..\..\..\程序公共单位\Pick_Item_Single.pas' {frmPick_Item_Single};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '基本价格设置';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmPick_Item_Single, frmPick_Item_Single);
  Application.Run;
end.
