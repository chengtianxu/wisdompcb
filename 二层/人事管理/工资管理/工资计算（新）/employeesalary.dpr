program employeesalary;

uses
  Forms,
  UMain in 'UMain.pas' {FrmMain},
  UDM in 'UDM.pas' {DM: TDataModule},
  Uqry in 'Uqry.pas' {FrmQry},
  Uimport in 'Uimport.pas' {FrmImport},
  Umodel in 'Umodel.pas' {FrmModel},
  UDB in 'UDB.pas' {FrmDB};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '¹¤×Ê¼ÆËã';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmModel, FrmModel);
  Application.CreateForm(TFrmDB, FrmDB);
  Application.CreateForm(TFrmQry, FrmQry);
  Application.Run;
end.
