program EmpSalary;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {FrmMain},
  FrmEmpSalary in 'FrmEmpSalary.pas' {SalaryFrm},
  damo in 'damo.pas' {DM: TDataModule},
  ExcelFrm in 'ExcelFrm.pas' {FrmExcel},
  UQuery in 'UQuery.pas' {Query_Form},
  u_hideitem in 'u_hideitem.pas' {frm_hideitem};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Ð½×Êµµ°¸';
  Application.HelpFile := '';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TQuery_Form, Query_Form);
  Application.Run;
end.
