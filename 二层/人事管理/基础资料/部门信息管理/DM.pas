unit DM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM_dept = class(TDataModule)
    con_dept: TADOConnection;
    qry_dept: TADOQuery;
    ds_dept: TDataSource;
    qry_deptrkey: TAutoIncField;
    qry_deptdepartmentname: TWideStringField;
    qry_deptdepartmentcode: TWideStringField;
    qry_deptsuperior: TIntegerField;
    qry_deptchargename: TWideStringField;
    qry_deptdepartmentration: TIntegerField;
    qry_deptdepartmentcount: TIntegerField;
    qry_deptscarcity: TIntegerField;
    procedure qry_deptPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure qry_deptEditError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_dept: TDM_dept;

implementation

{$R *.dfm}

procedure TDM_dept.qry_deptPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Abort;
end;

procedure TDM_dept.qry_deptEditError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Abort;
end;

end.
