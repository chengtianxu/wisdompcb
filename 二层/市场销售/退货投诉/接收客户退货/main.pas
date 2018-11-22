unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, ADODB, Grids, DBGrids, Mask,
  DBCtrls, Menus, ExtCtrls,Excel2000,ClipBrd, ComObj;

type
  TForm1 = class(TForm)
    Bar1: TStatusBar;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    Panel1: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure N2Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure po_value();
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    OldGridWnd : TWndMethod;
    procedure NewGridWnd(var Message: TMessage);
    procedure CopyDbDataToExcel(Args:array of const);
  public
    { Public declarations }
   long_date,sort_sysdate:tdatetime; 
  end;

var
  Form1: TForm1;

implementation

uses damo,edit_rma, note,  cust_search,common;

{$R *.dfm}

procedure TForm1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
  begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
    dbgrid1.DataSource.DataSet.MoveBy(1)
   else
    dbgrid1.DataSource.DataSet.MoveBy(-1)
  end
 else
  begin
   OldGridWnd(Message);
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

procedure TForm1.N2Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
 end;
  with dm.adoquery2 do
   begin
    close;
    sql.Clear;
    sql.Add('select rma_status from data0098');
    sql.Add('where rkey='+dm.ADOQuery1rkey.AsString);
    open;
   end;
 if dm.ADOQuery2.FieldValues['rma_status']=dm.ADOQuery1RMA_STATUS.Value then
 try
  form2:=tform2.Create(application);
  with form2.ADOQuery1 do
   begin
    active:=false;
    Parameters.ParamValues['key']:=dm.ADOQuery1rkey.Value;
    active:=true;
    edit;
   end;
  with dm.adoquery2 do
   begin
    if active=true then active:=false;
    sql.Clear;        //查找客户
    sql.Add('select CUST_CODE,CUSTOMER_NAME from data0010');
    sql.Add('where rkey='+dm.adoquery1.fieldbyname('customer_ptr').AsString);
    active:=true;
    form2.Edit5.Text := fieldvalues['cust_code'];
    form2.Label14.Caption := fieldbyname('CUSTOMER_NAME').AsString;
    form2.Label15.Caption := dm.adoquery1.fieldbyname('customer_ptr').AsString;
   end;
  with dm.adoquery2 do
   begin
    if active=true then active:=false;
    sql.Clear;       //查找板号
    sql.Add('select manu_part_number,manu_part_desc from data0025');
    sql.Add('where rkey='+dm.adoquery1.fieldbyname('customer_part_ptr').AsString);
    active:=true;
    form2.Edit4.Text := trim(fieldbyname('manu_part_number').AsString);
    form2.label13.Caption := fieldbyname('manu_part_desc').AsString;
    form2.Label16.Caption := dm.adoquery1.fieldbyname('customer_part_ptr').AsString;
   end;

  with dm.adoquery2 do
   begin
    active:=false;
    sql.Clear;       //查找输入人员
    sql.Add('select employee_name from data0005');
    sql.Add('where rkey='+form2.ADOQuery1AUTH_BY_EMPL_PTR.AsString);
    active:=true;
    form2.Edit3.Text := trim(fieldbyname('employee_name').AsString);
   end;

  if form2.ADOQuery1SHIPMENT_PTR.AsVariant<>null then
   with dm.ADOQuery2 do
    begin
     close;
     sql.Clear;
     sql.Add('select LOG_NUMBER from data0101');
     sql.Add('where rkey='+dm.ADOQuery1shipment_ptr.AsString);
     open;
     form2.rkey101.Caption:=dm.ADOQuery1shipment_ptr.AsString;
     form2.Edit2.Text:=dm.ADOQuery2.fieldbyname('LOG_NUMBER').AsString;
     form2.Edit2.Font.Color:=clwindowtext;
    end;
  if dm.adoquery1.FieldValues['so_ptr'] = null then
   begin
    form2.Caption := '按客户部品分类的RMA';
    form2.Edit1.Visible := false;
    form2.Label5.Visible := false;
    form2.BitBtn4.Visible := false;
    form2.Edit7.Visible :=false;
    form2.Label19.Visible := false;
    form2.StringGrid1.Enabled:=false;
    form2.Edit5.Enabled := false;
    form2.BitBtn7.Visible := false;  //客户不可以修改
   end
  else
   begin
    form2.Caption := '按销售定单及装运分类的RMA';
    form2.Edit4.Enabled := false;
    form2.Edit4.Color := cl3dlight;
    form2.Edit5.Enabled := false;
    form2.Edit5.Color := cl3dlight;
    form2.BitBtn6.Visible := false;
    form2.BitBtn7.Visible := false;
    form2.DBEdit6.ReadOnly := true;
    form2.Label17.Caption :=dm.adoquery1.fieldbyname('so_ptr').AsString;
    with dm.adoquery2 do
    begin             //查找销售定单号
     active:=false;
     sql.Clear;
     sql.Add('select sales_order,data0097.po_number');
     sql.Add('from data0060 inner join data0097 on');
     sql.Add('data0060.PURCHASE_ORDER_PTR=data0097.rkey');
     sql.Add('where data0060.rkey='+dm.adoquery1.fieldbyname('so_ptr').AsString);
     active:=true;
     form2.Edit1.Text := trim(fieldbyname('sales_order').AsString);
     form2.Edit7.Text := fieldbyname('po_number').AsString;
     form2.Edit1.Enabled:=false;
     form2.BitBtn4.Enabled:=false;
    end;
   end;
  form2.ShowModal;
 finally
  form2.free;
 end
else
 messagedlg('退货单状态发生变发,不能被编辑',mtinformation,[mbcancel],0);

end;

procedure TForm1.N9Click(Sender: TObject); //新增按so
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
 try
  form2:=tform2.Create(application);
  with form2.ADOQuery1 do
   begin
    active:=false;
    Parameters.ParamValues['key']:=null;
    active:=true;
    append;
    form2.ADOQuery1RMA_DATE.Value:=self.long_date;
    form2.ADOQuery1sys_date.Value:=self.long_date;
   end;
   form1.po_value();
   form2.Caption := '按销售定单及装运分类的RMA';

   form2.DBEdit6.ReadOnly:=true;
   form2.ShowModal;
 finally
  form2.Free;
 end;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
 try
  form2:=tform2.Create(application);
  with form2.ADOQuery1 do
   begin
    if active=true then
    active:=false;
    Parameters.ParamValues['key']:=null;
    active:=true;
    append;
    form2.ADOQuery1RMA_DATE.Value:=self.long_date;
    form2.ADOQuery1sys_date.Value:=self.long_date;    
   end;
    form1.po_value();
    form2.Caption := '按客户部品分类的RMA';
    form2.Edit1.Visible := false;
    form2.Label5.Visible := false;
    form2.BitBtn4.Visible := false;
    form2.Edit7.Visible := false;
    form2.Label19.Visible := false;
    form2.Label8.Visible := false;
    form2.DBEdit1.Visible:= false;
    form2.StringGrid1.Enabled:=false;
    Form2.BitBtn6.Visible:=True;
  form2.ShowModal;
 finally
  form2.Free;
 end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.adoquery1.FieldValues['rma_status'] = 1 then   //未入仓
 begin
  n2.Enabled := true;
  n3.Enabled := true;
  n4.Enabled := true;
  n6.Enabled := true;
 end
else
 if dm.adoquery1.FieldValues['rma_status'] = 2 then    //提交入仓
  begin
   n2.Enabled := true;
   n3.Enabled := true;
   n4.Enabled := true;
   n6.Enabled := false;
  end
 else
  if (dm.adoquery1.FieldValues['rma_status'] = 3) or  //已入仓
     (dm.adoquery1.FieldValues['rma_status'] = 4) then   //已充帐
   begin
    n2.Enabled := false;
    n3.Enabled := true;
    n4.Enabled := false;
    n6.Enabled := false;  //提交入仓菜单
   end
  else
   begin
    n2.Enabled := false;
    n3.Enabled := false;
    n4.Enabled := false;
    n6.Enabled := false;     //提交入仓
   end
end;

procedure TForm1.N6Click(Sender: TObject);
begin
if (strtoint(vprev)=4) then
 begin
  dm.ADOQuery1.Edit;
  dm.ADOQuery1RMA_STATUS.Value:=2;
  dm.ADOQuery1.Post;
 end
else
 begin
  messagedlg('对不起!您没有该程序的提交权限,请与管理员联系!',mtinformation,[mbok],0);
  exit;
 end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
begin
  with dm.adoquery2 do
   begin
    close;
    sql.Clear;
    sql.Add('select rma_status from data0098');
    sql.Add('where rkey='+dm.ADOQuery1rkey.AsString);
    open;
   end;
 if dm.ADOQuery2.FieldValues['rma_status']<>dm.ADOQuery1RMA_STATUS.Value then
  showmsg('退货单状态发生变发不允许删除',1)
 else

 if messagedlg('您确定要删除该条记录吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
   try
    dm.ADOConnection1.BeginTrans;
    if dm.ADOQuery1so_ptr.AsVariant=null then
     begin
      with dm.ADOQuery2 do
       begin
        close;
        sql.Clear;
        sql.Add('delete from data0098');
        sql.Add('where rkey='+dm.ADOQuery1rkey.AsString);
        ExecSQL;
       end;
      dm.ADOQuery1.Close;
      dm.ADOQuery1.Open;
     end
    else
     begin
      with dm.ADOQuery2 do
       begin
        close;
        sql.Clear;
        sql.Add('update data0064');
        sql.Add('set QUAN_CREDITED=QUAN_CREDITED-data0120.qty_send');
        sql.Add('from data0120 inner join data0064');
        sql.Add('on data0120.ship_ptr=data0064.rkey');
        sql.Add('where data0120.rma_ptr='+dm.ADOQuery1rkey.AsString);
        ExecSQL;
       end;
      with dm.ADOQuery2 do
       begin
        close;
        sql.Clear;
        sql.Add('delete from data0098');
        sql.Add('where rkey='+dm.ADOQuery1rkey.AsString);
        ExecSQL;
       end;
      dm.ADOQuery1.Close;
      dm.ADOQuery1.Open;
     end;
    dm.ADOConnection1.CommitTrans;
    showmsg('删除操作成功!',1);
    except
     on E: Exception do
      begin
       dm.ADOConnection1.RollbackTrans;
       messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
end;
end;

procedure TForm1.N3Click(Sender: TObject); //检查
begin
if not dm.ADOQuery1.IsEmpty then
 try
  form2:=tform2.Create(application);
  form2.BitBtn1.Visible := false;
  form2.Edit4.Enabled := false;
  form2.Edit4.Color := cl3dlight;
  form2.Edit5.Enabled := false;
  form2.Edit5.Color := cl3dlight;
  form2.BitBtn6.Visible := false;
  form2.BitBtn7.Visible := false;
  form2.BitBtn4.Visible := false;
  form2.DBEdit6.ReadOnly := true;
  form2.DBEdit6.Color := cl3Dlight;
  form2.DBEdit7.ReadOnly := true;
  form2.Edit2.Enabled:=false;
  form2.BitBtn5.Enabled:=false;
  form2.DBEdit1.Enabled:=false;
  Form2.dbrgrprma_type.Enabled:=false;
  with form2.ADOQuery1 do
   begin
    active:=false;
    Parameters.ParamValues['key']:=dm.ADOQuery1rkey.Value;
    active:=true;
    edit;
   end;
  with dm.adoquery2 do
   begin
    if active=true then active:=false;
    sql.Clear;        //查找客户
    sql.Add('select CUST_CODE,CUSTOMER_NAME from data0010');
    sql.Add('where rkey='+dm.adoquery1.fieldbyname('customer_ptr').AsString);
    active:=true;
    form2.Edit5.Text := fieldvalues['cust_code'];
    form2.Label14.Caption := fieldbyname('CUSTOMER_NAME').AsString;
    form2.Label15.Caption := dm.adoquery1.fieldbyname('customer_ptr').AsString;
   end;
  with dm.adoquery2 do
   begin
    if active=true then active:=false;
    sql.Clear;       //查找板号
    sql.Add('select manu_part_number,manu_part_desc from data0025');
    sql.Add('where rkey='+dm.adoquery1.fieldbyname('customer_part_ptr').AsString);
    active:=true;
    form2.Edit4.Text := trim(fieldbyname('manu_part_number').AsString);
    form2.label13.Caption := fieldbyname('manu_part_desc').AsString;
    form2.Label16.Caption := dm.adoquery1.fieldbyname('customer_part_ptr').AsString;
   end;
  with dm.adoquery2 do
   begin
    active:=false;
    sql.Clear;       //查找输入人员
    sql.Add('select employee_name from data0005');
    sql.Add('where rkey='+form2.ADOQuery1AUTH_BY_EMPL_PTR.AsString);
    active:=true;
    form2.Edit3.Text := trim(fieldbyname('employee_name').AsString);
   end;   
  if form2.ADOQuery1SHIPMENT_PTR.AsVariant<>null then
   with dm.ADOQuery2 do
    begin
     close;
     sql.Clear;
     sql.Add('select LOG_NUMBER from data0101');
     sql.Add('where rkey='+dm.ADOQuery1shipment_ptr.AsString);
     open;
     form2.rkey101.Caption:=dm.ADOQuery1shipment_ptr.AsString;
     form2.Edit2.Text:=dm.ADOQuery2.fieldbyname('LOG_NUMBER').AsString;
     form2.Edit2.Font.Color:=clwindowtext;
    end;

  if dm.adoquery1.FieldValues['so_ptr'] = null then
   begin
    form2.Caption := '按客户部品分类的RMA';
    form2.Edit1.Visible := false;
    form2.Label5.Visible := false;
    form2.Edit7.Visible :=false;
    form2.Label19.Visible := false;
    form2.StringGrid1.Enabled:=false;
   end
  else
   begin
    form2.Caption := '按销售定单及装运分类的RMA';
    with dm.adoquery2 do
    begin             //查找销售定单号
     active:=false;
     sql.Clear;
     sql.Add('select sales_order,po_number');
     sql.Add('from data0060 inner join data0097 on');
     sql.Add('data0060.PURCHASE_ORDER_PTR=data0097.rkey');
     sql.Add('where data0060.rkey='+dm.adoquery1.fieldbyname('so_ptr').AsString);
     active:=true;
     form2.Edit1.Text := trim(fieldbyname('sales_order').AsString);
     form2.Label17.Caption :=dm.adoquery1.fieldbyname('so_ptr').AsString;
     form2.Edit7.Text := fieldbyname('po_number').AsString;
    end;
    form2.Edit1.Enabled :=false;
    form2.Edit1.Color := cl3dlight;
    form2.StringGrid1.Options:=form2.stringgrid1.Options - [goEditing]
   end;
  form2.ShowModal;
 finally
  form2.free;
 end
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
var
 searchoption:tlocateoptions;
begin
 searchoption:=[lopartialkey];   //部份符合
if Key = Chr(vk_Back) then       //如果按下了backspace
 begin
  if length(bar1.Panels[1].Text)>5 then
   bar1.Panels[1].Text:=copy(bar1.Panels[1].Text,1,length(bar1.Panels[1].Text)-1);
  if length(bar1.Panels[1].Text)>5 then
   if bar1.Panels[0].Text='RMA号码' then
    dm.ADOQuery1.Locate('rma_number',copy(bar1.Panels[1].Text,6,length(bar1.Panels[1].Text)),searchoption)
   else
    dm.ADOQuery1.Locate('MANU_part_number',copy(bar1.Panels[1].Text,6,length(bar1.Panels[1].Text)),searchoption)
  else
   dm.ADOQuery1.First
 end
else
 if key=chr(vk_ESCAPE) then    //如果按下了ESC
  begin
   bar1.Panels[1].Text:='搜索:';
   DM.ADOQuery1.First;
  end
 ELSE
  begin
   bar1.Panels[1].Text := bar1.Panels[1].Text+key;
   if bar1.Panels[0].Text='RMA号码' then
    dm.ADOQuery1.Locate('rma_number',copy(bar1.Panels[1].Text,6,length(bar1.Panels[1].Text)),searchoption)
   else
    dm.ADOQuery1.Locate('MANU_part_number',copy(bar1.Panels[1].Text,6,length(bar1.Panels[1].Text)),searchoption)
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if dm.ADOConnection1.Connected then
 begin

  with dm.adoquery2 do
   begin
    close;
    sql.Clear;
    sql.Add('select EMPLOYEE_PTR,EMPLOYEE_NAME from data0073 inner join data0005');
    sql.Add('on data0073.employee_ptr=data0005.rkey');
    sql.Add('where data0073.rkey='+rkey73);
    open;
    user_ptr := fieldvalues['employee_ptr'];
    dm.EMPLOYEE_name:=fieldbyname('EMPLOYEE_NAME').asstring;
   end;

 with dm.ADOQuery2 do
  begin
   close;
   sql.Clear;
   sql.Add('select getdate() as sys_date');
   open;
   long_date:=strtodatetime(formatdatetime('yyyy-mm-dd H:mm:ss',fieldvalues['sys_date']));
   sort_sysdate:=strtodate(datetostr(long_date));
  end;

   dtpk1.Date:=sort_sysdate-30;
   dtpk2.Date:=sort_sysdate;
   self.dtpk1Exit(sender);
 end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 if not app_init_2(dm.ADOConnection1) then
  begin
   showmsg('程序起动失败,请联系管理员!',1);
   application.Terminate;
  end;
  self.Caption:=application.Title;

//  vprev:='4';
//  rkey73:='1';
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

procedure tform1.po_value();
var
 v_i,v_j:word;
 v_mask:string;
begin
 dm.AQ04.Close;
 dm.AQ04.Open;
 if dm.AQ04.FieldValues['seed_flag']<>1 then
  begin
   form2.DBEdit7.Field.Value := trim(dm.AQ04.Fieldvalues['seed_value']);
   if dm.AQ04.FieldValues['seed_flag']=2  then
   begin
   for v_i:=length(trim(form2.DBEdit7.Text)) downto 1 do //设置掩码
   if (form2.DBEdit7.Text[v_i]<'0') or (form2.DBEdit7.Text[v_i]>'9') then//找出第几位开始为前缀
    begin                                                  //不是数字字符就为前缀
     form2.DBEdit7.Field.EditMask := copy(form2.DBEdit7.Text,1,v_i)+copy('9999999999',1,10-v_i)+';1; ';
     v_mask := form2.DBEdit7.Field.EditMask;
     for v_j :=1 to v_i do
      insert('\',v_mask,2*v_j-1);         //从奇数位插入
     form2.DBEdit7.Field.EditMask := v_mask;    //重新给掩码赋值
     break;
    end;
   end
   else
    if dm.AQ04.FieldValues['seed_flag']=4 then
     form2.DBEdit7.Enabled :=false;
  end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
try
 FrmCustSearch:=tFrmCustSearch.Create(application);
 FrmCustSearch.MaskEdit1.Text:=trim(edit1.Text);
 if FrmCustSearch.ADOQuery1.IsEmpty then
  begin
   messagedlg('请输入正确的客户代码!',mtinformation,[mbok],0);
   edit1.SetFocus;
  end
 else
 if FrmCustSearch.ShowModal=mrok then
  begin
   edit1.Text := FrmCustSearch.ADOQuery1.fieldbyname('cust_code').AsString;
   edit1.Font.Color := clwindowtext;
   label9.Caption := FrmCustSearch.ADOQuery1.fieldbyname('customer_name').AsString;
   with dm.ADOQuery1 do
    begin
     close;
     sql.Delete(sql.Count-2);
     sql.Insert(sql.Count-1,'and data0098.customer_ptr='+FrmCustSearch.ADOQuery1.fieldbyname('rkey').AsString);
     dm.ADOQuery1.Prepared;
     open;
    end;
   dbgrid1.SetFocus;
  end;
finally
 FrmCustSearch.free;
end;
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
 if edit1.Font.Color=clwindowtext then
  begin
   edit1.SelectAll;
   edit1.Font.Color:=clblue;
  end;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn2') and (trim(edit1.Text)<>'') then
try
 frmcustsearch:=tfrmcustsearch.Create(application);
 frmcustsearch.MaskEdit1.Text:=trim(edit1.Text);
 if frmcustsearch.ADOQuery1.IsEmpty then
  begin
   messagedlg('请输入正确的客户代码!',mtinformation,[mbok],0);
   edit1.SetFocus;
  end
 else
 if comparetext(trim(edit1.text),trim(frmcustsearch.ADOQuery1.Fieldbyname('cust_code').AsString))=0 then
  begin
   edit1.Text:=frmcustsearch.ADOQuery1.fieldbyname('cust_code').AsString;
   edit1.Font.Color := clwindowtext;
   label9.Caption := frmcustsearch.ADOQuery1.fieldbyname('customer_name').AsString;
   with dm.ADOQuery1 do
    begin
     close;
     sql.Delete(sql.Count-2);
     sql.Insert(sql.Count-1,'and Data0098.CUSTOMER_PTR='+frmcustsearch.ADOQuery1.fieldbyname('rkey').AsString);
     dm.ADOQuery1.Prepared;
     open;
    end;
  end
 else
  begin
   messagedlg('请输入正确的客户代码!',mtinformation,[mbok],0);
   edit1.SetFocus;
  end;
finally
 frmcustsearch.free;
end
else
 if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'BitBtn2')and (trim(edit1.Text)='') then
  begin
  label9.Caption:='';
   with dm.ADOQuery1 do
    begin
     close;
     sql.Delete(sql.Count-2);
     sql.Insert(sql.Count-1,'');
     dm.ADOQuery1.Prepared;
     open;
    end;
  end;
end;
procedure TForm1.dtpk1Exit(Sender: TObject);
begin
  dm.ADOQuery1.Close;
  dm.ADOQuery1.Parameters[0].Value:=dtpk1.Date;
  dm.ADOQuery1.Parameters[1].Value:=dtpk2.Date+1;
  dm.ADOQuery1.Prepared;
  dm.ADOQuery1.Open;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 rkey98:integer;
begin
  rkey98:=dm.ADOQuery1rkey.Value;
  dm.ADOQuery1.Close;
  dm.ADOQuery1.Open;
  if rkey98>0 then dm.ADOQuery1.Locate('rkey',rkey98,[]);
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (chr(key)='V') and (ssalt in shift) then
 showmessage(dm.ADOQuery1.SQL.Text);
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.FieldName='rma_number') or (column.FieldName='MANU_part_number') then
 begin
  if column.Title.Caption<>bar1.Panels[0].Text then
   begin
    bar1.Panels[0].Text:= column.Title.Caption;
    bar1.Panels[1].Text:= '搜索:';
    for i:=0 to dbgrid1.FieldCount-1 do
     if dbgrid1.Columns[i].Title.Color=clRed then
      dbgrid1.Columns[i].Title.Color:=clbtnFace;
    column.Title.Color:=clRed;
   end;
 end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
CopyDbDataToExcel([dbgrid1]);
end;

end.
