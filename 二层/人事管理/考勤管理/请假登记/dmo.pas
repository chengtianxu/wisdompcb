unit dmo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConn: TADOConnection;
    ADOAskLeaveRegister: TADODataSet;
    DataSource1: TDataSource;
    ADOAskForLeave: TADODataSet;
    ADOemployeemsg: TADODataSet;
    ADOAskForLeaverkey: TAutoIncField;
    ADOAskForLeaveleavetype: TWideStringField;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ADOemployeemsgrkey: TAutoIncField;
    ADOemployeemsgemployeecode: TWideStringField;
    ADOemployeemsgchinesename: TWideStringField;
    ADOQuery1: TADOQuery;
    ADO0073: TADOQuery;
    ADO0073employee_ptr: TIntegerField;
    ADOQuery2: TADOQuery;
    ADOQuery1rkey: TAutoIncField;
    ADOQuery1employeeid: TIntegerField;
    ADOQuery1leavetype: TIntegerField;
    ADOQuery1startdate: TDateTimeField;
    ADOQuery1starttime: TDateTimeField;
    ADOQuery1enddate: TDateTimeField;
    ADOQuery1endtime: TDateTimeField;
    ADOQuery1RegisterMan: TIntegerField;
    ADOQuery1leavereason: TWideStringField;
    ADOQuery1remark: TWideStringField;
    ADOQuery1makedate: TDateTimeField;
    ADOQuery1CurStatus: TIntegerField;
    ADOAskLeaveRegisterrkey: TAutoIncField;
    ADOAskLeaveRegisteremployeeid: TIntegerField;
    ADOAskLeaveRegisteremployeecode: TWideStringField;
    ADOAskLeaveRegisterchinesename: TWideStringField;
    ADOAskLeaveRegisterleavetype: TIntegerField;
    ADOAskLeaveRegisterleavetype1: TWideStringField;
    ADOAskLeaveRegisterstartdate: TDateTimeField;
    ADOAskLeaveRegisterstarttime: TDateTimeField;
    ADOAskLeaveRegisterenddate: TDateTimeField;
    ADOAskLeaveRegisterendtime: TDateTimeField;
    ADOAskLeaveRegisterregisterman: TIntegerField;
    ADOAskLeaveRegisterregisterman1: TStringField;
    ADOAskLeaveRegistermakedate: TDateTimeField;
    ADOAskLeaveRegisterCurStatus: TIntegerField;
    ADOAskLeaveRegisterCurStatus1: TStringField;
    ADOAskLeaveRegisterleavereason: TWideStringField;
    ADOAskLeaveRegisterremark: TWideStringField;
    ADOAskLeaveRegisterdepartmentname: TWideStringField;
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
