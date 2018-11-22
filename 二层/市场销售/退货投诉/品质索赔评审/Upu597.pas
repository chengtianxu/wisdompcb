unit Upu597;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADO597: TADOQuery;
    ADO599: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ADO597ststusr: TWordField;
    ADO597rkey: TAutoIncField;
    ADO597spNumber: TStringField;
    ADO597ABBR_NAME: TStringField;
    ADO597USER_FULL_NAME: TStringField;
    ADO597CURR_NAME: TStringField;
    ADO597v_ttype: TWideStringField;
    ADO597Number: TIntegerField;
    ADO597spmoney: TBCDField;
    ADO597ABBR_NAME_1: TStringField;
    ADO597yw05: TStringField;
    ADO597EntryTime: TDateTimeField;
    ADO597debita: TStringField;
    ADO597Remarks: TWideStringField;
    ADO597v_status: TStringField;
    ADO597submit_date: TDateTimeField;
    ADO597ywexplain: TWideStringField;
    ADO597rkey73: TIntegerField;
    ADO597status: TBooleanField;
    ADO597rkey597: TIntegerField;
    ADO599rkey597: TIntegerField;
    ADO599PUTH_INFO: TWideStringField;
    ADO599seq_no: TIntegerField;
    ADO599auth_date: TDateTimeField;
    ADO599USER_FULL_NAME: TStringField;
    ADO599status1: TStringField;
    ADOPS: TADOQuery;
    ADOPSrkey597: TIntegerField;
    ADOPSrkey73: TIntegerField;
    ADOPSauth_date: TDateTimeField;
    ADOPSPUTH_INFO: TWideStringField;
    ADOPSseq_no: TIntegerField;
    ADOPSstatus: TBooleanField;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOPSmark: TBooleanField;
    ADO597seq_no: TIntegerField;
    ADOQuery3: TADOQuery;
    ADS598: TADODataSet;
    ADS598rec_no: TIntegerField;
    ADS598FileName: TStringField;
    ADS598EMPL_CODE: TStringField;
    ADS598EMPLOYEE_NAME: TStringField;
    ADS598remark: TStringField;
    ADS598UploadTime: TDateTimeField;
    ADS598Ftp_fileName: TStringField;
    ADS598IDKey: TStringField;
    ADS598Ftp_Ptr: TIntegerField;
    ADO609: TADODataSet;
    ADO609MANU_PART_DESC: TStringField;
    ADO609rkey: TAutoIncField;
    ADO609rkey597: TIntegerField;
    ADO609Number25: TStringField;
    ADO609condate: TDateTimeField;
    ADO609remark: TWideStringField;
    ADO609rec_no: TWideStringField;
    ADO609xingtai: TStringField;
    ADO609explain: TWideStringField;
    ADO609company: TStringField;
    ADO609Number: TIntegerField;
    ADO609spUnitPrice: TBCDField;
    ADO609spliable: TWideStringField;
    ADO609spmonth: TDateTimeField;
    ADO609MANU_PART_NUMBER: TStringField;
    DS609: TDataSource;
    procedure ADO597AfterScroll(DataSet: TDataSet);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADO597AfterScroll(DataSet: TDataSet);
begin
 dm.ado599.Close;
 DM.ado599.Parameters[0].Value:=DM.ADO597rkey.Value;
 DM.ado599.Open;
 dm.ADS598.Close;
 DM.ADS598.Parameters[0].Value:=DM.ADO597rkey.Value;
 DM.ADS598.Open;
 dm.ADO609.Close;
 DM.ADO609.Parameters[0].Value:=DM.ADO597rkey.Value;
 DM.ADO609.Open;
 
end;



end.
