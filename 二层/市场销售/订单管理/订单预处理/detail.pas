unit detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrlsEh, Mask, DBCtrls;

type
  TForm_Detail = class(TForm)
    Panel1: TPanel;
    BtnClose: TBitBtn;
    BtnSave: TBitBtn;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    Edit4: TEdit;
    Label12: TLabel;
    BitBtn3: TBitBtn;
    Label71: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    DBDateTimeEditEh3: TDBDateTimeEditEh;
    Edit2: TEdit;
    Edit3: TEdit;
    ComboBox3: TComboBox;
    Label57: TLabel;
    RadioGroup1: TRadioGroup;
    Label9: TLabel;
    Edit5: TEdit;
    Label11: TLabel;
    Edit7: TEdit;
    Label14: TLabel;
    Label10: TLabel;
    Edit6: TEdit;
    BitBtn1: TBitBtn;
    Label15: TLabel;
    Lab_rkey01: TLabel;
    lab_rkey10: TLabel;
    Label34: TLabel;
    lab_rkey50: TLabel;
    Label35: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Label16: TLabel;
    Edit11: TEdit;
    BitBtn2: TBitBtn;
    Label17: TLabel;
    Edit12: TEdit;
    Label19: TLabel;
    Edit13: TEdit;
    Label20: TLabel;
    Edit14: TEdit;
    Label21: TLabel;
    GroupBox1: TGroupBox;
    RadioButton2: TRadioButton;
    RadioButton1: TRadioButton;
    Label18: TLabel;
    Memo1: TMemo;
    BitBtn4: TBitBtn;
    Label58: TLabel;
    GroupBox2: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Label22: TLabel;
    Edit15: TEdit;
    Label23: TLabel;
    Edit16: TEdit;
    BitBtn5: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ComboBox3Change(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit6Click(Sender: TObject);
    procedure Edit6Enter(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit11Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    rkey25:Integer;
    FCust:string;
    function check_save():Boolean;
    function getSO_OLDNEW(rkey25: integer): byte;
  public
    Ftag:integer;
  end;

var
  Form_Detail: TForm_Detail;

implementation

uses custpart,common,Pick_Item_Single ,ConstVar, demo, main, cust_search;

{$R *.dfm}
function TForm_detail.getSO_OLDNEW(rkey25: integer): byte;
begin
with dm.Adotmp do
begin
 close;
 sql.Text:='SELECT rkey FROM data0060'+#13+
      'WHERE cust_part_ptr='+inttostr(rkey25);
 open;
 if not isempty then  //返单
   result:=0
 else
  result:=1;   //新单
end;
end;

function TForm_detail.check_save():Boolean;
begin
  Result:=True;
  if Trim(Edit8.Text)='' then
  begin
    Result:=False;
    MessageDlg('合同号不能为空,请输入合同号!',mtInformation,[mbok],1);
    Edit8.SetFocus;
    Exit;
  end;
  if StrToInt(Edit9.Text)=0 then
  begin
    Result:=False;
    MessageDlg('数量不能为0,请输入数量!',mtInformation,[mbok],1);
    Edit9.SetFocus;
    Exit;
  end;
  if Trim(Edit6.Text)='' then
  begin
    Result:=False;
    MessageDlg('客户代码不能为空,请输入客户代码!',mtInformation,[mbok],1);
    Edit6.SetFocus;
    Exit;
  end;
  if Trim(Edit10.Text)='' then
  begin
    Result:=False;
    MessageDlg('价格不能为空,请输入价格!',mtInformation,[mbok],1);
    Edit10.SetFocus;
    Exit;
  end;
  if Trim(Edit1.Text)='' then
  begin
    Result:=False;
    MessageDlg('货币不能为空,请选择货币!',mtInformation,[mbok],1);
    BitBtn1.SetFocus;
    Exit;
  end;
  if (ComboBox3.ItemIndex=1) and (Trim(Edit5.Text)='') then
  begin
    Result:=False;
    MessageDlg('新单认可书号码不能为空,请输入认可书号码!',mtInformation,[mbok],1);
    edit5.SetFocus;
    Exit;
  end;
  if (Trim(Edit4.Text)='') then
  begin
    Result:=False;
    MessageDlg('请选择本厂编号!',mtInformation,[mbok],1);
    Edit4.SetFocus;
    Exit;
  end;
end;

procedure TForm_Detail.BitBtn3Click(Sender: TObject);
begin
try
dm.aq192.Close;
dm.aq192.Open;
Form_Custpart:=TForm_Custpart.Create(application);  //产品与客户是否绑定 YYY 改2009/08/13
 if (trim(edit6.Text)<>'') and (DM.aq192custcoTool.Value<>'Y') then  //如果先选择客户
  with Form_Custpart.ADOQuery1 do
   begin
    close;
    //20161114tang取消存储过程，直接用ADO
    SQL.Add(' and MANU_PART_NUMBER LIKE ''%'+Trim(edit4.Text)+'%'' and data0025.customer_ptr='+lab_rkey10.Caption+' ORDER BY MANU_PART_NUMBER');
//    Parameters[1].Value:=2;
//    Parameters[2].Value:=self.lab_rkey10.Caption;
//    Parameters[3].Value:=trim(edit4.Text);
    open;
   end
 else
  begin
   Form_Custpart.ADOQuery1.Close;
    //20161114tang取消存储过程，直接用ADO
   Form_Custpart.ADOQuery1.SQL.Add(' and MANU_PART_NUMBER LIKE ''%'+Trim(edit4.Text)+'%'' ORDER BY MANU_PART_NUMBER');
//   Form_Custpart.ADOQuery1.Parameters[1].Value:=1;
//   Form_Custpart.ADOQuery1.Parameters[2].Value:=0;
//   Form_Custpart.ADOQuery1.Parameters[3].Value:=trim(edit4.Text);
   Form_Custpart.ADOQuery1.Open;
  end;

  if Form_Custpart.ADOQuery1.IsEmpty then
   begin
    messagedlg('请输入正确的产品型号!',mtinformation,[mbok],0);
    edit4.SetFocus;
   end
  else
  if Form_Custpart.ShowModal=mrok then
   begin
    edit4.Text:=trim(Form_Custpart.ADOQuery1MANU_PART_NUMBER.Value);
    edit4.Font.Color:=clwindowtext;
    label34.Caption:=Form_Custpart.ADOQuery1MANU_PART_DESC.Value;
    lab_rkey50.Caption:=Form_Custpart.ADOQuery1rkey25.AsString;
    lab_rkey10.Caption:=Form_Custpart.ADOQuery1.fieldbyname('customer_ptr').AsString;
    Edit3.Text:=Form_Custpart.ADOQuery1ANALYSIS_CODE_2.AsString;//客户物料号
    Edit2.Text:=Form_Custpart.ADOQuery1MANU_PART_DESC.AsString;//客户型号
    combobox3.ItemIndex:=getSO_OLDNEW(Form_Custpart.ADOQuery1rkey25.asInteger);
    ComboBox3Change(nil);
    if trim(edit6.Text)='' then
    begin
      with dm.ADOQuery2 do
       begin
        if active=true then active:=false;
        sql.Clear;
        sql.Add('select cust_code from  data0010');
        sql.Add('where rkey='+Form_Custpart.ADOQuery1.fieldbyname('customer_ptr').AsString);
        active:=true;
        edit6.Text:=fieldbyname('cust_code').AsString;
        Fcust:=Edit3.Text;
        edit6exit(sender);
       end;
    end;
    if Trim(Edit11.Text)='' then
    begin
      with dm.ADOQuery2 do
      begin
        if active=true then active:=false;
        sql.Clear;
        sql.Add('select ORIG_CUSTOMER from  data0025');
        sql.Add('where rkey='+Form_Custpart.ADOQuery1.fieldbyname('rkey25').AsString);
        active:=true;
        edit11.Text:=fieldbyname('ORIG_CUSTOMER').AsString;
      end;
    end;
     rkey25:=Form_Custpart.ADOQuery1.FieldValues['rkey25'];
     with dm.ADOQuery2 do
     begin
       Close;
       SQL.Clear;
       sql.Add('select data0015.abbr_name from data0025 inner join data0015');
       SQL.Add('on data0025.PROD_ROUTE_PTR=data0015.rkey');
       SQL.Add('where data0025.rkey='+inttostr(rkey25));
       Open;
     end;
     if not DM.ADOQuery2.IsEmpty then
     Edit12.Text:=dm.ADOQuery2.FieldValues['abbr_name'];
     with dm.ADOQuery2 do
     begin
       Close;
       sql.Clear;
       sql.Add('select data0025.QTY_ON_HAND,round(data0025.QTY_ON_HAND*data0025.unit_sq,4) as mianji from data0025');
       sql.Add('where data0025.rkey='+inttostr(rkey25));
       Open;
     end;
     if not DM.ADOQuery2.IsEmpty then
     begin
      Edit13.Text:=dm.ADOQuery2.fieldbyname('qty_on_hand').AsString;
      Edit14.Text:=dm.ADOQuery2.fieldbyname('mianji').AsString;
     end;
   end;
finally
 Form_Custpart.free;
end;
end;

procedure TForm_Detail.BtnSaveClick(Sender: TObject);
begin
   if self.check_save() then
  begin
    try
       DM.ADO213MANU_PART_NUMBER.Value:= Edit4.Text;
       dm.ADO213cust_code.Value:=Edit6.Text;
       DM.ADO213CURR_CODE.Value:= Edit1.Text;
       DM.ADO213MANU_PART_DESC.Value:= Edit2.Text;
       dm.ADO213ANALYSIS_CODE_2.Value:=Edit3.Text;
       DM.ADO213user_ptr.AsString:=user_ptr;
       DM.ADO213so_oldnew.Value:=Trim(ComboBox3.Text);
       if RadioButton3.Checked then
         dm.ADO213so_style.Value:=RadioButton3.Tag
       else if RadioButton4.Checked then
         dm.ADO213so_style.Value:=RadioButton4.Tag;
       dm.ADO213PO_NUMBER.Value:=Edit8.Text;
       dm.ADO213PARTS_ORDERED.Value:=StrToInt(Edit9.Text);
       dm.ADO213PART_PRICE.Value:=StrToFloat(Edit10.Text);
       dm.ADO213orig_customer.Value:=Edit11.Text;
       DM.ADO213submit_date.Value:=common.getsystem_date(dm.ADOQuery2,0);
       dm.ADO213is_alter.Value:=0;
       dm.ADO213lis_num.Value:=Edit5.Text;
    //20160422添加价格是否含税标志
       if RadioButton1.Checked=True then
       DM.ADO213EDI_FLAG_FOR_INVOICE.Value:=1;
       if RadioButton2.Checked=True then
       DM.ADO213EDI_FLAG_FOR_INVOICE.Value:=0;
    //20161017添加备注字段合同编号必须是97表建好的
       dm.ADO213Remark.Value:=Trim(Memo1.Text);
       DM.ADO213REFERENCE_NUMBER.Value:=Trim(Edit15.Text);
    //20171205添加二维码打印格式选择
       if (Edit16.Tag<>0) then
       dm.ado213Print2DKey.Value:=Edit16.Tag;
       DM.ADO213.Post;
    except
      ShowMessage('保存失败！');
      Exit;
    end;
      ShowMessage('保存成功！');
   DM.ADO213.Close;
   dm.ADO213.Open;

   if Ftag=0 then
   begin
    DM.ADO213.Append;
    DBDateTimeEditEh1.Value:=common.getsystem_date(dm.ADOQuery2,1);
    DBDateTimeEditEh2.Value:=common.getsystem_date(dm.ADOQuery2,1);
    DBDateTimeEditEh3.Value:=common.getsystem_date(dm.ADOQuery2,1);
    Edit6.SetFocus;
   end
   else
    close;
  end;
end;

procedure TForm_Detail.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 dm.ADO213.CancelBatch();
end;

procedure TForm_Detail.ComboBox3Change(Sender: TObject);
begin
 if ComboBox3.ItemIndex=1 then
 begin
  RadioGroup1.Enabled:=True;
  Edit5.ReadOnly:=False;
 end
 else
 begin
  RadioGroup1.Enabled:=False;
  Edit5.ReadOnly:=True;
 end;
end;

procedure TForm_Detail.Edit6Exit(Sender: TObject);
begin
  with dm.ADOQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add('select 1 from data0010 where CUSTOMER_TYPE = 4 and cust_code = '''+Edit6.Text+'''');
    open;
  end;
  if dm.ADOQuery2.RecordCount<>0 then
  begin
    edit6.Text:='';
    Edit4.Text:='';
    label34.Caption := '';
    lab_rkey50.Caption := '';
    showmessage('该客户已停用,请联系市场部!');
    abort;
  end;
if (activecontrol.Name<>'BitBtn1') and (trim(edit6.Text)<>'') then
 try
  if Edit6.Text<>Fcust then
  begin
    dm.aq192.Close;
    dm.aq192.Open;
    if DM.aq192custcoTool.Value<>'Y' then   //产品与客户是否绑定 YYY 改2009/08/13
    begin                                   //=Y 一产品可对多客户
      edit4.Text:='';
      lab_rkey50.Caption:='';
      label34.Caption:='';
    end;
  end;
  frm_cust := Tfrm_cust.Create(Application);
  if StrToInt(vprev)=2 then
  Frm_Cust.ADOQuery1.SQL.Text:=Frm_Cust.ADOQuery1.SQL.Text+'and rkey in (select customer_ptr from data0100 where csi_ptr='+rkey73+')' ;

  frm_cust.ADOQuery1.Close;
  frm_cust.ADOQuery1.Parameters[0].Value:=trim(edit6.Text);
  frm_cust.ADOQuery1.Open;
  if comparetext(trim(edit6.text),trim(frm_cust.ADOQuery1.Fieldbyname('cust_code').AsString))=0 then
  begin
   edit6.Font.Color:=clwindowtext;
   Label15.Caption := frm_cust.ADOQuery1.FieldValues['customer_name'];
   lab_rkey10.Caption := frm_cust.ADOQuery1.Fieldbyname('rkey').asstring;
   lab_rkey01.Caption := frm_cust.ADOQuery1.fieldbyname('currency_ptr').AsString;
   with dm.ADOQuery2 do
    begin
     if active=true then active := false;
     sql.Clear;                         //查找货币
     sql.Add('select curr_code,curr_name,exch_rate from data0001');
     sql.Add('where rkey='+lab_rkey01.Caption);
     active:=true;
     edit1.Text := fieldbyname('curr_code').AsString;
     label35.Caption := fieldbyname('curr_name').AsString;
    end;
  end
  else
  begin
  messagedlg('客户代码不正确,或没有这个客户的权限,请重新输入或选择',mtinformation,[mbok],0);
  edit6.Text:='';
  Edit4.Text:='';
  label34.Caption := '';
  lab_rkey50.Caption := '';
  edit6.SetFocus;
  exit;
  end;
 finally
  if Assigned(frm_cust) then frm_cust.free;
 end
else
 if (activecontrol.Name<>'BitBtn1') and (trim(edit6.Text)='') then
  begin
   label15.Caption := '';
   lab_rkey10.Caption := '';              //客户指针
   lab_rkey01.Caption := '';              //货币指针
   label35.Caption := '';
   edit4.Text:='';                        //取消客户部品
   label34.Caption:='';
   lab_rkey50.Caption:='';
  end;
end;

procedure TForm_Detail.BitBtn1Click(Sender: TObject);
begin
 try
 frm_cust:=tfrm_cust.Create(application);
 if StrToInt(vprev)=2 then
 Frm_Cust.ADOQuery1.SQL.Text:=Frm_Cust.ADOQuery1.SQL.Text+'and rkey in (select customer_ptr from data0100 where csi_ptr='+rkey73+')' ;
 frm_cust.ADOQuery1.Close;
 frm_cust.ADOQuery1.Parameters[0].Value:=trim(edit6.Text);
 frm_cust.ADOQuery1.Open;
 if frm_cust.ADOQuery1.IsEmpty then
  begin
   messagedlg('请输入正确的客户代码!',mtinformation,[mbok],0);
   edit6.SetFocus;
   exit;
  end;
  Frm_Cust.Edit1.Text:=Edit6.Text;
 if frm_cust.ShowModal=mrok then
  begin
   edit6.Text:=frm_cust.ADOQuery1.fieldbyname('cust_code').AsString;
   edit6.Font.Color := clwindowtext;
   label15.Caption := frm_cust.ADOQuery1.fieldbyname('customer_name').AsString;
   lab_rkey01.Caption := frm_cust.ADOQuery1.fieldbyname('currency_ptr').AsString;
   lab_rkey10.Caption := frm_cust.ADOQuery1.fieldbyname('rkey').AsString;
   with dm.ADOQuery2 do //货币
    begin
     if active=true then active:=false;
      sql.Clear;
      sql.Add('select curr_code,curr_name,exch_rate from data0001');
      sql.Add('where rkey='+lab_rkey01.Caption);
      active:=true;
      edit1.Text:=fieldbyname('curr_code').AsString;
      Label35.Caption:=Trim(fieldbyname('curr_name').AsString);
      if (Trim(edit1.Text)<>'RMB') then
      begin
        RadioButton1.Checked:=True;
        GroupBox1.Visible:=False;
      end else
      begin
        RadioButton2.Checked:=True;
        GroupBox1.Visible:=True;
      end;
    end;
    DM.aq192.Close;
    dm.aq192.Open;
    if DM.aq192custcoTool.Value<>'Y' then   //产品与客户是否绑定 YYY 改2009/08/13
    begin                                   //=Y 一产品可对多客户
      edit4.Text:='';
    end;
    edit4.SetFocus;
  end;
 finally
 frm_cust.free;
 end;
end;

procedure TForm_Detail.Edit6Click(Sender: TObject);
begin
if edit6.Font.Color=clwindowtext then
  begin
   edit6.SelectAll;
   edit6.Font.Color:=clblue;
  end;
end;

procedure TForm_Detail.Edit6Enter(Sender: TObject);
begin
FCust:=Edit6.Text;
end;

procedure TForm_Detail.Edit9Change(Sender: TObject);
var
  mianji:Extended;
begin
 with dm.ADOQuery1 do
 begin
   Close;
   sql.Clear;
   sql.Add('select unit_sq from data0025 where manu_part_number='+quotedstr(Edit4.Text));
   Open;
 end;
 if dm.ADOQuery1.IsEmpty then
 begin
  Edit7.Text:='0';
 end
 else
 begin
  mianji:=dm.ADOQuery1.FieldValues['unit_sq']*strtoint(Edit9.Text);
  Edit7.Text:=FloatToStr(mianji);
 end;
end;


procedure TForm_Detail.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
   abort
  else
  if key = chr(46) then      //判断是否重复输入小数点'.'
 if pos('.',(sender as TEdit).Text)>0 then  //小数点不能重复
  abort;
end;

procedure TForm_Detail.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
   abort;
end;

procedure TForm_Detail.BitBtn2Click(Sender: TObject);
var inputvar:PDlgInput;
begin
 frmpick_item_single:=Tfrmpick_item_single.Create(application);
 try
  inputvar.Fields:='cust_code/客户代码/240,abbr_name/客户简称/240';
  inputvar.Sqlstr:='select rkey,cust_code,abbr_name from data0010 ';
  //'where active_flag='+'''Y'''+'order by empl_code';
  inputvar.KeyField:='cust_code';
  inputvar.InPut_value:=edit11.Text;
  inputvar.AdoConn:=dm.ADOConnection1;
  frmpick_item_single.InitForm_New(inputvar);
  if frmpick_item_single.ShowModal=mrok then
  begin
   edit11.Text:=trim(frmpick_item_single.adsPick.FieldValues['abbr_name']);
   edit11.Tag:=frmpick_item_single.adsPick.FieldValues['rkey'];
  end;
 finally
  frmpick_item_single.adsPick.Close;
  frmpick_item_single.Free;
 end;
end;

procedure TForm_Detail.Edit11Exit(Sender: TObject);
begin
  if Trim(Edit11.Text)<>'' then
  begin
   with DM.ADOQuery1 do
   begin
    Close;
    SQL.Clear;
    SQL.Add('select * from data0010 where abbr_name='+quotedstr(Trim(Edit11.Text)));
    Open;
   end;
   if dm.ADOQuery1.IsEmpty then
   begin
   messagedlg('对不起!找不到相关的客户简称',mtinformation,[mbok],0);
   Edit11.Text:='';
   Edit11.SetFocus;
   exit;
   end;
  end;
end;

procedure TForm_Detail.BitBtn4Click(Sender: TObject);
var inputvar:PDlgInput;
begin
  if (Trim(Edit6.Text)='') then
  begin
    ShowMessage('请选择客户');
    exit;
  end;
  frmpick_item_single:=Tfrmpick_item_single.Create(application);
  try
    inputvar.Fields:='po_number/ 客户订单号/240,po_date/日期/240';
    inputvar.Sqlstr:='select rkey,po_number,po_date from data0097 where CUSTOMER_PTR='+lab_rkey10.Caption+' order by PO_DATE desc ';
    inputvar.KeyField:='po_number';
    inputvar.AdoConn:=dm.ADOConnection1;
    frmpick_item_single.InitForm_New(inputvar);
    if frmpick_item_single.ShowModal=mrok then
    begin
      Edit8.Text:=trim(frmpick_item_single.adsPick.FieldValues['po_number']);
      Edit8.Tag:=frmpick_item_single.adsPick.FieldValues['rkey'];
    end;
  finally
    frmpick_item_single.adsPick.Close;
    frmpick_item_single.Free;
  end;
end;

procedure TForm_Detail.BitBtn5Click(Sender: TObject);
var inputvar:PDlgInput;
    sRkey10:string;
begin
//20171205tang添加二维码打印格式，根据客户，如果存在关联客户以关联客户
 if (Trim(Edit11.Text)='') and (edit11.Tag=0) then
 begin
   if (Trim(lab_rkey10.Caption)<>'')then
     sRkey10:=Trim(lab_rkey10.Caption)
   else
     sRkey10:='';
 end else
 begin
   if (Edit11.Tag <>0)then
     sRkey10:=IntToStr(edit11.Tag)
   else
     sRkey10:='';
 end;
 if (Trim(sRkey10)<>'') then
 begin
   frmpick_item_single:=Tfrmpick_item_single.Create(application);
   try
     inputvar.Fields:='cust_code/客户代码/240,abbr_name/客户简称/240';
     inputvar.Sqlstr:='select * from Print2D_BarDef where D10_Ptr='+sRkey10;
     inputvar.KeyField:='Rkey';
     inputvar.AdoConn:=dm.ADOConnection1;
     frmpick_item_single.InitForm_New(inputvar);
     if frmpick_item_single.ShowModal=mrok then
     begin
       Edit16.Text:=trim(frmpick_item_single.adsPick.FieldValues['BarName']);
       Edit16.Tag:=frmpick_item_single.adsPick.FieldValues['rkey'];
     end;
   finally
     frmpick_item_single.adsPick.Close;
     frmpick_item_single.Free;
   end;
 end;
end;

end.
