unit form_EquiMainAnal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SingleDataSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  ppEndUsr, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, DB, DBClient, cds, Provider, ADODB,
  dxBar, cxClasses, ImgList, ActnList, Grids, DBGridEh, ToolWin, ComCtrls,
  cxPC, StdCtrls, RzPanel, ExtCtrls, dxStatusBar, Buttons, DateUtils, Menus,
  DBGrids;

type
  Tfrm_EquiMainAnal = class(TSingleDataSet_f)
    cdsMainCDSDesigner: TStringField;
    cdsMainCDSDesigner2: TDateTimeField;
    cdsMainCDSDesigner3: TStringField;
    cdsMainCDSDesigner4: TStringField;
    cdsMainCDSDesigner5: TStringField;
    cdsMainCDSDesigner6: TStringField;
    cdsMainCDSDesigner7: TStringField;
    cdsMainCDSDesigner8: TStringField;
    cdsMainCDSDesigner9: TStringField;
    cdsMainCDSDesigner10: TStringField;
    cdsMainCDSDesigner11: TStringField;
    cdsMainCDSDesigner12: TStringField;
    cdsMainCDSDesigner13: TStringField;
    cdsMainCDSDesigner14: TDateTimeField;
    cdsMainCDSDesigner15: TStringField;
    cdsMainCDSDesigner16: TStringField;
    cdsMainCDSDesigner17: TStringField;
    cdsMainCDSDesigner18: TDateTimeField;
    cdsMainCDSDesigner19: TStringField;
    cdsMainCDSDesigner20: TDateTimeField;
    cdsMainCDSDesigner21: TStringField;
    cdsMainCDSDesigner22: TStringField;
    cdsMainCDSDesigner23: TBCDField;
    cdsMainCDSDesigner25: TStringField;
    cdsMainCDSDesigner38: TDateTimeField;
    cds0005: TClientDataSet;
    cds0005RKEY: TAutoIncField;
    cds0005EMPL_CODE: TStringField;
    cds0005EMPLOYEE_NAME: TStringField;
    cds0015: TClientDataSet;
    cds0015RKEY: TIntegerField;
    cds0015WAREHOUSE_CODE: TStringField;
    cds0015ABBR_NAME: TStringField;
    cds0417: TClientDataSet;
    cds0417FASSET_CODE: TStringField;
    cds0417FASSET_NAME: TStringField;
    cds0417FASSET_DESC: TStringField;
    cds0417rkey: TIntegerField;
    cds0417DEPT_CODE: TStringField;
    cds0417DEPT_NAME: TStringField;
    cds840: TClientDataSet;
    cds840rkey: TIntegerField;
    cds840Location: TStringField;
    DghMain1: TDBGridEh;
    DataSource1: TDataSource;
    cdsMain1: Tcds;
    cdsMain1CDSDesigner: TStringField;
    cdsMain1CDSDesigner2: TDateTimeField;
    cdsMain1CDSDesigner3: TDateTimeField;
    cdsMain1CDSDesigner4: TStringField;
    cdsMain1CDSDesigner5: TStringField;
    cdsMain1CDSDesigner6: TStringField;
    cdsMain1CDSDesigner7: TStringField;
    cdsMain1CDSDesigner8: TStringField;
    cdsMain1CDSDesigner9: TStringField;
    cdsMain1CDSDesigner10: TStringField;
    cdsMain1CDSDesigner11: TStringField;
    cdsMain1CDSDesigner12: TStringField;
    cdsMain1CDSDesigner13: TStringField;
    cdsMain1CDSDesigner14: TStringField;
    cdsMain1CDSDesigner15: TDateTimeField;
    cdsMain1CDSDesigner16: TStringField;
    cdsMain1CDSDesigner17: TStringField;
    cdsMain1CDSDesigner18: TStringField;
    cdsMain1CDSDesigner19: TDateTimeField;
    cdsMain1CDSDesigner20: TStringField;
    cdsMain1CDSDesigner21: TDateTimeField;
    cdsMain1CDSDesigner22: TStringField;
    cdsMain1CDSDesigner23: TStringField;
    cdsMain1CDSDesigner24: TBCDField;
    cxTabSheet2: TcxTabSheet;
    cdsMain2: Tcds;
    DataSource2: TDataSource;
    DghMain2: TDBGridEh;
    cdsMain2CDSDesigner: TStringField;
    cdsMain2CDSDesigner2: TStringField;
    cdsMain2CDSDesigner3: TStringField;
    cdsMain2CDSDesigner4: TStringField;
    cdsMain2CDSDesigner5: TStringField;
    cdsMain2CDSDesigner6: TStringField;
    cdsMain2CDSDesigner7: TStringField;
    cdsMain2CDSDesigner8: TStringField;
    cdsMain2CDSDesigner9: TDateTimeField;
    cdsMain2CDSDesigner10: TStringField;
    cdsMain2CDSDesigner11: TStringField;
    cdsMain2CDSDesigner12: TStringField;
    cdsMain2CDSDesigner13: TDateTimeField;
    cdsMain2CDSDesigner14: TStringField;
    cdsMain2CDSDesigner15: TDateTimeField;
    cdsMain2CDSDesigner16: TStringField;
    cdsMain2CDSDesigner17: TDateTimeField;
    cdsMain2CDSDesigner18: TStringField;
    cdsMain2CDSDesigner19: TStringField;
    cdsMain2CDSDesigner20: TStringField;
    cdsMain2CDSDesigner21: TStringField;
    cdsMain2CDSDesigner22: TBCDField;
    cdsMain2CDSDesigner33: TBCDField;
    cdsMain3: Tcds;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    DateTimeField1: TDateTimeField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    DateTimeField2: TDateTimeField;
    StringField12: TStringField;
    DateTimeField3: TDateTimeField;
    StringField13: TStringField;
    DateTimeField4: TDateTimeField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    BCDField1: TBCDField;
    StringField18: TStringField;
    DataSource3: TDataSource;
    cxTabSheet3: TcxTabSheet;
    cds0034: TClientDataSet;
    cds0034DEPT_CODE: TStringField;
    cds0034DEPT_NAME: TStringField;
    cxTabSheet4: TcxTabSheet;
    dghMain4: TDBGridEh;
    DataSource4: TDataSource;
    cdsMain4: Tcds;
    cdsMain4CDSDesigner: TStringField;
    cdsMain4CDSDesigner2: TStringField;
    cdsMain4CDSDesigner3: TStringField;
    cdsMain4CDSDesigner4: TStringField;
    cdsMain4CDSDesigner5: TStringField;
    cdsMain4CDSDesigner6: TDateTimeField;
    cdsMain4CDSDesigner7: TStringField;
    cdsMain4CDSDesigner10: TBCDField;
    cdsMain4CDSDesigner11: TBCDField;
    cdsMain4CDSDesigner12: TBCDField;
    cdsMain4CDSDesigner13: TStringField;
    cdsMain4CDSDesigner14: TStringField;
    cdsMain4CDSDesigner15: TStringField;
    cdsMain4CDSDesigner16: TStringField;
    cdsMain4CDSDesigner17: TStringField;
    cdsMain4CDSDesigner18: TDateTimeField;
    cdsMain4CDSDesigner19: TStringField;
    cdsMain4CDSDesigner21: TBCDField;
    cdsMain4CDSDesigner22: TBCDField;
    cdsMain4CDSDesigner23: TIntegerField;
    cdsMain4CDSDesigner31: TStringField;
    cdsMain4CDSDesigner32: TStringField;
    cdsMain5: Tcds;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    DateTimeField8: TDateTimeField;
    StringField27: TStringField;
    DateTimeField9: TDateTimeField;
    BCDField7: TBCDField;
    BCDField8: TBCDField;
    BCDField9: TBCDField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    DateTimeField11: TDateTimeField;
    StringField33: TStringField;
    StringField34: TStringField;
    BCDField10: TBCDField;
    BCDField11: TBCDField;
    IntegerField1: TIntegerField;
    DataSource5: TDataSource;
    cxTabSheet5: TcxTabSheet;
    dghMain5: TDBGridEh;
    cxTabSheet6: TcxTabSheet;
    dghMain6: TDBGridEh;
    DataSource6: TDataSource;
    cdsMain6: Tcds;
    cdsMain6CDSDesigner: TStringField;
    cdsMain6CDSDesigner2: TStringField;
    cdsMain6CDSDesigner3: TStringField;
    cdsMain6CDSDesigner4: TStringField;
    cdsMain6CDSDesigner5: TStringField;
    cdsMain6CDSDesigner6: TStringField;
    cdsMain6CDSDesigner7: TStringField;
    cdsMain6CDSDesigner8: TStringField;
    cdsMain6CDSDesigner9: TStringField;
    cdsMain6CDSDesigner10: TStringField;
    cdsMain6CDSDesigner11: TStringField;
    cdsMain6CDSDesigner12: TDateTimeField;
    cdsMain6CDSDesigner13: TStringField;
    cdsMain6CDSDesigner14: TStringField;
    cdsMain6CDSDesigner15: TStringField;
    cdsMain6CDSDesigner16: TDateTimeField;
    cdsMain6CDSDesigner17: TStringField;
    cdsMain6CDSDesigner18: TDateTimeField;
    cdsMain6CDSDesigner19: TStringField;
    cdsMain6CDSDesigner20: TStringField;
    cdsMain6CDSDesigner21: TBCDField;
    cdsMain6CDSDesigner22: TDateTimeField;
    cdsMain6CDSDesigner23: TStringField;
    cdsMain6CDSDesigner24: TStringField;
    cdsMain6CDSDesigner25: TDateTimeField;
    cdsMain6CDSDesigner26: TDateTimeField;
    cdsMain6CDSDesigner27: TStringField;
    cdsMain6CDSDesigner28: TBCDField;
    cdsMain6CDSDesigner29: TBCDField;
    cdsMain6CDSDesigner30: TBCDField;
    cdsMain6CDSDesigner31: TBCDField;
    cdsMain6CDSDesigner32: TBCDField;
    cdsMain6CDSDesigner33: TStringField;
    cdsMain6CDSDesigner34: TStringField;
    cdsMain6CDSDesigner35: TStringField;
    cdsMain6CDSDesigner36: TBooleanField;
    cds0043: TClientDataSet;
    cds0043unusual_cate: TWideStringField;
    cdsMain7: Tcds;
    DataSource7: TDataSource;
    cxTabSheet7: TcxTabSheet;
    cdsMain7CDSDesigner: TStringField;
    cdsMain7CDSDesigner2: TStringField;
    cdsMain7CDSDesigner4: TBCDField;
    Panel9: TPanel;
    dghMain7: TDBGridEh;
    Splitter1: TSplitter;
    Panel10: TPanel;
    cdsMain8: Tcds;
    DataSource8: TDataSource;
    cdsMain8CDSDesigner: TStringField;
    cdsMain8CDSDesigner2: TDateTimeField;
    cdsMain8CDSDesigner3: TStringField;
    cdsMain8CDSDesigner4: TStringField;
    cdsMain8CDSDesigner5: TStringField;
    cdsMain8CDSDesigner6: TStringField;
    cdsMain8CDSDesigner7: TStringField;
    cdsMain8CDSDesigner8: TStringField;
    cdsMain8CDSDesigner9: TStringField;
    cdsMain8CDSDesigner10: TDateTimeField;
    cdsMain8CDSDesigner11: TDateTimeField;
    cdsMain8CDSDesigner12: TDateTimeField;
    cdsMain8CDSDesigner13: TBCDField;
    cdsMain8CDSDesigner14: TBCDField;
    cdsMain7Empl_ptr: TIntegerField;
    dghMain8: TDBGridEh;
    cxTabSheet9: TcxTabSheet;
    dghMain9: TDBGridEh;
    DataSource9: TDataSource;
    cdsMain9: Tcds;
    cxTabSheet10: TcxTabSheet;
    dghMain10: TDBGridEh;
    cdsMain10: Tcds;
    DataSource10: TDataSource;
    cdsMain1CDSDesigner26: TBCDField;
    cdsMain1CDSDesigner27: TStringField;
    cdsMain1CDSDesigner28: TStringField;
    cdsMain1CDSDesigner29: TStringField;
    cdsMain1CDSDesigner25: TStringField;
    cdsMain1CDSDesigner30: TBCDField;
    cdsMainCDSDesigner24: TStringField;
    cdsMainCDSDesigner26: TBCDField;
    cdsMainCDSDesigner27: TBCDField;
    cdsMainCDSDesigner28: TStringField;
    cdsMainCDSDesigner29: TStringField;
    cdsMain2CDSDesigner23: TStringField;
    cdsMain2CDSDesigner24: TBCDField;
    cdsMain2CDSDesigner25: TStringField;
    cdsMain3CDSDesigner: TStringField;
    cdsMain3CDSDesigner2: TBCDField;
    cdsMain3CDSDesigner3: TBCDField;
    dghMain3: TDBGridEh;
    cdsMain4CDSDesigner24: TDateTimeField;
    cdsMain4CDSDesigner25: TDateTimeField;
    cdsMain4CDSDesigner8: TDateTimeField;
    cdsMain4CDSDesigner9: TStringField;
    cdsMain5CDSDesigner: TStringField;
    cdsMain5CDSDesigner2: TDateTimeField;
    cdsMain5CDSDesigner3: TDateTimeField;
    cdsMain9CDSDesigner: TStringField;
    cdsMain9CDSDesigner2: TStringField;
    cdsMain9CDSDesigner3: TStringField;
    cdsMain9CDSDesigner4: TStringField;
    cdsMain9CDSDesigner5: TStringField;
    cdsMain9CDSDesigner6: TStringField;
    cdsMain9CDSDesigner7: TStringField;
    cdsMain9CDSDesigner8: TStringField;
    cdsMain9CDSDesigner9: TStringField;
    cdsMain9CDSDesigner10: TStringField;
    cdsMain9CDSDesigner11: TStringField;
    cdsMain9CDSDesigner12: TDateTimeField;
    cdsMain9CDSDesigner13: TStringField;
    cdsMain9CDSDesigner14: TDateTimeField;
    cdsMain9CDSDesigner15: TBCDField;
    cdsMain9CDSDesigner16: TBCDField;
    cdsMain9CDSDesigner17: TStringField;
    cdsMain10CDSDesigner: TStringField;
    cdsMain10CDSDesigner2: TStringField;
    cdsMain10CDSDesigner3: TStringField;
    cdsMain10CDSDesigner4: TStringField;
    cdsMain10CDSDesigner5: TStringField;
    cdsMain10CDSDesigner6: TStringField;
    cdsMain10CDSDesigner7: TStringField;
    cdsMain10CDSDesigner8: TStringField;
    cdsMain10CDSDesigner9: TStringField;
    cdsMain10CDSDesigner10: TStringField;
    cdsMain10CDSDesigner11: TStringField;
    cdsMain10CDSDesigner12: TDateTimeField;
    cdsMain10CDSDesigner13: TStringField;
    cdsMain10CDSDesigner14: TDateTimeField;
    cdsMain10CDSDesigner15: TBCDField;
    cdsMain10CDSDesigner16: TBCDField;
    cdsMain10CDSDesigner17: TStringField;
    cdsMain9CDSDesigner18: TStringField;
    cdsMain10CDSDesigner18: TStringField;
    cxTabSheet11: TcxTabSheet;
    cxTabSheet12: TcxTabSheet;
    Panel11: TPanel;
    dghMain11: TDBGridEh;
    Splitter2: TSplitter;
    Panel12: TPanel;
    dghMain11_1: TDBGridEh;
    cdsMain11: Tcds;
    DataSource11: TDataSource;
    cdsMain11_1: Tcds;
    DataSource11_1: TDataSource;
    cdsMain11_1CDSDesigner: TStringField;
    cdsMain11_1CDSDesigner2: TStringField;
    cdsMain11_1CDSDesigner3: TFloatField;
    cdsMain11_1CDSDesigner4: TFloatField;
    cdsMain11_1CDSDesigner5: TStringField;
    cdsMain11_1CDSDesigner6: TBCDField;
    Panel13: TPanel;
    dghMain12: TDBGridEh;
    Splitter3: TSplitter;
    Panel14: TPanel;
    dghMain12_1: TDBGridEh;
    cdsMain12: Tcds;
    DataSource12: TDataSource;
    cdsMain12_1: Tcds;
    StringField40: TStringField;
    StringField41: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField42: TStringField;
    BCDField3: TBCDField;
    DataSource12_1: TDataSource;
    cdsMain12CDSDesigner: TDateTimeField;
    cdsMain12CDSDesigner2: TStringField;
    cdsMain12CDSDesigner3: TStringField;
    cdsMain12CDSDesigner4: TStringField;
    cdsMain12CDSDesigner5: TStringField;
    cdsMain12CDSDesigner6: TStringField;
    cdsMain12CDSDesigner7: TStringField;
    cdsMain12CDSDesigner8: TBCDField;
    cdsMain13: Tcds;
    DataSource13: TDataSource;
    cdsMain13_1: Tcds;
    StringField39: TStringField;
    StringField43: TStringField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField44: TStringField;
    BCDField4: TBCDField;
    DataSource13_1: TDataSource;
    cxTabSheet13: TcxTabSheet;
    Panel15: TPanel;
    dghMain13: TDBGridEh;
    Splitter4: TSplitter;
    Panel16: TPanel;
    cdsMain12CDSDesigner9: TDateTimeField;
    DBGridEh1: TDBGridEh;
    cxTabSheet14: TcxTabSheet;
    dghMain14: TDBGridEh;
    cdsMain14: Tcds;
    DataSource14: TDataSource;
    cdsMain14CDSDesigner: TStringField;
    cdsMain14CDSDesigner2: TDateTimeField;
    cdsMain14CDSDesigner3: TStringField;
    cdsMain14CDSDesigner4: TStringField;
    cdsMain14CDSDesigner5: TStringField;
    cdsMain14CDSDesigner6: TDateTimeField;
    cdsMain14CDSDesigner7: TStringField;
    cdsMain14CDSDesigner8: TBCDField;
    cdsMain14CDSDesigner10: TStringField;
    cdsMain14CDSDesigner11: TStringField;
    cdsMain14CDSDesigner12: TStringField;
    cxTabSheet15: TcxTabSheet;
    cdsMain11DATA0567RKEY: TIntegerField;
    cdsMain11CDSDesigner: TStringField;
    cdsMain11CDSDesigner2: TStringField;
    cdsMain11CDSDesigner3: TStringField;
    cdsMain11CDSDesigner4: TStringField;
    cdsMain11CDSDesigner5: TStringField;
    cdsMain11CDSDesigner6: TStringField;
    cdsMain11CDSDesigner7: TStringField;
    cdsMain11CDSDesigner8: TDateTimeField;
    cdsMain11DATA0835RKEY: TIntegerField;
    cdsMain11CDSDesigner9: TStringField;
    cdsMain11CDSDesigner10: TStringField;
    cdsMain11CDSDesigner11: TStringField;
    cdsMain11CDSDesigner13: TStringField;
    cdsMain11CDSDesigner14: TStringField;
    cdsMain11CDSDesigner15: TDateTimeField;
    cdsMain11CDSDesigner16: TBCDField;
    cdsMain12data0831rkey: TIntegerField;
    cdsMain12DATA0567RKEY: TIntegerField;
    cdsMain12CDSDesigner10: TStringField;
    cdsMain12CDSDesigner11: TStringField;
    cdsMain12CDSDesigner12: TDateTimeField;
    cdsMain13data0835rkey: TIntegerField;
    cdsMain13CDSDesigner: TStringField;
    cdsMain13CDSDesigner2: TStringField;
    cdsMain13CDSDesigner3: TStringField;
    cdsMain13CDSDesigner5: TStringField;
    cdsMain13CDSDesigner6: TStringField;
    cdsMain13CDSDesigner7: TDateTimeField;
    cdsMain13data0567rkey: TIntegerField;
    cdsMain13CDSDesigner8: TStringField;
    cdsMain13CDSDesigner9: TStringField;
    cdsMain13CDSDesigner10: TStringField;
    cdsMain13CDSDesigner11: TStringField;
    cdsMain13CDSDesigner12: TStringField;
    cdsMain13CDSDesigner13: TStringField;
    cdsMain13CDSDesigner14: TStringField;
    cdsMain13CDSDesigner15: TDateTimeField;
    cdsMain13CDSDesigner16: TBCDField;
    dghMain15: TDBGridEh;
    cdsMain15: Tcds;
    DataSource15: TDataSource;
    cdsMain15CDSDesigner: TStringField;
    cdsMain15CDSDesigner2: TStringField;
    cdsMain15CDSDesigner3: TStringField;
    cdsMain15rkey: TIntegerField;
    cdsMain15INVENT_PTR: TIntegerField;
    cdsMain15CDSDesigner4: TStringField;
    cdsMain15CDSDesigner5: TDateTimeField;
    cdsMain15CDSDesigner6: TStringField;
    cdsMain15CDSDesigner7: TStringField;
    cdsMain15CDSDesigner8: TStringField;
    cdsMain15CDSDesigner9: TStringField;
    cdsMain15CDSDesigner10: TStringField;
    cdsMain15CDSDesigner11: TStringField;
    cdsMain15CDSDesigner12: TStringField;
    cdsMain15CDSDesigner13: TStringField;
    cdsMain15CDSDesigner14: TDateTimeField;
    cdsMain15CDSDesigner15: TStringField;
    cdsMain15CDSDesigner16: TStringField;
    cdsMain15CDSDesigner17: TStringField;
    cdsMain15DEPT_PTR: TIntegerField;
    cdsMain15CDSDesigner18: TStringField;
    cdsMain15CDSDesigner19: TStringField;
    cdsMain15CDSDesigner20: TStringField;
    cdsMain15CDSDesigner21: TStringField;
    cdsMain15CDSDesigner22: TStringField;
    cdsMain15CDSDesigner23: TFloatField;
    cdsMain15CDSDesigner24: TFloatField;
    cxTabSheet16: TcxTabSheet;
    cdsMain16: Tcds;
    DataSource16: TDataSource;
    dghMain16: TDBGridEh;
    cdsMain16_2: Tcds;
    cdsMain11_1CDSDesigner7: TStringField;
    cdsMain11_1CDSDesigner8: TDateTimeField;
    cdsMain11_1CDSDesigner9: TStringField;
    cdsMain12_1CDSDesigner: TStringField;
    cdsMain12_1CDSDesigner2: TDateTimeField;
    cdsMain12_1CDSDesigner3: TStringField;
    cdsMain13_1CDSDesigner: TStringField;
    cdsMain13_1CDSDesigner2: TDateTimeField;
    cdsMain13_1CDSDesigner3: TStringField;
    cxTabSheet17: TcxTabSheet;
    dghMain17: TDBGridEh;
    cdsMain17: Tcds;
    DataSource17: TDataSource;
    cdsMain17_1: Tcds;
    cdsMain16_1: Tcds;
    PF0: TPanel;
    GroupBox9: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    PF0_dteEnd: TDateTimePicker;
    PF0_dteBegin: TDateTimePicker;
    PF0_dteBeginTime: TDateTimePicker;
    PF0_dteEndTime: TDateTimePicker;
    GroupBox10: TGroupBox;
    PF0_cbx: TComboBox;
    PF0_Find: TSpeedButton;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    Label2: TLabel;
    dteEnd: TDateTimePicker;
    dteBegin: TDateTimePicker;
    dteBeginTime: TDateTimePicker;
    dteEndTime: TDateTimePicker;
    GroupBox11: TGroupBox;
    Label12: TLabel;
    PF0_Edit_Day: TEdit;
    GroupBox6: TGroupBox;
    Label5: TLabel;
    Edit4: TEdit;
    GroupBox8: TGroupBox;
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Edit2: TEdit;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    Edit3: TEdit;
    PF1: TPanel;
    SpeedButton1: TSpeedButton;
    GroupBox12: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    PF1_dteEnd: TDateTimePicker;
    PF1_dteBegin: TDateTimePicker;
    PF1_dteBeginTime: TDateTimePicker;
    PF1_dteEndTime: TDateTimePicker;
    GroupBox13: TGroupBox;
    PF1_cbx: TComboBox;
    GroupBox14: TGroupBox;
    Label16: TLabel;
    PF1_Edit_Day: TEdit;
    PF2: TPanel;
    PF2_Find: TSpeedButton;
    GroupBox15: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    PF2_dteEnd: TDateTimePicker;
    PF2_dteBegin: TDateTimePicker;
    PF2_dteBeginTime: TDateTimePicker;
    PF2_dteEndTime: TDateTimePicker;
    GroupBox16: TGroupBox;
    PF2_cbx: TComboBox;
    GroupBox17: TGroupBox;
    Label19: TLabel;
    PF2_Edit_H: TEdit;
    PF3: TPanel;
    PF3_Find: TSpeedButton;
    GroupBox18: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    PF3_dteEnd: TDateTimePicker;
    PF3_dteBegin: TDateTimePicker;
    PF3_dteBeginTime: TDateTimePicker;
    PF3_dteEndTime: TDateTimePicker;
    GroupBox19: TGroupBox;
    PF3_cbx: TComboBox;
    GroupBox20: TGroupBox;
    Label22: TLabel;
    PF3_Edit_H: TEdit;
    PF4: TPanel;
    GroupBox21: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    PF4_dteEnd: TDateTimePicker;
    PF4_dteBegin: TDateTimePicker;
    PF4_dteBeginTime: TDateTimePicker;
    PF4_dteEndTime: TDateTimePicker;
    GroupBox22: TGroupBox;
    PF4_cbx: TComboBox;
    GroupBox23: TGroupBox;
    Label25: TLabel;
    PF4_Edit_H: TEdit;
    Panel8: TPanel;
    SpeedButton2: TSpeedButton;
    GroupBox24: TGroupBox;
    Label26: TLabel;
    PF4_Edit_Day: TEdit;
    GroupBox25: TGroupBox;
    Label27: TLabel;
    PF4_Edit_A: TEdit;
    Panel18: TPanel;
    PF4_Find: TSpeedButton;
    PF5: TPanel;
    GroupBox26: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    PF5_dteEnd: TDateTimePicker;
    PF5_dteBegin: TDateTimePicker;
    PF5_dteBeginTime: TDateTimePicker;
    PF5_dteEndTime: TDateTimePicker;
    GroupBox27: TGroupBox;
    PF5_cbx: TComboBox;
    GroupBox29: TGroupBox;
    Label31: TLabel;
    PF5_Edit_Day: TEdit;
    GroupBox30: TGroupBox;
    Label32: TLabel;
    PF5_Edit_A: TEdit;
    Panel19: TPanel;
    PF5_Find: TSpeedButton;
    PF6: TPanel;
    GroupBox28: TGroupBox;
    Label30: TLabel;
    Label33: TLabel;
    PF6_dteEnd: TDateTimePicker;
    PF6_dteBegin: TDateTimePicker;
    PF6_dteBeginTime: TDateTimePicker;
    PF6_dteEndTime: TDateTimePicker;
    GroupBox31: TGroupBox;
    PF6_cbx: TComboBox;
    PF9: TPanel;
    GroupBox33: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    PF9_dteEnd: TDateTimePicker;
    PF9_dteBegin: TDateTimePicker;
    PF9_dteBeginTime: TDateTimePicker;
    PF9_dteEndTime: TDateTimePicker;
    GroupBox34: TGroupBox;
    PF9_cbx: TComboBox;
    Panel21: TPanel;
    SpeedButton3: TSpeedButton;
    GroupBox35: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    GroupBox36: TGroupBox;
    Label37: TLabel;
    PF6_Edit_H: TEdit;
    Panel17: TPanel;
    SpeedButton4: TSpeedButton;
    PF10: TPanel;
    GroupBox5: TGroupBox;
    Label34: TLabel;
    Label38: TLabel;
    PF10_dteEnd: TDateTimePicker;
    PF10_dteBegin: TDateTimePicker;
    PF10_dteBeginTime: TDateTimePicker;
    PF10_dteEndTime: TDateTimePicker;
    GroupBox32: TGroupBox;
    PF10_cbx: TComboBox;
    Panel22: TPanel;
    SpeedButton5: TSpeedButton;
    PF7: TPanel;
    GroupBox37: TGroupBox;
    Label39: TLabel;
    Label40: TLabel;
    PF7_dteEnd: TDateTimePicker;
    PF7_dteBegin: TDateTimePicker;
    PF7_dteBeginTime: TDateTimePicker;
    PF7_dteEndTime: TDateTimePicker;
    GroupBox38: TGroupBox;
    PF7_cbx: TComboBox;
    Panel23: TPanel;
    SpeedButton6: TSpeedButton;
    cdsMain7CDSDesigner3: TStringField;
    PF11: TPanel;
    GroupBox39: TGroupBox;
    Label41: TLabel;
    Label42: TLabel;
    PF11_dteEnd: TDateTimePicker;
    PF11_dteBegin: TDateTimePicker;
    PF11_dteBeginTime: TDateTimePicker;
    PF11_dteEndTime: TDateTimePicker;
    GroupBox40: TGroupBox;
    PF11_cbx: TComboBox;
    Panel24: TPanel;
    SpeedButton7: TSpeedButton;
    GroupBox41: TGroupBox;
    Label43: TLabel;
    PF11_Edit7: TEdit;
    PF13: TPanel;
    GroupBox42: TGroupBox;
    Label44: TLabel;
    Label45: TLabel;
    PF13_dteEnd: TDateTimePicker;
    PF13_dteBegin: TDateTimePicker;
    PF13_dteBeginTime: TDateTimePicker;
    PF13_dteEndTime: TDateTimePicker;
    GroupBox43: TGroupBox;
    PF13_cbx: TComboBox;
    Panel25: TPanel;
    SpeedButton8: TSpeedButton;
    GroupBox44: TGroupBox;
    Label46: TLabel;
    PF13_Edit7: TEdit;
    PF12: TPanel;
    GroupBox45: TGroupBox;
    Label47: TLabel;
    Label48: TLabel;
    PF12_dteEnd: TDateTimePicker;
    PF12_dteBegin: TDateTimePicker;
    PF12_dteBeginTime: TDateTimePicker;
    PF12_dteEndTime: TDateTimePicker;
    GroupBox46: TGroupBox;
    PF12_cbx: TComboBox;
    Panel27: TPanel;
    SpeedButton9: TSpeedButton;
    GroupBox47: TGroupBox;
    Label49: TLabel;
    PF12_Edit8: TEdit;
    PF14: TPanel;
    GroupBox48: TGroupBox;
    Label50: TLabel;
    Label51: TLabel;
    PF14_dteEnd: TDateTimePicker;
    PF14_dteBegin: TDateTimePicker;
    PF14_dteBeginTime: TDateTimePicker;
    PF14_dteEndTime: TDateTimePicker;
    GroupBox49: TGroupBox;
    PF14_cbx: TComboBox;
    Panel26: TPanel;
    SpeedButton10: TSpeedButton;
    GroupBox50: TGroupBox;
    Label52: TLabel;
    P14_Edit7: TEdit;
    GroupBox51: TGroupBox;
    Label53: TLabel;
    PF14_Edit8: TEdit;
    PF15: TPanel;
    GroupBox52: TGroupBox;
    Label54: TLabel;
    Label55: TLabel;
    PF15_dteEnd: TDateTimePicker;
    PF15_dteBegin: TDateTimePicker;
    PF15_dteBeginTime: TDateTimePicker;
    PF15_dteEndTime: TDateTimePicker;
    GroupBox53: TGroupBox;
    PF15_cbx: TComboBox;
    Panel28: TPanel;
    SpeedButton11: TSpeedButton;
    GroupBox54: TGroupBox;
    Label56: TLabel;
    PF15_Edit7: TEdit;
    GroupBox55: TGroupBox;
    Label57: TLabel;
    PF15_Edit8: TEdit;
    cdsMain14CDSDesigner13: TStringField;
    PF16: TPanel;
    GroupBox57: TGroupBox;
    PF16_cbx: TComboBox;
    Panel29: TPanel;
    SpeedButton12: TSpeedButton;
    PF17: TPanel;
    Panel30: TPanel;
    SpeedButton13: TSpeedButton;
    GroupBox7: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    PF16_dteBegin: TDateTimePicker;
    PF16_Edit5: TEdit;
    PF16_dteEnd: TDateTimePicker;
    GroupBox56: TGroupBox;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    PF17_dteBegin: TDateTimePicker;
    PF17_Edit7: TEdit;
    PF17_dteEnd: TDateTimePicker;
    cxTabSheet18: TcxTabSheet;
    cdsMain18: Tcds;
    DataSource18: TDataSource;
    PF18: TPanel;
    GroupBox58: TGroupBox;
    Label9: TLabel;
    Label61: TLabel;
    PF18_dteEnd: TDateTimePicker;
    PF18_dteBegin: TDateTimePicker;
    PF18_dteBeginTime: TDateTimePicker;
    PF18_dteEndTime: TDateTimePicker;
    GroupBox59: TGroupBox;
    PF18_cbx: TComboBox;
    Panel31: TPanel;
    SpeedButton14: TSpeedButton;
    dghMain18: TDBGridEh;
    cdsMain18CDSDesigner: TStringField;
    cdsMain18CDSDesigner2: TStringField;
    cdsMain18CDSDesigner3: TStringField;
    cdsMain18CDSDesigner4: TStringField;
    cdsMain18CDSDesigner5: TStringField;
    cdsMain18CDSDesigner6: TStringField;
    cdsMain18CDSDesigner7: TStringField;
    cdsMain18CDSDesigner8: TStringField;
    cdsMain18CDSDesigner9: TStringField;
    cdsMain18CDSDesigner10: TStringField;
    cdsMain18CDSDesigner11: TStringField;
    cdsMain18CDSDesigner12: TDateTimeField;
    cdsMain18CDSDesigner13: TStringField;
    cdsMain18CDSDesigner14: TStringField;
    cdsMain18CDSDesigner15: TStringField;
    cdsMain18CDSDesigner16: TDateTimeField;
    cdsMain18CDSDesigner17: TStringField;
    cdsMain18CDSDesigner18: TDateTimeField;
    cdsMain18CDSDesigner19: TStringField;
    cdsMain18CDSDesigner20: TStringField;
    cdsMain18CDSDesigner21: TBCDField;
    cdsMain18CDSDesigner22: TStringField;
    cdsMain18CDSDesigner23: TBCDField;
    cdsMain18CDSDesigner24: TBCDField;
    cdsMain18CDSDesigner25: TStringField;
    cdsMain18CDSDesigner26: TStringField;
    cdsMain18CDSDesigner27: TBooleanField;
    cds1: Tcds;
    cdsMain2CDSDesigner26: TBCDField;
    cdsMain1CDSDesigner31: TBCDField;
    cdsMainCDSDesigner30: TBCDField;
    cdsMain3CDSDesigner4: TBCDField;
    cdsMain4CDSDesigner20: TBCDField;
    cdsMain5CDSDesigner4: TBCDField;
    cdsMain9CDSDesigner19: TBCDField;
    cdsMain10CDSDesigner19: TBCDField;
    cdsMain16_3: TADOQuery;
    cdsMain14CDSDesigner9: TBCDField;
    cdsMain15CDSDesigner25: TBCDField;
    procedure BtFindClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dteBeginChange(Sender: TObject);
    procedure dteEndChange(Sender: TObject);
    procedure cxTabSheet2Enter(Sender: TObject);
    procedure cxPageControl2Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DghMainEnter(Sender: TObject);
    procedure actExportExecute(Sender: TObject);
    procedure DghMain1Enter(Sender: TObject);
    procedure DghMain2Enter(Sender: TObject);
    procedure DghMain3Enter(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure cdsMain7AfterScroll(DataSet: TDataSet);
    procedure cdsMain7AfterClose(DataSet: TDataSet);
    procedure cdsMain7AfterOpen(DataSet: TDataSet);
    procedure BCDField9GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure BCDField6GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure BCDField16GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure BCDField23GetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cdsMain4CDSDesigner12GetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure CheckBox1Click(Sender: TObject);
    procedure cdsMain11AfterClose(DataSet: TDataSet);
    procedure cdsMain11AfterScroll(DataSet: TDataSet);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4Change(Sender: TObject);
    procedure cdsMain12AfterClose(DataSet: TDataSet);
    procedure cdsMain12AfterScroll(DataSet: TDataSet);
    procedure cdsMain13AfterClose(DataSet: TDataSet);
    procedure cdsMain13AfterScroll(DataSet: TDataSet);
    procedure cdsMain16AfterOpen(DataSet: TDataSet);
    procedure dghMain16DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure PF16_dteBeginChange(Sender: TObject);
    procedure PF16_dteBeginCloseUp(Sender: TObject);
    procedure PF16_dteEndCloseUp(Sender: TObject);
    procedure PF16_dteEndChange(Sender: TObject);
    procedure PF16_Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure cdsMain17AfterOpen(DataSet: TDataSet);
    procedure ComboBox1Change(Sender: TObject);
    procedure PF0_cbxChange(Sender: TObject);
    procedure PF0_dteBeginChange(Sender: TObject);
    procedure PF0_dteEndChange(Sender: TObject);
    procedure PF0_Edit_DayChange(Sender: TObject);
    procedure PF1_cbxChange(Sender: TObject);
    procedure PF1_dteBeginChange(Sender: TObject);
    procedure PF1_dteEndChange(Sender: TObject);
    procedure PF1_Edit_DayChange(Sender: TObject);
    procedure PF2_cbxChange(Sender: TObject);
    procedure PF2_dteBeginChange(Sender: TObject);
    procedure PF2_dteEndChange(Sender: TObject);
    procedure PF2_Edit_HChange(Sender: TObject);
    procedure PF3_cbxChange(Sender: TObject);
    procedure PF3_dteBeginChange(Sender: TObject);
    procedure PF3_dteEndChange(Sender: TObject);
    procedure PF3_Edit_HChange(Sender: TObject);
    procedure PF4_cbxChange(Sender: TObject);
    procedure PF4_dteBeginChange(Sender: TObject);
    procedure PF4_dteEndChange(Sender: TObject);
    procedure PF4_Edit_DayChange(Sender: TObject);
    procedure PF4_Edit_HChange(Sender: TObject);
    procedure PF4_Edit_AChange(Sender: TObject);
    procedure PF5_cbxChange(Sender: TObject);
    procedure PF5_dteBeginChange(Sender: TObject);
    procedure PF5_dteEndChange(Sender: TObject);
    procedure PF5_Edit_DayChange(Sender: TObject);
    procedure PF6_dteBeginChange(Sender: TObject);
    procedure PF6_dteEndChange(Sender: TObject);
    procedure PF6_Edit_HChange(Sender: TObject);
    procedure PF9_cbxChange(Sender: TObject);
    procedure PF9_dteBeginChange(Sender: TObject);
    procedure PF9_dteEndChange(Sender: TObject);
    procedure PF10_cbxChange(Sender: TObject);
    procedure PF10_dteBeginChange(Sender: TObject);
    procedure PF10_dteEndChange(Sender: TObject);
    procedure PF7_cbxChange(Sender: TObject);
    procedure PF7_dteBeginChange(Sender: TObject);
    procedure PF7_dteEndChange(Sender: TObject);
    procedure PF11_cbxChange(Sender: TObject);
    procedure PF11_dteEndChange(Sender: TObject);
    procedure PF11_dteBeginChange(Sender: TObject);
    procedure PF11_Edit7Change(Sender: TObject);
    procedure PF12_cbxChange(Sender: TObject);
    procedure PF13_cbxChange(Sender: TObject);
    procedure PF12_dteBeginChange(Sender: TObject);
    procedure PF13_dteBeginChange(Sender: TObject);
    procedure PF12_dteEndChange(Sender: TObject);
    procedure PF13_dteEndChange(Sender: TObject);
    procedure PF12_Edit8Change(Sender: TObject);
    procedure PF13_Edit7Change(Sender: TObject);
    procedure PF14_cbxChange(Sender: TObject);
    procedure PF14_dteBeginChange(Sender: TObject);
    procedure PF14_dteEndChange(Sender: TObject);
    procedure P14_Edit7Change(Sender: TObject);
    procedure PF14_Edit8Change(Sender: TObject);
    procedure PF15_cbxChange(Sender: TObject);
    procedure PF15_dteBeginChange(Sender: TObject);
    procedure PF15_dteEndChange(Sender: TObject);
    procedure PF15_Edit7Change(Sender: TObject);
    procedure PF15_Edit8Change(Sender: TObject);
    procedure PF17_dteBeginChange(Sender: TObject);
    procedure PF17_dteEndChange(Sender: TObject);
    procedure PF16_cbxChange(Sender: TObject);
    procedure PF18_dteBeginChange(Sender: TObject);
    procedure PF18_dteEndChange(Sender: TObject);
    procedure PF18_cbxChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
   // ActiveGridEH:TDBGridEh;
    { Private declarations }
  public
    procedure RightsSetDataSetReadOnly;override;
    procedure FindData(); override;
    { Public declarations }
  end;

var
  frm_EquiMainAnal: Tfrm_EquiMainAnal;

implementation

uses PublicFile, DM_f, Findcds_unt;

{$R *.dfm}

procedure Tfrm_EquiMainAnal.FindData();
begin
  if cxPageControl2.ActivePage=cxTabSheet0 then
  begin
    FindNotDisplayFields:= VarArrayOf(['工厂']);
    Find_Def_FieldName  := VarArrayOf(['故障日期']);
    Find_Def_Oper       := VarArrayOf(['BETWEEN']);
    Find_Def_FieldValue := VarArrayOf([cdsMain.Params.ParamByName('SD').Value]);
    Find_Def_Field2Value:= VarArrayOf([cdsMain.Params.ParamByName('ED').Value]);
    if ShowfrmFindcds(cdsMain,frmFindOutSQL,DropDown_Info_List,FindNotDisplayFields,FindDisplayFields,FindFieldsName,
    FindQueryFieldsName,Find_Def_FieldName,Find_Def_Oper,Find_Def_FieldValue,Find_Def_Field2Value) then
    begin
      cdsMain.Close;
      if  cdsMain.F_SQLWhere='' then
        cdsMain.CommandText:= cdsMain.F_SQLSelectFrom+#13+'where '+frmFindOutSQL
      else
        cdsMain.CommandText:= cdsMain.F_SQLSelectFrom+#13+cdsMain.F_SQLWhere+#13+'and '+frmFindOutSQL ;

      if  cdsMain.F_SQLOrderBy<>'' then
      cdsMain.CommandText:=cdsMain.CommandText+#13+cdsMain.F_SQLOrderBy;
      cdsMain.Open;
    end;
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet1 then
  begin
    FindNotDisplayFields:= VarArrayOf(['工厂']);
    Find_Def_FieldName  := VarArrayOf(['故障日期']);
    Find_Def_Oper       := VarArrayOf(['BETWEEN']);
    Find_Def_FieldValue := VarArrayOf([cdsMain1.Params.ParamByName('SD').Value]);
    Find_Def_Field2Value:= VarArrayOf([cdsMain1.Params.ParamByName('ED').Value]);
    if ShowfrmFindcds(cdsMain1,frmFindOutSQL,DropDown_Info_List,FindNotDisplayFields,FindDisplayFields,FindFieldsName,
    FindQueryFieldsName,Find_Def_FieldName,Find_Def_Oper,Find_Def_FieldValue,Find_Def_Field2Value) then
    with cdsMain1  do
    begin
      Close;
      if  F_SQLWhere='' then
        CommandText:= F_SQLSelectFrom+#13+'where '+frmFindOutSQL
      else
        CommandText:= F_SQLSelectFrom+#13+F_SQLWhere+#13+'and '+frmFindOutSQL ;

      if  F_SQLOrderBy<>'' then
      CommandText:=CommandText+#13+F_SQLOrderBy;
      Open;
    end;
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet2 then
  begin
    FindNotDisplayFields:=VarArrayOf(['工厂','故障日期','实际维修时间']);
    Find_Def_FieldName  := VarArrayOf(['']);
    Find_Def_Oper       := VarArrayOf(['']);
    Find_Def_FieldValue := VarArrayOf(['']);
    Find_Def_Field2Value:= VarArrayOf(['']);
    if ShowfrmFindcds(cdsMain2,frmFindOutSQL,DropDown_Info_List,FindNotDisplayFields,FindDisplayFields,FindFieldsName,
    FindQueryFieldsName,Find_Def_FieldName,Find_Def_Oper,Find_Def_FieldValue,Find_Def_Field2Value) then
    with cdsMain2  do
    begin
      Close;
      if  F_SQLWhere='' then
        CommandText:= F_SQLSelectFrom+#13+'where '+frmFindOutSQL
      else
        CommandText:= F_SQLSelectFrom+#13+F_SQLWhere+#13+'and '+frmFindOutSQL ;

      if  F_SQLOrderBy<>'' then
      CommandText:=CommandText+#13+F_SQLOrderBy;
      Open;
    end;
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet3 then
  begin
    FindNotDisplayFields:=VarArrayOf(['工厂','故障日期','实际维修时间']);
    Find_Def_FieldName  := VarArrayOf(['']);
    Find_Def_Oper       := VarArrayOf(['']);
    Find_Def_FieldValue := VarArrayOf(['']);
    Find_Def_Field2Value:= VarArrayOf(['']);
    if ShowfrmFindcds(cdsMain3,frmFindOutSQL,DropDown_Info_List,FindNotDisplayFields,FindDisplayFields,FindFieldsName,
    FindQueryFieldsName,Find_Def_FieldName,Find_Def_Oper,Find_Def_FieldValue,Find_Def_Field2Value) then
    with cdsMain3  do
    begin
      Close;
      if  F_SQLWhere='' then
        CommandText:= F_SQLSelectFrom+#13+'where '+frmFindOutSQL
      else
        CommandText:= F_SQLSelectFrom+#13+F_SQLWhere+#13+'and '+frmFindOutSQL ;

      if  F_SQLOrderBy<>'' then
      CommandText:=CommandText+#13+F_SQLOrderBy;
      Open;
    end;
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet4 then
  begin
    FindNotDisplayFields:=VarArrayOf(['工厂','实际维修时间','状态','达成率','间隔天','影响程度']);// ,'异常类别'
    if ShowfrmFindcds(cdsMain4,frmFindOutSQL,DropDown_Info_List,FindNotDisplayFields,FindDisplayFields,FindFieldsName,
    FindQueryFieldsName,Find_Def_FieldName,Find_Def_Oper,Find_Def_FieldValue,Find_Def_Field2Value) then
    with cdsMain4  do
    begin
      Close;
      if  F_SQLWhere='' then
        CommandText:= F_SQLSelectFrom+#13+'where '+frmFindOutSQL
      else
        CommandText:= F_SQLSelectFrom+#13+F_SQLWhere+#13+'and '+frmFindOutSQL ;

      if  F_SQLOrderBy<>'' then
      CommandText:=CommandText+#13+F_SQLOrderBy;
      Open;
    end;
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet5 then
  begin
    FindNotDisplayFields:=VarArrayOf(['工厂','状态','达成率','间隔天','影响程度']);// ,'异常类别'
    if ShowfrmFindcds(cdsMain5,frmFindOutSQL,DropDown_Info_List,FindNotDisplayFields,FindDisplayFields,FindFieldsName,
    FindQueryFieldsName,Find_Def_FieldName,Find_Def_Oper,Find_Def_FieldValue,Find_Def_Field2Value) then
    with cdsMain5  do
    begin
      Close;
      if  F_SQLWhere='' then
        CommandText:= F_SQLSelectFrom+#13+'where '+frmFindOutSQL
      else
        CommandText:= F_SQLSelectFrom+#13+F_SQLWhere+#13+'and '+frmFindOutSQL ;

      if  F_SQLOrderBy<>'' then
      CommandText:=CommandText+#13+F_SQLOrderBy;
      Open;
    end;
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet6 then
  begin
    FindNotDisplayFields:=VarArrayOf(['工厂']);
    if ShowfrmFindcds(cdsMain6,frmFindOutSQL,DropDown_Info_List,FindNotDisplayFields,FindDisplayFields,FindFieldsName,
    FindQueryFieldsName,Find_Def_FieldName,Find_Def_Oper,Find_Def_FieldValue,Find_Def_Field2Value) then
    with cdsMain6  do
    begin
      Close;
      if  F_SQLWhere='' then
        CommandText:= F_SQLSelectFrom+#13+'where '+frmFindOutSQL
      else
        CommandText:= F_SQLSelectFrom+#13+F_SQLWhere+#13+'and '+frmFindOutSQL ;

      if  F_SQLOrderBy<>'' then
      CommandText:=CommandText+#13+F_SQLOrderBy;
      Open;
    end;
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet7 then
  begin
    FindNotDisplayFields:= VarArrayOf(['工厂','Empl_ptr']);
    if ShowfrmFindcds(cdsMain7,frmFindOutSQL,DropDown_Info_List,FindNotDisplayFields,FindDisplayFields,FindFieldsName,
    FindQueryFieldsName,Find_Def_FieldName,Find_Def_Oper,Find_Def_FieldValue,Find_Def_Field2Value) then
    with cdsMain7  do
    begin
      Close;
      if  F_SQLWhere='' then
        CommandText:= F_SQLSelectFrom+#13+'where '+frmFindOutSQL
      else
        CommandText:= F_SQLSelectFrom+#13+F_SQLWhere+#13+'and '+frmFindOutSQL ;

      if  F_SQLOrderBy<>'' then
      CommandText:=CommandText+#13+F_SQLOrderBy;
      Open;
    end;
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet9 then
  begin
    FindNotDisplayFields:=VarArrayOf(['工厂','异常类别']); //'实际维修时间',
    if ShowfrmFindcds(cdsMain9,frmFindOutSQL,DropDown_Info_List,FindNotDisplayFields,FindDisplayFields,FindFieldsName,
    FindQueryFieldsName,Find_Def_FieldName,Find_Def_Oper,Find_Def_FieldValue,Find_Def_Field2Value) then
    with cdsMain9  do
    begin
      Close;
      if  F_SQLWhere='' then
        CommandText:= F_SQLSelectFrom+#13+'where '+frmFindOutSQL
      else
        CommandText:= F_SQLSelectFrom+#13+F_SQLWhere+#13+'and '+frmFindOutSQL ;

      if  F_SQLOrderBy<>'' then
      CommandText:=CommandText+#13+F_SQLOrderBy;
      Open;
    end;
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet10 then
  begin
    FindNotDisplayFields:=VarArrayOf(['工厂','异常类别']); //'实际维修时间',
    if ShowfrmFindcds(cdsMain10,frmFindOutSQL,DropDown_Info_List,FindNotDisplayFields,FindDisplayFields,FindFieldsName,
    FindQueryFieldsName,Find_Def_FieldName,Find_Def_Oper,Find_Def_FieldValue,Find_Def_Field2Value) then
    with cdsMain10  do
    begin
      Close;
      if  F_SQLWhere='' then
        CommandText:= F_SQLSelectFrom+#13+'where '+frmFindOutSQL
      else
        CommandText:= F_SQLSelectFrom+#13+F_SQLWhere+#13+'and '+frmFindOutSQL ;

      if  F_SQLOrderBy<>'' then
      CommandText:=CommandText+#13+F_SQLOrderBy;
      Open;
    end;
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet11 then
  begin
    FindNotDisplayFields:= VarArrayOf(['工厂','DATA0567RKEY','DATA0835RKEY','故障日期','受理日期','金额(本币含税)']);
    if ShowfrmFindcds(cdsMain11,frmFindOutSQL,DropDown_Info_List,FindNotDisplayFields,FindDisplayFields,FindFieldsName,
    FindQueryFieldsName,Find_Def_FieldName,Find_Def_Oper,Find_Def_FieldValue,Find_Def_Field2Value) then
    with cdsMain11  do
    begin
      Close;
      if  F_SQLWhere='' then
        CommandText:= F_SQLSelectFrom+#13+'where '+frmFindOutSQL
      else
        CommandText:= F_SQLSelectFrom+#13+F_SQLWhere+#13+'and '+frmFindOutSQL ;

      if  F_SQLOrderBy<>'' then
      CommandText:=CommandText+#13+F_SQLOrderBy;
      Open;
    end;
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet12 then
  begin
    FindNotDisplayFields:= VarArrayOf(['工厂','data0831rkey','DATA0567RKEY','开始保养时间','故障日期','金额(本币含税)']);
    if ShowfrmFindcds(cdsMain12,frmFindOutSQL,DropDown_Info_List,FindNotDisplayFields,FindDisplayFields,FindFieldsName,
    FindQueryFieldsName,Find_Def_FieldName,Find_Def_Oper,Find_Def_FieldValue,Find_Def_Field2Value) then
    with cdsMain12  do
    begin
      Close;
      if  F_SQLWhere='' then
        CommandText:= F_SQLSelectFrom+#13+'where '+frmFindOutSQL
      else
        CommandText:= F_SQLSelectFrom+#13+F_SQLWhere+#13+'and '+frmFindOutSQL ;

      if  F_SQLOrderBy<>'' then
      CommandText:=CommandText+#13+F_SQLOrderBy;
      Open;
    end;
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet13 then
  begin
    FindNotDisplayFields:= VarArrayOf(['工厂','data0835rkey','data0567rkey','受理时间','故障日期','金额(本币含税)']);
    if ShowfrmFindcds(cdsMain13,frmFindOutSQL,DropDown_Info_List,FindNotDisplayFields,FindDisplayFields,FindFieldsName,
    FindQueryFieldsName,Find_Def_FieldName,Find_Def_Oper,Find_Def_FieldValue,Find_Def_Field2Value) then
    with cdsMain13  do
    begin
      Close;
      if  F_SQLWhere='' then
        CommandText:= F_SQLSelectFrom+#13+'where '+frmFindOutSQL
      else
        CommandText:= F_SQLSelectFrom+#13+F_SQLWhere+#13+'and '+frmFindOutSQL ;

      if  F_SQLOrderBy<>'' then
      CommandText:=CommandText+#13+F_SQLOrderBy;
      Open;
    end;
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet14 then
  begin
    FindNotDisplayFields:= VarArrayOf(['工厂','发料日期','单价']);
    if ShowfrmFindcds(cdsMain14,frmFindOutSQL,DropDown_Info_List,FindNotDisplayFields,FindDisplayFields,FindFieldsName,
    FindQueryFieldsName,Find_Def_FieldName,Find_Def_Oper,Find_Def_FieldValue,Find_Def_Field2Value) then
    with cdsMain14  do
    begin
      Close;
      if  F_SQLWhere='' then
        CommandText:= F_SQLSelectFrom+#13+'where '+frmFindOutSQL
      else
        CommandText:= F_SQLSelectFrom+#13+F_SQLWhere+#13+'and '+frmFindOutSQL ;

      if  F_SQLOrderBy<>'' then
      CommandText:=CommandText+#13+F_SQLOrderBy;
      Open;
    end;
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet15 then
  begin
    FindNotDisplayFields:= VarArrayOf(['工厂','rkey','INVENT_PTR','DEPT_PTR','申请日期','单价']);
    if ShowfrmFindcds(cdsMain15,frmFindOutSQL,DropDown_Info_List,FindNotDisplayFields,FindDisplayFields,FindFieldsName,
    FindQueryFieldsName,Find_Def_FieldName,Find_Def_Oper,Find_Def_FieldValue,Find_Def_Field2Value) then
    with cdsMain15  do
    begin
      Close;
      if  F_SQLWhere='' then
        CommandText:= F_SQLSelectFrom+#13+'where '+frmFindOutSQL
      else
        CommandText:= F_SQLSelectFrom+#13+F_SQLWhere+#13+'and '+frmFindOutSQL ;

      if  F_SQLOrderBy<>'' then
      CommandText:=CommandText+#13+F_SQLOrderBy;
      Open;
    end;
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet18 then
  begin
    FindNotDisplayFields:= VarArrayOf(['工厂','完工日期']);
    if ShowfrmFindcds(cdsMain18,frmFindOutSQL,DropDown_Info_List,FindNotDisplayFields,FindDisplayFields,FindFieldsName,
    FindQueryFieldsName,Find_Def_FieldName,Find_Def_Oper,Find_Def_FieldValue,Find_Def_Field2Value) then
    with cdsMain18  do
    begin
      Close;
      if  F_SQLWhere='' then
        CommandText:= F_SQLSelectFrom+#13+'where '+frmFindOutSQL
      else
        CommandText:= F_SQLSelectFrom+#13+F_SQLWhere+#13+'and '+frmFindOutSQL ;

      if  F_SQLOrderBy<>'' then
      CommandText:=CommandText+#13+F_SQLOrderBy;
      Open;
    end;
  end
end;

procedure Tfrm_EquiMainAnal.RightsSetDataSetReadOnly;
begin
  cdsMain.ReadOnly:=True;
  DghMain.ReadOnly:=True;
  cdsMain1.ReadOnly:=True;
  DghMain1.ReadOnly:=True;
  cdsMain2.ReadOnly:=True;
  DghMain2.ReadOnly:=True;
  cdsMain3.ReadOnly:=True;
  DghMain3.ReadOnly:=True;
  cdsMain4.ReadOnly:=True;
  DghMain4.ReadOnly:=True;
  cdsMain5.ReadOnly:=True;
  DghMain5.ReadOnly:=True;
  cdsMain6.ReadOnly:=True;
  DghMain6.ReadOnly:=True;
  cdsMain7.ReadOnly:=True;
  DghMain7.ReadOnly:=True;
  cdsMain8.ReadOnly:=True;
  DghMain8.ReadOnly:=True;
  cdsMain9.ReadOnly:=True;
  DghMain9.ReadOnly:=True;
  cdsMain10.ReadOnly:=True;
  DghMain10.ReadOnly:=True;
  cdsMain11.ReadOnly:=True;
  DghMain11.ReadOnly:=True;
  cdsMain11_1.ReadOnly:=True;
  DghMain11_1.ReadOnly:=True;
  cdsMain12.ReadOnly:=True;
  DghMain12.ReadOnly:=True;
  cdsMain13.ReadOnly:=True;
  DghMain13.ReadOnly:=True;
  cdsMain14.ReadOnly:=True;
  DghMain14.ReadOnly:=True;
  cdsMain15.ReadOnly:=True;
  DghMain15.ReadOnly:=True;
  cdsMain16.ReadOnly:=True;
  DghMain16.ReadOnly:=True;
  cdsMain17.ReadOnly:=True;
  DghMain17.ReadOnly:=True;
  cdsMain18.ReadOnly:=True;
  DghMain18.ReadOnly:=True;
end;

procedure Tfrm_EquiMainAnal.BtFindClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if cxPageControl2.ActivePage=cxTabSheet0 then
    begin
      with  cdsMain   do
      begin
        Close;
        CommandText:=F_SQLSelectFrom+F_sqlWhere;
        Open;
      end;
    end
    else
    if cxPageControl2.ActivePage=cxTabSheet1 then
    begin
      with  cdsMain1   do
      begin
        Close;
        CommandText:=F_SQLSelectFrom+F_sqlWhere;
        Open;
      end;
    end
    else
    if cxPageControl2.ActivePage=cxTabSheet2 then
    begin
      with  cdsMain2   do
      begin
        Close;
        CommandText:=F_SQLSelectFrom+F_sqlWhere;
        Open;
      end;
    end
    else
    if cxPageControl2.ActivePage=cxTabSheet3 then
    begin
      with  cdsMain3   do
      begin
        Close;
        CommandText:=F_SQLSelectFrom+F_sqlWhere;
        Open;
      end;
    end
    else
    if cxPageControl2.ActivePage=cxTabSheet4 then
    begin
      with  cdsMain4  do
      begin
        Close;
        CommandText:=F_SQLSelectFrom+#13+ F_SQLWhere;
        Open;
      end;
    end
    else
    if cxPageControl2.ActivePage=cxTabSheet5 then
    begin
      with  cdsMain5  do
      begin
        Close;
        CommandText:=F_SQLSelectFrom+#13+ F_SQLWhere;
        Open;
      end;
    end
    else
    if cxPageControl2.ActivePage=cxTabSheet6 then
    begin
      with  cdsMain6  do
      begin
        Close;
        CommandText:=F_SQLSelectFrom+#13+ F_SQLWhere;
        Open;
      end;
    end
    else
    if cxPageControl2.ActivePage=cxTabSheet7 then
    begin
      with  cdsMain7  do
      begin
        Close;
        CommandText:=F_SQLSelectFrom+#13+ F_SQLWhere;
        Open;
      end;
    end
    else
    if cxPageControl2.ActivePage=cxTabSheet9 then
    begin
      with  cdsMain9  do
      begin
        Close;
        CommandText:=F_SQLSelectFrom+#13+ F_SQLWhere;
        Open;
      end;
    end
    else
    if cxPageControl2.ActivePage=cxTabSheet10 then
    begin
      with  cdsMain10  do
      begin
        Close;
        CommandText:=F_SQLSelectFrom+#13+ F_SQLWhere;
        Open;
      end;
    end
    else
    if cxPageControl2.ActivePage=cxTabSheet11 then
    begin
      with  cdsMain11  do
      begin
        Close;
        CommandText:=F_SQLSelectFrom+#13+ F_SQLWhere;
        Open;
      end;
    end
    else
    if cxPageControl2.ActivePage=cxTabSheet12 then
    begin
      with  cdsMain12  do
      begin
        Close;
        CommandText:=F_SQLSelectFrom+#13+ F_SQLWhere;
        Open;
      end;
    end
    else
    if cxPageControl2.ActivePage=cxTabSheet13 then
    begin
      with  cdsMain13  do
      begin
        Close;
        CommandText:=F_SQLSelectFrom+#13+ F_SQLWhere;
        Open;
      end;
    end
    else
    if cxPageControl2.ActivePage=cxTabSheet14 then
    begin
      with  cdsMain14  do
      begin
        Close;
        CommandText:=F_SQLSelectFrom+#13+ F_SQLWhere;
        Open;
      end;
    end
    else
    if cxPageControl2.ActivePage=cxTabSheet15 then
    begin
      with  cdsMain15  do
      begin
        Close;
        CommandText:=F_SQLSelectFrom+#13+ F_SQLWhere+F_SQLOrderBy;
        Open;
      end;
    end
    else
    if cxPageControl2.ActivePage=cxTabSheet16 then
    begin
      with  cdsMain16  do
      begin
        Close;
        Open;
      end;
    end
    else
    if cxPageControl2.ActivePage=cxTabSheet17 then
    begin
      with  cdsMain17  do
      begin
        cdsMain17_1.Close;
        cdsMain17_1.Open;
        if   cdsMain17_1.Fields[0].IsNull =False then
        begin
          Close;
          CommandText:=cdsMain17_1.Fields[0].Value;
          Active:=True;
        end;
      end;
    end
    else
    if cxPageControl2.ActivePage=cxTabSheet18 then
    begin
      with  cdsMain18  do
      begin
        Close;
        CommandText:=F_SQLSelectFrom+#13+ F_SQLWhere+F_SQLOrderBy;
        Open;
      end;
    end
  finally    
    Screen.Cursor := crDefault;
  end;
end;

procedure Tfrm_EquiMainAnal.FormCreate(Sender: TObject);
begin
   if not App_init_2(dm.ADOConnection1 ) then
  begin
    ShowMessage('程序启动失败，请联系系统管理员！');
    application.Terminate;
    exit;
  end;
  Caption:=application.Title ;
  { }
  {  
  dm.ADOConnection1.Close;
  dm.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  dm.ADOConnection1.Open;
  UserRKEY := 2522;
  vprev:='2'; }

  inherited;
  SetEmployeeInfo(dtRead,dxStatusBar1);
  cxPageControl2.ActivePageIndex:=0;
  dteBegin.Date:= Date-1;
  dteEnd  .Date:= Date;
  dteBeginChange(nil);
  dteEndChange(nil);
  cxPageControl2Change (nil);
  BtFindClick(nil);

  with  cds0015 do
  begin
    Open;
    First;
    while not Eof do
    begin
      PF0_cbx.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
      PF1_cbx.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
      PF2_cbx.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
      PF3_cbx.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
      PF4_cbx.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
      PF5_cbx.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
      PF6_cbx.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
      PF9_cbx.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
      PF10_cbx.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
      PF7_cbx.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
      PF11_cbx.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
      PF12_cbx.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
      PF13_cbx.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
      PF14_cbx.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
      PF15_cbx.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
      PF16_cbx.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
      PF18_cbx.Items.AddObject(FieldByName('ABBR_NAME').AsString,TObject(FieldByName('rkey').AsInteger));
      Next;
    end;
    PF0_cbx.Items.AddObject('全部',TObject(0));
    PF0_cbx.ItemIndex:= PF0_cbx.Items.Count-1;
    PF1_cbx.Items.AddObject('全部',TObject(0));
    PF1_cbx.ItemIndex:= PF0_cbx.Items.Count-1;
    PF2_cbx.Items.AddObject('全部',TObject(0));
    PF2_cbx.ItemIndex:= PF0_cbx.Items.Count-1;
    PF3_cbx.Items.AddObject('全部',TObject(0));
    PF3_cbx.ItemIndex:= PF0_cbx.Items.Count-1;
    PF4_cbx.Items.AddObject('全部',TObject(0));
    PF4_cbx.ItemIndex:= PF0_cbx.Items.Count-1;
    PF5_cbx.Items.AddObject('全部',TObject(0));
    PF5_cbx.ItemIndex:= PF0_cbx.Items.Count-1;
    PF6_cbx.Items.AddObject('全部',TObject(0));
    PF6_cbx.ItemIndex:= PF0_cbx.Items.Count-1;
    PF9_cbx.Items.AddObject('全部',TObject(0));
    PF9_cbx.ItemIndex:= PF0_cbx.Items.Count-1;
    PF10_cbx.Items.AddObject('全部',TObject(0));
    PF10_cbx.ItemIndex:= PF0_cbx.Items.Count-1;
    PF7_cbx.Items.AddObject('全部',TObject(0));
    PF7_cbx.ItemIndex:= PF0_cbx.Items.Count-1;
    PF11_cbx.Items.AddObject('全部',TObject(0));
    PF11_cbx.ItemIndex:= PF0_cbx.Items.Count-1;
    PF12_cbx.Items.AddObject('全部',TObject(0));
    PF12_cbx.ItemIndex:= PF0_cbx.Items.Count-1;
    PF13_cbx.Items.AddObject('全部',TObject(0));
    PF13_cbx.ItemIndex:= PF0_cbx.Items.Count-1;
    PF14_cbx.Items.AddObject('全部',TObject(0));
    PF14_cbx.ItemIndex:= PF0_cbx.Items.Count-1;
    PF15_cbx.Items.AddObject('全部',TObject(0));
    PF15_cbx.ItemIndex:= PF0_cbx.Items.Count-1;
    PF16_cbx.Items.AddObject('全部',TObject(0));
    PF16_cbx.ItemIndex:= PF0_cbx.Items.Count-1;
    PF18_cbx.Items.AddObject('全部',TObject(0));
    PF18_cbx.ItemIndex:= PF0_cbx.Items.Count-1;
  end;
  Panel5.Height:=38;
end;

procedure Tfrm_EquiMainAnal.dteBeginChange(Sender: TObject);
begin
  inherited;
  if cxPageControl2.ActivePage=cxTabSheet0 then
    cdsMain.Params.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteBegin.Date) + ' ' + TimeToStr(dteBeginTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet1 then
    begin
      cdsMain1.Params.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteBegin.Date) + ' ' + TimeToStr(dteBeginTime.Time)))  ;
    end
  else
  if cxPageControl2.ActivePage=cxTabSheet2 then
    cdsMain2.Params.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteBegin.Date) + ' ' + TimeToStr(dteBeginTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet3 then
    cdsMain3.Params.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteBegin.Date) + ' ' + TimeToStr(dteBeginTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet4 then
    cdsMain4.Params.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteBegin.Date) + ' ' + TimeToStr(dteBeginTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet5 then
    cdsMain5.Params.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteBegin.Date) + ' ' + TimeToStr(dteBeginTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet6 then
    cdsMain6.Params.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteBegin.Date) + ' ' + TimeToStr(dteBeginTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet7 then
    cdsMain7.Params.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteBegin.Date) + ' ' + TimeToStr(dteBeginTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet9 then
    cdsMain9.Params.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteBegin.Date) + ' ' + TimeToStr(dteBeginTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet10 then
    cdsMain10.Params.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteBegin.Date) + ' ' + TimeToStr(dteBeginTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet11 then
    cdsMain11.Params.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteBegin.Date) + ' ' + TimeToStr(dteBeginTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet12 then
    cdsMain12.Params.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteBegin.Date) + ' ' + TimeToStr(dteBeginTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet13 then
    cdsMain13.Params.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteBegin.Date) + ' ' + TimeToStr(dteBeginTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet14 then
    cdsMain14.Params.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteBegin.Date) + ' ' + TimeToStr(dteBeginTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet15 then
    cdsMain15.Params.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteBegin.Date) + ' ' + TimeToStr(dteBeginTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet16 then
    cdsMain16_1.Params.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteBegin.Date) + ' ' + TimeToStr(dteBeginTime.Time)))
end;

procedure Tfrm_EquiMainAnal.dteEndChange(Sender: TObject);
begin
  inherited;
  if cxPageControl2.ActivePage=cxTabSheet0 then
    cdsMain.Params.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteEnd.Date) + ' ' + TimeToStr(dteEndTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet1 then
    cdsMain1.Params.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteEnd.Date) + ' ' + TimeToStr(dteEndTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet2 then
    cdsMain2.Params.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteEnd.Date) + ' ' + TimeToStr(dteEndTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet3 then
    cdsMain3.Params.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteEnd.Date) + ' ' + TimeToStr(dteEndTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet4 then
    cdsMain4.Params.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteEnd.Date) + ' ' + TimeToStr(dteEndTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet5 then
    cdsMain5.Params.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteEnd.Date) + ' ' + TimeToStr(dteEndTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet6 then
    cdsMain6.Params.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteEnd.Date) + ' ' + TimeToStr(dteEndTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet7 then
    cdsMain7.Params.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteEnd.Date) + ' ' + TimeToStr(dteEndTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet9 then
    cdsMain9.Params.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteEnd.Date) + ' ' + TimeToStr(dteEndTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet10 then
    cdsMain10.Params.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteEnd.Date) + ' ' + TimeToStr(dteEndTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet11 then
    cdsMain11.Params.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteEnd.Date) + ' ' + TimeToStr(dteEndTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet12 then
    cdsMain12.Params.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteEnd.Date) + ' ' + TimeToStr(dteEndTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet13 then
    cdsMain13.Params.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteEnd.Date) + ' ' + TimeToStr(dteEndTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet14 then
    cdsMain14.Params.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteEnd.Date) + ' ' + TimeToStr(dteEndTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet15 then
    cdsMain15.Params.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteEnd.Date) + ' ' + TimeToStr(dteEndTime.Time)))
  else
  if cxPageControl2.ActivePage=cxTabSheet16 then
    cdsMain16_1.Params.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd H:mm:ss',
        StrToDateTime(DateToStr(dteEnd.Date) + ' ' + TimeToStr(dteEndTime.Time)))
end;

procedure Tfrm_EquiMainAnal.cxTabSheet2Enter(Sender: TObject);
begin
  inherited;
  if cdsMain1.Active=False then
  cdsMain1.Open;
end;

procedure Tfrm_EquiMainAnal.cxPageControl2Change(Sender: TObject);
var
  CurrentMonth:TDateTime;
begin
  inherited;
  PF0.Visible:=False;
  PF1.Visible:=False;
  PF2.Visible:=False;
  PF3.Visible:=False;
  PF4.Visible:=False;
  PF5.Visible:=False;
  PF6.Visible:=False;         
  PF9.Visible:=False;
  PF10.Visible:=False;
  PF7.Visible:=False;
  PF11.Visible:=False;
  PF12.Visible:=False;
  PF13.Visible:=False;
  PF14.Visible:=False;
  PF15.Visible:=False;
  PF16.Visible:=False;
  PF17.Visible:=False;
  PF18.Visible:=False;
  GroupBox6.Visible:=False;
  GroupBox8.Visible:=False;
  CurrentMonth:=StrToDate(SQLResultValue(cdsRead,
            'select cast(DATEPART(yy,getdate())as varchar(10))+''-''+cast(DATEPART(MM,getdate())as varchar(10))+''-''+''01'''));
  if cxPageControl2.ActivePage=cxTabSheet0 then  //重复故障名称维修
  begin
    PF0.Visible:=True;
    PF0.Align:=alLeft;
    if cdsMain.Active=False then
    begin
      PF0_dteBegin.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',Date-1));
      PF0_dteEnd  .Date     := StrToDate(FormatDateTime('yyyy-MM-dd',Date));
      PF0_dteBeginTime.Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF0_dteEndTime  .Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF0_dteBeginChange(nil);
      PF0_dteEndChange(nil);
      PF0_Edit_Day.Text:='4';
      BtFindClick(nil);
    end;
    cdsMainAfterScroll(cdsMain);
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet1 then  // 重复设备名称维修
  begin
    PF1.Align:=alLeft;
    PF1.Visible:=True;
    if cdsMain1.Active=False then
    begin
      PF1_dteBegin.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',Date-1));
      PF1_dteEnd  .Date     := StrToDate(FormatDateTime('yyyy-MM-dd',Date));
      PF1_dteBeginTime.Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF1_dteEndTime  .Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF1_dteBeginChange(nil);
      PF1_dteEndChange(nil);
      PF1_Edit_Day.Text:='6';
      BtFindClick(nil);
    end;
    cdsMainAfterScroll(cdsMain1);
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet2 then //超长故障停机时间
  begin
    PF2.Align:=alLeft;
    PF2.Visible:=True;
    if cdsMain2.Active=False then
    begin
      PF2_dteBegin.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',Date-1));
      PF2_dteEnd  .Date     := StrToDate(FormatDateTime('yyyy-MM-dd',Date));
      PF2_dteBeginTime.Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF2_dteEndTime  .Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF2_dteBeginChange(nil);
      PF2_dteEndChange(nil);
      PF2_Edit_H.Text:='1';
      BtFindClick(nil);
    end;
    cdsMainAfterScroll(cdsMain2);
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet3 then    //超长维修时间
  begin
    PF3.Align:=alLeft;
    PF3.Visible:=True;
    if cdsMain3.Active=False then
    begin
      PF3_dteBegin.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',Date-1));
      PF3_dteEnd  .Date     := StrToDate(FormatDateTime('yyyy-MM-dd',Date));
      PF3_dteBeginTime.Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF3_dteEndTime  .Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF3_dteBeginChange(nil);
      PF3_dteEndChange(nil);
      PF3_Edit_H.Text:='2';
      BtFindClick(nil);
    end;
    cdsMainAfterScroll(cdsMain3);
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet4 then  //保养不到位
  begin
    PF4.Align:=alLeft;
    PF4.Visible:=True;
    if cdsMain4.Active=False then
    begin
      PF4_dteBegin.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',CurrentMonth));
      PF4_dteEnd  .Date     := StrToDate(FormatDateTime('yyyy-MM-dd',IncMonth(PF4_dteBegin.Date,1)));
      PF4_dteBeginTime.Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF4_dteEndTime  .Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF4_dteBeginChange(nil);
      PF4_dteEndChange(nil);
      PF4_Edit_H.Text:='2';
      PF4_Edit_Day.Text:='30';
      PF4_Edit_A.Text:='';
      BtFindClick(nil);
    end;
    cdsMainAfterScroll(cdsMain4);
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet5 then   //保养不良
  begin
    PF5.Align:=alLeft;
    PF5.Visible:=True;
    if cdsMain5.Active=False then
    begin
      PF5_dteBegin.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',CurrentMonth));
      PF5_dteEnd  .Date     := StrToDate(FormatDateTime('yyyy-MM-dd',IncMonth(PF5_dteBegin.Date,1)));
      PF5_dteBeginTime.Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF5_dteEndTime  .Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF5_dteBeginChange(nil);
      PF5_dteEndChange(nil);
      PF5_Edit_Day.Text:='30';
      PF5_Edit_A.Text:='';
      BtFindClick(nil);
    end;
    cdsMainAfterScroll(cdsMain5);
  end

  else
  if cxPageControl2.ActivePage=cxTabSheet6 then   // 雇员超长工作时间
  begin
    PF6.Align:=alLeft;
    PF6.Visible:=True;
    if cdsMain6.Active=False then
    begin
      PF6_dteBegin.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',Date-1));
      PF6_dteEnd  .Date     := StrToDate(FormatDateTime('yyyy-MM-dd',Date));
      PF6_dteBeginTime.Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF6_dteEndTime  .Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF6_dteBeginChange(nil);
      PF6_dteEndChange(nil);
      BtFindClick(nil);
    end;
    cdsMainAfterScroll(cdsMain6);
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet7 then //雇员人均工时
  begin
    PF7.Align:=alLeft;
    PF7.Visible:=True;
    if cdsMain7.Active=False then
    begin
      PF7_dteBegin.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',Date-1));
      PF7_dteEnd  .Date     := StrToDate(FormatDateTime('yyyy-MM-dd',Date));
      PF7_dteBeginTime.Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF7_dteEndTime  .Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF7_dteBeginChange(nil);
      PF7_dteEndChange(nil);
      BtFindClick(nil);
    end;
    cdsMainAfterScroll(cdsMain7);
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet9 then  //操作不良
  begin
    PF9.Align:=alLeft;
    PF9.Visible:=True;
    if cdsMain9.Active=False then
    begin
      PF9_dteBegin.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',CurrentMonth));
      PF9_dteEnd  .Date     := StrToDate(FormatDateTime('yyyy-MM-dd',IncMonth(PF9_dteBegin.Date,1)));
      PF9_dteBeginTime.Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF9_dteEndTime  .Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF9_dteBeginChange(nil);
      PF9_dteEndChange(nil);
      BtFindClick(nil);
    end;
    cdsMainAfterScroll(cdsMain9);
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet10 then   //设计不良
  begin
    PF10.Align:=alLeft;
    PF10.Visible:=True;
    if cdsMain10.Active=False then
    begin
      PF10_dteBegin.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',CurrentMonth));
      PF10_dteEnd  .Date     := StrToDate(FormatDateTime('yyyy-MM-dd',IncMonth(PF10_dteBegin.Date,1)));
      PF10_dteBeginTime.Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF10_dteEndTime  .Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF10_dteBeginChange(nil);
      PF10_dteEndChange(nil);
      BtFindClick(nil);
    end;
    cdsMainAfterScroll(cdsMain10);
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet11 then //维修材料领用
  begin
    PF11.Align:=alLeft;
    PF11.Visible:=True;
    if cdsMain11.Active=False then
    begin
      PF11_dteBegin.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',CurrentMonth));
      PF11_dteEnd  .Date     := StrToDate(FormatDateTime('yyyy-MM-dd',IncMonth(PF11_dteBegin.Date,1)));
      PF11_dteBeginTime.Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF11_dteEndTime  .Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF11_dteBeginChange(nil);
      PF11_dteEndChange(nil);
      PF11_Edit7.Text:='300';
      PF11_Edit7Change(nil);
      BtFindClick(nil);
    end;
    cdsMainAfterScroll(cdsMain11);

  end
  else
  if cxPageControl2.ActivePage=cxTabSheet12 then //保养材料领用
  begin
    PF12.Align:=alLeft;
    PF12.Visible:=True;
    if cdsMain12.Active=False then
    begin
      PF12_dteBegin.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',CurrentMonth));
      PF12_dteEnd  .Date     := StrToDate(FormatDateTime('yyyy-MM-dd',IncMonth(PF12_dteBegin.Date,1)));
      PF12_dteBeginTime.Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF12_dteEndTime  .Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF12_dteBeginChange(nil);
      PF12_dteEndChange(nil);
      PF12_Edit8.Text:='500';
      PF12_Edit8Change(nil);
      BtFindClick(nil);
    end;
    cdsMainAfterScroll(cdsMain12);
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet13 then //事业部材料领用
  begin
    PF13.Align:=alLeft;
    PF13.Visible:=True;
    if cdsMain13.Active=False then
    begin
      PF13_dteBegin.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',CurrentMonth));
      PF13_dteEnd  .Date     := StrToDate(FormatDateTime('yyyy-MM-dd',IncMonth(PF13_dteBegin.Date,1)));
      PF13_dteBeginTime.Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF13_dteEndTime  .Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF13_dteBeginChange(nil);
      PF13_dteEndChange(nil);
      PF13_Edit7.Text:='500';
      PF13_Edit7Change(nil);
      BtFindClick(nil);
    end;
    cdsMainAfterScroll(cdsMain13);
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet14     then //多次领用材料
  begin
    PF14.Align:=alLeft;
    PF14.Visible:=True;
    if cdsMain14.Active=False then
    begin
      PF14_dteBegin.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',CurrentMonth));
      PF14_dteEnd  .Date     := StrToDate(FormatDateTime('yyyy-MM-dd',IncMonth(PF14_dteBegin.Date,1)));
      PF14_dteBeginTime.Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF14_dteEndTime  .Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF14_dteBeginChange(nil);
      PF14_dteEndChange(nil);
      P14_Edit7.Text:='50';
      P14_Edit7Change(nil);
      PF14_Edit8.Text:='5';
      PF14_Edit8Change(nil);
      BtFindClick(nil);
    end;
    cdsMainAfterScroll(cdsMain14);
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet15     then //多次领用材料
  begin
    PF15.Align:=alLeft;
    PF15.Visible:=True;
    if cdsMain15.Active=False then
    begin
      PF15_dteBegin.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',CurrentMonth));
      PF15_dteEnd  .Date     := StrToDate(FormatDateTime('yyyy-MM-dd',IncMonth(PF15_dteBegin.Date,1)));
      PF15_dteBeginTime.Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF15_dteEndTime  .Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF15_dteBeginChange(nil);
      PF15_dteEndChange(nil);
      PF15_Edit7.Text:='50';
      PF15_Edit7Change(nil);
      PF15_Edit8.Text:='5';
      PF15_Edit8Change(nil);
      BtFindClick(nil);
    end;
    cdsMainAfterScroll(cdsMain15);
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet16     then
  begin
    PF16.Align:=alLeft;
    PF16.Visible:=True;
    if cdsMain16.Active=False then
    begin
      PF16_dteBegin.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',CurrentMonth));
      PF16_dteEnd.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',CurrentMonth));
      PF16_dteBeginChange(nil);
      PF16_dteEndChange(nil);
      cdsMain16.Open;
    end;
    if cdsMain16.Active then
    cdsMainAfterScroll(cdsMain16);
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet17     then
  begin
    PF17.Align:=alLeft;
    PF17.Visible:=True;
    if cdsMain17.Active=False then
    begin
      PF17_dteBegin.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',CurrentMonth));
      PF17_dteEnd.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',CurrentMonth));
      PF17_dteBeginChange(nil);
      PF17_dteEndChange(nil);
      BtFindClick(nil);
    end;
    if cdsMain17.Active then
    cdsMainAfterScroll(cdsMain17);
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet18     then
  begin
    PF18.Align:=alLeft;
    PF18.Visible:=True;
    if cdsMain18.Active=False then
    begin
      PF18_dteBegin.Date     := StrToDate(FormatDateTime('yyyy-MM-dd',CurrentMonth));
      PF18_dteEnd  .Date     := StrToDate(FormatDateTime('yyyy-MM-dd',IncMonth(PF18_dteBegin.Date,1)));
      PF18_dteBeginTime.Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF18_dteEndTime  .Time := StrToTime(FormatDateTime('H:mm:ss',StrToTime('08:00:00')));
      PF18_dteBeginChange(nil);
      PF18_dteEndChange(nil);
      BtFindClick(nil);
    end ;
    cdsMainAfterScroll(cdsMain18);
  end
end;

procedure Tfrm_EquiMainAnal.Edit1Change(Sender: TObject);
begin
  inherited;
  if   (Edit1.Text<>'')and((IsNumeric( Edit1.Text))and(StrToFloat( Edit1.Text)>0)) then
  begin
    if cxPageControl2.ActivePage=cxTabSheet2 then
    cdsMain2.Params.ParamByName('DT').Value:=StrToFloat(Edit1.Text);
    if cxPageControl2.ActivePage=cxTabSheet3 then
    cdsMain3.Params.ParamByName('DT').Value:=StrToFloat(Edit1.Text);
    if cxPageControl2.ActivePage=cxTabSheet4 then
    cdsMain4.Params.ParamByName('vMaintain_house').Value:=StrToFloat(Edit1.Text);
    if cxPageControl2.ActivePage=cxTabSheet6 then
    cdsMain6.Params.ParamByName('vWorkTime').Value:=StrToFloat(Edit1.Text) ;
    if cxPageControl2.ActivePage=cxTabSheet14 then
    cdsMain14.Params.ParamByName('DiffMinu').Value:=StrToFloat(Edit1.Text)*60 ;
    if cxPageControl2.ActivePage=cxTabSheet15 then
    cdsMain15.Params.ParamByName('DiffMinu').Value:=StrToFloat(Edit1.Text)*60 ;
  end;
end;

procedure Tfrm_EquiMainAnal.DghMainEnter(Sender: TObject);
begin
  inherited;
  ActiveGridEH:=(Sender as TDBGridEh);
end;

procedure Tfrm_EquiMainAnal.actExportExecute(Sender: TObject);
begin
  //inherited;
  OutputExcelStd(Self,ActiveGridEH);
end;

procedure Tfrm_EquiMainAnal.DghMain1Enter(Sender: TObject);
begin
  inherited;
ActiveGridEH:=(Sender as TDBGridEh);
end;

procedure Tfrm_EquiMainAnal.DghMain2Enter(Sender: TObject);
begin
  inherited;
ActiveGridEH:=(Sender as TDBGridEh);
end;

procedure Tfrm_EquiMainAnal.DghMain3Enter(Sender: TObject);
begin
  inherited;
ActiveGridEH:=(Sender as TDBGridEh);
end;

procedure Tfrm_EquiMainAnal.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9',#13,#8 ,#46]) then   
  key := #0;
end;

procedure Tfrm_EquiMainAnal.Edit3Change(Sender: TObject);
begin
  inherited;
  if   (Edit3.Text<>'')  then
  begin
    if   (IsNumeric(Edit3.Text)) then
    begin
      if cxPageControl2.ActivePage=cxTabSheet4 then
      cdsMain4.F_SQLWhere:='where 达成率>='+floattostr(StrTofloat(Edit3.Text)/100);
      if cxPageControl2.ActivePage=cxTabSheet5 then
      cdsMain5.F_SQLWhere:='where 达成率>='+floattostr(StrTofloat(Edit3.Text)/100);
    end
  end
  else
  begin
    cdsMain4.F_SQLWhere:='';
    cdsMain5.F_SQLWhere:='';
    cdsMain9.F_SQLWhere:='';
    cdsMain10.F_SQLWhere:='';
  end;
end;

procedure Tfrm_EquiMainAnal.Edit2Change(Sender: TObject);
begin
  inherited;
  if   Edit2.Text<>'' then
  begin
    if cxPageControl2.ActivePage=cxTabSheet0 then
      cdsMain .Params.ParamByName('DT').Value:=StrToInt(Edit2.Text)*60
    else
    if cxPageControl2.ActivePage=cxTabSheet1 then
      cdsMain1.Params.ParamByName('DT').Value:=StrToInt(Edit2.Text)*60
    else
    if cxPageControl2.ActivePage=cxTabSheet4 then
      cdsMain4.Params.ParamByName('vDisposal_date').Value:=StrToInt(Edit2.Text)
    else
    if cxPageControl2.ActivePage=cxTabSheet5 then
      cdsMain5.Params.ParamByName('vDisposal_date').Value:=StrToInt(Edit2.Text);
  end;
end;

procedure Tfrm_EquiMainAnal.cdsMain7AfterScroll(DataSet: TDataSet);
begin
  inherited;
  with cdsMain8 do
  begin
    Close;
    Params.ParamByName('vEMPL_PTR').Value:= cdsMain7Empl_ptr.Value;
    Params.ParamByName('SD').Value:=DateToStr(PF7_dteBegin.Date) + ' ' + TimeToStr(PF7_dteBeginTime.Time);
    Params.ParamByName('ED').Value:=DateToStr(PF7_dteEnd.Date) + ' ' + TimeToStr(PF7_dteEndTime.Time);
    Open;
  end;
  cdsMainAfterScroll (cdsMain7)  ;
end;

procedure Tfrm_EquiMainAnal.cdsMain7AfterClose(DataSet: TDataSet);
begin
  inherited;
  cdsMain8.Close;
end;

procedure Tfrm_EquiMainAnal.cdsMain7AfterOpen(DataSet: TDataSet);
var
  r_1:Real;
begin
  inherited;
  if   DataSet.IsEmpty=False then
  begin
    dghMain7.FieldColumns['雇员工作时间'].Footer.Value:='';
    r_1:=0;
    with dm.cdsClone do
    begin
      close;
      CloneCursor(cdsMain7,True);
      First;
      while not eof do
      begin
        if FieldByName('雇员工作时间').AsFloat>0 then
        r_1:=r_1+FieldByName('雇员工作时间').Value;
        Next;
      end;
      if r_1>0 then
      r_1:=r_1/cdsMain7.RecordCount;
      dghMain7.FieldColumns['雇员工作时间'].Footer.Value:='平均：'+(formatfloat('0.##',r_1));
      close;
    end;
  end;
end;

procedure Tfrm_EquiMainAnal.BCDField9GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if VarIsNull(Sender.Value )=False then
  Text:=FloatToStr(  (StrToFloat(Sender.Value) *100 ))+'%';
end;

procedure Tfrm_EquiMainAnal.BCDField6GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if VarIsNull(Sender.Value )=False then
  Text:=FloatToStr(  (StrToFloat(Sender.Value) *100 ))+'%';
end;

procedure Tfrm_EquiMainAnal.BCDField16GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if VarIsNull(Sender.Value )=False then
  Text:=FloatToStr(  (StrToFloat(Sender.Value) *100 ))+'%';
end;

procedure Tfrm_EquiMainAnal.BCDField23GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if VarIsNull(Sender.Value )=False then
  Text:=FloatToStr(  (StrToFloat(Sender.Value) *100 ))+'%';
end;

procedure Tfrm_EquiMainAnal.cdsMain4CDSDesigner12GetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
  if VarIsNull(Sender.Value )=False then
  Text:=FloatToStr(  (StrToFloat(Sender.Value) *100 ))+'%';
end;

procedure Tfrm_EquiMainAnal.CheckBox1Click(Sender: TObject);
var
  strSQL:string;
begin
  inherited;
  strSQL:='';
  if (CheckBox2.Checked)and(CheckBox3.Checked=False) then
  begin
    strSQL:='where [影响程度]=''预防维护''';
    PF6_Edit_H.Text:='2';
  end
  else
  if (CheckBox3.Checked)and(CheckBox2.Checked=False)  then
  begin
    strSQL:='where [影响程度]=''耗材更换''';
    PF6_Edit_H.Text:='2';
  end
  else
  if (CheckBox3.Checked)and(CheckBox2.Checked)  then
  begin
    strSQL:='where [影响程度]in(''耗材更换'',''预防维护'')';
    PF6_Edit_H.Text:='2';
  end ;
  if CheckBox1.Checked then
  begin
    strSQL:=strSQL+AddSQL(strSQL)+' [设备名称]=''巡查点检''';
    PF6_Edit_H.Text:='1';
  end;

  with PF6_cbx do
  if  Text<>'全部' then
  begin
    if  strSQL<>'' then
      strSQL:=strSQL+' and [工厂]='+QuotedStr(Text)
    else
      strSQL:=#13+'where [工厂]='+QuotedStr(Text)
  end  ;

  cdsMain6.F_SQLWhere:= strSQL;
end;

procedure Tfrm_EquiMainAnal.cdsMain11AfterClose(DataSet: TDataSet);
begin
  inherited;
  cdsMain11_1.Close;
end;

procedure Tfrm_EquiMainAnal.cdsMain11AfterScroll(DataSet: TDataSet);
begin
  inherited;
  with cdsMain11_1 do
  begin
    Close;
    if cdsMain11.FieldByName('DATA0567RKEY').IsNull =False then
      CommandText:=F_SQLSelectFrom+#13+'where data0268.[d567_ptr]='
               + cdsMain11.FieldByName('DATA0567RKEY').AsString
    else
    if cdsMain11.FieldByName('DATA0835RKEY').IsNull =False then
      CommandText:=F_SQLSelectFrom+#13+'where data0268.[d835_ptr]='
               + cdsMain11.FieldByName('DATA0835RKEY').AsString ;
    Open;
  end;
  cdsMainAfterScroll (cdsMain11)  ;
end;

procedure Tfrm_EquiMainAnal.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9',#13,#8 ]) then
  key := #0;
end;

procedure Tfrm_EquiMainAnal.Edit4Change(Sender: TObject);
begin
  inherited;
  if   (Edit4.Text<>'')and((IsNumeric( Edit4.Text))and(StrToFloat( Edit4.Text)>0)) then
  begin
    if cxPageControl2.ActivePage=cxTabSheet11 then
      cdsMain11.Params.ParamByName('TotalAmount').Value:=StrToInt(Edit4.Text)
    else
    if cxPageControl2.ActivePage=cxTabSheet12 then
      cdsMain12.Params.ParamByName('TotalAmount').Value:=StrToInt(Edit4.Text)
    else
    if cxPageControl2.ActivePage=cxTabSheet13 then
      cdsMain13.Params.ParamByName('TotalAmount').Value:=StrToInt(Edit4.Text)
    else
    if cxPageControl2.ActivePage=cxTabSheet14 then
      cdsMain14.Params.ParamByName('price').Value:=StrToInt(Edit4.Text)
    else
    if cxPageControl2.ActivePage=cxTabSheet15 then
      cdsMain15.Params.ParamByName('price').Value:=StrToInt(Edit4.Text)
  end;
end;

procedure Tfrm_EquiMainAnal.cdsMain12AfterClose(DataSet: TDataSet);
begin
  inherited;
  cdsMain12_1.Close;
end;

procedure Tfrm_EquiMainAnal.cdsMain12AfterScroll(DataSet: TDataSet);
begin
  inherited;
  with cdsMain12_1 do
  begin
    Close;
    if cdsMain12.FieldByName('DATA0831RKEY').IsNull =False then
      CommandText:=F_SQLSelectFrom+#13+'where data0268.[d831_ptr]='
               + cdsMain12.FieldByName('DATA0831RKEY').AsString
    else
    if cdsMain12.FieldByName('DATA0567RKEY').IsNull =False then
      CommandText:=F_SQLSelectFrom+#13+'where data0268.[d567_ptr]='
               + cdsMain12.FieldByName('DATA0567RKEY').AsString ;
    Open;
  end;
  cdsMainAfterScroll (cdsMain12)  ;
end;

procedure Tfrm_EquiMainAnal.cdsMain13AfterClose(DataSet: TDataSet);
begin
  inherited;
  cdsMain13_1.Close;
end;

procedure Tfrm_EquiMainAnal.cdsMain13AfterScroll(DataSet: TDataSet);
begin
  inherited;
  with cdsMain13_1 do
  begin
    Close;
    if cdsMain13.FieldByName('DATA0835RKEY').IsNull =False then
      CommandText:=F_SQLSelectFrom+#13+'where data0268.[d835_ptr]='
               + cdsMain13.FieldByName('DATA0835RKEY').AsString
    else
    if cdsMain13.FieldByName('DATA0567RKEY').IsNull =False then
      CommandText:=F_SQLSelectFrom+#13+'where data0268.[d567_ptr]='
               + cdsMain13.FieldByName('DATA0567RKEY').AsString ;
    Open;
  end;
  cdsMainAfterScroll (cdsMain13)  ;
end;

procedure Tfrm_EquiMainAnal.cdsMain16AfterOpen(DataSet: TDataSet);
var
  i:Integer;
  r_Sum:array of Real;
  r_DayCount:array of Integer;
  I_RecordCount:array of Integer;
  cdsMain16FieldCount :Integer;
begin
  inherited;
  with  cdsMain16_3   do
  begin
    Close  ;
    Open;
  end;

  cdsMain16FieldCount :=cdsMain16.FieldCount ;

  for i:=1 to cdsMain16FieldCount-1 do
  begin
    DghMain16.Columns[i].Field.DisplayWidth:=6;
    DghMain16.Columns[i].Footer.ValueType := fvtStaticText;
  end;
  cdsMain16.Fields[0].DisplayWidth:=10;
  cdsMain16.Fields[0].DisplayLabel:='工作日期';

  SetLength (r_Sum,cdsMain16FieldCount);
  SetLength (r_DayCount,cdsMain16FieldCount);
  SetLength (I_RecordCount,cdsMain16FieldCount);
  with  cdsMain16  do
  begin
    try
      DisableControls;
      while not Eof do
      begin
        for i:=2 to  cdsMain16FieldCount-1 do
        if (Fields[i].IsNull=False)and(Fields[i].Value>0) then
        begin
          r_Sum[i]:=r_Sum[i]+Fields[i].Value ;
          r_DayCount[i]:=r_DayCount[i]+1;
          I_RecordCount[i]:= I_RecordCount[i]+1;
        end ;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;

  for i:=1 to  cdsMain16FieldCount-1 do
  begin
    dghMain16.Columns[i].Footers.Add;
    dghMain16.Columns[i].Footers.Add;
    dghMain16.Columns[i].Footers.Add;
    dghMain16.Columns[i].Footers.Add;
    dghMain16.Columns[i].Footers[0].ValueType := fvtStaticText;
    dghMain16.Columns[i].Footers[1].ValueType := fvtStaticText;
    dghMain16.Columns[i].Footers[2].ValueType := fvtStaticText;
    dghMain16.Columns[i].Footers[3].ValueType := fvtStaticText;
    dghMain16.Columns[i].Footers[0].Value     := formatfloat('0.##',r_Sum[i]) ;

    if cdsMain16_3.Locate('EMPLOYEE_NAME',dghMain16.Columns[i].FieldName,[]) then
      dghMain16.Columns[i].Footers[1].Value:= cdsMain16_3.Lookup('EMPLOYEE_NAME',dghMain16.Columns[i].FieldName,'workdays')
    else
      dghMain16.Columns[i].Footers[1].Value:='0';

    if (r_Sum[i]>0) then
    begin
      if  strtofloat(dghMain16.Columns[i].Footers[1].value)>0   then
      dghMain16.Columns[i].Footers[2].Value     := formatfloat('0.##',r_Sum[i]/strtofloat(dghMain16.Columns[i].Footers[1].value));  //每月工作天数是固定的。
      if PF16_Edit5.Text<>'' then
      dghMain16.Columns[i].Footers[3].Value     := formatfloat('0.##',r_Sum[i]/StrToInt(PF16_Edit5.Text));
    end;
  end;
  dghMain16.Columns[0].Footers.Add;
  dghMain16.Columns[0].Footers.Add;
  dghMain16.Columns[0].Footers.Add;
  dghMain16.Columns[0].Footers.Add;
  dghMain16.Columns[0].Footers[0].ValueType := fvtStaticText;
  dghMain16.Columns[0].Footers[1].ValueType := fvtStaticText;
  dghMain16.Columns[0].Footers[2].ValueType := fvtStaticText;
  dghMain16.Columns[0].Footers[3].ValueType := fvtStaticText;
  dghMain16.Columns[0].Footers[0].Value     := '合计工时';
  dghMain16.Columns[0].Footers[1].Value     := '实工作天';
  dghMain16.Columns[0].Footers[2].Value     := '实算人均工时';
  dghMain16.Columns[0].Footers[3].Value     := '标准人均工时';

  cdsMain16.FieldByName('WHOUSE_PTR').Visible:=False;
end;

procedure Tfrm_EquiMainAnal.dghMain16DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  //第1列排除在外，值大于4
  with  (Sender as TDBGridEh)do
  begin
    if ((State=[gdSelected]))then
      Canvas.Brush.Color:=clInactiveCaption;           //设置表格选定区域的颜色

    if (DataCol > 0)and(Column.Field.Value<4) then
    begin
    Canvas.Font.Color := clRed;
    end  ;
    DefaultDrawColumnCell(Rect,datacol,Column,State);
  end;
end;

procedure Tfrm_EquiMainAnal.PF16_dteBeginChange(Sender: TObject);
begin
  inherited;
  PF16_dteBegin.DateTime:=StrToDate (IntToStr(YearOf(PF16_dteBegin.DateTime))
  +'-'+IntToStr(MonthOf(PF16_dteBegin.DateTime))
  +'-01');

  if cxPageControl2.ActivePage=cxTabSheet16 then
    begin
    cdsMain16.Params.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd',
        StrToDateTime(DateToStr(PF16_dteBegin.Date) ))   ;
    cdsMain16_3.Parameters.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd',
        StrToDateTime(DateToStr(PF16_dteBegin.Date) ))   ;
    end
  else
  if cxPageControl2.ActivePage=cxTabSheet17 then
    cdsMain17_1.Params.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd',
        StrToDateTime(DateToStr(PF16_dteBegin.Date) ))          ;
end;

procedure Tfrm_EquiMainAnal.PF16_dteBeginCloseUp(Sender: TObject);
begin
  inherited;
  PF16_dteBeginChange(nil);
end;

procedure Tfrm_EquiMainAnal.PF16_dteEndCloseUp(Sender: TObject);
begin
  inherited;
  PF16_dteEndChange(nil);
end;


procedure Tfrm_EquiMainAnal.PF16_dteEndChange(Sender: TObject);
begin
  inherited;
  PF16_dteEnd.DateTime:= EndOfAMonth(YearOf(PF16_dteEnd.DateTime),MonthOf(PF16_dteEnd.DateTime));

  if cxPageControl2.ActivePage=cxTabSheet16 then
    begin
    cdsMain16.Params.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd',
        StrToDateTime(DateToStr(PF16_dteEnd.Date) )) ;
    cdsMain16_3.Parameters.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd',
        StrToDateTime(DateToStr(PF16_dteEnd.Date) )) ;
    end
  else
  if cxPageControl2.ActivePage=cxTabSheet17 then
    cdsMain17_1.Params.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd',
        StrToDateTime(DateToStr(PF16_dteEnd.Date) ))          ;
end;

procedure Tfrm_EquiMainAnal.PF16_Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9',#13,#8 ]) then //   ,#46  小数点
  key := #0;
end;

procedure Tfrm_EquiMainAnal.cdsMain17AfterOpen(DataSet: TDataSet);
var
  i:Integer;
  r_Sum:array of Real;
  r_DayCount:array of Integer;
  I_RecordCount:array of Integer;
  cdsMain17FieldCount :Integer;
begin
  inherited;
  cdsMain17FieldCount :=cdsMain17.FieldCount ;
  for i:=1 to cdsMain17FieldCount-1 do
  begin
    cdsMain17.Fields[i].DisplayWidth:=6;
    dghMain17.Columns[i].Footer.ValueType := fvtStaticText;
  end;
  cdsMain17.Fields[0].DisplayWidth:=10;
  cdsMain17.Fields[0].DisplayLabel:='工作日期';

  SetLength (r_Sum,cdsMain17FieldCount);
  SetLength (r_DayCount,cdsMain17FieldCount);
  SetLength (I_RecordCount,cdsMain17FieldCount);
  with  cdsMain17  do
  begin
    try
      DisableControls;
      while not Eof do
      begin
        for i:=1 to  cdsMain17FieldCount-1 do
        if (Fields[i].IsNull=False)and(Fields[i].Value>0) then
        begin
          r_DayCount[i]:=r_DayCount[i]+1;
          r_Sum[i]:=r_Sum[i]+Fields[i].Value  ;
          I_RecordCount[i]:= I_RecordCount[i]+1;
        end ;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;
  for i:=1 to  cdsMain17FieldCount-1 do
  begin
    dghMain17.Columns[i].Footers.Add;
    dghMain17.Columns[i].Footers.Add;
    dghMain17.Columns[i].Footers.Add;
    dghMain17.Columns[i].Footers.Add;
    dghMain17.Columns[i].Footers[0].ValueType := fvtStaticText;
    dghMain17.Columns[i].Footers[1].ValueType := fvtStaticText;
    dghMain17.Columns[i].Footers[2].ValueType := fvtStaticText;
    dghMain17.Columns[i].Footers[3].ValueType := fvtStaticText;
    dghMain17.Columns[i].Footers[0].Value     := formatfloat('0.##',r_Sum[i]) ;

    dghMain17.Columns[i].Footers[1].Value:= IntToStr(r_DayCount[i]);
    if (r_Sum[i]>0) then
    begin
      if  r_DayCount[i]>0  then
      dghMain17.Columns[i].Footers[2].Value     := formatfloat('0.##',r_Sum[i]/r_DayCount[i]);  //每月工作天数是固定的。
      if PF17_Edit7.Text<>'' then
      dghMain17.Columns[i].Footers[3].Value     := formatfloat('0.##',r_Sum[i]/StrToInt(PF17_Edit7.Text));
    end;
  end;
  dghMain17.Columns[0].Footers.Add;
  dghMain17.Columns[0].Footers.Add;
  dghMain17.Columns[0].Footers.Add;
  dghMain17.Columns[0].Footers.Add;
  dghMain17.Columns[0].Footers[0].ValueType := fvtStaticText;
  dghMain17.Columns[0].Footers[1].ValueType := fvtStaticText;
  dghMain17.Columns[0].Footers[2].ValueType := fvtStaticText;
  dghMain17.Columns[0].Footers[3].ValueType := fvtStaticText;
  dghMain17.Columns[0].Footers[0].Value     := '合计';
  dghMain17.Columns[0].Footers[1].Value     := '实工作天';
  dghMain17.Columns[0].Footers[2].Value     := '实算人均工时';
  dghMain17.Columns[0].Footers[3].Value     := '标准人均工时';
   
end;

procedure Tfrm_EquiMainAnal.ComboBox1Change(Sender: TObject);
begin
  inherited;
  if cxPageControl2.ActivePage=cxTabSheet0 then
  begin
    if  ComboBox1.Text='全部' then
      cdsMain.F_SQLWhere:=''
    else
      cdsMain.F_SQLWhere:=#13+'where [工厂]='+QuotedStr(ComboBox1.Text);
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet1 then
  begin
    if  ComboBox1.Text='全部' then
      cdsMain1.F_SQLWhere:=''
    else
      cdsMain1.F_SQLWhere:=#13+'where [工厂]='+QuotedStr(ComboBox1.Text);
  end
  else
  if cxPageControl2.ActivePage=cxTabSheet16 then
  begin
    if Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex])<>0 then
    begin
      cdsMain16_2.Params.ParamByName('WHOUSE_PTR').AsInteger:=Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
    end;
  end
end;

procedure Tfrm_EquiMainAnal.PF0_cbxChange(Sender: TObject);
begin
  inherited;
  with Sender as TComboBox do
  begin
    if  Text='全部' then
      cdsMain.F_SQLWhere:=''
    else
      cdsMain.F_SQLWhere:=#13+'where [工厂]='+QuotedStr(Text);
  end
end;

procedure Tfrm_EquiMainAnal.PF0_dteBeginChange(Sender: TObject);
begin
  inherited;
  cdsMain.Params.ParamByName('SD').Value:=
    StrToDateTime(DateToStr(PF0_dteBegin.Date)+' '+TimeToStr(PF0_dteBeginTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF0_dteEndChange(Sender: TObject);
begin
  inherited;
  cdsMain.Params.ParamByName('ED').Value:=
    StrToDateTime(DateToStr(PF0_dteEnd.Date)+' '+TimeToStr(PF0_dteEndTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF0_Edit_DayChange(Sender: TObject);
begin
  inherited;
  with Sender as TEdit do
  cdsMain .Params.ParamByName('DT').Value:=StrToInt(Text)*60
end;

procedure Tfrm_EquiMainAnal.PF1_cbxChange(Sender: TObject);
begin
  inherited;
  with Sender as TComboBox do
  begin
    if  Text='全部' then
      cdsMain1.F_SQLWhere:=''
    else
      cdsMain1.F_SQLWhere:=#13+'where [工厂]='+QuotedStr(Text);
  end
end;

procedure Tfrm_EquiMainAnal.PF1_dteBeginChange(Sender: TObject);
begin
  inherited;
  cdsMain1.Params.ParamByName('SD').Value:=
    StrToDateTime(DateToStr(PF1_dteBegin.Date)+' '+TimeToStr(PF1_dteBeginTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF1_dteEndChange(Sender: TObject);
begin
  inherited;
  cdsMain1.Params.ParamByName('ED').Value:=
    StrToDateTime(DateToStr(PF1_dteEnd.Date)+' '+TimeToStr(PF1_dteEndTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF1_Edit_DayChange(Sender: TObject);
begin
  inherited;
  with Sender as TEdit do
  cdsMain1 .Params.ParamByName('DT').Value:=StrToInt(Text)*60
end;

procedure Tfrm_EquiMainAnal.PF2_cbxChange(Sender: TObject);
begin
  inherited;
  with Sender as TComboBox do
  begin
    if  Text='全部' then
      cdsMain2.F_SQLWhere:=''
    else
      cdsMain2.F_SQLWhere:=#13+'where [工厂]='+QuotedStr(Text);
  end
end;

procedure Tfrm_EquiMainAnal.PF2_dteBeginChange(Sender: TObject);
begin
  inherited;
  cdsMain2.Params.ParamByName('SD').Value:=
    StrToDateTime(DateToStr(PF2_dteBegin.Date)+' '+TimeToStr(PF2_dteBeginTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF2_dteEndChange(Sender: TObject);
begin
  inherited;
  cdsMain2.Params.ParamByName('ED').Value:=
    StrToDateTime(DateToStr(PF2_dteEnd.Date)+' '+TimeToStr(PF2_dteEndTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF2_Edit_HChange(Sender: TObject);
begin
  inherited;
  with Sender as TEdit do
  if   (Text<>'')and((IsNumeric( Text))and(StrToFloat( Text)>0)) then
  begin
    cdsMain2.Params.ParamByName('DT').Value:=StrToFloat(Text);
  end;
end;

procedure Tfrm_EquiMainAnal.PF3_cbxChange(Sender: TObject);
begin
  inherited;
  with Sender as TComboBox do
  begin
    if  Text='全部' then
      cdsMain3.F_SQLWhere:=''
    else
      cdsMain3.F_SQLWhere:=#13+'where [工厂]='+QuotedStr(Text);
  end
end;

procedure Tfrm_EquiMainAnal.PF3_dteBeginChange(Sender: TObject);
begin
  inherited;
  cdsMain3.Params.ParamByName('SD').Value:=
    StrToDateTime(DateToStr(PF3_dteBegin.Date)+' '+TimeToStr(PF3_dteBeginTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF3_dteEndChange(Sender: TObject);
begin
  inherited;
  cdsMain3.Params.ParamByName('ED').Value:=
    StrToDateTime(DateToStr(PF3_dteEnd.Date)+' '+TimeToStr(PF3_dteEndTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF3_Edit_HChange(Sender: TObject);
begin
  inherited;
  with Sender as TEdit do
  if   (Text<>'')and((IsNumeric( Text))and(StrToFloat( Text)>0)) then
  begin
    cdsMain3.Params.ParamByName('DT').Value:=StrToFloat(Text);
  end;
end;

procedure Tfrm_EquiMainAnal.PF4_cbxChange(Sender: TObject);
begin
  inherited;
  with PF4_cbx do
  begin
    if  Text='全部' then
      cdsMain4.F_SQLWhere:=''
    else
      cdsMain4.F_SQLWhere:=#13+'where [工厂]='+QuotedStr(Text);
  end ;
  with PF4_Edit_A do
  if Text<>'' then
  begin
    if cdsMain4.F_SQLWhere='' then
      cdsMain4.F_SQLWhere:='where 达成率>='+floattostr(StrTofloat(Text)/100)
    else
      cdsMain4.F_SQLWhere:=cdsMain4.F_SQLWhere+ ' and  达成率>='+floattostr(StrTofloat(Text)/100)
  end;

end;

procedure Tfrm_EquiMainAnal.PF4_dteBeginChange(Sender: TObject);
begin
  inherited;
  cdsMain4.Params.ParamByName('SD').Value:=
    StrToDateTime(DateToStr(PF4_dteBegin.Date)+' '+TimeToStr(PF4_dteBeginTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF4_dteEndChange(Sender: TObject);
begin
  inherited;
  cdsMain4.Params.ParamByName('ED').Value:=
    StrToDateTime(DateToStr(PF4_dteEnd.Date)+' '+TimeToStr(PF4_dteEndTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF4_Edit_DayChange(Sender: TObject);
begin
  inherited;
  with Sender as TEdit do
  cdsMain4.Params.ParamByName('vDisposal_date').Value:=StrToInt(Text)
end;

procedure Tfrm_EquiMainAnal.PF4_Edit_HChange(Sender: TObject);
begin
  inherited;
  with Sender as TEdit do
  cdsMain4.Params.ParamByName('vMaintain_house').Value:=StrToFloat(Text);
end;

procedure Tfrm_EquiMainAnal.PF4_Edit_AChange(Sender: TObject);
begin
  inherited;
  with Sender as TEdit do
  cdsMain4.F_SQLWhere:='where 达成率>='+floattostr(StrTofloat(Text)/100);
end;

procedure Tfrm_EquiMainAnal.PF5_cbxChange(Sender: TObject);
begin
  inherited;
  with PF5_cbx do
  begin
    if  Text='全部' then
      cdsMain5.F_SQLWhere:=''
    else
      cdsMain5.F_SQLWhere:=#13+'where [工厂]='+QuotedStr(Text);
  end ;
  with PF5_Edit_A do
  if Text<>'' then
  begin
    if cdsMain5.F_SQLWhere='' then
      cdsMain5.F_SQLWhere:='where 达成率>='+floattostr(StrTofloat(Text)/100)
    else
      cdsMain5.F_SQLWhere:=cdsMain5.F_SQLWhere+ ' and  达成率>='+floattostr(StrTofloat(Text)/100)
  end;
end;

procedure Tfrm_EquiMainAnal.PF5_dteBeginChange(Sender: TObject);
begin
  inherited;
  cdsMain5.Params.ParamByName('SD').Value:=
    StrToDateTime(DateToStr(PF5_dteBegin.Date)+' '+TimeToStr(PF5_dteBeginTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF5_dteEndChange(Sender: TObject);
begin
  inherited;
  cdsMain5.Params.ParamByName('ED').Value:=
    StrToDateTime(DateToStr(PF5_dteEnd.Date)+' '+TimeToStr(PF5_dteEndTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF5_Edit_DayChange(Sender: TObject);
begin
  inherited;
  cdsMain5.Params.ParamByName('vDisposal_date').Value:=StrToInt(PF5_Edit_Day.Text);
end;

procedure Tfrm_EquiMainAnal.PF6_dteBeginChange(Sender: TObject);
begin
  inherited;
  cdsMain6.Params.ParamByName('SD').Value:=
    StrToDateTime(DateToStr(PF6_dteBegin.Date)+' '+TimeToStr(PF6_dteBeginTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF6_dteEndChange(Sender: TObject);
begin
  inherited;
  cdsMain6.Params.ParamByName('ED').Value:=
    StrToDateTime(DateToStr(PF6_dteEnd.Date)+' '+TimeToStr(PF6_dteEndTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF6_Edit_HChange(Sender: TObject);
begin
  inherited;
  cdsMain6.Params.ParamByName('vWorkTime').Value:=StrToFloat(PF6_Edit_H.Text) ;
end;

procedure Tfrm_EquiMainAnal.PF9_cbxChange(Sender: TObject);
begin
  inherited;
  with PF9_cbx do
  begin
    if  Text='全部' then
      cdsMain9.F_SQLWhere:=''
    else
      cdsMain9.F_SQLWhere:=#13+'where [工厂]='+QuotedStr(Text);
  end ;
end;

procedure Tfrm_EquiMainAnal.PF9_dteBeginChange(Sender: TObject);
begin
  inherited;
  cdsMain9.Params.ParamByName('SD').Value:=
    StrToDateTime(DateToStr(PF9_dteBegin.Date)+' '+TimeToStr(PF9_dteBeginTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF9_dteEndChange(Sender: TObject);
begin
  inherited;
  cdsMain9.Params.ParamByName('ED').Value:=
    StrToDateTime(DateToStr(PF9_dteEnd.Date)+' '+TimeToStr(PF9_dteEndTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF10_cbxChange(Sender: TObject);
begin
  inherited;
  with PF10_cbx do
  begin
    if  Text='全部' then
      cdsMain10.F_SQLWhere:=''
    else
      cdsMain10.F_SQLWhere:=#13+'where [工厂]='+QuotedStr(Text);
  end ;
end;

procedure Tfrm_EquiMainAnal.PF10_dteBeginChange(Sender: TObject);
begin
  inherited;
  cdsMain10.Params.ParamByName('SD').Value:=
    StrToDateTime(DateToStr(PF10_dteBegin.Date)+' '+TimeToStr(PF10_dteBeginTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF10_dteEndChange(Sender: TObject);
begin
  inherited;
  cdsMain10.Params.ParamByName('ED').Value:=
    StrToDateTime(DateToStr(PF10_dteEnd.Date)+' '+TimeToStr(PF10_dteEndTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF7_cbxChange(Sender: TObject);
begin
  inherited;
  with PF7_cbx do
  begin
    if  Text='全部' then
      cdsMain7.F_SQLWhere:=''
    else
      cdsMain7.F_SQLWhere:=#13+'where [工厂]='+QuotedStr(Text);
  end ;
end;

procedure Tfrm_EquiMainAnal.PF7_dteBeginChange(Sender: TObject);
begin
  inherited;
  cdsMain7.Params.ParamByName('SD').Value:=
    StrToDateTime(DateToStr(PF7_dteBegin.Date)+' '+TimeToStr(PF7_dteBeginTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF7_dteEndChange(Sender: TObject);
begin
  inherited;
  cdsMain7.Params.ParamByName('ED').Value:=
    StrToDateTime(DateToStr(PF7_dteEnd.Date)+' '+TimeToStr(PF7_dteEndTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF11_cbxChange(Sender: TObject);
begin
  inherited;
  with PF11_cbx do
  begin
    if  Text='全部' then
      cdsMain11.F_SQLWhere:=''
    else
      cdsMain11.F_SQLWhere:=#13+'where [工厂]='+QuotedStr(Text);
  end ;
end;

procedure Tfrm_EquiMainAnal.PF11_dteEndChange(Sender: TObject);
begin
  inherited;
  cdsMain11.Params.ParamByName('ED').Value:=
    StrToDateTime(DateToStr(PF11_dteEnd.Date)+' '+TimeToStr(PF11_dteEndTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF11_dteBeginChange(Sender: TObject);
begin
  inherited;
  cdsMain11.Params.ParamByName('SD').Value:=
    StrToDateTime(DateToStr(PF11_dteBegin.Date)+' '+TimeToStr(PF11_dteBeginTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF11_Edit7Change(Sender: TObject);
begin
  inherited;
  cdsMain11.Params.ParamByName('TotalAmount').Value:=StrToInt(PF11_Edit7.Text)
end;

procedure Tfrm_EquiMainAnal.PF12_cbxChange(Sender: TObject);
begin
  inherited;
  with PF12_cbx do
  begin
    if  Text='全部' then
      cdsMain12.F_SQLWhere:=''
    else
      cdsMain12.F_SQLWhere:=#13+'where [工厂]='+QuotedStr(Text);
  end ;
end;

procedure Tfrm_EquiMainAnal.PF13_cbxChange(Sender: TObject);
begin
  inherited;
  with PF13_cbx do
  begin
    if  Text='全部' then
      cdsMain13.F_SQLWhere:=''
    else
      cdsMain13.F_SQLWhere:=#13+'where [工厂]='+QuotedStr(Text);
  end ;
end;

procedure Tfrm_EquiMainAnal.PF12_dteBeginChange(Sender: TObject);
begin
  inherited;
  cdsMain12.Params.ParamByName('SD').Value:=
    StrToDateTime(DateToStr(PF12_dteBegin.Date)+' '+TimeToStr(PF12_dteBeginTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF13_dteBeginChange(Sender: TObject);
begin
  inherited;
  cdsMain13.Params.ParamByName('SD').Value:=
    StrToDateTime(DateToStr(PF13_dteBegin.Date)+' '+TimeToStr(PF13_dteBeginTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF12_dteEndChange(Sender: TObject);
begin
  inherited;
  cdsMain12.Params.ParamByName('ED').Value:=
    StrToDateTime(DateToStr(PF12_dteEnd.Date)+' '+TimeToStr(PF12_dteEndTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF13_dteEndChange(Sender: TObject);
begin
  inherited;
  cdsMain13.Params.ParamByName('ED').Value:=
    StrToDateTime(DateToStr(PF13_dteEnd.Date)+' '+TimeToStr(PF13_dteEndTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF12_Edit8Change(Sender: TObject);
begin
  inherited;
  cdsMain12.Params.ParamByName('TotalAmount').Value:=StrToInt(PF12_Edit8.Text)
end;

procedure Tfrm_EquiMainAnal.PF13_Edit7Change(Sender: TObject);
begin
  inherited;
  cdsMain13.Params.ParamByName('TotalAmount').Value:=StrToInt(PF13_Edit7.Text)
end;

procedure Tfrm_EquiMainAnal.PF14_cbxChange(Sender: TObject);
begin
  inherited;
  with PF14_cbx do
  begin
    if  Text='全部' then
      cdsMain14.F_SQLWhere:=''
    else
      cdsMain14.F_SQLWhere:=#13+'where [工厂]='+QuotedStr(Text);
  end ;
end;

procedure Tfrm_EquiMainAnal.PF14_dteBeginChange(Sender: TObject);
begin
  inherited;
  cdsMain14.Params.ParamByName('SD').Value:=
    StrToDateTime(DateToStr(PF14_dteBegin.Date)+' '+TimeToStr(PF14_dteBeginTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF14_dteEndChange(Sender: TObject);
begin
  inherited;
  cdsMain14.Params.ParamByName('ED').Value:=
    StrToDateTime(DateToStr(PF14_dteEnd.Date)+' '+TimeToStr(PF14_dteEndTime.Time));
end;

procedure Tfrm_EquiMainAnal.P14_Edit7Change(Sender: TObject);
begin
  inherited;
  cdsMain14.Params.ParamByName('price').Value:=StrToInt(P14_Edit7.Text)
end;

procedure Tfrm_EquiMainAnal.PF14_Edit8Change(Sender: TObject);
begin
  inherited;
  cdsMain14.Params.ParamByName('DiffMinu').Value:=StrToFloat(PF14_Edit8.Text)*60 ;
end;

procedure Tfrm_EquiMainAnal.PF15_cbxChange(Sender: TObject);
begin
  inherited;
  with PF15_cbx do
  begin
    if  Text='全部' then
      cdsMain15.F_SQLWhere:=''
    else
      cdsMain15.F_SQLWhere:=#13+'where [工厂]='+QuotedStr(Text);
  end ;
end;

procedure Tfrm_EquiMainAnal.PF15_dteBeginChange(Sender: TObject);
begin
  inherited;
  cdsMain15.Params.ParamByName('SD').Value:=
    StrToDateTime(DateToStr(PF15_dteBegin.Date)+' '+TimeToStr(PF15_dteBeginTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF15_dteEndChange(Sender: TObject);
begin
  inherited;
  cdsMain15.Params.ParamByName('ED').Value:=
    StrToDateTime(DateToStr(PF15_dteEnd.Date)+' '+TimeToStr(PF15_dteEndTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF15_Edit7Change(Sender: TObject);
begin
  inherited;
  cdsMain15.Params.ParamByName('price').Value:=StrToInt(PF15_Edit7.Text)
end;

procedure Tfrm_EquiMainAnal.PF15_Edit8Change(Sender: TObject);
begin
  inherited;
  cdsMain15.Params.ParamByName('DiffMinu').Value:=StrToFloat(PF15_Edit8.Text)*60 ;
end;

procedure Tfrm_EquiMainAnal.PF17_dteBeginChange(Sender: TObject);
begin
  inherited;
  cdsMain17_1.Params.ParamByName('SD').Value:=FormatDateTime('yyyy-MM-dd',
        StrToDateTime(DateToStr(PF17_dteBegin.Date) ))          ;
end;

procedure Tfrm_EquiMainAnal.PF17_dteEndChange(Sender: TObject);
begin
  inherited;
  PF17_dteEnd.DateTime:= EndOfAMonth(YearOf(PF17_dteEnd.DateTime),MonthOf(PF17_dteEnd.DateTime));
  if cxPageControl2.ActivePage=cxTabSheet17 then
    cdsMain17_1.Params.ParamByName('ED').Value:=FormatDateTime('yyyy-MM-dd',
        StrToDateTime(DateToStr(PF17_dteEnd.Date) ))          ;
end;

procedure Tfrm_EquiMainAnal.PF16_cbxChange(Sender: TObject);
begin
  inherited;
  with cdsMain16   do
  begin
    Filtered:=False;
    Filter:='WHOUSE_PTR='+ IntToStr(Integer(PF16_cbx.Items.Objects[PF16_cbx.ItemIndex])  );
    Filtered:=True;
  end;
end;

procedure Tfrm_EquiMainAnal.PF18_dteBeginChange(Sender: TObject);
begin
  inherited;
  cdsMain18.Params.ParamByName('SD').Value:=
    StrToDateTime(DateToStr(PF18_dteBegin.Date)+' '+TimeToStr(PF18_dteBeginTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF18_dteEndChange(Sender: TObject);
begin
  inherited;
  cdsMain18.Params.ParamByName('ED').Value:=
    StrToDateTime(DateToStr(PF18_dteEnd.Date)+' '+TimeToStr(PF18_dteEndTime.Time));
end;

procedure Tfrm_EquiMainAnal.PF18_cbxChange(Sender: TObject);
begin
  inherited;
  with PF18_cbx do
  begin
    if  Text='全部' then
      cdsMain18.F_SQLWhere:=''
    else
      cdsMain18.F_SQLWhere:=#13+'where [工厂]='+QuotedStr(Text);
  end ;
end;

procedure Tfrm_EquiMainAnal.FormShow(Sender: TObject);
begin
  inherited;
  Curr_Date:=GetDataBaseDate(cdsRead,2) ;

  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_ColsInfo              :='FASSET_CODE/设备代码/100,FASSET_NAME/设备名称/200,FASSET_DESC/设备描述/150,DEPT_CODE/部门代码/50,DEPT_NAME/部门名称/80';
    L_FindDataSet           :=cds0417;
    L_DropdownColumn        :='设备代码';
    L_ListResultField       :='FASSET_CODE';
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_ColsInfo              :='WAREHOUSE_CODE/工厂代码/100,ABBR_NAME/工厂/150';
    L_FindDataSet           :=cds0015;
    L_DropdownColumn        :='工厂';
    L_ListResultField       :='ABBR_NAME';
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_ColsInfo              :='Location/责任小组/150';
    L_FindDataSet           :=cds840;
    L_DropdownColumn        :='责任小组';
    L_ListResultField       :='Location';
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_ColsInfo              :='DEPT_CODE/部门代码/100,DEPT_NAME/部门名称/150';
    L_FindDataSet           :=cds0034;
    L_DropdownColumn        :='部门名称';
    L_ListResultField       :='DEPT_NAME';
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_ColsInfo              :='unusual_cate/异常类别/150';
    L_FindDataSet           :=cds0043;
    L_DropdownColumn        :='异常类别';
    L_ListResultField       :='unusual_cate';
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
  var_DropDown_Info:=TDropDownInfo.Create();
  with var_DropDown_Info do
  begin
    L_DropdownColumn        :='影响程度';
    L_AddPickList:=VarArrayOf(['耗材更换','预防维护','生产停顿','影响生产','仍可生产']);
  end;
  DropDown_Info_List.Add(var_DropDown_Info) ;
end;

end.
