unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB, DBClient, Provider;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADO0745: TADODataSet;
    DataSource2: TDataSource;
    ADO0741: TADOQuery;
    DataSource3: TDataSource;
    ADO0742: TADOQuery;
    ADO0742dept_name: TStringField;
    ADO0742rkey: TAutoIncField;
    ADO0742d741_ptr: TIntegerField;
    ADO0742d34_index: TIntegerField;
    ADO0742d34_ptr: TIntegerField;
    ADO0746: TADOQuery;
    DataSource4: TDataSource;
    ADO0742rkey742: TAutoIncField;
    ADO0745Rkey: TAutoIncField;
    ADO0745F_NUM: TStringField;
    ADO0745RKEY10: TIntegerField;
    ADO0745RKEY25: TIntegerField;
    ADO0745RKEY60: TIntegerField;
    ADO0745QUAN_ON_HAND: TIntegerField;
    ADO0745MANU_PART_NUMBER: TStringField;
    ADO0745CUSTOMER_NAME: TStringField;
    ADO0745ABBR_NAME: TStringField;
    ADO0745CreateDate: TDateTimeField;
    ADO0745BEIZHU: TStringField;
    ADO0745AUDITED_ptr: TIntegerField;
    ADO0745EMPLOYEE_NAME: TStringField;
    ADO0745check_type: TIntegerField;
    ADO0745circle: TIntegerField;
    ADO0745DSDesigner: TMemoField;
    ADO0745check_status: TIntegerField;
    ADO0745DSDesigner2: TStringField;
    ADO0745SALES_ORDER: TStringField;
    ADOTMP1: TADOQuery;
    ADOTMP2: TADOQuery;
    ADOTMP3: TADOQuery;
    ADODel742: TADOQuery;
    ADO0746rkey: TAutoIncField;
    ADO0746d745_ptr: TIntegerField;
    ADO0746d34_index: TIntegerField;
    ADO0746d34_ptr: TIntegerField;
    ADO0746check_person: TIntegerField;
    ADO0746check_status: TIntegerField;
    ADO0746check_time: TDateTimeField;
    ADO0746employee_name: TStringField;
    ADO0746dept_name: TStringField;
    ADO0746DSDesigner: TStringField;
    DataSource5: TDataSource;
    ADO0740: TADOQuery;
    ADO0740DEPT_CODE: TStringField;
    ADO0740DEPT_NAME: TStringField;
    ADO0740DifficultPoint: TWideStringField;
    ADO0740BEIZHU: TWideStringField;
    ADO0740TestResult: TWideStringField;
    Queryofbp: TADOQuery;
    Queryofbpd741_ptr: TIntegerField;
    Queryofbptype_code: TStringField;
    Queryofbpname: TWideStringField;
    Queryofbpdept_name: TStringField;
    ADOD04: TADODataSet;
    ADOD04CONTROL_NO_LENGTH: TSmallintField;
    ADOD04SEED_VALUE: TStringField;
    ADOD04SEED_FLAG: TWordField;
    ADOQuery1: TADOQuery;
    QueryofbpTMP: TADOQuery;
    QueryofbpTMPd741_ptr: TIntegerField;
    QueryofbpTMPtype_code: TStringField;
    QueryofbpTMPname: TWideStringField;
    QueryofbpTMPdept_name: TStringField;
    ADO0740Rkey: TAutoIncField;
    Insert740: TADOQuery;
    ADO0741rkey: TAutoIncField;
    ADO0741type_code: TStringField;
    ADO0741name: TWideStringField;
    ADO0741remark: TWideStringField;
    ADO0741DSDesigner: TStringField;
    ADO0741Type: TIntegerField;
    ADODel: TADOQuery;
    ADOQuery6: TADOQuery;
    ADODataSet_ud2: TADOQuery;
    ADODataSet_ud2employee_id: TIntegerField;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    ADOQuery2sl: TIntegerField;
    ADOQuery3sl: TIntegerField;
    ADOQuery7: TADOQuery;
    ADOQuery4: TADOQuery;
    adsPickWorkShop: TADODataSet;
    dspPickWorkShop: TDataSetProvider;
    cdsPickWorkShop: TClientDataSet;
    dsPickWorkShop: TDataSource;
    adsPickWorkShopIsSelected: TBooleanField;
    adsPickWorkShopRKEY: TIntegerField;
    adsPickWorkShopDept_Code: TStringField;
    adsPickWorkShopDept_Name: TStringField;
    Insert740Rkey: TAutoIncField;
    Insert740RKEY745: TIntegerField;
    Insert740RKEY34: TIntegerField;
    Insert740DifficultPoint: TWideStringField;
    Insert740BEIZHU: TWideStringField;
    Insert740TestResult: TWideStringField;
    Insert740TestDate: TDateTimeField;
    Insert740Create_ptr: TIntegerField;
    ADODel740: TADOQuery;
    ADO0740STEP_NUMBER: TSmallintField;
    ADO0740rkey34: TAutoIncField;
    procedure ADO0741AfterScroll(DataSet: TDataSet);
    procedure adsPickWorkShopAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rkey747: Integer;
  dm: Tdm;
  
implementation


{$R *.dfm}







procedure Tdm.ADO0741AfterScroll(DataSet: TDataSet);
begin
  with  dm.ADO0742 do
  begin
  close;
  Parameters.ParamByName('rkey741').Value:=dm.ADO0741rkey.Value;
  Open;
  end;
end;

procedure Tdm.adsPickWorkShopAfterOpen(DataSet: TDataSet);
begin
 cdsPickWorkShop.Data := dspPickWorkShop.Data;
end;

end.
