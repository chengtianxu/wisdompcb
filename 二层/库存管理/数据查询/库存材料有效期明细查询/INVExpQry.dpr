program INVExpQry;

uses
  Forms,
  UMain in 'UMain.pas' {FrmMain},
  UDM in 'UDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '库存材料有效期明细查询';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
