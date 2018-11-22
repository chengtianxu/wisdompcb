unit Adapter;

interface
uses
  Calc, IniFiles, IRetIntf, CalcParam, Classes, ComCtrls, SysUtils;

const
  g_MapSize = 480;

function Calc4RegToIBlock4Reg(ACalcRet: TCalc4Reg;ASpace_X,ASpace_Y,ABorder_X,ABorder_Y: Double): IBlock4Reg;
//function LoadDefCutParamFromIni(var AParam: TCutParam; AFileName: string; AList: TListview): IRet;
//function IRetToIni(ARet: IRet; AFileName: string): Boolean;
function Calc4RegToPaintData(ACalcRet: TCalc4Reg;ASpace_X,ASpace_Y,ABorder_X,ABorder_Y: Double; MakeCenter: Boolean = True; offsetX: double = 0;offsetY: Double = 0): TPaintData;

implementation

uses
  DrawEngine_2, GdiPlus, Math, Windows, Dialogs;


function Calc4RegToPaintData2(ACalcRet: TCalc4Reg;ASpace_X,ASpace_Y,ABorder_X,ABorder_Y: Double;MakeCenter: Boolean = True;offsetX: double = 0;offsetY: Double = 0): TPaintData;
var
  LNewSpaceX,LNewSpaceY,LNewBlockW,LNewBlockH,LNewBorderX,LNewBorderY: Double;
  LOldMapW,lOldMapH,LOldSpaceX,LOldSpaceY,LOldBlockW,lOldBlockH: Double;
  LZoom: Double;
  LBlock4Reg: IBlock4Reg;
  I,J,K,N: Integer;
  lCalcRet: TCalc4Reg;
  LPaintReg1W,LPaintReg1H,LPaintReg2H,LPaintReg3W,LLeft,LRight,LTop,LBottom: Double;
begin
  LOldMapW := ACalcRet.W;
  lOldMapH := ACalcRet.H;
  LZoom := g_MapSize / MaxValue([LOldMapW,lOldMapH]);
  LNewSpaceX := ASpace_X * LZoom;
  LNewSpaceY := ASpace_Y * LZoom;
  LNewBorderX := ABorder_X * LZoom;
  LNewBorderY := ABorder_Y * LZoom;
  LNewBlockW := ACalcRet.RegArr[0].Block.W * LZoom;
  LNewBlockH := ACalcRet.RegArr[0].Block.H * LZoom;
  lCalcRet := ACalcRet;
  lCalcRet.RegArr[0].Block.W := LNewBlockW;
  lCalcRet.RegArr[0].Block.H := LNewBlockH;
  lCalcRet.RegArr[1].Block.W := LNewBlockW;
  lCalcRet.RegArr[1].Block.H := LNewBlockH;
  lCalcRet.RegArr[2].Block.W := LNewBlockW;
  lCalcRet.RegArr[2].Block.H := LNewBlockH;
  lCalcRet.RegArr[3].Block.W := LNewBlockW;
  lCalcRet.RegArr[3].Block.H := LNewBlockH;

  if (LNewSpaceX < 10) and (LNewSpaceX > 0) then LNewSpaceX := 4;
  if (LNewSpaceY < 10) and (LNewSpaceY > 0) then LNewSpaceY := 4;
  if (LNewBorderX < 10) and (LNewBorderX > 0) then LNewBorderX := 4;
  if (LNewBorderY < 10) and (LNewBorderY > 0) then LNewBorderY := 4;

  LBlock4Reg := Calc4RegToIBlock4Reg(lCalcRet,LNewSpaceX,LNewSpaceY,LNewBorderX,LNewBorderY);
  SetLength(Result.BlockArr,0);
  Result.Reg.X := 0;
  Result.Reg.Y := 0;
  Result.Reg.W := LBlock4Reg.W;
  Result.Reg.H := LBlock4Reg.H;
  for I := 0 to LBlock4Reg.Regs.Count - 1 do
  begin
    for J := 0 to LBlock4Reg.Regs[I].Colums.Count - 1 do
    begin
      for K := 0 to LBlock4Reg.Regs[I].Colums[J].Rows.Count - 1 do
      begin
        SetLength(Result.BlockArr,Length(Result.BlockArr)+1);
        N := High(Result.BlockArr);
        Result.BlockArr[N].RegIndex := I;
        Result.BlockArr[N].ColumIndex := J;
        Result.BlockArr[N].RowIndex := K;
        Result.BlockArr[N].X := LBlock4Reg.Regs[I].Colums[J].Rows[K].X + offsetX;
        Result.BlockArr[N].Y := LBlock4Reg.Regs[I].Colums[J].Rows[K].Y + offsetY;
        if not LBlock4Reg.Regs[I].Colums[J].Rows[K].Rotate then
        begin
          Result.BlockArr[N].W := LBlock4Reg.Regs[I].Colums[J].Rows[K].W;
          Result.BlockArr[N].H := LBlock4Reg.Regs[I].Colums[J].Rows[K].H;
        end else
        begin
          Result.BlockArr[N].W := LBlock4Reg.Regs[I].Colums[J].Rows[K].H;
          Result.BlockArr[N].H := LBlock4Reg.Regs[I].Colums[J].Rows[K].W;
        end;
      end;
    end;
  end;


  if MakeCenter then
  begin
  //调整居中
  //LPaintReg1W := 0; LPaintReg1H := 0;
  //LPaintReg2W := 0; LPaintReg2H := 0;
  //LPaintReg3W := 0; LPaintReg3H := 0;
  {$REGION '取得 PaintReg_W'}
  LLeft := MaxInt; LRight := 0; LTop := MAXINT; LBottom := 0;
  for I := 0 to Length(Result.BlockArr) - 1 do
  begin
    if Result.BlockArr[I].RegIndex = 0 then
    begin
      if Result.BlockArr[I].X < LLeft then LLeft := Result.BlockArr[I].X;
      if (Result.BlockArr[I].X + Result.BlockArr[I].W) > LRight then LRight := (Result.BlockArr[I].X + Result.BlockArr[I].W);
      if Result.BlockArr[I].Y < LTop then LTop := Result.BlockArr[I].Y;
      if (Result.BlockArr[I].Y + Result.BlockArr[I].H) > LBottom then LBottom := (Result.BlockArr[I].Y + Result.BlockArr[I].H);
    end;
  end;
  LPaintReg1W := LRight - LLeft;
  LPaintReg1H := LBottom - LTop;

  LLeft := MaxInt; LRight := 0; LTop := MAXINT; LBottom := 0;
  for I := 0 to Length(Result.BlockArr) - 1 do
  begin
    if Result.BlockArr[I].RegIndex = 1 then
    begin
      if Result.BlockArr[I].X < LLeft then LLeft := Result.BlockArr[I].X;
      if (Result.BlockArr[I].X + Result.BlockArr[I].W) > LRight then LRight := (Result.BlockArr[I].X + Result.BlockArr[I].W);
      if Result.BlockArr[I].Y < LTop then LTop := Result.BlockArr[I].Y;
      if (Result.BlockArr[I].Y + Result.BlockArr[I].H) > LBottom then LBottom := (Result.BlockArr[I].Y + Result.BlockArr[I].H);
    end;
  end;
  //LPaintReg2W := LRight - LLeft;
  LPaintReg2H := LBottom - LTop;

  LLeft := MaxInt; LRight := 0; LTop := MAXINT; LBottom := 0;
  for I := 0 to Length(Result.BlockArr) - 1 do
  begin
    if Result.BlockArr[I].RegIndex = 2 then
    begin
      if Result.BlockArr[I].X < LLeft then LLeft := Result.BlockArr[I].X;
      if (Result.BlockArr[I].X + Result.BlockArr[I].W) > LRight then LRight := (Result.BlockArr[I].X + Result.BlockArr[I].W);
      if Result.BlockArr[I].Y < LTop then LTop := Result.BlockArr[I].Y;
      if (Result.BlockArr[I].Y + Result.BlockArr[I].H) > LBottom then LBottom := (Result.BlockArr[I].Y + Result.BlockArr[I].H);
    end;
  end;
  LPaintReg3W := LRight - LLeft;
  //LPaintReg3H := LBottom - LTop;
  {$ENDREGION}

  //只有Reg1,Reg2
  if (ACalcRet.RegArr[0].BlockCount <> 0) and
     (ACalcRet.RegArr[1].BlockCount <> 0) and
     (ACalcRet.RegArr[2].BlockCount = 0) and
     (ACalcRet.RegArr[3].BlockCount = 0)
  then
  begin
    if LPaintReg1H > LPaintReg2H then
    begin
      for I := 0 to Length(Result.BlockArr) - 1 do
      begin
        if Result.BlockArr[I].RegIndex = 1 then
        begin
          Result.BlockArr[I].Y := Result.BlockArr[I].Y + (LPaintReg1H - LPaintReg2H)/2;
        end;
      end;
    end else
    if LPaintReg1H < LPaintReg2H then
    begin
      for I := 0 to Length(Result.BlockArr) - 1 do
      begin
        if Result.BlockArr[I].RegIndex = 0 then
        begin
          Result.BlockArr[I].Y := Result.BlockArr[I].Y + (LPaintReg2H - LPaintReg1H)/2;
        end;
      end;
    end;
  end else
  //只有Reg1,Reg3
  if (ACalcRet.RegArr[0].BlockCount <> 0) and
     (ACalcRet.RegArr[1].BlockCount = 0) and
     (ACalcRet.RegArr[2].BlockCount <> 0) and
     (ACalcRet.RegArr[3].BlockCount = 0)
  then
  begin
    if LPaintReg1W > LPaintReg3W then
    begin
      for I := 0 to Length(Result.BlockArr) - 1 do
      begin
        if Result.BlockArr[I].RegIndex = 2 then
        begin
          Result.BlockArr[I].X := Result.BlockArr[I].X + (LPaintReg1W - LPaintReg3W)/2;
        end;
      end;
    end else
    begin
      for I := 0 to Length(Result.BlockArr) - 1 do
      begin
        if Result.BlockArr[I].RegIndex = 0 then
        begin
          Result.BlockArr[I].X := Result.BlockArr[I].X + (LPaintReg3W - LPaintReg1W)/2;
        end;
      end;
    end;
  end;
  end;

end;

function Calc4RegToPaintData(ACalcRet: TCalc4Reg;ASpace_X,ASpace_Y,ABorder_X,ABorder_Y: Double;MakeCenter: Boolean = True;offsetX: double = 0;offsetY: Double = 0): TPaintData;
var
  LBlock4Reg: IBlock4Reg;
  I: Integer;
  J: Integer;
  K: Integer;
  N: Integer;
  LPaintReg1W,LPaintReg1H,
  LPaintReg2H,
  LPaintReg3W,
  LLeft,LRight,LTop,LBottom: Double;
begin
//  Result := Calc4RegToPaintData2(ACalcRet,ASpace_X,ASpace_Y,ABorder_X,ABorder_Y);
//  Exit;
  if (ASpace_X < 10) and (ASpace_X > 0) then ASpace_X := 10;
  if (ASpace_Y < 10) and (ASpace_Y > 0) then ASpace_Y := 10;
  if (ABorder_X < 10) and (ABorder_X > 0) then ABorder_X := 10;
  if (ABorder_Y < 10) and (ABorder_Y > 0) then ABorder_Y := 10;
  LBlock4Reg := Calc4RegToIBlock4Reg(ACalcRet,ASpace_X,ASpace_Y,ABorder_X,ABorder_Y);
  SetLength(Result.BlockArr,0);
  Result.Reg.X := 0;
  Result.Reg.Y := 0;
  Result.Reg.W := LBlock4Reg.W;
  Result.Reg.H := LBlock4Reg.H;
  for I := 0 to LBlock4Reg.Regs.Count - 1 do
  begin
    for J := 0 to LBlock4Reg.Regs[I].Colums.Count - 1 do
    begin
      for K := 0 to LBlock4Reg.Regs[I].Colums[J].Rows.Count - 1 do
      begin
        SetLength(Result.BlockArr,Length(Result.BlockArr)+1);
        N := High(Result.BlockArr);
        Result.BlockArr[N].RegIndex := I;
        Result.BlockArr[N].ColumIndex := J;
        Result.BlockArr[N].RowIndex := K;
        Result.BlockArr[N].X := LBlock4Reg.Regs[I].Colums[J].Rows[K].X + offsetX;
        Result.BlockArr[N].Y := LBlock4Reg.Regs[I].Colums[J].Rows[K].Y + offsetY;
        if not LBlock4Reg.Regs[I].Colums[J].Rows[K].Rotate then
        begin
          Result.BlockArr[N].W := LBlock4Reg.Regs[I].Colums[J].Rows[K].W;
          Result.BlockArr[N].H := LBlock4Reg.Regs[I].Colums[J].Rows[K].H;
        end else
        begin
          Result.BlockArr[N].W := LBlock4Reg.Regs[I].Colums[J].Rows[K].H;
          Result.BlockArr[N].H := LBlock4Reg.Regs[I].Colums[J].Rows[K].W;
        end;
      end;
    end;
  end;


  if MakeCenter then
  begin
  //调整居中
  //LPaintReg1W := 0; LPaintReg1H := 0;
  //LPaintReg2W := 0; LPaintReg2H := 0;
  //LPaintReg3W := 0; LPaintReg3H := 0;
  {$REGION '取得 PaintReg_W'}
  LLeft := MaxInt; LRight := 0; LTop := MAXINT; LBottom := 0;
  for I := 0 to Length(Result.BlockArr) - 1 do
  begin
    if Result.BlockArr[I].RegIndex = 0 then
    begin
      if Result.BlockArr[I].X < LLeft then LLeft := Result.BlockArr[I].X;
      if (Result.BlockArr[I].X + Result.BlockArr[I].W) > LRight then LRight := (Result.BlockArr[I].X + Result.BlockArr[I].W);
      if Result.BlockArr[I].Y < LTop then LTop := Result.BlockArr[I].Y;
      if (Result.BlockArr[I].Y + Result.BlockArr[I].H) > LBottom then LBottom := (Result.BlockArr[I].Y + Result.BlockArr[I].H);
    end;
  end;
  LPaintReg1W := LRight - LLeft;
  LPaintReg1H := LBottom - LTop;

  LLeft := MaxInt; LRight := 0; LTop := MAXINT; LBottom := 0;
  for I := 0 to Length(Result.BlockArr) - 1 do
  begin
    if Result.BlockArr[I].RegIndex = 1 then
    begin
      if Result.BlockArr[I].X < LLeft then LLeft := Result.BlockArr[I].X;
      if (Result.BlockArr[I].X + Result.BlockArr[I].W) > LRight then LRight := (Result.BlockArr[I].X + Result.BlockArr[I].W);
      if Result.BlockArr[I].Y < LTop then LTop := Result.BlockArr[I].Y;
      if (Result.BlockArr[I].Y + Result.BlockArr[I].H) > LBottom then LBottom := (Result.BlockArr[I].Y + Result.BlockArr[I].H);
    end;
  end;
  //LPaintReg2W := LRight - LLeft;
  LPaintReg2H := LBottom - LTop;

  LLeft := MaxInt; LRight := 0; LTop := MAXINT; LBottom := 0;
  for I := 0 to Length(Result.BlockArr) - 1 do
  begin
    if Result.BlockArr[I].RegIndex = 2 then
    begin
      if Result.BlockArr[I].X < LLeft then LLeft := Result.BlockArr[I].X;
      if (Result.BlockArr[I].X + Result.BlockArr[I].W) > LRight then LRight := (Result.BlockArr[I].X + Result.BlockArr[I].W);
      if Result.BlockArr[I].Y < LTop then LTop := Result.BlockArr[I].Y;
      if (Result.BlockArr[I].Y + Result.BlockArr[I].H) > LBottom then LBottom := (Result.BlockArr[I].Y + Result.BlockArr[I].H);
    end;
  end;
  LPaintReg3W := LRight - LLeft;
  //LPaintReg3H := LBottom - LTop;
  {$ENDREGION}

  //只有Reg1,Reg2
  if (ACalcRet.RegArr[0].BlockCount <> 0) and
     (ACalcRet.RegArr[1].BlockCount <> 0) and
     (ACalcRet.RegArr[2].BlockCount = 0) and
     (ACalcRet.RegArr[3].BlockCount = 0)
  then
  begin
    if LPaintReg1H > LPaintReg2H then
    begin
      for I := 0 to Length(Result.BlockArr) - 1 do
      begin
        if Result.BlockArr[I].RegIndex = 1 then
        begin
          Result.BlockArr[I].Y := Result.BlockArr[I].Y + (LPaintReg1H - LPaintReg2H)/2;
        end;
      end;
    end else
    if LPaintReg1H < LPaintReg2H then
    begin
      for I := 0 to Length(Result.BlockArr) - 1 do
      begin
        if Result.BlockArr[I].RegIndex = 0 then
        begin
          Result.BlockArr[I].Y := Result.BlockArr[I].Y + (LPaintReg2H - LPaintReg1H)/2;
        end;
      end;
    end;
  end else
  //只有Reg1,Reg3
  if (ACalcRet.RegArr[0].BlockCount <> 0) and
     (ACalcRet.RegArr[1].BlockCount = 0) and
     (ACalcRet.RegArr[2].BlockCount <> 0) and
     (ACalcRet.RegArr[3].BlockCount = 0)
  then
  begin
    if LPaintReg1W > LPaintReg3W then
    begin
      for I := 0 to Length(Result.BlockArr) - 1 do
      begin
        if Result.BlockArr[I].RegIndex = 2 then
        begin
          Result.BlockArr[I].X := Result.BlockArr[I].X + (LPaintReg1W - LPaintReg3W)/2;
        end;
      end;
    end else
    begin
      for I := 0 to Length(Result.BlockArr) - 1 do
      begin
        if Result.BlockArr[I].RegIndex = 0 then
        begin
          Result.BlockArr[I].X := Result.BlockArr[I].X + (LPaintReg3W - LPaintReg1W)/2;
        end;
      end;
    end;
  end;
  end;

end;


function Calc4RegToIBlock4Reg(ACalcRet: TCalc4Reg;ASpace_X,ASpace_Y,ABorder_X,ABorder_Y: Double): IBlock4Reg;
var
  I,X,Y: Integer;
  RegR: Boolean;
  LArr2d: IBlockColumArr;
  LCol: IBlockColum;
  LBlock: IBlock;
begin
  Result := TBlock4Reg.Create;
  Result.W := ABorder_X;
  Result.H := ABorder_Y;
  for I := 0 to High(ACalcRet.RegArr) do
  begin
    LArr2d := Result.AddReg();
    if not ACalcRet.RegArr[I].Block.R then
    begin
      LArr2d.W := ACalcRet.RegArr[I].Xnum* ACalcRet.RegArr[I].Block.W + (ACalcRet.RegArr[I].Xnum-1)* ASpace_X;
      LArr2d.H := ACalcRet.RegArr[I].Ynum* ACalcRet.RegArr[I].Block.H + (ACalcRet.RegArr[I].Ynum-1)* ASpace_Y;
    end else
    begin
      LArr2d.W := ACalcRet.RegArr[I].Xnum* ACalcRet.RegArr[I].Block.H + (ACalcRet.RegArr[I].Xnum-1)* ASpace_X;
      LArr2d.H := ACalcRet.RegArr[I].Ynum* ACalcRet.RegArr[I].Block.W + (ACalcRet.RegArr[I].Ynum-1)* ASpace_Y;
    end;
    if ACalcRet.RegArr[I].Xnum* ACalcRet.RegArr[I].Ynum = 0 then
    begin
      LArr2d.W := 0;
      LArr2d.H := 0;
    end;
    if LArr2d.W < 0 then LArr2d.W := 0;
    if LArr2d.H < 0 then LArr2d.H := 0;

    //LArr2d.W := ACalcRet.RegArr[I].W;
    //LArr2d.H := ACalcRet.RegArr[I].H;
    case I of
      0:begin
        LArr2d.X := ABorder_X;
        LArr2d.Y := ABorder_Y;
      end;
      1:begin
        if ACalcRet.RegArr[0].Xnum* ACalcRet.RegArr[0].Ynum = 0 then
        begin
          LArr2d.X := ABorder_X;
          LArr2d.Y := ABorder_Y;
        end else
        begin
          LArr2d.X := Result.Regs[0].X + Result.Regs[0].W + ASpace_X;
          LArr2d.Y := ABorder_Y;
        end;
      end;
      2:begin
        if ACalcRet.RegArr[0].Xnum* ACalcRet.RegArr[0].Ynum = 0 then
        begin
          LArr2d.X := ABorder_X;
          LArr2d.Y := ABorder_Y;
        end else
        begin
          LArr2d.X := ABorder_X;
          LArr2d.Y := Result.Regs[0].Y + Result.Regs[0].H + ASpace_Y;
        end;
      end;
      3:begin
        if ACalcRet.Reg4WithReg23 = 2 then
        begin
          if (Result.Regs[0].X+ Result.Regs[0].W) >= (Result.Regs[2].X + Result.Regs[2].W) then
          begin
            LArr2d.X := Result.Regs[0].X + Result.Regs[0].W;
            if Result.Regs[0].CellCount <> 0 then LArr2d.X := LArr2d.X + ASpace_X;
          end else
          begin
            LArr2d.X := Result.Regs[2].X + Result.Regs[2].W;
            if Result.Regs[2].CellCount <> 0 then LArr2d.X := LArr2d.X + ASpace_X;
          end;

          if Result.Regs[1].CellCount <> 0 then
            LArr2d.Y := Result.Regs[1].Y + Result.Regs[1].H + ASpace_Y
          else
            LArr2d.Y := ABorder_Y;
        end;

        if ACalcRet.Reg4WithReg23 = 3 then
        begin
          if Result.Regs[2].CellCount <> 0 then
            LArr2d.X := Result.Regs[2].X + Result.Regs[2].W + ASpace_X
          else
            LArr2d.X := ABorder_X;

          if (Result.Regs[0].Y+ Result.Regs[0].H) >= (Result.Regs[1].Y+ Result.Regs[1].H) then
          begin
            LArr2d.Y := Result.Regs[0].Y + Result.Regs[0].H;
            if Result.Regs[0].CellCount <> 0 then LArr2d.Y := LArr2d.Y + ASpace_Y;
          end else
          begin
            LArr2d.Y := Result.Regs[1].Y + Result.Regs[1].H;
            if Result.Regs[1].CellCount <> 0 then LArr2d.Y := LArr2d.Y + ASpace_Y;
          end;
        end;
      end;
    else
      ;
    end;
    for X := 0 to ACalcRet.RegArr[I].Xnum - 1 do
    begin
      RegR := ACalcRet.RegArr[I].Block.R;
      LCol := LArr2d.AddColum();
      if RegR then LCol.W := ACalcRet.RegArr[I].Block.H else LCol.W := ACalcRet.RegArr[I].Block.W;
      LCol.Y := LArr2d.Y;
      if X = 0 then LCol.X := LArr2d.X else
      begin
        if RegR then
        begin
          LCol.X := LArr2d.X + X*(ACalcRet.RegArr[I].Block.H + ASpace_X);
        end else
        begin
          LCol.X := LArr2d.X + X*(ACalcRet.RegArr[I].Block.W + ASpace_X);
        end;
      end;
      for Y := 0 to ACalcRet.RegArr[I].Ynum - 1 do
      begin
        LBlock := TBlock.Create;
        LBlock.W := ACalcRet.RegArr[I].Block.W;
        LBlock.H := ACalcRet.RegArr[I].Block.H;
        LBlock.Rotate := ACalcRet.RegArr[I].Block.R;
        LBlock.X := LCol.X;
        if Y = 0 then LBlock.Y := LCol.Y else
        begin
          if RegR then
          begin
            LBlock.Y := LCol.Y + Y*(ACalcRet.RegArr[I].Block.W + ASpace_Y);
          end else
          begin
            LBlock.Y := LCol.Y + Y*(ACalcRet.RegArr[I].Block.H + ASpace_Y);

          end;
        end;
        if RegR then
        begin
          LCol.H := Y* LBlock.W + (Y-1)* ASpace_Y;
          Result.W := MaxValue([Result.W, LBlock.X + LBlock.H]);
          Result.H := MaxValue([Result.H, LBlock.Y + LBlock.W]);
        end else
        begin
          LCol.H := Y* LBlock.H + (Y-1)* ASpace_Y;
          Result.W := MaxValue([Result.W, LBlock.X + LBlock.W]);
          Result.H := MaxValue([Result.H, LBlock.Y + LBlock.H]);
        end;
        if LCol.H < 0 then LCol.H := 0;
        LCol.AddRow(LBlock);
      end;
    end;
  end;
  Result.W := Result.W + ABorder_X;
  Result.H := Result.H + ABorder_Y;
end;

function LoadDefCutParamFromIni(var AParam: TCutParam; AFileName: string; AList: TListview): IRet;
var
  LIni: TIniFile;
  LS: TStringlist;
  I,posc: Integer;
  LRet: IRet;
  LCutParam: TCutParam;
  LPnlA, LSheet: IBlock4Reg;
  LPaintData: TPaintData;
  LTmpMap,LDesMap: IGPBitmap;
  LGP: IGPGraphics;
  LW,LH: Integer;
begin
  LIni := TIniFile.Create(AFileName);
  LS := TStringList.Create;
  try
    LIni.ReadSectionValues('SheetList',LS);
    for I := 0 to LS.Count - 1 do
    begin
      with AList.Items.Add do
      begin
        Caption := '';
        posc := Pos('s',LS[I]);
        SubItems.Add(Copy(LS[I],Pos('=',LS[I])+1,Pos('x',LS[I])-Pos('=',LS[I])-1));
        SubItems.Add('X');
        SubItems.Add(Copy(LS[I],Pos('x',LS[I])+1,posc-Pos('x',LS[I])-1));
        if Copy(LS[I],posc+1,Length(LS[I])-Posc) = 'Y' then Checked := True;
      end;
    end;
    AParam.SheetW := LIni.ReadFloat('DefCutParam','SheetW',1245);
    AParam.SheetH := LIni.ReadFloat('DefCutParam','SheetH',1041);
    AParam.PnlAMinW := LIni.ReadFloat('DefCutParam','PnlMinW_A',300);
    AParam.PnlAMaxW := LIni.ReadFloat('DefCutParam','PnlMaxW_A',650);
    AParam.PnlAMinH := LIni.ReadFloat('DefCutParam','PnlMinH_A',300);
    AParam.PnlAMaxH := LIni.ReadFloat('DefCutParam','PnlMaxH_A',650);
    AParam.PnlASetW := LIni.ReadFloat('DefCutParam','PnlSetW_A',110.12);
    AParam.PnlASetH := LIni.ReadFloat('DefCutParam','PnlSetH_A',100.54);
    AParam.PnlASetHorzSpace := LIni.ReadFloat('DefCutParam','SetHorSpace_A',4);
    AParam.PnlASetVertSpace := LIni.ReadFloat('DefCutParam','SetVerSpace_A',6);
    AParam.PnlABorderLeftRightWidth := LIni.ReadFloat('DefCutParam','PnlBorderLeftRightW_A',10);
    AParam.PnlABorderTopBottomWidth := LIni.ReadFloat('DefCutParam','PnlBorderTopBottomW_A',12);

    AParam.PnlBMinW := LIni.ReadFloat('DefCutParam','PnlMinW_B',400);
    AParam.PnlBMaxW := LIni.ReadFloat('DefCutParam','PnlMaxW_B',650);
    AParam.PnlBMinH := LIni.ReadFloat('DefCutParam','PnlMinH_B',400);
    AParam.PnlBMaxH := LIni.ReadFloat('DefCutParam','PnlMaxH_B',650);
    AParam.PnlBSetW := LIni.ReadFloat('DefCutParam','PnlSetW_B',110.12);
    AParam.PnlBSetH := LIni.ReadFloat('DefCutParam','PnlSetH_B',100.54);
    AParam.PnlBSetHorzSpace := LIni.ReadFloat('DefCutParam','SetHorSpace_B',4);
    AParam.PnlBSetVertSpace := LIni.ReadFloat('DefCutParam','SetVerSpace_B',6);
    AParam.PnlBBorderLeftRightWidth := LIni.ReadFloat('DefCutParam','PnlBorderLeftRightW_B',10);
    AParam.PnlBBorderTopBottomWidth := LIni.ReadFloat('DefCutParam','PnlBorderTopBottomW_B',12);

    //如果已经有了结果则查看
    if LIni.ReadInteger('CutRet','HasRet',0) = 1 then
    begin
      ZeroMemory(@LCutParam,SizeOf(LCutParam));
      LRet := TRet.Create;
      LCutParam.SheetW := LIni.ReadFloat('CutRet','SheetW',0);
      LCutParam.SheetH := LIni.ReadFloat('CutRet','SheetH',0);
      LCutParam.PnlASetHorzSpace := LIni.ReadFloat('CutRet','SetHorSapce_A',0);
      LCutParam.PnlASetVertSpace := LIni.ReadFloat('CutRet','SetVerSapce_A',0);
      LCutParam.PnlASetW := LIni.ReadFloat('CutRet','SetW_A',0);
      LCutParam.PnlASetH := LIni.ReadFloat('CutRet','SetH_A',0);
      LCutParam.PnlABorderLeftRightWidth := LIni.ReadFloat('CutRet','PnlLeftRightBorderW_A',0);
      LCutParam.PnlABorderTopBottomWidth := LIni.ReadFloat('CutRet','PnlTopBottomBorderW_A',0);

      LPnlA := TBlock4Reg.Create;
      LPnlA.W := LIni.ReadFloat('CutRet','PnlW_A',0);
      LPnlA.H := LIni.ReadFloat('CutRet','PnlH_A',0);
      if LIni.ReadInteger('CutRet','SetCountPerPnl_A',0) <> 0 then
      begin
        with LPnlA.AddReg().AddColum() do
        begin
          for I := 0 to LIni.ReadInteger('CutRet','SetCountPerPnl_A',0) - 1 do
          begin
            AddRow(TBlock.Create);
          end;
        end;
      end;
      ZeroMemory(@LPaintData,SizeOf(LPaintData));
      if LIni.ReadString('CutRet','PnlImg_A','') <> '' then
        LTmpMap := TGPBitmap.Create(LIni.ReadString('CutRet','PnlImg_A',''));
      LW := LTmpMap.Width;
      LH := LTmpMap.Height;
      LDesMap := TGPBitmap.Create(LW,LH);
      LGP := TGPGraphics.Create(LDesMap);
      LGP.DrawImage(LTmpMap,0,0,LTmpMap.Width,LTmpMap.Height);
      LPaintData.CustomImg := LDesMap;
      LPnlA.PaintData := LPaintData;

      LSheet := TBlock4Reg.Create;
      LSheet.W := LCutParam.SheetW;
      LSheet.H := LCutParam.SheetH;
      if LIni.ReadInteger('CutRet','PnlCount_A',0) <> 0 then
      begin
        with LSheet.AddReg().AddColum() do
        begin
          for I := 0 to LIni.ReadInteger('CutRet','PnlCount_A',0) - 1 do
          begin
            AddRow(TBlock.Create);
          end;
        end;
      end;
      ZeroMemory(@LPaintData,SizeOf(LPaintData));
      if LIni.ReadString('CutRet','SheetImg','') <> '' then
        LTmpMap := TGPBitmap.Create(LIni.ReadString('CutRet','SheetImg',''));
      LW := LTmpMap.Width;
      LH := LTmpMap.Height;
      LDesMap := TGPBitmap.Create(LW,LH);
      LGP := TGPGraphics.Create(LDesMap);
      LGP.DrawImage(LTmpMap,0,0,LTmpMap.Width,LTmpMap.Height);
      LPaintData.CustomImg := LDesMap;
      LSheet.PaintData := LPaintData;
      LSheet.SetUseAge(LIni.ReadFloat('CutRet','SheetUseage',0));

      LRet.CutParam := LCutParam;
      LRet.SheetA := LSheet;
      LRet.PnlA := LPnlA;
    end;

    Result := LRet;
  finally
    LIni.Free;
    LS.Free;
  end;
end;

(*
function IRetToIni(ARet: IRet; AFileName: string): Boolean;
var
  LIni: TIniFile;
  LGP: IGPGraphics;
  LDesBitMap: IGPBitmap;
  LBrush: IGPBrush;
begin
  LIni := TIniFile.Create(AFileName);
  try
    LIni.EraseSection('CutRet');
    LIni.WriteString('CutRet','SheetW',FormatFloat('0.000',ARet.Sheet.W));
    LIni.WriteString('CutRet','SheetH',FormatFloat('0.000',ARet.Sheet.H));
    LIni.WriteString('CutRet','PnlW_A',FormatFloat('0.000',ARet.PnlA.W));
    LIni.WriteString('CutRet','PnlH_A',FormatFloat('0.000',ARet.PnlA.H));
    LIni.WriteString('CutRet','SetW_A',FormatFloat('0.000',ARet.CutParam.PnlASetW));
    LIni.WriteString('CutRet','SetH_A',FormatFloat('0.000',ARet.CutParam.PnlASetH));
    LIni.WriteString('CutRet','SetHorSapce_A',FormatFloat('0.000',ARet.CutParam.PnlASetHorzSpace));
    LIni.WriteString('CutRet','SetVerSpace_A',FormatFloat('0.000',ARet.CutParam.PnlASetVertSpace));
    LIni.WriteString('CutRet','PnlLeftRightBorderW_A',FormatFloat('0.000',ARet.PnlA.PBorderSize^.NowLeftRightW));
    LIni.WriteString('CutRet','PnlTopBottomBorderW_A',FormatFloat('0.000',ARet.PnlA.PBorderSize^.NowTopBottomW));
    LIni.WriteString('CutRet','PnlCount_A',IntToStr(ARet.Sheet.GetCellCount));
    LIni.WriteString('CutRet','SetCountPerPnl_A',IntToStr(ARet.PnlA.GetCellCount));
    LIni.WriteString('CutRet','DoublePnl','0');
    //LIni.WriteString('CutRet','PcsPerSet_A',IntToStr(ARet.PcsPerSet_A));
    //LIni.WriteString('CutRet','PcsW_A',FormatFloat('0.000',ARet.PcsW_A));
    //LIni.WriteString('CutRet','PcsH_A',FormatFloat('0.000',ARet.PcsH_A));
//    if ARet.DoubleCut then
//      LIni.WriteString('CutRet','DoubleCut','1')
//    else
//
//    LIni.WriteString('CutRet','PnlW_B',FormatFloat('0.000',ARet.PnlW_B));
//    LIni.WriteString('CutRet','PnlH_B',FormatFloat('0.000',ARet.PnlH_B));
//    LIni.WriteString('CutRet','SetW_B',FormatFloat('0.000',ARet.SetW_B));
//    LIni.WriteString('CutRet','SetH_B',FormatFloat('0.000',ARet.SetH_B));
//    LIni.WriteString('CutRet','SetHorSapce_B',FormatFloat('0.000',ARet.SetHorSapce_B));
//    LIni.WriteString('CutRet','SetVerSpace_B',FormatFloat('0.000',ARet.SetVerSpace_B));
//    LIni.WriteString('CutRet','PnlLeftRightBorderW_B',FormatFloat('0.000',ARet.PnlLeftRightBorderW_B));
//    LIni.WriteString('CutRet','PnlTopBottomBorderW_B',FormatFloat('0.000',ARet.PnlTopBottomBorderW_B));
//    LIni.WriteString('CutRet','PcsPerSet_B',IntToStr(ARet.PcsPerSet_B));
//    LIni.WriteString('CutRet','PcsW_B',FormatFloat('0.000',ARet.PcsW_B));
//    LIni.WriteString('CutRet','PcsH_B',FormatFloat('0.000',ARet.PcsH_B));
//    LIni.WriteString('CutRet','SheetPnlCount',IntToStr(ARet.SheetPnlCount));
    LIni.WriteString('CutRet','SheetSetCount',IntToStr(ARet.Sheet.GetCellCount* ARet.PnlA.GetCellCount));
//    LIni.WriteString('CutRet','SheetPcsCount',IntToStr(ARet.SheetPcsCount));
//
//    LIni.WriteString('CutRet','PnlCount_B',IntToStr(ARet.PnlCount_B));
//    ;
//    LIni.WriteString('CutRet','SetCountPerPnl_B',IntToStr(ARet.SetCountPerPnl_B));
//    LIni.WriteString('CutRet','SetUseage_A',FormatFloat('0.000',ARet.SetUseage_A));
//    LIni.WriteString('CutRet','SetUseage_B',FormatFloat('0.000',ARet.SetUseage_B));
//    LIni.WriteString('CutRet','PnlUseage_A',FormatFloat('0.000',ARet.PnlUseage_A));
//    LIni.WriteString('CutRet','PnlUseage_B',FormatFloat('0.000',ARet.PnlUseage_B));
    LIni.WriteString('CutRet','SheetUseage',FormatFloat('0.000',ARet.Sheet.GetUseAge));

    if gDrawEng.FGPSheetImg <> nil then
    begin
      LDesBitMap := TGPBitmap.Create(SAVEIMAGEW,SAVEIMAGEH);
      LGP := TGPGraphics.Create(LDesBitMap);
      LBrush := TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR));
      LGP.FillRectangle(LBrush,TGPRectF.Create(0,0,LDesBitMap.Width, LDesBitMap.Height));
      LGP.InterpolationMode := InterpolationModeHighQualityBicubic;
      LGP.DrawImage(gDrawEng.FGPSheetImg,TGPRectF.Create(0,0,LDesBitMap.Width, LDesBitMap.Height),
        0,0,gDrawEng.FGPSheetImg.Width,gDrawEng.FGPSheetImg.Height,UnitPixel);
      LDesBitMap.Save(ExtractFilePath(AFileName)+ 'SheetImg.JPG',TGPImageFormat.Jpeg);
      LIni.WriteString('CutRet','SheetImg',ExtractFilePath(AFileName)+ 'SheetImg.JPG');
    end;
    if gDrawEng.FGPPnlAImg <> nil then
    begin
      LDesBitMap := TGPBitmap.Create(SAVEIMAGEW,SAVEIMAGEH);
      LGP := TGPGraphics.Create(LDesBitMap);
      LBrush := TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR));
      LGP.FillRectangle(LBrush,TGPRectF.Create(0,0,LDesBitMap.Width, LDesBitMap.Height));
      LGP.InterpolationMode := InterpolationModeHighQualityBicubic;
      LGP.DrawImage(gDrawEng.FGPPnlAImg,TGPRectF.Create(0,0,LDesBitMap.Width, LDesBitMap.Height),
        0,0,gDrawEng.FGPPnlAImg.Width,gDrawEng.FGPPnlAImg.Height,UnitPixel);
      LDesBitMap.Save(ExtractFilePath(AFileName)+ 'PnlImg_A.JPG',TGPImageFormat.Jpeg);
      LIni.WriteString('CutRet','PnlImg_A',ExtractFilePath(AFileName)+ 'PnlImg_A.JPG');
    end;
//    if ARet.PnlImg_B <> nil then
//    begin
//      IGPBitmap(ARet.PnlImg_B).Save(ExtractFilePath(AFileName)+ 'PnlImg_B.JPG',TGPImageFormat.Jpeg);
//      LIni.WriteString('CutRet','PnlImg_B',ExtractFilePath(AFileName)+ 'PnlImg_B.JPG');
//    end;
    Result := True;
  finally
    LIni.Free;
  end;
end;
 *)
end.
