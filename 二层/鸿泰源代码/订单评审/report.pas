unit report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, DB, ADODB, ppDB, ppDBPipe, ppBands, ppCtrls, ppVar,
  ppPrnabl, ppClass, ppStrtch, ppMemo, ppCache, ppComm, ppRelatv, ppProd,
  ppReport;

type
  TForm_report1 = class(TForm)
    ppReport1: TppReport;
    ptlbnd1: TppTitleBand;
    ppMemo2: TppMemo;
    ppMemo1: TppMemo;
    ppDBImage1: TppDBImage;
    ppDBText2: TppDBText;
    ppLine1: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLine19: TppLine;
    phdrbnd1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel5: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppDetailBand1: TppDetailBand;
    ppLine9: TppLine;
    ppDBText1: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppFooterBand1: TppFooterBand;
    ppDBText14: TppDBText;
    ppLabel15: TppLabel;
    ppDB0060: TppDBPipeline;
    pfldDB0060ppField1: TppField;
    pfldDB0060ppField2: TppField;
    pfldDB0060ppField3: TppField;
    pfldDB0060ppField4: TppField;
    ppDB493: TppDBPipeline;
    pfldDB493ppField1: TppField;
    pfldDB493ppField3: TppField;
    ds1: TDataSource;
    ds2: TDataSource;
    qryADO25: TADOQuery;
    strngfldADO25ENG_NOTE: TStringField;
    intgrfldADO25set_qty: TIntegerField;
    qryADO25REMARK: TMemoField;
    qryADO25DSDesigner5: TMemoField;
    strngfldADO25DSDesigner: TStringField;
    strngfldADO25DSDesigner2: TStringField;
    strngfldADO25DSDesigner3: TStringField;
    strngfldADO25DSDesigner4: TStringField;
    ppDB25: TppDBPipeline;
    pfldDB25ppField1: TppField;
    pfldDB25ppField2: TppField;
    pfldDB25ppField3: TppField;
    pfldDB25ppField4: TppField;
    pfldDB25ppField5: TppField;
    pfldDB25ppField6: TppField;
    pfldDB25ppField7: TppField;
    pfldDB25ppField8: TppField;
    ppDB90: TppDBPipeline;
    pfldDB90ppField1: TppField;
    pfldDB90ppField2: TppField;
    pfldDB90ppField3: TppField;
    pfldDB90ppField6: TppField;
    qryADO62: TADOQuery;
    strngfldADO62CATEGORY: TStringField;
    fltfldADO62AMOUNT: TFloatField;
    fltfldADO62free_amount: TFloatField;
    ds3: TDataSource;
    ppDB62: TppDBPipeline;
    pfldDB62ppField1: TppField;
    pfldDB62ppField2: TppField;
    pfldDB62ppField3: TppField;
    qryADO6011: TADOQuery;
    qryADO6011DSDesigner: TMemoField;
    ds4: TDataSource;
    ppDB6011: TppDBPipeline;
    pfldDB6011ppField1: TppField;
    ppDesigner1: TppDesigner;
    ppDB60: TppDBPipeline;
    pfldDB60ppField1: TppField;
    pfldDB60ppField2: TppField;
    pfldDB60ppField3: TppField;
    pfldDB60ppField4: TppField;
    pfldDB60ppField5: TppField;
    pfldDB60ppField6: TppField;
    pfldDB60ppField7: TppField;
    pfldDB60ppField8: TppField;
    pfldDB60ppField9: TppField;
    pfldDB60ppField10: TppField;
    pfldDB60ppField11: TppField;
    pfldDB60ppField12: TppField;
    pfldDB60ppField13: TppField;
    pfldDB60ppField14: TppField;
    pfldDB60ppField15: TppField;
    pfldDB60ppField16: TppField;
    pfldDB60ppField17: TppField;
    pfldDB60ppField18: TppField;
    pfldDB60ppField19: TppField;
    pfldDB60ppField20: TppField;
    pfldDB60ppField21: TppField;
    pfldDB60ppField22: TppField;
    pfldDB60ppField23: TppField;
    pfldDB60ppField24: TppField;
    pfldDB60ppField25: TppField;
    pfldDB60ppField26: TppField;
    pfldDB60ppField27: TppField;
    pfldDB60ppField28: TppField;
    pfldDB60ppField29: TppField;
    pfldDB60ppField30: TppField;
    pfldDB60ppField31: TppField;
    pfldDB60ppField32: TppField;
    pfldDB60ppField33: TppField;
    pfldDB60ppField34: TppField;
    pfldDB60ppField35: TppField;
    pfldDB60ppField36: TppField;
    pfldDB60ppField37: TppField;
    pfldDB60ppField38: TppField;
    pfldDB60ppField39: TppField;
    pfldDB60ppField40: TppField;
    pfldDB60ppField41: TppField;
    pfldDB60ppField42: TppField;
    pfldDB60ppField43: TppField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_report1: TForm_report1;

implementation

uses
  damo;

{$R *.dfm}

end.
