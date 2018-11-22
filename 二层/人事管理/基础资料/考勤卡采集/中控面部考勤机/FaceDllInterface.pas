unit FaceDllInterface;

interface
uses
  Windows, ComObj, SysUtils, ShellAPI, zkemkeeper_TLB, Classes;

type
  TpfConnect = function (AIp: WideString; APort: Integer): Boolean; stdcall;

  function LoadDevLib: Boolean;
  procedure FreeFaceLib;

var
  gDev: IZKEM;

implementation

uses
  Dialogs, ActiveX;


function LoadDevLib: Boolean;
var
  I: Integer;
begin
  for I := 1 to 8 do
  begin
    with TResourceStream.Create(HInstance,'RC'+ IntToStr(I),RT_RCDATA) do
    begin
      try
        case I of
          1: SaveToFile('commpro.dll');
          2: SaveToFile('comms.dll');
          3: SaveToFile('rscagent.dll');
          4: SaveToFile('rscomm.dll');
          5: SaveToFile('tcpcomm.dll');
          6: SaveToFile('usbcomm.dll');
          7: SaveToFile('zkemkeeper.dll');
          8: SaveToFile('zkemsdk.dll');
        end;
      finally
        Free;
      end;
    end;
  end;
  //ShellExecute(0,'open','regsvr32.exe',,nil,SW_HIDE);
  Winexec('regsvr32 zkemkeeper.dll -s ',SW_HIDE);
  try
    gDev := CreateComObject(CLASS_CZKEM) as IZKEM;
    Result := True;
  except
    ShowMessage('×¢²ázkemkeeper.dll Ê§°Ü');
    Result := False;
  end;
end;

procedure FreeFaceLib;
begin
  gDev := nil;
end;


end.
