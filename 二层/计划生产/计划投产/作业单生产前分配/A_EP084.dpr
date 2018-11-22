program A_EP084;

uses
  Forms,
  main in 'main.pas' {frmMain},
  uDM in 'uDM.pas' {DM: TDataModule},
  Qnty in 'Qnty.pas' {frmQnty};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '作业单生产前分配';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
