unit OrderDetailFrm_mod354;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit, Data.DB, Datasnap.DBClient,uCommFunc,
  Data.Win.ADODB, Vcl.DBCtrls;

type
  TfrmOrderDetail_mod354 = class(TfrmBase)
    CdsDetail: TClientDataSet;
    pnl1: TPanel;
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
    edt_ENT_DATE: TRKeyRzBtnEdit;
    edt_SALES_ORDER: TRKeyRzBtnEdit;
    edt_ORIG_REQUEST_DATE: TRKeyRzBtnEdit;
    edt_ORIG_SCHED_SHIP_DATE: TRKeyRzBtnEdit;
    edt_SCH_DATE: TRKeyRzBtnEdit;
    edt_PRODUCT_NAME: TRKeyRzBtnEdit;
    edt_PO_DATE: TRKeyRzBtnEdit;
    edt_PO_NUMBER: TRKeyRzBtnEdit;
    edt_MANU_PART_NUMBER: TRKeyRzBtnEdit;
    edt_CUST_CODE: TRKeyRzBtnEdit;
    edt_MANU_PART_DESC: TRKeyRzBtnEdit;
    edt_TO_BE_CONFIRMED: TRKeyRzBtnEdit;
    edt_EXCH_RATE: TRKeyRzBtnEdit;
    edt_CURR_NAME: TRKeyRzBtnEdit;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    lbl15: TLabel;
    dsDetail: TDataSource;
    pnl2: TPanel;
    edt_qty: TRKeyRzBtnEdit;
    lbl16: TLabel;
    edt_price: TRKeyRzBtnEdit;
    edt_tax: TRKeyRzBtnEdit;
    edt_discount: TRKeyRzBtnEdit;
    edt_TaxAmount: TRKeyRzBtnEdit;
    edt_total: TRKeyRzBtnEdit;
    edt_Area: TRKeyRzBtnEdit;
    lbl17: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl14: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    edt_tel: TRKeyRzBtnEdit;
    edt_man: TRKeyRzBtnEdit;
    edt_WorkNo10: TRKeyRzBtnEdit;
    dbchk_tax_in_price: TDBCheckBox;
    btn_Close: TButton;
    cdstemp: TClientDataSet;
    lbl27: TLabel;
    edt_WorkNo1: TRKeyRzBtnEdit;
    btn_qry: TButton;
    procedure btn_qryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure getdata(ARkey:string);

  end;

var
  frmOrderDetail_mod354: TfrmOrderDetail_mod354;

implementation
    uses  ToolCostEditfrm_mod354;
{$R *.dfm}

{ TfrmOrderDetail_mod284 }

procedure TfrmOrderDetail_mod354.btn_qryClick(Sender: TObject);
var
LFrm:TfrmToolCostEdit_mod354 ;
begin
  inherited;
  LFrm:= TfrmToolCostEdit_mod354.create(nil);
  try
    Lfrm.btnSave.Enabled:=false;
    Lfrm.SG1.Enabled:=false;
    Lfrm.cbb1.enabled:=false;
    Lfrm.showmodal;

  finally
   Lfrm.free;
  end;
end;

procedure TfrmOrderDetail_mod354.Getdata(Arkey: string);
var
  Lsql:string;
  Ftotal,FTaxAmount:single;
begin
  Lsql:= CdsDetail.CommandText+ ' and  data0060.rkey= '+ARkey ;

  gSvrIntf.IntfGetDataBySql(Lsql,CdsDetail) ;

  FTaxAmount:=0;

  LSql:='select * from data0062 where ' +
    'so_ptr='+cdsdetail.FieldByName('rkey').AsString;
  gSvrIntf.IntfGetDataBySql(Lsql,cdstemp);
   while not cdstemp.Eof do   //查找工具费用
    begin
     if CdsDetail.FieldByName('tax_in_price').Value='N' then //tax_in_price
      if cdstemp.FieldValues['tax_flag']='Y' then
       FTaxAmount:=FTaxAmount+strtocurr(floattostrf(
                              cdstemp.FieldValues['amount']*
                              CdsDetail.FieldByName('RUSH_CHARGE').Value*0.01,ffFixed,10,4)) //RUSH_CHARGE
      else
     else if cdstemp.FieldValues['tax_flag']='Y' then
       FTaxAmount:=FTaxAmount+strtocurr(floattostrf(
                              cdstemp.FieldValues['amount']*
                              CdsDetail.FieldByName('RUSH_CHARGE').Value*0.01/  //RUSH_CHARGE
                           (1+CdsDetail.FieldByName('RUSH_CHARGE').Value*0.01),ffFixed,10,4)); //RUSH_CHARGE
     cdstemp.Next;
    end;

 edt_TaxAmount.Text:=formatfloat('0.0000',FTaxAmount);
 if CdsDetail.FieldByName('TOTAL_ADD_L_PRICE').Value>0 then  //TOTAL_ADD_L_PRICE
  btn_Close.Enabled:=true
 else
  btn_Close.Enabled:=false;

  if CdsDetail.FieldByName('tax_in_price').Value='N' then    //tax_in_price
   begin
    Ftotal:=CdsDetail.FieldByName('PARTS_ORDERED').Value*CdsDetail.FieldByName('PART_PRICE').Value;     // PARTS_ORDERED \PART_PRICE
    edt_total.Text:=formatfloat('0.0000',Ftotal+cdsdetail.FieldByName('TOTAL_ADD_L_PRICE').Value+  //TOTAL_ADD_L_PRICE
                                 (Ftotal*cdsdetail.FieldByName('RUSH_CHARGE').Value*0.01)+  //RUSH_CHARGE
                                 FTaxAmount-
                                 (Ftotal*cdsdetail.FieldByName('DISCOUNT').Value*0.01)); //DISCOUNT
   end
  else
   begin
    edt_total.Text:=formatfloat('0.0000',cdsdetail.FieldByName('PARTS_ORDERED').Value*  //PARTS_ORDERED
                                    cdsdetail.FieldByName('PART_PRICE').Value+         //PART_PRICE
                                    cdsdetail.FieldByName('TOTAL_ADD_L_PRICE').Value-    //TOTAL_ADD_L_PRICE
          cdsdetail.FieldByName('PARTS_ORDERED').Value*cdsdetail.FieldByName('PART_PRICE').Value/      //PARTS_ORDERED\PART_PRICE
          (1+cdsdetail.FieldByName('RUSH_CHARGE').Value*0.01)*cdsdetail.FieldByName('DISCOUNT').Value*0.01 ); //RUSH_CHARGE\DISCOUNT

   end;



end;

end.
