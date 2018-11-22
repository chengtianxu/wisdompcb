unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus,
  ComObj,Excel2000,ClipBrd, DB, ADODB,DateUtils;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    BitBtn4: TBitBtn;
    N2: TMenuItem;
    Edit2: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    PopupMenu2: TPopupMenu;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    empl_name: TLabel;
    curr_code: TLabel;
    N23: TMenuItem;
    N24: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CopyDbDataToExcel(Args:array of const);
    procedure N7Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    function find_accterror(rkey103: integer): boolean;
    function get_gltp(rkey103: string): integer;
    function get_glcurr_ptr(rkey103: string): integer;
    function get_vouchernumber(ttype:byte;inv_date: tdatetime): string;
    function vo_number(number: string): boolean;
    procedure N22Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
  private
    { Private declarations }
   command_text:string;

   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
   trans_pl:byte;
   sys_shortdate:tdatetime;
  end;

var
  Form1: TForm1;
  function RemoveInvalid(where: string): string;
implementation

uses datamd, payment_invoice, mature_invoice, supp_prepay, term,common;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 if not app_init(dm.ACt) then
 begin
  showmsg('程序起动失败,请与管理员联系!',1);
  application.Terminate;
 end;
 self.Caption:= application.Title;

  //user_ptr:='1016';
  //vprev:='4';
 // dm.ACt.Open;
  
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

function TForm1.vo_number(number: string): boolean;
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

function TForm1.get_vouchernumber(ttype:byte;inv_date: tdatetime): string;
var
 voucher:string;
 pr_req:integer;
begin
 if (ttype=1) or (ttype=2) then //现银付款
  voucher:='PA'+copy(inttostr(yearof(inv_date)),3,2)  //年度
 else
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

function TForm1.get_gltp(rkey103: string): integer;
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

function TForm1.get_glcurr_ptr(rkey103: string): integer;
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

function TForm1.find_accterror(rkey103: integer): boolean;
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0128 where GL_ACCT_PTR='+inttostr(rkey103));
  open;
 end;
if not dm.ADOQuery1.IsEmpty then
 result:=true
else
 result:=false;
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

procedure Tform1.CopyDbDataToExcel(Args:array of const);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
 I: Integer;
begin
 Screen.Cursor := crHourGlass;
 if not VarIsEmpty(XLApp) then
 begin
   XLApp.DisplayAlerts := False;
   XLApp.Quit;
   VarClear(XLApp);
 end;
 try
   XLApp := CreateOleObject('Excel.Application');
 except
   Screen.Cursor := crDefault;
   Exit;
 end;
 XLApp.WorkBooks.Add;
 XLApp.SheetsInNewWorkbook := High(Args) + 1;

 for I := Low(Args) to High(Args) do
 begin
   XLApp.WorkBooks[1].WorkSheets[I+1].Name := self.Caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
   if not TDBGrid(Args[I].VObject).DataSource.DataSet.Active then
    begin
     Screen.Cursor := crDefault;
     Exit;
    end;
   TDBGrid(Args[I].VObject).DataSource.DataSet.DisableControls;
   TDBGrid(Args[I].VObject).DataSource.DataSet.first;

   v_cloumn:=0;
   for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
    if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
     Sheet.Cells[1, iCount + 1 - v_cloumn] :=
     TDBGrid(Args[I].VObject).Columns.Items[iCount].Title.Caption
    else
     inc(v_cloumn);

   jCount := 1;
   while not TDBGrid(Args[I].VObject).DataSource.DataSet.Eof do
   begin
     v_cloumn:=0;
     for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
      if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
       Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
       TDBGrid(Args[I].VObject).Columns.Items[iCount].Field.AsString
      else
       inc(v_cloumn);
     Inc(jCount);
     TDBGrid(Args[I].VObject).DataSource.DataSet.Next;
   end;

   XlApp.Visible := True;
   TDBGrid(Args[I].VObject).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;
end;

procedure TForm1.NewGridWnd(var Message: TMessage);
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

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.FormShow(Sender: TObject);

begin
if  dm.act.Connected then
 begin
   field_name:='CHECK_NUMBER';     //设备过滤字段
   with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('select getdate() as v_dt');
    active:=true;
    sys_shortdate:=strtodate(datetostr(fieldvalues['v_dt']));
   end;
   with dm.ADOQuery1 do
   begin
    close;
    sql.Text:='select employee_name from data0005'+#13+
               'where rkey='+user_ptr;
    open;
    self.empl_name.Caption:=fieldbyname('employee_name').AsString;
   end;
  with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select curr_code from data0001 where rkey=1');
   open;
   self.curr_code.Caption:=fieldvalues['curr_code'];
  end;
  with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select trans_pl from data0192');
   open;
   self.trans_pl:=fieldvalues['trans_pl'];
  end;
  dm.Aq129.Close;
  dm.Aq129.Parameters[0].Value:=sys_shortdate-dayof(sys_shortdate)+1;
  dm.Aq129.Parameters[1].Value:=sys_shortdate;
  dm.Aq129.Open;
  self.command_text:=dm.AQ129.CommandText;
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
  dm.aq129.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  dm.aq129.Filter:='';
 dm.AQ129AfterOpen(dm.AQ129);
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
 showmessage(dm.AQ129.CommandText);
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if dm.AQ129.IndexFieldNames<>column.FieldName then
 dm.AQ129.IndexFieldNames:=column.FieldName;
if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;
 end
else
 edit1.SetFocus;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 rkey:integer;
begin
 rkey:=dm.Aq129rkey.Value;
 dm.Aq129.Close;
 dm.Aq129.Open;
 if rkey>0 then dm.Aq129.Locate('rkey',rkey,[]);
end;

procedure TForm1.N1Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
form2:=tform2.Create(application);
form2.dtpk1.Date:=self.sys_shortdate;
form2.ComboBox1.ItemIndex:=0;    //现银支付
form2.edit_flag:=0;      //标识新增
form2.Label25.Caption:='付款凭证';
form2.RadioGroup1.ItemIndex:=self.trans_pl;
if form2.ShowModal=mrok then
 begin
  dm.AQ129.Close;
  dm.AQ129.Open;
  dm.AQ129.Locate('rkey',dm.ADO129RKEY.Value,[]);
  dm.ado129.close;
  dm.ADO105.Close;
  dm.ADO106.Close;
  dm.ADO130.Close;
 end;
finally
form2.Free;
end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
form2:=tform2.Create(application);
form2.dtpk1.Date:=self.sys_shortdate;
form2.ComboBox1.ItemIndex:=4;    //转帐支付
form2.bitbtn2.Enabled:=false;
form2.Label25.Caption:='转帐凭证';
form2.RadioGroup1.ItemIndex:=self.trans_pl;
if form2.ShowModal=mrok then
 begin
  dm.AQ129.Close;
  dm.AQ129.Open;
  dm.AQ129.Locate('rkey',dm.ADO129RKEY.Value,[]);
  dm.ado129.close;
  dm.ADO105.Close;
  dm.ADO106.Close;
  dm.ADO130.Close;
 end;
finally
form2.Free;
end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
if (dm.AQ129TTYPE.Value<>2) and (dm.AQ129TTYPE.Value<>6) then
try
form2:=tform2.Create(application);
 with form2 do
  begin
   ComboBox1.ItemIndex:=dm.AQ129TTYPE.Value-1;
   if combobox1.ItemIndex<>4 then
    label25.Caption:='付款凭证'
   else
    label25.Caption:='转帐凭证';
   bitbtn1.Enabled:=false;
   bitbtn2.Enabled:=false;
   bitbtn3.Enabled:=false;
   bitbtn5.Enabled:=false;
   edit1.Text:=dm.AQ129CHECK_NUMBER.Value;
   edit1.Enabled:=false;
   edit2.Text:=dm.AQ129BANK_NAME.Value;
   edit7.Text:=dm.AQ129bal_amount.AsString;
   dtpk1.Date:=dm.AQ129TDATE.Value;
   dtpk1.Enabled:=false;
   edit3.Text:=dm.AQ129WAREHOUSE_CODE.Value;
   label9.Caption:=dm.AQ129abbr15name.Value;
   edit4.Text:=dm.AQ129CODE.Value;
   label10.Caption:=dm.AQ129SUPPLIER_NAME.Value;
   edit5.Text:=dm.AQ129CURR_CODE.Value;
   label11.Caption:=dm.AQ129CURR_NAME.Value;
   edit6.Text:=dm.AQ129EX_RATE.AsString;
   edit6.Enabled:=false;
   edit8.Text:=dm.AQ129AMOUNT.AsString;
   edit8.Enabled:=false;
   edit15.Text:=dm.AQ129REMARK.Value;
   edit15.Enabled:=false;
   button1.Enabled:=false;
   button2.Enabled:=false;
   button3.Enabled:=false;
   button4.Enabled:=false;
   label20.Visible:=false;
   edit13.Visible:=false;
   edit_FLAG:=2;//代表检查
   sgrid1.Enabled:=false;
   toolbar1.Enabled:=false;
   edit_number.Enabled:=false;
   BATCH_NUMBER.Enabled:=false;
   edit_date.Enabled:=false;
   updown1.Enabled:=false;
   stgd1.PopupMenu:=nil;
   stgd1.Options:=stgd1.Options-[goediting];
   stgd2.Options:=stgd2.Options-[goediting];   
  end;

form2.ShowModal;
finally
form2.Free;
end
else
try
form4:=tform4.Create(application);
 with form4 do
  begin
   bitbtn1.Enabled:=false;
   bitbtn2.Enabled:=false;
   bitbtn3.Enabled:=false;
   bitbtn5.Enabled:=false;
   ComboBox1.ItemIndex:=dm.AQ129TTYPE.Value-1;
   if combobox1.ItemIndex=2 then
    label25.Caption:='付款凭证'
   else
    label25.Caption:='转帐凭证';
   edit1.Text:=dm.AQ129CHECK_NUMBER.Value;
   edit1.Enabled:=false;
   edit2.Text:=dm.AQ129BANK_NAME.Value;
   edit7.Text:=dm.AQ129bal_amount.AsString;
   dtpk1.Date:=dm.AQ129TDATE.Value;
   dtpk1.Enabled:=false;
   edit3.Text:=dm.AQ129WAREHOUSE_CODE.Value;
   label9.Caption:=dm.AQ129abbr15name.Value;
   edit4.Text:=dm.AQ129CODE.Value;
   label10.Caption:=dm.AQ129SUPPLIER_NAME.Value;
   edit5.Text:=dm.AQ129CURR_CODE.Value;
   label11.Caption:=dm.AQ129CURR_NAME.Value;
   edit6.Text:=dm.AQ129EX_RATE.AsString;
   edit8.Text:=dm.AQ129AMOUNT.AsString;
   edit8.Enabled:=false;
   edit15.Text:=dm.AQ129REMARK.Value;
   edit15.Enabled:=false;
   sgrid1.Enabled:=false;
   toolbar1.Enabled:=false;
   edit_number.Enabled:=false;
   BATCH_NUMBER.Enabled:=false;
   edit_date.Enabled:=false;
   updown1.Enabled:=false;
   edit9.Enabled:=false;
   edit10.Enabled:=false;
   edit_flag:=2;//标识检查
  end;
 form4.ShowModal;
finally
 form4.Free;
end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
  else
  if messagedlg('你确定要取消这条记录吗?该操作将不可逆!',mtConfirmation,[mbyes,mbno],0)=mryes then
  begin

    if strtoint(user_ptr)<>dm.AQ129EMPL_PTR.Value then
    begin
     messagedlg('取消操作必须输入人员才可进行!',mtinformation,[mbok],0);
     exit;
    end;

    dm.ado105.Close;
    dm.ado105.Parameters[0].Value:=dm.AQ129rkey105.Value;
    dm.ado105.Open;

    if not dm.ADO105.IsEmpty and (dm.ado105STATUS.Value>0) then
    begin
     messagedlg('发票生成的会计凭证已被审核,无法取消!',mtinformation,[mbok],0);
     dm.ADO105.Close;
     exit;
    end;

    dm.ADO132.Close;
    dm.ado132.Parameters[0].Value:=dm.AQ129RKEY.Value;
    dm.ado132.open;
    if (not dm.ado132.IsEmpty) and (dm.ado132AMOUNT.Value<>dm.ado132AVL_AMT.Value) then
    begin
     messagedlg('借项备忘已被使用,无法取消!',mtinformation,[mbok],0);
     exit;
    end;

    dm.ADO129.Close;
    dm.ADO129.Parameters[0].Value:=dm.AQ129RKEY.Value;
    dm.ADO129.Open;
    if dm.aq129status.value=dm.ADO129STATUS.Value then
    begin
      dm.ACt.BeginTrans;
      try

        dm.ADO129.Edit;
        dm.ADO129STATUS.Value:=3;
        dm.ADO129.Post;

        if (dm.AQ129TTYPE.Value=1) or (dm.AQ129TTYPE.Value=2) then
        with dm.ADOQuery1 do
        begin
         close;
         sql.Clear;
         sql.Add('update data0128');
         sql.Add('set bal_amount=bal_amount+data0129.AMOUNT');
         sql.Add('from data0129 inner join data0128');
         sql.Add('on data0129.bank_ptr=data0128.rkey');
         sql.Add('where data0129.rkey='+dm.aq129rkey.AsString);
         ExecSQL;
        end;

        with dm.ADOQuery1 do         //更新发票已付款及，折扣金额
        begin
         close;
         sql.Clear;
         sql.Add('update data0107');
         sql.Add('set AMT_PAID=AMT_PAID-data0130.AMOUNT,');
         sql.Add('CASH_DISC=CASH_DISC-data0130.CASH_DISCOUNT');
         sql.Add('from data0130 inner join data0107');
         sql.Add('on data0130.INVOICE_PTR=data0107.rkey');
         sql.Add('where data0130.CHECK_PTR='+dm.aq129rkey.AsString);
         ExecSQL;
        end;

        with dm.ADOQuery1 do         //更新发票状态
        begin
         close;
         sql.Clear;
         sql.Add('update data0107');
         sql.Add('set STATUS=1');
         sql.Add('from data0130 inner join data0107');
         sql.Add('on data0130.INVOICE_PTR=data0107.rkey');
         sql.Add('where data0130.CHECK_PTR='+dm.aq129rkey.AsString);
         sql.Add('and data0107.status=2');
         ExecSQL;
        end;

        with dm.ADOQuery1 do         //更新借项备忘
        begin
         close;
         sql.Clear;
         sql.Add('update data0132');
         sql.Add('set AVL_AMT=AVL_AMT+data0130.AMOUNT');
         sql.Add('from data0130 inner join data0132');
         sql.Add('on data0130.DEBIT_AP_HEAD_PTR=data0132.rkey');
         sql.Add('where data0130.CHECK_PTR='+dm.aq129rkey.AsString);
         ExecSQL;
        end;

        with dm.ADOQuery1 do         //更新借项备忘
        begin
         close;
         sql.Clear;
         sql.Add('update data0132');
         sql.Add('set memo_status=1');
         sql.Add('from data0130 inner join data0132');
         sql.Add('on data0130.DEBIT_AP_HEAD_PTR=data0132.rkey');
         sql.Add('where data0130.CHECK_PTR='+dm.Aq129RKEY.AsString);
         sql.Add('and data0132.avl_amt>0');
         ExecSQL;
        end;

        with dm.ADOQuery1 do         //更新预付支票状态
        begin
         close;
         sql.Clear;
         sql.Add('update data0129');
         sql.Add('set status=1');
         sql.Add('from data0130 inner join data0132');
         sql.Add('on data0130.DEBIT_AP_HEAD_PTR=data0132.rkey');
         sql.Add('inner join data0129 on');
         sql.Add('data0132.srce_ptr=data0129.rkey');
         sql.Add('where data0130.CHECK_PTR='+dm.ADO129RKEY.AsString);
         sql.Add('and data0132.avl_amt>0');
         ExecSQL;
        end;

        with dm.ADOQuery1 do
        begin
          close;
          sql.Clear;
          sql.Add('delete data0130');
          sql.Add('where data0130.check_ptr='+dm.ado129RKEY.AsString);
          ExecSQL;
        end;

        if not dm.ADO132.IsEmpty then dm.ADO132.Delete;

        if not dm.ado105.isempty then
        begin
         dm.ADO105.Edit;
         dm.ADO105STATUS.Value:=5;
         dm.ado105.post;
        end;

        dm.ACt.CommitTrans;
        showmessage('取消操作成功');
        dm.AQ129.Close;
        dm.AQ129.Open;
        dm.AQ129.Locate('rkey',dm.ADO129RKEY.Value,[]);
        dm.ADO129.Close;
        dm.ADO105.Close;
        dm.ADOQuery1.Close;
      except
        on E: Exception do
        begin
         dm.ACt.RollbackTrans;
         messagedlg(E.Message,mterror,[mbcancel],0);
        end;
      end;
    end
    else
     showmessage('付款票据状态已发生改变不能取消')
  end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.AQ129.IsEmpty then
 begin
  n5.Enabled:=false;
  n6.Enabled:=false;
  n22.Enabled:=false;
 end
else
 begin
  n5.Enabled:=true;
  if (dm.AQ129STATUS.Value=3) or (dm.AQ129STATUS.Value=2) then
   begin
   n6.Enabled:=false;     //取消
   n22.Enabled:=false;    //编辑
   end
  else
   begin
   n6.Enabled:=true;
   n22.Enabled:=true;
   end;
 end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 dm.Aq129.Close;
if not checkbox1.Checked then
 dm.Aq129.Parameters[2].Value:=1
else
 dm.Aq129.Parameters[2].Value:=0;
if not checkbox2.Checked then
 dm.Aq129.Parameters[3].Value:=2
else
 dm.Aq129.Parameters[3].Value:=0;
if not checkbox3.Checked then
 dm.Aq129.Parameters[4].Value:=3
else
 dm.Aq129.Parameters[4].Value:=0;
 DM.Aq129.open;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
form3:=tform3.create(application);
if not form3.aq107.isempty then
 form3.showmodal
else
 showmessage('没有到期应付款的发票');
form3.free;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
form4:=tform4.Create(application);
form4.dtpk1.Date:=self.sys_shortdate;
form4.ComboBox1.ItemIndex:=1;
form4.edit_flag:=0;        //标识新增
form4.Label25.Caption:='付款凭证';
dm.ADOsp04.Close;
dm.ADOsp04.Open;
if dm.ADOsp04SEED_FLAG.Value<>1 then
 form4.Edit9.Text:=dm.ADOsp04SEED_VALUE.Value;

if form4.ShowModal=mrok then
 begin
  dm.AQ129.Close;
  dm.AQ129.Open;
  dm.AQ129.Locate('rkey',dm.ADO129RKEY.Value,[]);
  dm.ado129.close;
  dm.ADO105.Close;
  dm.ADO106.Close;
  dm.ADO132.Close;
 end;
finally
form4.Free;
end;
end;


procedure TForm1.BitBtn2Click(Sender: TObject);
begin
 CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm1.N7Click(Sender: TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;


procedure TForm1.BitBtn9Click(Sender: TObject);
begin
popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.BitBtn8Click(Sender: TObject);
var
 i:byte;
begin
form_condition:=tform_condition.Create(application);
form_condition.dtpk1.Date:=dm.aq129.Parameters.ParamValues['dtpk1'];
form_condition.dtpk2.Date:=dm.aq129.Parameters.ParamValues['dtpk2'];
if form_condition.ShowModal=mrok then
 begin
  dm.aq129.Close;
  dm.aq129.CommandText:=self.command_text;
  for i:=1 to form_condition.SGrid1.RowCount-2 do
   dm.aq129.CommandText:=dm.aq129.CommandText+
   form_condition.SGrid1.Cells[2,i]+#13;
  dm.aq129.Parameters.ParamByName('dtpk1').Value:=form_condition.dtpk1.Date;
  dm.aq129.Parameters.ParamByName('dtpk2').Value:=form_condition.dtpk2.Date;
  dm.aq129.Open;
 end;
form_condition.Free;
end;

procedure TForm1.N22Click(Sender: TObject);
begin
  if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  begin
    messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0);
    exit;
  end;

  dm.ado105.Close;
  dm.ado105.Parameters[0].Value:=dm.AQ129rkey105.Value;
  dm.ado105.Open;
  if (not dm.ADO105.IsEmpty) and (dm.ado105STATUS.Value>0) then
  begin
   messagedlg('发票生成的会计凭证已被审核,无法编辑!',mtinformation,[mbok],0);
   dm.ADO105.Close;
   exit;
  end;

  dm.ADO132.Close;
  dm.ado132.Parameters[0].Value:=dm.AQ129RKEY.Value;
  dm.ado132.open;
  if (not dm.ado132.IsEmpty) and (dm.ado132AMOUNT.Value<>dm.ado132AVL_AMT.Value) then
  begin
   messagedlg('借项备忘已被使用,无法编辑!',mtinformation,[mbok],0);
   exit;
  end;

  if (dm.AQ129TTYPE.Value<>2) and (dm.AQ129TTYPE.Value<>6) then  //不等于预付支票
    try
      form2:=tform2.Create(application);
      with form2 do
      begin
        ComboBox1.ItemIndex:=dm.AQ129TTYPE.Value-1;
        if combobox1.ItemIndex<>4 then
        begin
         label25.Caption:='付款凭证';
         edit2.Text:=dm.AQ129BANK_NAME.Value;
         edit7.Text:=floattostr(dm.AQ129bal_amount.Value+dm.AQ129AMOUNT.Value);
        end
        else
          label25.Caption:='转帐凭证';

       bitbtn2.Enabled:=false;
       bitbtn3.Enabled:=false;
       bitbtn5.Enabled:=false;
       edit1.Text:=dm.AQ129CHECK_NUMBER.Value;
       dtpk1.Date:=dm.AQ129TDATE.Value;
       edit3.Text:=dm.AQ129WAREHOUSE_CODE.Value;
       label9.Caption:=dm.AQ129abbr15name.Value;
       edit4.Text:=dm.AQ129CODE.Value;
       label10.Caption:=dm.AQ129SUPPLIER_NAME.Value;
       edit5.Text:=dm.AQ129CURR_CODE.Value;
       abbr_name.Caption:=dm.AQ129ABBR_NAME.Value;
       label11.Caption:=dm.AQ129CURR_NAME.Value;
       edit6.Text:=dm.AQ129EX_RATE.AsString;
       edit15.Text:=trim(dm.AQ129REMARK.Value);
       edit8.Text:=dm.AQ129AMOUNT.AsString;
       button1.Enabled:=false;
       button2.Enabled:=false;
       button3.Enabled:=false;
       button4.Enabled:=false;
       label20.Visible:=false;
       edit13.Visible:=false;
       edit_FLAG:=1;//代表编辑
      end;
      if form2.ShowModal = mrok then
      begin
        dm.AQ129.Close;
        dm.AQ129.Open;
        dm.AQ129.Locate('rkey',dm.ADO129RKEY.Value,[]);
        dm.ado129.close;
        dm.ADO105.Close;
        dm.ADO106.Close;
        dm.ADO130.Close;
      end;
    finally
      form2.Free;
    end
  else
  try
    form4:=tform4.Create(application);
    with form4 do
    begin
     bitbtn2.Enabled:=false;
     bitbtn3.Enabled:=false;
     bitbtn5.Enabled:=false;
     ComboBox1.ItemIndex:=dm.AQ129TTYPE.Value-1;
     if combobox1.ItemIndex=2 then
      label25.Caption:='付款凭证'
     else
      label25.Caption:='转帐凭证';
     edit1.Text:=dm.AQ129CHECK_NUMBER.Value;
     edit2.Text:=dm.AQ129BANK_NAME.Value;
     if dm.AQ129BANK_NAME.Value<>'' then
     edit7.Text:=floattostr(dm.AQ129bal_amount.Value+dm.AQ129AMOUNT.Value);
     dtpk1.Date:=dm.AQ129TDATE.Value;
     edit3.Text:=dm.AQ129WAREHOUSE_CODE.Value;
     label9.Caption:=dm.AQ129abbr15name.Value;
     edit4.Text:=dm.AQ129CODE.Value;
     label10.Caption:=dm.AQ129SUPPLIER_NAME.Value;
     edit5.Text:=dm.AQ129CURR_CODE.Value;
     label11.Caption:=dm.AQ129CURR_NAME.Value;
     edit6.Text:=dm.AQ129EX_RATE.AsString;
     edit8.Text:=dm.AQ129AMOUNT.AsString;
     edit15.Text:=trim(dm.AQ129REMARK.Value);
     edit_flag:=1;//标识编辑
    end;
    if form4.ShowModal=mrok then
    begin
      dm.AQ129.Close;
      dm.AQ129.Open;
      dm.AQ129.Locate('rkey',dm.ADO129RKEY.Value,[]);
      dm.ado129.close;
      dm.ADO105.Close;
      dm.ADO106.Close;
      dm.ADO132.Close;
    end;
  finally
   form4.Free;
  end;
end;


procedure TForm1.N23Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
form4:=tform4.Create(application);
form4.dtpk1.Date:=self.sys_shortdate;
form4.ComboBox1.ItemIndex:=5;
form4.edit_flag:=0;        //标识新增
form4.Label25.Caption:='转帐凭证';
form4.BitBtn2.Enabled:=false;//现金银行不可选
form4.Caption:='供应商:转帐预付';
dm.ADOsp04.Close;
dm.ADOsp04.Open;
if dm.ADOsp04SEED_FLAG.Value<>1 then
 form4.Edit9.Text:=dm.ADOsp04SEED_VALUE.Value;

if form4.ShowModal=mrok then
 begin
  dm.AQ129.Close;
  dm.AQ129.Open;
  dm.AQ129.Locate('rkey',dm.ADO129RKEY.Value,[]);
  dm.ado129.close;
  dm.ADO105.Close;
  dm.ADO106.Close;
  dm.ADO132.Close;
 end;
finally
form4.Free;
end;
end;

end.
