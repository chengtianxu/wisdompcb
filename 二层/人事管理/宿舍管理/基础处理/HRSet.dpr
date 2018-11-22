program HRSet;

uses
  Forms,
  UMain in 'UMain.pas' {frmMain},
  UDM in 'UDM.pas' {DM: TDataModule},
  UEdit in 'UEdit.pas' {frmedit};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'HR资料导入';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
