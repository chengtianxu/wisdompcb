unit frm_report_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ComObj, Excel97,
  ADODB, ppDB, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppEndUsr,
  ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppModule, raCodMod,
  ppStrtch, ppMemo, ppSubRpt, daDataModule, ppVar;

type
  TForm_report = class(TForm)
    ADODataSet2: TADODataSet;
    ADOQuery2: TADOQuery;
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    DataSource3: TDataSource;
    DataSource2: TDataSource;
    ppDBPipeline2: TppDBPipeline;
    ppDBPipeline2ppField1: TppField;
    ppDBPipeline2ppField2: TppField;
    ppDBPipeline2ppField3: TppField;
    ppDBPipeline3: TppDBPipeline;
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBImage1: TppDBImage;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText7: TppDBText;
    ppDBText24: TppDBText;
    ppLabel3: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine9: TppLine;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel5: TppLabel;
    ppLine5: TppLine;
    ppLine1: TppLine;
    ppDBText14: TppDBText;
    ppLabel2: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel7: TppLabel;
    ppDesigner1: TppDesigner;
    ADODataSet2rkey: TAutoIncField;
    ADODataSet2d541_ptr: TIntegerField;
    ADODataSet2d34_index: TIntegerField;
    ADODataSet2d34_ptr: TIntegerField;
    ADODataSet2check_person: TIntegerField;
    ADODataSet2check_status: TIntegerField;
    ADODataSet2check_time: TDateTimeField;
    ADODataSet2check_suggestion: TMemoField;
    ADODataSet2employee_name: TStringField;
    ADODataSet2dept_name: TStringField;
    ADODataSet2DSDesigner: TStringField;
    ppLine6: TppLine;
    ppLabel1: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel6: TppLabel;
    ppDBText5: TppDBText;
    ppLabel8: TppLabel;
    ppDBText6: TppDBText;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBText8: TppDBText;
    ppDBText13: TppDBText;
    ppLine7: TppLine;
    ppLabel17: TppLabel;
    ppLine8: TppLine;
    ppLabel18: TppLabel;
    ppDBText15: TppDBText;
    ppDBText19: TppDBText;
    ppLabel19: TppLabel;
    ppDBText20: TppDBText;
    ppLabel20: TppLabel;
    ppDBText21: TppDBText;
    ppDBPipeline1ppField14: TppField;
    ADODataSet1rkey: TAutoIncField;
    ADODataSet1INV_PART_NUMBER: TStringField;
    ADODataSet1INV_PART_DESCRIPTION: TStringField;
    ADODataSet1INV_NAME: TStringField;
    ADODataSet1MATERIAL_REPLACE_NO: TStringField;
    ADODataSet1remark: TWideStringField;
    ADODataSet1QUAN_ON_HAND: TFloatField;
    ADODataSet1submit_date: TDateTimeField;
    ADODataSet1d05_ptr: TIntegerField;
    ADODataSet1MANU_PART_NUMBER: TStringField;
    ADODataSet1beizhu: TWideStringField;
    ADODataSet1MANU_PART_DESC: TStringField;
    ADODataSet1CUST_CODE: TStringField;
    ppLabel14: TppLabel;
    ppLine10: TppLine;
    ADODataSet1EMPLOYEE_NAME: TStringField;
    ppDBPipeline1ppField15: TppField;
    ADODataSet1reason: TWideStringField;
    ppDBPipeline1ppField16: TppField;

    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_report: TForm_report;

implementation

uses demo;

{$R *.dfm}










end.
