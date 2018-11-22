unit EditFrm;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ImgList,
  ComCtrls, Generics.Collections, Generics.Defaults, StructDef, Menus;

type
  TfrmEdit = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pbEdit: TPaintBox;
    cpnl1: TCategoryPanelGroup;
    cpnl2: TCategoryPanel;
    cpnl3: TCategoryPanel;
    cpnl4: TCategoryPanel;
    edtBorderTopBottom: TEdit;
    edtBorderLeftRight: TEdit;
    btnResize: TSpeedButton;
    pnl3: TPanel;
    btnOK: TSpeedButton;
    grp1: TGroupBox;
    cbxJDK: TCheckBox;
    cbxXDK: TCheckBox;
    cbxPXGG: TCheckBox;
    cbxBB: TCheckBox;
    grp2: TGroupBox;
    cbbCBHor: TComboBoxEx;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    cbbCBVer: TComboBoxEx;
    cbbCBCustom: TComboBoxEx;
    ilCB: TImageList;
    btnCBHorOK: TSpeedButton;
    btnCBVerOK: TSpeedButton;
    btnCBCustomOK: TSpeedButton;
    grp3: TGroupBox;
    lbl6: TLabel;
    cbxShapeType: TComboBox;
    lbl7: TLabel;
    lbl8: TLabel;
    cbxPenWidth: TComboBox;
    clrbxShapeColor: TColorBox;
    grp4: TGroupBox;
    lbl9: TLabel;
    cbxCustomDrawStrSize: TComboBox;
    lbl10: TLabel;
    edtCustomDrawStr: TEdit;
    cbxBeginCustomDraw: TCheckBox;
    btnUnCustomDraw: TSpeedButton;
    pm1: TPopupMenu;
    mniN1: TMenuItem;
    cpnl5: TCategoryPanel;
    cpnl6: TCategoryPanel;
    btnSaveImg: TSpeedButton;
    btn2: TSpeedButton;
    lbl17: TLabel;
    lbl30: TLabel;
    pnl4: TPanel;
    pnl5: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    btnMoveRight: TSpeedButton;
    btnMoveLeft: TSpeedButton;
    btnMoveDown: TSpeedButton;
    btnMoveUp: TSpeedButton;
    lbl11: TLabel;
    lbl12: TLabel;
    edtMoveStep: TEdit;
    procedure pbEditPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure edtExit(Sender: TObject);
    procedure btnResizeClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCBHorOKClick(Sender: TObject);
    procedure btnCBVerOKClick(Sender: TObject);
    procedure pbEditMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pbEditMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure pbEditMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnCBCustomOKClick(Sender: TObject);
    procedure cbxDWKClick(Sender: TObject);
    procedure mniN1Click(Sender: TObject);
    procedure pm1Popup(Sender: TObject);
    procedure btnUnCustomDrawClick(Sender: TObject);
    procedure btnSaveImgClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btnMoveLeftClick(Sender: TObject);
    procedure btnMoveRightClick(Sender: TObject);
    procedure btnMoveUpClick(Sender: TObject);
    procedure btnMoveDownClick(Sender: TObject);
  private
    { Private declarations }
    FDrawEng: IDrawEng;
    FOldRet, FRet: IRet;
    FIndex: Integer;

    FMouseDownFlag: Boolean;
    FMouseDownX,FMouseDownY,FMouseNowX,FMouseNowY: Integer;
    FSelectList: TList<IFloatRect>;
    FStrPoint: TPoint;
    FCustomDrawID: Integer;
    procedure CustomImgEnableSet;
  public
    { Public declarations }
  end;
                                                       //1-sheet, 2-pnla 3pnlb
  function ShowEditFrm(AOwner: TComponent; ARet: IRet; nIndex: Integer): Integer;

implementation

uses
  GdiPlus, Math, Calc, CalcParam;


{$R *.dfm}

function ShowEditFrm(AOwner: TComponent; ARet: IRet; nIndex: Integer): Integer;
var
  LFrm: TfrmEdit;
begin
  LFrm := TfrmEdit.Create(AOwner);
  with LFrm do
  begin
    try
      DoubleBuffered := True;
      FRet := TRet.Create;
      ARet.CopyRet(ARet,FRet);
      FOldRet := ARet;
      FDrawEng := TDrawEng.Create;
      FIndex := nIndex;
      cpnl1.CollapseAll;
      case nIndex of
        1:
        begin
          cpnl2.Collapsed := True;
          cpnl2.Enabled := False;
          cpnl2.Visible := False;
          cpnl3.Visible := False;
          if FRet.CustomSheetImg <> nil then
            FRet.SheetCustomDrawList.Clear;
        end;
        2:
        begin
          edtBorderTopBottom.Text := FormatFloat('0.000',ARet.CutParam.PnlABorderTopBottomWidth);
          edtBorderLeftRight.Text := FormatFloat('0.000',ARet.CutParam.PnlABorderLeftRightWidth);
          if FRet.CustomPnlAImg <> nil then
            FRet.PnlACustomDrawList.Clear;
        end;
        3:
        begin
          edtBorderTopBottom.Text := FormatFloat('0.000',ARet.CutParam.PnlBBorderTopBottomWidth);
          edtBorderLeftRight.Text := FormatFloat('0.000',ARet.CutParam.PnlBBorderLeftRightWidth);
          if FRet.CustomPnlBImg <> nil then
            FRet.PnlBCustomDrawList.Clear;
        end;
      end;
      CustomImgEnableSet;
      Result := ShowModal;
      {$MESSAGE '如果为自定义图片，则pbedt的大小为自定义图片的大小'}
    finally
      Free;
    end;
  end;
end;

procedure TfrmEdit.btnResizeClick(Sender: TObject);
//var
//  LArr2D: IBlockArr2D;
//  LCol: IBlockColum;
//  LBlock: IFloatRect;
//  OffsetW,OffsetH: Double;
//  I, J: Integer;
//  LIRet: IRet;
//  tmpARet, tmpBRet,tmpSheetRet: TCalcRet;
//  ACutParam: TCutparam;
begin
(*
  edtExit(edtBorderTopBottom);
  edtExit(edtBorderLeftRight);
  if (edtBorderTopBottom.Tag = 1) and (edtBorderLeftRight.Tag = 1) then
  begin
    case FIndex of
      1:
      begin
        ShowMessage('大料的板边的不能调整');
      end;
      2:
      begin
        if (StrToFloatDef(edtBorderLeftRight.Text,0) < 0) or
           (StrToFloatDef(edtBorderTopBottom.Text,0) < 0)
        then
        begin
          ShowMessage('板边不能小于0');
          Exit;
        end;

        ACutParam := FRet.CutParam;
        OffsetW := FRet.CutParam.PnlABorderLeftRightWidth - StrToFloatDef(edtBorderLeftRight.Text,0);
        OffsetH := FRet.CutParam.PnlABorderTopBottomWidth - StrToFloatDef(edtBorderTopBottom.Text,0);
        ACutParam.PnlABorderLeftRightWidth := StrToFloatDef(edtBorderLeftRight.Text,0);
        ACutParam.PnlABorderTopBottomWidth := StrToFloatDef(edtBorderTopBottom.Text,0);
        tmpARet := FRet.PnlACalcRet;
        tmpARet.W := tmpARet.W - 2* OffsetW;
        tmpARet.H := tmpARet.H - 2* OffsetH;
        FRet.PnlACalcRet := tmpARet;
        LIRet := TRet.Create;
        LIRet.CutParam := ACutParam;
        {$REGION 'PnlASetArr'}
        LIRet.PnlAW := tmpARet.W;
        LIRet.PnlAH := tmpARet.H;
        LIRet.PnlACalcZKReg := tmpARet.ZkReg;
        LIRet.PnlACalcRet := tmpARet;
        {$REGION 'Reg1'}
        LArr2D := LIRet.PnlABlockReg.AddReg();
        LArr2D.X := ACutParam.PnlABorderLeftRightWidth;
        LArr2D.Y := ACutParam.PnlABorderTopBottomWidth;
        if tmpARet.Reg[0].X * tmpARet.Reg[0].Y = 0 then
        begin
          LArr2D.W := 0;
          LArr2D.H := 0;
        end else
        begin
          for I := 0 to tmpARet.Reg[0].X - 1 do
          begin
            LCol := LArr2D.AddColum();
            if not tmpARet.Reg[0].R then
            begin
              LCol.W := ACutParam.PnlASetW;
            end else LCol.W := ACutParam.PnlASetH;
            LCol.X := LArr2D.X + I* (LCol.W+ ACutParam.PnlASetHorzSpace);
            LCol.Y := LArr2D.Y;
            for J := 0 to tmpARet.Reg[0].Y - 1 do
            begin
              LBlock := TFloatRect.Create;
              LBlock.W := ACutParam.PnlASetW;
              LBlock.H := ACutParam.PnlASetH;
              LBlock.Rotate := tmpARet.Reg[0].R;
              LBlock.X := LCol.X;
              if not LBlock.Rotate then
              begin
                LBlock.Y := LCol.Y + J*(LBlock.H+ ACutParam.PnlASetVertSpace);
                LCol.H := (J+1)* LBlock.H + J* ACutParam.PnlASetVertSpace;
              end else
              begin
                LBlock.Y := LCol.Y + J*(LBlock.W+ ACutParam.PnlASetVertSpace);
                LCol.H := (J+1)* LBlock.W + J* ACutParam.PnlASetVertSpace;
              end;
              LCol.AddRow(LBlock);
            end;
            LArr2D.H := LCol.H;
            LArr2D.W := (I+1)* LCol.W + I* ACutParam.PnlASetHorzSpace;
          end;
        end;
        {$ENDREGION}
        {$REGION 'Reg2'}
        LArr2D := LIRet.PnlABlockReg.AddReg();
        LArr2D.Y := ACutParam.PnlABorderTopBottomWidth;
        if (tmpARet.Reg[0].CellCount >0) and (tmpARet.Reg[2].CellCount > 0) then
        begin
          if tmpARet.Reg[2].M then
          begin
            if not tmpARet.Reg[0].R then
            begin
              LArr2D.X :=  ACutParam.PnlABorderLeftRightWidth +
                (ACutParam.PnlASetW+ ACutParam.PnlASetHorzSpace)* tmpARet.Reg[0].X;
            end else
            begin
              LArr2D.X :=  ACutParam.PnlABorderLeftRightWidth +
                (ACutParam.PnlASetH+ ACutParam.PnlASetHorzSpace)* tmpARet.Reg[0].X;
            end;
          end else
          begin
            if not tmpARet.Reg[0].R then
            begin
              LArr2D.X :=  ACutParam.PnlABorderLeftRightWidth +
                (ACutParam.PnlASetW+ ACutParam.PnlASetHorzSpace)* tmpARet.Reg[0].X;
            end else
            begin
              LArr2D.X :=  ACutParam.PnlABorderLeftRightWidth +
                (ACutParam.PnlASetH+ ACutParam.PnlASetHorzSpace)* tmpARet.Reg[0].X;
            end;
          end;
        end else
        if (tmpARet.Reg[0].CellCount =0) and (tmpARet.Reg[2].CellCount = 0) then
        begin
          LArr2D.X := ACutParam.PnlABorderLeftRightWidth;
          LArr2D.Y := ACutParam.PnlABorderTopBottomWidth;
        end else
        if (tmpARet.Reg[0].CellCount =0) and (tmpARet.Reg[2].CellCount > 0) then
        begin
          if tmpARet.Reg[1].M then
          begin
            if not tmpARet.Reg[2].R then
            begin
              LArr2D.X :=  ACutParam.PnlABorderLeftRightWidth +
                (ACutParam.PnlASetW+ ACutParam.PnlASetHorzSpace)* tmpARet.Reg[2].X;
            end else
            begin
              LArr2D.X :=  ACutParam.PnlABorderLeftRightWidth +
                (ACutParam.PnlASetH+ ACutParam.PnlASetHorzSpace)* tmpARet.Reg[2].X;
            end;
          end else
            LArr2D.X := ACutParam.PnlABorderLeftRightWidth;
        end else
        if (tmpARet.Reg[0].CellCount >0) and (tmpARet.Reg[2].CellCount = 0) then
        begin
          if not tmpARet.Reg[0].R then
          begin
            LArr2D.X :=  ACutParam.PnlABorderLeftRightWidth +
              (ACutParam.PnlASetW+ ACutParam.PnlASetHorzSpace)* tmpARet.Reg[0].X;
          end else
          begin
            LArr2D.X :=  ACutParam.PnlABorderLeftRightWidth +
              (ACutParam.PnlASetH+ ACutParam.PnlASetHorzSpace)* tmpARet.Reg[0].X;
          end;
        end;

        if tmpARet.Reg[1].X * tmpARet.Reg[1].Y = 0 then
        begin
          LArr2D.W := 0;
          LArr2D.H := 0;
        end else
        begin
          for I := 0 to tmpARet.Reg[1].X - 1 do
          begin
            LCol := LArr2D.AddColum();
            if not tmpARet.Reg[1].R then
            begin
              LCol.W := ACutParam.PnlASetW;
            end else LCol.W := ACutParam.PnlASetH;
            LCol.X := LArr2D.X + I* (LCol.W+ACutParam.PnlASetHorzSpace);
            LCol.Y := LArr2D.Y;
            for J := 0 to tmpARet.Reg[1].Y - 1 do
            begin
              LBlock := TFloatRect.Create;
              LBlock.W := ACutParam.PnlASetW;
              LBlock.H := ACutParam.PnlASetH;
              LBlock.Rotate := tmpARet.Reg[1].R;
              LBlock.X := LCol.X;
              if not LBlock.Rotate then
              begin
                LBlock.Y := LCol.Y + J*(LBlock.H+ ACutParam.PnlASetVertSpace);
                LCol.H := (J+1)* LBlock.H + J* ACutParam.PnlASetVertSpace;
              end else
              begin
                LBlock.Y := LCol.Y + J*(LBlock.W+ ACutParam.PnlASetVertSpace);
                LCol.H := (J+1)* LBlock.W + J* ACutParam.PnlASetVertSpace;
              end;
              LCol.AddRow(LBlock);
            end;
            LArr2D.H := LCol.H;
            LArr2D.W := (I+1)* LCol.W + I* ACutParam.PnlASetHorzSpace;
          end;
        end;
        {$ENDREGION}
        {$REGION 'Reg3'}
        LArr2D := LIRet.PnlABlockReg.AddReg();
        LArr2D.X := ACutParam.PnlABorderLeftRightWidth;
        if (tmpARet.Reg[0].CellCount = 0) and (tmpARet.Reg[1].CellCount = 0) then
        begin
          LArr2D.Y := ACutParam.PnlABorderTopBottomWidth;
        end else
        if (tmpARet.Reg[0].CellCount > 0) and (tmpARet.Reg[1].CellCount > 0) then
        begin
          if tmpARet.Reg[1].M then
          begin
            if not tmpARet.Reg[0].R then
            begin
              LArr2D.Y := ACutParam.PnlABorderTopBottomWidth +
                (ACutParam.PnlASetH+ ACutParam.PnlASetVertSpace)* tmpARet.Reg[0].Y;
            end else
            begin
              LArr2D.Y := ACutParam.PnlABorderTopBottomWidth +
                (ACutParam.PnlASetW+ ACutParam.PnlASetVertSpace)* tmpARet.Reg[0].Y;
            end;
          end else
          begin
            if not tmpARet.Reg[0].R then
            begin
              LArr2D.Y := ACutParam.PnlABorderTopBottomWidth +
                (ACutParam.PnlASetH+ ACutParam.PnlASetVertSpace)* tmpARet.Reg[0].Y;
            end else
            begin
              LArr2D.Y := ACutParam.PnlABorderTopBottomWidth +
                (ACutParam.PnlASetW+ ACutParam.PnlASetVertSpace)* tmpARet.Reg[0].Y;
            end;
          end;
        end else
        if (tmpARet.Reg[0].CellCount > 0) and (tmpARet.Reg[1].CellCount = 0) then
        begin
          if not tmpARet.Reg[0].R then
          begin
            LArr2D.Y := ACutParam.PnlABorderTopBottomWidth +
              (ACutParam.PnlASetH+ ACutParam.PnlASetVertSpace)* tmpARet.Reg[0].Y;
          end else
          begin
            LArr2D.Y := ACutParam.PnlABorderTopBottomWidth +
              (ACutParam.PnlASetW+ ACutParam.PnlASetVertSpace)* tmpARet.Reg[0].Y;
          end;
        end else
        if (tmpARet.Reg[0].CellCount = 0) and (tmpARet.Reg[1].CellCount > 0) then
        begin
          if tmpARet.Reg[1].M then
            LArr2D.Y := ACutParam.PnlABorderTopBottomWidth
          else
          if not tmpARet.Reg[1].R then
          begin
            LArr2D.Y := ACutParam.PnlABorderTopBottomWidth +
              (ACutParam.PnlASetH+ ACutParam.PnlASetVertSpace)* tmpARet.Reg[1].Y;
          end else
          begin
            LArr2D.Y := ACutParam.PnlABorderTopBottomWidth +
              (ACutParam.PnlASetW+ ACutParam.PnlASetVertSpace)* tmpARet.Reg[1].Y;
          end;
        end;

        if tmpARet.Reg[2].X * tmpARet.Reg[2].Y = 0 then
        begin
          LArr2D.W := 0;
          LArr2D.H := 0;
        end else
        begin
          for I := 0 to tmpARet.Reg[2].X - 1 do
          begin
            LCol := LArr2D.AddColum();
            if not tmpARet.Reg[2].R then
            begin
              LCol.W := ACutParam.PnlASetW;
            end else LCol.W := ACutParam.PnlASetH;
            LCol.X := LArr2D.X + I* (LCol.W +ACutParam.PnlASetHorzSpace);
            LCol.Y := LArr2D.Y;
            for J := 0 to tmpARet.Reg[2].Y - 1 do
            begin
              LBlock := TFloatRect.Create;
              LBlock.W := ACutParam.PnlASetW;
              LBlock.H := ACutParam.PnlASetH;
              LBlock.Rotate := tmpARet.Reg[2].R;
              LBlock.X := LCol.X;
              if not LBlock.Rotate then
              begin
                LBlock.Y := LCol.Y + J*(LBlock.H+ ACutParam.PnlASetVertSpace);
                LCol.H := (J+1)* LBlock.H + J* ACutParam.PnlASetVertSpace;
              end else
              begin
                LBlock.Y := LCol.Y + J*(LBlock.W+ ACutParam.PnlASetVertSpace);
                LCol.H := (J+1)* LBlock.W + J* ACutParam.PnlASetVertSpace;
              end;
              LCol.AddRow(LBlock);
            end;
            LArr2D.H := LCol.H;
            LArr2D.W := (I+1)* LCol.W + I* ACutParam.PnlASetHorzSpace;
          end;
        end;
        {$ENDREGION}
        {$ENDREGION}
        {$REGION 'PnlBSetArr'}
        if tmpARet.PnlBIndex <> -1 then
        begin
          tmpBRet := FRet.PnlBCalcRet;
          LIRet.PnlBW := tmpBRet.W;
          LIRet.PnlBH := tmpBRet.H;
          LIRet.PnlBCalcZKReg := tmpBRet.ZkReg;
          LIRet.PnlBCalcRet := tmpBRet;
        {$REGION 'Reg1'}
          LArr2D := LIRet.PnlBBlockReg.AddReg();
          LArr2D.X := ACutParam.PnlBBorderLeftRightWidth;
          LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth;
          if tmpBRet.Reg[0].X * tmpBRet.Reg[0].Y = 0 then
          begin
            LArr2D.W := 0;
            LArr2D.H := 0;
          end else
          begin
            for I := 0 to tmpBRet.Reg[0].X - 1 do
            begin
              LCol := LArr2D.AddColum();
              if not tmpBRet.Reg[0].R then
              begin
                LCol.W := ACutParam.PnlBSetW;
              end else LCol.W := ACutParam.PnlBSetH;
              LCol.X := LArr2D.X + I* (LCol.W+ ACutParam.PnlBSetHorzSpace);
              LCol.Y := LArr2D.Y;
              for J := 0 to tmpBRet.Reg[0].Y - 1 do
              begin
                LBlock := TFloatRect.Create;
                LBlock.W := ACutParam.PnlBSetW;
                LBlock.H := ACutParam.PnlBSetH;
                LBlock.Rotate := tmpBRet.Reg[0].R;
                LBlock.X := LCol.X;
                if not LBlock.Rotate then
                begin
                  LBlock.Y := LCol.Y + J*(LBlock.H+ ACutParam.PnlBSetVertSpace);
                  LCol.H := (J+1)* LBlock.H + J* ACutParam.PnlBSetVertSpace;
                end else
                begin
                  LBlock.Y := LCol.Y + J*(LBlock.W+ ACutParam.PnlBSetVertSpace);
                  LCol.H := (J+1)* LBlock.W + J* ACutParam.PnlBSetVertSpace;
                end;
                LCol.AddRow(LBlock);
              end;
              LArr2D.H := LCol.H;
              LArr2D.W := (I+1)* LCol.W + I* ACutParam.PnlBSetHorzSpace;
            end;
          end;
        {$ENDREGION}
        {$REGION 'Reg2'}
        LArr2D := LIRet.PnlBBlockReg.AddReg();
        LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth;
        if (tmpBRet.Reg[0].CellCount >0) and (tmpBRet.Reg[2].CellCount > 0) then
        begin
          if tmpBRet.Reg[2].M then
          begin
            if not tmpBRet.Reg[0].R then
            begin
              LArr2D.X :=  ACutParam.PnlBBorderLeftRightWidth +
                (ACutParam.PnlBSetW+ ACutParam.PnlBSetHorzSpace)* tmpBRet.Reg[0].X;
            end else
            begin
              LArr2D.X :=  ACutParam.PnlBBorderLeftRightWidth +
                (ACutParam.PnlBSetH+ ACutParam.PnlBSetHorzSpace)* tmpBRet.Reg[0].X;
            end;
          end else
          begin
            if not tmpBRet.Reg[0].R then
            begin
              LArr2D.X :=  ACutParam.PnlBBorderLeftRightWidth +
                (ACutParam.PnlBSetW+ ACutParam.PnlBSetHorzSpace)* tmpBRet.Reg[0].X;
            end else
            begin
              LArr2D.X :=  ACutParam.PnlBBorderLeftRightWidth +
                (ACutParam.PnlBSetH+ ACutParam.PnlBSetHorzSpace)* tmpBRet.Reg[0].X;
            end;
          end;
        end else
        if (tmpBRet.Reg[0].CellCount =0) and (tmpBRet.Reg[2].CellCount = 0) then
        begin
          LArr2D.X := ACutParam.PnlBBorderLeftRightWidth;
          LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth;
        end else
        if (tmpBRet.Reg[0].CellCount =0) and (tmpBRet.Reg[2].CellCount > 0) then
        begin
          if tmpBRet.Reg[1].M then
          begin
            if not tmpBRet.Reg[2].R then
            begin
              LArr2D.X :=  ACutParam.PnlBBorderLeftRightWidth +
                (ACutParam.PnlBSetW+ ACutParam.PnlBSetHorzSpace)* tmpBRet.Reg[2].X;
            end else
            begin
              LArr2D.X :=  ACutParam.PnlBBorderLeftRightWidth +
                (ACutParam.PnlBSetH+ ACutParam.PnlBSetHorzSpace)* tmpBRet.Reg[2].X;
            end;
          end else
            LArr2D.X := ACutParam.PnlBBorderLeftRightWidth;
        end else
        if (tmpBRet.Reg[0].CellCount >0) and (tmpBRet.Reg[2].CellCount = 0) then
        begin
          if not tmpBRet.Reg[0].R then
          begin
            LArr2D.X :=  ACutParam.PnlBBorderLeftRightWidth +
              (ACutParam.PnlBSetW+ ACutParam.PnlBSetHorzSpace)* tmpBRet.Reg[0].X;
          end else
          begin
            LArr2D.X :=  ACutParam.PnlBBorderLeftRightWidth +
              (ACutParam.PnlBSetH+ ACutParam.PnlBSetHorzSpace)* tmpBRet.Reg[0].X;
          end;
        end;

        if tmpBRet.Reg[1].X * tmpBRet.Reg[1].Y = 0 then
        begin
          LArr2D.W := 0;
          LArr2D.H := 0;
        end else
        begin
          for I := 0 to tmpBRet.Reg[1].X - 1 do
          begin
            LCol := LArr2D.AddColum();
            if not tmpBRet.Reg[1].R then
            begin
              LCol.W := ACutParam.PnlBSetW;
            end else LCol.W := ACutParam.PnlBSetH;
            LCol.X := LArr2D.X + I* (LCol.W+ACutParam.PnlBSetHorzSpace);
            LCol.Y := LArr2D.Y;
            for J := 0 to tmpBRet.Reg[1].Y - 1 do
            begin
              LBlock := TFloatRect.Create;
              LBlock.W := ACutParam.PnlBSetW;
              LBlock.H := ACutParam.PnlBSetH;
              LBlock.Rotate := tmpBRet.Reg[1].R;
              LBlock.X := LCol.X;
              if not LBlock.Rotate then
              begin
                LBlock.Y := LCol.Y + J*(LBlock.H+ ACutParam.PnlBSetVertSpace);
                LCol.H := (J+1)* LBlock.H + J* ACutParam.PnlBSetVertSpace;
              end else
              begin
                LBlock.Y := LCol.Y + J*(LBlock.W+ ACutParam.PnlBSetVertSpace);
                LCol.H := (J+1)* LBlock.W + J* ACutParam.PnlBSetVertSpace;
              end;
              LCol.AddRow(LBlock);
            end;
            LArr2D.H := LCol.H;
            LArr2D.W := (I+1)* LCol.W + I* ACutParam.PnlBSetHorzSpace;
          end;
        end;
        {$ENDREGION}
        {$REGION 'Reg3'}
        LArr2D := LIRet.PnlBBlockReg.AddReg();
        LArr2D.X := ACutParam.PnlBBorderLeftRightWidth;
        if (tmpBRet.Reg[0].CellCount = 0) and (tmpBRet.Reg[1].CellCount = 0) then
        begin
          LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth;
        end else
        if (tmpBRet.Reg[0].CellCount > 0) and (tmpBRet.Reg[1].CellCount > 0) then
        begin
          if tmpBRet.Reg[1].M then
          begin
            if not tmpBRet.Reg[0].R then
            begin
              LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth +
                (ACutParam.PnlBSetH+ ACutParam.PnlBSetVertSpace)* tmpBRet.Reg[0].Y;
            end else
            begin
              LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth +
                (ACutParam.PnlBSetW+ ACutParam.PnlBSetVertSpace)* tmpBRet.Reg[0].Y;
            end;
          end else
          begin
            if not tmpBRet.Reg[0].R then
            begin
              LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth +
                (ACutParam.PnlBSetH+ ACutParam.PnlBSetVertSpace)* tmpBRet.Reg[0].Y;
            end else
            begin
              LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth +
                (ACutParam.PnlBSetW+ ACutParam.PnlBSetVertSpace)* tmpBRet.Reg[0].Y;
            end;
          end;
        end else
        if (tmpBRet.Reg[0].CellCount > 0) and (tmpBRet.Reg[1].CellCount = 0) then
        begin
          if not tmpBRet.Reg[0].R then
          begin
            LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth +
              (ACutParam.PnlBSetH+ ACutParam.PnlBSetVertSpace)* tmpBRet.Reg[0].Y;
          end else
          begin
            LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth +
              (ACutParam.PnlBSetW+ ACutParam.PnlBSetVertSpace)* tmpBRet.Reg[0].Y;
          end;
        end else
        if (tmpBRet.Reg[0].CellCount = 0) and (tmpBRet.Reg[1].CellCount > 0) then
        begin
          if tmpBRet.Reg[1].M then
            LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth
          else
          if not tmpBRet.Reg[1].R then
          begin
            LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth +
              (ACutParam.PnlBSetH+ ACutParam.PnlBSetVertSpace)* tmpBRet.Reg[1].Y;
          end else
          begin
            LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth +
              (ACutParam.PnlBSetW+ ACutParam.PnlBSetVertSpace)* tmpBRet.Reg[1].Y;
          end;
        end;

        if tmpBRet.Reg[2].X * tmpBRet.Reg[2].Y = 0 then
        begin
          LArr2D.W := 0;
          LArr2D.H := 0;
        end else
        begin
          for I := 0 to tmpBRet.Reg[2].X - 1 do
          begin
            LCol := LArr2D.AddColum();
            if not tmpBRet.Reg[2].R then
            begin
              LCol.W := ACutParam.PnlBSetW;
            end else LCol.W := ACutParam.PnlBSetH;
            LCol.X := LArr2D.X + I* (LCol.W +ACutParam.PnlBSetHorzSpace);
            LCol.Y := LArr2D.Y;
            for J := 0 to tmpBRet.Reg[2].Y - 1 do
            begin
              LBlock := TFloatRect.Create;
              LBlock.W := ACutParam.PnlBSetW;
              LBlock.H := ACutParam.PnlBSetH;
              LBlock.Rotate := tmpBRet.Reg[2].R;
              LBlock.X := LCol.X;
              if not LBlock.Rotate then
              begin
                LBlock.Y := LCol.Y + J*(LBlock.H+ ACutParam.PnlBSetVertSpace);
                LCol.H := (J+1)* LBlock.H + J* ACutParam.PnlBSetVertSpace;
              end else
              begin
                LBlock.Y := LCol.Y + J*(LBlock.W+ ACutParam.PnlBSetVertSpace);
                LCol.H := (J+1)* LBlock.W + J* ACutParam.PnlBSetVertSpace;
              end;
              LCol.AddRow(LBlock);
            end;
            LArr2D.H := LCol.H;
            LArr2D.W := (I+1)* LCol.W + I* ACutParam.PnlBSetHorzSpace;
          end;
        end;
        {$ENDREGION}

        end;
        {$ENDREGION}
        {$REGION 'SheetAArr'}
        if tmpARet.SheetAIndex <> -1 then
        begin
          tmpSheetRet := FRet.SheetACalcRet;
          LIRet.SheetW := ACutParam.SheetW;
          LIRet.SheetAW := tmpSheetRet.W;
          LIRet.SheetH := ACutParam.SheetH;
          LIRet.SheetACalcRet := tmpSheetRet;
        {$REGION 'Reg1'}
          LArr2D := LIRet.SheetABlockReg.AddReg();
          LArr2D.X := 0;
          LArr2D.Y := 0;
          if tmpSheetRet.Reg[0].X * tmpSheetRet.Reg[0].Y = 0 then
          begin
            LArr2D.W := 0;
            LArr2D.H := 0;
          end else
          begin
            for I := 0 to tmpSheetRet.Reg[0].X - 1 do
            begin
              LCol := LArr2D.AddColum();
              if not tmpSheetRet.Reg[0].R then
              begin
                LCol.W := tmpARet.W
              end else LCol.W := tmpARet.H;
              LCol.X := LArr2D.X + I* LCol.W;
              LCol.Y := LArr2D.Y;
              for J := 0 to tmpSheetRet.Reg[0].Y - 1 do
              begin
                LBlock := TFloatRect.Create;
                LBlock.W := tmpARet.W;
                LBlock.H := tmpARet.H;
                LBlock.Rotate := tmpSheetRet.Reg[0].R;
                LBlock.X := LCol.X;
                if not LBlock.Rotate then
                begin
                  LBlock.Y := LCol.Y + J*LBlock.H;
                  LCol.H := (J+1)* LBlock.H;
                end else
                begin
                  LBlock.Y := LCol.Y + J*LBlock.W;
                  LCol.H := (J+1)* LBlock.W;
                end;
                LCol.AddRow(LBlock);
              end;
              LArr2D.H := LCol.H;
              LArr2D.W := (I+1)* LCol.W;
            end;
          end;
        {$ENDREGION}
        {$REGION 'Reg2'}
        LArr2D := LIRet.SheetABlockReg.AddReg();
        if tmpSheetRet.Reg[0].X* tmpSheetRet.Reg[0].Y > 0 then
        begin
          LArr2D.X := LIRet.SheetABlockReg.Reg[0].X + LIRet.SheetABlockReg.Reg[0].W;
          LArr2D.Y := 0;
        end else
        begin
          LArr2D.X := 0;
          LArr2D.Y := 0;
        end;
        if tmpSheetRet.Reg[1].X * tmpSheetRet.Reg[1].Y = 0 then
        begin
          LArr2D.W := 0;
          LArr2D.H := 0;
        end else
        begin
          for I := 0 to tmpSheetRet.Reg[1].X - 1 do
          begin
            LCol := LArr2D.AddColum();
            if not tmpSheetRet.Reg[1].R then
            begin
              LCol.W := tmpARet.W
            end else LCol.W := tmpARet.H;
            LCol.X := LArr2D.X + I* LCol.W;
            LCol.Y := LArr2D.Y;
            for J := 0 to tmpSheetRet.Reg[1].Y - 1 do
            begin
              LBlock := TFloatRect.Create;
              LBlock.W := tmpARet.W;
              LBlock.H := tmpARet.H;
              LBlock.Rotate := tmpSheetRet.Reg[1].R;
              LBlock.X := LCol.X;
              if not LBlock.Rotate then
              begin
                LBlock.Y := LCol.Y + J*LBlock.H;
                LCol.H := (J+1)* LBlock.H;
              end else
              begin
                LBlock.Y := LCol.Y + J*LBlock.W ;
                LCol.H := (J+1)* LBlock.W;
              end;
              LCol.AddRow(LBlock);
            end;
            LArr2D.H := LCol.H;
            LArr2D.W := (I+1)* LCol.W;
          end;
        end;
        {$ENDREGION}
        {$REGION 'Reg3'}
        LArr2D := LIRet.SheetABlockReg.AddReg();
        if tmpSheetRet.Reg[0].X* tmpSheetRet.Reg[0].Y > 0 then
        begin
          LArr2D.X := 0;
          LArr2D.Y := LIRet.SheetABlockReg.Reg[0].Y + LIRet.SheetABlockReg.Reg[0].H;
        end else
        begin
          LArr2D.X := 0;
          LArr2D.Y := 0;
        end;
        if tmpSheetRet.Reg[2].X * tmpSheetRet.Reg[2].Y = 0 then
        begin
          LArr2D.W := 0;
          LArr2D.H := 0;
        end else
        begin
          for I := 0 to tmpSheetRet.Reg[2].X - 1 do
          begin
            LCol := LArr2D.AddColum();
            if not tmpSheetRet.Reg[2].R then
            begin
              LCol.W := tmpARet.W
            end else LCol.W := tmpARet.H;
            LCol.X := LArr2D.X + I* LCol.W;
            LCol.Y := LArr2D.Y;
            for J := 0 to tmpSheetRet.Reg[2].Y - 1 do
            begin
              LBlock := TFloatRect.Create;
              LBlock.W := tmpARet.W;
              LBlock.H := tmpARet.H;
              LBlock.Rotate := tmpSheetRet.Reg[2].R;
              LBlock.X := LCol.X;
              if not LBlock.Rotate then
              begin
                LBlock.Y := LCol.Y + J*LBlock.H;
                LCol.H := (J+1)* LBlock.H;
              end else
              begin
                LBlock.Y := LCol.Y + J*LBlock.W;
                LCol.H := (J+1)* LBlock.W;
              end;
              LCol.AddRow(LBlock);
            end;
            LArr2D.H := LCol.H;
            LArr2D.W := (I+1)* LCol.W ;
          end;
        end;
        {$ENDREGION}
        end;
        {$ENDREGION}
        {$REGION 'SheetBArr'}
        if tmpARet.SheetBIndex <> -1 then
        begin
          tmpSheetRet := FRet.SheetBCalcRet;
          LIRet.SheetBW := tmpSheetRet.W;
          LIRet.SheetBCalcRet := tmpSheetRet;
          tmpBRet := FRet.PnlBCalcRet;
        {$REGION 'Reg1'}
          LArr2D := LIRet.SheetBBlockReg.AddReg();
          LArr2D.X := LIRet.SheetAW;
          LArr2D.Y := 0;
          if tmpSheetRet.Reg[0].X * tmpSheetRet.Reg[0].Y = 0 then
          begin
            LArr2D.W := 0;
            LArr2D.H := 0;
          end else
          begin
            for I := 0 to tmpSheetRet.Reg[0].X - 1 do
            begin
              LCol := LArr2D.AddColum();
              if not tmpSheetRet.Reg[0].R then
              begin
                LCol.W := tmpBRet.W
              end else LCol.W := tmpBRet.H;
              LCol.X := LArr2D.X + I* LCol.W;
              LCol.Y := LArr2D.Y;
              for J := 0 to tmpSheetRet.Reg[0].Y - 1 do
              begin
                LBlock := TFloatRect.Create;
                LBlock.W := tmpBRet.W;
                LBlock.H := tmpBRet.H;
                LBlock.Rotate := tmpSheetRet.Reg[0].R;
                LBlock.X := LCol.X;
                if not LBlock.Rotate then
                begin
                  LBlock.Y := LCol.Y + J*LBlock.H;
                  LCol.H := (J+1)* LBlock.H;
                end else
                begin
                  LBlock.Y := LCol.Y + J*LBlock.W;
                  LCol.H := (J+1)* LBlock.W;
                end;
                LCol.AddRow(LBlock);
              end;
              LArr2D.H := LCol.H;
              LArr2D.W := (I+1)* LCol.W;
            end;
          end;
        {$ENDREGION}
        {$REGION 'Reg2'}
        LArr2D := LIRet.SheetBBlockReg.AddReg();
        if tmpSheetRet.Reg[0].X* tmpSheetRet.Reg[0].Y > 0 then
        begin
          LArr2D.X := LIRet.SheetBBlockReg.Reg[0].X + LIRet.SheetBBlockReg.Reg[0].W;
          LArr2D.Y := 0;
        end else
        begin
          LArr2D.X := LIRet.SheetAW;
          LArr2D.Y := 0;
        end;
        if tmpSheetRet.Reg[1].X * tmpSheetRet.Reg[1].Y = 0 then
        begin
          LArr2D.W := 0;
          LArr2D.H := 0;
        end else
        begin
          for I := 0 to tmpSheetRet.Reg[1].X - 1 do
          begin
            LCol := LArr2D.AddColum();
            if not tmpSheetRet.Reg[1].R then
            begin
              LCol.W := tmpBRet.W
            end else LCol.W := tmpBRet.H;
            LCol.X := LArr2D.X + I* LCol.W;
            LCol.Y := LArr2D.Y;
            for J := 0 to tmpSheetRet.Reg[1].Y - 1 do
            begin
              LBlock := TFloatRect.Create;
              LBlock.W := tmpBRet.W;
              LBlock.H := tmpBRet.H;
              LBlock.Rotate := tmpSheetRet.Reg[1].R;
              LBlock.X := LCol.X;
              if not LBlock.Rotate then
              begin
                LBlock.Y := LCol.Y + J*LBlock.H;
                LCol.H := (J+1)* LBlock.H;
              end else
              begin
                LBlock.Y := LCol.Y + J*LBlock.W ;
                LCol.H := (J+1)* LBlock.W;
              end;
              LCol.AddRow(LBlock);
            end;
            LArr2D.H := LCol.H;
            LArr2D.W := (I+1)* LCol.W;
          end;
        end;
        {$ENDREGION}
        {$REGION 'Reg3'}
        LArr2D := LIRet.SheetBBlockReg.AddReg();
        if tmpSheetRet.Reg[0].X* tmpSheetRet.Reg[0].Y > 0 then
        begin
          LArr2D.X := LIRet.SheetAW;
          LArr2D.Y := LIRet.SheetBBlockReg.Reg[0].Y + LIRet.SheetBBlockReg.Reg[0].H;
        end else
        begin
          LArr2D.X := LIRet.SheetAW;
          LArr2D.Y := 0;
        end;
        if tmpSheetRet.Reg[2].X * tmpSheetRet.Reg[2].Y = 0 then
        begin
          LArr2D.W := 0;
          LArr2D.H := 0;
        end else
        begin
          for I := 0 to tmpSheetRet.Reg[2].X - 1 do
          begin
            LCol := LArr2D.AddColum();
            if not tmpSheetRet.Reg[2].R then
            begin
              LCol.W := tmpBRet.W
            end else LCol.W := tmpBRet.H;
            LCol.X := LArr2D.X + I* LCol.W;
            LCol.Y := LArr2D.Y;
            for J := 0 to tmpSheetRet.Reg[2].Y - 1 do
            begin
              LBlock := TFloatRect.Create;
              LBlock.W := tmpBRet.W;
              LBlock.H := tmpBRet.H;
              LBlock.Rotate := tmpSheetRet.Reg[2].R;
              LBlock.X := LCol.X;
              if not LBlock.Rotate then
              begin
                LBlock.Y := LCol.Y + J*LBlock.H;
                LCol.H := (J+1)* LBlock.H;
              end else
              begin
                LBlock.Y := LCol.Y + J*LBlock.W;
                LCol.H := (J+1)* LBlock.W;
              end;
              LCol.AddRow(LBlock);
            end;
            LArr2D.H := LCol.H;
            LArr2D.W := (I+1)* LCol.W ;
          end;
        end;
        {$ENDREGION}

        end;
        {$ENDREGION}

        FRet := LIRet;
      end;
      3:
      begin
        if (StrToFloatDef(edtBorderLeftRight.Text,0) < 0) or
           (StrToFloatDef(edtBorderTopBottom.Text,0) < 0)
        then
        begin
          ShowMessage('板边不能小于0');
          Exit;
        end;

        ACutParam := FRet.CutParam;
        OffsetW := FRet.CutParam.PnlBBorderLeftRightWidth - StrToFloatDef(edtBorderLeftRight.Text,0);
        OffsetH := FRet.CutParam.PnlBBorderTopBottomWidth - StrToFloatDef(edtBorderTopBottom.Text,0);
        ACutParam.PnlBBorderLeftRightWidth := StrToFloatDef(edtBorderLeftRight.Text,0);
        ACutParam.PnlBBorderTopBottomWidth := StrToFloatDef(edtBorderTopBottom.Text,0);
        tmpBRet := FRet.PnlBCalcRet;
        tmpBRet.W := tmpBRet.W - 2* OffsetW;
        tmpBRet.H := tmpBRet.H - 2* OffsetH;
        FRet.PnlBCalcRet := tmpBRet;
        tmpARet := FRet.PnlACalcRet;
        LIRet := TRet.Create;
        LIRet.CutParam := ACutParam;
        {$REGION 'PnlASetArr'}
        LIRet.PnlAW := tmpARet.W;
        LIRet.PnlAH := tmpARet.H;
        LIRet.PnlACalcZKReg := tmpARet.ZkReg;
        LIRet.PnlACalcRet := tmpARet;
        {$REGION 'Reg1'}
        LArr2D := LIRet.PnlABlockReg.AddReg();
        LArr2D.X := ACutParam.PnlABorderLeftRightWidth;
        LArr2D.Y := ACutParam.PnlABorderTopBottomWidth;
        if tmpARet.Reg[0].X * tmpARet.Reg[0].Y = 0 then
        begin
          LArr2D.W := 0;
          LArr2D.H := 0;
        end else
        begin
          for I := 0 to tmpARet.Reg[0].X - 1 do
          begin
            LCol := LArr2D.AddColum();
            if not tmpARet.Reg[0].R then
            begin
              LCol.W := ACutParam.PnlASetW;
            end else LCol.W := ACutParam.PnlASetH;
            LCol.X := LArr2D.X + I* (LCol.W+ ACutParam.PnlASetHorzSpace);
            LCol.Y := LArr2D.Y;
            for J := 0 to tmpARet.Reg[0].Y - 1 do
            begin
              LBlock := TFloatRect.Create;
              LBlock.W := ACutParam.PnlASetW;
              LBlock.H := ACutParam.PnlASetH;
              LBlock.Rotate := tmpARet.Reg[0].R;
              LBlock.X := LCol.X;
              if not LBlock.Rotate then
              begin
                LBlock.Y := LCol.Y + J*(LBlock.H+ ACutParam.PnlASetVertSpace);
                LCol.H := (J+1)* LBlock.H + J* ACutParam.PnlASetVertSpace;
              end else
              begin
                LBlock.Y := LCol.Y + J*(LBlock.W+ ACutParam.PnlASetVertSpace);
                LCol.H := (J+1)* LBlock.W + J* ACutParam.PnlASetVertSpace;
              end;
              LCol.AddRow(LBlock);
            end;
            LArr2D.H := LCol.H;
            LArr2D.W := (I+1)* LCol.W + I* ACutParam.PnlASetHorzSpace;
          end;
        end;
        {$ENDREGION}
        {$REGION 'Reg2'}
        LArr2D := LIRet.PnlABlockReg.AddReg();
        LArr2D.Y := ACutParam.PnlABorderTopBottomWidth;
        if (tmpARet.Reg[0].CellCount >0) and (tmpARet.Reg[2].CellCount > 0) then
        begin
          if tmpARet.Reg[2].M then
          begin
            if not tmpARet.Reg[0].R then
            begin
              LArr2D.X :=  ACutParam.PnlABorderLeftRightWidth +
                (ACutParam.PnlASetW+ ACutParam.PnlASetHorzSpace)* tmpARet.Reg[0].X;
            end else
            begin
              LArr2D.X :=  ACutParam.PnlABorderLeftRightWidth +
                (ACutParam.PnlASetH+ ACutParam.PnlASetHorzSpace)* tmpARet.Reg[0].X;
            end;
          end else
          begin
            if not tmpARet.Reg[0].R then
            begin
              LArr2D.X :=  ACutParam.PnlABorderLeftRightWidth +
                (ACutParam.PnlASetW+ ACutParam.PnlASetHorzSpace)* tmpARet.Reg[0].X;
            end else
            begin
              LArr2D.X :=  ACutParam.PnlABorderLeftRightWidth +
                (ACutParam.PnlASetH+ ACutParam.PnlASetHorzSpace)* tmpARet.Reg[0].X;
            end;
          end;
        end else
        if (tmpARet.Reg[0].CellCount =0) and (tmpARet.Reg[2].CellCount = 0) then
        begin
          LArr2D.X := ACutParam.PnlABorderLeftRightWidth;
          LArr2D.Y := ACutParam.PnlABorderTopBottomWidth;
        end else
        if (tmpARet.Reg[0].CellCount =0) and (tmpARet.Reg[2].CellCount > 0) then
        begin
          if tmpARet.Reg[1].M then
          begin
            if not tmpARet.Reg[2].R then
            begin
              LArr2D.X :=  ACutParam.PnlABorderLeftRightWidth +
                (ACutParam.PnlASetW+ ACutParam.PnlASetHorzSpace)* tmpARet.Reg[2].X;
            end else
            begin
              LArr2D.X :=  ACutParam.PnlABorderLeftRightWidth +
                (ACutParam.PnlASetH+ ACutParam.PnlASetHorzSpace)* tmpARet.Reg[2].X;
            end;
          end else
            LArr2D.X := ACutParam.PnlABorderLeftRightWidth;
        end else
        if (tmpARet.Reg[0].CellCount >0) and (tmpARet.Reg[2].CellCount = 0) then
        begin
          if not tmpARet.Reg[0].R then
          begin
            LArr2D.X :=  ACutParam.PnlABorderLeftRightWidth +
              (ACutParam.PnlASetW+ ACutParam.PnlASetHorzSpace)* tmpARet.Reg[0].X;
          end else
          begin
            LArr2D.X :=  ACutParam.PnlABorderLeftRightWidth +
              (ACutParam.PnlASetH+ ACutParam.PnlASetHorzSpace)* tmpARet.Reg[0].X;
          end;
        end;

        if tmpARet.Reg[1].X * tmpARet.Reg[1].Y = 0 then
        begin
          LArr2D.W := 0;
          LArr2D.H := 0;
        end else
        begin
          for I := 0 to tmpARet.Reg[1].X - 1 do
          begin
            LCol := LArr2D.AddColum();
            if not tmpARet.Reg[1].R then
            begin
              LCol.W := ACutParam.PnlASetW;
            end else LCol.W := ACutParam.PnlASetH;
            LCol.X := LArr2D.X + I* (LCol.W+ACutParam.PnlASetHorzSpace);
            LCol.Y := LArr2D.Y;
            for J := 0 to tmpARet.Reg[1].Y - 1 do
            begin
              LBlock := TFloatRect.Create;
              LBlock.W := ACutParam.PnlASetW;
              LBlock.H := ACutParam.PnlASetH;
              LBlock.Rotate := tmpARet.Reg[1].R;
              LBlock.X := LCol.X;
              if not LBlock.Rotate then
              begin
                LBlock.Y := LCol.Y + J*(LBlock.H+ ACutParam.PnlASetVertSpace);
                LCol.H := (J+1)* LBlock.H + J* ACutParam.PnlASetVertSpace;
              end else
              begin
                LBlock.Y := LCol.Y + J*(LBlock.W+ ACutParam.PnlASetVertSpace);
                LCol.H := (J+1)* LBlock.W + J* ACutParam.PnlASetVertSpace;
              end;
              LCol.AddRow(LBlock);
            end;
            LArr2D.H := LCol.H;
            LArr2D.W := (I+1)* LCol.W + I* ACutParam.PnlASetHorzSpace;
          end;
        end;
        {$ENDREGION}
        {$REGION 'Reg3'}
        LArr2D := LIRet.PnlABlockReg.AddReg();
        LArr2D.X := ACutParam.PnlABorderLeftRightWidth;
        if (tmpARet.Reg[0].CellCount = 0) and (tmpARet.Reg[1].CellCount = 0) then
        begin
          LArr2D.Y := ACutParam.PnlABorderTopBottomWidth;
        end else
        if (tmpARet.Reg[0].CellCount > 0) and (tmpARet.Reg[1].CellCount > 0) then
        begin
          if tmpARet.Reg[1].M then
          begin
            if not tmpARet.Reg[0].R then
            begin
              LArr2D.Y := ACutParam.PnlABorderTopBottomWidth +
                (ACutParam.PnlASetH+ ACutParam.PnlASetVertSpace)* tmpARet.Reg[0].Y;
            end else
            begin
              LArr2D.Y := ACutParam.PnlABorderTopBottomWidth +
                (ACutParam.PnlASetW+ ACutParam.PnlASetVertSpace)* tmpARet.Reg[0].Y;
            end;
          end else
          begin
            if not tmpARet.Reg[0].R then
            begin
              LArr2D.Y := ACutParam.PnlABorderTopBottomWidth +
                (ACutParam.PnlASetH+ ACutParam.PnlASetVertSpace)* tmpARet.Reg[0].Y;
            end else
            begin
              LArr2D.Y := ACutParam.PnlABorderTopBottomWidth +
                (ACutParam.PnlASetW+ ACutParam.PnlASetVertSpace)* tmpARet.Reg[0].Y;
            end;
          end;
        end else
        if (tmpARet.Reg[0].CellCount > 0) and (tmpARet.Reg[1].CellCount = 0) then
        begin
          if not tmpARet.Reg[0].R then
          begin
            LArr2D.Y := ACutParam.PnlABorderTopBottomWidth +
              (ACutParam.PnlASetH+ ACutParam.PnlASetVertSpace)* tmpARet.Reg[0].Y;
          end else
          begin
            LArr2D.Y := ACutParam.PnlABorderTopBottomWidth +
              (ACutParam.PnlASetW+ ACutParam.PnlASetVertSpace)* tmpARet.Reg[0].Y;
          end;
        end else
        if (tmpARet.Reg[0].CellCount = 0) and (tmpARet.Reg[1].CellCount > 0) then
        begin
          if tmpARet.Reg[1].M then
            LArr2D.Y := ACutParam.PnlABorderTopBottomWidth
          else
          if not tmpARet.Reg[1].R then
          begin
            LArr2D.Y := ACutParam.PnlABorderTopBottomWidth +
              (ACutParam.PnlASetH+ ACutParam.PnlASetVertSpace)* tmpARet.Reg[1].Y;
          end else
          begin
            LArr2D.Y := ACutParam.PnlABorderTopBottomWidth +
              (ACutParam.PnlASetW+ ACutParam.PnlASetVertSpace)* tmpARet.Reg[1].Y;
          end;
        end;

        if tmpARet.Reg[2].X * tmpARet.Reg[2].Y = 0 then
        begin
          LArr2D.W := 0;
          LArr2D.H := 0;
        end else
        begin
          for I := 0 to tmpARet.Reg[2].X - 1 do
          begin
            LCol := LArr2D.AddColum();
            if not tmpARet.Reg[2].R then
            begin
              LCol.W := ACutParam.PnlASetW;
            end else LCol.W := ACutParam.PnlASetH;
            LCol.X := LArr2D.X + I* (LCol.W +ACutParam.PnlASetHorzSpace);
            LCol.Y := LArr2D.Y;
            for J := 0 to tmpARet.Reg[2].Y - 1 do
            begin
              LBlock := TFloatRect.Create;
              LBlock.W := ACutParam.PnlASetW;
              LBlock.H := ACutParam.PnlASetH;
              LBlock.Rotate := tmpARet.Reg[2].R;
              LBlock.X := LCol.X;
              if not LBlock.Rotate then
              begin
                LBlock.Y := LCol.Y + J*(LBlock.H+ ACutParam.PnlASetVertSpace);
                LCol.H := (J+1)* LBlock.H + J* ACutParam.PnlASetVertSpace;
              end else
              begin
                LBlock.Y := LCol.Y + J*(LBlock.W+ ACutParam.PnlASetVertSpace);
                LCol.H := (J+1)* LBlock.W + J* ACutParam.PnlASetVertSpace;
              end;
              LCol.AddRow(LBlock);
            end;
            LArr2D.H := LCol.H;
            LArr2D.W := (I+1)* LCol.W + I* ACutParam.PnlASetHorzSpace;
          end;
        end;
        {$ENDREGION}
        {$ENDREGION}
        {$REGION 'PnlBSetArr'}
        if tmpARet.PnlBIndex <> -1 then
        begin
          tmpBRet := FRet.PnlBCalcRet;
          LIRet.PnlBW := tmpBRet.W;
          LIRet.PnlBH := tmpBRet.H;
          LIRet.PnlBCalcZKReg := tmpBRet.ZkReg;
          LIRet.PnlBCalcRet := tmpBRet;
        {$REGION 'Reg1'}
          LArr2D := LIRet.PnlBBlockReg.AddReg();
          LArr2D.X := ACutParam.PnlBBorderLeftRightWidth;
          LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth;
          if tmpBRet.Reg[0].X * tmpBRet.Reg[0].Y = 0 then
          begin
            LArr2D.W := 0;
            LArr2D.H := 0;
          end else
          begin
            for I := 0 to tmpBRet.Reg[0].X - 1 do
            begin
              LCol := LArr2D.AddColum();
              if not tmpBRet.Reg[0].R then
              begin
                LCol.W := ACutParam.PnlBSetW;
              end else LCol.W := ACutParam.PnlBSetH;
              LCol.X := LArr2D.X + I* (LCol.W+ ACutParam.PnlBSetHorzSpace);
              LCol.Y := LArr2D.Y;
              for J := 0 to tmpBRet.Reg[0].Y - 1 do
              begin
                LBlock := TFloatRect.Create;
                LBlock.W := ACutParam.PnlBSetW;
                LBlock.H := ACutParam.PnlBSetH;
                LBlock.Rotate := tmpBRet.Reg[0].R;
                LBlock.X := LCol.X;
                if not LBlock.Rotate then
                begin
                  LBlock.Y := LCol.Y + J*(LBlock.H+ ACutParam.PnlBSetVertSpace);
                  LCol.H := (J+1)* LBlock.H + J* ACutParam.PnlBSetVertSpace;
                end else
                begin
                  LBlock.Y := LCol.Y + J*(LBlock.W+ ACutParam.PnlBSetVertSpace);
                  LCol.H := (J+1)* LBlock.W + J* ACutParam.PnlBSetVertSpace;
                end;
                LCol.AddRow(LBlock);
              end;
              LArr2D.H := LCol.H;
              LArr2D.W := (I+1)* LCol.W + I* ACutParam.PnlBSetHorzSpace;
            end;
          end;
        {$ENDREGION}
        {$REGION 'Reg2'}
        LArr2D := LIRet.PnlBBlockReg.AddReg();
        LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth;
        if (tmpBRet.Reg[0].CellCount >0) and (tmpBRet.Reg[2].CellCount > 0) then
        begin
          if tmpBRet.Reg[2].M then
          begin
            if not tmpBRet.Reg[0].R then
            begin
              LArr2D.X :=  ACutParam.PnlBBorderLeftRightWidth +
                (ACutParam.PnlBSetW+ ACutParam.PnlBSetHorzSpace)* tmpBRet.Reg[0].X;
            end else
            begin
              LArr2D.X :=  ACutParam.PnlBBorderLeftRightWidth +
                (ACutParam.PnlBSetH+ ACutParam.PnlBSetHorzSpace)* tmpBRet.Reg[0].X;
            end;
          end else
          begin
            if not tmpBRet.Reg[0].R then
            begin
              LArr2D.X :=  ACutParam.PnlBBorderLeftRightWidth +
                (ACutParam.PnlBSetW+ ACutParam.PnlBSetHorzSpace)* tmpBRet.Reg[0].X;
            end else
            begin
              LArr2D.X :=  ACutParam.PnlBBorderLeftRightWidth +
                (ACutParam.PnlBSetH+ ACutParam.PnlBSetHorzSpace)* tmpBRet.Reg[0].X;
            end;
          end;
        end else
        if (tmpBRet.Reg[0].CellCount =0) and (tmpBRet.Reg[2].CellCount = 0) then
        begin
          LArr2D.X := ACutParam.PnlBBorderLeftRightWidth;
          LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth;
        end else
        if (tmpBRet.Reg[0].CellCount =0) and (tmpBRet.Reg[2].CellCount > 0) then
        begin
          if tmpBRet.Reg[1].M then
          begin
            if not tmpBRet.Reg[2].R then
            begin
              LArr2D.X :=  ACutParam.PnlBBorderLeftRightWidth +
                (ACutParam.PnlBSetW+ ACutParam.PnlBSetHorzSpace)* tmpBRet.Reg[2].X;
            end else
            begin
              LArr2D.X :=  ACutParam.PnlBBorderLeftRightWidth +
                (ACutParam.PnlBSetH+ ACutParam.PnlBSetHorzSpace)* tmpBRet.Reg[2].X;
            end;
          end else
            LArr2D.X := ACutParam.PnlBBorderLeftRightWidth;
        end else
        if (tmpBRet.Reg[0].CellCount >0) and (tmpBRet.Reg[2].CellCount = 0) then
        begin
          if not tmpBRet.Reg[0].R then
          begin
            LArr2D.X :=  ACutParam.PnlBBorderLeftRightWidth +
              (ACutParam.PnlBSetW+ ACutParam.PnlBSetHorzSpace)* tmpBRet.Reg[0].X;
          end else
          begin
            LArr2D.X :=  ACutParam.PnlBBorderLeftRightWidth +
              (ACutParam.PnlBSetH+ ACutParam.PnlBSetHorzSpace)* tmpBRet.Reg[0].X;
          end;
        end;

        if tmpBRet.Reg[1].X * tmpBRet.Reg[1].Y = 0 then
        begin
          LArr2D.W := 0;
          LArr2D.H := 0;
        end else
        begin
          for I := 0 to tmpBRet.Reg[1].X - 1 do
          begin
            LCol := LArr2D.AddColum();
            if not tmpBRet.Reg[1].R then
            begin
              LCol.W := ACutParam.PnlBSetW;
            end else LCol.W := ACutParam.PnlBSetH;
            LCol.X := LArr2D.X + I* (LCol.W+ACutParam.PnlBSetHorzSpace);
            LCol.Y := LArr2D.Y;
            for J := 0 to tmpBRet.Reg[1].Y - 1 do
            begin
              LBlock := TFloatRect.Create;
              LBlock.W := ACutParam.PnlBSetW;
              LBlock.H := ACutParam.PnlBSetH;
              LBlock.Rotate := tmpBRet.Reg[1].R;
              LBlock.X := LCol.X;
              if not LBlock.Rotate then
              begin
                LBlock.Y := LCol.Y + J*(LBlock.H+ ACutParam.PnlBSetVertSpace);
                LCol.H := (J+1)* LBlock.H + J* ACutParam.PnlBSetVertSpace;
              end else
              begin
                LBlock.Y := LCol.Y + J*(LBlock.W+ ACutParam.PnlBSetVertSpace);
                LCol.H := (J+1)* LBlock.W + J* ACutParam.PnlBSetVertSpace;
              end;
              LCol.AddRow(LBlock);
            end;
            LArr2D.H := LCol.H;
            LArr2D.W := (I+1)* LCol.W + I* ACutParam.PnlBSetHorzSpace;
          end;
        end;
        {$ENDREGION}
        {$REGION 'Reg3'}
        LArr2D := LIRet.PnlBBlockReg.AddReg();
        LArr2D.X := ACutParam.PnlBBorderLeftRightWidth;
        if (tmpBRet.Reg[0].CellCount = 0) and (tmpBRet.Reg[1].CellCount = 0) then
        begin
          LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth;
        end else
        if (tmpBRet.Reg[0].CellCount > 0) and (tmpBRet.Reg[1].CellCount > 0) then
        begin
          if tmpBRet.Reg[1].M then
          begin
            if not tmpBRet.Reg[0].R then
            begin
              LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth +
                (ACutParam.PnlBSetH+ ACutParam.PnlBSetVertSpace)* tmpBRet.Reg[0].Y;
            end else
            begin
              LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth +
                (ACutParam.PnlBSetW+ ACutParam.PnlBSetVertSpace)* tmpBRet.Reg[0].Y;
            end;
          end else
          begin
            if not tmpBRet.Reg[0].R then
            begin
              LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth +
                (ACutParam.PnlBSetH+ ACutParam.PnlBSetVertSpace)* tmpBRet.Reg[0].Y;
            end else
            begin
              LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth +
                (ACutParam.PnlBSetW+ ACutParam.PnlBSetVertSpace)* tmpBRet.Reg[0].Y;
            end;
          end;
        end else
        if (tmpBRet.Reg[0].CellCount > 0) and (tmpBRet.Reg[1].CellCount = 0) then
        begin
          if not tmpBRet.Reg[0].R then
          begin
            LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth +
              (ACutParam.PnlBSetH+ ACutParam.PnlBSetVertSpace)* tmpBRet.Reg[0].Y;
          end else
          begin
            LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth +
              (ACutParam.PnlBSetW+ ACutParam.PnlBSetVertSpace)* tmpBRet.Reg[0].Y;
          end;
        end else
        if (tmpBRet.Reg[0].CellCount = 0) and (tmpBRet.Reg[1].CellCount > 0) then
        begin
          if tmpBRet.Reg[1].M then
            LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth
          else
          if not tmpBRet.Reg[1].R then
          begin
            LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth +
              (ACutParam.PnlBSetH+ ACutParam.PnlBSetVertSpace)* tmpBRet.Reg[1].Y;
          end else
          begin
            LArr2D.Y := ACutParam.PnlBBorderTopBottomWidth +
              (ACutParam.PnlBSetW+ ACutParam.PnlBSetVertSpace)* tmpBRet.Reg[1].Y;
          end;
        end;

        if tmpBRet.Reg[2].X * tmpBRet.Reg[2].Y = 0 then
        begin
          LArr2D.W := 0;
          LArr2D.H := 0;
        end else
        begin
          for I := 0 to tmpBRet.Reg[2].X - 1 do
          begin
            LCol := LArr2D.AddColum();
            if not tmpBRet.Reg[2].R then
            begin
              LCol.W := ACutParam.PnlBSetW;
            end else LCol.W := ACutParam.PnlBSetH;
            LCol.X := LArr2D.X + I* (LCol.W +ACutParam.PnlBSetHorzSpace);
            LCol.Y := LArr2D.Y;
            for J := 0 to tmpBRet.Reg[2].Y - 1 do
            begin
              LBlock := TFloatRect.Create;
              LBlock.W := ACutParam.PnlBSetW;
              LBlock.H := ACutParam.PnlBSetH;
              LBlock.Rotate := tmpBRet.Reg[2].R;
              LBlock.X := LCol.X;
              if not LBlock.Rotate then
              begin
                LBlock.Y := LCol.Y + J*(LBlock.H+ ACutParam.PnlBSetVertSpace);
                LCol.H := (J+1)* LBlock.H + J* ACutParam.PnlBSetVertSpace;
              end else
              begin
                LBlock.Y := LCol.Y + J*(LBlock.W+ ACutParam.PnlBSetVertSpace);
                LCol.H := (J+1)* LBlock.W + J* ACutParam.PnlBSetVertSpace;
              end;
              LCol.AddRow(LBlock);
            end;
            LArr2D.H := LCol.H;
            LArr2D.W := (I+1)* LCol.W + I* ACutParam.PnlBSetHorzSpace;
          end;
        end;
        {$ENDREGION}

        end;
        {$ENDREGION}
        {$REGION 'SheetAArr'}
        if tmpARet.SheetAIndex <> -1 then
        begin
          tmpSheetRet := FRet.SheetACalcRet;
          LIRet.SheetW := ACutParam.SheetW;
          LIRet.SheetAW := tmpSheetRet.W;
          LIRet.SheetH := ACutParam.SheetH;
          LIRet.SheetACalcRet := tmpSheetRet;
        {$REGION 'Reg1'}
          LArr2D := LIRet.SheetABlockReg.AddReg();
          LArr2D.X := 0;
          LArr2D.Y := 0;
          if tmpSheetRet.Reg[0].X * tmpSheetRet.Reg[0].Y = 0 then
          begin
            LArr2D.W := 0;
            LArr2D.H := 0;
          end else
          begin
            for I := 0 to tmpSheetRet.Reg[0].X - 1 do
            begin
              LCol := LArr2D.AddColum();
              if not tmpSheetRet.Reg[0].R then
              begin
                LCol.W := tmpARet.W
              end else LCol.W := tmpARet.H;
              LCol.X := LArr2D.X + I* LCol.W;
              LCol.Y := LArr2D.Y;
              for J := 0 to tmpSheetRet.Reg[0].Y - 1 do
              begin
                LBlock := TFloatRect.Create;
                LBlock.W := tmpARet.W;
                LBlock.H := tmpARet.H;
                LBlock.Rotate := tmpSheetRet.Reg[0].R;
                LBlock.X := LCol.X;
                if not LBlock.Rotate then
                begin
                  LBlock.Y := LCol.Y + J*LBlock.H;
                  LCol.H := (J+1)* LBlock.H;
                end else
                begin
                  LBlock.Y := LCol.Y + J*LBlock.W;
                  LCol.H := (J+1)* LBlock.W;
                end;
                LCol.AddRow(LBlock);
              end;
              LArr2D.H := LCol.H;
              LArr2D.W := (I+1)* LCol.W;
            end;
          end;
        {$ENDREGION}
        {$REGION 'Reg2'}
        LArr2D := LIRet.SheetABlockReg.AddReg();
        if tmpSheetRet.Reg[0].X* tmpSheetRet.Reg[0].Y > 0 then
        begin
          LArr2D.X := LIRet.SheetABlockReg.Reg[0].X + LIRet.SheetABlockReg.Reg[0].W;
          LArr2D.Y := 0;
        end else
        begin
          LArr2D.X := 0;
          LArr2D.Y := 0;
        end;
        if tmpSheetRet.Reg[1].X * tmpSheetRet.Reg[1].Y = 0 then
        begin
          LArr2D.W := 0;
          LArr2D.H := 0;
        end else
        begin
          for I := 0 to tmpSheetRet.Reg[1].X - 1 do
          begin
            LCol := LArr2D.AddColum();
            if not tmpSheetRet.Reg[1].R then
            begin
              LCol.W := tmpARet.W
            end else LCol.W := tmpARet.H;
            LCol.X := LArr2D.X + I* LCol.W;
            LCol.Y := LArr2D.Y;
            for J := 0 to tmpSheetRet.Reg[1].Y - 1 do
            begin
              LBlock := TFloatRect.Create;
              LBlock.W := tmpARet.W;
              LBlock.H := tmpARet.H;
              LBlock.Rotate := tmpSheetRet.Reg[1].R;
              LBlock.X := LCol.X;
              if not LBlock.Rotate then
              begin
                LBlock.Y := LCol.Y + J*LBlock.H;
                LCol.H := (J+1)* LBlock.H;
              end else
              begin
                LBlock.Y := LCol.Y + J*LBlock.W ;
                LCol.H := (J+1)* LBlock.W;
              end;
              LCol.AddRow(LBlock);
            end;
            LArr2D.H := LCol.H;
            LArr2D.W := (I+1)* LCol.W;
          end;
        end;
        {$ENDREGION}
        {$REGION 'Reg3'}
        LArr2D := LIRet.SheetABlockReg.AddReg();
        if tmpSheetRet.Reg[0].X* tmpSheetRet.Reg[0].Y > 0 then
        begin
          LArr2D.X := 0;
          LArr2D.Y := LIRet.SheetABlockReg.Reg[0].Y + LIRet.SheetABlockReg.Reg[0].H;
        end else
        begin
          LArr2D.X := 0;
          LArr2D.Y := 0;
        end;
        if tmpSheetRet.Reg[2].X * tmpSheetRet.Reg[2].Y = 0 then
        begin
          LArr2D.W := 0;
          LArr2D.H := 0;
        end else
        begin
          for I := 0 to tmpSheetRet.Reg[2].X - 1 do
          begin
            LCol := LArr2D.AddColum();
            if not tmpSheetRet.Reg[2].R then
            begin
              LCol.W := tmpARet.W
            end else LCol.W := tmpARet.H;
            LCol.X := LArr2D.X + I* LCol.W;
            LCol.Y := LArr2D.Y;
            for J := 0 to tmpSheetRet.Reg[2].Y - 1 do
            begin
              LBlock := TFloatRect.Create;
              LBlock.W := tmpARet.W;
              LBlock.H := tmpARet.H;
              LBlock.Rotate := tmpSheetRet.Reg[2].R;
              LBlock.X := LCol.X;
              if not LBlock.Rotate then
              begin
                LBlock.Y := LCol.Y + J*LBlock.H;
                LCol.H := (J+1)* LBlock.H;
              end else
              begin
                LBlock.Y := LCol.Y + J*LBlock.W;
                LCol.H := (J+1)* LBlock.W;
              end;
              LCol.AddRow(LBlock);
            end;
            LArr2D.H := LCol.H;
            LArr2D.W := (I+1)* LCol.W ;
          end;
        end;
        {$ENDREGION}
        end;
        {$ENDREGION}
        {$REGION 'SheetBArr'}
        if tmpARet.SheetBIndex <> -1 then
        begin
          tmpSheetRet := FRet.SheetBCalcRet;
          LIRet.SheetBW := tmpSheetRet.W;
          LIRet.SheetBCalcRet := tmpSheetRet;
          tmpBRet := FRet.PnlBCalcRet;
        {$REGION 'Reg1'}
          LArr2D := LIRet.SheetBBlockReg.AddReg();
          LArr2D.X := LIRet.SheetAW;
          LArr2D.Y := 0;
          if tmpSheetRet.Reg[0].X * tmpSheetRet.Reg[0].Y = 0 then
          begin
            LArr2D.W := 0;
            LArr2D.H := 0;
          end else
          begin
            for I := 0 to tmpSheetRet.Reg[0].X - 1 do
            begin
              LCol := LArr2D.AddColum();
              if not tmpSheetRet.Reg[0].R then
              begin
                LCol.W := tmpBRet.W
              end else LCol.W := tmpBRet.H;
              LCol.X := LArr2D.X + I* LCol.W;
              LCol.Y := LArr2D.Y;
              for J := 0 to tmpSheetRet.Reg[0].Y - 1 do
              begin
                LBlock := TFloatRect.Create;
                LBlock.W := tmpBRet.W;
                LBlock.H := tmpBRet.H;
                LBlock.Rotate := tmpSheetRet.Reg[0].R;
                LBlock.X := LCol.X;
                if not LBlock.Rotate then
                begin
                  LBlock.Y := LCol.Y + J*LBlock.H;
                  LCol.H := (J+1)* LBlock.H;
                end else
                begin
                  LBlock.Y := LCol.Y + J*LBlock.W;
                  LCol.H := (J+1)* LBlock.W;
                end;
                LCol.AddRow(LBlock);
              end;
              LArr2D.H := LCol.H;
              LArr2D.W := (I+1)* LCol.W;
            end;
          end;
        {$ENDREGION}
        {$REGION 'Reg2'}
        LArr2D := LIRet.SheetBBlockReg.AddReg();
        if tmpSheetRet.Reg[0].X* tmpSheetRet.Reg[0].Y > 0 then
        begin
          LArr2D.X := LIRet.SheetBBlockReg.Reg[0].X + LIRet.SheetBBlockReg.Reg[0].W;
          LArr2D.Y := 0;
        end else
        begin
          LArr2D.X := LIRet.SheetAW;
          LArr2D.Y := 0;
        end;
        if tmpSheetRet.Reg[1].X * tmpSheetRet.Reg[1].Y = 0 then
        begin
          LArr2D.W := 0;
          LArr2D.H := 0;
        end else
        begin
          for I := 0 to tmpSheetRet.Reg[1].X - 1 do
          begin
            LCol := LArr2D.AddColum();
            if not tmpSheetRet.Reg[1].R then
            begin
              LCol.W := tmpBRet.W
            end else LCol.W := tmpBRet.H;
            LCol.X := LArr2D.X + I* LCol.W;
            LCol.Y := LArr2D.Y;
            for J := 0 to tmpSheetRet.Reg[1].Y - 1 do
            begin
              LBlock := TFloatRect.Create;
              LBlock.W := tmpBRet.W;
              LBlock.H := tmpBRet.H;
              LBlock.Rotate := tmpSheetRet.Reg[1].R;
              LBlock.X := LCol.X;
              if not LBlock.Rotate then
              begin
                LBlock.Y := LCol.Y + J*LBlock.H;
                LCol.H := (J+1)* LBlock.H;
              end else
              begin
                LBlock.Y := LCol.Y + J*LBlock.W ;
                LCol.H := (J+1)* LBlock.W;
              end;
              LCol.AddRow(LBlock);
            end;
            LArr2D.H := LCol.H;
            LArr2D.W := (I+1)* LCol.W;
          end;
        end;
        {$ENDREGION}
        {$REGION 'Reg3'}
        LArr2D := LIRet.SheetBBlockReg.AddReg();
        if tmpSheetRet.Reg[0].X* tmpSheetRet.Reg[0].Y > 0 then
        begin
          LArr2D.X := LIRet.SheetAW;
          LArr2D.Y := LIRet.SheetBBlockReg.Reg[0].Y + LIRet.SheetBBlockReg.Reg[0].H;
        end else
        begin
          LArr2D.X := LIRet.SheetAW;
          LArr2D.Y := 0;
        end;
        if tmpSheetRet.Reg[2].X * tmpSheetRet.Reg[2].Y = 0 then
        begin
          LArr2D.W := 0;
          LArr2D.H := 0;
        end else
        begin
          for I := 0 to tmpSheetRet.Reg[2].X - 1 do
          begin
            LCol := LArr2D.AddColum();
            if not tmpSheetRet.Reg[2].R then
            begin
              LCol.W := tmpBRet.W
            end else LCol.W := tmpBRet.H;
            LCol.X := LArr2D.X + I* LCol.W;
            LCol.Y := LArr2D.Y;
            for J := 0 to tmpSheetRet.Reg[2].Y - 1 do
            begin
              LBlock := TFloatRect.Create;
              LBlock.W := tmpBRet.W;
              LBlock.H := tmpBRet.H;
              LBlock.Rotate := tmpSheetRet.Reg[2].R;
              LBlock.X := LCol.X;
              if not LBlock.Rotate then
              begin
                LBlock.Y := LCol.Y + J*LBlock.H;
                LCol.H := (J+1)* LBlock.H;
              end else
              begin
                LBlock.Y := LCol.Y + J*LBlock.W;
                LCol.H := (J+1)* LBlock.W;
              end;
              LCol.AddRow(LBlock);
            end;
            LArr2D.H := LCol.H;
            LArr2D.W := (I+1)* LCol.W ;
          end;
        end;
        {$ENDREGION}

        end;
        {$ENDREGION}

        FRet := LIRet;
      end;
    end;
    AddJustRegPos(FRet,ACutParam);
    pbEdit.Invalidate;
  end else
    ShowMessage('板边数值设置不正确！');
  *)
end;

procedure TfrmEdit.btnUnCustomDrawClick(Sender: TObject);
var
  AList: TList<ICustomDrawData>;
begin
  case FIndex of
    1: AList := FRet.SheetCustomDrawList;
    2: AList := FRet.PnlACustomDrawList;
    3: AList := FRet.PnlBCustomDrawList;
  else
    Exit;
  end;
  if AList.Count > 0 then AList.Delete(AList.Count-1);
  pbEdit.Invalidate;
end;

procedure TfrmEdit.cbxDWKClick(Sender: TObject);
var
  LKong: TDWKong;
begin
  LKong.XDKong := cbxXDK.Checked;
  LKong.PXGGKong := cbxPXGG.Checked;
  LKong.JDKong := cbxJDK.Checked;
  LKong.BaBiao := cbxBB.Checked;
  case FIndex of
    1:;
    2:
    begin
      FRet.PnlADWKong := LKong;
    end;
    3:
    begin
      FRet.PnlBDWKong := LKong;
    end;
  end;
  pbEdit.Invalidate;
end;

procedure TfrmEdit.CustomImgEnableSet;
var
  B: Boolean;
  I: Integer;
begin
  case FIndex of
    1: B := FRet.CustomSheetImg = nil;
    2: B := FRet.CustomPnlAImg = nil;
    3: B := FRet.CustomPnlBImg = nil;
  else
    Exit;
  end;
  if not B then
  begin
    for I := 0 to cpnl1.Panels.Count - 1 do
    begin
      if TCategoryPanel(cpnl1.Panels.Items[I]).Tag <> 1 then
      begin
        TCategoryPanel(cpnl1.Panels.Items[I]).Enabled := False;
        TCategoryPanel(cpnl1.Panels.Items[I]).Visible := False;
      end
      else
        TCategoryPanel(cpnl1.Panels.Items[I]).Expand;
    end;
  end;
end;

procedure TfrmEdit.btnOKClick(Sender: TObject);
begin
  case FIndex of
    1:
    begin
      if FRet.CustomSheetImg <> nil then
        FDrawEng.DrawCustomShape(FRet.CustomSheetImg as IGPBitMap,FRet.SheetCustomDrawList);
    end;
    2:
    begin
      if FRet.CustomPnlAImg <> nil then
        FDrawEng.DrawCustomShape(FRet.CustomPnlAImg as IGPBitMap,FRet.PnlACustomDrawList);
    end;
    3:
    begin
      if FRet.CustomPnlBImg <> nil then
        FDrawEng.DrawCustomShape(FRet.CustomPnlBImg as IGPBitMap,FRet.PnlBCustomDrawList);
    end;
  end;
  FRet.CopyRet(FRet,FOldRet);
  ModalResult := mrOk;
end;

procedure TfrmEdit.btnSaveImgClick(Sender: TObject);
var
  LSvDG: TSaveDialog;
begin
  LSvDG := TSaveDialog.Create(Self);
  LSvDG.DefaultExt := '.JPG';
  LSvDG.Filter := '所有JPG|.JPG';
  try
    if LSvDG.Execute then
    begin
      FDrawEng.SaveImgFile(FIndex,LSvDG.FileName);
    end;
  finally
    LSvDG.Free;
  end;
end;

procedure TfrmEdit.btn2Click(Sender: TObject);
var
  LOpDG: TOpenDialog;
begin
  LOpDG := TOpenDialog.Create(Self);
  LOpDG.Filter := '所有JPG|*.JPG';
  try
    if LOpDG.Execute then
    begin
      try
        case FIndex of
          1:
          begin
            FRet.CustomSheetImg := TGPBitmap.Create(LOpDG.FileName);
            FRet.SheetCustomDrawList.Clear;
          end;
          2:
          begin
            FRet.CustomPnlAImg := TGPBitmap.Create(LOpDG.FileName);
            FRet.PnlACustomDrawList.Clear;
          end;
          3:
          begin
            FRet.CustomPnlBImg := TGPBitmap.Create(LOpDG.FileName);
            FRet.PnlBCustomDrawList.Clear;
          end;
        end;
        CustomImgEnableSet;
        pbEdit.Invalidate;
      except
        ShowMessage('文件格式不正确，请导入BMP或者JPG');
      end;
    end;
  finally
    LOpDG.Free;
  end;
end;

procedure TfrmEdit.btnCBCustomOKClick(Sender: TObject);
var
  LBlock: IFloatRect;
begin
  for LBlock in FSelectList do
    LBlock.Data := cbbCBCustom.ItemIndex;
  pbEdit.Invalidate;
end;

procedure TfrmEdit.btnCBHorOKClick(Sender: TObject);
var
  LArr2D: IBlockArr2D;
  LCOl: IBlockColum;
  LBlock: IFloatRect;
begin
  case FIndex of
    1:
    begin

    end;
    2:
    begin
      for LArr2D in FRet.PnlABlockReg.RegList do
      begin
        for LCOl in LArr2D.Colums do
        begin
          for LBlock in LCOl.Rows do
          begin
            if not LBlock.Rotate then
              LBlock.Data := cbbCBHor.ItemIndex;
          end;
        end;
      end;
    end;
    3:
    begin
      for LArr2D in FRet.PnlBBlockReg.RegList do
      begin
        for LCOl in LArr2D.Colums do
        begin
          for LBlock in LCOl.Rows do
          begin
            if not LBlock.Rotate then
              LBlock.Data := cbbCBHor.ItemIndex;
          end;
        end;
      end;
    end;
  end;
  pbEdit.Invalidate;
end;

procedure TfrmEdit.btnCBVerOKClick(Sender: TObject);
var
  LArr2D: IBlockArr2D;
  LCOl: IBlockColum;
  LBlock: IFloatRect;
begin
  case FIndex of
    1:
    begin

    end;
    2:
    begin
      for LArr2D in FRet.PnlABlockReg.RegList do
      begin
        for LCOl in LArr2D.Colums do
        begin
          for LBlock in LCOl.Rows do
          begin
            if LBlock.Rotate then
              LBlock.Data := cbbCBVer.ItemIndex;
          end;
        end;
      end;
    end;
    3:
    begin
      for LArr2D in FRet.PnlBBlockReg.RegList do
      begin
        for LCOl in LArr2D.Colums do
        begin
          for LBlock in LCOl.Rows do
          begin
            if LBlock.Rotate then
              LBlock.Data := cbbCBVer.ItemIndex;
          end;
        end;
      end;
    end;
  end;
  pbEdit.Invalidate;
end;

procedure TfrmEdit.btnMoveDownClick(Sender: TObject);
var
  LBlock: IFloatRect;
begin
  for LBlock in FSelectList do
    LBlock.Y := LBlock.Y + StrToFloatDef(edtMoveStep.Text,0);
  pbEdit.Invalidate;
end;

procedure TfrmEdit.btnMoveLeftClick(Sender: TObject);
var
  LBlock: IFloatRect;
begin
  for LBlock in FSelectList do
    LBlock.X := LBlock.X - StrToFloatDef(edtMoveStep.Text,0);
  pbEdit.Invalidate;
end;

procedure TfrmEdit.btnMoveRightClick(Sender: TObject);
var
  LBlock: IFloatRect;
begin
  for LBlock in FSelectList do
    LBlock.X := LBlock.X + StrToFloatDef(edtMoveStep.Text,0);
  pbEdit.Invalidate;
end;

procedure TfrmEdit.btnMoveUpClick(Sender: TObject);
var
  LBlock: IFloatRect;
begin
  for LBlock in FSelectList do
    LBlock.Y := LBlock.Y - StrToFloatDef(edtMoveStep.Text,0);
  pbEdit.Invalidate;
end;

procedure TfrmEdit.edtExit(Sender: TObject);
var
  n: Double;
begin
  try
    n := StrToFloat((Sender as TEdit).Text);
    if n < 0 then raise(Exception.Create(''));
    (Sender as TEdit).Color := clInfoBk;
    (Sender as TEdit).Tag := 1;
  except
    (Sender as TEdit).Color := clRed;
    (Sender as TEdit).Tag := -1;
  end;
end;

procedure TfrmEdit.FormCreate(Sender: TObject);
begin
  FSelectList := TList<IFloatRect>.Create;
end;

procedure TfrmEdit.FormDestroy(Sender: TObject);
begin
  FSelectList.Free;
end;

procedure TfrmEdit.FormResize(Sender: TObject);
begin
  pbEdit.Left := pnl2.Left + (pnl2.Width - pbEdit.Width) div 2;
  pbEdit.Top := pnl2.Top + (pnl2.Height - pbEdit.Height) div 2;
end;

procedure TfrmEdit.mniN1Click(Sender: TObject);
var
  LData: ICustomDrawData;
begin
  LData := TCustomDrawData.Create;
  LData.ID := FRet.SheetCustomDrawList.Count;
  LData.ShapeType := csStr;
  LData.StrSize := cbxCustomDrawStrSize.ItemIndex*3 + 12;
  LData.Str := edtCustomDrawStr.Text;
  LData.DrawReg := Rect(FStrPoint,Point(0,0));
  case FIndex of
    1:
    begin
      FRet.SheetCustomDrawList.Add(LData);
    end;
    2:
    begin
      FRet.PnlACustomDrawList.Add(LData);
    end;
    3:
    begin
      FRet.PnlBCustomDrawList.Add(LData);
    end;
  end;
  pbEdit.Invalidate;
end;

procedure TfrmEdit.pbEditMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  LList: TList<ICustomDrawData>;
  LData: ICustomDrawData;
begin
  if Button = mbLeft then
  begin
    FMouseDownFlag := True;
    FMouseDownX := X;
    FMouseDownY := Y;
    case FIndex of
      1: LList := FRet.SheetCustomDrawList;
      2: LList := FRet.PnlACustomDrawList;
      3: LList := FRet.PnlBCustomDrawList;
    else
      Exit;
    end;
    if cbxBeginCustomDraw.Checked then
    begin
      FCustomDrawID := LList.Count;
      LData := TCustomDrawData.Create;
      LData.ID := FCustomDrawID;
      LData.ShapeType := TCustomShape(cbxShapeType.ItemIndex);
      LData.PenWidth := 1+ cbxPenWidth.ItemIndex*2;
      LData.PenColor := clrbxShapeColor.Selected;
      LList.Add(LData);
    end;
  end;
end;

procedure TfrmEdit.pbEditMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  LList: TList<ICustomDrawData>;
  LData: ICustomDrawData;
begin
  if FMouseDownFlag then
  begin
    FMouseNowX := X;
    FMouseNowY := Y;
    if cbxBeginCustomDraw.Checked then
    begin
      case FIndex of
        1: LList := FRet.SheetCustomDrawList;
        2: LList := FRet.PnlACustomDrawList;
        3: LList := FRet.PnlBCustomDrawList;
      else
        Exit;
      end;
      for LData in LList do
      begin
        if LData.ID = FCustomDrawID then
        begin
          case LData.ShapeType of
            csLine,csArrowLine:
            begin
              LData.DrawReg := Rect(FMouseDownX,FMouseDownY,X,Y);
            end;
            csYuan,csRect,csSanJiao,csXiangPi:
            begin
              LData.DrawReg := Rect(Min(FMouseDownX,X),
                Min(FMouseDownY,Y),
                Max(FMouseDownX,X),
                Max(FMouseDownY,Y)
              )
            end;
            csStr: ;
          else
            Exit;
          end;
        end;
      end;
    end;
    pbEdit.Invalidate;
  end;
end;

procedure TfrmEdit.pbEditMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if FMouseDownFlag then
  begin
    FMouseDownFlag := False;
    if not cbxBeginCustomDraw.Checked then
      FDrawEng.GetInRectBlock(FRet,FIndex,Point(FMouseDownX,FMouseDownY),
        Point(X,Y),FSelectList )
    else
    begin

    end;
  end;
  pbEdit.Invalidate;
end;

procedure TfrmEdit.pbEditPaint(Sender: TObject);
var
  bCustom: Boolean;
begin
  case FIndex of
    1:
    begin
      bCustom := FRet.CustomSheetImg <> nil;
      if not bCustom then FDrawEng.DrawSheet(FRet);
    end;
    2:
    begin
      bCustom := FRet.CustomPnlAImg <> nil;
      if not bCustom then FDrawEng.DrawPnlA(FRet);
    end;
    3:
    begin
      bCustom := FRet.CustomPnlBImg <> nil;
      if not bCustom then FDrawEng.DrawPnlB(FRet);
    end
  else
    bCustom := False;
  end;

  if not bCustom then
  begin
    FDrawEng.DrawNote(FRet);
    case FIndex of
      1: FDrawEng.DrawCustomShape(1,FRet.SheetCustomDrawList);
      2: FDrawEng.DrawCustomShape(2,FRet.PnlACustomDrawList);
      3: FDrawEng.DrawCustomShape(3,FRet.PnlBCustomDrawList);
    end;
  end;

  case FIndex of
    1:
    begin
      if not bCustom then
      begin
        FDrawEng.StrectDraw(FDrawEng.GetGPBitMap(1),pbEdit.Canvas.Handle,
          pbEdit.Width, pbEdit.Height);
      end else
      begin
        FDrawEng.StrectDraw(FRet.CustomSheetImg as IGPBitMap,pbEdit.Canvas.Handle,
          pbEdit.Width,pbEdit.Height);
        FDrawEng.DrawCustomShape(pbEdit.Canvas.Handle,FRet.SheetCustomDrawList);
      end;
    end;
    2:
    begin
      if not bCustom then
      begin
        FDrawEng.StrectDraw(FDrawEng.GetGPBitMap(2),pbEdit.Canvas.Handle,
          pbEdit.Width, pbEdit.Height);
      end else
      begin
        FDrawEng.StrectDraw(FRet.CustomPnlAImg as IGPBitMap,pbEdit.Canvas.Handle,
          pbEdit.Width,pbEdit.Height);
        FDrawEng.DrawCustomShape(pbEdit.Canvas.Handle,FRet.PnlACustomDrawList);
      end;
    end;
    3:
    begin
      if not bCustom then
      begin
        FDrawEng.StrectDraw(FDrawEng.GetGPBitMap(3),pbEdit.Canvas.Handle,
          pbEdit.Width, pbEdit.Height);
      end else
      begin
        FDrawEng.StrectDraw(FRet.CustomPnlBImg as IGPBitMap,pbEdit.Canvas.Handle,
          pbEdit.Width,pbEdit.Height);
        FDrawEng.DrawCustomShape(pbEdit.Canvas.Handle,FRet.PnlBCustomDrawList);
      end;
    end;
  end;

  if FMouseDownFlag then
  begin
    FDrawEng.DrawRect(pbEdit.Canvas.Handle,Point(FMouseDownX,FMouseDownY),
      Point(FMouseNowX,FMouseNowY),clRed);
  end;
  if not bCustom then
    FDrawEng.DrawSelectBlocks(FRet,FIndex,pbEdit.Canvas.Handle,FSelectList);

end;


procedure TfrmEdit.pm1Popup(Sender: TObject);
begin
  FStrPoint := pbEdit.ScreenToClient(Mouse.CursorPos);
end;

end.
