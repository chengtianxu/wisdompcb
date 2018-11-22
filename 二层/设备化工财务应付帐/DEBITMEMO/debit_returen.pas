unit debit_returen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, Menus;

type
  TForm4 = class(TForm)
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    label11: TLabel;
    Label21: TLabel;
    Label14: TLabel;
    Edit4: TEdit;
    edit5: TEdit;
    Edit6: TEdit;
    Edit15: TEdit;
    Edit8: TEdit;
    Label1: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    dtpk1: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit7: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    stgd1: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    a_or_e: TLabel;
    Edit9: TEdit;
    PopupMenu2: TPopupMenu;
    Label9: TLabel;
    dtpk2: TDateTimePicker;
    procedure FormActivate(Sender: TObject);
    procedure stgd1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    function find_grn(rkey95:integer):boolean;
    function find_error(number:string):boolean;
    procedure update_04(v_seed: string);
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   supp_ptr,curr_ptr:integer; 
  end;

var
  Form4: TForm4;
  function Power(x, y : extended) : extended;

implementation

uses datamd, invt_sendback, main;

{$R *.dfm}
function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
end;

procedure TForm4.update_04(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin
 dm.adosp04.Close;
 dm.adosp04.Open;
 if dm.adosp04SEED_FLAG.Value<>1 then
 begin
 v_length := length(v_seed);
 for i := v_length downto 1 do
  if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.adosp04.Edit; //使前缀不变后缀加1
    dm.adosp04SEED_VALUE.Value := new_seed;
    dm.adosp04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.adosp04.Edit;
     dm.adosp04SEED_VALUE.Value := new_seed;
     dm.adosp04.Post;
    end;
 end;
end;

function tform4.find_error(number:string):boolean;
begin
 result := false;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0132');
   sql.Add('where MEMO_NUMBER='''+number+'''');
   open;
   if not IsEmpty then result := true;
  end;
end;

function TForm4.find_grn(rkey95: integer): boolean;
var
 i:word;
begin
 result:=false;
 for i:=1 to stgd1.RowCount-2 do
  if strtoint(stgd1.Cells[9,i])=rkey95 then
   begin
    result:=true;
    break;
   end;
end;

procedure TForm4.FormActivate(Sender: TObject);
var
 sql_text:string;
 i:word;
begin
stgd1.Cells[0,0]:='入库单号';
stgd1.Cells[1,0]:='送货单号';
stgd1.Cells[2,0]:='物料名称';
stgd1.Cells[3,0]:='物料规格';
stgd1.Cells[4,0]:='装运日期';
stgd1.Cells[5,0]:='退货数量';
stgd1.Cells[6,0]:='单位';
stgd1.Cells[7,0]:='单价';
stgd1.Cells[8,0]:='税率%';
stgd1.Cells[9,0]:='rkey95';
if self.a_or_e.Caption='0' then  //新增
 begin
  dm.ADOsp04.Close;
  dm.ADOsp04.Open;
  if dm.ADOsp04SEED_FLAG.Value<>1 then
   edit1.Text:=dm.ADOsp04SEED_VALUE.Value;
 end
else
 begin
  self.supp_ptr:=dm.aq132SUPP_PTR.Value;
  self.curr_ptr:=dm.aq132CURRENCY_PTR.Value;
  sql_text:='SELECT dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION,'+#13
     +'dbo.Data0456.GRN_NUMBER, dbo.Data0456.DELIVER_NUMBER,'+#13
     +'dbo.Data0022.PRICE, dbo.Data0022.TAX_2, dbo.Data0002.UNIT_NAME,'+#13
     +'dbo.Data0095.RKEY, dbo.Data0095.QUANTITY, dbo.Data0095.TRAN_DATE'+#13
     +'FROM dbo.Data0095 INNER JOIN' +#13
     +'dbo.Data0017 ON dbo.Data0095.INVT_PTR = dbo.Data0017.RKEY INNER JOIN'+#13
     +'dbo.Data0022 INNER JOIN'+#13
     +'dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'+#13
     +'dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY ON'+#13
     +'dbo.Data0095.SRCE_PTR = dbo.Data0022.RKEY'+#13
     +'WHERE (dbo.Data0095.TRAN_TP = 21) AND'  +#13
     +'(dbo.Data0095.debit_ptr='+dm.aq132rkey.AsString+')';
  with dm.ADOQuery1 do
   begin
    close;
    sql.clear;
    sql.Text:=sql_text;
    open;
   end;
  for i:=1 to dm.ADOQuery1.RecordCount do
   begin
    stgd1.Cells[0,i]:=dm.ADOQuery1.FieldValues['GRN_NUMBER']; //'入库单号';
    stgd1.Cells[1,i]:=dm.ADOQuery1.fieldbyname('DELIVER_NUMBER').AsString; //'送货单号';
    stgd1.Cells[2,i]:=dm.ADOQuery1.FieldValues['INV_NAME']; //'物料名称';
    stgd1.Cells[3,i]:=dm.ADOQuery1.FieldValues['INV_DESCRIPTION']; //'物料规格';
    stgd1.Cells[4,i]:=dm.ADOQuery1.fieldbyname('TRAN_DATE').AsString; //'装运日期';
    stgd1.Cells[5,i]:=dm.ADOQuery1.fieldbyname('QUANTITY').AsString; //'退货数量';
    stgd1.Cells[6,i]:=dm.ADOQuery1.FieldValues['UNIT_NAME']; //'单位';
    stgd1.Cells[7,i]:=dm.ADOQuery1.fieldbyname('PRICE').AsString;  //'单价';
    stgd1.Cells[8,i]:=dm.ADOQuery1.fieldbyname('TAX_2').AsString; //'税率';
    stgd1.Cells[9,i]:=dm.ADOQuery1.fieldbyname('RKEY').AsString; //'rkey95';
    stgd1.RowCount:=stgd1.RowCount+1;
    dm.ADOQuery1.Next;
   end;

 end;
end;

procedure TForm4.stgd1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
   stgd1.MouseToCell(x,y,column,row);
   if row<>0 then stgd1.Row:=row;
 end;
end;

procedure TForm4.PopupMenu1Popup(Sender: TObject);
begin
 if stgd1.Row=stgd1.RowCount-1 then
  begin
   n2.Enabled:=false;
  end
 else
  begin
   n2.Enabled:=true;
  end;
end;

procedure TForm4.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as tedit).Text)>0  then abort;
end;

procedure TForm4.Edit2Exit(Sender: TObject);
begin
 edit2.Text := formatfloat('0.00',strtofloat(edit2.Text));
end;

procedure TForm4.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key<>9 then
 begin
  if trim(edit2.Text) = '' then edit2.Text := '0';
  edit8.Text:=formatfloat('0.00',strtofloat(edit2.Text)+
                                 strtofloat(edit3.Text)+
                                 strtofloat(edit7.Text));
 end;
end;

procedure TForm4.N2Click(Sender: TObject);
var
 i:word;
begin
 edit8.Text:=formatfloat('0.00',strtofloat(edit8.text)-
                         strtofloat(stgd1.Cells[5,stgd1.Row])*
                         strtofloat(stgd1.Cells[7,stgd1.Row]));
 if strtofloat(stgd1.Cells[8,stgd1.Row])>0 then
 edit7.Text:=formatfloat('0.00',strtofloat(edit7.text)-
 strtofloat(stgd1.Cells[5,stgd1.Row])*strtofloat(stgd1.Cells[7,stgd1.Row])*
 strtofloat(stgd1.Cells[8,stgd1.Row])*0.01 /
 (1+strtofloat(stgd1.Cells[8,stgd1.Row])*0.01)
                         );
 edit3.Text := formatfloat('0.00',strtofloat(edit8.Text)-
                           strtofloat(edit2.Text)-
                           strtofloat(edit7.Text));

 for i:=stgd1.Row to stgd1.RowCount-2 do
  stgd1.Rows[i].Text:=stgd1.Rows[i+1].Text;
 stgd1.RowCount:=stgd1.RowCount-1;
 
end;

procedure TForm4.N1Click(Sender: TObject);

begin
form_sendback:=tform_sendback.Create(application);
form_sendback.aqwz95.Close;
form_sendback.aqwz95.Parameters[0].Value:=self.supp_ptr;
form_sendback.aqwz95.Parameters[1].Value:=self.curr_ptr;
form_sendback.aqwz95.Open;
if not form_sendback.aqwz95.IsEmpty then
if form_sendback.ShowModal=mrok then
 begin
   if self.find_grn(form_sendback.aqwz95RKEY.Value) then
    showmessage('该退装运已经在备忘中,不能重复增加')
   else
    begin
      stgd1.Cells[0,stgd1.RowCount-1]:=form_sendback.aqwz95GRN_NUMBER.Value; //'入库单号';
      stgd1.Cells[1,stgd1.RowCount-1]:=form_sendback.aqwz95DELIVER_NUMBER.Value; //'送货单号';
      stgd1.Cells[2,stgd1.RowCount-1]:=form_sendback.aqwz95INV_NAME.Value; //'物料名称';
      stgd1.Cells[3,stgd1.RowCount-1]:=form_sendback.aqwz95INV_DESCRIPTION.Value; //'物料规格';
      stgd1.Cells[4,stgd1.RowCount-1]:=form_sendback.aqwz95TRAN_DATE.AsString; //'装运日期';
      stgd1.Cells[5,stgd1.RowCount-1]:=form_sendback.aqwz95QUANTITY.AsString; //'退货数量';
      stgd1.Cells[6,stgd1.RowCount-1]:=form_sendback.aqwz95UNIT_NAME.Value; //'单位';
      stgd1.Cells[7,stgd1.RowCount-1]:=form_sendback.aqwz95PRICE.AsString;  //'单价';
      stgd1.Cells[8,stgd1.RowCount-1]:=form_sendback.aqwz95TAX_2.AsString; //'税率';
      stgd1.Cells[9,stgd1.RowCount-1]:=form_sendback.aqwz95RKEY.AsString; //'rkey95';
      stgd1.RowCount:=stgd1.RowCount+1;
      edit8.Text:=formatfloat('0.00',strtofloat(edit8.Text)+
                  form_sendback.aqwz95amount.Value);   //合计金额

      edit7.Text:=formatfloat('0.00',strtofloat(edit7.Text)+
                  form_sendback.aqwz95tax_amount.Value);//税金

      edit3.Text := formatfloat('0.00',strtofloat(edit8.Text)- //不含税金额
                           strtofloat(edit2.Text)-
                           strtofloat(edit7.Text));
    end;
 end
else
else
 showmessage('没有找到退货装运记录了!'); 
form_sendback.Free;
end;

procedure TForm4.BitBtn1Enter(Sender: TObject);
begin
if trim(edit1.Text)='' then
 begin
  showmessage('备忘编号不允许为空!');
  edit1.SetFocus;
  exit;
 end;

if not dm.ADOsp04.Active then dm.ADOsp04.Open;
if dm.ADOsp04SEED_FLAG.Value<>1 then
if not (edit1.Text[length(trim(edit1.Text))] in ['0'..'9']) then
 begin
  messagedlg('备忘编号最后一位必需是一个整数!',mtinformation,[mbok],0);
  edit1.SetFocus;
  exit;
 end;
if stgd1.RowCount=2 then
 begin
  messagedlg('至少需要一个退货装运记录',mtinformation,[mbok],0);
  stgd1.SetFocus;
  exit;
 end;

if strtofloat(edit8.Text)-strtofloat(edit9.Text) < 0 then
 begin
  edit8.SetFocus;
  showmessage('该借项备忘已被使用,借项金额不能少于'+edit9.Text);
  exit;
 end;

end;

procedure TForm4.BitBtn1Click(Sender: TObject);
var
 i:word;
begin
if self.a_or_e.Caption='0' then
begin
if self.find_error(trim(edit1.Text)) then
 begin
  if messagedlg('支票编号重复,可能有多台计算机同时新增,是否自动更新编号?',mtConfirmation,
   [mbYes,mbNo],0)=mrYes  then
   begin
    dm.adosp04.close;
    dm.adosp04.Open;
    edit1.Text:=dm.ADOsp04SEED_VALUE.Value;
   end
  else
   begin
    edit1.SetFocus;
    exit;
   end;
 end;
 dm.ACt.BeginTrans;
 try
 dm.ADO132.Close;
 dm.ADO132.Parameters[0].Value:=null;
 dm.ADO132.Open;
 dm.ADO132.Append;
 dm.ADO132MEMO_NUMBER.Value:=trim(edit1.Text);
 dm.ADO132SUPP_PTR.Value:=self.supp_ptr;
 dm.ADO132MEMO_TP.Value:=3;   //退货备忘
 dm.ADO132EMPL_PTR.Value:=strtoint(form1.user_ptr.caption);
 dm.ADO132MEMO_DATE.Value:=self.dtpk1.Date;
 dm.ADO132ENT_DATE.Value:=self.dtpk2.Date;
 dm.ADO132AMOUNT.Value:=strtofloat(edit8.Text);
 dm.ADO132AVL_AMT.Value:=dm.ADO132AMOUNT.Value;
 dm.ADO132MATL_TOT.Value:=strtofloat(edit3.Text);
 dm.ADO132MISC_TOT.Value:=strtofloat(edit2.Text);
 dm.ADO132FED_TAX.Value:=strtofloat(edit7.Text);
 dm.ADO132CURRENCY_PTR.Value:=self.curr_ptr;
 dm.ADO132EX_RATE.Value:=strtofloat(edit6.Text);
 dm.ADO132REF_NUMBER.Value:=edit15.Text;
 dm.ADO132.Post;
 self.update_04(trim(edit1.Text));
 for i:=1 to stgd1.RowCount-2 do
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('update data0095');
    sql.Add('set debit_ptr='+dm.ADO132RKEY.AsString);
    sql.Add('where rkey='+stgd1.Cells[9,i]);
    ExecSQL
   end;
 dm.ACt.CommitTrans;
 self.ModalResult:=mrok;
 except
  dm.ACt.RollbackTrans;
  showmessage('数据保存遇到错误请速与管理员联系William.Wang!');
  edit1.SetFocus; 
 end;
end
else //编辑
 begin
  dm.ACt.BeginTrans;
  try
  dm.ADO132.Close;
  dm.ADO132.Parameters[0].Value:=dm.aq132rkey.Value;
  dm.ADO132.Open;
  dm.ADO132.Edit;
  dm.ADO132MEMO_NUMBER.Value:=trim(edit1.Text);
  dm.ADO132MEMO_DATE.Value:=self.dtpk1.Date;
  dm.ADO132ENT_DATE.Value:=self.dtpk2.Date;
  dm.ADO132AMOUNT.Value:=strtofloat(edit8.Text);
  dm.ADO132AVL_AMT.Value:=dm.ADO132AMOUNT.Value-strtofloat(edit9.Text);
  dm.ADO132MATL_TOT.Value:=strtofloat(edit3.Text);
  dm.ADO132MISC_TOT.Value:=strtofloat(edit2.Text);
  dm.ADO132FED_TAX.Value:=strtofloat(edit7.Text);
  dm.ADO132REF_NUMBER.Value:=edit15.Text;
  dm.ADO132.Post;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('update data0095');
    sql.Add('set debit_ptr=null');
    sql.Add('where debit_ptr='+dm.ADO132RKEY.AsString);
    ExecSQL
   end;

 for i:=1 to stgd1.RowCount-2 do
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('update data0095');
    sql.Add('set debit_ptr='+dm.ADO132RKEY.AsString);
    sql.Add('where rkey='+stgd1.Cells[9,i]);
    ExecSQL
   end;
 dm.ACt.CommitTrans;
 self.ModalResult:=mrok;
 except
  dm.ACt.RollbackTrans;
  showmessage('数据保存遇到错误请速与管理员联系William.Wang!');
  edit1.SetFocus; 
 end;
 end;
end;

end.
