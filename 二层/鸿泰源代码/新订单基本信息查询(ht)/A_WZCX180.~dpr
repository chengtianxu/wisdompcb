program A_WZCX180;

uses
  Forms,
  uMain in 'uMain.pas' {frmMain},
  uDM in 'uDM.pas' {DM: TDataModule},
  uCondition in 'uCondition.pas' {frmCondition},
  uCostom in 'uCostom.pas' {frmCostom},
  uEmployee in 'uEmployee.pas' {frmEmployee},
  Report1 in 'Report1.pas' {FrmReport1},
  Report3 in 'Report3.pas' {FrmReport3},
  Report2 in 'Report2.pas' {FrmReport2},
  uTotalChart in 'uTotalChart.pas' {frmTotalChart},
  form_SetField in 'form_SetField.pas' {frm_SetField},
  Unit1 in 'C:\Users\Administrator\Desktop\Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '订单基本信息查询';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(Tfrm_SetField, frm_SetField);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
