unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    con1: TADOConnection;
    qry1: TADOQuery;
    ds1: TDataSource;
    qrytemp: TADOQuery;
    qry1EmpRkey: TAutoIncField;
    qry1employeecode: TWideStringField;
    qry1chinesename: TWideStringField;
    qry1departmentname: TWideStringField;
    qry1OldName: TWideStringField;
    qry1NewName: TWideStringField;
    qry1AltRkey: TAutoIncField;
    qry1oper_date: TDateTimeField;
    qry1OperName: TWideStringField;
    qry1alterdate: TDateTimeField;
    qry1active: TIntegerField;
    qry1ActiveName: TStringField;
    qry1orginal_accountid: TIntegerField;
    qry1new_accountid: TIntegerField;
    qry1remark: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    UpdateTag: Integer;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
