program N_EP062;

uses
  Forms,
  Main_062 in 'Main_062.pas' {frmMain_062},
  Edit_Data0506 in 'Edit_Data0506.pas' {frmEdit_Data0506},
  PickEngNote in 'PickEngNote.pas' {frmPickEngNote};

{$R *.res}

begin
  Application.Initialize;
  Application.HelpFile := '';
  Application.Title := 'π§–Ú¥˙¬Î…Ë÷√';
  Application.CreateForm(TfrmMain_062, frmMain_062);
  Application.Run;
end.
