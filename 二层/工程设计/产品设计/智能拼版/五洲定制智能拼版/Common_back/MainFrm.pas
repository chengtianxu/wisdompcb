unit MainFrm;

interface
uses
  Forms, ImgList, Controls, Menus, ComCtrls, Spin, StdCtrls, Buttons, ExtCtrls,
  ToolWin, Classes, CalcParam, ProgressFrm, IRetIntf, Generics.Collections,
  SysUtils, Calc, Windows, Graphics, Dialogs, GdiPlus, Adapter, DrawEngine_2,
  ExtDlgs;

type
  TfrmMain1 = class(TForm)
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    ts4: TTabSheet;
    lbl1: TLabel;
    pnl7: TPanel;
    pnl8: TPanel;
    lbl9: TLabel;
    lbl10: TLabel;
    cbxPnlRotate_A: TCheckBox;
    cbxSetRotate_A: TCheckBox;
    edtMinUseage: TEdit;
    edtWDivH: TEdit;
    lbl15: TLabel;
    pmSet: TPopupMenu;
    mniN1: TMenuItem;
    mniN2: TMenuItem;
    lbl13: TLabel;
    edtPnlW_A: TEdit;
    edtPnlH_A: TEdit;
    lbl19: TLabel;
    edtPnlLeftRightBorderW_A: TEdit;
    edtPnlTopBottomBorderW_A: TEdit;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    edtSetPerPnl_A: TEdit;
    lbl23: TLabel;
    edtSheetUseage: TEdit;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    edtSheetW: TEdit;
    lbl27: TLabel;
    edtSheetH: TEdit;
    edtPnlCount_A: TEdit;
    lbl28: TLabel;
    lbl29: TLabel;
    lbl30: TLabel;
    edtSheetSetCount: TEdit;
    lvRet: TListView;
    lbl31: TLabel;
    pnl9: TPanel;
    lbl32: TLabel;
    pnl11: TPanel;
    pnl10: TPanel;
    lbl33: TLabel;
    pbMain: TPaintBox;
    pbSheet: TPaintBox;
    pbPnl_A: TPaintBox;
    pbPnl_B: TPaintBox;
    lbl34: TLabel;
    lbl39: TLabel;
    edtPcsW_A: TEdit;
    edtPcsH_A: TEdit;
    lbl40: TLabel;
    edtPcsPerSet_A: TEdit;
    lbl41: TLabel;
    cbxDoubleCut: TCheckBox;
    lbl42: TLabel;
    lbl43: TLabel;
    lbl44: TLabel;
    lbl45: TLabel;
    lbl46: TLabel;
    lbl47: TLabel;
    lbl48: TLabel;
    lbl49: TLabel;
    edtPnlW_B: TEdit;
    edtPnlH_B: TEdit;
    edtPnlLeftRightBorderW_B: TEdit;
    edtPnlTopBottomBorderW_B: TEdit;
    edtSetPerPnl_B: TEdit;
    edtPnlCount_B: TEdit;
    stat1: TStatusBar;
    lbl50: TLabel;
    lbl51: TLabel;
    pnl13: TPanel;
    pnl14: TPanel;
    cbbHoZCB: TComboBoxEx;
    cbbVerCB: TComboBoxEx;
    lbl52: TLabel;
    lbl53: TLabel;
    il2: TImageList;
    grp1: TGroupBox;
    cbxBB: TCheckBox;
    cbxXD: TCheckBox;
    cbxPXGG: TCheckBox;
    cbxJDK: TCheckBox;
    pnl12: TPanel;
    lbl35: TLabel;
    lbl36: TLabel;
    lbl37: TLabel;
    lbl38: TLabel;
    se3mm: TSpinEdit;
    se6mm: TSpinEdit;
    rgZKPos: TRadioGroup;
    Label1: TLabel;
    Splitter1: TSplitter;
    cbxManuCut: TCheckBox;
    edtZK3mmLength: TEdit;
    edtZK6mmLength: TEdit;
    pnl15: TPanel;
    btnSet: TBitBtn;
    btnSave: TBitBtn;
    btnAutoCut: TBitBtn;
    btnHT: TBitBtn;
    btnGX: TBitBtn;
    btnManuCut: TBitBtn;
    btnLoadPicture: TBitBtn;
    lbl3: TLabel;
    edtSetW_A: TEdit;
    lbl4: TLabel;
    edtSetH_A: TEdit;
    lbl5: TLabel;
    lbl16: TLabel;
    edtSetSpaceX_A: TEdit;
    lbl17: TLabel;
    edtSetSpaceY_A: TEdit;
    lbl6: TLabel;
    lbl14: TLabel;
    edtPnlLeftRightW_A: TEdit;
    lbl18: TLabel;
    edtPnlTopBottomW_A: TEdit;
    lbl7: TLabel;
    edtPnlMinW_A: TEdit;
    lbl12: TLabel;
    edtPnlMaxW_A: TEdit;
    lbl54: TLabel;
    edtPnlMinH_A: TEdit;
    lbl11: TLabel;
    edtPnlMaxH_A: TEdit;
    lbl2: TLabel;
    bvl1: TBevel;
    pmInportImg: TPopupMenu;
    mniInportSheetImg: TMenuItem;
    mniInportPnlAImg: TMenuItem;
    mniInportPnlBImg: TMenuItem;
    il1: TImageList;
    rgCB_AB: TRadioGroup;
    seCBSelect: TSpinEdit;
    cbxCBSelect: TCheckBox;
    btnWeiTiao: TBitBtn;
    procedure mniN1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAutoCutClick(Sender: TObject);
    procedure edtDouble_Enter(Sender: TObject);
    procedure edtDouble_Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSetClick(Sender: TObject);
    procedure lvRetAdvancedCustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure lvRetAdvancedCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage;
      var DefaultDraw: Boolean);
    procedure pbSheetClick(Sender: TObject);
    procedure pbPnl_AClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure lvRetColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvRetClick(Sender: TObject);
    procedure lvRetKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pbMainPaint(Sender: TObject);
    procedure pbSheetPaint(Sender: TObject);
    procedure pbPnl_APaint(Sender: TObject);
    procedure lvRetDblClick(Sender: TObject);
    procedure btnHTClick(Sender: TObject);
    procedure btnGXClick(Sender: TObject);
    procedure btnLoadPictureClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mniN2Click(Sender: TObject);
    procedure se3mmChange(Sender: TObject);
    procedure pmInportImgPopup(Sender: TObject);
    procedure pbPnl_BClick(Sender: TObject);
    procedure mniInportSheetImgClick(Sender: TObject);
    procedure pbPnl_BPaint(Sender: TObject);
    procedure lvRetMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbxCBSelectClick(Sender: TObject);
    procedure btnWeiTiaoClick(Sender: TObject);
    procedure btnManuCutClick(Sender: TObject);
  private
    { Private declarations }
    FDefautParam: TCutParam;
    FCutParamArr: TParamArr;
    FRetLst: TList<IRet>;
    FMainImgIndex: Integer;
    FSelectRet: IRet;
    FHotRetIndex: Integer;
    FGXEnable: Boolean;
    function LoadDefCutParamFromIni(var AParam: TCutParam; AFileName: string; AList: TListview): IRet;
    procedure AddIRetTolv;
    function FillCutParam: Boolean;
    procedure AutoBorder(ARet: IRet);
    procedure AutoBorderAB(ARet: IRet);
    procedure AddZK();
    procedure AddZK2;
    function AddZKPnl(APnl: IBlock4Reg; APos: Integer; AB: Integer): Boolean;
    procedure AddKong();
    procedure AddCB();
    procedure AddAutoKL;
  public
    { Public declarations }
  end;

var
  frmMain1: TfrmMain1;

  function ShowPCBCutFrm(AOwner: TComponent): Boolean;stdcall;export;

implementation

uses
  SheetListFrm, CalcHelper, ShellAPI, ZKCalc, IniFiles, Messages, OptionFrm,
  Manu_Cut;

{$R *.dfm}


function ShowPCBCutFrm(AOwner: TComponent): Boolean;stdcall;
var
  LFrm: TfrmMain1;
begin
  LFrm := TfrmMain1.Create(AOwner);
  frmSheetList := TfrmSheetList.Create(LFrm);
  try
    {$IFNDEF APP}
    GdiPlus.Initialize;
    {$ENDIF}
    Result := LFrm.ShowModal = mrOk;
  finally
    FreeAndNil(frmSheetList);
    FreeAndNil(LFrm);
    gDrawEng.FGPSheetImg := nil;
    gDrawEng.FGPPnlAImg := nil;
    gDrawEng.FGPPnlBImg := nil;
    {$IFNDEF APP}
    GdiPlus.Finalize;
    {$ENDIF}

  end;
end;

var
  m_bSort: Boolean = False;

//结果listview进行排序
function CustomSortProc(Item1,Item2: TListItem;ParamSort: Integer): Integer;stdcall;
var
  txt1,txt2: string;
  a,b: Double;
begin
  Result := 0;
  if ParamSort <> 0 then
  begin
    txt1 := Item1.SubItems.Strings[ParamSort-1];
    txt2 := Item2.SubItems.Strings[ParamSort-1];
  end else
  begin
    txt1 := Item1.Caption;
    txt2 := Item2.Caption;
  end;

  try
    a := StrToFloatDef(txt1,0);
    b := StrToFloatDef(txt2,0);
    if Abs(a-b) < 0.000000001 then
      Result := 0
    else
    if a > b then
      Result := 1
    else
      Result := -1;
    if not m_bSort then
    begin
      Result := 0 - Result;
    end;
  except
  end;

end;

{ TfrmMain1 }

procedure TfrmMain1.AddKong();
var
  LRet: IRet;
  LPaintData: TPaintData;
begin
  if FSelectRet <> nil then
  begin
    LRet := FSelectRet;
    LPaintData := LRet.PnlA.PaintData;
    LPaintData.DWK := [kNull];
    if cbxBB.Checked then LPaintData.DWK := LPaintData.DWK + [kBB];
    if cbxXD.Checked then LPaintData.DWK := LPaintData.DWK + [kXDK];
    if cbxPXGG.Checked then LPaintData.DWK := LPaintData.DWK + [kPXGG];
    if cbxJDK.Checked then LPaintData.DWK := LPaintData.DWK + [kJDK];
    LRet.PnlA.PaintData := LPaintData;

    if LRet.PnlB <> nil then
    begin
      if LRet.PnlB.GetCellCount > 0 then
      begin
        LRet.PnlB.PPaintData^.DWK := [kNull];
        if cbxBB.Checked then LRet.PnlB.PPaintData^.DWK := LRet.PnlB.PPaintData^.DWK + [kBB];
        if cbxXD.Checked then LRet.PnlB.PPaintData^.DWK := LRet.PnlB.PPaintData^.DWK + [kXDK];
        if cbxPXGG.Checked then LRet.PnlB.PPaintData^.DWK := LRet.PnlB.PPaintData^.DWK + [kPXGG];
        if cbxJDK.Checked then LRet.PnlB.PPaintData^.DWK := LRet.PnlB.PPaintData^.DWK + [kJDK];
      end;
    end;
  end;
end;

procedure TfrmMain1.AddZK();
var
  LRet: IRet;
  LPaintDate: TPaintData;
  LZKBlockArr: TFloatRectArr;
  LZKReg: TFloatRect;
  LMaxW,LMaxH: Double;
  I: Integer;
  MidIndex: Integer;
  LSetVerSpace,LSetHorSpace: Double;
  LPaintReg: TFloatRect;
  label HorDef;
  label VerDef;
  label AddHorZkToReg1, AddVerZKToReg1;
begin
  if FSelectRet <> nil then
  begin
    LRet := FSelectRet;
    if LRet.PnlA.PaintData.CustomImg <> nil  then Exit;
    LRet.PCutParam^.m3ZKLength := StrToFloat(edtZK3mmLength.Text);
    LRet.PCutParam^.m6ZKLength := StrToFloat(edtZK6mmLength.Text);

    LPaintDate := Calc4RegToPaintData(LRet.PnlA.Calc4Reg,
            LRet.CutParam.PnlASetHorzSpace, LRet.CutParam.PnlASetVertSpace,
            LRet.PnlA.PBorderSize^.OldLeftRightW,
            LRet.PnlA.PBorderSize^.OldTopBottomW);
    for I := 0 to Length(LPaintDate.BlockArr) - 1 do
      LPaintDate.BlockArr[I].ArrowCB := LRet.PnlA.PaintData.BlockArr[I].ArrowCB;
    LRet.PnlA.PBorderSize^.NowLeftRightW := LRet.PnlA.PBorderSize^.OldLeftRightW;
    LRet.PnlA.PBorderSize^.NowTopBottomW := LRet.PnlA.PBorderSize^.OldTopBottomW;
    if LRet.CutParam.PnlASetVertSpace < 10 then LSetVerSpace := 10 else LSetVerSpace := LRet.CutParam.PnlASetVertSpace;
    if LRet.CutParam.PnlASetHorzSpace < 10 then LSetHorSpace := 10 else LSetHorSpace := LRet.CutParam.PnlASetHorzSpace;

    case rgZKPos.ItemIndex of
      0: //水平
      begin
        LMaxW := LRet.PnlA.PBorderSize^.Pnl_ZeroBorderW;
        LMaxH := (LRet.PnlA.H - LRet.PnlA.PBorderSize^.Pnl_ZeroBorderH - LRet.PnlA.PBorderSize^.MinTopBottomW*2 - LRet.CutParam.PnlASetVertSpace)*2;
        //只有Reg——1
        if (LRet.PnlA.Calc4Reg.RegArr[0].BlockCount <> 0) and
           (LRet.PnlA.Calc4Reg.AChildCount = LRet.PnlA.Calc4Reg.RegArr[0].BlockCount)
        then
        begin
          if MakeHorZKReg(StrToFloat(edtZK6mmLength.Text),StrToFloat(edtZK3mmLength.Text),se6mm.Value,se3mm.Value,LZKReg,LZKBlockArr,LMaxW,LMaxH) then
          begin
            if LRet.PnlA.Calc4Reg.RegArr[0].Ynum = 1 then
            begin
              LZKReg.Y := LPaintDate.BlockArr[0].Y + LPaintDate.BlockArr[0].H + LSetVerSpace;
              LPaintDate.Reg.H := LPaintDate.Reg.H + LZKReg.H + LSetVerSpace;
            end else
            begin
              MidIndex := Trunc(lRet.PnlA.Calc4Reg.RegArr[0].Ynum /2);
              LPaintDate.Reg.H := LPaintDate.Reg.H + LZKReg.H + LSetVerSpace;
              for I := 0 to Length(LPaintDate.BlockArr) - 1 do
              begin
                if LPaintDate.BlockArr[I].RowIndex+1 > MidIndex then
                begin
                  LPaintDate.BlockArr[I].Y := LPaintDate.BlockArr[I].Y + LSetVerSpace + LZKReg.H;
                end;
              end;
              for I := 0 to Length(LPaintDate.BlockArr) - 1 do
              begin
                if LPaintDate.BlockArr[I].RowIndex+1 = MidIndex then
                begin
                  LZKReg.Y := LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H + LSetVerSpace;
                  Break;
                end;
              end;
            end;
            LZKReg.X := (LRet.PnlA.PaintData.Reg.W - LZKReg.W) / 2;
            LRet.PnlA.PBorderSize^.NowTopBottomW := lret.PnlA.PBorderSize^.OldTopBottomW - (LZKReg.H /2 + LRet.CutParam.PnlASetVertSpace)/2;
          end else
          begin
            if not ((se3mm.Value = 0) and (se6mm.Value = 0)) then
              ShowMessage('请手动添加阻抗条');
          end;
        end else
        //只有Reg-1和3
        if (LRet.PnlA.Calc4Reg.RegArr[0].BlockCount <> 0) and
           (LRet.PnlA.Calc4Reg.RegArr[1].BlockCount = 0) and
           (LRet.PnlA.Calc4Reg.RegArr[2].BlockCount <> 0) and
           (LRet.PnlA.Calc4Reg.RegArr[3].BlockCount = 0) then
        begin
          if MakeHorZKReg(StrToFloat(edtZK6mmLength.Text),StrToFloat(edtZK3mmLength.Text),se6mm.Value,se3mm.Value,LZKReg,LZKBlockArr,LMaxW,LMaxH) then
          begin
            for I := 0 to Length(LPaintDate.BlockArr) - 1 do
            begin
              if LPaintDate.BlockArr[I].RegIndex = 2 then
              begin
                LPaintDate.BlockArr[I].Y := LPaintDate.BlockArr[I].Y + LSetVerSpace + LZKReg.H;
              end;
            end;
            for I := 0 to Length(LPaintDate.BlockArr) - 1 do
            begin
              if LPaintDate.BlockArr[I].RegIndex = 0 then
              begin
                if LZKReg.Y < LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H + LSetVerSpace then
                  LZKReg.Y := LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H + LSetVerSpace;
              end;
            end;
            LPaintDate.Reg.H := LPaintDate.Reg.H + LZKReg.H + LSetVerSpace;
            LZKReg.X := (LRet.PnlA.PaintData.Reg.W - LZKReg.W) / 2;
            LRet.PnlA.PBorderSize^.NowTopBottomW := lret.PnlA.PBorderSize^.OldTopBottomW - (LZKReg.H /2 + LRet.CutParam.PnlASetVertSpace)/2;
          end else
          begin
            if not ((se3mm.Value = 0) and (se6mm.Value = 0)) then
              ShowMessage('请手动添加阻抗条');
          end;
        end else
        //只有Reg-1和2
        if (LRet.PnlA.Calc4Reg.RegArr[0].BlockCount <> 0) and
           (LRet.PnlA.Calc4Reg.RegArr[1].BlockCount <> 0) and
           (LRet.PnlA.Calc4Reg.RegArr[2].BlockCount = 0) and
           (LRet.PnlA.Calc4Reg.RegArr[3].BlockCount = 0) then
        begin
          LMaxH := LMaxH + ((LRet.PnlA.Calc4Reg.RegArr[0].H - LRet.PnlA.Calc4Reg.RegArr[1].H)*2);
          LMaxW := LRet.PnlA.Calc4Reg.RegArr[1].W;
          ZeroMemory(@LPaintReg,SizeOf(LPaintReg));
          LPaintReg.X := 9999999999;
          ////在Reg2中可以添加
          if MakeHorZKReg(StrToFloat(edtZK6mmLength.Text),StrToFloat(edtZK3mmLength.Text),se6mm.Value,se3mm.Value,LZKReg,LZKBlockArr,LMaxW,LMaxH) then
          begin
            if LRet.PnlA.Calc4Reg.RegArr[1].Ynum = 1 then
            begin
              for I := 0 to Length(LPaintDate.BlockArr) - 1 do
              begin
                if LPaintDate.BlockArr[I].RegIndex = 1 then
                begin
                  LPaintDate.BlockArr[I].Y := LPaintDate.BlockArr[I].Y - (LZKReg.H + LSetVerSpace) / 2;
                  LZKReg.Y := LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H + LSetVerSpace;
                  if LPaintReg.X > LPaintDate.BlockArr[I].X then
                    LPaintReg.x := LPaintDate.BlockArr[I].X;
                  if LPaintReg.W < LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W then
                    LPaintReg.W := LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W;
                end;
              end;
              LPaintReg.W := LPaintReg.W - LPaintReg.X;
              LZKReg.X := LPaintReg.X + (LPaintReg.W - LZKReg.W) /2;
              if LRet.PnlA.Calc4Reg.RegArr[1].H + LZKReg.H/2 + lret.CutParam.PnlASetVertSpace > LRet.PnlA.Calc4Reg.RegArr[0].H then
              begin
                LRet.PnlA.PBorderSize^.NowTopBottomW := LRet.PnlA.H - (LRet.PnlA.Calc4Reg.RegArr[1].H + LZKReg.H/2 + lret.CutParam.PnlASetVertSpace);
              end;
            end else
            begin
              MidIndex := Trunc(lRet.PnlA.Calc4Reg.RegArr[1].Ynum /2);
              //LPaintDate.Reg.H := LPaintDate.Reg.H + LZKReg.H + LSetVerSpace;
              for I := 0 to Length(LPaintDate.BlockArr) - 1 do
              begin
                if LPaintDate.BlockArr[I].RegIndex = 1 then
                begin
                  if LPaintDate.BlockArr[I].RowIndex+1 > MidIndex then
                  begin
                    LPaintDate.BlockArr[I].Y := LPaintDate.BlockArr[I].Y + (LSetVerSpace + LZKReg.H)/2;
                  end else
                  begin
                    LPaintDate.BlockArr[I].Y := LPaintDate.BlockArr[I].Y - (LSetVerSpace + LZKReg.H)/2;
                    if LZKReg.Y < (LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H) then
                      LZKReg.Y := LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H + LSetVerSpace;
                  end;
                  if LPaintReg.X > LPaintDate.BlockArr[I].X then LPaintReg.X := LPaintDate.BlockArr[I].X;
                  if (LPaintReg.W) < (LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W) then
                    LPaintReg.W := (LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W);
                end;
              end;
              LPaintReg.W := LPaintReg.W - LPaintReg.X;
            end;
            LZKReg.X := LPaintReg.X + (LPaintReg.W - LZKReg.W) / 2;
            if LRet.PnlA.Calc4Reg.RegArr[0].H < (LRet.PnlA.Calc4Reg.RegArr[1].H + (LZKReg.H /2 + LRet.CutParam.PnlASetVertSpace)) then
            begin
              LRet.PnlA.PBorderSize^.NowTopBottomW := (LRet.PnlA.H - (LRet.PnlA.Calc4Reg.RegArr[1].H + (LZKReg.H /2 + LRet.CutParam.PnlASetVertSpace))) / 2;
            end;
          end else
          //如果Reg2添加不了责尝试在Reg1添加
          begin
            LMaxW := LRet.PnlA.Calc4Reg.RegArr[0].W;
            LMaxH := (LRet.PnlA.H - LRet.PnlA.PBorderSize^.Pnl_ZeroBorderH - LRet.PnlA.PBorderSize^.MinTopBottomW*2 - LRet.CutParam.PnlASetVertSpace)*2;
            if MakeHorZKReg(StrToFloat(edtZK6mmLength.Text),StrToFloat(edtZK3mmLength.Text),se6mm.Value,se3mm.Value,LZKReg,LZKBlockArr,LMaxW,LMaxH) then
            begin
              if LRet.PnlA.Calc4Reg.RegArr[0].Ynum = 1 then
              begin
                goto HorDef;
              end else
              begin
                MidIndex := Trunc(lRet.PnlA.Calc4Reg.RegArr[0].Ynum /2);
                LPaintDate.Reg.H := LPaintDate.Reg.H + LZKReg.H + LSetVerSpace;
                for I := 0 to Length(LPaintDate.BlockArr) - 1 do
                begin
                  if LPaintDate.BlockArr[I].RegIndex = 0 then
                  begin
                    if LPaintDate.BlockArr[I].RowIndex+1 > MidIndex then
                    begin
                      LPaintDate.BlockArr[I].Y := LPaintDate.BlockArr[I].Y + LSetVerSpace + LZKReg.H;
                    end else
                    begin
                      //LPaintDate.BlockArr[I].Y := LPaintDate.BlockArr[I].Y - (LSetVerSpace + LZKReg.H)/2;
                      if LPaintDate.BlockArr[I].RowIndex+1 = MidIndex then
                        LZKReg.Y := LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H + LSetVerSpace;
                    end;
                    if LPaintReg.X > LPaintDate.BlockArr[I].X then LPaintReg.X := LPaintDate.BlockArr[I].X;
                    if (LPaintReg.W) < (LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W) then
                      LPaintReg.W := (LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W);
                  end;
                end;
                LPaintReg.W := LPaintReg.W - LPaintReg.X;
              end;
              LZKReg.X := LPaintReg.X + (LPaintReg.W - LZKReg.W) / 2;
              if (lret.PnlA.Calc4Reg.RegArr[0].H + (LZKReg.H /2 + LRet.CutParam.PnlASetVertSpace)) > LRet.PnlA.Calc4Reg.RegArr[1].H then
              begin
                LRet.PnlA.PBorderSize^.NowTopBottomW := (LRet.PnlA.H - (LRet.PnlA.Calc4Reg.RegArr[0].H + (LZKReg.H /2 + LRet.CutParam.PnlASetVertSpace))) / 2;
              end;

            end else
              goto HorDef;
          end;
        end else
        // 3个全都在
        begin
          HorDef:
          LMaxW := LRet.PnlA.PBorderSize^.Pnl_ZeroBorderW;
          LMaxH := (LRet.PnlA.H - LRet.PnlA.PBorderSize^.Pnl_ZeroBorderH - LRet.PnlA.PBorderSize^.MinTopBottomW*2 - LRet.CutParam.PnlASetVertSpace)*2;
          if MakeHorZKReg(StrToFloat(edtZK6mmLength.Text),StrToFloat(edtZK3mmLength.Text),se6mm.Value,se3mm.Value,LZKReg,LZKBlockArr,LMaxW,LMaxH) then
          begin
            for I := 0 to Length(LPaintDate.BlockArr) - 1 do
            begin
              if LZKReg.Y <= LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H + LSetVerSpace then
              begin
                LZKReg.Y := LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H + LSetVerSpace;
              end;
            end;
            LPaintDate.Reg.H := LPaintDate.Reg.H + LZKReg.H + LSetVerSpace;
            LZKReg.X := (LRet.PnlA.PaintData.Reg.W - LZKReg.W) / 2;
            LRet.PnlA.PBorderSize^.NowTopBottomW := lret.PnlA.PBorderSize^.OldTopBottomW - (LZKReg.H /2 + LRet.CutParam.PnlASetVertSpace)/2;
          end else
          begin
            if not ((se3mm.Value = 0) and (se6mm.Value = 0)) then
              ShowMessage('请手动添加阻抗条');
          end;
        end;
      end;
      1:
      begin
        LMaxW := (LRet.PnlA.W - LRet.PnlA.PBorderSize^.Pnl_ZeroBorderW - LRet.PnlA.PBorderSize^.MinLeftRightW*2 - LRet.CutParam.PnlASetHorzSpace)*2;
        LMaxH := LRet.PnlA.PBorderSize^.Pnl_ZeroBorderH;
        //只有Reg——1
        if (LRet.PnlA.Calc4Reg.RegArr[0].BlockCount <> 0) and
           (LRet.PnlA.Calc4Reg.AChildCount = LRet.PnlA.Calc4Reg.RegArr[0].BlockCount)
        then
        begin
          if MakeVerZKReg(StrToFloat(edtZK6mmLength.Text),StrToFloat(edtZK3mmLength.Text),se6mm.Value,se3mm.Value,LZKReg,LZKBlockArr,LMaxW,LMaxH) then
          begin
            if LRet.PnlA.Calc4Reg.RegArr[0].Xnum = 1 then
            begin
              LZKReg.X := LPaintDate.BlockArr[0].X + LPaintDate.BlockArr[0].W + LSetHorSpace;
              LPaintDate.Reg.W := LPaintDate.Reg.W + LZKReg.W + LSetHorSpace;
            end else
            begin
              MidIndex := Trunc(lRet.PnlA.Calc4Reg.RegArr[0].Xnum /2);
              LPaintDate.Reg.W := LPaintDate.Reg.W + LZKReg.W + LSetHorSpace;
              for I := 0 to Length(LPaintDate.BlockArr) - 1 do
              begin
                if LPaintDate.BlockArr[I].ColumIndex+1 > MidIndex then
                begin
                  LPaintDate.BlockArr[I].X := LPaintDate.BlockArr[I].X + LSetHorSpace + LZKReg.W;
                end;
              end;
              for I := 0 to Length(LPaintDate.BlockArr) - 1 do
              begin
                if LPaintDate.BlockArr[I].ColumIndex+1 = MidIndex then
                begin
                  LZKReg.X := LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W + LSetHorSpace;
                  Break;
                end;
              end;
            end;
            LZKReg.Y := (LRet.PnlA.PaintData.Reg.H - LZKReg.H) / 2;
            LRet.PnlA.PBorderSize^.NowLeftRightW := lret.PnlA.PBorderSize^.OldLeftRightW - (LZKReg.W /2 + LRet.CutParam.PnlASetHorzSpace)/2;
          end else
          begin
            if not ((se3mm.Value = 0) and (se6mm.Value = 0)) then
              ShowMessage('请手动添加阻抗条');
          end;
        end else
        //只有Reg-1和2
        if (LRet.PnlA.Calc4Reg.RegArr[0].BlockCount <> 0) and
           (LRet.PnlA.Calc4Reg.RegArr[1].BlockCount <> 0) and
           (LRet.PnlA.Calc4Reg.RegArr[2].BlockCount = 0) and
           (LRet.PnlA.Calc4Reg.RegArr[3].BlockCount = 0) then
        begin
          if MakeVerZKReg(StrToFloat(edtZK6mmLength.Text),StrToFloat(edtZK3mmLength.Text),se6mm.Value,se3mm.Value,LZKReg,LZKBlockArr,LMaxW,LMaxH) then
          begin
            for I := 0 to Length(LPaintDate.BlockArr) - 1 do
            begin
              if LPaintDate.BlockArr[I].RegIndex = 1 then
              begin
                LPaintDate.BlockArr[I].X := LPaintDate.BlockArr[I].X + LSetHorSpace + LZKReg.W;
              end;
            end;
            for I := 0 to Length(LPaintDate.BlockArr) - 1 do
            begin
              if LPaintDate.BlockArr[I].RegIndex = 0 then
              begin
                if LZKReg.X < LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W + LSetHorSpace then
                  LZKReg.X := LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W + LSetHorSpace;
              end;
            end;
            LPaintDate.Reg.W := LPaintDate.Reg.W + LZKReg.W + LSetHorSpace;
            LZKReg.Y := (LRet.PnlA.PaintData.Reg.H - LZKReg.H) / 2;
            LRet.PnlA.PBorderSize^.NowLeftRightW := lret.PnlA.PBorderSize^.OldLeftRightW - (LZKReg.W /2 + LRet.CutParam.PnlASetHorzSpace)/2;
          end else
          begin
            if not ((se3mm.Value = 0) and (se6mm.Value = 0)) then
              ShowMessage('请手动添加阻抗条');
          end;
        end else
        //只有Reg-1和3
        if (LRet.PnlA.Calc4Reg.RegArr[0].BlockCount <> 0) and
           (LRet.PnlA.Calc4Reg.RegArr[1].BlockCount = 0) and
           (LRet.PnlA.Calc4Reg.RegArr[2].BlockCount <> 0) and
           (LRet.PnlA.Calc4Reg.RegArr[3].BlockCount = 0) then
        begin
          LMaxW := LMaxW + (LRet.PnlA.Calc4Reg.RegArr[0].W - LRet.PnlA.Calc4Reg.RegArr[2].W)*2;
          LMaxH := LRet.PnlA.Calc4Reg.RegArr[2].H;
          ZeroMemory(@LPaintReg,SizeOf(LPaintReg));
          LPaintReg.Y := 9999999999;
          //尝试在REG3添加
          if MakeVerZKReg(StrToFloat(edtZK6mmLength.Text),StrToFloat(edtZK3mmLength.Text),se6mm.Value,se3mm.Value,LZKReg,LZKBlockArr,LMaxW,LMaxH) then
          begin
            if LRet.PnlA.Calc4Reg.RegArr[2].Xnum = 1 then
            begin
              for I := 0 to Length(LPaintDate.BlockArr) - 1 do
              begin
                if LPaintDate.BlockArr[I].RegIndex = 2 then
                begin
                  LPaintDate.BlockArr[I].X := LPaintDate.BlockArr[I].X - (LZKReg.W + LSetHorSpace) / 2;
                  LZKReg.X := LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W + LSetHorSpace;
                  if LPaintReg.Y > LPaintDate.BlockArr[I].Y then
                    LPaintReg.Y := LPaintDate.BlockArr[I].Y;
                  if LPaintReg.H < LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H then
                    LPaintReg.H := LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H;
                end;
              end;
              LPaintReg.H := LPaintReg.H - LPaintReg.Y;
              LZKReg.Y := LPaintReg.Y + (LPaintReg.H - LZKReg.H) /2;
              if LRet.PnlA.Calc4Reg.RegArr[2].W + LZKReg.W/2 + lret.CutParam.PnlASetHorzSpace > LRet.PnlA.Calc4Reg.RegArr[0].W then
              begin
                LRet.PnlA.PBorderSize^.NowLeftRightW := LRet.PnlA.W - (LRet.PnlA.Calc4Reg.RegArr[2].W + LZKReg.W/2 + lret.CutParam.PnlASetHorzSpace);
              end;
            end else
            begin
              MidIndex := Trunc(lRet.PnlA.Calc4Reg.RegArr[2].Xnum /2);
              for I := 0 to Length(LPaintDate.BlockArr) - 1 do
              begin
                if LPaintDate.BlockArr[I].RegIndex = 2 then
                begin
                  if LPaintDate.BlockArr[I].ColumIndex+1 > MidIndex then
                  begin
                    LPaintDate.BlockArr[I].X := LPaintDate.BlockArr[I].X + (LSetHorSpace + LZKReg.W)/2;
                  end else
                  begin
                    LPaintDate.BlockArr[I].X := LPaintDate.BlockArr[I].X - (LSetHorSpace + LZKReg.W)/2;
                    if LZKReg.X < (LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W) then
                      LZKReg.X := LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W + LSetHorSpace;
                  end;
                  if LPaintReg.Y > LPaintDate.BlockArr[I].Y then LPaintReg.Y := LPaintDate.BlockArr[I].Y;
                  if (LPaintReg.H) < (LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H) then
                    LPaintReg.H := (LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H);
                end;
              end;
              LPaintReg.H := LPaintReg.H - LPaintReg.Y;
            end;
            LZKReg.Y := LPaintReg.Y + (LPaintReg.H - LZKReg.H) / 2;
            if LRet.PnlA.Calc4Reg.RegArr[0].W < (LRet.PnlA.Calc4Reg.RegArr[2].W + (LZKReg.W /2 + LRet.CutParam.PnlASetHOrzSpace)) then
            begin
              LRet.PnlA.PBorderSize^.NowLeftRightW := (LRet.PnlA.W - (LRet.PnlA.Calc4Reg.RegArr[2].W + (LZKReg.W /2 + LRet.CutParam.PnlASetHorzSpace))) / 2;
            end;
          end else
          begin
            //如果Reg3添加不了责尝试在Reg1添加
            LMaxW := (LRet.PnlA.W - LRet.PnlA.PBorderSize^.Pnl_ZeroBorderW - LRet.PnlA.PBorderSize^.MinLeftRightW*2 - LRet.CutParam.PnlASetHorzSpace)*2;
            LMaxH := lret.PnlA.Calc4Reg.RegArr[0].H;
            if MakeVerZKReg(StrToFloat(edtZK6mmLength.Text),StrToFloat(edtZK3mmLength.Text),se6mm.Value,se3mm.Value,LZKReg,LZKBlockArr,LMaxW,LMaxH) then
            begin
              if LRet.PnlA.Calc4Reg.RegArr[0].Xnum = 1 then
              begin
                goto VerDef;
              end else
              begin
                MidIndex := Trunc(lRet.PnlA.Calc4Reg.RegArr[0].Xnum /2);
                LPaintDate.Reg.W := LPaintDate.Reg.W + LZKReg.W + LSetHorSpace;
                for I := 0 to Length(LPaintDate.BlockArr) - 1 do
                begin
                  if LPaintDate.BlockArr[I].RegIndex = 0 then
                  begin
                    if LPaintDate.BlockArr[I].ColumIndex+1 > MidIndex then
                    begin
                      LPaintDate.BlockArr[I].X := LPaintDate.BlockArr[I].X + LSetHorSpace + LZKReg.W;
                    end else
                    begin
                      if LPaintDate.BlockArr[I].ColumIndex+1 = MidIndex then
                        LZKReg.X := LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W + LSetHorSpace;
                    end;
                    if LPaintReg.Y > LPaintDate.BlockArr[I].Y then LPaintReg.Y := LPaintDate.BlockArr[I].Y;
                    if (LPaintReg.H) < (LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H) then
                      LPaintReg.H := (LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H);
                  end;
                end;
                LPaintReg.H := LPaintReg.H - LPaintReg.Y;
              end;
              LZKReg.Y := LPaintReg.Y + (LPaintReg.H - LZKReg.H) / 2;
              if (lret.PnlA.Calc4Reg.RegArr[0].W + (LZKReg.W /2 + LRet.CutParam.PnlASetHorzSpace)) > LRet.PnlA.Calc4Reg.RegArr[1].W then
              begin
                LRet.PnlA.PBorderSize^.NowLeftRightW := (LRet.PnlA.W - (LRet.PnlA.Calc4Reg.RegArr[0].W + (LZKReg.W /2 + LRet.CutParam.PnlASetHorzSpace))) / 2;
              end;
            end else
              goto VerDef;
          end;
        end else
        begin
          Verdef:
          LMaxW := (LRet.PnlA.W - LRet.PnlA.PBorderSize^.Pnl_ZeroBorderW - LRet.PnlA.PBorderSize^.MinLeftRightW*2 - LRet.CutParam.PnlASetHorzSpace)*2;
          LMaxH := LRet.PnlA.PBorderSize^.Pnl_ZeroBorderH;
          if MakeVerZKReg(StrToFloat(edtZK6mmLength.Text),StrToFloat(edtZK3mmLength.Text),se6mm.Value,se3mm.Value,LZKReg,LZKBlockArr,LMaxW,LMaxH) then
          begin
            for I := 0 to Length(LPaintDate.BlockArr) - 1 do
            begin
              if LZKReg.X <= LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W + LSetHorSpace then
              begin
                LZKReg.X := LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W + LSetHorSpace;
              end;
            end;
            LPaintDate.Reg.W := LPaintDate.Reg.W + LZKReg.W + LSetHorSpace;
            LZKReg.Y := (LRet.PnlA.PaintData.Reg.H - LZKReg.H) / 2;
            LRet.PnlA.PBorderSize^.NowLeftRightW := lret.PnlA.PBorderSize^.OldLeftRightW - (LZKReg.W /2 + LRet.CutParam.PnlASetHorzSpace)/2;
          end else
          begin
            if not ((se3mm.Value = 0) and (se6mm.Value = 0)) then
              ShowMessage('请手动添加阻抗条');
          end;
        end;
      end;
    end;

    for I := 0 to Length(LZKBlockArr) - 1 do
    begin
      LZKBlockArr[I].X := LZKBlockArr[I].X + LZKReg.X;
      LZKBlockArr[I].Y := LZKBlockArr[I].Y + LZKReg.Y;
    end;
    LPaintDate.ZKBlockArr := LZKBlockArr;
    LPaintDate.ZKReg := LZKReg;
    LRet.PnlA.PaintData := LPaintDate;
  end;
end;

procedure TfrmMain1.AddZK2;
var
  I: Integer;
  bA,bB: Boolean;
begin
  if FSelectRet <> nil then
  begin
    if (se3mm.Value = 0) and (se6mm.Value = 0) then Exit;

    bA := False;
    for I := 0 to 1 do
    begin
      if AddZKPnl(FSelectRet.PnlA,I,1) then
      begin
        bA := True;
        Break;
      end;
    end;
    if not bA then ShowMessage('请手动添加A板阻抗条');

    if (FSelectRet.SheetB <> nil) and (FSelectRet.SheetB.GetCellCount <> 0) and
      (FSelectRet.PnlB <> nil) and (FSelectRet.PnlB.GetCellCount <> 0)
    then
    begin
      bB := False;
      for I := 0 to 1 do
      begin
        if AddZKPnl(FSelectRet.PnlB,I,2) then
        begin
          bB := True;
          Break;
        end;
      end;
      if not bB then
        ShowMessage('请手动添加B板阻抗条');
    end;
  end;
end;

function TfrmMain1.AddZKPnl(APnl: IBlock4Reg; APos: Integer; AB: Integer): Boolean;
var
  LRet: IRet;
  LPaintDate: TPaintData;
  LZKBlockArr: TFloatRectArr;
  LZKReg: TFloatRect;
  LMaxW,LMaxH: Double;
  I: Integer;
  MidIndex: Integer;
  LSetVerSpace,LSetHorSpace: Double;
  LPaintReg: TFloatRect;
  label HorDef;
  label VerDef;
  label AddHorZkToReg1, AddVerZKToReg1;
begin
  Result := False;
  if FSelectRet <> nil then
  begin
    LRet := FSelectRet;
    if APnl.PaintData.CustomImg <> nil  then Exit;
    LRet.PCutParam^.m3ZKLength := StrToFloat(edtZK3mmLength.Text);
    LRet.PCutParam^.m6ZKLength := StrToFloat(edtZK6mmLength.Text);

    LPaintDate := Calc4RegToPaintData(APnl.Calc4Reg,
            LRet.CutParam.PnlASetHorzSpace, LRet.CutParam.PnlASetVertSpace,
            APnl.PBorderSize^.OldLeftRightW,
            APnl.PBorderSize^.OldTopBottomW);
    for I := 0 to Length(LPaintDate.BlockArr) - 1 do
      LPaintDate.BlockArr[I].ArrowCB := APnl.PaintData.BlockArr[I].ArrowCB;
    APnl.PBorderSize^.NowLeftRightW := APnl.PBorderSize^.OldLeftRightW;
    APnl.PBorderSize^.NowTopBottomW := APnl.PBorderSize^.OldTopBottomW;
    if LRet.CutParam.PnlASetVertSpace < 10 then LSetVerSpace := 10 else LSetVerSpace := LRet.CutParam.PnlASetVertSpace;
    if LRet.CutParam.PnlASetHorzSpace < 10 then LSetHorSpace := 10 else LSetHorSpace := LRet.CutParam.PnlASetHorzSpace;
    case APos of
      0: //水平
      begin
        LMaxW := APnl.PBorderSize^.Pnl_ZeroBorderW;
        LMaxH := (APnl.H - APnl.PBorderSize^.Pnl_ZeroBorderH - APnl.PBorderSize^.MinTopBottomW*2 - LRet.CutParam.PnlASetVertSpace)*2;
        //只有Reg——1
        if (APnl.Calc4Reg.RegArr[0].BlockCount <> 0) and
           (APnl.Calc4Reg.AChildCount = APnl.Calc4Reg.RegArr[0].BlockCount)
        then
        begin
          if MakeHorZKReg(StrToFloat(edtZK6mmLength.Text),StrToFloat(edtZK3mmLength.Text),se6mm.Value,se3mm.Value,LZKReg,LZKBlockArr,LMaxW,LMaxH) then
          begin
            if APnl.Calc4Reg.RegArr[0].Ynum = 1 then
            begin
              LZKReg.Y := LPaintDate.BlockArr[0].Y + LPaintDate.BlockArr[0].H + LSetVerSpace;
              LPaintDate.Reg.H := LPaintDate.Reg.H + LZKReg.H + LSetVerSpace;
            end else
            begin
              MidIndex := Trunc(APnl.Calc4Reg.RegArr[0].Ynum /2);
              LPaintDate.Reg.H := LPaintDate.Reg.H + LZKReg.H + LSetVerSpace;
              for I := 0 to Length(LPaintDate.BlockArr) - 1 do
              begin
                if LPaintDate.BlockArr[I].RowIndex+1 > MidIndex then
                begin
                  LPaintDate.BlockArr[I].Y := LPaintDate.BlockArr[I].Y + LSetVerSpace + LZKReg.H;
                end;
              end;
              for I := 0 to Length(LPaintDate.BlockArr) - 1 do
              begin
                if LPaintDate.BlockArr[I].RowIndex+1 = MidIndex then
                begin
                  LZKReg.Y := LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H + LSetVerSpace;
                  Break;
                end;
              end;
            end;
            LZKReg.X := (APnl.PaintData.Reg.W - LZKReg.W) / 2;
            APnl.PBorderSize^.NowTopBottomW := APnl.PBorderSize^.OldTopBottomW - (LZKReg.H /2 + LRet.CutParam.PnlASetVertSpace)/2;
          end else
          begin
            if not ((se3mm.Value = 0) and (se6mm.Value = 0)) then
            begin
              //ShowMessage('请手动添加阻抗条');
              exit;
            end;
          end;
        end else
        //只有Reg-1和3
        if (APnl.Calc4Reg.RegArr[0].BlockCount <> 0) and
           (APnl.Calc4Reg.RegArr[1].BlockCount = 0) and
           (APnl.Calc4Reg.RegArr[2].BlockCount <> 0) and
           (APnl.Calc4Reg.RegArr[3].BlockCount = 0) then
        begin
          if MakeHorZKReg(StrToFloat(edtZK6mmLength.Text),StrToFloat(edtZK3mmLength.Text),se6mm.Value,se3mm.Value,LZKReg,LZKBlockArr,LMaxW,LMaxH) then
          begin
            for I := 0 to Length(LPaintDate.BlockArr) - 1 do
            begin
              if LPaintDate.BlockArr[I].RegIndex = 2 then
              begin
                LPaintDate.BlockArr[I].Y := LPaintDate.BlockArr[I].Y + LSetVerSpace + LZKReg.H;
              end;
            end;
            for I := 0 to Length(LPaintDate.BlockArr) - 1 do
            begin
              if LPaintDate.BlockArr[I].RegIndex = 0 then
              begin
                if LZKReg.Y < LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H + LSetVerSpace then
                  LZKReg.Y := LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H + LSetVerSpace;
              end;
            end;
            LPaintDate.Reg.H := LPaintDate.Reg.H + LZKReg.H + LSetVerSpace;
            LZKReg.X := (APnl.PaintData.Reg.W - LZKReg.W) / 2;
            APnl.PBorderSize^.NowTopBottomW := APnl.PBorderSize^.OldTopBottomW - (LZKReg.H /2 + LRet.CutParam.PnlASetVertSpace)/2;
          end else
          begin
            if not ((se3mm.Value = 0) and (se6mm.Value = 0)) then
            begin
              //ShowMessage('请手动添加阻抗条');
              Exit;
            end;
          end;
        end else
        //只有Reg-1和2
        if (APnl.Calc4Reg.RegArr[0].BlockCount <> 0) and
           (APnl.Calc4Reg.RegArr[1].BlockCount <> 0) and
           (APnl.Calc4Reg.RegArr[2].BlockCount = 0) and
           (APnl.Calc4Reg.RegArr[3].BlockCount = 0) then
        begin
          LMaxH := LMaxH + ((APnl.Calc4Reg.RegArr[0].H - APnl.Calc4Reg.RegArr[1].H)*2);
          LMaxW := APnl.Calc4Reg.RegArr[1].W;
          ZeroMemory(@LPaintReg,SizeOf(LPaintReg));
          LPaintReg.X := 9999999999;
          ////在Reg2中可以添加
          if MakeHorZKReg(StrToFloat(edtZK6mmLength.Text),StrToFloat(edtZK3mmLength.Text),se6mm.Value,se3mm.Value,LZKReg,LZKBlockArr,LMaxW,LMaxH) then
          begin
            if APnl.Calc4Reg.RegArr[1].Ynum = 1 then
            begin
              for I := 0 to Length(LPaintDate.BlockArr) - 1 do
              begin
                if LPaintDate.BlockArr[I].RegIndex = 1 then
                begin
                  LPaintDate.BlockArr[I].Y := LPaintDate.BlockArr[I].Y - (LZKReg.H + LSetVerSpace) / 2;
                  LZKReg.Y := LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H + LSetVerSpace;
                  if LPaintReg.X > LPaintDate.BlockArr[I].X then
                    LPaintReg.x := LPaintDate.BlockArr[I].X;
                  if LPaintReg.W < LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W then
                    LPaintReg.W := LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W;
                end;
              end;
              LPaintReg.W := LPaintReg.W - LPaintReg.X;
              LZKReg.X := LPaintReg.X + (LPaintReg.W - LZKReg.W) /2;
              if APnl.Calc4Reg.RegArr[1].H + LZKReg.H/2 + lret.CutParam.PnlASetVertSpace > APnl.Calc4Reg.RegArr[0].H then
              begin
                APnl.PBorderSize^.NowTopBottomW := APnl.H - (APnl.Calc4Reg.RegArr[1].H + LZKReg.H/2 + lret.CutParam.PnlASetVertSpace);
              end;
            end else
            begin
              MidIndex := Trunc(APnl.Calc4Reg.RegArr[1].Ynum /2);
              //LPaintDate.Reg.H := LPaintDate.Reg.H + LZKReg.H + LSetVerSpace;
              for I := 0 to Length(LPaintDate.BlockArr) - 1 do
              begin
                if LPaintDate.BlockArr[I].RegIndex = 1 then
                begin
                  if LPaintDate.BlockArr[I].RowIndex+1 > MidIndex then
                  begin
                    LPaintDate.BlockArr[I].Y := LPaintDate.BlockArr[I].Y + (LSetVerSpace + LZKReg.H)/2;
                  end else
                  begin
                    LPaintDate.BlockArr[I].Y := LPaintDate.BlockArr[I].Y - (LSetVerSpace + LZKReg.H)/2;
                    if LZKReg.Y < (LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H) then
                      LZKReg.Y := LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H + LSetVerSpace;
                  end;
                  if LPaintReg.X > LPaintDate.BlockArr[I].X then LPaintReg.X := LPaintDate.BlockArr[I].X;
                  if (LPaintReg.W) < (LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W) then
                    LPaintReg.W := (LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W);
                end;
              end;
              LPaintReg.W := LPaintReg.W - LPaintReg.X;
            end;
            LZKReg.X := LPaintReg.X + (LPaintReg.W - LZKReg.W) / 2;
            if APnl.Calc4Reg.RegArr[0].H < (APnl.Calc4Reg.RegArr[1].H + (LZKReg.H /2 + LRet.CutParam.PnlASetVertSpace)) then
            begin
              APnl.PBorderSize^.NowTopBottomW := (APnl.H - (APnl.Calc4Reg.RegArr[1].H + (LZKReg.H /2 + LRet.CutParam.PnlASetVertSpace))) / 2;
            end;
          end else
          //如果Reg2添加不了责尝试在Reg1添加
          begin
            LMaxW := APnl.Calc4Reg.RegArr[0].W;
            LMaxH := (APnl.H - APnl.PBorderSize^.Pnl_ZeroBorderH - APnl.PBorderSize^.MinTopBottomW*2 - LRet.CutParam.PnlASetVertSpace)*2;
            if MakeHorZKReg(StrToFloat(edtZK6mmLength.Text),StrToFloat(edtZK3mmLength.Text),se6mm.Value,se3mm.Value,LZKReg,LZKBlockArr,LMaxW,LMaxH) then
            begin
              if APnl.Calc4Reg.RegArr[0].Ynum = 1 then
              begin
                goto HorDef;
              end else
              begin
                MidIndex := Trunc(APnl.Calc4Reg.RegArr[0].Ynum /2);
                LPaintDate.Reg.H := LPaintDate.Reg.H + LZKReg.H + LSetVerSpace;
                for I := 0 to Length(LPaintDate.BlockArr) - 1 do
                begin
                  if LPaintDate.BlockArr[I].RegIndex = 0 then
                  begin
                    if LPaintDate.BlockArr[I].RowIndex+1 > MidIndex then
                    begin
                      LPaintDate.BlockArr[I].Y := LPaintDate.BlockArr[I].Y + LSetVerSpace + LZKReg.H;
                    end else
                    begin
                      //LPaintDate.BlockArr[I].Y := LPaintDate.BlockArr[I].Y - (LSetVerSpace + LZKReg.H)/2;
                      if LPaintDate.BlockArr[I].RowIndex+1 = MidIndex then
                        LZKReg.Y := LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H + LSetVerSpace;
                    end;
                    if LPaintReg.X > LPaintDate.BlockArr[I].X then LPaintReg.X := LPaintDate.BlockArr[I].X;
                    if (LPaintReg.W) < (LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W) then
                      LPaintReg.W := (LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W);
                  end;
                end;
                LPaintReg.W := LPaintReg.W - LPaintReg.X;
              end;
              LZKReg.X := LPaintReg.X + (LPaintReg.W - LZKReg.W) / 2;
              if (APnl.Calc4Reg.RegArr[0].H + (LZKReg.H /2 + LRet.CutParam.PnlASetVertSpace)) > APnl.Calc4Reg.RegArr[1].H then
              begin
                APnl.PBorderSize^.NowTopBottomW := (APnl.H - (APnl.Calc4Reg.RegArr[0].H + (LZKReg.H /2 + LRet.CutParam.PnlASetVertSpace))) / 2;
              end;

            end else
              goto HorDef;
          end;
        end else
        // 3个全都在
        begin
          HorDef:
          LMaxW := APnl.PBorderSize^.Pnl_ZeroBorderW;
          LMaxH := (APnl.H - APnl.PBorderSize^.Pnl_ZeroBorderH - APnl.PBorderSize^.MinTopBottomW*2 - LRet.CutParam.PnlASetVertSpace)*2;
          if MakeHorZKReg(StrToFloat(edtZK6mmLength.Text),StrToFloat(edtZK3mmLength.Text),se6mm.Value,se3mm.Value,LZKReg,LZKBlockArr,LMaxW,LMaxH) then
          begin
            for I := 0 to Length(LPaintDate.BlockArr) - 1 do
            begin
              if LZKReg.Y <= LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H + LSetVerSpace then
              begin
                LZKReg.Y := LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H + LSetVerSpace;
              end;
            end;
            LPaintDate.Reg.H := LPaintDate.Reg.H + LZKReg.H + LSetVerSpace;
            LZKReg.X := (APnl.PaintData.Reg.W - LZKReg.W) / 2;
            APnl.PBorderSize^.NowTopBottomW := APnl.PBorderSize^.OldTopBottomW - (LZKReg.H /2 + LRet.CutParam.PnlASetVertSpace)/2;
          end else
          begin
            if not ((se3mm.Value = 0) and (se6mm.Value = 0)) then
            begin
              //ShowMessage('请手动添加阻抗条');
              Exit;
            end;
          end;
        end;
      end;
      1:
      begin
        LMaxW := (APnl.W - APnl.PBorderSize^.Pnl_ZeroBorderW - APnl.PBorderSize^.MinLeftRightW*2 - LRet.CutParam.PnlASetHorzSpace)*2;
        LMaxH := APnl.PBorderSize^.Pnl_ZeroBorderH;
        //只有Reg——1
        if (APnl.Calc4Reg.RegArr[0].BlockCount <> 0) and
           (APnl.Calc4Reg.AChildCount = APnl.Calc4Reg.RegArr[0].BlockCount)
        then
        begin
          if MakeVerZKReg(StrToFloat(edtZK6mmLength.Text),StrToFloat(edtZK3mmLength.Text),se6mm.Value,se3mm.Value,LZKReg,LZKBlockArr,LMaxW,LMaxH) then
          begin
            if APnl.Calc4Reg.RegArr[0].Xnum = 1 then
            begin
              LZKReg.X := LPaintDate.BlockArr[0].X + LPaintDate.BlockArr[0].W + LSetHorSpace;
              LPaintDate.Reg.W := LPaintDate.Reg.W + LZKReg.W + LSetHorSpace;
            end else
            begin
              MidIndex := Trunc(APnl.Calc4Reg.RegArr[0].Xnum /2);
              LPaintDate.Reg.W := LPaintDate.Reg.W + LZKReg.W + LSetHorSpace;
              for I := 0 to Length(LPaintDate.BlockArr) - 1 do
              begin
                if LPaintDate.BlockArr[I].ColumIndex+1 > MidIndex then
                begin
                  LPaintDate.BlockArr[I].X := LPaintDate.BlockArr[I].X + LSetHorSpace + LZKReg.W;
                end;
              end;
              for I := 0 to Length(LPaintDate.BlockArr) - 1 do
              begin
                if LPaintDate.BlockArr[I].ColumIndex+1 = MidIndex then
                begin
                  LZKReg.X := LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W + LSetHorSpace;
                  Break;
                end;
              end;
            end;
            LZKReg.Y := (APnl.PaintData.Reg.H - LZKReg.H) / 2;
            APnl.PBorderSize^.NowLeftRightW := APnl.PBorderSize^.OldLeftRightW - (LZKReg.W /2 + LRet.CutParam.PnlASetHorzSpace)/2;
          end else
          begin
            if not ((se3mm.Value = 0) and (se6mm.Value = 0)) then
            begin
              //ShowMessage('请手动添加阻抗条');
              Exit;
            end;
          end;
        end else
        //只有Reg-1和2
        if (APnl.Calc4Reg.RegArr[0].BlockCount <> 0) and
           (APnl.Calc4Reg.RegArr[1].BlockCount <> 0) and
           (APnl.Calc4Reg.RegArr[2].BlockCount = 0) and
           (APnl.Calc4Reg.RegArr[3].BlockCount = 0) then
        begin
          if MakeVerZKReg(StrToFloat(edtZK6mmLength.Text),StrToFloat(edtZK3mmLength.Text),se6mm.Value,se3mm.Value,LZKReg,LZKBlockArr,LMaxW,LMaxH) then
          begin
            for I := 0 to Length(LPaintDate.BlockArr) - 1 do
            begin
              if LPaintDate.BlockArr[I].RegIndex = 1 then
              begin
                LPaintDate.BlockArr[I].X := LPaintDate.BlockArr[I].X + LSetHorSpace + LZKReg.W;
              end;
            end;
            for I := 0 to Length(LPaintDate.BlockArr) - 1 do
            begin
              if LPaintDate.BlockArr[I].RegIndex = 0 then
              begin
                if LZKReg.X < LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W + LSetHorSpace then
                  LZKReg.X := LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W + LSetHorSpace;
              end;
            end;
            LPaintDate.Reg.W := LPaintDate.Reg.W + LZKReg.W + LSetHorSpace;
            LZKReg.Y := (APnl.PaintData.Reg.H - LZKReg.H) / 2;
            APnl.PBorderSize^.NowLeftRightW := APnl.PBorderSize^.OldLeftRightW - (LZKReg.W /2 + LRet.CutParam.PnlASetHorzSpace)/2;
          end else
          begin
            if not ((se3mm.Value = 0) and (se6mm.Value = 0)) then
            begin
              //ShowMessage('请手动添加阻抗条');
              Exit;
            end;
          end;
        end else
        //只有Reg-1和3
        if (APnl.Calc4Reg.RegArr[0].BlockCount <> 0) and
           (APnl.Calc4Reg.RegArr[1].BlockCount = 0) and
           (APnl.Calc4Reg.RegArr[2].BlockCount <> 0) and
           (APnl.Calc4Reg.RegArr[3].BlockCount = 0) then
        begin
          LMaxW := LMaxW + (APnl.Calc4Reg.RegArr[0].W - APnl.Calc4Reg.RegArr[2].W)*2;
          LMaxH := APnl.Calc4Reg.RegArr[2].H;
          ZeroMemory(@LPaintReg,SizeOf(LPaintReg));
          LPaintReg.Y := 9999999999;
          //尝试在REG3添加
          if MakeVerZKReg(StrToFloat(edtZK6mmLength.Text),StrToFloat(edtZK3mmLength.Text),se6mm.Value,se3mm.Value,LZKReg,LZKBlockArr,LMaxW,LMaxH) then
          begin
            if APnl.Calc4Reg.RegArr[2].Xnum = 1 then
            begin
              for I := 0 to Length(LPaintDate.BlockArr) - 1 do
              begin
                if LPaintDate.BlockArr[I].RegIndex = 2 then
                begin
                  LPaintDate.BlockArr[I].X := LPaintDate.BlockArr[I].X - (LZKReg.W + LSetHorSpace) / 2;
                  LZKReg.X := LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W + LSetHorSpace;
                  if LPaintReg.Y > LPaintDate.BlockArr[I].Y then
                    LPaintReg.Y := LPaintDate.BlockArr[I].Y;
                  if LPaintReg.H < LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H then
                    LPaintReg.H := LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H;
                end;
              end;
              LPaintReg.H := LPaintReg.H - LPaintReg.Y;
              LZKReg.Y := LPaintReg.Y + (LPaintReg.H - LZKReg.H) /2;
              if APnl.Calc4Reg.RegArr[2].W + LZKReg.W/2 + lret.CutParam.PnlASetHorzSpace > APnl.Calc4Reg.RegArr[0].W then
              begin
                APnl.PBorderSize^.NowLeftRightW := APnl.W - (APnl.Calc4Reg.RegArr[2].W + LZKReg.W/2 + lret.CutParam.PnlASetHorzSpace);
              end;
            end else
            begin
              MidIndex := Trunc(APnl.Calc4Reg.RegArr[2].Xnum /2);
              for I := 0 to Length(LPaintDate.BlockArr) - 1 do
              begin
                if LPaintDate.BlockArr[I].RegIndex = 2 then
                begin
                  if LPaintDate.BlockArr[I].ColumIndex+1 > MidIndex then
                  begin
                    LPaintDate.BlockArr[I].X := LPaintDate.BlockArr[I].X + (LSetHorSpace + LZKReg.W)/2;
                  end else
                  begin
                    LPaintDate.BlockArr[I].X := LPaintDate.BlockArr[I].X - (LSetHorSpace + LZKReg.W)/2;
                    if LZKReg.X < (LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W) then
                      LZKReg.X := LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W + LSetHorSpace;
                  end;
                  if LPaintReg.Y > LPaintDate.BlockArr[I].Y then LPaintReg.Y := LPaintDate.BlockArr[I].Y;
                  if (LPaintReg.H) < (LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H) then
                    LPaintReg.H := (LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H);
                end;
              end;
              LPaintReg.H := LPaintReg.H - LPaintReg.Y;
            end;
            LZKReg.Y := LPaintReg.Y + (LPaintReg.H - LZKReg.H) / 2;
            if APnl.Calc4Reg.RegArr[0].W < (APnl.Calc4Reg.RegArr[2].W + (LZKReg.W /2 + LRet.CutParam.PnlASetHOrzSpace)) then
            begin
              APnl.PBorderSize^.NowLeftRightW := (APnl.W - (APnl.Calc4Reg.RegArr[2].W + (LZKReg.W /2 + LRet.CutParam.PnlASetHorzSpace))) / 2;
            end;
          end else
          begin
            //如果Reg3添加不了责尝试在Reg1添加
            LMaxW := (APnl.W - APnl.PBorderSize^.Pnl_ZeroBorderW - APnl.PBorderSize^.MinLeftRightW*2 - LRet.CutParam.PnlASetHorzSpace)*2;
            LMaxH := APnl.Calc4Reg.RegArr[0].H;
            if MakeVerZKReg(StrToFloat(edtZK6mmLength.Text),StrToFloat(edtZK3mmLength.Text),se6mm.Value,se3mm.Value,LZKReg,LZKBlockArr,LMaxW,LMaxH) then
            begin
              if APnl.Calc4Reg.RegArr[0].Xnum = 1 then
              begin
                goto VerDef;
              end else
              begin
                MidIndex := Trunc(APnl.Calc4Reg.RegArr[0].Xnum /2);
                LPaintDate.Reg.W := LPaintDate.Reg.W + LZKReg.W + LSetHorSpace;
                for I := 0 to Length(LPaintDate.BlockArr) - 1 do
                begin
                  if LPaintDate.BlockArr[I].RegIndex = 0 then
                  begin
                    if LPaintDate.BlockArr[I].ColumIndex+1 > MidIndex then
                    begin
                      LPaintDate.BlockArr[I].X := LPaintDate.BlockArr[I].X + LSetHorSpace + LZKReg.W;
                    end else
                    begin
                      if LPaintDate.BlockArr[I].ColumIndex+1 = MidIndex then
                        LZKReg.X := LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W + LSetHorSpace;
                    end;
                    if LPaintReg.Y > LPaintDate.BlockArr[I].Y then LPaintReg.Y := LPaintDate.BlockArr[I].Y;
                    if (LPaintReg.H) < (LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H) then
                      LPaintReg.H := (LPaintDate.BlockArr[I].Y + LPaintDate.BlockArr[I].H);
                  end;
                end;
                LPaintReg.H := LPaintReg.H - LPaintReg.Y;
              end;
              LZKReg.Y := LPaintReg.Y + (LPaintReg.H - LZKReg.H) / 2;
              if (APnl.Calc4Reg.RegArr[0].W + (LZKReg.W /2 + LRet.CutParam.PnlASetHorzSpace)) > APnl.Calc4Reg.RegArr[1].W then
              begin
                APnl.PBorderSize^.NowLeftRightW := (APnl.W - (APnl.Calc4Reg.RegArr[0].W + (LZKReg.W /2 + LRet.CutParam.PnlASetHorzSpace))) / 2;
              end;
            end else
              goto VerDef;
          end;
        end else
        begin
          Verdef:
          LMaxW := (APnl.W - APnl.PBorderSize^.Pnl_ZeroBorderW - APnl.PBorderSize^.MinLeftRightW*2 - LRet.CutParam.PnlASetHorzSpace)*2;
          LMaxH := APnl.PBorderSize^.Pnl_ZeroBorderH;
          if MakeVerZKReg(StrToFloat(edtZK6mmLength.Text),StrToFloat(edtZK3mmLength.Text),se6mm.Value,se3mm.Value,LZKReg,LZKBlockArr,LMaxW,LMaxH) then
          begin
            for I := 0 to Length(LPaintDate.BlockArr) - 1 do
            begin
              if LZKReg.X <= LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W + LSetHorSpace then
              begin
                LZKReg.X := LPaintDate.BlockArr[I].X + LPaintDate.BlockArr[I].W + LSetHorSpace;
              end;
            end;
            LPaintDate.Reg.W := LPaintDate.Reg.W + LZKReg.W + LSetHorSpace;
            LZKReg.Y := (APnl.PaintData.Reg.H - LZKReg.H) / 2;
            APnl.PBorderSize^.NowLeftRightW := APnl.PBorderSize^.OldLeftRightW - (LZKReg.W /2 + LRet.CutParam.PnlASetHorzSpace)/2;
          end else
          begin
            if not ((se3mm.Value = 0) and (se6mm.Value = 0)) then
            begin
              //ShowMessage('请手动添加阻抗条');
              Exit;
            end;
          end;
        end;
      end;
    end;

    for I := 0 to Length(LZKBlockArr) - 1 do
    begin
      LZKBlockArr[I].X := LZKBlockArr[I].X + LZKReg.X;
      LZKBlockArr[I].Y := LZKBlockArr[I].Y + LZKReg.Y;
    end;
    LPaintDate.ZKBlockArr := LZKBlockArr;
    LPaintDate.ZKReg := LZKReg;
    if AB = 1 then
      LRet.PnlA.PaintData := LPaintDate
    else if AB = 2 then
      LRet.PnlB.PaintData := LPaintDate;
    Result := True;
  end;

end;

procedure TfrmMain1.AutoBorder(ARet: IRet);
var
  LRet: IRet;
  LPnlCalc4Reg,LSheetCalc4Reg: TCalc4Reg;
  PnlBorderWAdd,PnlBorderHAdd: Double;
  LPaintData: TPaintData;
  LBorderSize: TBorderSize;
begin
  PnlBorderWAdd := 0;
  PnlBorderHAdd := 0;
  LRet := ARet;
  //双拼版跳过
  if LRet.SheetB <> nil then
  begin
    if LRet.SheetB.GetCellCount <> 0 then
    Exit;
  end;

  CopyMemory(@LBorderSize,LRet.PnlA.PBorderSize,SizeOf(LBorderSize));
  LPnlCalc4Reg := LRet.PnlA.Calc4Reg;
  LSheetCalc4Reg := LRet.SheetA.Calc4Reg;
  //只有大料只有 Reg1
  if LSheetCalc4Reg.RegArr[0].BlockCount = LRet.SheetA.GetCellCount then
  begin
    if not LSheetCalc4Reg.RegArr[0].Block.R then
    begin
      PnlBorderWAdd := ((LRet.CutParam.SheetW / LSheetCalc4Reg.RegArr[0].Xnum) - LPnlCalc4Reg.W) / 2;
      PnlBorderHAdd := ((LRet.CutParam.SheetH / LSheetCalc4Reg.RegArr[0].Ynum) - LPnlCalc4Reg.H) / 2;
      LPnlCalc4Reg.W := LPnlCalc4Reg.W + 2*PnlBorderWAdd;
      LPnlCalc4Reg.H := LPnlCalc4Reg.H + 2*PnlBorderHAdd;
    end else
    begin
      PnlBorderHAdd := ((LRet.CutParam.SheetW / LSheetCalc4Reg.RegArr[0].Xnum) - LPnlCalc4Reg.H) / 2;
      PnlBorderWAdd := ((LRet.CutParam.SheetH / LSheetCalc4Reg.RegArr[0].Ynum) - LPnlCalc4Reg.W) / 2;
      LPnlCalc4Reg.H := LPnlCalc4Reg.H + 2*PnlBorderHAdd;
      LPnlCalc4Reg.W := LPnlCalc4Reg.W + 2*PnlBorderWAdd;
    end;
    LSheetCalc4Reg.RegArr[0].Block.W := LPnlCalc4Reg.W;
    LSheetCalc4Reg.RegArr[0].Block.H := LPnlCalc4Reg.H;
  end;
  //大料只有 Reg1 和 Reg2
  if (LSheetCalc4Reg.RegArr[0].BlockCount <> 0) and
     (LSheetCalc4Reg.RegArr[1].BlockCount <> 0) and
     (LSheetCalc4Reg.RegArr[2].BlockCount = 0) and
     (LSheetCalc4Reg.RegArr[3].BlockCount = 0)
  then
  begin
    if LSheetCalc4Reg.RegArr[0].Block.R and ( not LSheetCalc4Reg.RegArr[1].Block.R) then
    begin

    end;
    if (not LSheetCalc4Reg.RegArr[0].Block.R) and LSheetCalc4Reg.RegArr[1].Block.R then
    begin

    end;
  end;

  LBorderSize.NowLeftRightW := LBorderSize.NowLeftRightW + PnlBorderWAdd;
  LBorderSize.NowTopBottomW := LBorderSize.NowTopBottomW + PnlBorderHAdd;
  LBorderSize.MaxLeftRightW := LBorderSize.NowLeftRightW;
  LBorderSize.MaxTOpBottomW := LBorderSize.NowTopBottomW;
  LBorderSize.OldLeftRightW := LBorderSize.NowLeftRightW;
  LBorderSize.OldTopBottomW := LBorderSize.NowTopBottomW;

  //Sheet
  LRet.SheetA := Calc4RegToIBlock4Reg(LSheetCalc4Reg, 0, 0, 0, 0);
  LRet.SheetA.W := LRet.CutParam.SheetW;
  LRet.SheetA.H := LRet.CutParam.SheetH;
  LRet.SheetA.Calc4Reg := LSheetCalc4Reg;
  LPaintData := Calc4RegToPaintData(LSheetCalc4Reg, 0, 0, 0, 0, False);
  LPaintData.Reg.W := LRet.CutParam.SheetW;
  LPaintData.Reg.H := LRet.CutParam.SheetH;
  LRet.SheetA.PaintData := LPaintData;
  LRet.SetSheetUseage(
  ((LRet.SheetA.GetCellCount* LRet.PnlA.GetCellCount + LRet.SheetB.GetCellCount* LRet.PnlB.GetCellCount) * lret.CutParam.PnlASetW* LRet.CutParam.PnlASetH)
  / (LRet.CutParam.SheetW * LRet.CutParam.SheetH)
  * 100);

  //Pnl_A
  LRet.PnlA := Calc4RegToIBlock4Reg(LPnlCalc4Reg,
    LRet.CutParam.PnlASetHorzSpace, LRet.CutParam.PnlASetVertSpace,
    LRet.CutParam.PnlABorderLeftRightWidth,
    LRet.CutParam.PnlABorderTopBottomWidth);
  LRet.PnlA.W := LPnlCalc4Reg.W;
  LRet.PnlA.H := LPnlCalc4Reg.H;
  LRet.PnlA.Calc4Reg := LPnlCalc4Reg;
  CopyMemory(LRet.PnlA.PBorderSize,@LBorderSize,SizeOf(LBorderSize));
  LRet.PnlA.PaintData := Calc4RegToPaintData(LPnlCalc4Reg,
    LRet.CutParam.PnlASetHorzSpace, LRet.CutParam.PnlASetVertSpace,
    LRet.CutParam.PnlABorderLeftRightWidth,
    LRet.CutParam.PnlABorderTopBottomWidth);
  LRet.PnlA.OriginalPaintData := Calc4RegToPaintData(LPnlCalc4Reg,
    LRet.CutParam.PnlASetHorzSpace, LRet.CutParam.PnlASetVertSpace,
    LRet.CutParam.PnlABorderLeftRightWidth,
    LRet.CutParam.PnlABorderTopBottomWidth);
end;

procedure TfrmMain1.AutoBorderAB(ARet: IRet);
var
  LRetA,LRetB: IRet;
  I: Integer;
  LBlock: TFloatRect;
  Ltmp: Double;
begin
  LRetA := TRet.Create;
  LRetA.SheetA := ARet.SheetA;
  LRetA.PnlA := ARet.PnlA;
  LRetA.CutParam := ARet.CutParam;
  Ltmp := 0;
  //LOldH := 0;
  if ARet.SheetB.Calc4Reg.Hor_Ver = 0 then
  //上下
  begin
//    for I := 0 to Length(LRetA.SheetA.PaintData.BlockArr) - 1 do
//    begin
//      LBlock := LRetA.SheetA.PaintData.BlockArr[I];
//      if (LBlock.Y + LBlock.H) > LOldH then
//        LOldH := LBlock.Y + LBlock.H;
//    end;

    LRetA.PCutParam^.SheetH := (LRetA.CutParam.SheetH - ARet.SheetB.H);
    AutoBorder(LRetA);
    for I := 0 to Length(LRetA.SheetA.PaintData.BlockArr) - 1 do
    begin
      LBlock := LRetA.SheetA.PaintData.BlockArr[I];
      if (LBlock.Y + LBlock.H) > Ltmp then
        Ltmp := LBlock.Y + LBlock.H;
    end;
    LRetA.SheetA.H := LRetA.CutParam.SheetH;
    LRetA.SheetA.H := Ltmp;
    ARet.SheetA := LRetA.SheetA;
    ARet.PnlA := LRetA.PnlA;

    LRetB := TRet.Create;
    LRetB.SheetA := ARet.SheetB;
    LRetB.PnlA := ARet.PnlB;
    LRetB.CutParam := ARet.CutParam;
    LRetB.PCutParam^.SheetH := ARet.CutParam.SheetH - Ltmp;
    AutoBorder(LRetB);
    ARet.SheetB := LRetB.SheetA;
    ARet.PnlB := LRetB.PnlA;
    for I := 0 to Length(ARet.SheetB.PaintData.BlockArr) - 1 do
    begin
      aret.SheetB.PaintData.BlockArr[I].Y := ARet.SheetB.PaintData.BlockArr[I].Y + Ltmp;
    end;

  end else
  if ARet.SheetB.Calc4Reg.Hor_Ver = 1 then
  //左右
  begin
    LRetA.PCutParam^.SheetW := (LRetA.CutParam.SheetW - ARet.SheetB.W);
    AutoBorder(LRetA);
    for I := 0 to Length(LRetA.SheetA.PaintData.BlockArr) - 1 do
    begin
      LBlock := LRetA.SheetA.PaintData.BlockArr[I];
      if (LBlock.X + LBlock.W) > Ltmp then
        Ltmp := LBlock.X + LBlock.W;
    end;
    LRetA.SheetA.W := LRetA.CutParam.SheetW;;
    LRetA.SheetA.W := Ltmp;
    ARet.SheetA := LRetA.SheetA;
    aret.PnlA := LRetA.PnlA;

    LRetB := TRet.Create;
    LRetB.SheetA := ARet.SheetB;
    LRetB.PnlA := ARet.PnlB;
    LRetB.CutParam := ARet.CutParam;
    LRetB.PCutParam^.SheetW := ARet.CutParam.SheetW - Ltmp;
    AutoBorder(LRetB);
    ARet.SheetB := LRetB.SheetA;
    ARet.PnlB := LRetB.PnlA;
    for I := 0 to Length(ARet.SheetB.PaintData.BlockArr) - 1 do
    begin
      aret.SheetB.PaintData.BlockArr[I].X := ARet.SheetB.PaintData.BlockArr[I].X + Ltmp;
    end;
  end;

end;

procedure TfrmMain1.btnAutoCutClick(Sender: TObject);
begin
  if FillCutParam then
  begin
    FRetLst.Clear;
    ShowProgressFrm(Self,FCutParamArr,FRetLst);
    AddIRetTolv;
  end;
end;

procedure TfrmMain1.btnGXClick(Sender: TObject);
var
  //LPaintData: TPaintData;
  LTmpMap,LDesMap: IGPBitmap;
  LGP: IGPGraphics;
  LimgFile: string;
  LW,LH: Integer;
begin
  if FSelectRet = nil then
  begin
    ShowMessage('请先拼版并选择一个结果');
    Exit;
  end;

  LimgFile := ExtractFilePath(ParamStr(0)) + 'tmpImg.JPG';
  if FGXEnable then
  begin
    if not FileExists(LimgFile) then
    begin
      ShowMessage('画图文件没找到，请保存为JPG格式的文件');
      Exit;
    end;
    LTmpMap := TGPBitmap.Create(LimgFile);
    LW := LTmpMap.Width;
    LH := LTmpMap.Height;
    LDesMap := TGPBitmap.Create(LW,LH);
    LGP := TGPGraphics.Create(LDesMap);
    LGP.DrawImage(LTmpMap,0,0,LTmpMap.Width,LTmpMap.Height);

    if FSelectRet <> nil then
    begin
      case FMainImgIndex of
        0,1:begin
          FSelectRet.SheetA.PPaintData^.CustomImg := LDesMap;
        end;
        2:begin
          FSelectRet.PnlA.PPaintData^.CustomImg := LDesMap;
        end;
        3:begin
          FSelectRet.PnlB.PPaintData^.CustomImg := LDesMap;
        end;
      end;
      lvRetClick(lvRet);
    end;
  end;
  FGXEnable := False;
end;

procedure TfrmMain1.btnHTClick(Sender: TObject);
var
  lFile: string;
  LDesBitMap: IGPBitmap;
  LGP: IGPGraphics;
  LBrush: IGPBrush;
begin
  if FSelectRet <> nil then
  begin
    lFile := ExtractFilePath(ParamStr(0)) + 'tmpImg.JPG';
    case FMainImgIndex of
      0,1:begin
        LDesBitMap := TGPBitmap.Create(SAVEIMAGEW,SAVEIMAGEH);
        LGP := TGPGraphics.Create(LDesBitMap);
        LBrush := TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR));
        LGP.FillRectangle(LBrush,TGPRectF.Create(0,0,LDesBitMap.Width, LDesBitMap.Height));
        LGP.InterpolationMode := InterpolationModeHighQualityBicubic;
        LGP.DrawImage(gDrawEng.FGPSheetImg,TGPRectF.Create(0,0,LDesBitMap.Width, LDesBitMap.Height),
          0,0,gDrawEng.FGPSheetImg.Width,gDrawEng.FGPSheetImg.Height,UnitPixel);
        LDesBitMap.Save(lFile,TGPImageFormat.Jpeg);

        ShellExecute(0,'open','mspaint.exe',PWideChar(lFile),nil,SW_SHOWNORMAL);
        FGXEnable := True;
      end;
      2:begin
        LDesBitMap := TGPBitmap.Create(SAVEIMAGEW,SAVEIMAGEH);
        LGP := TGPGraphics.Create(LDesBitMap);
        LBrush := TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR));
        LGP.FillRectangle(LBrush,TGPRectF.Create(0,0,LDesBitMap.Width, LDesBitMap.Height));
        LGP.InterpolationMode := InterpolationModeHighQualityBicubic;
        LGP.DrawImage(gDrawEng.FGPPnlAImg,TGPRectF.Create(0,0,LDesBitMap.Width, LDesBitMap.Height),
          0,0,gDrawEng.FGPPnlAImg.Width,gDrawEng.FGPPnlAImg.Height,UnitPixel);
        LDesBitMap.Save(lFile,TGPImageFormat.Jpeg);

        ShellExecute(0,'open','mspaint.exe',PWideChar(lFile),nil,SW_SHOWNORMAL);
        FGXEnable := True;
      end;
      3:begin

      end;
    end;
  end else
    ShowMessage('没有拼版结果');
end;

procedure TfrmMain1.btnLoadPictureClick(Sender: TObject);
var
  LPt1,LPt2: TPoint;
begin
  LPt1.X := (Sender as TBitBtn).Left;
  LPt1.Y := (Sender as TBitBtn).Top+(Sender as TBitBtn).Height;
  LPt2 :=  ClientToScreen(LPt1);
  pmInportImg.Popup(LPt2.X,LPt2.Y);
end;

procedure TfrmMain1.btnManuCutClick(Sender: TObject);
var
  LFrm: TfrmManuCut;
begin
  LFrm := TfrmManuCut.Create(Self);
  try
    if LFrm.ShowModal = mrOk then
    begin
      lvRet.Clear;
      FRetLst.Clear;
      FRetLst.Add(LFrm.FRet);
      AddIRetTolv;
    end;
  finally
    LFrm.Free;
  end;
//
end;

procedure TfrmMain1.btnWeiTiaoClick(Sender: TObject);
var
  LRet: IRet;
  LNewW,LNewH,LNewBorderLeftRightW,LNewBorderTopBottomW: Double;
  LSheetCalc4Reg: TCalc4Reg;
  I: Integer;
  LSheet: IBlock4Reg;
begin
  if FSelectRet = nil then
  begin
    ShowMessage('请先选择一个拼版结果');
    Exit;
  end;
  if FSelectRet.SheetA.PaintData.CustomImg <> nil then
  begin
    ShowMessage('不能够微调自定义图片');
    Exit;
  end;
  if FSelectRet.PnlA.PaintData.CustomImg <> nil then
  begin
    ShowMessage('不能够微调自定义图片');
    Exit;
  end;
  if (FSelectRet.PnlB <> nil) and (FSelectRet.PnlB.PaintData.CustomImg <> nil) then
  begin
    ShowMessage('不能够微调自定义图片');
    Exit;
  end;
  if (FSelectRet.SheetB <> nil) and (FSelectRet.PnlB <> nil) then
  begin
    ShowMessage('暂时不能够微调AB双拼版');
    Exit;
  end;

  LRet := FSelectRet;
  //PnlA
  LNewW := StrToFloat(edtPnlW_A.Text);
  LNewH := StrToFloat(edtPnlH_A.Text);
  LNewBorderLeftRightW := (LNewW - LRet.PnlA.PBorderSize^.Pnl_ZeroBorderW) / 2;
  LNewBorderTopBottomW := (LNewH - LRet.PnlA.PBorderSize^.Pnl_ZeroBorderH) / 2;
  if (LNewBorderLeftRightW < 0) or (LNewBorderTopBottomW < 0) then
  begin
    ShowMessage('板边小于0!');
    Exit;
  end;

  LSheetCalc4Reg := LRet.SheetA.Calc4Reg;
  for I := 0 to Length(LSheetCalc4Reg.RegArr) - 1 do
  begin
    LSheetCalc4Reg.RegArr[I].Block.W := LNewW;
    LSheetCalc4Reg.RegArr[I].Block.H := LNewH;
  end;
  LSheet := Calc4RegToIBlock4Reg(LSheetCalc4Reg, 0, 0, 0, 0);
  if (LSheet.W > LRet.CutParam.SheetW) or (LSheet.H > LRet.CutParam.SheetH) then
  begin
    ShowMessage('超出大料的尺寸!');
    Exit;
  end;

  //Sheet
  LRet.SheetA := Calc4RegToIBlock4Reg(LSheetCalc4Reg, 0, 0, 0, 0);
  LRet.SheetA.W := LRet.CutParam.SheetW;
  LRet.SheetA.H := LRet.CutParam.SheetH;
  LRet.SheetA.Calc4Reg := LSheetCalc4Reg;
  LRet.SheetA.PaintData := Calc4RegToPaintData(LSheetCalc4Reg, 0, 0, 0, 0, False);
  LRet.SheetA.PPaintData^.Reg.W := LRet.CutParam.SheetW;
  LRet.SheetA.PPaintData^.Reg.H := LRet.CutParam.SheetH;
  LRet.SheetA.SetUseAge(
  (LRet.SheetA.GetCellCount* LRet.PnlA.GetCellCount * lret.CutParam.PnlASetW* LRet.CutParam.PnlASetH)
  / (LRet.CutParam.SheetW * LRet.CutParam.SheetH)
  * 100);

  LRet.PnlA.PCalc4Reg^.W := LNewW;
  LRet.PnlA.PCalc4Reg^.H := LNewH;
  LRet.PnlA.W := LNewW;
  LRet.PnlA.H := LNewH;
  LRet.PnlA.PBorderSize^.NowLeftRightW := LNewBorderLeftRightW;
  LRet.PnlA.PBorderSize^.NowTopBottomW := LNewBorderTopBottomW;
  LRet.PnlA.PBorderSize^.OldLeftRightW := LNewBorderLeftRightW;
  LRet.PnlA.PBorderSize^.OldTopBottomW := LNewBorderTopBottomW;

  lvRetClick(lvRet);
end;

procedure TfrmMain1.btnSaveClick(Sender: TObject);
var
  LIni: TIniFile;
  LGP: IGPGraphics;
  LDesBitMap: IGPBitmap;
  LBrush: IGPBrush;
  LFileName: string;
  LRet: IRet;
begin
  if FSelectRet = nil then
  begin
    ShowMessage('请先拼版并选择一个拼版结果!');
    Exit;
  end;
  LRet := FSelectRet;
  LFileName := ExtractFilePath(ParamStr(0))+'PinBan.ini';
  LIni := TIniFile.Create(LFileName);
  try
    LIni.EraseSection('CutRet');
    LIni.WriteString('CutRet','SheetW',FormatFloat('0.000',StrToFloat(edtSheetW.Text)));
    LIni.WriteString('CutRet','SheetH',FormatFloat('0.000',StrToFloat(edtSheetH.Text)));
    LIni.WriteString('CutRet','PnlW_A',FormatFloat('0.000',StrToFloat(edtPnlW_A.Text)));
    LIni.WriteString('CutRet','PnlH_A',FormatFloat('0.000',StrToFloat(edtPnlH_A.Text)));
    LIni.WriteString('CutRet','SetW_A',FormatFloat('0.000',StrToFloat(edtSetW_A.Text)));
    LIni.WriteString('CutRet','SetH_A',FormatFloat('0.000',StrToFloat(edtSetH_A.Text)));
    LIni.WriteString('CutRet','SetHorSapce_A',FormatFloat('0.000',StrToFloat(edtSetSpaceX_A.Text)));
    LIni.WriteString('CutRet','SetVerSpace_A',FormatFloat('0.000',StrToFloat(edtSetSpaceY_A.Text)));
    LIni.WriteString('CutRet','PnlLeftRightBorderW_A',FormatFloat('0.000',LRet.PnlA.PBorderSize^.NowLeftRightW));
    LIni.WriteString('CutRet','PnlTopBottomBorderW_A',FormatFloat('0.000',LRet.PnlA.PBorderSize^.NowTopBottomW));
    LIni.WriteString('CutRet','PnlCount_A',IntToStr(Trunc(StrTofloat(edtPnlCount_A.Text))));
    LIni.WriteString('CutRet','SetCountPerPnl_A',IntToStr(Trunc(StrTofloat(edtSetPerPnl_A.Text))));
    if cbxDoubleCut.Checked then
      LIni.WriteString('CutRet','DoublePnl','1')
    else
      LIni.WriteString('CutRet','DoublePnl','0');

    LIni.WriteString('CutRet','PnlW_B',FormatFloat('0.000',StrToFloatDef(edtPnlW_B.Text,0)));
    LIni.WriteString('CutRet','PnlH_B',FormatFloat('0.000',StrToFloatDef(edtPnlH_B.Text,0)));
    LIni.WriteString('CutRet','PnlLeftRightBorderW_B',FormatFloat('0.000',StrToFloatDef(edtPnlLeftRightBorderW_B.Text,0)));
    LIni.WriteString('CutRet','PnlTopBottomBorderW_B',FormatFloat('0.000',StrToFloatDef(edtPnlTopBottomBorderW_B.Text,0)));
    LIni.WriteString('CutRet','SetCountPerPnl_B',IntToStr(Trunc(StrTofloat(edtSetPerPnl_B.Text))));
    LIni.WriteString('CutRet','PnlCount_B',IntToStr(Trunc(StrTofloat(edtPnlCount_B.Text))));

    LIni.WriteString('CutRet','SheetSetCount',IntToStr(Trunc(StrTofloat(edtSheetSetCount.Text))));
    LIni.WriteString('CutRet','SheetUseage',FormatFloat('0.000',StrToFloat(edtSheetUseage.Text)));

    if gDrawEng.FGPSheetImg <> nil then
    begin
      LDesBitMap := TGPBitmap.Create(SAVEIMAGEW,SAVEIMAGEH);
      LGP := TGPGraphics.Create(LDesBitMap);
      LBrush := TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR));
      LGP.FillRectangle(LBrush,TGPRectF.Create(0,0,LDesBitMap.Width, LDesBitMap.Height));
      LGP.InterpolationMode := InterpolationModeHighQualityBicubic;
      LGP.DrawImage(gDrawEng.FGPSheetImg,TGPRectF.Create(0,0,LDesBitMap.Width, LDesBitMap.Height),
        0,0,gDrawEng.FGPSheetImg.Width,gDrawEng.FGPSheetImg.Height,UnitPixel);
      LDesBitMap.Save(ExtractFilePath(LFileName)+ 'SheetImg.JPG',TGPImageFormat.Jpeg);
      LIni.WriteString('CutRet','SheetImg',ExtractFilePath(LFileName)+ 'SheetImg.JPG');
    end else
      LIni.WriteString('CutRet','SheetImg','');

    if gDrawEng.FGPPnlAImg <> nil then
    begin
      LDesBitMap := TGPBitmap.Create(SAVEIMAGEW,SAVEIMAGEH);
      LGP := TGPGraphics.Create(LDesBitMap);
      LBrush := TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR));
      LGP.FillRectangle(LBrush,TGPRectF.Create(0,0,LDesBitMap.Width, LDesBitMap.Height));
      LGP.InterpolationMode := InterpolationModeHighQualityBicubic;
      LGP.DrawImage(gDrawEng.FGPPnlAImg,TGPRectF.Create(0,0,LDesBitMap.Width, LDesBitMap.Height),
        0,0,gDrawEng.FGPPnlAImg.Width,gDrawEng.FGPPnlAImg.Height,UnitPixel);
      LDesBitMap.Save(ExtractFilePath(LFileName)+ 'PnlImg_A.JPG',TGPImageFormat.Jpeg);
      LIni.WriteString('CutRet','PnlImg_A',ExtractFilePath(LFileName)+ 'PnlImg_A.JPG');
    end else
      LIni.WriteString('CutRet','PnlImg_A','');

    if gDrawEng.FGPPnlBImg <> nil then
    begin
      LDesBitMap := TGPBitmap.Create(SAVEIMAGEW,SAVEIMAGEH);
      LGP := TGPGraphics.Create(LDesBitMap);
      LBrush := TGPSolidBrush.Create(TGPColor.CreateFromColorRef(BACKGROUNDCOLOR));
      LGP.FillRectangle(LBrush,TGPRectF.Create(0,0,LDesBitMap.Width, LDesBitMap.Height));
      LGP.InterpolationMode := InterpolationModeHighQualityBicubic;
      LGP.DrawImage(gDrawEng.FGPPnlBImg,TGPRectF.Create(0,0,LDesBitMap.Width, LDesBitMap.Height),
        0,0,gDrawEng.FGPPnlBImg.Width,gDrawEng.FGPPnlBImg.Height,UnitPixel);
      LDesBitMap.Save(ExtractFilePath(LFileName)+ 'PnlImg_B.JPG',TGPImageFormat.Jpeg);
      LIni.WriteString('CutRet','PnlImg_B',ExtractFilePath(LFileName)+ 'PnlImg_B.JPG');
    end else
      LIni.WriteString('CutRet','PnlImg_B','');


  finally
    LIni.Free;
  end;
  ModalResult := mrOk;
end;

procedure TfrmMain1.btnSetClick(Sender: TObject);
var
  LPt1,LPt2: TPoint;
begin
  LPt1.X := (Sender as TBitBtn).Left;
  LPt1.Y := (Sender as TBitBtn).Top+(Sender as TBitBtn).Height;
  LPt2 :=  ClientToScreen(LPt1);
  pmSet.Popup(LPt2.X,LPt2.Y);
end;


procedure TfrmMain1.cbxCBSelectClick(Sender: TObject);
begin
  seCBSelect.Enabled := cbxCBSelect.Checked;
end;

procedure TfrmMain1.AddAutoKL;
var
  I: Integer;
  LRet: IRet;
begin
  for I := 0 to lvRet.Items.Count - 1 do
  begin
    LRet := FSelectRet;
    LRet.SheetA.PPaintData.AutoCut := not cbxManuCut.Checked;
    if LRet.SheetB <> nil then LRet.SheetB.PPaintData.AutoCut := not cbxManuCut.Checked;
  end;
end;

procedure TfrmMain1.AddCB();
var
  I: Integer;
begin

  if FSelectRet <> nil then
  begin
    case rgCB_AB.ItemIndex of
      1:
      begin
        //添加水平冲板
        for I := 0 to Length(FSelectRet.PnlA.PaintData.BlockArr) - 1 do
        begin
          if cbxCBSelect.Checked then
            if I <> seCBSelect.Value then Continue;

          if FSelectRet.PnlA.PaintData.BlockArr[I].W >= FSelectRet.PnlA.PaintData.BlockArr[I].H then
            FSelectRet.PnlA.PaintData.BlockArr[I].ArrowCB := cbbHoZCB.ItemIndex;
        end;
        //垂直冲板
        for I := 0 to Length(FSelectRet.PnlA.PaintData.BlockArr) - 1 do
        begin
          if cbxCBSelect.Checked then
            if I <> seCBSelect.Value then Continue;
          if FSelectRet.PnlA.PaintData.BlockArr[I].W <= FSelectRet.PnlA.PaintData.BlockArr[I].H then
            FSelectRet.PnlA.PaintData.BlockArr[I].ArrowCB := cbbVerCB.ItemIndex;
        end;
      end;
      2:
      begin
        //添加水平冲板
        for I := 0 to Length(FSelectRet.PnlB.PaintData.BlockArr) - 1 do
        begin
          if cbxCBSelect.Checked then
            if I <> seCBSelect.Value then Continue;
          if FSelectRet.PnlB.PaintData.BlockArr[I].W >= FSelectRet.PnlB.PaintData.BlockArr[I].H then
            FSelectRet.PnlB.PaintData.BlockArr[I].ArrowCB := cbbHoZCB.ItemIndex;
        end;
        //垂直冲板
        for I := 0 to Length(FSelectRet.PnlB.PaintData.BlockArr) - 1 do
        begin
          if cbxCBSelect.Checked then
            if I <> seCBSelect.Value then Continue;
          if FSelectRet.PnlB.PaintData.BlockArr[I].W <= FSelectRet.PnlB.PaintData.BlockArr[I].H then
            FSelectRet.PnlB.PaintData.BlockArr[I].ArrowCB := cbbVerCB.ItemIndex;
        end;
      end;
      0:
      begin
        //A
        //添加水平冲板
        for I := 0 to Length(FSelectRet.PnlA.PaintData.BlockArr) - 1 do
        begin
          if cbxCBSelect.Checked then
            if I <> seCBSelect.Value then Continue;

          if FSelectRet.PnlA.PaintData.BlockArr[I].W >= FSelectRet.PnlA.PaintData.BlockArr[I].H then
            FSelectRet.PnlA.PaintData.BlockArr[I].ArrowCB := cbbHoZCB.ItemIndex;
        end;
        //垂直冲板
        for I := 0 to Length(FSelectRet.PnlA.PaintData.BlockArr) - 1 do
        begin
          if cbxCBSelect.Checked then
            if I <> seCBSelect.Value then Continue;
          if FSelectRet.PnlA.PaintData.BlockArr[I].W <= FSelectRet.PnlA.PaintData.BlockArr[I].H then
            FSelectRet.PnlA.PaintData.BlockArr[I].ArrowCB := cbbVerCB.ItemIndex;
        end;
        //B
        //添加水平冲板
        for I := 0 to Length(FSelectRet.PnlB.PaintData.BlockArr) - 1 do
        begin
          if cbxCBSelect.Checked then
            if I <> seCBSelect.Value then Continue;
          if FSelectRet.PnlB.PaintData.BlockArr[I].W >= FSelectRet.PnlB.PaintData.BlockArr[I].H then
            FSelectRet.PnlB.PaintData.BlockArr[I].ArrowCB := cbbHoZCB.ItemIndex;
        end;
        //垂直冲板
        for I := 0 to Length(FSelectRet.PnlB.PaintData.BlockArr) - 1 do
        begin
          if cbxCBSelect.Checked then
            if I <> seCBSelect.Value then Continue;
          if FSelectRet.PnlB.PaintData.BlockArr[I].W <= FSelectRet.PnlB.PaintData.BlockArr[I].H then
            FSelectRet.PnlB.PaintData.BlockArr[I].ArrowCB := cbbVerCB.ItemIndex;
        end;
      end;
    end;



  end;
end;

procedure TfrmMain1.AddIRetTolv;
var
  I: Integer;
begin
 {$REGION 'AddRegToList'}
  lvRet.Items.Clear;
  for I := 0 to FRetLst.Count - 1 do
  begin
    with lvRet.Items.Add do Data := Pointer(I);
  end;
  {$ENDREGION}
  for I := 0 to FRetLst.Count - 1 do
  begin
    if (FRetLst.Items[I].SheetB <> nil) and (FRetLst.Items[I].SheetB.GetCellCount <> 0) then
      AutoBorderAB(FRetLst.Items[I])
    else
      AutoBorder(FRetLst.Items[I]);
  end;
  for I := 0 to lvRet.Items.Count - 1 do
  begin
    with lvRet.Items[I] do
    begin
      Caption := IntToStr(I+1);
      //PnlA
      SubItems.Add(FormatFloat('0.000',FRetlst.Items[I].PnlA.W));
      SubItems.Add(FormatFloat('0.000',FRetlst.Items[I].PnlA.H));
      SubItems.Add(FormatFloat('0.000',FRetlst.Items[I].CutParam.PnlABorderTopBottomWidth));
      SubItems.Add(FormatFloat('0.000',FRetlst.Items[I].CutParam.PnlABorderLeftRightWidth));
      SubItems.Add(FormatFloat('##.#',FRetlst.Items[I].SheetA.GetCellCount + FRetlst.Items[I].SheetB.GetCellCount));
      SubItems.Add(FormatFloat('0.000',FRetlst.Items[I].GetSheetUseage));
      SubItems.Add(FormatFloat('0.000',FRetlst.Items[I].CutParam.SheetW));
      SubItems.Add(FormatFloat('0.000',FRetlst.Items[I].CutParam.SheetH));
      //B板
      if cbxDoubleCut.Checked then
      begin
        if FRetLst.Items[I].PnlB <> nil then
        begin
          SubItems.Add(FormatFloat('0.000',FRetlst.Items[I].PnlB.W));
          SubItems.Add(FormatFloat('0.000',FRetlst.Items[I].PnlB.H));
          SubItems.Add(FormatFloat('0.000',FRetlst.Items[I].CutParam.PnlBBorderTopBottomWidth));
          SubItems.Add(FormatFloat('0.000',FRetlst.Items[I].CutParam.PnlBBorderLeftRightWidth));
        end;
      end;

      Data := Pointer(I);
    end;
  end;
  m_bSort := False;
  lvRet.CustomSort(@CustomSortProc, 6);
  if lvRet.Items.Count > 0 then
  begin
    FSelectRet := FRetLst.Items[0];
    lvRetClick(lvRet);
  end;
end;

procedure TfrmMain1.edtDouble_Enter(Sender: TObject);
begin
  (Sender as TEdit).Color := clMoneyGreen;
  (Sender as TEdit).SelectAll;
end;

procedure TfrmMain1.edtDouble_Exit(Sender: TObject);
begin
  (Sender as TEdit).Color := clWhite;
  try
    StrToFloat((Sender as TEdit).Text);
  except
    ShowMessage('输入参数的值错误!');
    (Sender as TEdit).SetFocus;
  end;
end;

function TfrmMain1.FillCutParam: Boolean;
var
  I: Integer;
  nIndex: Integer;
begin
  Result := False;
  try
    SetLength(FCutParamArr,0);
    for I := 0 to frmSheetList.lvSheetList.Items.Count - 1 do
    begin
      if frmSheetList.lvSheetList.Items[I].Checked then
      begin
        SetLength(FCutParamArr,Length(FCutParamArr)+1);
        nIndex := High(FCutParamArr);
        ZeroMemory(@FCutParamArr[nIndex],SizeOf(FCutParamArr[nIndex]));
        FCutParamArr[nIndex].SheetW := StrToFloat(frmSheetList.lvSheetList.Items[I].SubItems[0]);
        FCutParamArr[nIndex].SheetH := StrToFloat(frmSheetList.lvSheetList.Items[I].SubItems[2]);
        FCutParamArr[nIndex].PnlAMaxW := StrToFloat(edtPnlMaxW_A.Text);
        FCutParamArr[nIndex].PnlAMaxH := StrToFloat(edtPnlMaxH_A.Text);
        FCutParamArr[nIndex].PnlAMinW := StrToFloat(edtPnlMinW_A.Text);
        FCutParamArr[nIndex].PnlAMinH := StrToFloat(edtPnlMinH_A.Text);
        FCutParamArr[nIndex].PnlASetW := StrToFloat(edtSetW_A.Text);
        FCutParamArr[nIndex].PnlASetH := StrToFloat(edtSetH_A.Text);
        FCutParamArr[nIndex].PnlASetHorzSpace := StrToFloat(edtSetSpaceX_A.Text);
        FCutParamArr[nIndex].PnlASetVertSpace := StrToFloat(edtSetSpaceY_A.Text);
        FCutParamArr[nIndex].PnlABorderLeftRightWidth := StrToFloat(edtPnlLeftRightW_A.Text);
        FCutParamArr[nIndex].PnlABorderTopBottomWidth := StrToFloat(edtPnlTopBottomW_A.Text);
        FCutParamArr[nIndex].PnlASelfRotate := cbxPnlRotate_A.Checked;
        FCutParamArr[nIndex].PnlARotateSet := cbxSetRotate_A.Checked;
        if cbxDoubleCut.Checked then
        begin
          FCutParamArr[nIndex].PnlBMaxW := FCutParamArr[nIndex].PnlAMaxW;
          FCutParamArr[nIndex].PnlBMaxH := FCutParamArr[nIndex].PnlAMaxH;
          FCutParamArr[nIndex].PnlBMinW := FCutParamArr[nIndex].PnlAMinW;
          FCutParamArr[nIndex].PnlBMinH := FCutParamArr[nIndex].PnlAMinH;
          FCutParamArr[nIndex].PnlBSetW := FCutParamArr[nIndex].PnlASetW;
          FCutParamArr[nIndex].PnlBSetH := FCutParamArr[nIndex].PnlASetH;
          FCutParamArr[nIndex].PnlBSetHorzSpace := FCutParamArr[nIndex].PnlASetHorzSpace;
          FCutParamArr[nIndex].PnlBSetVertSpace := FCutParamArr[nIndex].PnlASetVertSpace;
          FCutParamArr[nIndex].PnlBBorderLeftRightWidth := FCutParamArr[nIndex].PnlABorderLeftRightWidth;
          FCutParamArr[nIndex].PnlBBorderTopBottomWidth := FCutParamArr[nIndex].PnlABorderTopBottomWidth;
          FCutParamArr[nIndex].PnlBSelfRotate := FCutParamArr[nIndex].PnlASelfRotate;
          FCutParamArr[nIndex].PnlBRotateSet := FCutParamArr[nIndex].PnlARotateSet;
          FCutParamArr[nIndex].DoublePnl := True;
        end;
        FCutParamArr[nIndex].WDivH := StrToFloat(edtWDivH.Text);
        FCutParamArr[nIndex].MinUseage := StrToFloat(edtMinUseage.Text);
      end;
    end;
    Result := True;
  except
    ShowMessage('请输入正确的参数！');
    Exit;
  end;
end;

procedure TfrmMain1.FormCreate(Sender: TObject);
begin
  FRetLst := TList<IRet>.Create;
end;

procedure TfrmMain1.FormDestroy(Sender: TObject);
begin
  FRetLst.Free;
end;

procedure TfrmMain1.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Perform(wm_nextdlgctl,0,0);
end;

procedure TfrmMain1.FormShow(Sender: TObject);
var
  LRet: IRet;
begin
  LRet := LoadDefCutParamFromIni(FDefautParam,ExtractFilePath(ParamStr(0))+'PinBan.ini',frmSheetList.lvSheetList);
  if LRet <> nil then
  begin
    FRetLst.Add(LRet);
    with lvRet.Items.Add do
    begin
      Caption := IntToStr(1);
      //PnlA
      SubItems.Add(FormatFloat('0.000',FRetlst.Items[0].PnlA.W));
      SubItems.Add(FormatFloat('0.000',FRetlst.Items[0].PnlA.H));
      SubItems.Add(FormatFloat('0.000',FRetlst.Items[0].PnlA.PBorderSize^.NowTopBottomW));
      SubItems.Add(FormatFloat('0.000',FRetlst.Items[0].PnlA.PBorderSize^.NowLeftRightW));
      SubItems.Add(FormatFloat('##.#',FRetlst.Items[0].SheetA.GetCellCount + FRetlst.Items[0].SheetB.GetCellCount));
      SubItems.Add(FormatFloat('0.000',FRetlst.Items[0].GetSheetUseage));
      SubItems.Add(FormatFloat('0.000',FRetlst.Items[0].CutParam.SheetW));
      SubItems.Add(FormatFloat('0.000',FRetlst.Items[0].CutParam.SheetH));
      //B板
      SubItems.Add(FormatFloat('0.000',FRetlst.Items[0].PnlB.W));
      SubItems.Add(FormatFloat('0.000',FRetlst.Items[0].PnlB.H));
      SubItems.Add(FormatFloat('0.000',FRetlst.Items[0].PnlB.PBorderSize^.NowTopBottomW));
      SubItems.Add(FormatFloat('0.000',FRetlst.Items[0].PnlB.PBorderSize^.NowLeftRightW));

      Data := Pointer(0);
    end;
    FSelectRet := FRetlst.Items[0];
    lvRetClick(lvRet);
    edtSetW_A.Text := FormatFloat('0.000',FRetlst.Items[0].CutParam.PnlASetW);
    edtSetH_A.Text := FormatFloat('0.000',FRetlst.Items[0].CutParam.PnlASetH);
  end else
  begin
    edtSetW_A.Text := FormatFloat('0.000',FDefautParam.PnlASetW);
    edtSetH_A.Text := FormatFloat('0.000',FDefautParam.PnlASetH);
  end;
  edtSetSpaceX_A.Text := FormatFloat('0.000',FDefautParam.PnlASetHorzSpace);
  edtSetSpaceY_A.Text := FormatFloat('0.000',FDefautParam.PnlASetVertSpace);
  edtPnlLeftRightW_A.Text := FormatFloat('0.000',FDefautParam.PnlABorderLeftRightWidth);
  edtPnlTopBottomW_A.Text := FormatFloat('0.000',FDefautParam.PnlABorderTopBottomWidth);
  edtPnlMinW_A.Text := FormatFloat('0.000',FDefautParam.PnlAMinW);
  edtPnlMaxW_A.Text := FormatFloat('0.000',FDefautParam.PnlAMaxW);
  edtPnlMinH_A.Text := FormatFloat('0.000',FDefautParam.PnlAMinH);
  edtPnlMaxH_A.Text := FormatFloat('0.000',FDefautParam.PnlAMaxH);
end;

function TfrmMain1.LoadDefCutParamFromIni(var AParam: TCutParam;
  AFileName: string; AList: TListview): IRet;
var
  LIni: TIniFile;
  LS: TStringlist;
  I,posc: Integer;
  LRet: IRet;
  LCutParam: TCutParam;
  LPnlA, LSheetA,LSheetB, LPnlB: IBlock4Reg;
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

    cbxPnlRotate_A.Checked := LIni.ReadInteger('CustomDef','PnlASelfRotate',0) = 1;
    cbxbb.Checked := LIni.ReadInteger('CustomDef','BaBiaoKong',0) = 1;
    cbxPXGG.Checked := LIni.ReadInteger('CustomDef','PengXiGuaGouKong',0) = 1;
    cbxXD.Checked := LIni.ReadInteger('CustomDef','XiaoDingKong',0) = 1;
    cbxJDK.Checked := LIni.ReadInteger('CustomDef','JiaoDuiKong',0) = 1;
    se3mm.Value := LIni.ReadInteger('CustomDef','100mmX3mmZuKang',0);
    se6mm.Value := LIni.ReadInteger('CustomDef','100mmX6mmZuKang',0);
    rgZKPos.ItemIndex := LIni.ReadInteger('CustomDef','ZKPos',0);
    edtZK3mmLength.Text := LIni.ReadString('CustomDef','ZK3mmLength','100');
    edtZK6mmLength.Text := LIni.ReadString('CustomDef','ZK6mmLength','100');
    cbxSetRotate_A.Checked := LIni.ReadInteger('CustomDef','SetRotate',0) = 1;
    cbxDoubleCut.Checked := LIni.ReadInteger('CustomDef','DoubleCut',0) = 1;

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
      //PnlA
      LPnlA := TBlock4Reg.Create;
      LPnlA.W := LIni.ReadFloat('CutRet','PnlW_A',0);
      LPnlA.H := LIni.ReadFloat('CutRet','PnlH_A',0);
      LPnlA.PBorderSize^.NowLeftRightW := LIni.ReadFloat('CutRet','PnlLeftRightBorderW_A',0);
      LPnlA.PBorderSize^.NowTopBottomW := LIni.ReadFloat('CutRet','PnlTopBottomBorderW_A',0);
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

      if LIni.ReadString('CutRet','PnlImg_A','') <> '' then
      begin
        LTmpMap := TGPBitmap.Create(LIni.ReadString('CutRet','PnlImg_A',''));
        LW := LTmpMap.Width;
        LH := LTmpMap.Height;
        LDesMap := TGPBitmap.Create(LW,LH);
        LGP := TGPGraphics.Create(LDesMap);
        LGP.DrawImage(LTmpMap,0,0,LTmpMap.Width,LTmpMap.Height);
        LPnlA.PPaintData^.CustomImg := LDesMap;
      end else
      begin
        LDesMap := TGPBitmap.Create(480,480);
        LPnlA.PPaintData^.CustomImg := LDesMap;
      end;

      //PnlB
      LPnlB := TBlock4Reg.Create;
      LPnlB.W := LIni.ReadFloat('CutRet','PnlW_B',0);
      LPnlB.H := LIni.ReadFloat('CutRet','PnlH_B',0);
      LPnlB.PBorderSize^.NowLeftRightW := LIni.ReadFloat('CutRet','PnlLeftRightBorderW_B',0);
      LPnlB.PBorderSize^.NowTopBottomW := LIni.ReadFloat('CutRet','PnlTopBottomBorderW_B',0);
      if LIni.ReadInteger('CutRet','SetCountPerPnl_B',0) <> 0 then
      begin                                        
        with LPnlB.AddReg().AddColum() do
        begin
          for I := 0 to LIni.ReadInteger('CutRet','SetCountPerPnl_B',0) - 1 do
          begin
            AddRow(TBlock.Create);
          end;
        end;
      end;

      if LIni.ReadString('CutRet','PnlImg_B','') <> '' then
      begin
        LTmpMap := TGPBitmap.Create(LIni.ReadString('CutRet','PnlImg_B',''));
        LW := LTmpMap.Width;
        LH := LTmpMap.Height;
        LDesMap := TGPBitmap.Create(LW,LH);
        LGP := TGPGraphics.Create(LDesMap);
        LGP.DrawImage(LTmpMap,0,0,LTmpMap.Width,LTmpMap.Height);
        LPnlB.PPaintData^.CustomImg :=  LDesMap;
      end else
      begin
        LDesMap := TGPBitmap.Create(480,480);
        LPnlB.PPaintData^.CustomImg := LDesMap;        
      end;

      LSheetA := TBlock4Reg.Create;
      if LIni.ReadInteger('CutRet','PnlCount_A',0) <> 0 then
      begin
        with LSheetA.AddReg().AddColum() do
        begin
          for I := 0 to LIni.ReadInteger('CutRet','PnlCount_A',0) - 1 do
          begin
            AddRow(TBlock.Create);
          end;
        end;
      end;
      if LIni.ReadString('CutRet','SheetImg','') <> '' then
      begin
        LTmpMap := TGPBitmap.Create(LIni.ReadString('CutRet','SheetImg',''));
        LW := LTmpMap.Width;
        LH := LTmpMap.Height;
        LDesMap := TGPBitmap.Create(LW,LH);
        LGP := TGPGraphics.Create(LDesMap);
        LGP.DrawImage(LTmpMap,0,0,LTmpMap.Width,LTmpMap.Height);
        LSheetA.PPaintData^.CustomImg := LDesMap;
      end else
      begin
        LDesMap := TGPBitmap.Create(480,480);
        LSheetA.PPaintData^.CustomImg := LDesMap;       
      end;

      LSheetB := TBlock4Reg.Create;
      if LIni.ReadInteger('CutRet','PnlCount_B',0) <> 0 then
      begin
        with LSheetB.AddReg().AddColum() do
        begin
          for I := 0 to LIni.ReadInteger('CutRet','PnlCount_B',0) - 1 do
          begin
            AddRow(TBlock.Create);
          end;
        end;
      end;      
      
      LRet.CutParam := LCutParam;
      LRet.SheetA := LSheetA;
      LRet.SheetB := LSheetB;
      LRet.PnlA := LPnlA;
      LRet.PnlB := LPnlB;
      LRet.SetSheetUseage(LIni.ReadFloat('CutRet','SheetUseage',0));
    end;

    Result := LRet;
  finally
    LIni.Free;
    LS.Free;
  end;
end;

procedure TfrmMain1.lvRetAdvancedCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; Stage: TCustomDrawStage;
  var DefaultDraw: Boolean);
begin
  lvRet.Canvas.Brush.Color := clMoneyGreen;
end;

procedure TfrmMain1.lvRetAdvancedCustomDrawSubItem(Sender: TCustomListView;
  Item: TListItem; SubItem: Integer; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
  if SubItem < 1 then
    lvRet.Canvas.Brush.Color := clMoneyGreen else
  if (SubItem >= 1) and (SubItem < 9) then
    lvRet.Canvas.Brush.Color := clSkyBlue else
  if SubItem >= 9 then
    lvRet.Canvas.Brush.Color := RGB(27,177,250)
  else
    lvRet.Canvas.Brush.Color := clWhite;
end;

procedure TfrmMain1.lvRetClick(Sender: TObject);
begin
  if FSelectRet = nil then Exit;
  AddZK2;
  AddKong;
  AddCB;
  AddAutoKL;
  //Draw
  gDrawEng.PaintIRet(FMainImgIndex,pbMain.Canvas.Handle,pbMain.Width,pbMain.Height,FSelectRet);
  gDrawEng.PaintIRet(1,pbSheet.Canvas.Handle,pbSheet.Width,pbSheet.Height,FSelectRet);
  gDrawEng.PaintIRet(2,pbPnl_A.Canvas.Handle,pbPnl_A.Width,pbPnl_A.Height,FSelectRet);
  //PnlA
  edtPnlW_A.Text := FormatFloat('0.000',FSelectRet.PnlA.W);
  edtPnlH_A.Text := FormatFloat('0.000',FSelectRet.PnlA.H);
  edtPnlLeftRightBorderW_A.Text := FormatFloat('0.000',FSelectRet.PnlA.PBorderSize^.NowLeftRightW);
  edtPnlTopBottomBorderW_A.Text := FormatFloat('0.000',FSelectRet.PnlA.PBorderSize^.NowTopBottomW);
  edtSetPerPnl_A.Text := FormatFloat('0.000',FSelectRet.PnlA.GetCellCount);
  //SheetA
  edtSheetUseage.Text := FormatFloat('0.000',FSelectRet.GetSheetUseage);
  edtSheetW.Text := FormatFloat('0.000',FSelectRet.CutParam.SheetW);
  edtSheetH.Text := FormatFloat('0.000',FSelectRet.CutParam.SheetH);
  edtPnlCount_A.Text := FormatFloat('0.000',FSelectRet.SheetA.GetCellCount );
  edtSheetSetCount.Text := FormatFloat('0.000',FSelectRet.GetBlockCount);
  //PnlB
  if FSelectRet.SheetB <> nil then
  begin
    gDrawEng.PaintIRet(3,pbPnl_B.Canvas.Handle,pbPnl_B.Width,pbPnl_B.Height,FSelectRet);
    edtPnlW_B.Text := FormatFloat('0.000',FSelectRet.PnlB.W);
    edtPnlH_B.Text := FormatFloat('0.000',FSelectRet.PnlB.H);
    edtPnlLeftRightBorderW_B.Text := FormatFloat('0.000',FSelectRet.PnlB.PBorderSize^.NowLeftRightW);
    edtPnlTopBottomBorderW_B.Text := FormatFloat('0.000',FSelectRet.PnlB.PBorderSize^.NowTopBottomW);
    edtSetPerPnl_B.Text := FormatFloat('0.000',FSelectRet.PnlB.GetCellCount);
    edtPnlCount_B.Text := FormatFloat('0.000',FSelectRet.SheetB.GetCellCount);
  end;
end;

procedure TfrmMain1.lvRetColumnClick(Sender: TObject; Column: TListColumn);
begin
  lvRet.CustomSort(@CustomSortProc, Column.Index);
  m_bSort := not m_bSort;
end;

procedure TfrmMain1.lvRetDblClick(Sender: TObject);
begin
  lvRetClick(lvRet);
end;

procedure TfrmMain1.lvRetKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Key := 0;
  Abort;
end;

procedure TfrmMain1.lvRetMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  LItem: tlistitem;
begin
  LItem := lvRet.GetItemAt(x,Y);
  if LItem <> nil then
  begin
    FSelectRet := FRetLst.Items[Integer(LItem.Data)];
    FHotRetIndex := lvRet.Items.IndexOf(LItem);
  end;
end;

procedure TfrmMain1.mniInportSheetImgClick(Sender: TObject);
var
  //LPaintData: TPaintData;
  LTmpMap,LDesMap: IGPBitmap;
  LGP: IGPGraphics;
  LimgFile: string;
  LW,LH: Integer;
  LOpDG: TOpenPictureDialog;
begin

  if FSelectRet = nil then
  begin
    ShowMessage('请先拼版并选择一个结果');
    Exit;
  end;

  LOpDG := TOpenPictureDialog.Create(Self);
  try
    LOpDG.Filter := 'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bitmaps (*.bmp)|*.bmp';
    if LOpDG.Execute and (LOpDG.FileName <> '') then
    begin
      LimgFile := LOpDG.FileName;
    end else
      Exit;
  finally
    LOpDG.Free;
  end;

  try
    if not FileExists(LimgFile) then
    begin
      ShowMessage('画图文件没找到，请保存为JPG个的文件');
      Exit;
    end;
    LTmpMap := TGPBitmap.Create(LimgFile);
    LW := LTmpMap.Width;
    LH := LTmpMap.Height;
    LDesMap := TGPBitmap.Create(LW,LH);
    LGP := TGPGraphics.Create(LDesMap);
    LGP.DrawImage(LTmpMap,0,0,LTmpMap.Width,LTmpMap.Height);

    if FSelectRet <> nil then
    begin
      case TMenuItem(Sender).Tag of
        0,1:begin
          FSelectRet.SheetA.PPaintData^.CustomImg := LDesMap;
        end;
        2:begin
          FSelectRet.PnlA.PPaintData^.CustomImg := LDesMap;
        end;
        3:begin
          FSelectRet.PnlB.PPaintData^.CustomImg := LDesMap;
        end;
      end;
      lvRetClick(lvRet);
    end;

  except
    ShowMessage('请导入正确的JPG格式图片');
  end;
end;

procedure TfrmMain1.mniN1Click(Sender: TObject);
begin
  frmSheetList.ShowModal;
end;

procedure TfrmMain1.mniN2Click(Sender: TObject);
begin
  ShowOptionFrm(Self);
end;

procedure TfrmMain1.pbMainPaint(Sender: TObject);
begin
  if FSelectRet <> nil then
  begin
    gDrawEng.PaintIRet(FMainImgIndex,pbMain.Canvas.Handle,pbMain.Width,pbMain.Height,FSelectRet);
  end;
end;

procedure TfrmMain1.pbPnl_AClick(Sender: TObject);
begin
  FMainImgIndex := 2;
  if FSelectRet <> nil then
    gDrawEng.PaintIRet(FMainImgIndex,pbMain.Canvas.Handle,pbMain.Width,pbMain.Height,FSelectRet);
end;

procedure TfrmMain1.pbPnl_APaint(Sender: TObject);
begin
  if FSelectRet <> nil then
    gDrawEng.PaintIRet(2,pbPnl_A.Canvas.Handle,pbPnl_A.Width,pbPnl_A.Height,FSelectRet);
end;

procedure TfrmMain1.pbPnl_BClick(Sender: TObject);
begin
  FMainImgIndex := 3;
  if FSelectRet <> nil then
    gDrawEng.PaintIRet(FMainImgIndex,pbMain.Canvas.Handle,pbMain.Width,pbMain.Height,FSelectRet);
end;

procedure TfrmMain1.pbPnl_BPaint(Sender: TObject);
begin
  if FSelectRet <> nil then
    gDrawEng.PaintIRet(3,pbPnl_B.Canvas.Handle,pbPnl_B.Width,pbPnl_B.Height,FSelectRet);
end;

procedure TfrmMain1.pbSheetClick(Sender: TObject);
begin
  FMainImgIndex := 1;
  if FSelectRet <> nil then
    gDrawEng.PaintIRet(FMainImgIndex,pbMain.Canvas.Handle,pbMain.Width,pbMain.Height,FSelectRet);
end;

procedure TfrmMain1.pbSheetPaint(Sender: TObject);
begin
  if FSelectRet <> nil then
    gDrawEng.PaintIRet(1,pbSheet.Canvas.Handle,pbSheet.Width,pbSheet.Height,FSelectRet);
end;

procedure TfrmMain1.pmInportImgPopup(Sender: TObject);
begin
  mniInportPnlBImg.Enabled := cbxDoubleCut.Checked;
end;

procedure TfrmMain1.se3mmChange(Sender: TObject);
begin
  if Sender is TSpinEdit then
  begin
    if (Sender as TSpinEdit).Text <> '' then
      lvRetClick(lvRet);
  end;
end;

end.
