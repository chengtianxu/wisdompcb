unit change_ponumber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls,ConstVar;

type
  TForm10 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Label5: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Edit8: TEdit;
    BitBtn4: TBitBtn;
    Edit9: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Edit10: TEdit;
    Edit11: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Edit12: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    Edit13: TEdit;
    edt1: TEdit;
    lbl1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button1Enter(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    OrigSum: Currency;  //记录修改前的总金额
  public
    { Public declarations }
   rkey97:integer; 
  end;

var
  Form10: TForm10;

implementation

uses purchase_search, damo, main, cust_search, Address,common,Pick_Item_Single;

{$R *.dfm}

procedure TForm10.Button1Click(Sender: TObject);
var TempDate:TDateTime;
begin
//==========================================================================================
  with DM.ADOQuery2 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT CUSTSTAPROD FROM Data0192 WHERE CUSTSTAPROD = ''Y''');
    Open;
  end;
  IF DM.ADOQuery2.RecordCount>0 then
  begin
    with DM.ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Add(Format('select * from dbo.Data0010 where cust_code = ''%s'' ',[Edit6.Text]));
      Open;
    end;
    if DM.ADOQuery2.fieldbyname('credit_rating').AsInteger = 3 then
    begin
      messagedlg('信用等级太差,订单无法继续!',mtwarning,[mbok],0);
      exit;
    end
    else if DM.ADOQuery2.fieldbyname('credit_rating').AsInteger = 1 then //信用等级为优，超过限额出现提示后仍然可以
    begin                               //开出订单
      if form1.cacl_deficiency(DM.ADOQuery2.fieldbyname('rkey').AsInteger,
               dm.ADO60set_price.Value*dm.ADO60set_ordered.Value*(1+dm.ADO60RUSH_CHARGE.Value/100)/dm.ADO60EXCH_RATE.Value-OrigSum)
                  > DM.ADOQuery2.fieldbyname('credit_limit').AsCurrency+1 then
      if messagedlg('未付款金额超出信用限额是否继续?',
       mtconfirmation,[mbyes,mbno],0)=mrno then exit;
    end
    else //信用等级为良，只能在限额以内开出销售订单
    begin
      if form1.cacl_deficiency(DM.ADOQuery2.fieldbyname('rkey').AsInteger,
               dm.ADO60set_price.Value*dm.ADO60set_ordered.Value*(1+dm.ADO60RUSH_CHARGE.Value/100)/dm.ADO60EXCH_RATE.Value-OrigSum)
                  > DM.ADOQuery2.fieldbyname('credit_limit').AsCurrency+1 then
      begin
        messagedlg('未付款金额超出信用限额无法继续!',mtwarning,[mbok],0);
        exit;
      end;
    end;
  end;
//==========================================================================================
  if rkey97=0 then
  begin
    with dm.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('insert into data0097 (po_number,customer_ptr,po_date,open_sos) values ('''+Trim(Edit2.Text)+'''');
      SQL.Add(','+Trim(Label10.Caption));
      SQL.Add(','''+Trim(Edit3.Text)+'''');
      SQL.Add(',1'+')');
      if ExecSQL > 0 then
       with dm.ADOQuery2 do
        begin
         Close;
         sql.Text:='select IDENT_CURRENT(''data0097'') as rkey97';
         open;
         rkey97:=dm.ADOQuery2.FieldByName('rkey97').AsInteger
        end
      else
         begin
           ShowMsg('新增客户订单号失败！',1);
           exit;
         end;
    end;
  end;
//20150709---------------------------
  if (TryStrToDateTime(Trim(Edit13.Text),TempDate)=False) then
  begin
    ShowMsg('客户交期日期格式不正确！',1);
    Abort;
  end;
  self.ModalResult:=mrok;
end;

procedure TForm10.BitBtn1Click(Sender: TObject);
begin
  if Trim(Edit6.Text)='' then
    showmsg('请首先定义客户代码',1)
  else
  try
    form_po:=tform_po.Create(application);
    with Form_po.ADOQuery1 do
    begin
      Active:=False;
      Parameters[0].Value:=Label10.Caption;
      Active:=True;
      if Trim(Edit2.Text)<>'' then
      begin
        form_po.Edit1.Text:=Trim(Edit2.Text);
        Form_po.Edit1.SelectAll;
      end;
    end;
    if form_po.ShowModal=mrok then
    begin
      if rkey97 <> form_po.ADOQuery1.fieldbyname('rkey').AsInteger then //如果是新选择的客户订单号
      begin
        rkey97 := form_po.ADOQuery1.fieldbyname('rkey').AsInteger;
        edit2.Text := TRIM(form_po.ADOQuery1.fieldbyname('po_number').AsString);
        edit2.Font.Color := clwindowtext;
        edit3.Text := form_po.ADOQuery1.fieldbyname('po_date').AsString;
//20140318tang------
      end else
      if (Edit2.Text='') then
      begin
        edit2.Text := TRIM(form_po.ADOQuery1.fieldbyname('po_number').AsString);
//end tang------
      end;
      edit5.SetFocus;
    end
    else//没有重新选择客户订单号
      edit2.SetFocus;
  finally
   form_po.free;
  end;
end;

procedure TForm10.Edit3Exit(Sender: TObject);
begin
TRY
 strtodate(edit3.Text);
except
 messagedlg('日期格式输入有误!',mtinformation,[mbcancel],0);
 edit3.SetFocus;
end;
end;

procedure TForm10.Edit2Click(Sender: TObject);
begin
 if edit2.Font.Color=clwindowtext then
  begin
   edit2.SelectAll;
   edit2.Font.Color:=clblue;
  end;
end;

procedure TForm10.Edit2Exit(Sender: TObject);
begin
if Trim(Edit2.Text)<>'' then
  with dm.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('select * from data0097 where po_number='+quotedstr(trim(Edit2.Text)));
    sql.Add('and CUSTOMER_PTR='+label10.Caption);
    Active:=True;
    //鸿泰
   { if IsEmpty then
     begin
      Edit2.Font.Color:=clBlue;
//20140318tang修改不可新增客户订单号--
      ShowMessage('客户订单号不正确');
      Edit2.SetFocus;
      Edit2.Text:='';
      if (Label17.Caption<>Trim(Edit6.Text)) then
      begin
        Edit7.Text:='';
        Edit9.Text:='';
      end;
      //self.rkey97:=0;
//end tang------------------------------------
     end
    else }  

      if rkey97<>dm.ADOQuery1.FieldByName('rkey').AsInteger then
      begin
        Edit3.Text:=dm.ADOQuery1.fieldbyname('PO_DATE').AsString;
        rkey97:=dm.ADOQuery1.FieldByName('rkey').AsInteger;
      end;

      Edit2.Font.Color:=clWindowText;

  end;

end;

procedure TForm10.BitBtn2Click(Sender: TObject);
begin
  form_Custmer:=Tform_Custmer.Create(Application);
  form_Custmer.MaskEdit1.Text:=Edit6.Text;
  if form_Custmer.ShowModal=mrok then
  begin
    Edit6.Text:=form_Custmer.ADODataSet1cust_code.Value;
    Edit6.Font.Color:=clWindowText;
    Label9.Caption:=form_Custmer.ADODataSet1customer_name.Value;
    Label10.Caption:=form_Custmer.ADODataSet1rkey.AsString;
    Edit2.Text:='';
    Edit7.Text:='';
    Edit2.SetFocus;
    Edit2.SelectAll;
    with DM.ADOQuery2 do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select Data0001.rkey,Data0001.curr_code,Data0001.exch_rate,'+
                'Data0010.EDI_FLAG_FOR_SOACK,Data0010.EDI_FLAG_FOR_INVOICE '+
                'from Data0010 INNER JOIN '+
                'Data0001 ON Data0010.CURRENCY_PTR = Data0001.RKEY '+
                'where  Data0010.rkey='+form_Custmer.ADODataSet1rkey.AsString;
      Open;
      Edit8.Text:=FieldValues['curr_code'];
      Edit8.Tag:=FieldValues['rkey'];
      Edit10.Text:=FieldValues['exch_rate'];
      if FieldValues['EDI_FLAG_FOR_SOACK']='0' then
        CheckBox2.Checked:=False
      else
        CheckBox2.Checked:=True;
      if FieldValues['EDI_FLAG_FOR_INVOICE']='0' then
        CheckBox1.Checked:=False
      else
        CheckBox1.Checked:=True;
    end;
  end
  else
   Edit6.SetFocus;
 form_Custmer.free;
end;

procedure TForm10.BitBtn3Click(Sender: TObject);
begin
  if Trim(Edit6.Text)='' then
    showmsg('请首先定义客户代码',1)
  else
  try
    frm_Address:=Tfrm_Address.Create(Application);
    with frm_Address.ADO12 do
    begin
      Close;
      Parameters[0].Value:=Label10.Caption;
      Open;
    end;
    if frm_Address.ShowModal=mrok then
    begin
      Edit7.Text:=frm_Address.ADO12LOCATION.Value;
      Label11.Caption:=frm_Address.ADO12rkey.Text;
      Edit9.Text:=frm_Address.ADO12state_tax.AsString;
      Edit11.Text:=frm_Address.ADO12SHIP_TO_CONTACT.Value;
      Edit12.Text:=frm_Address.ADO12SHIP_TO_PHONE.Value;
    end;
  finally
    frm_Address.Free;
  end;
end;

procedure TForm10.Button1Enter(Sender: TObject);
begin
  if Trim(Edit6.Text)='' then
  begin
    showmessage('客户代码不能够为空!!!');
    Edit6.SetFocus;
    Exit;
  end;
  if trim(edit2.Text)='' then
  begin
    showmessage('客户订单号不能够为空!!!');
    Edit2.SetFocus;
    Exit;
  end;
  if Trim(Edit7.Text)='' then
  begin
    ShowMessage('装运地址不能够为空!!!');
    Edit7.SetFocus;
    Exit;
  end;
end;

procedure TForm10.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if Trim(Edit6.Text)='' then
  begin
   showmsg('请首先定义客户代码',1);
   Abort;
  end;
    Edit2.Font.Color:=clBlue;
end;

procedure TForm10.Edit6Exit(Sender: TObject);
begin
  if Trim(Edit6.Text)='' then
  begin
    Edit2.Text:='';
    Edit7.Text:='';
    Edit9.Text:='';
  end
  else
  begin
    with dm.ADOQuery1 do
    begin
      close;
      SQL.Text:='select Data0001.rkey,Data0001.curr_code,Data0001.exch_rate,Data0010.rkey AS rkey10,'+
                'Data0010.EDI_FLAG_FOR_SOACK,Data0010.EDI_FLAG_FOR_INVOICE,Data0010.CUSTOMER_NAME '+
                'from Data0010 INNER JOIN '+
                'Data0001 ON Data0010.CURRENCY_PTR = Data0001.RKEY '+
                'where Data0010.CREDIT_RATING<> 3 and Data0010.cust_code='+QuotedStr(Trim(Edit6.Text));
      open;
    end;
    if not dm.ADOQuery1.IsEmpty then
    begin
      if Label10.Caption<>dm.ADOQuery1.FieldByName('rkey10').AsString then
      begin
        Edit6.Font.Color:=clWindowText;
        Label9.Caption:=DM.ADOQuery1.fieldbyname('customer_name').AsString;
        Label10.Caption:=DM.ADOQuery1.fieldbyname('rkey10').AsString;
        Edit8.Text:=DM.ADOQuery1.fieldbyname('curr_code').AsString;
        Edit8.Tag:= dm.ADOQuery1.FieldValues['rkey'];
        Edit10.Text:=DM.ADOQuery1.fieldbyname('exch_rate').AsString;

        if dm.ADOQuery1.FieldValues['EDI_FLAG_FOR_INVOICE']='1' then
          Form10.CheckBox1.Checked:=True       //价格含税
        else
          Form10.CheckBox1.Checked:=False;    //转厂订单
        if dm.ADOQuery1.FieldValues['EDI_FLAG_FOR_SOACK']='1' then
          Form10.CheckBox2.Checked:=True
        else
          Form10.CheckBox2.Checked:=False;
        Edit2.Text:='';
        Edit7.Text:='';
        Edit9.Text:='';
      end;
    end
    else
    begin
      Edit6.SetFocus;
      ShowMsg('客户代码输入错误或信用等级为差',1);
    end;
  end;
end;

procedure TForm10.BitBtn4Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'curr_code/货币代码/100,curr_name/货币名称/100,exch_rate/汇率/277';
    InputVar.Sqlstr := 'select rkey,curr_code,curr_name,exch_rate from data0001';
    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit8.Text:=frmPick_Item_Single.adsPick.Fieldbyname('curr_code').AsString;
      Edit8.Tag:=frmPick_Item_Single.adsPick. Fieldbyname('rkey').AsInteger;
      Edit10.Text:=frmPick_Item_Single.adsPick.Fieldbyname('exch_rate').AsString;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TForm10.FormActivate(Sender: TObject);
begin
  OrigSum:= dm.ADO60set_price.Value*dm.ADO60set_ordered.Value*(1+dm.ADO60RUSH_CHARGE.Value/100)/dm.ADO60EXCH_RATE.Value;
end;

end.
