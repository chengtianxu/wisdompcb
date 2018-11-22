program EP053;

uses
  Forms,
  main in 'MAIN.pas' {Form1},
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
  auth_info in 'auth_info.pas' {Form3},
  supplier_info in 'supplier_info.pas' {Form_INVTSUPP},
  stockqty_info in 'stockqty_info.pas' {Form_stockqty},
  stdhistory_price in 'stdhistory_price.pas' {Form_stdprice},
  PasFile in 'PasFile.pas' {frmFile},
  superobject in 'superobject.pas';


{$R *.res}

begin
  Application.Initialize;
  Application.Title := '≤…π∫µ•…Û∫À';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
