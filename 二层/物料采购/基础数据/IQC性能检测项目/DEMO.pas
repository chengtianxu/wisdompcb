unit DEMO;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    con1: TADOConnection;
    adsMain: TADODataSet;
    adsDetail: TADODataSet;
    dsMain: TDataSource;
    dsDetail: TDataSource;
    adsMainrkey: TIntegerField;
    adsMainrkey23: TIntegerField;
    adsMainrkey496: TIntegerField;
    adsMainModel: TStringField;
    adsMainrkey391: TIntegerField;
    adsMainCheckCycle: TWordField;
    adsMainCreateTime: TDateTimeField;
    adsMainCreateUser: TIntegerField;
    adsMainstatus: TBooleanField;
    adsMainCODE: TStringField;
    adsMainABBR_NAME: TStringField;
    adsMainGROUP_NAME: TStringField;
    adsMainGROUP_DESC: TStringField;
    adsMainUSER_LOGIN_NAME: TStringField;
    adsMainiqc_number: TStringField;
    adsMainbarch_no: TStringField;
    adsMainstrCycle: TStringField;
    adsMainstrstatus: TStringField;
    adsDetailFileName: TStringField;
    adsDetailEMPLOYEE_NAME: TStringField;
    adsDetailUploadTime: TDateTimeField;
    adsDetailIDKey: TStringField;
    adsDetailFtp_fileName: TStringField;
    adsDetailrkey622: TIntegerField;
    qryFtp: TADOQuery;
    qryFtpIDKey: TStringField;
    qryFtpFileName: TStringField;
    qryFtpFtp_Ptr: TIntegerField;
    qryFtpFtpDir: TStringField;
    qryFtpFtp_fileName: TStringField;
    qryFtpUploadTime: TDateTimeField;
    qryFtpUploadUser_d05ptr: TIntegerField;
    qryFtpGroupIDKey: TStringField;
    qryFtpBEnable: TBooleanField;
    qryFileList: TADOQuery;
    qrytmp: TADOQuery;
    qryCylce: TADOQuery;
    dsCycle: TDataSource;
    qryCylcerkey496: TIntegerField;
    qryCylceCycle: TWordField;
    qryCylceGROUP_NAME: TStringField;
    qryCylceGROUP_DESC: TStringField;
    qryCylcestrCycle: TStringField;
    adsCell: TADODataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    StringField3: TStringField;
    StringField4: TStringField;
    IntegerField1: TIntegerField;
    dsCell: TDataSource;
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
