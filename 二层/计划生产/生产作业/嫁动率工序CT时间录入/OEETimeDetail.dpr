program OEETimeDetail;

uses
  Forms,
  UDM in 'UDM.pas' {DM: TDataModule},
  UTimeDetail in 'UTimeDetail.pas' {FrmTimeDetail},
  UAdd in 'UAdd.pas' {FrmAdd},
  UQry in 'UQry.pas' {FrmQry},
  UImport in 'UImport.pas' {FrmImport};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'OEE工序CT时间录入';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmTimeDetail, FrmTimeDetail);
  Application.Run;
end.
