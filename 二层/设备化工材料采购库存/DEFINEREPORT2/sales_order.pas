unit sales_order;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDB, ppDBPipe, ppEndUsr, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, ppBands, ppCtrls, ppVar, ppPrnabl, ppStrtch, ppMemo,
  ppCache, ppModule, raCodMod, ppSubRpt;

type
  TForm1 = class(TForm)
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    ppDB0060: TppDBPipeline;
    ppDB9711: TppDBPipeline;
    ppDB493: TppDBPipeline;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ado60: TADOQuery;
    ado60SALES_ORDER: TStringField;
    ado60CUSTOMER_PART_NUMBER: TStringField;
    ado60CUSTOMER_PART_DESC: TStringField;
    ado60CP_REV: TStringField;
    ado60PARTS_ORDERED: TFloatField;
    ado60PART_PRICE: TFloatField;
    ado60TOTAL_ADD_L_PRICE: TFloatField;
    DataSource2: TDataSource;
    AQ9711: TADOQuery;
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    ADOQuery1cust_code: TStringField;
    ADOQuery1customer_name: TStringField;
    ADOQuery1D97PO_NUMBER: TStringField;
    ADOQuery1po_date: TDateTimeField;
    ppDB60: TppDBPipeline;
    ado60ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ado60EXCH_RATE: TFloatField;
    ado60CURR_NAME: TStringField;
    ado60CURR_CODE: TStringField;
    ado60ent_date: TDateTimeField;
    AQ9711memo_text: TMemoField;
    ppDB9711ppField1: TppField;
    DataSource5: TDataSource;
    ADO25: TADOQuery;
    ADO25REMARK: TStringField;
    ADO25ENG_NOTE: TStringField;
    ADO25TEXT: TStringField;
    ADO25Data0273remark: TStringField;
    ppDB25: TppDBPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppField3: TppField;
    ppField4: TppField;
    ADOQuery1D5EMPLOYEE_NAME: TStringField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    ADOQuery1SHIPPING_METHOD: TStringField;
    ADOQuery1D10CUSTOMER_NAME: TStringField;
    Aqinfor90: TADOQuery;
    Aqinfor90DEPT_NAME: TStringField;
    Aqinfor90EMPLOYEE_NAME: TStringField;
    Aqinfor90auth_date: TDateTimeField;
    Aqinfor90rkey: TAutoIncField;
    Aqinfor90dept_ptr: TIntegerField;
    Aqinfor90auth_flag: TStringField;
    DataSource6: TDataSource;
    ppDB90: TppDBPipeline;
    ppTitleBand1: TppTitleBand;
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
    ppDBText18: TppDBText;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel5: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppDetailBand1: TppDetailBand;
    ppLine9: TppLine;
    ppDBText1: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLabel15: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLabel16: TppLabel;
    raCodeModule1: TraCodeModule;
    raCodeModule2: TraCodeModule;
    ADOQuery1REFERENCE_NUMBER: TStringField;
    ADOQuery1so_style: TWordField;
    ADOQuery1sostyle: TStringField;
    ppDB60ppField9: TppField;
    ppDB60ppField10: TppField;
    ADO25set_x_qty: TIntegerField;
    ADO25set_y_qty: TIntegerField;
    ADO25part_out: TStringField;
    ppDB25ppField1: TppField;
    ADOQuery1conf_date: TDateTimeField;
    ppDB60ppField11: TppField;
    ADO62: TADOQuery;
    ADO62CATEGORY: TStringField;
    ADO62AMOUNT: TFloatField;
    ADO62free_amount: TFloatField;
    DataSource7: TDataSource;
    ppDB62: TppDBPipeline;
    ADO6011: TADOQuery;
    ADO6011memo_text: TMemoField;
    DataSource8: TDataSource;
    ppDB6011: TppDBPipeline;
    ado60SHIPPING_METHOD: TStringField;
    ppDB0060ppField13: TppField;
    ado60unit_sq: TFloatField;
    ado60ANALYSIS_CODE_2: TStringField;
    ado60ANALYSIS_CODE_1: TStringField;
    ado60mianji: TFloatField;
    ppDB0060ppField14: TppField;
    ppDB0060ppField15: TppField;
    ppDB0060ppField16: TppField;
    ppDB0060ppField17: TppField;
    ado60fob: TStringField;
    ppDB0060ppField18: TppField;
    procedure ppReport1PreviewFormCreate(Sender: TObject);
    procedure Aqinfor90CalcFields(DataSet: TDataSet);
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure ADO25CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses DataModule;

{$R *.dfm}

procedure TForm1.ppReport1PreviewFormCreate(Sender: TObject);
begin
//ppReport1.PreviewForm.WindowState := wsMaximized;
end;

procedure TForm1.Aqinfor90CalcFields(DataSet: TDataSet);
begin
 if aqinfor90auth_date.AsVariant=null then
  aqinfor90auth_flag.Value := '待审批'
 else
  aqinfor90auth_flag.Value := '已评审';
end;

procedure TForm1.ADOQuery1CalcFields(DataSet: TDataSet);
begin
if self.ADOQuery1so_style.Value=0 then
 self.ADOQuery1sostyle.Value:='正式订单'
else
 self.ADOQuery1sostyle.Value:='备品订单';
end;

procedure TForm1.ADO25CalcFields(DataSet: TDataSet);
begin
self.ADO25part_out.Value:=self.ADO25set_x_qty.AsString+ ' X '+
                          self.ADO25set_y_qty.AsString;
end;

end.
