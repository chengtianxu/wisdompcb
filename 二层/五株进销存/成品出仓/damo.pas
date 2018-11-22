unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOS1: TADODataSet;
    tmp: TADOQuery;
    ADOS1rkey: TAutoIncField;
    ADOS1out_number: TStringField;
    ADOS1delivery_no: TStringField;
    ADOS1MANU_PART_NUMBER: TStringField;
    ADOS1MANU_PART_DESC: TStringField;
    ADOS1ANALYSIS_CODE_2: TStringField;
    ADOS1PROD_CODE: TStringField;
    ADOS1LAYERS: TWordField;
    ADOS1PRODUCT_NAME: TStringField;
    ADOS1CUST_CODE: TStringField;
    ADOS1ABBR_NAME: TStringField;
    ADOS1unit_sq: TFloatField;
    ADOS1issue_area: TBCDField;
    ADOS1pcs_weight: TFloatField;
    ADOS1issue_weight: TBCDField;
    ADOS1DATE_SHIPPED: TDateTimeField;
    ADOS1WAREHOUSE_CODE: TStringField;
    ADOS1LOCATION: TStringField;
    ADOS1PO_NUMBER: TStringField;
    ADOS1incept_type: TStringField;
    ADOS1sales_type: TStringField;
    ADOS1employee_name: TStringField;
    ADOS1issue_qty: TIntegerField;
    procedure ADOS1unit_sqChange(Sender: TField);
    procedure ADOS1pcs_weightChange(Sender: TField);
    procedure ADOS1issue_qtyChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

procedure Tdm.ADOS1unit_sqChange(Sender: TField);
begin
  dm.ADOS1issue_area.Value:=dm.ADOS1issue_qty.Value*dm.ADOS1unit_sq.Value;
end;

procedure Tdm.ADOS1pcs_weightChange(Sender: TField);
begin
  dm.ADOS1issue_weight.Value:=dm.ADOS1issue_qty.Value*dm.ADOS1pcs_weight.Value;
end;

procedure Tdm.ADOS1issue_qtyChange(Sender: TField);
begin
  dm.ADOS1issue_area.Value:=dm.ADOS1issue_qty.Value*dm.ADOS1unit_sq.Value;
  dm.ADOS1issue_weight.Value:=dm.ADOS1issue_qty.Value*dm.ADOS1pcs_weight.Value;
end;

end.
