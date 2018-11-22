program EP009;

uses
  Forms,
  units in 'units.pas' {fm_unit},
  mad in 'mad.pas' {fm_mad},
  demo in 'demo.pas' {fm_demo: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '单位代码定义';
  Application.CreateForm(Tfm_demo, fm_demo);
  Application.CreateForm(Tfm_unit, fm_unit);
  Application.CreateForm(Tfm_mad, fm_mad);
  Application.Run;
end.
