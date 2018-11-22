unit ZKCalc;

interface
uses
  IRetIntf, SysUtils, Windows;

function MakeHorZKReg(m6Length,m3Length: Double ;m6Count,m3Count: Integer; out outZKReg: TFloatRect; out outZKArr: TFloatRectArr; ZKRegMaxW,ZkRegMaxH: Double): Boolean;
function MakeVerZKReg(m6Length,m3Length: Double ;m6Count,m3Count: Integer; out outZKReg: TFloatRect; out outZKArr: TFloatRectArr; ZKRegMaxW,ZkRegMaxH: Double): Boolean;

implementation

function MakeHorZKReg(m6Length,m3Length: Double ;m6Count, m3Count: Integer;
  out outZKReg: TFloatRect; out outZKArr: TFloatRectArr; ZKRegMaxW,
  ZkRegMaxH: Double): Boolean;
var
  L6Rc,L3Rc: TFloatRect;
  I: Integer;
  LRow,LCol: Integer;
  LRect,LastRC6: TFloatRect;
  bHasLRc6: Boolean;
  tmp: Integer;
begin
  outZKReg.ArrowCB := 0;
  Result := False;
  L6Rc.X := 0;
  L6Rc.Y := 0;
  L6Rc.W := m6Length;
  L6Rc.H := 6*2;
  L3Rc := L6Rc;
  L3Rc.W := m3Length;
  L3Rc.H := 3*2;
  outZKReg.X := 0;
  outZKReg.Y := 0;
  outZKReg.W := 0;
  outZKReg.H := 0;
  LRow := 0;
  LCol := 0;
  LRect := L6Rc;
  if (m6Count=0) and (m3Count=0) then Exit;
  if (m6Count <> 0) and ((m6Length > ZKRegMaxW) or (ZkRegMaxH < 6)) then Exit;
  if (m3Count <> 0) and ((m3Length > ZKRegMaxW) or (ZkRegMaxH < 3)) then Exit;

  for I := 1 to m6Count do
  begin
    LRect := L6Rc;
    if (L6Rc.X + L6Rc.W * (LCol+1)) <= ZKRegMaxW then
    begin
      if (L6Rc.Y + L6Rc.H * (LRow+1)) > ZkRegMaxH then
      begin
        SetLength(outZKArr,0);
        outZKReg.X := 0;
        outZKReg.Y := 0;
        outZKReg.W := 0;
        outZKReg.H := 0;
        Exit;
      end;
      LRect.X := L6Rc.X + L6Rc.W * LCol;
      LRect.Y := L6Rc.Y + L6Rc.H * LRow;
      LCol := LCol + 1;
    end else
    begin
      LRow := LRow + 1;
      LCol := 0;
      if (L6Rc.Y + L6Rc.H * (LRow+1)) <= ZkRegMaxH then
      begin
        LRect.X := L6Rc.X + L6Rc.W * LCol;
        LRect.Y := L6Rc.Y + L6Rc.H * LRow;
        LCol := LCol + 1;
      end else
      begin
        SetLength(outZKArr,0);
        outZKReg.X := 0;
        outZKReg.Y := 0;
        outZKReg.W := 0;
        outZKReg.H := 0;
        Exit;
      end;
    end;
    SetLength(outZKArr,Length(outZKArr)+1);
    outZKArr[High(outZKArr)] := LRect;
    if outZKReg.X + outZKReg.W < LRect.X + LRect.W then outZKReg.W := LRect.X + LRect.W;
    if outZKReg.Y + outZKReg.H < LRect.Y + LRect.H then outZKReg.H := outZKReg.H + LRect.H;
  end;

  LCol := 0;
//  LRow := 0;
  LastRC6 := LRect;
  bHasLRc6 := (LastRC6.X + LastRC6.W + L3Rc.W <= ZKRegMaxW) and (m6Count > 0);
  tmp := 0;
  if bHasLRc6 then
  begin
    for I := 1 to m3Count do
    begin
      LRect := L3Rc;
      if LastRC6.X + LastRC6.W + L3Rc.W*(LCol + 1) <= ZKRegMaxW then
      begin
        if (I mod 2) = 0 then
        begin
          LRow := 1;
        end else
        begin
          LRow := 0;
        end;
        LRect.X := LastRC6.X + LastRC6.W + L3Rc.W*LCol;
        LRect.Y := LastRC6.Y + L3Rc.H*LRow;
        if (I mod 2) = 0 then LCol := LCol + 1;
        SetLength(outZKArr,Length(outZKArr)+1);
        outZKArr[High(outZKArr)] := LRect;
        if outZKReg.X + outZKReg.W < LRect.X + LRect.W then outZKReg.W := LRect.X + LRect.W;
        if outZKReg.Y + outZKReg.H < LRect.Y + LRect.H then outZKReg.H := outZKReg.H + LRect.H;
      end else
      begin
        //bHasLRc6 := False;
        Break;
      end;
      tmp := tmp + 1;
    end;
  end;

  LRow := 0;
  LCol := 0;
  if m6Count = 0 then ZeroMemory(@LastRC6,SizeOf(LastRC6));
  for I := 1 to (m3Count-tmp) do
  begin
    LRect := L3Rc;
    if (L3Rc.X + L3Rc.W * (LCol+1)) <= ZKRegMaxW then
    begin
      if (LastRC6.Y + LastRC6.H + L3Rc.Y + L3Rc.H * (LRow+1)) > ZkRegMaxH then
      begin
        SetLength(outZKArr,0);
        outZKReg.X := 0;
        outZKReg.Y := 0;
        outZKReg.W := 0;
        outZKReg.H := 0;
        Exit;
      end;
      LRect.X := L3Rc.X + L3Rc.W * LCol;
      LRect.Y := LastRC6.Y + LastRC6.H + L3Rc.Y + L3Rc.H * LRow;
      LCol := LCol + 1;
    end else
    begin
      LRow := LRow + 1;
      LCol := 0;
      if (LastRC6.Y + LastRC6.H + L3Rc.Y + L3Rc.H * (LRow+1)) <= ZkRegMaxH then
      begin
        LRect.X := L3Rc.X + L3Rc.W * LCol;
        LRect.Y := LastRC6.Y + LastRC6.H + L3Rc.Y + L3Rc.H * LRow;
        LCol := LCol + 1;
      end else
      begin
        SetLength(outZKArr,0);
        outZKReg.X := 0;
        outZKReg.Y := 0;
        outZKReg.W := 0;
        outZKReg.H := 0;
        Exit;
      end;
    end;
    SetLength(outZKArr,Length(outZKArr)+1);
    outZKArr[High(outZKArr)] := LRect;
    if outZKReg.X + outZKReg.W < LRect.X + LRect.W then outZKReg.W := LRect.X + LRect.W;
    if outZKReg.Y + outZKReg.H < LRect.Y + LRect.H then outZKReg.H := outZKReg.H + LRect.H;
  end;
  outZKReg.ArrowCB := 1;
  outZKReg.RegIndex := m6Count;
  outZKReg.ColumIndex := m3Count;
  Result := True;
end;


function MakeVerZKReg(m6Length,m3Length: Double ;m6Count, m3Count: Integer;
  out outZKReg: TFloatRect; out outZKArr: TFloatRectArr; ZKRegMaxW,
  ZkRegMaxH: Double): Boolean;
var
  L6Rc,L3Rc: TFloatRect;
  I: Integer;
  LRow,LCol: Integer;
  LRect,LastRC6: TFloatRect;
  bHasLRc6: Boolean;
  tmp: Integer;
begin
  outZKReg.ArrowCB := 0;
  Result := False;
  L6Rc.X := 0;
  L6Rc.Y := 0;
  L6Rc.W := 6*2;
  L6Rc.H := m6Length;
  L3Rc := L6Rc;
  L3Rc.H := m3Length;
  L3Rc.W := 3*2;
  outZKReg.X := 0;
  outZKReg.Y := 0;
  outZKReg.W := 0;
  outZKReg.H := 0;
  LRow := 0;
  LCol := 0;
  LRect := L6Rc;
  if (m6Count=0) and (m3Count=0) then Exit;
  if (m6Count <> 0) and ((m6Length > ZKRegMaxH) or (ZkRegMaxW < 6)) then Exit;
  if (m3Count <> 0) and ((m3Length > ZKRegMaxH) or (ZkRegMaxW < 3)) then Exit;

  for I := 1 to m6Count do
  begin
    LRect := L6Rc;
    if (L6Rc.Y + L6Rc.H * (LRow + 1)) <= ZKRegMaxH then
    begin
      if (L6Rc.X + L6Rc.W * (LCol+1)) > ZkRegMaxW then
      begin
        SetLength(outZKArr,0);
        outZKReg.X := 0;
        outZKReg.Y := 0;
        outZKReg.W := 0;
        outZKReg.H := 0;
        Exit;
      end;
      LRect.X := L6Rc.X + L6Rc.W * LCol;
      LRect.Y := L6Rc.Y + L6Rc.H * LRow;
      LRow := LRow + 1;
    end else
    begin
      LCol := LCol + 1;
      LRow := 0;
      if (L6Rc.X + L6Rc.W * (LCol+1)) <= ZkRegMaxW then
      begin
        LRect.X := L6Rc.X + L6Rc.W * LCol;
        LRect.Y := L6Rc.Y + L6Rc.H * LRow;
        LRow := LRow + 1;
      end else
      begin
        SetLength(outZKArr,0);
        outZKReg.X := 0;
        outZKReg.Y := 0;
        outZKReg.W := 0;
        outZKReg.H := 0;
        Exit;
      end;
    end;
    SetLength(outZKArr,Length(outZKArr)+1);
    outZKArr[High(outZKArr)] := LRect;
    if outZKReg.X + outZKReg.W < LRect.X + LRect.W then outZKReg.W := LRect.X + LRect.W;
    if outZKReg.Y + outZKReg.H < LRect.Y + LRect.H then outZKReg.H := outZKReg.H + LRect.H;
  end;

//  LCol := 0;
  LRow := 0;
  LastRC6 := LRect;
  bHasLRc6 := (LastRC6.Y + LastRC6.H + L3Rc.H <= ZKRegMaxH) and (m6Count > 0);
  tmp := 0;
  if bHasLRc6 then
  begin
    for I := 1 to m3Count do
    begin
      LRect := L3Rc;
      if LastRC6.Y + LastRC6.H + L3Rc.H*(LRow + 1) <= ZKRegMaxH then
      begin
        if (I mod 2) = 0 then
        begin
          LCol := 1;
        end else
        begin
          LCol := 0;
        end;
        LRect.X := LastRC6.X + L3Rc.W*LCol;
        LRect.Y := LastRC6.Y + LastRC6.H + L3Rc.H*LRow;
        if (I mod 2) = 0 then LRow := LRow + 1;
        SetLength(outZKArr,Length(outZKArr)+1);
        outZKArr[High(outZKArr)] := LRect;
        if outZKReg.X + outZKReg.W < LRect.X + LRect.W then outZKReg.W := LRect.X + LRect.W;
        if outZKReg.Y + outZKReg.H < LRect.Y + LRect.H then outZKReg.H := outZKReg.H + LRect.H;
      end else
      begin
        //bHasLRc6 := False;
        Break;
      end;
      tmp := tmp + 1;
    end;
  end;

  LRow := 0;
  LCol := 0;
  if m6Count = 0 then ZeroMemory(@LastRC6,SizeOf(LastRC6));
  for I := 1 to (m3Count-tmp) do
  begin
    LRect := L3Rc;
    if (L3Rc.Y + L3Rc.H * (LRow+1)) <= ZKRegMaxH then
    begin
      if (LastRC6.X + LastRC6.W + L3Rc.X + L3Rc.W * (LCol+1)) > ZkRegMaxW then
      begin
        SetLength(outZKArr,0);
        outZKReg.X := 0;
        outZKReg.Y := 0;
        outZKReg.W := 0;
        outZKReg.H := 0;
        Exit;
      end;
      LRect.X := LastRC6.X + LastRC6.W + L3Rc.W * LCol;
      LRect.Y := L3Rc.Y + L3Rc.H * LRow;
      LRow := LRow + 1;
    end else
    begin
      LCol := LCol + 1;
      LRow := 0;
      if (LastRC6.X + LastRC6.W + L3Rc.X + L3Rc.W * (LCol+1)) <= ZkRegMaxW then
      begin
        LRect.X := LastRC6.X + LastRC6.W + L3Rc.W * LCol;
        LRect.Y := L3Rc.Y + L3Rc.H * LRow;
        LRow := LRow + 1;
      end else
      begin
        SetLength(outZKArr,0);
        outZKReg.X := 0;
        outZKReg.Y := 0;
        outZKReg.W := 0;
        outZKReg.H := 0;
        Exit;
      end;
    end;
    SetLength(outZKArr,Length(outZKArr)+1);
    outZKArr[High(outZKArr)] := LRect;
    if outZKReg.X + outZKReg.W < LRect.X + LRect.W then outZKReg.W := LRect.X + LRect.W;
    if outZKReg.Y + outZKReg.H < LRect.Y + LRect.H then outZKReg.H := outZKReg.H + LRect.H;
  end;
  outZKReg.ArrowCB := 2;
  outZKReg.RegIndex := m6Count;
  outZKReg.ColumIndex := m3Count;
  Result := True;
end;

end.
