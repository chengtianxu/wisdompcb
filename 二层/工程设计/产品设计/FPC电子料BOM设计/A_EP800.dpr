program A_EP800;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {Form1},
  DM in 'DM.pas' {dm1: TDataModule},
  QuerySet in 'QuerySet.pas' {frmQuerySet},
  EditFrm in 'EditFrm.pas' {frmEdit};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'FPCµç×ÓÁÏBOM';
  Application.CreateForm(Tdm1, dm1);
  Application.CreateForm(TForm1, Form1);
//  Application.CreateForm(TfrmEdit, frmEdit);
  Application.Run;
end.
