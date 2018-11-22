program WZPR104;

uses
  Forms,
  MAIN in 'MAIN.pas' {frmmain},
  EditItem in 'EditItem.pas' {FRMEditItem},
  AccSearch in 'AccSearch.pas' {FRMAccSearch};

{$R *.res}
begin
  Application.Initialize;
  Application.Title := '基本业务会计分录';
  Application.CreateForm(Tfrmmain, frmmain);
  Application.Run;
end.
