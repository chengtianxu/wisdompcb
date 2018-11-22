program A_WZPR301;

uses
  Forms,
  main in 'MAIN.PAS' {Form1},
  damo in 'DAMO.PAS' {DM: TDataModule},
  edit_req in 'EDIT_REQ.PAS' {Form2},
  empl_search in 'empl_search.pas' {form_technics},
  addedit_requ in 'addedit_requ.pas' {Form3},
  auth_info in 'auth_info.pas' {Form6},
  received in 'received.pas' {Form7},
  supplier_search in 'supplier_search.pas' {Form_supp};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '外发加工审批';
  Application.CreateForm(TDM, DM);  
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
