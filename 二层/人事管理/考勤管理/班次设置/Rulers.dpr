program Rulers;

uses
  Forms,
  UMain in 'UMain.pas' {Main_Form},
  UDM in 'UDM.pas' {DM: TDataModule},
  USpecial in 'USpecial.pas' {Special_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '∞‡¥Œ…Ë÷√';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMain_Form, Main_Form);
  Application.CreateForm(TSpecial_Form, Special_Form);
  Application.Run;
end.
