program WZPR100;

uses
  Forms,
  main in 'main.pas' {frm_main},
  damo in 'damo.pas' {dm: TDataModule},
  pickitem in 'pickitem.pas' {frm_pickitem};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '客户信息权限分配';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tfrm_main, frm_main);
  Application.Run;
end.
