program WZCX578;

uses
  Forms,
  PasQuery578 in 'PasQuery578.pas' {FrmQuery578},
  PasDM in 'PasDM.pas' {DM: TDataModule},
  PasShow578 in 'PasShow578.pas' {FrmShow578},
  PasShipment578 in 'PasShipment578.pas' {FrmShipment578},
  PasReturn in 'PasReturn.pas' {FrmReturn},
  PasReceipts114 in 'PasReceipts114.pas' {FrmReceipts};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '订单价格分类查询';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmQuery578, FrmQuery578);
  Application.Run;
end.
