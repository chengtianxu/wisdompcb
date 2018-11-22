program N_EP229;

uses
  Forms,
  SubEdit in 'SubEdit.pas' {frmSubEdit},
  Main_229 in 'Main_229.pas' {frmMain_229},
  Dm in 'Dm.pas' {dmCon: TDataModule},
  AcctSearch in 'AcctSearch.pas' {Form_Acct};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '成本核算基础设置';
  Application.CreateForm(TdmCon, dmCon);
  Application.CreateForm(TfrmMain_229, frmMain_229);
  Application.Run;
end.                      
