program WZPR037;

uses
  Forms,
  main in 'main.pas' {Form1},
  demo in 'demo.pas' {dm: TDataModule},
  detail in 'detail.pas' {Form2},
  deptcode_search in 'deptcode_search.pas' {Form_deptcode},
  form_remark in 'form_remark.pas' {remark};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '标准子部件定义';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
