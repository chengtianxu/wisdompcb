program Employee_Train;

uses
  Forms,
  Main in 'Main.pas' {Frm_Main},
  dmo in 'dmo.pas' {DM: TDataModule},
  InsertTrain in 'InsertTrain.pas' {Frm_InsertTrain},
  UQuery in 'UQuery.pas' {Query_Form},
  PasQuery in 'PasQuery.pas' {FrmQuery},
  PasPublic in 'PasPublic.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '‘±π§≈‡—µ';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_Main, Frm_Main);
  Application.Run;
end.
