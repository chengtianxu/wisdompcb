program CustPOManager;

uses
  Forms,
  main in 'main.pas' {frmMain},
  condition in 'condition.pas' {frmCondition},
  Detail in 'Detail.pas' {frmDetail};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '客户订单号码管理';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmCondition, frmCondition);
  Application.Run;
end.
