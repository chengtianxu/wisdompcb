{$I PaxCompiler.def}
unit qkIMPORT;

interface
uses
  Vcl.Dialogs,
  System.Generics.Collections,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.Comp.DataSet,
  FireDAC.DatS,
  qkSvrIntf.ClientIntf,
  PaxRegister,
  PaxCompiler;

procedure Register_qkIMPORT;

var
  _typeFDMemTableCLass: Integer;

implementation

function TDataSet_Eof(Self: TDataSet):Boolean;
begin
  result := Self.Eof;
end;

function TDataSet_Locate(self: TDataSet;const AKeyFields: string; const AKeyValues: Variant):Boolean;
begin
  result := self.Locate(AKeyFields,AKeyValues,[loCaseInsensitive]);
end;

procedure _ReleaseDsList(ADsList: TList<TFDMemTable>);
var
  I: Integer;
begin
  if ADsList <> nil then
  begin
    for I := 0 to ADsList.Count - 1 do
      ADsList[I].Free;
    ADsList.Clear;
    ADsList.Free;
  end;
end;

function _CheckSPRetParam(APms: TFDParams): Boolean;
var
  lpm: TFDParam;
begin
  Result := False;
  if not Assigned(APms) then
    Exit;
  lpm := APms.FindParam('@ret');
  if lpm = nil then
    Exit;
  if lpm.Value <> 1 then
  begin
    lpm := APms.FindParam('@errMsg');
    if lpm <> nil then
    begin
      ShowMessage(lpm.Value);
    end;
    Exit;
  end;
  Result := true;
end;

function qkScript_SqlOpen(AFdmem: TFDMemTable; ASql: string): Boolean;
const
  SPNAME = 'Sys_OpenSQL';
var
  LPms: TFDParams;
  lds: TList<TFDMemTable>;
begin
  Result := False;
  lds := nil;
  LPms := TFDParams.Create;
  try
    with LPms.Add do
    begin
      Name := '@Sqltxt';
      Value := ASql;
    end;
    lds := dmSvrIntf.SpOpen(SPNAME,LPms);
    if lds = nil then
      Exit;
    if not _CheckSPRetParam(LPms) then
      exit;
    Result := True;
    AFdmem.Close;
    AFdmem.Data := lds[0].Data;
  finally
    LPms.Free;
    _ReleaseDsList(lds);
  end;
end;


function TFDMemTable_GetData(Self: TFDMemTable): IFDDataSetReference;
begin
  Result := Self.Data;
end;

procedure TFDMemTable_SetData(Self: TFDMemTable;const AValue: IFDDataSetReference);
begin
  Self.Data := AValue;
end;


procedure Register_qkIMPORT;
var
  H,G: Integer;
begin
  {$REGION 'Data.DB'}
  H := RegisterNamespace(0, 'qkImport');
  RegisterClassType(H, TField);
  G := RegisterClassType(H, TDataSet);
  RegisterHeader(G, 'function FieldByName(const FieldName: string): TField;', @TDataSet.FieldByName);
  RegisterHeader(G, 'function FindField(const FieldName: string): TField;', @TDataSet.FindField);
  RegisterHeader(G, 'procedure First;', @TDataSet.First);
  RegisterHeader(G, 'procedure Next;', @TDataSet.Next);
  RegisterHeader(G, 'function TDataSet_Eof(Self: TDataSet):Boolean;', @TDataSet_Eof);
  RegisterProperty(G, 'property Eof: Boolean read TDataSet_Eof;');
  RegisterHeader(G, 'function Locate(const AKeyFields: string; const AKeyValues: Variant): Boolean;'
  , @TDataSet_Locate);
  {$ENDREGION}


  {$REGION 'QkFunc'}
  RegisterHeader(H, 'function SqlOpen(AFdmem: TFDMemTable; ASql: string): Boolean;', @qkScript_SqlOpen);
  {$ENDREGION}

  {$REGION 'FireDac'}
//  //
//  RegisterClassType(H, TFDDatSView);
  G := RegisterInterfaceType(H,'IFDDataSetReference',IFDDataSetReference);
//  RegisterSupportedInterface(G,'IUnknown',IUnknown);
//  RegisterHeader(G,
//       'function GetDataView: TFDDatSView;', nil,2);
//  RegisterHeader(G,
//       'property DataView: TFDDatSView read GetDataView;', nil);
//  //
  G := RegisterClassType(H, TFDMemTable);
  _typeFDMemTableCLass := G;
  RegisterFakeHeader(G,
    'function TFDMemTable_GetData: IFDDataSetReference;',
    @TFDMemTable_GetData);
  RegisterFakeHeader(G,
    'procedure TFDMemTable_SetData(const AValue: IFDDataSetReference);',
    @TFDMemTable_SetData);;
  RegisterProperty(G,
    'property Data: IFDDataSetReference read TFDMemTable_GetData write TFDMemTable_SetData;')

  {$ENDREGION}


end;

end.
