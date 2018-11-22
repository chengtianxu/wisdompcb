unit DecisionCubeBugWorkaround;

interface
uses Windows, Mxarrays;

implementation

function GetAvailableMem: Integer;

const

  MaxInt: Int64 = High(Integer);

var

  MemStats: TMemoryStatus;

  Available: Int64;

begin

  GlobalMemoryStatus(MemStats);

  if (MemStats.dwAvailPhys > MaxInt) or (Longint(MemStats.dwAvailPhys) = -1) then

    Available := MaxInt

  else

    Available := MemStats.dwAvailPhys;

  if (MemStats.dwAvailPageFile > MaxInt) or (Longint(MemStats.dwAvailPageFile) = -1) then

    Inc(Available, MaxInt div 2)

  else

    Inc(Available, MemStats.dwAvailPageFile div 2);

  if Available > MaxInt then

    Result := MaxInt

  else

    Result := Available;

end;



initialization

  Mxarrays.SetMemoryCapacity(GetAvailableMem);

end. 
