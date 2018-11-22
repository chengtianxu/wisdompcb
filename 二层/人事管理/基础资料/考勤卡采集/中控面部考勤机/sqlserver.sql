--员工考勤记录修改日志
CREATE TABLE CHECKEXACT (
        EXACTID INT IDENTITY(1,1) NOT NULL ,    --修改日志ID
	USERID INT NULL DEFAULT 0,              --员工ID号 
	CHECKTIME DATETIME NULL DEFAULT 0,      --签到/签退时间
	CHECKTYPE VARCHAR (2) NULL DEFAULT 0,   --原来的签到/签退标志：I-签到，O-签退
	ISADD SMALLINT NULL DEFAULT 0,          --是否新增的记录
	YUYIN VARCHAR (25) NULL ,               --修改考勤记录的原因
	ISMODIFY SMALLINT NULL DEFAULT 0,       --是否仅仅是修改原始记录
	ISDELETE SMALLINT NULL DEFAULT 0,       --是否是删除的记录
	INCOUNT SMALLINT NULL DEFAULT 0,        --是否恢复
	ISCOUNT SMALLINT NULL DEFAULT 0,        --
	MODIFYBY VARCHAR (20) NULL,             --操作员
	[DATE] DATETIME NULL,                   --操作时间          
        CONSTRAINT EXACTID PRIMARY KEY (EXACTID)
)
;

--签到/签退记录表
CREATE TABLE CHECKINOUT (               
	USERID INT NOT NULL ,                              --员工ID号     
	CHECKTIME DATETIME NOT NULL DEFAULT GETDATE(),     --签到/签退时间  
	CHECKTYPE VARCHAR (1) NULL DEFAULT 'I',            --签到/签退标志：I-签到，O-签退
	VERIFYCODE INT NULL DEFAULT 0,                     --验证方式：除256的余数表示签到的方式: 0-密码；1-指纹；2-卡。大于256表示该记录已经被确认，在于处理时不进行处理
	SENSORID VARCHAR (5) NULL,                         --采集数据的考勤终端/设备ID
        CONSTRAINT USERCHECKTIME PRIMARY KEY (USERID, CHECKTIME)
)
;

--部门表
CREATE TABLE DEPARTMENTS (                                 
	DEPTID INT IDENTITY(1,1) NOT NULL ,      --部门ID
	DEPTNAME VARCHAR (30) NULL ,             --部门名称
	SUPDEPTID INT NOT NULL DEFAULT 1,        --上级部门的ID              
        CONSTRAINT DEPTID PRIMARY KEY (DEPTID)
)
;

CREATE TABLE EXCNOTES (              
	USERID INT NULL ,
	ATTDATE DATETIME NULL ,
	NOTES VARCHAR (200) NULL
)  
;

--节假日表
CREATE TABLE HOLIDAYS (                            
	HOLIDAYID INT IDENTITY(1,1) NOT NULL ,   
	HOLIDAYNAME VARCHAR (20) NULL ,            
	HOLIDAYYEAR SMALLINT NULL ,                
	HOLIDAYMONTH SMALLINT NULL ,               
	HOLIDAYDAY SMALLINT NULL DEFAULT 1,                 
	STARTTIME DATETIME NULL ,                  
	DURATION SMALLINT NULL ,                   
	HOLIDAYTYPE SMALLINT NULL ,                
	XINBIE VARCHAR (4) NULL ,                     
	MINZU VARCHAR (50) NULL,                       
        CONSTRAINT HOLID PRIMARY KEY (HOLIDAYID)
)
;

--班次表
CREATE TABLE NUM_RUN (                              
	NUM_RUNID INT IDENTITY(1,1) NOT NULL ,      --班次ID号
	OLDID INT NULL DEFAULT -1,                  --          
	NAME VARCHAR (30) NOT NULL ,                --班次名称
	STARTDATE DATETIME NULL DEFAULT '2000-1-1', --起用日期                  
	ENDDATE DATETIME NULL DEFAULT '2099-12-31', --结束使用日期                    
	CYLE SMALLINT NULL DEFAULT 1,               --班次一次循环的周期         
	UNITS SMALLINT NULL DEFAULT 1,              --周期单位          
        CONSTRAINT NUMID PRIMARY KEY (NUM_RUNID)
)
;

--班次排班时段表
CREATE TABLE NUM_RUN_DEIL (                      
	NUM_RUNID SMALLINT NOT NULL ,           --班次的ID号     
	STARTTIME DATETIME NOT NULL ,           --开始时间     
	ENDTIME DATETIME NULL ,                 --结束时间 
	SDAYS SMALLINT NOT NULL ,               --开始日期     
	EDAYS SMALLINT NULL ,                   --结束日期
        SCHCLASSID INT NULL DEFAULT -1,         --时段所属的类别
        CONSTRAINT NUMID2 PRIMARY KEY (NUM_RUNID, SDAYS, STARTTIME)
)
;

--管理员权限设置表
CREATE TABLE SECURITYDETAILS (                 
	SECURITYDETAILID INT IDENTITY(1,1) NOT NULL ,
	USERID SMALLINT NULL ,
	DEPTID SMALLINT NULL ,
	SCHEDULE SMALLINT NULL ,
	USERINFO SMALLINT NULL ,
	ENROLLFINGERS SMALLINT NULL ,
	REPORTVIEW SMALLINT NULL ,
	REPORT VARCHAR (10) NULL,
        CONSTRAINT NAMEID2 PRIMARY KEY (SECURITYDETAILID)
)  
;

--轮班表
CREATE TABLE SHIFT (                           
	SHIFTID INT IDENTITY(1,1) NOT NULL ,            --轮班ID号
	NAME VARCHAR (20) NULL ,                        --轮班名称
	USHIFTID INT NULL DEFAULT -1,                   --  
	STARTDATE DATETIME NOT NULL DEFAULT '1900-1-1', --起用轮班的日期          
	ENDDATE DATETIME NULL DEFAULT '1900-12-31',     --结束时用轮班的日期            
	RUNNUM SMALLINT NULL DEFAULT 0,                 --该轮班中所含的班次数 0<x<13
	SCH1 INT NULL DEFAULT 0,                        --轮班的第一个班次 
	SCH2 INT NULL DEFAULT 0,                        --轮班的第二个班次 
	SCH3 INT NULL DEFAULT 0,                        --轮班的第三个班次
	SCH4 INT NULL DEFAULT 0,                        --轮班的第四个班次
	SCH5 INT NULL DEFAULT 0,                        --轮班的第五个班次
	SCH6 INT NULL DEFAULT 0,                        --轮班的第六个班次
	SCH7 INT NULL DEFAULT 0,                        --轮班的第七个班次
	SCH8 INT NULL DEFAULT 0,                        --轮班的第八个班次
	SCH9 INT NULL DEFAULT 0,                        --轮班的第九个班次
	SCH10 INT NULL DEFAULT 0,                       --轮班的第十个班次
	SCH11 INT NULL DEFAULT 0,                       --轮班的第十一个班次
	SCH12 INT NULL DEFAULT 0,                       --轮班的第十二个班次
	CYCLE SMALLINT NULL DEFAULT 0,                  --轮班周期
	UNITS SMALLINT NULL DEFAULT 0 ,                 --周期单位
        CONSTRAINT SHIFTS PRIMARY KEY (SHIFTID)
)  
;

--员工登记指纹表
CREATE TABLE TEMPLATE (                           
	TEMPLATEID INT IDENTITY(1,1) NOT NULL ,    --指纹ID号
	USERID INT NOT NULL ,                      --员工ID号
	FINGERID INT NOT NULL ,                    --手指ID号，0-9分别表示右手拇指、右手食指、……、左手无名指、左手小指等
	TEMPLATE image NOT NULL ,                  --指纹模板1
	TEMPLATE2 image NULL ,                     --指纹模板2
	TEMPLATE3 image NULL ,                     --指纹模板3
	BITMAPPICTURE image NULL ,                 --登记的指纹图像1
	BITMAPPICTURE2 image NULL ,                --登记的指纹图像2  
	BITMAPPICTURE3 image NULL ,                --登记的指纹图像3  
	BITMAPPICTURE4 image NULL ,                --登记的指纹图像4  
	USETYPE SMALLINT NULL ,                    --指纹模板的用法，Bit0表示仅作备份不比对，Bit1表示指纹比对时使用低识别门限  
        CONSTRAINT TEMPLATED PRIMARY KEY (TEMPLATEID)
)
;

--员工排班表
CREATE TABLE USER_OF_RUN (              
	USERID INT NOT NULL ,                           --员工ID号
	NUM_OF_RUN_ID INT not NULL ,                    --班次或轮班ID号
	STARTDATE DATETIME not NULL DEFAULT '1900-1-1', --起用班次的日期         
	ENDDATE DATETIME not NULL DEFAULT '2099-12-31', --结束使用该班次的日期           
	ISNOTOF_RUN INT NULL DEFAULT 0,                 --是否轮班 
	ORDER_RUN INT NULL ,                            --轮班的起始班次
        CONSTRAINT USER_ST_NUM PRIMARY KEY (USERID, NUM_OF_RUN_ID, STARTDATE, ENDDATE)
)
;

--员工考勤例外（请假/公出）表
CREATE TABLE USER_SPEDAY (                    			
	USERID INT NOT NULL ,                                   --员工ID号
	STARTSPECDAY DATETIME NOT NULL DEFAULT '1900-1-1',      --开始日期    
	ENDSPECDAY DATETIME NULL DEFAULT '2099-12-31',          --结束日期  
	DATEID SMALLINT not NULL DEFAULT -1,                    --例外类型，999为公出，-1为注释
	YUANYING VARCHAR (200) NULL ,                           --例外的原因
	[DATE] DATETIME NULL ,                                  --登记/输入记录的时间 
        CONSTRAINT USER_SEP PRIMARY KEY (USERID, STARTSPECDAY, DATEID)
)
;

--员工临时排班表
CREATE TABLE USER_TEMP_SCH (                  
	USERID INT not NULL ,                     --员工ID号
	COMETIME DATETIME not NULL ,              --上班时间
	LEAVETIME DATETIME not NULL ,             --下班时间  
        OVERTIME INT not NULL DEFAULT 0,           --该时段中计算加班的时间 
	[TYPE] SMALLINT NULL DEFAULT 0,           --类型       
	FLAG SMALLINT NULL DEFAULT 1,             --标志
        SCHCLASSID INT NULL DEFAULT -1,           --该时段所属时段类别ID号，-1表示自动判别
        CONSTRAINT USER_TEMP PRIMARY KEY (USERID, COMETIME, LEAVETIME)

)
;

--员工信息表
CREATE TABLE USERINFO (                      
	USERID INT IDENTITY(1,1) NOT NULL ,     --员工ID号
	BADGENUMBER VARCHAR (12) NOT NULL ,     --考勤号码    
	SSN VARCHAR (20) NULL ,                 --身份证/证件号
	NAME VARCHAR (20) NULL ,                --姓名
	GENDER VARCHAR (2) NULL ,               --性别
	TITLE VARCHAR (20) NULL ,               --职务
	PAGER VARCHAR (20) NULL ,               --移动电话/传呼机
	BIRTHDAY DATETIME NULL ,                --生日
	HIREDDAY DATETIME NULL ,                --参加工作日期
	STREET VARCHAR (40) NULL ,              --家庭地址
	CITY VARCHAR (2) NULL ,                 --市代码
	STATE VARCHAR (2) NULL ,                --省代码
	ZIP VARCHAR (12) NULL ,                 --邮编
	OPHONE VARCHAR (20) NULL ,              --办公电话   
	FPHONE VARCHAR (20) NULL ,              --家庭电话
	VERIFICATIONMETHOD SMALLINT NULL ,      --验证方式
	DEFAULTDEPTID SMALLINT NULL  DEFAULT 1, --所属部门ID号
	SECURITYFLAGS SMALLINT NULL ,           --管理员标志
	ATT SMALLINT NOT NULL DEFAULT 1,        --考勤有效
	INLATE SMALLINT NOT NULL DEFAULT 1,     --计迟到               
	OUTEARLY SMALLINT NOT NULL DEFAULT 1,   --计早退                
	OVERTIME SMALLINT NOT NULL DEFAULT 1,   --计加班                 
	SEP SMALLINT NOT NULL DEFAULT 1,        --             
	HOLIDAY SMALLINT NOT NULL DEFAULT 1,    --假日休息             
	MINZU VARCHAR (8) NULL ,                --民族
	[PASSWORD] VARCHAR (20) NULL ,          --口令
	LUNCHDURATION SMALLINT NOT NULL DEFAULT 1, --有午休
        MVerifyPass VARCHAR(10) NULL,           --考勤验证密码
	PHOTO Image NULL,                       --照片  
        CONSTRAINT USERIDS PRIMARY KEY (USERID)
)
;


CREATE  UNIQUE  INDEX USERFINGER ON TEMPLATE(USERID, FINGERID)
;

CREATE  UNIQUE  INDEX HOLIDAYNAME ON HOLIDAYS(HOLIDAYNAME)
;

CREATE  INDEX DEPTNAME ON DEPARTMENTS(DEPTNAME)
;

CREATE  UNIQUE  INDEX EXCNOTE ON EXCNOTES(USERID, ATTDATE)
;

CREATE  UNIQUE  INDEX BADGENUMBER ON USERINFO(BADGENUMBER)
;

INSERT INTO DEPARTMENTS (DEPTNAME, SUPDEPTID) VALUES('总公司',0)
;

--假类表
Create Table LeaveClass(
  LeaveId INT Identity(1,1) not null primary key,  --假类ID号
  LeaveName VARCHAR(20) not null,                  --假类名称
  MinUnit float not null default 1,                --最小统计单位
  Unit smallint not null default 1,                --统计单位
  RemaindProc smallint not null default 1,         --舍入控制
  RemaindCount smallint not null default 1,        --统计时累计
  ReportSymbol varchar(4) not null default '-',    --报表中的表示符号
  Deduct float not null default 0,                 --
  Color int not null default 0,                    --显示颜色
  Classify SMALLINT NOT null default 0)            --计算类别，~bit7-是否计算为请假
;

--统计项目表
Create Table LeaveClass1(
  LeaveId INT Identity(999,1) not null primary key, --999-公出
  LeaveName VARCHAR(20) not null,
  MinUnit float not null default 1,
  Unit smallint not null default 0,
  RemaindProc smallint not null default 2,
  RemaindCount smallint not null default 1,
  ReportSymbol varchar(4) not null default '_',
  Deduct float not null default 0,
  LeaveType SMALLINT not null default 0,             --bit0-是否统计项；bit1-是否异常情况项；
  Color int not null default 0,
  Classify SMALLINT not null default 0,              --计算类别，bit0-按班次时段分类；bit1-按节假日分类
  Calc text null)                                    --计算单位
;

--班次时段类别设置表
CREATE TABLE SchClass(
  schClassid INT identity(1,1) NOT NULL PRIMARY KEY, --时段类别ID号
  schName VARCHAR(20) NOT null,                      --时段类别名称 
  StartTime datetime NOT NULL,                       --起始时间
  EndTime datetime NOT NULL,                         --结束时间
  LateMinutes int null,                              --计迟到分钟数
  EarlyMinutes int null,                             --计早退分钟数 
  CheckIn int null default 1,                        --该时段上班需要签到
  CheckOut int null default 1,                       --该时段下班需要签退
  CheckInTime1 datetime NULL,                        --开始签到时间  
  CheckInTime2 datetime NULL,                        --结束签到时间      
  CheckOutTime1 datetime NULL,                       --开始签退时间   
  CheckOutTime2 datetime NULL,                       --结束签退时间
  Color Int NULL default 16715535,                   --表示颜色 
  AutoBind SMALLINT NULL DEFAULT 1)                  --   
;

--系统参数表
Create Table AttParam(
  PARANAME VARCHAR (20) NOT NULL Primary key,
  PARATYPE VARCHAR (2) NULL ,
  PARAVALUE VARCHAR(100) NOT NULL)
;
insert into LeaveClass(LeaveName, Unit, ReportSymbol, Color) 
  values('病假', 1, 'B', 3398744);
insert into LeaveClass(LeaveName, Unit, ReportSymbol, Color) 
  values('事假', 1, 'S', 8421631);
insert into LeaveClass(LeaveName, Unit, ReportSymbol, Color) 
  values('探亲假', 1, 'T', 16744576);
insert into LeaveClass1(LeaveName, MinUnit, Unit, RemaindProc,
  RemaindCount, ReportSymbol, LeaveType, Calc)
  values('公出', 0.5, 3, 1, 1, 'G', 3, 'if(AttItem(LeaveType1)=999,AttItem(LeaveTime1),0)+if(AttItem(LeaveType2)=999,AttItem(LeaveTime2),0)+if(AttItem(LeaveType3)=999,AttItem(LeaveTime3),0)+if(AttItem(LeaveType4)=999,AttItem(LeaveTime4),0)+if(AttItem(LeaveType5)=999,AttItem(LeaveTime5),0)');
insert into LeaveClass1(LeaveName, MinUnit, Unit, RemaindProc,
  RemaindCount, ReportSymbol, LeaveType)
  values('正常', 0.5, 3, 1, 0, ' ', 3);
insert into LeaveClass1(LeaveName, MinUnit, Unit, RemaindProc,
  RemaindCount, ReportSymbol, LeaveType, Calc)
  values('迟到', 10, 2, 2, 1, '>', 3, 'AttItem(minLater)');
insert into LeaveClass1(LeaveName, MinUnit, Unit, RemaindProc,
  RemaindCount, ReportSymbol, LeaveType, Calc)
  values('早退', 10, 2, 2, 1, '<', 3, 'AttItem(minEarly)');
insert into LeaveClass1(LeaveName, MinUnit, Unit, RemaindProc,
  RemaindCount, ReportSymbol, LeaveType, Calc)
  values('请假', 1, 1, 1, 1, '假', 3, 
  'if((AttItem(LeaveType1)>0) and (AttItem(LeaveType1)<999),AttItem(LeaveTime1),0)+if((AttItem(LeaveType2)>0) and (AttItem(LeaveType2)<999),AttItem(LeaveTime2),0)+if((AttItem(LeaveType3)>0) and (AttItem(LeaveType3)<999),AttItem(LeaveTime3),0)+if((AttItem(LeaveType4)>0) and (AttItem(LeaveType4)<999),AttItem(LeaveTime4),0)+if((AttItem(LeaveType5)>0) and (AttItem(LeaveType5)<999),AttItem(LeaveTime5),0)');
insert into LeaveClass1(LeaveName, MinUnit, Unit, RemaindProc,
  RemaindCount, ReportSymbol, LeaveType, Calc)
  values('旷工', 0.5, 3, 1, 0, '旷', 3, 'AttItem(MinAbsent)');
insert into LeaveClass1(LeaveName, MinUnit, Unit, RemaindProc,
  RemaindCount, ReportSymbol, LeaveType, Calc)
  values('加班', 1, 1, 1, 1, '+', 3, 'AttItem(MinOverTime)');
insert into LeaveClass1(LeaveName, MinUnit, Unit, RemaindProc,
  RemaindCount, ReportSymbol, LeaveType, Calc)
  values('节日加班', 1, 1, 0, 1, '=', 0, 'if(HolidayId(1)=1, AttItem(MinOverTime),0)');
insert into LeaveClass1(LeaveName, MinUnit, Unit, RemaindProc,
  RemaindCount, ReportSymbol, LeaveType)
  values('休息日', 0.5, 3, 2, 1, '-', 2);
insert into LeaveClass1(LeaveName, MinUnit, Unit, RemaindProc,
  RemaindCount, ReportSymbol, LeaveType, Calc)
  values('未签到', 1, 4, 2, 1, '[', 2, 
  'If(AttItem(CheckIn)=null,If(AttItem(OnDuty)=null,0,if(((AttItem(LeaveStart1)=null) or (AttItem(LeaveStart1)>AttItem(OnDuty))) and AttItem(DutyOn),1,0)),0)');
insert into LeaveClass1(LeaveName, MinUnit, Unit, RemaindProc,
  RemaindCount, ReportSymbol, LeaveType, Calc)
  values('未签退', 1, 4, 2, 1, ']', 2, 
  'If(AttItem(CheckOut)=null,If(AttItem(OffDuty)=null,0,if((AttItem(LeaveEnd1)=null) or (AttItem(LeaveEnd1)<AttItem(OffDuty)),if((AttItem(LeaveEnd2)=null) or (AttItem(LeaveEnd2)<AttItem(OffDuty)),if(((AttItem(LeaveEnd3)=null) or (AttItem(LeaveEnd3)<AttItem(OffDuty))) and AttItem(DutyOff),1,0),0),0)),0)');
insert into LeaveClass1(LeaveName, MinUnit, Unit, RemaindProc,
  RemaindCount, ReportSymbol, LeaveType)
  values('离岗未签到', 1, 4, 2, 1, '{', 3);
insert into LeaveClass1(LeaveName, MinUnit, Unit, RemaindProc,
  RemaindCount, ReportSymbol, LeaveType)
  values('离岗未签退', 1, 4, 2, 1, '}', 3);
insert into LeaveClass1(LeaveName, MinUnit, Unit, RemaindProc,
  RemaindCount, ReportSymbol, LeaveType)
  values('离岗', 1, 1, 2, 1, 'L', 3);

insert into AttParam(ParaName,ParaValue) values('MinsEarly',5);
insert into AttParam(ParaName,ParaValue) values('MinsLate',10);
insert into AttParam(ParaName,ParaValue) values('MinsNoBreakIn',60);
insert into AttParam(ParaName,ParaValue) values('MinsNoBreakOut',60);
insert into AttParam(ParaName,ParaValue) values('MinsNoIn',60);
insert into AttParam(ParaName,ParaValue) values('MinsNoLeave',60);
insert into AttParam(ParaName,ParaValue) values('MinsNotOverTime',60);
insert into AttParam(ParaName,ParaValue) values('MinsWorkDay',420);
insert into AttParam(ParaName,ParaValue) values('NoBreakIn',1012);
insert into AttParam(ParaName,ParaValue) values('NoBreakOut',1012);
insert into AttParam(ParaName,ParaValue) values('NoIn',1001);
insert into AttParam(ParaName,ParaValue) values('NoLeave',1002);
insert into AttParam(ParaName,ParaValue) values('OutOverTime',0);
insert into AttParam(ParaName,ParaValue) values('TwoDay',0);
insert into AttParam(ParaName,ParaValue) values('CheckInColor',16777151);
insert into AttParam(ParaName,ParaValue) values('CheckOutColor',12910591);
insert into AttParam(ParaName,ParaValue) values('DBVersion',167);
