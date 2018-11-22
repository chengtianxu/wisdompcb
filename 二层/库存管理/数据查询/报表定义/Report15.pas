unit Report15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppModule, raCodMod, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, DB, ADODB,
  StdCtrls, ppEndUsr,Raide;

type
  TFrmReport15 = class(TForm)
    DataSource1: TDataSource;
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
    DataSource2: TDataSource;
    ppReport1: TppReport;
    DataSource3: TDataSource;
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
    ppDBPipeline1ppField1: TppField;
    ppDBPipeline1ppField2: TppField;
    ppDBPipeline1ppField3: TppField;
    ppDBPipeline1ppField4: TppField;
    ppDBPipeline1ppField5: TppField;
    ppDBPipeline1ppField6: TppField;
    ppDBPipeline1ppField7: TppField;
    ppDBPipeline1ppField8: TppField;
    ppDBPipeline1ppField9: TppField;
    ppDB207: TppDBPipeline;
    ppDB457: TppDBPipeline;
    ppDesigner1: TppDesigner;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
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
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    procedure ppReport1PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReport15: TFrmReport15;

implementation
uses datamodule;
{$R *.dfm}

procedure TFrmReport15.ppReport1PreviewFormCreate(Sender: TObject);
begin
  ppReport1.PreviewForm.WindowState := wsMaximized;
end;

end.
