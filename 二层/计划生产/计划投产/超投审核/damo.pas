unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    ads491: TADODataSet;
    DataSource1: TDataSource;
    ads491CUT_NO: TStringField;
    ads491SO_NO: TStringField;
    ads491ORD_REQ_QTY: TIntegerField;
    ads491ISSUED_QTY: TIntegerField;
    ads491ISSUE_DATE: TDateTimeField;
    ads491MANU_PART_NUMBER: TStringField;
    ads491MANU_PART_DESC: TStringField;
    ads491analysis_code_3: TStringField;
    ads491remark: TStringField;
    ads491remark492: TStringField;
    ads491ct_type: TStringField;
    ads491SCH_COMPL_DATE: TDateTimeField;
    ads491EMPLOYEE_NAME: TStringField;
    ads491APP_QUAN: TIntegerField;
    ads491part_type: TStringField;
    ads491TSTATUS: TWordField;
    ads491ct_rate: TFloatField;
    ads491APP_BY_PTR: TIntegerField;
    ads491APP_DATE: TDateTimeField;
    ADOQuery1: TADOQuery;
    ads491Con_Flag: TSmallintField;
    ads491PARTS_ORDERED: TFloatField;
    ads491unit_sq: TFloatField;
    ads491iss_sqft: TFloatField;
    ads491CUST_CODE: TStringField;
    ads491app_status: TStringField;
    ads491app_by_empl: TStringField;
    ads491rw_caotou: TFloatField;
    ads491PLANNED_QTY: TIntegerField;
    ads491EST_SCRAP: TFloatField;
    ads491rw_caotou_mianji: TFloatField;
    ads491area3: TFloatField;
    ads491area1: TFloatField;
    ads491area2: TFloatField;
    ads491area_4: TFloatField;
    ads491area3_1: TFloatField;
    ads491area1_1: TFloatField;
    ads491area2_1: TFloatField;
    ads491unit_sq_1: TFloatField;
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
