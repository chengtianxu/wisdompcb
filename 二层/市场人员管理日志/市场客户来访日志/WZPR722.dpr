program WZPR722;

uses
  Forms,
  UWZPR722 in 'UWZPR722.pas' {Main_Form},
  Udm in 'Udm.pas' {DM: TDataModule},
  UDetail in 'UDetail.pas' {Detail_Form},
  UPick_Item_Form in 'UPick_Item_Form.pas',
  UEvaluate in 'UEvaluate.pas' {Eva_Form},
  UReport in 'UReport.pas' {Report_Form},
  UQuery in 'UQuery.pas' {Query_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '市场部客户来访日志';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TMain_Form, Main_Form);
  Application.Run;
end.
