unit LOTScrapDfrm_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, ppProd, ppClass, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, DB, ADODB, ppBands, ppCache, ppPrnabl, ppCtrls, ppStrtch,
  ppMemo;

type
  Tfrm_LOTScrapD = class(TForm)
    ads493: TADODataSet;
    ads493Company_Name: TStringField;
    ads493Company_Name2: TStringField;
    ads493Company_Name3: TStringField;
    ads493ship_address: TStringField;
    ads493Company_Icon: TBlobField;
    ads493SITE_INFO_ADD_1: TStringField;
    ads493SITE_INFO_ADD_2: TStringField;
    ads493SITE_INFO_ADD_3: TStringField;
    ads493SITE_INFO_PHONE: TStringField;
    DataSource2: TDataSource;
    ppDB493: TppDBPipeline;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    DataSource1: TDataSource;
    ADS06: TADODataSet;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ADS06WORK_ORDER_NUMBER: TStringField;
    ADS06MANU_PART_NUMBER: TStringField;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppDBImage1: TppDBImage;
    ppDB06: TppDBPipeline;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel2: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine7: TppLine;
    ppLabel6: TppLabel;
    ppLine8: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine9: TppLine;
    ppLabel9: TppLabel;
    ppLine10: TppLine;
    ppLabel10: TppLabel;
    ppLine11: TppLine;
    ppLabel11: TppLabel;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLabel12: TppLabel;
    ppLine14: TppLine;
    ppLabel13: TppLabel;
    ppLine15: TppLine;
    ppLabel14: TppLabel;
    ppLine16: TppLine;
    ppLabel15: TppLabel;
    ppLine17: TppLine;
    ppLabel16: TppLabel;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppMemo1: TppMemo;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLine39: TppLine;
    ppLine40: TppLine;
    ppLine41: TppLine;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_LOTScrapD: Tfrm_LOTScrapD;

implementation

uses Dm;

{$R *.dfm}

end.
