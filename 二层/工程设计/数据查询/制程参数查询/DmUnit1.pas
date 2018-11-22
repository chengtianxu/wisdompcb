


//Provider=SQLOLEDB.1;Persist Security Info=True;User ID=sa;Initial Catalog=WISDOMPCB;Data Source=172.16.1.57

//Provider=SQLOLEDB.1;Password=koimy1234;Persist Security Info=True;User ID=sa;Initial Catalog=sj_v20_sample;Data Source=172.16.0.8
unit DmUnit1;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery1PARAMETER_NAME: TStringField;
    ADOQuery1PARAMETER_DESC: TStringField;
    ADOQuery1PARAMETER_VALUE: TStringField;
    ADOQuery1after_flag: TStringField;
    ADOQuery1DEPT_CODE: TStringField;
    ADOQuery1DEPT_NAME: TStringField;
    ADOQuery1MANU_PART_NUMBER: TStringField;
    ADOQuery1MANU_PART_DESC: TStringField;
    ADOQuery1CUST_CODE: TStringField;
    ADOQuery1ttype: TWordField;
    ADOQuery1Myttype: TStringField;
    ADOQuery1LAYERS: TWordField;
    ADOQuery1green_flag: TStringField;
    ADOQuery1PARENT_PTR: TIntegerField;
    ADOQuery1MyPARENT_PTR: TStringField;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1set_qty: TIntegerField;
    strngfldADOQuery1ANALYSIS_CODE_2: TStringField;
    strngfldADOQuery1ANALYSIS_CODE_1: TStringField;
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
