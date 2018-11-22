program ep190;

uses
  Forms,
  main in 'main.pas' {Form1},
  edit_limit in 'edit_limit.pas' {Form3},
  csi_search in 'csi_search.pas' {Form_csi};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '采购审批授权定义';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
