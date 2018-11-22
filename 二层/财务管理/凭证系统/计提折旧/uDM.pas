unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOCnn: TADOConnection;
    ADOQ: TADOQuery;
    Qry0517: TADOQuery;
    Qry326: TADOQuery;
    DS0106: TADODataSet;
    DS0105: TADODataSet;
    DS0508: TADODataSet;
    DS528: TADODataSet;
    Qry326FACCU_DEPT_GL_PTR: TIntegerField;
    Qry326GL_ACC_NUMBER: TStringField;
    Qry326DB_CR: TStringField;
    Qry326sum_monthamt: TFloatField;
    Qry0517DEPRE_ACCT_PTR: TIntegerField;
    Qry0517GL_ACC_NUMBER: TStringField;
    Qry0517DB_CR: TStringField;
    Qry0517sum_monthamt: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
