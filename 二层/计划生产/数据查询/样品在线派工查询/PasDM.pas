unit PasDM;

interface

uses
  SysUtils, Classes, DB, ADODB, DBClient, Provider;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    Ado586: TADOQuery;
    Ado586DEPT_CODE: TStringField;
    Ado586DEPT_NAME: TStringField;
    Ado586DataValues: TBCDField;
    Ado586Rkey: TIntegerField;
    tmp: TADOQuery;
    Ado587: TADOQuery;
    Ado587s: TADOQuery;
    Ado587sMANU_PART_NUMBER: TStringField;
    Ado587sWORK_ORDER_NUMBER: TStringField;
    Ado587sRELEASE_DATE: TDateTimeField;
    Ado587sDEPT_CODE: TStringField;
    Ado587sDEPT_NAME: TStringField;
    Ado587sSTEP_NUMBER: TIntegerField;
    Ado587sPROCESS_Add_TIME: TFloatField;
    Ado587sRemark: TStringField;
    Ado587sRkey06: TIntegerField;
    Ado587sRKey25: TIntegerField;
    Ado587sUser_Ptr: TIntegerField;
    Ado587sOperDate: TDateTimeField;
    ADOQuery1: TADOQuery;
    Ado587sEMPLOYEE_NAME: TStringField;
    Ado48: TADOQuery;
    Ado48DEPT_NAME: TStringField;
    Ado48OUTTIME: TDateTimeField;
    Ado48STEP_NUMBER: TSmallintField;
    ado283: TADOQuery;
    ado283PRIORITY_CODE: TWordField;
    ado283PRIORITY_name: TStringField;
    Ado586TType: TSmallintField;
    Ado586PRIORITY_name: TStringField;
    Ado587WORK_ORDER_NUMBER: TStringField;
    Ado587CUST_CODE: TStringField;
    Ado587MANU_PART_NUMBER: TStringField;
    Ado587MANU_PART_DESC: TStringField;
    Ado587ANALYSIS_CODE_2: TStringField;
    Ado587DEPT_CODE: TStringField;
    Ado587DEPT_NAME: TStringField;
    Ado587DSDesigner: TDateTimeField;
    Ado587DSDesigner2: TDateTimeField;
    Ado587DSDesigner3: TDateTimeField;
    Ado587STEP: TSmallintField;
    Ado587DSDesigner4: TIntegerField;
    Ado587DSDesigner22: TIntegerField;
    Ado587DEPT_PTR: TIntegerField;
    Ado587pnl_size: TStringField;
    Ado587DSDesigner5: TFloatField;
    Ado587PANEL: TIntegerField;
    Ado587PCS: TFloatField;
    Ado587PANEL2: TIntegerField;
    Ado587RELEASE_DATE: TDateTimeField;
    Ado587PROD_STATUS: TSmallintField;
    Ado587DSDesigner6: TStringField;
    Ado587DSDesigner7: TStringField;
    Ado587wip_area: TFloatField;
    Ado587CUT_NO: TStringField;
    Ado587SALES_ORDER: TStringField;
    Ado587DSDesigner8: TStringField;
    Ado587DSDesigner9: TStringField;
    Ado587DSDesigner10: TStringField;
    Ado587DSDesigner11: TStringField;
    Ado587PO_NUMBER: TStringField;
    Ado587so_oldnew: TStringField;
    Ado587REFERENCE: TStringField;
    Ado587sotp: TStringField;
    Ado587ttype: TStringField;
    Ado587FLOW_NO: TSmallintField;
    Ado587ABBR_NAME: TStringField;
    Ado587Rkey: TIntegerField;
    Ado587value1: TFloatField;
    Ado587value2: TBCDField;
    Ado587NewDate: TDateTimeField;
    Ado587LaveDate34: TIntegerField;
    Ado587ModernDate34: TDateTimeField;
    Ado587STEP_NUMBER: TSmallintField;
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
    Ado587PRIORITY_name: TStringField;
    Ado587STATUS2: TStringField;
    Ado587V4: TBCDField;
    Ado587WL: TIntegerField;
    Ado587PRIORITY_CODE: TWordField;
    Ado587rkey_1: TIntegerField;
    Ado587rkey06: TIntegerField;
    Ado587rkey56: TIntegerField;
    Ado587PARENT_PTR: TIntegerField;
    Ado587BOM_PTR: TIntegerField;
    Ado587WTYPE: TSmallintField;
    Ado587QUAN_REJ: TFloatField;
    Ado587QUAN_PROD: TFloatField;
    Ado587PARTS_ORDERED: TFloatField;
    Ado587TO_BE_STOCKED: TFloatField;
    Ado587ORIG_CUSTOMER: TStringField;
    ado283iSort: TWordField;
    Ado587NewDate2: TDateTimeField;
    Ado587Code10: TStringField;
    Ado587REFERENCE_1: TStringField;
    Ado587WLDate: TDateTimeField;
    Ado587MyData0492TTYPE: TStringField;
    Ado587dept_code1: TStringField;
    Ado587dept_name1: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;
  ListDEPT,ListDEPT2: TStringList; //¥Ê¡–±Ì
  dListDEPT:TList;

implementation

{$R *.dfm}

{ TDM }


end.
