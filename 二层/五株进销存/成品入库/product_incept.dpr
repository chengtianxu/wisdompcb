program product_incept;

uses
  Forms,
  main in 'main.pas' {Form1},
  frm_detail in 'frm_detail.pas' {Form2},
  damo in 'damo.pas' {dm: TDataModule},
  QrySet in 'QrySet.pas' {Qry},
  delete_detail in 'delete_detail.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '成品入库明细';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TQry, Qry);
  Application.Run;
end.
