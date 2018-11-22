program WZPR417;

uses
  Forms,
  main in 'main.pas' {frm_Main},
  damo in 'damo.pas' {DM: TDataModule},
  QuerySet in 'QuerySet.pas' {frmQuerySet},
  addEquipment in 'addEquipment.pas' {Frm_addEquipment},
  MultiSelectItem in 'MultiSelectItem.pas' {frm_MultiSelectItem},
  MaintenanceLog in 'MaintenanceLog.pas' {Frm_MaintenanceLog},
  ChangeLog in 'ChangeLog.pas' {Frm_ChangeLog},
  MaterielFrm in 'MaterielFrm.pas' {Frm_Materiel};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '设备代码定义';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_Main, frm_Main);
  Application.CreateForm(TfrmQuerySet, frmQuerySet);
  Application.Run;
end.
