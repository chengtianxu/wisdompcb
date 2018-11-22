program ComplainOnline;

uses
  Forms,
  UMain in 'UMain.pas' {frmComplaintOnline},
  UDM in 'UDM.pas' {DM: TDataModule},
  UPrint in 'UPrint.pas' {frmPrint},
  UQry in 'UQry.pas' {frmQry},
  UEdit in 'UEdit.pas' {frmEdit},
  BMListFrm in 'BMListFrm.pas' {frmBMList};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '在线品质投诉处理';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmComplaintOnline, frmComplaintOnline);
  Application.Run;
end.
