program Change;

uses
  Forms,
  UChange in 'UChange.pas' {FrmChange},
  UDM in 'UDM.pas' {DM: TDataModule},
  UQry in 'UQry.pas' {FrmQry},
  UAdd in 'UAdd.pas' {FrmAdd},
  USelKeyP in 'USelKeyP.pas' {frmSelKeyP};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmChange, FrmChange);
  Application.Run;
end.
