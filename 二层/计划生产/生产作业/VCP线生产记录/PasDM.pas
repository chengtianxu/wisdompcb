unit PasDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection: TADOConnection;
    Ado181: TADOQuery;
    tmpQry: TADOQuery;
    ado198: TADOQuery;
    ado198Rkey: TAutoIncField;
    ado198sName: TStringField;
    ado198sType: TWordField;
    ado198Remark: TStringField;
    Ado181rkey: TIntegerField;
    Ado181VCPID: TStringField;
    Ado181d06_Ptr: TIntegerField;
    Ado181d34_Ptr: TIntegerField;
    Ado181STEP: TSmallintField;
    Ado181QTY_BACKLOG: TFloatField;
    Ado181PANELS: TIntegerField;
    Ado181sClass: TStringField;
    Ado181d198_Ptr: TIntegerField;
    Ado181d05_Ptr: TIntegerField;
    Ado181create_date: TDateTimeField;
    Ado181ComputerName: TStringField;
    Ado181IPAddress: TStringField;
    Ado181Remark: TStringField;
    Ado181WORK_ORDER_NUMBER: TStringField;
    Ado181MANU_PART_NUMBER: TStringField;
    Ado181MANU_PART_DESC: TStringField;
    Ado181Expr1: TSmallintField;
    Ado181DEPT_CODE: TStringField;
    Ado181DEPT_NAME: TStringField;
    Ado181panel_ln: TFloatField;
    Ado181panel_wd: TFloatField;
    Ado181ANALYSIS_CODE_5: TStringField;
    Ado181PRODUCT_NAME: TStringField;
    Ado181PNLArae: TFloatField;
    Ado181wip_area: TFloatField;
    Ado181unit_sq: TFloatField;
    Ado181ABBR_NAME: TStringField;
    Ado181EMPLOYEE_NAME: TStringField;
    Ado181sName: TStringField;
    Ado181DSDesigner: TFloatField;
    Ado181DSDesigner2: TFloatField;
    Ado181PNL: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation
uses common;
{$R *.dfm}

end.
