unit putoutmiscreport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDB, ppComm, ppRelatv, ppDBPipe, ppProd, ppClass,
  ppReport,raide, ppBands, ppCtrls, ppPrnabl, ppCache, ppEndUsr;

type
  TForm_putoutmiscreport = class(TForm)
    ppDB457: TppDBPipeline;
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
    ppDB208: TppDBPipeline;
    ppReport1: TppReport;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppDetailBand1: TppDetailBand;
    ppLine1: TppLine;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    DataSource3: TDataSource;
    ado208: TADODataSet;
    ado208goods_name: TStringField;
    ado208goods_guige: TStringField;
    ado208goods_type: TStringField;
    ado208UNIT_NAME: TStringField;
    ado208rohs: TStringField;
    ado208REF_NUMBER: TStringField;
    ado208QUANTITY: TBCDField;
    ado208RTN_QUANTITY: TBCDField;
    ado208SOURCE_PTR: TIntegerField;
    ado208QUAN_ON_HAND: TBCDField;
    ado208rkey: TAutoIncField;
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
    ppDesigner1: TppDesigner;
    aq457DSDesigner4: TStringField;
    aq457DSDesigner5: TStringField;
    aq457DSDesigner6: TStringField;
    aq457DSDesigner7: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_putoutmiscreport: TForm_putoutmiscreport;

implementation

uses damo, putout_bill;

{$R *.dfm}

end.
