unit dmo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConn: TADOConnection;
    ADOAskForLeave: TADODataSet;
    DataSource1: TDataSource;
    ADODetail: TADODataSet;
    ADODetailrkey: TAutoIncField;
    ADODetailitem: TWideStringField;
    ADODetaildictid: TIntegerField;
    ADOAskLeaveRegister: TADODataSet;
    ADOAskLeaveRegisterrowsCount: TIntegerField;
    ADOAskForLeaverkey: TAutoIncField;
    ADOAskForLeaveleavetype: TWideStringField;
    ADOAskForLeaveunit: TIntegerField;
    ADOAskForLeaveitem: TWideStringField;
    ADOAskForLeaveprecision: TSmallintField;
    ADOAskForLeaveworktime_calculation: TBooleanField;
    ADOAskForLeaveremark: TWideStringField;
    ADOQuery1: TADOQuery;
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
