unit ReportFrm_Mod50;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, frxClass, frxDBSet,
  Datasnap.DBClient,uCommFunc, frxDesgn, Data.Win.ADODB, Datasnap.Provider;

type
  TFrmReport_Mod50 = class(TForm)
    cds22: TClientDataSet;
    cds493: TClientDataSet;
    frxdbdtst22: TfrxDBDataset;
    frxdbdtst493: TfrxDBDataset;
    frxReport1: TfrxReport;
    cds96: TClientDataSet;
    frxdbdt96: TfrxDBDataset;
    cds22CODE: TStringField;
    cds22SUPPLIER_NAME: TStringField;
    cds22CONTACT_NAME_1: TStringField;
    cds22BILLING_ADDRESS_1: TStringField;
    cds22ship_DATE: TDateTimeField;
    cds22price: TBCDField;
    cds22WAREHOUSE_CODE: TStringField;
    cds22WAREHOUSE_NAME: TStringField;
    cds22QUAN_TO_BE_SHIPPED: TFMTBCDField;
    cds22QUAN_RETURNED: TFMTBCDField;
    cds22BARCODE_ID: TStringField;
    cds22CURR_NAME: TStringField;
    cds22QUANTITY: TFloatField;
    cds22PHONE: TStringField;
    cds22FAX: TStringField;
    cds22loca_code: TStringField;
    cds22LOCATION: TStringField;
    cds22GRN_NUMBER: TStringField;
    cds22RKEY: TAutoIncField;
    cds22TAX_2: TBCDField;
    cds22tax_price: TFMTBCDField;
    cds22TTYPE: TSmallintField;
    cds22SHIPPING_METHOD: TWideStringField;
    cds22备注信息: TStringField;
    frxDesigner1: TfrxDesigner;
    cds96RKEY: TAutoIncField;
    cds96INV_PART_NUMBER: TStringField;
    cds96INV_PART_DESCRIPTION: TStringField;
    cds96QUAN_ORD: TBCDField;
    cds96UNIT_NAME: TStringField;
    cds96po_price: TBCDField;
    cds96CONVERSION_FACTOR: TFloatField;
    cds96PO_NUMBER: TStringField;
    cds96PO_DATE: TDateTimeField;
    cds96price: TBCDField;
    cds96TAX_2: TBCDField;
    cds96TTYPE: TSmallintField;
    cds96EMPLOYEE_NAME: TStringField;
    cds96QUANTITY: TFloatField;
    cds96SHIPPING_METHOD: TWideStringField;
    cds96TRAN_DATE: TDateTimeField;
    cds96REFERENCE_NUMBER: TStringField;
    cds96QUAN_REJD: TFloatField;
    cds96退货金额: TFloatField;
    cds96税金: TFloatField;
    cds493Company_Name: TStringField;
    cds493Company_Name2: TStringField;
    cds493Company_Name3: TStringField;
    cds493ship_address: TStringField;
    cds493Company_Icon: TBlobField;
    cds493SITE_INFO_ADD_1: TStringField;
    cds493SITE_INFO_ADD_2: TStringField;
    cds493SITE_INFO_ADD_3: TStringField;
    cds493SITE_INFO_PHONE: TStringField;
  private
    { Private declarations }
  public
    procedure GetData(ARkey,ARkey96: string);
    { Public declarations }
  end;

var
  FrmReport_Mod50: TFrmReport_Mod50;

implementation

{$R *.dfm}

{ TForm1 }



{ TFrmReport_Mod50 }

procedure TFrmReport_Mod50.GetData(ARkey, ARkey96: string);
begin
  gSvrIntf.IntfGetDataBySql(cds96.CommandText + ' and data0096.rkey = ' + ARkey96,cds96);
  gSvrIntf.IntfGetDataBySql(cds22.CommandText + ' and data0022.rkey = ' + ARkey,cds22);
  gSvrIntf.IntfGetDataBySql(cds493.CommandText , cds493);
end;

end.
