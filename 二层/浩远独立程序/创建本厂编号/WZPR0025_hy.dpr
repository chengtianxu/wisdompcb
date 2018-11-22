program WZPR0025_hy;

uses
  Forms,
  MainUNIT1 in 'MainUNIT1.pas' {MainForm1},
  DmUnit1 in 'DmUnit1.pas' {DM: TDataModule},
  IF_Unit1 in 'IF_Unit1.pas' {If_Form1},
  AddEditUnit1 in 'AddEditUnit1.pas' {AddEditForm1},
  FindRFQ in 'FindRFQ.pas' {frmFindRFQ};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '创建本厂编号';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm1, MainForm1);
  Application.Run;
end.
