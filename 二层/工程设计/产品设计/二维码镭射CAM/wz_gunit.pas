unit WZ_gUnit;

interface
uses
  SysUtils, Classes, Windows, ADODB, Forms, DBGridEh, ActiveX, Controls, Variants,
  ComObj, DB;
  
type
  TWZ_User = record
    User_Longin_Ptr: string;//登录用户的73指针
    User_Permit: string;//用户权限
    User_Ptr: string;//用户指针05指针
    DBConnectString: string;//数据库连接字符串
    DBName: string;//数据库名称
    MemData: array [0..1023] of Byte;//原始内存映射
  end;

var
  gUser: TWZ_User;

procedure FillDebugUser(out outRet: TWZ_User);//测试用户
function App_Init(out outRet: TWZ_User): Integer;overload;//程序初始化
function App_Init(ACon: TADOConnection; var outRet: TWZ_User): Integer;overload;
procedure Export_dbGridEH_to_Excel(dbGrid: TDBGridEh; title_caption: string);//导出到excel
function StrInArr(str: string; strarr: array of string): Boolean;
function gDateTimeToStr(ADatetime: TDateTime): string;
function gStrtoDatetime(Astr: string): TDateTime;
function gStrToDate(AStr: string): TDate;


implementation

procedure FillDebugUser(out outRet: TWZ_User);
begin
  outRet.User_Longin_Ptr := '2224';
  outRet.User_Permit := '4';
  outRet.User_Ptr := '2685';
  outRet.DBConnectString := 'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info=True;User ID=sa;Initial Catalog=demo2;Data Source=192.168.8.37';
  outRet.DBName := '开发备份';
end;

function App_Init(ACon: TADOConnection; var outRet: TWZ_User): Integer;overload;
var
  LQry: TADOQuery;
  OldAppNameHandle: THandle;
begin
  Result := App_Init(outRet);
  if Result = 1 then
  begin
  //同一数据库只能启动一个程序
    OldAppNameHandle := FindWindowA(nil,PAnsiChar((AnsiString(Application.Title + ' ' + outRet.DBName))));
    if OldAppNameHandle <> 0 then
    begin
      ShowWindow(OldAppNameHandle,SW_SHOWMINIMIZED);
      ShowWindow(OldAppNameHandle,SW_SHOWNORMAL);
      Result := 2;
      Exit;
    end;
    Application.Title := Application.Title + ' ' + outRet.DBName;

  //取得05RKey
    try
      ACon.Close;
      ACon.LoginPrompt := False;
      ACon.ConnectionString := outRet.DBConnectString;
      ACon.Open;
      LQry := TADOQuery.Create(nil);
      try
        try
          LQry.Connection := ACon;
          LQry.SQL.Add(' SELECT D05.RKey FROM Data0005 D05 ');
          LQry.SQL.Add(' INNER JOIN Data0073 D73 ON D73.EMPLOYEE_PTR = D05.RKey');
          LQry.SQL.Add(' WHERE D73.RKey = ' + outRet.User_Longin_Ptr);
          LQry.Open;
          if not LQry.IsEmpty then
            outRet.User_Ptr := LQry.FieldByName('RKey').AsString
          else
            Result := 0;
        except
          Result := 0;
          ACon.Close;
          Exit;
        end;
      finally
        LQry.Close;
        LQry.Free;
      end;
    except
      Result := 0;
    end;
  end;

end;

function App_Init(out outRet: TWZ_User): Integer;
var
  LMapFile: THandle;
  LPMapFile: Integer;
  LSegNO: Integer;
  I: Integer;
  LAnsiString: AnsiString;
begin
  Result := 0;
  LSegNO := 0;
  try
    LMapFile := OpenFileMappingA(FILE_MAP_ALL_ACCESS,False,PAnsiChar('coimasp20'));
    try
      if LMapFile <> 0 then
      begin
        LPMapFile := Integer(MapViewOfFile(LMapFile, File_Map_All_Access, 0, 0, 0));
        if LPMapFile <> 0 then
        begin
          try
            if PAnsiChar(LPMapFile)^ = #0 then Exit;
            CopyMemory(@outRet.MemData[0],Pointer(LPMapFile),SizeOf(outRet.MemData));
            for I := 0 to 1024 - 1 do
            begin
              if LSegNO = 3 then //DBConnectString
              begin
                if PAnsiChar(LPMapFile + I)^ <> #0 then
                begin
                  outRet.DBConnectString := outRet.DBConnectString + Char(PAnsiChar(LPMapFile + I)^);
                end else
                  Break;
              end;

              if LSegNO = 2 then //DBName
              begin
                if PAnsiChar(LPMapFile + I)^ <> '/' then
                begin
                  if PAnsiChar(LPMapFile + I)^ <> ',' then
                  begin
                    LAnsiString := LAnsiString + PAnsiChar(LPMapFile + I)^;
                  end else
                    Inc(LSegNO);
                end;
              end;

              if LSegNO = 1 then //User_Permit
              begin
                outRet.User_Permit := Char(PAnsiChar(LPMapFile + I)^);
                Inc(LSegNO);
              end;

              if LSegNO = 0 then //User_Longin_Ptr
              begin
                if PAnsiChar(LPMapFile + I)^ <> ' ' then
                begin
                  outRet.User_Longin_Ptr := outRet.User_Longin_Ptr + Char(PAnsiChar(LPMapFile + I)^);
                end else
                  Inc(LSegNO);
              end;
            end;
            outRet.DBName := string(LAnsiString);
            if Length(Trim(outRet.DBConnectString)) = 0 then Exit;
            Result := 1;
          finally
            UnmapViewOfFile(Pointer(LPMapFile));
          end;
        end;
      end;
    finally
      CloseHandle(LMapFile);
    end;
  except
    Result := 0;
  end;
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
        if dbgrid.Columns[iCount].Field.DataType in [ftString,ftWideString] then
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

function StrInArr(str: string; strarr: array of string): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := 0 to Length(strarr) - 1 do
  begin
    if str = strarr[I] then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

function gDateTimeToStr(ADatetime: TDateTime): string;
begin
  Result := FormatDateTime('YYYY-MM-DD hh:mm:ss', ADatetime);
end;

function gStrtoDatetime(Astr: string): TDateTime;
var
  FSetting : TFormatSettings;
begin
  FSetting.ShortDateFormat:='yyyy-MM-dd';
  FSetting.DateSeparator:='-';
  FSetting.TimeSeparator:=':';
  FSetting.LongTimeFormat:='hh:mm:ss.zzz';
  Result := StrToDateTime(Astr,FSetting)
end;

function gStrToDate(AStr: string): TDate;
begin
  Result := gStrtoDatetime(AStr);
end;

end.

