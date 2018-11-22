unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btn1: TButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
function CallPCBCut: Boolean;
type
  pfShowPCBCutFrm = function (AOwner: TComponent): Boolean;stdcall;
var
  pf: Pointer;
  hMod: HWND;
begin
//  Result := False;
//  with TResourceStream.Create(HInstance,'RC1',RT_RCDATA) do
//  begin
//    try
//      SaveToFile('WZPCBCut.dll');
//    finally
//      Free;
//    end;
//  end;
  Result := True;
  hMod := LoadLibrary(PChar(ExtractFilePath(ParamStr(0)) + 'WZPCBCut.dll'));
  if (hMod <> 0) and (hMod <> INVALID_HANDLE_VALUE) then
  begin
    pf := GetProcAddress(hMod,'ShowPCBCutFrm');
    if pf <> nil then
      Result := pfShowPCBCutFrm(pf)(nil);
    FreeLibrary(hMod);
  end;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  CallPCBCut;
end;

end.
