{*******************************************************}
{                                                       }
{       通用函数单元                                    }
{                                                       }
{       作者：ChengTX                                   }
{                                                       }
{       时间：2012-06-20 9:24:18                        }
{                                                       }
{*******************************************************}

//Delphi 2010 UNICODE
unit gFun;

interface
uses
  Windows, SysUtils, DB, Classes;

const
{开发备份}
  WISDOM_ERP_BAK = 'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info=True;'
   +'User ID=sa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8;Use Procedure for Prepare=1;'
   + 'Auto Translate=True;Packet Size=4096;Workstation ID=CHENGTX-PC;Use Encryption for Data=False;Tag with column collation when possible=False';

type
{程序管道取得数据}
  TAppStartRet = record
    ConStr: string;//数据库连接字符串
    UserQX: string;//用户权限
    UserPtr: string;//用户RKEY
    DBName: string;//数据库名称
  end;

{返回值检查}
function CallC(n: Integer): Boolean;
{捕获系统错误弹出提示}
function SysErrShow(e: Exception): Integer;
{DB导出到Excel}
function DSExportTOEXCEL(ADS: TDataSet): Boolean;

{程序开始初始化}
function AppStartCheck(out outRet: TAppStartRet): Integer;
{时间日期转换为字符串}
function gDateTimeToStr(ADateTime: TDateTime): string;
{字符串是否为空}
function StrIsNull(S: string): Boolean;
procedure ShowLS(LS: TStringList);



{$REGION 'SQL语句类'}
//取得当前工序和之前完成工序，按STEP排序
function SQL_GetWOPassStep(A06RKey: string): string;
//取得需要的工序
function SQL_GetWOStep(A06RKey: string; bGuoSHu: Boolean): string;

{$ENDREGION}

var
  gAppStartRet: TAppStartRet;

implementation
uses
  Dialogs ,Variants, ComObj, Forms, Controls;


function AppStartCheck(out outRet: TAppStartRet): Integer;
var
  LMapData: array [0..1023] of Byte;
  hMapFile: THandle;
  MapFileAddr: Pointer;
  tmpS: string;

  nCount: Integer;
  function CallBack(H: HWND; param: LPARAM): Boolean; stdcall;
  var
    stmp: array [0..254] of WideChar;
    n: Integer;
  begin
    n := 255;
    GetWindowText(H,stmp,n);
    if StrComp(stmp,PWideChar(Application.Title)) = 0 then
      Inc(nCount);
    if nCount >= 2 then
      Result := False
    else
      Result := True;
  end;

begin
  nCount := 0;
  ZeroMemory(@LMapData[0],SizeOf(LMapData));
  try
    hMapFile := OpenFileMappingA(FILE_MAP_ALL_ACCESS,False,PAnsiChar('xyz2055coimasp20'));
    if (hMapFile <> INVALID_HANDLE_VALUE) and (hMapFile <> 0) then
    begin
      try
        MapFileAddr := MapViewOfFile(hMapFile, File_Map_All_Access, 0, 0, 0);
        if MapFileAddr <> nil then
        begin
          CopyMemory(@LMapData[0],MapFileAddr,SizeOf(LMapData));
          tmpS := string(PAnsiChar(@LMapData[0]));
          outRet.UserPtr := Trim(Copy(tmpS, 3, Pos(' ', tmpS) - 3));
          outRet.UserQX := Trim(Copy(tmpS, Pos(' ', tmpS) + 1, 1));
          outRet.DBName:=copy(tmpS, pos('/', tmps) + 1,
            Pos(',', tmpS) - Pos('/', tmpS) - 1);
          outRet.ConStr := trim(copy(tmpS, pos(',', tmpS) + 1,
              length(tmpS) - Pos(',', tmpS)));
          if Length(Trim(outRet.ConStr)) = 0 then
          begin
            Result := 13;
            Exit;
          end;
          Application.Title := Application.Title + ' ' + outRet.DBName;
          EnumWindows(@CallBack,1);
//          ShowMessage(Application.Title);
//          ShowMessage(IntToStr(FindWindowW(nil, PWideChar(Application.Title))));
//          if FindWindowW(nil, PWideChar(Application.Title)) > 1 then
          if nCount > 1 then
          begin
            Result := 14;
            Exit;
          end;
          Result := 1;
        end else
          Result := 12;
      except
        on E: Exception do Result := SysErrShow(E);
      end;
    end else
      Result := 12;
  except
    on E: Exception do Result := SysErrShow(E);
  end;
end;

function SysErrShow(e: Exception): Integer;
begin
  ShowMessage(LoadStr(11) + #13 + e.Message);
  Result := 0;
end;

function CallC(n: Integer): Boolean;
begin
  Result := n = 1;
  if not Result and (n <> 0) then ShowMessage(LoadStr(n));
end;

function DSExportTOEXCEL(ADS: TDataSet): Boolean;
var
  LRow,LCol: Integer;
  XLApp:Variant;
  Sheet:Variant;
  OldPos: Integer;
  LField: TField;
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
    on e: Exception do
    begin
      ShowMessage(e.Message + '   请先安装office excel');
      Screen.Cursor := crDefault;
      Result := False;
      Exit;
    end;
  end;

  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := 'Sheets1';
  Sheet := XLApp.Workbooks[1].WorkSheets['Sheets1'];


  if ADS.IsEmpty then
  begin
    ShowMessage('没有数据');
    Result := False;
    Exit;
  end;

  OldPos := ADS.RecNo;
  try
    ADS.DisableControls;
    ADS.First;
    LRow := 0;
    while not ADS.Eof do
    begin
      LCol :=  0;
      for LField in ADS.Fields do
      begin
        Sheet.Cells[LRow+1,LCol+1] := LField.AsString;
        Inc(LCol);
      end;
      ADS.Next;
      Inc(LRow);
      Application.ProcessMessages;
    end;
  finally
    ADS.RecNo := OldPos;
    ADS.EnableControls;
  end;

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  Result := True;
end;

function gDateTimeToStr(ADateTime: TDateTime): string;
begin
  Result := FormatDateTime('yyyy-MM-dd hh:mm:ss',ADateTime);
end;

procedure ShowLS(LS: TStringList);
var
  s: string;
  I: Integer;
begin
  for I := 0 to ls.Count - 1 do
    s := s + LS[I] + #13;
  ShowMessage(s);
end;


function StrIsNull(S: string): Boolean;
begin
  Result := Length(Trim(S)) = 0;
end;

function SQL_GetWOPassStep(A06RKey: string): string;
begin
  Result:='select distinct data0048.step_no,data0034.rkey as RKey34,data0034.dept_code,'+
            'data0034.dept_name '+
            'from data0048 INNER JOIN data0034 '+
            'on data0048.fm_dept_ptr=data0034.rkey '+
            'INNER JOIN Data0056 D56 ON D56.WO_PTR = Data0048.WO_PTR ' +
            'where data0048.wo_ptr=' + A06RKey +
            ' AND Data0048.STEP_NO <= D56.STEP ' +
            ' union '+
            'select data0056.step as step_no,data0034.rkey as RKey34,data0034.dept_code,'+
            'data0034.dept_name '+
            'from data0056 INNER JOIN data0034 '+
            'on data0056.dept_ptr = data0034.rkey '+
            'where data0056.wo_ptr='+ A06RKey +
            ' order by step_no';
end;

function SQL_GetWOStep(A06RKey: string; bGuoSHu: Boolean): string;
begin
  Result := 'SELECT  D38.STEP_NUMBER, D34.DEPT_CODE, D34.DEPT_NAME ,D34.BARCODE_ENTRY_FLAG' +
    ' FROM Data0038 D38 INNER JOIN Data0025 D25 ON D38.SOURCE_PTR = D25.RKey' +
    ' INNER JOIN Data0034 D34 ON D38.DEPT_PTR = D34.RKey' +
    ' INNER JOIN Data0006 D06 ON D25.RKey = D06.BOM_PTR' +
    ' WHERE D06.RKey = ' + A06RKey;
    if bGuoSHu then
      Result := Result + ' AND D34.BARCODE_ENTRY_FLAG =' + QuotedStr('Y');
    Result := Result + ' ORDER BY D38.STEP_NUMBER';
end;

end.
