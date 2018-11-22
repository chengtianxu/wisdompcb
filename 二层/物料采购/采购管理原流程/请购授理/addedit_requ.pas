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
    Button4: TButton;
    Label15: TLabel;
    DBEdit7: TDBEdit;
    Label16: TLabel;
    DBText3: TDBText;
    Label17: TLabel;
    DBEdit8: TDBEdit;
    avl_flag: TLabel;
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
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
   v_close:byte;
   price_28:double;    
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
 uses damo, edit_req,inv_search, supplier_search, stdhistory_price,
  kucun_serach;
{$R *.dfm}
procedure TForm3.update_69();
begin
 edit3.Text := form_supp.ADOQuery1.FieldValues['code'];
 edit3.Font.Color := clwindowtext;
 label9.Caption := form_supp.ADOQuery1.FieldValues['supplier_name'];
 dm.ADO69SUPP_PTR.Value := form_supp.ADOQuery1.FieldValues['rkey'];
 dm.ADO69UNIT_PTR.Value := form_supp.ADOQuery1.FieldValues['purchase_unit_ptr'];
 dm.ADO69CONVERSION_FACTOR.Value := form_supp.ADOQuery1.FieldValues['CONVERSION_FACTOR'];
 dm.ADO69PO_LINK_PTR.Value := form_supp.ADOQuery1.FieldValues['currency_ptr']; //货币

  dm.ADO69tax.Value:=form_supp.ADOQuery1.FieldValues['TAX_2'];

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
       formatfloat('0.000',dm.ADO69UNIT_PRICE.Value*(1+dm.ADO69tax.Value*0.01)));
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
 dm.ADO69rohs.Value:=form_supp.ADOQuery1.fieldbyname('rohs').AsString;
end;

procedure TForm3.find_supplier();
begin
if dm.ADO69SUPP_PTR.Value <> dm.adoquery1.FieldValues['supplier_ptr'] then
 begin
  edit3.Text := dm.adoquery1.fieldvalues['code']; //供应商代码
  edit3.Font.Color := clwindowtext;
  label9.Caption := dm.adoquery1.fieldvalues['supplier_name'];
  dm.ADO69SUPP_PTR.Value := dm.adoquery1.FieldValues['supplier_ptr'];   //供应商
  dm.ADO69PO_LINK_PTR.Value := dm.adoquery1.FieldValues['currency_ptr'];  //货币
  dm.ADO69UNIT_PTR.Value := dm.adoquery1.FieldValues['purchase_unit_ptr']; //采购单位
  dm.ADO69CONVERSION_FACTOR.Value := dm.adoquery1.FieldValues['CONVERSION_FACTOR'];//转换率

  dm.ADO69tax.Value:=dm.ADOQuery1.FieldValues['TAX_2'];
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
  dm.ADO69rohs.Value:=dm.ADOQuery1.fieldbyname('rohs').AsString;
 end;
end;

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
    edit2.Text := trim(form_inv.ADOQuery1INV_PART_NUMBER.Value);
    edit2.Font.Color := clwindowtext;
    dm.ADO69req_unit_ptr.Value:=form_inv.ADOQuery1STOCK_UNIT_PTR.Value;
    dm.ADO69avl_flag.Value:=form_inv.ADOQuery1INSPECT.Value;
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
 if edit2.Font.Color = clblue then
  begin
   messagedlg('请先输入原材料!',mtinformation,[mbok],0);
   edit2.SetFocus;
  end
 else
try
 form_supp:=tform_supp.Create(application);
 with form_supp.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('SELECT Data0023.RKEY,data0028.purchase_unit_ptr,');
   sql.Add('Data0023.CODE,data0028.CONVERSION_FACTOR,data0028.AVL_FLAG,');
   sql.Add('Data0023.SUPPLIER_NAME,data0028.currency_ptr,data0028.PRICE_1,');
   sql.Add('data0028.TAX_2,data0028.TAX_FLAG,data0028.rohs');
   sql.Add('FROM Data0023,data0028');
   sql.Add('where data0028.supplier_ptr = data0023.rkey and');
   sql.Add('data0028.inventory_ptr ='+dm.ADO69INVT_PTR.AsString);
   sql.Add('and data0023.status=0');
   sql.Add('and data0028.avl_flag=''Y''');
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

procedure Tform3.save_nosupp(rkey17,SUPPLIER_PTR:integer);
begin
  with dm.ADOQuery1 do
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select data0028.rkey,data0028.supplier_ptr,data0028.PRICE_1,');
    sql.Add('data0028.purchase_unit_ptr,data0028.CONVERSION_FACTOR,data0028.AVL_FLAG,');
    sql.Add('data0023.code,data0023.supplier_name,data0028.currency_ptr,');
    sql.Add('data0028.TAX_2,data0028.TAX_FLAG,data0028.rohs');
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
       find_supplier()
     else                     //如果有多个供应商价格，那幺寻找首选供应商
      if Locate('supplier_ptr',SUPPLIER_PTR,[]) then
        find_supplier();
   end;
end;

procedure TForm3.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and
   (activecontrol.Name<>'Button2') and
   (trim(edit2.Text)<>'') then
begin
 with dm.ADOQuery2 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey,PREF_SUPPLIER_PTR,INV_PART_DESCRIPTION,STOCK_UNIT_PTR,');
   sql.Add('INSPECT from data0017');
   sql.Add('where INV_PART_NUMBER='''+trim(edit2.Text)+'''');
   open;
  end;
 if not dm.ADOQuery2.IsEmpty then
  begin
   dm.ADO69req_unit_ptr.Value:=dm.ADOQuery2.FieldValues['STOCK_UNIT_PTR'];
   dm.ADO69avl_flag.Value:=dm.ADOQuery2.FieldValues['INSPECT'];

   if dm.ADOQuery2.FieldValues['rkey']=dm.ADO69INVT_PTR.Value then
    begin
     if dm.ADO69SUPP_PTR.AsVariant=null then      //材料确定查找供应商
     with dm.ADOQuery2 do
      begin
       close;
       sql.Clear;
       sql.Add('select PREF_SUPPLIER_PTR from data0017');
       sql.Add('where rkey='+dm.ADO69INVT_PTR.AsString);
       open;
       save_nosupp(dm.ADO69INVT_PTR.Value,dm.ADOQuery2.Fieldbyname('PREF_SUPPLIER_PTR').AsInteger);
      end;
    end
   else
    begin
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
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'Button2')
 and (trim(edit2.Text) = '') then
 label8.Caption := '';
end;

procedure Tform3.save_inv(rkey17,SUPPLIER_PTR:integer;PART_DESCRIPTION:string);
begin
with dm.ADOQuery1 do
 begin
  active:=false;
  sql.Clear;
  sql.Add('select rkey from data0018');
  sql.Add('where invent_ptr='+inttostr(rkey17));
  sql.Add('and whouse_ptr='+dm.ADO68WHSE_PTR.AsString);
  active:=true;
 end;
if dm.ADOQuery1.IsEmpty then //如果原材料没有在指定的仓库中定义
 begin
  messagedlg('材料:'+trim(edit2.Text)+'没有在工厂:'+form2.Edit1.Text+'中定义',
  mterror,[mbcancel],0);
  edit2.SetFocus;
 end
else
 with dm.ADOQuery1 do
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select data0028.rkey,data0028.supplier_ptr,data0028.PRICE_1,');
    sql.Add('data0028.purchase_unit_ptr,data0028.CONVERSION_FACTOR,data0028.AVL_FLAG,');
    sql.Add('data0023.code,data0023.supplier_name,data0028.currency_ptr,');
    sql.Add('data0028.TAX_2,data0028.TAX_FLAG,data0028.rohs');
    sql.Add('from data0028 inner join data0023');
    sql.Add('on data0028.supplier_ptr=data0023.rkey');
    sql.Add('where data0028.inventory_ptr='+inttostr(rkey17));
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
       if Locate('supplier_ptr',SUPPLIER_PTR,[]) then  //找到首选
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
    sql.Add('SELECT Data0023.RKEY,data0028.purchase_unit_ptr,');
    sql.Add('Data0023.CODE,data0028.CONVERSION_FACTOR,data0028.AVL_FLAG,');
    sql.Add('Data0023.SUPPLIER_NAME,data0028.currency_ptr,data0028.PRICE_1,');
    sql.Add('data0028.TAX_2,data0028.TAX_FLAG,data0028.rohs');
    sql.Add('FROM Data0023,data0028');
    sql.Add('where data0028.supplier_ptr = data0023.rkey and');
    sql.Add('data0028.inventory_ptr ='+dm.ADO69INVT_PTR.AsString);
    sql.Add('and data0023.status=0');
    sql.Add('and data0028.avl_flag=''Y''');
    sql.Add('ORDER BY Data0023.CODE');
    open;
   end;
 form_supp.Edit1.Text := trim(edit3.Text);
 if comparetext(trim(edit3.text),trim(form_supp.ADOQuery1.Fieldbyname('code').AsString))=0 then
  begin
    self.update_69;
  end
 else
  begin
   messagedlg('供应商代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label9.Caption := '';
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
  dm.ADO69SUPP_PTR.AsVariant := null;
  dm.ADO69UNIT_PTR.AsVariant := null;
  dm.ADO69PO_LINK_PTR.AsVariant := null; //货币
  dm.ADO69UNIT_PRICE.Value:=0;
  dm.ADO69tax_price.Value:=0;
  dm.ADO69tax.Value:=0;
  dm.ADO69rohs.Value:='';
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
//==============================================================================
 if trim(edit3.Text) <> '' then
 with dm.ADOQuery1 do
  begin
   if active= true then active:=false;
   sql.Clear;
   sql.Add('select * from data0028');
   sql.Add('where inventory_ptr='+dm.ADO69INVT_PTR.AsString);
   sql.Add('and supplier_ptr='+dm.ADO69SUPP_PTR.AsString);
   active:=true;
   if IsEmpty then
    begin
     messagedlg('供应商:'+trim(edit3.Text)+'没有材料:'+trim(edit2.Text)+'的价格',mterror,[mbcancel],0);
     edit3.SetFocus;
     exit;
    end;
{   else
    begin
     if dbedit2.Field.Value=0 then   //默认价格赋值给采购价格
      for i:=1 to 5 do               //范围比较中很好的技巧
       begin
        if dbedit1.Field.Value<=fieldvalues['quan_vol_'+inttostr(i)] then
         begin
          dbedit2.Field.Value := fieldvalues['price_'+inttostr(i)];
          break
         end
        else
         if fieldvalues['quan_vol_'+inttostr(i)]=0 then
          begin
           dbedit2.Field.Value := fieldvalues['price_'+inttostr(i)];
           break
          end
         else
          if i=5 then
           dbedit2.Field.Value := fieldvalues['price_6'];
       end;
    end;}
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
   if (trim(edit3.Text)<>'') and (dm.ADO69UNIT_PRICE.Value>price_28/(1+dm.ADO69tax.Value*0.01)) then
    begin
     showmessage('不含税价格不能大于交付排程的价格!');
     dbedit2.SetFocus;
    end
   else
    begin
     dm.ADO69tax_price.Value:=strtofloat(
      formatfloat('0.000',dm.ADO69UNIT_PRICE.Value*(1+dm.ADO69tax.Value*0.01)));
    end;
   end
  else
   begin
    if (trim(edit3.Text)<>'') and (dm.ADO69UNIT_PRICE.Value>price_28) then
    begin
     showmessage('不含税价格不能大于交付排程的价格!');
     dbedit2.SetFocus;
    end
    else
    begin
     dm.ADO69tax_price.Value:=strtofloat(
       formatfloat('0.000',dm.ADO69UNIT_PRICE.Value*(1+dm.ADO69tax.Value*0.01)));
    end;
   end;
end;

procedure TForm3.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if edit2.Font.Color=clblue then
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

procedure TForm3.Button4Click(Sender: TObject);
begin
if dm.ADO69INVT_PTR.Value>0 then
 begin
  form20:=tform20.Create(application);
  form20.ADOQuery1.Close;
  form20.ADOQuery1.Parameters[0].Value:=dm.ADO69INVT_PTR.Value;
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
    if (trim(edit3.Text)<>'') and (dm.ADO69tax_PRICE.Value>self.price_28) then
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
  if (trim(edit3.Text)<>'') and (dm.ADO69tax_PRICE.Value>self.price_28*(1+dm.ADO69tax.Value*0.01)) then
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

procedure TForm3.DBEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbedit5.SetFocus;
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
if dm.ADO69.State=dsedit then
 begin
  if (dm.ADO69INVT_PTR.Value>0) and (dm.ADO69SUPP_PTR.Value>0) then
  with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('select data0028.rkey,data0028.supplier_ptr,data0028.PRICE_1,data0028.TAX_FLAG');
    sql.Add('from data0028');
    sql.Add('where data0028.supplier_ptr='+dm.ADO69SUPP_PTR.AsString);
    sql.Add('and data0028.inventory_ptr='+dm.ADO69INVT_PTR.AsString);
    active := true;
    if not IsEmpty then
    begin
     self.price_28:=fieldvalues['price_1'];
     avl_flag.Caption:=FieldValues['TAX_FLAG'];//价格是否含税
    end;
   end;
 end;
end;

end.
