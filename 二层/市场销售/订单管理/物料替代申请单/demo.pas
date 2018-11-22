unit demo;

interface

uses
  SysUtils, Classes, DB, ADODB,common;
type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    DS1: TDataSource;
    ADOTMP1: TADOQuery;
    ADODataSet_ud: TADODataSet;
    ADOD04: TADODataSet;
    ADOD04CONTROL_NO_LENGTH: TSmallintField;
    ADOD04SEED_VALUE: TStringField;
    ADOD04SEED_FLAG: TWordField;
    ADO542: TADOQuery;
    DS542: TDataSource;
    ADO544: TADOQuery;
    DS544: TDataSource;
    ADO542type_code: TStringField;
    ADO542name: TWideStringField;
    ADO542remark: TWideStringField;
    ADO545: TADOQuery;
    DS545: TDataSource;
    ADOTMP2: TADOQuery;
    Queryofbp: TADOQuery;
    ADO544dept_name: TStringField;
    ADO544d542_ptr: TIntegerField;
    ADO544d34_index: TIntegerField;
    ADO544d34_ptr: TIntegerField;
    ADO544remark: TWideStringField;
    ADO545d541_ptr: TIntegerField;
    ADO545d34_index: TIntegerField;
    ADO545d34_ptr: TIntegerField;
    ADO545check_person: TIntegerField;
    ADO545check_status: TIntegerField;
    ADO545check_time: TDateTimeField;
    ADO545check_suggestion: TMemoField;
    ADO545employee_name: TStringField;
    ADO545dept_name: TStringField;
    ADO545DSDesigner: TStringField;
    ADO542rkey: TAutoIncField;
    ADO544rkey: TAutoIncField;
    ADO545rkey: TAutoIncField;
    ADO541: TADOQuery;
    ads494: TADODataSet;
    ads494PARAMETER_NAME: TStringField;
    ads494PARAMETER_DESC: TStringField;
    ads494PARAMETER_VALUE: TStringField;
    ads494step_number: TSmallintField;
    ads494datatype: TStringField;
    ads494UNIT_NAME: TStringField;
    ads494seq_no: TSmallintField;
    ads494flow_spfc_flag: TStringField;
    DataSource5: TDataSource;
    ADO541remark: TWideStringField;
    ADO541circle: TIntegerField;
    ADO541MANU_PART_NUMBER: TStringField;
    ADO541MANU_PART_DESC: TStringField;
    ADO541DSDesigner: TStringField;
    ADO541submit_date: TDateTimeField;
    ADO541check_type: TIntegerField;
    ADO541check_status: TIntegerField;
    ADO541d025_rkey: TAutoIncField;
    ADO541DSDesigner2: TLargeintField;
    ADO541DSDesigner3: TStringField;
    ADO541INVT_PTR: TIntegerField;
    ADO541d05_ptr: TIntegerField;
    ADO541R34_ptr: TIntegerField;
    ADO541Group_ptr: TIntegerField;
    ADS541: TADOQuery;
    ADS541rkey: TAutoIncField;
    ADS541MATERIAL_REPLACE_NO: TStringField;
    ADS541INVT_PTR: TIntegerField;
    ADS541submit_date: TDateTimeField;
    ADS541d05_ptr: TIntegerField;
    ADS541submit_suggestion: TMemoField;
    ADS541check_status: TIntegerField;
    ADS541check_type: TIntegerField;
    ADS541remark: TWideStringField;
    ADS541circle: TIntegerField;
    ADS541R34_ptr: TIntegerField;
    ADO541DSDesigner4: TStringField;
    ADO541DSDesigner5: TStringField;
    ADO541DSDesigner6: TStringField;
    ADO541DSDesigner7: TMemoField;
    ADO541rkey: TAutoIncField;
    ADO541DSDesigner8: TStringField;
    ADO541DSDesigner9: TStringField;
    ADO541QUAN_ON_HAND: TFloatField;
    ADS541QUAN_ON_HAND: TFloatField;
    ads494SOURCE_PTR: TIntegerField;
    ads494DEPT_PTR: TIntegerField;
    ads494Expr1: TSmallintField;
    ADO541beizhu: TWideStringField;
    ADS541beizhu: TWideStringField;
    ADO541reason: TWideStringField;
    ADS541reason: TWideStringField;
    ADOQuery1: TADOQuery;
    ADOQuery1rkey: TAutoIncField;
    ADS541d25_rkey: TIntegerField;
    procedure ADO541AfterOpen(DataSet: TDataSet);
    procedure ADO541AfterScroll(DataSet: TDataSet);
    procedure ADO542AfterScroll(DataSet: TDataSet);
  private
  public
     ads494SQL:string;
  end;
var
  dm: Tdm;
  rkey541: Integer;
  DBMemoString: string;
  op_people: Integer;  //操作员ID
  people_department: Integer; //操作员部门
  people_right: integer; //操作员权限
  DBMemoActive: Integer;   //当前活跃建议
  rkey541_status: integer; //当前记录状态
  rkey541_circle: integer; //事务环
  active_department: integer;//激活部门
  active_people_flag: integer;//是否要求激活操作员 0，1
  active_people: integer;//激活的操作员
  submit_people: integer;//合同创建者
  ever_people: integer; //曾审人，当通过一审之后，等待二审时，只存在与3，4，5，7的ever_people=6审人
  last_check_dept :Integer;
  last_check_deptindex :Integer;
  last_d545_rkey :Integer;
  last_checktime :TDateTime;
  last_checkperson : Integer;
  //未审核标识
  //菜单权限重排
implementation
{$R *.dfm}

procedure Tdm.ADO541AfterOpen(DataSet: TDataSet);
begin
  if not dm.ADO541.IsEmpty then
    begin
      ADO545.Active := false;
      ADO545.Parameters[0].Value := DataSet.FieldValues['rkey'];
      rkey541 := DataSet.FieldValues['rkey'];
      ADO545.Active := true;
  end;
end;

procedure Tdm.ADO541AfterScroll(DataSet: TDataSet);
begin
   if not dm.ADO541.IsEmpty  then
    begin
      ADO545.Active := false;
      ADO545.Parameters[0].Value := DataSet.FieldValues['rkey'];
      rkey541 := DataSet.FieldValues['rkey'];
      ADO545.Active := true;
  end;
end;

procedure Tdm.ADO542AfterScroll(DataSet: TDataSet);
begin
     ADO544.Parameters[0].Value := ADO542rkey.Value;
    dm.ADO544.Active := False;
    dm.ADO544.Active := true;
end;




end.
