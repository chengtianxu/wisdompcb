unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, ToolWin, ComCtrls,
  DateUtils, Menus,Excel2000,ClipBrd, ComObj,DB, ADODB;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    DBGrid1: TDBGrid;
    user_ptr: TLabel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
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
    empl_name: TLabel;
    curr_code: TLabel;
    N3: TMenuItem;
    N8: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Memo1: TMemo;
    PopupMenu3: TPopupMenu;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure N29Click(Sender: TObject);

  private
    { Private declarations }
   aqd116_sql:string;
   field_name:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
   sys_sortdate:tdatetime;
   procedure CopyDbDataToExcel(Args:array of const);
  end;

var
  Form1: TForm1;

implementation

uses DAMO, term, untread_memo, noreturen_memo, rma_search,common,Frm_QrySum_u,edit_memo;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 if not app_init_2(dm.ADOConnection1) then
 begin
  showmsg('程序起动失败,请与管理员联系!',1);
  application.Terminate;
  exit;
 end;
  self.Caption:= application.Title;


//  vprev:='4';
//  rkey73:='785';
//  dm.ADOConnection1.Open;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
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

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
n17.Enabled:=true;
n18.Enabled:=true;
n19.Enabled:=true;
case dm.aqd116memo_status.Value of
 1:
 begin

 end;
 2:
 begin
  n17.Enabled:=false;
  n19.Enabled:=false;
 end;
 3:
 begin
  n17.Enabled:=false;
  n19.Enabled:=false;
 end
else
 begin
  n17.Enabled:=false;
  n18.Enabled:=false;
  n19.Enabled:=false;
 end;
end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if  dm.ADOConnection1.Connected then
 begin

  field_name:='MEMO_NUMBER';
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select data0073.employee_ptr,data0005.employee_name');
    sql.Add('from data0073 inner join data0005');
    sql.Add('on data0073.employee_ptr=data0005.rkey');
    sql.Add('where data0073.rkey='+rkey73);
    open;
    user_ptr.Caption:=fieldbyname('employee_ptr').AsString;
    empl_name.Caption:=fieldbyname('employee_name').AsString;
   end;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select getdate() as sys_date');
    open;
    sys_sortdate:=strtodate(datetostr(fieldvalues['sys_date']));
   end;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select curr_code from data0001 where rkey=1');
    open;
    self.curr_code.Caption:=fieldvalues['curr_code'];
   end;
  with dm.adoquery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select fin_control1 from data0192');
   open;
   dm.fincontrol1 := fieldbyname('fin_control1').AsString;
  end;
  dm.AqD116.Close;
  dm.AqD116.Parameters.ParamByName('dtpk1').Value:=self.sys_sortdate-dayof(self.sys_sortdate)+1;
  dm.AqD116.Parameters.ParamByName('dtpk2').Value:=self.sys_sortdate;
  dm.aqd116.Prepared;
  dm.AqD116.Open;
  aqd116_sql:=dm.AqD116.CommandText;

 end;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.AqD116.CommandText);
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.N1Click(Sender: TObject);
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

procedure TForm1.BitBtn2Click(Sender: TObject);
var
 rkey116:integer;
begin
rkey116:=dm.AqD116RKEY.Value;
dm.AqD116.Close;
dm.AqD116.Open;
if rkey116>0 then dm.AqD116.Locate('rkey',rkey116,[]);
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

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.FieldName<>dm.AqD116.IndexFieldNames) then
 dm.AqD116.IndexFieldNames:=column.FieldName;

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

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  dm.AqD116.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  dm.AqD116.filter := '';
dm.aqd116.AfterOpen(dm.aqd116);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
popupmenu3.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.N19Click(Sender: TObject);
var
 VOUCHER:string;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0);
  exit;
 end;

if strtoint(self.user_ptr.Caption)<>dm.aqd116EMPL_PTR.Value then
 begin
  messagedlg('对不起!取消操作只人输入人员才可以进行!',mtinformation,[mbok],0);
  exit;
 end;
 
if dm.aqd116memo_tp.Value=1 then
 begin
  messagedlg('对不起!预收备忘请在收款程序中处理!',mtinformation,[mbok],0);
  exit;
 end;

 dm.ado105.Close;
 dm.ado105.Parameters[0].Value:=dm.Aqd116rkey.Value;
 dm.ado105.Open;
 if dm.ado105STATUS.Value>0 then
  begin
   messagedlg('发票生成的会计凭证已被审核,无法取消!',mtinformation,[mbok],0);
   dm.ADO105.Close;
   exit;
  end;

 dm.ado116.Close;
 dm.ado116.Parameters[0].Value:=dm.aqd116rkey.Value;
 dm.ado116.Open;

 VOUCHER:=dm.return_VOUCHER(dm.aqd116rkey.Value);
 if VOUCHER <> '' then
  begin
   messagedlg('贷项备忘已被销售开票生成总帐,不能作废!'+VOUCHER,mtinformation,[mbcancel],0);
   dm.ado116.Close;
   exit;
  end;

 if dm.ado116AMOUNT.Value<>dm.ado116AVL_AMT.Value then
  begin
   messagedlg('贷项备忘已被使用,不能取消!',mtinformation,[mbok],0);
   dm.ado116.Close;
   exit;
  end;

if messagedlg('请确认是否要取消该贷项备忘?',mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
  dm.ADOConnection1.BeginTrans;
  try
  if dm.ado116MEMO_TP.Value=4 then
   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0098');
     sql.Add('set RMA_STATUS=3,');
     sql.Add('srce_ptr=null');
     sql.Add('where srce_ptr='+dm.ado116RKEY.AsString);
     ExecSQL;
    end;

   if not dm.ado105.isempty then
    begin
     dm.ADO105.Edit;
     dm.ADO105STATUS.Value:=5;
     dm.ado105.post;
    end;
    
   DM.ado116.Edit;
   dm.ado116memo_status.Value:=3;
   dm.ado116AVL_AMT.Value:=0;
   dm.ado116.post;

    dm.ADOConnection1.CommitTrans;
    messagedlg('取消操作成功!',mtinformation,[mbok],0);
    dm.aqd116.Close;
    dm.aqd116.Open;
    dm.aqd116.Locate('rkey',dm.ado116RKEY.Value,[]);
    dm.ado116.Close;
    dm.ADO105.Close;
   except
    on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
   end;
 end;
end;

procedure TForm1.N21Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0)
else
try
form2:=tform2.Create(application);
 dm.ado116.Close;
 dm.ado116.Parameters[0].Value:=null;
 dm.ado116.Open;
 dm.ado116.Append;
 dm.ado116MEMO_TP.Value:=4;//退货备忘
 dm.ado116EMPL_PTR.Value:=strtoint(user_ptr.Caption);
 dm.ado116MEMO_DATE.Value:=self.sys_sortdate;
 dm.ado116RMA_DATE.Value:=self.sys_sortdate;
 dm.ADO04.Close;
 dm.ADO04.Open;
 if dm.ADO04SEED_FLAG.Value<>1 then
  form2.Edit4.Text:=dm.ADO04SEED_VALUE.Value;

if form2.ShowModal=mrok then
 begin
  dm.AqD116.Close;
  dm.AqD116.Open;
  dm.AqD116.Locate('rkey',dm.ADO116RKEY.Value,[]);
  dm.ADO116.Close;
  dm.ADO105.Close;
  dm.ADO106.Close;
 end
else
 begin
  dm.ado116.Close;
 end;
finally
form2.Free;
end;
end;


procedure TForm1.N17Click(Sender: TObject);
var
 VOUCHER:string;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0);
  exit;
 end;

if dm.aqd116memo_tp.Value=1 then
 begin
  messagedlg('对不起!预收备忘请在收款程序中处理!',mtinformation,[mbok],0);
  exit;
 end;

 dm.ado105.Close;
 dm.ado105.Parameters[0].Value:=dm.Aqd116rkey.Value;
 dm.ado105.Open;
 if dm.ado105STATUS.Value>0 then
  begin
   messagedlg('发票生成的会计凭证已被审核,无法编辑!',mtinformation,[mbok],0);
   dm.ADO105.Close;
   exit;
  end;

 dm.ado116.Close;
 dm.ado116.Parameters[0].Value:=dm.aqd116rkey.Value;
 dm.ado116.Open;

 VOUCHER:=dm.return_VOUCHER(dm.aqd116rkey.Value);
 if VOUCHER <> '' then
  begin
   messagedlg('贷项备忘已被销售开票生成总帐或者发出商品截数,不能编辑!'+VOUCHER,mtinformation,[mbcancel],0);
   dm.ado116.Close;
   exit;
  end;

 if dm.ado116AMOUNT.Value<>dm.ado116AVL_AMT.Value then
  begin
   messagedlg('贷项备忘已被使用,不能编辑!',mtinformation,[mbcancel],0);
   dm.ado116.Close;
   exit;
  end;
if dm.aqd116memo_tp.Value=4 then   //退货备忘
try
 form2:=tform2.Create(application);
 dm.ado116.edit;
 with form2 do
  begin
   edit4.Text:=dm.ado116MEMO_NUMBER.Value;
   edit1.Text:=dm.aqd116CUST_CODE.Value;
   label14.Caption:=dm.aqd116CUSTOMER_NAME.Value;
   abbr_name.Caption:=dm.aqd116ABBR_NAME.Value;
   edit2.Text:=dm.aqd116CURR_CODE.Value;
   label15.Caption:=dm.aqd116CURR_NAME.Value;
   edit5.Text:=dm.aqd116EX_RATE.AsString;
   edit3.Text:=dm.ado116GOODS_AMT.AsString;
   edit6.Text:=dm.ado116TOOLING_CHARGE.AsString;
   edit7.Text:=dm.ado116SHIPPING.AsString;
   edit8.Text:=dm.ado116FED_TAX.AsString;
   edit9.Text:=dm.ado116AMOUNT.AsString;
   bitbtn4.Enabled:=false;
   bitbtn5.Enabled:=false;
   button1.Enabled:=false;
   ComboBox1.Enabled:=False;
  end;
if form2.ShowModal=mrok then
 begin
  dm.AqD116.Close;
  dm.AqD116.Open;
  dm.AqD116.Locate('rkey',dm.ADO116RKEY.Value,[]);
  dm.ADO116.Close;
  dm.ADO105.Close;
  dm.ADO106.Close;
 end
else
 dm.ado116.Close;
finally
form2.Free;
end
else  //无退货
try
 form3:=tform3.Create(application);
 dm.ado116.edit;
 with form3 do
  begin
   edit4.Text:=dm.ado116MEMO_NUMBER.Value;
   edit1.Text:=dm.aqd116CUST_CODE.Value;
   label14.Caption:=dm.aqd116CUSTOMER_NAME.Value;
   abbr_name.Caption:=dm.aqd116ABBR_NAME.Value;
   edit2.Text:=dm.aqd116CURR_CODE.Value;
   label15.Caption:=dm.aqd116CURR_NAME.Value;
   edit5.Text:=dm.aqd116EX_RATE.AsString;
   edit3.Text:=dm.ado116GOODS_AMT.AsString;
   edit6.Text:=dm.ado116TOOLING_CHARGE.AsString;
   edit7.Text:=dm.ado116SHIPPING.AsString;
   edit8.Text:=dm.ado116FED_TAX.AsString;
   edit9.Text:=dm.ado116AMOUNT.AsString;
   cust_ptr:=dm.ado116CUST_PTR.Value;
   edit10.Text:=dm.aqd116warehouse_code.Value;
   label17.Caption:=dm.aqd116abbrname15.Value;
  end;
if form3.ShowModal=mrok then
 begin
  dm.AqD116.Close;
  dm.AqD116.Open;
  dm.AqD116.Locate('rkey',dm.ADO116RKEY.Value,[]);
  dm.ADO116.Close;
  dm.ADO105.Close;
  dm.ADO106.Close;
 end
else
 begin
  dm.ado116.Close;
 end;
finally
form3.Free;
end;
end;

procedure TForm1.N22Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0)
else
try
 form3:=tform3.Create(application);
 dm.ado116.Close;
 dm.ado116.Parameters[0].Value:=null;
 dm.ado116.Open;
 dm.ado116.Append;
 dm.ado116MEMO_TP.Value:=3;//退货备忘
 dm.ado116EMPL_PTR.Value:=strtoint(user_ptr.Caption);
 dm.ado116MEMO_DATE.Value:=self.sys_sortdate;
 dm.ado116RMA_DATE.Value:=self.sys_sortdate;
 dm.ADO04.Close;
 dm.ADO04.Open;
 if dm.ADO04SEED_FLAG.Value<>1 then
  form3.Edit4.Text:=dm.ADO04SEED_VALUE.Value;
 form3.cust_ptr:=dm.ado116CUST_PTR.Value;
if form3.ShowModal=mrok then
 begin
  dm.AqD116.Close;
  dm.AqD116.Open;
  dm.AqD116.Locate('rkey',dm.ADO116RKEY.Value,[]);
  dm.ADO116.Close;
  dm.ADO105.Close;
  dm.ADO106.Close;
 end
else
 begin
  dm.ado116.Close;
 end;
finally
form3.Free;
end;
end;

procedure TForm1.N18Click(Sender: TObject);
begin
if dm.aqd116memo_tp.Value=4 then   //退货备忘
try
form2:=tform2.Create(application);
 dm.ado116.Close;
 dm.ado116.Parameters[0].Value:=dm.aqd116rkey.Value;
 dm.ado116.Open;

 with form2 do
  begin
   edit4.Text:=dm.ado116MEMO_NUMBER.Value;
   edit1.Text:=dm.aqd116CUST_CODE.Value;
   label14.Caption:=dm.aqd116CUSTOMER_NAME.Value;
   abbr_name.Caption:=dm.aqd116ABBR_NAME.Value;
   edit2.Text:=dm.aqd116CURR_CODE.Value;
   label15.Caption:=dm.aqd116CURR_NAME.Value;
   edit5.Text:=dm.aqd116EX_RATE.AsString;
   edit3.Text:=dm.ado116GOODS_AMT.AsString;
   edit6.Text:=dm.ado116TOOLING_CHARGE.AsString;
   edit7.Text:=dm.ado116SHIPPING.AsString;
   edit8.Text:=dm.ado116FED_TAX.AsString;
   edit9.Text:=dm.ado116AMOUNT.AsString;
   bitbtn4.Enabled:=false;
   bitbtn5.Enabled:=false;
   button1.Enabled:=false;
   ComboBox1.Enabled:=False;
   bitbtn2.enabled:=false;
   edit4.Enabled:=false;
   stringgrid1.PopupMenu:=nil;
   dbedit1.ReadOnly:=true;
   dbedit2.ReadOnly:=true;
   dbedit3.Enabled:=false;
   dbedit4.Enabled:=false;
   toolbar1.Enabled:=false;
   sgrid1.Enabled:=false;
   edit12.ReadOnly:=true;
   updown1.Enabled:=false;
   edit3.Enabled:=false;
   edit5.Enabled:=false;
   edit6.Enabled:=false;
   edit7.Enabled:=false;
   edit8.Enabled:=false;
  end;

if form2.ShowModal=mrok then
 begin
  dm.AqD116.Close;
  dm.AqD116.Open;
  dm.AqD116.Locate('rkey',dm.ADO116RKEY.Value,[]);
  dm.ADO116.Close;
  dm.ADO105.Close;
  dm.ADO106.Close;
 end
else
 begin
  dm.ado116.Close;
 end;
finally
 form2.Free;
end
else     //无退货及预收备忘
try
 form3:=tform3.Create(application);
 dm.ado116.Close;
 dm.ado116.Parameters[0].Value:=dm.aqd116rkey.Value;
 dm.ado116.Open;

 with form3 do
  begin
   edit4.Text:=dm.ado116MEMO_NUMBER.Value;
   edit1.Text:=dm.aqd116CUST_CODE.Value;
   label14.Caption:=dm.aqd116CUSTOMER_NAME.Value;
   abbr_name.Caption:=dm.aqd116ABBR_NAME.Value;
   edit2.Text:=dm.aqd116CURR_CODE.Value;
   label15.Caption:=dm.aqd116CURR_NAME.Value;
   edit5.Text:=dm.aqd116EX_RATE.AsString;
   edit3.Text:=dm.ado116GOODS_AMT.AsString;
   edit6.Text:=dm.ado116TOOLING_CHARGE.AsString;
   edit7.Text:=dm.ado116SHIPPING.AsString;
   edit8.Text:=dm.ado116FED_TAX.AsString;
   edit9.Text:=dm.ado116AMOUNT.AsString;
   cust_ptr:=dm.ado116CUST_PTR.Value;
   edit10.Text:=dm.aqd116warehouse_code.Value;
   label17.Caption:=dm.aqd116abbrname15.Value;   
   bitbtn4.Enabled:=false;
   bitbtn5.Enabled:=false;
   bitbtn2.enabled:=false;
   BitBtn1.Enabled:=false;
   edit4.Enabled:=false;
   dbedit1.ReadOnly:=true;
   dbedit2.ReadOnly:=true;
   dbedit3.Enabled:=false;
   dbedit4.Enabled:=false;
   toolbar1.Enabled:=false;
   sgrid1.Enabled:=false;
   edit12.ReadOnly:=true;
   updown1.Enabled:=false;
   edit3.Enabled:=false;
   edit5.Enabled:=false;
   edit6.Enabled:=false;
   edit7.Enabled:=false;
   edit8.Enabled:=false;
  end;
if form3.ShowModal=mrok then
 begin
  dm.AqD116.Close;
  dm.AqD116.Open;
  dm.AqD116.Locate('rkey',dm.ADO116RKEY.Value,[]);
  dm.ADO116.Close;
  dm.ADO105.Close;
  dm.ADO106.Close;
 end
else
 begin
  dm.ado116.Close;
 end;
finally
form3.Free;
end;
end;

procedure TForm1.N23Click(Sender: TObject);
var
 i:byte;
begin
form_condition:=tform_condition.Create(application);
form_condition.dtpk1.Date:=dm.AqD116.Parameters.ParamValues['dtpk1'];
form_condition.dtpk2.Date:=dm.AqD116.Parameters.ParamValues['dtpk2'];
if form_condition.ShowModal=mrok then
 begin
  dm.AqD116.Close;
  if form_condition.RadioGroup1.ItemIndex=0 then
   dm.AqD116.CommandText:=self.aqd116_sql
  else
   dm.AqD116.CommandText:=self.Memo1.Lines.Text;
   
  for i:=1 to form_condition.SGrid1.RowCount-2 do
   dm.AqD116.CommandText:=dm.AqD116.CommandText+
   form_condition.SGrid1.Cells[2,i]+#13;

  dm.AqD116.Parameters.ParamByName('dtpk1').Value:=form_condition.dtpk1.Date;
  dm.AqD116.Parameters.ParamByName('dtpk2').Value:=form_condition.dtpk2.Date;
  dm.aqd116.Prepared;
  dm.AqD116.Open;
 end;
form_condition.Free;
end;

procedure TForm1.N24Click(Sender: TObject);
begin
form_custrma:=Tform_custrma.create(application);
form_custrma.showmodal;
form_custrma.free;
end;

procedure TForm1.N25Click(Sender: TObject);
begin
   Frm_QrySum:=TFrm_QrySum.Create(nil);
   try
     Frm_QrySum.ShowModal;
   finally
     Frm_QrySum.Free;
   end;
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if dm.aqd116.FieldByName('memo_status').AsInteger=3 then
  DBGrid1.Canvas.Font.Color := clRed;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.N29Click(Sender: TObject);
var
 Rkey116 : string;
begin

if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0);
  exit;
 end;
 Rkey116:=DM.aqd116.fieldByName('rkey').AsString; //记住当前rkey
 try

   Form4 := Tform4.Create(Application);

   with DM.aqd116 do
  begin
   Close;
   LockType := ltOptimistic;
   Open;
   DM.aqd116.Locate('rkey',Rkey116,[loCaseInsensitive ,loPartialKey]);
   Edit;
   Form4.edit1.Text:=fieldByName('MEMO_NUMBER').AsString;
   Form4.edit1.Enabled:=false;
  end;

  if form4.showmodal=mrok then
   with DM.aqd116 do
  begin
   Close;
   LockType := ltReadOnly;
   Open;
   DM.aqd116.Locate('rkey',Rkey116,[loCaseInsensitive ,loPartialKey]);
  end;

 finally
  form4.free;
 end;
end;

end.
