{*******************************************************}
{                                                       }
{                    对卡钟的封装 简化操作              }
{       如果测试通过 就把代码复制到EastRiver  中        }
{*******************************************************}

unit CLK;

interface

uses EastRiver;

Type
    TCLK=class(TClockInfo)
    private
    protected
    public
          function SetCLK(tcp:boolean; IP: string; port:string;clock_id:string):TClockInfo;
    end;

implementation

function SetCLK(tcp:boolean; IP: string; port:string;clock_id:string):TClockInfo;
begin
     if tcp then
      Result.CommStyle:=1
      else
     Result.CommStyle:=0;
     
     Result.IPAddr:=IP;
     Result.IPPort:=StrToIntDef(Port,0);
     Result.clock_id:=StrToIntdef(clock_id,0);
end;



function NewOpenPort(pclk: PClockInfo; Style: Integer): Boolean;
var

  Model: Integer;
  Ver: Double;
  cls: Integer;
begin
   if FMain.oldCheckCall.checked then
   begin
     Result:=OpenPort(pclk,style);
     Exit;
   end;

   Result:=false;
   case Style of
      0:pclk.hPort:=OpenCommPort(pclk.Port, pclk.BaudRate);
      1:begin
        pclk.hPort:=OpenClientSocket(PCHar(pclk.IPAddr), pclk.IPPort);
      end;
   end;
   if CheckHandle(pclk.hPort) then
   begin
      SelectCommStyle(pclk.CommStyle);
      //Eastriver.SetPortParity(pclk.hPort,3);
      //Eastriver.SetCmdVerify(true);



      if FMain.cbIs880.Checked then
      begin
          Eastriver.SetCmdVerify(true);
          //Result:=QuickOldCallClock(pclk.hPort, pclk.clock_id);
           Result:=QuickCallClock(pclk.hPort, pclk.clock_id,false);
      end
      else if FMain.cbIs981.Checked then
      begin
          Eastriver.SetCmdVerify(true);
          //Result:=QuickOldCallClock(pclk.hPort, pclk.clock_id);
          Result:=QuickCallClock(pclk.hPort, pclk.clock_id,false);
      end
      else
      begin
        Result:=CallClock(pclk.hPort, pclk.clock_id);
      end;
      //if FMain.cbIs880.Checked then
      //begin
      //  Eastriver.SetPortParity(pclk.hPort,4);
      //end;

   end;
  if not Result then
  if pclk.CommStyle=0 then
     MsgBox(format(msg_connect_clock_fail, [pclk.Port, pclk.clock_id]), MB_ICONERROR)
  else
  begin
     Eastriver.GetClockModel(pclk.hPort,Model,Ver,cls);
     MsgBox(format(msg_connect_clock_fail_tcp, [pclk.IPAddr, pclk.clock_id]), MB_ICONERROR);
  end;

end;
end.
 