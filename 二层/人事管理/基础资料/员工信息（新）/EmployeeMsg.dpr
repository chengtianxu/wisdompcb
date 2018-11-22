program EmployeeMsg;

uses
  Forms,
  Mainfrm in 'Mainfrm.pas' {FrmMain},
  UDM in 'UDM.pas' {FDM: TDataModule},
  UModel in 'UModel.pas' {FrmModel},
  UDetailfrm in 'UDetailfrm.pas' {FrmDetail},
  UEmpChange in 'UEmpChange.pas' {FrmEmpChange},
  UQry in 'UQry.pas' {FrmQry},
  UFrmReport in 'UFrmReport.pas' {FrmReport},
  UDepQry in 'UDepQry.pas' {FrmDepQry},
  UIDCardDes in 'UIDCardDes.pas' {FrmIDcardDes},
  UExpDetail in 'UExpDetail.pas' {FrmExpDetail},
  UAlert in 'UAlert.pas' {FrmAlert},
  UPulishment in 'UPulishment.pas' {frmPulishment},
  UPrtBCode in 'UPrtBCode.pas' {frmPrtBCode},
  UOldInfo in 'UOldInfo.pas' {frmOldInfo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '员工信息';
  Application.CreateForm(TFDM, FDM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.

