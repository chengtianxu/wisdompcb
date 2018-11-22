unit EditDetailZx_Mod27;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.Buttons, DBCtrlsEh, RzEdit, RzBtnEdt, uRKeyBtnEdit,
  Data.DB, Datasnap.DBClient;

type
  TfrmEditDetailZx_Mod27 = class(TfrmBaseEdit)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    lbl1: TLabel;
    DrdgForm: TDBRadioGroup;
    BtnHisPrice: TBitBtn;
    BtnCurr: TButton;
    DcmbHbdj: TDBComboBox;
    dbchkIF_urgency: TDBCheckBox;
    RedtSupp: TRKeyRzBtnEdit;
    RedtMaterName: TRKeyRzBtnEdit;
    RedtMaterGuige: TRKeyRzBtnEdit;
    RedtUnitName: TRKeyRzBtnEdit;
    RedtRqReason: TRKeyRzBtnEdit;
    DtpkXqrq: TDBDateTimeEditEh;
    DtpkReply: TDBDateTimeEditEh;
    RedtQuantity: TRKeyRzBtnEdit;
    RedtTax_price: TRKeyRzBtnEdit;
    RedtRqNeedQty: TRKeyRzBtnEdit;
    RedtRate: TRKeyRzBtnEdit;
    RedtPrice: TRKeyRzBtnEdit;
    Label8: TLabel;
    ds204: TDataSource;
    cds204: TClientDataSet;
    RKeyRzBtnEdit1: TRKeyRzBtnEdit;
    dbcbbDESCRIPTION_2: TDBComboBox;
    procedure RedtSuppButtonClick(Sender: TObject);
    procedure RedtSuppExit(Sender: TObject);
    procedure BtnCurrClick(Sender: TObject);
    procedure RedtQuantityKeyPress(Sender: TObject; var Key: Char);
    procedure RedtTax_priceKeyPress(Sender: TObject; var Key: Char);
    procedure RedtRateKeyPress(Sender: TObject; var Key: Char);
    procedure RedtRqNeedQtyKeyPress(Sender: TObject; var Key: Char);
    procedure RedtQuantityChange(Sender: TObject);
    procedure RedtTax_priceExit(Sender: TObject);
    procedure RedtRateExit(Sender: TObject);
    procedure RedtQuantityExit(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure BtnHisPriceClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure RedtUnitNameButtonClick(Sender: TObject);
  private
    { Private declarations }
    v_close:byte;
  public
    { Public declarations }
  FeditType:Integer;
  procedure getdataZx(Rkey:string);
  procedure InitZx(Ftype:Integer);
  end;

var
  frmEditDetailZx_Mod27: TfrmEditDetailZx_Mod27;

implementation
uses
uCommFunc,uBaseSinglePickListFrm, HisPriceZx_Mod27;
{$R *.dfm}
procedure TfrmEditDetailZx_Mod27.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmEditDetailZx_Mod27.BtnCurrClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
  LFrm:=TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(27,3,' WHERE 1=1 ');
    if LFrm.ShowModal= mrOk then
    begin
      cds204.Edit;
      cds204.FieldByName('PO_LINK_PTR').Value:= LFrm.cdsPick.FieldByName('RKEY').Value;
      cds204.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEditDetailZx_Mod27.BtnHisPriceClick(Sender: TObject);
var
Lsql:string;
begin
  inherited;
  if Trim(cds204.FieldByName('DESCRIPTION_1').AsString)='' then
  begin
   ShowMessage('没有指定相关杂项物品');
   Exit;
  end;
  Lsql:='SELECT TOP 50 Data0204.DESCRIPTION_1, dbo.Data0204.GUI_GE,'+
       ' Data0204.QUANTITY_REQUIRED, dbo.Data0204.UNIT_PRICE,'+
       ' Data0204.REQ_DATE, dbo.Data0204.o_i_flag, dbo.Data0001.CURR_NAME,'+
       ' Data0023.ABBR_NAME, dbo.Data0002.UNIT_NAME'+
       ' FROM Data0204 INNER JOIN Data0001 ON'+
       ' Data0204.PO_LINK_PTR = dbo.Data0001.RKEY INNER JOIN Data0023 ON'+
       ' Data0204.SUPPLIER_PTR = dbo.Data0023.RKEY INNER JOIN'+
       ' Data0002 ON dbo.Data0204.G_L_PTR = dbo.Data0002.RKEY'+
       ' where Data0204.DESCRIPTION_1 ='+quotedstr(cds204.FieldByName('DESCRIPTION_1').AsString)+
       ' ORDER BY dbo.Data0204.REQ_DATE DESC';
  try
   frmHisPriceZx_Mod27:=TfrmHisPriceZx_Mod27.Create(nil);
   gSvrIntf.IntfGetDataBySql(Lsql,frmHisPriceZx_Mod27.cds204);
   frmHisPriceZx_Mod27.ShowModal;
  finally
   frmHisPriceZx_Mod27.Free;
  end;
end;


procedure TfrmEditDetailZx_Mod27.btnSaveClick(Sender: TObject);
begin
  inherited;
if trim(RedtMaterName.Text) = '' then
  begin
   messagedlg('物品名称不能为空!',mtinformation,[mbcancel],0);
   RedtMaterName.SetFocus;
   exit;
  end;
 if trim(RedtMaterGuige.Text) = '' then
  begin
   messagedlg('物品规格不能为空!',mtinformation,[mbcancel],0);
   RedtMaterGuige.SetFocus;
   exit;
  end;
 if trim(dbcbbDESCRIPTION_2.Text) = '' then
  begin
   messagedlg('请购类别不能为空!',mtinformation,[mbcancel],0);
   dbcbbDESCRIPTION_2.setfocus;
   exit;
  end;

 if StrToFloat(Trim(RedtQuantity.Text)) <= 0 then
  begin
   messagedlg('请输入正确的采购数量!',mtinformation,[mbcancel],0);
   RedtQuantity.SetFocus;
   exit;
  end;


 if trim(RedtUnitName.Text) = '' then
  begin
   messagedlg('采购单位不能为空',mtinformation,[mbcancel],0);
   RedtUnitName.SetFocus;
   exit;
  end;

 if trim(RedtRqReason.Text) = '' then
  begin
   messagedlg('请输入请购原因!',mtinformation,[mbcancel],0);
   RedtRqReason.SetFocus;
   exit;
  end;

if cds204.FieldByName('o_i_flag').AsVariant = null then
 begin
  messagedlg('请确定采购单格式',mtinformation,[mbcancel],0);
  DrdgForm.SetFocus;
  exit;
 end;
 v_close := 1;
 ModalResult :=mrok;
end;

procedure TfrmEditDetailZx_Mod27.getdataZx(Rkey: string);
var
  lSQL:string;
  Lcds75:TClientDataSet;
begin
  lSQL := ' select d204.*,d2.unit_code,d2.unit_name,d1.curr_code,d1.curr_name,d23.abbr_name'+
          ' from Data0204 d204 ' +
          ' inner join data0002 d2 on d204.G_L_PTR=d2.rkey'+
          ' left outer join data0001 d1 on d204.PO_LINK_PTR=d1.rkey'+
          ' left outer join data0023 d23 on d204.SUPPLIER_PTR=d23.rkey'+
          ' where d204.rkey = '+ Rkey;
  gSvrIntf.IntfGetDataBySql(lSQL,cds204);
  Lcds75:=TClientDataSet.Create(nil);
  try
   gSvrIntf.IntfGetDataBySql('select * from data0075 order by DESCRIPTION',Lcds75);
    while not Lcds75.Eof do
    begin
      dbcbbDESCRIPTION_2.Items.Add(trim(Lcds75.FieldByName('DESCRIPTION').Value));
      Lcds75.Next;
    end;
  finally
   Lcds75.Free;
  end;
end;

procedure TfrmEditDetailZx_Mod27.InitZx(Ftype: Integer);
begin
  if Ftype=0 then
  begin
  cds204.Append;
  cds204.FieldByName('IF_urgency').Value:=0;
  cds204.FieldByName('REQ_DATE').AsDateTime:=gFunc.GetSvrDateTime;
  cds204.FieldByName('reply_date').AsDateTime:=gFunc.GetSvrDateTime;
  cds204.FieldByName('QUANTITY_REQUIRED').Value:=0;
  cds204.FieldByName('UNIT_PRICE').Value :=0;
  cds204.FieldByName('TAX_FLAG').Value :='N';
  cds204.FieldByName('tax').Value :=0;
  cds204.FieldByName('tax_PRICE').Value :=0;
  cds204.FieldByName('status').Value :=0;
  cds204.Post;
  end;
end;
procedure TfrmEditDetailZx_Mod27.RedtQuantityChange(Sender: TObject);
begin
  inherited;
  if Trim(RedtQuantity.Text)='' then
  RedtQuantity.Text:='0';
end;

procedure TfrmEditDetailZx_Mod27.RedtQuantityExit(Sender: TObject);
begin
  inherited;
  if Trim(RedtQuantity.Text)='' then
  RedtQuantity.Text:='0';

  if FeditType=0 then
  begin
  cds204.Edit;
  cds204.FieldByName('req_quantity').AsString:=RedtQuantity.Text;
  cds204.Post;
  end;
end;

procedure TfrmEditDetailZx_Mod27.RedtQuantityKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if not CharInSet(Key,['0'..'9',#46,#8,#13]) then   Abort  //判断是否输入数字
   else if Key = Chr(46)  then
   if pos('.',RedtQuantity.Text)>0 then Abort;    //判断是否重复输入小数点'.'
end;

procedure TfrmEditDetailZx_Mod27.RedtRateExit(Sender: TObject);
begin
  inherited;
  if Trim(RedtRate.Text)='' then
  RedtRate.Text:='0';
end;

procedure TfrmEditDetailZx_Mod27.RedtRateKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if not CharInSet(Key,['0'..'9',#46,#8,#13]) then   Abort  //判断是否输入数字
   else if Key = Chr(46)  then
   if pos('.',RedtQuantity.Text)>0 then Abort;    //判断是否重复输入小数点'.'
end;

procedure TfrmEditDetailZx_Mod27.RedtRqNeedQtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if not CharInSet(Key,['0'..'9',#46,#8,#13]) then   Abort  //判断是否输入数字
   else if Key = Chr(46)  then
   if pos('.',RedtQuantity.Text)>0 then Abort;    //判断是否重复输入小数点'.'
end;

procedure TfrmEditDetailZx_Mod27.RedtSuppButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
  Lcds24:TClientDataSet;
  Lsql24:string;
begin
  LFrm:=TfrmSinglePickList.Create(Self);
  Lcds24:=TClientDataSet.Create(nil);
  try
    if Trim(RedtSupp.Text)<>'' then
     LFrm.InitWithPickID(27,2,' and data0023.code LIKE ''%'+Trim(RedtSupp.Text)+'%''')
    else
    LFrm.InitWithPickID(27,2,' ORDER BY Data0023.CODE');
    if LFrm.cdsPick.IsEmpty then
    begin
     ShowMessage('没有找到相关供应商记录!');
     Exit;
    end;
    if LFrm.ShowModal= mrOk then
    begin
      RedtSupp.Font.Color := clwindowtext;
      cds204.Edit;
      cds204.FieldByName('supplier_ptr').Value:= LFrm.cdsPick.FieldByName('rkey').Value;
      cds204.FieldByName('abbr_name').Value:= LFrm.cdsPick.FieldByName('abbr_name').Value;
      cds204.FieldByName('PO_LINK_PTR').Value:= LFrm.cdsPick.FieldByName('currency_ptr').Value;
      cds204.Post;
      //复制装运地址中的税率值
      Lsql24:='SELECT top 1 data0189.state_tax'+
       ' FROM Data0024,data0189'+
       ' WHERE data0024.city_tax_ptr=data0189.rkey and'+
       ' Data0024.SUPPLIER_PTR ='+LFrm.cdsPick.FieldByName('rkey').AsString+
       ' order by data0024.rkey';
       gSvrIntf.IntfGetDataBySql(Lsql24,Lcds24);
       cds204.Edit;
       cds204.FieldByName('tax').Value:= Lcds24.FieldByName('state_tax').Value;  //增值税率
       cds204.Post;
    end;
  finally
    LFrm.Free;
    Lcds24.Free;
  end;
end;

procedure TfrmEditDetailZx_Mod27.RedtSuppExit(Sender: TObject);
var
Lsql23,Lsql24:string;
Lcds23,Lcds24:TClientDataSet;
begin
 //inherited;
 Lcds23:=TClientDataSet.Create(nil);
 Lcds24:=TClientDataSet.Create(nil);
 if (trim(RedtSupp.Text)<>'') then
 try
  Lsql23:='SELECT RKEY,CODE,SUPPLIER_NAME,currency_ptr,abbr_name'+
    ' FROM Data0023'+
    ' where data0023.status=0'+
    ' and data0023.code='+quotedstr(RedtSupp.Text);
  gSvrIntf.IntfGetDataBySql(Lsql23,Lcds23);
  if not Lcds23.IsEmpty then
   begin
   cds204.Edit;
   cds204.FieldByName('supplier_ptr').Value:=Lcds23.FieldByName('rkey').Value;
   RedtSupp.Font.Color := clwindowtext;
   cds204.FieldByName('abbr_name').Value:=Lcds23.FieldByName('abbr_name').Value;
   cds204.FieldByName('PO_LINK_PTR').Value:=Lcds23.FieldByName('currency_ptr').Value;
   cds204.Post;
   Lsql24:='SELECT top 1 data0189.state_tax'+
       ' FROM Data0024,data0189'+
       ' WHERE data0024.city_tax_ptr=data0189.rkey and'+
       ' Data0024.SUPPLIER_PTR ='+cds204.FieldByName('supplier_ptr').AsString+
       ' order by data0024.rkey';
   gSvrIntf.IntfGetDataBySql(Lsql24,Lcds24);
   cds204.Edit;
   cds204.FieldByName('tax').Value:=Lcds24.FieldByName('state_tax').Value;
   cds204.Post;
   end
  else
  begin
   messagedlg('供应商代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   RedtSupp.SetFocus;
  end;
 finally
  Lcds23.Free;
  Lcds24.Free;
 end
else
if (trim(RedtSupp.Text)='') then
 begin
  cds204.Edit;
  cds204.FieldByName('supplier_ptr').AsVariant := null;
  cds204.FieldByName('abbr_name').AsVariant := null;
  cds204.FieldByName('PO_LINK_PTR').AsVariant := null;
  cds204.Post;
 end;
end;

procedure TfrmEditDetailZx_Mod27.RedtTax_priceExit(Sender: TObject);
begin
 inherited;
 if trim(RedtTax_price.Text)='' then RedtTax_price.Text :='0';
 cds204.Edit;
 cds204.FieldByName('UNIT_PRICE').Value:=
    cds204.FieldByName('tax_price').value/(1+cds204.FieldByName('tax').value*0.01);
end;

procedure TfrmEditDetailZx_Mod27.RedtTax_priceKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if not CharInSet(Key,['0'..'9',#46,#8,#13]) then   Abort  //判断是否输入数字
   else if Key = Chr(46)  then
   if pos('.',RedtQuantity.Text)>0 then Abort;    //判断是否重复输入小数点'.'
end;

procedure TfrmEditDetailZx_Mod27.RedtUnitNameButtonClick(Sender: TObject);
var
LFrm:TfrmSinglePickList;
begin
  LFrm:=TfrmSinglePickList.Create(Self);
  try
    if Trim(RedtUnitName.Text)<>'' then
    LFrm.InitWithPickID(29,6,' and d17.inv_part_number LIKE ''%'+Trim(RedtUnitName.Text)+'%''')
    else
    LFrm.InitWithPickID(29,6,'');
    if LFrm.cdsPick.IsEmpty then
    begin
     ShowMessage('系统还没有创建相关单位代码,请联系管理员!');
     Exit;
    end;
    if LFrm.ShowModal= mrOk then
    begin
      cds204.Edit;
      cds204.FieldByName('G_L_PTR').Value:= LFrm.cdsPick.FieldByName('RKEY').Value;
      cds204.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

end.
