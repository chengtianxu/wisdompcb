program Hrcertificate;

uses
  Forms,
  Main in 'Main.pas' {Frm_Main},
  dmo in 'dmo.pas' {DM: TDataModule},
  AddCertificate in 'AddCertificate.pas' {Frm_AddCertificate},
  UQuery in 'UQuery.pas' {Query_Form},
  form_Main1 in 'form_Main1.pas' {frm_Main1},
  form_Main2 in 'form_Main2.pas' {frm_Main2},
  SelectItemUnit in 'SelectItemUnit.pas' {frmSelectItem};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '员工证书';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_Main, Frm_Main);
  Application.CreateForm(TQuery_Form, Query_Form);
  Application.CreateForm(TfrmSelectItem, frmSelectItem);
  Application.Run;
end.
