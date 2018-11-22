unit edit_price;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Mask, DBCtrls, Grids, DB, ADODB,
  Menus;

type
  TForm2 = class(TForm)
   BitBtn1: TBitBtn;
   BitBtn2: TBitBtn;
   BitBtn3: TBitBtn;
    Bar1: TStatusBar;
   PageControl1: TPageControl;
   TabSheet1: TTabSheet;
   TabSheet2: TTabSheet;
   Label1: TLabel;
   Label2: TLabel;
   Label3: TLabel;
   Label4: TLabel;
   Label5: TLabel;
   Label6: TLabel;
   Label7: TLabel;
   Label8: TLabel;
   Edit1: TEdit;
   Edit2: TEdit;
   Edit3: TEdit;
   DBEdit1: TDBEdit;
   DBEdit2: TDBEdit;
   Edit4: TEdit;
   Edit5: TEdit;
   DBEdit3: TDBEdit;
   Label9: TLabel;
   BitBtn4: TBitBtn;
   BitBtn5: TBitBtn;
   BitBtn6: TBitBtn;
   BitBtn7: TBitBtn;
   Label10: TLabel;
   Label11: TLabel;
   Label12: TLabel;
   Label13: TLabel;
   Label14: TLabel;
   Label15: TLabel;
   Label16: TLabel;
   Label17: TLabel;
   Label18: TLabel;
   Label19: TLabel;
   DBEdit4: TDBEdit;
   ComboBox1: TComboBox;
   ComboBox2: TComboBox;
   DBEdit6: TDBEdit;
   Label20: TLabel;
   DBEdit7: TDBEdit;
   Label21: TLabel;
   StringGrid1: TStringGrid;
   StringGrid2: TStringGrid;
   Edit6: TEdit;
   PopupMenu1: TPopupMenu;
   N1: TMenuItem;
    Label22: TLabel;
    Label24: TLabel;
    Edit7: TEdit;
    Label25: TLabel;
    Edit8: TEdit;
    DBCheckBox1: TDBCheckBox;
   procedure BitBtn3Click(Sender: TObject);
   procedure FormActivate(Sender: TObject);
   procedure ComboBox2Change(Sender: TObject);
   procedure ComboBox1Change(Sender: TObject);
   procedure Edit6KeyPress(Sender: TObject; var Key: Char);
   procedure Edit6Exit(Sender: TObject);
   procedure BitBtn6Click(Sender: TObject);
   procedure BitBtn1Click(Sender: TObject);
   procedure BitBtn7Click(Sender: TObject);
   procedure FormShow(Sender: TObject);
   procedure Edit5Click(Sender: TObject);
   procedure Edit5Exit(Sender: TObject);
   procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
   procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
   procedure StringGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
   procedure StringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
   procedure N1Click(Sender: TObject);
   procedure PopupMenu1Popup(Sender: TObject);
   procedure BitBtn2Click(Sender: TObject);
   procedure FormCreate(Sender: TObject);
   procedure FormDestroy(Sender: TObject);
   procedure save_note();
   procedure Edit1Click(Sender: TObject);
   procedure BitBtn4Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure save_supp();
    procedure save_inv();
    procedure get_newprice();
    procedure Edit6Click(Sender: TObject);
    procedure DBEdit6Click(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit7Click(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit2Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure StringGrid1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEdit3Exit(Sender: TObject);
  private
    { Private declarations }
   v_close:byte;
   old_price:double;
  public
    { Public declarations }
  end;

var
  Form2 :TForm2;
  price_note :tstringlist;
  v_row :byte;
  v_edit :boolean;
implementation
uses damo, Unit_search, uncode_search, note, main, inv_serach,
  supplier_search;
{$R *.dfm}

procedure TForm2.BitBtn3Click(Sender: TObject);
var
  v_message:integer;
begin
 if DM.ADO28.State=dsinsert then
  begin
   dm.ADO28.Cancel;
   v_close:=1;
   ModalResult :=mrok;
  end
 ELSE
 if (dm.ADO28.Modified) or (v_edit) then
  begin
   v_message:=messagedlg('数据已修改,是否存盘?',mtConfirmation,[mbyes,mbno,mbcancel],0);
   if v_message=7 then
    begin
     dm.ADO28.Cancel;       //no取消对当前记录的修改包括新增
     v_close:=1;
     close;
    end
   else
    if v_message=6 then    //yes对修改的记录存盘
     BitBtn1Click(Sender)
    else                   //cancel不存盘也不保存
     exit;
  end
 ELSE
  begin
   v_close:=1;
   close;
  end;
end;

procedure TForm2.FormActivate(Sender: TObject);
var
 i:byte;
begin
 v_row := 1;
 v_edit := false;
 stringgrid1.Cells[0,0] := '从';
 stringgrid1.Cells[1,0] := '至';
 stringgrid1.Cells[2,0] := '供应商价格';
 stringgrid1.Cells[3,0] := '折扣%';
 stringgrid1.Cells[0,1] := '0';

 stringgrid2.Cells[0,0] := '订单编号';
 stringgrid2.Cells[1,0] := '采购人员';
 stringgrid2.Cells[2,0] := '订单日期';
 stringgrid2.Cells[3,0] := '数量';
 stringgrid2.Cells[4,0] := '价格';
 stringgrid2.Cells[5,0] := '折扣%';
 stringgrid2.Cells[6,0] := '增值税%';

 bar1.SimpleText :=label22.Caption;
 with dm.ADO2811 do
  begin           //查找记事本
   if active=true then active:=false;
   Parameters[2].Value:=dm.ADO28.FieldValues['rkey'];
   active:=true;
   if not isempty then
   for i:=1 to 4 do
    price_note.Add(Fieldbyname('NOTE_PAD_LINE_'+inttostr(i)).AsString);
  end;

if (dm.ADO28.State=dsedit) or (dm.ADO28.State=dsBrowse) then    //编辑状态
 begin
  with dm.adoquery2 do
   begin                //查找存货单位 ..同时查找首选供应商
    if active=true then active:=false;
    sql.Clear;
    SQL.Add('SELECT unit_code,unit_name');
    sql.add('from data0002,data0017 ');
    sql.Add('where data0017.stock_unit_ptr=data0002.rkey');
    sql.Add('and data0017.rkey='+dm.ADO28INVENTORY_PTR.AsString);
    active:=true;
    edit4.Text := fieldvalues['unit_code'];
    label13.Caption := fieldvalues['unit_name'];
   end;

  if comparetext(trim(edit5.text),trim(edit4.Text))=0 then
   begin
    if dbedit3.Field.Value<>1 then
     begin
      showmessage('该项材料的存货单位发生了变发!');
      if (dm.ADO28.State=dsedit) then dbedit3.Field.Value:=1;
     end;
    dbedit3.Enabled := false;
   end;

  with dm.ADOQuery1 do
   begin                                     //查找首选供应商
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select code from data0023,data0017');
    sql.Add('where data0017.pref_supplier_ptr=data0023.rkey');
    sql.Add('and data0017.rkey='+dm.ADO28INVENTORY_PTR.AsString);
    active:=true;
    if not IsEmpty then
     bar1.SimpleText := '首选供应商:'+fieldvalues['code']
    else
     bar1.SimpleText := '首选供应商:'+'未定义';
   end;

  combobox2.ItemIndex:=dm.ADO28.FieldValues['amt_quan_flag']-1;
  if combobox2.ItemIndex=0 then
   edit6.Text :=formatfloat('0.000',dm.ADO28.FieldValues['min_order_qty'])
  else
   edit6.Text :=formatfloat('0.000',dm.ADO28.FieldValues['min_order_amt']);
  if dm.ADO28.FieldValues['avl_flag']='Y' then
    combobox1.ItemIndex:=0
  else
   if dm.ADO28.FieldValues['avl_flag']='N' then
    combobox1.ItemIndex:=1
   else
    combobox1.ItemIndex:=2;
  self.old_price:=dm.ADO28PRICE_1.Value; //记录下旧价格
  get_newprice();   //得到采购价格变动表
 end;

 if dm.ADO28EMPLOYEE_PTR.AsVariant<>null then
  with dm.ADOQuery1 do
   begin                                     //最后保存人员
    active:=false;
    sql.Clear;
    sql.Add('select employee_name from data0005');
    sql.Add('where rkey='+dm.ADO28EMPLOYEE_PTR.AsString);
    active:=true;
    edit7.Text:=dm.ADOQuery1.FieldValues['employee_name'];
   end;

if dm.ADO28EDI_OUT_FORCST.Value>0 then
  with dm.ADOQuery1 do
   begin                                     //最后审批系统用户
    active:=false;
    sql.Clear;
    sql.Add('select USER_FULL_NAME from data0073');
    sql.Add('where rkey='+dm.ADO28EDI_OUT_FORCST.AsString);
    active:=true;
    if not isempty then
    edit8.Text:=dm.ADOQuery1.FieldValues['USER_FULL_NAME'];
   end;
end;

procedure TForm2.ComboBox2Change(Sender: TObject);
begin
 dm.ADO28AMT_QUAN_FLAG.Value := combobox2.ItemIndex+1;
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
 case combobox1.ItemIndex of
  0: dm.ADO28AVL_FLAG.Value :='Y';
  1: dm.ADO28AVL_FLAG.Value :='N';
  2: dm.ADO28AVL_FLAG.Value :='T';
 end;
end;

procedure TForm2.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
 if (key = chr(46)) then
 if pos('.',edit6.Text)>0 //小数点不能重复
  then abort;
 if not (key in ['0'..'9','.',#8]) then  //判断是否输入数字
  abort;
end;

procedure TForm2.Edit6Exit(Sender: TObject);
begin
 if trim(edit6.Text)='' then edit6.Text:='0';
 edit6.Text := formatfloat('0.000',strtofloat(edit6.Text));
 edit6.Font.Color := clwindowtext;
end;

procedure TForm2.BitBtn6Click(Sender: TObject);
begin
 try
  form_curr:=tform_curr.Create(application);
  form_curr.Edit1.Text := trim(edit3.Text);
  if form_curr.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找符合条件的记录!',mtwarning,[mbok],0);
    edit3.SetFocus;
   end
  else
  if form_curr.ShowModal=mrok then
   begin
    edit3.Text := form_curr.ADOQuery1.FieldValues['curr_code'];
    edit3.Font.Color := clwindowtext;
    label11.Caption := form_curr.ADOQuery1.FieldValues['curr_name'];
    dm.ADO28CURRENCY_PTR.Value := form_curr.ADOQuery1.FieldValues['rkey'];
    dbedit1.SetFocus;
   end
  else
   edit3.SetFocus;
 finally
  form_curr.free;
 end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 i:byte;
 str:string;
begin
 dm.ADO28CSI_USER_PTR.AsString := form1.csi_ptr.Caption;
 DM.ADO28EMPLOYEE_PTR.AsString := FORM1.empl_ptr.Caption;
 if combobox2.ItemIndex=0 then
  begin        //最少订购数量存储
   dm.ADO28MIN_ORDER_QTY.AsString := edit6.Text;
   dm.ADO28MIN_ORDER_AMT.Value := 0;
  end
 else          //最少订购金额
  begin
   dm.ADO28MIN_ORDER_QTY.Value := 0;
   dm.ADO28MIN_ORDER_AMT.AsString := edit6.Text;
  end;

 for i:=1 to 5 do
  begin                //范围存盘
   if (stringgrid1.Cells[1,i]<>'') and (pos('无',stringgrid1.Cells[1,i])=0) then
    dm.ADO28.FieldByName('quan_vol_'+inttostr(i)).AsString:=stringgrid1.Cells[1,i]
   else
    dm.ADO28.FieldValues['quan_vol_'+inttostr(i)]:=0;
  end;

 for i:=1 to 6 do     //价格存盘
  if stringgrid1.Cells[2,i]<>'' then
   dm.ADO28.Fieldbyname('price_'+inttostr(i)).AsString :=stringgrid1.Cells[2,i]
  else
   dm.ADO28.FieldValues['price_'+inttostr(i)] :=0;

 for i:=1 to 6 do        //折扣存盘
  if stringgrid1.Cells[3,i]<>'' then
   dm.ADO28.Fieldbyname('disc_'+inttostr(i)).AsString :=stringgrid1.Cells[3,i]
  else
   dm.ADO28.FieldValues['disc_'+inttostr(i)] :=0;

if dm.ADO28.State=dsedit then //编辑状态存盘
 begin
  form2.save_note;
  dm.ADO28.Post;
  if dm.ADO28PRICE_1.Value<>self.old_price then
   begin
    str:=InputBox('价格变动','请输入价格变动原因','');
    with dm.ADOQuery2 do
    begin
     close;                  //记录价格更改情况(日志文件)
     sql.Clear;
     sql.Add('insert into data0328 (price_ptr,user_ptr,old_price,');
     sql.Add('new_price,sys_longdate,reason)');
     sql.Add('values ('+dm.ADO28RKEY.AsString+','+form1.empl_ptr.Caption+',');
     sql.Add(''+floattostr(self.old_price)+','+dm.ADO28PRICE_1.AsString+',');
     sql.add(''''+form1.sys_longdate+''','''+str+''')');
     ExecSQL;
    end;
   end;
  v_close:=1;
  ModalResult :=mrok;
 end
else           //新增状态存盘
 begin
  if length(bar1.SimpleText)<=12 then //如果材料还没有首选供应商
  if messagedlg('是否将材料'+trim(edit1.Text)+'的首选供应商设置为'+edit2.Text,
   mtinformation,[mbyes,mbno],0)=mryes then
   begin
    with dm.ADOQuery1 do
    begin
     if active=true then active:=false;    //查找货币汇率
     sql.Clear;
     sql.Add('select BASE_TO_OTHER from data0001');
     sql.Add('where rkey ='+dm.ADO28CURRENCY_PTR.AsString);
     active:=true;
    end;
    dm.ADO17.Close;
    dm.ADO17.Parameters[0].Value := dm.ADO28SUPPLIER_PTR.Value;
    dm.ADO17.Parameters[1].Value := dm.ADO28PRICE_1.Value*dm.ADOQuery1.FieldValues['BASE_TO_OTHER'];
    dm.ADO17.Parameters[2].Value := dm.ADO28INVENTORY_PTR.Value;
    dm.ADO17.ExecSQL; //执行返加无结果的update语句修改材料首选供应商
    bar1.SimpleText:= '首选供应商: '+edit2.Text;
   end;
  dm.ADOConnection1.BeginTrans;
  try
   dm.ADO28.Post;
   self.save_note;   //保存记事本
   dm.ADOConnection1.CommitTrans;
  except
   dm.ADOConnection1.RollbackTrans;
  end;
  dm.ADO28.Append;     //连续新增
  dbedit2.Field.Value :=0;
  dbedit6.Field.Value :=0;   // 建议重购数量
  dbedit7.Field.Value :=0;   //增值税默认为0
  dm.ADO28TDATE.Value := now;
  edit6.Text := '0.000';
  dm.ADO28TAX_FLAG.Value:='Y';
  dm.ADO2811.Close;
  dm.ADO2811.Open;
  price_note.Clear;
  for i:=1 to 6 do
   stringgrid1.Rows[i].Clear;
  stringgrid1.Cells[0,1] := '0';
  stringgrid1.Cells[1,1] := '无限制';
  stringgrid1.Cells[2,1] := '0.000';
  stringgrid1.Cells[3,1] := '0.000';
  if stringgrid2.RowCount>2 then
  for i:=1 to stringgrid2.RowCount-2 do
   stringgrid2.Rows[i].Clear;
  stringgrid2.RowCount := 2;
  pagecontrol1.TabIndex :=0;
  pagecontrol1.Enabled := false;
  bitbtn1.Enabled := false;
  bitbtn2.Enabled := false;
  edit5.Enabled := false;
  bitbtn7.Enabled := false;
  DBEdit3.Enabled := false;
if edit1.Enabled =true then  //按供应商新增
 begin
  edit1.Text := '';
  edit1.Font.Color := clblue;
  label9.Caption := '';
  dm.ADO28SUPPLIER_PTR.AsString := form1.supp_rkey.Caption;
  with dm.ADOQuery1 do       //上行给供应商指针赋值
  begin
   if active=true then active:=false;
   sql.Clear;                //查找供应商货币
   sql.Add('select curr_code,curr_name,currency_ptr from data0001,data0023');
   sql.Add('where data0023.currency_ptr=data0001.rkey and');
   sql.Add('data0023.rkey='+dm.ADO28SUPPLIER_PTR.AsString);
   active:=true;
   edit3.Text := fieldvalues['curr_code'];
   label11.Caption := fieldvalues['curr_name'];
   dm.ADO28CURRENCY_PTR.Value := fieldvalues['currency_ptr']; //给货币指针赋值
  end;
   edit3.Enabled := false;
   bitbtn6.Enabled := false;
   combobox1.ItemIndex :=-1;
   combobox2.ItemIndex :=-1;
   edit4.Text := '';
   label13.Caption := '';
   edit5.Text := '';
   label12.Caption := '';
   dbedit3.Field.Value := 0;
   edit1.SetFocus;
   bar1.SimpleText:='';
  end
 else                         //按库存原材料新增
  begin
   edit2.Text := '';
   edit2.Font.Color := clblue;
   label10.Caption := '';
   dm.ADO28INVENTORY_PTR.AsString := form1.inv_rkey.Caption;
   edit3.Text := '';         //给原材料指针赋值
   label11.Caption := '';
   with dm.adoquery2 do
    begin                 //查找采购单位   同时查找材料可用标记,单位转换率
     if active=true then active:=false;
     sql.Clear;
     sql.Add('select data0002.rkey,unit_code,unit_name,avl_flag,stock_purch');
     sql.Add('from data0002,data0017');
     sql.Add('where data0017.purch_unit_ptr=data0002.rkey and');
     sql.Add('data0017.rkey='+dm.ADO28INVENTORY_PTR.AsString);
     active:=true;
     edit5.Text := fieldvalues['unit_code'];
     label12.Caption := fieldvalues['unit_name'];
     dm.ADO28PURCHASE_UNIT_PTR.Value := fieldvalues['rkey'];   //给采购单位赋值
     dbedit3.Field.Value := fieldvalues['stock_purch'];  //单位转换率
     if fieldvalues['avl_flag']='N' then
      begin
       dm.ADO28AVL_FLAG.Value := 'Y';
       combobox1.ItemIndex := 0;
      end
     else
      begin
       dm.ADO28AVL_FLAG.Value := 'N';
       combobox1.ItemIndex := 1;
      end;
      combobox2.ItemIndex :=0;              //订购方法
      dm.ADO28AMT_QUAN_FLAG.Value :=1;   //给订购方法赋值 默认按数量....
    end;
   edit2.SetFocus;
  end;
end;
end;

procedure TForm2.BitBtn7Click(Sender: TObject);
begin
 try
  form_unit:=tform_unit.Create(application);
  form_unit.Edit1.Text :=trim(edit5.Text);
  if form_unit.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找符合条件的记录!',mtwarning,[mbok],0);
    edit5.SetFocus;
   end
  else
  if form_unit.ShowModal=mrok then
   begin
    edit5.Text := form_unit.ADOQuery1.FieldValues['unit_code'];
    edit5.Font.Color := clwindowtext;
    label12.Caption := form_unit.ADOQuery1.FieldValues['unit_name'];
    dm.ADO28PURCHASE_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
    if comparetext(trim(edit5.text),trim(edit4.Text)) = 0 then
     begin
      dbedit3.Field.Value := 1;
      dbedit3.Enabled := false;
      stringgrid1.SetFocus;
     end
    else
     begin
      dbedit3.Enabled := true;
      dbedit3.SetFocus;
     end;
   end
  else
   edit5.SetFocus;
 finally
  form_unit.free;
 end;
end;

procedure TForm2.FormShow(Sender: TObject);
var
 i:byte;
begin
stringgrid1.Cells[2,1] := '0.000';
stringgrid1.Cells[3,1] := '0.000';
 for i:=1 to 5 do
  if dm.ADO28.FieldValues['quan_vol_'+inttostr(i)]<>null then     //如果是编辑
   if dm.ADO28.FieldValues['quan_vol_'+inttostr(i)]>0 then
    begin
     stringgrid1.Cells[1,i]:=formatfloat('0',dm.ADO28.FieldValues['quan_vol_'+inttostr(i)]);
     stringgrid1.Cells[2,i+1]:='0.000';
     stringgrid1.Cells[3,i+1]:='0.000';
     stringgrid1.Cells[0,i+1]:='>'+stringgrid1.Cells[1,i];
     if i=5 then                     //处理价格折扣
      stringgrid1.Cells[1,6]:='无限制';
    end
   else  //如果范围结束
    begin
     stringgrid1.Cells[1,i] := '无限制';
     stringgrid1.Cells[2,i] := '0.000';
     stringgrid1.Cells[3,i] := '0.000';
     break;
    end
  else  //如果是新增
   begin
    stringgrid1.Cells[1,i]:='无限制';
    stringgrid1.Cells[2,i] := '0.000';
    stringgrid1.Cells[3,i] := '0.000';
    break;
   end;

  for i:=1 to 6 do
  if dm.ADO28.FieldValues['price_'+inttostr(i)]<>null then
  if dm.ADO28.FieldValues['price_'+inttostr(i)]>0 then
  stringgrid1.Cells[2,i]:=formatfloat('0.000',dm.ADO28.FieldValues['price_'+inttostr(i)]);

  for i:=1 to 6 do
  if dm.ADO28.FieldValues['disc_'+inttostr(i)]<>null then
  if dm.ADO28.FieldValues['disc_'+inttostr(i)]>0 then
  stringgrid1.Cells[3,i]:=formatfloat('0.000',dm.ADO28.FieldValues['disc_'+inttostr(i)]);
end;

procedure TForm2.Edit5Click(Sender: TObject);
begin
if edit5.Font.Color = clwindowtext then
 begin
  edit5.Font.Color :=clblue;
  edit5.SelectAll;
 end;
end;

procedure TForm2.Edit5Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn7') and (activecontrol.Name<>'BitBtn3') then
 try
  form_unit:=tform_unit.Create(application);
  form_unit.Edit1.Text :=trim(edit5.Text);
 if comparetext(trim(edit5.text),trim(form_unit.ADOQuery1.Fieldbyname('unit_code').AsString))=0 then
   begin
    edit5.Font.Color := clwindowtext;
    label12.Caption := form_unit.ADOQuery1.FieldValues['unit_name'];
    dm.ADO28PURCHASE_UNIT_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
    if comparetext(trim(edit5.text),trim(edit4.Text))=0 then
     begin
      dbedit3.Field.Value :=1;
      dbedit3.Enabled := false;
     end
    else
      dbedit3.Enabled := true;
   end
  else
   begin
    messagedlg('采购单位名称不正确,请重新输入或选择',mtinformation,[mbok],0);
    label12.Caption := '';
    edit5.SetFocus;
   end;
 finally
  form_unit.free;
 end;
end;

procedure TForm2.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
 i:byte;
begin
 if (acol=1) and (arow=6) then  //第一列六行不准编辑  没有对应字段值
  canselect:=false;

if (stringgrid1.Col=2) or (stringgrid1.Col=3) then  //如果是在第二,三列
 begin
  if stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]<>'' then
   stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]:=
   formatfloat('0.000',strtofloat(stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]))
  else
   if stringgrid1.Cells[1,stringgrid1.Row]<>'' then
    stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]:='0.000';
 end
else      //...............如果是在第一列
begin  // 开始....2
 if (stringgrid1.Row>1) and (stringgrid1.Cells[1,stringgrid1.Row]<>'')
  and (pos('无',stringgrid1.Cells[1,stringgrid1.Row])=0)  then
  begin   //...yes    //如果不在第一行并且当前行不是空行,并且没有'无限制'
   IF (strtofloat(stringgrid1.Cells[1,stringgrid1.Row])<strtofloat(stringgrid1.Cells[1,stringgrid1.Row-1])) then
    begin   //向上比较
     stringgrid1.Cells[1,stringgrid1.Row]:=stringgrid1.Cells[1,stringgrid1.Row-1];
     stringgrid1.Cells[0,stringgrid1.Row+1]:='>'+stringgrid1.Cells[1,stringgrid1.Row];
     if stringgrid1.Cells[2,stringgrid1.Row+1]='' then
      stringgrid1.Cells[2,stringgrid1.Row+1]:='0.000';
     if stringgrid1.Cells[3,stringgrid1.Row+1]='' then
      stringgrid1.Cells[3,stringgrid1.Row+1]:='0.000';
     if stringgrid1.Cells[1,stringgrid1.Row+1]='' then
      stringgrid1.Cells[1,stringgrid1.Row+1]:='无限制';
    end
   else      //向下比较
    begin  //yes
     for i:=stringgrid1.Row+1 to stringgrid1.RowCount-1 do
      begin
       if (stringgrid1.Cells[1,i]<>'无限制') and (stringgrid1.Cells[1,i]<>'')  then
        begin           //如果是修改原来的范围
         IF (strtofloat(stringgrid1.Cells[1,stringgrid1.Row])>strtofloat(stringgrid1.Cells[1,i])) then
          begin
           stringgrid1.Cells[0,i]:='>'+stringgrid1.Cells[1,stringgrid1.row];
           stringgrid1.Cells[1,i]:=stringgrid1.Cells[1,stringgrid1.row];
           stringgrid1.Cells[0,i+1]:='>'+stringgrid1.Cells[1,i];
          end
         else
          stringgrid1.Cells[0,i]:='>'+stringgrid1.Cells[1,i-1];
         end
        else   //如果是新增的范围
         begin
          stringgrid1.Cells[0,i]:='>'+stringgrid1.Cells[1,i-1];
          stringgrid1.Cells[1,i]:='无限制';
          if stringgrid1.Cells[2,i]='' then
             stringgrid1.Cells[2,i]:='0.000';
          if stringgrid1.Cells[3,i]='' then
             stringgrid1.Cells[3,i]:='0.000';
          break;
         end;
       end;
    end;  //yes
  end     //...yes
  else    //如果当前行在第一行,或者不在第一行,但是当前行有'无限制',或者当前行是空行
   begin  //bbbyes
    for i:=stringgrid1.Row+1 to stringgrid1.RowCount-2 do
     begin
      if (stringgrid1.Cells[1,i]<>'无限制') and (stringgrid1.Cells[1,i]<>'') and (pos('无',stringgrid1.Cells[1,i-1])=0) then
       begin
        IF (strtofloat(stringgrid1.Cells[1,stringgrid1.Row])>strtofloat(stringgrid1.Cells[1,i])) then
         begin
          stringgrid1.Cells[1,i]:=stringgrid1.Cells[1,stringgrid1.row];
          stringgrid1.Cells[0,i+1]:='>'+stringgrid1.Cells[1,i];
         end
        else
         stringgrid1.Cells[0,i]:='>'+stringgrid1.Cells[1,i-1];
       end;
     end;
   if (stringgrid1.row=1) and (stringgrid1.Cells[1,2]='') and (pos('无',stringgrid1.Cells[1,stringgrid1.Row])=0) then
    begin
     stringgrid1.Cells[1,2]:='无限制';
     stringgrid1.Cells[2,stringgrid1.Row+1]:='0.000';
     stringgrid1.Cells[3,stringgrid1.Row+1]:='0.000';
    end;
   if (stringgrid1.Cells[1,stringgrid1.Row]<>'') and (pos('无',stringgrid1.Cells[1,stringgrid1.Row])=0) then
    stringgrid1.Cells[0,stringgrid1.Row+1]:='>'+stringgrid1.Cells[1,stringgrid1.Row];
   end; //bbbyes
 end;  // 结束....2
end;

procedure TForm2.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if (stringgrid1.Col=1) or (stringgrid1.Col=2) then
  if (length(stringgrid1.Cells[stringgrid1.Col,stringgrid1.row])>=10) and (key <> chr(8)) then
    abort; //第-,二列输入数字不能大于1000000000
 if (key = chr(46)) and (stringgrid1.Col=1) then
    abort;   //第一列不能输入小数点'.'

 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
    abort
 else       
 if (key = chr(46)) then
 if pos('.',stringgrid1.Cells[stringgrid1.Col,stringgrid1.row])>0
    then abort;//第二,三列小数点'.'不能重复

  if (stringgrid1.Row<>1) then
  if (stringgrid1.Cells[1,stringgrid1.Row-1]='无限制') or (stringgrid1.Cells[1,stringgrid1.Row-1]='') then
    abort;
   v_edit:=true;    
end;

procedure TForm2.StringGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=8) or (key=46) then   //如果用户按del键或者back键
 if (stringgrid1.Cells[1,stringgrid1.Row]='') and (stringgrid1.Col=1) then
    n1click(sender);           //调用删除菜单

 if (stringgrid1.Cells[1,stringgrid1.Row]='0') and (stringgrid1.Col=1) then
    n1click(sender);           //调用删除菜单


 if stringgrid1.Cells[3,stringgrid1.row]<>'' then  //第三列折扣输入数字不能大于99
 if (strtofloat(stringgrid1.Cells[3,stringgrid1.row])>99) and (key <>vk_back) then
   stringgrid1.Cells[3,stringgrid1.row]:='0';
end;

procedure TForm2.StringGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
//var
// i:byte;
begin
if (key=13) or (key=38) or (key=40) or (key=33) or (key=34)  then
 begin //开始
end; //结束
end;

procedure TForm2.N1Click(Sender: TObject);
var
 i:byte;
begin
 for i:= stringgrid1.Row+1 to stringgrid1.RowCount-1 do
  stringgrid1.Rows[i].Clear;
 if stringgrid1.Row<>1 then
  stringgrid1.Cells[0,stringgrid1.Row] := '>'+stringgrid1.Cells[1,stringgrid1.Row-1]
 else
  stringgrid1.Cells[0,stringgrid1.Row] :='0';
  stringgrid1.Cells[1,stringgrid1.Row] := '无限制';
end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
if (stringgrid1.Cells[1,stringgrid1.Row]='') or (pos('无',stringgrid1.Cells[1,stringgrid1.Row])<>0) then
   n1.Enabled:=false else
   n1.Enabled:=true;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Memo1.Lines.Assign(price_note);
 if edit_note.ShowModal=mrok then
  begin
   price_note.Text:=edit_note.Memo1.Text;
  end;
 finally
  edit_note.free;
 end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 price_note:=tstringlist.Create;

end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
 price_note.Free;
end;

procedure Tform2.save_note;
var
 i:byte;
begin
  if (not dm.ADO2811.IsEmpty) and (trim(price_note.Text)<>'') then
   begin //原记录有记事本
    dm.ADO2811.Edit;
    for i:=1 to price_note.Count do
    dm.ADO2811.fieldbyname('note_pad_line_'+inttostr(i)).asstring:=price_note.Strings[i-1];
    dm.ADO2811.Post;
   end
  else
   if (not dm.ADO2811.IsEmpty) and (trim(price_note.Text)='') then
    dm.ADO2811.Delete   //如果原记录有记事本但被删除了
   else
    if (dm.ADO2811.IsEmpty) and (trim(price_note.Text)<>'') then
     begin    //如果原记录没有记事本，但新增了记事本
      dm.ADO2811.Append;
      dm.ADO2811.FieldByName('file_pointer').AsString:=dm.ADO28.fieldbyname('rkey').AsString;
      dm.ADO2811.Fieldvalues['source_type']:=28;
      for i:=1 to price_note.Count do
       dm.ADO2811.fieldbyname('note_pad_line_'+inttostr(i)).asstring:=price_note.Strings[i-1];
      dm.ADO2811.Post;
     end;
end;


procedure TForm2.Edit1Click(Sender: TObject);
begin
 if edit1.Font.Color=clwindowtext then
  begin
   edit1.Font.color :=clblue;
   edit1.SelectAll;
  end;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
 try
  form_inv:=tform_inv.Create(application);
  form_inv.ADOQuery1.Close;
  form_inv.ADOQuery1.Parameters[1].Value:=trim(edit1.Text);
  form_inv.ADOQuery1.Open;
  if form_inv.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
    edit1.SetFocus;
   end
  else
  if form_inv.ShowModal=mrok then
   begin
    self.save_inv;
    if (activecontrol.Name='BitBtn4') then
     dbedit1.SetFocus;
   end
  else
    edit1.SetFocus;
 finally
  form_inv.free;
 end;
end;

procedure TForm2.Edit3Click(Sender: TObject);
begin
if edit3.Font.Color=clwindowtext then
 begin
  edit3.Font.Color := clblue;
  edit3.SelectAll;
 end;
end;

procedure TForm2.Edit3Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn6') and (activecontrol.Name<>'BitBtn3') then
 try
  form_curr:=tform_curr.Create(application);
  form_curr.Edit1.Text :=trim(edit3.Text);
 if comparetext(trim(edit3.text),trim(form_curr.ADOQuery1.Fieldbyname('curr_code').AsString))=0 then
  begin
   edit3.Font.Color := clwindowtext;
   label11.Caption := form_curr.ADOQuery1.FieldValues['curr_name'];
   dm.ADO28CURRENCY_PTR.Value := form_curr.ADOQuery1.FieldValues['rkey'];
  end
 else
   begin
    messagedlg('货币单位不正确,请重新输入或选择',mtinformation,[mbok],0);
    label11.Caption := '';
    edit3.SetFocus;
   end;
 finally
  form_curr.free;
 end;
end;

procedure TForm2.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn4') and (activecontrol.Name<>'BitBtn3') then
 try
  form_inv:=tform_inv.Create(application);
  form_inv.ADOQuery1.Close;
  form_inv.ADOQuery1.Parameters[1].Value:=trim(edit1.Text);
  form_inv.ADOQuery1.Open;  

  if comparetext(trim(edit1.text),trim(form_inv.ADOQuery1.Fieldbyname('inv_part_number').AsString))=0 then
   self.save_inv
 else
  begin
   messagedlg('原材料号码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label9.Caption := '';
   edit1.SetFocus;
  end;
 finally
  form_inv.Free;
 end;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
 try
  form_supp:=tform_supp.Create(application);
  form_supp.Edit1.Text := trim(edit2.Text);
  if form_supp.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找符合条件的记录!',mtwarning,[mbok],0);
    edit2.SetFocus;
   end
  else
  if form_supp.ShowModal=mrok then
   begin
    self.save_supp;
    if (activecontrol.Name='BitBtn5') then
     dbedit1.SetFocus;
   end
  else
   edit2.SetFocus;
 finally
  form_supp.free;
 end;
end;

procedure TForm2.Edit2Click(Sender: TObject);
begin
 if edit2.Font.Color=clwindowtext then
  begin
   edit2.Font.color :=clblue;
   edit2.SelectAll;
  end;
end;

procedure TForm2.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name <> 'BitBtn5') and (activecontrol.Name <> 'BitBtn3') then
 try
  form_supp := tform_supp.Create(application);
  form_supp.Edit1.Text := trim(edit2.Text);
  if comparetext(trim(edit2.text),trim(form_supp.ADOQuery1.Fieldbyname('code').AsString))=0 then
   self.save_supp
  else
   begin
    messagedlg('供应商代码不正确,请重新输入或选择',mtinformation,[mbok],0);
    label10.Caption := '';
    edit2.SetFocus;
   end;
 finally
  form_supp.Free;
 end;
end;

procedure TForm2.save_supp;
begin
 with dm.ADOQuery2 do
  begin
   if active=true then active:=false;
   sql.Clear;
   sql.Add('select rkey from data0028');
   sql.Add('where supplier_ptr='+form_supp.ADOQuery1.fieldbyname('rkey').AsString);
   sql.Add('and inventory_ptr='+dm.ADO28INVENTORY_PTR.AsString);
   active := true;
  end;
 if not dm.ADOQuery2.IsEmpty then
  BEGIN
   messagedlg('该供应商已有材料'+trim(edit1.Text)+' 价格表',mtinformation,[mbcancel],0);
   edit2.Text := '';
   edit2.SetFocus;
  END
 else
 BEGIN
 edit2.Text := form_supp.ADOQuery1.FieldValues['code'];
 edit2.Font.Color := clwindowtext;
 label10.Caption := form_supp.ADOQuery1.FieldValues['supplier_name'];
 dm.ADO28SUPPLIER_PTR.Value := form_supp.ADOQuery1.FieldValues['rkey'];
 with dm.ADOQuery1 do      //上行给供应商指针赋值
  begin
   if active = true then active := false;
   sql.Clear;              //查找供应商货币
   sql.Add('select curr_code,curr_name,currency_ptr from data0001,data0023');
   sql.Add('where data0023.currency_ptr=data0001.rkey and');
   sql.Add('data0023.rkey='+form_supp.ADOQuery1.fieldbyname('rkey').AsString);
   active:=true;
   dm.ADO28CURRENCY_PTR.Value := fieldvalues['currency_ptr']; //给货币指针赋值
   edit3.Text := fieldvalues['curr_code'];
   label11.Caption := fieldvalues['curr_name'];
   edit3.Enabled:=TRUE;
   BITBTN6.Enabled:=true;
  end;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('SELECT Data0024.SHIPPING_LEAD_TIME,Data0189.STATE_TAX');
   sql.Add('FROM Data0024 INNER JOIN');
   sql.Add('Data0189 ON Data0024.CITY_TAX_PTR = Data0189.RKEY');
   sql.Add('where Data0024.SUPPLIER_PTR='+dm.ADO28SUPPLIER_PTR.AsString);
   sql.Add('order by data0024.rkey');
   open;
   dm.ADO28LEAD_TIME.Value := fieldvalues['SHIPPING_LEAD_TIME'];
   dm.ADO28TAX_2.Value := fieldvalues['state_tax'];
  end;
 edit5.Enabled := true;
 bitbtn7.Enabled := true;
 if comparetext(trim(edit5.text),trim(edit4.Text))<>0 then
  dbedit3.Enabled := true;
 bitbtn1.Enabled := true;
 bitbtn2.Enabled := true;
 pagecontrol1.Enabled := true;
 self.get_newprice();
END;

end;


procedure TForm2.save_inv;
begin
 with dm.ADOQuery1 do
  begin
   if active=true then active:=false;
   sql.Clear;
   sql.Add('select rkey from data0028');
   sql.Add('where supplier_ptr='+dm.ADO28SUPPLIER_PTR.AsString);
   sql.Add('and inventory_ptr='+form_inv.ADOQuery1RKEY.AsString);
   active:=true;
  end;
 if not dm.ADOQuery1.IsEmpty then
  BEGIN
   messagedlg('该材料在供应商: '+edit2.Text+' 已有价格表',mtinformation,[mbcancel],0);
   edit1.Text := '';
   edit1.SetFocus;
  END
 else
  begin //开始..1
   edit1.Text := form_inv.ADOQuery1INV_PART_NUMBER.Value;
   edit1.Font.Color := clwindowtext;
   label9.Caption := form_inv.ADOQuery1INV_PART_DESCRIPTION.Value;
   dm.ADO28INVENTORY_PTR.Value := form_inv.ADOQuery1RKEY.Value;
   with dm.adoquery2 do
    begin                //查找存货单位 ..同时查找首选供应商
     if active=true then active:=false;
     sql.Clear;
     SQL.Add('SELECT unit_code,unit_name,data0023.code');
     sql.add('from data0002,data0017 left outer join data0023');
     sql.Add('on data0017.pref_supplier_ptr= data0023.rkey');
     sql.Add('where data0017.stock_unit_ptr=data0002.rkey');
     sql.Add('and data0017.rkey='+form_inv.ADOQuery1RKEY.AsString);
     active:=true;
     edit4.Text := fieldvalues['unit_code'];
     label13.Caption := fieldvalues['unit_name'];
     bar1.SimpleText := '首选供应商: '+fieldbyname('code').AsString;
    end;
   with dm.adoquery2 do
    begin                 //查找采购单位 //同时查找可用标记
     if active=true then active:=false;
      sql.Clear;
      sql.Add('select data0002.rkey,unit_code,unit_name,avl_flag,stock_purch');
      sql.Add('from data0002,data0017');
      sql.Add('where data0017.purch_unit_ptr=data0002.rkey and');
      sql.Add('data0017.rkey='+form_inv.ADOQuery1RKEY.AsString);
      active:=true;
      edit5.Text := fieldvalues['unit_code'];
      edit5.Font.Color := clwindowtext;
      label12.Caption := fieldvalues['unit_name'];
      dm.ADO28PURCHASE_UNIT_PTR.Value := fieldvalues['rkey']; //给采购单位赋值
      dm.ADO28CONVERSION_FACTOR.Value := fieldvalues['stock_purch']; //给单位转换率赋值
     if fieldvalues['avl_flag']='N' then
      begin
       dm.ADO28AVL_FLAG.Value := 'Y';
       combobox1.ItemIndex :=0;
      end
     else
      begin
       dm.ADO28AVL_FLAG.Value := 'N';
       combobox1.ItemIndex :=1;
      end;
      if comparetext(trim(edit5.text),trim(edit4.Text))<>0 then
       dbedit3.Enabled := true;
    end;
   combobox2.ItemIndex :=0;  //订购方法
   dm.ADO28AMT_QUAN_FLAG.Value :=1; //给订购方法赋值 默认按数量....
   edit5.Enabled := true;
   bitbtn7.Enabled := true;
   edit3.Enabled := true;
   bitbtn6.Enabled := true;
   bitbtn1.Enabled := true;
   bitbtn2.Enabled := true;
   pagecontrol1.Enabled := true;
   self.get_newprice();
  end; //结束...1
end;

procedure TForm2.Edit6Click(Sender: TObject);
begin
 if edit6.Font.Color=clwindowtext then
  begin
   edit6.Font.Color := clNone;
   edit6.SelectAll;
  end;
end;

procedure TForm2.DBEdit6Click(Sender: TObject);
begin
 if dbedit6.Font.Color= clwindowtext then
  begin
   dbedit6.Font.Color := clNone;
   dbedit6.SelectAll;
  end;
end;

procedure TForm2.DBEdit6Exit(Sender: TObject);
begin
 if dbedit6.Text ='' then
  dbedit6.Field.Value :=0;
 dbedit6.Font.Color := clwindowtext;
end;

procedure TForm2.DBEdit7Click(Sender: TObject);
begin
 if dbedit7.Font.Color= clwindowtext then
  begin
   dbedit7.Font.Color := clNone;
   dbedit7.SelectAll;
  end;
end;

procedure TForm2.DBEdit7Exit(Sender: TObject);
begin
 if dbedit7.Text ='' then
  dbedit7.Field.Value :=0;
 dbedit7.Font.Color := clwindowtext;
end;

procedure TForm2.DBEdit2Click(Sender: TObject);
begin
 if dbedit2.Font.Color= clwindowtext then
  begin
   dbedit2.Font.Color := clNone;
   dbedit2.SelectAll;
  end;
end;

procedure TForm2.DBEdit2Exit(Sender: TObject);
begin
 if dbedit2.Text ='' then   dbedit2.Field.Value :=0;
 dbedit2.Font.Color := clwindowtext;
end;

procedure TForm2.StringGrid1Exit(Sender: TObject);
var
 i:byte;
begin
if (stringgrid1.Col=2) or (stringgrid1.Col=3) then  //如果是在第二,三列
 begin
  if stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]<>'' then
   stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]:=
   formatfloat('0.000',strtofloat(stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]))
  else
   if stringgrid1.Cells[1,stringgrid1.Row]<>'' then
    stringgrid1.Cells[stringgrid1.Col,stringgrid1.Row]:='0.000';
 end
else      //...............如果是在第一列
begin  // 开始....2
 if (stringgrid1.Row>1) and (stringgrid1.Cells[1,stringgrid1.Row]<>'')
  and (pos('无',stringgrid1.Cells[1,stringgrid1.Row])=0)  then
  begin   //...yes    //如果不在第一行并且当前行不是空行,并且没有'无限制'
   IF (strtofloat(stringgrid1.Cells[1,stringgrid1.Row])<strtofloat(stringgrid1.Cells[1,stringgrid1.Row-1])) then
    begin   //向上比较
     stringgrid1.Cells[1,stringgrid1.Row]:=stringgrid1.Cells[1,stringgrid1.Row-1];
     stringgrid1.Cells[0,stringgrid1.Row+1]:='>'+stringgrid1.Cells[1,stringgrid1.Row];
     if stringgrid1.Cells[2,stringgrid1.Row+1]='' then
      stringgrid1.Cells[2,stringgrid1.Row+1]:='0.000';
     if stringgrid1.Cells[3,stringgrid1.Row+1]='' then
      stringgrid1.Cells[3,stringgrid1.Row+1]:='0.000';
     if stringgrid1.Cells[1,stringgrid1.Row+1]='' then
      stringgrid1.Cells[1,stringgrid1.Row+1]:='无限制';
    end
   else      //向下比较
    begin  //yes
     for i:=stringgrid1.Row+1 to stringgrid1.RowCount-1 do
      begin
       if (stringgrid1.Cells[1,i]<>'无限制') and (stringgrid1.Cells[1,i]<>'')  then
        begin           //如果是修改原来的范围
         IF (strtofloat(stringgrid1.Cells[1,stringgrid1.Row])>strtofloat(stringgrid1.Cells[1,i])) then
          begin
           stringgrid1.Cells[0,i]:='>'+stringgrid1.Cells[1,stringgrid1.row];
           stringgrid1.Cells[1,i]:=stringgrid1.Cells[1,stringgrid1.row];
           stringgrid1.Cells[0,i+1]:='>'+stringgrid1.Cells[1,i];
          end
         else
          stringgrid1.Cells[0,i]:='>'+stringgrid1.Cells[1,i-1];
         end
        else   //如果是新增的范围
         begin
          stringgrid1.Cells[0,i]:='>'+stringgrid1.Cells[1,i-1];
          stringgrid1.Cells[1,i]:='无限制';
          if stringgrid1.Cells[2,i]='' then
             stringgrid1.Cells[2,i]:='0.000';
          if stringgrid1.Cells[3,i]='' then
             stringgrid1.Cells[3,i]:='0.000';
          break;
         end;
       end;
    end;  //yes
  end     //...yes
  else    //如果当前行在第一行,或者不在第一行,但是当前行有'无限制',或者当前行是空行
   begin  //bbbyes
    for i:=stringgrid1.Row+1 to stringgrid1.RowCount-2 do
     begin
      if (stringgrid1.Cells[1,i]<>'无限制') and (stringgrid1.Cells[1,i]<>'') and (pos('无',stringgrid1.Cells[1,i-1])=0) then
       begin
        IF (strtofloat(stringgrid1.Cells[1,stringgrid1.Row])>strtofloat(stringgrid1.Cells[1,i])) then
         begin
          stringgrid1.Cells[1,i]:=stringgrid1.Cells[1,stringgrid1.row];
          stringgrid1.Cells[0,i+1]:='>'+stringgrid1.Cells[1,i];
         end
        else
         stringgrid1.Cells[0,i]:='>'+stringgrid1.Cells[1,i-1];
       end;
     end;
   if (stringgrid1.row=1) and (stringgrid1.Cells[1,2]='') and (pos('无',stringgrid1.Cells[1,stringgrid1.Row])=0) then
    begin
     stringgrid1.Cells[1,2]:='无限制';
     stringgrid1.Cells[2,stringgrid1.Row+1]:='0.000';
     stringgrid1.Cells[3,stringgrid1.Row+1]:='0.000';
    end;
   if (stringgrid1.Cells[1,stringgrid1.Row]<>'') and (pos('无',stringgrid1.Cells[1,stringgrid1.Row])=0) then
    stringgrid1.Cells[0,stringgrid1.Row+1]:='>'+stringgrid1.Cells[1,stringgrid1.Row];
   end; //bbbyes
 end;  // 结束....2

end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if v_close<>1 then
 begin
  dm.ADO28.Cancel;
  dm.aq0028.Close;
  dm.aq0028.Open;
 end;
end;

procedure TForm2.DBEdit3Exit(Sender: TObject);
begin
if (trim(dbedit3.Text)='') or (dbedit3.Field.Value<0) then
 begin
  dm.ADO28CONVERSION_FACTOR.Value:=0;
 end;
end;

procedure TForm2.get_newprice;
var
 i:byte;
begin
for i:=1 to stringgrid2.RowCount-1 do stringgrid2.Rows[i].Clear;
stringgrid2.RowCount:=2;
with dm.ADOQuery2 do
 begin
  close;
  sql.Clear;
  sql.Add('SELECT TOP 100 Data0070.PO_NUMBER,Data0071.QUAN_ORD,');
  sql.Add('Data0071.PRICE, Data0071.DISCOUNT, Data0071.TAX_2,Data0070.PO_DATE,');
  sql.Add('data0005.employee_name');
  sql.Add('FROM Data0070 INNER JOIN Data0071 ON Data0071.PO_PTR = Data0070.RKEY');
  sql.Add('inner join data0005 on data0070.EMPLOYEE_POINTER=data0005.rkey ');
  sql.Add('where data0071.INVT_PTR='+dm.ADO28INVENTORY_PTR.AsString);
  sql.Add('and data0070.SUPPLIER_POINTER='+dm.ADO28SUPPLIER_PTR.AsString);
  sql.Add('ORDER BY Data0070.PO_DATE DESC');
  open;
 end;
while not dm.ADOQuery2.Eof do
 begin
  stringgrid2.Cells[0,stringgrid2.RowCount-1]:=dm.ADOQuery2.FieldValues['po_number'];
  stringgrid2.Cells[1,stringgrid2.RowCount-1]:=dm.ADOQuery2.FieldValues['employee_name'];
  stringgrid2.Cells[2,stringgrid2.RowCount-1]:=dm.ADOQuery2.fieldbyname('po_date').AsString;
  stringgrid2.Cells[3,stringgrid2.RowCount-1]:=dm.ADOQuery2.fieldbyname('quan_ord').AsString;
  stringgrid2.Cells[4,stringgrid2.RowCount-1]:=dm.ADOQuery2.fieldbyname('price').AsString;
  stringgrid2.Cells[5,stringgrid2.RowCount-1]:=dm.ADOQuery2.fieldbyname('discount').AsString;
  stringgrid2.Cells[6,stringgrid2.RowCount-1]:=dm.ADOQuery2.fieldbyname('tax_2').AsString;
  stringgrid2.RowCount:=stringgrid2.RowCount+1;
  dm.ADOQuery2.Next;
 end;
dm.ADOQuery2.Close;
end;

end.
