(*
1、SheetUseage = （A板Set数量*A板Set面积）+ （B板Set数量*B板Set面积）/ 大料面积
2、PnlUseage = Set数量*Set面积 / Pnl面积
3、SetUseage = PCS面积*PCS数量 / Set面积

*)
unit IRetIntf;

interface
uses
  Windows, SysUtils, Classes, Generics.Collections, Generics.Defaults,
  CalcParam, Calc, GdiPlus;
type
  TDWK = set of (kNull=0, kBB=1,kXDK=2,kPXGG=3,kJDK=4);

  TFloatRect = record
    X,Y,W,H: Double;
    RegIndex,ColumIndex,RowIndex: Integer;
    ArrowCB: Byte;//冲板方向：0 没有; 阻抗方向：0 没有阻抗;1-水平，2-垂直
    AB: Byte; // 0 = A, 1 = Pnlb
  end;
  TFloatRectArr = array of TFloatRect;

  TPaintData = record
    Reg: TFloatRect;
    BlockArr: array of TFloatRect;
    ZKBlockArr: TFloatRectArr;
    ZKReg: TFloatRect;//RegIndex 代表M6count ，colindex代表m3count
    DWK: TDWK; //定位孔
    AutoCut: Boolean; //真为:自动拼版备注,
    CustomImg: IGPBitmap;
  end;
  PPaintData = ^TPaintData;
  {Left = X , Top = Y}
  IFloatPos = interface
  ['{97C6B6F2-637F-4E2E-ABB5-8D46A49148BC}']
    function GetX: Double;
    procedure SetX(Value: Double);
    function GetY: Double;
    procedure SetY(Value: Double);
    function ToIntPos: TPoint;

    property X: Double read GetX write SetX;
    property Y: Double read GetY write SetY;
  end;

  TFloatPos = class(TInterfacedObject, IFloatPos)
  private
    FX,FY: Double;
    function GetX: Double;
    procedure SetX(Value: Double);
    function GetY: Double;
    procedure SetY(Value: Double);
    function ToIntPos: TPoint;
  end;

  IFloatSize = interface(IFloatPos)
  ['{99769AD0-AAF1-410D-8C79-E60CC7CC1EB0}']
    function GetW: Double;
    procedure SetW(Value: Double);
    function GetH: Double;
    procedure SetH(Value: Double);
    property W: Double read GetW write SetW;
    property H: Double read GetH write SetH;
  end;

  TFloatSize = class(TFloatPos, IFloatSize)
  protected
    FW,FH: Double;
    function GetW: Double;
    procedure SetW(Value: Double);
    function GetH: Double;
    procedure SetH(Value: Double);
  end;

  IBlock = interface(IFloatSize)
  ['{4524BE21-F3E0-4CA4-B405-5DF77B7ACC71}']
    function GetRotate: Boolean;
    procedure SetRotate(Value: Boolean);
    function ToIntRect: TRect;
    //function GetData: Integer;
    //procedure SetData(Value: Integer);

    property Rotate: Boolean read GetRotate write SetRotate;
    //property Data: Integer read GetData write SetData;
  end;

  TBlock = class(TFloatSize, IBlock)
  protected
    FRotate: Boolean;
    //FData: Integer;
    function GetRotate: Boolean;
    procedure SetRotate(Value: Boolean);
    function ToIntRect: TRect;
    //function GetData: Integer;
    //procedure SetData(Value: Integer);
  end;


  IBlockColum = interface(IBlock)
  ['{76FE8728-59AA-4328-8355-84B86E04B871}']
    function RowCount: Integer;
    function AddRow(ARow: IBlock): Integer;
    procedure ClearRow;
    function Rows: TList<IBlock>;overload;
    function Row(ARow: Integer): IBlock;overload;
  end;

  TBlockColum = class(TBlock, IBlockColum)
  private
    FRows: TList<IBlock>;
    function RowCount: Integer;
    function AddRow(ARow: IBlock): Integer;
    procedure ClearRow;
    function Rows: TList<IBlock>;overload;
    function Row(ARow: Integer): IBlock;overload;
  public
    constructor Create();
    destructor Destroy; override;
  end;

  IBlockColumArr = interface(IBlock)
  ['{A8054FD8-A9A3-4CB5-8CE0-47E04F6E0015}']
    function ColCount: Integer;
    function AddColum(ACol: IBlockColum = nil): IBlockColum;
    function Colums: TList<IBlockColum>;
    function CellCount: Integer;
  end;

  TBlockColumArr = class(TBlock, IBlockColumArr)
  private
    FColums: TList<IBlockColum>;
    function ColCount: Integer;
    function AddColum(ACol: IBlockColum = nil): IBlockColum;
    procedure DeleteColum(ACol: IBlockColum);overload;
    procedure DeleteColum(ACol: Integer);overload;
    procedure ClearColum;
    function Colums: TList<IBlockColum>;
    function CellCount: Integer;
  public
    constructor Create();
    destructor Destroy; override;
  end;

  TBorderSize = record
    Pnl_ZeroBorderW,
    Pnl_ZeroBorderH,
    MinLeftRightW,
    MinTopBottomW,
    MaxLeftRightW,
    MaxTOpBottomW,
    NowLeftRightW,
    NowTopBottomW,
    OldLeftRightW,
    OldTopBottomW : Double;
  end;
  PBorderSize = ^TBorderSize;

  IBlock4Reg = interface(IBlock)
  ['{20153E82-AA55-4CAD-9047-26A66A1C0AAE}']
    function GetCellCount: Integer;
    function AddReg(AReg: IBlockColumArr = nil): IBlockColumArr;
    function GetRegList: TList<IBlockColumArr>;
    function GetUseAge: Double;
    function GetBorderSize: PBorderSize;
    procedure SetBorderSize(Value: TBorderSize);

    function GetCalc4Reg: TCalc4Reg;
    procedure SetCalc4Reg(Value: TCalc4Reg);
    function GetPCalc4Reg: PCalc4Reg;

    function GetPaintData: TPaintData;
    procedure SetPaintData(Value: TPaintData);
    function GetPPaintData: PPaintData;
    function GetOriginalPaintData: TPaintData;
    procedure SetOriginalPaintData(Value: TPaintData);

    procedure SetUseAge(Value: Double);

    property Regs: TList<IBlockColumArr> read GetRegList;
    property Calc4Reg: TCalc4Reg read GetCalc4Reg write SetCalc4Reg;
    property PaintData: TPaintData read GetPaintData write SetPaintData;
    property OriginalPaintData: TPaintData read GetOriginalPaintData write SetOriginalPaintData;
    property PBorderSize: PBorderSize read GetBorderSize;
    property PPaintData: PPaintData read GetPPaintData ;
    property PCalc4Reg: PCalc4Reg read GetPCalc4Reg;
  end;

  TBlock4Reg = class(TBlock, IBlock4Reg)
  private
    FRegList: TList<IBlockColumArr>;
    FUseAge: Double;
    FCalc4Reg: TCalc4Reg;
    FPaintData,FOriginalPaintData: TPaintData;
    FBorderSize: TBorderSize;
    function GetCellCount: Integer;
    function AddReg(AReg: IBlockColumArr = nil): IBlockColumArr;
    function GetRegList: TList<IBlockColumArr>;
    function GetUseAge: Double;
    function GetBorderSize: PBorderSize;
    procedure SetBorderSize(Value: TBorderSize);

    function GetCalc4Reg: TCalc4Reg;
    procedure SetCalc4Reg(Value: TCalc4Reg);
    function GetPCalc4Reg: PCalc4Reg;

    function GetPaintData: TPaintData;
    procedure SetPaintData(Value: TPaintData);
    function GetPPaintData: PPaintData;
    function GetOriginalPaintData: TPaintData;
    procedure SetOriginalPaintData(Value: TPaintData);

    procedure SetUseAge(Value: Double);
  public
    constructor Create();
    destructor Destroy; override;
  end;


  TDWKong = record
    BaBiao: Boolean;//靶标
    XDKong: Boolean;//销钉孔
    PXGGKong: Boolean;//喷锡挂钩孔
    JDKong: Boolean;//校对孔
  end;

  TCustomShape = (csLine,csArrowLine,csSanJiao,csYuan,csRect,csXiangPi,csStr);

  ICustomDrawData = interface
  ['{685F61BA-8CE2-49B7-BBF8-CC59BC9E939C}']
    function GetID: Integer;
    procedure SetID(Value: Integer);
    function GetShapeType: TCustomShape;
    procedure SetShapeType(Value: TCustomShape);
    function GetPenWidth: Integer;
    procedure SetPenWidth(Value: Integer);
    function GetPenColor: Integer;
    procedure SetPenColor(Value: Integer);
    function GetStrSize: Integer;
    procedure SetStrSize(Value: Integer);
    function GetStr: string;
    procedure SetStr(Value: string);
    function GetDrawReg: TRect;
    procedure SetDrawReg(Value: TRect);

    property ID: Integer read GetID write SetID;
    property ShapeType: TCustomShape read GetShapeType write SetShapeType;
    property PenWidth: Integer read GetPenWidth write SetPenWidth;
    property PenColor: Integer read GetPenColor write SetPenColor;
    property StrSize: Integer read GetStrSize write SetStrSize;
    property Str: string read GetStr write SetStr;
    property DrawReg: TRect read GetDrawReg write SetDrawReg;
  end;

  TCustomDrawData = class(TInterfacedObject, ICustomDrawData)
  private
    FID: Integer;
    FShapeType: TCustomShape;
    FPenWidth: Integer;
    FPenColor: Integer;
    FStrSize: Integer;
    FStr: string;
    FDrawReg: TRect;
    function GetID: Integer;
    procedure SetID(Value: Integer);
    function GetShapeType: TCustomShape;
    procedure SetShapeType(Value: TCustomShape);
    function GetPenWidth: Integer;
    procedure SetPenWidth(Value: Integer);
    function GetPenColor: Integer;
    procedure SetPenColor(Value: Integer);
    function GetStrSize: Integer;
    procedure SetStrSize(Value: Integer);
    function GetStr: string;
    procedure SetStr(Value: string);
    function GetDrawReg: TRect;
    procedure SetDrawReg(Value: TRect);
  end;



  IRet = interface
    function GetSheetA: IBlock4Reg;
    procedure SetSheetA(Value: IBlock4Reg);
    function GetSheetB: IBlock4Reg;
    procedure SetSheetB(Value: IBlock4Reg);

    function GetPnlA: IBlock4Reg;
    procedure SetPnlA(Value: IBlock4Reg);
    function GetPnlB: IBlock4Reg;
    procedure SetPnlB(Value: IBlock4Reg);

    function GetCutParam: TCutParam;
    procedure SetCutParam(Value: TCutParam);
    function GetPCutParam: PCutParam;

    function GetBlockCount: Integer;

    function GetSheetUseage: Double;
    procedure SetSheetUseage(Value: Double);

    property SheetA: IBlock4Reg read GetSheetA write SetSheetA;
    property SheetB: IBlock4Reg read GetSheetB write SetSheetB;
    property PnlA: IBlock4Reg read GetPnlA write SetPnlA;
    property PnlB: IBlock4Reg read GetPnlB write SetPnlB;

    property CutParam: TCutParam read GetCutParam write SetCutParam;
    property PCutParam: PCutParam read GetPCutParam;
  end;

  TRet = class(TInterfacedObject, IRet)
  private
    FSheetA, FSheetB, FPnlA, FPnlB: IBlock4Reg;
    FSheetUseage: Double;
    FCutParam: TCutParam;
    function GetSheetA: IBlock4Reg;
    procedure SetSheetA(Value: IBlock4Reg);
    function GetSheetB: IBlock4Reg;
    procedure SetSheetB(Value: IBlock4Reg);

    function GetPnlA: IBlock4Reg;
    procedure SetPnlA(Value: IBlock4Reg);
    function GetPnlB: IBlock4Reg;
    procedure SetPnlB(Value: IBlock4Reg);

    function GetCutParam: TCutParam;
    procedure SetCutParam(Value: TCutParam);

    function GetBlockCount: Integer;
    function GetPCutParam: PCutParam;

    function GetSheetUseage: Double;
    procedure SetSheetUseage(Value: Double);
  public
    constructor Create();
  end;

implementation

{ TRet }

function TRet.GetPCutParam: PCutParam;
begin
  Result := @FCutParam;
end;

constructor TRet.Create;
begin
  inherited;
  FSheetA := TBlock4Reg.Create;
  FSheetA.AddReg;
  FSheetA.Regs[0].AddColum;
  FSheetB := TBlock4Reg.Create;
  FSheetB.AddReg;
  FSheetB.Regs[0].AddColum;
  FPnlA := TBlock4Reg.Create;
  FPnlA.AddReg;
  FPnlA.Regs[0].AddColum;
  FPnlB := TBlock4Reg.Create;
  FPnlB.AddReg;
  FPnlB.Regs[0].AddColum;
end;

function TRet.GetBlockCount: Integer;
begin
  Result := FSheetA.GetCellCount * FPnlA.GetCellCount + FSheetB.GetCellCount * FPnlB.GetCellCount;
end;

function TRet.GetCutParam: TCutParam;
begin
  Result := FCutParam;
end;

function TRet.GetPnlA: IBlock4Reg;
begin
  Result := FPnlA;
end;

function TRet.GetPnlB: IBlock4Reg;
begin
  Result := FPnlB;
end;

function TRet.GetSheetA: IBlock4Reg;
begin
  Result := FSheetA;
end;

function TRet.GetSheetB: IBlock4Reg;
begin
  Result := FSheetB;
end;

function TRet.GetSheetUseage: Double;
begin
  Result := FSheetUseage;
end;

procedure TRet.SetCutParam(Value: TCutParam);
begin
  FCutParam := Value;
end;


procedure TRet.SetPnlA(Value: IBlock4Reg);
begin
  FPnlA := Value;
end;

procedure TRet.SetPnlB(Value: IBlock4Reg);
begin
  FPnlB := Value;
end;

procedure TRet.SetSheetA(Value: IBlock4Reg);
begin
  FSheetA := Value;
end;

procedure TRet.SetSheetB(Value: IBlock4Reg);
begin
  FSheetB := Value;
end;

procedure TRet.SetSheetUseage(Value: Double);
begin
  FSheetUseage := Value;
end;

{ TCustomDrawData }

function TCustomDrawData.GetDrawReg: TRect;
begin
  Result := FDrawReg;
end;

function TCustomDrawData.GetID: Integer;
begin
  Result := FID;
end;

function TCustomDrawData.GetPenColor: Integer;
begin
  Result := FPenColor;
end;

function TCustomDrawData.GetPenWidth: Integer;
begin
  Result := FPenWidth;
end;

function TCustomDrawData.GetShapeType: TCustomShape;
begin
  Result := FShapeType;
end;

function TCustomDrawData.GetStr: string;
begin
  Result := FStr;
end;

function TCustomDrawData.GetStrSize: Integer;
begin
  Result := FStrSize;
end;

procedure TCustomDrawData.SetDrawReg(Value: TRect);
begin
  FDrawReg := Value;
end;

procedure TCustomDrawData.SetID(Value: Integer);
begin
  FID := Value;
end;

procedure TCustomDrawData.SetPenColor(Value: Integer);
begin
  FPenColor := Value;
end;

procedure TCustomDrawData.SetPenWidth(Value: Integer);
begin
  FPenWidth := Value;
end;

procedure TCustomDrawData.SetShapeType(Value: TCustomShape);
begin
  FShapeType := Value;
end;

procedure TCustomDrawData.SetStr(Value: string);
begin
  FStr := Value;
end;

procedure TCustomDrawData.SetStrSize(Value: Integer);
begin
  FStrSize := Value;
end;


{ TBlock }

function TFloatPos.GetX: Double;
begin
  Result := FX;
end;

function TFloatPos.GetY: Double;
begin
  Result := FY;
end;

procedure TFloatPos.SetX(Value: Double);
begin
  FX := Value;
end;

procedure TFloatPos.SetY(Value: Double);
begin
  FY := Value;
end;

function TFloatPos.ToIntPos: TPoint;
begin
  Result.X := Trunc(FX);
  Result.Y := Trunc(FY);
end;

{ TBlock }


//function TBlock.GetData: Integer;
//begin
//  Result := FData;
//end;

function TBlock.GetRotate: Boolean;
begin
  Result := FRotate;
end;

//procedure TBlock.SetData(Value: Integer);
//begin
//  FData := Value;
//end;

procedure TBlock.SetRotate(Value: Boolean);
begin
  FRotate := Value;
end;

function TBlock.ToIntRect: TRect;
begin
  Result.Left := (Self as IFloatPos).ToIntPos.X;
  Result.Top := (Self as IFloatPos).ToIntPos.Y;
  Result.Right := Trunc(Result.Left + GetW);
  Result.Bottom := Trunc(Result.Top + GetH);
end;

{ TBlockColum }

function TBlockColum.AddRow(ARow: IBlock): Integer;
begin
  Result := FRows.Add(ARow);
end;

procedure TBlockColum.ClearRow;
begin
  FRows.Clear;
end;

constructor TBlockColum.Create;
begin
  inherited;
  FRows := TList<IBlock>.Create;
end;

destructor TBlockColum.Destroy;
begin
  FRows.Clear;
  FRows.Free;
  inherited;
end;

function TBlockColum.RowCount: Integer;
begin
  Result := FRows.Count;
end;

function TBlockColum.Row(ARow: Integer): IBlock;
begin
  Result := FRows.Items[ARow];
end;

function TBlockColum.Rows: TList<IBlock>;
begin
  Result := FRows;
end;

{ TBlockColumArr }

function TBlockColumArr.AddColum(ACol: IBlockColum): IBlockColum;
begin
  if ACol <> nil then
    FColums.Add(ACol)
  else
    FColums.Add(TBlockColum.Create);
  Result := FColums.Items[FColums.Count - 1];
end;


function TBlockColumArr.CellCount: Integer;
var
  Col: IBlockColum;
begin
  Result := 0;
  for Col in Colums do Result := Result + Col.RowCount;
end;

procedure TBlockColumArr.ClearColum;
begin
  while FColums.Count <> 0 do DeleteColum(0);
end;

function TBlockColumArr.ColCount: Integer;
begin
  Result := FColums.Count;
end;

function TBlockColumArr.Colums: TList<IBlockColum>;
begin
  Result := FColums;
end;

constructor TBlockColumArr.Create;
begin
  FColums := TList<IBlockColum>.Create;
end;

procedure TBlockColumArr.DeleteColum(ACol: Integer);
begin
  FColums.Items[ACol].ClearRow;
  FColums.Delete(ACol);
end;

procedure TBlockColumArr.DeleteColum(ACol: IBlockColum);
begin
  DeleteColum(FColums.IndexOf(ACol));
end;

destructor TBlockColumArr.Destroy;
begin
  ClearColum;
  FColums.Free;
  inherited;
end;

{ TBlock4Reg }

function TBlock4Reg.AddReg(AReg: IBlockColumArr): IBlockColumArr;
begin
  if AReg <> nil then
    FRegList.Add(AReg)
  else
    FRegList.Add(TBlockColumArr.Create);
  Result := FRegList.Items[FRegList.Count - 1];
end;

constructor TBlock4Reg.Create;
begin
  FRegList := TList<IBlockColumArr>.Create;
end;

destructor TBlock4Reg.Destroy;
begin
  FRegList.Clear;
  FRegList.Free;
  inherited;
end;

function TBlock4Reg.GetBorderSize: PBorderSize;
begin
  Result := @FBorderSize;
end;

function TBlock4Reg.GetCalc4Reg: TCalc4Reg;
begin
  Result := FCalc4Reg;
end;

function TBlock4Reg.GetCellCount: Integer;
var
  LArr: IBlockColumArr;
begin
  Result := 0;
  for LArr in FRegList do
    Result := Result + LArr.CellCount;
end;

function TBlock4Reg.GetOriginalPaintData: TPaintData;
begin
  Result := FOriginalPaintData;
end;

function TBlock4Reg.GetPaintData: TPaintData;
begin
  Result := FPaintData;
end;

function TBlock4Reg.GetRegList: TList<IBlockColumArr>;
begin
  Result := FRegList;
end;

function TBlock4Reg.GetUseAge(): Double;
begin
  Result := FUseAge;
end;

procedure TBlock4Reg.SetBorderSize(Value: TBorderSize);
begin
  FBorderSize := Value;
end;

function TBlock4Reg.GetPCalc4Reg: PCalc4Reg;
begin
  Result := @FCalc4Reg;
end;

procedure TBlock4Reg.SetCalc4Reg(Value: TCalc4Reg);
begin
  FCalc4Reg := Value;
end;

procedure TBlock4Reg.SetOriginalPaintData(Value: TPaintData);
begin
  FOriginalPaintData := Value;
end;

function TBlock4Reg.GetPPaintData: PPaintData;
begin
  Result := @FPaintData;
end;

procedure TBlock4Reg.SetPaintData(Value: TPaintData);
begin
  FPaintData := Value;
end;

procedure TBlock4Reg.SetUseAge(Value: Double);
begin
  FUseAge := Value;
end;

{ TFloatSize }

function TFloatSize.GetH: Double;
begin
  Result := FH;
end;

function TFloatSize.GetW: Double;
begin
  Result := FW;
end;

procedure TFloatSize.SetH(Value: Double);
begin
  FH := Value;
end;

procedure TFloatSize.SetW(Value: Double);
begin
  FW := Value;
end;

end.
