unit DAMO;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection: TADOConnection;
    ADS569: TADODataSet;
    DataSource1: TDataSource;
    ADS569formula_number: TStringField;
    ADS569v_type: TStringField;
    ADS569DEPT_CODE: TStringField;
    ADS569DEPT_NAME: TStringField;
    ADS569theorycalc_meth: TStringField;
    ADS569measurecalc_meth1: TStringField;
    ADS569measurecalc_meth2: TStringField;
    ADS569measurecalc_meth3: TStringField;
    ADOQuery1: TADOQuery;
    ADS569dept_ptr: TIntegerField;
    ADS569PARA_PTR_0: TIntegerField;
    ADS569PARA_PTR_1: TIntegerField;
    ADS569PARA_PTR_2: TIntegerField;
    ADS569PARA_PTR_3: TIntegerField;
    ADS569PARA_PTR_4: TIntegerField;
    ADS569PARA_PTR_5: TIntegerField;
    ADS569PARA_PTR_6: TIntegerField;
    ADS569PARA_PTR_7: TIntegerField;
    ADS569PARA_PTR_8: TIntegerField;
    ADS569PARA_PTR_9: TIntegerField;
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
