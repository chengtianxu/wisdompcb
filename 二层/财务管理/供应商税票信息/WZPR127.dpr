program WZPR127;

uses
  Forms,
  main in 'main.pas' {Form_Main},
  common in 'D:\vss_lyh\程序公共单位\common.pas',
  Seach in 'Seach.pas' {Form_Seach},
  Supplier in 'Supplier.pas' {Form_Supplier},
  dmo in 'dmo.pas' {DM: TDataModule},
  Add in 'Add.pas' {Form_Add};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '供应商税票信息';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_Main, Form_Main);
  Application.Run;
end.
