unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB,windows, DBClient, Provider,mask,Dialogs,StrUtils;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    tmp: TADOQuery;
    DS1: TDataSource;
    DS2: TDataSource;
    ADO94: TADOQuery;
    ADO275: TADOQuery;
    ADO94_1: TADOQuery;
    ADO275_1: TADOQuery;
    ADO94DEPT_CODE: TStringField;
    ADO94DEPT_NAME: TStringField;
    ADO94RKEY: TAutoIncField;
    ADO94CODE: TStringField;
    ADO94PURCHASE_APPROV_DESC: TStringField;
    ADO94dept_ptr: TIntegerField;
    ADO94type: TWordField;
    ADO94mode: TWordField;
    ADO94type_c: TStringField;
    ADO275RKEY: TAutoIncField;
    ADO275AUTH_GROUP_PTR: TIntegerField;
    ADO275USER_PTR: TIntegerField;
    ADO275LOWER_LIMIT: TFloatField;
    ADO275UPPER_LIMIT: TFloatField;
    ADO275USER_FULL_NAME: TStringField;
    ADO275USER_LOGIN_NAME: TStringField;
    DS1_1: TDataSource;
    adsADO275ACTIVE_FLAG: TStringField;
    procedure ADO94AfterScroll(DataSet: TDataSet);
  private

  public

  end;

var
  DM: TDM;
  Frkey94:integer;
implementation

{$R *.dfm}

procedure TDM.ADO94AfterScroll(DataSet: TDataSet);
begin
  ADO275.Close;
  ADO275.Parameters[0].Value:=DataSet.FieldValues['rkey'];
  ADO275.Open;
end;

end.
