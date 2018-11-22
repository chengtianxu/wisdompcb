program WZCP100;

uses
  Forms,
  main in 'main.pas' {Form1},
  damo in 'damo.pas' {dm: TDataModule},
  pickitem in 'pickitem.pas' {frm_pickitem};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'BOM信息权限分配';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
