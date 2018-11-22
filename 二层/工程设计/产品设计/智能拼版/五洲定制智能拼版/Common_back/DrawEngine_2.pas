unit DrawEngine_2;

interface
uses
  IRetIntf, GdiPlusHelpers, GdiPlus, Graphics, SysUtils, Classes, Types, Windows;

const
  USERREADTEXTW = 250;
  USERREADTEXTH = 250;
  SAVEIMAGEW = 640;
  SAVEIMAGEH = 640;
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
  LPen := TGPPen.Create(TGPcolor.CreateFromColorRef(AColor),3);
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
begin
  LGP := TGPGraphics.Create(ABtMap);
  LPen := TGPPen.Create(TGPcolor.CreateFromColorRef(AColor),3);
  //靶标
  if kBB in APaintData.DWK then
  begin
    LGP.DrawEllipse(LPen,CenterX - 15,CenterY + APaintData.Reg.H/3*2 + 15,30,30);
    LGP.DrawEllipse(LPen,CenterX - 10,CenterY+ 5+ APaintData.Reg.H/3*2 + 15,20,20);
    LGP.DrawEllipse(LPen,CenterX + APaintData.Reg.W - 15,CenterY + APaintData.Reg.H/3*2 + 15,30,30);
    LGP.DrawEllipse(LPen,CenterX + APaintData.Reg.W - 10,CenterY+ 5+ APaintData.Reg.H/3*2 + 15,20,20);
    LGP.DrawEllipse(LPen,CenterX + APaintData.Reg.W - 15,CenterY + APaintData.Reg.H/3 -15,30,30);
    LGP.DrawEllipse(LPen,CenterX + APaintData.Reg.W - 10,CenterY+ 5+ APaintData.Reg.H/3 - 15,20,20);
  end;
  //销钉孔
  if kXDK in APaintData.DWK then
  begin
    LGP.DrawEllipse(LPen,CenterX - 15,CenterY + APaintData.Reg.H/2 ,30,30);
    LGP.DrawEllipse(LPen,CenterX - 10,CenterY+ 5+ APaintData.Reg.H/2 ,20,20);
    LGP.DrawEllipse(LPen,CenterX + APaintData.Reg.W - 15,CenterY + APaintData.Reg.H/2 ,30,30);
    LGP.DrawEllipse(LPen,CenterX + APaintData.Reg.W - 10,CenterY+ 5+ APaintData.Reg.H/2 ,20,20);
  end;
  //喷锡挂钩
  if kPXGG in APaintData.DWK then
  begin
    LGP.DrawEllipse(LPen,CenterX - 7,CenterY+ 5+ APaintData.Reg.H/2-25 ,15,15);
    LGP.DrawEllipse(LPen,CenterX + APaintData.Reg.W - 7,CenterY+ 5+ APaintData.Reg.H/2 -25 ,15,15);
  end;
  //校对
  if kJDK in APaintData.DWK then
  begin
    LGP.DrawEllipse(LPen,CenterX - 15,CenterY + (APaintData.Reg.H/2) + 30,30,30);
    LGP.DrawEllipse(LPen,CenterX+ APaintData.Reg.W-15,CenterY+ (APaintData.Reg.H/2)+30,30,30);
    LGP.DrawLine(LPen,CenterX - 15, CenterY + (APaintData.Reg.H/2) + 45 ,
      CenterX + 15, CenterY + (APaintData.Reg.H/2) + 45);

    LGP.DrawLine(LPen,CenterX + APaintData.Reg.W - 15, CenterY + (APaintData.Reg.H/2) + 45 ,
      CenterX + APaintData.Reg.W + 15, CenterY + (APaintData.Reg.H/2) + 45);
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
begin
  LGP := TGPGraphics.Create(ABtMap);
  LPen := TGPPen.Create(TGPcolor.CreateFromColorRef(AColor),3);
  for I := 0 to Length(APaintData.BlockArr) - 1 do
  begin
    LBlockRect := ExtractGPRectF(APaintData.BlockArr[I],CenterX,CenterY);
    case APaintData.BlockArr[I].ArrowCB of
      0:;
      1://上
      begin
        LPt1.X := LBlockRect.X + LBlockRect.Width / 3;
        LPt1.Y := LBlockRect.Y + LBlockRect.Height /5 * 4;
        LPt2.X := LPt1.X;
        LPt2.Y := LBlockRect.Y + LBlockRect.Height /5;
        LGP.DrawLine(LPen,LPt1,LPt2);
        LPt1.X := LBlockRect.X + LBlockRect.Width / 2;
        LPt1.Y := LBlockRect.Y + LBlockRect.Height /5 * 2;
        LGP.DrawLine(LPen,LPt1,LPt2);
      end;
      2:
      begin
        LPt1.X := LBlockRect.X + LBlockRect.Width / 3 * 2;
        LPt1.Y := LBlockRect.Y + LBlockRect.Height /5 * 4;
        LPt2.X := LPt1.X;
        LPt2.Y := LBlockRect.Y + LBlockRect.Height /5;
        LGP.DrawLine(LPen,LPt1,LPt2);
        LPt1.X := LBlockRect.X + LBlockRect.Width / 2;
        LPt1.Y := LBlockRect.Y + LBlockRect.Height /5 * 2;
        LGP.DrawLine(LPen,LPt1,LPt2);
      end;
      3://
      begin
        LPt1.X := LBlockRect.X + LBlockRect.Width / 3 * 2;
        LPt1.Y := LBlockRect.Y + LBlockRect.Height /5 * 4;
        LPt2.X := LPt1.X;
        LPt2.Y := LBlockRect.Y + LBlockRect.Height /5;
        LGP.DrawLine(LPen,LPt1,LPt2);
        LPt2.X := LBlockRect.X + LBlockRect.Width / 2;
        LPt2.Y := LBlockRect.Y + LBlockRect.Height /5 * 3;
        LGP.DrawLine(LPen,LPt1,LPt2);
      end;
      4://下
      begin
        LPt1.X := LBlockRect.X + LBlockRect.Width / 3;
        LPt1.Y := LBlockRect.Y + LBlockRect.Height /5 * 4;
        LPt2.X := LPt1.X;
        LPt2.Y := LBlockRect.Y + LBlockRect.Height /5;
        LGP.DrawLine(LPen,LPt1,LPt2);
        LPt2.X := LBlockRect.X + LBlockRect.Width / 2;
        LPt2.Y := LBlockRect.Y + LBlockRect.Height /5 * 3;
        LGP.DrawLine(LPen,LPt1,LPt2);
      end;
      5:
      begin
        LPt1.X := LBlockRect.X + LBlockRect.Width / 5;
        LPt1.Y := LBlockRect.Y + LBlockRect.Height / 3;
        LPt2.X := LBlockRect.X + LBlockRect.Width / 5 * 4;
        LPt2.Y := LPt1.Y;
        LGP.DrawLine(LPen,LPt1,LPt2);
        LPt1.X := LBlockRect.X + LBlockRect.Width / 5 * 3;
        LPt1.Y := LBlockRect.Y + LBlockRect.Height / 2;
        LGP.DrawLine(LPen,LPt1,LPt2);
      end;
      6://右
      begin
        LPt1.X := LBlockRect.X + LBlockRect.Width / 5;
        LPt1.Y := LBlockRect.Y + LBlockRect.Height / 3 * 2;
        LPt2.X := LBlockRect.X + LBlockRect.Width / 5 * 4;
        LPt2.Y := LPt1.Y;
        LGP.DrawLine(LPen,LPt1,LPt2);
        LPt1.X := LBlockRect.X + LBlockRect.Width / 5 * 3;
        LPt1.Y := LBlockRect.Y + LBlockRect.Height / 2;
        LGP.DrawLine(LPen,LPt1,LPt2);
      end;
      7://左
      begin
        LPt1.X := LBlockRect.X + LBlockRect.Width / 5;
        LPt1.Y := LBlockRect.Y + LBlockRect.Height / 3 * 2;
        LPt2.X := LBlockRect.X + LBlockRect.Width / 5 * 4;
        LPt2.Y := LPt1.Y;
        LGP.DrawLine(LPen,LPt1,LPt2);
        LPt2.X := LBlockRect.X + LBlockRect.Width / 5 * 2;
        LPt2.Y := LBlockRect.Y + LBlockRect.Height / 2;
        LGP.DrawLine(LPen,LPt1,LPt2);
      end;
      8:
      begin
        LPt1.X := LBlockRect.X + LBlockRect.Width / 5;
        LPt1.Y := LBlockRect.Y + LBlockRect.Height / 3;
        LPt2.X := LBlockRect.X + LBlockRect.Width / 5 * 4;
        LPt2.Y := LPt1.Y;
        LGP.DrawLine(LPen,LPt1,LPt2);
        LPt2.X := LBlockRect.X + LBlockRect.Width / 5 * 2;
        LPt2.Y := LBlockRect.Y + LBlockRect.Height / 2;
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
      LPen := TGPPen.Create(TGPColor.Black,3);
      LCapPen := TGPPen.Create(TGPColor.Black,3);
      LCap := TGPAdjustableArrowCap.Create(6, 6, False);
      LCapPen.CustomStartCap := LCap;
      LCapPen.CustomEndCap := LCap;
      LFont := TGPFont.Create(TGPFontFamily.Create('Arial'), 38,[FontStyleBold]);
      LPaintData := APaintdata;//ARet.SheetA.PaintData;
      LGP := TGPGraphics.Create(gDrawEng.FGPSheetImg);
      //画大料的长
      LGP.DrawLine(LPen,USERREADTEXTW,0,USERREADTEXTW,USERREADTEXTH-10);
      LGP.DrawLine(LPen,USERREADTEXTW+ LPaintData.Reg.W,0,USERREADTEXTW +
        LPaintData.Reg.W,USERREADTEXTH-10);
      LGP.DrawLine(LCapPen,USERREADTEXTW+8,50,USERREADTEXTW + LPaintData.Reg.W-8,
        50);
      tmpS := FormatFloat('0.000',ARet.CutParam.SheetW) + '纬向';
      LStringFormat.FormatFlags := [];
      LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := USERREADTEXTW + (LPaintData.Reg.W - LStringRect.Width) / 2;
      LStringRect.Y := 25;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画大料的高
      LGP.DrawLine(LPen,0,USERREADTEXTH,USERREADTEXTW-10,USERREADTEXTH);
      LGP.DrawLine(LPen,0,USERREADTEXTH+ LPaintData.Reg.H,USERREADTEXTW-10,
        USERREADTEXTH+ LPaintData.Reg.H);
      LGP.DrawLine(LCapPen,50,USERREADTEXTH+8,50,USERREADTEXTH+ LPaintData.Reg.H - 8);
      tmpS := FormatFloat('0.000',ARet.CutParam.SheetH) + '经向';
      LStringFormat.FormatFlags := [StringFormatFlagsDirectionVertical];
      LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := 5;
      LStringRect.Y := USERREADTEXTH + (LPaintData.Reg.H - LStringRect.Height) / 2;
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
      LGP.DrawLine(LPen,USERREADTEXTW+ LPaintData.BlockArr[0].W,150,USERREADTEXTW +
        LPaintData.BlockArr[0].W,USERREADTEXTH - 10);
      LGP.DrawLine(LCapPen,USERREADTEXTW + 8,150,USERREADTEXTW+ LPaintData.BlockArr[0].W -8,
        150);
      tmpS := FormatFloat('0.000', tmpW);
      LStringFormat.FormatFlags := [];
      LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := USERREADTEXTW + (LPaintData.BlockArr[0].W - LStringRect.Width) / 2;
      LStringRect.Y := 125;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画PNLA的高
      LGP.DrawLine(LPen,150,USERREADTEXTH + LPaintData.BlockArr[0].H,USERREADTEXTW - 10,
        USERREADTEXTH + LPaintData.BlockArr[0].H);
      LGP.DrawLine(LCapPen,150,USERREADTEXTH + 10,150,USERREADTEXTH + LPaintData.BlockArr[0].H - 10);
      tmpS := FormatFloat('0.000',tmpH);
      LStringFormat.FormatFlags := [StringFormatFlagsDirectionVertical];
      LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := 110;
      LStringRect.Y := USERREADTEXTH + (LPaintData.BlockArr[0].H - LStringRect.Height) / 2;
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
          LGP.DrawLine(LPen,USERREADTEXTW+ LPaintData.BlockArr[0].W,USERREADTEXTH+ ARet.CutParam.SheetH + 80,USERREADTEXTW +
            LPaintData.BlockArr[0].W, USERREADTEXTH + ARet.CutParam.SheetH + 10);
          LGP.DrawLine(LPen,USERREADTEXTW,USERREADTEXTH+ ARet.CutParam.SheetH + 80,USERREADTEXTW
            , USERREADTEXTH + ARet.CutParam.SheetH + 10);
          LGP.DrawLine(LCapPen,USERREADTEXTW + 8,USERREADTEXTH + aret.CutParam.SheetH + 70,USERREADTEXTW+ LPaintData.BlockArr[0].W -8,
           USERREADTEXTH+  aret.CutParam.SheetH + 70);
          tmpS := FormatFloat('0.000', tmpW);
          LStringFormat.FormatFlags := [];
          LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,ARet.CutParam.SheetW,ARet.CutParam.SheetH);
          LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
          LStringRect.X := USERREADTEXTW + (LPaintData.BlockArr[0].W - LStringRect.Width) / 2;
          LStringRect.Y := USERREADTEXTH + ARet.CutParam.SheetH + 40;
          LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
          LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
          //画PNL的高
          LGP.DrawLine(LPen,USERREADTEXTW - 80,USERREADTEXTH + ARet.SheetA.H + LPaintData.BlockArr[0].H,USERREADTEXTW - 10,
            USERREADTEXTH + ARet.SheetA.H + LPaintData.BlockArr[0].H);
          LGP.DrawLine(LPen,USERREADTEXTW - 80,USERREADTEXTH + ARet.SheetA.H,USERREADTEXTW - 10,
            USERREADTEXTH + ARet.SheetA.H);
          LGP.DrawLine(LCapPen,USERREADTEXTW - 80,USERREADTEXTH + ARet.SheetA.H + 10,USERREADTEXTW - 80,USERREADTEXTH + LPaintData.BlockArr[0].H + ARet.SheetA.H - 10);
          tmpS := FormatFloat('0.000',tmpH);
          LStringFormat.FormatFlags := [StringFormatFlagsDirectionVertical];
          LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,ARet.CutParam.SheetW,ARet.CutParam.SheetH);
          LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
          LStringRect.X := USERREADTEXTW - 120;
          LStringRect.Y := USERREADTEXTH + ARet.SheetA.H + (LPaintData.BlockArr[0].H - LStringRect.Height) / 2;
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
          LGP.DrawLine(LPen,USERREADTEXTW+ LPaintData.BlockArr[0].W + ARet.SheetA.W,150,USERREADTEXTW +
            LPaintData.BlockArr[0].W + ARet.SheetA.W,USERREADTEXTH - 10);
          LGP.DrawLine(LPen,USERREADTEXTW + ARet.SheetA.W,150,USERREADTEXTW +
              ARet.SheetA.W,USERREADTEXTH - 10);
          LGP.DrawLine(LCapPen,USERREADTEXTW+ ARet.SheetA.W + 8,150,USERREADTEXTW+ LPaintData.BlockArr[0].W+ ARet.SheetA.W -8,
            150);
          tmpS := FormatFloat('0.000', tmpW);
          LStringFormat.FormatFlags := [];
          LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,ARet.CutParam.SheetW,ARet.CutParam.SheetH);
          LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
          LStringRect.X := USERREADTEXTW + ARet.SheetA.W + (LPaintData.BlockArr[0].W - LStringRect.Width) / 2;
          LStringRect.Y := 125;
          LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
          LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
          //画PNL的高
          LGP.DrawLine(LPen,USERREADTEXTW + ARet.CutParam.SheetW + 10,USERREADTEXTH + LPaintData.BlockArr[0].H,USERREADTEXTW + ARet.CutParam.SheetW + 120,
            USERREADTEXTH + LPaintData.BlockArr[0].H);
          LGP.DrawLine(LPen,USERREADTEXTW + ARet.CutParam.SheetW + 10,USERREADTEXTH ,USERREADTEXTW + ARet.CutParam.SheetW + 120,
            USERREADTEXTH);
          LGP.DrawLine(LCapPen,USERREADTEXTW + ARet.CutParam.SheetW + 120,USERREADTEXTH + 10,USERREADTEXTW + ARet.CutParam.SheetW + 120,USERREADTEXTH + LPaintData.BlockArr[0].H - 10);
          tmpS := FormatFloat('0.000',tmpH);
          LStringFormat.FormatFlags := [StringFormatFlagsDirectionVertical];
          LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,ARet.CutParam.SheetW,ARet.CutParam.SheetH);
          LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
          LStringRect.X := USERREADTEXTW + ARet.CutParam.SheetW + 70;
          LStringRect.Y := USERREADTEXTH + (LPaintData.BlockArr[0].H - LStringRect.Height) / 2;
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
      LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,9999,9999);
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
        LGP.DrawString(tmpS,LFont,ExtractGPRectF(APaintData.BlockArr[I],USERREADTEXTW,USERREADTEXTH),LStringFormat,LFontBrush);
      end;

    end;
    2:
    begin
      LPen := TGPPen.Create(TGPColor.Black,2);
      LCapPen := TGPPen.Create(TGPColor.Black,2);
      LCap := TGPAdjustableArrowCap.Create(5, 5, False);
      LCapPen.CustomStartCap := LCap;
      LCapPen.CustomEndCap := LCap;
      LPaintData := APaintdata;
      LGP := TGPGraphics.Create(gDrawEng.FGPPnlAImg);
      LFont := TGPFont.Create(TGPFontFamily.Create('Arial'), 24,[FontStyleBold]);
      //画PNL的长
      LGP.DrawLine(LPen,USERREADTEXTW,0,USERREADTEXTW,USERREADTEXTH-10);
      LGP.DrawLine(LPen,USERREADTEXTW+ LPaintData.Reg.W,0,USERREADTEXTW +
        LPaintData.Reg.W,USERREADTEXTH-10);
      LGP.DrawLine(LCapPen,USERREADTEXTW+8,20,USERREADTEXTW + LPaintData.Reg.W-8,
        20);
      tmpIBlock := ARet.SheetA.Regs[ARet.SheetA.PaintData.BlockArr[0].RegIndex].Colums[ARet.SheetA.PaintData.BlockArr[0].ColumIndex].Rows[ARet.SheetA.PaintData.BlockArr[0].RowIndex];
      if tmpIBlock.Rotate then
      begin
        tmpS := FormatFloat('0.000',ARet.PnlA.W) + '经向';
      end else
      begin
        tmpS := FormatFloat('0.000',ARet.PnlA.W) + '纬向';
      end;
      LStringFormat.FormatFlags := [];
      LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := USERREADTEXTW + (LPaintData.Reg.W - LStringRect.Width) / 2;
      LStringRect.Y := 5;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画PNL高
      LGP.DrawLine(LPen,0,USERREADTEXTH,USERREADTEXTW-10,USERREADTEXTH);
      LGP.DrawLine(LPen,0,USERREADTEXTH+ LPaintData.Reg.H,USERREADTEXTW-10,
        USERREADTEXTH+ LPaintData.Reg.H);
      LGP.DrawLine(LCapPen,20,USERREADTEXTH+8,20,USERREADTEXTH+ LPaintData.Reg.H - 8);
      if tmpIBlock.Rotate then
      begin
        tmpS := FormatFloat('0.000',ARet.PnlA.H) + '纬向';
      end else
      begin
        tmpS := FormatFloat('0.000',ARet.PnlA.H) + '经向';
      end;
      LStringFormat.FormatFlags := [StringFormatFlagsDirectionVertical];
      LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := 0;
      LStringRect.Y := USERREADTEXTH + (LPaintData.Reg.H - LStringRect.Height) / 2;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画SET的宽
      LGP.DrawLine(LPen,USERREADTEXTW + LPaintData.BlockArr[0].X,110,
        USERREADTEXTW + LPaintData.BlockArr[0].X,USERREADTEXTH - 8);
      LGP.DrawLine(LPen,USERREADTEXTW + LPaintData.BlockArr[0].X + LPaintData.BlockArr[0].W,110,
        USERREADTEXTW + LPaintData.BlockArr[0].X + LPaintData.BlockArr[0].W, USERREADTEXTH - 8);
      LGP.DrawLine(LPen,USERREADTEXTW + LPaintData.BlockArr[0].X + 4,120,
        USERREADTEXTW + LPaintData.BlockArr[0].X + LPaintData.BlockArr[0].W - 4,120);
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
      LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := USERREADTEXTW + LPaintData.BlockArr[0].X;
      LStringRect.Y := 110- LStringRect.Height;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画SET的高
      LGP.DrawLine(LPen,110,USERREADTEXTH + LPaintData.BlockArr[0].Y,
        USERREADTEXTW - 8,USERREADTEXTH + LPaintData.BlockArr[0].Y);
      LGP.DrawLine(LPen,110,USERREADTEXTH + LPaintData.BlockArr[0].Y + LPaintData.BlockArr[0].H,
        USERREADTEXTW - 8, USERREADTEXTH + LPaintData.BlockArr[0].Y + LPaintData.BlockArr[0].H);
      LGP.DrawLine(LPen,120,USERREADTEXTH + LPaintData.BlockArr[0].Y + 4,120,
         USERREADTEXTH + LPaintData.BlockArr[0].Y + LPaintData.BlockArr[0].H -4);
      tmpS := FormatFloat('0.000', tmpH);
      LStringFormat.FormatFlags := [StringFormatFlagsDirectionVertical];
      LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := 120 - LStringRect.Width-4;
      LStringRect.Y := USERREADTEXTH + LPaintData.BlockArr[0].Y +4;
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

      LGP.DrawLine(LPen,USERREADTEXTW + LPaintData.Reg.W,
        USERREADTEXTH + LBottom.Y + LBottom.H,
        USERREADTEXTW + LPaintData.Reg.W + 50,
        USERREADTEXTH + LBottom.Y + LBottom.H);
      LGP.DrawLine(LPen,USERREADTEXTW + LPaintData.Reg.W,
        USERREADTEXTH + LPaintData.Reg.H,
        USERREADTEXTW + LPaintData.Reg.W + 50,
        USERREADTEXTH + LPaintData.Reg.H);
      LGP.DrawLine(LPen,USERREADTEXTW + LPaintData.Reg.W + 35,
        USERREADTEXTH + LBottom.Y + LBottom.H,
        USERREADTEXTW + LPaintData.Reg.W + 35,
        USERREADTEXTH + LPaintData.Reg.H);
      tmpS := FormatFloat('0.000',ARet.PnlA.PBorderSize^.NowTopBottomW);
      LStringFormat.FormatFlags := [];
      LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := USERREADTEXTW + LPaintData.Reg.W + 50;
      LStringRect.Y := USERREADTEXTH + LBottom.Y + LBottom.H;
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

      LGP.DrawLine(LPen,USERREADTEXTW + LRight.X + LRight.W,
        USERREADTEXTH + LPaintData.Reg.H,
        USERREADTEXTW + LRight.X + LRight.W,
        USERREADTEXTH + LPaintData.Reg.H + 50);
      LGP.DrawLine(LPen,USERREADTEXTW + LPaintData.Reg.W,
        USERREADTEXTH + LPaintData.Reg.H,
        USERREADTEXTW + LPaintData.Reg.W,
        USERREADTEXTH + LPaintData.Reg.H + 50);
      LGP.DrawLine(LPen,USERREADTEXTW + LRight.X + LRight.W,
        USERREADTEXTH + LPaintData.Reg.H + 35,
        USERREADTEXTW + LPaintData.Reg.W,
        USERREADTEXTH + LPaintData.Reg.H + 35);
      tmpS := FormatFloat('0.000',ARet.PnlA.PBorderSize^.NowLeftRightW);
      LStringFormat.FormatFlags := [];
      LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := USERREADTEXTW + LRight.X + LRight.W;
      LStringRect.Y := USERREADTEXTH + LPaintData.Reg.H + 55;
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
        LGP.DrawLine(LPen,USERREADTEXTW + tmpRect.X,195,
          USERREADTEXTW + tmpRect.X,USERREADTEXTH - 8);
        LGP.DrawLine(LPen,USERREADTEXTW + LPaintData.BlockArr[0].X + LPaintData.BlockArr[0].W,200,
          USERREADTEXTW + tmpRect.X + 50,200);
        tmpS := FormatFloat('0.000',ARet.CutParam.PnlASetHorzSpace);
        LStringFormat.FormatFlags := [];
        LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
        LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
        LStringRect.X := USERREADTEXTW + tmpRect.X + 5;
        LStringRect.Y := 208;
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
        LGP.DrawLine(LPen,180,USERREADTEXTH + tmpRect.Y, USERREADTEXTW - 8,
          USERREADTEXTH + tmpRect.Y);
        LGP.DrawLine(LPen,190,USERREADTEXTH + LPaintData.BlockArr[0].Y + LPaintData.BlockArr[0].H,190,
          USERREADTEXTH + LPaintData.BlockArr[0].Y + LPaintData.BlockArr[0].H + 50);
        tmpS := FormatFloat('0.000',ARet.CutParam.PnlASetVertSpace);
        LStringFormat.FormatFlags := [StringFormatFlagsDirectionVertical];
        LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
        LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
        LStringRect.X := 195;
        LStringRect.Y := USERREADTEXTH + tmpRect.Y + 8;
        LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
        LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      end;

      //阻抗文字
      if LPaintData.ZKReg.ArrowCB <> 0 then
      begin
        tmpS := '阻抗条:   ';
        LStringFormat.FormatFlags := [];
        LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,9999,9999);
        LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
        LStringRect.X := 10;
        LStringRect.Y := gDrawEng.FGPPnlAImg.Height - LStringRect.Height * 2 - 30;
        LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
        LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
        tmpW := LStringRect.X + LStringRect.Width;
        tmpH := LStringRect.Y;
        if LPaintData.ZKReg.RegIndex > 0 then
        begin

          tmpS := FormatFloat('###.###',ARet.CutParam.m6ZKLength) + 'mm X 6mm = ' + IntToStr(LPaintData.ZKReg.RegIndex) + ' 组 ';
          LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,9999,9999);
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
          LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,9999,9999);
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
        LFont := TGPFont.Create(TGPFontFamily.Create('Arial'), 18,[]);
        LGP.DrawString(tmpS,LFont,TGPPointF.Create(USERREADTEXTW + LPaintData.BlockArr[I].X,USERREADTEXTH + LPaintData.BlockArr[I].Y),LFontBrush);
      end;

    end;
    3:
    begin
      if (ARet.SheetB = nil) or (ARet.SheetB.GetCellCount = 0) then Exit;

      LPen := TGPPen.Create(TGPColor.Black,2);
      LCapPen := TGPPen.Create(TGPColor.Black,2);
      LCap := TGPAdjustableArrowCap.Create(5, 5, False);
      LCapPen.CustomStartCap := LCap;
      LCapPen.CustomEndCap := LCap;
      LPaintData := APaintdata;
      LGP := TGPGraphics.Create(gDrawEng.FGPPnlBImg);
      LFont := TGPFont.Create(TGPFontFamily.Create('Arial'), 24,[FontStyleBold]);
      //画PNL的长
      LGP.DrawLine(LPen,USERREADTEXTW,0,USERREADTEXTW,USERREADTEXTH-10);
      LGP.DrawLine(LPen,USERREADTEXTW+ LPaintData.Reg.W,0,USERREADTEXTW +
        LPaintData.Reg.W,USERREADTEXTH-10);
      LGP.DrawLine(LCapPen,USERREADTEXTW+8,20,USERREADTEXTW + LPaintData.Reg.W-8,
        20);
      tmpIBlock := ARet.SheetB.Regs[ARet.SheetB.PaintData.BlockArr[0].RegIndex].Colums[ARet.SheetB.PaintData.BlockArr[0].ColumIndex].Rows[ARet.SheetB.PaintData.BlockArr[0].RowIndex];
      if tmpIBlock.Rotate then
      begin
        tmpS := FormatFloat('0.000',ARet.PnlB.W) + '经向';
      end else
      begin
        tmpS := FormatFloat('0.000',ARet.PnlB.W) + '纬向';
      end;
      LStringFormat.FormatFlags := [];
      LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := USERREADTEXTW + (LPaintData.Reg.W - LStringRect.Width) / 2;
      LStringRect.Y := 5;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画PNL高
      LGP.DrawLine(LPen,0,USERREADTEXTH,USERREADTEXTW-10,USERREADTEXTH);
      LGP.DrawLine(LPen,0,USERREADTEXTH+ LPaintData.Reg.H,USERREADTEXTW-10,
        USERREADTEXTH+ LPaintData.Reg.H);
      LGP.DrawLine(LCapPen,20,USERREADTEXTH+8,20,USERREADTEXTH+ LPaintData.Reg.H - 8);
      if tmpIBlock.Rotate then
      begin
        tmpS := FormatFloat('0.000',ARet.PnlB.H) + '纬向';
      end else
      begin
        tmpS := FormatFloat('0.000',ARet.PnlB.H) + '经向';
      end;
      LStringFormat.FormatFlags := [StringFormatFlagsDirectionVertical];
      LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := 0;
      LStringRect.Y := USERREADTEXTH + (LPaintData.Reg.H - LStringRect.Height) / 2;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画SET的宽
      LGP.DrawLine(LPen,USERREADTEXTW + LPaintData.BlockArr[0].X,110,
        USERREADTEXTW + LPaintData.BlockArr[0].X,USERREADTEXTH - 8);
      LGP.DrawLine(LPen,USERREADTEXTW + LPaintData.BlockArr[0].X + LPaintData.BlockArr[0].W,110,
        USERREADTEXTW + LPaintData.BlockArr[0].X + LPaintData.BlockArr[0].W, USERREADTEXTH - 8);
      LGP.DrawLine(LPen,USERREADTEXTW + LPaintData.BlockArr[0].X + 4,120,
        USERREADTEXTW + LPaintData.BlockArr[0].X + LPaintData.BlockArr[0].W - 4,120);
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
      LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := USERREADTEXTW + LPaintData.BlockArr[0].X;
      LStringRect.Y := 110- LStringRect.Height;
      LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
      LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      //画SET的高
      LGP.DrawLine(LPen,110,USERREADTEXTH + LPaintData.BlockArr[0].Y,
        USERREADTEXTW - 8,USERREADTEXTH + LPaintData.BlockArr[0].Y);
      LGP.DrawLine(LPen,110,USERREADTEXTH + LPaintData.BlockArr[0].Y + LPaintData.BlockArr[0].H,
        USERREADTEXTW - 8, USERREADTEXTH + LPaintData.BlockArr[0].Y + LPaintData.BlockArr[0].H);
      LGP.DrawLine(LPen,120,USERREADTEXTH + LPaintData.BlockArr[0].Y + 4,120,
         USERREADTEXTH + LPaintData.BlockArr[0].Y + LPaintData.BlockArr[0].H -4);
      tmpS := FormatFloat('0.000', tmpH);
      LStringFormat.FormatFlags := [StringFormatFlagsDirectionVertical];
      LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := 120 - LStringRect.Width-4;
      LStringRect.Y := USERREADTEXTH + LPaintData.BlockArr[0].Y +4;
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

      LGP.DrawLine(LPen,USERREADTEXTW + LPaintData.Reg.W,
        USERREADTEXTH + LBottom.Y + LBottom.H,
        USERREADTEXTW + LPaintData.Reg.W + 50,
        USERREADTEXTH + LBottom.Y + LBottom.H);
      LGP.DrawLine(LPen,USERREADTEXTW + LPaintData.Reg.W,
        USERREADTEXTH + LPaintData.Reg.H,
        USERREADTEXTW + LPaintData.Reg.W + 50,
        USERREADTEXTH + LPaintData.Reg.H);
      LGP.DrawLine(LPen,USERREADTEXTW + LPaintData.Reg.W + 35,
        USERREADTEXTH + LBottom.Y + LBottom.H,
        USERREADTEXTW + LPaintData.Reg.W + 35,
        USERREADTEXTH + LPaintData.Reg.H);
      tmpS := FormatFloat('0.000',ARet.PnlB.PBorderSize^.NowTopBottomW);
      LStringFormat.FormatFlags := [];
      LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := USERREADTEXTW + LPaintData.Reg.W + 50;
      LStringRect.Y := USERREADTEXTH + LBottom.Y + LBottom.H;
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

      LGP.DrawLine(LPen,USERREADTEXTW + LRight.X + LRight.W,
        USERREADTEXTH + LPaintData.Reg.H,
        USERREADTEXTW + LRight.X + LRight.W,
        USERREADTEXTH + LPaintData.Reg.H + 50);
      LGP.DrawLine(LPen,USERREADTEXTW + LPaintData.Reg.W,
        USERREADTEXTH + LPaintData.Reg.H,
        USERREADTEXTW + LPaintData.Reg.W,
        USERREADTEXTH + LPaintData.Reg.H + 50);
      LGP.DrawLine(LPen,USERREADTEXTW + LRight.X + LRight.W,
        USERREADTEXTH + LPaintData.Reg.H + 35,
        USERREADTEXTW + LPaintData.Reg.W,
        USERREADTEXTH + LPaintData.Reg.H + 35);
      tmpS := FormatFloat('0.000',ARet.PnlB.PBorderSize^.NowLeftRightW);
      LStringFormat.FormatFlags := [];
      LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
      LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
      LStringRect.X := USERREADTEXTW + LRight.X + LRight.W;
      LStringRect.Y := USERREADTEXTH + LPaintData.Reg.H + 55;
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
        LGP.DrawLine(LPen,USERREADTEXTW + tmpRect.X,195,
          USERREADTEXTW + tmpRect.X,USERREADTEXTH - 8);
        LGP.DrawLine(LPen,USERREADTEXTW + LPaintData.BlockArr[0].X + LPaintData.BlockArr[0].W,200,
          USERREADTEXTW + tmpRect.X + 50,200);
        tmpS := FormatFloat('0.000',ARet.CutParam.PnlASetHorzSpace);
        LStringFormat.FormatFlags := [];
        LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
        LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
        LStringRect.X := USERREADTEXTW + tmpRect.X + 5;
        LStringRect.Y := 208;
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
        LGP.DrawLine(LPen,180,USERREADTEXTH + tmpRect.Y, USERREADTEXTW - 8,
          USERREADTEXTH + tmpRect.Y);
        LGP.DrawLine(LPen,190,USERREADTEXTH + LPaintData.BlockArr[0].Y + LPaintData.BlockArr[0].H,190,
          USERREADTEXTH + LPaintData.BlockArr[0].Y + LPaintData.BlockArr[0].H + 50);
        tmpS := FormatFloat('0.000',ARet.CutParam.PnlASetVertSpace);
        LStringFormat.FormatFlags := [StringFormatFlagsDirectionVertical];
        LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,LPaintData.Reg.W,LPaintData.Reg.H);
        LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
        LStringRect.X := 195;
        LStringRect.Y := USERREADTEXTH + tmpRect.Y + 8;
        LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
        LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
      end;

      //阻抗文字
      if LPaintData.ZKReg.ArrowCB <> 0 then
      begin
        tmpS := '阻抗条:   ';
        LStringFormat.FormatFlags := [];
        LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,9999,9999);
        LStringRect := LGP.MeasureString(tmpS,LFont,LStringRect,LStringFormat);
        LStringRect.X := 10;
        LStringRect.Y := gDrawEng.FGPPnlBImg.Height - LStringRect.Height * 2 - 30;
        LGP.FillRectangle(TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR)),LStringRect);
        LGP.DrawString(tmpS,LFont,LStringRect,LStringFormat,LFontBrush);
        tmpW := LStringRect.X + LStringRect.Width;
        tmpH := LStringRect.Y;
        if LPaintData.ZKReg.RegIndex > 0 then
        begin

          tmpS := FormatFloat('###.###',ARet.CutParam.m6ZKLength) + 'mm X 6mm = ' + IntToStr(LPaintData.ZKReg.RegIndex) + ' 组 ';
          LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,9999,9999);
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
          LStringRect := TGPRectF.Create(USERREADTEXTW,USERREADTEXTH,9999,9999);
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
        LFont := TGPFont.Create(TGPFontFamily.Create('Arial'), 18,[]);
        LGP.DrawString(tmpS,LFont,TGPPointF.Create(USERREADTEXTW + LPaintData.BlockArr[I].X,USERREADTEXTH + LPaintData.BlockArr[I].Y),LFontBrush);
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
  LZoom: Double;
begin
  bCustomImg := False;
  case AIndex of
    0,1:
    begin
      LDesW := Trunc(ARet.CutParam.SheetW + 2*USERREADTEXTW);
      LDesH := Trunc(ARet.CutParam.SheetH + 2*USERREADTEXTH);
      FGPSheetImg := TGPBitmap.Create(LDesW,LDesH);
      LDesGPBitMap := FGPSheetImg;
      LTmpSheetPaitData := aret.SheetA.PaintData;
      //LZoom := g_MapSize / MaxValue([ARet.CutParam.SheetW,ARet.CutParam.SheetH]);

      LTmpSheetPaitData.Reg.W := ARet.CutParam.SheetW;
      LTmpSheetPaitData.Reg.H := ARet.CutParam.SheetH;
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
      if ARet.SheetA.PaintData.CustomImg <> nil then
      begin
        bCustomImg := True;
        LDesGPBitMap := ARet.SheetA.PaintData.CustomImg;
        FGPSheetImg := aret.SheetA.PaintData.CustomImg;
      end;
    end;
    2:
    begin
      LDesW := Trunc(ARet.PnlA.PaintData.Reg.W + 2*USERREADTEXTW);
      LDesH := Trunc(ARet.PnlA.PaintData.Reg.H + 2*USERREADTEXTH);
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
      LDesW := Trunc(ARet.PnlB.PaintData.Reg.W + 2*USERREADTEXTW);
      LDesH := Trunc(ARet.PnlB.PaintData.Reg.H + 2*USERREADTEXTH);
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

  end;
  if not bCustomImg then
  begin
    DrawPaintData(LDesGPBitMap,LDesPaintData,USERREADTEXTW,USERREADTEXTH);
    DrawArrowCB(LDesGPBitMap,LDesPaintData,USERREADTEXTW,USERREADTEXTH);
    DrawDWK(LDesGPBitMap,LDesPaintData,USERREADTEXTW,USERREADTEXTH);
    DrawIRetNote(AIndex,ARet, LDesPaintData);
  end;
  StrectDraw(LDesGPBitMap,ADest,ADC_W, ADC_H);
end;



end.
