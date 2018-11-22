unit edit_req;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, Mask, DB, ADODB,
  Menus, ComCtrls,raFunc, Spin;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    MaskEdit1: TMaskEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    DBEdit2: TDBEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    MaskEdit2: TMaskEdit;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Label16: TLabel;
    Label17: TLabel;
    Edit8: TEdit;
    DBEdit3: TDBEdit;
    DBGrid2: TDBGrid;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    BitBtn9: TBitBtn;
    Label18: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Label19: TLabel;
    Label20: TLabel;
    Button1: TButton;
    Label6: TLabel;
    Edit5: TEdit;
    BitBtn8: TBitBtn;
    Label7: TLabel;
    StringGrid1: TStringGrid;
    PopupMenu3: TPopupMenu;
    N7: TMenuItem;
    PopupMenu4: TPopupMenu;
    N8: TMenuItem;
    Label13: TLabel;
    Edit6: TEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure save_note();
    procedure save_budget();
    procedure return_req(pr_number:string);
    function  find_std_error():boolean;
    function  find_mis_error():boolean;
    function  pr_number(ware_type:string):string;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure BitBtn1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn9Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure BitBtn4Exit(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    { Private declarations }
   v_close:byte; //正常退出标识
   v_Date:shortstring;  //系统日期
   budget_ptr:integer;  //员工指针,预算指针
   v_year,v_month,v_usedmonth:word; //系统年度月份
   v_total:real;
   v_sysdate:tdatetime;
   new_prnumber:string;   
  public
    { Public declarations }
   warehouse_type:string; 
  end;

var
  Form2: TForm2;
  requ_note: tstringlist;
implementation
 uses damo, warehouse_search, auth_search, empl_search,
  budget_search, note, addedit_requ, main, addedit_m, budget_ximu,
  csi_search;
{$R *.dfm}

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
 if (dm.ADO68FLAG.Value ='S')  then
  dm.ADO69.CancelBatch()
 else
  dm.ADO204.CancelBatch();
 dm.ADO68.Cancel;
 dm.ADO6811.Close;
 v_close:=1;
 close;
end;

procedure TForm2.FormActivate(Sender: TObject);
var
 i:byte;
begin
//==============================================================================
 if dm.ADO68PO_REQ_NUMBER.AsVariant <> null then //编辑或者是检查
  maskedit1.Text := trim(DM.ADO68PO_REQ_NUMBER.Value);
//==============================================================================
 with dm.ADO6811 do              //新增时ado6811为空记录
  begin           //查找记事本
   if active=true then active:=false;
   Parameters[0].Value := dm.ADO68rkey.Value;
   active:=true;
   if not isempty then
   for i:=1 to 4 do
    if Fieldbyname('NOTE_PAD_LINE_'+inttostr(i)).AsString <> '' then
      requ_note.Add(Fieldbyname('NOTE_PAD_LINE_'+inttostr(i)).AsString);
  end;
//==============================================================================
if label18.Caption='0' then      //新建,编辑,栓查(不是复制)
 if (dm.ADO68FLAG.Value='S') then   //如复制就不激活因为之前已经激活
  with dm.ADO69 do
  begin             //查找标准采购条目//新增时同样为空记录
   active:=false;
   Parameters[0].Value:=dm.ADO68.FieldValues['rkey'];
   active:=true;
   dbgrid2.Visible := false;
  end
 else
  with dm.ADO204 do
  begin           //查找杂项采购条目  //新增时同样为空记录
   active:=false;
   Parameters[0].Value:=dm.ADO68.FieldValues['rkey'];
   active:=true;
   dbgrid1.Visible := false;
  end
else
 begin
 end;
//==============================================================================
if  dm.ADO68EDITED_BY_EMP_PTR.AsVariant<>null then
 begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select employee_name from data0005');
    sql.Add('where rkey='+dm.ADO68EDITED_BY_EMP_PTR.AsString);
    open;
    label13.Visible:=true;
    edit6.Visible:=true;
    edit6.Text:=fieldvalues['employee_name'];
   end;
 end;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
 with dm.ADOQuery1 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select getdate() as v_dt,year(getdate()) as v_year,month(getdate()) as v_month');
   active:=true;   //读取系统时间
   v_date := datetostr(fieldvalues['v_dt']);
   v_year := fieldvalues['v_year'];       //年
   v_month := fieldvalues['v_month'];     //月
   v_sysdate := fieldvalues['v_dt'];
  end;
 if dm.ADO68.State=dsedit then //编辑状态
  begin
   with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.add('select warehouse_code,warehouse_name,');
    sql.Add('data0094.code,PURCHASE_APPROV_DESC,');
    sql.Add('empl_code,employee_name,');
    sql.Add('USER_LOGIN_NAME,user_full_name');
    sql.Add('from data0068 left join data0005');
    sql.Add('on data0068.buyer_ptr=data0005.rkey,');
    sql.Add('data0015,data0094,data0073');
    sql.Add('where data0068.whse_ptr=data0015.rkey and');
    sql.Add('data0068.auth_type=data0094.rkey and');
    sql.Add('data0068.user_ptr=data0073.rkey and');
    sql.Add('data0068.rkey='+dm.ADO68RKEY.AsString);
    active:=true;
    edit1.Text := fieldvalues['warehouse_code'];
    label9.Caption := fieldvalues['warehouse_name'];
    edit2.Text := fieldvalues['code'];  //审批代码
    label10.Caption := fieldvalues['PURCHASE_APPROV_DESC'];
    edit5.Text := fieldvalues['USER_LOGIN_NAME'];
    label7.Caption := fieldvalues['user_full_name'];
    edit1.Font.Color := clwindowtext;
    edit2.Font.Color := clwindowtext;
    edit5.Font.Color := clwindowtext;
    if fieldvalues['empl_code'] <> null then
     begin
      edit4.Text := fieldvalues['empl_code']; //采购人员
      label12.Caption := fieldvalues['employee_name'];
      edit4.Font.Color := clwindowtext;
     end;
   end;
    with dm.ADOQuery2 do
     begin
      active := false;
      sql.Clear;
      sql.Add('select * from data0362');
      sql.Add('where rkey='+dm.ADO68budget_ptr.AsString);
      active := true;
      edit3.Text := fieldvalues['code']; //预算代码
      edit3.Font.Color := clwindowtext;
      label11.Caption := fieldvalues['description'];
      spinedit1.Value := dm.ADO68v_year.Value;
      spinedit2.Value := dm.ADO68v_month.Value;    //使用预算月份
      spinedit1.Enabled:= false;
      spinedit2.Enabled:=false;
      edit8.Text := formatfloat('0.000',         //找出已前的预算
                   fieldvalues['budget_period_'+inttostr(spinedit2.Value)]-
                   fieldvalues['used_period_'+inttostr(spinedit2.Value)]+
                   dm.ADO68TOTAL.Value); //加上请购计算的本位币
     end;
   maskedit2.Text := datetostr(dm.ADO68REQ_DATE.Value);//请购日期赋值
   budget_ptr := dm.ADO68budget_ptr.Value;
   v_usedmonth := dm.ADO68v_month.Value;
   v_total := dm.ADO68TOTAL.Value;
  end
 else    //如果是新增状态
  if dm.ADO68.State=dsinsert then
   begin
    maskedit2.Text := v_date;
    spinedit1.Value:= v_year;
    spinedit2.Value:= v_month;
   end
  else   //如果是检查状态
   begin
    maskedit2.Text := datetostr(dm.ADO68REQ_DATE.Value);//请购日期赋值
    spinedit1.Value := dm.ADO68v_year.Value;
    spinedit2.Value := dm.ADO68v_month.Value;    //使用预算月份
    with dm.ADOQuery2 do
     begin
      active := false;
      sql.Clear;
      sql.Add('select * from data0362');
      sql.Add('where rkey='+dm.ADO68budget_ptr.AsString);
      active := true;
      edit3.Text := fieldvalues['code'];
      edit3.Font.Color := clwindowtext;
      label11.Caption := fieldvalues['description'];
     edit8.Text := formatfloat('0.000',         //找出已前的预算
                   fieldvalues['budget_period_'+inttostr(spinedit2.Value)]-
                   fieldvalues['used_period_'+inttostr(spinedit2.Value)]);
    end;
    button1.Enabled:=true;
   end;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
try
 form_auth:=tform_auth.Create(application);
 form_auth.Edit1.Text := trim(edit2.Text);
 if form_auth.ADOQuery1.IsEmpty then
  begin
   messagedlg('没有找到相关记录!',mtinformation,[mbok],0);
   edit2.SetFocus;
  end
 else
 if form_auth.ShowModal=mrok then
  begin
   edit2.Text := form_auth.ADOQuery1.FieldValues['code'];
   edit2.Font.Color := clwindowtext;
   label10.Caption := form_auth.ADOQuery1.fieldvalues['PURCHASE_APPROV_DESC'];
   dm.ADO68AUTH_TYPE.Value := form_auth.ADOQuery1.FieldValues['rkey'];
   maskedit2.SetFocus;
  end
 else
  edit2.SetFocus;
finally
 form_auth.free;
end;
end;

procedure TForm2.BitBtn7Click(Sender: TObject);
begin
 try
  form_employee:=Tform_employee.Create(application);
  form_employee.Edit1.Text := trim(edit4.Text);
  if form_employee.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找符合条件的记录!',mtwarning,[mbok],0);
    edit4.SetFocus;
   end
  else
  if form_employee.ShowModal=mrok then
   begin
    edit4.Text := form_employee.ADOQuery1.fieldvalues['empl_code'];
    edit4.Font.Color := clwindowtext;
    label12.Caption := form_employee.ADOQuery1.fieldvalues['employee_name'];
    dm.ADO68BUYER_PTR.Value := form_employee.ADOQuery1.FieldValues['rkey'];
    edit2.SetFocus;
   end
  else
   edit4.SetFocus;
 finally
  form_employee.free;
 end;
end;

procedure TForm2.BitBtn6Click(Sender: TObject);
begin
 try
  form_budget:=tform_budget.Create(application);
  form_budget.ADOQuery1.Close;
  form_budget.ADOQuery1.Parameters[1].Value:=spinedit1.Value;
  form_budget.ADOQuery1.Parameters[2].Value:=dm.ADO68USER_PTR.Value;
  form_budget.ADOQuery1.Open;
  form_budget.edit1.Text := trim(edit3.Text);
  if form_budget.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找符合条件的记录!',mtwarning,[mbok],0);
    edit3.SetFocus;
   end
  else
  if form_budget.ShowModal = mrok then
   begin
    edit3.Text := form_budget.ADOQuery1.FieldValues['code'];
    edit3.Font.Color := clwindowtext;
    label11.Caption := form_budget.ADOQuery1.FieldValues['description'];
    edit8.Text := formatfloat('0.000',
    form_budget.ADOQuery1.fieldvalues['budget_period_'+inttostr(spinedit2.Value)]-
    form_budget.ADOQuery1.fieldvalues['used_period_'+inttostr(spinedit2.Value)]);
    dm.ADO68budget_ptr.Value:=form_budget.ADOQuery1RKEY.Value;
    spinedit1.Enabled := false;
    spinedit2.Enabled := false;
    button1.Enabled := true;
    dbedit2.SetFocus;
   end
  else
   edit3.SetFocus;
 finally
  form_budget.free;
 end;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Memo1.Lines.Assign(requ_note);
  edit_note.Caption := '采购请求记事本:'+maskedit1.Text;
  if bitbtn1.Visible=false then
   begin
    edit_note.Button1.Visible := false;
    edit_note.Button2.Visible := false;
    edit_note.Button3.Visible := true;
    edit_note.Memo1.ReadOnly := true;
    edit_note.Memo1.Color := cl3dlight;
    edit_note.BitBtn1.Enabled := false;
   end;
 if edit_note.ShowModal=mrok then
  begin
   requ_note.Text := trim(edit_note.Memo1.Text);
  end;
 finally
  edit_note.free;
 end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 requ_note:=tstringlist.Create;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
 requ_note.Free;
end;

procedure TForm2.N2Click(Sender: TObject);
var
 v_total:single;
begin
if edit1.Font.Color=clblue then
 begin
  messagedlg('请输入正确的工厂代码!',mtinformation,[mbcancel],0);
  edit1.SetFocus;
 end
else
 try
  v_total := dm.ADO69QUANTITY.Value*dm.ADO69tax_price.Value*dm.ADO69base_to.Value;
  dm.ADO69.Edit;
  form3:=tform3.Create(application);
  form3.edit1.Text := form2.Edit1.Text + form2.Label9.Caption;
  form3.Edit2.Text := trim(dm.ADO69inv_number.Value);
  form3.Edit2.Font.Color := clwindowtext;
  form3.label8.Caption := dm.ADO69inv_part_number.Value+dm.ADO69inv_part_description.Value;
  form3.Edit3.Text := dm.ADO69supplier_code.Value;
  form3.Edit3.Font.Color := clwindowtext;
  form3.Label9.Caption := dm.ADO69supplier_name.Value;
  form3.MaskEdit1.Text := dm.ADO69REQ_DATE.AsString;
  if dm.ADO69reply_date.AsVariant <> null then
   form3.MaskEdit2.Text := dm.ADO69reply_date.AsString
  else
   form3.MaskEdit2.Text := dm.ADO69REQ_DATE.AsString;
  if form3.ShowModal=mrok then
   begin
    dbedit3.Field.Value := dbedit3.Field.Value-v_total+
     dm.ADO69QUANTITY.Value*dm.ADO69tax_price.Value*dm.ADO69base_to.Value;
    dm.ADO69.Post;
   end; //换算成本位币
 finally
  form3.free;
 end;
end;

procedure TForm2.Edit1Click(Sender: TObject);
begin
IF (sender as tedit).Font.Color=clwindowtext then
 begin
  (sender as tedit).Font.Color :=clblue;
  (sender as tedit).SelectAll;
 end;
end;

procedure TForm2.N1Click(Sender: TObject);//新标准请购项目
var
 bk:tbookmark;
begin
if trim(edit1.Text)='' then
 begin
  messagedlg('请输入正确的工厂代码!',mtinformation,[mbcancel],0);
  edit1.SetFocus;
 end
else
begin
 bk:=dm.ADO69.GetBookmark();
 dm.ADO69.Append;
 dm.ADO69QUANTITY.Value := 0;
 dm.ADO69UNIT_PRICE.Value := 0;
 dm.ADO69tax_price.Value := 0;
 dm.ADO69PURCH_REQ_PTR.Value :=dm.ADO68RKEY.Value; //给主表指针赋值
 try
  form3:=tform3.Create(application);
  form3.edit1.Text := form2.Edit1.Text + form2.Label9.Caption;
  form3.MaskEdit1.Text := datetimetostr(self.v_sysdate);               //需求期
  form3.MaskEdit2.Text := form3.MaskEdit1.Text; //交货期
  if form3.ShowModal=mrok then
   begin
    dm.ADO68TOTAL.Value := dm.ADO68TOTAL.Value+//换算成,本位币
       dm.ADO69QUANTITY.Value*dm.ADO69tax_PRICE.Value*dm.ADO69base_to.Value;
    dm.ADO69.Post;
    bitbtn4.Enabled := false;
    edit1.Enabled := false;
   end
  else
   dm.ADO69.GotoBookmark(bk);
 finally
  form3.Free;
  dm.ADO69.FreeBookmark(bk);
 end;
end;
end;

procedure TForm2.DBGrid1DblClick(Sender: TObject);
begin
 if (not dm.ADO69.IsEmpty) and (bitbtn1.Visible=true) then
  n2click(sender);
end;

procedure TForm2.N3Click(Sender: TObject);
begin
 dbedit3.Field.Value := dbedit3.Field.Value -
 dm.ADO69QUANTITY.Value*dm.ADO69tax_PRICE.Value*dm.ADO69base_to.Value;

if dm.ADO69RKEY.AsVariant <> null then
 begin
  stringgrid1.Cells[0,stringgrid1.RowCount-1] := dm.ADO69INVT_PTR.AsString;
  stringgrid1.Cells[1,stringgrid1.RowCount-1] := dm.ADO69supp_PTR.AsString;
  stringgrid1.Cells[2,stringgrid1.RowCount-1] := dm.ADO69PO_LINK_PTR.AsString;
  stringgrid1.Cells[3,stringgrid1.RowCount-1] := dm.ADO69REQ_DATE.AsString;
  stringgrid1.Cells[4,stringgrid1.RowCount-1] := dm.ADO69QUANTITY.AsString;
  stringgrid1.Cells[5,stringgrid1.RowCount-1] := dm.ADO69UNIT_PRICE.AsString;
  stringgrid1.Cells[6,stringgrid1.RowCount-1] := dm.ADO69UNIT_PTR.AsString;
  stringgrid1.Cells[7,stringgrid1.RowCount-1] := dm.ADO69CONVERSION_FACTOR.AsString;
  stringgrid1.Cells[8,stringgrid1.RowCount-1] := dm.ADO69o_i_flag.AsString;
  stringgrid1.Cells[9,stringgrid1.RowCount-1] := dm.ADO69reply_date.AsString;
  stringgrid1.Cells[10,stringgrid1.RowCount-1] := dm.ADO69reason.AsString;
  stringgrid1.Cells[11,stringgrid1.RowCount-1] := dm.ADO69extra_req.AsString;
  stringgrid1.Cells[12,stringgrid1.RowCount-1] := dm.ADO69avl_flag.Value;
  stringgrid1.Cells[13,stringgrid1.RowCount-1] := dm.ADO69tax.AsString;
  stringgrid1.Cells[14,stringgrid1.RowCount-1] := dm.ADO69tax_price.AsString;
  stringgrid1.Cells[15,stringgrid1.RowCount-1] := dm.ADO69rohs.Value;
  stringgrid1.Cells[16,stringgrid1.RowCount-1] := dm.ADO69req_unit_ptr.AsString;  
  stringgrid1.RowCount:=stringgrid1.RowCount+1;
 end;
 dm.ADO69.Delete;

 if dm.ADO69.IsEmpty then
  begin
   bitbtn4.Enabled :=true;
   edit1.Enabled:=true;
  end;

end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
 if dm.ADO69.IsEmpty then
  begin
   n2.Enabled := false;
   n3.Enabled := false;
  end
 else
  begin
   n2.Enabled := true;
   n3.Enabled := true;
   if dm.ADO69RKEY.AsVariant = null then
    n3.Caption := '删除请求'
   else
    n3.Caption := '单项退回';
  end;
end;

procedure tform2.save_note();
var
 i:byte;
begin
 if not dm.ADO6811.IsEmpty then //如果(主表)原记录有记事本
  begin                                  //那幺只编辑和删除
   if trim(requ_note.Text)<>'' then
    begin
     dm.ADO6811.Edit;
     for i:=1 to 4 do
     if requ_note.Count >= i then
      dm.ADO6811.FieldValues['NOTE_PAD_LINE_'+inttostr(i)] := requ_note.Strings[i-1]
     else
      dm.ADO6811.FieldValues['NOTE_PAD_LINE_'+inttostr(i)] := '';
     dm.ADO6811.Post;
    end
   else
    begin
     dm.ADO6811.Delete;
    end;
  end
 else   //如果(主表)原记录没有记事本 ,例如新增为其一
  if trim(requ_note.Text)<>'' then      //那幺只有新增一种情况
   with dm.ADO6811 do
    begin
     append;
     FieldValues['file_pointer'] := dm.ADO68RKEY.Value;
     FieldValues['source_type']:= 68;
     for i:=1 to requ_note.Count do
      FieldValues['NOTE_PAD_LINE_'+inttostr(i)] := requ_note.Strings[i-1];
     post;
    end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 if_returen:boolean;
begin
if (stringgrid1.RowCount > 2) and
  (messagedlg('是否将单项退回的请购生成新的请购单？',mtconfirmation,[mbyes,mbno],0)=mryes) then
 if_returen:=true
else
 if_returen:=false;
//==============================================================================
 dm.ADOConnection1.BeginTrans;   //起用事物处理
 dm.ADO68STATUS.Value := 1;      //有效
 dm.ADO68REQ_DATE.AsString := maskedit2.Text;   //需求日期
 dm.ADO68v_year.Value := spinedit1.Value;       //预算年度
 dm.ADO68v_month.Value := spinedit2.Value;      //预算月份

if dm.ADO68.State = dsedit then //如果是编辑状态
 begin      //开始编辑
  self.save_note;     //保存记事本
  try
   dm.ADO68.Post;
   if (dm.ADO68FLAG.Value ='S')  then
    dm.ADO69.UpdateBatch()  //保存标准请购条目
   else
    dm.ADO204.UpdateBatch(); //保存杂项请购条目
   save_budget;              //保存预算

  if if_returen then return_req(trim(dm.ADO68PO_REQ_NUMBER.Value));    //拆分请购单

   dm.ADOConnection1.CommitTrans;
  if if_returen then showmessage('请购单拆分成功!新编号为'+new_prnumber);
   v_close := 1;
   ModalResult:=mrok;
  except
   dm.ADOConnection1.RollbackTrans;
   showmessage('数据提交不成功请取消操作重来一次，或通知管理员');
   maskedit1.SetFocus;
  end;
 end      //结束编辑
else
 begin  //开始新增
  try
   dm.ADO68PO_REQ_NUMBER.Value := maskedit1.Text; //请购编号
   dm.ADO68.Post;
//==============================================================================
  self.save_note();      //保存记事本
  with dm.ADO362 do
   begin
    close;         //修改预算值
    Parameters[0].Value:=dm.ADO68budget_ptr.Value;
    Open;
    Edit;
    fieldvalues['used_period_'+inttostr(spinedit2.Value)]:=formatfloat('0.00',
        fieldvalues['used_period_'+inttostr(spinedit2.Value)]+
        dm.ADO68TOTAL.Value);
    post;
   end;
//=============================================================================
 if (dm.ADO68FLAG.Value='S')  then //如果是新增标准请求
  begin
   dm.ADO69.First;
   dm.ado28.open;
   while not dm.ADO69.Eof do
    begin
     dm.ADO69.Edit;
     dm.ADO69PURCH_REQ_PTR.Value := dm.ADO68RKEY.Value;
     dm.ADO69.Post;
     dm.ADO69.Next;
    end;
   dm.ADO69.UpdateBatch();
  end
 else               //如果是新增杂项请求
  begin
   dm.ADO204.First;
   while not dm.ADO204.Eof do
    begin
     dm.ADO204.Edit;
     dm.ADO204PURCHASE_REQ_PTR.Value := dm.ADO68RKEY.Value;
     dm.ADO204.Next;
    end;
   dm.ADO204.UpdateBatch();
  end;
//==============================================================================
  dm.ADOConnection1.CommitTrans;
  v_close:=1;
  ModalResult:=mrok;
 except
  dm.ADOConnection1.RollbackTrans;
  maskedit1.SetFocus;
  exit;
 end;
end;
//====={结束新增功能}===========================================================
end;

procedure TForm2.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'BitBtn5')
   and (trim(edit2.Text)<>'') then
 try
  form_auth:=tform_auth.Create(application);
  form_auth.Edit1.Text := trim(edit2.Text);
 if comparetext(trim(edit2.text),trim(form_auth.ADOQuery1.Fieldbyname('code').AsString))=0 then
  begin
   edit2.Text := form_auth.ADOQuery1.FieldValues['code'];
   edit2.Font.Color := clwindowtext;
   label10.Caption := form_auth.ADOQuery1.fieldvalues['PURCHASE_APPROV_DESC'];
   dm.ADO68AUTH_TYPE.Value := form_auth.ADOQuery1.FieldValues['rkey'];
  end
 else
  begin
   messagedlg('授权代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label10.Caption := '';
   edit2.SetFocus;
  end;
 finally
  form_auth.Free;
 end;
end;

procedure TForm2.Edit4Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'BitBtn7')
   and (trim(edit4.Text)<>'') then
 try
  form_employee:=tform_employee.Create(application);
  form_employee.Edit1.Text := trim(edit4.Text);
 if comparetext(trim(edit4.text),trim(form_employee.ADOQuery1.Fieldbyname('empl_code').AsString))=0 then
  begin
   edit4.Text := form_employee.ADOQuery1.FieldValues['empl_code'];
   edit4.Font.Color := clwindowtext;
   label12.Caption := form_employee.ADOQuery1.fieldvalues['employee_name'];
   dm.ADO68BUYER_PTR.Value := form_employee.ADOQuery1.FieldValues['rkey'];
  end
 else
  begin
   messagedlg('采购人员代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label12.Caption := '';
   edit4.SetFocus;
  end;
 finally
  form_employee.Free;
 end
else
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'BitBtn7')
   and (trim(edit4.Text)='') then
 begin
   label12.Caption := '';
   dm.ADO68BUYER_PTR.AsVariant := null;
 end;

end;

procedure TForm2.Edit3Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'BitBtn6')
   and (trim(edit3.Text)<>'') then
 try
  form_budget:=tform_budget.Create(application);
  form_budget.ADOQuery1.Close;
  form_budget.ADOQuery1.Parameters[1].Value:=spinedit1.Value;
  form_budget.ADOQuery1.Parameters[2].Value:=dm.ADO68USER_PTR.Value;
  form_budget.ADOQuery1.Open;
  form_budget.Edit1.Text := trim(edit3.Text);
 if comparetext(trim(edit3.text),trim(form_budget.ADOQuery1.Fieldbyname('code').AsString))=0 then
   begin
    edit3.Text := form_budget.ADOQuery1.FieldValues['code'];
    edit3.Font.Color := clwindowtext;
    label11.Caption := form_budget.ADOQuery1.FieldValues['description'];
    edit8.Text := formatfloat('0.000',
    form_budget.ADOQuery1.fieldvalues['budget_period_'+inttostr(spinedit2.Value)]-
    form_budget.ADOQuery1.fieldvalues['used_period_'+inttostr(spinedit2.Value)]);
    DM.ADO68budget_ptr.Value := form_budget.ADOQuery1rkey.Value;
    spinedit1.Enabled := false;
    spinedit2.Enabled := false;
    button1.Enabled := true;
   end
 else
  begin
   messagedlg('授权代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label11.Caption := '';
   edit3.SetFocus;
  end;
 finally
  form_budget.Free;
 end
else
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'BitBtn6')
   and (trim(edit3.Text)='') then
 begin
  spinedit1.Enabled := true;
  spinedit2.Enabled := true;
  button1.Enabled := false;
  edit8.Text:='0.000';
 end;
end;

procedure TForm2.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'BitBtn4')
   and (trim(edit1.Text)<>'') then
 try
  form_wh:=tform_wh.Create(application);
  form_wh.Edit1.Text := trim(edit1.Text);
 if comparetext(trim(edit1.text),trim(form_wh.ADOQuery1.Fieldbyname('warehouse_code').AsString))=0 then
  begin
   edit1.Text := form_wh.ADOQuery1.FieldValues['warehouse_code'];
   edit1.Font.Color := clwindowtext;
   label9.Caption := form_wh.ADOQuery1.fieldvalues['warehouse_name'];
   dm.ADO68WHSE_PTR.Value := form_wh.ADOQuery1.FieldValues['rkey'];
   warehouse_type := trim(form_wh.ADOQuery1warehouse_type.Value);
  end
 else
  begin
   messagedlg('仓库代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label9.Caption := '';
   edit1.SetFocus;
  end;
 finally
  form_wh.Free;
 end;
end;

procedure TForm2.N5Click(Sender: TObject);
var
 v_total:single;
begin
 try
  v_total := dm.ADO204QUANTITY_REQUIRED.Value*dm.ADO204tax_PRICE.Value*dm.ADO204base_to.Value;
  dm.ADO204.Edit;
  form4:=tform4.Create(application);
  form4.Edit1.Text := dm.ADO204supp_code.Value;
  form4.Edit1.Font.Color := clwindowtext;
  form4.Label3.Caption := dm.ADO204supp_name.Value;
  form4.MaskEdit1.Text := dm.ADO204REQ_DATE.AsString;
  if dm.ADO204reply_date.AsVariant <> null then
   form4.MaskEdit2.Text := dm.ADO204reply_date.AsString
  else
   form4.MaskEdit2.Text := dm.ADO204REQ_DATE.AsString;

  form4.Edit2.Text := dm.ado204unit_code.value;
  form4.Edit2.Font.Color := clwindowtext;
  form4.Label10.Caption := dm.ADO204UNIT_NAME.Value;
  if form4.ShowModal=mrok then
   begin
     dbedit3.Field.Value := dbedit3.Field.Value-v_total+
       dm.ADO204QUANTITY_REQUIRED.Value*dm.ADO204tax_PRICE.Value*dm.ADO204base_to.Value;
    dm.ADO204.Post;
   end;
 finally
  form4.free;
 end;
end;

procedure TForm2.N4Click(Sender: TObject);
var
 bk:tbookmark;
begin
if trim(edit1.Text)='' then
 begin
  messagedlg('请输入正确的工厂代码!',mtinformation,[mbcancel],0);
  edit1.SetFocus;
  exit;
 end;
 bk:=dm.ADO204.GetBookmark();
 dm.ADO204.Append;
 dm.ADO204QUANTITY_REQUIRED.Value := 0;
 dm.ADO204UNIT_PRICE.Value := 0;
 dm.ADO204tax_price.Value := 0;
 dm.ADO204PURCHASE_REQ_PTR.Value := dm.ADO68RKEY.Value; //给主表指针赋值
 try
  form4:=tform4.Create(application);
  form4.MaskEdit1.Text := datetimetostr(self.v_sysdate);
  form4.MaskEdit2.Text := form4.MaskEdit1.Text;
 if form4.ShowModal = mrok then
  begin
   bitbtn4.Enabled := false;   //工厂不可重新选择
   edit1.Enabled := false;
   dm.ADO68TOTAL.Value:=dm.ADO68TOTAL.Value+     //计算总计金额
   dm.ADO204QUANTITY_REQUIRED.Value*dm.ADO204tax_PRICE.Value*dm.ADO204base_to.Value;
   dm.ADO204.Post;
  end
 else
  dm.ADO204.GotoBookmark(bk);
 finally
  form4.Free;
  dm.ado204.FreeBookmark(bk);
 end;
end;

procedure TForm2.N6Click(Sender: TObject);
begin
 dbedit3.Field.Value :=dbedit3.Field.Value-
     dm.ADO204QUANTITY_REQUIRED.Value*dm.ADO204tax_PRICE.Value*dm.ADO204base_to.Value;

if dm.Ado204RKEY.AsVariant <> null then
 begin
  stringgrid1.Cells[0,stringgrid1.RowCount-1] := dm.ADO204DESCRIPTION_1.AsString;
  stringgrid1.Cells[1,stringgrid1.RowCount-1] := dm.ADO204GUI_GE.AsString;
  stringgrid1.Cells[2,stringgrid1.RowCount-1] := dm.ADO204DESCRIPTION_2.AsString;
  stringgrid1.Cells[3,stringgrid1.RowCount-1] := dm.ADO204SUPPLIER_PTR.AsString;
  stringgrid1.Cells[4,stringgrid1.RowCount-1] := dm.ADO204PO_LINK_PTR.AsString;
  stringgrid1.Cells[5,stringgrid1.RowCount-1] := dm.ADO204G_L_PTR.AsString;
  stringgrid1.Cells[6,stringgrid1.RowCount-1] := dm.ADO204QUANTITY_REQUIRED.AsString;
  stringgrid1.Cells[7,stringgrid1.RowCount-1] := dm.ADO204UNIT_PRICE.AsString;
  stringgrid1.Cells[8,stringgrid1.RowCount-1] := dm.ADO204TAX_FLAG.AsString;
  stringgrid1.Cells[9,stringgrid1.RowCount-1] := dm.ADO204REQ_DATE.AsString;
  stringgrid1.Cells[10,stringgrid1.RowCount-1] := dm.ADO204o_i_flag.AsString;
  stringgrid1.Cells[11,stringgrid1.RowCount-1] := dm.ADO204reply_date.AsString;
  stringgrid1.Cells[12,stringgrid1.RowCount-1] := dm.ADO204reason.AsString;
  stringgrid1.Cells[13,stringgrid1.RowCount-1] := dm.ADO204tax.AsString;
  stringgrid1.Cells[14,stringgrid1.RowCount-1] := dm.ADO204tax_price.AsString;
  stringgrid1.Cells[15,stringgrid1.RowCount-1] := dm.ADO204rohs.AsString;  
  stringgrid1.RowCount:=stringgrid1.RowCount+1;
 end;


 dm.ado204.Delete;
 if dm.ADO204.IsEmpty then
  begin
   bitbtn4.Enabled :=true;
   edit1.Enabled:=true;
  end;
end;

procedure TForm2.DBGrid2DblClick(Sender: TObject);
begin
 if (not dm.ADO204.IsEmpty) and (bitbtn1.Visible=true) then
  n5click(sender);
end;

procedure TForm2.PopupMenu2Popup(Sender: TObject);
begin
 if dm.ADO204.IsEmpty then
  begin
   n5.Enabled := false;
   n6.Enabled := false;
  end
 else
  begin
   n5.Enabled := true;
   n6.Enabled := true;
   if dm.ADO204RKEY.AsVariant = null then
    n6.Caption := '删除请求'
   else
    n6.Caption := '单项退回';
  end;
end;

procedure TForm2.BitBtn1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if (dm.ADO68FLAG.Value ='S') then
  begin
   if dm.ADO69.IsEmpty then
    begin
     messagedlg('至少需要一项标准采购请求!',mtinformation,[mbcancel],0);
     dbgrid1.SetFocus;
     exit;
    end
   else
    if self.find_std_error() then //如果找到供应商相同而采购地点不同
     begin
      messagedlg('在同一次请购中不能有供应商相同,而地点不同的请购!',mtinformation,[mbcancel],0);
      dbgrid1.SetFocus;
      exit;
     end;
  end
 else            //如果是杂项请购
  if dm.ADO204.IsEmpty then
   begin
    messagedlg('至少需要一项杂项采购请求!',mtinformation,[mbcancel],0);
    dbgrid2.SetFocus;
    exit;
   end
  else
   if self.find_mis_error() then
    begin
     messagedlg('在同一次请购中不能有供应商相同,而采购地点不同的请购!',mtinformation,[mbcancel],0);
     dbgrid2.SetFocus;
     exit;
    end;

if trim(edit1.Text)='' then
 begin
  messagedlg('请输入正确的工厂代码!',mtinformation,[mbcancel],0);
  edit1.SetFocus;
  exit;
 end;
if trim(edit2.Text)='' then
 begin
  messagedlg('请输入正确的授权代码!',mtinformation,[mbcancel],0);
  edit2.SetFocus;
  exit;
 end;
if trim(edit3.Text)='' then
 begin
  messagedlg('请输入正确的预算代码!',mtinformation,[mbcancel],0);
  edit3.SetFocus;
  exit;
 end;
if trim(edit5.Text)='' then
 begin
  messagedlg('请输入正确的需求用户!',mtinformation,[mbcancel],0);
  edit5.SetFocus;
  exit;
 end;

if spinedit1.Value<  v_year then
 begin
  messagedlg('使用预算年度不能少于当前年度!',mterror,[mbcancel],0);
  edit3.SetFocus;
  exit;
 end;

if strtofloat(edit8.Text)<dbedit3.Field.Value then
 begin
  messagedlg('对不起!请购的总值超过了请购人员的可用预算!',mterror,[mbcancel],0);
  if dbgrid1.Visible=true then
   dbgrid1.SetFocus
   else
   dbgrid2.SetFocus;
  exit;
 end;

end;

procedure TForm2.BitBtn4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  form_wh:=tform_wh.Create(application);
  form_wh.Edit1.Text := trim(edit1.Text);
  if form_wh.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到相关记录!',mtinformation,[mbok],0);
    edit1.SetFocus;
   end
  else
  if form_wh.ShowModal=mrok then
   begin
    edit1.Text := form_wh.ADOQuery1.fieldvalues['warehouse_code'];
    edit1.Font.Color := clwindowtext;
    label9.Caption := form_wh.ADOQuery1.fieldvalues['warehouse_name'];
    dm.ADO68WHSE_PTR.Value := form_wh.ADOQuery1.FieldValues['rkey'];
    warehouse_type := trim(form_wh.ADOQuery1warehouse_type.Value);
    edit5.SetFocus;
   end
  else
   edit1.SetFocus;
end;

procedure TForm2.BitBtn9Click(Sender: TObject);
begin
 close;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if v_close<>1 then //非正常退出
 begin
  if (dm.ADO68FLAG.Value ='S') or (dm.ADO68FLAG.Value ='T') then
   dm.ADO69.CancelBatch()
  else
   dm.ADO204.CancelBatch();
  dm.ADO68.Cancel;
  dm.ADO6811.Close;
 end;
end;

procedure TForm2.Button1Click(Sender: TObject);
var
 i:byte;
 year_total,used_total:real;
begin
year_total:=0;
used_total:=0;
form5:=tform5.Create(application);
form5.Edit1.Text:=edit3.Text;
with dm.ADOQuery2 do
 begin
  active := false;
  sql.Clear;
  sql.Add('select * from data0362');
  sql.Add('where rkey='+dm.ADO68budget_ptr.AsString);
  active := true;
  for i:=1 to 12 do
   begin
    form5.editor1.Cells[1,i] := formatfloat('0.00',FieldValues['BUDGET_PERIOD_'+inttostr(i)]);
    form5.editor1.Cells[2,i] := formatfloat('0.00',FieldValues['USED_PERIOD_'+inttostr(i)]);
    year_total:=year_total+FieldValues['BUDGET_PERIOD_'+inttostr(i)];
    used_total:=used_total+FieldValues['USED_PERIOD_'+inttostr(i)];
   end;
  form5.editor1.cells[1,13] := formatfloat('0.00',year_total);
  form5.editor1.cells[2,13] := formatfloat('0.00',used_total);
 end;

form5.ShowModal;
form5.free;
end;

procedure TForm2.save_budget();
begin
 with dm.ADO362 do
  begin
   close;
   Parameters[0].Value := budget_ptr;
   open;
   edit;
   fieldvalues['used_period_'+inttostr(v_usedmonth)]:=formatfloat('0.00',
       fieldvalues['used_period_'+inttostr(v_usedmonth)]-v_total);
   post;
  end;
 with dm.ADO362 do
  begin
   close;
   Parameters[0].Value := dm.ADO68budget_ptr.Value;
   open;
   edit;
   fieldvalues['used_period_'+inttostr(spinedit2.Value)]:=formatfloat('0.00',
       fieldvalues['used_period_'+inttostr(spinedit2.Value)]+
       dm.ADO68TOTAL.Value);
   post;
  end;
end;

procedure TForm2.MaskEdit2Exit(Sender: TObject);
begin
 try
  strtodate(maskedit2.Text);
 except
  messagedlg('日期格式输入不正确,请重新输入!',mtwarning,[mbok],0);
  maskedit2.SetFocus;
 end;
end;

procedure TForm2.BitBtn4Exit(Sender: TObject);
begin
 form_wh.free;
end;

procedure TForm2.BitBtn8Click(Sender: TObject);
begin
if trim(edit1.Text)='' then
 begin
  messagedlg('请首先输入工厂信息!',mtinformation,[mbok],0);
  edit1.SetFocus;
  abort;
 end
else
 try
  form_csi:=Tform_csi.Create(application);
  form_csi.Edit1.Text := trim(edit5.Text);
  if form_csi.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找符合条件的记录!',mtwarning,[mbok],0);
    edit5.SetFocus;
   end
  else
  if form_csi.ShowModal=mrok then
   begin
    edit5.Text := form_csi.adoquery1user_id.Value;
    edit5.Font.Color := clwindowtext;
    label7.Caption := form_csi.adoquery1user_full_name.Value;
    dm.ADO68USER_PTR.Value := form_csi.adoquery1rkey.Value; //需求系统用户
    dm.ADO68REQ_BY.Value := form_csi.adoquery1employee_ptr.Value; //员工指针
    dm.ADO68DEPARTMENT_NAME.Value := form_csi.adoquery1DEPT_CODE.Value;
    maskedit1.Text := self.pr_number(warehouse_type);
    edit2.Text := '';
    edit2.Font.Color := clblue;
    label10.Caption :='';
    form_auth := tform_auth.Create(application);
    if form_auth.ADOQuery1.RecordCount=1 then
    begin
     edit2.Text := form_auth.ADOQuery1.FieldValues['code'];
     edit2.Font.Color := clwindowtext;
     label10.Caption := form_auth.ADOQuery1.fieldvalues['PURCHASE_APPROV_DESC'];
     dm.ADO68AUTH_TYPE.Value := form_auth.ADOQuery1.FieldValues['rkey'];
    end;
   form_auth.free;
   edit4.SetFocus;
  end
  else
   edit5.SetFocus;
 finally
  form_csi.free;
 end;
end;

procedure TForm2.Edit5Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'BitBtn8')
   and (trim(edit5.Text)<>'') then
 try
  form_csi:=tform_csi.Create(application);
  form_csi.Edit1.Text := trim(edit5.Text);
 if comparetext(trim(edit5.text),trim(form_csi.adoquery1user_id.Value))=0 then
  begin
   edit5.Text := form_csi.adoquery1user_id.Value;
   edit5.Font.Color := clwindowtext;
   label7.Caption := form_csi.adoquery1user_full_name.Value;
   dm.ADO68USER_PTR.Value := form_csi.adoquery1rkey.Value; //需求系统用户
   dm.ADO68REQ_BY.Value := form_csi.adoquery1employee_ptr.Value; //员工指针
   dm.ADO68DEPARTMENT_NAME.Value := form_csi.adoquery1DEPT_CODE.Value;
   maskedit1.Text := self.pr_number(warehouse_type);
   edit2.Text := '';
   edit2.Font.Color := clblue;
   label10.Caption :='';
   form_auth:=tform_auth.Create(application);
   if form_auth.ADOQuery1.RecordCount=1 then
    begin
     edit2.Text := form_auth.ADOQuery1.FieldValues['code'];
     edit2.Font.Color := clwindowtext;
     label10.Caption := form_auth.ADOQuery1.fieldvalues['PURCHASE_APPROV_DESC'];
     dm.ADO68AUTH_TYPE.Value := form_auth.ADOQuery1.FieldValues['rkey'];
    end;
   form_auth.free;
  end
 else
  begin
   messagedlg('系统用户代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label7.Caption := '';
   edit5.SetFocus;
  end;
 finally
  form_csi.Free;
 end;
end;

function Tform2.find_std_error():boolean;
var
 std_number:array of array of integer;
 i,j,i_j:byte;
begin
 find_std_error:=false; //开始标识为没有错误
if (dm.ADO69.RecordCount>=2) then
 begin
 dm.ADO69.First;
 setlength(std_number,dm.ADO69.RecordCount,2);//设置数组下标个数
 dbgrid1.DataSource.DataSet.DisableControls;
 i_j:=0;
 while not dm.ADO69.Eof do
  begin
   std_number[i_j,0]:=dm.ADO69SUPP_PTR.Value;
   std_number[i_j,1]:=dm.ADO69o_i_flag.Value;
   inc(i_j);
   dm.ADO69.Next;
  end;
 dm.ADO69.First;
 dbgrid1.DataSource.DataSet.EnableControls;
 for i:=0 to dm.ADO69.RecordCount-2 do  //检查内部新增是否重复
  for j:=i+1 to dm.ADO69.RecordCount-1 do
  if (std_number[i,0]=std_number[j,0]) and (std_number[i,1]<>std_number[j,1]) then
   begin
    find_std_error:=true;
    break;
   end;
 end;
end;

function tform2.find_mis_error():boolean;
var
 std_number:array of array of integer;
 i,j,i_j:byte;
begin
 find_mis_error:=false; //开始标识为没有错误
 if (dm.ADO204.RecordCount>=2) then
  begin
   dm.ADO204.First;
   setlength(std_number,dm.ADO204.RecordCount,2);//设置数组下标个数
   dbgrid2.DataSource.DataSet.DisableControls;
   i_j:=0;
   while not dm.ADO204.Eof do
   begin
   std_number[i_j,0]:=dm.ADO204SUPPLIER_PTR.Value;
   std_number[i_j,1]:=dm.ADO204o_i_flag.Value;
   inc(i_j);
   dm.ADO204.Next;
   end;
   dm.ADO204.First;
   dbgrid2.DataSource.DataSet.EnableControls;
   for i:=0 to dm.ADO204.RecordCount-2 do  //检查内部新增是否重复
   for j:=i+1 to dm.ADO204.RecordCount-1 do
   if (std_number[i,0]=std_number[j,0]) and (std_number[i,1]<>std_number[j,1]) then
    begin
     find_mis_error:=true;
     break;
    end;
  end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if dm.ADO28.Active = true then dm.ADO28.Close;
end;


function  tform2.pr_number(ware_type:string):string;
var
 pr:string;
 pr_req:integer;
begin
 pr := ware_type+trim(form_csi.adoquery1pr_id.Value);//工厂及部门前缀
 if length(pr) >= 1 then pr := pr+'-';                              //分隔符

 pr := pr+copy(inttostr(self.v_year),3,2);  //年度

 if length(inttostr(self.v_month)) < 2 then
  pr := pr+'0'+inttostr(self.v_month)
 else
  pr := pr+inttostr(self.v_month);          //月份

 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select top 1 po_req_number from data0068');
   sql.Add('where po_req_number like '''+pr+'%''');
   sql.Add('order by po_req_number desc');
   open;
  end;

 if dm.ADOQuery1.IsEmpty then
  begin
   pr:=pr+'0001';
  end
 else
  begin
   pr_req := strtoint(copy(dm.ADOQuery1.fieldvalues['po_req_number'],
   length(trim(pr))+1,4));
   pr_req :=10000+pr_req+1;
   pr:=pr+copy(inttostr(pr_req),2,4);
  end;
 pr_number := pr;
end;

procedure TForm2.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
if trim(edit1.Text)='' then
 begin
  messagedlg('请首先输入工厂信息!',mtinformation,[mbok],0);
  edit1.SetFocus;
  abort;
 end;
end;

procedure Tform2.return_req(pr_number:string);
var
 i,id,j:word;
 total:double;
begin
 if (dm.ADO68CURRENY_PTR.Value=1) or (dm.ADO68CURRENY_PTR.Value=2) then
  with dm.ADOQuery1 do  //从新单拆分,但不代表第一次拆分
   begin
    close;
    sql.Clear;
    sql.Add('select po_req_number,CURRENY_PTR from data0068');
    sql.Add('where po_req_number like '''+pr_number+'%''');
    sql.Add('order by po_req_number desc');
    open;
   end
 else                        //从被拆下的单再次拆分也可能是第一次拆分
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select po_req_number,CURRENY_PTR from data0068');
    sql.Add('where po_req_number like '''+copy(pr_number,1,
    length(pr_number)-1)+'%''');
    sql.Add('order by po_req_number desc');
    open;
   end;

  dm.ADOAP68.Open;
  dm.ADOAP68.Append;
  for i:=2 to 24 do
   dm.ADOAP68.fieldvalues[dm.ADOap68.Fields[i].FieldName]:=
   dm.ADO68.fieldvalues[dm.ADO68.Fields[i].FieldName];

  if trim(dm.ADOQuery1.FieldValues['po_req_number'])=pr_number then//第一次拆分
   if (dm.ADOQuery1.FieldValues['CURRENY_PTR']=1) or (dm.ADOQuery1.FieldValues['CURRENY_PTR']=2) then
    dm.ADOAP68PO_REQ_NUMBER.Value := pr_number+'R1'
   else
    begin
     id := strtoint(copy(pr_number,length(pr_number),1))+1;
     dm.ADOAP68PO_REQ_NUMBER.Value := copy(pr_number,1,length(pr_number)-1)+inttostr(id);
    end
  else             //再次拆分
   begin
    id := strtoint(copy(dm.ADOQuery1.fieldvalues['po_req_number'],
                   length(trim(dm.ADOQuery1.fieldvalues['po_req_number'])),1))+1;
    dm.ADOAP68PO_REQ_NUMBER.Value := copy(dm.ADOQuery1.fieldvalues['po_req_number'],1,
                                   length(trim(dm.ADOQuery1.fieldvalues['po_req_number']))-1)+inttostr(id);
   end;
  dm.ADOAP68.Post;

  total:=0;
  if dbgrid1.Visible = true then
   with dm.AP69204 do
    begin
     close;
     sql.Clear;
     sql.Add('select * from data0069');
     sql.Add('where purch_req_ptr = '+dm.ADOAP68RKEY.AsString);
     open;
    end
  else
   with dm.AP69204 do
    begin
     close;
     sql.Clear;
     sql.Add('select * from data0204');
     sql.Add('where purchase_req_ptr='+dm.ADOAP68RKEY.AsString);
     open;
    end;

   if dbgrid1.Visible = true then
    for i:=1 to stringgrid1.RowCount-2 do
     begin
      dm.AP69204.Append;
      dm.AP69204.FieldValues['purch_req_ptr']:=dm.ADOAP68RKEY.Value;
      for j:=1 to 17 do
      dm.AP69204.FieldByName(dm.AP69204.Fields[j+1].fieldname).asstring:=stringgrid1.Cells[j-1,i];
      dm.AP69204.Post;
      if dm.AP69204.FieldValues['po_link_ptr'] <> null then //如果被拆分的订单中确定了货币
       with dm.ADOQuery2 do
        begin
         close;
         sql.Clear;
         sql.Add('select BASE_TO_OTHER from data0001');
         sql.Add('where rkey='+dm.AP69204.fieldbyname('po_link_ptr').AsString);
         open;
         total:=total+dm.AP69204.FieldValues['QUANTITY']*dm.AP69204.FieldValues['UNIT_PRICE']*FieldValues['BASE_TO_OTHER'];
        end;
     end
   else
    for i:=1 to stringgrid1.RowCount-2 do
     begin
      dm.AP69204.Append;
      dm.AP69204.FieldValues['purchase_req_ptr']:=dm.ADOAP68RKEY.Value;
      for j:=1 to 16 do
      dm.AP69204.FieldByName(dm.AP69204.Fields[j+1].fieldname).asstring:=stringgrid1.Cells[j-1,i];
      dm.AP69204.Post;
      if dm.AP69204.FieldValues['po_link_ptr'] <> null then //如果被拆分的订单中确定了货币
       with dm.ADOQuery2 do
        begin
         close;
         sql.Clear;
         sql.Add('select BASE_TO_OTHER from data0001');
         sql.Add('where rkey='+dm.AP69204.fieldbyname('po_link_ptr').AsString);
         open;
         total:=total+dm.AP69204.FieldValues['QUANTITY_REQUIRED']*dm.AP69204.FieldValues['UNIT_PRICE']*FieldValues['BASE_TO_OTHER'];
        end;
     end;

   dm.ADOAP68.Edit;
   dm.ADOAP68TOTAL.Value := total;
   dm.ADOAP68CURRENY_PTR.Value :=3; // 表示采购部拆分新增
   dm.ADOAP68.Post;
   new_prnumber:=dm.ADOAP68PO_REQ_NUMBER.Value;
end;

procedure TForm2.N7Click(Sender: TObject);
begin
 try
  form3:=tform3.Create(application);
  form3.edit1.Text := form2.Edit1.Text + form2.Label9.Caption;

  form3.Edit2.Text := trim(dm.ADO69inv_number.Value);
  form3.Edit2.Font.Color := clwindowtext;
  form3.label8.Caption := dm.ADO69inv_part_number.Value+dm.ADO69inv_part_description.Value;
  form3.MaskEdit1.Text := dm.ADO69REQ_DATE.AsString;
  form3.Button1.Visible := false;
  form3.Button2.Visible := false;
  form3.Button3.Visible := true;
  form3.Edit3.Text := dm.ADO69supplier_code.Value;
  form3.Label9.Caption := dm.ADO69supplier_name.Value;
  form3.MaskEdit2.Text := dm.ADO69reply_date.AsString;
  with form3 do
   begin
    edit2.Enabled := false;
    bitbtn3.Enabled := false;
    bitbtn4.Enabled := false;
    dbedit1.Enabled := false;
    dbedit2.Enabled := false;
    dbedit5.enabled := false;
    dbedit6.enabled := false;
    dbedit7.Enabled := false;
    maskedit1.Enabled := false;
    maskedit2.Enabled := false;
    edit3.Enabled := false;
    dbradiogroup1.Enabled := false;
   end;
  form3.ShowModal;
 finally
  form3.free;
 end;
end;

procedure TForm2.N8Click(Sender: TObject);
begin
 try
  form4:=tform4.Create(application);
  form4.MaskEdit1.Text := dm.ADO204REQ_DATE.AsString;
  form4.MaskEdit2.Text := dm.ADO204reply_date.AsString;
  form4.Edit2.Text:=dm.ADO204UNIT_CODE.Value;
  form4.Label10.Caption:=dm.ADO204UNIT_NAME.Value;
  form4.Edit1.Text := dm.ADO204supp_code.Value;
  form4.Label3.Caption := dm.ADO204supp_name.Value;
   with form4 do
    begin
     button1.Visible := false;
     button2.Visible := false;
     button3.Visible := true;
     button4.Enabled := false;     
     dbedit1.Enabled := false;
     dbedit2.Enabled := false;
     dbcombobox1.Enabled := false;
     dbedit3.Enabled := false;
     dbedit4.Enabled := false;
     dbedit5.Enabled := false;
     maskedit1.Enabled := false;
     maskedit2.Enabled := false;
     edit1.Enabled := false;
     bitbtn3.Enabled := false;
     bitbtn1.Enabled := false;
     edit2.Enabled := false;
     dbradiogroup1.Enabled := false;
     dbedit6.Enabled:=false;
    end;
  form4.ShowModal;
 finally
  form4.free;
 end;
end;

end.
