program WZPR043;

uses
  Forms,
  main in 'MAIN.PAS' {Form1},
  warehouse_search in 'warehouse_search.pas' {Form_wh},
  supplier_search in 'supplier_search.pas' {Form_supp},
  return_nopo in 'return_nopo.pas' {Form2},
  note in 'note.pas' {edit_note},
  note_search in 'note_search.pas' {form_note},
  edit_return in 'edit_return.pas' {Form3},
  mater_rej_search in 'mater_rej_search.pas' {Form_marej};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
