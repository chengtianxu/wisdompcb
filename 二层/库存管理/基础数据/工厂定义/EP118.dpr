program EP118;

uses
  Forms,
  main in 'main.pas' {Form1},
  edit_warehouse in 'edit_warehouse.pas' {Form2},
  empl_search in 'empl_search.pas' {FrmEmployeeSearch};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '工厂定义';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
