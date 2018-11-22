unit CustEditFrm_mod354;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseEditFrm, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit, Data.DB,
  Datasnap.DBClient,uCommFunc;

type
  TfrmCustEdit_mod354 = class(TfrmBaseEdit)
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
    lbl13: TLabel;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl1: TLabel;
    chk1: TCheckBox;
    chk2: TCheckBox;
    edt_curr: TRKeyRzBtnEdit;
    edt_rate: TRKeyRzBtnEdit;
    edt_Pnumber: TRKeyRzBtnEdit;
    edt_Cdate: TRKeyRzBtnEdit;
    edt_shipAddr: TRKeyRzBtnEdit;
    ds60: TDataSource;
    cds60: TClientDataSet;
    edt_fob: TRKeyRzBtnEdit;
    edt_PoDate: TRKeyRzBtnEdit;
    edt_Trate: TRKeyRzBtnEdit;
    edt_SMan: TRKeyRzBtnEdit;
    edt_tel: TRKeyRzBtnEdit;
    edt_refer: TRKeyRzBtnEdit;
    edt_analyse: TRKeyRzBtnEdit;
    cdstemp: TClientDataSet;
    edt_CustNO: TRKeyRzBtnEdit;
    edt_file: TEdit;
    lbl20: TLabel;
    lbl21: TLabel;
    edt_OCustName: TRKeyRzBtnEdit;
    edt_InDate: TRKeyRzBtnEdit;
    cdstemp2: TClientDataSet;
    procedure edt_PnumberButtonClick(Sender: TObject);
    procedure edt_shipAddrButtonClick(Sender: TObject);
    procedure edt_currButtonClick(Sender: TObject);
    procedure edt_custNoButtonClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edt_PoDateExit(Sender: TObject);
    procedure edt_PnumberExit(Sender: TObject);
    procedure edt_custNoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_OCustNameExit(Sender: TObject);
    procedure edt_InDateExit(Sender: TObject);
    procedure edt_OCustNameButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt_CustNOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    OrigSum:Currency;
    function cacl_deficiency(Arkey10:integer; ANowAmount: currency):currency;//计算客户所欠金额
  public
    { Public declarations }
    Frkey97,Frkey10,Frkey12:integer;
    procedure GetData(Arkey60:string);
  end;

var
  frmCustEdit_mod354: TfrmCustEdit_mod354;

implementation
 uses QryCustOrderFrm_mod354,QryShipAddrFrm_mod354,QryCurrFrm_mod354,QryCustFrm_mod354;
{$R *.dfm}

{ TfrmCustEdit_mod354 }

procedure TfrmCustEdit_mod354.btnCloseClick(Sender: TObject);
begin
  inherited;
 close;
end;

procedure TfrmCustEdit_mod354.btnSaveClick(Sender: TObject);
var
TempDate:TDateTime;
Lsql:String;
Lcds97:TClientDataSet;
La,LA2:Currency;
LR:integer;
begin
 inherited;

  if Trim(edt_custNo.Text)='' then
  begin
    showmessage('客户代码不能够为空!!!');
    edt_custNo.SetFocus;
    Exit;
  end;
  if trim(edt_Pnumber.Text)='' then
  begin
    showmessage('客户订单号不能够为空!!!');
    edt_Pnumber.SetFocus;
    Exit;
  end;
  if Trim(edt_shipAddr.Text)='' then
  begin
    ShowMessage('装运地址不能够为空!!!');
    edt_shipAddr.SetFocus;
    Exit;
  end;

 Lcds97:=TClientDataSet.Create(nil);
 try
  Lsql:='SELECT CUSTSTAPROD FROM Data0192 WHERE CUSTSTAPROD = ''Y'' ';
  gSvrIntf.IntfGetDataBySql(Lsql,cdstemp);

  IF not cdstemp.IsEmpty then
  begin
   LSql:='select rkey,credit_limit,credit_rating from dbo.Data0010 where cust_code ='''+trim(edt_custNo.Text)+''' ';
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

  if Frkey97=0 then
  begin
      Lsql:='select * from data0097 where 1=2';
      gSvrIntf.IntfGetDataBySql(Lsql,Lcds97);

      Lcds97.Append;
      Lcds97.FieldByName('po_number').Value:=cds60.FieldByName('PO_NUMBER').Value;
      Lcds97.FieldByName('customer_ptr').Value:= cds60.FieldByName('CUSTOMER_PTR').Value;  //CUSTOMER_PTR
      Lcds97.FieldByName('po_date').Value:= cds60.FieldByName('po_date').Value;            //po_date
      Lcds97.FieldByName('open_sos').Value:= 1;
      Lcds97.post;

     if gSvrIntf.IntfPostDataByTable('data0097',Lcds97.Delta) then
     begin
       LSql:='select IDENT_CURRENT(''data0097'') as rkey97';
       gSvrIntf.IntfGetDataBySql(Lsql,cdstemp);
       Frkey97:=cdstemp.FieldByName('rkey97').AsInteger ;
     end;
  end;


  if (TryStrToDateTime(Trim(edt_Cdate.Text),TempDate)=False) then
  begin
    showmessage('客户交期日期格式不正确！');
    Abort;
  end;
  self.ModalResult:=mrok;
 finally
   Lcds97.free;
 end;
end;

function TfrmCustEdit_mod354.cacl_deficiency(Arkey10: integer;
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

procedure TfrmCustEdit_mod354.edt_currButtonClick(Sender: TObject);
var
Lfrm:TfrmQryCurr_mod354;
begin
  inherited;
  LFrm:=TfrmQryCurr_mod354.Create(nil);
  try
   Lfrm.InitWithPickID(354,5);
   if Lfrm.ShowModal = mrOk  then
   begin
   cds60.Edit;
   cds60.fieldbyname('CURRENCY_PTR').value:=Lfrm.cdspick.fieldbyname('rkey').value;
   cds60.fieldbyname('EXCH_RATE').value:=Lfrm.cdspick.fieldbyname('EXCH_RATE').value;

   cds60.Post;
   end;
  finally
   Lfrm.Free;
  end;

end;

procedure TfrmCustEdit_mod354.edt_custNoButtonClick(Sender: TObject);
var
Lfrm:TfrmQryCust_mod354;
Lsql:String;
LoCustNO:string;
begin
  inherited;
  LFrm:=TfrmQryCust_mod354.Create(nil);
  try
   Lfrm.InitWithPickID(354,6,' ORDER BY cust_code ' );
   LoCustNO:=Trim(edt_CustNO.Text);
   if Lfrm.ShowModal = mrOk  then
   begin
   cds60.Edit;
   cds60.fieldbyname('CUSTOMER_PTR').value:=Lfrm.cdspick.fieldbyname('rkey').value;
   cds60.Post;

    Lsql:='select Data0001.rkey,Data0001.curr_code,Data0001.exch_rate,'+
        ' Data0010.EDI_FLAG_FOR_SOACK,Data0010.EDI_FLAG_FOR_INVOICE '+
        ' from Data0010 INNER JOIN '+
        ' Data0001 ON Data0010.CURRENCY_PTR = Data0001.RKEY '+
        ' where  Data0010.rkey='+LFrm.cdsPick.FieldByName('RKEY').AsString;
    gSvrIntf.IntfGetDataBySql(Lsql,cdstemp);
     cds60.Edit;
     cds60.FieldByName('CURRENCY_PTR').Value:=cdstemp.FieldByName('rkey').Value;
     cds60.FieldByName('exch_rate').Value:=cdstemp.FieldByName('exch_rate').Value;
     cds60.Post;
      if cdstemp.FieldByName('EDI_FLAG_FOR_SOACK').Value='0' then
        chk2.Checked:=False
      else
        chk2.Checked:=True;

      if cdstemp.FieldByName('EDI_FLAG_FOR_INVOICE').Value='0' then    //EDI_FLAG_FOR_INVOICE
        chk1.Checked:=False
      else
        chk1.Checked:=True;
     if LoCustNO<>Trim(edt_CustNO.Text) then
     begin
      edt_Pnumber.Text:='';
      edt_shipAddr.Text:='';

     end;
   end;
  finally
   Lfrm.Free;
  end;
end;

procedure TfrmCustEdit_mod354.edt_custNoExit(Sender: TObject);
var
Lsql:string;
begin
 inherited;
  if Trim(edt_custNo.Text)='' then
  begin
    edt_Pnumber.Text:='';
    edt_shipAddr.Text:='';
    edt_Trate.Text:='';
  end
  else
  begin
   Lsql:='select Data0001.rkey,Data0001.curr_code,Data0001.exch_rate,Data0010.rkey AS rkey10,'+
        ' Data0010.EDI_FLAG_FOR_SOACK,Data0010.EDI_FLAG_FOR_INVOICE,Data0010.CUSTOMER_NAME '+
        ' from Data0010 INNER JOIN '+
        ' Data0001 ON Data0010.CURRENCY_PTR = Data0001.RKEY '+
        ' where Data0010.CREDIT_RATING<> 3 and Data0010.cust_code='+QuotedStr(Trim(edt_custNo.Text));
     gSvrintf.IntfGetDataBySql(Lsql, cdsTemp);

    if not cdsTemp.IsEmpty then
    begin
      if Frkey10<>cdsTemp.FieldByName('rkey10').value then
      begin
        cds60.edit;
        edt_custNo.Font.Color:=clWindowText;
        cds60.FieldByName('CUSTOMER_PTR').Value:=cdsTemp.fieldbyname('rkey10').Value;
        Frkey10:=cdsTemp.fieldbyname('rkey10').Value;
        cds60.FieldByName('CURRENCY_PTR').Value:= cdsTemp.FieldValues['rkey'];
        edt_rate.Text:=cdsTemp.fieldbyname('exch_rate').value;

        if cdsTemp.FieldValues['EDI_FLAG_FOR_INVOICE']='1' then
          chk1.Checked:=True       //价格含税
        else
          chk1.Checked:=False;    //转厂订单
        if cdsTemp.FieldValues['EDI_FLAG_FOR_SOACK']='1' then
          chk2.Checked:=True
        else
          chk2.Checked:=False;
        edt_Pnumber.Text:='';
        edt_shipAddr.Text:='';
        edt_Trate.Text:='';
        cds60.post;
      end;
    end
    else
    begin
      edt_custNo.SetFocus;
      ShowMessage('客户代码输入错误或信用等级为差');
    end;
  end;
end;

procedure TfrmCustEdit_mod354.edt_CustNOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key=13 then
  edt_curr.setfocus;
end;

procedure TfrmCustEdit_mod354.edt_InDateExit(Sender: TObject);
begin
  inherited;
TRY
 strtodatetime(edt_inDate.Text);
except
 messagedlg('日期格式输入有误!',mtinformation,[mbcancel],0);
 edt_inDate.SetFocus;
end;
end;

procedure TfrmCustEdit_mod354.edt_PnumberButtonClick(Sender: TObject);
var
Lfrm:TfrmQryCustOrder_mod354;
LOPNo:string;
begin
  inherited;
  LFrm:=TfrmQryCustOrder_mod354.Create(nil);
  LOPNo:= cds60.fieldbyname('PO_NUMBER').value;
  try
   Lfrm.InitWithPickID(354,3,' and  customer_ptr='+cds60.fieldbyname('CUSTOMER_PTR').asstring+ ' order by po_date desc' );
   if Lfrm.ShowModal = mrOk  then
   begin
   cds60.Edit;
   cds60.fieldbyname('PO_NUMBER').value:=Lfrm.cdspick.fieldbyname('PO_NUMBER').value;
   cds60.fieldbyname('po_date').value:=Lfrm.cdspick.fieldbyname('po_date').value;
   Frkey97:= Lfrm.cdspick.fieldbyname('rkey').value;
   cds60.Post;
   if cds60.fieldbyname('PO_NUMBER').value<> LOPNo  then
    edt_PoDate.Enabled:=true;;
    
   end;
  finally
   Lfrm.Free;
  end;
end;

procedure TfrmCustEdit_mod354.edt_PnumberExit(Sender: TObject);
var
Lsql:string;
begin
 inherited;
 if Trim(edt_Pnumber.Text)='' then Exit;

  Lsql:= ' select * from data0097 where po_number='''+trim(edt_Pnumber.Text)+''' '+
         ' and CUSTOMER_PTR='+cds60.FieldByName('CUSTOMER_PTR').AsString;
  gSvrIntf.IntfGetDataBySql(Lsql,cdstemp);

   //修改不可新增客户订单号
    if cdstemp.IsEmpty then
     begin
      edt_Pnumber.Font.Color:=clBlue;
      ShowMessage('客户订单号不正确');
      edt_Pnumber.SetFocus;
      edt_Pnumber.Text:='';
      if (edt_custNo.hint<>Trim(edt_custNo.Text)) then
      begin
        edt_file.Text:='';
        edt_Trate.Text:='';
      end;
     end
    else
    begin
      if Frkey97<>cdstemp.FieldByName('rkey').AsInteger then
      begin
        cds60.edit;
        edt_PoDate.Text:=cdstemp.fieldbyname('PO_DATE').AsString;
        Frkey97:=cdstemp.FieldByName('rkey').AsInteger;
        cds60.post;
      end;
      edt_Pnumber.Font.Color:=clWindowText;
    end;

end;

procedure TfrmCustEdit_mod354.edt_PoDateExit(Sender: TObject);
begin
  inherited;
TRY
 strtodate(edt_PoDate.Text);
except
 messagedlg('日期格式输入有误!',mtinformation,[mbcancel],0);
 edt_PoDate.SetFocus;
end;
end;

procedure TfrmCustEdit_mod354.edt_shipAddrButtonClick(Sender: TObject);
var
Lfrm:TfrmQryShipAddr_mod354;
begin
  inherited;
  LFrm:=TfrmQryShipAddr_mod354.Create(nil);
  try
   Lfrm.InitWithPickID(354,4,' and  customer_ptr='+inttostr(frkey10));
   if Lfrm.ShowModal = mrOk  then
   begin
   cds60.Edit;
   cds60.fieldbyname('location').value:=Lfrm.cdspick.fieldbyname('location').value;
   cds60.fieldbyname('RUSH_CHARGE').value:=Lfrm.cdspick.fieldbyname('state_tax').value;
   cds60.fieldbyname('SHIPPING_CONTACT').value:=Lfrm.cdspick.fieldbyname('SHIP_TO_CONTACT').value;
   cds60.fieldbyname('SHIP_CONTACT_PHONE').value:=Lfrm.cdspick.fieldbyname('SHIP_TO_PHONE').value;
   cds60.Post;
   edt_shipAddr.Tag:= Lfrm.cdspick.FieldByName('rkey').AsInteger;
   end
   else
   edt_shipAddr.SetFocus;

  finally
   Lfrm.Free;
  end;
end;

procedure TfrmCustEdit_mod354.edt_OCustNameButtonClick(Sender: TObject);
var
Lfrm:TfrmQryCust_mod354;
begin
  inherited;
    LFrm:=TfrmQryCust_mod354.Create(nil);
  try
   Lfrm.InitWithPickID(354,6,' ORDER BY cust_code ' );
  if Lfrm.ShowModal = mrOk  then
   edt_OCustName.Text:=Lfrm.cdsPick.FieldByName('abbr_name').AsString;

  finally
   LFrm.Free;
  end;
end;

procedure TfrmCustEdit_mod354.edt_OCustNameExit(Sender: TObject);
var
  Lsql:string;
begin
 inherited;
 if Trim(edt_OCustName.text)='' then Exit;
  Lsql:='select  rkey from data0010 where ABBR_NAME='''+Trim(edt_OCustName.text)+''' ' ;
   gSvrintf.IntfGetDataBySql(Lsql, cdsTemp);

  if cdsTemp.IsEmpty  then
  begin
  ShowMessage('客户简称不对请得新输入！');
  edt_OCustName.SetFocus;
  exit;
  end;
end;

procedure TfrmCustEdit_mod354.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//   Action := cafree;
//   frmCustEdit_mod354:=nil;
end;

procedure TfrmCustEdit_mod354.FormShow(Sender: TObject);
begin
  inherited;
  if  not(  cds60.State  in [dsInsert, dsEdit]) then
    cds60.edit;
    edt_PoDate.Enabled:=false;
end;

procedure TfrmCustEdit_mod354.GetData(Arkey60: string);
var
Lsql60:string;
begin
  Lsql60:=cds60.CommandText+' and data0060.rkey='+Arkey60;
 //  showmessage(Lsql60);
  if not gSvrIntf.IntfGetDataBySql(Lsql60,cds60) then exit;

  OrigSum:= cds60.FieldByName('set_price').Value*cds60.FieldByName('set_ordered').Value*
         (1+cds60.FieldByName('RUSH_CHARGE').Value/100)/cds60.FieldByName('EXCH_RATE').Value;

    if cds60.FieldByName('tax_in_price').Value='Y' then
     chk1.Checked:=True
  else
     chk1.Checked:=False;
  if cds60.FieldByName('COMMISION_ON_TOOLING').Value='Y' then
     chk2.Checked:=True
  else
     chk2.Checked:=False;


end;

end.
