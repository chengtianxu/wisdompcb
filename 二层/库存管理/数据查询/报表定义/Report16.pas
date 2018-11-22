unit Report16;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppModule, raCodMod, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, DB, ADODB,
  StdCtrls, ppEndUsr;

type
  TFrmReport16 = class(TForm)
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
    ppDB457: TppDBPipeline;
    ppDB457ppField2: TppField;
    ppDB457ppField3: TppField;
    ppDB457ppField4: TppField;
    ppDB457ppField5: TppField;
    ppDB457ppField6: TppField;
    ppDB457ppField7: TppField;
    ppDB457ppField8: TppField;
    ppDB457ppField9: TppField;
    ppDB457ppField10: TppField;
    ppDB457ppField12: TppField;
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
    DataSource3: TDataSource;
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
    ppDB208: TppDBPipeline;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
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
    procedure ppReport1PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReport16: TFrmReport16;

implementation
uses datamodule;
{$R *.dfm}

procedure TFrmReport16.ppReport1PreviewFormCreate(Sender: TObject);
begin
  ppReport1.PreviewForm.WindowState := wsMaximized;
end;

end.
