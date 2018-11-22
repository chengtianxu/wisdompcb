program WZPR0492_cdx;

{%ToDo 'WZPR0492_cdx.todo'}

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  condition in 'condition.pas' {Form_condition},
  deptinfo in 'deptinfo.pas' {Form_deptinfo},
  mrb_remark in 'mrb_remark.pas' {Form_MRBREMARK},
  mrb_reworked in 'mrb_reworked.pas' {Form_MRBREWORKED},
  bomview in 'bomview.pas' {Form_bomview},
  salesorder_planned in 'salesorder_planned.pas' {Form_salesorder},
  editplanned in 'editplanned.pas' {Form_editplanned},
  putprod in 'putprod.pas' {Form_putprod},
  bominvt in 'bominvt.pas' {Form_bominvt},
  warehouse in 'warehouse.pas' {Form_warehouse},
  cancelcutno in 'cancelcutno.pas' {Form_cancelcutno},
  uQnty in 'uQnty.pas' {frmQnty},
  MIStepFrm in 'MIStepFrm.pas' {frmMIStep},
  spell in 'spell.pas' {Form_spell};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '投产管理';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm_condition, Form_condition);
  Application.Run;
end.
