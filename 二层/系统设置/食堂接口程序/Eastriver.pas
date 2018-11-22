unit EastRiver;

{$WEAKPACKAGEUNIT}

interface
uses
  Windows, SysUtils;

const
  {$IFDEF DIRECTDLLCALL}
  EastRiver_API     = 'OldEastRiver.dll';
  {$ELSE}
  EastRiver_API     = 'EastRiver.dll';
  {$ENDIF}
  OldEastRiver_API     = 'OldEastRiver.dll';
//设备版本号(Fireware), 比较时最好用这些常量, 否则类型不匹配将出将比较错误
  FW119: Double     = 1.19;
  FW120: Double     = 1.20;
  FW125: Double     = 1.25;
  FW128: Double     = 1.28;
  FW129: Double     = 1.29;
  FW130: Double     = 1.30;

//新门禁机常量
  INOUT_RIGHT       =$00; //出入权限设置
  CIPHER_ENABLE     =$01; //密码检测时段
  ALERT_ENABLE      =$02; //报警生效时段
  BUTTON_ENABLE     =$03; //按键生效时段
  OPEN_DOOR         =$04; //电锁常开时段
  MAGNETISM_ENABLE  =$05; //门磁检测时段
  HOLIDAY_OPENRIGHT =$06; //节假日开门时段与权限
  SUPERUSERPWD_ENABLE=$07; //超级用户密码时段

// IC卡读写卡号格式常量
  CARDSTYLE_UNKNOWN= 0000; //未知卡号格式(可能为空)
  CARDSTYLE_IDCARD = 0001; //ID卡格式
  CARDSTYLE_UTFCARD= 0002; //自定义卡格式
  CARDSTYLE_OLDCARD= 0830; //旧ER-680C消费卡格式
  CARDSTYLE_NEWCARD= 0880; //新ER-880C卡格式
  CARDSTYLE_690CARD= 0690; //新消费机ER-690卡格式

//  通讯卡号格式转换方法
  CS_AUTO          = $00;  //对880机具调用默认处理，880D=ID_NOCONVERT,880C=IC_CONVERT,新型门禁机=IC_CONVERT
                           //如果卡号为16位标准卡则ID，IC都不变换
  CS_GENERAL       = $01;  //不转换卡格式(明文)
  CS_NEWCARD       = $02;  //IC卡号，需要变换成IC标准卡号
  CS_OLDCARD       = $03;  //转换成旧ER-830C IC卡类型
  CS_IDCARD        = $04;  //ID卡号，变换成16位标准卡号即最高两个位时'EF'

  InitTimeOut      = 1000; //默认通讯超时
  
type
  PClockInfo=^TClockInfo;
  TClockInfo=record
    hPort: THandle;
    clock_id: Integer;
    port, baudrate: DWORD;        //通讯端口和速率
    Fireware: Double;             //模具版本
    clock_type,                   //运行模式    卡钟类型(0=考勤机，1=考勤门禁机，2=门禁机，3=消费机，4=补贴机，5=发卡机，6=数据服务器，7=会议签到)
    VerOrd,                       //版本系列
    model,                        //机具型号
    cls,                          //读头类型(0: ID卡, 1:IC卡, 2: 混合)
    CardFormat,                   //卡格式 1=原依时利卡格式 2=山东电信卡格式 3=移动卡格式 4=内蒙卡格式
    run_mode,                     //工作模式(0:考勤机, 1:考勤门禁 2:门禁机 3:消费机 4:发卡机 5:其它)
    Mode, SystemMode, ExtraMode,RingMode,  //运行参数
    Block,                        //使用IC卡块号
    DispCardLen, CardLen,         //显示卡号长度, 存储卡号长度
    GroupStation: Integer;        //分组字节位置
    GroupCheck,                   //是否打卡分组
    Connected,                    //是否已联机
    CmdVerify, RWOnly: Boolean;   //是否专用发卡器
    mark: Char;                   //刷卡标识
    CommStyle: Integer;           //通讯类型，0串口通讯 1TCP/IP通讯
    IPAddr: String;                //TCP/IP模块IP地址
    IPPort: Integer;              //TCP/IP模块端口
    Vendor: Integer;              //模块编号 0:=依时利 1=周立功 2=宇泰或其它
    IPPwd: String;                //模块的密码
    IPworkmode:string;            //TCP/IP转换器的工作模式
    Decimal: Integer;             //小数位
    IsU: Boolean;                 //是否带U盘
    IsSimCard: Boolean;           //是否可以刷手机卡
  end;



{***************依时利产品概况*******************
第一代(简称1G)
  ER-210 C/D 考勤消费机
  ER-610 C/D 考勤机
  ER-680 C/D 消费机
  ER-7x0 C/D 考勤门禁机
  ER-810 C/D 考勤机
  ER-830 C/D 考勤门禁机

第二代(简称2G)
  ER-880 C/D 考勤门禁机,包含很多版本,不完全兼容,正式发行版由1.25-1.30(fireware)
  ER-900 IC   通用发卡机
  ER-901 ID   通用发卡机

第三代(简称3G)
  ER-890C/D 考勤门机
  ER-890CT/DT 直接用TCP/IP联机的考勤门禁
  ER-980  四门门禁机,读头可以是IC也可以是ID,混合使用
  ER-981C 单门门禁机
  ER-983  大型门禁
  ER-985  小型门禁
  ER-690(1)C 消费机,兼容ER-980的大部分功能,只有部分和记录有关的指令不兼容,
          另外还扩展了部分消费专用指令
  ER-690(1)D 实时ID卡消费机
  ER-692  带服务器的ID实时消费机

}



function GetLastErrCode(): DWORD; stdcall; external EASTRIVER_API
function SetLastErrCode(ErrCode: DWORD): Boolean; stdcall; external EASTRIVER_API
//      取得最后发生的错误代号
function GetRecentErrCode(): DWORD; stdcall; external EASTRIVER_API
//      取得端口最后发生的错误代号
function GetPortRecentErrCode(Port: Byte): DWORD; stdcall; external EASTRIVER_API
//返回值:
const
  ERROR_IO_CHECK    = $00000001; //校验错误
  ERROR_IO_READ     = $00000002; //读错误
  ERROR_IO_WRITE    = $00000003; //写错误
  ERROR_IO_NOEND    = $00000004; //串口接收未结束而中断
  ERROR_IO_NOPEN    = $00000005; //不能打开端口
  ERROR_IO_COMMAND  = $00000006; //命令错误
  ERROR_IO_NOHANDLE = $00000007; //无句柄错误
  ERROR_IO_TIMEOUT  = $00000008; //通讯超时
  ERROR_IC_PASSWORD = $00000009; //IC卡密码错
  ERROR_NO_SUPPORT  = $00000010; //不支持的命令


{设备联接类}

//      打开串行端口
function OpenCommPort(Port: Integer; BaudRate: Integer): THandle; stdcall; external EASTRIVER_API
//参数说明:
// Port         : 端口号,允许值1-256, 如: COM1=1, COM2=2...COM256=256
// BaudRate     : 端口波特率,允许值: 9600, 19200, 38400, 通常是9600
//返回值:
// -1           : 端口无效或正在使用
// 0            : 无法打开端口
// 其它值       : 端口句柄,用于其它函数调用
//备注:
// 请使用Windows API CloseHandle(hObject: HANDLE): BOOL; 来关闭端口句柄

//      关闭已经打开的端口号
function CloseCommPort(Port: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// Port         : 端口号,允许值1-256, 如: COM1=1, COM2=2...COM256=256
//返回值:
// True=成功, False=失败

//      关闭端口句柄
function ClosePortHandle(hPort: THandle): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 已经打开的端口句柄
//返回值:
// True=成功, False=失败

//      初始化端口设置, 在打开端口和联机时自动调用, 除非需要修改端口参数
//      一般不需要自己调用
function InitCommPort(hPort: THandle; BaudRate: DWORD; Parity: Byte): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄
// BaudRate     : 新的端口波特率,允许值: 9600, 19200, 38400, 置为0时将保留原波特率
// Parity       : 新的端口校验方式,允许值如下:
//    NOPARITY    = 0;   //无校验
//    ODDPARITY   = 1;   //奇校验
//    EVENPARITY  = 2;   //偶校验
//    MARKPARITY  = 3;   //标记校验(联机之前)
//    SPACEPARITY = 4;   //空校验  (联机之后)
//    255         =$FF;  //不更改校验设置
//返回值:
// True=成功, False=失败

//设置校验方式
function SetPortParity(hPort: THandle; Parity: Byte): Byte; stdcall; external EASTRIVER_API
// Parity       : 新的端口校验方式,允许值如下:
//    NOPARITY    = 0;   //无校验
//    ODDPARITY   = 1;   //奇校验
//    EVENPARITY  = 2;   //偶校验
//    MARKPARITY  = 3;   //标记校验(联机之前)
//    SPACEPARITY = 4;   //空校验  (联机之后) 880,889机型1.32版本及以下要设置
//    255         =$FF;  //不更改校验设置

//      打开端口及联接设备(包含 OpenCommPort )
function ConnectClock(Port, BaudRate: Integer; clock_id: Integer): THandle;stdcall; external EASTRIVER_API
//参数说明:
// Port         : 端口号,允许值: 1-256, 如: COM1=1, COM2=2...COM256=256
// BaudRate     : 端口波特率,允许值: 9600, 19200, 38400, 通常是9600
// clock_id     : 机号,允许值: 0-255, 由于机具上显示的机号实际上是两位16进制数
//                所以机号范围16进制表示应该为: 0x00-0xFF
//返回值:
// -1           : 端口无效或正在使用
// 0            : 无法联机, 可能是端口,波特率,机号或是线路故障
// 其它值       : 联机成功,返回端口句柄,用于其它函数调用

//      断开联接及关闭端口句柄
function DisConnectClock(hPort: THandle): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄,通过调用ConnectClock函数得到
//返回值:
// True         : 脱机成功
// False        : 脱机失败

function SetClockIDLen(Len: Integer): Boolean; stdcall; external EASTRIVER_API
//设置机号长度字节数，默认值是1，只能设为1或2，表示一个字节(机号从0到255),二个字节(机号从0到65535)

//      检查指定的机器是否在联机状态
function CheckConnectClock(hPort: THandle; clock_id: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄,通过调用OpenCommPort函数得到
//返回值:
// True         : 联机状态
// False        : 脱机状态

//      显式联机命令
function CallClock(hPort: THandle; clock_id: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄,通过调用OpenCommPort函数得到
// clock_id     : 机号,允许值: 0-255, 由于机具上显示的机号实际上是两位16进制数
//                所以机号范围16进制表示应该为: 0x00-0xFF
//返回值:
// True         : 联机成功
// False        : 联机失败
//备注:
// "1G"机型不能重复联机
// 所有和机具通讯且没有带机号的函数都必须在联机后才能调用
// 用户一般不需要直接调用此函数, 建议使用 ConnectClock 函数

//      脱机命令
function UnCallClock(hPort: THandle): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄,通过调用OpenCommPort函数得到
//返回值:
// True         : 脱机成功
// False        : 脱机失败
//备注:
// 脱机后,所有和机具通讯没有带机号的函数均不起作用

//      检查指定机号在线上是否响应, 在限定的时间内返回
function TestCallClock(hPort: THandle; clock_id: Integer; TimeOut: Integer=0): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄,通过调用OpenCommPort函数得到
// clock_id     : 机号,允许值: 0-255, 由于机具上显示的机号实际上是两位16进制数
//                所以机号范围16进制表示应该为: 0x00-0xFF
// TimeOut      : 响应超时,用于调整搜索速度,推荐值(单位毫秒ms):
//    RS-232线路  = 100-120;
//    RS-485线路  = 120-200;
//    TCP/IP线路  = 500-800;
//    最大        > 1000;
//返回值:
// True         : 机具存在
// False        : 机具不存在

//      自动识别机具型号(DLL内部需要识别机型)
function ClockAutoModel(hPort: THandle): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
//返回值:
// True         : 自动识别成功
// False        : 机型无法识别,请调用强制设置机型函数
//备注:
// 由于不同的型号,不同读头的机具接受的卡号格式不完全相同,所以DLL需要知道正在联机
// 机型来转换不同的卡号格式,否则所有和卡号有关的函数将会起不到预期的效果

//      取得机具型号(DLL内部需要识别机型)
function GetClockModel(hPort: THandle; var Model: Integer; var Ver: Double; var cls: Integer): Boolean; stdcall; external EASTRIVER_API
function GetClockModelEx(hPort: THandle; var Model: Integer; var Ver: Double; var cls: Integer; var IsSimCard: Boolean; var CardFormat: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄
// Model        : 返回机具型号, 如:
//    ER-880C     = 880;
//    ER-980      = 980;
// ...
// Ver          : 返回机具版本号, 必须大于0, 如: 1.28, 1.30等等
// cls          : 返回机具类型(读头)
//    ER-880C     = 1;  //IC读头
//    ER-980      = 1;  //IC,ID读头混合
//    ER-880D     = 0;  //ID读头
// CardFormat //卡格式 1=原依时利卡格式 2=山东电信卡格式 3=移动卡格式 4=内蒙卡格式 
//返回值:
// True=成功, False=错误

//      设置标识DLL内部正在联机的机具型号(当自动识别无效时)
function SetClockModel(hPort: THandle; Model: Integer; Ver: Double; cls: Integer): Boolean; stdcall; external EASTRIVER_API
function SetClockModelEx(hPort: THandle; Model: Integer; Ver: Double; cls: Integer; CardFormat: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄
// Model        : 机具型号, 如:
//    ER-880C     = 880;
//    ER-980      = 980;
// ...
// Ver          : 机具版本号, 必须大于0, 如: 1.28, 1.30等等
// cls          : 机具类型(读头)
//    ER-880C     = 1;  //IC读头
//    ER-980      = 1;  //IC,ID读头混合
//    ER-880D     = 0;  //ID读头
// CardFormat //卡格式 1=原依时利卡格式 2=山东电信卡格式 3=移动卡格式 4=内蒙卡格式 
//返回值:
// True=成功, False=错误

//      修改机具通信速率(^2G)
function SetClockBaudRate(hPort: THandle; BaudRate: DWORD): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// BaudRate     : 新的机具波特率, 允许值: 9600, 19200, 38400
//返回值:
// True         : 修改成功
// False        : 修改失败
//备注: 调用前必须使用正确的波特率联机, 修改成功后如果需要和机具通讯必须
//      调用 InitCommPort 函数将端口波特率修改成和新的机具波特率一致

{设备联接类}



{版本控制类}

//      查询在线的机具是否支持某项功能
function GetClockSupports(hPort: THandle; Index: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// Index        : 功能编号, 可能的值如下表
const
  fiStoreRecord     = $00000000; //存储刷卡记录
  fiAttendance      = $00000001; //支持考勤功能
  fiDoorGuard       = $00000002; //支持门禁功能
  fiConsumption     = $00000003; //支持消费功能
  fiIssueCard       = $00000004; //支持发卡功能
//  ...                          //5-F 保留
  fiDoorList        = $00000010; //支持门禁名单
  fiWhiteList       = $00000011; //支持白名单
  fiBlackList       = $00000012; //支持黑名单
  fiHaveMark        = $00000013; //设备支持刷卡标识
  fiIDReader        = $00000014; //有ID读头
  fiICReader        = $00000015; //有IC读头
  fiScreen          = $00000016; //支持控制屏显示
  fibuzzer          = $00000017; //支持控制蜂器发声
  fiAdminCard       = $00000018; //支持管理卡
  fiBrushPeriods    = $00000019; //支持刷卡时段
  fiRingTime        = $0000001A; //支持打铃时间
  fiGroupCard       = $0000001B; //支持分组打卡
  fiRealTime        = $0000001C; //支持实时上传
  fiRealControl     = $0000001D; //支持实时控制
  fiChangeMode      = $0000001E; //支持更改运行模式
  fiChangeBlock     = $0000001F; //支持更改IC卡使用块号
  fiCustomCardLen   = $00000020; //支持自定义卡号长度
  fiBrushSpace      = $00000021; //支持自由刷卡间隔
  fiRepeatSpace     = $00000022; //支持重复刷卡间隔
  fiSerialNo        = $00000023; //支持机具序列号
  fiClockTime       = $00000024; //机具有时钟
  fiPriceList       = $00000025; //支持消费价格表
  fiFixPrice        = $00000026; //支持设置定值消费额
  fiDayMaxExpend    = $00000027; //支持设置日最大消费额
  fiDayMaxTimes     = $00000028; //支持设置日最大消费次数
  fiCardForegift    = $00000029; //支持卡上最低限制金额(押金)
  fiChangeClockId   = $0000002A; //支持修改机号
  fiHaveEmpId       = $0000002B; //支持显示工号
  fiAllowCharge     = $0000002C; //支持补贴充值
  fiReadAllRecord   = $0000002D; //支持一次性采集所有记录(ReadAllRecord)
  MAXSUPPORTINDEX   = $0000002D; //功能索引最大值(需同步更新)

//说明此函数为将来机具规划一个可扩展的空间,
//加强软件和机具之间的联系,有些功能也许现在并不可靠,
//以备将来支持,请用户谅解

//返回值:
// True         : 支持此功能
// False        : 不支持此功能

//      取得函数库DLL版本号
function GetDLLVersion: Double; stdcall; external EASTRIVER_API
//返回值:
// 非零的小数   : 库版本号
// 其它值       : 失败

//      返回机具是依时利第几代产品
function GetClockVersionOrd(hPort: THandle; fastGet: Boolean=True): Integer; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// fastGet      : 是否快速调用(从缓冲区取得), 否则需要读取卡钟(慢)
//返回值:
// 0            : 失败
// 1            : 第一代(ER-210--ER-830)
// 2            : 第二代(ER-880)
// 3            : 第三代(ER-980)

//      返回指定型是依时利第几代产品
function ClockVerOrd(Model: Integer): Integer;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// fastGet      : 是否快速调用(从缓冲区取得), 否则需要读取卡钟(慢)
//返回值:
// 0            : 失败
// 1            : 第一代(ER-210--ER-830)
// 2            : 第二代(ER-880)
// 3            : 第三代(ER-980)

//      取得机具版本字符串
function GetClockVersion(hPort: THandle; Version: PChar): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// Version      : 返回版本缓冲区, 长度至少要大于30个字符
//返回值:
// True         : 成功
// False        : 失败

//      读取设备序列号
function ReadClockSerialNo(hPort: THandle; SerialNo: PChar): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// Version      : 返回序号号缓冲区, 长度至少要大于30个字符
//返回值:
// True         : 成功
// False        : 失败

{版本控制类}

{设备管理普通类}

//      修改机号
function SetClockID(hPort: THandle; new_id: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, ER-880系列需要联机, ER-210--ER-830不需要联机
// new_id       : 新机号,字符显示屏的机型不可以使用A--F的字符作机号, 即只可以使用
//					0x00-0x09, 0x10-0x19, 0x20-0x29, 0x30-0x39, 0x40-0x49
//					0x50-0x59, 0x60-0x69, 0x70-0x79, 0x80-0x89, 0x90-0x99
//返回值:
// True         : 成功
// False        : 失败

//      返回指定端口上的唯一机号
function GetClockID(Port, BaudRate: Integer): Byte; stdcall; external EASTRIVER_API
//参数说明:
// Port         : 端口号
// BaudRate     : 波特率
//返回值:
// True         : 成功
// False        : 失败

//      读取机具标识字符(mark)
function ReadClockMark(hPort: THandle; var Mark: Char): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// Mark         : 返回的机具标识字符
//返回值:
// True         : 成功
// False        : 失败

//      修改机具标识字符(mark)
function SetClockMark(hPort: THandle; Mark: Char): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// Mark         : 新的机具标识字符
//返回值:
// True         : 成功
// False        : 失败
//说明: 数字显示屏的机型只可以使用 0-9 的数字

//		  读取机具上卡号长度变量
function ReadCardLength(hPort: THandle; var dispLen: Integer; var dataLen: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
//		dispLen   : 机具显示卡号位数, 同时黑白名单检查时也以该值为准
//		dataLen   : 机具存储卡号位数, 存储刷卡数据时使用
//返回值:
// True         : 成功
// False        : 失败

//		  修改机具上卡号长度变量
function SetCardLength(hPort: THandle; dispLen: Integer; dataLen: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
//		dispLen   : 新的机具显示卡号位数
//		dataLen   : 新的机具存储卡号位数
//返回值:
// True         : 成功
// False        : 失败
//备注:
// ID机型默认:  dispLen=10, dataLen=10;
// IC机型默认:  dispLen=10, dataLen=16;

//		  读机具当前管理卡号码
function ReadManagerCard(hPort: THandle; CardNo: PChar): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// CardNo       : 返回管理卡号码, 缓冲区需大於20字节长度
//返回值:
// True         : 成功
// False        : 失败

//		  修改机具管理卡(ALL)
function SetManagerCard(hPort: THandle; CardNo: PChar): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// CardNo       :
//返回值:
// True         : 成功
// False        : 失败

//      读取机具工作模式(^2G)
function ReadClockMode(hPort: THandle; var Mode: Integer; var ExtraMode: Integer; var SystemMode: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// mode         : 设备的工作模式
// extraMode    : 设备的扩展工作模式
// systemMode   : 系统工作模式
//    systemMode.7=1 : 考勤机分时段打卡
//		systemMode.7=0 : 考勤机全天打卡
//		systemMode.4=1 : 门禁机开门报警使能
//		systemMode.4=0 : 门禁机开门报警禁止
//    systemMode.6,5,3,2,1,0 : 保留
//对690C2.0版
//    extraMode.5=1 过期卡检测
//    extraMode.7=1 开机卡检测
//返回值:
// True         : 成功
// False        : 失败

//      设置设备工作模式(^2G)
function SetClockMode(hPort: THandle; Mode: Integer; ExtraMode: Integer; SystemMode: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// Mode         : 设备的工作模式(低八位)
//    mode.0=1 : 设备工作於考勤机   mode.0=0 : 无考勤机功能
//		mode.1=1 : 设备工作於门禁机   mode.1=0 : 无门禁机功能
//		mode.2=1 : 设备工作於消费机或加油机  mode.2=0 : 无消费机功能
//		mode.3   : 保留
//		mode.5, mode.4 =00B : 设备无铃声输出
//		mode.5, mode.4 =01B : 设备电铃由外接继电器 1 输出
//		mode.5, mode.4 =10B : 设备电铃由外接继电器 2 输出
//		mode.5, mode.4 =11B : 设备铃声由蜂鸣器输出
//		mode.6=0 : 可以无限制的重复刷卡
//		mode.6=1 : 重复刷卡受 SetRepeatClockerTime 设置的时间限制
//		mode.7=0 : 打卡记录数据存储器满时停止打卡
//		mode.7=1 : 打卡记录数据存储器满时循环覆盖原数据继续打卡
//    对消费机1.05版
//    mode.4=1 :可以查看统计金额  =0不能查看统计金额
// ExtraMode : 设备的扩展工作模式(低八位)
//  	extraMode.0=0 : 考勤机不检查设置的允许考勤卡(白名单)
//		extraMode.0=1 : 考勤机检查设置的允许考勤卡(白名单)
//		extraMode.1=0 : 考勤机不检查设置的黑名单卡
//		extraMode.1=1 : 考勤机检查设置的黑名单卡
//		extraMode.2=0 : 门禁机不检查设置的黑名单卡
//		extraMode.2=1 : 门禁机检查设置的黑名单卡
//		extraMode.3   : 保留
//		extraMode.4=0 : 非允许卡打卡不反应
//		extraMode.4=1 : 非允许卡打卡报警
//		extraMode.7,6,5=000B : 电锁外接继电器1, 报警外接继电器2
//		extraMode.7,6,5=011B : 电锁外接继电器2, 报警外接继电器1
//		extraMode.7,6,5=100B : 正确指示灯外接继电器1, 错误指示灯外接继电器2
//		extraMode.7,6,5=其他 : 保留
//对690C2.0版
//    extraMode.5=1 过期卡检测
//    extraMode.7=1 开机卡检测
//返回值:
// True         : 成功
// False        : 失败

//      扩展读取机具工作模式(890,兼容2G)
function ReadClockModeEx(hPort: THandle; var Mode: Integer; var ExtraMode: Integer; var SystemMode: Integer; var RingMode: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// Mode         : 设备的工作模式(低八位)
// mode.2,1,0
//   000B 机具无界面                    001B 独立考勤机
//   010B 独立门禁机                    011B 门禁/考勤二合一机
//   100B 消费机                        101B 读卡器(ER-980)
//   110B 出门读卡器(ER-980，备用)      111B 备用
// mode.3 ER-980及以后机型支持
//     0B 非允许时段刷卡不记录存贮记录    1B 非允许时段刷卡记录存贮记录
// mode.5,4
//    00B 无铃声输出，不打铃             01B 铃声输出，外接电铃接继电器1
//    10B 铃声输出，外接电铃接继电器2    11B 内置蜂鸣器打铃
// mode.6
//     0B 允许重复刷卡
//     1B 禁止重复刷卡，必须等待设置的重复刷卡间隔时间后才能再次刷卡
// mode.7
//     0B 记录存贮满后停止存贮，刷卡报告存贮器满异常
//     1B 记录存贮满后循环存贮，新记录覆盖最旧记录
// ExtraMode : 设备的扩展工作模式(低八位)
// extraMode.0
//     0B 不进行考勤白名单检查
//     1B 检查刷卡卡号是否在考勤白名单中，不是则报警
// extraMode.1
//     0B 考勤时不进行考勤黑名单检查
//     1B 考勤时检查刷卡卡号是否在考勤黑名单中，是则报警
// extraMode.2
//     0B 门禁通行判断时不进行黑名单检查
//     1B 门禁通行判断时，检查刷卡卡号是否为黑名单，是则报警
// extraMode.3
//     0B 刷卡时不进行组别比较
//     1B IC卡刷卡时检查卡片上的组别信息是否与机具组别匹配，不匹配则报警
// extraMode.4
//     0B 门禁通行时不进行通行名单检查，任何卡都可通行
//     1B 门禁通行时需要检查刷卡卡号是否在门禁通行名单中，不是则报警
// extraMode.7,6,5
//   000B 电锁外接继电器1，报警外接继电器2
//   011B 电锁外接继电器2，报警外接继电器1
//   100B 正确指示灯外接继电器1，错误指示灯外接继电器2
//   101B ER-980控制器启动门禁通行反潜回检查（ER-980及以后机型支持）
//   其它 保留
// systemMode  : 系统工作模式 ER-981、ER-890支持
// systemMode.0
//     0B 不存贮考勤记录                 1B 存贮员工正常考勤记录
// systemMode.1
//     0B 黑名单刷卡时不存贮记录         1B 黑名单刷卡时存贮记录
// systemMode.2
//     0B 非法卡刷卡不存贮记录           1B 非法卡刷卡存贮记录
// systemMode.3
//     0B 通讯时使用客户自定义设置的机号作为设备号用于联机
//     1B 通讯时使用机具产品序列号的最后2位数字作为设备号用于联机
// systemMode.4
//     0B 不进行门打开超时检查
//     1B 门禁开门时，检查门打开是否超时，是则报警
// systemMode.5
//     0B 门禁无法通行时不存贮刷卡信息
//     1B 门禁刷卡后检测到该卡无法通行时存贮记录，以备查验
// systemMode.6
//     0B 门禁通行后不存贮刷卡信息，可用于简单通行控制场合
//     1B 门禁通行后存贮该卡的通行记录，以备查验
// systemMode.7
//     0B 考勤时任何时段都可以刷卡
//     1B 考勤时分时段刷卡，非允许时段刷卡报警
// RingMode : 内置蜂鸣器响铃控制（ER-981、ER-890支持）
// RingMode.0
//     0B 正常刷卡时静音，只显示刷卡信息
//     1B 正常刷卡时响铃发出正常刷卡提示音
// RingMode.1
//     0B 黑名单卡、非法卡刷卡时静音，只显示刷卡错误提示信息
//     1B 黑名单卡、非法卡刷卡时响铃发出刷卡错误提示音
// RingMode.2
//     0B 非允许刷卡时段刷卡静音，只显示相关提示信息
//     1B 非允许刷卡时段刷卡响铃发出相对应的提示音
// RingMode.3
//     0B 刷卡无法通行时静音，只显示无法通行提示信息
//     1B 刷卡无法通行时响铃，发出无法通行提示音
// RingMode.4
//     0B 使用常闭门磁，门关闭时，门磁闭合，开关断路
//     1B 使用常开门磁，门关闭时，门磁闭合，开关短路
// RingMode.5
//     0B 外部输入联动警报为防盗等警报，生效时应能自动关门防盗
//     1B 外部输入联动警报为火灾消防警报，生效时应能自动开门逃生
// RingMode.7,6
//    00B 未使用外接读头                01B	Wiegand通讯格式外接读头
//    10B	ABA通讯格式外接读头           11B ABA通讯格式Wiegand数据格式读头
//返回值:
// True         : 成功
// False        : 失败

//      扩展设置设备工作模式
function SetClockModeEx(hPort: THandle; Mode: Integer; ExtraMode: Integer; SystemMode: Integer; RingMode: Integer): Boolean; stdcall; external EASTRIVER_API
// 参数说明：
//     参照读取设备工作模式

function ReadClockModeStr(hPort: THandle; PMode: PChar): Boolean; stdcall; external EASTRIVER_API
//参数说明：
//1、每个模式中间用逗号隔开，值是二进制,每个位的操作意义见上述函数说明
//2、PMode里如果没有SystemMode, RingMode则不要传入

function SetClockModeStr(hPort: THandle; PMode: PChar): Boolean; stdcall; external EASTRIVER_API
//参数说明：
//1、读出模式后，直接修改二制值，然后用逗号隔开传入
//2、PMode里如果没有一家有Mode, ExtraMode返回值,按顺序应该为SystemMode, RingMode，如果逗号后没有的话表示没有此值或不支持此值

//设置890，980，981参数配置员卡
function SetClockParamManagerCard(hPort: THandle; CardNo: PChar): Boolean; stdcall; external EASTRIVER_API

//实时读锁状态980
function RealReadLockState(hPort: THandle; Clock_ID: Integer; var Opening: Boolean): Boolean; stdcall; external EASTRIVER_API
//hPort:端口句柄，不需要联机  Clock_ID机号 Opening锁状态(True开，False锁)

//启动时显示机具型号设置命令
function SetStartupShowClockModel(hPort: Thandle; Model: PChar): Boolean; stdcall; external EASTRIVER_API
//hPort联机句柄 Model机具型号，如：ER-980

//      在机具屏幕上显示字符串
function ShowClockMessage(hPort: THandle; Msg: PChar; bClearScreen: Boolean; Line: Integer; Duration: Double): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// Msg          : 一行消息字符串,最多8个中文字符或是16个英文字符,自动对中
// bClearScreen : 是否先清屏
// Line         : 显示行号,允许值: 1-4
// Duration     : 持续时间,单位秒
//返回值:
// True         : 成功
// False        : 失败

//      读取机具开机显示内容
function ReadFirstWindowDispString(hPort: THandle; msg: PChar): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// msg          : 返回机具开机显示内容,最多8个中文字或是16个英文字,自动对中
//返回值:
// True         : 成功
// False        : 失败

//      设置机具开机显示内容
function SetFirstWindowDispString(hPort: THandle; msg: PChar): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// msg          : 机具开机显示内容,最多8个中文字或是16个英文字,自动对中
//返回值:
// True         : 成功
// False        : 失败

//      设置机具常态显示内容
function SetClockNormalMessage(hPort: THandle; msg: PChar): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// msg          : 机具常态消息,最多8个中文字或是16个英文字,自动对中
//返回值:
// True         : 成功
// False        : 失败

//      读取机具常态显示内容
function ReadClockNormalMessage(hPort: THandle; msg: PChar): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// msg          : 返回机具常态消息,长度至少要大于20个字符
//返回值:
// True         : 成功
// False        : 失败

//      设置刷卡成功显示内容
function SetClockWelcomeMessage(hPort: THandle; msg: PChar): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// msg          : 刷卡欢迎消息,最多8个中文字或是16个英文字,自动对中
//返回值:
// True         : 成功
// False        : 失败

//      读取刷卡成功显示内容
function ReadClockWelcomeMessage(hPort: THandle; msg: PChar): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// msg          : 返回刷卡欢迎消息,长度至少要大于20个字符
//返回值:
// True         : 成功
// False        : 失败

//      读取设备时间
function ReadClockTime(hPort: THandle; var CurTime: Double): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// CurTime      : 返回机具当前时间, Delphi的DateTime格式,VB的Date格式
//返回值:
// True         : 成功
// False        : 失败

//      修改机具时间
function SetClockTime(hPort: THandle; SetTime: Double): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// SetTime      : 新的时间, Delphi的DateTime格式,VB的Date格式
//返回值:
// True         : 成功
// False        : 失败

//      读取机具时间, 以字符串格式返回
function ReadClockTimeString(hPort: THandle; TimeString: PChar): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// TimeString   : 返回机具当前时间,格式:yyMMddhhnnss(yy年MM月dd日hh时nn分ss秒)
//返回值:
// True         : 成功
// False        : 失败

//      以字符串形式修改机具时间
function SetClockTimeString(hPort: THandle; TimeString: PChar): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// TimeString   : 返回机具当前时间,格式:yyyyMMddhhnnss(^2G+w)(yyyy年MM月dd日hh时nn分ss秒)
//                ER-880以上需要增加一个星期值, w为星期值, 星期天为0, 星期一为1, 星期六为6
//返回值:
// True         : 成功
// False        : 失败

//      设置端口上的所有机具的时间(不联机广播式)
function SetPortAllClockTime(hPort: THandle; SetTime: Double): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 不联机
// SetTime      : 新的时间, Delphi的DateTime格式,VB的Date格式
//返回值:
// True         : 成功
// False        : 失败

//      设置通告消息(3G)
function SetNotification(hPort: THandle; msg: PChar; nDay: Integer; WordWrap: Boolean=True): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// msg          : 消息文本, 可以带回车换行符, 最多允许255*16个英文字符
// nDay         : 表示本通知消息的保留时间, 单位(天)
// WordWrap     : 当每行超出屏幕宽度时是否自动换行,否则将截断显示
//返回值:
// True         : 成功
// False        : 失败

//      机具复位(2G,3G)
function ResetClock(hPort: THandle; Model, Reserved: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// Model        : 机具型号, 0 为自动
// Reserved     : 保留,设为零
//返回值:
// True         : 成功
// False        : 失败
//说明:
//  需要联机和进入设备维护模式
{设备管理普通类}




















{考勤机控制类}
//		  读设备已经存储的考勤记录数
function ReadClockRecordTotal(hPort: THandle; var data: Integer): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// data         : 返回考勤记录数量
//返回值:
// True         : 成功
// False        : 失败

//		  读设备可以存储的最大考勤记录数
function ReadMaxClockRecordTotal(hPort: THandle; var data: Integer): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// data         : 返回设备可以存储的最大考勤记录数
//返回值:
// True         : 成功
// False        : 失败

//		  修改任意卡打卡的时间间隔
function SetCardTimeInterval(hPort: THandle; timeInterval: Double): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// timeInterval : 新的打卡时间间隔, 范围: 0.0 -- 2.25 秒
//返回值:
// True         : 成功
// False        : 失败

//		  读任意卡打卡的时间间隔
function ReadCardTimeInterval(hPort: THandle; var timeInterval: Double): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// timeInterval : 返回打卡时间间隔, 单位秒
//返回值:
// True         : 成功
// False        : 失败

//		  设置全天考勤(任意时间可以刷卡)
function SetWholeTimeClock(hPort: THandle): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
//返回值:
// True         : 成功
// False        : 失败

type
  PClockerTime=^TClockerTime;
  TClockerTime=packed record
    StartTime,
      EndTime: array[0..5] of char;
  end;

//      读取允许考勤刷卡时间段  (最多返回4个时间段)
function ReadClockerTime(hPort: THandle; var Clocks: array of TClockerTime{; ArraySize: Integer}): Integer; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// Clocks       : 返回时间段数组, 最少需要4个单元
// ArraySize    : Delphi不需要,如果是VB或是C++需要传数组大小参数
//返回值:
// 0            : 读取失败
// 1-4          : 刷卡时间段个数

function ReadClockerTimeEx(hPort: THandle; ClockTime: PChar): Integer; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// ClockTime    : 返回时间段字符, 最少需要4*8=32个单元，每8个字符一个时间段，格式：hhnnhhnn
//返回值:
// 0            : 读取失败
// 1-4          : 刷卡时间段个数

//		  设置考勤时间段  (最多可以设置4个考勤时间段)
function SetClockerTime(hPort: THandle; StartTime, EndTime: PChar): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// startTime    : 开始时间, 格式:hhmm, 范围:0000-2400
// EndTime      : 结束时间, 同上
//返回值:
// True         : 成功
// False        : 失败

function SetClockerTimeEx(hPort: THandle; ClockTime: PChar): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// ClockTime    : 所有时间段(最多4个)，每个时间段格式:hhmmhhmm，前4个是开始时间，后4个是结束时间
//返回值:
// True         : 成功
// False        : 失败

//		  设置同一张卡重复刷卡时间间隔
function SetRepeatClockerTime(hPort: THandle; timeLen: Integer): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// timeLen      : 时间间隔, 设置为 1-99 分钟
//返回值:
// True         : 成功
// False        : 失败

//		  读同一张卡重复刷卡时间间隔
function ReadRepeatClockerTime(hPort: THandle; var timeLen: Integer): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// timeLen      : 时间间隔, 设置为 1-99 分钟
//返回值:
// True         : 成功
// False        : 失败

//		  清除设备的所有打铃时间
function ClearRing(hPort: THandle): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
//返回值:
// True         : 成功
// False        : 失败

type
  TRingTime=packed record
    hour, minute, second, RingTimeLen: Integer;
  end;

//      读取设备打铃时间 (最多返回32个打铃)
function ReadRing(hPort: THandle; var RingTimes: array of TRingTime{, ArraySize: Integer}): Integer;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// RingTimes    : 打铃时间数组, 最少需要32个单元
// ArraySize    : Delphi不需要,如果是VB或是C++需要传数组大小参数
//返回值:
// 0            : 失败
// 1-32         : 有效打铃时间数量

//	    设置设备打铃时间 (最多可以设置32次打铃)
function SetRing(hPort: THandle; hour: Integer; minute: Integer; second: Integer; ringTimeLen: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
//		hour, minute, second  :  为打铃的起始时间, 数值分别为 : 0-23, 0-59, 0-59
//		ringTimeLen			  :  为打铃的持续时间, 数值为 1-60 秒
//返回值:
// True         : 成功
// False        : 失败

//	  	读刷卡记录(ALL)
function ReadRecord(hPort: THandle; data: PChar; timeString: PChar; var mark: Char; FirstRecord: Boolean): Boolean; stdcall; external EASTRIVER_API
//本函数为通用读记录函数, 可以用其他特定功能函数代替
//参数说明:
// hPort        : 端口句柄, 需要联机
// data         : 读回的卡号字符串, 缓冲区需大於20字节长度
// timeString   : 读回的14位刷卡时间字符串, 格式为yyyymmddhhmmss, 缓冲区需大於20字节长度
// mark         : 读卡机标识字符.
// FirstRecord  : 是否只读取最顶端记录,否则删除最顶端记录,读取下一条记录
//返回值:
// True         : 成功
// False        : 失败

//      读刷卡记录(^2G)
function ReadStandardRecord(hPort: THandle; Data: PChar; timeString: PChar; var mark: Char; var flag: Integer; var cardTimes: Integer; var cardGroup: Integer): Boolean; stdcall; external EASTRIVER_API
//使用函数前需确保设备卡的存储长度为16
//参数说明:
// hPort        : 端口句柄, 需要联机
// data         : 读回的卡号字符串, 缓冲区需大於20字节长度
// timeString   : 读回的14位刷卡时间字符串, 格式为yyyymmddhhmmss, 缓冲区需大於20字节长度
// mark         : 读卡机标识字符.
// flag         : 存储卡的结果
//    flag = 0   : 表示为正常卡
//    flag.0 = 1 : 表示为非法门禁卡
//    flag.1 = 1 : 表示为非法考勤卡
//    flag.2 = 1 : 表示为黑名单卡
// cardTimes    : 发卡次数, 0-15
// cardGroup    : 卡的组别, 0-255
//返回值:
// True         : 成功
// False        : 失败

//      读取刷卡记录(ALL)
function ReadClockData(hPort: THandle; CardNo: PChar; var SignTime: Double; var mark: Char; FirstRecord: Boolean): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// CardNo       : 返回记录卡号
// SignTime     : 返回记录刷卡时间, Delphi的TDateTime类型,VB的Date类型
// mark         : 返回记录标识, 范围:'0'-'9', 'A'-'F'
// FirstRecord  : 是否只读取最顶端记录,否则删除最顶端记录,读取下一条记录
//返回值:
// True         : 成功
// False        : 失败

//      读取记录(以文本格式1G)
function ReadRecordText(hPort: THandle; data: PChar; FirstRecord: Boolean): Integer; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// data         : 记录文本, 格式根据具体机型而定,一般是:yy年MM月dd日hh时nn分mark标识CardNo卡号
//返回值:
// -1           : 错误
// 1-30         : 成功


//批读记录结构
type
  PICRecord=^TICRecord;
  TICRecord=packed record
    Card: array[0..19] of char; // 卡号字符串
    timeString: array[0..19] of char; // 14位刷卡时间字符串, 格式为yyyymmddhhnnss
    EmpId: array[0..9] of char;
    mark: Integer; // 读卡机标识字符
    flag: Integer; // 存储卡的结果
//            flag = 0   : 表示为正常卡
//            flag.0 = 1 : 表示为非法门禁卡
//            flag.1 = 1 : 表示为非法考勤卡
//            flag.2 = 1 : 表示为黑名单卡
    cardTimes: Integer; // 发卡次数, 0-15
    consume  : Integer;    // 消费额
    balance  : Integer;    // 消费后余额
    pos_sequ: Integer; //消费流水号
    order_id: Integer;//卡重复使用序号
     //订餐扩展
    OrderMonth   : Integer;  //订餐月
    OrderDay     : Integer;  //订餐日
    Dins1 : Integer;   //订餐1
    Dins2 : Integer;   //订餐2
    Month1 : Integer;   //月份1
    Month2 : Integer;  //月份2 
    reserved1: DWORD;             // 983返回的是状态
    reserved2: DWORD;             // 860返回的是班次
    reserved3: array[0..19] of Char; // 保留
    reserved4: array[0..100] of Char; // 机上原始数据
  end;

//      批量读数据(^2G)
function BatchReadRecord(hPort: THandle; var Records: array of TICRecord{; ArraySize: Integer}): Integer; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// Records      : 返回记录数组, 最少需要16个单元
// ArraySize    : Delphi不需要,如果是VB或是C++需要传数组大小参数
//返回值:
// -1           : 错误
// 0            : 记录已经读完
// 1-16         : 正确读取的记录条数

function BatchReadRecordEx(hPort: THandle; Action: Integer; Bytes: Integer; var Count: Integer; Data: PChar): Integer; stdcall; external EASTRIVER_API
//参数说明：
//hPort         : 端口句柄，需要联机
//Action        : 功能，第一次传0，如果读一下批设为1，重读上一批时（读出错或其它原因要求重读时）设为0
//Bytes         : 每条记录的长度,目前为16
//Count         : 返回本次所读取的记录数，如果为0表示没有记录了
//Data          : 返回的数据,格式：卡号+TAB制表符+日期+TAB制表符+状态+TAB制表符+标志
//                状态：983所用
//                标志：and 15 表示打卡结果，即：
//                flag = 0     : 表示正常卡
//                flag.0 = 1   : 非法门禁卡
//                flag.1 = 1   : 表示为非法考勤卡
//                flag.2 = 1   : 黑名单卡
//                flag.12=11   : 非打卡时段存储卡
//                flag.3 = 1   : 未用(置0)
//                flag.45      : 0-3 对应1-4号读卡器
//                flag.6-7     : Mark 标识
//                注：890,880,889标识=flag.4-7
//                    980,981,983标识=flag.6-7  读卡器=flag.4-5
//返回值
//0 :正确
//1 发送命令错误
//2 校验错误
//3 超时错误
//4 读某一帧的记录条数错误

//      读上一次调用BatchReadRecord所读的记录(^3G)
function BatchReadPrevRecord(hPort: THandle; var Records: array of TICRecord{; ArraySize: Integer}): Integer; stdcall; external EASTRIVER_API
//同BatchReadRecord()

//		  删除所有的存储考勤卡记录
function ClearAllReadCard(hPort: THandle): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
//返回值:
// True         : 删除成功
// False        : 删除失败

const
  BytesOfRecord=64; //每记录字节数
  RecordsOfFrame=400; //每帧记录数

type
  //ER-980门禁记录结构
  P980ReadData=^T980ReadData;
  T980ReadData=packed record
    Verify_Error : Boolean;	              //此记录校验是否正确, 由用户处理,
                                          //如果记录校验错误且需继续读返回一条记录则需重置为False
    CardNo       : array[0..19] of char;	//卡号(20个字节,以0结束字符串)
    TimeString   : array[0..19] of char;  //时间(20个字节,以0结束字符串)
    flag         : Integer;               //打卡结果
//          flag = 0     : 表示正常卡
//          flag.0 = 1   : 非法门禁卡
//          flag.1 = 1   : 表示为非法考勤卡
//          flag.2 = 1   : 黑名单卡
//          flag.12=11   : 非打卡时段存储卡
//          flag.3 = 1   : 未用(置0)
//          flag.45      : 0-3 对应1-4号读卡器
//          flag.6-7     : Mark 标识
//          注：890,880,889标识=flag.4-7
//              980,981,983标识=flag.6-7  读卡器=flag.4-5
    Group        : Integer;               //分组
    Times        : Integer;               //发卡次数
    Record_Total : Integer;               //采集数据的总记录数
    Record_Index : Integer;               //当前记录是第几条记录
  end;

  //ER-690消费记录结构(大小和ER-980记录一致)
  P690ReadData=^T690ReadData;
  T690ReadData=packed record
    Verify_Error : Boolean;	              //此记录校验是否正确, 由用户处理,
                                          //如果记录校验错误且需继续读返回一条记录则需重置为False
    CardNo       : array[0..19] of char;	//卡号(20个字节,以0结束字符串)
    TimeString   : array[0..19] of char;  //时间(20个字节,以0结束字符串)
    flag         : Integer;               //打卡结果
//          flag = 0     : 表示正常记录
//          flag = 1     : 补贴充值记录
//          flag = 2     : 出纳机充值记录
//          flag = 3     : 退还了误收金额的消费记录
//          flag = 7     : 表示此记录的卡片在写入金额时由于过早离开了感应区，有可能金额没有正常写入
//          新增标志
//          flag = 5     :透支消费
    Consume      : Integer;                  //消费金额,单位角
    Balance      : Integer;                  //消费后余额,单位角
    Times        : Integer;               //充值次数
    Record_Total : Integer;               //采集数据的总记录数
    Record_Index : Integer;               //当前记录是第几条记录

    //新增成员
    Clock_ver    : Integer;              //消费记录版本号
    Clock_ID     : Integer;              //机号
    POS_Sequ     : Integer;              //POS交易流水号
    Card_Sequ    : Integer;              //卡交易流水号
    Order_ID : Integer;              //卡重用顺序号
    Op_CardNo    : array[0..19] of Char; //POS机操作员卡号
    Date_ver     : array[0..19] of Char; //时间版本号
    OverPwd      : array[0..9] of char; // 超额消费密码
    reserved1    : DWORD;//983返回的是状态
    reserved2    : DWORD;
    reserved3    : array[0..19] of Char; // 保留
    reserved4    : array[0..100] of Char; // 保留
  end;

  PReadData=P690ReadData;//按需要更改声明
  TReadData=T690ReadData;//按需要更改声明

  PArrayReadData=^TArrayReadData;
  TArrayReadData=array[0..RecordsOfFrame] of TReadData;

  //电信记录的原始数据缓冲区
  PTRecordData=^TRecordData;
  TRecordData=array[0..150] of Char;

  //移动记录的原始数据缓冲区
  PTCQRecordData=^TCQRecordData;
  TCQRecordData=array[0..255] of Char;

  //山东新卡格式结构
  P690SDReadData=^T690SDReadData;
  T690SDReadData=packed record
    CardFormatType: Integer;                    //转账卡卡类型，1字节（0x00：2.0格式电信卡；0x01：依时利早期卡；0x02：依时利消费卡）
    WaterCtrlBalace: Double;                    //01-04：水控钱包转帐后余额（小端格式）
    CardTimes     : Integer;                    //05-06：依时利卡格式的充值次数（大端格式,2.0电信卡格式该字段无效）
    CardSN        : array[0..9] of Char;        //卡序列号
    CheckStr      : array[0..3] of Char;        //认证码左两字节
    CardNo       	: array[0..15] of char;	      //卡号(8个字节)
    BusiType			: Integer;        			      //交易类型 （0x01：消费；0x02：充值）
    AppType       : Integer;                    //应用类型 （0x01：全国钱包；0x04：省钱包；0x08：企业钱包）
    AppCardSN     :	array[0..11] of Char;       //SAM卡应用序列号
    POSSequ     	: Integer;          		      //终端交易流水号
    CardType      : Integer;                    //卡种标识
    CityCode			:	array[0..3] of Char;        //城市代码
    CardSequ      : Integer;                    //卡顺序号
    OldAmount     : Double;							        //交易前余额
    BusiAmount    : Double;							        //交易金额
    BusiDate		  : array[0..7] of char;        //交易日期
    BusiTime		  : array[0..5] of char;        //交易时间
    BusiCnt       : Integer;                    //交易次数
    TACCheck			: array[0..7] of Char; 		    //TAC校验
    RecordType    : Integer;                    //记录类型
                                                { 0x00表示正常刷卡记录
                                                  0x13表示执行到交易的步骤3出错（此步骤更新S1B0钱包余额）
                                                  0x14表示执行到交易的步骤4出错（此步骤更新交易明细信息）
                                                  0x15表示执行到交易的步骤5出错（此步骤更新S9B0交易完成）
                                                  0x16表示执行到交易的步骤6出错（此步骤复制S9B0到S9B1）
                                                  0x17表示执行到交易的步骤7出错（此步骤复制S1B0到S1B1）}
    AllowanceType : Integer;                    //记录类型定义
                                                { 0x00表示消费(非补贴)
                                                  0x01表示标准出纳模式
                                                  0x02表示清零出纳模式
                                                  0x03表示自动补贴模式}
    AllowanceVersion : Integer;                 //补贴版本
    Record_Total  : Integer;                    //采集数据的总记录数
    Record_Index  : Integer;                    //当前记录是第几条记录
    Reserved      : TRecordData;//array[0..150] of Char; 		  //原纪录
  end;

  PSDReadData=P690SDReadData;//按需要更改声明
  TSDReadData=T690SDReadData;//按需要更改声明

  //移动新卡格式结构
  P690CQReadData=^T690CQReadData;
  T690CQReadData=packed record
    POSID         : array[0..11] of char;         //终端机号
    POSSequ     	: Integer;          		        //终端交易流水号
    CompanyID     : array[0..11] of Char;         //企业ID
    CommonEmpID   : array[0..39] of Char;         //统一分配员工ID
    CompanyEmpID  : array[0..7] of Char;          //企业员工ID,EESQEQ
    CardAppSequ   :	array[0..15] of Char;         //应用序列号
    BusiCnt       : Integer;                      //卡交易序号
    BusiType			: Integer;        			        //交易类型（0x02：圈存；0x06：脱机消费；0x21：联机消费；0x22：脱机消费撤销；0x23：联机消费撤销；0x24：退费）
    BusiStyle     : Integer;                      //钱包类型（1字节）（0x01：有限余额；0x02：不限余额  0x11：有限次；0x12：不限次）
    OldValue      : Double;							          //交易前余额（或次数）
    BusiValue     : Double;							          //交易金额（或次数）
    BusiDate		  : array[0..7] of char;          //交易日期
    BusiTime		  : array[0..5] of char;          //交易时间
    TACCheck			: array[0..7] of Char; 	        //TAC校验
    AppIndex      : Integer;                      //子应用索引号
    RecordType    : Integer;                      //记录类型 0=成功 其他错误
    CardType      : Integer;                      //卡类型标识(0x00：普通IC卡，0x01：(U)SIM卡）
    WalletBalType : Integer;                      //余额类型（0x00：补贴；0x01：个人）
    OperatorID    : Integer;                      //操作员编码（2字节，BCD，01-98相当于0x0001-0x0098）
    AllowanceType : Integer;                      //移动卡格式：补贴方式（1字节，0x00覆盖, 0x01累加，当钱包余额类型为企业补贴时有效。无效时为0xFF）
                                                  //电信卡格式：记录类型定义 0x00表示消费 0x01表示标准出纳模式 0x02表示清零出纳模式 0x03表示自动补贴模式
    AllowanceVersion : Integer;                   //电信卡格式：自动补贴批次（非自动补贴暂时为0，大端格式，高字节在前[61]，低字节在后[62]）
    AppType       : Integer;                      //电信卡格式：应用类型标识，1 字节（0x01：全国钱包；0x04：省钱包；0x08：企业钱包）
    CardFormatType: Integer;                      //记录版本	电信卡格式：0x01	移动卡格式：0x02
    Record_Total: Integer; //采集数据的总记录数
    Record_Index: Integer; //当前记录是第几条记录
    Reserved      : TCQRecordData;//array[0..255] of Char; 		    //原纪录
  end;

  PCQReadData=P690CQReadData;//按需要更改声明
  TCQReadData=T690CQReadData;//按需要更改声明

//      数据处理回调函数
TDataProcess = function(lpData: Pointer; lpReadData: PReadData): Boolean;stdcall;
// lpData       : 自定义变量, 对应ReadAllRecord()的第二个参数
// lpReadData   : 记录结构指针
//返回值:
//如果需要返回下一条记录则返回True, 如果需要中止数据读取可返回False,

TTimeLapse = procedure(lpData: Pointer; microsecond: Integer);stdcall;
//延时回调
//参数说明:
// lpData       : 自定义变量, 对应ReadAllRecord()的第二个参数
// microsecond  : 如果使用此函数则应在microsecond 微秒内按时返回
//无返回值

//      数据处理回调函数
TSDDataProcess = function(lpData: Pointer; lpReadData: Pointer): Boolean;stdcall;
// lpData       : 自定义变量, 对应ReadAllRecord()的第二个参数
// lpReadData   : 记录结构指针
//返回值:
//如果需要返回下一条记录则返回True, 如果需要中止数据读取可返回False,

TSDTimeLapse = procedure(lpData: Pointer; microsecond: Integer);stdcall;
//延时回调
//参数说明:
// lpData       : 自定义变量, 对应ReadAllRecord()的第二个参数
// microsecond  : 如果使用此函数则应在microsecond 微秒内按时返回
//无返回值

//      按帧(一帧400条)读取机具所有记录
function ReadAllRecord(hPort: THandle; lpData: Pointer; DataProcess: TDataProcess; Wait:TTimeLapse=nil): Integer;stdcall; external EASTRIVER_API
//读所有记录调用
//参数说明:
// lpData       : 指向欲传入回调函数DataProcess()的参数指针作为DataProcess()的第一个参数如果不用可设为NULL
// DataProcess  : 指向结构 TReadData 的指针, 数据块包含一条记录
// Wait         : 延时回调过程指针, 不用可设为NULL
//返回值:
// 0            : 机具内记录已空(无记录)
// >0           : 成功读取记录数
// -1,-2        : 串行通信错误
// -3           : 命令字异或校验错误
// -4           : 用户中止或接收未完成
// -5           : 不支持的命令,需要改用其它命令采集数据
// -8,-9        : 资源分配错误

//      按帧(一帧400条)读取机具所有记录
function SDReadAllRecord(hPort: THandle; lpData: Pointer; DataProcess: TSDDataProcess; Wait: TSDTimeLapse=nil): Integer;stdcall; external EASTRIVER_API
//读所有记录调用
//参数说明:
// lpData       : 指向欲传入回调函数DataProcess()的参数指针作为DataProcess()的第一个参数如果不用可设为NULL
// DataProcess  : 指向结构 TReadData 的指针, 数据块包含一条记录
// Wait         : 延时回调过程指针, 不用可设为NULL
//返回值:
// 0            : 机具内记录已空(无记录)
// >0           : 成功读取记录数
// -1,-2        : 串行通信错误
// -3           : 命令字异或校验错误
// -4           : 用户中止或接收未完成
// -5           : 不支持的命令,需要改用其它命令采集数据
// -8,-9        : 资源分配错误

//      按帧(一帧400条)读取机具所有记录

type
  TReadProgressProc=function(Position, AMax: Integer; lpReadData: PReadData; reserved: Integer): Boolean; stdcall;

//      一次性读取所有记录到指定的文件
function ReadAllRecordAsFile(hPort: THandle; clock_id: Integer; FileName: PChar; hWndParent: HWND; bShowProg: Boolean; Progress: TReadProgressProc): Integer; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// clock_id     : 机号
// FileName     : 指定文本文件名, 如果不存在, 将会自动创建,
//                如果存在, 新收的记录将会追加在文件末尾
//                如果文件名为空,则不保存文件
// 每条记录一行,格式如下:
// 卡号<TAB>日期时间<TAB>机号<TAB>记录标识<TAB>状态(FLAG)<TAB>门号
// 其中<TAB>为制表符(ASCII值:#9)
// hWndParent   : 进程对话框的父窗口句柄,可设为0
// bShowProg    : 是否显示接收进程对话框
// Progress     : 进程回调,不用可以设为NULL
//返回值:
// 同 ReadAllRecord

{考勤机控制类}
















{黑白名单类}
//      批量读取黑白名单进程回调
type TProgressProc=function(TypeId, PageNo, Percent: Integer): Boolean; stdcall;
//参数说明:
// TypeId       : 名单类型, 0: 门禁通行卡, 1:白名单, 2: 黑名单
// PageNo       : 页号
// Percent      : 已完成百分比, 如 80=80%
//返回值:
// True         : 成功
// False        : 失败

//		  读机具已经下载的允许考勤卡(白名单)数量
function ReadSavedAllowedClockerCardNumber(hPort: THandle; var data: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// data         : 返回已经下载的白名单数量
//返回值:
// True         : 成功
// False        : 失败

//		  读机具已经下载的黑名单卡数量
function ReadSavedBlackCardNumber(hPort: THandle; var data: Integer): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// data         : 返回已经下载的黑名单数量
//返回值:
// True         : 成功
// False        : 失败

//		  读机具已经下载的门禁通行卡数量
function ReadSavedLockerPassCardNumber(hPort: THandle; var data: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// data         : 返回已经下载的门禁通行卡数量
//返回值:
// True         : 成功
// False        : 失败

//广播下载卡名单
function BroadCastAllCard(hPort, WinHnd:THandle; Kind: Integer; Action: Integer;Card,EmpID,EmpName,PassTime:PChar; var Count: Integer; Delay:Integer=80): Boolean; stdcall; external EASTRIVER_API
//功能：增加所有的卡到列表
//参数：hPort 联机的端口句柄
//      WinHand 已下载总数发送消息的窗口句柄 WM_USER+$100;wParam即是总数
//      Kind:=0清空各种名单，在添加名单之前请先用此参数进行调用一次，否则会造成重复
//           =1门禁白名单，除了EmpName为空外，通行时间则是所有的，如0000013008301030 表示0点至1点30及8点30至10点30两个时间段
//           =2考勤白名单，其余要输入，但PassTime可为空
//           =3机具黑名单, 除了Card输入外，其余为空
//      Action=0表示增加名单列表
//            =1表示开始单机分页下载
//            =2表示开始广播下载方式
//      CardStyle=1 ID卡
//               =2 IC卡
//       Count 表示返回成功下载的卡个数
//获取总数的示例
//{首先声明一个消息方法映射消息：}
//procedure WMGETCOUNT(var Msg: TMessage); message WM_USER+$100;
//{实现该消息方法：}
//procedure TForm1.WMCopydata(var Msg: TMessage);
//var Count: Integer;
//begin
//    Count := Msg.wParam;
//end;

//读状态指示灯的时间
function SetStateLampTime(hPort: THandle; GE: Integer; Value: Integer): Boolean; stdcall; external EASTRIVER_API
//参数 hPort联机句柄
//     GE=1正确指示灯 =2错误指示灯 =3开门超时时间
//     Value 要设置的时间 0.2秒为单位，范围0--99

//读取状态指示灯的时间
function ReadStateLampTime(hPort: THandle; GE: Integer; var Value: Integer): Boolean; stdcall; external EASTRIVER_API
//参数 同上

//初始化890机具
function Init890(hPort:THandle; Kind:Integer): Boolean; stdcall; external EASTRIVER_API
//参数 hPort 联机句柄
//     kind=1清除机具所有设置的时间段信息
//         =2使用默认工作参数配置系统的工作状态
//         =3将机具初始化成出厂状态


//		  设置设备的允许考勤卡(白名单卡带6个字符工号或姓名)
function SetAllowedCard(hPort: THandle; card, empid, EmpName: PChar): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// card         : 卡号
// empid        : 工号, ID机器使用, IC机器不使用, 最长允许6个数字字符
// EmpName      : 姓名, 格式GB码, 最长允许6个英文字符
//返回值:
// True         : 成功
// False        : 失败

//		  删除设备的允许考勤卡(白名单卡)
function DeleteAllowedCard(hPort: THandle; card: PChar): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// card         : 卡号
//返回值:
// True         : 成功
// False        : 失败

//		  删除设备的所有允许考勤卡(白名单卡)
function DeleteAllAllowedCard(hPort: THandle): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
//返回值:
// True         : 成功
// False        : 失败

//		  设置设备的黑名单卡
function SetBlackCard(hPort: THandle; card: PChar): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// card         : 卡号
//返回值:
// True         : 成功
// False        : 失败

//		  删除设备的黑名单卡
function DeleteBlackCard(hPort: THandle; card: PChar): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// card         : 卡号
//返回值:
// True         : 成功
// False        : 失败

//		  删除设备的所有黑名单卡
function DeleteAllBlackCard(hPort: THandle): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
//返回值:
// True         : 成功
// False        : 失败

//		  设置门禁机设备的通行卡
function SetDoorPassCard(hPort: THandle; beginPass: PChar; endPass: PChar; card: PChar; EmpId: PChar): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// BeginPass    : 通行开始时间
// endPass      : 通行结束时间
// card         : 卡号
// empId        : 工号,ID机器使用,最长允许6个数字字符
//返回值:
// True         : 成功
// False        : 失败
//说明:
//设置多个通行时间需使用同一个卡号调用多次

//		  删除门禁机设备的通行卡
function DeleteDoorPassCard(hPort: THandle; card: PChar): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// card         : 卡号
//返回值:
// True         : 成功
// False        : 失败

//		  删除门禁机设备的所有通行卡
function DeleteAllDoorPassCard(hPort: THandle): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
//返回值:
// True         : 成功
// False        : 失败

//附加批量读写设备名单函数(^2G)
type
  PDownloadPageStruct=^TDownLoadPageStruct;
  TDownLoadPageStruct=packed record
    iPage: Integer; //页号
    izData: array[0..255] of Byte; //一页数据
    Next: PDownLoadPageStruct; //下一页的指针
  end;

  PDownLoadPageStructIndex=^TDownLoadPageStructIndex;
  TDownLoadPageStructIndex=packed record
    Index: array[0..255] of PDownLoadPageStruct; //计算机内索引连表
    indexPage: array[0..255] of Integer; //地址索引存放处
    iCardNumber: Integer; //存放的卡总数量
  end;

  PDownloadCardStruct=^TDownloadCardStruct;
  TDownloadCardStruct=packed record
    CardNo: array[0..15] of char; //16位卡号
    EmpId: array[0..10] of Char; //6位字母工号或是姓名考勤白名单
    case Integer of
      0: (Periods: array[0..11] of char);
        //6位字节通行时段(以30分钟为单位一天)门禁通行卡
      1: (EmpName: array[0..11] of char); //黑白名单时的员工姓名
  end;

//      批读门禁机通行卡函数
function BatchReadDoorPassCard(hPort: THandle; var CardList: array of TDownloadCardStruct{; ArraySize: Intger}; var Number: Integer; CallBack: TProgressProc): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// CardList     : 返回通行卡结构数组
// ArraySize    : Delphi不需要,如果是VB或是C++需要传数组大小参数
// Number       : 传入数组大小,最大允许返回大小,实际返回名单数量
// CallBack     : 进程回调, 不用可置为NULL(0)
//返回值:
// True         : 成功
// False        : 失败

//      批读白名单函数
function BatchReadAllowedCard(hPort: THandle; var CardList: array of TDownloadCardStruct{; ArraySize: Intger}; var Number: Integer; CallBack: TProgressProc): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// CardList     : 返回白名单结构数组
// ArraySize    : Delphi不需要,如果是VB或是C++需要传数组大小参数
// Number       : 传入数组大小,最大允许返回大小,实际返回名单数量
// CallBack     : 进程回调, 不用可置为NULL(0)
//返回值:
// True         : 成功
// False        : 失败

//      批读黑名单函数
function BatchReadBlackCard(hPort: THandle; var CardList: array of TDownloadCardStruct{; ArraySize: Intger}; var Number: Integer; CallBack: TProgressProc): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// CardList     : 返回黑名单结构数组
// ArraySize    : Delphi不需要,如果是VB或是C++需要传数组大小参数
// Number       : 传入数组大小,最大允许返回大小,实际返回名单数量
// CallBack     : 进程回调, 不用可置为NULL(0)
//返回值:
// True         : 成功
// False        : 失败

type
  TDoorTimePeriod=packed record //   局部结构表示一个时间点
    TimeHour: Integer; //	 小时[0..23]
    TimeMinute: Integer; //	 分钟[0..59]
  end;

  PDoorTimePeriods=^TDoorTimePeriods;
  TDoorTimePeriods=packed record //	 门禁机时段结构
    StartTime: TDoorTimePeriod; //   时段的开始时间
    EndTime: TDoorTimePeriod;   //	 时段的结束时间
    Right: Integer;             //   本时段的权限，依不同功能而不同
  end;


//		  设置超级用户密码(3G)
function SetSuperUserPwd(hPort: THandle; Number: Integer; Pwd: PChar; Right: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// Number       : 超级用户编号, 从1到16 最多16个超级用户
// Pwd          : 密须是6位数数字, 不足6位请在前面补零
// Right        : 低4位代表4个门的权限
//    Right.0=1 代表可开1号门
//    Right.1=1 代表可开2号门
//    Right.2=1 代表可开3号门
//    Right.3=1 代表可开4号门
//返回值:
// True         : 成功
// False        : 失败

//      设置门禁机时段
function SetDoorGuardPeriods(hPort: THandle; Fun: Byte; ts: array of TDoorTimePeriods; Count:Integer; week: Byte=0): Boolean;stdcall; external EASTRIVER_API
// Fun:        时段类型(0-6) 代表(出入,密码,报警生效,按钮生效,电锁常开,门磁报警,假日开门)时段
// ts :        时间段内容
// Count:      时段个数
// Week:       星期(1-7)代表周日--周一--周六

//      设置出入时间段（开门时间段）及权限 每天可设置四个时段
function SetInOutRight(hPort: THandle; Week_Day: Integer; var ts: array of TDoorTimePeriods; Count: Integer=4): Boolean; stdcall; external EASTRIVER_API
// hPort    ： 串口句柄。
// Week_Day ： 每周七天中的一天，1 星期日，2 星期一，...，7 星期六，其它值非法。
// ts[]     ： 出入时间段及权限可设置[0..4]个时段，Right 权限为0x00--0xFF(00--255)，数字越大权限越大。
// ArraySize： 此值不使用可设为任意值。
// Count    ： ts[]中设置的时段个数[0..4]。

//      设置密码生效时段，每天可设置四个时段
function SetCipherSlice(hPort: THandle; var ts: array of TDoorTimePeriods; Count: Integer=4): Boolean; stdcall; external EASTRIVER_API
// hPort    ： 串口句柄。
// ts[]     ： 密码时间段，可设置[0..4]个时段，Right 权限bit为1表示选中：
      //Right.0表示一号读头、Right.1表示二号读头、Right.2表示三号读头、Right.3表示四号读头。
// ArraySize： 此值不使用可设为任意值。
// Count    ： ts[]中设置的时段个数[0..4]。

//      设置报警生效时段，每天可设置四个时段
function SetAlertSlice(hPort: THandle; var ts: array of TDoorTimePeriods; Count: Integer=4): Boolean; stdcall; external EASTRIVER_API
// hPort    ： 串口句柄。
// ts[]     ： 报警时间段，可设置[0..4]个时段，Right 权限bit为1表示选中：
             //Right.0表示一号读头、Right.1表示二号读头、Right.2表示三号读头、Right.3表示四号读头。
// ArraySize： 此值不使用可设为任意值。
// Count    ： ts[]中设置的时段个数[0..4]。

//      设置按钮生效时段，每天可设置四个时段
function SetButtonSlice(hPort: THandle; var ts: array of TDoorTimePeriods; Count: Integer=4): Boolean; stdcall; external EASTRIVER_API
// hPort    ： 串口句柄。
// ts[]     ： 按钮生效时间段，可设置[0..4]个时段，Right 权限bit为1表示选中：
         //Right.0表示一号读头、Right.1表示二号读头、Right.2表示三号读头、Right.3表示四号读头。
// ArraySize： 此值不使用可设为任意值。
// Count    ： ts[]中设置的时段个数[0..4]。

//      设置电锁常开时段，每天可设置四个时段
function SetConstOpenSlice(hPort: THandle; var ts: array of TDoorTimePeriods; Count: Integer=4): Boolean; stdcall; external EASTRIVER_API
// hPort    ： 串口句柄。
// ts[]     ： 电锁常开时间段，可设置[0..4]个时段，Right 权限bit为1表示选中：
       //Right.0表示一号读头、Right.1表示二号读头、Right.2表示三号读头、Right.3表示四号读头。
// ArraySize： 此值不使用可设为任意值。
// Count    ： ts[]中设置的时段个数[0..4]。

//      设置门磁处于常开报警时段，每天可设置四个时段
function SetCOAlertSlice(hPort: THandle; var ts: array of TDoorTimePeriods; Count: Integer=4): Boolean; stdcall; external EASTRIVER_API
// hPort    ： 串口句柄。
// ts[]     ： 常开报警时间段，可设置[0..4]个时段，Right 权限低四bit，某个bit为1表示某个读头选中：
       //Right.0表示一号读头、Right.1表示二号读头、Right.2表示三号读头、Right.3表示四号读头。
// ArraySize： 此值不使用可设为任意值。
// Count    ： ts[]中设置的时段个数[0..4]。

//      设定节假日的开门时段和开门权限等级
function SetHolidaySlice(hPort: THandle; var ts: array of TDoorTimePeriods; Count: Integer=4): Boolean; stdcall; external EASTRIVER_API
// hPort    ： 串口句柄。
// ts[]     ： 节假日开门时段，可设置[0..4]个时段，Right 权限bit为1表示选中：
       //Right.0表示一号读头、Right.1表示二号读头、Right.2表示三号读头、Right.3表示四号读头。
// ArraySize： 此值不使用可设为任意值。
// Count    ： ts[]中设置的时段个数[0..4]。

//      设置超级用户密码开门时段
function SetSuperUserPwdSlice(hPort: THandle; var ts: array of TDoorTimePeriods; Count: Integer=4): Boolean; stdcall; external EASTRIVER_API
// hPort    ： 串口句柄。
// ts[]     ： 节假日开门时段，可设置[0..4]个时段，Right 权限bit为1表示选中：
       //Right.0表示一号读头、Right.1表示二号读头、Right.2表示三号读头、Right.3表示四号读头。
// ArraySize： 此值不使用可设为任意值。
// Count    ： ts[]中设置的时段个数[0..4]。

//      节假日的设定
function SetHoliday(hPort: THandle; const DayString: PChar): Boolean; stdcall; external EASTRIVER_API
// hPort    ：串口句柄
// DayString：一个表示多个日期的字符串。其格式为："日期0,日期1,日期2,日期3,... ..." 或者 "日期0;日期1;日期2;日期3;... ..."
// DayString 最多可以包含20个日期，每一个日期表示这一天为节假日
// 日期的格式为："mmdd" 即两个字符的月+两个字符的日，mm为月 dd为日。如4月15日为："0415"
// 例如：如果设定5月1日,10月1日和12月25日为节假日，DayString="0501，1001，1225"


//扩充名单命令中Style参数的取值 只有DOOR_880STYLE 可以与前面五个值中的某一个通过或操作'|'联合在一起
const
  DOOR_880STYLE = $80;  //设置门禁名单是否使用880定义的风格 1-是，0-否

  //新型门禁机设定带权限和密码的门禁通行卡
function SetDoorPassCardDE(hPort: THandle; Style: Byte; Card: PChar; Code: PChar; Right: Integer=0; BeginPass: PChar=nil; EndPass: PChar=nil; EmpId: PChar=nil): Boolean; stdcall; external EASTRIVER_API
// hPort    ：串口句柄
// Card     ：门禁通行卡卡号
// Code     ：四个字节密码  每个字节表示一个16进制数字即"0--9,A--F" (必须为四个字节，不能省略)
// Right    ：表示开门权限和电锁控制（允许值0x00-0xFF)。高半字节(Right.H)电锁控制，低半字节(Right.L)表示权限
// Right.L  ：四个bit表示四个电锁，某位置1表示本张卡片能开相应的锁。bit0 表示一号电锁，bit1为二号电锁，...
// Right.H  ：四位可表示0x00-0x0F 16个数字表示本张卡片的权限，这个数字要与设定的开门时段的权限值进行比较
//          ：如果本张卡片的权限值高于相应时间段的权限值则表示本张卡片在这个时间段可以开门。
//BeginPass,EndPass,EmpId：参见 SetDoorPassCard参数，当Style参数第八位为1时（即Style|=DOOR_880STYLE）这三个参数必须非空，否则可为空（参数忽略）
//如果没有使用DOOR_880STYLE参数则Code参数不能为空
//Style参数的使用参阅SetAllowedCardDE

//      设置允许考勤卡
function SetAllowedCardDE(hPort: THANDLE; Style: Byte; card: PChar; emp_id: PChar; emp_name: PChar=nil): Boolean; stdcall; external EASTRIVER_API
//功能参数参考SetAllowedCard.
//Style:可以取以下值中的一个CARD_AUTO，IC_CONVERT，IC_NOCONVERT，ID_CONVERT，ID_NOCONVERT,
//Style=CARD_AUTO 则这个函数的功能与参数与SetAllowedCard同
//如果卡号为ID卡并且用户已经变换成16为卡号结构（即'EF0000000xxxxxxx')，或者对于880D要使用工号，则Style应设为ID_NOCONVERT
//如果card没有变换成16为卡号结构，用户希望在下载时变换成16为卡号，则可以使用ID_CONVERT参数（工号忽略）,如果不希望变换用ID_NOCONVERT
//IC卡相同，如果card为16位标准卡号，可以使用参数IC_NOCONVERT强制在下载时不要对卡号作变换。若card没有变换成16位标准卡号
//也可以使用此参数强制不要做变换，或使用IC_CONVERT强制在下载前变换成标准卡号。以下同... ...

//      删除允许考勤卡
function DeleteAllowedCardDE(hPort: THANDLE; Style: Byte; card: PChar): Boolean;stdcall; external EASTRIVER_API
//功能参数参考DeleteAllowedCard
//Style:可以取以下值中的一个CARD_AUTO，IC_CONVERT，IC_NOCONVERT，ID_CONVERT，ID_NOCONVERT,
//Style=CARD_AUTO 则这个函数的功能与参数与DeleteAllowedCard同
//Style参数的使用参阅SetAllowedCardDE

//      设置黑名单
function SetBlackCardDE(hPort: THANDLE; Style: Byte; card: PChar): Boolean;stdcall; external EASTRIVER_API
//功能参数参考SetBlackCard
//Style:可以取以下值中的一个CARD_AUTO，IC_CONVERT，IC_NOCONVERT，ID_CONVERT，ID_NOCONVERT,
//Style=CARD_AUTO 则这个函数的功能与参数与SetBlackAllowedCard同
//Style参数的使用参阅SetAllowedCardDE

//      删除黑名单卡
function DeleteBlackCardDE(hPort: THANDLE; Style: Byte; card: PChar): Boolean;stdcall; external EASTRIVER_API
//功能参数参考DeleteBlackCard
//Style:可以取以下值中的一个CARD_AUTO，IC_CONVERT，IC_NOCONVERT，ID_CONVERT，ID_NOCONVERT,
//Style=CARD_AUTO 则这个函数的功能与参数与DeleteBlackAllowedCard同
//Style参数的使用参阅SetAllowedCardDE

//      删除门禁通行卡
function DeleteDoorPassCardDE(hPort: THANDLE; Style: Byte; card: PChar): Boolean; stdcall; external EASTRIVER_API
//功能参数参考DeleteDoorPassCard
//Style:可以取以下值中的一个CARD_AUTO，IC_CONVERT，IC_NOCONVERT，ID_CONVERT，ID_NOCONVERT,
//Style=CARD_AUTO 则这个函数的功能与参数与DeleteDoorPassCard同
//Style参数的使用参阅SetAllowedCardDE

{黑白名单类}


{消费机类}

//      读售饭机金额总和
function ReadClockMoneySum(hPort: THandle; var MoneySum: Integer): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// MoneySum     : 最大5位数的金额, 以角为单位
//返回值:
// True         : 成功
// False        : 失败
//兼容机具->ER-680

//      清除售饭机金额总和
function ClearClockMoneySum(hPort: THandle): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
//返回值:
// True         : 成功
// False        : 失败
//兼容机具->ER-680

//      下载消费的编号价格表(690)
function SetPriceList(hPort: THandle; Num: Integer; Value: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// Num          : 消费价格表编号, 范围1-9, 对应键盘1-9键
// Value        : 单价, 单位角, 范围0-65535
//返回值:
// True         : 成功
// False        : 失败

//      读取消费的编号价格表(690)
function ReadPriceList(hPort: THandle; Num: Integer;var Value: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// Num          : 消费价格表编号, 范围0-9, 对应键盘0-9键
// Value        : 返回单价, 单位角, 范围0-65535
//返回值:
// True         : 成功
// False        : 失败

//      设置定值消费金额(690)
function SetFixPrice(hPort: THandle; Value: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明
// hPort        : 端口句柄, 需要联机
// Value        : 定值消费额, 单位角, 范围0-65535,为零时取消定值消费
//返回值:
// True         : 成功
// False        : 失败

//      读取定值消费金额(690)
function ReadFixPrice(hPort: THandle;var Value: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明
// hPort        : 端口句柄, 需要联机
// Value        : 返回定值消费额, 单位角, 范围0-65535
//返回值:
// True         : 成功
// False        : 失败

//      设置日最大消费限额(690)
function SetDayMaxExpenditure(hPort: THandle; Value: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明
// hPort        : 端口句柄, 需要联机
// Value        : 日最大消费额, 单位角, 范围0-65535, 为零时表示不限制
//返回值:
// True         : 成功
// False        : 失败

//      读取日最大消费限额(690)
function ReadDayMaxExpenditure(hPort: THandle;var Value: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明
// hPort        : 端口句柄, 需要联机
// Value        : 日最大消费额, 单位角, 范围0-65535
//返回值:
// True         : 成功
// False        : 失败

//      设置日最大消费次数限制(690)
function SetDayMaxConsumeTimes(hPort: THandle; Value: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明
// hPort        : 端口句柄, 需要联机
// Value        : 日最大消费次数, 范围0-225, 为零时表示不限制
//返回值:
// True         : 成功
// False        : 失败

//      读取日最大消费限额(690)
function ReadDayMaxConsumeTimes(hPort: THandle;var Value: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明
// hPort        : 端口句柄, 需要联机
// Value        : 返回日最大消费次数, 范围0-255, 为零时表示不限制
//返回值:
// True         : 成功
// False        : 失败

//      设置卡上最低限制金额(690)(押金)
function SetCardForegift(hPort: THandle; Value: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明
// hPort        : 端口句柄, 需要联机
// Value        : 卡上最低限制金额, 单位角, 范围:0-65535, 为零时表示不限制
//返回值:
// True         : 成功
// False        : 失败


//      读取卡上最低限制金额(690)(押金)
function ReadCardForegift(hPort: THandle;var Value: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明
// hPort        : 端口句柄, 需要联机
// Value        : 返回卡上最低限制金额, 单位角, 范围:0-65535, 为零时表示不限制
//返回值:
// True         : 成功
// False        : 失败

//      下载补贴充值记录(690C补贴机)
function SetAllowCharge(hPort: THandle; Style: Byte; CardNo: PChar; Value: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明
// hPort        : 端口句柄, 需要联机
// Style        : 卡号格式, 请参阅SetAllowedCardDE
// CardNo       : 充值卡号,5-7位字符串
// 说明：如果是2.0版下载补贴时，请在卡号后面加年月日(yymmdd)作为补贴版本号,如000001号卡，补贴版本号为051129，即CardNo为000001051129
//       1.0版不需要版本号
// Value        : 补贴充值金额, 单位角, 范围:0-65535
//返回值:
// True         : 成功
// False        : 失败
//说明:
// 补贴充值记录下载到专用补贴机上,当相应的IC卡刷卡时,将金额充入该IC卡,
// 并生成一条充值记录,卡上的充值次数自动加1,软件收回记录Flag=01判断为补贴
// 充值记录和消费刷卡记录(Flag=00)区别
// 如果是2.0版数据采集回来后有一个补贴版本号

{消费机类}















{实时控制类}
//      请求Windows消息方式事件通知窗口程序
function ERAsyncSelect(hPort, hWnd: THandle; wMsg: ulong; EventId: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄
// hWnd         : 接收消息通知的窗口句柄, 如果为零则取消通知
// wMsg         : 自定义消息号, 最好大于WM_USER的值
// EventId      : 通知事件类型, 可为下列值
const
  FED_READ       = $01; // 准备接收数据
  FED_WRITE      = $02; // 准备发送数据
  FD_ACCEPT      = $03; // 接收传入的联接
  FED_CONNECT    = $04; // 联机成功
  FED_DISCONNECT = $05; // 断开联机
  FED_CLOSE      = $06; // 端口关闭
  FED_NOTIFY     = $07; // 其它通知, 如更新进程条等
  FED_MAX        = $0F; // 最大事件ID
//返回值:
// True         : 成功
// False        : 失败

//      读取最新刷卡卡号
function ReadLastCard(hPort: THandle; CardNo: PChar): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// CardNo       : 返回卡号缓冲区,需要20个字符空间
//返回值:
// True         : 成功
// False        : 失败

//      读取键盘按键
function ReadKeyboardPressKey(hPort: THandle; var key: char): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// key          : 返回读得的键盘按键值
//返回值:
// True         : 成功
// False        : 失败

//      读取门锁状态
function ReadDoorState(hPort: THandle; var Opening: Boolean): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// Opening      : 返回门锁是否是打开状态
//返回值:
// True         : 成功
// False        : 失败

//      软件控制正在联机的门禁机开门
function SetDoorOpen(hPort: THandle): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
//返回值:
// True         : 成功
// False        : 失败

//      控制设备状态
function SetClockState(hPort: THandle; State: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// state        : 状态码, 以二进制位控制
//		state.1--state.0 = 10B  :  设备正常灯亮, 蜂鸣器响一声
//						 = 11B  :  设备错误灯亮, 蜂鸣器响三声
//						 = 00B or 01B  :  无作用
//		state.2 = 1  :  控制设备门锁开锁 (不自动关闭)
//				= 0  :  控制设备门锁关闭
//		state.3 = 1  :  控制设备报警器报警 (不自动停止)
//				= 0  :  控制设备报警器停止报警
//		state.6 = 1  :  state.5, state.4 分别为8芯插座的 Data, Clock脚状态.
//						该控制只可以使用於IC机型, 对ID机型禁止使用
//		state.6 = 0  :  state.5, state.4 无作用
//		其他位保留, 请置0
//返回值:
// True         : 成功
// False        : 失败

//      控制报警器状态
function SetAlarm(hPort: THandle; Alarm: Boolean): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// Alarm        : 希望设置的报警器状态
//    Alarm     = True  : 报警器报警
//    Alarm     = False : 报警器关
//返回值:
// True         : 成功
// False        : 失败

//设置机具卡号处理方式
function SetProcessCardStyle(hPort: THandle; Style: PChar): Boolean; stdcall; external EASTRIVER_API
//参数
//  hPort: 联机句柄
//  Style: 设置机具使用卡片格式=本机读头+外接读头（十六进制）：
//         本机读取卡片数据解析方式，系统支持的有效卡号数据格式如下：
//         0x00  机具未安装读头模块。
//         0x01  读取IC卡序列号当作ID卡使用。
//         0x02  读取IC卡上写入的数据进行解析使用。
//         0x03  读取IC卡序列号进行授权检测，卡上数据为工号。
//         0x08  EM4001 ID卡，十位BCD卡号。
//         0x09  EM4001 ID卡，八位BCD卡号。
//         0x0A  EM4001 ID卡，五位BCD卡号。
//         0x0B  EM4001 ID卡，八位十六进制卡号。
//         0x0C  ABA通讯格式HID卡，五位BCD卡号。
//         0x0D  ABA通讯格式HID卡，十位BCD卡号。
//         其他保留。
//         机具外接读头读取卡片数据解析方式，含义如下：
//         0x00机具无外接读头。
//         其他同机具本机读头读取卡片数据解析方式。

//读取机具卡号处理方式
function ReadProcessCardStyle(hPort: THandle; Style: PChar): Boolean; stdcall; external EASTRIVER_API

//新型门禁机ER-980实时控制指令
type
  PCardInfo=^TCardInfo;
  TCardInfo=packed record
    CardNo: array[0..17] of char; //存储卡号
    IsIDCard: Boolean; //如果时ID卡为true，否则为false是IC卡
    NoCard: Boolean; //如果为true，则没有卡片在感应区，此结构其他数据无效
    Reader: Integer; //范围从1-4指几号读头
    Flag:   Integer; //打卡结果
    Mark:   Integer; //打卡标志
  end;

//      获取读卡器感应区上的卡片代码(^3G)
function GetCardOnReader(hPort: THandle; clock_id: Integer; Card: PCardInfo): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 不需要联机
// clock_id     : 机号, 允许值:0-255
// Card         : TCardInfo 指针，存储返回结果
//返回值:
// True         : 成功
// False        : 失败

type
  PRealCardInfo=^TRealCardInfo;
  TRealCardInfo=packed record
    Size: Integer;      //此结构大小
    CardNo: array[0..17] of char; //存储卡号
    IsIDCard: Boolean; //如果时ID卡为true，否则为false是IC卡
    NoCard: Boolean; //如果为true，则没有卡片在感应区，此结构其他数据无效
    Reader: Integer; //范围从1-4指几号读头
    Flag:   Integer; //打卡结果
    Mark:   Integer; //打卡标志
    times:  Integer; //充值次数
    balance: Integer; //消费后余额,单位角
    consume: Integer; //消费额,单位角
  end;

//      实时查询是否有刷卡
function RealReadCard(hPort: THandle; clock_id: Integer; Card: PRealCardInfo): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 不需要联机
// clock_id     : 机号, 允许值:0-255
// Card         : TRealCardInfo 指针，存储返回结果
//返回值:
// True         : 成功
// False        : 失败

type
  //ER-690C/D实时通讯返回结构
  PRealRecordInfo = ^TRealRecordInfo;
  TRealRecordInfo = packed record
    Size: Integer;                                // 此结构大小(包含Size), 调用前需要设置, 以防止访问越界
    CardNo: array[0..17] of char;                 // 存储卡号最长16位
    timeString: array[0..15] of char;             // 刷卡时间14个字符
    IsIDCard: Boolean;                            // 如果时ID卡为true，否则为false是IC卡
    NoCard: Boolean;                              // 如果为true，则没有卡片在感应区，此结构其他数据无效
    Reader: Integer;                              // 范围从1-4指几号读头
    Flag: Integer;                                // 打卡结果
    Mark: Integer;                                // 打卡标志
    times: Integer;                               // 充值次数
    balance: Integer;                             // 消费后余额,单位角
    consume: Integer;                             // 消费额,单位角
    sign_time: TDateTime;                         // Double格式时间

    //ER-690D新扩充
    //ER690DExt: TTRealRecord690DExt;//包含ER-690D超额消费密码的扩充结构,调用前必须设置Size=SizeOf(TRealRecordInfo)
    OverPwd: array[0..9] of char;                 // 超额消费密码
    reserved1: DWORD;                             // 保留
    reserved2: DWORD;                             // 保留
                                                  //ER-6902.0扩展成员
    Clock_ver: Integer;                           //消费记录版本号
    Clock_ID: Integer;                            //机号
    POS_Sequ: Integer;                            //POS交易流水号
    Card_Sequ: Integer;                           //卡交易流水号
    Order_ID: Integer;                            //卡重用顺序号
    Op_CardNo: array[0..19] of Char;              //机操作员卡号
    Date_ver: array[0..10] of Char;               //时间版本号
    reserved3: array[0..100] of Char;             // 保留
    reserved4: array[0..512] of Char;             // 保留

    //2.0/3.0扩展
	  POSID         : array[0..11] of char;         //终端机号
	  CompanyID     : array[0..11] of Char;         //企业ID
    CommonEmpID   : array[0..39] of Char;         //统一分配员工ID
    CompanyEmpID  : array[0..7] of Char;          //企业员工ID
    CardAppSequ   :	array[0..15] of Char;         //应用序列号
	  BusiType			: Integer;        			        //交易类型（0x02：圈存；0x06：脱机消费；0x21：联机消费；0x22：脱机消费撤销；0x23：联机消费撤销；0x24：退费）
    BusiStyle     : Integer;                      //钱包类型（1字节）（0x01：有限余额；0x02：不限余额  0x11：有限次；0x12：不限次）
    TACCheck			: array[0..7] of Char; 	        //TAC校验
    AppIndex      : Integer;                      //子应用索引号
    WalletBalType : Integer;                      //余额类型（0x00：补贴；0x01：个人）
    OperatorID    : Integer;                      //操作员编码（2字节，BCD，01-98相当于0x0001-0x0098）
    AllowanceType : Integer;                      //移动卡格式：补贴方式（1字节，0x00覆盖, 0x01累加，当钱包余额类型为企业补贴时有效。无效时为0xFF）
                                                  //电信卡格式：记录类型定义 0x00表示消费 0x01表示标准出纳模式 0x02表示清零出纳模式 0x03表示自动补贴模式
    AllowanceVersion : Integer;                   //电信卡格式：自动补贴批次（非自动补贴暂时为0，大端格式，高字节在前[61]，低字节在后[62]）
    AppType       : Integer;                      //电信卡格式：应用类型标识，1 字节（0x01：全国钱包；0x04：省钱包；0x08：企业钱包）
    CardFormatType: Integer;                      //记录版本	电信卡格式：0x01	移动卡格式：0x02
    AppCardSN     :	array[0..11] of Char;         //电信卡格式：SAM卡应用序列号
    CardType      : Integer;                      //电信卡格式：卡种标识
    CityCode			:	array[0..3] of Char;          //电信卡格式：城市代码   
  end;
  
//标志位返回值说明
//a)	16修改PIN
//b)	17在线挂失
//c)	18在线解挂
//d)	19在线补贴


//      实时读记录(带刷卡时间3G^)
function RealReadRecord(hPort: THandle; clock_id: Integer; ARecord: PRealRecordInfo): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 不需要联机
// clock_id     : 机号, 允许值:0-255
// Card         : TRealRecordInfo 指针，存储返回结果
//返回值:
// True         : 成功
// False        : 失败
// 说明: 如果机器是690D:
//    consume=0       //待机状态刷卡,需要马上回传此卡的余额
//    consume<>0      //终端机输入的扣除金额, 如果是充值机(机号=0), 则为充值金额
//                    //需将此卡原余额扣除后回传

function RealReadRecordBack(hPort: THandle; clock_id: Integer): Boolean; stdcall; external EASTRIVER_API
//690C实时读记录后确认回传

//      实时消费回传命令(3G^ 690D)
function RealFeedback(hPort: THandle; clock_id: Integer; Money: Integer; ErrCode, Reserved: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 不需要联机
// clock_id     : 机号, 允许值:0-255
// Money        : 数据库余额, 单位角
// ErrCode      : 错误代码, 如下:
//    ErrCode = -1   // 没有错误
//    ErrCode = 0    // 此卡帐上余额不足
//    ErrCode = 1    // 此卡是黑名单卡
//    ErrCode = 2    // 白名单错误
//    ErrCode = 3    // 此卡是非本系统注册卡
//    ErrCode = 4    // 超额消费
//    ErrCode = 5    // 密码错误
//    ErrCode = 6-8  // 保留
//    ErrCode = 9    // 卡注册成功
// Reserved     : 保留, 置为零
//返回值:
// True         : 成功
// False        : 失败

//      读门禁机电锁状态(^3G, 980)
function ReadDoorStateDE(hPort: THandle; clock_id: Integer; DoorState: PChar): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 不需要联机
// clock_id     : 机号, 允许值:0-255
// DoorState    : 大于5个字节的缓冲区，前四个字节表示四把锁的状态，即
//      如果某个字节为'1'表示某个锁为开，为'0'表示某把锁为闭合。
//返回值:
// True         : 成功
// False        : 失败


//      实时控制门禁机电锁动作(^3G, 980)
function SetDoorOpenDE(hPort: THandle; clock_id: Integer; DoorState: PChar): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 不需要联机
// clock_id     : 机号, 允许值:0-255
// DoorState    : 同上ReadDoorState;
//返回值:
// True         : 成功
// False        : 失败

{实时控制类}















{门禁机控制类}

//		  设置门禁机开门时间
function SetLockOpenTimeLen(hPort: THandle; timeLen: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// timeLen      : 新的开门时间, 1-99 秒
//返回值:
// True         : 成功
// False        : 失败

//	  	读门禁机开门时间
function ReadLockOpenTimeLen(hPort: THandle; var timeLen: Integer): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// timeLen      : 返回开门时间, 1-99 秒
//返回值:
// True         : 成功
// False        : 失败

//		  读门禁机电锁状态
function ReadDoorOpenState(hPort: THandle; var state: Integer): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
//		state  :  电锁状态, state=0 表示为关门状态
//							state=1 表示为开门状态
//返回值:
// True         : 成功
// False        : 失败

//		  设置门禁机开门超时报警
function SetDoorOpenTimeoutAlarmState(hPort: THandle; state: Integer): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// state        : 新的超时报警值
//		state=0   : 清除开门超时报警
//		state=1   : 设置开门超时报警
//返回值:
// True         : 成功
// False        : 失败

//		  远程控制门禁机开门(2G)
function ControlOpenDoor(hPort: THandle): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// state        : 新的超时报警值
//		state=0   : 清除开门超时报警
//		state=1   : 设置开门超时报警
//返回值:
// True         : 成功
// False        : 失败


{门禁机控制类}












{IC卡控制函数类}

//		  修改IC机具密码
function SetSecurityCode(hPort: THandle; oldSecurity: PChar; newSecurity: PChar): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// oldSecurity  : 12位16进制机具旧密码, 若无旧密码, 则设为'FFFFFFFFFFFF'
// newSecurity  : 12位16进制机具新密码, 若功能为删除旧密码, 则设为'FFFFFFFFFFFF'
//返回值:
// True         : 成功
// False        : 失败

//      读机具当前客户代码(IC卡号存储区域)
function ReadClientCode(hPort: THandle; var ClientCode: Integer): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// ClientCode   : 返回当前机具客户代码, IC卡信息存储块号
//返回值:
// True         : 成功
// False        : 失败

//      修改机具当前客户代码
function SetClientCode(hPort: THandle; ClientCode: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// ClientCode   : 新的机具客户代码, IC卡信息存储块号
//返回值:
// True         : 成功
// False        : 失败

//      读IC卡信息
function ReadICCard(hPort: THandle; CardNo, CardName: PChar; var Money, Times, Ver: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// CardNo       : 返回卡号,16位,
// CardName     : 返回姓名,长度不小于16位
// Money        : 返回卡上金额
// Times        : 返回充值次数
// Ver          : IC卡格式, 允许值如下:
//      CARDSTYLE_UNKNOWN = 0000; //未知卡号格式(可能为空)
//      CARDSTYLE_IDCARD  = 0001; //ID卡格式
//      CARDSTYLE_STDCARD = 0830; //依时利标准IC卡格式
//      CARDSTYLE_NEWCARD = 0880; //新ER-880C卡格式
//      CARDSTYLE_690CARD = 0690; //新消费机ER-690C卡格式
//返回值:
// True         : 成功
// False        : 失败

//      读IC卡信息
function ReadAllICCard(hPort: THandle; CardNo, CardName: PChar; var Money, Times, GroupStation, GroupId, Ver: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// 同上
// GroupStation : 分组字节位置, 范围: 0-15, 如果不需要写分组标识, 请设为-1
// GroupId      : 返回分组标识, 范围:0-256
//返回值:
// True         : 成功
// False        : 失败

//      写IC卡信息
function WriteICCard(hPort: THandle; CardNo, CardName: PChar; Money: Integer; Times: Integer; Ver: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// 同上
//返回值:
// True         : 成功
// False        : 失败

//      写IC卡信息包含卡分组标识
function WriteAllICCard(hPort: THandle; CardNo, CardName: PChar; Money, Times, GroupStation, GroupId, Ver: Integer; MatchCard: Boolean=False): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// 同上
// 如果不需要写分组标识, 请设GroupStation=-1
// MatchCard    : 是否只重写CardNo参数对应的卡号, 用于消费充值
//返回值:
// True         : 成功
// False        : 失败

//      扩展读IC卡信息包含卡分组标识(ER-690卡)
function ReadICCardEx(hPort: THandle; CardNo, CardName, pwd: PChar;var Money, Times,
                      day_consumed, day_times, c_month, c_day, c_flag, GroupStation, GroupId, CardStyle: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// 同上
//ER-690卡专用参数
// pwd          : 高额消费认证密码, 最长6位'0'-'9'的数字
// day_consumed : 当日消费累加额
// day_times    : 当日消费次
// c_month      : 消费月份
// c_day        : 消费日期
// c_flag       : 标志
//
// 如果不需要写分组标识, 请设GroupStation=-1
// MatchCard    : 是否只重写CardNo参数对应的卡号, 用于消费充值
//返回值:
// True         : 成功
// False        : 失败

//      扩展写IC卡信息包含卡分组标识(ER-690卡)
function WriteICCardEx(hPort: THandle; CardNo, CardName, pwd: PChar; Money, Times,
                      day_consumed, day_times, c_month, c_day, c_flag, GroupStation, GroupId, CardStyle: Integer; MatchCard: Boolean=False): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// 同上
//ER-690卡专用参数
// pwd          : 高额消费认证密码, 最长6位'0'-'9'的数字
// day_consumed : 当日消费累加额
// day_times    : 当日消费次
// c_month      : 消费月份
// c_day        : 消费日期
// c_flag       : 标志
//
// 如果不需要写分组标识, 请设GroupStation=-1
// MatchCard    : 是否只重写CardNo参数对应的卡号, 用于消费充值
//返回值:
// True         : 成功
// False        : 失败

//      写指定卡号的卡信息
function WriteMatchICCard(hPort: THandle; CardNo, CardName: PChar; Money: Integer; Times: Integer; Ver: Integer; blank: Boolean): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// 同上
//	blank: 是否允许写空白卡(发卡时)
//返回值:
// True         : 成功
// False        : 失败

//      写指定卡号的卡信息
function WriteMatchICCardEx(hPort: THandle; CardNo, CardName, Pwd: PChar; Money, Times,
                          day_consumed, day_times, c_month, c_day, c_flag, CardStyle: Integer; blank: Boolean): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// 同上
//	blank: 是否允许写空白卡(发卡时)
//返回值:
// True         : 成功
// False        : 失败

//      清除卡上内容(包含指定Block的整个扇区清除)
function ClearICCard(hPort: Thandle; block: Integer=-1): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// block        : 如果机器是ER-880C, Block=-1 时, Block=当前IC卡存储块
//返回值:
// True         : 成功
// False        : 失败

//		  读2进制IC卡块内容
function ReadCardMessage(hPort: THandle; cardMessage: PChar; block: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// cardMessage  : 返回整块16字节2进制数据
// block        : IC卡数据的块地址, 1.26之前的读码器版本必须使用 block=-1的参数
//返回值:
// True         : 成功
// False        : 失败
function ReadCardMessageString(hPort: THandle; cardMessage: PChar; block: Integer): Boolean; stdcall; external EASTRIVER_API

//  		写2进制IC卡块内容
function WriteCardMessage(hPort: THandle; cardMessage: PChar; block: Integer): Boolean; stdcall; external EASTRIVER_API
//同上
function WriteCardMessageString(hPort: THandle; cardMessage: PChar; block: Integer): Boolean; stdcall; external EASTRIVER_API
//      读IC卡密码
function ReadICCardPassWord(hPort: THandle; PassWord: PChar; block: integer=-1): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// PassWord     : 为存放返回的密码的缓冲区, 必须不小于50字节
// block        : ER-880C密码扇区号, 1G(ER-810/830C)设为-1
//                如果机器是ER-880C, Block=-1 时, Block=当前IC卡扇区密码块号
//返回值://返回值:
// True         : 成功
// False        : 失败

//      写IC卡密码
function WriteICCardPassWord(hPort: THandle; PassWord: PChar; block: integer=-1): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// PassWord     : 为要设置的新IC卡密码, 长度为 32 个字节
// block        : ER-880C密码扇区号, 1G(ER-810/830C)设为-1
//                如果机器是ER-880C, Block=-1 时, Block=当前IC卡扇区密码块号
//返回值:
// True         : 成功
// False        : 失败

//      读IC卡序列号
function ReadICCardSerialNo(hPort: THandle;var SerialNo: Int64; LongSn: Boolean=True): Boolean; stdcall; overload; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// SerialNo     : 返回序列号, 64位整数, 如果LongSn=False, 则SerialNo可声明为DWORD(32位无符号整数)
// LongSn       : 是否允许返回长序列号, 如果为False, 机器卡有长序列号则只返回低32位整数(DWORD)
//返回值:
// True         : 成功
// False        : 失败


//      读IC卡序列号(32位无符号整数)
function ReadICCardSerialNo(hPort: THandle;var SerialNo: DWORD; LongSn: Boolean=False): Boolean; overload; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// 同上
//返回值:
// True         : 成功
// False        : 失败


{IC卡控制函数类}











{分组打卡控制类}

//		  设置分组检查字节位置
function WriteGroupByteStation(hPort: THandle; groupByte: Integer): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// groupByte    : IC卡检查字节位, 范围: 0-16
// 		0-15      : 为一对多分组检查字节位置
//  	16        : 表示为检查多对多分组检查的分组存储区
//返回值:
// True         : 成功
// False        : 失败

//		  读分组检查字节位置
function ReadGroupByteStation(hPort: THandle; var groupByte: Integer): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// groupByte    : IC卡检查字节位, 范围: 0-15
//返回值:
// True         : 成功
// False        : 失败

//		  设置分组检查字节标志单元组
function WriteGroupByteChecks(hPort: THandle; groupChecks: pchar): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// groupChecks  : 允许组别清单, 十进制数值, 可以使用','及'-'连接.
// 		  例如 : 0,5-8,100, 140-141,255
// 		  表示可以检查组别标志为0,5,6,7,8,100,140,141,255的卡打卡
//返回值:
// True         : 成功
// False        : 失败

//		  读分组检查字节标志单元组
function ReadGroupByteChecks(hPort: THandle; groupChecks: pchar; buffsize: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// groupChecks  : 允许组别清单, 十进制数值, 可以使用','及'-'连接.
// 	    例如 : 0,5-8,100, 140-141,255
//      表示可以检查组别标志为0,5,6,7,8,100,140,141,255的卡打卡
// buffsize     : 缓冲区大小, 一般尽量设得大些, >1000
//返回值:
// True         : 成功
// False        : 失败

//      读卡多对多分组检查单元组
function ReadCardManyGroupChecks(hPort: THandle; GroupChecks: pchar; buffersize: Integer; block: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// groupChecks  : 允许组别清单, 十进制数值, 可以使用','及'-'连接.
// 	    例如 : 0,5-8,100, 140-141,255
//      表示可以检查组别标志为0,5,6,7,8,100,140,141,255的卡打卡
// buffsize     : 缓冲区大小, 一般尽量设得大些, >1000
// block        : 存放多对多分组信息的块号, 一般是每扇区的第0块
//返回值:
// True         : 成功
// False        : 失败

//      写卡多对多分组检查单元组
function WriteCardManyGroupChecks(hPort: THandle; GroupChecks: pchar; block: Integer): Boolean; stdcall; external EASTRIVER_API
//同上
{分组打卡控制类}

{690C2.0}
//写690C2.0版卡格式信息，发卡
function WriteNewICCard(hPort: THandle; ClientCode: Integer; InfoCode: Integer; CardNo: PChar; CardName: PChar; OverPwd: PChar; CardMoney: Integer; CardKind: Integer; BeginDate: PChar; EndDate: PChar; Group: PChar; DayMoney: Integer; DayTimes: Integer; TimeMoney: Integer; CardSequ: Integer; LastDate: PChar; DayTotalTimes: Integer; DayTotalMoney: Integer; CurrOrder: Integer; CurrTimes: Integer; TotalMoney: Integer; AllowanceVer: PChar; Reserve: Integer): Integer; stdcall;external EASTRIVER_API
//参数说明:
//hPort：联机的端口句柄
//ClientCode：目录扇区
//InfoCode：信息扇区
//CardNo：卡号
//CardName：姓名
//OverPwd：超额消费密码
//CardMoney：卡上金额
//CardKind：卡类型
//BeginDate：卡启用日期
//EndDate：卡结束日期
//Group：分组
//DayMoney：每日消费金额限制
//DayTimes：每日消费次数限制
//TimeMoney：每次消费金额限制
//CardSequ：卡交易流水号，第一次从0开始，在0到65535间循环
//LastDate:最后交易日期，格式yymmddhhnn
//DayTotalTimes:一天消费总次数
//DayTotalMoney:一天消费总金额
//CurrOrder:当前消费时段序号
//CurrTimes:当前消费时段消费次数
//TotalMoney:累计消费金额
//AllowanceVer:补贴版本号
//Reserve:保留
//返回值
//0：成功
//1：读卡错误
//2：写卡错误
//3: 句柄不对
//4：数据校验错误
//5：数据转换错误
//6：输入的参数错误
//7: 空白卡
//8: 不是690C2.0卡格式

//参数错误时返回的代码信息



//读690C2.0版卡格式信息
function ReadNewICCard(hPort: THandle; ClientCode: Integer; var InfoCode: Integer; CardNo: PChar; CardName: PChar; OverPwd: PChar; var CardMoney: Integer; var CardKind: Integer; BeginDate: PChar; EndDate: PChar; Group: PChar; var DayMoney: Integer; var DayTimes: Integer; var TimeMoney: Integer; var CardSequ: Integer; LastDate: PChar; var DayTotalTimes: Integer; var DayTotalMoney: Integer; var CurrOrder: Integer; var CurrTimes: Integer; var TotalMoney: Integer; AllowanceVer: PChar; var Reserve: Integer): Integer; stdcall;external EASTRIVER_API
//参数说明同上

//获取690C2.0参数
function GetParam690C2(hPort: THandle; var Value: Integer; Func: Integer): Boolean; stdcall;external EASTRIVER_API
//参数说明
//    Func=1每天最大消费限额,
//        =2当前最大消费金额，
//        =3卡上最大余额，
//        =4管理权限
//        =5设置消费钱包号(星龙基)0--4
//        =6押金，最小金额限制
//        =7每日最大消费次数限制
//        =8.同一张卡重复刷卡间隔时间1-99分钟
//        =9.任意卡间隔刷卡时间0-2.25秒，每0.25秒一个单位，1-9
//        =10.成功消费完成后屏幕提示信息的停留时间,0-99秒
//        =11每时段消费次数限制，总共4个时段
//        =12每次消费按键金额限制

//设置690C2.0参数
function SetParam690C2(hPort: THandle; Value: Integer; Func: Integer): Boolean; stdcall;external EASTRIVER_API


//      分段定值函数:读
//060000000001112000000002183000000003231000000004
//0600 00000001,1120 00000002,1830 00000003,2310 00000004
function ReadFixMoneyOfZone(hPort: THandle; Data: PChar): Boolean;stdcall;external EASTRIVER_API
function SetFixMoneyOfZone(hPort: THandle; Data: PChar): Boolean;stdcall;external EASTRIVER_API

{690C2.0}

{690CT}

function PosRateTime(hPort: THandle; var Value: Integer; Func, Flag: Integer): Integer; stdcall; external EASTRIVER_API
//功能：设置和读取计时Pos机的费率和时间段
//参数：Value:要设置或读取的变量
//      Func:功能分类
//           =1单次限制低时间            =2/可舍弃时间(分钟)
//           =3基本时间段（分钟）        =4基本时间段收费率（费率：角）
//           =5超时时间段（分钟）        =6超时时间段收费（费率：角）
//           =7连续打卡时间间隔（分钟）  =8单次消费最大时间（分钟）
//      Flag:读取或设置
//           =1设置   =2读取
//返回 =0成功 =1参数错误 =2读写端口错误 =3数据转换错误

{690CT}

{690C2.0综合业务机}
function RealReadState(hPort: THandle; clock_id: Integer; var State, RecCount: Integer; CardNo, PINCode: PChar): Boolean; stdcall; external EASTRIVER_API
//参数说明
//      State:状态=0空闲 =1等待 =2忙 =3修改PIN码 =4挂失 =5解挂  =6补贴
//      RecCount:已存在的记录数
//      CardNo:返回的卡号
//      PINCode:返回的超额认证密码

function RealAddMoney(hPort: THandle; clock_id: Integer; Money: Integer; pDate: PChar; Flag: Integer; PurseNo: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明
//     Money:补贴金额，精确到分，不能超过16777215
//     pDate:补贴版本，格式YYMMDDHH
//     Flag:是否有效，=0无效  =1有效
//     PurseNo:补贴钱包号0-4

function RealAnswerLossInfo(hPort: THandle; clock_id: Integer; Flag: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:在线挂失回传
//      Flag:=0挂失成功 =1挂失失败

function ReadAllStringRecord(hPort: THandle; Start: Integer; Count: Integer; Data: PChar): Integer; stdcall; external EASTRIVER_API
//读所有记录按顺序号，及条读记录信息
//参数说明:
//  hPort 联机句柄
//  Start:开始记录点，从0开始
//  Count：读取条数
//  Data：记录字符串数据
//返回值:
//  =0成功  =3超时错误  =5数据校验错误  =6发送命令错误 =8异常

function RealReadStrRecord(hPort: THandle; clock_id:Integer;ARecord: PChar): Boolean; stdcall; external EASTRIVER_API
function RealReadStringRecord(hPort: THandle; clock_id:Integer;Data: PChar): Boolean; stdcall; external EASTRIVER_API
//读实时记录信息
//参数说明:
//  hPort 联机句柄
//  clock_id:机号
//  Data：记录字符串数据
//返回值:
//  True         : 成功
//  False        : 失败

{690C2.0综合业务机}

//广办珠海特殊单    -------------------------start:yth2005.8.29
//1-----------------------------------------------------------------
//      读机具当前检测选项
function ReadSystemCheck(hPort: THandle; var SystemCheck: Integer): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// SystemCheck   :
//    b_isTimeZoneEN   bit SystemCheck.7    ;时间段判断          1-检测，0-不检测
//    b_isRepeatCardEN bit SystemCheck.6	  ;重复刷卡判断        1-检测，0-不检测
//    b_isSysCardEN    bit SystemCheck.5    ;系统卡判断          1-检测，0-不检测
//    b_isEnterKeyEN   bit SystemCheck.4	  ;是否需要按确认键盘  1-检测，0-不检测 （就餐、考勤无效）
//    b_isFreeCardEN   bit SystemCheck.3    ;自由刷卡时间判断    1-检测，0-不检测 (只对就餐、考勤有效，其他模式不检测)
//    b_isLightLCDEN   bit SystemCheck.2    ;背景光              1-检测，0-不检测
//    b_isWhiteListEN  bit SystemCheck.1    ;检查白名单          1-检测，0-不检测
//    ; bit SystemCheck.0


//返回值:
// True         : 成功
// False        : 失败

//      修改机具当前检测选项
function SetSystemCheck(hPort: THandle; SystemCheck: Integer): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// SystemCheck   :
//    b_isTimeZoneEN   bit SystemCheck.7    ;时间段判断          1-检测，0-不检测
//    b_isRepeatCardEN bit SystemCheck.6	  ;重复刷卡判断        1-检测，0-不检测
//    b_isSysCardEN    bit SystemCheck.5    ;系统卡判断          1-检测，0-不检测
//    b_isEnterKeyEN   bit SystemCheck.4	  ;是否需要按确认键盘  1-检测，0-不检测 （就餐、考勤无效）
//    b_isFreeCardEN   bit SystemCheck.3    ;自由刷卡时间判断    1-检测，0-不检测 (只对就餐、考勤有效，其他模式不检测)
//    b_isLightLCDEN   bit SystemCheck.2    ;背景光              1-检测，0-不检测
//    b_isWhiteListEN  bit SystemCheck.1    ;检查白名单          1-检测，0-不检测
//    ; bit SystemCheck.0
//返回值:
// True         : 成功
// False        : 失败

//2-----------------------------------------------------------------
//      读机具当前工作模式代码
function ReadSystemMode(hPort: THandle; var SystemMode: Integer): Boolean;stdcall;  external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// SystemMode   : 1.考勤模式,2.进场登记模式,3.退场登记模式,4.领款登记模式,5.就餐模式
//返回值:
// True         : 成功
// False        : 失败

//      修改机具当前工作模式代码
function SetSystemMode(hPort: THandle; SystemMode: Integer): Boolean; stdcall;  external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// SystemMode   :1.考勤模式,2.进场登记模式,3.退场登记模式,4.领款登记模式,5.就餐模式
//返回值:
// True         : 成功
// False        : 失败

//3-----------------------------------------------------------------
//      读取机具系统卡范围
function ReadSystemCardRange(hPort: THandle; strStartCard: PChar;strEndCard:PChar): Boolean;stdcall;  external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// TimeString   : 返回机具可识别的系统卡范围0000000000-9999999999
//返回值:
// True         : 成功
// False        : 失败

//      修改机具系统卡范围
function SetSystemCardRange(hPort: THandle; strStartCard,strEndCard:PChar): Boolean; stdcall;  external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// SetTime      : 新的可识别的系统卡范围, 0000000000-9999999999
//返回值:
// True         : 成功
// False        : 失败


//广办珠海特殊单--------------------------------end:yth2005.8.29



{存储器操作类}
//      看门狗测试
function WatchDogTest(hPort: THandle): Boolean; stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
//返回值:
// True         : 成功
// False        : 失败

//		  读 RAM 16字节数值
function ReadRAMData(hPort: THandle; address: Integer; ValueData: Pointer): Boolean; stdcall; external EASTRIVER_API
//		address   : RAM 地址, 0x00-0xFF
//		valueData : 读回的数据缓冲区, 大小为16字节

//		  读 RAM 1字节数值
function WriteRAMByte(hPort: THandle; address: Integer; Value: Byte): Boolean; stdcall; external EASTRIVER_API
//		address   : RAM 地址, 0x00-0xFF
//		valueData : 1字节数据, 大小为16字节

//		  读 EEPROM 16字节数值
function ReadEEPROMData(hPort: THandle; address: Integer; ValueData: Pointer): Boolean; stdcall; external EASTRIVER_API
//		address   : EEPROM 地址, 只允许使用0x100--0x0FFF的单元地址
//		valueData : 读回的数据缓冲区, 大小为16字节

//		  写 EEPROM 1字节数值
function WriteEERPOMByte(hPort: THandle; address: Integer; Value: Byte): Boolean; stdcall; external EASTRIVER_API
//		address   : EEPROM 地址, 只允许使用0x100 -- 0x0FFF的单元地址
//		value     : 1字节数据

//		  写 EEPROM 16字节数值
function WriteEEPROMData(hPort: THandle; address: Integer; valueData: Pointer): Boolean; stdcall; external EASTRIVER_API
//		address   : EEPROM 地址, 只允许使用0x100 -- 0x0FFF的单元地址
//		valueData : 16字节数据, 大小为16字节

//		  读数据存储器一页(256字节)数据
function ReadFlashPageData(hPort: THandle; flashPage: Integer; valueData: Pointer): Boolean; stdcall; external EASTRIVER_API
//		flashPage  : 数据存储器的页地址, 范围为 0x0--0x7FF, 或 0x0--0xFFF
//		valueData  : 读回的数据缓冲区, 大小为256字节

//		  读数据存储器数据
function ReadFlashData(hPort: THandle; address: Integer; valueData: Pointer): Boolean; stdcall; external EASTRIVER_API
//		address  : 数据存储器的地址, 范围为 0x0--0x7FF00, 或 0x0--0xFFF00
//		valueData  : 读回的数据缓冲区, 大小为16字节

//		  写入一页(256字节)数据到数据存储器
function WriteFlashPageData(hPort: THandle; flashPage: Integer; valueData: Pointer): Boolean; stdcall; external EASTRIVER_API
//		flashPage  : 数据存储器的页地址, 范围为 0x0--0x7FF, 或 0x0--0xFFF
//		valueData  : 256字节写入数据, 大小为256字节

{存储器操作类}









{底层端口操作类}
//      进入测试模式
function EnterTestMode(hPort: THandle; clock_id: Integer; HoldRate: Boolean): Boolean;stdcall; external EASTRIVER_API
//参数说明:
// hPort        : 端口句柄, 需要联机
// clock_id     : 机号, 范围: 0x00-0xFF
// HoldRate     : 恢复通讯速率到联机前的一致, 否则进入测试模式后通讯速率会自动调整为38400bps,
//返回值
// True         : 成功
// False        : 错误
//说明: 所有通用命令和测试模式的命令均起作用

//      发送命令并取得返回字串
function WriteBack(hPort: THandle; Cmd, Buf: PChar):Boolean;stdcall; external EASTRIVER_API
//      发送命令不返回
function WriteText(hPort: THandle; Cmd: PChar; nNumberOfBytesToWrite: DWORD=0): Boolean; stdcall; external EASTRIVER_API
//      发送命令并判断是否成功
function ReadText(hPort: THandle; var Buff; BytesToRead: Cardinal; var BytesOfRead: Cardinal; Delay: Cardinal): Boolean; stdcall; external EASTRIVER_API

function WriteEcho(hPort: THandle; Cmd: PChar; nNumberOfBytesToWrite: DWORD=0): Boolean; stdcall; external EASTRIVER_API
function ReadEcho(hPort: THandle; Buff: PChar; Count: Integer; Delay: Cardinal): Boolean; stdcall; external EASTRIVER_API

function WaitOK(hPort: THandle; Cmd: PChar; Delay: Integer=1000):Boolean;stdcall; external EASTRIVER_API
//      读取端口

procedure SetPortPara(hPort: THandle; BaudRate: Integer; ByteSize, Parity, StopBits: Byte; Flag: DWORD=0);stdcall; external EASTRIVER_API

{底层端口操作类}
function GetAutoTranslateCardNo:Boolean;stdcall; external EASTRIVER_API
//      设置是否自动转换IC卡号
procedure SetAutoTranslateCardNo(Value: Boolean);stdcall; external EASTRIVER_API
//      取得当前通信结束字符
function GetEndChar: Char;stdcall; external EASTRIVER_API
//      设置通信结束字符
procedure SetEndChar(Ch: Char);stdcall; external EASTRIVER_API

function GetPortTimeOut(Value: Integer): Boolean; stdcall; external EASTRIVER_API
function SetPortTimeOut(Value: Integer): Boolean; stdcall; external EASTRIVER_API
function SetPortRWCardTimeOut(hPort: THandle; Value: Integer): Boolean; stdcall; external EASTRIVER_API
function GetCmdVerify: Boolean;stdcall; external EASTRIVER_API//取得通讯命令是否需要校验
function SetCmdVerify(Value: Boolean): Boolean;stdcall; external EASTRIVER_API;//设置命令校验
function GetCardStyle: Integer;stdcall; external EASTRIVER_API//取得内部通讯卡格式转换方法
function SetCardStyle(style: Integer): Boolean;stdcall; external EASTRIVER_API//设置内部通讯卡格式转换方法
function CheckCRC16(Data: PChar): Boolean; stdcall;external EASTRIVER_API
function VerifyHexData(Data: PChar): Boolean; stdcall;external EASTRIVER_API

//获取当前系统语言ID，950=繁体 936=简体
function GetSystemLangID: Integer; stdcall;external EASTRIVER_API
function GBTBIG5(const Value: PChar; outData: PChar): Boolean; stdcall;external EASTRIVER_API//简->繁转换
function BIG5TGB(const Value: PChar; outData: PChar): Boolean; stdcall;external EASTRIVER_API//繁->简转换

//TCP/IP通讯
function SelectCommStyle(CommStyle: Integer): Boolean; stdcall;external EASTRIVER_API
function OpenClientSocket(RemoteAddr: PChar; Port: Integer):THandle; stdcall;external EASTRIVER_API
function CloseClientSocket(hSocket: THandle): Boolean; stdcall;external EASTRIVER_API
function ClearSocketBuff(hPort: THandle; Delay: Cardinal): Boolean; stdcall; external EASTRIVER_API

type
  TDevRegInfo = packed record
    DeviceID:DWORD;

    DevPath:array[0..127] of char; //usb设备地址
    DevPathlen:integer;
    DeviceDescr :array[0..127] of char;//usb 设备描述（在设备管理的名字）
    deviceDescrlen:integer;
    DeviceTypeDescr :array[0..127] of char;//usb 设备类型描述
    deviceTypeDescrlen:integer;
  end;
  TDevRegInfoList = record
    DeviceCount:integer; //找到的USB设备数
    DeviceInfoList: array[0..31] of TDevRegInfo; //usb设备列表结合设备数字使用
  end;

//USB通讯
{连接USB设备，DevPath 是USB设备路径}
function OpenUSBDevice(devPath:pchar):boolean;stdcall; external EASTRIVER_API;
{关闭设备}
function CloseUSBDevice:boolean;stdcall; external EASTRIVER_API;
{获取当前电脑上已存在的USB设备，
 DisplayMouseAndKeyboard = false 不获取标准鼠标键盘的信息
                         = true  获取标准鼠标键盘的信息
 }
function GetUSBDevInfoList(DisplayMouseAndKeyBoard:boolean):TDevRegInfoList;stdcall; external EASTRIVER_API;

{  USBRtnMsg: array[0..20] of string =
    ('操作正确',
    '通信祯头错',
    '接收正确，但执行出错',
    '通讯版本出错',
    '命令不存在',
    '数据长度出错',
    '固定长度XOR和出错',
    '数据段出错',
    '程序异常',
    '程序异常',
    '程序异常',
    '程序异常',
    '程序异常',
    '读写卡块号错',
    '卡片不在感应区， 请调整后重试!',
    '读写卡密码错',
    '密码类型错',
    '读卡错',
    '写卡错',
    '写卡检验错',
    '操作失败!');
}
//得到USB版本号
function USBGetVersion(Version: PChar): Integer; stdcall; external EASTRIVER_API;
//询卡及返回序列号
// CardType 为卡类型， 0=IC卡， 1=SIM卡
function USBGetSerialNo(SerialNo: PChar; var CardType: Integer): Integer; stdcall; external EASTRIVER_API;
// 读取卡的账户信息，
// 返回：用户名，卡号，金额，密码等
// CardType 为卡类型， 0=IC卡， 1=SIM卡
function USBGetAccount(Sector: Integer; UserName: PChar; CardID: PChar;
  var Account: Double; var ChargeCnt:Integer; Password: PChar; CardType: Integer): Integer; stdcall; external EASTRIVER_API;
// 写的账户信息，
// 返回：用户名，卡号，金额，密码等
// CardType 为卡类型， 0=IC卡， 1=SIM卡
function USBSetAccount(Sector: Integer; UserName: string; CardID: string;
  Account: Double; ChargeCnt:Integer; PassWord: string; CardType: Integer): Integer; stdcall; external EASTRIVER_API;
// 清除账户信息，
// CardType 为卡类型， 0=IC卡， 1=SIM卡
function USBClearAccount(Sector: Integer; CardType: Integer): Integer; stdcall; external EASTRIVER_API;
//修改扇区密码
function USBSetCardPWD(Sector: Integer; NewPassward: PChar; CardType: Integer): Integer; stdcall;  external EASTRIVER_API;
//修改机具密码
function USBSetDevicePWD(NewPWD: PChar): Integer; stdcall; external EASTRIVER_API;

//983新增通讯
function RegisiterCardList(hPort: THandle; Style: Integer; inData: PChar): Integer; stdcall;external EASTRIVER_API
//门禁允许通行卡、允许考勤卡授权，系统黑名单登记
function DelRegisiterCardList(hPort: THandle; Style: Integer; inData: PChar): Integer; stdcall;external EASTRIVER_API
//删除注册卡信息
function ReadRegisiterCardList(hPort: THandle; Style: Integer; inData: PChar; outData: PChar): Integer; stdcall;external EASTRIVER_API
//查询注册卡
function SetTimerAndRight(hPort: THandle; Style: Integer; inData: PChar): Integer; stdcall;external EASTRIVER_API
//门禁允许通行时间段和相应的操作权限、允许刷卡读卡器
function ReadTimerAndRight(hPort: THandle; Style: Integer; inData: PChar; outData: PChar): Integer; stdcall;external EASTRIVER_API
//读取门禁允许通行时间段和相应的操作权限、允许刷卡读卡器等
function DelTimerAndRight(hPort: THandle; Style: Integer; inData: PChar): Integer; stdcall;external EASTRIVER_API
//删除门禁允许通行时间段和相应的操作权限、允许刷卡读卡器等
function RealReadRecordEx(hPort: THandle; Style: Integer; Clock_id: Integer; OutData: PChar): Integer; stdcall;external EASTRIVER_API
//实时读记录
function RealReadClockState(hPort: THandle; clock_id: Integer; outData: PChar): Integer; stdcall;external EASTRIVER_API
//实时查询机具状态
function RealSetClockState(hPort: THandle; clock_id: Integer; State: Integer; Lock: PChar): Integer; stdcall;external EASTRIVER_API
//实时打开或栓住锁
function ClockConfig(hPort: THandle; Style: Integer; inData: PChar; outData: PChar): Boolean;  stdcall;external EASTRIVER_API
//机具配置
//参数说明：
//Style=
//1:设置或读取机具产品序列号信息
//2:设置或读取点阵LCD机具开机启动显示屏显示的OEM机具制造商Log信息，该信息显示在Splash屏的第1行（起始行）
//3:该命令用于设置或读取点阵LCD机具开机启动显示屏显示的机具产品型号信息，该信息显示在Splash屏的第2行（起始行为第1行）
//4:设置或读取点阵LCD机具开机启动显示屏显示的产品名称信息，该信息显示在Splash屏的第3行（起始行为第1行）
//5:设置或读取点阵LCD机具待机状态时显示的用户Log。没有通知消息时，该信息显示在待机界面的第1行（起始行）
//6:设置或读取点阵LCD机具正常考勤刷卡信息显示时显示的用户Log，该信息显示在待机界面的第1行（起始行）。根据考勤刷卡显示信息内容的差异，该用户Log可能并不显示
//7:设置或读取点阵LCD机具门禁正常刷卡时提示的用户Log
//8:(暂不支持,预留)设置机具管理员的卡号、开门时附加身份验证密码和胁迫开门密码。为了提高系统的安全性，参数配置员是无法直接开门的；管理员在选择执行开门功能时，必须输入密码验证身份。检测到是胁迫密码，则认为管理员被胁迫开门；否则通过身份验证时，记录成正常开门
//9:设置机具系统参数配置员的卡号和身份验证密码。使用参数配置员进入系统功能菜单可以设置比管理员更多的机具工作特性参数，以满足不同客户的使用需要，同时简化客户的使用操作。参数配置员刷卡后，还要输入密码验证身份才能进入参数配置菜单操作。机具出厂时的默认参数配置员卡号为0008776225，参数配置员身份验证密码为空
//10:(暂不支持,预留)//修改机具当前使用的IC卡访问时身份验证密钥。机具初始化后，IC卡访问身份验证密钥为FFFF FFFF FFFF，可以根据用户的实际使用需要进行修改
//11:设置或读取机具使用的默认IC卡数据存贮区块／验证密钥类型、机具分组检查字节位置
//12:(暂不支持,预留)//设置机具分组刷卡组别信息
//13:设置或读取机具使用的显示卡号长度、数据处理卡号长度、刷卡间隔、重复刷卡间隔等刷卡处理参数。
//   用户刷卡后，获取的卡号数据全部保存（最大14位），但对卡片信息中未指定卡号长度的卡可根据使用的实际需要只显示若干位卡号；显示卡号长度参数就用于控制此时需要显示的卡号信息范围和授权卡比较卡号范围。
//   刷卡间隔参数用于设置一张卡刷卡后到下一张卡能够刷卡之前的等待时间。
//   重复刷卡间隔参数用于一张卡刷卡后到下次该卡能够再次刷卡之前的等待时间。
//Data当为空时表示读取，如果有值表示设置

//读名单版本号Style=0黑名单 =1白名单
function GetCardListVer(hPort: THandle; Style: Integer; Ver: PChar): Boolean; stdcall; external EASTRIVER_API
//设置名单版本号Style=0黑名单 =1白名单
function SetCardListVer(hPort: THandle; Style: Integer; Ver: PChar): Boolean; stdcall; external EASTRIVER_API
//设置白名单
function SetAllowedCardX(hPort: THandle; card, empid, EmpName, Ver: PChar): Boolean; stdcall; external EASTRIVER_API
//设置黑名单
function SetBlackCardX(hPort: THandle; card, Ver: PChar): Boolean; stdcall; external EASTRIVER_API

function CheckCardExists(hPort: THandle; Style: Integer; CardNo: PChar; Data: PChar): Boolean; stdcall; external EASTRIVER_API
//检查名单是否存在
//Style =0 检查黑名单 =1检查白名单 =2 检查门禁通行名单
//CardNo 要检查的卡号
//Data 如果函数返回为真，对白名单和门禁通行名单而言有返回卡的一些有关信息，如果是黑名单没有返回
//白名单的返回值：
//门禁通行名单的返回值：

/////////////埃及客户专用//////////////////

//读取机具使用卡片卡号解析方式
function ReadCardParseStyle(hPort: THandle; Style: PChar): Boolean; stdcall; external EASTRIVER_API
//返回Style的卡号解析格式如下,目前共四位，前两位表示本机读取卡片数据解析方式，后两位表示外接读头读取卡片数据解析方式,具体意义如下:
//0x00		机具未安装读头模块。
//0x01		读取 IC 卡序列号当作 ID 卡使用。
//0x02		读取 IC 卡上写入的数据进行解析使用。
//0x03		读取 IC 卡序列号进行授权检测，卡上数据为工号。
//0x08		EM4001 ID 卡，十位 BCD 卡号。
//0x09		EM4001 ID 卡，八位 BCD 卡号。
//0x0A		EM4001 ID 卡，五位 BCD 卡号。
//0x0B		EM4001 ID 卡，八位十六进制卡号。
//0x0C		ABA 通讯格式 HID 卡，五位 BCD 卡号。
//0x0D		ABA 通讯格式 HID 卡，十位 BCD 卡号。
//其他		保留。

//设置机具使用卡片卡号解析方式
function SetCardParseStyle(hPort: THandle; Style: PChar): Boolean; stdcall; external EASTRIVER_API
//Style的卡号解析格式如上面

//读取OEM机具型号
function ReadOEMMachineModel(hPort: THandle; Model: PChar): Boolean; stdcall; external EASTRIVER_API
//Model表示中文或英文机型，总共16个英文或8个汉字，前后可以有空格

//设置OEM机具型号
function SetOEMMachineModel(hPort: THandle; Model: PChar): Boolean; stdcall; external EASTRIVER_API
//Model表示中文或英文机型，总共16个英文或8个汉字，前后可以有空格

//IC卡访问身份验证密钥修改
function ModifyICAccessPassword(hPort: THandle; Style: Integer; OldPwd: PChar; NewPwd: PChar): Boolean; stdcall; external EASTRIVER_API
//参数Style确定信息类型，有效参数含义如下：
//    =1，表示修改普通消费机默认数据存贮区块访问身份验证密钥；
//    =2，表示修改积分、礼物兑换机默认数据存贮区块访问身份验证密钥。
//    OldPwd机具原密码， NewPwd: 机具新密码

//读取默认发卡区块设置
function ReadICSectorParameter(hPort: THandle; Style: Integer; Param: PChar): Boolean; stdcall; external EASTRIVER_API
//参数Style确定信息类型，有效参数含义如下：
//    =1，表示读取／设置普通消费机默认数据存贮区块参数；
//    =2，表示读取／设置积分、礼物兑换机默认数据存贮区块参数。
//参数Param确定参数信息，长度5位，格式：密钥认证方式(1位)+数据存贮块(2位)+分组信息(2位),有效参数含义如下：
//    密钥认证方式  =0，使用A密钥进行身份验证；=1，使用B密钥进行身份验证
//    数据存贮块 =扇区*4+2
//    分组信息 =0x10表示使用多对多分组，分组信息存贮在本扇区的第0块；
//              0x06表示使用一对多分组，分组信息存贮在本区块读取数据的第6字节（起始字节为第0字节）位置；
//              0x00表示不启用分组，
//              其他值保留将来使用
//

function SetICSectorParameter(hPort: THandle; Style: Integer; Param: PChar): Boolean; stdcall; external EASTRIVER_API
//参数信息同上

function ReadICCardStyle(hPort: THandle; Sector: Integer): Integer; stdcall; external EASTRIVER_API

//读卡信息
function ReadICCardInfo(hPort: THandle; CardStyle: Integer; Info: PChar; Sector: Integer): Boolean; stdcall; external EASTRIVER_API
  //埃及客户Style=0 卡号,姓名,卡余额,类型,分组,机号,消费时间,交易流水号,消费金额
  //690分   Style=1 卡号,姓名,卡余额,密码,卡次,累加消费额,累加消费次,当前消费月,当前消费日
  //680     Style=2 卡号,姓名,卡余额,卡次
  //880     Style=3 卡号,姓名
  //690角   Style=4 卡号,姓名,卡余额,密码,卡次,累加消费额,累加消费次,当前消费月,当前消费日

  //----------------------埃及客户------------------------------------//
//参数 CardStyle =0
//参数 Info格式如下：
//  卡号,姓名,类型,分组,机号,消费时间,交易流水号,卡余额,消费金额
//格式说明(每个数据间用逗号隔开)：
//  卡号最大为4,294,967,295
//  姓名最多10个英文字母或5个汉字姓名
//  类型01表示消费机卡  02表示积分卡
//  分组 0-255
//  机号
//  消费时间 yymmddhhnn 共10个数据，不带世纪年
//  交易流水号0-65535
//  卡余额，消费金额 0-167,772.15元
//-------------------------------------------------------------//

//----------------------690IC卡格式1.5版，精确到分-------------//
//参数 CardStyle =1
//参数 Info格式如下：
//  卡号,姓名,卡余额,密码,卡次,累加消费额,累加消费次,当前消费月,当前消费日
//格式说明(每个数据间用逗号隔开)：
//  卡号：最大为1048575
//  姓名：最多8个英文字母或4个汉字姓名
//  卡余额：0-16777215 ，精度为分
//  密码：6位数字
//  卡次：0-65535
//  累加消费额：0-16777215 精度为分
//  累加消费次：0-255
//  当前消费月：1-12
//  当前消费日：1-31
//-------------------------------------------------------------//

//写卡信息
function WriteICCardInfo(hPort: THandle; CardStyle: Integer; Info: PChar; Sector: Integer): Boolean; stdcall; external EASTRIVER_API
  //埃及客户Style=0 卡号,姓名,卡余额,类型,分组,机号,消费时间,交易流水号,消费金额
  //690C分  Style=1 卡号,姓名,卡余额,密码,卡次,累加消费额,累加消费次,当前消费月,当前餐段,当前消费日
  //680     Style=2 卡号,姓名,卡余额,卡次
  //880     Style=3 卡号
  //690角   Style=4 卡号,姓名,卡余额,密码,卡次,累加消费额,累加消费次,当前消费月,当前餐段,当前消费日
  //3.0卡   Style=5 卡号,姓名,卡余额,密码,卡次,累加消费额,累加消费次,当前消费月,当前餐段,当前消费日,消费流水,卡序号,分组
  //                分组格式：1-16，用数字连写，如：1组，10组则传0110
  //                密码：4位数字

/////////////埃及客户专用//////////////////

function DataToRecord(Style: Integer; Data: PChar; Records: PChar): Boolean; stdcall; external EASTRIVER_API
//转换原始数据到记录
//Style:不同的记录格式，说明如下：
//  1:880、889、890、980、981、985考勤 2:690C消费 3:690D消费 4:692 5:983
//Data:原始数据
//Records:转换后的数据，不同格式数据定义如下：
//  Style=1 :  卡号,标志,标识,时间
//       =2 :  卡号,余额,消费金额,卡次,标志,时间
//       =3 :  卡号,消费金额,时间
//       =4 :  卡号,余额,消费金额,流水号,终端机号,标志,时间
//       =5 :  卡号,标志,标识,状态,时间

function ReadCommDataString(hPort:THandle; Data: PChar): Integer; stdcall; external EASTRIVER_API
//实时读缓冲区数据
//Data返回的缓冲数据；函数结果返回的是已读取的缓冲区大小

function RealBackData(hPort: Thandle; Style: Integer; Data: PChar): Boolean; stdcall; external EASTRIVER_API
//此函数功能如下：
//功能一：
//     =4表示查义当前实时模式，Data返回当前机具实时模式，模式返回值意义如下
//     =0轮循应答刷卡结果被动上传实时模式
//     =1轮询应答刷卡操作被动上传实时模式
//     =2刷卡结果主动上传实时模式
//     =3刷卡操作主动上传实时模式
//功能二：
//     当Data为空时，Style=0至3，表示分别设置机具的实时模式，0至3的意义如上
//功能三：
//     当Data不为空时，Style的意义和Data的意义如下描述：
//     Style=0表示接收错误，重新读，Data传机号
//          =1轮循方式查记录，无刷卡操作时只回传机号，如果有卡号，则把机号、卡号通过Data传入，中间用逗号隔开
//          =2主动上传应答，只确认结果, 通过Data传入机号即可
//          =3刷卡操作主动上传，先返回卡号，然后按照屏幕上要显示的信息分别传，格式：机号,卡号,信息

//设置时间段函数
function SetTimePeriod(hPort: THandle; Period: PChar): Boolean; stdcall; external EASTRIVER_API
//参数Period格式：
//  时段个数(1个数字)+hhnn(开始时分)+hhnn(结束时分)+模式(1:普通；2:定值;3:菜单,1个数字)+金额(5个数字，针对定值,其它设为5个0)+保留1个数字+循环时段(从开始时段到保留数字)

//读取时间段信息
function ReadTimePeriod(hPort: THandle; Period: PChar): Boolean; stdcall; external EASTRIVER_API
//返回的Period参数格式同上

//打开时间段自动切换功能
function SetTimePeriodEnable(hPort: THandle; Flag: PChar): Boolean; stdcall; external EASTRIVER_API
//参数Flag格式，=1开启时间段自动切换功能，=0关闭时间段自动切换功能

//读取时间段自动切换功能
function ReadTimePeriodEnable(hPort: THandle; Flag: PChar): Boolean; stdcall; external EASTRIVER_API
//参数Flag返回的格式说明同上



function SetTimePeriodExt(hPort: THandle; Period:Pchar): Boolean; stdcall; external EASTRIVER_API
//设置消费卡分组信息
//参数Period格式：
//  组别(0..F其中0..7为非补贴，8..F为补贴，16进制数)+段次(1个数字（1..4），16进制数)+[金额(5个数字 10进制数)+ 金额(5个数字，10进制数)]+[两组金额]..
//数据样式：030001000100  0 组别；3段次；0001000100为金额，金额1为 1元，金额2为10元

function ReadTimePeriodExt(hPort: THandle;Period,ResultPeriod:Pchar): Boolean; stdcall; external EASTRIVER_API
//读消费卡分组信息
//参数说明
//参数Period格式 ：组别(0..F其中0..7为非补贴，8..F为补贴，16进制数)
//返回值：True成功，False 失败
//返回 ResultPeriod格式：
//  组别(0..F其中0..7为非补贴，8..F为补贴，16进制数)+段次(1个数字（1..4），16进制数)+[金额(5个数字 10进制数)+ 金额(5个数字，10进制数)]+[两组金额]..
//数据样式：030001000100  0 组别；3段次；0001000100为金额，金额1为 1元，金额2为10元
function ClearTimePeriodExt(hPort: THandle; Period:Pchar): Boolean; stdcall;external EASTRIVER_API
//清除消费卡分组信息
//参数说明
//参数Period格式 ：组别(0..F其中0..7为非补贴，8..F为补贴，16进制数)
//返回值：True成功，False 失败


{******************************************************************************
 SIm卡函数
 ******************************************************************************}
{******************************************************************************
查询Mifare接口是否存在卡；
******************************************************************************}
function SimCallClock(hPort: THandle): Boolean; stdcall; external EASTRIVER_API;

{******************************************************************************
 显式联机命令；
 参数说明:
 hPort        : 端口句柄,通过调用OpenCommPort函数得到
 clock_id     : 机号,允许值: 0-255, 由于机具上显示的机号实际上是两位16进制数
               所以机号范围16进制表示应该为: 0x00-0xFF
 返回值:
 True         : 联机成功
 False        : 联机失败                                      
 ******************************************************************************}
function SimRequest(hPort: THandle; SerialNo: PChar=nil): Boolean; stdcall; external EASTRIVER_API;

{******************************************************************************
 SIM认证；只有认证后才能进行读写块的操作
 参数：Sector=扇区
       PwdType=密码类型 1=A密码 0=B密码
       CheckType=认证类型 0=内部认证 6=使用指令所含密匙认证
       Pwd=当CheckType为6是使用
 ******************************************************************************}
function SimAuthentication(hPort: THandle; Sector: Integer; PwdType: Integer;
  CheckType: Integer; Pwd:string=''): Boolean; stdcall; external EASTRIVER_API;

{******************************************************************************
 读取验证过的扇区的块数据
 BlockID: 已认证的扇区的模块号
 Data：   16个字节的块数据；十六进制
 ******************************************************************************}
function SimGetBlockData(hPort: THandle; BlockID: Integer; Data: PChar): Boolean; stdcall; external EASTRIVER_API;

{******************************************************************************
 写块数据
 BlockID: 已认证的扇区的模块号
 Data：   16个字节的块数据；十六进制
 ******************************************************************************}
function SimSetBlockData(hPort: THandle; BlockID: Integer; Data: string): Boolean; stdcall; stdcall; external EASTRIVER_API;

{******************************************************************************
 读卡读取卡的账户信息，
 返回：用户名，卡号，金额，密码等
 ******************************************************************************}
function SimGetAccount(hPort: THandle; Sector: Integer;
  AuthPwd: string; UserName: PChar; CardID: PChar;
  var Account: Double; var ChargeCnt:Integer; Password: PChar): Boolean;
  stdcall; external EASTRIVER_API;

{******************************************************************************
 写的账户信息，
 返回：用户名，卡号，金额，密码等
 ******************************************************************************}
function SimSetAccount(hPort: THandle; Sector: Integer;
  AuthPwd: string; UserName: string; CardID: string;
  Account: Double; ChargeCnt:Integer; PassWord: string): Boolean; 
  stdcall; external EASTRIVER_API;
  
{******************************************************************************
 清除卡上信息
 ******************************************************************************}
function SimClearAccount(hPort: THandle; Sector: Integer; AuthPwd: string): Boolean; stdcall; external EASTRIVER_API;

{******************************************************************************
 增加钱 这样可以有SIM卡的交易记录
 ******************************************************************************}
function SimIncrement(hPort: THandle; BlockID: Integer; IncMoney: Double): Boolean; stdcall; external EASTRIVER_API;
{******************************************************************************
 减少钱  这样可以有SIM卡的交易记录
 ******************************************************************************}
function SimDecrement(hPort: THandle; BlockID: Integer; DecMoney: Double): Boolean; stdcall; external EASTRIVER_API;

{******************************************************************************
 传送
 ******************************************************************************}
function SimTransfer(hPort: THandle; BlockID: Integer): Boolean; stdcall; external EASTRIVER_API;

{******************************************************************************
 设置SIM卡的AB密码 ， 即：块3 ,设置AB相同
 ******************************************************************************}
function SimSetCardAB(hPort: THandle; Sector: Integer;
  NewAuthPwd: string; OldAuthPwd: string='FFFFFFFFFFFF'): Boolean; stdcall; external EASTRIVER_API;

//增加钱
function USBSimIncrement(BlockID: Integer; IncMoney: Double): Integer; stdcall; external EASTRIVER_API
//减少钱
function USBSimDecrement(BlockID: Integer; DecMoney: Double): Integer; stdcall; external EASTRIVER_API
//读块数据
function USBGetBlockData(BlockID: Integer; Data: PChar; CardType: Integer): Integer; stdcall; external EASTRIVER_API;
//写块数据
function USBSetBlockData(BlockID: Integer; Data: PChar; CardType: Integer): Integer; stdcall; external EASTRIVER_API;
//USB修改密码扇区
function USBSetPWDSECTOR(Sector: Integer; Data: PChar; CardType: Integer): Integer; stdcall; external EASTRIVER_API;
//修改设备密码类型 CmdType=0 A密码 =1 B密码
function USBSetDevicePWDType(CmdType: Integer=0): Integer; stdcall; external EASTRIVER_API
//USB的IC卡取款
function USBUnChargeICCard(BlockNo: Integer; Amount: Double): Integer; stdcall; external EASTRIVER_API
//USB的IC卡充值
function USBChargeICCard(BlockNo: Integer; Amount: Double): Integer; stdcall; external EASTRIVER_API

/////新设备新增函数 ，暂放
//function RealBatchData(PCLK: TClockInfo; var Records: array of TICRecord): integer; stdcall; external EASTRIVER_API;
function SelectClockID(ClockID: Integer): Boolean; stdcall; external EASTRIVER_API;

function SendComUsbCmd(hPort: THandle; Cmd: string; RcvBytes: PChar; CmdType: Word=$B8; Delay: Cardinal = 1000): Boolean; stdcall; external EASTRIVER_API;

//新协议PSAM卡透明传输命令
function SendUsbNewCmd(Cmd: Word; CmdData: string; RcvBytes: PChar; Delay: Cardinal = InitTimeOut): Boolean; stdcall; external EASTRIVER_API

function SimRequestSN(hPort: THandle; SerialNo: PChar=nil): Boolean; stdcall; external EASTRIVER_API;

//向串口发送透明命令
function SendComCmd(hPort: THandle; PData: Pchar; DataSize: Integer; RcvBytes: PChar; var BufSize: Integer; Delay: Cardinal= 1000): Boolean; stdcall; external EASTRIVER_API;

{*****************************************906多功能发卡器接口函数*********************************************}
//连接发卡器
function MFOpenReader(CommStyle, Port, BaudRate: Integer; Address: PChar; var hReader: Pointer): Boolean; stdcall; external OldEastRiver_API;

//关闭发卡器
function MFCloseReader(hReader: Pointer): Boolean; stdcall; external OldEastRiver_API;

//设置通讯密钥
function MFSetReaderKey(hReader: Pointer; NewKey: PChar; KeyLength: Integer): Boolean; stdcall; external OldEastRiver_API;

//读取读头版本
function CMGetReaderVer(hReader: Pointer; Ver: PChar; var BufSize: Integer): Boolean; stdcall; external OldEastRiver_API;

//查询卡片连接状态
function CMGetSimCardConnectState(hReader: Pointer; var State: Byte): Boolean; stdcall; external OldEastRiver_API;

//移动寻卡
function CMSeekSimCard(hReader: Pointer; CardSN: PChar; var BufSize: Integer): Boolean; stdcall; external OldEastRiver_API;

//用透传指令断开连接
function CMDisConnectSimCard(hReader: Pointer): Boolean; stdcall; external OldEastRiver_API;

//取随机数
function CMGetChallenge(hReader: Pointer; Challenge: PChar; var RandLen: Integer): Boolean; stdcall; external OldEastRiver_API;

type
  //一卡通应用的公共应用基本数据文件
  TOneCardBasicDataFile=packed record
    //发卡方标识
    PublisherID: array[0..7] of Byte;
    //应用类型标识
    AppTypeID: Byte;
    //发卡方应用版本
    AppVer: Byte;
    //应用序列号
    AppSN: array[0..7] of Byte;
    //应用启用日期
    OpenDate: DWORD;
    //应用有效日期
    ExpireDate: DWORD;
    //卡类型标识
    CardType: Byte;
    //发卡方自定义FCI数据
    FCI: array[0..2] of Byte;
  end;
  
//选择一卡通应用
function CMSelectOneCardApp(hReader: Pointer; var AppFile: TOneCardBasicDataFile): Boolean; stdcall; external OldEastRiver_API;

//查询子应用状态
function CMGetSubAppState(hReader: Pointer; EnterpriseID: PChar; SubAppID: Byte): Boolean; stdcall; external OldEastRiver_API;

//查询余额
function CMGetBalance(hReader: Pointer; EnterpriseID: PChar; SubAppID: Byte; var Balance, ExpireDate: DWORD): Boolean; stdcall; external OldEastRiver_API;

//移动读头APDU
function CMAPDU(hReader: Pointer; APDU, Answer: PChar; APDULen: Integer; var BufLen: Integer; var SW1SW2: Word): Boolean; stdcall; external OldEastRiver_API

//先寻IC卡，根据读头安装电信和移动模块的情况再寻电信卡或移动卡
function MFSeekCard(hReader: Pointer; var CardType: Byte; CardSN: PChar; var BufSize: Integer): Boolean; stdcall; external OldEastRiver_API;
//关闭卡片
function MFCloseCard(hReader: Pointer; CardType: Byte): Boolean; stdcall; external OldEastRiver_API;
//认证
function MFICAuthentication(hReader: Pointer; BlockNo, PwdType: Byte; AccessKey: PChar; KeyLen: Integer): Boolean; stdcall; external OldEastRiver_API;
//读块
function MFICReadBlock(hReader: Pointer; BlockNo: Byte; BlockData: PChar; var DataLen: Integer): Boolean; stdcall; external OldEastRiver_API;
//写块
function MFICWriteBlock(hReader: Pointer; BlockNo: Byte; BlockData: PChar; DataLen: Integer): Boolean; stdcall; external OldEastRiver_API;
//加值
function MFICIncrement(hReader: Pointer; BlockNo: Byte; Amount: DWORD): Boolean; stdcall; external OldEastRiver_API;
//减值
function MFICDecrement(hReader: Pointer; BlockNo: Byte; Amount: DWORD): Boolean; stdcall; external OldEastRiver_API;
//复制
function MFICDuplicate(hReader: Pointer; SrcBlockNo, DestBlockNo: Byte): Boolean; stdcall; external OldEastRiver_API;

//读AID
function CTGetReaderAID(hReader: Pointer; AID: PChar; var AIDLen: Integer): Boolean; stdcall; external OldEastRiver_API;
//写AID
function CTSetReaderAID(hReader: Pointer; AID: PChar; AIDLen: Integer): Boolean; stdcall; external OldEastRiver_API;
//电信透明指令
function CTReaderControl(hReader: Pointer; Cmd, Answer: PChar; CmdLen: Integer; var BufLen: Integer; var SW1SW2: Word): Boolean; stdcall; external OldEastRiver_API;
//function CT_Transparent_Begin(hReader: Pointer): Boolean; stdcall; external EASTRIVER_API;
//function CT_Transparent_End(hReader: Pointer): Boolean; stdcall; external EASTRIVER_API;
//UIM认证
//function MFUIMAuthentication(hReader: Pointer; BlockNo, PwdType: Byte; AccessKey: PChar; KeyLen: Integer): Boolean; stdcall; external EASTRIVER_API;

function SetGroupAID(hPort: THandle; szAID: PChar): Boolean; stdcall; external OldEastRiver_API;
function SetProvinceAID(hPort: THandle; szAID: PChar): Boolean; stdcall; external OldEastRiver_API;
function SetEnterpriseAID(hPort: THandle; szAID: PChar): Boolean; stdcall; external OldEastRiver_API;

function SetConsumeKey(hPort: THandle; szHexKey: PChar; IsDelete: Boolean=False): Boolean; stdcall; external OldEastRiver_API;
function SetChargeKey(hPort: THandle; szHexKey: PChar; IsDelete: Boolean=False): Boolean; stdcall; external OldEastRiver_API;
function SetTACKey(hPort: THandle; szHexKey: PChar; IsDelete: Boolean=False): Boolean; stdcall; external OldEastRiver_API;

//USb透明数据传输，参照SendComCmd
//function USBSendCmdData(PData: Pchar; DataSize: Integer; RcvBytes: PChar; var BufSize: Integer; Delay: Cardinal=InitTimeOut): Boolean; stdcall; external OldEastRiver_API;
function USBSetCardPWDAB(Sector: Integer; PasswardA: PChar; PasswardB: PChar; CardType: Integer): Integer; stdcall; external OldEastRiver_API;

//CPU卡透明传输
function CPUAPDU(hReader: Pointer; APDU, Answer: PChar; APDULen: Integer; var BufLen: Integer; var SW1SW2: Word): Boolean; stdcall; external OldEastRiver_API;
//复位CPU 卡
function CPUReset(hReader: Pointer; Answer: PChar; var BufLen: Integer): Boolean; stdcall; external OldEastRiver_API;
//HALT CPU 卡
function CPUHalt(hReader: Pointer): Boolean; stdcall; external OldEastRiver_API;
//外部认证
function CPUExternalAuth(hReader: Pointer; KeyID: Byte; KeyData: PChar; KeyLen: Integer; var SW1SW2: Word): Boolean; stdcall; external OldEastRiver_API;
//增加密钥
function CPUWriteKey(hReader: Pointer; KeyID, KeyType, UsePower, ChangePower, KeyVer, Alg_Err: Byte; AuthKey, NewKey: PChar; AuthKeyLen, NewKeyLen: Integer; var SW1SW2: Word): Boolean; stdcall; external OldEastRiver_API;
//替换密钥
function CPUUpdateKey(hReader: Pointer; KeyType, KeyID: Byte; AuthKey, NewKey: PChar; AuthKeyLen, NewKeyLen: Integer; var SW1SW2: Word): Boolean; stdcall; external OldEastRiver_API;
//取随机数
function CPUGetChallenge(hReader: Pointer; RandData: PChar; var nLen: Integer): Boolean; stdcall; external OldEastRiver_API;
//读硬件版本信息
function MFGetFirmVersion(hReader: Pointer; FirmVer: PChar; var nLen: Integer): Boolean; stdcall; external OldEastRiver_API;
//PSAM卡1复位
function PSAM1Reset(hReader: Pointer; Answer: PChar; var BufLen: Integer): Boolean; stdcall; external OldEastRiver_API;
//PSAM卡2复位
function PSAM2Reset(hReader: Pointer; Answer: PChar; var BufLen: Integer): Boolean; stdcall; external OldEastRiver_API;
//PSAM卡1透明传输
function PSAM1APDU(hReader: Pointer; APDU, Answer: PChar; APDULen: Integer; var BufLen: Integer; var SW1SW2: Word): Boolean; stdcall; external OldEastRiver_API;


///主动上传中，使用的结构体
type
  pDeviceData = ^DeviceData;
  DeviceData = record                                       // 设备刷卡数据
    cardno: array[0..19] of char;                           //卡号
    emp_no: array[0..16] of char;                           //工号
    emp_name: array[0..16] of char;                         //员工姓名
    dev_id: integer;                                        //机号
    mark: Integer;                                          //标识
    card_time: array[0..15] of char;                        //打卡时间
    consume: integer;                                       //金额单位角
    blanace: integer;                                       //余额单位角
    times: integer;                                         //充值次数
    flag: integer;                                          // 打卡标识
    dev_ver: integer;                                       //消费记录版本号
    POS_Sequ: integer;                                      //POS交易流水号
    Card_Sequ: integer;                                     //卡交易流水号
    Op_CardNo: array[0..9] of char;                         //操作员卡号
    OverPwd: array[0..9] of char;                           //超额消费密码
    reserved1: array[0..19] of char;                        // 保留
    reserved2: Cardinal;                                    // 用做班次标识
    CustomInfo1:array[0..15] of Char;                       //自定义信息1
    CustomInfo2:array[0..15] of Char;                       //自定义信息2
    CustomInfo3:array[0..15] of Char;                       //自定义信息3
    CustomInfo4:array[0..15] of Char;                       //自定义信息4
    Input1:integer;
    Input2:integer;
    Input3:integer;
  end;

  DeviceDataArray = array[0..15] of DeviceData;

/////主动上传用的回调函数
//type
//  FunOnRefreshDeviceState = procedure(Dev_id: integer; State: integer; RecordCount: integer);
//  FunOnRecieveRecord = procedure(Dev_id: integer; aRecord: DeviceData;var bReturnOK:boolean);


////主动上传 (>4G)
//Function StartUpLoad(vOnRefreshDeviceState:FunOnRefreshDeviceState;vOnRecieveRecord:FunOnRecieveRecord):integer; stdcall;  external EastRiver_API;
//procedure StopUpLoad; stdcall;   external EastRiver_API;
//function AddUpLoadDevice(DevId:integer;Ip: PChar;Port:integer): integer;  stdcall;  external EastRiver_API;
//function RemoveUpLoadDevice(DevId:integer): integer; stdcall; external EastRiver_API;

///搜索网络机器(>4G)
type
//TDeviceList类型结构体
  PConnParam = ^ConnParam;                                  ///连接参数
  ConnParam = record
    dev_id: Integer;                                        ///机号
    ComPort: Integer;                                       ///Com口
    ComBaudRate: integer;                                   //串行波特率
    IPAddress: array[0..15] of char;                        ///IP地址
    IPPort: Integer;                                        ///IP端口
    USBPath: array[0..127] of char;                          ///USB设备路径
    CommType: Integer;                                      ///通讯方式, 0:RS232,1:TCP/IP,2:UDP,3:USB

  end;

  PDeviceType = ^DeviceType;                                //设备类型
  DeviceType = record
    Version: double;                                        ///设备软件版本
    VerOrd:integer;                                         ///第几代协议
    DevType: integer;                                       ///设备型号
    Serial_Num: array[0..15] of char;                       ///设备序列号
    DevModel: Integer;                                      ///设备型号
    Cls: Integer;                                           ///读头类型, 0:ID, 1:IC,2:混合,3:CPU
    clocktype: integer;                                     //设备用途  考勤机 1:门禁机 2:消费机
    Devname: array[0..20] of char;                          //设备别名
    MAC:array[0..20] of char;                               //设备MAC地址
    //DevUse: integer;                                        //设备用途
  end;

 pDeviceRec = ^DeviceRec;                                  //
 DeviceRec = record                                        //设备对象结构
   DevType: DeviceType;                                    //设备类型
   pConnParam: ConnParam;                                  //设备连接参数
 end;

 TDeviceList = array[0..255] of DeviceRec;
 function SearchLanDevice(var Devices:TDeviceList;var DeviceCount:integer):boolean;stdcall; external EastRiver_API;

 type
////名单类型结构体
  pNameList = ^NameList;
  NameList =packed record
    listtype: Integer;                                      //名单类型 0 白名单 1 黑名单 2 门禁通行名单
    cardno: array[0..19] of char;                           //卡号
    emp_no: array[0..15] of char;                           //工号
    emp_name: array[0..15] of char;                         //员工姓名
    devid: Integer;                                         //设备id
    Week: integer;                                          //名单时间段
    TimePass: array[0..5] of Integer;                     //名单时间段
    //BeginTime:array [0..195] of Char;                       //名单时间段-开始时间
    //EndTime:array [0..195] of Char;                         //名单时间段-结束时间
    CustomInfo1:array[0..15] of Char;                       //自定义信息1
    CustomInfo2:array[0..15] of Char;                       //自定义信息2
    CustomInfo3:array[0..15] of Char;                       //自定义信息3
    CustomInfo4:array[0..15] of Char;                       //自定义信息4
  end;

  NameListArray = array[0..15] of NameList;                 //16条一组名单


///批量下载名单最大16条(>4G)
function DownLoadCardList(hPort: THandle; ListType: Integer; WeekTime: Integer; BeginTime: PChar; EndTime: PChar; CardList: PChar; EmpIdList: PChar; EmpNameList: PChar): Integer; stdcall;external EastRiver_API;
//ListType,名单类型,0,黑名单，1，白名单
//WeekTime,日期，位运算，127代表全星期，1，星期日，2，星期一，4，星期二，8，星期三，16，星期四，32，星期五，64，星期六
//BeginTime，EndTime, 开始时间，结束时间 ，默认全天，0000,2400； 08001400，12001800，代表 08:00-12:00, 14:00-18:00
//CardList,卡号列表，回车作为分隔符
//EmpIdList,工号列表，回车作为分隔符
//EmpNameList,姓名列表，回车作为分隔符

//读设备名单总数 (>4G)
function ReadListCardTotal(hPort: THandle;var ListCardTotal:integer;var WhiteCard:integer;var BlackCard:integer):boolean;stdcall;external EastRiver_API;
//ListCardTotal,名单存储空间(单位：条)
//WhiteCard，有效白名单总数
//BlackCard，有效黑名单总数

// 读设备名单(>4G)
function ReadDeviceListCard(hPort: THandle;FromPos: Integer; var RecordCount: Integer; var ListCards: NameListArray): Boolean;stdcall;external EastRiver_API;
//参数说明
//fmt:名单存储格式
//fromPos:从第几个开始
//RecordCount:读取的记录数,也是返回的记录数. 最大16条
//Records:返回的名单集.

//读已删除记录(>4G)
function BatchReadDelRecord(hPort: THandle;Control: integer; var RecordCount: Integer; var Records: array of TICRecord): boolean; stdcall;  external EastRiver_API;
//控制字，
const
  ReadDelRecord_Head = 1;                                   //从头读删除记录
  ReadDelRecord_Next = 2;                                   //读下一批记录
  ReadDelRecord_Retry = 3;                                  //重新读上一批记录
//请求返回的数量，最大为 16，也是实际返回的记录数
//Records， 记录集

type
////设备序列号类型，16个字节，最后一个字节固定为 #0
  TSerialType=Array [0..16] of Char;

  FunOnRefreshDeviceStateBySerial = procedure(Dev_id: integer;Serial:TSerialType; State: integer; RecordCount: integer);
  FunOnDeviceLogin=procedure(Dev_id:integer;Serial:TSerialType;ip:PChar;port:integer;
                   var Heartbeat:integer);
  FunOnRecieveBatchRecordBySerial=procedure(Dev_id: integer;Serial:TSerialType;index:integer;RecordCount:integer;Records: DeviceDataArray;var bReturnOK:boolean);


///主动上传(>4G)
function StartUpLoad(vListenPort:Integer):boolean; stdcall;   external EastRiver_API;
procedure SetUpLoadProc(vOnDeviceLogin:FunOnDeviceLogin;
              vOnRefreshDeviceState: FunOnRefreshDeviceStateBySerial;
                vOnRecieveBatchRecord: FunOnRecieveBatchRecordBySerial);  stdcall;   external EastRiver_API;
procedure StopUpLoad(); stdcall;  external EastRiver_API;
function DownLoadListCardbySerial(Serial:PChar;NameLists:NameListArray;Count:integer):integer;stdcall;    external EastRiver_API;


////读考勤机记录容量和有效记录数，(>4G)
function ReadDeviceRecordInfo(hPort: THandle; var RecordMax, RecordSave: Integer): boolean; stdcall;   external EastRiver_API;
////RecordMax:记录总容量
////RecordSave:有效记录数

////设置名单总容量(单位：条)   (>4G)
function SetListCardTotal(hPort: THandle;  var ListCardTotal: integer): boolean; stdcall;  external EastRiver_API;
///ListCardTotal:名单总数（单位：条）返回实际设置值，8的整数倍

////采集函数以文本形式输出 (每次最多取16条记录，缓冲区建议 2048 ) 仅为VB ， C#兼容
function BatchReadRecordAsString(hPort: THandle;  strRecords:PChar): Integer; stdcall; external EastRiver_API;

////顺序采集数据,不删除方式，以文本形式输出(每次最多取16条记录，缓冲区建议 2048 ) 仅为VB ， C#兼容
function BatchReadRecordNotDelAsString(hPort:THandle;StartPos:integer;var Recordcount:integer;  strRecords:PChar):boolean; stdcall;external EastRiver_API;

//读已删除记录(>4G)，以文本形式输出(每次最多取16条记录，缓冲区建议 2048 ) 仅为VB ， C#兼容
function BatchReadDelRecordAsString(hPort: THandle;Control: integer; var RecordCount: Integer;
 strRecords:PChar): boolean; stdcall; external EastRiver_API;
//控制字，
//const
//  ReadDelRecord_Head = 1;                                   //从头读删除记录
//  ReadDelRecord_Next = 2;                                   //读下一批记录
//  ReadDelRecord_Retry = 3;                                  //重新读上一批记录
//请求返回的数量，最大为 16，也是实际返回的记录数
//Records， 记录集

//不删除采集记录(>4G)
function BatchReadRecordNotDel(hPort:THandle;StartPos:integer;var Recordcount:integer;  var Records: array of TICRecord):boolean; stdcall; external EastRiver_API;
///StartPos：开始编号
///Recordcount:需要返回的记录数，最大16

////删除指定笔数的记录
function DeleteRecord(hPort:THandle;Count:integer):boolean; stdcall;  external EastRiver_API;
///删除记录数

// 读设备名单(>4G),以字符串输出，仅仅为C#,VB 兼容
function ReadDeviceListCardAsString(hPort: THandle;FromPos: Integer; var RecordCount: Integer; strListCards: PChar): Boolean;stdcall;  external EastRiver_API;
//参数说明
//fmt:名单存储格式
//fromPos:从第几个开始
//RecordCount:读取的记录数,也是返回的记录数. 最大16条

//****    显式联机命令  (<4G)
function QuickOldCallClock(hPort: THandle; clock_id: Integer): Boolean; stdcall; external EastRiver_API;
//参数说明:
// hPort        : 端口句柄,通过调用OpenCommPort函数得到
// clock_id     : 机号,允许值: 0-255, 由于机具上显示的机号实际上是两位16进制数
//                所以机号范围16进制表示应该为: 0x00-0xFF
//返回值:
// True         : 联机成功
// False        : 联机失败
//备注:
// "1G"机型不能重复联机
// 所有和机具通讯且没有带机号的函数都必须在联机后才能调用

///快速联机，已知机型的情况下联机
function QuickCallClock(hPort: THandle; clock_id: Integer;Is891:boolean): Boolean; stdcall;external EastRiver_API;


implementation


end.


