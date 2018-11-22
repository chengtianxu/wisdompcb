unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    employee_contract_1: TADOQuery;
    tmp1: TADOQuery;
    tmp: TADOQuery;
    DataSource1: TDataSource;
    employee_contract: TADOQuery;
    tmp2: TADOQuery;
    employee_contractrkey: TAutoIncField;
    employee_contractcode: TWideStringField;
    employee_contractemployeeid: TIntegerField;
    employee_contractremark: TWideStringField;
    employee_contractstartdate: TStringField;
    employee_contractprobationdate: TStringField;
    employee_contractenddate: TStringField;
    employee_contracttype: TIntegerField;
    employee_contractinputdate: TDateTimeField;
    employee_contractopration_person: TIntegerField;
    employee_contractstatus: TIntegerField;
    employee_contractstatus1: TStringField;
    employee_contractemployee_NAME: TStringField;
    employee_contractemployeecode: TWideStringField;
    employee_contractondutytime: TDateTimeField;
    employee_contractitem: TWideStringField;
    employee_contractchinesename: TWideStringField;
    employee_contractdepartmentname: TWideStringField;
    employee_contractposition_item: TWideStringField;
    employee_contract_2: TADOQuery;
    DataSource2: TDataSource;
    employee_contract_2departmentname: TWideStringField;
    employee_contract_2employeecode: TWideStringField;
    employee_contract_2chinesename: TWideStringField;
    employee_contract_2ondutytime: TDateTimeField;
    employee_contract_2position_item: TWideStringField;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    employee_contract_3: TADOQuery;
    employee_contract_4: TADOQuery;
    employee_contract_3employeecode: TWideStringField;
    employee_contract_3chinesename: TWideStringField;
    employee_contract_3code: TWideStringField;
    employee_contract_3startdate: TDateTimeField;
    employee_contract_3enddate: TDateTimeField;
    employee_contract_4employeecode: TWideStringField;
    employee_contract_4chinesename: TWideStringField;
    employee_contract_4code: TWideStringField;
    employee_contract_4startdate: TDateTimeField;
    employee_contract_4enddate: TDateTimeField;
    employee_contract_2employee_typeitem: TWideStringField;
    employee_contract_3employee_typeitem: TWideStringField;
    employee_contract_4employee_typeitem: TWideStringField;
    qry1: TADOQuery;
    DataSource5: TDataSource;
    employee_contract_5: TADOQuery;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    WideStringField3: TWideStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    WideStringField4: TWideStringField;
    DataSource6: TDataSource;
    employee_contract_6: TADOQuery;
    WideStringField5: TWideStringField;
    WideStringField6: TWideStringField;
    WideStringField7: TWideStringField;
    DateTimeField3: TDateTimeField;
    DateTimeField4: TDateTimeField;
    WideStringField8: TWideStringField;
    employee_contract_5position: TWideStringField;
    employee_contract_6position: TWideStringField;
    employee_contract_3departmentname: TWideStringField;
    employee_contract_4departmentname: TWideStringField;
    employee_contract_5departmentname: TWideStringField;
    employee_contract_6departmentname: TWideStringField;
  private
    { Private declarations }
    Tag: Integer;
  public
    last_rkey: integer;
    last_remark: string;
    new_remark: string;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.




