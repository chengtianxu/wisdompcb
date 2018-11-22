{*******************************************************}
{                                                       }
{       ChengTX                                         }
{                                                       }
{       版权所有 (C) 2016 ChengTX                       }
{                                                       }
{*******************************************************}

unit ukucunguanli;

interface
uses
  uEngIntf,Data.DB, System.Classes, Data.Win.ADODB, Datasnap.Provider, Datasnap.DBClient,
  system.SysUtils, System.Variants, Datasnap.DSIntf, System.ZLib, uBaseEngImpl;

type

  TMod38PostEngImpl = class(TBaseEngImpl,IEngIntf)
  protected
    FModID: Integer;
    FModChildID: Integer;
    FNowTableIndex: Integer;
    FNowParentTable: string;
    FNowSelfToParentPtrField: string;
    FNowparentTableKeyField: string;
    FNowSelfToParentIDKeyField: string;
    procedure DSPBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);override;
  public
    constructor Create(AConStr: string; AModID: Integer; AMOdChildID: Integer = 0);
    function PostDataBySqlArr(ATableArr: OleVariant; ADataArr: OleVariant; out ErrMsg: string): Boolean;override;
  end;

implementation


{ TBaseModPostEngImpl }

constructor TMod38PostEngImpl.Create(AConStr: string; AModID,
  AMOdChildID: Integer);
begin
  FModID := AModID;
  FModChildID := AMOdChildID;
  inherited Create(AConStr);
end;


procedure TMod38PostEngImpl.DSPBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  LQry: TADOQuery;
begin
  case UpdateKind of
    ukModify: ;
    ukInsert:
      if FNowParentTable <> '' then
      begin
        if DeltaDS.FieldByName(FNowSelfToParentPtrField).AsInteger = 0 then
        begin
          LQry := TADOQuery.Create(nil);
          try
            LQry.Connection := FCon;
            LQry.SQL.Add('SELECT ' + FNowparentTableKeyField + ' FROM ' + FNowParentTable + ' WHERE IDKEY = ' + QuotedStr(DeltaDS.FieldByName(FNowSelfToParentIDKeyField).AsString));
            LQry.Open;
            if not LQry.IsEmpty then
            begin
              DeltaDS.FieldByName(FNowSelfToParentPtrField).NewValue := LQry.FieldByName(FNowparentTableKeyField).AsInteger;
            end;
          finally
            LQry.Free;
          end;
        end;
      end;
    ukDelete: inherited;
  end;
end;


function TMod38PostEngImpl.PostDataBySqlArr(ATableArr, ADataArr: OleVariant;
  out ErrMsg: string): Boolean;
var
  LCds: TClientDataSet;
  LData: OleVariant;
  LSql: string;
begin
  LCds := TClientDataSet.Create(nil);
  try
    LSql := 'select * from Tier3_ModTablesForPostData where MODID = ' + IntToStr(FModID) +
            ' and ChildID = ' + IntToStr(FModChildID) + ' order by seqno asc';
    Result := GetDataBySql(LSql,LData,ErrMsg);
    if not Result then Exit;
    if VarType(LData) = varEmpty then
    begin
      Result := False;
      ErrMsg := 'Tier3_ModTablesForPostData模块表结果为空';
      Exit;
    end;
    LCds.Data := LData;
    LCds.First;
    FCon.BeginTrans;
    try
      FBCustomerDelePost := True;
      while not LCds.Eof do
      begin
        FBDeleErrIgnore := False;
        FNowTableIndex := LCds.FieldByName('SeqNo').AsInteger;
        FNowSelfTable := LCds.FieldByName('SelfTable').AsString;
        FNowParentTable := LCds.FieldByName('ParentTable').AsString;
        FNowparentTableKeyField := LCds.FieldByName('ParentTableKeyField').AsString;
        FNowSelfToParentPtrField := LCds.FieldByName('SelfToParent_PtrField').AsString;
        FNowSelfToParentIDKeyField := LCds.FieldByName('PerentIDKeyField').AsString;
        Result := PostDataByTable(FNowSelfTable,ADataArr[FNowTableIndex],ErrMsg);
        if not Result then Exit;
        LCds.Next;
      end;
      FCon.CommitTrans;
    finally
      if FCon.InTransaction then
      begin
        FCon.RollbackTrans;
        Result := False;
      end;
    end;
  finally
    LCds.Free;
  end;
end;

end.
