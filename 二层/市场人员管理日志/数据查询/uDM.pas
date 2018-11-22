unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    Conn: TADOConnection;
    AQery704: TADOQuery;
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
    AQery704CZYStatus: TStringField;
    AQery704Note: TStringField;
    AQery704CStatus: TStringField;
    AQery704EMPLOYEE_NAME: TStringField;
    AQery704DEPT_NAME: TStringField;
    AQery704DEPT_CODE: TStringField;
    AQery704YZNBL: TBCDField;
    AQery704YWWJE: TBCDField;
    AQery704WWZNBL: TBCDField;
    AQery704SQXCJE: TBCDField;
    AQery704SQWCBL: TBCDField;
    AQery704BQXCJE: TBCDField;
    AQery704BQJHBL: TBCDField;
    AQery704EMPL_CODE: TStringField;
    AQery704JHID: TStringField;
    AQery704ZYStatus: TIntegerField;
    AQery704ZYRBM: TIntegerField;
    ADS705: TADODataSet;
    ADS705RKEY: TIntegerField;
    ADS705ptr704: TIntegerField;
    ADS705PTR10: TIntegerField;
    ADS705ABBR_NAME: TStringField;
    ADS705BQJHDD: TBCDField;
    ADS705BQJHYP: TIntegerField;
    ADS705CCPStatus: TStringField;
    ADS705BQJHJE: TBCDField;
    ADS705ZYCL: TStringField;
    ADS705XYSTATUS: TIntegerField;
    ADS705CXYSTATUS: TStringField;
    ADS705CPSL: TBCDField;
    ADS705PTR5: TIntegerField;
    ADS705CPStatus: TIntegerField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
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
    ADS707ABBR_NAME: TStringField;
    ADS707HJYS: TBCDField;
    ADS707DQYS: TBCDField;
    ADS707JHYS: TBCDField;
    ADS707JHRQ: TDateTimeField;
    ADS707CQTS: TBCDField;
    ADS707HZSTATUS: TIntegerField;
    ADS707CHZSTATUS: TStringField;
    AQery5: TADOQuery;
    AQery: TADOQuery;
    AQery708: TADOQuery;
    AQery708RKEY: TAutoIncField;
    AQery708PTR704: TIntegerField;
    AQery708RZID: TStringField;
    AQery708YJH: TIntegerField;
    AQery708MJH: TIntegerField;
    AQery708MJHJE: TBCDField;
    AQery708BRLJ: TBCDField;
    AQery708RZYBL: TBCDField;
    AQery708YZNBL: TBCDField;
    AQery708YJHJE: TBCDField;
    AQery708TJSTATUS: TIntegerField;
    AQery708YSSTATUS: TIntegerField;
    AQery708USEPTR: TIntegerField;
    AQery708STATUS: TIntegerField;
    AQery708SHPTR: TIntegerField;
    AQery708CJRQ: TDateTimeField;
    AQery708Note: TStringField;
    AQery708user: TStringField;
    AQery708SHR: TStringField;
    AQery708CSTATUS: TStringField;
    AQery708CTJSTATUS: TStringField;
    AQery708CYSSTATUS: TStringField;
    AQery708EMPL_CODE: TStringField;
    AQery708BMPTR: TIntegerField;
    AQery708ZYStatus: TIntegerField;
    AQery708DEPT_CODE: TStringField;
    AQery708DEPT_NAME: TStringField;
    AQery708CZYStatus: TStringField;
    ADS709: TADODataSet;
    ADS709RKEY: TIntegerField;
    ADS709PTR708: TIntegerField;
    ADS709PTR10: TIntegerField;
    ADS709PTR50: TIntegerField;
    ADS709CUST_CODE: TStringField;
    ADS709ABBR_NAME: TStringField;
    ADS709MANU_PART_NUMBER: TStringField;
    ADS709DDSL: TBCDField;
    ADS709JHSL: TBCDField;
    ADS709QHSL: TBCDField;
    ADS710: TADODataSet;
    ADS710CUSTOMER_NAME: TStringField;
    ADS710MANU_PART_NUMBER: TStringField;
    ADS710SL: TBCDField;
    ADS710note: TStringField;
    ADS710GJQK: TStringField;
    ADS710JJBF: TStringField;
    ADS710JJSX: TDateTimeField;
    ADS710rkey: TIntegerField;
    ADS710PTR708: TIntegerField;
    ADS710PTR10: TIntegerField;
    ADS710PTR50: TIntegerField;
    ADS711: TADODataSet;
    ADS711RKEY: TAutoIncField;
    ADS711PTR708: TIntegerField;
    ADS711PTR10: TIntegerField;
    ADS711KHMC: TStringField;
    ADS711TXDZ: TStringField;
    ADS711TXDH: TStringField;
    ADS711TXRXM: TStringField;
    ADS711TXRZC: TStringField;
    ADS711TXSJ: TDateTimeField;
    ADS711HDRR: TStringField;
    ADS711HZYX: TIntegerField;
    ADS711CHZYX: TStringField;
    DataSource5: TDataSource;
    DataSource6: TDataSource;
    DataSource7: TDataSource;
    DataSource8: TDataSource;
    AQery712: TADOQuery;
    AQery712RKEY: TAutoIncField;
    AQery712PTR704: TIntegerField;
    AQery712ZJID: TStringField;
    AQery712ZJND: TIntegerField;
    AQery712ZJQJ: TIntegerField;
    AQery712CQJStatus: TStringField;
    AQery712BQDD: TBCDField;
    AQery712BQSK: TBCDField;
    AQery712BQTS: TIntegerField;
    AQery712BQYP: TIntegerField;
    AQery712YPZLC: TIntegerField;
    AQery712YZLBL: TBCDField;
    AQery712YPSF: TIntegerField;
    AQery712YPSFJE: TBCDField;
    AQery712YPMS: TIntegerField;
    AQery712YPMSJE: TBCDField;
    AQery712YPGZ: TIntegerField;
    AQery712YPGZJE: TBCDField;
    AQery712YPKZLC: TIntegerField;
    AQery712BQKM: TIntegerField;
    AQery712KMZLC: TIntegerField;
    AQery712KMQR: TIntegerField;
    AQery712KMSF: TIntegerField;
    AQery712KMSFJE: TBCDField;
    AQery712KMMS: TIntegerField;
    AQery712KMMSJE: TBCDField;
    AQery712KMGZ: TIntegerField;
    AQery712KMGZJE: TBCDField;
    AQery712BQCSJ: TIntegerField;
    AQery712CSJZLC: TIntegerField;
    AQery712CSJQR: TIntegerField;
    AQery712CSJSF: TIntegerField;
    AQery712CSJSFJE: TBCDField;
    AQery712CSJMS: TIntegerField;
    AQery712CSJMSJE: TBCDField;
    AQery712CSJGZ: TIntegerField;
    AQery712CSJGZJE: TBCDField;
    AQery712EMPLOYEE_NAME: TStringField;
    AQery712DEPT_NAME: TStringField;
    AQery712CJRQ: TDateTimeField;
    AQery712SHR: TStringField;
    AQery712CStatus: TStringField;
    AQery712USEPTR: TIntegerField;
    AQery712Status: TIntegerField;
    AQery712SHPTR: TIntegerField;
    AQery712QJStatus: TIntegerField;
    AQery712Note: TStringField;
    AQery712EMPL_CODE: TStringField;
    AQery712ZWPJ: TIntegerField;
    AQery712CZWPJ: TStringField;
    AQery712SSPJ: TIntegerField;
    AQery712CSSPJ: TStringField;
    AQery712MJHJE: TBCDField;
    AQery712ZYStatus: TIntegerField;
    AQery712BMPTR: TIntegerField;
    AQery712CZYStatus: TStringField;
    DataSource9: TDataSource;
    ADS714: TADODataSet;
    ADS714RKEY: TIntegerField;
    ADS714PTR10: TIntegerField;
    ADS714KHMC: TStringField;
    ADS714GMRS: TIntegerField;
    ADS714ZYCP: TStringField;
    ADS714PCBYL: TBCDField;
    ADS714TXDZ: TStringField;
    ADS714TXDH: TStringField;
    ADS714TXRXM: TStringField;
    ADS714HZYX: TIntegerField;
    ADS714CHZYX: TStringField;
    ADS714PTR712: TIntegerField;
    DataSource10: TDataSource;
    ADS713: TADODataSet;
    ADS713RKEY: TIntegerField;
    ADS713PTR: TIntegerField;
    ADS713PTR10: TIntegerField;
    ADS713ABBR_NAME: TStringField;
    ADS713HJYS: TBCDField;
    ADS713DQYS: TBCDField;
    ADS713JHYS: TBCDField;
    ADS713JHRQ: TDateTimeField;
    ADS713CQTS: TBCDField;
    ADS713CQJE: TBCDField;
    ADS713HZSTATUS: TIntegerField;
    ADS713CHZSTATUS: TStringField;
    DataSource11: TDataSource;
    AQery708enter_date: TDateTimeField;
    ADS711enter_date: TDateTimeField;
    procedure AQery704CalcFields(DataSet: TDataSet);
    procedure ADS705CalcFields(DataSet: TDataSet);
    procedure ADS706CalcFields(DataSet: TDataSet);
    procedure ADS707CalcFields(DataSet: TDataSet);
    procedure AQery708CalcFields(DataSet: TDataSet);
    procedure ADS711CalcFields(DataSet: TDataSet);
    procedure AQery712CalcFields(DataSet: TDataSet);
    procedure ADS714CalcFields(DataSet: TDataSet);
    procedure ADS713CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

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

procedure TDM.AQery708CalcFields(DataSet: TDataSet);
begin
 //特急
 case dm.AQery708.FieldByName('TJSTATUS').Value of
  0: dm.AQery708.FieldValues['CTJSTATUS']:='是';
  1: dm.AQery708.FieldValues['CTJSTATUS']:='否'
 end;
 //应收
 case dm.AQery708.FieldByName('YSSTATUS').Value of
  0: dm.AQery708.FieldValues['CYSSTATUS']:='是';
  1: dm.AQery708.FieldValues['CYSSTATUS']:='否';
 end;

 //审核
 case dm.AQery708.FieldByName('status').Value of
  0: dm.AQery708.FieldValues['cstatus']:='未审';
  1: dm.AQery708.FieldValues['cstatus']:='已审';
 end;
 // 职位
 case  dm.AQery708.FieldByName('ZYStatus').Value of
  0: dm.AQery708.FieldValues['CZYStatus']:='无';
  1: dm.AQery708.FieldValues['CZYStatus']:='跟单员';
  2: dm.AQery708.FieldValues['CZYStatus']:='业务员';
  3: dm.AQery708.FieldValues['CZYStatus']:='营销经理';
  4: dm.AQery708.FieldValues['CZYStatus']:='开发副总';
 end;
end;

procedure TDM.ADS711CalcFields(DataSet: TDataSet);
begin
 //
 case dm.ADS711.FieldByName('HZYX').Value of
  0: dm.ADS711.FieldValues['CHZYX']:='有意合作';
  1: dm.ADS711.FieldValues['CHZYX']:='不明确';
  2: dm.ADS711.FieldValues['CHZYX']:='不可能合作';
 end;
end;

procedure TDM.AQery712CalcFields(DataSet: TDataSet);
begin
 //期间
 case dm.AQery712.FieldByName('QJStatus').Value of
  0: dm.AQery712.FieldValues['CQJStatus']:='月';
  1: dm.AQery712.FieldValues['CQJStatus']:='周';
 end;
 //审核状态
 case dm.AQery712.FieldByName('Status').Value of
  0: dm.AQery712.FieldValues['CStatus']:='未审';
  1: dm.AQery712.FieldValues['CStatus']:='已审';
 end;

 //自我评价
 case dm.AQery712.FieldByName('ZWPJ').Value of
  0: dm.AQery712.FieldValues['CZWPJ']:='优秀';
  1: dm.AQery712.FieldValues['CZWPJ']:='合格';
  2: dm.AQery712.FieldValues['CZWPJ']:='不合格';
 end;
 //上司评价
 if dm.AQery712.FieldByName('SSPJ').IsNull=false then
  case dm.AQery712.FieldByName('SSPJ').Value of
   0: dm.AQery712.FieldValues['CSSPJ']:='优秀';
   1: dm.AQery712.FieldValues['CSSPJ']:='合格';
   2: dm.AQery712.FieldValues['CSSPJ']:='不合格';
  end;
 // 职位
 case  dm.AQery712.FieldByName('ZYStatus').Value of
  0: dm.AQery712.FieldValues['CZYStatus']:='无';
  1: dm.AQery712.FieldValues['CZYStatus']:='跟单员';
  2: dm.AQery712.FieldValues['CZYStatus']:='业务员';
  3: dm.AQery712.FieldValues['CZYStatus']:='营销经理';
  4: dm.AQery712.FieldValues['CZYStatus']:='开发副总';
 end;  
end;

procedure TDM.ADS714CalcFields(DataSet: TDataSet);
begin
 case dm.ADS714.FieldByName('HZYX').Value of
  0: dm.ADS714.FieldValues['CHZYX']:='非常可能';
  1: dm.ADS714.FieldValues['CHZYX']:='有可能';
  2: dm.ADS714.FieldValues['CHZYX']:='暂时无意合作';
 end;
end;

procedure TDM.ADS713CalcFields(DataSet: TDataSet);
begin
 case dm.ADS713.FieldByName('HZSTATUS').Value of
  0: dm.ADS713.FieldValues['CHZSTATUS']:='继续合作';
  1: dm.ADS713.FieldValues['CHZSTATUS']:='控制合作';
  2: dm.ADS713.FieldValues['CHZSTATUS']:='停止合作';
 end;
end;

end.
