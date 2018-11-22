program product_issue;

uses
  Forms,
  main in 'main.pas' {Form1},
  frm_detail in 'frm_detail.pas' {Form2},
  QrySet in 'QrySet.pas' {Qry},
  damo in 'damo.pas' {dm: TDataModule},
  delete_detail in 'delete_detail.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '成品出仓明细';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TQry, Qry);
  Application.Run;
end.
