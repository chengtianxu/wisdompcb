unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    Conn: TADOConnection;
    AQery712: TADOQuery;
    DataSource1: TDataSource;
    AQery712RKEY: TAutoIncField;
    AQery712PTR704: TIntegerField;
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
    AQery712CJRQ: TDateTimeField;
    AQery712USEPTR: TIntegerField;
    AQery712Status: TIntegerField;
    AQery712SHPTR: TIntegerField;
    AQery712ZJQJ: TIntegerField;
    AQery712QJStatus: TIntegerField;
    AQery712Note: TStringField;
    AQery712EMPL_CODE: TStringField;
    AQery712EMPLOYEE_NAME: TStringField;
    AQery712SHR: TStringField;
    AQery712ZJND: TIntegerField;
    AQery712CQJStatus: TStringField;
    AQery712CStatus: TStringField;
    AQery: TADOQuery;
    AQery712ZWPJ: TIntegerField;
    AQery712CZWPJ: TStringField;
    AQery712SSPJ: TIntegerField;
    AQery712CSSPJ: TStringField;
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
    DataSource2: TDataSource;
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
    ADS713HZSTATUS: TIntegerField;
    ADS713CHZSTATUS: TStringField;
    DataSource3: TDataSource;
    ADS713CQJE: TBCDField;
    ADS714PTR712: TIntegerField;
    AQery712ZJID: TStringField;
    AQery4: TADOQuery;
    AQery712MJHJE: TBCDField;
    AQery5: TADOQuery;
    AQery712ZYStatus: TIntegerField;
    AQery712BMPTR: TIntegerField;
    AQery712DEPT_NAME: TStringField;
    AQery712CZYStatus: TStringField;
    AQery5RKEY: TAutoIncField;
    AQery5EMPL_CODE: TStringField;
    AQery5EMPLOYEE_NAME: TStringField;
    AQery5EMPLOYEE_ID: TIntegerField;
    AQery5popedom: TWordField;
    AQery5ZY: TStringField;
    AQery5BMRKY: TAutoIncField;
    AQery712week_of: TSmallintField;
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
