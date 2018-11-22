unit dmo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOEmployeecardMsg: TADODataSet;
    ADOEmployeeMsg: TADODataSet;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADO73: TADOQuery;
    ADOEmployeecardMsgemployeecode: TWideStringField;
    ADOEmployeecardMsgchinesename: TWideStringField;
    ADOEmployeecardMsgCardno: TStringField;
    ADOEmployeecardMsgEstatus: TWordField;
    ADOEmployeecardMsgrkey: TAutoIncField;
    ADOEmployeecardMsgcardno_dec: TStringField;
    ADOEmployeecardMsgcardno_dex: TStringField;
    ADOEmployeecardMsgemployeeid: TIntegerField;
    ADOEmployeecardMsgbegin_time: TDateTimeField;
    ADOEmployeecardMsgend_time: TDateTimeField;
    ADOEmployeecardMsgoper_person: TIntegerField;
    ADOEmployeecardMsgoper_date: TDateTimeField;
    ADOEmployeecardMsgoper_name: TStringField;
    ADOEmployeecardMsgstatus: TIntegerField;
    ADOEmployeecardMsgCstatus: TStringField;
    ADO73employee_ptr: TIntegerField;
    ADOEmployeeMsgrkey: TAutoIncField;
    ADOEmployeeMsgchinesename: TWideStringField;
    ADOEmployeeMsgemployeecode: TWideStringField;
    ADOEmployeeMsgdepartmentid: TIntegerField;
    ADOEmployeeMsgondutytime: TDateTimeField;
    ADOEmployeeMsgoutdutytime: TDateTimeField;
    ADOEmployeeMsgemploy_type: TIntegerField;
    ADOEmployeeMsgPosition: TIntegerField;
    ADOEmployeeMsgRank: TIntegerField;
    ADOEmployeeMsgPolitics_face: TIntegerField;
    ADOEmployeeMsgeducation: TIntegerField;
    ADOEmployeeMsgmarriage: TIntegerField;
    ADOEmployeeMsgsex: TIntegerField;
    ADOEmployeeMsgaddr: TWideStringField;
    ADOEmployeeMsgprovince: TWideStringField;
    ADOEmployeeMsgIDCard: TWideStringField;
    ADOEmployeeMsgCardno: TStringField;
    ADOEmployeeMsgphone: TWideStringField;
    ADOEmployeeMsgattendance: TIntegerField;
    ADOEmployeeMsgwagetype: TIntegerField;
    ADOEmployeeMsgroomcode: TWideStringField;
    ADOEmployeeMsgnation: TWideStringField;
    ADOEmployeeMsgphoto: TBlobField;
    ADOEmployeeMsgresume: TMemoField;
    ADOEmployeeMsgothers_contacts: TWideStringField;
    ADOEmployeeMsgbirthday: TDateTimeField;
    ADOEmployeeMsgstatus: TWordField;
    ADOEmployeeMsgclassgroupid: TIntegerField;
    ADOCard: TADODataSet;
    ADOCardrkey: TAutoIncField;
    ADOCardcardno_dec: TStringField;
    ADOCardcardno_dex: TStringField;
    ADOCardemployeeid: TIntegerField;
    ADOCardbegin_time: TDateTimeField;
    ADOCardend_time: TDateTimeField;
    ADOCardstatus: TIntegerField;
    ADOCardoper_person: TIntegerField;
    ADOCardoper_date: TDateTimeField;
    ADOConn: TADOConnection;
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
