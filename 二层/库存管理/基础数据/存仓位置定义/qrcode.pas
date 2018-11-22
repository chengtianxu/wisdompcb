unit qrcode;

interface
uses classes,types,graphics;
//¶þÎ¬ÂëÊµÏÖ
type
  TQRCodeImageFormat=(qifBitmap,qifJepg);
  QRecLevel=(QR_ECLEVEL_L,QR_ECLEVEL_M,QR_ECLEVEL_Q,QR_ECLEVEL_H);
  TQRecLevel=QRecLevel;
  QRencodeMode=(QR_MODE_NUM = 0,QR_MODE_AN,QR_MODE_8,QR_MODE_KANJI,QR_MODE_STRUCTURE);
  TQREncodeMode=QRencodeMode;
  PQRCode=^TQRCode;
  TQRCode=record
    Version:Integer;
    Width:Integer;
    Data:PByte;
  end;
  TQRCodeGraphic=class(TBitmap)
  private
    function GetQRCode: PQRCode;
    procedure SetEightBit(const Value: Boolean);
  protected
    FBlockSize,FMargin:Integer;
    FVersion:Integer;
    FLevel:TQRecLevel;
    FEncodeMode:TQREncodeMode;
    FCaseSensitive:Boolean;
    FEightBit:Boolean;
    FText: AnsiString;
    FCode: PQRCode;
    FRedrawNeeded:Boolean;
    FDrawing:Boolean;
    procedure SetBlockSize(const Value: Integer);
    procedure SetCaseSensitive(const Value: Boolean);
    procedure SetECLevel(const Value: TQREcLevel);
    procedure SetEncodeMode(const Value: TQREncodeMode);
    procedure SetMargin(const Value: Integer);
    procedure SetText(const Value: AnsiString);
    procedure SetVersion(const Value: Integer);
    procedure Redraw;
    procedure Draw(ACanvas: TCanvas; const Rect: TRect); override;
    procedure Changed(Sender:TObject);override;
    function GetEmpty: Boolean; override;
    function GetHeight: Integer; override;
    function GetWidth: Integer; override;
    property QRCode:PQRCode read GetQRCode;
  public
    constructor Create;override;
    destructor Destroy;override;
    procedure Assign(Source: TPersistent); override;
    procedure AssignTo(Dest: TPersistent); override;
    procedure SaveToStream(Stream: TStream); override;
    property BlockSize:Integer read FBlockSize write SetBlockSize default 3;
    property Margin:Integer read FMargin write SetMargin default 4;
    property Version:Integer read FVersion write SetVersion default 0;
    property Level:TQREcLevel read FLevel write SetECLevel default QR_ECLEVEL_L;
    property EncodeMode:TQREncodeMode read FEncodeMode write SetEncodeMode default QR_MODE_8;
    property CaseSensitive:Boolean read FCaseSensitive write SetCaseSensitive;
    property EightBit:Boolean read FEightBit write SetEightBit;
    property Text:AnsiString read FText write SetText;
  end;
  function QRCodeToGraphic(const S:AnsiString;AFormat:TQRCodeImageFormat;ASize:Integer=3;AMargin:Integer=4;Version:Integer=0;Level:TQRecLevel=QR_ECLEVEL_L;AMode:TQREncodeMode=QR_MODE_8;CaseSensitive:Boolean=True;EightBit:Boolean=False):TGraphic;

implementation
uses windows,jpeg,sysutils;
type
  size_t=Cardinal;
var
  ___errno:Integer;
const
  MSVCRT='MSVCRT.DLL';

{$L qrcodelib.obj}
function _memcpy(dest, src: Pointer; count: Cardinal): Pointer; cdecl; external MSVCRT name 'memcpy';
function _memset(dest: Pointer; val: Integer; count: Cardinal): Pointer; cdecl; external MSVCRT name 'memset';
function _memmove(dest, src: Pointer; count: Cardinal): Pointer; cdecl; external MSVCRT name 'memmove';
function _strlen(s: PAnsiChar): size_t; cdecl; external MSVCRT name 'strlen';
function _malloc(size:Cardinal):Pointer;cdecl; external MSVCRT name 'malloc';
function _calloc(size:Cardinal):Pointer;cdecl; external MSVCRT name 'calloc';
procedure _free(p:Pointer);cdecl;external MSVCRT name 'free';
function _strdup(s:PAnsiChar):PAnsiChar;cdecl;external 'shlwapi.dll' name 'StrDupA';
procedure _sprintf(s,fmt:PAnsiChar);cdecl;varargs;external MSVCRT name 'sprintf';
procedure _OutputDebugString(s:PAnsiChar);cdecl;external 'kernel32.dll' name 'OutputDebugStringA';
function _QREncode(const intext:PAnsiChar;version,eclevel,encodemode,casesensitive,eightbit:Integer):PQRCode;cdecl;external;
{$EXTERNALSYM _QREncode}
procedure _QRcode_free(qrcode:PQRCode);cdecl;external;
{$EXTERNALSYM _QRcode_free}

function QRCodeToGraphic(const S:AnsiString;AFormat:TQRCodeImageFormat;ASize:Integer=3;AMargin:Integer=4;Version:Integer=0;Level:TQRecLevel=QR_ECLEVEL_L;AMode:TQREncodeMode=QR_MODE_8;CaseSensitive:Boolean=True;EightBit:Boolean=False):TGraphic;
var
  ABitmap:TQRCodeGraphic;
  ACode:PQRCode;
begin
ABitmap:=TQRCodeGraphic.Create;
ABitmap.Version:=Version;
ABitmap.Level:=Level;
ABitmap.EncodeMode:=AMode;
ABitmap.CaseSensitive:=CaseSensitive;
ABitmap.EightBit:=EightBit;
if AFormat=qifBitmap then
  Result:=ABitmap
else
  begin
  Result:=TJpegImage.Create;
  Result.Assign(ABitmap);
  ABitmap.Free;
  end;
end;
 
{ TQRCodeGraphic }

constructor TQRCodeGraphic.Create;
begin
inherited;
FBlockSize:=3;
FMargin:=4;
FVersion:=0;
FLevel:=QR_ECLEVEL_L;
FEncodeMode:=QR_MODE_8;
FCaseSensitive:=True;
PixelFormat:=pf1bit;
end;


procedure TQRCodeGraphic.Assign(Source: TPersistent);
var
  src:TQRCodeGraphic;
begin
if Source is TQRCodeGraphic then
  begin
  src:=Source as TQRCodeGraphic;
  FText:=src.FText;
  FBlockSize:=src.FBlockSize;
  FMargin:=src.FMargin;
  FVersion:=src.FVersion;
  FLevel:=src.FLevel;
  FEncodeMode:=src.FEncodeMode;
  FCaseSensitive:=src.FCaseSensitive;
  FRedrawNeeded:=src.FRedrawNeeded;
  Redraw;
  end
else
  inherited;
end;

procedure TQRCodeGraphic.AssignTo(Dest: TPersistent);
begin
if FRedrawNeeded then
  Redraw;
  inherited;

end;

procedure TQRCodeGraphic.Changed(Sender:TObject);
begin
if not FDrawing then
  begin
  FRedrawNeeded:=True;
  if Assigned(FCode) then
    begin
    _QRcode_free(FCode);
    FCode:=nil;
    end;
  end;
inherited;
end;

destructor TQRCodeGraphic.Destroy;
begin
if Assigned(FCode) then
  _QRcode_free(FCode);
inherited;
end;

procedure TQRCodeGraphic.Draw(ACanvas: TCanvas; const Rect: TRect);
begin
if FRedrawNeeded then
  Redraw;
inherited;
end;

function TQRCodeGraphic.GetEmpty: Boolean;
begin
Result:=(Length(FText)=0);
end;

function TQRCodeGraphic.GetHeight: Integer;
begin
Result:=(QRCode.Width+(Margin shl 1)) * FBlockSize;
end;

function TQRCodeGraphic.GetQRCode: PQRCode;
begin
if not Assigned(FCode) then
  begin
  FCode:=_QREncode(PAnsiChar(FText),FVersion,Integer(FLevel),Integer(FEncodeMode),Integer(FCaseSensitive),Integer(FEightBit));
  end;
Result:=FCode;
end;

function TQRCodeGraphic.GetWidth: Integer;
begin
Result:=GetHeight;
end;

procedure TQRCodeGraphic.Redraw;
var
  W,bit,x,xx,y,yy,rowno:Integer;
  p,row,prow:PByte;
begin
FDrawing:=True;
try
  FRedrawNeeded:=False;
  PixelFormat:=pf1bit;
  W := (QRCode.Width + Margin * 2) * FBlockSize;
  self.Width := w;
  self.Height :=  w;
  //SetSize(W,W);
  p:=QRCode.Data;
  Canvas.Brush.Color:=clWhite;
  Canvas.FillRect(Rect(0,0,W,W));
  for y := 0 to QRCode.Width - 1 do
    begin
    rowno:=(FMargin+y)*FBlockSize;
    row:=ScanLine[rowno];
    prow:=row;
    Inc(row,FMargin * FBlockSize div 8);
    bit := 7 - (FMargin * FBlockSize mod 8);
    for x := 0 to QRCode.Width - 1 do
      begin
      for xx := 0 to FBlockSize - 1 do
        begin
        row^:=row^ xor ((p^ and 1) shl bit);
        Dec(bit);
        if bit < 0 then
          begin
          Inc(row);
          bit := 7;
          end
        end;
      Inc(p);
      end;
    for yy := 0 to FBlockSize - 1 do
      begin
      row:=ScanLine[rowno+yy];
      _memmove(row,prow,W div 8);
      end;
    end;
finally
  FDrawing:=False;
end;
end;

procedure TQRCodeGraphic.SaveToStream(Stream: TStream);
begin
if FRedrawNeeded then
  Redraw;
inherited;

end;

procedure TQRCodeGraphic.SetBlockSize(const Value: Integer);
begin
if FBlockSize<>Value then
  begin
  FBlockSize := Value;
  Changed(Self);
  end;
end;

procedure TQRCodeGraphic.SetCaseSensitive(const Value: Boolean);
begin
if FCaseSensitive<>Value then
  begin
  FCaseSensitive := Value;
  Changed(Self);
  end;
end;

procedure TQRCodeGraphic.SetECLevel(const Value: TQREcLevel);
begin
if Value<>FLevel then
  begin
  FLevel:=Value;
  Changed(Self);
  end;
end;

procedure TQRCodeGraphic.SetEightBit(const Value: Boolean);
begin
if FEightBit<>Value then
  begin
  FEightBit := Value;
  Changed(Self);
  end;
end;

procedure TQRCodeGraphic.SetEncodeMode(const Value: TQREncodeMode);
begin
if FEncodeMode<>Value then
  begin
  FEncodeMode := Value;
  Changed(Self);
  end;
end;

procedure TQRCodeGraphic.SetMargin(const Value: Integer);
begin
if FMargin<>Value then
  begin
  FMargin := Value;
  Changed(Self);
  end;
end;

procedure TQRCodeGraphic.SetText(const Value: AnsiString);
begin
if FText<>Value then
  begin
  FText := Value;
  Changed(Self);
  end;
end;

procedure TQRCodeGraphic.SetVersion(const Value: Integer);
begin
if FVersion<>Value then
  begin
  if Value in [0..40] then
    begin
    FVersion := Value;
    Changed(Self);
    end
  end;
end;

end.
