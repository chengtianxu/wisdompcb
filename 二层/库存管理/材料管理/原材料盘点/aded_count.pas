unit aded_count;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    rkey15: TLabel;
    rkey16_1: TLabel;
    rkey16_2: TLabel;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Edit14: TEdit;
    Bevel2: TBevel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    rkey496_1: TLabel;
    rkey496_2: TLabel;
    rkey17_1: TLabel;
    rkey17_2: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Button1: TButton;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    ProgressBar1: TProgressBar;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure new_count();
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses invt_confines, warehouse_search, location_search,
 damo, main,common;

{$R *.dfm}

procedure TForm2.new_count();
begin
 if trim(edit6.Text)='' then  //按材料类别条件过滤
  with dm.aq22 do
   begin
    close;
    sql.Delete(sql.Count-1);
    sql.Delete(sql.Count-1);
    sql.Delete(sql.Count-1);
    sql.Add('');
    sql.Add('and data0496.group_name>='''+edit4.text+'''');
    sql.Add('and data0496.group_name<='''+edit9.text+'''');
    dm.aq22.Parameters.ParamValues['edit_2']:=edit2.Text;
    dm.aq22.Parameters.ParamValues['edit_3']:=edit3.Text;
    dm.aq22.Parameters.ParamValues['rkey15']:=strtoint(rkey15.Caption);
    open;
   end
 else     //按材料范围条件过滤
  with dm.aq22 do
   begin
    close;
    sql.Delete(sql.Count-1);
    sql.Delete(sql.Count-1);
    sql.Delete(sql.Count-1);
    sql.Add('and data0496.rkey='+rkey496_1.Caption);
    sql.Add('and data0017.INV_PART_NUMBER>='''+edit6.text+'''');
    sql.Add('and data0017.inv_part_number<='''+edit11.text+'''');
    dm.aq22.Parameters.ParamValues['edit_2']:=edit2.Text;
    dm.aq22.Parameters.ParamValues['edit_3']:=edit3.Text;
    dm.aq22.Parameters.ParamValues['rkey15']:=strtoint(rkey15.Caption);
    open;
   end;
   while not dm.aq22.Eof do
    begin
     dm.ADO93.Append;
     dm.ADO93PHY_LIST_PTR.Value:=dm.ADO92RKEY.Value;
     dm.ADO93INV_TRAN_PTR.Value:=dm.AQ22RKEY.Value;
     dm.ADO93INVENTORY_PTR.Value:=dm.AQ22INVENTORY_PTR.Value;
     dm.ADO93LOCATION_PTR.Value:=dm.AQ22LOCATION_PTR.Value;
     dm.ADO93OLD_QUANTITY.Value:=dm.AQ22QUAN_ON_HAND.Value;
     dm.ado93.post;
     if dm.aq22.RecNo=dm.aq22.RecordCount then
      progressbar1.Position:=50
     else
      if progressbar1.Position<50 then
       progressbar1.Position:=progressbar1.Position+2;
     dm.aq22.Next;
    end;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
 try
  form3:=tform3.Create(application);
  if form3.ShowModal=mrok then
   begin
    edit4.Text:=form3.Edit1.Text;
    edit5.Text:=form3.Label9.Caption;    //从类别
    rkey496_1.Caption:=form3.rkey496.Caption;
    edit9.Text:=form3.Edit4.Text;
    edit10.Text:=form3.Label10.Caption;  //到类别
    rkey496_2.Caption:=form3.rkey496_2.Caption;
    if form3.RadioGroup1.ItemIndex=1 then
     begin
      edit6.Text:=form3.Edit2.Text;
      edit7.Text:=form3.Label3.Caption;
      rkey17_1.Caption:=form3.rkey17.Caption;
      edit11.Text:=form3.Edit5.Text;
      edit12.Text:=form3.Label8.Caption;
      rkey17_2.Caption:=form3.rkey17_2.Caption;
     end
    else
     begin
      edit6.Text:='';
      edit7.Text:='';
      rkey17_1.Caption:='0';
      edit11.Text:='';
      edit12.Text:='';
      rkey17_2.Caption:='0';
     end;
   end;
 finally
  form3.free;
 end;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
TRY
 form_wh:=tform_wh.Create(application);
 form_wh.Edit1.Text := trim(edit1.Text);
 if form_wh.ADOQuery1.IsEmpty then
  begin
   Messagedlg('没有找到相关的记录!',mtinformation,[mbok],0);
   edit1.SetFocus;
  end
 else
 if form_wh.ShowModal=mrok then
  begin
   edit1.Text := form_wh.ADOQuery1.FieldValues['warehouse_code'];
   edit1.Font.Color := clwindowtext;
   label3.Caption := form_wh.ADOQuery1ABBR_NAME.Value;;
   rkey15.Caption :=form_wh.ADOQuery1.fieldbyname('rkey').AsString;
   edit2.SetFocus;
  end
 else
  edit1.SetFocus;
FINALLY
 form_wh.free;
END;
end;

procedure TForm2.Edit1Click(Sender: TObject);
begin
if (sender as tedit).Font.Color=clwindowtext then
 begin
  (sender as tedit).SelectAll;
  (sender as tedit).Font.Color:=clblue;
 end;
end;

procedure TForm2.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'BitBtn3') AND
   (trim(edit1.Text)<>'') then
 try
  form_wh:=Tform_wh.Create(application);
  form_wh.Edit1.Text := trim(edit1.Text);
  if comparetext(trim(edit1.text),trim(form_wh.ADOQuery1warehouse_code.Value))=0 then
   begin
    edit1.Text := form_wh.ADOQuery1.FieldValues['warehouse_code'];
    edit1.Font.Color := clwindowtext;
    label3.Caption :=form_wh.ADOQuery1.fieldbyname('ABBR_NAME').AsString;
    rkey15.Caption := form_wh.ADOQuery1.fieldbyname('rkey').AsString;
   end
  else
   begin
    messagedlg('请输入正确的仓库代码!',mterror,[mbcancel],0);
    edit1.SetFocus;
   end;
 finally
  form_wh.free;
 end
else
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'Bitbtn3') AND
   (trim(edit1.Text)='') then
 begin
  label3.Caption := '';
  rkey15.Caption := '0';
 end;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
begin
if trim(edit1.Text)='' then
 showmessage('请首先确认工厂')
else
 try
  form_lo:=Tform_lo.create(application);
  form_lo.ADOQuery1.Close;
  form_lo.ADOQuery1.Parameters[0].Value:=rkey15.Caption;
  form_lo.ADOQuery1.Open;

  form_lo.Edit1.Text := trim(edit2.Text);
  if form_lo.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
    edit2.SetFocus;
   end
  else
  if form_lo.ShowModal=mrok then
   begin
    EDIT2.Text := form_lo.ADOQuery1code.Value;
    edit2.Font.Color := clwindowtext;
    label6.Caption :=form_lo.ADOQuery1location.Value;
    rkey16_1.Caption:=form_lo.ADOQuery1.fieldbyname('rkey').AsString;
    edit3.SetFocus;
   end
  else
   edit2.SetFocus;
 finally
  form_lo.free;
 end;
end;

procedure TForm2.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'BitBtn4')
   and (trim(edit2.Text)<>'') then
 try
  form_lo:=Tform_lo.Create(application);
  form_lo.ADOQuery1.Close;
  form_lo.ADOQuery1.Parameters[0].Value:=rkey15.Caption;
  form_lo.ADOQuery1.Open;
  form_lo.Edit1.Text := trim(edit2.Text);
  if comparetext(trim(edit2.text),trim(form_lo.ADOQuery1code.Value))=0 then
   begin
    EDIT2.Text := form_lo.ADOQuery1code.Value;
    edit2.Font.Color := clwindowtext;
    label6.Caption := form_lo.ADOQuery1location.Value;
    rkey16_1.Caption := form_lo.ADOQuery1.fieldbyname('rkey').AsString;
   end
  else
   begin
    messagedlg('请输入正确的位置代码!',mterror,[mbcancel],0);
    edit2.SetFocus;
   end;
 finally
  form_lo.free;
 end
else
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'BitBtn4')
   and (trim(edit2.Text)='') then
 begin
  label6.Caption := '';
  rkey16_1.Caption := '0';
 end;

end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
if trim(edit1.Text)='' then
 showmessage('请首先确认工厂')
else
 try
  form_lo:=Tform_lo.create(application);
  form_lo.ADOQuery1.Close;
  form_lo.ADOQuery1.Parameters[0].Value:=rkey15.Caption;
  form_lo.ADOQuery1.Open;  
  form_lo.Edit1.Text := trim(edit3.Text);
  if form_lo.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
    edit3.SetFocus;
   end
  else
  if form_lo.ShowModal=mrok then
   begin
    EDIT3.Text := form_lo.ADOQuery1.fieldbyname('code').AsString;
    edit3.Font.Color := clwindowtext;
    label7.Caption :=form_lo.ADOQuery1.fieldbyname('location').AsString;
    rkey16_2.Caption:=form_lo.ADOQuery1.fieldbyname('rkey').AsString;
    button1.SetFocus;
   end
  else
   edit3.SetFocus;
 finally
  form_lo.free;
 end;
end;

procedure TForm2.Edit3Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'BitBtn5')
   and (trim(edit3.Text)<>'') then
 try
  form_lo:=Tform_lo.Create(application);
  form_lo.ADOQuery1.Close;
  form_lo.ADOQuery1.Parameters[0].Value:=rkey15.Caption;
  form_lo.ADOQuery1.Open;
  form_lo.Edit1.Text := trim(edit3.Text);
  if comparetext(trim(edit3.text),trim(form_lo.ADOQuery1.Fieldbyname('code').AsString))=0 then
   begin
    EDIT3.Text := form_lo.ADOQuery1.fieldbyname('code').AsString;
    edit3.Font.Color := clwindowtext;
    label7.Caption :=form_lo.ADOQuery1.fieldbyname('location').AsString;
    rkey16_2.Caption:=form_lo.ADOQuery1.fieldbyname('rkey').AsString;
   end
  else
   begin
    messagedlg('请输入正确的位置代码!',mterror,[mbcancel],0);
    edit3.SetFocus;
   end;
 finally
  form_lo.free;
 end
else
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'BitBtn5')
   and (trim(edit3.Text)='') then
 begin
  label7.Caption:='';
  rkey16_2.Caption:='0';
 end;

end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
begin
if edit14.Enabled=true then
 begin
 if trim(edit14.Text)='' then
  begin
   messagedlg('请输入正确的盘点代码!',mtinformation,[mbok],0);
   edit14.SetFocus;
   exit;
  end
 else
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select rkey from data0092');
    sql.Add('where PHY_COUNT_NO='''+edit14.Text+'''');
    open;
    if not isempty then
     begin
      messagedlg('不允许盘点代码已经重复,请重新输入!',mtinformation,[mbok],0);
      edit14.SetFocus;
      exit;
     end;
   end;
 end;
//==============================================================================
if trim(edit1.text)='' then
 begin
  messagedlg('请输入正确的盘点工厂!',mtinformation,[mbok],0);
  edit1.SetFocus;
  exit;
 end;
if trim(edit2.text)='' then
 begin
  messagedlg('请输入正确的开始位置范围!',mtinformation,[mbok],0);
  edit2.SetFocus;
  exit;
 end;
if trim(edit3.text)='' then
 begin
  messagedlg('请输入正确的结束位置范围!',mtinformation,[mbok],0);
  edit3.SetFocus;
  exit;
 end;
if trim(edit4.text)='' then
 begin
  messagedlg('请设置正确的原材料范围!',mtinformation,[mbok],0);
  button1.SetFocus;
  exit;
 end;

end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select rkey from data0022');
    sql.Add('where quan_in_insp > 0');
    open;
    if not isempty then
     begin
      messagedlg('材料有出库到IQC检查,但尚未有效检查通过请,不能盘点!',mtinformation,[mbok],0);
      edit14.SetFocus;
      exit;
     end;
   end;

  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select GRN_NUMBER from data0456');
    sql.Add('where STATUS in(1,6)');
    open;
    if not isempty then
     begin
      messagedlg('材料入库单有未提交或被退回状态,不能盘点!'+fieldbyname('GRN_NUMBER').AsString,mtError,[mbCancel],0);
      edit14.SetFocus;
      exit;
     end;
   end;

if edit14.Enabled=true then //新增状态
 begin
  with dm.ADO92 do
   begin
    append;
    dm.ADO92PHY_COUNT_NO.Value:=edit14.Text;
    dm.ADO92WHOUSE_PTR.AsString:=rkey15.Caption;
    dm.ADO92BEG_CYCLE_ptr.AsString:=rkey496_1.Caption;
    dm.ADO92END_CYCLE_ptr.AsString:=rkey496_2.Caption;
    dm.ADO92BEG_LOC_PTR.AsString:=rkey16_1.Caption;
    dm.ADO92END_LOC_PTR.AsString:=rkey16_2.Caption;
    dm.ADO92BEG_INVT_PTR.AsString:=rkey17_1.Caption;
    dm.ADO92END_INVT_PTR.AsString:=rkey17_2.Caption;
    dm.ADO92USER_PTR.AsString:=common.rkey73;
    dm.ADO92EMPLOYEE_PTR.Value := StrToInt(common.user_ptr);
    dm.ADO92TDATE.Value := common.getsystem_date(dm.ADOQuery1,0);      //长日期格式
    dm.ADO92STATUS.Value := '0';
    post;
   end;
   with dm.ADO93 do
    begin
     close;
     dm.ADO93.Parameters[0].Value:=dm.ADO92RKEY.Value;
     open;
    end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   new_count();
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   ModalResult:=mrok;
 end
else
  if messagedlg('原相关盘点清单将会被删除,重新生成盘点清单吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
   with dm.ADO92 do
    begin
     Edit;
     dm.ADO92WHOUSE_PTR.AsString:=rkey15.Caption;
     dm.ADO92BEG_CYCLE_ptr.AsString:=rkey496_1.Caption;
     dm.ADO92END_CYCLE_ptr.AsString:=rkey496_2.Caption;
     dm.ADO92BEG_LOC_PTR.AsString:=rkey16_1.Caption;
     dm.ADO92END_LOC_PTR.AsString:=rkey16_2.Caption;
     dm.ADO92BEG_INVT_PTR.AsString:=rkey17_1.Caption;
     dm.ADO92END_INVT_PTR.AsString:=rkey17_2.Caption;
     dm.ADO92USER_PTR.AsString:=rkey73;
     dm.ADO92EMPLOYEE_PTR.Value := StrToInt(common.user_ptr);
     dm.ADO92TDATE.Value := common.getsystem_date(dm.ADOQuery1,0);
     post;
    end;
   with dm.ADO93 do
    begin
     close;
     dm.ADO93.Parameters[0].Value:=dm.ADO92RKEY.Value;
     open;
    end;
   bitbtn1.Cursor:=crsqlwait;
   while not dm.ADO93.Eof do dm.ADO93.Delete;
//==============================================================================
   new_count();
   bitbtn1.Cursor:=crdefault;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   ModalResult:=mrok;
  end;

end;

procedure TForm2.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit1.Text)='' then
 begin
  edit2.Text:='';
  messagedlg('请首先输入盘点工厂信息!',mterror,[mbcancel],0);
  edit1.SetFocus;
 end
end;

procedure TForm2.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit1.Text)='' then
 begin
  edit3.Text:='';
  messagedlg('请首先输入盘点工厂信息!',mterror,[mbcancel],0);
  edit1.SetFocus;
 end
end;

end.
