unit add_po;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ExtCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    MaskEdit1: TMaskEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    rkey17: TLabel;
    rkey23: TLabel;
    rkey15: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    rkey02: TLabel;
    rkey01: TLabel;
    Label14: TLabel;
    Edit8: TEdit;
    edit9: TComboBox;
    Label15: TLabel;
    Label16: TLabel;
    Edit10: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    Edit11: TEdit;
    BitBtn4: TBitBtn;
    RadioGroup1: TRadioGroup;
    Label17: TLabel;
    Edit12: TEdit;
    Button3: TButton;
    Label20: TLabel;
    Edit13: TEdit;
    Label21: TLabel;
    Edit14: TEdit;
    Label22: TLabel;
    Edit15: TEdit;
    Label23: TLabel;
    ComboBox1: TComboBox;
    Label24: TLabel;
    req_unitptr: TLabel;
    Label_vmi: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Edit16: TEdit;
    Label27: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label28: TLabel;
    Edit17: TEdit;
    Label29: TLabel;
    Edit18: TEdit;
    CheckBox3: TCheckBox;
    Edit19: TEdit;
    Label30: TLabel;
    BitBtn5: TBitBtn;
    procedure Edit1Click(Sender: TObject);
    procedure change_color(v_comp: TEdit);
    procedure Edit3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure save_inv();
    procedure Edit3Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit8KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure active_inv_exit(type_:byte);
    procedure find_refsupp();
    procedure inv_supp();    
    procedure Edit6Click(Sender: TObject);
    procedure Edit7Click(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit11Click(Sender: TObject);
    procedure Edit11Exit(Sender: TObject);
    procedure BitBtn4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn4Exit(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit14Exit(Sender: TObject);
    procedure Edit13Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit19DblClick(Sender: TObject);
  private
    { Private declarations }
   price:double;    //交付排程含税价
   prot_ptr:Integer;
   function find_supp_protection(prot_report_ptr:Integer):Boolean;
  public
    { Public declarations }
   add_new_type:byte;
   SECOND_WHSE_PTR:integer;
  end;

var
  Form2: TForm2;

implementation

uses inv_search,damo, supp_price_search, warehouse_search, 
  supp_search, Unit_search, edit_add_po,Pick_Item_Single,ConstVar, kucun_serach;

{$R *.dfm}

procedure TForm2.find_refsupp();
begin
 label26.Caption:=form_inv.ADOQuery1.fieldbyname('CRITICAL_MATL').AsString; //重要标识
 CheckBox1.Checked:=Trim(form_inv.ADOQuery1.fieldbyname('CATALOG_NUM').AsString)='Y'; //环保认可
 edit1.Text := form_inv.ADOQuery1['INV_PART_NUMBER'];
 edit1.Font.Color := clwindowtext;
 Edit17.Text := form_inv.ADOQuery1.fieldbyname('REPORT_VALUE2').AsString;
 Edit18.Text := form_inv.ADOQuery1.fieldbyname('CONSIGN_ONHAND_QTY').AsString;
 label2.Caption := form_inv.ADOQuery1['INV_PART_DESCRIPTION'];
 rkey17.Caption := form_inv.ADOQuery1.fieldbyname('RKEY').AsString;
// po_avlflag.Caption:=form_inv.ADOQuery1.fieldbyname('INSPECT').AsString;//是否需要检查
 CheckBox3.Checked:= form_inv.ADOQuery1.fieldbyname('INSPECT').AsString='Y'; //是否需要检查
 edit2.Text := dm.adoquery1.fieldvalues['code'];
 label5.Caption := dm.adoquery1.fieldvalues['supplier_name'];
 rkey23.Caption := dm.adoquery1.fieldbyname('supplier_ptr').AsString;
 rkey01.Caption := dm.adoquery1.fieldbyname('currency_ptr').AsString;
 rkey02.Caption := dm.adoquery1.fieldbyname('purchase_unit_ptr').AsString;
 label13.Caption := dm.adoquery1.fieldbyname('unit_code').AsString; //采购单位
 req_unitptr.Caption:= form_inv.ADOQuery1.fieldbyname('STOCK_UNIT_PTR').AsString;//存货单位
 combobox1.Text := dm.ADOQuery1.fieldbyname('rohs').AsString;      //环保等级
 Edit16.Text := dm.ADOQuery1.fieldbyname('IF_CAF').AsString;       //耐caf
  Self.prot_ptr:=dm.ADOQuery1.fieldbyname('prot_report_ptr').AsInteger; //环保认可文件
  edit15.Text := dm.ADOQuery1.fieldbyname('CONVERSION_FACTOR').AsString;
  edit14.Text := formatfloat('0.00',dm.ADOQuery1.FieldValues['TAX_2']);
  Edit12.Text := dm.ADOQuery1.fieldbyname('SUPPLIER_PART_NO').AsString;   //28.供应商型号
  Edit19.Text := dm.ADOQuery1.fieldbyname('orig_abbrname').AsString;     //28.品牌供应商
  if dm.ADOQuery1.fieldbyname('EDI_OUT_NEW_PO').AsInteger=0 then
   label_vmi.Caption:='N'
  else
   label_vmi.Caption:='Y';  //VMI采购     下行为VMI入库价格取向
  self.SECOND_WHSE_PTR:= dm.ADOQuery1.fieldbyname('EDI_FLAG_FOR_PO').AsInteger;
  if dm.ADOQuery1.FieldValues['TAX_2'] = 0 then
   begin
    edit7.Text := formatfloat('0.000000',dm.ADOQuery1.FieldValues['PRICE_1']);
    edit13.Text := formatfloat('0.0000',dm.ADOQuery1.FieldValues['PRICE_1']);
    self.price := dm.ADOQuery1.FieldValues['PRICE_1'];
   end
  else
   begin
    if dm.ADOQuery1.FieldValues['TAX_FLAG']='N' then
     begin
      edit7.Text := formatfloat('0.000000',dm.ADOQuery1.FieldValues['PRICE_1']);
      edit13.Text:= formatfloat('0.0000',
       dm.ADOQuery1.FieldValues['PRICE_1']*(1+dm.ADOQuery1.FieldValues['TAX_2']*0.01));
      self.price := strtocurr(edit13.text);
     end
    else
     begin
      edit13.Text := formatfloat('0.0000',dm.ADOQuery1.FieldValues['PRICE_1']);
      edit7.Text := formatfloat('0.000000',
       dm.ADOQuery1.FieldValues['PRICE_1']/(1+dm.ADOQuery1.FieldValues['TAX_2']*0.01));
      self.price := strtocurr(edit13.text);
     end;
   end;
end;

procedure TForm2.save_inv();
begin
  with dm.ADOQuery1 do
   begin
    active := false;
    sql.Clear;
    sql.Add('select data0028.supplier_ptr,data0023.code,data0023.supplier_name,data0028.prot_report_ptr,');
    sql.Add('data0028.avl_flag,data0028.purchase_unit_ptr,unit_code,unit_name,');
    sql.Add('data0028.currency_ptr,curr_code,curr_name,data0028.CONVERSION_FACTOR,');
    sql.Add('data0028.tax_2,data0028.tax_flag,data0028.price_1,data0028.rohs,data0028.orig_abbrname,');
    sql.Add('data0023.EDI_OUT_NEW_PO,data0023.EDI_FLAG_FOR_PO,data0028.SUPPLIER_PART_NO,DATA0028.IF_CAF');
    sql.Add('from data0028,data0023,data0002,data0001');
    sql.Add('where data0028.supplier_ptr=data0023.rkey and');
    sql.Add('data0028.purchase_unit_ptr=data0002.rkey and');
    sql.Add('data0028.currency_ptr=data0001.rkey and');
    sql.Add('data0028.inventory_ptr='+form_inv.ADOQuery1.fieldbyname('RKEY').AsString);
    sql.Add('and data0023.status=0');
    sql.Add('and data0028.avl_flag=''Y''');
    active := true;    //查找材料是否有供应商价格表
    if isempty then    //如果没有
     begin
      messagedlg('材料:'+trim(form_inv.ADOQuery1.FieldValues['INV_PART_NUMBER'])+
        '未定义供应商价格',mtinformation,[mbcancel],0);
      edit1.SetFocus;
     end
    else               //如果有
     begin
      if dm.ADOQuery1.RecordCount=1 then //如果有但只有一个供应商价格表
        find_refsupp
      else  //如果有多个供应商,查找首选供应商
       begin
         if Locate('supplier_ptr',form_inv.ADOQuery1.FieldValues['PREF_SUPPLIER_PTR'],[]) then
          find_refsupp
         else         //有多个供应商没有找到首选供应商
          begin
           edit1.Text := form_inv.ADOQuery1['INV_PART_NUMBER'];
           edit1.Font.Color := clwindowtext;
           label2.Caption := form_inv.ADOQuery1['INV_PART_DESCRIPTION'];
           Edit17.Text := form_inv.ADOQuery1.fieldbyname('REPORT_VALUE2').AsString;
           Edit18.Text := form_inv.ADOQuery1.fieldbyname('CONSIGN_ONHAND_QTY').AsString;
           rkey17.Caption := form_inv.ADOQuery1.fieldbyname('RKEY').AsString;
           req_unitptr.Caption:= form_inv.ADOQuery1.fieldbyname('STOCK_UNIT_PTR').AsString;
           CheckBox3.Checked:= form_inv.ADOQuery1.fieldbyname('INSPECT').AsString='Y'; //是否需要检查
           label26.Caption:=form_inv.ADOQuery1.fieldbyname('CRITICAL_MATL').AsString; //重要标识
           CheckBox1.Checked:=Trim(form_inv.ADOQuery1.fieldbyname('CATALOG_NUM').AsString)='Y'; //环保认可
          end;
       end;

    end;
  end;
end;

procedure TForm2.active_inv_exit(type_:Byte);    //参数0代表直接选择材料，参数1代表手工输入材料编码
begin
 if bitbtn2.Enabled=true then    //如果是左上角全新新增
  with form_inv.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('SELECT Data0017.RKEY,Data0017.stop_purch,Data0017.avl_flag,data0017.CATALOG_NUM,data0017.QUAN_ON_HAND,');
    sql.Add('Data0017.INV_PART_NUMBER,Data0017.INV_PART_DESCRIPTION,');
    sql.Add('manufacturer_name,PREF_SUPPLIER_PTR,STOCK_UNIT_PTR,data0017.INSPECT,data0017.REPORT_VALUE2, data0017.CONSIGN_ONHAND_QTY,');
    sql.Add('case Data0017.CRITICAL_MATL_FLAG when 0 then ''否'' when 1 then ''是'' end as CRITICAL_MATL');
    sql.Add('FROM Data0017 inner join data0496');
    sql.Add('on Data0017.GROUP_PTR=data0496.rkey');
    sql.Add('WHERE Data0017.stop_purch = ''N''');  //没有停止采购
    if type_=1 then
     SQL.Add('and data0017.INV_PART_NUMBER='+quotedstr(Trim(Edit1.Text)));
    sql.Add('ORDER BY INV_PART_NUMBER');
    Prepared;
    active:=true;
   end
 else                      //如果是在已确定供应商的情况下新增
  with form_inv.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('SELECT data0017.RKEY,stop_purch,data0017.avl_flag,data0017.CATALOG_NUM,data0017.REPORT_VALUE2, data0017.CONSIGN_ONHAND_QTY,');
    sql.Add('INV_PART_NUMBER,INV_PART_DESCRIPTION,data0028.rohs,data0028.prot_report_ptr,');
    sql.Add('manufacturer_name,PREF_SUPPLIER_PTR,data0028.currency_ptr,data0017.QUAN_ON_HAND,');
    sql.Add('data0028.purchase_unit_ptr,data0028.CONVERSION_FACTOR,data0028.orig_abbrname,');
    sql.Add('data0028.tax_2,data0028.tax_flag,data0028.price_1,DATA0028.IF_CAF,');
    sql.Add('data0017.STOCK_UNIT_PTR,data0017.INSPECT,data0028.SUPPLIER_PART_NO,');
    sql.Add('case Data0017.CRITICAL_MATL_FLAG when 0 then ''否'' when 1 then ''是'' end as CRITICAL_MATL');
    sql.Add('FROM Data0017,data0028,data0496');
    sql.Add('WHERE data0028.inventory_ptr=data0017.rkey and');
    sql.Add('data0017.group_ptr=data0496.rkey and');
    sql.Add('Data0017.stop_purch = ''N'' and');
    sql.Add('data0028.supplier_ptr='+rkey23.Caption);
    sql.Add('and data0028.avl_flag=''Y''');
    if type_=1 then
     SQL.Add('and data0017.INV_PART_NUMBER='+quotedstr(Trim(Edit1.Text)));
    sql.Add('ORDER BY INV_PART_NUMBER');
    Prepared;
    active:=true;
   end;
end;

procedure TForm2.inv_supp();
begin
  label26.Caption:=form_inv.ADOQuery1.fieldbyname('CRITICAL_MATL').AsString; //重要标识
  CheckBox1.Checked:=Trim(form_inv.ADOQuery1.fieldbyname('CATALOG_NUM').AsString)='Y'; //环保认可
  rkey01.Caption := form_inv.adoquery1.fieldbyname('currency_ptr').AsString;
  rkey02.Caption := form_inv.adoquery1.fieldbyname('purchase_unit_ptr').AsString;
  edit15.Text := form_inv.ADOQuery1.fieldbyname('CONVERSION_FACTOR').AsString;
  edit14.Text := formatfloat('0.00',form_inv.ADOQuery1.FieldValues['TAX_2']);
  Edit12.Text := form_inv.ADOQuery1.fieldbyname('SUPPLIER_PART_NO').AsString; //供应商号码
  combobox1.Text := form_inv.ADOQuery1.fieldbyname('rohs').AsString;
  Edit16.Text := form_inv.ADOQuery1.fieldbyname('IF_CAF').AsString;
  Self.prot_ptr:=form_inv.ADOQuery1.fieldbyname('prot_report_ptr').AsInteger; //环保认可文件
  req_unitptr.Caption:= form_inv.ADOQuery1.fieldbyname('STOCK_UNIT_PTR').AsString;
  Edit19.Text :=  form_inv.ADOQuery1.fieldbyname('orig_abbrname').AsString;   //品牌供应商

  if form_inv.ADOQuery1.FieldValues['TAX_2'] = 0 then
   begin
    edit7.Text := formatfloat('0.000000',form_inv.ADOQuery1.FieldValues['PRICE_1']);
    edit13.Text := formatfloat('0.0000',form_inv.ADOQuery1.FieldValues['PRICE_1']);
    self.price := strtocurr(edit13.text);
   end
  else
   begin
    if form_inv.ADOQuery1.FieldValues['TAX_FLAG']='N' then
     begin
      edit7.Text := formatfloat('0.000000',form_inv.ADOQuery1.FieldValues['PRICE_1']);
      edit13.Text:= formatfloat('0.0000',
       form_inv.ADOQuery1.FieldValues['PRICE_1']*(1+form_inv.ADOQuery1.FieldValues['TAX_2']*0.01));
      self.price := strtocurr(edit13.text);
     end
    else
     begin
      edit7.Text := formatfloat('0.000000',
       form_inv.ADOQuery1.FieldValues['PRICE_1']/(1+form_inv.ADOQuery1.FieldValues['TAX_2']*0.01));

      edit13.Text := formatfloat('0.0000',form_inv.ADOQuery1.FieldValues['PRICE_1']);
      self.price := strtocurr(edit13.text);
     end;
   end;
end;

procedure TForm2.Edit1Click(Sender: TObject);
begin
 change_color(edit1);
end;

procedure TForm2.change_color(v_comp: TEdit);
begin
 IF v_comp.Font.Color=clwindowtext then
  begin
   v_comp.Font.Color := clblue;
   v_comp.SelectAll;
  end;
end;

procedure TForm2.Edit3Click(Sender: TObject);
begin
 change_color(edit3);
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
 try
  form_inv:=tform_inv.Create(application);
  form2.active_inv_exit(0);
//========================================================================
  form_inv.Edit1.Text := trim(edit1.Text);
  if form_inv.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
    edit1.SetFocus;
   end
  else
  if form_inv.ShowModal=mrok then
   if bitbtn2.Enabled=true then    //如果是全新新增
    begin

     self.save_inv();
     if (activecontrol.Name='BitBtn1')  then
      bitbtn2.SetFocus;
    end
   else                      //如果在确定供应商的前题下新增
    begin

      edit1.Text := form_inv.ADOQuery1.FieldValues['INV_PART_NUMBER'];
      edit1.Font.Color := clwindowtext;
      label2.Caption := form_inv.ADOQuery1.FieldValues['INV_PART_DESCRIPTION'];
      rkey17.Caption := form_inv.ADOQuery1.fieldbyname('RKEY').AsString;
 //     po_avlflag.Caption:=form_inv.ADOQuery1.fieldbyname('INSPECT').AsString;   //是否IQC检验
      CheckBox3.Checked:= form_inv.ADOQuery1.fieldbyname('INSPECT').AsString='Y'; //是否需要检查
      Edit17.Text := form_inv.ADOQuery1.fieldbyname('REPORT_VALUE2').AsString;
      Edit18.Text := form_inv.ADOQuery1.fieldbyname('CONSIGN_ONHAND_QTY').AsString;
      self.inv_supp;
      maskedit1.SetFocus;
    end
  else
   edit1.SetFocus;
 finally
  form_inv.free;
 end;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
if edit8.Visible=true then  //是新增杂项采购
 begin
  try
   form_supp:=tform_supp.Create(application);
   if form_supp.ShowModal=mrok then
    begin
     edit2.Text := form_supp.ADOQuery1.FieldValues['code'];
     label5.Caption := form_supp.ADOQuery1.FieldValues['supplier_name'];
     rkey23.Caption := form_supp.ADOQuery1.fieldbyname('rkey').AsString;
     rkey01.Caption := form_supp.ADOQuery1.fieldbyname('currency_ptr').AsString;
     with dm.ADOQuery1 do
      begin
       active:=false;
       sql.Clear;             //复制装运地址中的值
       sql.Add('SELECT top 1 data0189.state_tax');
       sql.Add('FROM Data0024,data0189');
       sql.Add('WHERE data0024.city_tax_ptr=data0189.rkey and');
       sql.Add('Data0024.SUPPLIER_PTR ='+rkey23.Caption);
       sql.Add('order by data0024.rkey');
       active:=true;
       edit14.Text := fieldbyname('state_tax').AsString;  //..7增值税率
      end;

    end;
  finally
   form_supp.free;
  end;
 end
else //新增标准
 if edit1.Font.Color = clblue then
  begin
   messagedlg('请先输入原材料!',mtinformation,[mbok],0);
   edit1.SetFocus;
  end
 else
 try
  form3:=tform3.Create(application);
  with form3.ADOQuery1 do
   begin
    close;
    Parameters[0].Value := rkey17.Caption;
    open;
   end;
  if form3.ShowModal=mrok then
   begin
    edit2.Text := form3.ADOQuery1code.Value;
    label5.Caption := form3.ADOQuery1supplier_name.value;
    rkey23.Caption := form3.ADOQuery1rkey23.AsString;
    rkey01.Caption := form3.ADOQuery1.fieldbyname('currency_ptr').AsString;
    rkey02.Caption := form3.ADOQuery1.fieldbyname('purchase_unit_ptr').AsString;
    label13.Caption := form3.ADOQuery1.fieldbyname('unit_code').AsString;
    Edit12.Text := Form3.ADOQuery1supplier_part_no.Value;    //供应商型号
    self.prot_ptr:=Form3.ADOQuery1prot_report_ptr.Value;    //环保认可文件
    Edit19.Text := Form3.ADOQuery1orig_abbrname.Value;      //品牌供应商
    if form3.ADOQuery1EDI_OUT_NEW_PO.Value=0 then
     label_vmi.Caption:='N'
    else
     label_vmi.Caption:='Y';  //VMI采购
    SECOND_WHSE_PTR:=Form3.ADOQuery1EDI_FLAG_FOR_PO.Value;//VMI入库价格取值方法 
    combobox1.Text := form3.ADOQuery1rohs.Value;
    Edit16.Text:=Form3.ADOQuery1IF_CAF.Value;
    edit15.Text := form3.ADOQuery1CONVERSION_FACTOR.AsString;
    edit14.Text := formatfloat('0.00',form3.ADOQuery1tax_2.Value);
    if form3.ADOQuery1tax_2.Value = 0 then
     begin
      edit7.Text := formatfloat('0.000000',form3.ADOQuery1PRICE_1.Value);
      edit13.Text := formatfloat('0.0000',form3.ADOQuery1PRICE_1.Value);
      self.price := strtocurr(edit13.Text);
     end
    else
     begin
     if form3.ADOQuery1tax_flag.Value = 'N' then
      begin
       edit7.Text := formatfloat('0.000000',form3.ADOQuery1PRICE_1.Value);
       edit13.Text:= formatfloat('0.0000',
       form3.ADOQuery1PRICE_1.Value*(1+form3.ADOQuery1tax_2.Value*0.01));
       self.price := strtocurr(edit13.Text);
      end
     else
     begin
      edit7.Text := formatfloat('0.000000',
       form3.ADOQuery1PRICE_1.Value/(1+form3.ADOQuery1tax_2.Value*0.01));

      edit13.Text := formatfloat('0.0000',form3.ADOQuery1PRICE_1.Value);
      self.price := strtocurr(edit13.Text);
     end;
    end;
    edit3.SetFocus;
   end;           //采购单位，货币单位
 finally
  form3.free;
 end;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
 maskedit1.Text := datetimetostr(now());
 if edit8.Visible=true then
  begin
   Bitbtn2.Enabled := false;
   bitbtn3.Enabled := false;
   edit3.Enabled := false;
  end;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
 try
  form_wh:=tform_wh.Create(application);
   with form_wh.ADOQuery1 do
    begin
     active:=false;
     sql.Clear;
     sql.Add('select rkey,warehouse_code,warehouse_name');
     sql.Add('from data0015 where active_flag=''Y''');
     sql.Add('order by warehouse_code');
     active:=true;
    end;
  form_wh.Edit1.Text := trim(edit3.Text);
  if form_wh.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到相关记录!',mtinformation,[mbok],0);
    edit3.SetFocus;
   end
  else
   if form_wh.ShowModal=mrok then
    begin
     edit3.Text := form_wh.ADOQuery1.fieldvalues['warehouse_code'];
     edit3.Font.Color := clwindowtext;
     label6.Caption := form_wh.ADOQuery1.fieldvalues['warehouse_name'];
     rkey15.Caption := form_wh.ADOQuery1.fieldbyname('rkey').AsString;
     maskedit1.SetFocus;
    end
   else
    edit3.SetFocus;
 finally
  form_wh.free;
 end;
end;

procedure TForm2.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8]) then  //判断是否输入数字
    abort;
end;

procedure TForm2.Edit4Exit(Sender: TObject);
begin
 if (trim(edit4.Text)='') or (trim(edit4.Text)='0') then
  edit4.Text := '1';
end;

procedure TForm2.Edit4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (trim(edit4.Text)<>'') then
  if strtoint(edit4.Text)>1 then
   begin
    edit5.ReadOnly := false;
    edit5.Color := clwindow;
   end
  else
   begin
    edit5.ReadOnly := true;
    edit5.Color := cl3dlight;
    edit5.Text := '0';
   end
 else
  begin
   edit5.ReadOnly := true;
   edit5.Color := cl3dlight;
   edit5.Text := '0';
  end;
end;

procedure TForm2.Edit5Exit(Sender: TObject);
begin
 if (trim(edit5.Text)='') then
  edit5.Text := '0';
end;

procedure TForm2.Edit6Exit(Sender: TObject);
begin
 if trim(edit6.Text)='' then edit6.Text:='0';
 edit6.Text := formatfloat('0.0000',strtofloat(edit6.Text));
 edit6.Font.Color := clwindowtext;
end;

procedure TForm2.Edit3Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'button2')
   and (trim(edit3.Text)<>'') then
 try
  form_wh:=tform_wh.Create(application);
   with form_wh.ADOQuery1 do
    begin
     active:=false;
     sql.Clear;
     sql.Add('select rkey,warehouse_code,warehouse_name');
     sql.Add('from data0015 where active_flag=''Y''');
     sql.Add('order by warehouse_code');
     active:=true;
    end;
  form_wh.Edit1.Text := trim(edit3.Text);
 if comparetext(trim(edit3.text),trim(form_wh.ADOQuery1.Fieldbyname('warehouse_code').AsString))=0 then
  begin
   edit3.Text := form_wh.ADOQuery1.FieldValues['warehouse_code'];
   edit3.Font.Color := clwindowtext;
   label6.Caption := form_wh.ADOQuery1.fieldvalues['warehouse_name'];
   rkey15.Caption := form_wh.ADOQuery1.fieldbyname('rkey').AsString;
  end
 else
  begin
   messagedlg('工厂代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label6.Caption := '';
   edit3.SetFocus;
  end;
 finally
  form_wh.Free;
 end;
end;

procedure TForm2.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'Button2')
   and (trim(edit1.Text)<>'') then
 try
  form_inv:=tform_inv.Create(application);
  form2.active_inv_exit(1);
  //form_inv.Edit1.Text := trim(edit1.Text);    //该写法存在BUG缺陷13.1.29日改写
 // if comparetext(trim(edit1.text),trim(form_inv.ADOQuery1.Fieldbyname('inv_part_number').AsString))=0 then
  if not form_inv.ADOQuery1.IsEmpty then
    begin        //材料代码输入正确
     if StrToIntDef(rkey17.Caption,0) <> form_inv.ADOQuery1.fieldbyname('RKEY').AsInteger then
     if bitbtn2.Enabled=true then //如果是左上角全新新增
      form2.save_inv()
     else     //在确认供应商下新增
      begin
       edit1.Font.Color := clwindowtext;
       label2.Caption := form_inv.ADOQuery1['INV_PART_DESCRIPTION'];
       rkey17.Caption := form_inv.ADOQuery1.fieldbyname('RKEY').AsString;
       CheckBox3.Checked:= form_inv.ADOQuery1.fieldbyname('INSPECT').AsString='Y'; //是否需要检查
       self.inv_supp;
      end
     else
      edit1.Font.Color := clwindowtext;
    end
  else
   begin
    messagedlg('原材料号码不正确,请重新输入或选择',mtinformation,[mbok],0);
    label2.Caption := '';
    edit1.SetFocus;
   end;
 finally
  form_inv.Free;
 end;
end;

procedure TForm2.Edit8KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if trim(edit8.Text)= '' then
  begin
   Bitbtn2.Enabled := false;
   bitbtn3.Enabled := false;
   edit3.Enabled := false;
  end
 else
  if self.add_new_type<>1 then  //全新的情况下新增=1代表在有供应商的情况下新增
  begin
   Bitbtn2.Enabled := true;
   bitbtn3.Enabled := true;
   edit3.Enabled := true;
  end;
end;

function TForm2.find_supp_protection(prot_report_ptr: Integer): Boolean;
begin
with dm.ADOQuery2 do
 begin
   Close;
   sql.Text:='select rkey,Model from data0805 where (rkey='+inttostr(prot_report_ptr)+')'+
             ' and ((Status=3) and (EffeDate>=convert(datetime,(convert(varchar,getdate(),101)),101))'+
             ' or (TemporBy=1) and (TemporTo>=convert(datetime,(convert(varchar,getdate(),101)),101)))';
   open;
   if not IsEmpty then
    Result:=True
   else
    Result:=false;
 end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
if edit1.Visible=false then  //杂项采购
 begin
  if trim(edit8.Text)='' then
   begin
    messagedlg('物品名称不能为空!',mtinformation,[mbcancel],0);
    edit8.SetFocus;
    exit;
   end;
  if trim(edit10.Text)='' then
   begin
    messagedlg('物品规格不能为空!',mtinformation,[mbcancel],0);
    edit10.SetFocus;
    exit;
   end;
  if trim(edit9.Text)='' then
   begin
    messagedlg('采购类别不能为空!',mtinformation,[mbcancel],0);
    edit9.SetFocus;
    exit;
   end;
  if trim(edit11.Text) = '' then
   begin
    messagedlg('采购单位不能为空!',mtinformation,[mbok],0);
    edit11.SetFocus;
    exit;
   end;
 end
else                   //标准采购
 begin
  if trim(rkey17.Caption) = '' then
   begin
    messagedlg('请输入或选择正确的原材料!',mtinformation,[mbcancel],0);
    edit1.SetFocus;
    exit;
   end;
  with dm.ADOQuery2 do
  begin
   close;
   sql.Clear;
   sql.Add('SELECT Data0019.inv_group_desc');
   sql.Add('FROM Data0019 INNER JOIN');
   sql.Add('Data0496 ON Data0019.rkey = Data0496.group_ptr INNER JOIN');
   sql.Add('Data0017 ON Data0496.RKEY = Data0017.GROUP_PTR');
   sql.Add('where data0017.rkey='+trim(rkey17.Caption));
   open;
  end;
  label17.Caption:=trim(dm.ADOQuery2.fieldbyname('inv_group_desc').AsString);
 end;

 if rkey23.Caption = '' then
  begin
   messagedlg('请选择正确的供应商代码!',mtinformation,[mbcancel],0);
   bitbtn2.SetFocus;
   exit;
  end;

 if trim(edit3.Text) = '' then
  begin
   messagedlg('请输入或选择正确的仓库代码!',mtinformation,[mbcancel],0);
   edit3.SetFocus;
   exit;
  end
 else
  if (dm.AQ0015.Active=true) and (strtoint(rkey15.Caption)<>dm.AQ0015RKEY.Value) then
   begin
    messagedlg('同一次采购不能为不同工厂采购!',mtinformation,[mbcancel],0);
    edit3.SetFocus;
    exit;
   end;

 if strtodatetime(maskedit1.Text) < date() then
  begin
   messagedlg('要求供应商出货日期不能少于当前日期',mterror,[mbcancel],0);
   maskedit1.SetFocus;
   exit;
  end;

 if strtofloat(edit6.Text)=0 then
  begin
   messagedlg('采购数量不能为0!',mtinformation,[mbcancel],0);
   edit6.SetFocus;
   exit;
  end;

 if Self.CheckBox1.Checked then
 if (self.prot_ptr=0) or (not self.find_supp_protection(prot_ptr)) then
 begin
   messagedlg('供应商没有环保认可,或者认可资料过期!',mtinformation,[mbcancel],0);
   Edit1.SetFocus;
   exit;
 end;

 ModalResult:=mrok;
end;

procedure TForm2.Edit6Click(Sender: TObject);
begin
if edit6.Font.Color=clwindowtext then
 begin
  edit6.Font.Color:=clblue;
  edit6.SelectAll;
 end;
end;

procedure TForm2.Edit7Click(Sender: TObject);
begin
if edit7.Font.Color=clwindowtext then
 begin
  edit7.Font.Color:=clblue;
  edit7.SelectAll;
 end;
end;

procedure TForm2.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then  //判断是否输入数字
  abort
 else
  if (key = chr(46)) then
   if pos('.',(sender as Tedit).Text)>0 then //小数点不能重复
    abort;
end;

procedure TForm2.Edit7Exit(Sender: TObject);
begin
 if trim(edit7.Text)='' then edit7.Text:='0';
  edit7.Text := formatfloat('0.000000',strtofloat(edit7.Text));
  edit7.Font.Color := clwindowtext;
 edit13.Text:= formatfloat('0.0000',
  strtofloat(edit7.Text)*(1+strtofloat(edit14.Text)*0.01));
  
 if (strtocurr(edit13.Text)-price>0.01) and (not edit8.Visible) then
  begin
   showmessage('价格只能改少,不能改大!!!');
   edit7.SetFocus;
  end;

end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 with dm.ADOQuery2 do
  begin
   close;
   sql.Clear;
   sql.Add('select * from data0075');
   sql.Add('order by DESCRIPTION');
   open;
   while not eof do
    begin
     edit9.Items.Add(fieldvalues['DESCRIPTION']);
     Next;
    end;
  end;
 dm.ADOQuery2.Close;
end;

procedure TForm2.Edit11Click(Sender: TObject);
begin
if edit11.Font.Color = clwindowtext then
 begin
  edit11.Font.Color :=clblue;
  edit11.SelectAll;
 end;
end;

procedure TForm2.Edit11Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn4') and (activecontrol.Name<>'Button2') then
 try
  form_unit:=tform_unit.Create(application);
  form_unit.Edit1.Text :=trim(edit11.Text);
 if comparetext(trim(edit11.text),trim(form_unit.ADOQuery1.Fieldbyname('unit_code').AsString))=0 then
   begin
    edit11.Text := form_unit.ADOQuery1.FieldValues['unit_code'];
    edit11.Font.Color := clwindowtext;
    rkey02.Caption := form_unit.ADOQuery1.fieldbyname('rkey').AsString;
    label19.Caption := form_unit.ADOQuery1.FieldValues['unit_name'];
   end
  else
   begin
    messagedlg('采购单位不能为空,请重新输入或选择',mtinformation,[mbok],0);
    label19.Caption := '';
    edit11.SetFocus;
   end;
 finally
  form_unit.free;
 end;
end;

procedure TForm2.BitBtn4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  form_unit:=tform_unit.Create(application);
  form_unit.Edit1.Text :=trim(edit11.Text);
  if form_unit.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找符合条件的记录!',mtwarning,[mbok],0);
    edit11.SetFocus;
   end
  else
  if form_unit.ShowModal=mrok then
   begin
    edit11.Text := form_unit.ADOQuery1.FieldValues['unit_code'];
    edit11.Font.Color := clwindowtext;
    rkey02.Caption :=form_unit.ADOQuery1.fieldbyname('rkey').AsString;
    label19.Caption := form_unit.ADOQuery1.FieldValues['unit_name'];
    if bitbtn2.Enabled=true then bitbtn2.SetFocus
     else edit8.SetFocus;
   end
  else
   edit11.SetFocus;
end;

procedure TForm2.BitBtn4Exit(Sender: TObject);
begin
  form_unit.free;
end;

procedure TForm2.MaskEdit1Exit(Sender: TObject);
begin
 try
  strtodatetime(maskedit1.Text);
 except
  messagedlg('日期格式输入不正确,请重新输入!',mtwarning,[mbok],0);
  maskedit1.SetFocus;
 end;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
if rkey17.Caption<>'' then
 begin
  form20:=tform20.Create(application);
  form20.ADOQuery1.Close;
  form20.ADOQuery1.Parameters[0].Value:=strtoint(rkey17.Caption);
  Form20.ADOQuery1.Parameters[1].Value:=strtoint(rkey17.Caption);
  form20.ADOQuery1.Open;
  if not form20.ADOQuery1.IsEmpty then
   begin
    form20.ShowModal;
    form20.Free;
   end
  else
   showmessage('没有找到库存');
 end
else
 showmessage('请先选择材料!');
end;

procedure TForm2.Edit14Exit(Sender: TObject);
begin
 if trim(edit14.Text)='' then edit14.Text:='0';
  edit14.Text := formatfloat('0.00',strtofloat(edit14.Text));

 edit7.Text := formatfloat('0.000000',
  strtofloat(edit13.Text)/(1+strtofloat(edit14.Text)*0.01));
end;

procedure TForm2.Edit13Exit(Sender: TObject);
begin
 if trim(edit13.Text)='' then edit13.Text:='0';
  edit13.Text := formatfloat('0.0000',strtofloat(edit13.Text));

 edit7.Text := formatfloat('0.000000',
  strtofloat(edit13.Text)/(1+strtofloat(edit14.Text)*0.01));
  
 if (strtocurr(edit13.Text)-price>0.01) and (not edit8.Visible) then
  begin
   showmessage('价格只能改少,不能改大!!!');
   edit13.SetFocus;
  end;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
   try
    InputVar.Fields := 'CODE/供应商代码/50,SUPPLIER_NAME/供应商名称/200,abbr_name/供应商简称/200';
    InputVar.Sqlstr := 'SELECT CODE,SUPPLIER_NAME,abbr_name FROM data0023';
    InputVar.AdoConn :=DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
     Edit19.Text := frmPick_Item_Single.adsPick.FieldValues['abbr_name'];
    end;
   finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
   end;
end;

procedure TForm2.Edit19DblClick(Sender: TObject);
begin
Edit19.Text:='';
end;

end.
