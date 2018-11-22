program EP204;

uses
  Forms,
  main in 'MAIN.PAS' {Form1},
  damo in 'DAMO.PAS' {DM: TDataModule},
  supp_search in 'supp_search.pas' {Form_supp},
  supplier in 'SUPPLIER.PAS' {Form6},
  edit_misc in 'edit_misc.pas' {Form7},
  state_tax in 'state_tax.pas' {Form8},
  edit_std_inv in 'edit_std_inv.pas' {Form9},
  note in 'NOTE.PAS' {edit_note},
  note_search in 'note_search.pas' {form_note},
  edit_misc_po in 'edit_misc_po.pas' {Form10},
  annotation in 'annotation.pas' {Form11},
  po_inspection in 'po_inspection.pas' {Form13},
  desi_report in 'desi_report.pas' {Form14},
  desi_reportmic in 'desi_reportmic.pas' {Form15},
  desi_o_report in 'desi_o_report.pas' {Form17},
  desi_o_reportmic in 'desi_o_reportmic.pas' {Form18},
  waifa_report in 'waifa_report.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '≤…π∫µ•¥Ú”°';
  Application.CreateForm(TDM, DM);  
  Application.CreateForm(TForm1, Form1);

  Application.Run;
end.
