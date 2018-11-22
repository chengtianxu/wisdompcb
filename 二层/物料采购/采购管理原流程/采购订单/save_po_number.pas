unit save_po_number;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls;

type
  TForm12 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Button1: TButton;
    Button2: TButton;
    DBEdit1: TDBEdit;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    DBComboBox1: TDBComboBox;
    BitBtn2: TBitBtn;
    DBEdit3: TDBEdit;
    BitBtn3: TBitBtn;
    DBEdit6: TDBEdit;
    BitBtn4: TBitBtn;
    RadioGroup1: TRadioGroup;
    Edit2: TEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure supplier_Exit();
    procedure change_seed_value();
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
   v_close:byte;
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation
uses damo, main, supp_search, ssadd_search, shipmeoth_search,
  warehouse_search,common;
{$R *.dfm}

procedure TForm12.Button1Click(Sender: TObject);
begin
if trim(edit2.Text) = '' then
 begin
  messagedlg('工厂不能为空!',mtinformation,[mbok],0);
  edit2.SetFocus;
  exit;
 end;

if edit1.Font.Color=clblue then
 begin
  messagedlg('供应商代码不能为空!',mtinformation,[mbok],0);
  edit1.SetFocus;
  exit;
 end;

 dm.ADOConnection1.BeginTrans;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 dm.ADO70STATUS.Value := 3;       //3表示该定单号是被保留
 dm.ADO70DISCOUNT2_DAYS.Value := RadioGroup1.ItemIndex;
  with dm.ADOQuery2 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('select v_dt = getdate()');
    active:=true;   //读取系统时间
    dm.ADO70PO_DATE.asstring := datetostr(fieldvalues['v_dt']);
   end;
   dm.ADO70COLLECT_PREPAID.Value := 'C';
   dm.ADO70SHIPPING_COST.Value := 0;
   dm.ADO70MISC_CHARGE.Value := 0;
   dm.ADO70SUB_TOTAL.Value := 0;
   dm.ADO70DISCOUNT_AMOUNT.Value := 0;
   dm.ADO70CSI_USER_POINTER.AsString := rkey73;
   dm.ADO70EMPLOYEE_POINTER.Value := form1.v_employee;
   dm.ADO70PURCHASE_ORDER_TYPE.Value :=1;//表示手工新增po
  try
   dm.ADO70.Post;
   dm.ADO70.UpdateBatch();
   self.change_seed_value();
   dm.aq0015.UpdateBatch(); //保存控制码
  except
   messagedlg('数据保存失败,请检查编号是否重复',mtinformation,[mbcancel],0);
   dm.ADOConnection1.RollbackTrans;
   dm.ADO70.Edit;
   edit2.SetFocus;
   exit;
  end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 try
  dm.ADOConnection1.CommitTrans;
 except
  dm.ADOConnection1.RollbackTrans;
 end;
 v_close:=1;
 ModalResult:=mrok;
end;

procedure TForm12.Button2Click(Sender: TObject);
begin
 v_close:=1;
 dm.ADO70.Cancel;
end;

procedure TForm12.ComboBox1Change(Sender: TObject);
begin
 if combobox1.ItemIndex=0 then
  dm.ADO70PO_TYPE.Value := 'S'
 else
  dm.ADO70PO_TYPE.Value := 'M';
end;

procedure TForm12.BitBtn1Click(Sender: TObject);
begin
try
 form_supp:=tform_supp.Create(application);
 form_supp.Edit1.Text := trim(edit1.Text);
 if form_supp.ADOQuery1.IsEmpty then
  begin
   messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
   edit1.SetFocus;
  end
 else
 if form_supp.ShowModal=mrok then
  begin
   form12.supplier_Exit;
   dbedit2.SetFocus;
  end
 else
  edit1.SetFocus;
finally
 form_supp.free;
end;
end;

procedure TForm12.Edit1Click(Sender: TObject);
begin
 if edit1.Font.Color=clwindowtext then
  begin
   edit1.Font.Color:=clblue;
   edit1.SelectAll;
  end;
end;

procedure TForm12.BitBtn2Click(Sender: TObject);
begin
if edit1.Font.Color=clblue then
 begin
  messagedlg('请先选择供应商',mtinformation,[mbok],0);
 end
else
 try
  form_address:=tform_address.Create(application);
  form_address.ADOQuery1.Close;
  form_address.ADOQuery1.Parameters[1].Value := dm.ADO70SUPPLIER_POINTER.Value;
  form_address.ADOQuery1.Open;
  if form_address.ShowModal=mrok then
   begin
    dm.ADO70SUPP_FAC_ADD_PTR.Value := form_address.ADOQuery1.FieldValues['rkey'];
    dm.ADO70FEDERAL_TAX.Value := form_address.ADOQuery1.FieldValues['state_tax'];
    dm.ADO70STATE_SHIP_TAX_FLAG.Value := form_address.ADOQuery1.FieldValues['STATE_SHIP_TAX_FLAG'];
    dm.ADO70STATE_MISC_TAX_FLAG.Value := form_address.ADOQuery1.FieldValues['STATE_MISC_TAX_FLAG'];
    dbcombobox1.SetFocus;
   end
  else
   dbedit2.SetFocus;
 finally
  form_address.free;
 end;
end;

procedure TForm12.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'Button2')
   and (trim(edit1.Text)<>'') then
 try
  form_supp:=tform_supp.Create(application);
  form_supp.Edit1.Text := trim(edit1.Text);
 if comparetext(trim(edit1.text),trim(form_supp.ADOQuery1.Fieldbyname('code').AsString))=0 then
  self.supplier_Exit
 else
  begin
   messagedlg('供应商代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label10.Caption := '';
   edit1.SetFocus;
  end;
 finally
  form_supp.Free;
 end;
end;

procedure TForm12.supplier_Exit();
var
 i:byte;
begin
 edit1.Text := form_supp.ADOQuery1.FieldValues['code'];
 edit1.Font.Color := clwindowtext;
 label10.Caption := form_supp.ADOQuery1.FieldValues['supplier_name'];
 dm.ADO70SUPPLIER_POINTER.Value := form_supp.ADOQuery1.FieldValues['rkey'];
 with dm.ADOQuery1 do//给联络人,电话赋值
  begin
   active:=false;
   sql.Clear;
   sql.Add('select CONTACT_NAME_1,CONTACT_NAME_2,CONTACT_NAME_3,currency_ptr,');
   sql.Add('CONTACT_NAME_4,CONTACT_NAME_5,CONTACT_NAME_6,PHONE,');
   sql.Add('discount,discount2,discount_days,payment_terms,');
   sql.Add('tax_id_number,ANALYSIS_CODE1,ANALYSIS_CODE2,fax,');
   sql.Add('data0001.exch_rate from data0023,data0001');
   sql.Add('where data0023.currency_ptr=data0001.rkey and');
   sql.Add('data0023.rkey='+dm.ADO70SUPPLIER_POINTER.AsString);
   active :=true;
   dbCombobox1.Clear;

   for i:=1 to 6 do     //联络人
    dbcombobox1.Items.Add(fieldbyname('contact_name_'+inttostr(i)).asstring);
   dm.ADO70SUPPIER_CONTACT.Value := fieldbyname('CONTACT_NAME_1').AsString;

   dm.ADO70CONTACT_PHONE.Value := trim(fieldbyname('PHONE').AsString)+'/'+
                                  trim(fieldbyname('fax').AsString); //4客户联络人电话

   dm.ADO70PAYMENT_TERMS.Value := fieldvalues['payment_terms'];
   dm.ADO70CASH_DISCOUNT.Value := fieldvalues['discount'];
   dm.ADO70CASH_DISCOUNT2.Value := fieldvalues['discount2'];
   dm.ADO70DISCOUNT_DAYS.Value := fieldvalues['discount_days'];

   dm.ADO70CURRENCY_PTR.Value := fieldvalues['currency_ptr'];
   dm.ADO70EXCHANGE_RATE.Value := fieldvalues['exch_rate'];
   dm.ADO70ANALYSIS_CODE_5.Value := fieldbyname('tax_id_number').AsString;//付款方法
   dm.ADO70ANALYSIS_CODE_4.Value := fieldbyname('ANALYSIS_CODE1').AsString;//票据种类
   dm.ADO70ANALYSIS_CODE_3.Value := fieldbyname('ANALYSIS_CODE2').AsString;//票据种类
  end;

 with dm.ADOQuery1 do//复制装运地址中的值
  begin
   active:=false;
   sql.Clear;
   sql.Add('SELECT Data0024.RKEY,data0024.SHIPPING_LEAD_TIME,factory_location,');
   sql.Add('data0024.state_misc_tax_flag,data0024.state_ship_tax_flag,');
   sql.Add('data0189.state_tax');
   sql.Add('FROM Data0024,data0189');
   sql.Add('WHERE data0024.city_tax_ptr=data0189.rkey and');
   sql.Add('Data0024.SUPPLIER_PTR ='+dm.ADO70SUPPLIER_POINTER.AsString);
   active:=true;
   dm.ADO70SUPP_FAC_ADD_PTR.Value := FieldValues['rkey'];
   dm.ADO70FEDERAL_TAX.Value := FieldValues['state_tax'];
   dm.ADO70STATE_SHIP_TAX_FLAG.Value := FieldValues['STATE_SHIP_TAX_FLAG'];
   dm.ADO70STATE_MISC_TAX_FLAG.Value := FieldValues['STATE_MISC_TAX_FLAG'];
  end;
end;

procedure TForm12.BitBtn4Click(Sender: TObject);
begin
 try
  form_shipmethod:=tform_shipmethod.Create(application);
  if form_shipmethod.ShowModal=mrok then
   begin
    dbedit6.Field.Value:=form_shipmethod.ADOQuery1.FieldValues['description'];
    button1.SetFocus;
   end
  else
   dbedit6.SetFocus;
 finally
  form_shipmethod.free;
 end;
end;

procedure TForm12.BitBtn3Click(Sender: TObject);
begin
 try
  form_wh:=tform_wh.Create(application);
  with form_wh.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('select * from data0015');
    sql.Add('order by warehouse_code');
    active:=true;
   end;
  form_wh.Edit1.Text := trim(edit2.Text);
 if form_wh.ADOQuery1.IsEmpty then
  messagedlg('没有找到相关记录!',mtinformation,[mbok],0)
 else
  if form_wh.ShowModal=mrok then
   begin
    if RadioGroup1.ItemIndex=0 then       //国内采购
     dm.ADO70PO_NUMBER.Value := form_wh.ADOQuery1.fieldbyname('purchase_order').AsString
    else                                     //国外采购
     dm.ADO70PO_NUMBER.Value :=form_wh.ADOQuery1.fieldbyname('o_purchase_order').AsString;
    radiogroup1.Enabled := false;
    dm.ADO70WAREHOUSE_POINTER.Value := form_wh.ADOQuery1.FieldValues['rkey'];
    edit2.Text := form_wh.ADOQuery1.fieldbyname('warehouse_code').AsString;
    edit2.Font.Color := clwindowtext;
    label8.Caption := form_wh.ADOQuery1.fieldbyname('warehouse_name').AsString;
    edit1.SetFocus;
   end
  else
   edit2.SetFocus;
 finally
  form_wh.free;
 end;
end;

procedure TForm12.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if v_close<>1 then dm.ADO70.Cancel;
end;

procedure TForm12.Edit2Click(Sender: TObject);
begin
 if edit1.Font.Color=clwindowtext then
  begin
   edit1.Font.Color:=clblue;
   edit1.SelectAll;
  end;
end;

procedure TForm12.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'button2')
   and (trim(edit2.Text)<>'') then
 try
  form_wh:=tform_wh.Create(application);
   with form_wh.ADOQuery1 do
    begin
     active:=false;
     sql.Clear;
     sql.Add('select *');
     sql.Add('from data0015');
     sql.Add('order by warehouse_code');
     active:=true;
    end;
  form_wh.Edit1.Text := trim(edit2.Text);
 if comparetext(trim(edit2.text),trim(form_wh.ADOQuery1.Fieldbyname('warehouse_code').AsString))=0 then
  begin
   if RadioGroup1.ItemIndex=0 then       //国内采购
    dm.ADO70PO_NUMBER.Value := form_wh.ADOQuery1.fieldbyname('purchase_order').AsString
   else                                     //国外采购
    dm.ADO70PO_NUMBER.Value :=form_wh.ADOQuery1.fieldbyname('o_purchase_order').AsString;
   radiogroup1.Enabled := false;
   dm.ADO70WAREHOUSE_POINTER.Value := form_wh.ADOQuery1.FieldValues['rkey'];
   edit2.Text := form_wh.ADOQuery1.fieldbyname('warehouse_code').AsString;
   edit2.Font.Color := clwindowtext;
   label8.Caption := form_wh.ADOQuery1.fieldbyname('warehouse_name').AsString;
  end
 else
  begin
   messagedlg('工厂代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label8.Caption := '';
   edit2.SetFocus;
  end;
 finally
  form_wh.Free;
 end
else
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'button2')
   and (trim(edit2.Text)='') then
 begin
  dm.ADO70PO_NUMBER.Value := '';
  radiogroup1.Enabled := true;
  label8.Caption := '';
 end;
end;


procedure tform12.change_seed_value();
var
 v_last,new_seed:string;
 i,control_no:word;
begin
  control_no := length(trim(dm.ADO70PO_NUMBER.Value));
  dm.AQ0015.Active:=false;
  dm.AQ0015.Parameters[0].Value := dm.ADO70WAREHOUSE_POINTER.Value;
  dm.AQ0015.Active:=true;            //打开工厂采购订单初始值

  for i := control_no downto 1 do
   if (dm.ADO70PO_NUMBER.Text[i]<'0') or (dm.ADO70PO_NUMBER.Text[i]>'9') then
    begin
     v_last := floattostr(100000000000000+strtofloat(copy(dm.ADO70PO_NUMBER.Value,i+1,control_no-i))+1); //后缀加1
     new_seed := copy(dm.ADO70PO_NUMBER.Value,1,i)+copy(v_last,15-(control_no-i)+1,control_no-i);
     dm.AQ0015.edit;
     if dm.ADO70DISCOUNT2_DAYS.Value=0 then
      dm.AQ0015purchase_order.value := new_seed
     else
      dm.AQ0015o_purchase_order.value := new_seed;
     dm.AQ0015.Post;
     break;
    end
   else
    if i=1 then //如果第一位仍然是数字
     begin
      v_last := floattostr(1000000000000000+strtofloat(dm.ADO70PO_NUMBER.Value)+1);
      new_seed := copy(v_last,16-control_no+1,control_no);
      dm.AQ0015.edit;
      if dm.ADO70DISCOUNT2_DAYS.Value=0 then
       dm.AQ0015purchase_order.value := new_seed
      else
       dm.AQ0015o_purchase_order.value := new_seed;
      dm.AQ0015.Post;
     end;
end;

procedure TForm12.RadioGroup1Click(Sender: TObject);
begin
dm.ADO70DISCOUNT2_DAYS.Value := radiogroup1.ItemIndex;
end;

end.
