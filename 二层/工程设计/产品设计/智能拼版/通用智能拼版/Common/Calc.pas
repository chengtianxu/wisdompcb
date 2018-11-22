unit Calc;

interface

type
  TCalcBlock = record
    W,H: Double;
    R: Boolean;
  end;

  TCalcReg = record
    Xnum,Ynum: Integer;
    Block: TCalcBlock;
    W,H: Double;
    function CalcW(ASpace_X: Double): Double;
    function CalcH(ASpace_H: Double): Double;
    function BlockCount: Integer;
  end;

  PCalc4Reg = ^TCalc4Reg;
  TCalc4Reg = record
    RegCount: Byte;
    AChildCount: Integer;
    PChildCalc4Reg: PCalc4Reg;
    UnUse_W,UnUse_H,W,H: Double;
    RegArr: array of TCalcReg;
    Reg4WithReg23: Byte;
    Tag: Byte;
    Hor_Ver: Byte;//0是上下分 1是水平分
    BIsNull: Boolean;//是否有效
    //Rotate: Boolean;//是否高大于长后旋转了下
  end;

  TCalc4RegArr = array of TCalc4Reg;

//必须确保SheetW > SheetH , PnlW > PnlH
procedure SheetToPnl_A(SheetW,SheetH,PnlW,PnlH: Double;ARotate: Boolean;
  var RetArr: TCalc4RegArr);
procedure SheetToPnl_AB(SheetW,SheetH,PnlW,PnlH: Double;ARotate: Boolean;
  var RetArr: TCalc4RegArr);

procedure PnlCutToSet(Max_W,Max_H,Min_W,Min_H,Set_W,Set_H,Space_X,Space_Y,
  Border_X,Border_Y: Double; var RetArr: TCalc4RegArr);

implementation

uses
  Math, SysUtils, Windows;

procedure GetMaxHV(ABig_W,ABig_H,ASmall_W,ASmall_H: Double;
  ASpace_X,ASpace_Y: Double; ABorder_X,ABorder_Y: Double; out HX,HY,VX,VY: Integer);
begin
  HX := Trunc((ABig_W+0.0000000001 - ABorder_X*2 + ASpace_X) / (ASmall_W + ASpace_X));
  HY := Trunc((ABig_H+0.0000000001 - ABorder_Y*2 + ASpace_Y) / (ASmall_H + ASpace_Y));
  VX := Trunc((ABig_W+0.0000000001 - ABorder_X*2 + ASpace_X) / (ASmall_H + ASpace_X));
  VY := Trunc((ABig_H+0.0000000001 - ABorder_Y*2 + ASpace_Y) / (ASmall_W + ASpace_Y));
  HX := Max(0,HX);
  HY := Max(0,HY);
  VX := Max(0,VX);
  VY := Max(0,VY);
end;

procedure SheetToPnl_A(SheetW,SheetH,PnlW,PnlH: Double;ARotate: Boolean;
  var RetArr: TCalc4RegArr);
var
  tmpArr: TCalc4RegArr;
  I, J: Integer;
begin
  PnlCutToSet(SheetW,SheetH,SheetW - PnlW, SheetH - PnlH,PnlW,PnlH,0,0,0,0,RetArr);
  PnlCutToSet(SheetW,SheetH,SheetW - PnlH, SheetH - PnlW,PnlH,PnlW,0,0,0,0,tmpArr);
  for I := 0 to Length(tmpArr) - 1 do
  begin
    for J := 0 to Length(tmpArr[I].RegArr) - 1 do
    begin
      tmpArr[I].RegArr[J].Block.W := PnlW;
      tmpArr[I].RegArr[J].Block.H := PnlH;
      tmpArr[I].RegArr[J].Block.R := not tmpArr[I].RegArr[J].Block.R;
    end;
    SetLength(RetArr,length(RetArr)+1);
    RetArr[High(RetArr)] := tmpArr[I];
  end;
end;

procedure SheetToPnl_AB(SheetW,SheetH,PnlW,PnlH: Double;ARotate: Boolean;
  var RetArr: TCalc4RegArr);
begin

end;

procedure PnlCutToSet(Max_W,Max_H,Min_W,Min_H,Set_W,Set_H,Space_X,Space_Y,
  Border_X,Border_Y: Double; var RetArr: TCalc4RegArr);
var
  WReg1,WReg2,WReg3,WReg4, LBeginReg: TCalcReg;
  tmpReg4With3, tmpReg4With2: TCalcReg;
  bHasReg1,bHasReg2,bHasReg3: Boolean;
  HX,HY,VX,VY, Reg4With23: Integer;
  tmpSpace: Double;
  tmpRetarr: TCalc4RegArr;
  I: Integer;
  J: Integer;
begin
//首先第一个区域是水平摆放
  //求出Reg1的大小
  LBeginReg.Block.W := Set_W;
  LBeginReg.Block.H := Set_H;
  LBeginReg.Block.R := False;
  LBeginReg.Xnum := 0;
  LBeginReg.Ynum := 0;
  LBeginReg.W := 0;
  LBeginReg.H := 0;
//  if (LBeginReg.W > Max_W) or (LBeginReg.H > Max_H) then Exit;
  WReg1 := LBeginReg;
  while True do
  begin
    WReg1.CalcW(Space_X);
    if WReg1.W <= (Max_W - 2*Border_X) then
    begin
      WReg2 := LBeginReg;
      WReg2.Block.R := True;
      while True do
      begin
        WReg2.CalcW(Space_X);
        if WReg1.Xnum* WReg2.Xnum = 0 then tmpSpace := 0 else tmpSpace := Space_X;
        if (WReg1.W + tmpSpace + WReg2.W <= (Max_W - 2*Border_X)) and
          (WReg1.W + tmpSpace + WReg2.W >= (Min_W - 2*Border_X))
        then
        begin
          WReg1.Ynum := 0;
          WReg1.H := 0;
          while True do
          begin
            WReg1.CalcH(Space_Y);
            WReg3 := LBeginReg;
            WReg3.Block.R := True;
            if WReg1.H <= (Max_H - 2*Border_Y) then
            begin
              while True do
              begin
                WReg3.CalcH(Space_Y);
                if WReg1.Ynum* WReg3.Ynum = 0 then tmpSpace := 0 else tmpSpace := Space_Y;
                if ((WReg1.H + tmpSpace + WReg3.H) <= (Max_H - 2*Border_Y)) and (WReg1.H + tmpSpace + WReg3.H >= (Min_H - 2*Border_Y)) then
                begin
                  WReg2.Ynum := Trunc((WReg1.H + Space_Y)/(Set_W + Space_Y));
                  WReg2.CalcH(Space_Y);

                  WReg3.Xnum := Trunc((WReg1.W + Space_X)/(Set_H + Space_X));
                  WReg3.CalcW(Space_X);

                  bHasReg1 := WReg1.Xnum* WReg1.Ynum <> 0;
                  bHasReg2 := WReg2.Xnum* WReg2.Ynum <> 0;
                  bHasReg3 := WReg3.Xnum* WReg3.Ynum <> 0;
                  WReg4 := LBeginReg;
                  {$REGION '计算Reg4'}
                  //Reg4
                  Reg4With23 := 0;
                  if bHasReg2 and bHasReg3 then
                  begin
                    tmpReg4With2 := LBeginReg;
                    GetMaxHV(WReg2.W,WReg1.H - WReg2.H + WReg3.H,Set_W,Set_H,Space_X,Space_Y,0,0,
                      HX,HY,VX,VY);
                    if HX*HY > VX*VY then
                    begin
                      tmpReg4With2.Xnum := HX;
                      tmpReg4With2.Ynum := HY;
                    end else
                    begin
                      tmpReg4With2.Xnum := VX;
                      tmpReg4With2.Ynum := VY;
                      tmpReg4With2.Block.R := True;
                    end;
                    tmpReg4With2.CalcW(Space_X);
                    tmpReg4With2.CalcH(Space_Y);

                    tmpReg4With3 := LBeginReg;
                    GetMaxHV(WReg1.W - WReg3.W + WReg2.W,WReg3.H,Set_W,Set_H,Space_X,Space_Y,0,0,
                      HX,HY,VX,VY);
                    if HX*HY > VX*VY then
                    begin
                      tmpReg4With3.Xnum := HX;
                      tmpReg4With3.Ynum := HY;
                    end else
                    begin
                      tmpReg4With3.Xnum := VX;
                      tmpReg4With3.Ynum := VY;
                      tmpReg4With3.Block.R := True;
                    end;
                    tmpReg4With3.CalcW(Space_X);
                    tmpReg4With3.CalcH(Space_Y);

                    if tmpReg4With2.Xnum* tmpReg4With2.Ynum > tmpReg4With3.Xnum* tmpReg4With3.Ynum then
                    begin
                      if tmpReg4With2.Block.R = WReg2.Block.R then
                      begin
                        WReg2.Ynum := WReg2.Ynum + tmpReg4With2.Ynum;
                        WReg2.CalcH(Space_Y);
                        Reg4With23 := 0;
                      end else
                      begin
                        WReg4 := tmpReg4With2;
                        Reg4With23 := 2;
                      end;
                    end else
                    if tmpReg4With2.Xnum* tmpReg4With2.Ynum <= tmpReg4With3.Xnum* tmpReg4With3.Ynum then
                    begin
                      if tmpReg4With3.Block.R = WReg3.Block.R then
                      begin
                        WReg3.Xnum := WReg3.Xnum + tmpReg4With3.Xnum;
                        WReg3.CalcW(Space_X);
                        Reg4With23 := 0;
                      end else
                      begin
                        WReg4 := tmpReg4With3;
                        Reg4With23 := 3;
                      end;
                    end;
                  end;
                  {$ENDREGION}

                  {$REGION '添加结果'}
                  if (WReg1.Xnum* WReg1.Ynum + WReg2.Xnum* WReg2.Ynum
                    + WReg3.Xnum* WReg3.Ynum + WReg4.Xnum* WReg4.Ynum) > 0
                  then
                  begin
                  SetLength(RetArr,Length(RetArr)+1);
                  ZeroMemory(@RetArr[High(RetArr)],SizeOf(RetArr[High(RetArr)]));
                  SetLength(RetArr[High(RetArr)].RegArr,4);
                  RetArr[High(RetArr)].RegArr[0] := WReg1;
                  RetArr[High(RetArr)].RegArr[1] := WReg2;
                  RetArr[High(RetArr)].RegArr[2] := WReg3;
                  RetArr[High(RetArr)].RegArr[3] := WReg4;
                  RetArr[High(RetArr)].RegCount := 4;
                  RetArr[High(RetArr)].AChildCount := WReg1.Xnum* WReg1.Ynum + WReg2.Xnum* WReg2.Ynum
                    + WReg3.Xnum* WReg3.Ynum + WReg4.Xnum* WReg4.Ynum;
                  RetArr[High(RetArr)].UnUse_W := 0;
                  RetArr[High(RetArr)].UnUse_H := 0;
                  RetArr[High(RetArr)].Reg4WithReg23 := Reg4With23;

                  //计算W和H
                  if RetArr[High(RetArr)].RegArr[0].BlockCount = 0 then
                  begin
                    RetArr[High(RetArr)].RegArr[0].W := 0;
                    RetArr[High(RetArr)].RegArr[0].H := 0;
                  end;
                  if RetArr[High(RetArr)].RegArr[1].BlockCount = 0 then
                  begin
                    RetArr[High(RetArr)].RegArr[1].W := 0;
                    RetArr[High(RetArr)].RegArr[1].H := 0;
                  end;
                  if RetArr[High(RetArr)].RegArr[2].BlockCount = 0 then
                  begin
                    RetArr[High(RetArr)].RegArr[2].W := 0;
                    RetArr[High(RetArr)].RegArr[2].H := 0;
                  end;
                  if RetArr[High(RetArr)].RegArr[3].BlockCount = 0 then
                  begin
                    RetArr[High(RetArr)].RegArr[3].W := 0;
                    RetArr[High(RetArr)].RegArr[3].H := 0;
                  end;
                  if (MaxValue([RetArr[High(RetArr)].RegArr[0].W,RetArr[High(RetArr)].RegArr[2].W]) <> 0) and
                     (MaxValue([RetArr[High(RetArr)].RegArr[1].W,RetArr[High(RetArr)].RegArr[3].W]) <> 0)
                  then
                    tmpSpace := Space_X
                  else
                    tmpSpace := 0;
                  RetArr[High(RetArr)].W := MaxValue([RetArr[High(RetArr)].RegArr[0].W,RetArr[High(RetArr)].RegArr[2].W]) +
                                             MaxValue([RetArr[High(RetArr)].RegArr[1].W,RetArr[High(RetArr)].RegArr[3].W])+
                                              tmpSpace + 2*Border_X ;

                  if (MaxValue([RetArr[High(RetArr)].RegArr[0].H,RetArr[High(RetArr)].RegArr[1].H]) <> 0) and
                     (MaxValue([RetArr[High(RetArr)].RegArr[2].H,RetArr[High(RetArr)].RegArr[3].H]) <> 0)
                  then
                    tmpSpace := Space_Y
                  else
                    tmpSpace := 0;
                  RetArr[High(RetArr)].H := MaxValue([RetArr[High(RetArr)].RegArr[0].H,RetArr[High(RetArr)].RegArr[1].H]) +
                                             MaxValue([RetArr[High(RetArr)].RegArr[2].H,RetArr[High(RetArr)].RegArr[3].H])+
                                              tmpSpace + 2*Border_Y ;

//                  if (RetArr[High(RetArr)].H = 16) and (RetArr[High(RetArr)].W = 16) then
//                    Sleep(1);
//                  if bHasReg1 and bHasReg2 then tmpSpace := Space_X else tmpSpace := 0;
//                  RetArr[High(RetArr)].W := WReg1.W + tmpSpace + WReg2.W + 2*Border_X;
//                  if bHasReg1 and bHasReg3 then tmpSpace := Space_Y else tmpSpace := 0;
//                  RetArr[High(RetArr)].H := WReg1.H + tmpSpace + WReg3.H + 2*Border_Y;
//                  if not bHasReg1 and bHasReg2 then
//                    RetArr[High(RetArr)].H := WReg2.H + tmpSpace + WReg3.H + 2*Border_Y;
                  end;
                  {$ENDREGION}
                  WReg3.Ynum := WReg3.Ynum + 1;
                end else
                if (WReg1.H + tmpSpace + WReg3.H <= (Min_H - 2*Border_Y)) then
                begin
                  WReg3.Ynum := WReg3.Ynum + 1;
                end else
                  Break;
              end;
            end else
              Break;
            WReg1.Ynum := WReg1.Ynum + 1;
          end;
          WReg2.Xnum := WReg2.Xnum + 1;
        end else
        if (WReg1.W + tmpSpace + WReg2.W <= (Min_W - 2*Border_X)) then
        begin
          WReg2.Xnum := WReg2.Xnum + 1;
        end else
          Break;
      end;
    end else
      Break;
    WReg1.Xnum := WReg1.Xnum + 1;
  end;


  SetLength(tmpRetarr,Length(RetArr));
  J := 0;
  for I := High(RetArr) downto 0 do
  begin
    tmpRetarr[J] := RetArr[I];
    Inc(J);
  end;
  for I := 0 to High(RetArr) do RetArr[I] := tmpRetarr[I];

end;

{ TCalcReg }

function TCalcReg.BlockCount: Integer;
begin
  Result := Xnum * Ynum;
end;

function TCalcReg.CalcH(ASpace_H: Double): Double;
begin
  if not Block.R then
    H := Ynum*Block.H + (Ynum-1)* ASpace_H
  else
    H := Ynum*Block.W + (Ynum-1)* ASpace_H;
  H := MaxValue([0,H]);
  Result := H;
end;

function TCalcReg.CalcW(ASpace_X: Double): Double;
begin
  if not Block.R then
    W := Xnum*Block.W + (Xnum-1)* ASpace_X
  else
    W := Xnum*Block.H + (Xnum-1)*ASpace_X;
  W := MaxValue([0,W]);
  Result := W;
end;

end.
