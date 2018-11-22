unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB, Dialogs;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DS600: TDataSource;
    DS603: TDataSource;
    ADS600: TADODataSet;
    ADS603: TADODataSet;
    ADS600Rkey: TAutoIncField;
    ADS600NPI_NUMBER: TStringField;
    ADS600NIP_NAME: TWideStringField;
    ADS600create_date: TDateTimeField;
    ADS600submit_date: TDateTimeField;
    ADS600auth_date: TDateTimeField;
    ADS600rkmark: TWideStringField;
    ADS600v_ttype: TStringField;
    ADS600MANU_PART_NUMBER: TStringField;
    ADS600MANU_PART_DESC: TStringField;
    ADS600ANALYSIS_CODE_2: TStringField;
    ADS600ANALYSIS_CODE_5: TStringField;
    ADS600ANALYSIS_CODE_1: TStringField;
    ADS600LAYERS: TWordField;
    ADS600PROD_CODE: TStringField;
    ADS600PRODUCT_NAME: TStringField;
    ADS600EMPL_CODE: TStringField;
    ADS600EMPLOYEE_NAME: TStringField;
    ADS603rec_no: TIntegerField;
    ADS603npi_ptr: TIntegerField;
    ADS603diff_declare: TWideStringField;
    ADS603solution: TMemoField;
    ADS603duty_officer: TWideStringField;
    ADS603status_date: TMemoField;
    ADS614: TADODataSet;
    ADS615: TADODataSet;
    DS614: TDataSource;
    DS615: TDataSource;
    ADOQuery1: TADOQuery;
    ADS614v_ttype: TStringField;
    ADS614Remark: TWideStringField;
    ADS615v_ttype: TStringField;
    ADS615rec_no: TIntegerField;
    ADS615DEPT_CODE: TStringField;
    ADS615DEPT_NAME: TStringField;
    ADS615USER_FULL_NAME: TStringField;
    ADS615USER_LOGIN_NAME: TStringField;
    ADS615rkey34: TIntegerField;
    ADS615csi_ptr: TIntegerField;
    ADS6031: TADODataSet;
    DS6031: TDataSource;
    ADS6031rec_no: TIntegerField;
    ADS6031npi_ptr: TIntegerField;
    ADS6031diff_declare: TWideStringField;
    ADS6031solution: TMemoField;
    ADS6031duty_officer: TWideStringField;
    ADS6031status_date: TMemoField;
    tmp: TADOQuery;
    ADS600v_status: TStringField;
    ADS600Cust_part_ptr: TIntegerField;
    ADS600create_userptr: TIntegerField;
    ADS602: TADODataSet;
    DS602: TDataSource;
    ADS602npi_ptr: TIntegerField;
    ADS602dept_ptr: TIntegerField;
    ADS602user_ptr: TIntegerField;
    ADS602auth_date: TDateTimeField;
    ADS602PUTH_INFO: TStringField;
    ADS602rec_no: TIntegerField;
    ADS602csi_ptr: TIntegerField;
    ADS602DEPT_NAME: TStringField;
    ADS602EMPLOYEE_NAME: TStringField;
    ADS602v_auth_flag: TStringField;
    ADS602auth_flag: TWordField;
    ADS600status: TWordField;
    DS601: TDataSource;
    ADS601: TADODataSet;
    ADS601rec_no: TIntegerField;
    ADS601FileName: TStringField;
    ADS601EMPL_CODE: TStringField;
    ADS601EMPLOYEE_NAME: TStringField;
    ADS601remark: TStringField;
    ADS601UploadTime: TDateTimeField;
    ADS601Ftp_fileName: TStringField;
    ADS601IDKey: TStringField;
    qryFtp2: TADOQuery;
    qryFileList2: TADOQuery;
    ADS601Ftp_Ptr: TIntegerField;
    procedure ADS600AfterScroll(DataSet: TDataSet);
    procedure ADS600AfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADS600AfterScroll(DataSet: TDataSet);
begin
  DM.ADS603.Close;
  DM.ADS603.Parameters[0].Value := DM.ADS600Rkey.Value;
  DM.ADS603.Open;
end;

procedure TDM.ADS600AfterOpen(DataSet: TDataSet);
begin
  DM.ADS603.Close;
  DM.ADS603.Parameters[0].Value := DM.ADS600Rkey.Value;
  DM.ADS603.Open;
end;

end.
