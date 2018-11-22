program WZPR0686;

uses
  Forms,
  UMain in 'UMain.pas' {Main_form},
  UDM in 'UDM.pas' {DM: TDataModule},
  UAdEd in 'UAdEd.pas' {AdEd_form};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMain_form, Main_form);
  Application.Run;
end.
