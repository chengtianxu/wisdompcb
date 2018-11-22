unit QtyEditFrm_mod354;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.Menus, Vcl.DBCtrls, Vcl.Mask,
  Data.DB, Datasnap.DBClient,uCommFunc;

type
  TfrmQtyEdit_mod354 = class(TfrmBaseEdit)
    pnl3: TPanel;
    pnl4: TPanel;
    eh360: TDBGridEh;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    btn_del: TSpeedButton;
    dbedt_PARTS_ORDERED: TDBEdit;
    dbedt_part_price: TDBEdit;
    dbedt_ORIG_REQUEST_DATE: TDBEdit;
    dbedt_set_ordered: TDBEdit;
    dbedt_set_price: TDBEdit;
    dbedt_ORIG_SCHED_SHIP_DATE: TDBEdit;
    edt_file: TEdit;
    btn_quote: TBitBtn;
    edt_TNumber: TEdit;
    dbedt_CURR_CODE: TDBEdit;
    dbedt_EXCH_RATE: TDBEdit;
    dbedt_RUSH_CHARGE: TDBEdit;
    dbchk_COMMISION_ON_TOOLING: TDBCheckBox;
    dbchk_tax_in_price: TDBCheckBox;
    btn_BOMQoute: TBitBtn;
    pm1: TPopupMenu;
    mniN1: TMenuItem;
    ds60: TDataSource;
    cds60: TClientDataSet;
    ds360: TDataSource;
    cds360: TClientDataSet;
    cdstemp: TClientDataSet;
    cdstemp2: TClientDataSet;
    procedure btn_quoteClick(Sender: TObject);
    procedure btn_BOMQouteClick(Sender: TObject);
    procedure btn_delClick(Sender: TObject);
    procedure dbedt_part_priceExit(Sender: TObject);
    procedure mniN1Click(Sender: TObject);
    procedure eh360KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbedt_set_orderedKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_PARTS_ORDEREDExit(Sender: TObject);
    procedure dbedt_PARTS_ORDEREDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_PARTS_ORDEREDKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_set_priceExit(Sender: TObject);
    procedure dbedt_set_priceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_part_priceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_ORIG_REQUEST_DATEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_ORIG_SCHED_SHIP_DATEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure eh360Exit(Sender: TObject);
    procedure edt_fileKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_set_orderedKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_ORIG_SCHED_SHIP_DATEExit(Sender: TObject);
  private
    { Private declarations }
    set_qty :integer;
    OrigSum:Currency;
    function cacl_deficiency(Arkey10:integer; ANowAmount: currency):currency;
    function checkQty(AQty: integer): Boolean;
    function quote_vflag(Arkey25, Attype: integer): boolean;
  public
    { Public declarations }
    FParts_ordered:integer;
    procedure GetData(Arkey60:string);
  end;

var
  frmQtyEdit_mod354: TfrmQtyEdit_mod354;

implementation
  uses QryQuoteNoFrm_mod354,QryQuoteFrm_mod354;
{$R *.dfm}

procedure TfrmQtyEdit_mod354.btnCloseClick(Sender: TObject);
begin
  inherited;
 close;
end;

procedure TfrmQtyEdit_mod354.btnSaveClick(Sender: TObject);
var
Lsql :string;
La,La2:Currency;
LR:integer;
begin
  inherited;
  Lsql:='SELECT CUSTSTAPROD FROM Data0192 WHERE CUSTSTAPROD = ''Y''';
  gSvrintf.IntfGetDataBySql(Lsql, cdsTemp);
                     //订单输入采用客户额度等级控制
  IF not cdstemp.IsEmpty then
  begin
   LSql:='select rkey,credit_limit,credit_rating from dbo.Data0010 where rkey ='+cds60.FieldByName('rkey').AsString;
    gSvrIntf.IntfGetDataBySql(LSql,cdstemp2);

    La:= cdstemp2.fieldbyname('credit_limit').AsCurrency+1 ;
    La2:=cacl_deficiency(cdstemp2.fieldbyname('rkey').AsInteger,
              cds60.FieldByName('set_price').Value*cds60.FieldByName('set_ordered').Value*
              (1+cds60.FieldByName('RUSH_CHARGE').Value/100)/ cds60.FieldByName('EXCH_RATE').Value-OrigSum);
      // showmessage(cdstemp.fieldbyname('credit_rating').Asstring);
    LR:=  cdstemp2.fieldbyname('credit_rating').asinteger ;
    if LR= 3 then
    begin
      messagedlg('信用等级太差,订单无法继续!',mtwarning,[mbok],0);
      exit;
    end    //信用等级为优，超过限额出现提示后仍然可以
    else if LR = 1 then
    begin
     if LA2>LA then
     if messagedlg('未付款金额超出信用限额是否继续?', mtconfirmation,[mbyes,mbno],0)=mrno then exit;
    end
    else //信用等级为良，只能在限额以内开出销售订单
    begin
     if LA2>LA then
      begin
        messagedlg('未付款金额超出信用限额无法继续!',mtwarning,[mbok],0);
        exit;
      end;

    end;
  end;
//==========================================================================================
  // 修改订单数量必须大于等于已计划数
  if (StrToInt(dbedt_PARTS_ORDERED.Text) <> Fparts_ordered) then
  if (StrToInt(dbedt_PARTS_ORDERED.Text) < Fparts_ordered) and (StrToInt(dbedt_PARTS_ORDERED.Text)<cds60.fieldbyname('QTY_PLANNNED').AsInteger) then
  begin
    showmessage('订单数量不能小于已计划数量');
    dbedt_PARTS_ORDERED.Text:=cds60.fieldbyname('PARTS_ORDERED').AsString;
    dbedt_PARTS_ORDERED.SetFocus;
    Exit;
  end;
  //end 20170209tang-------------------------------
 if (dbedt_part_price.enabled) and (trim(dbedt_part_price.Text)='') then
 begin
  showmessage('订单已经与报价单强制关联,请选择一个报价单号');
  dbedt_part_price.SetFocus;
 end
 else
  if checkQty(StrToInt(dbedt_PARTS_ORDERED.Text)) then
  begin
   showmessage('订单数量与完工数量不一致');
   eh360.SetFocus;
  end
 else
  self.ModalResult:=mrok;
end;

procedure TfrmQtyEdit_mod354.btn_BOMQouteClick(Sender: TObject);
var
Lstr:string;
Lfrm:TfrmQryQuote_mod354;
begin
  inherited;
  Lfrm:=TfrmQryQuote_mod354.Create(nil);
  Lstr:=' and BP06.d01_ptr = ' + cds60.fieldbyname('CURRENCY_PTR').AsString+' and d25.MANU_PART_DESC = ' +
           QuotedStr(cds60.fieldbyname('MANU_PART_DESC').asstring) +' order by BPTime Desc';
   Lfrm.InitWithPickID(354,2,Lstr);
  try
   if LFrm.ShowModal = mrok then
    begin
      if cds60.FieldByName('CURRENCY_PTR').AsInteger <> LFrm.cdsPick.FieldByName('d01_ptr').AsInteger then
      begin
       ShowMessage('报价单中定义的货币与销售订单中定义的货币不一致!');
       exit;
      end;
      cds60.Edit;
      if cds60.FieldByName('不含税tax_in_price').Value = 'N' then //不含税tax_in_price
        cds60.FieldByName('part_price').AsString := LFrm.cdsPick.fieldbyname('buhanshuijiage_Pcs').AsString
      else                                     //含税
        cds60.FieldByName('part_price').AsString := LFrm.cdsPick.fieldbyname('hanshuijiage_Pcs').AsString;

      dbedt_part_priceExit(sender);

      edt_TNumber.Text:=LFrm.cdsPick.fieldbyname('BPNO').AsString;
      cds60.FieldByName('qte_ptr').Value:=null;
      cds60.FieldByName('bp06_ptr').AsString := LFrm.cdsPick.fieldbyname('idkey').AsString;
      cds60.Post;
    end;
  finally
    Lfrm.Free;
  end;
end;

procedure TfrmQtyEdit_mod354.btn_delClick(Sender: TObject);
begin
  inherited;
edt_TNumber.Text:='';
cds60.Edit;
cds60.FieldByName('qte_ptr').AsVariant:=null; //qte_ptr
cds60.Post;
end;

procedure TfrmQtyEdit_mod354.btn_quoteClick(Sender: TObject);
var
Lstr,LSql:string ;
Lfrm:TfrmQryQuoteNo_mod354;
begin
  inherited;
  Lstr:=' and  Data0085.CUST_PART_NO='+cds60.fieldbyname('MANU_PART_DESC').asstring;
  Lfrm:=TfrmQryQuoteNo_mod354.Create(nil);
  Lfrm.InitWithPickID(354,1,Lstr);
  try
     if LFrm.ShowModal=mrok then
     begin
      if cds60.FieldByName('CURRENCY_PTR').Value <> LFrm.cdsPick.FieldByName('CURR_PTR').Value then
      begin
       messagedlg('报价单中定义的货币与销售订单中定义的货币不一致!',mterror,[mbcancel],0);
       exit;
      end;

     LSql:='SELECT Data0253.RKEY'+
          ' FROM Data0028 INNER JOIN'+
          ' Data0253 ON Data0028.RKEY = Data0253.d0028_ptr '+
          ' where Data0028.qte_price - Data0253.d0028_price > 0.01'+
          ' and data0253.quote_ptr='+LFrm.cdsPick.FieldByName('rkey').AsString;
       gSvrintf.IntfGetDataBySql(Lsql, cdstemp) ;

      if not cdstemp.IsEmpty then
       showmessage('报价单价格有变动，请重新选择或是重新报价后输入！')
      else
       begin  //
       if ((LFrm.cdsPick.FieldByName('Quote_type').Value=1) and (cds60.FieldByName('COMMISION_ON_TOOLING').Value='N')) or
          ((LFrm.cdsPick.FieldByName('Quote_type').Value=0) and (cds60.FieldByName('COMMISION_ON_TOOLING').Value='Y')) then
        showmessage('报价单与客户信息中定义的是否转厂数据不一致不能继续')
       else
        begin
         cds60.Edit;
         if cds60.FieldByName('tax_in_price').Value = 'N' then  //不含税    tax_in_price
          if cds60.FieldByName('QTE_UNIT_PTR').Value=1 then   //以PCS报价   QTE_UNIT_PTR
           cds60.FieldByName('part_price').Value := LFrm.cdsPick.FieldByName('quote_price').Value //  quote_price
          else                                       //以SET报价
           cds60.FieldByName('part_price').AsString := //part_price
                    formatfloat('0.0000000',LFrm.cdsPick.FieldByName('quote_price').Value/
                                                 LFrm.cdsPick.FieldByName('TUNITS').Value)   //TUNITS
         else                                     //价格含税
          if LFrm.cdsPick.FieldByName('QTE_UNIT_PTR').Value=1 then   //QTE_UNIT_PTR
           cds60.FieldByName('part_price').Value := LFrm.cdsPick.FieldByName('quote_taxprice').Value    //quote_taxprice
          else
           cds60.FieldByName('part_price').AsString :=
                  formatfloat('0.0000000',LFrm.cdsPick.FieldByName('quote_taxprice').Value/
                                                LFrm.cdsPick.FieldByName('TUNITS').Value);

        dbedt_part_priceExit(sender);
        edt_TNumber.Text:=LFrm.cdsPick.FieldByName('TNUMBER').Value;     //TNUMBER
        cds60.FieldByName('qte_ptr').Value:=LFrm.cdsPick.FieldByName('rkey').Value;

     //报价单号与BOM报价只能存其一
        cds60.FieldByName('bp06_ptr').Value :=null;
        cds60.Post;
        end;
       end;
     end;


  finally
    Lfrm.Free;
  end;
end;

function TfrmQtyEdit_mod354.cacl_deficiency(Arkey10: integer;
  ANowAmount: currency): currency;
var
  LAllMoney:currency;
  Lsql:String;
begin
    //计算用户所开出发票的所欠金额
    Lsql:='SELECT SUM((INVOICE_TOTAL - amount_paid - CASH_DISC)*EXCHANGE_RATE)'+
     ' AS total_amount FROM dbo.Data0112 '+
     ' where customer_ptr='+inttostr(Arkey10) +
     ' and invoice_status=1'+
     ' group by customer_ptr';
    gSvrIntf.IntfGetDataBySql(Lsql,cdstemp);
    LAllMoney:= cdstemp.FieldByName('total_amount').AsCurrency;

  //已指派未生成账龄 Add
   Lsql:='select Sum(t60.PARTS_ALLOC*t64.QUAN_SHIPPED*(1+t60.RUSH_CHARGE*0.01)/t60.EXCH_RATE) as total_amount'+
    ' from data0060 t60 inner join data0064 t64 on t64.SO_PTR = t60.RKEY'+
    ' left join data0439 t439 on t64.packing_list_ptr = t439.RKEY'+
    ' WHERE ((t64.packing_list_ptr is null) OR (t439.invoice_ptr is null))'+
    ' and t60.STATUS in (1,2,4)'+
    ' and t60.CUSTOMER_PTR = '+inttostr(Arkey10);
   gSvrIntf.IntfGetDataBySql(Lsql,cdstemp);
    LAllMoney:= LAllMoney+cdstemp.FieldByName('total_amount').AsCurrency;

    //未指派 add
   Lsql:='select Sum(t60.PARTS_ALLOC*(t60.PARTS_ORDERED-t60.PARTS_SHIPPED)*(1+t60.RUSH_CHARGE*0.01)/t60.EXCH_RATE)'+
    ' as total_amount from data0060 t60'+
    ' Where t60.STATUS in (1,2,4,6)'+
    ' and t60.CUSTOMER_PTR = '+inttostr(Arkey10);
    gSvrIntf.IntfGetDataBySql(Lsql,cdstemp);
    LAllMoney:= LAllMoney+cdstemp.FieldByName('total_amount').AsCurrency;

  //工具费用 Add
    Lsql:='select Sum((TOTAL_ADD_L_PRICE-INVD_ADD_L_PRICE)*(1+RUSH_CHARGE*0.01)/EXCH_RATE)'+
    ' as total_amount from data0060'+
    ' where STATUS in (1,2,4,6)'+
    ' and TOTAL_ADD_L_PRICE <> 0'+
    ' and INVD_ADD_L_PRICE = 0'+
    ' and CUSTOMER_PTR = '+inttostr(Arkey10);
    gSvrIntf.IntfGetDataBySql(Lsql,cdstemp);
    LAllMoney:= LAllMoney+cdstemp.FieldByName('total_amount').AsCurrency;

    //计算用户贷项备忘 --减
    LSql:='SELECT SUM(AVL_AMT * EX_RATE)'+
    ' AS total_amount FROM dbo.Data0116'+
    ' where CUST_PTR='+inttostr(Arkey10)+
    ' and memo_status=1'+
    ' group by CUST_PTR';
    gSvrIntf.IntfGetDataBySql(Lsql,cdstemp);
    LAllMoney:= LAllMoney-cdstemp.FieldByName('total_amount').AsCurrency;

   //已退货未生成贷项备忘  --- 减
    LSql:='select Sum(t60.PARTS_ALLOC*t98.QTY_RECD*(1+t60.RUSH_CHARGE*0.01)/t60.EXCH_RATE)'+
    ' as total_amount from data0098 t98, data0060 t60'+
    ' where t98.SO_PTR = t60.RKEY'+
    ' and t98.srce_ptr is null'+
    ' and t98.CUSTOMER_PTR = '+inttostr(Arkey10);
     gSvrIntf.IntfGetDataBySql(Lsql,cdstemp);
    LAllMoney:= LAllMoney-cdstemp.FieldByName('total_amount').AsCurrency;

    //本订单总额Add
    result:= LAllMoney + AnowAmount;
end;

function TfrmQtyEdit_mod354.checkQty(AQty: integer): Boolean;
var
  n:Integer;
begin
  n:= 0;
  if ((cds360.Active) and (cds360.RecordCount > 0)) then
    cds360.DisableControls;
    try
      cds360.First;
      while not cds360.Eof do
      begin
        n:= n + cds360.FieldByName('quantity').AsInteger;
        cds360.Next;
      end;
    finally
      cds360.EnableControls;
    end;

  if Aqty <> n then Result:= True
  else Result:= False;
end;

procedure TfrmQtyEdit_mod354.dbedt_ORIG_REQUEST_DATEKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
if key=13 then dbedt_ORIG_SCHED_SHIP_DATE.SetFocus;
end;

procedure TfrmQtyEdit_mod354.dbedt_ORIG_SCHED_SHIP_DATEExit(Sender: TObject);
begin
  inherited;
TRY
 strtodatetime(dbedt_ORIG_SCHED_SHIP_DATE.Text);
except
 messagedlg('日期格式输入有误!',mtinformation,[mbcancel],0);
 dbedt_ORIG_SCHED_SHIP_DATE.SetFocus;
end;
end;

procedure TfrmQtyEdit_mod354.dbedt_ORIG_SCHED_SHIP_DATEKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
if key=13 then btnSave.SetFocus;
end;

procedure TfrmQtyEdit_mod354.dbedt_PARTS_ORDEREDExit(Sender: TObject);
begin
  inherited;
  if (cds60.FieldByName('PARTS_ORDERED').AsInteger mod set_qty)<>0 then  //PARTS_ORDERED
  begin
   if messagedlg('订单数量pcs不是出货板数set的倍数,是否继续?',mtconfirmation,[mbYes,mbNo],0)=mryes then
    begin
    cds60.edit;
    cds60.FieldByName('set_ordered').Value:=round(cds60.FieldByName('PARTS_ORDERED').Value/set_qty);   //set_ordered   PARTS_ORDERED
    cds60.post;
    end
   else
    dbedt_PARTS_ORDERED.SetFocus;
  end
 else
  begin
   cds60.edit;
   cds60.FieldByName('set_ordered').Value:=
     strtoint(floattostr(cds60.FieldByName('PARTS_ORDERED').AsInteger / set_qty));
   CDS60.POST;
  end;
end;

procedure TfrmQtyEdit_mod354.dbedt_PARTS_ORDEREDKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
if key=13 then dbedt_set_price.SetFocus;
end;

procedure TfrmQtyEdit_mod354.dbedt_PARTS_ORDEREDKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if key='.' then abort;
end;

procedure TfrmQtyEdit_mod354.dbedt_part_priceExit(Sender: TObject);
begin
  inherited;
if trim(dbedt_part_price.Text)='' then dbedt_part_price.Field.Value := 0;
 cds60.Edit;
 dbedt_set_price.field.Value:= strtofloat(formatfloat('0.00000',dbedt_part_price.Field.Value * set_qty));
 cds60.post;
end;

procedure TfrmQtyEdit_mod354.dbedt_part_priceKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
 if key=13 then dbedt_ORIG_SCHED_SHIP_DATE.SetFocus;
end;

procedure TfrmQtyEdit_mod354.dbedt_set_orderedKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
 if key=13 then dbedt_set_price.SetFocus;
end;

procedure TfrmQtyEdit_mod354.dbedt_set_orderedKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if key='.' then abort;
end;

procedure TfrmQtyEdit_mod354.dbedt_set_priceExit(Sender: TObject);
begin
  inherited;
if trim(dbedt_set_price.Text)='' then dbedt_set_price.Field.Value := 0;
 cds60.Edit;
 dbedt_part_price.Field.Value := strtofloat(formatfloat('0.00000',dbedt_set_price.Field.Value / set_qty));
 cds60.Post;
end;

procedure TfrmQtyEdit_mod354.dbedt_set_priceKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   if key=13 then dbedt_ORIG_SCHED_SHIP_DATE.SetFocus;
end;

procedure TfrmQtyEdit_mod354.edt_fileKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
if key=13 then dbedt_set_ordered.SetFocus;
end;

procedure TfrmQtyEdit_mod354.eh360Exit(Sender: TObject);
begin
  inherited;
 if cds60.State in[dsInsert, dsEdit] then CDS60.Post;
end;

PRocedure TfrmQtyEdit_mod354.eh360KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   if not (Sender as TDBGridEh).DataSource.DataSet.Active then Abort;
  if key = 45 then Abort;  //Insert
  if Key = 46 then Abort;
  if ((key = 40) and ((Sender as TDBGridEh).DataSource.DataSet.RecNo =
                      (Sender as TDBGridEh).DataSource.DataSet.RecordCount)) then
    Abort;  //↓
  if ((key = 46) and (ssCtrl in shift)) then Abort;  //Ctrl+Delete
end;

procedure TfrmQtyEdit_mod354.GetData(Arkey60:string);
var
Lsql60,Lsql360,LSql:string;
begin

  Lsql60:=cds60.CommandText+' and data0060.rkey='+Arkey60;
  Lsql360:=cds360.CommandText +' and  so_ptr='+Arkey60;
  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsql60, Lsql360]),
   [cds60, cds360]) then    exit;

  set_qty:=cds60.FieldByName('set_qty').Value;       //set_qty  25表交货单元数

  OrigSum:= cds60.FieldByName('set_price').Value*cds60.FieldByName('set_ordered').Value*
         (1+cds60.FieldByName('RUSH_CHARGE').Value/100)/cds60.FieldByName('EXCH_RATE').Value;

   //报价单rkey:
   if cds60.FieldByName('qte_ptr').Value>0 then   //qte_ptr
   begin
   LSql:='select rkey,TNUMBER from data0085'+
    ' where rkey='+cds60.FieldByName('qte_ptr').AsString;
    gSvrIntf.IntfGetDataBySql(LSql,cdstemp);
    if not cdstemp.isempty then
      edt_TNumber.Text:=cdstemp.FieldByName('TNUMBER').AsString;
   end;

   if cds60.FieldByName('bp06_ptr').Value<>'' then   //qte_ptr
   begin
   LSql:='select IDKey,BPNO from BOMPrice06 where IDKey='''+cds60.FieldByName('bp06_ptr').AsString+'''';
    gSvrIntf.IntfGetDataBySql(LSql,cdstemp);
    if not cdstemp.isempty then
      edt_TNumber.Text:=cdstemp.FieldByName('BPNO').AsString;
   end;

 if (quote_vflag(cds60.FieldByName('CUST_PART_PTR').Value,cds60.FieldByName('ttype').Value)) and   //CUST_PART_PTR   ttype
    (cds60.FieldByName('so_style').Value=0) and   //正式订单 so_style
    (cds60.FieldByName('so_tp').Value=0) and     //自制   so_tp
    (cds60.FieldByName('quote_flag').AsBoolean) then  // 添加客户与订单是否关联选项   quote_flag
  begin                              //订单已经强制关联
   dbedt_set_price.enabled:=true;
   dbedt_part_price.enabled:=true;
   dbedt_set_price.Color:=cl3dlight;
   dbedt_part_price.Color:=cl3dlight;
  end;
end;

procedure TfrmQtyEdit_mod354.mniN1Click(Sender: TObject);
begin
  inherited;
    if  cds360.IsEmpty  then Exit;
    cds360.Delete;
end;



function TfrmQtyEdit_mod354.quote_vflag(Arkey25, Attype: integer): boolean;
var
Lsql:string;
begin
 LSql:='SELECT Data0008.batch_flag, Data0008.former_flag'+#13+
      'FROM Data0008 INNER JOIN'+#13+
      'Data0025 ON dbo.Data0008.RKEY = dbo.Data0025.PROD_CODE_PTR'+#13+
      'where Data0025.rkey='+inttostr(Arkey25);
   gSvrIntf.IntfGetDataBySql(LSql,cdstemp);
 if not cdstemp.isempty then
  if Attype=0 then
   result:=cdstemp.fieldvalues['batch_flag']
  else
   result:=cdstemp.fieldvalues['former_flag']
 else

end;

end.
