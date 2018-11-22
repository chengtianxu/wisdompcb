program WZPR0492_1;

uses
  Forms,
  MainUNIT1 in 'MainUNIT1.pas' {MainForm1},
  DmUnit1 in 'DmUnit1.pas' {DM: TDataModule},
  IF_Unit1 in 'IF_Unit1.pas' {If_Form1},
  EditBom in 'EditBom.pas' {FrmEditBom},
  TReport in 'TReport.pas' {FrmReport},
  MulPrinUnit1 in 'MulPrinUnit1.pas' {MulPrinForm1},
  bominvt in 'bominvt.pas' {Form_bominvt},
  Pick_Item_Single2 in 'Pick_Item_Single2.pas' {frmPick_Item_Single2},
  CutViewFrm in 'CutViewFrm.pas' {frmCutView},
  Ubom in 'Ubom.pas' {Form_bom},
  Ubommx in 'Ubommx.pas' {Form_shomx},
  Uallmx in 'Uallmx.pas' {Form_allmx};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '配料单管理';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm1, MainForm1);
  Application.CreateForm(TIf_Form1, If_Form1);
  Application.CreateForm(TForm_bom, Form_bom);
  Application.CreateForm(TForm_shomx, Form_shomx);
  Application.CreateForm(TForm_allmx, Form_allmx);
  Application.Run;
end.
