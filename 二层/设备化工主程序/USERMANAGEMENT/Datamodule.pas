unit Datamodule;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOData0073: TADOQuery;
    ADOData0073RKEY: TIntegerField;
    ADOData0073USER_ID: TStringField;
    ADOData0073USER_FULL_NAME: TStringField;
    ADOData0073USER_LOGIN_NAME: TStringField;
    ADOData0073USER_PASSWORD: TStringField;
    ADOData0073USER_GROUP_FLAG: TSmallintField;
    ADOData0073LANGUAGE_FLAG: TStringField;
    ADOData0073GROUP_PTR: TIntegerField;
    ADOData0073EMPLOYEE_PTR: TIntegerField;
    ADOData0073TTYPE: TStringField;
    ADOData0419: TADOQuery;
    ADO0073: TADOQuery;
    ADOData0073TGROUP: TStringField;
    DataSource1: TDataSource;
    ADO0005: TADOQuery;
    ADOData0073EMPLOYEE_NAME: TStringField;
    ADOData0074: TADOQuery;
    ADO0074: TADOQuery;
    ADOData0073ACTIVE_FLAG: TSmallintField;
    ADOData0074A: TADOQuery;
    ADOData0073rpl_pr_ptr: TIntegerField;
    ADOData0073rpl_po_ptr: TIntegerField;
    ADOData0074bk: TADOQuery;
    ADO0005rkey: TAutoIncField;
    ADO0005empl_code: TStringField;
    ADO0005employee_name: TStringField;
    ADOData0073epiboly_ptr: TIntegerField;
    ADOData0073draw_materiel_ptr: TIntegerField;
    procedure ADOData0073CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADOData0073CalcFields(DataSet: TDataSet);
begin
  if Adodata0073.FieldByName('user_group_flag').asinteger=1 then
    Adodata0073.fieldbyname('ttype').asstring:='ÓÃ»§'
  else
    Adodata0073.fieldbyname('ttype').asstring:='×é';
end;

end.
