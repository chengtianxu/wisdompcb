{*******************************************************}
{                                                       }
{                       EhLib v3.0                      }
{                     Tool controls                     }
{                                                       }
{      Copyright (c) 2001-2003 by Dmitry V. Bolshakov   }
{                                                       }
{*******************************************************}

{$I EhLib.Inc}

{$IFDEF EH_LIB_VCL}
unit ToolCtrlsEh;
{$ELSE}
unit QToolCtrlsEh;
{$ENDIF}

interface

{$IFDEF EH_LIB_VCL}
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
{$IFDEF EH_LIB_6} Variants, {$ENDIF}
  StdCtrls, Mask, Db, DBCtrls, Buttons, ExtCtrls, Menus, ComCtrls, CommCtrl,
  Imglist;
{$ELSE}
uses
  QGraphics, QControls, QForms, QDialogs, Variants, QStdCtrls, QMask,
  QDBCtrls, QButtons, QExtCtrls, QMenus, QComCtrls, QImglist,
  Db, SysUtils, Classes;
{$ENDIF}

const
  CM_IGNOREEDITDOWN = WM_USER + 102;

type

  IComboEditEh = interface
    ['{B64255B5-386A-4524-8BC7-7F49DDB410F4}']
    procedure CloseUp(Accept: Boolean);
  end;

  TFieldsArrEh = array of TField;

{ Standard events }

  TButtonClickEventEh = procedure(Sender: TObject; var Handled: Boolean) of object;
  TButtonDownEventEh = procedure(Sender: TObject; TopButton: Boolean;
    var AutoRepeat: Boolean; var Handled: Boolean) of object;
  TCloseUpEventEh = procedure(Sender: TObject; Accept: Boolean) of object;
  TNotInListEventEh = procedure(Sender: TObject; NewText: String;
    var RecheckInList: Boolean) of object;
  TUpdateDataEventEh = procedure(Sender: TObject; var Handled: Boolean) of object;

{ TEditButtonControlEh }

  TEditButtonStyleEh = (ebsDropDownEh, ebsEllipsisEh, ebsGlyphEh, ebsUpDownEh,
    ebsPlusEh, ebsMinusEh);

  TEditButtonControlEh = class(TSpeedButton)
  private
    FActive: Boolean;
    FAlwaysDown: Boolean;
    FButtonNum: Integer;
    FNoDoClick: Boolean;
    FOnDown: TButtonDownEventEh;
    FStyle: TEditButtonStyleEh;
    FTimer: TTimer;
    function GetTimer: TTimer;
    procedure ResetTimer(Interval: Cardinal);
    procedure SetActive(const Value: Boolean);
    procedure SetAlwaysDown(const Value: Boolean);
    procedure SetStyle(const Value: TEditButtonStyleEh);
    procedure TimerEvent(Sender: TObject);
    procedure UpdateDownButtonNum(X, Y: Integer);
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
    property Timer: TTimer read GetTimer;
  public
    procedure Click; override;
    procedure EditButtonDown(TopButton: Boolean; var AutoRepeat: Boolean);
    procedure SetState(NewState: TButtonState; IsActive: Boolean; ButtonNum: Integer);
    procedure SetWidthNoNotify(AWidth: Integer);
    property Active: Boolean read FActive write SetActive;
    property AlwaysDown: Boolean read FAlwaysDown write SetAlwaysDown;
    property Style: TEditButtonStyleEh read FStyle write SetStyle default ebsDropDownEh;
    property OnDown: TButtonDownEventEh read FOnDown write FOnDown;
  end;

  TSpeedButtonEh = class(TEditButtonControlEh)
  published
    property Active;
    property Style;
  end;

  TEditButtonControlLineRec = record
    ButtonLine: TShape;
    EditButtonControl: TEditButtonControlEh;
  end;

  TEditButtonControlList = array of TEditButtonControlLineRec;

{ TEditButtonEh }

  TEditButtonEh = class(TCollectionItem)
  private
    FDropdownMenu: TPopupMenu;
    FEditControl: TWinControl;
    FGlyph: TBitmap;
    FHint: String;
    FNumGlyphs: Integer;
    FOnButtonClick: TButtonClickEventEh;
    FOnButtonDown: TButtonDownEventEh;
    FOnChanged: TNotifyEvent;
    FShortCut: TShortCut;
    FStyle: TEditButtonStyleEh;
    FVisible: Boolean;
    FWidth: Integer;
    function GetGlyph: TBitmap;
    procedure SetGlyph(const Value: TBitmap);
    procedure SetHint(const Value: String);
    procedure SetNumGlyphs(Value: Integer);
    procedure SetStyle(const Value: TEditButtonStyleEh);
    procedure SetVisible(const Value: Boolean);
    procedure SetWidth(const Value: Integer);
  protected
    function CreateEditButtonControl: TEditButtonControlEh; virtual;
    procedure Changed; overload;
  public
    constructor Create(Collection: TCollection); overload; override;
    constructor Create(EditControl: TWinControl); reintroduce; overload;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
  published
    property DropdownMenu: TPopupMenu read FDropdownMenu write FDropdownMenu;
    property Glyph: TBitmap read GetGlyph write SetGlyph;
    property Hint: String read FHint write SetHint;
    property NumGlyphs: Integer read FNumGlyphs write SetNumGlyphs default 1;
    //property ShortCut: TShortCut read FShortCut write FShortCut default 32808; //Menus.ShortCut(VK_DOWN, [ssAlt]);
    property ShortCut: TShortCut read FShortCut write FShortCut default scNone;
    property Style: TEditButtonStyleEh read FStyle write SetStyle default ebsDropDownEh;
    property Visible: Boolean read FVisible write SetVisible default False;
    property Width: Integer read FWidth write SetWidth default 0;
    property OnClick: TButtonClickEventEh read FOnButtonClick write FOnButtonClick;
    property OnDown: TButtonDownEventEh read FOnButtonDown write FOnButtonDown;
  end;

  TEditButtonEhClass = class of TEditButtonEh;

{ TDropDownEditButtonEh }

  TDropDownEditButtonEh = class(TEditButtonEh)
  public
    constructor Create(Collection: TCollection); overload; override;
    constructor Create(EditControl: TWinControl); overload;
  published
    property ShortCut default 32808; //Menus.ShortCut(VK_DOWN, [ssAlt]);
  end;


{ TVisibleEditButtonEh }

  TVisibleEditButtonEh = class(TEditButtonEh)
  public
    constructor Create(Collection: TCollection); overload; override;
    constructor Create(EditControl: TWinControl); overload;
  published
    property ShortCut default 32808; //Menus.ShortCut(VK_DOWN, [ssAlt]);
    property Visible default True;
  end;

{ TEditButtonsEh }

  TEditButtonsEh = class(TCollection)
  private
    FOnChanged: TNotifyEvent;
    function GetEditButton(Index: Integer): TEditButtonEh;
    procedure SetEditButton(Index: Integer; Value: TEditButtonEh);
  protected
    FOwner: TPersistent;
    function GetOwner: TPersistent; override;
    procedure Update(Item: TCollectionItem); override;
  public
    constructor Create(Owner: TPersistent; EditButtonClass: TEditButtonEhClass);
    function Add: TEditButtonEh;
    property Items[Index: Integer]: TEditButtonEh read GetEditButton write SetEditButton; default;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
  end;

{ TSpecRowEh }

  TSpecRowEh = class(TPersistent)
  private
    FCellsStrings: TStrings;
    FCellsText: String;
    FColor: TColor;
    FFont: TFont;
    FOnChanged: TNotifyEvent;
    FOwner: TPersistent;
    FSelected: Boolean;
    FShortCut: TShortCut;
    FShowIfNotInKeyList: Boolean;
    FUpdateCount: Integer;
    FValue: Variant;
    FVisible: Boolean;
    function GetCellText(Index: Integer): String;
    function GetColor: TColor;
    function GetFont: TFont;
    function IsColorStored: Boolean;
    function IsFontStored: Boolean;
    function IsValueStored: Boolean;
    procedure FontChanged(Sender: TObject);
    procedure SetCellsText(const Value: String);
    procedure SetColor(const Value: TColor);
    procedure SetFont(const Value: TFont);
    procedure SetShowIfNotInKeyList(const Value: Boolean);
    procedure SetValue(const Value: Variant);
    procedure SetVisible(const Value: Boolean);
  protected
    FColorAssigned: Boolean;
    FFontAssigned: Boolean;
    function GetOwner: TPersistent; override;
    procedure Changed;
  public
    constructor Create(Owner: TPersistent);
    destructor Destroy; override;
    function DefaultColor: TColor;
    function DefaultFont: TFont;
    function LocateKey(KeyValue: Variant): Boolean;
    procedure Assign(Source: TPersistent); override;
    procedure BeginUpdate;
    procedure EndUpdate;
    property CellText[Index: Integer]: String read GetCellText;
    property Selected: Boolean read FSelected write FSelected;
    property UpdateCount: Integer read FUpdateCount;
    property OnChanged: TNotifyEvent read FOnChanged write FOnChanged;
  published
    property CellsText: String read FCellsText write SetCellsText;
    property Color: TColor read GetColor write SetColor stored IsColorStored;
    property Font: TFont read GetFont write SetFont stored IsFontStored;
    property ShortCut: TShortCut read FShortCut write FShortCut default 32814; //Menus.ShortCut(VK_DOWN, [ssAlt]);
    property ShowIfNotInKeyList: Boolean read FShowIfNotInKeyList write SetShowIfNotInKeyList default True;
    property Value: Variant read FValue write SetValue stored IsValueStored;
    property Visible: Boolean read FVisible write SetVisible default False;
  end;

{ TSizeGripEh }

  TSizeGripPostion = (sgpTopLeft, sgpTopRight, sgpBottomRight, sgpBottomLeft);
  TSizeGripChangePosition = (sgcpToLeft, sgcpToRight, sgcpToTop, sgcpToBottom);

  TSizeGripEh = class(TCustomControl)
  private
    FInitScreenMousePos: TPoint;
    FInternalMove: Boolean;
    FOldMouseMovePos: TPoint;
    FParentRect: TRect;
    FParentResized: TNotifyEvent;
    FPosition: TSizeGripPostion;
    FTriangleWindow: Boolean;
    function GetVisible: Boolean;
    procedure SetPosition(const Value: TSizeGripPostion);
    procedure SetTriangleWindow(const Value: Boolean);
    procedure SetVisible(const Value: Boolean);
    procedure WMMove(var Message: TMessage); message WM_MOVE;
  protected
    procedure CreateWnd; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
    procedure ParentResized; dynamic;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ChangePosition(NewPosition: TSizeGripChangePosition);
    procedure UpdatePosition;
    procedure UpdateWindowRegion;
    property Position: TSizeGripPostion read FPosition write SetPosition default sgpBottomRight;
    property TriangleWindow: Boolean read FTriangleWindow write SetTriangleWindow default True;
    property Visible: Boolean read GetVisible write SetVisible;
    property OnParentResized: TNotifyEvent read FParentResized write FParentResized;
  end;

const
  cm_SetSizeGripChangePosition = WM_USER + 100;

{ TPopupMonthCalendarEh }

const
  CM_CLOSEUPEH = WM_USER + 101;

type

  TPopupMonthCalendarEh = class(TMonthCalendar)
  private
    FBorderWidth: Integer;
    procedure CMCloseUpEh(var Message: TMessage); message CM_CLOSEUPEH;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMWantSpecialKey(var Message: TCMWantSpecialKey); message CM_WANTSPECIALKEY;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
  protected
    function CanAutoSize(var NewWidth, NewHeight: Integer): Boolean; override;
    function DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    function DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DrawBorder; virtual;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure PostCloseUp(Accept: Boolean);
    procedure UpdateBorderWidth;
  public
    constructor Create(AOwner: TComponent); override;
    property Color;
    property Ctl3D;
  end;

{ TPopupListboxEh }

  TPopupListboxEh = class(TCustomListbox)
  private
    FBorderWidth: Integer;
    FImageList: TCustomImageList;
    FMousePos: TPoint;
    FRowCount: Integer;
    FSearchText: String;
    FSearchTickCount: Longint;
    FSizeGrip: TSizeGripEh;
    FSizeGripResized: Boolean;
    function CheckNewSize(var NewWidth, NewHeight: Integer): Boolean;
    function GetBorderSize: Integer;
    procedure CMCtl3DChanged(var Message: TMessage); message CM_CTL3DCHANGED;
    procedure CMSetSizeGripChangePosition(var Message: TMessage); message cm_SetSizeGripChangePosition;
    procedure CNDrawItem(var Message: TWMDrawItem); message CN_DRAWITEM;
    procedure SetImageList(const Value: TCustomImageList);
    procedure SetRowCount(Value: Integer);
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMWindowPosChanging(var Message: TWMWindowPosChanging); message WM_WINDOWPOSCHANGING;
  protected
    function DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    function DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DrawBorder; virtual;
    procedure DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState); override;
    procedure KeyPress(var Key: Char); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure UpdateBorderWidth;
  public
    constructor Create(Owner: TComponent); override;
    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;
    function CanFocus: Boolean; {$IFDEF EH_LIB_5} override; {$ENDIF}
    function GetTextHeight: Integer;
    property Color;
    property Ctl3D;
    property Font;
    property ImageList: TCustomImageList read FImageList write SetImageList;
    property IntegralHeight;
    property ItemHeight;
    property RowCount: Integer read FRowCount write SetRowCount;
    property SizeGrip: TSizeGripEh read FSizeGrip;
    property SizeGripResized: Boolean read FSizeGripResized write FSizeGripResized;
  end;

{ TMRUList }
  TFilterMRUItemEventEh = procedure (Sender: TObject; var Accept: Boolean) of object;
  TSetDropDownEventEh = procedure (Sender: TObject) of object;
  TSetCloseUpEventEh = procedure (Sender: TObject; Accept: Boolean) of object;

  TMRUListEh = class(TPersistent)
  private
    FActive: Boolean;
    FCaseSensitive: Boolean;
    FItems: TStrings;
    FLimit: Integer;
    FOnActiveChanged: TNotifyEvent;
    FOnFilterItem: TFilterMRUItemEventEh;
    FOnSetCloseUpEvent: TSetCloseUpEventEh;
    FOnSetDropDown: TSetDropDownEventEh;
    FOwner: TPersistent;
    FRows: Integer;
    FWidth: Integer;
    procedure SetActive(const Value: Boolean);
    procedure SetItems(const Value: TStrings);
    procedure SetLimit(const Value: Integer);
    procedure SetRows(const Value: Integer);
  protected
    FDroppedDown: Boolean;
    procedure UpdateLimit;
  public
    constructor Create(AOwner: TPersistent);
    destructor Destroy; override;
    procedure Add(s: String);
    procedure Assign(Source: TPersistent); override;
    procedure CloseUp(Accept: Boolean); virtual;
    procedure DropDown; virtual;
    property DroppedDown: Boolean read FDroppedDown write FDroppedDown;
    property Width: Integer read FWidth write FWidth;
    property OnActiveChanged: TNotifyEvent read FOnActiveChanged write FOnActiveChanged;
    property OnSetCloseUp: TSetCloseUpEventEh read FOnSetCloseUpEvent write FOnSetCloseUpEvent;
    property OnSetDropDown: TSetDropDownEventEh read FOnSetDropDown write FOnSetDropDown;
    property OnFilterItem: TFilterMRUItemEventEh read FOnFilterItem write FOnFilterItem;
  published
    property Active: Boolean read FActive write SetActive default False;
    property CaseSensitive: Boolean read FCaseSensitive write FCaseSensitive default False;
    property Items: TStrings read FItems write SetItems;
    property Limit: Integer read FLimit write SetLimit default 100;
    property Rows: Integer read FRows write SetRows default 7;
  end;

{ TMRUListboxEh }

  TMRUListboxEh = class(TPopupListboxEh)
  private
    FScrollBar: TScrollBar;
    FScrollBarLockMove: Boolean;
    procedure CMChanged(var Message: TMessage); message CM_CHANGED;
    procedure CMMouseWheel(var Message: TCMMouseWheel); message CM_MOUSEWHEEL;
    procedure CMSetSizeGripChangePosition(var Message: TMessage); message cm_SetSizeGripChangePosition;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure ScrollBarScrolled(Sender: TObject; ScrollCode: TScrollCode; var ScrollPos: Integer);
    procedure ScrollBarWindowProc(var Message: TMessage);
  public
    constructor Create(Owner: TComponent); override;
    procedure UpdateScrollBar;
    procedure UpdateScrollBarPos;
    property ParentCtl3D;
    property ScrollBar: TScrollBar read FScrollBar;
    property Sorted;
  end;

  TDrawButtonControlStyleEh = (bcsDropDownEh, bcsEllipsisEh, bcsUpDownEh,
    bcsCheckboxEh, bcsPlusEh, bcsMinusEh);
procedure PaintButtonControlEh(DC: HDC; ARect: TRect; ParentColor: TColor;
  Style: TDrawButtonControlStyleEh; DownButton: Integer;
  Flat, Active, Enabled: Boolean; State: TCheckBoxState);

function GetDefaultFlatButtonWidth: Integer;

var
  FlatButtonWidth: Integer;

procedure GetFieldsProperty(List: TList; DataSet: TDataSet;
  Control: TComponent; const FieldNames: String); overload;

function GetFieldsProperty(DataSet: TDataSet; Control: TComponent;
  const FieldNames: String): TFieldsArrEh; overload;

procedure DataSetSetFieldValues(DataSet: TDataSet; Fields: String; Value: Variant);

function VarEquals(const V1, V2: Variant): Boolean;

var UseButtonsBitmapCache: Boolean = True;

procedure ClearButtonsBitmapCache;

procedure DrawImage(DC: HDC; ARect: TRect; Images: TCustomImageList;
  ImageIndex: Integer; Selected: Boolean);

function AlignDropDownWindowRect(MasterAbsRect: TRect; DropDownWin: TWinControl; Align: TDropDownAlign): TPoint;
function AlignDropDownWindow(MasterWin, DropDownWin: TWinControl; Align: TDropDownAlign): TPoint;

{$IFNDEF EH_LIB_5}
function Supports(const Instance: IUnknown; const IID: TGUID; out Intf): Boolean; overload;
function Supports(const Instance: TObject; const IID: TGUID; out Intf): Boolean; overload;
{$ENDIF}

var
  DefaultCheckBoxWidth, DefaultCheckBoxHeight: Integer;

function AdjustCheckBoxRect(ClientRect: TRect;  Alignment: TAlignment; Layout: TTextLayout): TRect;

function IsDoubleClickMessage(OldPos, NewPos: TPoint; Interval: Longint): Boolean;

implementation

uses DBConsts, Math,
  {$IFDEF EH_LIB_6} VDBConsts, Types, {$ENDIF}
  {$IFDEF EH_LIB_7} Themes, UxTheme, {$ENDIF}
  MultiMon;

type
  TWinControlCracker = class(TWinControl) end;
  TControlCracker = class(TControl) end;

{$IFNDEF EH_LIB_5}

function Supports(const Instance: IUnknown; const IID: TGUID; out Intf): Boolean; overload;
begin
  Result := (Instance <> nil) and (Instance.QueryInterface(IID, Intf) = 0);
end;

function Supports(const Instance: TObject; const IID: TGUID; out Intf): Boolean; overload;
var
  LUnknown: IUnknown;
begin
  Result := (Instance <> nil) and
    ((Instance.GetInterface(IUnknown, LUnknown) and Supports(LUnknown, IID, Intf)) or
    Instance.GetInterface(IID, Intf));
end;

{$ENDIF}

function IsDoubleClickMessage(OldPos, NewPos: TPoint; Interval: Longint): Boolean;
begin
  Result := (Interval <= Longint(GetDoubleClickTime)) and
            (Abs(OldPos.X - NewPos.X) <= GetSystemMetrics(SM_CXDOUBLECLK)) and
            (Abs(OldPos.Y - NewPos.Y) <= GetSystemMetrics(SM_CYDOUBLECLK));
end;

procedure GetCheckSize;
begin
  with TBitmap.Create do
    try
      Handle := LoadBitmap(0, PChar(32759));
      DefaultCheckBoxWidth := Width div 4;
      DefaultCheckBoxHeight := Height div 3;
    finally
      Free;
    end;
end;

function AdjustCheckBoxRect(ClientRect: TRect;  Alignment: TAlignment; Layout: TTextLayout): TRect;
var
  CheckWidth, CheckHeight: Integer;
begin
  if (ClientRect.Right - ClientRect.Left) > DefaultCheckBoxWidth
    then CheckWidth := DefaultCheckBoxWidth
    else CheckWidth := ClientRect.Right - ClientRect.Left;

  if (ClientRect.Bottom - ClientRect.Top) > DefaultCheckBoxHeight
    then CheckHeight := DefaultCheckBoxHeight
    else CheckHeight := ClientRect.Bottom - ClientRect.Top;


  Result := ClientRect;

  if (ClientRect.Right - ClientRect.Left) > DefaultCheckBoxWidth then
    case Alignment of
      taRightJustify: Result.Left := Result.Right - CheckWidth;
      taCenter: Result.Left := Result.Left + (ClientRect.Right - ClientRect.Left) shr 1 - CheckWidth shr 1;
    end;
  Result.Right := Result.Left + CheckWidth;

  if (ClientRect.Bottom - ClientRect.Top) > DefaultCheckBoxHeight then
    case Layout of
      tlBottom: Result.Top := Result.Bottom - CheckWidth;
      tlCenter: Result.Top := Result.Top + (ClientRect.Bottom - ClientRect.Top) shr 1 - CheckHeight shr 1;
    end;
  Result.Bottom := Result.Top + CheckHeight;
end;

procedure DrawCheck(DC: HDC; R: TRect; AState: TCheckBoxState; AEnabled, AFlat, ADown, AActive: Boolean);
var
  DrawState, oldRgn: Integer;
  DrawRect: TRect;
//  OldBrushColor: TColor;
//  OldBrushStyle: TBrushStyle;
//  OldPenColor: TColor;
  Rgn, SaveRgn: HRgn;
{$IFDEF EH_LIB_7}
  ElementDetails: TThemedElementDetails;
{$ENDIF}
//  Brush,SaveBrush: HBRUSH;
begin
  SaveRgn := 0;
  oldRgn := 0;
  DrawRect := R;
  with DrawRect do
    if (Right - Left) > (Bottom - Top) then
    begin
      Left := Left + ((Right - Left) - (Bottom - Top)) div 2;
      Right := Left + (Bottom - Top);
    end else if (Right - Left) < (Bottom - Top) then
    begin
      Top := Top + ((Bottom - Top) - (Right - Left)) div 2;
      Bottom := Top + (Right - Left);
    end;
  case AState of
    cbChecked:
      DrawState := DFCS_BUTTONCHECK or DFCS_CHECKED;
    cbUnchecked:
      DrawState := DFCS_BUTTONCHECK;
  else // cbGrayed
    DrawState := DFCS_BUTTON3STATE or DFCS_CHECKED;
  end;
  if not AEnabled then
    DrawState := DrawState or DFCS_INACTIVE;
  if ADown then
    DrawState := DrawState or DFCS_PUSHED;
//  with Canvas do
//  begin
  if AFlat then
  begin
      { Remember current clipping region }
    SaveRgn := CreateRectRgn(0, 0, 0, 0);
    oldRgn := GetClipRgn(DC, SaveRgn);
      { Clip 3d-style checkbox to prevent flicker }
    with DrawRect do
      Rgn := CreateRectRgn(Left + 1, Top + 1, Right - 1, Bottom - 1);
    SelectClipRgn(DC, Rgn);
    DeleteObject(Rgn);
  end;
  if AFlat then InflateRect(DrawRect, 1, 1);

{$IFDEF EH_LIB_7}
  if ThemeServices.ThemesEnabled then
  begin
    case AState of
      cbChecked:
        if AEnabled then
          ElementDetails := ThemeServices.GetElementDetails(tbCheckBoxCheckedNormal)
        else
          ElementDetails := ThemeServices.GetElementDetails(tbCheckBoxCheckedDisabled);
      cbUnchecked:
        if AEnabled then
          ElementDetails := ThemeServices.GetElementDetails(tbCheckBoxUncheckedNormal)
        else
          ElementDetails := ThemeServices.GetElementDetails(tbCheckBoxUncheckedDisabled)
      else // cbGrayed
        if AEnabled then
          ElementDetails := ThemeServices.GetElementDetails(tbCheckBoxMixedNormal)
        else
          ElementDetails := ThemeServices.GetElementDetails(tbCheckBoxMixedDisabled);
    end;
    ThemeServices.DrawElement(DC, ElementDetails, R);
  end
  else
{$ENDIF}
    DrawFrameControl(DC, DrawRect, DFC_BUTTON, DrawState);

  if AFlat then
  begin
      //SelectClipRgn(Handle, SaveRgn);
    if oldRgn = 0 then
      SelectClipRgn(DC, 0)
    else
      SelectClipRgn(DC, SaveRgn);
    DeleteObject(SaveRgn);
      { Draw flat rectangle in-place of clipped 3d checkbox above }
    InflateRect(DrawRect, -1, -1);
    if AActive
      then FrameRect(DC, DrawRect, GetSysColorBrush(COLOR_BTNFACE))
      else FrameRect(DC, DrawRect, GetSysColorBrush(COLOR_BTNSHADOW));

    { Caller drow in flat mode
    InflateRect(DrawRect, 1, 1);
    if AActive
      then DrawEdge(DC, DrawRect, BDR_SUNKENOUTER, BF_RECT)
      else FrameRect(DC, DrawRect, GetCurrentObject(DC, OBJ_BRUSH));}
  end;
//  end;
end;

const
  DownFlags: array[Boolean] of Integer = (0, DFCS_PUSHED);
  FlatFlags: array[Boolean] of Integer = (0, DFCS_FLAT);
  EnabledFlags: array[Boolean] of Integer = (DFCS_INACTIVE, 0);
  IsDownFlags: array[Boolean] of Integer = (DFCS_SCROLLUP, DFCS_SCROLLDOWN);
  PressedFlags: array[Boolean] of Integer = (EDGE_RAISED, EDGE_SUNKEN);

procedure DrawEllipsisButton(DC: HDC; ARect: TRect; Enabled, Active, Flat, Pressed: Boolean);
var
  InterP, PWid, W, H: Integer;
  ElRect: TRect;
  Brush, SaveBrush: HBRUSH;
{$IFDEF EH_LIB_7}
  Button: TThemedButton;
  ToolButton: TThemedToolBar;
  Details: TThemedElementDetails;
{$ENDIF}
begin
  ElRect := ARect;

{$IFDEF EH_LIB_7}
  if ThemeServices.ThemesEnabled then
  begin
    if not Enabled then
      Button := tbPushButtonDisabled
    else
      if Pressed then
        Button := tbPushButtonPressed
      else
        if Active
          then Button := tbPushButtonHot
          else Button := tbPushButtonNormal;

    ToolButton := ttbToolbarDontCare;
    if Flat then
    begin
      case Button of
        tbPushButtonDisabled:
          Toolbutton := ttbButtonDisabled;
        tbPushButtonPressed:
          Toolbutton := ttbButtonPressed;
        tbPushButtonHot:
          Toolbutton := ttbButtonHot;
        tbPushButtonNormal:
          Toolbutton := ttbButtonNormal;
      end;
    end;

    if ToolButton = ttbToolbarDontCare then
    begin
      Details := ThemeServices.GetElementDetails(Button);
      ThemeServices.DrawElement(DC, Details, ARect);

//      ARect := ThemeServices.ContentRect(DC, Details, ARect);
      InflateRect(ElRect, -2, -2);
    end else
    begin
      Details := ThemeServices.GetElementDetails(ToolButton);
      ThemeServices.DrawElement(DC, Details, ARect);
      InflateRect(ElRect, -1, -1)
//      ARect := ThemeServices.ContentRect(DC, Details, ARect);
    end;
  end else
{$ENDIF}
  begin
    Brush := GetSysColorBrush(COLOR_BTNFACE);
    if Flat then
    begin
      Windows.FillRect(DC, ElRect, Brush);
      InflateRect(ElRect, -1, -1)
    end else
    begin
      DrawEdge(DC, ElRect, PressedFlags[Pressed], BF_RECT or BF_MIDDLE);
      InflateRect(ElRect, -2, -2);
      //Windows.FillRect(DC, ElRect, Brush);
    end;
  end;

  InterP := 2;
  PWid := 2;
  W := ElRect.Right - ElRect.Left; //+ Ord(not Active and Flat);
  if W < 12 then InterP := 1;
  if W < 8 then PWid := 1;
  W := ElRect.Left + W div 2 - PWid div 2 + Ord(Pressed); //- Ord(not Active and Flat);
  H := ElRect.Top + (ElRect.Bottom - ElRect.Top) div 2 - PWid div 2 + Ord(Pressed);

  if not Enabled then
  begin
    Inc(W); Inc(H);
    Brush := GetSysColorBrush(COLOR_BTNHILIGHT);
    SaveBrush := SelectObject(DC, Brush);
    PatBlt(DC, W, H, PWid, PWid, PATCOPY);
    PatBlt(DC, W - InterP - PWid, H, PWid, PWid, PATCOPY);
    PatBlt(DC, W + InterP + PWid, H, PWid, PWid, PATCOPY);
    Dec(W); Dec(H);
    SelectObject(DC, SaveBrush);
    Brush := GetSysColorBrush(COLOR_BTNSHADOW);
  end else
    Brush := GetSysColorBrush(COLOR_BTNTEXT);

  SaveBrush := SelectObject(DC, Brush);
  PatBlt(DC, W, H, PWid, PWid, PATCOPY);
  PatBlt(DC, W - InterP - PWid, H, PWid, PWid, PATCOPY);
  PatBlt(DC, W + InterP + PWid, H, PWid, PWid, PATCOPY);
  SelectObject(DC, SaveBrush);
end;

procedure DrawPlusMinusButton(DC: HDC; ARect: TRect; Enabled, Active, Flat, Pressed, Plus: Boolean);
var PWid, PHet, W, H, PlusInd, MinWH: Integer;
  ElRect: TRect;
  Brush, SaveBrush: HBRUSH;
{$IFDEF EH_LIB_7}
  Button: TThemedButton;
  ToolButton: TThemedToolBar;
  Details: TThemedElementDetails;
{$ENDIF}
begin
  ElRect := ARect;

{$IFDEF EH_LIB_7}
  if ThemeServices.ThemesEnabled then
  begin
    if not Enabled then
      Button := tbPushButtonDisabled
    else
      if Pressed then
        Button := tbPushButtonPressed
      else
        if Active
          then Button := tbPushButtonHot
          else Button := tbPushButtonNormal;

    ToolButton := ttbToolbarDontCare;
    if Flat then
    begin
      case Button of
        tbPushButtonDisabled:
          Toolbutton := ttbButtonDisabled;
        tbPushButtonPressed:
          Toolbutton := ttbButtonPressed;
        tbPushButtonHot:
          Toolbutton := ttbButtonHot;
        tbPushButtonNormal:
          Toolbutton := ttbButtonNormal;
      end;
    end;

    if ToolButton = ttbToolbarDontCare then
    begin
      Details := ThemeServices.GetElementDetails(Button);
      ThemeServices.DrawElement(DC, Details, ARect);
//      ARect := ThemeServices.ContentRect(DC, Details, ARect);
      InflateRect(ElRect, -2, -2);
    end else
    begin
      Details := ThemeServices.GetElementDetails(ToolButton);
      ThemeServices.DrawElement(DC, Details, ARect);
      InflateRect(ElRect, -1, -1)
//      ARect := ThemeServices.ContentRect(DC, Details, ARect);
    end;
  end else
{$ENDIF}
  begin
    Brush := GetSysColorBrush(COLOR_BTNFACE);
    if Flat then
    begin
      Windows.FillRect(DC, ElRect, Brush);
      InflateRect(ElRect, -1, -1)
    end else
    begin
      DrawEdge(DC, ElRect, PressedFlags[Pressed], BF_RECT or BF_MIDDLE);
      InflateRect(ElRect, -2, -2);
      Windows.FillRect(DC, ElRect, Brush);
    end;
  end;

  MinWH := ElRect.Right - ElRect.Left; //+ Ord(not Active and Flat);
  if ElRect.Bottom - ElRect.Top < MinWH then
    MinWH := ElRect.Bottom - ElRect.Top;
  PWid := MinWH * 4 div 7;
  if PWid = 0 then PWid := 1;
  PHet := PWid div 3;
  if PHet = 0 then PHet := 1;
  if Flat then Dec(PWid);
  if PWid mod 2 <> MinWH mod 2 then Inc(PWid);
  if Plus and (PWid mod 2 <> PHet mod 2) then
    if (MinWH < 12) then Inc(PWid) else Dec(PWid);
  PlusInd := PWid div 2 - PHet div 2;

  W := ElRect.Left + (ElRect.Right - ElRect.Left - PWid) div 2; //- Ord(not Active and Flat);
  //if W * 2 + PWid > (ElRect.Right - ElRect.Left) then Dec(W);
  Inc(W, Ord(Pressed));
  H := ElRect.Top + (ElRect.Bottom - ElRect.Top - PHet) div 2 + Ord(Pressed);

  if not Enabled then
  begin
    Inc(W); Inc(H);
    Brush := GetSysColorBrush(COLOR_BTNHILIGHT);
    SaveBrush := SelectObject(DC, Brush);
    PatBlt(DC, W, H, PWid, PHet, PATCOPY);
    if Plus then PatBlt(DC, W + PlusInd, H - PlusInd, PHet, PWid, PATCOPY);
    Dec(W); Dec(H);
    SelectObject(DC, SaveBrush);
    Brush := GetSysColorBrush(COLOR_BTNSHADOW);
  end else
    Brush := GetSysColorBrush(COLOR_BTNTEXT);

  SaveBrush := SelectObject(DC, Brush);
  PatBlt(DC, W, H, PWid, PHet, PATCOPY);
  if Plus then PatBlt(DC, W + PlusInd, H - PlusInd, PHet, PWid, PATCOPY);
  SelectObject(DC, SaveBrush);
end;

procedure DrawDropDownButton(DC: HDC; ARect: TRect; Enabled, Flat, Active, Down: Boolean);
var
  Flags: Integer;
{$IFDEF EH_LIB_7}
  Details: TThemedElementDetails;
{$ENDIF}
//  Rgn, SaveRgn: HRGN;
//  r: Integer;
//  IsClip: Boolean;
begin
{$IFDEF EH_LIB_7}
  if ThemeServices.ThemesEnabled then
  begin
    if not Enabled then
      Details := ThemeServices.GetElementDetails(tcDropDownButtonDisabled)
    else
      if Down then
        Details := ThemeServices.GetElementDetails(tcDropDownButtonPressed)
      else
        if Active
          then Details := ThemeServices.GetElementDetails(tcDropDownButtonHot)
          else Details := ThemeServices.GetElementDetails(tcDropDownButtonNormal);

{      with Details do
        GetThemeBackgroundRegion(ThemeServices.Theme[Element], DC, Part, State, ARect, Rgn);
      IsClip := False;
      SaveRgn := 0;
      r := 0;
      if Rgn <> 0 then
      begin
        IsClip := True;
        SaveRgn := CreateRectRgn(0, 0, 0, 0);
        r := GetClipRgn(DC, SaveRgn);
        SelectClipRgn(DC, Rgn);
        DeleteObject(Rgn);
      end;}

    ThemeServices.DrawElement(DC, Details, ARect);

{      if IsClip = True then
      begin
        if r = 0
          then SelectClipRgn(DC, 0)
          else SelectClipRgn(DC, SaveRgn);
        DeleteObject(SaveRgn);
      end;}

  end else
{$ENDIF}
  begin
    Flags := DownFlags[Down] or FlatFlags[Flat] or EnabledFlags[Enabled];
    DrawFrameControl(DC, ARect, DFC_SCROLL, Flags or DFCS_SCROLLCOMBOBOX);
  end;
end;

procedure DrawUpDownButton(DC: HDC; ARect: TRect; Enabled, Flat, Active, Down, DownDirection: Boolean);
var
  Flags: Integer;
{$IFDEF EH_LIB_7}
  Details: TThemedElementDetails;
{$ENDIF}
begin
{$IFDEF EH_LIB_7}
  if ThemeServices.ThemesEnabled then
  begin
    if DownDirection then
      if not Enabled then
        Details := ThemeServices.GetElementDetails(tsDownDisabled)
      else
        if Down then
          Details := ThemeServices.GetElementDetails(tsDownPressed)
        else
          if Active
            then Details := ThemeServices.GetElementDetails(tsDownHot)
            else Details := ThemeServices.GetElementDetails(tsDownNormal)
    else
      if not Enabled then
        Details := ThemeServices.GetElementDetails(tsUpDisabled)
      else
        if Down then
          Details := ThemeServices.GetElementDetails(tsUpPressed)
        else
          if Active
            then Details := ThemeServices.GetElementDetails(tsUpHot)
            else Details := ThemeServices.GetElementDetails(tsUpNormal);
    ThemeServices.DrawElement(DC, Details, ARect);
  end else
{$ENDIF}
  begin
    Flags := DownFlags[Down] or FlatFlags[Flat] or EnabledFlags[Enabled];
    DrawFrameControl(DC, ARect, DFC_SCROLL, Flags or IsDownFlags[DownDirection]);
  end;
end;

procedure DrawOneButton(DC: HDC; Style: TDrawButtonControlStyleEh;
  ARect: TRect; Enabled, Flat, Active, Down, DownDirection: Boolean);
var
  Rgn, SaveRgn: HRgn;
  r: Integer;
  IsClipRgn: Boolean;
  DRect: TRect;
//    Brush: HBRUSH;
begin
  DRect := ARect;
  LPtoDP(DC, DRect, 2);

{$IFDEF EH_LIB_7}
  IsClipRgn := Flat and Active and not ThemeServices.ThemesEnabled;
{$ELSE}
  IsClipRgn := Flat and Active;
{$ENDIF}
  r := 0; SaveRgn := 0;
  if IsClipRgn then
  begin
    SaveRgn := CreateRectRgn(0, 0, 0, 0);
    r := GetClipRgn(DC, SaveRgn);
    with DRect do
      Rgn := CreateRectRgn(Left + 1, Top + 1, Right - 1, Bottom - 1);
    SelectClipRgn(DC, Rgn);
    DeleteObject(Rgn);
  end;

  if Flat {$IFDEF EH_LIB_7} and not ThemeServices.ThemesEnabled {$ENDIF} then
    if not Active {and not (Style=bcsUpDownEh)}
      then InflateRect(ARect, 2, 2)
      else InflateRect(ARect, 1, 1);
  case Style of
    bcsDropDownEh: DrawDropDownButton(DC, ARect, Enabled, Flat, Active, Down);
    bcsEllipsisEh: DrawEllipsisButton(DC, ARect, Enabled, Active, Flat, Down);
    bcsUpDownEh: DrawUpDownButton(DC, ARect, Enabled, Flat, Active, Down, DownDirection);
    bcsMinusEh, bcsPlusEh: DrawPlusMinusButton(DC, ARect, Enabled, Active, Flat, Down, bcsPlusEh = Style);
  end;
  if Flat then
    if not Active {and not (Style=bcsUpDownEh)}
      then InflateRect(ARect, -2, -2)
      else InflateRect(ARect, -1, -1);

  if IsClipRgn then
  begin
    if r = 0
      then SelectClipRgn(DC, 0)
      else SelectClipRgn(DC, SaveRgn);
    DeleteObject(SaveRgn);
    if Down
      then DrawEdge(DC, ARect, BDR_SUNKENOUTER, BF_RECT)
      else DrawEdge(DC, ARect, BDR_RAISEDINNER, BF_RECT)
  end;
end;

type
  PPoints = ^TPoints;
  TPoints = array[0..0] of TPoint;

  TButtonBitmapInfoEh = record
    Size: TPoint;
    BitmapType: TDrawButtonControlStyleEh;
    Flat: Boolean;
    Pressed: Boolean;
    Active: Boolean;
    Enabled: Boolean;
    DownDirect: Boolean;
    CheckState: TCheckBoxState;
  end;

  { TButtonsBitmapCache }

  TButtonBitmapInfoBitmapEh = record
    BitmapInfo: TButtonBitmapInfoEh;
    Bitmap: TBitmap;
  end;

  PButtonBitmapInfoBitmapEh = ^TButtonBitmapInfoBitmapEh;

  TButtonsBitmapCache = class(TList)
  private
    function Get(Index: Integer): PButtonBitmapInfoBitmapEh;
//    procedure Put(Index: Integer; const Value: PButtonBitmapInfoBitmapEh);
  public
    procedure Clear; override;
    function GetButtonBitmap(ButtonBitmapInfo: TButtonBitmapInfoEh): TBitmap;
    property Items[Index: Integer]: PButtonBitmapInfoBitmapEh read Get {write Put}; default;
  end;

var ButtonsBitmapCache: TButtonsBitmapCache;

procedure ClearButtonsBitmapCache;
begin
  ButtonsBitmapCache.Clear;
end;

function RectSize(ARect: TRect): TSize;
begin
  Result.cx := ARect.Right - ARect.Left;
  Result.cy := ARect.Bottom - ARect.Top;
end;

procedure PaintButtonControlEh(DC: HDC; ARect: TRect; ParentColor: TColor;
  Style: TDrawButtonControlStyleEh; DownButton: Integer;
  Flat, Active, Enabled: Boolean; State: TCheckBoxState);
var
  Rgn, SaveRgn: HRgn;
  HalfRect, DRect: TRect;
  ASize: TSize;
  r: Integer;
  Brush: HBRUSH;
  IsClipRgn: Boolean;
  BitmapInfo: TButtonBitmapInfoEh;
  Bitmap: TBitmap;
begin
  SaveRgn := 0; r := 0;
  FillChar(BitmapInfo, Sizeof(BitmapInfo), #0);
  BitmapInfo.BitmapType := Style;
  BitmapInfo.Flat := Flat;

  if Style = bcsCheckboxEh then
  begin
    ASize := RectSize(ARect);
    if ASize.cx < ASize.cy then
    begin
      ARect.Top := ARect.Top + (ASize.cy - ASize.cx) div 2;
      ARect.Bottom := ARect.Bottom - (ASize.cy - ASize.cx) div 2 - (ASize.cy - ASize.cx) mod 2;
    end else if ASize.cx > ASize.cy then
    begin
      ARect.Left := ARect.Left + (ASize.cx - ASize.cy) div 2;
      ARect.Right := ARect.Right - (ASize.cx - ASize.cy) div 2 - (ASize.cx - ASize.cy) mod 2;
    end;

    if Flat then InflateRect(ARect, -1, -1);
    if UseButtonsBitmapCache then
    begin
      BitmapInfo.Size := Point(ARect.Right - ARect.Left, ARect.Bottom - ARect.Top);
      BitmapInfo.CheckState := State;
      BitmapInfo.Pressed := DownButton <> 0;
      BitmapInfo.Active := Active;
      BitmapInfo.Enabled := Enabled;
      Bitmap := ButtonsBitmapCache.GetButtonBitmap(BitmapInfo);

      StretchBlt(DC, ARect.Left, ARect.Top, ARect.Right - ARect.Left,
        ARect.Bottom - ARect.Top, Bitmap.Canvas.Handle, 0, 0,
        Bitmap.Width, Bitmap.Height, cmSrcCopy);
    end else
      DrawCheck(DC, ARect, State, Enabled, Flat, DownButton <> 0, Active);

    if Flat then
    begin
      InflateRect(ARect, 1, 1);
      if Active then
        DrawEdge(DC, ARect, BDR_SUNKENOUTER, BF_RECT)
      else
      begin
//        FrameRect(DC, ARect, GetCurrentObject(DC, OBJ_BRUSH));
        Brush := CreateSolidBrush(ColorToRGB(ParentColor));
        FrameRect(DC, ARect, Brush);
        DeleteObject(Brush);
      end;
    end;
  end else
  begin
    BitmapInfo.Active := Active;
    BitmapInfo.Enabled := Enabled;

{$IFDEF EH_LIB_7}
    IsClipRgn := Flat and not Active and not ThemeServices.ThemesEnabled;
{$ELSE}
    IsClipRgn := Flat and not Active;
{$ENDIF}
    if IsClipRgn then
    begin
      DRect := ARect;
      LPtoDP(DC, DRect, 2);
      InflateRect(ARect, -1, -1);
      if not UseButtonsBitmapCache then
      begin
        SaveRgn := CreateRectRgn(0, 0, 0, 0);
        r := GetClipRgn(DC, SaveRgn);
        with DRect do
          Rgn := CreateRectRgn(Left + 1, Top + 1, Right - 1, Bottom - 1);
        SelectClipRgn(DC, Rgn);
        DeleteObject(Rgn);
      end;
    end;

    if Style = bcsUpDownEh then
    begin
      if IsClipRgn then InflateRect(ARect, 1, 1);
      HalfRect := ARect;
      with HalfRect do
        Bottom := Top + (Bottom - Top) div 2;
      if IsClipRgn then InflateRect(HalfRect, -1, -1);
      if UseButtonsBitmapCache then
      begin
        BitmapInfo.Size := Point(HalfRect.Right - HalfRect.Left, HalfRect.Bottom - HalfRect.Top);
        BitmapInfo.Pressed := DownButton = 1;
        BitmapInfo.DownDirect := False;
        Bitmap := ButtonsBitmapCache.GetButtonBitmap(BitmapInfo);
        StretchBlt(DC, HalfRect.Left, HalfRect.Top, HalfRect.Right - HalfRect.Left,
          HalfRect.Bottom - HalfRect.Top, Bitmap.Canvas.Handle, 0, 0,
          Bitmap.Width, Bitmap.Height, cmSrcCopy);
      end else
        DrawOneButton(DC, Style, HalfRect, Enabled, Flat, Active, DownButton = 1, False);
      if IsClipRgn then InflateRect(HalfRect, 1, 1);
      HalfRect.Bottom := ARect.Bottom;
      with HalfRect do
        Top := Bottom - (Bottom - Top) div 2;
      if IsClipRgn then InflateRect(HalfRect, -1, -1);
      if UseButtonsBitmapCache then
      begin
        BitmapInfo.Size := Point(HalfRect.Right - HalfRect.Left, HalfRect.Bottom - HalfRect.Top);
        BitmapInfo.Pressed := DownButton = 2;
        BitmapInfo.DownDirect := True;
        Bitmap := ButtonsBitmapCache.GetButtonBitmap(BitmapInfo);
        StretchBlt(DC, HalfRect.Left, HalfRect.Top, HalfRect.Right - HalfRect.Left,
          HalfRect.Bottom - HalfRect.Top, Bitmap.Canvas.Handle, 0, 0,
          Bitmap.Width, Bitmap.Height, cmSrcCopy);
      end else
        DrawOneButton(DC, Style, HalfRect, Enabled, Flat, Active, DownButton = 2, True);
      if IsClipRgn
        then InflateRect(ARect, -1, -1);
      if ((ARect.Bottom - ARect.Top) mod 2 = 1) or (IsClipRgn) then
      begin
        HalfRect := ARect;
        HalfRect.Top := (HalfRect.Bottom + HalfRect.Top) div 2;
        HalfRect.Bottom := HalfRect.Top;
        if (ARect.Bottom - ARect.Top) mod 2 = 1 then Inc(HalfRect.Bottom);
        if IsClipRgn then InflateRect(HalfRect, 0, 1);
        Brush := CreateSolidBrush(ColorToRGB(ParentColor));
        FillRect(DC, HalfRect, Brush);
        DeleteObject(Brush);
      end;
    end else if UseButtonsBitmapCache then
    begin
      BitmapInfo.Size := Point(ARect.Right - ARect.Left, ARect.Bottom - ARect.Top);
      BitmapInfo.Pressed := DownButton <> 0;
      Bitmap := ButtonsBitmapCache.GetButtonBitmap(BitmapInfo);
      StretchBlt(DC, ARect.Left, ARect.Top, ARect.Right - ARect.Left,
        ARect.Bottom - ARect.Top, Bitmap.Canvas.Handle, 0, 0,
        Bitmap.Width, Bitmap.Height, cmSrcCopy);
    end else
      DrawOneButton(DC, Style, ARect, Enabled, Flat, Active, DownButton <> 0, True);

    if IsClipRgn then
    begin
      InflateRect(ARect, 1, 1);
      if not UseButtonsBitmapCache then
      begin
        if r = 0
          then SelectClipRgn(DC, 0)
          else SelectClipRgn(DC, SaveRgn);
        DeleteObject(SaveRgn);
      end;
      Brush := CreateSolidBrush(ColorToRGB(ParentColor));
      FrameRect(DC, ARect, Brush);
      DeleteObject(Brush);
    end;
  end;
end;

function GetDefaultFlatButtonWidth: Integer;
var
  DC: HDC;
  SysMetrics: TTextMetric;
begin
  DC := GetDC(0);
  GetTextMetrics(DC, SysMetrics);
  ReleaseDC(0, DC);
  Result := Round(SysMetrics.tmHeight / 3 * 2);
  if Result mod 2 = 0 then Dec(Result);
  if Result > GetSystemMetrics(SM_CXVSCROLL)
    then Result := GetSystemMetrics(SM_CXVSCROLL);
end;

//{$DEBUGINFO OFF}
function VarEquals(const V1, V2: Variant): Boolean;
var i: Integer;
begin
  Result := not (VarIsArray(V1) xor VarIsArray(V2));
  if not Result then Exit;
  Result := False;
  try
    if VarIsArray(V1) and VarIsArray(V2) and
      (VarArrayDimCount(V1) = VarArrayDimCount(V2)) and
      (VarArrayLowBound(V1, 1) = VarArrayLowBound(V2, 1)) and
      (VarArrayHighBound(V1, 1) = VarArrayHighBound(V2, 1))
      then
      for i := VarArrayLowBound(V1, 1) to VarArrayHighBound(V1, 1) do
      begin
        Result := V1[i] = V2[i];
        if not Result then Exit;
      end
    else
      Result := V1 = V2;
  except
  end;
end;
//{$DEBUGINFO ON}

function GetRGBColor(Value: TColor): DWORD;
begin
  Result := ColorToRGB(Value);
  case Result of
    clNone: Result := CLR_NONE;
    clDefault: Result := CLR_DEFAULT;
  end;
end;

procedure DrawImage(DC: HDC; ARect: TRect; Images: TCustomImageList;
  ImageIndex: Integer; Selected: Boolean);
const
  ImageTypes: array[TImageType] of Longint = (0, ILD_MASK);
  ImageSelTypes: array[Boolean] of Longint = (0, ILD_SELECTED);
var CheckedRect, AUnionRect: TRect;
  OldRectRgn, RectRgn: HRGN;
  r, x, y: Integer;
  procedure DrawIm;
  var ABlendColor: TColor;
  begin
    with Images do
      if HandleAllocated then
      begin
        if Selected then ABlendColor := clHighlight
        else ABlendColor := BlendColor;
        ImageList_DrawEx(Handle, ImageIndex, DC, x, y, 0, 0,
          GetRGBColor(BkColor), GetRGBColor(ABlendColor),
          ImageTypes[ImageType] or ImageSelTypes[Selected]);
      end;
  end;
begin
  with Images do
  begin
    x := (ARect.Right + ARect.Left - Images.Width) div 2;
    y := (ARect.Bottom + ARect.Top - Images.Height) div 2;
    CheckedRect := Rect(X, Y, X + Images.Width, Y + Images.Height);
    UnionRect(AUnionRect, CheckedRect, ARect);
    if EqualRect(AUnionRect, ARect) then // ARect containt image
      DrawIm
    else
    begin // Need clip
      OldRectRgn := CreateRectRgn(0, 0, 0, 0);
      r := GetClipRgn(DC, OldRectRgn);
      RectRgn := CreateRectRgn(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom);
      SelectClipRgn(DC, RectRgn);
      DeleteObject(RectRgn);

      DrawIm;

      if r = 0
        then SelectClipRgn(DC, 0)
        else SelectClipRgn(DC, OldRectRgn);
      DeleteObject(OldRectRgn);
    end;
  end;
end;

function AlignDropDownWindowRect(MasterAbsRect: TRect; DropDownWin: TWinControl; Align: TDropDownAlign): TPoint;
var
  P: TPoint;
  Y: Integer;
  WorkArea: TRect;
  MonInfo: TMonitorInfo;
begin
  P := MasterAbsRect.TopLeft;
  Y := P.Y + (MasterAbsRect.Bottom - MasterAbsRect.Top);

  MonInfo.cbSize := SizeOf(MonInfo);
  GetMonitorInfo(MonitorFromRect(@MasterAbsRect, MONITOR_DEFAULTTONEAREST), @MonInfo);
  WorkArea := MonInfo.rcWork;
//  SystemParametersInfo(SPI_GETWORKAREA, 0, Pointer(@WorkArea), 0);

  if ((Y + DropDownWin.Height > WorkArea.Bottom) and (P.Y - DropDownWin.Height >= WorkArea.Top)) or
    ((P.Y - DropDownWin.Height < WorkArea.Top) and (WorkArea.Bottom - Y < P.Y - WorkArea.Top))
    then
  begin
    if P.Y - DropDownWin.Height < WorkArea.Top then
      DropDownWin.Height := P.Y - WorkArea.Top;
    Y := P.Y - DropDownWin.Height;
    DropDownWin.Perform(cm_SetSizeGripChangePosition, Ord(sgcpToTop), 0);
  end else
  begin
    if Y + DropDownWin.Height > WorkArea.Bottom then
      DropDownWin.Height := WorkArea.Bottom - Y;
    DropDownWin.Perform(cm_SetSizeGripChangePosition, Ord(sgcpToBottom), 0);
  end;

  case Align of
    daRight: Dec(P.X, DropDownWin.Width - (MasterAbsRect.Right - MasterAbsRect.Left));
    daCenter: Dec(P.X, (DropDownWin.Width - (MasterAbsRect.Right - MasterAbsRect.Left)) div 2);
  end;

  if (DropDownWin.Width > WorkArea.Right - WorkArea.Left) then
    DropDownWin.Width := WorkArea.Right - WorkArea.Left;
  if (P.X + DropDownWin.Width > WorkArea.Right) then
  begin
    P.X := WorkArea.Right - DropDownWin.Width;
    DropDownWin.Perform(cm_SetSizeGripChangePosition, Ord(sgcpToLeft), 0);
  end
  else if P.X < WorkArea.Left then
  begin
    P.X := WorkArea.Left;
    DropDownWin.Perform(cm_SetSizeGripChangePosition, Ord(sgcpToRight), 0);
  end else if Align = daRight then
    DropDownWin.Perform(cm_SetSizeGripChangePosition, Ord(sgcpToLeft), 0)
  else
    DropDownWin.Perform(cm_SetSizeGripChangePosition, Ord(sgcpToRight), 0);

  Result := Point(P.X, Y);
end;

function AlignDropDownWindow(MasterWin, DropDownWin: TWinControl; Align: TDropDownAlign): TPoint;
var
  MasterAbsRect: TRect;
begin
  MasterAbsRect.TopLeft := MasterWin.Parent.ClientToScreen(Point(MasterWin.Left, MasterWin.Top));
  MasterAbsRect.Bottom := MasterAbsRect.Top + MasterWin.Height;
  MasterAbsRect.Right := MasterAbsRect.Left + MasterWin.Width;
  Result := AlignDropDownWindowRect(MasterAbsRect, DropDownWin, Align);
end;

{ TButtonsBitmapCache }

function TButtonsBitmapCache.GetButtonBitmap(ButtonBitmapInfo: TButtonBitmapInfoEh): TBitmap;
var i: Integer;
  BitmapInfoBitmap: PButtonBitmapInfoBitmapEh;
begin
  if ButtonBitmapInfo.Size.X < 0 then ButtonBitmapInfo.Size.X := 0;
  if ButtonBitmapInfo.Size.Y < 0 then ButtonBitmapInfo.Size.Y := 0;
  for i := 0 to Count - 1 do
    if CompareMem(@ButtonBitmapInfo, Items[i], SizeOf(TButtonBitmapInfoEh)) then
    begin
      Result := Items[i].Bitmap;
      Exit;
    end;
  New(BitmapInfoBitmap);
  Add(BitmapInfoBitmap);
  BitmapInfoBitmap.BitmapInfo := ButtonBitmapInfo;
  BitmapInfoBitmap.Bitmap := TBitmap.Create;
  BitmapInfoBitmap.Bitmap.Width := ButtonBitmapInfo.Size.X;
  BitmapInfoBitmap.Bitmap.Height := ButtonBitmapInfo.Size.Y;

  case ButtonBitmapInfo.BitmapType of
    bcsCheckboxEh:
      DrawCheck(BitmapInfoBitmap.Bitmap.Canvas.Handle,
        Rect(0, 0, ButtonBitmapInfo.Size.X, ButtonBitmapInfo.Size.Y),
        ButtonBitmapInfo.CheckState,
        ButtonBitmapInfo.Enabled,
        ButtonBitmapInfo.Flat,
        ButtonBitmapInfo.Pressed,
        ButtonBitmapInfo.Active
        );
    bcsEllipsisEh, bcsUpDownEh, bcsDropDownEh, bcsPlusEh, bcsMinusEh:
      DrawOneButton(BitmapInfoBitmap.Bitmap.Canvas.Handle, ButtonBitmapInfo.BitmapType,
        Rect(0, 0, ButtonBitmapInfo.Size.X, ButtonBitmapInfo.Size.Y),
        ButtonBitmapInfo.Enabled, ButtonBitmapInfo.Flat,
        ButtonBitmapInfo.Active, ButtonBitmapInfo.Pressed,
        ButtonBitmapInfo.DownDirect);
  end;
  Result := BitmapInfoBitmap.Bitmap;
end;

function TButtonsBitmapCache.Get(Index: Integer): PButtonBitmapInfoBitmapEh;
begin
  Result := inherited Items[Index];
end;

{procedure TButtonsBitmapCache.Put(Index: Integer; const Value: PButtonBitmapInfoBitmapEh);
begin
  inherited Items[Index] := Value;
end;}

procedure TButtonsBitmapCache.Clear;
var i: Integer;
begin
  for i := 0 to Count - 1 do
  begin
    Items[i].Bitmap.Free;
    Dispose(Items[i]);
  end;
  inherited Clear;
end;

{ TEditButtonControlEh }

procedure TEditButtonControlEh.EditButtonDown(TopButton: Boolean; var AutoRepeat: Boolean);
var Handled: Boolean;
begin
  if Assigned(FOnDown) then
    FOnDown(Self, TopButton, AutoRepeat, Handled);
end;

procedure TEditButtonControlEh.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var AutoRepeat: Boolean;
//    OldState: TButtonState;
begin
  if Style = ebsUpDownEh
    then AutoRepeat := True
    else AutoRepeat := False;
//  OldState := FState;
  inherited MouseDown(Button, Shift, X, Y);
  if (Button = mbLeft) then
  begin
    UpdateDownButtonNum(X, Y);
    if FButtonNum > 0 then
    begin
      EditButtonDown(FButtonNum = 1, AutoRepeat);
      if AutoRepeat then ResetTimer(InitRepeatPause);
    end;
  end;
end;

procedure TEditButtonControlEh.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
  if MouseCapture and (FStyle = ebsUpDownEh) and (FState = bsDown) then
  begin
    if ((FButtonNum = 2) and (Y < (Height div 2))) or
      ((FButtonNum = 1) and (Y > (Height - Height div 2))) then
    begin
      FState := bsUp;
      Invalidate;
    end;
  end;
end;

procedure TEditButtonControlEh.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (FStyle = ebsUpDownEh) and (FState <> bsDown) then
    FNoDoClick := True;
  try
    inherited MouseUp(Button, Shift, X, Y);
  finally
    FNoDoClick := False;
  end;
  UpdateDownButtonNum(X, Y);
  if (FTimer <> nil) and FTimer.Enabled then
    FTimer.Enabled := False;
end;

procedure TEditButtonControlEh.UpdateDownButtonNum(X, Y: Integer);
var OldButtonNum: Integer;
begin
  OldButtonNum := FButtonNum;
  if FState in [bsDown, bsExclusive] then
    if FStyle = ebsUpDownEh then
    begin
      if Y < (Height div 2) then
        FButtonNum := 1
      else if Y > (Height - Height div 2) then
        FButtonNum := 2
      else
        FButtonNum := 0;
    end
    else FButtonNum := 1
  else
    FButtonNum := 0;
  if FButtonNum <> OldButtonNum then
    Invalidate;
end;

procedure TEditButtonControlEh.Paint;
const
  StyleFlags: array[TEditButtonStyleEh] of TDrawButtonControlStyleEh =
  (bcsDropDownEh, bcsEllipsisEh, bcsUpDownEh, bcsUpDownEh, bcsPlusEh, bcsMinusEh);
  DownStyles: array[Boolean] of Integer = (BDR_RAISEDINNER, BDR_SUNKENOUTER);
var Rgn, SaveRgn: HRgn;
  r: Integer;
  BRect: TRect;
  IsClipRgn: Boolean;
  AButtonNum: Integer;
begin
  AButtonNum := FButtonNum;
{$IFDEF EH_LIB_7}
  IsClipRgn := False;
  SaveRgn := 0;
  r := 0;
{$ENDIF}
  if not (FState in [bsDown, bsExclusive]) then
    AButtonNum := 0;
  //else if AButtonNum = 0 then
  //  AButtonNum := 1;
  if not (Style = ebsGlyphEh) then
    PaintButtonControlEh(Canvas.Handle, Rect(0, 0, Width, Height),
      TWinControlCracker(Parent).Color, StyleFlags[Style], AButtonNum,
      Flat, FActive, Enabled, cbUnchecked)
  else
  begin
{$IFDEF EH_LIB_7}
    if not ThemeServices.ThemesEnabled then
{$ENDIF}
    begin
      IsClipRgn := Flat {and not FActive};
      BRect := BoundsRect;
      r := 0;
      SaveRgn := 0;
      if IsClipRgn then
      begin
        SaveRgn := CreateRectRgn(0, 0, 0, 0);
        r := GetClipRgn(Canvas.Handle, SaveRgn);
        with BRect do
          Rgn := CreateRectRgn(Left + 1, Top + 1, Right - 1, Bottom - 1);
        SelectClipRgn(Canvas.Handle, Rgn);
        DeleteObject(Rgn);
      end;
    end;

    inherited Paint;

{$IFDEF EH_LIB_7}
    if not ThemeServices.ThemesEnabled then
{$ENDIF}
    begin
      if IsClipRgn then
      begin
        if r = 0 then
          SelectClipRgn(Canvas.Handle, 0)
        else
          SelectClipRgn(Canvas.Handle, SaveRgn);
        DeleteObject(SaveRgn);
        OffsetRect(BRect, -Left, -Top);
        if FActive then
          DrawEdge(Canvas.Handle, BRect, DownStyles[FState in [bsDown, bsExclusive]], BF_RECT)
        else
        begin
          Canvas.Brush.Color := TWinControlCracker(Parent).Color;
          Canvas.FrameRect(BRect);
        end;
      end;
    end;

  end;
end;

procedure TEditButtonControlEh.SetState(NewState: TButtonState; IsActive: Boolean; ButtonNum: Integer);
begin
  if (FState <> NewState) or (IsActive <> FActive) or (ButtonNum <> FButtonNum) then
  begin
    FActive := IsActive;
    FState := NewState;
    FButtonNum := ButtonNum;
    //Invalidate;
    Repaint;
  end;
end;

procedure TEditButtonControlEh.SetStyle(const Value: TEditButtonStyleEh);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    Invalidate;
  end;
end;

procedure TEditButtonControlEh.SetWidthNoNotify(AWidth: Integer);
begin
  inherited Width := AWidth;
end;

procedure TEditButtonControlEh.SetActive(const Value: Boolean);
begin
  if Active <> Value then
  begin
    FActive := Value;
    Invalidate;
  end;
end;

procedure TEditButtonControlEh.Click;
begin
  if not FNoDoClick then
  begin
    inherited Click;
  end;
end;

function TEditButtonControlEh.GetTimer: TTimer;
begin
  if FTimer = nil then
  begin
    FTimer := TTimer.Create(Self);
    FTimer.Enabled := False;
    FTimer.OnTimer := TimerEvent;
  end;
  Result := FTimer;
end;

procedure TEditButtonControlEh.ResetTimer(Interval: Cardinal);
begin
  if Timer.Enabled = False then
  begin
    Timer.Interval := Interval;
    Timer.Enabled := True;
  end
  else if Interval <> Timer.Interval then
  begin
    Timer.Enabled := False;
    Timer.Interval := Interval;
    Timer.Enabled := True;
  end;
end;

procedure TEditButtonControlEh.TimerEvent(Sender: TObject);
var AutoRepeat: Boolean;
begin
  if Style = ebsUpDownEh
    then AutoRepeat := True
    else AutoRepeat := False;
  if not (FState = bsDown) then Exit;
  if Timer.Interval = Cardinal(InitRepeatPause) then
    ResetTimer(RepeatPause);
  if FState = bsDown then
    EditButtonDown(FButtonNum = 1, AutoRepeat);
  if not AutoRepeat then Timer.Enabled := False;
end;

procedure TEditButtonControlEh.SetAlwaysDown(const Value: Boolean);
begin
  if FAlwaysDown <> Value then
  begin
    FAlwaysDown := Value;
    if Value then
    begin
      GroupIndex := 1;
      Down := True;
      AllowAllUp := False;
      FButtonNum := 1;
    end else
    begin
      AllowAllUp := True;
      Down := False;
      GroupIndex := 0;
      FButtonNum := 0;
    end;
  end;
end;

{ TEditButtonEh }

constructor TEditButtonEh.Create(EditControl: TWinControl {; EditButtonControl: TEditButtonControlEh});
begin
  inherited Create(nil);
  FEditControl := EditControl;
  FGlyph := TBitmap.Create;
  FGlyph.Transparent := True;
  FShortCut := scNone; //Menus.ShortCut(VK_DOWN, [ssAlt]); //32808
  FNumGlyphs := 1;
end;

constructor TEditButtonEh.Create(Collection: TCollection);
begin
  if Assigned(Collection) then Collection.BeginUpdate;
  try
    inherited Create(Collection);
    FEditControl := nil;
    FGlyph := TBitmap.Create;
    FGlyph.Transparent := True;
    FShortCut := scNone; //Menus.ShortCut(VK_DOWN, [ssAlt]); //32808
    FNumGlyphs := 1;
  finally
    if Assigned(Collection) then Collection.EndUpdate;
  end;
end;

destructor TEditButtonEh.Destroy;
begin
  FGlyph.Free;
  inherited Destroy;
end;

procedure TEditButtonEh.Assign(Source: TPersistent);
begin
  if Source is TEditButtonEh then
  begin
    DropdownMenu := TEditButtonEh(Source).DropdownMenu;
    Glyph := TEditButtonEh(Source).Glyph;
    Hint := TEditButtonEh(Source).Hint;
    NumGlyphs := TEditButtonEh(Source).NumGlyphs;
    ShortCut := TEditButtonEh(Source).ShortCut;
    Style := TEditButtonEh(Source).Style;
    Visible := TEditButtonEh(Source).Visible;
    Width := TEditButtonEh(Source).Width;
    OnClick := TEditButtonEh(Source).OnClick;
    OnDown := TEditButtonEh(Source).OnDown;
  end else
    inherited Assign(Source);
end;

function TEditButtonEh.GetGlyph: TBitmap;
begin
  Result := FGlyph;
end;

procedure TEditButtonEh.SetGlyph(const Value: TBitmap);
begin
  FGlyph.Assign(Value);
  Changed;
end;

procedure TEditButtonEh.SetNumGlyphs(Value: Integer);
begin
  if Value <= 0 then Value := 1
  else if Value > 4 then Value := 4;
  if Value <> FNumGlyphs then
  begin
    FNumGlyphs := Value;
    Changed;
  end;
end;

procedure TEditButtonEh.SetStyle(const Value: TEditButtonStyleEh);
begin
  if FStyle <> Value then
  begin
    FStyle := Value;
    Changed;
  end;
end;

procedure TEditButtonEh.SetWidth(const Value: Integer);
begin
  if FWidth <> Value then
  begin
    FWidth := Value;
    Changed;
  end;
end;

procedure TEditButtonEh.SetVisible(const Value: Boolean);
begin
  if FVisible <> Value then
  begin
    FVisible := Value;
    Changed;
  end;
end;

function TEditButtonEh.CreateEditButtonControl: TEditButtonControlEh;
begin
  Result := TEditButtonControlEh.Create(FEditControl);
  with Result do
  begin
    ControlStyle := ControlStyle + [csReplicatable];
    Width := 10;
    Height := 17;
    Visible := True;
    Transparent := False;
    Parent := FEditControl;
  end;
end;

procedure TEditButtonEh.Changed;
begin
  if Assigned(FOnChanged) then
    FOnChanged(Self)
  else if Assigned(Collection) then
    Changed(False)
end;

procedure TEditButtonEh.SetHint(const Value: String);
begin
  if FHint <> Value then
  begin
    FHint := Value;
    Changed;
  end;
end;

{ TEditButtonsEh }

function TEditButtonsEh.Add: TEditButtonEh;
begin
  Result := TEditButtonEh(inherited Add);
end;

constructor TEditButtonsEh.Create(Owner: TPersistent; EditButtonClass: TEditButtonEhClass);
begin
  inherited Create(EditButtonClass);
  FOwner := Owner;
end;

function TEditButtonsEh.GetEditButton(Index: Integer): TEditButtonEh;
begin
  Result := TEditButtonEh(inherited Items[Index]);
end;

function TEditButtonsEh.GetOwner: TPersistent;
begin
//  inherited GetOwner;
  Result := FOwner;
end;

procedure TEditButtonsEh.SetEditButton(Index: Integer; Value: TEditButtonEh);
begin
  inherited Items[Index] := Value;
end;

procedure TEditButtonsEh.Update(Item: TCollectionItem);
begin
  inherited Update(Item);
  if Assigned(FOnChanged) then FOnChanged(Item);
end;

{ TDropDownEditButtonEh }

constructor TDropDownEditButtonEh.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FShortCut := Menus.ShortCut(VK_DOWN, [ssAlt]); //32808
end;

constructor TDropDownEditButtonEh.Create(EditControl: TWinControl);
begin
  inherited Create(EditControl);
  FShortCut := Menus.ShortCut(VK_DOWN, [ssAlt]); //32808
end;

{ TVisibleEditButtonEh }

constructor TVisibleEditButtonEh.Create(EditControl: TWinControl);
begin
  inherited Create(EditControl);
  FVisible := True;
  FShortCut := Menus.ShortCut(VK_DOWN, [ssAlt]); //32808
end;

constructor TVisibleEditButtonEh.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FVisible := True;
  FShortCut := Menus.ShortCut(VK_DOWN, [ssAlt]); //32808
end;

{ TSpecRowEh }

constructor TSpecRowEh.Create(Owner: TPersistent);
begin
  inherited Create;
  FOwner := Owner;
  FFont := TFont.Create;
  FFont.Assign(DefaultFont);
  FFont.OnChange := FontChanged;
  FCellsStrings := TStringList.Create;
  FValue := Null;
  FShowIfNotInKeyList := True;
  FShortCut := Menus.ShortCut(VK_DELETE, [ssAlt]); //32814
end;

destructor TSpecRowEh.Destroy;
begin
  FCellsStrings.Free;
  FFont.Free;
  inherited Destroy;
end;

function TSpecRowEh.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

procedure TSpecRowEh.Changed;
begin
  if (FUpdateCount = 0) and Assigned(FOnChanged) then
    OnChanged(Self);
end;

procedure SetCellsStrings(Strings: TStrings; const Value: String);
const
  Delimiter = ';';
  QuoteChar = '"';
var
  P, P1: PChar;
  S: string;
begin
  Strings.BeginUpdate;
  try
    Strings.Clear;
    P := PChar(Value);
    while P^ in [#1..#31] do P := CharNext(P);
    while P^ <> #0 do
    begin
      if P^ = QuoteChar then
        S := AnsiExtractQuotedStr(P, QuoteChar)
      else
      begin
        P1 := P;
        while (P^ >= ' ') and (P^ <> Delimiter) do P := CharNext(P);
        SetString(S, P1, P - P1);
      end;
      Strings.Add(S);
      while P^ in [#1..#31] do P := CharNext(P);
      if P^ = Delimiter then
        repeat
          P := CharNext(P);
        until not (P^ in [#1..#31]);
    end;
  finally
    Strings.EndUpdate;
  end;
end;

procedure TSpecRowEh.SetCellsText(const Value: String);
begin
  if FCellsText <> Value then
  begin
    FCellsText := Value;
    SetCellsStrings(FCellsStrings, Value);
    Changed;
  end;
end;

procedure TSpecRowEh.SetColor(const Value: TColor);
begin
  if FColor <> Value then
  begin
    FColor := Value;
    FColorAssigned := True;
    Changed;
  end;
end;

procedure TSpecRowEh.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TSpecRowEh.SetValue(const Value: Variant);
begin
  if FValue <> Value then
  begin
    FValue := Value;
    Changed;
  end;
end;

procedure TSpecRowEh.SetVisible(const Value: Boolean);
begin
  if FVisible <> Value then
  begin
    FVisible := Value;
    Changed;
  end;
end;

procedure TSpecRowEh.FontChanged(Sender: TObject);
begin
  Changed;
  FFontAssigned := True;
end;

procedure TSpecRowEh.SetShowIfNotInKeyList(const Value: Boolean);
begin
  if FShowIfNotInKeyList <> Value then
  begin
    FShowIfNotInKeyList := Value;
    Changed;
  end;
end;

procedure TSpecRowEh.Assign(Source: TPersistent);
begin
  if Source is TSpecRowEh then
  begin
    BeginUpdate;
    try
      CellsText := TSpecRowEh(Source).CellsText;
      Color := TSpecRowEh(Source).Color;
      if TSpecRowEh(Source).FFontAssigned then
        Font := TSpecRowEh(Source).Font;
      ShortCut := TSpecRowEh(Source).ShortCut;
      ShowIfNotInKeyList := TSpecRowEh(Source).ShowIfNotInKeyList;
      Value := TSpecRowEh(Source).Value;
      Visible := TSpecRowEh(Source).Visible;
    finally
      EndUpdate;
    end;
  end else
    inherited Assign(Source);
end;

function TSpecRowEh.GetFont: TFont;
var
  Save: TNotifyEvent;
begin
  if not FFontAssigned and (FFont.Handle <> DefaultFont.Handle) then
  begin
    Save := FFont.OnChange;
    FFont.OnChange := nil;
    FFont.Assign(DefaultFont);
    FFont.OnChange := Save;
  end;
  Result := FFont;
end;

function TSpecRowEh.GetColor: TColor;
begin
  if not FColorAssigned
    then Result := DefaultColor
    else Result := FColor;
end;

function TSpecRowEh.DefaultFont: TFont;
begin
  if Assigned(FOwner) and (FOwner is TControl)
    then Result := TControlCracker(FOwner).Font
    else Result := FFont;
end;

function TSpecRowEh.DefaultColor: TColor;
begin
  if Assigned(FOwner) and (FOwner is TControl)
    then Result := TControlCracker(FOwner).Color
    else Result := FColor;
end;

function TSpecRowEh.GetCellText(Index: Integer): String;
begin
  if (Index < 0) or (Index >= FCellsStrings.Count)
    then Result := ''
    else Result := FCellsStrings[Index];
end;

function TSpecRowEh.IsValueStored: Boolean;
begin
  Result := not VarEquals(FValue, Null);
end;

function TSpecRowEh.IsFontStored: Boolean;
begin
  Result := FFontAssigned;
end;

function TSpecRowEh.IsColorStored: Boolean;
begin
  Result := FColorAssigned;
end;

function TSpecRowEh.LocateKey(KeyValue: Variant): Boolean;
begin
  Result := Visible and VarEquals(Value, KeyValue);
end;

procedure TSpecRowEh.BeginUpdate;
begin
  Inc(FUpdateCount);
end;

procedure TSpecRowEh.EndUpdate;
begin
  Dec(FUpdateCount);
  Changed;
end;

procedure GetFieldsProperty(List: TList; DataSet: TDataSet;
  Control: TComponent; const FieldNames: String);
var
  Pos: Integer;
  Field: TField;
  FieldName: String;
begin
  Pos := 1;
  while Pos <= Length(FieldNames) do
  begin
    FieldName := ExtractFieldName(FieldNames, Pos);
    Field := DataSet.FindField(FieldName);
    if Field = nil then
      DatabaseErrorFmt(SFieldNotFound, [FieldName], Control);
    if Assigned(List) then List.Add(Field);
  end;
end;

function GetFieldsProperty(DataSet: TDataSet; Control: TComponent;
  const FieldNames: String): TFieldsArrEh;
var FieldList: TList;
  i: Integer;
begin
  FieldList := TList.Create;
  try
    GetFieldsProperty(FieldList, DataSet, Control, FieldNames);
    SetLength(Result, FieldList.Count);
    for i := 0 to FieldList.Count - 1 do Result[i] := FieldList[i];
  finally
    FieldList.Free;
  end;
end;

procedure DataSetSetFieldValues(DataSet: TDataSet; Fields: String; Value: Variant);
var FieldList: TList;
  i: Integer;
begin
  if VarEquals(Value, Null) then
  begin
    FieldList := TList.Create;
    try
      Dataset.GetFieldList(FieldList, Fields);
      for i := 0 to FieldList.Count - 1 do
        TField(FieldList[i]).Clear;
    finally
      FieldList.Free;
    end;
  end else
    DataSet.FieldValues[Fields] := Value;
end;

{ TSizeGripEh }

constructor TSizeGripEh.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable]; 
  Width := GetSystemMetrics(SM_CXVSCROLL);
  Height := GetSystemMetrics(SM_CYVSCROLL);
  Color := clBtnFace;
  Cursor := crSizeNWSE;
  ControlStyle := ControlStyle + [csCaptureMouse];
  FTriangleWindow := True;
  FPosition := sgpBottomRight;
end;

procedure TSizeGripEh.CreateWnd;
begin
  inherited CreateWnd;
  UpdateWindowRegion;
    //ShowWindow(Handle,SW_SHOW);
end;

procedure TSizeGripEh.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  FInitScreenMousePos := ClientToScreen(Point(X, Y));
  FParentRect.Right := Parent.Width;
  FParentRect.Bottom := Parent.Height;
  FParentRect.Left := Parent.ClientWidth;
  FParentRect.Top := Parent.ClientHeight;
end;

procedure TSizeGripEh.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  NewMousePos, ParentWidthHeight: TPoint;
  OldPos, NewClientAmount, OutDelta: Integer;
  WorkArea: TRect;
begin
  inherited MouseMove(Shift, X, Y);

  if (ssLeft in Shift) and MouseCapture and not FInternalMove then
  begin
    NewMousePos := ClientToScreen(Point(X, Y));
    ParentWidthHeight.x := Parent.ClientWidth;
    ParentWidthHeight.y := Parent.ClientHeight;

    if (FOldMouseMovePos.x = NewMousePos.x) and
      (FOldMouseMovePos.y = NewMousePos.y) then
      Exit;

    SystemParametersInfo(SPI_GETWORKAREA, 0, Pointer(@WorkArea), 0);

    if Position in [sgpBottomRight, sgpTopRight] then
    begin
      NewClientAmount := FParentRect.Left + NewMousePos.x - FInitScreenMousePos.x;
      OutDelta := Parent.Width + NewClientAmount - Parent.ClientWidth;
      OutDelta := Parent.ClientToScreen(Point(OutDelta, 0)).x - WorkArea.Right;
      if OutDelta <= 0
        then Parent.ClientWidth := NewClientAmount
        else Parent.ClientWidth := NewClientAmount - OutDelta
    end else
    begin
      OldPos := Parent.Width;

      NewClientAmount := FParentRect.Right + FInitScreenMousePos.x - NewMousePos.x;
      OutDelta := NewClientAmount - Parent.Width;
      OutDelta := Parent.ClientToScreen(Point(0, 0)).x - WorkArea.Left - OutDelta;
      if OutDelta >= 0
        then Parent.Width := NewClientAmount
        else Parent.Width := NewClientAmount + OutDelta;
//      Parent.Width := FParentRect.Right + FInitScreenMousePos.x - NewMousePos.x;
      Parent.Left := Parent.Left + OldPos - Parent.Width;
    end;

    if Position in [sgpBottomRight, sgpBottomLeft] then
    begin
      NewClientAmount := FParentRect.Top + NewMousePos.y - FInitScreenMousePos.y;
      OutDelta := Parent.Height + NewClientAmount - Parent.ClientHeight;
      OutDelta := Parent.ClientToScreen(Point(0, OutDelta)).y - WorkArea.Bottom;
      if OutDelta <= 0
        then Parent.ClientHeight := NewClientAmount
        else Parent.ClientHeight := NewClientAmount - OutDelta;
    end else
    begin
      OldPos := Parent.Height;
      NewClientAmount := FParentRect.Bottom + FInitScreenMousePos.y - NewMousePos.y;
      OutDelta := NewClientAmount - Parent.Height;
      OutDelta := Parent.ClientToScreen(Point(0, 0)).y - WorkArea.Top - OutDelta;
      if OutDelta >= 0
        then Parent.Height := NewClientAmount
        else Parent.Height := NewClientAmount + OutDelta;
//      Parent.{Client}Height := FParentRect.Bottom + FInitScreenMousePos.y - NewMousePos.y;
      Parent.Top := Parent.Top + OldPos - Parent.Height;
    end;

    FOldMouseMovePos := NewMousePos;
    if (ParentWidthHeight.x <> Parent.ClientWidth) or
      (ParentWidthHeight.y <> Parent.ClientHeight) then
      ParentResized;
    UpdatePosition;
  end;
end;

procedure TSizeGripEh.Paint;
var i, xi, yi: Integer;
  x1, x2, y1, y2: Integer;
  px, py: PInteger;
begin
  i := 1;
  if Position = sgpBottomRight then
  begin
    xi := 1; yi := 1;
    px := @x1; py := @y2;
    x1 := 0; y1 := Width;
    x2 := Width; y2 := 0;
  end else if Position = sgpBottomLeft then
  begin
    xi := -1; yi := 1;
    px := @x2; py := @y1;
    x1 := 0; y1 := 1;
    x2 := Width - 1; y2 := Width;
  end else if Position = sgpTopLeft then
  begin
    xi := -1; yi := -1;
    px := @x1; py := @y2;
    x1 := Width - 1; y1 := -1;
    x2 := -1; y2 := Width - 1;
  end else //  Position = sgpTopRight
  begin
    xi := 1; yi := -1;
    px := @x2; py := @y1;
    x1 := Width; y1 := Width - 1;
    x2 := 0; y2 := -1;
  end;

  with Canvas do
    while i < Width do
    begin
      Pen.Color := clBtnHighlight;
      PolyLine([Point(x1, y1), Point(x2, y2)]);
      Inc(i); Inc(px^, xi); Inc(py^, yi);

      Pen.Color := clBtnShadow;
      PolyLine([Point(x1, y1), Point(x2, y2)]);
      Inc(i); Inc(px^, xi); Inc(py^, yi);
      PolyLine([Point(x1, y1), Point(x2, y2)]);
      Inc(i); Inc(px^, xi); Inc(py^, yi);

      Pen.Color := clBtnFace;
      PolyLine([Point(x1, y1), Point(x2, y2)]);
      Inc(i); Inc(px^, xi); Inc(py^, yi);
    end;
end;

procedure TSizeGripEh.ParentResized;
begin
  if Assigned(FParentResized) then FParentResized(Self);
end;

procedure TSizeGripEh.SetPosition(const Value: TSizeGripPostion);
begin
  if FPosition = Value then Exit;
  FPosition := Value;
  RecreateWnd;
  HandleNeeded;
end;

procedure TSizeGripEh.SetTriangleWindow(const Value: Boolean);
begin
  if FTriangleWindow = Value then Exit;
  FTriangleWindow := Value;
  UpdateWindowRegion;
{  if HandleAllocated then
  begin
    RecreateWnd;
    HandleNeeded;
  end;}
end;

procedure TSizeGripEh.UpdatePosition;
begin
  FInternalMove := True;
  case Position of
    sgpBottomRight: MoveWindow(Handle, Parent.ClientWidth - Width, Parent.ClientHeight - Height, Width, Height, True);
    sgpBottomLeft: MoveWindow(Handle, 0, Parent.ClientHeight - Height, Width, Height, True);
    sgpTopLeft: MoveWindow(Handle, 0, 0, Width, Height, True);
    sgpTopRight: MoveWindow(Handle, Parent.ClientWidth - Width, 0, Width, Height, True);
  end;
  FInternalMove := False;
end;

procedure TSizeGripEh.WMMove(var Message: TMessage);
begin
  if not FInternalMove then UpdatePosition;
  inherited;
end;

procedure TSizeGripEh.ChangePosition(NewPosition: TSizeGripChangePosition);
begin
  if NewPosition = sgcpToLeft then
  begin
    if Position = sgpTopRight then Position := sgpTopLeft
    else if Position = sgpBottomRight then Position := sgpBottomLeft;
  end else if NewPosition = sgcpToRight then
  begin
    if Position = sgpTopLeft then Position := sgpTopRight
    else if Position = sgpBottomLeft then Position := sgpBottomRight
  end else if NewPosition = sgcpToTop then
  begin
    if Position = sgpBottomRight then Position := sgpTopRight
    else if Position = sgpBottomLeft then Position := sgpTopLeft
  end else if NewPosition = sgcpToBottom then
  begin
    if Position = sgpTopRight then Position := sgpBottomRight
    else if Position = sgpTopLeft then Position := sgpBottomLeft
  end
end;

function TSizeGripEh.GetVisible: Boolean;
begin
  Result := IsWindowVisible(Handle);
end;

procedure TSizeGripEh.SetVisible(const Value: Boolean);
begin
  if Value then
    ShowWindow(Handle, SW_SHOW)
  else
    ShowWindow(Handle, SW_HIDE);
end;

procedure TSizeGripEh.UpdateWindowRegion;
type
  PPoints = ^TPoints;
  TPoints = array[0..0] of TPoint;
const
  PositionArr: array[TSizeGripPostion] of TCursor = (crSizeNWSE, crSizeNESW, crSizeNWSE, crSizeNESW);
var
  Points: array[0..2] of TPoint;
  Region: HRgn;
begin
  if not HandleAllocated then Exit;
  if TriangleWindow then
  begin
    if Position = sgpBottomRight then
    begin
      Points[0] := Point(0, Height);
      Points[1] := Point(Width, Height);
      Points[2] := Point(Width, 0);
    end else if Position = sgpBottomLeft then
    begin
      Points[0] := Point(Width, Height);
      Points[1] := Point(0, Height);
      Points[2] := Point(0, 0);
    end else if Position = sgpTopLeft then
    begin
      Points[0] := Point(Width - 1, 0);
      Points[1] := Point(0, 0);
      Points[2] := Point(0, Height - 1);
    end else if Position = sgpTopRight then
    begin
      Points[0] := Point(Width, Height - 1);
      Points[1] := Point(Width, 0);
      Points[2] := Point(1, 0);
    end;
    Region := CreatePolygonRgn(PPoints(@Points)^, 3, WINDING);
    SetWindowRgn(Handle, Region, True);
    UpdatePosition;
  end else
  begin
    SetWindowRgn(Handle, 0, True);
    UpdatePosition;
  end;
  Cursor := PositionArr[Position];
end;

{ TPopupMonthCalendarEh }

constructor TPopupMonthCalendarEh.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable]; //Really not Replicatable, only for CtrlGrid
  //FOwner := AOwner;
  AutoSize := True;
  Ctl3D := True;
  ParentCtl3D := False;
end;

procedure TPopupMonthCalendarEh.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or WS_POPUP;
    if not Ctl3D then Style := Style or WS_BORDER;
    ExStyle := WS_EX_TOOLWINDOW {or WS_EX_TOPMOST};
    WindowClass.Style := CS_SAVEBITS;
  end;
end;

procedure TPopupMonthCalendarEh.KeyDown(var Key: Word; Shift: TShiftState);
var
  ComboEdit: IComboEditEh;
begin
  inherited KeyDown(Key, Shift);
  if Key in [VK_RETURN, VK_ESCAPE] then
  begin
    if Supports(Owner, IComboEditEh, ComboEdit) then
      ComboEdit.CloseUp(Key = VK_RETURN);
    Key := 0;
  end;
end;

procedure TPopupMonthCalendarEh.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ComboEdit: IComboEditEh;
begin
  inherited MouseDown(Button, Shift, X, Y);
  if not PtInRect(Rect(0, 0, Width, Height), Point(X, Y)) then
    if Supports(Owner, IComboEditEh, ComboEdit) then
      ComboEdit.CloseUp(False);
end;

procedure TPopupMonthCalendarEh.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var MCHInfo: TMCHitTestInfo;
  ComboEdit: IComboEditEh;
begin
  inherited MouseUp(Button, Shift, X, Y);
  if not Supports(Owner, IComboEditEh, ComboEdit) then Exit;
  if not PtInRect(Rect(0, 0, Width, Height), Point(X, Y)) then Exit;
  MCHInfo.cbSize := SizeOf(TMCHitTestInfo);
  MCHInfo.pt.x := X;
  MCHInfo.pt.y := Y;
  MonthCal_HitTest(Handle, MCHInfo);
  if ((MCHInfo.uHit and MCHT_CALENDARDATE) > 0) and (MCHInfo.uHit <> MCHT_CALENDARDAY) and
    (MCHInfo.uHit <> MCHT_TITLEBTNNEXT) and (MCHInfo.uHit <> MCHT_TITLEBTNPREV) then
    ComboEdit.CloseUp(True)
  else if (MCHInfo.uHit and MCHT_NOWHERE > 0) then
    ComboEdit.CloseUp(False)
  else if not ((X >= 0) and (Y >= 0) and (X < Width) and (Y < Height)) then
    ComboEdit.CloseUp(False);
end;

procedure TPopupMonthCalendarEh.CMWantSpecialKey(var Message: TCMWantSpecialKey);
var
  ComboEdit: IComboEditEh;
begin
  if not Supports(Owner, IComboEditEh, ComboEdit) then Exit;
  if (Message.CharCode in [VK_RETURN, VK_ESCAPE]) then
  begin
    ComboEdit.CloseUp(Message.CharCode = VK_RETURN);
    Message.Result := 1;
  end else
    inherited;
end;

procedure TPopupMonthCalendarEh.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  inherited;
  Message.Result := Message.Result or DLGC_WANTARROWS or DLGC_WANTCHARS or DLGC_WANTTAB;
end;

procedure TPopupMonthCalendarEh.WMKillFocus(var Message: TWMKillFocus);
var //ComboEdit: IComboEditEh;
  a: array[0..255] of Char;
begin
  inherited;
  GetWindowText(Message.FocusedWnd, a, 255);
  if (GetParent(Message.FocusedWnd) <> Handle) then
    PostCloseUp(False);
//    if Supports(Owner,IComboEditEh,ComboEdit) then
//      ComboEdit.CloseUp(False);
end;

procedure TPopupMonthCalendarEh.PostCloseUp(Accept: Boolean);
begin
  PostMessage(Handle, CM_CLOSEUPEH, Integer(Accept), 0);
end;

procedure TPopupMonthCalendarEh.CMCloseUpEh(var Message: TMessage);
var
  ComboEdit: IComboEditEh;
begin
  if Supports(Owner, IComboEditEh, ComboEdit) then
    ComboEdit.CloseUp(False);
end;

function TPopupMonthCalendarEh.DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  Result := inherited DoMouseWheelDown(Shift, MousePos);
  if not Result then
  begin
    Date := Date + 1;
    Result := True;
  end;
end;

function TPopupMonthCalendarEh.DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  Result := inherited DoMouseWheelDown(Shift, MousePos);
  if not Result then
  begin
    Date := Date - 1;
    Result := True;
  end;
end;

procedure TPopupMonthCalendarEh.WMNCCalcSize(var Message: TWMNCCalcSize);
begin
  inherited;
  with Message.CalcSize_Params^ do
    InflateRect(rgrc[0], -FBorderWidth, -FBorderWidth);
end;

procedure TPopupMonthCalendarEh.UpdateBorderWidth;
begin
  if Ctl3D
    then FBorderWidth := 2
    else FBorderWidth := 0;
end;

procedure TPopupMonthCalendarEh.DrawBorder;
var
  DC: HDC;
  R: TRect;
begin
  if Ctl3D = True then
  begin
    DC := GetWindowDC(Handle);
    try
      GetWindowRect(Handle, R);
      OffsetRect(R, -R.Left, -R.Top);
      DrawEdge(DC, R, BDR_RAISEDOUTER, BF_RECT);
      InflateRect(R, -1, -1);
      DrawEdge(DC, R, BDR_RAISEDINNER, BF_RECT);
    finally
      ReleaseDC(Handle, DC);
    end;
  end;
end;

procedure TPopupMonthCalendarEh.WMNCPaint(var Message: TMessage);
begin
  inherited;
  DrawBorder;
end;

procedure TPopupMonthCalendarEh.CMCtl3DChanged(var Message: TMessage);
begin
  inherited;
  UpdateBorderWidth;
  RecreateWnd;
end;

procedure TPopupMonthCalendarEh.CreateWnd;
var
  R: TRect;
begin
  inherited CreateWnd;
  MonthCal_GetMinReqRect(Handle, R);
  Width := R.Right - R.Left + FBorderWidth * 2;
  Height := R.Bottom - R.Top + FBorderWidth * 2;
end;

function TPopupMonthCalendarEh.CanAutoSize(var NewWidth, NewHeight: Integer): Boolean;
begin
  Result := inherited CanAutoSize(NewWidth, NewHeight);
  if Result then
  begin
    Inc(NewWidth, FBorderWidth * 2);
    Inc(NewHeight, FBorderWidth * 2);
  end;
end;

{ TMRUListEh }

constructor TMRUListEh.Create(AOwner: TPersistent);
begin
  inherited Create;
  FOwner := AOwner;
  FItems := TStringList.Create;
  FLimit := 100;
  FRows := 7;
end;

destructor TMRUListEh.Destroy;
begin
  FItems.Free;
  inherited Destroy;
end;

procedure TMRUListEh.DropDown;
begin
  if Assigned(OnSetDropDown) then
    OnSetDropDown(Self);
end;

procedure TMRUListEh.CloseUp(Accept: Boolean);
begin
  if Assigned(OnSetCloseUp) then
    OnSetCloseUp(Self, Accept);
end;

procedure TMRUListEh.SetActive(const Value: Boolean);
begin
  if FActive <> Value then
  begin
    FActive := Value;
    if Assigned(FOnActiveChanged) then
      OnActiveChanged(Self);
  end;
end;

procedure TMRUListEh.SetItems(const Value: TStrings);
begin
  FItems.Assign(Value);
end;

procedure TMRUListEh.SetLimit(const Value: Integer);
begin
  if FLimit <> Value then
  begin
    FLimit := Value;
    UpdateLimit;
  end;
end;

procedure TMRUListEh.UpdateLimit;
begin
  while Items.Count > FLimit do
    Items.Delete(0);
end;

procedure TMRUListEh.SetRows(const Value: Integer);
begin
  FRows := Value;
end;

procedure TMRUListEh.Assign(Source: TPersistent);
begin
  if Source is TMRUListEh then
  begin
    Active := TMRUListEh(Source).Active;
    Items := TMRUListEh(Source).Items;
    Limit := TMRUListEh(Source).Limit;
    Rows := TMRUListEh(Source).Rows;
    CaseSensitive := TMRUListEh(Source).CaseSensitive;
  end else
    inherited Assign(Source);
end;

procedure TMRUListEh.Add(s: String);
var
  i: Integer;
begin
  if Trim(s) = '' then Exit;
  for i := 0 to Items.Count-1 do
    if (CaseSensitive and (s = Items[i])) or
       (not CaseSensitive and (AnsiCompareText(s, Items[i]) = 0)) then
    begin
      Items.Move(i, Items.Count-1);
      Exit;
    end;
  Items.Add(s);
  UpdateLimit;
end;

{ TPopupListboxEh }

constructor TPopupListboxEh.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  ControlStyle := ControlStyle + [csReplicatable]; //Really not Replicatable, only for CtrlGrid
  Style := lbOwnerDrawFixed;
  FSizeGrip := TSizeGripEh.Create(Self);
  TabStop := False;
  with FSizeGrip do
  begin
    Parent := Self;
    TriangleWindow := True;
  end;
  FMousePos := Point(-1,-1);
end;

procedure TPopupListboxEh.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or WS_CLIPCHILDREN;
    if not Ctl3D then
      Style := Style or WS_BORDER;
    ExStyle := WS_EX_TOOLWINDOW or WS_EX_TOPMOST;
    WindowClass.Style := CS_SAVEBITS;
//    Params.WndParent := GetDesktopWindow;
  end;
end;

procedure TPopupListboxEh.CreateWnd;
begin
  inherited CreateWnd;
  Windows.SetParent(Handle, 0);
  CallWindowProc(DefWndProc, Handle, wm_SetFocus, 0, 0);
end;

procedure TPopupListboxEh.DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState);
var X: Integer;
  ImRect: TRect;
begin
  if ImageList = nil then
    inherited DrawItem(Index, Rect, State)
  else
  begin
    if UseRightToLeftAlignment
      then ImRect := Classes.Rect(Rect.Right, Rect.Top, Rect.Right - ImageList.Width - 4, Rect.Bottom)
      else ImRect := Classes.Rect(0, Rect.Top, ImageList.Width + 4, Rect.Bottom);
    DrawImage(Canvas.Handle, ImRect, ImageList, Index, odSelected in State);
    if UseRightToLeftAlignment
      then Dec(Rect.Right, ImageList.Width + 4)
      else Inc(Rect.Left, ImageList.Width + 4);
//    Canvas.FillRect(Rect);
    if UseRightToLeftAlignment
      then X := Rect.Right - Canvas.TextWidth(Items[Index]) - 2
      else X := ImageList.Width + 5;
    if Index < Items.Count then
      ExtTextOut(Canvas.Handle, X, Rect.Top, ETO_OPAQUE or ETO_CLIPPED,
        @Rect, PChar(Items[Index]), Length(Items[Index]), nil);
//      DrawText(Canvas.Handle, PChar(Items[Index]), Length(Items[Index]), Rect,
//        DT_SINGLELINE or DT_VCENTER or DT_NOPREFIX);
  end;
end;

function TPopupListboxEh.CheckNewSize(var NewWidth, NewHeight: Integer): Boolean;
begin
  Result := True;
  if NewWidth < GetSystemMetrics(SM_CXVSCROLL) then
    NewWidth := GetSystemMetrics(SM_CXVSCROLL);
  if NewHeight < GetSystemMetrics(SM_CYVSCROLL) then
    NewHeight := GetSystemMetrics(SM_CYVSCROLL);
end;

function TPopupListboxEh.GetBorderSize: Integer;
var
  Params: TCreateParams;
  R: TRect;
begin
  CreateParams(Params);
  SetRect(R, 0, 0, 0, 0);
  AdjustWindowRectEx(R, Params.Style, False, Params.ExStyle);
  Result := R.Bottom - R.Top + FBorderWidth*2;
end;

function TPopupListboxEh.GetTextHeight: Integer;
var
  DC: HDC;
  SaveFont: HFont;
  Metrics: TTextMetric;
begin
  DC := GetDC(0);
  SaveFont := SelectObject(DC, Font.Handle);
  GetTextMetrics(DC, Metrics);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
  Result := Metrics.tmHeight;
end;

procedure TPopupListboxEh.KeyPress(var Key: Char);
var
  TickCount: Integer;
begin
  case Key of
    #8, #27: FSearchText := '';
    #32..#255:
      begin
        TickCount := GetTickCount;
        if TickCount - FSearchTickCount > 2000 then FSearchText := '';
        FSearchTickCount := TickCount;
        if Length(FSearchText) < 32 then FSearchText := FSearchText + Key;
        SendMessage(Handle, LB_SelectString, WORD(-1), Longint(PChar(FSearchText)));
        Key := #0;
      end;
  end;
  inherited Keypress(Key);
end;

procedure TPopupListboxEh.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  Index: Integer;
begin
  inherited MouseMove(Shift, X, Y);
  if ((FMousePos.X <> X) or (FMousePos.Y <> Y)) and ([ssLeft, ssRight, ssMiddle] * Shift = []) then
  begin
    Index := ItemAtPos(Point(X, Y), True);
    if Index >= 0 then ItemIndex := Index;
  end;
  FMousePos := Point(X, Y);
end;

procedure TPopupListboxEh.CMSetSizeGripChangePosition(var Message: TMessage);
begin
  FSizeGrip.ChangePosition(TSizeGripChangePosition(Message.WParam));
end;

procedure TPopupListboxEh.CMCtl3DChanged(var Message: TMessage);
begin
  inherited;
  UpdateBorderWidth;
  RecreateWnd;
end;

procedure TPopupListboxEh.CNDrawItem(var Message: TWMDrawItem);
var
  State: TOwnerDrawState;
begin
  if ImageList = nil then
    inherited
  else
    with Message.DrawItemStruct^ do
    begin
{$IFDEF EH_LIB_5}
      State := TOwnerDrawState(LongRec(itemState).Lo);
{$ELSE}
      State := TOwnerDrawState(WordRec(LongRec(itemState).Lo).Lo);
{$ENDIF}
      Canvas.Handle := hDC;
      Canvas.Font := Font;
      Canvas.Brush := Brush;
      if (Integer(itemID) >= 0) and (odSelected in State) then
      begin
        Canvas.Brush.Color := clHighlight;
        Canvas.Font.Color := clHighlightText
      end;
      if Integer(itemID) >= 0
        then DrawItem(itemID, rcItem, State)
        else Canvas.FillRect(rcItem);
      if UseRightToLeftAlignment
        then Dec(rcItem.Right, ImageList.Width + 4)
        else Inc(rcItem.Left, ImageList.Width + 4);
      if odFocused in State
        then DrawFocusRect(hDC, rcItem);
      Canvas.Handle := 0;
    end;
end;

procedure TPopupListboxEh.SetImageList(const Value: TCustomImageList);
begin
  FImageList := Value;
end;

procedure TPopupListboxEh.SetRowCount(Value: Integer);
begin
  if Value < 1 then Value := 1;
  Height := Value * ItemHeight + GetBorderSize;
end;

procedure TPopupListboxEh.WMSize(var Message: TWMSize);
begin
  inherited;
  FSizeGrip.UpdatePosition;
  FSizeGripResized := True;
end;

procedure TPopupListboxEh.WMNCCalcSize(var Message: TWMNCCalcSize);
begin
  inherited;
  with Message.CalcSize_Params^ do
    InflateRect(rgrc[0], -FBorderWidth, -FBorderWidth);
end;

procedure TPopupListboxEh.WMNCPaint(var Message: TMessage);
begin
  inherited;
  DrawBorder;
end;

procedure TPopupListboxEh.DrawBorder;
var
  DC: HDC;
  R: TRect;
begin
  if Ctl3D = True then
  begin
    DC := GetWindowDC(Handle);
    try
      GetWindowRect(Handle, R);
      OffsetRect(R, -R.Left, -R.Top);
      DrawEdge(DC, R, BDR_RAISEDOUTER, BF_RECT);
      InflateRect(R, -1, -1);
      DrawEdge(DC, R, BDR_RAISEDINNER, BF_RECT);
    finally
      ReleaseDC(Handle, DC);
    end;
  end;
end;

procedure TPopupListboxEh.WMWindowPosChanging(var Message: TWMWindowPosChanging);
begin
  if ComponentState * [csReading, csDestroying] = [] then
    with Message.WindowPos^ do
      if (flags and SWP_NOSIZE = 0) and not CheckNewSize(cx, cy) then
        flags := flags or SWP_NOSIZE;
  inherited;
end;

procedure TPopupListboxEh.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
  BorderSize, TextHeight, Rows: Integer;
begin
  BorderSize := GetBorderSize;
  TextHeight := ItemHeight;
  if TextHeight = 0 then TextHeight := GetTextHeight;
  Rows := (AHeight - BorderSize) div TextHeight;
  if Rows < 1 then Rows := 1;
  FRowCount := Rows;
  inherited SetBounds(ALeft, ATop, AWidth, Rows * TextHeight + BorderSize);
end;

function TPopupListboxEh.DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  Result := inherited DoMouseWheelDown(Shift, MousePos);
  if not Result then
  begin
    TopIndex := TopIndex + 1;
    Result := True;
  end;
end;

function TPopupListboxEh.DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
  Result := inherited DoMouseWheelDown(Shift, MousePos);
  if not Result then
  begin
    TopIndex := TopIndex - 1;
    Result := True;
  end;
end;

procedure TPopupListboxEh.UpdateBorderWidth;
begin
  if Ctl3D
    then FBorderWidth := 2
    else FBorderWidth := 0;
end;

function TPopupListboxEh.CanFocus: Boolean;
begin
  Result := False;
end;

type
  TScrollBarCracker = class(TScrollBar) end;

{ TMRUListboxEh }

constructor TMRUListboxEh.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  FScrollBar := TScrollBar.Create(Self);
  with TScrollBarCracker(FScrollBar) do
  begin
    ControlStyle := ControlStyle + [csReplicatable];
    Kind := sbVertical;
    Parent := Self;
    Width := GetSystemMetrics(SM_CXVSCROLL);
    WindowProc := ScrollBarWindowProc;
    TabStop := False;
  end;
end;

procedure TMRUListboxEh.CMSetSizeGripChangePosition(var Message: TMessage);
begin
  inherited;
  UpdateScrollBar;
end;

procedure TMRUListboxEh.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style and not (WS_HSCROLL or WS_VSCROLL);
end;

procedure TMRUListboxEh.ScrollBarScrolled(Sender: TObject; ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
end;

procedure TMRUListboxEh.ScrollBarWindowProc(var Message: TMessage);
begin
  if Message.Msg = CN_VSCROLL then
  begin
    Perform(WM_VSCROLL, Message.WParam, 0);
//    UpdateScrollBar;
  end
  else if (Message.Msg = WM_MOVE) and not FScrollBarLockMove then
  begin
    UpdateScrollBarPos;
    UpdateScrollBar;
    Message.Result := 0;
    Exit;
  end;
  TWinControlCracker(FScrollBar).WndProc(Message);
end;

procedure TMRUListboxEh.UpdateScrollBar;
var
  Max, VisibleRowCount: Integer;
begin
  if not HandleAllocated then Exit;
  FScrollBar.Ctl3D := False;
//  FScrollBar.SetBounds(FSizeGrip.Left, FSizeGrip.Top, FSizeGrip.Width, FSizeGrip.Height);
  FScrollBarLockMove := True;
  try
    if SizeGrip.Position = sgpBottomRight then
      FScrollBar.SetBounds(ClientWidth-FScrollBar.Width, 0, FScrollBar.Width, ClientHeight-FSizeGrip.Height)
    else if SizeGrip.Position = sgpTopRight then
      FScrollBar.SetBounds(ClientWidth-FScrollBar.Width, FSizeGrip.Height, FScrollBar.Width, ClientHeight-FSizeGrip.Height)
    else
      FScrollBar.SetBounds(ClientWidth-FScrollBar.Width, 0, FScrollBar.Width, ClientHeight);
  finally
    FScrollBarLockMove := False;
  end;
  FScrollBar.PageSize := 0;
  VisibleRowCount := ClientHeight div ItemHeight;
  Max := Items.Count;
  if (Max > 0) and (VisibleRowCount < Max) then
  begin
    FScrollBar.SetParams(TopIndex, 0, Items.Count-1);
    FScrollBar.PageSize := VisibleRowCount;
    FScrollBar.Visible := True;
    if SizeGrip.Position in [sgpBottomRight, sgpTopRight]
      then SizeGrip.TriangleWindow := False
      else SizeGrip.TriangleWindow := True;
  end else
  begin
    FScrollBar.Visible := False;
    SizeGrip.TriangleWindow := True;
  end;
end;

procedure TMRUListboxEh.WMSize(var Message: TWMSize);
begin
  inherited;
  UpdateScrollBar;
end;

procedure TMRUListboxEh.UpdateScrollBarPos;
begin
  FScrollBarLockMove := True;
  try
    if SizeGrip.Position = sgpBottomRight then
      MoveWindow(FScrollBar.Handle, ClientWidth-FScrollBar.Width, 0, FScrollBar.Width, ClientHeight-FSizeGrip.Height, True)
    else if SizeGrip.Position = sgpTopRight then
      MoveWindow(FScrollBar.Handle, ClientWidth-FScrollBar.Width, FSizeGrip.Height, FScrollBar.Width, ClientHeight-FSizeGrip.Height, True)
    else
      MoveWindow(FScrollBar.Handle, ClientWidth-FScrollBar.Width, 0, FScrollBar.Width, ClientHeight, True);
  finally
    FScrollBarLockMove := False;
  end;
end;

procedure TMRUListboxEh.CMMouseWheel(var Message: TCMMouseWheel);
begin
  inherited;
  UpdateScrollBarPos;
  UpdateScrollBar;
end;

procedure TMRUListboxEh.CMChanged(var Message: TMessage);
begin
  inherited;
  UpdateScrollBarPos;
  UpdateScrollBar;
end;

initialization
  FlatButtonWidth := GetDefaultFlatButtonWidth;
  ButtonsBitmapCache := TButtonsBitmapCache.Create;
  GetCheckSize;
finalization
  ButtonsBitmapCache.Free;
end.
