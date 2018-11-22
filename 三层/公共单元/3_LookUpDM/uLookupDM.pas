unit uLookupDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient, uCommFunc,
  Data.Win.ADODB, System.Variants;

type
  TdmLookup = class(TDataModule)
    cdsLK01: TClientDataSet;
    cdsLK34: TClientDataSet;
    cdsLK02: TClientDataSet;
    cdsLK05: TClientDataSet;
    cdsLK278: TClientDataSet;
    con1: TADOConnection;
    ads1: TADODataSet;
    atncfldLK01RKEY: TAutoIncField;
    strngfldLK01CURR_CODE: TStringField;
    strngfldLK01CURR_NAME: TStringField;
    fltfldLK01EXCH_RATE: TFloatField;
    atncfldLK02RKEY: TAutoIncField;
    strngfldLK02UNIT_CODE: TStringField;
    strngfldLK02UNIT_NAME: TStringField;
    atncfldLK05RKEY: TAutoIncField;
    strngfldLK05EMPL_CODE: TStringField;
    strngfldLK05EMPLOYEE_NAME: TStringField;
    atncfldLK34RKEY: TAutoIncField;
    strngfldLK34DEPT_CODE: TStringField;
    strngfldLK34DEPT_NAME: TStringField;
    strngfldLK34TTYPE: TStringField;
    atncfldLK278RKEY: TAutoIncField;
    strngfldLK278PARAMETER_NAME: TStringField;
    strngfldLK278PARAMETER_DESC: TStringField;
    intgrfldLK278CATEGORY_PTR: TIntegerField;
    intgrfldLK278UNIT_PTR: TIntegerField;
    strngfldLK278UNIT_CODE: TStringField;
    strngfldLK278UNIT_NAME: TStringField;
    wrdfldLK278DATA_TYPE: TWordField;
    strngfldLK278CATEGORY: TStringField;
    strngfldLK278datadesc: TStringField;
    cdsLK73: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetData;
  end;

var
  gLookDM: TdmLookup;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TdmLookup }

procedure TdmLookup.GetData;
var
  LSql: OleVariant;
begin
  LSql := VarArrayOf([cdsLK01.CommandText,cdsLK02.CommandText,cdsLK05.CommandText,cdsLK34.CommandText,cdsLK278.CommandText,cdsLK73.CommandText]);
  if not gSvrIntf.IntfGetDataBySqlArr(LSql,[cdsLK01,cdsLK02,cdsLK05,cdsLK34,cdsLK278,cdsLK73]) then Exit;
end;

end.
