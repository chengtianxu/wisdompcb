program A_wzcx98;

uses
  Forms,
  DMUnit1 in 'DMUnit1.pas' {DM: TDataModule},
  IF_Unit1 in 'IF_Unit1.pas' {If_Form1},
  MainTem_Unit1 in 'MainTem_Unit1.pas' {MainTemForm1},
  Main_Unit2 in 'Main_Unit2.pas' {MainTemForm2},
  findUnit1 in 'findUnit1.pas' {findForm1},
  Find_RMA_NUMBER_Unit2 in 'Find_RMA_NUMBER_Unit2.pas' {find_RMA_Number_Form2},
  find_CUST_CODE_Unit2 in 'find_CUST_CODE_Unit2.pas' {find_CUST_CODE_Form2},
  find_CUSTOMER_PART_DESC_Unit2 in 'find_CUSTOMER_PART_DESC_Unit2.pas' {find_CUSTOMER_PART_DESC_Form2},
  find_CUSTOMER_PART_NUMBER_Unit2 in 'find_CUSTOMER_PART_NUMBER_Unit2.pas' {find_CUSTOMER_PART_NUMBER_Form2},
  find_SALES_ORDER_Unit2 in 'find_SALES_ORDER_Unit2.pas' {find_SALES_ORDER_Form2},
  Find_WareHouse_Code_Unit2 in 'Find_WareHouse_Code_Unit2.pas' {Find_WareHouse_Code_Form2},
  Frm_QrySum_u in 'Frm_QrySum_u.pas' {Frm_QrySum},
  Frm_detail_u in 'Frm_detail_u.pas' {Frm_detail},
  UTogather in 'UTogather.pas' {frmTotather};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '客户退货查询';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainTemForm2, MainTemForm2);
  Application.CreateForm(TfrmTotather, frmTotather);
  Application.Run;
end.
