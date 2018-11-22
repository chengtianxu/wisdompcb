unit Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Mask, DBCtrls,DB, ADODB,ConstVar;

type
  TForm_Add = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    BitBtn3: TBitBtn;
    Label13: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    ADO23: TADODataSet;
    ADO23RKEY: TAutoIncField;
    ADO23CODE: TStringField;
    ADO23SUPPLIER_NAME: TStringField;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    Label14: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label15: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit8: TEdit;
    ADO23ANALYSIS_CODE1: TStringField;
    Edit12: TEdit;
    Label16: TLabel;
    BitBtn4: TBitBtn;
    Label17: TLabel;
    Edit13: TEdit;
    Edit14: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Edit15: TEdit;
    Edit16: TEdit;
    ADOQuery1: TADOQuery;
    ADOQuery1total_matl_amount: TBCDField;
    ADOQuery1total_tax_amount: TBCDField;
    Edit17: TEdit;
    Edit18: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    ADOQuery2: TADOQuery;
    ADOQuery2matl_total: TBCDField;
    ADOQuery2tax_total: TBCDField;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit9KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit7KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Edit12Exit(Sender: TObject);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure Edit7Change(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit13Change(Sender: TObject);
    procedure Edit14Change(Sender: TObject);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    codeRkey:Integer;
  public
    { Public declarations }
    code1,code2:string;
    i:Byte;
    flag:Integer;  //0新增，1编辑，3复制，4查看
  end;

var
  Form_Add: TForm_Add;

implementation

uses Supplier, common, dmo,Pick_Item_Single;

{$R *.dfm}

procedure TForm_Add.BitBtn2Click(Sender: TObject);
begin
  DM.ADO127A.Cancel;
  Close;
end;

procedure TForm_Add.BitBtn3Click(Sender: TObject);
begin
  Form_Supplier:=TForm_Supplier.Create(Application);
  Form_Supplier.ADO23.Close;
  Form_Supplier.ADO23.Parameters[0].Value:='';
  Form_Supplier.ADO23.Open;
  if Form_Supplier.ShowModal=mrOk then
  begin
    Edit3.Text:=Form_Supplier.ADO23CODE.Value;
    Edit3.Tag:=Form_Supplier.ADO23RKEY.Value;
    Label13.Caption:=Form_Supplier.ADO23SUPPLIER_NAME.Value;
    Edit4.Text:=Form_Supplier.ADO23ANALYSIS_CODE1.Value;
    Edit16.Text:=trim(Form_Supplier.ADO23EDI_ID.Value);
    Form_Supplier.ADO189.Close;
    Form_Supplier.ADO189.Parameters[0].Value:=Form_Supplier.ADO23RKEY.Value;
    Form_Supplier.ADO189.Open;
    Edit8.Text:=Form_Supplier.ADO189STATE_TAX.Text;
    if Trim(Edit9.Text)<>'' then
    begin
      Edit9.Text:=FormatFloat('0.00',StrToFloat(Edit7.Text)*StrToFloat(Edit8.Text)*0.01);
      Edit10.Text:=FormatFloat('0.00',StrToFloat(Edit7.Text)+StrToFloat(Edit9.Text));
    end;
    ADOQuery1.Close;
    ADOQuery1.Parameters[0].Value:=StrToInt(Edit5.Text);
    ADOQuery1.Parameters[1].Value:=StrToInt(Edit6.Text);
    ADOQuery1.Parameters[2].Value:=Edit3.Tag;
    ADOQuery1.Open;
    Edit13.Text:=FloatToStr(ADOQuery1total_matl_amount.Value+strtofloat(Edit7.Text));
    Edit14.Text:=FloatToStr(ADOQuery1total_tax_amount.Value+strtofloat(Edit9.Text));
    ADOQuery2.Close;
    ADOQuery2.Parameters[0].Value:=StrToInt(Edit5.Text);
    ADOQuery2.Parameters[1].Value:=StrToInt(Edit6.Text);
    ADOQuery2.Parameters[2].Value:=Edit3.Tag;
    ADOQuery2.Open;
    Edit17.Text:=FloatToStr(ADOQuery2matl_total.Value-strtofloat(Edit13.Text));
    Edit18.Text:=FloatToStr(ADOQuery2tax_total.Value-strtofloat(Edit14.Text));
  end;
end;

procedure TForm_Add.BitBtn1Enter(Sender: TObject);
begin
  if Trim(Edit1.Text)='' then
  begin
    ShowMessage('发票编码不允许为空!');
    Edit1.SetFocus;
    Exit;
  end;
  if not (Edit1.Text[length(trim(Edit1.Text))] in ['0'..'9']) then
  begin
    MessageDlg('发票编码最后一位必须是一个整数',mtInformation,[mbOK],0);
    Edit1.SetFocus;
    Exit;
  end;
  if Trim(Edit2.Text)='' then
  begin
    ShowMessage('发票号码不允许为空');
    Edit2.SetFocus;
    Exit;
  end;
  if (length(trim(Edit2.Text))<>8) then
  begin
    MessageDlg('发票号码长度小于或大于8位，请重新输入',mtInformation,[mbOK],0);
    Edit2.SetFocus;
    Exit;
  end;
  if DM.ADO127A.State=dsInsert then
  begin
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select count(*) as Rcount from Data0127 where invoice_number='''+trim(Edit1.Text)+''' and invoice_no='''+trim(Edit2.Text)+'''');
      Active:=True;
      if FieldValues['Rcount']>0 then
      begin
        ShowMessage('此税票信息已存在，请检查发票号码是否重复');
        Edit2.SetFocus;
        Exit;
      end;
    end;
  end;
  if DM.ADO127A.State=dsEdit then
  begin
    if (code1<>Trim(Edit1.Text)) or (code2<>Trim(Edit2.Text)) then
    with DM.ADOQuery1 do
    begin
      Active:=False;
      SQL.Clear;
      SQL.Add('select count(*) as Rcount from Data0127 where invoice_number='''+trim(Edit1.Text)+''' and invoice_no='''+trim(Edit2.Text)+'''');
      Active:=True;
      if FieldValues['Rcount']>0 then
      begin
        ShowMessage('此税票信息已存在，请检查发票号码是否重复');
        Edit2.SetFocus;
        Exit;
      end;
    end;
  end;
  if (DM.ADO127.State=dsInsert) or (DM.ADO127.State=dsEdit) then
  begin
    if Trim(Edit3.Text)='' then
    begin
      ShowMessage('必须选择一个供应商!');
      Edit3.SetFocus;
      Exit;
    end;
  end;
  if Trim(Edit5.Text)='' then
  begin
    ShowMessage('货款年度不允许为空');
    Edit5.SetFocus;
    Exit;
  end;
  if Trim(Edit6.Text)='' then
  begin
    ShowMessage('货款月份不允许为空');
    Edit6.SetFocus;
    Exit;
  end;
  if Trim(Edit12.Text)='' then
  begin
    ShowMessage('请选择工厂');
    Edit12.SetFocus;
    Exit;
  end;
//  if StrToFloat(Edit7.Text)<=0 then
//  begin
//    ShowMessage('不含税金额不能小于等于零');
//    Edit7.SetFocus;
//    Exit;
//  end;
end;

procedure TForm_Add.BitBtn1Click(Sender: TObject);
begin
 ModalResult:=mrOk;
end;
procedure TForm_Add.FormActivate(Sender: TObject);
begin
  if (DM.ADO127A.State<>dsInsert) then
  begin
    ADO23.Close;
    ADO23.Parameters[0].Value:=DM.ADO127supp_ptr.Value;
    ADO23.Open;
    if not ADO23.Eof then
    begin
      Edit3.Text:=ADO23CODE.Value;
      Edit3.Font.Color:=clWindowText;
      Label13.Caption:=ADO23SUPPLIER_NAME.Value;
      Edit4.Text:=ADO23ANALYSIS_CODE1.Value;
    end;
  end;
end;

procedure TForm_Add.Edit9KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key<>9 then
  begin
    if (Key <>109) and (Trim(Edit9.Text)<>'') then
      Edit10.Text:=FormatFloat('0.00',StrToFloat(Edit7.Text)+StrToFloat(Edit9.Text));
  end;
end;

procedure TForm_Add.Edit7KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key<>9) then
  begin
    if trim((Sender as TEdit).Text)='' then
      (Sender as TEdit).Text:='0.00';
    if Key<>109 then
    begin
      Edit9.Text:=FormatFloat('0.00',StrToFloat(Edit7.Text)*StrToFloat(Edit8.Text)*0.01);
      Edit10.Text:=FormatFloat('0.00',StrToFloat(Edit7.Text)+StrToFloat(Edit9.Text));
    end;
  end;
end;

procedure TForm_Add.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not((Key in ['0'..'9',#8])) then
  begin
    key := #0;
  end;
end;

procedure TForm_Add.BitBtn4Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'warehouse_code/工厂代码/100,warehouse_name/工厂名称/177,abbr_name/工厂简称/100';
    InputVar.Sqlstr := 'select rkey,warehouse_code,warehouse_name,abbr_name from data0015';
    InputVar.AdoConn := dm.ADOConn;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit12.Text:=frmPick_Item_Single.adsPick.Fieldbyname('warehouse_code').AsString;
      Edit12.Tag:=frmPick_Item_Single.adsPick. Fieldbyname('rkey').AsInteger;
      Label17.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('warehouse_name').AsString;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TForm_Add.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
  if Trim(Edit3.Text)='' then
  begin
    ShowMessage('请先选择供应商');
    Edit3.SetFocus;
    Abort;
    Exit;
  end;
  if not (key in ['0'..'9','.','-',#8,#13]) then  //判断是否输入数字
    abort
  else
    if key = chr(46) then      //判断是否重复输入小数点'.'
      if pos('.',(sender as tedit).Text)>0  then abort;
end;

procedure TForm_Add.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.','-',#8,#13]) then  //判断是否输入数字
    abort
  else
    if key = chr(46) then      //判断是否重复输入小数点'.'
      if pos('.',(sender as tedit).Text)>0  then abort;
end;

procedure TForm_Add.Edit12Exit(Sender: TObject);
begin
  if Trim(Edit12.Text)<>'' then
  begin
    with dm.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select rkey,warehouse_code,warehouse_name,abbr_name from data0015 where warehouse_code='''+Trim(Edit12.Text)+'''';
      Open;
      if IsEmpty then
      begin
        ShowMessage('输入的工厂代码不正确');
        Edit12.SetFocus;
        Exit;
      end
      else
      begin
        Edit12.Text:=Fieldbyname('warehouse_code').AsString;
        Edit12.Tag:=Fieldbyname('rkey').AsInteger;
        Label17.Caption:=Fieldbyname('warehouse_name').AsString;
      end;
    end;
  end;
end;

procedure TForm_Add.UpDown1Click(Sender: TObject; Button: TUDBtnType);
begin
 ADOQuery1.Close;
 ADOQuery1.Parameters[0].Value:=StrToInt(Edit5.Text);
 ADOQuery1.Parameters[1].Value:=StrToInt(Edit6.Text);
 ADOQuery1.Parameters[2].Value:=Edit3.Tag;
 ADOQuery1.Open;
 Edit13.Text:=FloatToStr(ADOQuery1total_matl_amount.Value+strtofloat(Edit7.Text));
 Edit14.Text:=FloatToStr(ADOQuery1total_tax_amount.Value+strtofloat(Edit9.Text));
 ADOQuery2.Close;
 ADOQuery2.Parameters[0].Value:=StrToInt(Edit5.Text);
 ADOQuery2.Parameters[1].Value:=StrToInt(Edit6.Text);
 ADOQuery2.Parameters[2].Value:=Edit3.Tag;
 ADOQuery2.Open;
 Edit17.Text:=FloatToStr(ADOQuery2matl_total.Value-strtofloat(Edit13.Text));
 Edit18.Text:=FloatToStr(ADOQuery2tax_total.Value-strtofloat(Edit14.Text));
end;

procedure TForm_Add.Edit7Change(Sender: TObject);
begin
 if Edit7.Text='' then
 Edit7.Text:='0.00';
 if Edit7.Text='-' then
 Edit7.Text:='-0.00';
 ADOQuery1.Close;
 ADOQuery1.Parameters[0].Value:=StrToInt(Edit5.Text);
 ADOQuery1.Parameters[1].Value:=StrToInt(Edit6.Text);
 ADOQuery1.Parameters[2].Value:=Edit3.Tag;
 ADOQuery1.Open;
 if flag=1 then      //编辑
 begin
  Edit13.Text:=FloatToStr(ADOQuery1total_matl_amount.Value+strtofloat(Edit7.Text)-dm.ADO127MATL_amount.Value);
 end
 else
 if (flag=0) or (flag=3) then  //新增，复制
 begin
  Edit13.Text:=FloatToStr(ADOQuery1total_matl_amount.Value+strtofloat(Edit7.Text));
 end;
end;

procedure TForm_Add.Edit9Change(Sender: TObject);
begin
 if Edit9.Text='' then
 Edit9.Text:='0.00';
 ADOQuery1.Close;
 ADOQuery1.Parameters[0].Value:=StrToInt(Edit5.Text);
 ADOQuery1.Parameters[1].Value:=StrToInt(Edit6.Text);
 ADOQuery1.Parameters[2].Value:=Edit3.Tag;
 ADOQuery1.Open;
 if flag=1 then
 begin
 Edit14.Text:=FloatToStr(ADOQuery1total_tax_amount.Value+strtofloat(Edit9.Text)-dm.ADO127tax_amount.Value);
 end
 else
 if (flag=0) or (flag=3) then
 begin
 Edit14.Text:=FloatToStr(ADOQuery1total_tax_amount.Value+strtofloat(Edit9.Text));
 end;
end;

procedure TForm_Add.Edit5Change(Sender: TObject);
begin
 if (flag=0) or (flag=3) then
 begin
 ADOQuery1.Close;
 ADOQuery1.Parameters[0].Value:=StrToInt(Edit5.Text);
 ADOQuery1.Parameters[1].Value:=StrToInt(Edit6.Text);
 ADOQuery1.Parameters[2].Value:=Edit3.Tag;
 ADOQuery1.Open;
 Edit13.Text:=FloatToStr(ADOQuery1total_matl_amount.Value+strtofloat(Edit7.Text));
 Edit14.Text:=FloatToStr(ADOQuery1total_tax_amount.Value+strtofloat(Edit9.Text));
 ADOQuery2.Close;
 ADOQuery2.Parameters[0].Value:=StrToInt(Edit5.Text);
 ADOQuery2.Parameters[1].Value:=StrToInt(Edit6.Text);
 ADOQuery2.Parameters[2].Value:=Edit3.Tag;
 ADOQuery2.Open;
 Edit17.Text:=FloatToStr(ADOQuery2matl_total.Value-strtofloat(Edit13.Text));
 Edit18.Text:=FloatToStr(ADOQuery2tax_total.Value-strtofloat(Edit14.Text));
 end;
end;

procedure TForm_Add.Edit13Change(Sender: TObject);
begin
 ADOQuery2.Close;
 ADOQuery2.Parameters[0].Value:=StrToInt(Edit5.Text);
 ADOQuery2.Parameters[1].Value:=StrToInt(Edit6.Text);
 ADOQuery2.Parameters[2].Value:=Edit3.Tag;
 ADOQuery2.Open;
 Edit17.Text:=FloatToStr(ADOQuery2matl_total.Value-strtofloat(Edit13.Text));
end;

procedure TForm_Add.Edit14Change(Sender: TObject);
begin
 ADOQuery2.Close;
 ADOQuery2.Parameters[0].Value:=StrToInt(Edit5.Text);
 ADOQuery2.Parameters[1].Value:=StrToInt(Edit6.Text);
 ADOQuery2.Parameters[2].Value:=Edit3.Tag;
 ADOQuery2.Open;
 Edit18.Text:=FloatToStr(ADOQuery2tax_total.Value-strtofloat(Edit14.Text));
end;

procedure TForm_Add.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9','.','-',#8,#13]) then  //判断是否输入数字
    abort
  else
    if key = chr(46) then      //判断是否重复输入小数点'.'
      if pos('.',(sender as tedit).Text)>0  then abort;
end;

procedure TForm_Add.Edit8KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Key<>9) then
  begin
    if (Key <>109) and (Trim(Edit8.Text)<>'') then
    begin
      Edit9.Text:=FormatFloat('0.00',StrToFloat(Edit7.Text)*StrToFloat(Edit8.Text)*0.01);
      Edit10.Text:=FormatFloat('0.00',StrToFloat(Edit7.Text)+StrToFloat(Edit9.Text));
    end;
  end;
end;

end.
