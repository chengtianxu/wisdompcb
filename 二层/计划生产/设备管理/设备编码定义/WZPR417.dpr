program WZPR417;

uses
  Forms,
  Main in 'Main.pas' {Frm_Main},
  dmo in 'dmo.pas' {DM: TDataModule},
  addEquipment in 'addEquipment.pas' {Frm_addEquipment},
  dept in 'dept.pas' {Frm_dept},
  addDetail in 'addDetail.pas' {Frm_addDetail},
  units in 'units.pas' {Frm_units},
  Search in 'Search.pas' {Frm_Search},
  employee in 'employee.pas' {Frm_employee},
  MaintenanceLog in 'MaintenanceLog.pas' {Frm_MaintenanceLog},
  ChangeLog in 'ChangeLog.pas' {Frm_ChangeLog},
  formMultiSelectedItem in 'formMultiSelectedItem.pas' {frmMultiSelectedItem},
  SelectItemUnit in 'SelectItemUnit.pas' {frmSelectItem};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '设备代码定义';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_Main, Frm_Main);
  Application.Run;
end.
