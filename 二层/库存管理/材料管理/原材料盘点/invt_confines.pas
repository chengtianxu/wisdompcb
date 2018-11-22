unit invt_confines;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls;

type
  TForm3 = class(TForm)
    Bevel2: TBevel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    rkey496: TLabel;
    rkey496_2: TLabel;
    rkey17: TLabel;
    rkey17_2: TLabel;
    Button1: TButton;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit4: TEdit;
    Edit5: TEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1_Exit();
    procedure Edit2_Exit();
    procedure Edit1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
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

uses invtype_search, inv_serach,damo;

{$R *.dfm}

procedure TForm3.RadioGroup1Click(Sender: TObject);
begin
 if radiogroup1.ItemIndex=0 then //按类型
  begin
   label2.Visible:=false;
   label3.Visible:=false;
   label6.Visible:=false;
   label8.Visible:=false;
   edit2.Visible:=false;
   edit5.Visible:=false;
   bitbtn2.Visible:=false;
   bitbtn4.Visible:=false;
   edit4.Enabled:=true;
   bitbtn3.Enabled:=true;
  end
 else                            //按材料
  begin
   label2.Visible:=true;
   label3.Visible:=true;
   label6.Visible:=true;
   bitbtn4.Visible:=true;
   label8.Visible:=true;
   edit5.Visible:=true;
   edit2.Visible:=true;
   bitbtn2.Visible:=true;
   edit4.Enabled:=false;
   bitbtn3.Enabled:=false;
   if trim(edit1.Text)<>''  then
    begin
     edit4.Text:=edit1.Text;
     edit4.Font.Color:=clwindowtext;
     label10.Caption:=label9.Caption;
     rkey496_2.Caption:=rkey496.Caption;
    end;
  end;

end;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
try
 form_invtype:=tform_invtype.Create(application);
 form_invtype.Edit1.Text:=trim(edit1.Text);
 if form_invtype.ADOQuery1.IsEmpty then
  begin
    Messagedlg('没有找到相关的记录!',mtinformation,[mbok],0);
    edit1.SetFocus;
  end
 else
  if form_invtype.ShowModal=mrok then
   begin
    if strtoint(rkey496.Caption)<>form_invtype.ADOQuery1RKEY.Value then
     edit1_exit();
    if radiogroup1.ItemIndex=1 then
     edit2.SetFocus
    else
     edit4.SetFocus;
   end
  else
   edit1.SetFocus;
finally
 form_invtype.free;
end;
end;

procedure TForm3.Edit1_Exit();
begin
    edit1.Text:=form_invtype.ADOQuery1GROUP_NAME.Value;
    edit1.Font.Color:=clwindowtext;
    label9.Caption:=form_invtype.ADOQuery1GROUP_DESC.Value;
    rkey496.Caption:=form_invtype.ADOQuery1RKEY.AsString;
    edit2.Text:='';
    edit2.Font.Color:=clblue;
    label3.Caption:='';
    edit4.Text:=edit1.Text;
    label10.Caption:=label9.Caption;
    rkey496_2.Caption:=rkey496.Caption;
end;

procedure TForm3.Edit1Click(Sender: TObject);
begin
if (sender as tedit).Font.Color=clwindowtext then
 begin
  (sender as tedit).SelectAll;
  (sender as tedit).Font.Color:=clblue;
 end;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
try
 form_inv:=tform_inv.Create(application);
 if strtoint(rkey496.Caption)<>0 then
  with form_inv.ADOQuery1 do
   begin
    close;
    sql.Insert(11,'and data0017.GROUP_PTR='+rkey496.caption+'');
    open;
   end;
  form_inv.Edit1.Text:=trim(edit2.Text);
  if form_inv.ADOQuery1.IsEmpty then
   begin
    Messagedlg('没有找到相关的记录!',mtinformation,[mbok],0);
    edit2.SetFocus;
   end
  else
   if form_inv.ShowModal=mrok then
    begin
     if strtoint(rkey17.Caption)<>form_inv.ADOQuery1RKEY.Value then
      Edit2_Exit();
     edit5.SetFocus;
    end
   else
    edit2.SetFocus;
finally
 form_inv.free;
end;
end;

procedure TForm3.Edit2_Exit();
begin
 edit2.Text:=form_inv.ADOQuery1INV_PART_NUMBER.Value;
 edit2.Font.Color:=clwindowtext;
 label3.Caption:=form_inv.ADOQuery1INV_PART_DESCRIPTION.Value;
 rkey17.Caption:=form_inv.ADOQuery1RKEY.AsString;
 edit5.Enabled:=true;
 bitbtn4.Enabled:=true;
 if strtoint(rkey496.Caption)=0 then
// with dm.ADOQuery1 do
  begin
{   close;
   sql.Clear;
   sql.Add('select group_name,group_desc from data0496');
   sql.Add('where rkey='+form_inv.ADOQuery1GROUP_PTR.AsString+'');
   open;}
   rkey496.Caption:=form_inv.ADOQuery1GROUP_PTR.AsString;
   //edit1.Text:=fieldvalues['group_name'];
   edit1.Text:=form_inv.ADOQuery1group_name.Value;
   edit1.Font.Color:=clwindowtext;
//   label9.Caption:=fieldvalues['group_desc'];
   label9.Caption:=form_inv.ADOQuery1group_desc.Value;
   edit4.Text:=edit1.Text;
   edit4.Font.Color:=clwindowtext;
   label10.Caption:=label9.Caption;
   rkey496_2.Caption:=rkey496.Caption;
  end;
end;

procedure TForm3.BitBtn3Click(Sender: TObject);
begin

 try
  form_invtype:=tform_invtype.Create(application);
  form_invtype.Edit1.Text:=trim(edit4.Text);
  if form_invtype.ADOQuery1.IsEmpty then
   begin
    Messagedlg('没有找到相关的记录!',mtinformation,[mbok],0);
    edit4.SetFocus;
   end
  else
   if form_invtype.ShowModal=mrok then
    begin
     edit4.Text:=form_invtype.ADOQuery1GROUP_NAME.Value;
     edit4.Font.Color:=clwindowtext;
     label10.Caption:=form_invtype.ADOQuery1GROUP_DESC.Value;
     rkey496_2.Caption:=form_invtype.ADOQuery1RKEY.AsString;
     if radiogroup1.ItemIndex=1 then
      edit5.SetFocus
     else
      button1.SetFocus;
    end
   else
    edit4.SetFocus;
 finally
  form_invtype.Free;
 end;

end;

procedure TForm3.BitBtn4Click(Sender: TObject);
begin
try
 form_inv:=tform_inv.Create(application);
  with form_inv.ADOQuery1 do
   begin
    close;
    sql.Insert(11,'and data0017.GROUP_PTR='+rkey496.caption+'');
    open;
   end;
  form_inv.Edit1.Text:=trim(edit5.Text);
  if form_inv.ADOQuery1.IsEmpty then
   begin
    Messagedlg('没有找到相关的记录!',mtinformation,[mbok],0);
    edit5.SetFocus;
   end
  else
   if form_inv.ShowModal=mrok then
    begin
     edit5.Text:=form_inv.ADOQuery1INV_PART_NUMBER.Value;
     edit5.Font.Color:=clwindowtext;
     label8.Caption:=form_inv.ADOQuery1INV_PART_DESCRIPTION.Value;
     rkey17_2.Caption:=form_inv.ADOQuery1RKEY.AsString;
     button1.SetFocus;
    end
   else
    edit5.SetFocus;
finally
 form_inv.free;
end;
end;

procedure TForm3.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'Button2') and
   (trim(edit1.Text)<>'') then
try
 form_invtype:=tform_invtype.Create(application);
 form_invtype.Edit1.Text:=trim(edit1.Text);
 if Comparetext(trim(edit1.Text),trim(form_invtype.ADOQuery1GROUP_NAME.Value))=0 then
   begin
    if strtoint(rkey496.Caption)<>form_invtype.ADOQuery1RKEY.Value then
     edit1_exit()             //上面如果输入的是新的类别
    else
     edit1.Font.Color:=clwindowtext;
   end
  else
   begin
    messagedlg('请输入正确的材料类别!',mtinformation,[mbcancel],0);
    edit1.SetFocus;
   end;
finally
 form_invtype.free;
end
else
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'Button2') and
 (trim(edit1.Text)='') then
 begin
  label9.Caption := '';
  label3.Caption := '';
  edit2.Text := '';
  rkey496.Caption := '0';
 end;

end;

procedure TForm3.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'Button2') AND
   (trim(edit2.Text)<>'') then
try
 form_inv:=tform_inv.Create(application);
 if strtoint(rkey496.Caption)<>0 then
  with form_inv.ADOQuery1 do
   begin
    close;
    sql.Insert(11,'and data0017.GROUP_PTR='+rkey496.caption+'');
    open;
   end;
  form_inv.Edit1.Text:=trim(edit2.Text);
 if Comparetext(trim(edit2.Text),trim(form_inv.ADOQuery1INV_PART_NUMBER.Value))=0 then
  begin
   if strtoint(rkey17.Caption)<>form_inv.ADOQuery1RKEY.Value then
    Edit2_Exit()
   else
    edit2.Font.Color:=clwindowtext;
  end
 else
  begin
   messagedlg('请输入正确的原材料代码!',mtinformation,[mbcancel],0);
   edit2.SetFocus;
  end;
finally
 form_inv.free;
end
else
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'Button2') AND
   (trim(edit2.Text)='') then
 begin
  rkey17.Caption := '0';
  label3.Caption := '';
  edit5.Enabled:=false;
  bitbtn4.Enabled:=false;
  edit5.Text:='';
  label8.Caption:='';
  rkey17_2.Caption:='0';
 end;

end;

procedure TForm3.Edit4Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'Button2') and
   (trim(edit4.Text)<>'') then
 try
  form_invtype:=tform_invtype.Create(application);
  form_invtype.Edit1.Text:=trim(edit4.Text);
 if Comparetext(trim(edit4.Text),trim(form_invtype.ADOQuery1GROUP_NAME.Value))=0 then
  begin
   edit4.Text:=form_invtype.ADOQuery1GROUP_NAME.Value;
   edit4.Font.Color:=clwindowtext;
   label10.Caption:=form_invtype.ADOQuery1GROUP_DESC.Value;
   rkey496_2.Caption:=form_invtype.ADOQuery1RKEY.AsString;
  end
 else
  begin
   messagedlg('请输入正确的材料类别!',mtinformation,[mbcancel],0);
   edit4.SetFocus;
  end;
 finally
  form_invtype.Free;
 end
else
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'Button2') and
 (trim(edit4.Text)='') then
 begin
  label10.Caption := '';
  rkey496_2.Caption := '0';
 end;
end;

procedure TForm3.Edit5Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn4') and (activecontrol.Name<>'Button2') AND
   (trim(edit5.Text)<>'') then
try
 form_inv:=tform_inv.Create(application);
  with form_inv.ADOQuery1 do
   begin
    close;
    sql.Insert(11,'and data0017.GROUP_PTR='+rkey496.caption+'');
    open;
   end;
  form_inv.Edit1.Text:=trim(edit5.Text);
 if Comparetext(trim(edit5.Text),trim(form_inv.ADOQuery1INV_PART_NUMBER.Value))=0 then
  begin
   edit5.Text:=form_inv.ADOQuery1INV_PART_NUMBER.Value;
   edit5.Font.Color:=clwindowtext;
   label8.Caption:=form_inv.ADOQuery1INV_PART_DESCRIPTION.Value;
   rkey17_2.Caption:=form_inv.ADOQuery1RKEY.AsString;
  end
else
 begin
  messagedlg('请输入正确的原材料代码!',mtinformation,[mbcancel],0);
  edit5.SetFocus;
 end;
finally
 form_inv.free;
end
else
if (activecontrol.Name<>'BitBtn4') and (activecontrol.Name<>'Button2') AND
   (trim(edit5.Text)='') then
 begin
  rkey17_2.Caption := '0';
  label8.Caption := '';
 end;
end;

procedure TForm3.Button1Enter(Sender: TObject);
begin
 if radiogroup1.ItemIndex=0 then
  begin
   if trim(edit1.Text)='' then
    begin
     messagedlg('请选择正确的开始类别！',mtinformation,[mbok],0);
     edit1.SetFocus;
    end
   else
   if trim(edit4.Text)='' then
    begin
     messagedlg('请选择正确的结束类别！',mtinformation,[mbok],0);
     edit4.SetFocus;
    end
  end
 else
  begin
   if trim(edit2.Text)='' then
    begin
     messagedlg('请选择正确的开始原材料！',mtinformation,[mbok],0);
     edit2.SetFocus;
    end
   else
   if trim(edit5.Text)='' then
    begin
     messagedlg('请选择正确的结束原材料！',mtinformation,[mbok],0);
     edit5.SetFocus;
    end
  end;

end;

end.
