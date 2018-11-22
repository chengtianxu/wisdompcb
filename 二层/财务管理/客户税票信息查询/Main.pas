unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons,DateUtils, ExtCtrls,DB;

type
  TFrm_Main = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    ComboBox1: TComboBox;
    dtpk1: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    dtpk2: TDateTimePicker;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox3: TGroupBox;
    rdo1: TRadioButton;
    rdo2: TRadioButton;
    GroupBox4: TGroupBox;
    CheckBox2: TCheckBox;
    rgOther: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn3Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    sortDate,longDate:TDateTime;
    total_Number,total_billingquantity:Integer;
    total_makeInvoiceAmoun,total_Amount:Double;
    rkey:array of Integer;
    procedure Standard(Sender: TObject);
    procedure Tool(Sender: TObject);
    procedure Sundry(Sender: TObject);
    procedure ReturnMemo(Sender: TObject);
    procedure NoReturnMemo(Sender: TObject);
    procedure TransferToGrid(StrType:string;DATASET:TDATASET);
  public
    { Public declarations }
    i:Integer;
  end;

var
  Frm_Main: TFrm_Main;

implementation

uses dmo, Customer, Result, common;

{$R *.dfm}

procedure TFrm_Main.FormShow(Sender: TObject);
begin
  i:=1;
  DM.ADOQueryDate.Active:=False;
  DM.ADOQueryDate.SQL.Text:='select getdate() as v_date';
  DM.ADOQueryDate.Active:=True;
  sortDate:=DM.ADOQueryDate.FieldValues['v_date'];
  dtpk1.Date:=sortDate-dayof(sortDate)+1;
  dtpk2.Date:=sortDate;
  DM.ADO10.Close;
  DM.ADO10.Parameters[0].Value:='';
  DM.ADO10.Open;
  DM.ADO10.First;
  Edit1.Text:=DM.ADO10cust_code.Value;
  Label3.Caption:=DM.ADO10customer_name.Value;
  DM.ADO10.Last;
  Edit2.Text:=DM.ADO10cust_code.Value;
  Label4.Caption:=DM.ADO10customer_name.Value;
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
    if Frm_Customer.ShowModal=mrok then
    begin
      Edit1.Text:=FieldValues['cust_code'];
      Label3.Caption:=FieldValues['customer_name'];
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
    if Frm_Customer.ShowModal=mrok then
    begin
      Edit2.Text:=FieldValues['cust_code'];
      Label4.Caption:=FieldValues['customer_name'];
    end;
  end;
end;

procedure TFrm_Main.Edit1Exit(Sender: TObject);
begin
  if Trim((Sender as TEdit).Text)='' then Exit;
  with DM.ADO10_1 do
  begin
    Close;
    Parameters[0].Value:='';
    if Trim((Sender as TEdit).Text)<>'' then
      Parameters[0].Value:=Trim((Sender as TEdit).Text)
    else
      Parameters[0].Value:='';
    Open;
    if IsEmpty then
    begin
      ShowMessage('请输入正确的客户代码');
      (Sender as TEdit).Text:='';
      (Sender as TEdit).SetFocus;
      Exit;
    end;
    if (Sender as TEdit).Name='Edit1' then
    begin
      Edit1.Text:=FieldValues['cust_code'];
      Label3.Caption:=FieldValues['customer_name'];
    end
    else
    begin
      Edit2.Text:=FieldValues['cust_code'];
      Label4.Caption:=FieldValues['customer_name'];
    end;
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

procedure TFrm_Main.BitBtn3Click(Sender: TObject);
var
  f,d,l:Integer;
begin
  f:=0;
  d:=0;
  total_Number:=0;
  total_billingquantity:=0;
  total_makeInvoiceAmoun:=0;
  total_Amount:=0;
  with DM.ADOQueryDate do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Text:='select count(*) as RowsCount from data0010 where cust_code>=:edit1 and cust_code<=:edit2';
    Parameters[0].Value:=Trim(Edit1.Text);
    Parameters[1].Value:=Trim(Edit2.Text);
    Active:=True;
    SetLength(rkey,StrToInt(FieldValues['RowsCount']));
  end;
  with DM.ADOQueryDate do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Text:='select rkey from data0010 where cust_code>=:edit1 and cust_code<=:edit2';
    Parameters[0].Value:=Trim(Edit1.Text);
    Parameters[1].Value:=Trim(Edit2.Text);
    Active:=True;
    while not Eof do
    begin
      rkey[f]:=FieldValues['rkey'];
      Next;
      f:=f+1;
    end;
  end;
  with TFrm_Result.Create(Application) do
  begin
//    if CheckBox2.Checked=False then      //彭华添加
    if rgOther.ItemIndex<>1 then
    with DM.ADOStandard do
    begin
      Close;
      if ComboBox1.ItemIndex=0 then
      begin
        SQL.Delete(34);
        SQL.Delete(33);
        SQL.Insert(33,'and Data0112.POSTED_DATE>=:dtpk1 and Data0112.POSTED_DATE<=:dtpk2');
      end;
      if ComboBox1.ItemIndex=1 then
      begin
        SQL.Delete(34);
        SQL.Delete(33);
        SQL.Insert(33,'and Data0112.INVOICE_DATE>=:dtpk1 and Data0112.INVOICE_DATE<=:dtpk2');
      end;
      if ComboBox1.ItemIndex=2 then
      begin
        SQL.Delete(34);
        SQL.Delete(33);
        SQL.Insert(33,'and Data0131.TAX_DATE>=:dtpk1 and Data0131.TAX_DATE<=:dtpk2');
      end;
      if ComboBox1.ItemIndex=3 then
      begin
        SQL.Delete(34);
        SQL.Delete(33);
        SQL.Insert(33,'and Data0105.ENTERED_DT>=:dtpk1 and Data0105.ENTERED_DT<=:dtpk2');
      end;
      Parameters[0].Value:=Trim(Edit1.Text);
      Parameters[1].Value:=Trim(Edit2.Text);
      Parameters[2].Value:=dtpk1.Date;
      Parameters[3].Value:=dtpk2.Date;
      if rdo1.Checked then
        SQL.Insert(34,' order by Data0010.CUST_CODE')
      else
        SQL.Insert(34,' order by Data0064.DATE_SHIPPED');
      Open;
      Frm_Result.SGrd.ColCount:=FieldCount;
    end;

    with DM.ADOTool do
    begin
      Close;
      if ComboBox1.ItemIndex=0 then
      begin
        SQL.Delete(24);
        SQL.Delete(23);
        SQL.Insert(23,'and Data0112.POSTED_DATE>=:dtpk1 and Data0112.POSTED_DATE<=:dtpk2');
        SQL.Insert(24, ' order by Data0010.CUST_CODE');
      end;
      if ComboBox1.ItemIndex=1 then
      begin
        SQL.Delete(24);
        SQL.Delete(23);
        SQL.Insert(23,'and Data0112.INVOICE_DATE>=:dtpk1 and Data0112.INVOICE_DATE<=:dtpk2');
        SQL.Insert(24, ' order by Data0010.CUST_CODE');
      end;
      if ComboBox1.ItemIndex=2 then
      begin
        SQL.Delete(24);
        SQL.Delete(23);
        SQL.Insert(23,'and Data0131.TAX_DATE>=:dtpk1 and Data0131.TAX_DATE<=:dtpk2');
        SQL.Insert(24, ' order by Data0010.CUST_CODE');
      end;
      if ComboBox1.ItemIndex=3 then
      begin
        SQL.Delete(24);
        SQL.Delete(23);
        SQL.Insert(23,'and Data0105.ENTERED_DT>=:dtpk1 and Data0105.ENTERED_DT<=:dtpk2');
        SQL.Insert(24, ' order by Data0010.CUST_CODE');
      end;

//      if CheckBox2.Checked then      //彭华添加
      if rgOther.ItemIndex=1 then
      begin
        SQL.Delete(21);
        SQL.Insert(21,' WHERE  isnull(Data0112.sales_order_ptr,null)<>'''' AND REVERSE_TRANS_FLAG=''N'' ');
      end
      else if rgOther.ItemIndex=0 then
      begin
        SQL.Delete(21);
        SQL.Insert(21,' WHERE  isnull(Data0112.sales_order_ptr,null)<>'''' AND REVERSE_TRANS_FLAG=''Y'' ');
      end
      else
      begin
        SQL.Delete(21);
        SQL.Insert(21,' WHERE  isnull(Data0112.sales_order_ptr,null)<>'''' ');
      end;

      Parameters[0].Value:=Trim(Edit1.Text);
      Parameters[1].Value:=Trim(Edit2.Text);
      Parameters[2].Value:=dtpk1.Date;
      Parameters[3].Value:=dtpk2.Date;
      Open;
    //  ShowMessage(SQL.Text);
      Frm_Result.SGrd.ColCount:=FieldCount;
    end;

    with DM.ADOSundry do
    begin
      Close;
      if ComboBox1.ItemIndex=0 then
      begin
        SQL.Delete(20);
        SQL.Delete(19);
        SQL.Insert(19,'and Data0112.POSTED_DATE>=:dtpk1 and Data0112.POSTED_DATE<=:dtpk2');
        SQL.Insert(20,' order by Data0010.CUST_CODE');
      end;
      if ComboBox1.ItemIndex=1 then
      begin
        SQL.Delete(20);
        SQL.Delete(19);
        SQL.Insert(19,'and Data0112.INVOICE_DATE>=:dtpk1 and Data0112.INVOICE_DATE<=:dtpk2');
        SQL.Insert(20,' order by Data0010.CUST_CODE');
      end;
      if ComboBox1.ItemIndex=2 then
      begin
        SQL.Delete(20);
        SQL.Delete(19);
        SQL.Insert(19,'and Data0131.TAX_DATE>=:dtpk1 and Data0131.TAX_DATE<=:dtpk2');
        SQL.Insert(20,' order by Data0010.CUST_CODE');
      end;
      if ComboBox1.ItemIndex=3 then
      begin
        SQL.Delete(20);
        SQL.Delete(19);
        SQL.Insert(19,'and Data0105.ENTERED_DT>=:dtpk1 and Data0105.ENTERED_DT<=:dtpk2');
        SQL.Insert(20,' order by Data0010.CUST_CODE');
      end;

//      if CheckBox2.Checked then      //彭华添加
      if rgOther.ItemIndex=1 then
      begin
        SQL.Delete(18);
        SQL.Insert(18,' WHERE  reverse_trans_flag=''N'' and Data0112.sales_order_ptr is null AND (Data0010.CUST_CODE >=:edit1) AND (Data0010.CUST_CODE <=:edit2)');
      end
      else if rgOther.ItemIndex=0 then
      begin
        SQL.Delete(18);
        SQL.Insert(18,' WHERE  reverse_trans_flag=''Y'' and Data0112.sales_order_ptr is null AND (Data0010.CUST_CODE >=:edit1) AND (Data0010.CUST_CODE <=:edit2)');
      end
      else
      begin
        SQL.Delete(18);
        SQL.Insert(18,' WHERE Data0112.sales_order_ptr is null AND (Data0010.CUST_CODE >=:edit1) AND (Data0010.CUST_CODE <=:edit2)');
      end;

      Parameters[0].Value:=Trim(Edit1.Text);
      Parameters[1].Value:=Trim(Edit2.Text);
      Parameters[2].Value:=dtpk1.Date;
      Parameters[3].Value:=dtpk2.Date;
     // ShowMessage(SQL.Text);
      Open;
      
      Frm_Result.SGrd.ColCount:=FieldCount;
    end;

//    if CheckBox2.Checked=False then      //彭华添加
    if rgOther.ItemIndex<>1 then
    with DM.ADOReturnMemo do
    begin
      Close;
      if ComboBox1.ItemIndex=0 then
      begin
        SQL.Delete(37);
        SQL.Delete(36);
        SQL.Insert(36,'and Data0116.MEMO_DATE>=:dtpk1 and Data0116.MEMO_DATE<=:dtpk2');
      end;
      if ComboBox1.ItemIndex=1 then
      begin
        SQL.Delete(37);
        SQL.Delete(36);
        SQL.Insert(36,'and Data0116.RMA_DATE>=:dtpk1 and Data0116.RMA_DATE<=:dtpk2');
      end;
      if ComboBox1.ItemIndex=2 then
      begin
        SQL.Delete(37);
        SQL.Delete(36);
        SQL.Insert(36,'and Data0131.TAX_DATE>=:dtpk1 and Data0131.TAX_DATE<=:dtpk2');
      end;
      if ComboBox1.ItemIndex=3 then
      begin
        SQL.Delete(37);
        SQL.Delete(36);
        SQL.Insert(36,'and Data0105.ENTERED_DT>=:dtpk1 and Data0105.ENTERED_DT<=:dtpk2');
      end;
      Parameters[0].Value:=Trim(Edit1.Text);
      Parameters[1].Value:=Trim(Edit2.Text);
      Parameters[2].Value:=dtpk1.Date;
      Parameters[3].Value:=dtpk2.Date;
      if rdo1.Checked then
        SQL.Insert(37,' order by Data0010.CUST_CODE')
      else
        SQL.Insert(37,' order by Data0098.Putaway_date');
      Open;
      Frm_Result.SGrd.ColCount:=FieldCount;
    end;

    with DM.ADONoReturnMemo do
    begin
      Close;
      if ComboBox1.ItemIndex=0 then
      begin
        SQL.Delete(25);
        SQL.Delete(24);
        SQL.Insert(24,'and Data0116.MEMO_DATE>=:dtpk1 and Data0116.MEMO_DATE<=:dtpk2');
        SQL.Insert(25,' order by Data0010.CUST_CODE');
      end;
      if ComboBox1.ItemIndex=1 then
      begin
        SQL.Delete(25);
        SQL.Delete(24);
        SQL.Insert(24,'and Data0116.RMA_DATE>=:dtpk1 and Data0116.RMA_DATE<=:dtpk2');
        SQL.Insert(25,' order by Data0010.CUST_CODE');
      end;
      if ComboBox1.ItemIndex=2 then
      begin
        SQL.Delete(25);
        SQL.Delete(24);
        SQL.Insert(24,'and Data0131.TAX_DATE>=:dtpk1 and Data0131.TAX_DATE<=:dtpk2');
        SQL.Insert(25,' order by Data0010.CUST_CODE');
      end;
      if ComboBox1.ItemIndex=3 then
      begin
        SQL.Delete(25);
        SQL.Delete(24);
        SQL.Insert(24,'and Data0105.ENTERED_DT>=:dtpk1 and Data0105.ENTERED_DT<=:dtpk2');
        SQL.Insert(25,' order by Data0010.CUST_CODE');
      end;

//      if CheckBox2.Checked then      //彭华添加
      if rgOther.ItemIndex=1 then
      begin
        SQL.Delete(23);
        SQL.Insert(23,' WHERE  Data0105.reverse_trans_flag=''N'' and (Data0010.CUST_CODE >=:edit1) AND (Data0010.CUST_CODE <=:edit2)');
      end
      else if rgOther.ItemIndex=0 then
      begin
        SQL.Delete(23);
        SQL.Insert(23,' WHERE  Data0105.reverse_trans_flag=''Y'' and (Data0010.CUST_CODE >=:edit1) AND (Data0010.CUST_CODE <=:edit2)');
      end
      else
      begin
        SQL.Delete(23);
        SQL.Insert(23,' WHERE  (Data0010.CUST_CODE >=:edit1) AND (Data0010.CUST_CODE <=:edit2)');
      end;

      Parameters[0].Value:=Trim(Edit1.Text);
      Parameters[1].Value:=Trim(Edit2.Text);
      Parameters[2].Value:=dtpk1.Date;
      Parameters[3].Value:=dtpk2.Date;
     // ShowMessage(SQL.Text);
      Open;
      Frm_Result.SGrd.ColCount:=FieldCount;
    end;
    Frm_Result.SGrd.ColCount:=44;
    with Frm_Result.SGrd do
    begin
      Cells[0,0]:='客户代码';
      Cells[1,0]:='客户简称';
      Cells[2,0]:='客户名称';
      Cells[3,0]:='币种';
      Cells[4,0]:='汇率';
      Cells[5,0]:='发票号';
      Cells[6,0]:='发票日期';
      Cells[7,0]:='帐龄日期';
      Cells[8,0]:='发票总计金额';
      Cells[9,0]:='已结金额';
      Cells[10,0]:='未结金额';
      Cells[11,0]:='客户订单';
      Cells[12,0]:='本厂编号';
      Cells[13,0]:='客户型号';
      Cells[14,0]:='类型名称';
      Cells[15,0]:='客户物料号';
      Cells[16,0]:='单支面积';
      Cells[17,0]:='报关单号';
      Cells[18,0]:='装箱单号';
      Cells[19,0]:='销售订单号';
      Cells[20,0]:='装运日期';
      Cells[21,0]:='出货数量';
      Cells[22,0]:='开票数量';
      Cells[23,0]:='开票价格(不含税)';
      Cells[24,0]:='开票金额(含税)';
      Cells[25,0]:='开票金额(不含税)';
      Cells[26,0]:='税率';
      Cells[27,0]:='税票号';
      Cells[28,0]:='税票日期';
      Cells[29,0]:='备注';
      Cells[30,0]:='开票实际成本';
      Cells[31,0]:='外发供应商';
      Cells[32,0]:='凭证编号';
      Cells[33,0]:='发票类型';
      Cells[34,0]:='记录号';
      Cells[35,0]:='凭证日期';
      Cells[36,0]:='工厂简称';
      Cells[37,0]:='材料成本';
      Cells[38,0]:='制造费用';
      Cells[39,0]:='直接人工';
      Cells[40,0]:='二类材料成本';
      Cells[41,0]:='委外或报废';
      Cells[42,0]:='带入成本';
      Cells[43,0]:='销售价格（不含税）';
    end;
//    Frm_Result.SGrd.col
    for d := 0 to Length(rkey)-1 do
    begin
//      if CheckBox2.Checked=False then      //彭华添加
      if rgOther.ItemIndex<>1 then
      begin
        DM.ADOStandard.Filter:= 'rkey10 ='+IntToStr(rkey[d]);
        if DM.ADOStandard.RecordCount>=1 then
        begin
          TransferToGrid('标准发票',DM.ADOStandard)
//          Standard(Sender);
        end;
      end;
      DM.ADOTool.Filter:= 'rkey10 ='+IntToStr(rkey[d]);
      if DM.ADOTool.RecordCount>=1 then
      begin
        TransferToGrid('工具发票',DM.ADOTool)
//        Tool(Sender);
      end;
      DM.ADOSundry.Filter:= 'rkey10 ='+IntToStr(rkey[d]);
      if DM.ADOSundry.RecordCount>=1 then
      begin
        TransferToGrid('杂项发票',DM.ADOSundry)
//        Sundry(Sender);
      end;
//      if CheckBox2.Checked=False then      //彭华添加
      if rgOther.ItemIndex<>1 then
      begin
        DM.ADOReturnMemo.Filter:= 'rkey10 ='+IntToStr(rkey[d]);
        if DM.ADOReturnMemo.RecordCount>=1 then
        begin
          TransferToGrid('退货备忘',DM.ADOReturnMemo)
//          ReturnMemo(Sender);
        end;
      end;
      DM.ADONoReturnMemo.Filter:= 'rkey10 ='+IntToStr(rkey[d]);
      if DM.ADONoReturnMemo.RecordCount>=1 then
      begin
        TransferToGrid('无退货备忘',DM.ADONoReturnMemo)
//        NoReturnMemo(Sender);
      end;
    end;
    with Frm_Result.SGrd do
    begin
      if RowCount-2>0 then
      begin
        Cells[1,RowCount-1]:= Cells[1,RowCount-2];
        Cells[21,RowCount-1]:=IntToStr(total_Number);
        Cells[22,RowCount-1]:=IntToStr(total_billingquantity);
        Cells[24,RowCount-1]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[25,RowCount-1]:=FormatFloat('0.00',total_Amount);
        total_Number:=0;
        total_billingquantity:=0;
        total_makeInvoiceAmoun:=0;
        total_Amount:=0;
      end;
    end;
    Frm_Result.ShowModal;
  end;
end;

procedure TFrm_Main.Standard(Sender: TObject);
begin
  with Frm_Result.SGrd do
  begin
    if RowCount>2 then
    begin
      if Cells[0,i-1]<>DM.ADOStandardCUST_CODE.Value then
      begin
        Cells[1,i]:= Cells[1,i-1];
        Cells[20,i]:=IntToStr(total_Number);
        Cells[21,i]:=IntToStr(total_billingquantity);
        Cells[23,i]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[24,i]:=FormatFloat('0.00',total_Amount);
        total_Number:=0;
        total_billingquantity:=0;
        total_makeInvoiceAmoun:=0;
        total_Amount:=0;
        i:=i+1;
        RowCount:=RowCount+1;
      end;
    end;
  end;
  while not DM.ADOStandard.Eof do
  begin
    with Frm_Result.SGrd do
    begin
      Cells[0,i]:=DM.ADOStandardCUST_CODE.Value;
      Cells[1,i]:=DM.ADOStandardABBR_NAME.Value;
      Cells[2,i]:=DM.ADOStandardCUSTOMER_NAME.Value;
      Cells[3,i]:=DM.ADOStandardCURR_CODE.Value;
      Cells[4,i]:=DM.ADOStandardEXCHANGE_RATE.Text;
      Cells[5,i]:=DM.ADOStandardinvoice_number.Value;
      Cells[6,i]:=DM.ADOStandardPOSTED_DATE.Text;
      Cells[7,i]:=DM.ADOStandardINVOICE_DATE.Text;
      Cells[8,i]:=DM.ADOStandardINVOICE_TOTAL.Text;
      Cells[9,i]:=DM.ADOStandardamount_paid.Text;
      Cells[10,i]:=DM.ADOStandardamt_payable.Text;
      Cells[11,i]:=DM.ADOStandardPO_NUMBER.Value;
      Cells[12,i]:=DM.ADOStandardMANU_PART_NUMBER.Value;
      Cells[13,i]:=DM.ADOStandardMANU_PART_DESC.Value;
      Cells[14,i]:=DM.ADOStandardANALYSIS_CODE_2.Value;
      Cells[15,i]:=DM.ADOStandardunit_sq.Text;
      Cells[16,i]:=DM.ADOStandardcust_decl.Value;
      Cells[17,i]:=DM.ADOStandarddelivery_no.Value;
      Cells[18,i]:=DM.ADOStandardSALES_ORDER.Value;
      Cells[19,i]:=DM.ADOStandardDATE_SHIPPED.Text;
      Cells[20,i]:=DM.ADOStandardQUAN_SHIPPED.Text;
      if Cells[20,i]<>'' then
        total_Number:=total_Number+StrToInt(Cells[20,i])
      else
        total_billingquantity:=0;
      Cells[21,i]:=DM.ADOStandardQUANTITY.Text;
      if Cells[21,i]<>'' then
        total_billingquantity:=total_billingquantity+StrToInt(Cells[21,i])
      else
        total_billingquantity:=0;
      Cells[22,i]:=DM.ADOStandardPARTS_ALLOC.Text;
      Cells[23,i]:=DM.ADOStandardRUSH_CHARGE.Text;
      if Cells[23,i]<>'' then
        total_makeInvoiceAmoun:=total_makeInvoiceAmoun+StrToFloat(Cells[23,i])
      else
        total_makeInvoiceAmoun:=0;
      Cells[24,i]:=DM.ADOStandardinvoice_price.Text;
      total_Amount:=total_Amount+StrToFloat(Cells[24,i]);
      Cells[25,i]:=DM.ADOStandardTAX_2.Text;
      Cells[26,i]:=DM.ADOStandardTAX_NO.Value;
      Cells[27,i]:=DM.ADOStandardTAX_DATE.Text;
      Cells[28,i]:=DM.ADOStandardMISC_INV_DESCRIPTION.Value;
      Cells[29,i]:=DM.ADOStandardcost_2.Text;
      Cells[30,i]:=DM.ADOStandardSupp_name.Value;
      Cells[31,i]:=DM.ADOStandardVOUCHER.Value;
      Cells[32,i]:='标准发票';
      Cells[33,i]:=DM.ADOStandardRecordID.Text;
      Cells[34,i]:=DM.ADOStandardENTERED_DT.Text;
      Cells[35,i]:=DM.ADOStandardFactory_name.Value;
      DM.ADOStandard.Next;
      if Cells[0,i]<>DM.ADOStandardCUST_CODE.Value then
      begin
        RowCount:=RowCount+1;
        Cells[1,i+1]:= Cells[1,i];
        Cells[20,i+1]:=IntToStr(total_Number);
        Cells[21,i+1]:=IntToStr(total_billingquantity);
        Cells[23,i+1]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[24,i+1]:=FormatFloat('0.00',total_Amount);
        total_Number:=0;
        total_billingquantity:=0;
        total_makeInvoiceAmoun:=0;
        total_Amount:=0;
        i:=i+2;
      end
      else
        i:=i+1;
      RowCount:=RowCount+1;
    end;
  end;
end;

procedure TFrm_Main.Tool(Sender: TObject);
begin
  with Frm_Result.SGrd do
  begin
    if RowCount>2 then
    begin
      if Cells[0,i-1]<>DM.ADOToolCUST_CODE.Value then
      begin
        Cells[1,i]:= Cells[1,i-1];
        Cells[20,i]:=IntToStr(total_Number);
        Cells[21,i]:=IntToStr(total_billingquantity);
        Cells[23,i]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[24,i]:=FormatFloat('0.00',total_Amount);
        total_Number:=0;
        total_billingquantity:=0;
        total_makeInvoiceAmoun:=0;
        total_Amount:=0;
        i:=i+1;
        RowCount:=RowCount+1;
      end;
    end;
  end;
  while not DM.ADOTool.Eof do
  begin
    with Frm_Result.SGrd do
    begin
      Cells[0,i]:=DM.ADOToolCUST_CODE.Value;
      Cells[1,i]:=DM.ADOToolABBR_NAME.Value;
      Cells[2,i]:=DM.ADOToolCUSTOMER_NAME.Value;
      Cells[3,i]:=DM.ADOToolCURR_CODE.Value;
      Cells[4,i]:=DM.ADOToolEXCHANGE_RATE.Text;
      Cells[5,i]:=DM.ADOToolinvoice_number.Value;
      Cells[6,i]:=DM.ADOToolPOSTED_DATE.Text;
      Cells[7,i]:=DM.ADOToolINVOICE_DATE.Text;
      Cells[8,i]:=DM.ADOToolINVOICE_TOTAL.Text;
      Cells[9,i]:=DM.ADOToolamount_paid.Text;
      Cells[10,i]:=DM.ADOToolamt_payable.Text;
      Cells[11,i]:=DM.ADOToolPO_NUMBER.Value;
      Cells[12,i]:=DM.ADOToolMANU_PART_NUMBER.Value;
      Cells[13,i]:=DM.ADOToolMANU_PART_DESC.Value;
      Cells[14,i]:=DM.ADOToolANALYSIS_CODE_2.Value;
      Cells[15,i]:=DM.ADOToolunit_sq.Text;
      Cells[16,i]:=DM.ADOToolcust_decl.Text;
      Cells[17,i]:=DM.ADOTooldelivery_no.Text;
      Cells[18,i]:=DM.ADOToolSALES_ORDER.Value;
      Cells[19,i]:=DM.ADOToolDATE_SHIPPED.Text;
      Cells[20,i]:=DM.ADOToolQUAN_SHIPPED.Text;
      if Cells[20,i]<>'' then
        total_Number:=total_Number+StrToInt(Cells[20,i])
      else
        total_billingquantity:=0;
      Cells[21,i]:=DM.ADOToolQUANTITY.Text;
      if Cells[21,i]<>'' then
        total_billingquantity:=total_billingquantity+StrToInt(Cells[21,i])
      else
        total_billingquantity:=0;
      Cells[22,i]:=DM.ADOToolPARTS_ALLOC.Text;
      Cells[23,i]:=DM.ADOToolRUSH_CHARGE.Text;
      if Cells[23,i]<>'' then
        total_makeInvoiceAmoun:=total_makeInvoiceAmoun+StrToFloat(Cells[23,i])
      else
        total_makeInvoiceAmoun:=0;
      Cells[24,i]:=DM.ADOToolinvoice_price.Text;
      total_Amount:=total_Amount+StrToFloat(Cells[24,i]);
      Cells[25,i]:=DM.ADOToolTAX_2.Text;
      Cells[26,i]:=DM.ADOToolTAX_NO.Value;
      Cells[27,i]:=DM.ADOToolTAX_DATE.Text;
      Cells[28,i]:=DM.ADOToolMISC_INV_DESCRIPTION.Value;
      Cells[29,i]:=DM.ADOToolcost_2.Text;
      Cells[30,i]:=DM.ADOToolSupp_name.Value;
      Cells[31,i]:=DM.ADOToolVOUCHER.Value;
      Cells[32,i]:='工具发票';
      Cells[33,i]:=DM.ADOToolRecordID.Text;
      Cells[34,i]:=DM.ADOToolENTERED_DT.Text;
      Cells[35,i]:=DM.ADOToolFactory_name.Value;
      DM.ADOTool.Next;
      if Cells[0,i]<>DM.ADOToolCUST_CODE.Value then
      begin
        RowCount:=RowCount+1;
        Cells[1,i+1]:= Cells[1,i];
        Cells[20,i+1]:=IntToStr(total_Number);
        Cells[21,i+1]:=IntToStr(total_billingquantity);
        Cells[23,i+1]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[24,i+1]:=FormatFloat('0.00',total_Amount);
        total_Number:=0;
        total_billingquantity:=0;
        total_makeInvoiceAmoun:=0;
        total_Amount:=0;
        i:=i+2;
      end
      else
        i:=i+1;
      RowCount:=RowCount+1;
    end;
  end;
end;

procedure TFrm_Main.Sundry(Sender: TObject);
begin
  with Frm_Result.SGrd do
  begin
    if RowCount>2 then
    begin
      if Cells[0,i-1]<>DM.ADOSundryCUST_CODE.Value then
      begin
        Cells[1,i]:= Cells[1,i-1];
        Cells[21,i]:=IntToStr(total_Number);
        Cells[22,i]:=IntToStr(total_billingquantity);
        Cells[23,i]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[24,i]:=FormatFloat('0.00',total_Amount);
        total_Number:=0;
        total_billingquantity:=0;
        total_makeInvoiceAmoun:=0;
        total_Amount:=0;
        i:=i+1;
        RowCount:=RowCount+1;
      end;
    end;
  end;
  while not DM.ADOSundry.Eof do
  begin
    with Frm_Result.SGrd do
    begin
      Cells[0,i]:=DM.ADOSundryCUST_CODE.Value;
      Cells[1,i]:=DM.ADOSundryABBR_NAME.Value;
      Cells[2,i]:=DM.ADOSundryCUSTOMER_NAME.Value;
      Cells[3,i]:=DM.ADOSundryCURR_CODE.Value;
      Cells[4,i]:=DM.ADOSundryEXCHANGE_RATE.Text;
      Cells[5,i]:=DM.ADOSundryinvoice_number.Value;
      Cells[6,i]:=DM.ADOSundryPOSTED_DATE.Text;
      Cells[7,i]:=DM.ADOSundryINVOICE_DATE.Text;
      Cells[8,i]:=DM.ADOSundryINVOICE_TOTAL.Text;
      Cells[9,i]:=DM.ADOSundryamount_paid.Text;
      Cells[10,i]:=DM.ADOSundryamt_payable.Text;
      Cells[11,i]:=DM.ADOSundryPO_NUMBER.Text;
      Cells[12,i]:=DM.ADOSundryMANU_PART_NUMBER.Text;
      Cells[13,i]:=DM.ADOSundryMANU_PART_DESC.Text;
      Cells[14,i]:=DM.ADOSundryANALYSIS_CODE_2.Text;
      Cells[15,i]:=DM.ADOSundryunit_sq.Text;
      Cells[16,i]:=DM.ADOSundrycust_decl.Text;
      Cells[17,i]:=DM.ADOSundrydelivery_no.Text;
      Cells[18,i]:=DM.ADOSundrySALES_ORDER.Text;
      Cells[19,i]:=DM.ADOSundryDATE_SHIPPED.Text;
      Cells[20,i]:=DM.ADOSundryQUAN_SHIPPED.Text;
      if Cells[20,i]<>'' then
        total_Number:=total_Number+StrToInt(Cells[20,i])
      else
        total_billingquantity:=0;
      Cells[21,i]:=DM.ADOSundryQUANTITY.Text;
      if Cells[21,i]<>'' then
        total_billingquantity:=total_billingquantity+StrToInt(Cells[21,i])
      else
        total_billingquantity:=0;
      Cells[22,i]:=DM.ADOSundryPARTS_ALLOC.Text;
      Cells[23,i]:=DM.ADOSundryRUSH_CHARGE.Text;
      if Cells[23,i]<>'' then
        total_makeInvoiceAmoun:=total_makeInvoiceAmoun+StrToFloat(Cells[23,i])
      else
        total_makeInvoiceAmoun:=0;
      Cells[24,i]:=DM.ADOSundryinvoice_price.Text;
      total_Amount:=total_Amount+StrToFloat(Cells[24,i]);
      Cells[25,i]:=DM.ADOSundryTAX_2.Text;
      Cells[26,i]:=DM.ADOSundryTAX_NO.Value;
      Cells[27,i]:=DM.ADOSundryTAX_DATE.Text;
      Cells[28,i]:=DM.ADOSundryMISC_INV_DESCRIPTION.Value;
      Cells[29,i]:=DM.ADOSundrycost_2.Text;
      Cells[30,i]:=DM.ADOSundrySupp_name.Value;
      Cells[31,i]:=DM.ADOSundryVOUCHER.Value;
      Cells[32,i]:='杂项发票';
      Cells[33,i]:=DM.ADOSundryRecordID.Text;
      Cells[34,i]:=DM.ADOSundryENTERED_DT.Text;
      Cells[35,i]:=DM.ADOSundryFactory_name.Value;
      DM.ADOSundry.Next;
      if Cells[0,i]<>DM.ADOSundryCUST_CODE.Value then
      begin
        RowCount:=RowCount+1;
        Cells[1,i+1]:= Cells[1,i];
        Cells[20,i+1]:=IntToStr(total_Number);
        Cells[21,i+1]:=IntToStr(total_billingquantity);
        Cells[23,i+1]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[24,i+1]:=FormatFloat('0.00',total_Amount);
        total_Number:=0;
        total_billingquantity:=0;
        total_makeInvoiceAmoun:=0;
        total_Amount:=0;
        i:=i+2;
      end
      else
        i:=i+1;
      RowCount:=RowCount+1;
    end;
  end;
end;

procedure TFrm_Main.ReturnMemo(Sender: TObject);
begin
  with Frm_Result.SGrd do
  begin
    if RowCount>2 then
    begin
      if Cells[0,i-1]<>DM.ADOReturnMemoCUST_CODE.Value then
      begin
        Cells[1,i]:= Cells[1,i-1];
        Cells[20,i]:=IntToStr(total_Number);
        Cells[21,i]:=IntToStr(total_billingquantity);
        Cells[23,i]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[24,i]:=FormatFloat('0.00',total_Amount);
        total_Number:=0;
        total_billingquantity:=0;
        total_makeInvoiceAmoun:=0;
        total_Amount:=0;
        i:=i+1;
        RowCount:=RowCount+1;
      end;
    end;
  end;
  while not DM.ADOReturnMemo.Eof do
  begin
    with Frm_Result.SGrd do
    begin
      Cells[0,i]:=DM.ADOReturnMemoCUST_CODE.Value;
      Cells[1,i]:=DM.ADOReturnMemoABBR_NAME.Value;
      Cells[2,i]:=DM.ADOReturnMemoCUSTOMER_NAME.Value;
      Cells[3,i]:=DM.ADOReturnMemoCURR_CODE.Value;
      Cells[4,i]:=DM.ADOReturnMemoEXCHANGE_RATE.Text;
      Cells[5,i]:=DM.ADOReturnMemoinvoice_number.Value;
      Cells[6,i]:=DM.ADOReturnMemoPOSTED_DATE.Text;
      Cells[7,i]:=DM.ADOReturnMemoINVOICE_DATE.Text;
      Cells[8,i]:=DM.ADOReturnMemoINVOICE_TOTAL.Text;
      Cells[9,i]:=DM.ADOReturnMemoamount_paid.Text;
      Cells[10,i]:=DM.ADOReturnMemoamt_payable.Text;
      Cells[11,i]:=DM.ADOReturnMemoPO_NUMBER.Value;
      Cells[12,i]:=DM.ADOReturnMemoMANU_PART_NUMBER.Value;
      Cells[13,i]:=DM.ADOReturnMemoMANU_PART_DESC.Value;
      Cells[14,i]:=DM.ADOReturnMemoANALYSIS_CODE_2.Value;
      Cells[15,i]:=DM.ADOReturnMemounit_sq.Text;
      Cells[16,i]:=DM.ADOReturnMemocust_decl.Text;
      Cells[17,i]:=DM.ADOReturnMemodelivery_no.Value;
      Cells[18,i]:=DM.ADOReturnMemoSALES_ORDER.Value;
      Cells[19,i]:=DM.ADOReturnMemoDATE_SHIPPED.Text;
      Cells[20,i]:=DM.ADOReturnMemoQUAN_SHIPPED.Text;
      if Cells[20,i]<>'' then
        total_Number:=total_Number+StrToInt(Cells[20,i])
      else
        total_billingquantity:=0;
      Cells[21,i]:=DM.ADOReturnMemoQUANTITY.Text;
      if Cells[21,i]<>'' then
        total_billingquantity:=total_billingquantity+StrToInt(Cells[21,i])
      else
        total_billingquantity:=0;
      Cells[22,i]:=DM.ADOReturnMemoPARTS_ALLOC.Text;
      Cells[23,i]:=DM.ADOReturnMemoRUSH_CHARGE.Text;
      if Cells[23,i]<>'' then
        total_makeInvoiceAmoun:=total_makeInvoiceAmoun+StrToFloat(Cells[23,i])
      else
        total_makeInvoiceAmoun:=0;
      Cells[24,i]:=DM.ADOReturnMemoinvoice_price.Text;
      total_Amount:=total_Amount+StrToFloat(Cells[24,i]);
      Cells[25,i]:=DM.ADOReturnMemoTAX_2.Text;
      Cells[26,i]:=DM.ADOReturnMemoTAX_NO.Value;
      Cells[27,i]:=DM.ADOReturnMemoTAX_DATE.Text;
      Cells[28,i]:=DM.ADOReturnMemoMISC_INV_DESCRIPTION.Value;
      Cells[29,i]:=DM.ADOReturnMemocost_2.Text;
      Cells[30,i]:=DM.ADOReturnMemoSupp_name.Value;
      Cells[31,i]:=DM.ADOReturnMemoVOUCHER.Value;
      Cells[32,i]:='退货备忘';
      Cells[33,i]:=dm.ADOReturnMemoRecordID.Text;
      Cells[34,i]:=DM.ADOReturnMemoENTERED_DT.Text;
      Cells[35,i]:=DM.ADOReturnMemoFactory_name.Value;
      DM.ADOReturnMemo.Next;
      if Cells[0,i]<>DM.ADOReturnMemoCUST_CODE.Value then
      begin
        RowCount:=RowCount+1;
        Cells[1,i+1]:= Cells[1,i];
        Cells[20,i+1]:=IntToStr(total_Number);
        Cells[21,i+1]:=IntToStr(total_billingquantity);
        Cells[23,i+1]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[24,i+1]:=FormatFloat('0.00',total_Amount);
        total_Number:=0;
        total_billingquantity:=0;
        total_makeInvoiceAmoun:=0;
        total_Amount:=0;
        i:=i+2;
      end
      else
        i:=i+1;
      RowCount:=RowCount+1;
    end;
  end;
end;

procedure TFrm_Main.NoReturnMemo(Sender: TObject);
begin
  with Frm_Result.SGrd do
  begin
    if RowCount>2 then
    begin
      if Cells[0,i-1]<>DM.ADONoReturnMemoCUST_CODE.Value then
      begin
        Cells[1,i]:= Cells[1,i-1];
        Cells[20,i]:=IntToStr(total_Number);
        Cells[21,i]:=IntToStr(total_billingquantity);
        Cells[23,i]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[24,i]:=FormatFloat('0.00',total_Amount);
        total_Number:=0;
        total_billingquantity:=0;
        total_makeInvoiceAmoun:=0;
        total_Amount:=0;
        i:=i+1;
        RowCount:=RowCount+1;
      end;
    end;
  end;
  while not DM.ADONoReturnMemo.Eof do
  begin
    with Frm_Result.SGrd do
    begin
      Cells[0,i]:=DM.ADONoReturnMemoCUST_CODE.Value;
      Cells[1,i]:=DM.ADONoReturnMemoABBR_NAME.Value;
      Cells[2,i]:=DM.ADONoReturnMemoCUSTOMER_NAME.Value;
      Cells[3,i]:=DM.ADONoReturnMemoCURR_CODE.Value;
      Cells[4,i]:=DM.ADONoReturnMemoEXCHANGE_RATE.Text;
      Cells[5,i]:=DM.ADONoReturnMemoinvoice_number.Value;
      Cells[6,i]:=DM.ADONoReturnMemoPOSTED_DATE.Text;
      Cells[7,i]:=DM.ADONoReturnMemoINVOICE_DATE.Text;
      Cells[8,i]:=DM.ADONoReturnMemoINVOICE_TOTAL.Text;
      Cells[9,i]:=DM.ADONoReturnMemoamount_paid.Text;
      Cells[10,i]:=DM.ADONoReturnMemoamt_payable.Text;
      Cells[11,i]:=DM.ADONoReturnMemoPO_NUMBER.Text;
      Cells[12,i]:=DM.ADONoReturnMemoMANU_PART_NUMBER.Text;
      Cells[13,i]:=DM.ADONoReturnMemoMANU_PART_DESC.Text;
      Cells[14,i]:=DM.ADONoReturnMemoANALYSIS_CODE_2.Text;
      Cells[15,i]:=DM.ADONoReturnMemounit_sq.Text;
      Cells[16,i]:=DM.ADONoReturnMemocust_decl.Text;
      Cells[17,i]:=DM.ADONoReturnMemodelivery_no.Value;
      Cells[18,i]:=DM.ADONoReturnMemoSALES_ORDER.Text;
      Cells[19,i]:=DM.ADONoReturnMemoDATE_SHIPPED.Text;
      Cells[20,i]:=DM.ADONoReturnMemoQUAN_SHIPPED.Text;
      if Cells[20,i]<>'' then
        total_Number:=total_Number+StrToInt(Cells[20,i])
      else
        total_billingquantity:=0;
      Cells[21,i]:=DM.ADONoReturnMemoQUANTITY.Text;
      if Cells[21,i]<>'' then
        total_billingquantity:=total_billingquantity+StrToInt(Cells[21,i])
      else
        total_billingquantity:=0;
      Cells[22,i]:=DM.ADONoReturnMemoPARTS_ALLOC.Text;
      Cells[23,i]:=DM.ADONoReturnMemoRUSH_CHARGE.Text;
      if Cells[23,i]<>'' then
        total_makeInvoiceAmoun:=total_makeInvoiceAmoun+StrToFloat(Cells[23,i])
      else
        total_makeInvoiceAmoun:=0;
      Cells[24,i]:=DM.ADONoReturnMemoinvoice_price.Text;
      total_Amount:=total_Amount+ StrToFloat(Cells[24,i]);
      Cells[25,i]:=DM.ADONoReturnMemoTAX_2.Text;
      Cells[26,i]:=DM.ADONoReturnMemoTAX_NO.Value;
      Cells[27,i]:=DM.ADONoReturnMemoTAX_DATE.Text;
      Cells[28,i]:=DM.ADONoReturnMemoMISC_INV_DESCRIPTION.Value;
      Cells[29,i]:=DM.ADONoReturnMemocost_2.Text;
      Cells[30,i]:=DM.ADONoReturnMemoSupp_name.Value;
      Cells[31,i]:=DM.ADONoReturnMemoVOUCHER.Value;
      Cells[32,i]:='无退货备忘';
      Cells[33,i]:=DM.ADONoReturnMemoRecordID.Text;
      Cells[34,i]:=DM.ADONoReturnMemoENTERED_DT.Text;
      Cells[35,i]:=DM.ADONoReturnMemoFactory_name.Value;
      DM.ADONoReturnMemo.Next;
      if Cells[0,i]<>DM.ADONoReturnMemoCUST_CODE.Value then
      begin
        RowCount:=RowCount+1;
        Cells[1,i+1]:= Cells[1,i];
        Cells[20,i+1]:=IntToStr(total_Number);
        Cells[21,i+1]:=IntToStr(total_billingquantity);
        Cells[23,i+1]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[24,i+1]:=FormatFloat('0.00',total_Amount);
        total_Number:=0;
        total_billingquantity:=0;
        total_makeInvoiceAmoun:=0;
        total_Amount:=0;
        i:=i+2;
      end
      else
        i:=i+1;
      RowCount:=RowCount+1;
    end;
  end;
end;
procedure TFrm_Main.FormCreate(Sender: TObject);
begin  {    }
  if not app_init(DM.ADOConn) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  Self.Caption:=Application.Title; 

    {  
  dm.ADOConn.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  dm.ADOConn.Open;
  rkey73 := '2522';
  vprev := '2';  }
end;

procedure TFrm_Main.TransferToGrid(StrType: string; DATASET: TDATASET);
var
  j:integer;
begin
  j:=1;
  with Frm_Result.SGrd do
  begin
    if RowCount>2 then
    begin
      if Cells[0,i-1]<>DATASET.fieldbyName('CUST_CODE').Value then
      begin
        Cells[1,i]:= Cells[1,i-1];
        Cells[20+j,i]:=IntToStr(total_Number);
        Cells[21+j,i]:=IntToStr(total_billingquantity);
        Cells[23+j,i]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[24+j,i]:=FormatFloat('0.00',total_Amount);
        total_Number:=0;
        total_billingquantity:=0;
        total_makeInvoiceAmoun:=0;
        total_Amount:=0;
        i:=i+1;
        RowCount:=RowCount+1;
      end;
    end;
  end;
  while not DataSet.Eof do
  begin
    with Frm_Result.SGrd do
    begin
      Cells[0,i]:=DATASET.fieldbyName('CUST_CODE').AsString;
      Cells[1,i]:=DATASET.fieldbyName('ABBR_NAME').AsString;
      Cells[2,i]:=DATASET.fieldbyName('CUSTOMER_NAME').AsString;
      Cells[3,i]:=DATASET.fieldbyName('CURR_CODE').AsString;
      Cells[4,i]:=DATASET.fieldbyName('EXCHANGE_RATE').AsString;
      Cells[5,i]:=DATASET.fieldbyName('invoice_number').AsString;
      Cells[6,i]:=DATASET.fieldbyName('POSTED_DATE').AsString;
      Cells[7,i]:=DATASET.fieldbyName('INVOICE_DATE').AsString;
      Cells[8,i]:=DATASET.fieldbyName('INVOICE_TOTAL').AsString;
      Cells[9,i]:=DATASET.fieldbyName('amount_paid').AsString;
      Cells[10,i]:=DATASET.fieldbyName('amt_payable').AsString;
      Cells[11,i]:=DATASET.fieldbyName('PO_NUMBER').AsString;
      Cells[12,i]:=DATASET.fieldbyName('MANU_PART_NUMBER').AsString;
      Cells[13,i]:=DATASET.fieldbyName('MANU_PART_DESC').AsString;
      Cells[14,i]:=DATASET.fieldbyName('PRODUCT_NAME').AsString;
      Cells[14+j,i]:=DATASET.fieldbyName('ANALYSIS_CODE_2').AsString;
      Cells[15+j,i]:=DATASET.fieldbyName('unit_sq').AsString;
      Cells[16+j,i]:=DATASET.fieldbyName('cust_decl').AsString;
      Cells[17+j,i]:=DATASET.fieldbyName('delivery_no').AsString;
      Cells[18+j,i]:=DATASET.fieldbyName('SALES_ORDER').AsString;
      Cells[19+j,i]:=DATASET.fieldbyName('DATE_SHIPPED').AsString;
      Cells[20+j,i]:=DATASET.fieldbyName('QUAN_SHIPPED').AsString;
      if Cells[20+j,i]<>'' then
        total_Number:=total_Number+StrToInt(Cells[20+j,i])
      else
        total_billingquantity:=0;
      Cells[21+j,i]:=DATASET.fieldbyName('QUANTITY').AsString;
      if Cells[21+j,i]<>'' then
        total_billingquantity:=total_billingquantity+StrToInt(Cells[21+j,i])
      else
        total_billingquantity:=0;
      Cells[22+j,i]:=DATASET.fieldbyName('PARTS_ALLOC').AsString;
      Cells[23+j,i]:=DATASET.fieldbyName('RUSH_CHARGE').AsString;
      if Cells[23+j,i]<>'' then
        total_makeInvoiceAmoun:=total_makeInvoiceAmoun+StrToFloat(Cells[23+j,i])
      else
        total_makeInvoiceAmoun:=0;
      Cells[24+j,i]:=DATASET.fieldbyName('invoice_price').AsString;
      total_Amount:=total_Amount+StrToFloat(Cells[24+j,i]);
      Cells[25+j,i]:=DATASET.fieldbyName('TAX_2').AsString;
      Cells[26+j,i]:=DATASET.fieldbyName('TAX_NO').AsString;
      Cells[27+j,i]:=DATASET.fieldbyName('TAX_DATE').AsString;
      Cells[28+j,i]:=DATASET.fieldbyName('MISC_INV_DESCRIPTION').AsString;
      Cells[29+j,i]:=DATASET.fieldbyName('cost_2').AsString;
      Cells[30+j,i]:=DATASET.fieldbyName('Supp_name').AsString;
      Cells[31+j,i]:=DATASET.fieldbyName('VOUCHER').AsString;
      Cells[32+j,i]:=StrType;
      Cells[33+j,i]:=DATASET.fieldbyName('RecordID').AsString;
      Cells[34+j,i]:=DATASET.fieldbyName('ENTERED_DT').AsString;
      Cells[35+j,i]:=DATASET.fieldbyName('Factory_name').AsString;
      if (StrType='标准发票') or (StrType='退货备忘') then
      begin
        Cells[36+j,i]:=DATASET.fieldbyName('材料成本').AsString;
        Cells[37+j,i]:=DATASET.fieldbyName('制作费用').AsString;
        Cells[38+j,i]:=DATASET.fieldbyName('直接人工').AsString;
        Cells[39+j,i]:=DATASET.fieldbyName('二类材料成本').AsString;
        Cells[40+j,i]:=DATASET.fieldbyName('委外或报废').AsString;
        Cells[41+j,i]:=DATASET.fieldbyName('带入成本').AsString;
        if (StrType='标准发票') then
          Cells[42+j,i]:=DATASET.fieldbyName('part_price').AsString
        else
          Cells[42+j,i]:=DATASET.fieldbyName('PARTS_ALLOC').AsString;
      end
      else
      begin
        Cells[36+j,i]:='0';
        Cells[37+j,i]:='0';
        Cells[38+j,i]:='0';
        Cells[39+j,i]:='0';
        Cells[40+j,i]:='0';
        Cells[41+j,i]:='0';
        Cells[42+j,i]:='0';
      end;
      DATASET.Next;
      if Cells[0,i]<>DATASET.fieldbyName('CUST_CODE').AsString then
      begin
        RowCount:=RowCount+1;
        Cells[1,i+1]:= Cells[1,i];
        Cells[20+j,i+1]:=IntToStr(total_Number);
        Cells[21+j,i+1]:=IntToStr(total_billingquantity);
        Cells[23+j,i+1]:=FormatFloat('0.00',total_makeInvoiceAmoun);
        Cells[24+j,i+1]:=FormatFloat('0.00',total_Amount);
        total_Number:=0;
        total_billingquantity:=0;
        total_makeInvoiceAmoun:=0;
        total_Amount:=0;
        i:=i+2;
      end
      else
        i:=i+1;
      RowCount:=RowCount+1;
    end;
  end;
end;

end.
