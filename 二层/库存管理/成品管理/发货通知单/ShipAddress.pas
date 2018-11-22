unit ShipAddress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons;

type
  TForm_ShipAddress = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1location: TStringField;
    ADOQuery1ship_to_address_1: TStringField;
    ADOQuery1state: TStringField;
    ADOQuery1zip: TStringField;
    ADOQuery1SHIP_SHIPPING_METHOD: TStringField;
    ADOQuery1CUSTOMER_PTR: TIntegerField;
    DataSource1: TDataSource;
    ADOQuery1SHIP_TO_ADDRESS_2: TStringField;
    ADOQuery1SHIP_TO_ADDRESS_3: TStringField;
    ADOQuery1SHIP_TO_CONTACT: TStringField;
    ADOQuery1SHIP_TO_PHONE: TStringField;
    ADOQuery1SHIP_TO_FAX: TStringField;
    ADOQuery1SREP_PTR_1: TIntegerField;
    ADOQuery1SREP_PTR_2: TIntegerField;
    ADOQuery1SREP_PTR_3: TIntegerField;
    ADOQuery1SREP_PTR_4: TIntegerField;
    ADOQuery1SREP_PTR_5: TIntegerField;
    ADOQuery1SREP_1_COMM: TBCDField;
    ADOQuery1SREP_2_COMM: TBCDField;
    ADOQuery1SREP_3_COMM: TBCDField;
    ADOQuery1SREP_4_COMM: TBCDField;
    ADOQuery1SREP_5_COMM: TBCDField;
    ADOQuery1SREP_1_ALLOC: TBCDField;
    ADOQuery1SREP_2_ALLOC: TBCDField;
    ADOQuery1SREP_3_ALLOC: TBCDField;
    ADOQuery1SREP_4_ALLOC: TBCDField;
    ADOQuery1SREP_5_ALLOC: TBCDField;
    ADOQuery1SHIP_CTAX_PTR: TIntegerField;
    ADOQuery1SHIP_LEAD_TIME: TSmallintField;
    ADOQuery1SHIP_FOB: TStringField;
    ADOQuery1SHIP_REG_TAX_ID: TStringField;
    ADOQuery1STATE_SHIP_TAX_FLAG: TStringField;
    ADOQuery1STATE_PROD_TAX_FLAG: TStringField;
    ADOQuery1STATE_TOOL_TAX_FLAG: TStringField;
    ADOQuery1LANGUAGE_FLAG: TStringField;
    ADOQuery1OVERSHIP_BY_QTY_1: TFloatField;
    ADOQuery1OVERSHIP_BY_QTY_2: TFloatField;
    ADOQuery1OVERSHIP_BY_QTY_3: TFloatField;
    ADOQuery1ORDER_QTY_RANGE_1: TFloatField;
    ADOQuery1ORDER_QTY_RANGE_2: TFloatField;
    ADOQuery1COUNTRY_PTR: TIntegerField;
    ADOQuery1LOCNAME_FOR_FORM: TStringField;
    ADOQuery1SHP_ADDR1_FOR_FORM: TStringField;
    ADOQuery1SHP_ADDR2_FOR_FORM: TStringField;
    ADOQuery1SHP_ADDR3_FOR_FORM: TStringField;
    ADOQuery1SHP_ANALYSIS_CODE1: TStringField;
    ADOQuery1SHP_ANALYSIS_CODE2: TStringField;
    ADOQuery1SHP_ANALYSIS_CODE3: TStringField;
    ADOQuery1EMAIL_FOR_CONTACT: TStringField;
    ADOQuery1DAYS_EARLY: TIntegerField;
    ADOQuery1DAYS_LATE: TIntegerField;
    ADOQuery1S4_BARCODE_LABLE: TStringField;
    ADOQuery1S3_BARCODE_LABLE: TStringField;
    ADOQuery1PACKGE_BARCODE_LABLE: TStringField;
    ADOQuery1MISC_BARCODE_LABLE: TStringField;
    ADOQuery1COFC_FORMAT_FILENAME: TStringField;
    ADOQuery1overship_flag: TWordField;
    ADOQuery1EXPIRED_DATE: TDateTimeField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_ShipAddress: TForm_ShipAddress;

implementation

uses Demo;

{$R *.dfm}

procedure TForm_ShipAddress.Edit1Change(Sender: TObject);
begin
 if Edit1.text<>'' then
  Adoquery1.Filter :='location like '''+Trim(Edit1.Text)+'%'''
 else
  Adoquery1.filter:='';
if adoquery1.IsEmpty then
 button1.Enabled:=false
else
 button1.Enabled:=true;
end;

procedure TForm_ShipAddress.BitBtn1Click(Sender: TObject);
begin
edit1.Text:='';
edit1.SetFocus;
end;

procedure TForm_ShipAddress.DBGrid1DblClick(Sender: TObject);
begin
if not adoquery1.IsEmpty then
  ModalResult:=mrok;
end;

procedure TForm_ShipAddress.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
end;

procedure TForm_ShipAddress.FormCreate(Sender: TObject);
begin
ADOQuery1.Open;
end;

end.
