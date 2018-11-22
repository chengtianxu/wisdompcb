unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    Conn: TADOConnection;
    AQery704: TADOQuery;
    ADS705: TADODataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    AQery704RKEY: TIntegerField;
    AQery704YJH: TIntegerField;
    AQery704MJH: TIntegerField;
    AQery704MJHJE: TBCDField;
    AQery704YJHJE: TBCDField;
    AQery704LJJE: TBCDField;
    AQery704SQJHJE: TBCDField;
    AQery704SQWCJE: TBCDField;
    AQery704BQMBJE: TBCDField;
    AQery704BQJHJE: TBCDField;
    AQery704status: TIntegerField;
    AQery704CJRPTR: TIntegerField;
    AQery704CJRQ: TDateTimeField;
    AQery704Note: TStringField;
    ADS705RKEY: TIntegerField;
    ADS705ptr704: TIntegerField;
    ADS705PTR10: TIntegerField;
    ADS705BQJHDD: TBCDField;
    ADS705BQJHYP: TIntegerField;
    ADS705BQJHJE: TBCDField;
    ADS705ZYCL: TStringField;
    ADS705XYSTATUS: TIntegerField;
    ADS705ABBR_NAME: TStringField;
    AQery704CStatus: TStringField;
    AQery704EMPLOYEE_NAME: TStringField;
    ADS705CXYSTATUS: TStringField;
    ADS706: TADODataSet;
    ADS706RKEY: TIntegerField;
    ADS706PTR704: TIntegerField;
    ADS706PTR10: TIntegerField;
    ADS706KHMC: TStringField;
    ADS706GMRS: TIntegerField;
    ADS706ZYCP: TStringField;
    ADS706PCBYL: TBCDField;
    ADS706TXDZ: TStringField;
    ADS706TXDH: TStringField;
    ADS706TXRXM: TStringField;
    ADS706HZYX: TIntegerField;
    ADS706CHZYX: TStringField;
    ADS707: TADODataSet;
    ADS707RKEY: TIntegerField;
    ADS707PTR: TIntegerField;
    ADS707PTR10: TIntegerField;
    ADS707HJYS: TBCDField;
    ADS707DQYS: TBCDField;
    ADS707JHYS: TBCDField;
    ADS707JHRQ: TDateTimeField;
    ADS707HZSTATUS: TIntegerField;
    ADS707ABBR_NAME: TStringField;
    ADS707CHZSTATUS: TStringField;
    AQery: TADOQuery;
    AQery704YZNBL: TBCDField;
    AQery704YWWJE: TBCDField;
    AQery704WWZNBL: TBCDField;
    AQery704SQXCJE: TBCDField;
    AQery704SQWCBL: TBCDField;
    AQery704BQXCJE: TBCDField;
    AQery704BQJHBL: TBCDField;
    ADS705CPSL: TBCDField;
    ADS705PTR5: TIntegerField;
    ADS707CQTS: TBCDField;
    AQery704EMPL_CODE: TStringField;
    ADS705CCPStatus: TStringField;
    ADS705CPStatus: TIntegerField;
    AQery704JHID: TStringField;
    AQery4: TADOQuery;
    AQery5: TADOQuery;
    AQery704CZYStatus: TStringField;
    AQery704ZYStatus: TIntegerField;
    AQery704ZYRBM: TIntegerField;
    AQery704DEPT_NAME: TStringField;
    AQery704DEPT_CODE: TStringField;
    AQery5RKEY: TAutoIncField;
    AQery5EMPL_CODE: TStringField;
    AQery5EMPLOYEE_NAME: TStringField;
    AQery5EMPLOYEE_ID: TIntegerField;
    AQery5popedom: TWordField;
    AQery5ZY: TStringField;
    AQery5BMRKY: TAutoIncField;
    procedure AQery704CalcFields(DataSet: TDataSet);
    procedure ADS705CalcFields(DataSet: TDataSet);
    procedure ADS706CalcFields(DataSet: TDataSet);
    procedure ADS707CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}
//销售目标
procedure TDM.AQery704CalcFields(DataSet: TDataSet);
begin
 case dm.AQery704.FieldByName('status').Value of
  0: dm.AQery704.FieldValues['cstatus']:='优秀';
  1: dm.AQery704.FieldValues['cstatus']:='一般';
  2: dm.AQery704.FieldValues['cstatus']:='差';
 end;
 // 职位
 case  dm.AQery704.FieldByName('ZYStatus').Value of
  0: dm.AQery704.FieldValues['CZYStatus']:='无';
  1: dm.AQery704.FieldValues['CZYStatus']:='跟单员';
  2: dm.AQery704.FieldValues['CZYStatus']:='业务员';
  3: dm.AQery704.FieldValues['CZYStatus']:='营销经理';
  4: dm.AQery704.FieldValues['CZYStatus']:='开发副总';
 end;

end;
//主管客户
procedure TDM.ADS705CalcFields(DataSet: TDataSet);
begin
 case dm.ADS705.FieldByName('XYSTATUS').Value of
  0: dm.ADS705.FieldValues['cXYSTATUS']:='优';
  1: dm.ADS705.FieldValues['cXYSTATUS']:='良';
  2: dm.ADS705.FieldValues['cXYSTATUS']:='一般';
  3: dm.ADS705.FieldValues['cXYSTATUS']:='差';
 end;
//产品类型
 case dm.ADS705.FieldByName('CPStatus').Value of
  0: dm.ADS705.FieldValues['CCPStatus']:='单面板';
  1: dm.ADS705.FieldValues['CCPStatus']:='双面板';
  2: dm.ADS705.FieldValues['CCPStatus']:='多面板';
 end;
end;
 //开发计划表
procedure TDM.ADS706CalcFields(DataSet: TDataSet);
begin
 case dm.ADS706.FieldByName('HZYX').Value of
  0: dm.ADS706.FieldValues['CHZYX']:='非常可能';
  1: dm.ADS706.FieldValues['CHZYX']:='有可能';
  2: dm.ADS706.FieldValues['CHZYX']:='暂时无意合作';
 end;

end;
//计划收款
procedure TDM.ADS707CalcFields(DataSet: TDataSet);
begin
 case dm.ADS707.FieldByName('HZSTATUS').Value of
  0: dm.ADS707.FieldValues['CHZSTATUS']:='继续合作';
  1: dm.ADS707.FieldValues['CHZSTATUS']:='控制合作';
  2: dm.ADS707.FieldValues['CHZSTATUS']:='停止合作';
 end;
end;

end.
