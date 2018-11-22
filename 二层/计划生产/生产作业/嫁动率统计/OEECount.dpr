program OEECount;

uses
  Forms,
  UMain in 'UMain.pas' {FrmMain},
  UDM in 'UDM.pas' {DM: TDataModule},
  UAdd in 'UAdd.pas' {FrmAdd},
  UQry in 'UQry.pas' {FrmQry};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '嫁动率统计';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
