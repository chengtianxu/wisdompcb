program A_ep078;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  dispost in 'dispost.pas' {Form2},
  edit_rej in 'EDIT_REJ.PAS' {Form3},
  rej_search in 'rej_search.pas' {Form_rej},
  p_shipment in 'p_shipment.pas' {F_shipment},
  report_mrb in 'report_mrb.pas' {Form_report};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '退货成品检视板';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
