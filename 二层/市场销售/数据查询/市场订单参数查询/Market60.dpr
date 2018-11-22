program Market60;

uses
  Forms,
  PasOrderParameter in 'PasOrderParameter.pas' {FrmOrderParameter},
  PasSetParameter in 'PasSetParameter.pas' {FrmSetParameter},
  PasQuery in 'PasQuery.pas' {FrmQuery},
  pasD80_278 in 'pasD80_278.pas' {frmD80_278},
  PasDM in 'PasDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '市场订单参数查询';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmOrderParameter, FrmOrderParameter);
  Application.CreateForm(TFrmQuery, FrmQuery);
  Application.Run;
end.
