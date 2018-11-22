unit t_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppProd,
  ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppEndUsr;

type
  TForm_trp = class(TForm)
    AQ415: TADOQuery;
    AQ415v_type: TStringField;
    AQ415number: TStringField;
    AQ415EMPLOYEE_NAME: TStringField;
    AQ415sys_date: TDateTimeField;
    AQ415quantity: TIntegerField;
    AQ415reference: TStringField;
    AQ415abbr_name10: TStringField;
    AQ415CUST_CODE: TStringField;
    AQ415CUSTOMER_NAME: TStringField;
    AQ415auth_date: TDateTimeField;
    AQ415DSDesigner: TStringField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    Aq493: TADOQuery;
    Aq493Company_Name: TStringField;
    Aq493Company_Name2: TStringField;
    Aq493Company_Name3: TStringField;
    Aq493ship_address: TStringField;
    Aq493Company_Icon: TBlobField;
    Aq493SITE_INFO_ADD_1: TStringField;
    Aq493SITE_INFO_ADD_2: TStringField;
    Aq493SITE_INFO_ADD_3: TStringField;
    Aq493SITE_INFO_PHONE: TStringField;
    Aq465: TADOQuery;
    Aq465LOCATION: TStringField;
    Aq465ABBR_NAME: TStringField;
    Aq465WORK_ORDER_NUMBER: TStringField;
    Aq465REFERENCE_NUMBER: TStringField;
    Aq465REFERENCE: TStringField;
    Aq465QUANTITY: TIntegerField;
    ppDB465: TppDBPipeline;
    ppDB493: TppDBPipeline;
    ppReport1: TppReport;
    AQ415type: TWordField;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
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
    ppLine8: TppLine;
    ppDBText12: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel14: TppLabel;
    ppDBCalc1: TppDBCalc;
    AQ415MANU_PART_NUMBER: TStringField;
    AQ415MANU_PART_DESC: TStringField;
    ppDB415: TppDBPipeline;
    ppDesigner1: TppDesigner;
    procedure AQ415CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_trp: TForm_trp;

implementation

uses main, main_one;

{$R *.dfm}

procedure TForm_trp.AQ415CalcFields(DataSet: TDataSet);
begin
if self.AQ415type.Value=1 then
 AQ415v_type.Value:='直接出仓'
else
if self.AQ415type.Value=2 then
 AQ415v_type.Value:='退货出仓'
else
if self.AQ415type.Value=3 then
 AQ415v_type.Value:='退货重检'
else
if self.AQ415type.Value=4 then
 AQ415v_type.Value:='正常重检';
end;

end.
