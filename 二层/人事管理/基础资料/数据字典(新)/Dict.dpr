program Dict;

uses
  Forms,
  main in 'main.pas' {frm_main},
  damo in 'damo.pas' {DM: TDataModule},
  budget in 'D:\vss\原程序代码\人事管理\基础资料\数据字典\budget.pas' {Form_budget};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '数据字典';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrm_main, frm_main);
  Application.Run;
end.

