unit new_inv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ctype: TLabel;
    Label12: TLabel;
    DBEdit3: TDBEdit;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Enter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function mask_value(inv_number:string):string;
    function Power(x, y : extended) : extended;
  private
    { Private declarations }
   v_close:byte;
  public
    { Public declarations }
   v_moth:boolean;
  end;

var
  Form4: TForm4;

implementation
uses damo, invtype_search, Unit_search, warehouse_search, update_inv;
{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
//==============================================================================
 dm.ADOConnection1.BeginTrans;//启动事物处理

if v_moth=true then       //单独新增
 begin
  dm.AQ17CRITICAL_MATL_FLAG.Value :=0;  //重要材料
  dm.AQ17STOP_PURCH.Value := 'N';       //停止采购黩为为N
  dm.AQ17AVL_FLAG.Value := 'N';         //材料需要认可供应商
  dm.AQ17AUTO_PURCHASE_FLAG.Value :=0;  //自动采购
  dm.AQ17INSPECT.Value := 'N';          //检查
  dm.AQ17MIX_PARTS.Value := 'N';        //允许混合部件
  if dm.AQ17STOCK_UNIT_PTR.Value=dm.AQ17PURCH_UNIT_PTR.Value then
   dm.AQ17STOCK_PURCH.Value :=1
  else
   dm.AQ17STOCK_PURCH.Value :=0;
  dm.AQ17S_B_N.Value :='B';    //存储方法默认按批次 (这个赋值暂时不起作用)

  try
   dm.AQ17.Post;
  except
   dm.ADOConnection1.RollbackTrans;
   dbedit1.SetFocus;
   exit;
  end;

  dm.AQ18.Close;
  dm.AQ18.Parameters[0].Value := dm.AQ17RKEY.Value;
  dm.AQ18.Open;

  with dm.ADOQuery1 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select rkey,warehouse_code,warehouse_name from data0015');
   sql.Add('order by rkey');
   active:=true;
   while not eof do
    begin
     dm.AQ18.Append;
     dm.AQ18invent_ptr.Value := dm.AQ17RKEY.Value;
     dm.AQ18whouse_ptr.Value := fieldvalues['rkey'];
     dm.AQ18.Post;
     next;
    end;
  end;

 end
else                   //复制
 begin
  try
   dm.AQ17.Post;
  except
   dm.ADOConnection1.RollbackTrans;
   dbedit1.SetFocus;
   exit;
  end;

  with dm.AQ18 do
   begin
    First;
    while not eof do
     begin
      edit;
      dm.AQ18invent_ptr.Value := dm.AQ17RKEY.Value;
      post;
      next;
     end;
   end;
 end;

 try
  if not dm.ado496.Active then dm.ado496.Open;
  if not dm.Aq0002.Active then dm.Aq0002.Open;
  if dm.ado496if_flag.Value=1 then //作为初始值
   begin
    dm.ado496.Edit;
    dm.ado496mask_inv_number.Value := mask_value(trim(dm.AQ17INV_PART_NUMBER.Value));
    dm.ado496.Post;
   end;
  DM.AQ18.UpdateBatch();
  dm.ADOConnection1.CommitTrans;  //提交事物
 except
  dm.ADOConnection1.RollbackTrans;
  showmessage('数据保存过程中遇到错误！请检查材料类型编码初始值设置是否正确！');
  exit;
 end;

  v_close:=1;  //正常退出
  ModalResult:=mrok;
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
 try
  form_invtype:=tform_invtype.Create(application);
  form_invtype.Edit1.Text :=trim(edit1.Text);
  if form_invtype.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit1.SetFocus;
   end
  else
   if form_invtype.ShowModal=mrok then
    begin
     edit1.Text := form_invtype.ADOQuery1GROUP_NAME.Value;
     edit1.Font.Color := clwindowtext;
     label7.Caption := form_invtype.ADOQuery1GROUP_DESC.Value;
     dm.AQ17GROUP_PTR.Value := form_invtype.ADOQuery1RKEY.Value;
     ctype.Caption := form_invtype.ADOQuery1ctype.Value;
     if form_invtype.ADOQuery1if_flag.Value=0 then
      dm.AQ17INV_PART_NUMBER.EditMask := form_invtype.ADOQuery1mask_inv_number.Value
     else
      if form_invtype.ADOQuery1if_flag.Value=1 then
       dm.AQ17INV_PART_NUMBER.Value := form_invtype.ADOQuery1mask_inv_number.Value;
     dbedit1.SetFocus;
    end
   else
    edit1.SetFocus;
 finally
  form_invtype.free;
 end;
end;

procedure TForm4.Edit1Click(Sender: TObject);
begin
 if edit1.Font.Color=clwindowtext then
  begin
   edit1.SelectAll;
   edit1.Font.Color :=clblue;
  end;
end;

procedure TForm4.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (trim(edit1.Text)<>'') then
 try
  form_invtype := Tform_invtype.Create(Application);
  form_invtype.Edit1.Text:=trim(edit1.Text);
 if comparetext(trim(edit1.text),trim(form_invtype.ADOQuery1.Fieldbyname('group_name').AsString))=0 then
  begin
   edit1.Font.Color:=clwindowtext;
   label7.Caption:=form_invtype.ADOQuery1.FieldValues['GROUP_DESC'];
   dm.AQ17GROUP_PTR.Value := form_invtype.ADOQuery1RKEY.Value;
   ctype.Caption:=form_invtype.ADOQuery1ctype.Value;
   if form_invtype.ADOQuery1if_flag.Value=0 then
    dm.AQ17INV_PART_NUMBER.EditMask := form_invtype.ADOQuery1mask_inv_number.Value
   else
    if form_invtype.ADOQuery1if_flag.Value=1 then
     dm.AQ17INV_PART_NUMBER.Value := form_invtype.ADOQuery1mask_inv_number.Value;
  end
 else
  begin
   messagedlg('材料类别不正确,请重新输入或选择',mtinformation,[mbok],0);
   label7.Caption:='';
   edit1.SetFocus;
  end;
 finally
  form_invtype.free;
 end
else
 edit1.Font.Color :=clblue;
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
 try
  form_unit:=tform_unit.Create(application);
  with form_unit.ADOQuery1 do
   begin
    close;
    SQL.Insert(1,'where stock=''Y''');
    open;
   end;  
  form_unit.Edit1.Text :=trim(edit2.Text);
  if form_unit.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit2.SetFocus;
   end
  else
   if form_unit.ShowModal=mrok then
    begin
     edit2.Text := form_unit.ADOQuery1.FieldValues['unit_code'];
     edit2.Font.Color := clwindowtext;
     label8.Caption := form_unit.ADOQuery1.FieldValues['unit_name'];
     dm.AQ17STOCK_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
     if edit3.Font.Color = clblue then
      begin
       edit3.Text := edit2.Text;
       edit3.Font.Color := clwindowtext;
       label9.Caption := label8.Caption;
       dm.AQ17PURCH_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
      end;
     edit3.SetFocus;
    end
   else
    edit2.SetFocus;
 finally
  form_unit.free;
 end;
end;

procedure TForm4.Edit2Click(Sender: TObject);
begin
 if edit2.Font.Color=clwindowtext then
  begin
   edit2.SelectAll;
   edit2.Font.Color :=clblue;
  end;
end;

procedure TForm4.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn2') and (trim(edit2.Text)<>'') then
 try
  form_unit := Tform_unit.Create(Application);
  with form_unit.ADOQuery1 do
   begin
    close;
    SQL.Insert(1,'where stock=''Y''');
    open;
   end;  
  form_unit.Edit1.Text:=trim(edit2.Text);
 if comparetext(trim(edit2.text),trim(form_unit.ADOQuery1.Fieldbyname('unit_code').AsString))=0 then
  begin
   edit2.Font.Color:=clwindowtext;
   label8.Caption:=form_unit.ADOQuery1.FieldValues['unit_name'];
   dm.AQ17STOCK_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
   if edit3.Font.Color = clblue then
    begin
     edit3.Text := edit2.Text;
     edit3.Font.Color := clwindowtext;
     label9.Caption := label8.Caption;
     dm.AQ17PURCH_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
    end;
  end
 else
  begin
   messagedlg('单位代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label8.Caption:='';
   edit2.SetFocus;
  end;
 finally
  form_unit.free;
 end;
end;

procedure TForm4.Edit3Click(Sender: TObject);
begin
 if edit3.Font.Color=clwindowtext then
  begin
   edit3.SelectAll;
   edit3.Font.Color :=clblue;
  end;
end;

procedure TForm4.BitBtn3Click(Sender: TObject);
begin
 try
  form_unit:=tform_unit.Create(application);
  with form_unit.ADOQuery1 do
   begin
    close;
    SQL.Insert(1,'where purch=''Y''');
    open;
   end;  
  form_unit.Edit1.Text :=trim(edit3.Text);
  if form_unit.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    edit3.SetFocus;
   end
  else
   if form_unit.ShowModal=mrok then
    begin
     edit3.Text := form_unit.ADOQuery1.FieldValues['unit_code'];
     edit3.Font.Color := clwindowtext;
     label9.Caption := form_unit.ADOQuery1.FieldValues['unit_name'];
     dm.AQ17PURCH_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
     if edit2.Font.Color = clblue then
      begin
       edit2.Text := edit3.Text;
       edit2.Font.Color := clwindowtext;
       label8.Caption := label9.Caption;
       dm.AQ17STOCK_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
      end;
    end
   else
    edit3.SetFocus;
 finally
  form_unit.free;
 end;
end;

procedure TForm4.Edit3Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (trim(edit3.Text)<>'') then
 try
  form_unit := Tform_unit.Create(Application);
  with form_unit.ADOQuery1 do
   begin
    close;
    SQL.Insert(1,'where purch=''Y''');
    open;
   end;  
  form_unit.Edit1.Text:=trim(edit3.Text);
 if comparetext(trim(edit3.text),trim(form_unit.ADOQuery1.Fieldbyname('unit_code').AsString))=0 then
  begin
   edit3.Font.Color:=clwindowtext;
   label9.Caption:=form_unit.ADOQuery1.FieldValues['unit_name'];
   dm.AQ17PURCH_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
   if edit2.Font.Color = clblue then
    begin
     edit2.Text := edit3.Text;
     edit2.Font.Color := clwindowtext;
     label8.Caption := label9.Caption;
     dm.AQ17STOCK_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
    end;
  end
 else
  begin
   messagedlg('单位代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label9.Caption:='';
   edit3.SetFocus;
  end;
 finally
  form_unit.free;
 end
else
 edit3.Font.Color :=clblue;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
 v_close:=1;
 DM.AQ17.Cancel;
 if dm.AQ18.Active=true then dm.AQ18.CancelBatch();
 form2.show;
end;

procedure TForm4.FormActivate(Sender: TObject);
begin
if dm.AQ17GROUP_PTR.AsVariant<>null then
with dm.ADOQuery1 do
 begin
  if active=true then active:=false;
  sql.Clear;
  sql.Add('select group_name,group_desc,ttype,mask_inv_number,if_flag');
  sql.Add('from data0496');
  sql.Add('where rkey='+dm.AQ17GROUP_PTR.AsString);
  active:=true;
  edit1.Text := FieldValues['group_name'];;
  edit1.Font.Color := clwindowtext;
  label7.Caption := FieldValues['group_desc'];

  if fieldvalues['if_flag']=0 then
   if fieldvalues['mask_inv_number']<>null then
    dm.AQ17INV_PART_NUMBER.EditMask := fieldvalues['mask_inv_number']
   else
    dm.AQ17INV_PART_NUMBER.EditMask := ''
  else
   if fieldvalues['if_flag']=1 then
    if fieldvalues['mask_inv_number']<>null then
     dm.AQ17INV_PART_NUMBER.EditMask := fieldvalues['mask_inv_number']
    else
     dm.AQ17INV_PART_NUMBER.EditMask := '';

  if fieldvalues['ttype']='P' then
   ctype.Caption:='原材料'
  else
   if fieldvalues['ttype']='T' then
    ctype.Caption:='外发加工'
   else
    ctype.Caption:='杂项';
 end;
//==============================================================================
if dm.AQ17PURCH_UNIT_PTR.AsVariant<>null then
with dm.ADOQuery1 do   //查找采购单位,不为空
 begin
  if active=true then active:=false;
  sql.Clear;
  sql.Add('select unit_code,unit_name from data0002');
  sql.Add('where rkey='+dm.AQ17PURCH_UNIT_PTR.AsString);
  active:=true;
  edit3.Text := FieldValues['unit_code'];;
  edit3.Font.Color := clwindowtext;
  label9.Caption := FieldValues['unit_name'];
 end;
//==============================================================================
if dm.AQ17STOCK_UNIT_PTR.AsVariant<>null then
with dm.ADOQuery1 do   //查找存储单位,不为空
 begin
  if active=true then active:=false;
  sql.Clear;
  sql.Add('select unit_code,unit_name from data0002');
  sql.Add('where rkey='+dm.AQ17stock_UNIT_PTR.AsString);
  active:=true;
  edit2.Text := FieldValues['unit_code'];;
  edit2.Font.Color := clwindowtext;
  label8.Caption := FieldValues['unit_name'];
 end;
//==============================================================================
{if edit4.Visible=true then   //新增
with dm.ADOQuery1 do
 begin
  if active=true then active:=false;
  sql.Clear;
  sql.Add('select rkey,warehouse_code,warehouse_name from data0015');
  sql.Add('order by rkey');
  active:=true;
  if not isempty then
   begin
    edit4.Text := FieldValues['warehouse_code'];;
    edit4.Font.Color := clwindowtext;
    label10.Caption := FieldValues['warehouse_name'];
    label11.Caption := fieldbyname('rkey').AsString;
   end;
 end;}
//==============================================================================

end;

procedure TForm4.Button1Enter(Sender: TObject);
begin
 if trim(dbedit1.Text)='' then
  begin
   messagedlg('材料代码不能为空!',mtwarning,[mbok],0);
   dbedit1.SetFocus;
   exit;
  end;
 if trim(dbedit2.Text)='' then
  begin
   messagedlg('材料名称不能为空!',mtwarning,[mbok],0);
   dbedit2.SetFocus;
   exit;
  end;
 if trim(dbedit3.Text)='' then
  begin
   messagedlg('材料规格不能为空!',mtwarning,[mbok],0);
   dbedit3.SetFocus;
   exit;
  end;

 if edit1.Font.Color =clblue then
  begin
   messagedlg('材料类别不能为空!',mtwarning,[mbok],0);
   edit1.SetFocus;
   exit;
  end;

 if edit2.Font.Color =clblue then
  begin
   messagedlg('请购单位不能为空!',mtwarning,[mbok],0);
   edit2.SetFocus;
   exit;
  end;
 if edit3.Font.Color =clblue then
  begin
   messagedlg('采购单位不能为空!',mtwarning,[mbok],0);
   edit3.SetFocus;
   exit;
  end;


end;

procedure TForm4.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if v_close<>1 then // 非正常退出
 begin
  DM.AQ17.Cancel;
  if dm.AQ18.Active=true then dm.AQ18.CancelBatch();
  form2.show;
 end;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dm.AQ17INV_PART_NUMBER.EditMask:='';
end;

function TForm4.mask_value(inv_number: string): string;
var
 v_leng,i:byte;
 v_last:extended;
begin
 v_leng := length(inv_number);
 for i := v_leng downto 1 do
  begin
   if (copy(inv_number,i,1) < '0') or (copy(inv_number,i,1) > '9')  then //如果不是数字
    begin
     v_last := power(10,v_leng-i) + strtoint(copy(inv_number,i+1,v_leng-i))+1;
     result := copy(inv_number,1,i) + copy(floattostr(v_last),2,v_leng-i);
     break;
    end
   else                                      //如果是数字
    if i=1 then //如果第一位仍然是数字
     begin
      v_last := power(10,v_leng)+strtoint(inv_number)+1;
      result := copy(floattostr(v_last),2,v_leng);
     end;
  end;
end;

function TForm4.Power(x, y : extended) : extended;
 begin
  result := exp(y*ln(x));
 end;

end.
