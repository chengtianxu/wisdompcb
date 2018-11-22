unit product_MIDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ImgList, DBCtrls, Mask,
  Grids, DBGrids, Menus, DB, ADODB,math, ExtDlgs, DBGridEh,Clipbrd,Excel2000,
  OleServer,ComObj, jpeg, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdFTP;

const
  UPDATESTR =
  '1:优化拼版效率，达到秒拼！' + #13 +
  '2:在编辑画图中增加了橡皮的功能，基本实现常规操作' + #13 +
  '3:加粗了边的线条' + #13 +
  '4:调整了界面的布局，更加美观' + #13 +
  '5:冲板表示更正为单箭头' + #13 +
  '6:编辑中增加了可以移动微调的功能' + #13 +
  '7:板边微调的时候，会自动修正板边' + #13 +
  '8:增加了PNL长高比例不超过1.7的选项' + #13 +
  '9:经纬的方向修正' + #13 +
  '10:默认设置在ERP中总控制开关,工程基础数据的拼版尺寸中设置' + #13 +
  '11:可以查看原有的拼版结果' + #13 +
  '12:增加了利用率的排列显示' + #13 +
  '提示：在拼版结果上点右键可以进行编辑';

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    HeaderControl1: THeaderControl;
    TreeView1: TTreeView;
    ImageList1: TImageList;
    ListBox1: TListBox;
    Notebook1: TNotebook;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBCheckBox1: TDBCheckBox;
    Label11: TLabel;
    Label12: TLabel;
    Edit1: TEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    Label16: TLabel;
    DBEdit14: TDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBRadioGroup2: TDBRadioGroup;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel2: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    DBEdit21: TDBEdit;
    Label32: TLabel;
    DBEdit22: TDBEdit;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel6: TPanel;
    DBGrid1: TDBGrid;
    DBComboBox1: TDBComboBox;
    Edit3: TEdit;
    Label35: TLabel;
    DBEdit23: TDBEdit;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Edit4: TEdit;
    DBEdit24: TDBEdit;
    Label39: TLabel;
    Label40: TLabel;
    Edit5: TEdit;
    DBEdit25: TDBEdit;
    Label41: TLabel;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    Label42: TLabel;
    DBComboBox2: TDBComboBox;
    Label43: TLabel;
    Panel7: TPanel;
    DBMemo2: TDBMemo;
    Panel8: TPanel;
    Label47: TLabel;
    BitBtn9: TBitBtn;
    DBMemo3: TDBMemo;
    Panel9: TPanel;
    DBMemo4: TDBMemo;
    Panel10: TPanel;
    Label48: TLabel;
    BitBtn10: TBitBtn;
    Panel11: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Edit9: TEdit;
    Label49: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    Label50: TLabel;
    Label51: TLabel;
    RadioGroup1: TRadioGroup;
    Edit12: TEdit;
    Label52: TLabel;
    Edit13: TEdit;
    Label53: TLabel;
    Edit14: TEdit;
    Label54: TLabel;
    Edit15: TEdit;
    Label55: TLabel;
    Memo1: TMemo;
    Panel12: TPanel;
    Memo2: TMemo;
    Panel13: TPanel;
    Memo3: TMemo;
    Panel14: TPanel;
    Panel15: TPanel;
    DBGrid3: TDBGrid;
    to_part_ptr: TLabel;
    from_part_ptr: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    BitBtn11: TBitBtn;
    N4: TMenuItem;
    PopupMenu2: TPopupMenu;
    N5: TMenuItem;
    PopupMenu3: TPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    DBCheckBox4: TDBCheckBox;
    Label57: TLabel;
    Label58: TLabel;
    DBText3: TDBText;
    DBText4: TDBText;
    PopupMenu4: TPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    rkey25: TLabel;
    status: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    Label62: TLabel;
    Label63: TLabel;
    BitBtn12: TBitBtn;
    Label64: TLabel;
    BitBtn13: TBitBtn;
    PopupMenu5: TPopupMenu;
    N10: TMenuItem;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    PopupMenu6: TPopupMenu;
    N11: TMenuItem;
    N12: TMenuItem;
    PopupMenu7: TPopupMenu;
    N13: TMenuItem;
    N14: TMenuItem;
    OpenDialog1: TOpenDialog;
    SavePictureDialog1: TSavePictureDialog;
    BitBtn17: TBitBtn;
    Label33: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    BitBtn3: TBitBtn;
    N18: TMenuItem;
    Panel16: TPanel;
    BitBtn20: TBitBtn;
    SG2: TStringGrid;
    PopupMenu8: TPopupMenu;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    Print_menu: TPopupMenu;
    MI1: TMenuItem;
    ECN1: TMenuItem;
    DBGridEh1: TDBGridEh;
    Label69: TLabel;
    PM20: TPopupMenu;
    N19: TMenuItem;
    DBCheckBox5: TDBCheckBox;
    CheckBox2: TCheckBox;
    BitBtn21: TBitBtn;
    N25: TMenuItem;
    SET1: TMenuItem;
    SET2: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    PopupMenu9: TPopupMenu;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    PopupMenu10: TPopupMenu;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    Panel17: TPanel;
    Label71: TLabel;
    Label72: TLabel;
    Panel18: TPanel;
    StringGrid2: TStringGrid;
    ComboBox1: TComboBox;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    N110: TMenuItem;
    N111: TMenuItem;
    N39: TMenuItem;
    PopupMenu11: TPopupMenu;
    DRL1: TMenuItem;
    Genesis1: TMenuItem;
    PopupMenu12: TPopupMenu;
    N40: TMenuItem;
    N41: TMenuItem;
    BitBtn25: TBitBtn;
    DBGrid4: TDBGrid;
    Splitter1: TSplitter;
    DBEdit34: TDBEdit;
    Label68: TLabel;
    Genesis2: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    DBCheckBox6: TDBCheckBox;
    DBEdit35: TDBEdit;
    Label70: TLabel;
    Panel19: TPanel;
    StringGrid3: TStringGrid;
    ComboBox2: TComboBox;
    PopupMenu13: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    Panel20: TPanel;
    Image4: TImage;
    Panel21: TPanel;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    btnNewCut: TBitBtn;
    btnTB: TSpeedButton;
    mniYJDW: TMenuItem;
    mniYJCP: TMenuItem;
    pnl1: TPanel;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    Panel5: TPanel;
    SpeedButton3: TSpeedButton;
    CheckBox1: TCheckBox;
    DBMemo1: TDBMemo;
    pnl2: TPanel;
    btnLoadCYImg: TButton;
    btnClearCY: TButton;
    imgCY: TImage;
    opdg1: TOpenPictureDialog;
    mniN45: TMenuItem;
    rg1: TRadioGroup;
    lbl1: TLabel;
    lbl2: TLabel;
    dbtxtORIG_CUSTOMER: TDBText;
    btn1: TButton;
    dbchkREACH: TDBCheckBox;
    mmo1: TMemo;
    dbtxtORIG_CUSTOMER1: TDBText;
    ScrollBox1: TScrollBox;
    image1: TImage;
    ScrollBox2: TScrollBox;
    image2: TImage;
    ScrollBox3: TScrollBox;
    image3: TImage;
    pnl3: TPanel;
    pnl4: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    btn2: TSpeedButton;
    edt1: TEdit;
    btn3: TBitBtn;
    dbgrd1: TDBGrid;
    pnl5: TPanel;
    pnl6: TPanel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    edtSTEP_NUMBER: TDBEdit;
    edtDEPT_CODE: TDBEdit;
    edtMANU_PART_NUMBER: TDBEdit;
    edttooling_rev: TDBEdit;
    dbmmoDEF_ROUT_INST: TDBMemo;
    edtOUTP_SPFC: TDBEdit;
    dbchkBARCODE_ENTRY_FLAG: TDBCheckBox;
    cbx1: TCheckBox;
    edttool_old_rev: TDBEdit;
    pnl7: TPanel;
    lbl12: TLabel;
    dbmmograde_note: TDBMemo;
    dbgrd2: TDBGrid;
    lbl11: TLabel;
    dbtxtCustFileName: TDBText;
    btn4: TButton;
    btn5: TButton;
    pnl8: TPanel;
    btn6: TButton;
    lbl13: TLabel;
    lbl14: TLabel;
    edtftpip: TEdit;
    lbl15: TLabel;
    edtftpusername: TEdit;
    edtftppassword: TEdit;
    edtftpdir: TEdit;
    lbl16: TLabel;
    IdFTP1: TIdFTP;
    dlgSave1: TSaveDialog;
    cbbgrade: TComboBox;
    btnTool: TSpeedButton;
    pmTool: TPopupMenu;
    N45: TMenuItem;
    ts3: TTabSheet;
    grp1: TGroupBox;
    grp2: TGroupBox;
    img1: TImage;
    img2: TImage;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    dbedtvcut_B: TDBEdit;
    dbedtvcut_T: TDBEdit;
    dbedtvcut_X: TDBEdit;
    dbedtgf_A: TDBEdit;
    dbedtgf_T: TDBEdit;
    dbedtgf_L: TDBEdit;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    pgc2: TPageControl;
    ts4: TTabSheet;
    ts5: TTabSheet;
    StringGrid1: TStringGrid;
    cbb1: TComboBox;
    ts6: TTabSheet;
    strngrd1: TStringGrid;
    strngrd2: TStringGrid;
    pnl9: TPanel;
    Label44: TLabel;
    Label46: TLabel;
    Label45: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    isopen: TCheckBox;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    BitBtn16: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn24: TBitBtn;
    DBEdit36: TDBEdit;
    DBComboBox3: TDBComboBox;
    pnl10: TPanel;
    Label34: TLabel;
    Label80: TLabel;
    btn7: TBitBtn;
    btn8: TBitBtn;
    CheckBox3: TCheckBox;
    Edit2: TEdit;
    Edit16: TEdit;
    btn11: TBitBtn;
    btn12: TBitBtn;
    pnl11: TPanel;
    Label56: TLabel;
    Label81: TLabel;
    btn9: TBitBtn;
    btn10: TBitBtn;
    CheckBox4: TCheckBox;
    Edit17: TEdit;
    BitBtn4: TBitBtn;
    BitBtn26: TBitBtn;
    edt2: TEdit;
    pm1: TPopupMenu;
    pm2: TPopupMenu;
    N49: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    N53: TMenuItem;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit19KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBEdit20KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBEdit22KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBEdit17KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBEdit18KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBEdit15KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit21KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit21KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBEdit17Exit(Sender: TObject);
    procedure DBEdit19Exit(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure N7Click(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure StringGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure StringGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure StringGrid1Exit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBEdit15Exit(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure PopupMenu4Popup(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure Tab(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn16Click(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure SG2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SG2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure N20Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure PopupMenu8Popup(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure MI1Click(Sender: TObject);
    procedure ECN1Click(Sender: TObject);
    procedure SG2Exit(Sender: TObject);
    procedure PM20Popup(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure SET1Click(Sender: TObject);
    procedure SET2Click(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure N27Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure PopupMenu9Popup(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N34Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure StringGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N35Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure PopupMenu10Popup(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure N110Click(Sender: TObject);
    procedure N111Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure DRL1Click(Sender: TObject);
    procedure Genesis1Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure btnNewCutClick(Sender: TObject);
    procedure Genesis2Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure DBComboBox2Change(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure StringGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid3DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid3KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid3SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure PopupMenu13Popup(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure lblUpdateNoteMouseEnter(Sender: TObject);
    procedure lblUpdateNoteMouseLeave(Sender: TObject);
    procedure btnTBClick(Sender: TObject);
    procedure mniYJDWClick(Sender: TObject);
    procedure btnLoadCYImgClick(Sender: TObject);
    procedure btnClearCYClick(Sender: TObject);
    procedure mniN45Click(Sender: TObject);
    procedure rg1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure cbbgradeExit(Sender: TObject);
    procedure cbbgradeKeyPress(Sender: TObject; var Key: Char);
    procedure btnToolClick(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure cbb1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure N47Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedtvcut_BKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtvcut_TKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtvcut_XKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtgf_TKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtgf_AKeyPress(Sender: TObject; var Key: Char);
    procedure N49Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
   
    procedure N53Click(Sender: TObject);
    procedure N52Click(Sender: TObject);
  private
    { Private declarations }
    FHintFrm: THintWindow;
   est_scrap : single; 
   OldGridWnd : TWndMethod;
   dbgrid2wnd : TWndMethod;
   ecnopen,if_post,impedance,target:boolean; //是否需要重新打开ecn清单
   strow,file_name:Tstringlist; //用于交换的字符串,用于存储上传的工程文档
   rev:string; //产品版本
   procedure NewGridWnd (var Message : TMessage);
   procedure NewGrid2Wnd (var Message : TMessage);
   procedure get_picturedata502(rkey25:integer);
   procedure get_value(rkey278:integer);
   procedure get_data0279(rkey25:integer);
   procedure  get_drill(rkey25:integer);
   function get_employeename(rkey05: integer):string;
   function get_mindrill():single;
   function get_mindrill2():single;
   function get_mindrill3():single;
   function get_drTrow(row:integer):string;
   function get_drTrow2(row:integer):string;   
   function get_customer(rkey10:integer):string;
   procedure update_notebook();
   procedure get_ecninfo(to_part_ptr:integer);
   function find_spec_rkey(spec_rkey: string): boolean;
   procedure update_deptcode(rkey25:integer);
   procedure update_tecparameter(rkey25:integer);
   procedure update_IESparameter(rkey25:integer);
   procedure update_drill(rkey25:integer);
   procedure load_xls_to_sgrid(fileName:String; grid:TStringGrid);
   function get_date0025toprkey(rkey25: integer):integer;
   procedure get_treedate(rkey25:integer;treeview:Ttreeview);
   procedure get_ecnlist(rkey25:integer);
   procedure get_impedance(rkey25:integer);
   procedure update_impedance(rkey25:integer);
   procedure get_target(rkey25:integer);
   procedure update_target(rkey25:integer);
   procedure update_ecnlist(rkey25:integer);
 //  function find_difficulty(rkey25:integer) :boolean;

   function calaflowpara(vstr:string):string;
   function vertify3(vstring:string):string;
   procedure update_filename();
   procedure Paste(var str:string);
   function isnum(str:string):boolean;
   function hz_jiajian(str:string;jia_or_jian:byte):string;
   function dr_jishuan(dr:single):single;
   function find_33null():boolean;
   procedure update_quanju();
  public
    { Public declarations }
  //  nearsize_part:string; //寻找拼版尺寸或交货尺寸相近的部件作出提示
    //FRkey25Arr: array [0..1021] of Integer;
    function find_setpnlmin(var nearsize_part:string):boolean;
    function find_nearpnlmin(var nearsize_part:string;pnl_size,pnl_width:string): boolean;
    function cacl_flowpara(tvalue,par_formula :string):string;
  end;

type
 TMyDBGrid=class(TDBGrid);

var
 Form2: TForm2;
const
 TmpFileDir = 'c:\tmp\wisdom\';

implementation

uses damo, common, route_flow, flowpara_edit, deptcode_search,
  layer_frame, PickEngNote, append_productin, main, prod_search,
  stepnumber_search, layersdata_select, reportselect, report_data,
  product_search, drcacle, FileReadWriteUnitClass,PCBCUT, report_data1,
  PubFunc,shellAPI, Genesis_dr, holemanager, Unit2, childpart,
  IniFiles, SameQryFrm, FindStemParamFrm;

{$R *.dfm}
procedure TForm2.get_impedance(rkey25: integer);
var i:integer;
begin
for i:=1 to stringgrid2.RowCount-2 do  stringgrid2.Rows[i].Clear;
 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select  MARK, layer, refe_layer, line_width, line_ofsight,'+
    'impedance, adjust_linewidth, adjust_lineofsight, adjust_impedance, product_impedance,'+
    'impedance_scope,orig_juli,adjust_jiuli,coupon,'+
    'type from data0030 where source_ptr='+inttostr(rkey25)+' order by seq_no ';
  open;
  stringgrid2.RowCount:=recordcount+2;
  for i:=1 to recordcount do
  begin
   stringgrid2.Cells[1,i]:=trim(fieldbyname('type').AsString);//类型
   stringgrid2.Cells[2,i]:=trim(fieldbyname('coupon').AsString);//coupon
   stringgrid2.Cells[3,i]:=trim(fieldbyname('layer').AsString);//层次
   stringgrid2.Cells[4,i]:=trim(fieldbyname('refe_layer').AsString);//参考层
   stringgrid2.Cells[5,i]:=trim(fieldbyname('product_impedance').AsString);//成品阻抗
   stringgrid2.Cells[6,i]:=trim(fieldbyname('adjust_impedance').AsString);//绿油前阻抗
   stringgrid2.Cells[7,i]:=trim(fieldbyname('impedance_scope').AsString);//阻抗控制范围
   stringgrid2.Cells[8,i]:=trim(fieldbyname('line_width').AsString);//客户线宽
   stringgrid2.Cells[9,i]:=trim(fieldbyname('line_ofsight').AsString); //客户线距;
   //ringgrid2.Cells[10,i]:=trim(fieldbyname('impedance').AsString); //客户阻抗;
   stringgrid2.Cells[10,i]:=trim(fieldbyname('orig_juli').AsString); //原始到铜皮距离;
   stringgrid2.Cells[11,i]:=trim(fieldbyname('adjust_linewidth').AsString); //调整线宽;
   stringgrid2.Cells[12,i]:=trim(fieldbyname('adjust_lineofsight').AsString); //调整线距;
   stringgrid2.Cells[13,i]:=trim(fieldbyname('adjust_jiuli').AsString); //调整后到铜皮距离;
   next;
  end;
  impedance:=true;
 end;

end;

procedure TForm2.update_impedance(rkey25:integer);
var i:integer;
begin
with dm.ADOQuery1 do
begin
 close;
 sql.Text:='delete from data0030 where source_ptr='+inttostr(rkey25);
 execsql;
end;

with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select seq_no,source_ptr, MARK, layer, refe_layer, line_width, line_ofsight,'+
    'impedance, adjust_linewidth, adjust_lineofsight, adjust_impedance, product_impedance,coupon,'+
    'type,impedance_scope,orig_juli,adjust_jiuli from data0030 where source_ptr='+inttostr(rkey25)+' order by seq_no ';
  open;
 end;

  for i:=1 to stringgrid2.RowCount-2 do
  begin
    dm.ADOQuery1.Append;
    dm.ADOQuery1.fieldbyname('seq_no').AsInteger := i;
    dm.ADOQuery1.fieldbyname('source_ptr').AsInteger := rkey25;
    dm.ADOQuery1.fieldbyname('MARK').AsString := '';
    dm.ADOQuery1.fieldbyname('impedance').AsString := '' ;
    dm.ADOQuery1.fieldbyname('type').AsString := stringgrid2.Cells[1,i];//类型
    dm.ADOQuery1.fieldbyname('coupon').AsString := stringgrid2.Cells[2,i];//coupon
    dm.ADOQuery1.fieldbyname('layer').AsString := stringgrid2.Cells[3,i];//层次
    dm.ADOQuery1.fieldbyname('refe_layer').AsString := stringgrid2.Cells[4,i];//参考层
    dm.ADOQuery1.fieldbyname('product_impedance').AsString := stringgrid2.Cells[5,i];//成品阻抗
    dm.ADOQuery1.fieldbyname('adjust_impedance').AsString := stringgrid2.Cells[6,i];//绿油前阻抗
    dm.ADOQuery1.fieldbyname('impedance_scope').AsString := stringgrid2.Cells[7,i];//阻抗控制范围
    dm.ADOQuery1.fieldbyname('line_width').AsString := stringgrid2.Cells[8,i];//客户线宽
    dm.ADOQuery1.fieldbyname('line_ofsight').AsString := stringgrid2.Cells[9,i]; //客户线距;
    //ringgrid2.Cells[10,i]:=trim(fieldbyname('impedance').AsString); //客户阻抗;
    dm.ADOQuery1.fieldbyname('orig_juli').AsString := stringgrid2.Cells[10,i]; //原始到铜皮距离;
    dm.ADOQuery1.fieldbyname('adjust_linewidth').AsString := stringgrid2.Cells[11,i]; //调整线宽;
    dm.ADOQuery1.fieldbyname('adjust_lineofsight').AsString := stringgrid2.Cells[12,i]; //调整线距;
    dm.ADOQuery1.fieldbyname('adjust_jiuli').AsString := stringgrid2.Cells[13,i]; //调整后到铜皮距离;
    dm.ADOQuery1.Post;
  end;


end;

procedure TForm2.get_target(rkey25:integer);
 var i:integer;
begin
for i:=1 to stringgrid3.RowCount-2 do StringGrid3.Rows[i].Clear;
 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select seq_no,source_ptr,layer_remark,YAB,XFB,'+
    'XFC, XFG, XEA, XED, remark from data0033 where source_ptr='+inttostr(rkey25)+' order by seq_no ';
  open;
  stringgrid3.RowCount:=recordcount+2;
  for i:=1 to recordcount do
  begin
   stringgrid3.Cells[1,i]:=trim(fieldbyname('layer_remark').AsString);//层次说明
   stringgrid3.Cells[2,i]:=trim(fieldbyname('YAB').AsString);//YAB
   stringgrid3.Cells[3,i]:=trim(fieldbyname('XFB').AsString);//XFB
   stringgrid3.Cells[4,i]:=trim(fieldbyname('XFC').AsString);//XFC
   stringgrid3.Cells[5,i]:=trim(fieldbyname('XFG').AsString);//XFG
   stringgrid3.Cells[6,i]:=trim(fieldbyname('XEA').AsString);//XEA
   stringgrid3.Cells[7,i]:=trim(fieldbyname('XED').AsString);//XED
   stringgrid3.Cells[8,i]:=trim(fieldbyname('remark').AsString);//备注信息
   next;
  end;
  target:=True;
 end;
end;

procedure TForm2.update_target(rkey25:integer);
var i:integer;
begin
if find_33null then
begin
  with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='delete from data0033 where source_ptr='+inttostr(rkey25);
   execsql;
  end;

with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select seq_no,source_ptr,layer_remark,YAB,XFB,'+
    'XFC,XFG,XEA,XED,remark from data0033 where source_ptr='+inttostr(rkey25)+' order by seq_no ';
  open;
 end;

  for i:=1 to stringgrid3.RowCount-2 do
   dm.ADOQuery1.AppendRecord([i,
                              rkey25,
                              stringgrid3.Cells[1,i],
                              stringgrid3.Cells[2,i],
                              stringgrid3.Cells[3,i],
                              stringgrid3.Cells[4,i],
                              stringgrid3.Cells[5,i],
                              stringgrid3.Cells[6,i],
                              stringgrid3.Cells[7,i],
                              stringgrid3.Cells[8,i]]);

end;
end;


procedure Tform2.get_ecnlist(rkey25:integer);
var i:integer;
begin
 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select serial_no,part_number,text,source,if_gerber,'
    +'engineer,enter_date,ecn_no,create_employee '
    +' from data0035 where part_ptr='+inttostr(rkey25)+' order by serial_no ';
  open;
  sg2.RowCount:=recordcount+2;
  for i:=1 to recordcount do
  begin
   sg2.Cells[0,i]:=inttostr(i);
   sg2.Cells[1,i]:=trim(fieldbyname('part_number').AsString);
   sg2.Cells[2,i]:=trim(fieldbyname('text').AsString);
   sg2.Cells[3,i]:=trim(fieldbyname('source').AsString);
   sg2.Cells[4,i]:=trim(fieldbyname('if_gerber').AsString);
   sg2.Cells[5,i]:=trim(fieldbyname('engineer').AsString);
   sg2.Cells[6,i]:=trim(fieldbyname('enter_date').AsString);
   sg2.Cells[7,i]:=trim(fieldbyname('ecn_no').AsString);
   sg2.Cells[8,i]:=trim(fieldbyname('create_employee').AsString);
   next;
  end;
  ecnopen:=true;
 end;
end;

function Tform2.vertify3(vstring:string):string;
var
  i,j,j0,j1:integer;
begin
 vstring:=' '+vstring+' ';

while POS('IF(',vstring) > 0 do
 begin
  i:=POS('IF(',vstring);
  j:=POS(',',vstring);
  j0:=POS(',',copy(vstring,j+1,length(vstring)-j));
  j1:=POS(')',copy(vstring,j+j0+1,length(vstring)-j-j0));

  try    //检验IF（条件，返回值1，返回值2）函数的条件表达式是否合法
   with dm.ADOQuery4 do
    begin
     close;
     sql.clear;
     sql.add('select 1 as true_or_false where '+copy(vstring,i+3,j-i-3));
     open;
    end;
  except
   showmessage('工式设定条件不准确'+dm.ADS38STEP_NUMBER.AsString);
   exit;
  end;

  if not dm.ADOQuery4.IsEmpty then   //不为空代表条件成立,取返回值1
   try    //检验IF（条件，返回值1，返回值2）函数的返回值1是否有效
     with dm.ADOQuery4 do
      begin
       close;
       sql.clear;
       sql.add('SELECT 1.000000*('+copy(vstring,j+1,j0-1)+') as vqty ');
       open;
      end;
   except
    showmessage('工式设定函数的返回值1不准确'+dm.ADS38STEP_NUMBER.AsString);
    exit;
   end
  else    // 条件不成立取返回值2
   try    //检验IF（条件，返回值1，返回值2）函数的返回值2是否有效
    with dm.ADOQuery4 do
     begin
      close;
      sql.clear;
      sql.add('SELECT 1.000000*('+copy(vstring,j+j0+1,j1-1)+') as vqty ');
      open;
     end;
   except
    showmessage('工式设定函数的返回值2不准确'+dm.ADS38STEP_NUMBER.AsString);
    exit;
   end;

   vstring:=copy(vstring,1,i-1)+dm.ADOQuery4.fieldbyname('vqty').asstring+
            copy(vstring,j+j0+j1+1,length(vstring)-j-j0-j1);
 end;

 result:='SELECT '+vstring+' as tvalue';
end;

function Tform2.calaflowpara(vstr:string):string;
var
  j:integer;
  vstring,vstring1,vstring2:string;
begin
 vstring:=' '+vstr+' ';

 while pos(' PROJECT ',vstring)>0 do//如果产品型号被引用多次
  begin
   j:=pos(' PROJECT ',vstring);
   vstring1:=copy(vstring,1,j-1);
   vstring2:=copy(vstring,j+2+length(trim(' PROJECT ')),500-j-length(trim(' PROJECT ')));
   vstring:=vstring1+' '''+treeview1.Items[0].Text+''''+vstring2;
  end;

 dm.ADS279.DisableControls;
 dm.ads279.First ;
 while not dm.ads279.eof do
  begin
   while pos(' '+trim(dm.ads279PARAMETER_NAME.Value)+' ',vstring)>0 do //如果一个参数出现了多次就通过这个循环逐一代换
    begin
      j:=pos(' '+trim(dm.ads279PARAMETER_NAME.Value)+' ',vstring);
      vstring1:=copy(vstring,1,j-1);
      vstring2:=copy(vstring,j+2+length(trim(dm.ads279PARAMETER_NAME.Value)),
                           500-j-length(trim(dm.ads279PARAMETER_NAME.Value)));
      IF dm.ads279datatype.value='数字' then    //代表数值型变量
       if pos('.',trim(dm.ads279PARAMETER_VALUE.Value))>0 then
        vstring:=vstring1+' '+trim(dm.ads279PARAMETER_VALUE.Value)+' '+vstring2
       else
        vstring:=vstring1+' '+trim(dm.ads279PARAMETER_VALUE.Value)+'.0000000'+' '+vstring2
      else     //字符型
       vstring:=vstring1+' '''+trim(dm.ads279PARAMETER_VALUE.Value)+''' '+vstring2;
    end;
   dm.ads279.Next;
  end;
  dm.ADS279.EnableControls;

  if POS('IF(',vstring) > 0 then
   result := vertify3(vstring)
  else
   result := 'SELECT '+vstring+' as tvalue';
end;

function Tform2.cacl_flowpara(tvalue, par_formula: string): string;
begin
 result:=tvalue;

 if par_formula<>'' then
  try
   dm.ADOQuery3.Close;
   dm.ADOQuery3.SQL.Text:=self.calaflowpara(par_formula);
   dm.ADOQuery3.Open;

  if not dm.ADOQuery3.IsEmpty then
   result:=dm.ADOQuery3.fieldbyname('tvalue').AsString;
  except

  end

end;

procedure Tform2.update_ecnlist(rkey25:integer);
var i:byte;
begin
 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='delete data0035 where part_ptr='+inttostr(rkey25);
  execsql;

  sql.Text:='select serial_no,part_number,text,source,if_gerber,'
    +'engineer,enter_date,ecn_no,create_employee,part_ptr '
    +' from data0035 where part_ptr='+inttostr(rkey25);
  open;
  for i:=1 to sg2.RowCount-2 do
   if trim(sg2.Cells[6,i])='' then
     dm.ADOQuery1.AppendRecord([i,sg2.cells[1,i],sg2.cells[2,i],sg2.cells[3,i],
       sg2.cells[4,i],sg2.cells[5,i],null,sg2.cells[7,i],
       sg2.cells[8,i],rkey25])
   else
     dm.ADOQuery1.AppendRecord([i,sg2.cells[1,i],sg2.cells[2,i],sg2.cells[3,i],
       sg2.cells[4,i],sg2.cells[5,i],strtodate(sg2.cells[6,i]),sg2.cells[7,i],
       sg2.cells[8,i],rkey25]);
 end;
end;

function TForm2.find_setpnlmin(var nearsize_part:string): boolean;
begin
  nearsize_part:='';
 with dm.ADOQuery5 do
 begin
  close;
  sql.Delete(sql.Count-2);  //注意sql的静态语句最后增加空行
  if dm.AQY0025PARENT_PTR.Value > 0 then       //内层
    sql.Insert(sql.Count-1,'and (PARENT_PTR <> '+dm.AQY0025PARENT_PTR.AsString+')')
  else                                //外层
    sql.Insert(sql.Count-1,'and (PARENT_PTR is null)');

  Parameters.ParamByName('set_len_min').Value:=dm.AQY0025set_lngth.Value-1;
  Parameters.ParamByName('set_len_max').Value:=dm.AQY0025set_lngth.Value+1;
  Parameters.ParamByName('set_wth_min').Value:=dm.AQY0025set_width.Value-1;
  Parameters.ParamByName('set_wth_max').Value:=dm.AQY0025set_width.Value+1;
  Parameters.ParamByName('set_len_min1').Value:=dm.AQY0025set_width.Value-1;
  Parameters.ParamByName('set_len_max1').Value:=dm.AQY0025set_width.Value+1;
  Parameters.ParamByName('set_wth_min1').Value:=dm.AQY0025set_lngth.Value-1;
  Parameters.ParamByName('set_wth_max1').Value:=dm.AQY0025set_lngth.Value+1;
  Parameters.ParamByName('rkey').Value:=dm.AQY0025RKEY.Value;
  Prepared:=true;
  open;
  while not Eof do
  begin
   nearsize_part:=nearsize_part+Fieldbyname('number').AsString+Fieldbyname('rev').AsString+' ';
   Next;
  end;
  Close;  //增加andy081030
 end;

  if Trim(nearsize_part)='' then
   result:=false
  else
   result:=true;

end;

function TForm2.find_nearpnlmin(var nearsize_part:string;pnl_size,pnl_width:string): boolean;
begin
 nearsize_part:='';
 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:=
   'SELECT top 50 dbo.Data0025.MANU_PART_NUMBER'+#13+
   ' FROM  dbo.Data0279 INNER JOIN'+#13+
   '  dbo.Data0278 ON dbo.Data0279.PARAMETER_PTR = dbo.Data0278.RKEY INNER JOIN'+#13+
   '  dbo.Data0025 ON dbo.Data0279.SOURCE_PTR = dbo.Data0025.RKEY INNER JOIN'+#13+
   '  dbo.Data0279 AS Data0279_1 ON dbo.Data0025.RKEY = Data0279_1.SOURCE_PTR INNER JOIN'+#13+
   '   dbo.Data0278 AS Data0278_1 ON Data0279_1.PARAMETER_PTR = Data0278_1.RKEY'+#13+

  'where (data0025.ANALYSIS_CODE_1='+quotedstr(dm.AQY0025ANALYSIS_CODE_1.Value)+')'+#13+  //交货尺寸相同

  'AND (Data0278.SPEC_RKEY = ''6'')'+#13+       //A板长参数
  'AND (DATA0025.PARENT_PTR is null)'+#13+          //外层
  'AND (Data0278_1.SPEC_RKEY = ''7'')'+#13+         //A板宽参数

  'AND (Data0279.PARAMETER_VALUE >= '+quotedstr(CurrToStr(StrToCurr(pnl_size)-3))+')'+#13+  //大于等于A板尺 长减3mm
  'AND (Data0279.PARAMETER_VALUE <= '+quotedstr(CurrToStr(StrToCurr(pnl_size)+3))+')'+#13+  //小于等于A板尺 长加3mm

  'AND (Data0279_1.PARAMETER_VALUE >= '+quotedstr(CurrToStr(StrToCurr(pnl_width)-3))+')'+#13+  //大于等于A板尺 宽减3mm
  'AND (Data0279_1.PARAMETER_VALUE <= '+quotedstr(CurrToStr(StrToCurr(pnl_width)+3))+')'+#13+  //小于等于A板尺 宽加3mm

  'and (SUBSTRING(dbo.Data0025.MANU_PART_NUMBER, 1, LEN(dbo.Data0025.MANU_PART_NUMBER) - 2) <> '+
   quotedstr(Copy(dm.AQY0025MANU_PART_NUMBER.Value,1,length(dm.AQY0025MANU_PART_NUMBER.Value)-2))+')'+#13+
   'order by Data0025.MANU_PART_NUMBER desc';

  Prepared;
  open;
  while not Eof do
  begin
   nearsize_part:=nearsize_part+Fieldbyname('MANU_PART_NUMBER').AsString+' ';
   Next;
  end;
 end;

 if Trim(nearsize_part)='' then
  result:=false
 else
  result:=true;

end;

procedure TForm2.Tab(Sender: TObject; var Key: Word; Shift: TShiftState);
Begin
  if (key=VK_Down) or (key=13) then
   SelectNext(ActiveControl,True,True);
  if key=VK_Up then
   SelectNext(ActiveControl,False,True);
  Key:=0;
end;

function TForm2.find_spec_rkey(spec_rkey: string): boolean;
begin
dm.ads279.DisableControls;
result:=false;
dm.ads279.First;
while not dm.ads279.Eof do
 begin
  if trim(dm.ads279SPEC_RKEY.Value)=spec_rkey then
   begin
    result:=true;
    break;
   end;
  dm.ads279.Next;
 end;
dm.ads279.EnableControls;
end;

procedure TForm2.get_ecninfo(to_part_ptr:integer);
begin
with dm.ADOQuery1 do
begin
 close;
 sql.Text:='SELECT dbo.Data0273.ECN_NO, dbo.Data0273.text, dbo.Data0273.remark,'+#13+
      'Data0005_1.EMPLOYEE_NAME AS ent_emplname, dbo.Data0273.ENTERED_DATE,'+#13+
      'data0005_2.EMPLOYEE_NAME AS modi_emplname, dbo.Data0273.last_modi_date,'+#13+
      'data0273.SOURCE, dbo.Data0273.TEXT1, dbo.Data0273.TEXT3,'+#13+
      'data0025_1.MANU_PART_NUMBER AS from_partnumber,'+#13+
      'Data0025_2.MANU_PART_NUMBER AS to_partnumber,'+#13+
      'Data0273.COPYFROMCUST_PTR, dbo.Data0273.CUSTOMER_PART_PTR'+#13+
      'FROM dbo.Data0273 INNER JOIN'+#13+
      'dbo.Data0005 Data0005_1 ON'+#13+
      'dbo.Data0273.ENTERED_BY = Data0005_1.RKEY INNER JOIN'+#13+
      'dbo.Data0025 data0025_1 ON'+#13+
      'dbo.Data0273.COPYFROMCUST_PTR = data0025_1.RKEY INNER JOIN'+#13+
      'dbo.Data0025 Data0025_2 ON'+#13+
      'dbo.Data0273.CUSTOMER_PART_PTR = Data0025_2.RKEY LEFT OUTER JOIN'+#13+
      'dbo.Data0005 data0005_2 ON dbo.Data0273.last_modi_by_ptr = data0005_2.RKEY'+#13+
      'where data0273.CUSTOMER_PART_PTR='+inttostr(to_part_ptr);
 open;
 if not isempty then
 begin
  edit9.Text:=fieldbyname('ECN_NO').AsString;
  edit10.Text:=fieldbyname('from_partnumber').AsString;
  edit11.Text:=fieldbyname('to_partnumber').AsString;
  edit12.Text:=fieldbyname('ent_emplname').AsString;
  edit13.Text:=fieldbyname('ENTERED_DATE').AsString;
  edit14.Text:=fieldbyname('modi_emplname').AsString;
  edit15.Text:=fieldbyname('last_modi_date').AsString;
  radiogroup1.ItemIndex:=fieldbyname('source').AsInteger-1;
  memo2.Text:=fieldbyname('text').AsString;
  memo1.Text:=fieldbyname('remark').AsString;
  self.to_part_ptr.Caption:=fieldbyname('CUSTOMER_PART_PTR').AsString;
  self.from_part_ptr.Caption:=fieldbyname('COPYFROMCUST_PTR').AsString;
 end
else
 begin
  self.from_part_ptr.Caption:='0';
 end;
end;
end;

procedure TForm2.update_notebook;
begin
 dm.AQY0025.Close;
 dm.ads502.Close;
 dm.ads279.Close;
 dm.ADS38.Close;
 dm.ads494.Close;
 dm.ads497.Close;
 dm.ADS279_0.Close;
 dm.ads89.Close;
 dm.ads564.Close;
 dm.ADO20.Close;
 file_name.Clear;
 edit3.Text:='';         //最后修改人
 isopen.Checked:=false;  //钻孔表需要重新打开
 impedance:=false;       //阻抗表需重新打开
 ecnopen:=false;         //ecn清单需要重新打开
 target:=false;          //压合靶矩表需重新打开
 memo2.ReadOnly:=false;  //ECN需要重新打开
 memo3.ReadOnly:=false;  //客户信息需要重新打开
end;

procedure  TForm2.get_value(rkey278:integer);
begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select tvalue from data0338 where parameter_ptr='+inttostr(rkey278));
    open;
   end;
  if not dm.adoquery1.IsEmpty then
   begin
    DBComboBox1.Items.Clear;
    while not dm.adoquery1.eof do
     begin
      DBComboBox1.Items.Add(trim(dm.adoquery1.FieldValues['tvalue']));
      dm.adoquery1.Next;
     end;
   end
  else
   DBComboBox1.Items.Clear;
end;

procedure TForm2.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TForm2.NewGrid2Wnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
// if Message.Msg = WM_MOUSEWHEEL then
// begin
//   IsNeg := Short(Message.WParamHi) < 0;
//   if IsNeg then
//     DBGrid2.DataSource.DataSet.MoveBy(1)
//   else
//     DBGrid2.DataSource.DataSet.MoveBy(-1)
// end
// else
//   dbgrid2wnd(Message);
end;

procedure TForm2.get_picturedata502(rkey25:integer);
begin
 image1.Picture.Assign(nil);
 image2.Picture.Assign(nil);
 image3.Picture.Assign(nil);
 image1.Canvas.Brush.Color:=clwhite;
 image2.Canvas.Brush.Color:=clwhite;
 image3.Canvas.Brush.Color:=clwhite;
 dm.ads502.Close;
 dm.ads502.Parameters[0].Value:=rkey25;
 dm.ads502.Open;
 if not dm.ads502.IsEmpty then
 begin
  image1.Picture.Assign(Load_JPG_Pic_From_DB(dm.ads502sheet_BMP));
  if dm.ads502PNL_LEN.Value>0 then
   image2.Picture.Assign(Load_JPG_Pic_From_DB(dm.ads502pnl_bmp));
  if not dm.ads502pnl2_bmp.IsNull then
   image3.Picture.Assign(Load_JPG_Pic_From_DB(dm.ads502pnl2_bmp));
  if strtoint(status.Caption)=0 then   //编辑
   begin
    if abs(dm.AQY0025spell_lngth.Value - dm.ads502UNIT_LEN.Value)>0.001 then
     dm.AQY0025spell_lngth.Value := dm.ads502UNIT_LEN.Value;
    if abs(dm.AQY0025spell_width.Value - dm.ads502UNIT_WTH.Value)>0.001 then
     dm.AQY0025spell_width.Value := dm.ads502UNIT_WTH.Value;

    if dm.AQY0025spell_qty.Value<>dm.ads502UNIT_NUM.Value then
     dm.AQY0025spell_qty.Value := dm.ads502UNIT_NUM.Value;
    DBEdit19Exit(nil);
   end;
 end;
end;


procedure TForm2.get_data0279(rkey25:integer);
begin
  dm.ads279.DisableControls;
  dm.ads279.close;
  dm.ads279.Parameters[0].Value:=rkey25;
  dm.ads279.Open;

  with dm.ADOQuery1 do
  begin
   close;
   sql.Text:=
   'SELECT TOP 100 PERCENT RKEY,SEQUENCE_NO FROM dbo.Data0278'+#13+
   'WHERE (CATEGORY_PTR = 2)'+#13+
   'ORDER BY SEQUENCE_NO';
   open;
  end;

  if dm.ads279.IsEmpty then
   begin
    while not dm.ADOQuery1.Eof do
     begin
      dm.ads279.Append;
      dm.ads279parameter_ptr.Value := dm.ADOQuery1.FieldValues['rkey'];
      dm.ads279IES_PROD.Value:=1;       //代表全局参数0代表流程判断参数
      dm.ads279IES_CRP.AsVariant:=dm.ADOQuery1.FieldValues['SEQUENCE_NO'];//排序字段
      dm.ads279source_PTR.Value := rkey25;
      dm.ads279.Post;
      dm.ADOQuery1.Next;
     end;
    dm.ADOQuery1.Close;
    dm.ads279.First;
   end
  else
   begin
    while not dm.ADOQuery1.Eof do
     begin
      if not dm.ads279.Locate('parameter_ptr',dm.ADOQuery1.FieldValues['rkey'],[]) then
       begin
        dm.ads279.Append;
        dm.ads279parameter_ptr.Value:=dm.ADOQuery1.FieldValues['rkey'];
        dm.ads279IES_PROD.Value:=1;
        dm.ads279IES_CRP.AsVariant:=dm.ADOQuery1.FieldValues['SEQUENCE_NO'];//排序字段
        dm.ads279source_PTR.Value:=rkey25;
        dm.ads279.Post;
       end;
       dm.ADOQuery1.Next;
     end;
    dm.ADOQuery1.Close;
    dm.ads279.First;
   end;

  dm.ads279.EnableControls;
end;

function TForm2.get_mindrill():single;
var
 min_drill:single;
 i:integer;
begin
 try
  if stringgrid1.Cells[6,1] <> '' then
    min_drill:= strtocurr(stringgrid1.Cells[6,1]);
 except
  min_drill:=0;
 end;

 if stringgrid1.RowCount>3 then
 for i:=2 to stringgrid1.RowCount-2 do
 begin
    if stringgrid1.Cells[6,i] <> '' then
    begin
      try
       strtofloat(stringgrid1.Cells[6,i]);
      except
       Continue;
      end;
      if  strtofloat(stringgrid1.Cells[6,i]) < min_drill then
       min_drill:= strtocurr( stringgrid1.Cells[6,i]);
    end;
 end;
 result:=min_drill;
end;

function TForm2.get_mindrill2():single;
var
 min_drill:single;
 i:integer;
begin
 try
  if strngrd1.Cells[6,1] <> '' then
    min_drill:= strtocurr(strngrd1.Cells[6,1]);
 except
   min_drill:=0;
 end;

 if strngrd1.RowCount>3 then
 for i:=2 to strngrd1.RowCount-2 do
 begin
    if strngrd1.Cells[6,i] <> '' then
    begin
      try
       strtofloat(strngrd1.Cells[6,i]);
      except
       Continue;
      end;
      if  strtofloat(strngrd1.Cells[6,i]) < min_drill then
       min_drill:= strtocurr( strngrd1.Cells[6,i]);
    end;
 end;
 result:=min_drill;
end;

function TForm2.get_mindrill3():single;
var
 min_drill:single;
 i:integer;
begin
 try
  if strngrd2.Cells[6,1] <> '' then
    min_drill:= strtocurr(strngrd2.Cells[6,1]);
 except
  min_drill:=0;
 end;

 if strngrd2.RowCount>3 then
 for i:=2 to strngrd2.RowCount-2 do
 begin
    if strngrd2.Cells[6,i] <> '' then
    begin
      try
       strtofloat(strngrd2.Cells[6,i]);
      except
       Continue;
      end;
      if  strtofloat(strngrd2.Cells[6,i]) < min_drill then
       min_drill:= strtocurr( strngrd2.Cells[6,i]);
    end;
 end;
 result:=min_drill;
end;


function TForm2.get_drTrow(row: integer): string;
var
 i,t1:integer;
 t0:string;
begin
 if row <= 1 then
  result:='1'
 else
  for i:=row-1 downto 1 do
   if trim(stringgrid1.Cells[1,i])<>'' then
    begin
     t0:=copy(trim(stringgrid1.Cells[1,i]),2,length(trim(stringgrid1.Cells[1,i]))-1);
     try
      t1:=strtoint(t0)+1;
     except
      t1:=row;
     end;
     result:=inttostr(t1);
     break;
    end
   else
    if i=1 then
     result:='1'
    else
     result:=inttostr(row);
end;

function TForm2.get_drTrow2(row: integer): string;
var
 i:integer;
 t0:string;
begin
 if row <= 1 then
  result:='A'
 else
  for i:=row-1 downto 1 do
   if trim(stringgrid2.Cells[3,i])<>'' then
    begin
     t0 :=copy(trim(stringgrid2.Cells[3,i]),
                length(trim(stringgrid2.Cells[3,i])),1);
     result:=succ(t0[1]);
     break;
    end
   else
    if i=1 then
     result:='A';
end;

procedure TForm2.update_deptcode(rkey25:integer);
begin
with dm.ADOQuery1 do
begin
 close;
 sql.Text:='delete from data0494 where custpart_ptr='+inttostr(rkey25);
 execsql;
end;
with dm.ADOQuery1 do
begin
 close;
 sql.Text:='delete from data0038 where source_ptr='+inttostr(rkey25);
 execsql;
end;

with dm.ADOQuery1 do
 begin
  close;
  sql.Text:=
  'SELECT SOURCE_PTR, DEPT_PTR, DEF_ROUT_INST, STEP_NUMBER, '+#13+
  'tooling_rev, OUTP_SPFC,tool_old_rev,TOOL_REMARK,grade_note'+#13+
  'FROM Data0038'+#13+
  'where source_ptr='+inttostr(rkey25);
  open;
 end;

dm.ADS38.First;
while not dm.ADS38.Eof do
begin
   dm.ADOQuery1.AppendRecord([dm.ADS38SOURCE_PTR.Value,
                              dm.ADS38DEPT_PTR.Value,
                              dm.ADS38DEF_ROUT_INST.Value,
                              dm.ADS38STEP_NUMBER.Value,
                              dm.ADS38tooling_rev.Value,
                              dm.ADS38OUTP_SPFC.Value,
                              dm.ADS38tool_old_rev.Value,
                              dm.ADS38TOOL_REMARK.Value,
                              dm.ADS38.FieldByName('grade_note').Value]);
 dm.ADS38.Next;
end;
end;

procedure TForm2.update_tecparameter(rkey25:integer);
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:=
  'SELECT PARAMETER_PTR, PARAMETER_VALUE, custpart_ptr, step_number,'+#13+
  ' seq_no, Doc_Flag, after_flag, flow_spfc_flag, outp_spfc_flag '+#13+
  'FROM dbo.Data0494'+#13+
  'where custpart_ptr='+inttostr(rkey25);
  open;
 end;

dm.ads494.Filter:='';
dm.ads494.First;
while not dm.ads494.Eof do
begin
   dm.ADOQuery1.AppendRecord([dm.ads494PARAMETER_PTR.Value,  //参数指针278
                              dm.ads494PARAMETER_VALUE.Value, //参数值
                              dm.ads494custpart_ptr.Value,   //产品指针25
                              dm.ads494step_number.Value,    //产品步骤
                              dm.ads494seq_no.Value,        //序号
                              dm.ads494Doc_Flag.Value,      //是否打印
                              dm.ads494after_flag.Value,     //后补
                              dm.ads494flow_spfc_flag.Value,   //是否重点
                              DM.strngfldads494outp_spfc_flag.value
                              ]);
 dm.ads494.Next;
end;
end;

procedure TForm2.update_IESparameter(rkey25:integer);
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:=
  'SELECT PARAMETER_PTR, PARAMETER_VALUE, source_ptr,'+#13+
  'route_step_ptr ,seq_no'+#13+
  'FROM Data0497'+#13+
  'where rkey is null';
  open;
 end;

with dm.ADOQuery2 do
 begin
  close;
  sql.Text:=
  'SELECT rkey,DEPT_PTR, STEP_NUMBER'+#13+
  'FROM Data0038'+#13+
  'where source_ptr='+inttostr(rkey25)+#13+
  'order by STEP_NUMBER';
  open;
 end;

while not dm.ADOQuery2.Eof do
 begin
  dm.ads497.Filter:='STEP_NUMBER='+dm.ADOQuery2.fieldbyname('STEP_NUMBER').AsString+
  ' and DEPT_PTR='+dm.ADOQuery2.fieldbyname('DEPT_PTR').AsString;
  dm.ads497.First;
  while not dm.ads497.Eof do
  begin
    dm.ADOQuery1.AppendRecord([dm.ads497PARAMETER_PTR.Value,  //参数指针278
                               dm.ads497PARAMETER_VALUE.Value, //参数值
                               dm.ads497SOURCE_PTR.Value,   //成本中心材料类
                               dm.ADOQuery2.FieldByName('rkey').AsInteger,//工序代码
                               dm.ads497SEQ_NO.Value       //序号
                               ]);
    dm.ads497.Next;
  end;

   dm.ADOQuery2.Next;
 end;

end;

procedure TForm2.update_drill(rkey25:integer);
var i:integer;
begin
with dm.ADOQuery1 do
begin
 close;
 sql.Text:='delete from data0029 where source_ptr='+inttostr(rkey25);
 execsql;
end;

with dm.ADOQuery1 do
 begin
  close;
  sql.Text:=
  'SELECT SOURCE_PTR,SEQ_NR, MARK, HOLES_DIA, PTH, TOLERANCE, DRILL_DIA,'+#13+
  'UNIT, SET_UNMBER,PANEL_A, PANEL_B, SEQ_NO,REMARK,flow_no'+#13+
  'FROM dbo.Data0029'+#13+
  'where source_ptr='+inttostr(rkey25);
  open;
 end;
  for i:=1 to stringgrid1.RowCount-2 do
   dm.ADOQuery1.AppendRecord([rkey25,
                              stringgrid1.Cells[1,i],
                              stringgrid1.Cells[2,i],
                              stringgrid1.Cells[3,i],
                              stringgrid1.Cells[4,i],
                              stringgrid1.Cells[5,i],
                              stringgrid1.Cells[6,i],
                              stringgrid1.Cells[7,i],
                              stringgrid1.Cells[8,i],
                              stringgrid1.Cells[9,i],
                              stringgrid1.Cells[10,i],
                              i,
                               stringgrid1.Cells[11,i],
                                0]);
     if  strngrd1.RowCount>2 then
     begin
      with dm.ADOQuery1 do
       begin
      close;
       sql.Text:=
       'SELECT SOURCE_PTR,SEQ_NR, MARK, HOLES_DIA, PTH, TOLERANCE, DRILL_DIA,'+#13+
      'UNIT, SET_UNMBER,PANEL_A, PANEL_B, SEQ_NO,REMARK,flow_no'+#13+
      'FROM dbo.Data0029'+#13+
      'where source_ptr='+inttostr(rkey25);
       open;
      end;
      for i:=1 to  strngrd1.RowCount-2 do
       dm.ADOQuery1.AppendRecord([rkey25,
                              strngrd1.Cells[1,i],
                              strngrd1.Cells[2,i],
                              strngrd1.Cells[3,i],
                              strngrd1.Cells[4,i],
                              strngrd1.Cells[5,i],
                              strngrd1.Cells[6,i],
                              strngrd1.Cells[7,i],
                             strngrd1.Cells[8,i],
                              strngrd1.Cells[9,i],
                              strngrd1.Cells[10,i],
                              i,
                             strngrd1.Cells[11,i],
                              1]);
     end;
     if  strngrd2.RowCount>2 then
     begin
        with dm.ADOQuery1 do
       begin
      close;
       sql.Text:=
       'SELECT SOURCE_PTR,SEQ_NR, MARK, HOLES_DIA, PTH, TOLERANCE, DRILL_DIA,'+#13+
      'UNIT, SET_UNMBER,PANEL_A, PANEL_B, SEQ_NO,REMARK,flow_no'+#13+
      'FROM dbo.Data0029'+#13+
      'where source_ptr='+inttostr(rkey25);
       open;
      end;
      for i:=1 to  strngrd2.RowCount-2 do
       dm.ADOQuery1.AppendRecord([rkey25,
                              strngrd2.Cells[1,i],
                              strngrd2.Cells[2,i],
                              strngrd2.Cells[3,i],
                              strngrd2.Cells[4,i],
                              strngrd2.Cells[5,i],
                              strngrd2.Cells[6,i],
                              strngrd2.Cells[7,i],
                             strngrd2.Cells[8,i],
                              strngrd2.Cells[9,i],
                              strngrd2.Cells[10,i],
                              i,
                             strngrd2.Cells[11,i],
                              2]);
     end;

end;

procedure  TForm2.get_drill(rkey25:integer);
var i:integer;
begin
 for i:=1 to stringgrid1.RowCount-2 do  stringgrid1.Rows[i].Clear;
  with dm.ADOQuery1 do
 begin
  close;
  sql.Text:=' SELECT DG_ADJ_PTH, DG_ADJ_NPTH FROM Data0008'+#13+
            'where rkey='+dm.AQY0025PROD_CODE_PTR.AsString;
  open;
  edit7.Text:=fieldbyname('dg_adj_pth').AsString;
  edit8.Text:=fieldbyname('dg_adj_npth').AsString;
 end;
 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:=
  'SELECT TOP 100 PERCENT SEQ_NR, MARK, HOLES_DIA, PTH, TOLERANCE, DRILL_DIA,'+#13+
  'UNIT, PANEL_A, PANEL_B, REMARK,SET_UNMBER'+#13+
  'FROM dbo.Data0029'+#13+
  'where flow_no =0 and  source_ptr='+inttostr(rkey25)+#13+
  'ORDER BY SEQ_NO';
  open;
  stringgrid1.RowCount:=RecordCount+2;
  for i:=1 to RecordCount do
   begin
    stringgrid1.Cells[0,i]:=inttostr(i);
    stringgrid1.Cells[1,i]:=trim(fieldbyname('SEQ_NR').AsString); //'刀具';
    stringgrid1.Cells[2,i]:=trim(fieldbyname('MARK').AsString);//'符号';
    stringgrid1.Cells[3,i]:=trim(fieldbyname('HOLES_DIA').AsString);//'成品孔径';
    stringgrid1.Cells[4,i]:=trim(fieldbyname('PTH').AsString);//'PTH';
    stringgrid1.Cells[5,i]:=trim(fieldbyname('TOLERANCE').AsString);//'公差';
    stringgrid1.Cells[6,i]:=trim(fieldbyname('DRILL_DIA').AsString);//'钻咀';
    stringgrid1.Cells[7,i]:=trim(fieldbyname('UNIT').AsString);//'PCS孔数';
    stringgrid1.Cells[8,i]:=trim(fieldbyname('SET_UNMBER').AsString);//'SET孔数';
    stringgrid1.Cells[9,i]:=trim(fieldbyname('PANEL_A').AsString);//'A板孔数';
    stringgrid1.Cells[10,i]:=trim(fieldbyname('PANEL_B').AsString);//'B板孔数';
    stringgrid1.Cells[11,i]:=trim(fieldbyname('REMARK').AsString);//'备注';
    next;
   end;
 end;
  edit6.Text:=formatfloat('0.00',(get_mindrill()));
  isopen.Checked:=true;
 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:=
  'SELECT TOP 100 PERCENT SEQ_NR, MARK, HOLES_DIA, PTH, TOLERANCE, DRILL_DIA,'+#13+
  'UNIT, PANEL_A, PANEL_B, REMARK,SET_UNMBER'+#13+
  'FROM dbo.Data0029'+#13+
  'where flow_no =1 and  source_ptr='+inttostr(rkey25)+#13+
  'ORDER BY SEQ_NO';
  open;
  strngrd1.RowCount:=RecordCount+2;
  for i:=1 to RecordCount do
   begin
    strngrd1.Cells[0,i]:=inttostr(i);
    strngrd1.Cells[1,i]:=trim(fieldbyname('SEQ_NR').AsString); //'刀具';
    strngrd1.Cells[2,i]:=trim(fieldbyname('MARK').AsString);//'符号';
    strngrd1.Cells[3,i]:=trim(fieldbyname('HOLES_DIA').AsString);//'成品孔径';
    strngrd1.Cells[4,i]:=trim(fieldbyname('PTH').AsString);//'PTH';
    strngrd1.Cells[5,i]:=trim(fieldbyname('TOLERANCE').AsString);//'公差';
    strngrd1.Cells[6,i]:=trim(fieldbyname('DRILL_DIA').AsString);//'钻咀';
    strngrd1.Cells[7,i]:=trim(fieldbyname('UNIT').AsString);//'PCS孔数';
    strngrd1.Cells[8,i]:=trim(fieldbyname('SET_UNMBER').AsString);//'SET孔数';
    strngrd1.Cells[9,i]:=trim(fieldbyname('PANEL_A').AsString);//'A板孔数';
    strngrd1.Cells[10,i]:=trim(fieldbyname('PANEL_B').AsString);//'B板孔数';
    strngrd1.Cells[11,i]:=trim(fieldbyname('REMARK').AsString);//'备注';
    next;
   end;
 end;
   edit2.Text:=formatfloat('0.00',(get_mindrill2()));
  with dm.ADOQuery1 do
 begin
  close;
  sql.Text:=
  'SELECT TOP 100 PERCENT SEQ_NR, MARK, HOLES_DIA, PTH, TOLERANCE, DRILL_DIA,'+#13+
  'UNIT, PANEL_A, PANEL_B, REMARK,SET_UNMBER'+#13+
  'FROM dbo.Data0029'+#13+
  'where flow_no =2 and  source_ptr='+inttostr(rkey25)+#13+
  'ORDER BY SEQ_NO';
  open;
  strngrd2.RowCount:=RecordCount+2;
  for i:=1 to RecordCount do
   begin
    strngrd2.Cells[0,i]:=inttostr(i);
    strngrd2.Cells[1,i]:=trim(fieldbyname('SEQ_NR').AsString); //'刀具';
    strngrd2.Cells[2,i]:=trim(fieldbyname('MARK').AsString);//'符号';
    strngrd2.Cells[3,i]:=trim(fieldbyname('HOLES_DIA').AsString);//'成品孔径';
    strngrd2.Cells[4,i]:=trim(fieldbyname('PTH').AsString);//'PTH';
    strngrd2.Cells[5,i]:=trim(fieldbyname('TOLERANCE').AsString);//'公差';
    strngrd2.Cells[6,i]:=trim(fieldbyname('DRILL_DIA').AsString);//'钻咀';
    strngrd2.Cells[7,i]:=trim(fieldbyname('UNIT').AsString);//'PCS孔数';
    strngrd2.Cells[8,i]:=trim(fieldbyname('SET_UNMBER').AsString);//'SET孔数';
    strngrd2.Cells[9,i]:=trim(fieldbyname('PANEL_A').AsString);//'A板孔数';
    strngrd2.Cells[10,i]:=trim(fieldbyname('PANEL_B').AsString);//'B板孔数';
    strngrd2.Cells[11,i]:=trim(fieldbyname('REMARK').AsString);//'备注';
    next;
   end;
 end;
   Edit17.Text:=formatfloat('0.00',(get_mindrill3()));
end;

function tform2.get_customer(rkey10:integer):string;
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select memo_text from data0011 where SOURCE_TYPE=6010');
  sql.Add('and FILE_POINTER='+inttostr(rkey10));
  open;
  if not IsEmpty then
   result:=FieldValues['memo_text']
  else
   result:='';
 end;
end;

function TForm2.get_date0025toprkey(rkey25: integer):integer;
var
 rkey:integer;
begin
with dm.ADOQuery2 do
 begin
  close;
  sql.Text:='select parent_ptr from data0025 where rkey='+inttostr(rkey25);
  open;
  rkey := fieldbyname('parent_ptr').AsInteger; //等于父值
 end;

 if rkey <= 0 then
  rkey:=rkey25       //如果产是顶层等于自己
 else
  with dm.ADOQuery2 do
  begin
   close;
   sql.Text:='select parent_ptr from data0025 where rkey='+inttostr(rkey);
   open;
   if FieldByName('parent_ptr').AsInteger > 0 then
    begin
     rkey := fieldbyname('parent_ptr').AsInteger;  //如果有爷爷等于爷爷值
     with dm.ADOQuery3 do
      begin
       close;
       sql.Text:='select parent_ptr from data0025 where rkey='+inttostr(rkey);
       open;
       if FieldByName('parent_ptr').AsInteger > 0 then
         rkey := fieldbyname('parent_ptr').AsInteger;  //如果有太公等于太公值
      end;
    end;
  end;
 result:=rkey;
end;

procedure TForm2.get_treedate(rkey25: integer;treeview:Ttreeview);
var
 node:ttreenode;   //treeview控件的节点变量
 rkey0025:^integer;
 LSql: string;

 LNode: TTreeNode;
 LPRkey25: PInteger1;
 LNodeArr: array of TTreeNode;
 I: Integer;
 n: Integer;
begin
  //for I := 0 to Length(FRkey25Arr) - 1 do FRkey25Arr[I] := -1;
  N := 0;
  LSql := ';WITH CTE(RKey,Lv,MANU_PART_NUMBER,PARENT_PTR) ' +
    ' AS (SELECT RKey,0,MANU_PART_NUMBER,PARENT_PTR ' +
    ' FROM Data0025 WHERE RKey = '+ IntToStr(rkey25) +' UNION ALL  ' +
    ' SELECT D25.RKey,CTE.Lv+1,D25.MANU_PART_NUMBER,d25.PARENT_PTR ' +
    ' FROM Data0025 D25 INNER JOIN CTE ON D25.PARENT_PTR = CTE.RKey ) SELECT * FROM CTE ORDER BY lv asc';
  DM.ADOQuery1.Close;
  DM.ADOQuery1.SQL.Text := LSql;
  DM.ADOQuery1.Open;
  while not DM.ADOQuery1.Eof do
  begin
    if (DM.ADOQuery1.FieldByName('PARENT_PTR').AsInteger = 0) or (treeview.Items.Count = 0) then
    begin
      LNode := treeview.Items.AddChild(nil,DM.ADOQuery1.FieldByName('MANU_PART_NUMBER').AsString);
    end else
    begin
      for I := 0 to Length(LNodeArr) - 1 do
      begin
        if Pinteger1(LNodeArr[I].Data)^ = DM.ADOQuery1.FieldByName('PARENT_PTR').AsInteger then
        begin
          LNode := treeview.Items.AddChild(LNodeArr[I],DM.ADOQuery1.FieldByName('MANU_PART_NUMBER').AsString);
          Break;
        end;
      end;
    end;


    //SetLength(FRkey25Arr,Length(FRkey25Arr)+1);
    //N := High(FRkey25arr);
    new(rkey0025);
    rkey0025^ := DM.ADOQuery1.FieldByName('rkey').AsInteger;
    LNode.Data := rkey0025;
    //ShowMessage(IntToStr(Pinteger1(LNode.Data)^));

    SetLength(LNodeArr,Length(LNodeArr) + 1);
    LNodeArr[N] := LNode;

    N := N +1;
    DM.ADOQuery1.Next;
  end;

  treeview.FullExpand; //全部展开
  treeview.Items[0].Selected:=true;
  Exit;

with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where rkey='+
              inttostr(get_date0025toprkey(rkey25));
  open;
  new(rkey0025);
  rkey0025^:=fieldvalues['rkey'];
  node:=treeview.Items.AddObject
  (nil,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025); //增加顶层节点
  node.ImageIndex:=0;  //为第一层节点定义图画
 end;

with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
              inttostr(get_date0025toprkey(rkey25));
  open;
  while not dm.ADOQuery1.Eof do
  begin
   new(rkey0025);
   rkey0025^:= dm.ADOQuery1.fieldvalues['rkey'];
   node:=treeview.Items.AddChildObject
      (node,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
   node.ImageIndex := 1;
   with dm.ADOQuery2 do
    begin
     close;
     sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
              dm.ADOQuery1.fieldbyname('rkey').AsString;
     open;
     while not dm.ADOQuery2.Eof do
     begin
      new(rkey0025);
      rkey0025^:= dm.ADOQuery2.fieldvalues['rkey'];
      node:=treeview.Items.AddChildObject
       (node, dm.ADOQuery2.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
      node.ImageIndex := 2;

       with dm.ADOQuery3 do
        begin
         close;
         sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
                  dm.ADOQuery2.fieldbyname('rkey').AsString;
         open;
         while not dm.ADOQuery3.Eof do
         begin
          new(rkey0025);
          rkey0025^:= dm.ADOQuery3.fieldvalues['rkey'];
          node:=treeview.Items.AddChildObject
           (node, dm.ADOQuery3.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
          node.ImageIndex := 3;
          node:=node.Parent;
          dm.ADOQuery3.Next;
         end;
        end;

      node:=node.Parent;
      dm.ADOQuery2.Next;
     end;
    end;
   node:=node.Parent; //节点指向其父节点值
   dm.ADOQuery1.Next;
  end;
 end;

 treeview.FullExpand; //全部展开
 treeview.Items[0].Selected:=true;
end;

function TForm2.get_employeename(rkey05: integer):string;
begin
 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select employee_name from data0005'+#13+
             'where rkey='+inttostr(rkey05);
  open;
  if isempty then
   result:=''
  else
   result:=fieldbyname('employee_name').asstring;
 end;
end;

procedure TForm2.DBGrid1CellClick(Column: TColumn);
begin
if column.Index<4 then dbgrid1.SelectedIndex:=4;
end;

procedure TForm2.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if (gdFocused in State) then
 begin
  if (column.FieldName = DBComboBox1.DataField ) then
   begin
    DBComboBox1.Left := Rect.Left+1;
    DBComboBox1.Top := Rect.Top+2;
    DBComboBox1.Width := Rect.Right - Rect.Left+3;
    DBComboBox1.Height := Rect.Bottom - Rect.Top;
    self.get_value(dm.ads279PARAMETER_PTR.Value);
    if dbcombobox1.Items.Count > 0 then
     DBComboBox1.Visible := True
    else
     DBComboBox1.Visible := false;
   end;
 end;

with TMyDBGrid(Sender) do
 begin
  if DataLink.ActiveRecord=Row-1 then
   begin
    Canvas.Font.Color:=clWhite;
    Canvas.Brush.Color:=$00800040;
   end
  else
   begin
    Canvas.Brush.Color:=Color;
    Canvas.Font.Color:=Font.Color;
   end;
  if dm.ads279status3.Value=1 then
   Canvas.Font.Color := clred;

  DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;
end;

procedure TForm2.update_filename;
var
 M: TMemoryStream;
 filename:string;
begin
  dm.ads564.UpdateBatch(arAll);
  M:=TMemoryStream.Create;
  dm.ads564.First;
  while not dm.ads564.Eof do
  begin
   if copy(file_name.Strings[dm.ads564rec_no.value],
           pos(';',file_name.Strings[dm.ads564rec_no.value])+1,
           1)='0' then
    begin
      M.Clear;
      filename:= copy(file_name.Strings[dm.ads564rec_no.value],1,
                     pos(';',file_name.Strings[dm.ads564rec_no.value])-1);
      M.LoadFromFile(filename);
      PackStream(M);
      dm.AQtmp.Close;
      dm.AQtmp.SQL.text:='update data0564 set vcut_bmp=:F where rec_no='+dm.ads564rec_no.AsString+
                         ' and SOURCE_PTR='+dm.ads564SOURCE_PTR.AsString;
      dm.AQtmp.Parameters[0].LoadFromStream(M,ftblob);
      dm.AQtmp.ExecSQL;
    end;
   dm.ads564.next;
  end;
  M.Free;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrid1.WindowProc ;
 DBGrid1.WindowProc := NewGridWnd;

 //DBGrid2Wnd := DBGrid2.WindowProc ;
 //DBGrid2.WindowProc := NewGrid2Wnd;
 file_name:=tstringlist.Create;

  case dm.ADS25TSTATUS.Value of
    5,2,0: btnTool.Enabled := True;
  else
    btnTool.Enabled := False;
  end;
end;

procedure TForm2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and        //如果是下箭头如果是最后一条记录
  (dm.ads279.RecNo=dm.ads279.RecordCount) then abort;
 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录
 if (key=112) and
    (dbcombobox1.Visible) and
    (dbcombobox1.Enabled) then
  begin                         //F1键出现下拉
   dbcombobox1.SetFocus;
   dbcombobox1.DroppedDown:=true;
  end;
end;

procedure TForm2.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if dm.ads279datatype.Value='数字' then
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort;

if (key <> chr(9)) then
 begin
  if (DBGrid1.SelectedField.FieldName =DBComboBox1.DataField) and
     (dbcombobox1.Items.Count > 0) and
     (dbcombobox1.Enabled) then
   begin
    DBComboBox1.SetFocus;
    SendMessage(DBComboBox1.Handle,WM_Char,word(Key),0);
   end;
 end;
end;

procedure TForm2.DBComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=112 then dbcombobox1.DroppedDown:=true; //F1键出现下拉
if key=13 then dbgrid1.SetFocus;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
 self.ModalResult:=mrcancel;
end;

procedure TForm2.ListBox1Click(Sender: TObject);
var
  LCYImg: TjpegImage;
  LCustomPtr: Integer;
  LPictureName: string;
begin

 if dm.AQY0025RKEY.Value <> strtoint(rkey25.Caption) then
 begin

  if bitbtn11.Enabled then
  if messagedlg('更换线路层编辑,是否自动保存数据?',mtconfirmation,[mbyes,mbno],0)=mryes then
   bitbtn11click(sender);
  self.update_notebook;
  dm.AQY0025.Close;
  dm.AQY0025.Parameters[0].Value:=strtoint(rkey25.Caption);
  dm.AQY0025.Open;
  if strtoint(status.Caption)=0 then
   begin
    dm.AQY0025.Edit;
    dm.AQY0025LAST_MODIFIED_DATE.Value := getsystem_date(dm.adoquery1,1);
    dm.AQY0025LAST_MODIFIED_BY_PTR.Value:=strtoint(user_ptr);
   end;
 end;
 if not VarIsNull(DM.AQY0025.FieldByName('layers_image').Value) then
 begin
  LCYImg := Load_JPG_Pic_From_DB(DM.AQY0025.FieldByName('layers_image'));
  imgCY.Picture.Bitmap.Assign(LCYImg);
  LCYImg.Free;
 end;

 //加载等级到cbb
 cbbgrade.Items.Clear;
 DM.ads82.First;
 while not DM.ads82.Eof do
 begin
   cbbgrade.Items.Add(dm.ads82.fieldbyname('grade_code').AsString);
   DM.ads82.Next;
 end;
 cbbgrade.Items.Add('无等级');
 if dm.AQY0025.FieldByName('grade_code').AsString <> '' then
 begin
   cbbgrade.ItemIndex := cbbgrade.Items.IndexOf(dm.AQY0025.FieldByName('grade_code').AsString)
 end else
   cbbgrade.ItemIndex := cbbgrade.Items.IndexOf('无等级');


 if strtoint(status.Caption)=0 then   //编辑
  begin
   if not bitbtn1.Enabled then bitbtn1.Enabled:=true;
   if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
   if not bitbtn14.Enabled then bitbtn14.Enabled:=true;
   if not bitbtn15.Enabled then bitbtn15.Enabled:=true;
  end;

 screen.Cursor:=crappstart;
 checkbox2.Checked:= trim(dm.AQY0025current_rev.Value) = 'Y';  //无卤数

 if edit3.Text = '' then    //打开修订人员
 begin
  edit3.Text:=self.get_employeename(dm.AQY0025LAST_MODIFIED_BY_PTR.Value);
  edit4.Text:=self.get_employeename(dm.AQY0025CHECK_BY_PTR.Value);
  edit5.Text:=self.get_employeename(dm.AQY0025AUDITED_BY_PTR.Value);

  with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select PROD_CODE,PRODUCT_NAME,est_scrap_ltm,'+#13+
             'est_scrap1_lmt from data0008'+#13+
             'where rkey='+dm.AQY0025PROD_CODE_PTR.AsString;
   open;
   edit1.Text:=fieldbyname('PROD_CODE').AsString;
   label15.Caption:=fieldbyname('PRODUCT_NAME').AsString;
   if dm.AQY0025ttype.Value=0 then
    self.est_scrap:=fieldbyname('est_scrap_ltm').AsCurrency
   else
    self.est_scrap:=fieldbyname('est_scrap1_lmt').AsCurrency;
  end;

  IF (DM.AQY0025PARENT_PTR.Value>0)  then
  begin
   dbedit32.Visible:=true;
   dbedit33.visible:=true;
   dbedit34.visible:=true; //压合比例
   bitbtn12.visible:=true;
   label64.Caption:='';
   label64.Visible:=true;
   label62.Visible:=true;
   label63.Visible:=true;
   label68.Visible:=true;
   dbedit7.ReadOnly:=true;   //内层不可以修改报废率
   DBEdit1.ReadOnly:=False; //内层可以修改本厂编号
    with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='SELECT dbo.Data0038.STEP_NUMBER, dbo.Data0034.DEPT_CODE,'+#13+
        'dbo.Data0034.DEPT_NAME, dbo.Data0034.BARCODE_ENTRY_FLAG'+#13+
         'FROM dbo.Data0038 INNER JOIN'+#13+
        'dbo.Data0034 ON dbo.Data0038.DEPT_PTR = dbo.Data0034.RKEY'+#13+
        'where data0038.SOURCE_PTR='+dm.AQY0025PARENT_PTR.AsString+#13+
        'and Data0038.STEP_NUMBER='+dm.AQY0025BOM_STEP.AsString;
     open;
     if not isempty then
      label64.Caption:=fieldbyname('DEPT_NAME').AsString;
    end;
  end
  else
   begin
     dbedit32.Visible:=false;
     dbedit33.Visible:=false;
     dbedit34.Visible:=false;
     bitbtn12.Visible:=false;
     label64.Visible:=false;
     label62.Visible:=false;
     label63.Visible:=false;
     label68.Visible:=false;
     dbedit7.ReadOnly:=false; //外层可以修改报废率
     DBEdit1.ReadOnly:=true;
   end;

 end;

 if not dm.ads502.Active then
 self.get_picturedata502(dm.AQY0025RKEY.Value); //打开拼版图

 if not dm.ads279.Active then
  self.get_data0279(dm.AQY0025RKEY.Value);       //打开全局参数

 if not dm.ADS38.Active then
 begin
  dm.ADS38.Close;                         //打开工艺流程
  dm.ADS38.Parameters[0].Value:=dm.AQY0025RKEY.Value;
  dm.ADS38.Open;
  dm.ads494.Close;                      //制程参数
  dm.ads494.Parameters[0].Value:=dm.AQY0025RKEY.Value;
  dm.ads494.Open;

//  ShowMessage(DM.ads494.fieldbyname('custpart_ptr').AsString);

  dm.ads497.Close;                      //BOM选料参数
  dm.ads497.Parameters[0].Value:=dm.AQY0025RKEY.Value;
  dm.ads497.Open;

  dm.ADS279_0.close;                       //流程判断参数
  dm.ADS279_0.Parameters[0].Value:=dm.AQY0025RKEY.Value;
  dm.ADS279_0.Open;
  if dm.AQY0025ENG_ROUTE_PTR.Value>0 then
  with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select ENG_FLOW_NAME,ENG_FLOW_DESC from data0504'+#13+
             'where rkey='+dm.AQY0025ENG_ROUTE_PTR.AsString;
   open;
   //edit1.Text:=fieldbyname('ENG_FLOW_NAME').AsString;
   //label4.Caption:=fieldbyname('ENG_FLOW_DESC').AsString;
  end
  else
   begin
   //edit1.Text:='';
   //label4.Caption:='';
   end;
 END;

if not isopen.Checked then  self.get_drill(dm.AQY0025RKEY.Value); //打开钻孔表
if not target then  self.get_target(dm.AQY0025RKEY.Value);       //打开压合靶矩表
if treeview1.Selected.Level=0 then       //顶层产品时需打开
 begin

  if not memo2.ReadOnly then                    //打开ECN工程更改
   begin
    self.get_ecninfo(dm.AQY0025RKEY.Value);
    memo2.ReadOnly:=true;
   end;

  if not dm.ads89.Active then  dm.ads89.Open;  //打开评审信息(只有顶层有)

  if not memo3.ReadOnly then                    //打开客户特殊信息
   begin

     if dm.AQY0025.FieldByName('ORIG_CUSTOMER').AsString = '' then
      LCustomPtr :=dm.AQY0025CUSTOMER_PTR.Value
     else
     begin
       DM.qryTmp.Close;
      DM.qryTmp.SQL.Text := 'select rkey from data0010 where abbr_name = ' + QuotedStr(dm.AQY0025.FieldByName('ORIG_CUSTOMER').AsString);
      dm.qryTmp.Open;
      LCustomPtr := DM.qryTmp.fieldbyname('rkey').AsInteger
     end;
     Memo3.Text := get_customer(LCustomPtr);
    memo3.ReadOnly:=true;
    dm.ADO20.Close;
    dm.ADO20.Parameters[0].Value:=LCustomPtr;
    dm.ADO20.Open;
   end;

  if not ecnopen then
   begin
    get_ecnlist(dm.AQY0025RKEY.Value);       //打开ECN履历表
    dm.ADS564.Close;                         //打开工艺相关文档
    dm.ADS564.Parameters[0].Value:=dm.AQY0025RKEY.Value;
    dm.ADS564.Open;
    while not dm.ads564.Eof do
    begin
     file_name.Add(dm.ads564file_name.Value+';'+'1');
     dm.ads564.Next;
    end;
    dm.ads564.First;
   end;

   if not impedance then                   //打开阻抗表
     self.get_impedance(dm.AQY0025RKEY.Value);

   //压合靶距表
   LPictureName := ExtractFilePath(ParamStr(0)) + '压合靶距.jpg';
   if FileExists(LPictureName) then
    image4.Picture.LoadFromFile(LPictureName);
   if FileExists(ExtractFilePath(ParamStr(0)) +  '压合靶距说明.txt') then
    mmo1.Lines.LoadFromFile(ExtractFilePath(ParamStr(0)) +  '压合靶距说明.txt');
   

 end;

 notebook1.PageIndex := listbox1.ItemIndex+1;
 headercontrol1.Sections[2].Text := listbox1.Items[listbox1.ItemIndex];
 screen.Cursor:=crdefault;
end;

procedure TForm2.FormActivate(Sender: TObject);
var
  LCustomPtr: Integer;
begin
 inputform:=Tinputform.Create(Application);
 if_post:=false;
 self.get_treedate(dm.AQY0025RKEY.Value,treeview1);
  if not memo3.ReadOnly then                    //打开客户特殊信息   zgp
   begin
     if dm.AQY0025.FieldByName('ORIG_CUSTOMER').AsString = '' then
      LCustomPtr :=dm.AQY0025CUSTOMER_PTR.Value
     else
     begin
       DM.qryTmp.Close;
      DM.qryTmp.SQL.Text := 'select rkey from data0010 where abbr_name = ' + QuotedStr(dm.AQY0025.FieldByName('ORIG_CUSTOMER').AsString);
      dm.qryTmp.Open;
      LCustomPtr := DM.qryTmp.fieldbyname('rkey').AsInteger
     end;
     Memo3.Text := get_customer(LCustomPtr);
    memo3.ReadOnly:=true;
    dm.ADO20.Close;
    dm.ADO20.Parameters[0].Value:=LCustomPtr;
    dm.ADO20.Open;
   end;
 notebook1.PageIndex:=11;
 rev:=copy(dm.AQY0025MANU_PART_NUMBER.Value,
      length(trim(dm.AQY0025MANU_PART_NUMBER.Value))-1,2);//产品版本
 stringgrid1.Cells[0,0]:='序';
 stringgrid1.Cells[1,0]:='刀具';
 stringgrid1.Cells[2,0]:='符号';
 stringgrid1.Cells[3,0]:='成品孔径';
 stringgrid1.Cells[4,0]:='PTH';
 stringgrid1.Cells[5,0]:='公差';
 stringgrid1.Cells[6,0]:='钻咀';
 stringgrid1.Cells[7,0]:='PCS孔数';
 stringgrid1.Cells[8,0]:='SET孔数';

 stringgrid1.Cells[9,0]:='A板孔数';
 stringgrid1.Cells[10,0]:='B板孔数';
 stringgrid1.Cells[11,0]:='备注';

  strngrd1.Cells[0,0]:='序';
 strngrd1.Cells[1,0]:='刀具';
 strngrd1.Cells[2,0]:='符号';
 strngrd1.Cells[3,0]:='成品孔径';
 strngrd1.Cells[4,0]:='PTH';
 strngrd1.Cells[5,0]:='公差';
 strngrd1.Cells[6,0]:='钻咀';
 strngrd1.Cells[7,0]:='PCS孔数';
 strngrd1.Cells[8,0]:='SET孔数';
 strngrd1.Cells[9,0]:='A板孔数';
 strngrd1.Cells[10,0]:='B板孔数';
 strngrd1.Cells[11,0]:='备注';

  strngrd2.Cells[0,0]:='序';
  strngrd2.Cells[1,0]:='刀具';
  strngrd2.Cells[2,0]:='符号';
  strngrd2.Cells[3,0]:='成品孔径';
  strngrd2.Cells[4,0]:='PTH';
  strngrd2.Cells[5,0]:='公差';
  strngrd2.Cells[6,0]:='钻咀';
  strngrd2.Cells[7,0]:='PCS孔数';
  strngrd2.Cells[8,0]:='SET孔数';
  strngrd2.Cells[9,0]:='A板孔数';
  strngrd2.Cells[10,0]:='B板孔数';
  strngrd2.Cells[11,0]:='备注';

 stringgrid2.Cells[0,0]:='序';
 stringgrid2.Cells[1,0]:='类型';
 stringgrid2.Cells[2,0]:='coupon号';
 stringgrid2.Cells[3,0]:='层次';
 stringgrid2.Cells[4,0]:='参考层';
 stringgrid2.Cells[5,0]:='成品阻抗';
 stringgrid2.Cells[6,0]:='绿油前阻抗';
 stringgrid2.Cells[7,0]:='阻抗控制范围';
 stringgrid2.Cells[8,0]:='客户线宽';
 stringgrid2.Cells[9,0]:='客户线距';
 stringgrid2.Cells[10,0]:='原始到铜皮距离';
 stringgrid2.Cells[11,0]:='调整线宽';
 stringgrid2.Cells[12,0]:='调整线距';
 stringgrid2.Cells[13,0]:='调整后到铜距离';

 sg2.Cells[0,0]:='序号';
 sg2.Cells[1,0]:='厂编版本';
 sg2.Cells[2,0]:='变更内容摘要';
 sg2.Cells[3,0]:='来源';
 sg2.Cells[4,0]:='有无新文件';
 sg2.Cells[5,0]:='工程师';
 sg2.Cells[6,0]:='日期';
 sg2.Cells[7,0]:='ECN编号';
 sg2.ColWidths[8]:=0;

 stringgrid3.Cells[0,0]:='序号';
 stringgrid3.Cells[1,0]:='层次说明';
 stringgrid3.Cells[2,0]:='YAB/YB2B1';
 stringgrid3.Cells[3,0]:='XFB/XA1B1';
 stringgrid3.Cells[4,0]:='XFC/XA1C1';
 stringgrid3.Cells[5,0]:='XFG/XA1D1';
 stringgrid3.Cells[6,0]:='XEA/XA2B2';
 stringgrid3.Cells[7,0]:='XED/XA2C2';
 stringgrid3.Cells[8,0]:='备注信息';

 if dm.AQY0025PROD_ROUTE_PTR.Value>0 then
  with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select WAREHOUSE_CODE,ABBR_NAME from data0015'+#13+
             'where rkey='+dm.AQY0025PROD_ROUTE_PTR.AsString;
   open;
   label66.Caption:=fieldbyname('WAREHOUSE_CODE').AsString;
   label67.Caption:=fieldbyname('ABBR_NAME').AsString;
  end;

 if strtoint(status.Caption)=1 then   //检查状态
 begin
  treeview1.PopupMenu:=nil;
  dbedit1.Enabled:=false;
  dbedit2.Enabled:=false;
  dbedit3.Enabled:=false;
  dbedit4.Enabled:=false;
  dbedit5.Enabled:=false;
  dbedit6.Enabled:=false;
  dbedit7.Enabled:=false;
  dbedit8.Enabled:=false;
  dbedit9.Enabled:=false;
  dbedit10.Enabled:=false;
  dbedit11.Enabled:=false;
  dbedit14.Enabled:=false;
  cbbgrade.Enabled := False; //等级标示

  dbradiogroup1.Enabled:=false;
  dbcheckbox1.Enabled:=false;
  dbchkREACH.Enabled := False;
  dbcheckbox5.Enabled:=false;
  dbcheckbox6.Enabled:=false; //无铅
  checkbox2.Enabled:=false;  //无卤素
  bitbtn12.Enabled:=false;
  bitbtn13.Enabled:=false;
  bitbtn16.Enabled:=false;
  bitbtn19.Enabled:=false;
  bitbtn24.Enabled:=false;
  dbedit32.Enabled:=false;
  dbedit33.Enabled:=false;
  dbedit34.Enabled:=false;
  dbedit15.Enabled:=false;
  dbedit16.Enabled:=false;
  dbedit17.Enabled:=false;
  dbedit18.Enabled:=false;
  dbedit19.Enabled:=false;
  dbedit20.Enabled:=false;
  dbedit21.Enabled:=false;
  dbedit22.Enabled:=false;
  dbcombobox2.Enabled:=false;
  bitbtn3.Enabled:=false;
  BitBtn25.Enabled:=false;
  btnNewCut.Enabled := False;
  btnTB.Enabled := False;

  speedbutton1.Enabled:=false;
  speedbutton2.Enabled:=false;
  btn2.Enabled:=false;

  dbcombobox1.Enabled:=false;
  dbgrid1.Columns[4].ReadOnly:=true;
  btn3.Enabled:=false;
  dbgrid1.PopupMenu:=self.PopupMenu5;
  speedbutton3.Enabled:=false;
  btnLoadCYImg.Enabled := False;
  btnClearCY.Enabled := False;
  dbmemo1.ReadOnly:=true;
  dbmemo1.PopupMenu:=nil;
  bitbtn5.Enabled:=false;
  bitbtn6.Enabled:=false;
  bitbtn7.Enabled:=false;
  bitbtn8.Enabled:=false;
  stringgrid1.Options:=stringgrid1.Options+[gorowselect];
  stringgrid1.PopupMenu:=nil;
  sg2.Options:=sg2.Options+[gorowselect];
  sg2.PopupMenu:=nil;
  bitbtn9.Enabled:=false;
  bitbtn10.Enabled:=false;
  bitbtn20.Enabled:=false;
  stringgrid2.Options:=stringgrid2.Options+[gorowselect];
  stringgrid2.PopupMenu:=nil;
  stringgrid3.Options:=stringgrid3.Options+[gorowselect];
  stringgrid3.PopupMenu:=nil;
  bitbtn22.Enabled:=false;
  combobox1.Enabled:=false;
  combobox2.Enabled:=false;
//  dbmemo2.ReadOnly:=true;
  dbmemo3.ReadOnly:=true;
  dbmemo4.ReadOnly:=true;
  dbradiogroup2.ReadOnly:=true;
  dbedit36.Enabled:=false;       //钻孔叠板数
  DBComboBox3.Enabled:=False;    //钻孔参数
 end
 else
  begin
   if dm.AQY0025SO_UNIT.Value='PCS' THEN
    begin
      dbedit17.Enabled:=false;
      dbedit18.Enabled:=false;
      dbedit21.Enabled:=false;
    end;
  end;
end;


procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if if_post then
  with dm.ADOQuery3 do
   begin
    close;            //记录客户订单更改情况(日志文件)
    sql.Clear;
    sql.Add('insert into data0318 (CUSTOMER_PART_PTR,TRANS_TYPE,TRANS_DESCRIPTION,');
    sql.Add('USER_PTR,file_number,TRANS_DATE,PROGRAM_SOURCE)');
    sql.Add('values ('+dm.AQY0025RKEY.AsString+',25,''编辑产品档案号'',');
    sql.Add(''+rkey73+',''WZMI25.EXE'',');
    sql.add(''''+datetostr(dm.AQY0025LAST_MODIFIED_DATE.Value)+''',25)');
    ExecSQL;
   end;
 self.update_notebook();
 inputform.Free;
 
end;

procedure TForm2.SpeedButton5Click(Sender: TObject);
begin
 self.get_ecninfo(dm.AQY0025RKEY.Value);
end;

procedure TForm2.SpeedButton4Click(Sender: TObject);
begin
 if strtoint(from_part_ptr.Caption)>0 then
  self.get_ecninfo(strtoint(from_part_ptr.Caption))
 else messagedlg('变更记当已到最上层!',mtinformation,[mbcancel],0);
end;
   {
function TForm2.find_difficulty(rkey25: integer): boolean;
begin
result:=false;
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:=
  'SELECT data0494.PARAMETER_VALUE'+#13+
  'FROM Data0494 inner join data0278'+#13+
  'on data0494.PARAMETER_PTR=data0278.rkey'+#13+
  'where data0278.SPEC_RKEY=''ZH'''+#13+
  'and data0494.custpart_ptr='+inttostr(rkey25);
  open;                      //沉铜纵横比
 end;
if (not dm.ADOQuery1.IsEmpty) and
   (dm.ADOQuery1.FieldByName('PARAMETER_VALUE').AsString<>'') then
try
if strtofloat(dm.ADOQuery1.FieldByName('PARAMETER_VALUE').AsString)>=7 then
 result:=true;
except
end;

with dm.ADOQuery1 do
 begin
  close;
  sql.Text:=
  'SELECT data0494.PARAMETER_VALUE'+#13+
  'FROM Data0494 inner join data0278'+#13+
  'on data0494.PARAMETER_PTR=data0278.rkey'+#13+
  'where data0278.SPEC_RKEY=''MW'''+#13+
  'and data0494.custpart_ptr='+inttostr(rkey25);
  open;                     //外层干膜最小线宽
 end;
if (not dm.ADOQuery1.IsEmpty) and
  (dm.ADOQuery1.FieldByName('PARAMETER_VALUE').AsString<>'') then
try
if strtofloat(dm.ADOQuery1.FieldByName('PARAMETER_VALUE').AsString)<=0.1 then
 result:=true;
except
end;

with dm.ADOQuery1 do
 begin
  close;
  sql.Text:=
  'SELECT data0494.PARAMETER_VALUE'+#13+
  'FROM Data0494 inner join data0278'+#13+
  'on data0494.PARAMETER_PTR=data0278.rkey'+#13+
  'where data0278.SPEC_RKEY=''ML'''+#13+
  'and data0494.custpart_ptr='+inttostr(rkey25);
  open;                    //外层干膜最小线隙
 end;
if (not dm.ADOQuery1.IsEmpty) and
  (dm.ADOQuery1.FieldByName('PARAMETER_VALUE').AsString<>'') then
try
if strtofloat(dm.ADOQuery1.FieldByName('PARAMETER_VALUE').AsString)<=0.075 then
 result:=true;
except
end;

with dm.ADOQuery1 do
 begin
  close;
  sql.Text:=
  'SELECT data0494.PARAMETER_VALUE'+#13+
  'FROM Data0494 inner join data0278'+#13+
  'on data0494.PARAMETER_PTR=data0278.rkey'+#13+
  'where data0278.SPEC_RKEY=''AP'''+#13+
  'and data0494.custpart_ptr='+inttostr(rkey25);
  open;                    //最小孔径
 end;
if (not dm.ADOQuery1.IsEmpty) and
  (dm.ADOQuery1.FieldByName('PARAMETER_VALUE').AsString<>'') then
try
if strtofloat(dm.ADOQuery1.FieldByName('PARAMETER_VALUE').AsString)<=0.25 then
 result:=true;
except
end;

end;  }

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 infor,pnla_size,pnla_width,pnla_infor:string;
  jpegimage:Tjpegimage;
    stream:TMemoryStream;
begin
  if (strtoint(status.Caption)<>1) and (not dm.CheckCostDeptSingle) then Exit;
  if not DM.CheckGrade_Code then Exit;
dm.ADOConnection1.BeginTrans;
try
 dm.AQY0025ANALYSIS_CODE_5.Value:=dm.AQY0025pcs_lngth.AsString+'mm X '+
                                  dm.AQY0025pcs_width.AsString+'mm';
 dm.AQY0025ANALYSIS_CODE_1.Value:=dm.AQY0025set_lngth.AsString+'mm X '+
                                  dm.AQY0025set_width.AsString+'mm';
 dm.AQY0025ANALYSIS_CODE_4.Value:=dm.AQY0025spell_lngth.AsString+'mm X '+
                                  dm.AQY0025spell_width.AsString+'mm';

 //更新层压图片
  jpegimage:=tjpegimage.Create;
  Stream:=TMemoryStream.Create;
  jpegimage.Assign(imgCY.Picture.Bitmap);
  jpegimage.JPEGNeeded;
  jpegimage.SaveToStream(stream);
  Stream.Position :=0;
  dm.AQY0025layers_image.LoadFromStream(stream);
  stream.Clear;
  jpegimage.Free;
  stream.Free;                                  

 update_quanju;            //交货面积,交货单元数
 dm.ads502.UpdateBatch();
 dm.ads279.UpdateBatch();
 dm.ADS279_0.UpdateBatch();

 self.update_deptcode(dm.AQY0025RKEY.Value);
 self.update_tecparameter(dm.AQY0025RKEY.Value);
 Self.update_IESparameter(dm.AQY0025RKEY.Value);
 
// if self.find_difficulty(dm.AQY0025RKEY.Value) then
//  dm.AQY0025barcode_flag.Value:=1;          //自动标识高难度

 if checkbox2.Checked then
  dm.AQY0025current_rev.Value:='Y'
 else
  dm.AQY0025current_rev.Value:='N';

 dm.AQY0025.Post;
 if_post:=true;
 self.update_drill(dm.AQY0025RKEY.Value);  //更新钻孔表
 Self.update_target(dm.AQY0025RKEY.Value); //更新压合靶矩表
 if dm.AQY0025PARENT_PTR.Value=0  then       //顶层保存
 begin
  self.update_ecnlist(dm.AQY0025RKEY.Value); //更新ecn履历表
  update_filename;        //更新工程相关文档
  self.update_impedance(dm.AQY0025RKEY.Value);   //更新阻抗
 end;
 dm.ADOConnection1.CommitTrans;

 infor:='';
 if (dm.AQY0025ttype.Value=0) and (dm.AQY0025PARENT_PTR.Value=0) then  //量产,外层板才做防呆检查
  if self.find_setpnlmin(infor) then
   infor:='下例产品与本产品交货尺寸非常接近,建议增加工程防呆设计:'+#13+infor;

  pnla_size:='';
  pnla_width:='';

  pnla_infor:='';
  if find_spec_rkey('6') then pnla_size:= dm.ads279PARAMETER_VALUE.Value ;  //PNLA尺寸(长)
  if find_spec_rkey('7') then pnla_width:= dm.ads279PARAMETER_VALUE.Value ;  //PNLA尺寸(宽)

  if (dm.AQY0025PARENT_PTR.Value = 0) and (dm.AQY0025ttype.Value=0) then  //外层,量产
   if (pnla_size<>'') and (pnla_width<>'') and
      (self.find_nearpnlmin(pnla_infor,pnla_size,pnla_width)) then
     infor:= infor+#13+'下例产品与本产品交货尺寸相同且生产A板尺寸正负3mm,建议增加工程防呆设计!'+#13+pnla_infor;

 if Trim(infor)<>'' then
  begin
   clipboard.Clear;
   Clipboard.AsText:=infor;
  // common.ShowMsg('产品拼版尺寸相同或者相近,或者相近且生产尺寸相同的产品信息已复制到粘贴板,如有需要请及时粘贴!',1);
   common.ShowMsg(infor,1);
  end;

 DM.cmd1.Parameters[0].Value := Pinteger1(TreeView1.Items[0].data)^;
 DM.cmd1.Execute;  

 self.ModalResult:=mrok;
except
 on E: Exception do
  begin
   dm.ADOConnection1.RollbackTrans;
   messagedlg(E.Message,mterror,[mbcancel],0);
  end;
end;

end;

procedure TForm2.DBEdit19KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (chr(key)='D') and (ssCtrl in shift) then
 dm.AQY0025spell_lngth.Value:=dm.AQY0025set_lngth.Value;
 if key=13 then dbedit20.SetFocus; 
end;

procedure TForm2.DBEdit20KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (chr(key)='D') and (ssCtrl in shift) then
 dm.AQY0025spell_width.Value:=dm.AQY0025set_width.Value;
 if key=13 then dbedit22.SetFocus; 
end;

procedure TForm2.DBEdit22KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (chr(key)='D') and (ssCtrl in shift) then
 dm.AQY0025spell_qty.Value:=dm.AQY0025set_qty.Value;
end;

procedure TForm2.DBEdit17KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (chr(key)='D') and (ssCtrl in shift) then
 dm.AQY0025set_lngth.Value:=dm.AQY0025pcs_lngth.Value;
 if key=13 then dbedit18.SetFocus;
end;

procedure TForm2.DBEdit18KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (chr(key)='D') and (ssCtrl in shift) then
 dm.AQY0025set_width.Value:=dm.AQY0025pcs_width.Value;
 if key=13 then dbedit21.SetFocus;
end;

procedure TForm2.DBEdit15KeyPress(Sender: TObject; var Key: Char);
begin
if (key = chr(46)) then  //如果是小数点
if pos('.',(sender as TDBEdit).Text)>0 then  //小数点不能重复
  abort;
end;

procedure TForm2.DBEdit21KeyPress(Sender: TObject; var Key: Char);
begin
if (key = chr(46)) then  //如果是小数点
  abort;
end;

procedure TForm2.DBEdit21KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
if (trim((sender as TDBEdit).Text)='') or
   (trim((sender as TDBEdit).Text)='0') then
   (sender as TDBEdit).Text:='1';
end;

procedure TForm2.DBEdit17Exit(Sender: TObject);
begin
if dm.AQY0025.State=dsedit then
 dm.AQY0025unit_sq.Value:=dm.AQY0025set_lngth.Value*
                         dm.AQY0025set_width.Value*0.000001
                          /dm.AQY0025set_qty.Value;
end;

procedure TForm2.DBEdit19Exit(Sender: TObject);
begin
if dm.AQY0025.State=dsedit then
 dm.AQY0025spell_sq.Value:=dm.AQY0025spell_lngth.Value*
                         dm.AQY0025spell_width.Value*0.000001
                          /dm.AQY0025spell_qty.Value;
end;

procedure TForm2.btn3Click(Sender: TObject);
begin
try
 form_route:=tform_route.Create(application);
 form_route.Edit1.Text:=edit1.Text;
 form_route.Label2.Caption:=label4.Caption;
 form_route.Label3.Caption:= treeview1.Items[0].Text;
 form_route.route_ptr.Caption:=inttostr(dm.AQY0025ENG_ROUTE_PTR.value);
 form_route.label4.Caption:=self.rev;
 if form_route.ShowModal=mrok then
 begin
  //edit1.Text:=form_route.Edit1.Text;
  //label4.Caption:=form_route.Label2.Caption;
  dm.AQY0025ENG_ROUTE_PTR.Value:=strtoint(form_route.route_ptr.Caption);
 end;
finally
 form_route.Free;
end;
end;

procedure TForm2.DBGrid1ColExit(Sender: TObject);
begin
If DBGrid1.SelectedField.FieldName = DBComboBox1.DataField then
 DBComboBox1.Visible := false;
end;

procedure TForm2.DBComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
 if dm.ads279datatype.Value='数字' then
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
if treeview1.Selected.Level=0 then       //顶层产品时需打开
begin
 dm.ads89.DisableControls;
 dm.ads279.DisableControls;
 dm.ADS279.First;
 while not dm.ads279.Eof do
 begin
  if dm.ads89.Locate('PARAMETER_NAME',dm.ads279PARAMETER_NAME.Value,[]) then
  begin
   dm.ADS279.Edit;
   dm.ads279PARAMETER_VALUE.Value:=dm.ads89tvalue.Value;
  end;
  dm.ads279.Next;
 end;
 dm.ads89.First;
 dm.ads279.First;
 dm.ads279.EnableControls;
 dm.ads89.EnableControls;
end;

if find_spec_rkey('L') then //交货板面积
 begin
  DM.D279ParamChangeEventEnable(False);
  try
  dm.ads279.Edit;
  dm.ads279PARAMETER_VALUE.Value:=formatfloat('0.00000000',dm.AQY0025unit_sq.Value);
  dm.ads279.Post;
  finally
  DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
  dm.D279ParamChangeEventEnable(True);
  end;
  dm.ads279.First;
 end;

if find_spec_rkey('LY') then //层数
 begin
   DM.D279ParamChangeEventEnable(False);
   try
  dm.ads279.Edit;
  dm.ads279PARAMETER_VALUE.Value:=dm.AQY0025LAYERS.AsString;
  dm.ads279.Post;
  finally
  DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
  dm.D279ParamChangeEventEnable(True);
  end;  
  dm.ads279.First;
 end;

if find_spec_rkey('SU') then //出货单位
 begin
   DM.D279ParamChangeEventEnable(False);
   try
  dm.ads279.Edit;
  dm.ads279PARAMETER_VALUE.Value:=dm.AQY0025SO_UNIT.AsString;
  dm.ads279.Post;
  finally
  DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
  dm.D279ParamChangeEventEnable(True);
  end;  
  dm.ads279.First;
 end;

if find_spec_rkey('DZ') then //单元尺寸
 begin
   DM.D279ParamChangeEventEnable(False);
   try
  dm.ads279.Edit;
  dm.ads279PARAMETER_VALUE.Value:=dm.AQY0025pcs_lngth.AsString
                                       +'mm X '+dm.AQY0025pcs_width.AsString+'mm';
  dm.ads279.Post;
  finally
  DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
  dm.D279ParamChangeEventEnable(True);
  end;
  dm.ads279.First;
 end;

if find_spec_rkey('JN') then //交货单元数
 begin
   DM.D279ParamChangeEventEnable(False);
   try
  dm.ads279.Edit;
  dm.ads279PARAMETER_VALUE.Value:=dm.AQY0025set_qty.AsString;
  dm.ads279.Post;
  finally
  DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
  dm.D279ParamChangeEventEnable(True);
  end;  
  dm.ads279.First;
 end;

if find_spec_rkey('U') then //大料规格
 begin
   DM.D279ParamChangeEventEnable(False);
   try
  dm.ads279.Edit;
  dm.ads279PARAMETER_VALUE.Value:=dm.AQY0025ANALYSIS_CODE_3.Value;
  dm.ads279.Post;
  finally
  DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
  dm.D279ParamChangeEventEnable(True);
  end;  
  dm.ads279.First;
 end;

  if dm.ads502TOTAL_PNLS_1.Value>0 then
  begin
   if find_spec_rkey('P') then //大料总PCS
   begin
     DM.D279ParamChangeEventEnable(False);
     try
    dm.ads279.Edit;
    dm.ads279PARAMETER_VALUE.Value:=inttostr(
                       (dm.ads502TOTAL_PNLS_1.Value*dm.ads502UPANEL.Value+
                       dm.ads502TOTAL_PNLS_2.Value*dm.ads502UPANEL_2.Value)*
                       dm.ads502UNIT_NUM.Value); //每张大料实际开PCS数
    dm.ads279.Post;
    finally
      DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
      dm.D279ParamChangeEventEnable(True);
    end;    
    dm.ads279.First;
   end;

   if find_spec_rkey('5') then //大料利用率%
   begin
     DM.D279ParamChangeEventEnable(False);
     try
    dm.ads279.Edit;
    dm.ads279PARAMETER_VALUE.Value:=FormatFloat('0.00',dm.ads502TUSAGE.Value);
    dm.ads279.Post;
    finally
      DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
      dm.D279ParamChangeEventEnable(True);
    end;    
    dm.ads279.First;
   end;
  end;

  if find_spec_rkey('1') then //PNLA拼版数
   begin
     DM.D279ParamChangeEventEnable(False);
     try
    dm.ads279.Edit;
    dm.ads279PARAMETER_VALUE.Value:=dm.ads502TOTAL_PNLS_1.AsString;
    dm.ads279.Post;
    finally
      DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
      dm.D279ParamChangeEventEnable(True);
    end;
    dm.ads279.First;
   end;

  if find_spec_rkey('3') then //pnla单元数 (PCS数量)
   begin
     DM.D279ParamChangeEventEnable(False);
     try
    dm.ads279.Edit;
    dm.ads279PARAMETER_VALUE.Value:=inttostr(dm.ads502UPANEL.value*
                                           dm.ads502UNIT_NUM.Value);
    //
    dm.ads279.Post;
    finally
      DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
     dm.D279ParamChangeEventEnable(True);
    end;
    dm.ads279.First;
   end;

  if find_spec_rkey('6') then
   begin
     DM.D279ParamChangeEventEnable(False);
     try
    dm.ads279.Edit;
    dm.ads279PARAMETER_VALUE.Value:=
            DM.ads502PNL_LEN.AsString;       //PNLA长度
    dm.ads279.Post;
    finally
      DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
      dm.D279ParamChangeEventEnable(True);
    end;
    dm.ads279.First;
   end;

  if find_spec_rkey('7') then
   begin
     DM.D279ParamChangeEventEnable(False);
     try
    dm.ads279.Edit;
    dm.ads279PARAMETER_VALUE.Value:=
            DM.ads502PNL_WTH.AsString;       //PNLA宽
    dm.ads279.Post;
    finally
      DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
      dm.D279ParamChangeEventEnable(True);
    end;
    dm.ads279.First;
   end;

  if find_spec_rkey('H') then//PNLA尺寸字符
   begin
     DM.D279ParamChangeEventEnable(False);
     try
    dm.ads279.Edit;
    dm.ads279PARAMETER_VALUE.Value:= DM.ads502PNL_LEN.AsString+
     'mm X '+DM.ads502PNL_WTH.AsString+'mm';
    dm.ads279.Post;
    finally
      DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
      dm.D279ParamChangeEventEnable(True);
    end;    
    dm.ads279.First;
   end;

  if find_spec_rkey('2') then //PNLB 拼版数
   begin
     DM.D279ParamChangeEventEnable(False);
     try
    dm.ads279.Edit;
    if dm.ads502TOTAL_PNLS_2.Value > 0 then
     dm.ads279PARAMETER_VALUE.Value:=dm.ads502TOTAL_PNLS_2.AsString
    else
     dm.ads279PARAMETER_VALUE.Value:='';
    dm.ads279.Post;
    finally
      DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
      dm.D279ParamChangeEventEnable(True);
    end;
    dm.ads279.First;
   end;

   if find_spec_rkey('4') then //PNLB 单元数
   begin
     DM.D279ParamChangeEventEnable(False);
     try
    dm.ads279.Edit;
    if dm.ads502UPANEL_2.Value > 0 then
     dm.ads279PARAMETER_VALUE.Value:=inttostr(dm.ads502UPANEL_2.Value*
                                     dm.ads502UNIT_NUM.Value)
    else
     dm.ads279PARAMETER_VALUE.Value:='';
    dm.ads279.Post;
    finally
  DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
  dm.D279ParamChangeEventEnable(True);
    end;
    dm.ads279.First;
   end;

   if find_spec_rkey('8') then
   begin
     DM.D279ParamChangeEventEnable(False);
     try
    dm.ads279.Edit;
    if DM.ads502PNL_LEN_2.Value > 0 then
     dm.ads279PARAMETER_VALUE.Value:=DM.ads502PNL_LEN_2.AsString   //PNLB 长度
    else
     dm.ads279PARAMETER_VALUE.Value:='';
    dm.ads279.Post;
    finally
  DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
  dm.D279ParamChangeEventEnable(True);
  end;    
    dm.ads279.First;
   end;

   if find_spec_rkey('UZ') then
   begin
     DM.D279ParamChangeEventEnable(False);
     try
    dm.ads279.Edit;
     dm.ads279PARAMETER_VALUE.Value:=DM.ads502seet_szie.AsString ;
    dm.ads279.Post;
    finally
  DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
  dm.D279ParamChangeEventEnable(True);
  end;    
    dm.ads279.First;
   end;

   if find_spec_rkey('9') then
   begin
     DM.D279ParamChangeEventEnable(False);
     try
    dm.ads279.Edit;
    if DM.ads502PNL_WTH_2.Value > 0 then
     dm.ads279PARAMETER_VALUE.Value:=DM.ads502PNL_WTH_2.AsString   //PNLB 宽
    else
     dm.ads279PARAMETER_VALUE.Value:='';
    dm.ads279.Post;
    finally
  DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
  dm.D279ParamChangeEventEnable(True);
  end;    
    dm.ads279.First;
   end;

   if find_spec_rkey('I') then//PNLB 尺寸字符
   begin
     DM.D279ParamChangeEventEnable(False);
     try
    dm.ads279.Edit;
    if DM.ads502PNL_LEN_2.Value > 0 then
    dm.ads279PARAMETER_VALUE.Value:= DM.ads502PNL_LEN_2.AsString+
      'mm X '+DM.ads502PNL_WTH_2.AsString+'mm'
    else
     dm.ads279PARAMETER_VALUE.Value:='';
    dm.ads279.Post;
    finally
  DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
  dm.D279ParamChangeEventEnable(True);
  end;    
    dm.ads279.First;
   end;
end;

procedure TForm2.N3Click(Sender: TObject);  //编辑工序
begin
try
 form_flowpara:=tform_flowpara.Create(application);
 dm.ads494.Filter:='step_number='+dm.ADS38STEP_NUMBER.AsString;
 if form_flowpara.ShowModal=mrok then
  begin

  end;
finally
 form_flowpara.Free;
end;
end;

procedure TForm2.N2Click(Sender: TObject);   //插入工序
var
 step_number:word;
 _rev:string;
  LSql: string;
  LGradeNote: string;
begin
try
 form_deptcode:=tform_deptcode.Create(application);
 if form_deptcode.ShowModal=mrok then
  begin

    LSql := 'SELECT D82.grade_code, d83.dept_ptr, d83.dept_note, d84.parameter_ptr, d84.tvalue, d34.DEPT_NAME, d278.PARAMETER_DESC FROM ' +
          ' Data0082 d82 inner join data0083 d83 on d82.grade_code = d83.grade_code ' +
          ' inner join data0084 d84 on d84.grade_code = d83.grade_code and d84.dept_ptr = d83.dept_ptr ' +
          ' inner join data0034 d34 on d34.rkey = d83.dept_ptr ' +
          ' inner join data0278 d278 on d278.rkey = d84.parameter_ptr ' +
          //' inner join data0038 d38 on d38.source_ptr = '  + DM.AQY0025.fieldbyname('rkey').AsString + ' and d38.STEP_NUMBER = ' + ads494.fieldbyname('STEP_NUMBER').AsString +
          //' and d38.dept_ptr = d83.dept_ptr' +
          ' where d82.grade_code = ' + QuotedStr(DM.AQY0025.fieldbyname('grade_code').AsString) +
          ' and d83.dept_ptr = ' +  form_deptcode.ADOQuery1rkey.AsString;

    if DM.SqlOpen(LSql) then
    begin
      if not DM.qryTmp.IsEmpty then
      begin
        LGradeNote := DM.qryTmp.fieldbyname('dept_note').AsString;
      end else
        LGradeNote := '';
    end;

   if dm.ADS38.IsEmpty then
    step_number:=1
   else
    begin
     step_number:=dm.ADS38.RecNo;
     dm.ADS38.IndexFieldNames := '';
     dm.ADS38.Filter:='step_number >= '+inttostr(step_number);
     dm.ADS38.DisableControls;
     while not dm.ADS38.Eof do
     begin
      dm.ADS38.Edit;
      dm.ADS38STEP_NUMBER.Value:=dm.ADS38STEP_NUMBER.Value+1;
      dm.ADS38.Post;
      dm.ADS38.Next;
     end;
     dm.ADS38.IndexFieldNames:='step_number';
     dm.ADS38.Filter:='';
     dm.ADS38.MoveBy(step_number-dm.ADS38.RecNo);
     dm.ADS38.EnableControls;

     dm.ads494.IndexFieldNames:='';
     dm.ads494.Filter:='step_number >= '+inttostr(step_number);
     while not dm.ads494.Eof do
     begin
      dm.ads494.Edit;
      dm.ads494step_number.Value := dm.ads494step_number.Value+1;
      dm.ads494.Post;
      dm.ads494.Next;
     end;
     dm.ads494.IndexFieldNames := 'step_number;seq_no';
     dm.ads494.Filter:='';
    end;
     if form_deptcode.ADOQuery1ppc_status.Value=0 then
      _rev:=''
     else
      _rev:=self.rev;




      DM.ADS38.Insert;
     DM.ADS38.FieldByName('dept_ptr').Value :=  form_deptcode.ADOQuery1rkey.Value;
     DM.ADS38.FieldByName('def_rout_inst').Value := form_deptcode.ADOQuery1DEF_ROUT_INST.Value;
     DM.ADS38.FieldByName('step_number').Value := step_number;
     DM.ADS38.FieldByName('source_ptr').AsString := DM.AQY0025.fieldbyname('rkey').AsString; //dm.AQY0025RKEY.AsString;
     DM.ADS38.FieldByName('tooling_rev').Value := _rev;
     DM.ADS38.FieldByName('outp_spfc').Value := 1;
     DM.ADS38.FieldByName('tool_old_rev').Value := '';
     DM.ADS38.FieldByName('tool_remark').Value := '';
     DM.ADS38.FieldByName('grade_note').Value := LGradeNote;
     dm.ADS38.Post;

//   dm.ADS38.InsertRecord([dm.AQY0025RKEY.Value,
//                          form_deptcode.ADOQuery1rkey.Value,
//                          form_deptcode.ADOQuery1DEF_ROUT_INST.Value,
//                          step_number,
//                          _rev,
//                          1]);
      dm.ADOQuery1.Close;   //=====不能改变adoquery1的语句
      dm.ADOQuery1.SQL.Text:=
'SELECT TOP 100 PERCENT PARAMETER_PTR, TValue, Doc_Flag, after_flag, formula,'+#13+
      'flow_spfc_flag, SEQ_NO, outp_spfc_flag '+#13+
      'FROM dbo.Data0506'+#13+
      'WHERE TTYPE = 3 AND '+#13+
      'SOURCE_PTR = '+dm.ADS38DEPT_PTR.AsString+#13+
      'ORDER BY SEQ_NO';
      dm.ADOQuery1.Open;
      while not dm.ADOQuery1.Eof do
      begin
       dm.ads494.AppendRecord([dm.ADOQuery1.FieldValues['PARAMETER_PTR'],
                 cacl_flowpara(dm.ADOQuery1.Fieldbyname('TValue').AsString,
                               trim(dm.ADOQuery1.Fieldbyname('formula').AsString)),
                               dm.ADS38SOURCE_PTR.Value,
                               dm.ADS38STEP_NUMBER.Value,
                               dm.ADOQuery1.FieldValues['SEQ_NO'],
                               dm.ADOQuery1.FieldValues['Doc_Flag'],
                               dm.ADOQuery1.FieldValues['after_flag'],
                               dm.ADOQuery1.FieldValues['flow_spfc_flag'],
                               DM.ADOQuery1.FieldValues['outp_spfc_flag']
                               ]);
       dm.ADOQuery1.Next;
      end;          //=======不能改变adoquery1的语句
   if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
  end;
finally
 form_deptcode.Free;
end;
end;

procedure TForm2.update_quanju;
var
  A_H,B_I:string;
  a_pnl,b_pnl,a_pcs,b_pcs:integer;
begin
 if find_spec_rkey('JS') then //CPJS
   begin
    if Trim(dm.ads279PARAMETER_VALUE.Value)<> '' then
    DM.AQY0025.FieldByName('CPJS').AsString:=dm.ads279PARAMETER_VALUE.Value;
    dm.ads279.First;
   end;

 if find_spec_rkey('LY') then //层数
   begin
    if Trim(dm.ads279PARAMETER_VALUE.Value)<> '' then
    DM.AQY0025.FieldByName('LAYERS').AsString:=dm.ads279PARAMETER_VALUE.Value;
    dm.ads279.First;
   end;

 if find_spec_rkey('U') then //板料厂商
   begin
    if Trim(dm.ads279PARAMETER_VALUE.Value)<> '' then
    DM.AQY0025.FieldByName('ANALYSIS_CODE_3').AsString:=dm.ads279PARAMETER_VALUE.Value;
    dm.ads279.First;
   end;   

 if find_spec_rkey('5') then //大料利用率%
   begin
    if Trim(dm.ads279PARAMETER_VALUE.Value)<> '' then
    DM.AQY0025TUSAGE.AsString:=dm.ads279PARAMETER_VALUE.Value;
    dm.ads279.First;
   end;



if find_spec_rkey('JN') then //交货单元数
 begin
   DM.D279ParamChangeEventEnable(False);
   try
  dm.ads279.Edit;
  dm.ads279PARAMETER_VALUE.Value:=dm.AQY0025set_qty.AsString;
  dm.ads279.Post;
  finally
  DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
  dm.D279ParamChangeEventEnable(True);
  end;   
  dm.ads279.First;
 end;

if find_spec_rkey('L') then //交货板面积
 begin
   DM.D279ParamChangeEventEnable(False);
   try
  dm.ads279.Edit;
  dm.ads279PARAMETER_VALUE.Value:=formatfloat('0.00000000',dm.AQY0025unit_sq.Value);
  dm.ads279.Post;
  finally
  DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
  dm.D279ParamChangeEventEnable(True);
  end;
  dm.ads279.First;
 end;
  
if (find_spec_rkey('DL')) then //钻带编号
 begin
  dm.ads494.Filter:='';
  while not dm.ads494.Eof do
  begin
   if dm.ads494SPEC_RKEY.Value='DR' then
    begin
      DM.D279ParamChangeEventEnable(False);
      try
     dm.ads279.Edit;
     dm.ads279PARAMETER_VALUE.Value:=DM.ads494PARAMETER_VALUE.Value;
     dm.ads279.Post;
     finally
  DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
  dm.D279ParamChangeEventEnable(True);
  end;      
     dm.ads279.First;
     break;
    end;
   dm.ads494.Next;
  end;
 end;

  if find_spec_rkey('6') then
   begin
     if Trim(dm.ads279PARAMETER_VALUE.Value)<>'' then
     A_H:=dm.ads279PARAMETER_VALUE.Value+'mm';
     dm.ads279.First;
   end;

  if find_spec_rkey('7') then
   begin
     if Trim(dm.ads279PARAMETER_VALUE.Value)<>'' then
     A_H:=A_H+' X '+dm.ads279PARAMETER_VALUE.Value+'mm';
    dm.ads279.First;
   end;

  if find_spec_rkey('H') then//PNLA尺寸字符
   begin
     if A_H<>'' then
     begin
       DM.D279ParamChangeEventEnable(False);
       try
      dm.ads279.Edit;
      dm.ads279PARAMETER_VALUE.Value:=A_H;
      dm.ads279.Post;
      finally
  DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
  dm.D279ParamChangeEventEnable(True);
  end;       
      dm.ads279.First;
     end;
   end;

  if find_spec_rkey('8') then
   begin
     if Trim(dm.ads279PARAMETER_VALUE.Value)<>'' then
     B_I:=dm.ads279PARAMETER_VALUE.Value+'mm';
     dm.ads279.First;
   end;

  if find_spec_rkey('9') then
   begin
     if Trim(dm.ads279PARAMETER_VALUE.Value)<>'' then
     B_I:=B_I+' X '+dm.ads279PARAMETER_VALUE.Value+'mm';
    dm.ads279.First;
   end;

  if find_spec_rkey('I') then//PNLB尺寸字符
   begin
     if B_I<>'' then
     begin
       DM.D279ParamChangeEventEnable(False);
       try
      dm.ads279.Edit;
      dm.ads279PARAMETER_VALUE.Value:=B_I;
      dm.ads279.Post;
      finally
  DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
  dm.D279ParamChangeEventEnable(True);
  end;       
      dm.ads279.First;
     end;
   end;

  if find_spec_rkey('1') then
   if Trim(dm.ads279PARAMETER_VALUE.Value)<>'' then
    try
     a_pnl:=dm.ads279PARAMETER_VALUE.AsInteger;
    except
     a_pnl:=0;
    end
   else
    a_pnl:=0
  else
   a_pnl:=0;

  if find_spec_rkey('2') then
   if Trim(dm.ads279PARAMETER_VALUE.Value)<>'' then
    try
     b_pnl:=dm.ads279PARAMETER_VALUE.AsInteger;
    except
     b_pnl:=0;
    end
   else
    b_pnl:=0
  else
   b_pnl:=0;

  if find_spec_rkey('3') then
   if Trim(dm.ads279PARAMETER_VALUE.Value)<>'' then
    try
     a_pcs:=dm.ads279PARAMETER_VALUE.AsInteger;
    except
     a_pcs:=0;
    end
   else
    a_pcs:=0
  else
   a_pcs:=0;

  if find_spec_rkey('4') then
   if Trim(dm.ads279PARAMETER_VALUE.Value)<>'' then
    try
     b_pcs:=dm.ads279PARAMETER_VALUE.AsInteger;
    except
     b_pcs:=0;
    end
   else
    b_pcs:=0
  else
   b_pcs:=0;

  //更新502的PNLA和PNLB的数量
  if not DM.ads502.IsEmpty then
  begin
    dm.ads502.Edit;
    DM.ads502.FieldByName('UNIT_NUM').AsInteger := DBEdit22.Field.AsInteger;
    DM.ads502.FieldByName('TOTAL_PNLS_1').AsInteger := a_pnl;
    DM.ads502.FieldByName('TOTAL_PNLS_2').AsInteger := b_pnl;
    dm.ads502.FieldByName('UPANEL').AsInteger := a_pcs div DBEdit22.Field.AsInteger;
    dm.ads502.FieldByName('UPANEL_2').AsInteger := b_pcs div DBEdit22.Field.AsInteger;
    dm.ads502.Post;
  end;

  if find_spec_rkey('P') then     //大料PCS总数
   begin
     DM.D279ParamChangeEventEnable(False);
     try
    dm.ads279.Edit;
    dm.ads279PARAMETER_VALUE.Value:=IntToStr(a_pnl*a_pcs+b_pnl*b_pcs);
    dm.ads279.Post;
    finally
  DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
  dm.D279ParamChangeEventEnable(True);
  end;     
    dm.ads279.First;
   end;

   
end;

procedure TForm2.BitBtn11Click(Sender: TObject);
var jpegimage:Tjpegimage;
    stream:TMemoryStream;
begin
  if (strtoint(status.Caption)<>1) and (not dm.CheckCostDeptSingle) then Exit;
  if not DM.CheckGrade_Code then Exit;
dm.ADOConnection1.BeginTrans;
try


 dm.AQY0025ANALYSIS_CODE_5.Value:=dm.AQY0025pcs_lngth.AsString+'mm X '+
                                  dm.AQY0025pcs_width.AsString+'mm';
 dm.AQY0025ANALYSIS_CODE_1.Value:=dm.AQY0025set_lngth.AsString+'mm X '+
                                  dm.AQY0025set_width.AsString+'mm';
 dm.AQY0025ANALYSIS_CODE_4.Value:=dm.AQY0025spell_lngth.AsString+'mm X '+
                                  dm.AQY0025spell_width.AsString+'mm';

    //更新层压图片
  jpegimage:=tjpegimage.Create;
  Stream:=TMemoryStream.Create;
  jpegimage.Assign(imgCY.Picture.Bitmap);
  jpegimage.JPEGNeeded;
  jpegimage.SaveToStream(stream);
  Stream.Position :=0;
  dm.AQY0025layers_image.LoadFromStream(stream);
  stream.Clear;
  jpegimage.Free;
  stream.Free;

 update_quanju;
 dm.ads502.UpdateBatch();
 dm.ads279.UpdateBatch();
 dm.ADS279_0.UpdateBatch();

 self.update_deptcode(dm.AQY0025RKEY.Value);   //38
 self.update_tecparameter(dm.AQY0025RKEY.Value);  //保存制程参数494
 self.update_IESparameter(dm.AQY0025RKEY.Value);  //保存IES选料参数  497
// if self.find_difficulty(dm.AQY0025RKEY.Value) then  //查找高难度(自动标识)
//  dm.AQY0025barcode_flag.Value:=1;

 if checkbox2.Checked then           //无卤素
  dm.AQY0025current_rev.Value:='Y'
 else
  dm.AQY0025current_rev.Value:='N';

 dm.AQY0025.Post;
 if_post:=true;
 self.update_drill(dm.AQY0025RKEY.Value);  //更新钻孔表
 self.update_target(dm.AQY0025RKEY.Value); //更新压合靶矩表
 if dm.AQY0025PARENT_PTR.Value=0  then       //顶层保存
 begin
  self.update_ecnlist(dm.AQY0025RKEY.Value); //更新ecn履历表
  self.update_filename;  //更新工程相关文档
  self.update_impedance(dm.AQY0025RKEY.Value); //更新阻抗
 end;
 dm.ADOConnection1.CommitTrans;


 DM.cmd1.Parameters[0].Value := Pinteger1(TreeView1.Items[0].data)^;
 DM.cmd1.Execute;

 dm.ADS38.Close;
 dm.ADS38.Open;
 dm.ads494.Close;
 dm.ads494.Open;

 dm.ads497.Close;
 dm.ads497.Open;

 dm.AQY0025.Close;
 dm.AQY0025.Open;
 dm.AQY0025.Edit;

 bitbtn11.Enabled:= not  bitbtn11.Enabled;

except
 on E: Exception do
  begin
   dm.ADOConnection1.RollbackTrans;
   messagedlg(E.Message,mterror,[mbcancel],0);
  end;
end;
end;

procedure TForm2.N1Click(Sender: TObject);
var
 _rev:string;
  LSql: string;
  LGradeNote: string;
begin


try
 form_deptcode:=tform_deptcode.Create(application);
 if form_deptcode.ShowModal=mrok then
  begin
    LSql := 'SELECT D82.grade_code, d83.dept_ptr, d83.dept_note, d84.parameter_ptr, d84.tvalue, d34.DEPT_NAME, d278.PARAMETER_DESC FROM ' +
          ' Data0082 d82 inner join data0083 d83 on d82.grade_code = d83.grade_code ' +
          ' inner join data0084 d84 on d84.grade_code = d83.grade_code and d84.dept_ptr = d83.dept_ptr ' +
          ' inner join data0034 d34 on d34.rkey = d83.dept_ptr ' +
          ' inner join data0278 d278 on d278.rkey = d84.parameter_ptr ' +
          //' inner join data0038 d38 on d38.source_ptr = '  + DM.AQY0025.fieldbyname('rkey').AsString + ' and d38.STEP_NUMBER = ' + ads494.fieldbyname('STEP_NUMBER').AsString +
          //' and d38.dept_ptr = d83.dept_ptr' +
          ' where d82.grade_code = ' + QuotedStr(DM.AQY0025.fieldbyname('grade_code').AsString) +
          ' and d83.dept_ptr = ' +  form_deptcode.ADOQuery1rkey.AsString;

    if DM.SqlOpen(LSql) then
    begin
      if not DM.qryTmp.IsEmpty then
      begin
        LGradeNote := DM.qryTmp.fieldbyname('dept_note').AsString;
      end else
        LGradeNote := '';
    end;

   if form_deptcode.ADOQuery1ppc_status.Value=0 then
    _rev:=''
   else
    _rev:=self.rev;
   DM.ADS38.Append;

   DM.ADS38.FieldByName('dept_ptr').Value := form_deptcode.ADOQuery1rkey.Value;
   DM.ADS38.FieldByName('def_rout_inst').Value := form_deptcode.ADOQuery1DEF_ROUT_INST.Value;
   DM.ADS38.FieldByName('step_number').Value := dm.ADS38.RecordCount + 1;
   DM.ADS38.FieldByName('source_ptr').AsString := DM.AQY0025.fieldbyname('rkey').AsString; //dm.AQY0025RKEY.AsString;
   DM.ADS38.FieldByName('tooling_rev').Value := _rev;
   DM.ADS38.FieldByName('outp_spfc').Value := 1;
   DM.ADS38.FieldByName('tool_old_rev').Value := '';
   DM.ADS38.FieldByName('tool_remark').Value := '';
   DM.ADS38.FieldByName('grade_note').Value := LGradeNote;

   dm.ADS38.Post;
//   dm.ADS38.AppendRecord([dm.AQY0025RKEY.Value,
//                          form_deptcode.ADOQuery1rkey.Value,
//                          form_deptcode.ADOQuery1DEF_ROUT_INST.Value,
//                          dm.ADS38.RecordCount+1,
//                          _rev,
//                          1,'','','']);
      dm.ADOQuery1.Close;   //=不能改变adoquery1的语句
      dm.ADOQuery1.SQL.Text:=
'SELECT TOP 100 PERCENT PARAMETER_PTR, TValue, Doc_Flag, after_flag, formula,'+#13+
      'flow_spfc_flag, SEQ_NO, outp_spfc_flag '+#13+
      'FROM dbo.Data0506'+#13+
      'WHERE TTYPE = 3 AND '+#13+
      'SOURCE_PTR = '+dm.ADS38DEPT_PTR.AsString+#13+
      'ORDER BY SEQ_NO';
      dm.ADOQuery1.Open;
      while not dm.ADOQuery1.Eof do
      begin
       dm.ads494.AppendRecord([dm.ADOQuery1.FieldValues['PARAMETER_PTR'],
                 cacl_flowpara(dm.ADOQuery1.Fieldbyname('TValue').AsString,
                               trim(dm.ADOQuery1.Fieldbyname('formula').AsString)),
                               dm.ADS38SOURCE_PTR.Value,
                               dm.ADS38STEP_NUMBER.Value,
                               dm.ADOQuery1.FieldValues['SEQ_NO'],
                               dm.ADOQuery1.FieldValues['Doc_Flag'],
                               dm.ADOQuery1.FieldValues['after_flag'],
                               dm.ADOQuery1.FieldValues['flow_spfc_flag'],
                               DM.ADOQuery1.FieldValues['outp_spfc_flag']
                               ]);
       dm.ADOQuery1.Next;
      end;                  //=======不能改变adoquery1的语句
    if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
  end;
finally
 form_deptcode.Free;
end;

end;

procedure TForm2.N4Click(Sender: TObject);//删除工序
var
 step_number:word;
begin
if dm.ADS38.RecNo = dm.ADS38.RecordCount then
begin
 dm.ads494.Filter:='step_number='+dm.ADS38STEP_NUMBER.AsString;
 dm.ads494.First;
 while not dm.ads494.Eof do dm.ads494.Delete;
 dm.ads494.Filter:='';
 dm.ADS38.Delete;
end
else
 begin
  dm.ads494.Filter:='step_number='+dm.ADS38STEP_NUMBER.AsString;
  dm.ads494.First;
  while not dm.ads494.Eof do dm.ads494.Delete;
  dm.ads494.Filter:='';
  dm.ADS38.Delete;

  step_number := dm.ADS38.RecNo;
  dm.ADS38.DisableControls;
  while not dm.ADS38.Eof do
   begin
    dm.ADS38.Edit;
    dm.ADS38STEP_NUMBER.Value := dm.ADS38STEP_NUMBER.Value-1;
    dm.ADS38.Post;
    dm.ADS38.Next;
   end;
   dm.ADS38.MoveBy(step_number-dm.ADS38.RecNo);
   dm.ADS38.EnableControls;

  dm.ads494.IndexFieldNames:='';
  dm.ads494.Filter:='step_number >= '+inttostr(step_number);
  while not dm.ads494.Eof do
   begin
    dm.ads494.Edit;
    dm.ads494step_number.Value := dm.ads494step_number.Value-1;
    dm.ads494.Post;
    dm.ads494.Next;
   end;
  dm.ads494.IndexFieldNames:='step_number;seq_no';
  dm.ads494.Filter:='';
 end;
  if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
var
    I: Integer;
begin
  case dm.ADS25TSTATUS.Value of
    5,2,0: ;
  else
    for I := 0 to popupmenu1.items.Count - 1 do
    begin
      PopupMenu1.Items[I].Enabled := False;
    end;
    Exit;
  end;


if dm.ADS38.IsEmpty then
 begin
  n3.Enabled:=false;
  n4.Enabled:=false;
  n27.Enabled:=false;
  n28.Enabled:=false;
  n29.Enabled:=false;
 end
else
 begin
  n3.Enabled:=true;
  n4.Enabled:=true;
  n29.Enabled:=true;
  if dm.ADS38STEP_NUMBER.Value=1 then
   n27.Enabled:=false
  else
   n27.Enabled:=true;
  if dm.ADS38STEP_NUMBER.Value=dm.ADS38.RecordCount then
   n28.Enabled:=false
  else
   n28.Enabled:=true;
 end;
end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
begin
try
 application.CreateForm(tForm_layer,Form_layer);
 Form_layer.ads93.Close;
 Form_layer.ads93.CommandText:=
   'select  RECORD_KEY,CODE, DESCRIPTION,layers_info'+#13+
   'from data0193'+#13+
   'where SPEC_RKEY <>''Y''';
 Form_layer.ads93.Open;
 if Form_layer.ads93.IsEmpty then
  messagedlg('没有建立标准层压结构!',mtinformation,[mbcancel],0)
 else
 if Form_layer.ShowModal=mrok then
 begin
  if checkbox1.Checked then  dm.AQY0025layers_info.Value:='';
  dbmemo1.Lines.Add(Form_layer.ads93layers_info.Value);
  if not bitbtn11.Enabled then bitbtn11.Enabled:=true;  
 end;
finally
 Form_layer.Free;
end;
end;

procedure TForm2.N5Click(Sender: TObject);
begin
try
 application.CreateForm(tForm_layer,Form_layer);
 Form_layer.ads93.Close;
 Form_layer.ads93.CommandText:=
   'select  RECORD_KEY,CODE, DESCRIPTION,layers_info'+#13+
   'from data0193'+#13+
   'where SPEC_RKEY =''Y''';
 Form_layer.ads93.Open;
 if Form_layer.ads93.IsEmpty then
  messagedlg('没有建立基本叠片结构!',mtinformation,[mbcancel],0)
 else
 if Form_layer.ShowModal=mrok then
 begin
  dbmemo1.Lines.Insert(dbmemo1.CaretPos.y,Form_layer.ads93layers_info.Value);
  if not bitbtn11.Enabled then bitbtn11.Enabled:=true;  
 end;
finally
 Form_layer.Free;
end;
end;

procedure TForm2.BitBtn9Click(Sender: TObject);
begin
frmpickengnote:=tfrmpickengnote.Create(application);
if frmpickengnote.ShowModal=mrok then
begin
 dm.AQY0025REMARK.Value:=dm.AQY0025REMARK.Value+
  frmpickengnote.ADOQuery1.fieldbyname('PROD_ROUT_INST').AsString;
end;
frmpickengnote.Free;
end;

procedure TForm2.BitBtn10Click(Sender: TObject);
begin
frmpickengnote:=tfrmpickengnote.Create(application);
if frmpickengnote.ShowModal=mrok then
begin
 dm.AQY0025ENG_NOTE.Value:=dm.AQY0025ENG_NOTE.Value+
  frmpickengnote.ADOQuery1.fieldbyname('PROD_ROUT_INST').AsString;
end;
frmpickengnote.Free;
end;

procedure TForm2.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var column,row:integer;
begin
 if button=mbright then
 begin
  (sender as tstringgrid).MouseToCell(x,y,column,row);
   if row<>0 then
  (sender as tstringgrid).Row:=row;
  (sender as tstringgrid).Col:=column;
 end;

end;

procedure TForm2.N7Click(Sender: TObject);
var i:word;
begin
 for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
  begin
   stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
   stringgrid1.Cells[0,i]:=inttostr(i);
  end;
  stringgrid1.RowCount:=stringgrid1.RowCount-1;
if not bitbtn11.Enabled then bitbtn11.Enabled:=true; 
end;

procedure TForm2.PopupMenu3Popup(Sender: TObject);
begin
 if stringgrid1.Row=stringgrid1.RowCount-1 then
  begin
   n6.Enabled:=false;
   n7.Enabled:=false;
   n16.Enabled:=false;
   n110.Enabled:=false;
   n111.Enabled:=false;
  end
 else
  begin
   n6.Enabled:=true;
   n7.Enabled:=true;
   n16.Enabled:=true;
   n110.Enabled:=true;
   n111.Enabled:=true;
  end;
 if stringgrid1.Row=1 then
  n15.Enabled:=false
 else
  n15.Enabled:=true;
 n18.Enabled:=stringgrid1.RowCount>2;  
end;

procedure TForm2.N6Click(Sender: TObject);
var i:word;
begin
 for i:=stringgrid1.RowCount-2 downto stringgrid1.Row do
  begin
   stringgrid1.Rows[i+1].Text:=stringgrid1.Rows[i].Text;
   stringgrid1.Cells[0,i+1]:=inttostr(i+1);
  end;
  stringgrid1.Rows[stringgrid1.Row].Text:='';
  stringgrid1.Cells[0,stringgrid1.Row]:= inttostr(stringgrid1.Row);
  stringgrid1.RowCount:=stringgrid1.RowCount+1;
if not bitbtn11.Enabled then bitbtn11.Enabled:=true;  
end;

procedure TForm2.StringGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (stringgrid1.Row=stringgrid1.RowCount-1) and
   (trim(stringgrid1.Rows[stringgrid1.Row].Text)<>'') then
 begin
  stringgrid1.Cells[0,stringgrid1.Row]:=inttostr(stringgrid1.Row);
  stringgrid1.Cells[1,stringgrid1.Row]:='T'+get_drTrow(stringgrid1.Row);
  stringgrid1.RowCount:=stringgrid1.RowCount+1;
  if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
 end;
end;

procedure TForm2.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   IF (KEY=13) and (Stringgrid1.row<stringgrid1.RowCount-1) then
   Stringgrid1.row:=Stringgrid1.row+1;
 if (chr(key)='D') and (ssCtrl in shift) and (stringgrid1.Row>1) then
  begin
   stringgrid1.Cells[stringgrid1.col,stringgrid1.row]:=
   stringgrid1.Cells[stringgrid1.col,stringgrid1.row-1];
  end;

if (chr(key)='R') and (ssCtrl in shift) and (bitbtn7.Enabled) then
 n11click(sender);
if (chr(key)='A') and (ssCtrl in shift) and (bitbtn7.Enabled) then
 n12click(sender);
if (chr(key)='T') and (ssCtrl in shift) and (bitbtn8.Enabled) then
 n13click(sender);
if (chr(key)='X') and (ssCtrl in shift) and (bitbtn8.Enabled) then
 n14click(sender);
end;

procedure TForm2.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);

begin

  IF ACOL=11 THEN
     stringgrid1.Options:=stringgrid1.Options-[goEditing]
  else
  stringgrid1.Options:=stringgrid1.Options+[goEditing];
  cbb1.Visible:=(ACol=11);

if (stringgrid1.Col=6)  then
 try //最少保留两位小数

  if length(stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row])-
    pos('.',stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row])<=2 then

  stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]:=
   formatfloat('0.00',
   strtofloat(stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]));
 except
 end;

if stringgrid1.Col=4 then
 stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]:=
  uppercase(stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]);

 if (stringgrid1.Col=6) then
 edit6.Text:=formatfloat('0.00',(get_mindrill()));

end;

procedure TForm2.StringGrid1Exit(Sender: TObject);
begin
if (stringgrid1.Col=6)  then
 try //最少保留两位小数

 if length(stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row])-
    pos('.',stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row])<=2 then

  stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]:=
   formatfloat('0.00',
   strtofloat(stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]));

 except
 end;

if stringgrid1.Col=4 then
 stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]:=
  uppercase(stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]);

if (stringgrid1.Col=6) then
 edit6.Text:=formatfloat('0.00',(get_mindrill()));
end;

function TForm2.dr_jishuan(dr:single): single;
begin
 result:=round(dr*20)/20;
end;

procedure TForm2.BitBtn6Click(Sender: TObject);
var
 i:word;
 err:boolean;
begin
 err:=false;
 for i:= 1 to stringgrid1.RowCount-2 do
 try
  if (trim(stringgrid1.Cells[4,i])='Y') and
     (roundto(strtofloat(stringgrid1.Cells[6,i]),-2)<>
      roundto(dr_jishuan(strtofloat(stringgrid1.Cells[3,i]))+strtofloat(edit7.Text),-2)) then
   begin
    messagedlg('第'+inttostr(i)+'行钻咀:'+stringgrid1.Cells[3,i]+'不符沉铜孔偏差'
    ,mtinformation,[mbcancel],0);
    err:=true;
   end
  else
   if (trim(stringgrid1.Cells[4,i])='N') and
     (roundto(strtofloat(stringgrid1.Cells[6,i]),-2)<>
      roundto(dr_jishuan(strtofloat(stringgrid1.Cells[3,i]))+strtofloat(edit8.Text),-2)) then
    begin
     messagedlg('第'+inttostr(i)+'行钻咀:'+stringgrid1.Cells[3,i]+'不符非沉铜孔偏差'
     ,mtinformation,[mbcancel],0);
     err:=true;
    end;
 except

 end;
 
if not err then
  common.ShowMsg('钻咀检查通过!',1);
end;

procedure TForm2.BitBtn7Click(Sender: TObject);

begin
 PopupMenu6.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TForm2.DBEdit15Exit(Sender: TObject);
begin
if dm.AQY0025.State=dsedit then
 begin
  dm.AQY0025pcs_sq.Value:=dm.AQY0025pcs_lngth.Value*
                         dm.AQY0025pcs_width.Value*0.000001;
  if dm.AQY0025SO_UNIT.Value='PCS' THEN
   begin
    dm.AQY0025set_lngth.Value:=dm.AQY0025pcs_lngth.Value;
    dm.AQY0025set_width.Value:=dm.AQY0025pcs_width.Value;
    dm.AQY0025unit_sq.Value:=dm.AQY0025pcs_sq.Value;
   end;
 end;
end;

procedure TForm2.TreeView1Change(Sender: TObject; Node: TTreeNode);
var
  LP: Pointer;
begin
  if (strtoint(status.Caption)<>1) and (not DM.CheckCostDeptSingle) then Abort;
 rkey25.Caption:=inttostr(Pinteger1(Node.data)^);
 notebook1.PageIndex:=0;
 node.SelectedIndex:=4;
 bitbtn14.Enabled:=false;
 if node.Level =0 then
 begin
  listbox1.Items.Text:=
  '产品信息'+#13+
  '拼版设计'+#13+
  '全局参数'+#13+
  '工艺流程'+#13+
  '层压结构'+#13+
  '钻咀表'+#13+
  '备注信息'+#13+
  '压合靶矩表'#13+
  '工程更改'+#13+
  '评审信息'+#13+
  '客户信息'+#13+
  'ECN履历表'+#13+
  '阻抗表'+#13+
  '工程档案';
  btnTB.Visible := True;
  cbbgrade.Enabled := True;
 end
 else
 begin
  listbox1.Items.Text:=
  '产品信息'+#13+
  '拼版设计'+#13+
  '全局参数'+#13+
  '工艺流程'+#13+
  '层压结构'+#13+
  '钻咀表'+#13+
  '备注信息'+#13+
  '压合靶矩表';
  btnTB.Visible := False;
  cbbgrade.Enabled := False;
 end;
end;

procedure TForm2.PopupMenu4Popup(Sender: TObject);
var node:TTreeNode;
begin
 node:=treeview1.Selected;
 if node.Level=4 then
  begin
   //n8.Enabled:=false;
   n44.Enabled:=False;
   n9.Enabled:=true;
  end
 else
  begin
   n8.Enabled:=true;
   n44.Enabled:=true;
   if node.Level=0 then
    n9.Enabled:=false
   else
    n9.Enabled:=true;
  end;
end;

procedure TForm2.N8Click(Sender: TObject);  //新建内层
var
 node:ttreenode;   //treeview控件的节点变量
 rkey0025:^integer;
 I: Integer;
begin
if bitbtn11.Enabled then
 if messagedlg('新建线路层,是否自动保存数据?',mtconfirmation,[mbyes,mbno],0)=mryes then
  bitbtn11click(sender);

try
form_append:=tform_append.Create(application);
 dm.AQY0025.Close;
 dm.AQY0025.Parameters[0].Value:=rkey25.Caption;
 dm.AQY0025.Open;

if form_append.ShowModal=mrok then
 begin
//   for I := 0 to Length(FRkey25Arr) - 1 do
//   begin
//     if FRkey25Arr[I] = -1 then
//     begin
//       FRkey25Arr[I] := dm.AQY0025RKEY.AsInteger;
//       Break;
//     end;
//   end;
  new(rkey0025);
  rkey0025^:=dm.AQY0025RKEY.Value;
//   SetLength(FRkey25Arr,Length(FRkey25Arr));
//   FRkey25Arr[High(frkey25arr)] := dm.AQY0025RKEY.AsInteger;
  node:=treeview1.Selected;
  //new(rkey0025);
  //rkey0025^:=dm.AQY0025RKEY.Value;
  node:=treeview1.Items.AddChildObject
  (node,dm.AQY0025MANU_PART_NUMBER.Value,rkey0025); //增加顶层节点
  node.ImageIndex:=node.Level;  //为第一层节点定义图画
  node.SelectedIndex := node.Level;//为第一层节点定义选择之后的图画
  treeview1.Selected:=node;   //会转向持行TreeView1Change

  self.update_notebook;
  if bitbtn11.Enabled then bitbtn11.Enabled:=false;
  if bitbtn1.Enabled then bitbtn1.Enabled:=false;
  if bitbtn14.Enabled then bitbtn14.Enabled:=false;
  if bitbtn15.Enabled then bitbtn15.Enabled:=false;
    
 end;
finally
form_append.Free;
end;

end;

procedure TForm2.N9Click(Sender: TObject); //删除内层
var
 node:ttreenode;   //treeview控件的节点变量
 rkey:integer;
begin
if dm.AQY0025RKEY.Value <> strtoint(rkey25.Caption) then
 begin
  if bitbtn11.Enabled then
  if messagedlg('删除线路层,是否自动保存数据?',mtconfirmation,[mbyes,mbno],0)=mryes then
   bitbtn11click(sender);
 end;

if messagedlg('删除将是不可逆操作!您确定要删除内层吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
begin
 node:=treeview1.Selected;
 if not node.HasChildren then
 begin
  dm.ADOConnection1.BeginTrans;
  try
  dm.AQY0025.Close;
  dm.AQY0025.Parameters[0].Value:=rkey25.Caption;
  dm.AQY0025.Open;
  rkey:=dm.AQY0025PARENT_PTR.Value;
  dm.AQY0025.Delete;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='update  data0025 '+
             'set PARTS_NUM = isnull(PARTS_NUM,0)-1 '+
             'where rkey='+inttostr(rkey);
    ExecSQL;
   end;
   dm.ads502.Close;
   dm.ads279.Close;
   dm.ADS38.Close;
   dm.ads494.Close;
   dm.ads497.Close;
   dm.ADS279_0.Close;
   dm.ads89.Close;
 
  node.Delete;
  dm.ADOConnection1.CommitTrans;
  if bitbtn11.Enabled then bitbtn11.Enabled:=false;
  if bitbtn14.Enabled then bitbtn14.Enabled:=false;
  if bitbtn1.Enabled then bitbtn1.Enabled:=false;
  if bitbtn15.Enabled then bitbtn15.Enabled:=false;

 except
  on E: Exception do
  begin
   dm.ADOConnection1.RollbackTrans;
   messagedlg(E.Message,mterror,[mbcancel],0);
  end;
 end;
 end
 else
  messagedlg('无法删除本身带有内层的产品!',mterror,[mbcancel],0);
end;
end;

procedure TForm2.BitBtn13Click(Sender: TObject);
begin
  Form_prodcode:=tForm_prodcode.Create(application);
  if Form_prodcode.ShowModal=mrok then
  begin
   edit1.Text:=Form_prodcode.ADOQuery1prod_code.Value;
   label15.Caption:=Form_prodcode.adoquery1PRODUCT_NAME.Value;
   dm.AQY0025PROD_CODE_PTR.Value:=Form_prodcode.adoquery1RKEY.value;
   if dm.AQY0025PARENT_PTR.Value<=0 then
   if dm.AQY0025ttype.Value=0 then
    begin
     dm.AQY0025EST_SCRAP.Value:=Form_prodcode.adoquery1EST_SCRAP.Value;
     self.est_scrap:=Form_prodcode.adoquery1est_scrap_ltm.value;
    end
   else
    begin
     dm.AQY0025EST_SCRAP.Value:=Form_prodcode.adoquery1EST_SCRAP1.Value;
     self.est_scrap:=Form_prodcode.adoquery1est_scrap1_lmt.Value;
    end;
   dm.AQY0025SHELF_LIFE.Value:=Form_prodcode.adoquery1LEAD_TIME.Value;
   dm.AQY0025MFG_LEAD_TIME.Value:=Form_prodcode.adoquery1MAX_DAYS_EARLY_BUILD.Value;
   dm.AQY0025OPT_LOT_SIZE.Value:=Form_prodcode.adoquery1OPT_LOT_SIZE.value;

   if Form_prodcode.adoquery1IESMODEL_PTR.Value>0 then
   IF DM.AQY0025ENG_ROUTE_PTR.Value<=0 THEN
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:='select ENG_FLOW_NAME,ENG_FLOW_DESC from data0504'+#13+
               'where rkey='+Form_prodcode.adoquery1IESMODEL_PTR.AsString;
     open;
     //edit1.Text:=fieldbyname('ENG_FLOW_NAME').AsString;
     //label4.Caption:=fieldbyname('ENG_FLOW_DESC').AsString;
     DM.AQY0025ENG_ROUTE_PTR.Value:=Form_prodcode.adoquery1IESMODEL_PTR.Value;
    end;

  end;
  Form_prodcode.Free;
end;

procedure TForm2.N10Click(Sender: TObject);
begin
try
 form_flowpara:=tform_flowpara.Create(application);
 dm.ads494.Filter:='step_number='+dm.ADS38STEP_NUMBER.AsString;
 with form_flowpara do
  begin
   bitbtn2.Enabled:=false;
   bitbtn3.Enabled:=false;
   btnTB.Enabled := False;
   btnNewCut.Enabled := False;
   dbmemo1.ReadOnly:=true;
   dbedit4.Enabled:=false;
   dbedit5.Enabled:=false;
   dbgrid1.PopupMenu:=nil;
   dbcombobox1.Enabled:=false;
   dbgrid1.Columns[5].ReadOnly:=true;
   dbgrid1.Columns[6].ReadOnly:=true;
   dbgrid1.Columns[7].ReadOnly:=true;
   dbgrid1.Columns[8].ReadOnly:=true;
   dbgrid1.Columns[9].ReadOnly:=true;
  end;

 if form_flowpara.ShowModal=mrok then
 begin

 end;
finally
 form_flowpara.Free;
end;
end;


procedure TForm2.BitBtn12Click(Sender: TObject);
begin
form_stepnumber:=tform_stepnumber.Create(application);
if form_stepnumber.ADODataSet1.IsEmpty then
 messagedlg('请首先输入上层产品工序流程',mtinformation,[mbcancel],0)
else
if form_stepnumber.ShowModal=mrok then
begin
 dm.AQY0025BOM_STEP.Value:=form_stepnumber.ADODataSet1STEP_NUMBER.Value;
 label64.Caption:=form_stepnumber.ADODataSet1DEPT_NAME.Value;
end;
form_stepnumber.free;
end;

procedure TForm2.BitBtn14Click(Sender: TObject);
var
 infor,pnla_size,pnla_width,pnla_infor:string;
begin
 if trim(dm.AQY0025MANU_PART_NUMBER.Value)='' then
 begin
  listbox1.ItemIndex:=0;
  notebook1.PageIndex:=listbox1.ItemIndex+1;
  messagedlg('本厂编号不允许为空!',mterror,[mbcancel],0);
  //DBEDIT1.SetFocus;
  exit;
 end;

 if trim(dm.AQY0025MANU_PART_DESC.Value)='' then
 begin
  listbox1.ItemIndex:=0;
  notebook1.PageIndex:=listbox1.ItemIndex+1;
  messagedlg('客户型号不允许为空!',mterror,[mbcancel],0);
  //DBEDIT2.SetFocus;
  exit;
 end;

 if dm.AQY0025PARENT_PTR.Value > 0 then  //内层
 begin
  if dm.AQY0025QTY_BOM.Value <= 0 then
  begin
   listbox1.ItemIndex:=0;
   notebook1.PageIndex:=listbox1.ItemIndex+1;
   messagedlg('压合比例输入有误!',mterror,[mbcancel],0);
   //DBEDIT33.SetFocus;
   exit;
  end;

  if dm.AQY0025QTY_PARENTBOM.Value <= 0 then
  begin
   listbox1.ItemIndex:=0;
   notebook1.PageIndex:=listbox1.ItemIndex+1;
   messagedlg('压合比例输入有误!',mterror,[mbcancel],0);
   //DBEDIT34.SetFocus;
   exit;
  end;

  if dm.AQY0025BOM_STEP.Value<=0 then
  begin
   listbox1.ItemIndex:=0;
   notebook1.PageIndex:=listbox1.ItemIndex+1;
   messagedlg('压合步骤输入有误!',mterror,[mbcancel],0);
   //DBEDIT32.SetFocus;
   exit;
  end
  else
  begin
   with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='SELECT Data0038.STEP_NUMBER, dbo.Data0034.DEPT_CODE,'+#13+
       'Data0034.DEPT_NAME, Data0034.BARCODE_ENTRY_FLAG'+#13+
       'FROM Data0038 INNER JOIN'+#13+
       'dbo.Data0034 ON dbo.Data0038.DEPT_PTR = dbo.Data0034.RKEY'+#13+
       'where data0038.SOURCE_PTR='+dm.AQY0025PARENT_PTR.AsString+#13+
       'and Data0038.STEP_NUMBER='+dm.AQY0025BOM_STEP.AsString+#13+
       'and data0034.IS_COST_DEPT=1';
    open;
   end;
   if dm.ADOQuery1.IsEmpty then
   begin
   listbox1.ItemIndex:=0;
   notebook1.PageIndex:=listbox1.ItemIndex+1;
   messagedlg('压合步骤输入有误,步骤号在上父层产品中没有找到对应的工序!',mterror,[mbcancel],0);
   //DBEDIT32.SetFocus;
   exit;
   end
  end;
 end;
 {
 else
 if dm.AQY0025EST_SCRAP.Value<=0 then
 begin
  listbox1.ItemIndex:=0;
  notebook1.PageIndex:=listbox1.ItemIndex+1;
  messagedlg('外层报废率不允许为零!',mterror,[mbcancel],0);
  DBEDIT7.SetFocus;
  exit;
 end;
 }
 if (dm.AQY0025SO_UNIT.Value='无要求') or
   (trim(dm.AQY0025SO_UNIT.Value)='') then
 begin
  listbox1.ItemIndex:=1;
  notebook1.PageIndex:=listbox1.ItemIndex+1;
  messagedlg('没有确定最终交货形式!',mterror,[mbcancel],0);
  //DBcombobox2.SetFocus;
  exit;
 end;

 dm.ads279.DisableControls;
 dm.ads279.First;
 while not dm.ads279.Eof do
 begin
  if (dm.ads279status3.Value=1) and
    (trim(dm.ads279PARAMETER_VALUE.Value)='') then
  begin
   listbox1.ItemIndex := 2;
   notebook1.PageIndex := listbox1.ItemIndex+1;
   messagedlg('全局参数为不允许为空的重要参数!',mterror,[mbcancel],0);
   dbgrid1.SetFocus;
   dm.ads279.EnableControls;
   exit;
  end;
  dm.ads279.Next;
 end;
 dm.ads279.First;
 dm.ads279.EnableControls;

 dm.ads494.Filter:='';
 dm.ads494.First;
 while not dm.ads494.Eof do
 begin
  if (dm.ads494SPEC_RKEY.Value='AP') then  //找到最小孔径参数
   IF formatfloat('0.00',(get_mindrill())) <> Trim(DM.ads494PARAMETER_VALUE.Value) then
   begin
    messagedlg('第'+DM.ads494step_number.AsString+'步制程参数最小孔径与钻咀表最小孔径不一致，请修改',
           mterror,[mbcancel],0);
    notebook1.PageIndex := listbox1.ItemIndex+1;
    dm.ADS38.Locate('step_number',dm.ads494step_number.Value,[]);
    //dbgrid2.SetFocus;
    Exit;
   end;

  if (dm.ads494flow_spfc_flag.Value = 'Y') and    //重点但
     (dm.ads494after_flag.Value <> 'Y') and       //不是后补参数
     (trim(dm.ads494PARAMETER_VALUE.Value) = '') then
  begin
   listbox1.ItemIndex := 3;
   notebook1.PageIndex := listbox1.ItemIndex+1;
   messagedlg('第'+DM.ads494step_number.AsString+'步制程参数为不允许为空的重要参数!',
           mterror,[mbcancel],0);
   dm.ADS38.Locate('step_number',dm.ads494step_number.Value,[]);
   //dbgrid2.SetFocus;
   exit;
  end;
  dm.ads494.Next;
 end;
dm.ads494.First;

  if (Length(Trim(DBEdit15.Field.AsString)) = 0 ) or (Length(Trim(DBEdit16.Field.AsString)) = 0) then
  begin
    ShowMessage('拼版设计页，单元PCS尺寸数据不能为空!');
    Exit;
  end;
  if (Length(Trim(DBEdit17.Field.AsString)) = 0 ) or (Length(Trim(DBEdit18.Field.AsString)) = 0) then
  begin
    ShowMessage('拼版设计页，交货SET尺寸数据不能为空!');
    Exit;
  end;
  if (Length(Trim(DBEdit19.Field.AsString)) = 0 ) or (Length(Trim(DBEdit20.Field.AsString)) = 0) then
  begin
    ShowMessage('拼版设计页，拼版尺寸SPELL数据不能为空!');
    Exit;
  end;
  if (Length(Trim(DBEdit28.Field.AsString)) = 0 ) then
  begin
    ShowMessage('拼版设计页，PCS面积数据不能为空!');
    Exit;
  end;
  if (Length(Trim(DBEdit21.Field.AsString)) = 0 ) or (Length(Trim(DBEdit26.Field.AsString)) = 0) then
  begin
    ShowMessage('拼版设计页，交货单元数不能为空!');
    Exit;
  end;
  if (Length(Trim(DBEdit22.Field.AsString)) = 0 ) or (Length(Trim(DBEdit27.Field.AsString)) = 0) then
  begin
    ShowMessage('拼版设计页，拼版单元数不能为空!');
    Exit;
  end;
  //检查拼版内层与外层拼版尺寸是否相同
  if TreeView1.Items.GetFirstNode <> nil then
    DM.CheckSpellSize(inttostr(Pinteger(TreeView1.Items.GetFirstNode.data)^));
  //检查有公式的参数值是否跟公式相等
  dm.AllFormulaCheck;
 infor:='';
 if (dm.AQY0025ttype.Value=0) and (dm.AQY0025PARENT_PTR.Value=0) then  //量产,外层板才做防呆检查
  if self.find_setpnlmin(infor) then
   infor:='下例产品与本产品交货尺寸非常接近,建议增加工程防呆设计:'+#13+infor;

  pnla_size:='';
  pnla_width:='';
  pnla_infor:='';

  if find_spec_rkey('6') then pnla_size:= dm.ads279PARAMETER_VALUE.Value ;  //PNLA尺寸字符
  if find_spec_rkey('7') then pnla_width:= dm.ads279PARAMETER_VALUE.Value ;  //PNLA尺寸(宽)

 if (dm.AQY0025PARENT_PTR.Value = 0) and (dm.AQY0025ttype.Value=0) then  //外层,量产
  if (pnla_size<>'') and (pnla_width<>'') and
      (self.find_nearpnlmin(pnla_infor,pnla_size,pnla_width)) then
     infor:= infor+#13+'下例产品与本产品交货尺寸相同且生产A板尺寸正负3mm,建议增加工程防呆设计!'+#13+pnla_infor;


 if Trim(infor)<>'' then
  begin
   clipboard.Clear;
   Clipboard.AsText:=infor;
//   common.ShowMsg('产品拼版尺寸相同或者相近,或者相近且生产尺寸相同的产品信息已复制到粘贴板,如有需要请及时粘贴!',1);
   common.ShowMsg(infor,1);
  end;

  if not DM.CheckGrade_Code then Exit;

 messagedlg('数据检查通过!',mtinformation,[mbok],0);
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
form_layersdata:=tform_layersdata.Create(application);
self.get_treedate(pinteger1(TreeView1.TopItem.Data)^,form_layersdata.TreeView1);
if form_layersdata.ShowModal=mrok then
 begin
  with dm.ADOQuery1 do
  begin
   close;
   sql.Text:=
   'select source_PTR, PARAMETER_PTR, PARAMETER_VALUE,IES_PROD,IES_CRP'+#13+
   'from data0279'+#13+
   'where  IES_PROD=1 and'+#13+
          'source_ptr= '+form_layersdata.rkey25.Caption+#13+
   'order by IES_CRP';
   open;
  end;
 dm.ads279.DisableControls;
 dm.ADS279.First;
 while not dm.ads279.Eof do
 begin
  if dm.ADOQuery1.Locate('PARAMETER_PTR',dm.ads279PARAMETER_PTR.Value,[]) then
  begin
    DM.D279ParamChangeEventEnable(False);
    try
   dm.ADS279.Edit;
   dm.ads279PARAMETER_VALUE.Value:=dm.ADOQuery1.Fieldbyname('PARAMETER_VALUE').AsString;
   dm.ads279.Post;
   finally
     DM.ads279PARAMETER_VALUEChange(DM.ads279.FieldByName('PARAMETER_VALUE'));
  dm.D279ParamChangeEventEnable(True);
  end; 
  end;
  dm.ads279.Next;
 end;
 dm.ads279.First;
 dm.ads279.EnableControls;
 
 end;
form_layersdata.Free;
end;

procedure TForm2.BitBtn15Click(Sender: TObject);
begin
 Print_menu.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TForm2.btn2Click(Sender: TObject);
var modalok:boolean;
begin
  DM.D494ParamChangeEventEnable(False);
  DM.D279ParamChangeEventEnable(False);
  try
 form_product:=tform_product.Create(application);
 form_product.adoquery1.Close;
 form_product.adoquery1.Open;
 if form_product.adoquery1.IsEmpty then
  BEGIN
   messagedlg('没有找到需要复制的产品',mtinformation,[mbcancel],0);
   EDIT1.SetFocus;
  END
 else
 if form_product.ShowModal=mrok then
 begin
if not dm.ADS38.IsEmpty then
 begin
  if messagedlg('产品已经有流程数据重复制流程将有可能导致原流程及制程信息丢失,请确认?',
    mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
   dm.ADS38.First;
   while not dm.ADS38.Eof do dm.ADS38.Delete;
   dm.ads494.Filter:='';
   dm.ads494.First;
   while not dm.ads494.Eof do dm.ads494.Delete;
   modalok:=true;
  end
  else
   modalok:=false;
 end
else
  modalok:=true;
 if modalok then
 begin
  with dm.ADOQuery2 do
   begin
    close;
    sql.Text:='SELECT Data0038.SOURCE_PTR, Data0038.DEPT_PTR, Data0038.DEF_ROUT_INST,'+#13+
      'Data0038.STEP_NUMBER,Data0038.tooling_rev,Data0038.OUTP_SPFC,Data0038.tool_old_rev '+#13+
      'FROM Data0038 inner join data0034 on '+#13+
      'Data0038.dept_ptr=data0034.rkey '+#13+
      'WHERE source_ptr = '+form_product.adoquery1rkey.AsString+#13+
      'and data0034.ACTIVE_FLAG=0'+#13+        //工序代码为有效
      'ORDER BY STEP_NUMBER';
    open;

    while not Eof do //函数中千万不能使用adoquery2
     begin
       DM.ADS38.Append;
       dm.ADS38.FieldByName('DEPT_PTR').AsString := fieldvalues['dept_ptr'];
       dm.ADS38.FieldByName('DEF_ROUT_INST').AsString := fieldvalues['DEF_ROUT_INST'];
       dm.ADS38.FieldByName('STEP_NUMBER').AsInteger := RecNo;
       dm.ADS38.FieldByName('tooling_rev').AsString := fieldvalues['tooling_rev'];
       dm.ADS38.FieldByName('OUTP_SPFC').AsString := fieldvalues['OUTP_SPFC'];
       dm.ADS38.FieldByName('tool_old_rev').AsString := fieldvalues['tool_old_rev'];
       dm.ADS38.FieldByName('SOURCE_PTR').AsString := dm.AQY0025RKEY.AsString;
       DM.ADS38.Post;
//      dm.ADS38.AppendRecord([dm.AQY0025RKEY.Value,
//                            fieldvalues['dept_ptr'],
//                            fieldvalues['DEF_ROUT_INST'],
//                            dm.ADOQuery2.RecNo,
//                            fieldvalues['tooling_rev'],
//                            fieldvalues['OUTP_SPFC'],
//                            fieldvalues['tool_old_rev']]);

      dm.ADOQuery1.Close;   //=====不能改变adoquery1的语句
      dm.ADOQuery1.SQL.Text:=
      'SELECT PARAMETER_PTR, PARAMETER_VALUE, custpart_ptr, step_number,'+#13+
      ' seq_no, Doc_Flag, after_flag, flow_spfc_flag, outp_spfc_flag '+#13+
      'FROM Data0494'+#13+
      'where custpart_ptr = '+form_product.adoquery1rkey.AsString+#13+
      'and step_number = '+fieldbyname('STEP_NUMBER').AsString+#13+
      'ORDER BY step_number,seq_no';
      dm.ADOQuery1.Open;

      while not dm.ADOQuery1.Eof do
      begin
       dm.ads494.AppendRecord([dm.ADOQuery1.FieldValues['PARAMETER_PTR'],
                               dm.ADOQuery1.Fieldbyname('PARAMETER_VALUE').AsString,
                               dm.AQY0025RKEY.Value,
                               dm.ADOQuery2.RecNo,
                               dm.ADOQuery1.FieldValues['SEQ_NO'],
                               dm.ADOQuery1.FieldValues['Doc_Flag'],
                               dm.ADOQuery1.FieldValues['after_flag'],
                               dm.ADOQuery1.FieldValues['flow_spfc_flag'],
                               DM.ADOQuery1.FieldValues['outp_spfc_flag']
                               ]);
       dm.ADOQuery1.Next;
      end;          //=======不能改变adoquery1的语句


      Next;
     end;    //=======不能改变adoquery2的语句


   end;

  dm.ADS38.First;
  dm.ads494.First;
 end;

 end;
 form_product.Free;
 finally
  DM.D494ParamChangeEventEnable(true);
  DM.D279ParamChangeEventEnable(true); 
 end
end;


procedure TForm2.N12Click(Sender: TObject);
var
pnla_pcs,pnlb_pcs,i:integer;
//set_pcs:integer;
begin
 pnla_pcs:=0;
 pnlb_pcs:=0;
// set_pcs:=0;
if find_spec_rkey('3') then //PNLA单元数
 if trim(dm.ads279PARAMETER_VALUE.Value)<>'' then
  pnla_pcs:=strtoint(dm.ads279PARAMETER_VALUE.Value);

if find_spec_rkey('4') then //PNLB单元数
 if trim(dm.ads279PARAMETER_VALUE.Value)<>'' then
  pnlb_pcs:=strtoint(dm.ads279PARAMETER_VALUE.Value);
 {
if find_spec_rkey('JN') then //set单元数
 if trim(dm.ads279PARAMETER_VALUE.Value)<>'' then
  set_pcs := strtoint(dm.ads279PARAMETER_VALUE.Value);
  }
for i:=1 to stringgrid1.RowCount-2 do
 try
  if pnla_pcs>0 then
   Stringgrid1.Cells[9,i]:=
   inttostr(strtoint(trim(Stringgrid1.Cells[7,i]))*pnla_pcs+1);
  if pnlb_pcs>0 then
   Stringgrid1.Cells[10,i]:=
   inttostr(strtoint(trim(Stringgrid1.Cells[7,i]))*pnlb_pcs+1);
  {
  if set_pcs > 0 then
   Stringgrid1.Cells[8,i]:=
   inttostr(strtoint(trim(Stringgrid1.Cells[7,i]))*set_pcs);
  }
  if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
 except

 end;

end;

procedure TForm2.N11Click(Sender: TObject);
var
pnla_pcs,pnlb_pcs:integer;
//set_pcs:integer;
begin
 pnla_pcs:=0;
 pnlb_pcs:=0;
// set_pcs := 0;
if find_spec_rkey('3') then //PNLA单元数
 if trim(dm.ads279PARAMETER_VALUE.Value)<>'' then
  pnla_pcs:=strtoint(dm.ads279PARAMETER_VALUE.Value);

if find_spec_rkey('4') then //PNLB单元数
 if trim(dm.ads279PARAMETER_VALUE.Value)<>'' then
  pnlb_pcs:=strtoint(dm.ads279PARAMETER_VALUE.Value);
{
if find_spec_rkey('JN') then //set单元数
 if trim(dm.ads279PARAMETER_VALUE.Value)<>'' then
  set_pcs := strtoint(dm.ads279PARAMETER_VALUE.Value);
 }
 try
  if pnla_pcs>0 then
   Stringgrid1.Cells[9,Stringgrid1.row]:=
   inttostr(strtoint(trim(Stringgrid1.Cells[7,Stringgrid1.row]))*pnla_pcs+1);
  if pnlb_pcs>0 then
   Stringgrid1.Cells[10,Stringgrid1.row]:=
   inttostr(strtoint(trim(Stringgrid1.Cells[7,Stringgrid1.row]))*pnlb_pcs+1);
 { if set_pcs > 0 then
   Stringgrid1.Cells[8,Stringgrid1.row]:=
   inttostr(strtoint(trim(Stringgrid1.Cells[7,Stringgrid1.row]))*set_pcs);
  }
  if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
 except

 end;

end;

procedure TForm2.N13Click(Sender: TObject);   //计算全部孔数
var
 i,total_a,total_b,total_set:integer;
begin
 total_a := 0;
 total_b := 0;
 total_set := 0;
 if pos('TOTAL',UpperCase(stringgrid1.Cells[7,stringgrid1.RowCount-2]))>0 then
 if messagedlg('孔数已经汇总是否继续?',mtconfirmation,[mbyes,mbno],0)=mrno then
  exit;

 try
 for i:=1 to stringgrid1.RowCount-2 do
  begin
   if trim(Stringgrid1.Cells[8,i])<>'' then
   total_set := total_set+strtoint(Stringgrid1.Cells[8,i]);

   if trim(Stringgrid1.Cells[9,i])<>'' then
   total_a := total_a+strtoint(Stringgrid1.Cells[9,i]);
   if trim(Stringgrid1.Cells[10,i])<>'' then
   total_b := total_b+strtoint(Stringgrid1.Cells[10,i]);
  end;
 except
  messagedlg('PNL孔数输入有误,汇总停止!',mterror,[mbcancel],0);
  exit;
 end;

 stringgrid1.Cells[7,stringgrid1.RowCount-1]:='Total:';
 if total_set>0 then
 stringgrid1.Cells[8,stringgrid1.RowCount-1]:=inttostr(total_set);
  if total_a>0 then
 begin
  stringgrid1.Cells[9,stringgrid1.RowCount-1]:=inttostr(total_a);
  stringgrid1.Cells[11,stringgrid1.RowCount-1] := '单A板大约用时:' + FormatFloat('0.00',total_a/12000);
 end;
if total_b>0 then
begin
stringgrid1.Cells[10,stringgrid1.RowCount-1]:=inttostr(total_b);
stringgrid1.Cells[11,stringgrid1.RowCount-1] := stringgrid1.Cells[11,stringgrid1.RowCount-1] + ';' +'单B板大约用时:' + FormatFloat('0.00',total_b/12000);
end;

stringgrid1.RowCount:=stringgrid1.RowCount+1;
if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
end;

procedure TForm2.BitBtn8Click(Sender: TObject);
begin
 PopupMenu7.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TForm2.N14Click(Sender: TObject); //公式计算孔数
var
 i,total_a,total_b,total_set:integer;
begin
 form_drcalc:=tform_drcalc.Create(application);
 if form_drcalc.ShowModal=mrok then
  begin

   total_a:=0;
   total_b:=0;
   total_set:=0;

   try
    for i:=strtoint(form_drcalc.Edit1.text) to strtoint(form_drcalc.Edit2.text) do
    begin
     if trim(Stringgrid1.Cells[8,i])<>'' then
     total_set := total_set+strtoint(Stringgrid1.Cells[8,i]);

     if trim(Stringgrid1.Cells[9,i])<>'' then
     total_a := total_a+strtoint(Stringgrid1.Cells[9,i]);
     if trim(Stringgrid1.Cells[10,i])<>'' then
     total_b := total_b+strtoint(Stringgrid1.Cells[10,i]);

    end;
   except
    messagedlg('PNL孔数输入有误,汇总停止!',mterror,[mbcancel],0);
    exit;
   end;

   stringgrid1.Cells[7,strtoint(form_drcalc.Edit2.text)+1]:='Total:';
   if total_set>0 then
    stringgrid1.Cells[8,strtoint(form_drcalc.Edit2.text)+1]:=inttostr(total_set);

   if total_a>0 then
   begin
    stringgrid1.Cells[9,strtoint(form_drcalc.Edit2.text)+1]:=inttostr(total_a);
    stringgrid1.Cells[11,stringgrid1.RowCount-1] := '单A板大约用时:' + FormatFloat('0.00',total_a/12000);
   end;
   if total_b>0 then
   begin
    stringgrid1.Cells[10,strtoint(form_drcalc.Edit2.text)+1]:=inttostr(total_b);
    stringgrid1.Cells[11,stringgrid1.RowCount-1] := stringgrid1.Cells[11,stringgrid1.RowCount-1] + ';' +'单B板大约用时:' + FormatFloat('0.00',total_b/12000);
   end;

  if not bitbtn11.Enabled then bitbtn11.Enabled:=true;

  end;
 form_drcalc.Free;
end;

procedure TForm2.BitBtn16Click(Sender: TObject);

begin
 PopupMenu11.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TForm2.DBEdit7Exit(Sender: TObject);
begin
 if ExRoundTo(dm.AQY0025EST_SCRAP.Value,2)>ExRoundTo(self.est_scrap,2) then
  begin
   showmessage('报废率不能大于报废上限:'+currtostr(self.est_scrap));
   dbedit7.SetFocus;
  end;
end;

procedure TForm2.BitBtn17Click(Sender: TObject);
begin
if pagecontrol1.ActivePageIndex=0 then
 if not dm.ads502sheet_BMP.IsNull then
  if self.SavePictureDialog1.Execute then
   image1.Picture.SaveToFile(self.SavePictureDialog1.FileName)
  else
 else
  messagedlg('大料拼版图为空不能保存!',mterror,[mbcancel],0)
else
if pagecontrol1.ActivePageIndex=1 then
 if not dm.ads502pnl_bmp.IsNull then
  if self.SavePictureDialog1.Execute then
   image2.Picture.SaveToFile(self.SavePictureDialog1.FileName)
  else
 else
  messagedlg('A拼版图为空不能保存!',mterror,[mbcancel],0)
else
if pagecontrol1.ActivePageIndex=2 then
 if not dm.ads502pnl2_bmp.IsNull then
  if self.SavePictureDialog1.Execute then
   image3.Picture.SaveToFile(self.SavePictureDialog1.FileName)
  else
 else messagedlg('B拼版图为空不能保存!',mterror,[mbcancel],0);
end;



procedure TForm2.BitBtn18Click(Sender: TObject);
begin
if stringgrid1.RowCount>2 then
 Export_Grid_to_Excel(STRINGGRID1,DBtext3.Caption,true);
end;

procedure TForm2.BitBtn19Click(Sender: TObject);
var
 i:integer;
begin
  OpenDialog1.DefaultExt :='*.XLS';
  OpenDialog1.Filter :='*.XLS|*.XLS';
  if OpenDialog1.Execute then
  if messagedlg('导入新的钻孔表,原数据将丢失继续吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
   begin
    for i:=1 to stringgrid1.RowCount-2 do  stringgrid1.Rows[i].Clear;
     stringgrid1.RowCount:=2;
    load_xls_to_sgrid(OpenDialog1.FileName,stringgrid1);
   end;
end;

procedure TForm2.N15Click(Sender: TObject);  //钻咀与上行对调
var i:integer;
begin
 strow:=tstringlist.Create;
 strow.AddStrings(self.StringGrid1.Rows[stringgrid1.row]);
 for i:=2 to StringGrid1.ColCount-1 do
 begin
  StringGrid1.Cells[i,stringgrid1.row]:=StringGrid1.Cells[i,stringgrid1.row-1];
  StringGrid1.Cells[i,stringgrid1.row-1]:=strow.Strings[i];
 end;
 strow.Destroy;
 stringgrid1.row:=stringgrid1.row-1;
 if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
end;

procedure TForm2.N16Click(Sender: TObject);   //钻咀与下行对调
var i:integer;
begin
 strow:=tstringlist.Create;
 strow.AddStrings(self.StringGrid1.Rows[stringgrid1.row]);
 for i:=2 to StringGrid1.ColCount-1 do
 begin
  StringGrid1.Cells[i,stringgrid1.row]:=StringGrid1.Cells[i,stringgrid1.row+1];
  StringGrid1.Cells[i,stringgrid1.row+1]:=strow.Strings[i];
 end;   
 strow.Destroy;
 stringgrid1.row:=stringgrid1.row+1;
 if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
end;

procedure TForm2.N17Click(Sender: TObject);   //钻咀与任一行对调
var row:string;
    i:integer;
begin
 row:=inttostr(self.StringGrid1.row);
 row:=
 InputBox('信息输入', '请输入对调行数:      ',row);

 try
  if (strtoint(row)<=0) or (strtoint(row)>=stringgrid1.RowCount) then
   begin
    showmessage('输入行号有误');
    exit;
   end;
 except
  showmessage('输入格式有误');
  exit;
 end;

 strow:=tstringlist.Create;
 strow.AddStrings(self.StringGrid1.Rows[stringgrid1.row]);
 for i:=2 to StringGrid1.ColCount-1 do
 begin
  StringGrid1.Cells[i,stringgrid1.row]:=StringGrid1.Cells[i,strtoint(row)];
  StringGrid1.Cells[i,strtoint(row)]:=strow.Strings[i];
 end;
 strow.Destroy;
 stringgrid1.row:=strtoint(row);
 if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
 Frm_PCBCUT:=TFrm_PCBCUT.Create(application);
 try
   Frm_PCBCUT.Label36.Caption:=dm.AQY0025MANU_PART_NUMBER.Value;
   Frm_PCBCUT.Label34.Caption:=dm.ADS25CUST_CODE.Value;

   Frm_PCBCUT.Edit6.Text:=dm.AQY0025spell_lngth.AsString;
   Frm_PCBCUT.Edit7.Text:=dm.AQY0025spell_width.AsString;
   Frm_PCBCUT.Edit8.Text:=dm.AQY0025spell_qty.AsString;
   
   if Frm_PCBCUT.ShowModal=mrok then
   begin
     dm.AQY0025spell_lngth.Value:=dm.ads502UNIT_LEN.Value;
     dm.AQY0025spell_width.Value:=dm.ads502UNIT_WTH.Value;
     dm.AQY0025spell_qty.Value:=dm.ads502UNIT_NUM.Value;
     dm.AQY0025TUSAGE.Value:=dm.ads502TUSAGE.Value;
     self.DBEdit19Exit(sender);
     image1.Picture.Assign(Load_JPG_Pic_From_DB(dm.ads502sheet_BMP));
    // if dm.ads502PNL_LEN.Value>0 then
       image2.Picture.Assign(Load_JPG_Pic_From_DB(dm.ads502pnl_bmp));
    // if not dm.ads502pnl2_bmp.IsNull then
       image3.Picture.Assign(Load_JPG_Pic_From_DB(dm.ads502pnl2_bmp));
   end;
 finally
   Frm_PCBCUT.free;
 end;
end;



procedure TForm2.N18Click(Sender: TObject);
var i:integer;
begin
if messagedlg('删除全部钻孔信息,原数据将丢失继续吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
  for i:=1 to stringgrid1.RowCount-2 do  stringgrid1.Rows[i].Clear;
   stringgrid1.RowCount:=2;
  if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
 end;
end;

procedure TForm2.SG2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (sg2.Row=sg2.RowCount-1) and (trim(sg2.Rows[sg2.Row].Text)<>'') then
 begin
  sg2.Cells[0,sg2.Row]:=inttostr(sg2.Row);
  sg2.RowCount:=sg2.RowCount+1;
  sg2.Cells[6,sg2.Row]:=datetostr(now);
 end;
end;

procedure TForm2.SG2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  IF (KEY=13) and (sg2.row<sg2.RowCount-1) then
   sg2.row:=sg2.row+1;
end;

procedure TForm2.N20Click(Sender: TObject);
var i:word;
begin
 for i:=sg2.RowCount-2 downto sg2.Row do
  sg2.Rows[i+1].Text:=sg2.Rows[i].Text;
 sg2.Rows[sg2.Row].Text:='';
 sg2.Cells[6,sg2.Row]:=datetostr(now);
 sg2.RowCount:=sg2.RowCount+1;
 for i:=1 to sg2.RowCount-2 do
  sg2.Cells[0,i]:=inttostr(i);
end;

procedure TForm2.N21Click(Sender: TObject);
var i:word;
begin
 for i:=sg2.Row to sg2.RowCount-2 do
  sg2.Rows[i].Text:=sg2.Rows[i+1].Text;
 sg2.RowCount:=sg2.RowCount-1;
 for i:=1 to sg2.RowCount-2 do
  sg2.Cells[0,i]:=inttostr(i);
end;

procedure TForm2.N22Click(Sender: TObject);
var i:integer;
begin
 if messagedlg('您确认要删除全部ECN履历信息吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
  for i:=1 to sg2.RowCount-2 do sg2.Rows[i].Clear;
  sg2.RowCount:=2;
 end;
end;

procedure TForm2.PopupMenu8Popup(Sender: TObject);
begin
 if (sg2.Row=1) or (sg2.Row=sg2.RowCount-1) then
   n23.Enabled:=false
 else n23.Enabled:=true; //第一行与最后一行不允许与上一行交换
 if sg2.Row>=sg2.RowCount-2 then
   n24.Enabled:=false
 else n24.Enabled:=true; //最后一行不允许与下一行交换
 
 if sg2.Row=sg2.RowCount-1 then
 begin
  n20.Enabled:=false;
  n21.Enabled:=false;
 end
 else begin
  n20.Enabled:=true;
  n21.Enabled:=true;
 end;
end;

procedure TForm2.BitBtn20Click(Sender: TObject);
var rkey_25,i,j:integer;
begin
 if messagedlg('导入ECN信息将清除现有ECN履历表，确认要导入吗？',mtwarning,[mbyes,mbno],0)=mryes then
 begin
  rkey_25:=dm.AQY0025RKEY.Value;
  for i:=1 to sg2.RowCount-2 do sg2.Rows[i].Clear;
  sg2.RowCount:=2;
  i:=1;
  while rkey_25>0 do
  begin
   with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='select d25.manu_part_number,d273.entered_date,d273.text,'
      +'case d273.source when 1 then ''内部'' when 2 then ''客户要求'' end as source,'
      +'d05.employee_name as engineer,d273.ecn_no,d5.employee_name as enter_user,'
      +'d273.copyfromcust_ptr,d273.customer_part_ptr '
      +' from data0273 d273 inner join data0025 d25 on d273.customer_part_ptr=d25.rkey'
      +' inner join data0005 d5 on d273.entered_by=d5.rkey'
      +' left join data0005 d05 on d273.verified_by=d05.rkey'
      +' where d273.customer_part_ptr='+inttostr(rkey_25);
    open;
    if not isempty then
    begin
     rkey_25:=fieldbyname('copyfromcust_ptr').AsInteger;
     sg2.Cells[0,i]:=inttostr(i);
     sg2.Cells[1,i]:=fieldbyname('manu_part_number').AsString;
     sg2.Cells[2,i]:=fieldbyname('text').AsString;
     sg2.Cells[3,i]:=fieldbyname('source').AsString;
     sg2.Cells[5,i]:=fieldbyname('engineer').AsString;
     sg2.Cells[6,i]:=fieldbyname('entered_date').AsString;
     sg2.Cells[7,i]:=fieldbyname('ecn_no').AsString;
     sg2.Cells[8,i]:=fieldbyname('enter_user').AsString;
     sg2.RowCount:=sg2.RowCount+1;
    end
    else rkey_25:=0;
    i:=i+1;
   end;
  end; //end while
  //-----以下交换前后顺序，版本由低到高
  strow:=Tstringlist.Create;
  for i:=1 to ((sg2.RowCount-2) div 2) do
  begin
   strow.Clear;
   strow.AddStrings(sg2.Rows[i]);
   for j:=1 to 8 do
   begin
    sg2.Cells[j,i]:=sg2.Cells[j,sg2.rowcount-1-i];
    sg2.Cells[j,sg2.RowCount-1-i]:=strow.Strings[j];
   end;
  end;
  strow.Destroy;

 end;
end;

procedure TForm2.N23Click(Sender: TObject);
var i:byte;
begin
 strow:=Tstringlist.Create;
 strow.AddStrings(sg2.Rows[sg2.Row]);
 for i:=1 to 8 do
 begin
   sg2.Cells[i,sg2.Row]:=sg2.Cells[i,sg2.Row-1];
   sg2.cells[i,SG2.row-1]:=strow.strings[i];
 end;
 sg2.Row:=sg2.Row-1;
 strow.Destroy;
end;

procedure TForm2.N24Click(Sender: TObject);
var i:integer;
begin
 strow:=tstringlist.Create;
 strow.AddStrings(self.sg2.Rows[sg2.row]);
 for i:=1 to 8 do
 begin
  sg2.Cells[i,sg2.row]:=sg2.Cells[i,sg2.row+1];
  sg2.Cells[i,sg2.row+1]:=strow.Strings[i];
 end;
 sg2.Row:=sg2.Row+1;
 strow.Destroy;
end;

procedure TForm2.MI1Click(Sender: TObject);
begin
 form_reportselect:=tform_reportselect.Create(application);
 if form_reportselect.ShowModal=mrok then
 begin
  form_report:=tform_report.Create(application);
  with form_report do
  begin

    ppReport1.Reset;
    ppReport1.Template.FileName :=
      stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
        'Manu_instruction.rtm';   //R:\NIERP\Report\Manu_instruction.rtm
    ppReport1.Template.LoadFromFile;
    ppreport1.SaveAsTemplate:=false;
    
   ads192.Open;
   ads279.Close;
   ads279.Parameters.ParamValues['rkey']:=dm.AQY0025RKEY.Value;
   if ads192ENG_CONTROL16.Value=1 then       //不显示为空的全局参数
    ads279.Parameters.ParamValues['value']:=''
   else ads279.Parameters.ParamValues['value']:='#@#@#';
   ads279.Open;

   ads25.Close;
   ads25.Parameters[0].Value:=dm.AQY0025RKEY.Value;
   ads25.Open;

   ads494.Close;
   ads494.Parameters.ParamValues['source_ptr']:=dm.AQY0025RKEY.Value;
   if ads192ENG_CONTROL2.Value=1 then       //不显示为空的制程参数
    ads494.Parameters.ParamValues['value']:=''
   else ads494.Parameters.ParamValues['value']:='#@#@#';
   ads494.Open;

   ads38.Close;
   ads38.Parameters.ParamValues['rkey']:=dm.AQY0025RKEY.Value;
   if form_reportselect.CheckBox3.Checked then
    ads38.Parameters.ParamValues['visible']:=1
   else ads38.Parameters.ParamValues['visible']:=2;
   ads38.Open;
   ads502.Open;
   ads29.Open;
   form_report.ppImage3.Picture.Assign(Load_JPG_Pic_From_DB(ads502DSDesigner));
   if ads502A3.Value>0 then
    form_report.ppimage1.Picture.Assign(Load_JPG_Pic_From_DB(ads502A));
   if ads502B.AsVariant <> null then
    form_report.ppimage2.Picture.Assign(Load_JPG_Pic_From_DB(ads502B));

    if (not ADS25DSDesigner35.IsNull) and
       (form_reportselect.CheckBox6.Checked) then
     begin
      form_report.ppImage4.Visible:=True;
      form_report.ppImage4.Picture.Assign(Load_JPG_Pic_From_DB(ADS25DSDesigner35));
     end
    else
     form_report.ppImage4.Visible:=False;
         
   if not form_reportselect.CheckBox1.Checked then
    form_report.ppSubReport1.Visible:=false;
   if not form_reportselect.CheckBox2.Checked then
    form_report.ppSubReport2.Visible:=false;
   if not form_reportselect.CheckBox4.Checked then
    form_report.ppSubReport3.Visible:=false;
   if not Form_reportselect.CheckBox5.Checked then
    Form_report.ppSubReport4.Visible:=false;
  end;

  form_report.ppReport1.Print;
  form_report.Free;
 end;
 form_reportselect.Free;
end;

procedure TForm2.ECN1Click(Sender: TObject);
begin
  Form_report1:=TForm_report1.Create(application);
   form_report1.ppReport1.Reset;
   form_report1.ppReport1.Template.FileName :=
      stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
        'ECN_LIST.RTM';
   form_report1.ppReport1.Template.LoadFromFile;
   form_report1.ppReport1.SaveAsTemplate := False;
  with form_report1 do
  begin
   aq35.Close;
   aq35.Parameters[0].Value:=dm.AQY0025RKEY.Value;
   aq35.Open;
   ppreport1.Print;
  end;
  form_report1.Free;
end;

procedure TForm2.SG2Exit(Sender: TObject);
var i:byte;
begin
 for i:=1 to sg2.RowCount-2 do
  if trim(sg2.Cells[6,i])<>'' then
   try
    strtodatetime(sg2.Cells[6,i]);
   except
    showmessage('第'+inttostr(i)+'条ECN记录日期输入不正确！');
    sg2.SetFocus;
    exit;
   end;
end; 

procedure TForm2.PM20Popup(Sender: TObject);
begin
 if dm.ADO20.IsEmpty then n19.Enabled:=false
 else n19.Enabled:=true;
end;

procedure TForm2.N19Click(Sender: TObject);
var f:string;
    fs:TMemoryStream;
begin
 if dm.ADO20file_content.IsNull then
 begin
   showmessage('此文档为空...');
   exit;
 end;
 fs := TMemoryStream.Create;
 dm.ADO20file_content.SaveToStream(fs);
 UnPackStream(fs);
 if not DirectoryExists(TmpFileDir) then
  if not CreateDir(TmpFileDir) then  raise Exception.Create('创建临时文件目录错误: '+TmpFileDir);
 f:=TmpFileDir+dm.ADO20file_Name.AsString;
 fs.SaveToFile(f);
 fs.Free;
// setfileattributes(pchar(f),FILE_ATTRIBUTE_READONLY);
 ShellExecute(0,'open',pchar(f),nil,nil,SW_SHOWNORMAL);
end;

procedure TForm2.FormDestroy(Sender: TObject);
var sr: TSearchRec;
begin
 dm.ADO20.Close;
 if FindFirst(TmpFileDir+'*.*', faAnyFile, sr) = 0 then
 begin
  repeat
   setfileattributes(pchar(TmpFileDir+sr.name),file_attribute_normal);
   DeleteFile(TmpFileDir+sr.Name);
  until FindNext(sr) <> 0;
  FindClose(sr);
 end;
file_name.Free;

end;

procedure TForm2.BitBtn21Click(Sender: TObject);
begin
Export_dbGrid_to_Excel(dbgrid3,'市场评审信息 '+dbtext3.Caption)
end;

procedure TForm2.SET1Click(Sender: TObject);  //根据SET孔数计算单行
var
 pnla_pcs,pnlb_pcs,set_pcs:integer;
begin
 pnla_pcs := 0;
 pnlb_pcs := 0;
 set_pcs := 0;
 if find_spec_rkey('3') then //PNLA单元数
  if trim(dm.ads279PARAMETER_VALUE.Value)<>'' then
   pnla_pcs:=strtoint(dm.ads279PARAMETER_VALUE.Value);

 if find_spec_rkey('4') then //PNLB单元数
  if trim(dm.ads279PARAMETER_VALUE.Value)<>'' then
   pnlb_pcs:=strtoint(dm.ads279PARAMETER_VALUE.Value);

 if find_spec_rkey('JN') then //set单元数
  if trim(dm.ads279PARAMETER_VALUE.Value)<>'' then
   set_pcs := strtoint(dm.ads279PARAMETER_VALUE.Value);

 try
  {
  if set_pcs > 0 then
   Stringgrid1.Cells[7,Stringgrid1.row]:=
   inttostr(trunc(strtoint(trim(Stringgrid1.Cells[8,Stringgrid1.row]))/set_pcs));
  }
  if pnla_pcs>0 then
   Stringgrid1.Cells[9,Stringgrid1.row]:=
   inttostr(strtoint(trim(Stringgrid1.Cells[8,Stringgrid1.row]))*trunc(pnla_pcs/set_pcs)+1);

  if pnlb_pcs>0 then
   Stringgrid1.Cells[10,Stringgrid1.row]:=
   inttostr(strtoint(trim(Stringgrid1.Cells[8,Stringgrid1.row]))*trunc(pnlb_pcs/set_pcs)+1);

  if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
 except

 end;

end;

procedure TForm2.SET2Click(Sender: TObject);   //根据SET计算全部
var
 pnla_pcs,pnlb_pcs,i,set_pcs:integer;
begin
 pnla_pcs:=0;
 pnlb_pcs:=0;
 set_pcs:=0;
if find_spec_rkey('3') then //PNLA单元数
 if trim(dm.ads279PARAMETER_VALUE.Value)<>'' then
  pnla_pcs:=strtoint(dm.ads279PARAMETER_VALUE.Value);

if find_spec_rkey('4') then //PNLB单元数
 if trim(dm.ads279PARAMETER_VALUE.Value)<>'' then
  pnlb_pcs:=strtoint(dm.ads279PARAMETER_VALUE.Value);

if find_spec_rkey('JN') then //set单元数
 if trim(dm.ads279PARAMETER_VALUE.Value)<>'' then
  set_pcs := strtoint(dm.ads279PARAMETER_VALUE.Value);

for i:=1 to stringgrid1.RowCount-2 do
 try
  {
  if set_pcs > 0 then
   Stringgrid1.Cells[7,i]:=
   inttostr(trunc(strtoint(trim(Stringgrid1.Cells[8,i]))/set_pcs));
  }
  if pnla_pcs>0 then
   Stringgrid1.Cells[9,i]:=
   inttostr(strtoint(trim(Stringgrid1.Cells[8,i]))*trunc(pnla_pcs/set_pcs)+1);

  if pnlb_pcs>0 then
   Stringgrid1.Cells[10,i]:=
   inttostr(strtoint(trim(Stringgrid1.Cells[8,i]))*trunc(pnlb_pcs/set_pcs)+1);

  if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
 except

 end;

end;

procedure TForm2.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as Tedit).Text)>0  then abort;
end;

procedure TForm2.N27Click(Sender: TObject);
var
 step_number,recd_cound:integer;
begin
 step_number:=dm.ADS38STEP_NUMBER.Value;
 recd_cound:=dm.ADS38.RecordCount;
 dm.ADS38.Edit;
 dm.ADS38STEP_NUMBER.Value:=recd_cound+1;
 dm.ADS38.Post;
 dm.ads494.Filter:='step_number='+inttostr(step_number);
 while not dm.ads494.Eof do
 begin
  dm.ads494.Edit;
  dm.ads494step_number.Value := recd_cound+1;
  dm.ads494.Post;
 end;


 dm.ADS38.MoveBy(step_number-1-dm.ADS38.RecNo);
 dm.ADS38.Edit;
 dm.ADS38STEP_NUMBER.Value:=step_number;
 dm.ADS38.Post;

 dm.ads494.Filter:='step_number='+inttostr(step_number-1);
 while not dm.ads494.Eof do
 begin
  dm.ads494.Edit;
  dm.ads494step_number.Value :=step_number ;
  dm.ads494.Post;
 end;

 dm.ADS38.Last;
 dm.ADS38.Edit;
 dm.ADS38STEP_NUMBER.Value:=step_number-1;
 dm.ADS38.Post;

 dm.ads494.Filter:='step_number='+inttostr(recd_cound+1);
 while not dm.ads494.Eof do
 begin
  dm.ads494.Edit;
  dm.ads494step_number.Value :=step_number-1 ;
  dm.ads494.Post;
 end;

 dm.ads494.Filter:='';

end;

procedure TForm2.N28Click(Sender: TObject);
var
 step_number,recd_cound:integer;
begin
 step_number:=dm.ADS38STEP_NUMBER.Value;
 recd_cound:=dm.ADS38.RecordCount;
 dm.ADS38.Edit;
 dm.ADS38STEP_NUMBER.Value:=recd_cound+1;
 dm.ADS38.Post;
 dm.ads494.Filter:='step_number='+inttostr(step_number);
 while not dm.ads494.Eof do
 begin
  dm.ads494.Edit;
  dm.ads494step_number.Value := recd_cound+1;
  dm.ads494.Post;
 end;


 dm.ADS38.MoveBy(step_number-dm.ADS38.RecNo);
 dm.ADS38.Edit;
 dm.ADS38STEP_NUMBER.Value:=step_number;
 dm.ADS38.Post;

 dm.ads494.Filter:='step_number='+inttostr(step_number+1);
 while not dm.ads494.Eof do
 begin
  dm.ads494.Edit;
  dm.ads494step_number.Value :=step_number ;
  dm.ads494.Post;
 end;

 dm.ADS38.Last;
 dm.ADS38.Edit;
 dm.ADS38STEP_NUMBER.Value:=step_number+1;
 dm.ADS38.Post;

 dm.ads494.Filter:='step_number='+inttostr(recd_cound+1);
 while not dm.ads494.Eof do
 begin
  dm.ads494.Edit;
  dm.ads494step_number.Value :=step_number+1 ;
  dm.ads494.Post;
 end;

 dm.ads494.Filter:='';

end;

procedure TForm2.N29Click(Sender: TObject);
begin
try
 form_deptcode:=tform_deptcode.Create(application);
 if form_deptcode.ShowModal=mrok then
  begin
   dm.ADS38.Edit;
   dm.ADS38DEPT_PTR.Value:=form_deptcode.ADOQuery1rkey.Value;
   dm.ADS38DEF_ROUT_INST.Value:=form_deptcode.ADOQuery1DEF_ROUT_INST.Value;
   dm.ADS38.Post;

 dm.ads494.Filter:='step_number='+dm.ADS38STEP_NUMBER.AsString;
 dm.ads494.First;
 while not dm.ads494.Eof do dm.ads494.Delete;

      dm.ADOQuery1.Close;   //=====不能改变adoquery1的语句
      dm.ADOQuery1.SQL.Text:=
'SELECT TOP 100 PERCENT PARAMETER_PTR, TValue, Doc_Flag, after_flag, formula,'+#13+
      'flow_spfc_flag, SEQ_NO, outp_spfc_flag '+#13+
      'FROM dbo.Data0506'+#13+
      'WHERE TTYPE = 3 AND '+#13+
      'SOURCE_PTR = '+dm.ADS38DEPT_PTR.AsString+#13+
      'ORDER BY SEQ_NO';
      dm.ADOQuery1.Open;
      while not dm.ADOQuery1.Eof do
      begin
       dm.ads494.AppendRecord([dm.ADOQuery1.FieldValues['PARAMETER_PTR'],
                 cacl_flowpara(dm.ADOQuery1.Fieldbyname('TValue').AsString,
                               trim(dm.ADOQuery1.Fieldbyname('formula').AsString)),
                               dm.ADS38SOURCE_PTR.Value,
                               dm.ADS38STEP_NUMBER.Value,
                               dm.ADOQuery1.FieldValues['SEQ_NO'],
                               dm.ADOQuery1.FieldValues['Doc_Flag'],
                               dm.ADOQuery1.FieldValues['after_flag'],
                               dm.ADOQuery1.FieldValues['flow_spfc_flag'],
                               DM.ADOQuery1.FieldValues['outp_spfc_flag']
                               ]);
       dm.ADOQuery1.Next;
      end;          //=======不能改变adoquery1的语句
   dm.ads494.Filter:='';
   if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
  end;
finally
 form_deptcode.Free;
end;

end;

procedure TForm2.PopupMenu9Popup(Sender: TObject);
begin
if dm.ads564.IsEmpty then
 begin
  n31.Enabled:=false;
  n32.Enabled:=false;
  n33.Enabled:=false;
  if strtoint(status.Caption)=0 then
   n30.Enabled:=true
  else
   n30.Enabled:=false;
 end
else
 if strtoint(status.Caption)=0 then
 begin
  n30.Enabled:=true;
  n31.Enabled:=true;
  n32.Enabled:=true;
  n33.Enabled:=true;
 end
else
 begin
  n30.Enabled:=false;
  n31.Enabled:=false;
  n32.Enabled:=false;
  n33.Enabled:=true;
 end;


end;

procedure TForm2.N30Click(Sender: TObject);
var i:integer;
    s:string;
    fs: TMemoryStream;  
begin
  OpenDialog1.DefaultExt :='*.*';
  OpenDialog1.Filter :='';
  if OpenDialog1.Execute then
  begin
    for i:=length(OpenDialog1.FileName) downto 1 do
    begin
      if  OpenDialog1.FileName[i]<>'\' then
         s:=OpenDialog1.FileName[i]+s
      else
         break;
    end;
    fs := TMemoryStream.Create;
    fs.LoadFromFile(OpenDialog1.FileName);
    if fs.Size>10*1024*1024 then
    begin
      showmessage('文件大小不能超过10M,请重新整理文件再保存...');
      fs.Free;
      exit;
    end;

    PackStream(fs);
    dm.ads564.Append;
    dm.ads564rec_no.Value:=dm.ads564.RecordCount;
    dm.ads564SOURCE_PTR.Value:=dm.AQY0025RKEY.Value;
    dm.ads564file_name.Value:=s;
    dm.ads564in_date.Value:=getsystem_date(dm.ADOQuery1,1);
    dm.ads564.Post;
    file_name.Add(OpenDialog1.FileName+';'+'0');
    fs.Free;
  end;
end;

procedure TForm2.N31Click(Sender: TObject);
var
 step_number:word;
begin
if Msg_Dlg_Ask('您确定要删除该记录吗?','提示信息',1) then
 begin
  file_name.Delete(dm.ads564rec_no.Value);
  if dm.ads564.RecNo=dm.ads564.RecordCount then
   dm.ads564.Delete
  else
   begin
    dm.ads564.Delete;
    step_number := dm.ads564.RecNo;
    while not dm.ads564.Eof do
     begin
      dm.ads564.Edit;
      dm.ads564rec_no.Value:=dm.ads564rec_no.Value-1;
      dm.ads564.Post;
      dm.ads564.Next;
     end;
    dm.ads564.MoveBy(step_number-dm.ads564.RecNo);
   end;
 end;
end;

procedure TForm2.N32Click(Sender: TObject);
var
 str:string;
begin
 str:=dm.ads564remark.Value;
 if inputquery('编辑备注','文件备注说明:       ',str) then
 begin
  dm.ads564.Edit;
  dm.ads564remark.Value:=str;
  dm.ads564.Post;
 end;
end;

procedure TForm2.N33Click(Sender: TObject);
var
 filename,f:string;
 fs: TMemoryStream;
begin
if copy(file_name.Strings[dm.ads564rec_no.value],
        pos(';',file_name.Strings[dm.ads564rec_no.value])+1,1)='1' then
  begin
    DM.AQtmp.Close;
    DM.AQtmp.SQL.Text:='select vcut_bmp FROM Data0564 where rkey='+dm.ads564rkey.AsString;
    DM.AQtmp.Open;
    if dm.AQtmp.fieldbyname('vcut_bmp').IsNull then
    begin
      showmessage('此文档为空...');
      exit;
    end;
    fs := TMemoryStream.Create;
    TBlobfield(dm.AQtmp.fieldbyname('vcut_bmp')).SaveToStream(fs);
    UnPackStream(fs);
    if not DirectoryExists(TmpFileDir) then
      if not CreateDir(TmpFileDir) then
        raise Exception.Create('创建临时文件目录错误: '+TmpFileDir);
    f:=TmpFileDir+dm.ads564file_name.AsString;
    fs.SaveToFile(f);
    fs.Free;
    ShellExecute(self.Handle,nil,pchar(f),nil,nil,SW_SHOWNORMAL);
  end
  else
   begin
    filename:= copy(file_name.Strings[dm.ads564rec_no.value],1,
                     pos(';',file_name.Strings[dm.ads564rec_no.value])-1);
    ShellExecute(self.Handle,nil,pchar(filename),nil,nil,SW_SHOWNORMAL);
   end;
end;

procedure TForm2.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (gdSelected  in State) then
 begin
  if (ACol = 1 ) then
   begin
    ComboBox1.Left := Rect.Left+1;
    ComboBox1.Top := Rect.Top+2;
    ComboBox1.Width := Rect.Right - Rect.Left+3;
    ComboBox1.Height := Rect.Bottom - Rect.Top;
    ComboBox1.Visible := True;
    if StringGrid2.Cells[acol,arow]<>'' then
     combobox1.ItemIndex:=combobox1.Items.IndexOf(StringGrid2.Cells[acol,arow])
    else
     combobox1.ItemIndex:=-1;
   end
  else
    ComboBox1.Visible :=false;
 end;


if (acol=0) and (ARow>0) and
   (ARow<>StringGrid2.RowCount-1) then
 StringGrid2.Canvas.TextRect(rect,rect.Left+2,rect.Top+2, inttostr(ARow));

end;

procedure TForm2.StringGrid2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (stringgrid2.Row=stringgrid2.RowCount-1) and
   (trim(stringgrid2.Rows[stringgrid2.Row].Text)<>'') then
 begin
  stringgrid2.Cells[0,stringgrid2.Row]:=inttostr(stringgrid2.Row);
  stringgrid2.RowCount:=stringgrid2.RowCount+1;
  if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
 end;
end;

procedure TForm2.N34Click(Sender: TObject);
var
  i:word;
begin
 for i:=stringgrid2.Row to stringgrid2.RowCount-2 do
  stringgrid2.Rows[i].Text:=stringgrid2.Rows[i+1].Text;
  stringgrid2.RowCount:=stringgrid2.RowCount-1;
if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
end;

procedure TForm2.N36Click(Sender: TObject);
var i:integer;
begin
if messagedlg('删除全部阻抗信息,原数据将丢失继续吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
  for i:=1 to stringgrid2.RowCount-2 do  stringgrid2.Rows[i].Clear;
   stringgrid2.RowCount:=2;
  if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
 end;
end;

procedure TForm2.StringGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF (KEY=13) and (Stringgrid2.row<stringgrid2.RowCount-1) and
     (stringgrid2.Col<>1) then
   Stringgrid2.row:=Stringgrid2.row+1;
 if (chr(key)='D') and (ssCtrl in shift) and (stringgrid2.Row>1) then
  begin
   stringgrid2.Cells[stringgrid2.col,stringgrid2.row]:=
   stringgrid2.Cells[stringgrid2.col,stringgrid2.row-1];
  end;
end;

procedure TForm2.N35Click(Sender: TObject); //阻抗表与上行对调
var i:integer;
begin
 strow:=tstringlist.Create;
 strow.AddStrings(StringGrid2.Rows[stringgrid2.row]);
 for i:=2 to StringGrid2.ColCount-1 do
 begin
  StringGrid2.Cells[i,stringgrid2.row]:=StringGrid2.Cells[i,stringgrid2.row-1];
  StringGrid2.Cells[i,stringgrid2.row-1]:=strow.Strings[i];
 end;
 strow.Destroy;
 stringgrid2.row:=stringgrid2.row-1;
 if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
end;

procedure TForm2.N37Click(Sender: TObject);
var i:integer;
begin
 strow:=tstringlist.Create;
 strow.AddStrings(self.StringGrid2.Rows[stringgrid2.row]);
 for i:=2 to StringGrid2.ColCount-1 do
 begin
  StringGrid2.Cells[i,stringgrid2.row]:=StringGrid2.Cells[i,stringgrid2.row+1];
  StringGrid2.Cells[i,stringgrid2.row+1]:=strow.Strings[i];
 end;
 strow.Destroy;
 stringgrid2.row:=stringgrid2.row+1;
 if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
end;

procedure TForm2.N38Click(Sender: TObject);
var row:string;
    i:integer;
begin
 row:=inttostr(self.StringGrid2.row);
 row:=
 InputBox('信息输入', '请输入对调行数:      ',row);

 try
  if (strtoint(row)<=0) or (strtoint(row)>=stringgrid2.RowCount) then
   begin
    showmessage('输入行号有误');
    exit;
   end;
 except
  showmessage('输入格式有误');
  exit;
 end;

 strow:=tstringlist.Create;
 strow.AddStrings(self.StringGrid2.Rows[stringgrid2.row]);
 for i:=2 to StringGrid2.ColCount-1 do
 begin
  StringGrid2.Cells[i,stringgrid2.row]:=StringGrid2.Cells[i,strtoint(row)];
  StringGrid2.Cells[i,strtoint(row)]:=strow.Strings[i];
 end;
 strow.Destroy;
 stringgrid2.row:=strtoint(row);
 if not bitbtn11.Enabled then bitbtn11.Enabled:=true; 
end;

procedure TForm2.PopupMenu10Popup(Sender: TObject);
begin
if stringgrid2.Row = stringgrid2.RowCount-1 then
 begin
  n34.Enabled:=false;
  n37.Enabled:=false;
 end
else
 begin
  n34.Enabled:=true;
  n37.Enabled:=true;
 end;
 n36.Enabled:=stringgrid2.RowCount>2;
 n35.Enabled:=stringgrid2.Row>1;
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
 stringgrid2.Cells[1,stringgrid2.Row]:=combobox1.Text;
end;

procedure TForm2.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=112 then combobox1.DroppedDown:=true; //F1键出现下拉
if key=13 then stringgrid2.SetFocus;
end;

procedure TForm2.StringGrid2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 IF ACOL=1 THEN
  stringgrid2.Options:=stringgrid2.Options-[goEditing]
 else
  stringgrid2.Options:=stringgrid2.Options+[goEditing];
end;

procedure TForm2.BitBtn23Click(Sender: TObject);
var
 i:integer;
begin
if stringgrid2.RowCount>2 then
begin
 for i:=1 to stringgrid2.RowCount-2 do
  stringgrid2.Cells[0,i]:=inttostr(i);
 Export_Grid_to_Excel(STRINGGRID2,DBtext3.Caption,true);
end;
end;

procedure TForm2.BitBtn22Click(Sender: TObject);
var
 i:integer;
begin
  OpenDialog1.DefaultExt :='*.XLS';
  OpenDialog1.Filter :='*.XLS|*.XLS';
  if OpenDialog1.Execute then
  if messagedlg('导入新的阻抗表,原数据将丢失继续吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
   begin
    for i:=1 to stringgrid2.RowCount-2 do  stringgrid2.Rows[i].Clear;
     stringgrid2.RowCount:=2;
    self.load_xls_to_sgrid(OpenDialog1.FileName,stringgrid2);
   end;
end;

procedure TForm2.Paste(var str:string);
var i,x,y,tmpx,tmpy:integer;
    FromCB1:array [0..255] of array[0..255] of string;
begin
    if str = '' then
    showmessage('粘贴板内容为空，请复制所需内容。')
    else begin
              i:=pos(#13,str);
              Delete(str,1,i+1);
              i:=pos(#13,str);
              x:=0;
              while i<>0 do
              begin
                  FromCB1[x][0]:= copy(str,1,i-1);
                  Delete(str,1,i+1);
                  Inc(x);
                  i:=pos(#13,str);
              end;
              FromCB1[x][0]:= str;
              stringgrid1.RowCount := x + 3;
              tmpx:=x;
              for x:= 0 to tmpx do
              begin
                      i:=pos(#9,FromCB1[x][0]);
                      y:=1;
                      while i<>0 do
                      begin
                          FromCB1[x][y]:= copy(FromCB1[x][0],1,i-1);
                          FromCB1[x][0]:= copy(FromCB1[x][0],i+1,length(FromCB1[x][0])-i);
                          Inc(y);
                          i:=pos(#9,FromCB1[x][0]);
                      end;
                          FromCB1[x][y]:= FromCB1[x][0];
              end;
              tmpx:= x;
              tmpy:= y;
              for x:=0 to tmpx do
              begin
                  for y:=1 to tmpy+1 do
                        stringgrid1.Cells[y-1,x+1]:=FromCB1[x][y+1];
              end;
        end;
end;


procedure TForm2.BitBtn24Click(Sender: TObject);
var
  str:string;
begin
 if (stringgrid1.RowCount > 2) and
    (not Msg_Dlg_Ask('粘贴新的钻孔表,原数据将丢失继续吗?','信息提示',1)) then
 else
  begin
    str:= Clipboard.AsText;
   if (copy(str,1,1) = #9) {and (copy(str,2,4) = '序号') } then
     Paste(str)
   else
     showmessage('粘贴板的内容不是所需的粘贴内容，请重新复制');
  end;
end;

function TForm2.isnum(str:string):boolean;
var 
  i:integer;
begin
  for i:=1 to length(str) do
   if not (str[i] in ['0'..'9']) then
    begin
      result:=false;
      exit;
    end;
  result:=true;
end;

function TForm2.hz_jiajian(str: string; jia_or_jian: byte): string;
begin
 result:=str;
if isnum(copy(str,length(str)-1,2)) then       //最后两位是数字
 if jia_or_jian=1 then
  result:=copy(str,1,length(str)-2)+
                       copy(inttostr(100+
                       strtoint(copy(str,length(str)-1,2)
                                )+1),
                            2,2)
 else
  result:=copy(str,1,length(str)-2)+
                       copy(inttostr(100+
                       strtoint(copy(str,length(str)-1,2)
                                )-1),
                            2,2)
else
 if isnum(copy(str,length(str),1)) then       //最后一位是数字
  if jia_or_jian=1 then
   result:=copy(str,1,length(str)-1)+
                         copy(inttostr(10+
                         strtoint(copy(str,length(str),1)
                                  )+1),
                              2,1)
  else
   result:=copy(str,1,length(str)-1)+
                         copy(inttostr(10+
                         strtoint(copy(str,length(str),1)
                                  )-1),
                              2,1);
end;

procedure TForm2.N110Click(Sender: TObject);
var
 i:integer;
begin
 for i:=stringgrid1.Row+1 to stringgrid1.RowCount-1 do
  if trim(stringgrid1.Cells[1,i])<>'' then
   stringgrid1.Cells[1,i] := hz_jiajian(stringgrid1.Cells[1,i],1);//加1
end;

procedure TForm2.N111Click(Sender: TObject);
var
 i:integer;
begin
 for i:=stringgrid1.Row+1 to stringgrid1.RowCount-1 do
  if trim(stringgrid1.Cells[1,i])<>'' then
   stringgrid1.Cells[1,i] := hz_jiajian(stringgrid1.Cells[1,i],0);  //减1
end;



procedure TForm2.N39Click(Sender: TObject);
begin
frmpickengnote:=tfrmpickengnote.Create(application);
frmpickengnote.ADOQuery1.Close;
frmpickengnote.ADOQuery1.SQL.Text:=
'select * from data0036 where INST_CODE like ''dr%'' order by inst_code';
frmpickengnote.ADOQuery1.Open;
if frmpickengnote.ShowModal=mrok then
begin
 stringgrid1.Cells[11,stringgrid1.Row]:=
  frmpickengnote.ADOQuery1.fieldbyname('PROD_ROUT_INST').AsString;
end;
frmpickengnote.Free;
end;



procedure TForm2.DRL1Click(Sender: TObject);
//var
  //i:integer;
  //mytextfile:textfile;
  //s:string;
  //Hole_information_1:THole_information;
begin
     try
        inputform.OpenDialog1.Filter:='钻带文件(*.t*;*.d*)|*.t*;*.d*';
        inputform.OpenDialog1.Tag:=0;
         inputform.N2.Visible:=True;
         inputform.N8.Visible:=False;
        inputform.N7.Visible:=False;
        if inputform.OpenDialog1.Execute then
            inputform.ShowModal;
     finally
        inputform.Visible:=False;
     end;


  {
  OpenDialog1.DefaultExt :='*.drl';
  OpenDialog1.Filter :='*.DRL|*.DRL';
  if OpenDialog1.Execute then
   begin
    if OpenDialog1.FileName <>'' then
     begin
      assignfile(mytextfile,OpenDialog1.FileName );
      reset(mytextfile);
       try
        Hole_information_1:=THole_information.Create; //建立类
        Hole_information_1.initialization_Result_Drill_Hole_information ;  //初使化类的数据
        while not eof(mytextfile) do
          begin
           Readln(mytextfile,s);
           //处理得到的字符串
           Hole_information_1.Drill_File_content:=s; //类得到字符串
           Hole_information_1.calculate; //处理函数
          end;
        finally
          i:=1;
         WHILE Hole_information_1.Result_Drill_Hole_information[i].Hole_Size>0 do
          begin
            Stringgrid1.RowCount :=Stringgrid1.RowCount+1;
            Stringgrid1.rows[Stringgrid1.rowcount-1].Text :='';
            Stringgrid1.Cells[0,Stringgrid1.RowCount-2]:=inttostr(i);
            Stringgrid1.Cells[1,Stringgrid1.RowCount-2]:=
            ansiuppercase(Hole_information_1.Result_Drill_Hole_information[i].Hole_denotation);

            if Hole_information_1.Result_Drill_Hole_information[i].Hole_Size_Unit='Inch' then
             Stringgrid1.Cells[3,Stringgrid1.RowCount-2]:=
              format('%.2f',[Hole_information_1.Result_Drill_Hole_information[i].Hole_Size*25.4])
            else
             Stringgrid1.Cells[3,Stringgrid1.RowCount-2]:=
              format('%.2f',[Hole_information_1.Result_Drill_Hole_information[i].Hole_Size]);

            Stringgrid1.Cells[6,Stringgrid1.RowCount-2]:=Stringgrid1.Cells[3,Stringgrid1.RowCount-2];
            Stringgrid1.Cells[7,Stringgrid1.RowCount-2]:=
                    inttostr(Hole_information_1.Result_Drill_Hole_information[i].Hole_Number);
            i:=i+1;
          end;
          closefile(mytextfile); //关闭文件
          Hole_information_1.Free; //取消类
        end;
     end else
     begin
       showmessage('没有选择文件.');
     end;
   end;
   }
end;

procedure TForm2.Genesis1Click(Sender: TObject);
begin
 try
  form_genesis:=Tform_genesis.Create(application);
  with form_genesis do
   begin
    jobname.Text:=LowerCase(dbtext3.Field.Value);
    pth.Text:=edit7.Text;
    npth.Text:=edit8.Text;
   end;
  form_genesis.ShowModal;
 finally
  form_genesis.Free;
 end;
end;

procedure TForm2.N40Click(Sender: TObject);
var
 i:word;
begin
if messagedlg('您是否设定好PTH及PTH与NPTH的补尝?',mtconfirmation,[mbyes,mbno],0)=mryes then
begin

 for i:= 1 to stringgrid1.RowCount-2 do
 try
   if trim(stringgrid1.Cells[4,i])='Y' then
    stringgrid1.Cells[6,i]:=formatfloat('0.00',
                            dr_jishuan(strtofloat(stringgrid1.Cells[3,i]))+
                            strtofloat(edit7.Text))

  else
   if trim(stringgrid1.Cells[4,i])='N' then
    stringgrid1.Cells[6,i]:=formatfloat('0.00',
                            dr_jishuan(strtofloat(stringgrid1.Cells[3,i]))+
                            strtofloat(edit8.Text));

 except

 end;
 edit6.Text:=formatfloat('0.00',(get_mindrill()));
end;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
 PopupMenu12.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TForm2.N41Click(Sender: TObject);
var
 i:word;
begin
if messagedlg('您是否设定好PTH及PTH与NPTH的补尝?',mtconfirmation,[mbyes,mbno],0)=mryes then
begin

 for i:= 1 to stringgrid1.RowCount-2 do
 try
   if trim(stringgrid1.Cells[4,i])='Y' then
    stringgrid1.Cells[3,i]:=formatfloat('0.00',
                            StrToCurr(stringgrid1.Cells[6,i])-StrToCurr(edit7.Text))

  else
   if trim(stringgrid1.Cells[4,i])='N' then
    stringgrid1.Cells[3,i]:=formatfloat('0.00',
                            StrToCurr(stringgrid1.Cells[6,i])-StrToCurr(edit8.Text));

 except

 end;

end;
end;

procedure TForm2.BitBtn25Click(Sender: TObject);
var
 j:integer;
begin
form_layersdata:=tform_layersdata.Create(application);
self.get_treedate(pinteger1(TreeView1.TopItem.Data)^,form_layersdata.TreeView1);
if form_layersdata.ShowModal=mrok then
 begin
  with dm.ADOQuery1 do
  begin
   close;
   sql.Text:=
   'select * from data0502'+#13+
   'where source_ptr= '+form_layersdata.rkey25.Caption;
   open;
  end;
  if not dm.ads502.IsEmpty then dm.ads502.Edit else  dm.ads502.Append;
  for j:=1 to 22 do
   dm.ads502.Fields[j].Value:=dm.ADOQuery1.FieldValues[dm.ads502.Fields[j].FieldName];
   dm.ads502source_ptr.Value:= dm.AQY0025RKEY.Value;
   dm.ads502.Post;

  image1.Picture.Assign(Load_JPG_Pic_From_DB(dm.ads502sheet_BMP));
  image2.Picture.Assign(Load_JPG_Pic_From_DB(dm.ads502pnl_bmp));
  image3.Picture.Assign(Load_JPG_Pic_From_DB(dm.ads502pnl2_bmp));
 end;
form_layersdata.Free;
end;

function CallPCBCut: Boolean;
type
  pfShowPCBCutFrm = function (AOwner: TComponent): Boolean;stdcall;
var
  pf: Pointer;
  hMod: HWND;
begin
  Result := False;
  with TResourceStream.Create(HInstance,'RC1',RT_RCDATA) do
  begin
    try
      SaveToFile(PChar(ExtractFilePath(ParamStr(0))+'WZPCBCut.dll'));
    finally
      Free;
    end;
  end;
  hMod := LoadLibrary(PChar(ExtractFilePath(ParamStr(0)) + 'WZPCBCut.dll'));
  if (hMod <> 0) and (hMod <> INVALID_HANDLE_VALUE) then
  begin
    pf := GetProcAddress(hMod,'ShowPCBCutFrm');
    if pf <> nil then
      Result := pfShowPCBCutFrm(pf)(nil);
    FreeLibrary(hMod);
  end
end;

procedure TForm2.btnNewCutClick(Sender: TObject);
var
  tmpQry: TADOQuery;
  LIni: TIniFile;
  tmpS: string;
  LSheetW,lSheetH: Double;
begin
  LIni := TIniFile.Create(ExtractFilePath(ParamStr(0))+'PinBan.ini');
  try
    LIni.EraseSection('SheetList');
    LIni.EraseSection('DefDefCutParam');
    LIni.EraseSection('CutRet');
    LIni.EraseSection('DefCutParam');
    if OpenQuery(DM.AQtmp,'select selected,Length,Width,seet_szie from data0503 order by rkey') then
    begin
      while not DM.AQtmp.Eof do
      begin
        tmpS := DM.AQtmp.FieldByName('Length').AsString + 'x'+ DM.AQtmp.FieldByName('width').AsString;
        if DM.AQtmp.FieldByName('selected').AsBoolean then
          tmpS := tmpS + 'sY'
        else
          tmpS := tmpS + 'sN';
        if dm.AQtmp.FieldByName('seet_szie').AsString <> '' then
        begin
          tmpS := tmpS + '@' + dm.AQtmp.FieldByName('seet_szie').AsString;
        end;
        LIni.WriteString('SheetList',IntToStr(DM.AQtmp.RecNo),tmpS);
        DM.AQtmp.Next;
      end;
    end else
    begin
      ShowMessage('连接数据库失败');
      Exit;
    end;

    if OpenQuery(DM.AQtmp,'Select cut_unit_tp,cut_l1_max,cut_l1_min,cut_w1_max,cut_w1_min,cut_l2_max,cut_l2_min,cut_w2_max,cut_w2_min,SPACE_L_Min,SPACE_w_Min,border_l_min,border_w_min from data0192') then
    begin
      LIni.WriteString('DefCutParam','PnlMinW_A',DM.AQtmp.FieldByName('cut_l1_min').AsString);
      LIni.WriteString('DefCutParam','PnlMaxW_A',DM.AQtmp.FieldByName('cut_l1_max').AsString);
      LIni.WriteString('DefCutParam','PnlMinH_A',DM.AQtmp.FieldByName('cut_w1_min').AsString);
      LIni.WriteString('DefCutParam','PnlMaxH_A',DM.AQtmp.FieldByName('cut_w1_max').AsString);
      LIni.WriteString('DefCutParam','PnlBorderLeftRightW_A',DM.AQtmp.FieldByName('border_w_min').AsString);
      LIni.WriteString('DefCutParam','PnlBorderTopBottomW_A',DM.AQtmp.FieldByName('border_l_min').AsString);
      LIni.WriteString('DefCutParam','SetVerSpace_A',DM.AQtmp.FieldByName('space_w_min').AsString);
      LIni.WriteString('DefCutParam','SetHorSpace_A',DM.AQtmp.FieldByName('space_l_min').AsString);
    end else
    begin
      ShowMessage('连接数据库失败');
      Exit;
    end;

    LIni.WriteString('DefCutParam','PnlSetW_A',dm.AQY0025spell_lngth.AsString);
    LIni.WriteString('DefCutParam','PnlSetH_A',dm.AQY0025spell_width.AsString);

    if DM.ads502.Fieldbyname('total_pnls_1').AsInteger > 0 then
    begin
      LIni.WriteInteger('CutRet','HasRet',1);
      DM.ads502sheet_BMP.SaveToFile(ExtractFilePath(ParamStr(0))+ 'SheetImg.JPG');
      LIni.WriteString('CutRet','SheetImg',ExtractFilePath(ParamStr(0))+ 'SheetImg.JPG');
      DM.ads502pnl_bmp.SaveToFile(ExtractFilePath(ParamStr(0))+ 'PnlImg_A.JPG');
      LIni.WriteString('CutRet','PnlImg_A',ExtractFilePath(ParamStr(0))+ 'PnlImg_A.JPG');
      LIni.WriteString('CutRet','SheetW',DM.ads502.Fieldbyname('sht_len').AsString);
      LIni.WriteString('CutRet','SheetH',DM.ads502.Fieldbyname('sht_wth').AsString);

      //PnlA
      LIni.WriteString('CutRet','SetW_A',DM.ads502.Fieldbyname('unit_len').AsString);
      LIni.WriteString('CutRet','SetH_A',DM.ads502.Fieldbyname('unit_wth').AsString);
      LIni.WriteString('CutRet','PnlCount_A',DM.ads502.Fieldbyname('total_pnls_1').AsString);
      LIni.WriteString('CutRet','PnlW_A',DM.ads502.Fieldbyname('pnl_len').AsString);
      LIni.WriteString('CutRet','PnlH_A',DM.ads502.Fieldbyname('pnl_wth').AsString);
      LIni.WriteString('CutRet','SetCountPerPnl_A',DM.ads502.Fieldbyname('upanel').AsString);
      LIni.WriteString('CutRet','SetHorSapce_A',DM.ads502.Fieldbyname('minspace1').AsString);
      LIni.WriteString('CutRet','SetVerSapce_A',DM.ads502.Fieldbyname('minspace2').AsString);
      LIni.WriteString('CutRet','PnlLeftRightBorderW_A',DM.ads502.FieldByName('pnl_wthspace').AsString);
      LIni.WriteString('CutRet','PnlTopBottomBorderW_A',DM.ads502.FieldByName('pnl_lenspace').AsString);
      LIni.WriteString('CutRet','SheetUseage',DM.ads502.FieldByName('Tusage').AsString);

      //PnlB
      LIni.WriteInteger('CutRet','PnlCount_B',DM.ads502.Fieldbyname('total_pnls_2').asinteger);
      LIni.WriteFloat('CutRet','PnlW_B',DM.ads502.Fieldbyname('pnl_len_2').AsFloat);
      LIni.WriteFloat('CutRet','PnlH_B',DM.ads502.Fieldbyname('pnl_wth_2').AsFloat);
      LIni.WriteInteger('CutRet','SetCountPerPnl_B',DM.ads502.Fieldbyname('upanel_2').AsInteger);
      LIni.WriteFloat('CutRet','PnlLeftRightBorderW_B',DM.ads502.FieldByName('pnl_wthspace').AsFloat);
      LIni.WriteFloat('CutRet','PnlTopBottomBorderW_B',DM.ads502.FieldByName('pnl_lenspace').AsFloat);
      if DM.ads502.Fieldbyname('total_pnls_2').AsInteger > 0 then
      begin
        DM.ads502pnl2_bmp.SaveToFile(ExtractFilePath(ParamStr(0))+ 'PnlImg_B.JPG');
        LIni.WriteString('CutRet','PnlImg_B',ExtractFilePath(ParamStr(0))+ 'PnlImg_B.JPG');
      end;      
    end;

    if CallPCBCut then
    begin
      if DM.ads502.IsEmpty then
        DM.ads502.Append
      else
        DM.ads502.Edit;
      DM.ads502.Fieldbyname('unit_num').AsString := DBEdit22.Field.AsString;
      DM.ads502.FieldByName('source_ptr').Value := DM.AQY0025RKEY.Value;
      DM.ads502sheet_BMP.LoadFromFile(LIni.ReadString('CutRet','SheetImg',''));
      DM.ads502pnl_bmp.LoadFromFile(LIni.ReadString('CutRet','PnlImg_A',''));
      if LIni.ReadInteger('CutRet','PnlCount_B',0) > 0 then
        DM.ads502pnl2_bmp.LoadFromFile(LIni.ReadString('CutRet','PnlImg_B',''))
      else
        DM.ads502pnl2_bmp.Clear;
      DM.ads502.Fieldbyname('total_pnls_1').AsString := LIni.ReadString('CutRet','PnlCount_A','0');
      DM.ads502.Fieldbyname('total_pnls_2').AsString := LIni.ReadString('CutRet','PnlCount_B','0');
      DM.ads502.Fieldbyname('unit_len').AsString := LIni.ReadString('CutRet','SetW_A','0');
      DM.ads502.Fieldbyname('unit_wth').AsString := LIni.ReadString('CutRet','SetH_A','0');
      DM.ads502.Fieldbyname('unit_unit').asinteger := 0;
      DM.ads502.Fieldbyname('sht_len').AsString := LIni.ReadString('CutRet','SheetW','0');
      DM.ads502.Fieldbyname('sht_wth').AsString := LIni.ReadString('CutRet','SheetH','0');
      DM.ads502.Fieldbyname('pnl_len').AsString := LIni.ReadString('CutRet','PnlW_A','0');
      DM.ads502.Fieldbyname('pnl_wth').AsString := LIni.ReadString('CutRet','PnlH_A','0');
      DM.ads502.Fieldbyname('upanel').AsString := LIni.ReadString('CutRet','SetCountPerPnl_A','0');
      DM.ads502.Fieldbyname('pnl_len_2').AsString := LIni.ReadString('CutRet','PnlW_B','0');
      DM.ads502.Fieldbyname('pnl_wth_2').AsString := LIni.ReadString('CutRet','PnlH_B','0');
      DM.ads502.Fieldbyname('upanel_2').AsString := LIni.ReadString('CutRet','SetCountPerPnl_B','0');
      DM.ads502.Fieldbyname('minspace1').AsString := LIni.ReadString('CutRet','SetHorSapce_A','0');
      DM.ads502.Fieldbyname('minspace2').AsString := LIni.ReadString('CutRet','SetVerSpace_A','0');
      DM.ads502.FieldByName('pnl_lenspace').AsString := LIni.ReadString('CutRet','PnlTopBottomBorderW_A','0');
      DM.ads502.FieldByName('pnl_wthspace').AsString := LIni.ReadString('CutRet','PnlLeftRightBorderW_A','0');
      DM.ads502.FieldByName('Tusage').AsString := LIni.ReadString('CutRet','SheetUseage','0');
      DM.ads502.FieldByName('seet_szie').AsString := LIni.ReadString('CutRet','Seet_Size','');

      DM.ads502.Post;

      LSheetW := StrToFloat(LIni.ReadString('CutRet','SheetW',''));
      lSheetH := StrToFloat(LIni.ReadString('CutRet','SheetH',''));

      lSheetH := lSheetH * 0.03937;
      LSheetW := LSheetW * 0.03937;

      if not dm.ads279.Active then
        self.get_data0279(dm.AQY0025RKEY.Value);       //打开全局参数

//      DM.qryTmp.Close;
//      DM.qryTmp.SQL.Clear;
//      DM.qryTmp.SQL.Add(' UPDATE Data0279 SET PARAMETER_VALUE = ' + FormatFloat('##.#',lSheetH) + '*' + FormatFloat('##.#',LSheetW));
//      DM.qryTmp.SQL.Add(' WHERE IES_PROD=1 and source_ptr= ' + dm.AQY0025RKEY.AsString);
//      DM.qryTmp.SQL.Add(' AND PARAMETER_NAME = ' + QuotedStr('L-SIZE'));
//      dm.qryTmp.ExecSQL;
      DM.ads279.FieldByName('PARAMETER_VALUE').OnChange := nil;
      try
      DM.ads279.DisableControls;
      DM.ads279.First;
      while not DM.ads279.Eof do
      begin
        //大料PNLA拼板数
        if Trim(DM.ads279.FieldByName('SPEC_RKEY').AsString) = '1' then
        begin
          DM.ads279.Edit;
          DM.ads279.FieldByName('PARAMETER_VALUE').AsInteger := LIni.ReadInteger('CutRet','PnlCount_A',0);
          DM.ads279.Post;
        end;
        //大料PNLB拼板数
        if Trim(DM.ads279.FieldByName('SPEC_RKEY').AsString) = '2' then
        begin
          DM.ads279.Edit;
          DM.ads279.FieldByName('PARAMETER_VALUE').AsInteger := LIni.ReadInteger('CutRet','PnlCount_B',0);
          DM.ads279.Post;
        end;
        //PNLA单元数,PNLA的PCS数
        if Trim(DM.ads279.FieldByName('SPEC_RKEY').AsString) = '3' then
        begin
          DM.ads279.Edit;
          DM.ads279.FieldByName('PARAMETER_VALUE').AsInteger := DM.AQY0025.fieldbyname('spell_qty').AsInteger * LIni.ReadInteger('CutRet','SetCountPerPnl_A',0);
          DM.ads279.Post;
        end;
        //PNLB单元数，PNLB的pcs数
        if Trim(DM.ads279.FieldByName('SPEC_RKEY').AsString) = '4' then
        begin
          DM.ads279.Edit;
          DM.ads279.FieldByName('PARAMETER_VALUE').AsInteger := DM.AQY0025.fieldbyname('spell_qty').AsInteger * LIni.ReadInteger('CutRet','SetCountPerPnl_B',0);
          DM.ads279.Post;
        end;
        //大料利用率
        if Trim(DM.ads279.FieldByName('SPEC_RKEY').AsString) = '5' then
        begin
          DM.ads279.Edit;
          DM.ads279.FieldByName('PARAMETER_VALUE').AsString := LIni.ReadString('CutRet','SheetUseage','0');
          DM.ads279.Post;
        end;
        //PNLA长度
        if Trim(DM.ads279.FieldByName('SPEC_RKEY').AsString) = '6' then
        begin
          DM.ads279.Edit;
          DM.ads279.FieldByName('PARAMETER_VALUE').AsString := LIni.ReadString('CutRet','PnlW_A','0');
          DM.ads279.Post;
        end;
        //PNLA宽度
        if Trim(DM.ads279.FieldByName('SPEC_RKEY').AsString) = '7' then
        begin
          DM.ads279.Edit;
          DM.ads279.FieldByName('PARAMETER_VALUE').AsString := LIni.ReadString('CutRet','PnlH_A','0');
          DM.ads279.Post;
        end;
        //PNLB长度
        if Trim(DM.ads279.FieldByName('SPEC_RKEY').AsString) = '8' then
        begin
          DM.ads279.Edit;
          DM.ads279.FieldByName('PARAMETER_VALUE').AsString := LIni.ReadString('CutRet','PnlW_B','0');
          DM.ads279.Post;
        end;
        //PNLB宽度
        if Trim(DM.ads279.FieldByName('SPEC_RKEY').AsString) = '9' then
        begin
          DM.ads279.Edit;
          DM.ads279.FieldByName('PARAMETER_VALUE').AsString := LIni.ReadString('CutRet','PnlH_B','0');
          DM.ads279.Post;
        end;
        //PANEL (A)尺寸
        if Trim(DM.ads279.FieldByName('SPEC_RKEY').AsString) = 'H' then
        begin
          DM.ads279.Edit;
          DM.ads279.FieldByName('PARAMETER_VALUE').AsString := LIni.ReadString('CutRet','PnlW_A','0') + ' * ' + LIni.ReadString('CutRet','PnlH_A','0');
          DM.ads279.Post;
        end;
        //PANEL (B)尺寸
        if Trim(DM.ads279.FieldByName('SPEC_RKEY').AsString) = 'I' then
        begin
          DM.ads279.Edit;
          DM.ads279.FieldByName('PARAMETER_VALUE').AsString := LIni.ReadString('CutRet','PnlW_B','0') + ' * ' + LIni.ReadString('CutRet','PnlH_B','0');
          DM.ads279.Post;
        end;
        //交货单元数(PCS/SET)
        if Trim(DM.ads279.FieldByName('SPEC_RKEY').AsString) = 'JN' then
        begin
          DM.ads279.Edit;
          DM.ads279.FieldByName('PARAMETER_VALUE').AsString := DM.AQY0025.fieldbyname('set_qty').AsString;
          DM.ads279.Post;
        end;
        //大料PCS总数
        if Trim(DM.ads279.FieldByName('SPEC_RKEY').AsString) = 'P' then
        begin
          DM.ads279.Edit;
          DM.ads279.FieldByName('PARAMETER_VALUE').AsInteger := LIni.ReadInteger('CutRet','SheetSetCount',0) * DM.AQY0025.fieldbyname('spell_qty').AsInteger;
          DM.ads279.Post;
        end;              
        //大料规格
        if DM.ads279.FieldByName('PARAMETER_NAME').AsString = 'L-SIZE' then
        begin
          DM.ads279.Edit;
          DM.ads279.FieldByName('PARAMETER_VALUE').Value := FormatFloat('##.#',lSheetH) + '*' + FormatFloat('##.#',LSheetW);
          DM.ads279.Post;
        end;
        //大料英制
        if Trim(DM.ads279.FieldByName('SPEC_RKEY').AsString) = 'UZ' then
        begin
          DM.ads279.Edit;
          DM.ads279.FieldByName('PARAMETER_VALUE').AsString := LIni.ReadString('CutRet','Seet_Size','');
          DM.ads279.Post;
        end;        
        DM.ads279.Next;
      end;
      DM.ads279.First;
      finally
      dm.ads279.EnableControls;
      DM.ads279.FieldByName('PARAMETER_VALUE').OnChange := DM.ads279PARAMETER_VALUEChange;
      end;


      DM.AQY0025spell_lngth.Value := DM.ads502UNIT_LEN.Value;
      DM.AQY0025spell_width.Value := DM.ads502UNIT_WTH.Value;
      DM.AQY0025spell_qty.Value := DM.ads502UNIT_NUM.Value;
      DM.AQY0025TUSAGE.Value := DM.ads502TUSAGE.Value;
      DBEdit19Exit(sender);
      image1.Picture.LoadFromFile(LIni.ReadString('CutRet','SheetImg',''));
      image2.Picture.LoadFromFile(LIni.ReadString('CutRet','PnlImg_A',''));
      if LIni.ReadInteger('CutRet','PnlCount_B',0) > 0 then
       image3.Picture.LoadFromFile(LIni.ReadString('CutRet','PnlImg_B',''))
      else
        Image3.Picture := nil;
    end;

  finally
    LIni.Free;
  end;
end;

procedure TForm2.Genesis2Click(Sender: TObject);
begin
  inputform.OpenDialog1.Filter:='(*.txt)|*.txt';
  inputform.OpenDialog1.Tag:=1;
  if inputform.OpenDialog1.Execute then
      inputform.ShowModal;
end;

procedure TForm2.N42Click(Sender: TObject);
begin
  try
   Form4:=TForm4.Create(Application);
   Form4.Caption:=IntToStr(StringGrid1.Row);
   Form4.ShowModal;
  finally
   Form4.Free;
  end;
end;

procedure TForm2.DBComboBox2Change(Sender: TObject);
begin
if dbcombobox2.ItemIndex=0 then
 begin
  dbedit17.Field.Value:=dbedit15.Field.Value;
  dbedit18.Field.Value:=dbedit16.Field.Value;
  dbedit21.Field.Value:=1;
  dbedit17.Enabled:=false;
  dbedit18.Enabled:=false;
  dbedit21.Enabled:=false;
  dbedit26.Field.Value:=dbedit28.Field.Value;
 end
else
 begin
  dbedit17.Enabled:=true;
  dbedit18.Enabled:=true;
  dbedit21.Enabled:=true;
 end;
end;

procedure TForm2.N44Click(Sender: TObject);
var
 i, rkey:integer;
 node:ttreenode;   //treeview控件的节点变量
 rkey0025:^integer;
begin
 if bitbtn11.Enabled then
 if messagedlg('新建线路层,是否自动保存数据?',mtconfirmation,[mbyes,mbno],0)=mryes then
  bitbtn11click(sender);

 try
  form_childpart:=tform_childpart.Create(application);
  if form_childpart.ads37.Filter<>'' then
  form_childpart.ads37.Filter:='';
  if form_childpart.ShowModal=mrok then
  try
   dm.ADOConnection1.BeginTrans;
    with form_childpart do
    begin
      rkey:=StrToInt(self.rkey25.Caption);
      with dm.ADOQuery1 do
       begin
        close;
        sql.Text:='select * from data0025 where rkey='+inttostr(rkey);
        open;
       end;
      dm.AQY0025.Close;
      dm.AQY0025.Parameters[0].Value:=0;
      dm.AQY0025.Open;
      ads37.Filter:='if_select = 1';
      ads37.First;
      node:=treeview1.Selected;
      while not  ads37.Eof do
      begin                    //循环内不能使用dm.ADOQuery1
       dm.AQY0025.Append;
       for i:=1 to dm.AQY0025.FieldCount-1 do
        dm.AQY0025.Fields[i].Value:=dm.ADOQuery1.FieldValues[dm.AQY0025.Fields[i].FieldName];
       dm.AQY0025MANU_PART_NUMBER.Value := dm.AQY0025MANU_PART_NUMBER.Value+'.'+ads37part_name.Value;
       dm.AQY0025LAYERS.Value:=ads37LAYERS.Value;
       dm.AQY0025OPT_LOT_SIZE.Value:=ads37OPT_LOT_SIZE.Value;
       dm.AQY0025PARENT_PTR.Value:=dm.ADOQuery1.FieldValues['rkey'];
       dm.AQY0025CREATED_BY_EMPL_PTR.Value:=strtoint(user_ptr);
       dm.AQY0025CUSTPART_ENT_DATE.Value:=getsystem_date(dm.adoquery2,1);
       dm.AQY0025LAST_MODIFIED_DATE.Value:=getsystem_date(dm.adoquery2,1);
       dm.AQY0025LAST_MODIFIED_BY_PTR.Value:=strtoint(user_ptr);
       DM.AQY0025QTY_ON_HAND.VALUE:=0;
       dm.AQY0025.Post;
       with dm.ADOQuery2 do
        begin
         close;
         sql.Text:='update  data0025 '+
                   'set PARTS_NUM=isnull(PARTS_NUM,0)+1 '+
                   'where rkey='+inttostr(rkey);
         ExecSQL;
        end;

        new(rkey0025);
        rkey0025^:=dm.AQY0025RKEY.Value;
        node:=treeview1.Items.AddChildObject
        (node,dm.AQY0025MANU_PART_NUMBER.Value,rkey0025); //增加顶层节点
        node.ImageIndex:=node.Level;  //为第一层节点定义图画
        node:=node.Parent;
        { //在代码中需要加入标准工序流程38,494  }

        with dm.ADOQuery3 do
         begin
          close;
          sql.Text:=
          'SELECT SOURCE_PTR, DEPT_PTR, DEF_ROUT_INST, STEP_NUMBER,OUTP_SPFC '+#13+
          'FROM Data0038'+#13+
          'where source_ptr='+inttostr(dm.AQY0025RKEY.Value);
          open;
         end;
        dm.ads494.Close;                      //制程参数
        dm.ads494.Parameters[0].Value:=dm.AQY0025RKEY.Value;
        dm.ads494.Open;
        dm.ads494.Filter:='';
        with dm.ADOQuery2 do
         begin
           Close;
           SQL.Text:=' SELECT  STEP_NUMBER, DEPT_PTR, DEF_ROUT_INST '+
                      'FROM DATA0042 where part_name='+quotedstr(ads37part_name.Value)+
                      ' order by STEP_NUMBER';
           open;
         end;
        while not dm.ADOQuery2.Eof do
        begin
          dm.ADOQuery3.AppendRecord([dm.AQY0025RKEY.Value,
                                     dm.ADOQuery2.FieldByName('DEPT_PTR').AsInteger,
                                     dm.ADOQuery2.FieldByName('DEF_ROUT_INST').AsString,
                                     dm.ADOQuery2.FieldByName('STEP_NUMBER').AsInteger,
                                     1]);
         dm.ADOQuery4.Close;   //=不能改变adoquery4的语句
         dm.ADOQuery4.SQL.Text:=
          'SELECT TOP 100 PERCENT PARAMETER_PTR,TValue,Doc_Flag,after_flag,formula,'+#13+
          'flow_spfc_flag,SEQ_NO, outp_spfc_flag '+#13+
          'FROM dbo.Data0506'+#13+
          'WHERE TTYPE = 3 AND '+#13+
          'SOURCE_PTR = '+dm.ADOQuery2.FieldByName('DEPT_PTR').AsString+#13+
          'ORDER BY SEQ_NO';
         dm.ADOQuery4.Open;
          while not dm.ADOQuery4.Eof do
          begin
           dm.ads494.AppendRecord([dm.ADOQuery4.FieldValues['PARAMETER_PTR'],
                                   '',
                                   dm.AQY0025RKEY.Value,
                                   dm.ADOQuery2.FieldByName('STEP_NUMBER').AsInteger,
                                   dm.ADOQuery4.FieldValues['SEQ_NO'],
                                   dm.ADOQuery4.FieldValues['Doc_Flag'],
                                   dm.ADOQuery4.FieldValues['after_flag'],
                                   dm.ADOQuery4.FieldValues['flow_spfc_flag'],
                                   DM.ADOQuery4.FieldValues['outp_spfc_flag']
                                   ]);
           dm.ADOQuery4.Next;
          end;                  //=======不能改变adoquery4的语句
         dm.ADOQuery2.Next;
        end;
        dm.ads494.UpdateBatch();
        ads37.Next;
      end;
      dm.AQY0025.Close;
      dm.AQY0025.Parameters[0].Value:=rkey;  //打开顶层
      dm.AQY0025.Open;
      dm.ADOQuery1.Close;
    end;

   dm.ADOConnection1.CommitTrans;
   treeview1.FullExpand; //全部展开
   common.ShowMsg('标准子部件创建成功!',1);
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     screen.Cursor:=crdefault;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
 finally
  form_childpart.Free;
 end;
end;

procedure TForm2.DBEdit1Exit(Sender: TObject);
var
 node:ttreenode;   //treeview控件的节点变量
begin
 node:=treeview1.Selected;
 node.Text:=DBEdit1.Text;
end;

procedure TForm2.StringGrid2KeyPress(Sender: TObject; var Key: Char);
begin
if StringGrid2.Col in [10,11,12] then
 begin
  if not (key in ['0'..'9','.',#8,#13]) then abort;
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',StringGrid2.Cells[StringGrid2.col,StringGrid2.row]) > 0  then abort;
 end;
end;

procedure TForm2.load_xls_to_sgrid(fileName:String; grid:TStringGrid);
var //从Excel中读取数据到 Grid
  iCount, jCount: Integer;
  XLApp: variant;
  Sheet: Variant;
begin
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
   begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
   end;
  try
   XLApp := CreateOleObject('Excel.Application'); //创建OLE对象
  except
   Screen.Cursor := crDefault;
   Exit;
  end;
   try
     XLApp.workBooks.Open(fileName);
     Sheet := XLApp.Workbooks[1].WorkSheets[1];
     for iCount:=2 to 65535 do
      begin
       if trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]) = '' then
         break
       else
        begin
         grid.RowCount:=grid.RowCount+1;
        for jCount:=1 to grid.ColCount do
   //    grid.Cells[jCount-1,iCount-1]:=XLApp.workbooks[1].sheets[1].cells[iCount,jCount];
         grid.Cells[jCount-1,iCount-1]:=sheet.cells[iCount,jCount];
        end;
      end;
     XLApp.workbooks[1].close;
   finally
     XLApp.quit;
     Screen.Cursor := crDefault;
   end
end;

procedure TForm2.StringGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
IF (KEY=13) and (Stringgrid3.row<stringgrid3.RowCount-1) then
Stringgrid3.row:=Stringgrid3.row+1;
if (chr(key)='D') and (ssCtrl in shift) and (stringgrid3.Row>1) then
begin
stringgrid3.Cells[stringgrid3.col,stringgrid3.row]:=
stringgrid3.Cells[stringgrid3.col,stringgrid3.row-1];
end;
end;

procedure TForm2.ComboBox2Change(Sender: TObject);
begin
stringgrid3.Cells[1,stringgrid3.Row]:=combobox2.Text;
end;

procedure TForm2.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=112 then combobox2.DroppedDown:=true; //F1键出现下拉
if key=13 then stringgrid3.SetFocus;
end;

procedure TForm2.StringGrid3DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (gdSelected  in State) then
 begin
  if (ACol =1) then
   begin
    ComboBox2.Left := Rect.Left+1;
    ComboBox2.Top := Rect.Top+2;
    ComboBox2.Width := Rect.Right - Rect.Left+3;
    ComboBox2.Height := Rect.Bottom - Rect.Top;
    ComboBox2.Visible := True;
    if StringGrid3.Cells[acol,arow]<>'' then
     combobox2.ItemIndex:=combobox2.Items.IndexOf(StringGrid3.Cells[acol,arow])
    else
     combobox2.ItemIndex:=-1;
   end
  else
    ComboBox2.Visible :=false;
 end;


if (acol=0) and (ARow>0) and
   (ARow<>StringGrid3.RowCount-1) then
 StringGrid3.Canvas.TextRect(rect,rect.Left+2,rect.Top+2, inttostr(ARow));

end;

procedure TForm2.StringGrid3KeyPress(Sender: TObject; var Key: Char);
begin
if StringGrid3.Col in [2,3,4,5,6,7] then
 begin
  if not (key in ['0'..'9','.',#8,#13]) then abort;
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',StringGrid3.Cells[StringGrid3.col,StringGrid3.row]) > 0  then abort;
 end;
end;

procedure TForm2.StringGrid3SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
  var
  R:TRect;
begin
 IF ACOL=1 THEN
   stringgrid3.Options:=stringgrid3.Options-[goEditing]
 else
   stringgrid3.Options:=stringgrid3.Options+[goEditing];

   ComboBox2.Visible:=(ACol=1);

end;

procedure TForm2.StringGrid3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (stringgrid3.Row=stringgrid3.RowCount-1) and
   (trim(stringgrid3.Rows[stringgrid3.Row].Text)<>'') then
 begin
  stringgrid3.Cells[0,stringgrid3.Row]:=inttostr(stringgrid3.Row);
  stringgrid3.RowCount:=stringgrid3.RowCount+1;
  if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
 end;
end;

function TForm2.find_33null:boolean;
var i:integer;
begin
result:=true;
  if StringGrid3.RowCount>2 then
  begin
    for i:=1 to StringGrid3.RowCount-2 do
    begin
      if (trim(StringGrid3.Cells[2,i])='') or
         (trim(StringGrid3.Cells[3,i])='') or
         (trim(StringGrid3.Cells[4,i])='') or
         (trim(StringGrid3.Cells[5,i])='') or
         (trim(StringGrid3.Cells[6,i])='') then
      begin
        showmessage('压合靶矩表更新失败!有空值,请重新输入!');
        result:=false;
        break;
      end;
    end;
  end;
end;

procedure TForm2.MenuItem1Click(Sender: TObject);
var
  i:word;
begin
 for i:=stringgrid3.Row to stringgrid3.RowCount-2 do
  stringgrid3.Rows[i].Text:=stringgrid3.Rows[i+1].Text;
  stringgrid3.RowCount:=stringgrid3.RowCount-1;
if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
end;

procedure TForm2.MenuItem2Click(Sender: TObject);
var i:integer;
begin
if messagedlg('删除全部压合靶矩信息,原数据将丢失继续吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
  for i:=1 to stringgrid3.RowCount-2 do  stringgrid3.Rows[i].Clear;
   stringgrid3.RowCount:=2;
  if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
 end;
end;

procedure TForm2.MenuItem3Click(Sender: TObject);
var i:integer;
begin
 strow:=tstringlist.Create;
 strow.AddStrings(StringGrid3.Rows[stringgrid3.row]);
 for i:=2 to StringGrid3.ColCount-1 do
 begin
  StringGrid3.Cells[i,stringgrid3.row]:=StringGrid3.Cells[i,stringgrid3.row-1];
  StringGrid3.Cells[i,stringgrid3.row-1]:=strow.Strings[i];
 end;
 strow.Destroy;
 stringgrid3.row:=stringgrid3.row-1;
 if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
end;

procedure TForm2.MenuItem4Click(Sender: TObject);
var i:integer;
begin
 strow:=tstringlist.Create;
 strow.AddStrings(self.StringGrid3.Rows[stringgrid3.row]);
 for i:=2 to StringGrid3.ColCount-1 do
 begin
  StringGrid3.Cells[i,stringgrid3.row]:=StringGrid3.Cells[i,stringgrid3.row+1];
  StringGrid3.Cells[i,stringgrid3.row+1]:=strow.Strings[i];
 end;
 strow.Destroy;
 stringgrid3.row:=stringgrid3.row+1;
 if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
end;

procedure TForm2.PopupMenu13Popup(Sender: TObject);
begin
if stringgrid3.Row = stringgrid3.RowCount-1 then
 begin
  MenuItem1.Enabled:=false;
  MenuItem4.Enabled:=false;
 end
else
 begin
  MenuItem1.Enabled:=true;
  MenuItem4.Enabled:=true;
 end;
 if stringgrid3.Row=1 then
  MenuItem3.Enabled:=false
 else
  MenuItem3.Enabled:=true;
 MenuItem2.Enabled:=stringgrid3.RowCount>2;
end;

procedure TForm2.BitBtn27Click(Sender: TObject);
var
 i:integer;
begin
if stringgrid3.RowCount>2 then
begin
 for i:=1 to stringgrid3.RowCount-2 do
  stringgrid3.Cells[0,i]:=inttostr(i);
 Export_Grid_to_Excel(STRINGGRID3,DBtext3.Caption,true);
end;
end;

procedure TForm2.BitBtn28Click(Sender: TObject);
var
 i:integer;
begin
  OpenDialog1.DefaultExt :='*.XLS';
  OpenDialog1.Filter :='*.XLS|*.XLS';
  if OpenDialog1.Execute then
  if messagedlg('导入新的压合靶矩表,原数据将丢失继续吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
   begin
    for i:=1 to stringgrid3.RowCount-2 do  stringgrid3.Rows[i].Clear;
     stringgrid3.RowCount:=2;
    self.load_xls_to_sgrid(OpenDialog1.FileName,stringgrid3);
   end;
end;

procedure TForm2.Action1Execute(Sender: TObject);
begin
   if BitBtn11.Enabled = True then
    BitBtn11Click(Sender);
end;

procedure TForm2.Action2Execute(Sender: TObject);
begin
  if BitBtn1.Enabled = True then
    BitBtn1Click(Sender);
end;

procedure TForm2.Action3Execute(Sender: TObject);
begin
   MI1Click(Sender);
end;

procedure TForm2.lblUpdateNoteMouseEnter(Sender: TObject);
var
  LRect: TRect;
  Lpos: TPoint;
begin
  if FHintFrm = nil then FHintFrm := THintWindow.Create(Self);
  LRect := FHintFrm.CalcHintRect(200,UPDATESTR,nil);
  Lpos := Mouse.CursorPos; //Self.ClientToScreen(Point(btn1.Left+ btn1.Width,btn1.Top+ btn1.Height));
  LRect.Left := Lpos.X;
  LRect.Top := Lpos.Y;
  LRect.Right := LRect.Right + LRect.Left;
  LRect.Bottom := LRect.Bottom + LRect.Top;
  FHintFrm.ActivateHint(LRect,UPDATESTR);
end;

procedure TForm2.lblUpdateNoteMouseLeave(Sender: TObject);
begin
  FreeAndNil(FHintFrm);
end;

procedure TForm2.btnTBClick(Sender: TObject);
var
  L25RKey, LArr25RKey: string;
  LSql: string;
  I: Integer;
begin
  if MessageBox(Handle,'同步','确定要同步所有内层吗?',MB_YESNO) = IDNO then Exit;
  if TreeView1.Selected <> nil then
  begin
    if TreeView1.Selected.Level <> 0 then
    begin
      ShowMessage('请选择最外层然后同步');
      Exit;
    end;
    BitBtn11Click(BitBtn11);
    L25RKey := IntToStr(PInteger(TreeView1.Selected.Data)^);
    LSql := 'SELECT D1.RKey AS R1,D2.RKey AS R2,D3.Rkey AS R3,D4.RKey AS R4 FROM Data0025 D1 ' +
            'LEFT JOIN Data0025 D2 ON D1.Rkey = D2.PARENT_PTR ' +
            'LEFT JOIN Data0025 D3 ON D2.RKey = D3.PARENT_PTR ' +
            'LEFT JOIN Data0025 D4 ON D3.RKey = D4.PARENT_PTR ' +
            'WHERE D1.RKey = ' + L25RKey;
    if OpenQuery(DM.qryTmp,LSql) then
    begin
      DM.qryTmp.First;
      while not DM.qryTmp.Eof do
      begin
        for I := 1 to 4 do
        begin
          if not VarIsNull(DM.qryTmp.FieldByName('R'+IntToStr(I)).Value) then
            LArr25RKey := LArr25RKey + DM.qryTmp.FieldByName('R'+ IntToStr(I)).AsString + ',';
        end;
        DM.qryTmp.Next;
      end;
      LArr25RKey := '(' + LArr25RKey + '0)';
    end;
    LSql := 'UPDATE Data0025 SET pcs_lngth = ' + DBEdit15.Field.AsString +
      ' , pcs_width = ' + DBEdit16.Field.AsString +
      ' , set_lngth = ' + DBEdit17.Field.AsString +
      ' , set_width = ' + DBEdit18.Field.AsString +
      ' , spell_lngth = ' + DBEdit19.Field.AsString +
      ' , spell_width = ' + DBEdit20.Field.AsString +
      ' , pcs_sq = ' + DBEdit28.Field.AsString +
      ' , set_qty = ' + DBEdit21.Field.AsString +
      ' , spell_qty = ' + DBEdit22.Field.AsString +
      ' , unit_sq = ' + DBEdit26.Field.AsString +
      ' , spell_sq = ' + DBEdit27.Field.AsString +
      ' , SO_UNIT = ' + QuotedStr(DBComboBox2.Field.AsString) +
      ' WHERE RKey IN ' + LArr25RKey;
    try
      DM.ADOConnection1.BeginTrans;
      if ExecSql(DM.qryTmp, LSql) then
      begin
        DM.ADOConnection1.CommitTrans;
        ShowMessage('同步成功');
      end else
      begin
        DM.ADOConnection1.RollbackTrans;
        ShowMessage('同步失败');
        ShowMessage(LSql);
      end;
    except
      DM.ADOConnection1.RollbackTrans;
      ShowMessage('同步失败');
    end;
  end;
end;

procedure TForm2.mniYJDWClick(Sender: TObject);
var
  Lstr: string;
  tmp: Integer;
  tmpS,tmpFilter: string;

begin
  if (Length(Trim(StringGrid1.Cells[1,StringGrid1.Row])) <> 0) and
      (Length(Trim(StringGrid1.Cells[3,StringGrid1.Row])) <> 0) and
      (Length(Trim(StringGrid1.Cells[5,StringGrid1.Row])) <> 0)
  then
  begin
    if (Sender as TMenuItem).Name = 'mniYJDW' then
    begin
    Lstr := '压接定位孔孔径控制: ' + StringGrid1.Cells[1,StringGrid1.Row] + '=' +
      StringGrid1.Cells[3,StringGrid1.Row] + StringGrid1.Cells[5,StringGrid1.Row];
    end else
    if (Sender as TMenuItem).Name = 'mniYJCP' then
    begin
    Lstr := '压接成品孔孔径控制: ' + StringGrid1.Cells[1,StringGrid1.Row] + '=' +
      StringGrid1.Cells[3,StringGrid1.Row] + StringGrid1.Cells[5,StringGrid1.Row];
    end else
    begin
      ShowMessage('无效的事件');
      Exit;
    end;
    DM.ADS38.DisableControls;
    tmpFilter := DM.ADS38.Filter;
    tmp := DM.ADS38.RecNo;
    DM.ADS38.Filter := '';
    DM.ADS38.Filtered := False;
    DM.ADS38.First;
    try
      while not DM.ADS38.Eof do
      begin
        if DM.ADS38.FieldByName('PPC_CYCLE_TIME').AsInteger = 1 then
        begin
          DM.ADS38.Edit;
          DM.ADS38.FieldByName('DEF_ROUT_INST').AsString := DM.ADS38.FieldByName('DEF_ROUT_INST').AsString + '   ' + Lstr;
          tmps := tmps + #13 + ' 第 ' + dm.ADS38.fieldbyname('STEP_NUMBER').AsString + ' 步 ' + dm.ADS38.fieldbyname('dept_name').asstring + ' 加工指示中 ';
        end;
        DM.ADS38.Next;
      end;
      if tmps <> '' then
      begin
        tmps := tmps + #13 + #13 + ' 添加了： ' + LStr;
        ShowMessage(tmps);
      end;
    finally
      DM.ADS38.Filter := tmpFilter;
      DM.ADS38.Filtered := True;
      DM.ADS38.RecNo := tmp;
      DM.ADS38.EnableControls;
    end;
  end else
    ShowMessage('刀具不正确!');
end;

procedure TForm2.btnLoadCYImgClick(Sender: TObject);
var
  LJPEG: TJPEGImage;
begin
  if opdg1.Execute then
  begin
    if opdg1.FileName <> '' then
    begin
      LJPEG := TJPEGImage.Create;
      try
        try
          if LowerCase(ExtractFileExt(opdg1.FileName)) = '.bmp' then
          begin
            imgCY.Picture.LoadFromFile(opdg1.FileName);
          end;
          if (LowerCase(ExtractFileExt(opdg1.FileName)) = '.jpg') or (LowerCase(ExtractFileExt(opdg1.FileName)) = '.jpeg') then
          begin
            LJPEG.LoadFromFile(opdg1.FileName);
            imgCY.Picture.Bitmap.Assign(LJPEG);
          end;
        except
          ShowMessage('只能导入BMP或是JPEG格式的文件');
          Exit;
        end;
      finally
        LJPEG.Free;
      end;
    end;
  end;
end;

procedure TForm2.btnClearCYClick(Sender: TObject);
begin
  imgCY.Picture := nil;
end;

procedure TForm2.mniN45Click(Sender: TObject);
var
  total_a,total_b, I: Integer;
  tmpS: string;
begin
  for I := 0 to StringGrid1.RowCount - 1 do
  begin
    total_a := 0;
    total_b := 0;
    tmpS := '';
    if LowerCase(stringgrid1.Cells[7,I]) = 'total:' then
    begin
      if StrToIntDef(stringgrid1.Cells[9,I],-1) <> -1 then
      begin
        total_a := StrToIntDef(stringgrid1.Cells[9,I],-1);
      end;
      if StrToIntDef(stringgrid1.Cells[10,I],-1) <> -1 then
      begin
        total_b := StrToIntDef(stringgrid1.Cells[10,I],-1);
      end;
      if total_a <> 0 then
      begin
        tmpS := '单A板大约用时:' + FormatFloat('0.00',total_a/12000) + ';';
      end;
      if total_b <> 0 then
      begin
        tmpS := tmpS + '单B板大约用时:' + FormatFloat('0.00',total_b/12000);
      end;
      if tmpS <> '' then
      begin
        stringgrid1.Cells[11,I] := stringgrid1.Cells[11,I] + ';' + tmpS
      end;
    end;
  end;
end;

procedure TForm2.rg1Click(Sender: TObject);
begin
  imgCY.Stretch := rg1.ItemIndex = 1;
end;

procedure TForm2.btn1Click(Sender: TObject);
var
  LFrm: TfrmSameQry;
  APcsPerPnl,APcsPerSet: integer;

begin
  lfrm := TfrmSameQry.Create(Self);
  try
    lfrm.edt1.Text := DBEdit17.EditText;
    LFrm.edt2.Text := DBEdit18.EditText;
    APcsPerPnl := 0;
    APcsPerSet := 0;
    DM.ads279.First;
    while not DM.ads279.Eof do
    begin
      if Trim(dm.ads279.FieldByName('spec_rkey').AsString) = '3' then
      begin
        APcsPerPnl := StrToIntDef(dm.ads279.FieldByName('PARAMETER_VALUE').AsString,0);
      end else
      if Trim(dm.ads279.FieldByName('spec_rkey').AsString) = 'JN' then
        APcsPerSet := StrToIntDef(dm.ads279.FieldByName('PARAMETER_VALUE').AsString,0);
      dm.ads279.Next;
    end;
    if APcsPerSet = 0 then APcsPerSet := 1;
    LFrm.edt3.Text := IntToStr(APcsPerPnl div APcsPerSet);

    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

procedure TForm2.btn5Click(Sender: TObject);
var
  LIni: TIniFile;
  LIniFileName: string;
begin
  pnl8.Visible := True;
  pnl8.BringToFront;
  LIniFileName := ExtractFilePath(ParamStr(0)) + 'pinban.ini';
  LIni := TIniFile.Create(LIniFileName);
  try
    edtftpip.Text := LIni.ReadString('CustFileFTP','IP',edtftpip.Text);
    edtftpusername.Text := LIni.ReadString('CustFileFTP','UserName',edtftpusername.Text);
    edtftppassword.Text := LIni.ReadString('CustFileFTP','PassWord',edtftppassword.Text);
    edtftpdir.Text := LIni.ReadString('CustFileFTP','Dir',edtftpdir.Text);
  finally
    LIni.Free;
  end;
end;

procedure TForm2.btn6Click(Sender: TObject);
var
  LIni: TIniFile;
  LIniFileName: string;
begin
  LIniFileName := ExtractFilePath(ParamStr(0)) + 'pinban.ini';
  LIni := TIniFile.Create(LIniFileName);
  try
    LIni.WriteString('CustFileFTP','IP',edtftpip.Text);
    LIni.WriteString('CustFileFTP','UserName',edtftpusername.Text);
    LIni.WriteString('CustFileFTP','PassWord',edtftppassword.Text);
    LIni.WriteString('CustFileFTP','Dir',edtftpdir.Text);
  finally
    LIni.Free;
  end;
  pnl8.Visible := False;
end;

procedure TForm2.btn4Click(Sender: TObject);
var
  LIni: TIniFile;
  LIniFileName: string;
  LDir: string;
begin
  if Trim(dbtxtCustFileName.Caption) = '' then
  begin
    ShowMessage('还没有上传文件');
    Exit;
  end;
  if idftp1.Connected then IdFTP1.Disconnect;
  LIniFileName := ExtractFilePath(ParamStr(0)) + 'pinban.ini';
  LIni := TIniFile.Create(LIniFileName);
  try
    IdFTP1.Host := LIni.ReadString('CustFileFTP','IP',edtftpip.Text);
    IdFTP1.Username := LIni.ReadString('CustFileFTP','UserName',edtftpusername.Text);
    IdFTP1.Password := LIni.ReadString('CustFileFTP','PassWord',edtftppassword.Text);
    LDir := ExtractFilePath(dbtxtCustFileName.Caption); //LIni.ReadString('CustFileFTP','Dir',edtftpdir.Text);
    try
      IdFTP1.Connect();
      if IdFTP1.Connected then
      begin
        if Trim(LDir) <> '' then IdFTP1.ChangeDir(LDir);
        dlgSave1.FileName := ExtractFileName(dbtxtCustFileName.Caption);
        if dlgSave1.Execute then
        begin
          IdFTP1.Get(ExtractFileName(dbtxtCustFileName.Caption),dlgSave1.FileName,True);
        end;
      end;
    except
      ShowMessage('FTP链接失败,下载失败');
      Exit;
    end;
  finally
    if IdFTP1.Connected then IdFTP1.Disconnect;
    LIni.Free;
  end;
end;


procedure TForm2.cbbgradeExit(Sender: TObject);
begin
  if (cbbgrade.Text = '无等级') and (DM.AQY0025.FieldByName('grade_code').AsString = '') then Exit;
  if DM.AQY0025.FieldByName('grade_code').AsString = cbbgrade.Text then Exit;
  if cbbgrade.Text <> '无等级' then
  begin
    if cbbgrade.Items.IndexOf(cbbgrade.Text) = -1 then
    begin
      ShowMessage('没有找到对应的等级');
      cbbgrade.Text := cbbgrade.Items[cbbgrade.ItemIndex];
      Exit;
    end;
  end;
  if trim(DM.AQY0025.fieldbyname('rkey').AsString) <> '' then
  begin
    if MessageBox(Application.Handle,'更改等级标示将会使制成参数向等级标准同步，是否更改？','提示',MB_YESNO) = IDYES then
    begin
      dm.AQY0025.Edit;
      if cbbgrade.Items[cbbgrade.ItemIndex] = '无等级' then
        DM.AQY0025.FieldByName('grade_code').Value := null
      else
        DM.AQY0025.FieldByName('grade_code').AsString := cbbgrade.Items[cbbgrade.ItemIndex];

      if cbbgrade.Items[cbbgrade.ItemIndex] = '无等级' then
        dm.SetGrade_Code(dm.AQY0025.fieldbyname('rkey').AsString,'')
      else
        dm.SetGrade_Code(dm.AQY0025.fieldbyname('rkey').AsString,cbbgrade.Items[cbbgrade.ItemIndex]);
    end else
    begin
      cbbgrade.ItemIndex := cbbgrade.Items.IndexOf(DM.AQY0025.FieldByName('grade_code').AsString);
      Abort;
    end;
  end;
end;

procedure TForm2.cbbgradeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Perform(WM_NEXTDLGCTL,0,0);
end;

procedure TForm2.btnToolClick(Sender: TObject);
begin
  pmTool.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure TForm2.N45Click(Sender: TObject);
var
  LFrm: TfrmFindStepParam;
begin
  dm.ads494.Filtered := False;
  lfrm := TfrmFindStepParam.Create(Self);
  try
    LFrm.ShowModal;
  finally
    LFrm.free;
    dm.ads494.Filter := '';
    DM.ADS38AfterScroll(DM.ADS38);
  end;
end;

procedure TForm2.cbb1Change(Sender: TObject);
begin
   stringgrid1.Cells[11,stringgrid1.Row]:=cbb1.Text;//传值给StringGrid
end;

procedure TForm2.cbb1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key=112 then cbb1.DroppedDown:=true; //F1键出现下拉
  if key=13 then stringgrid1.SetFocus;
end;

procedure TForm2.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
    if (gdSelected  in State) then
 begin
  if (ACol = 11 ) then
   begin
    cbb1.Left := Rect.Left+1;
    cbb1.Top := Rect.Top+60;
    cbb1.Width := Rect.Right - Rect.Left+3;
    cbb1.Height := Rect.Bottom - Rect.Top;
    cbb1.Visible := True;
    if StringGrid1.Cells[acol,arow]<>'' then
     cbb1.ItemIndex:=cbb1.Items.IndexOf(StringGrid1.Cells[acol,arow])
    else
     cbb1.ItemIndex:=-1;
   end
  else
    cbb1.Visible :=false;
 end;


if (acol=0) and (ARow>0) and
   (ARow<>StringGrid1.RowCount-1) then
 StringGrid1.Canvas.TextRect(rect,rect.Left+2,rect.Top+2, inttostr(ARow));
end;

procedure TForm2.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  { if (stringgrid1.Row=stringgrid1.RowCount-1) and
   (trim(stringgrid1.Rows[stringgrid1.Row].Text)<>'') then
 begin
  stringgrid1.Cells[0,stringgrid1.Row]:=inttostr(stringgrid1.Row);
  stringgrid1.RowCount:=stringgrid1.RowCount+1;
  if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
 end;  }
end;

procedure TForm2.N47Click(Sender: TObject);
var
      i,frow:integer;
begin
        frow:=StringGrid1.row;//记录当前选定行的位置
        StringGrid1.rowcount:=StringGrid1.rowcount+1;
        for   i:=StringGrid1.rowcount   downto   frow+1   do
        StringGrid1.Rows[i]:=StringGrid1.Rows[i-1];
        StringGrid1.Rows[frow+1].Clear;
        StringGrid1.col:=0;
        StringGrid1.Row:=frow;
        StringGrid1.SetFocus;

end;



procedure TForm2.N48Click(Sender: TObject);
var
i_row,j_col:integer;
begin
 stringgrid1.Rows[stringgrid1.row].Clear;
 for j_col:=0 to stringgrid1.colcount do
  for i_row:=stringgrid1.Row to stringgrid1.rowcount-1 do
  stringgrid1.cells[j_col,i_row]:=stringgrid1.cells[j_col,i_row+1];
  stringgrid1.RowCount:=stringgrid1.RowCount-1;
  stringgrid1.Refresh;
end;

procedure TForm2.btn7Click(Sender: TObject);
begin
   try
        inputform.OpenDialog1.Filter:='钻带文件(*.t*;*.d*)|*.t*;*.d*';
        inputform.OpenDialog1.Tag:=0;
        inputform.N2.Visible:=False;
         inputform.N8.Visible:=False;
        inputform.N7.Visible:=True;
        if inputform.OpenDialog1.Execute then
            inputform.ShowModal;
     finally
        inputform.Visible:=False;
     end;
end;

procedure TForm2.btn9Click(Sender: TObject);
begin
     try
        inputform.OpenDialog1.Filter:='钻带文件(*.t*;*.d*)|*.t*;*.d*';
        inputform.OpenDialog1.Tag:=0;
        inputform.N2.Visible:=False;
         inputform.N8.Visible:=True;
        inputform.N7.Visible:=False;
        if inputform.OpenDialog1.Execute then
            inputform.ShowModal;
     finally
        inputform.Visible:=False;
     end;
end;

procedure TForm2.btn11Click(Sender: TObject);
begin
   edit2.Text:=formatfloat('0.00',(get_mindrill2()));
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
   Edit17.Text:=formatfloat('0.00',(get_mindrill3()));
end;

procedure TForm2.btn12Click(Sender: TObject);
var
 i,total_a,total_b,total_set:integer;
begin
 total_a := 0;
 total_b := 0;
 total_set := 0;
 if pos('TOTAL',UpperCase(strngrd1.Cells[7,strngrd1.RowCount-2]))>0 then
 if messagedlg('孔数已经汇总是否继续?',mtconfirmation,[mbyes,mbno],0)=mrno then
  exit;

 try
 for i:=1 to strngrd1.RowCount-2 do
  begin
   if trim(strngrd1.Cells[8,i])<>'' then
   total_set := total_set+strtoint(strngrd1.Cells[8,i]);

   if trim(strngrd1.Cells[9,i])<>'' then
   total_a := total_a+strtoint(strngrd1.Cells[9,i]);
   if trim(strngrd1.Cells[10,i])<>'' then
   total_b := total_b+strtoint(strngrd1.Cells[10,i]);
  end;
 except
  messagedlg('PNL孔数输入有误,汇总停止!',mterror,[mbcancel],0);
  exit;
 end;

 strngrd1.Cells[7,strngrd1.RowCount-1]:='Total:';
 if total_set>0 then
 strngrd1.Cells[8,strngrd1.RowCount-1]:=inttostr(total_set);
  if total_a>0 then
 begin
   strngrd1.Cells[9,strngrd1.RowCount-1]:=inttostr(total_a);
  //stringgrid1.Cells[11,stringgrid1.RowCount-1] := '单A板大约用时:' + FormatFloat('0.00',total_a/12000);
 end;  
if total_b>0 then
 begin
  strngrd1.Cells[10,strngrd1.RowCount-1]:=inttostr(total_b);
 // strngrd1.Cells[11,strngrd1.RowCount-1] := strngrd1.Cells[11,strngrd1.RowCount-1] + ';' +'单B板大约用时:' + FormatFloat('0.00',total_b/12000);
  end;

strngrd1.RowCount:=strngrd1.RowCount+1;
if not bitbtn11.Enabled then bitbtn11.Enabled:=true;

end;

procedure TForm2.BitBtn26Click(Sender: TObject);
var
 i,total_a,total_b,total_set:integer;
begin
 total_a := 0;
 total_b := 0;
 total_set := 0;
 if pos('TOTAL',UpperCase(strngrd2.Cells[7,strngrd2.RowCount-2]))>0 then
 if messagedlg('孔数已经汇总是否继续?',mtconfirmation,[mbyes,mbno],0)=mrno then
  exit;

 try
 for i:=1 to strngrd2.RowCount-2 do
  begin
   if trim(strngrd2.Cells[8,i])<>'' then
   total_set := total_set+strtoint(strngrd2.Cells[8,i]);

   if trim(strngrd2.Cells[9,i])<>'' then
   total_a := total_a+strtoint(strngrd2.Cells[9,i]);
   if trim(strngrd2.Cells[10,i])<>'' then
   total_b := total_b+strtoint(strngrd2.Cells[10,i]);
  end;
 except
  messagedlg('PNL孔数输入有误,汇总停止!',mterror,[mbcancel],0);
  exit;
 end;

 strngrd2.Cells[7,strngrd2.RowCount-1]:='Total:';
 if total_set>0 then
 strngrd2.Cells[8,strngrd2.RowCount-1]:=inttostr(total_set);
  if total_a>0 then
 begin
  strngrd2.Cells[9,strngrd2.RowCount-1]:=inttostr(total_a);
 // stringgrid1.Cells[11,stringgrid1.RowCount-1] := '单A板大约用时:' + FormatFloat('0.00',total_a/12000);
 end;
 if total_b>0 then
 begin
  strngrd2.Cells[10,strngrd2.RowCount-1]:=inttostr(total_b);
//strngrd2.Cells[11,strngrd2.RowCount-1] := strngrd2.Cells[11,strngrd2.RowCount-1] + ';' +'单B板大约用时:' + FormatFloat('0.00',total_b/12000);
 end;

strngrd2.RowCount:=strngrd2.RowCount+1;
if not bitbtn11.Enabled then bitbtn11.Enabled:=true;


end;

procedure TForm2.btn8Click(Sender: TObject);
begin
   if strngrd1.RowCount>2 then
 Export_Grid_to_Excel(strngrd1,DBtext3.Caption,true);
end;

procedure TForm2.btn10Click(Sender: TObject);
begin
     if strngrd2.RowCount>2 then
 Export_Grid_to_Excel(strngrd2,DBtext3.Caption,true);
end;

procedure TForm2.FormShow(Sender: TObject);
var
  LCustomPtr: Integer;

begin


end;

procedure TForm2.dbedtvcut_BKeyPress(Sender: TObject; var Key: Char);
begin
 if Key =#13 then
 dbedtvcut_T.SetFocus;
end;

procedure TForm2.dbedtvcut_TKeyPress(Sender: TObject; var Key: Char);
begin
   if Key =#13 then
 dbedtvcut_X.SetFocus;
end;

procedure TForm2.dbedtvcut_XKeyPress(Sender: TObject; var Key: Char);
begin
    if Key =#13 then
    dbedtgf_A.SetFocus;
end;

procedure TForm2.dbedtgf_TKeyPress(Sender: TObject; var Key: Char);
begin
        if Key =#13 then
    dbedtgf_L.SetFocus;
end;

procedure TForm2.dbedtgf_AKeyPress(Sender: TObject; var Key: Char);
begin
       if Key =#13 then
       dbedtgf_T.SetFocus;
end;

procedure TForm2.N49Click(Sender: TObject);
var
      i,frow:integer;
begin
        frow:=strngrd1.row;//记录当前选定行的位置
        strngrd1.rowcount:=strngrd1.rowcount+1;
        for   i:=strngrd1.rowcount   downto   frow+1   do
       strngrd1.Rows[i]:=strngrd1.Rows[i-1];
        strngrd1.Rows[frow+1].Clear;
        strngrd1.col:=0;
       strngrd1.Row:=frow;
        strngrd1.SetFocus;

end;

procedure TForm2.N51Click(Sender: TObject);
var
      i,frow:integer;
begin
        frow:=strngrd2.row;//记录当前选定行的位置
        strngrd2.rowcount:=strngrd2.rowcount+1;
        for   i:=strngrd2.rowcount   downto   frow+1   do
       strngrd2.Rows[i]:=strngrd2.Rows[i-1];
        strngrd2.Rows[frow+1].Clear;
        strngrd2.col:=0;
       strngrd2.Row:=frow;
        strngrd2.SetFocus;

end;



procedure TForm2.N53Click(Sender: TObject);
var
i_row,j_col:integer;
begin
 strngrd1.Rows[strngrd1.row].Clear;
 for j_col:=0 to strngrd1.colcount do
  for i_row:=strngrd1.Row to strngrd1.rowcount-1 do
  strngrd1.cells[j_col,i_row]:=strngrd1.cells[j_col,i_row+1];
  strngrd1.RowCount:=strngrd1.RowCount-1;
  strngrd1.Refresh;

end;

procedure TForm2.N52Click(Sender: TObject);
var
i_row,j_col:integer;
begin
 strngrd2.Rows[strngrd2.row].Clear;
 for j_col:=0 to strngrd2.colcount do
  for i_row:=strngrd2.Row to strngrd2.rowcount-1 do
  strngrd2.cells[j_col,i_row]:=strngrd2.cells[j_col,i_row+1];
  strngrd2.RowCount:=strngrd2.RowCount-1;
  strngrd2.Refresh;
end;


end.


