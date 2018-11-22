unit PayExpense;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, Menus, Mask, ComCtrls,
  DBCtrls, DB, ADODB, ToolWin,DateUtils;

type
  TForm_mic = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    StringGrid1: TStringGrid;
    Panel2: TPanel;
    StringGrid2: TStringGrid;
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
    Label11: TLabel;
    Label1: TLabel;
    abbr_name: TLabel;
    Label10: TLabel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit6: TEdit;
    Edit5: TEdit;
    Edit4: TEdit;
    Edit3: TEdit;
    edit2: TEdit;
    edit1: TEdit;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    BitBtn6: TBitBtn;
    SText3: TStaticText;
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
    CheckBox2: TCheckBox;
    N6: TMenuItem;
    ComboBox1: TComboBox;
    Label6: TLabel;
    procedure DrawGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure N2Click(Sender: TObject);
    procedure StringGrid1Exit(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5Exit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure Sgrid1Exit(Sender: TObject);
    procedure re_calculate;
    procedure Sgrid1KeyPress(Sender: TObject; var Key: Char);
    procedure Sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    function get_gltp(rkey103: string): integer;
    function get_glcurr_ptr(rkey103: string): integer;
    function get_vouchernumber(inv_date: tdatetime): string;
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure BitBtn2Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    function invo_number_error(number: string): boolean;
    function get_bankcheck(bank_ptr:integer): string;
    procedure update_128(v_seed: string);
    function vo_number(number: string): boolean;
    procedure update_521();
    procedure Edit12KeyPress(Sender: TObject; var Key: Char);
    procedure Edit12Exit(Sender: TObject);
    procedure Sgrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N8Click(Sender: TObject);
    procedure Edit13KeyPress(Sender: TObject; var Key: Char);
    procedure N6Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    bank_ptr,curr_ptr,srce_ptr:integer;
    accbank_gl_ptr:integer;
    warehouse_number:array of integer;
    procedure recalculation();
   function get_col5(row:integer):currency;
   function get_col6(row:integer):currency;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_mic: TForm_mic;
  function RemoveInvalid(where: string): string;
  function Power(x, y : extended) : extended;

implementation

uses Damo, BankSearch, supplier_search,common,
  Main, customer_search, curr_search, AcctSearch, voucher_report,
  voucher_dictionary;

{$R *.dfm}

function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
end;
function TForm_mic.get_col5(row: integer): currency;
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

function TForm_mic.get_col6(row: integer): currency;
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

procedure TForm_mic.update_128(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin

 dm.ado128.Close;
 dm.ADO128.Parameters[0].Value:=dm.ADO114BANK_PTR.Value;
 dm.ado128.Open;
 dm.ADO128.Edit;
 dm.ADO128bal_amount.Value:=dm.ADO128bal_amount.Value+dm.ADO114AMOUNT.Value;

 v_length := length(v_seed);
 for i := v_length downto 1 do
  if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.ADO128bank_current_check.Value:=new_seed;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.ADO128bank_current_check.Value:=new_seed;
    end;
 dm.ADO128.Post;
end;

procedure TForm_mic.re_calculate;
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

function TForm_mic.get_gltp(rkey103: string): integer;
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

function TForm_mic.get_glcurr_ptr(rkey103: string): integer;
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

function TForm_mic.vo_number(number: string): boolean;
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

function TForm_mic.get_vouchernumber(inv_date: tdatetime): string;
var
 voucher:string;
 pr_req:integer;
begin
if dm.ado114bank_ptr.value>0 then
 begin
  voucher:='RA'+copy(inttostr(yearof(inv_date)),3,2);  //年度
  label25.Caption:='收款凭证';
 end
else
 begin
  voucher:='TA'+copy(inttostr(yearof(inv_date)),3,2);  //年度
  label25.Caption:='转帐凭证';
 end;

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

function TForm_mic.invo_number_error(number: string): boolean;
begin
result:=false;
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0114');
  sql.Add('where REFERENCE_NO='''+number+'''');
  open;
  if not IsEmpty then  result:=true;
 end;
end;

function TForm_mic.get_bankcheck(bank_ptr:integer): string;
begin
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select bank_current_check from data0128');
   sql.Add('where rkey='+inttostr(bank_ptr));
   open;
   if fieldvalues['bank_current_check']<>null then
    result:= fieldvalues['bank_current_check']
   else
    result:='';
  end;
end;

procedure TForm_mic.update_521;
var
 i:word;
begin
 with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select TTYPE,EXPENSE_TP,SUMMARIZE,SRCE_PTR,AMOUNT,inex_ptr');
  sql.Add('from data0521');
  sql.Add('where TTYPE=1');
  sql.Add('and SRCE_PTR ='+dm.ado114RKEY.AsString);
  open;
  while not eof do delete;
 end;
 for i:=1 to stringgrid2.RowCount-2 do
  if (strtocurr(stringgrid1.Cells[2,i])<>0) then
   dm.ADOQuery1.AppendRecord([1,stringgrid1.Cells[0,i],
                                stringgrid1.Cells[1,i],
                                dm.ADO114RKEY.value,
                                strtocurr(stringgrid1.Cells[2,i]),
                                strtoint(stringgrid2.Cells[0,i])
                                   ]);
end;

procedure TForm_mic.DrawGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  IF acol=1 then canselect:=false;
end;

procedure TForm_mic.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  If arow=0 then
  begin
    If acol<=1 then
    Stringgrid1.Canvas.TextRect(rect,rect.Left+(rect.right-Stringgrid1.Canvas.TextWidth(Stringgrid1.Cells[acol,arow])-rect.Left) div 2,
        rect.Top+2, Stringgrid1.Cells[aCol,aRow]	) else
    Stringgrid1.Canvas.TextRect(rect,rect.right-Stringgrid1.Canvas.TextWidth(Stringgrid1.Cells[aCol,aRow])-2,
        rect.Top+2, Stringgrid1.Cells[aCol,aRow]	);
    exit;
  end;
  If acol>1 then
  if trim(Stringgrid1.Cells[aCol,aRow])<>'' then
    Stringgrid1.Canvas.TextRect(rect,rect.right-Stringgrid1.Canvas.TextWidth(format('%.2f',[strtofloat(Stringgrid1.Cells[aCol,aRow])]))-2,
        rect.Top+2, format('%.2f',[strtofloat(Stringgrid1.Cells[aCol,aRow])])	);
end;

procedure TForm_mic.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
if stringgrid1.Row<>stringgrid1.RowCount-1 then
 begin
 if trim(stringgrid1.Cells[2,stringgrid1.Row])='' then
  stringgrid1.Cells[2,stringgrid1.Row]:='0.00';
  stringgrid1.Cells[2,stringgrid1.Row]:=formatfloat('0.00',
     strtofloat(stringgrid1.Cells[2,stringgrid1.Row]));
   recalculation();
 end;

if ARow=stringgrid1.RowCount-1 then
 stringgrid1.Options:=stringgrid1.Options-[goEditing]
else
 if bitbtn2.Enabled then
 stringgrid1.Options:=stringgrid1.Options+[goEditing];
end;

procedure TForm_mic.N2Click(Sender: TObject);
var i:integer;
begin
if messagedlg('确认要删除吗？',mtconfirmation,[mbyes,mbNo],0)=mrYes then
 begin
  for i:=stringgrid1.Row to stringgrid1.Rowcount-2 do
   begin
    stringgrid1.rows[i].Text :=stringgrid1.rows[i+1].Text ;
    stringgrid2.rows[i].Text :=stringgrid2.rows[i+1].Text ;
   end;
  stringgrid1.Rowcount:=stringgrid1.Rowcount-1;
  stringgrid2.Rowcount:=stringgrid2.Rowcount-1;
  recalculation();
 end;
end;

procedure TForm_mic.StringGrid1Exit(Sender: TObject);
begin
  if (stringgrid1.col=2) and (stringgrid1.Row<>stringgrid1.RowCount-1) then
   begin
    stringgrid1.Cells[2,stringgrid1.Row]:=formatfloat('0.00',
     strtofloat(stringgrid1.Cells[2,stringgrid1.Row]));
    recalculation();
   end;
end;

procedure TForm_mic.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if stringgrid1.Col=2 then
  if not (key in ['0'..'9','.','-',#8,#13]) then
    abort
  else
  begin
   if (key = chr(46)) then
    if pos('.',stringgrid1.Cells[stringgrid1.col,stringgrid1.row])>0
     then
      abort;
  end;
end;

procedure TForm_mic.recalculation();
 var
  i:integer;
  vamt:real;
begin
  vamt:=0;
  for i:=1 to stringgrid1.rowcount-2 do
   vamt:=vamt+strtocurr(stringgrid1.Cells[2,i]);
  edit6.Text :=formatfloat('0.00',vamt);
end;

procedure TForm_mic.N1Click(Sender: TObject);
begin
form_inex:=tform_inex.Create(application);
if form_inex.ShowModal=mrok then
 begin
  stringgrid1.Cells[0,stringgrid1.RowCount-1]:=form_inex.ADOData0023NAME.Value;
  stringgrid1.Cells[1,stringgrid1.RowCount-1]:=form_inex.ADOData0023DESCRIPTION.Value;
  stringgrid1.Cells[2,stringgrid1.RowCount-1]:='0.00';

  stringgrid2.Cells[0,stringgrid1.RowCount-1]:=form_inex.ADOData0023RKEY.AsString;
  stringgrid2.Cells[1,stringgrid1.RowCount-1]:=form_inex.ADOData0023GL_ACCT_PTR.AsString;
  stringgrid1.RowCount:=stringgrid1.RowCount+1;
  stringgrid2.RowCount:=stringgrid2.RowCount+1;
  stringgrid1.Col:=2;
 end;
form_inex.Free;
end;

procedure TForm_mic.N3Click(Sender: TObject);
begin
form_inex:=tform_inex.Create(application);
if form_inex.ShowModal=mrok then
 begin
  stringgrid1.Cells[0,stringgrid1.Row]:=form_inex.ADOData0023NAME.Value;
  stringgrid1.Cells[1,stringgrid1.Row]:=form_inex.ADOData0023DESCRIPTION.Value;

  stringgrid2.Cells[0,stringgrid1.Row]:=form_inex.ADOData0023RKEY.AsString;
  stringgrid2.Cells[1,stringgrid1.Row]:=form_inex.ADOData0023GL_ACCT_PTR.AsString;
  stringgrid1.Col:=2;
 end;
form_inex.Free;
end;

procedure TForm_mic.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
  stringgrid1.MouseToCell(x,y,column,row);
  if row<>0 then
   begin
    stringgrid1.Row:=row;
    stringgrid1.col:=column;
   end;
 end;
end;

procedure TForm_mic.StringGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if stringgrid1.Row<>stringgrid1.RowCount-1 then
if trim(stringgrid1.Cells[2,stringgrid1.Row])='' then
 stringgrid1.Cells[2,stringgrid1.Row]:='0.00';
end;

procedure TForm_mic.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as tedit).Text)>0  then abort;
end;

procedure TForm_mic.Edit5Exit(Sender: TObject);
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
  edit5.Text:=formatfloat('0.00000000',strtofloat(edit5.Text));
end;

procedure TForm_mic.BitBtn6Click(Sender: TObject);
begin
form_bank:=tform_bank.Create(application);

if form_bank.ShowModal=mrok then
 if dm.ado114BANK_PTR.Value<>form_bank.Adodata0128rkey.Value then
 begin
  edit4.Text:=trim(form_bank.Adodata0128bank_current_check.Value);
  dm.ado114BANK_PTR.Value:=form_bank.Adodata0128rkey.Value;
  self.bank_ptr:=form_bank.Adodata0128rkey.Value;
  edit3.Text:=form_bank.Adodata0128bank_name.Value;
  stext3.Caption:=form_bank.Adodata0128bal_amount.AsString;
  dm.ado114CURRECY_PTR.Value:=form_bank.Adodata0128currency_ptr.Value;
  self.curr_ptr:=form_bank.Adodata0128currency_ptr.Value;
  edit2.Text:=form_bank.Adodata0128curr_code.Value;
  label15.Caption:=form_bank.Adodata0128curr_name.Value;
  edit5.Text:=form_bank.Adodata0128base_to_other.AsString;
  accbank_gl_ptr:=form_bank.Adodata0128gl_acct_ptr.Value;
  if dm.ado114CURRECY_PTR.Value=1 then
   edit5.Enabled:=false
  else
   edit5.Enabled:=true;
 end;
form_bank.Free;
end;

procedure TForm_mic.BitBtn4Click(Sender: TObject);
begin
form_employee:=tform_employee.Create(application);
if form_employee.ShowModal=mrok then
 begin
  edit1.Text:=form_employee.ADOQuery1EMPL_CODE.Value;
  label14.Caption:=form_employee.ADOQuery1EMPLOYEE_NAME.Value;
  abbr_name.Caption:=form_employee.ADOQuery1abbr_name.Value;
  dm.ado114SRCE_PTR.Value:=form_employee.ADOQuery1RKEY.Value;
  self.srce_ptr:=form_employee.ADOQuery1RKEY.Value;
 end;
form_employee.Free;
end;

procedure TForm_mic.Sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (acol>3) then
 Sgrid1.Canvas.TextRect(rect,rect.right-Sgrid1.Canvas.TextWidth(Sgrid1.Cells[acol,arow])
                 -2,rect.Top+2, Sgrid1.Cells[acol,aRow]);
end;

procedure TForm_mic.Sgrid1Exit(Sender: TObject);
begin
//if sgrid1.col>3 then
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

procedure TForm_mic.Sgrid1KeyPress(Sender: TObject; var Key: Char);
begin
if sgrid1.Col<>0 then
 if not (key in ['0'..'9','.','-',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',sgrid1.Cells[sgrid1.col,sgrid1.row])>0  then abort;
end;

procedure TForm_mic.Sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TForm_mic.Sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TForm_mic.N4Click(Sender: TObject);
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

        if dm.ado114CURRECY_PTR.Value=form_curr.ADOQuery1rkey.Value then
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text
        else
         sgrid1.Cells[3,sgrid1.RowCount-1]:=
                  form_curr.ADOQuery1base_to_other.AsString;

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

procedure TForm_mic.N5Click(Sender: TObject);
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

procedure TForm_mic.N11Click(Sender: TObject);
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

      if dm.ado114CURRECY_PTR.Value=form_curr.ADOQuery1rkey.Value then
       sgrid1.Cells[3,sgrid1.Row]:=edit5.Text
      else
       sgrid1.Cells[3,sgrid1.Row]:=
               form_curr.ADOQuery1base_to_other.AsString;

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

procedure TForm_mic.N7Click(Sender: TObject);
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

procedure TForm_mic.N9Click(Sender: TObject);
begin
if (sgrid1.Row<>1) and (sgrid1.Row<>sgrid1.RowCount-1) then
 sgrid1.Cells[0,sgrid1.Row]:=sgrid1.Cells[0,sgrid1.Row-1]; 
end;

procedure TForm_mic.SpeedButton7Click(Sender: TObject);
begin
if dm.ADO114.State=dsinsert then
 begin
  edit11.Text:=self.get_vouchernumber(strtodate(edit12.Text));
  Edit14.Text:=inttostr(yearof(strtodate(edit12.Text)));
  Edit15.Text:=inttostr(monthof(strtodate(edit12.Text)));
end
else
 messagedlg('编辑状态下不能修改凭证编号!',mterror,[mbcancel],0);
end;

procedure TForm_mic.PageControl1Change(Sender: TObject);
var
 i:word;
 mt_error:boolean;
 debit_amout:currency;
begin
if (strtocurr(edit5.Text)=0) or (not bitbtn2.Enabled) then exit;

if (dm.ado114SRCE_PTR.Value>0)  then
 debit_amout:=
    strtocurr(formatfloat('0.00',strtocurr(edit6.Text)*strtofloat(edit5.Text)))
else
 debit_amout:=0;

if (dm.ADO114.State=dsinsert) or (edit11.Text='') then

{if (dm.ado114SRCE_PTR.Value>0) and
 (debit_amout<>strtocurr(RemoveInvalid(statictext1.Caption))) then
}

if (dm.ado114SRCE_PTR.Value>0) and
   (sgrid1.RowCount<=2) then
 begin
  edit11.Text:=self.get_vouchernumber(dm.ADO114TDATE.Value);
  edit12.Text:=dm.ADO114TDATE.AsString;
  Edit14.Text:=inttostr(yearof(dm.ado114TDATE.Value));   //会计年度
  Edit15.Text:=inttostr(monthof(dm.ado114TDATE.Value));  //会计期间
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
  if strtocurr(edit6.Text) <> 0 then      //借票据金额
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    if accbank_gl_ptr>0 then
     sql.Add('where Data0103.rkey='+inttostr(accbank_gl_ptr))
    else
     sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_01.AsString);
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
       sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado114CURRECY_PTR.AsString;
      end;
      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=dm.ado114CURRECY_PTR.Value then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;      //货币

         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;       //汇率

         sgrid1.Cells[4,sgrid1.RowCount-1]:=      //原币金额
                               formatfloat('0.00',strtocurr(edit6.Text));
         sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado114CURRECY_PTR.AsString;
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
//      sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
//                         edit4.Text+ '['+
//                         edit1.Text+
//                         ABBR_NAME.Caption+']';

      sgrid1.Cells[0,sgrid1.RowCount-1]:=
                            dbedit2.Text+' '+ abbr_name.Caption;             //摘要


      sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
      sgrid1.Cells[5,sgrid1.RowCount-1]:=        //借方本币金额
              formatfloat('0.00',strtocurr(edit6.Text)*strtofloat(edit5.Text));
      if accbank_gl_ptr>0 then
       sgrid2.Cells[0,sgrid2.RowCount-1]:=inttostr(accbank_gl_ptr)
      else
       sgrid2.Cells[0,sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_01.AsString;
      sgrid1.RowCount:=sgrid1.RowCount+1;
      sgrid2.RowCount:=sgrid2.RowCount+1;
      end;
   end;
  //====================以上为借方====以下为贷方================================

  mt_error:=true;
  for i:=1 to stringgrid2.RowCount-2 do
  if strtocurr(stringgrid1.Cells[2,i])<>0 then
   with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    sql.Add('where Data0103.rkey='+stringgrid2.Cells[1,i]);
    open;

    case fieldbyname('curr_tp').AsInteger of
     0:                 //不核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:= form1.curr_code.Caption;         //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:='1' ;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //本币金额
         Formatfloat('0.00',strtocurr(stringgrid1.Cells[2,i])*strtofloat(edit5.Text));
       sgrid2.Cells[1,sgrid2.RowCount-1]:='1';
      end;
     1:               //核算外币
      begin
       sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;          //货币
       sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;          //汇率
       sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                           formatfloat('0.00',strtocurr(stringgrid1.Cells[2,i]));
       sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado114CURRECY_PTR.AsString;
      end;
      2:             //核算单一外币
       begin
        if fieldbyname('curr_ptr').AsInteger=dm.ado114CURRECY_PTR.Value then
        begin
         sgrid1.Cells[2,sgrid1.RowCount-1]:=edit2.Text;      //货币
         sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text;    //汇率
         sgrid1.Cells[4,sgrid1.RowCount-1]:=               //原币金额
                           formatfloat('0.00',strtocurr(stringgrid1.Cells[2,i]));
         sgrid2.Cells[1,sgrid2.RowCount-1]:= dm.ado114CURRECY_PTR.AsString;
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
//       sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
//                         edit4.Text+ '['+
//                         edit1.Text+
//                         ABBR_NAME.Caption+']';

        sgrid1.Cells[0,sgrid1.RowCount-1]:=
                            dbedit2.Text+' '+ abbr_name.Caption;

       sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
       sgrid1.Cells[6,sgrid1.RowCount-1]:=        //货方本币金额
                  formatfloat('0.00',strtocurr(stringgrid1.Cells[2,i])*
                                               strtofloat(edit5.Text));
       sgrid2.Cells[0,sgrid2.RowCount-1]:=stringgrid2.Cells[1,i];
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


procedure TForm_mic.FormActivate(Sender: TObject);
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
  stringgrid1.cells[0,0]:='费用类别';
  stringgrid1.cells[1,0]:='摘    要';
  stringgrid1.cells[2,0]:='金额';

with dm.ADOQuery1 do
 begin
   close;
   SQL.Text:='select rkey,abbr_name from data0015 order by rkey';
   open;
   setlength(warehouse_number,RecordCount);//设置数组下标个数
   for i:=0 to RecordCount-1 do
   begin
     ComboBox1.Items.Add(fieldbyname('abbr_name').AsString);
     warehouse_number[i]:=fieldbyname('rkey').AsInteger;
     Next;
   end;
 end;

if dm.ADo114.State=dsinsert then     //新增
  begin

  end
else           //编辑
 begin
  ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(dm.aqd114abbrname15.Value);
  dm.Aqd105.Close;
  dm.Aqd105.Parameters[0].Value:=dm.ADO114RKEY.Value;
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
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0521.EXPENSE_TP, Data0521.SUMMARIZE, Data0521.AMOUNT,');
    sql.Add('dbo.Data0521.inex_ptr, dbo.Data0520.GL_ACCT_PTR');
    sql.Add('FROM dbo.Data0521 INNER JOIN');
    sql.Add('dbo.Data0520 ON dbo.Data0521.inex_ptr = dbo.Data0520.RKEY');
    sql.Add('where data0521.ttype=1 and');
    sql.Add('data0521.srce_ptr='+dm.ado114RKEY.AsString);
    open;
    stringgrid1.RowCount:=RecordCount+2;
    stringgrid2.RowCount:=stringgrid1.RowCount;
    for i:=1 to RecordCount do
     begin
      stringgrid1.Cells[0,i]:=fieldbyname('EXPENSE_TP').AsString;
      stringgrid1.Cells[1,i]:=fieldbyname('SUMMARIZE').AsString;
      stringgrid1.Cells[2,i]:=fieldbyname('AMOUNT').AsString;
      stringgrid2.Cells[0,i]:=fieldbyname('inex_ptr').AsString;
      stringgrid2.Cells[1,i]:=fieldbyname('GL_ACCT_PTR').AsString;
      next;
     end;
     close;
   end;
  if dm.ado114CURRECY_PTR.Value=1 then
   edit5.Enabled:=false
  else
   edit5.Enabled:=true; 


  end;

self.re_calculate();//重新计算借货金额
self.PageControl1.ActivePageIndex:=0;
end;

procedure TForm_mic.PopupMenu1Popup(Sender: TObject);
begin
if stringgrid1.Row=stringgrid1.RowCount-1 then
 begin
  n3.Enabled:=false;
  n2.Enabled:=false;
 end
else
 begin
  n2.Enabled:=false; 
  n3.Enabled:=true;
 end;
end;

procedure TForm_mic.PopupMenu3Popup(Sender: TObject);
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

procedure TForm_mic.BitBtn2Enter(Sender: TObject);
begin
if trim(edit4.Text)='' then
 begin
  messagedlg('支票号码不能为空!',mtinformation,[mbcancel],0);
  pagecontrol1.ActivePageIndex:=0;
  edit4.SetFocus;
  exit;
 end;

if trim(edit3.Text)='' then
 begin
  messagedlg('现金银行帐户不能为空!',mtinformation,[mbcancel],0);
  pagecontrol1.ActivePageIndex:=0;
  edit3.SetFocus;
  exit;
 end;

if trim(edit1.Text)='' then
 begin
  messagedlg('收款人不能为空!',mtinformation,[mbcancel],0);
  pagecontrol1.ActivePageIndex:=0;
  edit1.SetFocus;
  exit;
 end;

if ComboBox1.ItemIndex < 0 then
 begin
  messagedlg('工厂不能为空!',mtinformation,[mbcancel],0);
  pagecontrol1.ActivePageIndex:=0;
  ComboBox1.SetFocus;
  exit;
 end;


if (dm.ado114.State=dsinsert) then
if not (edit4.Text[length(trim(edit4.Text))] in ['0'..'9']) then
  begin
   messagedlg('票据编号最后一位必需是一个整数!',mtinformation,[mbok],0);
   self.PageControl1.ActivePageIndex:=0;
   edit4.SetFocus;
   exit;
  end;

if stringgrid1.RowCount=2 then
 begin
  showmessage('收入类别明细不能为空!');
  self.PageControl1.ActivePageIndex:=0;
  stringgrid1.SetFocus;
  exit;
 end;

self.PageControl1Change(sender);

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

  if Abs(strtocurr(formatfloat('0.00',strtocurr(edit6.Text)*strtofloat(edit5.Text)))-
    strtocurr(RemoveInvalid(statictext1.Caption)))>0.05 then    //借方合计
  begin
   messagedlg('业务发生额与凭证发生额不一致!',mterror,[mbcancel],0);
   self.PageControl1.ActivePageIndex:=1;
   sgrid1.SetFocus;
   exit;
  end;

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

procedure TForm_mic.BitBtn2Click(Sender: TObject);
var
 i:word;
begin
if dm.ado114.State=dsInsert then //新增
begin
 if self.invo_number_error(trim(edit4.Text)) then
  begin
   if dm.ado114BANK_PTR.Value > 0 then
   begin
    Edit4.Text:=self.get_bankcheck(dm.ado114BANK_PTR.Value);
    messagedlg('票据编号重复可能多人同时新增,系统已自动更新编号!',mterror,[mbcancel],0);
   end
   else
   begin
    messagedlg('票据编号重复!请手工重新输入',mterror,[mbok],0);
    self.PageControl1.ActivePageIndex:=0;
    edit4.SetFocus;
    exit;
   end;
  end;

  if self.vo_number(trim(edit11.Text)) then
   begin
    edit11.Text:=self.get_vouchernumber(strtodate(edit12.text));
    messagedlg('凭证编号重复可能多人同时新增,系统已自动更新编号!',mterror,[mbcancel],0);
   end;

  dm.ADOConnection1.BeginTrans; //开始事物
  try
   dm.ado114REFERENCE_NO.Value:=edit4.Text;
   dm.ado114AMOUNT.AsString:=edit6.Text;
   dm.ado114EXCHANGE_RATE.AsString:=edit5.Text;
   dm.ado114pay_to.Value:=label14.Caption;
   dm.ado114.Post;

   if dm.ado114BANK_PTR.Value>0 then
    self.update_128(trim(edit4.Text)); //更新票据编号及金额
   self.update_521;

  if sgrid1.RowCount>2 then
   begin
    with dm.ado105 do                                        //增加会计凭证总表
    begin
     close;
     dm.ado105.Parameters[0].Value:=dm.ADO114RKEY.Value;
     open;
     append;
     dm.ado105VOUCHER.Value:=Edit11.Text;                          //凭证号
     dm.ado105BATCH_NUMBER.Value:=DM.ado114REFERENCE_NO.Value;  //参考发票号
     dm.ado105TRANS_TYPE.Value:=6;                                //类型
     if dm.ado114BANK_PTR.Value>0 then
      dm.ado105VOU_TYPE.Value:=2
     else
      dm.ado105VOU_TYPE.Value:=0;
     dm.ado105SOURCE_PTR.Value:=dm.ADO114RKEY.Value;              //发票指针
     dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ado114EMPL_PTR.Value; //输入人员
     dm.ado105ENTERED_DT.Value:=strtodate(edit12.Text);           //输入日期
     dm.ado105ATTACHED.Value := strtoint(edit13.Text);            //附件张数
     dm.ado105FYEAR.Value := strtoint(edit14.Text);               //会计年度
     dm.ado105PERIOD.Value := strtoint(edit15.Text);              //会计期间
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
     dm.ado106REF_NUMBER.Value := dm.ADO105BATCH_NUMBER.Value;
     dm.ado106DESCRIPTION.Value := sgrid1.Cells[0,i];
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

  if not checkbox2.Checked then
   ModalResult:=mrok
  else
   begin
   dm.AqD114.Close;
   dm.AqD114.Open;
   dm.AqD114.Locate('rkey',dm.ADO114RKEY.Value,[]);
   dm.ADO114.Close;
   dm.ADO105.Close;
   dm.ADO106.Close;
   dm.ado114.Close;
   dm.ado114.Parameters[0].Value:=null;
   dm.ado114.Open;
   dm.ado114.Append;
   dm.ado114TTYPE.Value:=3;  //预收现金收据
   dm.ado114STATUS.Value:=1;//状态
   dm.ado114CSI_USER_PTR.AsString:=rkey73;
   dm.ado114EMPL_PTR.AsString :=form1.user_ptr.Caption;
   dm.ado114TDATE.Value:=form1.sys_sortdate;
   dm.ado114ENTER_DATE.Value:=form1.sys_sortdate;
   dm.ado114AMOUNT.Value:=0;
   for i:=1 to stringgrid1.RowCount-2 do
    begin
     stringgrid1.Rows[i].Clear;
     stringgrid2.Rows[i].Clear;
    end;
   stringgrid1.RowCount:=2;
   stringgrid2.RowCount:=2;
   for i:=1 to sgrid1.RowCount-2 do
    begin
     sgrid1.Rows[i].Clear;
     sgrid2.Rows[i].Clear;
    end;
   sgrid1.RowCount:=2;
   sgrid2.RowCount:=2;

   dm.ado114BANK_PTR.Value:=self.bank_ptr;
   dm.ado114CURRECY_PTR.Value:=self.curr_ptr;
   dm.ado114SRCE_PTR.Value:=self.srce_ptr;
   dm.ado114warehouse_ptr.Value:=warehouse_number[ComboBox1.ItemIndex];
   dm.ADO128.Close;
   dm.ADO128.Parameters[0].Value:=dm.ado114BANK_PTR.Value;
   dm.ADO128.Open;
   edit4.Text:=trim(dm.ADO128bank_current_check.Value);
   stext3.Caption:=dm.ADO128bal_amount.AsString;
   edit11.Text:='';
   edit12.Text:='';
   edit14.Text:='';
   edit15.Text:='';
   self.StaticText1.Caption:='0.00';
   self.StaticText2.Caption:='0.00';
   edit6.Text:='0.00';
   pagecontrol1.ActivePageIndex:=0;
   edit4.SetFocus;
   end;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
end
else         //编辑
 begin
  dm.ADOConnection1.BeginTrans;
  try
   if dm.ado114BANK_PTR.Value>0 then
    begin
     dm.ado128.Close;
     dm.ADO128.Parameters[0].Value:=dm.ADO114BANK_PTR.Value;
     dm.ado128.Open;
     dm.ADO128.Edit;
     dm.ADO128bal_amount.Value:=dm.ADO128bal_amount.Value-
                                dm.ADO114AMOUNT.Value+
                                strtocurr(edit6.Text);
     dm.ADO128.Post;
    end;

   dm.ado114REFERENCE_NO.Value:=edit4.Text;
   dm.ado114AMOUNT.AsString:=edit6.Text;
   dm.ado114EXCHANGE_RATE.AsString:=edit5.Text;
   dm.ado114pay_to.Value:=label14.Caption;
   dm.ado114.Post;

   self.update_521;

   with dm.ado105 do                                        //增加会计凭证总表
    begin
     close;
     dm.ado105.Parameters[0].Value:=dm.ADO114RKEY.Value;
     open;
    end;
   if not dm.ado105.isempty then dm.ado105.Delete;
    dm.ADO106.Close;
    dm.ADO106.Parameters[0].Value:=dm.ADO105RKEY.Value;
    dm.ADO106.Open;

  if sgrid1.RowCount>2 then
   begin
    dm.ado105.append;
    dm.ado105VOUCHER.Value:=Edit11.Text;                          //凭证号
    dm.ado105BATCH_NUMBER.Value:=DM.ado114REFERENCE_NO.Value;   //参考发票号
    dm.ado105TRANS_TYPE.Value:=6;                                //类型
    if dm.ado114BANK_PTR.Value>0 then
     dm.ado105VOU_TYPE.Value:=2
    else
     dm.ado105VOU_TYPE.Value:=0;
    dm.ado105SOURCE_PTR.Value:=dm.ADO114RKEY.Value;              //发票指针
    dm.ado105ENTERED_BY_EMPL_PTR.Value:=dm.ado114EMPL_PTR.Value; //输入人员
    dm.ado105ENTERED_DT.Value:=strtodate(edit12.Text);      //输入日期
    dm.ado105ATTACHED.Value := updown1.Position;                 //附件张数
    dm.ado105FYEAR.Value := strtoint(edit14.Text);                //会计年度
    dm.ado105PERIOD.Value := strtoint(edit15.Text);               //会计期间
    dm.ado105.post;
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
   end;

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
     dm.ado114.Edit;
    end;
  end;
 end;
end;


procedure TForm_mic.Edit12KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','-',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm_mic.Edit12Exit(Sender: TObject);
begin
try
 strtodate(edit12.Text);
except
 messagedlg('日期格式输入有误!',mterror,[mbcancel],0);
 edit12.SetFocus;
 exit;
end;
if dm.ADO114.State=dsinsert then  //新增
 begin
  edit11.Text:=self.get_vouchernumber(strtodate(edit12.Text));
  Edit14.Text:=inttostr(yearof(strtodate(edit12.Text)));
  Edit15.Text:=inttostr(monthof(strtodate(edit12.Text)));
 end;
end;

procedure TForm_mic.Sgrid1KeyDown(Sender: TObject; var Key: Word;
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

procedure TForm_mic.N8Click(Sender: TObject);
begin
try
form_dictionary:=Tform_dictionary.Create(application);
if form_dictionary.ShowModal=mrok then
 sgrid1.Cells[0,sgrid1.Row]:=form_dictionary.aq513DSDesigner2.Value;
finally
form_dictionary.Free;
end;
end;

procedure TForm_mic.Edit13KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm_mic.N6Click(Sender: TObject);
var
  i:integer;
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

          for i:=sgrid1.RowCount-1 downto sgrid1.Row+1 do
          begin
           sgrid1.Rows[i]:=sgrid1.Rows[i-1];
           sgrid2.Rows[i]:=sgrid2.Rows[i-1];
          end;

          if (sgrid1.Rowcount>3) and (sgrid1.Row>1) then       //摘要
           sgrid1.Cells[0,sgrid1.Row]:=trim(sgrid1.Cells[0,sgrid1.Row-1])
          else
           sgrid1.Cells[0,sgrid1.Row]:='';

          sgrid1.Cells[1,sgrid1.Row]:=              //科目
                           trim(form_acct.ADOQuery1GL_ACC_NUMBER.Value)+'-'+
                           trim(form_acct.ADOQuery1GL_DESCRIPTION.Value)+'-'+
                           trim(form_acct.ADOQuery1DESCRIPTION_2.Value);
          sgrid1.Cells[2,sgrid1.Row]:=form_curr.ADOQuery1curr_code.Value;

          if curr_ptr=form_curr.ADOQuery1rkey.Value then
           sgrid1.Cells[3,sgrid1.Row]:=edit5.Text
          else
           sgrid1.Cells[3,sgrid1.Row]:=
                            form_curr.ADOQuery1BASE_TO_OTHER.AsString;

           sgrid1.Cells[4,sgrid1.Row]:='';
           sgrid1.Cells[5,sgrid1.Row]:='';
           sgrid1.Cells[6,sgrid1.Row]:='';

          sgrid2.Cells[0,sgrid1.Row]:=form_acct.ADOQuery1rkey.AsString;
          sgrid2.Cells[1,sgrid1.Row]:=form_curr.ADOQuery1rkey.AsString;
          sgrid1.RowCount:=sgrid1.RowCount+1;
          sgrid2.RowCount:=sgrid2.RowCount+1;

          {sgrid1.Cells[0,sgrid1.RowCount-1]:=              //摘要
                    sgrid1.Cells[0,sgrid1.RowCount-2];
          sgrid1.Cells[1,sgrid1.RowCount-1]:=              //科目
                           trim(form_acct.ADOQuery1GL_ACC_NUMBER.Value)+'-'+
                           trim(form_acct.ADOQuery1GL_DESCRIPTION.Value)+'-'+
                           trim(form_acct.ADOQuery1DESCRIPTION_2.Value);
          sgrid1.Cells[2,sgrid1.RowCount-1]:=
                    form_curr.ADOQuery1curr_code.Value;

          if dm.ado114CURRECY_PTR.Value=form_curr.ADOQuery1rkey.Value then
           sgrid1.Cells[3,sgrid1.RowCount-1]:=edit5.Text
          else
           sgrid1.Cells[3,sgrid1.RowCount-1]:=
                    form_curr.ADOQuery1base_to_other.AsString;

          sgrid2.Cells[0,sgrid2.RowCount-1]:=form_acct.ADOQuery1rkey.AsString;
          sgrid2.Cells[1,sgrid2.RowCount-1]:=form_curr.ADOQuery1rkey.AsString;
          sgrid1.RowCount:=sgrid1.RowCount+1;
          sgrid2.RowCount:=sgrid2.RowCount+1;}

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

procedure TForm_mic.ComboBox1Change(Sender: TObject);
begin
 dm.ado114warehouse_ptr.Value:=
  self.warehouse_number[ComboBox1.ItemIndex];
end;

end.
