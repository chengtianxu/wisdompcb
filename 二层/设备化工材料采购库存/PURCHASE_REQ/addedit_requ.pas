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
    Label10: TLabel;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    DBText2: TDBText;
    Label13: TLabel;
    DBEdit5: TDBEdit;
    Button3: TButton;
    BitBtn1: TBitBtn;
    Label14: TLabel;
    DBEdit6: TDBEdit;
    Button4: TButton;
    Edit4: TEdit;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBText3: TDBText;
    DBEdit7: TDBEdit;
    Label17: TLabel;
    DBEdit8: TDBEdit;
    Label18: TLabel;
    DBEdit9: TDBEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure save_inv();
    procedure find_supplier();
    procedure update_69();
    procedure Edit3Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MaskEdit1Exit(Sender: TObject);
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
    function get_invzaitu(rkey17:integer):double;
    procedure DBEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBEdit8KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
   v_close:byte;
   price_28:double;
  public
    { Public declarations }
   if_a_e:byte; //编辑还是新增 0,1 
  end;

var
  Form3: TForm3;

implementation
 uses damo, edit_req,inv_search, supplier_search, stdhistory_price,
  kucun_serach;
{$R *.dfm}

procedure TForm3.BitBtn3Click(Sender: TObject);
begin
 try
  form_inv := tform_inv.Create(application);
  form_inv.ADOQuery1.Close;
  form_inv.ADOQuery1.Parameters.ParamByName('rkey15').Value:=dm.ADO68WHSE_PTR.Value;
  form_inv.ADOQuery1.Parameters.ParamByName('INV_NAME').Value:='%'+trim(edit2.Text)+'%';
  form_inv.ADOQuery1.Open;
  if form_inv.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
    edit2.SetFocus;
   end
  else
  if form_inv.ShowModal = mrok then
   begin
   if dm.ADO69INVT_PTR.Value<>form_inv.ADOQuery1RKEY.Value then
    begin

     dm.ADO69SUPP_PTR.AsVariant := null;
     edit3.Text :='';
     edit3.Font.Color := clblue;
     label9.Caption := '';
     dm.ADO69SUPP_PTR.AsVariant :=null;
     dm.ADO69tax.Value:= 0;
     dm.ADO69UNIT_PRICE.Value := 0;
     dm.ADO69tax_price.Value := 0;
     dm.ADO69CONVERSION_FACTOR.Value := 0;
     self.save_inv();
    end;
    if activecontrol.Name = 'BitBtn3' then edit3.SetFocus;
   end
  else
   edit2.SetFocus;
 finally
  form_inv.free;
 end;
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
begin
 if trim(edit2.Text)='' then
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
   sql.Add('data0028.TAX_2,data0028.TAX_FLAG');
   sql.Add('FROM Data0023,data0028');
   sql.Add('where data0028.supplier_ptr = data0023.rkey and');
   sql.Add('data0028.AVL_FLAG <> ''N'' and');
   sql.Add('data0028.inventory_ptr ='+dm.ADO69INVT_PTR.AsString);
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
   if dm.ADO69SUPP_PTR.Value<>form_supp.ADOQuery1.FieldValues['rkey'] then
    begin
     self.update_69;
     maskedit1.SetFocus;
    end;
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
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'Button2')
   and (trim(edit2.Text)<>'') then
 try
  form_inv := tform_inv.Create(application);
  form_inv.ADOQuery1.Close;
  form_inv.ADOQuery1.Parameters.ParamByName('rkey15').Value:=dm.ADO68WHSE_PTR.Value;
  form_inv.ADOQuery1.Parameters.ParamByName('INV_NAME').Value:='%'+trim(edit2.Text)+'%';
  form_inv.ADOQuery1.Open;
  if comparetext(trim(edit2.text),trim(form_inv.ADOQuery1inv_part_number.Value))=0 then
   begin
    if dm.ADO69INVT_PTR.Value<>form_inv.ADOQuery1RKEY.Value then
     begin
      edit3.Text :='';
      edit3.Font.Color := clblue;
      label9.Caption := '';
      dm.ADO69SUPP_PTR.AsVariant := null;
      dm.ADO69tax.Value:= 0;
      dm.ADO69UNIT_PRICE.Value := 0;
      dm.ADO69tax_price.Value := 0;
      dm.ADO69CONVERSION_FACTOR.Value := 0;
      save_inv();
     end;
   end
  else
   begin
    messagedlg('原材料号码不正确,请重新输入或选择',mtinformation,[mbok],0);
    label8.Caption := '';
    edit2.SetFocus;
   end;
 finally
  form_inv.Free;
 end
else
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'Button2')
 and (trim(edit2.Text) = '') then
 label8.Caption := '';
end;

procedure Tform3.save_inv();
var
 search_op:tlocateoptions;
begin
  with dm.ADOQuery1 do
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select data0028.rkey,data0028.supplier_ptr,data0028.PRICE_1,');
    sql.Add('data0028.purchase_unit_ptr,data0028.CONVERSION_FACTOR,data0028.AVL_FLAG,');
    sql.Add('data0023.code,data0023.supplier_name,data0028.currency_ptr,');
    sql.Add('data0028.TAX_2,data0028.TAX_FLAG,');
    sql.Add('data0028.LEAD_TIME');
    sql.Add('from data0028 inner join data0023');
    sql.Add('on data0028.supplier_ptr=data0023.rkey');
    sql.Add('where data0028.AVL_FLAG<>''N''');
    sql.Add('and inventory_ptr='+form_inv.ADOQuery1RKEY.AsString);
    active := true;
    if dm.ADOQuery1.RecordCount=1 then //如果该材料只有一个供应商有价格表
     self.find_supplier()
    else      //如果有多个供应商价格，那幺寻找首选供应商
     begin
      search_op:=[lopartialkey];
      if Locate('supplier_ptr',form_inv.ADOQuery1PREF_SUPPLIER_PTR.Value,search_op) then
       self.find_supplier()
      else                      //但没有首选供应商
       begin
        edit2.Text := trim(form_inv.ADOQuery1INV_PART_NUMBER.Value);
        edit2.Font.Color := clwindowtext;
        label8.Caption := form_inv.ADOQuery1INV_PART_DESCRIPTION.Value;
        dm.ADO69INVT_PTR.Value := form_inv.ADOQuery1RKEY.Value;
        dm.ADO69req_unit_ptr.Value:=form_inv.ADOQuery1STOCK_UNIT_PTR.Value; //存货单位
        edit4.Text:=floattostr(self.get_invzaitu(dm.ADO69INVT_PTR.Value));
       end;
     end
   end;
end;

procedure TForm3.Edit3Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn4') and
   (activecontrol.Name<>'Button2') and
   (trim(edit3.Text)<>'') then
 try
  form_supp:=tform_supp.Create(application);
  with form_supp.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('SELECT Data0023.RKEY,data0028.purchase_unit_ptr,');
   sql.Add('Data0023.CODE,data0028.CONVERSION_FACTOR,data0028.AVL_FLAG,');
   sql.Add('Data0023.SUPPLIER_NAME,data0028.currency_ptr,data0028.PRICE_1,');
   sql.Add('data0028.TAX_2,data0028.TAX_FLAG');
   sql.Add('FROM Data0023,data0028');
   sql.Add('where data0028.supplier_ptr = data0023.rkey and');
   sql.Add('data0028.AVL_FLAG <> ''N'' and');
   sql.Add('data0028.inventory_ptr ='+dm.ADO69INVT_PTR.AsString);
   sql.Add('ORDER BY Data0023.CODE');
   open;
  end;
  form_supp.Edit1.Text := trim(edit3.Text);
 if comparetext(trim(edit3.text),trim(form_supp.ADOQuery1.Fieldbyname('code').AsString))=0 then
  begin
   if dm.ADO69SUPP_PTR.Value<>form_supp.ADOQuery1.FieldValues['rkey'] then
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
  dm.ADO69UNIT_PTR.AsVariant := null;    //采购单位
  dm.ADO69PO_LINK_PTR.AsVariant := null; //货币
  dm.ADO69UNIT_PRICE.Value := 0; //采购价格
  dm.ADO69tax_price.Value := 0;  //请购价格
  dm.ADO69CONVERSION_FACTOR.Value :=0;
  dm.ADO69tax.Value := 0;
 end;
end;

procedure TForm3.Button1Click(Sender: TObject);
VAR
 reason:string;
begin
 if trim(edit2.Text) = '' then
  begin
   messagedlg('请输入正确的原材料!',mtinformation,[mbcancel],0);
   edit2.SetFocus;
   exit;
  end;

 if (dbedit8.Field.Value <= 0) then
  begin
   messagedlg('请输入正确的请购数量!',mtinformation,[mbcancel],0);
   dbedit8.SetFocus;
   exit;
  end;

 if trim(dbedit5.Text) = '' then
  begin
   messagedlg('请购原因不能为空!',mtinformation,[mbcancel],0);
   dbedit5.SetFocus;
   exit;
  end;

 dm.ADO69REQ_DATE.AsString := maskedit1.Text;

 if if_a_e=0 then      //新增
  begin
   dm.ADO69.Post;
   dm.ADO68TOTAL.Value := dm.ADO68TOTAL.Value+//换算成,本位币
      dm.ADO69QUANTITY.Value*dm.ADO69unit_PRICE.Value*dm.ADO69base_to.Value;

   reason := dm.ADO69reason.Value;
   dm.ADO69.Append;
   dm.ADO69req_quantity.Value:=0;
   dm.ADO69QUANTITY.Value := 0;
   dm.ADO69UNIT_PRICE.Value := 0;
   dm.ADO69tax_price.Value:=0;
   dm.ADO69PURCH_REQ_PTR.Value := dm.ADO68RKEY.Value; //给主表指针赋值
   dm.ADO69reason.Value := reason;

   edit2.Text := '';
   edit2.Font.Color := clblue;
   label8.Caption := '';
   edit3.Text := '';
   edit3.Font.Color := clblue;
   label9.Caption := '';
   edit4.Text:='0';
   edit2.SetFocus;
  end
 else
  begin
   v_close := 1;
   ModalResult := mrok;
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
if v_close<>1 then dm.ado69.Cancel;
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

procedure TForm3.find_supplier();
begin
if dm.ADO69SUPP_PTR.AsVariant = null then
 begin
  edit3.Text := dm.adoquery1.fieldvalues['code']; //供应商代码
  edit3.Font.Color := clwindowtext;
  label9.Caption := dm.adoquery1.fieldvalues['supplier_name'];
  dm.ADO69SUPP_PTR.Value := dm.adoquery1.FieldValues['supplier_ptr'];  //供应商
  dm.ADO69PO_LINK_PTR.Value := dm.adoquery1.FieldValues['currency_ptr']; //货币
  dm.ADO69UNIT_PTR.Value := dm.adoquery1.FieldValues['purchase_unit_ptr']; //采购单位
  dm.ADO69CONVERSION_FACTOR.Value := dm.adoquery1.FieldValues['CONVERSION_FACTOR'];//转换率
  dm.ADO69tax.Value:=dm.ADOQuery1.FieldValues['TAX_2'];
  dm.ADO69UNIT_PRICE.Value := dm.ADOQuery1.FieldValues['PRICE_1'];   //采购价格
  if dm.ADO69CONVERSION_FACTOR.Value > 0 then//如果确定了转换率则自动算出请购价格
   dm.ADO69tax_price.Value := dm.ADO69UNIT_PRICE.Value/dm.ADO69CONVERSION_FACTOR.Value;
  self.price_28:= dm.ADOQuery1.FieldValues['PRICE_1'];
  maskedit1.Text := datetimetostr(strtodatetime(maskedit1.Text)+dm.ADOQuery1.FieldValues['LEAD_TIME']);
 end;

 edit2.Text := trim(form_inv.ADOQuery1INV_PART_NUMBER.Value);
 edit2.Font.Color := clwindowtext;
 label8.Caption := form_inv.ADOQuery1INV_PART_DESCRIPTION.Value;
 dm.ADO69INVT_PTR.Value := form_inv.ADOQuery1RKEY.Value; //材料
 dm.ADO69req_unit_ptr.Value:=form_inv.ADOQuery1STOCK_UNIT_PTR.Value;
 edit4.Text:=floattostr(self.get_invzaitu(dm.ADO69INVT_PTR.Value));
end;

procedure TForm3.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbedit5.SetFocus;
end;

procedure TForm3.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbedit8.SetFocus;
end;

procedure TForm3.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbedit7.SetFocus;
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
 dm.ADO69SUPP_PTR.Value := form_supp.ADOQuery1.FieldValues['rkey'];
 dm.ADO69UNIT_PTR.Value := form_supp.ADOQuery1.FieldValues['purchase_unit_ptr'];
 dm.ADO69CONVERSION_FACTOR.Value := form_supp.ADOQuery1.FieldValues['CONVERSION_FACTOR'];
 dm.ADO69PO_LINK_PTR.Value := form_supp.ADOQuery1.FieldValues['currency_ptr']; //货币
 dm.ADO69tax.Value:=form_supp.ADOQuery1.FieldValues['TAX_2'];
 dm.ADO69UNIT_PRICE.Value := form_supp.ADOQuery1.FieldValues['PRICE_1'];
 if dm.ADO69CONVERSION_FACTOR.Value > 0 then
  dm.ADO69tax_price.Value := dm.ADO69UNIT_PRICE.Value/dm.ADO69CONVERSION_FACTOR.Value;
  self.price_28 := form_supp.ADOQuery1.FieldValues['PRICE_1'];
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

procedure TForm3.FormActivate(Sender: TObject);
begin
if dm.ADO69.State=dsedit then
 begin
  if (dm.ADO69INVT_PTR.Value>0) and (dm.ADO69SUPP_PTR.Value>0) then
  with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('select data0028.rkey,data0028.supplier_ptr,data0028.PRICE_1');
    sql.Add('from data0028');
    sql.Add('where data0028.supplier_ptr='+dm.ADO69SUPP_PTR.AsString);
    sql.Add('and data0028.inventory_ptr='+dm.ADO69INVT_PTR.AsString);
    active := true;
    if not IsEmpty then self.price_28:=fieldvalues['price_1'];
   end;
  edit4.Text:=floattostr(self.get_invzaitu(dm.ADO69INVT_PTR.Value));
 end
else
 if dm.ADO69.State=dsbrowse then
  edit4.Text:=floattostr(self.get_invzaitu(dm.ADO69INVT_PTR.Value));
end;

function TForm3.get_invzaitu(rkey17:integer):double;
begin
with dm.ADOQuery2 do
begin
 close;
 sql.Clear;
 sql.Add('SELECT Data0071.INVT_PTR,');
 sql.Add('SUM(Data0071.QUAN_ORD - Data0071.QUAN_RECD + Data0071.QUAN_RETN) as qty_zaitu');
 sql.Add('FROM Data0071 INNER JOIN');
 sql.Add('Data0070 ON Data0071.PO_PTR = Data0070.RKEY');
 sql.Add('WHERE Data0070.STATUS = 5');
 sql.Add('and data0071.invt_ptr='+inttostr(rkey17));
 sql.Add('GROUP BY dbo.Data0071.INVT_PTR');
 open;
 if IsEmpty then
  Result:=0
 else
  Result:=fieldvalues['qty_zaitu']; 
end;

end;

procedure TForm3.DBEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbedit2.SetFocus;
end;

procedure TForm3.DBEdit8Exit(Sender: TObject);
begin
if trim(dbedit8.Text)='' then dbedit8.Field.Value:=0;
if dm.ADO69CONVERSION_FACTOR.Value>0 then
 dm.ADO69QUANTITY.Value:=dm.ADO69req_quantity.Value/dm.ADO69CONVERSION_FACTOR.Value;
end;

procedure TForm3.DBEdit8KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then  //判断是否输入数字
  abort
 else 
 if (key=chr(46)) and (pos('.',(sender as tdbedit).Text)<>0) then abort;
end;

procedure TForm3.DBEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbedit5.SetFocus;
end;

end.
