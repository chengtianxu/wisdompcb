unit DAMO;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ads73: TADODataSet;
    ads73USER_LOGIN_NAME: TStringField;
    ads73USER_FULL_NAME: TStringField;
    ads73USER_GROUP_FLAG: TSmallintField;
    ads73ACTIVE_FLAG: TSmallintField;
    ads73message_flag: TBooleanField;
    ads73EMPL_CODE: TStringField;
    ads73EMPLOYEE_NAME: TStringField;
    ads73PASSWORD: TStringField;
    ads73DEPT_NAME: TStringField;
    ads73RKEY: TIntegerField;
    ads73ttype: TStringField;
    ads73status: TStringField;
    ads73short_info: TStringField;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    aq419: TADOQuery;
    aq419DESCRIPTION: TStringField;
    aq419manu_ptr: TIntegerField;
    aq419MAIN_PTR: TIntegerField;
    ads74: TADODataSet;
    ads74FUNCTION_ID: TIntegerField;
    ads74USER_RIGHTS: TSmallintField;
    ads74USER_PTR: TIntegerField;
    aq419rkey: TAutoIncField;
    ads74DESCRIPTION: TStringField;
    ads74manu_ptr: TIntegerField;
    ads74MAIN_PTR: TIntegerField;
    aq419seqno: TStringField;
    ads74seqno: TStringField;
    ads74seq_no: TStringField;
    ads74rights: TStringField;
    ads73EMPLOYEE_PTR: TIntegerField;
    ads73GROUP_PTR: TIntegerField;
    ads73group_name: TStringField;
    ads73NETWORK_IP: TStringField;
    ads73hrpopm: TIntegerField;
    ads73validity_date: TDateTimeField;
    ads73ABBR_NAME: TStringField;
    procedure ads74CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ads74CalcFields(DataSet: TDataSet);
begin
case self.ads74USER_RIGHTS.Value of
  1:self.ads74rights.Value:= '只读';
  2:self.ads74rights.Value:= '可写';
  3:self.ads74rights.Value:= '读银';
  4:self.ads74rights.Value:= '写银';
end;

end;

end.
