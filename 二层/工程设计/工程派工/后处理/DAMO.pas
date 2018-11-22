unit DAMO;

interface

uses
  SysUtils, Classes, DB, ADODB, DBClient, Provider;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    Ado538: TADOQuery;
    DataSource1: TDataSource;
    Ado538MANU_PART_NUMBER: TStringField;
    Ado538MANU_PART_DESC: TStringField;
    Ado538curr_date: TDateTimeField;
    Ado538CUST_PART_PTR: TIntegerField;
    Ado538order_qty: TIntegerField;
    Ado538CONF_DATE: TDateTimeField;
    Ado538so_oldnew: TStringField;
    Ado538HCL_DATE: TDateTimeField;
    tmp: TADOQuery;
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
    DSP2: TDataSetProvider;
    CDS2: TClientDataSet;
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
    Ado538IF_HCL: TStringField;
    Ado538STATUS: TStringField;
    Ado538HCL_STATUS: TWordField;
    Ado538SHCL_STATUS: TStringField;
    Ado538au_name: TStringField;
    Ado538HCL_USER_PTR: TIntegerField;
    Ado538SCH_DATE: TDateTimeField;
    Ado538PROD_CODE: TStringField;
    Ado538PRODUCT_NAME: TStringField;
    Ado538QAE_END_DATE: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses Main;

{$R *.dfm}

end.
