unit EditDetail_Mod27;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.Buttons, DBCtrlsEh, RzEdit, RzBtnEdt, uRKeyBtnEdit,
  Data.DB, Datasnap.DBClient;

type
  TfrmEditDetail_Mod27 = class(TfrmBaseEdit)
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
    Label13: TLabel;
    Label14: TLabel;
    avl_flag: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    lbl1: TLabel;
    DrdgForm: TDBRadioGroup;
    BtnHisPrice: TBitBtn;
    BtnStock: TButton;
    BtnZtcy: TButton;
    CkbxHbrk: TCheckBox;
    dbchkIF_urgency: TDBCheckBox;
    RedtNeedFac: TRKeyRzBtnEdit;
    RedtMaterCode: TRKeyRzBtnEdit;
    RedtSpecReq: TRKeyRzBtnEdit;
    RedtRqNeedQty: TRKeyRzBtnEdit;
    DtpkYqdhrq: TDBDateTimeEditEh;
    DtpkReplyRq: TDBDateTimeEditEh;
    RedtRqQty: TRKeyRzBtnEdit;
    RedtPrice: TRKeyRzBtnEdit;
    RedtTax_price: TRKeyRzBtnEdit;
    RedtRqReason: TRKeyRzBtnEdit;
    RedtTranRate: TRKeyRzBtnEdit;
    RedtPurUnit1: TRKeyRzBtnEdit;
    RedtPriceBz: TRKeyRzBtnEdit;
    RedtHbdj: TRKeyRzBtnEdit;
    RedtCaf: TRKeyRzBtnEdit;
    RedtSupp: TRKeyRzBtnEdit;
    cds69: TClientDataSet;
    ds69: TDataSource;
    RedtPurUnit2: TRKeyRzBtnEdit;
    RedtIfMajor: TRKeyRzBtnEdit;
    cds28: TClientDataSet;
    cds17: TClientDataSet;
    RedtCurr: TRKeyRzBtnEdit;
    RedtRate: TRKeyRzBtnEdit;
    RKeyRzBtnEdit1: TRKeyRzBtnEdit;
    Label22: TLabel;
    procedure RedtMaterCodeButtonClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure check_inv(rkey17,SUPPLIER_PTR:integer;PART_DESCRIPTION:string);
    procedure check_nosupp(rkey17,SUPPLIER_PTR:integer);//检查材料是否定义了供应商价格排程
    procedure find_supplier();
    procedure RedtMaterCodeExit(Sender: TObject);
    procedure RedtRqQtyKeyPress(Sender: TObject; var Key: Char);
    procedure RedtPriceKeyPress(Sender: TObject; var Key: Char);
    procedure RedtTax_priceKeyPress(Sender: TObject; var Key: Char);
    procedure RedtRqNeedQtyKeyPress(Sender: TObject; var Key: Char);
    procedure RedtSuppButtonClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure BtnHisPriceClick(Sender: TObject);
    procedure BtnStockClick(Sender: TObject);
    procedure BtnZtcyClick(Sender: TObject);
    procedure RedtSuppKeyPress(Sender: TObject; var Key: Char);
    procedure RedtSuppExit(Sender: TObject);
    procedure RedtMaterCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RedtRqQtyExit(Sender: TObject);
    procedure RedtPriceExit(Sender: TObject);
    procedure RedtTax_priceExit(Sender: TObject);
  private
    { Private declarations }
   v_close:byte;
   price_28:double;
   prot_ptr:Integer;     //环保认可主键
   function find_supp_protection(prot_report_ptr:Integer):Boolean;
  public
    { Public declarations }
    FeditType:Integer;
    procedure getdata(Rkey:string);
    procedure Init(Ftype:Integer);
    procedure LoadData;     //20170215 add by zsp
  end;

var
  frmEditDetail_Mod27: TfrmEditDetail_Mod27;

implementation
 uses
 uCommFunc,uBaseSinglePickListFrm, HisPrice_Mod27, MatStock_Mod280,
  MaterZt_Mod280;
{$R *.dfm}
procedure TfrmEditDetail_Mod27.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmEditDetail_Mod27.getdata(Rkey: string);
var
  lSQL:string;
begin
  lSQL := ' select d69.*,d17.inv_part_number,d17.inv_description,d17.inv_name,'
          +'d17.STOCK_PURCH,d17.PURCH_UNIT_PTR,d17.STOCK_UNIT_PTR,d1.curr_code,d1.curr_name,'
          +'case d17.CRITICAL_MATL_FLAG when 0 then ''否'' when 1 then ''是'' end as CRITICAL_MATL,'
          +'d2.unit_code,d2.unit_name,d2a.unit_code st_nu_code ,d2a.unit_name st_un_name,d17.inspect,'
          +'d17.REPORT_VALUE2, d17.CONSIGN_ONHAND_QTY,d23.abbr_name from Data0069 d69 ' +
          ' inner join data0017 d17 on d69.INVT_PTR = d17.RKEY ' +
          ' inner join  data0002  d2 on d17.PURCH_UNIT_PTR=d2.rkey inner join  '+
          ' data0002 d2a on d17.STOCK_UNIT_PTR=d2a.rkey left join data0001 d1'+
          ' on d69.PO_LINK_PTR=d1.rkey Left join data0023 d23'+
          ' on d69.supp_ptr=d23.rkey'+
          ' where d69.Rkey = ' +Rkey;
  gSvrIntf.IntfGetDataBySql(lSQL,cds69);
end;

procedure TfrmEditDetail_Mod27.Init(Ftype: Integer);
begin
  if Ftype=0 then//新增请购请求
  begin
  cds69.Append;
  cds69.FieldByName('QUANTITY').Value:=0;
  cds69.FieldByName('REQ_DATE').AsDateTime:=gFunc.GetSvrDateTime;
  cds69.FieldByName('reply_date').AsDateTime:=gFunc.GetSvrDateTime;
  cds69.FieldByName('UNIT_PRICE').Value:=0;
  cds69.FieldByName('tax').Value:=0;
  cds69.FieldByName('tax_price').Value:=0;
  cds69.Post;
  end;
end;

procedure TfrmEditDetail_Mod27.LoadData;    ////20170215   add by zsp
var
  LSql:string;
  LCds:TClientDataSet;
begin
  if (cds69.FieldByName('INVT_PTR').AsInteger > 0)
              and (cds69.FieldByName('SUPP_PTR').AsInteger > 0) then
  begin
    LSql:=' select data0028.rkey,data0028.supplier_ptr,data0028.PRICE_1,TAX_FLAG,' + #13 +
          '        data0028.prot_report_ptr,data0028.remark' + #13 +
          'from data0028 ' + #13 +
          'where data0028.supplier_ptr= '+ cds69.FieldByName('SUPP_PTR').AsString +
          'and data0028.inventory_ptr= '+ cds69.FieldByName('INVT_PTR').AsString;
    LCds:= TClientDataSet.Create(nil);
    try
      if not gSvrIntf.IntfGetDataBySql(LSql,LCds) then exit;
      if not LCds.IsEmpty then
      begin
        avl_flag.Caption:= LCds.FieldByName('Tax_Flag').AsString;
        Self.price_28:= LCds.FieldByName('Price_1').Value;
        self.prot_ptr:= LCds.FieldByName('prot_report_ptr').AsInteger;
      end;
    finally
      LCds.Free;
    end;
  end;
end;

procedure TfrmEditDetail_Mod27.RedtMaterCodeButtonClick(Sender: TObject);
var
  LFrm: TfrmSinglePickList;
begin
//  inherited;
  LFrm := TfrmSinglePickList.Create(Self);
  try
    if Trim(RedtMaterCode.Text)<>'' then
    LFrm.InitWithPickID(280,StrToInt(RedtMaterCode.DisplayPickID),' and inv_part_number LIKE ''%'+Trim(RedtMaterCode.Text)+'%''')
    else
    LFrm.InitWithPickID(280,StrToInt(RedtMaterCode.DisplayPickID),'');
    if LFrm.ShowModal = mrOk then
    begin
      cds69.Edit;
      cds69.FieldByName('req_unit_ptr').Value:=LFrm.cdsPick.FieldByName('STOCK_UNIT_PTR').Value;
      if LFrm.cdsPick.FieldByName('CATALOG_NUM').AsVariant<>null then
      CkbxHbrk.Checked:=Trim(LFrm.cdsPick.FieldByName('CATALOG_NUM').Value)='Y';
      cds69.FieldByName('inv_name').Value:=LFrm.cdsPick.FieldByName('inv_name').Value;
      cds69.FieldByName('INV_DESCRIPTION').Value:=LFrm.cdsPick.FieldByName('INV_DESCRIPTION').Value;
      cds69.FieldByName('CONVERSION_FACTOR').AsFloat:=LFrm.cdsPick.FieldByName('STOCK_PURCH').AsFloat;
      cds69.FieldByName('avl_flag').AsString:=LFrm.cdsPick.FieldByName('INSPECT').AsString;
      cds69.FieldByName('REPORT_VALUE2').AsFloat:=LFrm.cdsPick.FieldByName('REPORT_VALUE2').AsFloat;
      cds69.FieldByName('REQ_DATE').AsDateTime:=gFunc.GetSvrDateTime;
      cds69.FieldByName('status').Value:=0;
      cds69.FieldByName('IF_urgency').Value:=0;
      cds69.FieldByName('req_quantity').Value:=0;
      cds69.Post;
      self.check_inv(LFrm.cdsPick.FieldByName('rkey').AsInteger,
                     LFrm.cdsPick.FieldByName('PREF_SUPPLIER_PTR').AsInteger,
                     trim(LFrm.cdsPick.FieldByName('INV_PART_DESCRIPTION').AsString));
      if activecontrol.Name = 'RedtMaterCodeButton' then
        RedtSupp.SetFocus;
    end
    else
    RedtMaterCode.SetFocus;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEditDetail_Mod27.RedtMaterCodeExit(Sender: TObject);
var
Lsql17:string;
begin
  inherited;
 if trim(RedtMaterCode.Text)<>'' then
  begin
   Lsql17:='select rkey,PREF_SUPPLIER_PTR,INV_PART_DESCRIPTION,STOCK_UNIT_PTR,INSPECT,CATALOG_NUM'+
           ' from data0017'+
           ' where INV_PART_NUMBER='''+trim(RedtMaterCode.Text)+''' and STOP_PURCH=''N''';
    gSvrIntf.IntfGetDataBySql(Lsql17,cds17);
    if not cds17.IsEmpty then
    begin
      if cds17.FieldByName('rkey').Value=cds69.FieldByName('INVT_PTR').Value then
       begin
        if cds69.FieldByName('SUPP_PTR').AsVariant=null then  //材料确定查找供应商
        check_nosupp(cds69.FieldByName('INVT_PTR').Value,cds17.FieldByName('PREF_SUPPLIER_PTR').AsInteger);
       end
      else
       begin
        CkbxHbrk.Checked:=Trim(cds17.FieldByName('CATALOG_NUM').AsString)='Y';
        cds69.Edit;
        cds69.FieldByName('req_unit_ptr').Value:=cds17.FieldByName('STOCK_UNIT_PTR').Value;  //存货单位02
        cds69.FieldByName('avl_flag').Value:=cds17.FieldByName('INSPECT').AsString;  //是否检查
        cds69.Post;
        self.check_inv(cds17.FieldByName('rkey').AsInteger,
                     cds17.FieldByName('PREF_SUPPLIER_PTR').AsInteger,
                     trim(cds17.FieldByName('INV_PART_DESCRIPTION').AsString));
       end;
    end
    else
    begin
      messagedlg('原材料号码不正确,请重新输入或选择',mtinformation,[mbok],0);
      RedtIfMajor.Text := '';
      RedtMaterCode.SetFocus;
    end;
  end
 else
  if trim(RedtMaterCode.Text) = '' then
   begin
    RedtIfMajor.Text := '';
    CkbxHbrk.Checked:=False;
    cds69.Edit;
    cds69.FieldByName('INVT_PTR').AsVariant:=null;
    cds69.Post;
   end;
end;

procedure TfrmEditDetail_Mod27.RedtMaterCodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key=13 then RedtSupp.SetFocus;
end;

procedure TfrmEditDetail_Mod27.RedtPriceExit(Sender: TObject);
begin
  inherited;
  //////////////////////modyfy by zsp    2017-02-15//////// start//

  if trim(RedtPrice.Text) = '' then cds69.FieldByName('unit_price').Value := 0;
  if (trim(RedtSupp.Text) = '') and (cds69.FieldByName('unit_price').Value > 0) then
  begin
    showmessage('供应商没有确定之前,不能确定价格');
    RedtPrice.SetFocus;
  end
  else
  if self.avl_flag.Caption='Y' then  //如果价格含税
  begin
    if (trim(RedtSupp.Text)<>'') and
      (cds69.FieldByName('unit_price').Value - price_28/(1 + cds69.FieldByName('tax').Value * 0.01)>0.01) then
    begin
     showmessage('不含税价格不能大于交付排程的价格!');
     RedtPrice.SetFocus;
    end
    else
    begin
     cds69.FieldByName('tax_price').Value:=strtofloat(
      formatfloat('0.0000',cds69.FieldByName('unit_price').Value*(1 + cds69.FieldByName('tax').Value * 0.01)));
    end;
  end
  else
  begin
    if (trim(RedtSupp.Text)<>'') and (cds69.FieldByName('unit_price').Value - price_28>0.01) then
    begin
     showmessage('不含税价格不能大于交付排程的价格!');
     RedtPrice.SetFocus;
    end
    else
    begin
     cds69.FieldByName('tax_ptrice').Value:=strtofloat(
       formatfloat('0.0000',cds69.FieldByName('unit_price').Value*(1 + cds69.FieldByName('tax').Value * 0.01)));
    end;
  end;
  ///////////////////////// //////////end////////
end;

procedure TfrmEditDetail_Mod27.RedtPriceKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if not CharInSet(Key,['0'..'9',#46,#8,#13]) then   Abort  //判断是否输入数字
   else if Key = Chr(46)  then
   if pos('.',RedtRqQty.Text)>0 then Abort;    //判断是否重复输入小数点'.'
end;

procedure TfrmEditDetail_Mod27.RedtRqNeedQtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if not CharInSet(Key,['0'..'9',#46,#8,#13]) then   Abort  //判断是否输入数字
   else if Key = Chr(46)  then
   if pos('.',RedtRqQty.Text)>0 then Abort;    //判断是否重复输入小数点'.'
end;

procedure TfrmEditDetail_Mod27.RedtRqQtyExit(Sender: TObject);
begin
  inherited;
  cds69.Edit;
  cds69.FieldByName('req_quantity').AsInteger := cds69.FieldByName('QUANTITY').AsInteger;
  cds69.Post;
end;

procedure TfrmEditDetail_Mod27.RedtRqQtyKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if not CharInSet(Key,['0'..'9',#46,#8,#13]) then   Abort  //判断是否输入数字
   else if Key = Chr(46)  then
   if pos('.',RedtRqQty.Text)>0 then Abort;    //判断是否重复输入小数点'.'
end;

procedure TfrmEditDetail_Mod27.RedtSuppButtonClick(Sender: TObject);
var
  LFrm: TfrmSinglePickList;
begin
 if trim(RedtMaterCode.Text) = '' then
 begin
  messagedlg('请先输入原材料!',mtinformation,[mbok],0);
  Exit;
  RedtMaterCode.SetFocus;
 end
 else
 begin
  LFrm := TfrmSinglePickList.Create(Self);
  try
    if Trim(RedtSupp.Text)<>'' then
     LFrm.InitWithPickID(27,1,' and data0028.inventory_ptr='+cds69.FieldByName('INVT_PTR').AsString+' and data0023.code LIKE ''%'+Trim(RedtSupp.Text)+'%''')
    else
    LFrm.InitWithPickID(27,1,' and data0028.inventory_ptr='+cds69.FieldByName('INVT_PTR').AsString);
    if LFrm.cdsPick.IsEmpty then
    begin
      messagedlg('没有找到相关记录!',mtinformation,[mbcancel],0);
      RedtSupp.SetFocus;
    end
    else
   if LFrm.ShowModal = mrOk then
   begin
     cds69.Edit;
     cds69.FieldByName('SUPP_PTR').Value := LFrm.cdsPick.FieldByName('rkey').Value;
     cds69.FieldByName('UNIT_PTR').Value := LFrm.cdsPick.FieldByName('purchase_unit_ptr').Value;
     cds69.FieldByName('CONVERSION_FACTOR').Value := LFrm.cdsPick.FieldByName('CONVERSION_FACTOR').Value;
     cds69.FieldByName('PO_LINK_PTR').Value := LFrm.cdsPick.FieldByName('currency_ptr').Value;
     cds69.FieldByName('abbr_name').Value := LFrm.cdsPick.FieldByName('abbr_name').AsString;
     cds69.FieldByName('extra_req').Value := LFrm.cdsPick.FieldByName('SUPPLIER_PART_NO').Value;  //特别要求
     cds69.FieldByName('tax').Value := LFrm.cdsPick.FieldByName('TAX_2').Value;
     Self.prot_ptr:=LFrm.cdsPick.FieldByName('prot_report_ptr').AsInteger;//环保认可外健
     if LFrm.cdsPick.FieldByName('TAX_2').Value = 0 then
     begin
       cds69.FieldByName('UNIT_PRICE').Value := LFrm.cdsPick.FieldByName('PRICE_1').Value;
       cds69.FieldByName('TAX_PRICE').Value := LFrm.cdsPick.FieldByName('PRICE_1').Value;
     end
     else
     begin
      if LFrm.cdsPick.FieldByName('TAX_FLAG').Value='N' then
      begin
       cds69.FieldByName('UNIT_PRICE').Value := LFrm.cdsPick.FieldByName('PRICE_1').Value;
       cds69.FieldByName('TAX_PRICE').Value:=strtofloat(
       formatfloat('0.0000',cds69.FieldByName('UNIT_PRICE').Value*(1+cds69.FieldByName('tax').Value*0.01)));
      end
      else
      begin
       cds69.FieldByName('TAX_PRICE').Value := LFrm.cdsPick.FieldByName('PRICE_1').Value;
       cds69.FieldByName('UNIT_PRICE').Value :=
       cds69.FieldByName('TAX_PRICE').Value/(1+cds69.FieldByName('tax').Value*0.01);
      end;
     end;

     self.price_28 := LFrm.cdsPick.FieldByName('PRICE_1').Value;
     avl_flag.Caption:=LFrm.cdsPick.FieldByName('TAX_FLAG').Value;//价格是否含税
     cds69.FieldByName('rohs').Value:=LFrm.cdsPick.FieldByName('rohs').AsString;
     cds69.FieldByName('IF_CAF').Value:=LFrm.cdsPick.FieldByName('IF_CAF').AsString;  //耐CAF
     if LFrm.cdsPick.FieldByName('LEAD_TIME').AsInteger > 0 then
     cds69.FieldByName('reply_date').AsString:=FormatDateTime('YYYY-MM-DD hh:nn:ss',
    (gFunc.GetSvrDateTime+
     LFrm.cdsPick.FieldByName('LEAD_TIME').AsInteger));
     cds69.Post;
     RedtPriceBz.Text := LFrm.cdsPick.FieldByName('remark').AsString;
     DtpkReplyRq.SetFocus;
   end;
  finally
    LFrm.Free;
  end;
 end;
end;

procedure TfrmEditDetail_Mod27.RedtSuppExit(Sender: TObject);
var
Lsql23:string;
Lcds23:TClientDataSet;
begin
  inherited;
if (trim(RedtSupp.Text)<>'') then
begin
  Lcds23:=TClientDataSet.Create(nil);
 try
  Lsql23:='SELECT Data0023.RKEY,data0028.purchase_unit_ptr,DATA0028.IF_CAF,'+
   ' Data0023.CODE,data0028.CONVERSION_FACTOR,data0028.AVL_FLAG,Data0023.abbr_name,'+
   ' Data0023.SUPPLIER_NAME,data0028.currency_ptr,data0028.PRICE_1,data0028.prot_report_ptr,'+
   ' data0028.TAX_2,data0028.TAX_FLAG,data0028.rohs,data0028.SUPPLIER_PART_NO,'+
   ' data0028.remark,data0028.LEAD_TIME'+
   ' FROM Data0023,data0028'+
   ' where data0028.supplier_ptr = data0023.rkey '+
   ' and data0028.inventory_ptr ='+cds69.FieldByName('INVT_PTR').AsString+
   ' and data0023.code='+QuotedStr(RedtSupp.Text)+
   ' and data0023.status=0'+
   ' and data0028.AVL_FLAG=''Y'''+
   ' ORDER BY Data0023.CODE';
  gSvrIntf.IntfGetDataBySql(Lsql23,Lcds23);
  if not Lcds23.IsEmpty then
  begin
     cds69.Edit;
     cds69.FieldByName('SUPP_PTR').Value := Lcds23.FieldByName('rkey').Value;
     cds69.FieldByName('abbr_name').Value := Lcds23.FieldByName('abbr_name').Value;
     cds69.FieldByName('UNIT_PTR').Value := Lcds23.FieldByName('purchase_unit_ptr').Value;
     cds69.FieldByName('CONVERSION_FACTOR').Value := Lcds23.FieldByName('CONVERSION_FACTOR').Value;
     cds69.FieldByName('PO_LINK_PTR').Value := Lcds23.FieldByName('currency_ptr').Value;
     cds69.FieldByName('extra_req').Value := Lcds23.FieldByName('SUPPLIER_PART_NO').Value;  //特别要求
     cds69.FieldByName('tax').Value := Lcds23.FieldByName('TAX_2').Value;
     if Lcds23.FieldByName('prot_report_ptr').AsVariant<>null then
     Self.prot_ptr:=Lcds23.FieldByName('prot_report_ptr').AsInteger;//环保认可外健
     if Lcds23.FieldByName('TAX_2').Value = 0 then
     begin
     cds69.FieldByName('UNIT_PRICE').Value := Lcds23.FieldByName('PRICE_1').Value;
     cds69.FieldByName('TAX_PRICE').Value := Lcds23.FieldByName('PRICE_1').Value;
     end
     else
     begin
      if Lcds23.FieldByName('TAX_FLAG').Value='N' then
      begin
       cds69.FieldByName('UNIT_PRICE').Value := Lcds23.FieldByName('PRICE_1').Value;
       cds69.FieldByName('TAX_PRICE').Value:=strtofloat(
       formatfloat('0.0000',cds69.FieldByName('UNIT_PRICE').Value*(1+cds69.FieldByName('tax').Value*0.01)));
      end
      else
      begin
       cds69.FieldByName('TAX_PRICE').Value := Lcds23.FieldByName('PRICE_1').Value;
       cds69.FieldByName('UNIT_PRICE').Value :=
       cds69.FieldByName('TAX_PRICE').Value/(1+cds69.FieldByName('tax').Value*0.01);
      end;
     end;
     self.price_28 := Lcds23.FieldByName('PRICE_1').Value;
     avl_flag.Caption:=Lcds23.FieldByName('TAX_FLAG').Value;//价格是否含税
     cds69.FieldByName('rohs').Value:=Lcds23.FieldByName('rohs').AsString;
     cds69.FieldByName('IF_CAF').Value:=Lcds23.FieldByName('IF_CAF').AsString;  //耐CAF
     if Lcds23.FieldByName('LEAD_TIME').AsInteger > 0 then
     cds69.FieldByName('reply_date').AsString:=FormatDateTime('YYYY-MM-DD hh:nn:ss',
    (gFunc.GetSvrDateTime+
     Lcds23.FieldByName('LEAD_TIME').AsInteger));
     cds69.Post;
     RedtPriceBz.Text := Lcds23.FieldByName('remark').AsString;
     DtpkReplyRq.SetFocus;
  end
  else
  begin
   messagedlg('供应商代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   RedtPriceBz.Text :='';
   RedtSupp.SetFocus;
  end;
 finally
  Lcds23.Free;
 end
end
else
if (trim(RedtSupp.Text)='') then
 begin
  RedtPriceBz.Text:='';
  cds69.Edit;
  cds69.FieldByName('supp_ptr').AsVariant := null;
  cds69.FieldByName('abbr_name').AsVariant := null;
  cds69.FieldByName('unit_ptr').AsVariant := null;
  cds69.FieldByName('po_link_ptr').AsVariant := null; //货币
  cds69.FieldByName('unit_price').Value:=0;
  cds69.FieldByName('tax_price').Value:=0;
  cds69.FieldByName('tax').Value:=0;
  cds69.FieldByName('rohs').Value:='';
  cds69.FieldByName('if_caf').Value:='';
  cds69.FieldByName('extra_req').Value:='';
  cds69.Post;
  self.prot_ptr:=0;
 end;
end;

procedure TfrmEditDetail_Mod27.RedtSuppKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if trim(RedtMaterCode.Text)='' then
  begin
   messagedlg('请先输入请购材料!',mtinformation,[mbok],0);
   abort;
  end;
end;

procedure TfrmEditDetail_Mod27.RedtTax_priceExit(Sender: TObject);
begin
  inherited;
    //////////////////////modyfy by zsp    2017-02-15//////// start//

 if trim(RedtTax_price.Text) = '' then cds69.FieldByName('Tax_price').Value := 0;
 if (trim(RedtSupp.Text)='') and (cds69.FieldByName('Tax_price').Value>0) then
  begin
   showmessage('供应商没有确定之前,不能确定价格');
   RedtTax_price.SetFocus;
  end
 else
  if self.avl_flag.Caption='Y' then  //如果价格含税
   begin
    if (trim(RedtSupp.Text)<>'') and (cds69.FieldByName('Tax_price').Value - self.price_28 > 0.01) then
     begin
      showmessage('含税价格不能大于交付排程的价格!');
      RedtTax_price.SetFocus;
     end
    else
     begin
      cds69.FieldByName('unit_price').Value := strtofloat(
       formatfloat('0.000',cds69.FieldByName('Tax_price').Value / (1 + cds69.FieldByName('tax').Value*0.01)));
     end;
   end
  else
   begin
    if (trim(RedtSupp.Text)<>'') and
       (cds69.FieldByName('Tax_price').Value - self.price_28 * (1 + cds69.FieldByName('tax').Value * 0.01)>0.01) then
     begin
      showmessage('供应商价格不能大于交付排程的价格!');
      RedtTax_price.SetFocus;
     end
    else
     begin
      cds69.FieldByName('unit_price').Value := strtofloat(
       formatfloat('0.000',cds69.FieldByName('Tax_price').Value / (1 + cds69.FieldByName('tax').Value * 0.01)));
     end;
   end;
   /////////////////////////////////////end//////////////////
end;

procedure TfrmEditDetail_Mod27.RedtTax_priceKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if not CharInSet(Key,['0'..'9',#46,#8,#13]) then   Abort  //判断是否输入数字
   else if Key = Chr(46)  then
   if pos('.',RedtRqQty.Text)>0 then Abort;    //判断是否重复输入小数点'.'
end;

procedure TfrmEditDetail_Mod27.check_nosupp(rkey17,SUPPLIER_PTR:integer);
var
Lsql28:string;
begin
  Lsql28:='select data0028.rkey,data0028.supplier_ptr,data0028.PRICE_1,data0028.prot_report_ptr,'+
    ' data0028.purchase_unit_ptr,data0028.CONVERSION_FACTOR,data0028.AVL_FLAG,'+
    ' data0023.code,data0023.supplier_name,data0028.currency_ptr,data0028.IF_CAF,'+
    ' data0028.TAX_2,data0028.TAX_FLAG,data0028.rohs,data0028.SUPPLIER_PART_NO,'+
    ' data0028.LEAD_TIME,data0028.remark'+
    ' from data0028 inner join data0023'+
    ' on data0028.supplier_ptr=data0023.rkey'+
    ' where inventory_ptr='+cds69.FieldByName('INVT_PTR').AsString+
    ' and data0023.status=0'+
    ' and data0028.AVL_FLAG=''Y''';
  gSvrIntf.IntfGetDataBySql(Lsql28,cds28);
    if cds28.IsEmpty then //没有定义价格
     begin
      if messagedlg('材料:'+trim(RedtMaterCode.Text)+'没有定义供应商价格是否继续?',
      mtconfirmation,[mbyes,mbno],0)=mrno then
       RedtMaterCode.SetFocus
     end
    else   //已定义价格可能有多条记录
     if cds28.RecordCount=1 then //如果该材料只有一个供应商有价格表
       self.find_supplier()
     else                              //如果有多个供应商价格，那么寻找首选供应商
      if cds28.Locate('supplier_ptr',SUPPLIER_PTR,[]) then
       find_supplier();
end;

procedure TfrmEditDetail_Mod27.find_supplier();
begin
if cds69.FieldByName('SUPP_PTR').Value <> cds28.FieldValues['supplier_ptr'] then
 begin
  cds69.Edit;
  cds69.FieldByName('SUPP_PTR').Value:= cds28.FieldByName('supplier_ptr').Value; //供应商代码
  RedtSupp.Font.Color := clwindowtext;
  RedtPriceBz.Text := cds28.Fieldbyname('remark').AsString;
  cds69.FieldByName('PO_LINK_PTR').Value := cds28.FieldByName('currency_ptr').Value;  //货币
  cds69.FieldByName('UNIT_PTR').Value := cds28.FieldByName('purchase_unit_ptr').Value; //采购单位
  cds69.FieldByName('CONVERSION_FACTOR').Value := cds28.FieldByName('CONVERSION_FACTOR').Value;//转换率
  cds69.FieldByName('extra_req').Value := cds28.FieldByName('SUPPLIER_PART_NO').Value; //特别要求
  cds69.FieldByName('tax').Value :=cds28.FieldByName('TAX_2').Value;//税率
  if cds28.FieldByName('prot_report_ptr').AsVariant<>null then
  Self.prot_ptr:=cds28.FieldByName('prot_report_ptr').Value;
  if cds69.FieldByName('tax').Value = 0 then
   begin
    cds69.FieldByName('UNIT_PRICE').Value := cds28.FieldByName('PRICE_1').Value;
    cds69.FieldByName('tax_price').Value := cds28.FieldByName('PRICE_1').Value;
   end
  else
   begin
    if cds28.FieldByName('TAX_FLAG').Value='N' then
     begin
      cds69.FieldByName('UNIT_PRICE').Value := cds28.FieldByName('PRICE_1').Value;
      cds69.FieldByName('tax_price').Value:=strtofloat(
       formatfloat('0.000',cds69.FieldByName('UNIT_PRICE').Value*(1+cds69.FieldByName('tax').Value*0.01)));
     end
    else
     begin
      cds69.FieldByName('tax_price').Value := cds28.FieldByName('PRICE_1').Value;
      cds69.FieldByName('UNIT_PRICE').Value :=
      cds69.FieldByName('tax_price').Value/(1+cds69.FieldByName('tax').Value*0.01);
     end;
   end;

  self.price_28 := cds28.FieldByName('PRICE_1').Value;
  avl_flag.Caption:=cds28.FieldByName('TAX_FLAG').Value;//价格是否含税
  cds69.FieldByName('rohs').Value:=cds28.FieldByName('rohs').Value;  //环保
  cds69.FieldByName('IF_CAF').Value:=cds28.FieldByName('IF_CAF').Value; //caf

  if cds28.FieldByName('LEAD_TIME').AsInteger > 0 then
   cds69.FieldByName('reply_date').AsString:=FormatDateTime('YYYY-MM-DD hh:nn:ss',(gFunc.GetSvrDateTime+cds28.FieldByName('LEAD_TIME').AsInteger));
  cds69.Post;
 end;

end;

procedure TfrmEditDetail_Mod27.BtnHisPriceClick(Sender: TObject);
var
Lsql:string;
begin
  inherited;
  if cds69.FieldByName('INVT_PTR').AsVariant=null then
  begin
   ShowMessage('没有指定相关材料编码');
   Exit;
  end;
  Lsql:='SELECT TOP 50 Data0069.QUANTITY, dbo.Data0069.UNIT_PRICE,'+
       ' Data0069.REQ_DATE, dbo.Data0002.UNIT_NAME,'+
       ' Data0001.CURR_NAME, dbo.Data0023.ABBR_NAME,'+
       ' Data0069.o_i_flag,data0069.tax_price,data0069.tax'+
       ' FROM Data0069 INNER JOIN '+
       ' Data0023 ON dbo.Data0069.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'+
       ' Data0001 ON'+
       ' Data0069.PO_LINK_PTR = dbo.Data0001.RKEY INNER JOIN'+
       ' Data0002 ON dbo.Data0069.UNIT_PTR = dbo.Data0002.RKEY'+
       ' WHERE dbo.Data0069.INVT_PTR ='+cds69.FieldByName('INVT_PTR').AsString+
       ' ORDER BY dbo.Data0069.REQ_DATE DESC';
  try
   frmHisPrice_Mod27:=TfrmHisPrice_Mod27.Create(nil);
   gSvrIntf.IntfGetDataBySql(Lsql,frmHisPrice_Mod27.cds69);
   frmHisPrice_Mod27.ShowModal;
  finally
   frmHisPrice_Mod27.Free;
  end;
end;


procedure TfrmEditDetail_Mod27.btnSaveClick(Sender: TObject);
begin
  inherited;
  if trim(RedtMaterCode.Text) = '' then
  begin
   messagedlg('请输入正确的原材料!',mtinformation,[mbcancel],0);
   RedtMaterCode.SetFocus;
   exit;
  end;
  if StrToFloat(trim(RedtRqQty.Text)) <= 0 then
  begin
   messagedlg('请输入正确的采购数量!',mtinformation,[mbcancel],0);
   RedtRqQty.SetFocus;
   exit;
  end;
 if StrToFloat(trim(RedtPrice.Text))< 0 then
  begin
   messagedlg('请输入正确的价格!',mtinformation,[mbcancel],0);
   RedtPrice.SetFocus;
   exit;
  end;

 if trim(RedtRqReason.Text) = '' then
  begin
   messagedlg('请购原因不能为空!',mtinformation,[mbcancel],0);
   RedtRqReason.SetFocus;
   exit;
  end;
 IF cds69.FieldByName('o_i_flag').AsVariant = null then
  begin
   messagedlg('请确定采购单格式',mtinformation,[mbcancel],0);
   DrdgForm.SetFocus;
   exit;
  end;
 if Self.CkbxHbrk.Checked then
 if (self.prot_ptr=0) or (not self.find_supp_protection(prot_ptr)) then
 begin
   messagedlg('供应商没有环保认可,或者认可资料过期!',mtinformation,[mbcancel],0);
   RedtSupp.SetFocus;
   exit;
 end;
 v_close := 1;
 ModalResult := mrok;
end;

procedure TfrmEditDetail_Mod27.BtnStockClick(Sender: TObject);
var
Lsql:string;
begin
  inherited;
  if cds69.FieldByName('INVT_PTR').AsVariant=null then
  begin
   ShowMessage('没有指定相关材料编码');
   Exit;
  end;
  Lsql:=' SELECT  dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0016.LOCATION,'+
        ' dbo.Data0017.REPORT_VALUE2,dbo.Data0017.CONSIGN_ONHAND_QTY,'+
        ' dbo.Data0496.GROUP_NAME, SUM(dbo.Data0022.QUAN_ON_HAND-data0022.QUAN_TO_BE_STOCKED) AS quan_total,'+
        ' dbo.Data0002.UNIT_CODE,dbo.Data0071.reason, dbo.Data0022.BARCODE_ID, dbo.Data0023.ABBR_NAME,''通用库存'' AS type'+
        ' FROM dbo.Data0022 INNER JOIN'+
        ' dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'+
        ' dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY INNER JOIN'+
        ' dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER JOIN'+
        ' dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY INNER JOIN'+
        ' dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN'+
        ' dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'+
        ' dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.RKEY left join'+
        ' dbo.Data0071 ON dbo.Data0022.SOURCE_PTR = dbo.Data0071.RKEY'+
        ' WHERE (dbo.Data0022.QUAN_ON_HAND > 0) AND (Data0022.INVENTORY_PTR='+cds69.FieldByName('INVT_PTR').AsString+')'+
        ' GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0496.GROUP_NAME, dbo.Data0002.UNIT_CODE,'+
        ' dbo.Data0017.REPORT_VALUE2,dbo.Data0017.CONSIGN_ONHAND_QTY,dbo.Data0071.reason, dbo.Data0022.BARCODE_ID,dbo.Data0023.ABBR_NAME, dbo.Data0016.LOCATION'+
        ' union all'+
        ' SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0016.LOCATION,'+
        ' dbo.Data0017.REPORT_VALUE2,dbo.Data0017.CONSIGN_ONHAND_QTY,'+
        ' dbo.Data0496.GROUP_NAME, SUM(dbo.DATA0134.QUAN_ON_HAND) AS quan_total,'+
        ' dbo.Data0002.UNIT_CODE,dbo.Data0071.reason, dbo.Data0134.BARCODE_ID, dbo.Data0023.ABBR_NAME,''VMI库存'' AS type'+
        ' FROM dbo.Data0017 INNER JOIN'+
        ' dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY INNER JOIN'+
        ' dbo.DATA0134 ON dbo.Data0017.RKEY = dbo.DATA0134.INVENTORY_PTR INNER JOIN'+
        ' dbo.Data0002 ON dbo.DATA0134.UNIT_PTR = dbo.Data0002.RKEY INNER JOIN'+
        ' dbo.DATA0133 INNER JOIN'+
        ' dbo.Data0015 ON dbo.DATA0133.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN'+
        ' dbo.Data0023 ON dbo.DATA0133.SUPP_PTR = dbo.Data0023.RKEY ON dbo.DATA0134.GRN_PTR = dbo.DATA0133.RKEY INNER JOIN'+
        ' dbo.Data0016 ON dbo.DATA0134.LOCATION_PTR = dbo.Data0016.RKEY LEFT JOIN'+
        ' dbo.Data0071 ON dbo.DATA0134.SOURCE_PTR = dbo.Data0071.RKEY'+
        ' WHERE   (data0134.quan_on_hand>0)  and  (dbo.DATA0134.INVENTORY_ptr ='+cds69.FieldByName('INVT_PTR').AsString+')'+
        ' GROUP BY dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION, dbo.Data0496.GROUP_NAME, dbo.Data0002.UNIT_CODE,'+
        ' dbo.Data0017.REPORT_VALUE2,dbo.Data0017.CONSIGN_ONHAND_QTY, dbo.Data0071.reason, dbo.Data0134.BARCODE_ID,dbo.Data0023.ABBR_NAME, dbo.Data0016.LOCATION';

    try
     frmMatStock_Mod280:=TfrmMatStock_Mod280.Create(Application);
     gSvrIntf.IntfGetDataBySql(Lsql,frmMatStock_Mod280.cdsStock);
     frmMatStock_Mod280.ShowModal;
    finally
     frmMatStock_Mod280.Free;
    end;
end;

procedure TfrmEditDetail_Mod27.BtnZtcyClick(Sender: TObject);
var
Lsql:string;
begin
  inherited;
  if cds69.FieldByName('INVT_PTR').AsVariant=null then
  begin
   ShowMessage('没有指定相关材料编码');
   Exit;
  end;
  Lsql:='SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0023.ABBR_NAME, dbo.Data0071.QUAN_ORD,  '+
        ' dbo.Data0071.QUAN_RECD, dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD AS zaitu, dbo.Data0002.UNIT_NAME, dbo.Data0071.tax_price,  '+
        ' dbo.Data0071.TAX_2, dbo.Data0071.REQ_DATE, dbo.Data0070.PO_NUMBER, '+
        ' ISNULL(dbo.Data0005.EMPLOYEE_NAME, dbo.Data0070.ANALYSIS_CODE_1)  AS ANALYSIS_CODE_1,  '+
        ' ISNULL(Data0034_1.DEPT_NAME, dbo.Data0034.DEPT_NAME) AS dept_name,   '+
        ' ISNULL(dbo.Data0068.PO_REQ_NUMBER, dbo.Data0070.FOB) AS PO_REQ_NUMBER, dbo.Data0071.reason, dbo.Data0071.rohs,  '+
        ' dbo.Data0015.ABBR_NAME AS ComNm, Data0005_1.EMPLOYEE_NAME, dbo.Data0017.QUAN_ON_HAND  '+
        ' FROM dbo.Data0034 RIGHT OUTER JOIN dbo.Data0071 INNER JOIN '+
        ' dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.Data0070.RKEY INNER JOIN '+
        ' dbo.Data0023 ON dbo.Data0070.SUPPLIER_POINTER = dbo.Data0023.RKEY INNER JOIN '+
        ' dbo.Data0002 ON dbo.Data0071.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN '+
        ' dbo.Data0017 ON dbo.Data0071.INVT_PTR = dbo.Data0017.RKEY INNER JOIN '+
        ' dbo.Data0015 ON dbo.Data0070.WAREHOUSE_POINTER = dbo.Data0015.RKEY INNER JOIN '+
        ' dbo.Data0005 AS Data0005_1 ON dbo.Data0070.EMPLOYEE_POINTER = Data0005_1.RKEY ON '+
        ' dbo.Data0034.DEPT_CODE = dbo.Data0070.PO_REV_NO FULL OUTER JOIN '+
        ' dbo.Data0068 LEFT OUTER JOIN '+
        ' dbo.Data0034 AS Data0034_1 ON dbo.Data0068.DEPARTMENT_NAME = Data0034_1.DEPT_CODE LEFT OUTER JOIN '+
        ' dbo.Data0005 ON dbo.Data0068.REQ_BY = dbo.Data0005.RKEY FULL OUTER JOIN '+
        ' dbo.Data0069 ON dbo.Data0068.RKEY = dbo.Data0069.PURCH_REQ_PTR ON dbo.Data0071.rkey69 = dbo.Data0069.RKEY '+
        ' WHERE (dbo.Data0070.STATUS = 5) AND (dbo.Data0071.QUAN_ORD - dbo.Data0071.QUAN_RECD > 0) and (dbo.Data0071.INVT_PTR ='+cds69.FieldByName('INVT_PTR').AsString+')';
  try
   frmMaterZt_Mod280:=TfrmMaterZt_Mod280.Create(nil);
   gSvrIntf.IntfGetDataBySql(Lsql,frmMaterZt_Mod280.cdsMain);
   frmMaterZt_Mod280.ShowModal;
  finally
   frmMaterZt_Mod280.Free;
  end;
end;


procedure TfrmEditDetail_Mod27.check_inv(rkey17,SUPPLIER_PTR:integer;PART_DESCRIPTION:string);
var
Lsql28:string;
begin
 Lsql28:='select data0028.rkey,data0028.supplier_ptr,data0028.PRICE_1,data0028.prot_report_ptr,'+
    ' data0028.purchase_unit_ptr,data0028.CONVERSION_FACTOR,data0028.AVL_FLAG,'+
    ' data0023.code,data0023.supplier_name,data0028.currency_ptr,DATA0028.IF_CAF,'+
    ' data0028.TAX_2,data0028.TAX_FLAG,data0028.rohs,data0028.SUPPLIER_PART_NO,'+
    ' data0028.LEAD_TIME,data0028.remark'+
    ' from data0028 inner join data0023'+
    ' on data0028.supplier_ptr=data0023.rkey'+
    ' where inventory_ptr='+inttostr(rkey17)+
    ' and data0023.status=0'+
    ' and data0028.AVL_FLAG=''Y''';
 gSvrIntf.IntfGetDataBySql(Lsql28,cds28);
    if cds28.IsEmpty then //没有定义价格
     begin
      if messagedlg('材料:'+trim(RedtMaterCode.Text)+'没有定义供应商价格是否继续?',
       mtconfirmation,[mbyes,mbno],0)=mrno then
       RedtMaterCode.SetFocus
      else
       begin
        cds69.Edit;
        cds69.FieldByName('INVT_PTR').Value := rkey17;
        cds69.Post;
        RedtIfMajor.Text := PART_DESCRIPTION;
       end;
     end
    else   //已定义价格可能有多条记录
     if cds28.RecordCount=1 then //如果该材料只有一个供应商有价格表
       begin
        cds69.Edit;
        cds69.FieldByName('INVT_PTR').Value := rkey17;
        cds69.Post;
        RedtIfMajor.Text := PART_DESCRIPTION;
        find_supplier();
       end
     else                     //如果有多个供应商价格，那幺寻找首选供应商
      begin
       if cds28.Locate('supplier_ptr',SUPPLIER_PTR,[]) then
         begin
          cds69.Edit;
          cds69.FieldByName('INVT_PTR').Value := rkey17;
          cds69.Post;
          RedtIfMajor.Text := PART_DESCRIPTION;
          find_supplier();
         end
       else                      //如果有多个价格,但没有首选供应商
        begin
         cds69.Edit;
         cds69.FieldByName('INVT_PTR').Value := rkey17;
         cds69.Post;
         RedtIfMajor.Text := PART_DESCRIPTION;
        end;
      end
end;

function TfrmEditDetail_Mod27.find_supp_protection(prot_report_ptr: Integer): Boolean;
var
Lsql805:string;
Lcds805:TClientDataSet;
begin
 Lsql805:='select rkey,Model from data0805 where (rkey='+inttostr(prot_report_ptr)+')'+
          ' and (Status=3 and EffeDate>=convert(datetime,(convert(varchar,getdate(),101)),101)'+
          ' or (TemporBy=1 and TemporTo>=convert(datetime,(convert(varchar,getdate(),101)),101)))';
 Lcds805:=TClientDataSet.Create(nil);
 try
  gSvrIntf.IntfGetDataBySql(Lsql805,Lcds805);
   if not Lcds805.IsEmpty then
    Result:=True
   else
    Result:=false;
 finally
  Lcds805.Free;
 end;
end;

end.
