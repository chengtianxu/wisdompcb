program EP052;



uses
  Forms,
  main in 'main.pas' {MAIN_Form},
  DAMO in 'DAMO.pas' {DM: TDataModule},
  condition in 'condition.pas' {condition_Form},
  locateso in 'locateso.pas' {locateso_Form},
  putprod in 'putprod.pas' {putprod_Form},
  bominvt in 'bominvt.pas' {Form_bominvt},
  Udetail in 'Udetail.pas' {Detail_Form},
  formInputDlg in 'formInputDlg.pas' {frmInputDlg},
  DisplayData_unt in 'DisplayData_unt.pas' {DisplayData_frm},
  ProdBOM_unt in 'ProdBOM_unt.pas' {ProdBOM_frm},
  Detailed_unt in 'Detailed_unt.pas' {Detailed_frm},
  Detailed1_unt in 'Detailed1_unt.pas' {Detailed1_frm},
  UPHourEdit in 'UPHourEdit.pas' {frmPHourEdit};

//  common;

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '投产管理';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMAIN_Form, MAIN_Form);
  Application.CreateForm(Tcondition_Form, condition_Form);
  Application.Run;
  {  if not App_init_2(dm.ADOConnection1) then
    showmsg('程序起动失败请联系管理员!',1)
  else
  begin
    Application.CreateForm(TMAIN_Form, MAIN_Form);
    Application.CreateForm(Tcondition_Form, condition_Form);
    Application.Run;
  end;
}
end.
