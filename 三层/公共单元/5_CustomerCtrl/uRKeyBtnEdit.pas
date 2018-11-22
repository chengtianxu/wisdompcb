unit uRKeyBtnEdit;

interface
uses
  Winapi.Windows,System.SysUtils, RzDBLbl,RzBtnEdt, Data.DB, System.Classes, Winapi.Messages,
  RzLabel, Datasnap.DBClient, Vcl.DBCtrls, Vcl.Controls;

type
  TOnDataFieldValueChange = procedure (AOldValue,ANewValue: Variant) of object;
  TRKeyRzBtnEdit = class(TRzButtonEdit)
  private
    FDataLink: TFieldDataLink;
    FDisplayTableName: string;
    FDisplaytextField: string;
    FDisplayRetKeyField: string;
    FDisplayNoteField: string;
    //FSvrBplPath: string;
    FDisplayAddWhere: string;
    FDisplayPickID: string;
    FDataUniqueTable: string;
    FDataUniqueField: string;
    FDataUniqueGroup: string;
    FDataUniqueMsgHead: string;
    FOldEditText: string;
    FForceOnFocus: Boolean;
    FDisplayNoteLabel: TRzLabel;
    FOnDataFieldValueChange: TOnDataFieldValueChange;
    FGetDisp: Boolean;
    FDisplayModID: Integer;
    FDisplayPickWhere: string;
    FOldFieldValue: string;
    procedure FOnButtonClick(Sender: TObject);
    function GetDataField: string;
    procedure SetDataField(const Value: string);
    function GetDataSource: TDataSource;
    procedure SetDataSource(value: TDataSource);
    procedure DataChange(Sender: TObject);
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure CMVisibleChanged(var Message: TMessage); message CM_VISIBLECHANGED;
  protected
    function GetDisplayInfo: Boolean;
    function CheckInputText: Boolean;
    procedure KeyPress(var Key: Char); override;
    function DataUniqueCheck(AFieldValue: Variant): Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function DisplayNoteLabel: TRzLabel;
    function ShowPickSingleSetValue: Boolean;
    property EditMask;
  published
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property DataSourceField: string read GetDataField write SetDataField;
    property DataUniqueTable: string read FDataUniqueTable write FDataUniqueTable;
    property DataUniqueField: string read FDataUniqueField write FDataUniqueField;
    property DataUniqueGroup: string read FDataUniqueGroup write FDataUniqueGroup;
    property DataUniqueMsgHead: string read FDataUniqueMsgHead write FDataUniqueMsgHead;
    property DispalyTableName: string read FDisplayTableName write FDisplayTableName;
    property DisplaytextField: string read FDisplaytextField write FDisplaytextField;
    property DisplayRetKeyField: string read FDisplayRetKeyField write FDisplayRetKeyField;
    property DisplayNoteField: string read FDisplayNoteField write FDisplayNoteField;
    property DisplayAddWhere: string read FDisplayAddWhere write FDisplayAddWhere;
    property DisplayPickID: string read FDisplayPickID write FDisplayPickID;
    property DisplayPickWhere: string read FDisplayPickWhere write FDisplayPickWhere;
    property DisplayModID: Integer read FDisplayModID write FDisplayModID;
    property ForceOnFocus: Boolean read FForceOnFocus write FForceOnFocus;
    //property SvrBplPath: string read FSvrBplPath write FSvrBplPath;
    property OnDataFieldValueChange: TOnDataFieldValueChange read FOnDataFieldValueChange write FOnDataFieldValueChange;
    property Color stored True;
  end;

procedure register;

implementation

uses
  System.Variants, Vcl.Dialogs, uCommFunc, uBaseSinglePickListFrm;

//type
  //TSvrFunc_spGetDataByID = function (Id: Integer; pInputParam: OleVariant; var vData: OleVariant): Boolean;
  //TSvrFunc_Pick_Single_SetValue = function (DataSet:TDataSet;var vData:Olevariant;FieldSet:string;PickID: integer; EditType: byte=0;Validate:boolean=true;FieldName: string = ''): variant;

procedure register;
begin
  RegisterComponents('Samples', [TRKeyRzBtnEdit]);
end;

function TRKeyRzBtnEdit.ShowPickSingleSetValue;
var
  LFrm: TfrmSinglePickList;
begin
  Result := False;

  LFrm := TfrmSinglePickList.Create(nil);
  try
    if not LFrm.InitWithPickID(FDisplayModID,StrToInt(FDisplayPickID),FDisplayPickWhere) then Exit;
    if LFrm.ShowModal = mrOk then
    begin
      FOldFieldValue := '0101010101010101';
      FDataLink.DataSet.Edit;
      FDataLink.Field.Value := LFrm.cdsPick.FieldByName(FDisplayRetKeyField).Value;
      FDataLink.DataSet.Post;
      Result := True;
    end;
  finally
    LFrm.Free;
  end;
end;


//function SvrFunc_Pick_Single_SetValue(DataSet:TDataSet;var vData:Olevariant;FieldSet:string;PickID: integer; EditType: byte=0;Validate:boolean=true;FieldName: string = '';ABplPath: string = ''): Boolean;
//var
//  hMod: THandle;
//  PF: Pointer;
//  //LData: OleVariant;
//
//begin
//  Result := False;
//
//
//
//  if ABplPath = '' then
//    hMod := LoadPackage(ExtractFilePath(ParamStr(0)) + 'FormClass.bpl')
//  else
//  begin
//    if ABplPath[Length(ABplPath)] <> '\' then
//      ABplPath := ABplPath + '\';
//    hMod := LoadPackage(ABplPath + 'FormClass.bpl');
//  end;
//  if (hMod <> INVALID_HANDLE_VALUE) and (hMod <> 0) then
//  begin
//    PF := GetProcAddress(hMod, 'Pick_Single_SetValue');
//    if PF <> nil then
//      TSvrFunc_Pick_Single_SetValue(PF)(DataSet,vData,FieldSet,PickID,EditType,Validate,FieldName);
//    Result := True;
//    //if Result and (not VarIsEmpty(LData)) then
//      //ADS.Data := LData[0];
//    UnloadPackage(hMod);
//  end;
//end;

//function SvrFunc_spGetDataByID(ASpID: Integer; LInPut: OleVariant;
//  ADS: TClientDataSet;ABplPath: string = ''): Boolean;
//var
//  hMod: THandle;
//  PF: Pointer;
//  LData: OleVariant;
//begin
//  Result := False;
//  if ABplPath = '' then
//    hMod := LoadPackage(ExtractFilePath(ParamStr(0)) + 'SvrFunc.bpl')
//  else
//  begin
//    if ABplPath[Length(ABplPath)] <> '\' then
//      ABplPath := ABplPath + '\';
//    hMod := LoadPackage(ABplPath + 'SvrFunc.bpl');
//  end;
//  if (hMod <> INVALID_HANDLE_VALUE) and (hMod <> 0) then
//  begin
//    PF := GetProcAddress(hMod, 'spGetDataByID');
//    if PF <> nil then
//      Result := TSvrFunc_spGetDataByID(PF)(ASpID,LInPut,LData);
//    if Result and (not VarIsEmpty(LData)) then
//      ADS.Data := LData[0];
//    UnloadPackage(hMod);
//  end;
//end;

{ TRKeyRzBtnEdit }

function TRKeyRzBtnEdit.CheckInputText: Boolean;
var
  LInPut: Olevariant;
  LDs: TClientDataSet;
  LField: TField;
  LOldValue: Variant;
begin
  Result := False;
  try
    if (Trim(FDisplayTableName) <> '') and
       (Trim(FDisplaytextField) <> '') and
       (Trim(FDisplayRetKeyField) <> '')
    then
    begin
      if (FDataLink.Field <> nil) and (not FDataLink.DataSet.IsEmpty) then
      begin
        LInPut := VarArrayCreate([0,5], varVariant);
        LInPut[0] := FDisplayTableName;
        LInPut[1] := FDisplaytextField;
        LInPut[2] := FDisplayRetKeyField;
        LInPut[3] := Text;
        LInPut[4] := 0;
        LInPut[5] := FDisplayAddWhere;
        LDs := TClientDataSet.Create(Self);
        try
          if gSvrIntf.IntfspGetData('Tier3_RkeyBtnEditGetData',LInPut,LDs) then
          begin
            if not LDs.IsEmpty then
            begin
              LField := LDs.FindField(FDisplayRetKeyField);
              if LField <> nil then
              begin
                //唯一性检查
                if Trim(FDataUniqueTable) <> '' then
                begin
                  if not DataUniqueCheck(LField.Value) then
                  begin
                    if Trim(FDataUniqueMsgHead) = '' then
                      ShowMessage('输入的记录已经存在，请重新输入!' + #13 + '或按ESC键取消!')
                    else
                      ShowMessage(FDataUniqueMsgHead + '  已经存在，请重新输入!' + #13 + '或按ESC键取消!');
                    Exit;
                  end;
                end;
                //赋值
                if FDataLink.Field.Value <> LField.Value then
                begin
                  LOldValue := FDataLink.Field.Value;
                  FGetDisp := False;
                  FDataLink.DataSet.Edit;
                  FGetDisp := True;
                  FDataLink.Field.Value := LField.Value;
                  if Assigned(FOnDataFieldValueChange) then
                    FOnDataFieldValueChange(LOldValue,LField.Value);
                  //FDataLink.DataSet.Post;
                end;
                Result := True;
              end;
              LField := LDs.FindField(FDisplayNoteField);
              if LField <> nil then
              begin
                FDisplayNoteLabel.Caption := LField.AsString;
                FDisplayNoteLabel.Parent := Self.Parent;
              end;
            end;
          end;
        finally
          LDs.Free;
        end;
      end;
    end else
    if Trim(FDataUniqueTable) <> '' then
    begin
      //唯一性检查
      if not DataUniqueCheck(Text) then
      begin
        if Trim(FDataUniqueMsgHead) = '' then
          ShowMessage('输入的记录已经存在，请重新输入!' + #13 + '或按 ESC 键取消!')
        else
          ShowMessage(FDataUniqueMsgHead + '  已经存在，请重新输入!' + #13 + '或按 ESC 键取消!');
        Exit;
      end else
      begin
        FGetDisp := False;
        FDataLink.DataSet.Edit;
        FGetDisp := True;
        FDataLink.Field.Value := Text;
        Result := True;
      end;
    end else
    begin
      try
        FGetDisp := False;
        FDataLink.DataSet.Edit;
        FGetDisp := True;
        FDataLink.Field.Value := Text;
        Result := True;
      except
        Result := False;
      end;
    end;
    if not Result then
    begin
      if Trim(FDataUniqueMsgHead) = '' then
        ShowMessage('无效的输入记录，请确认输入是否正确，' + #13 + '或者按ESC取消输入')
      else
        ShowMessage('无效的  ' + FDataUniqueMsgHead + '  请确认输入是否正确，' + #13 + '或者按ESC取消输入');
    end;
  except
    Result := False;
  end;
end;

procedure TRKeyRzBtnEdit.CMExit(var Message: TCMExit);
var
  LOk: Boolean;
begin
  LOk := True;
  if (FDataLink.Field <> nil) and (not FDataLink.Field.ReadOnly) and (not Self.ReadOnly) and (FOldEditText <> Self.EditText) then
  begin
    if EditText <> '' then
    begin
      LOk := CheckInputText;
    end else
    begin
      if (FDataLink.Field <> nil) and (not FDataLink.Field.IsNull) and (not (FDataLink.DataSet.State in [dsInsert,dsEdit])) then
      begin
//        LOk := False;
//      end else
//      begin
        FDataLink.DataSet.Edit;
        FDataLink.Field.Clear;
        FDataLink.DataSet.Post;
      end;
    end;
  end;

  if not LOk then
  begin
    if FForceOnFocus then Self.SetFocus
    else inherited;
  end else
    inherited;
end;

procedure TRKeyRzBtnEdit.CMVisibleChanged(var Message: TMessage);
begin
  inherited;
  FDisplayNoteLabel.Visible := Self.Visible;
end;

constructor TRKeyRzBtnEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FGetDisp := True;
  FForceOnFocus := True;
  Self.ButtonKind := bkFind;
  OnButtonClick := FOnButtonClick;
  ControlStyle := ControlStyle + [csReplicatable];
  FDisplayNoteLabel := TRzLabel.Create(Self);
  FDisplayNoteLabel.Name :=  'DisplayNoteLabel';
  FDisplayNoteLabel.Parent := Self.Parent;
  FDisplayNoteLabel.AutoSize := True;
  FDisplayNoteLabel.Show;

  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
end;

procedure TRKeyRzBtnEdit.DataChange(Sender: TObject);
begin
  if (FDataLink.Field <> nil) and FGetDisp then
  begin
    if (FOldFieldValue <> FDataLink.Field.AsString) then
    begin
      FOldFieldValue := FDataLink.Field.AsString;
      GetDisplayInfo;
    end;
  end else
  begin

  end;
end;

function TRKeyRzBtnEdit.DataUniqueCheck(AFieldValue: Variant): Boolean;
var
  LUField,LUGroup: string;
  LInPut: Olevariant;
  LDs: TClientDataSet;
begin
  Result := False;
  if Trim(FDataUniqueTable) <> '' then
  begin
    if Trim(FDataUniqueField) <> '' then
      LUField := FDataUniqueField
    else
      LUField := FDataLink.FieldName;
    if Trim(FDataUniqueGroup) <> '' then LUGroup := FDataUniqueGroup;

    LInPut := VarArrayCreate([0,5], varVariant);
    LInPut[0] := FDataUniqueTable;
    LInPut[1] := FDisplaytextField;
    LInPut[2] := LUField;
    LInPut[3] := AFieldValue;
    LInPut[4] := 1;
    LInPut[5] := LUGroup;
    LDs := TClientDataSet.Create(Self);
    try
      if gSvrIntf.IntfspGetData('Tier3_RkeyBtnEditGetData',LInPut,LDs) then
      begin
        Result := LDs.IsEmpty;
      end;
    finally
      LDs.Free;
    end;
  end else
    Result := True;
end;

destructor TRKeyRzBtnEdit.Destroy;
begin
  FDisplayNoteLabel.Free;
  FDataLink.Free;
  inherited;
end;

function TRKeyRzBtnEdit.DisplayNoteLabel: TRzLabel;
begin
  Result := FDisplayNoteLabel;
end;

procedure TRKeyRzBtnEdit.FOnButtonClick(Sender: TObject);
var
  LOldValue: Variant;
begin
  if (FDisplayPickID = '') or (FDataLink.Field = nil) or (FDataLink.Field.ReadOnly) or (Self.ReadOnly) then
    Exit
  else
  if (FDataLink.DataSet is TClientDataSet) then
  begin
    if not (FDataLink.DataSet as TClientDataSet).ReadOnly then
    begin
      LOldValue := FDataLink.DataSet.FieldByName(DataSourceField).Value;
      if ShowPickSingleSetValue then
      begin
        if LOldValue <> FDataLink.DataSet.FieldByName(DataSourceField).Value then
        begin
          if Assigned(FOnDataFieldValueChange) then
          begin
            FOnDataFieldValueChange(LOldValue,FDataLink.DataSet.FieldByName(DataSourceField).Value);
          end;
        end;
      end;
    end;
  end else
  begin
    LOldValue := FDataLink.DataSet.FieldByName(DataSourceField).Value;
    if ShowPickSingleSetValue then
    begin
      if LOldValue <> FDataLink.DataSet.FieldByName(DataSourceField).Value then
      begin
        if Assigned(FOnDataFieldValueChange) then
        begin
          FOnDataFieldValueChange(LOldValue,FDataLink.DataSet.FieldByName(DataSourceField).Value);
        end;
      end;
    end;
  end;
end;

function TRKeyRzBtnEdit.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

function TRKeyRzBtnEdit.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TRKeyRzBtnEdit.GetDisplayInfo: Boolean;
var
  LInPut: Olevariant;
  LDs: TClientDataSet;
  LField: TField;
begin
  Result := False;
  EditText := '';
  FDisplayNoteLabel.Caption := '';
  try
    if (Trim(FDisplayTableName) <> '') and
       (Trim(FDisplaytextField) <> '') and
       (Trim(FDisplayRetKeyField) <> '')
    then
    begin
      if (FDataLink.Field <> nil) and (not FDataLink.DataSet.IsEmpty) and (not FDataLink.Field.IsNull) then
      begin
        LInPut := VarArrayCreate([0,5], varVariant);
        LInPut[0] := FDisplayTableName;
        LInPut[1] := FDisplaytextField;
        LInPut[2] := FDisplayRetKeyField;
        LInPut[3] := FDataLink.Field.AsString;
        LInPut[4] := 1;
        LInPut[5] := '';//FDisplayAddWhere;注释是因为，比如条件是人员在职，但是此人离职了，数据库已经改了，但是还应该显示此人
        LDs := TClientDataSet.Create(Self);
        try
          if gSvrIntf.IntfspGetData('Tier3_RkeyBtnEditGetData',LInPut,LDs) then
          begin
            LField := LDs.FindField(FDisplaytextField);
            if LField <> nil then
            begin
              EditText := LField.AsString;
              if (FOldEditText = '') then FOldEditText := EditText;
            end;
            LField := LDs.FindField(FDisplayNoteField);
            if LField <> nil then
            begin
              FDisplayNoteLabel.Caption := LField.AsString;
              FDisplayNoteLabel.Parent := Self.Parent;
            end;
            Result := True;
          end;
        finally
          LDs.Free;
        end;
      end;
    end else
    begin
      EditText := FDataLink.Field.AsString;
      if (FOldEditText = '') then FOldEditText := EditText;
      if FDataLink.Field.IsNull then FOldEditText := '';

      Result := True;
    end;
  except

  end;
end;

procedure TRKeyRzBtnEdit.KeyPress(var Key: Char);
begin
  if (FDataLink.Field = nil) or (FDataLink.Field.ReadOnly) or (Self.ReadOnly) then
    Key := #0
  else
  if (FDataLink.DataSet is TClientDataSet) then
  begin
    if (FDataLink.DataSet as TClientDataSet).ReadOnly then
      Key := #0;
  end;
  if Key = #27 then
  begin
    if FOldEditText <> EditText then GetDisplayInfo;
  end;
  inherited KeyPress(Key);
end;

procedure TRKeyRzBtnEdit.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

procedure TRKeyRzBtnEdit.SetDataSource(value: TDataSource);
begin
  if not (FDataLink.DataSourceFixed and (csLoading in ComponentState)) then
    FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;



procedure TRKeyRzBtnEdit.WMSize(var Message: TWMSize);
begin
  inherited;
  FDisplayNoteLabel.Left := Self.Left + Self.Width + 3;
  FDisplayNoteLabel.Top := Self.Top + 3;
end;

end.
