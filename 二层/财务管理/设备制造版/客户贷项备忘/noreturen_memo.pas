unit noreturen_memo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, ComCtrls, Buttons, ToolWin, Mask,
  DBCtrls, ExtCtrls, DB, ADODB,DateUtils;

type
  TForm3 = class(TForm)
    Panel2: TPanel;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label3: TLabel;
    Label2: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    abbr_name: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit5: TEdit;
    Edit4: TEdit;
    edit2: TEdit;
    edit1: TEdit;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    Edit3: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    TabSheet2: TTabSheet;
    Label23: TLabel;
    Label24: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Label25: TLabel;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    CheckBox1: TCheckBox;
    UpDown1: TUpDown;
    Panel1: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    Edit16: TEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    Sgrid1: TStringGrid;
    sgrid2: TStringGrid;
    PopupMenu3: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N11: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Label16: TLabel;
    Edit10: TEdit;
    BitBtn1: TBitBtn;
    Label17: TLabel;
    procedure Edit5Exit(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Edit12Exit(Sender: TObject);
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    function get_gltp(rkey103:string):integer;
    function get_glcurr_ptr(rkey103: string): integer;
    procedure re_calculate;
    function get_vouchernumber(inv_date: tdatetime): string;
    function vo_number(number: string): boolean;
    function memo_number_error(number: string): boolean;
    procedure update_04(v_seed: string);    
    procedure PageControl1Change(Sender: TObject);
    procedure BitBtn2Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Sgrid1Exit(Sender: TObject);
    procedure Sgrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Sgrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure N8Click(Sender: TObject);
    procedure Edit13KeyPress(Sender: TObject; var Key: Char);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
   acc_gl_ptr:integer;
   function get_col5(row:integer):currency;
   function get_col6(row:integer):currency;       
  public
    { Public declarations }
   CUST_PTR:integer;
  end;

var
  Form3: TForm3;
  function Power(x, y : extended) : extended;
  function RemoveInvalid(where: string): string;
implementation

uses DAMO, AcctSearch, curr_search, customer_search, main, voucher_report,
  voucher_dictionary,common,Pick_Item_Single,ConstVar;

{$R *.dfm}

function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
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

function TForm3.get_col5(row: integer): currency;
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

function TForm3.get_col6(row: integer): currency;
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


function TForm3.get_gltp(rkey103: string): integer;
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

procedure TForm3.re_calculate;
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

function TForm3.get_glcurr_ptr(rkey103: string): integer;
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

function TForm3.get_vouchernumber(inv_date: tdatetime): string;
var
 voucher:string;
 pr_req:integer;
begin

  voucher:='TA'+copy(inttostr(yearof(inv_date)),3,2);  //年度

 if length(inttostr(monthof(inv_date))) < 2 then
  voucher := voucher+'0'+inttostr(monthof(inv_date))
 else
  voucher := voucher+inttostr(monthof(inv_date));      //月份
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
 result:=voucher;
end;

function TForm3.vo_number(number: string): boolean;
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

function TForm3.memo_number_error(number: string): boolean;
begin
result:=false;
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0116');
  sql.Add('where MEMO_NUMBER='''+number+'''');
  open;
  if not IsEmpty then  result:=true;
 end;
end;


procedure TForm3.update_04(v_seed: string);
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

procedure TForm3.Edit5Exit(Sender: TObject);
begin
if trim(edit5.Text)='' then
 begin
  showmessage('汇率数据输入有误!');
  edit5.SetFocus;
 end
else
 if strtofloat(edit5.Text)<=0 then
  begin
   showmessage('汇率数据输入有误!');
   edit5.SetFocus;
  end
 else
  begin
   edit5.Text:=formatfloat('0.00000000',strtofloat(edit5.Text));
  end;
end;

procedure TForm3.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as tedit).Text)>0  then abort;
end;

procedure TForm3.Edit3Exit(Sender: TObject);
begin
if trim((sender as tedit).Text)='' then
  (sender as tedit).Text:='0';
(sender as tedit).Text:=formatfloat('0.00',
                         strtocurr(trim((sender as tedit).Text))
                                    );

edit9.Text:=formatfloat('0.00',strtocurr(edit3.Text)+
                           strtocurr(edit6.Text)+
                           strtocurr(edit7.Text)+
                           strtocurr(edit8.Text)
                        );
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
begin
try
form_customer:=tform_customer.Create(application);
if form_customer.ShowModal=mrok then
 begin
  dm.ado116CUST_PTR.Value:=form_customer.ADOQuery1rkey.Value;
  edit1.Text:=form_customer.ADOQuery1CUST_CODE.Value;
  label14.Caption:=form_customer.ADOQuery1CUSTOMER_NAME.Value;
  self.acc_gl_ptr:=form_customer.ADOQuery1ACC_REC_PTR.Value;
  abbr_name.Caption:=form_customer.ADOQuery1abbr_name.Value;
  edit2.Text:=form_customer.ADOQuery1CURR_CODE.Value;
  label15.Caption:=form_customer.ADOQuery1CURR_NAME.Value;
  edit5.Text:=form_customer.ADOQuery1base_to_other.AsString;
  dm.ado116CURRENCY_PTR.Value:=form_customer.ADOQuery1CURRENCY_PTR.Value;
  if dm.ado116CURRENCY_PTR.Value=1 then
   edit5.Enabled:=false
  else
   edit5.Enabled:=true;
 end;
finally
 form_customer.Free;
end;
end;

procedure TForm3.BitBtn5Click(Sender: TObject);
begin
form_curr:=tform_curr.Create(application);
if form_curr.ShowModal=mrok then
 begin
  edit2.Text:=form_curr.ADOQuery1CURR_CODE.Value;
  label15.Caption:=form_curr.ADOQuery1CURR_NAME.Value;
  edit5.Text:=form_curr.ADOQuery1base_to_other.AsString;
  dm.ado116CURRENCY_PTR.Value:=form_curr.ADOQuery1rkey.Value;
  if dm.ado116CURRENCY_PTR.Value=1 then
   edit5.Enabled:=false
  else
   edit5.Enabled:=true;
 end;
form_curr.Free;
end;

procedure TForm3.N4Click(Sender: TObject);
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
        if dm.ado116CURRENCY_PTR.Value=form_curr.ADOQuery1rkey.Value then
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text
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

procedure TForm3.N5Click(Sender: TObject);
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

procedure TForm3.N11Click(Sender: TObject);
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
      if dm.ado116CURRENCY_PTR.Value=form_curr.ADOQuery1rkey.Value then
       sgrid1.Cells[3,sgrid1.Row]:=edit5.Text
      else
       sgrid1.Cells[3,sgrid1.Row]:=form_curr.ADOQuery1base_to_other.AsString;
      sgrid2.Cells[1,sgrid1.Row]:=form_curr.ADOQuery1rkey.AsString;

     if trim(sgrid1.Cells[6,sgrid1.Row])<>'' then
      sgrid1.Cells[6,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[4,sgrid1.row])/
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]))
     else
      sgrid1.Cells[5,sgrid1.Row]:=formatfloat('0.00',strtocurr(sgrid1.Cells[4,sgrid1.row])/
                                                   strtofloat(sgrid1.Cells[3,sgrid1.row]));
      self.re_calculate;
     end;
  end;
finally
 form_curr.Free;
end;
end;

procedure TForm3.N7Click(Sender: TObject);
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

procedure TForm3.N9Click(Sender: TObject);
begin
if (sgrid1.Row<>1) and (sgrid1.Row<>sgrid1.RowCount-1) then
 sgrid1.Cells[0,sgrid1.Row]:=sgrid1.Cells[0,sgrid1.Row-1]; 
end;

procedure TForm3.SpeedButton7Click(Sender: TObject);
begin
if dm.ADO116.State=dsinsert then
 begin
  edit11.Text:=self.get_vouchernumber(strtodate(edit12.Text));
  Edit14.Text:=inttostr(yearof(strtodate(edit12.Text)));
  Edit15.Text:=inttostr(monthof(strtodate(edit12.Text)));
end
else
 messagedlg('编辑状态下不能修改凭证编号!',mterror,[mbcancel],0);
end;

procedure TForm3.Edit12Exit(Sender: TObject);
begin
try
 strtodate(edit12.Text);
except
 messagedlg('日期格式输入有误!',mterror,[mbcancel],0);
 edit12.SetFocus;
 exit;
end;
if dm.ADO116.State=dsinsert then  //新增
 begin
  edit11.Text:=self.get_vouchernumber(strtodate(edit12.Text));
  Edit14.Text:=inttostr(yearof(strtodate(edit12.Text)));
  Edit15.Text:=inttostr(monthof(strtodate(edit12.Text)));
 end;
end;

procedure TForm3.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','-',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm3.PageControl1Change(Sender: TObject);
var
 i:word;
 mt_error:boolean;
begin
if (strtofloat(edit5.Text)=0)  or (not bitbtn2.Enabled) then exit;
if (dm.fincontrol1='N') then exit;

if (dm.ADO116.State=dsinsert) or (edit11.Text='') then
if (dm.ado116CUST_PTR.Value<>CUST_PTR) or (sgrid1.RowCount<=2) then
 begin
  cust_ptr:=dm.ado116CUST_PTR.Value;
  edit11.Text:=self.get_vouchernumber(dm.ado116MEMO_DATE.Value);
  edit12.Text:=dm.ado116MEMO_DATE.AsString;
  Edit14.Text:=inttostr(yearof(dm.ado116MEMO_DATE.Value));   //会计年度
  Edit15.Text:=inttostr(monthof(dm.ado116MEMO_DATE.Value));  //会计期间
  edit16.Text:=form1.empl_name.Caption;
  for i:=1 to sgrid1.RowCount-2 do
   begin
    sgrid1.Rows[i].Clear;
    sgrid2.Rows[i].Clear;
   end;
  sgrid1.RowCount:=2;
  sgrid2.RowCount:=2;
  dm.ADO104.Close;
  dm.ADO104.Open;           //打开会计分录定义
  mt_error:=true;
  if strtocurr(edit3.Text) > 0 then      //货款
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_01.AsString);
    open;
    case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1] := form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1] := '1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1] :=               //原币金额
         Formatfloat('0.00',strtocurr(edit3.Text)*strtofloat(edit5.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1] := '1';
      end;
      1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;           //货币

       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;           //汇率

       sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
                               formatfloat('0.00',strtocurr(edit3.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado116CURRENCY_PTR.AsString;
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=dm.ado116CURRENCY_PTR.Value then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;      //货币

         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;       //汇率

         sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
                               formatfloat('0.00',strtocurr(edit3.Text));
         sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado116CURRENCY_PTR.AsString;
        end
       else
        begin
         messagedlg('对不起客户信息中所定义的A/R帐目核算单一外币,且与发票货币不一致',mterror,[mbcancel],0);
         mt_error:=false;
        end;
       end;
      end;
      if mt_error then
      begin
      sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                         edit4.Text+ '['+
                         edit1.Text+
                         ABBR_NAME.Caption+']';
      sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
      sgrid1.Cells[5,sgrid1.RowCount-1]:=        //借方本币金额
              formatfloat('0.00',strtocurr(edit3.Text)*strtofloat(edit5.Text));
      sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_01.AsString;
      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;

  mt_error:=true;
  if strtocurr(edit6.Text) > 0 then      //工具费用
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
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
         Formatfloat('0.00',strtocurr(edit6.Text)*strtofloat(edit5.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;           //货币

       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;           //汇率

       sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
                               formatfloat('0.00',strtocurr(edit6.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado116CURRENCY_PTR.AsString;
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=dm.ado116CURRENCY_PTR.Value then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;      //货币

         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;       //汇率

         sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
                               formatfloat('0.00',strtocurr(edit6.Text));
         sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado116CURRENCY_PTR.AsString;
        end
       else
        begin
         messagedlg('对不起客户信息中所定义的A/R帐目核算单一外币,且与发票货币不一致',mterror,[mbcancel],0);
         mt_error:=false;
        end;
       end;
      end;
      if mt_error then
      begin
      sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                         edit4.Text+ '['+
                         edit1.Text+
                         ABBR_NAME.Caption+']';
      sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
      sgrid1.Cells[5,sgrid1.RowCount-1]:=        //借方本币金额
              formatfloat('0.00',strtocurr(edit6.Text)*strtofloat(edit5.Text));
      sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_02.AsString;
      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;

  mt_error:=true;
  if strtocurr(edit7.Text) > 0 then      //运输费
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_03.AsString);
    open;
    case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
         Formatfloat('0.00',strtocurr(edit7.Text)*strtofloat(edit5.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;           //货币

       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;           //汇率

       sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
                               formatfloat('0.00',strtocurr(edit7.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado116CURRENCY_PTR.AsString;
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=dm.ado116CURRENCY_PTR.Value then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;      //货币

         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;       //汇率

         sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
                               formatfloat('0.00',strtocurr(edit7.Text));
         sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado116CURRENCY_PTR.AsString;
        end
       else
        begin
         messagedlg('对不起客户信息中所定义的A/R帐目核算单一外币,且与发票货币不一致',mterror,[mbcancel],0);
         mt_error:=false;
        end;
       end;
      end;
      if mt_error then
      begin
      sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                         edit4.Text+ '['+
                         edit1.Text+
                         ABBR_NAME.Caption+']';
      sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
      sgrid1.Cells[5,sgrid1.RowCount-1]:=        //借方本币金额
              formatfloat('0.00',strtocurr(edit7.Text)*strtofloat(edit5.Text));
      sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_03.AsString;
      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;

  mt_error:=true;
  if strtocurr(edit8.Text) > 0 then      //税金
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_05.AsString);
    open;
    case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
         Formatfloat('0.00',strtocurr(edit8.Text)*strtofloat(edit5.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;           //货币

       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;           //汇率

       sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
                               formatfloat('0.00',strtocurr(edit8.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado116CURRENCY_PTR.AsString;
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=dm.ado116CURRENCY_PTR.Value then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;      //货币

         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;       //汇率

         sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
                               formatfloat('0.00',strtocurr(edit8.Text));
         sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado116CURRENCY_PTR.AsString;
        end
       else
        begin
         messagedlg('对不起客户信息中所定义的A/R帐目核算单一外币,且与发票货币不一致',mterror,[mbcancel],0);
         mt_error:=false;
        end;
       end;
      end;
      if mt_error then
      begin
      sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                         edit4.Text+ '['+
                         edit1.Text+
                         ABBR_NAME.Caption+']';
      sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
      sgrid1.Cells[5,sgrid1.RowCount-1]:=        //借方本币金额
              formatfloat('0.00',strtocurr(edit8.Text)*strtofloat(edit5.Text));
      sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_05.AsString;
      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;
  //====================以上为借方====以下为贷方================================

  mt_error:=true;
  if strtocurr(edit9.Text) > 0 then      //合计
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    if self.acc_gl_ptr>0 then
     sql.Add('where Data0103.rkey='+inttostr(acc_gl_ptr))
    else
     sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_06.AsString);
    open;
    case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
         Formatfloat('0.00',strtocurr(edit9.Text)*strtofloat(edit5.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
      1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;           //货币

       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;           //汇率

       sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
                               formatfloat('0.00',strtocurr(edit9.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado116CURRENCY_PTR.AsString;
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=dm.ado116CURRENCY_PTR.Value then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;      //货币

         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;       //汇率

         sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
                               formatfloat('0.00',strtocurr(edit9.Text));
         sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado116CURRENCY_PTR.AsString;
        end
       else
        begin
         messagedlg('对不起客户信息中所定义的A/R帐目核算单一外币,且与发票货币不一致',mterror,[mbcancel],0);
         mt_error:=false;
        end;
       end;
      end;
      if mt_error then
      begin
      sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                         edit4.Text+ '['+
                         edit1.Text+
                         ABBR_NAME.Caption+']';
      sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
      sgrid1.Cells[6,sgrid1.RowCount-1]:=        //货方本币金额
              formatfloat('0.00',strtocurr(edit9.Text)*strtofloat(edit5.Text));
      if self.acc_gl_ptr>0 then
      sgrid2.Cells[0,sgrid2.RowCount-1]:=inttostr(acc_gl_ptr)
      else
      sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_06.AsString;

      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;

  self.re_calculate;
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
 begin
  speedbutton2.Enabled:=true;
  speedbutton3.Enabled:=true;
  speedbutton4.Enabled:=true;
  speedbutton5.Enabled:=true;
  speedbutton6.Enabled:=true;
 end;
end;

procedure TForm3.BitBtn2Enter(Sender: TObject);
begin
if trim(edit4.Text)='' then
 begin
  messagedlg('贷项备忘不能为空!',mtinformation,[mbcancel],0);
  pagecontrol1.ActivePageIndex:=0;
  edit4.SetFocus;
  exit;
 end;

 dm.ADO04.Close;
 dm.ADO04.Open;
 if (dm.ADO04SEED_FLAG.Value<>1) and
    (dm.ado116.State=dsinsert) then
if not (edit4.Text[length(trim(edit4.Text))] in ['0'..'9']) then
  begin
   messagedlg('备忘编号最后一位必需是一个整数!',mtinformation,[mbok],0);
   self.PageControl1.ActivePageIndex:=0;
   edit4.SetFocus;
   exit;
  end;

if trim(edit1.Text)='' then
 begin
  messagedlg('客户不能为空!',mtinformation,[mbcancel],0);
  pagecontrol1.ActivePageIndex:=0;
  edit1.SetFocus;
  exit;
 end;

 if trim(edit10.Text)='' then
 begin
  messagedlg('工厂不能为空!',mtinformation,[mbcancel],0);
  pagecontrol1.ActivePageIndex:=0;
  edit10.SetFocus;
  exit;
 end;
if strtocurr(edit9.Text)<=0 then
 begin
  messagedlg('贷项金额不能为零!',mtinformation,[mbcancel],0);
  pagecontrol1.ActivePageIndex:=0;
  edit3.SetFocus;
  exit;
 end;

self.PageControl1Change(sender);
re_calculate;
if strtocurr(RemoveInvalid(statictext1.Caption))<>
   strtocurr(RemoveInvalid(statictext2.Caption)) then
 begin
  messagedlg('科目借贷双方金额不一致!',mterror,[mbcancel],0);
  self.PageControl1.ActivePageIndex:=1;
  sgrid1.SetFocus;
  exit;
 end;

{ if strtocurr(formatfloat('0.00',strtocurr(edit9.Text)*strtofloat(edit5.Text)
                             ))<>   //贷方合计
    strtocurr(RemoveInvalid(statictext2.Caption)) then
  begin
   messagedlg('业务发生额与凭证发生额不一致!',mterror,[mbcancel],0);
   self.PageControl1.ActivePageIndex:=1;
   sgrid1.SetFocus;
   exit;
  end;
}
  if edit11.Text<> '' then
  begin
  if not dm.Aqd508.Active then dm.Aqd508.Open;
  if (strtoint(Edit14.Text) < dm.Aqd508CURR_FYEAR.Value) or
     ((strtoint(Edit14.Text) <= dm.Aqd508CURR_FYEAR.Value) and
     (strtoint(Edit15.Text) < dm.Aqd508CURR_PERIOD.Value)) then
   begin
    messagedlg('凭证年度或者期间小于当前会计年度或者期间!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    edit12.SetFocus;
    exit;
   end;
  if (strtoint(Edit15.Text) <> monthof(strtodate(edit12.text))) then
   begin
    messagedlg('凭证期间不等于凭证日期限的会计期间请修改!',mterror,[mbcancel],0);
    self.PageControl1.ActivePageIndex:=1;
    edit12.SetFocus;
    exit;
   end;
  end;    
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
var
 i:integer;
begin
if dm.ado116.State=dsinsert then//新增
 begin
  if self.memo_number_error(trim(edit4.Text)) then
   begin
    dm.ADO04.Close;
    dm.ADO04.Open;
    if dm.ADO04SEED_FLAG.Value<>1 then
     begin
      if messagedlg('备忘编号重复可能多人同时新增,是否自动更新编号为:'+
       dm.ADO04SEED_VALUE.Value,mtconfirmation,[mbyes,mbno],0)=mryes then
       Edit4.Text:=dm.ADO04SEED_VALUE.Value
      else
       begin
        PageControl1.ActivePageIndex:=0;
        edit4.SetFocus;
        exit;
       end;
     end
    else
     begin
      messagedlg('备忘编号重复!请手工重新输入',mterror,[mbok],0);
      PageControl1.ActivePageIndex:=0;
      edit4.SetFocus;
      exit;
     end;
   end;

  if self.vo_number(trim(edit11.Text)) then
   begin
    edit11.Text:=self.get_vouchernumber(strtodate(edit12.Text));
    messagedlg('凭证编号重复可能多人同时新增,系统已自动更新编号!'+edit11.Text,mtinformation,[mbcancel],0);
   end;

 dm.ADOConnection1.BeginTrans;
 try
  dm.ado116MEMO_NUMBER.Value:=edit4.Text;
  dm.ado116SRCE_PTR.Value:=dm.ado116CUST_PTR.Value;
  dm.ado116AMOUNT.Value:=strtocurr(edit9.text);
  dm.ado116AVL_AMT.Value:=dm.ado116AMOUNT.Value;
  dm.ado116EX_RATE.Value:=strtofloat(edit5.Text);
  dm.ado116GOODS_AMT.Value:=strtocurr(edit3.Text);
  dm.ado116TOOLING_CHARGE.Value:=strtocurr(edit6.Text);
  dm.ado116SHIPPING.Value:=strtocurr(edit7.Text);
  dm.ado116FED_TAX.Value:=strtocurr(edit8.Text);
  dm.ado116GLPTR_STATUS.Value:=(dm.fincontrol1='Y');  
  dm.ado116.Post;
  dm.ADO04.Close;
  dm.ADO04.Open;
  if dm.ADO04SEED_FLAG.Value<>1 then
    update_04(trim(dm.ADO04SEED_VALUE.Value));

  if sgrid1.RowCount>2 then
   begin
    with dm.ado105 do                                        //增加会计凭证总表
    begin
     close;
     dm.ado105.Parameters[0].Value:=dm.ADO116RKEY.Value;
     open;
     append;
     dm.ado105VOUCHER.Value:=Edit11.Text;                          //凭证号
     dm.ado105BATCH_NUMBER.Value:=DM.ado116MEMO_NUMBER.Value;  //参考发票号
     dm.ado105TRANS_TYPE.Value:=7;                                //类型
     dm.ado105VOU_TYPE.Value:=0;
     dm.ado105SOURCE_PTR.Value:=dm.ADO116RKEY.Value;              //发票指针
     dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ado116EMPL_PTR.Value; //输入人员
     dm.ado105ENTERED_DT.Value:=strtodate(edit12.Text);           //输入日期
     dm.ado105ATTACHED.Value := strtoint(edit13.Text);            //附件张数
     dm.ado105FYEAR.Value := strtoint(edit14.Text);               //会计年度
     dm.ado105PERIOD.Value := strtoint(edit15.Text);              //会计期间
     dm.ado105CUSTOMER_PTR.Value:=dm.ado116CUST_PTR.value;        //客户
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
     dm.ado106REF_NUMBER.Value:=dm.ADO105BATCH_NUMBER.Value;
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
   end;     //完成凭证处理


   dm.ADOConnection1.CommitTrans;
  if (self.CheckBox1.Checked) and (not dm.ADO105.IsEmpty) then
   begin
   Form_voucherreport:=TForm_voucherreport.Create(application);
   form_voucherreport.ppReport1.Reset;
   form_voucherreport.ppReport1.Template.FileName :=
    stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'VOUCHER_REPORT.rtm';    //R:\NIERP\Report\VOUCHER_REPORT.rtm
   form_voucherreport.ppReport1.Template.LoadFromFile;
   Form_voucherreport.AQD105.Close;
   Form_voucherreport.AQD105.Parameters[0].Value:=dm.ADO105RKEY.Value;
   Form_voucherreport.AQD105.Open;
   Form_voucherreport.AQD106.Open;
   Form_voucherreport.AQD493.Open;
   Form_voucherreport.ppReport1.Print;
   Form_voucherreport.Free;
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
else                            //编辑
 begin
  if dm.return_VOUCHER(dm.ado116RKEY.Value) <> '' then
   begin
    messagedlg('贷项备忘已被销售开票生成总帐,不能编辑!',mtinformation,[mbcancel],0);
    exit;
   end;
   
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select AMOUNT,AVL_AMT from data0116');
    sql.Add('where rkey='+dm.ado116RKEY.AsString);
    open;
    if fieldbyname('AMOUNT').Value <> fieldbyname('AVL_AMT').Value  then
    begin
     messagedlg('贷项备忘已被使用,不能编辑!',mtinformation,[mbok],0);
     exit;
    end;
   end;

  dm.ADOConnection1.BeginTrans;
  try
  dm.ado116MEMO_NUMBER.Value:=edit4.Text;
  dm.ado116SRCE_PTR.Value:=dm.ado116CUST_PTR.Value;
  dm.ado116AMOUNT.Value:=strtocurr(edit9.text);
  dm.ado116AVL_AMT.Value:=dm.ado116AMOUNT.Value;
  dm.ado116EX_RATE.Value:=strtofloat(edit5.Text);
  dm.ado116GOODS_AMT.Value:=strtocurr(edit3.Text);
  dm.ado116TOOLING_CHARGE.Value:=strtocurr(edit6.Text);
  dm.ado116SHIPPING.Value:=strtocurr(edit7.Text);
  dm.ado116FED_TAX.Value:=strtocurr(edit8.Text);
  dm.ado116GLPTR_STATUS.Value:=(dm.fincontrol1='Y');
  dm.ado116.Post;

   with dm.ado105 do                                        //增加会计凭证总表
    begin
     close;
     dm.ado105.Parameters[0].Value:=dm.ADO116RKEY.Value;
     open;
    end;
    if not dm.ado105.isempty then dm.ado105.Delete;
    dm.ADO106.Close;
    dm.ADO106.Parameters[0].Value:=dm.ADO105RKEY.Value;
    dm.ADO106.Open;

  if sgrid1.RowCount>2 then
   begin
    with dm.ado105 do                                        //增加会计凭证总表
    begin
     append;
     dm.ado105VOUCHER.Value:=Edit11.Text;                          //凭证号
     dm.ado105BATCH_NUMBER.Value:=DM.ado116MEMO_NUMBER.Value;  //参考发票号
     dm.ado105TRANS_TYPE.Value:=7;                                //类型
     dm.ado105VOU_TYPE.Value:=0;
     dm.ado105SOURCE_PTR.Value:=dm.ADO116RKEY.Value;              //发票指针
     dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ado116EMPL_PTR.Value; //输入人员
     dm.ado105ENTERED_DT.Value:=strtodate(edit12.Text);      //输入日期
     dm.ado105ATTACHED.Value := updown1.Position;                 //附件张数
     dm.ado105FYEAR.Value := strtoint(edit14.Text);                //会计年度
     dm.ado105PERIOD.Value := strtoint(edit15.Text);               //会计期间
     dm.ado105CUSTOMER_PTR.Value:=dm.ado116CUST_PTR.value;       //客户
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
     dm.ado106REF_NUMBER.Value:=dm.ADO105BATCH_NUMBER.Value;
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
   end;     //完成凭证处理

   dm.ADOConnection1.CommitTrans;
  if (self.CheckBox1.Checked) and (not dm.ADO105.IsEmpty) then
   begin
     Form_voucherreport:=TForm_voucherreport.Create(application);
     form_voucherreport.ppReport1.Reset;
     form_voucherreport.ppReport1.Template.FileName :=
      stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'VOUCHER_REPORT.rtm';    //R:\NIERP\Report\VOUCHER_REPORT.rtm
     form_voucherreport.ppReport1.Template.LoadFromFile;
     Form_voucherreport.AQD105.Close;
     Form_voucherreport.AQD105.Parameters[0].Value:=dm.ADO105RKEY.Value;
     Form_voucherreport.AQD105.Open;
     Form_voucherreport.AQD106.Open;
     Form_voucherreport.AQD493.Open;
     Form_voucherreport.ppReport1.Print;
     Form_voucherreport.Free;
   end;   
   self.ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
     dm.ado116.Edit;
    end;
  end;

 end;
end;

procedure TForm3.FormActivate(Sender: TObject);
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

if dm.ADo116.State=dsinsert then     //新增
  begin

  end
else           //编辑
 begin
  dm.Aqd105.Close;
  dm.Aqd105.Parameters[0].Value:=dm.ADO116RKEY.Value;
  dm.Aqd105.Open;
  edit11.Text:=dm.Aqd105VOUCHER.Value;
  edit12.Text:=dm.Aqd105ENTERED_DT.AsString;
  edit14.Text:=dm.Aqd105FYEAR.AsString;
  edit15.Text:=dm.Aqd105PERIOD.AsString;
  updown1.Position:=dm.Aqd105ATTACHED.Value;
  edit16.Text:=dm.Aqd105EMPLOYEE_NAME.Value;
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

  end;

self.re_calculate();//重新计算借货金额
self.PageControl1.ActivePageIndex:=0;

end;

procedure TForm3.Sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (acol>3) then
 Sgrid1.Canvas.TextRect(rect,rect.right-Sgrid1.Canvas.TextWidth(Sgrid1.Cells[acol,arow])
                 -2,rect.Top+2, Sgrid1.Cells[acol,aRow]);
end;

procedure TForm3.Sgrid1Exit(Sender: TObject);
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

procedure TForm3.Sgrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TForm3.Sgrid1KeyPress(Sender: TObject; var Key: Char);
begin
if sgrid1.Col<>0 then
 if not (key in ['0'..'9','.','-',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',sgrid1.Cells[sgrid1.col,sgrid1.row])>0  then abort;
end;

procedure TForm3.Sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TForm3.Sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
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

if (sgrid1.col>3) and (sgrid1.row<>sgrid1.RowCount-1) then
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

procedure TForm3.N8Click(Sender: TObject);
begin
try
form_dictionary:=Tform_dictionary.Create(application);
if form_dictionary.ShowModal=mrok then
 sgrid1.Cells[0,sgrid1.Row]:=form_dictionary.aq513DSDesigner2.Value;
finally
form_dictionary.Free;
end;
end;

procedure TForm3.Edit13KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm3.PopupMenu3Popup(Sender: TObject);
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

procedure TForm3.BitBtn1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'warehouse_CODE/工厂代码/100,ABBR_NAME/工厂简称/100,warehouse_NAME/工厂名称/200';
    InputVar.Sqlstr := 'select rkey,warehouse_CODE,ABBR_NAME,warehouse_NAME from data0015';
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Label17.Caption := frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME'];
      Edit10.Text := frmPick_Item_Single.adsPick.FieldValues['warehouse_CODE'];
      dm.ado116warehouse_ptr.Value := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

end.
