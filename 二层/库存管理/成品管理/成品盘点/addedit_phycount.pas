unit addedit_phycount;

interface

uses
  SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label6: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Button1: TButton;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    rkey15: TLabel;
    Edit14: TEdit;
    rkey16_1: TLabel;
    rkey16_2: TLabel;
    rkey10_1: TLabel;
    rkey10_2: TLabel;
    rkey50_1: TLabel;
    rkey50_2: TLabel;
    ProgressBar1: TProgressBar;
    Bevel2: TBevel;
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
   v_employee:integer;
   function if_instock():boolean;
   function find_specfgout():boolean;
   function has_noship():Boolean;
   procedure new_count();
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses damo, part_confines, warehouse_search, location_search,common;
{$R *.dfm}

function TForm2.if_instock():boolean;
begin
   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('select data0056.rkey from data0056');
     sql.Add('inner join data0006 on Data0056.WO_PTR = Data0006.RKEY');
     sql.Add('INNER JOIN Data0034 ON Data0056.DEPT_PTR = Data0034.RKEY');
     sql.Add('where data0056.TO_BE_STOCKED<>0');
     open;
    end;
    if not dm.ADOQuery1.IsEmpty then
     if_instock:=true
    else
     if_instock:=false;
end;

function TForm2.has_noship: Boolean;
begin
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   SQL.Text:='select rkey from data0064 where PACKING_SLIP_FLAG=0';
   open;
  end;
//  ShowMessage(IntToStr(dm.ADOQuery1.RecordCount));
  if not dm.ADOQuery1.IsEmpty then
   has_noship:=true
  else
   has_noship:=false;
end;

function TForm2.find_specfgout():boolean;
begin
with dm.ADOQuery1 do
 begin
  close;                //直接入库未审核
  sql.Text:='SELECT rkey FROM Data0416'+#13+
            'WHERE type=1 and status in(0,1,3)';
  open;
  result:=not IsEmpty;

  if not Result then     //特殊出仓未审核
  begin
   close;
   sql.Text:='SELECT rkey FROM Data0053'+#13+
            'WHERE (QTY_ALLOC > 0)';
   open;
   result:=not IsEmpty;
  end;

  if not Result then      //特殊出仓中的退货重检未检视
  begin
    Close;
    SQL.Text := ' select 1 from data0415 where type = 3 and status = 3';
    open;
    Result := not IsEmpty;
  end;
 end;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
 close;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
 try
  form3:=tform3.Create(application);
  if form3.ShowModal=mrok then
   begin
    edit4.Text:=form3.Edit1.Text;
    edit5.Text:=form3.Label9.Caption;
    rkey10_1.Caption:=form3.rkey10.Caption;
    edit9.Text:=form3.Edit4.Text;
    edit10.Text:=form3.Label10.Caption;
    rkey10_2.Caption:=form3.rkey10_2.Caption;
    if form3.RadioGroup1.ItemIndex=1 then
     begin
      edit6.Text:=form3.Edit2.Text;
      edit7.Text:=form3.Label3.Caption;
//      edit8.Text:=form3.Edit3.Text;
      rkey50_1.Caption:=form3.rkey50.Caption;
      edit11.Text:=form3.Edit5.Text;
      edit12.Text:=form3.Label8.Caption;
//      edit13.Text:=form3.Edit6.Text;
      rkey50_2.Caption:=form3.rkey50_2.Caption;
     end
    else
     begin
      edit6.Text:='';
      edit7.Text:='';
 //     edit8.Text:='';
      rkey50_1.Caption:='0';
      edit11.Text:='';
      edit12.Text:='';
//      edit13.Text:='';
      rkey50_2.Caption:='0';
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
   label3.Caption := form_wh.ADOQuery1.FieldValues['abbr_name'];
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
if edit1.Font.Color=clwindowtext then
 begin
  edit1.SelectAll;;
  edit1.Font.Color:=clblue;
 end;
end;

procedure TForm2.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'BitBtn3') AND
   (trim(edit1.Text)<>'') then
 try
  form_wh:=Tform_wh.Create(application);
  form_wh.Edit1.Text := trim(edit1.Text);
  if comparetext(trim(edit1.text),trim(form_wh.ADOQuery1.Fieldbyname('warehouse_code').AsString))=0 then
   begin
    edit1.Text := form_wh.ADOQuery1.FieldValues['warehouse_code'];
    edit1.Font.Color := clwindowtext;
    label3.Caption :=form_wh.ADOQuery1.fieldbyname('abbr_name').AsString;
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
if (activecontrol.Name<>'BitBtn2') and (activecontrol.Name<>'BitBtn3') AND
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
    EDIT2.Text := form_lo.ADOQuery1.fieldbyname('code').AsString;
    edit2.Font.Color := clwindowtext;
    label6.Caption :=form_lo.ADOQuery1.fieldbyname('location').AsString;
    rkey16_1.Caption:=form_lo.ADOQuery1.fieldbyname('rkey').AsString;
    edit3.SetFocus;
   end
  else
   edit2.SetFocus;
 finally
  form_lo.free;
 end;
end;

procedure TForm2.Edit2Click(Sender: TObject);
begin
if edit2.Font.Color=clwindowtext then
 begin
  edit2.SelectAll;
  edit2.Font.Color:=clblue;
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
  if comparetext(trim(edit2.text),trim(form_lo.ADOQuery1.Fieldbyname('code').AsString))=0 then
   begin
    EDIT2.Text := form_lo.ADOQuery1.fieldbyname('code').AsString;
    edit2.Font.Color := clwindowtext;
    label6.Caption :=form_lo.ADOQuery1.fieldbyname('location').AsString;
    rkey16_1.Caption:=form_lo.ADOQuery1.fieldbyname('rkey').AsString;
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
  label6.Caption:='';
  rkey16_1.Caption:='0';
 end;
end;

procedure TForm2.Edit3Click(Sender: TObject);
begin
if edit3.Font.Color=clwindowtext then
 begin
  edit3.SelectAll;
  edit3.Font.Color:=clblue;
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
    label7.Caption := form_lo.ADOQuery1.fieldbyname('location').AsString;
    rkey16_2.Caption := form_lo.ADOQuery1.fieldbyname('rkey').AsString;
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

procedure TForm2.new_count();
begin
 if trim(edit6.Text)='' then //按客户条件过滤
  with dm.aq53 do
   begin
    close;
    sql.Delete(17);
    sql.Delete(16);
    sql.Delete(15);
    sql.Add('');
    sql.Add('and data0010.cust_code>='''+trim(edit4.text)+'''');
    sql.Add('and data0010.cust_code<='''+trim(edit9.text)+'''');
    dm.aq53.Parameters.ParamValues['edit_2']:=trim(edit2.Text);
    dm.aq53.Parameters.ParamValues['edit_3']:=trim(edit3.Text);
    dm.aq53.Parameters.ParamValues['rkey15']:=strtoint(rkey15.Caption);
    open;
   end
 else     //按客户部件范围条件过滤
  with dm.aq53 do
   begin
    close;
    sql.Delete(17);
    sql.Delete(16);
    sql.Delete(15);
    sql.Add('and data0010.rkey='+rkey10_1.Caption);
    sql.Add('and data0025.manu_part_number>='''+trim(edit6.text)+'''');
    sql.Add('and data0025.manu_part_number<='''+trim(edit11.text)+'''');
    dm.aq53.Parameters.ParamValues['edit_2']:=trim(edit2.Text);
    dm.aq53.Parameters.ParamValues['edit_3']:=trim(edit3.Text);
    dm.aq53.Parameters.ParamValues['rkey15']:=strtoint(rkey15.Caption);
    open;
   end;

   while not dm.aq53.Eof do
    begin
     dm.ADO215.Append;
     dm.ADO215.FieldValues['fg_list_ptr']:=dm.ADO214RKEY.Value;
     dm.ADO215.FieldValues['custpart_ptr']:=dm.aq53.FieldValues['cust_part_ptr'];
     dm.ADO215.FieldValues['custpart_batch_ptr']:=dm.aq53.FieldValues['rkey'];
     dm.ADO215.FieldValues['location_ptr']:=dm.aq53.FieldValues['loc_ptr'];
     dm.ADO215old_quantity.Value:=dm.aq53.FieldValues['QTY_ON_HAND'];
     dm.ADO215.Post;
     if dm.aq53.RecNo=dm.aq53.RecordCount then
      progressbar1.Position:=50
     else
      if progressbar1.Position<50 then
       progressbar1.Position:=progressbar1.Position+2;
     dm.aq53.Next;
    end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
 if edit14.Enabled=true then //如果新增
  begin
  if self.find_specfgout then
   messagedlg('成品特殊出仓未完成审核,或退货出仓未检视,或直接入库未审核!',mterror,[mbcancel],0)
  else
   if self.if_instock then
    messagedlg('成品仓有等待过数入仓,但尚未完成审核的成品!',mterror,[mbcancel],0)
  else
   if Self.has_noship then
     MessageDlg('<销售订单装运指派>中存在已指派但未装运的记录',mterror,[mbcancel],0)
  else
   try
   dm.ADOConnection1.BeginTrans;
   with dm.ADO214 do
    begin
     append;
     dm.ADO214FG_COUNT_CODE.Value:=edit14.Text;
     dm.ADO214WAREHOUSE_PTR.AsString:=rkey15.Caption;
     dm.ADO214BEG_LOCCODE_PTR.AsString:=rkey16_1.Caption;
     dm.ADO214END_LOCCODE_PTR.AsString:=rkey16_2.Caption;
     dm.ADO214BEG_CUST_PTR.AsString:=rkey10_1.Caption;
     dm.ADO214END_CUST_PTR.AsString:=rkey10_2.Caption;
     dm.ADO214BEG_CUSTPART_PTR.AsString:=rkey50_1.Caption;
     dm.ADO214END_CUSTPART_PTR.AsString:=rkey50_2.Caption;
     dm.ADO214USER_PTR.AsString:=rkey73;
     dm.ADO214EMPLOYEE_PTR.Value := v_employee;
     dm.ADO214DATE_CREATED.Value := getsystem_date(dm.ADOQuery1,0);
     post;
    end;
   with dm.ADO215 do
    begin
     close;
     dm.ADO215.Parameters[0].Value:=dm.ADO214RKEY.Value;
     open;
    end;
   new_count();
   dm.ADOConnection1.CommitTrans;
   ModalResult:=mrok;
   except
    on E: Exception do
     begin
      dm.ADOConnection1.RollbackTrans;
      showmessage(E.Message);
     end;
   end;
  end
 else //================================如果是编辑盘点
  if messagedlg('原相关盘点清单将会被删除,重新生成盘点清单吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
   with dm.ADO214 do
    begin
     dm.ADO214.Edit;
     dm.ADO214WAREHOUSE_PTR.AsString:=rkey15.Caption;
     dm.ADO214BEG_LOCCODE_PTR.AsString:=rkey16_1.Caption;
     dm.ADO214END_LOCCODE_PTR.AsString:=rkey16_2.Caption;
     dm.ADO214BEG_CUST_PTR.AsString:=rkey10_1.Caption;
     dm.ADO214END_CUST_PTR.AsString:=rkey10_2.Caption;
     dm.ADO214BEG_CUSTPART_PTR.AsString:=rkey50_1.Caption;
     dm.ADO214END_CUSTPART_PTR.AsString:=rkey50_2.Caption;
     dm.ADO214USER_PTR.AsString:=rkey73;
     dm.ADO214EMPLOYEE_PTR.Value := v_employee;
     dm.ADO214DATE_CREATED.Value:= getsystem_date(dm.ADOQuery1,0);
     post;
    end;
   with dm.ADO215 do
    begin
     close;
     dm.ADO215.Parameters[0].Value:=dm.ADO214RKEY.Value;
     open;
    end;
   while not dm.ADO215.Eof do dm.ADO215.Delete;
//=============================================================================
   new_count();
   ModalResult:=mrok;
  end;
end;

procedure TForm2.BitBtn1Enter(Sender: TObject);
begin
if edit14.Enabled=true then   //新增，编辑时不允许编辑盘点代码
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
    sql.Add('select rkey from data0214');
    sql.Add('where FG_COUNT_CODE='''+trim(edit14.Text)+'''');
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
if edit1.Font.Color=clblue then
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
  messagedlg('请设置正确的客户部件范围!',mtinformation,[mbok],0);
  button1.SetFocus;
  exit;
 end;
end;


procedure TForm2.FormActivate(Sender: TObject);
begin
  with dm.ADOQuery1 do
   begin                  //查找系统用户的员工指针
    active:=false;
    sql.Clear;
    sql.Add('select employee_ptr from data0073');
    sql.Add('where rkey='+rkey73);
    active:=true;
    v_employee := fieldvalues['employee_ptr'];
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
