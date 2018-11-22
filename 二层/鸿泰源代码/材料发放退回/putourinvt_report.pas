unit putourinvt_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, DB,
  ADODB, ppCtrls, ppBands, ppPrnabl, ppCache,raide, ppEndUsr;

type
  TForm_putoutintreport = class(TForm)
    ppReport1: TppReport;
    DataSource1: TDataSource;
    aq493: TADOQuery;
    aq493DSDesigner1: TStringField;
    aq493DSDesigner2: TStringField;
    aq493DSDesigner3: TStringField;
    aq493DSDesigner: TStringField;
    aq493DSDesigner4: TBlobField;
    aq493DSDesigner12: TStringField;
    aq493DSDesigner22: TStringField;
    aq493DSDesigner32: TStringField;
    aq493DSDesigner5: TStringField;
    ppDB493: TppDBPipeline;
    DataSource2: TDataSource;
    aq457: TADODataSet;
    aq457RKEY: TAutoIncField;
    aq457GON_NUMBER: TStringField;
    aq457REF_NUMBER: TStringField;
    aq457CREATE_DATE: TDateTimeField;
    aq457ABBR_NAME: TStringField;
    aq457DEPT_CODE: TStringField;
    aq457DEPT_NAME: TStringField;
    aq457EMPLOYEE_NAME: TStringField;
    aq457DSDesigner: TStringField;
    aq457DSDesigner2: TStringField;
    aq457TTYPE: TSmallintField;
    aq457DSDesigner3: TStringField;
    DataSource3: TDataSource;
    ado207: TADODataSet;
    ado207INV_PART_NUMBER: TStringField;
    ado207INV_NAME: TStringField;
    ado207INV_DESCRIPTION: TStringField;
    ado207QUANTITY: TBCDField;
    ado207RTN_QUANTITY: TBCDField;
    ado207UNIT_NAME: TStringField;
    ado207rohs: TStringField;
    ado207SUPPLIER2: TStringField;
    ado207D0022_PTR: TIntegerField;
    ado207QUAN_ON_HAND: TBCDField;
    ado207INVENTORY_PTR: TIntegerField;
    ado207rkey: TAutoIncField;
    ado207hand17: TFloatField;
    aq457DSDesigner4: TStringField;
    ppDB457: TppDBPipeline;
    ado207ABBR_NAME: TStringField;
    ppDB207: TppDBPipeline;
    ppHeaderBand2: TppHeaderBand;
    ppDBText12: TppDBText;
    ppLabel12: TppLabel;
    ppDBText13: TppDBText;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppDBText15: TppDBText;
    ppLabel17: TppLabel;
    ppDBText17: TppDBText;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppDetailBand2: TppDetailBand;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText1: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel5: TppLabel;
    ppLine2: TppLine;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText4: TppDBText;
    ppDesigner1: TppDesigner;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_putoutintreport: TForm_putoutintreport;

implementation

uses damo, putout_bill;

{$R *.dfm}

end.
