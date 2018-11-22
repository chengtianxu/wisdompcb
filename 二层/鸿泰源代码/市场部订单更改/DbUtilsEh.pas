{*******************************************************}
{                                                       }
{                       EhLib v3.0                      }
{    Utilities to sort data in DataSet from DBGrid      }
{                                                       }
{      Copyright (c) 2002,2003 by Dmitry V. Bolshakov   }
{                                                       }
{*******************************************************}

{$I EhLib.Inc}

{$IFDEF EH_LIB_VCL}
unit DbUtilsEh;
{$ELSE}
unit QDbUtilsEh;
{$ENDIF}

interface

{$IFDEF EH_LIB_VCL}
uses
{$IFDEF EH_LIB_6} Variants, {$ENDIF}
DBGridEh, Db, SysUtils, Classes, TypInfo;
{$ELSE}
uses
  Variants, QDBGridEh, Db, SysUtils, Classes, TypInfo;
{$ENDIF}


type
  TDataSetClass = class of TDataSet;

  TDatasetFeaturesEh = class
    FDataSetClass: TDataSetClass;
  public
    constructor Create; virtual;
    procedure ApplySorting(Sender: TObject; DataSet: TDataSet; IsReopen: Boolean); virtual;
  end;

  TSQLDatasetFeaturesEh = class(TDatasetFeaturesEh)
  private
    FSortUsingFieldName: Boolean;
  public
    property SortUsingFieldName: Boolean read FSortUsingFieldName write FSortUsingFieldName;
    procedure ApplySorting(Sender: TObject; DataSet: TDataSet; IsReopen: Boolean); override;
  end;

  TDatasetFeaturesEhClass = class of TDatasetFeaturesEh;

procedure RegisterDatasetFeaturesEh(DatasetFeaturesClass: TDatasetFeaturesEhClass;
  DataSetClass: TDataSetClass);
procedure UnregisterDatasetFeaturesEh(DataSetClass: TDataSetClass);
function GetDatasetFeaturesForDataSet(DataSet: TDataSet): TDatasetFeaturesEh;
function GetDatasetFeaturesForDataSetClass(DataSetClass: TClass): TDatasetFeaturesEh;


function IsSQLBasedDataSet(DataSet: TDataSet; var SQL: TStrings): Boolean;

procedure ApplySortingForSQLBasedDataSet(Grid: TCustomDBGridEh; DataSet: TDataSet;
  UseFieldName: Boolean; IsReopen: Boolean);

implementation

function IsSQLBasedDataSet(DataSet: TDataSet; var SQL: TStrings): Boolean;
var
  FPropInfo: PPropInfo;
begin
  Result := False;
  SQL := nil;
  FPropInfo := GetPropInfo(DataSet.ClassInfo, 'SQL');
  if FPropInfo^.PropType^.Kind = tkClass then
  try
    SQL := (TObject(GetOrdProp(DataSet, FPropInfo)) as TStrings);
  except // if PropInfo is not TStrings or not inherited of
  end;

  if SQL <> nil then
    Result := True;
end;

procedure ApplySortingForSQLBasedDataSet(Grid: TCustomDBGridEh; DataSet: TDataSet;
   UseFieldName: Boolean; IsReopen: Boolean);

  function DeleteStr(str: String; sunstr: String): String;
  var
    i: Integer;
  begin
    i := Pos(sunstr, str);
    if i <> 0 then
      Delete(str, i, Length(sunstr));
    Result := str;
  end;

var
  i, OrderLine: Integer;
  s: String;
  SQL: TStrings;
begin
  if not IsSQLBasedDataSet(DataSet, SQL) then
    raise Exception.Create(DataSet.ClassName + ' is not SQL based dataset');

  s := '';
  for i := 0 to Grid.SortMarkedColumns.Count - 1 do
  begin
    if UseFieldName
      then s := s + Grid.SortMarkedColumns[i].FieldName
      else s := s + IntToStr(Grid.SortMarkedColumns[i].Field.FieldNo);
    if Grid.SortMarkedColumns[i].Title.SortMarker = smUpEh
      then s := s + ' DESC, '
      else s := s + ', ';
  end;

  if s <> '' then
    s := 'ORDER BY ' + Copy(s, 1, Length(s) - 2);

  OrderLine := -1;
  for i := 0 to SQL.Count - 1 do
    if UpperCase(Copy(SQL[i], 1, Length('ORDER BY'))) = 'ORDER BY' then
    begin
      OrderLine := i;
      Break;
    end;
  if OrderLine = -1 then
  begin
    SQL.Add('');
    OrderLine := SQL.Count-1;
  end;

  SQL.Strings[OrderLine] := s;

  if IsReopen then
  begin
    DataSet.Close;
    DataSet.Open;
  end;
end;

var
  DatasetFeaturesList: TStringList;

procedure RegisterDatasetFeaturesEh(DatasetFeaturesClass: TDatasetFeaturesEhClass;
  DataSetClass: TDataSetClass);
var
  DatasetFeatures: TDatasetFeaturesEh;
  ClassIndex: Integer;
begin
  DatasetFeatures := DatasetFeaturesClass.Create;
  DatasetFeatures.FDataSetClass := DataSetClass;
  if DatasetFeatures.FDataSetClass = nil then
    Exit;
  ClassIndex := DatasetFeaturesList.IndexOf(DatasetFeatures.FDataSetClass.ClassName);
  if ClassIndex >= 0
    then DatasetFeaturesList.Objects[ClassIndex] := DatasetFeatures
    else DatasetFeaturesList.AddObject(DatasetFeatures.FDataSetClass.ClassName,
            DatasetFeatures);
end;

procedure UnregisterDatasetFeaturesEh(DataSetClass: TDataSetClass);
var
  idx: Integer;
begin
  idx := DatasetFeaturesList.IndexOf(DataSetClass.ClassName);
  if idx >= 0 then
  begin
    Dispose(Pointer(DatasetFeaturesList.Objects[idx]));
    DatasetFeaturesList.Delete(idx);
  end;
end;

function GetDatasetFeaturesForDataSetClass(DataSetClass: TClass): TDatasetFeaturesEh;

  function GetDatasetFeaturesDeep(DataSetClass: TClass; DataSetClassName: String): Integer;
  begin
    Result := 0;
    while True do
    begin
      if UpperCase(DataSetClass.ClassName) = UpperCase(DataSetClassName) then
        Exit;
      Inc(Result);
      DataSetClass := DataSetClass.ClassParent;
      if DataSetClass = nil then
      begin
        Result := MAXINT;
        Exit;
      end;
    end;
  end;

var
  Deep, MeenDeep, i: Integer;
  ClassName: String;
begin
  Result := nil;
  MeenDeep := MAXINT;
  for i := 0 to DatasetFeaturesList.Count - 1 do
  begin
    if DataSetClass.InheritsFrom(TDatasetFeaturesEh(DatasetFeaturesList.Objects[i]).FDataSetClass) then
    begin
      ClassName := TDatasetFeaturesEh(DatasetFeaturesList.Objects[i]).FDataSetClass.ClassName;
      Deep := GetDatasetFeaturesDeep(DataSetClass, ClassName);
      if Deep < MeenDeep then
      begin
        MeenDeep := Deep;
        Result := TDatasetFeaturesEh(DatasetFeaturesList.Objects[i]);
      end;
    end;
  end;
end;

function GetDatasetFeaturesForDataSet(DataSet: TDataSet): TDatasetFeaturesEh;
begin
  Result := GetDatasetFeaturesForDataSetClass(DataSet.ClassType);
end;

procedure DisposeDatasetFeaturesList;
begin
  while DatasetFeaturesList.Count > 0 do
  begin
    Dispose(Pointer(DatasetFeaturesList.Objects[0]));
    DatasetFeaturesList.Delete(0);
  end;
  DatasetFeaturesList.Free;
  DatasetFeaturesList := nil;
end;

{ TDatasetFeaturesEh }

procedure TDatasetFeaturesEh.ApplySorting(Sender: TObject; DataSet: TDataSet; IsReopen: Boolean);
begin
end;

constructor TDatasetFeaturesEh.Create;
begin
  inherited Create;
end;

{ TSQLDatasetFeaturesEh }

procedure TSQLDatasetFeaturesEh.ApplySorting(Sender: TObject; DataSet: TDataSet; IsReopen: Boolean);
begin
  if Sender is TCustomDBGridEh then
    ApplySortingForSQLBasedDataSet(TCustomDBGridEh(Sender), DataSet, SortUsingFieldName, IsReopen);
end;

initialization
  DatasetFeaturesList := TStringList.Create;
  //  DatasetFeaturesList.CaseSensitive := False;
  DatasetFeaturesList.Duplicates := dupError;
finalization
  DisposeDatasetFeaturesList;
end.
