unit part_confines;

interface

uses
  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Label8: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    rkey10: TLabel;
    rkey10_2: TLabel;
    rkey50: TLabel;
    rkey50_2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1_Exit();
    procedure Edit2_Exit();
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit4Click(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit5Click(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Button1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses customer_search, custpart_search, damo;

{$R *.dfm}

procedure TForm3.RadioGroup1Click(Sender: TObject);
begin
 if radiogroup1.ItemIndex=0 then
  begin
   label2.Visible:=false;
   label3.Visible:=false;
//   label4.Visible:=false;
   label6.Visible:=false;
//   label7.Visible:=false;
   label8.Visible:=false;
   edit2.Visible:=false;
//  edit3.Visible:=false;
   edit5.Visible:=false;
//   edit6.Visible:=false;
   bitbtn2.Visible:=false;
   bitbtn4.Visible:=false;
   edit4.Enabled:=true;
   bitbtn3.Enabled:=true;
  end
 else
  begin
   label2.Visible:=true;
   label3.Visible:=true;
//   label4.Visible:=true;
   label6.Visible:=true;
//   label7.Visible:=true;
   label8.Visible:=true;
   edit2.Visible:=true;
//   edit3.Visible:=true;
   edit5.Visible:=true;
 //  edit6.Visible:=true;
   bitbtn2.Visible:=true;
   bitbtn4.Visible:=true;
   edit4.Enabled:=false;
   bitbtn3.Enabled:=false;
   if trim(edit1.Text)<>''  then
    begin
     edit4.Text:=edit1.Text;
     edit4.Font.Color:=clwindowtext;
     label10.Caption:=label9.Caption;
     rkey10_2.Caption:=rkey10.Caption;
    end;
  end;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
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
    if radiogroup1.ItemIndex=1 then
     edit2.SetFocus
    else
     edit4.SetFocus;
   end
  else
   edit1.SetFocus;
 finally
  frmcustsearch.free;
 end;
end;

procedure TForm3.Edit1_Exit();
begin
 EDIT1.Text := trim(frmcustsearch.ADOQuery1.FieldValues['cust_code']);
 label9.Caption := frmcustsearch.ADOQuery1.FieldValues['customer_name'];
 rkey10.Caption := frmcustsearch.ADOQuery1.fieldbyname('rkey').AsString;
 edit2.Text :='';
 edit2.Font.Color:= clblue;
 label3.Caption := '';
 edit4.Text:=edit1.Text;
 label10.Caption:=label9.Caption;
 rkey10_2.Caption := frmcustsearch.ADOQuery1.fieldbyname('rkey').AsString;
end;


procedure TForm3.Edit1Click(Sender: TObject);
begin
if edit1.Font.Color=clwindowtext then
 begin
  edit1.SelectAll;
  edit1.Font.Color:=clblue;
 end;
end;

procedure TForm3.Edit1Exit(Sender: TObject);
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
  label3.Caption := '';
  edit2.Text := '';
  rkey10.Caption := '0';
 end;
end;

procedure TForm3.BitBtn3Click(Sender: TObject);
begin
 try
  frmcustsearch:=Tfrmcustsearch.Create(application);
  frmcustsearch.MaskEdit1.Text := trim(edit4.Text);
  if frmcustsearch.ADOQuery1.IsEmpty then
   begin
    Messagedlg('没有找到相关的记录!',mtinformation,[mbok],0);
    edit4.SetFocus;
   end
  else
  if frmcustsearch.ShowModal=mrok then
   begin
    edit4.Text:=frmcustsearch.ADOQuery1.FieldValues['cust_code'];
    edit4.Font.Color := clwindowtext;
    label10.Caption:=frmcustsearch.ADOQuery1.FieldValues['customer_name'];
    rkey10_2.Caption:=frmcustsearch.ADOQuery1.fieldbyname('rkey').AsString;
    if radiogroup1.ItemIndex=1 then
     edit5.SetFocus
    else
     button1.SetFocus;
   end
  else
   edit4.SetFocus;
 finally
  frmcustsearch.free;
 end;
end;

procedure TForm3.Edit4Click(Sender: TObject);
begin
if edit4.Font.Color=clwindowtext then
 begin
  edit4.SelectAll;
  edit4.Font.Color:=clblue;
 end;
end;

procedure TForm3.Edit4Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'Button2') and
   (trim(edit4.Text)<>'') then
 try
  frmcustsearch:=Tfrmcustsearch.Create(application);
  frmcustsearch.MaskEdit1.Text := trim(edit4.Text);
 if Comparetext(trim(edit4.Text),trim(frmcustsearch.ADOQuery1.Fieldbyname('cust_code').AsString))=0 then
  begin
    edit4.Text:=frmcustsearch.ADOQuery1.FieldValues['cust_code'];
    edit4.Font.Color := clwindowtext;
    label10.Caption:=frmcustsearch.ADOQuery1.FieldValues['customer_name'];
    rkey10_2.Caption:=frmcustsearch.ADOQuery1.fieldbyname('rkey').AsString;
  end
 else
  begin
   messagedlg('请输入正确的客户代码!',mtinformation,[mbcancel],0);
   edit4.SetFocus;
  end;
 finally
  frmcustsearch.free;
 end
else
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'Button2') and
 (trim(edit4.Text)='') then
 begin
  label10.Caption := '';
  rkey10_2.Caption := '0';
 end;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
 try
  frmcustpart:=Tfrmcustpart.Create(application);
  if strtoint(rkey10.Caption)<>0 then
   with frmcustpart.ADOQuery1 do
   begin
    active:=false;
    SQL.Insert(sql.count-1,'and customer_ptr='+rkey10.Caption);
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
    edit5.SetFocus;
   end
  else
   edit2.SetFocus;
 finally
  frmcustpart.free;
 end;
end;

procedure TForm3.Edit2_Exit();
begin
 EDIT2.Text := trim(frmcustpart.ADOQuery1manu_part_number.Value);
 label3.Caption := frmcustpart.ADOQuery1manu_part_desc.Value;
 rkey50.Caption := frmcustpart.ADOQuery1.Fieldbyname('rkey').AsString;
 edit5.Enabled:=true;
 bitbtn4.Enabled:=true;
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
   label10.Caption:= label9.Caption;
   edit4.Text:=edit1.Text;
   edit4.Font.Color:=clwindowtext;
   rkey10_2.Caption:=rkey10.Caption;
  end;
end;

procedure TForm3.Edit2Click(Sender: TObject);
begin
if edit2.Font.Color=clwindowtext then
 begin
  edit2.SelectAll;
  edit2.Font.Color:=clblue;
 end;
end;

procedure TForm3.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'Button2') AND
   (trim(edit2.Text)<>'') then
 try
  frmcustpart:=Tfrmcustpart.Create(application);
  if strtoint(rkey10.Caption)<>0 then
   with frmcustpart.ADOQuery1 do
   begin
    active:=false;
    SQL.Insert(sql.count-1,'and customer_ptr='+rkey10.Caption);
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
  label3.Caption := '';
  edit5.Enabled:=false;
  bitbtn4.Enabled:=false;
  edit5.Text:='';
  label8.Caption:='';
  rkey50_2.Caption:='0';
 end;
end;

procedure TForm3.BitBtn4Click(Sender: TObject);
begin
 try
  frmcustpart:=Tfrmcustpart.Create(application);
  with frmcustpart.ADOQuery1 do
   begin
    active:=false;
    SQL.Insert(sql.count-1,'and customer_ptr='+rkey10.Caption);
    active:=true;
   end;
  frmcustpart.Edit1.Text := trim(edit5.Text);
  if frmcustpart.ADOQuery1.IsEmpty then
   begin
    Messagedlg('没有找到相关的记录!',mtinformation,[mbok],0);
    edit5.SetFocus;
   end
  else
  if frmcustpart.ShowModal=mrok then
   begin
    edit5.Text:=frmcustpart.ADOQuery1manu_part_number.Value;
    edit5.Font.Color:=clwindowtext;
    label8.Caption:=frmcustpart.ADOQuery1manu_part_desc.Value;
    rkey50_2.Caption:=frmcustpart.ADOQuery1.Fieldbyname('rkey').AsString;
    button1.SetFocus;
   end
  else
   edit5.SetFocus;
 finally
  frmcustpart.free;
 end;
end;

procedure TForm3.Edit5Click(Sender: TObject);
begin
if edit5.Font.Color=clwindowtext then
 begin
  edit5.SelectAll;
  edit5.Font.Color:=clblue;
 end;
end;

procedure TForm3.Edit5Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn4') and (activecontrol.Name<>'Button2') AND
   (trim(edit5.Text)<>'') then
 try
  frmcustpart:=Tfrmcustpart.Create(application);
   with frmcustpart.ADOQuery1 do
   begin
    active:=false;
    SQL.Insert(sql.count-1,'and customer_ptr='+rkey10.Caption);
    active:=true;
   end;
  frmcustpart.Edit1.Text := trim(edit5.Text);
  if Comparetext(trim(edit5.Text),trim(frmcustpart.ADOQuery1manu_part_number.Value))=0 then
   begin
    edit5.Text:=frmcustpart.ADOQuery1manu_part_number.Value;
    edit5.Font.Color:=clwindowtext;
    label8.Caption:=frmcustpart.ADOQuery1manu_part_desc.Value;
    rkey50_2.Caption:=frmcustpart.ADOQuery1.Fieldbyname('rkey').AsString;
   end
  else
   begin
    messagedlg('请输入正确的客户部品!',mtinformation,[mbcancel],0);
    edit5.SetFocus;
   end;
 finally
  frmcustpart.free;
 end
else
if (activecontrol.Name<>'BitBtn4') and (activecontrol.Name<>'Button2') AND
   (trim(edit5.Text)='') then
 begin
  rkey50_2.Caption := '0';
  label8.Caption := '';
 end;
end;

procedure TForm3.Button1Enter(Sender: TObject);
begin
 if radiogroup1.ItemIndex=0 then
  begin
   if trim(edit1.Text)='' then
    begin
     messagedlg('请选择正确的开始客户！',mtinformation,[mbok],0);
     edit1.SetFocus;
    end
   else
   if trim(edit4.Text)='' then
    begin
     messagedlg('请选择正确的结束客户！',mtinformation,[mbok],0);
     edit4.SetFocus;
    end
  end
 else
  begin
   if trim(edit2.Text)='' then
    begin
     messagedlg('请选择正确的开始客户部件！',mtinformation,[mbok],0);
     edit2.SetFocus;
    end
   else
   if trim(edit5.Text)='' then
    begin
     messagedlg('请选择正确的结束客户部件！',mtinformation,[mbok],0);
     edit5.SetFocus;
    end
  end;
end;

end.
