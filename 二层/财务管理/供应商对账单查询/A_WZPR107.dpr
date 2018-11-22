program A_WZPR107;

uses
  Forms,
  Main in 'Main.pas' {Frm_Main},
  dmo in 'dmo.pas' {DM: TDataModule},
  Supplier in 'Supplier.pas' {Frm_Supplier},
  Result in 'Result.pas' {Frm_Result},
  common in 'D:\vss_lyh\程序公共单位\common.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '供应商对帐单查询';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_Main, Frm_Main);
  Application.CreateForm(TFrm_Supplier, Frm_Supplier);
  Application.CreateForm(TFrm_Result, Frm_Result);
  Application.Run;
end.
