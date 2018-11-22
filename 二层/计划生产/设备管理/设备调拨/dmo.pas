unit dmo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConn: TADOConnection;
    ADO573: TADODataSet;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADO573rkey: TAutoIncField;
    ADO573allocate_number: TStringField;
    ADO573FASSET_CODE: TStringField;
    ADO573BOOK_DATE: TDateTimeField;
    ADO573FASSET_NAME: TStringField;
    ADO573FASSET_TYPE: TStringField;
    ADO573FASSET_ALT_TYPE: TStringField;
    ADO573FASSET_DESC: TStringField;
    ADO573FASSET_STATUS: TStringField;
    ADO573DEPT_NAME: TStringField;
    ADO573LOCATION: TStringField;
    ADO573ABBR_NAME: TStringField;
    ADO573supplier_name: TStringField;
    ADO573allocate_date: TDateTimeField;
    ADO573alloccate_type: TStringField;
    ADO573EMPLOYEE_NAME: TStringField;
    ADO573ent_date: TDateTimeField;
    ADO573ORIGINAL_VALUE: TFloatField;
    ADO573SUMMED_DEPRE: TFloatField;
    ADO573NET_VALUE: TFloatField;
    ADO573EXPECTED_LIFE_MONTHS: TFloatField;
    ADO573DEPRED_MONTHS: TFloatField;
    ADO573alloc_outfac: TStringField;
    ADO573alloc_outdeptname: TStringField;
    ADO573outdeptname_empl: TStringField;
    ADO573out_equipment: TStringField;
    ADO573alloc_infac: TStringField;
    ADO573alloc_indeptname: TStringField;
    ADO573indeptname_empl: TStringField;
    ADO573in_equipment: TStringField;
    ADO573ck: TStringField;
    ADO573cw: TStringField;
    ADO573zjl: TStringField;
    ADO573sbzj: TStringField;
    ADO573warehouse_date: TDateTimeField;
    ADO573financial_date: TDateTimeField;
    ADO573manage_date: TDateTimeField;
    ADO573chief_date: TDateTimeField;
    ADO573statu: TStringField;
    ADO573remark: TStringField;
    ADO573alloc_indept_ptr: TIntegerField;
    ADO573fasset_ptr: TIntegerField;
    ADOQuery2: TADOQuery;
    ADO573LOCATION1: TStringField;
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
