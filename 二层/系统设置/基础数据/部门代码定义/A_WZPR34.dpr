program A_WZPR34;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {dm: TDataModule},
  edit_deptcode in 'edit_deptcode.pas' {Form2},
  acct_search in 'acct_search.pas' {Form_Acct},
  deptcode_search in 'deptcode_search.pas' {Form_deptcode};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '部门代码定义';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
