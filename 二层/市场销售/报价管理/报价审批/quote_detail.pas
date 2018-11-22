unit quote_detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, DBCtrls, Menus,
  Grids, DBGrids, DB, ADODB,math,jpeg;

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
    Label56: TLabel;
    DBEdit37: TDBEdit;
    Label57: TLabel;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    Label58: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure DBEdit14Exit(Sender: TObject);
   procedure Tab(Sender: TObject; var Key: Word;
     Shift: TShiftState);
    procedure ComboBox3Change(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure DBEdit31KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit31Exit(Sender: TObject);
    procedure DBEdit32Exit(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBEdit27KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit19KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit17KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
   iarray:array of Integer;//报价类型
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
   procedure  get_value(rkey278:integer);
   function  get_cust_info(cust_code:string):boolean;
   function  get_custpart_info(custpartcode:string;cust_ptr:integer):boolean;
   function get_data0025rkey(rkey50:integer):integer;
   function get_layer(rkey25:integer):tstrings;
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
  public
    { Public declarations }
  end;

type
 TMyDBGrid=class(TDBGrid);

var
  Form2: TForm2;

implementation

uses damo, common;

{$R *.dfm}

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
      'dbo.Data0005.empl_code as REP_CODE, dbo.Data0005.EMPLOYEE_NAME as SALES_REP_NAME,'+#13+
      'dbo.Data0010.EDI_FLAG_FOR_SOACK, dbo.Data0010.quote_factor,'+#13+
      'dbo.Data0010.SALES_DISCOUNT'+#13+
 'FROM dbo.Data0010 INNER JOIN'+#13+
      'dbo.Data0001 ON dbo.Data0010.CURRENCY_PTR = dbo.Data0001.RKEY INNER JOIN'+#13+
      'dbo.Data0005 ON dbo.Data0010.SALES_REP_PTR = dbo.Data0005.RKEY'+#13+
  'where data0010.cust_code='''+cust_code+'''';
 open;
 if isempty then
  result:=false
 else
  result:=true;
end;
end;

function  TForm2.get_custpart_info(custpartcode:string;cust_ptr:integer):boolean;
begin
with dm.ADOQuery1 do
begin
 close;
 if cust_ptr=0 then       //等于0就是没有确定客户
 sql.Text:='SELECT dbo.Data0050.RKEY, dbo.Data0050.CUSTOMER_PART_DESC,'+#13+
      'dbo.Data0050.ANALYSIS_CODE_2, dbo.Data0010.CUST_CODE,'+#13+
      'dbo.Data0050.set_lngth, dbo.Data0050.set_width, dbo.Data0050.set_x_qty,'+#13+
      'dbo.Data0050.set_y_qty, dbo.Data0025.PROD_CODE_PTR,'+#13+
      'dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME'+#13+
'FROM dbo.Data0010 INNER JOIN'+#13+
      'dbo.Data0050 ON dbo.Data0010.RKEY = dbo.Data0050.CUSTOMER_PTR INNER JOIN'+#13+
      'dbo.Data0025 ON dbo.Data0050.RKEY = dbo.Data0025.ANCESTOR_PTR INNER JOIN'+#13+
      'dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY'+#13+
'WHERE (dbo.Data0025.PARENT_PTR = 0) and'+#13+
 'Data0050.CUSTOMER_PART_NUMBER+rtrim(data0050.cp_rev)='''+custpartcode+''''
 else
 sql.Text:='SELECT dbo.Data0050.RKEY, dbo.Data0050.CUSTOMER_PART_DESC,'+#13+
      'dbo.Data0050.ANALYSIS_CODE_2, dbo.Data0050.set_lngth, dbo.Data0050.set_width,'+#13+
      'dbo.Data0050.set_x_qty, dbo.Data0050.set_y_qty, dbo.Data0025.PROD_CODE_PTR,'+#13+
      'dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME'+#13+
'FROM dbo.Data0050 INNER JOIN'+#13+
      'dbo.Data0025 ON dbo.Data0050.RKEY = dbo.Data0025.ANCESTOR_PTR INNER JOIN'+#13+
      'dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY'+#13+
'WHERE Data0025.PARENT_PTR = 0 and'+#13+
 'data0050.CUSTOMER_PTR='+INTTOSTR(cust_ptr)+#13+
 'and Data0050.CUSTOMER_PART_NUMBER+rtrim(data0050.cp_rev)='''+custpartcode+'''';
 open;
 if isempty then
  result:=false
 else
  result:=true;
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

procedure TForm2.Tab(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Begin
  if (key=VK_Down) or (key=13) then
   SelectNext(ActiveControl,True,True);
  if key=VK_Up then
   SelectNext(ActiveControl,False,True);
  Key:=0;
end;

function TForm2.get_data0025rkey(rkey50: integer): integer;
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey from data0025'+#13+
            'where PARENT_PTR=0 and'+#13+
            'ANCESTOR_PTR='+inttostr(rkey50);
  open;
  if isempty then
   result:=0
  else
   result:=fieldvalues['rkey']
 end;
end;

function TForm2.get_layer(rkey25: integer): tstrings;
var
 i:byte;
 memo_lins:tstringlist;
begin
//result:=Tstrings.Create;
 memo_lins:=tstringlist.Create;

 with dm.adoquery2 do
  begin
   close;
   sql.Text:=
'SELECT TOP 100 PERCENT LINE_01, LINE_02, LINE_03, LINE_04, LINE_05, LINE_06,'+#13+
'LINE_07, LINE_08, LINE_09, LINE_10, LINE_11, LINE_12, LINE_13, LINE_14,'+#13+
'LINE_15, LINE_16, LINE_17, LINE_18, LINE_19, LINE_20, SEQNO, NO_LINES'+#13+
'FROM dbo.Data0046'+#13+
'WHERE SRCE_PTR = '+inttostr(rkey25)+#13+
'ORDER BY SEQNO';
   open;
  end;

 while not dm.ADOQuery2.Eof do
  begin
   if dm.ADOQuery2.FieldValues['SEQNO'] < dm.Adoquery2.RecordCount then
    for i:=1 to 20 do
     begin
      if i<10 then
       memo_lins.Add(trimright(dm.ADOQuery2.fieldbyname('line_0'+inttostr(i)).asstring))
      else
       memo_lins.add(trimright(dm.Adoquery2.fieldbyname('line_'+inttostr(i)).asstring));
      end
   else
    for i:=1 to dm.Adoquery2.FieldValues['no_lines']-(dm.ADOQuery2.FieldValues['seqno']-1)*20 do
     begin
      if i<10 then
       memo_lins.Add(trimright(dm.ADOQuery2.fieldbyname('line_0'+inttostr(i)).asstring))
      else
       memo_lins.add(trimright(dm.Adoquery2.fieldbyname('line_'+inttostr(i)).asstring));
     end;
   dm.ADOQuery2.Next;
  end;
 result:=memo_lins;
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

procedure TForm2.get_technics(rkey346:integer);
var
 i:integer;
begin
 for i:= 1 to sgrid2.RowCount-1 do
  sgrid2.Rows[i].Clear;
 sgrid2.RowCount:=2;
 dm.ads431.First;
 while not dm.ads431.Eof do
 if (trim(dm.ads431SPEC_RKEY.Value)<>'5') and
    (trim(dm.ads431SPEC_RKEY.Value)<>'P') and 
    (trim(dm.ads431SPEC_RKEY.Value)<>'WB') and
    (trim(dm.ads431SPEC_RKEY.Value)<>'WA') then
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
      ' end as cac_meoth,Data0348.FORMULA, Data0348.MIN_VALUE,'+#13+
      'Data0348.MAX_VALUE, Data0351.D0348_PTR'+#13+
      'FROM dbo.Data0348 INNER JOIN'+#13+
      'dbo.Data0351 ON dbo.Data0348.RKEY = dbo.Data0351.D0348_PTR'+#13+
      'WHERE Data0351.D0346_PTR = '+inttostr(rkey346)+#13+
      'ORDER BY dbo.Data0351.seq_no';
 open;
 while not eof do
 begin
  sgrid2.Cells[0,sgrid2.RowCount-1] := inttostr(sgrid2.RowCount-1);
  sgrid2.Cells[1,sgrid2.RowCount-1] := fieldbyname('ADDER_NAME').AsString;
  sgrid2.Cells[2,sgrid2.RowCount-1] := fieldbyname('cac_meoth').AsString;// '计价模式';
  sgrid2.Cells[3,sgrid2.RowCount-1] := '0';//'PCS成本';
  sgrid2.Cells[4,sgrid2.RowCount-1] := fieldbyname('D0348_PTR').AsString; //'工艺标识';
  sgrid2.Cells[5,sgrid2.RowCount-1] := fieldbyname('FORMULA').AsString; //'公式';
  sgrid2.Cells[6,sgrid2.RowCount-1] := fieldbyname('MIN_VALUE').AsString; //'最小值';
  sgrid2.Cells[7,sgrid2.RowCount-1] := fieldbyname('MAX_VALUE').AsString; //'最大值';
  sgrid2.RowCount:=sgrid2.RowCount+1;
  self.append_data0431(fieldvalues['D0348_PTR']);
  next;
 end;
end;
end;

procedure TForm2.append_data0431(rkey348: integer);
begin
with dm.ADOQuery2 do
begin
 close;
 sql.Text:='select UNIT_PTR from data0430'+#13+
           'where SOURCE_PTR='+inttostr(rkey348);
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
  else
  begin
   dm.ads431.Edit;
   dm.ads431ttype.Value:=dm.ads431ttype.Value+1;
   dm.ads431.Post;
  end;
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
    (trim(dm.ads431SPEC_RKEY.Value)<>'5') and
    (trim(dm.ads431SPEC_RKEY.Value)<>'P') and
    (trim(dm.ads431SPEC_RKEY.Value)<>'WB') and
    (trim(dm.ads431SPEC_RKEY.Value)<>'WA') then
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
   with dm.ADOQuery1 do
    begin
      close;
      sql.clear;
      sql.add('select 1 as true_or_false where '+copy(vstring,i+3,j-i-3));
      open;
    end;
  except
    exit;
  end;

  if not dm.ADOQuery1.IsEmpty then
   begin
    try    //检验IF（条件，返回值1，返回值2）函数的返回值1是否有效
      with dm.ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('SELECT 1.000000*('+copy(vstring,j+1,j0-1)+') as vqty ');
        open;
      end;
    except
      exit;
    end;
   end
  else
   begin
    try    //检验IF（条件，返回值1，返回值2）函数的返回值2是否有效
      with dm.ADOQuery1 do
      begin
        close;
        sql.clear;
        sql.add('SELECT 1.000000*('+copy(vstring,j+j0+1,j1-1)+') as vqty ');
        open;
      end;
    except
      exit;
    end;
   end;
   vstring:=copy(vstring,1,i-1)+dm.ADOQuery1.fieldbyname('vqty').asstring+
            copy(vstring,j+j0+j1+1,length(vstring)-j-j0-j1);
  end;
  result:='SELECT convert(float,'+vstring+') as vqty';
end;

function TForm2.calTooling(vstr:string):string;

begin

end;

procedure TForm2.price_change();
begin
dm.ADSA85QTE_UNITS.Value:=roundto(dm.ADSA85quote_price.Value*
                                  dm.ADSA85CURR_RATE.Value,-6);
dm.ADSA85comm_cost.Value:=dm.ADSA85QTE_UNITS.Value*
                          dm.ADSA85SALES_DISCOUNT.Value*0.01;
dm.ADSA85SHIPPING_CHARGE.Value:=dm.ADSA85total_cost.Value+
                                dm.ADSA85CRP_EST_QUANTITY.Value-
                                dm.ADSA85QTE_UNITS.Value+
                                dm.ADSA85comm_cost.Value;
dm.ADSA85MARKUP.Value := roundto((1-(dm.ADSA85SHIPPING_CHARGE.Value/
                         dm.ADSA85base_pcscost.Value))*100,-2);    //销售折让
if combobox1.ItemIndex=0 then
 begin
  edit13.Text:=formatfloat('0.0000',dm.ADSA85comm_cost.value*dm.ADSA85USHEET.Value);
  edit14.Text:=formatfloat('0.0000',dm.ADSA85SHIPPING_CHARGE.value*dm.ADSA85USHEET.Value);
  edit15.Text:=formatfloat('0.0000',dm.ADSA85QTE_UNITS.value*dm.ADSA85USHEET.Value);
  edit16.Text:=formatfloat('0.0000',dm.ADSA85quote_price.value*dm.ADSA85USHEET.Value);
  edit17.Text:=formatfloat('0.0000',dm.ADSA85quote_taxprice.value*dm.ADSA85USHEET.Value);
 end
else
 begin
  edit13.Text:=formatfloat('0.0000',dm.ADSA85comm_cost.value*dm.ADSA85USHEET.Value/
                                    dm.ADSA85TUNITS.Value);
  edit14.Text:=formatfloat('0.0000',dm.ADSA85SHIPPING_CHARGE.value*dm.ADSA85USHEET.Value/
                                    dm.ADSA85TUNITS.Value);
  edit15.Text:=formatfloat('0.0000',dm.ADSA85QTE_UNITS.value*dm.ADSA85USHEET.Value/
                                    dm.ADSA85TUNITS.Value);
  edit16.Text:=formatfloat('0.0000',dm.ADSA85quote_price.value*dm.ADSA85USHEET.Value/
                                    dm.ADSA85TUNITS.Value);
  edit17.Text:=formatfloat('0.0000',dm.ADSA85quote_taxprice.value*dm.ADSA85USHEET.Value/
                                    dm.ADSA85TUNITS.Value);
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
    dm.ads432.Post;
   end;
end;

procedure TForm2.update_04(v_seed: string);

begin

end;

procedure TForm2.update_intvent(rkey85: integer);
var
 i:integer;
begin
   with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='SELECT QUOTE_PTR, STD_INVENT_PTR, D0028_PTR, QTY, price, D0028_PRICE'+#13+
              ' FROM Data0253 where QUOTE_PTR='+inttostr(rkey85);
    open;
    while not eof do delete;
    for i:=1 to sgrid1.RowCount-2 do
    AppendRecord([rkey85,       //材料保存
                  strtoint(sgrid1.Cells[9,i]),
                  strtoint(sgrid1.Cells[8,i]),
                  strtofloat(sgrid1.Cells[5,i]),
                  strtofloat(sgrid1.Cells[4,i]),
                  strtofloat(sgrid1.Cells[7,i])
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
    sql.Text:='SELECT QTE_PTR, SOURCE_PTR, AMOUNT'+#13+
               'FROM Data0432 where QTE_PTR='+inttostr(rkey85);
    open;
    while not eof do delete;
    for i:=1 to sgrid2.RowCount-2 do
     AppendRecord([rkey85,       //特别工艺保存
                  strtoint(sgrid2.Cells[4,i]),
                  strtofloat(sgrid2.Cells[3,i])
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
      'dbo.Data0023.ABBR_NAME, dbo.Data0002.UNIT_NAME,'+#13+
      'ROUND(dbo.Data0253.QTY * dbo.Data0253.price, 6) AS pcs_cost'+#13+
      'FROM dbo.Data0253 INNER JOIN'+#13+
      'dbo.Data0017 ON'+#13+
      'dbo.Data0253.STD_INVENT_PTR = dbo.Data0017.RKEY INNER JOIN'+#13+
      'dbo.Data0028 ON dbo.Data0253.D0028_PTR = dbo.Data0028.RKEY INNER JOIN'+#13+
      'dbo.Data0023 ON dbo.Data0028.SUPPLIER_PTR = dbo.Data0023.RKEY INNER JOIN'+#13+
      'dbo.Data0002 ON dbo.Data0028.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY'+#13+
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
   dm.ADOQuery1.Next;
  end;

sql_text:='SELECT dbo.Data0348.ADDER_NAME, dbo.Data0432.SOURCE_PTR,'+#13+
      'dbo.Data0432.AMOUNT, dbo.Data0348.FORMULA, dbo.Data0348.MIN_VALUE,'+#13+
      'dbo.Data0348.MAX_VALUE,'+#13+
      'round(Data0432.AMOUNT*data0085.usheet,6) as cost_m2,'+#13+
'round(data0432.amount*data0085.TUNITS/(data0085.UNIT_LEN*data0085.UNIT_WTH*0.000001),6) as cost_total_m2,'+#13+
      'case Data0348.PCENTS when 0 then ''金额'' else ''基价百份比'''+#13+
      ' end as cac_meoth'+#13+
       'FROM dbo.Data0432 INNER JOIN'+#13+
      'dbo.Data0348 ON dbo.Data0432.SOURCE_PTR = dbo.Data0348.RKEY'+#13+
      'inner join data0085 on data0432.qte_ptr=data0085.rkey'+#13+
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
    stringgrid1.Cells[1,i]:=formatfloat('0.0000',dm.ads432AMOUNT.Value);
    stringgrid1.Cells[2,i]:=formatfloat('0.000',dm.ads432FREE_AMOUNT.Value);
    stringgrid1.Cells[3,i]:=dm.ads432TAX_FLAG.Value;
    break;
   end;
   dm.ads432.Next;
  end;
end;

procedure TForm2.change_enable;
begin
 bitbtn11.Enabled:=not bitbtn11.Enabled;
 bitbtn12.Enabled:=not bitbtn12.Enabled;
 bitbtn9.Enabled:=not bitbtn9.Enabled;
 bitbtn10.Enabled:=not bitbtn10.Enabled;
 dbcombobox1.Enabled:=not dbcombobox1.Enabled;  //参数
 combobox1.Enabled := not combobox1.Enabled;
 dbcombobox2.Enabled:=not dbcombobox2.Enabled;  //增值税
 dbedit27.Enabled:=not dbedit27.Enabled;
 dbedit28.Enabled:=not dbedit28.Enabled;
 dbgrid1.ReadOnly:= not dbgrid1.ReadOnly;
 sgrid1.PopupMenu:=nil;
 sgrid2.PopupMenu:=nil;
end;


procedure TForm2.FormCreate(Sender: TObject);
var
 i:word;
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
    StringGrid1.Cells[3,i]:=fieldbyname('TAX_FLAG').AsString;
    StringGrid1.Cells[4,i]:=fieldbyname('rkey').AsString;
    next;
   end;
  end;
 OldGridWnd := DBGrid1.WindowProc ;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm2.FormActivate(Sender: TObject);
var i,iNo:Integer;
begin
 sgrid1.Cells[0,0] := '材料编码';
 sgrid1.Cells[1,0] := '材料规格';
 sgrid1.Cells[2,0] := '供应商';
 sgrid1.Cells[3,0] := '单位';
 sgrid1.Cells[4,0] := '本币价格';
 sgrid1.Cells[5,0] := 'PCS用量';
 sgrid1.Cells[6,0] := 'PCS成本';
 sgrid1.Cells[7,0] := '原币价格';
 sgrid1.Cells[8,0] := '价格标识';
 sgrid1.Cells[9,0] := '材料标识';

 sgrid1.ColWidths[8] := 0;
 sgrid1.ColWidths[9] := 0;

 sgrid2.Cells[0,0] := '序号';
 sgrid2.Cells[1,0] := '工艺名称';
 sgrid2.Cells[2,0] := '计价模式';
 sgrid2.Cells[3,0] := 'PCS成本';
 sgrid2.Cells[4,0] := '平米成本';
 sgrid2.Cells[5,0] := '公式';
 sgrid2.Cells[6,0] := '最小值';
 sgrid2.Cells[7,0] := '最大值';
 sgrid2.ColWidths[5] := -1;
 sgrid2.ColWidths[6] := -1;
 sgrid2.ColWidths[7] := -1;

 stringgrid1.Cells[0,0] := '工具费用类别';
 stringgrid1.Cells[1,0] := '金额';
 stringgrid1.Cells[2,0] := '免收金额';
 StringGrid1.Cells[3,0] := '征税';
 StringGrid1.Cells[4,0] := '序号';
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
    sql.Text:='select rkey from data0278'+#13+
              'where spec_rkey=''P'' or '+#13+  //大料开总PCS数
              'spec_rkey=''5'' or '+#13+        //大料利用率
              'spec_rkey=''WB'' or '+#13+       //一平米大料开PCS数
              'spec_rkey=''WA'' ';              //单元面积
    open;
    while not eof do
     begin
      dm.ads431.Append;
      dm.ads431UNIT_PTR.Value:=fieldvalues['rkey'];
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

 end
else          //编辑
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
//tang2014-11-26tang--------------
  iNo:=0;
  for i:=Low(iarray) to High(iarray) do
  begin
    if (dm.ADSA85ttype2.Value=i) then
    begin
       combobox3.ItemIndex:=iNo;
    end;
    iNo:=iNo+1;
  end;
//  combobox3.ItemIndex:=dm.ADSA85ttype2.Value; //类型
//end tang2014-11-26--------------
  combobox1.ItemIndex:= dm.ADSA85QTE_UNIT_PTR.Value-1; //报价单元
  edit7.Text:=dm.ADS85ROW_NAME.Value;
  OpenQuery(dm.ADOQuery1,'select CUST_CODE from data0010 where rkey='+dm.ADSA85CUST_PTR.AsString);
  edit1.Text:=dm.ADOQuery1.FieldValues['CUST_CODE'];
  self.get_intvent(dm.ADS85RKEY.Value);//得到材料及工艺
  self.get_tools432(dm.ADS85RKEY.Value);
  image1.Picture.Assign(Load_JPG_Pic_From_DB(dm.ads511sheet_BMP));

  self.change_enable;
  dbedit14.Enabled:=false;
  bitbtn6.Enabled:=false;

  if combobox1.ItemIndex=0 then
  begin
   if dm.qte_type=1 then      //基价折率法
   begin
     edit8.Text:=formatfloat('0.0000',dm.ADSA85MATL_COST.value*dm.ADSA85USHEET.Value);
     edit9.Text:=formatfloat('0.0000',dm.ADSA85base_pcscost.value*dm.ADSA85USHEET.Value);
     edit10.Text:=formatfloat('0.0000',dm.ADSA85ovhd_cost.value*dm.ADSA85USHEET.Value);
     edit11.Text:=formatfloat('0.0000',dm.ADSA85total_cost.value*dm.ADSA85USHEET.Value);
     edit12.Text:=formatfloat('0.0000',dm.ADSA85CRP_EST_QUANTITY.value*dm.ADSA85USHEET.Value);
     edit13.Text:=formatfloat('0.0000',dm.ADSA85comm_cost.value*dm.ADSA85USHEET.Value);
     edit14.Text:=formatfloat('0.0000',dm.ADSA85SHIPPING_CHARGE.value*dm.ADSA85USHEET.Value);
     edit15.Text:=formatfloat('0.0000',dm.ADSA85QTE_UNITS.value*dm.ADSA85USHEET.Value);
     edit16.Text:=formatfloat('0.0000',dm.ADSA85quote_price.value*dm.ADSA85USHEET.Value);
     edit17.Text:=formatfloat('0.0000',dm.ADSA85quote_taxprice.value*dm.ADSA85USHEET.Value);
   end
   else                    //总成本折率法
   begin
     edit8.Text:=formatfloat('0.0000',dm.ADSA85MATL_COST.value*dm.ADSA85TUNITS.Value/
                                   (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
     edit9.Text:=formatfloat('0.0000',dm.ADSA85base_pcscost.value*dm.ADSA85TUNITS.Value/
                                   (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
     edit10.Text:=formatfloat('0.0000',dm.ADSA85ovhd_cost.value*dm.ADSA85TUNITS.Value/
                                   (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
     edit11.Text:=formatfloat('0.0000',dm.ADSA85total_cost.value*dm.ADSA85TUNITS.Value/
                                   (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
     edit12.Text:=formatfloat('0.0000',dm.ADSA85CRP_EST_QUANTITY.value*dm.ADSA85TUNITS.Value/
                                   (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
     edit13.Text:=formatfloat('0.0000',dm.ADSA85comm_cost.value*dm.ADSA85TUNITS.Value/
                                   (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
     edit14.Text:=formatfloat('0.0000',dm.ADSA85SHIPPING_CHARGE.value*dm.ADSA85TUNITS.Value/
                                   (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
     edit15.Text:=formatfloat('0.0000',dm.ADSA85QTE_UNITS.value*dm.ADSA85TUNITS.Value/
                                   (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
     edit16.Text:=formatfloat('0.0000',dm.ADSA85quote_price.value*dm.ADSA85TUNITS.Value/
                                   (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
     edit17.Text:=formatfloat('0.0000',dm.ADSA85quote_taxprice.value*dm.ADSA85TUNITS.Value/
                                   (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
   end;   
  end
  else
  begin

   if dm.qte_type=1 then
   begin
   edit8.Text:=formatfloat('0.0000',dm.ADSA85MATL_COST.value*dm.ADSA85USHEET.Value/
                                    dm.ADSA85TUNITS.Value);
   edit9.Text:=formatfloat('0.0000',dm.ADSA85base_pcscost.value*dm.ADSA85USHEET.Value/
                                    dm.ADSA85TUNITS.Value);
   edit10.Text:=formatfloat('0.0000',dm.ADSA85ovhd_cost.value*dm.ADSA85USHEET.Value/
                                     dm.ADSA85TUNITS.Value);
   edit11.Text:=formatfloat('0.0000',dm.ADSA85total_cost.value*dm.ADSA85USHEET.Value/
                                     dm.ADSA85TUNITS.Value);
   edit12.Text:=formatfloat('0.0000',dm.ADSA85CRP_EST_QUANTITY.value*dm.ADSA85USHEET.Value/
                                     dm.ADSA85TUNITS.Value);
   edit13.Text:=formatfloat('0.0000',dm.ADSA85comm_cost.value*dm.ADSA85USHEET.Value/
                                     dm.ADSA85TUNITS.Value);
   edit14.Text:=formatfloat('0.0000',dm.ADSA85SHIPPING_CHARGE.value*dm.ADSA85USHEET.Value/
                                     dm.ADSA85TUNITS.Value);
   edit15.Text:=formatfloat('0.0000',dm.ADSA85QTE_UNITS.value*dm.ADSA85USHEET.Value/
                                     dm.ADSA85TUNITS.Value);
   edit16.Text:=formatfloat('0.0000',dm.ADSA85quote_price.value*dm.ADSA85USHEET.Value/
                                     dm.ADSA85TUNITS.Value);
   edit17.Text:=formatfloat('0.0000',dm.ADSA85quote_taxprice.value*dm.ADSA85USHEET.Value/
                                     dm.ADSA85TUNITS.Value);
   end
   else
   begin
     edit8.Text:=formatfloat('0.0000',dm.ADSA85MATL_COST.value/
                                      (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
     edit9.Text:=formatfloat('0.0000',dm.ADSA85base_pcscost.value/
                                      (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
     edit10.Text:=formatfloat('0.0000',dm.ADSA85ovhd_cost.value/
                                       (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
     edit11.Text:=formatfloat('0.0000',dm.ADSA85total_cost.value/
                                       (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
     edit12.Text:=formatfloat('0.0000',dm.ADSA85CRP_EST_QUANTITY.value/
                                       (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
     edit13.Text:=formatfloat('0.0000',dm.ADSA85comm_cost.value/
                                       (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
     edit14.Text:=formatfloat('0.0000',dm.ADSA85SHIPPING_CHARGE.value/
                                       (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
     edit15.Text:=formatfloat('0.0000',dm.ADSA85QTE_UNITS.value/
                                       (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
     edit16.Text:=formatfloat('0.0000',dm.ADSA85quote_price.value/
                                       (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
     edit17.Text:=formatfloat('0.0000',dm.ADSA85quote_taxprice.value/
                                       (dm.ADSA85UNIT_LEN.Value*dm.ADSA85UNIT_WTH.Value*0.000001));
   end;
  end;

 end;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
 dm.ADSA85.Cancel;
 self.ModalResult:=mrcancel;
end;

procedure TForm2.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (gdSelected  in State) then
 begin
  if (ACol = 3) and (ARow<>stringgrid1.RowCount-1) then
   begin
    ComboBox2.Left := Rect.Left;
    ComboBox2.Top := Rect.Top;
    ComboBox2.Width := Rect.Right - Rect.Left+3;
    ComboBox2.Height := Rect.Bottom - Rect.Top;
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
   formatfloat('0.0000',strtofloat(stringgrid1.Cells[1,stringgrid1.Row]));
   stringgrid1.Cells[2,stringgrid1.Row]:=
   formatfloat('0.0000',strtofloat(stringgrid1.Cells[2,stringgrid1.Row]));
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
     formatfloat('0.0000',strtofloat(stringgrid1.Cells[1,stringgrid1.Row]));
    stringgrid1.Cells[2,stringgrid1.Row]:=
     formatfloat('0.0000',strtofloat(stringgrid1.Cells[2,stringgrid1.Row]));
  end;
end;

procedure TForm2.PopupMenu2Popup(Sender: TObject);
begin
 if sgrid1.Row=sgrid1.RowCount-1 then
  n2.Enabled:=false
 else
  n2.Enabled:=true;
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
   dbradiogroup1.Enabled:=true;
  end;
end;

procedure TForm2.N4Click(Sender: TObject);
var
 i:word;
begin
 self.delete_data0431(strtoint(sgrid2.Cells[4,sgrid2.row]));
 for i:=sgrid2.Row to sgrid2.RowCount-2 do
  sgrid2.Rows[i].Text:=sgrid2.Rows[i+1].Text;
  sgrid2.RowCount:=sgrid2.RowCount-1;
end;

procedure TForm2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and        //如果是下箭头如果是最后一条记录
  (dm.ads431.RecNo=dm.ads431.RecordCount) then abort;
 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录
 if (key=112) and (dbcombobox1.Visible) then
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
     (dbcombobox1.Items.Count > 0) then
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
  dm.ADSA85CURR_RATE.Value:=dm.ADOQuery1.FieldValues['QTE_BASE_TO_OTHER'];
  dm.ADSA85SREP_PTR.Value:=dm.ADOQuery1.FieldValues['SALES_REP_PTR'];
  edit3.Text:=dm.ADOQuery1.FieldValues['REP_CODE'];
  label18.Caption:=dm.ADOQuery1.FieldValues['SALES_REP_NAME'];
  dm.ADSA85QUOTE_TYPE.Value:=dm.ADOQuery1.FieldValues['EDI_FLAG_FOR_SOACK'];
  dm.ADSA85CUST_QTE_FACTOR.Value:=dm.ADOQuery1.Fieldbyname('quote_factor').AsCurrency;//额外加价率%
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

procedure TForm2.DBEdit14Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn6') and (trim(dbedit14.Text)<>'') then
begin
 if get_custpart_info(trim(dbedit14.Text),dm.ADSA85CUST_PTR.Value) then
  if dm.ADOQuery1.FieldValues['rkey']<>dm.ADSA85CUST_PART_PTR.Value then
  begin
   dm.ADSA85CUST_PART_PTR.Value:=dm.ADOQuery1.FieldValues['rkey'];
   dm.ADSA85CUST_PART_NO.Value:=dm.ADOQuery1.FieldValues['CUSTOMER_PART_DESC'];
   dm.ADSA85CUST_PART_DESC.Value:=dm.ADOQuery1.fieldbyname('ANALYSIS_CODE_2').AsString;
   dm.ADSA85PROD_CODE_PTR.Value:=dm.ADOQuery1.FieldValues['PROD_CODE_PTR'];
   edit4.Text:=dm.ADOQuery1.FieldValues['PROD_CODE'];
   label24.Caption:=dm.ADOQuery1.FieldValues['PRODUCT_NAME'];
   dm.ADSA85UNIT_LEN.Value:= dm.ADOQuery1.FieldValues['set_lngth'];
   dm.ADSA85UNIT_WTH.Value:= dm.ADOQuery1.FieldValues['set_width'];
   dm.ADSA85TUNITS.Value:= dm.ADOQuery1.FieldValues['set_x_qty']*
                          dm.ADOQuery1.FieldValues['set_y_qty'];
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

procedure TForm2.ComboBox3Change(Sender: TObject);
begin
 dm.ADSA85ttype2.Value:=combobox3.ItemIndex; //类型
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
   dbedit12.Text:=formatfloat('0.0000',dm.ADSA85CURR_RATE.Value);
  end;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
if dm.ADSA85CUST_PART_PTR.Value>0 then
 dbmemo2.Lines:=get_layer(get_data0025rkey(dm.ADSA85CUST_PART_PTR.Value))
else
 messagedlg('请首先确定本厂编号!',mtinformation,[mbcancel],0);
end;


procedure TForm2.BitBtn12Click(Sender: TObject);
begin
if bitbtn1.Enabled then
begin
self.change_enable;
sgrid1.PopupMenu:=popupmenu2;
sgrid2.PopupMenu:=popupmenu3;
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
dm.ADSA85quote_price.AsString:=formatfloat('0.000000',dm.ADSA85quote_price.value);
dm.ADSA85quote_taxprice.Value:=roundto(dm.ADSA85quote_price.Value*
                              (1+dm.ADSA85vatax.Value*0.01),-6);
self.price_change();
end;

procedure TForm2.DBEdit32Exit(Sender: TObject);
begin
if trim(dbedit32.Text)='' then dm.ADSA85quote_taxprice.Value:=0;
dm.ADSA85quote_taxprice.AsString:=formatfloat('0.000000',dm.ADSA85quote_taxprice.value);
dm.ADSA85quote_price.Value:=roundto(dm.ADSA85quote_taxprice.Value/
                              (1+dm.ADSA85vatax.Value*0.01),-6);
self.price_change();
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
 dm.ADSA85QTE_UNIT_PTR.Value := combobox1.ItemIndex+1; //报价单元
end;

procedure TForm2.DBEdit27KeyPress(Sender: TObject; var Key: Char);
begin
if (key = chr(46)) then  //如果是小数点
if pos('.',(sender as TDBEdit).Text)>0 then  //小数点不能重复
  abort;
end;

procedure TForm2.DBEdit19KeyPress(Sender: TObject; var Key: Char);
begin
if not dm.ads511.IsEmpty then abort;
end;

procedure TForm2.DBEdit17KeyPress(Sender: TObject; var Key: Char);
begin
if (key = chr(46)) then  //如果是小数点
if pos('.',(sender as TDBEdit).Text)>0 then  //小数点不能重复
  abort;
if not dm.ads511.IsEmpty then abort; 
end;

procedure TForm2.FormShow(Sender: TObject);
var iNum:Integer;
begin
//2014-11-26tang添加修改-------------------
  ComboBox3.Items.Clear;
  dm.ADOQuery1.Close;
  dm.ADOQuery1.SQL.Text:='SELECT ttype2,description FROM DATA0086 order by ttype2';
  dm.ADOQuery1.Open;
  if not dm.ADOQuery1.IsEmpty then
  begin
    iNum:=0;
    SetLength(iarray,dm.ADOQuery1.RecordCount);
    dm.ADOQuery1.First;
    while not dm.ADOQuery1.Eof do
    begin
      ComboBox3.Items.Add(dm.ADOQuery1.FieldBYName('description').AsString);
      iarray[iNum]:=dm.ADOQuery1.FieldBYName('ttype2').AsInteger;
      iNum:=iNum+1;
      dm.ADOQuery1.Next;
    end;
  end;
//end 2014-11-26tang添加修改-------------------
end;

end.
