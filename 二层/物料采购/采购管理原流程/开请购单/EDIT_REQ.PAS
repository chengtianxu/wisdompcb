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
    Label8: TLabel;
    MaskEdit1: TMaskEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    DBEdit2: TDBEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    MaskEdit2: TMaskEdit;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Label17: TLabel;
    Edit8: TEdit;
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
    Label5: TLabel;
    PopupMenu3: TPopupMenu;
    PopupMenu4: TPopupMenu;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
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
    function  pr_number(WAREHOUSETYPE:string):string;
    function  get_newnumber(pr_number:string):string;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
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
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    { Private declarations }
   v_close:byte; //正常退出标识
   v_Date:shortstring;  //系统日期短格式
   v_sysdate:tdatetime;
   budget_ptr:integer;  //预算指针
   v_year,v_month,v_usedmonth:word; //系统年度月份
  public
    { Public declarations }
   ware_type:string;
  end;

var
  Form2: TForm2;
  requ_note: tstringlist;
implementation
 uses damo, warehouse_search, auth_search,
  budget_search, note, addedit_requ, main, addedit_m, budget_ximu;
{$R *.dfm}

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
 if (dm.ADO68FLAG.Value ='S') or (dm.ADO68FLAG.Value = 'T') then
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
 if dm.ADO68PO_REQ_NUMBER.AsVariant <> null then //编辑或者是检查
  maskedit1.Text := trim(DM.ADO68PO_REQ_NUMBER.Value);
//==============================================================================
 with dm.ADO6811 do              //新增时ado6811为空记录
  begin           //查找记事本
   if active = true then active := false;
   Parameters[0].Value := dm.ADO68rkey.Value;
   active := true;
   if not isempty then
   for i := 1 to 4 do
    if Fieldbyname('NOTE_PAD_LINE_'+inttostr(i)).AsString<>'' then
    requ_note.Add(Fieldbyname('NOTE_PAD_LINE_'+inttostr(i)).AsString);
  end;
//==============================================================================
if label18.Caption='0' then      //新建,编辑,栓查(不是复制)
 if (dm.ADO68FLAG.Value='S') or (dm.ADO68FLAG.Value='T') then   //如复制就不激活因为之前已经激活
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
else    //复制需给编号重新赋值
 begin
  maskedit1.Text := self.pr_number(self.ware_type);
 end;
//==============================================================================
end;

procedure TForm2.FormShow(Sender: TObject);
begin
label5.Caption:=form1.dept_name;
 with dm.ADOQuery1 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select getdate() as v_dt,year(getdate()) as v_year,month(getdate()) as v_month');
   active:=true;   //读取系统时间
   v_date:=datetostr(fieldvalues['v_dt']);
   v_year:=fieldvalues['v_year'];       //年
   v_month:=fieldvalues['v_month'];     //月
   v_sysdate:=fieldvalues['v_dt'];
  end;
 if dm.ADO68.State=dsedit then //编辑状态
  begin
   with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.add('select warehouse_code,warehouse_name,');
    sql.Add('data0094.code,PURCHASE_APPROV_DESC');
    sql.Add('from data0068,data0015,data0094');
    sql.Add('where data0068.whse_ptr=data0015.rkey and');
    sql.Add('data0068.auth_type=data0094.rkey and');
    sql.Add('data0068.rkey='+dm.ADO68RKEY.AsString);
    active:=true;
    edit1.Text := fieldvalues['warehouse_code'];
    label9.Caption := fieldvalues['warehouse_name'];
    edit2.Text := fieldvalues['code'];   //审批代码
    label10.Caption := fieldvalues['PURCHASE_APPROV_DESC'];
    edit1.Font.Color := clwindowtext;
    edit2.Font.Color := clwindowtext;
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
     spinedit1.Value := dm.ADO68v_year.Value;     //预算年度
     spinedit2.Value := dm.ADO68v_month.Value;    //使用预算月份
     spinedit1.Enabled := false;
     spinedit2.Enabled := false;
     edit8.Text := formatfloat('0.000',         //找出已前的预算
                   fieldvalues['budget_period_'+inttostr(spinedit2.Value)]-
                   fieldvalues['used_period_'+inttostr(spinedit2.Value)]);
    end;
   maskedit2.Text := v_date;
   budget_ptr := dm.ADO68budget_ptr.Value;
   v_usedmonth := dm.ADO68v_month.Value;
  end
 else
  if dm.ADO68.State=dsinsert then   //如果是新增状态
   begin
    maskedit2.Text := v_date;
    spinedit1.Value:=v_year;
    spinedit2.Value:=v_month;

    form_auth:=tform_auth.Create(application);
    if form_auth.ADOQuery1.RecordCount=1 then //如果只有一版条审批代码指针
    begin
     edit2.Text := form_auth.ADOQuery1.FieldValues['code'];
     edit2.Font.Color := clwindowtext;
     label10.Caption := form_auth.ADOQuery1.fieldvalues['PURCHASE_APPROV_DESC'];
     dm.ADO68AUTH_TYPE.Value := form_auth.ADOQuery1.FieldValues['rkey'];
    end;
    form_auth.free;

    form_budget:=tform_budget.Create(application);
    form_budget.ADOQuery1.Close;
    form_budget.ADOQuery1.Parameters[1].Value:=spinedit1.Value;
    form_budget.ADOQuery1.Parameters[2].Value:=dm.ADO68USER_PTR.Value;
    form_budget.ADOQuery1.Open;
    if form_budget.ADOQuery1.RecordCount = 1 then
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
    end;
    form_budget.free;

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
      edit3.Text := fieldvalues['code']; //预算代码
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
  end
 else
  edit2.SetFocus;
finally
 form_auth.free;
end;
end;

procedure TForm2.Edit2Click(Sender: TObject);
begin
IF edit2.Font.Color=clwindowtext then
 begin
  edit2.Font.Color :=clblue;
  edit2.SelectAll;
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
  edit_note := tedit_note.Create(application);
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
 if edit_note.ShowModal = mrok then
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
begin
if edit1.Font.Color=clblue then
 begin
  messagedlg('请输入正确的仓库代码!',mtinformation,[mbcancel],0);
  edit1.SetFocus;
 end
else
 try
  dm.ADO69.Edit;
  form3:=tform3.Create(application);
  form3.Edit2.Text := trim(dm.ADO69inv_number.Value);
  form3.Edit2.Font.Color := clwindowtext;
  form3.label8.Caption := dm.ADO69inv_part_number.Value+dm.ADO69inv_part_description.Value;
  form3.MaskEdit1.Text := dm.ADO69REQ_DATE.AsString;
  form3.if_a_e:=1;
  if form3.ShowModal=mrok then
   begin
    dm.ADO69.Post;
   end;
 finally
  form3.free;
 end;
end;

procedure TForm2.Edit1Click(Sender: TObject);
begin
IF edit1.Font.Color=clwindowtext then
 begin
  edit1.Font.Color :=clblue;
  edit1.SelectAll;
 end;
end;

procedure TForm2.N1Click(Sender: TObject);
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
 dm.ADO69PURCH_REQ_PTR.Value := dm.ADO68RKEY.Value; //给主表指针赋值
 try
  form3 := tform3.Create(application);
  form3.MaskEdit1.Text := datetimetostr(self.v_sysdate);
  form3.if_a_e := 0;
  if form3.ShowModal = mrok then
   begin
    dm.ADO69.Post;
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
     if requ_note.Count>=i then
      dm.ADO6811.FieldValues['NOTE_PAD_LINE_'+inttostr(i)] := requ_note.Strings[i-1]
     else
      dm.ADO6811.FieldValues['NOTE_PAD_LINE_'+inttostr(i)] :='';
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
     FieldValues['file_pointer']:= dm.ADO68RKEY.Value;
     FieldValues['source_type']:= 68;
     for i:=1 to requ_note.Count do
      FieldValues['NOTE_PAD_LINE_'+inttostr(i)] := requ_note.Strings[i-1];
     post;
    end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
//==============================================================================
 dm.ADOConnection1.BeginTrans;//起用事物处理
 dm.ADO68STATUS.Value := 7;   //未授理
 dm.ADO68REQ_DATE.AsString := maskedit2.Text;   //请购日期
 dm.ADO68v_year.Value := spinedit1.Value;       //预算年度
 dm.ADO68v_month.Value := spinedit2.Value;      //预算月份
if dm.ADO68.State = dsedit then //如果是编辑状态
 begin    //开始编辑
  self.save_note;               //保存记事本
  try
   dm.ADO68.Post;
   if (dm.ADO68FLAG.Value ='S') or (dm.ADO68FLAG.Value = 'T') then
    dm.ADO69.UpdateBatch()      //保存标准请购条目
   else
    dm.ADO204.UpdateBatch();    //保存杂项请购条目
   dm.ADOConnection1.CommitTrans;
   v_close:=1;
   ModalResult:=mrok;
  except
   dm.ADOConnection1.RollbackTrans;
   maskedit1.SetFocus;
  end;
 end      //结束编辑
else
 begin  //开始新增
  try
   dm.ADO68PO_REQ_NUMBER.Value :=get_newnumber(trim(maskedit1.Text));//请购编号
   dm.ADO68.Post;
//==============================================================================
  self.save_note();      //保存记事本
//==============================================================================
 if (dm.ADO68FLAG.Value ='S') or (dm.ADO68FLAG.Value = 'T') then //如果是新增标准请求
  begin
   dm.ADO69.First;
   while not dm.ADO69.Eof do
    begin
     dm.ADO69.Edit;
     dm.ADO69PURCH_REQ_PTR.Value := dm.ADO68RKEY.Value;
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
//==============================================================================
end;   {结束新增功能}

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
 end
else
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'BitBtn5')
   and (trim(edit2.Text)='') then
 label10.Caption:='';
end;

procedure TForm2.Edit5Exit(Sender: TObject);
begin
{if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'BitBtn8')
   and (trim(edit5.Text)<>'') then
 try
  form_curr:=tform_curr.Create(application);
  form_curr.Edit1.Text := trim(edit5.Text);
 if comparetext(trim(edit5.text),trim(form_curr.ADOQuery1.Fieldbyname('curr_code').AsString))=0 then
  begin
   edit5.Text := form_curr.ADOQuery1.FieldValues['curr_code'];
   edit5.Font.Color := clwindowtext;
   label13.Caption := form_curr.ADOQuery1.fieldvalues['curr_name'];
   dm.ADO68CURRENY_PTR.Value := form_curr.ADOQuery1.FieldValues['rkey'];
    if dm.ADO68CURRENY_PTR.Value=1 then
     begin
      dbedit1.Field.Value :=1;
      dbedit1.ReadOnly := true;
      dbedit1.Color := cl3Dlight;
     end
    else
     begin
      dbedit1.Field.Value := form_curr.ADOQuery1.FieldValues['exch_rate'];
      dbedit1.ReadOnly := false;
      dbedit1.Color := clwindow;
     end;
  end
 else
  begin
   messagedlg('货币代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label13.Caption := '';
   edit5.SetFocus;
  end;
 finally
  form_curr.Free;
 end;}
end;

procedure TForm2.Edit3Click(Sender: TObject);
begin
IF edit3.Font.Color=clwindowtext then
 begin
  edit3.Font.Color :=clblue;
  edit3.SelectAll;
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
   maskedit1.Text := self.pr_number(trim(form_wh.ADOQuery1warehouse_type.Value));
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
begin
 try
  dm.ADO204.Edit;
  form4:=tform4.Create(application);
  form4.MaskEdit1.Text := dm.ADO204REQ_DATE.AsString;
  form4.Edit1.Text:=dm.ADO204UNIT_CODE.Value;
  form4.Edit1.Font.Color:=clwindowtext;
  form4.Label4.Caption:=dm.ADO204UNIT_NAME.Value;
  form4.if_a_e :=1;
  if form4.ShowModal=mrok then
   begin
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
 dm.ADO204TAX_FLAG.Value := 'N';
 dm.ADO204PURCHASE_REQ_PTR.Value :=dm.ADO68RKEY.Value; //给主表指针赋值
 try
  form4:=tform4.Create(application);
  form4.MaskEdit1.Text := datetimetostr(self.v_sysdate);
  form4.if_a_e :=0;
 if form4.ShowModal=mrok then
  begin
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
  end;
end;

procedure TForm2.BitBtn1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if (dm.ADO68FLAG.Value ='S') or (dm.ADO68FLAG.Value = 'T') then
  begin
   if dm.ADO69.IsEmpty then
    begin
     messagedlg('至少需要一项标准采购请求!',mtinformation,[mbcancel],0);
     dbgrid1.SetFocus;
     exit;
    end;
   end
  else
   if dm.ADO204.IsEmpty then
    begin
     messagedlg('至少需要一项杂项采购请求!',mtinformation,[mbcancel],0);
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
  messagedlg('请输入正确的审批代码!',mtinformation,[mbcancel],0);
  edit2.SetFocus;
  exit;
 end;

if trim(edit3.Text)='' then
 begin
  messagedlg('请输入正确的预算代码!',mtinformation,[mbcancel],0);
  edit3.SetFocus;
  exit;
 end;

if spinedit1.Value<v_year then
 begin
  messagedlg('使用预算年度不能少于当前年度!',mterror,[mbcancel],0);
  edit3.SetFocus;
  exit;
 end;

end;

procedure TForm2.BitBtn4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  form_wh := tform_wh.Create(application);
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
    maskedit1.Text := self.pr_number(trim(form_wh.ADOQuery1warehouse_type.Value));
    edit2.SetFocus;
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
  if (dm.ADO68FLAG.Value = 'S') or (dm.ADO68FLAG.Value = 'T') then
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

function  tform2.pr_number(WAREHOUSETYPE:string):string;
var
 pr:string;
 pr_req:integer;
begin
 pr := warehousetype+form1.pr_id;//工厂及部门前缀

 if length(pr)>=1 then pr := pr+'-';         //分隔符
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
   pr:= pr+'0001';
  end
 else
  begin
   pr_req := strtoint(copy(dm.ADOQuery1.fieldvalues['po_req_number'],
   length(trim(pr))+1,4));
   pr_req := 10000+pr_req+1;
   pr := pr+copy(inttostr(pr_req),2,4);
  end;
 pr_number := pr;
end;

procedure TForm2.N7Click(Sender: TObject);
begin
 try
  form3:=tform3.Create(application);
  form3.Edit2.Text := trim(dm.ADO69inv_number.Value);
  form3.Edit2.Font.Color := clwindowtext;
  form3.label8.Caption := dm.ADO69inv_part_number.Value+dm.ADO69inv_part_description.Value;
  form3.MaskEdit1.Text := dm.ADO69REQ_DATE.AsString;
  form3.Button1.Visible := false;
  form3.Button2.Visible := false;
  form3.Button3.Visible := true;
  with form3 do
   begin
    edit2.Enabled := false;
    bitbtn3.Enabled := false;
    dbedit1.Enabled := false;
    dbedit2.Enabled := false;
    dbedit5.Enabled := false; //特别要求
    maskedit1.Enabled := false;
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
  form4.Edit1.Text:=dm.ADO204UNIT_CODE.Value;
  form4.Edit1.Font.Color:=clwindowtext;
  form4.Label4.Caption:=dm.ADO204UNIT_NAME.Value;
   with form4 do
    begin
     button1.Visible := false;
     button2.Visible := false;
     button3.Visible := true;
     dbedit1.Enabled := false;
     dbedit2.Enabled := false;
     dbcombobox1.Enabled := false;
     dbedit3.Enabled := false;
     dbedit4.Enabled := false;
     maskedit1.Enabled := false;
     edit1.Enabled := false;
     bitbtn3.Enabled := false;
    end;
  form4.ShowModal;
 finally
  form4.free;
 end;
end;

function TForm2.get_newnumber(pr_number: string): string;
var
 v_ifok:boolean;
 pr:string;
 pr_req:integer;
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0068');
  sql.Add('where po_req_number='''+pr_number+'''');
  open;
 end;
if dm.ADOQuery1.IsEmpty then get_newnumber := pr_number
else
 begin
  v_ifok := true;
  pr := pr_number;
  while v_ifok do
  begin
   pr_req := 10000+strtoint(copy(pr,length(pr)-3,4))+1;
   pr := copy(pr,1,length(pr)-4)+copy(inttostr(pr_req),2,4);
   with dm.ADOQuery2 do
    begin
     close;
     sql.Clear;
     sql.Add('select rkey from data0068');
     sql.Add('where po_req_number='''+pr+'''');
     open;
    end;
   if dm.ADOQuery2.IsEmpty then v_ifok := false;
  end;
  get_newnumber := pr;
  showmessage('因同一部门多人同时新增导致编号重复,您新的编号为: '+pr);
 end;
end;

end.
