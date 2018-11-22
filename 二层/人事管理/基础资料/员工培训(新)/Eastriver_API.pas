unit Eastriver_API;

interface
uses
  Windows, SysUtils, Classes;

const
  DLL_NAME = 'EastRiver.dll';

type
    ////名单类型结构体
    pNameList = ^NameList;
    NameList =packed record
    listtype: Integer;
    //名单类型 1 考勤白名单 0 黑名单 2 门禁白名单，12,补贴名单
    //17，已删除白名单，16，已删除黑名单，18,已删除门禁名单

    cardno: array[0..19] of char;        //卡号
    emp_no: array[0..15] of char;        //工号
    emp_name: array[0..15] of char;      //员工姓名
    devid: Integer;                      //设备id
    Week: integer;                       //名单时间段
    TimePass: array[0..5] of Integer;    //名单时间段
    CustomInfo1:array[0..31] of Char;    //自定义信息1
    CustomInfo2:array[0..31] of Char;    //自定义信息2
    CustomInfo3:array[0..31] of Char;    //自定义信息3
    CustomInfo4:array[0..31] of Char;    //自定义信息4

    /////门禁机新增
    Password:array [0..3] of Char;       //个人密码
    Right:integer;                       //名单权限

    /////消费机
    allowance:integer;                                   //补贴金额    4字节
    allowance_time:integer;                              //补贴次数    4字节
    allowanceType:integer;                               //补贴类型    1字节
    backnametimes:integer;                             //黑名单次数  (1个字节)

    AllowanceStart:array [0..7] of Char;               //补贴开始日期 YYYYMMDD
    AllowanceEnd:array [0..7] of Char;                 //补贴结束日期 YYYYMMDD


    BeginPass:array [0..19] of Char;                   ///门禁名单用的开始时间,例如08001400,当TimePass为0时启用,否则使用TimePass
    EndPass:array [0..19] of Char;                     ///门禁名单用的结束时间,例如14001600,当TimePass为0时启用,否则使用TimePass
    ////保留字段
    CSN:array [0..8] of Char;                          //物理卡ID号(4个字节，HEX码)
    KeepFields:array [0..50] of Char;                  //保留字段
  end;
  TNameListArray = array[0..15] of NameList;                 //16条一组名单


  PICRecord=^TICRecord;
  TICRecord=packed record
    Card: array[0..19] of char; // 卡号字符串
    timeString: array[0..19] of char; // 14位刷卡时间字符串, 格式为yyyymmddhhnnss
    EmpId: array[0..9] of char;
    mark: Integer; // 读卡机标识字符
    flag: Integer; // 存储卡的结果
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
    retranType:Integer;
    reserved4: array[0..92] of Char; // 机上原始数据
    Clock_id:Integer;
  end;

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

  P690ReadData=^T690ReadData;
  T690ReadData=packed record
    Verify_Error: Boolean;                                  //此记录校验是否正确, 由用户处理,
    //如果记录校验错误且需继续读返回一条记录则需重置为False
    CardNo: array[0..19] of char;                           //卡号(20个字节,以0结束字符串)
    TimeString: array[0..19] of char;                       //时间(20个字节,以0结束字符串)
    flag: Integer;                                          //打卡结果
    Consume: Integer;                                       //消费金额,单位分
    Balance: Integer;                                       //消费后余额,单位分
    Times: Integer;                                         //充值次数
    Record_Total: Integer;                                  //采集数据的总记录数
    Record_Index: Integer;                                  //当前记录是第几条记录

    //新增成员

    Clock_ver: Integer;                                     //消费记录版本号
    Clock_ID: Integer;                                      //机号
    POS_Sequ: Integer;                                      //POS交易流水号
    Card_Sequ: Integer;                                     //卡交易流水号
    Order_ID: Integer;                                      //卡重用顺序号
    Op_CardNo: array[0..19] of Char;                        //POS机操作员卡号
    Date_ver: array[0..19] of Char;                         //时间版本号
    OverPwd: array[0..9] of char;                           // 超额消费密码
    reserved1: DWORD;                                       //983返回的是状态
    reserved2: DWORD;
    reserved3: array[0..19] of Char;                        // 保留
    reserved4: array[0..99] of Char;                       // 保留
    ReaderNo:Byte;   //读头号

    //订餐扩展
    OrderMonth   : Integer;  //订餐月
    OrderDay     : Integer;  //订餐日
    OrderDinings : array[0..100] of char; //订餐表
    Dins         : Integer;

    //消费机新增
    transcount:integer;                                     //交易前金额 分  返回交易额(4字节)
    retransta: integer;                                     //返回交易状态(1字节)
    retranType: integer;                                    //返回交易类型
    Enterp_ID:  array[0..11] of char;                        //返回企业ID (6字节)
    Car_type : integer;                                     //返回卡类型标识（1字节）（0x00：普通IC卡，0x01：(U)SIM卡）
    emp_flowid: integer;                                   //返回   移动卡：企业员工流水号（4字节）
    pocket_index: integer;                                  //返回钱包子应用索引号(1字节)
    pocket_applytype:  integer;                             //返回应用类型标识（1 字节）  0x01：全国钱包；0x04：省钱包；0x08：企业钱包
    pocket_remainType:  integer;                           //返回钱包余额类型（1字节）  0x00：企业补贴；0x01：个人充值；退费、消费定为0xFF
    allowance_method: integer;                            //返回补贴方式（1字节） 移动卡：0x00覆盖, 0x01累加，当钱包余额类型为企业补贴时有效。无效时为0xFF
                                                          //电信卡： 0x00表示消费;	0x01表示标准出纳模式; 0x02表示清零补贴模式;   0x03表示累加补贴模式; 0x04 表示消费撤销
    allowance_time:integer;                              //	返回电信卡，自动补贴批次（2字节）    非自动补贴暂时为0，大端格式，高字节在前，低字节在后
    pocket_type: integer;                                //  返回钱包类型(1字节)   0x01：有限余额；0x02：不限余额  0x11：有限次；0x12：不限次
    Car_TAC    :array [0..7]of char;                     //返回电信卡，TAC(4字节)
    oper_id : integer;                                    //返回操作员编码（2字节），01-98相当于0x0001-0x0098
    dev_ver: integer;                                     //消费记录版本号  记录版本(1字节)    电信卡：0x01；移动卡：0x02

    AllowanceBalance:integer;                             ///补贴余额
    CargoResult:integer;                                  ///出货结果,0表示正常出货，1表示出货故障，255表示出货中
  end;
  PReadData=P690ReadData;//按需要更改声明
  TReadData=T690ReadData;//按需要更改声明

  //      数据处理回调函数
  TDataProcess = function(lpData: Pointer; lpReadData: PReadData): Boolean;stdcall;
  // lpData       : 自定义变量, 对应ReadAllRecord()的第二个参数
  // lpReadData   : 记录结构指针
  //返回值:
  //如果需要返回下一条记录则返回True, 如果需要中止数据读取可返回False,

  TTimeLapse = procedure(lpData: Pointer; microsecond: Integer);stdcall;  

  API_OpenClientSocket = function (RemoteAddr: PChar; Port: Integer):THandle; stdcall;  //打开TCP/IP通讯端口
  API_ReadClockTime = function (hPort: THandle; var CurTime: Double): Boolean; stdcall;//读取时间
  API_ClosePortHandle = function (hPort: THandle): Boolean;stdcall;  //关闭端口句柄
  API_CallClock = function (hPort: THandle; clock_id: Integer): Boolean; stdcall;   //联机函数
  API_UnCallClock = function (hPort: THandle): Boolean; stdcall;         //脱机函数
  API_ReadClockRecordTotal = function (hPort: THandle; var data: Integer): Boolean;stdcall;
  API_ReadAllRecord = function (hPort: THandle; lpData: Pointer; DataProcess: TDataProcess; Wait:TTimeLapse=nil): Integer;stdcall;//按帧(一帧400条)读取机具所有记录
  API_ClearAllReadCard = function (hPort: THandle): Boolean; stdcall ;//清除所有考勤记录
  API_ReadListCardTotal = function (hPort: THandle;var ListCardTotal:integer;var WhiteCard:integer;var BlackCard:integer):boolean;stdcall;
  API_ReadDeviceListCard = function (hPort: THandle;FromPos: Integer; var RecordCount: Integer; var ListCards: TNameListArray): Boolean;stdcall;
  //参数说明
  //fmt:名单存储格式
  //fromPos:从第几个开始
  //RecordCount:读取的记录数,也是返回的记录数. 最大16条
  //Records:返回的名单集.
  API_ClearAllNamelist = function (hPort:THandle):Integer;stdcall;
  API_SetAllowedCard = function (hPort: THandle; card, empid, EmpName: PChar): Boolean;stdcall;
  API_SetClockTime = function (hPort: THandle; SetTime: Double): Boolean; stdcall;
implementation

end.
