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
    Aqwz306: TADOQuery;
    Aqwz307: TADOQuery;
    Aqwz307STANDARD: TStringField;
    Aqwz307rece_quantity: TIntegerField;
    ADOwz306: TADOQuery;
    Aqwz306v_status: TStringField;
    Aqwz307UNIT_NAME: TStringField;
    ADOwz307: TADOQuery;
    ADOQuery2: TADOQuery;
    Aq304: TADOQuery;
    Aqwz307RETURN_QTY: TIntegerField;
    Aqwz307MANU_PART_NUMBER: TStringField;
    Aqwz307MANU_PART_DESC: TStringField;
    Aqwz307reject_qty: TIntegerField;
    tmp: TADOQuery;
    Aqwz306rkey: TAutoIncField;
    Aqwz306rejected_number: TStringField;
    Aqwz306DELIVER_NUMBER: TStringField;
    Aqwz306EPIBOLY_PTR: TIntegerField;
    Aqwz306CODE: TStringField;
    Aqwz306SUPPLIER_NAME: TStringField;
    Aqwz306ABBR_NAME: TStringField;
    Aqwz306epiboly_number: TStringField;
    Aqwz306DEPT_CODE: TStringField;
    Aqwz306DEPT_NAME: TStringField;
    Aqwz306EMPL_CODE: TStringField;
    Aqwz306EMPLOYEE_NAME: TStringField;
    Aqwz306ENT_DATE: TDateTimeField;
    Aqwz306STATUS: TWordField;
    Aqwz306REMARK: TStringField;
    Aqwz306return_qty: TIntegerField;
    Aqwz306AUTH_EMPL: TIntegerField;
    Aqwz306AUTH_DATE: TDateTimeField;
    Aqwz307rework_qry: TIntegerField;
    Aqwz307received_qty: TIntegerField;
    Aqwz307particulars_REMARK: TStringField;
    Aqwz307rejected_ptr: TIntegerField;
    Aqwz306return_date: TDateTimeField;
    Aqwz306RKEY303: TAutoIncField;
    ADOwz306rkey: TAutoIncField;
    ADOwz306rejected_number: TStringField;
    ADOwz306DELIVER_PTR: TIntegerField;
    ADOwz306supp_ptr: TIntegerField;
    ADOwz306DEPT_PTR: TIntegerField;
    ADOwz306EMPL_PTR: TIntegerField;
    ADOwz306return_date: TDateTimeField;
    ADOwz306ENT_DATE: TDateTimeField;
    ADOwz306STATUS: TWordField;
    ADOwz306REMARK: TStringField;
    ADOwz306return_qty: TIntegerField;
    ADOwz306AUTH_EMPL: TIntegerField;
    ADOwz306AUTH_DATE: TDateTimeField;
    ADOwz307RKEY: TAutoIncField;
    ADOwz307rejected_ptr: TIntegerField;
    ADOwz307received_ptr: TIntegerField;
    ADOwz307CUSTPART_PTR: TIntegerField;
    ADOwz307UNIT_NAME: TStringField;
    ADOwz307STANDARD: TStringField;
    ADOwz307rework_qry: TIntegerField;
    ADOwz307received_qty: TIntegerField;
    ADOwz307particulars_REMARK: TStringField;
    Aq304rece_quantity: TIntegerField;
    Aq304MANU_PART_NUMBER: TStringField;
    Aq304MANU_PART_DESC: TStringField;
    Aq304rework_qry_304: TIntegerField;
    Aq304RKEY: TAutoIncField;
    Aq304rework_qry_307: TIntegerField;
    Aq304UNIT_NAME: TStringField;
    Aq304received_qty: TIntegerField;
    Aq304particulars_REMARK: TStringField;
    Aq304rejected_ptr: TIntegerField;
    Aq304STANDARD: TStringField;
    Aq304CUSTPART_PTR: TIntegerField;
    Aq304received_ptr: TIntegerField;
    Aq04: TADOQuery;
    Aq04CONTROL_NO_LENGTH: TSmallintField;
    Aq04SEED_VALUE: TStringField;
    Aq04SEED_FLAG: TWordField;
    Aqwz306AUTH_EMPLOYEE_NAME: TStringField;
    Aqwz306AUTH_EMPL_CODE: TStringField;
    Aq304rework_qry_sum307: TIntegerField;
    Aq304received_qty_sum307: TIntegerField;
    procedure Aqwz306CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

procedure Tdm.Aqwz306CalcFields(DataSet: TDataSet);
begin
  case aqwz306status.Value of
    1 : aqwz306v_status.Value := '未提交';
    2 : aqwz306v_status.Value := '待审批';
    3 : aqwz306v_status.Value := '已批准';
    4 : aqwz306v_status.Value := '已收货';
    5 : aqwz306v_status.Value := '被退回';
  end;
end;

end.

