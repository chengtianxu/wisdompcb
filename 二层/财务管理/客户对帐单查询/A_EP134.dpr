program A_EP134;

uses
  Forms,
  Main in 'Main.pas' {FrmMain},
  customersearch in 'customersearch.pas' {FrmCustSearch},
  Report3 in 'Report3.pas' {FrmReport3},
  Datail3 in 'Datail3.pas' {FrmDetail3},
  Report6 in 'Report6.pas' {FrmReport6},
  Report4 in 'Report4.pas' {FrmReport4},
  Report5 in 'Report5.pas' {FrmReport5};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '客户对帐单查询';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmCustSearch, FrmCustSearch);
  Application.Run;
end.
