unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons,DateUtils, DB, ADODB;

type
  TFrm_Main = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    GroupBox3: TGroupBox;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label3: TLabel;
    dtpk1: TDateTimePicker;
    Label4: TLabel;
    dtpk2: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    qrySup: TADOQuery;
    qrySupCODE: TStringField;
    qrySupSUPPLIER_NAME: TStringField;
    qrySupABBR_NAME: TStringField;
    qrySupRKEY: TAutoIncField;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Standard(Sender: TObject);
    procedure Tool(Sender: TObject);
    procedure Sundry(Sender: TObject);
    procedure ReturnMemo(Sender: TObject);
    procedure NoReturnMemo(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn1Exit(Sender: TObject);
    procedure BitBtn2Exit(Sender: TObject);
  private
    { Private declarations }
    total_Number:Double;
    total_recAmount,total_taxAmount:Double;
  public
    { Public declarations }
    rkey:array of Integer;
    i:Integer;
  end;

var
  Frm_Main: TFrm_Main;

implementation

uses dmo,Supplier, Result, common;

{$R *.dfm}

procedure TFrm_Main.FormCreate(Sender: TObject);
begin
  if not app_init(DM.ADOConn) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  Self.Caption:=Application.Title;
end;

procedure TFrm_Main.BitBtn4Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrm_Main.BitBtn1Click(Sender: TObject);
begin
  Frm_Supplier:=TFrm_Supplier.Create(Application);
  if Trim(Edit1.Text)<>'' then
  begin
    //ShowMessage('123');
    with Frm_Supplier.ADO23 do
    begin
      Close;
      //Parameters[0].Value:=Trim(Edit1.Text);
      Open;
      Locate('code',Trim(Edit1.Text),[]);
    end;
  end
  else
  begin
    with Frm_Supplier.ADO23 do
    begin
      Close;
      //Parameters[0].Value:='';
      Open;
    end;
  end;
  if Frm_Supplier.ShowModal=mrOk then
  begin
    Edit1.Text:=Frm_Supplier.ADO23code.Value;
    Edit1.Tag:=Frm_Supplier.ADO23rkey.Value;
    Label5.Caption:=Frm_Supplier.ADO23supplier_name.Value;
  end;
end;

procedure TFrm_Main.FormShow(Sender: TObject);
begin
  with DM.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select code,supplier_name from data0023 order by code';
    Open;
    First;
    Edit1.Text:=FieldValues['code'];
    Label5.Caption:=FieldValues['supplier_name'];
    Last;
    Edit2.Text:=FieldValues['code'];
    Label6.Caption:=FieldValues['supplier_name'];
  end;
  with DM.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select getDate() as sys_date';
    Open;
    dtpk1.Date:=FieldValues['sys_date']-dayof(FieldValues['sys_date'])+1;
    dtpk2.Date:=FieldValues['sys_date'];
  end;
  i:=1;
end;

procedure TFrm_Main.BitBtn2Click(Sender: TObject);
begin
  Frm_Supplier:=TFrm_Supplier.Create(Application);
  if Trim(Edit2.Text)<>'' then
  begin
    with Frm_Supplier.ADO23 do
    begin
      Close;
      //Parameters[0].Value:=Trim(Edit2.Text);
      Open;
      Locate('code',Trim(Edit2.Text),[]);
    end;
  end
  else
  begin
    with Frm_Supplier.ADO23 do
    begin
      Close;
      //Parameters[0].Value:='';
      Open;
    end;
  end;
  if Frm_Supplier.ShowModal=mrOk then
  begin
    Edit2.Text:=Frm_Supplier.ADO23code.Value;
    Edit2.Tag:=Frm_Supplier.ADO23rkey.Value;
    Label6.Caption:=Frm_Supplier.ADO23supplier_name.Value;
  end;
end;

procedure TFrm_Main.BitBtn3Click(Sender: TObject);
var
  f,d:Integer;
begin
  Frm_Result:=TFrm_Result.Create(Application);
  f:=0;
  total_Number:=0;
  total_recAmount:=0;
  total_taxAmount:=0;
  if (not(CheckBox1.Checked)) and (not(CheckBox2.Checked)) and (not(CheckBox3.Checked)) and (not(CheckBox4.Checked)) and (not(CheckBox5.Checked)) then
  begin
    ShowMessage('您没有选择任何一种发票类型，请选择一种发票类型');
    Exit;
  end;
  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Text:='select count(*) as RowsCount from data0023 where code>=:edit1 and code<=:edit2';
    Parameters[0].Value:=Trim(Edit1.Text);
    Parameters[1].Value:=Trim(Edit2.Text);
    Active:=True;
    SetLength(rkey,StrToInt(FieldValues['RowsCount']));
  end;
  with DM.ADOQuery1 do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Text:='select rkey from data0023 where code>=:edit1 and code<=:edit2';
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
  Frm_Result:=TFrm_Result.Create(Application);
  if CheckBox1.Checked then
  begin
    DM.ADODataSet1.Close;
    DM.ADODataSet1.Parameters[0].Value:=Trim(Edit1.Text);
    DM.ADODataSet1.Parameters[1].Value:=Trim(Edit2.Text);
    DM.ADODataSet1.Parameters[2].Value:=StrToDate(FormatDateTime('yyyy-mm-dd',dtpk1.Date));
    DM.ADODataSet1.Parameters[3].Value:=StrToDate(FormatDateTime('yyyy-mm-dd',dtpk2.Date));
    DM.ADODataSet1.Open;
    Frm_Result.SGrd.ColCount:=DM.ADODataSet1.FieldCount-1;
  end;
  if CheckBox2.Checked then
  begin
    DM.ADODataSet2.Close;
    DM.ADODataSet2.Parameters[0].Value:=Trim(Edit1.Text);
    DM.ADODataSet2.Parameters[1].Value:=Trim(Edit2.Text);
    DM.ADODataSet2.Parameters[2].Value:=StrToDate(FormatDateTime('yyyy-mm-dd',dtpk1.Date));
    DM.ADODataSet2.Parameters[3].Value:=StrToDate(FormatDateTime('yyyy-mm-dd',dtpk2.Date));
    DM.ADODataSet2.Open;
    Frm_Result.SGrd.ColCount:=DM.ADODataSet2.FieldCount-1;
  end;
  if CheckBox3.Checked then
  begin
    DM.ADODataSet3.Close;
    DM.ADODataSet3.Parameters[0].Value:=Trim(Edit1.Text);
    DM.ADODataSet3.Parameters[1].Value:=Trim(Edit2.Text);
    DM.ADODataSet3.Parameters[2].Value:=StrToDate(FormatDateTime('yyyy-mm-dd',dtpk1.Date));
    DM.ADODataSet3.Parameters[3].Value:=StrToDate(FormatDateTime('yyyy-mm-dd',dtpk2.Date));
    DM.ADODataSet3.Open;
    Frm_Result.SGrd.ColCount:=DM.ADODataSet3.FieldCount-1;
  end;
  if CheckBox4.Checked then
  begin
    DM.ADODataSet4.Close;
    DM.ADODataSet4.Parameters[0].Value:=Trim(Edit1.Text);
    DM.ADODataSet4.Parameters[1].Value:=Trim(Edit2.Text);
    DM.ADODataSet4.Parameters[2].Value:=StrToDate(FormatDateTime('yyyy-mm-dd',dtpk1.Date));
    DM.ADODataSet4.Parameters[3].Value:=StrToDate(FormatDateTime('yyyy-mm-dd',dtpk2.Date));
    DM.ADODataSet4.Parameters[4].Value:=Trim(Edit1.Text);
    DM.ADODataSet4.Parameters[5].Value:=Trim(Edit2.Text);
    DM.ADODataSet4.Parameters[6].Value:=StrToDate(FormatDateTime('yyyy-mm-dd',dtpk1.Date));
    DM.ADODataSet4.Parameters[7].Value:=StrToDate(FormatDateTime('yyyy-mm-dd',dtpk2.Date));
    DM.ADODataSet4.Open;
    Frm_Result.SGrd.ColCount:=DM.ADODataSet4.FieldCount-1;
  end;
  if CheckBox5.Checked then
  begin
    DM.ADODataSet5.Close;
    DM.ADODataSet5.Parameters[0].Value:=Trim(Edit1.Text);
    DM.ADODataSet5.Parameters[1].Value:=Trim(Edit2.Text);
    DM.ADODataSet5.Parameters[2].Value:=StrToDate(FormatDateTime('yyyy-mm-dd',dtpk1.Date));
    DM.ADODataSet5.Parameters[3].Value:=StrToDate(FormatDateTime('yyyy-mm-dd',dtpk2.Date));
    DM.ADODataSet5.Open;
    Frm_Result.SGrd.ColCount:=DM.ADODataSet5.FieldCount-1;
  end;
  with Frm_Result.SGrd do
  begin
    Cells[0,0]:='供应商代码';
    Cells[1,0]:='供应商简称';
    Cells[2,0]:='供应商名称';
    Cells[3,0]:='应付票据编号';
    Cells[4,0]:='货币';
    Cells[5,0]:='汇率';
    Cells[6,0]:='发票日期';
    Cells[7,0]:='总计金额';
    Cells[8,0]:='已结金额';
    Cells[9,0]:='未结金额';
    Cells[10,0]:='入库单号';
    Cells[11,0]:='供应商送货单号';
    Cells[12,0]:='采购订单号';
    Cells[13,0]:='材料编码';
    Cells[14,0]:='材料名称';
    Cells[15,0]:='材料规格';
    Cells[16,0]:='接收数量';
    Cells[17,0]:='价格不含税';
    Cells[18,0]:='税率';
    Cells[19,0]:='含税价格';
    Cells[20,0]:='收货金额';    //
    Cells[21,0]:='税票金额';   //
    Cells[22,0]:='税票日期';  //
    Cells[23,0]:='应收是否已开票';
    Cells[24,0]:='备注';   //
    Cells[25,0]:='发票类型';
  end;
  for d := 0 to Length(rkey)-1 do
  begin
    if CheckBox1.Checked then
    begin
      DM.ADODataSet1.Filter:= 'rkey ='+IntToStr(rkey[d]);
      if DM.ADODataSet1.RecordCount>=1 then
      begin
        Standard(Sender);
      end;
    end;
    if CheckBox2.Checked then
    begin
      DM.ADODataSet2.Filter:= 'rkey ='+IntToStr(rkey[d]);
      if DM.ADODataSet2.RecordCount>=1 then
      begin
        Tool(Sender);
      end;
    end;
    if CheckBox3.Checked then
    begin
      DM.ADODataSet3.Filter:= 'rkey ='+IntToStr(rkey[d]);
      if DM.ADODataSet3.RecordCount>=1 then
      begin
        Sundry(Sender);
      end;
    end;
    if CheckBox4.Checked then
    begin
      DM.ADODataSet4.Filter:= 'rkey ='+IntToStr(rkey[d]);
      if DM.ADODataSet4.RecordCount>=1 then
      begin
        ReturnMemo(Sender);
      end;
    end;
    if CheckBox5.Checked then
    begin
      DM.ADODataSet5.Filter:= 'rkey ='+IntToStr(rkey[d]);
      if DM.ADODataSet5.RecordCount>=1 then
      begin
        NoReturnMemo(Sender);
      end;
    end;
  end;
  with Frm_Result.SGrd do
  begin
    if RowCount-2>0 then
    Cells[1,RowCount-1]:= Cells[1,RowCount-2];
    Cells[16,RowCount-1]:=FormatFloat('0.00',total_Number);
    Cells[20,RowCount-1]:=FormatFloat('0.00',total_recAmount);
    Cells[21,RowCount-1]:=FormatFloat('0.00',total_taxAmount);
    total_Number:=0;
    total_recAmount:=0;
    total_taxAmount:=0;
  end;
  Frm_Result.ShowModal;
end;

procedure TFrm_Main.Standard(Sender: TObject);
begin
  with Frm_Result.SGrd do
  begin
    if RowCount>2 then
    begin
      if Cells[0,i-1]<>DM.ADODataSet1CODE.Value then
      begin
        Cells[1,i]:= Cells[1,i-1];
        Cells[16,RowCount-1]:=FormatFloat('0.00',total_Number);
        Cells[20,RowCount-1]:=FormatFloat('0.00',total_recAmount);
        Cells[21,RowCount-1]:=FormatFloat('0.00',total_taxAmount);
        total_Number:=0;
        total_recAmount:=0;
        total_taxAmount:=0;
        i:=i+1;
        RowCount:=RowCount+1;
      end;
    end;
  end;
  while not DM.ADODataSet1.Eof do
  begin
    with Frm_Result.SGrd do
    begin
      Cells[0,i]:=DM.ADODataSet1CODE.Text;
      Cells[1,i]:=DM.ADODataSet1ABBR_NAME.Value;
      Cells[2,i]:=DM.ADODataSet1SUPPLIER_NAME.Value;
      Cells[3,i]:=DM.ADODataSet1INVOICE_NO.Value;
      Cells[4,i]:=DM.ADODataSet1CURR_CODE.Value;
      Cells[5,i]:=DM.ADODataSet1EX_RATE.Text;
      Cells[6,i]:=DM.ADODataSet1INV_DATE.Text;
      Cells[7,i]:=DM.ADODataSet1INV_TOTAL.Text;
      Cells[8,i]:=DM.ADODataSet1amount_paid.Text;
      Cells[9,i]:=DM.ADODataSet1amt_payable.Text;
      Cells[10,i]:=DM.ADODataSet1GRN_NUMBER.Text;
      Cells[11,i]:=DM.ADODataSet1DELIVER_NUMBER.Text;
      Cells[12,i]:=DM.ADODataSet1PO_NUMBER.Value;
      Cells[13,i]:=DM.ADODataSet1INV_PART_NUMBER.Text;
      Cells[14,i]:=DM.ADODataSet1INV_PART_DESCRIPTION.Text;
      Cells[15,i]:=DM.ADODataSet1INV_DESCRIPTION.Value;
      Cells[16,i]:=DM.ADODataSet1QUANTITY.Text;
      total_Number:=total_Number+strtofloat(Cells[16,i]);
      Cells[17,i]:=DM.ADODataSet1PRICE.Text;
      Cells[18,i]:=DM.ADODataSet1TAX_2.Text;
      Cells[19,i]:=DM.ADODataSet1tax_price.Text;
      Cells[20,i]:=DM.ADODataSet1Rec_amount.Text;
      total_recAmount:=total_recAmount+strtofloat(Cells[20,i]);
      Cells[21,i]:=DM.ADODataSet1tax_invoice_amt.Text;
      total_taxAmount:=total_taxAmount+strtofloat(Cells[21,i]);
      Cells[22,i]:=DM.ADODataSet1tax_invoice_date.Text;
      Cells[23,i]:=DM.ADODataSet1GLPTR_STATUS.Value;
      Cells[24,i]:=DM.ADODataSet1tax_invoice_ref.Value;
      Cells[25,i]:=DM.ADODataSet1TType.Value;
      DM.ADODataSet1.Next;
      if Cells[0,i]<>DM.ADODataSet1CODE.Value then
      begin
        RowCount:=RowCount+1;
        Cells[1,i+1]:= Cells[1,i];
        Cells[16,RowCount-1]:=FormatFloat('0.00',total_Number);
        Cells[20,RowCount-1]:=FormatFloat('0.00',total_recAmount);
        Cells[21,RowCount-1]:=FormatFloat('0.00',total_taxAmount);
        total_Number:=0;
        total_recAmount:=0;
        total_taxAmount:=0;
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
      if Cells[0,i-1]<>DM.ADODataSet2CODE.Value then
      begin
        Cells[1,i]:= Cells[1,i-1];
        Cells[16,RowCount-1]:=FormatFloat('0.00',total_Number);
        Cells[20,RowCount-1]:=FormatFloat('0.00',total_recAmount);
        Cells[21,RowCount-1]:=FormatFloat('0.00',total_taxAmount);
        total_Number:=0;
        total_recAmount:=0;
        total_taxAmount:=0;
        i:=i+1;
        RowCount:=RowCount+1;
      end;
    end;
  end;
  while not DM.ADODataSet2.Eof do
  begin
    with Frm_Result.SGrd do
    begin
      Cells[0,i]:=DM.ADODataSet2CODE.Text;
      Cells[1,i]:=DM.ADODataSet2ABBR_NAME.Value;
      Cells[2,i]:=DM.ADODataSet2SUPPLIER_NAME.Value;
      Cells[3,i]:=DM.ADODataSet2INVOICE_NO.Value;
      Cells[4,i]:=DM.ADODataSet2CURR_CODE.Value;
      Cells[5,i]:=DM.ADODataSet2EX_RATE.Text;
      Cells[6,i]:=DM.ADODataSet2INV_DATE.Text;
      Cells[7,i]:=DM.ADODataSet2INV_TOTAL.Text;
      Cells[8,i]:=DM.ADODataSet2amount_paid.Text;
      Cells[9,i]:=DM.ADODataSet2amt_payable.Text;
      Cells[10,i]:=DM.ADODataSet2GRN_NUMBER.Text;
      Cells[11,i]:=DM.ADODataSet2DELIVER_NUMBER.Text;
      Cells[12,i]:=DM.ADODataSet2PO_NUMBER.Value;
      Cells[13,i]:=DM.ADODataSet2INV_PART_NUMBER.Text;
      Cells[14,i]:=DM.ADODataSet2INV_PART_DESCRIPTION.Text;
      Cells[15,i]:=DM.ADODataSet2INV_DESCRIPTION.Value;
      Cells[16,i]:=DM.ADODataSet2QUANTITY.Text;
      total_Number:=total_Number+strtofloat(Cells[16,i]);
      Cells[17,i]:=DM.ADODataSet2PRICE.Text;
      Cells[18,i]:=DM.ADODataSet2TAX_2.Text;
      Cells[19,i]:=DM.ADODataSet2tax_price.Text;
      Cells[20,i]:=DM.ADODataSet2Rec_amount.Text;
      total_recAmount:=total_recAmount+strtofloat(Cells[20,i]);
      Cells[21,i]:=DM.ADODataSet2tax_invoice_amt.Text;
      total_taxAmount:=total_taxAmount+strtofloat(Cells[21,i]);
      Cells[22,i]:=DM.ADODataSet2tax_invoice_date.Text;
      Cells[23,i]:=DM.ADODataSet2GLPTR_STATUS.Value;
      Cells[24,i]:=DM.ADODataSet2tax_invoice_ref.Value;
      Cells[25,i]:=DM.ADODataSet2TType.Value;
      DM.ADODataSet2.Next;
      if Cells[0,i]<>DM.ADODataSet2CODE.Value then
      begin
        RowCount:=RowCount+1;
        Cells[1,i+1]:= Cells[1,i];
        Cells[16,RowCount-1]:=FormatFloat('0.00',total_Number);
        Cells[20,RowCount-1]:=FormatFloat('0.00',total_recAmount);
        Cells[21,RowCount-1]:=FormatFloat('0.00',total_taxAmount);
        total_Number:=0;
        total_recAmount:=0;
        total_taxAmount:=0;
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
      if Cells[0,i-1]<>DM.ADODataSet3CODE.Value then
      begin
        Cells[1,i]:= Cells[1,i-1];
        Cells[16,RowCount-1]:=FormatFloat('0.00',total_Number);
        Cells[20,RowCount-1]:=FormatFloat('0.00',total_recAmount);
        Cells[21,RowCount-1]:=FormatFloat('0.00',total_taxAmount);
        total_Number:=0;
        total_recAmount:=0;
        total_taxAmount:=0;
        i:=i+1;
        RowCount:=RowCount+1;
      end;
    end;
  end;
  while not DM.ADODataSet3.Eof do
  begin
    with Frm_Result.SGrd do
    begin
      Cells[0,i]:=DM.ADODataSet3CODE.Text;
      Cells[1,i]:=DM.ADODataSet3ABBR_NAME.Value;
      Cells[2,i]:=DM.ADODataSet3SUPPLIER_NAME.Value;
      Cells[3,i]:=DM.ADODataSet3INVOICE_NO.Value;
      Cells[4,i]:=DM.ADODataSet3CURR_CODE.Value;
      Cells[5,i]:=DM.ADODataSet3EX_RATE.Text;
      Cells[6,i]:=DM.ADODataSet3INV_DATE.Text;
      Cells[7,i]:=DM.ADODataSet3INV_TOTAL.Text;
      Cells[8,i]:=DM.ADODataSet3amount_paid.Text;
      Cells[9,i]:=DM.ADODataSet3amt_payable.Text;
      Cells[10,i]:=DM.ADODataSet3GRN_NUMBER.Text;
      Cells[11,i]:=DM.ADODataSet3DELIVER_NUMBER.Text;
      Cells[12,i]:=DM.ADODataSet3PO_NUMBER.Value;
      Cells[13,i]:=DM.ADODataSet3INV_PART_NUMBER.Text;
      Cells[14,i]:=DM.ADODataSet3INV_PART_DESCRIPTION.Text;
      Cells[15,i]:=DM.ADODataSet3INV_DESCRIPTION.Value;
      Cells[16,i]:=DM.ADODataSet3QUANTITY.Text;
      total_Number:=total_Number+strtofloat(Cells[16,i]);
      Cells[17,i]:=DM.ADODataSet3PRICE.Text;
      Cells[18,i]:=DM.ADODataSet3TAX_2.Text;
      Cells[19,i]:=DM.ADODataSet3tax_price.Text;
      Cells[20,i]:=DM.ADODataSet3Rec_amount.Text;
      total_recAmount:=total_recAmount+StrToFloat(Cells[20,i]);
      Cells[21,i]:=DM.ADODataSet3tax_invoice_amt.Text;
      total_taxAmount:=total_taxAmount+strtofloat(Cells[21,i]);
      Cells[22,i]:=DM.ADODataSet3tax_invoice_date.Text;
      Cells[23,i]:=DM.ADODataSet3GLPTR_STATUS.Value;
      Cells[24,i]:=DM.ADODataSet3tax_invoice_ref.Value;
      Cells[25,i]:=DM.ADODataSet3TType.Value;
      DM.ADODataSet3.Next;
      if Cells[0,i]<>DM.ADODataSet3CODE.Value then
      begin
        RowCount:=RowCount+1;
        Cells[1,i+1]:= Cells[1,i];
        Cells[16,RowCount-1]:=FormatFloat('0.00',total_Number);
        Cells[20,RowCount-1]:=FormatFloat('0.00',total_recAmount);
        Cells[21,RowCount-1]:=FormatFloat('0.00',total_taxAmount);
        total_Number:=0;
        total_recAmount:=0;
        total_taxAmount:=0;
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
      if Cells[0,i-1]<>DM.ADODataSet4CODE.Value then
      begin
        Cells[1,i]:= Cells[1,i-1];
        Cells[16,RowCount-1]:=FormatFloat('0.00',total_Number);
        Cells[20,RowCount-1]:=FormatFloat('0.00',total_recAmount);
        Cells[21,RowCount-1]:=FormatFloat('0.00',total_taxAmount);
        total_Number:=0;
        total_recAmount:=0;
        total_taxAmount:=0;
        i:=i+1;
        RowCount:=RowCount+1;
      end;
    end;
  end;
  while not DM.ADODataSet4.Eof do
  begin
    with Frm_Result.SGrd do
    begin
      Cells[0,i]:=DM.ADODataSet4CODE.Text;
      Cells[1,i]:=DM.ADODataSet4ABBR_NAME.Value;
      Cells[2,i]:=DM.ADODataSet4SUPPLIER_NAME.Value;
      Cells[3,i]:=DM.ADODataSet4INVOICE_NO.Value;
      Cells[4,i]:=DM.ADODataSet4CURR_CODE.Value;
      Cells[5,i]:=DM.ADODataSet4EX_RATE.Text;
      Cells[6,i]:=DM.ADODataSet4INV_DATE.Text;
      Cells[7,i]:=DM.ADODataSet4INV_TOTAL.Text;
      Cells[8,i]:=DM.ADODataSet4amount_paid.Text;
      Cells[9,i]:=DM.ADODataSet4amt_payable.Text;
      Cells[10,i]:=DM.ADODataSet4GRN_NUMBER.Text;
      Cells[11,i]:=DM.ADODataSet4DELIVER_NUMBER.Text;
      Cells[12,i]:=DM.ADODataSet4PO_NUMBER.Value;
      Cells[13,i]:=DM.ADODataSet4INV_PART_NUMBER.Text;
      Cells[14,i]:=DM.ADODataSet4INV_PART_DESCRIPTION.Text;
      Cells[15,i]:=DM.ADODataSet4INV_DESCRIPTION.Value;
      Cells[16,i]:=DM.ADODataSet4QUANTITY.Text;
      total_Number:=total_Number+strtofloat(Cells[16,i]);
      Cells[17,i]:=DM.ADODataSet4PRICE.Text;
      Cells[18,i]:=DM.ADODataSet4TAX_2.Text;
      Cells[19,i]:=DM.ADODataSet4tax_price.Text;
      Cells[20,i]:=DM.ADODataSet4Rec_amount.Text;
      total_recAmount:=total_recAmount+strtofloat(Cells[20,i]);
      Cells[21,i]:=DM.ADODataSet4tax_invoice_amt.Text;
      total_taxAmount:=total_taxAmount+strtofloat(Cells[21,i]);
      Cells[22,i]:=DM.ADODataSet4tax_invoice_date.Text;
      Cells[23,i]:=DM.ADODataSet4GLPTR_STATUS.Value;
      Cells[24,i]:=DM.ADODataSet4tax_invoice_ref.Value;
      Cells[25,i]:=DM.ADODataSet4TType.Value;
      DM.ADODataSet4.Next;

    Cells[16,0]:='接收数量';
    Cells[20,0]:='收货金额';    //
    Cells[21,0]:='税票金额';   //
      if Cells[0,i]<>DM.ADODataSet4CODE.Value then
      begin
        RowCount:=RowCount+1;
        Cells[1,i+1]:= Cells[1,i];
        Cells[16,RowCount-1]:=FormatFloat('0.00',total_Number);
        Cells[20,RowCount-1]:=FormatFloat('0.00',total_recAmount);
        Cells[21,RowCount-1]:=FormatFloat('0.00',total_taxAmount);
        total_Number:=0;
        total_recAmount:=0;
        total_taxAmount:=0;
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
      if Cells[0,i-1]<>DM.ADODataSet5CODE.Value then
      begin
        Cells[1,i]:= Cells[1,i-1];
        Cells[16,RowCount-1]:=FormatFloat('0.00',total_Number);
        Cells[20,RowCount-1]:=FormatFloat('0.00',total_recAmount);
        Cells[21,RowCount-1]:=FormatFloat('0.00',total_taxAmount);
        total_Number:=0;
        total_recAmount:=0;
        total_taxAmount:=0;
        i:=i+1;
        RowCount:=RowCount+1;
      end;
    end;
  end;
  while not DM.ADODataSet5.Eof do
  begin
    with Frm_Result.SGrd do
    begin
      Cells[0,i]:=DM.ADODataSet5CODE.Text;
      Cells[1,i]:=DM.ADODataSet5ABBR_NAME.Value;
      Cells[2,i]:=DM.ADODataSet5SUPPLIER_NAME.Value;
      Cells[3,i]:=DM.ADODataSet5INVOICE_NO.Value;
      Cells[4,i]:=DM.ADODataSet5CURR_CODE.Value;
      Cells[5,i]:=DM.ADODataSet5EX_RATE.Text;
      Cells[6,i]:=DM.ADODataSet5INV_DATE.Text;
      Cells[7,i]:=DM.ADODataSet5INV_TOTAL.Text;
      Cells[8,i]:=DM.ADODataSet5amount_paid.Text;
      Cells[9,i]:=DM.ADODataSet5amt_payable.Text;
      Cells[10,i]:=DM.ADODataSet5GRN_NUMBER.Text;
      Cells[11,i]:=DM.ADODataSet5DELIVER_NUMBER.Text;
      Cells[12,i]:=DM.ADODataSet5PO_NUMBER.Value;

      Cells[13,i]:=DM.ADODataSet5INV_PART_NUMBER.Text;
      Cells[14,i]:=DM.ADODataSet5INV_PART_DESCRIPTION.Text;
      Cells[15,i]:=DM.ADODataSet5INV_DESCRIPTION.Value;
      Cells[16,i]:=DM.ADODataSet5QUANTITY.Text;
      total_Number:=total_Number+strtofloat(Cells[16,i]);
      Cells[17,i]:=DM.ADODataSet5PRICE.Text;
      Cells[18,i]:=DM.ADODataSet5TAX_2.Text;
      Cells[19,i]:=DM.ADODataSet5tax_price.Text;
      Cells[20,i]:=DM.ADODataSet5Rec_amount.Text;
      total_recAmount:=total_recAmount+strtofloat(Cells[20,i]);
      Cells[21,i]:=DM.ADODataSet5tax_invoice_amt.Text;
      total_taxAmount:=total_taxAmount+strtofloat(Cells[21,i]);
      Cells[22,i]:=DM.ADODataSet5tax_invoice_date.Text;
      Cells[23,i]:=DM.ADODataSet5GLPTR_STATUS.Value;
      Cells[24,i]:=DM.ADODataSet5tax_invoice_ref.Value;
      Cells[25,i]:=DM.ADODataSet5TType.Value;
      DM.ADODataSet5.Next;
      if Cells[0,i]<>DM.ADODataSet5CODE.Value then
      begin
        RowCount:=RowCount+1;
        Cells[1,i+1]:= Cells[1,i];
        Cells[16,RowCount-1]:=FormatFloat('0.00',total_Number);
        Cells[20,RowCount-1]:=FormatFloat('0.00',total_recAmount);
        Cells[21,RowCount-1]:=FormatFloat('0.00',total_taxAmount);
        total_Number:=0;
        total_recAmount:=0;
        total_taxAmount:=0;
        i:=i+2;
      end
      else
        i:=i+1;
      RowCount:=RowCount+1;
    end;
  end;
end;

procedure TFrm_Main.Edit1Exit(Sender: TObject);
begin
  Frm_Supplier:=TFrm_Supplier.Create(Application);
  if (Trim(Edit1.Text)='') and (not BitBtn1.Focused) then
  begin
    ShowMessage('供应商代码不能为空');
    Edit1.SetFocus;
    Exit;
  end
  else
  begin
    with qrySup do
    begin
      Close;
      Parameters[0].Value:=Trim(Edit1.Text);
      Open;
      if IsEmpty then
      begin
        ShowMessage('请输入正确的供应商代码');
        Edit1.SetFocus;
        Exit;
      end
      else
      begin
        Edit1.Tag:=qrySupRKEY.Value;
        Label5.Caption:=qrySupSUPPLIER_NAME.Value;
      end;
    end;
//    with Frm_Supplier.ADO23 do
//    begin
//      Close;
//      Parameters[0].Value:=Trim(Edit1.Text);
//      Open;
//      if IsEmpty then
//      begin
//        ShowMessage('请输入正确的供应商代码');
//        Edit1.SetFocus;
//        Exit;
//      end;
//    end;
  end;
end;

procedure TFrm_Main.Edit2Exit(Sender: TObject);
begin
  Frm_Supplier:=TFrm_Supplier.Create(Application);
  if (Trim(Edit2.Text)='') and (not BitBtn2.Focused) then
  begin
    ShowMessage('供应商代码不能为空');
    Edit2.SetFocus;
    Exit;
  end
  else
  begin
    with qrySup do
    begin
      Close;
      Parameters[0].Value:=Trim(Edit2.Text);
      Open;
      if IsEmpty then
      begin
        ShowMessage('请输入正确的供应商代码');
        Edit2.SetFocus;
        Exit;
      end
      else
      begin
        Edit2.Tag:=qrySupRKEY.Value;
        Label6.Caption:=qrySupSUPPLIER_NAME.Value;
      end;
    end;
//    with Frm_Supplier.ADO23 do
//    begin
//      Close;
//      Parameters[0].Value:=Trim(Edit2.Text);
//      Open;
//      if IsEmpty then
//      begin
//        ShowMessage('请输入正确的供应商代码');
//        Edit2.SetFocus;
//        Exit;
//      end;
//    end;
  end;
end;

procedure TFrm_Main.BitBtn1Exit(Sender: TObject);
begin
  if (Trim(Edit1.Text)='') and (not Edit1.Focused) then
  begin
    ShowMessage('供应商代码不能为空');
    Edit1.SetFocus;
    Exit;
  end
end;

procedure TFrm_Main.BitBtn2Exit(Sender: TObject);
begin
  if (Trim(Edit2.Text)='') and (not Edit2.Focused) then
  begin
    ShowMessage('供应商代码不能为空');
    Edit2.SetFocus;
    Exit;
  end
end;

end.
