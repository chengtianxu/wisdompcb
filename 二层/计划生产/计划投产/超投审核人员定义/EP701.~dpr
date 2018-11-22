program EP701;

uses
  Forms,
  main in 'main.pas' {frmMain},
  demo in 'demo.pas' {DM: TDataModule},
  authorize_edit in 'authorize_edit.pas' {frmAuthorize_Edit},
  condition in 'condition.pas' {condition_form};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '超投审批人员定义';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(Tcondition_form, condition_form);
  Application.Run;
end.
