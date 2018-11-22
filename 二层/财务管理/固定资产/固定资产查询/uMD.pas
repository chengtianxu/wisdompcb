unit uMD;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    Conn: TADOConnection;
    Qery: TADOQuery;
    DS517: TADODataSet;
    DS326: TADODataSet;
    DS325: TADODataSet;
    DataSource1: TDataSource;
    Qery517: TADODataSet;
    Qery517id_code: TStringField;
    Qery517BOOK_DATE: TDateTimeField;
    Qery517FASSET_CODE: TStringField;
    Qery517FASSET_NAME: TStringField;
    Qery517FASSET_TYPE: TStringField;
    Qery517FASSET_ALT_TYPE: TStringField;
    Qery517VOUCHER: TStringField;
    Qery517FASSET_STATUS: TStringField;
    Qery517ORIGINAL_VALUE: TFloatField;
    Qery517SUMMED_DEPRE: TFloatField;
    Qery517NET_VALUE: TFloatField;
    Qery517SURPLUS_RATE: TFloatField;
    Qery517SURPLUS: TFloatField;
    Qery517DEPRE_MTHD_PTR: TStringField;
    Qery517EXPECTED_LIFE_MONTHS: TFloatField;
    Qery517DEPRED_MONTHS: TFloatField;
    Qery517LOADING_UNIT: TStringField;
    Qery517MONTH_DEPRE_RATE: TFloatField;
    Qery517MONTH_DEPRE_AMT: TBCDField;
    Qery517LOCATION: TStringField;
    Qery517RKEY: TAutoIncField;
    Qery0001: TADOQuery;
    Qery103: TADOQuery;
    Qery103RKEY: TAutoIncField;
    Qery103CURR_TP: TWordField;
    Qery103CURR_PTR: TIntegerField;
    Qery103StringField: TStringField;
    Qery103StringField2: TStringField;
    Qery103GL_ACC_NUMBER: TStringField;
    Qery103description_2: TStringField;
    Qery103GL_DESCRIPTION: TStringField;
    Qery508: TADOQuery;
    Qery517FASSET_DESC: TStringField;
    Qery517STATUS: TStringField;
    Qery517dept_ptr: TIntegerField;
    Qery517voucher_ptr: TIntegerField;
    ads0514: TADODataSet;
    ads0516: TADODataSet;
    Qery517IN_Depr: TStringField;
    Qery517GL_Acc_Number: TStringField;
    Qery517GL_Description: TStringField;
    Qery517abbr_name: TStringField;
    Qery517orig_original_value: TFloatField;
    Qery517user_date: TDateTimeField;
    Qery517supplier_name: TStringField;
    qryAcctItem: TADOQuery;
    qryAcctItemRKEY: TAutoIncField;
    qryAcctItemCURR_TP: TWordField;
    intgrfldAcctItemCURR_PTR: TIntegerField;
    strngfldAcctItemDSDesigner: TStringField;
    strngfldAcctItemDSDesigner2: TStringField;
    strngfldAcctItemGL_ACC_NUMBER: TStringField;
    strngfldAcctItemdescription_2: TStringField;
    strngfldAcctItemGL_DESCRIPTION: TStringField;
    Qery517orig_BOOK_DATE: TDateTimeField;
    strngfldQery517dept: TStringField;
    strngfldQery517GL_ACC_NUMber2: TStringField;
    strngfldQery517GL_ACC_NUMber326: TStringField;
    Qery517remark: TStringField;
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
