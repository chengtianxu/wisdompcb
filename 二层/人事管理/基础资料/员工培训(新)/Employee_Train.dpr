program Employee_Train;

uses
  Forms,
  Dialogs,
  PasMain in 'PasMain.pas' {frmMain},
  DAMO in 'DAMO.pas' {DM: TDataModule},
  PasQuery in 'PasQuery.pas' {frmQuery},
  PasAdd in 'PasAdd.pas' {frmAdd},
  PasImport in 'PasImport.pas' {frmImport},
  Eastriver_API in 'Eastriver_API.pas',
  Eastriver_Helper in 'Eastriver_Helper.pas',
  PasLoadData in 'PasLoadData.pas' {frmLoadData},
  PasSelTime in 'PasSelTime.pas' {frmSelTime},
  PasMoney in 'PasMoney.pas' {frmMoney};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '员工培训';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmMoney, frmMoney);
  if LoadDll(DLL_NAME) then
    Application.Run
  else
    ShowMessage('加载接口动态库失败');
  FreeDll;
end.
