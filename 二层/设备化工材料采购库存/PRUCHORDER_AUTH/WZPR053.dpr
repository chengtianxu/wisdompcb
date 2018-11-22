program WZPR053;

uses
  Forms,
  main in 'MAIN.PAS' {Form1},
  damo in 'DAMO.PAS' {DM: TDataModule},
  supplier_search in 'supplier_search.pas' {Form_supp},
  po_inspection in 'po_inspection.pas' {Form13},
  edit_misc in 'edit_misc.pas' {Form7},
  supplier in 'SUPPLIER.PAS' {Form6},
  analysis in 'ANALYSIS.PAS' {Form5},
  state_tax in 'state_tax.pas' {Form8},
  annotation in 'annotation.pas' {Form11},
  note in 'NOTE.PAS' {edit_note},
  edit_std_inv in 'edit_std_inv.pas' {Form9},
  edit_misc_po in 'edit_misc_po.pas' {Form10},
  auth_info in 'auth_info.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
