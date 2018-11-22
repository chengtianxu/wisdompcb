unit form_Main;

interface
           
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, TeeProcs, TeEngine, Chart, DbChart,
  ExtCtrls, Series, ComCtrls, ADODB, StdCtrls, Buttons,TeePrevi, ToolWin,DBGridEhImpExp,
  Provider, DBClient,DateUtils, Menus, TeeFunci, DBGrids,StrUtils,comobj;
type
  TDropDownInfo=class
  private
  protected
  public
    L_GridName               :TDBGridEh;     //添加下拉列表将创建在哪个表格名上
    L_DropdownColumn         :string;        //添加下拉列表的表格列名 //也可用于发生改变事件的字段
    L_ListDataSetName        :TDataSet;//下拉列表数据集名
    L_ListDataSetFilterField :string;        //拉列表数据集过滤字段名，//
    L_GetValueField          :string;        //获取值的字段名
    L_ListResultField        :string;        //下拉列表数据集返回的字段名 //当改变事件发生时，和该值进行定位
    L_FormWidth              :Integer;       //下拉窗体的宽度
    L_FormHeight             :Integer;       //下拉窗体的高度
    L_FormType               :Integer;       //下拉窗体的类型 1:单选窗口，2：多选窗口
    L_AddPickList            :array of string;//
    L_PickListResultValues   :array of string;//
    L_SourceDataSet          :TClientDataSet; //用于设置发生改变事件的数据集
    L_SourceField            :array of string;// DEPT_CODE,DEPT_NAME  改变发生后，获取值的字段
    L_ResultField            :array of string;        //DEPT_CODE,DEPT_NAME   改变发生后，从这些字段获取值
    L_FieldNotNull           :Boolean;                //如果设置为真，在L_DropdownColumn字段的值为空时，提示
//    L_FK            : string;
//    L_PK            : string; ,,11
  end;

type
  Tfrm_Main = class(TForm)
    DataSource3: TDataSource;
    PageControl1: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Panel1: TPanel;
    DBChart1: TDBChart;
    ADOQuery3: TADOQuery;
    Panel3: TPanel;
    qry0015: TADOQuery;
    qry0015RKEY: TAutoIncField;
    qry0015WAREHOUSE_CODE: TStringField;
    qry0015ABBR_NAME: TStringField;
    GroupBox5: TGroupBox;
    Label34: TLabel;
    Label38: TLabel;
    PF3_dteEnd: TDateTimePicker;
    PF3_dteBegin: TDateTimePicker;
    PF3_dteBeginTime: TDateTimePicker;
    PF3_dteEndTime: TDateTimePicker;
    GroupBox32: TGroupBox;
    PF3_cbx: TComboBox;
    Panel22: TPanel;
    SpeedButton5: TSpeedButton;
    ADODataSet1: TADODataSet;
    Panel5: TPanel;
    DBGridEh3: TDBGridEh;
    Panel6: TPanel;
    SpeedButton2: TSpeedButton;
    qry_0840: TADOQuery;
    qry_0840rkey: TAutoIncField;
    qry_0840Location: TStringField;
    ADOQuery3DSDesigner2: TStringField;
    ADOQuery3DSDesigner3: TBCDField;
    ADOQuery3DSDesigner4: TBCDField;
    ADOQuery3DSDesigner5: TBCDField;
    ADOQuery3DSDesigner6: TBCDField;
    ADOQuery3DSDesigner7: TBCDField;
    tlb1: TToolBar;
    btInsert: TSpeedButton;
    btEdit: TSpeedButton;
    btPost: TSpeedButton;
    btCancel: TSpeedButton;
    btDelete: TSpeedButton;
    btFilter: TSpeedButton;
    btRefresh: TSpeedButton;
    btOut: TSpeedButton;
    btPrior: TSpeedButton;
    btNext: TSpeedButton;
    btUpload: TSpeedButton;
    btDownload: TSpeedButton;
    SpeedButton1: TSpeedButton;
    btPrint: TSpeedButton;
    btClose: TSpeedButton;
    TabSheet1: TTabSheet;    ADOQuery1: TADOQuery;
    ClientDataSet1_1: TClientDataSet;
    DataSetProvider1_1: TDataSetProvider;
    ADOQuery1_1: TADOQuery;
    ADOQuery1Rkey: TAutoIncField;
    ADOQuery1Month: TWordField;
    DataSource1: TDataSource;
    ds1_1: TDataSource;
    ClientDataSet1_1Rkey: TAutoIncField;
    ClientDataSet1_1D851_ptr: TIntegerField;
    ClientDataSet1_1D840_ptr: TIntegerField;
    ClientDataSet1_1sumA: TBCDField;
    ClientDataSet1_1Target: TBCDField;
    ClientDataSet1_1Location: TStringField;
    ADOQuery1_1Rkey: TAutoIncField;
    ADOQuery1_1D851_ptr: TIntegerField;
    ADOQuery1_1D840_ptr: TIntegerField;
    ADOQuery1_1sumA: TBCDField;
    ADOQuery1_1Target: TBCDField;
    ADOQuery1_1Location: TStringField;
    ADOQuery1Years: TWordField;
    Panel4: TPanel;
    Panel8: TPanel;
    DBGridEh1_1: TDBGridEh;
    Panel9: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Panel10: TPanel;
    DBGridEh1: TDBGridEh;
    Panel7: TPanel;
    Chart1: TChart;
    ADOQuery1_1_1: TADOQuery;
    ADOQuery1_1ABBR_NAME: TStringField;
    ClientDataSet1_1ABBR_NAME: TStringField;
    ADOQuery1_1D015_ptr: TIntegerField;
    ClientDataSet1_1D015_ptr: TIntegerField;
    PopupMenu2: TPopupMenu;
    N_delete: TMenuItem;
    N_New: TMenuItem;
    N_save: TMenuItem;
    N_cancel: TMenuItem;
    SpeedButton3: TSpeedButton;
    ADOQuery1_2: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery2_1: TADOQuery;
    DataSource2: TDataSource;
    Panel11: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    PF2_dteEnd: TDateTimePicker;
    PF2_dteBegin: TDateTimePicker;
    GroupBox2: TGroupBox;
    PF2_cbx: TComboBox;
    Panel12: TPanel;
    SpeedButton4: TSpeedButton;
    Panel13: TPanel;
    Panel14: TPanel;
    Chart2: TChart;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series1: TBarSeries;
    PF2_dteBeginTime: TDateTimePicker;
    PF2_dteEndTime: TDateTimePicker;
    Panel15: TPanel;
    Panel16: TPanel;
    DBGridEh2: TDBGridEh;
    ADOQuery1_3: TADOQuery;
    TabSheet4: TTabSheet;
    ADOQuery4: TADOQuery;
    DataSource4: TDataSource;
    Panel17: TPanel;
    Panel18: TPanel;
    DBGridEh4: TDBGridEh;
    Chart4: TChart;
    ADOQuery4DSDesigner: TStringField;
    ADOQuery4DSDesigner2: TStringField;
    ADOQuery4DSDesigner3: TStringField;
    Series4: TBarSeries;
    Panel19: TPanel;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    PF4_dteEnd: TDateTimePicker;
    PF4_dteBegin: TDateTimePicker;
    PF4_dteBeginTime: TDateTimePicker;
    PF4_dteEndTime: TDateTimePicker;
    GroupBox4: TGroupBox;
    PF4_cbx: TComboBox;
    Panel20: TPanel;
    SpeedButton6: TSpeedButton;
    TabSheet5: TTabSheet;
    ADOQuery1_4: TADOQuery;
    Panel21: TPanel;
    GroupBox6: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    PF5_dteEnd: TDateTimePicker;
    PF5_dteBegin: TDateTimePicker;
    PF5_dteBeginTime: TDateTimePicker;
    PF5_dteEndTime: TDateTimePicker;
    GroupBox7: TGroupBox;
    PF5_cbx: TComboBox;
    Panel23: TPanel;
    SpeedButton7: TSpeedButton;
    Panel24: TPanel;
    Panel25: TPanel;
    DBGridEh5: TDBGridEh;
    Panel26: TPanel;
    Panel27: TPanel;
    Chart5: TChart;
    Series5: TBarSeries;
    ADOQuery5: TADOQuery;
    DataSource5: TDataSource;
    ADOQuery5_1: TADOQuery;
    TabSheet6: TTabSheet;
    ADOQuery6: TADOQuery;
    DataSource6: TDataSource;
    Panel28: TPanel;
    GroupBox8: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    PF6_dteEnd: TDateTimePicker;
    PF6_dteBegin: TDateTimePicker;
    PF6_dteBeginTime: TDateTimePicker;
    PF6_dteEndTime: TDateTimePicker;
    GroupBox9: TGroupBox;
    PF6_cbx: TComboBox;
    Panel29: TPanel;
    SpeedButton8: TSpeedButton;
    Edit2: TEdit;
    DBGridEh6: TDBGridEh;
    Label10: TLabel;
    ADOQuery6DSDesigner: TStringField;
    ADOQuery6DSDesigner3: TStringField;
    ADOQuery6DSDesigner4: TStringField;
    ADOQuery6DSDesigner5: TStringField;
    ADOQuery6DSDesigner6: TStringField;
    ADOQuery6DSDesigner7: TStringField;
    ADOQuery6DSDesigner8: TDateTimeField;
    ADOQuery6DSDesigner9: TFloatField;
    ADOQuery6DSDesigner10: TDateTimeField;
    ADOQuery6DSDesigner11: TBCDField;
    ADOQuery6DSDesigner12: TBCDField;
    ADOQuery6VMI: TStringField;
    ADOQuery6DSDesigner13: TStringField;
    ADOQuery6DSDesigner14: TStringField;
    ADOQuery6DSDesigner15: TStringField;
    ADOQuery6DSDesigner16: TStringField;
    ADOQuery6DSDesigner17: TStringField;
    ADOQuery6DSDesigner18: TStringField;
    ADOQuery6DSDesigner19: TStringField;
    ADOQuery6DSDesigner20: TStringField;
    ADOQuery6DSDesigner21: TDateTimeField;
    ADOQuery6DSDesigner22: TStringField;
    StatusBar1: TStatusBar;
    Label11: TLabel;
    edt_D840: TEdit;
    TabSheet7: TTabSheet;
    Panel30: TPanel;
    Panel31: TPanel;
    DBGridEh7_1: TDBGridEh;
    Panel32: TPanel;
    Label12: TLabel;
    Edit3: TEdit;
    Panel33: TPanel;
    DBGridEh7: TDBGridEh;
    Panel34: TPanel;
    DataSetProvider7: TDataSetProvider;
    ClientDataSet7: TClientDataSet;
    DataSource7: TDataSource;
    ClientDataSet7Location: TStringField;
    ClientDataSet7ABBR_NAME: TStringField;
    ClientDataSet7Rkey: TAutoIncField;
    ClientDataSet7D015_ptr: TIntegerField;
    ClientDataSet7D840_ptr: TIntegerField;
    TabSheet8: TTabSheet;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    ADOQuery3DSDesigner8: TBCDField;
    DtRead: TADODataSet;
    ADOQuery7_2: TADOQuery;
    ClientDataSet7Shutdown: TFloatField;
    ClientDataSet7Service: TFloatField;
    ClientDataSet7Plan: TFloatField;
    PageControl2: TPageControl;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    Chart7_1: TChart;
    SpeedButton10: TSpeedButton;
    Chart7_2: TChart;
    SpeedButton11: TSpeedButton;
    Chart7_3: TChart;
    SpeedButton12: TSpeedButton;
    TabSheet13: TTabSheet;
    Chart7_4: TChart;
    SpeedButton13: TSpeedButton;
    Series8: TBarSeries;
    Series9: TBarSeries;
    Series10: TBarSeries;
    Series11: TBarSeries;
    ClientDataSet7Downtime: TFloatField;
    ClientDataSet7NotDowntime: TFloatField;
    TabSheet14: TTabSheet;
    TabSheet15: TTabSheet;
    Chart7_5: TChart;
    SpeedButton14: TSpeedButton;
    Chart7_6: TChart;
    SpeedButton15: TSpeedButton;
    Series12: TBarSeries;
    Series13: TBarSeries;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    Label13: TLabel;
    Edit4: TEdit;
    Panel38: TPanel;
    DBGridEh8: TDBGridEh;
    Panel39: TPanel;
    PageControl3: TPageControl;
    TabSheet16: TTabSheet;
    Chart8: TChart;
    SpeedButton16: TSpeedButton;
    TabSheet17: TTabSheet;
    Chart8_6: TChart;
    SpeedButton17: TSpeedButton;
    BarSeries2: TBarSeries;
    TabSheet18: TTabSheet;
    Chart8_1: TChart;
    SpeedButton18: TSpeedButton;
    TabSheet19: TTabSheet;
    Chart8_2: TChart;
    SpeedButton19: TSpeedButton;
    TabSheet20: TTabSheet;
    Chart8_3: TChart;
    SpeedButton20: TSpeedButton;
    TabSheet21: TTabSheet;
    Chart8_4: TChart;
    SpeedButton21: TSpeedButton;
    TabSheet22: TTabSheet;
    Chart8_5: TChart;
    SpeedButton22: TSpeedButton;
    DataSetProvider8: TDataSetProvider;
    ClientDataSet8: TClientDataSet;
    DataSource8: TDataSource;
    ADOQuery8_2: TADOQuery;
    DBGridEh8_1: TDBGridEh;
    ClientDataSet8Location: TStringField;
    ClientDataSet8ABBR_NAME: TStringField;
    ClientDataSet8Rkey: TAutoIncField;
    ClientDataSet8D015_ptr: TIntegerField;
    ClientDataSet8D851_ptr: TIntegerField;
    ClientDataSet8D840_ptr: TIntegerField;
    ClientDataSet8H: TIntegerField;
    ClientDataSet8D: TIntegerField;
    ClientDataSet8TS: TIntegerField;
    ClientDataSet8Plan: TFloatField;
    ClientDataSet8Shutdown: TFloatField;
    ClientDataSet8Service: TFloatField;
    ClientDataSet8Downtime: TFloatField;
    ClientDataSet8NotDowntime: TFloatField;
    Series14: TBarSeries;
    Series15: TBarSeries;
    Series16: TBarSeries;
    Series17: TBarSeries;
    Series18: TBarSeries;
    Series19: TBarSeries;
    PopupMenu3: TPopupMenu;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    TabSheet9: TTabSheet;
    Panel40: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    Label14: TLabel;
    Edit5: TEdit;
    DBGridEh9_1: TDBGridEh;
    Panel43: TPanel;
    DBGridEh9: TDBGridEh;
    Panel44: TPanel;
    Chart9: TChart;
    SpeedButton23: TSpeedButton;
    ADOQuery9: TADOQuery;
    ADOQuery9_1: TADOQuery;
    DataSetProvider9: TDataSetProvider;
    ClientDataSet9: TClientDataSet;
    DataSource9: TDataSource;
    DataSetProvider9_1: TDataSetProvider;
    DataSource9_1: TDataSource;
    ADOQuery9Rkey: TAutoIncField;
    ADOQuery9Years: TIntegerField;
    ADOQuery9Month: TWordField;
    ADOQuery9ManuNumb: TIntegerField;
    ADOQuery9Producti: TBCDField;
    ADOQuery9OutpValu: TBCDField;
    ClientDataSet9Rkey: TAutoIncField;
    ClientDataSet9Years: TIntegerField;
    ClientDataSet9Month: TSmallintField;
    ClientDataSet9ManuNumb: TIntegerField;
    ClientDataSet9Producti: TBCDField;
    ClientDataSet9OutpValu: TBCDField;
    ADOQuery9_1Rkey: TAutoIncField;
    ADOQuery9_1D856_ptr: TIntegerField;
    ADOQuery9_1D840_ptr: TIntegerField;
    ADOQuery9_1NumbDevi: TBCDField;
    ADOQuery9_1Separati: TBCDField;
    ADOQuery9_1TotaHour: TBCDField;
    ADOQuery9_1StafResiTarg: TBCDField;
    ADOQuery9_1ManaDeviTarg: TBCDField;
    ADOQuery9_1VacaDaysActu: TBCDField;
    ADOQuery9_1VacaDaysTarg: TBCDField;
    ClientDataSet9AverYiel: TBCDField;
    ClientDataSet9Aver_GDP: TBCDField;
    ClientDataSet9HourWork: TBCDField;
    ClientDataSet9ManuPropNumb: TBCDField;
    ADOQuery9_1Location: TStringField;
    ADOQuery9DeviNumb: TIntegerField;
    ClientDataSet9DeviNumb: TIntegerField;
    ADOQuery9DeviWork: TIntegerField;
    ClientDataSet9DeviWork: TIntegerField;
    PopupMenu9_1: TPopupMenu;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    ADOQuery9_1ManaDeviQTY: TIntegerField;
    PopupMenu9: TPopupMenu;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    ADOQuery9_3: TADOQuery;
    dtReadRkey: TADODataSet;
    ClientDataSet9_1: TClientDataSet;
    ClientDataSet9_1Location: TStringField;
    ClientDataSet9_1Rkey: TAutoIncField;
    ClientDataSet9_1D856_ptr: TIntegerField;
    ClientDataSet9_1D840_ptr: TIntegerField;
    ClientDataSet9_1NumbDevi: TBCDField;
    ClientDataSet9_1Separati: TBCDField;
    ClientDataSet9_1TotaHour: TBCDField;
    ClientDataSet9_1StafResiTarg: TBCDField;
    ClientDataSet9_1ManaDeviTarg: TBCDField;
    ClientDataSet9_1VacaDaysTarg: TBCDField;
    ClientDataSet9_1ManaDeviQTY: TIntegerField;
    ClientDataSet9_1StafResiActu: TFloatField;
    ClientDataSet9_1ManaDeviActu: TFloatField;
    ClientDataSet9_1VacaDaysActu: TBCDField;
    Series6: TBarSeries;
    ADOQuery9WorkDays: TBCDField;
    ClientDataSet9WorkDays: TBCDField;
    ClientDataSet9_1HourWork: TFloatField;
    ADOQuery9_1WorkDays: TBCDField;
    ClientDataSet9_1WorkDays: TBCDField;
    ADODataSet7: TADODataSet;
    ADODataSet7Location: TStringField;
    ADODataSet7ABBR_NAME: TStringField;
    ClientDataSet7D851_ptr: TIntegerField;
    ClientDataSet7H: TIntegerField;
    ClientDataSet7D: TIntegerField;
    ClientDataSet7TS: TIntegerField;
    ClientDataSet7ScrappedTarget: TFloatField;
    ClientDataSet7Shutdown_D: TFloatField;
    ClientDataSet7ShutdownTarget: TFloatField;
    ClientDataSet7Service_D: TFloatField;
    ClientDataSet7ServiceTarget: TFloatField;
    ClientDataSet7Plan_D: TFloatField;
    ClientDataSet7mainStanTime: TFloatField;
    ClientDataSet7PlanTarget: TFloatField;
    ClientDataSet7Outflow: TFloatField;
    ClientDataSet7OutflowTarget: TFloatField;
    ClientDataSet7Downtime_D: TFloatField;
    ClientDataSet7DowntimeTarget: TFloatField;
    ClientDataSet7NotDowntime_D: TFloatField;
    ClientDataSet7NotDowntimeTarget: TFloatField;
    ADODataSet7Rkey: TAutoIncField;
    ADODataSet7D015_ptr: TIntegerField;
    ADODataSet7D851_ptr: TIntegerField;
    ADODataSet7D840_ptr: TIntegerField;
    ADODataSet7H: TIntegerField;
    ADODataSet7D: TIntegerField;
    ADODataSet7TS: TIntegerField;
    ADODataSet7Shutdown_D: TFloatField;
    ADODataSet7ShutdownTarget: TFloatField;
    ADODataSet7Service_D: TFloatField;
    ADODataSet7ServiceTarget: TFloatField;
    ADODataSet7ScrappedTarget: TFloatField;
    ADODataSet7Plan_D: TFloatField;
    ADODataSet7mainStanTime: TFloatField;
    ADODataSet7PlanTarget: TFloatField;
    ADODataSet7Outflow: TFloatField;
    ADODataSet7OutflowTarget: TFloatField;
    ADODataSet7Downtime_D: TFloatField;
    ADODataSet7DowntimeTarget: TFloatField;
    ADODataSet7NotDowntime_D: TFloatField;
    ADODataSet7NotDowntimeTarget: TFloatField;
    ADODataSet8: TADODataSet;
    ADODataSet8Location: TStringField;
    ADODataSet8ABBR_NAME: TStringField;
    ADODataSet8Rkey: TAutoIncField;
    ADODataSet8D015_ptr: TIntegerField;
    ADODataSet8D851_ptr: TIntegerField;
    ADODataSet8D840_ptr: TIntegerField;
    ADODataSet8H: TIntegerField;
    ADODataSet8D: TIntegerField;
    ADODataSet8TS: TIntegerField;
    ADODataSet8Downtime_D: TFloatField;
    ADODataSet8DowntimeTarget: TFloatField;
    ADODataSet8Shutdown_D: TFloatField;
    ADODataSet8ShutdownTarget: TFloatField;
    ADODataSet8NotDowntime_D: TFloatField;
    ADODataSet8NotDowntimeTarget: TFloatField;
    ADODataSet8Service_D: TFloatField;
    ADODataSet8ServiceTarget: TFloatField;
    ADODataSet8ScrappedTarget: TFloatField;
    ADODataSet8Plan_D: TFloatField;
    ADODataSet8mainStanTime: TFloatField;
    ADODataSet8PlanTarget: TFloatField;
    ADODataSet8Outflow: TFloatField;
    ADODataSet8OutflowTarget: TFloatField;
    ClientDataSet8mainStanTime: TFloatField;
    ClientDataSet8ShutdownTarget: TFloatField;
    ClientDataSet8ServiceTarget: TFloatField;
    ClientDataSet8ScrappedTarget: TFloatField;
    ClientDataSet8PlanTarget: TFloatField;
    ClientDataSet8Outflow: TFloatField;
    ClientDataSet8OutflowTarget: TFloatField;
    ClientDataSet8DowntimeTarget: TFloatField;
    ClientDataSet8NotDowntimeTarget: TFloatField;
    ClientDataSet8Shutdown_D: TFloatField;
    ClientDataSet8Service_D: TFloatField;
    ClientDataSet8Plan_D: TFloatField;
    ClientDataSet8Downtime_D: TFloatField;
    ClientDataSet8NotDowntime_D: TFloatField;
    ADODataSet7Scrapped: TFloatField;
    ClientDataSet7Scrapped: TFloatField;
    ADODataSet8Scrapped: TFloatField;
    ClientDataSet8Scrapped: TFloatField;
    ADOQuery9ABBR_NAME: TStringField;
    ADOQuery9D015_ptr: TIntegerField;
    ClientDataSet9ABBR_NAME: TStringField;
    ClientDataSet9D015_ptr: TIntegerField;
    ADOQuery3Copy: TADOQuery;
    ADOQuery3_1: TADOQuery;
    ADOQuery2_1Copy: TADOQuery;
    ADOQuery5_1Copy: TADOQuery;
    ADOQuery7_2Copy: TADOQuery;
    ADOQuery8_2Copy: TADOQuery;
    ADOQuery4_CopyStringField1: TStringField;
    ADOQuery4_CopyStringField2: TStringField;
    ADOQuery4_CopyStringField3: TStringField;
    ADOQuery4_CopyBCDField1: TBCDField;
    ADOQuery4_CopyBCDField2: TBCDField;
    ADOQuery4_Copy: TADOQuery;
    ADOQuery4DSDesigner4: TIntegerField;
    ADOQuery4DSDesigner5: TBCDField;
    ADOQuery9_2_copy: TADOQuery;
    ADOQuery9_3_copy: TADOQuery;
    ADOQuery9_2: TADOQuery;
    TabSheet_10: TTabSheet;
    Panel45: TPanel;
    Panel46: TPanel;
    DBGridEh10_1: TDBGridEh;
    Panel47: TPanel;
    Label15: TLabel;
    Edit6: TEdit;
    Panel48: TPanel;
    DBGridEh10: TDBGridEh;
    DataSource10_1: TDataSource;
    ADOQuery10_1: TADOQuery;
    DataSetProvider10_1: TDataSetProvider;
    ClientDataSet10_1: TClientDataSet;
    ClientDataSet10_1Percentage: TFloatField;
    ClientDataSet10_1TimeCons: TBCDField;
    ClientDataSet10_1JobName: TStringField;
    Panel49: TPanel;
    Panel50: TPanel;
    ClientDataSet10: TClientDataSet;
    ClientDataSet10TimeCons: TBCDField;
    ClientDataSet10JobName: TStringField;
    ClientDataSet10Percentage: TFloatField;
    PageControl4: TPageControl;
    TabSheet23: TTabSheet;
    TabSheet24: TTabSheet;
    Chart3: TChart;
    SpeedButton24: TSpeedButton;
    Series20: TPieSeries;
    Chart6: TChart;
    SpeedButton9: TSpeedButton;
    Series21: TPieSeries;
    ADOQuery6DSDesigner2: TStringField;
    ADOQuery6DSDesigner23: TStringField;
    ADOQuery6DSDesigner24: TStringField;
    ADOQuery6DSDesigner25: TWideStringField;
    ADOQuery6DSDesigner26: TBCDField;
    SpeedButton25: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure PF3_cbxChange(Sender: TObject);
    procedure DBGridEh3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btOutClick(Sender: TObject);
    procedure ADOQuery1AfterClose(DataSet: TDataSet);
    procedure ADOQuery1AfterOpen(DataSet: TDataSet);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
    procedure ClientDataSet1_1LocationChange(Sender: TField);
    procedure ClientDataSet1_1BeforeScroll(DataSet: TDataSet);
    procedure ClientDataSet1_1AfterInsert(DataSet: TDataSet);
    procedure PageControl1Change(Sender: TObject);
    procedure ClientDataSet1_1BeforeInsert(DataSet: TDataSet);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ClientDataSet1_1AfterOpen(DataSet: TDataSet);
    procedure ClientDataSet1_1ABBR_NAMEChange(Sender: TField);
    procedure N_DeleteClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure btInsertClick(Sender: TObject);
    procedure btPostClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure N_NewClick(Sender: TObject);
    procedure N_saveClick(Sender: TObject);
    procedure N_cancelClick(Sender: TObject);
    procedure ClientDataSet1_1ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ADOQuery1AfterPost(DataSet: TDataSet);
    procedure DBGridEh1_1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ClientDataSet1_1AfterPost(DataSet: TDataSet);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PF2_cbxChange(Sender: TObject);
    procedure PF2_dteBeginChange(Sender: TObject);
    procedure PF2_dteEndChange(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure ADOQuery2AfterOpen(DataSet: TDataSet);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PF4_dteBeginChange(Sender: TObject);
    procedure PF4_dteEndChange(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBGridEh4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton7Click(Sender: TObject);
    procedure PF5_cbxChange(Sender: TObject);
    procedure PF5_dteBeginChange(Sender: TObject);
    procedure PF5_dteEndChange(Sender: TObject);
    procedure ADOQuery5AfterOpen(DataSet: TDataSet);
    procedure PF6_dteBeginChange(Sender: TObject);
    procedure PF6_dteEndChange(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure DBGridEh6TitleClick(Column: TColumnEh);
    procedure Edit2Change(Sender: TObject);
    procedure PF6_cbxChange(Sender: TObject);
    procedure DBGridEh6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ADOQuery6AfterScroll(DataSet: TDataSet);
    procedure ADOQuery6AfterOpen(DataSet: TDataSet);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure PF3_dteBeginChange(Sender: TObject);
    procedure PF3_dteEndChange(Sender: TObject);
    procedure ClientDataSet7AfterInsert(DataSet: TDataSet);
    procedure ClientDataSet7BeforeScroll(DataSet: TDataSet);
    procedure ClientDataSet7ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure ClientDataSet7ABBR_NAMEChange(Sender: TField);
    procedure ClientDataSet7LocationChange(Sender: TField);
    procedure DataSetProvider1_1AfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
    procedure ClientDataSet7CalcFields(DataSet: TDataSet);
    procedure DBGridEh3Enter(Sender: TObject);
    procedure DBGridEh1_1Enter(Sender: TObject);
    procedure DBGridEh6Enter(Sender: TObject);
    procedure DBGridEh2Enter(Sender: TObject);
    procedure DBGridEh5Enter(Sender: TObject);
    procedure DBGridEh4Enter(Sender: TObject);
    procedure DBGridEh7_1Enter(Sender: TObject);
    procedure ClientDataSet7AfterOpen(DataSet: TDataSet);
    procedure ClientDataSet8_1AfterInsert(DataSet: TDataSet);
    procedure ClientDataSet8_1AfterOpen(DataSet: TDataSet);
    procedure ClientDataSet8BeforeScroll(DataSet: TDataSet);
    procedure ClientDataSet8CalcFields(DataSet: TDataSet);
    procedure ClientDataSet8ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DBGridEh7_1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure ClientDataSet9AfterScroll(DataSet: TDataSet);
    procedure ClientDataSet9BeforeScroll(DataSet: TDataSet);
    procedure ClientDataSet9CalcFields(DataSet: TDataSet);
    procedure ClientDataSet9ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure ClientDataSet9ABBR_NAMEChange(Sender: TField);
    procedure ClientDataSet9_aaa1AfterInsert(DataSet: TDataSet);
    procedure ClientDataSet9_aaa1BeforeScroll(DataSet: TDataSet);
    procedure ClientDataSet9_aaa1LocationChange(Sender: TField);
    procedure ClientDataSet9BeforePost(DataSet: TDataSet);
    procedure DBGridEh9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure MenuItem9Click(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure ClientDataSet9_aaa1CalcFields(DataSet: TDataSet);
    procedure DataSetProvider9AfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure ClientDataSet9YearsChange(Sender: TField);
    procedure DataSetProvider9_1BeforeUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind; var Applied: Boolean);
    procedure DataSetProvider9_1AfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
    procedure ClientDataSet9_aaa1StafResiTargGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ClientDataSet9ManuPropNumbGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ClientDataSet9_aaa1StafResiActuGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ClientDataSet9_11AfterInsert(DataSet: TDataSet);
    procedure ClientDataSet9_11BeforeScroll(DataSet: TDataSet);
    procedure ClientDataSet9_11CalcFields(DataSet: TDataSet);
    procedure ClientDataSet9_11ReconcileError(
      DataSet: TCustomClientDataSet; E: EReconcileError;
      UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure ClientDataSet9_1AfterInsert(DataSet: TDataSet);
    procedure ClientDataSet9_1BeforeScroll(DataSet: TDataSet);
    procedure ClientDataSet9_1ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure ClientDataSet9_1CalcFields(DataSet: TDataSet);
    procedure ClientDataSet9_1StafResiActuGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ClientDataSet9_1StafResiTargGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ClientDataSet7DowntimeGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ClientDataSet7ServiceTargetGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ClientDataSet8ShutdownGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure DBGridEh9Enter(Sender: TObject);
    procedure ClientDataSet8AfterInsert(DataSet: TDataSet);
    procedure ClientDataSet8AfterOpen(DataSet: TDataSet);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure DataSetProvider7AfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
    procedure DataSetProvider8AfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
    procedure PF4_cbxChange(Sender: TObject);
    procedure ClientDataSet10_1AfterOpen(DataSet: TDataSet);
    procedure ClientDataSet10_1CalcFields(DataSet: TDataSet);
    procedure ClientDataSet10_1PercentageGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure ClientDataSet10AfterOpen(DataSet: TDataSet);
    procedure ClientDataSet9AfterOpen(DataSet: TDataSet);
    procedure SpeedButton25Click(Sender: TObject);
  private
    Data10Total:Real;
    preColumn:TColumnEh;
    F_SQLWhere3:string;
    cbx:TCheckBox;
    StateCancel:Boolean;
    ActiveGrid:TDBGridEh;
    procedure DataFilter ;
    procedure series3Add;
    procedure Series7Add();
    Function  SQLResultValue(ADOdt:TADODataSet;SQL:string):string;
  //  procedure OutputExcelStd(AForm:TForm;ADBGridEh:TDBGridEh);
    procedure OutputExcelStd(AForm:TForm;ADBGridEh:TDBGridEh;AFileName:string);
    procedure CheckBox5Click(Sender: TObject);
    procedure OutputExcel(DBGrid1:TDBGridEh;FileName:String;LabelName:string='');
     procedure ClientDataSet9Save;
    { Private declarations }
  public
    procedure DBGridEHColumnsButtonClick(Sender: TObject;var Handled: Boolean);
    function SaveBeforeCheck():Boolean  ;
    function SaveData():Boolean;
    procedure SetSeries1();
    procedure SetChart9();
    { Public declarations }
  end;

var
  frm_Main: Tfrm_Main;
  DropDown_Info:array of TDropDownInfo;
implementation

uses form_DM,common, SelectItemUnit, Statistics_unt;

{$R *.dfm}

procedure Tfrm_Main.SetChart9();
begin
  Series6.Clear;

  ClientDataSet9_1.First;
  while not ClientDataSet9_1.Eof do
  begin
  
    Series6.Add(ClientDataSet9_1StafResiActu.Value,
        ClientDataSet9_1Location.AsString+#13+ '实际'
        //+#13+ClientDataSet9_1StafResiActu.AsString
        ,clRed);  //成员流失率|实际
    Series6.Add(ClientDataSet9_1StafResiTarg.Value,
        ClientDataSet9_1Location.AsString+#13+'目标'
        //+#13+ClientDataSet9_1StafResiTarg.AsString
        ,clRed);  //成员流失率|目标
    Series6.Add(ClientDataSet9_1ManaDeviActu.Value,
        ClientDataSet9_1Location.AsString+#13+ '实际'
       // +#13+ClientDataSet9_1ManaDeviActu.AsString
        ,clRed);  //人均管理设备台数|实际
    Series6.Add(ClientDataSet9_1ManaDeviTarg.Value,
        ClientDataSet9_1Location.AsString+#13+'目标'
        //+#13+ClientDataSet9_1ManaDeviTarg.AsString
        ,clRed);  //人均管理设备台数|目标

     Series6.Add(ClientDataSet9_1VacaDaysActu.Value,
        ClientDataSet9_1Location.AsString+#13+ '实际'
       // +#13+ClientDataSet9_1VacaDaysActu.AsString
       ,clRed);  //人均休假天数|实际
    Series6.Add(ClientDataSet9_1VacaDaysTarg.Value,
        ClientDataSet9_1Location.AsString+#13+'目标'
        //+#13+ClientDataSet9_1VacaDaysTarg.AsString
        ,clRed);  //人均休假天数|目标
      ClientDataSet9_1.Next;
  end;
end;

Function  Tfrm_Main.SQLResultValue(ADOdt:TADODataSet;SQL:string):string;
begin
  Result:='';
  with ADOdt do
  begin
    Close;
    CommandText:=SQL;
    Open;
    if FieldList[0].IsNull  then
      Result:=''
    else
      Result:=FieldList[0].Value;
  end;
end;

procedure Tfrm_Main.FormShow(Sender: TObject);

begin
  preColumn:=DBGridEh6.Columns[1];
  Label10.Caption:=preColumn.Title.Caption;
end;

procedure Tfrm_Main.FormCreate(Sender: TObject);
var
  i,j,i_top:Integer   ;
begin
   if not App_init_2(dm.ADOConnection1) then
  begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
    exit;
  end;
  self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd' ;{}

{  user_ptr:='2995';
  rkey73:='2522' ;
  dm.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  //dm.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security Info=True;User ID=WZPCBConnect;Initial Catalog=wisdompcb_rb;Data Source=172.18.9.9';
  //dm.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security Info=True;User ID=WZPCBConnect;Initial Catalog=wisdompcb;Data Source=172.18.0.8';
  //'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security Info=True;User ID=WZPCBConnect;Initial Catalog=wisdompcb;Data Source=172.17.0.187;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=X001;Use Encryption for Data=False;Tag with column collation when possible=False';
  dm.ADOConnection1.Open;
  vprev:='2';}
  
  ADOQuery1.Open;
  PageControl1.ActivePageIndex:=0;

  if StrToInt(vprev)  in [2,4]then
  begin
    DBGridEh1   .ReadOnly:=False;
    DBGridEh1_1 .ReadOnly:=False;
    DBGridEh7   .ReadOnly:=False;
    DBGridEh7_1 .ReadOnly:=False;
    DBGridEh8   .ReadOnly:=False;
    DBGridEh8_1 .ReadOnly:=False;
    DBGridEh9   .ReadOnly:=False;
    DBGridEh9_1 .ReadOnly:=False;
  end
  else
  begin
    DBGridEh1   .ReadOnly:=True;
    DBGridEh1_1 .ReadOnly:=True;
    DBGridEh7   .ReadOnly:=True;
    DBGridEh7_1 .ReadOnly:=True;
    DBGridEh8   .ReadOnly:=True;
    DBGridEh8_1 .ReadOnly:=True;
    DBGridEh9   .ReadOnly:=True;
    DBGridEh9_1 .ReadOnly:=True;
  end;

  with  qry0015 do
  begin
    Open;
    First;
    while not Eof do
    begin
      PF2_cbx.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
      PF3_cbx.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
      PF4_cbx.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
      PF5_cbx.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
      PF6_cbx.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
      Next;
    end;
    PF2_cbx.Items.AddObject('全部',TObject(0));
    PF2_cbx.ItemIndex:= PF2_cbx.Items.Count-1;
    PF3_cbx.Items.AddObject('全部',TObject(0));
    PF3_cbx.ItemIndex:= PF3_cbx.Items.Count-1;
    PF4_cbx.Items.AddObject('全部',TObject(0));
    PF4_cbx.ItemIndex:= PF4_cbx.Items.Count-1;
    PF5_cbx.Items.AddObject('全部',TObject(0));
    PF5_cbx.ItemIndex:= PF5_cbx.Items.Count-1;
    PF6_cbx.Items.AddObject('全部',TObject(0));
    PF6_cbx.ItemIndex:= PF6_cbx.Items.Count-1;
  end;

  for i:=0 to  Panel6.ControlCount-1 do
  begin
    Panel6.Controls[0].free;
  end;

  with qry_0840 do
  try
    if Active=False then
    Open;
    First;
    DisableControls;
    i_top:=0;
    i:=0;
    while not Eof do
    begin
      i:=i+1;
      begin
        cbx:=TCheckBox.Create(Panel6);
        cbx.Parent:=Panel6;
        cbx.Caption := Fields[1].AsString;//'lbl'+IntToStr(i);
        if i>9 then
          begin
          cbx.Left := 130;
          if i=10 then
          i_top:=0;
          cbx.Top := 2+i_top;
          cbx.Height := 17;
          cbx.Width :=120 ;
          i_top:=i_top+19;
          cbx.Tag:=i;
          end
        else
          begin
          cbx.Left := 2;
          cbx.Top := 2+i_top;
          cbx.Height := 17;
          cbx.Width :=120 ;
          i_top:=i_top+19;
          cbx.Tag:=i;
          end;
       // cbx.Name:=
        cbx.Visible:=true;
        cbx.Checked:=True;
        cbx.OnClick := CheckBox1Click;
      end;
      Next;
    end;
    First;
    i_top:=0;
    i:=0;
    while not Eof do
    begin
      i:=i+1;
      begin
        cbx:=TCheckBox.Create(Panel16);
        cbx.Parent:=Panel16;
        cbx.Caption := Fields[1].AsString;//'lbl'+IntToStr(i);
        if i>9 then
          begin
          cbx.Left := 130;
          if i=10 then
          i_top:=0;
          cbx.Top := 2+i_top;
          cbx.Height := 17;
          cbx.Width :=120 ;
          i_top:=i_top+19;
          cbx.Tag:=i;
          end
        else
          begin
          cbx.Left := 2;
          cbx.Top := 2+i_top;
          cbx.Height := 17;
          cbx.Width :=120 ;
          i_top:=i_top+19;
          cbx.Tag:=i;
          end;
        cbx.Visible:=true;
        cbx.Checked:=True;
        cbx.OnClick := CheckBox2Click;
      end;
      Next;
    end;

    First;
    i_top:=0;
    i:=0;
    while not Eof do
    begin
      i:=i+1;
      begin
        cbx:=TCheckBox.Create(Panel26);
        cbx.Parent:=Panel26;
        cbx.Caption := Fields[1].AsString;//'lbl'+IntToStr(i);
        if i>9 then
          begin
          cbx.Left := 130;
          if i=10 then
          i_top:=0;
          cbx.Top := 2+i_top;
          cbx.Height := 17;
          cbx.Width :=120 ;
          i_top:=i_top+19;
          cbx.Tag:=i;
          end
        else
          begin
          cbx.Left := 2;
          cbx.Top := 2+i_top;
          cbx.Height := 17;
          cbx.Width :=120 ;
          i_top:=i_top+19;
          cbx.Tag:=i;
          end;
        cbx.Visible:=true;
        cbx.Checked:=True;
        cbx.OnClick := CheckBox5Click;
      end;
      Next;
    end;    
  finally
    EnableControls;
  end;

  SetLength(DropDown_Info,2);
  DropDown_Info[0]:=TDropDownInfo.Create();
  DropDown_Info[1]:=TDropDownInfo.Create();
  with DropDown_Info[0] do
  begin
    L_GridName              :=DBGridEh1_1; // DBGridEh1_1
    L_ListDataSetName       :=qry_0840;
    L_DropdownColumn        :='Location';
    L_ListDataSetFilterField:='Location';
    L_ListResultField       :='Location';
    L_GetValueField         :='Location';
  end;
 with DropDown_Info[1] do
  begin
    L_GridName              :=DBGridEh9; //  DBGridEh1_1
    L_ListDataSetName       :=qry0015;
    L_DropdownColumn        :='ABBR_NAME';
    L_ListDataSetFilterField:='ABBR_NAME';
    L_ListResultField       :='ABBR_NAME';
    L_GetValueField         :='ABBR_NAME';
  end;

 {  with DropDown_Info[2] do
  begin
    L_GridName              :=DBGridEh7_1;
    L_ListDataSetName       :=qry0015;
    L_DropdownColumn        :='ABBR_NAME';
    L_ListDataSetFilterField:='ABBR_NAME';
    L_ListResultField       :='ABBR_NAME';
    L_GetValueField         :='ABBR_NAME';
  end;
  with DropDown_Info[3] do
  begin
    L_GridName              :=DBGridEh7_1;
    L_ListDataSetName       :=qry_0840;
    L_DropdownColumn        :='Location';
    L_ListDataSetFilterField:='Location';
    L_ListResultField       :='Location';
    L_GetValueField         :='Location';
  end;  }
//  with DropDown_Info[4] do
//  begin
//    L_GridName              :=DBGridEh9;
//    L_ListDataSetName       :=qry0015;
//    L_DropdownColumn        :='ABBR_NAME';
//    L_ListDataSetFilterField:='ABBR_NAME';
//    L_ListResultField       :='ABBR_NAME';
//    L_GetValueField         :='ABBR_NAME';
//  end;
//  with DropDown_Info[4] do
//  begin
//    L_GridName              :=DBGridEh9_1    ;
//    L_ListDataSetName       :=qry_0840;
//    L_DropdownColumn        :='Location';
//    L_ListDataSetFilterField:='Location';
//    L_ListResultField       :='Location';
//    L_GetValueField         :='Location';
//  end;
  for i:=0 to High(DropDown_Info) do
  begin
    with (DropDown_Info[i].L_GridName) do
    begin
      if DropDown_Info[i].L_ListDataSetName<>nil then
      begin
        FieldColumns[DropDown_Info[i].L_DropdownColumn].ButtonStyle:=cbsDropDown;
        FieldColumns[DropDown_Info[i].L_DropdownColumn].AlwaysShowEditButton:=true;
        if DropDown_Info[i].L_ListDataSetName<>nil then
        FieldColumns[DropDown_Info[i].L_DropdownColumn].OnEditButtonClick:= DBGridEHColumnsButtonClick;
      end
      else
      begin
        for j:=0 to High(DropDown_Info[i].L_AddPickList) do             //表格添加下拉列表项
        begin
          FieldColumns[DropDown_Info[i].L_DropdownColumn].PickList.Add(DropDown_Info[i].L_AddPickList[j]);
        end;
      end;
    end;
  end;
  PageControl1Change(nil);
end;

procedure Tfrm_Main.DBGridEHColumnsButtonClick(Sender: TObject;var Handled: Boolean);  //
var
  i,I_DropDataSetCount:Integer;
  I_Left,I_Top,I_Width,X,H:Integer;
  Vpoint:   Tpoint;
  FieldsDisplayWidth:Integer;
begin
  FieldsDisplayWidth:=0;
  with ((Sender as TControl).Parent).Parent as TDBGridEh do
  begin
    if  DataSource.DataSet is TClientDataSet then
    if ((((Sender as TControl).Parent).Parent as TDBGridEh).DataSource.DataSet as TClientDataSet).ReadOnly then
    Exit;
    if  DataSource.DataSet is TCustomADODataSet then
    if (DataSource.DataSet as TCustomADODataSet).LockType=ltReadOnly then
    Exit;
    if ReadOnly then        //如果当前表格控件是只读，退出。
    Exit;
//    if SelectedField.ReadOnly then    //如果当前表格选择的字段是只读
//    Exit;
  end;

  with ((Sender as TControl).Parent).Parent as TDBGridEh do  //Button的父是EDIT，EDIT的父才是DBGRIDEH控件
  begin
    try
      begin
        for i:=0 to High( DropDown_Info) do
        begin
         // ShowMessage(Name);
          if DropDown_Info[i].L_GridName<>nil then
          if Name= DropDown_Info[i].L_GridName.Name then  //当前正在下拉表格的名子= 遍历DropDown_Info中的表格名
          if UpperCase(DropDown_Info[i].L_DropdownColumn)=UpperCase(SelectedField.FieldName)  then
          with DropDown_Info[i] do
          begin
       //     ShowMessage(IntToStr(i)+':'+Name+':'+DropDown_Info[i].L_GridName.Name);
            Vpoint   := (Sender as TControl).Parent.ClientToScreen(Point((Sender as TControl).Left,(Sender as TControl).Top));
            I_Top:= Vpoint.y+(Sender as TControl).Height;
            if I_Top+250>Screen.Height-30 then
              I_Top:=Vpoint.y-250;
            if L_FormWidth=0 then
            begin
              for I_DropDataSetCount:=0 to L_ListDataSetName.FieldCount-1 do
              begin
                if  L_ListDataSetName.Fields[I_DropDataSetCount].Visible then
                FieldsDisplayWidth :=FieldsDisplayWidth+L_ListDataSetName.Fields[I_DropDataSetCount].DisplayWidth ;
              end;
              L_FormWidth:=(FieldsDisplayWidth*64 div 10)+35;   //  自动重新设置下拉窗口的显示宽度
            end;
            if L_FormWidth<330 then
              I_Width:=330     //不能小于330
            else
              I_Width:=L_FormWidth;
            if I_Width>700 then
              I_Width:=700;     //不能超过700

            if L_FormHeight  =0 then
              H:=240
            else
              H:=L_FormHeight;
            x:=Screen.Width- Vpoint.X-I_Width+ (Sender as TControl).Parent.Width;
            if x<0 then
              I_Left:=Screen.Width -I_Width//- (Sender as TControl).Parent.Width
            else
              I_Left:= Vpoint.X- (Sender as TControl).Parent.Width;

            if  (Screen.Height-I_Top)< h then   //屏幕的高度-控件按钮所在的高度  小于弹出窗口的高度
              I_Top:=Screen.Height-h;
            if L_ListDataSetName.Active=False then
              L_ListDataSetName.Open;                  //
            if L_FormType<=1 then
            begin
              if ShowAddListForm(Self,L_ListDataSetName,L_ListDataSetFilterField,
                        Trim(L_GridName.FieldColumns[L_DropdownColumn].Field.asstring),
                        I_Left,I_Top,I_Width) then   //
              begin
                if not (DropDown_Info[i].L_GridName.DataSource.DataSet.State in [dsEdit,dsInsert]) then
                  DropDown_Info[i].L_GridName.DataSource.DataSet.Edit;
                DropDown_Info[i].L_GridName.DataSource.DataSet.FieldByName(L_GetValueField).Value :=
                              DropDown_Info[i].L_ListDataSetName.FieldByName(L_ListResultField).value;
              end  ;
              if L_ListDataSetName.Filtered then
              L_ListDataSetName.Filtered :=False;

              Break;
            end;
          end;
        end;
      end;
    finally

    end;
  end;
end;

procedure Tfrm_Main.SpeedButton5Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    with  ADOQuery3 do
    begin
      Close;
      if F_SQLWhere3<>'' then
      ADOQuery3.SQL.Text:=ADOQuery3_1.SQL.Text+#13+ F_SQLWhere3;
      Parameters.ParamByName('SD').Value:=   StrToDateTime(DateToStr(PF3_dteBegin.Date)+' '+TimeToStr(PF3_dteBeginTime.Time));
      Parameters.ParamByName('ED').Value:=   StrToDateTime(DateToStr(PF3_dteEnd.Date)+' '+TimeToStr(PF3_dteEndTime.Time));
      Open;
    end;
    series3Add;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_Main.series3Add;
begin
    dbChart1.Title.Text.Text := '各项任务成本统计';
    series3.Clear;
    if   ADOQuery3.Active=False then
    ADOQuery3.Open;
    ADOQuery3.DisableControls;
    ADOQuery3.First;
    while not ADOQuery3.Eof do
    begin
      Series3.Add(ADOQuery3.Fields[2].Value,ADOQuery3.Fields[1].AsString+#13+ADOQuery3.Fields[2].DisplayLabel,clRed);
      ADOQuery3.Next;
    end;
    ADOQuery3.First;
    while not ADOQuery3.Eof do
    begin
      Series3.Add(ADOQuery3.Fields[3].Value,ADOQuery3.Fields[1].AsString+#13+ADOQuery3.Fields[3].DisplayLabel,clBackground);
      ADOQuery3.Next;
    end;
    ADOQuery3.First;
    while not ADOQuery3.Eof do
    begin
      Series3.Add(ADOQuery3.Fields[4].Value,ADOQuery3.Fields[1].AsString+#13+ADOQuery3.Fields[4].DisplayLabel,clTeal);
      ADOQuery3.Next;
    end;
    ADOQuery3.First;
    while not ADOQuery3.Eof do
    begin
      Series3.Add(ADOQuery3.Fields[5].Value,ADOQuery3.Fields[1].AsString+#13+ADOQuery3.Fields[5].DisplayLabel,clActiveCaption);
      ADOQuery3.Next;
    end;

    ADOQuery3.first;
    self.Series3.ValueFormat:='#,##0.00';
    ADOQuery3.EnableControls;
    dbchart1.LeftAxis.Title.Caption:='金额(本币含税)';
end;

procedure Tfrm_Main.PF3_cbxChange(Sender: TObject);
begin
  with  PF3_cbx do
  begin
    if  Text='全部' then
      F_SQLWhere3:=''
    else
      F_SQLWhere3:=#13+'where [工厂]='+QuotedStr(Text);
  end;
end;

procedure Tfrm_Main.DBGridEh3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text)
    else
    if  DataSet is TADODataSet then
       showmessage((DataSet as  TADODataSet).CommandText) ;
  end;
end;

procedure Tfrm_Main.CheckBox1Click(Sender: TObject);
var
  i:Integer;
  F_str:string;
begin
  F_str:='';
  begin
    for i:=0 to Panel6.ControlCount-1  do
    begin
      if   Panel6.Controls[i] is  TCheckBox then
      with Panel6.Controls[i] as  TCheckBox do
      begin
        if Checked then
        begin
          if F_str='' then
            F_str:=' 设备责任小组 ='+ QuotedStr(Trim(Caption))
          else
            F_str:=F_str+ ' or 设备责任小组 ='+ QuotedStr(Trim(Caption))   ;
        end;

      end;
    end;
  end;
  ADOQuery3.Filtered:=False;
  ADOQuery3.Filter:=  F_str;
  ADOQuery3.Filtered:=True;
  
end;

procedure Tfrm_Main.SpeedButton2Click(Sender: TObject);
begin
  ChartPreview(Self, DBChart1);
end;

procedure Tfrm_Main.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Main.btOutClick(Sender: TObject);
begin
  if  ActiveGrid=DBGridEh3 then
    OutputExcelStd(Self,ActiveGrid,PageControl1.ActivePage.Caption)
  else
  OutputExcel  (ActiveGrid,PageControl1.ActivePage.Caption)  ;
end;

procedure Tfrm_Main.OutputExcelStd(AForm:TForm;ADBGridEh:TDBGridEh;AFileName:string);
var
  ExpClass:TDBGridEhExportClass  ;
  Ext:String;
  FFileName:string;
  SaveDialog1:TSaveDialog;
begin
  SaveDialog1:=TSaveDialog.Create(AForm);
  SaveDialog1.Filter:='*.xls|*.xls|*.csv|*.csv|*.htm|*.htm|*.txt|*.txt';
  SaveDialog1.FileName := AFileName;//AForm.Caption;
 // if (ActiveControl is TDBGridEh) then
  if SaveDialog1.Execute then
  begin
    case SaveDialog1.FilterIndex of
      1: begin ExpClass := TDBGridEhExportAsXLS;  Ext := 'xls'; end;
      2: begin ExpClass := TDBGridEhExportAsCSV;  Ext := 'csv'; end;
      3: begin ExpClass := TDBGridEhExportAsHTML; Ext := 'htm'; end;
      4: begin ExpClass := TDBGridEhExportAsText; Ext := 'txt'; end;
    else
      ExpClass := nil; Ext := '';
    end;

    if ExpClass <> nil then
    begin
      if UpperCase(Copy(SaveDialog1.FileName,Length(SaveDialog1.FileName)-2,3)) <>
          UpperCase(Ext) then
        FFileName := SaveDialog1.FileName + '.' + Ext;
      if   FileExists(FFileName)   then
      if messagedlg('文件“'+FFileName+'”已经存在,你要覆盖吗?',mtconfirmation,[mbyes,mbno],0)=mrNo then
        Exit;
      try
        Screen.Cursor := crHourGlass;
        ADBGridEh.DataSource.DataSet.DisableControls;
        SaveDBGridEhToExportFile(ExpClass,ADBGridEh,FFileName,True);    //导出全部数据。
      finally
        ADBGridEh.DataSource.DataSet.EnableControls;
        Screen.Cursor := crDefault;
      end;
      
    //　SaveDBGridEhToExportFile(ExpClass,TDBGridEh(ActiveControl),pExpFile,False);  //导出选择数据
    end;

  end;
end;
procedure Tfrm_Main.ADOQuery1AfterClose(DataSet: TDataSet);
begin
  ClientDataSet1_1.Close;
end;

procedure Tfrm_Main.ADOQuery1AfterOpen(DataSet: TDataSet);
begin 
  ClientDataSet1_1.Params.ParamByName('vD851_ptr').Value:=ADOQuery1Rkey.Value;
  ClientDataSet1_1.Open;

  DataSet.Last;
end;

procedure Tfrm_Main.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
  if PageControl1.ActivePage=TabSheet1 then
  begin
    ClientDataSet1_1.Close;
    ClientDataSet1_1.Params.ParamByName('vD851_ptr').Value:=ADOQuery1Rkey.Value;
    ClientDataSet1_1.Open;
    SetSeries1;
  end;

  if PageControl1.ActivePage=TabSheet7 then
  begin
  ClientDataSet7.Close;
  ClientDataSet7.Params.ParamByName('vD851_ptr').Value:=ADOQuery1Rkey.Value;
  ClientDataSet7.Open;
  Series7Add;
  end;

  if PageControl1.ActivePage=TabSheet8 then
  begin
    ClientDataSet8.Close;
    ClientDataSet8.Params.ParamByName('vD851_ptr').Value:=ADOQuery1Rkey.Value;
    ClientDataSet8.Open;
  end;

  if PageControl1.ActivePage=TabSheet_10 then
  begin
    ClientDataSet10.Close;
    if  (ADOQuery1.fieldByName('Years').IsNull) and (ADOQuery1.fieldByName('Month').IsNull)  then
      ClientDataSet10.Params.ParamByName('sd').Value:=null
    else
      ClientDataSet10.Params.ParamByName('sd').Value:=
         StrToDate(ADOQuery1.fieldByName('Years').AsString+'-' +ADOQuery1.fieldByName('Month').AsString +'-1') ;//  8:00:00
    ClientDataSet10.Open;
  end;
end;

procedure Tfrm_Main.SetSeries1();
begin
  ClientDataSet1_1.First;
  Series1.Clear;
  while not ClientDataSet1_1.Eof do
  begin
      Series1.Add(ClientDataSet1_1sumA.Value, ClientDataSet1_1Location.Value+' '
          +ClientDataSet1_1sumA.DisplayLabel+' '+ ClientDataSet1_1sumA.AsString,clRed);
      Series1.Add(ClientDataSet1_1Target.Value, ClientDataSet1_1Location.Value+' '
          +ClientDataSet1_1Target.DisplayLabel+' '+ ClientDataSet1_1Target.AsString,clBlue);
      ClientDataSet1_1.Next;
  end;
end;

procedure Tfrm_Main.ClientDataSet1_1LocationChange(Sender: TField);
begin
  with qry_0840 do
  begin
    if Active=False then
    Open;

    if Filtered then
    Filtered:=False;

    with Sender.DataSet do
    if not(State in [dsEdit,dsInsert]) then
    Edit;

    if Sender.IsNull then
    begin
      ClientDataSet1_1.FieldByName('D840_ptr').Value:=null;
    end
    else
    begin
      if Locate('Location',Sender.Value,[loCaseInsensitive]) then
        begin
        ClientDataSet1_1D840_ptr.Value := FieldByName('rkey').Value ;
        end
      else
        begin
        ClientDataSet1_1.FieldByName('D840_ptr').Value:=null;
        ClientDataSet1_1.FieldByName('Location').Value:=null ;
        end;
    end;
  end;
end;

procedure Tfrm_Main.ClientDataSet1_1BeforeScroll(DataSet: TDataSet);
begin
    if SaveBeforeCheck then
      SaveData
    else
      Abort;
end;

function Tfrm_Main.SaveData():Boolean;
begin
  Result:=True;
  try
    Screen.Cursor := crHourGlass;
    if    (StateCancel=False) then
    begin
      if (ClientDataSet1_1.State in [dsEdit,dsInsert]) then   //
        ClientDataSet1_1.Post;
      if ClientDataSet1_1.ApplyUpdates(0)=0 then    //=0，即保存成功
      begin
        Result:=True;
      end
      else
      begin
        Result:=False;
      end;
    end;
  finally    
    Screen.Cursor := crDefault;
  end;
end;

function Tfrm_Main.SaveBeforeCheck():Boolean  ;
var
  strMsg:string;
begin
  Result:=True;
  with ClientDataSet1_1 do
  begin
    if State in [dsEdit ,dsInsert] then
    Post;
  end;
  if strMsg<>'' then
  begin
    ShowMessage(Copy(strMsg,0,Length(strMsg)-1));
    Result:=False;
  end;
end;

procedure Tfrm_Main.ClientDataSet1_1AfterInsert(DataSet: TDataSet);
begin
  ClientDataSet1_1D851_ptr.Value:=ADOQuery1rkey.Value;
end;

procedure Tfrm_Main.PageControl1Change(Sender: TObject);
var
  i:Integer;
  CurrentMonth:TDateTime;
begin
  SpeedButton25.Visible := False;
  CurrentMonth:=StrToDate(SQLResultValue(dm.dt_temp,
            'select cast(DATEPART(yy,getdate())as varchar(10))+''-''+cast(DATEPART(MM,getdate())as varchar(10))+''-''+''01'''));
  if   PageControl1.ActivePage=TabSheet1 then
  begin
    ClientDataSet1_1.Close;
    ClientDataSet1_1.Params.ParamByName('vD851_ptr').Value:=ADOQuery1Rkey.Value;
    ClientDataSet1_1.Open;

    Chart1.Title.Text.Text := '各组成本实际目标';
    SetSeries1;
    ActiveGrid:=DBGridEh1_1;
  end
  else
  begin
//    btPost.Visible:=False;
//    btCancel.Visible:=False;
    //btDelete.Visible:=False;
  end;

  if   PageControl1.ActivePage =TabSheet2 then
  begin
    if  ADOQuery2_1.Active=False then
    begin
      PF2_dteBegin.DateTime:= StrToDate(FormatDateTime('yyyy-MM-dd',CurrentMonth));
      PF2_dteEnd.DateTime:= StrToDate(FormatDateTime('yyyy-MM-dd',IncMonth(PF2_dteBegin.Date,1)));
      PF2_dteBegin.OnChange(nil);
      PF2_dteEnd.OnChange(nil);
      ADOQuery2_1.Open;
      DBGridEh2.SetFocus;
      ActiveGrid:=DBGridEh2;
    end;
    if  ADOQuery2.Active=False then
    begin
      ADOQuery2.SQL.Text:=ADOQuery2_1.Fields[0].AsString;
      ADOQuery2.Open;
      while not ADOQuery2.Eof do
      begin
        for i:=1 to ADOQuery2.FieldCount-1 do
        series2.Add(ADOQuery2.Fields[i].AsInteger  , ADOQuery2.Fields[0].Value+#13+ADOQuery2.Fields[i].DisplayLabel,clRed);
        ADOQuery2.Next;
      end;
    end;
  end
  else
  if   PageControl1.ActivePage =TabSheet3 then
  begin
    PF3_dteBegin.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',CurrentMonth));
    PF3_dteEnd  .Date     := StrToDate(FormatDateTime('yyyy-MM-dd',IncMonth(PF3_dteBegin.Date,1)));
    PF3_dteBeginChange(nil);
    PF3_dteEndChange (nil);
    if ADOQuery3.Active=False then
    ADOQuery3.Open;
    series3Add;
    ActiveGrid:=DBGridEh3;
  end
  else
  if   PageControl1.ActivePage =TabSheet4 then
  begin
    PF4_dteBegin.DateTime:= StrToDate(FormatDateTime('yyyy-MM-dd',CurrentMonth));
    PF4_dteEnd.DateTime:=StrToDate(FormatDateTime('yyyy-MM-dd',IncMonth(PF4_dteBegin.Date,1)));
    PF4_dteBeginChange(nil);
    PF4_dteEndChange (nil);

    if ADOQuery4.Active=False then
    ADOQuery4.Open;

    while not ADOQuery4.Eof do
    begin
     // for i:=2 to ADOQuery4.FieldCount-1 do
      series4.Add(ADOQuery4.Fields[3].AsInteger  , ADOQuery4.Fields[2].Value+#13+ADOQuery4.Fields[3].DisplayLabel,clRed);
      series4.Add(ADOQuery4.Fields[4].AsInteger  , ADOQuery4.Fields[2].Value+#13+ADOQuery4.Fields[4].DisplayLabel,clRed);
      //series2.Add(ClientDataSet1_1Target.Value, ClientDataSet1_1Location.Value + ClientDataSet1_1Target.AsString,clRed);
      ADOQuery4.Next;
    end;
    DBGridEh4.SetFocus;
  end
  else
  if   PageControl1.ActivePage=TabSheet5  then
  begin
    if  ADOQuery5_1.Active=False then
    begin
      PF5_dteBegin.DateTime:= StrToDate(FormatDateTime('yyyy-MM-dd',CurrentMonth));
      PF5_dteEnd.DateTime:= StrToDate(FormatDateTime('yyyy-MM-dd',IncMonth(PF5_dteBegin.Date,1)));
      PF5_dteBegin.OnChange(nil);
      PF5_dteEnd.OnChange(nil);
      ADOQuery5_1.Open;
    end;
    if  ADOQuery5.Active=False then
    begin
      ADOQuery5.SQL.Text:=ADOQuery5_1.Fields[0].AsString;
      ADOQuery5.Open;
      while not ADOQuery5.Eof do
      begin
        for i:=1 to ADOQuery5.FieldCount-1 do
        series5.Add(ADOQuery5.Fields[i].AsInteger  , ADOQuery5.Fields[0].Value+#13+ADOQuery5.Fields[i].DisplayLabel,clRed);
        ADOQuery5.Next;
      end;
    end;
    DBGridEh5.SetFocus;
  end
  else
  if   PageControl1.ActivePage=TabSheet6 then
  begin
    if  ADOQuery6.Active=False then
    begin
      PF6_dteBegin.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',CurrentMonth));
      PF6_dteEnd  .Date     := StrToDate(FormatDateTime('yyyy-MM-dd',IncMonth(PF6_dteBegin.Date,1)));
      PF6_dteBegin.OnChange(nil);
      PF6_dteEnd.OnChange(nil);
      ADOQuery6.Open;
    end;
    DBGridEh6.SetFocus;
  end
  else
  if   PageControl1.ActivePage=TabSheet7 then
  begin
   // if  ClientDataSet7.Active=False then
    begin
      ClientDataSet7.Close;
      ClientDataSet7.Params.ParamByName('vD851_ptr').Value:=ADOQuery1Rkey.Value;
      ClientDataSet7.Open;
      Series7Add;
     // Chart7.Title.Text.Text := '各组成本实际目标';

      ActiveGrid:=DBGridEh7;
    end;
    DBGridEh7.SetFocus;
  end
  else
  if   PageControl1.ActivePage=TabSheet8 then
  begin
   // if  ClientDataSet8.Active=False then
    begin
      ClientDataSet8.Close;
      ClientDataSet8.Params.ParamByName('vD851_ptr').Value:=ADOQuery1Rkey.Value;
      ClientDataSet8.Open;
    //  Series8Add;
     // Chart7.Title.Text.Text := '各组成本实际目标';

      ActiveGrid:=DBGridEh8;
    end;
    DBGridEh8.SetFocus;
  end
  else
  if   PageControl1.ActivePage=TabSheet9 then
  begin
    if  ClientDataSet9.Active=False then
    begin
      ClientDataSet9.Open;
      ActiveGrid:=DBGridEh9;
    end;
    SpeedButton25.Visible := True;
    DBGridEh9.SetFocus;
  end
  else
  if   PageControl1.ActivePage=TabSheet_10 then
  begin
    if  ClientDataSet10.Active=False then
    begin
      ClientDataSet10.Close;
      ClientDataSet10.Params.ParamByName('sd').Value:=
           StrToDate(ADOQuery1.fieldByName('Years').AsString+'-' +ADOQuery1.fieldByName('Month').AsString +'-1') ; //  8:00:00
      ClientDataSet10.Open;
   //   Series8Add;
     // Chart7.Title.Text.Text := '各组成本实际目标';

      ActiveGrid:=DBGridEh10_1;
    end;
    DBGridEh10_1.SetFocus;
  end     ;
end;

procedure Tfrm_Main.Series7Add();
begin
//  Series7.Clear;
//  ClientDataSet7.First;
//  while not ClientDataSet7.Eof do
//  begin
//    Series7.Add(ClientDataSet7Shutdown.Value  , ClientDataSet7Location.Value +#13+ ClientDataSet7Shutdown.AsString,clRed);
//    Series7.Add(ClientDataSet7ShutdownTarget.Value, ClientDataSet7Location.Value +#13+ ClientDataSet7ShutdownTarget.AsString,clRed);
//    Series7.Add(ClientDataSet7Service.Value  , ClientDataSet7Location.Value+#13 + ClientDataSet7Service.AsString,clRed);
//    Series7.Add(ClientDataSet7ServiceTarget.Value, ClientDataSet7Location.Value+#13 + ClientDataSet7ServiceTarget.AsString,clRed);
//    Series7.Add(ClientDataSet7Plan.Value  , ClientDataSet7Location.Value +#13+ ClientDataSet7Plan.AsString,clRed);
//    Series7.Add(ClientDataSet7PlanTarget.Value, ClientDataSet7Location.Value+#13 + ClientDataSet7PlanTarget.AsString,clRed);
//    ClientDataSet7.Next;
//  end;
end;

procedure Tfrm_Main.ClientDataSet1_1BeforeInsert(DataSet: TDataSet);
begin
  if ADOQuery1.State in[dsEdit, dsInsert]   then
  ADOQuery1.Post;
  if StrToInt(vprev)<>4 then
  Abort;
end;

procedure Tfrm_Main.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  with Sender as TEdit do
  if Key =#13 then
  begin
    if Text='' then
    begin
      ADOQuery1.Filtered:=False ;
    end
    else
    begin
      ADOQuery1.Filtered:=False ;
      ADOQuery1.Filter:='Years='+Text;
      ADOQuery1.Filtered:=True ;

    end;
  end;
end;

procedure Tfrm_Main.ClientDataSet1_1AfterOpen(DataSet: TDataSet);
//var
//  v_SD,v_ED:TDateTime;
//  str:string;
begin
 //暂时注释掉这个功能，因为可以在主表的保存事件中完成类似功能。
  {if  (ADOQuery1.IsEmpty=False )and (ClientDataSet1_1.IsEmpty=False)then
  if (ADOQuery1.State<>dsInsert) then
  begin
    v_SD:=  StrToDateTime(ADOQuery1.fieldByName('Years').AsString+'-' +ADOQuery1.fieldByName('Month').AsString +'-1 8:00:00') ;
    v_ED  :=  IncMonth( v_SD,1);
    //StrToDateTime(ADOQuery1.fieldByName('Years').AsString+'-' +inttostr((ADOQuery1.fieldByName('Month').asinteger+1)) +'-1 8:00:00');
    with ClientDataSet1_1 do
    begin
      First;
      while not Eof do
      begin
        if (ClientDataSet1_1sumA.IsNull)or(ClientDataSet1_1sumA.AsInteger=0) then
        begin
          if ADOQuery1.FieldByName('Years').AsInteger>= Yearof(Now) then
          if ADOQuery1.FieldByName('Month').AsInteger< Monthof(Now) then
          if DayOf(Now)>2 then
          begin
            ADOQuery1_1_1.Close;
            ADOQuery1_1_1.Parameters.ParamByName('SD').Value:=v_SD;
            ADOQuery1_1_1.Parameters.ParamByName('ED').Value:=v_ED;
            ADOQuery1_1_1.Parameters.ParamByName('Location_ptr').Value:=FieldByName('D840_ptr').Value;
            ADOQuery1_1_1.Parameters.ParamByName('warehouse_ptr').Value:=FieldByName('D015_ptr').Value ;
            ADOQuery1_1_1.Open;
            if ClientDataSet1_1.State <>dsEdit then
            Edit;
            FieldByName('sumA').Value:=ADOQuery1_1_1.Fields[0].Value;
            Post;
          end;
        end;
        Next;
      end;
      ApplyUpdates(0);
    end;
  end;   }
end;

procedure Tfrm_Main.ClientDataSet1_1ABBR_NAMEChange(Sender: TField);
begin
  with qry0015 do
  begin
    if Active=False then
    Open;

    if Filtered then
    Filtered:=False;

    with Sender.DataSet do
    if not(State in [dsEdit,dsInsert]) then
    Edit;

    if Sender.IsNull then
    begin
      ClientDataSet1_1.FieldByName('D015_ptr').Value:=null;
    end
    else
    begin
      if Locate('ABBR_NAME',Sender.Value,[loCaseInsensitive]) then
        begin
        ClientDataSet1_1D015_ptr.Value := FieldByName('rkey').Value ;
        end
      else
        begin
        ClientDataSet1_1.FieldByName('D015_ptr').Value:=null;
        ClientDataSet1_1.FieldByName('ABBR_NAME').Value:=null ;
        end;
    end;
  end;
end;

procedure Tfrm_Main.N_DeleteClick(Sender: TObject);
begin
  if ClientDataSet1_1.Active then
  if ClientDataSet1_1.IsEmpty=False then
  begin
    ClientDataSet1_1.Delete;
    ClientDataSet1_1.ApplyUpdates(0);
  end;
end;

procedure Tfrm_Main.MenuItem1Click(Sender: TObject);
begin
  if ClientDataSet7.Active=true then
  begin
    ClientDataSet7.Append;
  end;
end;

procedure Tfrm_Main.DataSource1StateChange(Sender: TObject);
begin
  if DataSource1.DataSet.State in [dsEdit,dsInsert] then
  begin
    btInsert.Enabled:=False;
    btPost.Enabled:=True;
    btCancel.Enabled:=True;
    btDelete.Enabled:=False;
  end
  else
  begin
    btInsert.Enabled:=True;
    btPost.Enabled:=False;
    btCancel.Enabled:=False;
    btDelete.Enabled:=True;
  end;
end;

procedure Tfrm_Main.btInsertClick(Sender: TObject);
begin
  if ADOQuery1 .Active then
  ADOQuery1.Append;
end;

procedure Tfrm_Main.btPostClick(Sender: TObject);
begin
  if ADOQuery1 .Active then
  ADOQuery1.Post;
end;

procedure Tfrm_Main.btCancelClick(Sender: TObject);
begin
  if ADOQuery1 .Active then
  ADOQuery1.Cancel;
end;

procedure Tfrm_Main.btDeleteClick(Sender: TObject);
begin
  if ADOQuery1 .Active then
  ADOQuery1.Delete;
end;

procedure Tfrm_Main.PopupMenu2Popup(Sender: TObject);
begin
  with  ClientDataSet1_1 do
  if Active then
  begin
    if (State in [dsEdit,dsInsert]) then
    begin
      N_New.Enabled:=False;
      N_Save.Enabled:=True;
      N_Cancel.Enabled:=True;
      N_delete.Enabled:=False;
    end
    else
    begin
      N_New.Enabled:=True;
      N_Save.Enabled:=False;
      N_Cancel.Enabled:=False;
      N_delete.Enabled:=True;
    end;
  end;
end;

procedure Tfrm_Main.N_NewClick(Sender: TObject);
begin
  if ClientDataSet1_1.Active=true then
  begin
    ClientDataSet1_1.Append;
  end;
end;

procedure Tfrm_Main.N_saveClick(Sender: TObject);
begin
  if ClientDataSet1_1.Active=true then
  if ClientDataSet1_1.State in [dsInsert ,dsedit] then
  begin
    ClientDataSet1_1.Post;
    ClientDataSet1_1.ApplyUpdates(0);
  end;
end;

procedure Tfrm_Main.N_cancelClick(Sender: TObject);
begin
  if ClientDataSet1_1.Active=true then
  if ClientDataSet1_1.State in [dsInsert ,dsedit] then
  begin
    StateCancel:=True;
    ClientDataSet1_1.Cancel;
    ClientDataSet1_1.CancelUpdates;
    StateCancel:=False;
  end;
end;

procedure Tfrm_Main.ClientDataSet1_1ReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  ShowMessage('保存失败，原因是：'+E.Message);
  //actCancelExecute(nil);
end;

procedure Tfrm_Main.SpeedButton3Click(Sender: TObject);
begin
ChartPreview(Self, Chart1);
end;

procedure Tfrm_Main.ADOQuery1AfterPost(DataSet: TDataSet);
var
  IsExists:Boolean;
begin
  if   (ADOQuery1.FieldByName('Years').IsNull=False )
   and (ADOQuery1.FieldByName('Month').IsNull=False )then
  begin
    if PageControl1.ActivePage=TabSheet1 then
    begin
      //以下为各组成本目标
      ADOQuery1_2.Close;
      ADOQuery1_2.Parameters.ParamByName('sd').Value:=
         StrToDateTime(ADOQuery1.fieldByName('Years').AsString+'-' +ADOQuery1.fieldByName('Month').AsString +'-1 8:00:00') ;
      ADOQuery1_2.Open;
      IsExists:=False;
      if  (ADOQuery1_2.IsEmpty=False )and  (ADOQuery1_2.Fields[0].IsNull =False) then
      while  not  ADOQuery1_2.Eof do
      begin
        ClientDataSet1_1.First;
        while  not  ClientDataSet1_1.Eof do
        begin
          if //(ClientDataSet1_1.FieldByName('D015_ptr').Value=ADOQuery1_2.FieldByName('warehouse_ptr').Value)and//不要删除，张兴旺2014-2-18号要求将“工厂”这个字段去掉，先保留，担心他哪一天又要求恢复
             (ClientDataSet1_1.FieldByName('D840_ptr').Value=ADOQuery1_2.FieldByName('D840_ptr').Value) then
          begin
            IsExists:=True;
            break;
          end;
          ClientDataSet1_1.Next;
        end;
        if  IsExists=False then
        begin
          ClientDataSet1_1.Append;
          //ClientDataSet1_1.FieldByName('D015_ptr').Value:=ADOQuery1_2.FieldByName('warehouse_ptr').Value; //不要删除，张兴旺2014-2-18号要求将“工厂”这个字段去掉，先保留，担心他哪一天又要求恢复
          //ClientDataSet1_1.FieldByName('ABBR_NAME').Value:=ADOQuery1_2.FieldByName('ABBR_NAME').Value;    //不要删除，张兴旺2014-2-18号要求将“工厂”这个字段去掉，先保留，担心他哪一天又要求恢复
          ClientDataSet1_1.FieldByName('D840_ptr').Value:=ADOQuery1_2.FieldByName('D840_ptr').Value;
          ClientDataSet1_1.FieldByName('Location').Value:=ADOQuery1_2.FieldByName('Location').Value;
        
          ClientDataSet1_1.FieldByName('sumA').Value:=ADOQuery1_2.FieldByName('A').Value;
          ClientDataSet1_1.Post;
        end;
        ADOQuery1_2.Next;
      end;
      if ClientDataSet1_1.ChangeCount>0 then
      ClientDataSet1_1.ApplyUpdates(0)  ;
    end;
    if PageControl1.ActivePage=TabSheet7 then
    begin
      //以下为设备目标值
      ADOQuery7_2.Close;
      ADOQuery7_2.Parameters.ParamByName('sd').Value:=
         StrToDateTime(ADOQuery1.fieldByName('Years').AsString+'-' +ADOQuery1.fieldByName('Month').AsString +'-1 8:00:00') ;
      ADOQuery7_2.Open;
      IsExists:=False;
      if  (ADOQuery7_2.IsEmpty=False )and  (ADOQuery7_2.Fields[0].IsNull =False) then
      while  not  ADOQuery7_2.Eof do
      begin
        ClientDataSet7.First;
        while  not  ClientDataSet7.Eof do
        begin
          if //(ClientDataSet7.FieldByName('D015_ptr').Value=ADOQuery7_2.FieldByName('WHOUSE_PTR').Value) and //不要删除，张兴旺2014-2-18号要求将“工厂”这个字段去掉，先保留，担心他哪一天又要求恢复
            (ClientDataSet7.FieldByName('D840_ptr').Value=ADOQuery7_2.FieldByName('rkey').Value) then
          begin
            IsExists:=True;
            break;
          end;
          ClientDataSet7.Next;
        end;
        if  IsExists=False then
        begin
          ClientDataSet7.Append;
         // ClientDataSet7.FieldByName('D015_ptr').Value:=ADOQuery7_2.FieldByName('WHOUSE_PTR').Value;  //不要删除，张兴旺2014-2-18号要求将“工厂”这个字段去掉，先保留，担心他哪一天又要求恢复
          ClientDataSet7.FieldByName('D840_ptr').Value:=ADOQuery7_2.FieldByName('rkey').Value;
          ClientDataSet7.FieldByName('Location').Value:=ADOQuery7_2.FieldByName('Location').Value;
         // ClientDataSet7.FieldByName('ABBR_NAME').Value:=ADOQuery7_2.FieldByName('ABBR_NAME').Value;   //不要删除，张兴旺2014-2-18号要求将“工厂”这个字段去掉，先保留，担心他哪一天又要求恢复
          ClientDataSet7.FieldByName('Shutdown_D').Value:=ADOQuery7_2.FieldByName('TD').Value;
          ClientDataSet7.FieldByName('Service_D').Value:=ADOQuery7_2.FieldByName('YX').Value;
          ClientDataSet7.FieldByName('Plan_D').Value:=ADOQuery7_2.FieldByName('SBBY').Value;
          ClientDataSet7.FieldByName('mainStanTime').Value:=ADOQuery7_2.FieldByName('StdTimeCons').Value;
          ClientDataSet7.FieldByName('TS').Value:=ADOQuery7_2.FieldByName('TS').Value;
          ClientDataSet7.FieldByName('Downtime_D').Value:=ADOQuery7_2.FieldByName('TJGZ').Value;
          ClientDataSet7.FieldByName('NotDowntime_D').Value:=ADOQuery7_2.FieldByName('FTJGZ').Value;
          ClientDataSet7.FieldByName('D').Value:=ADOQuery7_2.FieldByName('d').Value;
          ClientDataSet7.FieldByName('H').Value:=ADOQuery7_2.FieldByName('H').Value;
          ClientDataSet7.FieldByName('ShutdownTarget').Value:=ADOQuery7_2.FieldByName('ShutdownTarget').Value;
          ClientDataSet7.FieldByName('ServiceTarget').Value:=ADOQuery7_2.FieldByName('ServiceTarget').Value;
          ClientDataSet7.FieldByName('ScrappedTarget').Value:=ADOQuery7_2.FieldByName('ScrappedTarget').Value;
          ClientDataSet7.FieldByName('PlanTarget').Value:=ADOQuery7_2.FieldByName('PlanTarget').Value;
          ClientDataSet7.FieldByName('OutflowTarget').Value:=ADOQuery7_2.FieldByName('OutflowTarget').Value;
          ClientDataSet7.FieldByName('DowntimeTarget').Value:=ADOQuery7_2.FieldByName('DowntimeTarget').Value;
          ClientDataSet7.FieldByName('NotDowntimeTarget').Value:=ADOQuery7_2.FieldByName('NotDowntimeTarget').Value;
          ClientDataSet7.Post;
        end;
        ADOQuery7_2.Next;
      end;
      if ClientDataSet7.ChangeCount>0 then
      ClientDataSet7.ApplyUpdates(0)  ;
    end;

    if PageControl1.ActivePage=TabSheet8 then
    begin
      //以下为关键设备目标值
      ADOQuery8_2.Close;
      ADOQuery8_2.Parameters.ParamByName('sd').Value:=
         StrToDateTime(ADOQuery1.fieldByName('Years').AsString+'-' +ADOQuery1.fieldByName('Month').AsString +'-1 8:00:00') ;
      ADOQuery8_2.Open;
      IsExists:=False;
      if  (ADOQuery8_2.IsEmpty=False )and  (ADOQuery8_2.Fields[0].IsNull =False) then
      while  not  ADOQuery8_2.Eof do
      begin
        ClientDataSet8.First;
        while  not  ClientDataSet8.Eof do
        begin
          if //(ClientDataSet8.FieldByName('D015_ptr').Value=ADOQuery8_2.FieldByName('WHOUSE_PTR').Value)  and  //不要删除，张兴旺2014-2-18号要求将“工厂”这个字段去掉，先保留，担心他哪一天又要求恢复
            (ClientDataSet8.FieldByName('D840_ptr').Value=ADOQuery8_2.FieldByName('rkey').Value) then
          begin
            IsExists:=True;
            break;
          end;
          ClientDataSet8.Next;
        end;
        if  IsExists=False then
        begin
          ClientDataSet8.Append;
         // ClientDataSet8.FieldByName('D015_ptr').Value:=ADOQuery8_2.FieldByName('WHOUSE_PTR').Value;  //不要删除，张兴旺2014-2-18号要求将“工厂”这个字段去掉，先保留，担心他哪一天又要求恢复
         // ClientDataSet8.FieldByName('ABBR_NAME').Value:=ADOQuery8_2.FieldByName('ABBR_NAME').Value;  //不要删除，张兴旺2014-2-18号要求将“工厂”这个字段去掉，先保留，担心他哪一天又要求恢复
          ClientDataSet8.FieldByName('D840_ptr').Value:=ADOQuery8_2.FieldByName('rkey').Value;
          ClientDataSet8.FieldByName('Location').Value:=ADOQuery8_2.FieldByName('Location').Value;
        
          ClientDataSet8.FieldByName('Shutdown_D').Value:=ADOQuery8_2.FieldByName('TD').Value;
          ClientDataSet8.FieldByName('Service_D').Value:=ADOQuery8_2.FieldByName('YX').Value;
          ClientDataSet8.FieldByName('Plan_D').Value:=ADOQuery8_2.FieldByName('SBBY').Value;
          ClientDataSet8.FieldByName('mainStanTime').Value:=ADOQuery8_2.FieldByName('StdTimeCons').Value;
          ClientDataSet8.FieldByName('TS').Value:=ADOQuery8_2.FieldByName('TS').Value;
          ClientDataSet8.FieldByName('Downtime_D').Value:=ADOQuery8_2.FieldByName('TJGZ').Value;
          ClientDataSet8.FieldByName('NotDowntime_D').Value:=ADOQuery8_2.FieldByName('FTJGZ').Value;
          ClientDataSet8.FieldByName('D').Value:=ADOQuery8_2.FieldByName('d').Value;
          ClientDataSet8.FieldByName('H').Value:=ADOQuery8_2.FieldByName('H').Value;
          ClientDataSet8.FieldByName('ShutdownTarget').Value:=ADOQuery8_2.FieldByName('ShutdownTarget').Value;
          ClientDataSet8.FieldByName('ServiceTarget').Value:=ADOQuery8_2.FieldByName('ServiceTarget').Value;
          ClientDataSet8.FieldByName('ScrappedTarget').Value:=ADOQuery8_2.FieldByName('ScrappedTarget').Value;
          ClientDataSet8.FieldByName('PlanTarget').Value:=ADOQuery8_2.FieldByName('PlanTarget').Value;
          ClientDataSet8.FieldByName('OutflowTarget').Value:=ADOQuery8_2.FieldByName('OutflowTarget').Value;
          ClientDataSet8.FieldByName('DowntimeTarget').Value:=ADOQuery8_2.FieldByName('DowntimeTarget').Value;
          ClientDataSet8.FieldByName('NotDowntimeTarget').Value:=ADOQuery8_2.FieldByName('NotDowntimeTarget').Value;
          ClientDataSet8.Post;
        end;
        ADOQuery8_2.Next;
      end;
      if ClientDataSet8.ChangeCount>0 then
      ClientDataSet8.ApplyUpdates(0)  ;
    end;
  end;
end;

procedure Tfrm_Main.DBGridEh1_1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in[VK_INSERT,VK_delete] then   //  , VK_down
  begin
    Key:=0;
  end
  else
  with   (Sender as TDBGridEh ).DataSource.DataSet  do
  if (Key in[VK_down])and(RecNo=RecordCount ) then    //如果击向下键，且当前记录号等于总记录数
  begin
    Key:=0;
  end;
  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text)
    else
    if  DataSet is TClientDataSet then
       showmessage((DataSet as  TClientDataSet).CommandText) ;
  end;
  if Key in[VK_ESCAPE] then   //  , VK_down
  begin
    StateCancel:=True;
    ClientDataSet1_1.Cancel;
    ClientDataSet1_1.CancelUpdates;
    StateCancel:=False;
    Key:=0;
  end;

end;

procedure Tfrm_Main.ClientDataSet1_1AfterPost(DataSet: TDataSet);
var
  BM:Pointer;

begin
  BM:=ClientDataSet1_1.GetBookmark;
  SetSeries1     ;
        ClientDataSet1_1.GotoBookmark(BM);
        ClientDataSet1_1.FreeBookmark(BM);
end;

procedure Tfrm_Main.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text)
    else
    if  DataSet is TADODataSet then
       showmessage((DataSet as  TADODataSet).CommandText) ;
  end;
end;

procedure Tfrm_Main.PF2_cbxChange(Sender: TObject);
var
  i:Integer;
begin
  with  PF2_cbx do
  begin
    if  Text='全部' then
      ADOQuery2.Filtered:=False
    else
      begin
        ADOQuery2.Filtered:=False    ;
        ADOQuery2.Filter:= '工厂='+ QuotedStr(Text);
        ADOQuery2.Filtered:=True    ;
      //F_SQLWhere2:=#13+'where [工厂]='+QuotedStr(Text);
      end ;
  end;
  series2.Clear;
  while not ADOQuery2.Eof do
  begin
    for i:=2 to ADOQuery2.FieldCount-1 do
    if ADOQuery2.Fields[i].Visible=True then
    series2.Add(ADOQuery2.Fields[i].AsInteger  , ADOQuery2.Fields[1].Value+#13+ADOQuery2.Fields[i].DisplayLabel,clRed);
    //series2.Add(ClientDataSet1_1Target.Value, ClientDataSet1_1Location.Value + ClientDataSet1_1Target.AsString,clRed);
    ADOQuery2.Next;
  end;
end;

procedure Tfrm_Main.PF2_dteBeginChange(Sender: TObject);
begin
  ADOQuery2_1.Parameters.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(PF2_dteBegin.Date) + ' ' + TimeToStr(PF2_dteBeginTime.Time)))
end;

procedure Tfrm_Main.PF2_dteEndChange(Sender: TObject);
begin
  ADOQuery2_1.Parameters.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(PF2_dteEnd.Date) + ' ' + TimeToStr(PF2_dteEndTime.Time)))
end;

procedure Tfrm_Main.SpeedButton4Click(Sender: TObject);
var
  i:Integer;
begin
  ADOQuery2_1.Close;
  ADOQuery2_1.Open;

  ADOQuery2.Close;
  ADOQuery2.SQL.Text:=ADOQuery2_1.Fields[0].AsString;
  //ShowMessage(ADOQuery2_1.Fields[0].AsString);
  ADOQuery2.Open;

    series2.Clear;
    ADOQuery2.First;
      while not ADOQuery2.Eof do
      begin
        for i:=1 to ADOQuery2.FieldCount-1 do
        if ADOQuery2.Fields[i].Visible=True then
        series2.Add(ADOQuery2.Fields[i].AsInteger  , ADOQuery2.Fields[0].Value+#13+ADOQuery2.Fields[i].DisplayLabel,clRed);
        //series2.Add(ClientDataSet1_1Target.Value, ClientDataSet1_1Location.Value + ClientDataSet1_1Target.AsString,clRed);
        ADOQuery2.Next;
      end;
end;

procedure Tfrm_Main.CheckBox2Click(Sender: TObject);
var
  i:Integer;
begin
  if   (Sender as TCheckBox).Checked then
    begin
    ADOQuery2.FieldByName((Sender as TCheckBox).Caption).Visible:=True ;
 //   DBGridEh2.FieldColumns[(Sender as TCheckBox).Caption].Visible:=True ;
    end
  else
    begin
    ADOQuery2.FieldByName((Sender as TCheckBox).Caption).Visible:=False ;
//    DBGridEh2.FieldColumns[(Sender as TCheckBox).Caption].Visible:=False ;
    end ;

  series2.Clear;
  ADOQuery2.First;
  while not ADOQuery2.Eof do
  begin
    for i:=2 to ADOQuery2.FieldCount-1 do
    if ADOQuery2.Fields[i].Visible=True then
//    series2.Add(ADOQuery2.Fields[i].AsInteger  , ADOQuery2.Fields[1].Value,clRed);
    series2.Add(ADOQuery2.Fields[i].AsInteger  , ADOQuery2.Fields[1].AsString+#13+ADOQuery2.Fields[i].DisplayLabel,clRed);
    //series2.Add(ClientDataSet1_1Target.Value, ClientDataSet1_1Location.Value + ClientDataSet1_1Target.AsString,clRed);
    ADOQuery2.Next;
  end;
end;

procedure Tfrm_Main.CheckBox5Click(Sender: TObject);
var
  i:Integer;
begin
  if   (Sender as TCheckBox).Checked then
    begin
    ADOQuery5.FieldByName((Sender as TCheckBox).Caption).Visible:=True ;
 //   DBGridEh2.FieldColumns[(Sender as TCheckBox).Caption].Visible:=True ;
    end
  else
    begin
    ADOQuery5.FieldByName((Sender as TCheckBox).Caption).Visible:=False ;
//    DBGridEh2.FieldColumns[(Sender as TCheckBox).Caption].Visible:=False ;
    end ;

  series5.Clear;
  ADOQuery5.First;
  while not ADOQuery5.Eof do
  begin
    for i:=2 to ADOQuery5.FieldCount-1 do
    if ADOQuery5.Fields[i].Visible=True then
    series5.Add(ADOQuery5.Fields[i].AsInteger  , ADOQuery5.Fields[1].AsString+#13+ADOQuery5.Fields[i].DisplayLabel,clRed);
    //series2.Add(ClientDataSet1_1Target.Value, ClientDataSet1_1Location.Value + ClientDataSet1_1Target.AsString,clRed);
    ADOQuery5.Next;
  end;
end;

procedure Tfrm_Main.ADOQuery2AfterOpen(DataSet: TDataSet);
var
  i:Integer;
begin
  for i:=1 to ADOQuery2.FieldCount-1 do
  begin
    ADOQuery2.Fields[i].DisplayWidth:=10;
  end;
  
  for i:=0 to Panel16.ComponentCount-1 do
  begin
    if Panel16.Components[i] is TCheckBox then
    with Panel16.Components[i] as TCheckBox do
    begin
      if Checked=False then
      ADOQuery2.FieldByName(Caption).Visible:=False ;
    end;
  end;
end;

procedure Tfrm_Main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text)
    else
    if  DataSet is TADODataSet then
       showmessage((DataSet as  TADODataSet).CommandText) ;
  end;
end;

procedure Tfrm_Main.PF4_dteBeginChange(Sender: TObject);
begin
  ADOQuery4.Parameters.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(PF4_dteBegin.Date) + ' ' + TimeToStr(PF4_dteBeginTime.Time)))
end;

procedure Tfrm_Main.PF4_dteEndChange(Sender: TObject);
begin
  ADOQuery4.Parameters.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(PF4_dteEnd.Date) + ' ' + TimeToStr(PF4_dteEndTime.Time)))
end;

procedure Tfrm_Main.SpeedButton6Click(Sender: TObject);
begin
  ADOQuery4.Close;
  ADOQuery4.Open;

  series4.Clear;
  ADOQuery4.First;
  while not ADOQuery4.Eof do
  begin
   // for i:=2 to ADOQuery4.FieldCount-1 do
    series4.Add(ADOQuery4.Fields[3].AsInteger  , ADOQuery4.Fields[2].Value+#13+ADOQuery4.Fields[3].DisplayLabel,clRed);
    series4.Add(ADOQuery4.Fields[4].AsInteger  , ADOQuery4.Fields[2].Value+#13+ADOQuery4.Fields[4].DisplayLabel,clRed);
    //series2.Add(ClientDataSet1_1Target.Value, ClientDataSet1_1Location.Value + ClientDataSet1_1Target.AsString,clRed);
    ADOQuery4.Next;
  end;
end;

procedure Tfrm_Main.DBGridEh4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text)
    else
    if  DataSet is TADODataSet then
       showmessage((DataSet as  TADODataSet).CommandText) ;
  end;
end;

procedure Tfrm_Main.SpeedButton7Click(Sender: TObject);
var
  i:Integer;
begin

  ADOQuery5_1.Close;
  ADOQuery5_1.Open;
  series5.Clear;
  if ADOQuery5_1.Fields[0].IsNull =False then
  begin
    ADOQuery5.Close;
    ADOQuery5.SQL.Text:=ADOQuery5_1.Fields[0].AsString;
    ADOQuery5.Open;
   // ShowMessage(ADOQuery5_1.Fields[0].AsString);


    ADOQuery5.First;
    while not ADOQuery5.Eof do
    begin
      for i:=1 to ADOQuery5.FieldCount-1 do
      if ADOQuery5.Fields[i].Visible=True then
      series5.Add(ADOQuery5.Fields[i].AsInteger  , ADOQuery5.Fields[0].AsString+#13+ADOQuery5.Fields[i].DisplayLabel,clRed);
      //series2.Add(ClientDataSet1_1Target.Value, ClientDataSet1_1Location.Value + ClientDataSet1_1Target.AsString,clRed);
      ADOQuery5.Next;
    end;

  end;
end;

procedure Tfrm_Main.PF5_cbxChange(Sender: TObject);
var
  i:Integer;
begin
  with  PF5_cbx do
  begin
    if  Text='全部' then
      ADOQuery5.Filtered:=False
    else
    begin
      ADOQuery5.Filtered:=False    ;
      ADOQuery5.Filter:= '工厂='+ QuotedStr(Text);
      ADOQuery5.Filtered:=True    ;
    //F_SQLWhere2:=#13+'where [工厂]='+QuotedStr(Text);
    end ;
  end;
  series5.Clear;
  while not ADOQuery5.Eof do
  begin
    for i:=2 to ADOQuery5.FieldCount-1 do
    if ADOQuery5.Fields[i].Visible=True then
    series5.Add(ADOQuery2.Fields[i].AsInteger  , ADOQuery5.Fields[1].Value+#13+ADOQuery5.Fields[i].DisplayLabel,clRed);
    //series2.Add(ClientDataSet1_1Target.Value, ClientDataSet1_1Location.Value + ClientDataSet1_1Target.AsString,clRed);
    ADOQuery5.Next;
  end;

end;

procedure Tfrm_Main.PF5_dteBeginChange(Sender: TObject);
begin
  ADOQuery5_1.Parameters.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(PF5_dteBegin.Date) + ' ' + TimeToStr(PF5_dteBeginTime.Time)))
end;

procedure Tfrm_Main.PF5_dteEndChange(Sender: TObject);
begin
  ADOQuery5_1.Parameters.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(PF5_dteEnd.Date) + ' ' + TimeToStr(PF5_dteEndTime.Time)))
end;

procedure Tfrm_Main.ADOQuery5AfterOpen(DataSet: TDataSet);
var
  i:Integer;
begin
  for i:=1 to DataSet.FieldCount-1 do
  begin
    DataSet.Fields[i].DisplayWidth:=10;
  end;
  
  for i:=0 to Panel16.ComponentCount-1 do
  begin
    if Panel16.Components[i] is TCheckBox then
    with Panel16.Components[i] as TCheckBox do
    begin
      if Checked=False then
      DataSet.FieldByName(Caption).Visible:=False ;
    end;
  end;
end;

procedure Tfrm_Main.PF6_dteBeginChange(Sender: TObject);
begin
  ADOQuery6.Parameters.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(PF6_dteBegin.Date) + ' ' + TimeToStr(PF6_dteBeginTime.Time)))
end;

procedure Tfrm_Main.PF6_dteEndChange(Sender: TObject);
begin
  ADOQuery6.Parameters.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(PF6_dteEnd.Date) + ' ' + TimeToStr(PF6_dteEndTime.Time)))
end;

procedure Tfrm_Main.SpeedButton8Click(Sender: TObject);
begin
  ADOQuery6.Close;
  ADOQuery6.Open;
end;

procedure Tfrm_Main.DBGridEh6TitleClick(Column: TColumnEh);
begin
  with Column.Grid.DataSource.DataSet as TCustomADODataSet do
  begin
    if FieldByName(Column.FieldName).FieldKind in[ fkCalculated,fkLookup]  then  //
      exit ;
    if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
    begin
      column.Title.SortMarker:=smUpEh;
      Sort:=Column.FieldName;
    end
    else
    begin
      column.Title.SortMarker:=smDownEh;
      Sort:=Column.FieldName+' DESC';
    end;
  end;

  if Column.Tag<>1 then
  begin                                            //当前单击的列不能是布尔型
    if (preColumn.FieldName<>Column.FieldName)and (ADOQuery6.FieldByName(Column.FieldName).DataType in [ftString,ftWideString] )
    and (Column.FieldName<>'工厂')and(Column.FieldName<>'设备责任小组')then
    begin
      Label10.Caption:=Column.Title.Caption+':';
      preColumn.Title.Color:=clBtnFace;
      Column.Title.Color:=clRed;
      preColumn:=Column;
      Edit2.Text:='';
      Edit2.SetFocus;
    end;
  end;
end;

procedure Tfrm_Main.DataFilter ;
var
  str_Filter:string;
  r_Sum:Real;
begin
  str_Filter:='';
  r_Sum:=0;
  with  PF6_cbx do
  begin
    if  Text<>'全部' then
    begin
      str_Filter:= '工厂='+ QuotedStr(Text);
    end ;
  end;
  if Trim(edt_D840.Text)   <>'' then
  begin
    if str_Filter<>'' then
      str_Filter:=str_Filter+' and 设备责任小组 like ''%'+trim(edt_D840.Text)+'%'''
    else
      str_Filter:='设备责任小组 like ''%'+trim(edt_D840.Text)+'%'''
  end;
  if Trim(Edit2.Text)<>'' then
  begin
    if str_Filter<>'' then
      str_Filter:=str_Filter+' and '+preColumn.FieldName+' like ''%'+trim(Edit2.Text)+'%'''
    else
      str_Filter:=preColumn.FieldName+' like ''%'+trim(Edit2.Text)+'%'''
  end ;
  ADOQuery6.Filtered:=False;
  if    str_Filter<>'' then
  begin
  ADOQuery6.Filter:=   str_Filter;
  ADOQuery6.Filtered:=True    ;
  end;
  with  ADOQuery6  do
  begin
    try
      DisableControls;
      while not Eof do
      begin

        if (FieldByName('金额(本币含税)').IsNull=False ) then
        begin
          r_Sum:=r_Sum+FieldByName('金额(本币含税)').Value  ;
        end ;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;
  DBGridEh6.FieldColumns['金额(本币含税)'].Footers.Add;
  DBGridEh6.FieldColumns['金额(本币含税)'].Footers[0].ValueType := fvtStaticText;
  DBGridEh6.FieldColumns['金额(本币含税)'].Footers[0].Value     := formatfloat('0.##',r_Sum) ;
end;

procedure Tfrm_Main.Edit2Change(Sender: TObject);

begin
  DataFilter;
end;

procedure Tfrm_Main.PF6_cbxChange(Sender: TObject);
begin
  DataFilter;
end;

procedure Tfrm_Main.DBGridEh6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text)
    else
    if  DataSet is TADODataSet then
       showmessage((DataSet as  TADODataSet).CommandText) ;
  end;
end;

procedure Tfrm_Main.ADOQuery6AfterScroll(DataSet: TDataSet);
begin
  StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(DataSet.RecNo)+'/总记录数:'+ IntToStr(DataSet.RecordCount);
end;

procedure Tfrm_Main.ADOQuery6AfterOpen(DataSet: TDataSet);
var
  r_Sum:Real;
begin
  r_Sum:=0;
  with  ADOQuery6  do
  begin
    try
      DisableControls;
      while not Eof do
      begin

        if (FieldByName('金额(本币含税)').IsNull=False ) then
        begin
          r_Sum:=r_Sum+FieldByName('金额(本币含税)').Value  ;
        end ;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;
  DBGridEh6.FieldColumns['金额(本币含税)'].Footers.Add;
  DBGridEh6.FieldColumns['金额(本币含税)'].Footers[0].ValueType := fvtStaticText;
  DBGridEh6.FieldColumns['金额(本币含税)'].Footers[0].Value     := formatfloat('0.##',r_Sum) ;

  StatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(DataSet.RecNo)+'/总记录数:'+ IntToStr(DataSet.RecordCount);
//  StatusBar1.Panels[1].Text:='金额(本币含税):'+floattostr(r_Sum);
end;

procedure Tfrm_Main.MenuItem2Click(Sender: TObject);
begin
  if ClientDataSet7.Active=true then
  if ClientDataSet7.State in [dsInsert ,dsedit] then
  begin
    ClientDataSet7.Post;
    ClientDataSet7.ApplyUpdates(0);
  end;
end;

procedure Tfrm_Main.MenuItem3Click(Sender: TObject);
begin
  if ClientDataSet7.Active=true then
  begin
    StateCancel:=True;
    if ClientDataSet7.State in [dsInsert ,dsedit] then
    ClientDataSet7.Cancel;
    ClientDataSet7.CancelUpdates;
    StateCancel:=False;
  end;
end;

procedure Tfrm_Main.MenuItem4Click(Sender: TObject);
begin
  if ClientDataSet7.Active then
  if ClientDataSet7.IsEmpty=False then
  begin
    ClientDataSet7.Delete;
    ClientDataSet7.ApplyUpdates(0);
  end;
end;

procedure Tfrm_Main.PF3_dteBeginChange(Sender: TObject);
begin
  ADOQuery3.Parameters.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(PF3_dteBegin.Date) + ' ' + TimeToStr(PF3_dteBeginTime.Time)))
end;

procedure Tfrm_Main.PF3_dteEndChange(Sender: TObject);
begin
  ADOQuery3.Parameters.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(PF3_dteEnd.Date) + ' ' + TimeToStr(PF3_dteEndTime.Time)))
end;

procedure Tfrm_Main.ClientDataSet7AfterInsert(DataSet: TDataSet);
begin
  ClientDataSet7D851_ptr.Value:=ADOQuery1rkey.Value;
end;

procedure Tfrm_Main.ClientDataSet7BeforeScroll(DataSet: TDataSet);
begin
  ClientDataSet7.ApplyUpdates(0)
end;

procedure Tfrm_Main.ClientDataSet7ReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
ShowMessage('保存失败，原因是：'+E.Message);
end;

procedure Tfrm_Main.ClientDataSet7ABBR_NAMEChange(Sender: TField);
begin
  with qry0015 do
  begin
    if Active=False then
    Open;

    if Filtered then
    Filtered:=False;

    with Sender.DataSet do
    if not(State in [dsEdit,dsInsert]) then
    Edit;

    if Sender.IsNull then
    begin
      ClientDataSet7.FieldByName('D015_ptr').Value:=null;
    end
    else
    begin
      if Locate('ABBR_NAME',Sender.Value,[loCaseInsensitive]) then
        begin
        ClientDataSet7D015_ptr.Value := FieldByName('rkey').Value ;
        end
      else
        begin
        ClientDataSet7.FieldByName('D015_ptr').Value:=null;
        ClientDataSet7.FieldByName('ABBR_NAME').Value:=null ;
        end;
    end;
  end;
end;

procedure Tfrm_Main.ClientDataSet7LocationChange(Sender: TField);
begin
  with qry_0840 do
  begin
    if Active=False then
    Open;

    if Filtered then
    Filtered:=False;

    with Sender.DataSet do
    if not(State in [dsEdit,dsInsert]) then
    Edit;

    if Sender.IsNull then
    begin
      ClientDataSet7.FieldByName('D840_ptr').Value:=null;
    end
    else
    begin
      if Locate('Location',Sender.Value,[loCaseInsensitive]) then
        begin
        ClientDataSet7D840_ptr.Value := FieldByName('rkey').Value ;
        end
      else
        begin
        ClientDataSet7.FieldByName('D840_ptr').Value:=null;
        ClientDataSet7.FieldByName('Location').Value:=null ;
        end;
    end;
  end;
end;

procedure Tfrm_Main.DataSetProvider1_1AfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind);
begin
  if UpdateKind= ukInsert then      //这段代码的作用是客户端获取自动编号的值。
  begin
    with dtRead  do
    begin
     Close;
     CommandText:='select @@identity';
     Open;
     DeltaDS.FieldByName('rkey').ReadOnly:=False;
     DeltaDS.FieldByName('rkey').NewValue:=dtRead.Fields[0].Value;
     Close;
    end;
  end;
end;

procedure Tfrm_Main.ClientDataSet7CalcFields(DataSet: TDataSet);
begin
  with DataSet do
  begin
    IF   (FieldByName('Shutdown_D').IsNull =False)AND ( FieldByName('D').IsNull =False) and
    ( FieldByName('H').IsNull =False) and( FieldByName('TS').IsNull =False)
    then
      FieldByName('Shutdown').Value:=
             FormatFloat( '0.00000',FieldByName('Shutdown_D').AsCurrency/
             ( FieldByName('D').AsCurrency  *FieldByName('H').AsCurrency * FieldByName('TS').AsCurrency))
    else
      FieldByName('Shutdown').Value:=0;


    IF (FieldByName('Service_D').IsNull =False)AND(FieldByName('D').IsNull =False)
    and(FieldByName('H').IsNull =False)and(FieldByName('TS').IsNull =False)
    then
      FieldByName('Service').Value:=
               FormatFloat( '0.00000',   FieldByName('Service_D').AsFloat/
               ( FieldByName('D').AsFloat  *FieldByName('H').AsFloat*FieldByName('TS').AsFloat ))
    else
      FieldByName('Service').Value:=0;

    IF   (FieldByName('Plan_D').IsNull =False)AND ( FieldByName('mainStanTime').IsNull =False) and
         (FieldByName('Plan_D').AsInteger >0) AND ( FieldByName('mainStanTime').AsInteger >0) then
      FieldByName('Plan').Value:=
                FormatFloat( '0.00000',  FieldByName('Plan_D').AsFloat/ FieldByName('mainStanTime').AsFloat)
    else
      FieldByName('Plan').Value:=0;

    IF   (FieldByName('Downtime_D').IsNull =False)AND ( FieldByName('D').IsNull =False) and
    ( FieldByName('H').IsNull =False) and( FieldByName('TS').IsNull =False)
    then
    FieldByName('Downtime').Value:=
               FormatFloat( '0.00000',
                FieldByName('Downtime_D').AsFloat/( FieldByName('D').AsFloat  *FieldByName('H').AsFloat *FieldByName('TS').AsFloat))
    else
      FieldByName('Downtime').Value:=0;

    IF   (FieldByName('NotDowntime_D').IsNull =False)AND ( FieldByName('D').IsNull =False) and
    ( FieldByName('H').IsNull =False) and( FieldByName('TS').IsNull =False)
    then
    FieldByName('NotDowntime').Value:=
                FormatFloat( '0.00000',
                FieldByName('NotDowntime_D').AsFloat/( FieldByName('D').AsFloat  *FieldByName('H').AsFloat *FieldByName('TS').AsFloat) )
    else
      FieldByName('NotDowntime').Value:=0;
  end;
end;

procedure Tfrm_Main.DBGridEh3Enter(Sender: TObject);
begin
  ActiveGrid:=  Sender as TDBGridEh;
end;

procedure Tfrm_Main.DBGridEh1_1Enter(Sender: TObject);
begin
  ActiveGrid:=  Sender as TDBGridEh;
end;

procedure Tfrm_Main.DBGridEh6Enter(Sender: TObject);
begin
  ActiveGrid:=  Sender as TDBGridEh;
end;

procedure Tfrm_Main.DBGridEh2Enter(Sender: TObject);
begin
  ActiveGrid:=  Sender as TDBGridEh;
end;

procedure Tfrm_Main.DBGridEh5Enter(Sender: TObject);
begin
  ActiveGrid:=  Sender as TDBGridEh;
end;

procedure Tfrm_Main.DBGridEh4Enter(Sender: TObject);
begin
  ActiveGrid:=  Sender as TDBGridEh;
end;

procedure Tfrm_Main.DBGridEh7_1Enter(Sender: TObject);
begin
  ActiveGrid:=  Sender as TDBGridEh;
end;

procedure Tfrm_Main.ClientDataSet7AfterOpen(DataSet: TDataSet);
begin
  Series12.Clear;
  Series8.Clear;
  Series13.Clear;
  Series9.Clear;
  Series10.Clear;
  Series11.Clear;

  ClientDataSet7.First;
  while not ClientDataSet7.Eof do
  begin
    Series12.Add(ClientDataSet7Downtime.Value  , ClientDataSet7Location.Value +#13+'实际',clRed);
    Series12.Add(ClientDataSet7DowntimeTarget.Value, ClientDataSet7Location.Value+#13+'目标',clGreen);
    Series8.Add(ClientDataSet7Shutdown.Value  , ClientDataSet7Location.Value +#13+'实际',clRed);
    Series8.Add(ClientDataSet7ShutdownTarget.Value, ClientDataSet7Location.Value+#13+'目标',clGreen);
    Series13.Add(ClientDataSet7NotDowntime.Value  , ClientDataSet7Location.Value +#13+'实际',clRed);
    Series13.Add(ClientDataSet7NotDowntimeTarget.Value, ClientDataSet7Location.Value+#13+'目标',clGreen);
    Series9.Add(ClientDataSet7Service.Value  , ClientDataSet7Location.Value+#13+'实际',clRed);
    Series9.Add(ClientDataSet7ServiceTarget.Value, ClientDataSet7Location.Value+#13+'目标',clGreen);
    Series10.Add(ClientDataSet7Scrapped.Value  , ClientDataSet7Location.Value +#13+ ClientDataSet7Plan.AsString,clRed);
    Series10.Add(ClientDataSet7ScrappedTarget.Value, ClientDataSet7Location.Value+#13 + ClientDataSet7PlanTarget.AsString,clRed);
    Series11.Add(ClientDataSet7Plan.Value  , ClientDataSet7Location.Value +#13+'实际',clRed);
    Series11.Add(ClientDataSet7PlanTarget.Value, ClientDataSet7Location.Value+#13 +'目标' ,clGreen);
    ClientDataSet7.Next;
  end;

end;

procedure Tfrm_Main.ClientDataSet8_1AfterInsert(DataSet: TDataSet);
begin
ClientDataSet8D851_ptr.Value:=ADOQuery1rkey.Value;
end;

procedure Tfrm_Main.ClientDataSet8_1AfterOpen(DataSet: TDataSet);
begin
  Series14.Clear;
  Series15.Clear;
  Series16.Clear;
  Series17.Clear;
  Series18.Clear;
  Series19.Clear;

  ClientDataSet8.First;
  while not ClientDataSet8.Eof do
  begin
    Series14.Add(ClientDataSet8Downtime.Value  , ClientDataSet8Location.Value +#13+'实际',clRed);
    Series14.Add(ClientDataSet8DowntimeTarget.Value, ClientDataSet8Location.Value+#13+'目标',clGreen);
    Series15.Add(ClientDataSet8Shutdown.Value  , ClientDataSet8Location.Value +#13+'实际',clRed);
    Series15.Add(ClientDataSet8ShutdownTarget.Value, ClientDataSet8Location.Value+#13+'目标',clGreen);
    Series16.Add(ClientDataSet8NotDowntime.Value  , ClientDataSet8Location.Value +#13+'实际',clRed);
    Series16.Add(ClientDataSet8NotDowntimeTarget.Value, ClientDataSet8Location.Value+#13+'目标',clGreen);
    Series17.Add(ClientDataSet8Service.Value  , ClientDataSet8Location.Value+#13+'实际',clRed);
    Series17.Add(ClientDataSet8ServiceTarget.Value, ClientDataSet8Location.Value+#13+'目标',clGreen);
    Series18.Add(ClientDataSet8Scrapped.Value  , ClientDataSet8Location.Value +#13+ ClientDataSet8Plan.AsString,clRed);
    Series18.Add(ClientDataSet8ScrappedTarget.Value, ClientDataSet8Location.Value+#13 + ClientDataSet8PlanTarget.AsString,clRed);
    Series19.Add(ClientDataSet8Plan.Value  , ClientDataSet8Location.Value +#13+'实际',clRed);
    Series19.Add(ClientDataSet8PlanTarget.Value, ClientDataSet8Location.Value+#13 +'目标' ,clGreen);
    ClientDataSet8.Next;
  end;

end;

procedure Tfrm_Main.ClientDataSet8BeforeScroll(DataSet: TDataSet);
begin
  ClientDataSet8.ApplyUpdates(0)
end;

procedure Tfrm_Main.ClientDataSet8CalcFields(DataSet: TDataSet);
begin
  with DataSet do
  begin
    IF   (FieldByName('Shutdown_D').IsNull =False)AND ( FieldByName('D').IsNull =False) and
    ( FieldByName('H').IsNull =False) and( FieldByName('TS').IsNull =False)
    then
      FieldByName('Shutdown').Value:=
             FormatFloat( '0.00000',FieldByName('Shutdown_D').AsCurrency/
             ( FieldByName('D').AsCurrency  *FieldByName('H').AsCurrency * FieldByName('TS').AsCurrency))
    else
      FieldByName('Shutdown').Value:=0;


    IF   (FieldByName('Service_D').IsNull =False)AND ( FieldByName('D').IsNull =False) and
    ( FieldByName('H').IsNull =False) and( FieldByName('TS').IsNull =False)
    then
    FieldByName('Service').Value:=
               FormatFloat( '0.00000',   FieldByName('Service_D').AsFloat/
               ( FieldByName('D').AsFloat  *FieldByName('H').AsFloat*FieldByName('TS').AsFloat ))
    else
      FieldByName('Service').Value:=0;

    IF   (FieldByName('Plan_D').IsNull =False)AND ( FieldByName('mainStanTime').IsNull =False) and
         (FieldByName('Plan_D').Value>0)      AND ( FieldByName('mainStanTime').Value>0)then
    FieldByName('Plan').Value:=
                FormatFloat( '0.00000',  FieldByName('Plan_D').AsFloat/ FieldByName('mainStanTime').AsFloat )
    else
      FieldByName('Plan').Value:=0;

    IF   (FieldByName('Downtime_D').IsNull =False)AND ( FieldByName('D').IsNull =False) and
    ( FieldByName('H').IsNull =False) and( FieldByName('TS').IsNull =False)
    then
    FieldByName('Downtime').Value:=
               FormatFloat( '0.00000',
                FieldByName('Downtime_D').AsFloat/( FieldByName('D').AsFloat  *FieldByName('H').AsFloat *FieldByName('TS').AsFloat)  )
    else
      FieldByName('Downtime').Value:=0;

    IF   (FieldByName('NotDowntime_D').IsNull =False)AND ( FieldByName('D').IsNull =False) and
    ( FieldByName('H').IsNull =False) and( FieldByName('TS').IsNull =False)
    then
    FieldByName('NotDowntime').Value:=
                FormatFloat( '0.00000',
                FieldByName('NotDowntime_D').AsFloat/( FieldByName('D').AsFloat  *FieldByName('H').AsFloat *FieldByName('TS').AsFloat) )
    else
      FieldByName('NotDowntime').Value:=0;
  end;
end;

procedure Tfrm_Main.ClientDataSet8ReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  ShowMessage('保存失败，原因是：'+E.Message);
end;

procedure Tfrm_Main.DBGridEh7_1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in[VK_INSERT,VK_delete] then   //  , VK_down
  begin
    Key:=0;
  end
  else
  with   (Sender as TDBGridEh ).DataSource.DataSet  do
  if (Key in[VK_down])and(RecNo=RecordCount ) then    //如果击向下键，且当前记录号等于总记录数
  begin
    Key:=0;
  end;
  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text)
    else
    if  DataSet is TClientDataSet then
       showmessage((DataSet as  TClientDataSet).CommandText) ;
  end;
  if Key in[VK_ESCAPE] then   //  , VK_down
  begin
    StateCancel:=True;
    ClientDataSet1_1.Cancel;
    ClientDataSet1_1.CancelUpdates;
    StateCancel:=False;
    Key:=0;
  end;

end;

procedure Tfrm_Main.MenuItem8Click(Sender: TObject);
begin
  if ClientDataSet8.Active then
  if ClientDataSet8.IsEmpty=False then
  begin
    ClientDataSet8.Delete;
    ClientDataSet8.ApplyUpdates(0);
  end;
end;

procedure Tfrm_Main.MenuItem5Click(Sender: TObject);
begin
  if ClientDataSet8.Active=true then
  begin
    ClientDataSet8.Append;
  end;
end;

procedure Tfrm_Main.MenuItem6Click(Sender: TObject);
begin
  if ClientDataSet8.Active=true then
  if ClientDataSet8.State in [dsInsert ,dsedit] then
  begin
    ClientDataSet8.Post;
    ClientDataSet8.ApplyUpdates(0);
  end;
end;

procedure Tfrm_Main.MenuItem7Click(Sender: TObject);
begin
  if ClientDataSet8.Active=true then
 //
  begin
   // StateCancel:=True;
    if ClientDataSet8.State in [dsInsert ,dsedit] then
    ClientDataSet8.Cancel;

    ClientDataSet8.CancelUpdates;
   // StateCancel:=False;
  end;
end;

procedure Tfrm_Main.ClientDataSet9AfterScroll(DataSet: TDataSet);
begin
  ClientDataSet9_1.Close;
  ClientDataSet9_1.Params.ParamByName('D856_ptr').Value:=ClientDataSet9Rkey.Value;
  ClientDataSet9_1.Open;
  SetChart9();
end;

procedure Tfrm_Main.ClientDataSet9BeforeScroll(DataSet: TDataSet);
begin
  if StateCancel =False then
  if ClientDataSet9.ChangeCount>0 then
  ClientDataSet9Save;
end;

procedure Tfrm_Main.ClientDataSet9CalcFields(DataSet: TDataSet);
begin
  with DataSet do
  begin
    IF  ( FieldByName('DeviNumb').IsNull =False) and ( FieldByName('ManuNumb').IsNull =False)  and
        ( FieldByName('DeviNumb').Value>0)       and ( FieldByName('ManuNumb').Value>0)    then
    begin      //设备人数占制造人数比例  =   设备部总人数/制造总人数
      FieldByName('ManuPropNumb').Value:=
       FormatFloat( '0.00000',FieldByName('DeviNumb').AsCurrency/FieldByName('ManuNumb').AsCurrency  ) ;
    end
    else
      FieldByName('ManuPropNumb').Value:=0;

    if (FieldByName('Producti').IsNull =False) and ( FieldByName('DeviNumb').IsNull =False)and
       (FieldByName('Producti').Value>0)       and ( FieldByName('DeviNumb').Value>0)then
      //人均产量  =总产量 / 设备部总人数
      FieldByName('AverYiel').Value:=FieldByName('Producti').AsCurrency/FieldByName('DeviNumb').Value
    else
      FieldByName('AverYiel').Value:=0;

    if (FieldByName('OutpValu').IsNull =False) and ( FieldByName('DeviNumb').IsNull =False) and
       (FieldByName('OutpValu').Value>0)       and ( FieldByName('DeviNumb').Value>0)then
      //人均产值 =  总产值/ 设备部总人数
      FieldByName('Aver_GDP').Value:=FieldByName('OutpValu').AsCurrency/FieldByName('DeviNumb').Value
    else
      FieldByName('Aver_GDP').Value:=0;

    if (FieldByName('DeviWork').IsNull =False) and  ( FieldByName('workdays').IsNull =False)and
       (FieldByName('DeviWork').Value>0 )      and  ( FieldByName('workdays').Value>0 ) then
      //人均工时 =设备部总工时/设备部总人数
      FieldByName('HourWork').Value:=
      FormatFloat( '0.0',FieldByName('DeviWork').AsCurrency/FieldByName('workdays').Value)
    else
      FieldByName('HourWork').Value:=0;
  end;                                 //FieldByName('DeviNumb').Value

end;

procedure Tfrm_Main.ClientDataSet9ReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  ShowMessage('保存失败，原因是：'+E.Message);
end;

procedure Tfrm_Main.ClientDataSet9ABBR_NAMEChange(Sender: TField);
begin
  with qry0015 do
  begin
    if Active=False then
    Open;

    if Filtered then
    Filtered:=False;

    with Sender.DataSet do
    if not(State in [dsEdit,dsInsert]) then
    Edit;

    if Sender.IsNull then
    begin
      ClientDataSet9.FieldByName('D015_ptr').Value:=null;
    end
    else
    begin
      if Locate('ABBR_NAME',Sender.Value,[loCaseInsensitive]) then
        begin
        ClientDataSet9D015_ptr.Value := FieldByName('rkey').Value ;
        end
      else
        begin
        ClientDataSet9.FieldByName('D015_ptr').Value:=null;
        ClientDataSet9.FieldByName('ABBR_NAME').Value:=null ;
        end;
    end;
  end;
  ClientDataSet9YearsChange(Sender);
end;

procedure Tfrm_Main.ClientDataSet9_aaa1AfterInsert(DataSet: TDataSet);
begin
 ClientDataSet9_1D856_ptr.Value:=clientdataSet9rkey.Value;
end;

procedure Tfrm_Main.ClientDataSet9_aaa1BeforeScroll(DataSet: TDataSet);
begin
  if ClientDataSet9.UpdateStatus<>usInserted then
  begin
    ClientDataSet9_1.ApplyUpdates(0) ;
  end;
end;

procedure Tfrm_Main.ClientDataSet9_aaa1LocationChange(Sender: TField);
begin
  with qry_0840 do
  begin
    if Active=False then
    Open;

    if Filtered then
    Filtered:=False;

    with Sender.DataSet do
    if not(State in [dsEdit,dsInsert]) then
    Edit;

    if Sender.IsNull then
    begin
      ClientDataSet9_1.FieldByName('D840_ptr').Value:=null;
    end
    else
    begin
      if Locate('Location',Sender.Value,[loCaseInsensitive]) then
        begin
        ClientDataSet9_1D840_ptr.Value := FieldByName('rkey').Value ;
        end
      else
        begin
        ClientDataSet9_1.FieldByName('D840_ptr').Value:=null;
        ClientDataSet9_1.FieldByName('Location').Value:=null ;
        end;
    end;
  end;
end;

procedure Tfrm_Main.ClientDataSet9BeforePost(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if (FieldByName('Years').IsNull)or(FieldByName('Month').IsNull)or(FieldByName('ABBR_NAME').IsNull) then //
    begin
      ShowMessage('工厂、年、月都不能为空！！！');
      Abort;
    end;
  end;
end;

procedure Tfrm_Main.DBGridEh9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in[VK_delete] then   //  , VK_down
  begin
    Key:=0;
  end;
  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text)
    else
    if  DataSet is TClientDataSet then
       showmessage((DataSet as  TClientDataSet).CommandText) ;
  end;
  if Key in[VK_ESCAPE] then   //  , VK_down
  begin
    StateCancel:=True;
    ClientDataSet9.Cancel;
    ClientDataSet9.CancelUpdates;
    StateCancel:=False;
    Key:=0;
  end;
end;

procedure Tfrm_Main.ClientDataSet9Save;
var
  IsExists:Boolean;
begin
  try
    Screen.Cursor := crHourGlass;
    if ClientDataSet9.ChangeCount>0 then
    ClientDataSet9.ApplyUpdates(0);
    
    ADOQuery9_2.Close;
    ADOQuery9_2.Parameters.ParamByName('sd').Value:=
       StrToDateTime(ClientDataSet9.fieldByName('Years').AsString+'-' +ClientDataSet9.fieldByName('Month').AsString +'-1') ;  //2014-4-19去掉了时间部分查询条件  8:00:00
    ADOQuery9_2.Parameters.ParamByName('d015_ptr').Value:=ClientDataSet9.fieldByName('D015_ptr').Value;

    ADOQuery9_2.Open;
    //ShowMessage(IntToStr(ADOQuery9_2.RecordCount));
    IsExists:=False;
    if  (ADOQuery9_2.IsEmpty=False )then //  and  (ADOQuery9_2.Fields[0].IsNull =False)
    while  not  ADOQuery9_2.Eof do
    begin
      ClientDataSet9_1.First;
      while  not  ClientDataSet9_1.Eof do
      begin
        if (ClientDataSet9_1.FieldByName('D840_ptr').Value=ADOQuery9_2.FieldByName('rkey').Value) then
        begin
          IsExists:=True;
          break;
        end;
        ClientDataSet9_1.Next;
      end;
      if  IsExists=False then
      begin
      //  ShowMessage('ClientDataSet9_1.Append');
        ClientDataSet9_1.Append;
      //  ClientDataSet9_1.FieldByName('D015_ptr').Value:=ADOQuery9_2.FieldByName('WHOUSE_PTR').Value;
        ClientDataSet9_1.FieldByName('D840_ptr').Value:=ADOQuery9_2.FieldByName('rkey').Value;
        ClientDataSet9_1.FieldByName('Location').Value:=ADOQuery9_2.FieldByName('Location').Value;
        ClientDataSet9_1.FieldByName('NumbDevi').Value:=ADOQuery9_2.FieldByName('NumbDevi').Value;
        ClientDataSet9_1.FieldByName('Separati').Value:=ADOQuery9_2.FieldByName('Separati').Value;
        ClientDataSet9_1.FieldByName('TotaHour').Value:=ADOQuery9_2.FieldByName('TotaHour').Value;
        ClientDataSet9_1.FieldByName('ManaDeviQTY').Value:=ADOQuery9_2.FieldByName('ts').Value;
        ClientDataSet9_1.FieldByName('VacaDaysActu').Value:=ADOQuery9_2.FieldByName('VacaDaysActu').Value;   //VacaDaysActu人均休假天数|实际
        ClientDataSet9_1.FieldByName('workdays').Value:=ADOQuery9_2.FieldByName('workdays').Value;
        ClientDataSet9_1.FieldByName('ManaDeviTarg').Value:=ADOQuery9_2.FieldByName('ManaDeviTarg').Value;
        ClientDataSet9_1.FieldByName('VacaDaysTarg').Value:=ADOQuery9_2.FieldByName('VacaDaysTarg').Value;   // VacaDaysTarg人均休假天数|目标
        ClientDataSet9_1.FieldByName('StafResiTarg').Value:=ADOQuery9_2.FieldByName('StafResiTarg').Value;   
     //   ShowMessage('ClientDataSet9_1.Post前');
        ClientDataSet9_1.Post;
     //   ShowMessage('ClientDataSet9_1.Post后');
      end;

      ADOQuery9_2.Next;
    end;
      if ClientDataSet9_1.ChangeCount>0 then
      ClientDataSet9_1.ApplyUpdates(0);
  finally    
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_Main.MenuItem9Click(Sender: TObject);
begin
  if ClientDataSet9_1.Active=true then
  begin
    ClientDataSet9_1.Append;
  end;
end;

procedure Tfrm_Main.MenuItem10Click(Sender: TObject);
begin
  if ClientDataSet9_1.Active=true then
  if ClientDataSet9_1.State in [dsInsert ,dsedit] then
  begin
    ClientDataSet9_1.Post;

  end;
end;

procedure Tfrm_Main.MenuItem11Click(Sender: TObject);
begin
  if ClientDataSet9_1  .Active=true then
 // 
  begin
   // StateCancel:=True;
    if ClientDataSet9_1.State in [dsInsert ,dsedit] then
    ClientDataSet9_1.Cancel;

    ClientDataSet9_1.CancelUpdates;
   // StateCancel:=False;
  end;
end;

procedure Tfrm_Main.MenuItem12Click(Sender: TObject);
begin
  if ClientDataSet9_1.Active then
  if ClientDataSet9_1.IsEmpty=False then
  begin
    ClientDataSet9_1.Delete;
    ClientDataSet9_1.ApplyUpdates(0);
  end;
end;

procedure Tfrm_Main.ClientDataSet9_aaa1CalcFields(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if   (FieldByName('Separati').IsNull=False)and(FieldByName('NumbDevi').IsNull=False) then
    begin
      if  (FieldByName('Separati').Value>0)and (FieldByName('NumbDevi').Value>0) then
        FieldByName('StafResiActu').Value:=
        FormatFloat( '0.00000',FieldByName('Separati').AsCurrency/FieldByName('NumbDevi').AsCurrency)
      else
        if  (FieldByName('Separati').Value>0)and (FieldByName('NumbDevi').Value=0) then
        FieldByName('StafResiActu').Value:=100;
    end  ;
    if   (FieldByName('ManaDeviQTY').IsNull=False)and(FieldByName('NumbDevi').IsNull=False)
    and (FieldByName('ManaDeviQTY').Value>0)and(FieldByName('NumbDevi').Value>0) then
    begin
      FieldByName('ManaDeviActu').Value:=
        FormatFloat( '0.0',FieldByName('ManaDeviQTY').AsCurrency/FieldByName('NumbDevi').AsCurrency)

    end;
  end;
end;

procedure Tfrm_Main.DataSetProvider9AfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind);
begin
  if UpdateKind= ukInsert then      //这段代码的作用是客户端获取自动编号的值。
  begin
    with dtRead  do
    begin
     Close;
     CommandText:='select @@identity';
     Open;
     DeltaDS.FieldByName('rkey').ReadOnly:=False;
     DeltaDS.FieldByName('rkey').NewValue:=dtRead.Fields[0].Value;
     Close;
    end;
  end;
end;

procedure Tfrm_Main.MenuItem13Click(Sender: TObject);
begin
  if ClientDataSet9.Active=true then
  begin
    ClientDataSet9.Append;
  end;
end;

procedure Tfrm_Main.MenuItem14Click(Sender: TObject);
begin
  if ClientDataSet9.Active=true then
  if ClientDataSet9.State in [dsInsert ,dsedit] then
  begin
    ClientDataSet9.Post;

    ClientDataSet9Save;
  end;
end;

procedure Tfrm_Main.MenuItem15Click(Sender: TObject);
begin
  if ClientDataSet9.Active=true then
  begin
   // StateCancel:=True;
    if ClientDataSet9.State in [dsInsert ,dsedit] then
    ClientDataSet9.Cancel;

    ClientDataSet9.CancelUpdates;
   // StateCancel:=False;
  end;
end;

procedure Tfrm_Main.MenuItem16Click(Sender: TObject);
begin
  if ClientDataSet9.Active then
  if ClientDataSet9.IsEmpty=False then
  begin
    ClientDataSet9.Delete;
    ClientDataSet9.ApplyUpdates(0);
  end;
end;

procedure Tfrm_Main.ClientDataSet9YearsChange(Sender: TField);
begin
  if    (ClientDataSet9.FieldByName('Years').IsNull=False )
    and (ClientDataSet9.FieldByName('Month').IsNull=False )
    and (ClientDataSet9.FieldByName('ABBR_NAME').IsNull=False ) then
  begin
    ADOQuery9_3.Close;
    ADOQuery9_3.Parameters.ParamByName('sd').Value:=
       StrToDateTime(ClientDataSet9.fieldByName('Years').AsString+'-' +ClientDataSet9.fieldByName('Month').AsString +'-1 8:00:00') ;
    ADOQuery9_3.Parameters.ParamByName('d015_ptr').Value:= ClientDataSet9.fieldByName('d015_ptr').AsInteger ;
    ADOQuery9_3.Open;
    if  ADOQuery9_3.IsEmpty=False then
    begin
      if not (ClientDataSet9.State  in [dsInsert,dsEdit])then
      ClientDataSet9.Edit;
      //
      ClientDataSet9.fieldByName('DeviNumb').Value:=ADOQuery9_3.FieldbyName('SBRS').Value;  //设备部总人数
      ClientDataSet9.fieldByName('Producti').Value:=ADOQuery9_3.FieldbyName('MJ').Value;  //总产量
      ClientDataSet9.fieldByName('OutpValu').Value:=ADOQuery9_3.FieldbyName('HSJE').Value;  //总产值
      ClientDataSet9.fieldByName('DeviWork').Value:=ADOQuery9_3.FieldbyName('WorkTime').Value;  // 设备部总工时
      ClientDataSet9.fieldByName('WorkDays').Value:=ADOQuery9_3.FieldbyName('WorkDays').Value;  // 设备部总工作天数,不包括编外责任小组和各责任小组负责人
    end;
  end;
end;

procedure Tfrm_Main.DataSetProvider9_1BeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  if(UpdateKind = ukInsert)and(DeltaDS.FieldByName('D856_ptr').AsInteger<=0)then
  begin
    if DeltaDS.BOF then               //只有是第一行的时候，才需要执行查询获取@@identity
    begin
      with    dtReadRkey do
      begin
        Close;
        CommandText:='select @@identity as [ID]';  // @@identity
        Open;
      end;
    end;
    DeltaDS.FieldByName('D856_ptr').NewValue := dtReadRkey.FieldByName('ID').AsInteger ;
  end;
end;

procedure Tfrm_Main.DataSetProvider9_1AfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind);
begin
  if UpdateKind= ukInsert then      //这段代码的作用是客户端获取自动编号的值。
  begin
    with dtRead  do
    begin
      Close;
      CommandText:='select @@identity';
      Open;
      DeltaDS.FieldByName('rkey').ReadOnly:=False;
      DeltaDS.FieldByName('rkey').NewValue:=dtRead.Fields[0].Value;
      Close;
    end;
  end;
end;

procedure Tfrm_Main.ClientDataSet9_aaa1StafResiTargGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
    if VarIsNull(Sender.Value )=False then
  Text:=FloatToStr(  (StrToFloat(Sender.Value) *100 ))+'%';
end;

procedure Tfrm_Main.OutputExcel(DBGrid1:TDBGridEh;FileName:String;LabelName:string='');
var //导出数据到Excel文件中
  eclapp, workbook: Variant;
  row, column, i: Integer;
  SaveDialog:TSaveDialog;
  BM:Pointer;//TBookmark;
begin

//功能：把表格中的数据保存到你新建的EXCEL表中。
//  if MessageDlg('你确定你安装了Microsoft Excel 97/2000/2003?', mtConfirmation, [mbyes, mbno], 0) <> idyes then
//  begin
//    exit;
//  end
//  else
  begin
    try       //生成一个Excel OleObject
        EclApp := CreateOleObject('Excel.Application');
        WorkBook := CreateOleObject('Excel.Sheet');
    except //产生例外保存
        showmessage('您的机器里面没有安装任何版本的Excel');
        Exit;
    end;
    SaveDialog:=TSaveDialog.Create(nil);
    SaveDialog.Filter:='Excel文件|*.XLS';
    SaveDialog.FileName:=FileName;
    try
       if savedialog.Execute then //保存Excel文件
         begin
            try
              bm:=DBGrid1.DataSource.DataSet.GetBookmark;//书签。
              workBook := EclApp.workBooks.Add;
              row := 2;
              EclApp.Workbooks.Item[1].Activate;
              //eclApp.Cells.font.colorindex := 5;
              if labelName='' then
                   LabelName:=FileName;
              EclApp.Activesheet.Cells(1, 1) := LabelName;
               // EclApp.Activesheet.Font.Size:=20;
              DBGrid1.DataSource.DataSet.DisableControls;
              DBGrid1.DataSource.DataSet.First;
      
              for I := 1 to DBGrid1.FieldCount do
              EclApp.Activesheet.Cells(2, I) := DBGrid1.Columns[I -1].Title.Caption;
              while not (DBGrid1.DataSource.DataSet.Eof) do
              begin
                  Column := 1;
                  for i := 1 to DBGrid1.FieldCount do
                  begin
                    //if  DBGrid1.Fields[i -1].Visible then
                    begin
                      eclApp.Cells.Item[row + 1, column] := DBGrid1.Fields[i -1].AsString;
                      column := column + 1;
                    end;
                  end;
                  DBGrid1.DataSource.DataSet.Next;
                  row := row + 1;
            //      EclApp.Activesheet.Cells(5, I).NumberFormatLocal := '0.00%'   ;
              end;

              if ActiveGrid=DBGridEh9 then
              begin
                EclApp.Columns[8].NumberFormatLocal:= '0.00%';   //设置EXCEL表第6行的单元格的格式为%。
              end
              else
              if  ActiveGrid=DBGridEh9_1 then
              begin
                EclApp.Columns[6].NumberFormatLocal:= '0.00%';   //设置EXCEL表第6行的单元格的格式为%。
                EclApp.Columns[7].NumberFormatLocal:= '0.00%';   //设置EXCEL表第6行的单元格的格式为%。
              end
              else
              if ActiveGrid=DBGridEh7_1 then
              begin
                EclApp.Columns[7].NumberFormatLocal:= '0.00%';   //设置EXCEL表第6行的单元格的格式为%。
                EclApp.Columns[8].NumberFormatLocal:= '0.00%';
                EclApp.Columns[10].NumberFormatLocal:= '0.00%';
                EclApp.Columns[11].NumberFormatLocal:= '0.00%';
                EclApp.Columns[13].NumberFormatLocal:= '0.00%';
                EclApp.Columns[14].NumberFormatLocal:= '0.00%';
                EclApp.Columns[16].NumberFormatLocal:= '0.00%';
                EclApp.Columns[17].NumberFormatLocal:= '0.00%';
                EclApp.Columns[18].NumberFormatLocal:= '0.00%';
                EclApp.Columns[19].NumberFormatLocal:= '0.00%';
                EclApp.Columns[22].NumberFormatLocal:= '0.00%';
                EclApp.Columns[23].NumberFormatLocal:= '0.00%';
                EclApp.Columns[24].NumberFormatLocal:= '0.00%';
                EclApp.Columns[25].NumberFormatLocal:= '0.00%';

              end
              else
              if ActiveGrid=DBGridEh8_1 then
              begin
                EclApp.Columns[7].NumberFormatLocal:= '0.00%';   //设置EXCEL表第6行的单元格的格式为%。
                EclApp.Columns[8].NumberFormatLocal:= '0.00%';
                EclApp.Columns[10].NumberFormatLocal:= '0.00%';
                EclApp.Columns[11].NumberFormatLocal:= '0.00%';
                EclApp.Columns[13].NumberFormatLocal:= '0.00%';
                EclApp.Columns[14].NumberFormatLocal:= '0.00%';
                EclApp.Columns[16].NumberFormatLocal:= '0.00%';
                EclApp.Columns[17].NumberFormatLocal:= '0.00%';
                EclApp.Columns[18].NumberFormatLocal:= '0.00%';
                EclApp.Columns[19].NumberFormatLocal:= '0.00%';
                EclApp.Columns[22].NumberFormatLocal:= '0.00%';
                EclApp.Columns[23].NumberFormatLocal:= '0.00%';
                EclApp.Columns[24].NumberFormatLocal:= '0.00%';
                EclApp.Columns[25].NumberFormatLocal:= '0.00%';

              end
              else
              if ActiveGrid=DBGridEh10_1 then
              begin
                EclApp.Columns[3].NumberFormatLocal:= '0.00%';   //设置EXCEL表第6行的单元格的格式为%。
              end
            finally
              DBGrid1.DataSource.DataSet.GotoBookmark(BM);  // 重新定位到书签
              DBGrid1.DataSource.DataSet.FreeBookmark(bm ); //释放书签。
              DBGrid1.DataSource.DataSet.EnableControls;
            end;
           WorkBook.Saveas(SaveDialog.FileName);
           WorkBook.Saved := True;
           WorkBook.Close;
           eclApp.Quit;
           eclApp := Unassigned;
           ShowMessage('数据成功导出到EXCEL!');
         end
       else
           begin
           workBook.Saved :=false;
           WorkBook.close;
           eclApp.Quit;
           eclApp := Unassigned;
           end;
    except
      ShowMessage('Excel文件保存失败');
      WorkBook.close;
      eclApp.Quit;
      eclApp := Unassigned;
    end;
  end;
end;

procedure Tfrm_Main.ClientDataSet9ManuPropNumbGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
    if VarIsNull(Sender.Value )=False then
  Text:=FloatToStr(  (StrToFloat(Sender.Value) *100 ))+'%';
end;

procedure Tfrm_Main.ClientDataSet9_aaa1StafResiActuGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
    if VarIsNull(Sender.Value )=False then
  Text:=FloatToStr(  (StrToFloat(Sender.Value) *100 ))+'%';
end;

procedure Tfrm_Main.ClientDataSet9_11AfterInsert(DataSet: TDataSet);
begin
// ClientDataSet9__1D856_ptr.Value:=clientdataSet9rkey.Value;
end;

procedure Tfrm_Main.ClientDataSet9_11BeforeScroll(DataSet: TDataSet);
begin
  if ClientDataSet9.UpdateStatus<>usInserted then
  begin
//    ClientDataSet9__1.ApplyUpdates(0) ;
//ShowMessage('save');
  end;
end;

procedure Tfrm_Main.ClientDataSet9_11CalcFields(DataSet: TDataSet);
begin
//  with DataSet do
//  begin
//    if   (FieldByName('Separati').IsNull=False)and(FieldByName('NumbDevi').IsNull=False) then
//    begin
//      if  (FieldByName('Separati').Value>0)and (FieldByName('NumbDevi').Value>0) then
//        FieldByName('StafResiActu').Value:=
//        FormatFloat( '0.00000',FieldByName('Separati').AsCurrency/FieldByName('NumbDevi').AsCurrency)
//      else
//        if  (FieldByName('Separati').Value>0)and (FieldByName('NumbDevi').Value=0) then
//        FieldByName('StafResiActu').Value:=100;
//    end  ;
//    if   (FieldByName('ManaDeviQTY').IsNull=False)and(FieldByName('NumbDevi').IsNull=False)
//    and (FieldByName('ManaDeviQTY').Value>0)and(FieldByName('NumbDevi').Value>0) then
//    begin
//      FieldByName('ManaDeviActu').Value:=
//        FormatFloat( '0.0',FieldByName('ManaDeviQTY').AsCurrency/FieldByName('NumbDevi').AsCurrency)
//
//    end;
//  end;
end;

procedure Tfrm_Main.ClientDataSet9_11ReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  ShowMessage('保存失败，原因是：'+E.Message);
end;

procedure Tfrm_Main.ClientDataSet9_1AfterInsert(DataSet: TDataSet);
begin
 ClientDataSet9_1D856_ptr.Value:=clientdataSet9rkey.Value;
end;

procedure Tfrm_Main.ClientDataSet9_1BeforeScroll(DataSet: TDataSet);
begin
  if ClientDataSet9.UpdateStatus<>usInserted then
  begin
    ClientDataSet9_1.ApplyUpdates(0) ;
//ShowMessage('save');
  end;
end;

procedure Tfrm_Main.ClientDataSet9_1ReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  ShowMessage('保存失败，原因是：'+E.Message);
end;

procedure Tfrm_Main.ClientDataSet9_1CalcFields(DataSet: TDataSet);
begin
  with DataSet do
  begin
    if   (FieldByName('Separati').IsNull=False)and(FieldByName('NumbDevi').IsNull=False)and
     (FieldByName('Separati').Value>0)and (FieldByName('NumbDevi').Value>0) then
    begin
      // 成员流失率|实际  = 离职人数/ 设备人数
        FieldByName('StafResiActu').Value:=FormatFloat( '0.0000',FieldByName('Separati').AsCurrency/FieldByName('NumbDevi').AsCurrency);
    end
    else
      FieldByName('StafResiActu').Value:=0;

    if   (FieldByName('ManaDeviQTY').IsNull=False)and(FieldByName('NumbDevi').IsNull=False)
      and (FieldByName('ManaDeviQTY').Value>0)and(FieldByName('NumbDevi').Value>0) then
    begin
      FieldByName('ManaDeviActu').Value:=
        FormatFloat( '0.0',FieldByName('ManaDeviQTY').AsCurrency/FieldByName('NumbDevi').AsCurrency)
    end
    else
      FieldByName('ManaDeviActu').Value:=0;

    if   (FieldByName('TotaHour').IsNull=False)and(FieldByName('WorkDays').IsNull=False)and
     (FieldByName('TotaHour').Value>0)and(FieldByName('WorkDays').Value>0) then
    begin
      //人均工时=  总工时/工作天数
      FieldByName('HourWork').Value:= FormatFloat( '0.0',FieldByName('TotaHour').AsCurrency/FieldByName('WorkDays').AsCurrency)  ;
    end
    else
      FieldByName('HourWork').Value:=0;
  end;
end;

procedure Tfrm_Main.ClientDataSet9_1StafResiActuGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
    if VarIsNull(Sender.Value )=False then
  Text:=FloatToStr(  (StrToFloat(Sender.Value) *100 ))+'%';
end;

procedure Tfrm_Main.ClientDataSet9_1StafResiTargGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
    if VarIsNull(Sender.Value )=False then
  Text:=FloatToStr(  (StrToFloat(Sender.Value) *100 ))+'%';
end;

procedure Tfrm_Main.ClientDataSet7DowntimeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
    if VarIsNull(Sender.Value )=False then
  Text:=FloatToStr(  (StrToFloat(Sender.Value) *100 ))+'%';
end;

procedure Tfrm_Main.ClientDataSet7ServiceTargetGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
    if VarIsNull(Sender.Value )=False then
  Text:=FloatToStr(  (StrToFloat(Sender.Value) *100 ))+'%';
end;

procedure Tfrm_Main.ClientDataSet8ShutdownGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
    if VarIsNull(Sender.Value )=False then
  Text:=FloatToStr(  (StrToFloat(Sender.Value) *100 ))+'%';
end;

procedure Tfrm_Main.DBGridEh9Enter(Sender: TObject);
begin
  ActiveGrid:=  Sender as TDBGridEh;
end;

procedure Tfrm_Main.ClientDataSet8AfterInsert(DataSet: TDataSet);
begin
  ClientDataSet8D851_ptr.Value:=ADOQuery1rkey.Value;
end;

procedure Tfrm_Main.ClientDataSet8AfterOpen(DataSet: TDataSet);
begin
  Series14.Clear;
  Series15.Clear;
  Series16.Clear;
  Series17.Clear;
  Series18.Clear;
  Series19.Clear;

  ClientDataSet8.First;
  while not ClientDataSet8.Eof do
  begin
    Series14.Add(ClientDataSet8Downtime.Value  , ClientDataSet8Location.Value +#13+'实际',clRed);
    Series14.Add(ClientDataSet8DowntimeTarget.Value, ClientDataSet8Location.Value+#13+'目标',clGreen);
    Series15.Add(ClientDataSet8Shutdown.Value  , ClientDataSet8Location.Value +#13+'实际',clRed);
    Series15.Add(ClientDataSet8ShutdownTarget.Value, ClientDataSet8Location.Value+#13+'目标',clGreen);
    Series16.Add(ClientDataSet8NotDowntime.Value  , ClientDataSet8Location.Value +#13+'实际',clRed);
    Series16.Add(ClientDataSet8NotDowntimeTarget.Value, ClientDataSet8Location.Value+#13+'目标',clGreen);
    Series17.Add(ClientDataSet8Service.Value  , ClientDataSet8Location.Value+#13+'实际',clRed);
    Series17.Add(ClientDataSet8ServiceTarget.Value, ClientDataSet8Location.Value+#13+'目标',clGreen);
    Series18.Add(ClientDataSet8Scrapped.Value  , ClientDataSet8Location.Value +#13+ ClientDataSet8Plan.AsString,clRed);
    Series18.Add(ClientDataSet8ScrappedTarget.Value, ClientDataSet8Location.Value+#13 + ClientDataSet8PlanTarget.AsString,clRed);
    Series19.Add(ClientDataSet8Plan.Value  , ClientDataSet8Location.Value +#13+'实际',clRed);
    Series19.Add(ClientDataSet8PlanTarget.Value, ClientDataSet8Location.Value+#13 +'目标' ,clGreen);
    ClientDataSet8.Next;
  end;
end;

procedure Tfrm_Main.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  with Sender as TEdit do
  if Key =#13 then
  begin
    if Text='' then
    begin
      ClientDataSet9.Filtered:=False ;
    end
    else
    begin
      ClientDataSet9.Filtered:=False ;
      ClientDataSet9.Filter:='Years='+Text;
      ClientDataSet9.Filtered:=True ;

    end;
  end;
end;

procedure Tfrm_Main.DataSetProvider7AfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind);
begin
  if UpdateKind= ukInsert then      //这段代码的作用是客户端获取自动编号的值。
  begin
    with dtRead  do
    begin
     Close;
     CommandText:='select @@identity';
     Open;
     DeltaDS.FieldByName('rkey').ReadOnly:=False;
     DeltaDS.FieldByName('rkey').NewValue:=dtRead.Fields[0].Value;
     Close;
    end;
  end;
end;

procedure Tfrm_Main.DataSetProvider8AfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind);
begin
  if UpdateKind= ukInsert then      //这段代码的作用是客户端获取自动编号的值。
  begin
    with dtRead  do
    begin
     Close;
     CommandText:='select @@identity';
     Open;
     DeltaDS.FieldByName('rkey').ReadOnly:=False;
     DeltaDS.FieldByName('rkey').NewValue:=dtRead.Fields[0].Value;
     Close;
    end;
  end;
end;

procedure Tfrm_Main.PF4_cbxChange(Sender: TObject);
begin
  with  PF4_cbx do
  begin
    if  Text='全部' then
      ADOQuery4.Filtered:=False
    else
      begin
        ADOQuery4.Filtered:=False    ;
        ADOQuery4.Filter:= '工厂='+ QuotedStr(Text);
        ADOQuery4.Filtered:=True    ;
      //F_SQLWhere2:=#13+'where [工厂]='+QuotedStr(Text);
      end ;
  end;
  series4.Clear;
  while not ADOQuery4.Eof do
  begin
   // for i:=2 to ADOQuery4.FieldCount-1 do
    series4.Add(ADOQuery4.Fields[3].AsInteger  , ADOQuery4.Fields[2].Value+#13+ADOQuery4.Fields[3].DisplayLabel,clRed);
    series4.Add(ADOQuery4.Fields[4].AsInteger  , ADOQuery4.Fields[2].Value+#13+ADOQuery4.Fields[4].DisplayLabel,clRed);
    //series2.Add(ClientDataSet1_1Target.Value, ClientDataSet1_1Location.Value + ClientDataSet1_1Target.AsString,clRed);
    ADOQuery4.Next;
  end;
end;

procedure Tfrm_Main.ClientDataSet10_1AfterOpen(DataSet: TDataSet);
begin
  Series20.Clear;
  Series21.Clear;
  if  ClientDataSet10_1.IsEmpty=False then
  begin
    ClientDataSet10_1.First;
    Series21.Add(ClientDataSet10_1.fieldByName('Percentage').Value,ClientDataSet10_1.fieldByName('JobName').Value);
    Series21.Add(1-ClientDataSet10_1.fieldByName('Percentage').Value,'以外');
    ClientDataSet10_1.Next;    //将第一行排除在外。
    while not ClientDataSet10_1.Eof do
    begin
      Series20.Add(ClientDataSet10_1.fieldByName('Percentage').Value,ClientDataSet10_1.fieldByName('JobName').Value);
      ClientDataSet10_1.Next;
    end;
  end;
end;

procedure Tfrm_Main.ClientDataSet10_1CalcFields(DataSet: TDataSet);
//var
//  TempCDS:TClientDataSet;
begin
  try
//    if  TempCDS=nil then
//    begin
//      TempCDS:=TClientDataSet .Create(nil);
//      TempCDS.Data:= ClientDataSet10_1.Data;
//      //TempCDS.CloneCursor(ClientDataSet10_1,False);
//      TempCDS.First;
//      TempCDS.Next;//第一行不参与到统计中
//      while not TempCDS.Eof do
//      begin                                           // TimeCons
//        Data10Total:=Data10Total+TempCDS.fieldByName('TimeCons').Value;
//       // ShowMessage(FloatToStr(TempCDS.fieldByName('TimeCons').Value));
//        TempCDS.Next;
//      end;
//    end;

    if (DataSet.FieldByName('TimeCons').Value>0)and(Data10Total>0) then
      DataSet.FieldByName('Percentage').Value:=DataSet.FieldByName('TimeCons').Value /Data10Total
    else
      DataSet.FieldByName('Percentage').Value:=0;
  finally
//    TempCDS.Free;
  end;
end;

procedure Tfrm_Main.ClientDataSet10_1PercentageGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if VarIsNull(Sender.Value )=False then
  Text:=FloatToStr(  (StrToFloat(Sender.Value) *100 ))+'%';
end;

procedure Tfrm_Main.ClientDataSet10AfterOpen(DataSet: TDataSet);
var
  TempCDS:TClientDataSet;
begin
  TempCDS:=TClientDataSet .Create(nil);
  try         
 //   TempCDS.Data:= ClientDataSet10.Data;
    TempCDS.CloneCursor(ClientDataSet10,False);
    TempCDS.Open;
//    ShowMessage('1'+ClientDataSet10.fieldByName('JobName').AsString+ClientDataSet10.fieldByName('TimeCons').AsString) ;
//    ShowMessage('2'+TempCDS.fieldByName('JobName').AsString+TempCDS.fieldByName('TimeCons').AsString);
    Data10Total:=0;
    TempCDS.First;
    TempCDS.Next;//第一行不参与到统计中
    while not TempCDS.Eof do
    begin                                           // TimeCons
      //ShowMessage('2'+TempCDS.fieldByName('JobName').AsString+TempCDS.fieldByName('TimeCons').AsString);
      Data10Total:=Data10Total+TempCDS.fieldByName('TimeCons').AsFloat;
     // ShowMessage(FloatToStr(TempCDS.fieldByName('TimeCons').Value));
      TempCDS.Next;
    end;
  finally
    TempCDS.Free;
  end;
  ClientDataSet10_1.CloneCursor(ClientDataSet10,False);
 // ClientDataSet10_1.Data:=ClientDataSet10.Data;
end;

procedure Tfrm_Main.ClientDataSet9AfterOpen(DataSet: TDataSet);
begin
  DataSet.Last;
end;

procedure Tfrm_Main.SpeedButton25Click(Sender: TObject);
var
  Statistics_frm: TStatistics_frm;
begin
  Statistics_frm:= TStatistics_frm.Create(Application);
  try
    Statistics_frm.ShowModal;
  finally
    Statistics_frm.Free;
  end;   
end;

end.







