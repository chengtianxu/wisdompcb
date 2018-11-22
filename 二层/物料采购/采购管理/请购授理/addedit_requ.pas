unit addedit_requ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, ADODB, ExtCtrls;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn3: TBitBtn;
    Label8: TLabel;
    Edit3: TEdit;
    BitBtn4: TBitBtn;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    MaskEdit1: TMaskEdit;
    Button1: TButton;
    Button2: TButton;
    DBEdit3: TDBEdit;
    DBText1: TDBText;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    DBText2: TDBText;
    DBRadioGroup1: TDBRadioGroup;
    MaskEdit2: TMaskEdit;
    Label12: TLabel;
    Label13: TLabel;
    DBEdit5: TDBEdit;
    Button3: TButton;
    BitBtn1: TBitBtn;
    Label14: TLabel;
    DBEdit6: TDBEdit;
    avl_flag: TLabel;
    Button4: TButton;
    Label15: TLabel;
    Label16: TLabel;
    DBText3: TDBText;
    DBEdit7: TDBEdit;
    Label17: TLabel;
    DBEdit8: TDBEdit;
    Button5: TButton;
    Label18: TLabel;
    DBText4: TDBText;
    Label19: TLabel;
    DBEdit9: TDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    CheckBox1: TCheckBox;
    dbchkIF_urgency: TDBCheckBox;
    lbl1: TLabel;
    dbedtQUANTITY: TDBEdit;
    DBEdit10: TDBEdit;
    Label22: TLabel;
    BitBtn2: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure save_inv(rkey17,SUPPLIER_PTR:integer;PART_DESCRIPTION:string);
    procedure save_nosupp(rkey17,SUPPLIER_PTR:integer);
    procedure find_supplier();
    procedure update_69();
    procedure Edit3Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit7Exit(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit10DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private
    { Private declarations }
   v_close:byte;
   price_28:double;
   prot_ptr:Integer;     //环保认可主表
   function find_supp_protection(prot_report_ptr:Integer):Boolean;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
 uses damo, edit_req,inv_search, supplier_search, stdhistory_price,
  kucun_serach, zaitu_invt,common
  ,Pick_Item_Single
  ,ConstVar;
{$R *.dfm}

procedure TForm3.BitBtn3Click(Sender: TObject);
begin
  try
    form_inv := tform_inv.Create(application);
    form_inv.Edit1.Text := trim(edit2.Text);
    if form_inv.ADOQuery1.IsEmpty then
    begin
      messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
      edit2.SetFocus;
    end
    else
    if form_inv.ShowModal = mrok then
    begin
      edit2.Text:=form_inv.ADOQuery1INV_PART_NUMBER.Value;
      edit2.Font.Color:=clwindowtext;
      CheckBox1.Checked:=Trim(form_inv.ADOQuery1CATALOG_NUM.Value)='Y';
      dm.ADO69req_unit_ptr.Value:=form_inv.ADOQuery1STOCK_UNIT_PTR.Value; //存货单位
      dm.ADO69avl_flag.Value:=form_inv.ADOQuery1INSPECT.Value;  //是否检查
      self.save_inv(form_inv.ADOQuery1RKEY.Value,
                    form_inv.ADOQuery1PREF_SUPPLIER_PTR.Value,
                    trim(form_inv.ADOQuery1INV_PART_DESCRIPTION.Value));
      if activecontrol.Name = 'BitBtn3' then
        edit3.SetFocus;
    end
    else
      edit2.SetFocus;
  finally
    form_inv.free;
  end;
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
begin
if trim(edit2.Text) = '' then
 begin
  messagedlg('请先输入原材料!',mtinformation,[mbok],0);
  edit2.SetFocus;
 end
else
try
 form_supp := tform_supp.Create(application);
 with form_supp.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('SELECT Data0023.RKEY,data0028.purchase_unit_ptr,data0028.if_caf,');
   sql.Add('Data0023.CODE,data0028.CONVERSION_FACTOR,data0028.AVL_FLAG,data0028.prot_report_ptr,');
   sql.Add('Data0023.SUPPLIER_NAME,data0028.currency_ptr,data0028.PRICE_1,');
   sql.Add('data0028.TAX_2,data0028.TAX_FLAG,data0028.rohs,data0028.SUPPLIER_PART_NO,');
   sql.Add('data0028.remark,data0028.LEAD_TIME,data0028.orig_abbrname');
   sql.Add('FROM Data0023,data0028');
   sql.Add('where data0028.supplier_ptr = data0023.rkey and');
   sql.Add('data0028.inventory_ptr = '+dm.ADO69INVT_PTR.AsString);
   sql.Add('and data0023.status=0');      //供应商有效
   sql.Add('and data0028.AVL_FLAG=''Y''');   //价格认可
   sql.Add('ORDER BY Data0023.CODE');
   open;
  end;

 form_supp.Edit1.Text := trim(edit3.Text);
 if form_supp.ADOQuery1.IsEmpty then
  begin
   messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
   edit3.SetFocus;
  end
 else
 if form_supp.ShowModal = mrok then
  begin
    if dm.ADO69SUPP_PTR.Value <> form_supp.ADOQuery1.FieldValues['rkey'] then
     self.update_69;
     maskedit1.SetFocus;
  end
 else
  edit3.SetFocus;
finally
 form_supp.free;
end;
end;

procedure TForm3.Edit3Click(Sender: TObject);
begin
 if edit3.Font.Color=clwindowtext then
  begin
   edit3.Font.Color := clblue;
   edit3.SelectAll;
  end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
 v_close:=1;
 dm.ado69.Cancel;
end;

procedure TForm3.Edit2Click(Sender: TObject);
begin
 if edit2.Font.Color=clwindowtext then
  begin
   edit2.Font.Color := clblue;
   edit2.SelectAll;
  end;
end;

procedure TForm3.Edit2Exit(Sender: TObject);
begin
  if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'Button2') and (trim(edit2.Text)<>'') then
  begin
    with dm.ADOQuery2 do
    begin
      close;
      sql.Clear;
      sql.Add('select rkey,PREF_SUPPLIER_PTR,INV_PART_DESCRIPTION,STOCK_UNIT_PTR,INSPECT,CATALOG_NUM');
      sql.Add('from data0017');
      sql.Add('where INV_PART_NUMBER='''+trim(edit2.Text)+''' and STOP_PURCH=''N''');
      open;
    end;
    if not dm.ADOQuery2.IsEmpty then
    begin
      if dm.ADOQuery2.FieldValues['rkey']=dm.ADO69INVT_PTR.Value then
       begin
        if dm.ADO69SUPP_PTR.AsVariant=null then  //材料确定查找供应商
        save_nosupp(dm.ADO69INVT_PTR.Value,dm.ADOQuery2.Fieldbyname('PREF_SUPPLIER_PTR').AsInteger);
       end
      else
       begin
        CheckBox1.Checked:=Trim(dm.ADOQuery2.FieldByName('CATALOG_NUM').AsString)='Y';
        dm.ADO69req_unit_ptr.Value:=dm.ADOQuery2.FieldValues['STOCK_UNIT_PTR'];  //存货单位02
        dm.ADO69avl_flag.Value:=dm.ADOQuery2.Fieldbyname('INSPECT').AsString;  //是否检查
        self.save_inv(dm.ADOQuery2.FieldValues['rkey'],
                     dm.ADOQuery2.Fieldbyname('PREF_SUPPLIER_PTR').AsInteger,
                     trim(dm.ADOQuery2.FieldValues['INV_PART_DESCRIPTION']));
       end;
    end
    else
    begin
      messagedlg('原材料号码不正确,请重新输入或选择',mtinformation,[mbok],0);
      label8.Caption := '';
      edit2.SetFocus;
    end;
  end
  else
  if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'Button2') and (trim(edit2.Text) = '') then
   begin
    label8.Caption := '';
    CheckBox1.Checked:=False;
    dm.ADO69INVT_PTR.AsVariant:=null;
   end;
end;

procedure Tform3.save_inv(rkey17,SUPPLIER_PTR:integer;PART_DESCRIPTION:string);
begin

  with dm.ADOQuery1 do
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select data0028.rkey,data0028.supplier_ptr,data0028.PRICE_1,data0028.prot_report_ptr,');
    sql.Add('data0028.purchase_unit_ptr,data0028.CONVERSION_FACTOR,data0028.AVL_FLAG,');
    sql.Add('data0023.code,data0023.supplier_name,data0028.currency_ptr,DATA0028.IF_CAF,');
    sql.Add('data0028.TAX_2,data0028.TAX_FLAG,data0028.rohs,data0028.SUPPLIER_PART_NO,');
    sql.Add('data0028.LEAD_TIME,data0028.remark');
    sql.Add('from data0028 inner join data0023');
    sql.Add('on data0028.supplier_ptr=data0023.rkey');
    sql.Add('where inventory_ptr='+inttostr(rkey17));
    sql.Add('and data0023.status=0');
    sql.Add('and data0028.AVL_FLAG=''Y''');
    active := true;

    if isempty then //没有定义价格
     begin
      if messagedlg('材料:'+trim(edit2.Text)+'没有定义供应商价格是否继续?',
       mtconfirmation,[mbyes,mbno],0)=mrno then
       edit2.SetFocus
      else
       begin
        dm.ADO69INVT_PTR.Value := rkey17;
        label8.Caption := PART_DESCRIPTION;
       end;
     end
    else   //已定义价格可能有多条记录
     if dm.ADOQuery1.RecordCount=1 then //如果该材料只有一个供应商有价格表
       begin
        dm.ADO69INVT_PTR.Value := rkey17;
        label8.Caption := PART_DESCRIPTION;
        find_supplier();
       end
     else                     //如果有多个供应商价格，那幺寻找首选供应商
      begin
       if Locate('supplier_ptr',SUPPLIER_PTR,[]) then
         begin
          dm.ADO69INVT_PTR.Value := rkey17;
          label8.Caption := PART_DESCRIPTION;
          find_supplier();
         end
       else                      //如果有多个价格,但没有首选供应商
        begin
         dm.ADO69INVT_PTR.Value := rkey17;
         label8.Caption := PART_DESCRIPTION;
        end;
      end
   end;
end;

procedure TForm3.Edit3Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn4') and (activecontrol.Name<>'Button2')
   and (trim(edit3.Text)<>'') then
 try
  form_supp:=tform_supp.Create(application);
  with form_supp.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('SELECT Data0023.RKEY,data0028.purchase_unit_ptr,DATA0028.IF_CAF,');
   sql.Add('Data0023.CODE,data0028.CONVERSION_FACTOR,data0028.AVL_FLAG,');
   sql.Add('Data0023.SUPPLIER_NAME,data0028.currency_ptr,data0028.PRICE_1,data0028.prot_report_ptr,');
   sql.Add('data0028.TAX_2,data0028.TAX_FLAG,data0028.rohs,data0028.SUPPLIER_PART_NO,');
   sql.Add('data0028.remark,data0028.LEAD_TIME');
   sql.Add('FROM Data0023,data0028');
   sql.Add('where data0028.supplier_ptr = data0023.rkey ');
   sql.Add('and data0028.inventory_ptr ='+dm.ADO69INVT_PTR.AsString);
   sql.Add('and data0023.code='+QuotedStr(edit3.Text));
   sql.Add('and data0023.status=0');
   sql.Add('and data0028.AVL_FLAG=''Y''');
   sql.Add('ORDER BY Data0023.CODE');
   open;
  end;
 if not Form_supp.ADOQuery1.IsEmpty then
  begin
    if dm.ADO69SUPP_PTR.Value <> form_supp.ADOQuery1.FieldValues['rkey'] then
    self.update_69;
  end
 else
  begin
   messagedlg('供应商代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label9.Caption := '';
   label21.Caption :='';
   edit3.SetFocus;
  end;
 finally
  form_supp.Free;
 end
else
if (activecontrol.Name<>'BitBtn4') and (activecontrol.Name<>'Button2')
   and (trim(edit3.Text)='') then
 begin
  label9.Caption := '';
  label21.Caption :='';
  dm.ADO69SUPP_PTR.AsVariant := null;
  dm.ADO69UNIT_PTR.AsVariant := null;
  dm.ADO69PO_LINK_PTR.AsVariant := null; //货币
  dm.ADO69UNIT_PRICE.Value:=0;
  dm.ADO69tax_price.Value:=0;
  dm.ADO69tax.Value:=0;
  dm.ADO69rohs.Value:='';
  DM.ADO69IF_CAF.Value:='';
  dm.ADO69extra_req.Value:='';
  self.prot_ptr:=0;
 end;
end;

function TForm3.find_supp_protection(prot_report_ptr: Integer): Boolean;
begin
with dm.ADOQuery1 do
 begin
   Close;
   sql.Text:='select rkey,Model from data0805 where (rkey='+inttostr(prot_report_ptr)+')'+
             ' and (Status=3 and EffeDate>=convert(datetime,(convert(varchar,getdate(),101)),101)'+
             ' or (TemporBy=1 and TemporTo>=convert(datetime,(convert(varchar,getdate(),101)),101)))';
   open;
   if not IsEmpty then
    Result:=True
   else
    Result:=false;
 end;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
 if trim(edit2.Text) = '' then
  begin
   messagedlg('请输入正确的原材料!',mtinformation,[mbcancel],0);
   edit2.SetFocus;
   exit;
  end;
 if (dbedit1.Field.Value <= 0) then
  begin
   messagedlg('请输入正确的采购数量!',mtinformation,[mbcancel],0);
   dbedit1.SetFocus;
   exit;
  end;
 if (dbedit2.Field.Value < 0) then
  begin
   messagedlg('请输入正确的价格!',mtinformation,[mbcancel],0);
   dbedit2.SetFocus;
   exit;
  end;

 if trim(dbedit5.Text) = '' then
  begin
   messagedlg('请购原因不能为空!',mtinformation,[mbcancel],0);
   dbedit5.SetFocus;
   exit;
  end;
 IF dm.ADO69o_i_flag.AsVariant = null then
  begin
   messagedlg('请确定采购地点',mtinformation,[mbcancel],0);
   dbradiogroup1.SetFocus;
   exit;
  end;
 if Self.CheckBox1.Checked then
 if (self.prot_ptr=0) or (not self.find_supp_protection(prot_ptr)) then
 begin
   messagedlg('供应商没有环保认可,或者认可资料过期!',mtinformation,[mbcancel],0);
   Edit3.SetFocus;
   exit;
 end;
//=============================================================================

 dm.ADO69REQ_DATE.AsString := maskedit1.Text;
 dm.ADO69reply_date.AsString := maskedit2.Text;
 v_close := 1;
 ModalResult := mrok;
end;

procedure TForm3.DBEdit1Exit(Sender: TObject);
begin
 if trim(dbedit1.Text) = '' then dbedit1.Field.Value := 0;
end;

procedure TForm3.DBEdit2Exit(Sender: TObject);
begin
 if trim(dbedit2.Text) = '' then dbedit2.Field.Value := 0;
 if (trim(edit3.Text) = '') and (dm.ADO69UNIT_PRICE.Value > 0) then
  begin
   showmessage('供应商没有确定之前,不能确定价格');
   dbedit2.SetFocus;
  end
 else
  if self.avl_flag.Caption='Y' then  //如果价格含税
   begin
   if (trim(edit3.Text)<>'') and
      (dm.ADO69UNIT_PRICE.Value-price_28/(1+dm.ADO69tax.Value*0.01)>0.01) then
    begin
     showmessage('不含税价格不能大于交付排程的价格!');
     dbedit2.SetFocus;
    end
   else
    begin
     dm.ADO69tax_price.Value:=strtofloat(
      formatfloat('0.0000',dm.ADO69UNIT_PRICE.Value*(1+dm.ADO69tax.Value*0.01)));
    end;
   end
  else
   begin
    if (trim(edit3.Text)<>'') and (dm.ADO69UNIT_PRICE.Value-price_28>0.01) then
    begin
     showmessage('不含税价格不能大于交付排程的价格!');
     dbedit2.SetFocus;
    end
    else
    begin
     dm.ADO69tax_price.Value:=strtofloat(
       formatfloat('0.0000',dm.ADO69UNIT_PRICE.Value*(1+dm.ADO69tax.Value*0.01)));
    end;
   end;
end;

procedure TForm3.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if trim(edit2.Text)='' then
  begin
   messagedlg('请先输入请购材料!',mtinformation,[mbok],0);
   abort;
  end;
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if v_close<>1 then
 dm.ado69.Cancel;
end;

procedure TForm3.MaskEdit1Exit(Sender: TObject);
begin
 try
  strtodatetime(maskedit1.Text);
 except
  messagedlg('日期格式输入不正确,请重新输入!',mtwarning,[mbok],0);
  maskedit1.SetFocus;
 end;
end;

procedure TForm3.DBEdit2KeyPress(Sender: TObject; var Key: Char);
begin
 if (key=chr(46)) and (pos('.',(sender as tdbedit).Text)<>0) then abort;
end;

procedure TForm3.find_supplier();
begin
if dm.ADO69SUPP_PTR.Value <> dm.adoquery1.FieldValues['supplier_ptr'] then
 begin
  edit3.Text := dm.adoquery1.fieldvalues['code']; //供应商代码
  edit3.Font.Color := clwindowtext;
  label9.Caption := dm.adoquery1.fieldvalues['supplier_name'];
  label21.Caption := dm.ADOQuery1.Fieldbyname('remark').AsString;

  dm.ADO69SUPP_PTR.Value := dm.adoquery1.FieldValues['supplier_ptr'];   //供应商
  dm.ADO69PO_LINK_PTR.Value := dm.adoquery1.FieldValues['currency_ptr'];  //货币
  dm.ADO69UNIT_PTR.Value := dm.adoquery1.FieldValues['purchase_unit_ptr']; //采购单位
  dm.ADO69CONVERSION_FACTOR.Value := dm.adoquery1.FieldValues['CONVERSION_FACTOR'];//转换率
  dm.ADO69extra_req.Value := DM.ADOQuery1.fieldbyname('SUPPLIER_PART_NO').AsString; //特别要求
  dm.ADO69tax.Value:=dm.ADOQuery1.FieldValues['TAX_2'];
  Self.prot_ptr:=dm.ADOQuery1.fieldbyname('prot_report_ptr').AsInteger;
  if dm.ADO69tax.Value = 0 then
   begin
    dm.ADO69UNIT_PRICE.Value := dm.ADOQuery1.FieldValues['PRICE_1'];
    dm.ADO69tax_price.Value := dm.ADOQuery1.FieldValues['PRICE_1'];
   end
  else
   begin
    if dm.ADOQuery1.FieldValues['TAX_FLAG']='N' then
     begin
      dm.ADO69UNIT_PRICE.Value := dm.ADOQuery1.FieldValues['PRICE_1'];
      dm.ADO69tax_price.Value:=strtofloat(
       formatfloat('0.000',dm.ADO69UNIT_PRICE.Value*(1+dm.ADO69tax.Value*0.01)));
     end
    else
     begin
      dm.ADO69tax_price.Value := dm.ADOQuery1.FieldValues['PRICE_1'];
      dm.ADO69UNIT_PRICE.Value :=
       dm.ADO69tax_price.Value/(1+dm.ADO69tax.Value*0.01);
     end;
   end;

  self.price_28 := dm.ADOQuery1.FieldValues['PRICE_1'];
  avl_flag.Caption:=dm.ADOQuery1.FieldValues['TAX_FLAG'];//价格是否含税
  dm.ADO69rohs.Value:=dm.ADOQuery1.fieldbyname('rohs').AsString;  //环保
  dm.ADO69IF_CAF.Value:=dm.ADOQuery1.fieldbyname('IF_CAF').AsString;  //caf

  if dm.ADOQuery1.fieldbyname('LEAD_TIME').AsInteger > 0 then
   MaskEdit2.Text:=FormatDateTime('YYYY-MM-DD hh:nn:ss',
    (common.getsystem_date(dm.ADOQuery2,0)+
     dm.ADOQuery1.fieldbyname('LEAD_TIME').AsInteger));
 end;

end;

procedure TForm3.MaskEdit2Exit(Sender: TObject);
begin
 try
  strtodatetime(maskedit2.Text);
 except
  messagedlg('日期格式输入不正确,请重新输入!',mtwarning,[mbok],0);
  maskedit2.SetFocus;
 end;
end;

procedure TForm3.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbedit1.SetFocus;
end;

procedure TForm3.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbedit7.SetFocus;
end;

procedure TForm3.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then maskedit2.SetFocus;
end;

procedure TForm3.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbedit2.SetFocus;
end;

procedure TForm3.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then edit3.SetFocus;
end;

procedure TForm3.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then maskedit1.SetFocus;
end;

procedure TForm3.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then button1.SetFocus;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
if trim(edit2.Text) <> '' then
begin
form_stdprice := tform_stdprice.Create(application);
form_stdprice.ShowModal;
form_stdprice.Free;
end
else
 begin
  messagedlg('请首先确定材料代码',mtinformation,[mbok],0);
  if edit2.Enabled=true then edit2.SetFocus;
 end;
end;

procedure TForm3.update_69();
begin
 edit3.Text := form_supp.ADOQuery1.FieldValues['code'];
 edit3.Font.Color := clwindowtext;
 label9.Caption := form_supp.ADOQuery1.FieldValues['supplier_name'];
 label21.Caption := form_supp.ADOQuery1.Fieldbyname('remark').AsString;

 dm.ADO69SUPP_PTR.Value := form_supp.ADOQuery1.FieldValues['rkey'];
 dm.ADO69UNIT_PTR.Value := form_supp.ADOQuery1.FieldValues['purchase_unit_ptr'];
 dm.ADO69CONVERSION_FACTOR.Value := form_supp.ADOQuery1.FieldValues['CONVERSION_FACTOR'];
 dm.ADO69PO_LINK_PTR.Value := form_supp.ADOQuery1.FieldValues['currency_ptr']; //货币
 dm.ADO69extra_req.Value :=form_supp.ADOQuery1.fieldbyname('SUPPLIER_PART_NO').AsString;  //特别要求
 dm.ADO69tax.Value:=form_supp.ADOQuery1.FieldValues['TAX_2'];
 Self.prot_ptr:=form_supp.ADOQuery1.fieldbyname('prot_report_ptr').AsInteger;//环保认可外健
  if dm.ADO69tax.Value = 0 then
   begin
    dm.ADO69UNIT_PRICE.Value := form_supp.ADOQuery1.FieldValues['PRICE_1'];
    dm.ADO69tax_price.Value := form_supp.ADOQuery1.FieldValues['PRICE_1'];
   end
  else
   begin
    if form_supp.ADOQuery1.FieldValues['TAX_FLAG']='N' then
     begin
      dm.ADO69UNIT_PRICE.Value := form_supp.ADOQuery1.FieldValues['PRICE_1'];
      dm.ADO69tax_price.Value:=strtofloat(
       formatfloat('0.0000',dm.ADO69UNIT_PRICE.Value*(1+dm.ADO69tax.Value*0.01)));
     end
    else
     begin
      dm.ADO69tax_price.Value := form_supp.ADOQuery1.FieldValues['PRICE_1'];
      dm.ADO69UNIT_PRICE.Value :=
       dm.ADO69tax_price.Value/(1+dm.ADO69tax.Value*0.01);
     end;
   end;

 self.price_28 := form_supp.ADOQuery1.FieldValues['PRICE_1'];
 avl_flag.Caption:=form_supp.ADOQuery1.FieldValues['TAX_FLAG'];//价格是否含税
 dm.ADO69rohs.Value:=form_supp.ADOQuery1.fieldbyname('rohs').AsString;  //环保等级
 dm.ADO69IF_CAF.Value:=FORM_supp.ADOQuery1.fieldbyname('IF_CAF').AsString;  //caf
 dm.ADO69ORIG_ABBRNAME.AsVariant:=form_supp.ADOQuery1.FieldValues['orig_abbrname'];//品牌供应商
 if form_supp.ADOQuery1.fieldbyname('LEAD_TIME').AsInteger > 0 then
  MaskEdit2.Text:=FormatDateTime('YYYY-MM-DD hh:nn:ss',
    (common.getsystem_date(dm.ADOQuery2,0)+
     form_supp.ADOQuery1.fieldbyname('LEAD_TIME').AsInteger));
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
  if dm.ADO69INVT_PTR.Value>0 then
  begin
    form20:=tform20.Create(application);
    form20.ADOQuery1.Close;
    form20.ADOQuery1.Parameters[0].Value:=dm.ADO69INVT_PTR.Value;
    Form20.ADOQuery1.Parameters[1].Value:=DM.ADO69INVT_PTR.Value;
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

procedure TForm3.FormActivate(Sender: TObject);
begin
//if dm.ADO69.State=dsedit then
// begin
  if (dm.ADO69INVT_PTR.Value>0) and (dm.ADO69SUPP_PTR.Value>0) then
  with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('select data0028.rkey,data0028.supplier_ptr,data0028.PRICE_1,TAX_FLAG,data0028.prot_report_ptr,');
    sql.Add('data0028.remark');
    sql.Add('from data0028');
    sql.Add('where data0028.supplier_ptr='+dm.ADO69SUPP_PTR.AsString);
    sql.Add('and data0028.inventory_ptr='+dm.ADO69INVT_PTR.AsString);
    active := true;
    if not IsEmpty then
     begin
       self.prot_ptr:=fieldbyname('prot_report_ptr').AsInteger;
       self.price_28:=fieldvalues['price_1'];
       avl_flag.Caption:=fieldbyname('TAX_FLAG').AsString;
       label21.Caption :=fieldbyname('remark').AsString;//新增
     end;
   end;

  if (dm.ADO69INVT_PTR.Value>0) then
  with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('select CATALOG_NUM from data0017');
    sql.Add('where data0017.rkey='+dm.ADO69INVT_PTR.AsString);
    active := true;
    if not IsEmpty then
      CheckBox1.Checked:=Trim(FieldByName('CATALOG_NUM').AsString)='Y';
   end;

// end;
end;

procedure TForm3.DBEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbedit5.SetFocus;
end;

procedure TForm3.DBEdit7Exit(Sender: TObject);
begin
 if trim(dbedit7.Text) = '' then dbedit7.Field.Value := 0;
 if (trim(edit3.Text)='') and (dm.ADO69tax_PRICE.Value>0) then
  begin
   showmessage('供应商没有确定之前,不能确定价格');
   dbedit7.SetFocus;
  end
 else
  if self.avl_flag.Caption='Y' then  //如果价格含税
   begin
    if (trim(edit3.Text)<>'') and (dm.ADO69tax_PRICE.Value-self.price_28>0.01) then
     begin
      showmessage('含税价格不能大于交付排程的价格!');
      dbedit7.SetFocus;
     end
    else
     begin
      dm.ADO69UNIT_PRICE.Value :=
       dm.ADO69tax_price.Value/(1+dm.ADO69tax.Value*0.01);
     end;
   end
  else
   begin
    if (trim(edit3.Text)<>'') and
       (dm.ADO69tax_PRICE.Value-self.price_28*(1+dm.ADO69tax.Value*0.01)>0.01) then
     begin
      showmessage('供应商价格不能大于交付排程的价格!');
      dbedit7.SetFocus;
     end
    else
     begin
      dm.ADO69UNIT_PRICE.Value :=
       dm.ADO69tax_price.Value/(1+dm.ADO69tax.Value*0.01);
     end;
   end;
end;

procedure Tform3.save_nosupp(rkey17,SUPPLIER_PTR:integer);
begin
  with dm.ADOQuery1 do
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select data0028.rkey,data0028.supplier_ptr,data0028.PRICE_1,data0028.prot_report_ptr,');
    sql.Add('data0028.purchase_unit_ptr,data0028.CONVERSION_FACTOR,data0028.AVL_FLAG,');
    sql.Add('data0023.code,data0023.supplier_name,data0028.currency_ptr,data0028.IF_CAF,');
    sql.Add('data0028.TAX_2,data0028.TAX_FLAG,data0028.rohs,data0028.SUPPLIER_PART_NO,');
    sql.Add('data0028.LEAD_TIME,data0028.remark');
    sql.Add('from data0028 inner join data0023');
    sql.Add('on data0028.supplier_ptr=data0023.rkey');
    sql.Add('where inventory_ptr='+inttostr(rkey17));
    sql.Add('and data0023.status=0');
    sql.Add('and data0028.AVL_FLAG=''Y''');
    active := true;
    if isempty then //没有定义价格
     begin
      if messagedlg('材料:'+trim(edit2.Text)+'没有定义供应商价格是否继续?',
       mtconfirmation,[mbyes,mbno],0)=mrno then
       edit2.SetFocus
     end
    else   //已定义价格可能有多条记录
     if dm.ADOQuery1.RecordCount=1 then //如果该材料只有一个供应商有价格表
       self.find_supplier()
     else                              //如果有多个供应商价格，那么寻找首选供应商
      if Locate('supplier_ptr',SUPPLIER_PTR,[]) then
       find_supplier();
   end;
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
if dm.ADO69INVT_PTR.Value>0 then
 begin
  form_zaitu:=tform_zaitu.Create(application);
  form_zaitu.ADODataSet1.Close;
  form_zaitu.ADODataSet1.Parameters[0].Value:=dm.ADO69INVT_PTR.Value;
  form_zaitu.ADODataSet1.Open;
  if not form_zaitu.ADODataSet1.IsEmpty then
   begin
    form_zaitu.ShowModal;
    form_zaitu.Free;
   end
  else
   showmessage('没有找到在途材料');
 end
else
 showmessage('请先选择材料!');
end;


procedure TForm3.FormShow(Sender: TObject);
begin
 if StrToInt(vprev)<>4  then
 begin
  Edit2.ReadOnly:=True;
  BitBtn3.Enabled:=False;
 end;
end;
procedure TForm3.DBEdit10DblClick(Sender: TObject);
begin
 dm.ADO69ORIG_ABBRNAME.AsVariant:=null;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
   frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
   try
    InputVar.Fields := 'code/供应商代码/60,supplier_name/供应商名称/200,abbr_name/简称/150';
    InputVar.Sqlstr := 'select RKEY,CODE,supplier_name,abbr_name from data0023 '+
                    'order by CODE';
    inputvar.KeyField:='CODE';
    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
     begin
      DBEdit10.Field.Value := frmPick_Item_Single.adsPick.FieldValues['abbr_name'];
     end
    else
    DBEdit10.SetFocus;
   finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
   end;
end;

end.
