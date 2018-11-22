program A_EP1341;

uses
  Forms,
  Main in 'Main.pas' {Frm_Main},
  Customer in 'Customer.pas' {Frm_Customer},
  dmo in 'dmo.pas' {DM: TDataModule},
  Result in 'Result.pas' {Frm_Result},
  Search in 'Search.pas' {frm_Search};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '客户对帐单查询(新)';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_Main, Frm_Main);
  Application.Run;
end.
