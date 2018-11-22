unit pcb_cutting;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ADODB, StdCtrls, Buttons, DBTables, Menus, ExtCtrls, ComCtrls,
  DBCtrls, Mask, Grids, DBGrids, Spin,shellapi,printers, Variants,
  ShellCtrls,jpeg,
  PNL_Aarray_Rectangle_TwoPNL_Unit1,
  PNL_Aarray_Rectangle_OnePNL_Unit1;

type
  TDrawingTool = (dtLine, dtRectangle, dtEllipse, dtRoundRect,dtText,dtDraw,dtdraw2);
  TFrmPCBCut = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Save1: TMenuItem;
    Saveas1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    StatusBar1: TStatusBar;
    ProgressBar1: TProgressBar;
    Panel4: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    TabSheet3: TTabSheet;
    Panel6: TPanel;
    TrackBar5: TTrackBar;
    TrackBar6: TTrackBar;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label17: TLabel;
    Label22: TLabel;
    ControlBar1: TControlBar;
    Edit1: TEdit;
    Edit3: TEdit;
    ComboBox3: TComboBox;
    ComboBox5: TComboBox;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    ControlBar3: TControlBar;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    ComboBox11: TComboBox;
    ComboBox13: TComboBox;
    RadioGroup5: TRadioGroup;
    CheckBox1: TCheckBox;
    SpinEdit1: TSpinEdit;
    ControlBar2: TControlBar;
    CheckBox3: TCheckBox;
    TabSheet6: TTabSheet;
    CheckBox2: TCheckBox;
    StringGrid1: TStringGrid;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Image5: TImage;
    Image4: TImage;
    Label3: TLabel;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label27: TLabel;
    Label39: TLabel;
    Edit4: TEdit;
    Label41: TLabel;
    Label42: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox4: TComboBox;
    ComboBox10: TComboBox;
    Label43: TLabel;
    Panel7: TPanel;
    RectangleButton: TSpeedButton;
    LineButton: TSpeedButton;
    Label31: TLabel;
    PenSize: TEdit;
    PenWidth: TUpDown;
    SpeedButton7: TSpeedButton;
    Panel8: TPanel;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    GroupBox5: TGroupBox;
    GroupBox1: TGroupBox;
    Label46: TLabel;
    Label47: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    GroupBox4: TGroupBox;
    Label48: TLabel;
    Label49: TLabel;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    SpinEdit5: TSpinEdit;
    BitBtn1: TBitBtn;
    ControlBar4: TControlBar;
    Label50: TLabel;
    Edit9: TEdit;
    N4: TMenuItem;
    ExportIn1: TMenuItem;
    ExportOut1: TMenuItem;
    Sheet1: TMenuItem;
    PanelA1: TMenuItem;
    Panel11: TMenuItem;
    Sheet2: TMenuItem;
    Panel12: TMenuItem;
    Panel21: TMenuItem;
    SpeedButton8: TSpeedButton;
    TabSheet7: TTabSheet;
    Label53: TLabel;
    Edit10: TEdit;
    DBGrid1: TDBGrid;
    ADOQuery7: TADOQuery;
    DataSource4: TDataSource;
    Panel3: TPanel;
    TrackBar3: TTrackBar;
    TrackBar4: TTrackBar;
    SpeedButton21: TSpeedButton;
    Image10: TImage;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    ADOQuery9: TADOQuery;
    Panel5: TPanel;
    Label44: TLabel;
    Label40: TLabel;
    Edit2: TEdit;
    Fontsize: TEdit;
    UpDown3: TUpDown;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    Edit11: TEdit;
    Label59: TLabel;
    Label60: TLabel;
    TabSheet8: TTabSheet;
    Label61: TLabel;
    Label63: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Button6: TButton;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit39: TEdit;
    Edit44: TEdit;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Label73: TLabel;
    Label62: TLabel;
    Label64: TLabel;
    Edit14: TEdit;
    Edit38: TEdit;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Image8: TImage;
    Image1: TImage;
    Image2: TImage;
    Image14: TImage;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    A1: TMenuItem;
    B1: TMenuItem;
    PrintDialog1: TPrintDialog;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    SpeedButton14: TSpeedButton;
    rkey: TLabel;
    SpeedButton2: TSpeedButton;
    Label45: TLabel;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    Image3: TImage;
    Label51: TLabel;
    Label52: TLabel;
    Image9: TImage;
    Image16: TImage;
    Image17: TImage;
    Label58: TLabel;
    ttype: TLabel;
    ADOQuery7inv_part_number: TStringField;
    ADOQuery7inv_part_description: TStringField;
    ADOQuery7unit_code: TStringField;
    ADOQuery7quan_on_hand: TBCDField;
    ADOQuery7abbr_name: TStringField;
    ADOQuery7ship_DATE: TDateTimeField;
    ADOQuery9cut_unit_tp: TWordField;
    ADOQuery9cut_l1_max: TBCDField;
    ADOQuery9cut_l1_min: TBCDField;
    ADOQuery9cut_w1_max: TBCDField;
    ADOQuery9cut_w1_min: TBCDField;
    ADOQuery9cut_l2_max: TBCDField;
    ADOQuery9cut_l2_min: TBCDField;
    ADOQuery9cut_w2_max: TBCDField;
    ADOQuery9cut_w2_min: TBCDField;
    ADOQuery9SPACE_L_Min: TBCDField;
    ADOQuery9SPACE_w_Min: TBCDField;
    ADOQuery9border_l_min: TBCDField;
    ADOQuery9border_w_min: TBCDField;
    Label23: TLabel;
    Image7: TImage;
    Image6: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LineButtonClick(Sender: TObject);
    procedure RectangleButtonClick(Sender: TObject);
    procedure PenSizeChange(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Saveas1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ComboBox6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CheckBox2Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure FontsizeChange(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Sheet1Click(Sender: TObject);
    procedure PanelA1Click(Sender: TObject);
    procedure Panel11Click(Sender: TObject);
    procedure Sheet2Click(Sender: TObject);
    procedure Panel12Click(Sender: TObject);
    procedure Panel21Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Exit(Sender: TObject);
    procedure ComboBox2Exit(Sender: TObject);
    procedure ComboBox4Exit(Sender: TObject);
    procedure ComboBox10Exit(Sender: TObject);
    procedure Edit10Change(Sender: TObject);
    procedure PageControl1Enter(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure SpeedButton28Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Edit39KeyPress(Sender: TObject; var Key: Char);
    procedure N7Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure B1Click(Sender: TObject);
    procedure Edit15KeyPress(Sender: TObject; var Key: Char);
  private
    Tem_tresult_makeup_using_Sheet_TwoPNL_1:ARRAY[0..20] OF tresult_makeup_using_Sheet_TwoPNL_1; //存放计算后的结果值
    Tem_Result_makeup_using_Sheet_OnePNL_t1,Tem_Result_makeup_using_Sheet_OnePNL_t2:ARRAY[0..20] OF tresult_makeup_using_Sheet_OnePNL_1;
    procedure DrawingNew(i:integer);
    procedure DrawingNew0(i:integer);
    function Echange_Tem_tresult_makeup_using_Sheet_TwoPNL_1(const Pal,Paw,Pbl,Pbw:currency;var value1:tresult_makeup_using_Sheet_TwoPNL_1):boolean;
    function Echange_Tem_tresult_makeup_using_Sheet_OnePNL_1(const Pal,Paw: currency;var value1: tresult_makeup_using_Sheet_OnePNL_1): boolean; //用于处理尺寸变换
    procedure DrawOnePnl();
    procedure DrawTwoPnl();
    procedure Print_Image(V_Image: timage;Image_name: string; valuex, valuey: integer);
      { Private declarations }
  public
    { Public declarations }
    BrushStyle: TBrushStyle;
    PenStyle: TPenStyle;
    PenWide: Integer;
    Drawing: Boolean;
    Origin, MovePt: TPoint;
    DrawingTool: TDrawingTool;
    CurrentFile: string;
    procedure DrawShape(Vimage:TImage;TopLeft, BottomRight: TPoint; AMode: TPenMode);
    procedure DrawText(Vimage:TImage;Vx,Vy: Integer; vstr: String);
    procedure DrawShape1(Vimage:TImage;TopLeft, BottomRight: TPoint; AMode: TPenMode);
    procedure CutDesign();
    procedure inproc0(VVtimes:integer;VVScp,vlen,vwth,len,wth,vusage:Real);
    procedure pnl_size_old(vvlen,vvwth:real);
    procedure CutDesign1();
    procedure inproc1(VVtimes:integer;VVScp,vlen,vwth,len,wth,vusage:Real);
    procedure pnl_size1(vvlen,vvwth:real);
    procedure appeblan(vvscp,vlen,vwth:Real;vtimes:integer);
    procedure appeblan1(vvscp,vlen,vwth:Real;vtimes:integer);
    procedure PCBDrawing();
    procedure CutDrawing();
    procedure inCutDrawing(pnls:integer;wlen,wwth:Real;plen,pwth,vmin,vmax:Real);
    procedure inCutDrawing2(pnls:integer;wlen,wwth:Real;plen,pwth,vmin,vmax:Real);
    procedure inPnlDrawing();
    procedure inPnlDrawing2();
    Procedure DrawRotatedText(TheCanvas : TCanvas; txt_x,txt_y:Integer;TheAngle : Integer; TheText : String);
  end;
var
  FrmPCBCut: TFrmPCBCut;
  fDrag: Boolean;
  scal_x,scal_y:Real;
  num,num2: Array of integer;
  vxy:Array [0..9] of Array [0..9] of Array [0..1] of integer;
  vxy_x,vxy_y:integer;
	v,v2: Array of string;
  minvscp,minvscp1,vscp:currency;
  vx,vy,vPanels,vPanels1:integer;
  Ulen,Uwth,Slen,Swth:real;
  WImage:Timage;
  vPosition:integer;
  vStep:integer;
  vtime:tdatetime;
  vimag1,vimag2,vimag8:integer;

  Unit_L:real;
  Unit_W:real;
  Sheet_L:real;
  Sheet_W:real;
  Unit_Space_S_Min:real;
  Unit_Space_L_Min:real;
  Panel_1_Max:real;
  Panel_1_Min:real;
  Panel_2_Max:real;
  Panel_2_Min:real;
  Panel2_1_Max:real;
  Panel2_1_Min:real;
  Panel2_2_Max:real;
  Panel2_2_Min:real;
  Panel_Border_L_Max:real;
  Panel_Border_L_Min:real;
  Panel_Border_S_Max:real;
  Panel_Border_S_Min:real;
  Real_Max_Unit_L,Real_Min_Unit_L:Real;
	vsch1,vsch2:Real;
  vnum,vschnum1,vschnum2,vschnum3,vschnum4:integer;
  function Min(A,B: Double): Double;
  function Max(A,B: Double): Double;

implementation
uses  damo,common,
      Draw_Picture_Unit;
{$R *.DFM}

function TFrmPCBCut.Echange_Tem_tresult_makeup_using_Sheet_OnePNL_1(const Pal,Paw:currency;var value1:tresult_makeup_using_Sheet_OnePNL_1):boolean;
var     //用于处理尺寸变换
  temtopal,temtopbl,temtopaw,temtopbw,  //用于记录临时单元到边距离
  tempal2,tempbl2,tempaw2,tempbw2, //用于记录二区临时PNL长与宽
  tempal3,tempbl3,tempaw3,tempbw3  //用于记录三区临时PNL长与宽
  :currency;
  temwhether,temwhether1:boolean;
begin
  //用于处理临时的一二三区PNL长宽与PNLA,PNLB的边宽距离
  if (Pal<>value1.PNLA_Long) or (Paw<>value1.PNLA_Width )  then
  begin
      Result:=false;
      temtopal:=(pal-value1.PNLA_Unit_Long*value1.PNLA_Unit_Long_Number-value1.PNLA_Unit_Long_Space*(value1.PNLA_Unit_Long_Number-1))/2;
      temtopaw:=(paw-value1.PNLA_Unit_Width*value1.PNLA_Unit_Width_Number-value1.PNLA_Unit_Width_Space*(value1.PNLA_Unit_Width_Number-1))/2;

    //  if value1.Two_Section_Array_type=1  then//二区第一种排法
    //  begin //大料长为一区长加加二区PNLA长与一区长加二区PNLB长
         tempal2:=0;
         tempbl2:=0;
         tempal3:=0;
         tempbl3:=0;
         tempaw2:=0;
         tempbw2:=0;
         tempaw3:=0;
         tempbw3:=0;
         if (value1.PNLA_Long=value1.Two_Section_LongA)
           and (value1.PNLA_Width=value1.Two_Section_WidthA) then
         begin  //二区的PNLA长宽与一区的长宽相等
            tempal2:=pal;
            tempaw2:=paw;
         end;
         if (value1.PNLA_Long=value1.Two_Section_WidthA)
           and (value1.PNLA_Width=value1.Two_Section_LongA) then
         begin  //二区的PNLA宽长与一区的长宽相等
            tempal2:=paw;
            tempaw2:=pal;
         end;
         {
         if (value1.PNLb_Long=value1.Two_Section_LongA)
           and (value1.PNLb_Width=value1.Two_Section_WidthA) then
         begin  //二区的PNLB长宽与一区的长宽相等
            tempal2:=pbl;
            tempaw2:=pbw;
         end;
         if (value1.PNLb_Long=value1.Two_Section_WidthA)
           and (value1.PNLb_Width=value1.Two_Section_LongA) then
         begin  //二区的PNLB宽长与一区的长宽相等
            tempal2:=pbw;
            tempaw2:=pbl;
         end;}
         //
         if (value1.PNLA_Long=value1.Two_Section_Longb)
           and (value1.PNLA_Width=value1.Two_Section_Widthb) then
         begin  //二区的PNLB长宽与一区的长宽相等
            tempbl2:=pal;
            tempbw2:=paw;
         end;
         if (value1.PNLA_Long=value1.Two_Section_Widthb)
           and (value1.PNLA_Width=value1.Two_Section_Longb) then
         begin  //二区的PNLB宽长与一区的长宽相等
            tempbl2:=paw;
            tempbw2:=pal;
         end;
         {
         if (value1.PNLb_Long=value1.Two_Section_Longb)
           and (value1.PNLb_Width=value1.Two_Section_Widthb) then
         begin  //二区的PNLB长宽与一区的长宽相等
            tempbl2:=pbl;
            tempbw2:=pbw;
         end;
         if (value1.PNLb_Long=value1.Two_Section_Widthb)
           and (value1.PNLb_Width=value1.Two_Section_Longb) then
         begin  //二区的PNLB宽长与一区的长宽相等
            tempbl2:=pbw;
            tempbw2:=pbl;
         end;}
            //三区PNLA
            if (value1.PNLA_Long=value1.three_Section_LongA)
              and (value1.PNLA_Width=value1.three_Section_WidthA) then
            begin  //三区的PNLA长宽与一区的长宽相等
              tempal3:=pal;
              tempaw3:=paw;
            end;
            if (value1.PNLA_Long=value1.three_Section_WidthA)
              and (value1.PNLA_Width=value1.three_Section_LongA) then
            begin  //三区的PNLA宽长与一区的长宽相等
              tempal3:=paw;
              tempaw3:=pal;
            end;
            {
            if (value1.PNLb_Long=value1.three_Section_LongA)
             and (value1.PNLb_Width=value1.three_Section_WidthA) then
            begin  //三区的PNLB长宽与一区的长宽相等
              tempal3:=pbl;
              tempaw3:=pbw;
            end;
            if (value1.PNLb_Long=value1.three_Section_WidthA)
             and (value1.PNLb_Width=value1.three_Section_LongA) then
            begin  //三区的PNLB宽长与一区的长宽相等
              tempal3:=pbw;
              tempaw3:=pbl;
            end; }
           //
            if (value1.PNLA_Long=value1.three_Section_Longb)
             and (value1.PNLA_Width=value1.three_Section_Widthb) then
            begin  //三区的PNLB长宽与一区的长宽相等
              tempbl3:=pal;
              tempbw3:=paw;
            end;
            if (value1.PNLA_Long=value1.three_Section_Widthb)
              and (value1.PNLA_Width=value1.three_Section_Longb) then
            begin  //三区的PNLB宽长与一区的长宽相等
              tempbl3:=paw;
              tempbw3:=pal;
            end;
            {
            if (value1.PNLb_Long=value1.three_Section_Longb)
             and (value1.PNLb_Width=value1.three_Section_Widthb) then
            begin  //三区的PNLB长宽与一区的长宽相等
              tempbl3:=pbl;
              tempbw3:=pbw;
            end;
            if (value1.PNLb_Long=value1.three_Section_Widthb)
             and (value1.PNLb_Width=value1.three_Section_Longb) then
            begin  //三区的PNLB宽长与一区的长宽相等
              tempbl3:=pbw;
              tempbw3:=pbl;
            end; }
      {处理是否能排}
      temwhether:=true;
      if value1.Draw_type=1  then
      begin
         if (value1.Two_Section_Array_type=1) and (value1.Three_Section_Array_type=1)  then
         begin  //
            if (tempal2*value1.Two_Section_Long_NumberA+pal*value1.One_Section_Long_Number>value1.Sheet_Long)  //长
              or (tempbl2*value1.Two_Section_Long_Numberb+pal*value1.One_Section_Long_Number>value1.Sheet_Long)//长
              or (tempaw2*value1.Two_Section_width_Numbera+tempbw2*value1.Two_Section_width_Numberb>value1.Sheet_Width ) //宽
              //以上二区条件
              or (tempal3*value1.Three_Section_Long_NumberA>pal*value1.One_Section_Long_Number)//长
              or (tempbl3*value1.Three_Section_Long_Numberb>pal*value1.One_Section_Long_Number)//长
              or (tempaw3*value1.Three_Section_Width_NumberA+tempbw3*value1.Three_Section_Width_NumberB+paw*value1.One_Section_Width_Number>value1.Sheet_width)//宽
              //以上三区条件
              or (pal-value1.PNLA_Unit_Long*value1.PNLA_Unit_Long_Number-value1.PNLA_Unit_Long_Space*(value1.PNLA_Unit_Long_Number-1)<0)
              or (paw-value1.PNLA_Unit_width*value1.PNLA_Unit_width_Number-value1.PNLA_Unit_width_Space*(value1.PNLA_Unit_width_Number-1)<0)
              //or (pbl-value1.PNLb_Unit_Long*value1.PNLb_Unit_Long_Number-value1.PNLb_Unit_Long_Space*(value1.PNLb_Unit_Long_Number-1)<0)
              //or (pbw-value1.PNLb_Unit_width*value1.PNLb_Unit_width_Number-value1.PNLb_Unit_width_Space*(value1.PNLb_Unit_width_Number-1)<0)
              //以上边距是否为0
                          then
            begin
               temwhether1:=false;
            end
            else
               temwhether1:=true;
         end;
         if (value1.Two_Section_Array_type=1) and (value1.Three_Section_Array_type=2)  then
         begin  //
            if (tempal2*value1.Two_Section_Long_NumberA+pal*value1.One_Section_Long_Number>value1.Sheet_Long)  //长
              or (tempbl2*value1.Two_Section_Long_Numberb+pal*value1.One_Section_Long_Number>value1.Sheet_Long)//长
              or (tempaw2*value1.Two_Section_width_Numbera+tempbw2*value1.Two_Section_width_Numberb>value1.Sheet_width) //宽
              //以上二区条件
              or (tempal3*value1.Three_Section_long_NumberA+tempbl3*value1.Three_Section_long_Numberb>pal*value1.One_Section_Long_Number)//长
              or (tempaw3*value1.Three_Section_width_Numbera+paw*value1.One_Section_width_Number>value1.Sheet_Width)//宽
              or (tempbw3*value1.Three_Section_width_Numberb+paw*value1.One_Section_width_Number>value1.Sheet_Width)//宽
              //以上三区条件
              or (pal-value1.PNLA_Unit_Long*value1.PNLA_Unit_Long_Number-value1.PNLA_Unit_Long_Space*(value1.PNLA_Unit_Long_Number-1)<0)
              or (paw-value1.PNLA_Unit_width*value1.PNLA_Unit_width_Number-value1.PNLA_Unit_width_Space*(value1.PNLA_Unit_width_Number-1)<0)
              //or (pbl-value1.PNLb_Unit_Long*value1.PNLb_Unit_Long_Number-value1.PNLb_Unit_Long_Space*(value1.PNLb_Unit_Long_Number-1)<0)
              //or (pbw-value1.PNLb_Unit_width*value1.PNLb_Unit_width_Number-value1.PNLb_Unit_width_Space*(value1.PNLb_Unit_width_Number-1)<0)
              //以上边距是否为0
            then
               temwhether1:=false
            else
               temwhether1:=true;
         end;
         if (value1.Two_Section_Array_type=2) and (value1.Three_Section_Array_type=1)  then
         begin  //
            if  (tempal2*value1.Two_Section_long_NumberA+tempbl2*value1.Two_Section_long_Numberb+pal*value1.One_Section_Long_Number>value1.Sheet_Long)  //长
              or (tempaw2*value1.Two_Section_width_Numbera>value1.Sheet_width) //宽
              or (tempbw2*value1.Two_Section_width_Numberb>value1.Sheet_width)//宽
              //以上二区条件
              or (tempal3*value1.Three_Section_Long_NumberA>pal*value1.One_Section_Long_Number)//长
              or (tempbl3*value1.Three_Section_Long_Numberb>pal*value1.One_Section_Long_Number)//长
              or (tempaw3*value1.Three_Section_Width_NumberA+tempbw3*value1.Three_Section_Width_NumberB+paw*value1.One_Section_Width_Number>value1.Sheet_width)//宽
              //以上三区条件
              or (pal-value1.PNLA_Unit_Long*value1.PNLA_Unit_Long_Number-value1.PNLA_Unit_Long_Space*(value1.PNLA_Unit_Long_Number-1)<0)
              or (paw-value1.PNLA_Unit_width*value1.PNLA_Unit_width_Number-value1.PNLA_Unit_width_Space*(value1.PNLA_Unit_width_Number-1)<0)
              //or (pbl-value1.PNLb_Unit_Long*value1.PNLb_Unit_Long_Number-value1.PNLb_Unit_Long_Space*(value1.PNLb_Unit_Long_Number-1)<0)
              //or (pbw-value1.PNLb_Unit_width*value1.PNLb_Unit_width_Number-value1.PNLb_Unit_width_Space*(value1.PNLb_Unit_width_Number-1)<0)
              //以上边距是否为0
            then
               temwhether1:=false
            else
               temwhether1:=true;
         end;

         if (value1.Two_Section_Array_type=2) and (value1.Three_Section_Array_type=2)  then
         begin  //
            if  (tempal2*value1.Two_Section_long_NumberA+tempbl2*value1.Two_Section_long_Numberb+pal*value1.One_Section_Long_Number>value1.Sheet_Long)  //长
              or (tempaw2*value1.Two_Section_width_Numbera>value1.Sheet_width) //宽
              or (tempbw2*value1.Two_Section_width_Numberb>value1.Sheet_width)//宽
              //以上二区条件
              or (tempal3*value1.Three_Section_long_NumberA+tempbl3*value1.Three_Section_long_Numberb>pal*value1.One_Section_Long_Number)//长
              or (tempaw3*value1.Three_Section_width_Numbera+paw*value1.One_Section_width_Number>value1.Sheet_Width)//宽
              or (tempbw3*value1.Three_Section_width_Numberb+paw*value1.One_Section_width_Number>value1.Sheet_Width)//宽
              //以上三区条件
              or (pal-value1.PNLA_Unit_Long*value1.PNLA_Unit_Long_Number-value1.PNLA_Unit_Long_Space*(value1.PNLA_Unit_Long_Number-1)<0)
              or (paw-value1.PNLA_Unit_width*value1.PNLA_Unit_width_Number-value1.PNLA_Unit_width_Space*(value1.PNLA_Unit_width_Number-1)<0)
              //or (pbl-value1.PNLb_Unit_Long*value1.PNLb_Unit_Long_Number-value1.PNLb_Unit_Long_Space*(value1.PNLb_Unit_Long_Number-1)<0)
              //or (pbw-value1.PNLb_Unit_width*value1.PNLb_Unit_width_Number-value1.PNLb_Unit_width_Space*(value1.PNLb_Unit_width_Number-1)<0)
              //以上边距是否为0
            then
               temwhether1:=false
            else
               temwhether1:=true;
         end;



      end;
      //
      if value1.Draw_type=2  then
      begin
         if (value1.Two_Section_Array_type=1) and (value1.Three_Section_Array_type=1)  then
         begin  //
            if (tempal2*value1.Two_Section_Long_NumberA+pal*value1.One_Section_Long_Number>value1.Sheet_Long)  //长
              or (tempbl2*value1.Two_Section_Long_Numberb+pal*value1.One_Section_Long_Number>value1.Sheet_Long)//长
              or (tempaw2*value1.Two_Section_width_Numbera+tempaw2*value1.Two_Section_width_Numberb>paw*value1.Two_Section_width_NumberA) //宽
              //以上二区条件
              or (tempal3*value1.Three_Section_Long_NumberA>value1.Sheet_Long)//长
              or (tempbl3*value1.Three_Section_Long_Numberb>value1.Sheet_Long)//长
              or (tempaw3*value1.Three_Section_Width_NumberA+tempbw3*value1.Three_Section_Width_NumberB+paw*value1.One_Section_Width_Number>value1.Sheet_width)//宽
              //以上三区条件
             or (pal-value1.PNLA_Unit_Long*value1.PNLA_Unit_Long_Number-value1.PNLA_Unit_Long_Space*(value1.PNLA_Unit_Long_Number-1)<0)
              or (paw-value1.PNLA_Unit_width*value1.PNLA_Unit_width_Number-value1.PNLA_Unit_width_Space*(value1.PNLA_Unit_width_Number-1)<0)
              //or (pbl-value1.PNLb_Unit_Long*value1.PNLb_Unit_Long_Number-value1.PNLb_Unit_Long_Space*(value1.PNLb_Unit_Long_Number-1)<0)
              //or (pbw-value1.PNLb_Unit_width*value1.PNLb_Unit_width_Number-value1.PNLb_Unit_width_Space*(value1.PNLb_Unit_width_Number-1)<0)
              //以上边距是否为0
            then
               temwhether1:=false
            else
               temwhether1:=true;
         end;
         //
         if (value1.Two_Section_Array_type=1) and (value1.Three_Section_Array_type=2)  then
         begin  //
            if (tempal2*value1.Two_Section_Long_NumberA+pal*value1.One_Section_Long_Number>value1.Sheet_Long)  //长
              or (tempbl2*value1.Two_Section_Long_Numberb+pal*value1.One_Section_Long_Number>value1.Sheet_Long)//长
              or (tempaw2*value1.Two_Section_width_Numbera+tempaw2*value1.Two_Section_width_Numberb>paw*value1.Two_Section_width_NumberA) //宽
              //以上二区条件
              or (tempaw3*value1.Three_Section_width_NumberA+paw*value1.One_Section_width_Number>value1.Sheet_width)//宽
              or (tempbw3*value1.Three_Section_width_Numberb+paw*value1.One_Section_width_Number>value1.Sheet_width)//宽
              or (tempal3*value1.Three_Section_long_NumberA+tempbl3*value1.Three_Section_long_NumberB>value1.Sheet_long)//长
              //以上三区条件
              or (pal-value1.PNLA_Unit_Long*value1.PNLA_Unit_Long_Number-value1.PNLA_Unit_Long_Space*(value1.PNLA_Unit_Long_Number-1)<0)
              or (paw-value1.PNLA_Unit_width*value1.PNLA_Unit_width_Number-value1.PNLA_Unit_width_Space*(value1.PNLA_Unit_width_Number-1)<0)
              //or (pbl-value1.PNLb_Unit_Long*value1.PNLb_Unit_Long_Number-value1.PNLb_Unit_Long_Space*(value1.PNLb_Unit_Long_Number-1)<0)
              //or (pbw-value1.PNLb_Unit_width*value1.PNLb_Unit_width_Number-value1.PNLb_Unit_width_Space*(value1.PNLb_Unit_width_Number-1)<0)
              //以上边距是否为0
            then
               temwhether1:=false
            else
               temwhether1:=true;
         end;
         //
         if (value1.Two_Section_Array_type=2) and (value1.Three_Section_Array_type=1)  then
         begin  //
            if (tempaw2*value1.Two_Section_width_NumberA>paw*value1.one_Section_width_Number)  //宽
              or (tempbw2*value1.Two_Section_width_Numberb>paw*value1.one_Section_width_Number)//宽
              or (tempal2*value1.Two_Section_long_Numbera+tempbl2*value1.Two_Section_long_Numberb+pal*value1.One_Section_Long_Number>value1.Sheet_Long) //长
              //以上二区条件
              or (tempal3*value1.Three_Section_Long_NumberA>value1.Sheet_Long)//长
              or (tempbl3*value1.Three_Section_Long_Numberb>value1.Sheet_Long)//长
              or (tempaw3*value1.Three_Section_Width_NumberA+tempbw3*value1.Three_Section_Width_NumberB+paw*value1.One_Section_Width_Number>value1.Sheet_width)//宽
              //以上三区条件
              or (pal-value1.PNLA_Unit_Long*value1.PNLA_Unit_Long_Number-value1.PNLA_Unit_Long_Space*(value1.PNLA_Unit_Long_Number-1)<0)
              or (paw-value1.PNLA_Unit_width*value1.PNLA_Unit_width_Number-value1.PNLA_Unit_width_Space*(value1.PNLA_Unit_width_Number-1)<0)
              //or (pbl-value1.PNLb_Unit_Long*value1.PNLb_Unit_Long_Number-value1.PNLb_Unit_Long_Space*(value1.PNLb_Unit_Long_Number-1)<0)
              //or (pbw-value1.PNLb_Unit_width*value1.PNLb_Unit_width_Number-value1.PNLb_Unit_width_Space*(value1.PNLb_Unit_width_Number-1)<0)
              //以上边距是否为0
            then
               temwhether1:=false
            else
               temwhether1:=true;
         end;
         //
         if (value1.Two_Section_Array_type=2) and (value1.Three_Section_Array_type=2)  then
         begin  //
            if (tempaw2*value1.Two_Section_width_NumberA>paw*value1.one_Section_width_Number)  //宽
              or (tempbw2*value1.Two_Section_width_Numberb>paw*value1.one_Section_width_Number)//宽
              or (tempal2*value1.Two_Section_long_Numbera+tempbl2*value1.Two_Section_long_Numberb+pal*value1.One_Section_Long_Number>value1.Sheet_Long) //长
              //以上二区条件
              or (tempaw3*value1.Three_Section_width_NumberA+paw*value1.One_Section_width_Number>value1.Sheet_width)//宽
              or (tempbw3*value1.Three_Section_width_Numberb+paw*value1.One_Section_width_Number>value1.Sheet_width)//宽
              or (tempal3*value1.Three_Section_long_NumberA+tempbl3*value1.Three_Section_long_NumberB>value1.Sheet_long)//长
              //以上三区条件
              or (pal-value1.PNLA_Unit_Long*value1.PNLA_Unit_Long_Number-value1.PNLA_Unit_Long_Space*(value1.PNLA_Unit_Long_Number-1)<0)
              or (paw-value1.PNLA_Unit_width*value1.PNLA_Unit_width_Number-value1.PNLA_Unit_width_Space*(value1.PNLA_Unit_width_Number-1)<0)
              //or (pbl-value1.PNLb_Unit_Long*value1.PNLb_Unit_Long_Number-value1.PNLb_Unit_Long_Space*(value1.PNLb_Unit_Long_Number-1)<0)
              //or (pbw-value1.PNLb_Unit_width*value1.PNLb_Unit_width_Number-value1.PNLb_Unit_width_Space*(value1.PNLb_Unit_width_Number-1)<0)
              //以上边距是否为0
            then
               temwhether1:=false
            else
               temwhether1:=true;
         end;


      end;

       temwhether:=temwhether and temwhether1;



      if temwhether then
      begin
         //只改单元到边距离与PNL尺寸





         value1.PNLA_Long:=Pal;
         value1.PNLA_Width:=Paw;

         //value1.PNLb_Long:=Pbl;
         //value1.PNLb_Width:=Pbw;

         value1.PNLA_Unit_Long_ToPNL:=(pal-value1.PNLA_Unit_Long*value1.PNLA_Unit_Long_Number-value1.PNLA_Unit_Long_Space*(value1.PNLA_Unit_Long_Number-1))/2;
         value1.PNLA_Unit_Width_ToPNL:=(paw-value1.PNLA_Unit_Width*value1.PNLA_Unit_Width_Number-value1.PNLA_Unit_Width_Space*(value1.PNLA_Unit_Width_Number-1))/2;

         //value1.PNLb_Unit_Long_ToPNL:=(pbl-value1.PNLb_Unit_Long*value1.PNLb_Unit_Long_Number-value1.PNLb_Unit_Long_Space*(value1.PNLb_Unit_Long_Number-1))/2;
         //value1.PNLb_Unit_Width_ToPNL:=(pbw-value1.PNLb_Unit_Width*value1.PNLb_Unit_Width_Number-value1.PNLb_Unit_Width_Space*(value1.PNLb_Unit_Width_Number-1))/2;

         value1.Two_Section_LongA:=tempal2;
         value1.Two_Section_WidthA:=tempaw2;
         value1.Two_Section_Longb:=tempbl2;
         value1.Two_Section_Widthb:=tempbw2;

         value1.One_Section_Long:=pal;
         value1.One_Section_Width:=paw;

          value1.Three_Section_LongA:=tempal3;
         value1.Three_Section_WidthA:=tempaw3;
         value1.Three_Section_Longb:=tempbl3;
         value1.Three_Section_Widthb:=tempbw3;
          Result:=TRUE;




      end else
      begin
        showmessage('不能改!');
      end;

  end;


end;

function TFrmPCBCut.Echange_Tem_tresult_makeup_using_Sheet_TwoPNL_1(const Pal,Paw,Pbl,Pbw:currency;var value1:tresult_makeup_using_Sheet_TwoPNL_1):boolean;
var     //用于处理尺寸变换
  temtopal,temtopbl,temtopaw,temtopbw,  //用于记录临时单元到边距离
  tempal2,tempbl2,tempaw2,tempbw2, //用于记录二区临时PNL长与宽
  tempal3,tempbl3,tempaw3,tempbw3  //用于记录三区临时PNL长与宽
  :currency;
  temwhether,temwhether1:boolean;
begin
  //用于处理临时的一二三区PNL长宽与PNLA,PNLB的边宽距离
  if (Pal<>value1.PNLA_Long) or (Paw<>value1.PNLA_Width ) or (Pbl<>value1.PNLB_Long) or (Pbw<>value1.PNLb_Width ) then
  begin
      Result:=false;
      temtopal:=(pal-value1.PNLA_Unit_Long*value1.PNLA_Unit_Long_Number-value1.PNLA_Unit_Long_Space*(value1.PNLA_Unit_Long_Number-1))/2;
      temtopaw:=(paw-value1.PNLA_Unit_Width*value1.PNLA_Unit_Width_Number-value1.PNLA_Unit_Width_Space*(value1.PNLA_Unit_Width_Number-1))/2;
      temtopbl:=(pbl-value1.PNLb_Unit_Long*value1.PNLb_Unit_Long_Number-value1.PNLb_Unit_Long_Space*(value1.PNLb_Unit_Long_Number-1))/2;
      temtopbw:=(pbw-value1.PNLb_Unit_Width*value1.PNLb_Unit_Width_Number-value1.PNLb_Unit_Width_Space*(value1.PNLb_Unit_Width_Number-1))/2;
      //
    //  if value1.Two_Section_Array_type=1  then//二区第一种排法
    //  begin //大料长为一区长加加二区PNLA长与一区长加二区PNLB长
         tempal2:=0;
         tempbl2:=0;
         tempal3:=0;
         tempbl3:=0;
         tempaw2:=0;
         tempbw2:=0;
         tempaw3:=0;
         tempbw3:=0;
         if (value1.PNLA_Long=value1.Two_Section_LongA)
           and (value1.PNLA_Width=value1.Two_Section_WidthA) then
         begin  //二区的PNLA长宽与一区的长宽相等
            tempal2:=pal;
            tempaw2:=paw;
         end;
         if (value1.PNLA_Long=value1.Two_Section_WidthA)
           and (value1.PNLA_Width=value1.Two_Section_LongA) then
         begin  //二区的PNLA宽长与一区的长宽相等
            tempal2:=paw;
            tempaw2:=pal;
         end;
         if (value1.PNLb_Long=value1.Two_Section_LongA)
           and (value1.PNLb_Width=value1.Two_Section_WidthA) then
         begin  //二区的PNLB长宽与一区的长宽相等
            tempal2:=pbl;
            tempaw2:=pbw;
         end;
         if (value1.PNLb_Long=value1.Two_Section_WidthA)
           and (value1.PNLb_Width=value1.Two_Section_LongA) then
         begin  //二区的PNLB宽长与一区的长宽相等
            tempal2:=pbw;
            tempaw2:=pbl;
         end;
         //
         if (value1.PNLA_Long=value1.Two_Section_Longb)
           and (value1.PNLA_Width=value1.Two_Section_Widthb) then
         begin  //二区的PNLB长宽与一区的长宽相等
            tempbl2:=pal;
            tempbw2:=paw;
         end;
         if (value1.PNLA_Long=value1.Two_Section_Widthb)
           and (value1.PNLA_Width=value1.Two_Section_Longb) then
         begin  //二区的PNLB宽长与一区的长宽相等
            tempbl2:=paw;
            tempbw2:=pal;
         end;
         if (value1.PNLb_Long=value1.Two_Section_Longb)
           and (value1.PNLb_Width=value1.Two_Section_Widthb) then
         begin  //二区的PNLB长宽与一区的长宽相等
            tempbl2:=pbl;
            tempbw2:=pbw;
         end;
         if (value1.PNLb_Long=value1.Two_Section_Widthb)
           and (value1.PNLb_Width=value1.Two_Section_Longb) then
         begin  //二区的PNLB宽长与一区的长宽相等
            tempbl2:=pbw;
            tempbw2:=pbl;
         end;
            //三区PNLA
            if (value1.PNLA_Long=value1.three_Section_LongA)
              and (value1.PNLA_Width=value1.three_Section_WidthA) then
            begin  //三区的PNLA长宽与一区的长宽相等
              tempal3:=pal;
              tempaw3:=paw;
            end;
            if (value1.PNLA_Long=value1.three_Section_WidthA)
              and (value1.PNLA_Width=value1.three_Section_LongA) then
            begin  //三区的PNLA宽长与一区的长宽相等
              tempal3:=paw;
              tempaw3:=pal;
            end;
            if (value1.PNLb_Long=value1.three_Section_LongA)
             and (value1.PNLb_Width=value1.three_Section_WidthA) then
            begin  //三区的PNLB长宽与一区的长宽相等
              tempal3:=pbl;
              tempaw3:=pbw;
            end;
            if (value1.PNLb_Long=value1.three_Section_WidthA)
             and (value1.PNLb_Width=value1.three_Section_LongA) then
            begin  //三区的PNLB宽长与一区的长宽相等
              tempal3:=pbw;
              tempaw3:=pbl;
            end;
           //
            if (value1.PNLA_Long=value1.three_Section_Longb)
             and (value1.PNLA_Width=value1.three_Section_Widthb) then
            begin  //三区的PNLB长宽与一区的长宽相等
              tempbl3:=pal;
              tempbw3:=paw;
            end;
            if (value1.PNLA_Long=value1.three_Section_Widthb)
              and (value1.PNLA_Width=value1.three_Section_Longb) then
            begin  //三区的PNLB宽长与一区的长宽相等
              tempbl3:=paw;
              tempbw3:=pal;
            end;
            if (value1.PNLb_Long=value1.three_Section_Longb)
             and (value1.PNLb_Width=value1.three_Section_Widthb) then
            begin  //三区的PNLB长宽与一区的长宽相等
              tempbl3:=pbl;
              tempbw3:=pbw;
            end;
            if (value1.PNLb_Long=value1.three_Section_Widthb)
             and (value1.PNLb_Width=value1.three_Section_Longb) then
            begin  //三区的PNLB宽长与一区的长宽相等
              tempbl3:=pbw;
              tempbw3:=pbl;
            end;
      {处理是否能排}
      temwhether:=true;
      if value1.Draw_type=1  then
      begin
         if (value1.Two_Section_Array_type=1) and (value1.Three_Section_Array_type=1)  then
         begin  //
            if (tempal2*value1.Two_Section_Long_NumberA+pal*value1.One_Section_Long_Number>value1.Sheet_Long)  //长
              or (tempbl2*value1.Two_Section_Long_Numberb+pal*value1.One_Section_Long_Number>value1.Sheet_Long)//长
              or (tempaw2*value1.Two_Section_width_Numbera+tempbw2*value1.Two_Section_width_Numberb>value1.Sheet_Width ) //宽
              //以上二区条件
              or (tempal3*value1.Three_Section_Long_NumberA>pal*value1.One_Section_Long_Number)//长
              or (tempbl3*value1.Three_Section_Long_Numberb>pal*value1.One_Section_Long_Number)//长
              or (tempaw3*value1.Three_Section_Width_NumberA+tempbw3*value1.Three_Section_Width_NumberB+paw*value1.One_Section_Width_Number>value1.Sheet_width)//宽
              //以上三区条件
              or (pal-value1.PNLA_Unit_Long*value1.PNLA_Unit_Long_Number-value1.PNLA_Unit_Long_Space*(value1.PNLA_Unit_Long_Number-1)<0)
              or (paw-value1.PNLA_Unit_width*value1.PNLA_Unit_width_Number-value1.PNLA_Unit_width_Space*(value1.PNLA_Unit_width_Number-1)<0)
              or (pbl-value1.PNLb_Unit_Long*value1.PNLb_Unit_Long_Number-value1.PNLb_Unit_Long_Space*(value1.PNLb_Unit_Long_Number-1)<0)
              or (pbw-value1.PNLb_Unit_width*value1.PNLb_Unit_width_Number-value1.PNLb_Unit_width_Space*(value1.PNLb_Unit_width_Number-1)<0)
              //以上边距是否为0
                          then
            begin
               temwhether1:=false;
            end
            else
               temwhether1:=true;
         end;
         if (value1.Two_Section_Array_type=1) and (value1.Three_Section_Array_type=2)  then
         begin  //
            if (tempal2*value1.Two_Section_Long_NumberA+pal*value1.One_Section_Long_Number>value1.Sheet_Long)  //长
              or (tempbl2*value1.Two_Section_Long_Numberb+pal*value1.One_Section_Long_Number>value1.Sheet_Long)//长
              or (tempaw2*value1.Two_Section_width_Numbera+tempbw2*value1.Two_Section_width_Numberb>value1.Sheet_width) //宽
              //以上二区条件
              or (tempal3*value1.Three_Section_long_NumberA+tempbl3*value1.Three_Section_long_Numberb>pal*value1.One_Section_Long_Number)//长
              or (tempaw3*value1.Three_Section_width_Numbera+paw*value1.One_Section_width_Number>value1.Sheet_Width)//宽
              or (tempbw3*value1.Three_Section_width_Numberb+paw*value1.One_Section_width_Number>value1.Sheet_Width)//宽
              //以上三区条件
              or (pal-value1.PNLA_Unit_Long*value1.PNLA_Unit_Long_Number-value1.PNLA_Unit_Long_Space*(value1.PNLA_Unit_Long_Number-1)<0)
              or (paw-value1.PNLA_Unit_width*value1.PNLA_Unit_width_Number-value1.PNLA_Unit_width_Space*(value1.PNLA_Unit_width_Number-1)<0)
              or (pbl-value1.PNLb_Unit_Long*value1.PNLb_Unit_Long_Number-value1.PNLb_Unit_Long_Space*(value1.PNLb_Unit_Long_Number-1)<0)
              or (pbw-value1.PNLb_Unit_width*value1.PNLb_Unit_width_Number-value1.PNLb_Unit_width_Space*(value1.PNLb_Unit_width_Number-1)<0)
              //以上边距是否为0
            then
               temwhether1:=false
            else
               temwhether1:=true;
         end;
         if (value1.Two_Section_Array_type=2) and (value1.Three_Section_Array_type=1)  then
         begin  //
            if  (tempal2*value1.Two_Section_long_NumberA+tempbl2*value1.Two_Section_long_Numberb+pal*value1.One_Section_Long_Number>value1.Sheet_Long)  //长
              or (tempaw2*value1.Two_Section_width_Numbera>value1.Sheet_width) //宽
              or (tempbw2*value1.Two_Section_width_Numberb>value1.Sheet_width)//宽
              //以上二区条件
              or (tempal3*value1.Three_Section_Long_NumberA>pal*value1.One_Section_Long_Number)//长
              or (tempbl3*value1.Three_Section_Long_Numberb>pal*value1.One_Section_Long_Number)//长
              or (tempaw3*value1.Three_Section_Width_NumberA+tempbw3*value1.Three_Section_Width_NumberB+paw*value1.One_Section_Width_Number>value1.Sheet_width)//宽
              //以上三区条件
              or (pal-value1.PNLA_Unit_Long*value1.PNLA_Unit_Long_Number-value1.PNLA_Unit_Long_Space*(value1.PNLA_Unit_Long_Number-1)<0)
              or (paw-value1.PNLA_Unit_width*value1.PNLA_Unit_width_Number-value1.PNLA_Unit_width_Space*(value1.PNLA_Unit_width_Number-1)<0)
              or (pbl-value1.PNLb_Unit_Long*value1.PNLb_Unit_Long_Number-value1.PNLb_Unit_Long_Space*(value1.PNLb_Unit_Long_Number-1)<0)
              or (pbw-value1.PNLb_Unit_width*value1.PNLb_Unit_width_Number-value1.PNLb_Unit_width_Space*(value1.PNLb_Unit_width_Number-1)<0)
              //以上边距是否为0
            then
               temwhether1:=false
            else
               temwhether1:=true;
         end;

         if (value1.Two_Section_Array_type=2) and (value1.Three_Section_Array_type=2)  then
         begin  //
            if  (tempal2*value1.Two_Section_long_NumberA+tempbl2*value1.Two_Section_long_Numberb+pal*value1.One_Section_Long_Number>value1.Sheet_Long)  //长
              or (tempaw2*value1.Two_Section_width_Numbera>value1.Sheet_width) //宽
              or (tempbw2*value1.Two_Section_width_Numberb>value1.Sheet_width)//宽
              //以上二区条件
              or (tempal3*value1.Three_Section_long_NumberA+tempbl3*value1.Three_Section_long_Numberb>pal*value1.One_Section_Long_Number)//长
              or (tempaw3*value1.Three_Section_width_Numbera+paw*value1.One_Section_width_Number>value1.Sheet_Width)//宽
              or (tempbw3*value1.Three_Section_width_Numberb+paw*value1.One_Section_width_Number>value1.Sheet_Width)//宽
              //以上三区条件
              or (pal-value1.PNLA_Unit_Long*value1.PNLA_Unit_Long_Number-value1.PNLA_Unit_Long_Space*(value1.PNLA_Unit_Long_Number-1)<0)
              or (paw-value1.PNLA_Unit_width*value1.PNLA_Unit_width_Number-value1.PNLA_Unit_width_Space*(value1.PNLA_Unit_width_Number-1)<0)
              or (pbl-value1.PNLb_Unit_Long*value1.PNLb_Unit_Long_Number-value1.PNLb_Unit_Long_Space*(value1.PNLb_Unit_Long_Number-1)<0)
              or (pbw-value1.PNLb_Unit_width*value1.PNLb_Unit_width_Number-value1.PNLb_Unit_width_Space*(value1.PNLb_Unit_width_Number-1)<0)
              //以上边距是否为0
            then
               temwhether1:=false
            else
               temwhether1:=true;
         end;



      end;
      //
      if value1.Draw_type=2  then
      begin
         if (value1.Two_Section_Array_type=1) and (value1.Three_Section_Array_type=1)  then
         begin  //
            if (tempal2*value1.Two_Section_Long_NumberA+pal*value1.One_Section_Long_Number>value1.Sheet_Long)  //长
              or (tempbl2*value1.Two_Section_Long_Numberb+pal*value1.One_Section_Long_Number>value1.Sheet_Long)//长
              or (tempaw2*value1.Two_Section_width_Numbera+tempaw2*value1.Two_Section_width_Numberb>paw*value1.Two_Section_width_NumberA) //宽
              //以上二区条件
              or (tempal3*value1.Three_Section_Long_NumberA>value1.Sheet_Long)//长
              or (tempbl3*value1.Three_Section_Long_Numberb>value1.Sheet_Long)//长
              or (tempaw3*value1.Three_Section_Width_NumberA+tempbw3*value1.Three_Section_Width_NumberB+paw*value1.One_Section_Width_Number>value1.Sheet_width)//宽
              //以上三区条件
             or (pal-value1.PNLA_Unit_Long*value1.PNLA_Unit_Long_Number-value1.PNLA_Unit_Long_Space*(value1.PNLA_Unit_Long_Number-1)<0)
              or (paw-value1.PNLA_Unit_width*value1.PNLA_Unit_width_Number-value1.PNLA_Unit_width_Space*(value1.PNLA_Unit_width_Number-1)<0)
              or (pbl-value1.PNLb_Unit_Long*value1.PNLb_Unit_Long_Number-value1.PNLb_Unit_Long_Space*(value1.PNLb_Unit_Long_Number-1)<0)
              or (pbw-value1.PNLb_Unit_width*value1.PNLb_Unit_width_Number-value1.PNLb_Unit_width_Space*(value1.PNLb_Unit_width_Number-1)<0)
              //以上边距是否为0
            then
               temwhether1:=false
            else
               temwhether1:=true;
         end;
         //
         if (value1.Two_Section_Array_type=1) and (value1.Three_Section_Array_type=2)  then
         begin  //
            if (tempal2*value1.Two_Section_Long_NumberA+pal*value1.One_Section_Long_Number>value1.Sheet_Long)  //长
              or (tempbl2*value1.Two_Section_Long_Numberb+pal*value1.One_Section_Long_Number>value1.Sheet_Long)//长
              or (tempaw2*value1.Two_Section_width_Numbera+tempaw2*value1.Two_Section_width_Numberb>paw*value1.Two_Section_width_NumberA) //宽
              //以上二区条件
              or (tempaw3*value1.Three_Section_width_NumberA+paw*value1.One_Section_width_Number>value1.Sheet_width)//宽
              or (tempbw3*value1.Three_Section_width_Numberb+paw*value1.One_Section_width_Number>value1.Sheet_width)//宽
              or (tempal3*value1.Three_Section_long_NumberA+tempbl3*value1.Three_Section_long_NumberB>value1.Sheet_long)//长
              //以上三区条件
              or (pal-value1.PNLA_Unit_Long*value1.PNLA_Unit_Long_Number-value1.PNLA_Unit_Long_Space*(value1.PNLA_Unit_Long_Number-1)<0)
              or (paw-value1.PNLA_Unit_width*value1.PNLA_Unit_width_Number-value1.PNLA_Unit_width_Space*(value1.PNLA_Unit_width_Number-1)<0)
              or (pbl-value1.PNLb_Unit_Long*value1.PNLb_Unit_Long_Number-value1.PNLb_Unit_Long_Space*(value1.PNLb_Unit_Long_Number-1)<0)
              or (pbw-value1.PNLb_Unit_width*value1.PNLb_Unit_width_Number-value1.PNLb_Unit_width_Space*(value1.PNLb_Unit_width_Number-1)<0)
              //以上边距是否为0
            then
               temwhether1:=false
            else
               temwhether1:=true;
         end;
         //
         if (value1.Two_Section_Array_type=2) and (value1.Three_Section_Array_type=1)  then
         begin  //
            if (tempaw2*value1.Two_Section_width_NumberA>paw*value1.one_Section_width_Number)  //宽
              or (tempbw2*value1.Two_Section_width_Numberb>paw*value1.one_Section_width_Number)//宽
              or (tempal2*value1.Two_Section_long_Numbera+tempbl2*value1.Two_Section_long_Numberb+pal*value1.One_Section_Long_Number>value1.Sheet_Long) //长
              //以上二区条件
              or (tempal3*value1.Three_Section_Long_NumberA>value1.Sheet_Long)//长
              or (tempbl3*value1.Three_Section_Long_Numberb>value1.Sheet_Long)//长
              or (tempaw3*value1.Three_Section_Width_NumberA+tempbw3*value1.Three_Section_Width_NumberB+paw*value1.One_Section_Width_Number>value1.Sheet_width)//宽
              //以上三区条件
              or (pal-value1.PNLA_Unit_Long*value1.PNLA_Unit_Long_Number-value1.PNLA_Unit_Long_Space*(value1.PNLA_Unit_Long_Number-1)<0)
              or (paw-value1.PNLA_Unit_width*value1.PNLA_Unit_width_Number-value1.PNLA_Unit_width_Space*(value1.PNLA_Unit_width_Number-1)<0)
              or (pbl-value1.PNLb_Unit_Long*value1.PNLb_Unit_Long_Number-value1.PNLb_Unit_Long_Space*(value1.PNLb_Unit_Long_Number-1)<0)
              or (pbw-value1.PNLb_Unit_width*value1.PNLb_Unit_width_Number-value1.PNLb_Unit_width_Space*(value1.PNLb_Unit_width_Number-1)<0)
              //以上边距是否为0
            then
               temwhether1:=false
            else
               temwhether1:=true;
         end;
         //
         if (value1.Two_Section_Array_type=2) and (value1.Three_Section_Array_type=2)  then
         begin  //
            if (tempaw2*value1.Two_Section_width_NumberA>paw*value1.one_Section_width_Number)  //宽
              or (tempbw2*value1.Two_Section_width_Numberb>paw*value1.one_Section_width_Number)//宽
              or (tempal2*value1.Two_Section_long_Numbera+tempbl2*value1.Two_Section_long_Numberb+pal*value1.One_Section_Long_Number>value1.Sheet_Long) //长
              //以上二区条件
              or (tempaw3*value1.Three_Section_width_NumberA+paw*value1.One_Section_width_Number>value1.Sheet_width)//宽
              or (tempbw3*value1.Three_Section_width_Numberb+paw*value1.One_Section_width_Number>value1.Sheet_width)//宽
              or (tempal3*value1.Three_Section_long_NumberA+tempbl3*value1.Three_Section_long_NumberB>value1.Sheet_long)//长
              //以上三区条件
              or (pal-value1.PNLA_Unit_Long*value1.PNLA_Unit_Long_Number-value1.PNLA_Unit_Long_Space*(value1.PNLA_Unit_Long_Number-1)<0)
              or (paw-value1.PNLA_Unit_width*value1.PNLA_Unit_width_Number-value1.PNLA_Unit_width_Space*(value1.PNLA_Unit_width_Number-1)<0)
              or (pbl-value1.PNLb_Unit_Long*value1.PNLb_Unit_Long_Number-value1.PNLb_Unit_Long_Space*(value1.PNLb_Unit_Long_Number-1)<0)
              or (pbw-value1.PNLb_Unit_width*value1.PNLb_Unit_width_Number-value1.PNLb_Unit_width_Space*(value1.PNLb_Unit_width_Number-1)<0)
              //以上边距是否为0
            then
               temwhether1:=false
            else
               temwhether1:=true;
         end;


      end;

       temwhether:=temwhether and temwhether1;



      if temwhether then
      begin
         //只改单元到边距离与PNL尺寸





         value1.PNLA_Long:=Pal;
         value1.PNLA_Width:=Paw;

         value1.PNLb_Long:=Pbl;
         value1.PNLb_Width:=Pbw;

         value1.PNLA_Unit_Long_ToPNL:=(pal-value1.PNLA_Unit_Long*value1.PNLA_Unit_Long_Number-value1.PNLA_Unit_Long_Space*(value1.PNLA_Unit_Long_Number-1))/2;
         value1.PNLA_Unit_Width_ToPNL:=(paw-value1.PNLA_Unit_Width*value1.PNLA_Unit_Width_Number-value1.PNLA_Unit_Width_Space*(value1.PNLA_Unit_Width_Number-1))/2;

         value1.PNLb_Unit_Long_ToPNL:=(pbl-value1.PNLb_Unit_Long*value1.PNLb_Unit_Long_Number-value1.PNLb_Unit_Long_Space*(value1.PNLb_Unit_Long_Number-1))/2;
         value1.PNLb_Unit_Width_ToPNL:=(pbw-value1.PNLb_Unit_Width*value1.PNLb_Unit_Width_Number-value1.PNLb_Unit_Width_Space*(value1.PNLb_Unit_Width_Number-1))/2;

         value1.Two_Section_LongA:=tempal2;
         value1.Two_Section_WidthA:=tempaw2;
         value1.Two_Section_Longb:=tempbl2;
         value1.Two_Section_Widthb:=tempbw2;

         value1.One_Section_Long:=pal;
         value1.One_Section_Width:=paw;

          value1.Three_Section_LongA:=tempal3;
         value1.Three_Section_WidthA:=tempaw3;
         value1.Three_Section_Longb:=tempbl3;
         value1.Three_Section_Widthb:=tempbw3;
          Result:=TRUE;




      end else
      begin
        showmessage('不能改!');
      end;

  end;


end;

Procedure TFrmPCBCut.DrawRotatedText(TheCanvas : TCanvas; txt_x,txt_y:Integer;TheAngle : Integer; TheText : String);
var
  lf : TLogFont;
  tf : TFont;
begin
image3.canvas.refresh;

  with TheCanvas do begin
{    Font.Name := 'Arial';
    Font.Size := 24;
    Brush.Style := bsClear;}
    tf := TFont.Create;
    try
      tf.Assign(Font);
      GetObject(tf.Handle, sizeof(lf), @lf);
      lf.lfEscapement := TheAngle * 10;
      lf.lfOrientation := TheAngle * 10;
      tf.Handle := CreateFontIndirect(lf);
      Font.Assign(tf);
    finally
      tf.Free;
    end;
    TextOut(txt_x+25, txt_y-5 , TheText);
  end;
end;

function ModifyRect (ARect: TRect): TRect;
var
  temp: Integer;
begin
  if ARect.Bottom < ARect.Top then
  begin
    temp := ARect.Bottom;
    ARect.Bottom := ARect.Top;
    ARect.Top := temp;
  end;
  if ARect.Right < ARect.Left then
  begin
    temp := ARect.Right;
    ARect.Right := ARect.Left;
    ARect.Left := temp;
  end;
  Result := ARect;
end;

procedure TFrmPCBCut.FormCreate(Sender: TObject);
begin
  vimag1:=0;
  vimag2:=0;
  vimag8:=0;

  pagecontrol1.ActivePageIndex :=0;
  Pagecontrol2.ActivePageIndex :=0;
  stringgrid1.Cells[0,0]:='长度(mm)';
  stringgrid1.Cells[1,0]:='宽度(mm)';
  stringgrid1.Cells[2,0]:='选取';

  with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select selected,Length,Width from data0503 order by rkey';
   open;
  end;
  stringgrid1.RowCount:=dm.adoquery1.RecordCount+1;
  while not dm.Adoquery1.eof do
   begin
    stringgrid1.Cells[0,dm.ADOQuery1.recno]:=
              dm.ADOQuery1.fieldbyname('Length').AsString;
    stringgrid1.Cells[1,dm.ADOQuery1.RecNo]:=
              dm.ADOQuery1.fieldbyname('width').AsString;
    stringgrid1.Cells[2,dm.ADOQuery1.recno]:=
               dm.ADOQuery1.fieldbyname('selected').AsString;
    dm.ADOQuery1.next;
   end;
  dm.ADOQuery1.Close;

  Canvas.Pen.Style := psInsideFrame;
  DrawingTool := dtRectangle;
  WImage:=image1;

end;

procedure TFrmPCBCut.FormPaint(Sender: TObject);
var
  PenW: Integer;
  PenCol, BrushCol: TColor;
begin
  PenCol := Canvas.Pen.Color;    // 存储当前Canvas的属性
  PenW := Canvas.Pen.Width;
  BrushCol := Canvas.Brush.Color;

  Canvas.Pen.Color := PenCol;
  Canvas.Pen.Width := PenW;
  Canvas.Brush.Color := BrushCol;   //重设Canvas属性
end;

procedure TFrmPCBCut.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if MessageDlg ('确认退出?)',
      mtConfirmation, [mbYes, mbNo], 0) = idNo then
    CanClose := False;
    //让用户确认关闭操作
end;

procedure TFrmPCBCut.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  wimage:=sender as timage;
  if fDrag then
  begin
    fDrag := False;
    //结束拖动鼠标
    IF label43.Caption ='0' then
      DrawShape1(Wimage,Origin, Point(X, Y), pmCopy)
    else
      DrawShape1(Wimage,Origin, Point(X, Y), pmWhite);
  end;
end;

procedure TFrmPCBCut.LineButtonClick(Sender: TObject);
begin
  DrawingTool := dtLine;
  Label43.Caption :='0';
  Wimage.Cursor :=crCross;
  //将画具设为LINE
end;

procedure TFrmPCBCut.RectangleButtonClick(Sender: TObject);
begin
  DrawingTool := dtRectangle;
  Label43.Caption :='0';
  Wimage.Cursor :=crCross;
  //将画具设为RECT
end;

procedure TFrmPCBCut.PenSizeChange(Sender: TObject);
begin
  // 改变画笔宽度
  WImage.Canvas.Pen.Width := PenWidth.Position;
end;

procedure TFrmPCBCut.Save1Click(Sender: TObject);
begin
  // 将画布上的图形储存成一个新的BMP文件
  if CurrentFile <> EmptyStr then
    Image1.Picture.SaveToFile(CurrentFile)
  else SaveAs1Click(Sender);
end;

procedure TFrmPCBCut.Saveas1Click(Sender: TObject);
begin
  // 将画布上的图形储存回原来的BMP文件
  if SaveDialog1.Execute then
  begin
    CurrentFile := SaveDialog1.FileName;
    Save1Click(Sender);
  end;
end;

procedure TFrmPCBCut.Print1Click(Sender: TObject);
begin
   //将画布上的图形打印出来
{   Printer.BeginDoc;
   Printer.Canvas.CopyRect(WImage.ClientRect, WImage.Canvas,WImage.ClientRect);
   Printer.EndDoc;}
end;

procedure TFrmPCBCut.DrawShape(Vimage:TImage;TopLeft, BottomRight: TPoint; AMode: TPenMode);
begin
end;

procedure TFrmPCBCut.DrawText(Vimage:TImage;Vx,Vy: Integer; vstr: String);
begin
end;

procedure TFrmPCBCut.DrawShape1(Vimage:TImage;TopLeft, BottomRight: TPoint; AMode: TPenMode);
var Arect:trect;
begin
  // 根据DrawingTool 变量设置的画具种类,调用对应的绘图方法,像是
//    Origin, MovePt: TPoint;
  Arect.Left :=Origin.X;
  Arect.Top  :=Origin.Y;
  Arect.Right :=MovePt.X ;
  Arect.Bottom:=MovePt.Y;
  Vimage.Canvas.Font.Name :='Arial Narrow';
  with Vimage.Canvas do
  begin
    Pen.Mode := AMode;
    case DrawingTool of
      dtLine:
        begin
            Vimage.Canvas.MoveTo(TopLeft.X, TopLeft.Y);
            Vimage.Canvas.LineTo(BottomRight.X, BottomRight.Y);
        end;
      dtRectangle:
          Vimage.Canvas.Rectangle(TopLeft.X, TopLeft.Y, BottomRight.X,BottomRight.Y);
      dtText: Vimage.canvas.TextOut(Topleft.X, TopLeft.Y,label45.Caption);
      dtDraw:
        if label45.Caption='21' then
          Vimage.Canvas.Draw(TopLeft.X-5, TopLeft.Y-5,image10.Picture.Graphic)
        else
        if label45.Caption='22' then
          Vimage.Canvas.Draw(TopLeft.X-5, TopLeft.Y-5,image11.Picture.Graphic)
        else
        if label45.Caption='23' then
          Vimage.Canvas.Draw(TopLeft.X-5, TopLeft.Y-5,image12.Picture.Graphic)
        else
          Vimage.Canvas.Draw(TopLeft.X-5, TopLeft.Y-5,image13.Picture.Graphic);
      dtDraw2:
        if label45.Caption='27' then
          Vimage.Canvas.StretchDraw(Arect,image16.Picture.Graphic)
        else
          Vimage.Canvas.StretchDraw(Arect,image17.Picture.Graphic);
    end;
  end;
end;

procedure TFrmPCBCut.CutDesign();
begin
end;

procedure TFrmPCBCut.pnl_size_old(vvlen,vvwth:real);
begin
end;

procedure TFrmPCBCut.inproc0(VVtimes:integer;VVScp,vlen,vwth,len,wth,vusage:Real);
begin
end;

procedure TFrmPCBCut.CutDrawing();
begin
end;

procedure TFrmPCBCut.inCutDrawing(pnls:integer;wlen,wwth,plen,pwth,vmin,vmax:Real);
begin
end;

procedure TFrmPCBCut.inCutDrawing2(pnls:integer;wlen,wwth,plen,pwth,vmin,vmax:Real);
begin
end;

Procedure TFrmPCBCut.inPnlDrawing();
begin
end;

Procedure TFrmPCBCut.inPnlDrawing2();
begin
end;

procedure TFrmPCBCut.appeblan(vvscp,vlen,vwth:Real;vtimes:integer);
begin
end;

procedure TFrmPCBCut.appeblan1(vvscp,vlen,vwth:Real;vtimes:integer);
begin
end;

procedure TFrmPCBCut.Exit1Click(Sender: TObject);
begin
close;
end;

procedure TFrmPCBCut.New1Click(Sender: TObject);      //菜单清除
begin
  Image1.Picture :=Image14.Picture ;
  Image2.Picture :=Image14.Picture ;
  Image8.Picture :=Image14.Picture ;
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);//清除内容
  Image2.Canvas.Rectangle(0,0,Image2.Width,Image2.Height);//清除内容
  Image8.Canvas.Rectangle(0,0,Image8.Width,Image8.Height);//清除内容
end;

procedure TFrmPCBCut.SpeedButton2Click(Sender: TObject);
var
  jpegimage:Tjpegimage;
  stream:TMemoryStream;
begin

 try
  if strtoint('0'+trim(edit9.Text))=0 then Edit9.text:='1';
   with dm.ads502 do
   begin
    IF recordcount=0 then
     Append
    else
     edit;

    jpegimage:=tjpegimage.Create;
    Stream:=TMemoryStream.Create;
    
    jpegimage.Assign(image1.Picture.Bitmap);
    jpegimage.JPEGNeeded;
    jpegimage.SaveToStream(stream);
    Stream.Position :=0;
    dm.ads502sheet_BMP.LoadFromStream(stream); //读取保存的内存图
    stream.Clear;

    jpegimage.Assign(image2.Picture.Bitmap);
    jpegimage.JPEGNeeded;
    jpegimage.SaveToStream(stream);
    Stream.Position :=0;
    dm.ads502pnl_bmp.LoadFromStream(stream); // 读取保存的内存图
    stream.Clear;

    dm.ads502source_ptr.Value:=dm.AQY0025RKEY.Value;
    Fieldbyname('unit_len').asString:=Edit1.Text; //拼版长
    Fieldbyname('unit_wth').asString:=Edit3.Text; //拼版宽
    Fieldbyname('unit_num').asString:=Edit9.text; //拼版单元个数

    Fieldbyname('sht_len').AsString:=label16.caption;    //大料长
    Fieldbyname('sht_wth').AsString:=label59.Caption;    //大料宽
    Fieldbyname('Tusage').asstring:=label14.caption;     //大料利用率
    Fieldbyname('unit_unit').asinteger:=Radiogroup3.ItemIndex;
    Fieldbyname('minspace1').asString:=combobox3.Text ;
    Fieldbyname('minspace2').asString:=combobox5.Text ;
    Fieldbyname('pnl_len').AsString := Spinedit2.Text ;
    Fieldbyname('pnl_wth').AsString := Spinedit3.Text ;
    Fieldbyname('upanel').asstring := Label7.Caption;  //A板每PAN的PCS数
    Fieldbyname('total_pnls_1').asString:=Label9.Caption;  //大料总A板数

     if SpinEdit4.Enabled then   //开B板
      begin
       Fieldbyname('pnl_len_2').AsString :=Spinedit4.Text ;
       Fieldbyname('pnl_wth_2').AsString :=Spinedit5.Text ;
       Fieldbyname('upanel_2').asstring:=Label32.Caption;
       Fieldbyname('total_pnls_2').asString:=Label30.Caption;
       jpegimage.Assign(image8.Picture.Bitmap);
       jpegimage.JPEGNeeded;
       jpegimage.SaveToStream(stream);
       Stream.Position :=0;
       dm.ads502pnl2_bmp.LoadFromStream(stream); // 读取保存的内存图
       stream.Clear;
      end
      else
      begin
       dm.ads502pnl2_bmp.AsVariant:=null;
       dm.ads502PNL_LEN_2.Value:=0;
       dm.ads502PNL_WTH_2.Value:=0;
       dm.ads502UPANEL_2.Value:=0;
       dm.ads502TOTAL_PNLS_2.Value:=0;
      end;
    post;
   end;

   stream.Free;
   jpegimage.Free;

   modalresult:=mrOk;
  except
   on E: Exception do
    begin
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
end;

function Min(A,B: Double): Double;
begin
if A>B THEN result:=b else result:=a;
end;

function Max(A,B: Double): Double;
begin
if A<B THEN result:=b else result:=a;
end;

procedure TFrmPCBCut.DrawOnePnl();
var
  Input_PCB_SIZE_onePNL22:Input_PCB_SIZE_onePNL_1;//定义记录
  Input_Sheet_Size_15:Input_Sheet_Size_onePNL_1;//定义记录
  tem1:currency;
  tem_Function1:boolean;
  i,row:integer;
begin
  vtime:=now;
  Input_PCB_SIZE_OnePNL22.Unit_Long:=strtocurr(edit1.text); //单元长
  Input_PCB_SIZE_OnePNL22.Unit_Width:=strtocurr(edit3.text); //单元宽
  Input_PCB_SIZE_OnePNL22.Unit_Long_Space:=strtocurr(combobox3.text);//单元长间距
  Input_PCB_SIZE_OnePNL22.Unit_Width_Space:=strtocurr(combobox5.text);//单元宽间距
  Input_PCB_SIZE_OnePNL22.Unit_Long_ToPNL:=strtocurr(combobox11.text);//单元长到边距离
  Input_PCB_SIZE_OnePNL22.Unit_Width_ToPNL:=strtocurr(combobox13.text);//单元宽到边距离
  Input_PCB_SIZE_OnePNL22.PNLA_Long_Max:=strtocurr(combobox6.text);//PNLA长上限
  Input_PCB_SIZE_OnePNL22.PNLA_Width_Max:=strtocurr(combobox8.text);//PNLA宽上限
  Input_PCB_SIZE_OnePNL22.PNLA_Long_Min:=strtocurr(combobox7.text); //PNLA长下限
  Input_PCB_SIZE_OnePNL22.PNLA_Width_Min:=strtocurr(combobox9.text);//PNLA宽下限

  Aarray_Rectangle_onePNL1:=TAarray_Rectangle_onePNL1.Create;//建立类

  i:=0;
  for row:=1 to stringgrid1.RowCount-1 do
  if trim(stringgrid1.Cells[2,row])='Y' then
   begin
    Input_Sheet_Size_15.Sheet_Long:= strtofloat(stringgrid1.Cells[0,row]);  //Sheet_L;//大料长
    Input_Sheet_Size_15.Sheet_Width:=strtofloat(stringgrid1.Cells[1,row]);   //Sheet_W;//大料宽
    Aarray_Rectangle_onePNL1.Input_Sheet_Size[i]:=Input_Sheet_Size_15; //输入要求计算的大料尺寸,注意用数组表示
    i:=i+1;
   end;

  Aarray_Rectangle_onePNL1.Input_PCB_SIZE:=Input_PCB_SIZE_onePNL22;//输入要求计算的单元尺寸等信息
  Aarray_Rectangle_onePNL1.Calculate_Array_Complete_Percent:=ProgressBar1; //用于显示进度
  Aarray_Rectangle_onePNL1.Calculate_Array_Complete_Time_Display:=true;//显示计算时间
  //Aarray_Rectangle_onePNL1.Echange_Unit_To_Unit_Space:=true;//交换单元间距
  Aarray_Rectangle_onePNL1.Echange_Unit_To_PNL_Space:=true;//交换单到边距离
  Aarray_Rectangle_onePNL1.Calculate_Rate_Type:=1;//1用单元计算利用率2用PNL计算利用率,暂时不起作用
  Aarray_Rectangle_onePNL1.Calculate_Falchion_Number_Equality_Hold:=false;
  Aarray_Rectangle_onePNL1.Change_PNL_Long_Width:= not checkbox3.Checked;//false长边上限对单元,宽边对宽边上限;TRUE没有对应关系
  Aarray_Rectangle_onePNL1.No_Calculate_Falchion_Number:=true;//false长边上限对单元,宽边对宽边上限;TRUE没有对应关系

  Aarray_Rectangle_onePNL1.Calculate_Array;//计算
  for i:=low(Tem_Result_makeup_using_Sheet_OnePNL_t1) to high(Tem_Result_makeup_using_Sheet_OnePNL_t1) do
  Try
   Tem_Result_makeup_using_Sheet_OnePNL_t1[i]:=Aarray_Rectangle_onePNL1.Calculate_Result[i];
  except
  end;

  label58.Caption:='21';
  for i:=0 to 20 do
   if Tem_Result_makeup_using_Sheet_OnePNL_t1[i].PNLA_Unit_Long_Number=0 then
    begin
     label58.Caption :=inttostr(i+1);
     break;
    end;
   if Edit11.text>'0' then
    begin
     Edit11.Text :='1';
     DrawingNew0(strtoint(Edit11.Text)-1);
     Groupbox5.Enabled :=true;
    end;
  Aarray_Rectangle_onePNL1.Free;
  messagedlg('运算完成，运行时间为'+format('%.1f',[24*3600*(now-vtime)])+'秒!',mtinformation,[mbok],0);
end;

procedure TFrmPCBCut.DrawingNew0(i:integer);
var
  pnl_size_s2:pnl_size;//定义记录
  var_Sheet_Size_OnePNL:Sheet_Size_twoPNL_1;//定义记录
begin
try
  Label30.Caption :='0';
  Label32.Caption :='0';
  //显示编排结果
  Edit5.Text:=currtostr( Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].PNLA_Long);
  Edit6.Text:=currtostr( Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].PNLA_Width);
  SpinEdit2.Text:=currtostr( Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].PNLA_Long);
  SpinEdit3.Text:=currtostr( Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].PNLA_Width);
  SpinEdit4.Enabled :=false;
  SpinEdit5.Enabled :=false;
  Label7.Caption :=currtostr( Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].PNLA_Unit_Long_Number
    *Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].PNLA_Unit_width_Number);
  Label9.Caption :=currtostr( (Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].One_Section_Unit_Number
  +Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Two_Section_Unit_Number
  +Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].three_Section_Unit_Number)/
    Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].PNLA_Unit_Long_Number / Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].PNLA_Unit_width_Number);
  Label36.Caption :=currtostr( strtoint(Label7.Caption)*strtoint(Label9.Caption)+strtoint(Label32.Caption)*strtoint(Label30.Caption));
  Label38.Caption :=currtostr( strtoint(Label9.Caption)+strtoint(Label30.Caption));
  Label14.Caption :=currtostr(100*Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Using_Rate);
  Label16.Caption :=currtostr(Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Sheet_Long);
  Label59.Caption :=currtostr(Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Sheet_Width);
  groupbox5.Enabled:=true;

  //画排版图
  pnl_size_s2.Long1:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].PNLA_Long;//取结果,PNLA长
  pnl_size_s2.Width1:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].PNLA_Width;//取结果,PNLA宽
  pnl_size_s2.Unit_Long:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].PNLA_Unit_Long;//取结果,PNLA单元长
  pnl_size_s2.Unit_Width:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].PNLA_Unit_Width;//取结果,PNLA单元宽
  pnl_size_s2.Unit_Long_ToUnit_Space:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].PNLA_Unit_Long_Space;//取结果,PNLA单元长间距
  pnl_size_s2.Unit_Width_ToUnit_Space:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].PNLA_Unit_Width_Space;//取结果,PNLA单元宽间距
  pnl_size_s2.Unit_Long_PNL_Space:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].PNLA_Unit_Long_ToPNL;//取结果,PNLA单元长到边距离
  pnl_size_s2.Unit_Width_PNL_Space:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].PNLA_Unit_Width_ToPNL;//取结果,PNLA单元宽到边距离
  pnl_size_s2.Unit_Long_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].PNLA_Unit_Long_Number;//取结果,PNLA单元长个数
  pnl_size_s2.Unit_Width_number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].PNLA_Unit_Width_Number;//取结果,PNLA单元宽个数
  Draw_Picture1:=TDraw_Picture.Create ;
  Draw_Picture1.Input_pnl_size:=pnl_size_s2; //输入PNLA尺寸,用于画PNLA排版图

  //image1.Stretch:=false;
  Image2.Canvas.Rectangle(0,0,Image2.Width,Image2.Height);//清除内容
  Draw_Picture1.Draw_PNL_Picture(Image2.Canvas ,Image2.Width ,Image2.Height ); //画PNLA排版图,其中image1代表所要画的地方
  Image8.Canvas.Rectangle(0,0,Image8.Width,Image8.Height);//清除内容
  //showmessage(inttostr(image1.Height));
  //image1.Stretch:=true;
  //画开料图
  var_Sheet_Size_OnePNL.One_PNLA_Long:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].One_Section_Long;  //300;   //一区PNLA长
  var_Sheet_Size_OnePNL.One_PNLA_Width:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].One_Section_Width;//  250;  //一区PNLA宽
  var_Sheet_Size_OnePNL.One_PNLA_Long_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].One_Section_Long_Number;//  1;//一区PNLA长个数
  var_Sheet_Size_OnePNL.One_PNLA_Width_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].One_Section_Width_Number;//  2;//一区PNLA宽个数
  var_Sheet_Size_OnePNL.Two_PNLA_Long:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].Two_Section_LongA;//  300;
  var_Sheet_Size_OnePNL.Two_PNLA_Width:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].Two_Section_WidthA;//  150;
  var_Sheet_Size_OnePNL.Two_PNLA_Long_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].Two_Section_Long_NumberA;//  3;
  var_Sheet_Size_OnePNL.Two_PNLA_Width_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].Two_Section_Width_NumberA;//  1 ;
  var_Sheet_Size_OnePNL.Two_PNLB_Long:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].Two_Section_Longb;//  350;
  var_Sheet_Size_OnePNL.Two_PNLB_Width:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].Two_Section_Widthb;//  200;
  var_Sheet_Size_OnePNL.Two_PNLB_Long_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].Two_Section_Long_NumberB;//  2;
  var_Sheet_Size_OnePNL.Two_PNLB_Width_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].Two_Section_Width_NumberB;//  1;
  var_Sheet_Size_OnePNL.Three_PNLA_Long:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].Three_Section_LongA;//  230;
  var_Sheet_Size_OnePNL.Three_PNLA_Width:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].Three_Section_WidthA;//  240;
  var_Sheet_Size_OnePNL.Three_PNLA_Long_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].Three_Section_Long_NumberA; // 5;
  var_Sheet_Size_OnePNL.Three_PNLA_Width_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].Three_Section_Width_NumberA;//  1;
  var_Sheet_Size_OnePNL.Three_PNLB_Long:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].Three_Section_Longb;//280;
  var_Sheet_Size_OnePNL.Three_PNLB_Width:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].Three_Section_Widthb;//190;
  var_Sheet_Size_OnePNL.Three_PNLB_Long_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].Three_Section_Long_Numberb; //4;
  var_Sheet_Size_OnePNL.Three_PNLB_Width_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].Three_Section_Width_Numberb;//1;
  var_Sheet_Size_OnePNL.Sheet_Long:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].Sheet_Long;//  1220;
  var_Sheet_Size_OnePNL.Sheet_Width:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].Sheet_Width;//  1040;
  var_Sheet_Size_OnePNL.Two_Section_Array_type:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].Two_Section_Array_type;
  var_Sheet_Size_OnePNL.Three_Section_Array_type:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].Three_Section_Array_type;
  var_Sheet_Size_OnePNL.Draw_type:=Tem_Result_makeup_using_Sheet_OnePNL_t1[i].Draw_type;

  Draw_Picture1.Sheet_Size_TwoPNL:=var_Sheet_Size_OnePNL;//输入计算结果,用于画开料图
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);//清除内容
  Draw_Picture1.Draw_Sheet_onePNL_Picture(Image1.Canvas ,Image1.Width ,Image1.Height);

  Draw_Picture1.Free;
except
end;
end;

procedure TFrmPCBCut.SpeedButton1Click(Sender: TObject);
begin
  Image1.Picture :=Image14.Picture ;
  Image2.Picture :=Image14.Picture ;
  Image8.Picture :=Image14.Picture ;
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);//清除内容
  Image2.Canvas.Rectangle(0,0,Image2.Width,Image2.Height);//清除内容
  Image8.Canvas.Rectangle(0,0,Image8.Width,Image8.Height);//清除内容
  ttype.Caption :='0';    //代表自动拼版
 try
  if (stringgrid1.RowCount<=1) then
   begin
    messagedlg('请首先定义大料的拼版尺寸！',mterror,[mbcancel],0);
    exit;
   end;
  
  if (trim(edit1.Text)='0') or (trim(edit1.Text)='') then
  begin
    messagedlg('请输入UNI长度！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    edit1.SetFocus ;
    exit;
  end;
  if (trim(edit3.Text)='0') or (trim(edit3.Text)='') then
  begin
    messagedlg('请输入UNI宽度！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    edit3.SetFocus ;
    exit;
  end;
  if trim(combobox3.Text)='' then
  begin
    messagedlg('请输入长边间距！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    combobox3.SetFocus ;
    exit;
  end;
  if trim(combobox5.Text)='' then
  begin
    messagedlg('请输入短边间距！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    combobox5.SetFocus ;
    exit;
  end;
  if trim(combobox6.Text)='' then
  begin
    messagedlg('请输入边长上限！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    combobox6.SetFocus ;
    exit;
  end;
  if trim(combobox7.Text)='' then
  begin
    messagedlg('请输入边长下限！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    combobox7.SetFocus ;
    exit;
  end;
  if trim(combobox8.Text)='' then
  begin
    messagedlg('请输入边宽上限！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    combobox8.SetFocus ;
    exit;
  end;
  if trim(combobox9.Text)='' then
  begin
    messagedlg('请输入边宽下限！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    combobox9.SetFocus ;
    exit;
  end;
  if trim(combobox11.Text)='' then
  begin
    messagedlg('请输入长边边边框宽度！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    combobox11.SetFocus ;
    exit;
  end;
  if trim(combobox13.Text)='' then
  begin
    messagedlg('请输入短边边框宽度！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    combobox13.SetFocus ;
    exit;
  end;
  if strtofloat(trim(combobox6.Text))<strtofloat(trim(combobox7.Text)) then
  begin
    messagedlg('边长上限不能小于边长下限！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    combobox6.SetFocus ;
    exit;
  end;
  if strtofloat(trim(combobox8.Text))<strtofloat(trim(combobox9.Text)) then
  begin
    messagedlg('边宽上限不能小于边宽下限！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    combobox8.SetFocus ;
    exit;
  end;
 except
  messagedlg('输入了无效的数量格式！',mtinformation,[mbok],0);
  exit;
 end;
 if checkbox1.Checked then
  if checkbox3.Checked  then
    ProgressBar1.Max:=2000 else ProgressBar1.Max:=1000
 else
  if checkbox3.Checked  then
    ProgressBar1.Max:=1000 else ProgressBar1.Max:=500;
  if Spinedit1.Text ='1' then
    DrawOnePnl
  else
    DrawTwoPnl;

 SpeedButton3.enabled:=True;
 SpeedButton6.enabled:=True;
 RectangleButtonClick(sender);
 RectangleButton.Down :=true;
 Pagecontrol2.ActivePageIndex :=2;
end;

procedure TFrmPCBCut.DrawTwoPnl();
var 
  Input_PCB_SIZE_TwoPNL22:Input_PCB_SIZE_TwoPNL_1;//定义记录
  Input_Sheet_Size_15:Input_Sheet_Size_TwoPNL_1;//定义记录
  i,row:integer;
  pnl_size_s1:pnl_size;//此记录用于画排版图

begin
      Edit11.Text :='1';

      vimag1:=0;
      vimag2:=0;
      vimag8:=0;
      SpeedButton20.Enabled :=false;

      vtime:=now;
      vPanels:=0;

      Input_PCB_SIZE_TwoPNL22.Unit_Long:=strtocurr(edit1.text); //单元长
      Input_PCB_SIZE_TwoPNL22.Unit_Width:=strtocurr(edit3.text); //单元宽
      Input_PCB_SIZE_TwoPNL22.Unit_Long_Space:=strtocurr(combobox3.text);//单元长间距
      Input_PCB_SIZE_TwoPNL22.Unit_Width_Space:=strtocurr(combobox5.text);//单元宽间距
      Input_PCB_SIZE_TwoPNL22.Unit_Long_ToPNL:=strtocurr(combobox11.text);//单元长到边距离
      Input_PCB_SIZE_TwoPNL22.Unit_Width_ToPNL:=strtocurr(combobox13.text);//单元宽到边距离
      Input_PCB_SIZE_TwoPNL22.PNLA_Long_Max:=strtocurr(combobox6.text);//PNLA长上限
      Input_PCB_SIZE_TwoPNL22.PNLA_Width_Max:=strtocurr(combobox8.text);//PNLA宽上限
      Input_PCB_SIZE_TwoPNL22.PNLA_Long_Min:=strtocurr(combobox7.text); //PNLA长下限
      Input_PCB_SIZE_TwoPNL22.PNLA_Width_Min:=strtocurr(combobox9.text);//PNLA宽下限
      Input_PCB_SIZE_TwoPNL22.PNLB_Long_Max:=strtocurr(combobox1.text);//PNLB长上限
      Input_PCB_SIZE_TwoPNL22.PNLB_Width_Max:=strtocurr(combobox4.text);//PNLB宽上限
      Input_PCB_SIZE_TwoPNL22.PNLB_Long_Min:=strtocurr(combobox2.text); //PNLB长下限
      Input_PCB_SIZE_TwoPNL22.PNLB_Width_Min:=strtocurr(combobox10.text); //PNLB宽下限

      Aarray_Rectangle_TwoPNL1:=TAarray_Rectangle_TwoPNL1.Create;//建立类

  i:=0;
  for row:=1 to stringgrid1.RowCount-1 do
  if trim(stringgrid1.Cells[2,row])='Y' then
   begin
    Input_Sheet_Size_15.Sheet_Long:= strtofloat(stringgrid1.Cells[0,row]);  //Sheet_L;//大料长
    Input_Sheet_Size_15.Sheet_Width:=strtofloat(stringgrid1.Cells[1,row]);   //Sheet_W;//大料宽
    Aarray_Rectangle_TwoPNL1.Input_Sheet_Size[i]:=Input_Sheet_Size_15; //输入要求计算的大料尺寸,注意用数组表示
    i:=i+1;
   end;

      Aarray_Rectangle_TwoPNL1.Input_PCB_SIZE:=Input_PCB_SIZE_TwoPNL22;//输入要求计算的单元尺寸等信息
      Aarray_Rectangle_TwoPNL1.Calculate_Array_Complete_Percent:=ProgressBar1; //用于显示进度
      Aarray_Rectangle_TwoPNL1.Calculate_Array_Complete_Time_Display:=true;//显示计算时间
      Aarray_Rectangle_TwoPNL1.Echange_Unit_To_Unit_Space:=false;//交换单元间距
      Aarray_Rectangle_TwoPNL1.Echange_Unit_To_PNL_Space:=checkbox1.Checked;//交换单到边距离
      Aarray_Rectangle_TwoPNL1.Calculate_Rate_Type:=1;//0用单元计算利用率2用PNL计算利用率,暂时不起作用

      Aarray_Rectangle_TwoPNL1.Change_PNL_Long_Width:= not checkbox3.Checked;//false长边上限对单元,宽边对宽边上限;TRUE没有对应关系
      Aarray_Rectangle_TwoPNL1.No_Calculate_Falchion_Number:=true;//false长边上限对单元,宽边对宽边上限;TRUE没有对应关系

      Aarray_Rectangle_TwoPNL1.Calculate_Array;//计算

      for i:=low(Tem_tresult_makeup_using_Sheet_TwoPNL_1) to high(Tem_tresult_makeup_using_Sheet_TwoPNL_1) do
      Try
       Tem_tresult_makeup_using_Sheet_TwoPNL_1[i]:=
         Aarray_Rectangle_TwoPNL1.Calculate_Result[i];//将计算结果赋给全局变量

       if ((Aarray_Rectangle_TwoPNL1.Calculate_Result[i].PNLA_Long=
          Aarray_Rectangle_TwoPNL1.Calculate_Result[i].PNLB_Long) and
           (Aarray_Rectangle_TwoPNL1.Calculate_Result[i].PNLA_Width=
           Aarray_Rectangle_TwoPNL1.Calculate_Result[i].PNLB_Width)) or

         ((Aarray_Rectangle_TwoPNL1.Calculate_Result[i].PNLA_Long=
          Aarray_Rectangle_TwoPNL1.Calculate_Result[i].PNLB_Width) and
           (Aarray_Rectangle_TwoPNL1.Calculate_Result[i].PNLA_Width=
           Aarray_Rectangle_TwoPNL1.Calculate_Result[i].PNLB_Long)) then
        begin
         Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLB_Unit_Long:=0;
         Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLB_Unit_Width:=0;
         Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLB_Unit_Long_Space:=0;
         Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLB_Unit_Width_Space:=0;
         Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLB_Unit_Long_ToPNL:=0;
         Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLB_Unit_Width_ToPNL:=0;
         Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLB_Unit_Long_Number:=0;
         Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLB_Unit_Width_Number:=0;
         Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLB_Long:=0;
         Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLB_Width:=0;
         Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLB_number_Per_Sheet:=0;
        end;
      except
      end;

    label58.Caption:='21';
    for i:=0 to 20 do
      if Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLA_Unit_Long_Number=0 then
      begin
        label58.Caption :=inttostr(i+1);
        break;
      end;
    if Edit11.text>'0' then
    begin
      Edit11.Text :='1';
      DrawingNew(strtoint(Edit11.Text)-1);
      Groupbox5.Enabled :=true;
    end;
    messagedlg('运算完成，运行时间为'+format('%.1f',[24*3600*(now-vtime)])+'秒!',mtinformation,[mbok],0);

end;

procedure TFrmPCBCut.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  wimage:=sender as timage;
   //将鼠标当前的坐标显示在窗体标题上
  if fDrag then
  IF label43.Caption ='0' then
  begin
    DrawShape1(Wimage,Origin, MovePt, pmNotXor);
    MovePt := Point(X, Y);
    DrawShape1(Wimage,Origin, MovePt, pmNotXor);
  end else
  begin
    MovePt := Point(X, Y);
    DrawShape1(Wimage,Origin, MovePt, pmwhite);
  end;
  StatusBar1.Panels[0].Text := Format('当前坐标: (%d, %d)', [X, Y]);
end;

procedure TFrmPCBCut.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  wimage:=sender as timage;
  Image9.Picture:= WImage.Picture;
  if Button = mbLeft then
  begin
    fDrag := True;

    wimage.Canvas.MoveTo(X, Y);
    Origin := Point(X, Y);
    //取得要绘制图形的起点

    MovePt := Origin;
    StatusBar1.Panels[0].Text := Format('Origin: (%d, %d)', [X, Y]);
  end;
  SpeedButton8.Enabled :=true;
end;

procedure TFrmPCBCut.TabSheet2Show(Sender: TObject);
begin
  image1.Cursor :=WImage.Cursor;
  WImage:=image1;
  Image1.Canvas.Pen.Width := PenWidth.Position;
end;

procedure TFrmPCBCut.TabSheet1Show(Sender: TObject);
begin
  image2.Cursor :=WImage.Cursor;
  WImage:=image2;
  Image2.Canvas.Pen.Width := PenWidth.Position;
end;

procedure TFrmPCBCut.SpeedButton4Click(Sender: TObject);
begin
  if strtoint(edit11.Text)>1 then
  begin
    Edit11.Text :=inttostr(strtoint(edit11.Text)-1);
    if SpinEdit1.Text ='2' then
      DrawingNew(strtoint(Edit11.Text)-1)
    else
      DrawingNew0(strtoint(Edit11.Text)-1);
  end;
  if Edit11.Text <='1' then
  begin
    SpeedButton4.enabled:=false;
    SpeedButton5.enabled:=false;
  end;
  SpeedButton3.enabled:=True;
  SpeedButton6.enabled:=True;
end;

procedure TFrmPCBCut.PCBDrawing();
begin
end;

procedure TFrmPCBCut.SpeedButton3Click(Sender: TObject);
begin
  if strtoint(edit11.Text)<strtoint(label58.Caption) then
  begin
    Edit11.Text :=inttostr(strtoint(edit11.Text)+1);
    if SpinEdit1.Text ='2' then
      DrawingNew(strtoint(Edit11.Text)-1)
    else
      DrawingNew0(strtoint(Edit11.Text)-1);
  end  else
  begin
    SpeedButton3.enabled:=false;
    SpeedButton6.enabled:=false;
  end;
  SpeedButton4.enabled:=True;
  SpeedButton5.enabled:=True;
end;

procedure TFrmPCBCut.SpeedButton6Click(Sender: TObject);
begin
  Edit11.Text :=label58.Caption;
  if SpinEdit1.Text ='2' then
    DrawingNew(strtoint(Edit11.Text)-1)
  else
    DrawingNew0(strtoint(Edit11.Text)-1);
  SpeedButton3.enabled:=false;
  SpeedButton6.enabled:=false;
  SpeedButton4.enabled:=True;
  SpeedButton5.enabled:=True;
end;

procedure TFrmPCBCut.SpeedButton5Click(Sender: TObject);
begin
if SpinEdit1.Text ='2' then
 if strtoint(edit11.Text)>1 then
 begin
    Edit11.Text :='1'  ;
    DrawingNew(strtoint(Edit11.Text)-1);
 end else
else
 if strtoint(edit11.Text)>1 then
 begin
    Edit11.Text :='1'  ;
    DrawingNew0(strtoint(Edit11.Text)-1);
 end;
  SpeedButton4.enabled:=false;
  SpeedButton5.enabled:=false;
  SpeedButton3.enabled:=True;
  SpeedButton6.enabled:=True;
end;

procedure TFrmPCBCut.DrawingNew(i:integer);
var
  var_Sheet_Size_TwoPNL:Sheet_Size_TwoPNL_1;//定义记录
  pnl_size_s1:pnl_size;
begin
try
  //显示编排结果
  Edit5.Text:=currtostr( Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].PNLA_Long);
  Edit6.Text:=currtostr( Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].PNLA_Width);
  SpinEdit2.Text:=currtostr( Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].PNLA_Long);
  SpinEdit3.Text:=currtostr( Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].PNLA_Width);
  if Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].PNLB_number_Per_Sheet>0 then
  begin
    Edit7.Text:=currtostr( Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].PNLB_Long);
    Edit8.Text:=currtostr( Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].PNLB_Width);
    SpinEdit4.Text:=currtostr( Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].PNLB_Long);
    SpinEdit5.Text:=currtostr( Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].PNLB_Width);
  end else
  begin
    Edit7.Text:='0';
    Edit8.Text:='0';
    SpinEdit4.Text:='0';
    SpinEdit5.Text:='0';
  end;
  SpinEdit4.Enabled :=true;
  SpinEdit5.Enabled :=true;
  Label7.Caption :=currtostr( Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].PNLA_Unit_Long_Number
    *Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].PNLA_Unit_width_Number);
  Label9.Caption :=currtostr( Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].PNLA_number_Per_Sheet);
  Label30.Caption :=currtostr( Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].PNLB_number_Per_Sheet);
  if Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].PNLB_number_Per_Sheet=0 then
    Label32.Caption :='0'
  else
    Label32.Caption :=currtostr( Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].PNLB_Unit_Long_Number
      *Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].PNLB_Unit_width_Number);
  Label36.Caption :=currtostr( strtoint(Label7.Caption)*strtoint(Label9.Caption)+strtoint(Label32.Caption)*strtoint(Label30.Caption));
  Label38.Caption :=currtostr( strtoint(Label9.Caption)+strtoint(Label30.Caption));
  Label14.Caption :=currtostr(100*Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].Using_Rate);
  Label16.Caption :=currtostr(Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].Sheet_Long);
  Label59.Caption :=currtostr(Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].Sheet_Width);
  groupbox5.Enabled:=true;

  //画排版图    计算结果最多十组Aarray_Rectangle_TwoPNL1.Calculate_Result[n]:n10,0最大,10最小
  pnl_size_s1.Long1:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLA_Long;//取结果,PNLA长
  pnl_size_s1.Width1:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLA_Width;//取结果,PNLA宽
  pnl_size_s1.Unit_Long:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLA_Unit_Long;//取结果,PNLA单元长
  pnl_size_s1.Unit_Width:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLA_Unit_Width;//取结果,PNLA单元宽
  pnl_size_s1.Unit_Long_ToUnit_Space:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLA_Unit_Long_Space;//取结果,PNLA单元长间距
  pnl_size_s1.Unit_Width_ToUnit_Space:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLA_Unit_Width_Space;//取结果,PNLA单元宽间距
  pnl_size_s1.Unit_Long_PNL_Space:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLA_Unit_Long_ToPNL;//取结果,PNLA单元长到边距离
  pnl_size_s1.Unit_Width_PNL_Space:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLA_Unit_Width_ToPNL;//取结果,PNLA单元宽到边距离
  pnl_size_s1.Unit_Long_Number:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLA_Unit_Long_Number;//取结果,PNLA单元长个数
  pnl_size_s1.Unit_Width_number:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLA_Unit_Width_Number;//取结果,PNLA单元宽个数
  Draw_Picture1:=TDraw_Picture.Create ;
  Draw_Picture1.Input_pnl_size:=pnl_size_s1; //输入PNLA尺寸,用于画PNLA排版图

  Image2.Canvas.Rectangle(0,0,Image2.Width,Image2.Height);//清除内容
  Draw_Picture1.Draw_PNL_Picture(Image2.Canvas ,Image2.Width ,Image2.Height ); //画PNLA排版图,其中image1代表所要画的地方
  //画排版图
  pnl_size_s1.Long1:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLb_Long;
  pnl_size_s1.Width1:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLb_Width;
  pnl_size_s1.Unit_Long:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLb_Unit_Long;
  pnl_size_s1.Unit_Width:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLb_Unit_Width;
  pnl_size_s1.Unit_Long_ToUnit_Space:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLb_Unit_Long_Space;
  pnl_size_s1.Unit_Width_ToUnit_Space:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLb_Unit_Width_Space;
  pnl_size_s1.Unit_Long_PNL_Space:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLb_Unit_Long_ToPNL;
  pnl_size_s1.Unit_Width_PNL_Space:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLb_Unit_Width_ToPNL;
  pnl_size_s1.Unit_Long_Number:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLb_Unit_Long_Number;
  pnl_size_s1.Unit_Width_number:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].PNLb_Unit_Width_Number;

  Draw_Picture1.Input_pnl_size:=pnl_size_s1; //输入PNLB尺寸,用于画PNLB排版图
  Image8.Canvas.Rectangle(0,0,Image8.Width,Image8.Height);//清除内容

  if  (pnl_size_s1.Long1<>0) and (pnl_size_s1.Width1<>0) then
  Draw_Picture1.Draw_PNL_Picture(Image8.Canvas ,Image8.Width ,Image8.Height );

  //画开料图
  var_Sheet_Size_TwoPNL.One_PNLA_Long:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].One_Section_Long;  //300;   //一区PNLA长
  var_Sheet_Size_TwoPNL.One_PNLA_Width:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].One_Section_Width;//  250;  //一区PNLA宽
  var_Sheet_Size_TwoPNL.One_PNLA_Long_Number:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].One_Section_Long_Number;//  1;//一区PNLA长个数
  var_Sheet_Size_TwoPNL.One_PNLA_Width_Number:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].One_Section_Width_Number;//  2;//一区PNLA宽个数
  var_Sheet_Size_TwoPNL.Two_PNLA_Long:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].Two_Section_LongA;//  300;
  var_Sheet_Size_TwoPNL.Two_PNLA_Width:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].Two_Section_WidthA;//  150;
  var_Sheet_Size_TwoPNL.Two_PNLA_Long_Number:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].Two_Section_Long_NumberA;//  3;
  var_Sheet_Size_TwoPNL.Two_PNLA_Width_Number:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].Two_Section_Width_NumberA;//  1 ;
  var_Sheet_Size_TwoPNL.Two_PNLB_Long:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].Two_Section_Longb;//  350;
  var_Sheet_Size_TwoPNL.Two_PNLB_Width:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].Two_Section_Widthb;//  200;
  var_Sheet_Size_TwoPNL.Two_PNLB_Long_Number:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].Two_Section_Long_NumberB;//  2;
  var_Sheet_Size_TwoPNL.Two_PNLB_Width_Number:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].Two_Section_Width_NumberB;//  1;
  var_Sheet_Size_TwoPNL.Three_PNLA_Long:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].Three_Section_LongA;//  230;
  var_Sheet_Size_TwoPNL.Three_PNLA_Width:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].Three_Section_WidthA;//  240;
  var_Sheet_Size_TwoPNL.Three_PNLA_Long_Number:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].Three_Section_Long_NumberA; // 5;
  var_Sheet_Size_TwoPNL.Three_PNLA_Width_Number:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].Three_Section_Width_NumberA;//  1;
  var_Sheet_Size_TwoPNL.Three_PNLB_Long:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].Three_Section_Longb;//280;
  var_Sheet_Size_TwoPNL.Three_PNLB_Width:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].Three_Section_Widthb;//190;
  var_Sheet_Size_TwoPNL.Three_PNLB_Long_Number:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].Three_Section_Long_Numberb; //4;
  var_Sheet_Size_TwoPNL.Three_PNLB_Width_Number:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].Three_Section_Width_Numberb;//1;
  var_Sheet_Size_TwoPNL.Sheet_Long:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].Sheet_Long;//  1220;
  var_Sheet_Size_TwoPNL.Sheet_Width:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].Sheet_Width;//  1040;
  var_Sheet_Size_TwoPNL.Two_Section_Array_type:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].Two_Section_Array_type;
  var_Sheet_Size_TwoPNL.Three_Section_Array_type:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].Three_Section_Array_type;
  var_Sheet_Size_TwoPNL.Draw_type:=Tem_tresult_makeup_using_Sheet_TwoPNL_1[i].Draw_type;

  Draw_Picture1.Sheet_Size_TwoPNL:=var_Sheet_Size_TwoPNL;//输入计算结果,用于画开料图
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);//清除内容

  Draw_Picture1.Draw_Sheet_TwoPNL_Picture(Image1.Canvas ,Image1.Width ,Image1.Height);

  if Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].PNLB_number_Per_Sheet=0 then
    Image8.picture:= Image3.Picture;
except
end;
end;

procedure TFrmPCBCut.FormShow(Sender: TObject);
var
  Jpg:TjpegImage;
  bmp:tbitmap;
  Stream:TMemoryStream;
begin
 // if  FrmMain.isnew.Caption ='2' then speedbutton2.Visible :=false;
   //检查状态
  Edit1.SetFocus;
  Edit1.SelectAll ;
  Adoquery7.Open;//材料库存

  if not dm.ads502.IsEmpty then
  With dm.ads502 do
  begin
   Jpg:=TjpegImage.Create;
   Stream:=TMemoryStream.Create ;
   bmp:=TBitMap.Create;

   dm.ads502sheet_BMP.SaveToStream(Stream);
   Stream.Position:=0;
   jpg.LoadFromStream(Stream);
   jpg.DIBNeeded;
   bmp.Assign(jpg);
   image1.Picture.Bitmap.Assign(bmp);
   stream.Clear;

   dm.ads502pnl_bmp.SaveToStream(Stream);
   Stream.Position:=0;
   jpg.LoadFromStream(Stream);
   jpg.DIBNeeded;
   bmp.Assign(jpg);
   image2.Picture.Bitmap.Assign(bmp);
   stream.Clear;

   if dm.ads502UPANEL_2.Value>0 then
   begin
    dm.ads502pnl2_bmp.SaveToStream(Stream);
    Stream.Position:=0;
    jpg.LoadFromStream(Stream);
    jpg.DIBNeeded;
    bmp.Assign(jpg);
    image8.Picture.Bitmap.Assign(bmp);

    spinedit1.Value:=2;
    spinedit4.Enabled:=true;
    spinedit5.Enabled:=true;
    Edit7.text :=Fieldbyname('pnl_len_2').asString;
    Edit8.text :=Fieldbyname('pnl_wth_2').asString;
    SpinEdit4.text :=Fieldbyname('pnl_len_2').asString;
    SpinEdit5.text :=Fieldbyname('pnl_wth_2').asString;
   end;

   label7.Caption :=Fieldbyname('upanel').asString;
   label9.Caption :=Fieldbyname('total_pnls_1').asString;
   label32.Caption :=Fieldbyname('upanel_2').asString;
   label30.Caption :=Fieldbyname('total_pnls_2').asString;
   label36.Caption :=floattostr(Fieldbyname('upanel').asInteger*
                      Fieldbyname('total_pnls_1').asinteger+
                      Fieldbyname('upanel_2').asInteger*
                      Fieldbyname('total_pnls_2').asinteger);
    label38.Caption :=floattostr(Fieldbyname('total_pnls_1').asInteger+
                      Fieldbyname('total_pnls_2').asinteger);
    label14.Caption :=format('%.2f',[(Fieldbyname('tusage').asfloat)]);
    Edit5.text :=Fieldbyname('pnl_len').asString;
    Edit6.text :=Fieldbyname('pnl_wth').asString;
    SpinEdit2.text :=Fieldbyname('pnl_len').asString;
    SpinEdit3.text :=Fieldbyname('pnl_wth').asString;
    COMBOBOX3.Text :=Fieldbyname('minspace1').asString;
    COMBOBOX5.Text :=Fieldbyname('minspace2').asString;
    Radiogroup3.ItemIndex :=Fieldbyname('unit_unit').asinteger;
    label16.Caption :=Fieldbyname('sht_len').asString;
    label59.Caption :=Fieldbyname('sht_WTH').asString;
  end;
  
  Adoquery9.Open ;
  with adoquery9 do
   begin
    Radiogroup5.ItemIndex :=Fieldbyname('cut_unit_tp').AsInteger;
    combobox6.Text :=Fieldbyname('cut_l1_max').AsString;
    combobox7.Text :=Fieldbyname('cut_l1_min').AsString;
    combobox8.Text :=Fieldbyname('cut_w1_max').AsString;
    combobox9.Text :=Fieldbyname('cut_w1_min').AsString;
    combobox1.Text :=Fieldbyname('cut_l2_max').AsString;
    combobox2.Text :=Fieldbyname('cut_l2_min').AsString;
    combobox4.Text :=Fieldbyname('cut_w2_max').AsString;
    combobox10.Text :=Fieldbyname('cut_w2_min').AsString;
    combobox11.Text :=Fieldbyname('border_l_min').AsString;
    combobox13.Text :=Fieldbyname('border_w_min').AsString;
    if dm.ads502.IsEmpty then
    begin
     COMBOBOX3.Text :=adoquery9.Fieldbyname('space_l_min').asString;
     COMBOBOX5.Text :=adoquery9.Fieldbyname('space_w_min').asString;
    end;
   end;
end;

procedure TFrmPCBCut.SpeedButton14Click(Sender: TObject);
begin
  close;
end;

procedure TFrmPCBCut.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
if (acol=2) then
 stringgrid1.Canvas.TextRect(rect,
        rect.Left+12,
        rect.Top,
        stringgrid1.Cells[acol,aRow]);
 if (acol=2) and (arow>0) then
  begin
   if trim(Stringgrid1.Cells[2,arow])= 'Y' then
    Stringgrid1.Canvas.Draw(rect.Left+12,rect.Top,image6.Picture.Graphic)
   else
    Stringgrid1.Canvas.Draw(rect.Left+12,rect.Top,image7.Picture.Graphic);
  end;
end;

procedure TFrmPCBCut.ComboBox6KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8]) then
    abort
  else
  begin
   if (key = chr(46)) then
    if pos('.',(Sender as tcombobox).Text)>0
     then
      abort;
  end;
end;

procedure TFrmPCBCut.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8]) then
    abort
  else
   if (key = chr(46)) then
    if pos('.',(sender as Tedit).Text)>0 then
      abort;
end;

procedure TFrmPCBCut.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;
begin
 stringgrid1.MouseToCell(x,y,column,row);
 if (Row > 0) and (column = 2) then //标题点击不算
 begin
  IF trim(stringgrid1.Cells[2,stringgrid1.row])='Y' THEN //不选
   begin
    stringgrid1.Cells[2,stringgrid1.row]:='N';
   end
  else        //放弃
   begin
    stringgrid1.Cells[2,stringgrid1.row]:='Y';
   end;
 end;
end;

procedure TFrmPCBCut.CutDesign1();//second panel cuting
var
  LEN,wth,vmin,vmax:Real;
  Real_Min_Panel_L,Real_Min_Panel_W,Real_Max_Panel_L,Real_Max_Panel_W:real;
  i,j,k:integer;
	vwth,vlen,vtemp:Real;
  vx,vy:real;
  vnumx,vnumy,vnum1,vnum2:integer;
  ix,jx:integer;

begin
  //给全局变量赋值
  IF RadioGroup5.ItemIndex=1 then begin
    Panel_1_Max:=strtofloat(Combobox1.text)*25.4;
    Panel_1_Min:=strtofloat(Combobox2.text)*25.4;
    Panel_2_Max:=strtofloat(Combobox4.text)*25.4;
    Panel_2_Min:=strtofloat(Combobox10.text)*25.4;
  end else
  begin
    Panel_1_Max:=strtofloat(Combobox1.text);
    Panel_1_Min:=strtofloat(Combobox2.text);
    Panel_2_Max:=strtofloat(Combobox4.text);
    Panel_2_Min:=strtofloat(Combobox10.text);
  end;
  IF RadioGroup5.ItemIndex=1 then begin
    Panel_Border_L_Min:=strtofloat(Combobox11.text)*25.4;
    Panel_Border_S_Min:=strtofloat(Combobox13.text)*25.4;
  end else
  begin
    Panel_Border_L_Min:=strtofloat(Combobox11.text);
    Panel_Border_S_Min:=strtofloat(Combobox13.text);
  end;
  Real_Max_Unit_L:=max(Unit_L,Unit_W)+Unit_Space_S_Min;
  Real_Min_Unit_L:=min(Unit_L,Unit_W)+Unit_Space_L_Min;

  //用 Real_Max_Unit_L 填充边Panel_1, 用 Real_Min_Unit_L 填充边Panel_2 ,Panel_1边宽为Panel_Border_L_Min
  Real_Min_Panel_L:=Real_Max_Unit_L+2*Panel_Border_S_Min;
  while  Real_Min_Panel_L<=Panel_1_Min do
  begin
  	Real_Min_Panel_L:=Real_Max_Unit_L+Real_Min_Panel_L;
  	if Real_Min_Panel_L> Panel_1_Min then	break;
  END;
  Real_Max_Panel_L:=Real_Min_Panel_L;
  while  Real_Max_Panel_L<=Panel_1_Max do
  begin
  	Real_Max_Panel_L:=Real_Max_Unit_L+Real_Max_Panel_L;
  	IF Real_Max_Panel_L> Panel_1_Max then  break;
  end;
  Real_Min_Panel_W:=Real_Min_Unit_L+2*Panel_Border_L_Min;
  while  Real_Min_Panel_W<=Panel_2_Min do
  begin
  	Real_Min_Panel_W:=Real_Min_Unit_L+Real_Min_Panel_W;
  	if Real_Min_Panel_W> Panel_2_Min then break;
  end;
  Real_Max_Panel_W:=Real_Min_Panel_W;
  while  Real_Max_Panel_W<=Panel_2_Max do
  begin
  	Real_Max_Panel_W:=Real_Min_Unit_L+Real_Max_Panel_W;
  	IF Real_Max_Panel_W> Panel_2_Max then break;
  end;
  k:=round(Real_Max_Panel_L/Real_Max_Unit_L)-ROUND(Real_Min_Panel_L/Real_Max_Unit_L);
  if k=0 then k:=1;
  vsch1:=Real_Max_Unit_L;
  vsch2:=Real_Min_Unit_L;
  FOR i:=ROUND(Real_Min_Panel_L/Real_Max_Unit_L) to round(Real_Max_Panel_L/Real_Max_Unit_L) do
  	FOR j:=round(Real_Min_Panel_W/Real_Min_Unit_L) to round(Real_Max_Panel_W/Real_Min_Unit_L) do
    begin  //保持VWTH,VSCHNUM1总是同REAL_MAX_UNIT_L对应
  		vwth:=i*Real_Max_Unit_L-Unit_Space_S_Min+2*Panel_Border_S_Min;
	  	vlen:=j*Real_Min_Unit_L-Unit_Space_L_Min+2*Panel_Border_L_Min;
      vnum:=i*j;
	  	vschnum1:=i;
  		vschnum2:=j;
		  vschnum3:=0;
  		vschnum4:=0;
	  	IF ((vlen>=Panel_1_Min) and (vlen<=Panel_1_Max) and (vwth>=Panel_2_Min) and (vwth<=Panel_2_Max))
       or ((vlen>=Panel_2_Min) and (vlen<=Panel_2_Max) and (vwth>=Panel_1_Min) and (vwth<=Panel_1_Max))
       then
        pnl_size1(vlen,vwth);
		END;

//用 Real_Max_Unit_L 填充边Panel_2, 用 Real_Min_Unit_L 填充边Panel_1 ,Panel_1边宽为Panel_Border_L_Min
  Real_Min_Panel_L:=Real_Min_Unit_L+2*Panel_Border_L_Min;
  while  Real_Min_Panel_L<=Panel_1_Min do
  begin
  	Real_Min_Panel_L:=Real_Min_Unit_L+Real_Min_Panel_L;
  	if Real_Min_Panel_L> Panel_1_Min then	break;
  END;
  Real_Max_Panel_L:=Real_Min_Panel_L;
  while  Real_Max_Panel_L<=Panel_1_Max do
  begin
  	Real_Max_Panel_L:=Real_Min_Unit_L+Real_Max_Panel_L;
  	IF Real_Max_Panel_L> Panel_1_Max then  break;
  end;
  Real_Min_Panel_W:=Real_Max_Unit_L+2*Panel_Border_S_Min;
  while  Real_Min_Panel_W<=Panel_2_Min do
  begin
  	Real_Min_Panel_W:=Real_Max_Unit_L+Real_Min_Panel_W;
  	if Real_Min_Panel_W> Panel_2_Min then break;
  end;
  Real_Max_Panel_W:=Real_Min_Panel_W;
  while  Real_Max_Panel_W<=Panel_2_Max do
  begin
  	Real_Max_Panel_W:=Real_Max_Unit_L+Real_Max_Panel_W;
  	IF Real_Max_Panel_W> Panel_2_Max then break;
  end;
  k:=round(Real_Max_Panel_L/Real_Max_Unit_L)-ROUND(Real_Min_Panel_L/Real_Max_Unit_L);
  if k=0 then k:=1;

  vsch2:=Real_Max_Unit_L;
  vsch1:=Real_Min_Unit_L;
  FOR i:=ROUND(Real_Min_Panel_L/Real_Min_Unit_L) to round(Real_Max_Panel_L/Real_Min_Unit_L) do
  	FOR j:=round(Real_Min_Panel_W/Real_Max_Unit_L) to round(Real_Max_Panel_W/Real_Max_Unit_L) do
    begin  //保持VWTH,VSCHNUM1总是同REAL_MAX_UNIT_L对应
  		vwth:=i*Real_Min_Unit_L-Unit_Space_L_Min+2*Panel_Border_S_Min;
	  	vlen:=j*Real_Max_Unit_L-Unit_Space_S_Min+2*Panel_Border_L_Min;
      vnum:=i*j;
  		vschnum1:=i;
	  	vschnum2:=j;
		  vschnum3:=0;
  		vschnum4:=0;
	  	IF ((vlen>=Panel_1_Min) and (vlen<=Panel_1_Max) and (vwth>=Panel_2_Min) and (vwth<=Panel_2_Max))
       or ((vlen>=Panel_2_Min) and (vlen<=Panel_2_Max) and (vwth>=Panel_1_Min) and (vwth<=Panel_1_Max))
       then
        pnl_size1(vlen,vwth);
		END;

  if checkbox1.Checked =true then
  begin ///begin of if checkbox1=true
  //用 Real_Max_Unit_L 填充边Panel_1, 用 Real_Min_Unit_L 填充边Panel_2 ,Panel_1边宽为Panel_Border_S_Min
  Real_Min_Panel_L:=Real_Max_Unit_L+2*Panel_Border_L_Min;
  while  Real_Min_Panel_L<=Panel_1_Min do
  begin
  	Real_Min_Panel_L:=Real_Max_Unit_L+Real_Min_Panel_L;
  	if Real_Min_Panel_L> Panel_1_Min then	break;
  END;
  Real_Max_Panel_L:=Real_Min_Panel_L;
  while  Real_Max_Panel_L<=Panel_1_Max do
  begin
  	Real_Max_Panel_L:=Real_Max_Unit_L+Real_Max_Panel_L;
  	IF Real_Max_Panel_L> Panel_1_Max then  break;
  end;
  Real_Min_Panel_W:=Real_Min_Unit_L+2*Panel_Border_S_Min;
  while  Real_Min_Panel_W<=Panel_2_Min do
  begin
  	Real_Min_Panel_W:=Real_Min_Unit_L+Real_Min_Panel_W;
  	if Real_Min_Panel_W> Panel_2_Min then break;
  end;
  Real_Max_Panel_W:=Real_Min_Panel_W;
  while  Real_Max_Panel_W<=Panel_2_Max do
  begin
  	Real_Max_Panel_W:=Real_Min_Unit_L+Real_Max_Panel_W;
  	IF Real_Max_Panel_W> Panel_2_Max then break;
  end;
  k:=round(Real_Max_Panel_L/Real_Max_Unit_L)-ROUND(Real_Min_Panel_L/Real_Max_Unit_L);
  if k=0 then k:=1;

  vsch1:=Real_Max_Unit_L;
  vsch2:=Real_Min_Unit_L;
  FOR i:=ROUND(Real_Min_Panel_L/Real_Max_Unit_L) to round(Real_Max_Panel_L/Real_Max_Unit_L) do
  	FOR j:=round(Real_Min_Panel_W/Real_Min_Unit_L) to round(Real_Max_Panel_W/Real_Min_Unit_L) do
    begin  //保持VWTH,VSCHNUM1总是同REAL_MAX_UNIT_L对应
  		vwth:=i*Real_Max_Unit_L-Unit_Space_S_Min+2*Panel_Border_L_Min;
	  	vlen:=j*Real_Min_Unit_L-Unit_Space_L_Min+2*Panel_Border_S_Min;
      vnum:=i*j;
  		vschnum1:=i;
	  	vschnum2:=j;
		  vschnum3:=0;
  		vschnum4:=0;
	  	IF ((vlen>=Panel_1_Min) and (vlen<=Panel_1_Max) and (vwth>=Panel_2_Min) and (vwth<=Panel_2_Max))
       or ((vlen>=Panel_2_Min) and (vlen<=Panel_2_Max) and (vwth>=Panel_1_Min) and (vwth<=Panel_1_Max))
       then
        pnl_size1(vlen,vwth);
		END;

  //用 Real_Max_Unit_L 填充边Panel_2, 用 Real_Min_Unit_L 填充边Panel_1 ,Panel_1边宽为Panel_Border_L_Min
  Real_Min_Panel_L:=Real_Min_Unit_L+2*Panel_Border_S_Min;
  while  Real_Min_Panel_L<=Panel_1_Min do
  begin
  	Real_Min_Panel_L:=Real_Min_Unit_L+Real_Min_Panel_L;
  	if Real_Min_Panel_L> Panel_1_Min then	break;
  END;
  Real_Max_Panel_L:=Real_Min_Panel_L;
  while  Real_Max_Panel_L<=Panel_1_Max do
  begin
  	Real_Max_Panel_L:=Real_Min_Unit_L+Real_Max_Panel_L;
  	IF Real_Max_Panel_L> Panel_1_Max then  break;
  end;
  Real_Min_Panel_W:=Real_Max_Unit_L+2*Panel_Border_L_Min;
  while  Real_Min_Panel_W<=Panel_2_Min do
  begin
  	Real_Min_Panel_W:=Real_Max_Unit_L+Real_Min_Panel_W;
  	if Real_Min_Panel_W> Panel_2_Min then break;
  end;
  Real_Max_Panel_W:=Real_Min_Panel_W;
  while  Real_Max_Panel_W<=Panel_2_Max do
  begin
  	Real_Max_Panel_W:=Real_Max_Unit_L+Real_Max_Panel_W;
  	IF Real_Max_Panel_W> Panel_2_Max then break;
  end;
  k:=round(Real_Max_Panel_L/Real_Max_Unit_L)-ROUND(Real_Min_Panel_L/Real_Max_Unit_L);
  if k=0 then k:=1;

  vsch2:=Real_Max_Unit_L;
  vsch1:=Real_Min_Unit_L;
  FOR i:=ROUND(Real_Min_Panel_L/Real_Min_Unit_L) to round(Real_Max_Panel_L/Real_Min_Unit_L) do
  	FOR j:=round(Real_Min_Panel_W/Real_Max_Unit_L) to round(Real_Max_Panel_W/Real_Max_Unit_L) do
    begin  //保持VWTH,VSCHNUM1总是同REAL_MAX_UNIT_L对应
  		vwth:=i*Real_Min_Unit_L-Unit_Space_L_Min+2*Panel_Border_L_Min;
	  	vlen:=j*Real_Max_Unit_L-Unit_Space_S_Min+2*Panel_Border_S_Min;
      vnum:=i*j;
  		vschnum1:=i;
	  	vschnum2:=j;
		  vschnum3:=0;
  		vschnum4:=0;
	  	IF ((vlen>=Panel_1_Min) and (vlen<=Panel_1_Max) and (vwth>=Panel_2_Min) and (vwth<=Panel_2_Max))
       or ((vlen>=Panel_2_Min) and (vlen<=Panel_2_Max) and (vwth>=Panel_1_Min) and (vwth<=Panel_1_Max))
       then
        pnl_size1(vlen,vwth);
		END;
  end; ///end of if checkbox1=true
if checkbox3.Checked then
begin
  //1).用 Real_Max_Unit_L 填充边Panel_1, 用 Real_Min_Unit_L 填充边Panel_2 ,Panel_1边宽为Panel_Border_L_Min
  Real_Min_Panel_L:=Real_Max_Unit_L+2*Panel_Border_S_Min;
  while  Real_Min_Panel_L<=Panel_1_Min do
  begin
  	Real_Min_Panel_L:=Real_Max_Unit_L+Real_Min_Panel_L;
  	if Real_Min_Panel_L> Panel_1_Min then	break;
  END;
  Real_Max_Panel_L:=Real_Min_Panel_L;
  while  Real_Max_Panel_L<=Panel_1_Max do
  begin
  	Real_Max_Panel_L:=Real_Max_Unit_L+Real_Max_Panel_L;
  	IF Real_Max_Panel_L> Panel_1_Max then  break;
  end;
  if Real_Max_Panel_L=Real_Min_Panel_L then
    Real_Min_Panel_L:=Real_Min_Panel_L-Real_Max_Unit_L;
  Real_Min_Panel_W:=Real_Min_Unit_L+2*Panel_Border_L_Min;
  while  Real_Min_Panel_W<=Panel_2_Min do
  begin
  	Real_Min_Panel_W:=Real_Min_Unit_L+Real_Min_Panel_W;
  	if Real_Min_Panel_W> Panel_2_Min then break;
  end;
  Real_Max_Panel_W:=Real_Min_Panel_W;
  while  Real_Max_Panel_W<=Panel_2_Max do
  begin
  	Real_Max_Panel_W:=Real_Min_Unit_L+Real_Max_Panel_W;
  	IF Real_Max_Panel_W> Panel_2_Max then break;
  end;
  if Real_Max_Panel_W=Real_Min_Panel_W then
    Real_Min_Panel_W:=Real_Min_Panel_W-Real_Min_Unit_L;

  k:=round(Real_Max_Panel_L/Real_Max_Unit_L)-ROUND(Real_Min_Panel_L/Real_Max_Unit_L);
  if k=0 then k:=1;

  FOR i:=ROUND(Real_Min_Panel_L/Real_Max_Unit_L) to round(Real_Max_Panel_L/Real_Max_Unit_L) do
  begin
    vx:=(i*Real_Max_Unit_L-Unit_Space_S_Min+2*Panel_Border_S_Min)/Real_Min_Unit_L;
	  vx:=(vx-round(vx))/Real_Min_Unit_L;
  	IF vx<=0.1 then
    begin
  		vwth:=i*Real_Max_Unit_L-Unit_Space_S_Min+2*Panel_Border_S_Min;
  		vnum1:=strtoint(floattostr(int((Panel_2_Max-2*Panel_Border_L_Min-Unit_Space_L_Min)/Real_Min_Unit_L)));
	  	vnum2:=strtoint(floattostr(int((Panel_2_Max-2*Panel_Border_L_Min-Unit_Space_L_Min)/Real_Max_Unit_L)));
  		FOR ix:=1 to vnum1 do
	  		FOR jx:=1 to vnum2 do
        begin
          vsch1:=Real_Max_Unit_L;
          vsch2:=Real_Min_Unit_L;
    	  	vschnum1:=i;
  	    	vschnum3:=strtoint(floattostr(int((i*Real_Max_Unit_L-Unit_Space_S_Min)/Real_Min_Unit_L)));
  				vlen:=ix*Real_Min_Unit_L+jx*Real_Max_Unit_L-Unit_Space_S_Min+2*Panel_Border_L_Min;
	  			IF (vlen>Real_Min_Panel_W) and (vlen<Real_Max_Panel_W) then
          begin
					  vnum:=vschnum1*ix+vschnum3*jx;
	  				vschnum2:=ix;
			  		vschnum4:=jx;
      	  	IF ((vlen>=Panel_1_Min) and (vlen<=Panel_1_Max) and (vwth>=Panel_2_Min) and (vwth<=Panel_2_Max))
             or ((vlen>=Panel_2_Min) and (vlen<=Panel_2_Max) and (vwth>=Panel_1_Min) and (vwth<=Panel_1_Max))
             then
                pnl_size1(vlen,vwth);
          end;
		  	END;
    end;
  end;

  //2).用 Real_Max_Unit_L 填充边Panel_2, 用 Real_Min_Unit_L 填充边Panel_1 ,Panel_1边宽为Panel_Border_L_Min
  Real_Min_Panel_L:=Real_Min_Unit_L+2*Panel_Border_S_Min;
  while  Real_Min_Panel_L<=Panel_1_Min do
  begin
  	Real_Min_Panel_L:=Real_Min_Unit_L+Real_Min_Panel_L;
  	if Real_Min_Panel_L> Panel_1_Min then	break;
  END;
  Real_Max_Panel_L:=Real_Min_Panel_L;
  while  Real_Max_Panel_L<=Panel_1_Max do
  begin
  	Real_Max_Panel_L:=Real_Min_Unit_L+Real_Max_Panel_L;
  	IF Real_Max_Panel_L> Panel_1_Max then  break;
  end;
  if Real_Max_Panel_L=Real_Min_Panel_L then
    Real_Min_Panel_L:=Real_Min_Panel_L-Real_Min_Unit_L;
  Real_Min_Panel_W:=Real_Max_Unit_L+2*Panel_Border_L_Min;
  while  Real_Min_Panel_W<=Panel_2_Min do
  begin
  	Real_Min_Panel_W:=Real_Max_Unit_L+Real_Min_Panel_W;
  	if Real_Min_Panel_W> Panel_2_Min then break;
  end;
  Real_Max_Panel_W:=Real_Min_Panel_W;
  while  Real_Max_Panel_W<=Panel_2_Max do
  begin
  	Real_Max_Panel_W:=Real_Max_Unit_L+Real_Max_Panel_W;
  	IF Real_Max_Panel_W> Panel_2_Max then break;
  end;
  if Real_Max_Panel_W=Real_Min_Panel_W then
    Real_Min_Panel_W:=Real_Min_Panel_W-Real_Max_Unit_L;

  k:=round(Real_Max_Panel_L/Real_Min_Unit_L)-ROUND(Real_Min_Panel_L/Real_Min_Unit_L);
  if k=0 then k:=1;

  FOR i:=ROUND(Real_Min_Panel_L/Real_Min_Unit_L) to round(Real_Max_Panel_L/Real_Min_Unit_L) do
  begin
    vx:=(i*Real_Min_Unit_L-Unit_Space_L_Min+2*Panel_Border_S_Min)/Real_Max_Unit_L;
	  vx:=(vx-round(vx))/Real_Max_Unit_L;
  	IF vx<=0.1 then
    begin
  		vwth:=i*Real_Min_Unit_L-Unit_Space_L_Min+2*Panel_Border_S_Min;
  		vnum1:=strtoint(floattostr(int((Panel_2_Max-2*Panel_Border_L_Min-Unit_Space_L_Min)/Real_Max_Unit_L)));
	  	vnum2:=strtoint(floattostr(int((Panel_2_Max-2*Panel_Border_L_Min-Unit_Space_L_Min)/Real_Min_Unit_L)));
  		FOR ix:=1 to vnum1 do
	  		FOR jx:=1 to vnum2 do
        begin
          vsch2:=Real_Max_Unit_L;
          vsch1:=Real_Min_Unit_L;
    	  	vschnum1:=i;
  	    	vschnum3:=strtoint(floattostr(int((i*Real_Min_Unit_L-Unit_Space_L_Min)/Real_Max_Unit_L)));
  				vlen:=ix*Real_Max_Unit_L+jx*Real_Min_Unit_L-Unit_Space_S_Min+2*Panel_Border_L_Min;
	  			IF (vlen>Real_Min_Panel_W) and (vlen<Real_Max_Panel_W) then
          begin
					  vnum:=vschnum1*ix+vschnum3*jx;
	  				vschnum2:=ix;
			  		vschnum4:=jx;
      	  	IF ((vlen>=Panel_1_Min) and (vlen<=Panel_1_Max) and (vwth>=Panel_2_Min) and (vwth<=Panel_2_Max))
             or ((vlen>=Panel_2_Min) and (vlen<=Panel_2_Max) and (vwth>=Panel_1_Min) and (vwth<=Panel_1_Max))
             then
                pnl_size1(vlen,vwth);
          end;
		  	END;
    end;
  end;

  ////////////////////////////////////////////
  vtemp:=Panel_1_Min;   //对调PANEL1和PANEL2和边框宽度
  Panel_1_Min:=Panel_2_Min;
  Panel_2_Min:=vtemp;
  vtemp:=Panel_1_Max;
  Panel_1_Max:=Panel_2_Max;
  Panel_2_Max:=vtemp;
  vtemp:=Panel_Border_S_Min;
  Panel_Border_S_Min:=Panel_Border_L_Min;
  Panel_Border_L_Min:=vtemp;
  ///////////////////////////////////////////

  //1.1).用 Real_Max_Unit_L 填充边Panel_1, 用 Real_Min_Unit_L 填充边Panel_2 ,Panel_1边宽为Panel_Border_L_Min
  Real_Min_Panel_L:=Real_Max_Unit_L+2*Panel_Border_S_Min;
  while  Real_Min_Panel_L<=Panel_1_Min do
  begin
  	Real_Min_Panel_L:=Real_Max_Unit_L+Real_Min_Panel_L;
  	if Real_Min_Panel_L> Panel_1_Min then	break;
  END;
  Real_Max_Panel_L:=Real_Min_Panel_L;
  while  Real_Max_Panel_L<=Panel_1_Max do
  begin
  	Real_Max_Panel_L:=Real_Max_Unit_L+Real_Max_Panel_L;
  	IF Real_Max_Panel_L> Panel_1_Max then  break;
  end;
  if Real_Max_Panel_L=Real_Min_Panel_L then
    Real_Min_Panel_L:=Real_Min_Panel_L-Real_Max_Unit_L;
  Real_Min_Panel_W:=Real_Min_Unit_L+2*Panel_Border_L_Min;
  while  Real_Min_Panel_W<=Panel_2_Min do
  begin
  	Real_Min_Panel_W:=Real_Min_Unit_L+Real_Min_Panel_W;
  	if Real_Min_Panel_W> Panel_2_Min then break;
  end;
  Real_Max_Panel_W:=Real_Min_Panel_W;
  while  Real_Max_Panel_W<=Panel_2_Max do
  begin
  	Real_Max_Panel_W:=Real_Min_Unit_L+Real_Max_Panel_W;
  	IF Real_Max_Panel_W> Panel_2_Max then break;
  end;
  if Real_Max_Panel_W=Real_Min_Panel_W then
    Real_Min_Panel_W:=Real_Min_Panel_W-Real_Min_Unit_L;

  k:=round(Real_Max_Panel_L/Real_Max_Unit_L)-ROUND(Real_Min_Panel_L/Real_Max_Unit_L);
  if k=0 then k:=1;

  FOR i:=ROUND(Real_Min_Panel_L/Real_Max_Unit_L) to round(Real_Max_Panel_L/Real_Max_Unit_L) do
  begin
    vx:=(i*Real_Max_Unit_L-Unit_Space_S_Min+2*Panel_Border_S_Min)/Real_Min_Unit_L;
	  vx:=(vx-round(vx))/Real_Min_Unit_L;
  	IF vx<=0.1 then
    begin
  		vwth:=i*Real_Max_Unit_L-Unit_Space_S_Min+2*Panel_Border_S_Min;
  		vnum1:=strtoint(floattostr(int((Panel_2_Max-2*Panel_Border_L_Min-Unit_Space_L_Min)/Real_Min_Unit_L)));
	  	vnum2:=strtoint(floattostr(int((Panel_2_Max-2*Panel_Border_L_Min-Unit_Space_L_Min)/Real_Max_Unit_L)));
  		FOR ix:=1 to vnum1 do
	  		FOR jx:=1 to vnum2 do
        begin
          vsch1:=Real_Max_Unit_L;
          vsch2:=Real_Min_Unit_L;
    	  	vschnum1:=i;
  	    	vschnum3:=strtoint(floattostr(int((i*Real_Max_Unit_L-Unit_Space_S_Min)/Real_Min_Unit_L)));
  				vlen:=ix*Real_Min_Unit_L+jx*Real_Max_Unit_L-Unit_Space_S_Min+2*Panel_Border_L_Min;
	  			IF (vlen>Real_Min_Panel_W) and (vlen<Real_Max_Panel_W) then
          begin
					  vnum:=vschnum1*ix+vschnum3*jx;
	  				vschnum2:=ix;
			  		vschnum4:=jx;
      	  	IF ((vlen>=Panel_1_Min) and (vlen<=Panel_1_Max) and (vwth>=Panel_2_Min) and (vwth<=Panel_2_Max))
             or ((vlen>=Panel_2_Min) and (vlen<=Panel_2_Max) and (vwth>=Panel_1_Min) and (vwth<=Panel_1_Max))
             then
                pnl_size1(vlen,vwth);
          end;
		  	END;
    end;
  end;

  //2.1).用 Real_Max_Unit_L 填充边Panel_2, 用 Real_Min_Unit_L 填充边Panel_1 ,Panel_1边宽为Panel_Border_L_Min
  Real_Min_Panel_L:=Real_Min_Unit_L+2*Panel_Border_S_Min;
  while  Real_Min_Panel_L<=Panel_1_Min do
  begin
  	Real_Min_Panel_L:=Real_Min_Unit_L+Real_Min_Panel_L;
  	if Real_Min_Panel_L> Panel_1_Min then	break;
  END;
  Real_Max_Panel_L:=Real_Min_Panel_L;
  while  Real_Max_Panel_L<=Panel_1_Max do
  begin
  	Real_Max_Panel_L:=Real_Min_Unit_L+Real_Max_Panel_L;
  	IF Real_Max_Panel_L> Panel_1_Max then  break;
  end;
  if Real_Max_Panel_L=Real_Min_Panel_L then
    Real_Min_Panel_L:=Real_Min_Panel_L-Real_Min_Unit_L;
  Real_Min_Panel_W:=Real_Max_Unit_L+2*Panel_Border_L_Min;
  while  Real_Min_Panel_W<=Panel_2_Min do
  begin
  	Real_Min_Panel_W:=Real_Max_Unit_L+Real_Min_Panel_W;
  	if Real_Min_Panel_W> Panel_2_Min then break;
  end;
  Real_Max_Panel_W:=Real_Min_Panel_W;
  while  Real_Max_Panel_W<=Panel_2_Max do
  begin
  	Real_Max_Panel_W:=Real_Max_Unit_L+Real_Max_Panel_W;
  	IF Real_Max_Panel_W> Panel_2_Max then break;
  end;
  if Real_Max_Panel_W=Real_Min_Panel_W then
    Real_Min_Panel_W:=Real_Min_Panel_W-Real_Max_Unit_L;

  k:=round(Real_Max_Panel_L/Real_Min_Unit_L)-ROUND(Real_Min_Panel_L/Real_Min_Unit_L);
  if k=0 then k:=1;

  FOR i:=ROUND(Real_Min_Panel_L/Real_Min_Unit_L) to round(Real_Max_Panel_L/Real_Min_Unit_L) do
  begin
    vx:=(i*Real_Min_Unit_L-Unit_Space_L_Min+2*Panel_Border_S_Min)/Real_Max_Unit_L;
	  vx:=(vx-round(vx))/Real_Max_Unit_L;
  	IF vx<=0.1 then
    begin
  		vwth:=i*Real_Min_Unit_L-Unit_Space_L_Min+2*Panel_Border_S_Min;
  		vnum1:=strtoint(floattostr(int((Panel_2_Max-2*Panel_Border_L_Min-Unit_Space_L_Min)/Real_Max_Unit_L)));
	  	vnum2:=strtoint(floattostr(int((Panel_2_Max-2*Panel_Border_L_Min-Unit_Space_L_Min)/Real_Min_Unit_L)));
  		FOR ix:=1 to vnum1 do
	  		FOR jx:=1 to vnum2 do
        begin
          vsch2:=Real_Max_Unit_L;
          vsch1:=Real_Min_Unit_L;
    	  	vschnum1:=i;
  	    	vschnum3:=strtoint(floattostr(int((i*Real_Min_Unit_L-Unit_Space_L_Min)/Real_Max_Unit_L)));
  				vlen:=ix*Real_Max_Unit_L+jx*Real_Min_Unit_L-Unit_Space_S_Min+2*Panel_Border_L_Min;
	  			IF (vlen>Real_Min_Panel_W) and (vlen<Real_Max_Panel_W) then
          begin
					  vnum:=vschnum1*ix+vschnum3*jx;
	  				vschnum2:=ix;
			  		vschnum4:=jx;
      	  	IF ((vlen>=Panel_1_Min) and (vlen<=Panel_1_Max) and (vwth>=Panel_2_Min) and (vwth<=Panel_2_Max))
             or ((vlen>=Panel_2_Min) and (vlen<=Panel_2_Max) and (vwth>=Panel_1_Min) and (vwth<=Panel_1_Max))
             then
                pnl_size1(vlen,vwth);
          end;
		  	END;
    end;
  end;

  ////////////////////////////////////////////
  vtemp:=Panel_1_Min;   //对调PANEL1和PANEL2和边框宽度
  Panel_1_Min:=Panel_2_Min;
  Panel_2_Min:=vtemp;
  vtemp:=Panel_1_Max;
  Panel_1_Max:=Panel_2_Max;
  Panel_2_Max:=vtemp;
  vtemp:=Panel_Border_S_Min;
  Panel_Border_S_Min:=Panel_Border_L_Min;
  Panel_Border_L_Min:=vtemp;
  ////////////////////////////////////////////

  if checkbox1.Checked =true then
  begin ///begin of if checkbox1=true
  ////////////////////////////////////////////
  //对调PANEL1和PANEL2和边框宽度
  vtemp:=Panel_Border_S_Min;
  Panel_Border_S_Min:=Panel_Border_L_Min;
  Panel_Border_L_Min:=vtemp;
  ////////////////////////////////////////////

  ////////////////////////////////////////////
  //1).用 Real_Max_Unit_L 填充边Panel_1, 用 Real_Min_Unit_L 填充边Panel_2 ,Panel_1边宽为Panel_Border_L_Min
  Real_Min_Panel_L:=Real_Max_Unit_L+2*Panel_Border_S_Min;
  while  Real_Min_Panel_L<=Panel_1_Min do
  begin
  	Real_Min_Panel_L:=Real_Max_Unit_L+Real_Min_Panel_L;
  	if Real_Min_Panel_L> Panel_1_Min then	break;
  END;
  Real_Max_Panel_L:=Real_Min_Panel_L;
  while  Real_Max_Panel_L<=Panel_1_Max do
  begin
  	Real_Max_Panel_L:=Real_Max_Unit_L+Real_Max_Panel_L;
  	IF Real_Max_Panel_L> Panel_1_Max then  break;
  end;
  if Real_Max_Panel_L=Real_Min_Panel_L then
    Real_Min_Panel_L:=Real_Min_Panel_L-Real_Max_Unit_L;
  Real_Min_Panel_W:=Real_Min_Unit_L+2*Panel_Border_L_Min;
  while  Real_Min_Panel_W<=Panel_2_Min do
  begin
  	Real_Min_Panel_W:=Real_Min_Unit_L+Real_Min_Panel_W;
  	if Real_Min_Panel_W> Panel_2_Min then break;
  end;
  Real_Max_Panel_W:=Real_Min_Panel_W;
  while  Real_Max_Panel_W<=Panel_2_Max do
  begin
  	Real_Max_Panel_W:=Real_Min_Unit_L+Real_Max_Panel_W;
  	IF Real_Max_Panel_W> Panel_2_Max then break;
  end;
  if Real_Max_Panel_W=Real_Min_Panel_W then
    Real_Min_Panel_W:=Real_Min_Panel_W-Real_Min_Unit_L;

  k:=round(Real_Max_Panel_L/Real_Max_Unit_L)-ROUND(Real_Min_Panel_L/Real_Max_Unit_L);
  if k=0 then k:=1;

  FOR i:=ROUND(Real_Min_Panel_L/Real_Max_Unit_L) to round(Real_Max_Panel_L/Real_Max_Unit_L) do
  begin
    vx:=(i*Real_Max_Unit_L-Unit_Space_S_Min+2*Panel_Border_S_Min)/Real_Min_Unit_L;
	  vx:=(vx-round(vx))/Real_Min_Unit_L;
  	IF vx<=0.1 then
    begin
  		vwth:=i*Real_Max_Unit_L-Unit_Space_S_Min+2*Panel_Border_S_Min;
  		vnum1:=strtoint(floattostr(int((Panel_2_Max-2*Panel_Border_L_Min-Unit_Space_L_Min)/Real_Min_Unit_L)));
	  	vnum2:=strtoint(floattostr(int((Panel_2_Max-2*Panel_Border_L_Min-Unit_Space_L_Min)/Real_Max_Unit_L)));
  		FOR ix:=1 to vnum1 do
	  		FOR jx:=1 to vnum2 do
        begin
          vsch1:=Real_Max_Unit_L;
          vsch2:=Real_Min_Unit_L;
    	  	vschnum1:=i;
  	    	vschnum3:=strtoint(floattostr(int((i*Real_Max_Unit_L-Unit_Space_S_Min)/Real_Min_Unit_L)));
  				vlen:=ix*Real_Min_Unit_L+jx*Real_Max_Unit_L-Unit_Space_S_Min+2*Panel_Border_L_Min;
	  			IF (vlen>Real_Min_Panel_W) and (vlen<Real_Max_Panel_W) then
          begin
					  vnum:=vschnum1*ix+vschnum3*jx;
	  				vschnum2:=ix;
			  		vschnum4:=jx;
      	  	IF ((vlen>=Panel_1_Min) and (vlen<=Panel_1_Max) and (vwth>=Panel_2_Min) and (vwth<=Panel_2_Max))
             or ((vlen>=Panel_2_Min) and (vlen<=Panel_2_Max) and (vwth>=Panel_1_Min) and (vwth<=Panel_1_Max))
             then
                pnl_size1(vlen,vwth);
          end;
		  	END;
    end;
  end;

  //2).用 Real_Max_Unit_L 填充边Panel_2, 用 Real_Min_Unit_L 填充边Panel_1 ,Panel_1边宽为Panel_Border_L_Min
  Real_Min_Panel_L:=Real_Min_Unit_L+2*Panel_Border_S_Min;
  while  Real_Min_Panel_L<=Panel_1_Min do
  begin
  	Real_Min_Panel_L:=Real_Min_Unit_L+Real_Min_Panel_L;
  	if Real_Min_Panel_L> Panel_1_Min then	break;
  END;
  Real_Max_Panel_L:=Real_Min_Panel_L;
  while  Real_Max_Panel_L<=Panel_1_Max do
  begin
  	Real_Max_Panel_L:=Real_Min_Unit_L+Real_Max_Panel_L;
  	IF Real_Max_Panel_L> Panel_1_Max then  break;
  end;
  if Real_Max_Panel_L=Real_Min_Panel_L then
    Real_Min_Panel_L:=Real_Min_Panel_L-Real_Min_Unit_L;
  Real_Min_Panel_W:=Real_Max_Unit_L+2*Panel_Border_L_Min;
  while  Real_Min_Panel_W<=Panel_2_Min do
  begin
  	Real_Min_Panel_W:=Real_Max_Unit_L+Real_Min_Panel_W;
  	if Real_Min_Panel_W> Panel_2_Min then break;
  end;
  Real_Max_Panel_W:=Real_Min_Panel_W;
  while  Real_Max_Panel_W<=Panel_2_Max do
  begin
  	Real_Max_Panel_W:=Real_Max_Unit_L+Real_Max_Panel_W;
  	IF Real_Max_Panel_W> Panel_2_Max then break;
  end;
  if Real_Max_Panel_W=Real_Min_Panel_W then
    Real_Min_Panel_W:=Real_Min_Panel_W-Real_Max_Unit_L;

  k:=round(Real_Max_Panel_L/Real_Min_Unit_L)-ROUND(Real_Min_Panel_L/Real_Min_Unit_L);
  if k=0 then k:=1;

  FOR i:=ROUND(Real_Min_Panel_L/Real_Min_Unit_L) to round(Real_Max_Panel_L/Real_Min_Unit_L) do
  begin
    vx:=(i*Real_Min_Unit_L-Unit_Space_L_Min+2*Panel_Border_S_Min)/Real_Max_Unit_L;
	  vx:=(vx-round(vx))/Real_Max_Unit_L;
  	IF vx<=0.1 then
    begin
  		vwth:=i*Real_Min_Unit_L-Unit_Space_L_Min+2*Panel_Border_S_Min;
  		vnum1:=strtoint(floattostr(int((Panel_2_Max-2*Panel_Border_L_Min-Unit_Space_L_Min)/Real_Max_Unit_L)));
	  	vnum2:=strtoint(floattostr(int((Panel_2_Max-2*Panel_Border_L_Min-Unit_Space_L_Min)/Real_Min_Unit_L)));
  		FOR ix:=1 to vnum1 do
	  		FOR jx:=1 to vnum2 do
        begin
          vsch2:=Real_Max_Unit_L;
          vsch1:=Real_Min_Unit_L;
    	  	vschnum1:=i;
  	    	vschnum3:=strtoint(floattostr(int((i*Real_Min_Unit_L-Unit_Space_L_Min)/Real_Max_Unit_L)));
  				vlen:=ix*Real_Max_Unit_L+jx*Real_Min_Unit_L-Unit_Space_S_Min+2*Panel_Border_L_Min;
	  			IF (vlen>Real_Min_Panel_W) and (vlen<Real_Max_Panel_W) then
          begin
					  vnum:=vschnum1*ix+vschnum3*jx;
	  				vschnum2:=ix;
			  		vschnum4:=jx;
      	  	IF ((vlen>=Panel_1_Min) and (vlen<=Panel_1_Max) and (vwth>=Panel_2_Min) and (vwth<=Panel_2_Max))
             or ((vlen>=Panel_2_Min) and (vlen<=Panel_2_Max) and (vwth>=Panel_1_Min) and (vwth<=Panel_1_Max))
             then
                pnl_size1(vlen,vwth);
          end;
		  	END;
    end;
  end;

  ////////////////////////////////////////////
  vtemp:=Panel_1_Min;   //对调PANEL1和PANEL2和边框宽度
  Panel_1_Min:=Panel_2_Min;
  Panel_2_Min:=vtemp;
  vtemp:=Panel_1_Max;
  Panel_1_Max:=Panel_2_Max;
  Panel_2_Max:=vtemp;
  vtemp:=Panel_Border_S_Min;
  Panel_Border_S_Min:=Panel_Border_L_Min;
  Panel_Border_L_Min:=vtemp;
  ///////////////////////////////////////////

  //1.1).用 Real_Max_Unit_L 填充边Panel_1, 用 Real_Min_Unit_L 填充边Panel_2 ,Panel_1边宽为Panel_Border_L_Min
  Real_Min_Panel_L:=Real_Max_Unit_L+2*Panel_Border_S_Min;
  while  Real_Min_Panel_L<=Panel_1_Min do
  begin
  	Real_Min_Panel_L:=Real_Max_Unit_L+Real_Min_Panel_L;
  	if Real_Min_Panel_L> Panel_1_Min then	break;
  END;
  Real_Max_Panel_L:=Real_Min_Panel_L;
  while  Real_Max_Panel_L<=Panel_1_Max do
  begin
  	Real_Max_Panel_L:=Real_Max_Unit_L+Real_Max_Panel_L;
  	IF Real_Max_Panel_L> Panel_1_Max then  break;
  end;
  if Real_Max_Panel_L=Real_Min_Panel_L then
    Real_Min_Panel_L:=Real_Min_Panel_L-Real_Max_Unit_L;
  Real_Min_Panel_W:=Real_Min_Unit_L+2*Panel_Border_L_Min;
  while  Real_Min_Panel_W<=Panel_2_Min do
  begin
  	Real_Min_Panel_W:=Real_Min_Unit_L+Real_Min_Panel_W;
  	if Real_Min_Panel_W> Panel_2_Min then break;
  end;
  Real_Max_Panel_W:=Real_Min_Panel_W;
  while  Real_Max_Panel_W<=Panel_2_Max do
  begin
  	Real_Max_Panel_W:=Real_Min_Unit_L+Real_Max_Panel_W;
  	IF Real_Max_Panel_W> Panel_2_Max then break;
  end;
  if Real_Max_Panel_W=Real_Min_Panel_W then
    Real_Min_Panel_W:=Real_Min_Panel_W-Real_Min_Unit_L;

  k:=round(Real_Max_Panel_L/Real_Max_Unit_L)-ROUND(Real_Min_Panel_L/Real_Max_Unit_L);
  if k=0 then k:=1;

  FOR i:=ROUND(Real_Min_Panel_L/Real_Max_Unit_L) to round(Real_Max_Panel_L/Real_Max_Unit_L) do
  begin
    vx:=(i*Real_Max_Unit_L-Unit_Space_S_Min+2*Panel_Border_S_Min)/Real_Min_Unit_L;
	  vx:=(vx-round(vx))/Real_Min_Unit_L;
  	IF vx<=0.1 then
    begin
  		vwth:=i*Real_Max_Unit_L-Unit_Space_S_Min+2*Panel_Border_S_Min;
  		vnum1:=strtoint(floattostr(int((Panel_2_Max-2*Panel_Border_L_Min-Unit_Space_L_Min)/Real_Min_Unit_L)));
	  	vnum2:=strtoint(floattostr(int((Panel_2_Max-2*Panel_Border_L_Min-Unit_Space_L_Min)/Real_Max_Unit_L)));
  		FOR ix:=1 to vnum1 do
	  		FOR jx:=1 to vnum2 do
        begin
          vsch1:=Real_Max_Unit_L;
          vsch2:=Real_Min_Unit_L;
    	  	vschnum1:=i;
  	    	vschnum3:=strtoint(floattostr(int((i*Real_Max_Unit_L-Unit_Space_S_Min)/Real_Min_Unit_L)));
  				vlen:=ix*Real_Min_Unit_L+jx*Real_Max_Unit_L-Unit_Space_S_Min+2*Panel_Border_L_Min;
	  			IF (vlen>Real_Min_Panel_W) and (vlen<Real_Max_Panel_W) then
          begin
					  vnum:=vschnum1*ix+vschnum3*jx;
	  				vschnum2:=ix;
			  		vschnum4:=jx;
      	  	IF ((vlen>=Panel_1_Min) and (vlen<=Panel_1_Max) and (vwth>=Panel_2_Min) and (vwth<=Panel_2_Max))
             or ((vlen>=Panel_2_Min) and (vlen<=Panel_2_Max) and (vwth>=Panel_1_Min) and (vwth<=Panel_1_Max))
             then
                pnl_size1(vlen,vwth);
          end;
		  	END;
    end;
  end;

  //2.1).用 Real_Max_Unit_L 填充边Panel_2, 用 Real_Min_Unit_L 填充边Panel_1 ,Panel_1边宽为Panel_Border_L_Min
  Real_Min_Panel_L:=Real_Min_Unit_L+2*Panel_Border_S_Min;
  while  Real_Min_Panel_L<=Panel_1_Min do
  begin
  	Real_Min_Panel_L:=Real_Min_Unit_L+Real_Min_Panel_L;
  	if Real_Min_Panel_L> Panel_1_Min then	break;
  END;
  Real_Max_Panel_L:=Real_Min_Panel_L;
  while  Real_Max_Panel_L<=Panel_1_Max do
  begin
  	Real_Max_Panel_L:=Real_Min_Unit_L+Real_Max_Panel_L;
  	IF Real_Max_Panel_L> Panel_1_Max then  break;
  end;
  if Real_Max_Panel_L=Real_Min_Panel_L then
    Real_Min_Panel_L:=Real_Min_Panel_L-Real_Min_Unit_L;
  Real_Min_Panel_W:=Real_Max_Unit_L+2*Panel_Border_L_Min;
  while  Real_Min_Panel_W<=Panel_2_Min do
  begin
  	Real_Min_Panel_W:=Real_Max_Unit_L+Real_Min_Panel_W;
  	if Real_Min_Panel_W> Panel_2_Min then break;
  end;
  Real_Max_Panel_W:=Real_Min_Panel_W;
  while  Real_Max_Panel_W<=Panel_2_Max do
  begin
  	Real_Max_Panel_W:=Real_Max_Unit_L+Real_Max_Panel_W;
  	IF Real_Max_Panel_W> Panel_2_Max then break;
  end;
  if Real_Max_Panel_W=Real_Min_Panel_W then
    Real_Min_Panel_W:=Real_Min_Panel_W-Real_Max_Unit_L;

  k:=round(Real_Max_Panel_L/Real_Min_Unit_L)-ROUND(Real_Min_Panel_L/Real_Min_Unit_L);
  if k=0 then k:=1;

  FOR i:=ROUND(Real_Min_Panel_L/Real_Min_Unit_L) to round(Real_Max_Panel_L/Real_Min_Unit_L) do
  begin
    vx:=(i*Real_Min_Unit_L-Unit_Space_L_Min+2*Panel_Border_S_Min)/Real_Max_Unit_L;
	  vx:=(vx-round(vx))/Real_Max_Unit_L;
  	IF vx<=0.1 then
    begin
  		vwth:=i*Real_Min_Unit_L-Unit_Space_L_Min+2*Panel_Border_S_Min;
  		vnum1:=strtoint(floattostr(int((Panel_2_Max-2*Panel_Border_L_Min-Unit_Space_L_Min)/Real_Max_Unit_L)));
	  	vnum2:=strtoint(floattostr(int((Panel_2_Max-2*Panel_Border_L_Min-Unit_Space_L_Min)/Real_Min_Unit_L)));
  		FOR ix:=1 to vnum1 do
	  		FOR jx:=1 to vnum2 do
        begin
          vsch2:=Real_Max_Unit_L;
          vsch1:=Real_Min_Unit_L;
    	  	vschnum1:=i;
  	    	vschnum3:=strtoint(floattostr(int((i*Real_Min_Unit_L-Unit_Space_L_Min)/Real_Max_Unit_L)));
  				vlen:=ix*Real_Max_Unit_L+jx*Real_Min_Unit_L-Unit_Space_S_Min+2*Panel_Border_L_Min;
	  			IF (vlen>Real_Min_Panel_W) and (vlen<Real_Max_Panel_W) then
          begin
					  vnum:=vschnum1*ix+vschnum3*jx;
	  				vschnum2:=ix;
			  		vschnum4:=jx;
      	  	IF ((vlen>=Panel_1_Min) and (vlen<=Panel_1_Max) and (vwth>=Panel_2_Min) and (vwth<=Panel_2_Max))
             or ((vlen>=Panel_2_Min) and (vlen<=Panel_2_Max) and (vwth>=Panel_1_Min) and (vwth<=Panel_1_Max))
             then
                pnl_size1(vlen,vwth);
          end;
		  	END;
    end;
  end;
  ////////////////////////////////////////////
  end; ///end of if checkbox1=true
end;
end;

procedure TFrmPCBCut.pnl_size1(vvlen,vvwth:real);
var vlen,vwth,len,wth,vusage:real;
begin
LEN:=min(Sheet_L,Sheet_W);
wth:=max(Sheet_L,Sheet_W);
vlen:=strtofloat(formatfloat('0.00',vvlen));
vwth:=strtofloat(formatfloat('0.00',vvwth));
vusage:=vnum*Unit_L*Unit_W/vlen/vwth;
inproc1(0,0,vlen,vwth,len,wth,vusage);
end;

procedure TFrmPCBCut.inproc1(VVtimes:integer;VVScp,vlen,vwth,len,wth,vusage:Real);
var
Slen,Swth,vMem1:Real;
vtimes,vmem0,i,vqty:integer;
begin
vtimes:=VVtimes;
Slen:=len;
Swth:=wth;
vqty:=0;
FOR i:=1 to vtimes do
  vqty:=vqty+num2[i];
if (round(10000*vvscp/sheet_L/sheet_W)>minvscp1*10000)
  or ((round(10000*vvscp/sheet_L/sheet_W)=minvscp1*10000) and (vqty>=vPanels1)) then exit;

IF not ( ((Slen>=vlen) and (Swth>=vwth)) or ((Swth>=vlen) and (Slen>=vwth)) ) then
begin
	VSCP:=VVSCP+Slen*Swth;
  if (round(10000*vscp/sheet_L/sheet_W)>minvscp1*10000)
    or ((round(10000*vscp/sheet_L/sheet_W)=minvscp1*10000) and (vqty>=vPanels1)) then  exit;
  appeblan1(vscp,vlen,vwth,vtimes);
  exit;
END;
//*-1////////////////////////////////////////////////////////////////////*
IF (Slen>=vlen) and (Swth>=vwth) then begin
  vmem0:=vtimes;
	vtimes:=vtimes+1;
  SETLENGTH(v2,vtimes+1);
  SETLENGTH(num2,vtimes+1);
	v2[vtimes]:=formatfloat('0.000',vlen)+' + '+formatfloat('0.000',Swth);
  vmem1:=slen;
	Slen:=Slen-vlen;
	num2[vtimes]:=strtoint(copy(inttostr(round(Swth/vwth*10000)),1,length(inttostr(round(Swth/vwth*10000)))-4));
	vscp:=vvscp+vlen*Swth-num2[vtimes]*vusage*vlen*vwth;
  inproc1(Vtimes,VScp,vlen,vwth,Slen,Swth,vusage);
  slen:=vmem1;
  vtimes:=vmem0;
END;
//*-2////////////////////////////////////////////////////////////////////*
IF (Slen>=vwth) and (Swth>=vlen) then begin
  vmem0:=vtimes;
	vtimes:=vtimes+1;
  SETLENGTH(v2,vtimes+1);
  SETLENGTH(num2,vtimes+1);
	v2[vtimes]:=formatfloat('0.000',vwth)+' + '+formatfloat('0.000',Swth);
  vmem1:=slen;
	Slen:=Slen-vwth;
	num2[vtimes]:=strtoint(copy(inttostr(round(Swth/vlen*10000)),1,length(inttostr(round(Swth/vlen*10000)))-4));
	vscp:=vvscp+vwth*Swth-num2[vtimes]*vusage*vlen*vwth;
  inproc1(Vtimes,VScp,vlen,vwth,Slen,Swth,vusage);
  slen:=vmem1;
  vtimes:=vmem0;
END;
//*-3////////////////////////////////////////////////////////////////////*
IF (Swth>=vlen) and (Slen>=vwth) then begin
  vmem0:=vtimes;
	vtimes:=vtimes+1;
  SETLENGTH(v2,vtimes+1);
  SETLENGTH(num2,vtimes+1);
	v2[vtimes]:=formatfloat('0.000',vlen)+' + '+formatfloat('0.000',Slen);
  vmem1:=swth;
	Swth:=Swth-vlen;
	num2[vtimes]:=strtoint(copy(inttostr(round(Slen/vwth*10000)),1,length(inttostr(round(Slen/vwth*10000)))-4));
	vscp:=vvscp+vlen*Slen-num2[vtimes]*vusage*vlen*vwth;
  inproc1(Vtimes,VScp,vlen,vwth,Slen,Swth,vusage);
  swth:=vmem1;
  vtimes:=vmem0;
END;
///*-4///////////////////////////////////////////////////////////////////*
IF (Swth>=vwth) and (Slen>=vlen) then begin
	vtimes:=vtimes+1;
  SETLENGTH(v2,vtimes+1);
  SETLENGTH(num2,vtimes+1);
	v2[vtimes]:=formatfloat('0.000',vwth)+' + '+formatfloat('0.000',Slen);
	Swth:=Swth-vwth;
	num2[vtimes]:=strtoint(copy(inttostr(round(Slen/vlen*10000)),1,length(inttostr(round(Slen/vlen*10000)))-4));
	vscp:=vvscp+vwth*Slen-num2[vtimes]*vusage*vlen*vwth;
  inproc1(Vtimes,VScp,vlen,vwth,Slen,Swth,vusage);
END;
end;

procedure TFrmPCBCut.CheckBox2Click(Sender: TObject);
var
 i:integer;
begin
 if checkbox2.Checked then
  for i:=1 to stringgrid1.RowCount-1 do
   stringgrid1.Cells[2,i]:='Y'
 else
  for i:=1 to stringgrid1.RowCount-1 do
   stringgrid1.Cells[2,i]:='N';
  stringgrid1.Refresh ;
end;

procedure TFrmPCBCut.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8]) then
    abort
  else
  begin
   if (key = chr(46)) then
    if pos('.',Edit4.Text)>0
     then
      abort;
  end;
end;

procedure TFrmPCBCut.FontsizeChange(Sender: TObject);
begin
  Image1.Canvas.Font.Size := UpDown3.Position;
  Image2.Canvas.Font.Size := UpDown3.Position;
  Image8.Canvas.Font.Size := UpDown3.Position;
end;

procedure TFrmPCBCut.SpinEdit1Change(Sender: TObject);
begin
  if strtoint(SpinEdit1.Text)=1 then
  begin
    combobox1.Enabled :=false;
    combobox2.Enabled :=false;
    combobox4.Enabled :=false;
    combobox10.Enabled :=false;
  end else
  begin
    combobox1.Enabled :=true;
    combobox2.Enabled :=true;
    combobox4.Enabled :=true;
    combobox10.Enabled :=true;
  end;
end;

procedure TFrmPCBCut.Edit1Enter(Sender: TObject);
begin
  Edit1.SelectAll;
end;

procedure TFrmPCBCut.Edit3Enter(Sender: TObject);
begin
  Edit3.SelectAll;
end;

procedure TFrmPCBCut.SpeedButton7Click(Sender: TObject);
begin
  DrawingTool := dtRectangle;
  IF label43.Caption ='0' then
    label43.Caption :='1';
end;

procedure TFrmPCBCut.TabSheet3Show(Sender: TObject);
begin
  image8.Cursor :=WImage.Cursor;
  WImage:=image8;
  WImage.Canvas.Pen.Width := PenWidth.Position;
end;

procedure TFrmPCBCut.Edit2Change(Sender: TObject);
begin
  WImage.Canvas.Font.Size := UpDown3.Position;
  DrawingTool := dtText;
  Label43.Caption :='0';
  Wimage.Cursor :=crDrag;
  label45.Caption:=Edit2.Text;
  //将画具设为text
end;

procedure TFrmPCBCut.SpeedButton8Click(Sender: TObject);
begin
  WImage.Picture:= Image9.Picture;
  SpeedButton8.Enabled :=false;
end;

procedure TFrmPCBCut.SpeedButton9Click(Sender: TObject);
begin
  WImage.Canvas.Font.Size := 7;
  DrawingTool := dtText;
  Label43.Caption :='0';
  label45.Caption:=(Sender as tspeedbutton).Caption;
  Wimage.Cursor :=crCross;
end;

procedure TFrmPCBCut.PageControl1Change(Sender: TObject);
begin
  SpeedButton8.Enabled :=false;
end;

procedure TFrmPCBCut.BitBtn1Click(Sender: TObject);
var
  ta1,ta2,tb1,tb2:currency;
  FUNB1:boolean;
  pnl_size_s2:pnl_size;//定义记录
  var_Sheet_Size_TwoPNL:Sheet_Size_twoPNL_1;//定义记录
  tem1:currency;
//  tem_Function1:boolean;
//  i:integer;
begin
  if SpinEdit1.Text ='1' then
  begin
    //   Resize_1()
    ta1:=strtocurr(SpinEdit2.text); //
    ta2:=strtocurr(SpinEdit3.text); //
    FUNB1:=Echange_Tem_tresult_makeup_using_Sheet_OnePNL_1(ta1,ta2,Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1]);
    //画排版图
    pnl_size_s2.Long1:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].PNLA_Long;//取结果,PNLA长
    pnl_size_s2.Width1:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].PNLA_Width;//取结果,PNLA宽
    pnl_size_s2.Unit_Long:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].PNLA_Unit_Long;//取结果,PNLA单元长
    pnl_size_s2.Unit_Width:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].PNLA_Unit_Width;//取结果,PNLA单元宽
    pnl_size_s2.Unit_Long_ToUnit_Space:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].PNLA_Unit_Long_Space;//取结果,PNLA单元长间距
    pnl_size_s2.Unit_Width_ToUnit_Space:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].PNLA_Unit_Width_Space;//取结果,PNLA单元宽间距
    pnl_size_s2.Unit_Long_PNL_Space:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].PNLA_Unit_Long_ToPNL;//取结果,PNLA单元长到边距离
    pnl_size_s2.Unit_Width_PNL_Space:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].PNLA_Unit_Width_ToPNL;//取结果,PNLA单元宽到边距离
    pnl_size_s2.Unit_Long_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].PNLA_Unit_Long_Number;//取结果,PNLA单元长个数
    pnl_size_s2.Unit_Width_number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].PNLA_Unit_Width_Number;//取结果,PNLA单元宽个数
    Draw_Picture1:=TDraw_Picture.Create ;
    Draw_Picture1.Input_pnl_size:=pnl_size_s2; //输入PNLA尺寸,用于画PNLA排版图

    //image1.Stretch:=false;
    Image2.Canvas.Rectangle(0,0,Image2.Width,Image2.Height);//清除内容
    Draw_Picture1.Draw_PNL_Picture(Image2.Canvas ,Image2.Width ,Image2.Height ); //画PNLA排版图,其中image1代表所要画的地方
    Image8.Canvas.Rectangle(0,0,Image8.Width,Image8.Height);//清除内容
    //showmessage(inttostr(image1.Height));
    //image1.Stretch:=true;
    //画开料图
    var_Sheet_Size_TwoPNL.One_PNLA_Long:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].One_Section_Long;    //300;     //一区PNLA长
    var_Sheet_Size_TwoPNL.One_PNLA_Width:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].One_Section_Width;//    250;    //一区PNLA宽
    var_Sheet_Size_TwoPNL.One_PNLA_Long_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].One_Section_Long_Number;//  1;//一区PNLA长个数
    var_Sheet_Size_TwoPNL.One_PNLA_Width_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].One_Section_Width_Number;//  2;//一区PNLA宽个数
    var_Sheet_Size_TwoPNL.Two_PNLA_Long:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Two_Section_LongA;//  300;
    var_Sheet_Size_TwoPNL.Two_PNLA_Width:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Two_Section_WidthA;//  150;
    var_Sheet_Size_TwoPNL.Two_PNLA_Long_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Two_Section_Long_NumberA;//  3;
    var_Sheet_Size_TwoPNL.Two_PNLA_Width_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Two_Section_Width_NumberA;//  1 ;
    var_Sheet_Size_TwoPNL.Two_PNLB_Long:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Two_Section_Longb;//  350;
    var_Sheet_Size_TwoPNL.Two_PNLB_Width:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Two_Section_Widthb;//  200;
    var_Sheet_Size_TwoPNL.Two_PNLB_Long_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Two_Section_Long_NumberB;//  2;
    var_Sheet_Size_TwoPNL.Two_PNLB_Width_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Two_Section_Width_NumberB;//  1;
    var_Sheet_Size_TwoPNL.Three_PNLA_Long:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Three_Section_LongA;//  230;
    var_Sheet_Size_TwoPNL.Three_PNLA_Width:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Three_Section_WidthA;//  240;
    var_Sheet_Size_TwoPNL.Three_PNLA_Long_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Three_Section_Long_NumberA; // 5;
    var_Sheet_Size_TwoPNL.Three_PNLA_Width_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Three_Section_Width_NumberA;//  1;
    var_Sheet_Size_TwoPNL.Three_PNLB_Long:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Three_Section_Longb;//280;
    var_Sheet_Size_TwoPNL.Three_PNLB_Width:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Three_Section_Widthb;//190;
    var_Sheet_Size_TwoPNL.Three_PNLB_Long_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Three_Section_Long_Numberb; //4;
    var_Sheet_Size_TwoPNL.Three_PNLB_Width_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Three_Section_Width_Numberb;//1;
    var_Sheet_Size_TwoPNL.Sheet_Long:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Sheet_Long;//  1220;
    var_Sheet_Size_TwoPNL.Sheet_Width:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Sheet_Width;//  1040;
    var_Sheet_Size_twoPNL.Two_Section_Array_type:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Two_Section_Array_type;
    var_Sheet_Size_twoPNL.Three_Section_Array_type:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Three_Section_Array_type;
    var_Sheet_Size_twoPNL.Draw_type:=Tem_Result_makeup_using_Sheet_OnePNL_t1[strtoint(Edit11.text)-1].Draw_type;

    Draw_Picture1.Sheet_Size_TwoPNL:=var_Sheet_Size_twoPNL;//输入计算结果,用于画开料图
    Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);//清除内容
    Draw_Picture1.Draw_Sheet_onePNL_Picture(Image1.Canvas ,Image1.Width ,Image1.Height);
    Draw_Picture1.Free;
  end
    else
  begin
    Edit5.Text:=currtostr( Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].PNLA_Long);
    Edit6.Text:=currtostr( Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].PNLA_Width);
    if Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].PNLB_number_Per_Sheet>0 then
    begin
      Edit7.Text:=currtostr( Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].PNLB_Long);
      Edit8.Text:=currtostr( Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1].PNLB_Width);
    end else
    begin
      Edit7.Text:='0';
      Edit8.Text:='0';
    end;
    Echange_Tem_tresult_makeup_using_Sheet_TwoPNL_1(
    strtocurr(Spinedit2.text),strtocurr(Spinedit3.text),strtocurr(Spinedit4.text),strtocurr(Spinedit5.text)
    ,Tem_tresult_makeup_using_Sheet_TwoPNL_1[strtoint(Edit11.text)-1]);
    DrawingNew(strtoint(Edit11.text)-1);
  end;

end;



procedure TFrmPCBCut.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
    abort;
end;

procedure TFrmPCBCut.Sheet1Click(Sender: TObject);
begin
  OpenDialog1.DefaultExt :='*.bmp';
  OpenDialog1.Filter :='*.bmp|*.bmp';
  if OpenDialog1.Execute then
    Image1.picture.LoadfromFile(OpenDialog1.FileName)
  else
    exit;
end;

procedure TFrmPCBCut.PanelA1Click(Sender: TObject);
begin
  OpenDialog1.DefaultExt :='*.bmp';
  OpenDialog1.Filter :='*.bmp|*.bmp';
  if OpenDialog1.Execute then
    Image2.picture.LoadfromFile(OpenDialog1.FileName)
  else
    exit;
end;

procedure TFrmPCBCut.Panel11Click(Sender: TObject);
begin
  OpenDialog1.DefaultExt :='*.bmp';
  OpenDialog1.Filter :='*.bmp|*.bmp';
  if OpenDialog1.Execute then
    Image8.picture.LoadfromFile(OpenDialog1.FileName)
  else
    exit;
end;

procedure TFrmPCBCut.Sheet2Click(Sender: TObject);
begin
  OpenDialog1.DefaultExt :='*.bmp';
  OpenDialog1.Filter :='*.bmp|*.bmp';
  if OpenDialog1.Execute then
    Image1.picture.SavetoFile(OpenDialog1.FileName)
  else
    exit;
end;

procedure TFrmPCBCut.Panel12Click(Sender: TObject);
begin
  OpenDialog1.DefaultExt :='*.bmp';
  OpenDialog1.Filter :='*.bmp|*.bmp';
  if OpenDialog1.Execute then
   Image2.picture.SavetoFile(OpenDialog1.FileName)
  else
   exit;
end;

procedure TFrmPCBCut.Panel21Click(Sender: TObject);
begin
  OpenDialog1.DefaultExt :='*.bmp';
  OpenDialog1.Filter :='*.bmp|*.bmp';
  if OpenDialog1.Execute then
    Image8.picture.SavetoFile(OpenDialog1.FileName)
  else
    exit;
end;

procedure TFrmPCBCut.SpeedButton19Click(Sender: TObject);
var
  vfile:pchar;
begin
  if not DirectoryExists('d:\sjsys') then
    mkdir('d:\sjsys');
  if Pagecontrol1.ActivePageIndex=0 then
  begin
    Image1.picture.SavetoFile('d:\sjsys\sheet.bmp');
    vfile:=pchar('d:\sjsys\sheet.bmp');
    ShellExecute(0,
               'open',
               vfile,
               nil,
               nil,
               SW_SHOWNORMAL);
    vimag1:=1;
  end else
  if Pagecontrol1.ActivePageIndex=1 then
  begin
    Image2.picture.SavetoFile('D:\sjsys\pnl1.bmp');
    vfile:=pchar('D:\sjsys\pnl1.bmp');
    ShellExecute(0,
               'open',
               vfile,
               nil,
               nil,
               SW_SHOWNORMAL);
    vimag2:=1;
  end else
  begin
    Image8.picture.SavetoFile('D:\sjsys\pnl2.bmp');
    vfile:=pchar('D:\sjsys\pnl2.bmp');
    ShellExecute(0,
               'open',
               vfile,
               nil,
               nil,
               SW_SHOWNORMAL);
    vimag8:=1;
  end;
  SpeedButton20.Enabled :=true;
end;

procedure TFrmPCBCut.SpeedButton20Click(Sender: TObject);
begin
  if vimag1=1 then
    if messagedlg('是否更新Sheet的排版图？',mtconfirmation,[mbYes,mbNo],0)=mrYes
      then begin
        Image1.picture.LoadfromFile('D:\sjsys\sheet.bmp');
        vimag1:=0;
      end;
  if vimag2=1 then
    if messagedlg('是否更新Panel1的排版图？',mtconfirmation,[mbYes,mbNo],0)=mrYes
      then begin
        Image2.picture.LoadfromFile('D:\sjsys\pnl1.bmp');
        vimag2:=0;
      end;
  if vimag8=1 then
    if messagedlg('是否更新Panel2的排版图？',mtconfirmation,[mbYes,mbNo],0)=mrYes
      then begin
        Image8.picture.LoadfromFile('D:\sjsys\pnl2.bmp');
        vimag8:=0;
      end;
end;

procedure TFrmPCBCut.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    key:=#0;
    perform(wm_nextdlgctl,0,0);{移动到下一个控件}
  end;
end;

procedure TFrmPCBCut.ComboBox1Exit(Sender: TObject);
begin
  if trim(combobox1.Text)='' then
    combobox1.Text :='0';
end;

procedure TFrmPCBCut.ComboBox2Exit(Sender: TObject);
begin
  if trim(combobox2.Text)='' then
    combobox2.Text :='0';
end;

procedure TFrmPCBCut.ComboBox4Exit(Sender: TObject);
begin
  if trim(combobox4.Text)='' then
    combobox4.Text :='0';
end;

procedure TFrmPCBCut.ComboBox10Exit(Sender: TObject);
begin
  if trim(combobox10.Text)='' then
    combobox10.Text :='0';
end;

procedure TFrmPCBCut.Edit10Change(Sender: TObject);
begin
  if trim(edit10.Text)<>'' then
    Adoquery7.Filter :='inv_part_number like '''+trim(edit10.Text)+'%'''
  else
    Adoquery7.Filter :='';
end;

procedure TFrmPCBCut.PageControl1Enter(Sender: TObject);
begin
  WImage.Canvas.Font.Size := UpDown3.Position;
end;

procedure TFrmPCBCut.SpeedButton21Click(Sender: TObject);
begin
  DrawingTool := dtDraw;
  Wimage.Cursor :=crCross;
  SpeedButton21.Down :=true;
  label45.Caption:='21';
end;

procedure TFrmPCBCut.SpeedButton22Click(Sender: TObject);
begin
  DrawingTool := dtDraw;
  Wimage.Cursor :=crCross;
  SpeedButton22.Down :=true;
  label45.Caption:='22';
end;

procedure TFrmPCBCut.SpeedButton23Click(Sender: TObject);
begin
  DrawingTool := dtDraw;
  Wimage.Cursor :=crCross;
  SpeedButton23.Down :=true;
  label45.Caption:='23';
end;

procedure TFrmPCBCut.SpeedButton24Click(Sender: TObject);
begin
  DrawingTool := dtDraw;
  Wimage.Cursor :=crCross;
  SpeedButton24.Down :=true;
  label45.Caption:='24';
end;

procedure TFrmPCBCut.SpeedButton27Click(Sender: TObject);
begin
  DrawingTool := dtDraw2;
  Wimage.Cursor :=crCross;
  SpeedButton21.Down :=true;
  label45.Caption:='27';
end;

procedure TFrmPCBCut.SpeedButton28Click(Sender: TObject);
begin
  DrawingTool := dtDraw2;
  Wimage.Cursor :=crCross;
  SpeedButton21.Down :=true;
  label45.Caption:='28';
end;

procedure TFrmPCBCut.Edit39KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8,#13]) then
    abort;
end;

procedure TFrmPCBCut.N7Click(Sender: TObject);
begin
  Print_Image(Image1,'    <<开料图>>',200,200);
end;

procedure TFrmPCBCut.Print_Image(V_Image: timage;Image_name: string; valuex, valuey: integer);
var
  ScaleX, ScaleY,Hone_Height: Integer;  //
  R,r1: TRect;//
begin
    try
    if PrintDialog1.Execute then begin
       Printer.BeginDoc;   //开始打印
       Hone_Height:=Printer.Canvas.TextHeight(Image_name);//打印字的高度
       ScaleX := GetDeviceCaps(Printer.Handle, logPixelsX) div PixelsPerInch;  //打印比例,调用API函数,取的打印机的每英寸点数
       ScaleY := GetDeviceCaps(Printer.Handle, logPixelsY) div PixelsPerInch;
       R := Rect(0, 0, V_Image.Picture.Width*ScaleX ,V_Image.Picture.Height*Scaley);
       r1:=rect(valuex,valuey,Hone_Height+valuex+V_Image.Picture.Width*ScaleX,Hone_Height+valuey+V_Image.Picture.Height*Scaley);//将要画图形的大小
       Printer.Canvas.StretchDraw(R1, V_Image.Picture.Graphic);//打印,大小为R,图形为V_Image
       Printer.Canvas.Font.Size :=12;
       Hone_Height:=Printer.Canvas.TextHeight(Image_name);//打印字的高度
       Printer.Canvas.TextOut(valuex,valuey+Hone_Height+v_image.Picture.Height*ScaleY,Image_name); //打印一行字 Image_name
    end;
    finally
        Printer.EndDoc;  //结束打印
    end;

end;

procedure TFrmPCBCut.A1Click(Sender: TObject);
begin
  Print_Image(Image2,'   <<排版图A>>',200,200);
end;

procedure TFrmPCBCut.B1Click(Sender: TObject);
begin
  Print_Image(Image8,'   <<排版图B>>',200,200);
end;

procedure TFrmPCBCut.Button6Click(Sender: TObject);
TYPE
   //存入输入的尺寸
   Input_PCB_SIZE_onePNL222222=record
        Unit_Long:currency;//单元长
        Unit_Width:currency;//单元宽
        Unit_Long_Space:currency;//单元长间距
        Unit_Width_Space:currency;//单元宽间距
        Unit_Long_ToPNL:currency;//单元长到边距离
        Unit_Width_ToPNL:currency;//单元宽到边距离
        Unit_Long_Number:integer;//单元长个数
        Unit_Width_Number:integer;//单元宽个数
        PNLA_Long:currency;//PNLA长
        PNLA_Width:currency;//PNLA宽

        PNLA_Long_Number:integer;//PNLA长个数
        PNLA_Width_Number:integer;//PNLA宽个数
        SHEET_Long:currency;//大料长
        SHEET_Width:currency;//大料宽
     end;
var
  Input_PCB_SIZE_onePNL22:Input_PCB_SIZE_onePNL222222;
  pnl_size_s2:pnl_size;//定义记录
 var_Sheet_Size_TwoPNL:Sheet_Size_twoPNL_1;//定义记录
  Input_Sheet_Size_15:Input_Sheet_Size_onePNL_1;//定义记录
  tem1:currency;
  tem2:integer;
  tem_Function1:boolean;
  i:integer;
  PNL_Informat311:PNL_Informat3311;
begin
ttype.Caption :='1';
try
  Image1.Picture :=Image14.Picture ;
  Image2.Picture :=Image14.Picture ;
  Image8.Picture :=Image14.Picture ;
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);//清除内容
  Image2.Canvas.Rectangle(0,0,Image2.Width,Image2.Height);//清除内容
  Image8.Canvas.Rectangle(0,0,Image8.Width,Image8.Height);//清除内容
  //tem_picture_number_1_one:=0;
  tem_Function1:=TryStrToCurr(edit15.text,tem1);
  if tem_Function1 then Input_PCB_SIZE_Onepnl22.Unit_Long:=tem1
   else
  begin
    showmessage('没有输入单元长!');
    exit;
  end;

  //Input_PCB_SIZE_Onepnl22.Unit_Width:=strtocurr(edit16.text); //单元宽
  tem_Function1:=TryStrToCurr(edit16.text,tem1);
  if tem_Function1 then Input_PCB_SIZE_Onepnl22.Unit_Width:=tem1
   else
  begin
    showmessage('没有输入单元宽!');
    exit;
  end;

  //Input_PCB_SIZE_Onepnl22.Unit_Long_Space:=1.5;//单元长间距
  tem_Function1:=TryStrToCurr(edit17.text,tem1);
  if tem_Function1 then Input_PCB_SIZE_Onepnl22.Unit_Long_Space:=tem1
   else
  begin
    showmessage('没有输入单元长间距!');
    exit;
  end;

  //Input_PCB_SIZE_Onepnl22.Unit_Width_Space:=1.5;//单元宽间距
  tem_Function1:=TryStrToCurr(edit18.text,tem1);
  if tem_Function1 then Input_PCB_SIZE_Onepnl22.Unit_Width_Space:=tem1
   else
  begin
    showmessage('没有输入单元宽间距!');
    exit;
  end;

  //Input_PCB_SIZE_Onepnl22.Unit_Long_ToPNL:=8.05;//单元长到边距离
  tem_Function1:=TryStrToCurr(edit19.text,tem1);
  if tem_Function1 then Input_PCB_SIZE_Onepnl22.Unit_Long_ToPNL:=tem1
   else
  begin
    showmessage('没有输入单元长到边距离!');
    exit;
  end;

  //Input_PCB_SIZE_Onepnl22.Unit_Width_ToPNL:=5.88;//单元宽到边距离
  tem_Function1:=TryStrToCurr(edit20.text,tem1);
  if tem_Function1 then Input_PCB_SIZE_Onepnl22.Unit_Width_ToPNL:=tem1
   else
  begin
    showmessage('没有输入单元宽到边距离!');
    exit;
  end;

  tem_Function1:=TryStrToint(edit39.text,tem2);
  if tem_Function1 then Input_PCB_SIZE_Onepnl22.Unit_Long_Number:=tem2
   else
  begin
    showmessage('没有输入单元长个数!');
    exit;
  end;

  tem_Function1:=TryStrToint(edit44.text,tem2);
  if tem_Function1 then Input_PCB_SIZE_Onepnl22.Unit_Width_Number:=tem2
   else
  begin
    showmessage('没有输入单元宽个数!');
    exit;
  end;


  tem_Function1:=TryStrToint(edit12.text,tem2);
  if tem_Function1 then Input_PCB_SIZE_Onepnl22.PNLA_Long_Number:=tem2
   else
  begin
    //showmessage('没有输入PNLA长个数!');
    //exit;
    Input_PCB_SIZE_Onepnl22.PNLA_Long_Number:=0;
  end;

  tem_Function1:=TryStrToint(edit13.text,tem2);
  if tem_Function1 then Input_PCB_SIZE_Onepnl22.PNLA_Width_Number:=tem2
   else
  begin
    //showmessage('没有输入PNLA宽个数!');
    //exit;
   Input_PCB_SIZE_Onepnl22.PNLA_Width_Number:=0;
  end;
    tem_Function1:=TryStrToCurr(edit14.text,tem1);
  if tem_Function1 then Input_PCB_SIZE_Onepnl22.SHEET_Long:=tem1
   else
  begin
    //showmessage('没有输入大料长!');
    //exit;
    Input_PCB_SIZE_Onepnl22.SHEET_Long :=0;
  end;

  tem_Function1:=TryStrToCurr(edit38.text,tem1);
  if tem_Function1 then Input_PCB_SIZE_Onepnl22.SHEET_Width:=tem1
   else
  begin
    //showmessage('没有输入大料宽!');
    //exit;
    Input_PCB_SIZE_Onepnl22.SHEET_Width:=0;
  end;


  //画排版图
  Input_PCB_SIZE_Onepnl22.PNLA_Long:=Input_PCB_SIZE_Onepnl22.Unit_Long*Input_PCB_SIZE_Onepnl22.Unit_Long_Number+Input_PCB_SIZE_Onepnl22.Unit_Long_Space*(Input_PCB_SIZE_Onepnl22.Unit_Long_Number-1)  +Input_PCB_SIZE_Onepnl22.Unit_Long_ToPNL*2  ;
  pnl_size_s2.Long1:=Input_PCB_SIZE_Onepnl22.PNLA_Long;
  Input_PCB_SIZE_Onepnl22.PNLA_Width:=Input_PCB_SIZE_Onepnl22.Unit_width*Input_PCB_SIZE_Onepnl22.Unit_width_Number+Input_PCB_SIZE_Onepnl22.Unit_width_Space*(Input_PCB_SIZE_Onepnl22.Unit_width_Number-1)  +Input_PCB_SIZE_Onepnl22.Unit_width_ToPNL*2  ;
  pnl_size_s2.Width1:=Input_PCB_SIZE_Onepnl22.PNLA_Width;
  pnl_size_s2.Unit_Long:=Input_PCB_SIZE_Onepnl22.Unit_Long;
  pnl_size_s2.Unit_Width:=Input_PCB_SIZE_Onepnl22.Unit_Width;
  pnl_size_s2.Unit_Long_ToUnit_Space:=Input_PCB_SIZE_Onepnl22.Unit_Long_Space;
  pnl_size_s2.Unit_Width_ToUnit_Space:=Input_PCB_SIZE_Onepnl22.Unit_Width_Space;
  pnl_size_s2.Unit_Long_PNL_Space:=Input_PCB_SIZE_Onepnl22.Unit_Long_ToPNL;
  pnl_size_s2.Unit_Width_PNL_Space:=Input_PCB_SIZE_Onepnl22.Unit_Width_ToPNL;
  pnl_size_s2.Unit_Long_Number:=Input_PCB_SIZE_Onepnl22.Unit_Long_Number;
  pnl_size_s2.Unit_Width_number:=Input_PCB_SIZE_Onepnl22.Unit_Width_Number;
  Draw_Picture1:=TDraw_Picture.Create ;
  Draw_Picture1.Input_pnl_size:=pnl_size_s2; //输入PNLA尺寸,用于画PNLA排版图

  image14.Canvas.Rectangle(0,0,image14.Width,image14.Height);//清除内容
  Draw_Picture1.Draw_PNL_Picture(image14.Canvas ,image14.Width ,image14.Height ); //画PNLA排版图,其中image14代表所要画的地方
  Image2.Canvas.Rectangle(0,0,Image2.Width,Image2.Height);//清除内容
  image2.Picture:=image14.Picture;

  Input_Sheet_Size_15.Sheet_Long:=strtocurr('0'+trim(edit38.Text));//大料长
  Input_Sheet_Size_15.Sheet_Width:=strtocurr('0'+trim(edit14.Text));//大料宽

  //画开料图
  if (((Input_PCB_SIZE_Onepnl22.PNLA_Long_Number=0) or (Input_PCB_SIZE_Onepnl22.PNLA_Width_Number=0)) and
      (Input_PCB_SIZE_Onepnl22.SHEET_Long>=Input_PCB_SIZE_Onepnl22.PNLA_Long) and (Input_PCB_SIZE_Onepnl22.SHEET_Width>=Input_PCB_SIZE_Onepnl22.PNLA_Width))

     or (((Input_PCB_SIZE_Onepnl22.PNLA_Long_Number=0) or (Input_PCB_SIZE_Onepnl22.PNLA_Width_Number=0)) and
     (Input_Sheet_Size_15.SHEET_Long>=Input_PCB_SIZE_Onepnl22.PNLA_Long) and (Input_Sheet_Size_15.Sheet_width>=Input_PCB_SIZE_Onepnl22.PNLA_Width)) then
  begin
    Aarray_Rectangle_onePNL1:=TAarray_Rectangle_onePNL1.Create;//建立类

    Aarray_Rectangle_onePNL1.Input_Sheet_Size[0]:=Input_Sheet_Size_15; //输入要求计算的大料尺寸,注意用数组表示
    //Input_Sheet_Size_15.Sheet_Long:=1030;//大料长
    //Input_Sheet_Size_15.Sheet_Width:=1004;//大料宽
    //Aarray_Rectangle_onePNL1.Input_Sheet_Size[1]:=Input_Sheet_Size_15; //输入要求计算的大料尺寸,注意用数组表示

   // Aarray_Rectangle_onePNL1.Input_PCB_SIZE:=Input_PCB_SIZE_onePNL22;//输入要求计算的单元尺寸等信息

    //Aarray_Rectangle_onePNL1.Calculate_Array_Complete_Percent:=ProgressBar2; //用于显示进度
    Aarray_Rectangle_onePNL1.Calculate_Array_Complete_Time_Display:=true;//显示计算时间
    //Aarray_Rectangle_onePNL1.Echange_Unit_To_Unit_Space:=true;//交换单元间距
    Aarray_Rectangle_onePNL1.Echange_Unit_To_PNL_Space:=true;//交换单到边距离
    Aarray_Rectangle_onePNL1.Calculate_Rate_Type:=1;//1用单元计算利用率2用PNL计算利用率,暂时不起作用
    Aarray_Rectangle_onePNL1.Calculate_Falchion_Number_Equality_Hold:=true;
    PNL_Informat311.Unit_Long:=Input_PCB_SIZE_Onepnl22.Unit_Long;
    PNL_Informat311.Unit_Width:=Input_PCB_SIZE_Onepnl22.Unit_Width;
    PNL_Informat311.Unit_Long_Space:=Input_PCB_SIZE_Onepnl22.Unit_Long_Space;
    PNL_Informat311.Unit_Width_Space:=Input_PCB_SIZE_Onepnl22.Unit_Width_Space;
    PNL_Informat311.Unit_Long_ToPNL:=Input_PCB_SIZE_Onepnl22.Unit_Long_ToPNL;
    PNL_Informat311.Unit_Width_ToPNL:=Input_PCB_SIZE_Onepnl22.Unit_Width_ToPNL;
    PNL_Informat311.Unit_Long_Number:=Input_PCB_SIZE_Onepnl22.Unit_Long_Number;
    PNL_Informat311.Unit_Width_Number:=Input_PCB_SIZE_Onepnl22.Unit_Width_Number;
    PNL_Informat311.PNLA_Long:=Input_PCB_SIZE_Onepnl22.PNLA_Long;
    PNL_Informat311.PNLA_Width:= Input_PCB_SIZE_Onepnl22.PNLA_Width;
    Aarray_Rectangle_onePNL1.PNL_Informat:=PNL_Informat311;

    Aarray_Rectangle_onePNL1.Calculate_PnlToSheet_Array ;//计算
    for i:=low(Tem_Result_makeup_using_Sheet_OnePNL_t1) to high(Tem_Result_makeup_using_Sheet_OnePNL_t1) do
    begin
      Tem_Result_makeup_using_Sheet_OnePNL_t2[i]:=Aarray_Rectangle_onePNL1.Calculate_Result[i];
    end;

    //------

       // Tem_Result_makeup_using_Sheet_OnePNL_t2[i].One_Section_Long_Number
       var_Sheet_Size_TwoPNL.One_PNLA_Long:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].One_Section_Long;//一区PNLA长
       var_Sheet_Size_TwoPNL.One_PNLA_Width:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].One_Section_width;//一区PNLA宽
       var_Sheet_Size_TwoPNL.One_PNLA_Long_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].One_Section_Long_Number;//一区PNLA长个数
       var_Sheet_Size_TwoPNL.One_PNLA_Width_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].One_Section_width_Number;//一区PNLA宽个数

       var_Sheet_Size_TwoPNL.Two_PNLA_Long:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].Two_Section_LongA ;
       var_Sheet_Size_TwoPNL.Two_PNLA_Width:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].two_Section_WidthA ;
       var_Sheet_Size_TwoPNL.Two_PNLA_Long_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].two_Section_Long_NumberA ;
       var_Sheet_Size_TwoPNL.Two_PNLA_Width_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].two_Section_Width_NumberA ;
       var_Sheet_Size_TwoPNL.Two_PNLB_Long:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].two_Section_LongB ;
       var_Sheet_Size_TwoPNL.Two_PNLB_Width:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].two_Section_WidthB ;

       var_Sheet_Size_TwoPNL.Two_PNLB_Long_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].two_Section_Long_NumberB ;
       var_Sheet_Size_TwoPNL.Two_PNLB_Width_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].two_Section_Width_NumberB ;
       var_Sheet_Size_TwoPNL.Three_PNLA_Long:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].Three_Section_LongA ;
       var_Sheet_Size_TwoPNL.Three_PNLA_Width:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].Three_Section_WidthA ;
       var_Sheet_Size_TwoPNL.Three_PNLA_Long_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].Three_Section_Long_NumberA ;
       var_Sheet_Size_TwoPNL.Three_PNLA_Width_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].Three_Section_Width_NumberA ;
       var_Sheet_Size_TwoPNL.Three_PNLB_Long:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].Three_Section_LongB ;
       var_Sheet_Size_TwoPNL.Three_PNLB_Width:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].Three_Section_WidthB ;
       var_Sheet_Size_TwoPNL.Three_PNLB_Long_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].Three_Section_Long_NumberB ;
       var_Sheet_Size_TwoPNL.Three_PNLB_Width_Number:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].Three_Section_Width_NumberB ;
       var_Sheet_Size_TwoPNL.Sheet_Long:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].Sheet_Long;
       var_Sheet_Size_TwoPNL.Sheet_Width:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].Sheet_Width;
       var_Sheet_Size_twoPNL.Two_Section_Array_type:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].Two_Section_Array_type;
       var_Sheet_Size_twoPNL.Three_Section_Array_type:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].Three_Section_Array_type;
       var_Sheet_Size_twoPNL.Draw_type:=Tem_Result_makeup_using_Sheet_OnePNL_t2[0].Draw_type;
      //       showmessage(currtostr(Tem_Result_makeup_using_Sheet_OnePNL_t2[0].Using_Rate));
      //  Draw_Picture1.Sheet_Size_TwoPNL:= Tem_Result_makeup_using_Sheet_OnePNL_t1[0];
       Draw_Picture1.Sheet_Size_TwoPNL:=var_Sheet_Size_twoPNL;//输入计算结果,用于画开料图
       image14.Canvas.Rectangle(0,0,image14.Width,image14.Height);//清除内容
       Draw_Picture1.Draw_Sheet_onePNL_Picture(image14.Canvas ,image14.Width ,image14.Height);
       image1.Picture:=image14.Picture;
    //--
    Aarray_Rectangle_onePNL1.Free;
  end;

  if (Input_PCB_SIZE_Onepnl22.PNLA_Long_Number>0) and (Input_PCB_SIZE_Onepnl22.PNLA_Width_Number>0) and (Input_PCB_SIZE_Onepnl22.SHEET_Long>=Input_PCB_SIZE_Onepnl22.PNLA_Long) and (Input_PCB_SIZE_Onepnl22.SHEET_Width>=Input_PCB_SIZE_Onepnl22.PNLA_Width) then
  begin
    tem_Function1:=(Input_PCB_SIZE_Onepnl22.SHEET_width>=Input_PCB_SIZE_Onepnl22.PNLA_width*Input_PCB_SIZE_Onepnl22.PNLA_width_Number ) and (Input_PCB_SIZE_Onepnl22.SHEET_Long>=Input_PCB_SIZE_Onepnl22.PNLA_Long*Input_PCB_SIZE_Onepnl22.PNLA_Long_Number)  ;
    if tem_Function1=false then
    begin
      if MessageDlg('大料小于板长与个数的乘积,是否要画图形?',
                    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                      tem_Function1:=true;
    end;
    if  tem_Function1  then
    begin
       var_Sheet_Size_TwoPNL.One_PNLA_Long:=Input_PCB_SIZE_Onepnl22.PNLA_Long;//一区PNLA长
       var_Sheet_Size_TwoPNL.One_PNLA_Width:=Input_PCB_SIZE_Onepnl22.PNLA_Width;//一区PNLA宽
       var_Sheet_Size_TwoPNL.One_PNLA_Long_Number:=Input_PCB_SIZE_Onepnl22.PNLA_Long_Number;//一区PNLA长个数
       var_Sheet_Size_TwoPNL.One_PNLA_Width_Number:=Input_PCB_SIZE_Onepnl22.PNLA_Width_Number;//一区PNLA宽个数
       var_Sheet_Size_TwoPNL.Two_PNLA_Long:=0;
       var_Sheet_Size_TwoPNL.Two_PNLA_Width:=0;
       var_Sheet_Size_TwoPNL.Two_PNLA_Long_Number:=0;
       var_Sheet_Size_TwoPNL.Two_PNLA_Width_Number:=0;
       var_Sheet_Size_TwoPNL.Two_PNLB_Long:=0;
       var_Sheet_Size_TwoPNL.Two_PNLB_Width:=0;

       var_Sheet_Size_TwoPNL.Two_PNLB_Long_Number:=0;
       var_Sheet_Size_TwoPNL.Two_PNLB_Width_Number:=0;
       var_Sheet_Size_TwoPNL.Three_PNLA_Long:=0;
       var_Sheet_Size_TwoPNL.Three_PNLA_Width:=0;
       var_Sheet_Size_TwoPNL.Three_PNLA_Long_Number:=0;
       var_Sheet_Size_TwoPNL.Three_PNLA_Width_Number:=0;
       var_Sheet_Size_TwoPNL.Three_PNLB_Long:=0;
       var_Sheet_Size_TwoPNL.Three_PNLB_Width:=0;
       var_Sheet_Size_TwoPNL.Three_PNLB_Long_Number:=0;
       var_Sheet_Size_TwoPNL.Three_PNLB_Width_Number:=0;
       var_Sheet_Size_TwoPNL.Sheet_Long:=Input_PCB_SIZE_Onepnl22.SHEET_Long ;
       var_Sheet_Size_TwoPNL.Sheet_Width:=Input_PCB_SIZE_Onepnl22.SHEET_Width;
       var_Sheet_Size_twoPNL.Two_Section_Array_type:=1;
       var_Sheet_Size_twoPNL.Three_Section_Array_type:=1;
       var_Sheet_Size_twoPNL.Draw_type:=1;

       Draw_Picture1.Sheet_Size_TwoPNL:=var_Sheet_Size_twoPNL;//输入计算结果,用于画开料图
       image14.Canvas.Rectangle(0,0,image14.Width,image14.Height);//清除内容
       Draw_Picture1.Draw_Sheet_onePNL_Picture(image14.Canvas ,image14.Width ,image14.Height);
       image1.Picture:=image14.Picture;
    end;
  end;
  SpinEdit2.Text :=Edit5.Text ;
  SpinEdit3.Text :=Edit6.Text ;
  Edit5.Text :=floattostr(var_Sheet_Size_TwoPNL.One_PNLA_Long);
  Edit6.Text :=floattostr(var_Sheet_Size_TwoPNL.One_PNLA_Width);
  label9.Caption :=floattostr(var_Sheet_Size_TwoPNL.One_PNLA_Long_Number*var_Sheet_Size_TwoPNL.One_PNLA_Width_Number
  +var_Sheet_Size_TwoPNL.two_PNLA_Long_Number*var_Sheet_Size_TwoPNL.two_PNLA_Width_Number
  +var_Sheet_Size_TwoPNL.three_PNLA_Long_Number*var_Sheet_Size_TwoPNL.three_PNLA_Width_Number
  +var_Sheet_Size_TwoPNL.two_PNLB_Long_Number*var_Sheet_Size_TwoPNL.two_PNLB_Width_Number
  +var_Sheet_Size_TwoPNL.three_PNLB_Long_Number*var_Sheet_Size_TwoPNL.three_PNLB_Width_Number );
  label7.Caption :=floattostr(Input_PCB_SIZE_Onepnl22.Unit_Long_Number*Input_PCB_SIZE_Onepnl22.Unit_Width_Number );
  label32.Caption :='0';
  label30.Caption :='0';
  label36.Caption :=floattostr(strtoint(Label7.Caption)*strtoint(Label9.Caption));
  label38.Caption :=label9.Caption ;
  if Input_PCB_SIZE_Onepnl22.SHEET_Width>0 then
  begin
    label14.Caption :=floattostr(100*Input_PCB_SIZE_Onepnl22.Unit_Long*Input_PCB_SIZE_Onepnl22.Unit_width*strtoint(label36.caption)/Input_PCB_SIZE_Onepnl22.SHEET_Long /Input_PCB_SIZE_Onepnl22.SHEET_Width);
    label16.Caption :=floattostr(Input_PCB_SIZE_Onepnl22.SHEET_Long);
    label59.Caption :=floattostr(Input_PCB_SIZE_Onepnl22.SHEET_Width);
  end else
  begin
    label14.Caption :='0';
    label16.Caption :='0';
    label59.Caption :='0';
  end;
  Edit1.Text :=Edit15.Text;
  Edit3.Text :=Edit16.Text;
  Combobox3.Text:=Edit17.Text ;
  Combobox5.Text:=Edit18.Text ;
  Combobox11.Text:=Edit19.Text ;
  Combobox13.Text:=Edit20.Text ;
  Edit5.Text :=floattostr(Input_PCB_SIZE_Onepnl22.PNLA_Long );
  Edit6.Text :=floattostr(Input_PCB_SIZE_Onepnl22.PNLA_Width );
  Edit7.Text :='0';
  Edit8.Text :='0';
  Spinedit2.Text :=Edit5.Text ;
  Spinedit3.Text :=Edit6.Text ;
  Spinedit4.Text :='0';
  Spinedit5.Text :='0';
  SpinEdit1.Text :='1';

  Draw_Picture1.Free;
except
end;
end;

procedure TFrmPCBCut.Edit15KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#13,#8]) then
    abort;
if (key = chr(46)) then  //如果是小数点
if pos('.',(sender as TEdit).Text)>0 then  //小数点不能重复
  abort;
end;

end.


