unit DM;

interface

uses
  SysUtils, Classes, DB, ADODB, common;

type
  Tdamo = class(TDataModule)
    con1: TADOConnection;
    qry1: TADOQuery;
    qry2: TADOQuery;
    ds1: TDataSource;
    qry3: TADOQuery;
    qrytemp: TADOQuery;
    ds2: TDataSource;
    qry4: TADOQuery;
    qry5: TADOQuery;
    ds3: TDataSource;
    qry6: TADOQuery;
    ds4: TDataSource;
    ds7: TDataSource;
    qry7: TADOQuery;
    qry5BedRkey: TAutoIncField;
    qry5R_name: TWideStringField;
    qry5D_name: TWideStringField;
    qry5D_code: TStringField;
    qry5R_code: TStringField;
    qry5B_code: TStringField;
    qry5idcard: TWideStringField;
    qry5sex: TStringField;
    qry5startdate: TDateTimeField;
    qry5oper_time_in: TDateTimeField;
    qry5enddate: TDateTimeField;
    qry5oper_time_out: TDateTimeField;
    qry5remark: TWideStringField;
    qry5Emprkey: TAutoIncField;
    qry5position: TWideStringField;
    qry5departmentname: TWideStringField;
    qry5employeecode: TWideStringField;
    qry5chinesename: TWideStringField;
    qry5out_name: TStringField;
    qry5in_name: TStringField;
    qry6BedRkey: TAutoIncField;
    qry6R_name: TWideStringField;
    qry6D_name: TWideStringField;
    qry6D_code: TStringField;
    qry6R_code: TStringField;
    qry6B_code: TStringField;
    qry6idcard: TWideStringField;
    qry6sex: TStringField;
    qry6BedUseMsgrkey: TAutoIncField;
    qry6startdate: TDateTimeField;
    qry6oper_time_in: TDateTimeField;
    qry6enddate: TDateTimeField;
    qry6oper_time_out: TDateTimeField;
    qry6remark: TWideStringField;
    qry6Emprkey: TAutoIncField;
    qry6position: TWideStringField;
    qry6departmentname: TWideStringField;
    qry6employeecode: TWideStringField;
    qry6chinesename: TWideStringField;
    qry6out_name: TStringField;
    qry6in_name: TStringField;
    qryWCinfo: TADOQuery;
    dsWCinfo: TDataSource;
    qryWCinfoemployeecode: TWideStringField;
    qryWCinfochinesename: TWideStringField;
    qryWCinfosexName: TStringField;
    qryWCinfodepartmentname: TWideStringField;
    qryWCinfofactoryarea: TWideStringField;
    qryWCinforegdate: TDateTimeField;
    qryWCinforoomcode: TWideStringField;
    qryWCinfoIDCard: TWideStringField;
    qryWCinfoprovince: TWideStringField;
    qry_changebed: TADOQuery;
    qry5bedroomuserkey: TAutoIncField;
    qry5BedUseMsgrkey: TAutoIncField;
    qry5addr: TWideStringField;
    qry6addr: TWideStringField;
  private
    { Private declarations }

  public
    { Public declarations }
    BtnTag, AddTag: Integer;
  end;

var
  damo: Tdamo;

implementation


{$R *.dfm}

end.
