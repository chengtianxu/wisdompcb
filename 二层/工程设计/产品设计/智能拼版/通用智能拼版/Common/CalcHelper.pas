unit CalcHelper;

interface

uses
  Windows, SysUtils, CalcParam, IRetIntf, Calc, Generics.Collections,
  Generics.Defaults, Adapter;

procedure Cut_A(ACutParam: TCutParam; outRetlst: TList<IRet>);
procedure Cut_AB(ACutParam: TCutParam; outRetlst: TList<IRet>);
procedure GetCutProgress(out outNowProgress, outMaxProgress: Integer);
procedure RotateRect270(var ACalc4Reg: TCalc4Reg);
implementation

uses
  Math;

var
  NowProgress,MaxProgress: Integer;

procedure GetCutProgress(out outNowProgress, outMaxProgress: Integer);
begin
  outNowProgress := NowProgress;
  outMaxProgress := MaxProgress;
end;

procedure Cut_A(ACutParam: TCutParam; outRetlst: TList<IRet>);
var
  A_PnlArr, A_SheetArr,A_PnlArr2, A_PnlTmpArr,A_PnlTmpArr2: TCalc4RegArr;
  I, J,K,nRegCount: Integer;
  LRet: IRet;
  bAdd: Boolean;
  PnlBorderWAdd,PnlBorderHAdd: Double;
  LPnlBorderSize: TBorderSize;
  LPaintData: TPaintdata;
  tmpB: Boolean;
  LZoom: Double;
  LRotare270: Boolean;
  LtmpCalc4Reg: TCalc4Reg;

  tmp1,tmp2: Double;
  M: Integer;
begin
  if not ACutParam.DoublePnl then
  begin
    PnlCutToSet(ACutParam.PnlAMaxW, ACutParam.PnlAMaxH, ACutParam.PnlAMinW,
      ACutParam.PnlAMinH, ACutParam.PnlASetW, ACutParam.PnlASetH,
      ACutParam.PnlASetHorzSpace, ACutParam.PnlASetVertSpace,
      ACutParam.PnlABorderLeftRightWidth, ACutParam.PnlABorderTopBottomWidth,
       A_PnlArr);
    PnlCutToSet(ACutParam.PnlAMaxW, ACutParam.PnlAMaxH, ACutParam.PnlAMinW,
      ACutParam.PnlAMinH, ACutParam.PnlASetH, ACutParam.PnlASetW,
      ACutParam.PnlASetHorzSpace, ACutParam.PnlASetVertSpace,
      ACutParam.PnlABorderLeftRightWidth, ACutParam.PnlABorderTopBottomWidth,
      A_PnlArr2);
    for I := 0 to Length(A_PnlArr2) - 1 do
    begin
      for J := 0 to Length(A_PnlArr2[I].RegArr) - 1 do
      begin
        A_PnlArr2[I].RegArr[J].Block.W := ACutParam.PnlASetW;
        A_PnlArr2[I].RegArr[J].Block.H := ACutParam.PnlASetH;
        A_PnlArr2[I].RegArr[J].Block.R := not A_PnlArr2[I].RegArr[J].Block.R;
      end;
      SetLength(A_PnlArr,Length(A_PnlArr)+1);
      A_PnlArr[High(A_PnlArr)] := A_PnlArr2[I];
    end;
    //留下SET数一样，PNL尺寸最小的PNL
    SetLength(A_PnlArr2,Length(A_PnlArr));
    for I := 0 to High(A_PnlArr) do A_PnlArr2[I] := A_PnlArr[I];
    SetLength(A_PnlArr,0);
    for I := 0 to High(A_PnlArr2) do
    begin
      bAdd := True;
      //删除第一区域为0的结果
      if A_PnlArr2[I].RegArr[0].BlockCount = 0 then
      begin
        bAdd := False;
        Continue;
      end;
      //Set数量相等时候长边为W
      for J := 0 to High(A_PnlArr) - 1 do
      begin
        if A_PnlArr2[I].AChildCount = A_PnlArr[J].AChildCount then
        begin
          if (A_PnlArr2[I].W >= A_PnlArr[J].W) and (A_PnlArr2[I].H >= A_PnlArr[J].H) then
          begin
            bAdd := False;
            Break;
          end;
        end;
      end;
      //如果不是SET异象则删除Set异象的板
      if not ACutParam.PnlARotateSet then
      begin
        tmpB := True;
        for K := 0 to 4 - 1 do
        begin
          if A_PnlArr2[I].RegArr[K].BlockCount > 0 then
            tmpB := tmpB and A_PnlArr2[I].RegArr[K].Block.R ;
        end;
        bAdd := tmpB;
      end;
      if bAdd then
      begin
        SetLength(A_PnlArr,Length(A_PnlArr)+1);
        A_PnlArr[High(A_PnlArr)] := A_PnlArr2[I];
      end;
    end;

    //大料开Pnl
    for I := 0 to High(A_PnlArr) do
    begin
      //设置进度条
      MaxProgress := Length(A_PnlArr);
      NowProgress := I;
      //Pnl 长宽比 过滤
      {$REGION '此段取消注释即可用'}
//      if A_PnlArr[I].W > A_PnlArr[I].H then
//      begin
//        if A_PnlArr[I].W / A_PnlArr[I].H > ACutParam.WDivH then Continue;
//      end;
//      if A_PnlArr[I].W < A_PnlArr[I].H then
//      begin
//        if A_PnlArr[I].H / A_PnlArr[I].W > ACutParam.WDivH then Continue;
//      end;
      {$ENDREGION}

      SetLength(A_SheetArr, 0);
      SheetToPnl_A(ACutParam.SheetW, ACutParam.SheetH, A_PnlArr[I].W,
        A_PnlArr[I].H, ACutParam.PnlASelfRotate, A_SheetArr);
      for J := 0 to High(A_SheetArr) do
      begin
        bAdd := True;
        nRegCount := 0;

        //如果不是PNL异象，则去除PNL异象的结果
        if not ACutParam.PnlASelfRotate then
        begin
          for K := 0 to Length(A_SheetArr[J].RegArr) - 1 do
          begin
            if A_SheetArr[J].RegArr[K].BlockCount <> 0 then
              Inc(nRegCount);
          end;
          if nRegCount > 1 then bAdd := False;
        end;

        //相同sheet, pnl数相同，set数相同，则不添加
        {$REGION '取消注释即可用'}
//        for K := 0 to outRetlst.Count - 1 do
//        begin
//          if (outRetlst[k].SheetA.GetCellCount = A_SheetArr[J].AChildCount) and
//             (outRetlst[k].PnlA.GetCellCount = A_PnlArr[I].AChildCount) and
//             (outRetlst[k].SheetA.W = ACutParam.SheetW) and
//             (outRetlst[k].SheetA.H = ACutParam.SheetH)
//          then
//          begin
//            //如果K的高大于长则删除K重新添加
//            if outRetlst[k].PnlA.H > outRetlst[k].PnlA.W then
//            begin
//              outRetlst.Delete(K);
//              Break;
//            end else
//              bAdd := False;
//          end;
//        end;
        {$ENDREGION}
        //利用率 过滤
        if bAdd then
        begin
          if (A_SheetArr[J].AChildCount* A_PnlArr[I].AChildCount * ACutParam.PnlASetW* ACutParam.PnlASetH)
             / (ACutParam.SheetW * ACutParam.SheetH) *100 < ACutParam.MinUseage then
          begin
            bAdd := False;
          end;
        end;

        //删除reg1 为0的
        if bAdd then
        begin
          if A_SheetArr[J].RegArr[0].BlockCount = 0 then
            bAdd := False;
        end;


        //保存板边
        if bAdd then
        begin
          LPnlBorderSize.Pnl_ZeroBorderW := A_PnlArr[I].W - ACutParam.PnlABorderLeftRightWidth*2;
          LPnlBorderSize.Pnl_ZeroBorderH := A_PnlArr[I].H - ACutParam.PnlABorderTopBottomWidth*2;
          LPnlBorderSize.MinLeftRightW := ACutParam.PnlABorderLeftRightWidth;
          LPnlBorderSize.MinTopBottomW := ACutParam.PnlABorderTopBottomWidth;
        end;

        //调整PNL板边正好可以开完一个大料
        PnlBorderWAdd := 0;
        PnlBorderHAdd := 0;

        if bAdd then
        begin
          LRet := TRet.Create;
          LRet.CutParam := ACutParam;
          LPnlBorderSize.MaxLeftRightW := LPnlBorderSize.MinLeftRightW + PnlBorderWAdd;
          LPnlBorderSize.MaxTOpBottomW := LPnlBorderSize.MinTopBottomW + PnlBorderHAdd;
          LPnlBorderSize.OldLeftRightW := LPnlBorderSize.MinLeftRightW + PnlBorderWAdd;
          LPnlBorderSize.OldTopBottomW := LPnlBorderSize.MinTopBottomW + PnlBorderHAdd;
          LPnlBorderSize.NowLeftRightW := LPnlBorderSize.MinLeftRightW + PnlBorderWAdd;
          LPnlBorderSize.NowTopBottomW := LPnlBorderSize.MinTopBottomW + PnlBorderHAdd;
          // Sheet
          LRet.SheetA := Calc4RegToIBlock4Reg(A_SheetArr[J], 0, 0, 0, 0);
          LRet.SheetA.W := ACutParam.SheetW;
          LRet.SheetA.H := ACutParam.SheetH;
          LRet.SheetA.Calc4Reg := A_SheetArr[J];
          LZoom := g_PaintMapSize / MaxValue([ACutParam.SheetW,ACutParam.SheetH]);
          LPaintData := Calc4RegToPaintData(A_SheetArr[J], 0, 0, 0, 0, LZoom, False);
          //LPaintData.Reg.W := ACutParam.SheetW;
          //LPaintData.Reg.H := ACutParam.SheetH;
          LRet.SheetA.PaintData := LPaintData;
          // Set

          //---这段是测试旋转270度

//          if A_PnlArr[I].W < A_PnlArr[I].H then
//          begin
//            LRotare270 := True;
//            LtmpCalc4Reg := A_PnlArr[I];
//            RotateRect270(LtmpCalc4Reg);
//            LRet.PnlA := Calc4RegToIBlock4Reg(LtmpCalc4Reg,
//              ACutParam.PnlASetVertSpace, ACutParam.PnlASetHorzSpace,
//              LRet.CutParam.PnlABorderTopBottomWidth,
//              LRet.CutParam.PnlABorderLeftRightWidth);
//            LRet.PnlA.W := LtmpCalc4Reg.W;
//            LRet.PnlA.H := LtmpCalc4Reg.H;
//            LRet.PnlA.Calc4Reg := LtmpCalc4Reg;
//            LZoom := g_PaintMapSize / MaxValue([LRet.PnlA.W,LRet.PnlA.H]);
//            LRet.PnlA.PaintData := Calc4RegToPaintData(LtmpCalc4Reg,
//              ACutParam.PnlASetVertSpace, ACutParam.PnlASetHorzSpace,
//              LRet.CutParam.PnlABorderTopBottomWidth,
//              LRet.CutParam.PnlABorderLeftRightWidth,LZoom);
//
//            CopyMemory(LRet.PnlA.PBorderSize,@LPnlBorderSize,SizeOf(LPnlBorderSize));
//
//            LRet.PnlA.OriginalPaintData := Calc4RegToPaintData(LtmpCalc4Reg,
//              ACutParam.PnlASetVertSpace, ACutParam.PnlASetHorzSpace,
//              LRet.CutParam.PnlABorderTopBottomWidth,
//              LRet.CutParam.PnlABorderLeftRightWidth,LZoom);
//            LRet.PnlA.Rotate := True;
//          end else
          begin
            LRotare270 := False;
            //--


            {$REGION 'pnl的宽大于长，则旋转'}
            if A_PnlArr[I].H > A_PnlArr[I].W then
            begin
              tmp1 := a_pnlarr[I].RegArr[0].Block.w;
              tmp2:= a_pnlArr[I].RegArr[0].Block.h;
              SetLength(A_PnlTmpArr,0);
              SetLength(A_PnlTmpArr2,0);
              PnlCutToSet(A_PnlArr[I].H, A_PnlArr[I].W, 0,
                0, tmp2, tmp1,
                ACutParam.PnlASetHorzSpace, ACutParam.PnlASetVertSpace,
                ACutParam.PnlABorderLeftRightWidth, ACutParam.PnlABorderTopBottomWidth,
                 A_PnlTmpArr);


              PnlCutToSet(A_PnlArr[I].H, A_PnlArr[I].W, 0,
                0, tmp1, tmp2,
                ACutParam.PnlASetHorzSpace, ACutParam.PnlASetVertSpace,
                ACutParam.PnlABorderLeftRightWidth, ACutParam.PnlABorderTopBottomWidth,
                 A_PnlTmpArr2);

              for M := 0 to Length(A_PnlTmpArr2)-1 do
              begin
                SetLength(A_PnlTmpArr,Length(A_PnlTmpArr)+1);
                A_PnlTmpArr[High(A_PnlTmpArr)] := A_PnlTmpArr2[M];
              end;

              for M := 0 to Length(A_PnlTmpArr)-1 do
              begin
                if A_PnlTmpArr[M].AChildCount = A_PnlArr[I].AChildCount then
                begin
                  if (A_PnlTmpArr[M].W = a_pnlArr[I].H) and (a_PnltmpArr[M].H = a_pnlArr[I].W) then
                  begin
                    A_PnlArr[I] := A_PnlTmpArr[M];
                    Break;
                  end;
                end;
              end;

            end;


//            if outRetlst.Count > 0 then
//            begin
//              Sleep(1);
//
//            end;



            {$ENDREGION}



            LRet.PnlA := Calc4RegToIBlock4Reg(A_PnlArr[I],
              ACutParam.PnlASetHorzSpace, ACutParam.PnlASetVertSpace,
              LRet.CutParam.PnlABorderLeftRightWidth,
              LRet.CutParam.PnlABorderTopBottomWidth);
            LRet.PnlA.W := A_PnlArr[I].W;
            LRet.PnlA.H := A_PnlArr[I].H;
            LRet.PnlA.Calc4Reg := A_PnlArr[I];
            LZoom := g_PaintMapSize / MaxValue([LRet.PnlA.W,LRet.PnlA.H]);
            LRet.PnlA.PaintData := Calc4RegToPaintData(A_PnlArr[I],
              ACutParam.PnlASetHorzSpace, ACutParam.PnlASetVertSpace,
              LRet.CutParam.PnlABorderLeftRightWidth,
              LRet.CutParam.PnlABorderTopBottomWidth,LZoom);

            CopyMemory(LRet.PnlA.PBorderSize,@LPnlBorderSize,SizeOf(LPnlBorderSize));

            LRet.PnlA.OriginalPaintData := Calc4RegToPaintData(A_PnlArr[I],
              ACutParam.PnlASetHorzSpace, ACutParam.PnlASetVertSpace,
              LRet.CutParam.PnlABorderLeftRightWidth,
              LRet.CutParam.PnlABorderTopBottomWidth,LZoom);
            //LRet.PnlA.Rotate := False;
          end;
          //useage
          LRet.SetSheetUseage(
          ((LRet.SheetA.GetCellCount* LRet.PnlA.GetCellCount + 0* LRet.PnlB.GetCellCount)  *  ACutParam.PnlASetW* ACutParam.PnlASetH)
          / (ACutParam.SheetW * ACutParam.SheetH)
          * 100);
          outRetlst.Add(LRet);
        end;
      end;
    end;
  end;
end;

type
  TABSheet = record
    SheetA,SheetB: TCalc4Reg;
    BOffsetX,BOffsetY: Double;
    BAdd: Boolean;
  end;
  TABSheetArr = array of TABSheet;

function GetABSheetSetCount(ABSheet: TABSheet): Integer;overload;
begin
  Result := 0;
  if ABSheet.SheetA.PChildCalc4Reg <> nil then
    Result := Result +  ABSheet.SheetA.AChildCount* ABSheet.SheetA.PChildCalc4Reg.AChildCount;
  if ABSheet.SheetB.PChildCalc4Reg <> nil then
    Result := Result + ABSheet.SheetB.AChildCount* ABSheet.SheetB.PChildCalc4Reg.AChildCount;
end;

function GetABSheetSetCount(SheetA,SHeetB: TCalc4Reg): Integer;overload;
begin
  Result := 0;
  if SheetA.PChildCalc4Reg <> nil then
    Result := Result +  SheetA.AChildCount* SheetA.PChildCalc4Reg.AChildCount;
  if SheetB.PChildCalc4Reg <> nil then
    Result := Result + SheetB.AChildCount* SheetB.PChildCalc4Reg.AChildCount;
end;

procedure SheetCutPnlAB(APnlArr: TCalc4RegArr;Aindex: Integer; out ASheetArr: TCalc4RegArr;out BSheetArr: TCalc4RegArr; ACutParam: TCutParam);
var
  I,J,K,L,M: Integer;
  AOutArr,BOutArr: TCalc4RegArr;
  N,tmpIndex,tmpCount: Integer;
  tmpSheetW,tmpSheetH: Double;
  tmpBOutArr,tmpBOutArr2,tmpBOutArr3: TCalc4RegArr;
  lRetABArr: TABSheetArr;
  tmpB: Boolean;
  nRegCount: Integer;
begin

  PnlCutToSet(ACutParam.SheetW,ACutParam.SheetH,0,0, APnlArr[Aindex].W, APnlArr[Aindex].H,0,0,0,0,AOutArr);
  PnlCutToSet(ACutParam.SheetW,ACutParam.SheetH,0,0, APnlArr[Aindex].H, APnlArr[Aindex].W,0,0,0,0,BOutArr);
  for I := 0 to Length(BOutArr) - 1 do
  begin
    for J := 0 to Length(BOutArr[I].RegArr) - 1 do
    begin
      BOutArr[I].RegArr[J].Block.W := APnlArr[Aindex].W;
      BOutArr[I].RegArr[J].Block.H := APnlArr[Aindex].H;
      BOutArr[I].RegArr[J].Block.R := not BOutArr[I].RegArr[J].Block.R;
    end;
    SetLength(AOutArr,Length(AOutArr) + 1);
    AOutArr[High(AOutArr)] := BOutArr[I];
  end;
  for I := 0 to Length(AOutArr) - 1 do
  begin
    AOutArr[I].PChildCalc4Reg := @APnlArr[Aindex];
    AOutArr[I].Tag := Aindex;
  end;


  SetLength(BOutArr,0);
  for I := 0 to Length(AOutArr) - 1 do
  begin
    tmpB := True;
    nRegCount := 0;
    //删除第一区域为0的结果
    if AOutArr[I].RegArr[0].BlockCount = 0 then
      tmpB := False;
    //删除A中为0的。
    if AOutArr[I].AChildCount = 0 then
      tmpB := False;
    //如果不是PNL异象删除PNL异象的
    if not ACutParam.PnlASelfRotate then
    begin
      for K := 0 to Length(AoutArr[I].RegArr) - 1 do
      begin
        if AOutArr[I].RegArr[K].BlockCount <> 0 then
          Inc(nRegCount);
        if nRegCount > 1 then tmpB := False;
      end;
    end;
    if tmpB then
    begin
      SetLength(BOutArr,length(BOutArr)+1);
      BOutArr[High(BOutArr)] := AOutArr[I];
    end;
  end;

  SetLength(AOutArr,Length(BOutArr));
  for I := 0 to Length(BOutArr) - 1 do
    AOutArr[I] := BOutArr[I];

  //A,B上下分
  SetLength(BOutArr,0);
  SetLength(BOutArr,Length(AOutArr));
  for I := 0 to Length(BOutArr) - 1 do
  begin
    ZeroMemory(@BOutArr[I],SizeOf(BOutArr[I]));
  end;

  for I := 0 to Length(AOutArr) - 1 do
  begin
    tmpSheetW := ACutParam.SheetW;
    tmpSheetH := ACutParam.SheetH - AOutArr[I].H;
    SetLength(tmpBOutArr3,0);
    for J := Aindex + 1 to Length(APnlArr) - 1 do
    begin
      //B的面积和A一样则跳过
      if (MinValue([APnlArr[J].W,APnlArr[J].H]) - MinValue([AOutArr[I].W,AOutArr[I].H]) <= 0.000000001) and
        (MaxValue([APnlArr[J].W,APnlArr[J].H]) - MaxValue([AOutArr[I].W,AOutArr[I].H]) <= 0.000000001)
      then
        Continue;

      SetLength(tmpBOutArr2,0);
      SetLength(tmpBOutArr,0);
      PnlCutToSet(tmpSheetW,tmpSheetH,0,0,APnlArr[J].W,APnlArr[J].H,0,0,0,0,tmpBOutArr2);
      PnlCutToSet(tmpSheetW,tmpSheetH,0,0,APnlArr[J].H,APnlArr[J].W,0,0,0,0,tmpBOutArr);
      for K := 0 to Length(tmpBOutArr) - 1 do
      begin
        if tmpBOutArr[K].AChildCount = 0 then Continue;
        for L := 0 to Length(tmpBOutArr[K].RegArr) - 1 do
        begin
          tmpBOutArr[K].RegArr[L].Block.W := APnlArr[J].W;
          tmpBOutArr[K].RegArr[L].Block.H := APnlArr[J].H;
          tmpBOutArr[K].RegArr[L].Block.R := not tmpBOutArr[K].RegArr[L].Block.R;
        end;
        SetLength(tmpBOutArr2,Length(tmpBOutArr2) + 1);
        tmpBOutArr2[High(tmpBOutArr2)] := tmpBOutArr[K];
      end;
      for M := 0 to Length(tmpBOutArr2) - 1 do
      begin
        if tmpBOutArr2[M].AChildCount = 0 then Continue;
        tmpBOutArr2[M].PChildCalc4Reg := @APnlArr[J];
        tmpBOutArr2[M].Hor_Ver := 0;
      end;
      for L := 0 to Length(tmpBOutArr2) - 1 do
      begin
        //如果B板数量为0则跳过
        if tmpBOutArr2[L].AChildCount = 0 then Continue;
        //如果第一Reg的数位0则跳过
        if tmpBOutArr2[L].RegArr[0].BlockCount = 0 then Continue;

        //如果不是PNL异象删除PNL异象的
        nRegCount := 0;
        tmpB := True;
        if not ACutParam.PnlASelfRotate then
        begin
          for K := 0 to Length(tmpBOutArr2[L].RegArr) - 1 do
          begin
            if tmpBOutArr2[L].RegArr[K].BlockCount <> 0 then
              Inc(nRegCount);
            if nRegCount > 1 then tmpB := False;
          end;
        end;
        if not tmpB then Continue;


        tmpBOutArr2[L].Tag := J;
        if Length(tmpBOutArr3) < 1 then
        begin
          SetLength(tmpBOutArr3,Length(tmpBOutArr3) + 1);
          tmpBOutArr3[High(tmpBOutArr3)] := tmpBOutArr2[L];
        end else
        begin
          M := 0;
          tmpCount := MaxInt;
          for K := 0 to length(tmpBOutArr3) - 1 do//遍历出数量最少的pnl替换掉
          begin
            if tmpBOutArr3[K].AChildCount* tmpBOutArr3[K].PChildCalc4Reg^.AChildCount < tmpCount then
            begin
              tmpCount := tmpBOutArr3[K].AChildCount* tmpBOutArr3[K].PChildCalc4Reg^.AChildCount;
              M := K;
            end;
          end;
          if tmpCount < tmpBOutArr2[L].AChildCount* tmpBOutArr2[L].PChildCalc4Reg^.AChildCount then
            tmpBOutArr3[M] := tmpBOutArr2[L];
        end;
      end;
    end;
    if Length(tmpBOutArr3) <> 0 then BOutArr[I] := tmpBOutArr3[0] else BOutArr[I].BIsNull := True;
  end;

  //选出最优的结果
  for I := 0 to Length(AOutArr) - 1 do
  begin
    if Length(lRetABArr) < 3 then
    begin
      SetLength(lRetABArr,Length(lRetABArr)+1);
      ZeroMemory(@lRetABArr[High(lRetABArr)],SizeOf(lRetABArr[High(lRetABArr)]));
      lRetABArr[High(lRetABArr)].SheetA := AOutArr[I];
      lRetABArr[High(lRetABArr)].SheetB := BOutArr[I];
    end else
    begin
      M := 0;
      tmpCount := MaxInt;
      for J := 0 to Length(lRetABArr) - 1 do
      begin
        if GetABSheetSetCount(lretabarr[J]) < tmpCount then
        begin
          tmpCount := GetABSheetSetCount(lretabarr[J]);
          M := J;
        end;

      end;
      if GetABSheetSetCount(AOutArr[I],BOutArr[I]) > tmpCount then
      begin
        lRetABArr[M].SheetA := AOutArr[I];
        lRetABArr[M].SheetB := BOutArr[I];
      end;

    end;
  end;

  //左右分

  SetLength(BOutArr,0);
  SetLength(BOutArr,Length(AOutArr));
  for I := 0 to Length(BOutArr) - 1 do
  begin
    ZeroMemory(@BOutArr[I],SizeOf(BOutArr[I]));
  end;

  for I := 0 to Length(AOutArr) - 1 do
  begin
    tmpSheetW := ACutParam.SheetW - aoutarr[I].W ;
    tmpSheetH := ACutParam.SheetH ;
    SetLength(tmpBOutArr3,0);
    for J := Aindex + 1 to Length(APnlArr) - 1 do
    begin
      //B的面积和A一样则跳过
      if (MinValue([APnlArr[J].W,APnlArr[J].H]) - MinValue([AOutArr[I].W,AOutArr[I].H]) <= 0.000000001) and
        (MaxValue([APnlArr[J].W,APnlArr[J].H]) - MaxValue([AOutArr[I].W,AOutArr[I].H]) <= 0.000000001)
      then
        Continue;

      SetLength(tmpBOutArr2,0);
      SetLength(tmpBOutArr,0);
      PnlCutToSet(tmpSheetW,tmpSheetH,0,0,APnlArr[J].W,APnlArr[J].H,0,0,0,0,tmpBOutArr2);
      PnlCutToSet(tmpSheetW,tmpSheetH,0,0,APnlArr[J].H,APnlArr[J].W,0,0,0,0,tmpBOutArr);
      for K := 0 to Length(tmpBOutArr) - 1 do
      begin
        if tmpBOutArr[K].AChildCount = 0 then Continue;
        for L := 0 to Length(tmpBOutArr[K].RegArr) - 1 do
        begin
          tmpBOutArr[K].RegArr[L].Block.W := APnlArr[J].W;
          tmpBOutArr[K].RegArr[L].Block.H := APnlArr[J].H;
          tmpBOutArr[K].RegArr[L].Block.R := not tmpBOutArr[K].RegArr[L].Block.R;
        end;
        SetLength(tmpBOutArr2,Length(tmpBOutArr2) + 1);
        tmpBOutArr2[High(tmpBOutArr2)] := tmpBOutArr[K];
      end;
      for M := 0 to Length(tmpBOutArr2) - 1 do
      begin
        if tmpBOutArr2[M].AChildCount = 0 then Continue;
        tmpBOutArr2[M].PChildCalc4Reg := @APnlArr[J];
        tmpBOutArr2[M].Hor_Ver := 1;
      end;
      for L := 0 to Length(tmpBOutArr2) - 1 do
      begin
        if tmpBOutArr2[L].AChildCount = 0 then Continue;

        //tmpBOutArr2[L].Tag := I;
        if Length(tmpBOutArr3) < 1 then
        begin
          SetLength(tmpBOutArr3,Length(tmpBOutArr3) + 1);
          tmpBOutArr3[High(tmpBOutArr3)] := tmpBOutArr2[L];
        end else
        begin
          M := 0;
          tmpCount := MaxInt;
          for K := 0 to length(tmpBOutArr3) - 1 do//遍历出数量最少的pnl替换掉
          begin
            if tmpBOutArr3[K].AChildCount* tmpBOutArr3[K].PChildCalc4Reg^.AChildCount < tmpCount then
            begin
              tmpCount := tmpBOutArr3[K].AChildCount* tmpBOutArr3[K].PChildCalc4Reg^.AChildCount;
              M := K;
            end;
          end;
          if tmpCount < tmpBOutArr2[L].AChildCount* tmpBOutArr2[L].PChildCalc4Reg^.AChildCount then
            tmpBOutArr3[M] := tmpBOutArr2[L];
        end;
      end;
    end;
    if Length(tmpBOutArr3) <> 0 then BOutArr[I] := tmpBOutArr3[0] else BOutArr[I].BIsNull := True;
  end;

  //选出最优的结果
  for I := 0 to Length(AOutArr) - 1 do
  begin
    if Length(lRetABArr) < 3 then
    begin
      SetLength(lRetABArr,Length(lRetABArr)+1);
      ZeroMemory(@lRetABArr[High(lRetABArr)],SizeOf(lRetABArr[High(lRetABArr)]));
      lRetABArr[High(lRetABArr)].SheetA := AOutArr[I];
      lRetABArr[High(lRetABArr)].SheetB := BOutArr[I];
    end else
    begin
      M := 0;
      tmpCount := MaxInt;
      for J := 0 to Length(lRetABArr) - 1 do
      begin
        if GetABSheetSetCount(lretabarr[J]) < tmpCount then
        begin
          tmpCount := GetABSheetSetCount(lretabarr[J]);
          M := J;
        end;

      end;
      if GetABSheetSetCount(AOutArr[I],BOutArr[I]) > tmpCount then
      begin
        lRetABArr[M].SheetA := AOutArr[I];
        lRetABArr[M].SheetB := BOutArr[I];
      end;

    end;
  end;


  //合并结果
  SetLength(ASheetArr,Length(lRetABArr));
  SetLength(BSheetArr,Length(lRetABArr));
  for I := 0 to Length(lRetABArr) - 1 do
  begin
    tmpB := True;
    if lRetABArr[I].SheetB.AChildCount <> 0 then
    begin
      if (lRetABArr[I].SheetB.PChildCalc4Reg <> nil) and (lRetABArr[I].SheetA.PChildCalc4Reg <> nil) then
      begin
        if (lRetABArr[I].SheetB.PChildCalc4Reg^.W* lRetABArr[I].SheetB.PChildCalc4Reg^.H) >
          (lRetABArr[I].SheetA.PChildCalc4Reg^.W* lRetABArr[I].SheetA.PChildCalc4Reg^.H)
        then
          tmpB := False;
      end;
    end;
    //面积大的为A板
    if tmpB then
    begin
      ASheetArr[I] := lretabarr[I].SheetA;
      BSheetArr[I] := lretabarr[I].SheetB;
    end else
    begin
      lretabarr[I].SheetA.Hor_Ver := lretabarr[I].SheetB.Hor_Ver;
      ASheetArr[I] := lretabarr[I].SheetB;
      BSheetArr[I] := lretabarr[I].SheetA;

    end;
  end;

end;



procedure Cut_AB(ACutParam: TCutParam; outRetlst: TList<IRet>);
var
  A_PnlArr, A_SheetArr,A_PnlArr2: TCalc4RegArr;
  I, J,K,L,nRegCount: Integer;
  LRet: IRet;
  bAdd: Boolean;
  PnlBorderWAdd,PnlBorderHAdd: Double;
  LPnlBorderSize: TBorderSize;
  LPaintData: TPaintdata;
  tmpB: Boolean;
  tmpSheetA,tmpSheetB: TCalc4RegArr;
  LSheetAArr,LSheetbArr: TCalc4RegArr;
  LABSheetArr: TABSheetArr;
  tmpCount: Integer;
  tmpPnl: TCalc4Reg;
  LCol,LRow,LReg: Integer;
  LZoom: Double;
begin
  PnlCutToSet(ACutParam.PnlAMaxW, ACutParam.PnlAMaxH, ACutParam.PnlAMinW,
    ACutParam.PnlAMinH, ACutParam.PnlASetW, ACutParam.PnlASetH,
    ACutParam.PnlASetHorzSpace, ACutParam.PnlASetVertSpace,
    ACutParam.PnlABorderLeftRightWidth, ACutParam.PnlABorderTopBottomWidth,
    A_PnlArr);
  PnlCutToSet(ACutParam.PnlAMaxW, ACutParam.PnlAMaxH, ACutParam.PnlAMinW,
    ACutParam.PnlAMinH, ACutParam.PnlASetH, ACutParam.PnlASetW,
    ACutParam.PnlASetHorzSpace, ACutParam.PnlASetVertSpace,
    ACutParam.PnlABorderLeftRightWidth, ACutParam.PnlABorderTopBottomWidth,
    A_PnlArr2);
  for I := 0 to Length(A_PnlArr2) - 1 do
  begin
    for J := 0 to Length(A_PnlArr2[I].RegArr) - 1 do
    begin
      A_PnlArr2[I].RegArr[J].Block.W := ACutParam.PnlASetW;
      A_PnlArr2[I].RegArr[J].Block.H := ACutParam.PnlASetH;
      A_PnlArr2[I].RegArr[J].Block.R := not A_PnlArr2[I].RegArr[J].Block.R;
    end;
    SetLength(A_PnlArr,Length(A_PnlArr)+1);
    A_PnlArr[High(A_PnlArr)] := A_PnlArr2[I];
  end;
  //留下SET数一样，PNL尺寸最小的PNL
  SetLength(A_PnlArr2,Length(A_PnlArr));
  for I := 0 to High(A_PnlArr) do A_PnlArr2[I] := A_PnlArr[I];
  SetLength(A_PnlArr,0);
  for I := 0 to High(A_PnlArr2) do
  begin
    bAdd := True;
    for J := 0 to High(A_PnlArr) - 1 do
    begin
      if A_PnlArr2[I].AChildCount = A_PnlArr[J].AChildCount then
      begin
        if (A_PnlArr2[I].W >= A_PnlArr[J].W) and (A_PnlArr2[I].H >= A_PnlArr[J].H) then
        begin
          bAdd := False;
          Break;
        end;
      end;
    end;
    //如果不是SET异象则删除Set异象的板
    if not ACutParam.PnlARotateSet then
    begin
      tmpB := True;
      for K := 0 to 4 - 1 do
      begin
        if A_PnlArr2[I].RegArr[K].BlockCount > 0 then
          tmpB := tmpB and A_PnlArr2[I].RegArr[K].Block.R ;
      end;
      bAdd := tmpB;
    end;
    //删除A板中reg0 = 0的
    if A_PnlArr2[I].RegArr[0].BlockCount = 0 then
    begin
      bAdd := False;
      Continue;
    end;
    if bAdd then
    begin
      SetLength(A_PnlArr,Length(A_PnlArr)+1);
      A_PnlArr[High(A_PnlArr)] := A_PnlArr2[I];
    end;
  end;



  //大料开Pnl
  for I := 0 to High(A_PnlArr) do
  begin
    //设置进度条
    MaxProgress := Length(A_PnlArr);
    NowProgress := I;
    //Pnl 长宽比 过滤
    if A_PnlArr[I].W > A_PnlArr[I].H then
    begin
      if A_PnlArr[I].W / A_PnlArr[I].H > ACutParam.WDivH then Continue;
    end;
    if A_PnlArr[I].W < A_PnlArr[I].H then
    begin
      if A_PnlArr[I].H / A_PnlArr[I].W > ACutParam.WDivH then Continue;
    end;

    SetLength(tmpSheetA,0);
    SetLength(tmpSheetB,0);
    SheetCutPnlAB(A_PnlArr,I,tmpSheetA,tmpSheetB,ACutParam);

    for J := 0 to Length(tmpSheetA) - 1 do
    begin
      SetLength(LSheetAArr,Length(LSheetAArr)+1);
      LSheetAArr[High(LSheetAArr)] := tmpSheetA[J];
//      for K := 0 to Length(tmpSheetB) - 1 do
//      begin
//        if tmpSheetB[K].Tag = J then tmpSheetB[K].Tag := High(LSheetAArr);
//      end;
    end;
    for J := 0 to Length(tmpSheetB) - 1 do
    begin
      SetLength(LSheetbArr,Length(LSheetbArr)+1);
      LSheetbArr[High(LSheetbArr)] := tmpSheetB[J];
    end;
  end;

  //添加到ABSHeet中
  ZeroMemory(@tmpPnl,SizeOf(tmpPnl));
  //SetLength(LABSheetArr,0);
  for I := 0 to Length(LSheetAArr) - 1 do
  begin
    if LSheetAArr[I].AChildCount = 0 then Continue;
    SetLength(LABSheetArr,Length(LABSheetArr)+1);
    LABSheetArr[High(LABSheetArr)].SheetA := LSheetAArr[I];
    LABSheetArr[High(LABSheetArr)].SheetB := LSheetbArr[I];
    if LSheetbArr[I].Hor_Ver = 0 then
    begin
      //上下
      LABSheetArr[High(LABSheetArr)].BOffsetX := 0;
      LABSheetArr[High(LABSheetArr)].BOffsetY := lsheetaarr[I].H;
    end else
    begin
      //水平
      LABSheetArr[High(LABSheetArr)].BOffsetX := LSheetAArr[I].W;
      LABSheetArr[High(LABSheetArr)].BOffsetY := 0;
    end;
  end;

  //利用率过滤
  for I := 0 to Length(LABSheetArr) - 1 do
  begin
    if (GetABSheetSetCount(LABSheetArr[I])*(ACutParam.PnlASetW * ACutParam.PnlASetH)
      / (ACutParam.SheetW * ACutParam.SheetH) * 100) < ACutParam.MinUseage
    then
      LABSheetArr[I].BAdd := False
    else
      LABSheetArr[I].BAdd := True;

    //A板数量为0则不添加
    if LABSheetArr[I].SheetA.AChildCount = 0 then
      LABSheetArr[I].BAdd := False;
  end;

  //去除重复
  for I := 0 to Length(LABSheetArr) - 1 do
  begin
    tmpB := True;
    if not LABSheetArr[I].BAdd then Continue;

    for J := I + 1 to Length(LABSheetArr) - 1 do
    begin
      //总set数相等
      if GetABSheetSetCount(labsheetarr[I]) = GetABSheetSetCount(labsheetarr[J]) then
      begin
        //A板面积相等
        if (LABSheetArr[I].SheetA.PChildCalc4Reg^.W* LABSheetArr[I].SheetA.PChildCalc4Reg^.H) =
           (LABSheetArr[J].SheetA.PChildCalc4Reg^.W* LABSheetArr[J].SheetA.PChildCalc4Reg^.H)
        then
        begin
          //B板面积相等
          if (LABSheetArr[I].SheetB.AChildCount <> 0) and (LABSheetArr[J].SheetB.AChildCount <> 0) then
          begin
            if (LABSheetArr[I].SheetB.PChildCalc4Reg <> nil) and (LABSheetArr[J].SheetB.PChildCalc4Reg <> nil) then
            begin
              if (LABSheetArr[I].SheetB.PChildCalc4Reg^.W* LABSheetArr[I].SheetB.PChildCalc4Reg^.H) =
                 (LABSheetArr[J].SheetB.PChildCalc4Reg^.W* LABSheetArr[J].SheetB.PChildCalc4Reg^.H)
              then
                tmpB := False;
            end else
            if (LABSheetArr[I].SheetB.PChildCalc4Reg = nil) and (LABSheetArr[J].SheetB.PChildCalc4Reg = nil) then
            begin
              tmpB := False;
            end;

          end else
          if (LABSheetArr[I].SheetB.AChildCount = 0) and (LABSheetArr[J].SheetB.AChildCount <> 0) then
          begin

          end else
          if (LABSheetArr[I].SheetB.AChildCount <> 0) and (LABSheetArr[J].SheetB.AChildCount = 0) then
          begin

          end else
          if (LABSheetArr[I].SheetB.AChildCount = 0) and (LABSheetArr[J].SheetB.AChildCount = 0) then
          begin
            tmpB := False;
          end;
        end;
        LABSheetArr[J].BAdd := tmpB;
        //if LABSheetArr[I].SheetA = labsheetarr[J].SheetA then
      end;
    end;
  end;

  //生成IRET
  for I := 0 to Length(LABSheetArr) - 1 do
  begin
    if not LABSheetArr[I].BAdd then Continue;

    LRet := TRet.Create;
    LRet.CutParam := ACutParam;
    // Sheet_A
    LRet.SheetA := Calc4RegToIBlock4Reg(LABSheetArr[I].SheetA, 0, 0, 0, 0);
    LRet.SheetA.Calc4Reg := LABSheetArr[I].SheetA;
    LZoom := g_PaintMapSize / MaxValue([ACutParam.SheetW, ACutParam.SheetH]);
    LPaintData := Calc4RegToPaintData(LABSheetArr[I].SheetA, 0, 0, 0, 0,LZoom ,False);
    //LPaintData.Reg.W := LRet.SheetA.W;
    //LPaintData.Reg.H := LRet.SheetA.H;
    LRet.SheetA.PaintData := LPaintData;
    //LSheet_B
    if not LABSheetArr[I].SheetB.BIsNull then
    begin
      LRet.SheetB := Calc4RegToIBlock4Reg(LABSheetArr[I].SheetB, 0, 0, 0, 0);
      for LReg := 0 to LRet.SheetB.Regs.Count - 1 do
      begin
        for LCol := 0 to  LRet.SheetB.Regs[LReg].Colums.Count-1 do
        begin
          for LRow := 0 to LRet.SheetB.Regs[LReg].Colums[LCol].Rows.Count - 1 do
          begin
            if LRet.SheetB.Calc4Reg.Hor_Ver = 0 then
              LRet.SheetB.Regs[LReg].Colums[LCol].Rows[LRow].Y :=
                LRet.SheetB.Regs[LReg].Colums[LCol].Rows[LRow].Y + labSheetArr[I].SheetA.H
            else
              LRet.SheetB.Regs[LReg].Colums[LCol].Rows[LRow].X :=
                LRet.SheetB.Regs[LReg].Colums[LCol].Rows[LRow].X + labSheetArr[I].SheetA.W;
          end;
        end;
      end;

      LRet.SheetB.Calc4Reg := LABSheetArr[I].SheetB;
      if LRet.SheetB.Calc4Reg.Hor_Ver = 0 then
        LPaintData := Calc4RegToPaintData(LABSheetArr[I].SheetB, 0, 0, 0, 0, LZoom, False,0,LRet.SheetA.PaintData.Reg.H)
      else
        LPaintData := Calc4RegToPaintData(LABSheetArr[I].SheetB, 0, 0, 0, 0, LZoom,False,LRet.SheetA.PaintData.Reg.W,0);

      //LPaintData.Reg.W := LRet.SheetB.W;
      //LPaintData.Reg.H := LRet.SheetB.H;
      LRet.SheetB.PaintData := LPaintData;
    end;
    // Set_A
    LRet.PnlA := Calc4RegToIBlock4Reg(LABSheetArr[I].SheetA.PChildCalc4Reg^,
      ACutParam.PnlASetHorzSpace, ACutParam.PnlASetVertSpace,
      LRet.CutParam.PnlABorderLeftRightWidth,
      LRet.CutParam.PnlABorderTopBottomWidth);
    LRet.PnlA.W := LABSheetArr[I].SheetA.PChildCalc4Reg^.W;
    LRet.PnlA.H := LABSheetArr[I].SheetA.PChildCalc4Reg^.H;
    LRet.PnlA.Calc4Reg := LABSheetArr[I].SheetA.PChildCalc4Reg^;
    LZoom := g_PaintMapSize / MaxValue([LRet.PnlA.W,LRet.PnlA.H]);
    LRet.PnlA.PaintData := Calc4RegToPaintData(LABSheetArr[I].SheetA.PChildCalc4Reg^,
      ACutParam.PnlASetHorzSpace, ACutParam.PnlASetVertSpace,
      LRet.CutParam.PnlABorderLeftRightWidth,
      LRet.CutParam.PnlABorderTopBottomWidth, LZoom);

    LRet.PnlA.PBorderSize^.Pnl_ZeroBorderW := LABSheetArr[I].SheetA.PChildCalc4Reg^.W - ACutParam.PnlABorderLeftRightWidth*2;
    LRet.PnlA.PBorderSize^.Pnl_ZeroBorderH := LABSheetArr[I].SheetA.PChildCalc4Reg^.H - ACutParam.PnlABorderTopBottomWidth*2;
    lret.PnlA.PBorderSize^.MinLeftRightW := ACutParam.PnlABorderLeftRightWidth;
    LRet.PnlA.PBorderSize^.MinTopBottomW := ACutParam.PnlABorderTopBottomWidth;
    LRet.PnlA.PBorderSize^.MaxLeftRightW := ACutParam.PnlABorderLeftRightWidth;
    LRet.PnlA.PBorderSize^.MaxTOpBottomW := ACutParam.PnlABorderTopBottomWidth;
    LRet.PnlA.PBorderSize^.NowLeftRightW := ACutParam.PnlABorderLeftRightWidth;
    LRet.PnlA.PBorderSize^.NowTopBottomW := ACutParam.PnlABorderTopBottomWidth;
    lret.PnlA.PBorderSize^.OldLeftRightW := ACutParam.PnlABorderLeftRightWidth;
    LRet.PnlA.PBorderSize^.OldTopBottomW := ACutParam.PnlABorderTopBottomWidth;

    LRet.PnlA.OriginalPaintData := Calc4RegToPaintData(LABSheetArr[I].SheetA.PChildCalc4Reg^,
      ACutParam.PnlASetHorzSpace, ACutParam.PnlASetVertSpace,
      LRet.CutParam.PnlABorderLeftRightWidth,
      LRet.CutParam.PnlABorderTopBottomWidth, LZoom);

    //Set_B
    if not LABSheetArr[I].SheetB.BIsNull then
    begin
      LRet.PnlB := Calc4RegToIBlock4Reg(LABSheetArr[I].SheetB.PChildCalc4Reg^,
        ACutParam.PnlBSetHorzSpace, ACutParam.PnlBSetVertSpace,
        LRet.CutParam.PnlBBorderLeftRightWidth,
        LRet.CutParam.PnlBBorderTopBottomWidth);
      LRet.PnlB.W := LABSheetArr[I].SheetB.PChildCalc4Reg^.W;
      LRet.PnlB.H := LABSheetArr[I].SheetB.PChildCalc4Reg^.H;
      LRet.PnlB.Calc4Reg := LABSheetArr[I].SheetB.PChildCalc4Reg^;
      LZoom := g_PaintMapSize / MaxValue([LRet.PnlB.W,LRet.PnlB.H]);
      LRet.PnlB.PaintData := Calc4RegToPaintData(LABSheetArr[I].SheetB.PChildCalc4Reg^,
        ACutParam.PnlBSetHorzSpace, ACutParam.PnlBSetVertSpace,
        LRet.CutParam.PnlBBorderLeftRightWidth,
        LRet.CutParam.PnlBBorderTopBottomWidth, LZoom);

      LRet.PnlB.PBorderSize^.Pnl_ZeroBorderW := LABSheetArr[I].SheetB.PChildCalc4Reg^.W - ACutParam.PnlBBorderLeftRightWidth*2;
      LRet.PnlB.PBorderSize^.Pnl_ZeroBorderH := LABSheetArr[I].SheetB.PChildCalc4Reg^.H - ACutParam.PnlBBorderTopBottomWidth*2;
      lret.PnlB.PBorderSize^.MinLeftRightW := ACutParam.PnlBBorderLeftRightWidth;
      LRet.PnlB.PBorderSize^.MinTopBottomW := ACutParam.PnlBBorderTopBottomWidth;
      LRet.PnlB.PBorderSize^.MaxLeftRightW := ACutParam.PnlBBorderLeftRightWidth;
      LRet.PnlB.PBorderSize^.MaxTOpBottomW := ACutParam.PnlBBorderTopBottomWidth;
      LRet.PnlB.PBorderSize^.NowLeftRightW := ACutParam.PnlBBorderLeftRightWidth;
      LRet.PnlB.PBorderSize^.NowTopBottomW := ACutParam.PnlBBorderTopBottomWidth;
      lret.PnlB.PBorderSize^.OldLeftRightW := ACutParam.PnlBBorderLeftRightWidth;
      LRet.PnlB.PBorderSize^.OldTopBottomW := ACutParam.PnlBBorderTopBottomWidth;

      LRet.PnlB.OriginalPaintData := Calc4RegToPaintData(LABSheetArr[I].SheetB.PChildCalc4Reg^,
        ACutParam.PnlBSetHorzSpace, ACutParam.PnlBSetVertSpace,
        LRet.CutParam.PnlBBorderLeftRightWidth,
        LRet.CutParam.PnlBBorderTopBottomWidth, LZoom);
    end;

    //useage
    LRet.SetSheetUseage(
              GetABSheetSetCount(labsheetarr[I])* (ACutParam.PnlASetW * ACutParam.PnlASetH)
            /(ACutParam.SheetW * ACutParam.SheetH) * 100
       );

    outRetlst.Add(LRet);

  end;
end;

procedure RotateRect270(var ACalc4Reg: TCalc4Reg);
var
  tmpFloat: Double;
  tmpInt: Integer;
  tmpCalcReg1,tmpcalcreg2: TCalcReg;
  I: Integer;
begin
  tmpFloat := ACalc4Reg.H;
  ACalc4Reg.H := ACalc4Reg.W;
  ACalc4Reg.W := tmpFloat;

  for I := 0 to 3 do
  begin
    tmpFloat := ACalc4Reg.RegArr[I].W;
    ACalc4Reg.RegArr[I].W := ACalc4Reg.RegArr[I].H;
    ACalc4Reg.RegArr[I].H := tmpFloat;
    tmpInt := ACalc4Reg.RegArr[I].Xnum;
    ACalc4Reg.RegArr[I].Xnum := ACalc4Reg.RegArr[I].Ynum;
    ACalc4Reg.RegArr[I].Ynum := tmpInt;
    ACalc4Reg.RegArr[I].Block.R := not ACalc4Reg.RegArr[I].Block.R;
  end;

  tmpCalcReg1 := ACalc4Reg.RegArr[0];
  ACalc4Reg.RegArr[0] := ACalc4Reg.RegArr[1];
  tmpcalcreg2 := ACalc4Reg.RegArr[2];
  ACalc4Reg.RegArr[2] := tmpCalcReg1;
  tmpCalcReg1 := ACalc4Reg.RegArr[3];
  ACalc4Reg.RegArr[3] := tmpcalcreg2;
  ACalc4Reg.RegArr[1] := tmpCalcReg1;

end;


end.
