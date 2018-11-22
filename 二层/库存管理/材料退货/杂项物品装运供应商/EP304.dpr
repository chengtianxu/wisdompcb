program EP304;

uses
  Forms,
  main in 'MAIN.PAS' {Form1},
  damo in 'DAMO.PAS' {DM: TDataModule},
  shipped_meth in 'shipped_meth.pas' {Form2},
  shipmeth_search in 'shipmeth_search.pas' {form_shipmethod},
  note in 'note.pas' {edit_note},
  note_search in 'note_search.pas' {form_note},
  shipsupp_sql in 'shipsupp_sql.pas' {Form3},
  supplier_search in 'supplier_search.pas' {Form_supp},
  Employee_search in 'Employee_search.pas' {FrmEmpl},
  REPORT_r in 'REPORT_r.PAS' {Form_report};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '装运到供应商(非生产物料)';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
