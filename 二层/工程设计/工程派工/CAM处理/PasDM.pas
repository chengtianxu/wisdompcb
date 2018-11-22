unit PasDM;

interface

uses
  SysUtils, Classes, DB, ADODB, DBClient, Provider;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    Ado538: TADOQuery;
    tmp: TADOQuery;
    Ado538MANU_PART_NUMBER: TStringField;
    Ado538MANU_PART_DESC: TStringField;
    Ado538curr_date: TDateTimeField;
    Ado538CUST_PART_PTR: TIntegerField;
    Ado538STATUS: TWordField;
    Ado538order_qty: TIntegerField;
    Ado538CONF_DATE: TDateTimeField;
    Ado538so_oldnew: TStringField;
    Ado538YSZP_USER_PTR: TIntegerField;
    Ado538YSZP_DATE: TDateTimeField;
    Ado538YS_USER_PTR: TIntegerField;
    Ado538YS_STAR_DATE: TDateTimeField;
    Ado538YS_EDN_DATE: TDateTimeField;
    Ado538YS_EQ_STATUS: TWordField;
    Ado538YS_EQ_STAR: TDateTimeField;
    Ado538YS_EQ_END: TDateTimeField;
    Ado538CAMZP_USER_PTR: TIntegerField;
    Ado538CAMZP_DATE: TDateTimeField;
    Ado538CAM_USER_PTR: TIntegerField;
    Ado538CAM_STAR_DATE: TDateTimeField;
    Ado538CAM_EDN_DATE: TDateTimeField;
    Ado538CAM_EQ_STATUS: TWordField;
    Ado538CAM_EQ_STAR: TDateTimeField;
    Ado538CAM_EQ_END: TDateTimeField;
    Ado538CAM_SENDBACK: TDateTimeField;
    Ado538QAE_USER_PTR: TIntegerField;
    Ado538QAE_STAR_DATE: TDateTimeField;
    Ado538QAE_SENDBACK: TDateTimeField;
    Ado538E_NAME1: TStringField;
    Ado538E_NAME2: TStringField;
    Ado538E_NAME3: TStringField;
    Ado538E_NAME5: TStringField;
    Ado538E_NAME4: TStringField;
    Ado538PROD_CODE: TStringField;
    Ado538PRODUCT_NAME: TStringField;
    DataSource1: TDataSource;
    Ado538str_status: TStringField;
    Ado538QAE_END_DATE: TDateTimeField;
    Ado0849: TADOQuery;
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
    Ado538YS_EQ_STATUS2: TStringField;
    Ado538CAM_EQ_STATUS2: TStringField;
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
