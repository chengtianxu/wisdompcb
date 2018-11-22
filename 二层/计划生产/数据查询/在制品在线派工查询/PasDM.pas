unit PasDM;

interface

uses
  SysUtils, Classes, DB, ADODB, Provider, DBClient;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOQuery4: TADOQuery;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    Ado0849: TADOQuery;
    Ado0849Sel: TBooleanField;
    Ado0849Rkey: TAutoIncField;
    Ado0849D419_ptr: TIntegerField;
    Ado0849D073_ptr: TIntegerField;
    Ado0849FormName: TStringField;
    Ado0849GridName: TStringField;
    Ado0849FieldName: TStringField;
    Ado0849FieldCaption: TStringField;
    Ado0849FieldOrder: TIntegerField;
    Ado0849FieldWidth: TIntegerField;
    Ado0849IsDisplay: TBooleanField;
    CDS2: TClientDataSet;
    DSP2: TDataSetProvider;
    Ado849s: TADOQuery;
    Ado849sRkey: TAutoIncField;
    Ado849sD419_ptr: TIntegerField;
    Ado849sD073_ptr: TIntegerField;
    Ado849sFormName: TStringField;
    Ado849sGridName: TStringField;
    Ado849sFieldName: TStringField;
    Ado849sFieldCaption: TStringField;
    Ado849sFieldOrder: TIntegerField;
    Ado849sFieldWidth: TIntegerField;
    Ado849sIsDisplay: TBooleanField;
    ADOQuery4WORK_ORDER_NUMBER: TStringField;
    ADOQuery4CUST_CODE: TStringField;
    ADOQuery4MANU_PART_NUMBER: TStringField;
    ADOQuery4MANU_PART_DESC: TStringField;
    ADOQuery4ANALYSIS_CODE_2: TStringField;
    ADOQuery4DEPT_CODE: TStringField;
    ADOQuery4DEPT_NAME: TStringField;
    ADOQuery4DSDesigner: TDateTimeField;
    ADOQuery4DSDesigner2: TDateTimeField;
    ADOQuery4DSDesigner3: TDateTimeField;
    ADOQuery4STEP: TSmallintField;
    ADOQuery4DSDesigner4: TIntegerField;
    ADOQuery4DSDesigner22: TIntegerField;
    ADOQuery4DEPT_PTR: TIntegerField;
    ADOQuery4pnl_size: TStringField;
    ADOQuery4DSDesigner5: TFloatField;
    ADOQuery4PANEL: TIntegerField;
    ADOQuery4PCS: TFloatField;
    ADOQuery4PANEL2: TIntegerField;
    ADOQuery4RELEASE_DATE: TDateTimeField;
    ADOQuery4PROD_STATUS: TSmallintField;
    ADOQuery4DSDesigner6: TStringField;
    ADOQuery4DSDesigner7: TStringField;
    ADOQuery4wip_area: TFloatField;
    ADOQuery4CUT_NO: TStringField;
    ADOQuery4SALES_ORDER: TStringField;
    ADOQuery4DSDesigner8: TStringField;
    ADOQuery4DSDesigner9: TStringField;
    ADOQuery4DSDesigner10: TStringField;
    ADOQuery4DSDesigner11: TStringField;
    ADOQuery4PO_NUMBER: TStringField;
    ADOQuery4so_oldnew: TStringField;
    ADOQuery4REFERENCE: TStringField;
    ADOQuery4sotp: TStringField;
    ADOQuery4ttype: TStringField;
    ADOQuery4FLOW_NO: TSmallintField;
    ADOQuery4ABBR_NAME: TStringField;
    ADOQuery4Rkey: TIntegerField;
    ADOQuery4DSDesigner12: TStringField;
    ADOQuery4assign_cycle: TIntegerField;
    ADOQuery4assign_date: TDateTimeField;
    ADOQuery4DateValue: TBCDField;
    ADOQuery4DSDesigner13: TDateTimeField;
    ADOQuery4DSDesigner14: TBCDField;
    ADOQuery4DSDesigner15: TStringField;
    ADOQuery4DSDesigner16: TIntegerField;
    ADOQuery4pl_area: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
