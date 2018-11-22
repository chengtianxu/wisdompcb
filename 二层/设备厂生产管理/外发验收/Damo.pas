unit Damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    dsMain: TDataSource;
    qryMain: TADOQuery;
    qryTemp: TADOQuery;
    qryWZCP89: TADOQuery;
    dsWZCP89: TDataSource;
    wdstrngfldWZCP89Rec_No: TWideStringField;
    qryWZCP89External_Rkey: TIntegerField;
    qryWZCP89Check_Date: TDateTimeField;
    qryWZCP89Check_Person: TIntegerField;
    wdstrngfldWZCP89Rec_Remark: TWideStringField;
    qryWZCP89rkey: TIntegerField;
    qryWZCP89ExTernal_No: TStringField;
    wdstrngfldWZCP89ExTernal_Desc: TWideStringField;
    qryWZCP89Ent_Date: TDateTimeField;
    qryWZCP89Ent_UserRkey: TIntegerField;
    qryWZCP89Author: TIntegerField;
    qryWZCP89Author_Date: TDateTimeField;
    qryWZCP89FacRkey: TIntegerField;
    qryWZCP89DeptRkey: TIntegerField;
    qryWZCP89SupplierRkey: TIntegerField;
    wdstrngfldWZCP89RelPerson: TWideStringField;
    wdstrngfldWZCP89RelPhone: TWideStringField;
    wdstrngfldWZCP89BillKind: TWideStringField;
    wdstrngfldWZCP89PayKindDesc: TWideStringField;
    wdstrngfldWZCP89RecAddress: TWideStringField;
    qryWZCP89FinishDate: TDateTimeField;
    wdstrngfldWZCP89Remark: TWideStringField;
    qryWZCP89Status: TIntegerField;
    qryWZCP89PutIntoRkey: TIntegerField;
    qryWZCP89StatusName: TStringField;
    qryWZCP89SUPPLIER_NAME: TStringField;
    qryWZCP89WAREHOUSE_NAME: TStringField;
    qryWZCP89Dept_Name: TStringField;
    qryWZCP89Cut_no: TStringField;
    qryWZCP89CUSTOMER_NAME: TStringField;
    qryWZCP89PROD_CODE: TStringField;
    qryWZCP89PRODUCT_NAME: TStringField;
    qryWZCP89DSDesigner: TStringField;
    qryWZCP89DSDesigner2: TStringField;
    qryWZCP89DSDesigner3: TStringField;
    qryMainrkey: TIntegerField;
    qryMainExTernal_No: TStringField;
    wdstrngfldMainExTernal_Desc: TWideStringField;
    qryMainEnt_Date: TDateTimeField;
    qryMainEnt_UserRkey: TIntegerField;
    qryMainAuthor: TIntegerField;
    qryMainAuthor_Date: TDateTimeField;
    qryMainFacRkey: TIntegerField;
    qryMainDeptRkey: TIntegerField;
    qryMainSupplierRkey: TIntegerField;
    wdstrngfldMainRelPerson: TWideStringField;
    wdstrngfldMainRelPhone: TWideStringField;
    wdstrngfldMainBillKind: TWideStringField;
    wdstrngfldMainPayKindDesc: TWideStringField;
    wdstrngfldMainRecAddress: TWideStringField;
    qryMainFinishDate: TDateTimeField;
    wdstrngfldMainRemark: TWideStringField;
    qryMainStatus: TIntegerField;
    qryMainPutIntoRkey: TIntegerField;
    qryMainStatusName: TStringField;
    qryMainSUPPLIER_NAME: TStringField;
    qryMainWAREHOUSE_NAME: TStringField;
    qryMainDept_Name: TStringField;
    qryMainCut_no: TStringField;
    qryMainCUSTOMER_NAME: TStringField;
    qryMainPROD_CODE: TStringField;
    qryMainPRODUCT_NAME: TStringField;
    qryMainDSDesigner: TStringField;
    qryMainDSDesigner2: TStringField;
    qryMainPrice: TFloatField;
    qryWZCP89Rec_Price: TFloatField;
    qryWZCP89Price: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
    Ftag: Integer;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
