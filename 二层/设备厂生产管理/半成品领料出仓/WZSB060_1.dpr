program WZSB060_1;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {FrmMain},
  UnitDataModal in 'UnitDataModal.pas' {DM: TDataModule},
  UnitPutOut in 'UnitPutOut.pas' {FrmPutOut},
  UnitProdStock in 'UnitProdStock.pas' {FrmProdStock},
  UnitPutOutDetail in 'UnitPutOutDetail.pas' {FrmPutoutDetail},
  UnitReturnDetail in 'UnitReturnDetail.pas' {FrmReturnDetail};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '半成品领料出仓';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.

