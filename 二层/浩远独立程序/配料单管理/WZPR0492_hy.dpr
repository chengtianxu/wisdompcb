program WZPR0492_hy;

uses
  Forms,
  MainUNIT1 in 'MainUNIT1.pas' {MainForm1},
  DmUnit1 in 'DmUnit1.pas' {DM: TDataModule},
  IF_Unit1 in 'IF_Unit1.pas' {If_Form1},
  EditBom in 'EditBom.pas' {FrmEditBom},
  TReport in 'TReport.pas' {FrmReport},
  MulPrinUnit1 in 'MulPrinUnit1.pas' {MulPrinForm1},
  bominvt in 'bominvt.pas' {Form_bominvt};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '配料单管理';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm1, MainForm1);
  Application.CreateForm(TIf_Form1, If_Form1);
  Application.Run;
end.
