program WZPR529;

uses
  Forms,
  Main in 'Main.pas' {Form_Main},
  Demo in 'Demo.pas' {DM: TDataModule},
  PackList in 'PackList.pas' {Form_PackList},
  PackSearch in 'PackSearch.pas' {Form_PackSearch},
  ShipAddress in 'ShipAddress.pas' {Form_ShipAddress},
  EditNote in 'EditNote.pas' {Form_EditNote},
  Customer in 'Customer.pas' {Form_Customer},
  Condition in 'Condition.pas' {Form_Condition},
  AdviceReport in 'AdviceReport.pas' {Form_Report},
  TotalPrint in 'TotalPrint.pas' {Form_TotalPrint};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '发货通知单';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_Main, Form_Main);
  Application.Run;
end.
