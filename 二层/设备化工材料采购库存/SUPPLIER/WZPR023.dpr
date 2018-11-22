program WZPR023;

uses
  Forms,
  main in 'main.pas' {Form1},
  edit_supplier in 'edit_supplier.pas' {Form2},
  damo in 'damo.pas' {DM: TDataModule},
  note in 'note.pas' {edit_note},
  note_search in 'note_search.pas' {note_form},
  country_search in 'country_search.pas' {country_form},
  curr_search in 'curr_search.pas' {curr_form},
  account_search in 'account_search.pas' {account_Form},
  supp_ship in 'supp_ship.pas' {Form3},
  shipmethod in 'shipmethod.pas' {shipmethod_form},
  tax_search in 'tax_search.pas' {tax_form};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
