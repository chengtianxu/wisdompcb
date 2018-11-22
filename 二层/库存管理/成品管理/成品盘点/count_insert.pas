unit count_insert;

interface

uses
  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TForm5 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    rkey10: TLabel;
    Label9: TLabel;
    rkey50: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit7: TEdit;
    rkey16: TLabel;
    rkey05: TLabel;
    MaskEdit1: TMaskEdit;
    Label12: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1_Exit();
    procedure Edit2_Exit();
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit4Click(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure Button1Enter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses customer_search, custpart_search, damo, location_search,
  employee_search, phy_counts;

{$R *.dfm}

procedure TForm5.BitBtn1Click(Sender: TObject);
begin
 try
  frmcustsearch:=Tfrmcustsearch.Create(application);
  frmcustsearch.MaskEdit1.Text := trim(edit1.Text);
  if frmcustsearch.ADOQuery1.IsEmpty then
   begin
    Messagedlg('没有找到相关的记录!',mtinformation,[mbok],0);
    edit1.SetFocus;
   end
  else
  if frmcustsearch.ShowModal=mrok then
   begin
   if frmcustsearch.ADOQuery1.FieldValues['rkey']<>strtoint(rkey10.Caption) then
    edit1_exit();
    edit1.Font.Color := clwindowtext;
    edit2.SetFocus;
   end
  else
   edit1.SetFocus;
 finally
  frmcustsearch.free;
 end;

end;

procedure TForm5.Edit1_Exit();
begin
 EDIT1.Text := trim(frmcustsearch.ADOQuery1.FieldValues['cust_code']);
 label9.Caption := frmcustsearch.ADOQuery1.FieldValues['customer_name'];
 rkey10.Caption := frmcustsearch.ADOQuery1.fieldbyname('rkey').AsString;
 edit2.Text :='';
 edit2.Font.Color:= clblue;

 label8.Caption := '';
 rkey50.Caption:='0';
end;

procedure TForm5.Edit1Click(Sender: TObject);
begin
if edit1.Font.Color=clwindowtext then
 begin
  edit1.SelectAll;
  edit1.Font.Color:=clblue;
 end;
end;

procedure TForm5.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'Button2') and
   (trim(edit1.Text)<>'') then
 try
  frmcustsearch:=Tfrmcustsearch.Create(application);
  frmcustsearch.MaskEdit1.Text := trim(edit1.Text);
 if Comparetext(trim(edit1.Text),trim(frmcustsearch.ADOQuery1.Fieldbyname('cust_code').AsString))=0 then
  begin
   if frmcustsearch.ADOQuery1.FieldValues['rkey']<>strtoint(rkey10.Caption) then
    edit1_exit();
    edit1.Font.Color := clwindowtext;
  end
 else
  begin
   messagedlg('请输入正确的客户代码!',mtinformation,[mbcancel],0);
   edit1.SetFocus;
  end;
 finally
  frmcustsearch.free;
 end
else
 if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'Button2') and
 (trim(edit1.Text)='') then
 begin
  label9.Caption := '';
  label8.Caption := '';
  edit2.Text := '';
  rkey10.Caption := '0';
  rkey50.Caption := '0';
 end;
end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
 try
  frmcustpart:=Tfrmcustpart.Create(application);
  if strtoint(rkey10.Caption)<>0 then
   with frmcustpart.ADOQuery1 do
   begin
    active:=false;
    SQL.Insert(sql.Count-1,'and customer_ptr='+rkey10.Caption);
    active:=true;
   end;
  frmcustpart.Edit1.Text := trim(edit2.Text);
  if frmcustpart.ADOQuery1.IsEmpty then
   begin
    Messagedlg('没有找到相关的记录!',mtinformation,[mbok],0);
    edit2.SetFocus;
   end
  else
  if frmcustpart.ShowModal=mrok then
   begin
    if frmcustpart.ADOQuery1.FieldValues['rkey']<>strtoint(rkey50.Caption) then
    Edit2_Exit();
    edit2.Font.Color:=clwindowtext;
    edit4.SetFocus;
   end
  else
   edit2.SetFocus;
 finally
  frmcustpart.free;
 end;
end;

procedure TForm5.Edit2_Exit();
begin
 EDIT2.Text := trim(frmcustpart.ADOQuery1.FieldValues['manu_part_number']);
 label8.Caption := frmcustpart.ADOQuery1.FieldValues['manu_part_desc'];
 rkey50.Caption := frmcustpart.ADOQuery1.Fieldbyname('rkey').AsString;
 if strtoint(rkey10.Caption)=0 then  //如果还没有选择客户
 with dm.ADOQuery1 do
  begin
   if active=true then active:=false;
   sql.Clear;
   sql.Add('select rkey,cust_code,customer_name from data0010');
   sql.Add('where rkey='+frmcustpart.ADOQuery1.fieldbyname('customer_ptr').AsString);
   active:=true;
   EDIT1.Text := trim(FieldValues['cust_code']);
   edit1.Font.Color := clwindowtext;
   label9.Caption := FieldValues['customer_name'];
   rkey10.Caption := fieldbyname('rkey').AsString;
  end;
end;

procedure TForm5.Edit2Click(Sender: TObject);
begin
if edit2.Font.Color=clwindowtext then
 begin
  edit2.SelectAll;
  edit2.Font.Color:=clblue;
 end;
end;

procedure TForm5.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'Button2') AND
   (trim(edit2.Text)<>'') then
 try
  frmcustpart:=Tfrmcustpart.Create(application);
  if strtoint(rkey10.Caption)<>0 then
   with frmcustpart.ADOQuery1 do
   begin
    active:=false;
    SQL.Insert(sql.Count-1,'and customer_ptr='+rkey10.Caption);
    active:=true;
   end;
  frmcustpart.Edit1.Text := trim(edit2.Text);
  if Comparetext(trim(edit2.Text),trim(frmcustpart.ADOQuery1manu_part_number.Value))=0 then
   begin
    if frmcustpart.ADOQuery1.FieldValues['rkey']<>strtoint(rkey50.Caption) then
    Edit2_Exit();
    edit2.Font.Color:=clwindowtext;
   end
  else
   begin
    messagedlg('请输入正确的客户部品!',mtinformation,[mbcancel],0);
    edit2.SetFocus;
   end;
 finally
  frmcustpart.free;
 end
else
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'Button2') AND
   (trim(edit2.Text)='') then
 begin
  rkey50.Caption := '0';
  label8.Caption := '';
 end;
end;

procedure TForm5.BitBtn3Click(Sender: TObject);
begin
 try
  form_lo:=Tform_lo.create(application);
  form_lo.Edit1.Text := trim(edit4.Text);
  if form_lo.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
    edit4.SetFocus;
   end
  else
  if form_lo.ShowModal=mrok then
   begin
    EDIT4.Text := form_lo.ADOQuery1.fieldbyname('code').AsString;
    edit4.Font.Color := clwindowtext;
    label10.Caption :=form_lo.ADOQuery1.fieldbyname('location').AsString;
    rkey16.Caption:=form_lo.ADOQuery1.fieldbyname('rkey').AsString;
    edit7.SetFocus;
   end
  else
   edit4.SetFocus;
 finally
  form_lo.free;
 end;
end;

procedure TForm5.Edit4Click(Sender: TObject);
begin
if edit2.Font.Color=clwindowtext then
 begin
  edit2.SelectAll;
  edit2.Font.Color:=clblue;
 end;
end;

procedure TForm5.Edit4Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'Button2')
   and (trim(edit4.Text)<>'') then
 try
  form_lo:=Tform_lo.Create(application);
  form_lo.Edit1.Text := trim(edit4.Text);
  if comparetext(trim(edit4.text),trim(form_lo.ADOQuery1.Fieldbyname('code').AsString))=0 then
   begin
    EDIT4.Text := form_lo.ADOQuery1.fieldbyname('code').AsString;
    edit4.Font.Color := clwindowtext;
    label10.Caption :=form_lo.ADOQuery1.fieldbyname('location').AsString;
    rkey16.Caption:=form_lo.ADOQuery1.fieldbyname('rkey').AsString;
   end
  else
   begin
    messagedlg('请输入正确的位置代码!',mterror,[mbcancel],0);
    edit4.SetFocus;
   end;
 finally
  form_lo.free;
 end
else
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'Button2')
   and (trim(edit4.Text)='') then
 begin
  label10.Caption:='';
  rkey16.Caption:='0';
 end;
end;

procedure TForm5.Edit6Click(Sender: TObject);
begin
if edit6.Font.Color=clwindowtext then
 begin
  edit6.SelectAll;
  edit6.Font.Color:=clblue;
 end;
end;

procedure TForm5.BitBtn4Click(Sender: TObject);
begin
try
 form_employee:=tform_employee.Create(application);
 form_employee.Edit1.Text:=trim(edit6.Text);
 if form_employee.ADOQuery1.IsEmpty then
  begin
   messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
   edit6.SetFocus;
  end
 else
 if form_employee.ShowModal=mrok then
  begin
   edit6.Text:=form_employee.ADOQuery1.FieldValues['empl_code'];
   edit6.Font.Color:=clwindowtext;
   label11.Caption:=form_employee.ADOQuery1.FieldValues['employee_name'];
   rkey05.Caption:=form_employee.ADOQuery1.fieldbyname('rkey').AsString;
   maskedit1.SetFocus;
  end
 else
  edit6.SetFocus;
finally
 form_employee.free;
end;
end;

procedure TForm5.Edit6Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn4') and (activecontrol.Name<>'Button2')
   and (trim(edit6.Text)<>'') then
 try
  form_employee:=Tform_employee.Create(application);
  form_employee.Edit1.Text := trim(edit6.Text);
  if comparetext(trim(edit6.text),trim(form_employee.ADOQuery1.Fieldbyname('empl_code').AsString))=0 then
   begin
    EDIT6.Text := form_employee.ADOQuery1.fieldbyname('empl_code').AsString;
    edit6.Font.Color := clwindowtext;
    label11.Caption :=form_employee.ADOQuery1.fieldbyname('employee_name').AsString;
    rkey05.Caption:=form_employee.ADOQuery1.fieldbyname('rkey').AsString;
   end
  else
   begin
    messagedlg('请输入正确的位置代码!',mterror,[mbcancel],0);
    edit6.SetFocus;
   end;
 finally
  form_employee.free;
 end
else
if (activecontrol.Name<>'BitBtn4') and (activecontrol.Name<>'Button2')
   and (trim(edit6.Text)='') then
 begin
  label11.Caption:='';
  rkey05.Caption:='0';
 end;
end;

procedure TForm5.Button1Enter(Sender: TObject);
begin
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 if strtoint(rkey50.caption)=0 then
  begin
   messagedlg('请选择正确的客户部件！',mtinformation,[mbok],0);
   edit2.SetFocus;
   exit;
  end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 if strtoint(rkey16.caption)=0 then
  begin
   messagedlg('请选择正确的仓库位置！',mtinformation,[mbok],0);
   edit4.SetFocus;
   exit;
  end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 if strtoint(rkey05.caption)=0 then
  begin
   messagedlg('请选择正确的清点人员！',mtinformation,[mbok],0);
   edit6.SetFocus;
   exit;
  end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 if strtoint(edit5.Text)<=0 then
 if messagedlg('新增部件盘点数量应该大于零!是否继承?',mtconfirmation,[mbyes,mbno],0)=mrno then
  begin
   edit5.SetFocus;
   exit;
  end
 else
  button1click(sender);
end;

procedure TForm5.Button1Click(Sender: TObject);
var
 i:integer;
begin
 for i:=1 to form4.sgrid2.RowCount-2 do
  if (strtoint(form4.sgrid2.Cells[1,i])=strtoint(rkey50.Caption)) and
     (strtoint(form4.sgrid2.Cells[2,i])=strtoint(rkey16.Caption)) then
   begin
    messagedlg('位置'+label10.Caption+'中部件'+trim(edit2.Text)+'已在盘点清单中',
    mtinformation,[mbok],0);
    exit;
   end;
 ModalResult:=mrok;
end;

procedure TForm5.Edit5Exit(Sender: TObject);
begin
 if trim(edit5.Text)='' then edit5.Text := '0';
end;

procedure TForm5.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8]) then  //判断是否输入数字
  abort;
end;

end.
