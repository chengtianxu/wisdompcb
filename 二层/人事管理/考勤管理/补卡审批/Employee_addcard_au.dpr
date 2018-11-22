program Employee_addcard_au;

uses
  Forms,
  main_u in 'main_u.pas' {Form1},
  damo in 'damo.pas' {dm: TDataModule},
  ChaoKaFrm in 'ChaoKaFrm.pas' {frmChaoka},
  RemarkFrm in 'RemarkFrm.pas' {frmNote};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '≤πø®…Û∫À';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmChaoka, frmChaoka);
  Application.CreateForm(TfrmNote, frmNote);
  Application.Run;
end.
