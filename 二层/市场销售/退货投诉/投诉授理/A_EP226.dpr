program A_EP226;

uses
  Forms,
  MainUNIT1 in 'MainUNIT1.pas' {MainForm1},
  DmUnit1 in 'DmUnit1.pas' {DM: TDataModule},
  IF_Unit1 in 'IF_Unit1.pas' {If_Form1},
  EditUnit1 in 'EditUnit1.pas' {EditForm1},
  PrintUnit1 in 'PrintUnit1.pas' {PrintForm1},
  BMListFrm in 'BMListFrm.pas' {frmBMList};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '客户投诉受理';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm1, MainForm1);
  Application.Run;
end.
