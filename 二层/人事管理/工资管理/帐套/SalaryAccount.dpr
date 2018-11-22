program SalaryAccount;

uses
  Forms,
  UMain in 'UMain.pas' {Main_Form},
  UDM in 'UDM.pas' {DM: TDataModule},
  USalDe in 'USalDe.pas' {SalDe_Form},
  Uformula in 'Uformula.pas' {Formula_Form},
  UFDetail in 'UFDetail.pas' {FDetail_Form},
  MyDBGrid in 'MyDBGrid.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ÕÊÌ×';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMain_Form, Main_Form);
  Application.Run;
end.
