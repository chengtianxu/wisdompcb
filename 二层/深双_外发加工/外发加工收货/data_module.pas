unit data_module;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    Aqwz303: TADOQuery;
    Aqwz303EMPL_CODE: TStringField;
    Aqwz303EMPLOYEE_NAME: TStringField;
    Aqwz303DELIVER_NUMBER: TStringField;
    Aqwz303SHIP_DATE: TDateTimeField;
    Aqwz303STATUS: TWordField;
    Aqwz303CODE: TStringField;
    Aqwz303SUPPLIER_NAME: TStringField;
    Aqwz303ABBR_NAME: TStringField;
    Aqwz303epiboly_number: TStringField;
    Aqwz303DEPT_CODE: TStringField;
    Aqwz303DEPT_NAME: TStringField;
    Aqwz303RKEY: TAutoIncField;
    Aqwz304: TADOQuery;
    Aqwz304QUANTITY: TIntegerField;
    Aqwz304STANDARD: TStringField;
    Aqwz304rece_quantity: TIntegerField;
    Aqwz304REMARK: TStringField;
    ADOwz303: TADOQuery;
    ADOwz303RKEY: TAutoIncField;
    ADOwz303DELIVER_NUMBER: TStringField;
    ADOwz303EPIBOLY_PTR: TIntegerField;
    ADOwz303SHIP_NAME: TStringField;
    ADOwz303SHIP_DATE: TDateTimeField;
    ADOwz303ENT_DATE: TDateTimeField;
    ADOwz303STATUS: TWordField;
    ADOwz303REMARK: TStringField;
    ADOwz303EMPL_PTR: TIntegerField;
    ADOwz303TAX_cate: TStringField;
    ADOwz303pay_method: TStringField;
    ADOwz303currency_ptr: TIntegerField;
    ADOwz303exch_rate: TBCDField;
    ADOwz303totoal_money: TBCDField;
    Aqwz303v_status: TStringField;
    Aqwz303SHIP_NAME: TStringField;
    Aqwz303REMARK: TStringField;
    Aqwz304UNIT_NAME: TStringField;
    ADOwz304: TADOQuery;
    ADOQuery2: TADOQuery;
    Aq304: TADOQuery;
    Aqwz303EPIBOLY_PTR: TIntegerField;
    Aq304STANDARD: TStringField;
    Aq304QUANTITY: TIntegerField;
    Aq304UNIT_NAME: TStringField;
    Aq304REQ_DATE: TDateTimeField;
    Aq304rece_quantity: TIntegerField;
    Aq304REMARK: TStringField;
    Aq304RKEY: TIntegerField;
    Aqwz303ent_date: TDateTimeField;
    ADOwz303SUPP_PTR: TIntegerField;
    Aqwz304RETURN_QTY: TIntegerField;
    Aq304RETURN_QTY: TIntegerField;
    Aq304rece_qty: TIntegerField;
    ADOwz304DELIVER_PTR: TIntegerField;
    ADOwz304EPILIST_PTR: TIntegerField;
    ADOwz304rece_quantity: TIntegerField;
    ADOwz304RETURN_QTY: TIntegerField;
    ADOwz304REMARK: TStringField;
    Aqwz304MANU_PART_NUMBER: TStringField;
    Aqwz304MANU_PART_DESC: TStringField;
    ADOwz304reject_qty: TIntegerField;
    Aq304reject_qty: TIntegerField;
    Aq304MANU_PART_NUMBER: TStringField;
    Aq304MANU_PART_DESC: TStringField;
    Aqwz304reject_qty: TIntegerField;
    tmp: TADOQuery;
    qrytmp: TADOQuery;
    Aqwz303remark_1: TStringField;
    procedure Aqwz303CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function SqlOpen(AStr: string): Boolean;
    function SqlExec(AStr: string): Boolean;
  end;

var
  dm: Tdm;

implementation

uses
  Dialogs;

{$R *.dfm}

procedure Tdm.Aqwz303CalcFields(DataSet: TDataSet);
begin
 case aqwz303status.Value of
  1 : aqwz303v_status.Value := '未提交';
  2 : aqwz303v_status.Value := '待审核';
  3 : aqwz303v_status.Value := '已审核';
  4 : aqwz303v_status.Value := '已记帐';
  5 : aqwz303v_status.Value := '已付款';
  6 : aqwz303v_status.Value := '被退回';
 end;
end;

function Tdm.SqlExec(AStr: string): Boolean;
begin
  Result := False;
  try
    qrytmp.Close;
    qrytmp.SQL.Clear;
    qrytmp.SQL.Add(AStr);
    qrytmp.ExecSQL;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      Result := False;
    end;
  end;
end;

function Tdm.SqlOpen(AStr: string): Boolean;
begin
  Result := False;
  try
    qrytmp.Close;
    qrytmp.SQL.Clear;
    qrytmp.SQL.Add(AStr);
    qrytmp.Open;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      Result := False;
    end;
  end;
end;

end.

