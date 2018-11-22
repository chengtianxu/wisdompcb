unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    con1: TADOConnection;
    tblSpellCondition: TADOTable;
    qry278: TADOQuery;
    qry278RKEY: TAutoIncField;
    qry278PARAMETER_NAME: TStringField;
    qry278PARAMETER_DESC: TStringField;
    tblSpellConditionParam_PTR: TIntegerField;
    tblSpellConditionIsDifferent: TWordField;
    tblSpellConditionParam_Name: TStringField;
    dsSpellCondition: TDataSource;
    dsPOFrom: TDataSource;
    qryPOFrom: TADOQuery;
    qryPOFromRKEY25: TIntegerField;
    qryPOFromRKEY60: TIntegerField;
    qryPOFromDSDesigner: TStringField;
    qryPOFromDSDesigner2: TStringField;
    qryPOFromDSDesigner3: TStringField;
    qryPOFromDSDesigner4: TFloatField;
    qryPOFromset: TStringField;
    qryPOFromPP: TStringField;
    qryPOFromDSDesigner5: TStringField;
    qryPOFromDSDesigner6: TStringField;
    qryPOFromDSDesigner7: TStringField;
    qryPOFromDSDesigner8: TStringField;
    qryPOFromDSDesigner9: TStringField;
    qryPOFromDSDesigner10: TStringField;
    qryPOFromDSDesigner11: TStringField;
    qryPOFromDSDesigner12: TStringField;
    qryPOFromDSDesigner13: TStringField;
    qryPOFromDSDesigner14: TStringField;
    qryPOFromDSDesigner15: TStringField;
    qryPOFromDSDesigner16: TStringField;
    qryTmp: TADOQuery;
    tblSpellConditionLevelMore: TWordField;
    tblSpellDifferentCondition: TADOTable;
    dsSpellDifferentCondition: TDataSource;
    tblSpellDifferentConditionParam_PTR: TIntegerField;
    tblSpellDifferentConditionFormula: TStringField;
    tblSpellDifferentConditionOperator: TStringField;
    tblSpellDifferentConditionFormulaValue: TStringField;
    tblSpellDifferentConditionParam_Name: TStringField;
    qryPOFromDSDesigner17: TDateTimeField;
    qryPOFromDSDesigner18: TDateTimeField;
    tblSpellConditionPARAMETER_NAME: TStringField;
    tblSpellDifferentConditionParam_Code: TStringField;
    procedure tblSpellConditionNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

procedure Tdm.tblSpellConditionNewRecord(DataSet: TDataSet);
begin
  tblSpellConditionLevelMore.Value:=0;
  tblSpellConditionIsDifferent.Value:=0;
end;

end.
