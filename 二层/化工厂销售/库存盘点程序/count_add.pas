unit count_add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,math;

type
  TForm_add = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Edit4: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Label7: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    rkey16_1: TLabel;
    rkey16_2: TLabel;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    rkey07_1: TLabel;
    rkey07_2: TLabel;
    Edit8: TEdit;
    Edit5: TEdit;
    Edit2: TEdit;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure new_count();
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    v_date:tdatetime;
    function if_instock():boolean;
    function find_specfgout():boolean;
  public
    { Public declarations }
  end;

var
  Form_add: TForm_add;

implementation

uses main,damo,count_search,count_pro_search;
{$R *.dfm}

procedure TForm_add.BitBtn3Click(Sender: TObject);
begin
 try
  Application.CreateForm(TForm_loc_search, Form_loc_search);
  Form_loc_search.Edit1.Text :=trim(edit2.Text);
  if Form_loc_search.ADOQuery1.IsEmpty then
   begin
   Messagedlg('没有找到相关的记录!',mtinformation,[mbok],0);
   edit2.SetFocus;
  end
else
 if Form_LOC_search.ShowModal=mrok then
  begin
  edit2.Text:=Form_loc_search.adoquery1CODE.AsString;
  Label8.Caption:=Form_loc_search.adoquery1LOCATION.AsString;
  rkey16_1.Caption:=Form_loc_search.adoquery1RKEY.AsString;
  end;
 finally
  Form_loc_search.Free;
 end;
end;
procedure TForm_add.BitBtn4Click(Sender: TObject);
begin
 try
  Application.CreateForm(tForm_loc_search, Form_loc_search);
  Form_loc_search.Edit1.Text := trim(edit3.Text);
  if Form_loc_search.ADOQuery1.IsEmpty then
  begin
   Messagedlg('没有找到相关的记录!',mtinformation,[mbok],0);
    edit3.SetFocus;
  end
else
 if Form_loc_search.ShowModal=mrok then
  begin
  edit3.Text:=Form_loc_search.adoquery1CODE.AsString;
  self.Label9.Caption:=Form_loc_search.adoquery1LOCATION.AsString;
  self.rkey16_2.Caption:=Form_loc_search.adoquery1RKEY.AsString;
 end;
 finally
 Form_loc_search.Free;
 end;
end;
procedure TForm_add.BitBtn2Click(Sender: TObject);
begin
self.Close;
end;

function TForm_add.if_instock():boolean;
begin
   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('select * from Data0492 where ORD_REQ_QTY<>0');
     open;
    if not IsEmpty then
     if_instock:=true
    else
     if_instock:=false;
    end;

end;

function TForm_add.find_specfgout():boolean;
begin
with dm.ADOQuery1 do
 begin
  close;
  SQL.Clear;
  SQL.Text:='select * from wzcp0060 where status in(1,2,5)';
  open;
  if isempty then
   result:=false
  else
   result:=true;
 end;
end;

procedure TForm_add.BitBtn1Click(Sender: TObject);
begin
 if edit1.Enabled=true then //如果新增
  begin
   with dm.ado0214 do
    begin
      append;
      dm.ado0214FG_COUNT_CODE.AsString:=edit1.Text;
      dm.ado0214DATE_CREATED.Value:=v_date;
      dm.ado0214EMPLOYEE_PTR.Value:=form1.rkey05;  //暂时保存为系统用户
      dm.ado0214BEG_LOCCODE_PTR.AsString:=rkey16_1.Caption;
      dm.ado0214END_LOCCODE_PTR.AsString:=rkey16_2.Caption;
      dm.ado0214BEG_CUSTPART_PTR.AsString:=rkey07_1.Caption;
      dm.ado0214END_CUSTPART_PTR.AsString:=rkey07_2.Caption;
      dm.ado0214STATUS.AsInteger:=0;
      post;
    end;
   with dm.adodata0215 do
   begin
     close;
     dm.ADOdata0215.Parameters[0].Value:=dm.ADO0214RKEY.Value;
     open;
    end;
   new_count();
   ModalResult:=mrok;
  end
 else
 //================================如果是编辑盘点 ======================================================
   with dm.ADO0214 do
    begin
      edit;
      dm.ado0214FG_COUNT_CODE.AsString:=edit1.Text;
      dm.ado0214DATE_CREATED.Value:=v_date;
      dm.ado0214BEG_LOCCODE_PTR.AsString:=rkey16_1.Caption;
      dm.ado0214END_LOCCODE_PTR.AsString:=rkey16_2.Caption;
      dm.ado0214BEG_CUSTPART_PTR.AsString:=rkey07_1.Caption;
      dm.ado0214END_CUSTPART_PTR.AsString:=rkey07_2.Caption;
      dm.ado0214STATUS.AsInteger:=0;
     post;
    end;
    with dm.ADOdata0215 do
    begin
     close;
     dm.ADOdata0215.Parameters[0].Value:=dm.ADO0214RKEY.Value;
     open;
    end;
   while not dm.ADOdata0215.Eof do dm.ADOdata0215.Delete;
   new_count();
//   ShowMessage('1');
   ModalResult:=mrok;
end;

procedure TForm_add.new_count();
begin
//  with dm.ADO0215 do
//   begin
//    close;
//    dm.ADO0215.Parameters[0].Value:=min(strtoint(rkey07_1.Caption),strtoint(rkey07_2.Caption));
//    dm.ADO0215.Parameters[1].Value:=max(strtoint(rkey07_1.Caption),strtoint(rkey07_2.Caption));
//    dm.ADO0215.Parameters[2].Value:=min(strtoint(rkey16_1.Caption),strtoint(rkey16_2.Caption));
//    dm.ADO0215.Parameters[3].Value:=max(strtoint(rkey16_1.Caption),strtoint(rkey16_2.Caption));
//    open;
//  end ;

  with dm.ADO0215 do
   begin
    close;
    dm.ADO0215.Parameters[0].Value:=Trim(Edit4.Text);
    dm.ADO0215.Parameters[1].Value:=Trim(Edit6.Text);
    dm.ADO0215.Parameters[2].Value:=Trim(Edit2.Text);
    dm.ADO0215.Parameters[3].Value:=Trim(Edit3.Text);
    open;
  end ;

  if not dm.ADO0215.IsEmpty then dm.ADO0215.First;
   while not dm.ADO0215.Eof do
    begin
     if dm.ADOData0215.Active=false then dm.ADOData0215.Open;
     dm.ADOdata0215.Append;
     dm.ADOdata0215.FieldValues['fg_list_ptr']:=dm.ADO0214RKEY.Value;
     dm.ADOdata0215.FieldValues['WZCP0001_PTR']:=dm.ADO0215.fieldbyname('rkey').AsInteger;
     dm.ADOData0215.FieldByName('old_quantity').AsFloat:=dm.ADO0215.fieldbyname('qty_on_hand').AsFloat;
     dm.ADOData0215.FieldByName('entered_by_ptr').Value:=form1.rkey05; //先默认是系统管理员
     dm.ADOData0215.FieldByName('counted_by_empl_ptr').Value:=form1.rkey05;//先默认是系统管理员
     dm.ADOData0215.FieldByName('status').AsInteger:=0;
     dm.ADOdata0215.Post;
     dm.ado0215.Next;
    end;
end;


procedure TForm_add.BitBtn1Enter(Sender: TObject);
begin
if edit1.Enabled=true then   //新增情况下的盘点
 begin
 if trim(edit1.Text)='' then
  begin
   messagedlg('盘点代码不能为空，请输入正确的盘点代码!',mtinformation,[mbok],0);
   edit1.SetFocus;
   exit;
  end
 else
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select rkey from data0214');
    sql.Add('where FG_COUNT_CODE='''+trim(edit1.Text)+'''');
    open;
    if not isempty then
     begin
      messagedlg('该盘点代码已经存在,请重新输入!',mtinformation,[mbok],0);
      edit1.SetFocus;
      exit;
     end;
   end;
 end ;
 
  if edit2.Text='' then
    begin
      messagedlg('还没有选择盘点仓库，请选择!',mtinformation,[mbok],0);
      edit2.SetFocus;
      exit;
    end;
 if edit3.Text='' then
   begin
      messagedlg('还没有选择盘点仓库，请选择!',mtinformation,[mbok],0);
      edit3.SetFocus;
      exit;
   end;
 if edit4.Text='' then
   begin
      messagedlg('还没有选择产品类型，请选择!',mtinformation,[mbok],0);
      edit4.SetFocus;
      exit;
   end;
  if edit6.Text='' then
   begin
      messagedlg('还没有选择产品类型，请选择!',mtinformation,[mbok],0);
      edit6.SetFocus;
      exit;
   end;

 if  if_instock then
   begin
      messagedlg('成品有已提交未入库审核的记录!',mtError,[mbAbort],0);
      BitBtn2.SetFocus;
      exit;
   end;
  if  find_specfgout then
   begin
      messagedlg('成品有待出库未审核的记录!',mtError,[mbAbort],0);
      BitBtn2.SetFocus;
      exit;
   end;
end;

procedure TForm_add.BitBtn5Click(Sender: TObject);
begin
 try
   form_pro_search:=tform_pro_search.Create(application);
   Form_pro_search.Edit1.Text := trim(edit4.Text);
 if Form_pro_search.ADOQuery1.IsEmpty then
  begin
   Messagedlg('没有找到相关的记录!',mtinformation,[mbok],0);
   edit4.SetFocus;
  end
 else
  if Form_pro_search.ShowModal=mrok then
  begin
  edit4.Text:=Form_pro_search.adoquery1PR_GRP_CODE.AsString;
  edit5.Text:=Form_pro_search.adoquery1PRODUCT_GROUP_NAME.AsString;
  self.rkey07_1.Caption:=Form_pro_search.adoquery1RKEY.AsString;
  end;
 finally
 Form_pro_search.Free;
 end; 
end;

procedure TForm_add.BitBtn6Click(Sender: TObject);
begin
 try
  Application.CreateForm(tForm_pro_search, Form_pro_search);
  Form_pro_search.Edit1.Text := trim(edit6.Text);
  if Form_pro_search.ADOQuery1.IsEmpty then
  begin
   Messagedlg('没有找到相关的记录!',mtinformation,[mbok],0);
    edit6.SetFocus;
  end
else
 if Form_pro_search.ShowModal=mrok then
  begin
  edit6.Text:=Form_pro_search.adoquery1PR_GRP_CODE.AsString;
  edit7.Text:=Form_pro_search.adoquery1PRODUCT_GROUP_NAME.AsString;
  self.rkey07_2.Caption:=Form_pro_search.adoquery1RKEY.AsString;
 end;
 finally
  form_pro_search.Free;
 end;
end;

procedure TForm_add.Edit2Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'BitBtn2') and
   (trim(edit2.Text)<>'') then
 try
  form_loc_search:=tform_loc_search.Create(application);
  form_loc_search.Edit1.Text := trim(edit2.Text);
 if Comparetext(trim(edit2.Text),trim(form_loc_search.ADOQuery1.Fieldbyname('code').AsString))=0 then
  begin
   Label8.Caption:=form_loc_search.adoquery1LOCATION.AsString;
   rkey16_1.Caption:=form_loc_search.adoquery1RKEY.AsString;
  end
 else
  begin
   messagedlg('请输入正确的客户代码!',mtinformation,[mbcancel],0);
   edit2.SetFocus;
  end;
 finally
  form_loc_search.free;
 end
else
 if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'BitBtn2') and
   (trim(edit2.Text)='') then
 begin
  self.Label8.Caption:='';
  rkey16_1.Caption := '0';
 end;
end;

procedure TForm_add.Edit3Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn4') and (activecontrol.Name<>'BitBtn2') and
   (trim(edit3.Text)<>'') then
 try
  form_loc_search:=tform_loc_search.Create(application);
  form_loc_search.Edit1.Text := trim(edit3.Text);
 if Comparetext(trim(edit3.Text),trim(form_loc_search.ADOQuery1.Fieldbyname('code').AsString))=0 then
  begin
   self.Label9.Caption:=form_loc_search.adoquery1LOCATION.AsString;
   self.rkey16_2.Caption:=form_loc_search.adoquery1RKEY.AsString;
  end
 else
  begin
   messagedlg('请输入正确的客户代码!',mtinformation,[mbcancel],0);
   edit3.SetFocus;
  end;
 finally
  form_loc_search.free;
 end
 else
if (activecontrol.Name<>'BitBtn4') and (activecontrol.Name<>'BitBtn2') and
 (trim(edit3.Text)='') then
 begin
  self.Label9.Caption:='';
  rkey16_1.Caption := '0';
 end;
end;

procedure TForm_add.Edit4Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn5') and (activecontrol.Name<>'BitBtn2') and
   (trim(edit4.Text)<>'') then
 try
  form_pro_search:=tform_pro_search.Create(application);
  form_pro_search.Edit1.Text := trim(edit4.Text);
 if Comparetext(trim(edit4.Text),trim(form_pro_search.ADOQuery1.Fieldbyname('PR_GRP_CODE').AsString))=0 then
  begin
  edit5.Text:=form_pro_search.adoquery1PRODUCT_GROUP_NAME.AsString;
  self.rkey07_1.Caption:=form_pro_search.adoquery1RKEY.AsString;
  end
 else
  begin
   messagedlg('请输入正确的客户代码!',mtinformation,[mbcancel],0);
   edit4.SetFocus;
  end;
 finally
  form_pro_search.free;
 end
else
if (activecontrol.Name<>'BitBtn5') and (activecontrol.Name<>'BitBtn2') and
 (trim(edit2.Text)='') then
 begin
 edit5.Text:='';
  rkey07_1.Caption := '0';
 end;
end;

procedure TForm_add.Edit6Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn6') and (activecontrol.Name<>'BitBtn2') and
   (trim(edit6.Text)<>'') then
 try
  form_pro_search:=tform_pro_search.Create(application);
  form_pro_search.Edit1.Text := trim(edit6.Text);
 if Comparetext(trim(edit6.Text),trim(form_pro_search.ADOQuery1.Fieldbyname('PR_GRP_CODE').AsString))=0 then
  begin
  edit7.Text:=form_pro_search.adoquery1PRODUCT_GROUP_NAME.AsString;
  self.rkey07_2.Caption:=form_pro_search.adoquery1RKEY.AsString;
  end
 else
  begin
   messagedlg('请输入正确的客户代码!',mtinformation,[mbcancel],0);
   edit6.SetFocus;
  end;
 finally
  form_pro_search.free;
 end
 else
if (activecontrol.Name<>'BitBtn6') and (activecontrol.Name<>'BitBtn2') and
 (trim(edit6.Text)='') then
 begin
  edit7.Text:='';
  rkey07_2.Caption := '0';
 end;
end;

procedure TForm_add.FormActivate(Sender: TObject);
begin
  with dm.ADOQuery1 do  //读取系统时间
   begin
    active:=false;
    sql.Clear;
    sql.Add('select v_dt = getdate()');
    active:=true;
    v_date := fieldvalues['v_dt'];     //长格式
   end;
end;

end.
