program WZPR176;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  aded_count in 'aded_count.pas' {Form2},
  warehouse_search in 'warehouse_search.pas' {Form_wh},
  location_search in 'location_search.pas' {Form_lo},
  inv_serach in 'inv_serach.pas' {form_inv},
  invtype_search in 'invtype_search.pas' {Form_invtype},
  invt_confines in 'invt_confines.pas' {Form3},
  phy_counts in 'phy_counts.pas' {Form4},
  employee_search in 'employee_search.pas' {Form_Employee},
  invt_insert in 'invt_insert.pas' {Form5},
  invt_received in 'invt_received.pas' {Form6},
  dev_report in 'dev_report.pas' {Form_report},
  report1 in 'report1.pas' {Form_report1},
  about_box in 'about_box.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '‘≠≤ƒ¡œ≈Ãµ„';
  Application.CreateForm(TDM, DM);  
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
