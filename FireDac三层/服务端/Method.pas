unit Method;

interface
uses
  System.SysUtils, System.Classes,System.Generics.Collections,System.ZLib,Data.DB,
  Winapi.Windows,ansistrings,
  //用来packparam
  Datasnap.DBClient,

  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.VCLUI.Wait;

  function func1(const ASrc, AKey: PAnsiChar): PAnsiChar;stdcall; external 'qkdll.dll';
  function func2(const ASrc, AKey: PAnsiChar): PAnsiChar;stdcall; external 'qkdll.dll';

type

{$METHODINFO ON}
  TSvrMethods = class(TPersistent)
  private
    //验证是否过期
    function CheckIsOver: Boolean;
    //建并且打开链接 失败返回nil，
    function Factory_CreateCon(AConDefName: string;out AErrMsg: string): TFDCustomConnection;
    function Factory_CreateQry(ACon: TFDCustomConnection;out AErrMsg: string): TFDQuery;
    function Factory_CreateSp(ACon: TFDCustomConnection; out AErrMsg: string): TFDStoredProc;
  public
    //----1
    function Intf_RefreshSqlBuffer(AConDefName: string;out AErrMsg: OleVariant): Boolean;
    //----2
    function Intf_SqlOpen(const AConDefName: string;
    const ASqlName: string;
    var AParamSM: TStream; //参数不用压缩
    out AOutDataSM: TStream;
    out AOutDataSizeArr: OleVariant; //输出的数据尺寸，用;分隔Size
    out AErrMsg: OleVariant
    ): Boolean;
    //----3
    function Intf_SpOpen(const AConDefName: string;
    const ASpName: string;
    var AParamSM: TStream; //参数不用压缩
    out AOutDataSM: TStream;
    out AOutDataSizeArr: OleVariant; //输出的数据尺寸，用;分隔Size
    out AErrMsg: OleVariant
    ): Boolean;
    //----4
    function Intf_SqlExec(const AConDefName: string;
    const ASqlName: string;
    var AParamSM: TStream; //参数不用压缩
    out AErrMsg: OleVariant
    ): Boolean;
    //----5
    function Intf_SpExec(const AConDefName: string;
    const ASpName: string;
    var AParamSM: TStream; //参数不用压缩
    out AErrMsg: OleVariant
    ): Boolean;
    //----6
    //此条无效了--强制约定：数据集中必须包含qkUpdateTable字段来标识提交哪个表
    function Intf_PostDataByTableArr(const AConDefName: string;
    var ADeltaSM: TStream;
    ADeltaSMSizeArr: string; //数据数组尺寸，用;分隔Size
    ATableArr: string; //以';'号分隔的表名
    out AErrMsg: OleVariant
    ): Boolean;
    //----7
    //刷新服务器注册时间
    function Intf_RefreshRegTime(AConDefName: string;out AErrMsg: OleVariant): Boolean;
    //---8
    //检测是否快要过期，返回软件距结束天数
    function Intf_CheckALterRegDate(AConDefName: string;out AErrMsg: OleVariant): Integer;
    //---Reg
    //注册软件
    function intf_UpdateRegCode(AConDefName,key1,key2: string;out AErrMsg: OleVariant): Boolean;
  end;



var
  gNowTmpSvrDate: TDateTime;
  gRegEnableDate: TDateTime;


  function qkStrToDateTime(AStr: string): TDateTime;
{$METHODINFO OFF}

implementation
uses
  Container, qmsgpack, System.DateUtils, inifiles;


function qkStrToDateTime(AStr: string): TDateTime;
var
  LFmt: TFormatSettings;
begin
  LFmt := TFormatSettings.Create(LOCALE_USER_DEFAULT);
  LFmt.ShortDateFormat:='yyyy-MM-dd';
  LFmt.DateSeparator:='-';
  //FSetting.TimeSeparator:=':';
  LFmt.LongTimeFormat:='hh:mm:ss';
  Result := StrToDateDef(AStr,0,LFmt);
end;


function SetErrMsg(AErrMsg: string): string;
begin
  Result := 'qkServer Err::' + AErrMsg;
end;

function qkCopyStream(const AStream: TStream;out AErrMsg: string): TMemoryStream;
const
  LBufSize = $F000;
var
  LBuffer: TBytes;
  LReadLen: Integer;
begin
  Result := nil;
  if AStream = nil then
    Exit;
  Result := TMemoryStream.Create;
  try
    if AStream.Size = -1 then
    begin
      SetLength(LBuffer, LBufSize);
      repeat
        LReadLen := AStream.Read(LBuffer[0], LBufSize);
        if LReadLen > 0 then
          Result.WriteBuffer(LBuffer[0], LReadLen);
        if LReadLen < LBufSize then
          break;
      until LReadLen < LBufSize;
    end
    else
      Result.CopyFrom(AStream, 0);
    Result.Position := 0;
    AStream.Position := 0;
  except
    on E: Exception do
    begin
      AErrMsg := SetErrMsg(e.Message);
      Result.Free;
      Result := nil;
    end;
  end;
end;

function qkParamToStream(AParams: TFDParams; out AErrMsg: string): TStream;
var
  QMP: TQMsgPack;
  I, Idx, Count: Integer;
begin
  Result := nil;
  QMP := TQMsgPack.Create;
  try
    Count := 0;
    for I := 0 to AParams.Count - 1 do
      if AParams[I].ParamType in AllParamTypes then
        Inc(Count);
    if Count > 0 then
    begin
      Idx := 0;
      for I := 0 to AParams.Count - 1 do
        if AParams[I].ParamType in AllParamTypes then
        begin
          QMP.ForcePath(Idx.ToString).ForcePath('Name').AsString := AParams[I].Name;
          QMP.ForcePath(Idx.ToString).ForcePath('Value').AsVariant := AParams[I].AsString;
          QMP.ForcePath(Idx.ToString).ForcePath('DataType').AsInteger := Ord(AParams[I].DataType);
          QMP.ForcePath(Idx.ToString).ForcePath('ParamType').AsInteger := Ord(AParams[I].ParamType);
          QMP.ForcePath(Idx.ToString).ForcePath('Size').AsInteger := AParams[I].Size;
          QMP.ForcePath(Idx.ToString).ForcePath('Precision').AsInteger := AParams[I].Precision;
          QMP.ForcePath(Idx.ToString).ForcePath('NumericScale').AsInteger := AParams[I].NumericScale;
          Inc(Idx);
        end;
    end;
    try
      Result := TMemoryStream.Create;
      QMP.SaveToStream(Result);
      Result.Position := 0;
    except
      on E: Exception do
      begin
        AErrMsg := SetErrMsg(e.Message);
        if Result <> nil then
          Result.Free;
        Result := nil;
      end;
    end;
  finally
    QMP.Free;
  end;
end;

function qkStreamToParams(AStream: TStream;out AErrMsg: string): TFDParams;
var
  QMP: TQMsgPack;
  LParam: TFDParam;
  I: Integer;
begin
  Result := TFDParams.Create;
  if AStream.Size = 0 then Exit;
  QMP := TQMsgPack.Create;
  try
    try
      AStream.Position := 0;
      QMP.LoadFromStream(AStream);
      for I := 0 to QMP.Count - 1 do
      begin
        LParam := Result.Add;
        LParam.Name := QMP.ForcePath(I.ToString).ForcePath('Name').AsString;
        LParam.DataType := TFieldType(QMP.ForcePath(I.ToString).ForcePath('DataType').AsInteger);
        LParam.ParamType := TParamType(QMP.ForcePath(I.ToString).ForcePath('ParamType').AsInteger);
        LParam.Size := QMP.ForcePath(I.ToString).ForcePath('Size').AsInteger;
        LParam.Precision := QMP.ForcePath(I.ToString).ForcePath('Precision').AsInteger;
        LParam.NumericScale := QMP.ForcePath(I.ToString).ForcePath('NumericScale').AsInteger;
        LParam.Value := QMP.ForcePath(I.ToString).ForcePath('Value').AsVariant;
      end;
      AStream.Position := 0;
    except
      on E: Exception do
      begin
        AErrMsg := SetErrMsg(e.Message);
        if Result <> nil then
        begin
          Result.Clear;
          Result.Free;
        end;
        Result := nil;
      end;
    end;
  finally
    QMP.Free;
  end;
end;

function qkCompressStream(InStream,OutStream: TStream;out AErrMsg: string): Boolean;
begin
  AErrMsg := '';
  InStream.Position := 0;
  try
    ZCompressStream(InStream,OutStream,zcFastest);
    Result := True;
    OutStream.Position := 0;
  except
    on E: Exception do
    begin
      AErrMsg := SetErrMsg(e.Message);
      Result := False;
    end;
  end;
end;

function qkDeCompressStream(InStream,OutStream: TStream;out AErrMsg: string): Boolean;
begin
  AErrMsg := '';
  InStream.Position := 0;
  try
    ZDecompressStream(InStream,OutStream);
    Result := True;
    OutStream.Position := 0;
  except
    on E: Exception do
    begin
      AErrMsg := SetErrMsg(e.Message);
      Result := False;
    end;
  end;
end;

{ TdmMethods }
function TSvrMethods.CheckIsOver: Boolean;
begin
  Result := gRegEnableDate <= gNowtmpSvrDate;
end;

function TSvrMethods.Factory_CreateCon(AConDefName: string;
  out AErrMsg: string): TFDCustomConnection;
var
  LList: TStringList;
  LCon: TFDCustomConnection;
begin
  {$REGION '查找DManager数据库连接'}
  AErrMsg := '';
  LList := TStringList.Create;
  try
    dmContainer.FDManager1.GetConnectionDefNames(LList);
    if LList.IndexOf(AConDefName) = -1 then
    begin
      AErrMsg := SetErrMsg('没有找到数据库连接: ' + AConDefName);
      Result := nil;
      Exit;
    end;
  finally
    LList.Free;
  end;
  {$ENDREGION}

  {$REGION '取得或创建Connect'}
  LCon := TFDConnection.Create(nil);
  try
    LCon.LoginPrompt := False;
    LCon.ConnectionDefName := AConDefName;
    LCon.ResourceOptions.SilentMode := True;//不需要自动改变鼠标样式之类的
    LCon.FetchOptions.Mode := fmAll; //默认值返回50条，改后效果和Open，然后FetchAll
    LCon.FetchOptions.AutoClose := False; //取得多个数据集必须关闭

    LCon.Open();
    Result := LCon;
  except
    on E: Exception do
    begin
      AErrMsg := SetErrMsg(E.Message);
      Result := nil;
      if LCon <> nil then
        LCon.Free;
    end;
  end;
  {$ENDREGION}

end;

function TSvrMethods.Factory_CreateQry(ACon: TFDCustomConnection;
  out AErrMsg: string): TFDQuery;
var
  LQry: TFDQuery;
begin
  AErrMsg := '';
  LQry := TFDQuery.Create(nil);
  try
    LQry.DisableControls;
    LQry.AutoCalcFields := False;//
    LQry.CachedUpdates := True;
    LQry.FetchOptions.AutoClose := False;
    LQry.FetchOptions.Mode := fmAll;
    LQry.ResourceOptions.SilentMode := True;
    LQry.Connection := ACon;
    Result := LQry;
  except
    on E: Exception do
    begin
      AErrMsg := SetErrMsg(E.Message);
      LQry.Free;
      Result := nil;
    end;
  end;
end;

function TSvrMethods.Factory_CreateSp(ACon: TFDCustomConnection;
  out AErrMsg: string): TFDStoredProc;
var
  LSp: TFDStoredProc;
begin
  AErrMsg := '';
  LSp := TFDStoredProc.Create(nil);
  try
    LSp.DisableControls;
    LSp.AutoCalcFields := False;//
    LSp.CachedUpdates := True;
    LSp.FetchOptions.AutoClose := False;
    LSp.FetchOptions.Mode := fmAll;
    LSp.ResourceOptions.SilentMode := True;
    LSp.Connection := ACon;
    Result := LSp;
  except
    on E: Exception do
    begin
      AErrMsg := SetErrMsg(E.Message);
      LSp.Free;
      Result := nil;
    end;
  end;
end;


function TSvrMethods.Intf_CheckALterRegDate(AConDefName: string;
  out AErrMsg: OleVariant): Integer;
begin
  Result := DaysBetween(gRegEnableDate,gNowTmpSvrDate);
  if gRegEnableDate < gNowtmpSvrdate then
  begin
    Result := 0 - Result;
  end;
end;

function TSvrMethods.Intf_PostDataByTableArr(const AConDefName: string;
  var ADeltaSM: TStream; ADeltaSMSizeArr, ATableArr: string;
  out AErrMsg: OleVariant): Boolean;
  function SetFieldHide(AQry: TFDQuery;oErrMsg: string): Boolean;
  var
    LtmpQry: TFDQuery;
    I: Integer;
  begin
    Result := False;
    LtmpQry := TFDQuery.Create(nil);
    try
      try
        LtmpQry.Connection := AQry.Connection;
        LtmpQry.SQL.Text := AQry.SQL.Text;
        LtmpQry.Open;
        for I := 0 to AQry.Fields.Count - 1 do
        begin
          if LtmpQry.FindField(AQry.Fields[I].FieldName) = nil then
            AQry.Fields[I].ProviderFlags := [pfHidden];
        end;
        Result := True;
      except on E: Exception do
        oErrMsg := SetErrMsg(E.Message);
      end;
    finally
      LtmpQry.Free;
    end;
  end;
var
  LCon: TFDCustomConnection;
  LQry: TFDQuery;
  LTableArr: TArray<string>;
  LDataSizeArr: TArray<string>;
  LCopySM: TMemoryStream;
  LDecomPressSM: TMemoryStream;
  LTmpSM: TMemoryStream;
  I: Integer;
  //--异常用
  LErr: EFDException;
  ltmpErrS: string;

  lerr2: string;
begin
  if CheckIsOver then
  begin
    AErrMsg := '系统已过有效期，请联系公司注册。' ;
    Result := False;
    Exit;
  end;
  LCopySM := nil;
  LDecomPressSM := nil;
  LTmpSM := nil;
  LCon := nil;
  LQry := nil;
  Result := False;
  Lerr2 := '';

  try
    LCon := Factory_CreateCon(AConDefName,Lerr2);
    if LCon = nil then Exit;
    LQry := Factory_CreateQry(LCon,Lerr2);
    if LQry = nil then Exit;
    LTableArr := ATableArr.Split([';']);
    LDataSizeArr := ADeltaSMSizeArr.Split([';']);
    if Length(LTableArr) <> Length(LDataSizeArr) then
    begin
      Lerr2 := SetErrMsg('PostDataByTableArr TableArr 和 DataArr数量不等');
      Exit;
    end;
    ADeltaSM.Position := 0;
    LCopySM := qkCopyStream(ADeltaSM,Lerr2);//需要释放
    if LCopySM = nil then Exit;
    LDecomPressSM := TMemoryStream.Create; //需要释放
    LCopySM.Position := 0;
    if not qkDeCompressStream(LCopySM,LDecomPressSM,Lerr2) then Exit;

    LCon.StartTransaction;
    try
      for I := 0 to Length(LTableArr) - 1 do
      begin
        //if I <> 0 then LDecomPressSM.Position := StrToInt(LDataSizeArr[I-1]);
        LTmpSM := TMemoryStream.Create;
        LTmpSM.CopyFrom(LDecomPressSM,StrToInt(LDataSizeArr[I]));
        LTmpSM.Position := 0;

        LQry.Close;
        LQry.SQL.Text := 'SELECT * FROM ' + LTableArr[I] + ' WHERE 1=0';
        LQry.UpdateOptions.UpdateTableName := LTableArr[I];
        LQry.LoadFromStream(LTmpSM,TFDStorageFormat.sfBinary);
        if not SetFieldHide(LQry,Lerr2) then Exit;
        
        if LQry.ApplyUpdates(0) > 0 then
        begin
          LQry.FilterChanges := [rtModified, rtInserted, rtDeleted, rtHasErrors];
          try
            LQry.First;
            while not LQry.Eof do
            begin
              LErr := LQry.RowError;
              if LErr <> nil then
              begin
                ltmpErrS := LErr.Message;
                Break;
              end;
              LQry.Next;
            end;
          finally
            LQry.FilterChanges := [rtUnmodified, rtModified, rtInserted];
          end;
          raise Exception.Create(ltmpErrS);
        end;
        LTmpSM.Free;
        LTmpSM := nil;
      end;
      LCon.Commit;
      Result := True;
    except
      on E: Exception do
      begin
        if LTmpSM <> nil then
        begin
          LTmpSM.Free;
          LTmpSM := nil;
        end;
        LCon.Rollback;
        Result := False;
        Lerr2 := SetErrMsg(e.Message);
      end;
    end;
  finally
    if LTmpSM <> nil then
      LTmpSM.Free;
    if LCon.InTransaction then
      LCon.Rollback;
    if LDecomPressSM <> nil then
      LDecomPressSM.Free;
    if LCopySM <> nil then
      LCopySM.Free;
    if LQry <> nil then
    begin
      LQry.Close;
      LQry.Free;
    end;
    if LCon <> nil then
    begin
      LCon.Close;
      LCon.Free;
    end;
    AErrMsg := LErr2;
  end;
end;

function TSvrMethods.Intf_RefreshRegTime(AConDefName: string;
  out AErrMsg: OleVariant): Boolean;
var
  LCon: TFDCustomConnection;
  LQry: TFDQuery;
  LErr: string;
begin
  LErr := '';
  Result := False;
  LCon := nil;
  LQry := nil;
  try
  LCon := Factory_CreateCon(AConDefName,LErr);
    if LCon = nil then Exit;
    LQry := Factory_CreateQry(LCon,LErr);
    if LQry = nil then Exit;

    try
      LQry.Close;
      LQry.Params.Clear;
      LQry.SQL.Text := 'SELECT getdate() as nowdate';
      LQry.Open();

      MonitorEnter(dmContainer.FSqlTxtList);
      try
        gNowTmpSvrDate := LQry.FieldByName('nowdate').AsDateTime;
      finally
        MonitorExit(dmContainer.FSqlTxtList);
      end;
      Result := True;
    except
      on E: Exception do
      begin
        LErr := SetErrMsg(e.Message);
        Result := False;
      end;
    end;
  finally
    LQry.Close;
    LQry.Free;
    LCon.Close;
    LCon.Free;
    AErrMsg := LErr;
  end;

end;

function TSvrMethods.Intf_RefreshSqlBuffer(AConDefName: string;
  out AErrMsg: OleVariant): Boolean;
var
  LCon: TFDCustomConnection;
  LKey: string;
  LQry: TFDQuery;
  LErr: string;
begin
  LErr := '';
  Result := False;
  LCon := nil;
  LQry := nil;

  try
    LCon := Factory_CreateCon(AConDefName,LErr);
    if LCon = nil then Exit;
    LQry := Factory_CreateQry(LCon,LErr);
    if LQry = nil then Exit;

    try
      LQry.Close;
      LQry.Params.Clear;
      LQry.SQL.Text := 'SELECT * FROM gSys_SqlTxt ORDER BY Rkey';
      LQry.Open();

      MonitorEnter(dmContainer.FSqlTxtList);
      try
        LQry.First;
        while not LQry.Eof do
        begin
          LKey := UpperCase(AConDefName + '_' + LQry.FieldByName('SqlName').AsString);
          if dmContainer.FSqlTxtList.ContainsKey(LKey) then
            dmContainer.FSqlTxtList.Items[LKey] := LQry.FieldByName('SqlTxt').AsString
          else
            dmContainer.FSqlTxtList.Add(LKey,LQry.FieldByName('SqlTxt').AsString);
          LQry.Next;
        end;
      finally
        MonitorExit(dmContainer.FSqlTxtList);
      end;
      Result := True;
    except
      on E: Exception do
      begin
        LErr := SetErrMsg(e.Message);
        Result := False;
      end;
    end;
  finally
    LQry.Close;
    LQry.Free;
    LCon.Close;
    LCon.Free;
    AErrMsg := LErr;
  end;
end;

function TSvrMethods.Intf_SpExec(const AConDefName, ASpName: string;
  var AParamSM: TStream; out AErrMsg: OleVariant): Boolean;
var
  LCon: TFDCustomConnection;
  LSp: TFDStoredProc;
  //LSqlTxt: string;
  //--参数用
  I: Integer;
  LTmpParam: TFDParam;
  LSM: TMemoryStream;
  LFDParams: TFDParams;
  Lerr: string;
begin
  LCon := nil;
  LSp := nil;
  Result := False;
  Lerr := '';

  {$REGION '还原参数'}
  AParamSM.Position := 0;
  LSM := qkCopyStream(AParamSM,Lerr);//需要释放
  try
    if LSM = nil then Exit;
    LFDParams := qkStreamToParams(LSM,Lerr);//需要释放
    if LFDParams = nil then Exit;
  finally
    if LSM <> nil then
      LSM.Free;
    AErrMsg := Lerr;
  end;
  {$ENDREGION}



  try
    LCon := Factory_CreateCon(AConDefName,Lerr);
    if LCon = nil then Exit;
    LSp := Factory_CreateSp(LCon,Lerr);
    if LSp = nil then Exit;

    try
      LSp.Close;
      LSp.StoredProcName := ASpName;
      LSp.Prepare; //这里必须准备，否则没有参数
      {$REGION '参数赋值'}
      for I := 0 to LFDParams.Count - 1 do
      begin
        LTmpParam := LSp.Params.FindParam(LFDParams[I].Name.ToUpper);
        if LTmpParam <> nil then
        begin
          LTmpParam.Value := LFDParams[i].Value;
        end;
      end;
      {$ENDREGION}

      LSp.ExecProc();

      {$REGION '参数回传赋值'}
      LSp.Close; //Autoclose设置为false时候，必须关闭才能回传参数。晕死！！！！
      LFDParams.Clear;
      LFDParams.Assign(LSp.Params);

      AParamSM := qkParamToStream(LFDParams,Lerr);//这里直接赋值不需要释放，初始传入和传出在哪里释放搞不清
      if AParamSM <> nil then
        AParamSM.Position := 0;
      {$ENDREGION}

      Result := True;
    except
      on E: Exception do
      begin
        Result := False;
        Lerr := SetErrMsg(e.Message);

      end;
    end;
  finally
    if LFDParams <> nil then
    begin
      LFDParams.Clear;
      LFDParams.Free;
    end;
    if LSp <> nil then
    begin
      LSp.Close;
      LSp.Free;
    end;
    if LCon <> nil then
    begin
      LCon.Close;
      LCon.Free;
    end;
    AErrMsg := Lerr;
  end;
end;

function TSvrMethods.Intf_SpOpen(const AConDefName, ASpName: string;
  var AParamSM: TStream; out AOutDataSM: TStream; out AOutDataSizeArr,
  AErrMsg: OleVariant): Boolean;
var
  LCon: TFDCustomConnection;
  LSp: TFDStoredProc;
  //LSqlTxt: string;
  //--参数用
  I: Integer;
  LTmpParam: TFDParam;
  LSM: TMemoryStream;
  LFDParams: TFDParams;
  //Data-用
  LtmpStream: TMemoryStream;
  ltmpSM: TMemoryStream;
  ltmpSM2: TMemoryStream;
  //--
  Lerr,Loutsizearr: string;
begin
  ltmpSM := nil;
  ltmpSM2 := nil;
  LtmpStream := nil;
  LCon := nil;
  LSp := nil;
  Result := False;
  Lerr := '';

  {$REGION '还原参数'}
  AParamSM.Position := 0;
  LSM := qkCopyStream(AParamSM,Lerr);//需要释放
  try
    if LSM = nil then Exit;
    LFDParams := qkStreamToParams(LSM,Lerr);//需要释放
    if LFDParams = nil then Exit;
  finally
    if LSM <> nil then
      LSM.Free;
    AErrMsg := Lerr;
  end;
  {$ENDREGION}


  try
    LCon := Factory_CreateCon(AConDefName,Lerr);
    if LCon = nil then Exit;
    LSp := Factory_CreateSp(LCon,Lerr);
    if LSp = nil then Exit;

    try
      LSp.Close;
      LSp.StoredProcName := ASpName;
      LSp.Prepare; //这里必须准备，否则没有参数
      {$REGION '参数赋值'}
      for I := 0 to LFDParams.Count - 1 do
      begin
        LTmpParam := LSp.Params.FindParam(LFDParams[I].Name.ToUpper);
        if LTmpParam <> nil then
        begin
          LTmpParam.Value := LFDParams[i].Value;
        end;
      end;
      {$ENDREGION}

      LSp.Open;

      {$REGION '将数据写入流中，多个数据用;号区分'}
      ltmpSM := TMemoryStream.Create; //这个需要释放
      ltmpSM2 := TMemoryStream.Create;
      LSp.SaveToStream(ltmpSM,TFDStorageFormat.sfBinary);
      loutsizearr := ltmpSM.Size.ToString;
      while True do
      begin
        LSp.NextRecordSet;
        if not LSp.Active then Break;
        LSp.FetchAll;
        LtmpStream := TMemoryStream.Create;//这个需要释放
        try
          LSp.SaveToStream(LtmpStream,TFDStorageFormat.sfBinary);
          LtmpStream.Position := 0;
          ltmpSM.CopyFrom(LtmpStream,LtmpStream.Size);
          loutsizearr := Loutsizearr + ';' + LtmpStream.Size.ToString;
        finally
          LtmpStream.Free;
        end;
      end;
      ltmpSM.Position := 0;
      if not qkCompressStream(ltmpSM,ltmpSM2,Lerr) then
        raise Exception.Create(Lerr);
      AOutDataSM := ltmpSM2;
      {$ENDREGION}

      {$REGION '参数回传赋值'}
      LSp.Close; //Autoclose设置为false时候，必须关闭才能回传参数。晕死！！！！
      LFDParams.Clear;
      LFDParams.Assign(LSp.Params);

      AParamSM := qkParamToStream(LFDParams,Lerr);//这里直接赋值不需要释放，初始传入和传出在哪里释放搞不清
      if AParamSM <> nil then
        AParamSM.Position := 0;
      {$ENDREGION}
      AOutDataSM.Position := 0;
      Result := True;
    except
      on E: Exception do
      begin
        Result := False;
        Lerr := SetErrMsg(e.Message);
        if ltmpSM2 <> nil then
          ltmpSM2.Free;
        if AOutDataSM <> nil then
        begin
          AOutDataSM := nil;
        end;
      end;
    end;
  finally
    if ltmpSM <> nil then
    begin
      ltmpSM.Free;
    end;
    if LFDParams <> nil then
    begin
      LFDParams.Clear;
      LFDParams.Free;
    end;
    if LSp <> nil then
    begin
      LSp.Close;
      LSp.Free;
    end;
    if LCon <> nil then
    begin
      LCon.Close;
      LCon.Free;
    end;
    AErrMsg := Lerr;
    AOutDataSizeArr := Loutsizearr;
  end;
end;

function TSvrMethods.Intf_SqlExec(const AConDefName, ASqlName: string;
  var AParamSM: TStream; out AErrMsg: OleVariant): Boolean;
var
  LCon: TFDCustomConnection;
  LQry: TFDQuery;
  LSqlTxt: string;
  //--参数用
  I: Integer;
  LTmpParam: TFDParam;
  LSM: TMemoryStream;
  LFDParams: TFDParams;
  Lerr: string;
begin
  LCon := nil;
  LQry := nil;
  Result := False;
  Lerr := '';

  {$REGION '还原参数'}
  AParamSM.Position := 0;
  LSM := qkCopyStream(AParamSM,Lerr);//需要释放
  try
    if LSM = nil then Exit;
    LFDParams := qkStreamToParams(LSM,Lerr);//需要释放
    if LFDParams = nil then Exit;
  finally
    if LSM <> nil then
      LSM.Free;
    AErrMsg := Lerr;
  end;
  {$ENDREGION}

  {$REGION '取得SQL'}
  if not dmContainer.FSqlTxtList.TryGetValue(UpperCase(AConDefName + '_' + ASqlName),LSqlTxt) then
  begin
    if LFDParams <> nil then
    begin
      LFDParams.Clear;
      LFDParams.Free;
    end;
    Lerr := SetErrMsg('不存在SQL命令： ' + UpperCase(AConDefName + '_' + ASqlName));
    AErrMsg := Lerr;
    Exit;
  end;
  {$ENDREGION}

  try
    LCon := Factory_CreateCon(AConDefName,Lerr);
    if LCon = nil then Exit;
    LQry := Factory_CreateQry(LCon,Lerr);
    if LQry = nil then Exit;

    try
      LQry.Close;
      LQry.SQL.Add(LSqlTxt);
      {$REGION '参数赋值'}
      for I := 0 to LFDParams.Count - 1 do
      begin
        LTmpParam := LQry.Params.FindParam(LFDParams[I].Name.ToUpper);
        if LTmpParam <> nil then
        begin
          LTmpParam.Value := LFDParams[i].Value;
        end;
      end;
      {$ENDREGION}
      LCon.StartTransaction;
      LQry.ExecSQL;
      LCon.Commit;
      {$REGION '参数回传赋值'}
      LQry.Close;////Autoclose设置为false时候，必须关闭才能回传参数。晕死！！！！
      LFDParams.Clear;
      LFDParams.Assign(LQry.Params);
      AParamSM := qkParamToStream(LFDParams,Lerr);//这里直接赋值不需要释放，初始传入和传出在哪里释放搞不清
      if AParamSM <> nil then
        AParamSM.Position := 0;
      {$ENDREGION}
      Result := True;
    except
      on E: Exception do
      begin
        if LCon.InTransaction then
          LCon.Rollback;
        Result := False;
        Lerr := SetErrMsg(e.Message);
      end;
    end;
  finally
    if LCon.InTransaction then
    begin
      LCon.Rollback;
    end;
    if LFDParams <> nil then
    begin
      LFDParams.Clear;
      LFDParams.Free;
    end;
    if LQry <> nil then
    begin
      LQry.Close;
      LQry.Free;
    end;
    if LCon <> nil then
    begin
      LCon.Close;
      LCon.Free;
    end;
    AErrMsg := Lerr;
  end;
end;

function TSvrMethods.Intf_SqlOpen(const AConDefName, ASqlName: string;
  var AParamSM: TStream;
  out AOutDataSM: TStream;
  out AOutDataSizeArr: OleVariant;
  out AErrMsg: OleVariant): Boolean;
var
  LCon: TFDCustomConnection;
  LQry: TFDQuery;
  LSqlTxt: string;
  //--参数用
  I: Integer;
  LTmpParam: TFDParam;
  LSM: TMemoryStream;
  LFDParams: TFDParams;
  //Data-用
  LtmpStream: TMemoryStream;
  ltmpSM: TMemoryStream;
  ltmpSM2: TMemoryStream;
  //--
  Lerr,LoutSizeArr: string;
begin
  ltmpSM := nil;
  ltmpSM2 := nil;
  LtmpStream := nil;
  LCon := nil;
  LQry := nil;
  Result := False;
  Lerr := '';

  {$REGION '还原参数'}
  AParamSM.Position := 0;
  LSM := qkCopyStream(AParamSM,Lerr);//需要释放
  try
    if LSM = nil then Exit;
    LFDParams := qkStreamToParams(LSM,Lerr);//需要释放
    if LFDParams = nil then Exit;
  finally
    if LSM <> nil then
      LSM.Free;
    AErrMsg := Lerr;
  end;
  {$ENDREGION}

  {$REGION '取得SQL'}
  if not dmContainer.FSqlTxtList.TryGetValue(UpperCase(AConDefName + '_' + ASqlName),LSqlTxt) then
  begin
    if LFDParams <> nil then
    begin
      LFDParams.Clear;
      LFDParams.Free;
    end;
    Lerr := SetErrMsg('不存在SQL命令： ' + UpperCase(AConDefName + '_' + ASqlName));
    AErrMsg := Lerr;
    Exit;
  end;
  {$ENDREGION}


  try
    LCon := Factory_CreateCon(AConDefName,Lerr);
    if LCon = nil then Exit;
    LQry := Factory_CreateQry(LCon,Lerr);
    if LQry = nil then Exit;

    try
      LQry.Close;
      LQry.SQL.Add(LSqlTxt);
      {$REGION '参数赋值'}
      for I := 0 to LFDParams.Count - 1 do
      begin
        LTmpParam := LQry.Params.FindParam(LFDParams[I].Name.ToUpper);
        if LTmpParam <> nil then
        begin
          LTmpParam.Value := LFDParams[i].Value;
        end;
      end;
      {$ENDREGION}

      LQry.Open();
      {$REGION '将数据写入流中，多个数据用;号区分'}
      ltmpSM := TMemoryStream.Create; //这个需要释放
      ltmpSM2 := TMemoryStream.Create;
      LQry.SaveToStream(ltmpSM,TFDStorageFormat.sfBinary);
      LoutSizeArr := ltmpSM.Size.ToString;
      while True do
      begin
        LQry.NextRecordSet;
        if not LQry.Active then Break;
        LQry.FetchAll;
        LtmpStream := TMemoryStream.Create;//这个需要释放
        try
          LQry.SaveToStream(LtmpStream,TFDStorageFormat.sfBinary);
          LtmpStream.Position := 0;
          ltmpSM.CopyFrom(LtmpStream,LtmpStream.Size);
          LoutSizeArr := LoutSizeArr + ';' + LtmpStream.Size.ToString;
        finally
          LtmpStream.Free;
        end;
      end;
      ltmpSM.Position := 0;
      if not qkCompressStream(ltmpSM,ltmpSM2,Lerr) then
        raise Exception.Create(Lerr);
      AOutDataSM := ltmpSM2;
      {$ENDREGION}

      {$REGION '参数回传赋值'}
      LQry.Close;////Autoclose设置为false时候，必须关闭才能回传参数。晕死！！！！
      LFDParams.Clear;
      LFDParams.Assign(LQry.Params);
      AParamSM := qkParamToStream(LFDParams,Lerr);//这里直接赋值不需要释放，初始传入和传出在哪里释放搞不清
      if AParamSM <> nil then
        AParamSM.Position := 0;
      {$ENDREGION}
      AOutDataSM.Position := 0;
      Result := True;
    except
      on E: Exception do
      begin
        Result := False;
        Lerr := SetErrMsg(e.Message);
        if ltmpSM2 <> nil then
          ltmpSM2.Free;
        if AOutDataSM <> nil then
        begin
          AOutDataSM := nil;
        end;
      end;
    end;
  finally
    if ltmpSM <> nil then
    begin
      ltmpSM.Free;
    end;
    if LFDParams <> nil then
    begin
      LFDParams.Clear;
      LFDParams.Free;
    end;
    if LQry <> nil then
    begin
      LQry.Close;
      LQry.Free;
    end;
    if LCon <> nil then
    begin
      LCon.Close;
      LCon.Free;
    end;
    AErrMsg := Lerr;
    AOutDataSizeArr := LoutSizeArr;
  end;
end;

function TSvrMethods.intf_UpdateRegCode(AConDefName, key1, key2: string;
  out AErrMsg: OleVariant): Boolean;
var
  LIni: TIniFile;
  Lerr: OleVariant;
  Lstr: AnsiString;
  lstr2: string;
  k1,k2: TArray<Byte>;
begin
  LIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Server.ini');
  try
    try
      LIni.WriteString('Register','Key1',key1);
      LIni.WriteString('Register','Key2',key2);

      k1 := BytesOf(key1);
      SetLength(k1,Length(k1)+1);
      k1[High(k1)] := 0;

      k2 := BytesOf(key2);
      SetLength(k2,Length(k2)+1);
      k2[High(k2)] := 0;

      Lstr := ansistrings.StrPas(func2(PAnsiChar(k2),PAnsiChar(k1)));
      lstr2 := string(Lstr);

      MonitorEnter(dmContainer.FSqlTxtList);
      try
        gRegEnableDate := qkStrToDateTime(lstr2);
      finally
        MonitorExit(dmContainer.FSqlTxtList);
      end;
    except on e: Exception do
    begin
      lerr := e.Message;
    end;
    end;
  finally
    lini.Free;
  end;
  Result := True;
end;


end.
