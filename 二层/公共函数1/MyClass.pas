{******************************************************************************}
{                                                                              }
{   Code Maker: Jacky Zhong                                                    }
{   Date: Jun. 17. 2007                                                        }
{   Comments:自定义类单元，创建各种自定义类,如下：                             }
{   1.数据库处理类，封装了对数据库的操作函数，提供接口统一调用                 }
{   2.公式验证，验证公式是否正确                                               }
{   3.公式计算类
{   4.树型结构展开类(Treeview)                                                 }
{******************************************************************************}

unit MyClass;
//类的定义

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  VCLCom, StdVcl, DBClient,Grids, DBGrids,ComCtrls,
  DB, ADODB, Provider,variants,winsock,Midas,ComConst,StrUtils;

  function Is_NUll(Input_value,Output_Value:variant):variant;  //判断传入的数值是否是NULL，并返回一个指定的数值
const
  Int_Type= ' 2 ';
  Str_Type= ' ''X'' ';

//自定义数据类处理类，封装了数据库各种操作，
type
   TMyDataClass = class
  private
    FAdoConn : TADoConnection; //Ado数据连接
    aqTmp: TADoQuery;
    acmd: TAdoCommand;
    aspTmp: TADOStoredProc;

  public
    { Public declarations }
    function OpenQuery(Sqlstr:string):boolean; overload;//传入sql打开数据
    function OpenQuery(Query:TAdoQuery;Sqlstr:string):boolean; overload;//传入sql打开数据
    function OpenDataSetByPara(InPara:variant;adsTmp:TadoDataSet):boolean;overload;//传入参数，打开一个dataset
    function OpenDataSet(DataSet:TADoDataSet;Sqlstr:string):boolean;

    function IsExists(Sqlstr:string):boolean;//传入sql查询是否记录存在，true存在

    function Get_Sql_Value(sqlstr:string):variant;//输入sql,返回一个字段数值

    function ExecSql(Sqlstr:string):boolean;overload; //执行一段sql命令

    function ExecSql(Sqlstr:string;pTrans:boolean):boolean;overload; //执行一段sql命令
    //执行存储过程
    function ExecProc(ProcName: string; var ParamStrs: array of variant;
      Direction: array of TParameterDirection): boolean;overload;

    function ExecProc(ADOStoredProc: TADOStoredProc ;ProcName: string; var ParamStrs: array of variant;
      Direction: array of TParameterDirection;ExecType:byte): boolean;overload;

    //数据更新函数，pTrans:事务处理，返回值：true成功，false失败
    function SaveData(ads_Tmp: array of TADODataSet;pTrans:Boolean):boolean;overload;
    function UpdateValueToField(pDataSet:TDataSet;value:variant;FieldName:string):boolean;//更新数据表某个字段数值
    function ChangeFieldValue(pDataSet:TDataSet;Oldvalue,NewValue:variant;FieldName:string):boolean;//更新数据表某个字段数值

    //删除指定的记录，返回值：FieldName字段，fieldValue:指定的记录数值
    function DeleteRecord(ads_Tmp: TADODataSet;FieldName:string;FieldValue:variant):boolean;overload;
    procedure DeleteTable(DataSet:TDataSet);//删除数据表所有记录
    function Check_Unique_Field_Value(sqlstr:string):boolean;//验证字段数值是否唯一
    procedure Set_Filter(str_filter:string;DataSEt:TDATASET);//设置过滤

    Constructor Create(AdoConn: TAdoConnection);
    Destructor Destroy;override;
  end;

type
  //定义运算符号
  TOperator = (opLess, opLessOrEqual, opGreater, opGreaterOrEqual, opEqual,
                   opUnequal, opPlus, opMinus, opOr, opMul, opDiv, opAnd);
  const
    DataType_Float ='2';
    DataType_String ='X';

//公式计算类
type
  TBdsProc = class
  protected
    sGeta,sGetb,sGetc,sGetd:string;
  private
    sNew,sEnd: string;
    NowPoint: integer;  //替换字母时 记录当前操作的字符的位置
    Fghpd: Integer;//识别并标记左右括号是否成对出现
    function IsCalcFh(c: Char): boolean;//判别一个字符是否运算符
    function CopyRight(abds: String;start: Integer):String;//截取字符串表达式
    function BdsSs(var abds: String): Double;//返回一个子表达式的值
 //   function BdsHs(var abds: String): Double;   //函数内的计算
    function BdsYz(var abds: String): Double;//表达式因子，如：15、(13+5)

    function BdsItm(var abds: String): Double;//读取表达式中的一个因子
    
    procedure ChangeString(var sEnd,sNew: string; var Point:integer; sChar:char); //替换字母
    function IsChar(c: char):Boolean;   //判断是否字母
  public
    function PublicExplain(sSource: string): String; //`````````````````接口```````````````
    function CalcExpr(strExpr:string):double;//计算公式，返回结果
  end;

  TPUSHPOP = class
  private
    EndStep : Boolean;    //最后一步时 设为True
    ffh: array [0..2] of Char;//符号数组
    value: array [0..3] of Double;//值数组
    flevel: Byte;//因子个数
    fisfh: Boolean;//识别等待输入值或运算符
    function Calcsj(av1,av2: Double;fh: Char): Double;//执行两个数值的四则运算
    procedure Calccur;//当输入数据项满足四个数后执行中间运算
    function IsCcFH(fh: Char): Boolean;// 判断运算符
  public
    constructor Create;
    procedure PushValue(avalue: Double);//存入一个数据项
    procedure PushFh(afh: Char);//存入一个符号
    function CalcValue: Double;//计算并返回值
  end;




type
//公式验证类
   TFormula_Verify = class
  private
    FAdoConn : TADoConnection; //Ado数据连接
    aqTmp1: TADoQuery;
    aqTmp2: TADoQuery;
//    DataBase:TDataBase;
//    Query1: TQuery;
    ExprCalc:TBdsProc;
//------------------------------------------------------------------------------
    //输入一段字符，处理后，以指定字符替代，并返回
    function verify_Step_One(Input_str:string):string;  //第一步验证
    function Verify_IF(vstring:string):string; //验证IF函数
    function poss(vstr1:string;vstr2:string):integer;
    function posss(vs:integer;vstr1:string;vstr2:string):integer;
    function Check_VFP_Sql(Sqlstr:string):boolean;//传入SQL到VFP表中检验，方法不明，所以无法在SQL SERVER中处理
//------------------------------------------------------------------------------
//以上部分是旧的公式验证方法，是根据就程序代码改写的，下面的代码是重新写的
//------------------------------------------------------------------------------
    function Calc_If_Expr(strExpr:string):string;//根据If表达式，处理IF逻辑运算，返回计算结果，还是string类型
    function Get_Last_Phrase_Pos(strPhrase,strExpr:string):integer;//返回某个表达式在整个字符串最后的位置
    function Get_PosOfPhrase_Num(strPhrase,strExpr:string;Num:integer):integer;//在字符串中查找字符，指定第几次出现的位置
    function Get_PosOfbracket(strExpr:string):integer;//如果有一个左括号，返回与之匹配的一个右')'括号位置
    function Judge_Data_Type(strExpr:string):integer;//根据输入的字符，判断该表达式的数据类型，1。数字，2。字符 ,3.Unknow 4.逻辑表达式
    function De_Bracket(strExpr:string):string;//如果表达式中'(',')'不匹配，那么剥除表达式的'(',')'符号
    function Replace_Expr_Factor(Input_str:string):string;//以特殊符号分别替换公式中的不同数据类型的参数，
    procedure DeCode_FXY(strExpr:string;var X,Y:string); //根据公式数值，返回X,Y的数值
    function Calc_FX(rKey,DataType:integer;sX,sY:string):string;//计算工程表单，返回结果
    function Assign_Formula_Param_Value(DataSet:TDataSet;var str_expr:string):boolean;//把相应的参数数值，赋给公式
    function Calc_Eng_Table(var str_expr:string):boolean;//计算工程表单的数值
    function Calc_Expr(str_Expr:string):double;//计算公式的数值
    function Check_Param(strExpr:string):boolean; //检验表达式中的参数是否合法
    function Is_Operator(C:Char):Boolean;//判断是否是运算符号
    function Is_Logic_Operator(C:string):Boolean;
    function Calc_Logic_Expr(str_Expr:string):boolean;
    function Get_Logic_Expr(str_Expr:string):string;
    function Pos_AndOR_Prase(str_Expr:string;Prase:string):integer;//返回and or 的位置
    function De_Logic_Prase(str_Expr:string;iType:byte;var Div_Expr:string):string;//返回 And,or左右2边的分隔符
    function Replace_Factor_Part_Cost(Cost_Dept,Part_Group:integer;Input_str:string):string;//以特殊符号分别替换材料用量公式中的不同数据类型的参数，
    function Pos_OF_Operator(C:string):integer;
//    function Check_
  public

    Constructor Create(AdoConn: TAdoConnection);
    Destructor Destroy;override;
    function Verify(Input_str:string):boolean;//验证公式--早期的
    function Get_If_Expr(strExpr:string):string; //处理含IF的表达式（包括嵌套IF），返回一个数学运算表达式
    function Verify_Formula(Input_str:string;var output_str:string):boolean;//验证公式
    function Calc_Formula(dsParam:TDataSet;str_Expr:string):double;//计算一个公式的数值
    function Verify_Logic_Formula(Input_str:string;var output_str:string):boolean;//验证逻辑公式
    function Verify_Part_Cost_Formula(Cost_Dept,Part_Group:integer;Input_str:string;var output_str:string):boolean;//验证材料用量成本公式
    function Calc_Expr_Parma(var str_Expr:string;out Out_Value:double):boolean;//计算一个已经赋值的表达式
  end;


  type
  TMyTreeClass = class  //树型展开类
  private
    { Private declarations }
    //AdoConnection 是系统用的数据库连接
    FAdoConnection: TAdoConnection;
    qryTmpItem: TAdoQuery;
    SeqNo:integer;//序号
    FieldName:array of string;
    FieldValue:array of variant;
    Sel_Sql:string; //获取树的数据的Sql
    procedure Get_Tree_List_Data(TopNo:integer;LevNo: integer);overload;//获得树的所有Item
    procedure Get_Tree_List_Data(TopNo:String;LevNo: integer);overload;//获得树的所有Item
    procedure Get_Tree_List_Data_Up(TopNo:String;LevNo: integer);//获得树的所有上级Item
    procedure Write_Tree_Item(DATASET:TDATASET);//写数据到数据表
    procedure Create_Tree_List(TreeView : TTreeView);//创建树
    procedure GetFieldValue(DataSet:TDataSet);//获得数值

  public
    { Public declarations }
    constructor Create(AdoConnection: TAdoConnection); virtual;
    destructor Destroy; override;
{目前树型结构只处理4个字段,依次是:1.ItemNo 主代号,2.SeqNo 序号, 3.ItemName 显示名称 4.LevNo 层级}
    procedure Expand_My_Tree_Down(TreeView: TTReeView;TopNo,SqlStr,TreeTitle:String);overload;
    procedure Expand_My_Tree_Down(TreeView: TTReeView;TopNo:integer;SqlStr,TreeTitle:String);overload;
    procedure Get_My_Tree_Data(TopNo,SqlStr,TreeTitle:String;DataSet:TCustomAdoDATASET);
  end;

var
     MyDataClass: TMyDataClass;//数据操作类
     Formula_Verify:TFormula_Verify;
     MyTreeClass:TMyTreeClass;

implementation

{ TMyDataClass }

constructor TMyDataClass.Create(AdoConn: TAdoConnection);
begin
//创建类的连接和数据操作组建
//  FAdoConn := TADoConnection.Create(AdoConn);
  FAdoConn := AdoConn;
  aqTmp := TADoQuery.Create(nil);  //adoquery，用于sql数据查询
  aqTmp.Connection :=FAdoConn;

  acmd := TAdoCommand.Create(nil);   //command组建
  acmd.Connection := FAdoConn;

  aspTmp := TADOStoredProc.Create(nil);//存储过程组建
  aspTmp.Connection :=FAdoConn;
  
end;

function TMyDataClass.DeleteRecord(ads_Tmp: TADODataSet; FieldName: string;
  FieldValue: variant): boolean;
begin
  ads_Tmp.Locate(FieldName,FieldValue,[loCaseInsensitive ]);//查找的记录数值必须完全匹配
  ads_Tmp.Delete;
  result :=SaveData(ads_tmp,true); //删除后保存到数据库
end;

destructor TMyDataClass.Destroy;
begin

  inherited;
end;

function TMyDataClass.ExecProc(ProcName: string;
  var ParamStrs: array of variant; Direction: array of TParameterDirection): boolean;
var
  ADOStoredProc: TADOStoredProc;
  i: integer;
  Save_Cursor: TCursor;
begin
  Save_Cursor := Screen.Cursor;
  ADOStoredProc := TADOStoredProc.Create(application);
  try
    try
      screen.cursor := crsqlwait;
      ADOStoredProc.Connection := FAdoconn;//FAdoConnection;
      ADOStoredProc.ProcedureName := ProcName;
      for i := 0 to length(ParamStrs) - 1 do
      begin
        ADOStoredProc.Parameters.AddParameter;
        ADOStoredProc.Parameters.Items[i].Direction := Direction[i];
        if VarIsStr(ParamStrs[i]) then //假如字符型不进行字段设置，如果传入参数是汉字，会发生只能传入两个汉字长度的字符。
        begin
           ADOStoredProc.Parameters.items[i].DataType := ftString;
           ADOStoredProc.Parameters.items[i].Size := 50;
        end;
        ADOStoredProc.Parameters.Items[i].Value := ParamStrs[i];
      end;
      ADOStoredProc.ExecProc;
      for i := 0 to length(Direction) - 1 do
        ParamStrs[i] := ADOStoredProc.Parameters.Items[i].Value;
      result := true;
    except
      result := false;
    end;
    screen.cursor := Save_Cursor;
  finally
    ADOStoredProc.free;
  end;
end;

function TMyDataClass.ExecSql(Sqlstr: string): boolean;
begin
  try
    acmd.CommandText := sqlstr;
    acmd.Execute;
    result := true;
  except
    result := false;
//    ShowMsg('数据操作失败，请检查','提示',1);
  end;
end;

function TMyDataClass.OpenQuery(Sqlstr: string): boolean;
begin
  result := false;
  aqTmp.close;
  aqTmp.SQL.Clear;
  aqTmp.SQL.Add(sqlstr);
  aqTmp.EnableBCD := False;
  try
    aqTmp.Open;
    result := true;
  except
    showmessage('错误:'+sqlstr);
    abort;
//    Application.MessageBox('数据表打开失败，请检查','提示',mb_ok);
  end;
end;


function TMyDataClass.Get_Sql_Value(sqlstr: string): variant;
begin
  if OpenQuery(sqlstr) then
    result := aqTmp.Fields[0].Value;
end;

function TMyDataClass.OpenQuery(Query: TAdoQuery; Sqlstr: string): boolean;
begin
  try
    Query.Close;
    Query.Sql.Clear;
    Query.SQL.Add(sqlstr);
    Query.Open;
    result := true;
  except
    result := false;
//    Application.MessageBox('数据表打开失败，请检查','提示',mb_ok);
  end;
end;

function TMyDataClass.SaveData(ads_Tmp: array of TADODataSet;
  pTrans: Boolean): boolean;
var
  i:integer;
begin
  try
    if pTrans then //启动事务，必须保证所有的dataset公用一个adoconnection
      if not ads_Tmp[0].Connection.InTransaction then
        ads_Tmp[0].Connection.BeginTrans;
   //处理数据更新
    for i := low(ads_Tmp) to high(ads_Tmp) do
      ads_Tmp[i].UpdateBatch(arall);

    if pTrans then
      ads_Tmp[0].Connection.CommitTrans; //提交事务,
    result := true;
  except
    if pTrans then
      ads_Tmp[0].Connection.RollbackTrans;//回滚事务
    result := false;
  end;
end;

function Is_NUll(Input_value,Output_Value:variant):variant;  //判断传入的数值是否是NULL，并返回一个指定的数值
begin
  if VarIsNull(Input_Value) then
//  if Input_value = null then
    result := OutPut_value
  else
    result := Input_value;
end;

function TMyDataClass.IsExists(Sqlstr: string): boolean;
begin
  try
    OpenQuery(sqlstr);
  except
    showmessage(sqlstr);
    abort;
  end;

  result := not aqTmp.IsEmpty;
  aqTmp.Close;
end;

function TMyDataClass.OpenDataSetByPara(InPara: variant;
  adsTmp: TadoDataSet): boolean;
begin
  try
    adsTmp.Close;
    adsTmp.Parameters[0].Value := InPara;
    adsTmp.open;
    result := true;
  except
    result := false;
  end;
end;

function TMyDataClass.UpdateValueToField(pDataSet: TDataSet;
  value: variant; FieldName: string): boolean;
var
  BookMark:Tbookmark;
begin
  try
    BookMark:=pDataSet.GetBookmark;
    pDataSet.EnableControls;
    try
      pDataSet.First;
      while not pDataSet.Eof do begin
        pDataSet.Edit;
        pDataSet.FieldByName(FieldName).Value := Value;
        pDataSet.Post;
        pDataSet.Next;
      end;
      result := true;
      if BookMark <> nil then
        pDataSet.GotoBookmark(BookMark);
    except
      result := false;
    end;
  finally
    pDataSet.FreeBookmark(Bookmark);
    pDataSet.EnableControls;
  end;
end;

function TMyDataClass.OpenDataSet(DataSet: TADoDataSet;
  Sqlstr: string): boolean;
begin
  with DataSet do
  try
    Close;
    CommandText:=Sqlstr;
    Open;
    Result:=True;
  except
    Result:=False;
  end;
end;

procedure TMyDataClass.DeleteTable(DataSet: TDataSet);
begin
  try
    DataSet.DisableControls;
    try
      DataSet.First;
      while not DataSet.Eof do
        DataSet.Delete;
    except
      DataSet.EnableControls;
      Raise;
    end;
  finally
    DataSet.EnableControls;
  end;
end;

function TMyDataClass.ExecProc(ADOStoredProc: TADOStoredProc; ProcName: string;
  var ParamStrs: array of variant;
  Direction: array of TParameterDirection;ExecType:byte): boolean;
var
  i: integer;
  Save_Cursor: TCursor;
begin
    Save_Cursor := Screen.Cursor;
    try
      screen.cursor := crsqlwait;
      ADOStoredProc.Connection := FAdoconn;//FAdoConnection;
      ADOStoredProc.ProcedureName := ProcName;
      for i := 0 to length(ParamStrs) - 1 do
      begin
        ADOStoredProc.Parameters.AddParameter;
        ADOStoredProc.Parameters.Items[i].Direction := Direction[i];
        if VarIsStr(ParamStrs[i]) then //假如字符型不进行字段设置，如果传入参数是汉字，会发生只能传入两个汉字长度的字符。
        begin
           ADOStoredProc.Parameters.items[i].DataType := ftString;
           ADOStoredProc.Parameters.items[i].Size := 500;
        end;
        ADOStoredProc.Parameters.Items[i].Value := ParamStrs[i];
      end;
      if ExecType = 1 then
        ADOStoredProc.ExecProc
      else
        ADOStoredProc.open;
      for i := 0 to length(Direction) - 1 do
        ParamStrs[i] := ADOStoredProc.Parameters.Items[i].Value;
      result := true;
    except
      result := false;
    end;
    screen.cursor := Save_Cursor;
end;


function TMyDataClass.ExecSql(Sqlstr: string; pTrans: boolean): boolean;
begin
  try
    if pTrans then
      if not acmd.Connection.InTransaction then
        acmd.Connection.BeginTrans;
      acmd.CommandText := sqlstr;
      acmd.Execute;
      if pTrans then
        acmd.Connection.CommitTrans;
      result := true;
    except
      if pTrans then
        acmd.Connection.RollbackTrans;
      result := false;
    end;
end;

function TMyDataClass.ChangeFieldValue(pDataSet: TDataSet; Oldvalue,
  NewValue: variant; FieldName: string): boolean;
var
  BookMark:Tbookmark;
  IsFilter:boolean;
begin
  try
    BookMark:=pDataSet.GetBookmark;
    pDataSet.EnableControls;
    IsFilter:= pDataSet.Filtered;
    if IsFilter then
      pDataSet.Filtered:= false; 
    try
      pDataSet.First;
      while not pDataSet.Eof do begin
        if pDataSet.FieldByName(FieldName).Value = OldValue then
        begin
          pDataSet.Edit;
          pDataSet.FieldByName(FieldName).Value := NewValue;
        end;
        pDataSet.Next;
      end;
      result := true;
      if BookMark <> nil then
        pDataSet.GotoBookmark(BookMark);
    except
      result := false;
    end;
    if IsFilter then
    begin
      pDataSet.Filter := FieldName+'='+VarAsType(NewValue,varstring);
      pDataSet.Filtered := true;
    end;
  finally
    pDataSet.FreeBookmark(Bookmark);
    pDataSet.EnableControls;
  end;
end;

function TMyDataClass.Check_Unique_Field_Value(sqlstr: string): boolean;
begin
  result:= not IsExists(sqlstr);
end;

procedure TMyDataClass.Set_Filter(str_filter: string;
  DataSEt: TDATASET);
begin
  DataSet.Filtered := false;
  DataSet.Filter := str_filter;
  DataSet.Filtered := true;
end;

{ TFormula_Verify }

constructor TFormula_Verify.Create(AdoConn: TAdoConnection);
var
  Sqlstr:string;
begin
//创建类的连接和数据操作组建
//  FAdoConn := TADoConnection.Create(AdoConn);
  FAdoConn := AdoConn;
  aqTmp1 := TADoQuery.Create(nil);  //adoquery，用于sql数据查询
  aqTmp1.Connection :=FAdoConn;
  //打开工程参数表
  Sqlstr:= ' select data0278.rkey,data0278.PARAMETER_NAME,data0278.parameter_desc,data0278.data_type, '+
           ' data0278.spec_rkey,data0277.category_name,data0277.category_type,data0278.sequence_no '+
           ' from data0278,data0277 where data0278.category_ptr=data0277.rkey and category_type <> 1 '+
           ' order by data0277.category_type,data0277.category_name,DATA0278.parameter_name ';

//  Sqlstr:= ' select Unit_Code as parameter_name,data_type from data0429 order by unit_code ';


  MyDataClass.OpenQuery(aqTmp1,Sqlstr);

//打开data0280表
  aqTmp2 := TADoQuery.Create(nil);  //adoquery，用于sql数据查询
  aqTmp2.Connection :=FAdoConn;
//  Sqlstr:= ' select * from data0280 ORDER by Eng_table_name ';

  Sqlstr:=' select *, FXY=IsNull(Eng_table_name,'''')+'+QuotedStr('( ')+'+ rtrim(IsNull((select Parameter_name from data0278 where rkey=M.FX),''''))+'+QuotedStr(' , ')+'+'+
          ' rtrim(IsNull((select Parameter_name from data0278 where rkey=M.FY),'+QuotedStr('1')+'))+'+QuotedStr(' )')+
          ' from data0280 M order by Eng_table_name ';
  MyDataClass.OpenQuery(aqTmp2,Sqlstr);
{  DataBase := TDataBase.Create(nil);
  DataBase.DatabaseName := 'KMERPKEY';
  DataBase.AliasName := 'KMERP_KEY';
  DataBase.ReadOnly := true;
  DataBase.LoginPrompt := false;
  DataBase.Connected := true;
  Query1 := TQuery.Create(nil);
  Query1.DatabaseName :='KMERPKEY';}
  ExprCalc:= TBdsProc.Create();
end;

destructor TFormula_Verify.Destroy;
begin
  aqTmp1.Free;
  aqTmp2.Free;
//  DataBase.Free;
//  Query1.Free;
  ExprCalc.Free;
  inherited;
end;

function TFormula_Verify.Verify(Input_str: string): boolean;
var
  tmp_sql:string;
begin
  result := false;
  if trim(Input_str)<>'' then
  begin
    if pos(' XXXXYYYY ',Input_str)>0 then  
    begin
      Application.MessageBox('XXXXYYYY'+'是系统保留变量,请不要使用该名称做为用户参数名称','提示',mb_ok);
      exit;
    end;
    tmp_sql:= verify_step_one(Input_str+' >0');
    if Pos('SELECT',UPPERCASE(TMP_SQL))>0 THEN
      result := Check_VFP_Sql(tmp_sql)
    ELSE
      result := Check_VFP_Sql('select * from key where ' +verify_step_one(Input_str+' >0'));

    if result = false then
    begin
      tmp_sql:= verify_step_one(Input_str+' >"0"');
      if Pos('SELECT',UPPERCASE(TMP_SQL))>0 THEN
        result := Check_VFP_Sql(tmp_sql)
      ELSE
        result:= Check_VFP_Sql('select * from key where '+verify_step_one(Input_str+' >"0"'));

      if result=false then
        Application.MessageBox('计算公式设定不正确! 请注意该公式只能引用全局参数和工程表单！','提示',1);
    end;
  end
  else  //*************空字符串暂时通过验证****************
    result := true;
end;

function TFormula_Verify.verify_Step_One(Input_str: string): string;
const
  Int_Type= ' 2 ';
  Str_Type= ' ''X'' ';
var
  i,j,j0,j1,j2:integer;
  vstring1,vstring2:string;
  Expr1,Expr2,Expr3:string;
begin
  Input_str:=' '+Input_str+' ';

  Input_str:= StringReplace(Input_str,' PROJECT ',Str_Type,[rfReplaceAll]);

  Input_str:= StringReplace(Input_str,' CP_REV ',Str_Type,[rfReplaceAll]);

  Input_str:= StringReplace(Input_str,' CUST_CODE ',Str_Type,[rfReplaceAll]);

  //验证工程参数表
  aqTmp1.Open;
  aqTmp1.First;
  while not aqTmp1.Eof do
  begin
  //如果参数类型是数值型，那么就用 ' 2' 来替换参数，如果是字符型，那么用 ' ''X'' '替代参数
    if aqTmp1.FieldByName('data_type').AsInteger=1 then
      Input_str:= StringReplace(Input_str,' '+trim(Is_Null(aqTmp1.fieldbyname('parameter_name').asstring,''))+' ',Int_Type,[rfReplaceAll])
    else
      Input_str:= StringReplace(Input_str,' '+trim(Is_Null(aqTmp1.fieldbyname('parameter_name').asstring,''))+' ',Str_Type,[rfReplaceAll]);

    aqTmp1.next;
  end;
  aqTmp1.close;
  
  while POS('SUBS[',Input_str)>0 do  //提取SUBS（）函数    字符格式为' ABC SUBS[Expr1,Expr2,Expr3] '
  begin
    i:=POS('SUBS[',Input_str);
    j:=POS(',',COPY(Input_str,i+5,length(Input_str)-5-i+1)); //获取'subs['后第一个','的位置
    j0:=POS(',',COPY(Input_str,i+5+j,length(Input_str)-j-5-i+1)); //获取'subs['后第二个','的位置
    j1:=POS(']',copy(Input_str,i+5+j+j0,length(Input_str)-j0-j-5-i+1)); //获取'subs['后第1个']'的位置



    Expr1:= copy(Input_str,i+5,j-1); //获取'Subs['后第一个','之前的表达式内容
    Expr2:= copy(Input_str,i+5+j,j0-1); //获取'Subs['后第二个','之前的表达式内容
    Expr3:= copy(Input_str,i+5+j+j0,j1-1); //获取'Subs['第后二个','之后的表达式内容
//判断第一个表达式是否有效 用VFP验证，

    if not Check_VFP_Sql('select * from key where '+Expr1+'>''a''') then //表达式出错
    begin
      Input_str:= '1+x'; //故意赋个不正确的表达式
      result := Input_str;
      exit;
    end;
//判断第二个表达式是否有效
    if not Check_VFP_Sql('SELECT '+Expr2+' as vqty from key') then //表达式出错
    begin
      Input_str:= '1+x'; //故意赋个不正确的表达式
      result := Input_str;
      exit;
    end;

//判断第三个表达式是否有效
    if not Check_VFP_Sql('SELECT '+Expr3+' as vqty from key') then //表达式出错
    begin
      Input_str:= '1+x'; //故意赋个不正确的表达式
      result := Input_str;
      exit;
    end;
//拆开字符串为2部分A+B，以A"X"B的形式再组合
    Input_Str:=copy(Input_Str,1,i-1)+'''x'''+copy(Input_str,i+5+j+j0+j1,length(Input_str)-i-j-j0-j1-5+1);
  end;

 //打开工程表单表，验证

  if not aqTmp2.Active then
  aqTmp2.Open ;
  aqTmp2.first;
  with aqTmp2 do
//  Tmp_str:=
  for i:=0 to recordcount-1 do
  begin
    while pos(trim(fieldbyname('Eng_table_name').asstring)+'(',Input_Str)>0 do//如果一个参数出现了多次就通过这个循环逐一代换
    begin
      j:=pos(trim(fieldbyname('Eng_table_name').asstring)+'(',Input_Str); //获取第一个参数+'('的位置，如：'2层板('
      j0:=pos('(',copy(Input_Str,j,length(Input_Str)-j));  //获取第一个参数后的'('位置
      j1:=pos(',',copy(Input_Str,j,length(Input_Str)-j));  //获取第一个参数后的','的位置
      j2:=pos(')',copy(Input_Str,j,length(Input_Str)-j)); //获取第一个参数后的')'的位置
      vstring1:=copy(Input_Str,1,j-1);           //获取表单参数的左边部分如：   'AAA 2层板('的'AAA'部分
      vstring2:=copy(Input_Str,j+j2,500-j-j2);      //获取表单参数的右边部分
      if fieldbyname('data_type').asInteger=1 then
      //把公式分解为3部分，前一部分为参数左边部分，中间再加上' 2+ '，以及参数后的'BBB'部分
      //Sum(BBB,DDD); ' 2+ BBB+DDD
        Input_Str:=vstring1+' 2+ '+copy(Input_Str,j+j0,j1-j0-1)+'+'+copy(Input_Str,j+j1,j2-j1-1)+vstring2
      else
      if fieldbyname('data_type').asInteger=2 then
      begin
//        对比BBB部分的，第一B，和第最后一个B是否是空值
        if (copy(trim(copy(Input_Str,j+j0,j1-j0-1)),1,1)='''') and (copy(trim(copy(Input_Str,j+j0,j1-j0-1)),length(trim(copy(Input_Str,j+j0,j1-j0-1))),1)='''') then
        //对比DDD部分的第一个D,和第最后一个D是否是空值
          if (copy(trim(copy(Input_Str,j+j1,j2-j1-1)),1,1)='''') and (copy(trim(copy(Input_Str,j+j1,j2-j1-1)),length(trim(copy(Input_Str,j+j1,j2-j1-1))),1)='''') then
            Input_Str:=vstring1+' 2 '+vstring2
          else
            Input_Str:=vstring1+' 2+ ''2''+'+copy(Input_Str,j+j1,j2-j1-1)+vstring2
        else
            Input_Str:=vstring1+' 2+ ''2''+'+copy(Input_Str,j+j1,j2-j1-1)+vstring2;
      end else
      if fieldbyname('data_type').asInteger=3 then
        Input_Str:=vstring1+' ''2''+ '+copy(Input_Str,j+j0,j1-j0-1)+'+'+copy(Input_Str,j+j1,j2-j1-1)+vstring2;
    end;
    next;
  end;

  if POS('IF(',Input_Str)>0 then
    result :=Verify_IF(Input_Str)
  else
    result := Input_Str;
end;

function TFormula_Verify.Verify_IF(vstring: string): string;
//var
//  i,j,j0,j1:integer;
begin
{  vstring:=' '+vstring+' ';
  while POS('IF(',vstring)>0 do
  begin
    i:=POS('IF(',vstring);
    j:=POSSS(i,',',vstring);
    j0:=POSS(',',vstring)-j;
    j1:=POS(')',copy(vstring,j+j0+1,length(vstring)-j-j0));
    try    //检验IF（条件，返回值1，返回值2）函数的条件表达式是否合法
      Check_VFP_Sql('select * from key where '+copy(vstring,i+3,j-i-3));
    except
      result := '';//不再验证了
      exit;
    end;
    if not Query1.IsEmpty then
    begin
      try    //检验IF（条件，返回值1，返回值2）函数的返回值1是否有效
        Check_VFP_Sql('SELECT '+copy(vstring,j+1,j0-1)+' as vqty from key');
      except
        result := '';//不再验证了
        exit;
      end;
    end else
    begin
      try    //检验IF（条件，返回值1，返回值2）函数的返回值1是否有效
        Check_VFP_Sql('SELECT '+copy(vstring,j+1,j0-1)+' as vqty from key');
      except
        result := '';//不再验证了
        exit;
      end;
    end;
    vstring:=copy(vstring,1,i-1)+Query1.fieldbyname('vqty').asstring+copy(vstring,j+j0+j1+1,length(vstring)-j-j0-j1);
  end;
  result := 'SELECT '+vstring+' as vqty from key';}
end;

function TFormula_Verify.poss(vstr1, vstr2: string): integer;
var i:integer;
  vstr:string;
begin
  //该函数的参数“vstr1”没有用到，请注意
  //举例：传入数值为：vstr2='AB,CDE)'，那么复制AAA部分，
  //接着：从AB,CDE判断，如果之间有','那么就返回从右边数的第一个位置
  vstr:=copy(vstr2,1,pos(')',vstr2)-1);
  for i:= length(vstr) downto 1 do
  if copy(vstr,i,1)=',' then
  begin
    Break;
  end;
  Result:=i;
end;

function TFormula_Verify.posss(vs: integer; vstr1, vstr2: string): integer;
var i:integer;
  vstr:string;
begin
  //复制vstr2，从指定位置到')'之前部分.如：ABC,DE),第2开始的部分:BC,DE
  vstr:=copy(vstr2,vs,pos(')',vstr2)-1);
  for i:= length(vstr) downto 1 do
  //复制从左到右的，一直到最后一个')'之前部分,如：BC
    if copy(vstr,i,1)=',' then
    begin
      vstr:=copy(vstr,1,i-1);
      break;
    end;
  //
  for i:= length(vstr) downto 1 do
    if copy(vstr,i,1)=',' then
    begin
      Break;
    end;
  Result:=i+vs-1;
end;

function TFormula_Verify.Check_VFP_Sql(Sqlstr: string): boolean;
begin
//  try
//    Query1.Close;
//    Query1.SQL.Clear;
//    Query1.SQL.Add(sqlstr);
//    Query1.Open;
//    result := true;
//  except
    result := false;
//  end;
end;

function TFormula_Verify.Get_If_Expr(strExpr: string): string;
var
  i,P3:integer;
  StrTmp,strLeft,strRight,TmpExpr:string;
begin
  //AB if(C>D,2,3)*if(E>F,4,5)/6+2
//If合法表达式: IF(<Expr>,A,B),如果Expr运算为true，返回A,否则为B,目前公式验证的方法是：
//1，查找是否有If，如果有，那么复制从If开始的后面的字符，并记录If前的部分
//2。查找最后一个IF'('部分后的位置，取第一个和第二个','的位置，并获取相应部分的数值
//3。获取第二个','后的第一个')'号的数值，以及之后的字符串
//4。处理第一个Expr，另外写一个函数，处理Expr，如果返回数值为true，返回A,否则返回B
//5。合并If之前，if表达式的替代字符，合并if表达式后的字符，返回
//6。如果If后面还有一个if，那么递归计算。
//  strExpr:=StringReplace(uppercase(strExpr),' ','',[rfReplaceAll]);
  i:=Get_Last_Phrase_Pos('IF',strExpr);
  if i >0 then //找到了IF
  begin
    strLeft:= copy(strExpr,1,i-1); //获取If左边的字符
    strTmp:= copy(strExpr,i,100000); //获取if右边的字符
//    P3:= Get_PosOfPhrase_Num(')',copy(strTmp,P2+1,100000),1)+P2;//获取第一个')'的位置
    P3:=Get_PosOfbracket(copy(strTmp,Pos('(',strTmp)+1,100000))+Pos('(',strTmp);

    strRight:=Copy(strTmp,P3+1,100000);//获取IF(<Expr>,A,B)后的内容

    TmpExpr:=copy(strTmp,1,P3);//获取IF(<Expr>,A,B)表达式的内容
    if Pos('IF(',TmpExpr)=0 then
    begin
      Application.MessageBox('IF表达式出错,"IF"和"("之间不能有空格','提示',mb_OK);
      abort;
    end;
    strExpr:=strLeft+' ' +Calc_If_Expr(TmpExpr)+' '+strRight;
    if Get_Last_Phrase_Pos('IF',uppercase(strExpr))>0 then
      result := Get_If_Expr(strExpr)
    else
      result := strExpr;
  end
  else
  begin
    result := strExpr;
    exit;
  end;
end;

function TFormula_Verify.Calc_If_Expr(strExpr: string): string;
var
  i,j,P1,P2,P3:integer;
  strLeft,TmpExpr,partA,partB:string;
  DataType:byte;//数据类型1:数字，2:字符
  Rslt:boolean;
begin
  P1:= Get_PosOfPhrase_Num(',',strExpr,1);//获取第一个','的位置
  P2:= Get_PosOfPhrase_Num(',',strExpr,2);//获取第二个','的位置
//  P3:= Get_PosOfPhrase_Num(')',copy(strExpr,P2+1,100000),1)+P2;//获取第一个')'的位置
  P3:=Get_PosOfbracket(copy(strExpr,Pos('(',strExpr)+1,100000))+Pos('(',strExpr);
  j:=Get_PosOfPhrase_Num('(',strExpr,1);//获取第一个'('位置
  TmpExpr:=copy(strExpr,j+1,P1-j-1);//获取Expr内容
  partA:=copy(strExpr,P1+1,P2-1-P1); //获取IF(<Expr>,A,B)表达式 A的内容
  partB:=copy(strExpr,P2+1,P3-P2-1);//获取IF(<Expr>,A,B)表达式 B的内容
  i:=Pos_OF_Operator(tmpExpr);
  if i > 0 then
  begin
    StrLeft:=trim(copy(TmpExpr,1,i-1));
{    Rslt := ((StrLeft = trim(Int_Type)) or  (StrLeft = trim(Str_Type)));
    if not rslt then
    begin
      Application.MessageBox(PChar(strLeft+'不是正确的参数,请检查'),'提示',mb_OK);
      abort;
    end;}
    
  end
  else
  begin
    Application.MessageBox(Pchar(TmpExpr+'不是正确的表达式,请检查'),'提示',mb_OK);
    abort;
  end;
  rslt :=MyDataClass.IsExists('select 2 where '+TmpExpr);
  (*
  intLen := 1;
  N:=0;
  while (n <= Length(TmpExpr))  do
  begin
    case TmpExpr[N] of
      '<' : begin
              if TmpExpr[N + 1] = '>' then
              begin
                Op := opUnequal;
                intLen := 2;
              end else
                if TmpExpr[N + 1] = '=' then
                begin
                  Op := opLessOrEqual;
                  intLen := 2;
                end else
                  Op := opLess;
                break;
              end;
      '>' : begin
              if TmpExpr[N + 1] = '=' then
              begin
                Op := opGreaterOrEqual;
                intLen := 2;
              end else
                Op := opGreater;
              break;
            end;
      '=' : begin
              Op := opEqual;
              break;
            end;
    end;
    inc(N);
  end;

//
  if N = Length(TmpExpr)+1 then
  begin
    Application.MessageBox(Pchar('IF表达式出错,缺少逻辑运算符号,请检查'),'提示',mb_Ok);
    abort;
  end;
  strLeft:=De_Bracket(uppercase(trim(copy(TmpExpr,1,N-1))));
  strRight:=De_Bracket(uppercase(trim(copy(TmpExpr,N+IntLen,100000))));

{  if trim(strLeft) = trim(Int_Type) then
    DataType:= 1
  else if trim(strLeft) = trim(Str_Type) then
    DataType:= 2
  else
  begin
    Application.MessageBox(Pchar('参数: '+strLeft+' 无效,请确认'),'提示',1);
    abort;
  end;}
//判断字段是数字型还是字符型  //判断strleft部分数据类型，
  DataType :=Judge_Data_Type(strLeft);
  if DataType = 3 then
  begin
    Application.MessageBox(Pchar('表达式 '+strLeft+' 无效,请检查'),'提示',mb_Ok);
    abort;
  end;

  DataType2 :=Judge_Data_Type(strRight);
  if DataType = 3 then
  begin
    Application.MessageBox(Pchar('表达式 '+strRight+' 无效,请检查'),'提示',mb_Ok);
    abort;
  end;
  if DataType <> DataType2 then
  begin
    Application.MessageBox(Pchar('数据类型不一致,请检查'),'提示',mb_Ok);
    abort;
  end;

//假如类型是数字，那么表达式还需要处理一次
  if DataType = 1 then
  begin
    strLeft:= ExprCalc.PublicExplain(strleft);
    strRight:= ExprCalc.PublicExplain(strRight);
  end
  else
  begin
{    if trim(strLeft) = trim(Int_Type) then
      DataType:= 1
    else }if (trim(strLeft) = trim(Str_Type)) or (trim(strRight) = trim(Str_Type)) then
      DataType:= 2
    else
    begin
      Application.MessageBox(Pchar(strLeft+' 和 '+strRight+' 必须有一个为参数,请确认'),'提示',mb_OK);
      abort;
    end;
  end;

  case Op of
    opGreater : case DataType of
                       1: Rslt := (StrToFloat(strLeft) > StrToFloat(strRight));
                       2: Rslt := strLeft > strRight;
                end;

    opGreaterOrEqual : case DataType of
                       1: Rslt := StrToFloat(strLeft) >= StrToFloat(strRight);
                       2: Rslt := strLeft >= strRight;
                end;
    opLess : case DataType of
                       1: Rslt := StrToFloat(strLeft) < StrToFloat(strRight);
                       2: Rslt := strLeft < strRight;
                end;
    opLessOrEqual : case DataType of
                       1: Rslt := StrToFloat(strLeft) <= StrToFloat(strRight);
                       2: Rslt := strLeft <= strRight;
                end;
    opEqual : case DataType of
                       1: Rslt := StrToFloat(strLeft) = StrToFloat(strRight);
                       2: Rslt := strLeft = strRight;
                end;
    opUnequal : case DataType of
                       1: Rslt := StrToFloat(strLeft) <> StrToFloat(strRight);
                       2: Rslt := strLeft <> strRight;
                end;
  end;
  *)
  DataType :=Judge_Data_Type(partA); 

  if DataType = 1 then  //判断数据类型
  begin
    if not MyDataClass.OpenQuery('select 1.0*'+ PartA + ' AS Ret') then
      Exit;
    partA:= MyDataClass.aqTmp.FieldByName('Ret').AsString;

    if not  MyDataClass.OpenQuery('select 1.0*'+ PartB + ' AS Ret') then
      exit;
    partB:= MyDataClass.aqTmp.FieldByName('Ret').AsString;
    //----下面解析IF出错，错误原因未知 注释掉2017-7-28
//    partA:= ExprCalc.PublicExplain(partA);
//    partB:= ExprCalc.PublicExplain(partB);

  end;
  if Rslt then
    result := partA
  else
    result := partB;
end;

function TFormula_Verify.Get_Last_Phrase_Pos(strPhrase,
  strExpr: string): integer;
var
  i:integer;
  A:Char;
begin
  i:=0;
  A:=' ';
  strExpr:=uppercase(strExpr);
  while Pos(strPhrase,strExpr)>0 do
  begin
    i := Pos(strPhrase,strExpr);
    strExpr:=stringReplace(strExpr,strPhrase,stringofChar(A,Length(strPhrase)),[]);
  end;
  result := i;  
end;

function TFormula_Verify.Get_PosOfPhrase_Num(strPhrase, strExpr: string;
  Num: integer): integer;
  var
  i,j:integer;
  A:Char;
begin
  i:=0;j:=1;
  A:=' ';
  strExpr:=uppercase(strExpr);
  while Pos(strPhrase,strExpr)>0 do
  begin
    i := Pos(strPhrase,strExpr);
    strExpr:=stringReplace(strExpr,strPhrase,stringofChar(A,Length(strPhrase)),[]);
    if j= Num then //第几次出现
      break;
    inc(j);
  end;
  result := i;  
end;

function TFormula_Verify.Get_PosOfbracket(strExpr: string): integer;
var
  TmpInc,n:integer;
begin
  n:=1;
  result :=-1;
  TmpInc:=1;
  while n <= Length(strExpr) do
  begin
    case strExpr[N] of
      '(' : inc(TmpInc);
      ')' : dec(TmpInc);
    end;
    if TmpInc=0 then
    begin
      result := n;
      break;
    end;
    Inc(n);
  end;
  if TmpInc<>0 then
    result :=-1;//没找到

end;

//----------------------- ExprCalc---------------------------


constructor TPUSHPOP.Create;
begin
inherited create;
end;

function TBdsProc.IsCalcFh(c: char): boolean;
begin
  if c in ['+','-','*','/'] then
    Result := True
  else
    Result := False;
end;

function TBdsProc.CopyRight(abds: String;start: Integer):String;//截取字符串表达式
begin
  Result := Copy(abds,start,(length(abds)-1));
end;

function TBdsProc.BdsItm(var abds: String): Double;//读取表达式中的一个因子
var
  i,j,k,OldJ,iPoint,KHCount: integer;
  sCount : real;
  IsInt: boolean;
  sValue: Array[0..20] of string;
  sXiShu: Array[0..20] of real;
  s,c,HSName,HSIn: string;
  fArray : Array[1..20] of real;
  fMin,fMax,fAll : real;
begin
  //因子为函数时
  iPoint:=0;
  c := abds[1];
  if ((c>='a') and (c<='z')) or ((c>='A') and (c<= 'Z')) then
  begin
    k := 0;

    HSName := Copy(abds,1,3);
   //Jacky Zhong 2007-1-27:增加判断，如果不是 Min,Max,avg函数，那么报错。
    if (LowerCase(HSName) = LowerCase('Min')) or ( LowerCase(HSName) = LowerCase('Max') ) or( LowerCase(HSName) = LowerCase('Avg') ) then
    begin

      abds := copy(abds,5,length(abds)-4);
      While abds <> '' do
      begin
        c := abds[1];
        i := 1;
        KHCount := 0;
        while c <> ',' do
        begin
          if c='(' then inc(KHCount);
          if c=')' then dec(KHCount);
          if KHCount = -1 then Break;   //在取函数中最后一个因子时,遇到函数的')'时退出本循环
          inc(i);
          c := copy(abds,i,1);
        end;
        inc(k);
        HSIn := '('+Copy(abds,1,i-1)+')';
        fArray[k] := BdsSs(HSIn);    //```````````` 可扩展函数中嵌套函数
        abds := copy(abds,i+1,length(abds)-i);
        if c <>',' then break;      //c为右括号的时候 退出该循环
      end;

      fMin := fArray[1];
      fMax := fArray[1];
      fAll := 0;
      for i:= 1 to k do
      begin
        if fArray[i] < fMin then fMin := fArray[i];
        if fArray[i] > fMax then fMax := fArray[i];
        fAll := fAll + fArray[i];
      end;
      if LowerCase(HSName) = LowerCase('Min') then Result := fMin
      else if LowerCase(HSName) = LowerCase('Max') then Result := fMax
      else if LowerCase(HSName) = LowerCase('Avg') then Result := StrToFloat(FormatFloat('#.0000',(fAll/k)))
      else raise Exception.Create('函数名错误');
      Exit;
    end
    else
    begin
      raise Exception.Create('函数名错误');
      Exit;
    end;
  end;

  //因子为数值时````````````````````````
  j := 0;
  IsInt := True;
  for i:= 1 to Length(abds) do
  begin
    if ((abds[i] >= '0') and (abds[i] <= '9')) or (abds[i]='.') then
    begin
      j := j+1;
      if abds[i]= '.' then
      begin
        IsInt := False;
        iPoint := j;       //小数点所在位置
      end;

      sValue[j] := copy(abds,i,1);
    end
    else
      break;
  end;

  OldJ := j;
  if IsInt then   //因子为整数
  begin
    k := 0;
    While j <> 0 do
    begin
      s:= '1';
      for i := 1 to j-1 do
      begin
        s := s + '0';
      end;
      K := k+1;
      sXiShu[k] := StrToFloat(s);
      j := j-1;
    end;
    sCount := 0;
    for j:=OldJ downto 1 do
    begin
      sCount := sXiShu[j]*strtoint(sValue[j]) + sCount;
    end;
    Result := sCount;
  end
  else
  begin
    j := OldJ;      //因子为浮点数
    While j <> 0 do
    begin
      if j > iPoint then
      begin
        s:= '1';
        for i:=1 to (j-iPoint-1) do
        begin
          s := '0' + s;
        end;
        s := '0.' + s;
      end;
      //if j = iPoint then k := k+1;
      if j < iPoint then
      begin
        s:= '1';
        for i:=1 to (iPoint-j-1) do
        begin
          s := s+ '0' ;
        end;  
      end;
      if j<>iPoint then sXiShu[j] := StrToFloat(s);
      j := j-1;
    end;
    sCount := 0;
    for j:=OldJ downto 1 do
    begin
      if j = iPoint then Continue;
      sCount := sXiShu[j]*strtoint(sValue[j]) +sCount;
    end;
    Result := sCount;
  end;
  abds := Copy(abds,(OldJ+1),(Length(abds)-OldJ));
end;

function TBdsProc.BdsSs(var abds: String): Double;
var
  c: Char;
  lpp: TPushPop;
begin
  lpp := TPushPop.Create;//建立数据计算对象
  lpp.value[0] := 0;
  lpp.ffh[0] := '+';
  lpp.EndStep := False;
  while abds<>'' do
  begin
    c := abds[1];
    if IsCalcFh(c) then//是否运算符
    begin
      lpp.PushFh(c);//保存运算符
      abds := CopyRight(abds,2);
    end
    else
    begin
      if c=')' then
      begin
        Dec(Fghpd);//括号匹配
        abds := CopyRight(abds,2);
        if Fghpd < 0 then Raise Exception.Create('括号不配对');
        Result := lpp.CalcValue;
        //返回括号中的子项值，进行下一步计算
        lpp.Free;
        Exit;
      end
      else
      begin
        if c='(' then Inc(Fghpd);//做括号层数标识
        lpp.PushValue(BdsYz(abds));//取下一项的值。
      end;
    end;
  end;
  if Fghpd<>0 then Raise Exception.Create('括号不配对');

  lpp.EndStep :=True;
  lpp.Calccur;
  Result := lpp.Value[1];
  lpp.Free;
end;

function TBdsProc.BdsYZ(var abds: String): Double;
begin
  Result:=0;
  if abds<>'' then
  begin
    if abds[1]='(' then
    begin
      abds := CopyRight(abds,2);
      Result := BdsSs(abds);//递归调用，求括号中的值
    end
    else
      Result := BdsItm(abds);//读一个数据项
  end;
end;

procedure TPUSHPOP.PushValue(avalue: Double);
begin
  if fisfh=True then Raise Exception.Create('缺少运算符');

  inc(flevel);//存数位置指针加1
  value[flevel] := avalue;//存入值
  if flevel >2 then Calccur;//数据个数达到4，进行中间运算

  fisfh := True;//输入符号可见
end;

procedure TPUSHPOP.PushFh(afh: Char);
begin
  ffh[flevel] := afh;//存入运算符
  fisfh := False;// 输入值可见
end;

procedure TPUSHPOP.Calccur;
begin
  if IsCcFh(ffh[1]) then//二级运算符
  begin
    value[1] := Calcsj(value[1],value[2],ffh[1]);//计算2和3项的值
    ffh[1] := ffh[2];//后序运符和值前移
    value[2] := value[3];
  end
  else//一级运算符
  begin
    value[0] := Calcsj(value[0],value[1],ffh[0]);//计算1和2项的值
    value[1] := value[2];
    value[2] := value[3];
    ffh[0] := ffh[1];
    ffh[1] := ffh[2];
  end;
  Dec(flevel);//存数位置指针减1
  if EndStep then
  begin
    Value[1] := Calcsj(value[0],value[1],ffh[0]);
  end;
end;

function TPUSHPOP.Calcsj(av1,av2: Double;fh: Char): Double;//执行两个数值的四则运算
begin
  result := 0;
  if fh='+' then result := av1 + av2;
  if fh='-' then result := av1 - av2;
  if fh='*' then result := av1 * av2;
  if fh='/' then
  begin
    if av2 = 0 then
    begin
      Raise Exception.Create('除数不能为0');
      Exit;
    end
    else
      result := StrToFloat(FormatFloat('#.00000000',(av1 / av2)));
  end;
end;

function TPUSHPOP.IsCcFH(fh: Char): Boolean;// 一个符号乘除商模运算符
begin
  if (fh='*') or (fh= '/') then
    Result := True
  else
    Result := False;
end;

function TPUSHPOP.CalcValue: Double;//计算并返回值
begin
  if ffh[1] = '' then
  begin
    result := Calcsj(value[0],value[1],ffh[0]);   
    exit;
  end;
  if IsCcFh(ffh[1]) then//二级运算符
  begin
    value[1] := Calcsj(value[1],value[2],ffh[1]);//计算2和3项的值
    result := Calcsj(value[0],value[1],ffh[0]);
  end
  else
  begin
    value[1] := Calcsj(value[0],value[1],ffh[0]);
    result := Calcsj(value[1],value[2],ffh[1]);
  end;
end;

function TBdsProc.PublicExplain(sSource: string): String; //`````````````````接口```````````````
var
  TestClass: TBdsProc;
  First,Second,Primary: char;
begin
  if trim(sSource)='' then
    result :=''
  else
  begin
    sSource:= StringReplace(sSource,' ','',[rfReplaceAll]);
    TestClass := TBdsProc.Create;
    sNew := sSource;
    sEnd := sSource;
    NowPoint := 1;
    //先处理第一个字符
    if (IsChar(sNew[1]) and (not IsChar(sNew[2]))) then
    begin
      ChangeString(sEnd,sNew,NowPoint,sNew[1]);
    end
    else
    begin
      Inc(NowPoint);
      //sNew := copy(sEnd,NowPoint,Length(sEnd)-NowPoint+1);
    end;

    While sNew <> '' do
    begin
      if Length(sNew)=2 then //处理最后一个字符
      begin
        if IsChar(sNew[2]) then ChangeString(sEnd,sNew,NowPoint,sNew[2]);
        Break;
      end;
      // 处理中间的字符
      Primary := sNew[1];
      First := sNew[2];
      Second := sNew[3];
      if ((not IsChar(Primary)) and IsChar(First) and (not IsChar(Second))) then
      begin
        ChangeString(sEnd,sNew,NowPoint,First);
      end
      else
      begin
        Inc(NowPoint);
        sNew := copy(sEnd,NowPoint-1,Length(sEnd)-NowPoint+2);
      end;
    end;

    Result := format('%8.12f',[(TestClass.BdsSs(sEnd))]);
    TestClass.Free;
  end;
end;
//判断是否字母
function TBdsProc.IsChar(c: char):Boolean;
begin
  if ((c>='a') and (c<='z')) or ((c>='A') and (c<= 'Z')) then
    Result := True
  else
    Result := False;
end;




procedure TBdsProc.ChangeString(var sEnd, sNew: string; var Point: integer;
  sChar: char);
var
  i:integer;
begin
//i have no the original code of this function, below is filled up by myself
  if IsChar(sChar) then //字符
  begin
    i:=Pos(sNew,sEnd);
    sNew:=copy(sNew,1,Point-i-1-1)+'2'+copy(sNew,point-i,length(sNew)-100000);
  end;
end;

function TBdsProc.CalcExpr(strExpr: string): double;
var
  TestClass: TBdsProc;
  First,Second,Primary: char;
begin
  strExpr:= StringReplace(strExpr,' ','',[rfReplaceAll]);
  TestClass := TBdsProc.Create;
  sNew := strExpr;
  sEnd := strExpr;
  NowPoint := 1;
  //先处理第一个字符    
  if (IsChar(sNew[1]) and (not IsChar(sNew[2]))) then
  begin
    ChangeString(sEnd,sNew,NowPoint,sNew[1]);
  end
  else
  begin
    Inc(NowPoint);
    //sNew := copy(sEnd,NowPoint,Length(sEnd)-NowPoint+1);
  end;

  While sNew <> '' do
  begin
    if Length(sNew)=2 then //处理最后一个字符
    begin
      if IsChar(sNew[2]) then ChangeString(sEnd,sNew,NowPoint,sNew[2]);
      Break;
    end;
    // 处理中间的字符
    Primary := sNew[1];
    First := sNew[2];
    Second := sNew[3];
    if ((not IsChar(Primary)) and IsChar(First) and (not IsChar(Second))) then
    begin
      ChangeString(sEnd,sNew,NowPoint,First);
    end
    else
    begin
      Inc(NowPoint);
      sNew := copy(sEnd,NowPoint-1,Length(sEnd)-NowPoint+2);
    end;
  end;

  Result := TestClass.BdsSs(sEnd);
  TestClass.Free;
end;

function TFormula_Verify.Judge_Data_Type(strExpr: string): integer;
var
  n : integer;
  booFound : boolean;
//  intParenteses : integer;
begin
  if Is_Logic_Operator(strExpr) then
  begin
    result := 4;
    exit;
  end;
  n := 1;
//  intParenteses := 0;
  result := 0;
  booFound := false;
  while (n <= Length(strExpr)) and (not booFound) do begin
    case StrExpr[N] of
      '(' : begin
//              inc(intParenteses);
              if strExpr[n+1] <> '(' then
                if strExpr[n+1] in ['0'..'9'] then
                begin
                  result := 1;//
                  booFound:= true;
                end
            end;
      ')' : ;// dec(intParenteses);
      '''': begin
              booFound:= true;
              result := 2;
            end;
      'A'..'Z', 'a'..'z' :
            begin
              booFound:= true;
              result := 3;
            end;
      '0'..'9': 
            begin
              booFound:= true;
              result := 1;
            end;
    end;
    Inc(n);
  end;
end;

function TFormula_Verify.De_Bracket(strExpr: string): string;
var
  n : integer;
  booFound : boolean;
  intParenteses : integer;
begin
  n := 1;
  intParenteses := 0;
  booFound := false;
  while (n <= Length(strExpr)) and (not booFound) do
  begin
    case StrExpr[N] of
      '(' : inc(intParenteses);
      ')' : dec(intParenteses);
    end;
    Inc(n);
  end;
  if intParenteses <>0 then
  begin
    strExpr := Stringreplace(strExpr,'(','',[rfReplaceAll]);
    strExpr := Stringreplace(strExpr,')','',[rfReplaceAll]);
  end;
  result :=strExpr;
end;

function TFormula_Verify.Replace_Expr_Factor(Input_str: string): string;
begin

  Input_str:= StringReplace(Input_str, #$D#$A, '', [rfReplaceAll]);

  Input_str:=' '+uppercase(Input_str)+' ';

  Input_str:= StringReplace(Input_str,' PROJECT ',Str_Type,[rfReplaceAll]);

  Input_str:= StringReplace(Input_str,' CP_REV ',Str_Type,[rfReplaceAll]);

  Input_str:= StringReplace(Input_str,' CUST_CODE ',Str_Type,[rfReplaceAll]);

 //打开工程表单表，替换公式中的数值
//  Input_str:= StringReplace(Input_str,' ','',[rfReplaceAll]);
  if not aqTmp2.Active then
  aqTmp2.Open ;
  aqTmp2.first;
  while not aqTmp2.Eof do begin
    if aqTmp2.FieldByName('data_type').AsInteger=1 then
      Input_str:= StringReplace(Input_str,' '+trim(Is_Null(uppercase(aqTmp2.fieldbyname('FXY').asstring),''))+' ',Int_Type,[rfReplaceAll])
    else
      Input_str:= StringReplace(Input_str,' '+trim(Is_Null(uppercase(aqTmp2.fieldbyname('FXY').asstring),''))+' ',Str_Type,[rfReplaceAll]);

    aqTmp2.next;
  end;
  aqTmp2.close;


  //验证工程参数表
  aqTmp1.Open;
  aqTmp1.First;
  while not aqTmp1.Eof do
  begin
  //如果参数类型是数值型，那么就用 ' 2' 来替换参数，如果是字符型，那么用 ' ''X'' '替代参数
    if aqTmp1.FieldByName('data_type').AsInteger=1 then
      Input_str:= StringReplace(Input_str,' '+trim(Is_Null(uppercase(aqTmp1.fieldbyname('parameter_name').asstring),''))+' ',Int_Type,[rfReplaceAll])
    else
      Input_str:= StringReplace(Input_str,' '+trim(Is_Null(uppercase(aqTmp1.fieldbyname('parameter_name').asstring),''))+' ',Str_Type,[rfReplaceAll]);

    aqTmp1.next;
  end;
  aqTmp1.close;

  result := Input_Str;
end;

function TFormula_Verify.Verify_Formula(Input_str: string;var output_str:string): boolean;
begin
  result := false;
  if trim(Input_str)<>'' then
  begin
    if pos(' XXXXYYYY ',Input_str)>0 then
    begin
      Application.MessageBox('XXXXYYYY'+'是系统保留变量,请不要使用该名称做为用户参数名称','提示',mb_ok);
      exit;
    end;
    Input_str:= Replace_Expr_Factor(Input_str);
    try
      Input_str:= Get_If_Expr(Input_str);
//剥除了if函数后，再处理其他的部分。
//      ExprCalc.PublicExplain(Input_str);
//判断每个参数是否合法

      result := MyDataClass.OpenQuery(' select '+input_str);
      output_str:=Input_str;
//      ShowMessage(Input_str);
    except
      result := false;
    end;
    if result = false then
      Application.MessageBox('计算公式设定不正确! ','提示',mb_ok);
  end
  else  //*************空字符串暂时通过验证****************
    result := true;
end;



function TFormula_Verify.Assign_Formula_Param_Value(
  DataSet: TDataSet;var str_expr:string): boolean;
var

Str_Eng_Spec:string;// = '''pX3f7Nj0wjg''';
str_Eng_Table:string; //= 'ebuo7k6y29jp';
//用于替换和参数名称相同的字符串
  str_tmp,
  str_Param:string;
begin
//处理方法
//1。如果公式中遇到了和参数名称相同的字符串，那么先用一个特殊字符替换掉
//2。把公式中的参数全部赋值后，再替换回来
  str_Eng_Spec:= QuotedStr('pX3f7Nj0w8jg'+formatdatetime('yymmddhhnnss',now));
  str_Eng_Table:= 'eb3o7k6y2a9jp'+formatdatetime('yymmddhhnnss',now);
  DataSet.First;
  Result:=False;
  while not DataSet.Eof do begin
    str_Param:=trim(DataSet.fieldByName('parameter_name').AsString);
    str_tmp:= QuotedStr(str_Param);
//1。先把公式中和参数名称一样的字符串替换
    str_expr:= StringReplace(str_expr,str_tmp,Str_Eng_Spec,[rfReplaceAll]);
//2.再把公式中表单名称和参数一样的字符串替换
    str_expr:= StringReplace(str_expr,str_Param+'(',Str_Eng_Table,[rfReplaceAll]);

//2。再给公式中的参数赋值
    if DataSet.FieldByName('Data_type').Value = 1 then //数字型
      str_expr:= StringReplace(str_expr,str_Param,trim(DataSet.FieldByName('Unit_Value').AsString),[rfReplaceAll])
    else //字符型
      str_expr:= StringReplace(str_expr,str_Param,QuotedStr(trim(DataSet.FieldByName('Unit_Value').AsString)),[rfReplaceAll]);
//3。再把公式中的参数名称一样的字符串还原
    str_expr:= StringReplace(str_expr,Str_Eng_Spec,str_tmp,[rfReplaceAll]);
    str_expr:= StringReplace(str_expr,Str_Eng_Table,str_Param+'(',[rfReplaceAll]);
    DataSet.next;
    result := True;
  end;
end;

function TFormula_Verify.Calc_Expr(str_Expr: string): double;
begin
  result:= ExprCalc.CalcExpr(str_expr);
//  CalcExpr(
end;

function TFormula_Verify.Calc_Eng_Table(var str_expr: string): boolean;
//用于替换和参数名称相同的字符串
var
  Str_Eng_Table ,
  str_tmp,
  str_Param:string;
  Eng_Expr,X,Y,sLeft,sRight,sValue:string;
  P1,P2,P3:integer;
begin
  try
    result := true;
//处理方法 F(X,Y)
//1。如果公式中遇到了和工程表单名称相同的字符串，那么先用一个特殊字符替换掉
//2。把公式中的参数全部赋值后，再替换回来
    str_Eng_Table:= 'ebuo7k6y29jp'+formatdatetime('yyyymmddhhnnss',now);
    aqTmp2.Open;
    aqTmp2.First;
    while not aqTmp2.Eof do begin
      str_Param:=trim(aqTmp2.fieldByName('Eng_table_Name').AsString);
      str_tmp:= QuotedStr(str_Param);
      while Pos(str_Param,str_expr)>0 do begin
        P1:=Pos(str_Param,str_expr);
  //1。先把公式中和表单名称一样的字符串替换
        str_expr:= StringReplace(str_expr,str_tmp,Str_Eng_Table,[rfReplaceAll]);
  //2。计算工程表单
        P2:=Pos('(',copy(str_expr,P1,length(str_expr)-P1))+P1-1;//取得第一个'('的位置
        P3:=Get_PosOfbracket(copy(str_expr,P2+1,100000))+P2;//获得表单')'的位置
        Eng_Expr:=copy(str_expr,P1,P3); //获得工程表单表达式
        sLeft:=copy(str_expr,1,P1-1);
        sRight:=copy(str_expr,P3+1,Length(str_expr)-P3);
        //1。先从主表中获得X,Y数值，如果Y=NULL,那么
        DeCode_FXY(Eng_Expr,x,y);
        sValue:=Calc_FX(aqTmp2.fieldByName('rKey').AsInteger,aqTmp2.fieldByName('Data_type').AsInteger,x,y);
        str_expr:=sLeft+sValue+sRight;

  //3。再把公式中的参数名称一样的字符串还原
        str_expr:= StringReplace(str_expr,Str_Eng_Table,str_tmp,[rfReplaceAll]);
      end;
      aqTmp2.next;
    end;
  except
    result := false;
  end;
end;

procedure TFormula_Verify.DeCode_FXY(strExpr: string; var X, Y: string);
var
  P1,P2,P3:integer; //F(X,Y);
begin
  P1:= Pos('(',strExpr);
  P2:= Pos(',',strExpr);
  P3:= Pos(')',strExpr);
  x:= copy(strExpr,P1+1,P2-P1-1);
  y:= copy(strExpr,P2+1,P3-P2-1);
end;

function TFormula_Verify.Calc_FX(rKey, DataType: integer; sX, sY: string): string;
var
  Sqlstr:string;
  dX, dY: Double;
begin
  dx:=0;dy:=0;
  if DataType = 1 then
  begin
    dx:=StrToFloat(sx);
    dy:=StrToFloat(sY);
  end;
  Sqlstr:= 'exec autocal85 '+ IntToStr(DataType)+ ', '+IntToStr(rKey) +','+QuotedStr(sy)+','+QuotedStr(sx)+','+FloatToStr(dY)+','+FloatToStr(dX);
  MyDataClass.OpenQuery(sqlstr);
  result := MyDataClass.aqTmp.Fields[0].value;
  MyDataClass.aqTmp.close;
end;

function TFormula_Verify.Calc_Formula(dsParam:TDataSet;str_Expr: string): double;
begin
  if Formula_Verify.Assign_Formula_Param_Value(dsParam,str_expr) then
  str_expr:= Formula_Verify.Get_If_Expr(str_expr);
  if Formula_Verify.Calc_Eng_Table(str_expr) then
    result := Formula_Verify.Calc_Expr(str_expr)
  else
    result := -99999999.99;
end;



function TFormula_Verify.Check_Param(strExpr: string): boolean;
//var
//  i,j:integer;
//  Tmpstr,sLeft:string;
begin
  Result:=False;
//  if (trim(strExpr) = trim(Str_Type)) or (trim(strExpr) = trim(Str_Type)) then
//    result := true
//  j:=1;
//  Tmpstr:=strExpr;
//  for i :=1 to Length(Tmpstr) do
//  begin
//    if Is_Operator(Tmpstr[i]) then
//      sLeft:= copy(Tmpstr,
//  end;
end;

function TFormula_Verify.Is_Operator(C: Char): Boolean;
begin
  if c in ['+','-','*','/'] then
    Result := True
  else
    Result := False;
end;

function TFormula_Verify.Verify_Logic_Formula(Input_str: string;
  var output_str: string): boolean;
begin
  result := false;
  if trim(Input_str)<>'' then
  begin
    if pos(' XXXXYYYY ',Input_str)>0 then
    begin
      Application.MessageBox('XXXXYYYY'+'是系统保留变量,请不要使用该名称做为用户参数名称','提示',mb_ok);
      exit;
    end;
    Input_str:= Replace_Expr_Factor(Input_str);
    try
      Input_str:= Get_If_Expr(Input_str);
//剥除了if函数后，再处理其他的部分。
//      ExprCalc.PublicExplain(Input_str);
//判断每个参数是否合法

      result := MyDataClass.OpenQuery(' select 2 where '+input_str);
      if result then // 使用OR可以另SQL判断出逻辑表达式左右是否数据一致,仅做语法检测
        result := MyDataClass.OpenQuery(' select 2 where '+StringReplace(uppercase(input_str),'AND','OR',[rfReplaceAll]));
      output_str:=Input_str;
//      ShowMessage(Input_str);
    except
      result := false;
    end;
    if result = false then
      Application.MessageBox('计算公式不正确,可能参数数据类型不匹配或者不是逻辑表达式! ','提示',mb_ok);
  end
  else  //*************空字符串暂时通过验证****************
    result := true;
end;

function TFormula_Verify.Calc_Logic_Expr(str_Expr: string): boolean;
begin
Result:=False;
end;

function TFormula_Verify.Get_Logic_Expr(str_Expr: string): string;
var
  Prase:string;
  i:integer;
  strLeft,strRight,TmpExpr,Div_A,Div_B:string;
  n : integer;
  Op : TOperator;
  DataType,DataType2:byte;//数据类型1:数字，2:字符
  intLen : integer;
  Rslt:boolean;
begin
//1.查找是否有 >,<,>=,<=,<>,+符号,如果有,                if( A>B or A> C,
//2.分解2边的表达式,如果遇到 NOT,AND,(,),','那么就以此为界点,取值,否则全部取值
//比较2边的数值,返回一个布尔型数值
  rslt:=False;
  i:= Pos_AndOR_Prase(str_Expr,Prase);
  if i >0 then //找到了' AND 或者 OR '
  begin
    TmpExpr:= copy(str_expr,1,i-(Length(Prase)));
  end;
  Op := opEqual;
  intLen := 1;
  N:=0;
  while (n <= Length(TmpExpr))  do
  begin
    case TmpExpr[N] of
      '<' : begin
              if TmpExpr[N + 1] = '>' then
              begin
                Op := opUnequal;
                intLen := 2;
              end else
                if TmpExpr[N + 1] = '=' then
                begin
                  Op := opLessOrEqual;
                  intLen := 2;
                end else
                  Op := opLess;
                break;
              end;
      '>' : begin
              if TmpExpr[N + 1] = '=' then
              begin
                Op := opGreaterOrEqual;
                intLen := 2;
              end else
                Op := opGreater;
              break;
            end;
      '=' : begin
              Op := opEqual;
              break;
            end;
    end;
    inc(N);
  end;

//
  if N = 0 then
  begin
    result := TmpExpr;
    exit;
  end;
  
  strLeft:= De_Logic_Prase(copy(TmpExpr,1,N-1),1,Div_A);
  strRight:= De_Logic_Prase(copy(tmpExpr,N+IntLen,100000),2,Div_B);

//判断字段是数字型还是字符型  //判断strleft部分数据类型，
  DataType :=Judge_Data_Type(strLeft);
  if DataType = 3 then
  begin
    Application.MessageBox(Pchar('表达式 '+strLeft+' 无效,请检查'),'提示',mb_Ok);
    abort;
  end;

  DataType2 :=Judge_Data_Type(strRight);
  if DataType = 3 then
  begin
    Application.MessageBox(Pchar('表达式 '+strRight+' 无效,请检查'),'提示',mb_Ok);
    abort;
  end;
  if DataType <> DataType2 then
  begin
    Application.MessageBox(Pchar('数据类型不一致,请检查'),'提示',mb_Ok);
    abort;
  end;

//假如类型是数字，那么表达式还需要处理一次
  if DataType = 1 then
  begin
    strLeft:= ExprCalc.PublicExplain(strleft);
    strRight:= ExprCalc.PublicExplain(strRight);
  end
  else
  begin
{    if trim(strLeft) = trim(Int_Type) then
      DataType:= 1
    else }if (trim(strLeft) = trim(Str_Type)) or (trim(strRight) = trim(Str_Type)) then
      DataType:= 2
    else
    begin
      Application.MessageBox(Pchar(strLeft+' 和 '+strRight+' 必须有一个为参数,请确认'),'提示',mb_OK);
      abort;
    end;
  end;

  case Op of
    opGreater : case DataType of
                       1: Rslt := (StrToFloat(strLeft) > StrToFloat(strRight));
                       2: Rslt := strLeft > strRight;
                end;

    opGreaterOrEqual : case DataType of
                       1: Rslt := StrToFloat(strLeft) >= StrToFloat(strRight);
                       2: Rslt := strLeft >= strRight;
                end;
    opLess : case DataType of
                       1: Rslt := StrToFloat(strLeft) < StrToFloat(strRight);
                       2: Rslt := strLeft < strRight;
                end;
    opLessOrEqual : case DataType of
                       1: Rslt := StrToFloat(strLeft) <= StrToFloat(strRight);
                       2: Rslt := strLeft <= strRight;
                end;
    opEqual : case DataType of
                       1: Rslt := StrToFloat(strLeft) = StrToFloat(strRight);
                       2: Rslt := strLeft = strRight;
                end;
    opUnequal : case DataType of
                       1: Rslt := StrToFloat(strLeft) <> StrToFloat(strRight);
                       2: Rslt := strLeft <> strRight;
                end;
  end;
  if rslt then

end;

function TFormula_Verify.Pos_AndOR_Prase(str_Expr: string;Prase:string): integer;
var i,j:integer;
begin
  i:= Pos('AND',uppercase(str_expr));
  j:= Pos('OR',uppercase(str_expr));
  if i < j then
  begin
    result := i;
    Prase:='AND';
  end
  else
  begin
    result := j;
    Prase := 'OR';
  end;
end;

function TFormula_Verify.De_Logic_Prase(str_Expr: string;iType:byte;var Div_Expr:string): string;
var
  tmp_Expr:string;
  i:integer;
begin
   i:=0;
  if iType = 1 then //左边
  begin
    tmp_Expr:= str_Expr;
    if Pos(',',tmp_Expr)>0 then
      i:= Pos(',',tmp_Expr)
    else if Pos('(',tmp_Expr)>0 then
      i:= Pos('(',tmp_Expr)+1;  //不包括','
    if i > 0 then
    begin
      result := copy(str_expr,i,10000);
      Div_Expr:= copy(str_expr,1,i-1);
    end
    else
      result := str_expr;
  end
  else if iType = 2 then //右边
  begin
    tmp_Expr:= str_Expr;
    if Pos('AND',tmp_Expr)>0 then
    begin
      i:= Pos('AND',tmp_Expr);
      Div_Expr:= copy(str_expr,i+3,10000);
    end
    else if Pos('OR',tmp_Expr)>0 then
    begin
      i:= Pos('OR',tmp_Expr);
      Div_Expr:= copy(str_expr,i+2,10000);
    end  
    else if Pos('NOT',tmp_Expr)>0 then
    begin
      i:= Pos('NOT',tmp_Expr);
      Div_Expr:= copy(str_expr,i+3,10000);
    end
    else if Pos(',',tmp_Expr)>0 then
    begin
      i:= Pos(',',tmp_Expr);
      Div_Expr:= copy(str_expr,i+1,10000);
    end;
    if i > 0 then
      result := copy(str_expr,1,i-1)
    else
      result := str_expr;
  end;
end;

function TFormula_Verify.Is_Logic_Operator(C: string): Boolean;
begin
  if POS('<',uppercase(C)) > 0 then 
    Result := True
  else if POS('=',uppercase(C)) > 0 then 
    Result := True
  else if POS('>',uppercase(C)) > 0 then 
    Result := True
  else
    Result := False;
end;

function TFormula_Verify.Verify_Part_Cost_Formula(Cost_Dept,Part_Group:integer;Input_str: string;
  var output_str: string): boolean;
begin
  result := false;
  if trim(Input_str)<>'' then
  begin
    if pos(' XXXXYYYY ',Input_str)>0 then
    begin
      Application.MessageBox('XXXXYYYY'+'是系统保留变量,请不要使用该名称做为用户参数名称','提示',mb_ok);
      exit;
    end;
    Input_str:= Replace_Factor_Part_Cost(Cost_Dept,Part_Group,Input_str);
    try
      Input_str:= Get_If_Expr(Input_str);
//剥除了if函数后，再处理其他的部分。
//      ExprCalc.PublicExplain(Input_str);
//判断每个参数是否合法

      result := MyDataClass.OpenQuery(' select '+input_str);
      output_str:=Input_str;
//      ShowMessage(Input_str);
    except
      result := false;
    end;
    if result = false then
      Application.MessageBox('计算公式设定不正确! ','提示',mb_ok);
  end
  else  //*************空字符串暂时通过验证****************
    result := true;
end;

function TFormula_Verify.Replace_Factor_Part_Cost(Cost_Dept,Part_Group:integer;
  Input_str: string): string;
begin
  Input_str:= StringReplace(Input_str, #$D#$A, '', [rfReplaceAll]);

  Input_str:=' '+uppercase(Input_str)+' ';

  Input_str:= StringReplace(Input_str,' PROJECT ',Str_Type,[rfReplaceAll]);

  Input_str:= StringReplace(Input_str,' CP_REV ',Str_Type,[rfReplaceAll]);

  Input_str:= StringReplace(Input_str,' CUST_CODE ',Str_Type,[rfReplaceAll]);

  Input_str:= StringReplace(Input_str,' BOM.',' ',[rfReplaceAll]);
  Input_str:= StringReplace(Input_str,' PD.',' ',[rfReplaceAll]);
 //打开工程表单表，替换公式中的数值
//  Input_str:= StringReplace(Input_str,' ','',[rfReplaceAll]);
  if not aqTmp2.Active then
  aqTmp2.Open ;
  aqTmp2.first;
  while not aqTmp2.Eof do begin
    if aqTmp2.FieldByName('data_type').AsInteger=1 then
      Input_str:= StringReplace(Input_str,' '+trim(Is_Null(uppercase(aqTmp2.fieldbyname('FXY').asstring),''))+' ',Int_Type,[rfReplaceAll])
    else
      Input_str:= StringReplace(Input_str,' '+trim(Is_Null(uppercase(aqTmp2.fieldbyname('FXY').asstring),''))+' ',Str_Type,[rfReplaceAll]);

    aqTmp2.next;
  end;
  aqTmp2.close;


  //验证工程参数表
  aqTmp1.close;
  aqTmp1.SQL.Clear;
  aqTmp1.SQL.Add(' select p.rKey,P.parameter_name,P.Data_Type from data0506 m left join data0278 p on m.PARAMETER_PTR=p.rkey where ttype =3 and source_ptr='+IntToStr(Cost_Dept));
  aqTmp1.SQL.Add(' union select p.rKey,P.parameter_name,P.Data_Type  from data0499 M inner join data0278 p on m.Parameter_ptr=p.rKey where m.Inv_Group_ptr= '+IntToStr(Part_group));
  aqTmp1.SQL.Add(' union select M.rkey,M.PARAMETER_NAME,M.Data_Type from Data0278 M,Data0277 D where M.category_ptr=D.rkey and D.Category_type<=2 '); 
  aqTmp1.Open;
  aqTmp1.First;
  while not aqTmp1.Eof do begin
  //如果参数类型是数值型，那么就用 ' 2' 来替换参数，如果是字符型，那么用 ' ''X'' '替代参数
    if aqTmp1.FieldByName('data_type').AsInteger=1 then
      Input_str:= StringReplace(Input_str,' '+trim(Is_Null(uppercase(aqTmp1.fieldbyname('parameter_name').asstring),''))+' ',Int_Type,[rfReplaceAll])
    else
      Input_str:= StringReplace(Input_str,' '+trim(Is_Null(uppercase(aqTmp1.fieldbyname('parameter_name').asstring),''))+' ',Str_Type,[rfReplaceAll]);

    aqTmp1.next;
  end;
  aqTmp1.close;

  result := Input_Str;
end;

function TFormula_Verify.Calc_Expr_Parma(var str_Expr: string;out Out_Value:double): boolean;
begin
  result := true;
  if trim(str_expr) <> '' then
  begin
    str_expr:= Get_If_Expr(str_expr);
    try
      str_expr:= Get_If_Expr(str_expr);
      Out_Value := MyDataClass.Get_Sql_Value(' select 1.0*'+str_expr);//Calc_Expr(str_expr);
    except
      result := false;
      Application.MessageBox('计算失败,请检查公式参数是否已经赋值! ','提示',mb_ok);
      Out_Value:=0;
    end;
  end
  else
    Out_Value:=0;
end;

{--------------------MyTree Class---------------------}

constructor TMyTreeClass.Create(AdoConnection: TAdoConnection);
begin
  FAdoConnection := AdoConnection;
  qryTmpItem := TAdoQuery.Create(application);
  qryTmpItem.Connection := FAdoConnection;
  qryTmpItem.CursorLocation := clUseClient;
  qryTmpItem.CursorType := ctStatic;
  qryTmpItem.LockType := ltBatchOptimistic;
end;

procedure TMyTreeClass.Create_Tree_List(TreeView: TTreeView);
var
  Node : array [0..10] of TTreeNode;
  tmp : String;
begin
  TreeView.Items.Clear;
  qryTmpItem.First;
  tmp := trim(qryTmpItem.FieldByName('ItemName').AsString);
  Node[qryTmpItem.FieldByName('LevNo').asinteger] := TreeView.Items.Add(nil,tmp);
  qryTmpItem.Next;

  while not qryTmpItem.Eof do
  begin
    tmp := trim(qryTmpItem.FieldByName('ItemName').AsString);
    Node[qryTmpItem.FieldByName('LevNo').asinteger] := TreeView.Items.AddChild(Node[qryTmpItem.FieldByName('LevNo').asinteger-1] ,tmp);
    qryTmpItem.next;
  end;
  TreeView.FullExpand;
end;

destructor TMyTreeClass.Destroy;
begin
  qryTmpItem.Close;
  qryTmpItem.Free;
  inherited;
end;

procedure TMyTreeClass.Expand_My_Tree_Down(TreeView: TTReeView;
  TopNo,SqlStr,TreeTitle: String);
begin
  qryTmpItem.Close;
  qryTmpItem.SQL.Clear;
  qryTmpItem.SQL.Add('select * from tmp_TreeList where SeqNo=0');
  qryTmpItem.open;

  Sel_Sql := SqlStr;
  qryTmpItem.close;
  qryTmpItem.open;
  SeqNo := 0;
  SetLength(FieldName,4);
  FieldName[0] := 'ItemNo';
  FieldName[1] := 'SeqNo';
  FieldName[2] := 'ItemName';
  FieldName[3] := 'LevNo';

  SetLength(FieldValue,4);
  FieldValue[0] := '0';
  FieldValue[1] := 0;
  FieldValue[2] := TreeTitle;
  FieldValue[3] := 0;
  Write_Tree_Item(qryTmpItem);
  Get_Tree_List_Data(TopNo,1);
  Create_Tree_List(TreeView);
end;

procedure TMyTreeClass.Expand_My_Tree_Down(TreeView: TTReeView;
  TopNo: integer; SqlStr, TreeTitle: String);
begin
  qryTmpItem.Close;
  qryTmpItem.SQL.Clear;
  qryTmpItem.SQL.Add('select * from tmp_TreeList where SeqNo=0');
  qryTmpItem.open;

  Sel_Sql := SqlStr;
  qryTmpItem.close;
  qryTmpItem.open;
  SeqNo := 0;
  SetLength(FieldName,4);
  FieldName[0] := 'ItemNo';
  FieldName[1] := 'SeqNo';
  FieldName[2] := 'ItemName';
  FieldName[3] := 'LevNo';

  SetLength(FieldValue,4);
  FieldValue[0] := '0';
  FieldValue[1] := 0;
  FieldValue[2] := TreeTitle;
  FieldValue[3] := 0;
  Write_Tree_Item(qryTmpItem);
  Get_Tree_List_Data(TopNo,1);
  Create_Tree_List(TreeView);
end;

procedure TMyTreeClass.GetFieldValue(DataSet: TDataSet);
begin
//  for i := Low(FieldName) to High(FieldName) do
//  begin
   FieldValue[0]:=  DATASET.FieldByName('ItemNo').Value;
   FieldValue[1]:= SeqNo;
   FieldValue[2]:= DATASET.FieldByName('ItemName').Value;
//   FieldValue[3]:= LevNo;
end;

procedure TMyTreeClass.Get_My_Tree_Data(TopNo, SqlStr, TreeTitle: String;DataSet:TCustomAdoDATASET);
begin
  qryTmpItem.Close;
  qryTmpItem.SQL.Clear;
  qryTmpItem.SQL.Add('select * from tmp_TreeList where SeqNo=0');
  qryTmpItem.open;

  Sel_Sql := SqlStr;
  qryTmpItem.close;
  qryTmpItem.open;
  SeqNo := 0;
  SetLength(FieldName,4);
  FieldName[0] := 'ItemNo';
  FieldName[1] := 'SeqNo';
  FieldName[2] := 'ItemName';
  FieldName[3] := 'LevNo';

  SetLength(FieldValue,4);
  FieldValue[0] := '0';
  FieldValue[1] := 0;
  FieldValue[2] := TreeTitle;
  FieldValue[3] := 0;
  Write_Tree_Item(qryTmpItem);
  Get_Tree_List_Data(TopNo,1);
  DataSet.Clone(qryTmpItem);
end;

procedure TMyTreeClass.Get_Tree_List_Data(TopNo: String; LevNo: integer);
var
  MSql : String;
  qrytmpMB :TAdoQuery;
begin
  Inc(SeqNo);
  MSql := Sel_Sql+QuotedStr(TopNo);
    qrytmpMB := TADOQuery.Create(nil);
    qrytmpMB.Connection :=FAdoConnection;
    qrytmpMB.close;
    qrytmpMB.SQL.Clear;
    qrytmpMB.Sql.Add(MSql);
    qrytmpMB.Open;
    qrytmpMB.first;
    while not qrytmpMB.eof do
    begin
//      GetFieldValue(qrytmpMB);
       FieldValue[0]:=  qrytmpMB.FieldByName('ItemNo').Value;
       FieldValue[1]:= SeqNo;
       FieldValue[2]:= qrytmpMB.FieldByName('ItemName').Value;
       FieldValue[3]:= LevNo;
      Write_Tree_Item(qryTmpItem);
      Get_Tree_List_Data(qrytmpMB.FieldByName('ItemNo').ASString,LevNo+1);
      qrytmpMB.Next;
    end;
    qrytmpMB.Cancel;
    qrytmpMB.Close;
    qrytmpMB.free;
end;

procedure TMyTreeClass.Get_Tree_List_Data(TopNo, LevNo: integer);
var
  MSql : String;
  qrytmpMB :TAdoQuery;
begin
  Inc(SeqNo);
  MSql := Sel_Sql+IntToStr(TopNo);
    qrytmpMB := TADOQuery.Create(nil);
    qrytmpMB.Connection :=FAdoConnection;
    qrytmpMB.close;
    qrytmpMB.SQL.Clear;
    qrytmpMB.Sql.Add(MSql);
    qrytmpMB.Open;
    qrytmpMB.first;
    while not qrytmpMB.eof do
    begin
//      GetFieldValue(qrytmpMB);
       FieldValue[0]:=  qrytmpMB.FieldByName('ItemNo').Value;
       FieldValue[1]:= SeqNo;
       FieldValue[2]:= qrytmpMB.FieldByName('ItemName').Value;
       FieldValue[3]:= LevNo;
      Write_Tree_Item(qryTmpItem);
      Get_Tree_List_Data(qrytmpMB.FieldByName('ItemNo').ASString,LevNo+1);
      qrytmpMB.Next;
    end;
    qrytmpMB.Cancel;
    qrytmpMB.Close;
    qrytmpMB.free;
end;

procedure TMyTreeClass.Get_Tree_List_Data_Up(TopNo: String;
  LevNo: integer);
begin
//
end;

procedure TMyTreeClass.Write_Tree_Item(DATASET: TDATASET);
var
  i:integer;
begin
  DATASET.append;
  for i := Low(FieldName) to High(FieldName) do
    DATASET.FieldByName(FieldName[i]).Value := FieldValue[i];
  DATASET.Post;
end;

function TFormula_Verify.Pos_OF_Operator(C: string): integer;
var
  i:integer;
begin
  if POS('<',uppercase(C)) > 0 then
    i:=POS('<',uppercase(C))
  else if POS('=',uppercase(C)) > 0 then 
    i:=POS('=',uppercase(C))
  else if POS('>',uppercase(C)) > 0 then
    i:=POS('>',uppercase(C))
  else
    i:=0;
  result := i;
end;

end.







