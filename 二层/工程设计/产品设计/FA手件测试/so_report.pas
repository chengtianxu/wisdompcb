unit so_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, ppDB, ppDBPipe, DB, ppBands, ppCtrls, ppPrnabl, ppCache,
  ppStrtch, ppMemo, ppVar, ADODB, ppEndUsr;

type
  TForm_report = class(TForm)
    ppReport1: TppReport;
    ppDB740: TppDBPipeline;
    DataSource3: TDataSource;
    ppDB493: TppDBPipeline;
    DataSource4: TDataSource;
    ppDB745: TppDBPipeline;
    ppTitleBand1: TppTitleBand;
    ppDBImage1: TppDBImage;
    ppDBText2: TppDBText;
    ppLine1: TppLine;
    ppLine19: TppLine;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel5: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine5: TppLine;
    ppDetailBand1: TppDetailBand;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine14: TppLine;
    ppLine18: TppLine;
    ppFooterBand1: TppFooterBand;
    ppDesigner1: TppDesigner;
    aq493: TADOQuery;
    aq493Company_Name: TStringField;
    aq493Company_Name2: TStringField;
    aq493Company_Name3: TStringField;
    aq493ship_address: TStringField;
    aq493Company_Icon: TBlobField;
    aq493SITE_INFO_ADD_1: TStringField;
    aq493SITE_INFO_ADD_2: TStringField;
    aq493SITE_INFO_ADD_3: TStringField;
    aq493SITE_INFO_PHONE: TStringField;
    DataSource1: TDataSource;
    aq740: TADOQuery;
    aq745: TADOQuery;
    ppLabel10: TppLabel;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText9: TppDBText;
    ppLabel7: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppDBText8: TppDBText;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLine4: TppLine;
    ppLine6: TppLine;
    aq005: TADOQuery;
    DataSource2: TDataSource;
    ppDB0005: TppDBPipeline;
    aq740Rkey: TIntegerField;
    aq740DEPT_CODE: TStringField;
    aq740DEPT_NAME: TStringField;
    aq740DifficultPoint: TWideStringField;
    aq740BEIZHU: TWideStringField;
    aq740TestResult: TWideStringField;
    aq745DSDesigner: TStringField;
    aq745DSDesigner2: TStringField;
    aq745DSDesigner3: TStringField;
    ppDB740ppField1: TppField;
    ppDB740ppField2: TppField;
    ppDB740ppField3: TppField;
    ppDB740ppField4: TppField;
    ppDB740ppField5: TppField;
    ppDB738ppField1: TppField;
    ppDB738ppField2: TppField;
    ppDB738ppField3: TppField;
    ppDBText1: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    aq745QUAN_ON_HAND: TIntegerField;
    ppDB745ppField1: TppField;
    ppDBText10: TppDBText;
    aq005EMPLOYEE_NAME: TStringField;
    ppDB0005ppField1: TppField;
    procedure ppReport1PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_report: TForm_report;

implementation

uses uDM,uMain;

{$R *.dfm}

procedure TForm_report.ppReport1PreviewFormCreate(Sender: TObject);
begin
//ppReport1.PreviewForm.WindowState := wsMaximized;
end;

end.
