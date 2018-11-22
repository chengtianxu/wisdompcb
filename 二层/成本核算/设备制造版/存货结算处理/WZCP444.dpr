program WZCP444;

uses
  Forms,
  ProgressBar in 'ProgressBar.pas' {FrmProgress},
  uShowWIP in 'uShowWIP.pas' {frmshowWIP},
  uEditFG in 'uEditFG.pas' {frmEditFG},
  uEditMAT in 'uEditMAT.pas' {frmEditMat},
  uEditWIP in 'uEditWIP.pas' {frmEditWIP},
  ufrmClose in 'ufrmClose.pas' {frmClose},
  uMain in 'uMain.pas' {FrmMain},
  uShowFG in 'uShowFG.pas' {frmshowFG},
  uShowMat in 'uShowMat.pas' {frmshowMat},
  uDM in 'uDM.pas' {DM: TDataModule},
  Unit_sercode in 'Unit_sercode.pas' {Form_Sercode},
  inv_serach in 'inv_serach.pas' {form_inv},
  wip_invt in 'wip_invt.pas' {Form_wipinvt},
  enter_wipinvt in 'enter_wipinvt.pas' {Form_entinvt},
  findUnit1 in 'findUnit1.pas' {findForm1},
  findUnit2 in 'findUnit2.pas' {findForm4};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '存货结算处理';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
