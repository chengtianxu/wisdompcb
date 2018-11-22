unit DM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdamo = class(TDataModule)
    ds72: TDataSource;
    qry72: TADOQuery;
    qry73: TADOQuery;
    ds73: TDataSource;
    qryTemp: TADOQuery;
    qry73RKEY_CP72: TIntegerField;
    qry73USR_PTR: TIntegerField;
    qry73WORKHOUSE: TBCDField;
    qry73REMARK: TWideStringField;
    qry73empl_code: TStringField;
    qry73employee_name: TStringField;
    qry73dept_name: TStringField;
    qry1: TADOQuery;
    ds1: TDataSource;
    qry1DSDesigner: TStringField;
    qry1DSDesigner2: TStringField;
    qry1DSDesigner3: TStringField;
    qry1DSDesigner4: TStringField;
    qry1DSDesigner5: TStringField;
    qry1DSDesigner6: TStringField;
    qry1DSDesigner7: TBCDField;
    qry1DSDesigner8: TDateTimeField;
    qry1DSDesigner9: TWideStringField;
    ds2: TDataSource;
    qry2: TADOQuery;
    qry2DSDesigner: TStringField;
    qry2DSDesigner2: TStringField;
    qry2DSDesigner3: TStringField;
    qry2DSDesigner4: TStringField;
    qry2DSDesigner5: TBCDField;
    qry3: TADOQuery;
    ds3: TDataSource;
    qry3DSDesigner: TStringField;
    qry3DSDesigner2: TStringField;
    qry3DSDesigner3: TStringField;
    qry3DSDesigner4: TBCDField;
    qry1rkey_cp72: TIntegerField;
    qry1usr_ptr: TIntegerField;
    qryTemp1: TADOQuery;
    qryTemp2: TADOQuery;
    qry72s: TADOQuery;
    qry72sRKEY: TAutoIncField;
    qry72sWORK_DATE: TDateTimeField;
    qry72sENT_DATE: TDateTimeField;
    qry72sENT_USERPTR: TIntegerField;
    qry72sAUTH_DATE: TDateTimeField;
    qry72sAUTH_USREPTR: TIntegerField;
    qry72sSTATUS: TWordField;
    qry72sTOTAL_WORKHOUSE: TBCDField;
    qry72sREMARK: TWideStringField;
    qry73s: TADOQuery;
    qry73sRKEY_CP72: TIntegerField;
    qry73sUSR_PTR: TIntegerField;
    qry73sWORKHOUSE: TBCDField;
    qry73sREMARK: TWideStringField;
    ADOConnection1: TADOConnection;
    qry72rkey: TAutoIncField;
    qry72rkey_492: TIntegerField;
    qry72work_date: TDateTimeField;
    qry72ent_date: TDateTimeField;
    qry72ent_userptr: TIntegerField;
    qry72auth_date: TDateTimeField;
    qry72auth_usreptr: TIntegerField;
    qry72status: TWordField;
    qry72statusname: TStringField;
    qry72total_workhouse: TBCDField;
    qry72remark: TWideStringField;
    qry72cut_no: TStringField;
    qry72entname: TStringField;
    qry72authname: TStringField;
    qry72prod_code: TStringField;
    qry72product_name: TStringField;
    qry72product_desc: TStringField;
    qry72rkey05: TAutoIncField;
    qry4: TADOQuery;
    ds4: TDataSource;
    qry4DSDesigner: TStringField;
    qry4DSDesigner2: TStringField;
    qry4DSDesigner3: TStringField;
    qry4DSDesigner4: TBCDField;
    qry4DSDesigner5: TBCDField;
    qry4DSDesigner6: TStringField;
    qry73begin_date: TDateTimeField;
    qry73end_date: TDateTimeField;
    dtmfldqry3DSDesigner5: TDateTimeField;
    fltfldqry3DSDesigner6: TFloatField;
    fltfldqry3DSDesigner5: TFloatField;
    procedure qry72AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  damo: Tdamo;
  Tag: Integer;

implementation

{$R *.dfm}

procedure Tdamo.qry72AfterScroll(DataSet: TDataSet);
begin
  damo.qry73.Close;
  damo.qry73.Parameters[0].Value := damo.qry72RKEY.Value;
  damo.qry73.Open;
end;

end.
