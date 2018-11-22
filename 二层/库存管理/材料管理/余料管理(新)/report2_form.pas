unit report2_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppDB, ppDBPipe, DB, ADODB, ppEndUsr, ppCtrls, ppBands, ppStrtch,
  ppMemo, ppVar, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, ppModule, daDataModule;

type
  TForm_report2 = class(TForm)
    ppDB457: TppDBPipeline;
    ppReport2: TppReport;
    DataSource2: TDataSource;
    aq457: TADODataSet;
    aq457rkey: TIntegerField;
    aq457TDATE: TDateTimeField;
    aq457QUAN_ON_HAND: TIntegerField;
    aq457MAT_CODE: TStringField;
    aq457LEN_SIZE: TBCDField;
    aq457WEI_SIZE: TBCDField;
    aq457STD_COST: TBCDField;
    aq457INV_NAME: TStringField;
    aq457INV_PART_NUMBER: TStringField;
    aq457REMARK: TStringField;
    aq457EMPLOYEE_NAME: TStringField;
    aq457INV_DESCRIPTION: TStringField;
    aq457DSDesigner: TStringField;
    aq457mat_desc: TStringField;
    aq457RKEY_1: TIntegerField;
    aq457key556: TIntegerField;
    aq457mat_desc_1: TStringField;
    aq457Status: TIntegerField;
    aq457Statu: TStringField;
    aq457AUDITED_ptr: TIntegerField;
    aq457AUDITED_Name: TStringField;
    aq457AUDITED_DATE: TDateTimeField;
    aq457EMPLOYEE_NAME_1: TStringField;
    aq457PeiLiaoDan: TStringField;
    ppDesigner1: TppDesigner;
    ppHeaderBand2: TppHeaderBand;
    plbl1: TppLabel;
    plbl2: TppLabel;
    plbl3: TppLabel;
    pdbtxt1: TppDBText;
    pdbmg1: TppDBImage;
    plbl5: TppLabel;
    plbl6: TppLabel;
    pdbtxt2: TppDBText;
    plbl7: TppLabel;
    pdbtxt3: TppDBText;
    plbl8: TppLabel;
    pdbtxt4: TppDBText;
    pln1: TppLine;
    plbl10: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText15: TppDBText;
    ppDBText19: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppDBText16: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ADOQ493: TADOQuery;
    DataSource3: TDataSource;
    ppDB493: TppDBPipeline;
    aq457quan_assign: TIntegerField;
    aq457getdate: TStringField;
    ADODataSet1: TADODataSet;
    IntegerField1: TIntegerField;
    DateTimeField1: TDateTimeField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    BCDField1: TBCDField;
    BCDField2: TBCDField;
    BCDField3: TBCDField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    StringField9: TStringField;
    IntegerField5: TIntegerField;
    StringField10: TStringField;
    IntegerField6: TIntegerField;
    StringField11: TStringField;
    DateTimeField2: TDateTimeField;
    StringField12: TStringField;
    StringField13: TStringField;
    IntegerField7: TIntegerField;
    StringField14: TStringField;
    DataSource1: TDataSource;
    ppDBPipeline1: TppDBPipeline;
    ppDesigner2: TppDesigner;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText1: TppDBText;
    ppDBImage1: TppDBImage;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText2: TppDBText;
    ppLabel6: TppLabel;
    ppDBText3: TppDBText;
    ppLabel7: TppLabel;
    ppDBText4: TppDBText;
    ppLine1: TppLine;
    ppLabel8: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBPipeline1ppField1: TppField;
    ppDBPipeline1ppField2: TppField;
    ppDBPipeline1ppField3: TppField;
    ppDBPipeline1ppField4: TppField;
    ppDBPipeline1ppField5: TppField;
    ppDBPipeline1ppField6: TppField;
    ppDBPipeline1ppField7: TppField;
    ppDBPipeline1ppField8: TppField;
    ppDBPipeline1ppField9: TppField;
    ppDBPipeline1ppField10: TppField;
    ppDBPipeline1ppField11: TppField;
    ppDBPipeline1ppField12: TppField;
    ppDBPipeline1ppField13: TppField;
    ADODataSet1EXPIRE_DATE: TDateTimeField;
    ppDBPipeline1ppField14: TppField;
    aq457EXPIRE_DATE: TDateTimeField;
    ADODataSet2: TADODataSet;
    DataSource4: TDataSource;
    ppDBPipeline2: TppDBPipeline;
    ppDBPipeline2ppField1: TppField;
    ADODataSet2peiliaodan: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_report2: TForm_report2;

implementation

uses damo;

{$R *.dfm}

end.
