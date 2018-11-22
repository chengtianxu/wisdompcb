unit UDM137;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADO137: TADOQuery;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADO137curr_date: TDateTimeField;
    ADO137avlage_area: TBCDField;
    ADO137total_takeout: TBCDField;
    ADO137avlage_consume: TBCDField;
    ADO137actual_consume: TBCDField;
    ADO137diff: TBCDField;
    ADO155_1: TADOQuery;
    ADO155_1control_ptr: TIntegerField;
    ADO155_1invt_ptr: TIntegerField;
    ADO155_1INV_NAME: TStringField;
    ADO155_1UNIT_NAME: TStringField;
    ADO155_1INV_PART_NUMBER: TStringField;
    ADO155_1Rkey02: TAutoIncField;
    ADO154_1: TADOQuery;
    ADO154_1control_ptr: TIntegerField;
    ADO154_1dept_ptr: TIntegerField;
    ADO154_1DEPT_CODE: TStringField;
    ADO154_1DEPT_NAME: TStringField;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ADO136: TADOQuery;
    ADO136rkey: TAutoIncField;
    ADO136warehouse_ptr: TIntegerField;
    ADO136WAREHOUSE_CODE: TStringField;
    ADO136WAREHOUSE_NAME: TStringField;
    ADO136ABBR_NAME: TStringField;
    ADO136stan_consume: TBCDField;
    ADO136control_name: TStringField;
    ADO136unit_ptr: TIntegerField;
    DataSource4: TDataSource;
    procedure ADO136AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADO136AfterScroll(DataSet: TDataSet);
begin
 { ADO154_1.Close;
  ADO154_1.Parameters[0].Value:=DataSet.FieldValues['rkey'];
  ADO154_1.Open;
  ADO155_1.Close;
  ADO155_1.Parameters[0].Value:=DataSet.FieldValues['rkey'];
  ADO155_1.Open; }
end;

end.
