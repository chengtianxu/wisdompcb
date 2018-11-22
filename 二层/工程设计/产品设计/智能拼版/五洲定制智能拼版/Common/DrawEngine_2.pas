unit DrawEngine_2;

interface
uses
  IRetIntf, GdiPlusHelpers, GdiPlus, Graphics, SysUtils, Classes, Types, Windows;

const
  USERREADTEXTW = 250;
  USERREADTEXTH = 250;
  g_SheetUSERREADTEXTW = 100;
  g_SheetUSERREADTEXTH = 100;
  g_PnlAUSERREADTEXTW = 100;
  g_PnlAUSERREADTEXTH = 100;
  g_PnlBUSERREADTEXTW = 100;
  g_PnlBUSERREADTEXTH = 100;


  SAVEIMAGEW = 480;
  SAVEIMAGEH = 480;
  BACKGROUNDCOLOR = clWhite;

type
  TDrawEng = record
  public
    FGPSheetImg: IGPBitmap;
    FGPPnlAImg: IGPBitmap;
    FGPPnlBImg: IGPBitmap;
    //procedure StrectDraw(ASource: IGPBitmap; ADest: HDC; ADestW,ADestH: Integer);
    procedure PaintIRet(AIndex: Integer; ADest: HDC; ADC_W,ADC_H: Integer; ARet: IRet);//AIndex= 1=sheet，2=pnla 3= pnlb
  end;

var
  gDrawEng: TDrawEng;
  g_PenWidth: Single = 1;      //预设值，后面在画中会调整
  g_SheetFontSize: Single = 12;
  g_PnlAFontSize: Single = 12;
  g_PnlBFontSize: Single = 12;
implementation
uses
  Math,Adapter;

procedure StrectDraw(ASource: IGPBitmap; ADest: HDC; ADestW,
  ADestH: Integer);
var
  ZoomW,ZoomH: Double;
  LGP: IGPGraphics;
  LBrush: IGPSolidBrush;
begin
  if not Assigned(ASource) then Exit;
  LGP := TGPGraphics.Create(ADest);
  LBrush := TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR));
  if (ASource.Width/ASource.Height) > (ADestW/ ADestH) then
  begin
    ZoomW := ADestW;
    ZoomH := ASource.Height*(ADestW/ASource.Width);
  end else
  begin
    ZoomW := ASource.Width*(ADestH/ASource.Height);
    ZoomH := ADestH;
  end;
  LGP.FillRectangle(LBrush,TGPRectF.Create(0,0,ADestW, ADestH));
  LGP.InterpolationMode := InterpolationModeHighQualityBicubic;
  LGP.DrawImage(ASource,TGPRectF.Create((ADestW-ZoomW)/2,(ADestH-ZoomH)/2,ZoomW, ZoomH),
    0,0,ASource.Width,ASource.Height, UnitPixel);
end;

function ExtractGPRectF(ABlock: TFloatRect; ACenterOffsetX,ACenterOffsetY: Double): TGPRectF;
begin
  Result.X := ABlock.X + ACenterOffsetX;
  Result.Y := ABlock.Y + ACenterOffsetY;
  Result.Width := ABlock.W;
  Result.Height := ABlock.H;
end;

function ExtractFixZoom(ADesW, ADesH, ASrcW, ASrcH: Double): Double;
begin
  if (ADesH <= 0) or (ASrcH <= 0) then
  begin
    Result := 0;
    Exit;
  end;
  if (ADesW / ADesH) > (ASrcW / ASrcH) then
    Result := ADesH /ASrcH
  else
    Result := ADesW /ASrcW;
end;

function MakeCenter(ASrcW, ASrcH, ADesW, ADesH: Double): TGPRectF;
begin
  Result.X := (ADesW - ASrcW) / 2;
  Result.Y := (ADesH - ASrcH) / 2;
end;

procedure DrawPaintData(ABtMap: IGPBitmap; APaintData: TPaintData;
  CenterX,CenterY: Double; AColor: TColor = clBlack);
var
  LPen: IGPPen;
  LGP: IGPGraphics;
  I: Integer;
begin
  LGP := TGPGraphics.Create(ABtMap);
  LPen := TGPPen.Create(TGPcolor.CreateFromColorRef(AColor),g_PenWidth);
  LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),0,0,ABtMap.Width,ABtMap.Height);
  LGP.DrawRectangle(LPen,ExtractGPRectF(APaintData.Reg,CenterX,CenterY));
  for I := 0 to Length(APaintData.BlockArr) - 1 do
  begin
    LGP.DrawRectangle(LPen,ExtractGPRectF(APaintData.BlockArr[I],CenterX,
      CenterY));
  end;
  for I := 0 to Length(APaintData.ZKBlockArr) - 1 do
  begin
    LGP.DrawRectangle(LPen,ExtractGPRectF(APaintData.ZKBlockArr[I],CenterX,
      CenterY));
  end;
end;

procedure DrawDWK(ABtMap: IGPBitmap; APaintData: TPaintData;
  CenterX,CenterY: Double; AColor: TColor = clBlack);
var
  LPen: IGPPen;
  LGP: IGPGraphics;
  LSmlR,lBigR: Double;
begin
  LGP := TGPGraphics.Create(ABtMap);
  LPen := TGPPen.Create(TGPcolor.CreateFromColorRef(AColor),g_PenWidth);
  LSmlR := 10;
  lBigR := 20;
  //靶标
  if kBB in APaintData.DWK then
  begin
    if kBBShuiPing in APaintData.DWK then
    begin
      LGP.DrawEllipse(LPen,CenterX - lBigR / 2,CenterY + APaintData.Reg.H/3*2,lBigR,lBigR);
      LGP.DrawEllipse(LPen,CenterX - LSmlR / 2,CenterY + APaintData.Reg.H/3*2 + (lBigR- LSmlR)/2,LSmlR,LSmlR);
      LGP.DrawEllipse(LPen,CenterX - lBigR / 2 + APaintData.Reg.W,CenterY + APaintData.Reg.H/3*2,lBigR,lBigR);
      LGP.DrawEllipse(LPen,CenterX - LSmlR / 2 + APaintData.Reg.W,CenterY + APaintData.Reg.H/3*2 + (lBigR- LSmlR)/2,LSmlR,LSmlR);
      LGP.DrawEllipse(LPen,CenterX - lBigR / 2 + APaintData.Reg.W,CenterY + APaintData.Reg.H/3,lBigR,lBigR);
      LGP.DrawEllipse(LPen,CenterX - LSmlR / 2 + APaintData.Reg.W,CenterY + APaintData.Reg.H/3 + (lBigR- LSmlR)/2,LSmlR,LSmlR);
    end else
    begin
      LGP.DrawEllipse(LPen,CenterX + APaintData.Reg.W/3,CenterY - lBigR/2,lBigR,lBigR);
      LGP.DrawEllipse(LPen,CenterX + APaintData.Reg.W/3  + (lBigR- LSmlR)/2,CenterY - LSmlR/2,LSmlR,LSmlR);
      LGP.DrawEllipse(LPen,CenterX + APaintData.Reg.W/3,CenterY - lBigR/2 + APaintData.Reg.H,lBigR,lBigR);
      LGP.DrawEllipse(LPen,CenterX + APaintData.Reg.W/3  + (lBigR- LSmlR)/2,CenterY - LSmlR/2 + APaintData.Reg.H,LSmlR,LSmlR);
      LGP.DrawEllipse(LPen,CenterX + APaintData.Reg.W/3*2,CenterY - lBigR/2 + APaintData.Reg.H,lBigR,lBigR);
      LGP.DrawEllipse(LPen,CenterX + APaintData.Reg.W/3*2  + (lBigR- LSmlR)/2,CenterY - LSmlR/2 + APaintData.Reg.H,LSmlR,LSmlR);
    end;
  end;
  //销钉孔
  if kXDK in APaintData.DWK then
  begin
    LGP.DrawEllipse(LPen,CenterX - lBigR / 2,CenterY + APaintData.Reg.H/2,lBigR,lBigR);
    LGP.DrawEllipse(LPen,CenterX - LSmlR / 2,CenterY + APaintData.Reg.H/2 + (lBigR- LSmlR)/2,LSmlR,LSmlR);
    LGP.DrawEllipse(LPen,CenterX - lBigR / 2 + APaintData.Reg.W,CenterY + APaintData.Reg.H/2,lBigR,lBigR);
    LGP.DrawEllipse(LPen,CenterX - LSmlR / 2 + APaintData.Reg.W,CenterY + APaintData.Reg.H/2 + (lBigR- LSmlR)/2,LSmlR,LSmlR);
  end;
  //喷锡挂钩
  if kPXGG in APaintData.DWK then
  begin
    LGP.DrawEllipse(LPen,CenterX - LSmlR / 2,CenterY+ APaintData.Reg.H/2-LSmlR ,LSmlR,LSmlR);
    LGP.DrawEllipse(LPen,CenterX + APaintData.Reg.W - LSmlR / 2,CenterY+ APaintData.Reg.H/2 -LSmlR ,LSmlR,LSmlR);
  end;
  //校对
  if kJDK in APaintData.DWK then
  begin
    LGP.DrawEllipse(LPen,CenterX - lBigR / 2 ,CenterY + (APaintData.Reg.H/2) + lBigR,lBigR,lBigR);
    LGP.DrawEllipse(LPen,CenterX - lBigR / 2 + APaintData.Reg.W,CenterY + (APaintData.Reg.H/2) + lBigR,lBigR,lBigR);
//
    LGP.DrawLine(LPen,CenterX - lBigR / 2, CenterY + (APaintData.Reg.H/2) + lBigR*1.5 ,
      CenterX + lBigR / 2, CenterY + (APaintData.Reg.H/2) + lBigR*1.5 );
//
    LGP.DrawLine(LPen,CenterX - lBigR / 2 + APaintData.Reg.W, CenterY + (APaintData.Reg.H/2) + lBigR*1.5 ,
      CenterX + lBigR / 2 + APaintData.Reg.W, CenterY + (APaintData.Reg.H/2) + lBigR*1.5 );
  end;

end;


procedure DrawArrowCB(ABtMap: IGPBitmap; APaintData: TPaintData;
  CenterX,CenterY: Double; AColor: TColor = clBlack);
var
  LPen: IGPPen;
  LGP: IGPGraphics;
  I: Integer;
  LBlockRect: TGPRectF;
  LPt1,LPt2: TGPPointF;
  LArrLen: Single;
begin
  LGP := TGPGraphics.Create(ABtMap);
  LPen := TGPPen.Create(TGPcolor.CreateFromColorRef(AColor),g_PenWidth);
  for I := 0 to Length(APaintData.BlockArr) - 1 do
  begin
    LBlockRect := ExtractGPRectF(APaintData.BlockArr[I],CenterX,CenterY);
    case APaintData.BlockArr[I].ArrowCB of
      0:;
      1://上右拐
      begin
        //画线
        LPt1.X := LBlockRect.X + LBlockRect.Width / 3;
        LPt1.Y := LBlockRect.Y + LBlockRect.Height /5 * 4;
        LPt2.X := LPt1.X;
        LPt2.Y := LBlockRect.Y + LBlockRect.Height /5;
        LGP.DrawLine(LPen,LPt1,LPt2);
        //箭头
        LArrLen := (LPt1.Y - LPt2.Y) / 3;
        LPt1.X := LPt2.X + LArrLen;
        LPt1.Y := LPt2.Y + LArrLen;
        LGP.DrawLine(LPen,LPt1,LPt2);
      end;
      2://上左拐
      begin

        LPt1.X := LBlockRect.X + LBlockRect.Width / 3 * 2;
        LPt1.Y := LBlockRect.Y + LBlockRect.Height /5 * 4;
        LPt2.X := LPt1.X;
        LPt2.Y := LBlockRect.Y + LBlockRect.Height /5;
        LGP.DrawLine(LPen,LPt1,LPt2);

        LArrLen := (LPt1.Y - LPt2.Y) / 3;
        LPt1.X := LPt2.X - LArrLen;
        LPt1.Y := LPt2.Y + LArrLen;
        LGP.DrawLine(LPen,LPt1,LPt2);
      end;
      3:// 下左拐
      begin
        LPt1.X := LBlockRect.X + LBlockRect.Width / 3 * 2;
        LPt1.Y := LBlockRect.Y + LBlockRect.Height /5 * 4;
        LPt2.X := LPt1.X;
        LPt2.Y := LBlockRect.Y + LBlockRect.Height /5;
        LGP.DrawLine(LPen,LPt1,LPt2);

        LArrLen := (LPt1.Y - LPt2.Y) / 3;
        LPt2.X := LPt1.X - LArrLen;
        LPt2.Y := LPt1.Y - LArrLen;
        LGP.DrawLine(LPen,LPt1,LPt2);
      end;
      4://下右拐
      begin
        LPt1.X := LBlockRect.X + LBlockRect.Width / 3;
        LPt1.Y := LBlockRect.Y + LBlockRect.Height /5 * 4;
        LPt2.X := LPt1.X;
        LPt2.Y := LBlockRect.Y + LBlockRect.Height /5;
        LGP.DrawLine(LPen,LPt1,LPt2);

        LArrLen := (LPt1.Y - LPt2.Y) / 3;
        LPt2.X := LPt1.X + LArrLen;
        LPt2.Y := LPt1.Y - LArrLen;
        LGP.DrawLine(LPen,LPt1,LPt2);
      end;
      5: //右下拐
      begin
        LPt1.X := LBlockRect.X + LBlockRect.Width / 5;
        LPt1.Y := LBlockRect.Y + LBlockRect.Height / 3;
        LPt2.X := LBlockRect.X + LBlockRect.Width / 5 * 4;
        LPt2.Y := LPt1.Y;
        LGP.DrawLine(LPen,LPt1,LPt2);

        LArrLen := (LPt2.X - LPt1.X) / 3;
        LPt1.X := LPt2.X - LArrLen;
        LPt1.Y := LPt2.Y + LArrLen;
        LGP.DrawLine(LPen,LPt1,LPt2);
      end;
      6://右上拐
      begin
        LPt1.X := LBlockRect.X + LBlockRect.Width / 5;
        LPt1.Y := LBlockRect.Y + LBlockRect.Height / 3 * 2;
        LPt2.X := LBlockRect.X + LBlockRect.Width / 5 * 4;
        LPt2.Y := LPt1.Y;
        LGP.DrawLine(LPen,LPt1,LPt2);

        LArrLen := (LPt2.X - LPt1.X) / 3;
        LPt1.X := LPt2.X - LArrLen;
        LPt1.Y := LPt2.Y - LArrLen;
        LGP.DrawLine(LPen,LPt1,LPt2);
      end;
      7://左上拐
      begin
        LPt1.X := LBlockRect.X + LBlockRect.Width / 5;
        LPt1.Y := LBlockRect.Y + LBlockRect.Height / 3 * 2;
        LPt2.X := LBlockRect.X + LBlockRect.Width / 5 * 4;
        LPt2.Y := LPt1.Y;
        LGP.DrawLine(LPen,LPt1,LPt2);

        LArrLen := (LPt2.X - LPt1.X) / 3;
        LPt2.X := LPt1.X + LArrLen;
        LPt2.Y := LPt1.Y - LArrLen;
        LGP.DrawLine(LPen,LPt1,LPt2);
      end;
      8://左下拐
      begin
        LPt1.X := LBlockRect.X + LBlockRect.Width / 5;
        LPt1.Y := LBlockRect.Y + LBlockRect.Height / 3;
        LPt2.X := LBlockRect.X + LBlockRect.Width / 5 * 4;
        LPt2.Y := LPt1.Y;
        LGP.DrawLine(LPen,LPt1,LPt2);

        LArrLen := (LPt2.X - LPt1.X) / 3;
        LPt2.X := LPt1.X + LArrLen;
        LPt2.Y := LPt1.Y + LArrLen;
        LGP.DrawLine(LPen,LPt1,LPt2);
      end;
    end;

  end;
end;

procedure DrawIRetNote(AIndex: Integer; ARet: IRet; APaintdata: TPaintData);
var
  LPaintData: TPaintData;
  LGP: IGPGraphics;
  LPen,LCapPen: IGPPen;
  LCap: IGPAdjustableArrowCap;
  LFont: IGPFont;
  LFontBrush: IGPBrush;
  LStringFormat: IGPStringFormat;
  LStringRect: TGPRectF;
  tmpS: string;
  tmpW,tmpH: Double;
  LBottom,LRight: TFloatRect;
  tmpRect: TFloatRect;
  tmpIBlock: IBlock;
  I: Integer;
  bHas: Boolean;
begin
  LFontBrush := TGPSolidBrush.Create(TGPCOlor.Black);
  LStringFormat := TGPStringFormat.Create;
  LStringFormat.Alignment := StringAlignmentCenter;
  LStringFormat.LineAlignment := StringAlignmentCenter;
  case AIndex of
    0,1:
    begin
      LPen := TGPPen.Create(TGPColor.Black,g_PenWidth);
      LCapPen := TGPPen.Create(TGPColor.Black,g_PenWidth);
      LCap := TGPAdjustableArrowCap.Create(6, 6, False);
      LCapPen.CustomStartCap := LCap;
      LCapPen.CustomEndCap := LCap;
      LFont := TGPFont.Create(TGPFontFamily.Create('Arial'), g_SheetFontSize,[]);
      LPaintData := APaintdata;//ARet.SheetA.PaintData;
      LGP := TGPGraphics.Create(gDrawEng.FGPSheetImg);
      //画大料的长
      LGP.DrawLine(LPen,g_SheetUSERREADTEXTW,30,g_SheetUSERREADTEXTW,g_SheetUSERREADTEXTH-5);
      LGP.DrawLine(LPen,g_SheetUSERREADTEXTW+ LPaintData.Reg.W,30,g_SheetUSERREADTEXTW +
        LPaintData.Reg.W,g_SheetUSERREADTEXTH-5);
      LGP.DrawLine(LCapPen,g_SheetUSERREADTEXTW+8,50,g_SheetUSERREADTEXTW + LPaintData.Reg.W-8,
        50);
      tmpS := FormatFloat('0.000',ARet.CutParam.SheetW) + '纬向';
      LStringFormat.FormatFlags := [];
      LStringRect := TGPRectF.Create(g_SheetUSERREADTEXTW,g_SheetUSERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := g_SheetUSERREADTEXTW + (LPaintData.Reg.W - LStringRect.Width) / 2;
      LStringRect.Y := 25;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画大料的高
      LGP.DrawLine(LPen,30,g_SheetUSERREADTEXTH,g_SheetUSERREADTEXTW-5,g_SheetUSERREADTEXTH);
      LGP.DrawLine(LPen,30,g_SheetUSERREADTEXTH+ LPaintData.Reg.H,g_SheetUSERREADTEXTW-5,
        g_SheetUSERREADTEXTH+ LPaintData.Reg.H);
      LGP.DrawLine(LCapPen,50,g_SheetUSERREADTEXTH+8,50,g_SheetUSERREADTEXTH+ LPaintData.Reg.H - 8);
      tmpS := FormatFloat('0.000',ARet.CutParam.SheetH) + '经向';
      LStringFormat.FormatFlags := [StringFormatFlagsDirectionVertical];
      LStringRect := TGPRectF.Create(g_SheetUSERREADTEXTW,g_SheetUSERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := 25;
      LStringRect.Y := g_SheetUSERREADTEXTH + (LPaintData.Reg.H - LStringRect.Height) / 2;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画PNLA的长
      tmpIBlock := ARet.SheetA.Regs[LPaintData.BlockArr[0].RegIndex].Colums[LPaintData.BlockArr[0].ColumIndex].Rows[LPaintData.BlockArr[0].RowIndex];
      if tmpIBlock.Rotate then
      begin
        tmpW := tmpIBlock.H;
        tmpH := tmpIBlock.W;
      end else
      begin
        tmpW := tmpIBlock.W;
        tmpH := tmpIBlock.H;
      end;
      LGP.DrawLine(LPen,g_SheetUSERREADTEXTW+ LPaintData.BlockArr[0].W,70,g_SheetUSERREADTEXTW +
        LPaintData.BlockArr[0].W,g_SheetUSERREADTEXTH - 5);
      LGP.DrawLine(LCapPen,g_SheetUSERREADTEXTW + 8,80,g_SheetUSERREADTEXTW+ LPaintData.BlockArr[0].W -8,
        80);
      tmpS := FormatFloat('0.000', tmpW);
      LStringFormat.FormatFlags := [];
      LStringRect := TGPRectF.Create(g_SheetUSERREADTEXTW,g_SheetUSERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := g_SheetUSERREADTEXTW + (LPaintData.BlockArr[0].W - LStringRect.Width) / 2;
      LStringRect.Y := 60;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画PNLA的高
      LGP.DrawLine(LPen,70,g_SheetUSERREADTEXTH + LPaintData.BlockArr[0].H,g_SheetUSERREADTEXTW - 5,
        g_SheetUSERREADTEXTH + LPaintData.BlockArr[0].H);
      LGP.DrawLine(LCapPen,80,g_SheetUSERREADTEXTH + 8,80,g_SheetUSERREADTEXTH + LPaintData.BlockArr[0].H - 8);
      tmpS := FormatFloat('0.000',tmpH);
      LStringFormat.FormatFlags := [StringFormatFlagsDirectionVertical];
      LStringRect := TGPRectF.Create(g_SheetUSERREADTEXTW,g_SheetUSERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := 60;
      LStringRect.Y := g_SheetUSERREADTEXTH + (LPaintData.BlockArr[0].H - LStringRect.Height) / 2;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);

      //画PNLB
      if ARet.SheetB.GetCellCount <> 0 then
      begin
        if ARet.SheetB.Calc4Reg.Hor_Ver = 0 then//上下
        begin
          LPaintData :=  ARet.SheetB.PaintData;
          tmpIBlock := ARet.SheetB.Regs[LPaintData.BlockArr[0].RegIndex].Colums[LPaintData.BlockArr[0].ColumIndex].Rows[LPaintData.BlockArr[0].RowIndex];
          if tmpIBlock.Rotate then
          begin
            tmpW := tmpIBlock.H;
            tmpH := tmpIBlock.W;
          end else
          begin
            tmpW := tmpIBlock.W;
            tmpH := tmpIBlock.H;
          end;
          //画宽
          LGP.DrawLine(LPen,g_SheetUSERREADTEXTW+ LPaintData.BlockArr[0].W,
            g_SheetUSERREADTEXTH+ ARet.SheetA.PaintData.Reg.H + ARet.SheetB.PaintData.Reg.H + 40,g_SheetUSERREADTEXTW +
            LPaintData.BlockArr[0].W, g_SheetUSERREADTEXTH + ARet.SheetA.PaintData.Reg.H + ARet.SheetB.PaintData.Reg.H + 5);
          LGP.DrawLine(LPen,g_SheetUSERREADTEXTW,g_SheetUSERREADTEXTH+ ARet.SheetA.PaintData.Reg.H + ARet.SheetB.PaintData.Reg.H + 40,g_SheetUSERREADTEXTW
            , g_SheetUSERREADTEXTH + ARet.SheetA.PaintData.Reg.H + ARet.SheetB.PaintData.Reg.H + 5);
          LGP.DrawLine(LCapPen,g_SheetUSERREADTEXTW + 8,g_SheetUSERREADTEXTH + aret.SheetA.PaintData.Reg.H + ARet.SheetB.PaintData.Reg.H + 20,g_SheetUSERREADTEXTW+ LPaintData.BlockArr[0].W -8,
           g_SheetUSERREADTEXTH+  aret.SheetA.PaintData.Reg.H + ARet.SheetB.PaintData.Reg.H + 20);
          tmpS := FormatFloat('0.000', tmpW);
          LStringFormat.FormatFlags := [];
          LStringRect := TGPRectF.Create(g_SheetUSERREADTEXTW,g_SheetUSERREADTEXTH,ARet.CutParam.SheetW,ARet.CutParam.SheetH);
          LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
          LStringRect.X := g_SheetUSERREADTEXTW + (LPaintData.BlockArr[0].W - LStringRect.Width) / 2;
          LStringRect.Y := g_SheetUSERREADTEXTH + aret.SheetA.PaintData.Reg.H + ARet.SheetB.PaintData.Reg.H + 20;
          LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
          LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
          //画PNL的高
          LGP.DrawLine(LPen,70,g_SheetUSERREADTEXTH + ARet.SheetA.PaintData.Reg.H + LPaintData.BlockArr[0].H,g_SheetUSERREADTEXTW - 5,
            g_SheetUSERREADTEXTH + ARet.SheetA.PaintData.Reg.H + LPaintData.BlockArr[0].H);
          LGP.DrawLine(LPen,70,g_SheetUSERREADTEXTH + ARet.SheetA.PaintData.Reg.H,g_SheetUSERREADTEXTW - 5,
            g_SheetUSERREADTEXTH + ARet.SheetA.PaintData.Reg.H);
          LGP.DrawLine(LCapPen,80,g_SheetUSERREADTEXTH + ARet.SheetA.PaintData.Reg.H + 8,80,g_SheetUSERREADTEXTH + LPaintData.BlockArr[0].H + ARet.SheetA.PaintData.Reg.H - 8);
          tmpS := FormatFloat('0.000',tmpH);
          LStringFormat.FormatFlags := [StringFormatFlagsDirectionVertical];
          LStringRect := TGPRectF.Create(g_SheetUSERREADTEXTW,g_SheetUSERREADTEXTH,ARet.CutParam.SheetW,ARet.CutParam.SheetH);
          LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
          LStringRect.X := 60;
          LStringRect.Y := g_SheetUSERREADTEXTH + ARet.SheetA.PaintData.Reg.H + (LPaintData.BlockArr[0].H - LStringRect.Height) / 2;
          LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
          LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
        end else
        begin
          LPaintData :=  ARet.SheetB.PaintData;
          tmpIBlock := ARet.SheetB.Regs[LPaintData.BlockArr[0].RegIndex].Colums[LPaintData.BlockArr[0].ColumIndex].Rows[LPaintData.BlockArr[0].RowIndex];
          if tmpIBlock.Rotate then
          begin
            tmpW := tmpIBlock.H;
            tmpH := tmpIBlock.W;
          end else
          begin
            tmpW := tmpIBlock.W;
            tmpH := tmpIBlock.H;
          end;
          LGP.DrawLine(LPen,g_SheetUSERREADTEXTW+ LPaintData.BlockArr[0].W + ARet.SheetA.PaintData.Reg.W,70,g_SheetUSERREADTEXTW +
            LPaintData.BlockArr[0].W + ARet.SheetA.PaintData.Reg.W,g_SheetUSERREADTEXTH - 5);
          LGP.DrawLine(LPen,g_SheetUSERREADTEXTW + ARet.SheetA.PaintData.Reg.W,70,g_SheetUSERREADTEXTW +
              ARet.SheetA.PaintData.Reg.W,g_SheetUSERREADTEXTH - 5);
          LGP.DrawLine(LCapPen,g_SheetUSERREADTEXTW+ ARet.SheetA.PaintData.Reg.W + 8,80,g_SheetUSERREADTEXTW+ LPaintData.BlockArr[0].W+ ARet.SheetA.PaintData.Reg.W -8,
            80);
          tmpS := FormatFloat('0.000', tmpW);
          LStringFormat.FormatFlags := [];
          LStringRect := TGPRectF.Create(g_SheetUSERREADTEXTW,g_SheetUSERREADTEXTH,ARet.CutParam.SheetW,ARet.CutParam.SheetH);
          LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
          LStringRect.X := g_SheetUSERREADTEXTW + ARet.SheetA.PaintData.Reg.W + (LPaintData.BlockArr[0].W - LStringRect.Width) / 2;
          LStringRect.Y := 60;
          LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
          LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
          //画PNL的高
          LGP.DrawLine(LPen,g_SheetUSERREADTEXTW + ARet.SheetA.PaintData.Reg.W + ARet.SheetB.PaintData.Reg.W + 5,
            g_SheetUSERREADTEXTH + LPaintData.BlockArr[0].H,g_SheetUSERREADTEXTW + ARet.SheetA.PaintData.Reg.W + ARet.SheetB.PaintData.Reg.W + 50,
            g_SheetUSERREADTEXTH + LPaintData.BlockArr[0].H);
          LGP.DrawLine(LPen,g_SheetUSERREADTEXTW + ARet.SheetA.PaintData.Reg.W + ARet.SheetB.PaintData.Reg.W + 5,
            g_SheetUSERREADTEXTH ,g_SheetUSERREADTEXTW + ARet.SheetA.PaintData.Reg.W + ARet.SheetB.PaintData.Reg.W + 50,
            g_SheetUSERREADTEXTH);
          LGP.DrawLine(LCapPen,g_SheetUSERREADTEXTW + ARet.SheetA.PaintData.Reg.W + ARet.SheetB.PaintData.Reg.W + 30,
            g_SheetUSERREADTEXTH + 8,g_SheetUSERREADTEXTW + ARet.SheetA.PaintData.Reg.W + ARet.SheetB.PaintData.Reg.W + 30,g_SheetUSERREADTEXTH + LPaintData.BlockArr[0].H - 8);
          tmpS := FormatFloat('0.000',tmpH);
          LStringFormat.FormatFlags := [StringFormatFlagsDirectionVertical];
          LStringRect := TGPRectF.Create(g_SheetUSERREADTEXTW,g_SheetUSERREADTEXTH,ARet.CutParam.SheetW,ARet.CutParam.SheetH);
          LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
          LStringRect.X := g_SheetUSERREADTEXTW + ARet.SheetA.PaintData.Reg.W + ARet.SheetB.PaintData.Reg.W + 30;
          LStringRect.Y := g_SheetUSERREADTEXTH + (LPaintData.BlockArr[0].H - LStringRect.Height) / 2;
          LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
          LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
        end;
      end;

      //备注手动还是自动开料
      if LPaintData.AutoCut then
      begin
        tmpS := '注: 自动开料';
      end else
        tmpS := '注: 手工开料';
      LStringFormat.FormatFlags := [];
      LStringRect := TGPRectF.Create(g_SheetUSERREADTEXTW,g_SheetUSERREADTEXTH,9999,9999);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := gDrawEng.FGPSheetImg.Width - LStringRect.Width - 100;
      LStringRect.Y := gDrawEng.FGPSheetImg.Height - LStringRect.Height * 2 - 30;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);

      //标注AB板
      for I := 0 to Length(APaintdata.BlockArr) - 1 do
      begin
        if APaintData.BlockArr[I].AB = 0 then
        begin
          tmpS := 'A';
        end else
        //if APaintData.BlockArr[I].AB = 1 then
        begin
          tmpS := 'B';
        end;
        //LStringFormat.Alignment := StringAlignmentCenter;
        LGP.DrawString(tmpS,LFont,ExtractGPRectF(APaintData.BlockArr[I],g_SheetUSERREADTEXTW,g_SheetUSERREADTEXTH),LStringFormat,LFontBrush);
      end;

    end;
    2:
    begin
      LPen := TGPPen.Create(TGPColor.Black,g_PenWidth);
      LCapPen := TGPPen.Create(TGPColor.Black,g_PenWidth);
      LCap := TGPAdjustableArrowCap.Create(6, 6, False);
      LCapPen.CustomStartCap := LCap;
      LCapPen.CustomEndCap := LCap;
      LPaintData := APaintdata;
      LGP := TGPGraphics.Create(gDrawEng.FGPPnlAImg);
      LFont := TGPFont.Create(TGPFontFamily.Create('Arial'), g_PnlAFontSize,[]);
      //画PNL的长
      LGP.DrawLine(LPen,g_PnlAUSERREADTEXTW,30,g_PnlAUSERREADTEXTW,g_PnlAUSERREADTEXTH-5);
      LGP.DrawLine(LPen,g_PnlAUSERREADTEXTW+ LPaintData.Reg.W,30,g_PnlAUSERREADTEXTW +
        LPaintData.Reg.W,g_PnlAUSERREADTEXTH-5);
      LGP.DrawLine(LCapPen,g_PnlAUSERREADTEXTW+8,40,g_PnlAUSERREADTEXTW + LPaintData.Reg.W-8,
        40);
      tmpIBlock := ARet.SheetA.Regs[ARet.SheetA.PaintData.BlockArr[0].RegIndex].Colums[ARet.SheetA.PaintData.BlockArr[0].ColumIndex].Rows[ARet.SheetA.PaintData.BlockArr[0].RowIndex];
      if tmpIBlock.Rotate then
      begin
        tmpS := FormatFloat('0.000',ARet.PnlA.W) + '经向';
      end else
      begin
        tmpS := FormatFloat('0.000',ARet.PnlA.W) + '纬向';
      end;
      LStringFormat.FormatFlags := [];
      LStringRect := TGPRectF.Create(g_PnlAUSERREADTEXTW,g_PnlAUSERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := g_PnlAUSERREADTEXTW + (LPaintData.Reg.W - LStringRect.Width) / 2;
      LStringRect.Y := 30;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画PNL高
      LGP.DrawLine(LPen,30,g_PnlAUSERREADTEXTH,g_PnlAUSERREADTEXTW-5,g_PnlAUSERREADTEXTH);
      LGP.DrawLine(LPen,30,g_PnlAUSERREADTEXTH+ LPaintData.Reg.H,g_PnlAUSERREADTEXTW-5,
        g_PnlAUSERREADTEXTH+ LPaintData.Reg.H);
      LGP.DrawLine(LCapPen,40,g_PnlAUSERREADTEXTH+8,40,g_PnlAUSERREADTEXTH+ LPaintData.Reg.H - 8);
      if tmpIBlock.Rotate then
      begin
        tmpS := FormatFloat('0.000',ARet.PnlA.H) + '纬向';
      end else
      begin
        tmpS := FormatFloat('0.000',ARet.PnlA.H) + '经向';
      end;
      LStringFormat.FormatFlags := [StringFormatFlagsDirectionVertical];
      LStringRect := TGPRectF.Create(g_PnlAUSERREADTEXTW,g_PnlAUSERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := 30;
      LStringRect.Y := g_PnlAUSERREADTEXTH + (LPaintData.Reg.H - LStringRect.Height) / 2;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画SET的宽
      LGP.DrawLine(LPen,g_PnlAUSERREADTEXTW + LPaintData.BlockArr[0].X,70,
        g_PnlAUSERREADTEXTW + LPaintData.BlockArr[0].X,g_PnlAUSERREADTEXTH - 5);
      LGP.DrawLine(LPen,g_PnlAUSERREADTEXTW + LPaintData.BlockArr[0].X + LPaintData.BlockArr[0].W,70,
        g_PnlAUSERREADTEXTW + LPaintData.BlockArr[0].X + LPaintData.BlockArr[0].W, g_PnlAUSERREADTEXTH - 5);
      LGP.DrawLine(LPen,g_PnlAUSERREADTEXTW + LPaintData.BlockArr[0].X + 4,70,
        g_PnlAUSERREADTEXTW + LPaintData.BlockArr[0].X + LPaintData.BlockArr[0].W - 4,70);
      tmpRect := LPaintData.BlockArr[0];
      tmpIBlock := ARet.PnlA.Regs[tmpRect.RegIndex].Colums[tmpRect.ColumIndex].Rows[tmpRect.RowIndex];
      if tmpIBlock.Rotate then
      begin
        tmpW := tmpIBlock.H;
        tmpH := tmpIBlock.W;
      end else
      begin
        tmpW := tmpIBlock.W;
        tmpH := tmpIBlock.H;
      end;
      tmpS := FormatFloat('0.000',tmpW);
      LStringFormat.FormatFlags := [];
      LStringRect := TGPRectF.Create(g_PnlAUSERREADTEXTW,g_PnlAUSERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := g_PnlAUSERREADTEXTW + LPaintData.BlockArr[0].X;
      LStringRect.Y := 70- LStringRect.Height;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画SET的高
      LGP.DrawLine(LPen,70,g_PnlAUSERREADTEXTH + LPaintData.BlockArr[0].Y,
        g_PnlAUSERREADTEXTW - 5,g_PnlAUSERREADTEXTH + LPaintData.BlockArr[0].Y);
      LGP.DrawLine(LPen,70,g_PnlAUSERREADTEXTH + LPaintData.BlockArr[0].Y + LPaintData.BlockArr[0].H,
        g_PnlAUSERREADTEXTW - 5, g_PnlAUSERREADTEXTH + LPaintData.BlockArr[0].Y + LPaintData.BlockArr[0].H);
      LGP.DrawLine(LPen,70,g_PnlAUSERREADTEXTH + LPaintData.BlockArr[0].Y + 4,70,
         g_PnlAUSERREADTEXTH + LPaintData.BlockArr[0].Y + LPaintData.BlockArr[0].H -4);
      tmpS := FormatFloat('0.000', tmpH);
      LStringFormat.FormatFlags := [StringFormatFlagsDirectionVertical];
      LStringRect := TGPRectF.Create(g_PnlAUSERREADTEXTW,g_PnlAUSERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := 70 - LStringRect.Width;
      LStringRect.Y := g_PnlAUSERREADTEXTH + LPaintData.BlockArr[0].Y +4;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画上下板边
      LBottom := LPaintData.BlockArr[0];
      for I := 0 to Length(LPaintData.BlockArr) - 1 do
      begin
        if LBottom.Y + LBottom.H < LPaintData.BlockArr[I].Y + LPaintData.BlockArr[I].H then
          LBottom := LPaintData.BlockArr[I];
      end;
      if LPaintData.ZKReg.ArrowCB <> 0 then
      begin
        if LBottom.Y + LBottom.H < LPaintData.ZKReg.Y + LPaintData.ZKReg.H then
          LBottom := LPaintData.ZKReg;
      end;

      LGP.DrawLine(LPen,g_PnlAUSERREADTEXTW + LPaintData.Reg.W + 5,
        g_PnlAUSERREADTEXTH + LBottom.Y + LBottom.H,
        g_PnlAUSERREADTEXTW + LPaintData.Reg.W + 30,
        g_PnlAUSERREADTEXTH + LBottom.Y + LBottom.H);
      LGP.DrawLine(LPen,g_PnlAUSERREADTEXTW + LPaintData.Reg.W + 5,
        g_PnlAUSERREADTEXTH + LPaintData.Reg.H,
        g_PnlAUSERREADTEXTW + LPaintData.Reg.W + 30,
        g_PnlAUSERREADTEXTH + LPaintData.Reg.H);
      LGP.DrawLine(LPen,g_PnlAUSERREADTEXTW + LPaintData.Reg.W + 25,
        g_PnlAUSERREADTEXTH + LBottom.Y + LBottom.H,
        g_PnlAUSERREADTEXTW + LPaintData.Reg.W + 25,
        g_PnlAUSERREADTEXTH + LPaintData.Reg.H);
      tmpS := FormatFloat('0.000',ARet.PnlA.PBorderSize^.NowTopBottomW);
      LStringFormat.FormatFlags := [];
      LStringRect := TGPRectF.Create(g_PnlAUSERREADTEXTW,g_PnlAUSERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := g_PnlAUSERREADTEXTW + LPaintData.Reg.W + 30;
      LStringRect.Y := g_PnlAUSERREADTEXTH + LBottom.Y + LBottom.H;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画左右板边
      LRight := LPaintData.BlockArr[0];
      for I := 0 to Length(LPaintData.BlockArr) - 1 do
      begin
        if (LRight.X + LRight.W) < (LPaintData.BlockArr[I].X + LPaintData.BlockArr[I].W) then
          LRight := LPaintData.BlockArr[I];
      end;
      if LPaintData.ZKReg.ArrowCB <> 0 then
      begin
        if LRight.X + LRight.W < LPaintData.ZKReg.X + LPaintData.ZKReg.W then
          LRight := LPaintData.ZKReg;
      end;

      LGP.DrawLine(LPen,g_PnlAUSERREADTEXTW + LRight.X + LRight.W,
        g_PnlAUSERREADTEXTH + LPaintData.Reg.H + 5,
        g_PnlAUSERREADTEXTW + LRight.X + LRight.W,
        g_PnlAUSERREADTEXTH + LPaintData.Reg.H + 30);
      LGP.DrawLine(LPen,g_PnlAUSERREADTEXTW + LPaintData.Reg.W,
        g_PnlAUSERREADTEXTH + LPaintData.Reg.H + 5,
        g_PnlAUSERREADTEXTW + LPaintData.Reg.W,
        g_PnlAUSERREADTEXTH + LPaintData.Reg.H + 30);
      LGP.DrawLine(LPen,g_PnlAUSERREADTEXTW + LRight.X + LRight.W,
        g_PnlAUSERREADTEXTH + LPaintData.Reg.H + 25,
        g_PnlAUSERREADTEXTW + LPaintData.Reg.W,
        g_PnlAUSERREADTEXTH + LPaintData.Reg.H + 25);
      tmpS := FormatFloat('0.000',ARet.PnlA.PBorderSize^.NowLeftRightW);
      LStringFormat.FormatFlags := [];
      LStringRect := TGPRectF.Create(g_PnlAUSERREADTEXTW,g_PnlAUSERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := g_PnlAUSERREADTEXTW + LRight.X + LRight.W;
      LStringRect.Y := g_PnlAUSERREADTEXTH + LPaintData.Reg.H + 30;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画水平间距
      tmpRect := LPaintData.BlockArr[0];
      bHas := False;
      for I := 0 to Length(LPaintData.BlockArr) - 1 do
      begin
        if tmpRect.X < LPaintData.BlockArr[I].X then
        begin
          tmpRect := LPaintData.BlockArr[I];
          bHas := True;
          Break;
        end;
      end;
      if LPaintData.ZKReg.ArrowCB = 2 then
      begin
        if tmpRect.X > LPaintData.ZKReg.X then
          tmpRect := LPaintData.ZKReg;
      end;
      if ARet.CutParam.PnlASetHorzSpace = 0 then
        bHas := False;
      if bHas then
      begin
        LGP.DrawLine(LPen,g_PnlAUSERREADTEXTW + tmpRect.X,80,
          g_PnlAUSERREADTEXTW + tmpRect.X,g_PnlAUSERREADTEXTH - 5);
        LGP.DrawLine(LPen,g_PnlAUSERREADTEXTW + LPaintData.BlockArr[0].X + LPaintData.BlockArr[0].W,80,
          g_PnlAUSERREADTEXTW + tmpRect.X + 30,80);
        tmpS := FormatFloat('0.000',ARet.CutParam.PnlASetHorzSpace);
        LStringFormat.FormatFlags := [];
        LStringRect := TGPRectF.Create(g_PnlAUSERREADTEXTW,g_PnlAUSERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
        LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
        LStringRect.X := g_PnlAUSERREADTEXTW + tmpRect.X + 5;
        LStringRect.Y := 80;
        LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
        LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      end;
      //画垂直间距
      tmpRect := LPaintData.BlockArr[0];
      bHas := False;
      for I := 0 to Length(LPaintData.BlockArr) - 1 do
      begin
        if tmpRect.Y < LPaintData.BlockArr[I].Y then
        begin
          tmpRect := LPaintData.BlockArr[I];
          bHas := True;
          Break;
        end;
      end;
      if LPaintData.ZKReg.ArrowCB = 1 then
      begin
        if tmpRect.Y > LPaintData.ZKReg.Y then
          tmpRect := LPaintData.ZKReg;
      end;
      if ARet.CutParam.PnlASetVertSpace = 0 then
        bHas := False;
      if bHas then
      begin
        LGP.DrawLine(LPen,80,g_PnlAUSERREADTEXTH + tmpRect.Y, g_PnlAUSERREADTEXTW - 5,
          g_PnlAUSERREADTEXTH + tmpRect.Y);
        LGP.DrawLine(LPen,80,g_PnlAUSERREADTEXTH + LPaintData.BlockArr[0].Y + LPaintData.BlockArr[0].H,80,
          g_PnlAUSERREADTEXTH + LPaintData.BlockArr[0].Y + LPaintData.BlockArr[0].H + 30);
        tmpS := FormatFloat('0.000',ARet.CutParam.PnlASetVertSpace);
        LStringFormat.FormatFlags := [StringFormatFlagsDirectionVertical];
        LStringRect := TGPRectF.Create(g_PnlAUSERREADTEXTW,g_PnlAUSERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
        LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
        LStringRect.X := 75;
        LStringRect.Y := g_PnlAUSERREADTEXTH + tmpRect.Y + 5;
        LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
        LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      end;

      //阻抗文字
      if LPaintData.ZKReg.ArrowCB <> 0 then
      begin
        tmpS := '阻抗条:   ';
        LStringFormat.FormatFlags := [];
        LStringRect := TGPRectF.Create(g_PnlAUSERREADTEXTW,g_PnlAUSERREADTEXTH,9999,9999);
        LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
        LStringRect.X := 10;
        LStringRect.Y := gDrawEng.FGPPnlAImg.Height - LStringRect.Height * 2 - 50;
        LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
        LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
        tmpW := LStringRect.X + LStringRect.Width;
        tmpH := LStringRect.Y;
        if LPaintData.ZKReg.RegIndex > 0 then
        begin

          tmpS := FormatFloat('###.###',ARet.CutParam.m6ZKLength) + 'mm X 6mm = ' + IntToStr(LPaintData.ZKReg.RegIndex) + ' 组 ';
          LStringRect := TGPRectF.Create(g_PnlAUSERREADTEXTW,g_PnlAUSERREADTEXTH,9999,9999);
          LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
          LStringRect.X := tmpW;
          LStringRect.Y := tmpH;
          LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
          LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
          tmpH := tmpH + LStringRect.Height + 10;
        end;
        if LPaintData.ZKReg.ColumIndex > 0 then
        begin
          tmpS := FormatFloat('###.###',ARet.CutParam.m3ZKLength) + 'mm X 3mm = ' + IntToStr(LPaintData.ZKReg.ColumIndex) + ' 组 ';
          LStringRect := TGPRectF.Create(g_PnlAUSERREADTEXTW,g_PnlAUSERREADTEXTH,9999,9999);
          LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
          LStringRect.X := tmpW;
          LStringRect.Y := tmpH;
          LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
          LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
        end;
      end;

      //每个Set标号
      LPaintData := ARet.PnlA.PaintData;
      for I := 0 to Length(LPaintData.BlockArr) - 1 do
      begin
        tmpS := IntToStr(I);
        LFont := TGPFont.Create(TGPFontFamily.Create('Arial'), g_PnlAFontSize-4,[]);
        LGP.DrawString(tmpS,LFont,TGPPointF.Create(g_PnlAUSERREADTEXTW + LPaintData.BlockArr[I].X,g_PnlAUSERREADTEXTH + LPaintData.BlockArr[I].Y),LFontBrush);
      end;

    end;
    3:
    begin
      if (ARet.SheetB = nil) or (ARet.SheetB.GetCellCount = 0) then Exit;

      LPen := TGPPen.Create(TGPColor.Black,g_PenWidth);
      LCapPen := TGPPen.Create(TGPColor.Black,g_PenWidth);
      LCap := TGPAdjustableArrowCap.Create(6, 6, False);
      LCapPen.CustomStartCap := LCap;
      LCapPen.CustomEndCap := LCap;
      LPaintData := APaintdata;
      LGP := TGPGraphics.Create(gDrawEng.FGPPnlBImg);
      LFont := TGPFont.Create(TGPFontFamily.Create('Arial'), g_PnlBFontSize,[]);
      //画PNL的长
      LGP.DrawLine(LPen,g_PnlBUSERREADTEXTW,30,g_PnlBUSERREADTEXTW,g_PnlBUSERREADTEXTH-5);
      LGP.DrawLine(LPen,g_PnlBUSERREADTEXTW+ LPaintData.Reg.W,30,g_PnlBUSERREADTEXTW +
        LPaintData.Reg.W,g_PnlBUSERREADTEXTH-5);
      LGP.DrawLine(LCapPen,g_PnlBUSERREADTEXTW+8,40,g_PnlBUSERREADTEXTW + LPaintData.Reg.W-8,
        40);
      tmpIBlock := ARet.SheetB.Regs[ARet.SheetB.PaintData.BlockArr[0].RegIndex].Colums[ARet.SheetB.PaintData.BlockArr[0].ColumIndex].Rows[ARet.SheetB.PaintData.BlockArr[0].RowIndex];
      if tmpIBlock.Rotate then
      begin
        tmpS := FormatFloat('0.000',ARet.PnlB.W) + '经向';
      end else
      begin
        tmpS := FormatFloat('0.000',ARet.PnlB.W) + '纬向';
      end;
      LStringFormat.FormatFlags := [];
      LStringRect := TGPRectF.Create(g_PnlBUSERREADTEXTW,g_PnlBUSERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := g_PnlBUSERREADTEXTW + (LPaintData.Reg.W - LStringRect.Width) / 2;
      LStringRect.Y := 30;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画PNL高
      LGP.DrawLine(LPen,30,g_PnlBUSERREADTEXTH,g_PnlBUSERREADTEXTW-5,g_PnlBUSERREADTEXTH);
      LGP.DrawLine(LPen,30,g_PnlBUSERREADTEXTH+ LPaintData.Reg.H,g_PnlBUSERREADTEXTW-5,
        g_PnlBUSERREADTEXTH+ LPaintData.Reg.H);
      LGP.DrawLine(LCapPen,40,g_PnlBUSERREADTEXTH+8,40,g_PnlBUSERREADTEXTH+ LPaintData.Reg.H - 8);
      if tmpIBlock.Rotate then
      begin
        tmpS := FormatFloat('0.000',ARet.PnlB.H) + '纬向';
      end else
      begin
        tmpS := FormatFloat('0.000',ARet.PnlB.H) + '经向';
      end;
      LStringFormat.FormatFlags := [StringFormatFlagsDirectionVertical];
      LStringRect := TGPRectF.Create(g_PnlBUSERREADTEXTW,g_PnlBUSERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := 30;
      LStringRect.Y := g_PnlBUSERREADTEXTH + (LPaintData.Reg.H - LStringRect.Height) / 2;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画SET的宽
      LGP.DrawLine(LPen,g_PnlBUSERREADTEXTW + LPaintData.BlockArr[0].X,70,
        g_PnlBUSERREADTEXTW + LPaintData.BlockArr[0].X,g_PnlBUSERREADTEXTH - 5);
      LGP.DrawLine(LPen,g_PnlBUSERREADTEXTW + LPaintData.BlockArr[0].X + LPaintData.BlockArr[0].W,70,
        g_PnlBUSERREADTEXTW + LPaintData.BlockArr[0].X + LPaintData.BlockArr[0].W, g_PnlBUSERREADTEXTH - 5);
      LGP.DrawLine(LPen,g_PnlBUSERREADTEXTW + LPaintData.BlockArr[0].X + 4,70,
        g_PnlBUSERREADTEXTW + LPaintData.BlockArr[0].X + LPaintData.BlockArr[0].W - 4,70);
      tmpRect := LPaintData.BlockArr[0];
      tmpIBlock := ARet.PnlB.Regs[tmpRect.RegIndex].Colums[tmpRect.ColumIndex].Rows[tmpRect.RowIndex];
      if tmpIBlock.Rotate then
      begin
        tmpW := tmpIBlock.H;
        tmpH := tmpIBlock.W;
      end else
      begin
        tmpW := tmpIBlock.W;
        tmpH := tmpIBlock.H;
      end;
      tmpS := FormatFloat('0.000',tmpW);
      LStringFormat.FormatFlags := [];
      LStringRect := TGPRectF.Create(g_PnlBUSERREADTEXTW,g_PnlBUSERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := g_PnlBUSERREADTEXTW + LPaintData.BlockArr[0].X;
      LStringRect.Y := 70- LStringRect.Height;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画SET的高
      LGP.DrawLine(LPen,70,g_PnlBUSERREADTEXTH + LPaintData.BlockArr[0].Y,
        g_PnlBUSERREADTEXTW - 5,g_PnlBUSERREADTEXTH + LPaintData.BlockArr[0].Y);
      LGP.DrawLine(LPen,70,g_PnlBUSERREADTEXTH + LPaintData.BlockArr[0].Y + LPaintData.BlockArr[0].H,
        g_PnlBUSERREADTEXTW - 5, g_PnlBUSERREADTEXTH + LPaintData.BlockArr[0].Y + LPaintData.BlockArr[0].H);
      LGP.DrawLine(LPen,70,g_PnlBUSERREADTEXTH + LPaintData.BlockArr[0].Y + 4,70,
         g_PnlBUSERREADTEXTH + LPaintData.BlockArr[0].Y + LPaintData.BlockArr[0].H -4);
      tmpS := FormatFloat('0.000', tmpH);
      LStringFormat.FormatFlags := [StringFormatFlagsDirectionVertical];
      LStringRect := TGPRectF.Create(g_PnlBUSERREADTEXTW,g_PnlBUSERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := 70 - LStringRect.Width-4;
      LStringRect.Y := g_PnlBUSERREADTEXTH + LPaintData.BlockArr[0].Y +4;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画上下板边
      LBottom := LPaintData.BlockArr[0];
      for I := 0 to Length(LPaintData.BlockArr) - 1 do
      begin
        if LBottom.Y + LBottom.H < LPaintData.BlockArr[I].Y + LPaintData.BlockArr[I].H then
          LBottom := LPaintData.BlockArr[I];
      end;
      if LPaintData.ZKReg.ArrowCB <> 0 then
      begin
        if LBottom.Y + LBottom.H < LPaintData.ZKReg.Y + LPaintData.ZKReg.H then
          LBottom := LPaintData.ZKReg;
      end;

      LGP.DrawLine(LPen,g_PnlBUSERREADTEXTW + LPaintData.Reg.W + 5,
        g_PnlBUSERREADTEXTH + LBottom.Y + LBottom.H,
        g_PnlBUSERREADTEXTW + LPaintData.Reg.W + 30,
        g_PnlBUSERREADTEXTH + LBottom.Y + LBottom.H);
      LGP.DrawLine(LPen,g_PnlBUSERREADTEXTW + LPaintData.Reg.W + 5,
        g_PnlBUSERREADTEXTH + LPaintData.Reg.H,
        g_PnlBUSERREADTEXTW + LPaintData.Reg.W + 30,
        g_PnlBUSERREADTEXTH + LPaintData.Reg.H);
      LGP.DrawLine(LPen,g_PnlBUSERREADTEXTW + LPaintData.Reg.W + 25,
        g_PnlBUSERREADTEXTH + LBottom.Y + LBottom.H,
        g_PnlBUSERREADTEXTW + LPaintData.Reg.W + 25,
        g_PnlBUSERREADTEXTH + LPaintData.Reg.H);
      tmpS := FormatFloat('0.000',ARet.PnlB.PBorderSize^.NowTopBottomW);
      LStringFormat.FormatFlags := [];
      LStringRect := TGPRectF.Create(g_PnlBUSERREADTEXTW,g_PnlBUSERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := g_PnlBUSERREADTEXTW + LPaintData.Reg.W + 30;
      LStringRect.Y := g_PnlBUSERREADTEXTH + LBottom.Y + LBottom.H;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画左右板边
      LRight := LPaintData.BlockArr[0];
      for I := 0 to Length(LPaintData.BlockArr) - 1 do
      begin
        if (LRight.X + LRight.W) < (LPaintData.BlockArr[I].X + LPaintData.BlockArr[I].W) then
          LRight := LPaintData.BlockArr[I];
      end;
      if LPaintData.ZKReg.ArrowCB <> 0 then
      begin
        if LRight.X + LRight.W < LPaintData.ZKReg.X + LPaintData.ZKReg.W then
          LRight := LPaintData.ZKReg;
      end;

      LGP.DrawLine(LPen,g_PnlBUSERREADTEXTW + LRight.X + LRight.W,
        g_PnlBUSERREADTEXTH + LPaintData.Reg.H + 5,
        g_PnlBUSERREADTEXTW + LRight.X + LRight.W,
        g_PnlBUSERREADTEXTH + LPaintData.Reg.H + 30);
      LGP.DrawLine(LPen,g_PnlBUSERREADTEXTW + LPaintData.Reg.W,
        g_PnlBUSERREADTEXTH + LPaintData.Reg.H + 5,
        g_PnlBUSERREADTEXTW + LPaintData.Reg.W,
        g_PnlBUSERREADTEXTH + LPaintData.Reg.H + 30);
      LGP.DrawLine(LPen,g_PnlBUSERREADTEXTW + LRight.X + LRight.W,
        g_PnlBUSERREADTEXTH + LPaintData.Reg.H + 25,
        g_PnlBUSERREADTEXTW + LPaintData.Reg.W,
        g_PnlBUSERREADTEXTH + LPaintData.Reg.H + 25);
      tmpS := FormatFloat('0.000',ARet.PnlB.PBorderSize^.NowLeftRightW);
      LStringFormat.FormatFlags := [];
      LStringRect := TGPRectF.Create(g_PnlBUSERREADTEXTW,g_PnlBUSERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := g_PnlBUSERREADTEXTW + LRight.X + LRight.W;
      LStringRect.Y := g_PnlBUSERREADTEXTH + LPaintData.Reg.H + 30;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画水平间距
      tmpRect := LPaintData.BlockArr[0];
      bHas := False;
      for I := 0 to Length(LPaintData.BlockArr) - 1 do
      begin
        if tmpRect.X < LPaintData.BlockArr[I].X then
        begin
          tmpRect := LPaintData.BlockArr[I];
          bHas := True;
          Break;
        end;
      end;
      if LPaintData.ZKReg.ArrowCB = 2 then
      begin
        if tmpRect.X > LPaintData.ZKReg.X then
          tmpRect := LPaintData.ZKReg;
      end;
      if ARet.CutParam.PnlASetHorzSpace = 0 then
        bHas := False;
      if bHas then
      begin
        LGP.DrawLine(LPen,g_PnlBUSERREADTEXTW + tmpRect.X,80,
          g_PnlBUSERREADTEXTW + tmpRect.X,g_PnlBUSERREADTEXTH - 5);
        LGP.DrawLine(LPen,g_PnlBUSERREADTEXTW + LPaintData.BlockArr[0].X + LPaintData.BlockArr[0].W,80,
          g_PnlBUSERREADTEXTW + tmpRect.X + 30,80);
        tmpS := FormatFloat('0.000',ARet.CutParam.PnlASetHorzSpace);
        LStringFormat.FormatFlags := [];
        LStringRect := TGPRectF.Create(g_PnlBUSERREADTEXTW,g_PnlBUSERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
        LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
        LStringRect.X := g_PnlBUSERREADTEXTW + tmpRect.X + 5;
        LStringRect.Y := 80;
        LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
        LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      end;
      //画垂直间距
      tmpRect := LPaintData.BlockArr[0];
      bHas := False;
      for I := 0 to Length(LPaintData.BlockArr) - 1 do
      begin
        if tmpRect.Y < LPaintData.BlockArr[I].Y then
        begin
          tmpRect := LPaintData.BlockArr[I];
          bHas := True;
          Break;
        end;
      end;
      if LPaintData.ZKReg.ArrowCB = 1 then
      begin
        if tmpRect.Y > LPaintData.ZKReg.Y then
          tmpRect := LPaintData.ZKReg;
      end;
      if ARet.CutParam.PnlASetVertSpace = 0 then
        bHas := False;
      if bHas then
      begin
        LGP.DrawLine(LPen,80,g_PnlBUSERREADTEXTH + tmpRect.Y, g_PnlBUSERREADTEXTW - 5,
          g_PnlBUSERREADTEXTH + tmpRect.Y);
        LGP.DrawLine(LPen,80,g_PnlBUSERREADTEXTH + LPaintData.BlockArr[0].Y + LPaintData.BlockArr[0].H,80,
          g_PnlBUSERREADTEXTH + LPaintData.BlockArr[0].Y + LPaintData.BlockArr[0].H + 30);
        tmpS := FormatFloat('0.000',ARet.CutParam.PnlASetVertSpace);
        LStringFormat.FormatFlags := [StringFormatFlagsDirectionVertical];
        LStringRect := TGPRectF.Create(g_PnlBUSERREADTEXTW,g_PnlBUSERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
        LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
        LStringRect.X := 75;
        LStringRect.Y := g_PnlBUSERREADTEXTH + tmpRect.Y + 5;
        LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
        LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      end;

      //阻抗文字
      if LPaintData.ZKReg.ArrowCB <> 0 then
      begin
        tmpS := '阻抗条:   ';
        LStringFormat.FormatFlags := [];
        LStringRect := TGPRectF.Create(g_PnlBUSERREADTEXTW,g_PnlBUSERREADTEXTH,9999,9999);
        LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
        LStringRect.X := 10;
        LStringRect.Y := gDrawEng.FGPPnlBImg.Height - LStringRect.Height * 2 - 50;
        LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
        LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
        tmpW := LStringRect.X + LStringRect.Width;
        tmpH := LStringRect.Y;
        if LPaintData.ZKReg.RegIndex > 0 then
        begin

          tmpS := FormatFloat('###.###',ARet.CutParam.m6ZKLength) + 'mm X 6mm = ' + IntToStr(LPaintData.ZKReg.RegIndex) + ' 组 ';
          LStringRect := TGPRectF.Create(g_PnlBUSERREADTEXTW,g_PnlBUSERREADTEXTH,9999,9999);
          LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
          LStringRect.X := tmpW;
          LStringRect.Y := tmpH;
          LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
          LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
          tmpH := tmpH + LStringRect.Height + 10;
        end;
        if LPaintData.ZKReg.ColumIndex > 0 then
        begin
          tmpS := FormatFloat('###.###',ARet.CutParam.m3ZKLength) + 'mm X 3mm = ' + IntToStr(LPaintData.ZKReg.ColumIndex) + ' 组 ';
          LStringRect := TGPRectF.Create(g_PnlBUSERREADTEXTW,g_PnlBUSERREADTEXTH,9999,9999);
          LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
          LStringRect.X := tmpW;
          LStringRect.Y := tmpH;
          LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
          LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
        end;
      end;

      //每个Set标号
      LPaintData := ARet.PnlB.PaintData;
      for I := 0 to Length(LPaintData.BlockArr) - 1 do
      begin
        tmpS := IntToStr(I);
        LFont := TGPFont.Create(TGPFontFamily.Create('Arial'), g_pnlBFontSize -4,[]);
        LGP.DrawString(tmpS,LFont,TGPPointF.Create(g_PnlBUSERREADTEXTW + LPaintData.BlockArr[I].X,g_PnlBUSERREADTEXTH + LPaintData.BlockArr[I].Y),LFontBrush);
      end;

    end
  else
    ;
  end;
end;

procedure TDrawEng.PaintIRet(AIndex: Integer; ADest: HDC;ADC_W,ADC_H: Integer; ARet: IRet);
var
  LDesW,LDesH: Integer;
  LDesGPBitMap: IGPBitmap;
  LDesPaintData: TPaintData;
  bCustomImg: Boolean;
  LTmpSheetPaitData: TPaintData;
  I: Integer;
  //LZoom: Double;
  LUserReadW,lUserReadH: Double;
begin
  bCustomImg := False;
  case AIndex of
    0,1:
    begin
      LUserReadW := g_SheetUSERREADTEXTW;
      LUserReadH := g_SheetUSERREADTEXTH;
      LTmpSheetPaitData := aret.SheetA.PaintData;
      LTmpSheetPaitData.Reg.W := ARet.CutParam.SheetW * ARet.SheetA.PaintData.Zoom;
      LTmpSheetPaitData.Reg.H := aret.CutParam.SheetH * ARet.SheetA.PaintData.Zoom;
      if ARet.SheetB <> nil then
      begin
        if ARet.SheetB.GetCellCount <> 0 then
        begin
          for I := 0 to Length(ARet.SheetB.PaintData.BlockArr) - 1 do
          begin
            SetLength(LTmpSheetPaitData.BlockArr,Length(LTmpSheetPaitData.BlockArr)+1);
            LTmpSheetPaitData.BlockArr[High(LTmpSheetPaitData.BlockArr)] := ARet.SheetB.PaintData.BlockArr[I];
            LTmpSheetPaitData.BlockArr[High(LTmpSheetPaitData.BlockArr)].AB := 1;
          end;
        end;
      end;
      LDesPaintData := LTmpSheetPaitData;
      LDesW := Trunc(LDesPaintData.Reg.W + 2* g_SheetUSERREADTEXTW);
      LDesH := Trunc(LDesPaintData.Reg.H + 2* g_SheetUSERREADTEXTH);
      FGPSheetImg := TGPBitmap.Create(LDesW,LDesH);
      LDesGPBitMap := FGPSheetImg;
      if ARet.SheetA.PaintData.CustomImg <> nil then
      begin
        bCustomImg := True;
        LDesGPBitMap := ARet.SheetA.PaintData.CustomImg;
        FGPSheetImg := aret.SheetA.PaintData.CustomImg;
      end;
    end;
    2:
    begin
      LUserReadW := g_PnlAUSERREADTEXTW;
      LUserReadH := g_PnlAUSERREADTEXTH;
      LDesW := Trunc(ARet.PnlA.PaintData.Reg.W + 2*g_PnlAUSERREADTEXTW);
      LDesH := Trunc(ARet.PnlA.PaintData.Reg.H + 2*g_PnlAUSERREADTEXTH);
      FGPPnlAImg := TGPBitmap.Create(LDesW,LDesH);
      LDesGPBitMap := FGPPnlAImg;
      LDesPaintData := ARet.PnlA.PaintData;
      if ARet.PnlA.PaintData.CustomImg <> nil then
      begin
        bCustomImg := True;
        LDesGPBitMap := ARet.PnlA.PaintData.CustomImg;
        FGPPnlAImg := aret.PnlA.PaintData.CustomImg;
      end;
    end;
    3:
    begin
      LUserReadW := g_PnlBUSERREADTEXTW;
      LUserReadH := g_PnlBUSERREADTEXTH;
      LDesW := Trunc(ARet.PnlB.PaintData.Reg.W + 2*g_PnlBUSERREADTEXTW);
      LDesH := Trunc(ARet.PnlB.PaintData.Reg.H + 2*g_PnlBUSERREADTEXTH);
      FGPPnlBImg := TGPBitmap.Create(LDesW,LDesH);
      LDesGPBitMap := FGPPnlBImg;
      LDesPaintData := ARet.PnlB.PaintData;
      if ARet.PnlB.PaintData.CustomImg <> nil then
      begin
        bCustomImg := True;
        LDesGPBitMap := ARet.PnlB.PaintData.CustomImg;
        FGPPnlBImg := aret.PnlB.PaintData.CustomImg;
      end;
    end
  else
    LUserReadW := g_SheetUSERREADTEXTW;
    LUserReadH := g_SheetUSERREADTEXTH;
  end;
  if not bCustomImg then
  begin
    g_PenWidth := (LDesGPBitMap.Width * LDesGPBitMap.Height) / (450*450);
    g_SheetFontSize := (LDesGPBitMap.Width * LDesGPBitMap.Height) / (380*380) * 4;
    g_PnlAFontSize := g_SheetFontSize;
    g_PnlBFontSize := g_SheetFontSize;

    DrawPaintData(LDesGPBitMap,LDesPaintData,LUserReadW,lUserReadH);
    DrawArrowCB(LDesGPBitMap,LDesPaintData,LUserReadW,lUserReadH);
    DrawDWK(LDesGPBitMap,LDesPaintData,LUserReadW,lUserReadH);
    DrawIRetNote(AIndex,ARet, LDesPaintData);
  end;
  StrectDraw(LDesGPBitMap,ADest,ADC_W, ADC_H);
end;



end.
