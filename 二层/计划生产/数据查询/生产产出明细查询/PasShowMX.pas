unit PasShowMX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB, Grids, DBGridEh;

type
  TfrmShowMX = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGridEh1: TDBGridEh;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1MANU_PART_NUMBER: TStringField;
    ADOQuery1MANU_PART_DESC: TStringField;
    ADOQuery1SAMPLE_NR: TStringField;
    ADOQuery1WORK_ORDER_NUMBER: TStringField;
    ADOQuery1ENT_DATETIME: TDateTimeField;
    ADOQuery1SCH_COMPL_DATE: TDateTimeField;
    ADOQuery1DEPT_CODE: TStringField;
    ADOQuery1DEPT_NAME: TStringField;
    ADOQuery1QTY_PROD2: TIntegerField;
    ADOQuery1PANELS: TIntegerField;
    ADOQuery1ACTION_REF: TStringField;
    ADOQuery1INTIME: TDateTimeField;
    ADOQuery1OUTTIME: TDateTimeField;
    ADOQuery1CUT_NO: TStringField;
    ADOQuery1EMPLOYEE_NAME: TStringField;
    ADOQuery1CUST_CODE: TStringField;
    ADOQuery1PROD_CODE: TStringField;
    ADOQuery1SO_NO: TStringField;
    ADOQuery1dept_code1: TStringField;
    ADOQuery1STEP_NO: TSmallintField;
    ADOQuery1PARAMETER_VALUE: TStringField;
    ADOQuery1dept_name1: TStringField;
    ADOQuery1PRODUCT_NAME: TStringField;
    ADOQuery1PARTS_PER_PANEL: TFloatField;
    ADOQuery1pnl_size: TStringField;
    ADOQuery1panel_ln: TFloatField;
    ADOQuery1panel_wd: TFloatField;
    ADOQuery1total_sqft: TFloatField;
    ADOQuery1total_sq: TFloatField;
    ADOQuery1C_WTYPE: TStringField;
    ADOQuery1dept_code2: TStringField;
    ADOQuery1dept_name2: TStringField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1ABBR_NAME_1: TStringField;
    ADOQuery1DSDesigner: TFloatField;
    ADOQuery1DataValues: TFloatField;
    ADOQuery1ModernDate34: TDateTimeField;
    ADOQuery1PRIORITY_name: TStringField;
    ADOQuery1d34Rkey: TIntegerField;
    ADOQuery1PROD_STATUS: TSmallintField;
    ADOQuery1CPJS: TStringField;
    ADOQuery1FLOW_NO: TSmallintField;
    ADOQuery1YS: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmShowMX: TfrmShowMX;

implementation

uses main;

{$R *.dfm}

end.
