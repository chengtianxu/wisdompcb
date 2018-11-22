program PCBJointLayout;

uses
  Forms,
  main in 'main.pas' {frmMain},
  uDM in 'uDM.pas' {DM: TDataModule},
  ParamSet in 'ParamSet.pas' {frmParamSet},
  term in 'term.pas' {Form_condition},
  cust_search in 'cust_search.pas' {Frm_Cust},
  employee_search in 'employee_search.pas' {Form_employee},
  uQnty in 'uQnty.pas' {frmQnty};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ºÏÆ´';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TForm_condition, Form_condition);
  Application.Run;
end.
