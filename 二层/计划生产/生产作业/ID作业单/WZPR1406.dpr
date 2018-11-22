program WZPR1406;



uses
  Forms,
  DM_unt in '..\..\..\Comm_1(D7)\DM_unt.pas' {DM_frm: TDataModule},
  WorkOrder_unt in 'WorkOrder_unt.pas' {WorkOrder_frm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ID×÷Òµµ¥';
  Application.CreateForm(TDM_frm, DM_frm);
  Application.CreateForm(TWorkOrder_frm, WorkOrder_frm);
  Application.Run;
end.
