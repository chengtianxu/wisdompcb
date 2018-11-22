unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Menus,
   ComObj,Excel2000,ClipBrd, DB, ADODB,DateUtils;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    PopupMenu2: TPopupMenu;
    Memo1: TMemo;
    empl_name: TLabel;
    curr_code: TLabel;
    BitBtn6: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure CheckBox1Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
   field_name:string;
   FsSql:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
   procedure item_click(sender :TObject);
  public
    { Public declarations }
    sys_shortdate,sys_longdate:tdatetime;
   function find_accterror(rkey103: integer): boolean;
   function get_gltp(rkey103: string): integer;
   function get_glcurr_ptr(rkey103: string): integer;
   function get_vouchernumber(inv_date: tdatetime): string;
   function RemoveInvalid(where: string): string;
   function vo_number(number: string): boolean;
   procedure CopyDbDataToExcel(Args:array of const);
  end;

var
  Form1: TForm1;

implementation

uses datamd,  debit_bysupp, invt_recept, debit_returen, term,common;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
if not app_init(dm.ACt) then
 begin
  showmsg('程序起动失败,请与管理员联系!',1);
  application.Terminate;
 end;
 self.Caption:= application.Title;


//vprev:='4';
//user_ptr:='3';

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

function TForm1.RemoveInvalid(where: string): string;
 var
  tstr: string;
begin
  tstr:=where;
  while pos(',', tstr)>0 do
    tstr:=copy(tstr,1,pos(',',tstr)-1) +
       copy(tstr,pos(',',tstr)+1,length(tstr)-pos(',',tstr));
  Result:=tstr;
end;

function TForm1.get_vouchernumber(inv_date: tdatetime): string;
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

procedure tform1.item_click(sender:TObject);
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
Form_invtship.Free;
application.Terminate;
end;


procedure TForm1.FormShow(Sender: TObject);
var
 i:byte;
 item:TMenuItem;
begin
if dm.act.Connected then
 begin

  field_name:='MEMO_NUMBER';     //设备过滤字段
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
    active:=false;
    sql.Clear;
    sql.Add('select getdate() as v_dt');
    active:=true;
    sys_longdate := fieldvalues['v_dt']; //长格式
    sys_shortdate:=strtodate(datetostr(fieldvalues['v_dt']));
   end;
  FsSql:=dm.Aq132.CommandText;
  dm.Aq132.Close;
  dm.Aq132.Parameters.ParamValues['dtpk1']:=sys_shortdate-dayof(sys_shortdate)+1;
  dm.Aq132.Parameters.ParamValues['dtpk2']:=sys_shortdate;
  dm.aq132.Prepared;
  dm.Aq132.Open;

  for i:=1 to dbgrid1.FieldCount do
  begin
   item:=TmenuItem.Create(self);
   item.Caption:=dbgrid1.Columns[i-1].Title.Caption;
   if dbgrid1.Columns[i-1].Visible then
    item.Checked:=true;
   item.OnClick:=item_click;
   self.PopupMenu2.Items.Add(item);
  end;
  Form_invtship:=TForm_invtship.create(application);
 end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(edit1.Text)<>'' then
  dm.aq132.Filter:=self.field_name+' like ''%'+trim(edit1.Text)+'%'''
 else
  dm.aq132.Filter:='';
  
 dm.aq132.AfterOpen(dm.aq132); 
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.Aq132.CommandText);
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
IF column.FieldName<>dm.aq132.IndexFieldNames then
 dm.aq132.IndexFieldNames:=column.FieldName;

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

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
 dm.aq132.Close;
if not checkbox1.Checked then
 dm.aq132.Parameters.ParamValues['v3']:=3
else
 dm.aq132.Parameters.ParamValues['v3']:=0;

if not checkbox2.Checked then
 dm.aq132.Parameters.ParamValues['v4']:=4
else
 dm.aq132.Parameters.ParamValues['v4']:=0;

if not checkbox3.Checked then
 dm.aq132.Parameters.ParamValues['v2']:=2
else
 dm.aq132.Parameters.ParamValues['v2']:=0;
 DM.aq132.open;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
try
  form2:=tform2.Create(application);
  with form2 do
   begin
    dtpk1.Date:=self.sys_shortdate;
    dtpk2.Date:=self.sys_shortdate;
    combobox1.ItemIndex:=0;
    bitbtn2.Enabled:=false;
    edit6.Enabled:=true;
   end;
  if form2.ShowModal=mrok then
   begin
    dm.aq132.Close;
    dm.aq132.Open;
    dm.aq132.Locate('rkey',dm.ADO132RKEY.Value,[]);
    dm.ADO132.Close;
    dm.ADO105.Close;
    dm.ADO106.Close;
   end;
finally
 form2.Free;
end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
 try
  form4:=tform4.Create(application);
  with form4 do
   begin
    dtpk1.Date:=self.sys_shortdate;
    dtpk2.Date:=self.sys_shortdate;
   end;

  if form4.ShowModal=mrok then
   begin
    dm.aq132.Close;
    dm.aq132.Open;
    dm.aq132.Locate('rkey',dm.ADO132RKEY.Value,[]);
    dm.ADO132.Close;
    dm.ADO105.Close;
    dm.ADO106.Close;
   end;
 finally
  form4.Free;
 end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
 end;

if dm.aq132MEMO_TP.Value=4 then
 begin
  messagedlg('对不起!预付备忘请在付款程序中处理!',mtinformation,[mbok],0);
  exit;
 end;

if dm.aq132.FieldByName('GLPTR_STATUS').AsBoolean then
 begin
  messagedlg('对不起!借项备忘已开票不能编辑!',mtinformation,[mbok],0);
  exit;
 end;

 dm.ADO132.Close;
 dm.ADO132.Parameters[0].Value:=dm.aq132rkey.Value;
 dm.ADO132.Open;
 if (dm.ADO132AMOUNT.Value<>dm.ADO132AVL_AMT.Value) or
    (dm.ADO132memo_status.Value <> dm.aq132memo_status.Value) then
 begin
  messagedlg('借项备忘被使用不能编辑!',mtinformation,[mbok],0);
  dm.ADO132.Close;
  exit;
 end;

if dm.aq132MEMO_TP.Value=3 then  //退货备忘
 begin
  dm.ado105.Close;
  dm.ado105.Parameters[0].Value:=dm.AQ132rkey105.Value;
  dm.ado105.Open;
  if (not dm.ADO105.IsEmpty) and
    (dm.ado105STATUS.Value>0) then
  begin
   messagedlg('备忘生成的会计凭证已被审核,无法编辑!',mtinformation,[mbok],0);
   dm.ADO105.Close;
   exit;
  end;

  form4:=tform4.Create(application);
  with form4 do
   begin
    a_or_e.Caption:='1';      //标识编辑
    button1.Enabled:=false;
    bitbtn2.Enabled:=false;
    bitbtn3.Enabled:=false;
    bitbtn5.Enabled:=false;
    edit1.Text:=dm.aq132MEMO_NUMBER.Value;
    dtpk1.Date:=dm.aq132MEMO_DATE.Value;
    dtpk2.Date:=dm.aq132ENT_DATE.Value;
    edit4.Text:=dm.aq132CODE.Value;
    label10.Caption:=dm.aq132supplier_name.Value;
    supp_ptr:=dm.aq132SUPP_PTR.Value;
    edit5.Text:=dm.aq132CURR_CODE.Value;
    label11.Caption:=dm.aq132CURR_NAME.Value;
    curr_ptr:=dm.aq132CURRENCY_PTR.Value;
    edit6.Text:=dm.aq132EX_RATE.AsString;
    edit15.Text:=dm.aq132REF_NUMBER.Value;
    edit8.Text:=dm.aq132AMOUNT.AsString;
    edit2.Text:=dm.aq132MISC_TOT.AsString;
    edit3.Text:=dm.aq132MATL_TOT.AsString;
    edit7.Text:=dm.aq132FED_TAX.AsString;
    edit9.Text:=floattostr(dm.aq132AMOUNT.Value-dm.aq132AVL_AMT.Value);
    accsupp_gl_ptr:=dm.aq132ACC_PAYABLE_PTR.Value;

    Edit10.Tag:=dm.aq132warehouse_PTR.Value;
    Edit10.Text:=dm.aq132warehouse_code.Value;
    Label15.Caption:=dm.aq132abbr_name_1.Value;

    if curr_ptr=1 then
     edit6.Enabled:=false
    else
     edit6.Enabled:=true;
   end;
  if form4.ShowModal=mrok then
   begin
    dm.aq132.Close;
    dm.aq132.Open;
    dm.aq132.Locate('rkey',dm.ADO132RKEY.Value,[]);
    dm.ADO132.Close;
    dm.ADO105.Close;
    dm.ADO106.Close;
   end;
  form4.Free;
 end
else
 begin

 dm.ado105.Close;
 dm.ado105.Parameters[0].Value:=dm.AQ132rkey105.Value;
 dm.ado105.Open;
 if (not dm.ADO105.IsEmpty) and
    (dm.ado105STATUS.Value>0) then
  begin
   messagedlg('备忘生成的会计凭证已被审核,无法编辑!',mtinformation,[mbok],0);
   dm.ADO105.Close;
   exit;
  end;
   
  form2:=tform2.Create(application);
  with form2 do
  begin
   a_or_e.Caption:='1';       //标识编辑
   edit1.Text:=dm.aq132MEMO_NUMBER.Value;
   dtpk1.Date:=dm.aq132MEMO_DATE.Value;
   dtpk2.Date:=dm.aq132ENT_DATE.Value;
   edit4.Text:=dm.aq132CODE.Value;
   label10.Caption:=dm.aq132supplier_name.value;
   edit5.Text:=dm.aq132CURR_CODE.Value;
   label11.Caption:=dm.aq132CURR_NAME.Value;
   edit6.Text:=dm.aq132EX_RATE.AsString;
   edit8.Text:=dm.aq132AMOUNT.AsString;
   edit9.Text:=dm.aq132MATL_TOT.AsString;        //货款净值
   edit10.Text:=dm.aq132FED_TAX.AsString;        //税金
   edit7.Text:=dm.aq132MISC_TOT.AsString;        //杂项费用
   edit3.Text:=floattostr(dm.aq132AMOUNT.Value-dm.aq132AVL_AMT.Value);
   edit15.Text:=dm.aq132REF_NUMBER.Value;

    Edit11.Tag:=dm.aq132warehouse_PTR.Value;
    Edit11.Text:=dm.aq132warehouse_code.Value;
    Label18.Caption:=dm.aq132abbr_name_1.Value;

   if dm.aq132MEMO_TP.Value=4 then//预付备忘
    begin
     combobox1.ItemIndex:=2;
     edit8.ReadOnly:=true;
     bitbtn3.Enabled:=false;
     bitbtn5.Enabled:=false;
     if dm.aq132AVL_AMT.Value<>dm.aq132AMOUNT.Value then
      bitbtn2.Enabled:=false;    //备忘一但被使用就不能修改了
    end
   else                          //扣款备忘
    begin
     combobox1.ItemIndex:=0;
     bitbtn2.Enabled:=false;
    end;
  end;
 if form2.ShowModal=mrok then
  begin
   dm.aq132.Close;
   dm.aq132.Open;
   dm.aq132.Locate('rkey',dm.ADO132RKEY.Value,[]);
   dm.ADO132.Close;
   dm.ADO105.Close;
   dm.ADO106.Close;
  end;
 form2.Free;
end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
if dm.aq132MEMO_TP.Value=3 then//退货备忘
 begin
  form4:=tform4.Create(application);
  with form4 do
   begin
    a_or_e.Caption:='2'; //标识检查
    edit1.Text:=dm.aq132MEMO_NUMBER.Value;
    dtpk1.Date:=dm.aq132MEMO_DATE.Value;
    dtpk2.Date:=dm.aq132ENT_DATE.Value;
    edit4.Text:=dm.aq132CODE.Value;
    label10.Caption:=dm.aq132supplier_name.Value;
    supp_ptr:=dm.aq132SUPP_PTR.Value;
    edit5.Text:=dm.aq132CURR_CODE.Value;
    label11.Caption:=dm.aq132CURR_NAME.Value;
    curr_ptr:=dm.aq132CURRENCY_PTR.Value;
    edit6.Text:=dm.aq132EX_RATE.AsString;
    edit15.Text:=dm.aq132REF_NUMBER.Value;
    edit8.Text:=dm.aq132AMOUNT.AsString;
    edit2.Text:=dm.aq132MISC_TOT.AsString;
    edit3.Text:=dm.aq132MATL_TOT.AsString;
    edit7.Text:=dm.aq132FED_TAX.AsString;
    edit9.Text:=floattostr(dm.aq132AMOUNT.Value-dm.aq132AVL_AMT.Value);

    Edit10.Tag:=dm.aq132warehouse_PTR.Value;
    Edit10.Text:=dm.aq132warehouse_code.Value;
    Label15.Caption:=dm.aq132abbr_name_1.Value;

    stgd1.PopupMenu:=nil;
    edit2.Enabled:=false;
    edit1.Enabled:=false;
    dtpk1.Enabled:=false;
    dtpk2.Enabled:=false;
    edit15.Enabled:=false;
    bitbtn1.Enabled:=false;
    ToolBar1.Enabled:=false;
    sgrid1.Enabled:=false;
    Edit_date.ReadOnly:=true;
    UpDown1.Enabled:=false;
    button1.Enabled:=false;
    bitbtn2.Enabled:=false;
    bitbtn3.Enabled:=false;
    bitbtn5.Enabled:=false;
    edit6.Enabled:=false;
   end;
  if form4.ShowModal=mrok then
   begin

   end;
  form4.Free;
 end
else
 begin
  form2:=tform2.Create(application);
  with form2 do
  begin
   a_or_e.Caption:='2';   //标识检查
   edit1.Text:=dm.aq132MEMO_NUMBER.Value;
   dtpk1.Date:=dm.aq132MEMO_DATE.Value;
   dtpk2.Date:=dm.aq132ENT_DATE.Value;
   edit4.Text:=dm.aq132CODE.Value;
   label10.Caption:=dm.aq132supplier_name.value;
   edit5.Text:=dm.aq132CURR_CODE.Value;
   label11.Caption:=dm.aq132CURR_NAME.Value;
   edit6.Text:=dm.aq132EX_RATE.AsString;
   edit8.Text:=dm.aq132AMOUNT.AsString;
   edit9.Text:=dm.aq132MATL_TOT.AsString;        //货款净值
   edit10.Text:=dm.aq132FED_TAX.AsString;        //税金
   edit7.Text:=dm.aq132MISC_TOT.AsString;        //杂项费用
   edit3.Text:=floattostr(dm.aq132AMOUNT.Value-dm.aq132AVL_AMT.Value);

    Edit11.Tag:=dm.aq132warehouse_PTR.Value;
    Edit11.Text:=dm.aq132warehouse_code.Value;
    Label18.Caption:=dm.aq132abbr_name_1.Value;

   edit15.Text:=dm.aq132REF_NUMBER.Value;
   if dm.aq132MEMO_TP.Value=4 then//预付备忘
    combobox1.ItemIndex:=2
   else                          //扣款备忘
    combobox1.ItemIndex:=0;

   bitbtn3.Enabled:=false;
   bitbtn5.Enabled:=false;
   bitbtn6.Enabled:=false;
   bitbtn2.Enabled:=false;
   edit8.ReadOnly:=true;
   bitbtn1.Enabled:=false;
   edit1.Enabled:=false;
   dtpk1.Enabled:=false;
   dtpk2.Enabled:=false;
   edit15.Enabled:=false;
    ToolBar1.Enabled:=false;
    sgrid1.Enabled:=false;
    Edit_date.ReadOnly:=true;
    UpDown1.Enabled:=false;
   edit9.Enabled:=false;
   edit10.Enabled:=false;
   edit7.Enabled:=false;
   edit6.Enabled:=false;
  end;
 if form2.ShowModal=mrok then
  begin

  end;
form2.Free;
 end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
if messagedlg('你确定要取消这条记录吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 begin

if dm.aq132MEMO_TP.Value=4 then
 begin
  messagedlg('对不起!预付备忘请在付款程序中处理!',mtinformation,[mbok],0);
  exit;
 end;

 if strtoint(user_ptr)<>dm.aq132empl_ptr.Value then
 begin
  messagedlg('对不起!取消操作只人输入人员才可以进行!',mtinformation,[mbok],0);
  exit;
 end;

 dm.ado105.Close;
 dm.ado105.Parameters[0].Value:=dm.AQ132rkey105.Value;
 dm.ado105.Open;
 if (not dm.ADO105.IsEmpty) and
    (dm.ado105STATUS.Value>0) then
  begin
   messagedlg('备忘生成的会计凭证已被审核,无法删除!',mtinformation,[mbok],0);
   dm.ADO105.Close;
   exit;
  end;

  dm.ADO132.Close;
  dm.ADO132.Parameters[0].Value := dm.aq132rkey.Value;
  dm.ADO132.Open;

 if (dm.ADO132AMOUNT.Value=dm.ADO132AVL_AMT.Value) and
    (dm.aq132memo_status.Value=dm.ADO132memo_status.Value) then
  begin
  dm.ACt.BeginTrans;
  try
  if dm.aq132MEMO_TP.Value=3 then//退货备忘
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('update data0210');
    sql.Add('set DEBIT_MEMO_PTR=null');
    sql.Add('where DEBIT_MEMO_PTR='+dm.Aq132RKEY.AsString);
    ExecSQL
   end;

   if not dm.ado105.isempty then
   begin
    dm.ADO105.edit;
    dm.ADO105STATUS.Value:=5;
    dm.ado105.post;
   end;

   dm.ADO132.Edit;
   dm.ADO132memo_status.Value:=3;
   dm.ADO132AVL_AMT.Value:=0;
   dm.ADO132.Post;

   dm.ACt.CommitTrans;
   showmessage('数据取消操作成功!');
   dm.Aq132.Close;
   dm.Aq132.Open;
   dm.aq132.Locate('rkey',dm.ADO132RKEY.Value,[]);
  except
   dm.ACt.RollbackTrans;
   showmessage('数据取消遇到错误请速与管理员联系!');
  end;
  end
  else
   showmessage('不能取消该记录,借项备忘数据被使用了');
 end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.aq132.IsEmpty then
 begin
  n2.Enabled:=false;
  n3.Enabled:=false;
  n4.Enabled:=false;
 end
else
 begin
  n3.Enabled:=true;

  if dm.aq132memo_status.Value=1 then
   begin
    n2.Enabled:=true;
    n4.Enabled:=true;
   end
  else
   begin
    n2.Enabled:=false;
    n4.Enabled:=false;
   end;

 end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
 i:byte;
begin
form_condition:=tform_condition.Create(application);
form_condition.dtpk1.Date:=dm.Aq132.Parameters.ParamValues['dtpk1'];
form_condition.dtpk2.Date:=dm.Aq132.Parameters.ParamValues['dtpk2'];
if form_condition.ShowModal=mrok then
 begin
  dm.aq132.Close;
  dm.aq132.CommandText:=self.Memo1.Lines.Text;//FsSql;   //

  if form_condition.RadioGroup1.ItemIndex=0 then
   dm.aq132.CommandText:=dm.aq132.CommandText+
   'and data0132.memo_date>=:dtpk1'+#13+
   'and data0132.memo_date<=:dtpk2'+#13
  else
   dm.aq132.CommandText:=dm.aq132.CommandText+
   ' and data0132.ent_date>=:dtpk1'+#13+
   ' and data0132.ent_date<=:dtpk2'+#13;

  for i:=1 to form_condition.SGrid1.RowCount-2 do
   dm.aq132.CommandText:=dm.aq132.CommandText+
   form_condition.SGrid1.Cells[2,i]+#13;

  dm.aq132.Parameters.ParamByName('dtpk1').Value:=form_condition.dtpk1.Date;
  dm.aq132.Parameters.ParamByName('dtpk2').Value:=form_condition.dtpk2.Date;
  dm.aq132.Prepared;
  dm.aq132.Open;
 end;
form_condition.Free;
end;


procedure TForm1.BitBtn3Click(Sender: TObject);
var
 rkey132:integer;
begin
 rkey132:=dm.Aq132RKEY.Value;
 dm.aq132.Close;
 dm.Aq132.Open;
 if rkey132>0 then dm.Aq132.Locate('rkey',rkey132,[]);
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
 popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
 CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin

Form_invtship.show;

end;

end.
