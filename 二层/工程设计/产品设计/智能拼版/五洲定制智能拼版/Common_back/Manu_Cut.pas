unit Manu_Cut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IRetIntf, Calc;

type
  TfrmManuCut = class(TForm)
    grp1: TGroupBox;
    grp2: TGroupBox;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl6: TLabel;
    lbl14: TLabel;
    lbl18: TLabel;
    lbl7: TLabel;
    edtSetW_A: TEdit;
    edtSetH_A: TEdit;
    edtSetSpaceX_A: TEdit;
    edtSetSpaceY_A: TEdit;
    edtPnlLeftRightW_A: TEdit;
    edtPnlTopBottomW_A: TEdit;
    edtPnlW_A: TEdit;
    edtPnlH_A: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtSetYNum: TEdit;
    edtSetXNum: TEdit;
    Label4: TLabel;
    lbl26: TLabel;
    lbl27: TLabel;
    edtSheetW: TEdit;
    edtSheetH: TEdit;
    Label3: TLabel;
    edtPnlAYnum: TEdit;
    edtPnlAXNum: TEdit;
    Label5: TLabel;
    btnOK: TButton;
    procedure btnOKClick(Sender: TObject);
    procedure edtSetXNumExit(Sender: TObject);
    procedure edtSetYNumExit(Sender: TObject);
    procedure edtPnlAYnumExit(Sender: TObject);
    procedure edtPnlAXNumExit(Sender: TObject);
  private
    { Private declarations }
    function CheckCutParam: Boolean;
  public
    FRet: IRet;
    { Public declarations }
  end;

implementation

uses
  Adapter, CalcParam;

{$R *.dfm}

procedure TfrmManuCut.btnOKClick(Sender: TObject);
var
  PnlCalc4Reg,SheetCalc4Reg: TCalc4Reg;
  LPnl,LSheet: IBlock4Reg;
  LCutParam: TCutParam;
begin
  if MessageBoxA(Handle,'手动拼版将会清除现有拼版结果，是否继续?','提示',MB_YESNO) = IDYes then
  begin
    if CheckCutParam then
    begin
      ZeroMemory(@PnlCalc4Reg,SizeOf(PnlCalc4Reg));
      PnlCalc4Reg.RegCount := 4;
      PnlCalc4Reg.AChildCount := StrToInt(edtSetXNum.Text) * StrToInt(edtSetYNum.Text);
      PnlCalc4Reg.W := StrToFloat(edtPnlW_A.Text);
      PnlCalc4Reg.H := StrToFloat(edtPnlH_A.Text);
      SetLength(PnlCalc4Reg.RegArr,4);
      PnlCalc4Reg.RegArr[0].Xnum := StrToInt(edtSetXNum.Text);
      PnlCalc4Reg.RegArr[0].Ynum := StrToInt(edtSetYNum.Text);
      PnlCalc4Reg.RegArr[0].Block.W := StrToFloat(edtSetW_A.Text);
      PnlCalc4Reg.RegArr[0].Block.H := StrToFloat(edtSetH_A.Text);
      PnlCalc4Reg.RegArr[0].W := StrToFloat(edtPnlW_A.Text) - 2*StrToFloat(edtPnlLeftRightW_A.Text);
      PnlCalc4Reg.RegArr[0].H := StrToFloat(edtPnlH_A.Text) - 2* StrToFloat(edtPnlTopBottomW_A.Text);

      LPnl := Calc4RegToIBlock4Reg(PnlCalc4Reg,StrToFloat(edtSetSpaceX_A.Text),StrToFloat(edtSetSpaceY_A.Text),
        StrToFloat(edtPnlLeftRightW_A.Text), StrToFloat(edtPnlTopBottomW_A.Text));
      LPnl.Calc4Reg := PnlCalc4Reg;
      LPnl.W := PnlCalc4Reg.W;
      LPnl.H := PnlCalc4Reg.H;
      LPnl.PaintData := Calc4RegToPaintData(PnlCalc4Reg,StrToFloat(edtSetSpaceX_A.Text),
        StrToFloat(edtSetSpaceY_A.Text),StrToFloat(edtPnlLeftRightW_A.Text), StrToFloat(edtPnlTopBottomW_A.Text));
      LPnl.OriginalPaintData := Calc4RegToPaintData(PnlCalc4Reg,StrToFloat(edtSetSpaceX_A.Text),
        StrToFloat(edtSetSpaceY_A.Text),StrToFloat(edtPnlLeftRightW_A.Text), StrToFloat(edtPnlTopBottomW_A.Text));

      Lpnl.PBorderSize^.MinLeftRightW := StrToFloat(edtPnlLeftRightW_A.Text);
      Lpnl.PBorderSize^.MinTopBottomW := StrToFloat(edtPnlTopBottomW_A.Text);
      Lpnl.PBorderSize^.MaxLeftRightW := StrToFloat(edtPnlLeftRightW_A.Text);
      Lpnl.PBorderSize^.MaxTOpBottomW := StrToFloat(edtPnlTopBottomW_A.Text);
      Lpnl.PBorderSize^.NowLeftRightW := StrToFloat(edtPnlLeftRightW_A.Text);
      Lpnl.PBorderSize^.NowTopBottomW := StrToFloat(edtPnlTopBottomW_A.Text);
      Lpnl.PBorderSize^.OldLeftRightW := StrToFloat(edtPnlLeftRightW_A.Text);
      Lpnl.PBorderSize^.OldTopBottomW := StrToFloat(edtPnlTopBottomW_A.Text);

      ZeroMemory(@SheetCalc4Reg,SizeOf(SheetCalc4Reg));
      SheetCalc4Reg.RegCount := 4;
      SheetCalc4Reg.AChildCount := StrToInt(edtPnlAXNum.Text)* StrToInt(edtPnlAYnum.Text);
      SheetCalc4Reg.W := StrToFloat(edtSheetW.Text);
      SheetCalc4Reg.H := StrToFloat(edtSheetH.Text);
      SetLength(SheetCalc4Reg.RegArr,4);
      SheetCalc4Reg.RegArr[0].Xnum := StrToInt(edtPnlAXNum.Text);
      SheetCalc4Reg.RegArr[0].Ynum := StrToInt(edtPnlAYnum.Text);
      SheetCalc4Reg.RegArr[0].Block.w := StrToFloat(edtPnlW_A.Text);
      SheetCalc4Reg.RegArr[0].Block.H := StrToFloat(edtPnlH_A.Text);
      SheetCalc4Reg.RegArr[0].W := StrToInt(edtPnlAXNum.Text)* StrToFloat(edtPnlW_A.Text);
      SheetCalc4Reg.RegArr[0].H := StrToInt(edtPnlAYnum.Text)* StrToFloat(edtPnlH_A.Text);
      LSheet := Calc4RegToIBlock4Reg(SheetCalc4Reg,0,0,0,0);
      LSheet.Calc4Reg := SheetCalc4Reg;
      LSheet.W := SheetCalc4Reg.W;
      LSheet.H := SheetCalc4Reg.H;
      LSheet.PaintData := Calc4RegToPaintData(SheetCalc4Reg,0,0,0,0);
      LSheet.OriginalPaintData := Calc4RegToPaintData(SheetCalc4Reg,0,0,0,0);

      LCutParam.SheetW := StrToFloat(edtSheetW.Text);
      LCutParam.SheetH := StrToFloat(edtSheetH.Text);
      LCutParam.PnlASetW := StrToFloat(edtSetW_A.Text);
      LCutParam.PnlASetH := StrToFloat(edtSetH_A.Text);
      LCutParam.PnlASetHorzSpace := StrToFloat(edtSetSpaceX_A.Text);
      LCutParam.PnlASetVertSpace := StrToFloat(edtSetSpaceY_A.Text);
      LCutParam.PnlABorderLeftRightWidth := StrToFloat(edtPnlLeftRightW_A.Text);
      LCutParam.PnlABorderTopBottomWidth := StrToFloat(edtPnlTopBottomW_A.Text);

      FRet := TRet.Create;
      FRet.SheetA := LSheet;
      FRet.PnlA := LPnl;
      FRet.CutParam := LCutParam;
      FRet.SetSheetUseage(
      (StrToInt(edtPnlAXNum.Text)* StrToInt(edtPnlAYnum.Text)* StrToInt(edtSetXNum.Text)*
        StrToInt(edtSetYNum.Text)* StrToFloat(edtSetW_A.Text)* StrToFloat(edtSetH_A.Text)) /
        (StrToFloat(edtSheetW.Text)* StrToFloat(edtSheetH.Text)) * 100
      );
    end;
    ModalResult := mrOk;
  end;
end;

function TfrmManuCut.CheckCutParam: Boolean;
var
  I: Integer;
  tmpW,tmpH: Double;
begin
  Result := False;
  for I := 0 to ComponentCount - 1 do
  begin
    if (Components[I] is TEdit) then
    begin
      if Length(Trim(TEdit(Components[I]).Text)) = 0 then
      begin
        ShowMessage('开料参数不能为空');
        Exit;
      end;
      if StrToFloatDef(TEdit(Components[I]).Text,0) <= 0 then
      begin
        ShowMessage('开料参数不能小于等于0');
        Exit;
      end;
    end;
  end;
  if (StrToIntDef(edtSetXNum.Text,0) <= 0) or
     (StrToIntDef(edtSetYNum.Text,0) <= 0) or
     (StrToIntDef(edtPnlAXNum.Text,0) <= 0) or
     (StrToIntDef(edtPnlAYnum.Text,0) <= 0)
  then
  begin
    ShowMessage('Set和A板行列数不能小于等于0');
    Exit;
  end;
  //范围检查
  tmpW := ((StrToFloat(edtSetW_A.Text) + StrToFloat(edtSetSpaceX_A.Text)) * StrToInt(edtSetXNum.Text) - StrToFloat(edtSetSpaceX_A.Text)) + 2* StrToFloat(edtPnlLeftRightW_A.Text);
  tmpH := ((StrToFloat(edtSetH_A.Text) + StrToFloat(edtSetSpaceY_A.Text)) * StrToInt(edtSetYNum.Text) - StrToFloat(edtSetSpaceY_A.Text)) + 2* StrToFloat(edtPnlTopBottomW_A.Text);
  if (tmpW > strtofloat(edtPnlW_A.Text)) or (tmpH > StrToFloat(edtPnlH_A.Text)) then
  begin
    ShowMessage('Pnl开Set尺寸不正确 ！');
    Exit;
  end;
  tmpW := StrToFloat(edtPnlW_A.Text)* StrToInt(edtPnlAXNum.Text);
  tmpH := StrToFloat(edtPnlH_A.Text)* StrToInt(edtPnlAYnum.Text);
  if (tmpW > StrToFloat(edtSheetW.Text)) or (tmpH > StrToFloat(edtSheetH.Text)) then
  begin
    ShowMessage('Sheet开PNL的尺寸不正确');
    Exit;
  end;

  Result := True;
end;

procedure TfrmManuCut.edtPnlAXNumExit(Sender: TObject);
begin
  edtSheetW.Text := FloatToStr(StrToFloat(edtPnlW_A.Text)* StrToInt(edtPnlAXNum.Text));
end;

procedure TfrmManuCut.edtPnlAYnumExit(Sender: TObject);
begin
  edtSheetH.Text := FloatToStr(StrToFloat(edtPnlH_A.Text)* StrToInt(edtPnlAYnum.Text));
end;

procedure TfrmManuCut.edtSetXNumExit(Sender: TObject);
begin
  edtPnlW_A.Text := FloatToStr(StrToFloat(edtSetW_A.Text)* StrToInt(edtSetXNum.Text) +
    (StrToInt(edtSetXNum.Text) - 1)* StrToFloat(edtSetSpaceX_A.Text) +
    2* StrToFloat(edtPnlLeftRightW_A.Text));
end;

procedure TfrmManuCut.edtSetYNumExit(Sender: TObject);
begin
  edtPnlH_A.Text := FloatToStr(StrToFloat(edtSetH_A.Text) * StrToInt(edtSetYNum.Text) +
    (StrToInt(edtSetYNum.Text) - 1) * StrToFloat(edtSetSpaceY_A.Text) +
    2* StrToFloat(edtPnlTopBottomW_A.Text));
end;

end.
