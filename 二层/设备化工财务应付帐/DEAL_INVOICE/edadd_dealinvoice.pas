unit edadd_dealinvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Grids, Menus;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    StringGrid1: TStringGrid;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    StringGrid2: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Label14: TLabel;
    ComboBox1: TComboBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BitBtn2: TBitBtn;
    PopupMenu2: TPopupMenu;
    procedure FormActivate(Sender: TObject);
    procedure StringGrid2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure StringGrid2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    function find_grn(rkey456:integer):boolean;
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7Exit(Sender: TObject);
    procedure Edit7KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure DateTimePicker2Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    function find_invoerror(number:string):boolean;
    procedure update_04(v_seed:string);
    procedure update_456_22(inv_tp:integer);
  private
    { Private declarations }
   tax_amount:currency;
   tax_date:tdatetime;
   tax_remark:string; 
  public
    { Public declarations }
    warehouse_ptr,supp_ptr,currency_ptr:integer;
  end;

var
  Form2: TForm2;
  function Power(x, y : extended) : extended;
implementation

uses main, datamd, supp_invtrecept, tax_invoice;

{$R *.dfm}

procedure TForm2.FormActivate(Sender: TObject);
begin
stringgrid1.Cells[0,0]:='材料名称';
stringgrid1.Cells[1,0]:='材料规格';
stringgrid1.Cells[2,0]:='接收数量';
stringgrid1.Cells[3,0]:='单位';
stringgrid1.Cells[4,0]:='价格';
stringgrid1.Cells[5,0]:='税率%';
stringgrid1.Cells[6,0]:='金额';
stringgrid1.Cells[7,0]:='税金';
stringgrid1.Cells[8,0]:='grn_ptr';

stringgrid2.Cells[0,0]:='入仓单号';
stringgrid2.Cells[1,0]:='送货单号';
stringgrid2.Cells[2,0]:='采购订单';
stringgrid2.Cells[3,0]:='送货日期';
stringgrid2.Cells[4,0]:='grn_rkey';
if self.warehouse_ptr>0 then//新增
 begin
  dm.ADOSP04.Close;
  dm.ADOSP04.Open;
  if dm.ADOSP04SEED_FLAG.Value<>1 then
  edit1.Text:=dm.ADOSP04SEED_VALUE.Value;
  self.tax_date:=form1.sys_shortdate;   //税票日期
 end
else                  //编辑或者检查
 begin
  dm.ADO107.Close;
  dm.ADO107.Parameters[0].Value:=dm.Aq107rkey.Value;
  dm.ADO107.Open;
  self.tax_amount:=dm.Ado107tax_invoice_amt.Value;
  self.tax_date:=dm.Ado107tax_invoice_date.Value;
  self.tax_remark:=dm.Ado107tax_invoice_ref.Value;
  dm.ADO107.Close;
 end;
end;

procedure TForm2.StringGrid2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
   stringgrid2.MouseToCell(x,y,column,row);
   if row<>0 then stringgrid2.Row:=row;
 end;
end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
 if stringgrid2.Row=stringgrid2.RowCount-1 then
  begin
   n2.Enabled:=false;
  end
 else
  begin
   n2.Enabled:=true;
  end;
end;

procedure TForm2.StringGrid2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 if aRow=stringgrid2.RowCount-1 then
  begin
   speedbutton2.Enabled:=false;
  end
 else
  begin
  
   speedbutton2.Enabled:=true;
  end;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
var
 amount,tax_amount: currency;
begin
Form_suppinvtrecept:=TForm_suppinvtrecept.Create(application);
if self.warehouse_ptr>0 then//新增
with Form_suppinvtrecept.aq456 do
 begin
  close;
  Parameters[0].Value:=self.supp_ptr;
  Parameters[1].Value:=self.warehouse_ptr;
  Parameters[2].Value:=self.currency_ptr;
  Parameters[3].Value:=self.ComboBox1.ItemIndex+1;
  open;
 end
else              //编辑
with Form_suppinvtrecept.aq456 do
 begin
  close;
  Parameters[0].Value:=dm.Aq107SUPP_PTR.Value;
  Parameters[1].Value:=dm.Aq107warehouse_ptr.Value;
  Parameters[2].Value:=dm.Aq107CURRENCY_PTR.Value;
  Parameters[3].Value:=self.ComboBox1.ItemIndex+1;
  open;
 end;
Form_suppinvtrecept.aq22.Open;
if  Form_suppinvtrecept.aq456.IsEmpty then
 showmessage('没有找到符合条件的入仓单')
else
 if Form_suppinvtrecept.ShowModal=mrok then
  begin
   if self.find_grn(Form_suppinvtrecept.aq456RKEY.Value) then
    showmessage('该入仓单已经在发票里面了,不能重复增加')
   else
    begin
     stringgrid2.Cells[0,stringgrid2.RowCount-1]:=Form_suppinvtrecept.aq456GRN_NUMBER.Value;
     stringgrid2.Cells[1,stringgrid2.RowCount-1]:=Form_suppinvtrecept.aq456DELIVER_NUMBER.Value;
     stringgrid2.Cells[2,stringgrid2.RowCount-1]:=Form_suppinvtrecept.aq456PO_NUMBER.Value;
     stringgrid2.Cells[3,stringgrid2.RowCount-1]:=Form_suppinvtrecept.aq456ship_DATE.AsString;
     stringgrid2.Cells[4,stringgrid2.RowCount-1]:=Form_suppinvtrecept.aq456RKEY.AsString;
     stringgrid2.RowCount:=stringgrid2.RowCount+1;
     amount:=0;
     tax_amount:=0;
     Form_suppinvtrecept.aq22.First;
     while not Form_suppinvtrecept.aq22.Eof do
      begin
       stringgrid1.Cells[0,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq22INV_NAME.Value;
       stringgrid1.Cells[1,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq22INV_DESCRIPTION.Value;
       stringgrid1.Cells[2,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq22QUANTITY.AsString;
       stringgrid1.Cells[3,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq22UNIT_NAME.Value;
       stringgrid1.Cells[4,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq22PRICE.AsString;
       stringgrid1.Cells[5,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq22TAX_2.AsString;
       stringgrid1.Cells[6,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq22amount.AsString;
       stringgrid1.Cells[7,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq22tax_amount.AsString;
       stringgrid1.Cells[8,stringgrid1.RowCount-1]:=Form_suppinvtrecept.aq22GRN_PTR.AsString;
       stringgrid1.RowCount:=stringgrid1.RowCount+1;
       amount:=amount+Form_suppinvtrecept.aq22amount.Value;
       tax_amount:=tax_amount+Form_suppinvtrecept.aq22tax_amount.Value;
       Form_suppinvtrecept.aq22.Next;
      end;
     edit6.Text:=floattostr(amount+strtofloat(edit6.Text));
     edit9.Text:=floattostr(tax_amount+strtofloat(edit9.Text));
     edit8.Text:=floattostr(strtofloat(edit6.Text)-
                            strtofloat(edit9.Text)-
                            strtofloat(edit7.Text));
    end;
  end;
Form_suppinvtrecept.free;
end;

function TForm2.find_grn(rkey456: integer): boolean;
var
 i:word;
begin
 result:=false;
 for i:=1 to stringgrid2.RowCount-2 do
  if strtoint(stringgrid2.Cells[4,i])=rkey456 then
   begin
    result:=true;
    break;
   end;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
var
 i,j:word;
 find_22:boolean;
begin
find_22:=true;
while find_22 do
 begin
  if stringgrid1.RowCount>2 then
  begin
  for i:=1 to stringgrid1.RowCount-2 do
  if strtoint(stringgrid1.Cells[8,i])=strtoint(stringgrid2.Cells[4,stringgrid2.row])  then
   begin
    edit6.Text:=floattostr(strtofloat(edit6.text)-
                           strtofloat(stringgrid1.Cells[6,i]));
    edit9.Text:=floattostr(strtofloat(edit9.text)-
                           strtofloat(stringgrid1.Cells[7,i]));
    edit8.Text:=floattostr(strtofloat(edit6.Text)-
                            strtofloat(edit9.Text)-
                            strtofloat(edit7.Text));
    for j:=i to stringgrid1.RowCount-2 do
     stringgrid1.Rows[j].Text:=stringgrid1.Rows[j+1].Text;
     stringgrid1.RowCount:=stringgrid1.RowCount-1;
    break;
   end
  else
   if i=stringgrid1.RowCount-2 then
    find_22:=false;
  end
  else
   find_22:=false;
 end;


 for i:=stringgrid2.Row to stringgrid2.RowCount-2 do
  stringgrid2.Rows[i].Text:=stringgrid2.Rows[i+1].Text;
 stringgrid2.RowCount:=stringgrid2.RowCount-1;

end;

procedure TForm2.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as tedit).Text)>0  then abort;
end;

procedure TForm2.Edit7Exit(Sender: TObject);
begin
if trim(edit7.Text) = '' then edit7.Text := '0';
 edit7.Text := formatfloat('0.00',strtofloat(edit7.Text));
end;

procedure TForm2.Edit7KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key<>9 then
 begin
  if trim(edit7.Text) = '' then edit7.Text := '0';
  edit6.Text:=formatfloat('0.00',strtofloat(edit7.Text)+
                                 strtofloat(edit8.Text)+
                                 strtofloat(edit9.Text));
 end;
end;

procedure TForm2.DateTimePicker1Exit(Sender: TObject);
begin
if datetimepicker1.Date>self.DateTimePicker2.Date then
 begin
  showmessage('发票日期不能大于付款日期!');
  self.DateTimePicker1.SetFocus;
 end;
end;

procedure TForm2.DateTimePicker2Exit(Sender: TObject);
begin
if datetimepicker1.Date>self.DateTimePicker2.Date then
 begin
  showmessage('付款日期不能小于发票日期!');
  self.DateTimePicker2.SetFocus;
 end;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
form3:=tform3.Create(application);
form3.Edit1.Text:=floattostr(self.tax_amount);
form3.DateTimePicker1.Date:=self.tax_date;
form3.Edit2.Text:=self.tax_remark;
if not bitbtn1.Enabled then
 begin
  form3.Edit1.Enabled:=false;
  form3.DateTimePicker1.Enabled:=false;
  form3.Edit2.Enabled:=false;
 end;

if form3.ShowModal = mrok then
 begin
  self.tax_amount := strtofloat(form3.Edit1.Text);
  self.tax_date := form3.DateTimePicker1.Date;
  self.tax_remark:=form3.Edit2.Text;
 end;
form3.Free;
end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
begin
if trim(edit1.Text)='' then
 begin
  showmessage('发票编号不允许为空!');
  edit1.SetFocus;
  exit;
 end;
 
if not dm.Adosp04.Active then dm.adosp04.Open;
if (dm.adosp04SEED_FLAG.Value<>1) and
  (not (edit1.Text[length(trim(edit1.Text))] in ['0'..'9'])) then
 begin
  messagedlg('发票编号最后一位必需是一个整数!',mtinformation,[mbok],0);
  edit1.SetFocus;
  exit;
 end;

if stringgrid2.RowCount=2 then
 begin
  showmessage('一个发票至少需要一个入库单!');
  stringgrid2.SetFocus;
  exit;
 end;
 
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
if self.warehouse_ptr>0 then      //新增
 begin
  if self.find_invoerror(trim(edit1.Text)) then
  begin
  if messagedlg('发票编号重复,可能有多台计算机同时新增,是否自动更新编号?',mtConfirmation,
   [mbYes,mbNo],0)=mrYes  then
   begin
    dm.adosp04.Close;
    dm.adosp04.Open;
    edit1.Text:=dm.adosp04SEED_VALUE.Value;
   end
  else
   begin
    edit1.SetFocus;
    exit;
   end;
  end;
  dm.ACt.BeginTrans;
  try
  dm.ADO107.Close;
  dm.ADO107.Parameters[0].Value:=null;
  dm.ADO107.Open;
  dm.ADO107.Append;
  dm.ADO107INVOICE_NO.Value:=trim(edit1.Text);
  dm.ADO107SUPP_PTR.Value:=self.supp_ptr;
  dm.ADO107CURRENCY_PTR.Value:=self.currency_ptr;
  dm.ADO107EX_RATE.AsString:=edit5.Text;
  dm.ADO107warehouse_ptr.Value:=self.warehouse_ptr;
  dm.ADO107EMPL_PTR.Value:=strtoint(form1.user_ptr.caption);
  dm.ADO107INV_TP.Value:=self.ComboBox1.ItemIndex+1;
  dm.ADO107STATUS.Value:=1;
  dm.ADO107INV_TOTAL.Value:=strtofloat(edit6.Text);
  dm.ADO107MATL_TOT.Value:=strtofloat(edit8.Text);
  dm.ADO107FED_TAX.Value:=strtofloat(edit9.Text);
  dm.ADO107MISC_TOT.Value:=strtofloat(edit7.Text);
  dm.ADO107INV_DATE.Value:=self.DateTimePicker1.Date;
  dm.ADO107DUE_DATE.Value:=self.DateTimePicker2.Date;
  dm.ADO107ENT_DATE.Value:=form1.sys_longdate;
  dm.ADO107tax_invoice_amt.Value:=self.tax_amount;
  dm.ADO107tax_invoice_date.Value:=self.tax_date;
  dm.ADO107tax_invoice_ref.Value:=self.tax_remark;
  dm.ADO107.Post;
  update_04(trim(dm.ADOSP04SEED_VALUE.Value)); //更新04控制码
  self.update_456_22(dm.ADO107INV_TP.Value);
  dm.ACt.CommitTrans;
  ModalResult:=mrok;
  except
   dm.ACt.RollbackTrans;
   showmessage('数据保存遇到错误请速与管理员联系William.Wang!');
   edit1.SetFocus;
  end;
 end
else           //编辑
 begin
  dm.ACt.BeginTrans;
  try
   dm.ADO107.Close;
   dm.ADO107.Parameters[0].Value:=dm.Aq107rkey.Value;
   dm.ADO107.Open;
   dm.ADO107.Edit;
   dm.ADO107INVOICE_NO.Value:=trim(edit1.Text);
   dm.ADO107INV_DATE.Value:=self.DateTimePicker1.Date;
   dm.ADO107DUE_DATE.Value:=self.DateTimePicker2.Date;
   dm.ADO107INV_TOTAL.Value:=strtofloat(edit6.Text);
   dm.ADO107MATL_TOT.Value:=strtofloat(edit8.Text);
   dm.ADO107FED_TAX.Value:=strtofloat(edit9.Text);
   dm.ADO107MISC_TOT.Value:=strtofloat(edit7.Text);
   dm.ADO107tax_invoice_amt.Value:=self.tax_amount;
   dm.ADO107tax_invoice_date.Value:=self.tax_date;
   dm.ADO107tax_invoice_ref.Value:=self.tax_remark;
   dm.ADO107.Post;

   case dm.ADO107INV_TP.Value of
    1:
     begin
     with dm.adoquery3 do
      begin
       close;
       sql.Clear;
       sql.Add('update data0070');
       sql.Add('set status=6');
       sql.Add('where rkey in (select dbo.Data0456.PO_PTR');
       sql.Add('FROM dbo.Data0456 INNER JOIN');
       sql.Add('dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY INNER JOIN');
       sql.Add('dbo.Data0071 ON dbo.Data0070.RKEY = dbo.Data0071.PO_PTR');
       sql.Add('WHERE (dbo.Data0456.dealiv_ptr = :rkey107) AND (dbo.Data0070.STATUS = 7)');
       sql.Add('GROUP BY dbo.Data0456.PO_PTR');
       sql.Add('HAVING (SUM(dbo.Data0071.QUAN_INVD) >= SUM(dbo.Data0071.QUAN_RECD)))');
       Parameters[0].Value:=dm.ADO107rkey.Value;
       execsql;
      end;
     with dm.ADOQuery2 do
     begin
     close;
     sql.Clear;
     sql.Add('update data0071');
     sql.Add('set QUAN_INVD = QUAN_INVD-data0022.QUANTITY');
     sql.Add('FROM dbo.Data0071 INNER JOIN');
     sql.Add('dbo.Data0022 ON dbo.Data0071.RKEY = dbo.Data0022.SOURCE_PTR INNER JOIN');
     sql.Add('dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY');
     sql.Add('where data0456.dealiv_ptr='+dm.Aq107rkey.AsString);
     ExecSQL
     end;
     end;
    2:
     begin
     with dm.adoquery3 do
      begin
       close;
       sql.Clear;
       sql.Add('update data0070');
       sql.Add('set status=6');
       sql.Add('where rkey in (select dbo.Data0456.PO_PTR');
       sql.Add('FROM dbo.Data0456 INNER JOIN');
       sql.Add('dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY INNER JOIN');
       sql.Add('dbo.Data0072 ON dbo.Data0070.RKEY = dbo.Data0072.POPTR');
       sql.Add('WHERE (dbo.Data0456.dealiv_ptr = :rkey107) AND (dbo.Data0070.STATUS = 7)');
       sql.Add('GROUP BY dbo.Data0456.PO_PTR');
       sql.Add('HAVING (SUM(dbo.Data0072.QUAN_INVD) >= SUM(dbo.Data0072.QUANTITY_RECEIVED)))');
       Parameters[0].Value:=dm.ADO107rkey.Value;
       execsql;
      end;
     with dm.ADOQuery2 do
     begin
     close;
     sql.Clear;
     sql.Add('update data0072');
     sql.Add('set QUAN_INVD = QUAN_INVD-data0235.QUAN_RECD');
     sql.Add('FROM dbo.Data0072 INNER JOIN');
     sql.Add('dbo.Data0235 ON dbo.Data0072.RKEY = dbo.Data0235.D0072_PTR INNER JOIN');
     sql.Add('dbo.Data0456 ON dbo.Data0235.GRN_PTR = dbo.Data0456.RKEY');
     sql.Add('where data0456.dealiv_ptr='+dm.Aq107rkey.AsString);
     ExecSQL
     end;
     end;
   end;

    with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0456');
     sql.Add('set status=3,');
     sql.Add('dealiv_ptr=null');
     sql.Add('where dealiv_ptr='+dm.Aq107rkey.AsString);
     ExecSQL
    end;

   self.update_456_22(dm.ADO107INV_TP.Value);
   dm.ACt.CommitTrans;
   modalresult:=mrok;
  except
   dm.ACt.RollbackTrans;
   showmessage('数据保存遇到错误请认确码修改后是否重复!');
   edit1.SetFocus;
  end;
 end;
end;

function TForm2.find_invoerror(number: string): boolean;
begin
 result := false;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0107');
   sql.Add('where INVOICE_NO='''+number+'''');
   open;
   if not IsEmpty then result := true;
  end;
end;

procedure TForm2.update_04(v_seed: string);
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

function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
end;

procedure TForm2.update_456_22(inv_tp:integer);
var
 i:word;
begin
 for i:=1 to stringgrid2.RowCount-2 do
  begin
   with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('update data0456');
    sql.Add('set status=4,');
    sql.Add('dealiv_ptr='+dm.ADO107rkey.AsString);
    sql.Add('where rkey='+stringgrid2.Cells[4,i]);
    ExecSQL
   end;
  case inv_tp of
  1:
   with dm.ADOQuery2 do
   begin
    close;
    sql.Clear;
    sql.Add('update data0071');
    sql.Add('set QUAN_INVD=QUAN_INVD+data0022.QUANTITY');
    sql.Add('from data0022 inner join data0071');
    sql.Add('on data0022.SOURCE_PTR=data0071.rkey');
    sql.Add('where data0022.grn_ptr='+stringgrid2.Cells[4,i]);
    ExecSQL
   end;
   2:
   with dm.ADOQuery2 do
   begin
    close;
    sql.Clear;
    sql.Add('update data0072');
    sql.Add('set QUAN_INVD=QUAN_INVD+data0235.QUAN_RECD');
    sql.Add('from data0235 inner join data0072');
    sql.Add('on data0235.D0072_PTR=data0072.rkey');
    sql.Add('where data0235.grn_ptr='+stringgrid2.Cells[4,i]);
    ExecSQL
   end;
  end;
  end;
end;

end.
