unit CalcImpl;

interface
uses
  CalcIntf, DataIntf, Datasnap.DBClient, System.SysUtils, Data.db, DM, Data.Win.ADODB,
  System.Classes;

type


  TCalc = class(TInterfacedObject, ICalc)
  private
    FCds: TClientDataSet;
    FTmp: ITmp;
    FErrStr: string;
  public
    function GetTableValue(ATableStr: string;var Ret: Boolean): string;
    function ReplaceParamStr(AOldStr: string;ADataSet: TDataSet;AParamType: TCalcParamTpye;var Ret: Boolean): string;
    function ReplaceTableToValue(AOldStr: string;var Ret: Boolean): string;
    function ReplaceSqlToValue(AOldStr: string; var Ret: Boolean): string;
    function ReplaceIFStr(AOldStr: string;var ANewStr: string): Boolean;
    constructor Create();
    destructor Destroy; override;
    function ReversePos(SubStr, S: String): Integer;
    function CalcStr(AOldStr: string; var ANewStr: string; AgParamDs: TDataSet; ADeptParamDs: TDataSet;ABomParamDs: TDataSet;out ErrMsg: string):Boolean;
  end;

implementation

uses
  DBImpl, Vcl.Dialogs, System.StrUtils;

{ TCalc }

function TCalc.CalcStr(AOldStr: string; var ANewStr: string;AgParamDs: TDataSet; ADeptParamDs: TDataSet;ABomParamDs: TDataSet;out ErrMsg: string): Boolean;
var
  Ltmps: string;
  LRet: Boolean;
begin
  Result := False;
  try
  //全局参数
  ANewStr := '';
  Ltmps := ReplaceParamStr(AOldStr,AgParamDs,TCalcParamTpye.ptQuanJu,LRet);
  if not LRet then
  begin
    ErrMsg := FErrStr;
    Exit;
  end;
  ANewStr := Ltmps;

  //工序参数
  Ltmps := ReplaceParamStr(Ltmps,ADeptParamDs,TCalcParamTpye.PtDept,LRet);
  if not LRet then
  begin
    ErrMsg := FErrStr;
    Exit;
  end;
  ANewStr := Ltmps;

  //BOM参数
  Ltmps := ReplaceParamStr(Ltmps,ABomParamDs,TCalcParamTpye.PtBom,LRet);
  if not LRet then
  begin
    ErrMsg := FErrStr;
    Exit;
  end;
  ANewStr := Ltmps;

  //表格
  Ltmps := ReplaceTableToValue(Ltmps,LRet);
  if not LRet then
  begin
    ErrMsg := FErrStr;
    Exit;
  end;
  ANewStr := Ltmps;

  //脚本
  ltmps := ReplaceSqlToValue(Ltmps, LRet);
  if not LRet then
  begin
    ErrMsg := FErrStr;
    Exit;
  end;
  ANewStr := Ltmps;


  //IF
  if not ReplaceIFStr(ANewStr,Ltmps) then
  begin
    ErrMsg := FErrStr;
    Exit;
  end
  else
    ANewStr := Ltmps;

  if ANewStr = '' then
    ANewStr := '0'
  else
  begin
    if not FTmp.SqlOpen('select cast(' + ANewStr + ' as varchar(200)) as ret ',FCds) then
    begin
      Result := False;
      ShowMessage(ANewStr + ' 错误');
      Exit;
    end else
      ANewStr := FCds.fieldbyname('ret').AsString;
  end;
  except
    on E: Exception do
    begin
      Result := False;
      ErrMsg := e.Message;
      Exit;
    end;
  end;
  Result := True;
end;

constructor TCalc.Create;
begin
  FCds := TClientDataSet.Create(nil);
  FTmp := TTmp.Create;
end;

destructor TCalc.Destroy;
begin
  FCds.Free;
  inherited;
end;

function TCalc.GetTableValue(ATableStr: string;var Ret: Boolean): string;
var
  LXParam,LYParam: string;
  LTableName: string;
  LSql: string;
  LIDKey12: string;
  LXType,LYtype,LXVType,LYVType: Integer;
  LTmpFloat: Double;
begin
//[Table(LXParam,LYParam)]
  Ret := False;
  try
    LTableName := Copy(ATableStr,2,Pos('(',ATableStr)-2);
    if FTmp.SqlOpen('select idkey,XType,YType,XVType,YVType from bomprice12 where TName=' + QuotedStr(LTableName),FCds) then
    begin
      if FCds.IsEmpty then
      begin
        FErrStr := '不存在表:  ' + LTableName;
        Exit;
      end else
      begin
        LXType := FCds.FieldByName('XType').AsInteger;
        LYtype := FCds.FieldByName('YType').AsInteger;
        LXVType := FCds.FieldByName('XVType').AsInteger;
        LYVType := FCds.FieldByName('YVType').AsInteger;
        LIDKey12 := FCds.FieldByName('idkey').AsString;
      end;
    end else
    begin
      FErrStr := '取表名字出错 ' + LTableName;
      Exit;
    end;

    LXParam := Copy(ATableStr,Pos('(',ATableStr)+1,Pos(',',ATableStr) - Pos('(',ATableStr)-1);
    LYParam := Copy(ATableStr,Pos(',',ATableStr)+1,Length(ATableStr)-2 - Pos(',',ATableStr));

    if LXType = 1 then LXParam := QuotedStr(LXParam);
    LSql := 'select ' + LXParam + ' as tvalue ';
    if not FTmp.SqlOpen(LSql, FCds) then
    begin
      FErrStr := '表:' + ATableStr + ' 的X参数 ' + LXParam  + '  参数不正确' + #13 + LSql;
      Exit;
    end else
      LXParam := FCds.fieldbyname('tvalue').AsString;

    if LYType = 1 then LYParam := QuotedStr(LYParam);
    LSql := 'select ' + LYParam + ' as tvalue ';
    if not FTmp.SqlOpen(LSql,FCds) then
    begin
      FErrStr := '表:' + ATableStr + ' 的Y参数 ' + LYParam  + '  参数不正确' + #13 + LSql;
      Exit;
    end else
      LYParam := FCds.fieldbyname('tvalue').AsString;


    LSql := 'select TValue from bomprice13 where BP12_ptr = ' + quotedstr(LIDKey12);
    case LXType of
      0://数字
      begin
        LTmpFloat := StrToFloatDef(LXParam,-999999);
        if LTmpFloat = 999999 then
        begin
          FErrStr := '表:' + ATableStr + ' 的X参数 ' + LXParam  + '  应该为数字参数';
          Exit;
        end;

        case LXVType of
          0: //精确
          begin
            LSql := LSql + ' and cast(X as float) = ' + LXParam;
          end;
          1: //范围
          begin
            LSql := LSql + ' and cast(X as float) >=' + LXParam;
          end;
        end;

      end;
      1://字符
      begin
        if LXVType = 1 then
        begin
          FErrStr := '表:' + ATableStr + ' 的X参数 ' + LXParam  + '  类型必须为数字才能范围取值，请到BOM成本中心修改';
          Exit;
        end;
        LSql := LSql + ' and X = ' + QuotedStr(LXParam);
      end;

    end;
    case LYType of
      0://数字
      begin
        LTmpFloat := StrToFloatDef(LYParam,-999999);
        if LTmpFloat = 999999 then
        begin
          FErrStr := '表:' + ATableStr + ' 的Y参数 ' + LYParam  + '  应该为数字参数';
          Exit;
        end;

        case LYVType of
          0: //精确
          begin
            LSql := LSql + ' and cast(Y as float) = ' + LYParam;
          end;
          1: //范围
          begin
            LSql := LSql + ' and cast(Y as float) >=' + LYParam;
          end;
        end;

      end;
      1://字符
      begin
        if LYVType = 1 then
        begin
          FErrStr := '表:' + ATableStr + ' 的Y参数 ' + LYParam  + '  类型必须为数字才能范围取值，请到BOM成本中心修改';
          Exit;
        end;
        LSql := LSql + ' and Y = ' + QuotedStr(LYParam);
      end;
    end;

    LSql := LSql + ' order by Cell_Col,Cell_Row asc';
    if FTmp.SqlOpen(LSql,FCds) then
    begin
      if FCds.IsEmpty then
      begin
        FErrStr := ' 表公式: ' + ATableStr + ' 没有找到对应的值 取值失败';
        Exit;
      end else
        Result := FCds.fieldbyname('TValue').AsString;
    end else
    begin
      FErrStr := '表公式取值时候没有运行失败' + #13 + lsql;
      Exit;
    end;

    ret := True;
  except
    on E: Exception do
    begin
      FErrStr := ' 表公式: ' + ATableStr + ' 出现未知错误 ' + #13 + E.Message;
    end;

  end;
end;


function TCalc.ReplaceIFStr(AOldStr: string; var ANewStr: string): Boolean;
var
  LTrueStr: string;
  LFalseStr: string;
  I: Integer;
  LTmpStr: string;
  LCmpStr: string;
  bCmpStr,btrueStr,BFalseStr: Boolean;
  bIfStart: Boolean;
  LIFPart: string;
  LReverseIfPos: Integer;
begin
  LReverseIfPos := ReversePos('IF{',AOldStr);
  while LReverseIfPos > 0 do
  begin

    LTmpStr := '';
    bIfStart := False;
    bCmpStr := False;
    btrueStr := False;
    BFalseStr := False;

    LTrueStr := '';
    LFalseStr := '';
    LCmpStr := '';
    LIFPart := '';

    for I := LReverseIfPos to Length(AOldStr) do
    begin
      if AOldStr[I] = '{' then
      begin
        bIfStart := True;
        bCmpStr := True;
        Continue;
      end;

      if bIfStart then
      begin

        if bCmpStr then
        begin
          if AOldStr[I] <> ',' then
            LCmpStr := LCmpStr + AOldStr[I]
          else
          begin
            bCmpStr := False;
            btrueStr := True;
          end;
        end else
        if btrueStr then
        begin
          if AOldStr[I] <> ',' then
            LTrueStr := LTrueStr + AOldStr[I]
          else
          begin
            btrueStr := False;
            BFalseStr := True;
          end;
        end else
        if BFalseStr then
        begin
          if AOldStr[I] <> '}' then
            LFalseStr := LFalseStr + AOldStr[I]
          else
          begin

            LIFPart := 'IF{' + LCmpStr + ',' + LTrueStr + ',' + LFalseStr + '}';
            FCds.Data := FTmp.SqlOpen('select 1 where ' + LCmpStr);
            if not FCds.IsEmpty then
              ANewStr := StringReplace(AOldStr,LIFPart,LTrueStr,[rfReplaceAll,rfIgnoreCase])
            else
              ANewStr := StringReplace(AOldStr,LIFPart,LFalseStr,[rfReplaceAll,rfIgnoreCase]);

            AOldStr := ANewStr;
            Break;
          end;
        end;
      end;
    end;
    LReverseIfPos := ReversePos('IF{',AOldStr);
  end;
  Result := True;
end;

function TCalc.ReplaceParamStr(AOldStr: string; ADataSet: TDataSet;AParamType: TCalcParamTpye;
  var Ret: Boolean): string;
var
  LStr: string;
  LtmpS: string;
  I,n: Integer;
  nRecNO: Integer;
  LEvent: TDataSetNotifyEvent;
  LHead: string;
  LArrStr: TStringList;
  ltmp: string;
begin
  Ret := False;

  LStr := UpperCase(AOldStr);
  if ADataSet = nil then
  begin
    Result := LStr;
    Ret := True;
    Exit;
  end;
  if not ADataSet.IsEmpty then
  begin
    LArrStr := TStringList.Create;
    ADataSet.DisableControls;
    nRecNO := ADataSet.RecNo;
    LEvent := ADataSet.AfterScroll;
    ADataSet.AfterScroll := nil;
    try
      ADataSet.First;
      case AParamType of
        ptQuanJu: LHead := 'G.';
        PtDept: LHead := 'P.';
        PtBom: LHead := 'B.';
      end;
      n := Pos(LHead,LStr);
      while n > 0 do
      begin
        LtmpS := '';
        for I := n + 2 to Length(LStr) do
        begin
          if CharInSet(LStr[I],['+','-','*','/',' ',',','(',')','[',']','{','}','>','<','=',#39]) then Break;
          LtmpS := LtmpS + LStr[i];
        end;
        if dm1.cdsLookup278.locate('PARAMETER_NAME',LtmpS,[loCaseInsensitive]) then
        begin
          if ADataSet.Locate('d278_ptr',dm1.cdsLookup278.fieldbyname('rkey').asinteger,[loCaseInsensitive]) then
          begin
            if Trim(ADataSet.fieldbyname('Param_Value').AsString) = '' then
            begin
              case AParamType of
                //--此处本来可以不用注释，为了SQL脚本客户代码为空注释的
                //ptQuanJu: FErrStr := '请填写全局参数' + LtmpS + '值';
                PtDept:
                begin
                  FErrStr := ('请填写工序参数' + LtmpS + '值');
                  Exit;
                end;
                PtBom:
                begin
                  FErrStr := ('材料的IES参数' + LtmpS + '值 为空');
                  Exit;
                end;
              end;
            end;

            {$REGION ''}

            LArrStr.Clear;
            ltmp := '';
            for I := 1 to Length(LStr) do
            begin
              if CharInSet(lstr[i],['+','-','*','/',' ',',','(',')','[',']','{','}','>','<','=',#39]) then
              begin
                if ltmp <> '' then LArrStr.Add(ltmp);
                LArrStr.Add(LStr[i]);
                ltmp := '';
              end else
                ltmp := ltmp + LStr[i];

              if i = Length(LStr) then
                LArrStr.Add(ltmp);
            end;

            for I := 0 to LArrStr.Count - 1 do
            begin
              if LArrStr[i] = LHead + ltmps then
                LArrStr[i] := ADataSet.fieldbyname('Param_Value').AsString;
            end;

            lstr := '';
            for I := 0 to LArrStr.Count - 1 do
            begin
              LStr :=  LStr + LArrStr[i];
            end;

            {$ENDREGION}

            //LStr := LArrStr.Text;
            //LStr := StringReplace(LStr,LHead + LtmpS,ADataSet.fieldbyname('Param_Value').AsString,[rfReplaceAll, rfIgnoreCase]);
          end else
          begin
            case AParamType of
              ptQuanJu: FErrStr := ('缺少全局参数' + LtmpS + ' ');
              PtDept: FErrStr := ('缺少工序参数' + LtmpS + ' ');
              PtBom: FErrStr := ('缺少材料的IES参数' + LtmpS + ' ');
            end;
            Exit;
          end;
        end else
        begin
          case AParamType of
            ptQuanJu: FErrStr := ('公式需要全局参数' + LtmpS + ' 来进行计算');
            PtDept: FErrStr := ('公式需要工序参数' + LtmpS + ' 来进行计算');
            PtBom: FErrStr := ('公式需要材料IES参数' + LtmpS + ' 来进行计算');
          end;
          Exit;
        end;
        n := Pos(LHead,LStr);
      end;
      //ShowMessage(LStr);
    finally
      ADataSet.RecNo := nRecNO;
      ADataSet.AfterScroll := LEvent;
      ADataSet.EnableControls;
      LArrStr.Free;
    end
  end;
  Ret := True;
  Result := LStr;
end;

function TCalc.ReplaceTableToValue(AOldStr: string; var Ret: Boolean): string;
var
  LTableStr: string;
  I: Integer;
  bTable: Boolean;
  LtmpS: string;
  LRet: Boolean;
//  LRetStr: string;
begin
  Ret := False;
  bTable := False;
  LTableStr := '';
  Result := AOldStr;
  for I := 1 to Length(AOldStr) do
  begin
    if not bTable then LTableStr := '';
    if AOldStr[I] = '[' then bTable := True;
    if bTable = True then
    begin
      LTableStr := LTableStr + AOldStr[I];
      if AOldStr[I] = ']' then
      begin
        LtmpS := GetTableValue(LTableStr, LRet);
        if not LRet then Exit;
        Result := StringReplace(AOldStr,LTableStr,LtmpS,[rfReplaceAll,rfIgnoreCase]);
        LtmpS := Result;
        Result := ReplaceTableToValue(LtmpS,LRet);
        if not LRet then Exit;
        Break;
      end;
    end;
  end;
  Ret := True;
end;



function TCalc.ReplaceSqlToValue(AOldStr: string; var Ret: Boolean): string;
  function ParseCode(AStr: string;out ASqlName: string; out AParamArr: TArray<string>): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    for I := 1 to Length(AStr) do
    begin
      if AStr[I] = '(' then
      begin
        ASqlName := Copy(AStr,1,I-1);
        AParamArr := AStr.Substring(I,astr.Length - I-1).Split([',']);
      end;
      if AStr[High(AStr)] <> ')' then
      begin
        Exit;
      end;
    end;
    if ASqlName = '' then Exit;
    Result := True;
  end;
  function ParseSqlValue(ASqlName: string;AParamArr: TArray<string>;out ARet: Boolean): string;
  var
    LQry: TADOQuery;
    LCMD: string;
    I: Integer;
  begin
    ARet := False;
    LQry := TADOQuery.Create(nil);
    LQry.Connection := dm1.con1;
    try

      LQry.SQL.Text := 'select * from BompriceSQL where sqlname = ' + QuotedStr(ASqlName);
      try
        LQry.Open;
      except
        Exit;
      end;

      if LQry.IsEmpty then
      begin
        Exit;
      end;

      LCMD := UpperCase(LQry.FieldByName('SqlText').AsString);
      for I := 0 to Length(aparamarr)-1 do
      begin
        LCMD := LCMD.Replace(':P'+ IntToStr(I),AParamArr[I],[rfReplaceAll]);
      end;

      LQry.Close;
      LQry.SQL.Text := LCMD;
      try
        LQry.Open;
      except
        Exit;
      end;

      if not LQry.IsEmpty then
        Result := LQry.Fields[0].AsString
      else
        Result := '';
      ARet := True;

    finally
      LQry.Free;
    end;

  end;

var
  LSqlname: string;
  LParamArr: TArray<string>;

  LSqlArr: TArray<string>;
  I: Integer;
  tmpN: Integer;
  LRet: Boolean;
  LSqlRet: string;
begin
  //Result := False;
  tmpN := 0;
  SetLength(LSqlArr,1);
  Result := AOldStr;
  for I := 1 to Length(AOldStr) do
  begin
    if AOldStr[I] = '$' then
    begin
      Inc(tmpN);
      if tmpN mod 2 = 0 then
      begin
        if ParseCode(lsqlArr[high(lsqlarr)],LSqlname,LParamArr) then
        begin
          LSqlRet := ParseSqlValue(LSqlname,LParamArr,LRet);
          if LRet then
          begin
            Result := Result.Replace('$' + lsqlArr[high(lsqlarr)] +'$',LSqlRet,[rfReplaceAll]);
          end else
          begin
            FErrStr := lsqlArr[high(lsqlarr)] + '  SQL 脚本运行出错 ';
            Exit;
          end;
        end else
        begin
          FErrStr := lsqlArr[high(lsqlarr)] + '  SQL脚本解析错误 ';
          Exit;
        end;
        SetLength(LSqlArr,Length(LSqlArr) + 1);
        tmpN := 0;
      end else
      begin
      end;
    end;
    if (AOldStr[I] <> '$') and (tmpN > 0) then
      LSqlArr[High(LSqlArr)] := LSqlArr[High(LSqlArr)] + AOldStr[I];
  end;

end;


function TCalc.ReversePos(SubStr, S: String): Integer;
var
  i : Integer;
begin
  i := Pos(ReverseString(SubStr), ReverseString(S));
  if i > 0 then i := Length(S) - i - Length(SubStr) + 2;
  Result := i;
end;

end.
