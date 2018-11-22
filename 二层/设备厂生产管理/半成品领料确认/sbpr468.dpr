program sbpr468;

uses
  Forms,
  Usbpr468 in 'Usbpr468.pas' {Main_Form},
  DMsbpr468 in 'DMsbpr468.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '半成品领料确认';
  Application.HelpFile := '';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMain_Form, Main_Form);
  Application.Run;
end.
