program A_ep305;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  note in 'NOTE.PAS' {edit_note},
  note_search in 'note_search.pas' {note_form},
  surcharge in 'surcharge.pas' {Form9},
  detail in 'DETAIL.PAS' {Form8},
  cust_search in 'cust_search.pas' {Form_Custmer},
  edit_ordernumber in 'edit_ordernumber.pas' {Form4},
  date_fw in 'date_fw.pas' {Form5},
  fencai_so in 'fencai_so.pas' {Form6},
  apend_so in 'apend_so.pas' {Form7},
  change_ponumber in 'change_ponumber.pas' {Form10},
  purchase_search in 'purchase_search.pas' {Form_po},
  update_gongju in 'update_gongju.pas' {Form11},
  quote_price in 'quote_price.pas' {Form12},
  Address in 'Address.pas' {frm_Address},
  PasQuery in 'PasQuery.pas' {FrmQuery},
  Unit2 in '..\..\..\..\..\..\..\鸿泰源代码\作业单状态查询（批次管理版本）\Unit2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '销售订单更改(市场部)';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
