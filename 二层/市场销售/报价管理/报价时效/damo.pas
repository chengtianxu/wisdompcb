unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConn: TADOConnection;
    aqTmp: TADOQuery;
    dsBrowse: TDataSource;
    adsBrowse: TADODataSet;
    aqGetDate: TADOQuery;
    adsBrowseRKEY: TIntegerField;
    adsBrowsePaperNO: TStringField;
    adsBrowseCUST_PTR: TIntegerField;
    adsBrowseMANU_PART_DESC: TStringField;
    adsBrowseType_PTR: TIntegerField;
    adsBrowseCreateBy_PTR: TIntegerField;
    adsBrowseCreateTime: TDateTimeField;
    adsBrowseStatus: TSmallintField;
    adsBrowseFinishTime: TDateTimeField;
    adsBrowseTStatus: TStringField;
    adsBrowseABBR_NAME: TStringField;
    adsBrowseCUSTOMER_NAME: TStringField;
    adsBrowseCode: TStringField;
    adsBrowseName: TStringField;
    adsBrowseTime: TIntegerField;
    adsBrowseSeqNO: TSmallintField;
    adsBrowseFileName: TStringField;
    adsBrowseUploadTime: TDateTimeField;
    adsBrowseDownloadTime: TDateTimeField;
    adsBrowseAskTime: TDateTimeField;
    adsBrowseAnswerTime: TDateTimeField;
    adsBrowseCreateBy: TStringField;
    adsBrowseUploadBy: TStringField;
    adsBrowseFirstDownloadBy: TStringField;
    dsMain: TDataSource;
    aqMain: TADOQuery;
    aqMainRKEY: TAutoIncField;
    aqMainPaperNO: TStringField;
    aqMainMANU_PART_DESC: TStringField;
    aqMainType_PTR: TIntegerField;
    aqMainCreateBy_PTR: TIntegerField;
    aqMainCreateTime: TDateTimeField;
    aqMainStatus: TSmallintField;
    aqMainFinishTime: TDateTimeField;
    at10: TADOTable;
    at5: TADOTable;
    at241: TADOTable;
    at241RKEY: TAutoIncField;
    at241Code: TStringField;
    at241Name: TStringField;
    at241Time: TIntegerField;
    at10RKEY: TAutoIncField;
    at10CUST_CODE: TStringField;
    at10CUSTOMER_NAME: TStringField;
    at10ABBR_NAME: TStringField;
    at5RKEY: TAutoIncField;
    at5EMPL_CODE: TStringField;
    at5EMPLOYEE_NAME: TStringField;
    aqMainCUSTOMER_NAME: TStringField;
    aqMainTypeCode: TStringField;
    aqMainTypeName: TStringField;
    aqDetail: TADOQuery;
    dsDetail: TDataSource;
    aqDetailRKEY: TAutoIncField;
    aqDetailPTR_242: TIntegerField;
    aqDetailSeqNO: TSmallintField;
    aqDetailFileName: TStringField;
    aqDetailUploadTime: TDateTimeField;
    aqDetailDownloadTime: TDateTimeField;
    aqDetailAskTime: TDateTimeField;
    aqDetailAnswerTime: TDateTimeField;
    aqDetailUploadBy_PTR: TIntegerField;
    aqDetailFirstDownloadBy_PTR: TIntegerField;
    aqDetailUploadBy: TStringField;
    aqDetailFirstDownloadBy: TStringField;
    adsBrowseCUST_CODE: TStringField;
    dsSetItem: TDataSource;
    aqSetItem: TADOQuery;
    aqSetItemRKEY: TAutoIncField;
    aqSetItemCode: TStringField;
    aqSetItemName: TStringField;
    aqSetItemTime: TIntegerField;
    aqMainIsGerberData: TBooleanField;
    aqMainIsProdNotesData: TBooleanField;
    aqMainIsPbData: TBooleanField;
    aqMainOtherData: TBooleanField;
    aqMainOtherDataInfo: TStringField;
    aqDetailAskInfo: TStringField;
    aqDetailAnswerInfo: TStringField;
    aqMainCUST_PTR: TIntegerField;
    aq244: TADOQuery;
    ds244: TDataSource;
    aq244RKEY: TAutoIncField;
    aq244PTR_73: TIntegerField;
    at73: TADOTable;
    at73RKEY: TIntegerField;
    at73USER_FULL_NAME: TStringField;
    aq244USER_FULL_NAME: TStringField;
    adsBrowseQuote_Status: TSmallintField;
    adsBrowseTQuote_Status: TStringField;
    adsBrowseQuote_FinishTime: TDateTimeField;
    aqMainQuote_Status: TSmallintField;
    aqMainQuote_FinishTime: TDateTimeField;
    aqMainSales_Ptr: TIntegerField;
    adsBrowseCancelReason: TStringField;
    aqMainCancelReason: TStringField;
    aqMainCurr_Ptr: TIntegerField;
    at1: TADOTable;
    AutoIncField1: TAutoIncField;
    at1CURR_CODE: TStringField;
    at1CURR_NAME: TStringField;
    aqMainCURR_CODE: TStringField;
    aqMainCURR_NAME: TStringField;
    aqMainRemark: TStringField;
    adsBrowseRemark: TStringField;
    ds247: TDataSource;
    aq247: TADOQuery;
    aq247RKEY: TAutoIncField;
    aq247ProdUsageID: TStringField;
    aq247ProdUsageName: TStringField;
    aqMainNote: TStringField;
    adsBrowseAskInfo: TStringField;
    adsBrowseAnswerInfo: TStringField;
    aqMainCreateBy1: TStringField;
    aqMainCUST_CODE2: TStringField;
    aqMainABBR_NAME2: TStringField;
    aqMainIsNewCustQuote: TBooleanField;
    adsBrowseNewCustQuote: TStringField;
    aqDetailAnswerRecveTime: TDateTimeField;
    aqDetailAnswerRecvePeople: TIntegerField;
    procedure aqMainAfterScroll(DataSet: TDataSet);
    procedure aqMainBeforeClose(DataSet: TDataSet);
    procedure aqMainCalcFields(DataSet: TDataSet);
    procedure aqMainNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

procedure Tdm.aqMainAfterScroll(DataSet: TDataSet);
begin
  with aqDetail do
  begin
    Close;
    Parameters.ParamByName('RKEY242').Value:= aqMainRKEY.Value;
    Open;
  end;
end;

procedure Tdm.aqMainBeforeClose(DataSet: TDataSet);
begin
  aqDetail.Close;
end;

procedure Tdm.aqMainCalcFields(DataSet: TDataSet);
begin
  if not aqMain.FieldByName('CUST_PTR').IsNull then
  begin
    with aqTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select CUST_CODE,CUSTOMER_NAME from Data0010 where rkey='+aqMain.FieldByName('CUST_PTR').AsString);
      Open;
    end;
    aqMain.FieldByName('CUST_CODE').AsString:= aqTmp.FieldByName('CUST_CODE').AsString;
    aqMain.FieldByName('ABBR_NAME').AsString:= aqTmp.FieldByName('CUSTOMER_NAME').AsString;
  end;
  
  if not aqMain.FieldByName('Sales_Ptr').IsNull then
  begin
    with aqTmp do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select EMPL_CODE,EMPLOYEE_NAME from Data0005 where rkey='+aqMain.FieldByName('Sales_Ptr').AsString);
      Open;
    end;
    aqMain.FieldByName('Sales').AsString:= aqTmp.FieldByName('EMPLOYEE_NAME').AsString;
  end;
end;

procedure Tdm.aqMainNewRecord(DataSet: TDataSet);
begin
  with aqMain do
  begin
    FieldByName('IsGerberData').AsBoolean:= False;
    FieldByName('IsProdNotesData').AsBoolean:= False;
    FieldByName('IsPbData').AsBoolean:= False;
    FieldByName('OtherData').AsBoolean:= False;
//    FieldByName('IsNewCustQuote').AsBoolean:= False;
  end;
end;

end.
