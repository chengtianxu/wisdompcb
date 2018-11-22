program PP_734;

uses
  Forms,
  PPget in 'PPget.pas' {frmPPget},
  PasDM in 'PasDM.pas' {DM: TDataModule},
  PasGetPPShow in 'PasGetPPShow.pas' {Form2},
  PPgetLoss in 'PPgetLoss.pas' {frmgetLoss},
  PasQuery in 'PasQuery.pas' {FrmQuery};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'PP¡Ï”√√˜œ∏';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
