unit qkScript;

interface
uses
  System.SysUtils,System.Generics.Collections,System.Classes,
  Vcl.Dialogs,
  qkSvrIntf.ClientIntf,
  FireDAC.Comp.Client,
  IMPORT_COMMON,
  qkIMPORT,
  PaxRunner,
  PaxProgram,
  PaxRegister,
  PaxCompiler;


type
  TqkScriptRegisterGlobVarCallBack = reference to function (AUnit: string;out VarName: string;out pVar: Pointer): Boolean ;
  TqkScript = class
  public
    FRet: string;
    Fmt1,fmt2: TFDMemTable;
    FDsScriptFunc: TFDMemTable;
    PaxCompiler1: TPaxCompiler;
    PaxPascalLanguage1: TPaxPascalLanguage;
    PaxProgram1: TPaxProgram;
    FRegisterGCallBack: TqkScriptRegisterGlobVarCallBack;//use的回调函数
    FUseArr: TArray<string>;
    FFuncUseForArr: TArray<Integer>;
    function PaxCompiler1UsedUnit(Sender: TPaxCompiler; const UnitName: string;
      var SourceCode: string): Boolean;
    procedure PaxCompiler1ImportUnit(Sender: TPaxCompiler; Id: Integer;
      const AFullName: string);
  private
    procedure AddUses(AUseArr: TArray<string>);  //step1：第一步先添加USER;通过FUserArr
    procedure AddQkFunc(AUseFor: TArray<Integer>);//Step2注册函数
    procedure AddCode(ACode: string);//step3: 添加code
    function Exec: Boolean;//step4：执行脚本
  public
    constructor Create();
    destructor Destroy; override;
    procedure Init;
    function ExecFunc(AFunc: string;out outRet: string): Boolean;

  end;





implementation


{ TqkScript }

procedure TqkScript.AddCode(ACode: string);
begin
  PaxCompiler1.AddCode('0',ACode);
end;


procedure TqkScript.AddQkFunc(AUseFor: TArray<Integer>);
var
  I: Integer;
begin
  for I := 0 to Length(AUseFor) - 1 do
  begin
    FDsScriptFunc.Filter := 'UseFor=' + AUseFor[I].ToString;
    FDsScriptFunc.Filtered := True;
    FDsScriptFunc.First;
    while not FDsScriptFunc.Eof do
    begin
      PaxCompiler1.AddCode('0',FDsScriptFunc.FieldByName('FuncCode').AsString);
      FDsScriptFunc.Next;
    end;
  end;
end;

procedure TqkScript.AddUses(AUseArr: TArray<string>);
var
  I: Integer;
  LStr: string;
begin
  if length(AUseArr) = 0 then Exit;

  PaxCompiler1.AddCode('0','Uses ');
  for I := 0 to Length(AUseArr) - 1 do
  begin
    if LStr <> '' then
      LStr := LStr + ',' + AUseArr[I]
    else
      LStr := LStr + AUseArr[I];
  end;
  LStr := LStr + ';';
  PaxCompiler1.AddCode('0',LStr);
end;

constructor TqkScript.Create;
var
  LDsList: TList<TFDMemTable>;
begin
  Fmt1 := TFDMemTable.Create(nil);
  fmt2 := TFDMemTable.Create(nil);
  PaxCompiler1 := TPaxCompiler.Create(nil);
  PaxPascalLanguage1 := TPaxPascalLanguage.Create(nil);
  PaxProgram1 := TPaxProgram.Create(nil);
  PaxCompiler1.OnUsedUnit := PaxCompiler1UsedUnit;
  PaxCompiler1.OnImportUnit := PaxCompiler1ImportUnit;

  //读取定义的函数
  FDsScriptFunc := TFDMemTable.Create(nil);
  LDsList := dmSvrIntf.SqlOpen('21',nil);
  if LDsList <> nil then
  begin
    FDsScriptFunc.Data := LdsList[0].Data;
    FDsScriptFunc.MergeChangeLog;
    LDsList[0].Free;
    LDsList.Free;
  end;

end;

destructor TqkScript.Destroy;
begin
  PaxCompiler1.Free;
  PaxPascalLanguage1.Free;
  PaxProgram1.Free;
  FDsScriptFunc.Free;
  Fmt1.Free;
  fmt2.Free;
  inherited;
end;

function TqkScript.Exec: Boolean;
begin
  Result := False;
  if PaxCompiler1.Compile(PaxProgram1) then
  begin
    PaxProgram1.Run;
    Result := True;
  end
  else
    ShowMessage(PaxCompiler1.ErrorMessage[0]);
end;

function TqkScript.ExecFunc(AFunc: string;out outRet: string): Boolean;
begin
  PaxCompiler1.Reset;
  PaxCompiler1.AddModule('0',PaxPascalLanguage1.LanguageName);
  AddUses(FUseArr);
  AddQkFunc(FFuncUseForArr);

  AddCode('begin');
  AddCode(' Ret := ' + AFunc);
  AddCode('end.');
  Result := Exec;
  if Result then
    outRet := FRet;
end;

procedure TqkScript.Init;
begin
  PaxCompiler1.Reset;
  PaxCompiler1.RegisterLanguage(PaxPascalLanguage1);
  RegisterVariable(0,'Ret',_typeWIDESTRING,@FRet);
  RegisterVariable(0,'mt1',_typeFDMemTableCLass,@Fmt1);
  RegisterVariable(0,'mt2',_typeFDMemTableCLass,@Fmt2);

end;

function TqkScript.PaxCompiler1UsedUnit(Sender: TPaxCompiler;
  const UnitName: string; var SourceCode: string): Boolean;
begin
// Use OnUsedUnit event to prevent loading Unit1.pas from disk.
// We are going to import types of Unit1.pas, not to compile the unit.
  Sender.RegisterImportUnit(0, UnitName);
  result := true;
  SourceCode := '';
end;

procedure TqkScript.PaxCompiler1ImportUnit(Sender: TPaxCompiler; Id: Integer;
  const AFullName: string);
var
  LVar: string;
  LP: Pointer;
begin
// Global members must be imported explicitly.
  if Assigned(FRegisterGCallBack) then
  begin
    if FRegisterGCallBack(AFullName,LVar,LP) then
      Sender.RegisterVariable(Id,LVar,LP);
  end;
  //if CompareText('TestQkScript',AFullName) = 0 then
    //Sender.RegisterVariable(Id, 'Form1: TForm1', FPointer);
end;

end.

