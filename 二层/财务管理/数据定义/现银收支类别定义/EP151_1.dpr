program EP151_1;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {dm: TDataModule},
  EditItem2 in 'EditItem2.pas' {FrmEditItem2},
  EditItem1 in 'EditItem1.pas' {FrmEditItem1},
  QrySet in 'QrySet.pas' {Qry},
  QrySet1 in 'QrySet1.pas' {Qry1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '现银账户和收入支出定义';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrmEditItem2, FrmEditItem2);
  Application.CreateForm(TFrmEditItem1, FrmEditItem1);
  Application.CreateForm(TQry, Qry);
  Application.CreateForm(TQry1, Qry1);
  Application.Run;
end.
