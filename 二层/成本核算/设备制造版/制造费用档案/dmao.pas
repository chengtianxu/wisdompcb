unit dmao;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQ451: TADOQuery;
    ADOD424: TADODataSet;
    ADOD424dept_code: TStringField;
    ADOD424dept_name: TStringField;
    ADOD424RKEY: TAutoIncField;
    ADOD424D0451_PTR: TIntegerField;
    ADOD424DEPT_PTR: TIntegerField;
    ADOD424OVHD_1: TBCDField;
    ADOD424OVHD_2: TBCDField;
    ADOD424OVHD_3: TBCDField;
    ADOD424yield_sqft: TBCDField;
    ADOD424yield_amount: TBCDField;
    ADOD424STD_OVHD_1: TBCDField;
    ADOD424STD_OVHD_2: TBCDField;
    ADOD424STD_OVHD_3: TBCDField;
    ADOQ50: TADOQuery;
    ADOQ50CP_REV: TStringField;
    ADOQ50CUSTOMER_PART_NUMBER: TStringField;
    ADOQ50CUSTPART_ENT_DATE: TDateTimeField;
    ADOQ451ACTUAL_FM_DATE: TDateTimeField;
    ADOQ451ACTUAL_END_DATE: TDateTimeField;
    ADOQ451employee_name: TStringField;
    ADOQ451closed_date: TDateTimeField;
    ADOQ451rkey: TAutoIncField;
    ADOQ451END_DATE: TDateTimeField;
    ADOQuery1: TADOQuery;
    ADOD424STD_MTAL_1: TBCDField;
    ADOD424STD_MTAL_2: TBCDField;
    ADOD424OVHD_MTAL_1: TBCDField;
    ADOQ50customer_part_desc: TStringField;
    tmp: TADOQuery;
    ADOD424abbr_name: TStringField;
    ADOD424warehouse_ptr: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

end.
