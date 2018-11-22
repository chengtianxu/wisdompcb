//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//Code Maker: zhq                                                              ^
//date : 2007-3-2                                                             ^
//Specification: 客户端公用函数模块                                            ^
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

unit Client_Func;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,comobj,activex, MConnect,Midas,ComConst,SrvQuery_TLB,ConstDeclare,DB,DBGrids,
  DBClient,DBGridEh,IniFiles;
//-------------end -------------------------------
type TCall_Report = procedure (rptName:string;RptTitle,UserId:string;vData:OLeVariant;PrintMode:byte);stdcall;

var
    coMyQuery: ICoQueryDisp;
    UserId:string;
    StationId:string;
    Local_IP : string;
    str_User_Info : string;//保留用户信息，包括，电脑IP，用户ID，

    hMapFile: THandle;
    MapFilePointer: Pointer;
    OldGridWnd : TWndMethod;

    user_ptr,
    vprev,
    db_ptr:string;
  //选择对话框
  function Pick_Single_Item(InputVar: DlgPickItem):variant; //单项选择

//  function Get_Query_Sql(qryNo:integer):wideString;
//-------------------------------------------------------------------
  procedure Update_Log(ModId,ActionId:integer;remark:string);   //更新日志
  function Get_Action_Name(ActId:integer):string; //返回操作名称
  function Get_Pick_Value(PickItemId:integer;Value:variant;PickType:byte):String;//根据挑选项目ID，进行对话框挑选
  function Get_Max_SeqNo(DataSet:TDataSet;FieldName:string):integer;//返回数据表的某个字段最大数值，必须为整形的
  function Update_Key_Value(DataSet:TDataSet;FieldName:string;KeyValue:Variant):boolean;//更新数据表某个字段的数值
  function App_Init:string;//为程序启动设置各种参数(注意：主窗体的caption不能和程序的title一样，否则会报错！！！)
  procedure Export_dbGrid_to_Excel(dbGrid:Tdbgrid;title_caption:string);overload;
  procedure Export_dbGridEH_to_Excel(dbGrid:TDBGridEh;title_caption:string);overload;
  procedure Add_Column_Pick_List(Column:TColumnEH;Field:TField);//根据传入的字段，为dbgrid添加PickList数值
  function Get_Pick_List_Inside_Value(sTitle,sExpr:string):string;//返回PickList中指定项目的数值
  function Find_FieldName_In_DBGRid(Grid:TDBGRid;Caption:string):string;overload;
  function Find_FieldName_In_DBGRid(Grid:TDBGRidEh;Caption:string):string;overload;
  procedure Add_Fields_To_List(Grid:TDBGRid;var FieldList:TStrings);overload;
  procedure Add_Fields_To_List(Grid:TDBGRidEH;var FieldList:TStrings);overload;
  procedure Sort_Data_ClientDataSet(SortColumn: TColumn;var ASC:Boolean);
  procedure Add_Columns_ToDBGrid(Grid:TDBGRidEh;DataSet:TDataSet);overload;
  procedure Reset_Grid_Columns(Grid:TDBGRidEh;DataSet:TDataSet);overload;
  function Save_Grid_Columns_Change(ModId:integer;Grid:TDBGRidEh;DataSet:TClientDataSet):boolean;overload;

  function Extract_Expr(prefix:string;var strExpr:string):string;
  function Div_Between_Phrase(S:string;DataType:string;var LeftPart,RightPart:variant):boolean;//分解Between A And B,返回A,和B数值

  procedure pCall_Report(rptName:string;RptTitle,UserId:string;vData:OLeVariant;PrintMode:byte);overload;
  function Get_FS_Rpt_Name(RptNo:integer;var RptTitle:string):string;//根据输入的Fast report报表编号，查找报表名称
  procedure ReSet_Sort(GRId:TDBGRidEH);
  procedure Export_Grid_Column_To_Text(QryNo,FileName:string;Grid:TDBGRid);overload;
  procedure Export_Grid_Column_To_Text(QryNo,FileName:string;Grid:TDBGRidEH);overload;

  function Get_Srv_IP(ConnStr:string):string;//通过Ado连接字符串,解析三层服务器IP
  function LogIn_Server:boolean;//登入服务器
  function Get_Server_List(ConnStr:string):Boolean;
  procedure TransferColumnsBetweenGrids(FromGrid:TDBGRid;ToGrid:TDBGRidEh);


implementation
uses PUBFunc,Pick_Item,Query_Param,DmConn;


function Pick_Single_Item(InputVar: DlgPickItem):variant; //单项选择
begin
  with TfrmPick_Item.Create(Application)do
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


procedure Update_Log(ModId,ActionId:integer;remark:string);   //更新日志
begin
//  if not dcom_con.SocketConnection1.AppServer.I_Update_Log(Local_IP,UserId,ModId,ActionId) then
{  if not coMyQuery.I_Update_Log(Local_IP,UserId,ModId,ActionId,remark) then
    ShowMsg('日志没有更新成功！','提示',1);}
end;

function Get_Action_Name(ActId:integer):string; //返回操作名称
begin
{  case actid of
    act_Enter : result := '进入';
    act_Edit : result := '编辑';
    act_Confirm : result := '审核';
    act_Delete : result := '删除';
    act_Print : result := '打印';
    act_DeConfirm : result := '反审核';
    act_Query : result := '查询';
    act_Add : result := '新增';
  end;
  }
end;

function Get_Pick_Value(PickItemId:integer;Value:variant;PickType:byte):String;//根据挑选项目ID，进行对话框挑选
var
  FDlgInput: DlgPickItem;
  Tmp_rslt: variant;
  ErrorMsg:WideString;
  vData: olevariant;
  sFields,sKeyFields:wideString;
begin
  if not coMyQuery.Get_Pick_Data(PickItemId,sFields,vData,sKeyFields,ErrorMsg) then
  begin
    ShowMsg('获取数据失败：'+ErrorMsg,'提示',1);
    abort;
  end
  else
  begin
    FDlgInput.vData := vData;
    FDlgInput.Fields:=sFields;
  end;
  FDlgInput.InPut_value := value;
  if PickType = 2 then
    FDlgInput.KeyField:=sKeyFields;
  Tmp_rslt:= Pick_Single_Item(FDlgInput);
  if not VarIsNull(Tmp_rslt) then
    result :=VarAsType(Tmp_rslt,varString)
  else
    result :='';//没有取道记录
end;

function Get_Query_Sql(qryNo:integer):wideString;
begin
{  with TfrmQuery_Param.Create(Application)do
  try
    InitForm(1);
    if showmodal = mrok then
      result := Get_Rslt
    else
      result := '';
  finally
    free;
  end;}
end;

function Get_Max_SeqNo(DataSet:TDataSet;FieldName:string):integer;//返回数据表的某个字段最大数值，必须为整形的
var
  i:integer;
  BookMark:Tbookmark;
begin
  try
    i:=0;
    BookMark:=DataSet.GetBookmark;
    DataSet.EnableControls;
    DataSet.First;
    while not DataSet.Eof do begin
      if i < DataSet.FieldByName(FieldName).AsInteger then
        i:= DataSet.FieldByName(FieldName).AsInteger;
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

function Update_Key_Value(DataSet:TDataSet;FieldName:string;KeyValue:Variant):boolean;//更新数据表某个字段的数值
var
  BK:TBookMark;
begin
  result := true;
  BK := DataSet.GetBookmark;
  try
    DataSet.EnableControls;
    try
      DataSet.first;
      while not DataSet.eof do begin
        DataSet.Edit;
        DataSet.FieldByName(FieldName).Value := KeyValue;
        DataSet.Post;
        DataSet.next;
      end;
    except
      result := false;
    end;
  finally
    DataSet.GotoBookmark(Bk);
    DataSet.FreeBookmark(bk);
    DataSet.EnableControls;
  end;
end;


function App_Init:string;//为程序启动设置各种参数
var
 ZAppName: array[0..127] of char;
 s,title_name,data_name:string;
 Found: HWND;
 vprog:pchar;
begin
//  if hMapFile= nil then
  hMapFile := CreateFileMapping ($FFFFFFFF,nil,page_ReadWrite,0,100,'xyz2055coimasp20');
  MapFilePointer := MapViewOfFile(hMapFile,File_Map_All_Access,0,0,0);
  S := PChar(MapFilePointer);

  user_ptr := trim(copy(S,3,pos(' ',s)-3));
  vprev := trim(copy(S,pos(' ',s)+1,1));
  data_name:=copy(S, pos('/', s) + 1, pos(',', s)-pos('/', s)-1);
  db_ptr := trim(copy(S,pos(',',s)+1,length(s)-pos(',',s)));

  title_name:=application.Title+data_name;
  Application.MainForm.Caption :='';
  application.Title:='OnlyOne'+IntToStr(HInstance);
  vprog:=pchar(title_name);
  strpcopy(ZAppName,vprog);
  Found := FindWindow(nil,ZAppName);
  if Found <> 0 then
  begin
    ShowWindow(Found, SW_SHOWMINIMIZED);
    ShowWindow(Found, SW_SHOWNORMAL);
    application.Terminate;
   end;
  application.Title := title_name;
  Application.MainForm.Caption :=title_name;
  result := db_ptr;
end;

procedure Export_dbGrid_to_Excel(dbGrid:TDBGrid;title_caption:string);
var
 iCount, jCount,v_cloumn: Integer;
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

 v_cloumn:=0;
 for iCount := 0 to dbgrid.Columns.Count - 1 do
  if dbgrid.Columns.Items[iCount].Visible=true then
   Sheet.Cells[1, iCount + 1 - v_cloumn] :=
   dbgrid.Columns[iCount].Title.Caption
  else
   inc(v_cloumn);

 jCount := 1;
 while not dbgrid.DataSource.DataSet.Eof do
  begin
   v_cloumn:=0;
   for iCount := 0 to dbgrid.Columns.Count - 1 do
    if dbgrid.Columns[iCount].Visible=true then
     Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
     dbgrid.Columns[iCount].Field.AsString
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

procedure Add_Column_Pick_List(Column:TColumnEH;Field:TField);//根据传入的字段，为dbgrid添加PickList数值
var
  iPos,iPos2:integer;
  tmpstr,sValue:string;
begin
  Column.PickList.clear;
  Column.KeyList.Clear;
  tmpStr:= trim(Field.AsString);
  if tmpStr = '' then exit;
  if (Pos('SELECT',uppercase(tmpstr))>0) and (Pos('FROM',uppercase(tmpstr))>0) then //从数据库中取数
  begin
       //如果从数据库中获取下拉的数据,会比较麻烦,数据流量比较大,可以考虑用弹出式的选择框替代.
  end
  else
  begin
    while Pos(';',tmpstr) >= 0 do begin
      iPos := Pos(',',tmpstr);
      if iPos > 0 then
      begin
        sValue:= copy(tmpstr,1,iPos-1);
        Column.PickList.Add(sValue);
        iPos2:= Pos(';',tmpstr);
        if iPos2 > 0 then  //
        begin
//          sValue:= copy(tmpstr,iPos+1,iPos2-iPos-1);
//          Column.KeyList.Add(sValue);
          tmpStr:= copy(tmpstr,iPos2+1,1000);
        end
        else
          break;
      end
      else
        break;
    end;
  end;
end;


function Extract_Expr(prefix:string;var strExpr:string):string;
var
  IPos, ILen: Integer;
begin
  IPos := Pos(prefix, StrExpr) + Length(prefix);
  if IPos > Length(prefix) then
  begin
    ILen := Pos(';', Copy(strExpr, IPos, 255)) - 1;
    Result := Copy(StrExpr, IPos, ILen);
    strExpr:=stringreplace(strExpr,prefix+result,'',[rfReplaceAll]);
  end else
    Result := '';
end;

procedure Export_dbGridEH_to_Excel(dbGrid:TDBGridEh;title_caption:string);overload;
var
 iCount, jCount,v_cloumn: Integer;
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

 v_cloumn:=0;
 for iCount := 0 to dbgrid.Columns.Count - 1 do
  if dbgrid.Columns.Items[iCount].Visible=true then
   Sheet.Cells[1, iCount + 1 - v_cloumn] :=
   dbgrid.Columns[iCount].Title.Caption
  else
   inc(v_cloumn);

 jCount := 1;
 while not dbgrid.DataSource.DataSet.Eof do
  begin
   v_cloumn:=0;
   for iCount := 0 to dbgrid.Columns.Count - 1 do
    if dbgrid.Columns[iCount].Visible=true then
     Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
     dbgrid.Columns[iCount].Field.AsString
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

function Get_Pick_List_Inside_Value(sTitle,sExpr:string):string;//返回PickList中指定项目的数值
var IPos:integer;
begin
  IPOs := Pos(Uppercase(sTitle),Uppercase(sExpr));
  if IPos > 0 then
  begin
    sExpr:= copy(sExpr,IPos+Length(sTitle)+1,10000);
    IPos:= Pos(';',sExpr);
    if IPos > 0 then
      result := Copy(sExpr,1,IPos-1);
  end;
end;

function Find_FieldName_In_DBGRid(Grid:TDBGRid;Caption:string):string;overload;
var
  i:integer;
begin
  result := '';
  for i := 0 to Grid.Columns.Count -1 do
    if Grid.Columns[i].Title.Caption = Caption then
    begin
      result := Grid.Columns[i].FieldName;
      break;
    end;
end;

function Find_FieldName_In_DBGRid(Grid:TDBGRidEh;Caption:string):string;overload;
var
  i:integer;
begin
  result := '';
  for i := 0 to Grid.Columns.Count -1 do
    if Grid.Columns[i].Title.Caption = Caption then
    begin
      result := Grid.Columns[i].FieldName;
      break;
    end;
end;

procedure Add_Fields_To_List(Grid:TDBGRid;var FieldList:TStrings);
var
  i:integer;
begin
  FieldList.Clear;
  for i := 0 to Grid.Columns.Count -1 do
  begin
    if Grid.Columns[i].Field.DataType in [ftString,ftWideString,ftMemo] then
      FieldList.Add(Grid.Columns[i].Title.Caption);
  end;
end;

procedure pCall_Report(rptName:string;RptTitle,UserId:string;vData:OLeVariant;PrintMode:byte);
var
  LibHandle: THandle;
  Call_Report: TCall_Report;
begin
  LibHandle := LoadLibrary('RptExport.dll');
  try
    if LibHandle = HINSTANCE_ERROR then
      ShowMsg('无法调用动态库"RptExport.dll,请联系系统管理员"',1);
    @Call_Report := GetProcAddress(LibHandle, 'Call_Report');
    if not (@Call_Report = nil) then
      Call_Report(RptName,RptTitle,UserId,vData,PrintMode);
  finally
    FreeLibrary(LibHandle);
  end;
end;

function Get_FS_Rpt_Name(RptNo:integer;var RptTitle:string):string;
begin
  case RptNo of
    qry_Order_Price : begin
                        RptTitle:='订单价格分析';
                        result := 'QryOrderPrice.FR3';
                      end;

  end;
end;

procedure Add_Fields_To_List(Grid:TDBGRidEH;var FieldList:TStrings);
var
  i:integer;
begin
  FieldList.Clear;
  for i := 0 to Grid.Columns.Count -1 do
  //  if Grid.Columns[i].Field.DataType in [ftString,ftWideString,ftMemo] then
       FieldList.Add(Grid.Columns[i].Title.Caption);
end;

function Div_Between_Phrase(S:string;DataType:string;var LeftPart,RightPart:variant):boolean;//分解Between A And B,返回A,和B数值
var
 i:integer;
// sLeft,sRight:string;
// vTmp:variant;
begin
  i:= POS('AND',S);
  if i =0 then
    result := false
  else
  begin
    LeftPart:=trim(copy(S,1,i-1));
    RightPart:=trim(copy(S,i+3,length(S)-i));
    try
      if dataType='D' then
      begin
        LeftPart:= StrToDatetime(DeQuotedStr(LeftPart));
        RightPart:= StrToDatetime(DeQuotedStr(RightPart));
      end
      else if DataType = 'F' then
      begin
        LeftPart:= StrToFloat(LeftPart);
        RightPart:= StrToFloat(RightPart);
      end;
      result := true;
    except
      result := false;
    end;
  end;
end;


procedure ReSet_Sort(GRId:TDBGRidEH);
var
  i:integer;
  OldIndex:string;
begin
  if not GRId.DataSource.DataSet.Active then exit;
  for i := 0 to GRId.Columns.Count-1 do
  begin
    GRId.Columns[i].Title.SortMarker :=smNoneEh;
    OldIndex:=TClientDataSet(GRId.Columns[i].Field.DataSet).IndexName;
    if OldIndex<>'' then
    begin
      TClientDataSet(GRId.Columns[i].Field.DataSet).IndexName:='';
      TClientDataSet(GRId.Columns[i].Field.DataSet).DeleteIndex(OldIndex);
    end;
  end;
end;

procedure Sort_Data_ClientDataSet(SortColumn: TColumn;var ASC:Boolean);
var OldIndex:string;
begin
  if (SortColumn.Grid.DataSource=nil) or (SortColumn.Grid.DataSource.DataSet=nil) or (not SortColumn.Grid.DataSource.DataSet.Active) then
    Exit;
  OldIndex:=TClientDataSet(SortColumn.Field.DataSet).IndexName;

  if OldIndex<>'' then
  begin
    TClientDataSet(SortColumn.Field.DataSet).IndexName:='';
    TClientDataSet(SortColumn.Field.DataSet).DeleteIndex(OldIndex);
  end;
  case ASC of
    True :
      TClientDataSet(SortColumn.Field.DataSet).AddIndex('px',SortColumn.Field.FieldName,[ixDescending]);//已经是升序就按降序排列
    else//否则按升序排列
      TClientDataSet(SortColumn.Field.DataSet).AddIndex('px',SortColumn.Field.FieldName,[ixPrimary]);
  end;{end case}

  TClientDataSet(SortColumn.Field.DataSet).IndexName:='px';
  ASC:=not ASC;
end;

procedure Add_Columns_ToDBGrid(Grid:TDBGRidEh;DataSet:TDataSet);overload;
var
  i:integer;
begin
  if Grid.Columns.Count > 0 then
    Grid.Columns.Clear;
  grid.FooterRowCount := 1;
  grid.FooterColor := clMoneyGreen;
  DataSet.first;
  for i := 0 to DataSet.RecordCount -1 do
  begin
    grid.Columns.Add;
    grid.Columns[i].FieldName := DataSet.fieldByName('FieldName').AsString;
    grid.Columns[i].Title.Caption := DataSet.fieldByName('Caption').AsString;
    grid.Columns[i].Title.Alignment := taCenter;
    grid.Columns[i].Width := DataSet.fieldByName('Width').value;
    grid.Columns[i].Visible := DataSet.fieldByName('Visible').AsBoolean;
    if DataSet.fieldByName('SecurityFlag').AsInteger = 1 then //银码字段
      grid.Columns[i].Visible := ((strToInt(vprev)=3) or (strToInt(vprev)=4));
    if DataSet.fieldByName('GroupType').Value = 1 then
    begin
      grid.Columns[i].Footer.FieldName :=DataSet.fieldByName('FieldName').AsString;
      grid.Columns[i].Footer.ValueType := fvtSum;
      grid.Columns[i].Footer.DisplayFormat := '###,###,###,##0.####';
    end
    else if DataSet.fieldByName('GroupType').Value = 2 then
    begin
      grid.Columns[i].Footer.FieldName :=DataSet.fieldByName('FieldName').AsString;
      grid.Columns[i].Footer.ValueType := fvtAVG;
      grid.Columns[i].Footer.DisplayFormat := '###,###,###,##0.####';
    end;
    DataSet.next;
  end;
end;

procedure Export_Grid_Column_To_Text(QryNo,FileName:string;Grid:TDBGRid);overload;
var
  i:integer;
  F:TextFile;
  S:string;
begin
  assignfile(f,FileName);
  try
    rewrite(f);
    for i:= 0 to Grid.Columns.Count - 1 do
    begin
      S := QryNo+' , '+IntToStr(i+1)+' , '+Grid.Columns[i].FieldName+' , '+ Grid.Columns[i].Title.Caption+' , 1  , '+ IntToStr(Grid.Columns[i].Width);
      writeln(f,s);
    end;
   finally
     closefile(f);
   end;
end;

procedure Reset_Grid_Columns(Grid:TDBGRidEh;DataSet:TDataSet);overload;
var
  i:integer;
begin
  DataSet.first;
  for i := 0 to DataSet.RecordCount -1 do
  begin
    grid.Columns[i].Width := DataSet.fieldByName('Width').value;
    grid.Columns[i].Visible := DataSet.fieldByName('Visible').AsBoolean;
    if DataSet.fieldByName('SecurityFlag').AsInteger = 1 then //银码字段
      grid.Columns[i].Visible := ((strToInt(vprev)=3) or (strToInt(vprev)=4));
    DataSet.next;
  end;
end;

function Get_Srv_IP(ConnStr:string):string;//通过Ado连接字符串,解析三层服务器IP
var
  filename,DBName,expr_Conn:string;
  myinifile:TIniFile;
begin
  expr_Conn:= ConnStr;
  filename:=ExtractFilePath(Application.ExeName)+'Login.ini';
  myinifile:=TInifile.Create(filename);
  try
    DBName:=Extract_Expr('Catalog=',expr_Conn);
    if DBName<>'' then
      result:=myinifile.readstring('LogIn_Info',DBName,'')
    else
      result:='';
  finally
    myinifile.free;
  end;
end;

function LogIn_Server:boolean;//登入服务器
var
  SrvIP:string;
  ErrorMsg:widestring;
begin

  App_Init;

  if not Get_Server_List(db_ptr) then
  begin
    ShowMsg('登入服务器失败:中间层服务器IP地址为空,请检查!',1);
    result := false;
    exit;
  end;
  with pdmConn do begin
    try
      SocketConnection1.Connected := false;
//      SocketConnection1.Address := SrvIP;
      SocketConnection1.ServerName := 'SrvQuery.CoQuery';
      SocketConnection1.Connected := true;
    except
      ShowMsg('连接服务器失败，请联系系统管理员','提示',1);
      result := false;
      exit;
    end;
    coMyQuery := ICoQueryDisp(IDispatch(pdmConn.SocketConnection1.AppServer));
    if not coMyQuery.Set_Ado_Conn_Str(trim(db_ptr),ErrorMsg) then
    begin
      ShowMsg('程序启动失败：'+ErrorMsg,1);
      result := false;
      exit;
    end
    else
      result := true;
  end;
{1.获取ado连接
2.找到服务器IP
3.登入系统}

end;

function Save_Grid_Columns_Change(ModId:integer;Grid:TDBGRidEh;DataSet:TClientDataSet):boolean;overload;
var
  i:integer;
  vData:Olevariant;
  ErrorMsg:Widestring;
  pBillNo:widestring;
begin
  if DataSet.IsEmpty then exit;
  if DataSet.RecordCount <> Grid.Columns.Count then
  begin
    ShowMsg('栏位数据对比出现异常,请联系系统管理员',1);
    abort;
  end;

  DataSet.first;
  pBillNo:= DataSet.fieldbyName('qryNo').Asstring;
  try
    for i := 0 to Grid.Columns.Count - 1 do
    begin
      DataSet.edit;
      DataSet.FieldByName('FieldName').Value := Grid.Columns[i].FieldName;
      DataSet.FieldByName('Caption').Value := Grid.Columns[i].Title.Caption;
      DataSet.FieldByName('width').Value := Grid.Columns[i].Width;
      DataSet.Post;
      DataSet.Next;
    end;
  except
    on E:Exception do
    begin
      ShowMsg(E.Message,1);
      result := false;
      exit;
    end;
  end;
  if DataSet.ChangeCount > 0 then
    vData:= DataSet.Delta;
    result := coMyQuery.Update_One_Table(ModId,vData,ErrorMsg,pBillNo);
    if not result then
      ShowMsg(ErrorMsg,1);
end;


function Get_Server_List(ConnStr:string):Boolean;
var
  filename,DBName,expr_Conn,str_server:string;
  myinifile:TIniFile;
  i:integer;
  TmpStr:TStringList;
//  tmp_Servers:  TServerCollection;
begin
  expr_Conn:= ConnStr;
  filename:=ExtractFilePath(Application.ExeName)+'Login.ini';
  myinifile:=TInifile.Create(filename);
  try
    DBName:=Extract_Expr('Catalog=',expr_Conn);
    if DBName<>'' then
    begin
//      TmpStr:=myinifile.readstring('LogIn_Info',DBName,'')
      Tmpstr:= TStringList.Create;
      try
        myinifile.ReadSection(DBName,Tmpstr);
        if TmpStr.Count > 0 then
        begin
          for i:= 0 to Tmpstr.Count-1 do
          begin
            pdmConn.SimpleObjectBroker1.Servers.Add;
            pdmConn.SimpleObjectBroker1.Servers[i].ComputerName := Tmpstr[i];
          end;
        end
      finally
        Tmpstr.Free;
      end;
    end
    else
    begin
      result := false;
      exit;
    end;
    result := true;
  finally
    myinifile.free;
  end;
end;

procedure TransferColumnsBetweenGrids(FromGrid:TDBGRid;ToGrid:TDBGRidEh);
var
  i:integer;
begin
  if ToGrid.Columns.Count > 0 then
    ToGrid.Columns.Clear;
  for i := 0 to FromGrid.Columns.Count - 1 do
  begin
  
  end;
end;

procedure Export_Grid_Column_To_Text(QryNo,FileName:string;Grid:TDBGRidEH);overload;
var
  i:integer;
  F:TextFile;
  S:string;
begin
  assignfile(f,FileName);
  try
    rewrite(f);
    for i:= 0 to Grid.Columns.Count - 1 do
    begin
      S := QryNo+','+IntToStr(i+1)+','+Grid.Columns[i].FieldName+','+ Grid.Columns[i].Title.Caption+', 1  ,'+ IntToStr(Grid.Columns[i].Width);
      writeln(f,s);
    end;
   finally
     closefile(f);
   end;
end;
end.


