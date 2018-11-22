unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    AQ414: TADOQuery;
    AQ414number414: TStringField;
    AQ414qty_rece: TIntegerField;
    AQ414qty_to_be_reworked: TIntegerField;
    AQ414qty_to_be_remaked: TIntegerField;
    AQ414sys_date414: TDateTimeField;
    AQ414EMPLOYEE_NAME: TStringField;
    AQ414number415: TStringField;
    AQ414MANU_PART_NUMBER: TStringField;
    AQ414MANU_PART_DESC: TStringField;
    AQ414ABBR_NAME10: TStringField;
    AQ414status: TWordField;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    AQ414rkey: TAutoIncField;
    ADO414: TADOQuery;
    ADO414rkey: TAutoIncField;
    ADO414number: TStringField;
    ADO414empl_ptr: TIntegerField;
    ADO414d415_ptr: TIntegerField;
    ADO414qty_rece: TIntegerField;
    ADO414qty_to_be_reworked: TIntegerField;
    ADO414qty_to_be_remaked: TIntegerField;
    ADO414status: TWordField;
    ADO414sys_date: TDateTimeField;
    ADO04: TADOQuery;
    ADO04SEED_VALUE: TStringField;
    ADO04SEED_FLAG: TWordField;
    DataSource2: TDataSource;
    ADO99: TADOQuery;
    DataSource3: TDataSource;
    AQ39: TADOQuery;
    AQ39RKEY: TAutoIncField;
    AQ39REJ_CODE: TStringField;
    AQ39REJECT_DESCRIPTION: TStringField;
    AQ39REJECT_DEFECT_FLAG: TStringField;
    AQ39type: TStringField;
    ADO99RKEY: TAutoIncField;
    ADO99CUSTOMER_PART_PTR: TIntegerField;
    ADO99REJECT_CODE_PTR: TIntegerField;
    ADO99RMA_PTR: TIntegerField;
    ADO99EMPLOYEE_PTR: TIntegerField;
    ADO99CSI_USER_PTR: TIntegerField;
    ADO99TDATE: TDateTimeField;
    ADO99QUANTITY: TIntegerField;
    ADO99REFERENCE_NUMBER: TStringField;
    ADO99rej_code: TStringField;
    ADO99rej_desc: TStringField;
    ADO99v_type: TStringField;
    DataSource4: TDataSource;
    AQ414QTY_REWORKED: TIntegerField;
    AQ414QTY_REMAKED: TIntegerField;
    ADO414QTY_REWORKED: TIntegerField;
    ADO414QTY_REMAKED: TIntegerField;
    AQ414custpart_ptr: TIntegerField;
    AQ414quantity: TIntegerField;
    AQ414qty_received: TIntegerField;
    ADO414reference: TMemoField;
    AQ414type: TWordField;
    AQ414area_rece: TFloatField;
    AQ414v_status: TStringField;
    procedure AQ39CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.AQ39CalcFields(DataSet: TDataSet);
begin
 if AQ39REJECT_DEFECT_FLAG.Value='D' then
  AQ39type.Value := '不良品'
 else
  AQ39type.Value := '报废品';
end;

end.
