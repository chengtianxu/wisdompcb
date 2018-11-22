program A_EP132;

uses
  Forms,
  MainUNIT1 in 'MainUNIT1.pas' {MainForm1},
  DmUnit1 in 'DmUnit1.pas' {DM: TDataModule},
  IF_Unit1 in 'IF_Unit1.pas' {If_Form1},
  EditUnit1 in 'EditUnit1.pas' {EditForm1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '产品品质缺陷代码';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm1, MainForm1);
  Application.Run;
end.
