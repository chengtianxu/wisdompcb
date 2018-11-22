program WZPR164;
{$R 'CallerResource.res' 'CallerResource.rc'}
uses
  Forms,
  RFQ in 'RFQ.pas' {frmRFQ},
  damo in 'damo.pas' {dm: TDataModule},
  condition in 'condition.pas' {Form_condition},
  SetParam in 'SetParam.pas' {frmSetParam},
  EditParam in 'EditParam.pas' {frmEditParam},
  RFQInfo in 'RFQInfo.pas' {frmRFQInfo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'RFQµµ∞∏π‹¿Ì';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmRFQ, frmRFQ);
  Application.CreateForm(TForm_condition, Form_condition);
  Application.Run;
end.
