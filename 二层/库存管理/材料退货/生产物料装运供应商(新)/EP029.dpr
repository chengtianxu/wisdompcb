program EP029;

uses
  Forms,
  Form in 'Form.pas' {Form1},
  DM in 'DM.pas' {F_DM: TDataModule},
  FM_Condition in 'FM_Condition.pas' {Condition},
  Frm_Shipping in 'Frm_Shipping.pas' {F_Shipping},
  FM_report in 'FM_report.pas' {Form_report};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '装运到供应商';
  Application.CreateForm(TF_DM, F_DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TCondition, Condition);
  Application.Run;
end.
