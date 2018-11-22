program wzcp85;

uses
  Forms,
  MainFrm in 'MainFrm.pas' {frmMain},
  Damo in 'Damo.pas' {DM: TDataModule},
  AddFrm in 'AddFrm.pas' {FrmAdd},
  PartNumberPrice in 'PartNumberPrice.pas' {FrmNumberPrice},
  QueFrm in 'QueFrm.pas' {FrmQue},
  apprvFrm in 'apprvFrm.pas' {frmApprv},
  PPReportFrm in 'PPReportFrm.pas' {FrmReport};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '快速报价';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TFrmQue, FrmQue);
  Application.Run;
end.
