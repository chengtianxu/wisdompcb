program WZCX85_1;

uses
  Forms,
  Main in 'Main.pas' {MainFrm},
  term in 'term.pas' {form_condition},
  damo in 'damo.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '报价价格查询';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMainFrm, MainFrm);
  Application.Run;
end.
