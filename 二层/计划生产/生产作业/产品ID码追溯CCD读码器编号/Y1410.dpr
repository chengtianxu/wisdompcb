program Y1410;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  PasDM in 'PasDM.pas' {DM: TDataModule},
  PasEditCCD in 'PasEditCCD.pas' {Form2},
  PasQuery in 'PasQuery.pas' {FrmQuery};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'CCD¶ÁÂëÆ÷±àºÅ';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
