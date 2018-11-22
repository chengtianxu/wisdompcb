program A_wzcx48;

uses
  Forms,
  DMUnit1 in 'DMUnit1.pas' {DM: TDataModule},
  MainUnit1 in 'MainUnit1.pas' {MainForm1},
  IF_Unit1 in 'IF_Unit1.pas' {If_Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '工序时长查询';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm1, MainForm1);
  Application.CreateForm(TIf_Form1, If_Form1);
  Application.Run;
end.
