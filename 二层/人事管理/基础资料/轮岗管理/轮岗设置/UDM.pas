unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    con_dept: TADOConnection;
    qry_dept: TADOQuery;
    qry_deptrkey: TAutoIncField;
    qry_deptdepartmentname: TWideStringField;
    qry_deptdepartmentcode: TWideStringField;
    qry_deptsuperior: TIntegerField;
    qry_deptchargename: TWideStringField;
    qry_deptdepartmentration: TIntegerField;
    qry_deptdepartmentcount: TIntegerField;
    qry_deptscarcity: TIntegerField;
    qry_deptoverproofcount: TIntegerField;
    qry_deptmax_overproof_percent: TIntegerField;
    qry_deptpre_outduty: TIntegerField;
    qry_deptstr_proof_percent: TStringField;
    qry_deptstr_over_percent: TStringField;
    qry_deptdept_totalration: TIntegerField;
    qry_deptdept_totalcount: TIntegerField;
    qry_deptdept_total_outduty: TIntegerField;
    ds_dept: TDataSource;
    ADOTMP: TADOQuery;
    update_emp_trun: TADOQuery;
    ds1: TADODataSet;
    emp_trun: TDataSource;
    ds1rkey: TAutoIncField;
    ds1departmentid: TIntegerField;
    ds1Positionid: TIntegerField;
    ds1circle: TIntegerField;
    ds1visible: TIntegerField;
    ds1remark1: TWideStringField;
    ds1departmentname: TWideStringField;
    ds1item: TWideStringField;
    ds1circleyear: TBCDField;
    procedure ds1BeforeDelete(DataSet: TDataSet);
    procedure ds1BeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    emp_trun_string_orginal : string;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ds1BeforeDelete(DataSet: TDataSet);
begin
Abort;
end;

procedure TDM.ds1BeforeInsert(DataSet: TDataSet);
begin
Abort;
end;

end.
