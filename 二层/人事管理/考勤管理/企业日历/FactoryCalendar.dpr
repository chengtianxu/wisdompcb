program FactoryCalendar;

uses
  Forms,
  UMain_Form in 'UMain_Form.pas' {Main_Form},
  DateCn in '..\reference\20083111529204\DateCn.pas',
  UDM in 'UDM.pas' {DM: TDataModule},
  UColorS in 'UColorS.pas' {ColorS_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '企业日历';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMain_Form, Main_Form);
  Application.Run;
end.
