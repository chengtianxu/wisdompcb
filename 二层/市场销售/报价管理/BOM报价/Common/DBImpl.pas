unit DBImpl;

interface
uses
  DataIntf, SysUtils, Classes, DBClient, DB, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Data.Win.ADODB, Datasnap.Provider;

type
  TTableBase = class(TInterfacedObject, IData)
  protected
    FCds: TClientDataSet;
    FAds: TADODataSet;
    FDsp: TDataSetProvider;
    procedure dspUpdateError(Sender: TObject; DataSet: TCustomClientDataSet;
      E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);virtual;

  public
    FSql: string;
    procedure SetSql(ASql: string);
    function GetSql: string;
    function GetData: OleVariant;virtual;
    function PostData(AData: OleVariant): Boolean;virtual;
    constructor Create();
    destructor Destroy; override;
    function CreateKeyID: string;
    function SqlOpen(ASql: string): OleVariant;
  end;

  TTmp = class(TTableBase, ITmp)
    function SqlOpen(ASql: string): OleVariant;overload;
    function SqlOpen(ASql: string;ACds: TClientDataSet): Boolean;overload;
  end;

  TBP00 = class(TTableBase)
    function GetData: OleVariant;override;
  end;
  TBP01 = class(TTableBase)
    function GetData: OleVariant;override;
  end;
  TBP02 = class(TTableBase)
    function GetData: OleVariant;override;
  end;
  TBP03 = class(TTableBase)
  end;
  TBP04 = class(TTableBase)
  end;
  TBP05 = class(TTableBase)
    function GetData: OleVariant;override;
  end;
  TBP06 = class(TTableBase, IBOMPrice06)
    function GetData: OleVariant;override;
    function CreateBPNO(var seqno: Integer): string;
  end;
  TBP07 = class(TTableBase)
  end;
  TBP08 = class(TTableBase)
    procedure dspUpdateError(Sender: TObject; DataSet: TCustomClientDataSet;
      E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);override;
  end;
  TBP09 = class(TTableBase)
    procedure dspUpdateError(Sender: TObject; DataSet: TCustomClientDataSet;
      E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);override;
  end;
  TBP10 = class(TTableBase)
  end;
  TBP11 = class(TTableBase)
  end;
  TBP12 = class(TTableBase)
  end;
  TBP13 = class(TTableBase)
  end;
  TBP14 = class(TTableBase)
  end;
  TBP15 = class(TTableBase)
  end;
  TBP16 = class(TTableBase)
  end;
  TBPSql = class(TTableBase)
  end;

  function PostdataByInterface(LCds: TClientDataSet; IIntf: IData): Boolean;
  procedure Load_JPG_Pic_From_DB(pField: TField;var AImg: TImage);
implementation

uses
  System.DateUtils, WZ_gUnit, DM, Vcl.Dialogs;


{ TTableBase }

procedure TTableBase.dspUpdateError(Sender: TObject; DataSet: TCustomClientDataSet;
  E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin

end;


procedure Load_JPG_Pic_From_DB(pField: TField;var AImg: TImage);
var
  Jpg: TjpegImage;
begin
  if not pField.IsNull then
  begin
    Jpg := TjpegImage.Create;
    try
      jpg.Assign(TBlobField(pField));
      AImg.Picture.Bitmap.Assign(Jpg);
    finally
      Jpg.Free;
    end;
  end else
  begin
    AImg.Picture := nil;
  end;
end;

function PostdataByInterface(LCds: TClientDataSet; IIntf: IData): Boolean;
begin
  Result := True;
  if LCds.State in [dsEdit,dsInsert] then LCds.Post;
  if LCds.ChangeCount > 0 then
    Result := IIntf.PostData(LCds.Delta);
end;

constructor TTableBase.Create;
begin
  FAds := TADODataSet.Create(nil);
  FAds.Connection := dm1.con1;
  FAds.DisableControls;
  FAds.CommandTimeout := 300;

  FDsp := TDataSetProvider.Create(nil);
  FDsp.DataSet := FAds;
  FDsp.OnUpdateError := dspUpdateError;

  FCds := TClientDataSet.Create(nil);
  FCds.SetProvider(FDsp);
end;

function TTableBase.CreateKeyID: string;
var
  LGuid: TGUID;
begin
  CreateGUID(LGuid);
  Result := GUIDToString(LGuid);
end;

destructor TTableBase.Destroy;
begin
  FCds.Free;
  FAds.Free;
  FDsp.Free;
  inherited;
end;

function TTableBase.GetData: OleVariant;
begin
  FAds.Close;
  FAds.CommandText := FSql;
  FAds.Open;
  FCds.Data := FDsp.Data;
  FAds.Close;
  Result := FCds.Data;
end;

function TTableBase.GetSql: string;
begin
  Result := FSql;
end;

function TTableBase.PostData(AData: OleVariant): Boolean;
begin
  FAds.Close;
  FAds.CommandText := FSql;
  FCds.Data := AData;
  FCds.SetProvider(FDsp);
  Result := FCds.ApplyUpdates(0) = 0;
end;

procedure TTableBase.SetSql(ASql: string);
begin
  FSql := ASql;
end;

function TTableBase.SqlOpen(ASql: string): OleVariant;
begin
  Result := varEmpty;
  try
    FAds.Close;
    FAds.CommandText := ASql;
    FAds.Open;
    FCds.Data := FDsp.Data;
    FAds.Close;
    Result := FCds.Data;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
end;

{ T346 }

function TBP00.GetData: OleVariant;
begin
  inherited GetData;
  Result := FCds.Data;
end;

{ TBP06 }

function TBP06.CreateBPNo(var seqno: Integer): string;
var
  LSvrTime: TDateTime;
  LSql: string;
begin
  LSvrTime := dm1.GetSvrNowTime;
  LSql := ' select max(seqno) as no from bomprice06 where createtime between ' +
           QuotedStr(FormatDateTime('YYYY-MM-DD',LSvrTime) + ' 00:00:00') + ' and ' +
           QuotedStr(FormatDateTime('YYYY-MM-DD',LSvrTime) + ' 23:59:59');
  dm1.qrytmp.Close;
  dm1.qrytmp.SQL.Text := LSql;
  dm1.qrytmp.Open;
  seqno := dm1.qrytmp.FieldByName('no').AsInteger + 1;
  Result := 'BP' + FormatDateTime('YYMMDD',LSvrTime) + Format('%.4d',[seqno]);
end;

function TBP06.GetData: OleVariant;
begin
  inherited GetData;
  Result := FCds.Data;
end;

{ TBP05 }

function TBP05.GetData: OleVariant;
begin
  inherited GetData;
  Result := FCds.Data;
end;

{ TBP02 }

function TBP02.GetData: OleVariant;
begin
  inherited GetData;
  Result := FCds.Data;
end;

{ TBP01 }

function TBP01.GetData: OleVariant;

begin
  inherited GetData;
  Result := FCds.Data;
end;

{ TTmp }

function TTmp.SqlOpen(ASql: string): OleVariant;
begin
  inherited SqlOpen(ASql);
  Result := FCds.Data;
end;

procedure TBP08.dspUpdateError(Sender: TObject; DataSet: TCustomClientDataSet;
  E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  case UpdateKind of
    ukModify: ;
    ukInsert: ;
    ukDelete: Response := rrIgnore;
  end;
end;

procedure TBP09.dspUpdateError(Sender: TObject; DataSet: TCustomClientDataSet;
  E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  case UpdateKind of
    ukModify: ;
    ukInsert: ;
    ukDelete: Response := rrIgnore;
  end;
end;


function TTmp.SqlOpen(ASql: string; ACds: TClientDataSet): Boolean;
begin
  Result := False;
  try
    FAds.Close;
    FAds.CommandText := ASql;
    FAds.Open;
    ACds.Data := FDsp.Data;
    FAds.Close;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
end;


end.
