unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    con1: TADOConnection;
    aqmain: TADOQuery;
    ds1: TDataSource;
    adsaq1CODE: TStringField;
    adsaq1ABBR_NAME: TStringField;
    adsaq1INV_PART_NUMBER: TStringField;
    adsaq1INV_PART_DESCRIPTION: TStringField;
    fltfldaq1PRICE_1: TFloatField;
    ads363aq1LEAD_TIME: TSmallintField;
    fltfldaq1qte_price: TFloatField;
    fltfldaq1TAX_2: TFloatField;
    aqmainEDI_OUT_FORCST: TIntegerField;
    adsaq1SUPPLIER_NAME: TStringField;
    aq1TDATE: TDateTimeField;
    adsaq1SUPPLIER_PART_NO: TStringField;
    fltfldaq1SUGG_REORDER_QTY: TFloatField;
    aq1AMT_QUAN_FLAG: TWordField;
    fltfldaq1MIN_ORDER_QTY: TFloatField;
    fltfldaq1MIN_ORDER_AMT: TFloatField;
    fltfldaq1PRICE_2: TFloatField;
    fltfldaq1PRICE_3: TFloatField;
    fltfldaq1PRICE_4: TFloatField;
    fltfldaq1PRICE_5: TFloatField;
    fltfldaq1PRICE_6: TFloatField;
    fltfldaq1QUAN_VOL_1: TFloatField;
    fltfldaq1QUAN_VOL_2: TFloatField;
    fltfldaq1QUAN_VOL_3: TFloatField;
    fltfldaq1QUAN_VOL_4: TFloatField;
    fltfldaq1QUAN_VOL_5: TFloatField;
    fltfldaq1DISC_1: TFloatField;
    fltfldaq1DISC_2: TFloatField;
    fltfldaq1DISC_3: TFloatField;
    fltfldaq1DISC_4: TFloatField;
    fltfldaq1DISC_5: TFloatField;
    fltfldaq1DISC_6: TFloatField;
    fltfldaq1CONVERSION_FACTOR: TFloatField;
    adsaq1CURR_CODE: TStringField;
    adsaq1CURR_NAME: TStringField;
    adsaq1DSDesigner: TStringField;
    adsaq1DSDesigner2: TStringField;
    aqmainRKEY: TIntegerField;
    adsaq1USER_FULL_NAME: TStringField;
    adsaq1USER_LOGIN_NAME: TStringField;
    aqmainAVL_FLAG: TStringField;
    aq3: TADOQuery;
    aqmainUSER_FULL_NAME_1: TStringField;
    aqmainUSER_LOGIN_NAME_1: TStringField;
    dsFile: TDataSource;
    qryFile: TADOQuery;
    qryFileFileName: TStringField;
    qryFileFtpIDKey: TWideStringField;
    qryFilerkey28: TIntegerField;
    qryFileIDKey: TStringField;
    qryFileFtp_Ptr: TIntegerField;
    qryFileFtpDir: TStringField;
    qryFileFtp_fileName: TStringField;
    qryFileUploadTime: TDateTimeField;
    qryFileUploadUser_d05ptr: TIntegerField;
    qryFileGroupIDKey: TStringField;
    qryFileBEnable: TBooleanField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
