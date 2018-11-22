program HRPR001;

uses
  Forms,SysUtils,Windows,
  MainU in 'MainU.pas' {Main_Form},
  UDM in 'UDM.pas' {DM: TDataModule},
  modify_card in 'modify_card.pas' {Form_modify_card},
  dataimport_show in 'dataimport_show.pas';
 var
  hMutex: Cardinal;
  Ret: Integer;
  sExeNm:string;

{$R *.res}

begin
sExeNm:='';
  sExeNm := ExtractFileName(Application.ExeName);
  if Pos('.', sExeNm) > 0 then
    sExeNm := Copy(sExeNm, 1, Pos('.', sExeNm) - 1);
  sExeNm:=sExeNm+'_TBYF';
 
  hMutex := CreateMutex(nil, False, PChar(sExeNm));
  Ret := GetLastError;
  if Ret <> ERROR_ALREADY_EXISTS then
   //一般情况
  begin
  Application.Initialize;
  Application.CreateForm(TMain_Form, Main_Form);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm_modify_card, Form_modify_card);
  Application.Run;
  // 一般情况结束
  end 
  else
  begin
    ReleaseMutex(hMutex);
    Application.MessageBox('该程序已经运行，可能已被您最小化！', '重复运行', MB_OK + MB_ICONEXCLAMATION);
    Halt;
  end;
end.
