unit demo;

interface

uses
  SysUtils, Classes, DB, ADODB;
type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    DS1: TDataSource;
    ADO0696: TADOQuery;
    DS2: TDataSource;
    ADOTMP1: TADOQuery;
    ADODataSet_ud: TADODataSet;
    ADO0697: TADODataSet;
    ADO0697file_name: TWideStringField;
    ADO0697submit_person: TIntegerField;
    ADO0697submit_person_name: TStringField;
    ADO0697submit_date: TDateTimeField;
    ADO0697modify_person: TIntegerField;
    ADO0697modify_person_name: TStringField;
    ADO0697modify_date: TDateTimeField;
    ADO0697flag: TIntegerField;
    ADO0697contract_rkey: TIntegerField;
    ADOD04: TADODataSet;
    ADOD04CONTROL_NO_LENGTH: TSmallintField;
    ADOD04SEED_VALUE: TStringField;
    ADOD04SEED_FLAG: TWordField;
    ADO0691: TADOQuery;
    DS691: TDataSource;
    ADO0692: TADOQuery;
    DS692: TDataSource;
    ADO0692dept_name: TStringField;
    ADO0692rkey: TAutoIncField;
    ADO0692d691_ptr: TIntegerField;
    ADO0692d34_index: TIntegerField;
    ADO0692d34_ptr: TIntegerField;
    ADO0692remark: TWideStringField;
    ADO0691rkey: TAutoIncField;
    ADO0691type_code: TStringField;
    ADO0691name: TWideStringField;
    ADO0691remark: TWideStringField;
    ADO0696submit_person: TIntegerField;
    ADO0696submit_department: TIntegerField;
    ADO0696check_status: TIntegerField;
    ADO0696circle: TIntegerField;
    ADO0696DSDesigner: TLargeintField;
    ADO0696DSDesigner2: TWideStringField;
    ADO0696DSDesigner3: TWideStringField;
    ADO0696DSDesigner4: TWideStringField;
    ADO0696en: TWideStringField;
    ADO0696DSDesigner5: TDateTimeField;
    ADO0696DSDesigner6: TStringField;
    ADO0696DSDesigner7: TStringField;
    ADO0696DSDesigner8: TMemoField;
    ADO0696DSDesigner9: TWideStringField;
    ADO0696remark: TMemoField;
    ADO0696party_a: TIntegerField;
    ADO0693: TADOQuery;
    DS693: TDataSource;
    ADO0693rkey: TAutoIncField;
    ADO0693d696_ptr: TIntegerField;
    ADO0693d34_index: TIntegerField;
    ADO0693d34_ptr: TIntegerField;
    ADO0693check_person: TIntegerField;
    ADO0693check_status: TIntegerField;
    ADO0693check_time: TDateTimeField;
    ADO0693check_suggestion: TMemoField;
    ADO0693employee_name: TStringField;
    ADO0693dept_name: TStringField;
    ADO0696submit_suggestion: TMemoField;
    ADO0693DSDesigner: TStringField;
    ADOTMP2: TADOQuery;
    Queryofbp: TADOQuery;
    ADO0696check_type: TIntegerField;
    ADO0696rkey: TAutoIncField;
    ADO0696DSDesigner10: TStringField;
    ADO0696DSDesigner11: TDateTimeField;
    ADO0696Audit_Prt: TIntegerField;
    ADO0696Audit_Date: TDateTimeField;
    ADO0696type_code: TStringField;
    ADO0696name: TWideStringField;
    ADO0696Rkey691: TAutoIncField;
    procedure ADO0696AfterScroll(DataSet: TDataSet);
    procedure ADO0696AfterOpen(DataSet: TDataSet);
    procedure ADO0691AfterScroll(DataSet: TDataSet);
  private
  public
  end;
var
  dm: Tdm;
  rkey696: Integer;
  DBMemoString: string;
  op_people: Integer;  //操作员ID
  people_department: Integer; //操作员部门
  people_right: integer; //操作员权限
  DBMemoActive: Integer;   //当前活跃建议
  rkey696_status: integer; //当前记录状态
  rkey696_circle: integer; //事务环
  active_department: integer;//激活部门
  active_people_flag: integer;//是否要求激活操作员 0，1
  active_people: integer;//激活的操作员
  submit_people: integer;//合同创建者
  ever_people: integer; //曾审人，当通过一审之后，等待二审时，只存在与3，4，5，7的ever_people=6审人
  last_check_dept :Integer;
  last_check_deptindex :Integer;
  last_d0693_rkey :Integer;
  last_checktime :TDateTime;
  last_checkperson : Integer;
  //未审核标识
  //菜单权限重排
implementation
{$R *.dfm}
procedure Tdm.ADO0696AfterScroll(DataSet: TDataSet);
var b8,b17,b21,b23,b25: Byte;
begin   
  if not dm.ADO0696.IsEmpty  then
    begin
      ado0697.Active := false;
      ado0693.Active := false;
      ado0697.Parameters[0].Value := DataSet.FieldValues['rkey'];
      ADO0693.Parameters[0].Value := DataSet.FieldValues['rkey'];
      rkey696 := DataSet.FieldValues['rkey'];
      ado0697.Active := true;
      ado0693.Active := true;
  end;
  if dm.ADO0696.IsEmpty then
    begin
      rkey696:=0; 
      dm.ADO0697.Active:=false;
    end;

end;

procedure Tdm.ADO0696AfterOpen(DataSet: TDataSet);
var b8,b17,b21,b23,b25: Byte;
begin


  if not dm.ADO0696.IsEmpty  then
    begin
      ado0697.Active := false;
      ado0693.Active := false;
      ado0697.Parameters[0].Value := DataSet.FieldValues['rkey'];
      ADO0693.Parameters[0].Value := DataSet.FieldValues['rkey'];
      rkey696 := DataSet.FieldValues['rkey'];
      ado0697.Active := true;
      ado0693.Active := true;
  end;
  if dm.ADO0696.IsEmpty then
    begin
      rkey696:=0;
      dm.ADO0697.Active:=false;
    end;
end;

procedure Tdm.ADO0691AfterScroll(DataSet: TDataSet);
begin
  ADO0692.Parameters[0].Value := ADO0691rkey.Value;
    dm.ADO0692.Active := False;
    dm.ADO0692.Active := true;
end;

end.
