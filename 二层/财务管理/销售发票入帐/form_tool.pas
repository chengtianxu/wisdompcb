unit form_tool;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, Grids, Menus, DB, ADODB,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, DBGrids,math;

type
  TForm4 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label19: TLabel;
    Label3: TLabel;
    Label20: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    MaskEdit1: TMaskEdit;
    Edit1: TEdit;
    Edit5: TEdit;
    DBEdit3: TDBEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    DBEdit4: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit14: TDBEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    SGrid3: TStringGrid;
    Label17: TLabel;
    DBEdit2: TDBEdit;
    Label22: TLabel;
    DBEdit5: TDBEdit;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label25: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Edit8: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    CheckBox1: TCheckBox;
    UpDown1: TUpDown;
    Panel1: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    Edit15: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Sgrid1: TStringGrid;
    sgrid2: TStringGrid;
    CheckBox2: TCheckBox;
    Label31: TLabel;
    PopupMenu3: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N11: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Label32: TLabel;
    Edit4: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure recalculation();
    procedure update_data065();
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit7KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SGrid3DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    function vo_number(number:string): boolean;
    function invo_number_error(number: string): boolean;
    function get_voucher(invoice_date: tdatetime): string;
    function get_gltp(rkey103: string): integer;
    function get_glcurr_ptr(rkey103: string): integer;
    procedure re_calculate;
    procedure BitBtn1Click(Sender: TObject);
    procedure save_note();
    procedure update_04(v_seed:string);
    procedure Sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Sgrid1Exit(Sender: TObject);
    procedure Sgrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure Edit11Exit(Sender: TObject);
    procedure Sgrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N8Click(Sender: TObject);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit6Exit(Sender: TObject);
  private
    { Private declarations }
   invoice_note: tstringlist;
   function get_col5(row:integer):currency;
   function get_col6(row:integer):currency;
   function find_sotools_price(rkey60:integer): boolean;   
  public
    { Public declarations }
    REG_TAX_FIXED_UNUSED:integer;
  end;

var
  Form4: TForm4;
  function RemoveInvalid(where: string): string;
  function Power(x, y : extended) : extended;

implementation
uses damo,  note,  main, AcctSearch, curr_search, voucher_report,
  voucher_dictionary,common;
{$R *.dfm}
function TForm4.get_col5(row: integer): currency;
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

function TForm4.get_col6(row: integer): currency;
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

procedure TForm4.update_data065();
var
 i:byte;
begin
 with dm.ADO65 do
  begin
   close;
   dm.ADO65.Parameters[0].Value:=dm.ADO112RKEY.Value;
   open;
  end;
 while not dm.ADO65.Eof do dm.ADO65.Delete;
 for i:=1 to SGrid3.RowCount-1 do
  if (strtocurr(sgrid3.Cells[2,i])>0) or
     (strtocurr(sgrid3.Cells[3,i])>0) then
   begin
    dm.ADO65.Append;
    dm.ADO65INVOICE_PTR.Value:=dm.ADO112RKEY.Value;
    dm.ADO65ADDL_CATEGORY_PTR.AsString:=sgrid3.Cells[4,i];
    dm.ADO65AMOUNT.AsString:=sgrid3.Cells[3,i];
    dm.ADO65FREE_AMOUNT.AsString:=sgrid3.Cells[2,i];
    dm.ADO65TAXABLE_FLAG.Value:=sgrid3.Cells[1,i];
    dm.ADO65.Post;
   end;
end;

procedure TForm4.save_note();
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

function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
end;

procedure TForm4.update_04(v_seed: string);
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

function TForm4.vo_number(number: string): boolean;
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

function TForm4.find_sotools_price(rkey60:integer): boolean;
begin
result:=false;
 with dm.ADOQuery1 do
 begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0060');
   sql.Add('where TOTAL_ADD_L_PRICE-INVD_ADD_L_PRICE>0');
   sql.Add('and rkey='+inttostr(rkey60));
   open;
 end;
if dm.ADOQuery1.IsEmpty then
 result:=true;
end;

function TForm4.invo_number_error(number: string): boolean;
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

procedure TForm4.re_calculate;
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

function TForm4.get_voucher(invoice_date: tdatetime): string;
var
 voucher:string;
 pr_req:integer;
begin

 Edit13.Text:=inttostr(yearof(invoice_date));
 Edit14.Text:=inttostr(monthof(invoice_date));

 voucher:='TA'+copy(Edit13.Text,3,2);  //年度
 if length(Edit14.Text) < 2 then
  voucher := voucher+'0'+Edit14.Text
 else
  voucher := voucher+Edit14.Text;      //月份
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

function TForm4.get_gltp(rkey103: string): integer;
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

function TForm4.get_glcurr_ptr(rkey103: string): integer;
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

procedure TForm4.FormCreate(Sender: TObject);
var
 i:byte;
begin
 invoice_note:=tstringlist.Create;

 sgrid3.Cells[0,0]:='工具费用类别';
 sgrid3.Cells[1,0]:='征税';
 sgrid3.Cells[2,0]:='免收金额';
 sgrid3.Cells[3,0]:='应收金额';
 WITH dm.ADOQuery1 DO
  begin
   active:=false;
   sql.Clear;            //查找工具费用类别
   sql.Add('select rkey,category,PTR_TO_GL_ACCT,tax_flag ');
   sql.Add('from data0061 order by rkey');
   active:=true;
   sgrid3.RowCount:=recordcount+1;
   for i:=1 to RecordCount do
   begin
    sgrid3.Cells[0,i]:=fieldbyname('category').AsString;
    sgrid3.Cells[1,i]:=fieldbyname('tax_flag').AsString;
    sgrid3.Cells[2,i]:='0.0000';
    SGrid3.Cells[3,i]:='0.0000';
    sgrid3.Cells[4,i]:=fieldbyname('rkey').AsString;
    next;
   end;
  end;
end;

procedure tForm4.recalculation();
var
 i:byte;
 tax_base,tools_amount:currency;
begin
 tax_base:=0;
 tools_amount:=0;
 for i:=1 to sgrid3.RowCount-1 do
 begin
   if strtocurr(SGrid3.cells[3,i])>0 then
    if NOT checkbox2.Checked then  //价格不含税
    BEGIN
     tools_amount:=tools_amount+strtocurr(floattostrf(           //不含税金额
                    strtocurr(SGrid3.cells[3,i]),fffixed,10,2));
     if (trim(SGrid3.Cells[1,i])='Y') then  //工具费用记税
     tax_base:=tax_base+strtocurr(floattostrf(                   //税金
       strtocurr(SGrid3.cells[3,i])*dm.ADO112ship_tax.Value*0.01,ffFixed,10,2));
    END
    ELSE               //价格含税
     if (trim(SGrid3.Cells[1,i])='Y') then  //工具费用记税
     begin
      tools_amount:=tools_amount+strtocurr(floattostrf(
                    strtocurr(SGrid3.cells[3,i])/
                    (1+dm.ADO112ship_tax.Value*0.01),fffixed,10,2));  //不含税金额

      tax_base:=tax_base+strtocurr(floattostrf(
                      strtocurr(SGrid3.cells[3,i])*  //税金
                       dm.ADO112ship_tax.Value*0.01/
                       (1+dm.ADO112ship_tax.Value*0.01),ffFixed,10,2));
     end
     else
     begin
      tools_amount:=tools_amount+strtocurr(floattostrf(           //不含税金额
                    strtocurr(SGrid3.cells[3,i]),fffixed,10,2));
     end;
 end;

 dm.ADO112ship_tax_amount.Value:=tax_base;
 dm.ADO112TOOLING_CHARGES.Value:=tools_amount;
 dm.ADO112INVOICE_TOTAL.Value:=dm.ADO112TOOLING_CHARGES.Value+dm.ADO112ship_tax_amount.Value;
end;

procedure TForm4.DBEdit7Exit(Sender: TObject);
begin
 if dbedit7.Text='' then dm.ADO112ship_tax.Value:=0;
 recalculation();
end;

procedure TForm4.DBEdit7KeyPress(Sender: TObject; var Key: Char);
begin
 if (key = chr(46)) then  //如果是小数点
  if pos('.',(sender as tdbedit).Text)>0 then  //小数点不能重复
   abort;
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
 popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm4.N1Click(Sender: TObject);
var
 i:byte;
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption:='销售定单记事本:'+edit2.Text;
  edit_note.BitBtn1.Enabled:=false;
  edit_note.Memo1.ReadOnly:=true;
  edit_note.Memo1.Color:=cl3dlight;
  edit_note.Button1.Visible:=false;
  edit_note.Button2.Visible:=false;
  edit_note.Button3.Visible:=true;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select * from data0011');
    sql.Add('where source_type=60 and');
    sql.Add('file_pointer='+dm.ADO112sales_order_ptr.AsString);
    open;
    if not isempty then
    for i:=1 to 4 do
    edit_note.Memo1.Lines.Add(fieldbyname('note_pad_line_'+inttostr(i)).AsString);
   end;
  edit_note.ShowModal;
 finally
  edit_note.free;
 end;
end;

procedure TForm4.N2Click(Sender: TObject);
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption:='客户记事本:'+edit1.Text;
  with edit_note do
   begin
    bitbtn1.Enabled:=false;
    button1.Visible:=false;
    button2.Visible:=false;
    button3.Visible:=true;
    memo1.ReadOnly:=true;
    memo1.Color:=cl3dlight;
   end;
  with dm.ADOquery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select memo_text from data0011');
    sql.Add('where source_type=2010 and file_pointer='+dm.ADo112customer_ptr.AsString);
    open;
   if not isempty then
    edit_note.Memo1.Lines.Assign(fieldbyname('memo_text'));
   end;
 edit_note.ShowModal;
 finally
  edit_note.free;
 end;
end;

procedure TForm4.N3Click(Sender: TObject);
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption:='发票记事本:'+maskedit1.Text;
  if bitbtn1.Enabled = false then
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
   invoice_note.Text:=edit_note.Memo1.Text;
 finally
  edit_note.free;
 end;
end;

procedure TForm4.FormDestroy(Sender: TObject);
begin
 invoice_note.free;
end;

procedure TForm4.FormActivate(Sender: TObject);
var
 i:word;
begin
sgrid1.Cells[0,0]:='科目摘要';
sgrid1.Cells[1,0]:='科目代码及明称';
sgrid1.Cells[2,0]:='币种';
sgrid1.Cells[3,0]:='汇率';
sgrid1.Cells[4,0]:='原币金额';
sgrid1.Cells[5,0]:='借方(本币)';
sgrid1.Cells[6,0]:='贷方(本币)';

if dm.ADo112.State=dsinsert then     //新增
  begin
   with dm.ADOquery1 do   //打开发票记事本(新增模式从客户信息里复制过来）
   begin
    close;
    sql.Clear;
    sql.Add('select memo_text from data0011');
    sql.Add('where source_type=2010 and file_pointer='+dm.ADO112CUSTOMER_PTR.AsString);
    open;
    invoice_note.Assign(fieldbyname('memo_text'));
   end;
  end
else           //编辑
 begin
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

  dm.Aqd105.Close;
  dm.Aqd105.Parameters[0].Value:=dm.ADO112RKEY.Value;
  dm.Aqd105.Open;
  edit8.Text:=dm.Aqd105VOUCHER.Value;
  edit11.Text:=dm.Aqd105ENTERED_DT.AsString;
  edit13.Text:=dm.Aqd105FYEAR.AsString;
  edit14.Text:=dm.Aqd105PERIOD.AsString;
  updown1.Position:=dm.Aqd105ATTACHED.Value;
  edit15.Text:=dm.Aqd105EMPLOYEE_NAME.Value;
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

 //   sgrid1.Cells[4,i]:=formatfloat('0.00',dm.Aqd106AMOUNT.value*
  //                                 dm.Aqd106EXCH_RATE.Value);
    sgrid1.Cells[3,i]:=formatfloat('0.00000000',1/dm.Aqd106EXCH_RATE.Value);
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
  //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  with dm.ADO65 do
   begin
    close;
    dm.ADO65.Parameters[0].Value:=dm.ADO112RKEY.Value;
    open;
   end;
  while not dm.ADO65.Eof do
   begin
    for i:=1 to SGrid3.RowCount-1 do
     if (dm.ADO65ADDL_CATEGORY_PTR.Value=strtoint(form4.sgrid3.Cells[4,i])) then
      begin
       SGrid3.Cells[2,i]:=formatfloat('0.00',dm.ADO65FREE_AMOUNT.Value);
       SGrid3.Cells[3,i]:=formatfloat('0.00',dm.ADO65AMOUNT.Value);
       break;
      end;
    dm.ADO65.Next;
   end;
   dm.ADO65.Close;
  //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 end; //编辑
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

procedure TForm4.BitBtn1Enter(Sender: TObject);
begin
if trim(maskedit1.Text)='' then
 begin
  messagedlg('发票编号不能为空!',mtinformation,[mbcancel],0);
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

  if not dm.Aqd508.Active then dm.Aqd508.Open;
  if (strtoint(Edit13.Text) < dm.Aqd508CURR_FYEAR.Value) or
     ((strtoint(Edit13.Text) <= dm.Aqd508CURR_FYEAR.Value) and
     (strtoint(Edit14.Text) < dm.Aqd508CURR_PERIOD.Value)) then
   begin
    messagedlg('凭证年度或者期间小于当前会计年度或者期间!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    edit11.SetFocus;
    exit;
   end;
  if (strtoint(Edit14.Text) <> monthof(strtodate(edit11.text))) then
   begin
    messagedlg('凭证期间不等于凭证日期限的会计期间请修改!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    edit11.SetFocus;
    exit;
   end;
 end;
end;



procedure TForm4.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    key:=#0;
    perform(wm_nextdlgctl,0,0);{移动到下一个控件}
  end;
end;

procedure TForm4.SGrid3DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (acol=2) or (acol=3) then
 Sgrid3.Canvas.TextRect(rect,rect.right-Sgrid3.Canvas.TextWidth(Sgrid3.Cells[acol,arow])-2,
 rect.Top+2, Sgrid3.Cells[acol,aRow]);
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
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

if dm.ADO112.State=dsInsert then //新增
 begin
  if self.find_sotools_price(dm.ADO112sales_order_ptr.Value) then
   begin
    showmsg('操作失败可能多人同时操作一张销售订单工具费用!',1);
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
  if self.vo_number(trim(edit8.Text)) then
   begin
    edit8.Text:=self.get_voucher(strtodate(edit11.text));
    messagedlg('凭证编号重复可能多人同时新增,系统已自动更新编号!',mterror,[mbcancel],0);
   end;
  dm.ADOConnection1.BeginTrans;
  try
   dm.ADO112invoice_number.Value:=maskedit1.Text;
   dm.ADO112GLPTR_STATUS.Value:=(dm.fincontrol1='Y');
   dm.ADO112.Post;
   self.update_data065;
   self.save_note();
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
     dm.ado105VOUCHER.Value:=Edit8.Text;                          //凭证号
     dm.ado105BATCH_NUMBER.Value:=DM.ADO112invoice_number.Value;  //参考发票号
     dm.ado105TRANS_TYPE.Value:=5;                                //类型
     dm.ado105VOU_TYPE.Value:=0;
     dm.ado105SOURCE_PTR.Value:=dm.ADO112RKEY.Value;              //发票指针
     dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ADO112EMPL_PTR.Value; //输入人员
     dm.ado105ENTERED_DT.Value:=strtodate(edit11.Text);      //输入日期
     dm.ado105ATTACHED.Value := strtoint(edit12.Text);              //附件张数
     dm.ado105FYEAR.Value := strtoint(edit13.Text);                //会计年度
     dm.ado105PERIOD.Value := strtoint(edit14.Text);               //会计期间
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
   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0060');
     sql.Add('set data0060.INVD_ADD_L_PRICE=TOTAL_ADD_L_PRICE');
     sql.Add('where rkey='+dm.ADO112sales_order_ptr.AsString);
     ExecSQL;
    end;
   //===============更新销售订单发票数量==========================
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

  if not dm.ado105.isempty then dm.ado105.Delete;
  dm.ADO106.Close;
  dm.ADO106.Parameters[0].Value:=dm.ADO105RKEY.Value;
  dm.ADO106.Open;

   if sgrid1.RowCount>2 then
   begin
    with dm.ado105 do                                        //增加会计凭证总表
    begin
     append;
     dm.ado105VOUCHER.Value:=Edit8.Text;                          //凭证号
     dm.ado105BATCH_NUMBER.Value:=DM.ADO112invoice_number.Value;  //参考发票号
     dm.ado105TRANS_TYPE.Value:=5;                                //类型
     dm.ado105VOU_TYPE.Value:=0;
     dm.ado105SOURCE_PTR.Value:=dm.ADO112RKEY.Value;              //发票指针
     dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ADO112EMPL_PTR.Value; //输入人员
     dm.ado105ENTERED_DT.Value:=strtodate(edit11.Text);           //输入日期
     dm.ado105ATTACHED.Value := strtoint(edit12.Text);              //附件张数
     dm.ado105FYEAR.Value := strtoint(edit13.Text);                //会计年度
     dm.ado105PERIOD.Value := strtoint(edit14.Text);               //会计期间
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

procedure TForm4.Sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (acol>3) then
 Sgrid1.Canvas.TextRect(rect,rect.right-Sgrid1.Canvas.TextWidth(Sgrid1.Cells[acol,arow])
                 -2,rect.Top+2, Sgrid1.Cells[acol,aRow]);

end;

procedure TForm4.Sgrid1Exit(Sender: TObject);
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

procedure TForm4.Sgrid1KeyPress(Sender: TObject; var Key: Char);
begin
if sgrid1.Col<>0 then
 if not (key in ['0'..'9','.','-',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',sgrid1.Cells[sgrid1.col,sgrid1.row])>0  then abort;
end;

procedure TForm4.Sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TForm4.Sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TForm4.N4Click(Sender: TObject);
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
        sgrid1.Cells[2,sgrid1.RowCount-1]:=
                  form_curr.ADOQuery1curr_code.Value;

        if dm.ado112CURRENCY_PTR.Value=form_curr.ADOQuery1rkey.Value then
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

procedure TForm4.N5Click(Sender: TObject);
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

procedure TForm4.N11Click(Sender: TObject);
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
               
     if dm.ado112CURRENCY_PTR.Value=form_curr.ADOQuery1rkey.Value then
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

procedure TForm4.N7Click(Sender: TObject);
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

procedure TForm4.N9Click(Sender: TObject);
begin
if (sgrid1.Row<>1) and (sgrid1.Row<>sgrid1.RowCount-1) then
 sgrid1.Cells[0,sgrid1.Row]:=sgrid1.Cells[0,sgrid1.Row-1];  
end;

procedure TForm4.DBEdit5Exit(Sender: TObject);
begin
if dbedit5.Text='' then dm.ADO112net_pay.Value:=0;
dm.ADO112DUE_DATE.Value:=dm.ADO112INVOICE_DATE.Value+
                         dm.ADO112net_pay.Value;
end;

procedure TForm4.SpeedButton7Click(Sender: TObject);
begin
if dm.ADO112.State=dsinsert then
 edit8.Text:=self.get_voucher(strtodate(edit11.Text))
else
 messagedlg('编辑状态下不能修改凭证编号!',mterror,[mbcancel],0);
end;

procedure TForm4.PopupMenu3Popup(Sender: TObject);
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

procedure TForm4.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','-',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm4.Edit11Exit(Sender: TObject);
begin
try
 strtodate(edit11.Text);
except
 messagedlg('日期格式输入有误!',mterror,[mbcancel],0);
 edit11.SetFocus;
 exit;
end;
if dm.ADO112.State=dsinsert then  //新增
 begin
  edit8.Text:=self.get_voucher(strtodate(edit11.Text));
 end; 
end;

procedure TForm4.Sgrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TForm4.N8Click(Sender: TObject);
begin
try
form_dictionary:=Tform_dictionary.Create(application);
if form_dictionary.ShowModal=mrok then
 sgrid1.Cells[0,sgrid1.Row]:=form_dictionary.aq513DSDesigner2.Value;
finally
form_dictionary.Free;
end;
end;

procedure TForm4.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm4.DBEdit6Exit(Sender: TObject);
begin
  if self.REG_TAX_FIXED_UNUSED = 1 then      //发票到期计算方法为货到
    dm.ADO112DUE_DATE.Value := dm.ADO112INVOICE_DATE.Value+dm.ADO112net_pay.Value
  else  //发票到期计算方法为月结
    dm.ADO112DUE_DATE.Value :=
       StrToDate(DATETOSTR(EndOfTheMonth(dm.ADO112INVOICE_DATE.Value)))+ dm.ADO112net_pay.Value;
end;

end.
