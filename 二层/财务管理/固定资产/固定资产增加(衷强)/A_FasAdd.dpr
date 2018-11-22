program A_FasAdd;

uses
  Forms,
  main in 'main.pas' {frmMain},
  DM in 'DM.pas' {dmcon: TDataModule},
  QuerySet in 'QuerySet.pas' {frmQuerySet},
  Detail_Edti in 'Detail_Edti.pas' {frmDetail_Edti},
  AcctSearch in 'AcctSearch.pas' {Form_Acct},
  Dlg_Curr_List in 'Dlg_Curr_List.pas' {frmDlg_Curr_List},
  Dlg_Department in 'Dlg_Department.pas' {frmDlg_Department};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '固定资产增加';
  Application.CreateForm(Tdmcon, dmcon);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
