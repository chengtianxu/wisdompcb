unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    qry1: TADOQuery;
    qry2: TADOQuery;
    qrytemp: TADOQuery;
    ds2: TDataSource;
    ds1: TDataSource;
    qrytemp1: TADOQuery;
    ADOTMP: TADOQuery;
    ADOhideitem: TADODataSet;
    ds3: TDataSource;
    ADOhideitememployeecode: TWideStringField;
    ADOhideitemdepartmentname: TWideStringField;
    ADOhideitemchinesename: TWideStringField;
    ADOhideitemposition_item: TWideStringField;
    ADOhideitemf2: TBCDField;
    ADOhideitemf79: TBCDField;
    ADOhideitemf80: TBCDField;
    ADOhideitemondutytime: TDateTimeField;
    ADOhideitemf81: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
    salaryaccountrkey: Integer;
    nowyearmonth : string;
    C: Array of String;
    c_len : Integer;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
