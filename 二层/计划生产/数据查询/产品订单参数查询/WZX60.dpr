program WZX60;

uses
  Forms,
  PasOrderParameter in 'PasOrderParameter.pas' {FrmOrderParameter},
  PasSetParameter in 'PasSetParameter.pas' {FrmSetParameter},
  PasPublic in 'PasPublic.pas',
  PasQuery in 'PasQuery.pas' {FrmQuery},
  pasD80_278 in 'pasD80_278.pas' {frmD80_278};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '产品订单参数查询';
  Application.CreateForm(TFrmOrderParameter, FrmOrderParameter);
  Application.Run;
end.
