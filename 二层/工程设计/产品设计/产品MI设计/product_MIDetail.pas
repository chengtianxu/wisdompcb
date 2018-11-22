unit product_MIDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, ImgList, DBCtrls, Mask,
  Grids, DBGrids, Menus, DB, ADODB,math, ExtDlgs, DBGridEh,Clipbrd;

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
    Panel4: TPanel;
    Edit2: TEdit;
    Label34: TLabel;
    BitBtn4: TBitBtn;
    Panel5: TPanel;
    DBMemo1: TDBMemo;
    SpeedButton3: TSpeedButton;
    CheckBox1: TCheckBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
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
    DBGrid2: TDBGrid;
    Label41: TLabel;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    Label42: TLabel;
    DBComboBox2: TDBComboBox;
    Label43: TLabel;
    StringGrid1: TStringGrid;
    Panel7: TPanel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Edit6: TEdit;
    Label44: TLabel;
    Edit7: TEdit;
    Label45: TLabel;
    Label46: TLabel;
    Edit8: TEdit;
    isopen: TCheckBox;
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
    Label56: TLabel;
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
    SpeedButton6: TSpeedButton;
    PopupMenu6: TPopupMenu;
    N11: TMenuItem;
    N12: TMenuItem;
    PopupMenu7: TPopupMenu;
    N13: TMenuItem;
    N14: TMenuItem;
    BitBtn16: TBitBtn;
    OpenDialog1: TOpenDialog;
    SavePictureDialog1: TSavePictureDialog;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
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
    BitBtn24: TBitBtn;
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
    procedure BitBtn4Click(Sender: TObject);
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
    procedure SpeedButton6Click(Sender: TObject);
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
  private
    { Private declarations }
   est_scrap : single; 
   OldGridWnd : TWndMethod;
   dbgrid2wnd : TWndMethod;
   ecnopen,if_post,impedance:boolean; //是否需要重新打开ecn清单
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
   function get_date0025toprkey(rkey25: integer):integer;
   procedure get_treedate(rkey25:integer;treeview:Ttreeview);
   procedure get_ecnlist(rkey25:integer);
   procedure get_impedance(rkey25:integer);
   procedure update_impedance(rkey25:integer);
   procedure update_ecnlist(rkey25:integer);
   function find_difficulty(rkey25:integer) :boolean;
   function cacl_flowpara(tvalue,par_formula :string):string;
   function calaflowpara(vstr:string):string;
   function vertify3(vstring:string):string;
   procedure update_filename();
   procedure Paste(var str:string);
   function isnum(str:string):boolean;
   function hz_jiajian(str:string;jia_or_jian:byte):string;
   function dr_jishuan(dr:single):single;
  public
    { Public declarations }
  //  nearsize_part:string; //寻找拼版尺寸或交货尺寸相近的部件作出提示
    function find_setpnlmin(var nearsize_part:string):boolean;
  end;

type
 TMyDBGrid=class(TDBGrid);

var
 Form2: TForm2;
const
 TmpFileDir = 'c:\tmp\';

implementation

uses damo, common, route_flow, flowpara_edit, deptcode_search,
  layer_frame, PickEngNote, append_productin, main, prod_search,
  stepnumber_search, layersdata_select, reportselect, report_data,
  product_search, drcacle, FileReadWriteUnitClass,PCBCUT, report_data1,
  PubFunc,shellAPI, Genesis_dr;

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
    'type from data0030 where source_ptr='+inttostr(rkey25)+' order by seq_no ';
  open;
  stringgrid2.RowCount:=recordcount+2;
  for i:=1 to recordcount do
  begin
   stringgrid2.Cells[1,i]:=trim(fieldbyname('MARK').AsString);
   stringgrid2.Cells[2,i]:=trim(fieldbyname('layer').AsString);
   stringgrid2.Cells[3,i]:=trim(fieldbyname('refe_layer').AsString);
   stringgrid2.Cells[4,i]:=trim(fieldbyname('line_width').AsString);
   stringgrid2.Cells[5,i]:=trim(fieldbyname('line_ofsight').AsString);
   stringgrid2.Cells[6,i]:=trim(fieldbyname('impedance').AsString);
   stringgrid2.Cells[7,i]:=trim(fieldbyname('adjust_linewidth').AsString);
   stringgrid2.Cells[8,i]:=trim(fieldbyname('adjust_lineofsight').AsString);
   stringgrid2.Cells[9,i]:=trim(fieldbyname('adjust_impedance').AsString); //'绿油前阻抗';
   stringgrid2.Cells[10,i]:=trim(fieldbyname('product_impedance').AsString); //'成品阻抗';
   stringgrid2.Cells[11,i]:=trim(fieldbyname('type').AsString); //'类型';
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
    'impedance, adjust_linewidth, adjust_lineofsight, adjust_impedance, product_impedance,'+
    'type from data0030 where source_ptr='+inttostr(rkey25)+' order by seq_no ';
  open;
 end;

  for i:=1 to stringgrid2.RowCount-2 do
   dm.ADOQuery1.AppendRecord([i,
                              rkey25,
                              stringgrid2.Cells[1,i],
                              stringgrid2.Cells[2,i],
                              stringgrid2.Cells[3,i],
                              stringgrid2.Cells[4,i],
                              stringgrid2.Cells[5,i],
                              stringgrid2.Cells[6,i],
                              stringgrid2.Cells[7,i],
                              stringgrid2.Cells[8,i],
                              stringgrid2.Cells[9,i],
                              stringgrid2.Cells[10,i],
                              stringgrid2.Cells[11,i]]);

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
 edit3.Text:='';  //最后修改人
 isopen.Checked:=false;  //钻孔表需要重新打开
 impedance:=false;     //阻抗表需重新打开
 ecnopen:=false; //ecn清单需要重新打开
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
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid2.DataSource.DataSet.MoveBy(1)
   else
     DBGrid2.DataSource.DataSet.MoveBy(-1)
 end
 else
   dbgrid2wnd(Message);
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
      dm.ads279source_PTR.Value := rkey25;
      dm.ads279parameter_ptr.Value := dm.ADOQuery1.FieldValues['rkey'];
      dm.ads279IES_PROD.Value:=1;       //代表全局参数0代表流程判断参数
      dm.ads279IES_CRP.AsVariant:=dm.ADOQuery1.FieldValues['SEQUENCE_NO'];//排序字段
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
        dm.ads279source_PTR.Value:=rkey25;
        dm.ads279parameter_ptr.Value:=dm.ADOQuery1.FieldValues['rkey'];
        dm.ads279IES_PROD.Value:=1;
        dm.ads279IES_CRP.AsVariant:=dm.ADOQuery1.FieldValues['SEQUENCE_NO'];//排序字段
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
  min_drill:= strtocurr( stringgrid1.Cells[6,1]);
 except
  min_drill:=0;
 end;

 if stringgrid1.RowCount>3 then
 for i:=2 to stringgrid1.RowCount-2 do
 begin
  try
   strtofloat(stringgrid1.Cells[6,i]);
  except
   Continue;
  end;
  if  strtofloat(stringgrid1.Cells[6,i]) < min_drill then
   min_drill:= strtocurr( stringgrid1.Cells[6,i]);
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
   if trim(stringgrid2.Cells[1,i])<>'' then
    begin
     t0 :=copy(trim(stringgrid2.Cells[1,i]),
                length(trim(stringgrid2.Cells[1,i])),1);
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
  'tooling_rev, OUTP_SPFC,tool_old_rev,TOOL_REMARK'+#13+
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
                              dm.ADS38TOOL_REMARK.Value
                              ]);
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
  ' seq_no, Doc_Flag, after_flag, flow_spfc_flag'+#13+
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
                              dm.ads494flow_spfc_flag.Value   //是否重点
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
  'UNIT, SET_UNMBER,PANEL_A, PANEL_B, SEQ_NO,REMARK'+#13+
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
                              stringgrid1.Cells[11,i]]);

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
  'where source_ptr='+inttostr(rkey25)+#13+
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
    rkey := fieldbyname('parent_ptr').AsInteger;  //如果有爷爷等于爷爷值
  end;
 result:=rkey;
end;

procedure TForm2.get_treedate(rkey25: integer;treeview:Ttreeview);
var
 node:ttreenode;   //treeview控件的节点变量
 rkey0025:^integer;
begin

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

 DBGrid2Wnd := DBGrid2.WindowProc ;
 DBGrid2.WindowProc := NewGrid2Wnd;
 file_name:=tstringlist.Create;
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

 if strtoint(status.Caption)=0 then   //编辑
  begin
   if not bitbtn1.Enabled then bitbtn1.Enabled:=true;
   if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
   if not bitbtn14.Enabled then bitbtn14.Enabled:=true;
   if not bitbtn15.Enabled then bitbtn15.Enabled:=true;
  end;

screen.Cursor:=crappstart;
checkbox2.Checked:= trim(dm.AQY0025current_rev.Value) = 'Y';
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
   bitbtn12.visible:=true;
   label64.Visible:=true;
   label62.Visible:=true;
   label63.Visible:=true;
   label64.Caption:='';
   dbedit7.ReadOnly:=true;   //内层不可以修改报废率
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
  else begin
   dbedit32.Visible:=false;
   dbedit33.Visible:=false;
   bitbtn12.Visible:=false;
   label64.Visible:=false;
   label64.Visible:=false;
   label62.Visible:=false;
   label63.Visible:=false;
   dbedit7.ReadOnly:=false; //外层可以修改报废率
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
   edit2.Text:=fieldbyname('ENG_FLOW_NAME').AsString;
   label56.Caption:=fieldbyname('ENG_FLOW_DESC').AsString;
  end
  else
   begin
   edit2.Text:='';
   label56.Caption:='';
   end;
 END;

 if not isopen.Checked then  self.get_drill(dm.AQY0025RKEY.Value); //打开钻孔表

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
    memo3.Text:=self.get_customer(dm.AQY0025CUSTOMER_PTR.Value);
    memo3.ReadOnly:=true;
    dm.ADO20.Close;
    dm.ADO20.Parameters[0].Value:=dm.AQY0025CUSTOMER_PTR.Value;
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
 end;

 notebook1.PageIndex := listbox1.ItemIndex+1;
 headercontrol1.Sections[2].Text := listbox1.Items[listbox1.ItemIndex];
 screen.Cursor:=crdefault;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
 if_post:=false;
 self.get_treedate(dm.AQY0025RKEY.Value,treeview1);
 notebook1.PageIndex:=0;
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

 stringgrid2.Cells[0,0]:='序';
 stringgrid2.Cells[1,0]:='标记';
 stringgrid2.Cells[2,0]:='层次';
 stringgrid2.Cells[3,0]:='参考层';
 stringgrid2.Cells[4,0]:='客户线宽';
 stringgrid2.Cells[5,0]:='客户线距';
 stringgrid2.Cells[6,0]:='客户阻抗';
 stringgrid2.Cells[7,0]:='调整线宽';
 stringgrid2.Cells[8,0]:='调整线距';
 stringgrid2.Cells[9,0]:='绿油前阻抗';
 stringgrid2.Cells[10,0]:='成品阻抗';
 stringgrid2.Cells[11,0]:='类型';


 sg2.Cells[0,0]:='序号';
 sg2.Cells[1,0]:='厂编版本';
 sg2.Cells[2,0]:='变更内容摘要';
 sg2.Cells[3,0]:='来源';
 sg2.Cells[4,0]:='有无新文件';
 sg2.Cells[5,0]:='工程师';
 sg2.Cells[6,0]:='日期';
 sg2.Cells[7,0]:='ECN编号';
 sg2.ColWidths[8]:=0;

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

  dbradiogroup1.Enabled:=false;
  dbcheckbox1.Enabled:=false;
  dbcheckbox5.Enabled:=false;
  checkbox2.Enabled:=false;  //无卤素
  bitbtn12.Enabled:=false;
  bitbtn13.Enabled:=false;
  bitbtn16.Enabled:=false;
  bitbtn19.Enabled:=false;
  bitbtn24.Enabled:=false;
  dbedit32.Enabled:=false;
  dbedit33.Enabled:=false;

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

  speedbutton1.Enabled:=false;
  speedbutton2.Enabled:=false;
  speedbutton6.Enabled:=false;

  dbcombobox1.Enabled:=false;
  dbgrid1.Columns[4].ReadOnly:=true;
  bitbtn4.Enabled:=false;
  dbgrid2.PopupMenu:=self.PopupMenu5;
  speedbutton3.Enabled:=false;
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
  bitbtn22.Enabled:=false;
  combobox1.Enabled:=false;
//  dbmemo2.ReadOnly:=true;
  dbmemo3.ReadOnly:=true;
  dbmemo4.ReadOnly:=true;
  dbradiogroup2.ReadOnly:=true;
 end
 else
  begin
  
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
if not dm.ADOQuery1.IsEmpty then
try
if strtofloat(dm.ADOQuery1.FieldByName('PARAMETER_VALUE').AsString)>=6 then
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
if not dm.ADOQuery1.IsEmpty then
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
if not dm.ADOQuery1.IsEmpty then
try
if strtofloat(dm.ADOQuery1.FieldByName('PARAMETER_VALUE').AsString)<=0.1 then
 result:=true;
except
end;

end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 infor:string;
begin
dm.ADOConnection1.BeginTrans;
try
 dm.AQY0025ANALYSIS_CODE_5.Value:=dm.AQY0025pcs_lngth.AsString+'mm X '+
                                  dm.AQY0025pcs_width.AsString+'mm';
 dm.AQY0025ANALYSIS_CODE_1.Value:=dm.AQY0025set_lngth.AsString+'mm X '+
                                  dm.AQY0025set_width.AsString+'mm';
 dm.AQY0025ANALYSIS_CODE_4.Value:=dm.AQY0025spell_lngth.AsString+'mm X '+
                                  dm.AQY0025spell_width.AsString+'mm';

 dm.ads502.UpdateBatch();
 dm.ads279.UpdateBatch();
 dm.ADS279_0.UpdateBatch();

 self.update_deptcode(dm.AQY0025RKEY.Value);
 self.update_tecparameter(dm.AQY0025RKEY.Value);
 Self.update_IESparameter(dm.AQY0025RKEY.Value);
 
 if self.find_difficulty(dm.AQY0025RKEY.Value) then
  dm.AQY0025barcode_flag.Value:=1;

 if checkbox2.Checked then
  dm.AQY0025current_rev.Value:='Y'
 else
  dm.AQY0025current_rev.Value:='N';

 dm.AQY0025.Post;
 if_post:=true;
 self.update_drill(dm.AQY0025RKEY.Value);  //更新钻孔表
 if dm.AQY0025PARENT_PTR.Value=0  then       //顶层保存
 begin
  self.update_ecnlist(dm.AQY0025RKEY.Value); //更新ecn履历表
  update_filename;        //更新工程相关文档
  self.update_impedance(dm.AQY0025RKEY.Value);
 end;
 dm.ADOConnection1.CommitTrans;

 infor:='';
 if dm.AQY0025ttype.Value=0 then  //量产板才做防呆检查
  if self.find_setpnlmin(infor) then
   showmessage('产品:'+infor+'与本产品拼版尺寸相同或交货尺寸非常接近，建议增加工程防呆设计！');

 if infor<>'' then
  begin
   infor:= '产品:'+infor+'与本产品拼版尺寸相同或交货尺寸非常接近，建议增加工程防呆设计!';
   clipboard.Clear;
   Clipboard.AsText:=infor;
  end;

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

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
try
 form_route:=tform_route.Create(application);
 form_route.Edit1.Text:=edit2.Text;
 form_route.Label2.Caption:=label56.Caption;
 form_route.Label3.Caption:= treeview1.Items[0].Text;
 form_route.route_ptr.Caption:=inttostr(dm.AQY0025ENG_ROUTE_PTR.value);
 form_route.label4.Caption:=self.rev;
 if form_route.ShowModal=mrok then
 begin
  edit2.Text:=form_route.Edit1.Text;
  label56.Caption:=form_route.Label2.Caption;
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
  dm.ads279.Edit;
  dm.ads279PARAMETER_VALUE.Value:=formatfloat('0.00000000',dm.AQY0025unit_sq.Value);
  dm.ads279.Post;
  dm.ads279.First;
 end;

if find_spec_rkey('LY') then //层数
 begin
  dm.ads279.Edit;
  dm.ads279PARAMETER_VALUE.Value:=dm.AQY0025LAYERS.AsString;
  dm.ads279.Post;
  dm.ads279.First;
 end;

if find_spec_rkey('SU') then //出货单位
 begin
  dm.ads279.Edit;
  dm.ads279PARAMETER_VALUE.Value:=dm.AQY0025SO_UNIT.AsString;
  dm.ads279.Post;
  dm.ads279.First;
 end;

if find_spec_rkey('DZ') then //单元尺寸
 begin
  dm.ads279.Edit;
  dm.ads279PARAMETER_VALUE.Value:=dm.AQY0025pcs_lngth.AsString
                                       +'mm X '+dm.AQY0025pcs_width.AsString+'mm';
  dm.ads279.Post;
  dm.ads279.First;
 end;

if find_spec_rkey('JN') then //交货单元数
 begin
  dm.ads279.Edit;
  dm.ads279PARAMETER_VALUE.Value:=dm.AQY0025set_qty.AsString;
  dm.ads279.Post;
  dm.ads279.First;
 end;

if find_spec_rkey('U') then //大料规格
 begin
  dm.ads279.Edit;
  dm.ads279PARAMETER_VALUE.Value:=dm.AQY0025ANALYSIS_CODE_3.Value;
  dm.ads279.Post;
  dm.ads279.First;
 end;

  if dm.ads502TOTAL_PNLS_1.Value>0 then
  begin
   if find_spec_rkey('P') then //大料总PCS
   begin
    dm.ads279.Edit;
    dm.ads279PARAMETER_VALUE.Value:=inttostr(
                       (dm.ads502TOTAL_PNLS_1.Value*dm.ads502UPANEL.Value+
                       dm.ads502TOTAL_PNLS_2.Value*dm.ads502UPANEL_2.Value)*
                       dm.ads502UNIT_NUM.Value); //每张大料实际开PCS数
    dm.ads279.Post;
    dm.ads279.First;
   end;

   if find_spec_rkey('5') then //大料利用率
   begin
    dm.ads279.Edit;
    dm.ads279PARAMETER_VALUE.Value:=dm.ads502TUSAGE.AsString;
    dm.ads279.Post;
    dm.ads279.First;
   end;
  end;

  if find_spec_rkey('1') then //PNLA拼版数
   begin
    dm.ads279.Edit;
    dm.ads279PARAMETER_VALUE.Value:=dm.ads502TOTAL_PNLS_1.AsString;
    dm.ads279.Post;
    dm.ads279.First;
   end;

  if find_spec_rkey('3') then //pnla单元数 (PCS数量)
   begin
    dm.ads279.Edit;
    dm.ads279PARAMETER_VALUE.Value:=inttostr(dm.ads502UPANEL.value*
                                           dm.ads502UNIT_NUM.Value);
    dm.ads279.Post;
    dm.ads279.First;
   end;

  if find_spec_rkey('6') then
   begin
    dm.ads279.Edit;
    dm.ads279PARAMETER_VALUE.Value:=
            DM.ads502PNL_LEN.AsString;       //PNLA长度
    dm.ads279.Post;
    dm.ads279.First;
   end;

  if find_spec_rkey('7') then
   begin
    dm.ads279.Edit;
    dm.ads279PARAMETER_VALUE.Value:=
            DM.ads502PNL_WTH.AsString;       //PNLA宽
    dm.ads279.Post;
    dm.ads279.First;
   end;

  if find_spec_rkey('H') then//PNLA尺寸字符
   begin
    dm.ads279.Edit;
    dm.ads279PARAMETER_VALUE.Value:= DM.ads502PNL_LEN.AsString+
     'mm X '+DM.ads502PNL_WTH.AsString+'mm';
    dm.ads279.Post;
    dm.ads279.First;
   end;

  if find_spec_rkey('2') then //PNLB 拼版数
   begin
    dm.ads279.Edit;
    if dm.ads502TOTAL_PNLS_2.Value > 0 then
     dm.ads279PARAMETER_VALUE.Value:=dm.ads502TOTAL_PNLS_2.AsString
    else
     dm.ads279PARAMETER_VALUE.Value:='';
    dm.ads279.Post;
    dm.ads279.First;
   end;

   if find_spec_rkey('4') then //PNLB 单元数
   begin
    dm.ads279.Edit;
    if dm.ads502UPANEL_2.Value > 0 then
     dm.ads279PARAMETER_VALUE.Value:=inttostr(dm.ads502UPANEL_2.Value*
                                     dm.ads502UNIT_NUM.Value)
    else
     dm.ads279PARAMETER_VALUE.Value:='';
    dm.ads279.Post;
    dm.ads279.First;
   end;

   if find_spec_rkey('8') then
   begin
    dm.ads279.Edit;
    if DM.ads502PNL_LEN_2.Value > 0 then
     dm.ads279PARAMETER_VALUE.Value:=DM.ads502PNL_LEN_2.AsString   //PNLB 长度
    else
     dm.ads279PARAMETER_VALUE.Value:='';
    dm.ads279.Post;
    dm.ads279.First;
   end;

   if find_spec_rkey('9') then
   begin
    dm.ads279.Edit;
    if DM.ads502PNL_WTH_2.Value > 0 then
     dm.ads279PARAMETER_VALUE.Value:=DM.ads502PNL_WTH_2.AsString   //PNLB 宽
    else
     dm.ads279PARAMETER_VALUE.Value:='';
    dm.ads279.Post;
    dm.ads279.First;
   end;

   if find_spec_rkey('I') then//PNLB 尺寸字符
   begin
    dm.ads279.Edit;
    if DM.ads502PNL_LEN_2.Value > 0 then
    dm.ads279PARAMETER_VALUE.Value:= DM.ads502PNL_LEN_2.AsString+
      'mm X '+DM.ads502PNL_WTH_2.AsString+'mm'
    else
     dm.ads279PARAMETER_VALUE.Value:='';
    dm.ads279.Post;
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
begin
try
 form_deptcode:=tform_deptcode.Create(application);
 if form_deptcode.ShowModal=mrok then
  begin
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
   dm.ADS38.InsertRecord([dm.AQY0025RKEY.Value,
                          form_deptcode.ADOQuery1rkey.Value,
                          form_deptcode.ADOQuery1DEF_ROUT_INST.Value,
                          step_number,
                          _rev,
                          1]);
      dm.ADOQuery1.Close;   //=====不能改变adoquery1的语句
      dm.ADOQuery1.SQL.Text:=
'SELECT TOP 100 PERCENT PARAMETER_PTR, TValue, Doc_Flag, after_flag, formula,'+#13+
      'flow_spfc_flag, SEQ_NO'+#13+
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
                               dm.ADOQuery1.FieldValues['flow_spfc_flag']]);
       dm.ADOQuery1.Next;
      end;          //=======不能改变adoquery1的语句
   if not bitbtn11.Enabled then bitbtn11.Enabled:=true;
  end;
finally
 form_deptcode.Free;
end;
end;

procedure TForm2.BitBtn11Click(Sender: TObject);
begin
dm.ADOConnection1.BeginTrans;
try
 dm.AQY0025ANALYSIS_CODE_5.Value:=dm.AQY0025pcs_lngth.AsString+'mm X '+
                                  dm.AQY0025pcs_width.AsString+'mm';
 dm.AQY0025ANALYSIS_CODE_1.Value:=dm.AQY0025set_lngth.AsString+'mm X '+
                                  dm.AQY0025set_width.AsString+'mm';
 dm.AQY0025ANALYSIS_CODE_4.Value:=dm.AQY0025spell_lngth.AsString+'mm X '+
                                  dm.AQY0025spell_width.AsString+'mm';

 dm.ads502.UpdateBatch();
 dm.ads279.UpdateBatch();
 dm.ADS279_0.UpdateBatch();

 self.update_deptcode(dm.AQY0025RKEY.Value);   //38
 self.update_tecparameter(dm.AQY0025RKEY.Value);  //保存制程参数494
 self.update_IESparameter(dm.AQY0025RKEY.Value);  //保存IES选料参数  497
 if self.find_difficulty(dm.AQY0025RKEY.Value) then
  dm.AQY0025barcode_flag.Value:=1;

 if checkbox2.Checked then
  dm.AQY0025current_rev.Value:='Y'
 else
  dm.AQY0025current_rev.Value:='N';

 dm.AQY0025.Post;
 if_post:=true;
 self.update_drill(dm.AQY0025RKEY.Value);  //更新钻孔表
 if dm.AQY0025PARENT_PTR.Value=0  then       //顶层保存
 begin
  self.update_ecnlist(dm.AQY0025RKEY.Value); //更新ecn履历表
  self.update_filename;  //更新工程相关文档
  self.update_impedance(dm.AQY0025RKEY.Value);
 end;
 dm.ADOConnection1.CommitTrans;

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
begin
try
 form_deptcode:=tform_deptcode.Create(application);
 if form_deptcode.ShowModal=mrok then
  begin
   if form_deptcode.ADOQuery1ppc_status.Value=0 then
    _rev:=''
   else
    _rev:=self.rev;
   dm.ADS38.AppendRecord([dm.AQY0025RKEY.Value,
                          form_deptcode.ADOQuery1rkey.Value,
                          form_deptcode.ADOQuery1DEF_ROUT_INST.Value,
                          dm.ADS38.RecordCount+1,
                          _rev,
                          1]);
      dm.ADOQuery1.Close;   //=====不能改变adoquery1的语句
      dm.ADOQuery1.SQL.Text:=
'SELECT TOP 100 PERCENT PARAMETER_PTR, TValue, Doc_Flag, after_flag, formula,'+#13+
      'flow_spfc_flag, SEQ_NO'+#13+
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
                               dm.ADOQuery1.FieldValues['flow_spfc_flag']]);
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
begin
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
 if (chr(key)='D') and (ssCtrl in shift) and (stringgrid1.Row>1) and
    (status.Caption='0') then       //编辑状态
  begin
   stringgrid1.Cells[stringgrid1.col,stringgrid1.row]:=
   stringgrid1.Cells[stringgrid1.col,stringgrid1.row-1];
  end;

if (chr(key)='R') and (ssCtrl in shift) and (bitbtn7.Enabled) then
 n11click(sender);           //PCS计算单行孔数
if (chr(key)='A') and (ssCtrl in shift) and (bitbtn7.Enabled) then
 n12click(sender);           //PCS计算全部孔数

if (chr(key)='Y') and (ssCtrl in shift) and (bitbtn7.Enabled) then
 SET1Click(sender);           //set计算单行孔数
if (chr(key)='N') and (ssCtrl in shift) and (bitbtn7.Enabled) then
 SET2Click(sender);           //set计算全部孔数

if (chr(key)='T') and (ssCtrl in shift) and (bitbtn8.Enabled) then
 n13click(sender);          //孔数汇总
if (chr(key)='B') and (ssCtrl in shift) and (bitbtn8.Enabled) then
 n14click(sender);          //孔数公式汇总

if (key=187)  and (ssCtrl in shift) and (status.Caption='0') then
 N110click(sender);
if (key=189)  and (ssCtrl in shift) and (status.Caption='0') then
 N111click(sender);
end;

procedure TForm2.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
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
 dm.AQY0025pcs_sq.Value:=dm.AQY0025pcs_lngth.Value*
                         dm.AQY0025pcs_width.Value*0.000001;
end;

procedure TForm2.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
 rkey25.Caption:=inttostr(Pinteger(Node.data)^);
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
  '工程更改'+#13+
  '评审信息'+#13+
  '客户信息'+#13+
  'ECN履历表'+#13+
  '阻抗表'+#13+
  '工程档案';
  dbedit1.ReadOnly:=true;
 end
 else begin
  listbox1.Items.Text:=
  '产品信息'+#13+
  '拼版设计'+#13+
  '全局参数'+#13+
  '工艺流程'+#13+
  '层压结构'+#13+
  '钻咀表'+#13+
  '备注信息';
  dbedit1.ReadOnly:=false;
 end;
end;

procedure TForm2.PopupMenu4Popup(Sender: TObject);
var node:TTreeNode;
begin
 node:=treeview1.Selected;
 if node.Level=2 then
  begin
   n8.Enabled:=false;
   n9.Enabled:=true;
  end
 else
  begin
   n8.Enabled:=true;
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
  node:=treeview1.Selected;
  new(rkey0025);
  rkey0025^:=dm.AQY0025RKEY.Value;
  node:=treeview1.Items.AddChildObject
  (node,dm.AQY0025MANU_PART_NUMBER.Value,rkey0025); //增加顶层节点
  node.ImageIndex:=node.Level;  //为第一层节点定义图画
  node.SelectedIndex := node.Level;//为第一层节点定义选择之后的图画
  treeview1.Selected:=node;

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
  dm.AQY0025.Delete;

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
     edit2.Text:=fieldbyname('ENG_FLOW_NAME').AsString;
     label56.Caption:=fieldbyname('ENG_FLOW_DESC').AsString;
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
 infor:string;
begin
 if trim(dm.AQY0025MANU_PART_NUMBER.Value)='' then
 begin
  listbox1.ItemIndex:=0;
  notebook1.PageIndex:=listbox1.ItemIndex+1;
  messagedlg('本厂编号不允许为空!',mterror,[mbcancel],0);
  DBEDIT1.SetFocus;
  exit;
 end;
 
 if trim(dm.AQY0025MANU_PART_DESC.Value)='' then
 begin
  listbox1.ItemIndex:=0;
  notebook1.PageIndex:=listbox1.ItemIndex+1;
  messagedlg('客户型号不允许为空!',mterror,[mbcancel],0);
  DBEDIT2.SetFocus;
  exit;
 end;

 if dm.AQY0025PARENT_PTR.Value > 0 then  //内层
 begin
  if dm.AQY0025QTY_BOM.Value <= 0 then
  begin
   listbox1.ItemIndex:=0;
   notebook1.PageIndex:=listbox1.ItemIndex+1;
   messagedlg('压合比例输入有误!',mterror,[mbcancel],0);
   DBEDIT33.SetFocus;
   exit;
  end;

  if dm.AQY0025BOM_STEP.Value<=0 then
  begin
   listbox1.ItemIndex:=0;
   notebook1.PageIndex:=listbox1.ItemIndex+1;
   messagedlg('压合步骤输入有误!',mterror,[mbcancel],0);
   DBEDIT32.SetFocus;
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
   DBEDIT32.SetFocus;
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
  DBcombobox2.SetFocus;
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
  if (dm.ads494flow_spfc_flag.Value = 'Y') and
     (dm.ads494after_flag.Value <> 'Y') and       //不是后补参数
     (trim(dm.ads494PARAMETER_VALUE.Value) = '') then
  begin
   listbox1.ItemIndex := 3;
   notebook1.PageIndex := listbox1.ItemIndex+1;
   messagedlg('第'+DM.ads494step_number.AsString+'步制程参数为不允许为空的重要参数!',
           mterror,[mbcancel],0);
   dm.ADS38.Locate('step_number',dm.ads494step_number.Value,[]);
   dbgrid2.SetFocus;
   exit;
  end;
  dm.ads494.Next;
 end;
dm.ads494.First;

infor:='';
 if dm.AQY0025ttype.Value=0 then  //量产板才做防呆检查
  if self.find_setpnlmin(infor) then
   showmessage('产品:'+infor+'与本产品拼版尺寸相同或交货尺寸非常接近，建议增加工程防呆设计！');
if infor<>'' then
 begin
  infor:= '产品:'+infor+'与本产品拼版尺寸相同或交货尺寸非常接近，建议增加工程防呆设计!';
  clipboard.Clear;
  Clipboard.AsText:=infor;
 end;
 messagedlg('数据检查通过!',mtinformation,[mbok],0);
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
form_layersdata:=tform_layersdata.Create(application);
self.get_treedate(dm.AQY0025RKEY.Value,form_layersdata.TreeView1);
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
   dm.ADS279.Edit;
   dm.ads279PARAMETER_VALUE.Value:=dm.ADOQuery1.Fieldbyname('PARAMETER_VALUE').AsString;
   dm.ads279.Post;
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

procedure TForm2.SpeedButton6Click(Sender: TObject);
var modalok:boolean;
begin
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
    sql.Text:='SELECT SOURCE_PTR, DEPT_PTR, DEF_ROUT_INST, STEP_NUMBER,'+#13+
      'tooling_rev, OUTP_SPFC,tool_old_rev '+#13+
      'FROM Data0038'+#13+
      'WHERE source_ptr = '+form_product.adoquery1rkey.AsString+#13+
      'ORDER BY STEP_NUMBER';
    open;

    while not Eof do //函数中千万不能使用adoquery2
     begin
      dm.ADS38.AppendRecord([dm.AQY0025RKEY.Value,
                            fieldvalues['dept_ptr'],
                            fieldvalues['DEF_ROUT_INST'],
                            fieldvalues['STEP_NUMBER'],
                            fieldvalues['tooling_rev'],
                            fieldvalues['OUTP_SPFC'],
                            fieldvalues['tool_old_rev']]);
      Next;
     end;    //=======不能改变adoquery2的语句
   end;


  dm.ADOQuery1.Close;   //=====不能改变adoquery1的语句
  dm.ADOQuery1.SQL.Text:=
  'SELECT PARAMETER_PTR, PARAMETER_VALUE, custpart_ptr, step_number,'+#13+
  ' seq_no, Doc_Flag, after_flag, flow_spfc_flag'+#13+
  'FROM Data0494'+#13+
  'where custpart_ptr = '+form_product.adoquery1rkey.AsString+#13+
  'ORDER BY step_number,seq_no';
  dm.ADOQuery1.Open;

  while not dm.ADOQuery1.Eof do
  begin
   dm.ads494.AppendRecord([dm.ADOQuery1.FieldValues['PARAMETER_PTR'],
                           dm.ADOQuery1.Fieldbyname('PARAMETER_VALUE').AsString,
                           dm.AQY0025RKEY.Value,
                           dm.ADOQuery1.FieldValues['step_number'],
                           dm.ADOQuery1.FieldValues['SEQ_NO'],
                           dm.ADOQuery1.FieldValues['Doc_Flag'],
                           dm.ADOQuery1.FieldValues['after_flag'],
                           dm.ADOQuery1.FieldValues['flow_spfc_flag']]);
   dm.ADOQuery1.Next;
  end;          //=======不能改变adoquery1的语句

  dm.ADS38.First;
  dm.ads494.First;
 end;

 end;
 form_product.Free;
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
stringgrid1.Cells[9,stringgrid1.RowCount-1]:=inttostr(total_a);
if total_b>0 then
stringgrid1.Cells[10,stringgrid1.RowCount-1]:=inttostr(total_b);

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
    stringgrid1.Cells[9,strtoint(form_drcalc.Edit2.text)+1]:=inttostr(total_a);
   if total_b>0 then
    stringgrid1.Cells[10,strtoint(form_drcalc.Edit2.text)+1]:=inttostr(total_b);

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

function TForm2.find_setpnlmin(var nearsize_part:string): boolean;
begin
 with dm.ADOQuery5 do
 begin
  close;
  sql.Delete(sql.Count-2);  //注意sql的静态语句最后增加空行
  if dm.AQY0025PARENT_PTR.Value > 0 then
    sql.Insert(sql.Count-1,'and (PARENT_PTR <> '+dm.AQY0025PARENT_PTR.AsString+')')
  else sql.Insert(sql.Count-1,'and (PARENT_PTR is null)');

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

  First;
  while not Eof do
  begin
   nearsize_part:=nearsize_part+Fieldbyname('number').AsString+Fieldbyname('rev').AsString+' ';
   Next;
  end;
  if IsEmpty then result:=false
  else result:=true;
  Close;  //增加andy081030
 end;
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

   if not form_reportselect.CheckBox1.Checked then
    form_report.ppSubReport1.Visible:=false;
   if not form_reportselect.CheckBox2.Checked then
    form_report.ppSubReport2.Visible:=false;
   if not form_reportselect.CheckBox4.Checked then
    form_report.ppSubReport3.Visible:=false;
  end;

  form_report.ppReport1.Print;
  form_report.Free;
 end;
 form_reportselect.Free;
end;

procedure TForm2.ECN1Click(Sender: TObject);
begin
  Form_report1:=TForm_report1.Create(application);
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
      'flow_spfc_flag, SEQ_NO'+#13+
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
                               dm.ADOQuery1.FieldValues['flow_spfc_flag']]);
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
  if (ACol = 11 ) then
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
  if  stringgrid2.Row=1 then
   stringgrid2.Cells[1,stringgrid2.Row]:='A'
  else
   stringgrid2.Cells[1,stringgrid2.Row]:=self.get_drTrow2(stringgrid2.Row);
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
     (stringgrid2.Col<>11) then
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
 stringgrid2.Cells[11,stringgrid2.Row]:=combobox1.Text;
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
 IF ACOL=11 THEN
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
    load_xls_to_sgrid(OpenDialog1.FileName,stringgrid2);
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
var
  i:integer;
  mytextfile:textfile;
  s:string;
  Hole_information_1:THole_information;
begin
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
self.get_treedate(dm.AQY0025RKEY.Value,form_layersdata.TreeView1);
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

end.
