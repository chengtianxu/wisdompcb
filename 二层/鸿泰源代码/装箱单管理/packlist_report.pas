unit packlist_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppDB, ppDBPipe, ppModule, raCodMod, ppBands, ppClass, ppCtrls,
  ppVar, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, DB, ADODB;

type
  TForm9 = class(TForm)
    ADOQuery1: TADOQuery;
    ADOQuery1delivery_no: TStringField;
    ADOQuery1CUST_CODE: TStringField;
    ADOQuery1date_sailing: TDateTimeField;
    ADOQuery1cartons_no: TIntegerField;
    ADOQuery1charge: TFloatField;
    ADOQuery1MAWB_NO: TStringField;
    ADOQuery1SALES_ORDER: TStringField;
    ADOQuery1fob: TStringField;
    ADOQuery1DUE_DATE: TDateTimeField;
    ADOQuery1SHIPMENT_NO: TSmallintField;
    ADOQuery1PO_NUMBER: TStringField;
    ADOQuery1PO_DATE: TDateTimeField;
    ADOQuery1reference_number: TStringField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    ADOQuery1QUAN_SHIPPED: TIntegerField;
    ADOQuery1weight: TFloatField;
    ADOQuery1part_price: TFloatField;
    ADOQuery1Remark: TStringField;
    ADOQuery1c_n: TIntegerField;
    ADOQuery1net_weight: TFloatField;
    ADOQuery1amount: TFloatField;
    ADOQuery1invoice_number: TStringField;
    DataSource5: TDataSource;
    ppReport1: TppReport;
    ppDB439: TppDBPipeline;
    DB439ppField1: TppField;
    DB439ppField2: TppField;
    DB439ppField3: TppField;
    DB439ppField4: TppField;
    DB439ppField5: TppField;
    DB439ppField6: TppField;
    DB439ppField7: TppField;
    DB439ppField8: TppField;
    DB439ppField9: TppField;
    DB439ppField10: TppField;
    DB439ppField11: TppField;
    DB439ppField12: TppField;
    DB439ppField13: TppField;
    DB439ppField14: TppField;
    DB439ppField15: TppField;
    DB439ppField16: TppField;
    DB439ppField17: TppField;
    DB439ppField18: TppField;
    DB439ppField19: TppField;
    DB439ppField20: TppField;
    DB439ppField21: TppField;
    DB439ppField22: TppField;
    DB439ppField23: TppField;
    DB439ppField24: TppField;
    aq0493: TADOQuery;
    aq0493Company_Name: TStringField;
    aq0493ship_address: TStringField;
    aq0493Company_Icon: TBlobField;
    aq0493SITE_INFO_ADD_1: TStringField;
    aq0493SITE_INFO_ADD_2: TStringField;
    aq0493SITE_INFO_ADD_3: TStringField;
    aq0493SITE_INFO_PHONE: TStringField;
    DataSource4: TDataSource;
    ppDB493: TppDBPipeline;
    ppDBPipeline4ppField1: TppField;
    ppDBPipeline4ppField2: TppField;
    ppDBPipeline4ppField3: TppField;
    ppDBPipeline4ppField4: TppField;
    ppDBPipeline4ppField5: TppField;
    ppDBPipeline4ppField6: TppField;
    ppDBPipeline4ppField7: TppField;
    ADOQuery1MANU_PART_NUMBER: TStringField;
    ADOQuery1MANU_PART_DESC: TStringField;
    procedure ppReport1PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses damo;

{$R *.dfm}

procedure TForm9.ppReport1PreviewFormCreate(Sender: TObject);
begin
 ppreport1.PreviewForm.WindowState:=wsmaximized;
end;

end.
