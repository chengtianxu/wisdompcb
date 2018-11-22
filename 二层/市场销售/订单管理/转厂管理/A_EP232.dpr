program A_EP232;

uses
  Forms,
  customerpart in 'customerpart.pas' {FrmCustPart},
  customersearch in 'customersearch.pas' {FrmCustSearch},
  confirm in 'confirm.pas' {FrmConfirm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '转产管理';
  Application.CreateForm(TFrmCustPart, FrmCustPart);
  Application.Run;
end.
