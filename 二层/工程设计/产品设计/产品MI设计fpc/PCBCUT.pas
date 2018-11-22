unit PCBCUT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ToolWin, ComCtrls, ExtCtrls, ImgList, StdCtrls, Buttons,
  Grids, Spin, DBGridEh,math,jpeg, ExtDlgs, ppCtrls, ppPrnabl, ppClass,
  ppBands, ppCache, ppComm, ppRelatv, ppProd, ppReport, AxCtrls, ppVar,
  ppModule, DB, ADODB,Spell,Spell2,ShellCtrls,shellapi, ppDB, ppDBPipe;

type
  TDrawingTool = (dtselect,dtLine,dtRectangle,dtEllipse,dtroundrect,dttext,dttext2,dtarrow);
  //dtselect失效,dttext2特殊文字,dtarrow画箭头,
  TFrm_PCBCUT = class(TForm)
    Panel1: TPanel;
    ToolBar1: TToolBar;
    tbsave: TToolButton;
    tbinport: TToolButton;
    tboutput: TToolButton;
    tbprint: TToolButton;
    tbclear: TToolButton;
    ImageList1: TImageList;
    ToolButton8: TToolButton;
    Panel2: TPanel;
    Panel3: TPanel;
    btrectangle: TSpeedButton;
    btline: TSpeedButton;
    Label31: TLabel;
    bterase: TSpeedButton;
    btselect: TSpeedButton;
    btarrow1: TSpeedButton;
    btarrow2: TSpeedButton;
    btspec8: TSpeedButton;
    btspec7: TSpeedButton;
    btspec6: TSpeedButton;
    btspec5: TSpeedButton;
    btspec4: TSpeedButton;
    btspec3: TSpeedButton;
    btspec2: TSpeedButton;
    btspec1: TSpeedButton;
    btellipse: TSpeedButton;
    bttext: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    PenSize: TEdit;
    PenWidth: TUpDown;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    SpinEdit1: TSpinEdit;
    Label13: TLabel;
    Label14: TLabel;
    Edit13: TEdit;
    Edit14: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Edit15: TEdit;
    Edit16: TEdit;
    CheckBox1: TCheckBox;
    GroupBox3: TGroupBox;
    stringgrid1: TStringGrid;
    CheckBox2: TCheckBox;
    GroupBox5: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    GroupBox6: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Label20: TLabel;
    Label29: TLabel;
    Edit28: TEdit;
    Edit29: TEdit;
    Bevel3: TBevel;
    BitBtn2: TBitBtn;
    Label30: TLabel;
    Edit30: TEdit;
    Eh1: TDBGridEh;
    tbundo: TToolButton;
    colortype: TPanel;
    ColorDialog1: TColorDialog;
    StatusBar1: TStatusBar;
    Label32: TLabel;
    Label40: TLabel;
    Font_size: TEdit;
    Fontsize: TUpDown;
    Bevel5: TBevel;
    PrintDlg: TPrintDialog;
    OpenDlg: TOpenPictureDialog;
    SaveDlg: TSavePictureDialog;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    ppImage1: TppImage;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppLabel7: TppLabel;
    ppLabel5: TppLabel;
    ppLabel8: TppLabel;
    ppLabel6: TppLabel;
    ppLabel9: TppLabel;
    ppImage2: TppImage;
    ppImage3: TppImage;
    ppLabel12: TppLabel;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel34: TppLabel;
    ppLabel33: TppLabel;
    ppLabel32: TppLabel;
    ppLabel31: TppLabel;
    ppLabel30: TppLabel;
    ppLabel29: TppLabel;
    ppLabel28: TppLabel;
    ppLabel27: TppLabel;
    ppLabel26: TppLabel;
    ppLabel25: TppLabel;
    ppLabel24: TppLabel;
    ppShape3: TppShape;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppShape6: TppShape;
    Image5: TImage;
    Image4: TImage;
    ppLabel11: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ADOQuery7: TADOQuery;
    ADOQuery7inv_part_number: TStringField;
    ADOQuery7inv_part_description: TStringField;
    ADOQuery7unit_code: TStringField;
    ADOQuery7quan_on_hand: TBCDField;
    ADOQuery7abbr_name: TStringField;
    ADOQuery7ship_DATE: TDateTimeField;
    DataSource4: TDataSource;
    ADOQuery9: TADOQuery;
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
    BitBtn3: TBitBtn;
    ProgressBar1: TProgressBar;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PageControl1: TPageControl;
    TabSheet4: TTabSheet;
    Image1: TImage;
    Panel5: TPanel;
    Label44: TLabel;
    inputtext: TEdit;
    btntext: TBitBtn;
    TabSheet5: TTabSheet;
    Image2: TImage;
    TabSheet6: TTabSheet;
    Image3: TImage;
    Image14: TImage;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    GroupBox4: TGroupBox;
    Label56: TLabel;
    Label57: TLabel;
    BtnMicroAdapt: TBitBtn;
    Panel6: TPanel;
    sgrid1: TStringGrid;
    Panel7: TPanel;
    Label38: TLabel;
    Edit33: TEdit;
    Label39: TLabel;
    Edit31: TEdit;
    Label41: TLabel;
    Edit32: TEdit;
    Edit42: TEdit;
    Edit43: TEdit;
    Edit44: TEdit;
    Edit45: TEdit;
    Label42: TLabel;
    Label43: TLabel;
    btarrow3: TSpeedButton;
    CheckBox4: TCheckBox;
    btroundrect: TSpeedButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    btrefresh: TToolButton;
    SpinEdit2: TSpinEdit;
    Label37: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Edit1: TEdit;
    Label49: TLabel;
    Edit38: TEdit;
    Edit39: TEdit;
    Shape1: TShape;
    Edit40: TEdit;
    Shape2: TShape;
    GroupBox7: TGroupBox;
    Label9: TLabel;
    Label11: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Shape3: TShape;
    Shape6: TShape;
    GroupBox8: TGroupBox;
    Edit34: TEdit;
    Edit35: TEdit;
    Edit36: TEdit;
    Edit37: TEdit;
    Shape4: TShape;
    Shape5: TShape;
    Label10: TLabel;
    Label12: TLabel;
    ado493: TADOQuery;
    ado493Company_Name: TStringField;
    ado493Company_Name2: TStringField;
    ado493Company_Name3: TStringField;
    ado493ship_address: TStringField;
    ado493Company_Icon: TBlobField;
    ado493SITE_INFO_ADD_1: TStringField;
    ado493SITE_INFO_ADD_2: TStringField;
    ado493SITE_INFO_ADD_3: TStringField;
    ado493SITE_INFO_PHONE: TStringField;
    ppDB493: TppDBPipeline;
    DataSource1: TDataSource;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    pfldDB493ppField1: TppField;
    pfldDB493ppField2: TppField;
    pfldDB493ppField3: TppField;
    pfldDB493ppField4: TppField;
    pfldDB493ppField5: TppField;
    pfldDB493ppField6: TppField;
    pfldDB493ppField7: TppField;
    pfldDB493ppField8: TppField;
    pfldDB493ppField9: TppField;
    ADOQuery9ISSUSE_AREA_DAY: TBCDField;
    ADOQuery9ppc_control_27: TBCDField;
    procedure bttextClick(Sender: TObject);

    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure colortypeClick(Sender: TObject);
    procedure ColorDialog1Show(Sender: TObject);
    procedure btlineClick(Sender: TObject);
    procedure btrectangleClick(Sender: TObject);
    procedure btellipseClick(Sender: TObject);
    procedure btarrow1Click(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure TabSheet6Show(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState;X,Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure PenSizeChange(Sender: TObject);
    procedure btselectClick(Sender: TObject);
    procedure btspec1Click(Sender: TObject);
    procedure Font_sizeChange(Sender: TObject);
    procedure inputtextExit(Sender: TObject);
    procedure tbundoClick(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure O1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure stringgrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure stringgrid1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure CheckBox2Click(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit30Change(Sender: TObject);
    procedure Eh1TitleClick(Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure btarrow2Click(Sender: TObject);
    procedure P1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BtnMicroAdaptClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure tbsaveClick(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure btarrow3Click(Sender: TObject);
    procedure btroundrectClick(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure btrefreshClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    arrowttype:byte; //箭头类型，0双箭头和1单箭头
    precolumn:Tcolumneh;
    myimage:Timage;    //画图时用
    tempimage:Timage;  //临时存储，撤消操作时用
    isdrawing:boolean; //画图状态
    origin,movept:Tpoint; //画图起点和终点坐标
    text_tool:Tspeedbutton;  //画图工具(线，方形...)
    ttype:string;            //1:代表自动单拼版 ;2:代表自动双拼版;''为编辑图片; 0:手动拼版;3:导入图片;A:为异常
    rkey:string;             //拼版完成
    iSel:integer;

    Param_Sheet:array of TParam_Sheet;
    Result_MakeUp2:array of TResult_MakeUp2; //存放计算后的结果值
    Result_MakeUp:array of TResult_MakeUp;  //存放计算后的结果值

    procedure set_stretch(btype:boolean);
    procedure sav;
    procedure AutoSpell;
    procedure SpellPNL(pnls:integer);
    procedure DrawPNL(i:integer);
    procedure DrawPNL2(i:integer);
    procedure MicroAdapt;
    function MicroAdapt1(const Pal,Paw: currency;var value1: TResult_MakeUp): boolean; //用于处理尺寸变换
    function MicroAdapt2(const Pal,Paw,Pbl,Pbw:currency;var value1:TResult_MakeUp2):boolean;
    function svValid:boolean;
  public
    drawingtool:Tdrawingtool;
    vimag1,vimag2,vimag3:integer;
    procedure init;
    procedure DrawShape(Vimage:TImage;TopLeft, BottomRight: TPoint; AMode: TPenMode);
  end;

var
  Frm_PCBCUT: TFrm_PCBCUT;


implementation

uses damo,Draw_Picture_Unit,common;

{$R *.dfm}

procedure TFrm_PCBCUT.DrawShape(Vimage:TImage;TopLeft, BottomRight: TPoint; AMode: TPenMode);
const alen=20; //箭头长度
var text_w,text_h:integer; //特殊字符的宽度高度中心点
    d:real;  //线长
    x1,y1,x2,y2:integer; //起点终点坐标
    xa,ya,xb,yb:integer; //两个箭头终点坐标
begin   // 根据DrawingTool 变量设置的画具种类,调用对应的绘图方法
  Vimage.Canvas.Font.Name:='Arial Narrow';  //字体
  Vimage.Canvas.Pen.Mode := AMode;
  case DrawingTool of
    dtLine:
      begin
        Vimage.Canvas.MoveTo(TopLeft.X, TopLeft.Y);
        Vimage.Canvas.LineTo(BottomRight.X, BottomRight.Y);
      end;
    dtRectangle:Vimage.Canvas.Rectangle(TopLeft.X, TopLeft.Y, BottomRight.X,BottomRight.Y);
    dtellipse:Vimage.Canvas.Ellipse(TopLeft.X,TopLeft.Y,BottomRight.X,BottomRight.Y);
    dtroundrect:Vimage.Canvas.RoundRect(TopLeft.X,TopLeft.Y,BottomRight.X,BottomRight.Y,
                   (TopLeft.X - BottomRight.X) div 2,(TopLeft.Y - BottomRight.Y) div 2);
    dtText:Vimage.canvas.TextOut(Topleft.X, TopLeft.Y,inputtext.Text);
    dtText2:  //特殊字符
      begin
        text_w:=trunc(tempimage.Canvas.TextWidth(text_tool.Caption)/2);
        text_h:=trunc(tempimage.Canvas.TextHeight(text_tool.Caption)/2);
        Vimage.canvas.TextOut(Topleft.X-text_w, TopLeft.Y-text_h,text_tool.Caption);
      end;
    dtarrow: //画箭头
      begin
        x1:=Origin.X;
        y1:=Origin.Y;
        x2:=MovePt.X;
        y2:=MovePt.Y;
        d:=sqrt(sqr(y2-y1)+sqr(x2-x1));
        if d>0 then
        begin
          vimage.Canvas.MoveTo(x1,y1);
          vimage.Canvas.LineTo(x2,y2);
          xa:=trunc(x2+alen*((x1-x2)+(y1-y2)/2)/d);
          ya:=trunc(y2+alen*((y1-y2)-(x1-x2)/2)/d);
          xb:=trunc(x2+alen*((x1-x2)-(y1-y2)/2)/d);
          yb:=trunc(y2+alen*((y1-y2)+(x1-x2)/2)/d);
          case arrowttype of
           0:  //如为双箭头
           begin
            vimage.Canvas.MoveTo(x2,y2);
            vimage.Canvas.LineTo(xa,ya);
            vimage.Canvas.MoveTo(x2,y2);
            vimage.Canvas.LineTo(xb,yb);
           end;
           1:
           begin
            vimage.Canvas.MoveTo(x2,y2);
            vimage.Canvas.LineTo(xb,yb);
           end;
           2:
           begin
            vimage.Canvas.MoveTo(x2,y2);
            vimage.Canvas.LineTo(xa,ya);
           end;
          end; //end case
        end;
      end;  //end arrow
  end;
end;

procedure TFrm_PCBCUT.set_stretch(btype:boolean);
begin
  case pagecontrol1.ActivePageIndex of
    0:image1.Stretch:=btype;
    1:image2.Stretch:=btype;
    2:image3.Stretch:=btype;
  end;
end;

procedure TFrm_PCBCUT.bttextClick(Sender: TObject);
var rtpanel:TRect;
begin
  drawingtool:=dtselect; //不能画任何图
  panel5.Visible:=true;
  inputtext.SetFocus;
  myImage.Cursor:=crIBeam;
  rtpanel:=panel4.BoundsRect; //锁定鼠标范围
  MapWindowPoints(panel2.Handle,0,rtpanel,2); //座标换算
  ClipCursor(@rtpanel); //限制鼠标移动区域
end;

procedure TFrm_PCBCUT.inputtextExit(Sender: TObject);
var rtscreen:TRect;
begin
  if trim(inputtext.Text)<>'' then
    drawingtool:=dttext;
  panel5.Visible:=false;
  rtscreen:=rect(0,0,screen.Width,screen.Height); //解除鼠标锁定
  ClipCursor(@rtscreen); //限制鼠标移动区域
end;

procedure TFrm_PCBCUT.FormCreate(Sender: TObject);
begin
  ttype:='';
  myImage:=image1;
end;

procedure TFrm_PCBCUT.FormShow(Sender: TObject);
begin
  pagecontrol1.ActivePageIndex :=0;
  Pagecontrol2.ActivePageIndex :=0;
  stringgrid1.Cells[0,0]:='长度(mm)';
  stringgrid1.Cells[1,0]:='宽度(mm)';
  stringgrid1.Cells[2,0]:='选取';
  stringgrid1.ColWidths[0]:=80;
  stringgrid1.ColWidths[1]:=80;
  stringgrid1.ColWidths[2]:=50;
  dm.aqtmp.Close;
  dm.aqtmp.sql.Text:='select selected,Length,Width from data0503 order by rkey';
  dm.aqtmp.Open;
  stringgrid1.RowCount:=dm.aqtmp.RecordCount+1;
  while not dm.aqtmp.eof do
  begin
    stringgrid1.Cells[0,dm.aqtmp.recno]:=dm.aqtmp.fieldbyname('Length').AsString;
    stringgrid1.Cells[1,dm.aqtmp.RecNo]:=dm.aqtmp.fieldbyname('width').AsString;
    stringgrid1.Cells[2,dm.aqtmp.recno]:=dm.aqtmp.fieldbyname('selected').AsString;
    dm.aqtmp.next;
  end;
  dm.aqtmp.Close;
  Canvas.Pen.Style := psInsideFrame;
  DrawingTool := dtSelect;

  sgrid1.Cells[0,0]:='序号';
  sgrid1.Cells[1,0]:='利用率%';
  sgrid1.Cells[2,0]:='大料长';
  sgrid1.Cells[3,0]:='大料宽';
  sgrid1.Cells[4,0]:='总Pnl数';
  sgrid1.Cells[5,0]:='总Set数';
  sgrid1.Cells[6,0]:='总Pcs数';
  sgrid1.ColWidths[0]:=29;
  sgrid1.ColWidths[1]:=52;
  sgrid1.ColWidths[2]:=42;
  sgrid1.ColWidths[3]:=42;
  sgrid1.ColWidths[4]:=51;
  sgrid1.ColWidths[5]:=51;
  sgrid1.ColWidths[6]:=51;

  tempimage:=Timage.Create(self);
  image1.Parent.DoubleBuffered:=true;
  image2.Parent.DoubleBuffered:=true;
  image3.Parent.DoubleBuffered:=true;
  precolumn:=eh1.Columns[0];
  dm.AQ17.Open;

  init;
end;

procedure TFrm_PCBCUT.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    key:=#0;
    perform(wm_nextdlgctl,0,0);{移动到下一个控件}
  end;
end;

procedure TFrm_PCBCUT.colortypeClick(Sender: TObject);
begin
  ColorDialog1.Color := colortype.Font.Color;
  if ColorDialog1.Execute then
  begin
    colortype.Font.Color:=ColorDialog1.Color;
    myImage.Canvas.Pen.Color:=ColorDialog1.Color;
    myImage.Canvas.Font.Color:=ColorDialog1.Color;
  end;
end;

procedure TFrm_PCBCUT.ColorDialog1Show(Sender: TObject);
begin
  SetWindowPos(colordialog1.Handle,HWND_TOP,135,175,220,300,SWP_DRAWFRAME);
end;

procedure TFrm_PCBCUT.btselectClick(Sender: TObject);
begin
  drawingtool:=dtselect;
  myImage.Cursor:=crHandpoint;
end;

procedure TFrm_PCBCUT.btlineClick(Sender: TObject);
begin
  drawingtool:=dtline;
  myImage.Cursor:=crCross;
end;

procedure TFrm_PCBCUT.btrectangleClick(Sender: TObject);
begin
  drawingtool:=dtrectangle;
  myImage.Cursor:=crCross;
end;

procedure TFrm_PCBCUT.btellipseClick(Sender: TObject);
begin
  drawingtool:=dtellipse;
  myImage.Cursor:=crCross;
end;

procedure TFrm_PCBCUT.btroundrectClick(Sender: TObject);
begin
  drawingtool:=dtroundrect;
  myImage.Cursor:=crCross;
end;

procedure TFrm_PCBCUT.btarrow1Click(Sender: TObject);
begin
  drawingtool:=dtarrow;
  arrowttype:=0;
  myImage.Cursor:=crCross;
end;

procedure TFrm_PCBCUT.btarrow2Click(Sender: TObject);
begin
  drawingtool:=dtarrow;
  arrowttype:=1;
  myImage.Cursor:=crCross;
end;

procedure TFrm_PCBCUT.btarrow3Click(Sender: TObject);
begin
  drawingtool:=dtarrow;
  arrowttype:=2;
  myImage.Cursor:=crCross;
end;

procedure TFrm_PCBCUT.TabSheet4Show(Sender: TObject);
begin
  image1.Cursor :=myImage.Cursor;
  myImage:=image1;
  Image1.Canvas.Pen.Width:=PenWidth.Position;
  Image1.Canvas.Pen.Color:=colortype.Font.Color;
  Image1.Canvas.Font.Size:=Fontsize.position;
  Image1.Canvas.Font.Color:=colortype.Font.Color;
end;

procedure TFrm_PCBCUT.TabSheet5Show(Sender: TObject);
begin
  image2.Cursor :=myImage.Cursor;
  myImage:=image2;
  Image2.Canvas.Pen.Width := PenWidth.Position;
  Image2.Canvas.Pen.Color:=colortype.Font.Color;
  Image2.Canvas.Font.Size:=Fontsize.position;
  Image2.Canvas.Font.Color:=colortype.Font.Color;
end;

procedure TFrm_PCBCUT.TabSheet6Show(Sender: TObject);
begin
  image3.Cursor :=myImage.Cursor;
  myImage:=image3;
  Image3.Canvas.Pen.Width := PenWidth.Position;
  Image3.Canvas.Pen.Color:=colortype.Font.Color;
  Image3.Canvas.Font.Size:=Fontsize.position;
  Image3.Canvas.Font.Color:=colortype.Font.Color;
end;

procedure TFrm_PCBCUT.Image1MouseDown(Sender: TObject; Button: TMouseButton;  Shift: TShiftState; X, Y: Integer);
begin
  myimage:=sender as timage;
  tempimage.Picture:=myimage.Picture;
  if (Button=mbLeft) and (drawingtool<>dtselect) then
  begin
    isdrawing := True;
    myimage.Canvas.MoveTo(X, Y);
    Origin := Point(X, Y); //取得要绘制图形的起点
    MovePt := Origin;
    StatusBar1.Panels[0].Text := Format('Origin: (%d, %d)', [X, Y]);
    tbundo.Enabled:=true; //撤消按钮有效
  end;
end;

procedure TFrm_PCBCUT.Image1MouseMove(Sender: TObject; Shift: TShiftState;X, Y: Integer);
  procedure getendpoint;
  var dist_x,dist_y,temp_x:integer; //temp_x用做除数
  begin
    dist_x:=abs(X-origin.X);
    dist_y:=abs(Y-origin.Y);
    if (ssshift in shift) and (drawingtool in [dtrectangle,dtellipse,dtroundrect]) then
    begin  //画正方形，正圆形,正方圆结束
      if X-origin.X>0 then
        movept.X:=origin.X+min(dist_x,dist_y)
      else movept.X:=origin.X-min(dist_x,dist_y);
      if Y-origin.Y>0 then
        movept.Y:=origin.Y+min(dist_x,dist_y)
      else movept.Y:=origin.Y-min(dist_x,dist_y);
    end
    else if (ssshift in shift) and ((drawingtool=dtline) or (drawingtool=dtarrow)) then
    begin  //画线，画箭头
      if dist_x=0 then temp_x:=1
      else temp_x:=dist_x;  //除数不允许为0
      if (dist_y/temp_x<1.5) and (dist_y/temp_x>0.5) then
      begin
        if X-origin.X>0 then
          movept.X:=origin.X+min(dist_x,dist_y)
        else movept.X:=origin.X-min(dist_x,dist_y);
        if Y-origin.Y>0 then
          movept.Y:=origin.Y+min(dist_x,dist_y)
        else movept.Y:=origin.Y-min(dist_x,dist_y);
      end
      else if dist_y>dist_x then
      begin
        movept.X:=origin.X;
        movept.Y:=Y;
      end
      else if dist_y<dist_x then
      begin
        movept.X:=X;
        movept.Y:=origin.Y;
      end;
    end //画45度或90度直线结束
    else MovePt := Point(X, Y);
  end; //过程结束
  
begin
  myimage:=sender as timage;
  if isdrawing then
    if not bterase.Down then
    begin
      DrawShape(myimage,Origin, MovePt, pmNotXor);
      getendpoint;
      DrawShape(myimage,Origin, MovePt, pmNotXor);
    end
    else begin
      getendpoint;
      DrawShape(myimage,Origin, MovePt, pmwhite);
    end;
  StatusBar1.Panels[0].Text:=Format('当前坐标: (%d, %d)', [X, Y]); //将鼠标当前的坐标显示在窗体标题上
end;

procedure TFrm_PCBCUT.Image1MouseUp(Sender:TObject;Button:TMouseButton;Shift:TShiftState;X,Y:Integer);
begin
  myimage:=sender as timage;
  if isdrawing then
  begin
    isdrawing := False; //结束拖动鼠标
    if not bterase.Down then
      DrawShape(myimage,Origin,MovePt,pmCopy)   //Point(X, Y), pmMask
    else DrawShape(myimage,Origin,MovePt,pmWhite);
  end;
end;

procedure TFrm_PCBCUT.PenSizeChange(Sender: TObject);
begin
  myimage.Canvas.Pen.Width:=penwidth.Position;
end;

procedure TFrm_PCBCUT.Font_sizeChange(Sender: TObject);
begin
  myimage.Canvas.Font.Size:=fontsize.Position;
end;

procedure TFrm_PCBCUT.btspec1Click(Sender: TObject);
begin
  drawingtool:=dttext2;
  myImage.Cursor:=crCross;
  text_tool:=sender as Tspeedbutton;
end;

procedure TFrm_PCBCUT.tbundoClick(Sender: TObject);
begin
  myimage.Picture:=tempimage.Picture;
  tbundo.Enabled:=false;
end;

procedure TFrm_PCBCUT.I1Click(Sender: TObject);
var myjpg:Tjpegimage;
    mybmp:Tbitmap;
    infile,inext:string;
begin
  if not opendlg.Execute then exit;
  Edit2.ReadOnly:=false;
  Edit3.ReadOnly:=false;
  Edit4.ReadOnly:=false;
  Edit5.ReadOnly:=false;

  Edit42.ReadOnly:=false;
  Edit43.ReadOnly:=false;
  Edit44.ReadOnly:=false;
  Edit45.ReadOnly:=false;
  BtnMicroAdapt.Enabled:=false;
  Panel7.Visible:=true;

  sgrid1.RowCount:=2;
  sgrid1.Cells[0,1]:='';
  sgrid1.Cells[1,1]:='';
  sgrid1.Cells[2,1]:='';
  sgrid1.Cells[3,1]:='';
  sgrid1.Cells[4,1]:='';
  sgrid1.Cells[5,1]:='';
  sgrid1.Cells[6,1]:='';

  if MessageBox(self.Handle,pchar('是否清空原参数?'),pchar('提示'),MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)=IDYES	then
  begin
    Edit42.Text:='0';
    Edit43.Text:='0';
    Edit44.Text:='0';
    Edit45.Text:='0';

    Edit2.Text:='';
    Edit3.Text:='';
    Edit4.Text:='';
    Edit5.Text:='';

    Edit6.Text:='';
    Edit7.Text:='';
    Edit8.Text:='';
  end else begin
    Edit33.Text:=Dm.ads502.Fieldbyname('Tusage').AsString;
    Edit31.Text:=Dm.ads502.Fieldbyname('sht_len').AsString;
    Edit32.Text:=Dm.ads502.Fieldbyname('sht_wth').AsString;
  end;
  infile:=opendlg.FileName;
  inext:=uppercase(extractfileext(infile));
  if (inext='.JPG') or (inext='.JPEG') then  //导入jpeg格式文件
  begin
    myjpg:=Tjpegimage.create;
    myjpg.LoadFromFile (infile);
    mybmp:=tbitmap.Create ;
    mybmp.Assign (myjpg);
    myimage.picture.Assign (mybmp);
    if (mybmp.Width>myimage.Width) or (mybmp.Height>myimage.Height) then
      set_stretch(true) //图片是否需拉伸
    else set_stretch(false);
    myjpg.Free ;
    mybmp.free;  
  end;
  if inext='.BMP' then  //导入bmp格式文件
  begin
    mybmp:=tbitmap.Create;
    mybmp.LoadFromFile (infile);
    myimage.picture.Assign (mybmp);
    if (mybmp.Width>myimage.Width) or (mybmp.Height>myimage.Height) then
      set_stretch(true)
    else set_stretch(false);
    mybmp.free;
  end;
  ttype:='3';
end;

procedure TFrm_PCBCUT.O1Click(Sender: TObject);
var myjpg:Tjpegimage;
    outfile,outext:string;
begin
  if not savedlg.Execute then exit;
  outfile:=savedlg.FileName;
  outext:=uppercase(extractfileext(outfile));
  if (outext='.JPG') or (outext='.JPEG') then  //导出jpeg格式文件
  begin
    myjpg:=Tjpegimage.create;
    myjpg.Assign(myimage.Picture.Bitmap);
    myjpg.SaveToFile(outfile);
    myjpg.Free ;
  end;
  if outext='.BMP' then  //导出bmp格式文件
    myimage.Picture.SaveToFile(outfile);
end;

procedure TFrm_PCBCUT.C1Click(Sender: TObject);
begin
if Msg_Dlg_Ask('您确定要清空图片信息吗?','友好提示',1) then
begin
  image1.Canvas.Rectangle(0,0,image1.Width,image1.Height);
  image2.Canvas.Rectangle(0,0,image2.Width,image2.Height);
  image3.Canvas.Rectangle(0,0,image3.Width,image3.Height);
end;
end;

procedure TFrm_PCBCUT.stringgrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var column,row:longint;
begin
  stringgrid1.MouseToCell(x,y,column,row);
  if (Row > 0) and (column = 2) then //标题点击不执行
    if trim(stringgrid1.Cells[2,stringgrid1.row])='Y' then
       stringgrid1.Cells[2,stringgrid1.row]:='N'
    else stringgrid1.Cells[2,stringgrid1.row]:='Y';
end;

procedure TFrm_PCBCUT.stringgrid1DrawCell(Sender:TObject; ACol,ARow:Integer;Rect:TRect; State:TGridDrawState);
begin
  if (acol=2) then
    stringgrid1.Canvas.TextRect(rect,rect.Left+12,rect.Top+2,stringgrid1.Cells[acol,aRow]);
  if (acol=2) and (arow>0) then
    if trim(stringgrid1.Cells[2,arow])= 'Y' then
       stringgrid1.Canvas.Draw(rect.Left+12,rect.Top,image4.Picture.Graphic)
    else stringgrid1.Canvas.Draw(rect.Left+12,rect.Top,image5.Picture.Graphic);
end;

procedure TFrm_PCBCUT.CheckBox2Click(Sender: TObject);
var i:integer;
begin
  if checkbox2.Checked then
    for i:=1 to stringgrid1.RowCount-1 do
      stringgrid1.Cells[2,i]:='Y'
  else
    for i:=1 to stringgrid1.RowCount-1 do
      stringgrid1.Cells[2,i]:='N';
  stringgrid1.Refresh ;
end;

procedure TFrm_PCBCUT.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8]) then
    abort
  else if (key = chr(46)) then
    if pos('.',(sender as Tedit).Text)>0 then
      abort;
end;

procedure TFrm_PCBCUT.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8]) then
    abort;
end;

procedure TFrm_PCBCUT.Edit30Change(Sender: TObject);
begin
  if trim(edit30.Text)<>'' then
     dm.AQ17.Filter:=precolumn.FieldName+' like ''%'+trim(edit30.Text)+'%'''
  else dm.AQ17.Filter:='';
end;

procedure TFrm_PCBCUT.Eh1TitleClick(Column: TColumnEh);
begin //先把非字符型的column的readonly属性设为false,非字符型不能用edit搜索
  if (precolumn.FieldName<>column.FieldName) and (column.ReadOnly) then
  begin
    label30.Caption:=column.Title.Caption+'：';
    precolumn.Title.Color:=clbtnface;
    column.Title.Color:=clred;
    precolumn:=column;
    edit30.Text:='';
  end;
  edit30.SetFocus;
end;

procedure TFrm_PCBCUT.P1Click(Sender: TObject);
begin
  ppimage1.Picture:=image1.Picture;  //开料图
  ppimage2.Picture:=image2.Picture;  //A拼版图
  ppimage3.Picture:=image3.Picture;  //B拼版图
  pplabel7.Caption:=label34.Caption; //客户
  pplabel8.Caption:=label36.Caption; //厂编
  //pplabel9.Caption:=;  //客户型号
  pplabel24.Caption:=sgrid1.Cells[2,sgrid1.Row]+' * '+sgrid1.Cells[3,sgrid1.Row]+'mm'; //大料尺寸
  pplabel25.Caption:=edit6.Text+' * '+edit7.Text+' mm'; //套板尺寸
  pplabel26.Caption:=sgrid1.Cells[4,sgrid1.Row]+' pnl';        //拼版数/sheet
  pplabel27.Caption:=sgrid1.Cells[5,sgrid1.Row]+' set';        //套板数/sheet
  pplabel28.Caption:=edit8.Text+' pcs';                 //pcs数/套
  pplabel29.Caption:=sgrid1.Cells[6,sgrid1.Row]+' pcs'; //pcs数/sheet
  pplabel30.Caption:=sgrid1.Cells[1,sgrid1.Row]+' %';        //利用率
  pplabel31.Caption:=edit13.Text+' mm';  //拼版间距dx,可调换板边或间距时从结果里取数据
  pplabel32.Caption:=edit14.Text+' mm';   //拼版间距dy,
  pplabel33.Caption:=edit15.Text+' mm';   //工艺边宽度dx,
  pplabel34.Caption:=edit16.Text+' mm';  //工艺边宽度dy,
  pplabel43.Caption:=Edit42.Text+' * '+Edit43.Text+' mm'; //pnla尺寸
  pplabel44.Caption:=edit3.Text+' pnl';  //拼版数/sheet
  pplabel45.Caption:=edit2.Text+' set';  //套板数/pnl
  pplabel46.Caption:=Edit44.Text+' * '+Edit45.Text+' mm'; //pnlB尺寸
  pplabel47.Caption:=edit5.Text+' pnl';  //拼版数/sheet
  pplabel48.Caption:=edit4.Text+' set';  //套板数/pnl
  ppreport1.Print;
end;

procedure TFrm_PCBCUT.ToolButton2Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_PCBCUT.init;
var
  Jpg:TjpegImage;
  bmp:tbitmap;
  Stream:TMemoryStream;
begin
   //检查状态
 // Edit6.SetFocus;
 // Edit6.SelectAll ;
  Adoquery7.Open;//材料库存
  if not dm.ads502.IsEmpty then
  With dm.ads502 do
  begin
    Jpg:=TjpegImage.Create;
    Stream:=TMemoryStream.Create ;
    bmp:=TBitMap.Create;
    if not dm.ads502sheet_BMP.IsNull then
    begin
      dm.ads502sheet_BMP.SaveToStream(Stream);
      Stream.Position:=0;
      jpg.LoadFromStream(Stream);
      jpg.DIBNeeded;
      bmp.Assign(jpg);
      image1.Picture.Bitmap.Assign(bmp);
      stream.Clear;
    end;
    if not dm.ads502pnl_bmp.IsNull then
    begin
      dm.ads502pnl_bmp.SaveToStream(Stream);
      Stream.Position:=0;
      jpg.LoadFromStream(Stream);
      jpg.DIBNeeded;
      bmp.Assign(jpg);
      image2.Picture.Bitmap.Assign(bmp);
      stream.Clear;
    end;
    Edit6.text :=Fieldbyname('unit_len').asString;
    Edit7.text :=Fieldbyname('unit_wth').asString;
    Edit8.text :=Fieldbyname('unit_num').asString;

    Edit13.Text :=Fieldbyname('minspace1').asString;
    Edit14.Text :=Fieldbyname('minspace2').asString;
    Edit15.Text :=dm.ads502pnl_lenspace.AsString;
    Edit16.Text :=dm.ads502pnl_wthspace.AsString;
    Edit1.Text :=dm.ads502pnl_lenspace.AsString;
    Edit38.Text :=dm.ads502pnl_wthspace.AsString;

    sgrid1.RowCount:=2;
    sgrid1.Cells[0,1]:='1';                                 //'序号';
    sgrid1.Cells[1,1]:=Fieldbyname('Tusage').AsString;      //'利用率%';
    sgrid1.Cells[2,1]:=Fieldbyname('sht_len').AsString;     //'大料长';
    sgrid1.Cells[3,1]:=Fieldbyname('sht_wth').AsString;     //'大料宽';
    sgrid1.Cells[4,1]:=inttostr(Fieldbyname('total_pnls_1').AsInteger+Fieldbyname('total_pnls_2').AsInteger);      //'总PNL数';
    sgrid1.Cells[5,1]:=inttostr(Fieldbyname('total_pnls_1').AsInteger*Fieldbyname('upanel').AsInteger+Fieldbyname('total_pnls_2').AsInteger*Fieldbyname('upanel_2').AsInteger);       //'总Set数';
    sgrid1.Cells[6,1]:=inttostr((Fieldbyname('total_pnls_1').AsInteger*Fieldbyname('upanel').AsInteger+Fieldbyname('total_pnls_2').AsInteger*Fieldbyname('upanel_2').AsInteger)*Fieldbyname('unit_num').AsInteger);     //'总Pcs数';
    Edit2.text :=Fieldbyname('upanel').asString;
    Edit3.text :=Fieldbyname('total_pnls_1').asString;
    Edit42.text :=Fieldbyname('pnl_len').asString;
    Edit43.text :=Fieldbyname('pnl_wth').asString;
    
    if not dm.ads502pnl2_bmp.IsNull then      //双拼板
    begin
      dm.ads502pnl2_bmp.SaveToStream(Stream);
      Stream.Position:=0;
      jpg.LoadFromStream(Stream);
      jpg.DIBNeeded;
      bmp.Assign(jpg);
      image3.Picture.Bitmap.Assign(bmp);
    end;
    if Fieldbyname('pnl_len_2').AsFloat>0 then
    begin
      spinedit1.Value:=2;
      Edit44.Enabled:=true;
      Edit45.Enabled:=true;
      Edit4.Text:=Fieldbyname('upanel_2').AsString;         //B板每PAN的unit数
      Edit5.Text:=Fieldbyname('total_pnls_2').AsString;     //大料总B板数
      Edit44.text :=Fieldbyname('pnl_len_2').asString;
      Edit45.text :=Fieldbyname('pnl_wth_2').asString;
    end ;
  end;
  
  Adoquery9.Open ;
  with adoquery9 do
   begin
    Edit9.Text :=Fieldbyname('cut_l1_max').AsString;
    Edit10.Text :=Fieldbyname('cut_l1_min').AsString;
    Edit11.Text :=Fieldbyname('cut_w1_max').AsString;
    Edit12.Text :=Fieldbyname('cut_w1_min').AsString;
    Edit34.Text :=Fieldbyname('cut_l2_max').AsString;
    Edit35.Text :=Fieldbyname('cut_l2_min').AsString;
    Edit36.Text :=Fieldbyname('cut_w2_max').AsString;
    Edit37.Text :=Fieldbyname('cut_w2_min').AsString;
    if dm.ads502.IsEmpty then
     begin
      Edit13.Text :=Fieldbyname('space_l_min').asString;
      Edit14.Text :=Fieldbyname('space_w_min').asString;
      edit39.Text :=self.ADOQuery9ISSUSE_AREA_DAY.AsString;
      Edit15.Text :=Fieldbyname('border_l_min').AsString;
      edit40.Text :=self.ADOQuery9ppc_control_27.AsString;
      Edit16.Text :=Fieldbyname('border_w_min').AsString;
     end;
   end;
end;

procedure TFrm_PCBCUT.sav;
var jpegimage:Tjpegimage;
    stream:TMemoryStream;
begin
  if ttype='A' then
  begin
    showmessage('异常数据无法保存...');
    exit;
  end;
 if not svValid then exit;

  if dm.ads502.RecordCount>0 then
   dm.ads502.Edit
  else
   dm.ads502.Append;
  dm.ads502source_ptr.Value:=dm.AQY0025RKEY.Value;

  jpegimage:=tjpegimage.Create;
  Stream:=TMemoryStream.Create;
  jpegimage.Assign(image1.Picture.Bitmap);
  jpegimage.JPEGNeeded;
  jpegimage.SaveToStream(stream);
  Stream.Position :=0;
  dm.ads502sheet_BMP.LoadFromStream(stream);
  stream.Clear;

  jpegimage.Assign(image2.Picture.Bitmap);
  jpegimage.JPEGNeeded;
  jpegimage.SaveToStream(stream);
  Stream.Position :=0;
  dm.ads502pnl_bmp.LoadFromStream(stream);
  stream.Clear;

  if SpinEdit1.Value=2 then    //双拼版
   begin
     jpegimage.Assign(image3.Picture.Bitmap);
     jpegimage.JPEGNeeded;
     jpegimage.SaveToStream(stream);
     Stream.Position :=0;
     dm.ads502pnl2_bmp.LoadFromStream(stream); // 读取保存的内存图
     stream.Clear;
   end
  else
   dm.ads502pnl2_bmp.Clear;

  dm.ads502.Fieldbyname('unit_unit').asinteger:=0;                 //单位为mm

  dm.ads502.Fieldbyname('minspace1').asString:=Edit13.Text ;
  dm.ads502.Fieldbyname('minspace2').asString:=Edit14.Text ;

  dm.ads502pnl_lenspace.AsString := Edit1.Text;
  dm.ads502pnl_wthspace.AsString := Edit38.Text;

  dm.ads502.Fieldbyname('upanel').AsString := Edit2.Text;       //A板每PAN的set数
  dm.ads502.Fieldbyname('total_pnls_1').AsString:=Edit3.Text;   //大料总A板数

  dm.ads502.Fieldbyname('unit_len').AsString:=Edit6.Text;   //拼版长
  dm.ads502.Fieldbyname('unit_wth').AsString:=Edit7.Text;; //拼版宽
  dm.ads502.Fieldbyname('unit_num').AsString:=Edit8.text ;  //拼版单元数

  if ttype='0' then                 //手动拼版
    dm.ads502.Fieldbyname('unit_num').AsString:=Edit19.text        //拼版单元个数
  else
    dm.ads502.Fieldbyname('unit_num').AsString:=Edit8.text ;

  with dm.ads502 do
  begin
    if ttype='3'  then  //导入图片
    begin
      Fieldbyname('upanel_2').AsInteger:=strtoint('0'+Edit4.Text);             //  B板每PAN的unit数
      Fieldbyname('total_pnls_2').AsInteger:=strtoint('0'+Edit5.Text);          //大料总B 板数
      Fieldbyname('pnl_len').AsString := Edit42.Text ;  //A板长
      Fieldbyname('pnl_wth').AsString := Edit43.Text ;  //A板宽
      Fieldbyname('pnl_len_2').AsFloat:=strtofloat('0'+Edit44.Text);
      Fieldbyname('pnl_wth_2').AsFloat:=strtofloat('0'+Edit45.Text);
      Fieldbyname('Tusage').AsString:=Edit33.Text;
      Fieldbyname('sht_len').AsString:=Edit31.Text;
      Fieldbyname('sht_wth').AsString:=Edit32.Text;
    end
    else
     if ttype='2' then    //自动双拼
      begin
      if  Result_MakeUp2[iSel].Sheet_Long>Result_MakeUp2[iSel].Sheet_Width then
       begin
        Fieldbyname('sht_len').AsFloat:=Result_MakeUp2[iSel].Sheet_Long;    //大料长
        Fieldbyname('sht_wth').AsFloat:=Result_MakeUp2[iSel].Sheet_Width;    //大料宽
       end
       else
        begin
         Fieldbyname('sht_len').AsFloat:=Result_MakeUp2[iSel].Sheet_Width;    //大料长
         Fieldbyname('sht_wth').AsFloat:=Result_MakeUp2[iSel].Sheet_Long;    //大料宽
        end;
       Fieldbyname('Tusage').AsFloat:=Result_MakeUp2[iSel].Using_Rate*100;     //大料利用率

      if Result_MakeUp2[iSel].PNLA_Long*Result_MakeUp2[iSel].PNLA_Width>=Result_MakeUp2[iSel].PNLB_Long*Result_MakeUp2[iSel].PNLB_Width then
       begin
        if  Result_MakeUp2[iSel].PNLA_Long>=Result_MakeUp2[iSel].PNLA_Width then
         begin
          Fieldbyname('pnl_len').AsFloat := Result_MakeUp2[iSel].PNLA_Long ;  //A板长
          Fieldbyname('pnl_wth').AsFloat := Result_MakeUp2[iSel].PNLA_Width ;  //A板宽
         end
        else
         begin
          Fieldbyname('pnl_len').AsFloat := Result_MakeUp2[iSel].PNLA_Width ;  //A板长
          Fieldbyname('pnl_wth').AsFloat := Result_MakeUp2[iSel].PNLA_Long ;  //A板宽
         end;
        if Result_MakeUp2[iSel].PNLB_Long>=Result_MakeUp2[iSel].PNLB_Width then
         begin
          Fieldbyname('pnl_len_2').AsFloat :=Result_MakeUp2[iSel].PNLB_Long ;  //B板长
          Fieldbyname('pnl_wth_2').AsFloat :=Result_MakeUp2[iSel].PNLB_Width ;  //B板宽
         end
        else
         begin
          Fieldbyname('pnl_len_2').AsFloat :=Result_MakeUp2[iSel].PNLB_Width ;  //B板长
          Fieldbyname('pnl_wth_2').AsFloat :=Result_MakeUp2[iSel].PNLB_Long ;  //B板宽
         end;
        Fieldbyname('upanel_2').AsString:=Edit4.Text;                        //B 板每PAN 的set数
        Fieldbyname('total_pnls_2').AsString:=Edit5.Text;                   //大料总B 板数
       end
      else
       begin     //调换A/B板
        jpegimage.Assign(image2.Picture.Bitmap);
        jpegimage.JPEGNeeded;
        jpegimage.SaveToStream(stream);
        Stream.Position :=0;
        dm.ads502pnl2_bmp.LoadFromStream(stream);
        stream.Clear;

        jpegimage.Assign(image3.Picture.Bitmap);
        jpegimage.JPEGNeeded;
        jpegimage.SaveToStream(stream);
        Stream.Position :=0;
        dm.ads502pnl_bmp.LoadFromStream(stream);
        stream.Clear;
        if  Result_MakeUp2[iSel].PNLA_Long>=Result_MakeUp2[iSel].PNLA_Width then
         begin
          Fieldbyname('pnl_len_2').AsFloat := Result_MakeUp2[iSel].PNLA_Long ;  //A板长
          Fieldbyname('pnl_wth_2').AsFloat := Result_MakeUp2[iSel].PNLA_Width ;  //A板宽
         end
        else
          begin
           Fieldbyname('pnl_len_2').AsFloat := Result_MakeUp2[iSel].PNLA_Width ;  //A板长
           Fieldbyname('pnl_wth_2').AsFloat := Result_MakeUp2[iSel].PNLA_Long ;  //A板宽
          end;
        if Result_MakeUp2[iSel].PNLB_Long>=Result_MakeUp2[iSel].PNLB_Width then
         begin
          Fieldbyname('pnl_len').AsFloat :=Result_MakeUp2[iSel].PNLB_Long ;  //B板长
          Fieldbyname('pnl_wth').AsFloat :=Result_MakeUp2[iSel].PNLB_Width ;  //B板宽
         end
        else
         begin
           Fieldbyname('pnl_len').AsFloat :=Result_MakeUp2[iSel].PNLB_Width ;  //B板长
           Fieldbyname('pnl_wth').AsFloat :=Result_MakeUp2[iSel].PNLB_Long ;  //B板宽
         end;
        dm.ads502.Fieldbyname('upanel').AsString := Edit4.Text;       //A板每PAN的unit数
        dm.ads502.Fieldbyname('total_pnls_1').AsString:=Edit5.Text;   //大料总A板数
        Fieldbyname('upanel_2').AsString:=Edit2.Text;                 //B板每PAN的unit数
        Fieldbyname('total_pnls_2').AsString:=Edit3.Text;
      end;
    end
    else
     if (ttype='0') or (ttype='1') then
      begin   //ttype=0,1  单拼板或手动拼版
      Fieldbyname('unit_len').AsFloat:=Result_MakeUp[iSel].PNLA_Unit_Long;   //拼版长
      Fieldbyname('unit_wth').AsFloat:=Result_MakeUp[iSel].PNLA_Unit_Width; //拼版宽

      if  Result_MakeUp[iSel].Sheet_Long>Result_MakeUp[iSel].Sheet_Width then
       begin
        Fieldbyname('sht_len').AsFloat:=Result_MakeUp[iSel].Sheet_Long;    //大料长
        Fieldbyname('sht_wth').AsFloat:=Result_MakeUp[iSel].Sheet_Width;    //大料宽
       end
      else
        begin
         Fieldbyname('sht_len').AsFloat:=Result_MakeUp[iSel].Sheet_Width;    //大料长
         Fieldbyname('sht_wth').AsFloat:=Result_MakeUp[iSel].Sheet_Long;    //大料宽
        end;
      Fieldbyname('Tusage').AsFloat:=Result_MakeUp[iSel].Using_Rate*100;       //大料利用率

      if Result_MakeUp[iSel].PNLA_Long>=Result_MakeUp[iSel].PNLA_Width  then
      begin
        Fieldbyname('pnl_len').AsFloat := Result_MakeUp[iSel].PNLA_Long ;   //A板长
        Fieldbyname('pnl_wth').AsFloat := Result_MakeUp[iSel].PNLA_Width ;  //A板宽
      end else begin
        Fieldbyname('pnl_len').AsFloat := Result_MakeUp[iSel].PNLA_Width ;   //A板长
        Fieldbyname('pnl_wth').AsFloat := Result_MakeUp[iSel].PNLA_Long ;  //A板宽
      end;

      if  ttype='0' then   //手动
       begin
        dm.ads502.Fieldbyname('minspace1').asString:=Edit24.Text ;
        dm.ads502.Fieldbyname('minspace2').asString:=Edit25.Text ;
        dm.ads502pnl_lenspace.AsString := Edit26.Text;
        dm.ads502pnl_wthspace.AsString := Edit27.Text;
       end;
      dm.ads502pnl2_bmp.AsVariant:=null;
      dm.ads502PNL_LEN_2.Value:=0;
      dm.ads502PNL_WTH_2.Value:=0;
      dm.ads502UPANEL_2.Value:=0;
      dm.ads502TOTAL_PNLS_2.Value:=0;
     end;     //单拼或者手动拼结束

  end;

  dm.ads502.Post;
  stream.Free;
  jpegimage.Free;
  modalresult:=mrOk;
end;

procedure TFrm_PCBCUT.AutoSpell;
begin
  try
  if (stringgrid1.RowCount<=1) then
  begin
    messagedlg('请首先定义大料的拼版尺寸！',mterror,[mbcancel],0);
    exit;
  end;
  if (trim(edit6.Text)='0') or (trim(edit6.Text)='') then
  begin
    messagedlg('请输入UNI长度！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    edit6.SetFocus ;
    exit;
  end;
  if (trim(edit7.Text)='0') or (trim(edit7.Text)='') then
  begin
    messagedlg('请输入UNI宽度！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    edit7.SetFocus ;
    exit;
  end;
  if trim(Edit13.Text)='' then
  begin
    messagedlg('请输入长边间距！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    Edit13.SetFocus ;
    exit;
  end;
  if trim(Edit14.Text)='' then
  begin
    messagedlg('请输入短边间距！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    Edit14.SetFocus ;
    exit;
  end;
  if (trim(Edit15.Text)='') or (trim(Edit39.Text)='') then
  begin
    messagedlg('请输入边长上限！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    Edit15.SetFocus ;
    exit;
  end;
  if strtofloat(trim(Edit15.Text))<strtofloat(trim(Edit39.Text)) then
  begin
    messagedlg('板边Dx上限不能小于下限！',mtinformation,[mbok],0);
    Edit39.SetFocus ;
    exit;
  end;

  if (trim(Edit16.Text)='') or (trim(Edit40.Text)='') then
  begin
    messagedlg('请输入边长下限！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    Edit16.SetFocus ;
    exit;
  end;
  if strtofloat(trim(Edit16.Text))<strtofloat(trim(Edit40.Text)) then
  begin
    messagedlg('板边Dy上限不能小于下限！',mtinformation,[mbok],0);
    Edit40.SetFocus ;
    exit;
  end;

  if trim(Edit11.Text)='' then
  begin
    messagedlg('请输入边宽上限！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    Edit11.SetFocus ;
    exit;
  end;
  if trim(Edit12.Text)='' then
  begin
    messagedlg('请输入边宽下限！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    Edit12.SetFocus ;
    exit;
  end;
  if trim(Edit9.Text)='' then
  begin
    messagedlg('请输入长边边边框宽度！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    Edit9.SetFocus ;
    exit;
  end;
  if trim(Edit10.Text)='' then
  begin
    messagedlg('请输入短边边框宽度！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    Edit10.SetFocus ;
    exit;
  end;
  if strtofloat(trim(Edit9.Text))<strtofloat(trim(Edit10.Text)) then
  begin
    messagedlg('边长上限不能小于边长下限！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    Edit9.SetFocus ;
    exit;
  end;
  if strtofloat(trim(Edit11.Text))<strtofloat(trim(Edit12.Text)) then
  begin
    messagedlg('边宽上限不能小于边宽下限！',mtinformation,[mbok],0);
    Pagecontrol2.ActivePageIndex :=0;
    Edit11.SetFocus ;
    exit;
  end;

 except
  messagedlg('输入了无效的数量格式！',mtinformation,[mbok],0);
  exit;
 end;
  Image1.Picture :=Image14.Picture ;
  Image2.Picture :=Image14.Picture ;
  Image3.Picture :=Image14.Picture ;
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);//清除内容
  Image2.Canvas.Rectangle(0,0,Image2.Width,Image2.Height);//清除内容
  Image3.Canvas.Rectangle(0,0,Image3.Width,Image3.Height);//清除内容
  ttype:=SpinEdit1.Text;
  try
    Screen.Cursor:=crHourGlass;
    SpellPNL(SpinEdit1.Value);
  finally
    Screen.Cursor:=crDefault;
  end;
  rkey:='1';
  BtnMicroAdapt.Enabled:=true;
  Panel7.Visible:=false;
end;

procedure TFrm_PCBCUT.SpellPNL(pnls: integer);
var
  Param_PCB:TParam_PCB;
  ASheet:array[0..29] of TParam_Sheet;
  tem_Function1:boolean;
  i,row:integer;
  p1,p2:PLongint;
  Param_PCB2:TParam_PCB2;//定义记录
  iKind:integer;
begin
  ttype :='A';
  i:=0;
  for row:=1 to stringgrid1.RowCount-1 do
  if trim(stringgrid1.Cells[2,row])='Y' then
  begin
    if i=15 then
    begin
      showmessage('一次最多只能选15种不同规格的材料材料...');
      abort;
    end;
    ASheet[i].Sheet_Long:= strtofloat(stringgrid1.Cells[0,row]);  //Sheet_L;//大料长
    ASheet[i].Sheet_Width:=strtofloat(stringgrid1.Cells[1,row]);   //Sheet_W;//大料宽
    inc(i);
  end;
 // if CheckBox3.Checked then iKind:=3 else iKind:=1;
 iKind:=SpinEdit2.Value;

  setLength(Result_MakeUp,0);
  setLength(Param_Sheet,i);
  for row:=0 to i-1 do
  begin
    Param_Sheet[row].Sheet_Long:=ASheet[row].Sheet_Long;
    Param_Sheet[row].Sheet_Width:=ASheet[row].Sheet_Width;
  end;
  p1:=@Param_Sheet;
  if pnls=1 then     //单拼版
  begin
    Param_PCB.Unit_Long:=strtocurr(edit6.text); //SET长
    Param_PCB.Unit_Width:=strtocurr(edit7.text); //SET宽
    Param_PCB.Unit_Long_Space:=strtocurr(edit13.text);//Set长间距
    Param_PCB.Unit_Width_Space:=strtocurr(edit14.text);//set宽间距

    Param_PCB.Unit_Long_ToPNL:=strtocurr(edit15.text);//PNL长边Max边距
    Param_PCB.Unit_Width_ToPNL:=strtocurr(edit16.text);//PNL宽边Max边距
    Param_PCB.Unit_Long_ToPNL_min:=strtocurr(edit39.text);//PNL长边Min边距
    Param_PCB.Unit_Width_ToPNL_min:=strtocurr(edit40.text);//PNL宽边Min边距


    Param_PCB.PNLA_Long_Max:=strtocurr(edit9.text);//PNLA长上限
    Param_PCB.PNLA_Width_Max:=strtocurr(edit11.text);//PNLA宽上限
    Param_PCB.PNLA_Long_Min:=strtocurr(edit10.text); //PNLA长下限
    Param_PCB.PNLA_Width_Min:=strtocurr(edit12.text);//PNLA宽下限
    setLength(Result_MakeUp,i*iKind);
    p2:=@Result_MakeUp;
    CutSheet:=TCutSheet.Create(PAParam_Sheet(p1),PAResult_MakeUp(p2),iKind);
    CutSheet.Input_PCB_SIZE:=Param_PCB;                      //输入要求计算的单元尺寸等信息
    CutSheet.Calculate_Array_Complete_Percent:=ProgressBar1; //用于显示进度
  //  CutSheet.Calculate_Array_Complete_Time_Display:=true;    //显示计算时间
   // CutSheet.Echange_Unit_To_Unit_Space:=true;             //交换单元间距
    CutSheet.Echange_Unit_To_PNL_Space:=CheckBox1.Checked;   //允许板边的方向对调
    CutSheet.Calculate_Rate_Type:=1;                         //1用单元计算利用率2用PNL计算利用率,暂时不起作用

    CutSheet.Calculate_Falchion_Number_Equality_Hold:=false;
    CutSheet.Change_PNL_Long_Width:= CheckBox4.Checked;      //允许板长宽对调
    CutSheet.No_Calculate_Falchion_Number:=true;             //false长边上限对单元,宽边对宽边上限;TRUE没有对应关系
    CutSheet.Calculate_Array;
    ttype :='1';                                             //手动拼版
    sgrid1.RowCount:=2;
    for i:=low(Result_MakeUp) to high(Result_MakeUp) do
    begin
       if (Result_MakeUp[i].PNLA_Unit_Long_Number=0) or  (Result_MakeUp[i].PNLA_Unit_width_Number=0) then  break;
       if i>0 then sgrid1.RowCount:=sgrid1.RowCount+1;
       sgrid1.Cells[0,i+1]:=inttostr(i+1);                                //'序号';
       sgrid1.Cells[1,i+1]:=currtostr(100*Result_MakeUp[i].Using_Rate);   //'利用率%';
       if  Result_MakeUp[i].Sheet_Long>Result_MakeUp[i].Sheet_Width then
       begin
         sgrid1.Cells[2,i+1]:=currtostr(Result_MakeUp[i].Sheet_Long);       //'大料长';
         sgrid1.Cells[3,i+1]:=currtostr(Result_MakeUp[i].Sheet_Width);      //'大料宽';
       end else begin
         sgrid1.Cells[2,i+1]:=currtostr(Result_MakeUp[i].Sheet_Width);
         sgrid1.Cells[3,i+1]:=currtostr(Result_MakeUp[i].Sheet_Long);
       end;
       sgrid1.Cells[4,i+1]:=currtostr((Result_MakeUp[i].One_Section_Unit_Number+   //'总PNL数';
                                       Result_MakeUp[i].Two_Section_Unit_Number+
                                     Result_MakeUp[i].three_Section_Unit_Number)/
                         Result_MakeUp[i].PNLA_Unit_Long_Number / Result_MakeUp[i].PNLA_Unit_width_Number) ;


       sgrid1.Cells[5,i+1]:=currtostr(strtoint(sgrid1.Cells[4,i+1])*   //'总Set数';
                         Result_MakeUp[i].PNLA_Unit_Long_Number*Result_MakeUp[i].PNLA_Unit_width_Number);
       sgrid1.Cells[6,i+1]:=inttostr(strtoint(sgrid1.Cells[5,i+1])*strtoint(Edit8.Text));   //'总Pcs数';
    end;
    iSel:=0;
    DrawPNL(0);
    CutSheet.Free;
    Edit2.ReadOnly:=true;
    Edit3.ReadOnly:=true;
    Edit4.ReadOnly:=true;
    Edit5.ReadOnly:=true;

    Edit42.ReadOnly:=false;
    Edit43.ReadOnly:=false;
    Edit44.ReadOnly:=true;
    Edit45.ReadOnly:=true;
    BtnMicroAdapt.Enabled:=true;

    sgrid1SelectCell(nil,1,1,tem_Function1);
  end else begin                 //双拼版
    setLength(Result_MakeUp2,0);
    Param_PCB2.Unit_Long:=strtocurr(edit6.text); //SET长
    Param_PCB2.Unit_Width:=strtocurr(edit7.text); //SET宽
    Param_PCB2.Unit_Long_Space:=strtocurr(edit13.text);//SET长间距
    Param_PCB2.Unit_Width_Space:=strtocurr(edit14.text);//SET宽间距
    Param_PCB2.Unit_Long_ToPNL:=strtocurr(edit15.text);//PNL长边边距
    Param_PCB2.Unit_Width_ToPNL:=strtocurr(edit16.text);//PNL宽边边距
    Param_PCB2.Unit_Long_ToPNL_min:=strtocurr(edit39.text);//PNL长边Min边距
    Param_PCB2.Unit_Width_ToPNL_min:=strtocurr(edit40.text);//PNL宽边Min边距

    Param_PCB2.PNLA_Long_Max:=strtocurr(edit9.text);//PNLA长上限
    Param_PCB2.PNLA_Width_Max:=strtocurr(edit11.text);//PNLA宽上限
    Param_PCB2.PNLA_Long_Min:=strtocurr(edit10.text); //PNLA长下限
    Param_PCB2.PNLA_Width_Min:=strtocurr(edit12.text);//PNLA宽下限

    Param_PCB2.PNLB_Long_Max:=strtocurr(edit34.text);//PNLB长上限
    Param_PCB2.PNLB_Width_Max:=strtocurr(edit36.text);//PNLB宽上限
    Param_PCB2.PNLB_Long_Min:=strtocurr(edit35.text); //PNLB长下限
    Param_PCB2.PNLB_Width_Min:=strtocurr(edit37.text); //PNLB宽下限

    setLength(Result_MakeUp2,i*iKind);
    p2:=@Result_MakeUp2;
    CutSheet2:=TCutSheet2.Create(PAParam_Sheet2(p1),PAResult_MakeUp2(p2),iKind);
    CutSheet2.Input_PCB_SIZE:=Param_PCB2;                   //输入要求计算的单元尺寸等信息
    CutSheet2.Calculate_Array_Complete_Percent:=ProgressBar1; //用于显示进度
    CutSheet2.Echange_Unit_To_Unit_Space:=false;           //交换单元间距
    CutSheet2.Echange_Unit_To_PNL_Space:=checkbox1.Checked;//交换边距
    CutSheet2.Change_PNL_Long_Width:=checkbox4.Checked;
    CutSheet2.Calculate_Rate_Type:=1;                     //0用单元计算利用率2用PNL计算利用率,暂时不起作用
    CutSheet2.No_Calculate_Falchion_Number:=true;         //false长边上限对单元,宽边对宽边上限;TRUE没有对应关系
    CutSheet2.Calculate_Array;

    ttype :='2';
    sgrid1.RowCount:=2;
    for i:=low(Result_MakeUp2) to high(Result_MakeUp2) do
    begin
       if i>0 then sgrid1.RowCount:=sgrid1.RowCount+1;
       sgrid1.Cells[0,i+1]:=inttostr(i+1);                                //'序号';
       sgrid1.Cells[1,i+1]:=currtostr(100*Result_MakeUp2[i].Using_Rate);   //'利用率%';

       if  Result_MakeUp2[i].Sheet_Long>Result_MakeUp2[i].Sheet_Width then
       begin
         sgrid1.Cells[2,i+1]:=currtostr(Result_MakeUp2[i].Sheet_Long);       //'大料长';
         sgrid1.Cells[3,i+1]:=currtostr(Result_MakeUp2[i].Sheet_Width);      //'大料宽';
       end else begin
         sgrid1.Cells[2,i+1]:=currtostr(Result_MakeUp2[i].Sheet_Width);
         sgrid1.Cells[3,i+1]:=currtostr(Result_MakeUp2[i].Sheet_Long);
       end;

       sgrid1.Cells[4,i+1]:=currtostr(Result_MakeUp2[i].PNLA_number_Per_Sheet+Result_MakeUp2[i].PNLB_number_Per_Sheet);

       sgrid1.Cells[5,i+1]:=currtostr(Result_MakeUp2[i].PNLA_number_Per_Sheet*Result_MakeUp2[i].PNLA_Unit_Long_Number*
                                      Result_MakeUp2[i].PNLA_Unit_width_Number+
                                      Result_MakeUp2[i].PNLB_Unit_Long_Number*Result_MakeUp2[i].PNLB_Unit_width_Number*
                                      Result_MakeUp2[i].PNLB_number_Per_Sheet);   //'总Set数';
       sgrid1.Cells[6,i+1]:=inttostr(strtoint(sgrid1.Cells[5,i+1])*strtoint(Edit8.Text));   //'总Pcs数';
    end;
    iSel:=0;
    DrawPNL2(0);
    CutSheet2.Free;

  Edit2.ReadOnly:=true;
  Edit3.ReadOnly:=true;
  Edit4.ReadOnly:=true;
  Edit5.ReadOnly:=true;

  Edit42.ReadOnly:=false;
  Edit43.ReadOnly:=false;
  Edit44.ReadOnly:=false;
  Edit45.ReadOnly:=false;
  BtnMicroAdapt.Enabled:=true;
  sgrid1SelectCell(nil,1,1,tem_Function1);
  end;
end;

procedure TFrm_PCBCUT.DrawPNL2(i: integer);
var
  var_Sheet_Size_TwoPNL:Sheet_Size_TwoPNL_1;
  pnl_size_s1:pnl_size;
begin
  pnl_size_s1.Long1:=Result_MakeUp2[i].PNLA_Long;//取结果,PNLA长
  pnl_size_s1.Width1:=Result_MakeUp2[i].PNLA_Width;//取结果,PNLA宽
  pnl_size_s1.Unit_Long:=Result_MakeUp2[i].PNLA_Unit_Long;//取结果,PNLA单元长
  pnl_size_s1.Unit_Width:=Result_MakeUp2[i].PNLA_Unit_Width;//取结果,PNLA单元宽
  pnl_size_s1.Unit_Long_ToUnit_Space:=Result_MakeUp2[i].PNLA_Unit_Long_Space;//取结果,PNLA单元长间距
  pnl_size_s1.Unit_Width_ToUnit_Space:=Result_MakeUp2[i].PNLA_Unit_Width_Space;//取结果,PNLA单元宽间距
  pnl_size_s1.Unit_Long_PNL_Space:=Result_MakeUp2[i].PNLA_Unit_Long_ToPNL;//取结果,PNLA单元长到边距离
  pnl_size_s1.Unit_Width_PNL_Space:=Result_MakeUp2[i].PNLA_Unit_Width_ToPNL;//取结果,PNLA单元宽到边距离
  pnl_size_s1.Unit_Long_Number:=Result_MakeUp2[i].PNLA_Unit_Long_Number;//取结果,PNLA单元长个数
  pnl_size_s1.Unit_Width_number:=Result_MakeUp2[i].PNLA_Unit_Width_Number;//取结果,PNLA单元宽个数
  Draw_Picture1:=TDraw_Picture.Create ;
  Draw_Picture1.Input_pnl_size:=pnl_size_s1; //输入PNLA尺寸,用于画PNLA排版图

  Image2.Canvas.Rectangle(0,0,Image2.Width,Image2.Height);
  Draw_Picture1.Draw_PNL_Picture(Image2.Canvas ,Image2.Width ,Image2.Height ); //画PNLA排版图,其中image1代表所要画的地方
  //画排版图
  pnl_size_s1.Long1:=Result_MakeUp2[i].PNLb_Long;
  pnl_size_s1.Width1:=Result_MakeUp2[i].PNLb_Width;
  pnl_size_s1.Unit_Long:=Result_MakeUp2[i].PNLb_Unit_Long;
  pnl_size_s1.Unit_Width:=Result_MakeUp2[i].PNLb_Unit_Width;
  pnl_size_s1.Unit_Long_ToUnit_Space:=Result_MakeUp2[i].PNLb_Unit_Long_Space;
  pnl_size_s1.Unit_Width_ToUnit_Space:=Result_MakeUp2[i].PNLb_Unit_Width_Space;
  pnl_size_s1.Unit_Long_PNL_Space:=Result_MakeUp2[i].PNLb_Unit_Long_ToPNL;
  pnl_size_s1.Unit_Width_PNL_Space:=Result_MakeUp2[i].PNLb_Unit_Width_ToPNL;
  pnl_size_s1.Unit_Long_Number:=Result_MakeUp2[i].PNLb_Unit_Long_Number;
  pnl_size_s1.Unit_Width_number:=Result_MakeUp2[i].PNLb_Unit_Width_Number;

  Draw_Picture1.Input_pnl_size:=pnl_size_s1; //输入PNLB尺寸,用于画PNLB排版图
  Image3.Canvas.Rectangle(0,0,Image3.Width,Image3.Height);//清除内容

  if  (pnl_size_s1.Long1<>0) and (pnl_size_s1.Width1<>0) then
  Draw_Picture1.Draw_PNL_Picture(Image3.Canvas ,Image3.Width ,Image3.Height );

  //画开料图
  var_Sheet_Size_TwoPNL.One_PNLA_Long:=Result_MakeUp2[i].One_Section_Long;  //300;   //一区PNLA长
  var_Sheet_Size_TwoPNL.One_PNLA_Width:=Result_MakeUp2[i].One_Section_Width;//  250;  //一区PNLA宽
  var_Sheet_Size_TwoPNL.One_PNLA_Long_Number:=Result_MakeUp2[i].One_Section_Long_Number;//  1;//一区PNLA长个数
  var_Sheet_Size_TwoPNL.One_PNLA_Width_Number:=Result_MakeUp2[i].One_Section_Width_Number;//  2;//一区PNLA宽个数
  var_Sheet_Size_TwoPNL.Two_PNLA_Long:=Result_MakeUp2[i].Two_Section_LongA;//  300;
  var_Sheet_Size_TwoPNL.Two_PNLA_Width:=Result_MakeUp2[i].Two_Section_WidthA;//  150;

  var_Sheet_Size_TwoPNL.Two_PNLA_Long_Number:=Result_MakeUp2[i].Two_Section_Long_NumberA;//  3;
  var_Sheet_Size_TwoPNL.Two_PNLA_Width_Number:=Result_MakeUp2[i].Two_Section_Width_NumberA;//  1 ;
  var_Sheet_Size_TwoPNL.Two_PNLB_Long:=Result_MakeUp2[i].Two_Section_Longb;//  350;
  var_Sheet_Size_TwoPNL.Two_PNLB_Width:=Result_MakeUp2[i].Two_Section_Widthb;//  200;
  var_Sheet_Size_TwoPNL.Two_PNLB_Long_Number:=Result_MakeUp2[i].Two_Section_Long_NumberB;//  2;
  var_Sheet_Size_TwoPNL.Two_PNLB_Width_Number:=Result_MakeUp2[i].Two_Section_Width_NumberB;//  1;

  var_Sheet_Size_TwoPNL.Three_PNLA_Long:=Result_MakeUp2[i].Three_Section_LongA;//  230;
  var_Sheet_Size_TwoPNL.Three_PNLA_Width:=Result_MakeUp2[i].Three_Section_WidthA;//  240;
  var_Sheet_Size_TwoPNL.Three_PNLA_Long_Number:=Result_MakeUp2[i].Three_Section_Long_NumberA; // 5;
  var_Sheet_Size_TwoPNL.Three_PNLA_Width_Number:=Result_MakeUp2[i].Three_Section_Width_NumberA;//  1;
  var_Sheet_Size_TwoPNL.Three_PNLB_Long:=Result_MakeUp2[i].Three_Section_Longb;//280;
  var_Sheet_Size_TwoPNL.Three_PNLB_Width:=Result_MakeUp2[i].Three_Section_Widthb;//190;
  var_Sheet_Size_TwoPNL.Three_PNLB_Long_Number:=Result_MakeUp2[i].Three_Section_Long_Numberb; //4;
  var_Sheet_Size_TwoPNL.Three_PNLB_Width_Number:=Result_MakeUp2[i].Three_Section_Width_Numberb;//1;

  var_Sheet_Size_TwoPNL.Sheet_Long:=Result_MakeUp2[i].Sheet_Long;//  1220;
  var_Sheet_Size_TwoPNL.Sheet_Width:=Result_MakeUp2[i].Sheet_Width;//  1040;
  
  var_Sheet_Size_TwoPNL.Two_Section_Array_type:=Result_MakeUp2[i].Two_Section_Array_type;
  var_Sheet_Size_TwoPNL.Three_Section_Array_type:=Result_MakeUp2[i].Three_Section_Array_type;
  var_Sheet_Size_TwoPNL.Draw_type:=Result_MakeUp2[i].Draw_type;

  Draw_Picture1.Sheet_Size_TwoPNL:=var_Sheet_Size_TwoPNL;//输入计算结果,用于画开料图
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);//清除内容

  Draw_Picture1.Draw_Sheet_TwoPNL_Picture(Image1.Canvas ,Image1.Width ,Image1.Height);

  if Result_MakeUp2[i].PNLB_number_Per_Sheet=0 then
    Image3.picture:= nil;
end;


procedure TFrm_PCBCUT.DrawPNL(i: integer);
var
  pnl_size_s2:pnl_size;
  var_Sheet_Size_OnePNL:Sheet_Size_twoPNL_1;
begin
  //画排版图
  pnl_size_s2.Long1:=Result_MakeUp[i].PNLA_Long;//取结果,PNLA长
  pnl_size_s2.Width1:=Result_MakeUp[i].PNLA_Width;//取结果,PNLA宽
  pnl_size_s2.Unit_Long:=Result_MakeUp[i].PNLA_Unit_Long;//取结果,PNLA单元长
  pnl_size_s2.Unit_Width:=Result_MakeUp[i].PNLA_Unit_Width;//取结果,PNLA单元宽
  pnl_size_s2.Unit_Long_ToUnit_Space:=Result_MakeUp[i].PNLA_Unit_Long_Space;//取结果,PNLA单元长间距
  pnl_size_s2.Unit_Width_ToUnit_Space:=Result_MakeUp[i].PNLA_Unit_Width_Space;//取结果,PNLA单元宽间距
  pnl_size_s2.Unit_Long_PNL_Space:=Result_MakeUp[i].PNLA_Unit_Long_ToPNL;//取结果,PNLA单元长到边距离
  pnl_size_s2.Unit_Width_PNL_Space:=Result_MakeUp[i].PNLA_Unit_Width_ToPNL;//取结果,PNLA单元宽到边距离
  pnl_size_s2.Unit_Long_Number:=Result_MakeUp[i].PNLA_Unit_Long_Number;//取结果,PNLA单元长个数
  pnl_size_s2.Unit_Width_number:=Result_MakeUp[i].PNLA_Unit_Width_Number;//取结果,PNLA单元宽个数
  Draw_Picture1:=TDraw_Picture.Create ;
  Draw_Picture1.Input_pnl_size:=pnl_size_s2; //输入PNLA尺寸,用于画PNLA排版图

  Image2.Canvas.Rectangle(0,0,Image2.Width,Image2.Height);//清除内容
  Draw_Picture1.Draw_PNL_Picture(Image2.Canvas ,Image2.Width ,Image2.Height ); //画PNLA排版图,其中image1代表所要画的地方
  Image3.Canvas.Rectangle(0,0,Image3.Width,Image3.Height);//清除内容

  //画开料图
  var_Sheet_Size_OnePNL.One_PNLA_Long:=Result_MakeUp[i].One_Section_Long;  //300;   //一区PNLA长
  var_Sheet_Size_OnePNL.One_PNLA_Width:=Result_MakeUp[i].One_Section_Width;//  250;  //一区PNLA宽
  var_Sheet_Size_OnePNL.One_PNLA_Long_Number:=Result_MakeUp[i].One_Section_Long_Number;//  1;//一区PNLA长个数
  var_Sheet_Size_OnePNL.One_PNLA_Width_Number:=Result_MakeUp[i].One_Section_Width_Number;//  2;//一区PNLA宽个数

  var_Sheet_Size_OnePNL.Two_PNLA_Long:=Result_MakeUp[i].Two_Section_LongA;//  300;
  var_Sheet_Size_OnePNL.Two_PNLA_Width:=Result_MakeUp[i].Two_Section_WidthA;//  150;
  var_Sheet_Size_OnePNL.Two_PNLA_Long_Number:=Result_MakeUp[i].Two_Section_Long_NumberA;//  3;
  var_Sheet_Size_OnePNL.Two_PNLA_Width_Number:=Result_MakeUp[i].Two_Section_Width_NumberA;//  1 ;
  var_Sheet_Size_OnePNL.Two_PNLB_Long:=Result_MakeUp[i].Two_Section_Longb;//  350;
  var_Sheet_Size_OnePNL.Two_PNLB_Width:=Result_MakeUp[i].Two_Section_Widthb;//  200;
  var_Sheet_Size_OnePNL.Two_PNLB_Long_Number:=Result_MakeUp[i].Two_Section_Long_NumberB;//  2;
  var_Sheet_Size_OnePNL.Two_PNLB_Width_Number:=Result_MakeUp[i].Two_Section_Width_NumberB;//  1;

  var_Sheet_Size_OnePNL.Three_PNLA_Long:=Result_MakeUp[i].Three_Section_LongA;//  230;
  var_Sheet_Size_OnePNL.Three_PNLA_Width:=Result_MakeUp[i].Three_Section_WidthA;//  240;
  var_Sheet_Size_OnePNL.Three_PNLA_Long_Number:=Result_MakeUp[i].Three_Section_Long_NumberA; // 5;
  var_Sheet_Size_OnePNL.Three_PNLA_Width_Number:=Result_MakeUp[i].Three_Section_Width_NumberA;//  1;
  var_Sheet_Size_OnePNL.Three_PNLB_Long:=Result_MakeUp[i].Three_Section_Longb;//280;
  var_Sheet_Size_OnePNL.Three_PNLB_Width:=Result_MakeUp[i].Three_Section_Widthb;//190;
  var_Sheet_Size_OnePNL.Three_PNLB_Long_Number:=Result_MakeUp[i].Three_Section_Long_Numberb; //4;
  var_Sheet_Size_OnePNL.Three_PNLB_Width_Number:=Result_MakeUp[i].Three_Section_Width_Numberb;//1;

  var_Sheet_Size_OnePNL.Sheet_Long:=Result_MakeUp[i].Sheet_Long;//  1220;
  var_Sheet_Size_OnePNL.Sheet_Width:=Result_MakeUp[i].Sheet_Width;//  1040;
  
  var_Sheet_Size_OnePNL.Two_Section_Array_type:=Result_MakeUp[i].Two_Section_Array_type;
  var_Sheet_Size_OnePNL.Three_Section_Array_type:=Result_MakeUp[i].Three_Section_Array_type;
  var_Sheet_Size_OnePNL.Draw_type:=Result_MakeUp[i].Draw_type;

  Draw_Picture1.Sheet_Size_TwoPNL:=var_Sheet_Size_OnePNL;//输入计算结果,用于画开料图
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);//清除内容
  Draw_Picture1.Draw_Sheet_onePNL_Picture(Image1.Canvas ,Image1.Width ,Image1.Height);

  Draw_Picture1.Free;
end;

procedure TFrm_PCBCUT.BitBtn3Click(Sender: TObject);
begin
  AutoSpell;
end;

procedure TFrm_PCBCUT.sgrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if ttype='' then exit;
  if (ARow>0) and (sgrid1.Cells[0,ARow]<>'') and (sgrid1.RowCount>=2) then
  begin
    if ttype<>'2' then    //单板
    begin
      DrawPNL(ARow-1);
      iSel:=ARow-1;
      Edit2.Text:=currtostr(Result_MakeUp[iSel].PNLA_Unit_Long_Number
                          *Result_MakeUp[iSel].PNLA_Unit_width_Number);
      Edit3.Text:=currtostr((Result_MakeUp[iSel].One_Section_Unit_Number
                     +Result_MakeUp[iSel].Two_Section_Unit_Number
                     +Result_MakeUp[iSel].three_Section_Unit_Number)/
                      Result_MakeUp[iSel].PNLA_Unit_Long_Number / Result_MakeUp[iSel].PNLA_Unit_width_Number);
      Edit4.Text:='';
      Edit5.Text:='';
      Edit42.Text:=currtostr(Result_MakeUp[iSel].PNLA_Long);
      Edit43.Text:=currtostr(Result_MakeUp[iSel].PNLA_Width);
      Edit44.Text:='';
      Edit45.Text:='';
      Edit1.Text:=currtostr(Result_MakeUp[iSel].PNLA_Unit_Long_ToPNL);
      Edit38.Text:=currtostr(Result_MakeUp[iSel].PNLA_Unit_Width_ToPNL);
    end else begin     //双板
      DrawPNL2(ARow-1);
      iSel:=ARow-1;
      Edit2.Text:=currtostr(Result_MakeUp2[iSel].PNLA_Unit_Long_Number*Result_MakeUp2[iSel].PNLA_Unit_width_Number);
      Edit3.Text:=currtostr(Result_MakeUp2[iSel].PNLA_number_Per_Sheet);
      if Result_MakeUp2[iSel].PNLB_number_Per_Sheet=0 then
      begin
        Edit4.Text:='0';
        Edit5.Text:='0';
      end else begin
        Edit4.Text:=currtostr(Result_MakeUp2[iSel].PNLB_Unit_Long_Number*Result_MakeUp2[iSel].PNLB_Unit_width_Number);
        Edit5.Text:=currtostr(Result_MakeUp2[iSel].PNLB_number_Per_Sheet);
      end;
      Edit42.Text:=currtostr(Result_MakeUp2[iSel].PNLA_Long);
      Edit43.Text:=currtostr(Result_MakeUp2[iSel].PNLA_Width);

      Edit1.Text:=currtostr(Result_MakeUp2[iSel].PNLA_Unit_Long_ToPNL);
      Edit38.Text:=currtostr(Result_MakeUp2[iSel].PNLA_Unit_Width_ToPNL);

      if Result_MakeUp2[iSel].PNLB_number_Per_Sheet>0 then
      begin
        Edit44.Text:=currtostr(Result_MakeUp2[iSel].PNLB_Long);
        Edit45.Text:=currtostr(Result_MakeUp2[iSel].PNLB_Width);
      end else begin
        Edit44.Text:='0';
        Edit45.Text:='0';
      end;
    end;
    Edit44.Enabled:=Edit44.Text<>'';
    Edit45.Enabled:=Edit45.Text<>'';
  end;
end;

procedure TFrm_PCBCUT.MicroAdapt;
var
  ta1,ta2,tb1,tb2:currency;
  FUNB1:boolean;
  pnl_size_s2:pnl_size;
  var_Sheet_Size_TwoPNL:Sheet_Size_twoPNL_1;
begin
  if rkey='' then exit;                                //还没拼版或者没有编辑时不允许调整
  if SpinEdit1.Value =1 then
  begin
    ta1:=strtocurr(Edit42.Text);
    ta2:=strtocurr(Edit43.Text);
    FUNB1:=MicroAdapt1(ta1,ta2,Result_MakeUp[iSel]);
    //画排版图
    pnl_size_s2.Long1:=Result_MakeUp[iSel].PNLA_Long;//取结果,PNLA长
    pnl_size_s2.Width1:=Result_MakeUp[iSel].PNLA_Width;//取结果,PNLA宽
    pnl_size_s2.Unit_Long:=Result_MakeUp[iSel].PNLA_Unit_Long;//取结果,PNLA单元长
    pnl_size_s2.Unit_Width:=Result_MakeUp[iSel].PNLA_Unit_Width;//取结果,PNLA单元宽
    pnl_size_s2.Unit_Long_ToUnit_Space:=Result_MakeUp[iSel].PNLA_Unit_Long_Space;//取结果,PNLA单元长间距
    pnl_size_s2.Unit_Width_ToUnit_Space:=Result_MakeUp[iSel].PNLA_Unit_Width_Space;//取结果,PNLA单元宽间距
    pnl_size_s2.Unit_Long_PNL_Space:=Result_MakeUp[iSel].PNLA_Unit_Long_ToPNL;//取结果,PNLA单元长到边距离
    pnl_size_s2.Unit_Width_PNL_Space:=Result_MakeUp[iSel].PNLA_Unit_Width_ToPNL;//取结果,PNLA单元宽到边距离
    pnl_size_s2.Unit_Long_Number:=Result_MakeUp[iSel].PNLA_Unit_Long_Number;//取结果,PNLA单元长个数
    pnl_size_s2.Unit_Width_number:=Result_MakeUp[iSel].PNLA_Unit_Width_Number;//取结果,PNLA单元宽个数
    Draw_Picture1:=TDraw_Picture.Create ;
    Draw_Picture1.Input_pnl_size:=pnl_size_s2; //输入PNLA尺寸,用于画PNLA排版图


    Image2.Canvas.Rectangle(0,0,Image2.Width,Image2.Height);//清除内容
    Draw_Picture1.Draw_PNL_Picture(Image2.Canvas ,Image2.Width ,Image2.Height ); //画PNLA排版图,其中image1代表所要画的地方
    Image3.Canvas.Rectangle(0,0,Image3.Width,Image3.Height);//清除内容

    //画开料图
    var_Sheet_Size_TwoPNL.One_PNLA_Long:=Result_MakeUp[iSel].One_Section_Long;    //300;     //一区PNLA长
    var_Sheet_Size_TwoPNL.One_PNLA_Width:=Result_MakeUp[iSel].One_Section_Width;//    250;    //一区PNLA宽
    var_Sheet_Size_TwoPNL.One_PNLA_Long_Number:=Result_MakeUp[iSel].One_Section_Long_Number;//  1;//一区PNLA长个数
    var_Sheet_Size_TwoPNL.One_PNLA_Width_Number:=Result_MakeUp[iSel].One_Section_Width_Number;//  2;//一区PNLA宽个数
    var_Sheet_Size_TwoPNL.Two_PNLA_Long:=Result_MakeUp[iSel].Two_Section_LongA;//  300;
    var_Sheet_Size_TwoPNL.Two_PNLA_Width:=Result_MakeUp[iSel].Two_Section_WidthA;//  150;
    var_Sheet_Size_TwoPNL.Two_PNLA_Long_Number:=Result_MakeUp[iSel].Two_Section_Long_NumberA;//  3;
    var_Sheet_Size_TwoPNL.Two_PNLA_Width_Number:=Result_MakeUp[iSel].Two_Section_Width_NumberA;//  1 ;
    var_Sheet_Size_TwoPNL.Two_PNLB_Long:=Result_MakeUp[iSel].Two_Section_Longb;//  350;
    var_Sheet_Size_TwoPNL.Two_PNLB_Width:=Result_MakeUp[iSel].Two_Section_Widthb;//  200;
    var_Sheet_Size_TwoPNL.Two_PNLB_Long_Number:=Result_MakeUp[iSel].Two_Section_Long_NumberB;//  2;
    var_Sheet_Size_TwoPNL.Two_PNLB_Width_Number:=Result_MakeUp[iSel].Two_Section_Width_NumberB;//  1;
    var_Sheet_Size_TwoPNL.Three_PNLA_Long:=Result_MakeUp[iSel].Three_Section_LongA;//  230;
    var_Sheet_Size_TwoPNL.Three_PNLA_Width:=Result_MakeUp[iSel].Three_Section_WidthA;//  240;
    var_Sheet_Size_TwoPNL.Three_PNLA_Long_Number:=Result_MakeUp[iSel].Three_Section_Long_NumberA; // 5;
    var_Sheet_Size_TwoPNL.Three_PNLA_Width_Number:=Result_MakeUp[iSel].Three_Section_Width_NumberA;//  1;
    var_Sheet_Size_TwoPNL.Three_PNLB_Long:=Result_MakeUp[iSel].Three_Section_Longb;//280;
    var_Sheet_Size_TwoPNL.Three_PNLB_Width:=Result_MakeUp[iSel].Three_Section_Widthb;//190;
    var_Sheet_Size_TwoPNL.Three_PNLB_Long_Number:=Result_MakeUp[iSel].Three_Section_Long_Numberb; //4;
    var_Sheet_Size_TwoPNL.Three_PNLB_Width_Number:=Result_MakeUp[iSel].Three_Section_Width_Numberb;//1;
    var_Sheet_Size_TwoPNL.Sheet_Long:=Result_MakeUp[iSel].Sheet_Long;//  1220;
    var_Sheet_Size_TwoPNL.Sheet_Width:=Result_MakeUp[iSel].Sheet_Width;//  1040;
    var_Sheet_Size_twoPNL.Two_Section_Array_type:=Result_MakeUp[iSel].Two_Section_Array_type;
    var_Sheet_Size_twoPNL.Three_Section_Array_type:=Result_MakeUp[iSel].Three_Section_Array_type;
    var_Sheet_Size_twoPNL.Draw_type:=Result_MakeUp[iSel].Draw_type;

    Draw_Picture1.Sheet_Size_TwoPNL:=var_Sheet_Size_twoPNL;//输入计算结果,用于画开料图
    Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);//清除内容
    Draw_Picture1.Draw_Sheet_onePNL_Picture(Image1.Canvas ,Image1.Width ,Image1.Height);
    Draw_Picture1.Free;
  end else begin
    MicroAdapt2(
    strtocurr(Edit42.text),strtocurr(Edit43.text),strtocurr(Edit44.text),strtocurr(Edit45.text)
    ,Result_MakeUp2[iSel]);
    DrawPNL2(iSel)
  end;
end;

function TFrm_PCBCUT.MicroAdapt1(const Pal, Paw: currency;var value1: TResult_MakeUp): boolean;
var
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
         value1.PNLA_Unit_Long_ToPNL:=(pal-value1.PNLA_Unit_Long*value1.PNLA_Unit_Long_Number-value1.PNLA_Unit_Long_Space*(value1.PNLA_Unit_Long_Number-1))/2;
         value1.PNLA_Unit_Width_ToPNL:=(paw-value1.PNLA_Unit_Width*value1.PNLA_Unit_Width_Number-value1.PNLA_Unit_Width_Space*(value1.PNLA_Unit_Width_Number-1))/2;

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
        showmessage('不能改!');
  end;

end;

procedure TFrm_PCBCUT.BtnMicroAdaptClick(Sender: TObject);
begin
  MicroAdapt;
end;

function TFrm_PCBCUT.MicroAdapt2(const Pal, Paw, Pbl, Pbw: currency;var value1: TResult_MakeUp2): boolean;
var     //用于处理尺寸变换
  temtopal,temtopbl,temtopaw,temtopbw,  //用于记录临时单元到边距离
  tempal2,tempbl2,tempaw2,tempbw2,      //用于记录二区临时PNL长与宽
  tempal3,tempbl3,tempaw3,tempbw3       //用于记录三区临时PNL长与宽
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

procedure TFrm_PCBCUT.BitBtn2Click(Sender: TObject);
Type
   TInput_PCB_SIZE=record
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
  Input_PCB_SIZE_onePNL22:TInput_PCB_SIZE;
  pnl_size_s2:pnl_size;//定义记录
  var_Sheet_Size_TwoPNL:Sheet_Size_twoPNL_1;//定义记录
  tem1:currency;
  tem2:integer;
  tem_Function1:boolean;
  i:integer;
  PNL_Informat311:TParam_PNLInfo;
  ASheet:array[0..0] of TParam_Sheet;
  p1,p2:PLongint;
begin
  ttype:='A';
  iSel:=0;
  SpinEdit1.Value:=1;
  Image1.Picture :=Image14.Picture ;
  Image2.Picture :=Image14.Picture ;
  Image3.Picture :=Image14.Picture ;
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);//清除内容
  Image2.Canvas.Rectangle(0,0,Image2.Width,Image2.Height);
  Image3.Canvas.Rectangle(0,0,Image3.Width,Image3.Height);
  tem_Function1:=TryStrToCurr(edit17.text,tem1);
  if tem_Function1 then Input_PCB_SIZE_Onepnl22.Unit_Long:=tem1
   else
  begin
    showmessage('没有输入单元长!');
    exit;
  end;

  tem_Function1:=TryStrToCurr(edit18.text,tem1);
  if tem_Function1 then Input_PCB_SIZE_Onepnl22.Unit_Width:=tem1
   else
  begin
    showmessage('没有输入单元宽!');
    exit;
  end;

  tem_Function1:=TryStrToCurr(edit24.text,tem1);
  if tem_Function1 then Input_PCB_SIZE_Onepnl22.Unit_Long_Space:=tem1
   else
  begin
    showmessage('没有输入单元长间距!');
    exit;
  end;


  tem_Function1:=TryStrToCurr(edit25.text,tem1);
  if tem_Function1 then Input_PCB_SIZE_Onepnl22.Unit_Width_Space:=tem1
   else
  begin
    showmessage('没有输入单元宽间距!');
    exit;
  end;


  tem_Function1:=TryStrToCurr(edit26.text,tem1);
  if tem_Function1 then Input_PCB_SIZE_Onepnl22.Unit_Long_ToPNL:=tem1
   else
  begin
    showmessage('没有输入单元长到边距离!');
    exit;
  end;


  tem_Function1:=TryStrToCurr(edit27.text,tem1);
  if tem_Function1 then Input_PCB_SIZE_Onepnl22.Unit_Width_ToPNL:=tem1
   else
  begin
    showmessage('没有输入单元宽到边距离!');
    exit;
  end;

  tem_Function1:=TryStrToint(edit20.text,tem2);
  if tem_Function1 then Input_PCB_SIZE_Onepnl22.Unit_Long_Number:=tem2
   else
  begin
    showmessage('没有输入单元长个数!');
    exit;
  end;

  tem_Function1:=TryStrToint(edit21.text,tem2);
  if tem_Function1 then
    Input_PCB_SIZE_Onepnl22.Unit_Width_Number:=tem2
   else
  begin
    showmessage('没有输入单元宽个数!');
    exit;
  end;


  tem_Function1:=TryStrToint(edit22.text,tem2);
  if tem_Function1 then
    Input_PCB_SIZE_Onepnl22.PNLA_Long_Number:=tem2
  else
    Input_PCB_SIZE_Onepnl22.PNLA_Long_Number:=0;


  tem_Function1:=TryStrToint(edit23.text,tem2);
  if tem_Function1 then
    Input_PCB_SIZE_Onepnl22.PNLA_Width_Number:=tem2
  else
   Input_PCB_SIZE_Onepnl22.PNLA_Width_Number:=0;


  tem_Function1:=TryStrToCurr(edit28.text,tem1);
  if tem_Function1 then
    Input_PCB_SIZE_Onepnl22.SHEET_Long:=tem1
  else
    Input_PCB_SIZE_Onepnl22.SHEET_Long :=0;


  tem_Function1:=TryStrToCurr(edit29.text,tem1);
  if tem_Function1 then
    Input_PCB_SIZE_Onepnl22.SHEET_Width:=tem1
  else
    Input_PCB_SIZE_Onepnl22.SHEET_Width:=0;
    
  iSel:=0;
  setLength(Result_MakeUp,0);
  //画排版PNLA图
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
  image14.Canvas.Rectangle(0,0,image14.Width,image14.Height);//清除内容

  setLength(Param_Sheet,1);
  setLength(Result_MakeUp,1);

  //画开料图
  if (((Input_PCB_SIZE_Onepnl22.PNLA_Long_Number=0) or (Input_PCB_SIZE_Onepnl22.PNLA_Width_Number=0)) and
      (Input_PCB_SIZE_Onepnl22.SHEET_Long>=Input_PCB_SIZE_Onepnl22.PNLA_Long) and (Input_PCB_SIZE_Onepnl22.SHEET_Width>=Input_PCB_SIZE_Onepnl22.PNLA_Width))
     or (((Input_PCB_SIZE_Onepnl22.PNLA_Long_Number=0) or (Input_PCB_SIZE_Onepnl22.PNLA_Width_Number=0)) and
     (strtocurr('0'+trim(edit28.Text))>=Input_PCB_SIZE_Onepnl22.PNLA_Long) and (strtocurr('0'+trim(edit29.Text))>=Input_PCB_SIZE_Onepnl22.PNLA_Width)) then
  begin
    Param_Sheet[0].Sheet_Long:=strtocurr('0'+trim(edit28.Text));//大料长
    Param_Sheet[0].Sheet_Width:=strtocurr('0'+trim(edit29.Text));//大料宽
  end else begin
    Param_Sheet[0].Sheet_Long:=Input_PCB_SIZE_Onepnl22.PNLA_Long+1;
    Param_Sheet[0].Sheet_Width:=Input_PCB_SIZE_Onepnl22.PNLA_Width+1;
  end;
    p1:=@Param_Sheet;
    p2:=@Result_MakeUp;
    CutSheet:=TCutSheet.Create(PAParam_Sheet(p1),PAResult_MakeUp(p2),1);

    CutSheet.Calculate_Array_Complete_Time_Display:=true;//显示计算时
    CutSheet.Echange_Unit_To_PNL_Space:=true;            //交换单到边距离
    CutSheet.Calculate_Rate_Type:=1;                     //1用单元计算利用率2用PNL计算利用率,暂时不起作用
    CutSheet.Calculate_Falchion_Number_Equality_Hold:=true;
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
    CutSheet.PNL_Informat:=PNL_Informat311;

   CutSheet.Calculate_PnlToSheet_Array ;
   Result_MakeUp[0]:=CutSheet.Calculate_Result[0];

   var_Sheet_Size_TwoPNL.One_PNLA_Long:=Result_MakeUp[0].One_Section_Long;
   var_Sheet_Size_TwoPNL.One_PNLA_Width:=Result_MakeUp[0].One_Section_width;
   var_Sheet_Size_TwoPNL.One_PNLA_Long_Number:=Result_MakeUp[0].One_Section_Long_Number;
   var_Sheet_Size_TwoPNL.One_PNLA_Width_Number:=Result_MakeUp[0].One_Section_width_Number;

   var_Sheet_Size_TwoPNL.Two_PNLA_Long:=Result_MakeUp[0].Two_Section_LongA ;
   var_Sheet_Size_TwoPNL.Two_PNLA_Width:=Result_MakeUp[0].two_Section_WidthA ;
   var_Sheet_Size_TwoPNL.Two_PNLA_Long_Number:=Result_MakeUp[0].two_Section_Long_NumberA ;
   var_Sheet_Size_TwoPNL.Two_PNLA_Width_Number:=Result_MakeUp[0].two_Section_Width_NumberA ;
   var_Sheet_Size_TwoPNL.Two_PNLB_Long:=Result_MakeUp[0].two_Section_LongB ;
   var_Sheet_Size_TwoPNL.Two_PNLB_Width:=Result_MakeUp[0].two_Section_WidthB ;

   var_Sheet_Size_TwoPNL.Two_PNLB_Long_Number:=Result_MakeUp[0].two_Section_Long_NumberB ;
   var_Sheet_Size_TwoPNL.Two_PNLB_Width_Number:=Result_MakeUp[0].two_Section_Width_NumberB ;
   var_Sheet_Size_TwoPNL.Three_PNLA_Long:=Result_MakeUp[0].Three_Section_LongA ;
   var_Sheet_Size_TwoPNL.Three_PNLA_Width:=Result_MakeUp[0].Three_Section_WidthA ;
   var_Sheet_Size_TwoPNL.Three_PNLA_Long_Number:=Result_MakeUp[0].Three_Section_Long_NumberA ;
   var_Sheet_Size_TwoPNL.Three_PNLA_Width_Number:=Result_MakeUp[0].Three_Section_Width_NumberA ;
   var_Sheet_Size_TwoPNL.Three_PNLB_Long:=Result_MakeUp[0].Three_Section_LongB ;
   var_Sheet_Size_TwoPNL.Three_PNLB_Width:=Result_MakeUp[0].Three_Section_WidthB ;
   var_Sheet_Size_TwoPNL.Three_PNLB_Long_Number:=Result_MakeUp[0].Three_Section_Long_NumberB ;
   var_Sheet_Size_TwoPNL.Three_PNLB_Width_Number:=Result_MakeUp[0].Three_Section_Width_NumberB ;
   var_Sheet_Size_TwoPNL.Sheet_Long:=Result_MakeUp[0].Sheet_Long;
   var_Sheet_Size_TwoPNL.Sheet_Width:=Result_MakeUp[0].Sheet_Width;
   var_Sheet_Size_twoPNL.Two_Section_Array_type:=Result_MakeUp[0].Two_Section_Array_type;
   var_Sheet_Size_twoPNL.Three_Section_Array_type:=Result_MakeUp[0].Three_Section_Array_type;
   var_Sheet_Size_twoPNL.Draw_type:=Result_MakeUp[0].Draw_type;

   Draw_Picture1.Sheet_Size_TwoPNL:=var_Sheet_Size_twoPNL;//输入计算结果,用于画开料图

   image14.Canvas.Rectangle(0,0,image14.Width,image14.Height);//清除内容
   Draw_Picture1.Draw_Sheet_onePNL_Picture(image14.Canvas ,image14.Width ,image14.Height);
   image1.Picture:=image14.Picture;
   image14.Canvas.Rectangle(0,0,image14.Width,image14.Height);
   CutSheet.Free;

  if (Input_PCB_SIZE_Onepnl22.PNLA_Long_Number>0) and (Input_PCB_SIZE_Onepnl22.PNLA_Width_Number>0) and (Input_PCB_SIZE_Onepnl22.SHEET_Long>=Input_PCB_SIZE_Onepnl22.PNLA_Long) and (Input_PCB_SIZE_Onepnl22.SHEET_Width>=Input_PCB_SIZE_Onepnl22.PNLA_Width) then
  begin
    tem_Function1:=(Input_PCB_SIZE_Onepnl22.SHEET_width>=Input_PCB_SIZE_Onepnl22.PNLA_width*Input_PCB_SIZE_Onepnl22.PNLA_width_Number ) and (Input_PCB_SIZE_Onepnl22.SHEET_Long>=Input_PCB_SIZE_Onepnl22.PNLA_Long*Input_PCB_SIZE_Onepnl22.PNLA_Long_Number)  ;
    if not tem_Function1 then
    begin
      showmessage('大料小于板长与个数的乘积,无法画开料图,请输入正确大料大小!');
      Draw_Picture1.Free;
      exit;
    end;
       var_Sheet_Size_TwoPNL.One_PNLA_Long:=Input_PCB_SIZE_Onepnl22.PNLA_Long;
       var_Sheet_Size_TwoPNL.One_PNLA_Width:=Input_PCB_SIZE_Onepnl22.PNLA_Width;
       var_Sheet_Size_TwoPNL.One_PNLA_Long_Number:=Input_PCB_SIZE_Onepnl22.PNLA_Long_Number;
       var_Sheet_Size_TwoPNL.One_PNLA_Width_Number:=Input_PCB_SIZE_Onepnl22.PNLA_Width_Number;
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

       Draw_Picture1.Sheet_Size_TwoPNL:=var_Sheet_Size_twoPNL;    //输入计算结果,用于画开料图
       image14.Canvas.Rectangle(0,0,image14.Width,image14.Height);//清除内容
       Draw_Picture1.Draw_Sheet_onePNL_Picture(image14.Canvas ,image14.Width ,image14.Height);
       image1.Picture:=image14.Picture;
       image14.Canvas.Rectangle(0,0,image14.Width,image14.Height);
  end;
  Draw_Picture1.Free;

   sgrid1.RowCount:=2;
   sgrid1.Cells[0,1]:=inttostr(i+1);                                //'序号';
   sgrid1.Cells[1,1]:=currtostr(100*Result_MakeUp[0].Using_Rate);   //'利用率%';
   if (Edit28.Text<>'') and (Edit29.Text<>'') then
   begin
     sgrid1.Cells[2,1]:=Edit28.Text;
     sgrid1.Cells[3,1]:=Edit29.Text;
   end else if  Result_MakeUp[i].Sheet_Long>Result_MakeUp[0].Sheet_Width then
   begin
     sgrid1.Cells[2,1]:=currtostr(Result_MakeUp[0].Sheet_Long);       //'大料长';
     sgrid1.Cells[3,1]:=currtostr(Result_MakeUp[0].Sheet_Width);      //'大料宽';
   end else begin
     sgrid1.Cells[2,1]:=currtostr(Result_MakeUp[0].Sheet_Width);
     sgrid1.Cells[3,1]:=currtostr(Result_MakeUp[0].Sheet_Long);
   end;

   sgrid1.Cells[4,1]:=currtostr((Result_MakeUp[0].One_Section_Unit_Number+   //'总PNL数';
                                   Result_MakeUp[0].Two_Section_Unit_Number+
                                 Result_MakeUp[0].three_Section_Unit_Number)/
                     Result_MakeUp[0].PNLA_Unit_Long_Number / Result_MakeUp[0].PNLA_Unit_width_Number);

   sgrid1.Cells[5,1]:=currtostr(strtoint(sgrid1.Cells[4,1])*   //'总Set数';
                     Result_MakeUp[0].PNLA_Unit_Long_Number*Result_MakeUp[0].PNLA_Unit_width_Number);
   sgrid1.Cells[6,1]:=inttostr(strtoint(sgrid1.Cells[5,1])*strtoint(Edit19.Text));   //'总Pcs数';


  Edit2.Text:=currtostr(Result_MakeUp[iSel].PNLA_Unit_Long_Number
                      *Result_MakeUp[iSel].PNLA_Unit_width_Number);
  Edit42.Text:=currtostr(Result_MakeUp[iSel].PNLA_Long);
  Edit43.Text:=currtostr(Result_MakeUp[iSel].PNLA_Width);
  
  Edit3.Text:=currtostr((Result_MakeUp[iSel].One_Section_Unit_Number
                 +Result_MakeUp[iSel].Two_Section_Unit_Number
                 +Result_MakeUp[iSel].three_Section_Unit_Number)/
                  Result_MakeUp[iSel].PNLA_Unit_Long_Number / Result_MakeUp[iSel].PNLA_Unit_width_Number);
  Edit42.Enabled:=true;
  Edit43.Enabled:=true;
  Edit42.ReadOnly:=false;
  Edit43.ReadOnly:=false;
  Edit4.Text:='';
  Edit5.Text:='';
  Edit44.Text:=''; Edit44.Enabled:=false;
  Edit45.Text:=''; Edit45.Enabled:=false;

  rkey:='1';
  BtnMicroAdapt.Enabled:=true;
  ttype :='0';     //手动拼版
end;

procedure TFrm_PCBCUT.tbsaveClick(Sender: TObject);
begin
  sav;
end;

procedure TFrm_PCBCUT.SpinEdit1Change(Sender: TObject);
begin
  Edit44.Enabled:=SpinEdit1.Value=2;
  Edit45.Enabled:=SpinEdit1.Value=2;

  edit34.Enabled:=SpinEdit1.Value=2;
  edit35.Enabled:=SpinEdit1.Value=2;
  edit36.Enabled:=SpinEdit1.Value=2;
  edit37.Enabled:=SpinEdit1.Value=2;
end;

function TFrm_PCBCUT.svValid: boolean;
begin
  result:=false;
  if ttype='3'  then
  begin
    if strtofloat('0'+edit2.Text)=0 then begin showmessage('套/A板:不能为空'); abort;end;
    if strtofloat('0'+edit3.Text)=0 then begin showmessage('A板/大料：不能为空'); abort;end;
    if (strtofloat('0'+edit42.Text)=0) or (strtofloat('0'+edit43.Text)=0) then
    begin
      showmessage('PNLA大小不能为空');
      abort;
    end;
    if strtofloat('0'+edit31.Text)=0 then begin showmessage('大料长不能为空'); abort;end;
    if strtofloat('0'+edit32.Text)=0 then begin showmessage('大料宽不能为空'); abort;end;
    if strtofloat('0'+edit33.Text)=0 then begin showmessage('利用率不能为空'); abort;end;
    if strtofloat('0'+edit6.Text)=0 then begin showmessage('Sets长不能为空'); abort;end;
    if strtofloat('0'+edit7.Text)=0 then begin showmessage('Sets宽不能为空'); abort;end;
    if strtofloat('0'+edit8.Text)=0 then begin showmessage('单元数/套：不能为空'); abort;end;

    if SpinEdit1.Value=2 then
    begin
      if strtofloat('0'+edit4.Text)=0 then begin showmessage('套/B板：不能为空'); abort;end;
      if strtofloat('0'+edit5.Text)=0 then begin showmessage('B板/大料：不能为空'); abort;end;
      if (strtofloat('0'+edit44.Text)=0) or (strtofloat('0'+edit45.Text)=0) then
      begin
        showmessage('PNLB大小不能为空');
        abort;
      end;
    end ;
  end;
  result:=true;
end;

procedure TFrm_PCBCUT.ToolButton3Click(Sender: TObject);
var vfile:pchar;
begin
  if not DirectoryExists('d:\sjsys') then mkdir('d:\sjsys');
  if Pagecontrol1.ActivePageIndex=0 then
  begin
    Image1.picture.SavetoFile('d:\sjsys\sheet.bmp');
    vfile:=pchar('d:\sjsys\sheet.bmp');
    ShellExecute(0,'open','mspaint.exe',vfile,nil,SW_SHOWNORMAL);
    vimag1:=1;
  end else
  if Pagecontrol1.ActivePageIndex=1 then
  begin
    Image2.picture.SavetoFile('D:\sjsys\pnl1.bmp');
    vfile:=pchar('D:\sjsys\pnl1.bmp');
    ShellExecute(0,'open','mspaint.exe',vfile,nil,SW_SHOWNORMAL);
    vimag2:=1;
  end else
  begin
    Image3.picture.SavetoFile('D:\sjsys\pnl2.bmp');
    vfile:=pchar('D:\sjsys\pnl2.bmp');
    ShellExecute(0,'open','mspaint.exe',vfile,nil,SW_SHOWNORMAL);
    vimag3:=1;
  end;
  btrefresh.Enabled :=true;
end;

procedure TFrm_PCBCUT.btrefreshClick(Sender: TObject);
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
  if vimag3=1 then
    if messagedlg('是否更新Panel2的排版图？',mtconfirmation,[mbYes,mbNo],0)=mrYes
      then begin
        Image3.picture.LoadfromFile('D:\sjsys\pnl2.bmp');
        vimag3:=0;
      end;
  btrefresh.Enabled:=false;
end;

procedure TFrm_PCBCUT.FormDestroy(Sender: TObject);
begin
 if ado493.Active then ado493.Close;
end;

end.

