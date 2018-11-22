program A_ep169;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  cust_search in 'cust_search.pas' {Frm_Cust},
  pact_matter in 'pact_matter.pas' {Form2},
  note_search in 'note_search.pas' {note_form},
  cancel_so in 'cancel_so.pas' {Form3},
  so_sch_date in 'so_sch_date.pas' {Form5},
  pacted_list in 'pacted_list.pas' {Form6},
  PasQuery in 'PasQuery.pas' {FrmQuery};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '∂©µ•∆¿…Û';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFrmQuery, FrmQuery);
  Application.Run;
end.
