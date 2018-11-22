program employeemsg_public;

uses
  Forms,
  UMain in 'UMain.pas' {Main_Form},
  UDM in 'UDM.pas' {DM: TDataModule},
  UDetail in 'UDetail.pas' {Detail_Form},
  UQuery in 'UQuery.pas' {Query_Form},
  UQueDep in 'UQueDep.pas' {QueDep_Form},
  rpt_model in 'rpt_model.pas' {FrmModel};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '员工公共信息';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMain_Form, Main_Form);
  Application.CreateForm(TQuery_Form, Query_Form);
  Application.Run;
end.
