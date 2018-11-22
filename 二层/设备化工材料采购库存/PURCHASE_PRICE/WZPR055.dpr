program WZPR055;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'DAMO.PAS' {DM: TDataModule},
  supplier_search in 'supplier_search.pas' {Form_supp},
  inv_serach in 'inv_serach.pas' {form_inv},
  edit_price in 'edit_price.pas' {Form2},
  Unit_search in 'Unit_search.pas' {form_curr},
  uncode_search in 'uncode_search.pas' {form_unit},
  note in 'note.pas' {edit_note},
  note_search in 'note_search.pas' {note_form},
  price_change in 'price_change.pas' {Form3},
  price_changelist in 'price_changelist.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
