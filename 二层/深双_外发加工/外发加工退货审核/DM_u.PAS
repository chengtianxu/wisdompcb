unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB,mask,Dialogs,Variants,StrUtils;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    wzdata306: TADOQuery;
    DS1: TDataSource;
    adowz307: TADOQuery;
    DS2: TDataSource;
    Tmp: TADOQuery;
    wzdata306rkey: TAutoIncField;
    wzdata306rejected_number: TStringField;
    wzdata306DELIVER_PTR: TIntegerField;
    wzdata306supp_ptr: TIntegerField;
    wzdata306DEPT_PTR: TIntegerField;
    wzdata306EMPL_PTR: TIntegerField;
    wzdata306return_date: TDateTimeField;
    wzdata306ENT_DATE: TDateTimeField;
    wzdata306STATUS: TWordField;
    wzdata306REMARK: TStringField;
    wzdata306return_qty: TIntegerField;
    wzdata306AUTH_EMPL: TIntegerField;
    wzdata306AUTH_DATE: TDateTimeField;
    wzdata306DEPT_NAME: TStringField;
    wzdata306DEPT_CODE: TStringField;
    wzdata306CODE: TStringField;
    wzdata306SUPPLIER_NAME: TStringField;
    wzdata306ABBR_NAME: TStringField;
    wzdata306EMPL_CODE: TStringField;
    wzdata306EMPLOYEE_NAME: TStringField;
    wzdata306EMPL_CODE_A: TStringField;
    wzdata306EMPLOYEE_NAME_A: TStringField;
    wzdata306v_status: TStringField;
    wzdata306deliver_number: TStringField;
    adowz307RKEY: TAutoIncField;
    adowz307rejected_ptr: TIntegerField;
    adowz307received_ptr: TIntegerField;
    adowz307CUSTPART_PTR: TIntegerField;
    adowz307UNIT_NAME: TStringField;
    adowz307STANDARD: TStringField;
    adowz307rework_qry: TIntegerField;
    adowz307received_qty: TIntegerField;
    adowz307particulars_REMARK: TStringField;
    adowz307manu_part_number: TStringField;
    procedure wzdata306AfterScroll(DataSet: TDataSet);
  private

  public

  end;

var
  DM: TDM;


implementation

{$R *.dfm}

procedure TDM.wzdata306AfterScroll(DataSet: TDataSet);
begin
  adowz307.Close;
  adowz307.Parameters[0].Value:=wzdata306rkey.AsInteger;
  adowz307.Open;
end;

end.
