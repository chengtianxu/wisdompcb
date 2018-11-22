unit Calc;

interface
uses
  Math, StrUtils, ADODB;

type
  TCalc = class
  private
    FQry: TADOQuery;
    FCon: TADOConnection;
  public
    constructor Create(ACon: TADOConnection);
    destructor Destroy; override;
    function SqlOpen(ASql: string): Boolean;
    function SqlExec(ASql: string): Boolean;
    function GetTableValue(ATableStr: string; ARkey10: string): string;
    function ReplaceParamStr(AOldStr: string;var ANewStr: string;ADataSet: TADODataSet): Boolean;
    function ReplaceTableToValue(AOldStr: string; var ANewStr: string;ARkey10: string): Boolean;
    function ReplaceIFStr(AOldStr: string;var ANewStr: string): Boolean;
    function ReplaceNumStr(AOldStr: string;Var ANewStr: string;ANum: Integer): Boolean;
    function ReplaceHasDept(AOldStr: string;var ANewStr: string;ARkey25: string): Boolean;
    function ReplaceHasParam(AOldStr: string;var ANewStr: string;ADataset: TADODataSet): Boolean;
    function CalcStr(AStr: string;ANum: Integer;ARfqParam: TADODataSet;ARKey25: string;Arkey10: string = '0'): string;
    function ReversePos(SubStr, S: String): Integer;


  end;

implementation

uses
  Windows, Classes, SysUtils, Dialogs, damo, DB;


{ TCalc }

function TCalc.CalcStr(AStr: string;ANum: Integer;ARfqParam: TADODataSet;ARKey25: string;Arkey10: string = '0'): string;
var
  LNewStr: string;
begin
  ReplaceHasDept(AStr,LNewStr,ARKey25);
  ReplaceHasParam(LNewStr,LNewStr,ARfqParam);
  ReplaceNumStr(LNewStr,LNewStr,ANum);
  if not ReplaceParamStr(LNewStr,LNewStr,ARfqParam) then Exit;
  ReplaceTableToValue(LNewStr,LNewStr,Arkey10);
  ReplaceIFStr(LNewStr,LNewStr);
  if LNewStr = '' then
    Result := '0'
  else
  begin
    if SqlOpen('select ' + LNewStr + ' as ret ') then
      Result := FQry.fieldbyname('ret').AsString;
  end;
end;

constructor TCalc.Create(ACon: TADOConnection);
begin
  FQry := TADOQuery.Create(nil);
  FCon := ACon;
  FQry.Connection := FCon;
end;

destructor TCalc.Destroy;
begin
  FQry.Close;
  FQry.Free;
  inherited;
end;

function TCalc.GetTableValue(ATableStr: string; ARkey10: string): string;
var
  X,Y: string;
  LTableName: string;
  LSql: string;
begin
//[Table(x,y)]
  LTableName := Copy(ATableStr,2,Pos('(',ATableStr)-2);
  X := Copy(ATableStr,Pos('(',ATableStr)+1,Pos(',',ATableStr) - Pos('(',ATableStr)-1);
  Y := Copy(ATableStr,Pos(',',ATableStr)+1,Length(ATableStr)-2 - Pos(',',ATableStr));
  LSql := 'select ' + X + ' as tvalue ';
  SqlOpen(LSql);
  x := FQry.fieldbyname('tvalue').AsString;
  LSql := 'select ' + Y + ' as tvalue ';
  SqlOpen(LSql);
  Y := FQry.fieldbyname('tvalue').AsString;

  LSql := 'select Vtype from data0311 where TName=' + QuotedStr(LTableName) + ' and custom_ptr = ' + ARkey10;
  SqlOpen(LSql);
  //如果空取没有客户的
  if FQry.IsEmpty then
  begin
    LSql := 'select Vtype from data0311 where TName=' + QuotedStr(LTableName);
    SqlOpen(LSql);
  end;
  
  if FQry.FieldByName('Vtype').AsInteger = 0 then
  //精确
  begin
    LSql := 'select TValue from data0312 where Ptr_311 = ' + quotedstr(LTableName) + ' and custom_ptr = ' + ARkey10 +
            ' and X=' + QuotedStr(X) +
            ' and Y=' + QuotedStr(Y);
    SqlOpen(LSql);
    if FQry.IsEmpty then
    begin
      LSql := 'select TValue from data0312 where Ptr_311 = ' + quotedstr(LTableName) + 
              ' and X=' + QuotedStr(X) +
              ' and Y=' + QuotedStr(Y);
      SqlOpen(LSql);
    end;
    Result := FQry.fieldbyname('TValue').AsString;
  end else
  //范围
  begin
    LSql := 'select TValue from data0312 where Ptr_311 = ' + quotedstr(LTableName) + ' and custom_ptr = ' + ARkey10 +
            ' and cast(X as float)>=' + X +
            ' and cast(Y as float)>=' + Y +
            ' order by Cell_Col,Cell_Row asc';
    SqlOpen(LSql);
    if FQry.IsEmpty then
    begin
      LSql := 'select TValue from data0312 where Ptr_311 = ' + quotedstr(LTableName) + 
              ' and cast(X as float)>=' + X +
              ' and cast(Y as float)>=' + Y +
              ' order by Cell_Col,Cell_Row asc';
      SqlOpen(LSql);
    end;
    Result := FQry.fieldbyname('TValue').AsString;
  end;
end;

function TCalc.ReplaceHasDept(AOldStr: string;
  var ANewStr: string;ARkey25: string): Boolean;
var
  LStr: string;
  LDeptCode: string;
  LBegin: boolean;
  I: Integer;
  LSql: string;
  LValue: string;
begin
  Result := True;
  LStr := UpperCase(AOldStr);
  LBegin := False;
  LDeptCode := '';
  while Pos('HAS[DEPT.',LStr) > 0 do
  begin
    for I := Pos('HAS[DEPT.',LStr) to Length(LStr) do
    begin
      if LStr[I] = '.' then
      begin
        LBegin := True;
        Continue;
      end;
      if LStr[I] = ']' then
      begin
        Break;
      end;
      if LBegin then
      begin
        LDeptCode := LDeptCode + LStr[I];
      end;
    end;
    LSql := 'select 1 from data0025 d25 ' +
            ' inner join data0038 d38 on d25.rkey = d38.source_ptr ' +
            ' inner join data0034 d34 on d34.rkey = d38.dept_ptr ' +
            ' where d25.rkey = ' + ARkey25 + ' and d34.dept_code = ' + QuotedStr(LDeptCode);
    if SqlOpen(LSql) then
    begin
      if FQry.IsEmpty then LValue := '0' else LValue := '1';
    end;
    LStr := StringReplace(LStr,'HAS[DEPT.' + LDeptCode + ']',LValue,[rfReplaceAll,rfIgnoreCase]);
  end;
  ANewStr := LStr;
end;

function TCalc.ReplaceHasParam(AOldStr: string; var ANewStr: string;
  ADataset: TADODataSet): Boolean;
var
  LStr: string;
  LParamCode: string;
  LBegin: boolean;
  I: Integer;
  LSql: string;
  LValue: string;
  LEvent: TDataSetNotifyEvent;
begin
  Result := True;
  LStr := UpperCase(AOldStr);
  LBegin := False;
  LParamCode := '';
  ADataset.DisableControls;
  I := ADataset.RecNo;  
  while Pos('HAS[MI.',LStr) > 0 do
  begin
    LValue := '0';
    for I := Pos('HAS[MI.',LStr) to Length(LStr) do
    begin
      if LStr[I] = '.' then
      begin
        LBegin := True;
        Continue;
      end;
      if LStr[I] = ']' then
      begin
        Break;
      end;
      if LBegin then
      begin
        LParamCode := LParamCode + LStr[I];
      end;
    end;

    if not ADataset.IsEmpty then
    begin
      LEvent := ADataset.AfterScroll;
      ADataset.AfterScroll := nil;
      try
      ADataset.First;
      while not ADataset.Eof do
      begin
        if UpperCase(ADataset.FieldByName('PARAMETER_NAME').AsString)= LParamCode then
        begin
          LValue := '1';
          Break;
        end;
        ADataset.Next;
      end;
      finally
        ADataset.AfterScroll := LEvent;
      end;
    end;
    LStr := StringReplace(LStr,'HAS[MI.' + LParamCode + ']',LValue,[rfReplaceAll,rfIgnoreCase]);
  end;
  ADataset.RecNo := I;
  ADataset.EnableControls;  
  ANewStr := LStr;
end;

function TCalc.ReplaceIFStr(AOldStr: string;var ANewStr: string): Boolean;
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
    Result := True;
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
            BFalseStr := False;
            LIFPart := 'IF{' + LCmpStr + ',' + LTrueStr + ',' + LFalseStr + '}';
            SqlOpen('select 1 where ' + LCmpStr);
            if not FQry.IsEmpty then
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

function TCalc.ReplaceNumStr(AOldStr: string;
  var ANewStr: string;ANum: Integer): Boolean;
var
  LStr: string;
begin

  LStr := UpperCase(AOldStr);
  if Pos('数量',AOldStr) > 0 then
  begin
    LStr := StringReplace(LStr,'数量',IntToStr(ANum),[rfReplaceAll,rfIgnoreCase]);
  end;
  ANewStr := LStr;
end;

function TCalc.ReplaceParamStr(AOldStr: string;var ANewStr: string;ADataset: TADODataSet): Boolean;
var
  LSql: string;
  LStr: string;
  LtmpS: string;
  I,n: Integer;
  nRecNO: Integer;
  LEvent: TDataSetNotifyEvent;
begin
  Result := True;
  LStr := UpperCase(AOldStr);
  if not ADataSet.IsEmpty then
  begin
    try
      ADataSet.DisableControls;
      nRecNO := ADataSet.RecNo;
      LEvent := ADataSet.AfterScroll;
      ADataSet.AfterScroll := nil;
      ADataSet.First;

      n := Pos('MI.',LStr);
      while n > 0 do
      begin
        LtmpS := '';
        for I := n + 3 to Length(LStr) - 1 do
        begin
          if LStr[I] in ['+','-','*','/',' ',',','(',')','[',']','{','}','>','<','=',#39] then Break;
          LtmpS := LtmpS + LStr[i];
        end;

        if dm.aqParamName.locate('PARAMETER_NAME',LtmpS,[]) then
        begin
          if ADataSet.Locate('param_ptr',dm.aqParamName.fieldbyname('rkey').asinteger,[]) then
          begin
            if Trim(ADataSet.fieldbyname('Param_Value').AsString) = '' then
            begin
              ShowMessage('公式中用到的工程参数：' + ADataSet.FieldByName('PARAMETER_NAME').AsString + ' 没有填写');
              Exit;
            end;
            LStr := StringReplace(LStr,'MI.' + ADataSet.FieldByName('PARAMETER_NAME').AsString,ADataSet.fieldbyname('Param_Value').AsString,[rfReplaceAll, rfIgnoreCase]);
          end else
          begin
            ShowMessage('公式需要' + LtmpS + ' 参数来进行计算');
            Result := False;
            Break;
          end;
        end else
        begin
          ShowMessage('公式需要' + LtmpS + ' 参数来进行计算');
          Result := False;
          Break;      
        end;
        n := Pos('MI.',LStr);
      end;
    finally
      ADataSet.RecNo := nRecNO;
      ADataSet.AfterScroll := LEvent;
      ADataSet.EnableControls;    
    end
  end;
  ANewStr := LStr;
end;

function TCalc.ReplaceTableToValue(AOldStr: string;
  var ANewStr: string;ARkey10: string): Boolean;
var
  LTableStr: string;
  I: Integer;
  bTable: Boolean;
  LtmpS: string;
//  LRetStr: string;
begin
  bTable := False;
  LTableStr := '';
  for I := 1 to Length(AOldStr) do
  begin
    if not bTable then LTableStr := '';
    if AOldStr[I] = '[' then bTable := True;
    if bTable = True then
    begin
      LTableStr := LTableStr + AOldStr[I];
      if AOldStr[I] = ']' then
      begin
        bTable := False;
        LtmpS := GetTableValue(LTableStr, ARkey10);
        ANewStr := StringReplace(AOldStr,LTableStr,LtmpS,[rfReplaceAll,rfIgnoreCase]);
        LtmpS := ANewStr;
        ReplaceTableToValue(LtmpS,ANewStr,ARkey10);
        Break;
      end;
    end;
  end;
  Result := True;
end;

function TCalc.ReversePos(SubStr, S: String): Integer;
var
  i : Integer;
begin
  i := Pos(ReverseString(SubStr), ReverseString(S));
  if i > 0 then i := Length(S) - i - Length(SubStr) + 2;
  Result := i;
end;

function TCalc.SqlExec(ASql: string): Boolean;
begin
  try
    FQry.Close;
    FQry.SQL.Clear;
    FQry.SQL.Add(ASql);
    FQry.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

function TCalc.SqlOpen(ASql: string): Boolean;
begin
  try
    FQry.Close;
    FQry.SQL.Clear;
    FQry.SQL.Add(ASql);
    FQry.Open;
    Result := True;
  except
    Result := False;
  end;
end;
end.
