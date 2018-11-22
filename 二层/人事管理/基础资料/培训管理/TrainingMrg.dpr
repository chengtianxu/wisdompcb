program TrainingMrg;

uses
  Forms,
  UMain in 'UMain.pas' {frmMain},
  Uedit in 'Uedit.pas' {frmEdit},
  UDM in 'UDM.pas' {DM: TDataModule},
  UQry in 'UQry.pas' {FrmQry},
  UImport in 'UImport.pas' {frmImport},
  USigne in 'USigne.pas' {frmSigne},
  Uedit2 in 'Uedit2.pas' {frmEdit2},
  UQry2 in 'UQry2.pas' {FrmQry2},
  UEdit3 in 'UEdit3.pas' {frmEdit3},
  UQry3 in 'UQry3.pas' {frmQry3},
  USelEmp in 'USelEmp.pas' {frmSelEmp},
  SelTClass2 in 'SelTClass2.pas' {frmSelTClass2},
  UToPlans in 'UToPlans.pas' {frmToPlans},
  UImport3 in 'UImport3.pas' {frmImport3},
  UQry456 in 'UQry456.pas' {frmQry456},
  USelNewEmp in 'USelNewEmp.pas' {frmSelNewEmp},
  UEdit4 in 'UEdit4.pas' {frmEdit4},
  Uqry5 in 'Uqry5.pas' {frmqry5},
  UImport5 in 'UImport5.pas' {frmImport5},
  UImport4 in 'UImport4.pas' {frmImport4},
  UExam in 'UExam.pas' {frmExam},
  UImport22 in 'UImport22.pas' {frmImport22},
  UPaperDetail in 'UPaperDetail.pas' {frmPaperDetail};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '≈‡—µπ‹¿Ì';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmImport5, frmImport5);
  Application.CreateForm(TfrmImport4, frmImport4);
  Application.CreateForm(TfrmExam, frmExam);
  Application.CreateForm(TfrmImport22, frmImport22);
  Application.CreateForm(TfrmPaperDetail, frmPaperDetail);
  Application.Run;
end.


