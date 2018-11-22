unit DM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdamo = class(TDataModule)
    ADOConnection1: TADOConnection;
    qrydept: TADOQuery;
    qrydeptrkey: TIntegerField;
    qrydeptdepartmentname: TWideStringField;
    qrydeptdepartmentcode: TWideStringField;
    qrydeptsuperior: TIntegerField;
    qrydeptchargename: TWideStringField;
    qrydeptdepartmentration: TIntegerField;
    qrydeptdepartmentcount: TIntegerField;
    qrydeptscarcity: TIntegerField;
    qrysex: TADOQuery;
    dssex: TDataSource;
    qrysexDSDesigner: TStringField;
    qrysexDSDesigner2: TIntegerField;
    qrytemp: TADOQuery;
    qryempWhere: TADOQuery;
    qryempWhererkey: TAutoIncField;
    qryempWhereemployeecode: TWideStringField;
    qryempWherechinesename: TWideStringField;
    qryempWhereondutytime: TDateTimeField;
    qryempWhereoutdutytime: TDateTimeField;
    qryempWhereF2: TBCDField;
    dsempWhere: TDataSource;
    qryempWheredepartmentname: TWideStringField;
    dsBirthday: TDataSource;
    qryBirthday: TADOQuery;
    qryempWherebirthday: TStringField;
    qryBirthdayDSDesigner: TStringField;
    qryBirthdayDSDesigner2: TIntegerField;
    qryempWheresex: TStringField;
    qryempWhereWorkAge: TBCDField;
    qryWorkAge: TADOQuery;
    dsWorkAge: TDataSource;
    qryWorkAgeWorkAge: TIntegerField;
    qryWorkAgea: TWideStringField;
    qryempWhereitem: TWideStringField;
    dsEducation: TDataSource;
    qryEducation: TADOQuery;
    qryEducationitem: TWideStringField;
    qryEducationField: TIntegerField;
    dsSalary: TDataSource;
    qrySalary: TADOQuery;
    IntegerField1: TIntegerField;
    qrySalaryField: TWideStringField;
    dsProvince: TDataSource;
    qryempWhereprovince: TWideStringField;
    qryProvince: TADOQuery;
    WideStringField1: TWideStringField;
    IntegerField2: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  damo: Tdamo;

implementation

{$R *.dfm}

end.
