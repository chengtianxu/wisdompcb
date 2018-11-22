program employeemsg;

uses
  Forms,
  UMain in 'UMain.pas' {Main_Form},
  UDM in 'UDM.pas' {DM: TDataModule},
  UDetail in 'UDetail.pas' {Detail_Form},
  UQuery in 'UQuery.pas' {Query_Form},
  UQueDep in 'UQueDep.pas' {QueDep_Form},
  rpt_model in 'rpt_model.pas' {FrmModel},
  empChange in 'empChange.pas' {FrmEmpChange},
  AdviceReport in 'AdviceReport.pas' {Form_Report};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '员工信息';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMain_Form, Main_Form);
  Application.CreateForm(TQuery_Form, Query_Form);
  Application.CreateForm(TForm_Report, Form_Report);
  Application.Run;
end.
