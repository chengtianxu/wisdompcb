unit demo;

interface

uses
  SysUtils, Classes, DB,common, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ado600: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery1DEPT_NAME: TStringField;
    ADOQuery1auth_date: TDateTimeField;
    ADOQuery1PUTH_INFO: TStringField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    ado600rkey: TAutoIncField;
    ado600NPI_NUMBER: TStringField;
    ado600NIP_NAME: TWideStringField;
    ado600MANU_PART_NUMBER: TStringField;
    ado600EMPLOYEE_NAME: TStringField;
    ado600create_date: TDateTimeField;
    ado600submit_date: TDateTimeField;
    ado600auth_date: TDateTimeField;
    ado600rkmark: TWideStringField;
    ado600v_ttype: TStringField;
    ado600dept_ptr: TIntegerField;
    ado600status1: TStringField;
    DataSource3: TDataSource;
    ADO603: TADOQuery;
    ADO603rec_no: TIntegerField;
    ADO603npi_ptr: TIntegerField;
    ADO603diff_declare: TWideStringField;
    ADO603solution: TMemoField;
    ADO603duty_officer: TWideStringField;
    ADO603status_date: TMemoField;
    ADO601: TADOQuery;
    DataSource4: TDataSource;
    ADO601rec_no: TIntegerField;
    ADO601FileName: TStringField;
    ADO601EMPL_CODE: TStringField;
    ADO601EMPLOYEE_NAME: TStringField;
    ADO601remark: TStringField;
    ADO601UploadTime: TDateTimeField;
    ADO601Ftp_fileName: TStringField;
    ADO601IDKey: TStringField;
    ADOedit602: TADOQuery;
    ADOedit602npi_ptr: TIntegerField;
    ADOedit602dept_ptr: TIntegerField;
    ADOedit602auth_flag: TWordField;
    ADOedit602user_ptr: TIntegerField;
    ADOedit602auth_date: TDateTimeField;
    ADOedit602PUTH_INFO: TStringField;
    temp: TADOQuery;
    ADOloop: TADOQuery;
    ADOlooprkey: TAutoIncField;
    ADOloopstatus: TWordField;
    ADOloopauth_date: TDateTimeField;
    ADOloopauth_flag: TWordField;
    ADOQuery2: TADOQuery;
    ADOQuery2rkey: TAutoIncField;
    ADOQuery2status: TWordField;
    ADOQuery2auth_date: TDateTimeField;
    ADOQuery2auth_flag: TWordField;
    ADOQuery1auth_flag1: TStringField;
    ADOQuery2PUTH_INFO: TStringField;
    ADOQuery2user_ptr: TIntegerField;
    ADOQuery2date602: TDateTimeField;
    ADS601: TADODataSet;
    ADS601rec_no: TIntegerField;
    ADS601FileName: TStringField;
    ADS601EMPL_CODE: TStringField;
    ADS601EMPLOYEE_NAME: TStringField;
    ADS601remark: TStringField;
    ADS601UploadTime: TDateTimeField;
    ADS601Ftp_fileName: TStringField;
    ADS601IDKey: TStringField;
    ADS601Ftp_Ptr: TIntegerField;
    ADOQuery3: TADOQuery;
    procedure ado600AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ado600AfterScroll(DataSet: TDataSet);
begin
 DM.ADO603.Close;
 DM.ADO603.Parameters[0].Value:=DM.ado600rkey.Value;
 DM.ADO603.Open;
 DM.ADO601.Close;
 DM.ADO601.Parameters[0].Value:=DM.ado600rkey.Value;
 DM.ADO601.Open;
// DM.ADOedit602.Close;
// dm.ADOedit602.Parameters[0].Value:=DM.ado600rkey.Value;
// dm.ADOedit602.Parameters[1].Value:=user_ptr_dept;
// DM.ADOedit602.Open;
end;

end.
