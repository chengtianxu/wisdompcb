program wzcx96;

uses
  Forms,
  DMUnit1 in 'DMUnit1.pas' {DM: TDataModule},
  IF_Unit1 in 'IF_Unit1.pas' {If_Form1},
  Find_Unit1 in 'Find_Unit1.pas' {find_Form1},
  MainTem_Unit1 in 'MainTem_Unit1.pas' {MainTemForm1},
  Main_Unit2 in 'Main_Unit2.pas' {MainTemForm2},
  Unit2 in 'Unit2.pas' {find_Form2},
  Unit3 in 'Unit3.pas' {find_Form3},
  findUnit1 in 'findUnit1.pas' {findForm1},
  Unit4 in 'Unit4.pas' {findForm4};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '材料报废退货查询';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainTemForm2, MainTemForm2);
  Application.Run;
end.
