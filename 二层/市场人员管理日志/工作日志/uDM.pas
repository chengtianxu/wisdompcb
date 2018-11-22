unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    Conn: TADOConnection;
    AQery708: TADOQuery;
    ADS709: TADODataSet;
    ADS710: TADODataSet;
    ADS711: TADODataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    AQery: TADOQuery;
    AQery708RKEY: TAutoIncField;
    AQery708PTR704: TIntegerField;
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
    AQery708YJH: TIntegerField;
    AQery708MJH: TIntegerField;
    AQery708MJHJE: TBCDField;
    AQery708BRLJ: TBCDField;
    AQery708RZYBL: TBCDField;
    AQery708YZNBL: TBCDField;
    AQery708YJHJE: TBCDField;
    AQery708CTJSTATUS: TStringField;
    AQery708CYSSTATUS: TStringField;
    ADS709RKEY: TIntegerField;
    ADS709PTR708: TIntegerField;
    ADS709PTR10: TIntegerField;
    ADS709PTR50: TIntegerField;
    ADS709DDSL: TBCDField;
    ADS709JHSL: TBCDField;
    ADS709QHSL: TBCDField;
    ADS709CUST_CODE: TStringField;
    ADS709ABBR_NAME: TStringField;
    ADS710CUSTOMER_NAME: TStringField;
    ADS710CUSTOMER_PART_NUMBER: TStringField;
    ADS710SL: TBCDField;
    ADS710note: TStringField;
    ADS710GJQK: TStringField;
    ADS710JJBF: TStringField;
    ADS710JJSX: TDateTimeField;
    ADS710rkey: TIntegerField;
    ADS710PTR708: TIntegerField;
    ADS710PTR10: TIntegerField;
    ADS710PTR50: TIntegerField;
    ADS711RKEY: TAutoIncField;
    ADS711PTR708: TIntegerField;
    ADS711PTR10: TIntegerField;
    ADS711KHMC: TStringField;
    ADS711TXDZ: TStringField;
    ADS711TXDH: TStringField;
    ADS711TXRZC: TStringField;
    ADS711TXSJ: TDateTimeField;
    ADS711HDRR: TStringField;
    ADS711HZYX: TIntegerField;
    ADS711CHZYX: TStringField;
    ADS711TXRXM: TStringField;
    AQery708EMPL_CODE: TStringField;
    AQery4: TADOQuery;
    AQery708RZID: TStringField;
    AQery5: TADOQuery;
    AQery708BMPTR: TIntegerField;
    AQery708ZYStatus: TIntegerField;
    AQery708DEPT_CODE: TStringField;
    AQery708DEPT_NAME: TStringField;
    AQery708CZYStatus: TStringField;
    AQery5RKEY: TAutoIncField;
    AQery5EMPL_CODE: TStringField;
    AQery5EMPLOYEE_NAME: TStringField;
    AQery5EMPLOYEE_ID: TIntegerField;
    AQery5popedom: TWordField;
    AQery5ZY: TStringField;
    AQery5BMRKY: TAutoIncField;
    ADS709manu_PART_NUMBER: TStringField;
    procedure AQery708CalcFields(DataSet: TDataSet);
    procedure ADS711CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

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
//合作意向
procedure TDM.ADS711CalcFields(DataSet: TDataSet);
begin
 //
 case dm.ADS711.FieldByName('HZYX').Value of
  0: dm.ADS711.FieldValues['CHZYX']:='有意合作';
  1: dm.ADS711.FieldValues['CHZYX']:='不明确';
  2: dm.ADS711.FieldValues['CHZYX']:='不可能合作';
 end;

end;

end.
