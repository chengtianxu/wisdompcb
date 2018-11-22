program WZPR057;

uses
  Forms,
  main in 'MAIN.PAS' {Form1},
  damo in 'DAMO.PAS' {DM: TDataModule},
  auth_search in 'auth_search.pas' {Form_auth},
  note in 'note.pas' {edit_note},
  note_search in 'note_search.pas' {form_note},
  req_details in 'req_details.pas' {Form2},
  auth_info in 'auth_info.pas' {Form3},
  stdhistory_price in 'stdhistory_price.pas' {Form_stdprice},
  michistory_price in 'michistory_price.pas' {Form_micprice},
  supplier_info in 'supplier_info.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
