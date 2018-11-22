unit Pas_report_zxcard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, ppProd, ppClass, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, DB, ADODB, ppBands, ppCache, ppModule, raCodMod, ppVar,
  ppCtrls, ppStrtch, ppMemo, ppPrnabl;

type
  Tfrm_report_zx = class(TForm)
    ADO493: TADOQuery;
    ADO493Company_Name: TStringField;
    ADO493ship_address: TStringField;
    ADO493Company_Icon: TBlobField;
    ADO493SITE_INFO_ADD_1: TStringField;
    ADO493SITE_INFO_ADD_2: TStringField;
    ADO493SITE_INFO_ADD_3: TStringField;
    ADO493SITE_INFO_PHONE: TStringField;
    DataSource1: TDataSource;
    ppDB493: TppDBPipeline;
    ppDesigner1: TppDesigner;
    qry235: TADOQuery;
    ds235: TDataSource;
    qry235goods_name: TStringField;
    qry235goods_guige: TStringField;
    qry235goods_type: TStringField;
    qry235UNIT_NAME: TStringField;
    qry235DSDesigner: TStringField;
    qry235WAREHOUSE_CODE: TStringField;
    qry235WAREHOUSE_NAME: TStringField;
    qry235SUPPLIER_NAME: TStringField;
    qry235CODE: TStringField;
    qry235DSDesigner2: TStringField;
    qry235ship_DATE: TDateTimeField;
    qry235DSDesigner3: TBCDField;
    qry235REF_NUMBER: TStringField;
    qry235PO_NUMBER: TStringField;
    qry235DATE_RECD: TDateTimeField;
    qry235cust_decl: TStringField;
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBImage1: TppDBImage;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppShape6: TppShape;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppDBText6: TppDBText;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLine18: TppLine;
    ppShape1: TppShape;
    ppLine17: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText2: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppDBMemo3: TppDBMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_report_zx: Tfrm_report_zx;

implementation

uses
  data_module;

{$R *.dfm}

end.
