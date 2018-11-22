
unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    qrySalaryJL: TADOQuery;
    ds1: TDataSource;
    qrytemp: TADOQuery;
    sp1: TADOStoredProc;
    ds2: TDataSource;
    qry2: TADOQuery;
    qry3: TADOQuery;
    ds3: TDataSource;
    qry2rkey: TIntegerField;
    qry2employeecode: TWideStringField;
    qry2chinesename: TWideStringField;
    qry2departmentname: TWideStringField;
    qry2item: TWideStringField;
    qry2accountName: TWideStringField;
    qry3itemname: TWideStringField;
    qry3datafield: TWideStringField;
    qry3rkey: TAutoIncField;
    qrychosieEmp: TADOQuery;
    dschoiseEmp: TDataSource;
    qryTrain: TADOQuery;
    qryTrainrkey: TAutoIncField;
    qryTrainemployeecode: TWideStringField;
    qryTrainchinesename: TWideStringField;
    qryTraindepartmentname: TWideStringField;
    qryTrainTrain_No: TStringField;
    qryTrainTrain_topics: TWideStringField;
    dsTrain: TDataSource;
    qryDetail: TADOQuery;
    dsDetail: TDataSource;
    qryDetailrkey: TIntegerField;
    qryDetaildictid: TIntegerField;
    qryDetailitem: TWideStringField;
    qryDetailMemo: TWideStringField;
    qryTrainitem: TWideStringField;
    qrySalaryJLrkey: TIntegerField;
    qrySalaryJLaccountid: TIntegerField;
    qrySalaryJLaccountName: TWideStringField;
    qrySalaryJLemployeeid: TIntegerField;
    qrySalaryJLitemname: TWideStringField;
    qrySalaryJLdatafield: TWideStringField;
    qrySalaryJLoriginaldata: TFloatField;
    qrySalaryJLnewdata: TFloatField;
    qrySalaryJLeffect_date: TDateTimeField;
    qrySalaryJLeffect_flag: TStringField;
    qrySalaryJLoperator: TIntegerField;
    qrySalaryJLoperate_date: TDateTimeField;
    qrySalaryJLEmp_rkey: TIntegerField;
    qrySalaryJLemployeecode: TWideStringField;
    qrySalaryJLchinesename: TWideStringField;
    qrySalaryJLdepartmentname: TWideStringField;
    qrySalaryJLEMPLOYEE_NAME: TStringField;
    qrySalaryJLstatusName: TStringField;
    qrySalaryJLstatus: TWordField;
    qrySalaryJLremark: TWideStringField;
    qrySalaryJLemployee_train_flag: TBooleanField;
    qrySalaryJLtrain_flag: TBooleanField;
    qrySalaryJLPitem: TWideStringField;
    qrySalaryJLitem: TWideStringField;
    qrySalaryJLTrain_NO: TStringField;
    qrySalaryJLTrainRkey: TIntegerField;
    qryTrainTemp: TADOQuery;
    qryTrainTemprkey: TAutoIncField;
    qryTrainTempemployeeid: TIntegerField;
    qryTrainTempaccountid: TIntegerField;
    qryTrainTempitemname: TWideStringField;
    qryTrainTempdatafield: TWideStringField;
    qryTrainTemporiginaldata: TFloatField;
    qryTrainTempnewdata: TFloatField;
    qryTrainTempeffect_date: TDateTimeField;
    qryTrainTempeffect_flag: TBooleanField;
    qryTrainTempoperator: TIntegerField;
    qryTrainTempoperate_date: TDateTimeField;
    qryTrainTempremark: TWideStringField;
    qryTrainTempemployee_train_ptr: TIntegerField;
    qryTrainTempemployee_train_flag: TBooleanField;
    qryTrainTempalter_reason: TIntegerField;
    qrySalaryJLIsSelected: TBooleanField;
  private
    { Private declarations }
  public
    { Public declarations }
    UpdateTag, AccountRkey: integer;
    ItemField: String;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
