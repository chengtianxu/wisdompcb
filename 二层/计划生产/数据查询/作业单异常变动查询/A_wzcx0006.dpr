program A_wzcx0006;

uses
  Forms,
  DMUnit1 in 'DMUnit1.pas' {DM: TDataModule},
  MainUnit1 in 'MainUnit1.pas' {MainForm1},
  IF_Unit1 in 'IF_Unit1.pas' {If_Form1},
  Find_Unit1 in 'Find_Unit1.pas' {find_Form1},
  find_SALES_ORDER_Unit2 in 'find_SALES_ORDER_Unit2.pas' {find_SALES_ORDER_Form2},
  find_CUSTOMER_PART_NUMBER_Unit2 in 'find_CUSTOMER_PART_NUMBER_Unit2.pas' {find_CUSTOMER_PART_NUMBER_Form2},
  find_WORK_ORDER_NUMBER_Unit2 in 'find_WORK_ORDER_NUMBER_Unit2.pas' {find_WORK_ORDER_NUMBERForm2},
  find_CUST_CODE_Unit2 in 'find_CUST_CODE_Unit2.pas' {find_CUST_CODE_Form2},
  find_CUT_NO_Unit2 in 'find_CUT_NO_Unit2.pas' {find_CUT_NO_Form2},
  ShowUnit1 in 'ShowUnit1.pas' {ShowForm1},
  Show58Unit2 in 'Show58Unit2.pas' {Show58Form2},
  Show53Unit2 in 'Show53Unit2.pas' {Show53Form2},
  Show48Unit2 in 'Show48Unit2.pas' {Show48Form2},
  Show38Unit2 in 'Show38Unit2.pas' {Show38Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '作业单变更日志查询';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainForm1, MainForm1);
  Application.Run;
end.
