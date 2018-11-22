program WZPR569;

uses
  Forms,
  main in 'main.pas' {Form1},
  DAMO in 'DAMO.pas' {DM: TDataModule},
  formula in 'formula.pas' {Form_formula};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '工序产值物料消耗计算公式';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
