program A_qwzpr85;

uses
  Forms,
  DMUnit1 in 'DMUnit1.pas' {DM: TDataModule},
  BaseUnit1 in 'BaseUnit1.pas' {BaseForm1},
  BaseFindUnit1 in 'BaseFindUnit1.pas' {BaseFindForm1},
  MainBaseUnit3 in 'MainBaseUnit3.pas' {BaseForm3},
  EditBaseUnit2 in 'EditBaseUnit2.pas' {EditBaseForm2},
  Unit1 in 'Unit1.pas' {Form1},
  CalculUnit2 in 'CalculUnit2.pas',
  FindDATA0050Unit2 in 'FindDATA0050Unit2.pas' {FindDATA0050Form2},
  FindData0010Unit2 in 'FindData0010Unit2.pas' {FindData0010Form2},
  FindData0001Unit2 in 'FindData0001Unit2.pas' {FindData0001Form2},
  FindData0009Unit3 in 'FindData0009Unit3.pas' {FindData0009Form3},
  FindData0008Unit2 in 'FindData0008Unit2.pas' {FindData0008Form2},
  IF_Unit1 in 'IF_Unit1.pas' {If_Form1},
  TFormulaUnit2 in 'TFormulaUnit2.pas',
  EditCustUnit2 in 'EditCustUnit2.pas' {EditCustForm2},
  PrintUnit2 in 'PrintUnit2.pas' {PrintForm2},
  AuditInfoUnit2 in 'AuditInfoUnit2.pas' {AuditInfoForm2},
  FindData0006Unit2 in 'FindData0006Unit2.pas' {FindData0006Form2},
  FindData0348Unit2 in 'FindData0348Unit2.pas' {FindData0348Form2},
  FindMatPriceUnit2 in 'FindMatPriceUnit2.pas' {FindMatPriceForm2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '_快板厂快速报价';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TBaseForm3, BaseForm3);
  Application.Run;
end.
