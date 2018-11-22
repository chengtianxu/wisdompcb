unit DEMO;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    dsMain: TADODataSet;
    dsAux: TADODataSet;
    dsEmp: TADODataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    dsMainrkey: TAutoIncField;
    dsMainroomid: TIntegerField;
    dsMainyearmonth: TStringField;
    dsMainR_decrease_e: TFloatField;
    dsMainR_decrease_w: TFloatField;
    dsMainelectic_f: TFloatField;
    dsMainwater_f: TFloatField;
    dsMainperson_freque: TIntegerField;
    dsMainsould_pay: TFloatField;
    dsMainr_code: TStringField;
    dsMainr_name: TWideStringField;
    dsMainD_name: TWideStringField;
    dsMainlast_fees: TFloatField;
    dsAuxrkey: TAutoIncField;
    dsAuxbedroomfeesid: TIntegerField;
    dsAuxbeduseid: TIntegerField;
    dsAuxemployeeid: TIntegerField;
    dsAuxstay_days: TIntegerField;
    dsAuxsubfees: TFloatField;
    dsAuxstartdate: TDateTimeField;
    dsAuxenddate: TDateTimeField;
    dsAuxB_code: TStringField;
    dsAuxemployeecode: TWideStringField;
    dsAuxchinesename: TWideStringField;
    dsEmprkey: TAutoIncField;
    dsEmpbedroomfeesid: TIntegerField;
    dsEmpbeduseid: TIntegerField;
    dsEmpemployeeid: TIntegerField;
    dsEmpstay_days: TIntegerField;
    dsEmpsubfees: TFloatField;
    dsEmpeffect_flag: TBooleanField;
    dsEmpischecked: TBooleanField;
    dsEmpstartdate: TDateTimeField;
    dsEmpenddate: TDateTimeField;
    dsEmpB_code: TStringField;
    dsEmpemployeecode: TWideStringField;
    dsEmpchinesename: TWideStringField;
    dsEmpfactoryarea: TWideStringField;
    dsEmpdepartmentname: TWideStringField;
    dsEmpr_name: TWideStringField;
    dsEmpD_name: TWideStringField;
    dsEmpStayGrade: TStringField;
    dsEmpposition: TWideStringField;
    dsEmpgrade: TWideStringField;
    dsEmpsubefees: TBCDField;
    dsEmpsubwfees: TBCDField;
    dsEmpsubrfees: TBCDField;
    dsEmpbuzhu: TBCDField;
    dsEmptotalfees: TBCDField;
    dsEmpstrcouple: TStringField;
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
