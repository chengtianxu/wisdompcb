program WZCX85;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  uDM in 'uDM.pas' {DM: TDataModule},
  uCondition in 'uCondition.pas' {frmCondition},
  uCostom in 'uCostom.pas' {frmCostom},
  uEmployee in 'uEmployee.pas' {frmEmployee},
  uProduct in 'uProduct.pas' {frmProduct};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '报价折率分析';
  Application.CreateForm(TDM, DM);  
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
