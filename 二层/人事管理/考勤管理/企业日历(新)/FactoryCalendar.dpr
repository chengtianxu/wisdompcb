program FactoryCalendar;

uses
  Forms,
  win in 'win.pas' {Form1},
  DateCn in 'DateCn.pas',
  dm in 'dm.pas' {udm: TDataModule},
  data_editor in 'data_editor.pas' {dataedt};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '企业日历';
  Application.CreateForm(Tudm, udm);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
