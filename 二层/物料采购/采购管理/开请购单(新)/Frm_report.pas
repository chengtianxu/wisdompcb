unit Frm_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDB, ppComm, ppRelatv, ppDBPipe, ppEndUsr, ppModule,
  raCodMod, ppBands, ppCtrls, ppBarCod, ppVar, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport;

type
  TForm_Report = class(TForm)
    ADO68: TADOQuery;
    ADO68RKEY: TAutoIncField;
    ADO68PO_REQ_NUMBER: TStringField;
    ADO68USER_PTR: TIntegerField;
    ADO68REQ_BY: TIntegerField;
    ADO68BUYER_PTR: TIntegerField;
    ADO68APPD_BY: TIntegerField;
    ADO68DATA275_PTR: TIntegerField;
    ADO68AUTH_TYPE: TIntegerField;
    ADO68WHSE_PTR: TIntegerField;
    ADO68budget_ptr: TIntegerField;
    ADO68NPAD_PTR: TIntegerField;
    ADO68ENT_DATE: TDateTimeField;
    ADO68REQ_DATE: TDateTimeField;
    ADO68AUTH_DATE: TDateTimeField;
    ADO68STATUS: TWordField;
    ADO68DEPARTMENT_NAME: TStringField;
    ADO68FLAG: TStringField;
    ADO68EDITED_DATE: TDateTimeField;
    ADO68EDITED_BY_USER_PTR: TIntegerField;
    ADO68EDITED_BY_EMP_PTR: TIntegerField;
    ADO68TOTAL: TBCDField;
    ADO68CURRENY_PTR: TIntegerField;
    ADO68EXCHANGE_RATE: TFloatField;
    ADO68v_year: TSmallintField;
    ADO68v_month: TSmallintField;
    ADO68REQ_TYPE: TStringField;
    ADO68user_name: TStringField;
    ADO68user_phone: TStringField;
    ADO68Remark: TMemoField;
    ADO68empl_code: TStringField;
    ADO68employee_name: TStringField;
    ADO68abbr_name: TStringField;
    ADO68warehouse_code: TStringField;
    ADO68code94: TStringField;
    ADO68PURCHASE_APPROV_DESC: TStringField;
    ADO68code362: TStringField;
    ADO68DESCRIPTION: TStringField;
    ADO68DEPT_NAME: TStringField;
    DataSource1: TDataSource;
    ADO69: TADOQuery;
    ADO69REQ_DATE: TDateTimeField;
    ADO69reply_date: TDateTimeField;
    ADO69reason: TStringField;
    ADO69QUANTITY: TFloatField;
    ADO69inv_part_number: TStringField;
    ADO69inv_description: TStringField;
    ADO69inv_name: TStringField;
    ADO69unit_code: TStringField;
    ADO69unit_name: TStringField;
    DataSource2: TDataSource;
    ppDB69: TppDBPipeline;
    aq0493: TADOQuery;
    aq0493Company_Name: TStringField;
    aq0493ship_address: TStringField;
    aq0493Company_Icon: TBlobField;
    aq0493SITE_INFO_ADD_1: TStringField;
    aq0493SITE_INFO_ADD_2: TStringField;
    aq0493SITE_INFO_ADD_3: TStringField;
    aq0493SITE_INFO_PHONE: TStringField;
    DataSource3: TDataSource;
    ppDB493: TppDBPipeline;
    ppDBPipeline4ppField1: TppField;
    ppDBPipeline4ppField2: TppField;
    ppDBPipeline4ppField3: TppField;
    ppDBPipeline4ppField4: TppField;
    ppDBPipeline4ppField5: TppField;
    ppDBPipeline4ppField6: TppField;
    ppDBPipeline4ppField7: TppField;
    ppDB68: TppDBPipeline;
    ppDesigner1: TppDesigner;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppFooterBand1: TppFooterBand;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Report: TForm_Report;

implementation

uses DM_u;

{$R *.dfm}

end.
