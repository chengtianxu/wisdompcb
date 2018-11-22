program WZPR008;

uses
  Forms,
  main in 'main.pas' {FrmMain},
  Datamodule in 'Datamodule.pas' {DM: TDataModule},
  Unit2 in 'Unit2.pas' {Form2},
  grp_search in 'grp_search.pas' {FrmGrp},
  Employee_search in 'Employee_search.pas' {FrmEmployeeSearch},
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '用户权限管理';
  Application.CreateForm(TDM, DM);  
  Application.CreateForm(TFrmMain, FrmMain);

  Application.Run;
end.
