unit addedit_requ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, ADODB;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn3: TBitBtn;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    MaskEdit1: TMaskEdit;
    Button1: TButton;
    Button2: TButton;
    DBEdit3: TDBEdit;
    DBText1: TDBText;
    Label10: TLabel;
    DBEdit4: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Button3: TButton;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Button4: TButton;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure save_inv();
    procedure find_supplier();
    procedure Button1Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
   v_close:byte; 
  public
    { Public declarations }
    if_a_e:byte;
  end;

var
  Form3: TForm3;

implementation
 uses damo, edit_req,inv_search, kucun_serach;
{$R *.dfm}

procedure TForm3.FormActivate(Sender: TObject);
begin
  edit1.Text := form2.Edit1.Text + form2.Label9.Caption;
end;

procedure TForm3.BitBtn3Click(Sender: TObject);
begin
 try
  form_inv:=tform_inv.Create(application);
  form_inv.Edit1.Text := trim(edit2.Text);
  if form_inv.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
    edit2.SetFocus;
   end
  else
  if form_inv.ShowModal=mrok then
   begin
    self.save_inv();
    if (activecontrol.Name='BitBtn3') then
     dbedit1.SetFocus;    
   end
  else
   edit2.SetFocus;
 finally
  form_inv.free;
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
  form_inv:=tform_inv.Create(application);
  form_inv.Edit1.Text := trim(edit2.Text);
 if comparetext(trim(edit2.text),trim(form_inv.ADOQuery1.Fieldbyname('inv_part_number').AsString))=0 then
  self.save_inv()
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
   and (trim(edit2.Text)='') then
 label8.Caption := '';
end;

procedure Tform3.save_inv();
begin
with dm.ADOQuery1 do
 begin
  active:=false;
  sql.Clear;
  sql.Add('select rkey from data0018');
  sql.Add('where invent_ptr='+form_inv.ADOQuery1RKEY.AsString);
  sql.Add('and whouse_ptr='+dm.ADO68WHSE_PTR.AsString);
  active:=true;
 end;
if dm.ADOQuery1.IsEmpty then //如果原材料没有在指定的仓库中定义
 begin
  messagedlg('材料:'+trim(form_inv.ADOQuery1INV_PART_NUMBER.Value)+'没有在工厂:'+form2.Edit1.Text+'中定义',
  mterror,[mbcancel],0);
  edit2.SetFocus;
 end
else
 begin
  dm.ADO69UNIT_PTR.Value := form_inv.adoquery1purch_unit_ptr.value;;    //采购单位
  dm.ADO69CONVERSION_FACTOR.Value := form_inv.ADOQuery1stock_purch.Value;//转换率
  edit2.Text := trim(form_inv.ADOQuery1INV_PART_NUMBER.Value);
  edit2.Font.Color := clwindowtext;
  label8.Caption := form_inv.ADOQuery1INV_PART_DESCRIPTION.Value;
  dm.ADO69INVT_PTR.Value := form_inv.ADOQuery1RKEY.Value;
  dm.ADO69extra_req.Value := form_inv.ADOQuery1manufacturer_name.Value;
 end;                                          //特别要求
end;

procedure TForm3.Button1Click(Sender: TObject);
var
 reason:string;
begin
if trim(edit2.Text) = '' then
 begin
  messagedlg('请输入正确的原材料!',mtinformation,[mbcancel],0);
  edit2.SetFocus;
  exit;
 end;
if dbedit1.Field.Value <= 0 then
 begin
  messagedlg('请输入正确的采购数量!',mtinformation,[mbcancel],0);
  dbedit1.SetFocus;
  exit;
 end;

if trim(dm.ADO69reason.Value) = '' then
 begin
  messagedlg('请输入请购原因!',mtinformation,[mbcancel],0);
  dbedit2.SetFocus;
  exit;
 end;

 dm.ADO69REQ_DATE.AsString := maskedit1.Text;

 if self.if_a_e=0 then
  begin
   dm.ADO69.Post;
   reason := dm.ADO69reason.Value;
   dm.ADO69.Append;
   dm.ADO69QUANTITY.Value := 0;
   dm.ADO69UNIT_PRICE.Value := 0;
   dm.ADO69PURCH_REQ_PTR.Value := dm.ADO68RKEY.Value; //给主表指针赋值
   dm.ADO69reason.Value := reason;

   edit2.Text := '';
   edit2.Font.Color := clblue;
   label8.Caption := '';
   edit2.SetFocus;
  end
 else
  begin
   v_close := 1;
   ModalResult := mrok;
  end;
end;

procedure TForm3.DBEdit1Exit(Sender: TObject);
begin
 if trim(dbedit1.Text) = '' then dbedit1.Field.Value := 0;
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
 dm.ADO69SUPP_PTR.Value := dm.adoquery1.FieldValues['supplier_ptr'];
 dm.ADO69UNIT_PTR.Value := dm.adoquery1.FieldValues['purchase_unit_ptr'];
 dm.ADO69CONVERSION_FACTOR.Value := dm.adoquery1.FieldValues['CONVERSION_FACTOR'];
 edit2.Text := trim(form_inv.ADOQuery1INV_PART_NUMBER.Value);
 edit2.Font.Color := clwindowtext;
 label8.Caption := form_inv.ADOQuery1INV_PART_DESCRIPTION.Value;
 dm.ADO69INVT_PTR.Value := form_inv.ADOQuery1RKEY.Value;
end;

procedure TForm3.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then maskedit1.SetFocus;
end;

procedure TForm3.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then dbedit2.SetFocus;
end;

procedure TForm3.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then button1.SetFocus;
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

end.
