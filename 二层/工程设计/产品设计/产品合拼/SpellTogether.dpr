program SpellTogether;

uses
  Forms,
  main in 'main.pas' {frmMain},
  SpellCondition in 'SpellCondition.pas' {frmSpellCondition},
  damo in 'damo.pas' {dm: TDataModule},
  uQnty in 'uQnty.pas' {frmQnty};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ºÏÆ´';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
