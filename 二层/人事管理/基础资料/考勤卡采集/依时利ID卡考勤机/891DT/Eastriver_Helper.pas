unit Eastriver_Helper;

interface
uses
  Windows, SysUtils, Classes, Eastriver_API;

const
  DevPort = 4001;

type
  TDllAPI = record
    OpenClientSocket: API_OpenClientSocket;
    ClosePortHandle: API_ClosePortHandle;
    ReadClockTime: API_ReadClockTime;
    CallClock: API_CallClock;
    UnCallClock: API_UnCallClock;
    ReadClockRecordTotal: API_ReadClockRecordTotal;
    ReadAllRecord: API_ReadAllRecord;
    ClearAllReadCard: API_ClearAllReadCard;
    ReadListCardTotal: API_ReadListCardTotal;
    ReadDeviceListCard: API_ReadDeviceListCard;
    ClearAllNamelist: API_ClearAllNamelist;
    SetAllowedCard: API_SetAllowedCard;
    SetClockTime: API_SetClockTime;
  end;

function LoadDll(ADllName: string): Boolean;
procedure FreeDll;
function CheckHandle(h: THandle): Boolean;

var
  DllAPI: TDllAPI;

implementation
var
  hDll: THandle;

function LoadDll(ADllName: string): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 1 to 9 do
  begin
    with TResourceStream.Create(HInstance,'RC'+ IntToStr(I),RT_RCDATA) do
    begin
      try
        case I of
          1: SaveToFile('EastRiver.dll');
          2: SaveToFile('EastRiverD.dll');
          3: SaveToFile('EastRiverT.dll');
          4: SaveToFile('EastRiverTCP.dll');
          5: SaveToFile('EastRiverU.dll');
          6: SaveToFile('ercommbase.dll');
          7: SaveToFile('ERDriver01.dll');
          8: SaveToFile('ERDriver02.dll');
          9: SaveToFile('ERDriver03.dll');
        end;
      finally
        Free;
      end;
    end;
  end;

                  
    
  hDll := LoadLibrary(PAnsiChar(ADllName));
  if (hDll = 0) or (hDll = INVALID_HANDLE_VALUE) then Exit;
  DllAPI.OpenClientSocket := GetProcAddress(hDll,'OpenClientSocket');
  DllAPI.ReadClockTime := GetProcAddress(hDll,'ReadClockTime');
  DllAPI.ClosePortHandle := GetProcAddress(hDll,'ClosePortHandle');
  DllAPI.CallClock := GetProcAddress(hDll,'CallClock');
  DllAPI.UnCallClock := GetProcAddress(hDll,'UnCallClock');
  DllAPI.ReadClockRecordTotal := GetProcAddress(hDll,'ReadClockRecordTotal');
  DllAPI.ReadAllRecord := GetProcAddress(hDll,'ReadAllRecord');
  DllAPI.ClearAllReadCard := GetProcAddress(hDll,'ClearAllReadCard');
  DllAPI.ReadListCardTotal := GetProcAddress(hDll,'ReadListCardTotal');
  DllAPI.ReadDeviceListCard := GetProcAddress(hDll,'ReadDeviceListCard');
  DllAPI.ClearAllNamelist := GetProcAddress(hDll,'ClearAllNamelist');
  DllAPI.SetAllowedCard := GetProcAddress(hDll,'SetAllowedCard');
  DllAPI.SetClockTime := GetProcAddress(hDll,'SetClockTime');
  Result := True;
end;

procedure FreeDll;
begin
  if CheckHandle(hDll) then
    FreeLibrary(hDll);
end;

function CheckHandle(h: THandle): Boolean;
begin
   Result := (h <> 0) and (h <> INVALID_HANDLE_VALUE);
end;

end.
