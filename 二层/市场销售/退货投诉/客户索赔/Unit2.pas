unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, DB,
  ADODB, ppCtrls, ppPrnabl, ppBands, ppCache, ppModule, daDataModule,
  ppStrtch, ppSubRpt, raCodMod, ppEndUsr;

type
  TForm_Report = class(TForm)
    ADO597: TADOQuery;
    DataSource1: TDataSource;
    ppDB597: TppDBPipeline;
    ppReport1: TppReport;
    ADO597ststusr: TWordField;
    ADO597rkey: TAutoIncField;
    ADO597spNumber: TStringField;
    ADO597ABBR_NAME: TStringField;
    ADO597USER_FULL_NAME: TStringField;
    ADO597CURR_NAME: TStringField;
    ADO597v_ttype: TWideStringField;
    ADO597Number: TIntegerField;
    ADO597spmoney: TBCDField;
    ADO597ABBR_NAME_1: TStringField;
    ADO597yw05: TStringField;
    ADO597EntryTime: TDateTimeField;
    ADO597debita: TStringField;
    ADO597Remarks: TWideStringField;
    ADO597v_status: TStringField;
    ADO597submit_date: TDateTimeField;
    ADO597ywexplain: TWideStringField;
    ADO609: TADOQuery;
    DataSource2: TDataSource;
    ADO609MANU_PART_NUMBER: TStringField;
    ADO609MANU_PART_DESC: TStringField;
    ADO609rkey: TAutoIncField;
    ADO609rkey597: TIntegerField;
    ADO609Number25: TStringField;
    ADO609condate: TDateTimeField;
    ADO609remark: TWideStringField;
    ADO609rec_no: TWideStringField;
    ADO609xingtai: TStringField;
    ADO609explain: TWideStringField;
    ADO609company: TStringField;
    ADO609Number: TIntegerField;
    ADO609spUnitPrice: TBCDField;
    ADO609spliable: TWideStringField;
    ADO609spmonth: TDateTimeField;
    ppDesigner1: TppDesigner;
    ADO599: TADOQuery;
    DataSource3: TDataSource;
    ADO599rkey597: TIntegerField;
    ADO599PUTH_INFO: TWideStringField;
    ADO599seq_no: TIntegerField;
    ADO599auth_date: TDateTimeField;
    ADO599USER_FULL_NAME: TStringField;
    ADO599status1: TStringField;
    ADO599v_ttype: TWideStringField;
    ppDB599: TppDBPipeline;
    DB609: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppShape2: TppShape;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText6: TppDBText;
    ppLine3: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText8: TppDBText;
    ppLabel10: TppLabel;
    ppDBText9: TppDBText;
    ppDBText7: TppDBText;
    ppLabel1: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLine4: TppLine;
    ppLabel16: TppLabel;
    ppLine8: TppLine;
    ppLabel18: TppLabel;
    ppLine10: TppLine;
    ppLine9: TppLine;
    ppLabel19: TppLabel;
    ppLine12: TppLine;
    ppLabel21: TppLabel;
    ppLine5: TppLine;
    ppDetailBand1: TppDetailBand;
    ppShape3: TppShape;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine16: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine21: TppLine;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText14: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText19: TppDBText;
    ppLine23: TppLine;
    ppLine24: TppLine;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Report: TForm_Report;

implementation

uses Udemo;

{$R *.dfm}

end.
