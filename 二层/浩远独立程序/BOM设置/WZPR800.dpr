program WZPR800;

uses
  Forms,
  DM_unt in '..\..\Comm_1(D7)\DM_unt.pas' {DM_frm: TDataModule},
  BOM_unt in 'BOM_unt.pas' {BOM_frm};

{$R *.res}

begin
  Application.Initialize;
 // Application.MainFormOnTaskbar := True;
  Application.Title := 'BOM…Ë÷√';
  Application.CreateForm(TDM_frm, DM_frm);
  Application.CreateForm(TBOM_frm, BOM_frm);
  Application.Run;
end.
