program OverWorkApply;

uses
  Forms,
  UMain in 'UMain.pas' {FrmMain},
  UDM in 'UDM.pas' {DM: TDataModule},
  Uqry in 'Uqry.pas' {FrmQry},
  UAdd in 'UAdd.pas' {FrmAdd},
  USelEMP in 'USelEMP.pas' {FrmSelEmp},
  UImport in 'UImport.pas' {FrmImport},
  UEdit in 'UEdit.pas' {FrmEdit};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '≥¨ ±º”∞‡…Í«Î';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
