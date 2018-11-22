program WZPR167;

uses
  Forms,
  Contract in 'Contract.pas' {frmContract},
  damo in 'damo.pas' {dm: TDataModule},
  condition in 'condition.pas' {frmCondition},
  Detail in 'Detail.pas' {frmDetail},
  FindRFQ in 'FindRFQ.pas' {frmFindRFQ},
  FindCust in 'FindCust.pas' {frmFindCust},
  Table2DEditFrm in 'Table2DEditFrm.pas' {frmTable2DEdit},
  Calc in 'Calc.pas',
  CalcListFrm in 'CalcListFrm.pas' {frmCalcList},
  Edit164Frm in 'Edit164Frm.pas' {frmEdit164},
  Edit317Frm in 'Edit317Frm.pas' {frmedti317},
  Edit316Frm in 'Edit316Frm.pas' {frmEdit316};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ÖÇÄÜ±¨¼Û';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmContract, frmContract);
  Application.CreateForm(TfrmCondition, frmCondition);
  Application.Run;
end.
