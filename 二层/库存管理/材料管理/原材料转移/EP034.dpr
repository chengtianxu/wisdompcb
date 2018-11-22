program EP034;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {DM: TDataModule},
  invser_form in 'invser_form.pas' {Form_invser},
  outnum_form in 'outnum_form.pas' {Form_outnum};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '²ÄÁÏµ÷²¦';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
