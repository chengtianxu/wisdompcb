program qwzpr85Report;

uses
  Forms,
  ReportUnit1 in 'ReportUnit1.pas' {MainForm1},
  DMUnit1 in 'DMUnit1.pas' {DM: TDataModule},
  PrintUnit2 in 'PrintUnit2.pas',
  BaseUnit1 in 'BaseUnit1.pas' {BaseForm1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '-快板厂报价报表设计';
  Application.CreateForm(TMainForm1, MainForm1);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
