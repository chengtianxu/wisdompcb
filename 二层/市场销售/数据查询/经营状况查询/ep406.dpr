program ep406;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Frm_Selection_u in 'Frm_Selection_u.pas' {Frm_Selection};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '经营状况查询';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
