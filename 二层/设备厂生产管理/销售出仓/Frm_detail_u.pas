unit Frm_detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, DBCtrls, StdCtrls, Mask, Grids, DBGrids, Buttons, ExtCtrls,
  ComCtrls, DBGridEh, Menus, DB, ADODB, DBCtrlsEh;

type
  TFrm_detail = class(TForm)
    Panel1: TPanel;
    BitBtn9: TBitBtn;
    PopupMenu1: TPopupMenu;
    N5: TMenuItem;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    BtnSave: TBitBtn;
    MaskEdit1: TMaskEdit;
    Label8: TLabel;
    Label9: TLabel;
    EdtCust: TEdit;
    Label11: TLabel;
    EdtCurr: TEdit;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    Label13: TLabel;
    DBEdit2: TDBEdit;
    Label14: TLabel;
    DBEdit3: TDBEdit;
    SpeedButton1: TSpeedButton;
    Label15: TLabel;
    DBEdit4: TDBEdit;
    Label16: TLabel;
    DBEdit5: TDBEdit;
    Label17: TLabel;
    DBEdit6: TDBEdit;
    Label18: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    LBCust: TLabel;
    LBCurr: TLabel;
    LBSale: TLabel;
    LBDept: TLabel;
    DBComboBox1: TDBComboBox;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    SpeedButton3: TSpeedButton;
    Label2: TLabel;
    Label5: TLabel;
    SpeedButton2: TSpeedButton;
    EdtOrder: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Grid1: TDBGridEh;
    Splitter2: TSplitter;
    SpeedButton4: TSpeedButton;
    PopupMenu2: TPopupMenu;
    MenuItem2: TMenuItem;
    Grd2: TDBGridEh;
    Label4: TLabel;
    edtPO_NO: TEdit;
    procedure BitBtn9Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure EdtCustEnter(Sender: TObject);
    procedure EdtCustExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdtOrderEnter(Sender: TObject);
    procedure EdtOrderExit(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    Fcust,Forder:string;
    FinValid:boolean;
    procedure getOrder(Qry: TADODataSet);
  public
    Ftag:integer;
    procedure initd;

  end;

implementation
  uses DM_u,common,Pick_Item_Single,ConstVar,address_search,Frm_detailEdt_u,Frm_salesOrder_u ;

{$R *.dfm}

procedure TFrm_detail.initd;
//var i,j:integer;
begin
  if Ftag=0 then
  begin
    self.Caption:='出库单-新增';
    DM.GetNo(MaskEdit1,'6',0);
    DM.tmp.Close;
    DM.tmp.SQL.Text:='select getdate()';
    DM.tmp.Open;
    DM.ADO60_1.Close;
    DM.ADO60_1.Parameters[0].Value:=-1;
    DM.ADO60_1.Open;
    DM.ADO60_1.Append;
    DM.ADO60_1.FieldByName('type').AsInteger:=1;
    DM.ADO60_1.FieldByName('sales_date').AsString:=formatdatetime('YYYY/MM/DD',DM.tmp.Fields[0].AsDateTime);

    DM.ADO60_1.FieldByName('ent_date').AsDateTime:=DM.tmp.Fields[0].AsDateTime;
    DM.ADO63_1.Close;
    DM.ADO63_1.Parameters[0].Value:=-1;
    DM.ADO63_1.Open;
    DM.ADO63_2.Close;
    DM.ADO63_2.Parameters[0].Value:=-1;
    DM.ADO63_2.Open;
  end
  else
  begin
    MaskEdit1.ReadOnly:=true;
    DM.ADO60_1.Close;
    DM.ADO60_1.Parameters[0].Value:=DM.ADO60rkey.Value;
    DM.ADO60_1.Open;

    DM.ADO63_2.Close;
    DM.ADO63_2.Parameters[0].Value:=DM.ADO60rkey.Value;
    DM.ADO63_2.Open;

    MaskEdit1.Text:=DM.ADO60.Fieldbyname('SALES_ORDER').AsString;

    EdtOrder.Text:=DM.ADO60.Fieldbyname('sorder').AsString;
    EdtOrder.Tag:=DM.ADO60.Fieldbyname('sales_rep_ptr').AsInteger;

    Edtcust.Text:=DM.ADO60.Fieldbyname('cust_code').AsString;
    LBcust.Caption:=DM.ADO60.Fieldbyname('CUSTOMER_NAME').AsString;
    Edtcust.Tag:=DM.ADO60.Fieldbyname('customer_ptr').AsInteger;

    Edtcurr.Text:=DM.ADO60.Fieldbyname('curr_code').AsString;
    LBcurr.Caption:=DM.ADO60.Fieldbyname('CUrr_NAME').AsString;
    Edtcurr.Tag:=DM.ADO60.Fieldbyname('currency_ptr').AsInteger;
//2014-09-03tang添加
    self.edtPO_NO.Text:=dm.ADO60.FieldBYName('PO_NO').AsString;
    SpeedButton1.Enabled:=false;
    SpeedButton2.Enabled:=false;
    EdtOrder.Enabled:=false;
    Edtcust.Enabled:=false;
    if Ftag=1 then
    begin
      self.Caption:='出库单-修改';
      DM.ADO63_1.Close;
      DM.ADO63_1.Parameters[0].Value:=DM.ADO60rkey.Value;
      DM.ADO63_1.Open;

      DM.ADO71.Close;
      DM.ADO71.Parameters[0].Value:=EdtOrder.tag;
      DM.ADO71.Open;
    end else if Ftag=2 then begin
      self.Caption:='出库单-查看';
      BtnSave.Enabled:=false;

      SpeedButton3.Enabled:=false;
      SpeedButton4.Enabled:=false;
      Edtorder.Enabled:=false;
      Edtcust.Enabled:=false;
      PageControl1.Visible:=false;
      Grd2.ReadOnly:=true;
      PopupMenu2.Free;
      Self.edtPO_NO.ReadOnly:=true;
      DBEdit8.ReadOnly:=True;
      DBEdit2.ReadOnly:=True;
      DBEdit4.ReadOnly:=True;
      DBEdit7.ReadOnly:=True;
    end;
  end;
end;

procedure TFrm_detail.BtnSaveClick(Sender: TObject);
var// i:integer;
    sumAm:real;
begin
  MaskEdit1.SetFocus;

 if (dm.ExistInventory(self.Handle)) then
  begin                //成品正在盘点
   Exit;
  end;
  if DM.ADO63_1.IsEmpty then
  begin
    showmessage('不能保存空记录...');
    exit;
  end; 
  if Trim(MaskEdit1.Text) ='' then
  begin
    showmessage('订单号不能为空...');
    exit;
  end;
  if Trim(EdtCust.Text) ='' then
  begin
    showmessage('客户不能为空...');
    exit;
  end;
  if Trim(edtPO_NO.Text) ='' then
  begin
    showmessage('合同号不能为空...');
    exit;
  end;
  if FinValid then exit;
  DM.tmp.close;
  DM.tmp.SQL.Text:='select getdate()';
  DM.tmp.Open;

  DM.ADO60_1.Edit;
  DM.ADO60_1.FieldByName('customer_ptr').AsInteger:=EdtCust.Tag;
  DM.ADO60_1.FieldByName('type').AsInteger:=1;
  DM.ADO60_1.FieldByName('status').AsInteger:=1;
  DM.ADO60_1.FieldByName('sales_rep_ptr').AsInteger:=EdtOrder.Tag;
  DM.ADO60_1.FieldByName('ent_date').AsDateTime:=DM.tmp.Fields[0].AsDateTime;
  DM.ADO60_1.FieldByName('ent_user_PTR').AsString:=user_ptr;
  DM.ADO60_1.FieldByName('currency_ptr').AsInteger:=EdtCurr.Tag;
  DM.ADO60_1.FieldByName('PO_NO').AsString:=edtPO_NO.Text;

  DM.ADOCon.BeginTrans;
  try
    if ((Ftag=0) or (Ftag=10)) and not DM.GetNo(MaskEdit1,'6',1) then abort;
    DM.ADO60_1.FieldByName('sales_order').AsString:=MaskEdit1.Text;
    DM.ADO60_1.Post;
    DM.ADO60_1.UpdateBatch(arAll);
    sumAm:=0;
    DM.ADO63_1.First;
    while not DM.ADO63_1.Eof do
    begin
      //DM.ADO63_2.Locate('prod_ptr;location_ptr',VarArrayOf([DM.ADO63_1.fieldbyname('prod_ptr').AsInteger, DM.ADO63_1.fieldbyname('location_ptr').AsInteger]),[]);
      DM.ADO63_1.Edit;
      DM.ADO63_1.FieldByName('so_ptr').AsInteger:=DM.ADO60_1.FieldByName('rkey').AsInteger;
      //DM.ADO63_1.FieldByName('remark').asstring:=DM.ADO63_2.FieldByName('remark').asstring;
      dm.ADO63_1.FieldByName('sales_date').AsDateTime:=DM.ADO60_1sales_date.Value;
      sumAm:=sumAm+DM.ADO63_1.FieldByName('quantity').AsFloat*DM.ADO63_1.FieldByName('price').AsFloat;
      DM.ADO63_1.Post;
      DM.ADO63_1.Next;
    end;
    DM.ADO63_1.UpdateBatch(arAll);
    DM.tmp.Close;
    DM.tmp.SQL.Text:='update wzcp0060 set total_amount='+floattostr(sumAm)+' where rkey='+DM.ADO60_1.FieldByName('rkey').AsString;
    DM.tmp.ExecSQL;
    
    DM.ADOCon.CommitTrans;
    Frkey60:=DM.ADO60_1.FieldByName('rkey').asinteger;
    Ftag:=2;
    modalresult:=mrok;
  except
    on e:exception do
    begin
      DM.ADOCon.RollbackTrans;
      showmessage('保存数据失败:'+e.Message);
    end;
  end;
end;

procedure TFrm_detail.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    self.SelectNext(self.ActiveControl,true,true)
end;

procedure TFrm_detail.BitBtn9Click(Sender: TObject);
begin
  close;
end;

procedure TFrm_detail.SpeedButton1Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case Tcomponent(Sender).Tag of
    0:
    begin
      InputVar.Fields := 'CUST_CODE/客户编码/150,CUSTOMER_NAME/客户名称/250';
      InputVar.Sqlstr :='SELECT RKEY,CUST_CODE ,CUSTOMER_NAME from data0010 where CUSTOMER_TYPE<>4 order by CUST_CODE';
      inputvar.KeyField:='CUST_CODE';
      InputVar.InPut_value:=EdtCust.Text;
    end;
    1:
    begin
      InputVar.Fields := 'sales_order/订单编号/80,sales_date/订单日期/80,CUSTOMER_NAME/客户名称/200,location/送货地址/200';
      if EdtCust.Text<>'' then
        InputVar.Sqlstr :='SELECT dbo.WZCP0070.rkey, dbo.WZCP0070.PO_NO, dbo.WZCP0070.sales_order, dbo.WZCP0070.sales_date, dbo.WZCP0070.ship_method, dbo.WZCP0070.location,'+
                          'dbo.WZCP0070.currency_ptr, dbo.WZCP0070.exch_rate, dbo.WZCP0070.CONTACT_NAME, dbo.WZCP0070.CONT_PHONE, dbo.WZCP0070.TAX_cate,'+
                          'dbo.WZCP0070.pay_method, dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME,data0010.rkey rkey10,data0001.curr_code,data0001.curr_name '+
                          'FROM dbo.WZCP0070 INNER JOIN '+
                          'dbo.Data0010 ON dbo.WZCP0070.customer_ptr = dbo.Data0010.RKEY INNER JOIN '+
                          'data0001 on WZCP0070.currency_ptr=data0001.rkey '+
                          'where CUSTOMER_ptr='+inttostr(EdtCust.tag)+' and WZCP0070.type=1 and WZCP0070.status in (3,4) order by WZCP0070.sales_order'
      else
        InputVar.Sqlstr :='SELECT dbo.WZCP0070.rkey, dbo.WZCP0070.PO_NO, dbo.WZCP0070.sales_order, dbo.WZCP0070.sales_date, dbo.WZCP0070.ship_method, dbo.WZCP0070.location,'+
                          'dbo.WZCP0070.currency_ptr, dbo.WZCP0070.exch_rate, dbo.WZCP0070.CONTACT_NAME, dbo.WZCP0070.CONT_PHONE, dbo.WZCP0070.TAX_cate,'+
                          'dbo.WZCP0070.pay_method, dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME,data0010.rkey rkey10,data0001.curr_code,data0001.curr_name '+
                          'FROM dbo.WZCP0070 INNER JOIN '+
                          'dbo.Data0010 ON dbo.WZCP0070.customer_ptr = dbo.Data0010.RKEY inner join '+
                          'data0001 on WZCP0070.currency_ptr=data0001.rkey '+
                          'where WZCP0070.type=1 and WZCP0070.status in (3,4) order by WZCP0070.sales_order';
      inputvar.KeyField:='sales_order';
      InputVar.InPut_value:=EdtOrder.Text;
    end;
    3:
    begin
      InputVar.Fields := 'CODE/代码/200,description/方法描述/250';
      InputVar.Sqlstr :='select rkey,code,description from data0370 order by 2';
      inputvar.KeyField:='CODE';
    end;
  end;
  InputVar.AdoConn := DM.ADOCon ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    case Tcomponent(Sender).Tag of
     0:begin
         EdtCust.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['cust_CODE']);
         LBCust.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['CUSTOMER_NAME']);
         EdtCust.tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;

         DM.ADO60_1.Edit;
         DBEdit1.Field.AsString:='';
         DBEdit7.Field.AsString:='';
         DBComboBox1.Field.AsString:='';
         DBEdit3.Field.AsString:='';
         DBEdit5.Field.AsString:='';
         DBEdit2.Field.AsString:='';
         DBEdit4.Field.AsString:='';

         EdtCurr.Text:='';
         EdtCurr.tag:=0;
         LBCurr.Caption:='';
         EdtOrder.Text:='';
         DM.ADO71.Close;
       //  EdtCust.SetFocus;

       end;
     1:begin
         EdtOrder.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['sales_order']);
         getOrder(frmPick_Item_Single.adsPick);

         DBEdit1.SetFocus;
       end;
     3:begin
         DM.ADO60_1.Edit;
         DBEdit7.Field.AsString:=frmPick_Item_Single.adsPick.Fieldbyname('description').AsString;
         DBEdit2.SetFocus;
       end;
    end;
  end ;
 finally
   frmPick_Item_Single.Free ;
 end;

end;

procedure TFrm_detail.SpeedButton3Click(Sender: TObject);
begin
  if trim(EdtCust.Text)='' then
    messagedlg('请先选择客户!!!',mterror,[mbcancel],0)
  else
  begin
    form_address:=tform_address.Create(application);
    form_address.ADOQuery1.Close;
    form_address.ADOQuery1.Parameters[0].Value:=EdtCust.tag;
    form_address.ADOQuery1.Open;
    if form_address.ShowModal=mrok then
    begin
      DBEdit1.Text:=form_address.ADOQuery1ship_to_address_1.Value;
      DBEdit7.Text:=form_address.ADOQuery1SHIP_SHIPPING_METHOD.Value;
      DBEdit7.SetFocus;
    end;
    form_address.Free;
  end;
end;

procedure TFrm_detail.EdtCustEnter(Sender: TObject);
begin
  Fcust:=EdtCust.Text;
end;

procedure TFrm_detail.EdtCustExit(Sender: TObject);
begin
  if (Fcust<>Edtcust.Text) and (Edtcust.Text<>'') then
  begin
    DM.Tmp.Close;
    DM.Tmp.SQL.Text :='SELECT RKEY,CUST_CODE ,CUSTOMER_NAME from data0010 '+
                      'where CUSTOMER_TYPE<>4 and CUST_CODE='''+Edtcust.Text+'''';
    DM.Tmp.Open;
    if DM.Tmp.IsEmpty then
    begin
      showmessage('客户代码不存在...');
      Edtcust.SetFocus;
      Fcust:='';
      FinValid:=true;
      abort;
    end else begin
      EdtCust.Text:=trim(DM.Tmp.FieldValues['cust_CODE']);
      LBCust.Caption:=trim(DM.Tmp.FieldValues['CUSTOMER_NAME']);
      EdtCust.tag:=DM.Tmp.Fieldbyname('rkey').AsInteger;
      DM.ADO60_1.Edit;
      DBEdit1.Field.AsString:='';
      DBEdit7.Field.AsString:='';
      DBComboBox1.Field.AsString:='';
      DBEdit3.Field.AsString:='';
      DBEdit5.Field.AsString:='';
      DBEdit2.Field.AsString:='';
      DBEdit4.Field.AsString:='';

      EdtCurr.Text:='';
      EdtCurr.tag:=0;
      LBCurr.Caption:='';
      EdtOrder.Text:='';
      DM.ADO71.Close;
      FinValid:=false;
    end;
  end;
end;

procedure TFrm_detail.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=(Ftag=2) or (Application.MessageBox('确认不保存退出吗?', PChar('提示'),MB_YESNO)=6);
end;

procedure TFrm_detail.EdtOrderEnter(Sender: TObject);
begin
  Forder:=Edtorder.Text;
end;

procedure TFrm_detail.EdtOrderExit(Sender: TObject);
begin
  if (Forder<>Edtorder.Text) and (Edtorder.Text<>'') then
  begin
    DM.Tmp.Close;
    if EdtCust.Text<>'' then
      DM.Tmp.SQL.Text :='SELECT dbo.WZCP0070.rkey, dbo.WZCP0070.PO_NO, dbo.WZCP0070.sales_order, dbo.WZCP0070.sales_date, dbo.WZCP0070.ship_method, dbo.WZCP0070.location,'+
                        'dbo.WZCP0070.currency_ptr, dbo.WZCP0070.exch_rate, dbo.WZCP0070.CONTACT_NAME, dbo.WZCP0070.CONT_PHONE, dbo.WZCP0070.TAX_cate,'+
                        'dbo.WZCP0070.pay_method, dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME,data0010.rkey rkey10,data0001.curr_code,data0001.curr_name '+
                        'FROM dbo.WZCP0070 INNER JOIN '+
                        'dbo.Data0010 ON dbo.WZCP0070.customer_ptr = dbo.Data0010.RKEY INNER JOIN '+
                        'data0001 on WZCP0070.currency_ptr=data0001.rkey '+
                        'where WZCP0070.sales_order='''+Edtorder.Text+''' and CUSTOMER_ptr='+inttostr(EdtCust.tag)+' and WZCP0070.type=1 and WZCP0070.status in (3,4)'
    else
      DM.Tmp.SQL.Text :='SELECT dbo.WZCP0070.rkey, dbo.WZCP0070.PO_NO, dbo.WZCP0070.sales_order, dbo.WZCP0070.sales_date, dbo.WZCP0070.ship_method, dbo.WZCP0070.location,'+
                        'dbo.WZCP0070.currency_ptr, dbo.WZCP0070.exch_rate, dbo.WZCP0070.CONTACT_NAME, dbo.WZCP0070.CONT_PHONE, dbo.WZCP0070.TAX_cate,'+
                        'dbo.WZCP0070.pay_method, dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME,data0010.rkey rkey10,data0001.curr_code,data0001.curr_name '+
                        'FROM dbo.WZCP0070 INNER JOIN '+
                        'dbo.Data0010 ON dbo.WZCP0070.customer_ptr = dbo.Data0010.RKEY inner join '+
                        'data0001 on WZCP0070.currency_ptr=data0001.rkey '+
                        'where WZCP0070.sales_order='''+Edtorder.Text+''' and WZCP0070.type=1 and WZCP0070.status in (3,4)';
    DM.Tmp.Open;
    if DM.Tmp.IsEmpty then
    begin
      showmessage('订单编码不存在...');
      Edtorder.SetFocus;
      Forder:='';
      FinValid:=true;
      abort;
    end else begin
      getOrder(TADODataSet(DM.Tmp));
      FinValid:=false;
    end;
  end;
end;

procedure TFrm_detail.getOrder(Qry: TADODataSet);
begin
  EdtOrder.tag:=Qry.Fieldbyname('rkey').AsInteger;

  DM.ADO60_1.Edit;
  DBEdit1.Field.AsString:=Qry.Fieldbyname('location').AsString;
  DBEdit7.Field.AsString:=Qry.Fieldbyname('ship_method').AsString;
  DBComboBox1.Field.AsString:=Qry.Fieldbyname('tax_cate').AsString;
  DBEdit3.Field.AsString:=Qry.Fieldbyname('exch_rate').AsString;
  DBEdit5.Field.AsString:=Qry.Fieldbyname('pay_method').AsString;
  DBEdit2.Field.AsString:=Qry.Fieldbyname('contact_name').AsString;
  DBEdit4.Field.AsString:=Qry.Fieldbyname('cont_phone').AsString;

  EdtCust.Text:=Qry.Fieldbyname('cust_code').AsString;
  EdtCust.tag:=Qry.Fieldbyname('rkey10').AsInteger;
  LBCust.Caption:=Qry.Fieldbyname('CUSTOMER_NAME').AsString;

  EdtCurr.Text:=Qry.Fieldbyname('curr_code').AsString;
  EdtCurr.tag:=Qry.Fieldbyname('currency_ptr').AsInteger;
  LBCurr.Caption:=Qry.Fieldbyname('curr_name').AsString;

  if not Qry.fieldByName('PO_NO').IsNull then
    edtPO_NO.Text := Qry.fieldByName('PO_NO').Value;

  DM.ADO71.Close;
  DM.ADO71.Parameters[0].Value:=EdtOrder.tag;
  DM.ADO71.Open;
end;

procedure TFrm_detail.N5Click(Sender: TObject);
var
  Qty: Double;
begin
  if DM.ADO71qty_onhand.AsFloat <= 0.0 then
  begin
    showmessage('此产品没有库存...');
    exit;
  end;
  with DM.tmp do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'select * from data0098 inner join wzcp0070 on data0098.SO_PTR = wzcp0070.rkey where wzcp0070.sales_order=' + QuotedStr(EdtOrder.Text);
    Open;
    if FieldByName('NOTE_PAD_PTR').Value = 0  then
    begin
      ShowMessage('该订单存在退货记录，且已不允许再出货，请查证！');
      EdtOrder.Clear;
      EdtCust.Clear;
      DBEdit1.Clear;
      DBEdit2.Clear;
      DBEdit3.Clear;
      DBEdit4.Clear;
      DBEdit5.Clear;
      DBEdit6.Clear;
      DBEdit7.Clear;
      DBEdit8.Clear;
      EdtCurr.Clear;
      DBComboBox1.Clear;
      Exit;
    end;
  end;
  DM.ADO63_1.Filter:='prod_ptr='+DM.ADO71prod_ptr.AsString;
  DM.ADO63_1.First;
  Qty := 0.0;
  while not DM.ADO63_1.Eof do
  begin
    Qty:=Qty+DM.ADO63_1.FieldByName('quantity').AsFloat;
    DM.ADO63_1.Next;
  end;
  if Qty=DM.ADO71quantity.asFloat + DM.ADO71returen_qty.asFloat - DM.ADO71parts_shipped.asFloat  then
  begin
    showmessage('出库数不能超过订单数');
    exit;
  end;
  DM.ADO63_1.Filter:='';
  TFrm_detailEdt.InitEdt;
  SpeedButton1.Enabled:=DM.ADO63_1.IsEmpty;
  SpeedButton2.Enabled:=SpeedButton1.Enabled;
  EdtOrder.Enabled:=SpeedButton1.Enabled;
  Edtcust.Enabled:=SpeedButton1.Enabled;
end;

procedure TFrm_detail.MenuItem2Click(Sender: TObject);
begin
  if DM.ADO63_1.Locate('prod_ptr;location_ptr',VarArrayOf([DM.ADO63_2.fieldbyname('prod_ptr').AsInteger, DM.ADO63_2.fieldbyname('location_ptr').AsInteger]),[]) then
  begin
    DM.ADO63_1.Delete;
    DM.ADO63_2.Delete;
    SpeedButton1.Enabled:=DM.ADO63_1.IsEmpty;
    SpeedButton2.Enabled:=SpeedButton1.Enabled;
    EdtOrder.Enabled:=SpeedButton1.Enabled;
    Edtcust.Enabled:=SpeedButton1.Enabled;
  end else
    showmessage('系统错误...');
end;

procedure TFrm_detail.PopupMenu1Popup(Sender: TObject);
begin
  N5.Enabled:=DM.ADO71.Active and not DM.ADO71.IsEmpty;
end;

procedure TFrm_detail.PopupMenu2Popup(Sender: TObject);
begin
  MenuItem2.Enabled:=DM.ADO63_2.Active and not DM.ADO63_2.IsEmpty;
end;

procedure TFrm_detail.SpeedButton2Click(Sender: TObject);
begin
  try
    Frm_salesOrder:=TFrm_salesOrder.Create(nil);
    if EdtCust.Text<>'' then
      Frm_salesOrder.ADO70.SQL.Text:=Frm_salesOrder.ADO70.SQL.Text+' and CUSTOMER_ptr='+inttostr(EdtCust.tag);
    Frm_salesOrder.ADO70.SQL.Text:=Frm_salesOrder.ADO70.SQL.Text+' order by dbo.WZCP0070.sales_order';
    Frm_salesOrder.ADO70.Open;
    if Frm_salesOrder.ShowModal=mrok then
    begin
      EdtOrder.Text:=trim(Frm_salesOrder.ADO70.FieldValues['sales_order']);
      getOrder(TADODataSet(Frm_salesOrder.ADO70));
      DBEdit1.SetFocus;
    end;
  finally
    Frm_salesOrder.Free;
  end;
  
end;

end.
