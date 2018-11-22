unit dmo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADO60: TADODataSet;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADO360: TADODataSet;
    DataSource2: TDataSource;
    ADO360rkey: TAutoIncField;
    ADO360so_ptr: TIntegerField;
    ADO360quantity: TIntegerField;
    ADO360sch_date: TDateTimeField;
    ADO174: TADODataSet;
    ADO175: TADODataSet;
    DataSource3: TDataSource;
    ADO175rkey174: TIntegerField;
    ADO175sch_date: TDateTimeField;
    ADO175quantity: TIntegerField;
    ADO174rkey: TAutoIncField;
    ADO174so_ptr: TIntegerField;
    ADO174proposer: TIntegerField;
    ADO174proposer_Date: TDateTimeField;
    ADO174oldReply_Date: TDateTimeField;
    ADO174newReply_Date: TDateTimeField;
    ADO174approval: TIntegerField;
    ADO174approval_Date: TDateTimeField;
    ADO174status: TIntegerField;
    ADO174remark: TWideStringField;
    ADO60SALES_ORDER: TStringField;
    ADO60MANU_PART_NUMBER: TStringField;
    ADO60MANU_PART_DESC: TStringField;
    ADO60CUST_CODE: TStringField;
    ADO60PO_NUMBER: TStringField;
    ADO60PARTS_ORDERED: TFloatField;
    ADO60ENT_DATE: TDateTimeField;
    ADO60RKEY: TAutoIncField;
    ADO60oldReply_Date: TDateTimeField;
    ADO60newReply_Date: TDateTimeField;
    ADO60rkey174: TAutoIncField;
    ADO60proposer_name: TStringField;
    ADO60proposer_Date: TDateTimeField;
    ADO60approval_name: TStringField;
    ADO60approval_Date: TDateTimeField;
    ADO60status: TStringField;
    ADO60remark: TWideStringField;
    ADO60set_ordered: TIntegerField;
    ADO60ORIG_REQUEST_DATE: TDateTimeField;
    ADO60ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ADO60spell_qty: TIntegerField;
    ADO60SCH_DATE: TDateTimeField;
    ADOQuery2: TADOQuery;
    ADO60MFG_LEAD_TIME: TSmallintField;
    ADO60DAYS_EARLY_SCHEDULE: TIntegerField;
    ADO60unit_sq: TFloatField;
    ADO60dArea: TFloatField;
    ADO360planned_qty: TIntegerField;
    ADO60complete_date: TDateTimeField;
    ADO174planned_FLAG: TWideStringField;
    ADO60planned_FLAG: TWideStringField;
    procedure ADO60AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADO60AfterScroll(DataSet: TDataSet);
begin
  DM.ADO175.Close;
  DM.ADO175.Parameters[0].Value:=DM.ADO60rkey174.Value;
  DM.ADO175.Open;
end;

end.
