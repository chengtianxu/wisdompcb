program EP303;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  po_search in 'po_search.pas' {Form2},
  return_quan in 'return_quan.pas' {Form3},
  mater_rej_search in 'mater_rej_search.pas' {Form_marej},
  note in 'note.pas' {edit_note},
  note_search in 'note_search.pas' {form_note},
  return_insp in 'return_insp.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '退货给供应商(非生产物料采购订单)';
  Application.CreateForm(TDM, DM);  
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
