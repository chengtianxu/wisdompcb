unit report_data1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDB, ppDBPipe, ppBands, ppCtrls, ppVar, ppPrnabl,
  ppClass, ppCache, ppRelatv, ppProd, ppReport, ppComm, ppEndUsr;

type
  TForm_report1 = class(TForm)
    ppDesigner1: TppDesigner;
    ppReport1: TppReport;
    ppDB35: TppDBPipeline;
    DS35: TDataSource;
    aq35: TADOQuery;
    aq35serial_no: TIntegerField;
    aq35part_number: TStringField;
    aq35text: TStringField;
    aq35source: TStringField;
    aq35if_gerber: TStringField;
    aq35engineer: TStringField;
    aq35enter_date: TDateTimeField;
    aq35ecn_no: TStringField;
    aq35manu_part_number: TStringField;
    aq35manu_part_desc: TStringField;
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
    DS493: TDataSource;
    ppDB493: TppDBPipeline;
    ppDB493ppField1: TppField;
    ppDB493ppField2: TppField;
    ppDB493ppField3: TppField;
    ppDB493ppField4: TppField;
    ppDB493ppField5: TppField;
    ppDB493ppField6: TppField;
    ppDB493ppField7: TppField;
    ppDB493ppField8: TppField;
    ppDB493ppField9: TppField;
    ppHeaderBand5: TppHeaderBand;
    ppDBImage2: TppDBImage;
    ppDBText33: TppDBText;
    ppLabel42: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppDBText32: TppDBText;
    ppDBText34: TppDBText;
    ppLine48: TppLine;
    ppLine49: TppLine;
    ppLine50: TppLine;
    ppLine51: TppLine;
    ppLine52: TppLine;
    ppLine53: TppLine;
    ppLine54: TppLine;
    ppLine55: TppLine;
    ppLine56: TppLine;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLine57: TppLine;
    ppLabel52: TppLabel;
    ppLine68: TppLine;
    ppDetailBand5: TppDetailBand;
    ppLine58: TppLine;
    ppLine59: TppLine;
    ppLine60: TppLine;
    ppLine61: TppLine;
    ppLine62: TppLine;
    ppLine63: TppLine;
    ppLine64: TppLine;
    ppLine65: TppLine;
    ppLine66: TppLine;
    ppLine67: TppLine;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLabel53: TppLabel;
    ppLine69: TppLine;
    ppLabel54: TppLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_report1: TForm_report1;

implementation

{$R *.dfm}

end.
