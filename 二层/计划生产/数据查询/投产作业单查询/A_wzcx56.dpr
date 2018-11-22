program A_wzcx56;

uses
  Forms,
  DMUnit1 in 'DMUnit1.pas' {DM: TDataModule},
  MainUnit1 in 'MainUnit1.pas' {MainForm1},
  IF_Unit1 in 'IF_Unit1.pas' {If_Form1},
  ShowUnit1 in 'ShowUnit1.pas' {ShowForm1},
  Show58Unit2 in 'Show58Unit2.pas' {Show58Form2},
  Show53Unit2 in 'Show53Unit2.pas' {Show53Form2},
  Show48Unit2 in 'Show48Unit2.pas' {Show48Form2},
  Show38Unit2 in 'Show38Unit2.pas' {Show38Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '投产作业单查询';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm1, MainForm1);
  Application.CreateForm(TIf_Form1, If_Form1);
  Application.Run;
end.
