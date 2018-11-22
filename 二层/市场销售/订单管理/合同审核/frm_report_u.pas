unit frm_report_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ComObj, Excel97,
  ADODB, ppDB, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppEndUsr,
  ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppModule, raCodMod,
  ppStrtch, ppMemo, ppSubRpt, daDataModule;

type
  TForm_report = class(TForm)
    DataSource1: TDataSource;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    ppDBPipeline2: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLabel1: TppLabel;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBImage1: TppDBImage;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText24: TppDBText;
    ppLabel3: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine9: TppLine;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel5: TppLabel;
    ppLine5: TppLine;
    ppLine1: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLabel7: TppLabel;
    DataSource3: TDataSource;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ADODataSet1: TADODataSet;
    ADODataSet1rkey: TAutoIncField;
    ADODataSet1submit_person: TIntegerField;
    ADODataSet1submit_department: TIntegerField;
    ADODataSet1check_status: TIntegerField;
    ADODataSet1circle: TIntegerField;
    ADODataSet1check_type: TIntegerField;
    ADODataSet1DSDesigner: TLargeintField;
    ADODataSet1DSDesigner2: TWideStringField;
    ADODataSet1DSDesigner3: TWideStringField;
    ADODataSet1DSDesigner4: TWideStringField;
    ADODataSet1en: TWideStringField;
    ADODataSet1DSDesigner5: TDateTimeField;
    ADODataSet1DSDesigner6: TStringField;
    ADODataSet1DSDesigner7: TStringField;
    ADODataSet1DSDesigner8: TMemoField;
    ADODataSet1DSDesigner9: TStringField;
    ADODataSet1submit_suggestion: TMemoField;
    ADODataSet1remark: TMemoField;
    ADODataSet1party_a: TIntegerField;
    ADODataSet2: TADODataSet;
    ADODataSet2rkey: TAutoIncField;
    ADODataSet2d696_ptr: TIntegerField;
    ADODataSet2d34_index: TIntegerField;
    ADODataSet2d34_ptr: TIntegerField;
    ADODataSet2check_person: TIntegerField;
    ADODataSet2check_status: TIntegerField;
    ADODataSet2check_time: TDateTimeField;
    ADODataSet2check_suggestion: TMemoField;
    ADODataSet2employee_name: TStringField;
    ADODataSet2dept_name: TStringField;
    ADODataSet2DSDesigner: TStringField;
    ppDBPipeline1: TppDBPipeline;
    ppDBPipeline3: TppDBPipeline;
    ppLabel2: TppLabel;
    ppDBText14: TppDBText;
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
