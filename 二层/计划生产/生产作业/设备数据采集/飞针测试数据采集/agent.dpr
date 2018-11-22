program agent;

uses
  Forms, Registry, windows,
  udm in 'udm.pas' {dm: TDataModule},
  ExeImage in 'ExeImage.pas',
  frm in 'frm.pas' {Form1},
  stat in 'stat.pas' {sfrm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := '测试数据采集程序';
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TForm1, Form1);
  with TRegistry.Create do
  begin
    RootKey:=  DWORD($80000002);
    if OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run',False) then
    if  ReadString('flypbagent')<> Application.ExeName then
    WriteString('flypbagent',Application.ExeName);
    CloseKey;
  end;
  Application.Run;
end.
