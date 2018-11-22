program A_EP131;

uses
  Forms,
  Main in 'Main.pas' {Frm_Main},
  dmo in 'dmo.pas' {DM: TDataModule},
  Customer in 'Customer.pas' {Frm_Customer},
  Result in 'Result.pas' {Frm_Result},
  common in '..\..\..\程序公共单位\common.pas',
  Search in 'Search.pas' {Frm_Search};

{$R *.res}

begin
  Application.Initialize;
  Application.Title:='客户税票信息查询';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrm_Main, Frm_Main);
  Application.CreateForm(TFrm_Result, Frm_Result);
  Application.CreateForm(TFrm_Search, Frm_Search);
  Application.Run;
end.
