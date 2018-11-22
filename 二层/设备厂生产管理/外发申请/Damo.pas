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
    qryMainrkey: TAutoIncField;
    qryMainExTernal_No: TStringField;
    wdstrngfldMainExTernal_Desc: TWideStringField;
    qryMainPrice: TBCDField;
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
    qryMainWAREHOUSE_NAME: TStringField;
    qryMainDept_Name: TStringField;
    qryMainEName: TStringField;
    qryMainAName: TStringField;
    qryMainCut_no: TStringField;
    qryMainCUSTOMER_NAME: TStringField;
    qryMainPROD_CODE: TStringField;
    qryMainPRODUCT_NAME: TStringField;
    qryWZCP0088: TADOQuery;
    qryWZCP0088rkey: TAutoIncField;
    qryWZCP0088ExTernal_No: TStringField;
    wdstrngfldWZCP0088ExTernal_Desc: TWideStringField;
    qryWZCP0088Price: TBCDField;
    qryWZCP0088Ent_Date: TDateTimeField;
    qryWZCP0088Ent_UserRkey: TIntegerField;
    qryWZCP0088Author: TIntegerField;
    qryWZCP0088Author_Date: TDateTimeField;
    qryWZCP0088FacRkey: TIntegerField;
    qryWZCP0088DeptRkey: TIntegerField;
    qryWZCP0088SupplierRkey: TIntegerField;
    wdstrngfldWZCP0088RelPerson: TWideStringField;
    wdstrngfldWZCP0088RelPhone: TWideStringField;
    wdstrngfldWZCP0088BillKind: TWideStringField;
    wdstrngfldWZCP0088PayKindDesc: TWideStringField;
    wdstrngfldWZCP0088RecAddress: TWideStringField;
    qryWZCP0088FinishDate: TDateTimeField;
    wdstrngfldWZCP0088Remark: TWideStringField;
    qryWZCP0088Status: TIntegerField;
    qryWZCP0088PutIntoRkey: TIntegerField;
    qryMainSUPPLIER_NAME: TStringField;
    intgrfldWZCP0088CommitUserRkey: TIntegerField;
    intgrfldMainCommitUserRkey: TIntegerField;
    qryMainCName: TStringField;
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
