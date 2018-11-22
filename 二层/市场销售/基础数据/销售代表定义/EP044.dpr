program EP044;

uses
  Forms,
  main in 'main.pas' {Form1},
  edit_rep in 'EDIT_REP.PAS' {Form2},
  note_search in 'note_search.pas' {note_form},
  note in 'NOTE.PAS' {Form3},
  curr_search in 'curr_search.pas' {curr_form},
  employee_search in 'employee_search.pas' {Form_employee};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '销售代表';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
