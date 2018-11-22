unit quote_detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, DBCtrls, Menus,
  Grids, DBGrids, DB, ADODB,math,jpeg, ExtDlgs;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    Label13: TLabel;
    Edit2: TEdit;
    BitBtn4: TBitBtn;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    Label15: TLabel;
    DBEdit13: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    Edit3: TEdit;
    BitBtn5: TBitBtn;
    Label18: TLabel;
    DBMemo1: TDBMemo;
    Label19: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    BitBtn6: TBitBtn;
    Label23: TLabel;
    Edit4: TEdit;
    BitBtn7: TBitBtn;
    Label24: TLabel;
    Label25: TLabel;
    BitBtn8: TBitBtn;
    Label26: TLabel;
    Edit5: TEdit;
    DBRadioGroup1: TDBRadioGroup;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel2: TPanel;
    DBMemo2: TDBMemo;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Panel4: TPanel;
    Panel5: TPanel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    Label32: TLabel;
    SpeedButton3: TSpeedButton;
    Label33: TLabel;
    Label34: TLabel;
    SGrid1: TStringGrid;
    SGrid2: TStringGrid;
    Panel6: TPanel;
    Panel8: TPanel;
    Edit6: TEdit;
    Label35: TLabel;
    BitBtn9: TBitBtn;
    Panel9: TPanel;
    Label36: TLabel;
    Edit7: TEdit;
    BitBtn10: TBitBtn;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    Panel7: TPanel;
    BitBtn12: TBitBtn;
    Panel10: TPanel;
    Label40: TLabel;
    ComboBox1: TComboBox;
    DBComboBox2: TDBComboBox;
    Label41: TLabel;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label42: TLabel;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    Label44: TLabel;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    Label45: TLabel;
    Label46: TLabel;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    Label47: TLabel;
    Label48: TLabel;
    DBEdit32: TDBEdit;
    Label49: TLabel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Label43: TLabel;
    Label50: TLabel;
    DBEdit33: TDBEdit;
    Label51: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Label52: TLabel;
    DBEdit34: TDBEdit;
    Edit17: TEdit;
    Panel11: TPanel;
    StringGrid1: TStringGrid;
    ComboBox2: TComboBox;
    PopupMenu2: TPopupMenu;
    N2: TMenuItem;
    PopupMenu3: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    Label53: TLabel;
    DBEdit35: TDBEdit;
    BitBtn11: TBitBtn;
    DBEdit36: TDBEdit;
    Label54: TLabel;
    DBComboBox1: TDBComboBox;
    ComboBox3: TComboBox;
    Label55: TLabel;
    Splitter2: TSplitter;
    Button1: TButton;
    Splitter3: TSplitter;
    Image1: TImage;
    aped_fg: TLabel;
    CheckBox1: TCheckBox;
    BitBtn13: TBitBtn;
    Button2: TButton;
    Button3: TButton;
    SavePictureDialog1: TSavePictureDialog;
    N5: TMenuItem;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    DBEdit37: TDBEdit;
    Label56: TLabel;
    DBEdit38: TDBEdit;
    Label57: TLabel;
    Label58: TLabel;
    DBEdit39: TDBEdit;
    Label59: TLabel;
    Timer1: TTimer;
    StringGrid2: TStringGrid;
    ComboBox4: TComboBox;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    ComboBox5: TComboBox;
    TabSheet5: TTabSheet;
    StringGrid3: TStringGrid;
    Button4: TButton;
    Panel12: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboBox2Change(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1Exit(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBEdit14Exit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Tab(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboBox3Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure DBEdit31KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit31Exit(Sender: TObject);
    procedure DBEdit32Exit(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBEdit27KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit19KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit17KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit31KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBEdit32KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn13Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBEdit20Exit(Sender: TObject);
    procedure DBEdit20KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit22Exit(Sender: TObject);
    procedure DBEdit21Exit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn14Click(Sender: TObject);
    procedure DBEdit19Exit(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure DBEdit37Exit(Sender: TObject);
    procedure DBEdit37KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit15Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure StringGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid2Exit(Sender: TObject);
    procedure StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox5Exit(Sender: TObject);
    procedure StringGrid3Exit(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBEdit18Exit(Sender: TObject);
    procedure DBEdit17Exit(Sender: TObject);
  private
    { Private declarations }
   v_close:byte; //是否正常退出(0非正常退出，1正常退出)
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
   procedure  get_value(rkey278:integer);
   function  get_cust_info(cust_code:string):boolean;
   function  get_custpart_info(custpartcode:string;cust_ptr:integer):boolean;
   function find_spec_rkey(spec_rkey:string):boolean;
   procedure get_tax(rkey10:integer);
   procedure get_technics(rkey346:integer);
   procedure append_data0431(rkey348:integer);
   procedure delete_data0431(rkey348:integer);
   function vertify2(vstring:string):string;
   function calTooling(vstr:string):string;
   procedure price_change();
   function invo_number_error(number: string): boolean;
   procedure update_tools432(rkey85:integer);
   procedure update_04(v_seed: string);
   procedure update_intvent(rkey85:integer);
   procedure update_technice(rkey85:integer);
   procedure get_intvent(rkey85:integer);
   procedure change_enable();
   procedure get_tools432(rkey85:integer);
   procedure update_511();
   procedure update_Cost8501(rkey85:integer);
   procedure get_Cost8501(rkey85:integer);
  public
    { Public declarations }
  end;

type
 TMyDBGrid=class(TDBGrid);

var
  Form2: TForm2;

implementation

uses damo, authflow_search, baseprice_search, curr_search, prodcode_search,
  quoteinvt_search, rep_search, customer_search, product_search,
  layer_frame, technics_search, common, main, pcbcut,//pcb_cutting,
  layersdata_select, Spell, spell2;

{$R *.dfm}

procedure TForm2.NewGridWnd(var Message: TMessage);
var IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else OldGridWnd(Message);
end;

function  TForm2.get_cust_info(cust_code:string):boolean;
begin
with dm.ADOQuery1 do
begin
 close;
 sql.Text:='SELECT data0010.rkey,Data0010.CUSTOMER_NAME, Data0010.BILLING_ADDRESS_1,'+#13+
      'Data0010.GEN_EMAIL_ADDRESS, Data0010.PHONE, Data0010.FAX,'+#13+
      'dbo.Data0010.CONTACT_NAME_1, dbo.Data0010.CONT_PHONE_1,'+#13+
      'dbo.Data0010.FED_TAX_ID_NO, dbo.Data0010.CURRENCY_PTR,'+#13+
      'dbo.Data0010.SALES_REP_PTR, dbo.Data0001.CURR_CODE,'+#13+
      'dbo.Data0001.CURR_NAME, dbo.Data0001.QTE_BASE_TO_OTHER,'+#13+
      'dbo.Data0005.EMPL_CODE as REP_CODE, dbo.Data0005.EMPLOYEE_NAME as SALES_REP_NAME,'+#13+
      'dbo.Data0010.EDI_FLAG_FOR_SOACK, dbo.Data0010.quote_factor,'+#13+
      'dbo.Data0010.SALES_DISCOUNT'+#13+
 'FROM dbo.Data0010 INNER JOIN'+#13+
      'dbo.Data0001 ON dbo.Data0010.CURRENCY_PTR = dbo.Data0001.RKEY INNER JOIN'+#13+
      'dbo.Data0005 ON dbo.Data0010.SALES_REP_PTR = dbo.Data0005.RKEY'+#13+
 'WHERE data0010.cust_code='''+cust_code+'''';
 open;
 if isempty then
  result:=false
 else result:=true;
end;
end;

function  TForm2.get_custpart_info(custpartcode:string;cust_ptr:integer):boolean;
begin
with dm.ADOQuery1 do
begin
 close;
 if cust_ptr=0 then       //等于0就是没有确定客户
 sql.Text:='SELECT Data0010.CUST_CODE, Data0025.RKEY AS rkey25,'+#13+
      'Data0025.PROD_CODE_PTR, Data0008.PROD_CODE,'+#13+
      'Data0008.PRODUCT_NAME,Data0025.MANU_PART_DESC,'+#13+
      'Data0025.ANALYSIS_CODE_2,data0025.EST_SCRAP,'+#13+
      'Data0025.spell_lngth,Data0025.spell_width,Data0025.spell_qty'+#13+
      'FROM dbo.Data0025 INNER JOIN'+#13+
      'dbo.Data0008 ON'+#13+
      'dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN'+#13+
      'dbo.Data0010 ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY'+#13+
      'WHERE (Data0025.PARENT_PTR is null) and'+#13+
      'Data0025.MANU_PART_NUMBER='''+custpartcode+''''
 else
  sql.Text:='SELECT Data0025.RKEY AS rkey25,Data0025.PROD_CODE_PTR,'+#13+
      'Data0008.PROD_CODE,Data0008.PRODUCT_NAME,data0025.EST_SCRAP,'+#13+
      'Data0025.MANU_PART_DESC,Data0025.ANALYSIS_CODE_2,'+#13+
      'Data0025.spell_lngth,Data0025.spell_width,Data0025.spell_qty'+#13+
      'FROM dbo.Data0025 INNER JOIN'+#13+
      'dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY'+#13+
      'WHERE Data0025.PARENT_PTR is null and'+#13+
       'data0025.CUSTOMER_PTR='+INTTOSTR(cust_ptr)+#13+
       'and Data0025.MANU_PART_NUMBER='''+custpartcode+'''';
 open;
 if isempty then
  result:=false
 else result:=true;
end;
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

procedure TForm2.Tab(Sender: TObject; var Key: Word; Shift: TShiftState);
Begin
  if (key=VK_Down) or (key=13) then
   SelectNext(ActiveControl,True,True);
  if key=VK_Up then
   SelectNext(ActiveControl,False,True);
  Key:=0;
end;

procedure TForm2.get_tax(rkey10: integer);
begin
 dbcombobox2.Items.Clear;
 with dm.ADOQuery1 do
 begin
   close;
   sql.Text:='SELECT dbo.Data0189.STATE_TAX'+#13+
        'FROM dbo.Data0012 INNER JOIN'+#13+
        'dbo.Data0189 ON dbo.Data0012.SHIP_CTAX_PTR = dbo.Data0189.RKEY'+#13+
        'where data0012.CUSTOMER_PTR='+inttostr(rkey10);
   open;
   while not eof do
   begin
    dbcombobox2.Items.Add(fieldbyname('STATE_TAX').AsString);
    next;
   end;
   dbcombobox2.ItemIndex:=0;
   dm.ADSA85vatax.AsString:=dbcombobox2.Text;
 end;
end;

procedure TForm2.append_data0431(rkey348: integer);
begin
 with dm.ADOQuery2 do
 begin
  close;
  sql.Text:='select data0430.UNIT_PTR from data0430 INNER JOIN '+
  'Data0278 ON Data0430.UNIT_PTR = Data0278.RKEY '+
  'where data0430.SOURCE_PTR='+inttostr(rkey348)+
  ' ORDER BY dbo.Data0278.SEQUENCE_NO';
  open;
  while not eof do
  begin
   if not dm.ads431.Locate('unit_ptr',fieldvalues['unit_ptr'],[]) then
   begin
    dm.ads431.Append;
    dm.ads431QTE_PTR.Value := dm.ADSA85RKEY.Value;
    dm.ads431UNIT_PTR.Value := fieldvalues['unit_ptr'];
    dm.ads431ttype.Value:=1;
    dm.ads431.Post;
   end
   else begin
    dm.ads431.Edit;
    dm.ads431ttype.Value:=dm.ads431ttype.Value+1;
    dm.ads431.Post;
   end;
   next;
  end;
 end;
end;

procedure TForm2.get_technics(rkey346:integer);
var i:integer;
begin
// for i:= 1 to sgrid2.RowCount-1 do
//  sgrid2.Rows[i].Clear;
// sgrid2.RowCount:=2;
// dm.ads431.First;
// while not dm.ads431.Eof do
// if (trim(dm.ads431SPEC_RKEY.Value)<>'5') and
//    (trim(dm.ads431SPEC_RKEY.Value)<>'P') and
//    (trim(dm.ads431SPEC_RKEY.Value)<>'WB') and
//    (trim(dm.ads431SPEC_RKEY.Value)<>'WA') and
//    (trim(dm.ads431SPEC_RKEY.Value)<>'JN') then
//  dm.ads431.Delete
// else
 for i:= 1 to sgrid2.RowCount-1 do
  sgrid2.Rows[i].Clear;
 sgrid2.RowCount:=2;
 dm.ads431.First;
 while not dm.ads431.Eof do
 if (trim(dm.ads431QUOTE_FLAG.Value)<>'1') then
  dm.ads431.Delete
 else
  begin
   dm.ads431.Edit;
   dm.ads431ttype.Value:=0;
   dm.ads431.Post;
   dm.ads431.Next;
  end;
with dm.ADOQuery1 do
begin
 close;
 sql.Text:='SELECT TOP 100 PERCENT Data0351.seq_no, Data0348.ADDER_NAME,'+#13+
      'case Data0348.PCENTS when 0 then ''金额'' else ''基价百份比'''+#13+
      ' end as cac_meoth,Data0348.FORMULA, Data0348.MIN_VALUE,data0348.rate_margin,'+#13+
      'Data0348.MAX_VALUE, Data0351.D0348_PTR'+#13+
      'FROM dbo.Data0348 INNER JOIN'+#13+
      'dbo.Data0351 ON dbo.Data0348.RKEY = dbo.Data0351.D0348_PTR'+#13+
      'WHERE Data0351.D0346_PTR = '+inttostr(rkey346)+#13+
      'and data0348.ActiveFlag=1' +#13+    //只选择有效的工艺计算公式
      'ORDER BY dbo.Data0351.seq_no';
 open;
 while not eof do
 begin
  sgrid2.Cells[0,sgrid2.RowCount-1] := inttostr(sgrid2.RowCount-1);
  sgrid2.Cells[1,sgrid2.RowCount-1] := fieldbyname('ADDER_NAME').AsString;
  sgrid2.Cells[2,sgrid2.RowCount-1] := fieldbyname('cac_meoth').AsString;// '计价模式';
  sgrid2.Cells[3,sgrid2.RowCount-1] := '0';//PCS成本
  sgrid2.Cells[4,sgrid2.RowCount-1] := '0';//平米成本
  sgrid2.Cells[5,sgrid2.RowCount-1] := fieldbyname('FORMULA').AsString; //'公式';
  sgrid2.Cells[6,sgrid2.RowCount-1] := fieldbyname('MIN_VALUE').AsString; //'最小值';
  sgrid2.Cells[7,sgrid2.RowCount-1] := fieldbyname('MAX_VALUE').AsString; //'最大值';
  sgrid2.Cells[8,sgrid2.RowCount-1] := fieldbyname('D0348_PTR').AsString; //'工艺标识';

  sgrid2.Cells[9,sgrid2.RowCount-1] := fieldbyname('rate_margin').AsString;//'财务毛利率';
  sgrid2.Cells[10,sgrid2.RowCount-1] := '0'; //'PCS财务成本';

  sgrid2.RowCount:=sgrid2.RowCount+1;
  self.append_data0431(fieldvalues['D0348_PTR']);
  next;
 end;
end;
end;

procedure TForm2.delete_data0431(rkey348: integer);
begin
with dm.ADOQuery1 do
begin
 close;
 sql.Text:='select UNIT_PTR from data0430'+#13+
           'where SOURCE_PTR='+inttostr(rkey348);
 open;
 while not eof do
 begin
  if (dm.ads431.Locate('unit_ptr',fieldvalues['unit_ptr'],[])) and
    (dm.ads431ttype.Value=1) and
    (trim(dm.ads431QUOTE_FLAG.Value)<>'1') then
//    (trim(dm.ads431SPEC_RKEY.Value)<>'5') and
//    (trim(dm.ads431SPEC_RKEY.Value)<>'P') and
//    (trim(dm.ads431SPEC_RKEY.Value)<>'WB') and
//    (trim(dm.ads431SPEC_RKEY.Value)<>'WA') and
//    (trim(dm.ads431SPEC_RKEY.Value)<>'JN') then
   dm.ads431.Delete
  else
   if (dm.ads431.Locate('unit_ptr',fieldvalues['unit_ptr'],[])) then
   begin
    dm.ads431.Edit;
    dm.ads431ttype.Value:=dm.ads431ttype.Value-1;
    dm.ads431.Post;
   end;
  next;
 end;
end;
end;

function TForm2.find_spec_rkey(spec_rkey: string): boolean;
begin
result:=false;
dm.ads431.First;
while not dm.ads431.Eof do
 begin
  if trim(dm.ads431SPEC_RKEY.Value)=spec_rkey then
   begin
    result:=true;
    break;
   end;
  dm.ads431.Next;
 end;
end;

function TForm2.vertify2(vstring:string):string;
var
  i,j,j0,j1:integer;
begin
 vstring:=' '+vstring+' ';
 while POS('IF(',vstring)>0 do
 begin
  i:=POS('IF(',vstring);
  j:=POS(',',vstring);
  j0:=POS(',',copy(vstring,j+1,length(vstring)-j));
  j1:=POS(')',copy(vstring,j+j0+1,length(vstring)-j-j0));
  try    //检验IF（条件，返回值1，返回值2）函数的条件表达式是否合法
   with dm.ADOQuery2 do
    begin
      close;
      sql.clear;
      sql.add('select 1 as true_or_false where '+copy(vstring,i+3,j-i-3));
      open;
    end;
  except
    exit;
  end;

  if not dm.ADOQuery2.IsEmpty then
   begin
    try    //检验IF（条件，返回值1，返回值2）函数的返回值1是否有效
      with dm.ADOQuery2 do
      begin
        close;
        sql.clear;
        sql.add('SELECT convert(float,1*('+copy(vstring,j+1,j0-1)+')) as vqty ');
        open;
      end;
    except
      exit;
    end;
   end
  else
   begin
    try    //检验IF（条件，返回值1，返回值2）函数的返回值2是否有效
      with dm.ADOQuery2 do
      begin
        close;
        sql.clear;
        sql.add('SELECT convert(float,1*('+copy(vstring,j+j0+1,j1-1)+')) as vqty ');
        open;
      end;
    except
      exit;
    end;
   end;

   vstring:=copy(vstring,1,i-1)+dm.ADOQuery2.fieldbyname('vqty').asstring+
            copy(vstring,j+j0+j1+1,length(vstring)-j-j0-j1);

  end;
  result:='SELECT convert(float,'+vstring+') as vqty';
end;

function TForm2.calTooling(vstr:string):string;
var
  j,j0,j1,j2:integer;
  vstring,vstring1,vstring2:string;
  vcol,vrow,vptr:string;
  vresult:string;
begin
  vstring:=vstr;
  dm.ads431.First;
  while not dm.ads431.eof do
  begin
   while pos(' '+trim(dm.ads431PARAMETER_NAME.Value)+' ',vstring)>0 do //如果一个参数出现了多次就通过这个循环逐一代换
    begin
      j:=pos(' '+trim(dm.ads431PARAMETER_NAME.Value)+' ',vstring);
      vstring1:=copy(vstring,1,j-1);
      vstring2:=copy(vstring,j+2+length(trim(dm.ads431PARAMETER_NAME.Value)),
                           500-j-length(trim(dm.ads431PARAMETER_NAME.Value)));
      IF dm.ads431DATA_TYPE.value=1 then    //代表数值型变量
       if pos('.',trim(dm.ads431UNIT_VALUE.Value))>0 then
        vstring:=vstring1+' '+trim(dm.ads431UNIT_VALUE.Value)+' '+vstring2
       else
        vstring:=vstring1+' '+trim(dm.ads431UNIT_VALUE.Value)+'.0000000'+' '+vstring2
      else     //字符型
        vstring:=vstring1+' '''+trim(dm.ads431UNIT_VALUE.Value)+''' '+vstring2;
    end;
   dm.ads431.Next;
  end;


  if dm.aq280.Active =false then dm.aq280.Open ;  //工程表单
  dm.aq280.first;
  while not dm.AQ280.Eof do
   begin
    while pos(trim(dm.AQ280ENG_TABLE_NAME.Value)+'(',vstring)>0 do
     begin //如果一个参数出现了多次就通过这个循环逐一代换
      j:=pos(trim(dm.AQ280ENG_TABLE_NAME.Value)+'(',vstring);
      j0:=pos('(',copy(vstring,j,length(vstring)-j));
      j1:=pos(',',copy(vstring,j,length(vstring)-j));
      j2:=pos(')',copy(vstring,j,length(vstring)-j));
      vstring1:=copy(vstring,1,j-1);
      vstring2:=copy(vstring,j+j2,500-j-j2);

      vptr:=DM.AQ280RKEY.AsString;
      vrow:=copy(vstring,j+j0,j1-j0-1); //函数X变量
      vcol:=copy(vstring,j+j1,j2-j1-1); //函数Y变量

      with dm.ADOStoredProc1 do //读取所在的行号
       begin
        close;
        parameters.ParamByName('@vptr').Value :=strtoint(vptr); //280.RKEY
        parameters.ParamByName('@vtpx').Value :=DM.AQ280fx_type.Value; //x方向变量类型
        parameters.ParamByName('@vtpy').Value :=DM.AQ280fy_type.Value; //Y方向变量类型
        if dm.AQ280fx_type.Value=1 then //数字类型
         begin
          parameters.ParamByName('@vcol').Value :=strtofloat(vrow);
          parameters.ParamByName('@vcol0').Value :='';
         end
        else
         begin
          parameters.ParamByName('@vcol').Value := 0;
          parameters.ParamByName('@vcol0').Value := trim(vrow);
         end;
        if dm.AQ280fy_type.Value=1 then //数字类型
         begin
          parameters.ParamByName('@vrow').Value :=strtofloat(vcol);
          parameters.ParamByName('@vrow0').Value :='';
         end
        else
         begin
          parameters.ParamByName('@vrow').Value := 0;
          parameters.ParamByName('@vrow0').Value := trim(vcol);
         end;
        prepared;
        open;
        vresult:=trim(dm.ADOStoredProc1tvalue.Value);
       end;

      if dm.AQ280DATA_TYPE.Value=1 then
       if pos('.',vresult)>0 then
         vstring:=vstring1+vresult+vstring2
       else
         vstring:=vstring1+' '+vresult+'.000000'+' '+vstring2
      else
        vstring:=vstring1+' '''+vresult+''' '+vstring2;
     end;
   dm.AQ280.Next;
  end;
  dm.AQ280.Close;
  dm.ADOStoredProc1.Close;

  if POS('IF(',vstring)>0 then
    result:=vertify2(vstring)
  else
    result:='SELECT convert(float,'+vstring+') as vqty';
end;

procedure TForm2.price_change();
begin
  dm.ADSA85QTE_UNITS.Value:=roundto(dm.ADSA85quote_price.Value*  //实际本币报价,不含税
                                    dm.ADSA85CURR_RATE.Value,-6);
  dm.ADSA85comm_cost.Value:=dm.ADSA85QTE_UNITS.Value*  //折扣金额
                            dm.ADSA85SALES_DISCOUNT.Value*0.01;

  dm.ADSA85SHIPPING_CHARGE.Value:=dm.ADSA85total_cost.Value+   //折让金额
                                  dm.ADSA85CRP_EST_QUANTITY.Value-
                                  dm.ADSA85QTE_UNITS.Value+
                                  dm.ADSA85comm_cost.Value;

 dm.ADSA85rate_margin.Value:=ExRoundTo(((dm.ADSA85QTE_UNITS.Value*(1-dm.ADSA85SALES_DISCOUNT.Value*0.01)-
                             dm.ADSA85total_cost.Value*(1+dm.ADSA85CUST_QTE_FACTOR.Value*0.01))/
                             dm.ADSA85QTE_UNITS.Value)*100,2);    //毛利率
 dm.ADSA85MARKUP.Value:=ExRoundTo(((dm.ADSA85QTE_UNITS.Value*(1-dm.ADSA85SALES_DISCOUNT.Value*0.01)-
                             dm.ADSA85total_N_cost.Value*(1+dm.ADSA85CUST_QTE_FACTOR.Value*0.01))/
                             dm.ADSA85QTE_UNITS.Value)*100,2);    //财务毛利
if combobox1.ItemIndex=0 then    //pcs报价
 begin
  if dm.qte_type=1 then  //基价折让
  begin
    edit13.Text:=formatfloat('0.000000',dm.ADSA85comm_cost.value*dm.ADSA85USHEET.Value);
    edit14.Text:=formatfloat('0.000000',dm.ADSA85SHIPPING_CHARGE.value*dm.ADSA85USHEET.Value);
    edit15.Text:=formatfloat('0.000000',dm.ADSA85QTE_UNITS.value*dm.ADSA85USHEET.Value);
    edit16.Text:=formatfloat('0.000000',dm.ADSA85quote_price.value*dm.ADSA85USHEET.Value);
    edit17.Text:=formatfloat('0.000000',dm.ADSA85quote_taxprice.value*dm.ADSA85USHEET.Value);
  end
  else                   //总价折让
  begin
    edit13.Text:=formatfloat('0.000000',dm.ADSA85comm_cost.value*dm.ADSA85TUNITS.Value/
                              (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
    edit14.Text:=formatfloat('0.000000',dm.ADSA85SHIPPING_CHARGE.value*dm.ADSA85TUNITS.Value/
                              (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
    edit15.Text:=formatfloat('0.000000',dm.ADSA85QTE_UNITS.value*dm.ADSA85TUNITS.Value/
                              (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
    edit16.Text:=formatfloat('0.000000',dm.ADSA85quote_price.value*dm.ADSA85TUNITS.Value/
                              (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
    edit17.Text:=formatfloat('0.000000',dm.ADSA85quote_taxprice.value*dm.ADSA85TUNITS.Value/
                              (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
  end;

 end
else             //SET报价
 begin
  if dm.qte_type=1 then
  begin
   edit13.Text:=formatfloat('0.000000',dm.ADSA85comm_cost.value*dm.ADSA85USHEET.Value/
                                     dm.ADSA85TUNITS.Value);
   edit14.Text:=formatfloat('0.000000',dm.ADSA85SHIPPING_CHARGE.value*dm.ADSA85USHEET.Value/
                                     dm.ADSA85TUNITS.Value);
   edit15.Text:=formatfloat('0.000000',dm.ADSA85QTE_UNITS.value*dm.ADSA85USHEET.Value/
                                     dm.ADSA85TUNITS.Value);
   edit16.Text:=formatfloat('0.000000',dm.ADSA85quote_price.value*dm.ADSA85USHEET.Value/
                                     dm.ADSA85TUNITS.Value);
   edit17.Text:=formatfloat('0.000000',dm.ADSA85quote_taxprice.value*dm.ADSA85USHEET.Value/
                                     dm.ADSA85TUNITS.Value);
  end
  else
   begin
    edit13.Text:=formatfloat('0.000000',dm.ADSA85comm_cost.value/
                                      (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
    edit14.Text:=formatfloat('0.000000',dm.ADSA85SHIPPING_CHARGE.value/
                                      (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
    edit15.Text:=formatfloat('0.000000',dm.ADSA85QTE_UNITS.value/
                                      (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
    edit16.Text:=formatfloat('0.000000',dm.ADSA85quote_price.value/
                                      (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
    edit17.Text:=formatfloat('0.000000',dm.ADSA85quote_taxprice.value/
                                      (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
   end;
 end;
end;

function TForm2.invo_number_error(number: string): boolean;
begin
result:=false;
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0085');
  sql.Add('where TNUMBER='''+number+'''');
  open;
  if not IsEmpty then  result:=true;
 end;
end;

procedure TForm2.update_tools432(rkey85:integer);
var
 i:byte;
begin
 with dm.ads432 do
  begin
   close;
   Parameters[0].Value:=rkey85;
   open;
  end;
 while not dm.ads432.Eof do dm.ads432.Delete;
 for i:=1 to stringgrid1.RowCount-2 do
  if (strtocurr(stringgrid1.Cells[1,i])>0) or
     (strtocurr(stringgrid1.Cells[2,i])>0) then
   begin
    dm.ads432.Append;
    dm.ads432QTE_PTR.Value:=rkey85;
    dm.ads432ADDL_CAT_PTR.AsString:=stringgrid1.Cells[4,i];
    dm.ads432AMOUNT.AsString:=stringgrid1.Cells[1,i];
    dm.ads432FREE_AMOUNT.AsString:=stringgrid1.Cells[2,i];
    dm.ads432TAX_FLAG.Value:=stringgrid1.Cells[3,i];
    dm.ads432Mould_set.AsString :=stringgrid1.Cells[5,i];
    dm.ads432.Post;
   end;
end;

procedure TForm2.update_Cost8501(rkey85:integer);
var
 i:byte;
begin
 with dm.ADO8501 do
  begin
   close;
   Parameters[0].Value:=rkey85;
   open;
  end;
 while not dm.ADO8501.Eof do dm.ADO8501.Delete;
 for i:=1 to stringgrid2.RowCount do
  if (strtocurr(stringgrid2.Cells[1,i])>0) or
     (strtocurr(stringgrid2.Cells[2,i])>0) then
   begin
    dm.ADO8501.Append;
    dm.ADO8501D0085_Ptr.Value:=rkey85;
    dm.ADO8501Cost_Name.AsString:=stringgrid2.Cells[0,i];
    dm.ADO8501Cost.AsString:=stringgrid2.Cells[1,i];
    dm.ADO8501Total_Cost.AsString:=stringgrid2.Cells[2,i];
    dm.ADO8501Flag_tax.AsString :=stringgrid2.Cells[3,i];
    dm.ADO8501.Post;
   end;
end;


procedure TForm2.update_04(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin
 v_length := length(v_seed);
 for i := v_length downto 1 do
  if not (v_seed[i] in ['0'..'9']) then   //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.ado04.Edit; //使前缀不变后缀加1
    dm.ado04SEED_VALUE.Value := new_seed;
    dm.ado04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.ado04.Edit;
     dm.ado04SEED_VALUE.Value := new_seed;
     dm.ado04.Post;
    end;
end;

procedure TForm2.update_intvent(rkey85: integer);
var
 i:integer;
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='SELECT QUOTE_PTR, STD_INVENT_PTR, D0028_PTR, QTY, price, D0028_PRICE,'+#13+
            'QTY_BOM'+#13+
            ' FROM Data0253 where QUOTE_PTR='+inttostr(rkey85);
  open;
  while not eof do delete;
  for i:=1 to sgrid1.RowCount-2 do
   AppendRecord([rkey85,       //材料保存
                strtoint(sgrid1.Cells[9,i]),
                strtoint(sgrid1.Cells[8,i]),
                strtofloat(sgrid1.Cells[5,i]),
                strtofloat(sgrid1.Cells[4,i]), //本币价格
                strtofloat(sgrid1.Cells[7,i]), //原币价格
                strtofloat(sgrid1.Cells[10,i])  //压合比例
                ]);
 end;
end;

procedure TForm2.update_technice(rkey85: integer);
var
 i:integer;
begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='SELECT QTE_PTR, SOURCE_PTR, AMOUNT,FREE_AMOUNT'+#13+
               'FROM Data0432 where QTE_PTR='+inttostr(rkey85);
    open;
    while not eof do delete;
    for i:=1 to sgrid2.RowCount-2 do
     AppendRecord([rkey85,       //特别工艺保存
                  strtoint(sgrid2.Cells[8,i]),
                  strtofloat(sgrid2.Cells[3,i]),
                  strtofloat(sgrid2.Cells[10,i])
                      ]);
   end;

end;

procedure TForm2.get_intvent(rkey85:integer);
var
 sql_text:string;
 i:integer;
begin
sql_text:='SELECT Data0253.STD_INVENT_PTR, Data0253.D0028_PTR, '+#13+
      'Data0253.QTY,Data0253.price, Data0253.D0028_PRICE,'+#13+
      'dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_DESCRIPTION,'+#13+
      'Data0023.ABBR_NAME, Data0002.UNIT_NAME,data0253.QTY_BOM,'+#13+
      'ROUND(Data0253.QTY * Data0253.price, 6) AS pcs_cost, dbo.Data0496.RKEY AS RKEY496 '+#13+
      'FROM dbo.Data0253 INNER JOIN'+#13+
      'dbo.Data0017 ON'+#13+
      'dbo.Data0253.STD_INVENT_PTR = dbo.Data0017.RKEY INNER JOIN'+#13+
      'dbo.Data0028 ON dbo.Data0253.D0028_PTR = dbo.Data0028.RKEY INNER JOIN'+#13+
      'dbo.Data0023 ON dbo.Data0028.SUPPLIER_PTR = dbo.Data0023.RKEY INNER JOIN'+#13+
      'dbo.Data0002 ON dbo.Data0028.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY  INNER JOIN ' +#13+
      '                dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY '+#13+
      'where data0253.quote_ptr='+inttostr(rkey85);
  OpenQuery(dm.ADOQuery1,sql_text);
  sgrid1.RowCount:=dm.ADOQuery1.RecordCount+2;
  for i:=1 to dm.ADOQuery1.RecordCount do
  begin
   sgrid1.Cells[0,i] :=dm.adoquery1.FieldValues['INV_PART_NUMBER'];
   sgrid1.Cells[1,i] :=dm.adoquery1.FieldValues['INV_DESCRIPTION'];
   sgrid1.Cells[2,i] :=dm.adoquery1.FieldValues['ABBR_NAME'];
   sgrid1.Cells[3,i] :=dm.adoquery1.FieldValues['UNIT_NAME'];
   sgrid1.Cells[4,i] :=dm.adoquery1.fieldbyname('price').AsString;  //本币
   sgrid1.Cells[7,i] :=dm.adoquery1.fieldbyname('D0028_PRICE').AsString;  //原币
   sgrid1.Cells[5,i] :=dm.adoquery1.fieldbyname('QTY').AsString; //'PCS用量';
   sgrid1.Cells[6,i] :=dm.adoquery1.fieldbyname('pcs_cost').AsString; //'PCS成本';
   sgrid1.Cells[8,i] :=dm.adoquery1.FieldValues['D0028_PTR']; //'价格标识';
   sgrid1.Cells[9,i] :=dm.adoquery1.FieldValues['STD_INVENT_PTR']; //'材料标识';
   sgrid1.Cells[10,i] :=dm.adoquery1.fieldbyname('QTY_bom').AsString; //压合比例
      if dm.adoquery1.fieldbyname('RKEY496').AsInteger in [2,30] then
      sgrid1.Cells[11,i] :='主材'
    else
      sgrid1.Cells[11,i] :='辅材';
   dm.ADOQuery1.Next;
  end;      

sql_text:='SELECT dbo.Data0348.ADDER_NAME, dbo.Data0432.SOURCE_PTR,'+#13+
      'dbo.Data0432.AMOUNT, dbo.Data0348.FORMULA, dbo.Data0348.MIN_VALUE,'+#13+
      'dbo.Data0348.MAX_VALUE,data0432.FREE_AMOUNT,'+#13+
      'round(data0432.amount*data0085.usheet,6) as cost_m2,'+#13+
      'round(data0432.amount*data0085.TUNITS/(data0085.UNIT_LEN*data0085.UNIT_WTH*0.000001),6) as cost_total_m2,'+#13+
      'case Data0348.PCENTS when 0 then ''金额'' else ''基价百份比'''+#13+
      ' end as cac_meoth,data0348.rate_margin'+#13+
       'FROM dbo.Data0432 INNER JOIN'+#13+
      'Data0348 ON Data0432.SOURCE_PTR = Data0348.RKEY'+#13+
       'inner join data0085'+#13+
       'on data0432.qte_ptr=data0085.rkey'+#13+
      'where data0432.qte_ptr='+inttostr(rkey85)+#13+
      'order by data0432.rkey';

  OpenQuery(dm.ADOQuery1,sql_text);
  sgrid2.RowCount:=dm.ADOQuery1.RecordCount+2;
  for i:=1 to dm.ADOQuery1.RecordCount do
  begin
   sgrid2.Cells[0,i] :=inttostr(i);
   sgrid2.Cells[1,i] :=dm.adoquery1.FieldValues['ADDER_NAME'];
   sgrid2.Cells[2,i] :=dm.adoquery1.FieldValues['cac_meoth'];
   sgrid2.Cells[3,i] :=dm.adoquery1.fieldbyname('AMOUNT').asstring;
   if dm.qte_type=1 then
    sgrid2.Cells[4,i] :=dm.adoquery1.fieldbyname('cost_m2').asstring
   else
    sgrid2.Cells[4,i] :=dm.adoquery1.fieldbyname('cost_total_m2').asstring;
   sgrid2.Cells[5,i] :=dm.adoquery1.fieldbyname('FORMULA').AsString;
   sgrid2.Cells[6,i] :=dm.adoquery1.fieldbyname('MIN_VALUE').AsString;
   sgrid2.Cells[7,i] :=dm.adoquery1.fieldbyname('MAX_VALUE').AsString;
   sgrid2.Cells[8,i] :=dm.adoquery1.fieldbyname('SOURCE_PTR').AsString;
   sgrid2.Cells[9,i] :=dm.adoquery1.fieldbyname('rate_margin').AsString;
   sgrid2.Cells[10,i] :=dm.adoquery1.fieldbyname('FREE_AMOUNT').AsString;
   dm.ADOQuery1.Next;
  end;

end;

procedure TForm2.get_tools432(rkey85:integer);
var
 i:byte;
begin
 with dm.ads432 do
  begin
   close;
   Parameters[0].Value:=rkey85;
   open;
  end;
 while not dm.ads432.Eof do
 begin
 for i:=1 to stringgrid1.RowCount-2 do
  if dm.ads432ADDL_CAT_PTR.Value=strtoint(stringgrid1.Cells[4,i]) then
   begin
    stringgrid1.Cells[1,i]:=formatfloat('0.000000',dm.ads432AMOUNT.Value);
    stringgrid1.Cells[2,i]:=formatfloat('0.000000',dm.ads432FREE_AMOUNT.Value);
    stringgrid1.Cells[5,i]:=dm.ads432Mould_set.AsString;
    stringgrid1.Cells[3,i]:=dm.ads432TAX_FLAG.Value;
    break;
   end;
   dm.ads432.Next;
  end;
end;

procedure TForm2.get_Cost8501(rkey85:integer);
var
 i:byte;
begin
  i:=1;
 with dm.ADO8501 do
  begin
   close;
   Parameters[0].Value:=rkey85;
   open;
   First;
   ComboBox5.Text :=  dm.ADO8501Cost_Name.AsString;
  end;
 while not dm.ADO8501.Eof do
 begin
       stringgrid2.Cells[0,i]:=dm.ADO8501Cost_Name.AsString;
       stringgrid2.Cells[1,i]:=formatfloat('0.000',dm.ADO8501Cost.Value);
       stringgrid2.Cells[2,i]:=formatfloat('0.000',dm.ADO8501Total_Cost.Value);
       stringgrid2.Cells[3,i]:=dm.ADO8501Flag_tax.Value;
       stringgrid2.RowCount := stringgrid2.RowCount + 1;
       Inc(i);
       dm.ADO8501.Next;
 end;
 if stringgrid2.RowCount > 2 then
   stringgrid2.RowCount := stringgrid2.RowCount - 1;
end;

procedure TForm2.change_enable;
begin
 if dm.ADSA85QTE_CONTROL5.Value='Y' then
  begin
   bitbtn11.Enabled:=not bitbtn11.Enabled;  //计算
   bitbtn14.Enabled:=not bitbtn14.Enabled;  //更新基价
   bitbtn15.Enabled:=not bitbtn15.Enabled;  //更新参数
   bitbtn12.Enabled:=not bitbtn12.Enabled;  //重算
   bitbtn9.Enabled:=not bitbtn9.Enabled;    //材料
   bitbtn10.Enabled:=not bitbtn10.Enabled;  //基价
   dbcombobox1.Enabled:=not dbcombobox1.Enabled;  //参数
   combobox1.Enabled := not combobox1.Enabled;    //报价单位
   dbcombobox2.Enabled:=not dbcombobox2.Enabled;  //增值税
   dbedit27.Enabled:=not dbedit27.Enabled;       //额外加价率
   dbedit28.Enabled:=not dbedit28.Enabled;       //销售折扣
   dbgrid1.ReadOnly:= not dbgrid1.ReadOnly;      //参数表
   dbcombobox1.Visible:=not dbcombobox1.Visible;

   if bitbtn1.Enabled then     //非检查状态
   begin
    BitBtn7.Enabled:=not BitBtn7.Enabled;
    Edit4.Enabled:=not Edit4.Enabled;
   end;
   if sgrid1.RowCount <= 2 then
   begin
    button1.Enabled:= not button1.Enabled;   //拼版
    button2.Enabled:= not button2.Enabled;    //重拼
    speedbutton3.Enabled:= not speedbutton3.Enabled; //读取工程
    dbedit20.ReadOnly:= not dbedit20.ReadOnly;
    dbedit21.ReadOnly:= not dbedit21.ReadOnly;
    dbedit22.ReadOnly:= not dbedit22.ReadOnly;
   end;
   sgrid1.PopupMenu:=nil;
   sgrid2.PopupMenu:=nil;
  end
 else
 if not bitbtn1.Enabled then     //检查状态
  begin
   bitbtn11.Enabled:=not bitbtn11.Enabled;  //计算
   bitbtn14.Enabled:=not bitbtn14.Enabled;  //更新基价
   bitbtn15.Enabled:=not bitbtn15.Enabled;  //更新参数
   bitbtn12.Enabled:=not bitbtn12.Enabled;  //重算
   bitbtn9.Enabled:=not bitbtn9.Enabled;    //材料
   bitbtn10.Enabled:=not bitbtn10.Enabled;  //基价
   dbcombobox1.Enabled:=not dbcombobox1.Enabled;  //参数
   combobox1.Enabled := not combobox1.Enabled;    //报价单位
   dbcombobox2.Enabled:=not dbcombobox2.Enabled;  //增值税
   dbedit27.Enabled:=not dbedit27.Enabled;        //额外加价率
   dbedit28.Enabled:=not dbedit28.Enabled;       //销售折扣
   dbgrid1.ReadOnly:= not dbgrid1.ReadOnly;      //参数表

   sgrid1.PopupMenu:=nil;
   sgrid2.PopupMenu:=nil;
  end;
end;


procedure TForm2.FormCreate(Sender: TObject);
var
  i:word;
  tmpAdo:TADOQuery;
begin
  WITH dm.ADOQuery1 DO     //查找工具费用类别
  begin
       active:=false;
       sql.Clear;
       sql.Add('select rkey,category,TAX_FLAG from data0061 order by rkey');
       active:=true;
       stringgrid1.RowCount:=recordcount+2;
       for i:=1 to RecordCount do
       begin
            stringgrid1.Cells[0,i]:=fieldbyname('category').AsString;
            StringGrid1.Cells[1,i]:='0.0000';
            StringGrid1.Cells[2,i]:='0.0000';
            StringGrid2.Cells[1,i]:='0.000';
            StringGrid2.Cells[2,i]:='0.000';
            StringGrid1.Cells[3,i]:=fieldbyname('TAX_FLAG').AsString;
            StringGrid1.Cells[4,i]:=fieldbyname('rkey').AsString;
            next;
       end;
  end;
 OldGridWnd := DBGrid1.WindowProc ;
 DBGrid1.WindowProc := NewGridWnd;
   //chen2014-05-16修改添加订单价格明细
    try
      try
        tmpAdo:=TADOQuery.Create(Application);
        tmpAdo.Connection:=dm.ADOConnection1;
        tmpAdo.Close;
        tmpAdo.SQL.Clear;
        tmpAdo.SQL.Text:='select * from dbo.data0579';       //价格代码,名称
        tmpAdo.Open;
        if not tmpAdo.IsEmpty then
        begin
          i:=1;
          while not tmpAdo.Eof do
          begin
            StringGrid3.RowCount := StringGrid3.RowCount + 1;
            StringGrid3.Cells[0,i] := tmpAdo.fieldBYName('PriceName').AsString;
            StringGrid3.Cells[1,i] := '0.0000000';
            StringGrid3.Cells[2,i] := tmpAdo.fieldBYName('Rkey').AsString;
            i := i + 1;
            tmpAdo.Next;
          end;
        end;
      except

      end;
    finally
      tmpAdo.Close;
      tmpAdo.Connection:=nil;
      tmpAdo.Free;
    end;
    StringGrid3.RowCount:=StringGrid3.RowCount-1;
    //end chen2014-05-16------------
end;

procedure TForm2.FormActivate(Sender: TObject);
var
    i: Integer;
begin
   pagecontrol1.ActivePageIndex:=0;
   sgrid1.Cells[0,0] := '材料编码';
   sgrid1.Cells[1,0] := '材料规格';
   sgrid1.Cells[2,0] := '供应商';
   sgrid1.Cells[3,0] := '单位';
   sgrid1.Cells[4,0] := '本币价格';
   sgrid1.Cells[5,0] := 'PCS用量';
   sgrid1.Cells[6,0] := 'PCS成本';
   sgrid1.Cells[7,0] := '原币价格';
   sgrid1.Cells[8,0] := '价格标识28rkey';
   sgrid1.Cells[9,0] := '材料标识17rkey';
   sgrid1.Cells[10,0] := '压合比例';
   sgrid1.Cells[11,0] := '主/辅料';
   sgrid1.ColWidths[8] := -1;
   sgrid1.ColWidths[9] := -1;

   sgrid2.Cells[0,0] := '序号';
   sgrid2.Cells[1,0] := '工艺名称';
   sgrid2.Cells[2,0] := '计价模式';
   sgrid2.Cells[3,0] := 'PCS成本';
   sgrid2.Cells[4,0] := '平米成本';

   sgrid2.Cells[5,0] := '公式';
   sgrid2.Cells[6,0] := '最小值';
   sgrid2.Cells[7,0] := '最大值';
   sgrid2.Cells[8,0] := '工艺标识';
   sgrid2.Cells[9,0] := '财务毛利率';
   sgrid2.Cells[10,0] := 'PCS财务成本';

   sgrid2.ColWidths[5] := -1;
   sgrid2.ColWidths[6] := -1;
   sgrid2.ColWidths[7] := -1;
   sgrid2.ColWidths[8] := -1;
   sgrid2.ColWidths[9] := -1;
   sgrid2.ColWidths[10] := -1;


   StringGrid1.ColWidths[0] := 130;
   StringGrid1.ColWidths[1] := 60;
   StringGrid1.ColWidths[2] := 60;
   StringGrid1.ColWidths[3] := 30;
   stringgrid1.Cells[0,0] := '工具费用类别';
   stringgrid1.Cells[1,0] := '金额';
   stringgrid1.Cells[2,0] := '免收金额';
   StringGrid1.Cells[3,0] := '征税';
   StringGrid1.Cells[4,0] := '序号';
   StringGrid1.Cells[5,0] := '套数';

   StringGrid2.ColWidths[0] := 70;
   StringGrid2.ColWidths[1] := 50;
   StringGrid2.ColWidths[2] := 60;
   StringGrid2.ColWidths[3] := 30;
   StringGrid2.ColWidths[4] := 25;
   stringgrid2.Cells[0,0] := '费用类别';
   stringgrid2.Cells[1,0] := 'PCS金额';
   stringgrid2.Cells[2,0] := '总金额';
   StringGrid2.Cells[3,0] := '征税';
   StringGrid2.Cells[4,0] := '增';
 
     //chen2014-05-16添加订单价格明细
    dm.Ado578.Open;
    StringGrid3.Cells[0,0]:='订单价格类型定义';
    StringGrid3.Cells[1,0]:='价格';
    StringGrid3.ColWidths[2]:=-1;
   //end chen2014-05-16------------

   with dm.ADOTmp2 do
   begin
          Close;
          SQL.Clear;
          SQL.Text := 'SELECT    DISTINCT Cost_Name   FROM         dbo.Data008501';
          Open;
          First;
          ComboBox5.Text :=  fieldbyname('Cost_Name').AsString;
          while not Eof  do
          begin
              ComboBox5.Items.Add(fieldbyname('Cost_Name').AsString);
              Next;
          end;
   end;

   if strtoint(aped_fg.Caption)=0 then //复制时不要打开
    begin
     dm.ads431.Close;
     dm.ads431.Parameters[0].Value:=dm.ADSA85RKEY.Value;
     dm.ads431.Open;         //打开报价参数
     dm.ads511.close;
     dm.ads511.Parameters[0].Value:=dm.ADSA85RKEY.Value;
     dm.ads511.open;            //打开拼版结构
    end;

  if (dm.ADSA85.State=dsinsert) and (strtoint(aped_fg.Caption)=0)  then  //新增
  begin
      with dm.ADOQuery1 do
       begin
        close;
//        sql.Text:='select rkey from data0278'+#13+
//                  'where spec_rkey=''P'' or '+#13+  //大料开总PCS数
//                  'spec_rkey=''5'' or '+#13+        //大料利用率
//                  'spec_rkey=''WB'' or '+#13+       //一平米大料开PCS数
//                  'spec_rkey=''WA'' or spec_rkey=''JN'''; //单元面积,交货单元数

          SQL.Text:='select rkey,PARAMETER_INFO from data0278 where quote_flag=''1'' order by SEQUENCE_NO';
          open;
          while not eof do
           begin
//            dm.ads431.Append;
//            dm.ads431UNIT_PTR.Value:=fieldvalues['rkey'];
//            dm.ads431ttype.Value:=0;
//            dm.ads431.Post;
              dm.ads431.Append;
              dm.ads431UNIT_PTR.Value:=fieldvalues['rkey'];
              dm.ads431UNIT_VALUE.Value:=fieldbyname('PARAMETER_INFO').AsString;
              dm.ads431ttype.Value:=0;
              dm.ads431.Post;
            next;
           end;
          dm.ads431.First;
       end;     //默认参数
       with dm.ADOQuery1 do
       begin
            close;
            sql.Text:='select rkey,code,QTE_APPROV_DESC from data0264';
            open;                    //审批流程
            if dm.ADOQuery1.RecordCount=1 then
             begin
              edit5.Text:=fieldvalues['code'];
              label26.Caption:=fieldbyname('QTE_APPROV_DESC').AsString;
              dm.ADSA85PROD_ROUTE_PTR.Value:=fieldvalues['rkey'];
             end;
       end;
       image1.Canvas.Brush.Color:=clwhite;
       dbedit20.ReadOnly:=false;
       dbedit21.ReadOnly:=false;
       dbedit22.ReadOnly:=false;
  end
  else          //编辑,复制
  begin
      edit2.Text:=dm.ads85curr_code.value;
      label16.Caption:=dm.ADS85CURR_NAME.Value;
      statictext2.Caption:='实际报价:'+edit2.Text;
      edit3.Text:=dm.ADS85REP_CODE.Value;
      label18.Caption:=dm.ADS85SALES_REP_NAME.Value;
      edit4.Text:=dm.ADS85prod_code.value;
      label24.Caption:=dm.ADS85product_name.Value;
      edit5.Text:=dm.ADS85code.Value;
      label26.Caption:=dm.ADS85QTE_APPROV_DESC.Value;
      combobox3.ItemIndex:=dm.ADSA85ttype2.Value; //类型
      combobox1.ItemIndex:= dm.ADSA85QTE_UNIT_PTR.Value-1; //报价单元
      edit7.Text:=dm.ADS85ROW_NAME.Value;
      if dm.ADSA85CUST_PTR.Value>0 then
      begin
          OpenQuery(dm.ADOQuery1,'select CUST_CODE from data0010 where rkey='+dm.ADSA85CUST_PTR.AsString);
          edit1.Text:=dm.ADOQuery1.FieldValues['CUST_CODE'];
      end;
      self.get_intvent(dm.ADS85RKEY.Value);//得到材料及工艺
      self.get_tools432(dm.ADS85RKEY.Value);//得到工具费用
      self.get_Cost8501(dm.ADS85RKEY.Value);
      self.change_enable;
      //chen2014-05-16添加订单价格明细--
      with dm.adoS578 do
      begin
          Close;
          Parameters.ParamByName('rkey').Value:= dm.ADS85RKEY.Value;
          Open;
          while not Eof do
          begin
               for i :=1 to StringGrid3.RowCount-1 do
               begin
                 if (StrToInt(StringGrid3.Cells[2,i])=FieldByName('d579_Ptr').AsInteger) then
                 begin
                   StringGrid3.Cells[1,i]:=FormatFloat('0.0000000',FieldValues['Price']);
                   break;
                 end;
               end;
               Next;
          end;
      end;
      //end chen2014-05-16--------------
      if not dm.ads511.IsEmpty then
      begin
            //dbedit14.Enabled:=false;
            //bitbtn6.Enabled:=false;
            image1.Picture.Assign(Load_JPG_Pic_From_DB(dm.ads511sheet_BMP));
            button2.Enabled:=true;
      end;

      if sgrid1.RowCount>2 then
      begin
            button1.Enabled:=false;
            button2.Enabled:=false;
            speedbutton3.Enabled:=false;
      end;

      if combobox1.ItemIndex=0 then   //报价单元
      begin
           if dm.qte_type=1 then      //基价折率法
           begin
             edit8.Text:=formatfloat('0.000000',dm.ADSA85MATL_COST.value*dm.ADSA85USHEET.Value);
             edit9.Text:=formatfloat('0.000000',dm.ADSA85base_pcscost.value*dm.ADSA85USHEET.Value);
             edit10.Text:=formatfloat('0.000000',dm.ADSA85ovhd_cost.value*dm.ADSA85USHEET.Value);
             edit11.Text:=formatfloat('0.000000',dm.ADSA85total_cost.value*dm.ADSA85USHEET.Value);
             edit12.Text:=formatfloat('0.000000',dm.ADSA85CRP_EST_QUANTITY.value*dm.ADSA85USHEET.Value);
             edit13.Text:=formatfloat('0.000000',dm.ADSA85comm_cost.value*dm.ADSA85USHEET.Value);
             edit14.Text:=formatfloat('0.000000',dm.ADSA85SHIPPING_CHARGE.value*dm.ADSA85USHEET.Value);
             edit15.Text:=formatfloat('0.000000',dm.ADSA85QTE_UNITS.value*dm.ADSA85USHEET.Value);
             edit16.Text:=formatfloat('0.000000',dm.ADSA85quote_price.value*dm.ADSA85USHEET.Value);
             edit17.Text:=formatfloat('0.000000',dm.ADSA85quote_taxprice.value*dm.ADSA85USHEET.Value);
           end
           else                    //总成本折率法
           begin
             edit8.Text:=formatfloat('0.000000',dm.ADSA85MATL_COST.value*dm.ADSA85TUNITS.Value/
                                           (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
             edit9.Text:=formatfloat('0.000000',dm.ADSA85base_pcscost.value*dm.ADSA85TUNITS.Value/
                                           (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
             edit10.Text:=formatfloat('0.000000',dm.ADSA85ovhd_cost.value*dm.ADSA85TUNITS.Value/
                                           (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
             edit11.Text:=formatfloat('0.000000',dm.ADSA85total_cost.value*dm.ADSA85TUNITS.Value/
                                           (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
             edit12.Text:=formatfloat('0.000000',dm.ADSA85CRP_EST_QUANTITY.value*dm.ADSA85TUNITS.Value/
                                           (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
             edit13.Text:=formatfloat('0.000000',dm.ADSA85comm_cost.value*dm.ADSA85TUNITS.Value/
                                           (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
             edit14.Text:=formatfloat('0.000000',dm.ADSA85SHIPPING_CHARGE.value*dm.ADSA85TUNITS.Value/
                                           (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
             edit15.Text:=formatfloat('0.000000',dm.ADSA85QTE_UNITS.value*dm.ADSA85TUNITS.Value/
                                           (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
             edit16.Text:=formatfloat('0.000000',dm.ADSA85quote_price.value*dm.ADSA85TUNITS.Value/
                                           (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
             edit17.Text:=formatfloat('0.000000',dm.ADSA85quote_taxprice.value*dm.ADSA85TUNITS.Value/
                                           (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
           end;
      end
      else
      begin
           if dm.qte_type=1 then
           begin
             edit8.Text:=formatfloat('0.000000',dm.ADSA85MATL_COST.value*dm.ADSA85USHEET.Value/
                                              dm.ADSA85TUNITS.Value);
             edit9.Text:=formatfloat('0.000000',dm.ADSA85base_pcscost.value*dm.ADSA85USHEET.Value/
                                              dm.ADSA85TUNITS.Value);
             edit10.Text:=formatfloat('0.000000',dm.ADSA85ovhd_cost.value*dm.ADSA85USHEET.Value/
                                               dm.ADSA85TUNITS.Value);
             edit11.Text:=formatfloat('0.000000',dm.ADSA85total_cost.value*dm.ADSA85USHEET.Value/
                                               dm.ADSA85TUNITS.Value);
             edit12.Text:=formatfloat('0.000000',dm.ADSA85CRP_EST_QUANTITY.value*dm.ADSA85USHEET.Value/
                                               dm.ADSA85TUNITS.Value);
             edit13.Text:=formatfloat('0.000000',dm.ADSA85comm_cost.value*dm.ADSA85USHEET.Value/
                                               dm.ADSA85TUNITS.Value);
             edit14.Text:=formatfloat('0.000000',dm.ADSA85SHIPPING_CHARGE.value*dm.ADSA85USHEET.Value/
                                               dm.ADSA85TUNITS.Value);
             edit15.Text:=formatfloat('0.000000',dm.ADSA85QTE_UNITS.value*dm.ADSA85USHEET.Value/
                                               dm.ADSA85TUNITS.Value);
             edit16.Text:=formatfloat('0.000000',dm.ADSA85quote_price.value*dm.ADSA85USHEET.Value/
                                               dm.ADSA85TUNITS.Value);
             edit17.Text:=formatfloat('0.000000',dm.ADSA85quote_taxprice.value*dm.ADSA85USHEET.Value/
                                               dm.ADSA85TUNITS.Value);
           end
           else
            begin
             edit8.Text:=formatfloat('0.000000',dm.ADSA85MATL_COST.value/
                                              (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
             edit9.Text:=formatfloat('0.000000',dm.ADSA85base_pcscost.value/
                                              (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
             edit10.Text:=formatfloat('0.000000',dm.ADSA85ovhd_cost.value/
                                               (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
             edit11.Text:=formatfloat('0.000000',dm.ADSA85total_cost.value/
                                               (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
             edit12.Text:=formatfloat('0.000000',dm.ADSA85CRP_EST_QUANTITY.value/
                                               (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
             edit13.Text:=formatfloat('0.000000',dm.ADSA85comm_cost.value/
                                               (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
             edit14.Text:=formatfloat('0.000000',dm.ADSA85SHIPPING_CHARGE.value/
                                               (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
             edit15.Text:=formatfloat('0.000000',dm.ADSA85QTE_UNITS.value/
                                               (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
             edit16.Text:=formatfloat('0.000000',dm.ADSA85quote_price.value/
                                               (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
             edit17.Text:=formatfloat('0.000000',dm.ADSA85quote_taxprice.value/
                                               (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
            end;
      end;
  end;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
if bitbtn1.Enabled then
if messagedlg('你确定不保存退出吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
  dm.ADSA85.Cancel;
  v_close:=1; //正常退出
  self.ModalResult:=mrcancel;
 end
else
else
 begin
  v_close:=1; //正常退出
  self.ModalResult:=mrcancel;
 end;
end;

procedure TForm2.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (gdSelected  in State) then
 begin
  if (ACol = 3) and (ARow<>stringgrid1.RowCount-1) then
   begin
    ComboBox2.Left := Rect.Left+1;
    ComboBox2.Top := Rect.Top+1;
    ComboBox2.Width := Rect.Right - Rect.Left+2;
//    ComboBox2.Height := Rect.Bottom - Rect.Top;
    ComboBox2.Visible := True;
    combobox2.ItemIndex:=combobox2.Items.IndexOf(StringGrid1.Cells[acol,arow])
   end
  else
    ComboBox2.Visible :=false;
 end;
end;

procedure TForm2.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then stringgrid1.SetFocus;
end;

procedure TForm2.ComboBox2Change(Sender: TObject);
begin
 stringgrid1.Cells[3,stringgrid1.Row]:=combobox2.Text;
end;

procedure TForm2.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
 if (pos('.',stringgrid1.Cells[stringgrid1.col,stringgrid1.row])>0)  then     //判断是否重复输入小数点'.'
  if key = chr(46)  then abort;
if (key <> chr(9)) then    //没有按tab键
 begin
  if (stringgrid1.Col=3) and (combobox2.Enabled) then
   begin
    ComboBox2.SetFocus;
    SendMessage(ComboBox2.Handle,WM_Char,word(Key),0);
   end;
 end;
end;

procedure TForm2.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
if (ACol = 4) or (ARow=stringgrid1.RowCount-1) then
 CanSelect:=false
else
 CanSelect:=true;

 if stringgrid1.Row<>stringgrid1.RowCount-1 then
  begin
   if stringgrid1.Cells[1,stringgrid1.Row]='' then
    stringgrid1.Cells[1,stringgrid1.Row]:='0';
   if stringgrid1.Cells[2,stringgrid1.Row]='' then
    stringgrid1.Cells[2,stringgrid1.Row]:='0';
   stringgrid1.Cells[1,stringgrid1.Row]:=
   formatfloat('0.000000',strtofloat(stringgrid1.Cells[1,stringgrid1.Row]));
   stringgrid1.Cells[2,stringgrid1.Row]:=
   formatfloat('0.000000',strtofloat(stringgrid1.Cells[2,stringgrid1.Row]));
  end;

end;

procedure TForm2.StringGrid1Exit(Sender: TObject);
begin
 if stringgrid1.Row<>stringgrid1.RowCount-1 then
  begin
   if stringgrid1.Cells[1,stringgrid1.Row]='' then
    stringgrid1.Cells[1,stringgrid1.Row]:='0';
   if stringgrid1.Cells[2,stringgrid1.Row]='' then
    stringgrid1.Cells[2,stringgrid1.Row]:='0';

    stringgrid1.Cells[1,stringgrid1.Row]:=
     formatfloat('0.000000',strtofloat(stringgrid1.Cells[1,stringgrid1.Row]));
    stringgrid1.Cells[2,stringgrid1.Row]:=
     formatfloat('0.000000',strtofloat(stringgrid1.Cells[2,stringgrid1.Row]));
  end;
end;

procedure TForm2.PopupMenu2Popup(Sender: TObject);
begin
 if sgrid1.Row=sgrid1.RowCount-1 then
  begin
   n2.Enabled:=false;
   n5.Enabled:=false;
  end
 else
  begin
   n2.Enabled:=true;
   n5.Enabled:=true;
  end;
end;

procedure TForm2.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  column,row:integer;
begin
if button=mbright then
 begin
  (sender as tstringgrid).MouseToCell(x,y,column,row);
   if row<>0 then
  (sender as tstringgrid).Row:=row;
 end;
end;

procedure TForm2.PopupMenu3Popup(Sender: TObject);
begin
 if sgrid2.Row=sgrid2.RowCount-1 then
  n4.Enabled:=false
 else
  n4.Enabled:=true;
end;

procedure TForm2.N2Click(Sender: TObject);
var
 i:word;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
 if sgrid1.RowCount=2 then
  begin
   button1.Enabled:=true;
   button2.Enabled:=true;
   speedbutton3.Enabled:=true;
   dbradiogroup1.Enabled:=true;
   dbedit20.ReadOnly:=false;
   dbedit21.ReadOnly:=false;
   dbedit22.ReadOnly:=false;
  end;
end;

procedure TForm2.N4Click(Sender: TObject);
var
 i,j:word;
begin
 self.delete_data0431(strtoint(sgrid2.Cells[8,sgrid2.row]));

 for i:=sgrid2.Row to sgrid2.RowCount-2 do
  for j:=0 to sgrid2.ColCount-1 do
   sgrid2.Cells[j,i]:=sgrid2.Cells[j,i+1];
  sgrid2.RowCount:=sgrid2.RowCount-1;
end;

procedure TForm2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and        //如果是下箭头如果是最后一条记录
  (dm.ads431.RecNo=dm.ads431.RecordCount) then abort;
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

procedure TForm2.DBGrid1CellClick(Column: TColumn);
begin
if column.Index<3 then dbgrid1.SelectedIndex:=3;
end;

procedure TForm2.DBGrid1ColExit(Sender: TObject);
begin
If DBGrid1.SelectedField.FieldName = DBComboBox1.DataField then
 DBComboBox1.Visible := false;
end;

procedure TForm2.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if (gdFocused in State) then
 begin
  if (column.FieldName = DBComboBox1.DataField ) then
   begin
    DBComboBox1.Left := Rect.Left+1;
    DBComboBox1.Top := Rect.Top;
    DBComboBox1.Width := Rect.Right - Rect.Left+3;
    DBComboBox1.Height := Rect.Bottom - Rect.Top;
    self.get_value(dm.ads431unit_ptr.Value);
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
  DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;
end;

procedure TForm2.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
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

procedure TForm2.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (trim(edit1.Text)<>'') then
begin
 if get_cust_info(trim(edit1.Text)) then
 if dm.ADOQuery1.FieldValues['rkey']<>dm.ADSA85CUST_PTR.Value then
 begin
  dm.ADSA85CUST_PTR.Value:=dm.ADOQuery1.FieldValues['rkey'];
  DM.ADSA85CUST_NAME.Value:=dm.ADOQuery1.FieldValues['CUSTOMER_NAME'];
  DM.ADSA85CUST_ADD1.Value:=dm.ADOQuery1.Fieldbyname('BILLING_ADDRESS_1').AsString;
  DM.ADSA85EMAIL.Value:=dm.ADOQuery1.Fieldbyname('GEN_EMAIL_ADDRESS').AsString;
  DM.ADSA85CUST_PHONE.Value:=dm.ADOQuery1.Fieldbyname('PHONE').AsString;
  DM.ADSA85CUST_FAX.Value:=dm.ADOQuery1.Fieldbyname('FAX').AsString;
  DM.ADSA85CUST_CONTACT.Value:=dm.ADOQuery1.Fieldbyname('CONTACT_NAME_1').AsString;
  DM.ADSA85CUST_CONTACT_PHONE.Value:=dm.ADOQuery1.Fieldbyname('CONT_PHONE_1').AsString;
  DM.ADSA85PAYMENT.Value:=dm.ADOQuery1.Fieldbyname('FED_TAX_ID_NO').AsString;
  DM.ADSA85CURR_PTR.Value:=dm.ADOQuery1.FieldValues['CURRENCY_PTR'];
  EDIT2.Text:=dm.ADOQuery1.FieldValues['CURR_CODE'];
  label16.Caption:=dm.ADOQuery1.FieldValues['CURR_NAME'];
  statictext2.Caption:='实际报价:'+edit2.Text;
  dm.ADSA85CURR_RATE.Value:=dm.ADOQuery1.FieldValues['QTE_BASE_TO_OTHER']; //汇率
  dm.ADSA85SREP_PTR.Value:=dm.ADOQuery1.FieldValues['SALES_REP_PTR'];
  edit3.Text:=dm.ADOQuery1.FieldValues['REP_CODE'];
  label18.Caption:=dm.ADOQuery1.FieldValues['SALES_REP_NAME'];
  dm.ADSA85QUOTE_TYPE.Value:=dm.ADOQuery1.FieldValues['EDI_FLAG_FOR_SOACK'];  //销售方式
 // dm.ADSA85CUST_QTE_FACTOR.Value:=dm.ADOQuery1.Fieldbyname('quote_factor').AsCurrency;//额外加价率%
  dm.ADSA85SALES_DISCOUNT.Value:=dm.ADOQuery1.Fieldbyname('SALES_DISCOUNT').AsCurrency;//销售折扣%
  self.get_tax(dm.ADSA85CUST_PTR.Value);
 end
 else
 else
  BEGIN
   messagedlg('客户代码输入错误!',mtinformation,[mbcancel],0);
   EDIT1.SetFocus;
  END;
end
else
 begin
  dm.ADSA85CUST_PTR.AsVariant:=null;
 end;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
try
form_customer:=tform_customer.Create(application);
form_customer.ads10.Close;
form_customer.ads10.Parameters[0].Value:=trim(edit1.Text)+'%';
form_customer.ads10.Open;
if form_customer.ads10.IsEmpty then
 begin
  messagedlg('客户代码输入错误!',mtinformation,[mbcancel],0);
  EDIT1.SetFocus;
 end
else
if form_customer.ShowModal=mrok then
begin
 edit1.Text:= form_customer.ads10CUST_CODE.Value;
 dbedit3.SetFocus;
 Edit1Exit(sender);
end
else
 edit1.SetFocus;
finally
 form_customer.Free;
end;
end;

procedure TForm2.DBEdit14Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn6') and (trim(dbedit14.Text)<>'') then
begin
 if get_custpart_info(trim(dbedit14.Text),dm.ADSA85CUST_PTR.Value) then
  if dm.ADOQuery1.FieldValues['rkey25']<>dm.ADSA85CUST_PART_PTR.Value then
  begin
   dm.ADSA85CUST_PART_PTR.Value:=dm.ADOQuery1.FieldValues['rkey25'];
   dm.ADSA85CUST_PART_NO.Value:=trim(dm.ADOQuery1.fieldbyname('MANU_PART_DESC').AsString);
   dm.ADSA85CUST_PART_DESC.Value:=trim(dm.ADOQuery1.fieldbyname('ANALYSIS_CODE_2').AsString);
   dm.ADSA85PROD_CODE_PTR.Value:=dm.ADOQuery1.FieldValues['PROD_CODE_PTR'];
   edit4.Text:=dm.ADOQuery1.FieldValues['PROD_CODE'];
   label24.Caption:=dm.ADOQuery1.FieldValues['PRODUCT_NAME'];
   dm.ADSA85CUST_QTE_FACTOR.Value:=dm.ADOQuery1.Fieldbyname('EST_SCRAP').AsCurrency; 

   dm.ADSA85UNIT_LEN.Value:= dm.ADOQuery1.Fieldbyname('spell_lngth').AsFloat;
   dm.ADSA85UNIT_WTH.Value:= dm.ADOQuery1.Fieldbyname('spell_width').AsFloat;
   dm.ADSA85TUNITS.Value:= dm.ADOQuery1.FieldValues['spell_qty'];

   if dm.ADSA85CUST_PTR.Value = 0 then
   begin
    edit1.Text:= dm.ADOQuery1.FieldValues['CUST_CODE'];
    edit1exit(sender);
   end;
  end
  else
 else
  BEGIN
   messagedlg('本厂编号加版本输入错误!',mtinformation,[mbcancel],0);
   dbEDIT14.SetFocus;
  END;
end
else
 begin
  dm.ADSA85CUST_PART_PTR.AsVariant:=null;
 end;
end;

procedure TForm2.BitBtn6Click(Sender: TObject);
begin
try
Form_product:=tForm_product.Create(application);
Form_product.ads50.Close;
//Form_product.ads50.Parameters[0].Value:=trim(edit1.Text)+'%';
Form_product.ads50.Parameters[0].Value:=trim(dbedit14.Text)+'%';
Form_product.ads50.Open;
if Form_product.ads50.IsEmpty then
 begin
  messagedlg('本厂编号加版本输入错误!',mtinformation,[mbcancel],0);
  dbEDIT14.SetFocus;
 end
else
if Form_product.ShowModal=mrok then
 begin
  dm.ADSA85REF_PART_NO.Value:=trim(form_product.ads50MANU_PART_NUMBER.Value);
  dm.ADSA85CUST_PART_PTR.Value:=form_product.ads50rkey25.Value;
  dm.ADSA85CUST_PART_NO.Value:=trim(form_product.ads50MANU_PART_DESC.Value);
  dm.ADSA85CUST_PART_DESC.Value:=form_product.ads50ANALYSIS_CODE_2.Value;
  dm.ADSA85PROD_CODE_PTR.Value:=form_product.ads50PROD_CODE_PTR.Value;
  edit4.Text:=form_product.ads50PROD_CODE.Value;
  label24.Caption:=form_product.ads50PRODUCT_NAME.Value;
  //20170105tang注,复制时不带额外加价率
//  dm.ADSA85CUST_QTE_FACTOR.Value:=form_product.ads50EST_SCRAP.Value;

  dm.ADSA85UNIT_LEN.Value:= form_product.ads50spell_lngth.value;
  dm.ADSA85UNIT_WTH.Value:= form_product.ads50spell_width.Value;
  dm.ADSA85TUNITS.Value:= form_product.ads50spell_qty.Value;
  if dm.ADSA85CUST_PTR.Value = 0 then
   begin
    edit1.Text:= form_product.ads50CUST_CODE.Value;
    edit1exit(sender);
   end;
  dbedit15.SetFocus;
 end
else
 dbedit14.SetFocus;
finally
 Form_product.Free;
end;
end;

procedure TForm2.ComboBox3Change(Sender: TObject);
begin
 dm.ADSA85ttype2.Value:=combobox3.ItemIndex; //类型
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
try
 application.CreateForm(tform_curr,form_curr);
 if form_curr.ShowModal=mrok then
 begin
  edit2.Text:=form_curr.adoquery1CURR_CODE.Value;
  label16.Caption:=form_curr.adoquery1CURR_NAME.Value;
  dm.ADSA85CURR_PTR.Value:=form_curr.adoquery1rkey.Value;
  dm.ADSA85CURR_RATE.Value:=form_curr.adoquery1QTE_BASE_TO_OTHER.Value;
  statictext2.Caption:='实际报价:'+edit2.Text;
 end
 else
  edit2.SetFocus;
finally
 form_curr.Free;
end;
end;

procedure TForm2.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn4') and (edit2.Text<>'') then
try
 application.CreateForm(tform_curr,form_curr);
 form_curr.Edit1.Text:=edit2.Text;
 IF comparetext(trim(edit2.text),trim(form_curr.adoquery1CURR_CODE.Value))=0 THEN
 begin
  label16.Caption:=form_curr.adoquery1CURR_NAME.Value;
  dm.ADSA85CURR_PTR.Value:=form_curr.adoquery1rkey.Value;
  dm.ADSA85CURR_RATE.Value:=form_curr.adoquery1QTE_BASE_TO_OTHER.Value;
  statictext2.Caption:='实际报价:'+edit2.Text;
 end
 else
  begin
   messagedlg('货币代码输入错误!',mtinformation,[mbcancel],0);
   edit2.SetFocus;
  end;
finally
 form_curr.Free;
end
else
 label16.Caption:='';
end;

procedure TForm2.DBEdit12Exit(Sender: TObject);
begin
if trim(dbedit12.Text)='' then
 begin
  showmessage('汇率数据输入有误!');
  dbedit12.SetFocus;
 end
else
 if dm.ADSA85CURR_RATE.Value<=0 then
  begin
   showmessage('汇率数据输入有误!');
   dbedit12.SetFocus;
  end
 else
  begin
   dbedit12.Text:=formatfloat('0.000000',dm.ADSA85CURR_RATE.Value);
  end;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
try
 application.CreateForm(tform_rep,form_rep);
 if form_rep.ShowModal=mrok then
 begin
  edit3.Text:=form_rep.ADOQuery1REP_CODE.Value;
  label18.Caption:=form_rep.ADOQuery1SALES_REP_NAME.Value;
  dm.ADSA85SREP_PTR.Value:=form_rep.ADOQuery1rkey.Value;
 end
 else
  edit3.SetFocus;
finally
 form_rep.Free;
end;
end;

procedure TForm2.Edit3Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn5') and (edit3.Text<>'') then
try
 application.CreateForm(tform_rep,form_rep);
 form_rep.Edit1.Text:=edit3.Text;
 if comparetext(trim(edit3.Text),form_rep.ADOQuery1REP_CODE.Value)=0  then
 begin
  label18.Caption:=form_rep.ADOQuery1SALES_REP_NAME.Value;
  dm.ADSA85SREP_PTR.Value:=form_rep.ADOQuery1rkey.Value;
 end
 else
  begin
   messagedlg('销售代表代码输入错误!',mtinformation,[mbcancel],0);
   edit3.SetFocus;
  end;
finally
 form_rep.Free;
end
else
 label18.Caption:='';
end;

procedure TForm2.BitBtn7Click(Sender: TObject);
begin
try
 application.CreateForm(tform_prodcode,form_prodcode);
 if form_prodcode.ShowModal=mrok then
 begin
  edit4.Text:=form_prodcode.adoquery1prod_code.Value;
  label24.Caption:=form_prodcode.adoquery1product_name.Value;
  dm.ADSA85PROD_CODE_PTR.Value:=form_prodcode.adoquery1rkey.Value;
  dm.ADSA85CUST_QTE_FACTOR.Value:=form_prodcode.adoquery1EST_SCRAP.Value;
 end
 else
  edit4.SetFocus;
finally
 form_prodcode.Free;
end;
end;

procedure TForm2.Edit4Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn7') and (edit4.Text<>'') then
try
 application.CreateForm(tform_prodcode,form_prodcode);
 form_prodcode.Edit1.Text:=edit4.Text;
 if comparetext(trim(edit4.Text),form_prodcode.adoquery1prod_code.Value)=0  then
 begin
  label24.Caption:=form_prodcode.adoquery1product_name.Value;
  dm.ADSA85PROD_CODE_PTR.Value:=form_prodcode.ADOQuery1rkey.Value;
  dm.ADSA85CUST_QTE_FACTOR.Value:=form_prodcode.adoquery1EST_SCRAP.Value;
 end
 else
  begin
   messagedlg('产品类型代码输入错误!',mtinformation,[mbcancel],0);
   edit4.SetFocus;
  end;
finally
 form_prodcode.Free;
end
else
 label24.Caption:='';
end;

procedure TForm2.BitBtn8Click(Sender: TObject);
begin
try
 application.CreateForm(tForm_authflow,Form_authflow);
 if Form_authflow.ShowModal=mrok then
 begin
  edit5.Text:=Form_authflow.ADOQuery1CODE.Value;
  label26.Caption:=Form_authflow.ADOQuery1QTE_APPROV_DESC.Value;
  dm.ADSA85PROD_ROUTE_PTR.Value:=Form_authflow.adoquery1rkey.Value;
 end
 else
  edit5.SetFocus;
finally
 Form_authflow.Free;
end;
end;

procedure TForm2.Edit5Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn8') and (edit5.Text<>'') then
try
 application.CreateForm(tForm_authflow,Form_authflow);
 Form_authflow.maskEdit1.Text:=edit5.Text;
 if comparetext(trim(edit5.Text),Form_authflow.ADOQuery1CODE.Value)=0  then
 begin
  label26.Caption:=Form_authflow.ADOQuery1QTE_APPROV_DESC.Value;
  dm.ADSA85PROD_ROUTE_PTR.Value:=Form_authflow.ADOQuery1rkey.Value;
 end
 else
  begin
   messagedlg('审批代码输入错误!',mtinformation,[mbcancel],0);
   edit5.SetFocus;
  end;
finally
 Form_authflow.Free;
end
else
 label26.Caption:='';
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
try
 application.CreateForm(tForm_layer,Form_layer);
 Form_layer.ads93.Close;
 Form_layer.ads93.CommandText:=
   'select  RECORD_KEY,CODE, DESCRIPTION,layers_info'+#13+
   'from data0193'+#13+
   'where SPEC_RKEY <> ''Y''';
 Form_layer.ads93.Open;
 if Form_layer.ads93.IsEmpty then
  messagedlg('没有建立标准层压结构!',mtinformation,[mbcancel],0)
 else
 if Form_layer.ShowModal=mrok then
 begin
  dm.ADSA85rej_info.Value:='';
  dm.ADSA85rej_info.Value:=form_layer.ads93layers_info.Value; 
 end;
finally
 Form_layer.Free;
end;
end;

procedure TForm2.N1Click(Sender: TObject);
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

   dbmemo2.Lines.Insert(dbmemo2.CaretPos.y,Form_layer.ads93layers_info.Value);
 end;

finally
 Form_layer.Free;
end;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
if dm.ADSA85CUST_PART_PTR.Value>0 then
begin
 with dm.adoquery2 do
  begin
   close;
   sql.Text:=
   'SELECT layers_info'+#13+
   'FROM Data0025'+#13+
   'WHERE rkey = '+dm.ADSA85CUST_PART_PTR.AsString;
   open;
   dm.ADSA85rej_info.Value:=FieldValues['layers_info'];
  end;
end
else
 messagedlg('请首先确定本厂编号!',mtinformation,[mbcancel],0);
end;


procedure TForm2.BitBtn9Click(Sender: TObject);
begin
     {   if (dm.ADSA85QTE_USHEET.Value > 0) and (dm.ads511sheet_BMP.AsVariant<>null) then
        try
         application.CreateForm(tForm_quoteinvt,Form_quoteinvt);
         Form_quoteinvt.ads28.Close;
         Form_quoteinvt.ads28.Parameters[0].Value:=dm.ADSA85QUOTE_TYPE.Value;
         Form_quoteinvt.ads28.Parameters[1].Value:=trim(edit6.Text)+'%';
         Form_quoteinvt.ads28.open;
         if Form_quoteinvt.ads28.IsEmpty then
          messagedlg('没有找到可用的报价材料!',mtinformation,[mbcancel],0)
         else
         if Form_quoteinvt.ShowModal=mrok then
         begin
          sgrid1.Cells[0,sgrid1.RowCount-1] :=Form_quoteinvt.ads28INV_PART_NUMBER.Value;
          sgrid1.Cells[1,sgrid1.RowCount-1] :=Form_quoteinvt.ads28INV_DESCRIPTION.Value;
          sgrid1.Cells[2,sgrid1.RowCount-1] :=Form_quoteinvt.ads28ABBR_NAME.Value;
          sgrid1.Cells[3,sgrid1.RowCount-1] :=Form_quoteinvt.ads28UNIT_NAME.Value;

          sgrid1.Cells[4,sgrid1.RowCount-1] :=Form_quoteinvt.ads28price1.AsString;  //本币
          sgrid1.Cells[7,sgrid1.RowCount-1] :=Form_quoteinvt.ads28QTE_PRICE.AsString;  //原币

          sgrid1.Cells[5,sgrid1.RowCount-1] :=floattostr(1/dm.ADSA85QTE_USHEET.value); //'PCS用量';
          sgrid1.Cells[6,sgrid1.RowCount-1] :=formatfloat('0.000000',
                                               strtofloat(sgrid1.Cells[5,sgrid1.RowCount-1])*
                                               strtofloat(sgrid1.Cells[4,sgrid1.RowCount-1]));//'PCS成本';
          sgrid1.Cells[8,sgrid1.RowCount-1] :=Form_quoteinvt.ads28RKEY.AsString; //'价格标识';
          sgrid1.Cells[9,sgrid1.RowCount-1] :=Form_quoteinvt.ads28d0017_rkey.AsString; //'材料标识';
          sgrid1.Cells[10,sgrid1.RowCount-1] :='1';
          sgrid1.RowCount:=sgrid1.RowCount+1;
          button1.Enabled:=false;      //不能再拼版
          button2.Enabled:=false;
          speedbutton3.Enabled:=false;
          dbradiogroup1.Enabled:=false;  //销售方式不能再改(单价已确定)
                                         //材料成本的计算与拼版及销售方式有关
          dbedit20.ReadOnly:=true;
          dbedit21.ReadOnly:=true;
          dbedit22.ReadOnly:=true;
         end
         else
          edit6.SetFocus;
        finally
         Form_quoteinvt.Free;
        end
        else
         messagedlg('请首先确定每张大料开PCS数量!',mtinformation,[mbcancel],0);  }

      if (dm.ADSA85USHEET.Value > 0) and (dm.ads511sheet_BMP.AsVariant<>null) then
      try
             application.CreateForm(tForm_quoteinvt,Form_quoteinvt);
             Form_quoteinvt.ads28.Close;
             Form_quoteinvt.ads28.Parameters[0].Value:=dm.ADSA85QUOTE_TYPE.Value;
             Form_quoteinvt.ads28.Parameters[1].Value:= trim(edit6.Text)+'%';

              if ( SGrid1.RowCount <= 2 ) and  (SGrid1.Cells[1,1] = '' )  then
               begin
                  Form_quoteinvt.ads28.Parameters[0].Value:= 0;
                  Form_quoteinvt.ads28.Parameters[1].Value:= '%%';
               end; {}

             Form_quoteinvt.ads28.open;

            if Form_quoteinvt.ads28.IsEmpty then
                messagedlg('没有找到可用的报价材料!',mtinformation,[mbcancel],0)
            else
            if Form_quoteinvt.ShowModal=mrok then
            begin
                sgrid1.Cells[0,sgrid1.RowCount-1] := Form_quoteinvt.ads28INV_PART_NUMBER.Value;
                sgrid1.Cells[1,sgrid1.RowCount-1] := Form_quoteinvt.ads28INV_DESCRIPTION.Value;
                sgrid1.Cells[2,sgrid1.RowCount-1] := Form_quoteinvt.ads28ABBR_NAME.Value;
                sgrid1.Cells[3,sgrid1.RowCount-1] := Form_quoteinvt.ads28UNIT_NAME.Value;

                sgrid1.Cells[4,sgrid1.RowCount-1] := Form_quoteinvt.ads28price1.AsString;  //本位币
                sgrid1.Cells[7,sgrid1.RowCount-1] := Form_quoteinvt.ads28QTE_PRICE.AsString;  //原币

                sgrid1.Cells[5,sgrid1.RowCount-1] := floattostr(1/dm.ADSA85USHEET.value); //'PCS用量';
                sgrid1.Cells[6,sgrid1.RowCount-1] := formatfloat('0.000000',
                                                        strtofloat(sgrid1.Cells[5,sgrid1.RowCount-1])*
                                                        strtofloat(sgrid1.Cells[4,sgrid1.RowCount-1])); //'PCS成本';
                sgrid1.Cells[8,sgrid1.RowCount-1] := Form_quoteinvt.ads28RKEY.AsString;       //'价格标识';
                sgrid1.Cells[9,sgrid1.RowCount-1] := Form_quoteinvt.ads28d0017_rkey.AsString; //'材料标识';
                sgrid1.Cells[10,sgrid1.RowCount-1] :='1';
                if Form_quoteinvt.ads28rkey496.AsInteger in [2,30] then
                    sgrid1.Cells[11,sgrid1.RowCount-1] :='主料'
                else
                    sgrid1.Cells[11,sgrid1.RowCount-1] :='辅料';                                   //压合比例
                sgrid1.RowCount:=sgrid1.RowCount+1;
                button1.Enabled:=false;      //不能再拼版
                button2.Enabled:=false;
                speedbutton3.Enabled:=false;
                dbradiogroup1.Enabled:=false;  //销售方式不能再改(单价已确定)
                                               //材料成本的计算与拼版及销售方式有关
                dbedit20.ReadOnly:=true;
                dbedit21.ReadOnly:=true;
                dbedit22.ReadOnly:=true;
            end
            else
            edit6.SetFocus;
      finally
       Form_quoteinvt.Free;
      end
      else
       messagedlg('请首先确定每平米大料开PCS数量!',mtinformation,[mbcancel],0);
end;

procedure TForm2.BitBtn10Click(Sender: TObject);
begin
if (dm.ADSA85USHEET.Value > 0) and (dm.ads511sheet_BMP.AsVariant<>null) then
try
 application.CreateForm(tform_baseprice,form_baseprice);
 if form_baseprice.ShowModal=mrok then
  begin
   edit7.Text:=form_baseprice.ADOQuery1ROW_NAME.Value;
   dm.ADSA85ENGR_ROUTE_PTR.Value:=form_baseprice.ADOQuery1rkey.Value;
   dm.ADSA85BASE_PRICE.Value:=form_baseprice.ADOQuery1ROW_VALUE.Value;
   self.get_technics(dm.ADSA85ENGR_ROUTE_PTR.Value);
   if form_baseprice.ADOQuery1PROD_ROUTE_PTR.Value>0 then
    begin
      dm.ADSA85PROD_ROUTE_PTR.Value:=form_baseprice.ADOQuery1PROD_ROUTE_PTR.Value;
      with dm.ADOQuery1 do
      begin
        close;
        sql.Text:='select CODE,QTE_APPROV_DESC from data0264 '+
                  'where rkey='+dm.ADSA85PROD_ROUTE_PTR.AsString;
        open;
        edit5.Text:=fieldbyname('CODE').AsString;
        label26.Caption:=fieldbyname('QTE_APPROV_DESC').AsString;
      end;
    end;
  end;
finally
 form_baseprice.Free;
end
else
 messagedlg('请首先开料并确定每平米大料开PCS数量!',mtinformation,[mbcancel],0);
end;

procedure TForm2.N3Click(Sender: TObject);
begin
if dm.ADSA85ENGR_ROUTE_PTR.Value>0 then
try
 application.CreateForm(tForm_technics,Form_technics);
 if Form_technics.ShowModal=mrok then
  begin
   sgrid2.Cells[0,sgrid2.RowCount-1] := inttostr(sgrid2.RowCount-1);
   sgrid2.Cells[1,sgrid2.RowCount-1] := Form_technics.ADOQuery1ADDER_NAME.Value;
   sgrid2.Cells[2,sgrid2.RowCount-1] := Form_technics.ADOQuery1cac_meoth.Value;// '计价模式';
   sgrid2.Cells[3,sgrid2.RowCount-1] := '0';//PCS成本
   sgrid2.Cells[4,sgrid2.RowCount-1] := '0';//平米成本
   sgrid2.Cells[5,sgrid2.RowCount-1] := Form_technics.ADOQuery1FORMULA.Value; //'公式';
   sgrid2.Cells[6,sgrid2.RowCount-1] := Form_technics.ADOQuery1MIN_VALUE.Value; //'最小值';
   sgrid2.Cells[7,sgrid2.RowCount-1] := Form_technics.ADOQuery1MAX_VALUE.Value; //'最大值';
   sgrid2.Cells[8,sgrid2.RowCount-1] := Form_technics.ADOQuery1rkey.AsString; //'工艺标识';

   sgrid2.Cells[9,sgrid2.RowCount-1] :=Form_technics.ADOQuery1rate_margin.AsString;
   sgrid2.Cells[10,sgrid2.RowCount-1] :='0';

   sgrid2.RowCount:=sgrid2.RowCount+1;
   self.append_data0431(Form_technics.ADOQuery1rkey.Value);
  end;
finally
 Form_technics.free;
end
else messagedlg('请先选择基价类型!',mtinformation,[mbcancel],0);
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
try
 Application.CreateForm(TFrm_PcbCut, Frm_PcbCut);
 Frm_PcbCut.Label36.Caption:=dm.ADSA85REF_PART_NO.Value;
 Frm_PcbCut.Label34.Caption:=edit1.Text;
 Frm_PcbCut.Edit6.Text:=dm.ADSA85UNIT_LEN.AsString;
 Frm_PcbCut.Edit7.Text:=dm.ADSA85UNIT_WTH.AsString;
 Frm_PcbCut.Edit8.Text:=dm.ADSA85TUNITS.AsString;

 if Frm_PcbCut.ShowModal=mrok then
  self.update_511;
finally
 Frm_PcbCut.Free;
end;
end;

procedure TForm2.BitBtn11Click(Sender: TObject);
var i:integer;
    vcost,vcost2,vcost3:double;
begin
 if dm.ADSA85CURR_RATE.Value<=0 then
  begin
   messagedlg('请首先确定货币及汇率！',mterror,[mbcancel],0);
   exit;
  end;

 if trim(Edit7.Text)='' then
  begin
   messagedlg('请选择基价名称！',mterror,[mbcancel],0);
   Edit7.SetFocus;
   exit;
  end;

 if sgrid1.RowCount=2 then
 if messagedlg('没有选择大料是否继续?',mtconfirmation,[mbyes,mbno],0)=mryes then
   dm.ADSA85MATL_COST.Value:=0
 else begin
  sgrid1.SetFocus;
  exit;
 end;

 if sgrid2.RowCount=2 then
 if messagedlg('没有选择特别工艺是否继续?',mtconfirmation,[mbyes,mbno],0)=mryes then
   dm.ADSA85ovhd_cost.Value:=0
 else begin
  sgrid2.SetFocus;
  exit;
 end;

 dm.ADSA85MATL_COST.Value :=0;       //单PCS材料成本
 dm.ADSA85base_pcscost.Value:=0;     //单PCS基价成本
 dm.ADSA85ovhd_cost.Value :=0;       //单PCS工艺成本
 dm.ADSA85ovhd_N_cost.Value :=0;     //财务单PCS工艺成本

 for i:=1 to sgrid1.RowCount-2 do
  dm.ADSA85MATL_COST.Value := dm.ADSA85MATL_COST.Value+         //材料成本PCS
                              strtofloat(sgrid1.Cells[6,i])*    //pcs材料价格
                              StrToFloat(sgrid1.Cells[10,i]);     //压合比例

if dm.qte_type=1 then        //基本加工费折让法
 dm.ADSA85base_pcscost.Value:=roundto(dm.ADSA85BASE_PRICE.Value/
                                      dm.ADSA85USHEET.Value,-6) //pcs基价成本
else                        //总折价率法    (已知每平米钱计算单PCS钱)
 dm.ADSA85base_pcscost.Value:=dm.ADSA85BASE_PRICE.Value*
    (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001)/dm.ADSA85TUNITS.Value;

 dm.ads431.DisableControls;
 for i:=1 to sgrid2.RowCount-2 do
  begin
   vcost:=0;
   vcost2:=0;
   vcost3:=0;
   if trim(sgrid2.Cells[5,i])<>'' then      //正常公式
    begin
     try
      dm.ADOQuery1.Close;
      sgrid2.Cells[5,i]:= StringReplace(sgrid2.Cells[5,i], #$D#$A, '', [rfReplaceAll]);
      dm.ADOQuery1.SQL.Text := caltooling(' '+trim(sgrid2.Cells[5,i])+' ');
      dm.ADOQuery1.Prepared;
      dm.ADOQuery1.Open;
     except
       MessageDlg('警告: '+trim(sgrid2.Cells[1,i])
          +' 无法正确生成特别工艺值,请检查相关参数是否已赋值！', mtInformation, [mbOK],0);
       dm.ads431.EnableControls;
       exit;
     end;
     vcost:=dm.ADOQuery1.FieldValues['vqty'];
    end;

   if trim(sgrid2.Cells[6,i])<>'' then    //最小值公式
    begin
     try
      dm.ADOQuery1.Close;
      sgrid2.Cells[6,i]:= StringReplace(sgrid2.Cells[6,i], #$D#$A, '', [rfReplaceAll]);
      dm.ADOQuery1.SQL.Text := caltooling(' '+trim(sgrid2.Cells[6,i])+' ');
      dm.ADOQuery1.Prepared;
      dm.ADOQuery1.Open;
     except
       MessageDlg('警告: '+trim(sgrid2.Cells[1,i])
          +' 无法正确生成特别工艺最小值,请检查相关参数是否已赋值！', mtInformation, [mbOK],0);
       dm.ads431.EnableControls;
       exit;
     end;
     vcost2:=dm.ADOQuery1.FieldValues['vqty'];
    end;

   if trim(sgrid2.Cells[7,i])<>'' then
    begin
     try
      dm.ADOQuery1.Close;
      sgrid2.Cells[7,i]:= StringReplace(sgrid2.Cells[7,i], #$D#$A, '', [rfReplaceAll]);
      dm.ADOQuery1.SQL.Text := caltooling(' '+trim(sgrid2.Cells[7,i])+' ');
      dm.ADOQuery1.Prepared;
      dm.ADOQuery1.Open;
     except
      MessageDlg('警告: '+trim(sgrid2.Cells[1,i])
       +' 无法正确生成特别工艺最大值,请检查相关参数是否已赋值！', mtInformation, [mbOK],0);
      dm.ads431.EnableControls;
      exit;
     end;
     vcost3:=dm.ADOQuery1.FieldValues['vqty'];
    end;

    if (vcost2 <> 0) and (vcost < vcost2) then //小于最小值
     vcost:=vcost2
    else
     if (vcost3 <> 0) and (vcost > vcost3) then  //大于最大值
      vcost:=vcost3;

    if sgrid2.Cells[2,i]='金额' then
     sgrid2.Cells[3,i]:=formatfloat('0.000000',vcost)
    else
     sgrid2.Cells[3,i]:=formatfloat('0.000000',vcost*
                        dm.ADSA85base_pcscost.Value);

    sgrid2.Cells[10,i]:=FormatFloat('0.000000',
       StrToFloat(SGrid2.Cells[3,i])*(1-StrToFloat(SGrid2.Cells[9,i])*0.01));

  if dm.qte_type=1 then        //基本加工费折让法(每平米成本)
   sgrid2.Cells[4,i]:=formatfloat('0.000000',
                        strtofloat(sgrid2.Cells[3,i])*dm.ADSA85USHEET.Value)
  else
   sgrid2.Cells[4,i]:=formatfloat('0.000000',
                        strtofloat(sgrid2.Cells[3,i])*dm.ADSA85TUNITS.Value/
                        (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));

   dm.ADSA85ovhd_cost.Value := dm.ADSA85ovhd_cost.Value+
                              strtofloat(sgrid2.Cells[3,i]); //工艺成本PCS

   dm.ADSA85ovhd_N_cost.Value := dm.ADSA85ovhd_N_cost.Value+
                              strtofloat(sgrid2.Cells[10,i]); //财务工艺总成本

  end;                      //结束FOR特别工艺循环

 dm.ads431.EnableControls;
 dm.ADSA85total_cost.Value := dm.ADSA85MATL_COST.Value +     //总成本pcs
                              dm.ADSA85base_pcscost.Value+
                              dm.ADSA85ovhd_cost.Value;

 dm.ADSA85total_N_cost.Value := dm.ADSA85MATL_COST.Value +     //财务总成本pcs
                              dm.ADSA85base_pcscost.Value+
                              dm.ADSA85ovhd_N_cost.Value;

 dm.ADSA85CRP_EST_QUANTITY.Value := dm.ADSA85total_cost.Value*  //额外加价PCS
                                   dm.ADSA85CUST_QTE_FACTOR.Value*0.01;
 dm.ADSA85CRPEST_N_cost.Value := dm.ADSA85total_N_cost.Value*  //财务额外加价PCS
                                   dm.ADSA85CUST_QTE_FACTOR.Value*0.01;

 dm.ADSA85QTE_UNITS.Value := dm.ADSA85total_cost.Value+      //实际报价PCS
                             dm.ADSA85CRP_EST_QUANTITY.Value;

 dm.ADSA85comm_cost.Value:= dm.ADSA85QTE_UNITS.Value*
                            dm.ADSA85SALES_DISCOUNT.Value*0.01; //折扣金额PCS

 dm.ADSA85SHIPPING_CHARGE.Value := dm.ADSA85comm_cost.Value;  //价格折让PCS
 dm.ADSA85SHIPPING_N_CHARGE.Value:=dm.ADSA85total_N_cost.Value+   //财务折让金额
                                  dm.ADSA85CRPEST_N_cost.Value-
                                  dm.ADSA85QTE_UNITS.Value+
                                  dm.ADSA85comm_cost.Value;

 dm.ADSA85rate_margin.Value:=ExRoundTo(((dm.ADSA85QTE_UNITS.Value*(1-dm.ADSA85SALES_DISCOUNT.Value*0.01)-
                             dm.ADSA85total_cost.Value*(1+dm.ADSA85CUST_QTE_FACTOR.Value*0.01))/
                             dm.ADSA85QTE_UNITS.Value)*100,2);    //毛利

 dm.ADSA85MARKUP.Value:=ExRoundTo(((dm.ADSA85QTE_UNITS.Value*(1-dm.ADSA85SALES_DISCOUNT.Value*0.01)-
                             dm.ADSA85total_N_cost.Value*(1+dm.ADSA85CUST_QTE_FACTOR.Value*0.01))/
                             dm.ADSA85QTE_UNITS.Value)*100,2);    //财务毛利

 dm.ADSA85quote_price.Value := roundto(dm.ADSA85QTE_UNITS.Value/dm.ADSA85CURR_RATE.Value,-6);
 dm.ADSA85quote_taxprice.Value := roundto(dm.ADSA85quote_price.Value*
                                  (1+dm.ADSA85vatax.Value*0.01),-6);
                                  
if dm.qte_type=1 then
 begin
   edit8.Text:=formatfloat('0.000000',dm.ADSA85MATL_COST.value*dm.ADSA85USHEET.Value);
   edit9.Text:=formatfloat('0.000000',dm.ADSA85base_pcscost.value*dm.ADSA85USHEET.Value);
   edit10.Text:=formatfloat('0.000000',dm.ADSA85ovhd_cost.value*dm.ADSA85USHEET.Value);
   edit11.Text:=formatfloat('0.000000',dm.ADSA85total_cost.value*dm.ADSA85USHEET.Value);
   edit12.Text:=formatfloat('0.000000',dm.ADSA85CRP_EST_QUANTITY.value*dm.ADSA85USHEET.Value);
   edit13.Text:=formatfloat('0.000000',dm.ADSA85comm_cost.value*dm.ADSA85USHEET.Value);
   edit14.Text:=formatfloat('0.000000',dm.ADSA85SHIPPING_CHARGE.value*dm.ADSA85USHEET.Value);
   edit15.Text:=formatfloat('0.000000',dm.ADSA85QTE_UNITS.value*dm.ADSA85USHEET.Value);
   edit16.Text:=formatfloat('0.000000',dm.ADSA85quote_price.value*dm.ADSA85USHEET.Value);
   edit17.Text:=formatfloat('0.000000',dm.ADSA85quote_taxprice.value*dm.ADSA85USHEET.Value);
 end
else
 begin
   edit8.Text:=formatfloat('0.000000',dm.ADSA85MATL_COST.value*dm.ADSA85TUNITS.Value/
                        (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
   edit9.Text:=formatfloat('0.000000',dm.ADSA85base_pcscost.value*dm.ADSA85TUNITS.Value/
                        (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
   edit10.Text:=formatfloat('0.000000',dm.ADSA85ovhd_cost.value*dm.ADSA85TUNITS.Value/
                        (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
   edit11.Text:=formatfloat('0.000000',dm.ADSA85total_cost.value*dm.ADSA85TUNITS.Value/
                        (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
   edit12.Text:=formatfloat('0.000000',dm.ADSA85CRP_EST_QUANTITY.value*dm.ADSA85TUNITS.Value/
                        (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
   edit13.Text:=formatfloat('0.000000',dm.ADSA85comm_cost.value*dm.ADSA85TUNITS.Value/
                        (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
   edit14.Text:=formatfloat('0.000000',dm.ADSA85SHIPPING_CHARGE.value*dm.ADSA85TUNITS.Value/
                        (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
   edit15.Text:=formatfloat('0.000000',dm.ADSA85QTE_UNITS.value*dm.ADSA85TUNITS.Value/
                        (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
   edit16.Text:=formatfloat('0.000000',dm.ADSA85quote_price.value*dm.ADSA85TUNITS.Value/
                        (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
   edit17.Text:=formatfloat('0.000000',dm.ADSA85quote_taxprice.value*dm.ADSA85TUNITS.Value/
                        (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
 end;

 if combobox1.ItemIndex=1 then        //如果报价以SET计算
 begin
  dm.ADSA85MATL_COST.value:=dm.ADSA85MATL_COST.value*dm.ADSA85TUNITS.Value;
  dm.ADSA85base_pcscost.value:=dm.ADSA85base_pcscost.value*dm.ADSA85TUNITS.Value;
  dm.ADSA85ovhd_cost.value:=dm.ADSA85ovhd_cost.value*dm.ADSA85TUNITS.Value;
  dm.ADSA85total_cost.value:=dm.ADSA85total_cost.value*dm.ADSA85TUNITS.Value;
  dm.ADSA85CRP_EST_QUANTITY.value:=dm.ADSA85CRP_EST_QUANTITY.value*dm.ADSA85TUNITS.Value;
  dm.ADSA85comm_cost.value:=dm.ADSA85comm_cost.value*dm.ADSA85TUNITS.Value;
  dm.ADSA85SHIPPING_CHARGE.value:=dm.ADSA85SHIPPING_CHARGE.value*dm.ADSA85TUNITS.Value;
  dm.ADSA85QTE_UNITS.value:=dm.ADSA85QTE_UNITS.value*dm.ADSA85TUNITS.Value;
  dm.ADSA85quote_price.value:=dm.ADSA85quote_price.value*dm.ADSA85TUNITS.Value;
  dm.ADSA85quote_taxprice.value:=dm.ADSA85quote_taxprice.value*dm.ADSA85TUNITS.Value;
 end;
 dm.ADSA85QTE_CONTROL5.Value:='Y';
self.change_enable;
end;

procedure TForm2.BitBtn12Click(Sender: TObject);
begin
 if bitbtn1.Enabled then
  begin
   self.change_enable;
   dm.ADSA85QTE_CONTROL5.Value:='N';
   sgrid1.PopupMenu:=popupmenu2;
   sgrid2.PopupMenu:=popupmenu3;
//20170321tang-放开可编辑PNL长宽，PCS数/拼板数-------

//end 20170321tang----
  end
 else
  messagedlg('检查时不能重算!',mterror,[mbcancel],0);
end;

procedure TForm2.DBEdit31KeyPress(Sender: TObject; var Key: Char);
begin
if bitbtn11.Enabled then abort;
if (key = chr(46)) then  //如果是小数点
if pos('.',(sender as TDBEdit).Text)>0 then  //小数点不能重复
  abort;
end;

procedure TForm2.DBEdit31Exit(Sender: TObject);
begin
if trim(dbedit31.Text)='' then dm.ADSA85quote_price.Value:=0;
dm.ADSA85quote_price.AsString:=dbedit31.Text;
dm.ADSA85quote_price.AsString:=formatfloat('0.000000',dm.ADSA85quote_price.value);
dm.ADSA85quote_taxprice.Value:=roundto(dm.ADSA85quote_price.Value*
                              (1+dm.ADSA85vatax.Value*0.01),-6);
self.price_change();
end;

procedure TForm2.DBEdit32Exit(Sender: TObject);
begin
if trim(dbedit32.Text)='' then dm.ADSA85quote_taxprice.Value:=0;
dm.ADSA85quote_taxprice.AsString:=dbedit32.Text;
dm.ADSA85quote_taxprice.AsString:=formatfloat('0.000000',dm.ADSA85quote_taxprice.value);
dm.ADSA85quote_price.Value:=roundto(dm.ADSA85quote_taxprice.Value/
                              (1+dm.ADSA85vatax.Value*0.01),-6);
self.price_change();
end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
begin
if trim(dbedit1.Text)='' then
 begin
  messagedlg('报价编号不能为空!',mtinformation,[mbcancel],0);
  self.PageControl1.ActivePageIndex:=0;
  dbedit1.SetFocus;
  exit;
 end;
if not dm.ADO04.Active then dm.ADO04.Open;
 if (dm.ADO04SEED_FLAG.Value<>1) and (dm.ADSA85.State=dsinsert) then
  if not (dbedit1.Text[length(trim(dbedit1.Text))] in ['0'..'9']) then
   begin
    messagedlg('报价编号最后一位必需是一个整数!',mtinformation,[mbok],0);
    self.PageControl1.ActivePageIndex:=0;
    dbedit1.SetFocus;
    exit;
   end;
if trim(edit2.Text)='' then
 begin
  messagedlg('货币代码不能为空!',mtinformation,[mbcancel],0);
  self.PageControl1.ActivePageIndex:=0;
  edit2.SetFocus;
  exit;
 end;
if trim(edit3.Text)='' then
 begin
  messagedlg('销售代表不能为空!',mtinformation,[mbcancel],0);
  self.PageControl1.ActivePageIndex:=0;
  edit3.SetFocus;
  exit;
 end;
if trim(edit4.Text)='' then
 begin
  messagedlg('产品类型不能为空!',mtinformation,[mbcancel],0);
  self.PageControl1.ActivePageIndex:=0;
  edit4.SetFocus;
  exit;
 end;
if trim(edit5.Text)='' then
 begin
  messagedlg('审批流程不能为空!',mtinformation,[mbcancel],0);
  self.PageControl1.ActivePageIndex:=0;
  edit5.SetFocus;
  exit;
 end;


{if bitbtn11.Enabled then
 begin
  messagedlg('没有完成计算不能保存!',mtinformation,[mbcancel],0);
  self.PageControl1.ActivePageIndex:=2;
  bitbtn11.SetFocus;
  exit;
 end;
}
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
 dm.ADSA85QTE_UNIT_PTR.Value := combobox1.ItemIndex+1; //报价单元
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
  dSum:Double;
  i:Integer;
begin
    if dm.ADSA85.State=dsInsert then //新增
    begin
          if self.invo_number_error(trim(dbedit1.Text)) then
           begin
            dm.ADO04.Close;
            dm.ADO04.Open;
            if dm.ADO04SEED_FLAG.Value<>1 then
            begin
             if messagedlg('发票编号重复可能多人同时新增,是否自动更新编号为:'+
              dm.ado04SEED_VALUE.Value,mtconfirmation,[mbyes,mbno],0)=mryes then
                dm.ADSA85TNUMBER.Value:=dm.ADO04SEED_VALUE.Value
             else begin
              PageControl1.ActivePageIndex:=0;
              dbedit1.SetFocus;
              exit;
             end;
            end
            else
             begin
              messagedlg('发票编号重复!请手工重新输入',mterror,[mbok],0);
              self.PageControl1.ActivePageIndex:=0;
              dbedit1.SetFocus;
              exit;
             end;
           end;
          dm.ADOConnection1.BeginTrans;
          try
           screen.Cursor:=crhourglass;
           dm.ADSA85ENTER_DATE.Value:=getsystem_date(dm.ADOQuery1,0);
           dm.ADSA85.Post;
           if not dm.ads511.IsEmpty then
           begin
            dm.ads511.Edit;
            dm.ads511source_ptr.Value:=dm.ADSA85RKEY.Value;
            dm.ads511.Post;
            dm.ads511.UpdateBatch();      //拼版保存
           end;
           dm.ads431.DisableControls;
           dm.ads431.First;
           while not dm.ads431.Eof do
           begin
            dm.ads431.Edit;
            dm.ads431QTE_PTR.Value:=dm.ADSA85RKEY.Value;
            dm.ads431.Post;
            dm.ads431.Next;
           end;
           dm.ads431.EnableControls;
           dm.ads431.UpdateBatch();    //参数保存

           self.update_intvent(dm.ADSA85RKEY.Value);
           self.update_technice(dm.ADSA85RKEY.Value);
           self.update_tools432(dm.ADSA85RKEY.Value); //保存工具费用
           self.update_Cost8501(dm.ADSA85RKEY.Value); //保存其他费用
            //chenyang2014-04-26 修改添加订单价格明细-----
              dm.Ado578.Close;
              dm.Ado578.Open;

                for i := 1 to StringGrid3.RowCount-1 do
                begin
                      if (StrToFloat(StringGrid3.Cells[1,i])>0) then
                      begin
                        dm.Ado578.Append;
                        dm.Ado578.FieldByName('d579_Ptr').AsString:=StringGrid3.Cells[2,i];
                        dm.Ado578.Fieldvalues['d85_Ptr']:=  dm.ADSA85RKEY.Value;
                        dm.Ado578.FieldByName('Price').AsString:=StringGrid3.Cells[1,i];
                        dm.Ado578.Post;
                      end;
                end;
                dm.Ado578.UpdateBatch();
                //chenyang2014-04-26 ----------------------

           dm.ADO04.Close;
           dm.ADO04.Open;
           if dm.ADO04SEED_FLAG.Value<>1 then
            self.update_04(trim(dm.ADO04SEED_VALUE.Value));
           screen.Cursor:=crdefault;

           dm.ADOConnection1.CommitTrans;
           if checkbox1.Checked then   //打印报表
           form1.print_report(dm.ADSA85RKEY.Value);
           v_close:=1; //正常退出
           self.ModalResult:=mrok;
          except
           on E: Exception do
            begin
             dm.ADOConnection1.RollbackTrans;
             screen.Cursor:=crdefault;
             messagedlg(E.Message,mterror,[mbcancel],0);
            end;
          end;
    end
    else  //编辑
    begin
            dm.ADOConnection1.BeginTrans;
            TRY
                 dm.ADSA85QTE_DATE.Value:=getsystem_date(dm.adoquery1,1);
                 dm.ADSA85QBY_EMPL_PTR.AsString:=user_ptr; //报价人员
                 dm.ADSA85APPRV_DATE.AsVariant:=null;
                 dm.ADSA85.Post;
                 dm.ads511.UpdateBatch();      //拼版保存
                 dm.ads431.UpdateBatch();    //参数保存

                 self.update_intvent(dm.ADSA85RKEY.Value);
                 self.update_technice(dm.ADSA85RKEY.Value);
                 self.update_tools432(dm.ADSA85RKEY.Value); //保存工具费用
                 self.update_Cost8501(dm.ADSA85RKEY.Value);

                  //chenyang2014-04-26 修改添加订单价格明细-----
                  with dm.adoS578 do
                  begin
                          Close;
                          Parameters.ParamByName('rkey').Value:= dm.ADSA85RKEY.Value;
                          Open;
                          while not Eof do Delete;
                  end;
                  dm.Ado578.Close;
                  dm.Ado578.Open;
                  for i := 1 to StringGrid3.RowCount-1 do
                  begin
                        if (StrToFloat(StringGrid3.Cells[1,i])>0) then
                        begin

                          dm.Ado578.Append;
                          dm.Ado578.FieldByName('d579_Ptr').AsString:=StringGrid3.Cells[2,i];
                          dm.Ado578.Fieldvalues['d85_Ptr']:=  dm.ADSA85RKEY.Value;
                          dm.Ado578.FieldByName('Price').AsString:=StringGrid3.Cells[1,i];
                          dm.Ado578.Post;
                        end;
                  end;
                  dm.Ado578.UpdateBatch();
                  //chenyang2014-04-26 ----------------------

                 dm.ADOConnection1.CommitTrans;
                 if checkbox1.Checked then   //打印报表
                 form1.print_report(dm.ADSA85RKEY.Value);
                 v_close:=1; //正常退出
                 self.ModalResult:=mrok;
            except
                on E: Exception do
                begin
                      dm.ADOConnection1.RollbackTrans;
                      messagedlg(E.Message,mterror,[mbcancel],0);
                end;
            end;
    end;
end;

procedure TForm2.DBEdit27KeyPress(Sender: TObject; var Key: Char);
begin
if (key = chr(46)) then  //如果是小数点
if pos('.',(sender as TDBEdit).Text)>0 then  //小数点不能重复
  abort;
end;

procedure TForm2.DBEdit19KeyPress(Sender: TObject; var Key: Char);
begin
//20170321tang注
//if not dm.ads511.IsEmpty then abort;
end;

procedure TForm2.DBEdit17KeyPress(Sender: TObject; var Key: Char);
begin
if (key = chr(46)) then  //如果是小数点
if pos('.',(sender as TDBEdit).Text)>0 then  //小数点不能重复
  abort;
//20170321tang注
//if not dm.ads511.IsEmpty then abort; 
end;

procedure TForm2.DBEdit31KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbedit31exit(sender);
end;

procedure TForm2.DBEdit32KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbedit32exit(sender);
end;

procedure TForm2.BitBtn13Click(Sender: TObject);
begin
  form1.print_report(dm.ADSA85RKEY.Value);
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
dm.ads511.Delete;
image1.Picture.Assign(nil);
image1.Canvas.Brush.Color:=clwhite;
button2.Enabled:=not button2.Enabled;
dbedit14.Enabled:=true;
bitbtn6.Enabled:=true;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
if not dm.ads511.IsEmpty then
 if self.SavePictureDialog1.Execute then
  image1.Picture.SaveToFile(self.SavePictureDialog1.FileName)
 else
else
 messagedlg('拼版图为空不能保存!',mterror,[mbcancel],0);
end;

procedure TForm2.DBEdit20Exit(Sender: TObject);
begin
  if find_spec_rkey('P') then //大料总PCS
   begin
    dm.ads431.Edit;
    dm.ads431UNIT_VALUE.Value:=dm.ADSA85QTE_USHEET.AsString;
    dm.ads431.Post;
   end;
end;

procedure TForm2.DBEdit20KeyPress(Sender: TObject; var Key: Char);
begin
if (key = chr(46)) then  //如果是小数点
  abort;
end;

procedure TForm2.DBEdit22Exit(Sender: TObject);
begin
  if find_spec_rkey('5') then //大料利用率
   begin
    dm.ads431.Edit;
    dm.ads431UNIT_VALUE.Value:=dm.ADSA85TUSAGE.AsString;
    dm.ads431.Post;
   end;
end;

procedure TForm2.DBEdit21Exit(Sender: TObject);
begin
  if find_spec_rkey('WB') then //一平米大料开PCS
   begin
    dm.ads431.Edit;
    dm.ads431UNIT_VALUE.Value:=dm.ADSA85USHEET.AsString;
    dm.ads431.Post;
   end;
end;

procedure TForm2.update_511();
begin
  dm.ADSA85TUSAGE.Value := dm.ads511TUSAGE.Value;;  //大料利用率
  dm.ADSA85QTE_USHEET.Value :=(dm.ads511TOTAL_PNLS_1.Value*dm.ads511UPANEL.Value
    +dm.ads511TOTAL_PNLS_2.Value*dm.ads511UPANEL_2.Value)*dm.ads511UNIT_NUM.Value; //每大料开实际PCS数


  if dm.ads511SHT_LEN.Value*dm.ads511SHT_WTH.Value > 0 then
   dm.ADSA85USHEET.Value := roundto(dm.ADSA85QTE_USHEET.Value/      //每平米大料开PCS数
      (dm.ads511SHT_LEN.Value*dm.ads511SHT_WTH.Value*0.000001),-2);

  dm.ADSA85UNIT_LEN.Value:=dm.ads511UNIT_LEN.Value;  //拼版长
  dm.ADSA85UNIT_WTH.Value:=dm.ads511UNIT_WTH.Value;  //拼版宽
  dm.ADSA85TUNITS.Value:=dm.ads511UNIT_NUM.Value;  //拼版单元数

  image1.Picture.Assign(Load_JPG_Pic_From_DB(dm.ads511sheet_BMP));
  //dbedit14.Enabled:=false;
  //bitbtn6.Enabled:=false;
  if not button2.Enabled then button2.Enabled:=true;
  if find_spec_rkey('P') then //大料总PCS
   begin
    dm.ads431.Edit;
    dm.ads431UNIT_VALUE.Value:=dm.ADSA85QTE_USHEET.AsString;
    dm.ads431.Post;
   end;
  if find_spec_rkey('5') then //大料利用率
   begin
    dm.ads431.Edit;
    dm.ads431UNIT_VALUE.Value:=dm.ADSA85TUSAGE.AsString;
    dm.ads431.Post;
   end;
  if find_spec_rkey('WA') then //单元面积
   begin
    dm.ads431.Edit;
    dm.ads431UNIT_VALUE.Value:=floattostr(dm.ADSA85UNIT_LEN.value*
                                          dm.ADSA85UNIT_WTH.Value*0.01);
    dm.ads431.Post;
   end;
  if find_spec_rkey('WB') then //一平米大料开PCS
   begin
    dm.ads431.Edit;
    dm.ads431UNIT_VALUE.Value:=dm.ADSA85USHEET.AsString;
    dm.ads431.Post;
   end;
  if find_spec_rkey('JN') then //交货单元数
   begin
    dm.ads431.Edit;
    dm.ads431UNIT_VALUE.Value:=dm.ADSA85TUNITS.AsString;
    dm.ads431.Post;
   end;
end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
var i:integer;
begin
 if dm.ADSA85CUST_PART_PTR.Value>0 then
 begin
  form_layersdata:=tform_layersdata.Create(application);
  if  form_layersdata.ShowModal=mrok then
  begin
   with dm.adoquery2 do
   begin
    close;
    sql.Text:='SELECT * FROM Data0502 WHERE source_ptr = '+form_layersdata.rkey25.Caption;
    open;
    if not isempty then
    begin
     if dm.ads511.IsEmpty then
      dm.ads511.Append
     else dm.ads511.edit;
     for i:=1 to 22 do
      dm.ads511.Fields[i].Value:=dm.ADOQuery2.FieldValues[dm.ads511.Fields[i].FieldName];

     close; //如果全局参数的利用率不为空，则以全局参数为准.andy-2008-10-20
     sql.Text:='select Data0279.parameter_value FROM Data0279 inner join data0278 '+
       'on data0279.PARAMETER_PTR=data0278.rkey '+
       'WHERE data0278.SPEC_RKEY=''5'' and Data0279.source_ptr = '+form_layersdata.rkey25.Caption;
     open;
     if (not isempty) and (Trim(fields[0].Value)<>'') then
      dm.ads511TUSAGE.Value:=fields[0].Value;

     dm.ads511source_ptr.Value:= dm.ADSA85RKEY.Value;
     dm.ads511.Post;
     self.update_511;
    end
    else messagedlg('报价所选产品工程还没有拼版数据!',mtinformation,[mbcancel],0);
   end;
  end;
  form_layersdata.Free;
 end
 else messagedlg('请首先确定本厂编号!',mtinformation,[mbcancel],0);
end;

procedure TForm2.N5Click(Sender: TObject);
var str:string;
begin
 str:=sgrid1.Cells[10,sgrid1.row];
 if inputquery('压合比例','请输入单PCS材料层压比例:    ',str) then
  if trim(str)<>'' then
   begin
    try
     StrToFloat(str);
    except
     showmsg('输入错误,请输正确的压合比例',1);
     exit;
    end;
    sgrid1.Cells[10,sgrid1.row]:=str;
   end;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if (bitbtn1.Enabled) and (v_close<>1) then
 if  (messagedlg('你确定不保存退出吗?',mtconfirmation,[mbyes,mbno],0)=mryes) then
  begin
   dm.ADSA85.Cancel;
   self.ModalResult:=mrcancel;
  end
 else
  CanClose:=false;
end;

procedure TForm2.BitBtn14Click(Sender: TObject);
var
 i:integer;
begin
if dm.ADSA85ENGR_ROUTE_PTR.Value > 0 then
 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select ROW_VALUE from data0346 '+
            'where rkey='+dm.ADSA85ENGR_ROUTE_PTR.AsString;
  open;
  dm.ADSA85BASE_PRICE.Value:=dm.ADOQuery1.FieldValues['ROW_VALUE'];
 end
else
 showmsg('请首先选定基价!',1);

if dm.ADSA85PROD_CODE_PTR.Value >0 then
 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select EST_SCRAP from data0008 '+
            'where rkey='+dm.ADSA85PROD_CODE_PTR.AsString;
  open;                                                           //额外加价
  dm.ADSA85CUST_QTE_FACTOR.Value:=dm.ADOQuery1.Fieldbyname('EST_SCRAP').AsCurrency;
 end;

if dm.ADSA85CURR_PTR.Value >0 then
 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select QTE_BASE_TO_OTHER from data0001 '+
            'where rkey='+dm.ADSA85CURR_PTR.AsString;
  open;                                                 //汇率
  dm.ADSA85CURR_RATE.Value:=dm.ADOQuery1.Fieldbyname('QTE_BASE_TO_OTHER').AsFloat;
 end;

if Trim(Edit1.Text) <> '' then
 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select sales_discount from data0010 '+
            'where CUST_CODE='+quotedstr(edit1.Text);
  open;                                                 //销售折扣
  if not IsEmpty then
  dm.ADSA85SALES_DISCOUNT.Value:=dm.ADOQuery1.Fieldbyname('sales_discount').AsCurrency;
 end;

 for i:=1 to sgrid1.RowCount-2 do           //更新材料价格
  begin
   with dm.ADOQuery1 do
    begin
     close;
     sql.Text:=
     'SELECT  dbo.Data0028.qte_price, dbo.Data0028.qte_price * dbo.Data0001.BASE_TO_OTHER AS price1 '+
     'FROM   dbo.Data0028 INNER JOIN '+
     'dbo.Data0001 ON dbo.Data0028.CURRENCY_PTR = dbo.Data0001.RKEY '+
     'where data0028.rkey='+ sgrid1.Cells[8,i];
     open;
     if not IsEmpty then
     begin
      sgrid1.Cells[4,i] :=fieldbyname('price1').AsString;      //本币
      sgrid1.Cells[7,i] :=fieldbyname('QTE_PRICE').AsString;   //原币
      sgrid1.Cells[6,i] :=formatfloat('0.000000',              //'PCS成本';
                                       strtofloat(sgrid1.Cells[5,i])*
                                       strtofloat(sgrid1.Cells[4,i]));
     end;
    end;
  end;

  ShowMsg('更新材料单价,汇率,报废率,销售折扣完成!',1);
end;

procedure TForm2.DBEdit19Exit(Sender: TObject);
begin
  if find_spec_rkey('JN') then //交货单元数
   begin
    dm.ads431.Edit;
    dm.ads431UNIT_VALUE.Value:=dm.ADSA85TUNITS.AsString;
    dm.ads431.Post;
   end;
end;

procedure TForm2.BitBtn15Click(Sender: TObject);
begin
 if dm.ADSA85CUST_PART_PTR.Value>0 then
 begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Text:='select PARAMETER_PTR,PARAMETER_VALUE from data0279 '+
            'where IES_PROD=1 and SOURCE_PTR='+dm.ADSA85CUST_PART_PTR.AsString+#13+
            'union all'+#13+
            'select PARAMETER_PTR,PARAMETER_VALUE from data0494 '+
            'where custpart_ptr='+dm.ADSA85CUST_PART_PTR.AsString;
    Prepared;
    open;
   end;
  dm.ads431.DisableControls;
  dm.ads431.First;
  while not dm.ads431.Eof do
   begin
    if trim(dm.ads431UNIT_VALUE.Value)='' then
    begin
     if dm.ADOQuery1.Locate('PARAMETER_PTR',dm.ads431UNIT_PTR.Value,[]) then
     begin
       dm.ads431.Edit;
       dm.ads431UNIT_VALUE.Value:=dm.ADOQuery1.fieldbyname('PARAMETER_VALUE').AsString;
       dm.ads431.Post;
     end;
    end;
    dm.ads431.Next;
   end;
  dm.ads431.First;
  dm.ads431.EnableControls;
 end
 else
  messagedlg('请首先读取工程的本厂编号!',mtinformation,[mbcancel],0); 
end;

procedure TForm2.DBEdit37Exit(Sender: TObject);
begin
 if trim(dbedit37.Text)='' then dm.ADSA85rate_margin.Value:=0;
  dm.ADSA85rate_margin.AsString:=dbedit37.Text;

 dm.ADSA85QTE_UNITS.Value:= dm.ADSA85total_cost.Value*(1+dm.ADSA85CUST_QTE_FACTOR.Value*0.01)/  //实际报价
                            (1-dm.ADSA85SALES_DISCOUNT.Value*0.01-dm.ADSA85rate_margin.Value*0.01);

 dm.ADSA85quote_price.Value:=roundto(dm.ADSA85QTE_UNITS.Value/
                                     dm.ADSA85CURR_RATE.Value,-6);
 dm.ADSA85quote_taxprice.Value:=roundto(dm.ADSA85quote_price.Value*
                              (1+dm.ADSA85vatax.Value*0.01),-6);
                              
  dm.ADSA85comm_cost.Value:=dm.ADSA85QTE_UNITS.Value*  //折扣金额
                            dm.ADSA85SALES_DISCOUNT.Value*0.01;

  dm.ADSA85SHIPPING_CHARGE.Value:=dm.ADSA85total_cost.Value+   //折让金额
                                  dm.ADSA85CRP_EST_QUANTITY.Value-
                                  dm.ADSA85QTE_UNITS.Value+
                                  dm.ADSA85comm_cost.Value;

 dm.ADSA85SHIPPING_N_CHARGE.Value:=dm.ADSA85total_N_cost.Value+   //财务折让金额
                                  dm.ADSA85CRPEST_N_cost.Value-
                                  dm.ADSA85QTE_UNITS.Value+
                                  dm.ADSA85comm_cost.Value;
 dm.ADSA85MARKUP.Value:=ExRoundTo(((dm.ADSA85QTE_UNITS.Value*(1-dm.ADSA85SALES_DISCOUNT.Value*0.01)-
                             dm.ADSA85total_N_cost.Value*(1+dm.ADSA85CUST_QTE_FACTOR.Value*0.01))/
                             dm.ADSA85QTE_UNITS.Value)*100,2);    //财务毛利


if combobox1.ItemIndex=0 then    //pcs报价
 begin
  if dm.qte_type=1 then  //基价折让
  begin
    edit13.Text:=formatfloat('0.000000',dm.ADSA85comm_cost.value*dm.ADSA85USHEET.Value);
    edit14.Text:=formatfloat('0.000000',dm.ADSA85SHIPPING_CHARGE.value*dm.ADSA85USHEET.Value);
    edit15.Text:=formatfloat('0.000000',dm.ADSA85QTE_UNITS.value*dm.ADSA85USHEET.Value);
    edit16.Text:=formatfloat('0.000000',dm.ADSA85quote_price.value*dm.ADSA85USHEET.Value);
    edit17.Text:=formatfloat('0.000000',dm.ADSA85quote_taxprice.value*dm.ADSA85USHEET.Value);
  end
  else                   //总价折让
  begin
    edit13.Text:=formatfloat('0.000000',dm.ADSA85comm_cost.value*dm.ADSA85TUNITS.Value/
                              (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
    edit14.Text:=formatfloat('0.000000',dm.ADSA85SHIPPING_CHARGE.value*dm.ADSA85TUNITS.Value/
                              (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
    edit15.Text:=formatfloat('0.000000',dm.ADSA85QTE_UNITS.value*dm.ADSA85TUNITS.Value/
                              (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
    edit16.Text:=formatfloat('0.000000',dm.ADSA85quote_price.value*dm.ADSA85TUNITS.Value/
                              (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
    edit17.Text:=formatfloat('0.000000',dm.ADSA85quote_taxprice.value*dm.ADSA85TUNITS.Value/
                              (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
  end;

 end
else             //SET报价
 begin
  if dm.qte_type=1 then
  begin
   edit13.Text:=formatfloat('0.000000',dm.ADSA85comm_cost.value*dm.ADSA85USHEET.Value/
                                     dm.ADSA85TUNITS.Value);
   edit14.Text:=formatfloat('0.000000',dm.ADSA85SHIPPING_CHARGE.value*dm.ADSA85USHEET.Value/
                                     dm.ADSA85TUNITS.Value);
   edit15.Text:=formatfloat('0.000000',dm.ADSA85QTE_UNITS.value*dm.ADSA85USHEET.Value/
                                     dm.ADSA85TUNITS.Value);
   edit16.Text:=formatfloat('0.000000',dm.ADSA85quote_price.value*dm.ADSA85USHEET.Value/
                                     dm.ADSA85TUNITS.Value);
   edit17.Text:=formatfloat('0.000000',dm.ADSA85quote_taxprice.value*dm.ADSA85USHEET.Value/
                                     dm.ADSA85TUNITS.Value);
  end
  else
   begin
    edit13.Text:=formatfloat('0.000000',dm.ADSA85comm_cost.value/
                                      (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
    edit14.Text:=formatfloat('0.000000',dm.ADSA85SHIPPING_CHARGE.value/
                                      (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
    edit15.Text:=formatfloat('0.000000',dm.ADSA85QTE_UNITS.value/
                                      (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
    edit16.Text:=formatfloat('0.000000',dm.ADSA85quote_price.value/
                                      (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
    edit17.Text:=formatfloat('0.000000',dm.ADSA85quote_taxprice.value/
                                      (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
   end;
 end;
                                                                                         
end;

procedure TForm2.DBEdit37KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbedit37exit(sender);

end;

procedure TForm2.DBEdit15Change(Sender: TObject);
var
  i: Integer;
begin
  with DM.AQtmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select distinct CUST_PART_NO from data0085 where CUST_PART_NO = '
      + QuotedStr(DBEdit15.Text);
    Open;
    if (not IsEmpty) and (Trim(DBEdit15.Text) <> Trim(DM.ADS85CUST_PART_NO.AsString)) then 
    begin
      Label59.Visible := True;
      Label59.Caption := '*已有报价记录';
      Timer1.Enabled := True;
    end
    else
      begin
        Label59.Visible := False;
        Timer1.Enabled := False;
      end;
  end;
end;

procedure TForm2.Timer1Timer(Sender: TObject);

begin
  if (Label59.visible = false) then
    Label59.visible := True

  else if (Label59.visible = True ) then
    Label59.visible := false
end;

procedure TForm2.StringGrid2KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
 if (pos('.',stringgrid2.Cells[stringgrid2.col,stringgrid2.row])>0)  then     //判断是否重复输入小数点'.'
  if key = chr(46)  then abort;
if (key <> chr(9)) then    //没有按tab键
 begin
  if (stringgrid2.Col=3) and (combobox4.Enabled) then
   begin
    ComboBox4.SetFocus;
    SendMessage(ComboBox4.Handle,WM_Char,word(Key),0);
   end;
 end;
end;


procedure TForm2.StringGrid2Exit(Sender: TObject);
var
  i,j,k:Integer;
begin
 if stringgrid2.Row<>stringgrid2.RowCount then
  begin
   if stringgrid2.Cells[1,stringgrid2.Row]='' then
    stringgrid2.Cells[1,stringgrid2.Row]:='0';
   if stringgrid2.Cells[2,stringgrid2.Row]='' then
    stringgrid2.Cells[2,stringgrid2.Row]:='0';

    stringgrid2.Cells[1,stringgrid2.Row]:=
     formatfloat('0.000',strtofloat(stringgrid2.Cells[1,stringgrid2.Row]));
    stringgrid2.Cells[2,stringgrid2.Row]:=
     formatfloat('0.000',strtofloat(stringgrid2.Cells[2,stringgrid2.Row]));
  end;

end;

procedure TForm2.StringGrid2DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
    if (gdSelected  in State) then
     begin
          if (ACol = 3) and (ARow<>stringgrid2.RowCount) then
           begin
            ComboBox4.Left := Rect.Left+1;
            ComboBox4.Top := Rect.Top+1;
            ComboBox4.Width := Rect.Right - Rect.Left+2;
          //  ComboBox4.Height := Rect.Bottom - Rect.Top;
            ComboBox4.Visible := True;
            combobox4.ItemIndex:=combobox4.Items.IndexOf(StringGrid2.Cells[acol,arow])
           end
          else
            ComboBox4.Visible :=false;

          if (ACol = 0) and (ARow<>stringgrid2.RowCount) then
           begin
            ComboBox5.Left := Rect.Left+1;
            ComboBox5.Top := Rect.Top+1;
            ComboBox5.Width := Rect.Right - Rect.Left+2;
           // ComboBox5.Height := Rect.Bottom - Rect.Top;
            ComboBox5.Visible := True;
            combobox5.ItemIndex:=combobox5.Items.IndexOf(StringGrid2.Cells[acol,arow])
           end
          else
            ComboBox5.Visible :=false;
     end;
end;

procedure TForm2.ComboBox4Change(Sender: TObject);
begin
 stringgrid2.Cells[3,stringgrid2.Row]:=combobox4.Text;
end;

procedure TForm2.ComboBox4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=13 then stringgrid2.SetFocus;
end;

procedure TForm2.StringGrid2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
  var
  R:TRect;
begin
       if (ACol = 3) and (ARow = stringgrid2.RowCount  ) then
          CanSelect:=false
       else
          CanSelect:=true;

        if stringgrid2.Row<>stringgrid2.RowCount-1 then
        begin
             if stringgrid2.Cells[1,stringgrid2.Row]='' then
              stringgrid2.Cells[1,stringgrid2.Row]:='0';
             if stringgrid2.Cells[2,stringgrid2.Row]='' then
              stringgrid2.Cells[2,stringgrid2.Row]:='0';
             stringgrid2.Cells[1,stringgrid2.Row]:=
             formatfloat('0.000',strtofloat(stringgrid2.Cells[1,stringgrid2.Row]));
             stringgrid2.Cells[2,stringgrid2.Row]:=
             formatfloat('0.000',strtofloat(stringgrid2.Cells[2,stringgrid2.Row]));
        end;

        if (ACol <> 0) and (ComboBox5.Visible = True) and (ComboBox5.Text <> '' )  then
        begin
             stringgrid2.Cells[0,stringgrid2.Row] := ComboBox5.Text;
        end;

        if (ACol = 2) then
           begin
                  stringgrid2.Options:=stringgrid2.Options-[goEditing];

                         StringGrid2.Cells[acol,arow] := formatfloat('0.000', ( strtofloat(DBEdit21.Text) * strtofloat(StringGrid2.Cells[acol-1,arow])));

           end
        else
          begin
            stringgrid2.Options:=stringgrid2.Options+[goEditing];
          end;
        if (ACol = 1) then
        begin
                  stringgrid2.Options:=stringgrid2.Options-[goEditing];
                  if  strtofloat(StringGrid2.Cells[acol + 1,arow]) <> 0.000 then
                  begin
                      StringGrid2.Cells[acol,arow] := formatfloat('0.000', (strtofloat(StringGrid2.Cells[acol+1,arow]) / strtofloat(DBEdit21.Text) ));
                  end;
        end  else begin
            stringgrid2.Options:=stringgrid2.Options+[goEditing];
        end;

        if (ACol = 4) then
        begin
                  stringgrid2.Options:=stringgrid2.Options-[goEditing];
                  if (ARow = Self.stringgrid2.RowCount-1) then
                  begin
                      stringgrid2.Cells[4,0]:='增';
                      SpeedButton5.Visible := False;
                      SpeedButton4.Visible := CanSelect;
                      if not CanSelect then Exit;
                      SpeedButton4.Parent := stringgrid2;
                      R := stringgrid2.CellRect(ACol, ARow);
                      SpeedButton4.BoundsRect := R;
                      SpeedButton4.Width := SpeedButton4.Height;
                      SpeedButton4.Left  := R.Right - 4 - SpeedButton4.Width;
                  end else if (ARow < Self.stringgrid2.RowCount-1) then begin
                        stringgrid2.Cells[4,0]:='删';
                        SpeedButton4.Visible := False;
                        SpeedButton5.Visible := CanSelect;
                        if not CanSelect then Exit;
                        SpeedButton5.Parent := stringgrid2;
                        R := stringgrid2.CellRect(ACol, ARow);
                        SpeedButton5.BoundsRect := R;
                        SpeedButton5.Width := SpeedButton5.Height;
                        SpeedButton5.Left  := R.Right - 4 - SpeedButton5.Width;
                  end;

        end  else begin
            stringgrid2.Options:=stringgrid2.Options+[goEditing];
             SpeedButton4.Visible := False;
             SpeedButton5.Visible := False;
        end;

end;

procedure TForm2.SpeedButton4Click(Sender: TObject);
begin

  if (Trim(stringgrid2.Cells[0,stringgrid2.Row]) = '' ) or ( Trim(stringgrid2.Cells[3,stringgrid2.Row]) = '') or
     ((StrToCurr(stringgrid2.Cells[1,stringgrid2.Row]) = 0.000 ) and  (StrToCurr(stringgrid2.Cells[2,stringgrid2.Row]) = 0.000 ))
  then
  begin
        ShowMessage('请先填写该行数据，数据为空不可以新增，谢谢！');
        if stringgrid2.RowCount > 2 then
        begin
            stringgrid2.Rows[stringgrid2.Row].Clear;
            stringgrid2.RowCount := stringgrid2.RowCount -1;
            Exit;
        end else  if stringgrid2.RowCount = 2 then
                  begin
                       stringgrid2.Rows[stringgrid2.Row].Clear;
                       Exit;
                  end;
  end else begin
          stringgrid2.RowCount := stringgrid2.RowCount + 1;
          Self.SpeedButton4.Visible:=False;
  end;


end;

procedure TForm2.SpeedButton5Click(Sender: TObject);
var i,j,k :Integer;
begin
  if  (stringgrid2.RowCount > 2) then
  begin
      stringgrid2.Rows[stringgrid2.Row].Clear;
      for i := stringgrid2.Row to  stringgrid2.RowCount - 1 do
      begin
               for j:= 0 to stringgrid2.ColCount do
               begin
                       stringgrid2.Cells[j,i] :=  stringgrid2.Cells[j,i+1];
               end;
      end;
      Self.SpeedButton5.Visible:=False;
      stringgrid2.RowCount := stringgrid2.RowCount - 1;
  end;
end;

procedure TForm2.ComboBox5Change(Sender: TObject);
begin
  stringgrid2.Cells[0,stringgrid2.Row]:=combobox5.Text;

end;

procedure TForm2.ComboBox5Exit(Sender: TObject);
var
   i:Integer;
begin

    stringgrid2.Cells[0,stringgrid2.Row]:=combobox5.Text;
    for i := 0  to  combobox5.Items.Count - 1 do
    begin
        if ComboBox5.Items.Strings[i] = ComboBox5.Text then
        begin
              Exit;
        end;
    end;
    combobox5.Items.Add(combobox5.Text);

end;

procedure TForm2.StringGrid3Exit(Sender: TObject);
var i:Integer;
begin
  for i :=1  to StringGrid3.RowCount-1 do
  begin
    if (Trim(StringGrid3.Cells[1,i])='') then
    StringGrid3.Cells[1,i]:='0.0000000';
  end;
end;


procedure TForm2.Button4Click(Sender: TObject);
var
  i : Integer;
  PriceEmptyBoard: Double;
begin
           PriceEmptyBoard := 0.00;
           for   i := 1 to StringGrid2.RowCount - 1 do
           begin
                if  StringGrid2.Cells[0,i] = 'SMT' then
                begin
                   StringGrid3.Cells[1,2] := StringGrid2.Cells[1,i];
                end;
                if  StringGrid2.Cells[0,i] = '元器件' then
                begin
                     StringGrid3.Cells[1,3] := StringGrid2.Cells[1,i];
                end;
                if ( StringGrid2.Cells[0,i] <> '元器件' ) and ( StringGrid2.Cells[0,i] <> 'SMT' ) then
                begin
                     if  StringGrid2.Cells[1,i] <> '' then
                     PriceEmptyBoard := PriceEmptyBoard + StrToFloat( StringGrid2.Cells[1,i]);
                end;
           end;
           StringGrid3.Cells[1,1] := FloatToStr( PriceEmptyBoard + StrToFloat(DBEdit32.Text) );
end;

procedure TForm2.DBEdit18Exit(Sender: TObject);
begin
  if not dm.ads511.IsEmpty then
  begin
    dm.ads511.Edit;
    dm.ads511UNIT_WTH.Value:=dm.ADSA85UNIT_WTH.Value;  //拼版宽
    dm.ads511.Post;
  end;
end;

procedure TForm2.DBEdit17Exit(Sender: TObject);
begin
  if not dm.ads511.IsEmpty then
  begin
    dm.ads511.Edit;
    dm.ads511UNIT_LEN.Value:=dm.ADSA85UNIT_LEN.Value;  //拼版长
    dm.ads511.Post;
  end;
end;

end.
