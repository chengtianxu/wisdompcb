program WZPR131;

uses
  Forms,
  Main in 'Main.pas' {FrmMain},
  EditItem in 'EditItem.pas' {FrmEditItem},
  AcctSearch in 'AcctSearch.pas' {FrmAcctSearch};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
