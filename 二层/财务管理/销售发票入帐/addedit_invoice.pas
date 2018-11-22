unit addedit_invoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, Buttons, Grids, DBGrids, Menus,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, DB,ADODB,math;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N6: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label19: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label20: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label8: TLabel;
    MaskEdit1: TMaskEdit;
    Edit1: TEdit;
    DBEdit3: TDBEdit;
    Edit5: TEdit;
    DBEdit6: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit2: TDBEdit;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Edit4: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label14: TLabel;
    Label16: TLabel;
    Edit9: TEdit;
    SGrid1: TStringGrid;
    Panel1: TPanel;
    PopupMenu3: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    CheckBox1: TCheckBox;
    UpDown1: TUpDown;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label18: TLabel;
    Edit10: TEdit;
    Label23: TLabel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Label25: TLabel;
    sgrid2: TStringGrid;
    SpeedButton7: TSpeedButton;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    PopupMenu2: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    abbr_name: TLabel;
    DBEdit8: TDBEdit;
    Label6: TLabel;
    Edit2: TEdit;
    Label17: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit6KeyPress(Sender: TObject; var Key: Char);
    function get_voucher(invoice_date:tdatetime):string;
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure SGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure re_calculate();
    procedure update_04(v_seed:string);
    procedure save_note();
    procedure N7Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    function get_gltp(rkey103:string):integer;
    function get_glcurr_ptr(rkey103: string): integer;
    function vo_number(number:string): boolean;
    function invo_number_error(number: string): boolean;
    procedure N9Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure SGrid1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6Exit(Sender: TObject);
    procedure SGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N8Click(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
  private
    { Private declarations }
   invoice_note: tstringlist;
   function get_col5(row:integer):currency;
   function get_col6(row:integer):currency;
   function find_pkinvoice(): boolean;
   function find_grn(rkey439: integer): boolean;
   procedure update_439_60(rkey112:integer);
   function if_toolsamount(var so:string): boolean;
   function return_vifrkey(sgrid: tstringgrid; col: integer): string;
   function Check64TotalQty:boolean;//由于编辑过程中64或439可能做了修改，导致保存时，数据异常。必须判断。
  public
    { Public declarations }
   ACC_REC_PTR,REG_TAX_FIXED_UNUSED:integer;  //客户绑定的会计科目及到期计算方法0:月结1:款到
  end;

var
  Form2: TForm2;
  function RemoveInvalid(where: string): string;
  function Power(x, y : extended) : extended;

implementation

uses damo, sale_casepas, AcctSearch, curr_search, note, voucher_report,
  voucher_dictionary, packlist_selectone, main,common;

{$R *.dfm}
function TForm2.return_vifrkey(sgrid: tstringgrid;
  col: integer): string;
var
 i:integer;
 rkey_list:string;
begin
 result:='(0)';
  if sgrid.RowCount > 2 then
   begin
     rkey_list:='(';
     for i:=1 to sgrid.RowCount-2 do
      if i=sgrid.RowCount-2 then
       rkey_list:=rkey_list+ sgrid.Cols[col].Strings[i]+')'
      else
       rkey_list:=rkey_list+ sgrid.Cols[col].Strings[i]+',';
      result := rkey_list;
   end;
end;

function TForm2.if_toolsamount(var so:string): boolean;
begin
 result := false;
 with  form_selectpk do
 begin
  aqd64.First;
  while not aqd64.Eof do
   begin
    if aqd64tools_amount.Value>0 then
     begin
      result:=true;
      so:= aqd64SALES_ORDER.Value;
      break;
     end
    else
     aqd64.Next;
   end;
 end;
end;

procedure TForm2.update_439_60(rkey112:integer);
var
 i:integer;
begin

 with dm.ADOQuery1 do
  begin
   close;                            //需汇总更新060803
   sql.Clear;
   sql.Add('update data0060');
   sql.Add('set data0060.PARTS_INVOICED = data0060.PARTS_INVOICED-');
   sql.Add('d1.quantity_total');
   sql.Add('from data0060 inner join (');
   sql.Add('SELECT Data0064.SO_PTR, SUM(dbo.Data0064.QUAN_SHIPPED)');
   sql.Add('AS quantity_total');
   sql.Add('FROM Data0064 INNER JOIN');
   sql.Add('data0439 ON Data0064.packing_list_ptr = data0439.rkey');
   sql.Add('WHERE data0439.invoice_ptr = '+inttostr(rkey112));
   sql.Add('GROUP BY dbo.Data0064.SO_PTR) as d1');
   sql.Add('on Data0060.rkey = d1.so_ptr');
   ExecSQL;
  end;

 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('update data0064');
   sql.Add('set GLPTR_STATUS=0');
   sql.Add('from data0064 inner join data0439 on');
   sql.Add('data0064.packing_list_ptr=data0439.rkey inner join');
   sql.Add('data0112 on data0439.invoice_ptr=data0112.rkey');
   sql.Add('where data0112.rkey='+inttostr(rkey112));
   ExecSQL;
  end;

 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('update data0439');
   sql.Add('set invoice_ptr=null');
   sql.Add('where invoice_ptr='+inttostr(rkey112));
   ExecSQL;
  end;

for i:= 1 to stringgrid1.RowCount-2 do
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('update data0439');
   sql.Add('set invoice_ptr='+inttostr(rkey112));
   sql.Add('where rkey='+trim(stringgrid1.Cells[4,i]));
   ExecSQL;
  end;
 //======================更新装箱单=============================
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('update data0064');
   sql.Add('set GLPTR_STATUS=data0112.GLPTR_STATUS');
   sql.Add('from data0064 inner join data0439 on');
   sql.Add('data0064.packing_list_ptr=data0439.rkey inner join');
   sql.Add('data0112 on data0439.invoice_ptr=data0112.rkey');
   sql.Add('where data0112.rkey='+inttostr(rkey112));
   ExecSQL;
  end;
 //======================更新装运指派=============================
 with dm.ADOQuery1 do
  begin
   close;                            //需汇总更新060803
   sql.Clear;
   sql.Add('update data0060');
   sql.Add('set data0060.PARTS_INVOICED = data0060.PARTS_INVOICED+');
   sql.Add('d1.quantity_total');
   sql.Add('from data0060 inner join (');
   sql.Add('SELECT Data0064.SO_PTR, SUM(dbo.Data0064.QUAN_SHIPPED)');
   sql.Add('AS quantity_total');
   sql.Add('FROM Data0064 INNER JOIN');
   sql.Add('data0439 ON Data0064.packing_list_ptr = data0439.rkey');
   sql.Add('WHERE data0439.invoice_ptr = '+inttostr(rkey112));
   sql.Add('GROUP BY dbo.Data0064.SO_PTR) as d1');
   sql.Add('on Data0060.rkey = d1.so_ptr');
   ExecSQL;
  end;
 //===============更新销售订单发票数量==========================
end;


function TForm2.find_pkinvoice(): boolean;
var
 rkey439:string;
 i:integer;
begin
 result:=false;
for i:= 1 to stringgrid1.RowCount-2 do
 if i<>stringgrid1.RowCount-2 then
  rkey439:=rkey439+stringgrid1.Cells[4,i]+','
 else
  rkey439:=rkey439+stringgrid1.Cells[4,i];

 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0439');
   sql.Add('where invoice_ptr is not null');
   sql.Add('and rkey in ('+rkey439+')');
   open;
  end;
if not dm.ADOQuery1.IsEmpty then result:=true;
end;

function TForm2.find_grn(rkey439: integer): boolean;
var
 i:word;
begin
 result:=false;
 for i:=1 to stringgrid1.RowCount-2 do
  if strtoint(stringgrid1.Cells[4,i])=rkey439 then
   begin
    result:=true;
    break;
   end;
end;

function TForm2.get_col5(row: integer): currency;
var
 i:integer;
begin
result:=0;
 for i:=1 to sgrid1.RowCount-2 do
  begin
   if (trim(sgrid1.Cells[5,i])<>'') and (i<>row) then
   result:=result+strtocurr(sgrid1.Cells[5,i]);
  end;
end;

function TForm2.get_col6(row: integer): currency;
var
 i:integer;
begin
result:=0;
 for i:=1 to sgrid1.RowCount-2 do
  begin
   if (trim(sgrid1.Cells[6,i])<>'') and (i<>row) then
   result:=result+strtocurr(sgrid1.Cells[6,i]);
  end;
end;

function TForm2.vo_number(number: string): boolean;
begin
result:=false;
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0105');
  sql.Add('where VOUCHER='''+number+'''');
  open;
  if not IsEmpty then  result:=true;
 end;
end;

function TForm2.invo_number_error(number: string): boolean;
begin
result:=false;
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0112');
  sql.Add('where invoice_number='''+number+'''');
  open;
  if not IsEmpty then  result:=true;
 end;
end;

function TForm2.get_gltp(rkey103: string): integer;
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select curr_tp from data0103');
  sql.Add('where rkey='+rkey103);
  open;
  result:=fieldbyname('curr_tp').AsInteger;
 end;
end;

function TForm2.get_glcurr_ptr(rkey103: string): integer;
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select curr_ptr from data0103');
  sql.Add('where rkey='+rkey103);
  open;
  result:=fieldbyname('curr_ptr').AsInteger;
 end;
end;

procedure TForm2.re_calculate;
var
 i:word;
 vdb,vcr:currency;
begin
vdb:=0;
vcr:=0;
 for i:=1 to sgrid1.RowCount-2 do
  begin
   if trim(sgrid1.cells[5,i])<>'' then
    vdb:=vdb+strtocurr(trim(sgrid1.cells[5,i]));
   if trim(sgrid1.cells[6,i])<>'' then
    vcr:=vcr+strtocurr(trim(sgrid1.cells[6,i]));
  end;
statictext1.Caption:=Formatfloat('#,##0.00',vdb);
statictext2.Caption:=Formatfloat('#,##0.00',vcr);
end;

function RemoveInvalid(where: string): string;
 var
  tstr: string;
begin
  tstr:=where;
  while pos(',', tstr)>0 do
    tstr:=copy(tstr,1,pos(',',tstr)-1) +
       copy(tstr,pos(',',tstr)+1,length(tstr)-pos(',',tstr));
  Result:=tstr;
end;

function TForm2.get_voucher(invoice_date: tdatetime): string;
var
 voucher:string;
 pr_req:integer;
begin

 Edit8.Text:=inttostr(yearof(invoice_date));
 Edit9.Text:=inttostr(monthof(invoice_date));

 voucher:='TA'+copy(Edit8.Text,3,2);  //年度
 if length(Edit9.Text) < 2 then
  voucher := voucher+'0'+Edit9.Text
 else
  voucher := voucher+Edit9.Text;      //月份
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select top 1 VOUCHER from data0105');
   sql.Add('where VOUCHER like '''+voucher+'%''');
   sql.Add('order by voucher desc');
   open;
  end;
 if dm.ADOQuery1.IsEmpty then
  begin
   voucher:= voucher+'00001';
  end
 else
  begin
   pr_req := strtoint(copy(dm.ADOQuery1.fieldvalues['VOUCHER'],
   length(trim(voucher))+1,5));
   pr_req := 100000+pr_req+1;
   voucher := voucher+copy(inttostr(pr_req),2,5);
  end;
  result:= voucher;  //凭证编号
end;

function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
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
    dm.adod04.Edit; //使前缀不变后缀加1
    dm.adod04SEED_VALUE.Value := new_seed;
    dm.adod04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.adod04.Edit;
     dm.adod04SEED_VALUE.Value := new_seed;
     dm.adod04.Post;
    end;
end;

procedure TForm2.save_note();
begin
  with dm.ADOquery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select * from data0011');
    sql.Add('where source_type=112 and file_pointer='+dm.ADO112rkey.AsString);
    open;
   end;
 if (not dm.ADOquery1.IsEmpty) and (trim(invoice_note.Text)<>'') then
  begin //原记录有记事本
   dm.ADOquery1.Edit;
   dm.ADOquery1.fieldbyname('memo_text').AsString:=invoice_note.Text;
   dm.ADOquery1.Post;
  end
 else
  if (not dm.ADOquery1.IsEmpty) and (trim(invoice_note.Text)='') then
   dm.ADOquery1.Delete   //如果原记录有记事本但被删除了
  else
   if (dm.ADOquery1.IsEmpty) and (trim(invoice_note.Text)<>'') then
    begin           //如果原记录没有记事本，但新增了记事本
     dm.ADOquery1.Append;
     dm.ADOquery1.FieldByName('file_pointer').AsString:=dm.ADO112rkey.AsString;
     dm.ADOquery1.Fieldvalues['source_type']:=112;
     dm.ADOquery1.fieldbyname('memo_text').asstring:=invoice_note.Text;
     dm.ADOquery1.Post;
    end;
end;

procedure TForm2.FormActivate(Sender: TObject);
var
 i:integer;
begin
sgrid1.Cells[0,0]:='科目摘要';
sgrid1.Cells[1,0]:='科目代码及明称';
sgrid1.Cells[2,0]:='币种';
sgrid1.Cells[3,0]:='汇率';
sgrid1.Cells[4,0]:='原币金额';
sgrid1.Cells[5,0]:='借方(本币)';
sgrid1.Cells[6,0]:='贷方(本币)';

stringgrid1.Cells[0,0]:='装箱单号';
stringgrid1.Cells[1,0]:='送货日期';
stringgrid1.Cells[2,0]:='装运方法';
stringgrid1.Cells[3,0]:='不含税金额';
stringgrid1.Cells[4,0]:='rkey439';

stringgrid2.Cells[0,0]:='销售订单';
stringgrid2.Cells[1,0]:='本厂编号';
stringgrid2.Cells[2,0]:='客户型号';
//stringgrid2.Cells[3,0]:='版本';
stringgrid2.ColWidths[3]:=-1;
stringgrid2.Cells[4,0]:='客户订单号';
stringgrid2.Cells[5,0]:='装运数量';
stringgrid2.Cells[6,0]:='不含税价格';
stringgrid2.Cells[7,0]:='税率%';

stringgrid2.Cells[8,0]:='价格含税';
stringgrid2.Cells[9,0]:='rkey439';
stringgrid2.Cells[10,0]:='rkey64';
stringgrid2.Cells[11,0]:='discount';
stringgrid2.ColWidths[8]:=-1;
stringgrid2.ColWidths[9]:=-1;
stringgrid2.ColWidths[10]:=-1;
stringgrid2.ColWidths[11]:=-1;
if (dm.ADO112.State=dsedit) or (dm.ADO112.State=dsBrowse) then  //编辑或者检查
 begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='SELECT data0439.rkey, data0439.delivery_no, data0439.date_sailing,'+#13+
    'data0439.shipping_method,'+#13+
    'ROUND(SUM(Data0064.QUAN_SHIPPED * Data0064.part_price), 2)'+#13+
    'AS sum_amount'+#13+
    'FROM data0439 INNER JOIN'+#13+
    'Data0064 ON data0439.rkey = Data0064.packing_list_ptr'+#13+
    'WHERE data0439.invoice_ptr = '+dm.ADO112RKEY.AsString+#13+
    'GROUP BY data0439.rkey, data0439.delivery_no, data0439.date_sailing,'+#13+
    'data0439.shipping_method';
    open;
   end;
  stringgrid1.RowCount:=dm.ADOQuery1.RecordCount+2;
  for i:=1 to dm.ADOQuery1.RecordCount do
  begin
   stringgrid1.Cells[0,i]:=dm.ADOQuery1.FieldValues['delivery_no'];    //'装箱单号';
   stringgrid1.Cells[1,i]:=dm.ADOQuery1.fieldbyname('date_sailing').AsString; //'送货日期';
   stringgrid1.Cells[2,i]:=dm.ADOQuery1.fieldbyname('shipping_method').AsString; //'装运方法';
   stringgrid1.Cells[3,i]:=dm.ADOQuery1.fieldbyname('sum_amount').AsString; //'合计金额';
   stringgrid1.Cells[4,i]:=dm.ADOQuery1.fieldbyname('rkey').AsString;   //'rkey439';
   dm.ADOQuery1.Next;
  end;

  dm.ADOD64.Close;
  dm.ADOD64.Parameters[0].Value:=dm.ADO112RKEY.Value;
  dm.ADOD64.Open;
  stringgrid2.RowCount:=dm.ADOD64.RecordCount+2;
  for i:=1 to dm.ADOD64.RecordCount do
  begin
   stringgrid2.Cells[0,i]:=dm.ADOD64SALES_ORDER.Value; //'销售订单';
   stringgrid2.Cells[1,i]:=dm.ADOD64MANU_PART_NUMBER.Value; //'本厂编号';
   stringgrid2.Cells[2,i]:=dm.ADOD64MANU_PART_DESC.Value; // '客户型号';
   stringgrid2.Cells[4,i]:=dm.ADOD64PO_NUMBER.Value; //'客户订单号';
   stringgrid2.Cells[5,i]:=dm.ADOD64QUAN_SHIPPED.AsString; //'装运数量';
   stringgrid2.Cells[6,i]:=dm.ADOD64part_price.AsString; //'价格';
   stringgrid2.Cells[7,i]:=dm.ADOD64TAX_2.AsString; //'税率%';
   stringgrid2.Cells[8,i]:=dm.ADOD64tax_in_price.Value; //'价格含税';
   stringgrid2.Cells[9,i]:=dm.ADOD64packing_list_ptr.AsString; //'rkey439';
   stringgrid2.Cells[10,i]:=dm.ADOD64rkey.AsString; //'rkey64';
   stringgrid2.Cells[11,i]:=dm.ADOD64discount.AsString; //'discount';
   dm.ADOD64.Next;
  end;
  dm.Aqd105.Close;
  dm.Aqd105.Parameters[0].Value:=dm.ADO112RKEY.Value;
  dm.Aqd105.Open;
  edit4.Text:=dm.Aqd105VOUCHER.Value;
  edit6.Text:=dm.Aqd105ENTERED_DT.AsString;
  edit8.Text:=dm.Aqd105FYEAR.AsString;
  edit9.Text:=dm.Aqd105PERIOD.AsString;
  updown1.Position:=dm.Aqd105ATTACHED.Value;
  edit10.Text:=dm.Aqd105EMPLOYEE_NAME.Value;
  dm.Aqd106.Close;
  dm.Aqd106.Parameters[0].Value:=dm.Aqd105rkey.Value;
  dm.Aqd106.Open;
  sgrid1.RowCount:=dm.Aqd106.RecordCount+2;
  sgrid2.RowCount:=sgrid1.RowCount;
  for i:=1 to dm.Aqd106.RecordCount do
   begin
    sgrid1.Cells[0,i]:=dm.Aqd106DESCRIPTION.Value;
    sgrid1.Cells[1,i]:=dm.Aqd106gl_desc.Value;
    sgrid1.Cells[2,i]:=dm.aqd106curr_code.value;
    sgrid1.Cells[4,i]:=dm.Aqd106PRICE.AsString;

    if dm.Aqd106EXCH_RATE.Value>0 then
     sgrid1.Cells[3,i]:=formatfloat('0.00000000',1/dm.Aqd106EXCH_RATE.Value)
    else
     sgrid1.Cells[3,i]:='0.00';
    sgrid2.Cells[0,i]:=dm.Aqd106GL_ACCT_NO_PTR.AsString;
    sgrid2.Cells[1,i]:=dm.Aqd106CURR_PTR.AsString;
    if dm.Aqd106D_C.Value='D' then
     sgrid1.Cells[5,i]:=formatfloat('0.00',dm.Aqd106AMOUNT.Value)
    else
     sgrid1.Cells[6,i]:=formatfloat('0.00',dm.Aqd106AMOUNT.Value);
    dm.Aqd106.Next;
   end;
  dm.Aqd105.Close;
  dm.Aqd106.Close;

  with dm.ADOquery1 do   //打开发票记事本(新增模式从客户信息里复制过来）
   begin
    close;
    sql.Clear;
    sql.Add('select memo_text from data0011');
    sql.Add('where source_type=112 and file_pointer='+dm.ADO112rkey.AsString);
    open;
    if not isempty then
     invoice_note.Assign(fieldbyname('memo_text'));
   end;
 end
else         //新增
 begin
  with dm.ADOquery1 do   //打开发票记事本(新增模式从客户信息里复制过来）
   begin
    close;
    sql.Clear;
    sql.Add('select memo_text from data0011');
    sql.Add('where source_type=2010 and file_pointer='+dm.ADO112CUSTOMER_PTR.AsString);
    open;
    if not isempty then
     invoice_note.Assign(fieldbyname('memo_text'));
   end;
 end;

if sgrid1.RowCount=2 then
 begin
  speedbutton2.Enabled:=false;
  speedbutton3.Enabled:=false;
  speedbutton4.Enabled:=false;
  speedbutton5.Enabled:=false;
  speedbutton6.Enabled:=false;
 end
else
 self.re_calculate();//重新计算借货金额
self.PageControl1.ActivePageIndex:=0;
end;

procedure TForm2.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
   sgrid1.MouseToCell(x,y,column,row);
   if row<>0 then sgrid1.Row:=row;
   sgrid1.Col:=column;
 end;
end;

procedure TForm2.DBEdit7Exit(Sender: TObject);
begin
if dbedit7.Text='' then dm.ADO112net_pay.Value:=0;
dm.ADO112DUE_DATE.Value:=dm.ADO112POSTED_DATE.Value+
                         dm.ADO112net_pay.Value;
end;

procedure TForm2.DBEdit6Exit(Sender: TObject);
begin

if dbedit6.Text='' then
 dm.ADO112SHIPPING_CHARGES.Value:=0;

dm.ADO112SHIPPING_CHARGES.AsString:=
 floattostrf(dm.ADO112SHIPPING_CHARGES.Value,ffFixed,10,2);

  dm.ado112INVOICE_TOTAL.Value:=roundto(dm.ADO112ship_amount.Value+
                                dm.ado112FED_TAX_AMOUNT.Value-
                                dm.ado112DISCOUNT_AMOUNT.Value+
                                dm.ado112SHIPPING_CHARGES.Value,-2);
end;

procedure TForm2.DBEdit6KeyPress(Sender: TObject; var Key: Char);
begin
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',dbedit6.Text)>0  then abort;
end;


procedure TForm2.BitBtn2Click(Sender: TObject);
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption:='发票记事本:'+maskedit1.Text;
  if not bitbtn1.Enabled then
  with edit_note do
   begin
    bitbtn1.Enabled:=false;
    button1.Visible:=false;
    button2.Visible:=false;
    button3.Visible:=true;
    memo1.ReadOnly:=true;
    memo1.Color:=cl3dlight;
   end;

   edit_note.Memo1.Lines.Assign(invoice_note);

 if edit_note.ShowModal=mrok then
  begin
   invoice_note.Text:=edit_note.Memo1.Text;
  end;
 finally
  edit_note.free;
 end;
end;

procedure TForm2.N1Click(Sender: TObject);
var
 ship_price,ovsh_price,total_single,disc_single,tax_single:double;
// rush_amount,ovsh_amount,disc_amount,tax_amount,ship_amount:double;
begin
 if dm.ADOD64tax_in_price.Value='N' then  //(价格中不含税)
  begin
   ship_price := dm.ADOD64QUAN_SHIPPED.Value*dm.ADOD64part_price.Value;  //标准价款不含税
   ovsh_price := dm.ADOD64ovsh_qty.Value*dm.ADOD64part_price.Value*
                  (1-dm.ADOD64ovsh_discount.Value*0.01);  //溢装价款不含税
  end
 else                       //(价格中含税)
  begin
   ship_price := dm.ADOD64QUAN_SHIPPED.Value*dm.ADOD64part_price.Value/
                 (1+dm.ADOD64TAX_2.Value*0.01);  //标准价款不含税
   ovsh_price := dm.ADOD64ovsh_qty.Value*dm.ADOD64part_price.Value*
                 (1-dm.ADOD64ovsh_discount.Value*0.01)/
                 (1+dm.ADOD64TAX_2.Value*0.01);  //溢装价款不含税
  end;

 disc_single:=(ship_price+ovsh_price)*dm.ADOD64discount.Value*0.01; //折扣
 tax_single:=(ship_price+ovsh_price-disc_single)*
                       dm.ADOD64TAX_2.Value*0.01;                 //增值税
 total_single:=ship_price+ovsh_price-disc_single+tax_single;
 try
  form3:=tform3.Create(application);
  with form3 do
   begin
    edit1.Text:=formatfloat('0.00',ship_price);
    edit2.Text:=formatfloat('0.00',ovsh_price);
    edit4.Text:=formatfloat('0.00',disc_single);
    edit5.Text:=formatfloat('0.00',tax_single);
    edit6.Text:=formatfloat('0.00', total_single);
   end;
  dm.adod64.Edit;
  if form3.ShowModal=mrok then
   begin
    dm.ADO112OVERSHIP_AMOUNT.Value:=dm.ADO112OVERSHIP_AMOUNT.Value-ovsh_price+
                               strtocurr(form3.Edit2.text);
    dm.ADO112DISCOUNT_AMOUNT.Value:=dm.ADO112DISCOUNT_AMOUNT.Value-disc_single+
                               strtocurr(form3.Edit4.Text);
    dm.ADO112FED_TAX_AMOUNT.Value:=dm.ADO112FED_TAX_AMOUNT.Value-tax_single+
                               strtocurr(form3.edit5.Text);
    dm.ADO112INVOICE_TOTAL.Value:=dm.ADO112INVOICE_TOTAL.Value-total_single+
                               strtocurr(form3.edit6.Text);
    dm.ADOD64.Post;
   end
  else
   dm.ADOD64.Cancel;
 finally
  form3.free;
 end;
end;

procedure TForm2.N6Click(Sender: TObject);
var
 ship_price,ovsh_price,total_single,disc_single,tax_single:double;
 //rush_amount,ovsh_amount,disc_amount,tax_amount,ship_amount:double;
begin
 if dm.ADOD64tax_in_price.Value='N' then  //(价格中不含税)
  begin
   ship_price := dm.ADOD64QUAN_SHIPPED.Value*dm.ADOD64part_price.Value;  //标准价款不含税
   ovsh_price := dm.ADOD64ovsh_qty.Value*dm.ADOD64part_price.Value*
                  (1-dm.ADOD64ovsh_discount.Value*0.01);  //溢装价款不含税
  end
 else                       //(价格中含税)
  begin
   ship_price := dm.ADOD64QUAN_SHIPPED.Value*dm.ADOD64part_price.Value/
                 (1+dm.ADOD64TAX_2.Value*0.01);  //标准价款不含税
   ovsh_price := dm.ADOD64ovsh_qty.Value*dm.ADOD64part_price.Value*
                 (1-dm.ADOD64ovsh_discount.Value*0.01)/
                 (1+dm.ADOD64TAX_2.Value*0.01);  //溢装价款不含税
  end;

 disc_single:=(ship_price+ovsh_price)*dm.ADOD64discount.Value*0.01; //折扣
 tax_single:=(ship_price+ovsh_price-disc_single)*
                       dm.ADOD64TAX_2.Value*0.01;                 //增值税
 total_single:=ship_price+ovsh_price-disc_single+tax_single;
 try
  form3:=tform3.Create(application);
  with form3 do
   begin
    edit1.Text:=formatfloat('0.00',ship_price);
    edit2.Text:=formatfloat('0.00',ovsh_price);
    edit4.Text:=formatfloat('0.00',disc_single);
    edit5.Text:=formatfloat('0.00',tax_single);
    edit6.Text:=formatfloat('0.00', total_single);
    bitbtn1.Enabled:=false;
    dbedit15.Enabled:=false;
    dbedit17.Enabled:=false;
    dbedit18.Enabled:=false;
   end;

  form3.ShowModal;

 finally
  form3.free;
 end;
end;

procedure TForm2.PopupMenu3Popup(Sender: TObject);
begin
if sgrid1.Row=sgrid1.RowCount-1  then
 begin
  n5.Enabled:=false;
  n7.Enabled:=false;
  n8.Enabled:=false;
  n9.Enabled:=false;
  n11.Enabled:=false;
 end
else
 begin
  n5.Enabled:=true;
  n7.Enabled:=true;
  n8.Enabled:=true;
  n9.Enabled:=true;
  n11.Enabled:=true;
 end;
end;

procedure TForm2.SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
if arow=sgrid1.RowCount-1 then
 begin
  speedbutton2.Enabled:=false;
  speedbutton3.Enabled:=false;
  speedbutton4.Enabled:=false;
  speedbutton5.Enabled:=false;
  speedbutton6.Enabled:=false;
 end
else
 begin
  speedbutton2.Enabled:=true;
  speedbutton3.Enabled:=true;
  speedbutton4.Enabled:=true;
  speedbutton5.Enabled:=true;
  speedbutton6.Enabled:=true;
 end;

if (acol=1) or (acol=2) or (acol=3) or (arow=sgrid1.RowCount-1) then
 sgrid1.Options:=sgrid1.Options-[goEditing]
else
 sgrid1.Options:=sgrid1.Options+[goEditing];

if (sgrid1.col > 3) and (sgrid1.row<>sgrid1.RowCount-1) then
 begin
  if trim(sgrid1.Cells[4,sgrid1.row])='' then
   sgrid1.Cells[4,sgrid1.row]:='0';
  if sgrid1.col=5 then
  if (trim(sgrid1.Cells[5,sgrid1.row])='') and
     (trim(sgrid1.Cells[6,sgrid1.row])='') then
   sgrid1.Cells[5,sgrid1.row]:='0';
  if sgrid1.col=6 then
  if (trim(sgrid1.Cells[5,sgrid1.row])='') and
     (trim(sgrid1.Cells[6,sgrid1.row])='') then
   sgrid1.Cells[6,sgrid1.row]:='0';

if trim(sgrid1.Cells[sgrid1.col,sgrid1.row])<>'' then
 begin
  sgrid1.Cells[sgrid1.col,sgrid1.row]:=formatfloat('0.00',
  strtofloat(sgrid1.Cells[sgrid1.col,sgrid1.row]));

  case sgrid1.Col of
  5:      //借方
   begin
    sgrid1.Cells[6,sgrid1.Row]:='';
    sgrid1.Cells[4,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])/
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]) );
   end;
  6:       //贷方
   begin
    sgrid1.Cells[5,sgrid1.Row]:='';
    sgrid1.Cells[4,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])/
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]) );
   end;
  4:   //原币
   begin
    if trim(sgrid1.Cells[6,sgrid1.Row])<>'' then
     sgrid1.Cells[6,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])*
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]))
    else
     sgrid1.Cells[5,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])*
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]));
   end;
  end;
    self.re_calculate;
 end;
 end;
end;

procedure TForm2.SGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if sgrid1.Col<>0 then
 if not (key in ['0'..'9','.','-',#8, #13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',sgrid1.Cells[sgrid1.col,sgrid1.row])>0  then abort;
end;

procedure TForm2.SGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (acol>3) then
 Sgrid1.Canvas.TextRect(rect,rect.right-Sgrid1.Canvas.TextWidth(Sgrid1.Cells[acol,arow])
                 -2,rect.Top+2, Sgrid1.Cells[acol,aRow]);

end;

procedure TForm2.N7Click(Sender: TObject);
var
 i:word;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  begin
   sgrid1.Rows[i]:=sgrid1.Rows[i+1];
   sgrid2.Rows[i]:=sgrid2.Rows[i+1];
  end;
 sgrid1.RowCount:=sgrid1.RowCount-1;
 sgrid2.RowCount:=sgrid2.RowCount-1;
if sgrid1.Row=sgrid1.RowCount-1 then
 begin
  speedbutton2.Enabled:=false;
  speedbutton3.Enabled:=false;
  speedbutton4.Enabled:=false;
  speedbutton5.Enabled:=false;
  speedbutton6.Enabled:=false;
 end;
self.re_calculate;
end;

procedure TForm2.N4Click(Sender: TObject);
begin
try
 form_acct:=tform_acct.Create(application);
 if form_acct.ShowModal=mrok then
  try
   form_curr:=tform_curr.Create(application);
   if form_curr.ShowModal=mrok then
    begin
     if (form_acct.ADOQuery1curr_tp.Value=0) and
        (form_curr.ADOQuery1rkey.Value>1) then
      messagedlg('科目不允许核算外币',mterror,[mbcancel],0)
     else
      if (form_acct.ADOQuery1curr_tp.Value=2) and
         (form_acct.ADOQuery1curr_ptr.Value<>form_curr.ADOQuery1rkey.Value) then
       messagedlg('科目核算单一外币,但与所选择的外币不一致',mterror,[mbcancel],0)
      else
       begin
        sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                  sgrid1.Cells[0,sgrid1.RowCount-2];
        sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(form_acct.ADOQuery1GL_ACC_NUMBER.Value)+'-'+
                         trim(form_acct.ADOQuery1GL_DESCRIPTION.Value)+'-'+
                         trim(form_acct.ADOQuery1DESCRIPTION_2.Value);
        sgrid1.Cells[2,sgrid1.RowCount-1]:=form_curr.ADOQuery1curr_code.Value;

        if dm.ADO112CURRENCY_PTR.Value=form_curr.ADOQuery1rkey.Value then
         sgrid1.Cells[3,sgrid1.RowCount-1]:=dbedit3.Text
        else
         sgrid1.Cells[3,sgrid1.RowCount-1]:=form_curr.ADOQuery1base_to_other.AsString;

        sgrid2.Cells[0,sgrid2.RowCount-1]:=form_acct.ADOQuery1rkey.AsString;
        sgrid2.Cells[1,sgrid2.RowCount-1]:=form_curr.ADOQuery1rkey.AsString;
        sgrid1.RowCount:=sgrid1.RowCount+1;
        sgrid2.RowCount:=sgrid2.RowCount+1;
        if sgrid1.RowCount=3 then
         begin
         speedbutton2.Enabled:=true;
         speedbutton3.Enabled:=true;
         speedbutton4.Enabled:=true;
         speedbutton5.Enabled:=true;
         speedbutton6.Enabled:=true;
         end;
       end;
    end;
  finally
   form_curr.Free;
  end;
finally
 form_acct.Free;
end;
end;

procedure TForm2.N5Click(Sender: TObject);
begin
try
 form_acct:=tform_acct.Create(application);
 if form_acct.ShowModal=mrok then
  begin
   if (form_acct.ADOQuery1curr_tp.Value=0) and
      (strtoint(sgrid2.Cells[1,sgrid1.Row])>1) then
    messagedlg('科目不允许核算外币',mterror,[mbcancel],0)
   else
    if (form_acct.ADOQuery1curr_tp.Value=2) and
       (form_acct.ADOQuery1curr_ptr.Value<>strtoint(sgrid2.Cells[1,sgrid1.Row])) then
     messagedlg('科目核算单一外币,但与所选择的外币不一致',mterror,[mbcancel],0)
    else
     begin
      sgrid1.Cells[1,sgrid1.Row]:=              //科目
                         trim(form_acct.ADOQuery1GL_ACC_NUMBER.Value)+'-'+
                         trim(form_acct.ADOQuery1GL_DESCRIPTION.Value)+'-'+
                         trim(form_acct.ADOQuery1DESCRIPTION_2.Value);
      sgrid2.Cells[0,sgrid1.Row]:=form_acct.ADOQuery1rkey.AsString;
     end;
  end;
finally
 form_acct.Free;
end;
end;

procedure TForm2.N11Click(Sender: TObject);
begin
try
 form_curr:=tform_curr.Create(application);
 if form_curr.ShowModal=mrok then
  begin
   if (self.get_gltp(trim(sgrid2.Cells[0,sgrid1.row]))=0) and
      (form_curr.ADOQuery1rkey.Value>1) then
    messagedlg('科目不允许核算外币',mterror,[mbcancel],0)
   else
    if (self.get_gltp(trim(sgrid2.Cells[0,sgrid1.row]))=2) and   //单一外货
       (self.get_glcurr_ptr(trim(sgrid2.Cells[0,sgrid1.row]))<>
       form_curr.ADOQuery1rkey.Value) then
     messagedlg('科目核算单一外币,但与所选择的外币不一致',mterror,[mbcancel],0)
    else
     begin
      sgrid1.Cells[2,sgrid1.Row]:=              //货币
               form_curr.ADOQuery1curr_code.Value;

      if dm.ADO112CURRENCY_PTR.Value= form_curr.ADOQuery1rkey.Value then
       sgrid1.Cells[3,sgrid1.Row]:=dbedit3.Text
      else
       sgrid1.Cells[3,sgrid1.Row]:=form_curr.ADOQuery1base_to_other.AsString;
       
      sgrid2.Cells[1,sgrid1.Row]:=form_curr.ADOQuery1rkey.AsString;

     if trim(sgrid1.Cells[6,sgrid1.Row])<>'' then
      sgrid1.Cells[6,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[4,sgrid1.row])*
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]))
     else
      sgrid1.Cells[5,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[4,sgrid1.row])*
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]));
      self.re_calculate;
     end;
  end;
finally
 form_curr.Free;
end;
end;


procedure TForm2.N9Click(Sender: TObject);
begin
if (sgrid1.Row<>1) and (sgrid1.Row<>sgrid1.RowCount-1) then
 sgrid1.Cells[0,sgrid1.Row]:=sgrid1.Cells[0,sgrid1.Row-1];  
end;

procedure TForm2.SpeedButton7Click(Sender: TObject);
begin
if dm.ADO112.State=dsinsert then
 edit4.Text:=self.get_voucher(strtodate(edit6.Text))
else
 messagedlg('编辑状态下不能修改凭证编号!',mterror,[mbcancel],0);
end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
begin
  if trim(maskedit1.Text)='' then
   begin
    messagedlg('发票编号不允许为空',mterror,[mbok],0);
    self.PageControl1.ActivePageIndex:=0;
    maskedit1.SetFocus;
    exit;
   end;

  if not dm.ADOd04.Active then dm.ADOd04.Open;
  if (dm.ADOd04SEED_FLAG.Value<>1) and
     (dm.ADO112.State=dsinsert) then
  if not (maskedit1.Text[length(trim(maskedit1.Text))] in ['0'..'9']) then
   begin
    messagedlg('发票编号最后一位必需是一个整数!',mtinformation,[mbok],0);
    self.PageControl1.ActivePageIndex:=0;
    maskedit1.SetFocus;
    exit;
   end;

  if DBEdit4.Field.AsDateTime <= common.getmaxnokp_date(dm.ADOQuery1) then
   begin
    messagedlg('发票日期不能少于最大的未开票截数日期!',mtinformation,[mbok],0);
    self.PageControl1.ActivePageIndex:=0;
    DBEdit4.SetFocus;
    exit;
   end;


if sgrid1.RowCount=2 then PageControl1Change(sender);

if sgrid1.RowCount>2 then
 begin
  if strtocurr(RemoveInvalid(statictext1.Caption))<>
     strtocurr(RemoveInvalid(statictext2.Caption)) then
   begin
    messagedlg('科目借贷双方金额不一致!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    sgrid1.SetFocus;
    exit;
   end;
{
  if ExRoundTo(dm.ADO112INVOICE_TOTAL.Value*dm.ADO112EXCHANGE_RATE.Value,2)<>
     ExRoundTo(strtofloat(RemoveInvalid(statictext1.Caption)),2) then
}


  if not dm.Aqd508.Active then dm.Aqd508.Open;

  if (strtoint(Edit8.Text) < dm.Aqd508CURR_FYEAR.Value) or
     ((strtoint(Edit8.Text) <= dm.Aqd508CURR_FYEAR.Value) and
      (strtoint(Edit9.Text) < dm.Aqd508CURR_PERIOD.Value)) then
   begin
    messagedlg('凭证年度或者期间小于当前会计年度或者期间!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    edit6.SetFocus;
    exit;
   end;

  if (strtoint(Edit9.Text) <> monthof(strtodate(edit6.text))) then
   begin
    messagedlg('凭证期间不等于凭证日期限的会计期间请修改!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    edit6.SetFocus;
    exit;
   end;

 end;
end;

procedure TForm2.SGrid1Exit(Sender: TObject);
begin
if (sgrid1.col > 3) and (sgrid1.row<>sgrid1.RowCount-1) then
 begin
  if trim(sgrid1.Cells[4,sgrid1.row])='' then
   sgrid1.Cells[4,sgrid1.row]:='0';
  if sgrid1.col=5 then
  if (trim(sgrid1.Cells[5,sgrid1.row])='') and
     (trim(sgrid1.Cells[6,sgrid1.row])='') then
   sgrid1.Cells[5,sgrid1.row]:='0';
  if sgrid1.col=6 then
  if (trim(sgrid1.Cells[5,sgrid1.row])='') and
     (trim(sgrid1.Cells[6,sgrid1.row])='') then
   sgrid1.Cells[6,sgrid1.row]:='0';

if trim(sgrid1.Cells[sgrid1.col,sgrid1.row])<>'' then
 begin
  sgrid1.Cells[sgrid1.col,sgrid1.row]:=formatfloat('0.00',
  strtofloat(sgrid1.Cells[sgrid1.col,sgrid1.row]));
  case sgrid1.Col of
  5:      //借方
   begin
    sgrid1.Cells[6,sgrid1.Row]:='';
    sgrid1.Cells[4,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])/
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]) );
   end;
  6:       //贷方
   begin
    sgrid1.Cells[5,sgrid1.Row]:='';
    sgrid1.Cells[4,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])/
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]) );
   end;
  4:   //原币
   begin
    if trim(sgrid1.Cells[6,sgrid1.Row])<>'' then
     sgrid1.Cells[6,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])*
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]))
    else
     sgrid1.Cells[5,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[sgrid1.col,sgrid1.row])*
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]));
   end;
  end;
    self.re_calculate;
 end;
end;
 SGrid1.Col:=0;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 i:word;
begin
if sgrid1.RowCount>2 then
  if formatfloat('0.00',dm.ADO112INVOICE_TOTAL.Value*dm.ADO112EXCHANGE_RATE.Value)<>
    RemoveInvalid(statictext1.Caption) then
   begin
    if messagedlg('科目借方金额与发票发生额不一致是否继续?',mtconfirmation,[mbyes,mbno],0)=mrno then
     begin
      self.PageControl1.ActivePageIndex:=1;
      sgrid1.SetFocus;
      exit;
     end;
   end;
   if not Check64TotalQty then
   begin
     ShowMsg('经检查装运数量发生变化，不允许保存',1);
     Exit;
   end;
if dm.ADO112.State=dsInsert then //新增
 begin

  if self.find_pkinvoice then
   begin
    showmsg('操作失败，可能多人同时生成发票，请退出重来！',1);
    exit;
   end;

  if self.invo_number_error(trim(maskedit1.Text)) then
   begin
    dm.ADOD04.Close;
    dm.ADOD04.Open;
    if dm.ADOD04SEED_FLAG.Value<>1 then
     begin
      MaskEdit1.Text:=dm.ADOD04SEED_VALUE.Value;
      messagedlg('发票编号重复可能多人同时新增,系统已自动更新编号!',mterror,[mbcancel],0);
     end
    else
     begin
      messagedlg('发票编号重复!请手工重新输入',mterror,[mbok],0);
      self.PageControl1.ActivePageIndex:=0;
      maskedit1.SetFocus;
      exit;
     end;
   end;
  if sgrid1.RowCount>2 then
  if self.vo_number(trim(edit4.Text)) then
   begin
    edit4.Text:=self.get_voucher(strtodate(edit6.text));
    messagedlg('凭证编号重复可能多人同时新增,系统已自动更新编号!',mterror,[mbcancel],0);
   end;
  dm.ADOConnection1.BeginTrans;
  try
   dm.ADO112invoice_number.Value:=maskedit1.Text;
   dm.ADO112GLPTR_STATUS.Value:=(dm.fincontrol1='Y');
   dm.ADO112.Post;

   self.save_note();
   self.update_439_60(dm.ADO112RKEY.Value);
   //==================保存新增发票及送货价格等==============
   dm.ADOD04.Close;
   dm.ADOD04.Open;
   if dm.ADOD04SEED_FLAG.Value<>1 then
    self.update_04(trim(dm.ADOD04SEED_VALUE.Value));
   //=================更新初始值================
  if sgrid1.RowCount>2 then
   begin
    with dm.ado105 do                                        //增加会计凭证总表
    begin
     close;
     dm.ado105.Parameters[0].Value:=dm.ADO112RKEY.Value;
     open;
     append;
     dm.ado105VOUCHER.Value:=Edit4.Text;                          //凭证号
     dm.ado105BATCH_NUMBER.Value:=DM.ADO112invoice_number.Value;  //参考发票号
     dm.ado105TRANS_TYPE.Value:=5;                                //类型
     dm.ado105VOU_TYPE.Value:=0;
     dm.ado105SOURCE_PTR.Value:=dm.ADO112RKEY.Value;              //发票指针
     dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ADO112EMPL_PTR.Value; //输入人员
     dm.ado105ENTERED_DT.Value:=strtodate(edit6.text);      //输入日期
     dm.ado105ATTACHED.Value := strtoint(edit7.Text);            //附件张数
     dm.ado105FYEAR.Value := strtoint(edit8.Text);                //会计年度
     dm.ado105PERIOD.Value := strtoint(edit9.Text);               //会计期间
     dm.ado105CUSTOMER_PTR.Value:=dm.ADO112CUSTOMER_PTR.value;
     post;
    end;
    dm.ADO106.Close;
    dm.ADO106.Parameters[0].Value:=dm.ADO105RKEY.Value;
    dm.ADO106.Open;
    for i:=1 to SGrid2.RowCount-2 do
    begin
    dm.ado106.Append;
    dm.ado106GL_HEADER_PTR.Value:=dm.ado105RKEY.Value;
    dm.ado106GL_ACCT_NO_PTR.AsString:=sgrid2.Cells[0,i];
    dm.ADO106CURR_PTR.AsString:=sgrid2.Cells[1,i];
    dm.ADO106EXCH_RATE.AsString:=
    Floattostrf(1/strtofloat(sgrid1.Cells[3,i]),ffFixed,12,8);
    dm.ado106REF_NUMBER.Value:=dm.ADO112invoice_number.Value;
    dm.ado106DESCRIPTION.Value:=sgrid1.Cells[0,i];
    dm.ADO106PRICE.AsString := sgrid1.Cells[4,i]; //原币
    if (trim(sgrid1.Cells[5,i])<>'') then
     begin
      dm.ado106AMOUNT.AsString:=sgrid1.Cells[5,i];
      dm.ado106D_C.Value:='D';               //借方
     end
    else
     begin
      dm.ado106AMOUNT.AsString:=sgrid1.Cells[6,i];
      dm.ado106D_C.Value:='C';               //贷方
     end;
    dm.ado106.Post;
   end;
   end;
   //============================保存凭证===================
  dm.ADOConnection1.CommitTrans;

 if (CheckBox1.Checked) and (not dm.ADO105.IsEmpty)  then
  begin
   form_voucherreport:=Tform_voucherreport.Create(application);
   form_voucherreport.ppReport1.Reset;
   form_voucherreport.ppReport1.Template.FileName :=
    stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'VOUCHER_REPORT.rtm';    //R:\NIERP\Report\VOUCHER_REPORT.rtm
   form_voucherreport.ppReport1.Template.LoadFromFile;
   form_voucherreport.AQD105.Close;
   form_voucherreport.AQD105.Parameters[0].Value:=dm.ADO105RKEY.Value;
   form_voucherreport.AQD105.open;
   form_voucherreport.AQD106.Open;
   form_voucherreport.AQD493.Open;
   form_voucherreport.ppReport1.Print;
   form_voucherreport.Free;
  end;

   self.ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
 end
else    //编辑
 begin
  with dm.ado105 do                    //增加会计凭证总表
   begin
    close;
    dm.ado105.Parameters[0].Value:=dm.ADO112RKEY.Value;
    open;
   end;
  if dm.ADO105STATUS.Value>0 then
   begin
    common.ShowMsg('凭证状态发生变化,编辑不能进行请取消保存重试!',1)
   end
  else
  try
   dm.ADOConnection1.BeginTrans;
   dm.ADO112invoice_number.Value:=maskedit1.Text;
   dm.ADO112GLPTR_STATUS.Value:=(dm.fincontrol1='Y');
   dm.ADO112.Post;
   self.save_note();
   self.update_439_60(dm.ADO112RKEY.Value);


  if not dm.ado105.isempty then dm.ado105.Delete;
  dm.ADO106.Close;
  dm.ADO106.Parameters[0].Value:=dm.ADO105RKEY.Value;
  dm.ADO106.Open;

  if sgrid1.RowCount>2 then
   begin
    with dm.ado105 do                                        //增加会计凭证总表
    begin
     append;
     dm.ado105VOUCHER.Value:=Edit4.Text;                          //凭证号
     dm.ado105BATCH_NUMBER.Value:=DM.ADO112invoice_number.Value;  //参考发票号
     dm.ado105TRANS_TYPE.Value:=5;                                //类型
     dm.ado105VOU_TYPE.Value:=0;
     dm.ado105SOURCE_PTR.Value:=dm.ADO112RKEY.Value;              //发票指针
     dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ADO112EMPL_PTR.Value; //输入人员
     dm.ado105ENTERED_DT.Value:=strtodate(edit6.text);      //输入日期
     dm.ado105ATTACHED.Value := strtoint(edit7.Text);            //附件张数
     dm.ado105FYEAR.Value := strtoint(edit8.Text);                //会计年度
     dm.ado105PERIOD.Value := strtoint(edit9.Text);               //会计期间
     dm.ado105CUSTOMER_PTR.Value:=dm.ADO112CUSTOMER_PTR.value;
     post;
    end;

    for i:=1 to SGrid2.RowCount-2 do
    begin
    dm.ado106.Append;
    dm.ado106GL_HEADER_PTR.Value:=dm.ado105RKEY.Value;
    dm.ado106GL_ACCT_NO_PTR.AsString:=sgrid2.Cells[0,i];
    dm.ADO106CURR_PTR.AsString:=sgrid2.Cells[1,i];
    dm.ADO106EXCH_RATE.AsString:=
    Floattostrf(1/strtofloat(sgrid1.Cells[3,i]),ffFixed,12,8);
    dm.ado106REF_NUMBER.Value:=dm.ADO112invoice_number.Value;
    dm.ado106DESCRIPTION.Value:=sgrid1.Cells[0,i];
    dm.ADO106PRICE.AsString := sgrid1.Cells[4,i]; //原币    
    if (trim(sgrid1.Cells[5,i])<>'') then
     begin
      dm.ado106AMOUNT.AsString:=sgrid1.Cells[5,i];
      dm.ado106D_C.Value:='D';               //借方
     end
    else
     begin
      dm.ado106AMOUNT.AsString:=sgrid1.Cells[6,i];
      dm.ado106D_C.Value:='C';               //贷方
     end;
    dm.ado106.Post;
   end;
   end;

   dm.ADOConnection1.CommitTrans;

    if (CheckBox1.Checked) and (not dm.ADO105.IsEmpty)  then
    begin
    form_voucherreport:=Tform_voucherreport.Create(application);
    form_voucherreport.ppReport1.Reset;
    form_voucherreport.ppReport1.Template.FileName :=
     stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'VOUCHER_REPORT.rtm';    //R:\NIERP\Report\VOUCHER_REPORT.rtm
    form_voucherreport.ppReport1.Template.LoadFromFile;
    form_voucherreport.AQD105.Close;
    form_voucherreport.AQD105.Parameters[0].Value:=dm.ADO105RKEY.Value;
    form_voucherreport.AQD105.open;
    form_voucherreport.AQD106.Open;
    form_voucherreport.AQD493.Open;
    form_voucherreport.ppReport1.Print;
    form_voucherreport.Free;
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
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 invoice_note:=tstringlist.Create;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
 invoice_note.free;
end;

procedure TForm2.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','-',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm2.Edit6Exit(Sender: TObject);
begin
try
 strtodate(edit6.Text);
except
 messagedlg('日期格式输入有误!',mterror,[mbcancel],0);
 edit6.SetFocus;
 exit;
end;
if dm.ADO112.State=dsinsert then  //新增
 begin
  edit4.Text:=self.get_voucher(strtodate(edit6.Text));
 end;
end;

procedure TForm2.SGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
 v_c:currency;
begin
if key=13 then    //用户按下回车键,左右对调
 begin
  if sgrid1.Row<> sgrid1.RowCount-1 then
  begin
   if (sgrid1.Col=5) and (sgrid1.Cells[6,sgrid1.Row]<>'') then
    begin
    sgrid1.Cells[5,sgrid1.Row]:=sgrid1.Cells[6,sgrid1.Row];
    sgrid1.Cells[6,sgrid1.Row]:='';
    end;
   if (sgrid1.Col=6) and (sgrid1.Cells[5,sgrid1.Row]<>'') then
    begin
    sgrid1.Cells[6,sgrid1.Row]:=sgrid1.Cells[5,sgrid1.Row];
    sgrid1.Cells[5,sgrid1.Row]:='';
    end;

  self.re_calculate;
  end;
 end;

if key=187 then    //用户按下=键,自动计算
 begin
  if sgrid1.Row <> sgrid1.RowCount-1 then
  begin

   if (sgrid1.Col=5) and (sgrid1.Cells[6,sgrid1.Row]='') then
   begin
    v_c:=strtocurr(RemoveInvalid(statictext2.Caption))-get_col5(sgrid1.Row);
    if v_c <> 0 then
     sgrid1.Cells[5,sgrid1.Row]:=formatfloat('0.00',v_c);
   end;

   if (sgrid1.Col=6) and (sgrid1.Cells[5,sgrid1.Row]='') then
   begin
    v_c:=strtocurr(RemoveInvalid(statictext1.Caption))-get_col6(sgrid1.Row);
    if v_c <> 0 then
    sgrid1.Cells[6,sgrid1.Row]:=formatfloat('0.00',v_c);
   end;

   self.re_calculate;
  end;
 end;
end;

procedure TForm2.N8Click(Sender: TObject);
begin
try
form_dictionary:=Tform_dictionary.Create(application);
if form_dictionary.ShowModal=mrok then
 sgrid1.Cells[0,sgrid1.Row]:=form_dictionary.aq513DSDesigner2.Value;
finally
form_dictionary.Free;
end;
end;

procedure TForm2.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm2.PopupMenu2Popup(Sender: TObject);
begin
 if stringgrid1.Row=stringgrid1.RowCount-1 then
  begin
   n3.Enabled:=false;
  end
 else
  begin
   n3.Enabled:=true;
  end;
end;

procedure TForm2.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
   stringgrid1.MouseToCell(x,y,column,row);
   if row<>0 then stringgrid1.Row:=row;
 end;
end;

procedure TForm2.N3Click(Sender: TObject);
var
 i,j:word;
 find_22:boolean;

begin
    find_22:=true;
    while find_22 do
     begin
      if stringgrid2.RowCount>2 then
      begin
        for i:=1 to stringgrid2.RowCount-2 do
        if strtoint(stringgrid2.Cells[9,i])=strtoint(stringgrid1.Cells[4,stringgrid1.row])  then
        begin
             for j:=i to stringgrid2.RowCount-2 do
                  stringgrid2.Rows[j].Text:=stringgrid2.Rows[j+1].Text;
                  stringgrid2.RowCount:=stringgrid2.RowCount-1;
             break;
        end //结束FOR 循环
        else
         if i=stringgrid2.RowCount-2 then
          find_22:=false;
      end
      else
       find_22:=false;
     end;   //结束WHILE循环

  with dm.ADOQuery1 do
  begin
    close;
    sql.Text:='select charge from data0439 where rkey='+stringgrid1.Cells[4,stringgrid1.row];
    open;
  end;
  dm.ADO112SHIPPING_CHARGES.Value:=dm.ADO112SHIPPING_CHARGES.Value-
                                   dm.ADOQuery1.fieldbyname('charge').AsCurrency;

  for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
        stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
        stringgrid1.RowCount:=stringgrid1.RowCount-1;

      ///chenyang  2014-06-05-------------
        with dm.ADOQuery1 do
        begin
          close;
          sql.Text:= ' SELECT  round(sum((dbo.Data0064.QUAN_SHIPPED * dbo.Data0064.part_price) '+#13+
                     '            * (1 + dbo.Data0064.tax_2 * 0.01)),2) AS tax_amount,  '+#13+
                     '   round(sum(dbo.Data0064.QUAN_SHIPPED * dbo.Data0064.part_price),2) AS notax_amount, '+#13+
                     '   round(sum(dbo.Data0064.QUAN_SHIPPED * dbo.Data0064.part_price   '+#13+
                     '                                 * dbo.Data0064.tax_2 * 0.01),2) as tax '+#13+
                     '   FROM   dbo.Data0060 INNER JOIN   '+#13+
                     '          dbo.Data0064 ON dbo.Data0060.RKEY = dbo.Data0064.SO_PTR  '+#13+
                     '   WHERE  (Data0064.packing_list_ptr in '+return_vifrkey(StringGrid1,4)+')';

           Open;
        end;
        dm.ado112ship_amount.Value :=  DM.ADOQuery1.fieldbyname('notax_amount').AsCurrency;
        dm.ado112FED_TAX_AMOUNT.Value :=  DM.ADOQuery1.fieldbyname('tax').AsCurrency;
        dm.ADO112INVOICE_TOTAL.Value :=  dm.ADO112SHIPPING_CHARGES.Value+
                                         DM.ADOQuery1.fieldbyname('tax').AsCurrency+
                                         DM.ADOQuery1.fieldbyname('notax_amount').AsCurrency;
    ///end  chenyang  2014-06-05-------------
end;

procedure TForm2.N2Click(Sender: TObject);
var
 so:string;
begin
    try
         form_selectpk:=Tform_selectpk.Create(application);
         form_selectpk.aqd439.Close;
         form_selectpk.aqd439.Parameters.ParamValues['rkey10']:=dm.ADO112CUSTOMER_PTR.Value;
         form_selectpk.aqd439.Parameters.ParamValues['rkey01']:=dm.ADO112CURRENCY_PTR.Value;
         form_selectpk.aqd439.Parameters.ParamValues['rkey15']:=dm.ADO112warehouse_ptr.Value;
         form_selectpk.aqd439.open;
         form_selectpk.aqd64.Open;
          if form_selectpk.aqd439.IsEmpty then
           showmessage('没有找到符合条件的装箱单')
          else
          if form_selectpk.ShowModal=mrok then
           begin
                if self.if_toolsamount(so) then
                   messagedlg('订单'+so+'未先开工具费用发票,必需先开工具费用发票',mtconfirmation,[mbcancel],0)
                else
                if self.find_grn(form_selectpk.aqd439rkey.Value) then
                   showmessage('该装箱单单已经在发票里面了,不能重复增加')
                else
                begin
                  stringgrid1.Cells[0,stringgrid1.RowCount-1]:=form_selectpk.aqd439delivery_no.Value;
                  stringgrid1.Cells[1,stringgrid1.RowCount-1]:=form_selectpk.aqd439date_sailing.AsString;
                  stringgrid1.Cells[2,stringgrid1.RowCount-1]:=form_selectpk.aqd439shipping_method.Value;
                  stringgrid1.Cells[3,stringgrid1.RowCount-1]:=form_selectpk.aqd439sum_amount.AsString;
                  stringgrid1.Cells[4,stringgrid1.RowCount-1]:=form_selectpk.aqd439rkey.AsString;
                  stringgrid1.RowCount:=stringgrid1.RowCount+1;

                  form_selectpk.aqd64.First;
                 while not form_selectpk.aqd64.Eof do
                 begin
                   stringgrid2.Cells[0,stringgrid2.RowCount-1]:=form_selectpk.aqd64SALES_ORDER.Value;
                   stringgrid2.Cells[1,stringgrid2.RowCount-1]:=form_selectpk.aqd64MANU_PART_NUMBER.Value;
                   stringgrid2.Cells[2,stringgrid2.RowCount-1]:=form_selectpk.aqd64MANU_PART_DESC.Value;
                   stringgrid2.Cells[4,stringgrid2.RowCount-1]:=form_selectpk.aqd64PO_NUMBER.AsString;
                   stringgrid2.Cells[5,stringgrid2.RowCount-1]:=form_selectpk.aqd64QUAN_SHIPPED.AsString;
                   stringgrid2.Cells[6,stringgrid2.RowCount-1]:=form_selectpk.aqd64part_price.AsString;
                   stringgrid2.Cells[7,stringgrid2.RowCount-1]:=form_selectpk.aqd64TAX_2.AsString;
                   stringgrid2.Cells[8,stringgrid2.RowCount-1]:=form_selectpk.aqd64tax_in_price.Value;
                   stringgrid2.Cells[9,stringgrid2.RowCount-1]:=form_selectpk.aqd64packing_list_ptr.AsString;
                   stringgrid2.Cells[10,stringgrid2.RowCount-1]:=form_selectpk.aqd64rkey.AsString;
                   stringgrid2.Cells[11,stringgrid2.RowCount-1]:=form_selectpk.aqd64discount.AsString;
                   StringGrid2.RowCount:=form2.StringGrid2.RowCount+1;
                   form_selectpk.aqd64.Next;
                 end; //结束64子表循环

                  ///chenyang  2014-06-05-------------
                  with dm.ADOQuery1 do
                  begin
                    close;
                    sql.Text:=
                               ' SELECT  round(sum((dbo.Data0064.QUAN_SHIPPED * dbo.Data0064.part_price)    '+#13+
                               '                            * (1 + dbo.Data0064.tax_2 * 0.01)),2) AS tax_amount, '+#13+
                               ' round(sum(dbo.Data0064.QUAN_SHIPPED * dbo.Data0064.part_price),2) AS notax_amount, '+#13+
                               ' round(sum(dbo.Data0064.QUAN_SHIPPED * dbo.Data0064.part_price           '+#13+
                               '                            * dbo.Data0064.tax_2 * 0.01),2) as tax       '+#13+
                               '  FROM         dbo.Data0060 INNER JOIN                                 '+#13+
                               '            dbo.Data0064 ON dbo.Data0060.RKEY = dbo.Data0064.SO_PTR    '+#13+
                               '   WHERE     (Data0064.packing_list_ptr in '+return_vifrkey(StringGrid1,4)+')';
                    Open;
                  end;
                  dm.ado112ship_amount.Value :=  DM.ADOQuery1.fieldbyname('notax_amount').AsCurrency;
                  dm.ado112FED_TAX_AMOUNT.Value :=  DM.ADOQuery1.fieldbyname('tax').AsCurrency;
                  dm.ADO112SHIPPING_CHARGES.Value :=  dm.ADO112SHIPPING_CHARGES.Value+
                                                   form_selectpk.aqd439charge.Value;
                  dm.ADO112INVOICE_TOTAL.Value :=  dm.ADO112SHIPPING_CHARGES.Value+
                                              DM.ADOQuery1.fieldbyname('tax').AsCurrency+
                                              DM.ADOQuery1.fieldbyname('notax_amount').AsCurrency;
                  //end  chenyang  2014-06-05
                end;
           end;
    finally
        form_selectpk.Free;
    end;
end;

procedure TForm2.PageControl1Change(Sender: TObject);
var
 ys_total:single;
 mt_error:boolean;
 i:integer;
begin
if (dm.ADO112.State=dsbrowse) or (dm.fincontrol1='N') then exit;
if (dm.ADO112.State=dsinsert) or (trim(edit4.Text)='') then
if (strtocurr(formatfloat('0.00',dm.ADO112INVOICE_TOTAL.Value*
                                 dm.ADO112EXCHANGE_RATE.Value))<>
    strtocurr(RemoveInvalid(statictext1.Caption))) then
begin
 Edit8.Text:=inttostr(yearof(dm.ADO112POSTED_DATE.Value));   //会计年度
 Edit9.Text:=inttostr(monthof(dm.ADO112POSTED_DATE.Value));  //会计期间
 Edit6.Text:=dm.ADO112POSTED_DATE.AsString;                  //会计日期
 edit4.Text := form1.get_vouchernumber(dm.ADO112POSTED_DATE.Value);  //凭证编号
 Edit10.Text := form1.empl_name.Caption;  //制作人员
 for i:=1 to sgrid1.RowCount-2 do
  begin
   sgrid1.Rows[i].Clear;
   sgrid2.Rows[i].Clear;
  end;
 sgrid1.RowCount:=2;
 sgrid2.RowCount:=2;
 mt_error:=true;
 dm.ADO104.Close;
 dm.ADO104.Open;           //打开会计分录定义

 if dm.ADO112INVOICE_TOTAL.Value>0 then
   begin
    with dm.ADOQuery1 do     //处理应收帐款净价格发票总价格不能为零
     begin
      close;
      sql.Clear;
      sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
      sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
      sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
      sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
      if self.ACC_REC_PTR>0 then
       sql.Add('where Data0103.rkey='+inttostr(self.ACC_REC_PTR))
      else
       sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_01.AsString);
      open;

      case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       form2.sgrid1.Cells[2,form2.sgrid1.RowCount-1]:= form1.curr_code.Caption;  //货币
       form2.sgrid1.Cells[3,form2.sgrid1.RowCount-1]:='1' ;          //汇率
       form2.sgrid1.Cells[4,form2.sgrid1.RowCount-1]:=               //原币金额
         Formatfloat('0.00',dm.ADO112INVOICE_TOTAL.Value*
                            dm.ADO112EXCHANGE_RATE.Value);
       form2.sgrid2.Cells[1,form2.sgrid2.RowCount-1]:='1';
      end;

      2:             //核算单一外币
      begin
       if fieldbyname('curr_ptr').AsInteger=dm.ADO112CURRENCY_PTR.Value then
        begin
         form2.sgrid1.Cells[2,form2.sgrid1.RowCount-1]:=edit5.text;      //货币
         form2.sgrid1.Cells[3,form2.sgrid1.RowCount-1]:=               //汇率
                           dm.ADO112EXCHANGE_RATE.AsString;
         form2.sgrid1.Cells[4,form2.sgrid1.RowCount-1]:=               //原币金额
                           formatfloat('0.00',dm.ADO112INVOICE_TOTAL.Value);
         form2.sgrid2.Cells[1,form2.sgrid2.RowCount-1]:=
                         dm.ado112CURRENCY_PTR.AsString;
        end
       else
        begin
         messagedlg('对不起客户信息中所定义的A/R帐目核算单一外币,且与销售货币不一致',mterror,[mbcancel],0);
         mt_error:=false;
        end;
      end;
      end;
      if mt_error then
      begin
      form2.sgrid1.Cells[0,form2.sgrid1.RowCount-1]:='销售入帐'+              //摘要
                         form2.MaskEdit1.Text+ '['+
                         edit1.text+
                         abbr_name.caption+']';
      form2.sgrid1.Cells[1,form2.sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
      form2.sgrid1.Cells[5,form2.sgrid1.RowCount-1]:=        //借方本币金额
                        formatfloat('0.00',dm.ADO112INVOICE_TOTAL.Value*
                        dm.ADO112EXCHANGE_RATE.Value);
      if ACC_REC_PTR>0 then
       form2.sgrid2.Cells[0,form2.sgrid2.RowCount-1]:=inttostr(self.ACC_REC_PTR)
      else
       form2.sgrid2.Cells[0,form2.sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_01.AsString;
      form2.sgrid1.RowCount:=form2.sgrid1.RowCount+1;
      form2.sgrid2.RowCount:=form2.sgrid2.RowCount+1;
      end;
     end;       //以上为借方
    //============================处理产品销售收入=============================
    mt_error:=true;
    ys_total:=dm.ADO112ship_amount.Value-dm.ADO112DISCOUNT_AMOUNT.Value;
    if ys_total>0 then
    with dm.ADOQuery1 do
     begin
      close;
      sql.Clear;
      sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
      sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
      sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
      sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
      sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_02.AsString);
      open;

      case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       form2.sgrid1.Cells[2,form2.sgrid1.RowCount-1]:= form1.curr_code.Caption;   //货币
       form2.sgrid1.Cells[3,form2.sgrid1.RowCount-1]:='1' ;          //汇率
       form2.sgrid1.Cells[4,form2.sgrid1.RowCount-1]:=               //原币金额
                        formatfloat('0.00',ys_total*dm.ADO112EXCHANGE_RATE.Value);
       form2.sgrid2.Cells[1,form2.sgrid2.RowCount-1]:='1';
      end;

      2:             //核算单一外币
      begin
       if fieldbyname('curr_ptr').AsInteger=dm.ado112CURRENCY_PTR.Value then
        begin
         form2.sgrid1.Cells[2,form2.sgrid1.RowCount-1]:=edit5.text;     //货币
         form2.sgrid1.Cells[3,form2.sgrid1.RowCount-1]:=               //汇率
                           dm.ADO112EXCHANGE_RATE.AsString;
         form2.sgrid1.Cells[4,form2.sgrid1.RowCount-1]:=               //原币金额
                           formatfloat('0.00',ys_total);
         form2.sgrid2.Cells[1,form2.sgrid2.RowCount-1]:=dm.ado112CURRENCY_PTR.AsString;
        end
       else
        begin
         messagedlg('对不起客户信息中所定义的A/R帐目核算单一外币,且与销售货币不一致',mterror,[mbcancel],0);
         mt_error:=false;
        end;
      end;
      end;
      if mt_error then
      begin
      form2.sgrid1.Cells[0,form2.sgrid1.RowCount-1]:='销售入帐'+              //摘要
                         form2.MaskEdit1.Text+ '['+
                         edit1.text+
                         abbr_name.caption+']';

      form2.sgrid1.Cells[1,form2.sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
      form2.sgrid1.Cells[6,form2.sgrid1.RowCount-1]:=     //贷方本币金额
                        formatfloat('0.00',ys_total*dm.ADO112EXCHANGE_RATE.Value);
      form2.sgrid2.Cells[0,form2.sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_02.AsString;
      form2.sgrid1.RowCount:=form2.sgrid1.RowCount+1;
      form2.sgrid2.RowCount:=form2.sgrid2.RowCount+1;
      end;
     end;
   //============================= 处理运输费用=================================
   if dm.ADO112SHIPPING_CHARGES.Value>0 then
    with dm.ADOQuery1 do
     begin
      close;
      sql.Clear;
      sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
      sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
      sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
      sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
      sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_04.AsString);
      open;

      case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       form2.sgrid1.Cells[2,form2.sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       form2.sgrid1.Cells[3,form2.sgrid1.RowCount-1]:='1' ;          //汇率
       form2.sgrid1.Cells[4,form2.sgrid1.RowCount-1]:=               //原币金额
                        formatfloat('0.00',dm.ADO112SHIPPING_CHARGES.Value*
                        dm.ADO112EXCHANGE_RATE.Value);
       form2.sgrid2.Cells[1,form2.sgrid2.RowCount-1]:='1';
      end;

      2:             //核算单一外币
      begin
       if fieldbyname('curr_ptr').AsInteger=dm.ado112CURRENCY_PTR.Value then
        begin
         form2.sgrid1.Cells[2,form2.sgrid1.RowCount-1]:=               //货币
                           edit5.text;
         form2.sgrid1.Cells[3,form2.sgrid1.RowCount-1]:=               //汇率
                           dm.ADO112EXCHANGE_RATE.AsString;
         form2.sgrid1.Cells[4,form2.sgrid1.RowCount-1]:=               //原币金额
                           formatfloat('0.00',dm.ADO112SHIPPING_CHARGES.Value);
         form2.sgrid2.Cells[1,form2.sgrid2.RowCount-1]:=
                         dm.ado112CURRENCY_PTR.AsString;
        end
       else
        begin
         messagedlg('对不起客户信息中所定义的A/R帐目核算单一外币,且与销售货币不一致',mterror,[mbcancel],0);
         mt_error:=false;
        end;
      end;
      end;
      if mt_error then
      begin
      form2.sgrid1.Cells[0,form2.sgrid1.RowCount-1]:='销售入帐'+  //摘要
                         form2.MaskEdit1.Text+ '['+
                         edit1.text+
                         abbr_name.caption+']';
      form2.sgrid1.Cells[1,form2.sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
      form2.sgrid1.Cells[6,form2.sgrid1.RowCount-1]:=        //贷方本币金额
                        formatfloat('0.00',dm.ADO112SHIPPING_CHARGES.Value*
                        dm.ADO112EXCHANGE_RATE.Value);
      form2.sgrid2.Cells[0,form2.sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_04.AsString;
      form2.sgrid1.RowCount:=form2.sgrid1.RowCount+1;
      form2.sgrid2.RowCount:=form2.sgrid2.RowCount+1;
      end;
     end;
//=============================处理税金======================================
   if dm.ADO112FED_TAX_AMOUNT.Value>0 then
    with dm.ADOQuery1 do
     begin
      close;
      sql.Clear;
      sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
      sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
      sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
      sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
      sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_06.AsString);
      open;

      case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       form2.sgrid1.Cells[2,form2.sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       form2.sgrid1.Cells[3,form2.sgrid1.RowCount-1]:='1' ;          //汇率
       form2.sgrid1.Cells[4,form2.sgrid1.RowCount-1]:=               //原币金额
                        formatfloat('0.00',dm.ADO112FED_TAX_AMOUNT.Value*
                        dm.ADO112EXCHANGE_RATE.Value);
       form2.sgrid2.Cells[1,form2.sgrid2.RowCount-1]:='1';
      end;

      2:             //核算单一外币
      begin
       if fieldbyname('curr_ptr').AsInteger=dm.ado112CURRENCY_PTR.Value then
        begin
         form2.sgrid1.Cells[2,form2.sgrid1.RowCount-1]:=               //货币
                           edit5.text;
         form2.sgrid1.Cells[3,form2.sgrid1.RowCount-1]:=               //汇率
                           dm.ADO112EXCHANGE_RATE.AsString;
         form2.sgrid1.Cells[4,form2.sgrid1.RowCount-1]:=               //原币金额
                           formatfloat('0.00',dm.ADO112FED_TAX_AMOUNT.Value);
         form2.sgrid2.Cells[1,form2.sgrid2.RowCount-1]:=
                         dm.ado112CURRENCY_PTR.AsString;
        end
       else
        begin
         messagedlg('对不起客户信息中所定义的A/R帐目核算单一外币,且与销售货币不一致',mterror,[mbcancel],0);
         mt_error:=false;
        end;
      end;
      end;
      if mt_error then
      begin
      form2.sgrid1.Cells[0,form2.sgrid1.RowCount-1]:='销售入帐'+  //摘要
                         form2.MaskEdit1.Text+ '['+
                         edit1.text+
                         abbr_name.caption+']';
      form2.sgrid1.Cells[1,form2.sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
      form2.sgrid1.Cells[6,form2.sgrid1.RowCount-1]:=        //贷方本币金额
                        formatfloat('0.00',dm.ADO112FED_TAX_AMOUNT.Value*
                        dm.ADO112EXCHANGE_RATE.Value);
      form2.sgrid2.Cells[0,form2.sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_06.AsString;
      form2.sgrid1.RowCount:=form2.sgrid1.RowCount+1;
      form2.sgrid2.RowCount:=form2.sgrid2.RowCount+1;
      end;
     end;
   end;

 self.re_calculate;
if sgrid1.RowCount=2 then
 begin
  speedbutton2.Enabled:=false;
  speedbutton3.Enabled:=false;
  speedbutton4.Enabled:=false;
  speedbutton5.Enabled:=false;
  speedbutton6.Enabled:=false;
 end
else
 begin
  speedbutton2.Enabled:=true;
  speedbutton3.Enabled:=true;
  speedbutton4.Enabled:=true;
  speedbutton5.Enabled:=true;
  speedbutton6.Enabled:=true;
 end;
 
end;
end;

procedure TForm2.DBEdit8Exit(Sender: TObject);
begin
  if self.REG_TAX_FIXED_UNUSED = 1 then      //发票到期计算方法为货到
    dm.ADO112DUE_DATE.Value := dm.ADO112INVOICE_DATE.Value+dm.ADO112net_pay.Value
  else  //发票到期计算方法为月结
    dm.ADO112DUE_DATE.Value :=
      StrToDate(DATETOSTR(EndOfTheMonth(dm.ADO112INVOICE_DATE.Value)))+ dm.ADO112net_pay.Value;
end;

function TForm2.Check64TotalQty: boolean;
var
  i,Qty_Sql,Qty_Local:integer;
  rkey439,SQLStr:string;
begin
//Jacky Zhong 2015-12-04
//1.循环439，获取rkey列表
  result:=true;
  for i:= 1 to stringgrid1.RowCount-2 do
  begin
    if rkey439='' then
      rkey439:=stringgrid1.Cells[4,i]
    else
      rkey439:=rkey439+','+stringgrid1.Cells[4,i];
  end;
  if rkey439='' then exit;
  //获取64装运数量
  SQLStr:=' SELECT SUM(Data0064.QUAN_SHIPPED) as TotalQty FROM dbo.data0439 INNER JOIN '+
          ' dbo.Data0064 ON dbo.data0439.rkey = dbo.Data0064.packing_list_ptr WHERE data0439.rkey in ('+rkey439+')';
  with dm do
  begin
    ADOQuery1.close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add(SQLStr);
    ADOQuery1.Open;
    Qty_Sql:= ADOQuery1.Fields[0].AsInteger;
    ADOQuery1.close;
  end;
  Qty_Local:=0;
  if stringgrid2.RowCount>2 then
  begin
    for i:=1 to stringgrid2.RowCount-2 do
        Qty_Local:=Qty_Local+StrToint(stringgrid2.Cells[5,i]); //装运数量
  end;
  result:=Qty_Sql=Qty_Local;
end;

end.
