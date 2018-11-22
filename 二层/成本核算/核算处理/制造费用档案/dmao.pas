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
    tmp: TADOQuery;
    ADOD424abbr_name: TStringField;
    ADOD424warehouse_ptr: TIntegerField;
    ADOD424cost_name: TStringField;
    ADOQ50MANU_PART_NUMBER: TStringField;
    ADOQ50MANU_PART_DESC: TStringField;
    ADOQ50CUSTPART_ENT_DATE: TDateTimeField;
    ADOD424OVHD_4: TBCDField;
    ADOD424OVHD_5: TBCDField;
    ADOD424STD_OVHD_4: TBCDField;
    ADOD424STD_OVHD_5: TBCDField;
    ADOQ451wo_ptr: TIntegerField;
    ADOD424yield_sqft_wf: TBCDField;
    ADOD410: TADODataSet;
    ADOD410WORK_ORDER_NUMBER: TStringField;
    ADOD410MANU_PART_NUMBER: TStringField;
    ADOD410MANU_PART_DESC: TStringField;
    ADOD410PRODUCT_NAME: TStringField;
    ADOD410STEP: TIntegerField;
    ADOD410QTY: TIntegerField;
    ADOD410sq_total: TFloatField;
    ADOD410matl_total: TFloatField;
    ADOD410ovhd_total: TFloatField;
    ADOD410ovhd1_total: TFloatField;
    ADOD410outsource_total: TFloatField;
    ADOD410WTYPE: TStringField;
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
