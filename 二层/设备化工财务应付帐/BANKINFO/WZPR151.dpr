program WZPR151;

uses
  Forms,
  Main in 'Main.pas' {FrmMain},
  EditItem in 'EditItem.pas' {FrmEditItem},
  AcctSearch in 'AcctSearch.pas' {FrmAcctSearch},
  curr_search in 'curr_search.pas' {FrmCurr};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
