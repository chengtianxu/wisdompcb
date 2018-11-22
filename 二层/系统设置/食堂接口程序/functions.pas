{       EastRiver Smart Function Example               }
{                                                      }
{            Author: shuguang LING                     }
{                                                      }
{               April.14.2004                          }


unit Functions;

interface

uses
  Windows, SysUtils, Forms, Controls, EastRiver,{EastriverT,} Classes,  Dialogs;

var
  StrPwd :String;
  RealFlag: Boolean=False;

  function CheckHandle(hPort: THandle): Boolean;
  function OpenPort(pclk: PClockInfo; Style: Integer): Boolean;
  function ClosePort(pclk: PClockInfo; Style: Integer): Boolean;
  function Is880(Model: Integer): Boolean;
  function Is780(Model: Integer): Boolean;
  function MsgBox(const Text: string; Flags: Longint=MB_ICONINFORMATION): Integer;
  function MyStrToTime(StrTime: string): TDateTime;
  function TimeToMyStr(Time: TDateTime): string;
  function StrsToPeriods(const Strs: TStrings; var Periods: string): Boolean;
  function PeriodsToStrs(var Strs: TStrings; const PeriodBytes: string): Boolean;
  function SplitString(const S: string;var args: array of string;const Seperators: TSysCharSet=[#9]): Integer;
  function AryStrToString(const args: array of string; Seperator: Char=#9; MaxCol: Integer=0): string;



resourcestring
  msg_Infor = '提示';
  msg_error = '错误';
  msg_confirm = '确认';
  msg_Warning = '警告';
  msg_connect_clock_fail = '无法联接 COM%d-%.2x';
  msg_connect_clock_fail_tcp = '无法联接 IP地址：%s，机号：%.2x ';
  msg_write_iccard_error = '写卡错误';
  msg_read_iccard_error = '读卡错误'; 
  SCeEaEeA = '请输入卡号. ';
  SCeEaEeAAAUAe = '请输入开门密码. ';
  msg_add_list_card_error = '添加卡号错误';
  msg_delete_list_card_error = '删除卡号错误';
  msg_clear_list_card_error = '清除卡号错误';
  msg_write_iccard_pwd_error = '写IC卡密码错误';
  msg_readalldata_time = '正在读取第一批数据,大约需 %d 秒.';
  msg_readall_savedata = '正在保存第 %d/%d 条记录...';
  msg_record_xor_err = '记录校验错误, 是否保存? ';
  msg_readall_continue = '是否继续接收? ';
  msg_readall_nodata = '机内没有数据！';
  msg_readall_cleardata = '机内总共有%d条，取出了%d条。是否要清除数据？';
  msg_readall_comm_err = '机串行通信错误，错误代码：%d';
  msg_readall_cmderr_xorerr = '机命令字异或校验错误，错误代码：%d';
  msg_readall_cancel = '机用户中止或接收未完成，错误代码：%d';
  msg_reqadall_resource_err = '机资源分配错误，错误代码：%d';
  msg_realread_caption = '实时读';
  msg_realread_stop = '停止';
  msg_realmonitor_caption = '实时监控';
  msg_stoprealmonitor_caption = '停止监控';
  msg_realread_nofind = '实时查询没有找到卡';
  msg_realread_readerr = '实时读取卡号错误';
  msg_realread_connect = '要求先联机';
  msg_readall_consume = '消费';
  msg_readall_charge = '补贴';
  msg_dataok = '数据采集完毕，数据已保存在当前文件夹下。共耗时 %.1f 秒';
  msg_datafinnook = '数据采集完毕，记录总数为 %d，但只采集 %d 。请查明原因。共耗时 %.1f 秒';
  msg_pwd_modiOk = '密码修改成功';
  msg_pwd_modifail = '密码修改失败';
  msg_pwd_readclientcode_ok = '客户代码读取成功';
  msg_pwd_readclientcode_fail = '客户代码读取失败';
  msg_pwd_setclientcode_ok = '客户代码设置成功';
  msg_pwd_setclientcode_fail = '客户代码设置失败';
  msg_inputnewid_error = '新机号输入不正确！';
  msg_clockid_modi_ok = '机号修改成功';
  msg_clockid_modi_fail = '机号修改失败';
  msg_findprob_code = '出现错误，错误代码：%d';
  msg_checkcard_exists = '已存在！';
  msg_checkcard_notexists = '不存在！';
  
implementation

uses  MainU;

function CheckHandle(hPort: THandle): Boolean;
begin
  Result:=(hPort<>0) and (hPort<>INVALID_HANDLE_VALUE);
end;



function OpenPort(pclk: PClockInfo; Style: Integer): Boolean;
var
  SaveCursor: TCursor;
  //tddevinfo:DEVINFO;
  StrIP: AnsiString;
  PMode: array[0..34] of Char;
  function BaudToByte(Baud: Integer): Byte;
  begin
    case Baud of
       9600:Result := 5;
      19200:Result := 6;
      38400:Result := 7;
      57600:Result := 8;
     115200:Result := 9;
     else   Result := 5;
    end;
  end;
begin
  SaveCursor := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    Result:=False;
    if CheckHandle(pclk.hPort) then
    begin
      GetClockModel(pclk.hPort, pclk.Model, pclk.fireware, pclk.cls);
      Result:=True;
    end else //如果不在联机状态则联机
    begin
      case Style of
        0:pclk.hPort:=OpenCommPort(pclk.Port, pclk.BaudRate);
        1:begin
            case pclk.Vendor of
              1:begin
                  StrIP := pclk.IPAddr;
                  {
                  if ZNET_GetDeviceInformation(PChar(StrIP),@tddevinfo)=1 then
                  begin
                    tddevinfo.workmode := 1;
                    tddevinfo.workport := pclk.IPPort;
                    tddevinfo.zne100info.baud:=BaudToByte(pclk.baudrate);
                    tddevinfo.zne100info.databits:=8;
                    tddevinfo.zne100info.stopbits:=1;
                    tddevinfo.zne100info.checkbits:=3;
                    if ZNET_ModifyDevice(PChar(pclk.IPAddr),PChar(pclk.IPPwd),@tddevinfo)=1 then
                    begin
                      pclk.hPort := OpenClientSocket(PCHar(pclk.IPAddr), pclk.IPPort);
                    end;
                  end;
                  }
                   pclk.hPort := OpenClientSocket(PCHar(pclk.IPAddr), pclk.IPPort);
                end;
             else
                pclk.hPort := OpenClientSocket(PCHar(pclk.IPAddr), pclk.IPPort);
            end;
          end;
      end;
      if CheckHandle(pclk.hPort) then
      begin
        //SetCmdVerify(pclk.CmdVerify);
        SetCmdVerify(true);
        SelectCommStyle(pclk.CommStyle);
        if RealFlag then Result := True
        else begin
          Result:=CallClock(pclk.hPort, pclk.clock_id);
          if Result then
          begin
            if not GetClockModel(pclk.hPort, pclk.Model, pclk.fireware, pclk.cls) then
            begin
              SetPortParity(pclk.hPort, 4);
              GetClockModel(pclk.hPort, pclk.Model, pclk.fireware, pclk.cls);
            end;
            ReadClockMode(pclk.hPort, pclk.Mode, pclk.ExtraMode, pclk.SystemMode);
            pclk.VerOrd:=GetClockVersionOrd(pclk.hPort);
            FillChar(PMode, 35, #0);
            //ReadClockModeStr(pclk.hPort, PMode);
            //SetClockModeStr(pclk.hPort, PMode);
            //ShowMessage(PMode);
            //if (pclk.model=880) and (pclk.Fireware<=1.32) then
            if (pclk.model=690) and (pclk.Fireware=1.5) then
              pclk.Decimal:=100
            else
              pclk.Decimal:=10;
          end else
          begin
            ClosePortHandle(pclk.hPort);
            pclk.hPort := 0;
          end;
        end;
      end;
    end;
    pclk.Connected := Result;
    if not Result then
      if pclk.CommStyle=0 then
        MsgBox(format(msg_connect_clock_fail, [pclk.Port, pclk.clock_id]), MB_ICONERROR)
      else
        MsgBox(format(msg_connect_clock_fail_tcp, [pclk.IPAddr, pclk.clock_id]), MB_ICONERROR)
  finally
    Screen.Cursor := SaveCursor;
  end;
end;

function ClosePort(pclk: PClockInfo; Style: Integer): Boolean;
begin
  Result:=False;
  if Assigned(pclk) then
  begin
    if CheckHandle(pclk.hPort) then
    begin
      UnCallClock(pclk.hPort);
      case Style of
        0:ClosePortHandle(pclk.hPort); //CloseHandle(pclk.hPort);
        1:CloseClientSocket(pclk.hPort);
      end;
      Result:=True;
    end;
    pclk.hPort:=0;
  end;
end;

function Is880(Model: Integer): Boolean;
begin
  Result:=ClockVerOrd(Model)>1;
end;

function Is780(Model: Integer): Boolean;
begin
  Result:=ClockVerOrd(Model)>2;
end;

function MsgBox(const Text: string; Flags: Longint): Integer;
var
  Caption: string;
begin
  if (Flags and MB_ICONWARNING)<>0 then
    Caption:=msg_warning
  else if (Flags and MB_ICONERROR)<>0 then
    Caption:=msg_error
  else if (Flags and MB_ICONQUESTION)<>0 then
    Caption:=msg_confirm
  else Caption:=msg_infor;
  if Assigned(Screen.ActiveForm) then
    Result:=MessageBox(Screen.ActiveForm.Handle, PChar(Text), PChar(Caption), Flags)
  else
    Result:=Application.MessageBox(PChar(Text), PChar(Caption), Flags);
end;

function MyStrToTime(StrTime: string): TDateTime;
//时间字符串格式:32:45
var
  tmpStr: string;
  tmpVar: Integer;
  tmpTime: TDateTime;
  Day, Hour, Min: WORD;
begin
  Result := 0;
  try
    StrTime := Trim(StrTime);
    if Length(StrTime)=5 then
    begin
      if StrTime[3]=TimeSeparator then
      begin
        tmpStr := Copy(StrTime, 1, 2);
        tmpVar := StrToIntDef(tmpStr, 0);
        Day := tmpVar div 24;
        Hour := tmpVar mod 24;
        tmpStr := Copy(StrTime, 4, 2);
        tmpVar := StrToIntDef(tmpStr, 0);
        Min := tmpVar;
        tmpTime := EncodeTime(Hour, Min, 0, 0);
        ReplaceDate(tmpTime, Day);
        Result := tmpTime;
      end;
    end
    else if Length(StrTime)=4 then //中间无时间分隔符
    begin
      tmpStr := Copy(StrTime, 1, 2);
      tmpVar := StrToIntDef(tmpStr, 0);
      Day := tmpVar div 24;
      Hour := tmpVar mod 24;
      tmpStr := Copy(StrTime, 3, 2);
      tmpVar := StrToIntDef(tmpStr, 0);
      Min := tmpVar;
      tmpTime := EncodeTime(Hour, Min, 0, 0);
      ReplaceDate(tmpTime, Day);
      Result := tmpTime;
    end;
  except
    Result := -1;
  end;
end;

function TimeToMyStr(Time: TDateTime): string;
var
  Day, Hour, Min, Sec, Msec: WORD;
  tmpStr: string;
begin
  if Time>=100/24 then
    Exit;
  if Time<0 then
    Exit;
  try
    Day := WORD(Trunc(Time));
    DecodeTime(Time, Hour, Min, Sec, MSec);
    Hour := Day*24+Hour;
    tmpStr := format('%.2u', [Hour]);
    Result := tmpStr+TimeSeparator;
    tmpStr := format('%.2u', [Min]);
    Result := Result+tmpStr;
  except
    Result := '';
  end;
end;

function StrsToPeriods(const Strs: TStrings; var Periods: string): Boolean;
var
  i, y: Integer;
  Buf: array[0..5] of Byte;
  TimeBegin, TimeEnd: TDateTime;
begin
  Result := False;
  if Assigned(Strs) then
  begin
    SetLength(Periods, 12);
    FillChar(Buf, Length(Buf), 0);
    for i := 0 to Strs.Count-1 do
    begin
      TimeBegin := MyStrToTime(Copy(Strs[i], 1, 5));
      TimeEnd := MyStrToTime(Copy(Strs[i], 6, 5));
      if (TimeEnd>0)and(TimeEnd>TimeBegin) then
        for y := Round(TimeBegin*48)to Round(TimeEnd*48)-1 do
        begin
          Buf[y div 8] := ((Buf[y div 8])or(1 shl(y mod 8)));
        end;
    end;
    for i := 0 to 5 do
    begin
      StrMove(@Periods[i*2+1], PChar(IntToHex(Buf[i], 2)), 2);
    end;
    Result := True;
  end;
end;

function PeriodsToStrs(var Strs: TStrings; const PeriodBytes: string): Boolean;
var
  i, head, tail: Integer;
  TimeBegin, TimeEnd: TDateTime;
  Buf: array[0..6] of Byte;
begin
  Result := False;
  tail := -1;
  if Assigned(Strs) then
  begin
    Strs.Clear;
    HexToBin(PChar(PeriodBytes), @Buf, Length(PeriodBytes));
    Buf[6] := 0;
    for i := 0 to 48 do
    begin
      if ((Buf[i div 8])and(1 shl(i mod 8)))=0 then
      begin
        head := tail+1;
        tail := i;
        if (tail>head) then
        begin
          TimeBegin := head/48;
          TimeEnd := (tail)/48;
          if TimeEnd>=TimeBegin then
          begin
            Strs.Add(TimeToMyStr(TimeBegin)+TimeToMyStr(TimeEnd));
          end;
        end;
      end;
    end;
    Result := True;
  end;
end;

function SplitString(const S: string;var args: array of string;const Seperators: TSysCharSet=[#9]): Integer;
var
  i, ct, head, tail: Integer;
begin
  ct := 0;
  tail := 0;
  Result:=0;
  FillChar(Args, SizeOf(Args), 0);
  if Length(args)=0 then Exit;
  for i := 1 to Length(S) do
  begin
    if S[i] in Seperators then
    begin
      head := tail;
      tail := i;
      Args[Low(Args)+ct] := Copy(S, head+1, tail-head-1);
      inc(ct);
    end
    else if (i=Length(S)) then
    begin
      Args[Low(Args)+ct]:=Copy(S, tail+1, i-tail);
      Inc(ct);
      Break;
    end;
    if ct>High(Args) then Break;
  end;
  Result:=ct;
end;

function AryStrToString(const args: array of string; Seperator: Char; MaxCol: Integer): string;
var
  i: Integer;
begin
  if MaxCol=0 then MaxCol:=High(args) else
    if MaxCol>High(args) then MaxCol:=High(args);
  Result:=args[Low(args)];
  for i:=Low(args)+1 to MaxCol do
    Result:=Result+Seperator+args[i];
end;



end.

