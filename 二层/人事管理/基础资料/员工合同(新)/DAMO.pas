unit DAMO;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    adoMain: TADODataSet;
    DataSource1: TDataSource;
    adoMainchinesename: TWideStringField;
    adoMainemployeecode: TWideStringField;
    adoMaindepartmentname: TWideStringField;
    adoMainondutytime: TDateTimeField;
    adoMainposition: TIntegerField;
    adoMaincode: TWideStringField;
    adoMainstartdate: TDateTimeField;
    adoMainprobationdate: TDateTimeField;
    adoMainenddate: TDateTimeField;
    adoMaintype: TIntegerField;
    adoMainstatus: TIntegerField;
    adoMainremark: TWideStringField;
    adoMainopration_person: TIntegerField;
    adoMaininputdate: TDateTimeField;
    adoMainEMPLOYEE_NAME: TStringField;
    adoMainrkey: TIntegerField;
    adoMaincontracttype: TWideStringField;
    adoMainPositionName: TWideStringField;
    adoTime: TADOQuery;
    adoMainstatusname: TStringField;
    adoWill: TADODataSet;
    adoNot: TADODataSet;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    adoOut: TADODataSet;
    adoWillchinesename: TWideStringField;
    adoWillemployeecode: TWideStringField;
    adoWilldepartmentname: TWideStringField;
    adoWillmemo: TWideStringField;
    adoWillcode: TWideStringField;
    adoWillenddate: TDateTimeField;
    adoWillcontracttype: TWideStringField;
    adoWillrkey: TAutoIncField;
    adoNotdepartmentname: TWideStringField;
    adoNotemployeecode: TWideStringField;
    adoNotdepartmentid: TIntegerField;
    adoNotchinesename: TWideStringField;
    adoNotondutytime: TDateTimeField;
    adoNotposition_item: TWideStringField;
    adoNotemployee_typeitem: TWideStringField;
    adoOutchinesename: TWideStringField;
    adoOutemployeecode: TWideStringField;
    adoOutdepartmentname: TWideStringField;
    adoOutmemo: TWideStringField;
    adoOutcode: TWideStringField;
    adoOutenddate: TDateTimeField;
    adoOutcontracttype: TWideStringField;
    adoOutrkey: TAutoIncField;
    adoTmp: TADOQuery;
    adoManager: TADODataSet;
    adoTopManager: TADODataSet;
    DataSource5: TDataSource;
    DataSource6: TDataSource;
    adoManagerchinesename: TWideStringField;
    adoManageremployeecode: TWideStringField;
    adoManagerdepartmentname: TWideStringField;
    adoManagerposition: TIntegerField;
    adoManagercontracttype: TWideStringField;
    adoManagercode: TWideStringField;
    adoManagerstartdate: TDateTimeField;
    adoManagerprobationdate: TDateTimeField;
    adoManagerenddate: TDateTimeField;
    adoManagertype: TIntegerField;
    adoManagerstatus: TIntegerField;
    adoManagerstatusname: TStringField;
    adoManagerremark: TWideStringField;
    adoManagerrkey: TIntegerField;
    adoManagerPositionName: TWideStringField;
    adoTopManagerchinesename: TWideStringField;
    adoTopManageremployeecode: TWideStringField;
    adoTopManagerdepartmentname: TWideStringField;
    adoTopManagerposition: TIntegerField;
    adoTopManagercontracttype: TWideStringField;
    adoTopManagercode: TWideStringField;
    adoTopManagerstartdate: TDateTimeField;
    adoTopManagerprobationdate: TDateTimeField;
    adoTopManagerenddate: TDateTimeField;
    adoTopManagertype: TIntegerField;
    adoTopManagerstatus: TIntegerField;
    adoTopManagerstatusname: TStringField;
    adoTopManagerremark: TWideStringField;
    adoTopManagerrkey: TIntegerField;
    adoTopManagerPositionName: TWideStringField;
    adoWillstartdate: TDateTimeField;
    adoMainage: TFloatField;
    adoWillposition: TWideStringField;
    adoOutposition_item: TWideStringField;
    adoManagerondutytime: TDateTimeField;
    adoManagerworkage: TBCDField;
    adoTopManagerondutytime: TDateTimeField;
    adoTopManagerworkage: TBCDField;
    adoMainworkage: TBCDField;
    adoWillworkage: TBCDField;
    adoWilltype: TIntegerField;
    adoOutworkage: TBCDField;
    DataSource7: TDataSource;
    adoOver: TADODataSet;
    adoOverchinesename: TWideStringField;
    adoOveremployeecode: TWideStringField;
    adoOverdepartmentname: TWideStringField;
    adoOverrkey: TAutoIncField;
    adoOverbirthday: TDateTimeField;
    adoOverage: TBCDField;
    adoOverworkage: TBCDField;
    adoMainbirthday: TDateTimeField;
    adoMainsex: TIntegerField;
    adoMainstrsex: TStringField;
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
