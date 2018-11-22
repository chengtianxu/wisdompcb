program ep198;

uses
  Forms,
  main in 'main.pas' {Form1},
  history_sql in 'history_sql.pas' {Form2},
  odbc_data in 'odbc_data.pas' {Form3},
  save_sql in 'save_sql.pas' {Form_savesql};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '数据导出';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
