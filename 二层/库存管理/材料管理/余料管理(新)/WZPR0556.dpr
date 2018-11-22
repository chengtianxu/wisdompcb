program WZPR0556;

uses
  Forms,
  main in 'main.pas' {form1},
  remain_form in 'remain_form.pas' {form_remain},
  remain_form2 in 'remain_form2.pas' {form_remain2},
  selout_form in 'selout_form.pas' {Form_selout},
  selnow_form in 'selnow_form.pas' {Form_selnow},
  Unit_catser in 'Unit_catser.pas' {Form_catser},
  damo in 'damo.pas' {dm: TDataModule},
  Unit_inser3 in 'Unit_inser3.pas' {Form_inser3},
  Unit_outser in 'Unit_outser.pas' {Form_outser},
  Unit_numin in 'Unit_numin.pas' {Form_numin},
  Unit_numout2 in 'Unit_numout2.pas' {Form_numout2},
  Unit_numcat in 'Unit_numcat.pas' {Form_numcat},
  Unit_deptser in 'Unit_deptser.pas' {Form_deptser},
  Unit_ser in 'Unit_ser.pas' {Form_ser},
  Unit_remser in 'Unit_remser.pas' {Form_remser},
  MulPrinUnit1 in 'MulPrinUnit1.pas' {MulPrinForm1},
  remaout_form2 in 'remaout_form2.pas' {Form_remaout2},
  Unit_numedit in 'Unit_numedit.pas' {Form_numedit};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '”‡¡œπ‹¿Ì';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tform1, form1);
  //Application.CreateForm(TMulPrinForm1, MulPrinForm1);
  Application.Run;
end.
