program A_EP037;

uses
  Forms,
  main in 'main.pas' {Form1},
  edit_rma in 'edit_rma.pas' {Form2},
  cust_search in 'cust_search.pas' {FrmCustSearch},
  part_search in 'part_search.pas' {FrmCustPart},
  so_search in 'so_search.pas' {sales_search},
  ship_no in 'SHIP_NO.PAS' {Form3},
  note in 'note.pas' {edit_note},
  note_search in 'note_search.pas' {note_form},
  damo in 'DAMO.PAS' {dm: TDataModule},
  analysis in 'analysis.pas' {Form5},
  tou_shu in 'tou_shu.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Ω” ’ÕÀªı';
  Application.CreateForm(Tdm, dm);  
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
