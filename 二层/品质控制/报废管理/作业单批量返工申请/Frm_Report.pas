unit Frm_Report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppComm, ppRelatv, ppDB, ppDBPipe, ppStrtch, ppMemo, ppCtrls,
  ppPrnabl, ppClass, ppBands, ppCache, ppEndUsr, ppProd, ppReport, ppVar,
  DB, ADODB, ppModule, daDataModule, Grids, DBGrids, ppSubRpt;

type
  TForm_Report = class(TForm)
    DataSource2: TDataSource;
    Aqwz252: TADOQuery;
    Aqwz203: TADOQuery;
    Aqwz203rkey: TAutoIncField;
    Aqwz203return_code: TStringField;
    Aqwz203user_ptr: TIntegerField;
    Aqwz203ENT_DATE: TDateTimeField;
    Aqwz203submit: TDateTimeField;
    Aqwz203CUST_PART_PTR: TIntegerField;
    Aqwz203dept_ptr: TIntegerField;
    Aqwz203v_ttype: TStringField;
    Aqwz203status: TWordField;
    Aqwz203tstatus: TStringField;
    Aqwz203WTYPE_step: TIntegerField;
    Aqwz203describe: TWideStringField;
    Aqwz203reason: TWideStringField;
    Aqwz203scheme: TWideStringField;
    Aqwz203panel_qty: TIntegerField;
    Aqwz203pcs_qty: TIntegerField;
    Aqwz203Remark: TWideStringField;
    Aqwz203MANU_PART_NUMBER: TStringField;
    Aqwz203MANU_PART_DESC: TStringField;
    Aqwz203DEPT_CODE: TStringField;
    Aqwz203DEPT_NAME: TStringField;
    Aqwz203ABBR_NAME: TStringField;
    DataSource1: TDataSource;
    Aqwz252work_order_number: TStringField;
    Aqwz252rkey203: TIntegerField;
    Aqwz252rkey06: TIntegerField;
    ppDB203: TppDBPipeline;
    ppDB252: TppDBPipeline;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    aqwz260: TADOQuery;
    DataSource3: TDataSource;
    aqwz260rkey203: TIntegerField;
    aqwz260dept_ptr: TIntegerField;
    aqwz260dept_name: TStringField;
    aqwz260user_ptr: TIntegerField;
    aqwz260employee_name: TStringField;
    aqwz260auth_date: TDateTimeField;
    aqwz260PUTH_INFO: TStringField;
    aqwz260seq_no: TIntegerField;
    aqwz260auth_flag: TBooleanField;
    ppDB260: TppDBPipeline;
    Aqwz252pnl_qty: TIntegerField;
    Aqwz252pcs_qty: TIntegerField;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppShape1: TppShape;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppShape2: TppShape;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel10: TppLabel;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppShape5: TppShape;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppDBMemo3: TppDBMemo;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppDBText9: TppDBText;
    ppDBText11: TppDBText;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLabel13: TppLabel;
    ppShape6: TppShape;
    ppLine12: TppLine;
    ppLine14: TppLine;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLine13: TppLine;
    ppLabel17: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Report: TForm_Report;

implementation

uses Demo;

{$R *.dfm}

end.
