program wzpr0698;

{%ToDo 'wzpr0698.todo'}

uses
  Forms,
  main in 'main.pas' {Form1},
  DAMO in 'DAMO.pas' {DM: TDataModule},
  details in 'details.pas' {details_Form},
  searchso in 'searchso.pas' {searchso_Form},
  condition in 'condition.pas' {condition_Form},
  packreport in 'packreport.pas' {packreport_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '包装标签打印';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tcondition_Form, condition_Form);
  Application.Run;
end.
