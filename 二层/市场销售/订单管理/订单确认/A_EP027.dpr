program A_EP027;

uses
  Forms,
  main in 'main.pas' {Form1},
  confirmation in 'confirmation.pas' {Form2},
  display in 'display.pas' {Form3},
  unconfirmation in 'unconfirmation.pas' {Form4},
  so_search in 'so_search.pas' {Form5},
  cust_po in 'cust_po.pas' {Form6},
  cust_search in 'cust_search.pas' {FrmCustSearch},
  po_search in 'po_search.pas' {Form_po},
  damo in 'damo.pas' {DM: TDataModule},
  cust_part in 'cust_part.pas' {Form7},
  part_search in 'part_search.pas' {FrmCustPart},
  note in 'note.pas' {edit_note},
  note_search in 'note_search.pas' {note_form},
  detail in 'DETAIL.PAS' {Form8},
  surcharge in 'surcharge.pas' {Form9},
  returen_so in 'returen_so.pas' {Form10};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '销售定单确认';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
