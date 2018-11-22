unit common;
//******************************************************************************
//                                                                             *
//Code Maker: Jacky Zhong                                                      *
//date: 2007-11-16                                                             *
//comments: 该单元是公用函数模块，写公用函数，方便各模块调用，减少重复代码     *
//                                                                             *
//******************************************************************************
interface
uses
  windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DBCtrls,
  VCLCom, StdVcl, DBClient, Grids, DBGrids, ExtCtrls, ComCtrls, Menus, dbtables, DBCtrlsEh,
  DB, ADODB, Provider, variants, winsock, Midas, ComConst, MyClass, Pick_Item_Single, ConstVar,
  OleServer, Excel2000, StdCtrls, ComObj, DBGridEh, JPEG, DateUtils, math, WinProcs, IdFTP, IdFTPCommon;
const
  base64 = 'oeJzcNn7YV5ZKv+EhQaC3Xu/WiO24PDylRdqkGjI9TwUFrxL1bMHfpA6gsSt0Bm8';

type
     TMyString = class(TObject)
      Str: string;
     end;
  TMyIntSet = set of 0..100;
  TExcludeColumns = set of 0..255;

var
  hMapFile,dialog: THandle;
  MapFilePointer: Pointer;
  OldGridWnd: TWndMethod;
  Q_Ado: TADOQuery; //zhoupei
  user_ptr,rkey73, vprev,db_ptr: string;
  Cur_Dir, FTP_Srv_IP, FTP_USER, FTP_Pswd: string;

//数据库操作类
function OpenQuery(Query: TAdoQuery; Sqlstr: string): boolean; overload; //传入sql打开数据
function SaveData(ads_Tmp: array of TADODataSet): boolean; overload; //数据更新函数，返回值：true成功，false失败
function ExecSql(Query: TAdoQuery; Sqlstr: string): boolean; //执行一段sql命令
function DeleteRecord(ads_Tmp: TADODataSet; FieldName: string; FieldValue: variant): boolean; overload; //删除指定的记录，返回值：FieldName字段，fieldValue:指定的记录数值
function DeleteRecord(sqlstr: string; Query: TAdoQuery): boolean; overload; //删除记录,传入一个sql和query,用于执行sql命令
//加密函数
function Base64_Encode(DecryptedText: string): string;
function Base64_Decode(a: string): string;
function mimeencode(w: Integer): string;
function mimedecode(a: string): Integer;
function Decode_Old_Pswd(pswd: string): string; //解密过数人员老密码

//返回数值函数
//  function Check_Unique_Value(sqlstr,KeyValue:string;Query:Tadoquery):boolean;//查找一个数值是否已经存在数据表中，sqlstr，查找
function Get_Unit_Name(rKey: integer): string; //传入单位代码，返回单位名称
function Get_Eng_Param_Type(rKey: integer): string; //传入工程参数代码，返回工程参数名称
function Get_Max_SeqNo(DataSet: TDataSet; FieldName: string): integer; //返回数据表的某个字段最大数值，必须为整形的
function Param_Name_To_rKey(value: string): integer; //根据工程参数名称返回rkey
function Param_rKey_To_Name(value: integer): string; //根据工程参数rkey返回名称
function Get_Eng_Formula_Expr(EngTable: integer): string; //根据工程表单ID，返回表达式
function Get_Eng_Table_Name(rKey: integer): string; //根据工程表单编号，返回名称
function Get_Eng_Table_Formula_List(DataSet: TAdoQuery): boolean; //获得工程表单公式列表
function Calc_Eng_Table(rkey, s_Y, s_X, d_Y, d_X: string): variant; //计算工程表单
function Get_MI_CHN_Status(TValue: integer): string; //返回MI的状态
function Get_BOM_CHN_Status(TValue: integer): string; //返回BOM的状态
function Get_Field_Total_Value(DataSEt: TDATASET; FieldName: string): double; //获取某个字段的汇总值,必须为整型或浮点型
{ExRoundTo扩展四舍五入函数
  AValue：待舍入浮点数
  ADigit:保留小数位数，保留到小数为正数，保留到整数为负数
  IsTruncate:舍入模式，截断模式为true，四舍五入模式为false }
function ExRoundTo(const AValue: Double; const ADigit: TRoundToRange;IsTruncate:boolean=false): Double;


//日期型函数
function Get_Month_First_Day(indate: TDate): TDate;
function Get_Month_Last_Day(indate: TDate): TDate;
//字段有效性验证函数
//其他非数据函数
procedure ShowMsg(Info, title: string; Btn_type: byte); overload; //弹出消息框,btn_type:类型,1。单个按纽，2。2个按纽
procedure ShowMsg(Info: string; Btn_type: byte); overload; //弹出消息框,btn_type:类型,1。单个按纽，2。2个按纽
procedure Export_Grid_to_Excel(Grid: TStringgrid; title_caption: string;isStr:boolean=false); overload; //导出stringgrid中的数据到excel
procedure Export_Grid_to_Excel(Grid: TStringgrid; title_caption: string;isStr:TMyIntSet); overload; //导出stringgrid中的数据到excel
procedure SetOptimalGridCellWidth(sg: TStringGrid;ExcludeColumns: TExcludeColumns); //自动调节STRGRID列宽

procedure Export_dbGrid_to_Excel(dbGrid: Tdbgrid; title_caption: string); overload;
procedure Export_dbGridEH_to_Excel(dbGrid: TDBGridEh; title_caption: string); overload;
procedure Export_Tlistview_to_Excel(listview: TListView; title_caption: string); overload;
procedure load_xls_to_sgrid(fileName:String; grid:TStringGrid);//从Excel中读取数据到 Grid

function Msg_Dlg_Ask(Info, title: string; btn_type: byte): boolean; //弹出消息框.提供yes,no选择
function Is_NUll(Input_value, Output_Value: variant): variant; //判断传入的数值是否是NULL，并返回一个指定的数值
function getsystem_date(Query: TAdoQuery; datetype: byte): tdatetime; //返回服务器日期
function GetLocalIP: string; //获取本机IP
function GetLocalName: string;
function GetColumnCaption(FieldName: string; Grid: TDBGRid): string; //根据字段值，返回dbgrid的字段caption
function Check_Db_Connected(Connection: TAdoConnection; connStr: string): boolean; //根据输入的Ado主连接字符串,判断当前连接的数据库是否一致
function ExtractSpecValue(ConnStr: string; SpecName: string): string;
procedure ReSet_Sort(GRId: TDBGRidEH);

//  function Get

function Eng_Formula_Verify(AdoConn: TAdoConnection; Input_value: string): boolean; //工程参数公式验证,输入：adoconn：ado的连接，input_value，验证的公式
function Formula_Check(strExpr: string; AdoConn: TAdoConnection; var str: string): boolean; //公式验证
function Logic_Formula_Check(strExpr: string; AdoConn: TAdoConnection; var str: string): boolean; //逻辑公式验证
function Part_Cost_Formula_Verify(Cost_Dept, Part_Group: integer; strExpr: string; AdoConn: TAdoConnection; var str: string): boolean; //材料用量成本公式验证,输入：adoconn：ado的连接，input_value，验证的公式
function Calc_Expr_Parma(var str_Expr: string; AdoConn: TAdoConnection; out Out_Value: double): boolean; //计算表达式的值(参数已经赋值)

function App_Init(AdoConn: TADoConnection): boolean; //为程序启动设置各种参数(xyz2055coimasp20)
function App_init_2(AdoConn: TADoConnection): boolean; //为程序启动设置各种参数(coimasp20)
function GetFileVersion(fileName: string): PFile_Ver_INfo; //得到本程序的版本号
procedure DownLoad_Files_From_FTP(FileType: byte; fileMask: string; Local_Dir, Srv_Dir: string); //从服务器下载某种类型文件
function Get_File_List(Dir: string; FileMask: string; var LS: TStringList): boolean; //获取目录下的文件

function IsFileInUse(FName: string): Boolean;
function Get_File_Handle(FName: string): HWND;
function Get_File_Modify_Time(FileName: string): TDatetime; //返回文件的修改时间
function IS_Stock_Inventorying: boolean; //判断生产在制品是否在盘点400
function IS_FG_counting: boolean; //判断产成品是否在盘点214
//选择对话框
function Pick_Single_Item(InputVar: PDlgInput): variant; overload; //单项选择
function Pick_Single_Item_New(InputVar: PDlgInput): variant; //增加字段宽度定义

function Pick_Eng_Param(value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择工程参数，picktype:1。返回参数rkey，2。返回参数名称
function Pick_Pub_Eng_Param(value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择全局工程参数，picktype:1。返回参数rkey，2。返回参数名称
function Pick_IES_Eng_Param(value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择制程参数，picktype:1。返回参数rkey，2。返回参数名称

function Pick_Eng_Param_New(value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择工程参数，picktype:1。返回参数rkey，2。返回参数名称
function Pick_Cust_ID(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择客户
function Pick_Prod_Type(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择产品类型
function Pick_Sales_Man(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择业务员
function Pick_Sales_Director(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择业务主管
function Pick_Eng_Flow(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择工序
function Pick_Department(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择部门
function Pick_Cost_Dept(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择成本中心
function Pick_Acct_Title(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择会计科目
function Pick_Part_Group(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择物料类型
function Pick_Part(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择物料
function Pick_Employee(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择员工
//  function Pick_Prod_Type(Value:variant;AdoConn:TAdoconnection;PickType:byte):variant;//选择产品类型
function Pick_Work_Order(value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择作业单
procedure pAnds(tree: TTreeView; Dt: TDataset; node: TTreeNode;iRoot: integer);


function Get_Pick_Value(PickItemId: integer; Value: variant; AdoConn: TAdoconnection; PickType: byte): string; //根据挑选项目ID，进行对话框挑选

//JPG图片存取函数
function Load_JPG_Pic_From_DB(pField: TField): TjpegImage; //从数据库读取图片，转换为JPG格式***To use this function, Must Include the unit JPEG***
procedure Save_JPG_Pic_To_DB(pImage: TImage; pDataSet: TCustomADODataSet; FieldName: string); //把image的图片转化为Jpg格式，赋值给相应的字段

procedure DataToTreeView(DataSet: TAdoDataSet; Treeview: TTreeview; RootText: string; DisplayFieldName: string);
function IsDatetime(str: string): boolean;
function IS_Float(InValue: string): boolean;
function IS_INteger(InValue: string): boolean;
procedure Add_ComBox_List(DataSET: TCustomAdoDataSet; FieldName: string; Combox: TComboBox);
function Check_Acct_Depr_Date(vDate: TDatetime): boolean; //验证日期是否属于有效的固定资产折旧期间
function Get_Acct_Depr_Date: TDATetime; //获取当前折旧月份
//树型展开
procedure Expand_Prod(AdoConnection: TAdoConnection; TreeView: TTReeView; TopNo: integer; TopName: string); //产品展开
function Update_Seed(rKey: integer; v_Seed: string): boolean; //更新自动增长的字符
function Update_Asset_ID_Code(rKey: integer; v_Seed: string): boolean; //更新固定资产编号
function Get_Seed(rKey: integer): string;

function Pick_Value(Value: variant; AdoConn: TAdoconnection; PickType: byte=2;ikind:integer=1): variant;


implementation
//uses DatePick;

function Pick_Value(Value: variant; AdoConn: TAdoconnection; PickType: byte=2;ikind:integer=1): variant;
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  if ikind=1 then
  begin
    FDlgInput.Fields := 'warehouse_code/工厂编号,warehouse_name/工厂名称';
    FDlgInput.Sqlstr := 'select rkey,(warehouse_code+''      '') as warehouse_code,warehouse_name from data0015 ';
    if PickType = 2 then FDlgInput.KeyField := 'warehouse_code';
  end;

  FDlgInput.AdoConn := AdoConn;
  FDlgInput.InPut_value := value;
  Tmp_rslt := Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result := Tmp_rslt
  else
    result := '';
end;

function OpenQuery(Query: TAdoQuery; Sqlstr: string): boolean;
begin
  result := true;
  try
    Query.Close;
    Query.Sql.Clear;
    Query.SQL.Add(sqlstr);
    Query.Open;
  except
    result := false;
//    Application.MessageBox('数据表打开失败，请检查','提示',mb_ok);
  end;
end;

procedure ShowMsg(Info, title: string; Btn_type: byte); overload;
begin
  case Btn_Type of
    1: Application.MessageBox(Pchar(Info), Pchar(title), mb_ok);
    2: Application.MessageBox(Pchar(Info), Pchar(title), MB_OKCANCEL);
  end;
end;

procedure ShowMsg(Info: string; Btn_type: byte); overload; //弹出消息框,btn_type:类型,1。单个按纽，2。2个按纽
begin
  case Btn_Type of
    1: Application.MessageBox(Pchar(Info), '提示', mb_ok);
    2: Application.MessageBox(Pchar(Info), '提示', MB_OKCANCEL);
  end;
end;

function Is_NUll(Input_value, Output_Value: variant): variant;
begin
  if VarIsNull(Input_Value) then
//  if Input_value = null then
    result := OutPut_value
  else
    result := Input_value;
end;

function ExecSql(Query: TAdoQuery; Sqlstr: string): boolean;
begin
  try
    Query.Close;
    Query.Sql.Clear;
    Query.SQL.Add(sqlstr);
    Query.ExecSQL;
    result := true;
  except
    result := false;
    ShowMsg('数据操作失败，请检查', '提示', 1);
  end;
end;

function getsystem_date(Query: TAdoQuery; datetype: byte): tdatetime;
begin //0,代表返回带时分秒的长日期格式,否则返回短日期格式
    Query.Close;
    query.SQL.Text := 'select getdate() as long_datetime,' + #13 +
      'convert(datetime,(convert(varchar,getdate(),101)),101) as sort_datetime';
    Query.Open;
    if datetype = 0 then
      result := query.FieldValues['long_datetime']
    else
      result := query.FieldValues['sort_datetime'];
end;

function GetLocalIP: string; //获取本机IP
type
  TaPInAddr = array[0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe: PHostEnt;
  pptr: PaPInAddr;
  Buffer: array[0..63] of char;
  I: Integer;
  GInitData: TWSADATA;
begin
  WSAStartup($101, GInitData);
  Result := '';
  GetHostName(Buffer, SizeOf(Buffer));
  phe := GetHostByName(buffer);
  if phe = nil then Exit;
  pptr := PaPInAddr(Phe^.h_addr_list);
  I := 0;
  while pptr^[I] <> nil do begin
    result := StrPas(inet_ntoa(pptr^[I]^));
    Inc(I);
  end;
  WSACleanup;
end;

function SaveData(ads_Tmp: array of TADODataSet): boolean; overload; //数据更新函数，返回值：true成功，false失败
var
  i: integer;
begin
  try
    //启动事务，必须保证所有的dataset公用一个adoconnection
    if not ads_Tmp[0].Connection.InTransaction then
      ads_Tmp[0].Connection.BeginTrans;
   //处理数据更新
    for i := low(ads_Tmp) to high(ads_Tmp) do
      ads_Tmp[i].UpdateBatch(arall);

    ads_Tmp[0].Connection.CommitTrans; //提交事务,
    result := true;
  except
    ads_Tmp[0].Connection.RollbackTrans; //回滚事务
    result := false;
  end;
end;

function DeleteRecord(ads_Tmp: TADODataSet; FieldName: string; FieldValue: variant): boolean; overload; //删除指定的记录，返回值：FieldName字段，fieldValue:指定的记录数值
begin
  ads_Tmp.Locate(FieldName, FieldValue, [loCaseInsensitive]); //查找的记录数值必须完全匹配
  ads_Tmp.Delete;
  result := SaveData(ads_tmp); //删除后保存到数据库
end;

function DeleteRecord(sqlstr: string; Query: TAdoQuery): boolean; overload; //删除记录,传入一个sql和query,用于执行sql命令
begin
  result := ExecSql(query, sqlstr);
end;

function Msg_Dlg_Ask(Info, title: string; btn_type: byte): boolean; //弹出消息框.提供yes,no选择
begin
  case Btn_Type of
    1: result := Application.MessageBox(Pchar(Info), Pchar(title), mb_okCancel) = IdOK;
    2: result := Application.MessageBox(Pchar(Info), Pchar(title), MB_YESNOCANCEL) = IDYes;
   else
    result := Application.MessageBox(Pchar(Info), Pchar(title), mb_okCancel) = IdOK;
  end;
end;

function GetColumnCaption(FieldName: string; Grid: TDBGRid): string; //根据字段值，返回dbgrid的字段caption
var
  i: integer;
begin
  result := '';
  for I := 0 to Grid.Columns.Count - 1 do
    if Grid.Columns[i].FieldName = FieldName then
      result := Grid.Columns[i].Title.Caption;
end;

function Get_Unit_Name(rKey: integer): string; //传入单位代码，返回单位名称
var
  sqlstr: string;
begin
  sqlstr := 'select IsNUll(unit_Code,' + QuotedStr('') + ') +' + QuotedStr('(') + '+ IsNull(Unit_name,'''')+'')''' + ' as UnitName from data0002 where rKey=' + IntToStr(rKey);
  result := MyDataclass.Get_Sql_Value(sqlstr);
end;

function Pick_Single_Item(InputVar: PDlgInput): variant; //单项选择
begin
  with TfrmPick_Item_Single.Create(Application) do
  try
    InitForm(InputVar);
    if Showmodal = mrok then
      result := Get_Rslt
    else
      result := NULL;
  finally
    free;
  end;
end;

function Get_Eng_Param_Type(rKey: integer): string; //传入工程参数代码，返回工程参数名称
var
  sqlstr: string;
begin
  sqlstr := 'select IsNUll(Category_name,' + QuotedStr('') + ') from data0277 where rKey=' + IntToStr(rKey);
  result := MyDataclass.Get_Sql_Value(sqlstr);
end;

function Get_Max_SeqNo(DataSet: TDataSet; FieldName: string): integer; //返回数据表的某个字段最大数值，必须为整形的
var
  i: integer;
  BookMark: Tbookmark;
begin
  try
    i := 0;
    BookMark := DataSet.GetBookmark;
    DataSet.EnableControls;
    DataSet.First;
    while not DataSet.Eof do begin
      if i < DataSet.FieldByName(FieldName).AsInteger then
        i := DataSet.FieldByName(FieldName).AsInteger;
      DataSet.Next;
    end;
    result := i;
    if BookMark <> nil then
      DataSet.GotoBookmark(BookMark);
  finally
    DataSet.FreeBookmark(Bookmark);
    DataSet.EnableControls;
  end;
end;

function Eng_Formula_Verify(AdoConn: TAdoConnection; Input_value: string): boolean; //工程参数公式验证
begin
  result := true;
  try
    Formula_Verify := TFormula_Verify.Create(Adoconn);
    if not Formula_Verify.Verify(trim(Input_value)) then
      result := false
    else
      result := true;
  finally
    Formula_Verify.free;
  end;
end;

procedure Export_Grid_to_Excel(Grid: TStringgrid; title_caption: string;isStr:boolean=false); overload; //导出grid中的数据到excel
var
  iCount, jCount,v_cloumn: Integer;
  XLApp: Variant;
  Sheet: Variant;
begin
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;

  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := title_caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[title_caption];
  v_cloumn := 0;
  for iCount := 0 to Grid.ColCount - 1 do
   if Grid.ColWidths[iCount]>0 then
    Sheet.Cells[1, iCount + 1-v_cloumn] := Grid.Cells[icount, 0]
   else
    inc(v_cloumn);
    
  for jcount := 1 to Grid.RowCount - 1 do
   begin
    v_cloumn := 0;
    for iCount := 0 to Grid.ColCount - 1 do
     if Grid.ColWidths[iCount]>0 then
     begin
       if isStr then  Sheet.Cells[jCount + 1, iCount + 1-v_cloumn].NumberFormatLocal:='@';
       Sheet.Cells[jCount + 1, iCount + 1-v_cloumn] := Grid.Cells[iCount, jcount]
     end else
      inc(v_cloumn);
   end;
  XlApp.Visible := True;
  Screen.Cursor := crDefault;
end;

procedure Export_Grid_to_Excel(Grid: TStringgrid; title_caption: string;isStr:TMyIntSet); overload; //导出grid中的数据到excel
var
  iCount, jCount,v_cloumn: Integer;
  XLApp: Variant;
  Sheet: Variant;
begin
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;

  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := title_caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[title_caption];
  v_cloumn := 0;
  for iCount := 0 to Grid.ColCount - 1 do
   if Grid.ColWidths[iCount]>0 then
    Sheet.Cells[1, iCount + 1-v_cloumn] := Grid.Cells[icount, 0]
   else
    inc(v_cloumn);

  for jcount := 1 to Grid.RowCount - 1 do
   begin
    v_cloumn := 0;
    for iCount := 0 to Grid.ColCount - 1 do
     if Grid.ColWidths[iCount]>0 then
     begin
       if iCount in isStr then  Sheet.Cells[jCount + 1, iCount + 1-v_cloumn].NumberFormatLocal:='@';
       Sheet.Cells[jCount + 1, iCount + 1-v_cloumn] := Grid.Cells[iCount, jcount]
     end else
      inc(v_cloumn);
   end;
  XlApp.Visible := True;
  Screen.Cursor := crDefault;
end;


procedure SetOptimalGridCellWidth(sg: TStringGrid;
  ExcludeColumns: TExcludeColumns);
 var
  i : Integer;
  j : Integer;
  max_width : Integer;
begin
with sg do
 begin
  Canvas.Font.Assign(Font);
  for i := 0 to (ColCount - 1) do
  begin
   if i in ExcludeColumns then Continue;
   max_width := 0;
   for j := 0 to (RowCount - 1) do
    max_width := Math.Max(max_width,Canvas.TextWidth(Cells[i,j]));
   if max_width > 0 then
    ColWidths[i] := max_width + 4
   else
    ColWidths[i] := DefaultColWidth;
  end; { for }
 end;
end;

procedure load_xls_to_sgrid(fileName:String; grid:TStringGrid);
var //从Excel中读取数据到 Grid
  iCount, jCount: Integer;
  XLApp: variant;
  Sheet: Variant;
begin
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
   begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
   end;
  try
   XLApp := CreateOleObject('Excel.Application'); //创建OLE对象
  except
   Screen.Cursor := crDefault;
   Exit;
  end;
   try
     XLApp.workBooks.Open(fileName);
     Sheet := XLApp.Workbooks[1].WorkSheets[1];
     for iCount:=2 to 65535 do
      begin
       if trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]) = '' then
         break
       else
        begin
         grid.RowCount:=grid.RowCount+1;
        for jCount:=1 to 12 do
   //    grid.Cells[jCount-1,iCount-1]:=XLApp.workbooks[1].sheets[1].cells[iCount,jCount];
         grid.Cells[jCount-1,iCount-1]:=sheet.cells[iCount,jCount];
        end;
      end;
     XLApp.workbooks[1].close;
   finally
     XLApp.quit;
     Screen.Cursor := crDefault;
   end
end;

procedure Export_dbGrid_to_Excel(dbGrid: TDBGrid; title_caption: string);
var
  iCount, jCount, v_cloumn: Integer;
  XLApp: Variant;
  Sheet: Variant;
begin
  //if not dbgrid.DataSource.DataSet.Active then exit;
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;
  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := title_caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[title_caption];
  dbgrid.DataSource.DataSet.DisableControls;
  dbgrid.DataSource.DataSet.first;

  v_cloumn := 0;
  for iCount := 0 to dbgrid.Columns.Count - 1 do
    if dbgrid.Columns.Items[iCount].Visible = true then
      Sheet.Cells[1, iCount + 1 - v_cloumn] :=
        dbgrid.Columns[iCount].Title.Caption
    else
      inc(v_cloumn);

  jCount := 1;
  while not dbgrid.DataSource.DataSet.Eof do
  begin
    v_cloumn := 0;
    for iCount := 0 to dbgrid.Columns.Count - 1 do
      if dbgrid.Columns[iCount].Visible = true then
      begin
        if dbgrid.Columns[iCount].Field.DataType=ftString then
          Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn].NumberFormatLocal:='@';
        Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
          dbgrid.Columns[iCount].Field.AsString;
      end
      else
        inc(v_cloumn);
    Inc(jCount);
    dbgrid.DataSource.DataSet.Next;
  end;

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  dbgrid.DataSource.DataSet.First;
  dbgrid.DataSource.DataSet.EnableControls;
end;

function App_Init(AdoConn: TADoConnection): boolean; //为程序启动设置各种参数
var
  ZAppName: array[0..127] of char;
  s,title_name,data_name: string;
  Found: HWND;
  vprog: pchar;
begin
  try
    result := false;

    hMapFile := CreateFileMapping($FFFFFFFF, nil, page_ReadWrite, 0, 100, 'xyz2055coimasp20');
    MapFilePointer := MapViewOfFile(hMapFile, File_Map_All_Access, 0, 0, 0);
    S := PChar(MapFilePointer);
    user_ptr := trim(copy(S, 3, pos(' ', s) - 3));
    vprev := trim(copy(S, pos(' ', s) + 1, 1));
    data_name:=copy(S, pos('/', s) + 1, pos(',', s)-pos('/', s)-1);
    db_ptr := trim(copy(S, pos(',', s) + 1, length(s) - pos(',', s)));

    if trim(db_ptr) = '' then exit;
    
    title_name := application.Title+' '+data_name;
    application.Title := 'OnlyOne' + IntToStr(HInstance);
    vprog := pchar(title_name);

    strpcopy(ZAppName, vprog);
    Found := FindWindow(nil, ZAppName);
    if Found <> 0 then
    begin
      ShowWindow(Found, SW_SHOWMINIMIZED);
      ShowWindow(Found, SW_SHOWNORMAL);
      application.Terminate;
    end;
    application.Title := title_name;

    AdoConn.Connected := false;
    AdoConn.ConnectionString := db_ptr;
    AdoConn.Connected := true;
    result := true;
  except
    result := false;
  end;
end;

function Pick_Eng_Param(value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择工程参数
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields := 'Parameter_Name/参数名称,Parameter_desc/描述,category_name/参数类别';
  FDlgInput.Sqlstr := ' select M.rkey,M.PARAMETER_NAME,M.parameter_desc,D.category_name ' +
    ' from Data0278 M,Data0277 D ' +
    ' where M.category_ptr=D.rkey and D.Category_type<>1' +
    ' order by D.category_type,D.category_name,M.parameter_name';
  FDlgInput.AdoConn := AdoConn;
  FDlgInput.InPut_value := value;
  if PickType = 2 then
    FDlgInput.KeyField := 'Parameter_Name';
  Tmp_rslt := Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result := Tmp_rslt
  else
    result := ''; //没有取道记录
end;

function Param_Name_To_rKey(value: string): integer; //根据工程参数名称返回rkey
var
  sqlstr: string;
begin
  sqlstr := 'select rkey from Data0278 where Parameter_name=' + QuotedStr(trim(value));
  result := Is_Null(MyDataClass.Get_Sql_Value(sqlstr), 0);
end;

function Param_rKey_To_Name(value: integer): string; //根据工程参数rkey返回名称
var
  sqlstr: string;
begin
  sqlstr := 'select Parameter_name from Data0278 where rkey=' + IntToStr(value);
  result := Is_NUll(MyDataClass.Get_Sql_Value(sqlstr), '');
end;

function Get_Eng_Formula_Expr(EngTable: integer): string; //根据工程表单ID，返回表达式
var
  Sqlstr: string;
//表单名称(X,Y)
begin
  Sqlstr := ' select FXY=IsNull(Eng_table_name,'''')+' + QuotedStr('(') + '+ IsNull((select Parameter_name from data0278 where rkey=M.FX),'''')+' + QuotedStr(',') + '+' +
    ' IsNull((select Parameter_name from data0278 where rkey=M.FY),'''')+' + QuotedStr(')') +
    ' from data0280 M where rkey=' + IntTostr(Engtable);
  result := MyDataClass.Get_Sql_Value(sqlstr);
end;

function Get_Eng_Table_Name(rKey: integer): string; //根据工程表单编号，返回名称
var
  sqlstr: string;
begin
  sqlstr := 'select Eng_table_name from data0280 where rkey=' + IntTostr(rKey);
  result := Is_NUll(MyDataClass.Get_Sql_Value(sqlstr), '');
end;

function Get_Eng_Table_Formula_List(DataSet: TAdoQuery): boolean; //获得工程表单公式列表
var Sqlstr: string;
begin
 Sqlstr := 'SELECT Data0280.ENG_TABLE_NAME+''( ''+rtrim(Data0278.PARAMETER_NAME)'+#13+
 '+'' , ''+isnull(rtrim(Data0278_1.PARAMETER_NAME),''1'')+'' )'' as FXY,Data0280.data_type'+#13+
 'FROM   dbo.Data0280 LEFT OUTER JOIN'+#13+
 ' Data0278 AS Data0278_1 ON dbo.Data0280.FY = Data0278_1.RKEY'+#13+
 ' LEFT OUTER JOIN dbo.Data0278 ON dbo.Data0280.FX = dbo.Data0278.RKEY'+#13+
 'order by Data0280.ENG_TABLE_NAME';
  OpenQuery(DataSet, sqlstr);
end;

function Formula_Check(strExpr: string; AdoConn: TAdoConnection; var str: string): boolean; //公式验证
begin
  try
    Formula_Verify := TFormula_Verify.Create(AdoConn);
    result := Formula_Verify.Verify_Formula(strExpr, str);
  finally
    Formula_Verify.free;
  end;
end;

function Pick_Cust_ID(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择客户
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields := 'Cust_Code/客户编号,Customer_name/客户名称';
  FDlgInput.Sqlstr := 'select rKey,Cust_Code,Customer_name from data0010 order by Cust_Code';
  FDlgInput.AdoConn := AdoConn;
  FDlgInput.InPut_value := value;
  if PickType = 2 then
    FDlgInput.KeyField := 'Cust_Code';
  Tmp_rslt := Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result := Tmp_rslt
  else
    result := ''; //没有取道记录
end;

function Pick_Prod_Type(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择产品类型
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields := 'PROD_code/产品编号,Product_name/产品名称';
  FDlgInput.Sqlstr := 'select rKey,PROD_code,Product_name from data0008 order by PROD_code';
  FDlgInput.AdoConn := AdoConn;
  FDlgInput.InPut_value := value;
  if PickType = 2 then
    FDlgInput.KeyField := 'PROD_code';
  Tmp_rslt := Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result := Tmp_rslt
  else
    result := ''; //没有取道记录
end;

function Pick_Sales_Man(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择业务员
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields := 'Rep_code/销售代表编号,Sales_rep_name/销售代表名称';
  FDlgInput.Sqlstr := 'select rKey,Rep_code,Sales_rep_name  from data0009 order by Rep_code';
  FDlgInput.AdoConn := AdoConn;
  FDlgInput.InPut_value := value;
  if PickType = 2 then
    FDlgInput.KeyField := 'Rep_code';
  Tmp_rslt := Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result := Tmp_rslt
  else
    result := ''; //没有取道记录
end;

function Pick_Sales_Director(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择业务主管
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields := 'Rep_code/销售主管编号,Sales_rep_name/销售主管名称';
  FDlgInput.Sqlstr := 'select rKey,Rep_code,Sales_rep_name from data0009 where class=1 order by Rep_code';
  FDlgInput.AdoConn := AdoConn;
  FDlgInput.InPut_value := value;
  if PickType = 2 then
    FDlgInput.KeyField := 'Rep_code';
  Tmp_rslt := Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result := Tmp_rslt
  else
    result := ''; //没有取道记录
end;

procedure Export_dbGridEH_to_Excel(dbGrid: TDBGridEh; title_caption: string); overload;
var
  iCount, jCount, v_cloumn: Integer;
  XLApp: Variant;
  Sheet: Variant;
begin
  if not dbgrid.DataSource.DataSet.Active then exit;
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;
  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := title_caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[title_caption];
  dbgrid.DataSource.DataSet.DisableControls;
  dbgrid.DataSource.DataSet.first;

  v_cloumn := 0;
  for iCount := 0 to dbgrid.Columns.Count - 1 do
    if dbgrid.Columns.Items[iCount].Visible = true then
      Sheet.Cells[1, iCount + 1 - v_cloumn] :=
        dbgrid.Columns[iCount].Title.Caption
    else
      inc(v_cloumn);

  jCount := 1;
  while not dbgrid.DataSource.DataSet.Eof do
  begin
    v_cloumn := 0;
    for iCount := 0 to dbgrid.Columns.Count - 1 do
      if dbgrid.Columns[iCount].Visible = true then
       begin
        if dbgrid.Columns[iCount].Field.DataType=ftString then
          Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn].NumberFormatLocal:='@';
        Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
          dbgrid.Columns[iCount].Field.AsString;
       end
      else
        inc(v_cloumn);
    Inc(jCount);
    dbgrid.DataSource.DataSet.Next;
  end;

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  dbgrid.DataSource.DataSet.First;
  dbgrid.DataSource.DataSet.EnableControls;
end;

 //模仿/
 procedure Export_Tlistview_to_Excel(listview: TListView; title_caption: string); overload;
var
  iCount, jCount, v_cloumn: Integer;
  XLApp: Variant;
  Sheet: Variant;
begin
  if listview.Items.Count <= 0 then Exit;
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;
  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := title_caption;
  Sheet := XLApp.Workbooks[1].WorkSheets[title_caption];

  v_cloumn := 0;

  for iCount := 0 to listview.Columns.Count-1 do
  begin
    if  listview.Columns[iCount].Caption <>'' then
      Sheet.Cells[1,iCount + 1 ] :=
       listview.Columns[iCount].Caption;
  end;
       //第一行，第1.2.3.4 列
   for iCount := 0 to listview.Items.Count-1 do
  begin
     //----------行--------列
     Sheet.Cells[iCount+2,1] :=
        listview.items[iCount].Caption;

    for jCount := 1 to listview.Columns.Count -1 do
      if listview.items[jCount].Caption<>'' then
       begin
        Sheet.Cells[iCount + 2, jCount +1] :=
          listview.items[iCount].SubItems[jCount-1];
       end
  end;  
  XlApp.Visible := True;
  Screen.Cursor := crDefault;

end;


function Load_JPG_Pic_From_DB(pField: TField): TjpegImage; //从数据库读取图片，转换为JPG格式
var
//  Stream:TMemoryStream;
  Jpg: TjpegImage;
begin
  if not pField.IsNull then
  begin
    try
//      Stream:=TMemoryStream.Create ;
      Jpg := TjpegImage.Create;
  //    TBlobField(pField).SaveToStream(Stream);    // 显示的转换为BlobField并保存到内存流
      jpg.Assign(TBlobField(pField));
  //    Stream.Position :=0;
   //   jpg.LoadFromStream(Stream);    // 加载图片
      result := jpg;
    finally
     // Stream.Free;
    end;
  end
  else
  begin
    result := nil;
  end;
end;

procedure Save_JPG_Pic_To_DB(pImage: TImage; pDataSet: TCustomADODataSet; FieldName: string); //把image的图片转化为Jpg格式，赋值给相应的字段
var
  Stream: TMemoryStream;
begin
  try
    Stream := TMemoryStream.Create; //  创建内存流
    pImage.Picture.Graphic.SaveToStream(Stream); // 将图片保存到内存流中
    if not pDataSet.Active then
    begin
      ShowMsg('请打开数据表', '提示', 1);
      abort;
    end
    else
    begin
      pDataSet.edit;
      Stream.Position := 0;
      TBlobField(pDataSet.FieldByName(FieldName) as TBlobField).LoadFromStream(Stream); // 读取保存的内存图
      pDataSet.Post;
    end;
  finally
    Stream.Free; // 释放内存流
  end;
end;

function Get_Pick_Value(PickItemId: integer; Value: variant; AdoConn: TAdoconnection; PickType: byte): string; //根据挑选项目ID，进行对话框挑选
var
  vTmp: variant;
begin
  case PickItemId of
    v_PICK_CUST_ID: vTmp := Pick_Cust_ID(value, AdoConn, PickType);
    v_Pick_SALES_MAN: vTmp := Pick_Sales_Man(value, AdoConn, PickType);
    v_Pick_Sales_Director: vTmp := Pick_Sales_Director(value, AdoConn, PickType);
    v_Pick_Prod_Type: vTmp := Pick_Prod_Type(value, AdoConn, PickType);
    v_Pick_Eng_Param: vTmp := Pick_Eng_Param(value, AdoConn, PickType);
  else
    vTmp := '';
  end;
  result := VarAsType(vTmp, varString);
end;

procedure DataToTreeView(DataSet: TAdoDataSet; Treeview: TTreeview; RootText: string; DisplayFieldName: string);
var
  nodeTxt: string;
  level: integer;
  mynode: array[0..9] of TTreenode;
begin
  //Screen.Cursor:=crHourGlass;
  Treeview.Enabled := True;
  Treeview.Items.Clear;
//设置根节点
//  mynode[level]:=Treeview.items.add(nil,RootText);
//  mynode[level].ImageIndex:=0;
  with DATASET do
  begin
    try
      if not Active then open;
      first;
      while not Eof do
      begin
//        curID:=trim(FieldByName(rKey).AsString);
        nodeTxt := trim(FieldByName(DisplayFieldName).AsString);
        level := FieldByName('LevelId').asinteger;
        if level > 0 then
        begin
          mynode[level] := Treeview.items.AddChild(mynode[level - 1], nodeTxt);
          if FieldByName('ttype').asinteger = 0 then
            mynode[level].ImageIndex := 0
          else
            mynode[level].ImageIndex := 2;
        end;
        next; //下一条记录
      end;
    finally;
      close;
    end;
//    mynode[0].expand(False);
//    Screen.Cursor:=crDefault;
  end;
end;

function Pick_Eng_Flow(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择工序
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields := 'Dept_Code/资源代号,Dept_Name/资源名称';
  FDlgInput.Sqlstr := 'select rKey,Dept_Code,Dept_Name from data0034 where ttype=''1'' ORDER by dept_code';
  FDlgInput.AdoConn := AdoConn;
  FDlgInput.InPut_value := value;
  if PickType = 2 then
    FDlgInput.KeyField := 'Dept_code';
  Tmp_rslt := Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result := Tmp_rslt
  else
    result := ''; //没有取道记录
end;

function Logic_Formula_Check(strExpr: string; AdoConn: TAdoConnection; var str: string): boolean; //逻辑公式验证
begin
  try
    Formula_Verify := TFormula_Verify.Create(AdoConn);
    result := Formula_Verify.Verify_Logic_Formula(strExpr, str);
  finally
    Formula_Verify.free;
  end;
end;

function Pick_Department(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择部门
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields := 'Dept_Code/部门代号,Dept_Name/部门名称';
  FDlgInput.Sqlstr := 'select rKey,Dept_Code,Dept_Name from data0034 where ttype=5 ORDER by dept_code';
  FDlgInput.AdoConn := AdoConn;
  FDlgInput.InPut_value := value;
  if PickType = 2 then
    FDlgInput.KeyField := 'Dept_code';
  Tmp_rslt := Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result := Tmp_rslt
  else
    result := ''; //没有取道记录
end;

function Pick_Eng_Param_New(value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择工程参数，picktype:1。返回参数rkey，2。返回参数名称
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields := 'Parameter_Name/参数名称/180,Parameter_desc/描述/180,category_name/参数类别/100';
  FDlgInput.Sqlstr := ' select M.rkey,M.PARAMETER_NAME,M.parameter_desc,D.category_name ' +
    ' from Data0278 M,Data0277 D ' +
    ' where M.category_ptr=D.rkey and D.Category_type<>1' +
    ' order by D.category_type,D.category_name,M.parameter_name';
  FDlgInput.AdoConn := AdoConn;
  FDlgInput.InPut_value := value;
  if PickType = 2 then
    FDlgInput.KeyField := 'Parameter_Name';
  Tmp_rslt := Pick_Single_Item_New(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result := Tmp_rslt
  else
    result := ''; //没有取道记录
end;

function Pick_Single_Item_New(InputVar: PDlgInput): variant; //增加字段宽度定义
begin
  with TfrmPick_Item_Single.Create(Application) do
  try
    InitForm_New(InputVar);
    if Showmodal = mrok then
      result := Get_Rslt
    else
      result := NULL;
  finally
    free;
  end;
end;

function Pick_Cost_Dept(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择成本中心
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields := 'Dept_Code/成本中心编号,Dept_Name/成本中心名称';
  FDlgInput.Sqlstr := 'select rKey,Dept_Code,Dept_Name from data0034 where Is_Cost_Dept=1 order by dept_code ';
  FDlgInput.AdoConn := AdoConn;
  FDlgInput.InPut_value := value;
  if PickType = 2 then
    FDlgInput.KeyField := 'Dept_code';
  Tmp_rslt := Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result := Tmp_rslt
  else
    result := ''; //没有取道记录
end;

function Pick_Acct_Title(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择会计科目
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields := 'GL_Acc_Number/科目编号,GL_Description/科目名称';
  FDlgInput.Sqlstr := 'select rkey,GL_Acc_Number,GL_Description from Data0103 order by GL_Acc_Number ';
  FDlgInput.AdoConn := AdoConn;
  FDlgInput.InPut_value := value;
  if PickType = 2 then
    FDlgInput.KeyField := 'GL_Acc_Number';
  Tmp_rslt := Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result := Tmp_rslt
  else
    result := ''; //没有取道记录
end;

function Pick_Part_Group(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择物料类型
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields := 'Group_Name/材料类别,Group_Desc/类别描述';
  FDlgInput.Sqlstr := 'select rKey,Group_Name,Group_Desc from data0496 ';
  FDlgInput.AdoConn := AdoConn;
  FDlgInput.InPut_value := value;
  if PickType = 2 then
    FDlgInput.KeyField := 'Group_Name';
  Tmp_rslt := Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result := Tmp_rslt
  else
    result := ''; //没有取道记录
end;

function Pick_Pub_Eng_Param(value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择全局工程参数，picktype:1。返回参数rkey，2。返回参数名称
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields := 'Parameter_Name/参数名称,Parameter_desc/描述,category_name/参数类别';
  FDlgInput.Sqlstr := ' select M.rkey,M.PARAMETER_NAME,M.parameter_desc,D.category_name ' +
    ' from Data0278 M,Data0277 D ' +
    ' where M.category_ptr=D.rkey and D.Category_type<=2' +
    ' order by D.category_type,D.category_name,M.parameter_name';
  FDlgInput.AdoConn := AdoConn;
  FDlgInput.InPut_value := value;
  if PickType = 2 then
    FDlgInput.KeyField := 'Parameter_Name';
  Tmp_rslt := Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result := Tmp_rslt
  else
    result := ''; //没有取道记录
end;

function Pick_Part(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择物料
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields := 'group_name/类别名称,inv_part_number/材料代号,inv_part_description/材料描述,unit_code/单位';
  FDlgInput.Sqlstr := ' select data0496.group_name,data0017.rkey,data0017.inv_part_number,data0017.inv_part_description, ' +
    ' data0002.unit_code from data0017,data0496,data0002 where data0017.stock_unit_ptr=data0002.rkey ' +
    ' and data0017.group_ptr=data0496.rkey order by data0017.inv_part_number';
  FDlgInput.AdoConn := AdoConn;
  FDlgInput.InPut_value := value;
  if PickType = 2 then
    FDlgInput.KeyField := 'inv_part_number';
  Tmp_rslt := Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result := Tmp_rslt
  else
    result := ''; //没有取道记录
end;

function Part_Cost_Formula_Verify(Cost_Dept, Part_Group: integer; strExpr: string; AdoConn: TAdoConnection; var str: string): boolean; //材料用量成本公式验证,输入：adoconn：ado的连接，input_value，验证的公式
begin
  try
    Formula_Verify := TFormula_Verify.Create(AdoConn);
    result := Formula_Verify.Verify_Part_Cost_Formula(Cost_Dept, Part_Group, strExpr, str);
  finally
    Formula_Verify.free;
  end;
end;

function Calc_Eng_Table(rkey, s_Y, s_X, d_Y, d_X: string): variant; //计算工程表单
var
  Sqlstr: string;
begin
  Sqlstr := 'Exec autocal85 ' + rKey + ',' + QuotedStr(s_x) + ',' + QuotedStr(s_y) + ',' + d_x + ',' + d_y;
  result := MyDataClass.Get_Sql_Value(sqlstr);
end;

function Calc_Expr_Parma(var str_Expr: string; AdoConn: TAdoConnection; out Out_Value: double): boolean; //计算表达式的值(参数已经赋值)
begin
  try
    Formula_Verify := TFormula_Verify.Create(AdoConn);
    result := Formula_Verify.Calc_Expr_Parma(str_expr, Out_Value);
  finally
    Formula_Verify.free;
  end;
end;

function Get_MI_CHN_Status(TValue: integer): string; //返回MI的状态
begin
  case TValue of
    0: result := '待制作';
    1: result := '已审核';
    2: result := '审退回';
    3: result := '待检查';
    4: result := '待审核';
    5: result := '检退回';
    6: result := '未提交';
  else
    result := '';
  end;
end;

function Get_BOM_CHN_Status(TValue: integer): string; //返回BOM的状态
begin
  case TValue of
    0: result := '未审核';
    1: result := '已审核';
  end;
end;

function IsDatetime(str: string): boolean;
begin
  result := true;
  try
    StrTodatetime(str);
  except
    result := false;
  end;
end;

function Pick_IES_Eng_Param(value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择制程参数，picktype:1。返回参数rkey，2。返回参数名称
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields := 'Parameter_Name/参数名称,Parameter_desc/描述,category_name/参数类别';
  FDlgInput.Sqlstr := ' select M.rkey,M.PARAMETER_NAME,M.parameter_desc,D.category_name ' +
    ' from Data0278 M,Data0277 D ' +
    ' where M.category_ptr=D.rkey and D.Category_type>2' +
    ' order by D.category_type,D.category_name,M.parameter_name';
  FDlgInput.AdoConn := AdoConn;
  FDlgInput.InPut_value := value;
  if PickType = 2 then
    FDlgInput.KeyField := 'Parameter_Name';
  Tmp_rslt := Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result := Tmp_rslt
  else
    result := ''; //没有取道记录
end;

function IS_Float(InValue: string): boolean;
var i:integer;
begin
  result := true ;   //空值通过
  for i:=1 to length(InValue) do
    if not (InValue[i] in ['0'..'9','.']) then
    begin
      result :=false;
      exit;
    end;
end;

procedure Add_ComBox_List(DataSET: TCustomAdoDataSet; FieldName: string; Combox: TComboBox);
var BookMark: Tbookmark;
begin
  try
    BookMark := DataSet.GetBookmark;
    DataSet.EnableControls;
    Combox.Items.Clear;
    DataSet.First;
    while not DataSet.Eof do begin
      combox.Items.Add(trim(DataSet.FieldbyName(FieldName).AsString));
      DataSet.next;
    end;
    if BookMark <> nil then
      DataSet.GotoBookmark(BookMark);
  finally
    if combox.Items.Count > 0 then
      combox.ItemIndex := 0;
    DataSet.FreeBookmark(Bookmark);
    DataSet.EnableControls;
  end;
end;

procedure Expand_Prod(AdoConnection: TAdoConnection; TreeView: TTReeView; TopNo: integer; TopName: string); //产品展开
var
  SqlStr: string;
begin
  SqlStr := 'select P.rkey as ItemNo,Manu_Part_Number as  ItemName from data0025 P where parent_ptr=';
  try
    MyTreeClass := TMyTreeClass.Create(AdoConnection);
    MyTreeClass.Expand_My_Tree_Down(TreeView, topNo, Sqlstr, TopName);
  finally
    MyTreeClass.free;
  end;
end;

function Get_Month_First_Day(indate: TDate): TDate;
var
  y, m, d: Word;
begin
  decodeDate(indate, y, m, d);
  result := Encodedate(y, m, 1);
end;

function Get_Month_Last_Day(indate: TDate): TDate;
var
  y, m, d: Word;
begin
  decodeDate(indate, y, m, d);
  if m = 12 then
  begin
    y := y + 1;
    m := 1;
  end
  else
    m := m + 1;
  result := EncodeDate(y, m, 1) - 1;
end;

function Check_Db_Connected(Connection: TAdoConnection; connStr: string): boolean; //根据输入的Ado主连接字符串,判断当前连接的数据库是否一致
const
  DB_ID = 'INITIAL CATALOG=';
  IP_ID = 'DATA SOURCE=';
var
  Old_DBName, New_DBName, Old_IP, New_IP, New_Host_Name, Sqlstr: string;
  Ado_tmp: TAdoQuery;
begin
  ShowMsg('连接：' + Connstr, 1);
  Old_DBName := ExtractSpecValue(connstr, DB_ID);

  Old_IP := ExtractSpecValue(connstr, IP_ID);

  Sqlstr := ' create   table   #ip(id   int   identity(1,1),re   varchar(200)) ' +
    '  declare   @s   varchar(1000) ,@host_str varchar(100) ' +
    ' set @host_str=convert(char(100),SERVERPROPERTY(' + QuotedStr('ServerName') + ')) ' + #13 + #10 +
    ' set   @s=' + QuotedStr(' ping ') + '+@host_str+' + QuotedStr('   -a   -n   1   -l   1') + #13 + #10 +
    ' insert   #ip(re)   exec   master..xp_cmdshell   @s ' + #13 + #10 +
    ' select   Host_str=@host_str,Host_IP=stuff(left(re,charindex(' + QuotedStr(']') + ',re)-1),1,charindex(' + QuotedStr('[') + ',re),' + QuotedStr('') + ')' +
    ' ,db_name() as dbname from   #ip  where   id=2 ' + #13 + #10 + ' drop   table   #ip ';
//  ShowMsg(sqlstr,1);
  try
    Ado_tmp := TAdoQuery.Create(nil);
    Ado_Tmp.Connection := Connection;
    Ado_Tmp.sql.Clear;
    Ado_Tmp.sql.Add(sqlstr);
    Ado_Tmp.open;
    New_IP := trim(Ado_Tmp.fieldbyName('Host_IP').AsString);
    New_Host_Name := trim(Ado_Tmp.fieldbyName('Host_str').AsString);
    New_DBName := trim(Ado_Tmp.fieldbyName('dbname').AsString);
    ShowMsg('Old_str:' + connstr + #13 + #10 + 'Old_DBName=' + Old_DBName + ',Old_IP=' + Old_IP + ',New_DBName=' + New_DBName + ',New_IP=' + New_IP, 1);
    if (Old_DBName = New_DBName) and (Old_IP = New_IP) then
      result := true
    else
    begin
      if (Old_DBName = New_DBName) and (Old_IP = New_Host_Name) then
        result := true
      else
        result := false;
    end;
  finally
    Ado_Tmp.close;
    Ado_Tmp.free;
  end;
end;

function ExtractSpecValue(ConnStr: string; SpecName: string): string;
var
  UIDPos, UIDLen: Integer;
  TmpConnStr: string;
begin
  TmpConnStr := AnsiUpperCase(ConnStr);
  UIDPos := Pos(SpecName, TmpConnStr) + Length(SpecName);
  if UIDPos > Length(SpecName) then
  begin
    UIDLen := Pos(';', Copy(TmpConnStr, UIDPos, 255)) - 1;
    if UIDLen > 0 then
      Result := Copy(TmpConnStr, UIDPos, UIDLen)
    else
      Result := Copy(TmpConnStr, UIDPos, 255);
  end else
    Result := '';
end;

function Get_Field_Total_Value(DataSEt: TDATASET; FieldName: string): double; //获取某个字段的汇总值,必须为整型或浮点型
var
  i: double;
  BookMark: Tbookmark;
begin
  try
    i := 0;
    BookMark := DataSet.GetBookmark;
    DataSet.EnableControls;
    DataSet.First;
    while not DataSet.Eof do begin
      i := i + DataSet.FieldByName(FieldName).value;
      DataSet.Next;
    end;
    result := i;
    if BookMark <> nil then
      DataSet.GotoBookmark(BookMark);
  finally
    DataSet.FreeBookmark(Bookmark);
    DataSet.EnableControls;
  end;
end;

function ExRoundTo(const AValue: Double; const ADigit: TRoundToRange;IsTruncate:boolean=false): Double;
var
  OldRoundMode:TFPURoundingMode;
  LFactor,Tmp: Double;
begin
  OldRoundMode:=GetRoundMode();
  if IsTruncate then
    begin
      SetRoundMode(rmTruncate);
      Result:=RoundTo(AValue,-ADigit);
    end
  else
    begin
      SetRoundMode(rmNearest);
      LFactor := IntPower(10, ADigit);
      Tmp:=AValue*LFactor;
      if abs(frac(trunc(Tmp*10)/10))=0.5 then
        if AValue<0 then
          SetRoundMode(rmDown)
        else
          SetRoundMode(rmUp);
      Result := Round(Tmp) / LFactor;
    end;
  SetRoundMode(OldRoundMode);
end;

procedure ReSet_Sort(GRId: TDBGRidEH);
var
  i: integer;
  OldIndex: string;
begin
  if not GRId.DataSource.DataSet.Active then exit;
  for i := 0 to GRId.Columns.Count - 1 do
  begin
    GRId.Columns[i].Title.SortMarker := smNoneEh;
    OldIndex := TClientDataSet(GRId.Columns[i].Field.DataSet).IndexName;
    if OldIndex <> '' then
    begin
      TClientDataSet(GRId.Columns[i].Field.DataSet).IndexName := '';
      TClientDataSet(GRId.Columns[i].Field.DataSet).DeleteIndex(OldIndex);
    end;
  end;
end;

function App_init_2(AdoConn: TADoConnection): boolean; 
var
  ZAppName: array[0..127] of char;
  s,title_name,data_name: string;
  Found: HWND;
  vprog: pchar;
begin
   try
    result := true;
    hMapFile := CreateFileMapping($FFFFFFFF, nil, page_ReadWrite, 0, 100, 'coimasp20');
    MapFilePointer := MapViewOfFile(hMapFile, File_Map_All_Access, 0, 0, 0);
    S := PChar(MapFilePointer);
    rkey73 := copy(S,1,pos(' ',s)-1);
    vprev := copy(S, pos(' ', s) + 1, 1);
    data_name:=copy(S, pos('/', s) + 1, pos(',', s)-pos('/', s)-1);
    db_ptr := trim(copy(S, pos(',', s) + 1, length(s) - pos(',', s)));
    if trim(db_ptr) = '' then
     begin
      result := false;
      exit;
     end;

    title_name := application.Title+' '+data_name;
    application.Title := 'OnlyOne' + IntToStr(HInstance);
    vprog := pchar(title_name);

    strpcopy(ZAppName, vprog);
    Found := FindWindow(nil, ZAppName);
    if Found <> 0 then
     begin
      ShowWindow(Found, SW_SHOWMINIMIZED);
      ShowWindow(Found, SW_SHOWNORMAL);
      application.Terminate;
     end;
    application.Title := title_name;

    AdoConn.Connected := false;
    AdoConn.ConnectionString := db_ptr;
    AdoConn.Connected := true;

  except
    result := false;
  end;
end;

function Check_Acct_Depr_Date(vDate: TDatetime): boolean;
var
  sqlstr: string;
  vtmp: Variant;
begin
//  sqlstr:='select top 1 convert(datetime,convert(varchar,FYear)+'+QuotedStr('-')+'+convert(varchar,Period)+'+Quotedstr('-01')+') as MaxDate from data0528 order by FYEAR desc,Period Desc';
  sqlstr := 'select convert(datetime,convert(varchar,Curr_FYear)+' + QuotedStr('-') + '+convert(varchar,Curr_Period)+' + Quotedstr('-01') + ') as MaxDate from data0508';
  vTmp := MyDataClass.Get_Sql_Value(sqlstr);
  if vTmp = NULL then
    result := true
  else
    result := StartOfTheMonth(vdate) >= StartOfTheMonth(vTmp);
  if not result then
    ShowMsg('折旧日期必须大于或者等于最后的会计折旧期间: ' + IntToStr(YearOf(vTmp)) + '年' + IntToStr(MonthOf(vTmp)) + '月', 1);
end;

function Get_Acct_Depr_Date: TDATetime; //获取当前折旧月份
var
  sqlstr: string;
  vtmp: Variant;
begin
  sqlstr := 'select convert(datetime,convert(varchar,Curr_FYear)+' + QuotedStr('-') + '+convert(varchar,Curr_Period)+' + Quotedstr('-01') + ') as MaxDate from data0508';
//  sqlstr:='select top 1 convert(datetime,convert(varchar,FYear)+'+QuotedStr('-')+'+convert(varchar,Period)+'+Quotedstr('-01')+') as MaxDate from data0528 order by FYEAR desc,Period Desc';
  vTmp := MyDataClass.Get_Sql_Value(sqlstr);
  if vTmp = NULL then
    result := 0
  else
    result := vTmp;
end;

function Update_Seed(rKey: integer; v_Seed: string): boolean; //更新
var
  i, v_length: integer;
  v_last, new_seed, sqlstr: string;
begin
  v_length := length(v_seed);
  for i := v_length downto 1 do
    if not (v_seed[i] in ['0'..'9']) then //如果不是数字
    begin
      v_last := floattostr(power(10, v_length - 1) + strtofloat(copy(v_seed, i + 1, v_length - i)) + 1); //后缀加1
      new_seed := copy(v_seed, 1, i) + copy(v_last, i + 1, v_length - i);
      break;
    end
    else
      if i = 1 then //如果第一位仍然是数字
      begin
        v_last := floattostr(power(10, v_length) + strtofloat(v_seed) + 1);
        new_seed := copy(v_last, 2, v_length);
      end;
  sqlstr := ' update data0004 set Seed_Value= ' + QuotedStr(new_Seed) + ' where rkey= ' + IntToStr(rKey);
  result := MyDataClass.ExecSql(sqlstr);
end;

function Get_Seed(rKey: integer): string;
var
  sqlstr: string;
begin
  sqlstr := 'select Seed_Value from data0004 where Seed_Flag = 1 and rKey=' + IntToStr(rKey);
  result := MyDataClass.Get_Sql_Value(sqlstr);
end;

function Pick_Employee(Value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择员工
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields := 'empl_code/员工代码,employee_name/员工名称';
  FDlgInput.Sqlstr := 'select rkey,empl_code,employee_name from data0005'+#13+
                      'where  ACTIVE_FLAG=''Y'' '+#13+
                      ' order by empl_code ';
  FDlgInput.AdoConn := AdoConn;
  FDlgInput.InPut_value := value;
  if PickType = 2 then
    FDlgInput.KeyField := 'empl_code';
  Tmp_rslt := Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result := Tmp_rslt
  else
    result := ''; //没有取得记录
end;

function Base64_Encode(DecryptedText: string): string;
var
  c1, c2, c3: integer;
  w1, w2, w3, w4: Integer;
  n: Integer;
  retry: string;
begin
  n := 1;
  while n <= Length(DecryptedText) do
  begin
    c1 := ord(DecryptedText[n]);
    c2 := ord(DecryptedText[n + 1]);
    c3 := ord(DecryptedText[n + 2]);
    w1 := Trunc(c1 / 4);
    w2 := (c1 and 3) * 16 + Trunc(c2 / 16);
    if (Length(DecryptedText) >= n + 1) then
      w3 := (c2 and 15) * 4 + Trunc(c3 / 64)
    else w3 := -1;
    if (Length(DecryptedText) >= n + 2) then w4 := c3 and 63
    else w4 := -1;
    retry := retry + mimeencode(w1) + mimeencode(w2) + mimeencode(w3) + mimeencode(w4);
    n := n + 3;
  end;
  result := retry;
end;

function Base64_Decode(a: string): string;
var
  w1: Integer;
  w2: Integer;
  w3: Integer;
  w4: Integer;
  n: Integer;
  retry: string;
begin
  n := 1;
  while n <= Length(a) do begin
    w1 := mimedecode(a[n]);
    w2 := mimedecode(a[n + 1]);
    w3 := mimedecode(a[n + 2]);
    w4 := mimedecode(a[n + 3]);
    if w2 >= 0 then retry := retry + chr(((w1 * 4 + Trunc(w2 / 16)) and 255));
    if w3 >= 0 then retry := retry + chr(((w2 * 16 + Trunc(w3 / 4)) and 255));
    if w4 >= 0 then retry := retry + chr(((w3 * 64 + w4) and 255));
    n := n + 4;
  end;
  result := retry;
end;

function mimeencode(w: Integer): string;
begin
  if w >= 0 then
    result := copy(base64, w + 1, 1)
  else
    result := '';
end;

function mimedecode(a: string): Integer;
begin
  if Length(a) = 0 then
  begin
    result := -1;
    Exit;
  end;
  result := pos(a, base64) - 1;
end;

function Decode_Old_Pswd(pswd: string): string;
var
  i: integer;
  s, strtmp: string;
begin
  s := pswd;
  SetLength(strtmp, length(s));
  for i := 0 to Length(s) - 1 do
    strtmp[i] := Chr((word(s[i]) shr 1) - 3);
  result := strtmp;
end;

function Pick_Work_Order(value: variant; AdoConn: TAdoconnection; PickType: byte): variant; //选择作业单
var
  FDlgInput: PDlgInput;
  Tmp_rslt: variant;
begin
  FDlgInput.Fields := 'Work_Order_Number/作业单号/140,MANU_PART_NUMBER/本厂编号/100,DEPT_CODE/工序编号/80,CUT_NO/配料单号/100,Qty_BackLog/在线数量/80';
  FDlgInput.Sqlstr :=
    'SELECT D34.DEPT_CODE, D34.DEPT_NAME, D06.rKey,D06.WORK_ORDER_NUMBER, '+
    'D06.CUT_NO, D56.Qty_BackLog,D25.MANU_PART_NUMBER ' +
    'FROM dbo.Data0006 D06 INNER JOIN dbo.Data0056 D56 ON D06.RKEY = D56.WO_PTR '+
    'INNER JOIN dbo.Data0034 D34 ON D56.DEPT_PTR = D34.RKEY INNER JOIN ' +
    'dbo.Data0025 D25 ON D06.BOM_PTR = D25.RKEY INNER JOIN '+
    'dbo.data0492 d492 ON D06.CUT_NO = d492.CUT_NO '+
    'where D06.prod_status in (3,4) '+
    'and d492.tstatus<>1 and d492.tstatus<>3';
  FDlgInput.AdoConn := AdoConn;
  FDlgInput.InPut_value := value;
  if PickType = 2 then
    FDlgInput.KeyField := 'Work_Order_Number';
  Tmp_rslt := Pick_Single_Item_New(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result := Tmp_rslt
  else
    result := ''; //没有取道记录
end;


function Update_Asset_ID_Code(rKey: integer; v_Seed: string): boolean; //更新固定资产编号
var
  i, v_length: integer;
  v_last, new_seed, sqlstr: string;
begin
  v_length := length(v_seed);
  for i := v_length downto 1 do
    if not (v_seed[i] in ['0'..'9']) then //如果不是数字
    begin
      v_last := floattostr(power(10, v_length - 1) + strtofloat(copy(v_seed, i + 1, v_length - i)) + 1); //后缀加1
      new_seed := copy(v_seed, 1, i) + copy(v_last, i + 1, v_length - i);
      break;
    end
    else
      if i = 1 then //如果第一位仍然是数字
      begin
        v_last := floattostr(power(10, v_length) + strtofloat(v_seed) + 1);
        new_seed := copy(v_last, 2, v_length);
      end;
  sqlstr := ' update data0514 set preChar1= ' + QuotedStr(new_Seed) + ' where rkey= ' + IntToStr(rKey);
  result := MyDataClass.ExecSql(sqlstr);
end;

function GetFileVersion(fileName: string): PFile_Ver_INfo; //得到本程序的版本号
var
  S: string;
  BufSize, Len: DWORD;
  Buf: PChar;
  Value: PChar;
begin
  S := fileName;
  BufSize := GetFileVersionInfoSize(PChar(S), BufSize);
  if BufSize > 0 then
   begin
    Buf := AllocMem(BufSize);
    GetFileVersionInfo(PChar(S), 0, BufSize, Buf);
    if VerQueryValue(Buf, PChar('StringFileInfo\080403A8\' + InfoStr[1]), Pointer(Value), Len) then
      result.ProductName := Value;
    if VerQueryValue(Buf, PChar('StringFileInfo\080403A8\' + InfoStr[2]), Pointer(Value), Len) then
      result.ProductVersion := value;
    if VerQueryValue(Buf, PChar('StringFileInfo\080403A8\' + InfoStr[3]), Pointer(Value), Len) then
      result.FileDescription := Value;
    if VerQueryValue(Buf, PChar('StringFileInfo\080403A8\' + InfoStr[4]), Pointer(Value), Len) then
      result.LegalCopyright := Value;
    if VerQueryValue(Buf, PChar('StringFileInfo\080403A8\' + InfoStr[5]), Pointer(Value), Len) then
      result.FileVersion := Value;
    if VerQueryValue(Buf, PChar('StringFileInfo\080403A8\' + InfoStr[6]), Pointer(Value), Len) then
      result.CompanyName := Value;
    if VerQueryValue(Buf, PChar('StringFileInfo\080403A8\' + InfoStr[7]), Pointer(Value), Len) then
      result.LegalTradeMarks := value;
    if VerQueryValue(Buf, PChar('StringFileInfo\080403A8\' + InfoStr[8]), Pointer(Value), Len) then
      result.InternalName := value;
    if VerQueryValue(Buf, PChar('StringFileInfo\080403A8\' + InfoStr[9]), Pointer(Value), Len) then
      result.OriginalFileName := value;
    FreeMem(Buf, BufSize);
   end
  else 
  begin
   result.ProductName := '';
   result.ProductVersion := '';
   result.FileDescription := '';
   result.LegalCopyright := '';
   result.FileVersion := '';
   result.CompanyName := '';
   result.LegalTradeMarks := '';
   result.InternalName := '';
   result.OriginalFileName := '';
  end;
end;

function GetLocalName: string;
var
  CNameBuffer: PChar;
  fl_loaded: Boolean;
  CLen: ^DWord;
begin
  GetMem(CNameBuffer, 255);
  New(CLen);
  CLen^ := 255;
  fl_loaded := GetComputerName(CNameBuffer, CLen^);
  if fl_loaded then
    GetLocalName := StrPas(CNameBuffer)
  else
    GetLocalName := '未知';
  FreeMem(CNameBuffer, 255);
  Dispose(CLen);
end;


function Get_File_List(Dir: string; FileMask: string; var LS: TStringList): boolean; //获取目录下的文件
var
  fn, sp: string;
  fd: TSearchRec;
begin
  result := true;
  sp := dir;
  if not DirectoryExists(sp) then
  begin
    result := false;
    exit;
  end;
  if FindFirst(sp + '\' + FileMask, faAnyFile, fd) = 0 then
  begin
    fn := fd.Name;
    if fn <> '.' then
      LS.Add(fn);
    while FindNext(fd) = 0 do
    begin
      if fd.Attr = 32 then
      begin
        fn := fd.Name;
        if fn <> '..' then
          LS.Add(fn);
      end;
    end;
  end;
end;

procedure DownLoad_Files_From_FTP(FileType: byte; fileMask: string; Local_Dir, Srv_Dir: string); //从服务器下载某种类型文件
var
  IdFTP1: TIdFTP;
  i: integer;
  Tmp_LS: TSTringList;
begin
  Tmp_LS := TSTringList.Create;
  try
    IdFTP1 := TIdFTP.Create(nil);
    with IdFTP1 do try
      TransferType := ftBinary;
//      IdFTP1.RecvBufferSize:=
      Username := FTP_User;
      Password := FTP_Pswd;
      Host := FTP_SRV_IP;
      Connect;
      if Connected then
      begin
        IdFTP1.ChangeDir('/' + Srv_Dir);
        IdFTP1.List(Tmp_LS);
        for i := 0 to Tmp_LS.Count - 1 do
        begin
          if FileMask <> '.*' then
          begin
            if POS(FileMask, Tmp_LS.Strings[i]) > 0 then //找到
              IdFTP1.Get(Tmp_LS.Strings[i], Local_Dir + Tmp_LS.Strings[i], false, true);
          end
          else
            IdFTP1.Get(Tmp_LS.Strings[i], Local_Dir + Tmp_LS.Strings[i], false, true);
        end;
      end;
    finally
      IdFTP1.Disconnect;
    end;
  finally
    IdFTP1.Free;
    Tmp_LS.Free;
  end;
end;

procedure pAnds(tree: TTreeView; Dt: TDataset; node: TTreeNode;iRoot: integer);
var sp,sp1:integer;
    node1:TTreeNode;
    sv:variant;
    SavePlace: TBookmark;
    pI:^integer;
begin
  Dt.Filtered:=false;
  Dt.Filter:=Dt.Fields[1].FullName+'='+inttostr(iRoot);
  Dt.Filtered:=true;
  if  Dt.IsEmpty then  exit;
  while not Dt.Eof do
  begin
     sp:=Dt.Fields[0].AsInteger ;
     sp1:=Dt.Fields[1].AsInteger ;
     new(pI);
     pI^:=sp;
     node1:=Tree.Items.AddChild(node,Dt.Fields[2].asstring) ;
     node1.Data:=pI;
     SavePlace:=Dt.GetBookmark;
     pAnds(tree,Dt,node1,sp);

     Dt.Filtered:=false;
     Dt.Filter:=Dt.Fields[1].FullName+'='+inttostr(sp1);
     Dt.Filtered:=true;
     Dt.GotoBookmark(SavePlace);

     Dt.FreeBookmark(SavePlace);
     Dt.next;
  end;

  Dt.Filtered:=false;
end;

function IsFileInUse(FName: string): Boolean;
var
  HFileRes: HFILE;
begin
  Result := False;
  if not FileExists(FName) then Exit;
  HFileRes := CreateFile(PChar(FName), GENERIC_READ or GENERIC_WRITE, 0,
    nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  Result := (HFileRes = INVALID_HANDLE_VALUE);
  if not Result then
    CloseHandle(HFileRes);
end;

function Get_File_Modify_Time(FileName: string): TDatetime; //返回文件的修改时间
  function CovFileDate(Fd: _FileTime): TDateTime;
    { 转换文件的时间格式 }
  var
    Tct: _SystemTime;
    Temp: _FileTime;
  begin
    FileTimeToLocalFileTime(Fd, Temp);
    FileTimeToSystemTime(Temp, Tct);
    CovFileDate := SystemTimeToDateTime(Tct);
  end;
var
  Tp: TSearchRec; { 申明Tp为一个查找记录 }
begin
if FindFirst(filename, faAnyFile, Tp)=0 then
 begin
  result := CovFileDate(Tp.FindData.ftLastWriteTime);
  sysutils.FindClose(Tp);
 end
else
 result:=strtodate('1900-01-01');
end;

function Get_File_Handle(FName: string): HWND;
begin
  if not FileExists(FName) then
    result := 0
  else
//    Exit;
    result := CreateFile(PChar(FName), GENERIC_READ or GENERIC_WRITE, 0,
      nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
end;

function IS_INteger(InValue: string): boolean;
begin
  if InValue = '' then //空值通过
    result := true
  else
  begin
    result := true;
    try
      StrToInt(InValue);
    except
      result := false;
    end;
  end;
end;

function IS_Stock_Inventorying: boolean; //判断在制品是否在盘点
begin                                   //在盘点返回为TRUE,无盘点返回为FALSE

  result := MyDataClass.IsExists('select * from data0400 where status=0');
end;

function IS_FG_counting: boolean; //判断成品是否在盘点
begin                                   //在盘点返回为TRUE,无盘点返回为FALSE

  result := MyDataClass.IsExists('select rkey from data0214 where status=''0''');
end;


end.

