program EP303;

uses
  Forms,
  Main in 'Main.pas' {Frm_main},
  damo in 'damo.pas' {DM: TDataModule},
  QuerySet in 'QuerySet.pas' {frmQuerySet},
  pasSetFieldName in 'pasSetFieldName.pas' {frmSetFieldName},
  detail in 'detail.pas' {Frm_detail},
  return_quan in 'return_quan.pas' {frm_return_quan},
  marej in 'marej.pas' {frm_marej};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '退货给供应商(非生产物料采购单)';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_main, Frm_main);
  Application.CreateForm(TfrmQuerySet, frmQuerySet);
  Application.Run;
end.
