unit DM;

interface

uses
  SysUtils, Classes, DB, ADODB, Provider, DBClient,Dialogs;

type
  TDamo = class(TDataModule)
    con1: TADOConnection;
    qry725: TADOQuery;
    ds725: TDataSource;
    qrytemp: TADOQuery;
    ds0034: TDataSource;
    ads0034: TADODataSet;
    blnfldads0034sel: TBooleanField;
    atncfldads0034rkey: TAutoIncField;
    ads0034dept_code: TStringField;
    ads0034dept_name: TStringField;
    ads0034BARCODE_ENTRY_FLAG: TStringField;
    atncfldqry725rkey: TAutoIncField;
    wdstrngfldqry725ControlItemName: TWideStringField;
    fltfldqry725TarNum: TFloatField;
    fltfldqry725TarDellTax: TFloatField;
    intgrfldqry725ItemType: TIntegerField;
    strngfldqry725name: TStringField;
    wdstrngfldqry725IsNo: TWideStringField;
    qry729: TADOQuery;
    ds729: TDataSource;
    qry729s: TADOQuery;
    ds729s: TDataSource;
    qry729srkey: TAutoIncField;
    qry729sControlItemName: TWideStringField;
    qry729sDTarNum: TFloatField;
    qry729sDProNum: TFloatField;
    qry729sDFinalProTax: TFloatField;
    qry729sMProNum: TFloatField;
    qry729sMFinalProTax: TFloatField;
    qry729sWIP: TFloatField;
    qry729sDTarDellTax: TFloatField;
    qry729sDDelTax: TFloatField;
    qry729sDFinalDelTax: TFloatField;
    qry729sMDelTax: TFloatField;
    qry729sMFinalDelTax: TFloatField;
    qry729sDate: TDateTimeField;
    qry729sStarDateTiem: TDateTimeField;
    qry729sEndDateTime: TDateTimeField;
    qry725Ord: TIntegerField;
    procedure qry725CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    UDayStr: string;
  end;

var
  Damo: TDamo;

implementation

uses
  TS;

{$R *.dfm}

procedure TDamo.qry725CalcFields(DataSet: TDataSet);
begin
  if intgrfldqry725ItemType.Value = 0 then wdstrngfldqry725IsNo.Value := 'ÊÇ'
  else wdstrngfldqry725IsNo.Value := '·ñ'
end;

end.
