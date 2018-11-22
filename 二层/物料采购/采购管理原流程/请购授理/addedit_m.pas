unit addedit_m;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    MaskEdit1: TMaskEdit;
    Button1: TButton;
    Button2: TButton;
    Label4: TLabel;
    DBText1: TDBText;
    DBComboBox1: TDBComboBox;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit2: TEdit;
    BitBtn3: TBitBtn;
    Label11: TLabel;
    DBEdit2: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label12: TLabel;
    MaskEdit2: TMaskEdit;
    DBEdit5: TDBEdit;
    Label13: TLabel;
    Button3: TButton;
    BitBtn2: TBitBtn;
    Button4: TButton;
    Label14: TLabel;
    DBEdit6: TDBEdit;
    Label15: TLabel;
    DBEdit7: TDBEdit;
    Label16: TLabel;
    DBComboBox2: TDBComboBox;
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure DBEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn3Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure DBEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
   v_close:byte;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
uses damo, supplier_search, Unit_search, michistory_price, curr_search;
{$R *.dfm}

procedure TForm4.Button2Click(Sender: TObject);
begin
 v_close:=1;
 dm.ADO204.Cancel;
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
try
 form_supp:=tform_supp.Create(application);
 with form_supp.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('SELECT RKEY,CODE,SUPPLIER_NAME,currency_ptr');
   sql.Add('FROM Data0023');
   sql.Add('ORDER BY Data0023.CODE');
   open;
  end;
 FORM_supp.DBGrid1.Columns[2].Visible:=false;
 FORM_supp.DBGrid1.Columns[1].Width :=323;
 form_supp.Edit1.Text := trim(edit1.Text);
 if form_supp.ADOQuery1.IsEmpty then
  begin
   messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
   edit1.SetFocus;
  end
 else
 if form_supp.ShowModal=mrok then
  begin
   edit1.Text := form_supp.ADOQuery1.FieldValues['code'];
   edit1.Font.Color := clwindowtext;
   label3.Caption := form_supp.ADOQuery1.FieldValues['supplier_name'];
   dm.ADO204SUPPLIER_PTR.Value := form_supp.ADOQuery1.FieldValues['rkey'];
   dm.ADO204PO_LINK_PTR.Value := form_supp.ADOQuery1.FieldValues['currency_ptr'];
   dbedit1.SetFocus;     //给供应商及货币赋值
  end
 else
  edit1.SetFocus;
finally
 form_supp.free;
end;
end;

procedure TForm4.Edit1Click(Sender: TObject);
begin
 if edit1.Font.Color=clwindowtext then
  begin
   edit1.Font.Color := clblue;
   edit1.SelectAll;
  end;
end;

procedure TForm4.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'Button2')
   and (trim(edit1.Text)<>'') then
 try
  form_supp:=tform_supp.Create(application);
  with form_supp.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('SELECT RKEY,CODE,SUPPLIER_NAME,currency_ptr');
    sql.Add('FROM Data0023');
    sql.Add('ORDER BY Data0023.CODE');
    open;
   end;
  form_supp.Edit1.Text := trim(edit1.Text);
 if comparetext(trim(edit1.text),trim(form_supp.ADOQuery1.Fieldbyname('code').AsString))=0 then
  begin
   edit1.Text := form_supp.ADOQuery1.FieldValues['code'];
   edit1.Font.Color := clwindowtext;
   label3.Caption := form_supp.ADOQuery1.FieldValues['supplier_name'];
   dm.ADO204SUPPLIER_PTR.Value := form_supp.ADOQuery1.FieldValues['rkey'];
   dm.ADO204PO_LINK_PTR.Value := form_supp.ADOQuery1.FieldValues['currency_ptr'];
  end
 else
  begin
   messagedlg('供应商代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   label3.Caption := '';
   edit1.SetFocus;
  end;
 finally
  form_supp.Free;
 end
else
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'Button2')
   and (trim(edit1.Text)='') then
 begin
  label3.Caption := '';
  dm.ADO204SUPPLIER_PTR.AsVariant := null;
  dm.ADO204PO_LINK_PTR.AsVariant := null;
 end;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
 if trim(dbedit1.Text) = '' then
  begin
   messagedlg('物品名称不能为空!',mtinformation,[mbcancel],0);
   dbedit1.SetFocus;
   exit;
  end;
 if trim(dbedit2.Text) = '' then
  begin
   messagedlg('物品规格不能为空!',mtinformation,[mbcancel],0);
   dbedit2.SetFocus;
   exit;
  end;
 if trim(dbcombobox1.Text) = '' then
  begin
   messagedlg('请购类别不能为空!',mtinformation,[mbcancel],0);
   dbcombobox1.setfocus;
   exit;
  end;

 if dbedit3.Field.Value <= 0 then
  begin
   messagedlg('请输入正确的采购数量!',mtinformation,[mbcancel],0);
   dbedit3.SetFocus;
   exit;
  end;
 if dbedit4.Field.Value < 0 then
  begin
   messagedlg('请输入正确的价格!',mtinformation,[mbcancel],0);
   dbedit4.SetFocus;
   exit;
  end;

 if trim(edit2.Text) = '' then
 begin
  messagedlg('采购单位不能为空',mtinformation,[mbcancel],0);
  edit2.SetFocus;
  exit;
 end;

 if trim(dbedit5.Text) = '' then
  begin
   messagedlg('请输入请购原因!',mtinformation,[mbcancel],0);
   dbedit5.SetFocus;
   exit;
  end;
if dm.ADO204o_i_flag.AsVariant = null then
 begin
   messagedlg('请确定采购地点',mtinformation,[mbcancel],0);
   dbradiogroup1.SetFocus;
   exit;
 end;
//==============================================================================
 dm.ADO204REQ_DATE.AsString := maskedit1.Text;
 dm.ADO204reply_date.AsString := maskedit2.Text;
 v_close:=1;
 ModalResult :=mrok;
end;

procedure TForm4.DBEdit3Exit(Sender: TObject);
begin
 if trim(dbedit3.Text)='' then
  dbedit3.Field.Value :=0;
end;

procedure TForm4.DBEdit4Exit(Sender: TObject);
begin
 if trim(dbedit4.Text)='' then
  dbedit4.Field.Value :=0;
 dm.ADO204UNIT_PRICE.Value:=
    dm.ado204tax_price.value/(1+dm.ADO204tax.Value*0.01);
end;

procedure TForm4.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if v_close<>1 then
 dm.ADO204.Cancel;
end;

procedure TForm4.MaskEdit1Exit(Sender: TObject);
begin
 try
  strtodatetime(maskedit1.Text);
 except
  messagedlg('日期格式输入不正确,请重新输入!',mtwarning,[mbok],0);
  maskedit1.SetFocus;
 end;
end;

procedure TForm4.DBEdit4KeyPress(Sender: TObject; var Key: Char);
begin
 if (key=chr(46)) and (pos('.',(sender as tdbedit).Text)<>0) then abort;
end;

procedure TForm4.FormCreate(Sender: TObject);
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
    dbcombobox1.Items.Add(trim(dm.ADOQuery2.FieldValues['DESCRIPTION']));
    Next;
   end;
 end;
 dm.ADOQuery2.Close;
end;

procedure TForm4.DBComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
 abort;
end;

procedure TForm4.Edit2Click(Sender: TObject);
begin
if edit2.Font.Color = clwindowtext then
 begin
  edit2.Font.Color :=clblue;
  edit2.SelectAll;
 end;
end;

procedure TForm4.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'Button2')
    and (trim(edit2.Text)<>'') then
 try
  form_unit:=tform_unit.Create(application);
  form_unit.Edit1.Text :=trim(edit2.Text);
 if comparetext(trim(edit2.text),trim(form_unit.ADOQuery1.Fieldbyname('unit_code').AsString))=0 then
   begin
    edit2.Text := form_unit.ADOQuery1.FieldValues['unit_code'];
    edit2.Font.Color := clwindowtext;
    label10.Caption := form_unit.ADOQuery1.FieldValues['unit_name'];
    dm.ADO204G_L_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
   end
  else
   begin
    messagedlg('采购单位不正确,请重新输入或选择',mtinformation,[mbok],0);
    label10.Caption := '';
    edit2.SetFocus;
   end;
 finally
  form_unit.free;
 end;

end;

procedure TForm4.BitBtn3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  form_unit:=tform_unit.Create(application);
  form_unit.Edit1.Text :=trim(edit2.Text);
  if form_unit.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找符合条件的记录!',mtwarning,[mbok],0);
    edit2.SetFocus;
   end
  else
  if form_unit.ShowModal=mrok then
   begin
    edit2.Text := form_unit.ADOQuery1.FieldValues['unit_code'];
    edit2.Font.Color := clwindowtext;
    label10.Caption := form_unit.ADOQuery1.FieldValues['unit_name'];
    dm.ADO204G_L_PTR.Value := form_unit.ADOQuery1.FieldValues['rkey'];
    button1.SetFocus;
   end
  else
   edit2.SetFocus;
end;

procedure TForm4.BitBtn3Exit(Sender: TObject);
begin
  form_unit.free;
end;

procedure TForm4.MaskEdit2Exit(Sender: TObject);
begin
 try
  strtodatetime(maskedit2.Text);
 except
  messagedlg('日期格式输入不正确,请重新输入!',mtwarning,[mbok],0);
  maskedit2.SetFocus;
 end;
end;

procedure TForm4.DBEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then dbedit6.SetFocus;
end;

procedure TForm4.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then dbedit5.SetFocus;
end;

procedure TForm4.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then maskedit2.SetFocus;
end;

procedure TForm4.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbedit2.SetFocus;
end;

procedure TForm4.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbcombobox1.SetFocus;
end;

procedure TForm4.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbedit4.SetFocus;
end;

procedure TForm4.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then edit2.SetFocus;
end;

procedure TForm4.DBComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbedit3.SetFocus;
end;

procedure TForm4.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then dbedit1.SetFocus;
end;

procedure TForm4.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then button1.SetFocus;
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
if trim(dm.ADO204DESCRIPTION_1.Value) <> '' then
 begin
form_micprice := tform_micprice.Create(application);
form_micprice.ShowModal;
form_micprice.Free;
end
else
 begin
  messagedlg('请首先确定材料代码',mtinformation,[mbok],0);
  if dbedit1.Enabled=true then dbedit1.SetFocus;
 end;
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
curr_form := tcurr_form.Create(application);
if curr_form.ShowModal=mrok then
 dm.ADO204PO_LINK_PTR.Value := curr_form.ADOQuery1rkey.Value;
curr_form.Free;
end;

procedure TForm4.DBEdit6Exit(Sender: TObject);
begin
 if trim(dbedit6.Text)='' then
  dbedit6.Field.Value :=0;
 dm.ADO204UNIT_PRICE.Value:=
     dm.ado204tax_price.value/(1+dm.ADO204tax.Value*0.01);
end;

procedure TForm4.DBEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then maskedit1.SetFocus;
end;

end.
