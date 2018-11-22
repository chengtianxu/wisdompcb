program EP060;

uses
  Forms,
  main in 'MAIN.PAS' {Form1},
  editgroup in 'editgroup.pas' {Form2},
  dpment_search in 'dpment_search.pas' {Form_dept},
  parameter in 'parameter.pas' {FrmParameter};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '产品组别';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
