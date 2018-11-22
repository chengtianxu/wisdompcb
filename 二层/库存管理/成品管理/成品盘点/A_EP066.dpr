program A_EP066;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  addedit_phycount in 'addedit_phycount.pas' {Form2},
  part_confines in 'part_confines.pas' {Form3},
  warehouse_search in 'warehouse_search.pas' {Form_wh},
  location_search in 'location_search.pas' {Form_lo},
  custpart_search in 'custpart_search.pas' {FrmCustPart},
  customer_search in 'customer_search.pas' {FrmCustSearch},
  phy_counts in 'phy_counts.pas' {Form4},
  count_insert in 'count_insert.pas' {Form5},
  employee_search in 'employee_search.pas' {Form_Employee},
  about_box in 'about_box.pas' {AboutBox},
  report_form1 in 'report_form1.pas' {Form_report},
  report_form2 in 'report_form2.pas' {Form_report1},
  total_count in 'total_count.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '产成品盘点';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
