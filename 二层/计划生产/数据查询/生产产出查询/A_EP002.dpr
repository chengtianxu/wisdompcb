program A_EP002;

uses
  Forms,
  main_group in 'main_group.pas' {Form_group},
  term in 'term.pas' {Form_condition},
  prodcode_search in 'prodcode_search.pas' {Form_prodcode},
  deptcode_search in 'deptcode_search.pas' {Form_deptcode},
  product in 'product.pas' {Form_product},
  total_groupdayout in 'total_groupdayout.pas' {Form_groupdayout},
  total_daytimeoutgroup in 'total_daytimeoutgroup.pas' {Form_daytimegroup},
  main in 'main.pas' {Form1},
  total_dayout in 'total_dayout.pas' {Form2},
  total_daytimeout in 'total_daytimeout.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '工序生产产出查询';
  Application.CreateForm(TForm_condition, Form_condition);
  Application.Run;
end.
