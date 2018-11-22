unit DataModuleUnit;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery1rkey: TAutoIncField;
    ADOQuery1WAREHOUSE_NAME: TStringField;
    ADOQuery1WAREHOUSE_CODE: TStringField;
    ADOQuery1stan_consume: TBCDField;
    ADOQuery1warehouse_ptr: TIntegerField;
    ADOQuery1ABBR_NAME: TStringField;
    aqry136: TADOQuery;
    aqry136rkey: TAutoIncField;
    aqry136warehouse_ptr: TIntegerField;
    aqry136stan_consume: TBCDField;
    ADO73: TADOQuery;
    ADO73user_id: TStringField;
    ADO73user_full_name: TStringField;
    ADO73rkey: TAutoIncField;
    ADO139: TADOQuery;
    ADO139_1: TADOQuery;
    ADO139_1USER_LOGIN_NAME: TStringField;
    ADO139_1USER_FULL_NAME: TStringField;
    ADO139_1RKEY: TAutoIncField;
    ADO139rkey136: TIntegerField;
    ADO139csi_ptr: TIntegerField;
    ADO73PHONE: TStringField;
    ADO139_1PHONE: TStringField;
    ADO017: TADOQuery;
    ADO034: TADOQuery;
    ADO034RKEY: TAutoIncField;
    ADO034DEPT_CODE: TStringField;
    ADO034DEPT_NAME: TStringField;
    ADO034TTYPE: TStringField;
    ADO034ACTIVE_FLAG: TWordField;
    ADO034IS_COST_DEPT: TWordField;
    ADO017RKEY: TAutoIncField;
    ADO017INV_PART_NUMBER: TStringField;
    ADO017INV_PART_DESCRIPTION: TStringField;
    ADO017UNIT_NAME: TStringField;
    ADO154: TADOQuery;
    ADO155: TADOQuery;
    ADO155control_ptr: TIntegerField;
    ADO155dept_ptr: TIntegerField;
    ADO154control_ptr: TIntegerField;
    ADO154invt_ptr: TIntegerField;
    ADO154_1: TADOQuery;
    ADO155_1: TADOQuery;
    ADO155_1control_ptr: TIntegerField;
    ADO155_1dept_ptr: TIntegerField;
    ADO155_1DEPT_CODE: TStringField;
    ADO155_1DEPT_NAME: TStringField;
    ADO154_1control_ptr: TIntegerField;
    ADO154_1invt_ptr: TIntegerField;
    ADO154_1INV_NAME: TStringField;
    ADO154_1UNIT_NAME: TStringField;
    ADO154_1INV_PART_NUMBER: TStringField;
    ADO139_1EMPL_CODE: TStringField;
    ADO139_1rkey136: TIntegerField;
    ADO139_1csi_ptr: TIntegerField;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DataSource1: TDataSource;
    ds1: TDataSource;
    aqry136control_name: TStringField;
    aqry136unit_ptr: TIntegerField;
    ADOQuery1control_name: TStringField;
    ADOQuery1unit_ptr: TIntegerField;
    ADO017Rkey02: TAutoIncField;
    ADO154_1Rkey02: TAutoIncField;
    smlntfldADOQuery1group_id: TSmallintField;
    smlntfldaqry136group_id: TSmallintField;
    aqry136Important_mtl: TWordField;
    aqry136Prod_Area_Type: TWordField;
    aqry136Depletion: TFloatField;
    aqry136Plating: TFloatField;
    aqry136Depth: TFloatField;
    aqry136Density: TFloatField;
    aqry136Formula: TStringField;
    aqry136Formula_Result: TFloatField;
    aqry136Mtl_Type: TWordField;
    ADOQuery1Important_mtl: TWordField;
    ADOQuery1Prod_Area_Type: TWordField;
    ADOQuery1Depletion: TFloatField;
    ADOQuery1Depth: TFloatField;
    ADOQuery1Plating: TFloatField;
    ADOQuery1Density: TFloatField;
    ADOQuery1Formula: TStringField;
    ADOQuery1Formula_Result: TFloatField;
    ADOQuery1Mtl_Type: TWordField;
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
  ADO154_1.Close;
  ADO154_1.Parameters[0].Value:=DataSet.FieldValues['rkey'];
  ADO154_1.Open;
  ADO155_1.Close;
  ADO155_1.Parameters[0].Value:=DataSet.FieldValues['rkey'];
  ADO155_1.Open;
  ADO139_1.Close;
  ADO139_1.Parameters[0].Value:=DataSet.FieldValues['rkey'];
  ADO139_1.Open;
end;

end.

