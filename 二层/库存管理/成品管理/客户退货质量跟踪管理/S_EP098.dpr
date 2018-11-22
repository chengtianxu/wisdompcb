program S_EP098;

uses
  Forms,
  Main in 'Main.pas' {Form_Main},
  demo in 'demo.pas' {DM: TDataModule},
  Condition in 'Condition.pas' {Form_Condition};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '客户退货质量跟踪管理';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_Main, Form_Main);
  Application.Run;
end.
