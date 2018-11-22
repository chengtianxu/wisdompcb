unit report_data;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDB, ppComm, ppRelatv, ppDBPipe, StdCtrls, DBCtrls,
  ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppProd,
  ppReport, ExtCtrls, Mask, Grids, DBGrids, ppVar, ppSubRpt, ppModule,
  raCodMod, ppEndUsr,raide, ppBarCod;

type
  TForm_report = class(TForm)
    DataSource1: TDataSource;
    ADS25: TADODataSet;
    ADS25RKEY: TIntegerField;
    ADS25DSDesigner: TStringField;
    ADS25DSDesigner2: TStringField;
    ADS25DSDesigner3: TStringField;
    ADS25DSDesigner4: TStringField;
    ADS25DSDesigner5: TStringField;
    ADS25DSDesigner6: TStringField;
    ADS25DSDesigner7: TStringField;
    ADS25DSDesigner8: TStringField;
    ADS25DSDesigner9: TDateTimeField;
    ADS25DSDesigner10: TStringField;
    ADS25DSDesigner11: TDateTimeField;
    ADS25DSDesigner12: TStringField;
    ADS25DSDesigner13: TDateTimeField;
    ADS25DSDesigner14: TStringField;
    ADS25DSDesigner15: TStringField;
    ADS25DSDesigner16: TWordField;
    ADS25SET: TStringField;
    ADS25PCS: TStringField;
    ADS25SPEL: TStringField;
    ADS25PCS2: TFloatField;
    ADS25SET2: TFloatField;
    ADS25SPEL2: TFloatField;
    ADS25DSDesigner17: TMemoField;
    ADS25DSDesigner18: TMemoField;
    ADS25DSDesigner19: TStringField;
    ADS25DSDesigner20: TFloatField;
    ADS25DSDesigner21: TIntegerField;
    ADS25DSDesigner22: TSmallintField;
    ADS25DSDesigner23: TSmallintField;
    ADS25DSDesigner24: TStringField;
    ADS25g: TBCDField;
    ADS25DSDesigner25: TIntegerField;
    ADS25DSDesigner26: TStringField;
    ADS25DSDesigner27: TStringField;
    ADS25DSDesigner28: TStringField;
    ADS25DSDesigner29: TStringField;
    ADS25DSDesigner30: TStringField;
    ADS25Field1: TWideStringField;
    ADS25Field2: TWideStringField;
    ppReport1: TppReport;
    ppDB25: TppDBPipeline;
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
    DataSource5: TDataSource;
    ppDB493: TppDBPipeline;
    ppDesigner1: TppDesigner;
    ads06: TADODataSet;
    DataSource3: TDataSource;
    ads06DSDesigner: TStringField;
    ads06DSDesigner2: TStringField;
    ads06DSDesigner3: TStringField;
    ads06DSDesigner4: TStringField;
    ads06DSDesigner5: TDateTimeField;
    ads06DSDesigner6: TDateTimeField;
    ads06DSDesigner7: TFloatField;
    ads06DSDesigner8: TIntegerField;
    ads06DSDesigner9: TIntegerField;
    ads06DSDesigner10: TDateTimeField;
    ads06DSDesigner11: TStringField;
    ads06PAN: TIntegerField;
    ads06PANPCS: TFloatField;
    ads06DSDesigner12: TFloatField;
    ads06DSDesigner13: TStringField;
    ads06DSDesigner14: TWordField;
    ads06DSDesigner15: TStringField;
    ads06DSDesigner16: TStringField;
    ads06DSDesigner17: TStringField;
    ppDB06: TppDBPipeline;
    ads06PnlA: TIntegerField;
    ads06PnlB: TIntegerField;
    ads06DSDesigner18: TStringField;
    ads06DSDesigner19: TStringField;
    ads06BOM_PTR: TIntegerField;
    ads06PPC_FLAG: TSmallintField;
    ADS25BARCODE_FLAG: TWordField;
    ads06APCS: TIntegerField;
    ads06BPCS: TIntegerField;
    ADS25DSDesigner31: TStringField;
    ads06DSDesigner20: TStringField;
    ads06DSDesigner21: TStringField;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppShape2: TppShape;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLabel12: TppLabel;
    ppLine8: TppLine;
    ppLabel14: TppLabel;
    ppDBText15: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBImage1: TppDBImage;
    ppDBText11: TppDBText;
    ppLabel13: TppLabel;
    ppLabel10: TppLabel;
    ppDBText16: TppDBText;
    ppLabel11: TppLabel;
    ppLine7: TppLine;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppLabel15: TppLabel;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel28: TppLabel;
    ppDBText26: TppDBText;
    ppLabel29: TppLabel;
    ppDBText27: TppDBText;
    ppLabel30: TppLabel;
    ppDBText28: TppDBText;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppDBBarCode1: TppDBBarCode;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppImage1: TppImage;
    ppVariable2: TppVariable;
    ppImage2: TppImage;
    ppVariable3: TppVariable;
    ppDBText10: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine3: TppLine;
    ppLabel4: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    raCodeModule1: TraCodeModule;
    ads06dept_code: TStringField;
    ads06dept_name: TStringField;
    ppDBText2: TppDBText;
    ads06DSDesigner22: TStringField;
    ADS25DSDesigner32: TStringField;
    ADS25DSDesigner33: TWordField;
    ADS25DSDesigner34: TWordField;
    procedure FormCreate(Sender: TObject);
    procedure ppReport1PrintingComplete(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_report: TForm_report;

implementation

uses main;


{$R *.dfm}


procedure TForm_report.FormCreate(Sender: TObject);
begin
  ADS493.Open;
end;

procedure TForm_report.ppReport1PrintingComplete(Sender: TObject);
begin
{ExecSql(dmcon.tmp,
'update data0006 set Trav_Printed_By_Ptr='+user_ptr+
' where rkey='+inttostr(self.ads06.Parameters[0].Value));
  }

end;

end.
