program WZCP729;

uses
  Forms,
  Main in 'Main.pas' {FrmMain},
  unionCon in 'unionCon.pas' {FrmunionCon},
  DM in 'DM.pas' {Damo: TDataModule},
  Pick_WorkShop in 'Pick_WorkShop.pas' {frmPick_WorkShop},
  TS in 'TS.pas' {FrmTS},
  HistoryMain in 'HistoryMain.pas' {FrmHistory},
  Rept in 'Rept.pas' {FrmRep},
  UDay in 'UDay.pas' {FrmUDay},
  SetHoliday in 'SetHoliday.pas' {FrmHoliday};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '产能品质汇总统计';
  Application.CreateForm(TDamo, Damo);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmHoliday, FrmHoliday);
  Application.Run;
end.
