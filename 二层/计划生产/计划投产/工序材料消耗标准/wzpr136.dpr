program wzpr136;

uses
  Forms,
  MainUnit in 'MainUnit.pas' {FrmMain},
  DataModuleUnit in 'DataModuleUnit.pas' {DM: TDataModule},
  InputUnit in 'InputUnit.pas' {FrmInput},
  IF_Unit1 in 'IF_Unit1.pas' {If_Form1},
  Frm_detailEdt_u in 'Frm_detailEdt_u.pas' {Frm_detailEdt},
  UInv_S in 'UInv_S.pas' {Inv_form},
  Udep_S in 'Udep_S.pas' {dep_form};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '工序材料消耗标准';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TIf_Form1, If_Form1);
  Application.Run;
end.

