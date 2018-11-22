unit Main;
                                     
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons,DateUtils;

type
  TFrm_Main = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    GroupBox3: TGroupBox;
    ComboBox1: TComboBox;
    Label5: TLabel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label6: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox4: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn3Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    sql_Text,sql_Text1,sql_Text2,sql_Text3,sql_Text4:string;
    sortDate:TDateTime;
    total_Number:Integer;
    total_Amount:Double;
    total_makeInvoiceAmoun,total_NoAmount:Double;
    total_billingquantity:Integer;
    procedure Standard(Sender: TObject);
    procedure Tool(Sender: TObject);
    procedure Sundry(Sender: TObject);
    procedure ReturnMemo(Sender: TObject);
    procedure NoReturnMemo(Sender: TObject);
  public
    { Public declarations }
    arrayLength:Integer;
    list:array of array of string;
    rkey:array of Integer;
    i:Integer;
  end;

var
  Frm_Main: TFrm_Main;
  str_list:TStringList;

implementation

uses dmo, Customer, Result, common;

{$R *.dfm}

procedure TFrm_Main.FormCreate(Sender: TObject);
begin
  if not app_init(DM.ADOConn) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;                        { }
  Self.Caption:=Application.Title;

  str_list := TStringList.Create;
  str_list.Add('记录号=req_no');
  str_list.Add('客户代码=CUST_CODE');
  str_list.Add('客户简称=ABBR_NAME');
  str_list.Add('客户名称=CUSTOMER_NAME');
  str_list.Add('业务员=EMPLOYEE_NAME');
  str_list.Add('付款方式=FED_TAX_ID_NO');
  str_list.Add('入帐编号=invoice_number');
  str_list.Add('币种=CURR_CODE');
  str_list.Add('汇率=EXCHANGE_RATE');
  str_list.Add('入帐日期=POSTED_DATE');
  str_list.Add('帐龄日期=INVOICE_DATE');
  str_list.Add('帐龄总计金额=INVOICE_TOTAL');
  str_list.Add('已结金额=amount_paid');
  str_list.Add('未结金额=amt_payable');
  str_list.Add('客户订单号=PO_NUMBER');
  str_list.Add('本厂编号=MANU_PART_NUMBER');
  str_list.Add('客户型号=MANU_PART_DESC');
  str_list.Add('客户物料号=ANALYSIS_CODE_2');
  str_list.Add('层数=LAYERS');
  str_list.Add('交货单元数=set_qty');
  str_list.Add('产品类别名称=PRODUCT_NAME');
  str_list.Add('基价名称=ROW_NAME');
  str_list.Add('交货尺寸=ANALYSIS_CODE_1');
  str_list.Add('单元面积=unit_sq');
  str_list.Add('装箱单号=delivery_no');
  str_list.Add('销售订单号=SALES_ORDER');
  str_list.Add('装运日期=DATE_SHIPPED');
  str_list.Add('出货数量=quan_shipped');
  str_list.Add('出货面积=chmj');
  str_list.Add('已开票数量=ovsh_qty');
  str_list.Add('不含税PCS价格=PARTS_ALLOC');
  str_list.Add('税率%=TAX_2');
  str_list.Add('开票金额=RUSH_CHARGE_AMOUNT');
  str_list.Add('出货金额(含税)=amt_shipped');
  str_list.Add('出货金额(不含税)=delivery_price');
  str_list.Add('备注=MISC_INV_DESCRIPTION');
  str_list.Add('实际成本=cost_2');
  str_list.Add('应收是否已开票=GLPTR_STATUS');
  str_list.Add('订单类别=so_tp');
  str_list.Add('外发供应商=Supp_name');
  str_list.Add('参考号=REF_NUMBER');
  str_list.Add('报关单号=cust_decl');
  str_list.Add('发票类型=TYPE');   //这是一个计算字段
  str_list.Add('订单数量=PARTS_ORDERED');
  str_list.Add('工厂简称=Factory_name');
  str_list.Add('指派类型=assign_type');
  str_list.Add('毛利率=rate_margin');
  str_list.Add('关联原客户=ORIG_CUSTOMER');
  str_list.Add('订单类型=sttype');

end;

procedure TFrm_Main.FormShow(Sender: TObject);
begin
  sql_Text:=DM.ADOStandard.CommandText;
  sql_Text1:=DM.ADOTool.CommandText;
  sql_Text2:=DM.ADOSundry.CommandText;
  sql_Text3:=DM.ADOReturnMemo.CommandText;
  sql_Text4:=DM.ADONoReturnMemo.CommandText;
  i:=1;
  DM.ADO10.Close;
  DM.ADO10.Parameters[0].Value:='';
  DM.ADO10.Open;
//  DM.ADO10.First;
//  Edit1.Text:= DM.ADO10CUST_CODE.Value;
//  Label3.Caption:=DM.ADO10CUSTOMER_NAME.Value;
//  DM.ADO10.Last;
//  Edit2.Text:= DM.ADO10CUST_CODE.Value;
//  Label4.Caption:=DM.ADO10CUSTOMER_NAME.Value;
  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Text:='select getdate() as v_date';
    Active:=True;
    sortDate:=FieldValues['v_date'];
    dtpk1.Date:=sortDate-dayof(sortDate)+1;
    dtpk2.Date:=sortDate;
  end;
end;

procedure TFrm_Main.BitBtn4Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrm_Main.BitBtn1Click(Sender: TObject);
begin
  Frm_Customer:=TFrm_Customer.Create(Application);
  with DM.ADO10 do
  begin
    Close;
    Parameters[0].Value:='';
    if Trim(Edit1.Text)<>'' then
      Parameters[0].Value:=Trim(Edit1.Text)
    else
      Parameters[0].Value:='';
    Open;
    if IsEmpty then
    begin
      ShowMessage('请输入正确的客户代码');
      Edit1.Text:='';
      Edit1.SetFocus;
      Exit;
    end;
  end;
  if Frm_Customer.ShowModal=mrok then
  begin
    Edit1.Text:=DM.ADO10CUST_CODE.Value;
    Label3.Caption:=DM.ADO10CUSTOMER_NAME.Value
  end;
end;

procedure TFrm_Main.BitBtn3Enter(Sender: TObject);
begin
  if Trim(Edit1.Text)='' then
  begin
    ShowMessage('客户代码不能空');
    Edit1.SetFocus;
    Exit;
  end;
  if Trim(Edit2.Text)='' then
  begin
    ShowMessage('客户代码不能空');
    Edit2.SetFocus;
    Exit;
  end;
  if Trim(Edit1.Text)>Trim(Edit2.Text) then
  begin
    ShowMessage('起始的客户代码不能大于结束的客户代码');
    Edit2.SetFocus;
    Exit;
  end;
end;

procedure TFrm_Main.Edit1Exit(Sender: TObject);
begin
//  Label3.Caption:='';
//  Label4.Caption:='';
//  if Trim((Sender as TEdit).Text)='' then
//  Exit;
//  with DM.ADO10_1 do
//  begin
//    Close;
//    Parameters[0].Value:='';
//    if Trim((Sender as TEdit).Text)<>'' then
//      Parameters[0].Value:=Trim((Sender as TEdit).Text)
//    else
//      Parameters[0].Value:='';
//    Open;
//    if IsEmpty then
//    begin
//      ShowMessage('请输入正确的客户代码');
//      (Sender as TEdit).Text:='';
//      (Sender as TEdit).SetFocus;
//      Exit;
//    end;
//  end;
//  if Trim((Sender as TEdit).Text)='' then
//  begin
//    (Sender as TEdit).Text:='';
//    if (Sender as TEdit).Name='Edit1' then
//      Label3.Caption:=''
//    else
//      Label4.Caption:='';
//  end
//  else
//  begin
//    (Sender as TEdit).Text:=DM.ADO10_1CUST_CODE.Value;
//    if (Sender as TEdit).Name='Edit1' then
//      Label3.Caption:=DM.ADO10_1CUSTOMER_NAME.Value
//    else
//      Label4.Caption:=DM.ADO10_1CUSTOMER_NAME.Value;
//  end;
end;

procedure TFrm_Main.BitBtn3Click(Sender: TObject);
var
  d,f,j:Integer;
begin
  f:=0;
  total_Amount:=0;
  total_Number:=0;
  total_billingquantity:=0;
  total_makeInvoiceAmoun:=0;
  total_NoAmount:=0;
  if (not (CheckBox1.Checked)) and
     (not (CheckBox2.Checked)) and
     (not (CheckBox3.Checked)) and
     (not (CheckBox4.Checked)) and
     (not (CheckBox5.Checked)) then
  begin
    ShowMessage('您没有选择任何一种发票类型，请选择发票类型');
    Exit;
  end;

  try
    Screen.Cursor := crHourGlass;
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Text:='select rkey from data0010 where cust_code>=:edit1 and cust_code<=:edit2';
      Parameters[0].Value:=Trim(Edit1.Text);
      Parameters[1].Value:=Trim(Edit2.Text);
      Active:=True;
      SetLength(rkey,RecordCount);
      while not Eof do
      begin
        rkey[f]:=FieldValues['rkey'];
        Next;
        f:=f+1;
      end;
    end;

    Frm_Result:=TFrm_Result.Create(Application);
    if CheckBox1.Checked then
    begin
      DM.ADOStandard.Close;
      if ComboBox1.ItemIndex=0 then
       begin
        DM.ADOStandard.CommandText:=sql_Text+' and Data0112.POSTED_DATE>='+quotedstr(FormatDateTime('yyyy-mm-dd',dtpk1.Date))+
                                             ' and Data0112.POSTED_DATE<='+quotedstr(FormatDateTime('yyyy-mm-dd',dtpk2.Date))+
                                             ' order by Data0010.CUST_CODE,Data0064.rkey';
       end
      else
       begin
        DM.ADOStandard.CommandText:=sql_Text+' and Data0112.INVOICE_DATE>='+quotedstr(FormatDateTime('yyyy-mm-dd',dtpk1.Date))+
                                             ' and Data0112.INVOICE_DATE<='+quotedstr(FormatDateTime('yyyy-mm-dd',dtpk2.Date))+
                                             ' order by Data0010.CUST_CODE,Data0064.rkey';
       end;
      DM.ADOStandard.Parameters[0].Value:=Trim(Edit1.Text);
      DM.ADOStandard.Parameters[1].Value:=Trim(Edit2.Text);
      with DM.ADOQuery1 do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Text:=DM.ADOStandard.CommandText;
      end;
      if RadioButton1.Checked then
        DM.ADOStandard.CommandText:=DM.ADOQuery1.SQL.Text+',Data0097.PO_NUMBER'
      else
        DM.ADOStandard.CommandText:=DM.ADOQuery1.SQL.Text+',Data0064.DATE_SHIPPED';
      DM.ADOStandard.Open;
      Frm_Result.SGrd.ColCount:=DM.ADOStandard.FieldCount-2;
    end;

    if CheckBox2.Checked then
    begin
      DM.ADOTool.Close;
      if ComboBox1.ItemIndex=0 then
      begin
        DM.ADOTool.CommandText:=sql_Text1+' and Data0112.POSTED_DATE>='+quotedstr(FormatDateTime('yyyy-mm-dd',dtpk1.Date))+
                                             ' and Data0112.POSTED_DATE<='+quotedstr(FormatDateTime('yyyy-mm-dd',dtpk2.Date))+
                                             ' order by Data0010.CUST_CODE,Data0112.rkey';
      end
      else
      begin
        DM.ADOTool.CommandText:=sql_Text1+' and Data0112.INVOICE_DATE>='+quotedstr(FormatDateTime('yyyy-mm-dd',dtpk1.Date))+
                                             ' and Data0112.INVOICE_DATE<='+quotedstr(FormatDateTime('yyyy-mm-dd',dtpk2.Date))+
                                             ' order by Data0010.CUST_CODE,Data0112.rkey';
      end;
      DM.ADOTool.Parameters[0].Value:=Trim(Edit1.Text);
      DM.ADOTool.Parameters[1].Value:=Trim(Edit2.Text);
      with DM.ADOQuery1 do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Text:=DM.ADOTool.CommandText;
      end;
      if RadioButton1.Checked then
        DM.ADOTool.CommandText:=DM.ADOQuery1.SQL.Text+',Data0097.PO_NUMBER'
      else
        DM.ADOTool.CommandText:=DM.ADOQuery1.SQL.Text+',DATE_SHIPPED';
      DM.ADOTool.Open;
      Frm_Result.SGrd.ColCount:=DM.ADOTool.FieldCount-2;
    end;

    if CheckBox3.Checked then
     begin
      DM.ADOSundry.Close;
      if ComboBox1.ItemIndex=0 then
       begin
        DM.ADOSundry.CommandText:=sql_Text2+' and Data0112.POSTED_DATE>='+quotedstr(FormatDateTime('yyyy-mm-dd',dtpk1.Date))+
                                             ' and Data0112.POSTED_DATE<='+quotedstr(FormatDateTime('yyyy-mm-dd',dtpk2.Date))+
                                             ' order by Data0010.CUST_CODE,Data0112.rkey';
       end
      else
       begin
        DM.ADOSundry.CommandText:=sql_Text2+' and Data0112.INVOICE_DATE>='+quotedstr(FormatDateTime('yyyy-mm-dd',dtpk1.Date))+
                                             ' and Data0112.INVOICE_DATE<='+quotedstr(FormatDateTime('yyyy-mm-dd',dtpk2.Date))+
                                             ' order by Data0010.CUST_CODE,Data0112.rkey';
       end;
      DM.ADOSundry.Parameters[0].Value:=Trim(Edit1.Text);
      DM.ADOSundry.Parameters[1].Value:=Trim(Edit2.Text);
      DM.ADOSundry.Open;
      Frm_Result.SGrd.ColCount:=DM.ADOSundry.FieldCount-2;
     end;

    if CheckBox4.Checked then
    begin
      DM.ADOReturnMemo.Close;
      if ComboBox1.ItemIndex=0 then
       begin
        DM.ADOReturnMemo.CommandText:=sql_Text3+' and Data0116.MEMO_DATE>='+quotedstr(FormatDateTime('yyyy-mm-dd',dtpk1.Date))+
                                             ' and Data0116.MEMO_DATE<='+quotedstr(FormatDateTime('yyyy-mm-dd',dtpk2.Date))+
                                             ' order by Data0010.CUST_CODE,Data0098.rkey';
       end
      else
       begin
        DM.ADOReturnMemo.CommandText:=sql_Text3+' and Data0116.RMA_DATE>='+quotedstr(FormatDateTime('yyyy-mm-dd',dtpk1.Date))+
                                             ' and Data0116.RMA_DATE<='+quotedstr(FormatDateTime('yyyy-mm-dd',dtpk2.Date))+
                                             ' order by Data0010.CUST_CODE,Data0098.rkey';
       end;
      DM.ADOReturnMemo.Parameters[0].Value:=Trim(Edit1.Text);
      DM.ADOReturnMemo.Parameters[1].Value:=Trim(Edit2.Text);
      with DM.ADOQuery1 do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Text:=DM.ADOReturnMemo.CommandText;
      end;
      if RadioButton1.Checked then
        DM.ADOReturnMemo.CommandText:=DM.ADOQuery1.SQL.Text+',Data0097.PO_NUMBER'
      else
        DM.ADOReturnMemo.CommandText:=DM.ADOQuery1.SQL.Text+',DATE_SHIPPED';
      DM.ADOReturnMemo.Open;
      Frm_Result.SGrd.ColCount:=DM.ADOReturnMemo.FieldCount-2;
    end;

    if CheckBox5.Checked then
    begin
      DM.ADONoReturnMemo.Close;
      if ComboBox1.ItemIndex=0 then
      begin
        DM.ADONoReturnMemo.CommandText:=sql_Text4+' and Data0116.MEMO_DATE>='+quotedstr(FormatDateTime('yyyy-mm-dd',dtpk1.Date))+
                                             ' and Data0116.MEMO_DATE<='+quotedstr(FormatDateTime('yyyy-mm-dd',dtpk2.Date))+
                                             ' order by Data0010.CUST_CODE,Data0116.rkey';
      end
      else
      begin
        DM.ADONoReturnMemo.CommandText:=sql_Text4+' and Data0116.RMA_DATE>='+quotedstr(FormatDateTime('yyyy-mm-dd',dtpk1.Date))+
                                             ' and Data0116.RMA_DATE<='+quotedstr(FormatDateTime('yyyy-mm-dd',dtpk2.Date))+
                                             ' order by Data0010.CUST_CODE,Data0116.rkey';
      end;
      DM.ADONoReturnMemo.Parameters[0].Value:=Trim(Edit1.Text);
      DM.ADONoReturnMemo.Parameters[1].Value:=Trim(Edit2.Text);
      DM.ADONoReturnMemo.Open;
      Frm_Result.SGrd.ColCount:=DM.ADONoReturnMemo.FieldCount-2;
    end;
  
    with Frm_Result.SGrd do
    begin
      for j := 0 to str_list.Count - 1  do    //SGrd添加第一行的字段名
      begin
        //if j>40 then
       // ShowMessage(str_list.Strings[j]+ ' '+inttostr(j));
        Cells[j,0] := str_list.Names[j];
        
      end;

    end;
    if CheckBox1.Checked then
    begin
      Frm_Result.Caption:='客户对帐查询(标准发票)';
    end;

    if CheckBox2.Checked then
    begin
      if Frm_Result.Caption<>'' then
        Frm_Result.Caption:='客户对帐查询(综合)'
      else
        Frm_Result.Caption:='客户对帐查询(工具发票)';
    end;

    if CheckBox3.Checked then
    begin
      if Frm_Result.Caption<>'' then
        Frm_Result.Caption:='客户对帐查询(综合)'
      else
        Frm_Result.Caption:='客户对帐查询(杂项发票)';
    end;
  
    if CheckBox4.Checked then
    begin
      if Frm_Result.Caption<>'' then
        Frm_Result.Caption:='客户对帐查询(综合)'
      else
        Frm_Result.Caption:='客户对帐查询(退货备忘)';
    end;

    if CheckBox5.Checked then
    begin
      if Frm_Result.Caption<>'' then
        Frm_Result.Caption:='客户对帐查询(综合)'
      else
        Frm_Result.Caption:='客户对帐查询(无退货备忘)';
    end;

    for d := 0 to Length(rkey)-1 do
    begin
      if CheckBox1.Checked then
      begin
        DM.ADOStandard.Filter:= 'rkey10 ='+IntToStr(rkey[d]);
        if DM.ADOStandard.RecordCount>=1 then
        begin
          Standard(Sender);
        end;
      end;
      if CheckBox2.Checked then
      begin
        DM.ADOTool.Filter:= 'rkey10 ='+IntToStr(rkey[d]);
        if DM.ADOTool.RecordCount>=1 then
        begin
          Tool(Sender);
        end;
      end;
      if CheckBox3.Checked then
      begin
        DM.ADOSundry.Filter:= 'rkey10 ='+IntToStr(rkey[d]);
        if DM.ADOSundry.RecordCount>=1 then
        begin
          Sundry(Sender);
        end;
      end;
      if CheckBox4.Checked then
      begin
        DM.ADOReturnMemo.Filter:= 'rkey10 ='+IntToStr(rkey[d]);
        if DM.ADOReturnMemo.RecordCount>=1 then
        begin
          ReturnMemo(Sender);
        end;
      end;
      if CheckBox5.Checked then
      begin
        DM.ADONoReturnMemo.Filter:= 'rkey10 ='+IntToStr(rkey[d]);
        if DM.ADONoReturnMemo.RecordCount>=1 then
        begin
          NoReturnMemo(Sender);
        end;
      end;
    end;
    with Frm_Result.SGrd do
    begin
      if RowCount-2>0 then
      Cells[2,RowCount-1]:= Cells[2,RowCount-2];
      Cells[str_list.IndexOfName('出货数量'        ),RowCount-1]:=IntToStr(total_Number);
      Cells[str_list.IndexOfName('已开票数量'      ),RowCount-1]:=IntToStr(total_billingquantity);
      Cells[str_list.IndexOfName('开票金额'        ),RowCount-1]:=FormatFloat('0.00',total_makeInvoiceAmoun);
      Cells[str_list.IndexOfName('出货金额(含税)'  ),RowCount-1]:=FormatFloat('0.00',total_Amount);
      Cells[str_list.IndexOfName('出货金额(不含税)'),RowCount-1]:=FormatFloat('0.00',total_NoAmount);
      //ShowMessage(IntToStr(str_list.IndexOfName('出货数量'        )));
     { Cells[23,RowCount-1]:=IntToStr(total_Number);
      Cells[24,RowCount-1]:=IntToStr(total_billingquantity);
      Cells[27,RowCount-1]:=FormatFloat('0.00',total_makeInvoiceAmoun);
      Cells[28,RowCount-1]:=FormatFloat('0.00',total_Amount);
      Cells[29,RowCount-1]:=FormatFloat('0.00',total_NoAmount); }
      total_Number:=0;
      total_billingquantity:=0;
      total_Amount:=0;
      total_makeInvoiceAmoun:=0;
      total_NoAmount:=0;
    end;
    Frm_Result.ShowModal;
  finally    
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrm_Main.Standard(Sender: TObject);
var
  j : Integer;
begin
  with Frm_Result.SGrd do
  begin
    if RowCount>2 then
    begin
      if Cells[1,i-1]<>DM.ADOStandardCUST_CODE.Value then
      begin
        Cells[2,i]:= Cells[2,i-1];
        Cells[str_list.IndexOfName('出货数量'        ),i]:=IntToStr(total_Number);
        Cells[str_list.IndexOfName('已开票数量'      ),i]:=IntToStr(total_billingquantity);
        Cells[str_list.IndexOfName('开票金额'        ),i]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[str_list.IndexOfName('出货金额(含税)'  ),i]:=FormatFloat('0.00',total_Amount);
        Cells[str_list.IndexOfName('出货金额(不含税)'),i]:=FormatFloat('0.00',total_NoAmount);
       { Cells[23,i]:=IntToStr(total_Number);
        Cells[24,i]:=IntToStr(total_billingquantity);
        Cells[27,i]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[28,i]:=FormatFloat('0.00',total_Amount);
        Cells[29,i]:=FormatFloat('0.00',total_NoAmount);  }
        total_Number:=0;
        total_billingquantity:=0;
        total_Amount:=0;
        total_makeInvoiceAmoun:=0;
        total_NoAmount:=0;
        i:=i+1;
        RowCount:=RowCount+1;
      end;
    end;
  end;
  while not DM.ADOStandard.Eof do
  begin
    with Frm_Result.SGrd do
    begin
      for j := 0 to str_list.Count -1 do
      begin
        if DM.ADOStandard.FieldByName(str_list.Values[Cells[j,0]]).IsNull = False then
        Cells[j,i] := DM.ADOStandard.FieldByName(str_list.Values[Cells[j,0]]).Value;
        if UpperCase(str_list.Values[Cells[j,0]]) =  UpperCase('GLPTR_STATUS') then //应收是否已开票
        if DM.ADOStandard.FieldByName(str_list.Values[Cells[j,0]]).AsBoolean then
          Cells[j,i] := '是'
        else
          Cells[j,i] := '否';
      end;
   {   Cells[0,i]:=DM.ADOStandardreq_no.Text;
      Cells[1,i]:=DM.ADOStandardCUST_CODE.Value;
      Cells[2,i]:=DM.ADOStandardABBR_NAME.Value;
      Cells[3,i]:=DM.ADOStandardCUSTOMER_NAME.Value;

      Cells[4,i]:=DM.ADOStandardinvoice_number.Value;
      Cells[5,i]:=DM.ADOStandardCURR_CODE.Value;
      Cells[6,i]:=DM.ADOStandardEXCHANGE_RATE.Text;
      Cells[7,i]:=DM.ADOStandardPOSTED_DATE.Text;
      Cells[8,i]:=DM.ADOStandardINVOICE_DATE.Text;
      Cells[9,i]:=DM.ADOStandardINVOICE_TOTAL.Text;
      Cells[10,i]:=DM.ADOStandardamount_paid.Text;
      Cells[11,i]:=DM.ADOStandardamt_payable.Text;
      Cells[12,i]:=DM.ADOStandardPO_NUMBER.Value;
      Cells[13,i]:=DM.ADOStandardMANU_PART_NUMBER.Value;
      Cells[14,i]:=DM.ADOStandardMANU_PART_DESC.Value;
      Cells[15,i]:=DM.ADOStandardANALYSIS_CODE_2.Value;
      Cells[16,i]:=DM.ADOStandardLAYERS.Text;
      Cells[17,i]:=DM.ADOStandardPRODUCT_NAME.Value;
      Cells[18,i]:=DM.ADOStandardANALYSIS_CODE_1.Value;
      Cells[19,i]:=DM.ADOStandardunit_sq.Text;
      Cells[20,i]:=DM.ADOStandarddelivery_no.Value;
      Cells[21,i]:=DM.ADOStandardSALES_ORDER.Value;
      Cells[22,i]:=DM.ADOStandardDATE_SHIPPED.Text;
      Cells[23,i]:=DM.ADOStandardquan_shipped.Text;

//      if Cells[23,i]<>'' then
//        total_Number:=total_Number+StrToInt(Cells[23,i])
//      else
//        total_Number:=0;
      Cells[24,i]:=DM.ADOStandardovsh_qty.Text;

//      if Cells[24,i]<>'' then
//        total_billingquantity:=total_billingquantity+StrToInt(Cells[24,i])
//      else
//        total_billingquantity:=0;
      Cells[25,i]:=DM.ADOStandardPARTS_ALLOC.Text;
      Cells[26,i]:=DM.ADOStandardTAX_2.Text;
      Cells[27,i]:=dm.ADOStandardRUSH_CHARGE_AMOUNT.Text;

//      if Cells[27,i]<>'' then
//        total_makeInvoiceAmoun:=total_makeInvoiceAmoun+StrToFloat(Cells[27,i])
//      else
//        total_makeInvoiceAmoun:=0;

      Cells[28,i]:=DM.ADOStandardamt_shipped.Text;
//      if Cells[28,i]<>'' then
//        total_Amount:= total_Amount+StrToFloat(Cells[28,i])
//      else
//        total_Amount:= 0;
      Cells[29,i]:=DM.ADOStandarddelivery_price.Text;
      total_NoAmount:=total_NoAmount+ StrToFloat(Cells[29,i]);
      if  DM.ADOStandarddelivery_price.value >0 then
      total_NoAmount := total_NoAmount +  DM.ADOStandarddelivery_price.value;
      Cells[30,i]:=DM.ADOStandardMISC_INV_DESCRIPTION.Value;
      Cells[31,i]:=DM.ADOStandardcost_2.Text;
      if DM.ADOStandardGLPTR_STATUS.Text='False' then
        Cells[32,i]:='否'
      else
        Cells[32,i]:='是';
      Cells[33,i]:=DM.ADOStandardso_tp.Value;
      Cells[34,i]:=DM.ADOStandardSupp_name.Value;
      Cells[35,i]:=DM.ADOStandardREF_NUMBER.Value;
      Cells[36,i]:=DM.ADOStandardcust_decl.Value;
      Cells[37,i]:='标准发票';
      Cells[38,i]:=DM.ADOStandardPARTS_ORDERED.Text;
      Cells[39,i]:=DM.ADOStandardFactory_name.Value;
      Cells[40,i]:=DM.adostandardassign_type.Value;//2013-10-22tang添加----
      Cells[41,i]:=DM.adostandardrate_margin.Text;//2013-12-3tang添加----
      Cells[42,i]:=DM.ADOStandardORIG_CUSTOMER.Value;
      Cells[43,i]:=DM.ADOStandardsttype.Value; }

      if  DM.ADOStandardquan_shipped.IsNull = False then
        total_Number := total_Number + DM.ADOStandardquan_shipped.AsInteger;
      if  DM.ADOStandardovsh_qty.IsNull = False then
        total_billingquantity := total_billingquantity + DM.ADOStandardovsh_qty.Value ;
      if  dm.ADOStandardRUSH_CHARGE_AMOUNT.IsNull = False then
        total_makeInvoiceAmoun := total_makeInvoiceAmoun + dm.ADOStandardRUSH_CHARGE_AMOUNT.Value;
      if DM.ADOStandardamt_shipped.IsNull = False then
        total_Amount := total_Amount + DM.ADOStandardamt_shipped.Value  ;
      if  DM.ADOStandarddelivery_price.IsNull = False then
        total_NoAmount := total_NoAmount +  DM.ADOStandarddelivery_price.value;
      DM.ADOStandard.Next;
      if Cells[1,i]<>DM.ADOStandardCUST_CODE.Value then
      begin
        RowCount:=RowCount+1;
        Cells[2,i+1]:= Cells[2,i];
        Cells[str_list.IndexOfName('出货数量'        ),i+1]:=IntToStr(total_Number);
      //  ShowMessage(IntToStr(str_list.IndexOfName('出货数量'        )));
        Cells[str_list.IndexOfName('已开票数量'      ),i+1]:=IntToStr(total_billingquantity);
        Cells[str_list.IndexOfName('开票金额'        ),i+1]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[str_list.IndexOfName('出货金额(含税)'  ),i+1]:=FormatFloat('0.00',total_Amount);
        Cells[str_list.IndexOfName('出货金额(不含税)'),i+1]:=FormatFloat('0.00',total_NoAmount);
        total_Number:=0;
        total_billingquantity:=0;
        total_Amount:=0;
        total_makeInvoiceAmoun:=0;
        total_NoAmount:=0;
        i:=i+2;
      end
      else
        i:=i+1;
      RowCount:=RowCount+1;
    end;
  end;
end;

procedure TFrm_Main.Tool(Sender: TObject);
var
  j:Integer;
begin
  with Frm_Result.SGrd do
  begin
    if RowCount>2 then
    begin
      if Cells[1,i-1]<>DM.ADOToolCUST_CODE.Value then
      begin
        Cells[2,i]:=Cells[2,i-1];
        Cells[str_list.IndexOfName('出货数量'        ),i]:=IntToStr(total_Number);
        Cells[str_list.IndexOfName('已开票数量'      ),i]:=IntToStr(total_billingquantity);
        Cells[str_list.IndexOfName('开票金额'        ),i]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[str_list.IndexOfName('出货金额(含税)'  ),i]:=FormatFloat('0.00',total_Amount);
        Cells[str_list.IndexOfName('出货金额(不含税)'),i]:=FormatFloat('0.00',total_NoAmount);
      {  Cells[23,i]:=IntToStr(total_Number);
        Cells[24,i]:=IntToStr(total_billingquantity);
        Cells[27,i]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[28,i]:=FormatFloat('0.00',total_Amount);
        Cells[29,i]:=FormatFloat('0.00',total_NoAmount);  }
        total_Number:=0;
        total_billingquantity:=0;
        total_Amount:=0;
        total_makeInvoiceAmoun:=0;
        total_NoAmount:=0;
        i:=i+1;
        RowCount:=RowCount+1;
      end;
    end;
  end;
  while not DM.ADOTool.Eof do
  begin
    with Frm_Result.SGrd do
    begin
      for j := 0 to str_list.Count -1 do
      begin
        if DM.ADOTool.FieldByName(str_list.Values[Cells[j,0]]).IsNull = False then
        Cells[j,i] := DM.ADOTool.FieldByName(str_list.Values[Cells[j,0]]).Value;
        if UpperCase(str_list.Values[Cells[j,0]]) =  UpperCase('GLPTR_STATUS') then //应收是否已开票
        if DM.ADOTool.FieldByName(str_list.Values[Cells[j,0]]).AsBoolean then
          Cells[j,i] := '是'
        else
          Cells[j,i] := '否';
      end;
      if  DM.ADOToolquan_shipped.IsNull = False then
        total_Number := total_Number + DM.ADOToolquan_shipped.AsInteger;
      if  DM.ADOToolovsh_qty.IsNull = False then
        total_billingquantity := total_billingquantity + DM.ADOToolovsh_qty.Value ;
      if  dm.ADOToolRUSH_CHARGE_AMOUNT.IsNull = False then
        total_makeInvoiceAmoun := total_makeInvoiceAmoun + dm.ADOToolRUSH_CHARGE_AMOUNT.Value;
      if DM.ADOToolamt_shipped.IsNull = False then
        total_Amount := total_Amount + DM.ADOToolamt_shipped.Value  ;
      if  DM.ADOTooldelivery_price.IsNull = False then
        total_NoAmount := total_NoAmount +  DM.ADOTooldelivery_price.value;
    {  Cells[0,i]:=DM.ADOToolreq_no.Text;
      Cells[1,i]:=DM.ADOToolCUST_CODE.Value;
      Cells[2,i]:=DM.ADOToolABBR_NAME.Value;
      Cells[3,i]:=DM.ADOToolCUSTOMER_NAME.Value;
      Cells[4,i]:=DM.ADOToolinvoice_number.Value;
      Cells[5,i]:=DM.ADOToolCURR_CODE.Value;
      Cells[6,i]:=DM.ADOToolEXCHANGE_RATE.Text;
      Cells[7,i]:=DM.ADOToolPOSTED_DATE.Text;
      Cells[8,i]:=DM.ADOToolINVOICE_DATE.Text;
      Cells[9,i]:=DM.ADOToolINVOICE_TOTAL.Text;
      Cells[10,i]:=DM.ADOToolamount_paid.Text;
      Cells[11,i]:=DM.ADOToolamt_payable.Text;
      Cells[12,i]:=DM.ADOToolPO_NUMBER.Value;
      Cells[13,i]:=DM.ADOToolMANU_PART_NUMBER.Value;
      Cells[14,i]:=DM.ADOToolMANU_PART_DESC.Value;
      Cells[15,i]:=DM.ADOToolANALYSIS_CODE_2.Value;
      Cells[16,i]:=DM.ADOToolLAYERS.Text;
      Cells[17,i]:=DM.ADOToolPRODUCT_NAME.Value;
      Cells[18,i]:=DM.ADOToolANALYSIS_CODE_1.Value;
      Cells[19,i]:=DM.ADOToolunit_sq.Text;
      Cells[20,i]:=DM.ADOTooldelivery_no.Value;
      Cells[21,i]:=DM.ADOToolSALES_ORDER.Value;
      Cells[22,i]:=DM.ADOToolDATE_SHIPPED.Text;
      Cells[23,i]:=DM.ADOToolquan_shipped.Text;
      if Cells[23,i]<>'' then
        total_Number:=total_Number+StrToInt(Cells[23,i])
      else
        total_Number:=0;
      Cells[24,i]:=DM.ADOToolovsh_qty.Text;
      if Cells[24,i]<>'' then
        total_billingquantity:=total_billingquantity+StrToInt(Cells[24,i])
      else
        total_billingquantity:=0;
      Cells[25,i]:=DM.ADOToolPARTS_ALLOC.Text;
      Cells[26,i]:=DM.ADOToolTAX_2.Text;
      Cells[27,i]:=DM.ADOToolRUSH_CHARGE_AMOUNT.Text;
      if Cells[27,i]<>'' then
        total_makeInvoiceAmoun:=total_makeInvoiceAmoun+StrToFloat(Cells[27,i])
      else
        total_makeInvoiceAmoun:=0;
      Cells[28,i]:=DM.ADOToolamt_shipped.Text;
      if Cells[28,i]<>'' then
        total_Amount:= total_Amount+StrToFloat(Cells[28,i])
      else
        total_Amount:= 0;
      Cells[29,i]:=DM.ADOTooldelivery_price.Text;
      total_NoAmount:=total_NoAmount+StrToFloat(Cells[29,i]);
      Cells[30,i]:=DM.ADOToolMISC_INV_DESCRIPTION.Value;
      Cells[31,i]:=DM.ADOToolcost_2.Text;
      if DM.ADOToolGLPTR_STATUS.Text='False' then
        Cells[32,i]:='否'
      else
        Cells[32,i]:='是';
      Cells[33,i]:=DM.ADOToolso_tp.Value;
      Cells[34,i]:=DM.ADOToolSupp_name.Value;
      Cells[35,i]:=DM.ADOToolREF_NUMBER.Value;
      Cells[36,i]:=DM.ADOToolcust_decl.Value;
      Cells[37,i]:='工具发票';
      Cells[38,i]:=DM.ADOToolPARTS_ORDERED.Text;
      Cells[39,i]:=DM.ADOToolFactory_name.Value;
      Cells[40,i]:=DM.ADOToolassign_type.Value;//2013-10-22tang添加----
      Cells[41,i]:=DM.ADOToolrate_margin.Text;//2013-12-3tang添加----
      Cells[42,i]:=DM.ADOToolORIG_CUSTOMER.Value;
      Cells[43,i]:=DM.ADOToolsttype.Value; }
      DM.ADOTool.Next;
      if Cells[1,i]<>DM.ADOToolCUST_CODE.Value then
      begin
        RowCount:=RowCount+1;
        Cells[2,i+1]:=Cells[2,i];
        Cells[str_list.IndexOfName('出货数量'        ),i+1]:=IntToStr(total_Number);
        Cells[str_list.IndexOfName('已开票数量'      ),i+1]:=IntToStr(total_billingquantity);
        Cells[str_list.IndexOfName('开票金额'        ),i+1]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[str_list.IndexOfName('出货金额(含税)'  ),i+1]:=FormatFloat('0.00',total_Amount);
        Cells[str_list.IndexOfName('出货金额(不含税)'),i+1]:=FormatFloat('0.00',total_NoAmount);        
       { Cells[23,i+1]:=IntToStr(total_Number);
        Cells[24,i+1]:=IntToStr(total_billingquantity);
        Cells[27,i+1]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[28,i+1]:=FormatFloat('0.00',total_Amount);
        Cells[29,i+1]:=FormatFloat('0.00',total_NoAmount);  }
        total_Number:=0;
        total_billingquantity:=0;
        total_Amount:=0;
        total_makeInvoiceAmoun:=0;
        total_NoAmount:=0;
        i:=i+2;
      end
      else
        i:=i+1;
      RowCount:=RowCount+1;
    end;
  end;
end;

procedure TFrm_Main.Sundry(Sender: TObject);
var
  j:Integer;
begin
  with Frm_Result.SGrd do
  begin
    if RowCount>2 then
    begin
      if Cells[1,i-1]<>DM.ADOSundryCUST_CODE.Value then
      begin
        Cells[2,i]:=Cells[2,i-1];
        Cells[str_list.IndexOfName('出货数量'        ),i]:=IntToStr(total_Number);
        Cells[str_list.IndexOfName('已开票数量'      ),i]:=IntToStr(total_billingquantity);
        Cells[str_list.IndexOfName('开票金额'        ),i]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[str_list.IndexOfName('出货金额(含税)'  ),i]:=FormatFloat('0.00',total_Amount);
        Cells[str_list.IndexOfName('出货金额(不含税)'),i]:=FormatFloat('0.00',total_NoAmount);
       { Cells[23,i]:=IntToStr(total_Number);
        Cells[24,i]:=IntToStr(total_billingquantity);
        Cells[27,i]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[28,i]:=FormatFloat('0.00',total_Amount);
        Cells[29,i]:=FormatFloat('0.00',total_NoAmount);   }
        total_Number:=0;
        total_billingquantity:=0;
        total_Amount:=0;
        total_makeInvoiceAmoun:=0;
        total_NoAmount:=0;
        i:=i+1;
        RowCount:=RowCount+1;
      end;
    end;
  end;
  while not DM.ADOSundry.Eof do
  begin
    with Frm_Result.SGrd do
    begin
      for j := 0 to str_list.Count -1 do
      begin
        if DM.ADOSundry.FieldByName(str_list.Values[Cells[j,0]]).IsNull = False then
        Cells[j,i] := DM.ADOSundry.FieldByName(str_list.Values[Cells[j,0]]).Value;
        if UpperCase(str_list.Values[Cells[j,0]]) =  UpperCase('GLPTR_STATUS') then //应收是否已开票
        if DM.ADOSundry.FieldByName(str_list.Values[Cells[j,0]]).AsBoolean then
          Cells[j,i] := '是'
        else
          Cells[j,i] := '否';
      end;
      if  DM.ADOSundryquan_shipped.IsNull = False then
        total_Number := total_Number + DM.ADOSundryquan_shipped.AsInteger;
      if  DM.ADOSundryovsh_qty.IsNull = False then
        total_billingquantity := total_billingquantity + DM.ADOSundryovsh_qty.Value ;
      if  dm.ADOSundryRUSH_CHARGE_AMOUNT.IsNull = False then
        total_makeInvoiceAmoun := total_makeInvoiceAmoun + dm.ADOSundryRUSH_CHARGE_AMOUNT.Value;
      if DM.ADOSundryamt_shipped.IsNull = False then
        total_Amount := total_Amount + DM.ADOSundryamt_shipped.Value  ;
      if  DM.ADOSundrydelivery_price.IsNull = False then
        total_NoAmount := total_NoAmount +  DM.ADOSundrydelivery_price.value;
      {Cells[0,i]:=DM.ADOSundryreq_no.Text;
      Cells[1,i]:=DM.ADOSundryCUST_CODE.Value;
      Cells[2,i]:=DM.ADOSundryABBR_NAME.Value;
      Cells[3,i]:=DM.ADOSundryCUSTOMER_NAME.Value;
      Cells[4,i]:=DM.ADOSundryinvoice_number.Value;
      Cells[5,i]:=DM.ADOSundryCURR_CODE.Value;
      Cells[6,i]:=DM.ADOSundryEXCHANGE_RATE.Text;
      Cells[7,i]:=DM.ADOSundryPOSTED_DATE.Text;
      Cells[8,i]:=DM.ADOSundryINVOICE_DATE.Text;
      Cells[9,i]:=DM.ADOSundryINVOICE_TOTAL.Text;
      Cells[10,i]:=DM.ADOSundryamount_paid.Text;
      Cells[11,i]:=DM.ADOSundryamt_payable.Text;
      Cells[12,i]:=DM.ADOSundryPO_NUMBER.Text;
      Cells[13,i]:=DM.ADOSundryMANU_PART_NUMBER.Text;
      Cells[14,i]:=DM.ADOSundryMANU_PART_DESC.Text;
      Cells[15,i]:=DM.ADOSundryANALYSIS_CODE_2.Text;
      Cells[16,i]:=DM.ADOSundryLAYERS.Text;
      Cells[17,i]:=DM.ADOSundryPRODUCT_NAME.Text;
      Cells[18,i]:=DM.ADOSundryANALYSIS_CODE_1.Text;
      Cells[19,i]:=DM.ADOSundryunit_sq.Text;
      Cells[20,i]:=DM.ADOSundrydelivery_no.Text;
      Cells[21,i]:=DM.ADOSundrySALES_ORDER.Text;
      Cells[22,i]:=DM.ADOSundryDATE_SHIPPED.Text;
      Cells[23,i]:=DM.ADOSundryquan_shipped.Text;
      if Cells[23,i]<>'' then
        total_Number:=total_Number+StrToInt(Cells[23,i])
      else
        total_Number:=0;
      Cells[24,i]:=DM.ADOSundryovsh_qty.Text;
      if Cells[24,i]<>'' then
        total_billingquantity:=total_billingquantity+StrToInt(Cells[24,i])
      else
        total_billingquantity:=0;
      Cells[25,i]:=DM.ADOSundryPARTS_ALLOC.Text;
      Cells[26,i]:=DM.ADOSundryTAX_2.Text;
      Cells[27,i]:=DM.ADOSundryRUSH_CHARGE_AMOUNT.Text;
      if Cells[27,i]<>'' then
        total_makeInvoiceAmoun:=total_makeInvoiceAmoun+StrToFloat(Cells[27,i])
      else
        total_makeInvoiceAmoun:=0;
      Cells[28,i]:=DM.ADOSundryamt_shipped.Text;
      if Cells[28,i]<>'' then
        total_Amount:= total_Amount+StrToFloat(Cells[28,i])
      else
        total_Amount:= 0;
      Cells[29,i]:=DM.ADOSundrydelivery_price.Text;
      total_NoAmount:=total_NoAmount+StrToFloat(Cells[29,i]);
      Cells[30,i]:=DM.ADOSundryMISC_INV_DESCRIPTION.Value;
      Cells[31,i]:=DM.ADOSundrycost_2.Text;
      if DM.ADOSundryGLPTR_STATUS.Text='False' then
        Cells[32,i]:='否'
      else
        Cells[32,i]:='是';
      Cells[33,i]:=DM.ADOSundryso_tp.Value;
      Cells[34,i]:=DM.ADOSundrySupp_name.Value;
      Cells[35,i]:=DM.ADOSundryREF_NUMBER.Value;
      Cells[36,i]:=DM.ADOSundrycust_decl.Value;
      Cells[37,i]:='杂项发票';
      Cells[38,i]:=DM.ADOSundryPARTS_ORDERED.Text;
      Cells[39,i]:=DM.ADOSundryFactory_name.Value;
      Cells[40,i]:=DM.ADOSundryassign_type.Value;//2013-10-22tang添加----
      Cells[41,i]:=DM.ADOSundryrate_margin.Text;//2013-12-3tang添加----
      Cells[42,i]:=DM.ADOSundryORIG_CUSTOMER.Value;
      Cells[43,i]:=DM.ADOSundrysttype.Value; }
      DM.ADOSundry.Next;
      if Cells[1,i]<>DM.ADOSundryCUST_CODE.Value then
      begin
        RowCount:=RowCount+1;
        Cells[2,i+1]:=Cells[2,i];
        Cells[str_list.IndexOfName('出货数量'        ),i+1]:=IntToStr(total_Number);
        Cells[str_list.IndexOfName('已开票数量'      ),i+1]:=IntToStr(total_billingquantity);
        Cells[str_list.IndexOfName('开票金额'        ),i+1]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[str_list.IndexOfName('出货金额(含税)'  ),i+1]:=FormatFloat('0.00',total_Amount);
        Cells[str_list.IndexOfName('出货金额(不含税)'),i+1]:=FormatFloat('0.00',total_NoAmount);
     {   Cells[23,i+1]:=IntToStr(total_Number);
        Cells[24,i+1]:=IntToStr(total_billingquantity);
        Cells[27,i+1]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[28,i+1]:=FormatFloat('0.00',total_Amount);
        Cells[29,i+1]:=FormatFloat('0.00',total_NoAmount);  }
        total_Number:=0;
        total_billingquantity:=0;
        total_Amount:=0;
        total_makeInvoiceAmoun:=0;
        total_NoAmount:=0;
        i:=i+2;
      end
      else
        i:=i+1;
      RowCount:=RowCount+1;
    end;
  end;
end;

procedure TFrm_Main.ReturnMemo(Sender: TObject);
var
  j:Integer;
begin
  with Frm_Result.SGrd do
  begin
    if RowCount>2 then
    if Cells[1,i-1]<>DM.ADOReturnMemoCUST_CODE.Value then
    begin
      Cells[2,i]:=Cells[2,i-1];
        Cells[str_list.IndexOfName('出货数量'        ),i]:=IntToStr(total_Number);
        Cells[str_list.IndexOfName('已开票数量'      ),i]:=IntToStr(total_billingquantity);
        Cells[str_list.IndexOfName('开票金额'        ),i]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[str_list.IndexOfName('出货金额(含税)'  ),i]:=FormatFloat('0.00',total_Amount);
        Cells[str_list.IndexOfName('出货金额(不含税)'),i]:=FormatFloat('0.00',total_NoAmount);
      {Cells[23,i]:=IntToStr(total_Number);
      Cells[24,i]:=IntToStr(total_billingquantity);
      Cells[27,i]:=FormatFloat('0.00',total_makeInvoiceAmoun);
      Cells[28,i]:=FormatFloat('0.00',total_Amount);
      Cells[29,i]:=FormatFloat('0.00',total_NoAmount);   }
      total_Number:=0;
      total_billingquantity:=0;
      total_Amount:=0;
      total_makeInvoiceAmoun:=0;
      total_NoAmount:=0;
      i:=i+1;
      RowCount:=RowCount+1;
    end;
  end;
  while not DM.ADOReturnMemo.Eof do
  begin
    with Frm_Result.SGrd do
    begin
      for j := 0 to str_list.Count -1 do
      begin
        if DM.ADOReturnMemo.FieldByName(str_list.Values[Cells[j,0]]).IsNull = False then
        Cells[j,i] := DM.ADOReturnMemo.FieldByName(str_list.Values[Cells[j,0]]).Value;
        if UpperCase(str_list.Values[Cells[j,0]]) =  UpperCase('GLPTR_STATUS') then //应收是否已开票
        if DM.ADOReturnMemo.FieldByName(str_list.Values[Cells[j,0]]).AsBoolean then
          Cells[j,i] := '是'
        else
          Cells[j,i] := '否';
      end;
      if  DM.ADOReturnMemo.FieldByName('quan_shipped').IsNull = False then
        total_Number := total_Number + DM.ADOReturnMemo.FieldByName('quan_shipped').AsInteger;
      if  DM.ADOReturnMemo.FieldByName('ovsh_qty').IsNull = False then
        total_billingquantity := total_billingquantity + DM.ADOReturnMemo.FieldByName('ovsh_qty').Value ;
      if  DM.ADOReturnMemo.FieldByName('RUSH_CHARGE_AMOUNT').IsNull = False then
        total_makeInvoiceAmoun := total_makeInvoiceAmoun + DM.ADOReturnMemo.FieldByName('RUSH_CHARGE_AMOUNT').Value;
      if DM.ADOReturnMemo.FieldByName('amt_shipped').IsNull = False then
        total_Amount := total_Amount + DM.ADOReturnMemo.FieldByName('amt_shipped').Value  ;
      if  DM.ADOReturnMemo.FieldByName('delivery_price').IsNull = False then
        total_NoAmount := total_NoAmount +  DM.ADOReturnMemo.FieldByName('delivery_price').value;
     { Cells[0,i]:=DM.ADOReturnMemoreq_no.Text;
      Cells[1,i]:=DM.ADOReturnMemoCUST_CODE.Value;
      Cells[2,i]:=DM.ADOReturnMemoABBR_NAME.Value;
      Cells[3,i]:=DM.ADOReturnMemoCUSTOMER_NAME.Value;
      Cells[4,i]:=DM.ADOReturnMemoinvoice_number.Value;
      Cells[5,i]:=DM.ADOReturnMemoCURR_CODE.Value;
      Cells[6,i]:=DM.ADOReturnMemoexchange_rate.Text;
      Cells[7,i]:=DM.ADOReturnMemoPOSTED_DATE.Text;
      Cells[8,i]:=DM.ADOReturnMemoINVOICE_DATE.Text;
      Cells[9,i]:=DM.ADOReturnMemoINVOICE_TOTAL.Text;
      Cells[10,i]:=DM.ADOReturnMemoamount_paid.Text;
      Cells[11,i]:=DM.ADOReturnMemoamt_payable.Text;
      Cells[12,i]:=DM.ADOReturnMemoPO_NUMBER.Value;
      Cells[13,i]:=DM.ADOReturnMemoMANU_PART_NUMBER.Value;
      Cells[14,i]:=DM.ADOReturnMemoMANU_PART_DESC.Value;
      Cells[15,i]:=DM.ADOReturnMemoANALYSIS_CODE_2.Value;
      Cells[16,i]:=DM.ADOReturnMemoLAYERS.Text;
      Cells[17,i]:=DM.ADOReturnMemoPRODUCT_NAME.Value;
      Cells[18,i]:=DM.ADOReturnMemoANALYSIS_CODE_1.Value;
      Cells[19,i]:=DM.ADOReturnMemounit_sq.Text;
      Cells[20,i]:=DM.ADOReturnMemodelivery_no.Value;
      Cells[21,i]:=DM.ADOReturnMemoSALES_ORDER.Value;
      Cells[22,i]:=DM.ADOReturnMemoDATE_SHIPPED.Text;
      Cells[23,i]:=DM.ADOReturnMemoquan_shipped.Text;
      if Cells[23,i]<>'' then
        total_Number:=total_Number+StrToInt(Cells[23,i])
      else
        total_Number:=0;
      Cells[24,i]:=DM.ADOReturnMemoovsh_qty.Text;
      if Cells[24,i]<>'' then
        total_billingquantity:=total_billingquantity+StrToInt(Cells[24,i])
      else
        total_billingquantity:=0;
      Cells[25,i]:=DM.ADOReturnMemoPARTS_ALLOC.Text;
      Cells[26,i]:=DM.ADOReturnMemoTAX_2.Text;
      Cells[27,i]:=DM.ADOReturnMemoRUSH_CHARGE_AMOUNT.Text;
      if Cells[27,i]<>'' then
        total_makeInvoiceAmoun:=total_makeInvoiceAmoun+StrToFloat(Cells[27,i])
      else
        total_makeInvoiceAmoun:=0;
      Cells[28,i]:=DM.ADOReturnMemoamt_shipped.Text;
      if Cells[28,i]<>'' then
        total_Amount:= total_Amount+StrToFloat(Cells[28,i])
      else
        total_Amount:= 0;
      Cells[29,i]:=DM.ADOReturnMemodelivery_price.Text;
      total_NoAmount:=total_NoAmount+StrToFloat(Cells[29,i]);
      Cells[30,i]:=DM.ADOReturnMemoMISC_INV_DESCRIPTION.Value;
      Cells[31,i]:=DM.ADOReturnMemocost_2.AsString;
      if not DM.ADOReturnMemoGLPTR_STATUS.Value then
        Cells[32,i]:='否'
      else
        Cells[32,i]:='是';
      Cells[33,i]:=DM.ADOReturnMemoso_tp.Value;
      Cells[34,i]:=DM.ADOReturnMemoSupp_name.Value;
      Cells[35,i]:=DM.ADOReturnMemoREF_NUMBER.Value;
      Cells[36,i]:=DM.ADOReturnMemocust_decl.Value;
      Cells[37,i]:='退货备忘';
      Cells[38,i]:=DM.ADOReturnMemoPARTS_ORDERED.Text;
      Cells[39,i]:=DM.ADOReturnMemoFactory_name.Value;
      Cells[40,i]:=DM.ADOReturnMemoassign_type.Value; //2013-10-22tang添加----
      Cells[41,i]:=DM.ADOReturnMemorate_margin.Text;  //2013-12-3tang添加----
      Cells[42,i]:=DM.ADOReturnMemoORIG_CUSTOMER.Value;
      Cells[43,i]:=DM.ADOReturnMemosttype.Value; }
      DM.ADOReturnMemo.Next;
      if Cells[1,i]<>DM.ADOReturnMemoCUST_CODE.Value then
      begin
        RowCount:=RowCount+1;
        Cells[2,i+1]:=Cells[2,i];
        Cells[str_list.IndexOfName('出货数量'        ),i+1]:=IntToStr(total_Number);
        Cells[str_list.IndexOfName('已开票数量'      ),i+1]:=IntToStr(total_billingquantity);
        Cells[str_list.IndexOfName('开票金额'        ),i+1]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[str_list.IndexOfName('出货金额(含税)'  ),i+1]:=FormatFloat('0.00',total_Amount);
        Cells[str_list.IndexOfName('出货金额(不含税)'),i+1]:=FormatFloat('0.00',total_NoAmount);
      {  Cells[23,i+1]:=IntToStr(total_Number);
        Cells[24,i+1]:=IntToStr(total_billingquantity);
        Cells[27,i+1]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[28,i+1]:=FormatFloat('0.00',total_Amount);
        Cells[29,i+1]:=FormatFloat('0.00',total_NoAmount); }
        total_Number:=0;
        total_billingquantity:=0;
        total_Amount:=0;
        total_makeInvoiceAmoun:=0;
        total_NoAmount:=0;
        i:=i+2;
      end
      else
        i:=i+1;
      RowCount:=RowCount+1;
    end;
  end;
end;

procedure TFrm_Main.NoReturnMemo(Sender: TObject);
var
  j:Integer;
begin
  with Frm_Result.SGrd do
  begin
    if RowCount>2 then
    begin
      if Cells[1,i-1]<>DM.ADONoReturnMemoCUST_CODE.Value then
      begin
        Cells[2,i]:=Cells[2,i-1];
        Cells[str_list.IndexOfName('出货数量'        ),i]:=IntToStr(total_Number);
        Cells[str_list.IndexOfName('已开票数量'      ),i]:=IntToStr(total_billingquantity);
        Cells[str_list.IndexOfName('开票金额'        ),i]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[str_list.IndexOfName('出货金额(含税)'  ),i]:=FormatFloat('0.00',total_Amount);
        Cells[str_list.IndexOfName('出货金额(不含税)'),i]:=FormatFloat('0.00',total_NoAmount);
     {   Cells[23,i]:=IntToStr(total_Number);
        Cells[24,i]:=IntToStr(total_billingquantity);
        Cells[27,i]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[28,i]:=FormatFloat('0.00',total_Amount);
        Cells[29,i]:=FormatFloat('0.00',total_NoAmount); }
        total_Number:=0;
        total_billingquantity:=0;
        total_Amount:=0;
        total_makeInvoiceAmoun:=0;
        total_NoAmount:=0;
        i:=i+1;
        RowCount:=RowCount+1;
      end;
    end;
  end;
  while not DM.ADONoReturnMemo.Eof do
  begin
    with Frm_Result.SGrd do
    begin
      for j := 0 to str_list.Count -1 do
      begin
        if DM.ADONoReturnMemo.FieldByName(str_list.Values[Cells[j,0]]).IsNull = False then
        Cells[j,i] := DM.ADONoReturnMemo.FieldByName(str_list.Values[Cells[j,0]]).Value;
        if UpperCase(str_list.Values[Cells[j,0]]) =  UpperCase('GLPTR_STATUS') then  // 应收是否已开票
        if DM.ADONoReturnMemo.FieldByName(str_list.Values[Cells[j,0]]).AsBoolean then
          Cells[j,i] := '是'
        else
          Cells[j,i] := '否';
      end;
      if  DM.ADONoReturnMemo.FieldByName('quan_shipped').IsNull = False then
        total_Number := total_Number + DM.ADONoReturnMemo.FieldByName('quan_shipped').AsInteger;
      if  DM.ADONoReturnMemo.FieldByName('ovsh_qty').IsNull = False then
        total_billingquantity := total_billingquantity + DM.ADONoReturnMemo.FieldByName('ovsh_qty').Value ;
      if  DM.ADONoReturnMemo.FieldByName('RUSH_CHARGE_AMOUNT').IsNull = False then
        total_makeInvoiceAmoun := total_makeInvoiceAmoun + DM.ADONoReturnMemo.FieldByName('RUSH_CHARGE_AMOUNT').Value;
      if DM.ADONoReturnMemo.FieldByName('amt_shipped').IsNull = False then
        total_Amount := total_Amount + DM.ADONoReturnMemo.FieldByName('amt_shipped').Value  ;
      if  DM.ADONoReturnMemo.FieldByName('delivery_price').IsNull = False then
        total_NoAmount := total_NoAmount +  DM.ADONoReturnMemo.FieldByName('delivery_price').value;
    {  Cells[0,i]:=DM.ADONoReturnMemoreq_no.Text;
      Cells[1,i]:=DM.ADONoReturnMemoCUST_CODE.Value;
      Cells[2,i]:=DM.ADONoReturnMemoABBR_NAME.Value;
      Cells[3,i]:=DM.ADONoReturnMemoCUSTOMER_NAME.Value;
      Cells[4,i]:=DM.ADONoReturnMemoinvoice_number.Value;
      Cells[5,i]:=DM.ADONoReturnMemoCURR_CODE.Value;
      Cells[6,i]:=DM.ADONoReturnMemoEXCHANGE_RATE.Text;
      Cells[7,i]:=DM.ADONoReturnMemoPOSTED_DATE.Text;
      Cells[8,i]:=DM.ADONoReturnMemoINVOICE_DATE.Text;
      Cells[9,i]:=DM.ADONoReturnMemoINVOICE_TOTAL.Text;
      Cells[10,i]:=DM.ADONoReturnMemoamount_paid.Text;
      Cells[11,i]:=DM.ADONoReturnMemoamt_payable.Text;
      Cells[12,i]:=DM.ADONoReturnMemoPO_NUMBER.Text;
      Cells[13,i]:=DM.ADONoReturnMemoMANU_PART_NUMBER.Text;
      Cells[14,i]:=DM.ADONoReturnMemoMANU_PART_DESC.Text;
      Cells[15,i]:=DM.ADONoReturnMemoANALYSIS_CODE_2.Text;
      Cells[16,i]:=DM.ADONoReturnMemoLAYERS.Text;
      Cells[17,i]:=DM.ADONoReturnMemoPRODUCT_NAME.Text;
      Cells[18,i]:=DM.ADONoReturnMemoANALYSIS_CODE_1.Text;
      Cells[19,i]:=DM.ADONoReturnMemounit_sq.Text;
      Cells[20,i]:=DM.ADONoReturnMemodelivery_no.Value;
      Cells[21,i]:=DM.ADONoReturnMemoSALES_ORDER.Text;
      Cells[22,i]:=DM.ADONoReturnMemoDATE_SHIPPED.Text;
      Cells[23,i]:=DM.ADONoReturnMemoquan_shipped.Text;
      if Cells[23,i]<>'' then
        total_Number:=total_Number+StrToInt(Cells[23,i])
      else
        total_Number:=0;
      Cells[24,i]:=DM.ADONoReturnMemoovsh_qty.Text;
      if Cells[24,i]<>'' then
        total_billingquantity:=total_billingquantity+StrToInt(Cells[24,i])
      else
        total_billingquantity:=0;
      Cells[25,i]:=DM.ADONoReturnMemoPARTS_ALLOC.Text;
      Cells[26,i]:=DM.ADONoReturnMemotax_2.Text;
      Cells[27,i]:=DM.ADONoReturnMemoRUSH_CHARGE_AMOUNT.Text;
      if Cells[27,i]<>'' then
        total_makeInvoiceAmoun:=total_makeInvoiceAmoun+StrToFloat(Cells[27,i])
      else
        total_makeInvoiceAmoun:=0;
      Cells[28,i]:=DM.ADONoReturnMemoamt_shipped.Text;
      if Cells[28,i]<>'' then
        total_Amount:= total_Amount+StrToFloat(Cells[28,i])
      else
        total_Amount:= 0;
      Cells[29,i]:=DM.ADONoReturnMemodelivery_price.Text;
      total_NoAmount:=total_NoAmount+StrToFloat(Cells[29,i]);
      Cells[30,i]:=DM.ADONoReturnMemoMISC_INV_DESCRIPTION.Value;
      Cells[31,i]:=DM.ADONoReturnMemocost_2.Text;
      if DM.ADONoReturnMemoGLPTR_STATUS.Text='False' then
        Cells[32,i]:='否'
      else
        Cells[32,i]:='是';
      Cells[33,i]:=DM.ADONoReturnMemoso_tp.Value;
      Cells[34,i]:=DM.ADONoReturnMemoSupp_name.Value;
      Cells[35,i]:=DM.ADONoReturnMemoREF_NUMBER.Value;
      Cells[36,i]:=DM.ADONoReturnMemocust_decl.Value;
      Cells[37,i]:='无退货备忘';
      Cells[38,i]:=DM.ADONoReturnMemoPARTS_ORDERED.Text;
      Cells[39,i]:=DM.ADONoReturnMemoFactory_name.Value;
      Cells[40,i]:=DM.ADONoReturnMemoassign_type.Value;//2013-10-22tang添加----
      Cells[41,i]:=DM.ADONoReturnMemorate_margin.Text;//2013-12-3tang添加----
      Cells[42,i]:=DM.ADONoReturnMemoORIG_CUSTOMER.Value;
      Cells[43,i]:=DM.ADONoReturnMemosttype.Value;  }
      DM.ADONoReturnMemo.Next;
      if Cells[1,i]<>DM.ADONoReturnMemoCUST_CODE.Value then
      begin
        RowCount:=RowCount+1;
        Cells[2,i+1]:=Cells[2,i];
        Cells[str_list.IndexOfName('出货数量'        ),i+1]:=IntToStr(total_Number);
        Cells[str_list.IndexOfName('已开票数量'      ),i+1]:=IntToStr(total_billingquantity);
        Cells[str_list.IndexOfName('开票金额'        ),i+1]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[str_list.IndexOfName('出货金额(含税)'  ),i+1]:=FormatFloat('0.00',total_Amount);
        Cells[str_list.IndexOfName('出货金额(不含税)'),i+1]:=FormatFloat('0.00',total_NoAmount);
      {  Cells[23,i+1]:=IntToStr(total_Number);
        Cells[24,i+1]:=IntToStr(total_billingquantity);
        Cells[27,i+1]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[28,i+1]:=FormatFloat('0.00',total_Amount);
        Cells[29,i+1]:=FormatFloat('0.00',total_NoAmount);  }
        total_Number:=0;
        total_billingquantity:=0;
        total_Amount:=0;
        total_makeInvoiceAmoun:=0;
        total_NoAmount:=0;
        i:=i+2;
      end
      else
        i:=i+1;
      RowCount:=RowCount+1;
    end;
  end;
end;
procedure TFrm_Main.BitBtn2Click(Sender: TObject);
begin
  Frm_Customer:=TFrm_Customer.Create(Application);
  with DM.ADO10 do
  begin
    Close;
    Parameters[0].Value:='';
    if Trim(Edit2.Text)<>'' then
      Parameters[0].Value:=Trim(Edit2.Text)
    else
      Parameters[0].Value:='';
    Open;
    if IsEmpty then
    begin
      ShowMessage('请输入正确的客户代码');
      Edit2.Text:='';
      Edit2.SetFocus;
      Exit;
    end;
  end;
  if Frm_Customer.ShowModal=mrok then
  begin
    Edit2.Text:=DM.ADO10CUST_CODE.Value;
    Label4.Caption:=DM.ADO10CUSTOMER_NAME.Value
  end;
end;

procedure TFrm_Main.Edit1Change(Sender: TObject);
begin
  if DM.qry_010.Active =False then
  DM.qry_010.Open;

  with  Sender as TEdit do
  begin
//    Label3.Caption:='';
//    Label4.Caption:='';

    if DM.qry_010.Locate('CUST_CODE',Trim(Text),[]) then
    begin
      if Name='Edit1'    then
      begin
        Label3.Caption := DM.qry_010.FieldByName('CUSTOMER_NAME').AsString;

      end
      else
      begin
        Label4.Caption := DM.qry_010.FieldByName('CUSTOMER_NAME').AsString;

      end
    end
    else
    begin
      if Name='Edit1'    then
      begin
        Label3.Caption := '';

      end
      else
      begin
        Label4.Caption := '';

      end
    end;
  end;

//  Label3.Caption:='';
//  Label4.Caption:='';
//  with DM.ADO10_1 do
//  begin
//    Close;
//    Parameters[0].Value:='';
//    if Trim((Sender as TEdit).Text)<>'' then
//      Parameters[0].Value:=Trim((Sender as TEdit).Text)
//    else
//      Parameters[0].Value:='';
//    Open;
//    if IsEmpty then
//    begin
//      ShowMessage('请输入正确的客户代码');
//      (Sender as TEdit).Text:='';
//      (Sender as TEdit).SetFocus;
//      Exit;
//    end;
//  end;
//  if Trim((Sender as TEdit).Text)='' then
//  begin
//    (Sender as TEdit).Text:='';
//    if (Sender as TEdit).Name='Edit1' then
//      Label3.Caption:=''
//    else
//      Label4.Caption:='';
//  end
//  else
//  begin
//    (Sender as TEdit).Text:=DM.ADO10_1CUST_CODE.Value;
//    if (Sender as TEdit).Name='Edit1' then
//      Label3.Caption:=DM.ADO10_1CUSTOMER_NAME.Value
//    else
//      Label4.Caption:=DM.ADO10_1CUSTOMER_NAME.Value;
//  end;
end;

procedure TFrm_Main.FormDestroy(Sender: TObject);
begin
  str_list.Free;
end;

end.
