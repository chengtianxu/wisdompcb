unit DMsbpr468;

interface

uses
  SysUtils, Classes, ADODB, DB, common;

type
  TDM = class(TDataModule)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOConnection1: TADOConnection;
    ADS492: TADODataSet;
    ADS468: TADODataSet;
    ADOQuery1: TADOQuery;
    ADS492rkey: TAutoIncField;
    ADS492CUT_NO: TStringField;
    ADS492SO_NO: TStringField;
    ADS492cutno: TStringField;
    ADS492EMPLOYEE_NAME: TStringField;
    ADS492ISSUED_QTY: TIntegerField;
    ADS492ISSUE_DATE: TDateTimeField;
    ADS492DSDesigner: TStringField;
    ADS492WAREHOUSE_CODE: TStringField;
    ADS492SCH_COMPL_DATE: TDateTimeField;
    ADS492REMARK: TStringField;
    ADS492PROD_CODE: TStringField;
    ADS492PRODUCT_NAME: TStringField;
    ADS492PRODUCT_DESC: TStringField;
    ADS492DEPT_CODE: TStringField;
    ADS492DEPT_NAME: TStringField;
    ADS468QUAN_BOM: TFloatField;
    ADS468QUAN_ISSUED: TFloatField;
    ADS468UNIT_NAME: TStringField;
    ADS468DSDesigner: TStringField;
    ADS468DSDesigner2: TStringField;
    ADS468VENDOR: TStringField;
    ADS468CUT_NO: TStringField;
    ADS468RKEY: TIntegerField;
    ADS492DSDesigner2: TStringField;
    ADS468PROD_CODE: TStringField;
    ADS468PRODUCT_NAME: TStringField;
    ADS468PRODUCT_DESC: TStringField;
    ADS492if_control: TBooleanField;
    ADS492bom_ptr: TIntegerField;
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    function checkbomqry(rk08:Integer):Boolean;
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

function TDM.checkbomqry(rk08: Integer): Boolean;
begin
  Result:=False;
  with TADOQuery.Create(nil) do
  begin
    Connection:=ADOConnection1;
    SQL.Clear;
    SQL.Add(Format('SELECT  COUNT(*) AS qry FROM WZCP0100 WHERE (CSI_PTR = %s ) AND (PROC_PTR = %d )',[rkey73,rk08]));
    try
      Open;
      First;
      Result:=Fields[0].AsInteger>0;
    except
      Result:=False;
    end;
    Close;
    Free;
  end;
end;

procedure TDM.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  ADS468.Close;
  ADS468.Parameters[0].Value:=ADS492.FieldValues['cutno'];
  if  ADS492.FieldByName('if_control').AsBoolean then
  begin
    if not checkbomqry(ADS492.FieldByName('bom_ptr').AsInteger) then
    ADS468.Parameters[0].Value:=0;
  end;
  ADS468.Open;
end;

end.
