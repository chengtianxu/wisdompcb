unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, Grids, DBGrids, ImgList, StdCtrls, Buttons,
  Menus,ComObj,Excel2000,ClipBrd, DB, ADODB, ExtCtrls,DateUtils,math;


type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    BitBtn5: TBitBtn;
    PopupMenu2: TPopupMenu;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    N25: TMenuItem;
    empl_name: TLabel;
    curr_code: TLabel;
    N26: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    N15: TMenuItem;
    N16: TMenuItem;
    N5: TMenuItem;
    N19: TMenuItem;
    N27: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure append_invoice();
    //procedure append_toolinvoice();
    //procedure append_toolvoucher(var mt_error: boolean);
    //procedure append_toolsiv(sales_order:string);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    //function if_toolsamount(var so:string): boolean;
    function get_vouchernumber(inv_date:tdatetime):string;
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure CopyDbDataToExcel(Args:array of const);
    procedure N26Click(Sender: TObject);
  private
    { Private declarations }
   aqd112_sql:TStringList;
   field_name:string;

   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
   function return_VOUCHER(rkey112:integer):string;
  public
    { Public declarations }
   sys_sortdate:tdatetime;
  end;

var
  Form1: TForm1;

implementation

uses damo, term, packlist_search, addedit_invoice, form_tool,
  sotools_search, misc_invoice, voucher_report,common;

{$R *.dfm}
function TForm1.return_VOUCHER(rkey112: integer): string;
begin
result:='';
 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:=
   'SELECT  top 1 Data0105.VOUCHER'+#13+
   'FROM  Data0131 INNER JOIN'+#13+
   ' data0112 ON Data0131.INVOICE_PTR = data0112.rkey INNER JOIN'+#13+
   ' Data0105 ON Data0131.GL_HEADER_PTR = Data0105.RKEY'+#13+
   ' where Data0131.invoice_ptr=' +inttostr(rkey112);
   open;
   if not IsEmpty then
    begin
     result:=fieldbyname('VOUCHER').AsString;
     exit;
    end;
  end;    //销售开票 工具,杂项发票

 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='SELECT  top 1 Data0162.cut_date'+#13+
   'FROM  Data0163 INNER JOIN'+#13+
   ' Data0162 ON Data0163.HEADER_PTR = Data0162.RKEY'+#13+
   ' where Data0163.INVOICE_PTR=' +inttostr(rkey112);
   open;
   if not IsEmpty then
    begin
     result:=fieldbyname('cut_date').AsString;
     exit;
    end;
  end;      //发出商品截数 工具,杂项发票

 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:=  'SELECT  top 1 dbo.Data0105.VOUCHER'+#13+
    'FROM dbo.DATA0131 INNER JOIN'+#13+
    'dbo.Data0105 ON dbo.DATA0131.GL_HEADER_PTR = dbo.Data0105.RKEY INNER JOIN'+#13+
    'dbo.Data0064 ON dbo.DATA0131.SO_SHP_PTR = dbo.Data0064.RKEY INNER JOIN'+#13+
    'dbo.data0439 ON dbo.Data0064.packing_list_ptr = dbo.data0439.rkey'+#13+
   ' where data0439.invoice_ptr=' +inttostr(rkey112);
   open;
   if not IsEmpty then
    begin
      result:=fieldbyname('VOUCHER').AsString;
      exit;
    end;
  end;             //销售开票正常指派

 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:=  'SELECT  top 1 dbo.Data0162.cut_date'+#13+
    'FROM dbo.DATA0163 INNER JOIN'+#13+
    'dbo.DATA0162 ON dbo.DATA0163.HEADER_PTR = dbo.Data0162.RKEY INNER JOIN'+#13+
    'dbo.Data0064 ON dbo.DATA0163.SO_SHP_PTR = dbo.Data0064.RKEY INNER JOIN'+#13+
    'dbo.data0439 ON dbo.Data0064.packing_list_ptr = dbo.data0439.rkey'+#13+
    'where data0439.invoice_ptr=' +inttostr(rkey112);
   open;
   if not IsEmpty then
    begin
      result:=fieldbyname('cut_date').AsString;
      exit;
    end;
  end;            //发出商品正常指派静态截数

end;

{procedure TForm1.append_toolsiv(sales_order:string);
var
 mt_error,append_flag:boolean;
begin
append_flag:=true;
try
 form_sotool:=tform_sotool.Create(application);
 form_sotool.edit1.Text:=sales_order;
repeat
 if form_sotool.ShowModal=mrok then
  begin
   try
    form4:=tform4.Create(application);
    with form4 do
     begin
      dm.ADOD04.Open;
      if dm.ADOD04SEED_FLAG.Value<>1 then
      begin
       MaskEdit1.Text:=dm.ADOD04SEED_VALUE.Value;
       if dm.ADOD04SEED_FLAG.Value=4 then
        maskedit1.ReadOnly:=true;
      end;
      edit1.Text:=form_sotool.Aqd64CUST_CODE.Value;
      label19.Caption:=form_sotool.Aqd64CUSTOMER_NAME.Value;
      edit2.Text:=form_sotool.Aqd64SALES_ORDER.Value;
      edit5.Text:=form_sotool.Aqd64CURR_CODE.Value;
      label20.Caption:=form_sotool.Aqd64CURR_NAME.Value;
      edit7.Text:=form_sotool.Aqd64ENT_DATE.AsString;
      edit9.Text:=form_sotool.Aqd64SCH_DATE.AsString;
      edit6.Text:=form_sotool.Aqd64PO_NUMBER.Value;
      edit10.Text:=form_sotool.Aqd64PO_DATE.AsString;
      edit3.Text:=form_sotool.Aqd64MANU_PART_NUMBER.Value;
      label8.Caption:=form_sotool.Aqd64MANU_PART_DESC.Value;
      checkbox2.Checked:=form_sotool.Aqd64tax_in_price.Value='Y';
      Edit4.Text:= form_sotool.Aqd64abbrname15.Value;
     end;
     dm.ADO112.Close;
     dm.ADO112.Parameters[0].Value:=null;
     dm.ADO112.Open;
     self.append_toolinvoice;
     mt_error:=true;     //下便过程使用了变参调用
     if dm.fincontrol1='Y' then
     self.append_toolvoucher(mt_error);  //增加会计凭证数据
    if mt_error then
     if form4.ShowModal=mrok then
      begin
       dm.AqD112.Close;
       dm.AqD112.Open;
       dm.AqD112.Locate('rkey',dm.ADO112RKEY.Value,[]);
       dm.ADO112.Close;
       dm.ADO105.Close;
       dm.ADO106.Close;
       dm.ADO65.Close;
      end
     else
      begin
       dm.ADO112.Close;
       dm.ADO105.Close;
       dm.ADO106.Close;
       dm.ADO65.Close;
      end
    else
     messagedlg('对不起客户信息中所定义的A/R帐目核算单一外币,且与销售货币不一致',mterror,[mbcancel],0);
   finally
    form4.Free;
   end;
  end
 else
 append_flag:=false;
until not append_flag

finally
 form_sotool.free;
end;
end;}

procedure TForm1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TForm1.append_invoice();
var
 ship_price,disc_single,tax_single,ship_charge:Double;//single;
 ship_amount,disc_amount,tax_amount:Double;//single;
 i,v_year,v_month,v_day:integer;
begin
  disc_single:=0;  //折扣
  tax_single:=0;    //增值税
  ship_price:=0;  //不含税价款
  ship_charge:=0;  //装运费用

  ship_amount:=0; //不含税价款合计
  disc_amount:=0;   //折扣合计
  tax_amount:=0;   //增值税合计

  dm.ado112.Append;
  dm.ado112CUSTOMER_PTR.Value:=form_packlist.aqd439customer_ptr.value;   //客户             1
  dm.ado112CURRENCY_PTR.Value:=form_packlist.aqd439currency_ptr.Value;   //货币             2
  dm.ado112INVOICE_DATE.Value:=self.sys_sortdate;                        //帐龄日期         3
  dm.ADO112POSTED_DATE.Value:=self.sys_sortdate;                         //发票日期3         4
  dm.ado112EXCHANGE_RATE.Value:=form_packlist.aqd439base_to_other.Value; //汇率           5
  
  if (form_packlist.aqd439EDI_FLAG_CREDIT_MEMO.Value > 0) and
     (form_packlist.aqd439EDI_FLAG_CREDIT_MEMO.Value <= 28) then
   v_day:=form_packlist.aqd439EDI_FLAG_CREDIT_MEMO.Value              //结帐日
  else
   v_day:=1;
  if form_packlist.aqd439REG_TAX_FIXED_UNUSED.AsInteger = 1 then      //发票到期计算方法为货到
   dm.ADO112net_pay.Value := form_packlist.aqd439NET_PAY.Value         //付款天数         6
  else  //发票到期计算方法为月结
   if dayof(dm.ADO112POSTED_DATE.Value) > v_day then
    begin
     if MonthOf(dm.ADO112POSTED_DATE.Value)+1 <= 12 then
      begin
       v_month:=MonthOf(dm.ADO112POSTED_DATE.Value)+1;
       v_year:=YearOf(dm.ADO112POSTED_DATE.Value);
      end
     else
      begin
       v_month:=1;
       v_year:=YearOf(dm.ADO112POSTED_DATE.Value)+1;
      end;
     dm.ADO112net_pay.Value:=
     DaysBetween(EncodeDate(v_year,v_month,v_day),
                 dm.ADO112POSTED_DATE.Value)+form_packlist.aqd439NET_PAY.Value;
    end
   else
    dm.ADO112net_pay.Value := v_day-dayof(dm.ADO112POSTED_DATE.Value)+
                               form_packlist.aqd439NET_PAY.Value;

  dm.ADO112DUE_DATE.Value := dm.ADO112POSTED_DATE.Value+dm.ADO112net_pay.Value;//到期日  7
  dm.ado112CSI_USER_PTR.AsString := rkey73;   //系统用户                        8
  dm.ado112EMPL_PTR.AsString := common.user_ptr;       //员工                           10
  dm.Ado112invoice_type.Value:=1;                       //标准发票

  form2.stringgrid1.RowCount:=form_packlist.DBGrid1.SelectedRows.Count+2;

 for i:=1 to form_packlist.DBGrid1.SelectedRows.Count do
  begin
   Form_packlist.dbgrid1.DataSource.DataSet.Bookmark :=
                       Form_packlist.dbgrid1.SelectedRows.Items[i-1];

   form2.stringgrid1.Cells[0,i]:=Form_packlist.aqd439sales_order.Value;
   form2.stringgrid1.Cells[1,i]:=Form_packlist.aqd439sales_date.AsString;
   form2.stringgrid1.Cells[2,i]:=Form_packlist.aqd439ship_method.Value;
   form2.stringgrid1.Cells[3,i]:=Form_packlist.aqd439sum_amount.AsString;
   form2.stringgrid1.Cells[4,i]:=Form_packlist.aqd439rkey.AsString;

   Form_packlist.aqd64.Close;
   Form_packlist.aqd64.Parameters.ParamByName('rkey').Value:=Form_packlist.aqd439rkey.Value;
   Form_packlist.aqd64.Open;

  Form_packlist.aqd64.First;
  while not Form_packlist.aqd64.Eof do
   begin
     form2.stringgrid2.Cells[0,form2.stringgrid2.RowCount-1]:=Form_packlist.aqd64SALES_ORDER.Value;
     form2.stringgrid2.Cells[1,form2.stringgrid2.RowCount-1]:=Form_packlist.aqd64PROD_CODE.Value;
     form2.stringgrid2.Cells[2,form2.stringgrid2.RowCount-1]:=Form_packlist.aqd64PRODUCT_NAME.Value;
     form2.stringgrid2.Cells[5,form2.stringgrid2.RowCount-1]:=Form_packlist.aqd64quantity.AsString;
     form2.stringgrid2.Cells[6,form2.stringgrid2.RowCount-1]:=Form_packlist.aqd64price.AsString;
     form2.stringgrid2.Cells[7,form2.stringgrid2.RowCount-1]:=Form_packlist.aqd64tax_rate.AsString;
     form2.stringgrid2.Cells[8,form2.stringgrid2.RowCount-1]:=Form_packlist.aqd64tax_in_price.Value;
     form2.stringgrid2.Cells[9,form2.stringgrid2.RowCount-1]:=Form_packlist.aqd64so_ptr.AsString;
     form2.stringgrid2.Cells[10,form2.stringgrid2.RowCount-1]:=Form_packlist.aqd64rkey.AsString;

//     form2.stringgrid2.Cells[4,form2.stringgrid2.RowCount-1]:=Form_packlist.aqd64PO_NUMBER.AsString;
//     form2.stringgrid2.Cells[5,form2.stringgrid2.RowCount-1]:=Form_packlist.aqd64QUAN_SHIPPED.AsString;
//     form2.stringgrid2.Cells[6,form2.stringgrid2.RowCount-1]:=Form_packlist.aqd64part_price.AsString;
//     form2.stringgrid2.Cells[7,form2.stringgrid2.RowCount-1]:=Form_packlist.aqd64TAX_2.AsString;
//     form2.stringgrid2.Cells[8,form2.stringgrid2.RowCount-1]:=Form_packlist.aqd64tax_in_price.Value;
//     form2.stringgrid2.Cells[9,form2.stringgrid2.RowCount-1]:=Form_packlist.aqd64packing_list_ptr.AsString;
//     form2.stringgrid2.Cells[10,form2.stringgrid2.RowCount-1]:=Form_packlist.aqd64rkey.AsString;
//     form2.stringgrid2.Cells[11,form2.stringgrid2.RowCount-1]:=Form_packlist.aqd64discount.AsString;
     form2.StringGrid2.RowCount:=form2.StringGrid2.RowCount+1;
     if form_packlist.aqd64tax_in_price.Value='N' then  //(价格中不含税)
      ship_price := Form_packlist.aqd64quantity.Value*Form_packlist.aqd64price.Value
     else                                               //(价格中含税)
      ship_price := Form_packlist.aqd64quantity.Value*Form_packlist.aqd64price.Value/
                      (1+Form_packlist.aqd64tax_rate.Value*0.01);

     //tax_single:=(ship_price-disc_single)*Form_packlist.aqd64tax_rate.Value*0.01;
     tax_single:=Form_packlist.aqd64quantity.Value*Form_packlist.aqd64price.Value-ship_price;
     ship_amount:=ship_amount+ship_price;

     disc_amount:=disc_amount+disc_single;
     tax_amount:=tax_amount+tax_single;
     Form_packlist.aqd64.Next;
   end; //结束64子表循环

  end; //结束439_FOR主表循环

  dm.ado112ship_amount.AsString:=floattostrf(ship_amount,ffFixed,10,2);     //廷伸成本 11
  dm.ado112DISCOUNT_AMOUNT.AsString:=floattostrf(disc_amount,ffFixed,10,2); //折扣金额 14
  dm.ado112FED_TAX_AMOUNT.AsString:=floattostrf(tax_amount,ffFixed,10,2);   //增值税   15
  dm.ADO112SHIPPING_CHARGES.Value:=ship_charge;                             //装运费用 16

  dm.ADO112INVOICE_TOTAL.Value:=roundto(dm.ADO112SHIPPING_CHARGES.Value+
                                dm.ADO112ship_amount.Value+
                                dm.ADO112FED_TAX_AMOUNT.Value-
                                dm.ADO112DISCOUNT_AMOUNT.Value,-2); //总计金额 17
end;

{procedure TForm1.append_toolinvoice();
var
 ship_price,tax_single:single;
 i,v_year,v_month,v_day:integer;
begin
 ship_price:=0;   //工具费用合计
 tax_single:=0;   //增值税合计

  dm.ado112.Append;
  dm.ado112CUSTOMER_PTR.Value := form_sotool.Aqd64CUSTOMER_PTR.value; //客户        1
  dm.ado112CURRENCY_PTR.Value := form_sotool.aqd64currency_ptr.Value; //货币        2
  dm.ado112INVOICE_DATE.Value := form_sotool.aqd64date_sailing.Value; //帐龄日期    3
  dm.ADO112POSTED_DATE.Value := form_sotool.aqd64date_sailing.Value; //发票日期    3
  dm.ado112EXCHANGE_RATE.Value := form_sotool.Aqd64base_to_other.Value;   //汇率    4
  dm.ADO112sales_order_ptr.Value := form_sotool.aqd64rkey.Value;     //销售订单指针 6
  dm.ADO112warehouse_ptr.Value := form_sotool.Aqd64warehouse_ptr.Value; //工厂指针
  if (form_sotool.Aqd64EDI_FLAG_CREDIT_MEMO.Value > 0) and
     (form_sotool.aqd64EDI_FLAG_CREDIT_MEMO.Value <= 28) then
   v_day:=form_sotool.aqd64EDI_FLAG_CREDIT_MEMO.Value            //结帐日
  else
   v_day:=1;
  if form_sotool.Aqd64REG_TAX_FIXED_UNUSED.AsInteger=1 then    //发票到期计算方法为货到
   dm.ADO112net_pay.Value := form_sotool.Aqd64NET_PAY.Value         //付款天数         6
  else                                             //发票到期计算方法为月结
   if dayof(dm.ADO112POSTED_DATE.Value) > v_day then
    begin
     if MonthOf(dm.ADO112POSTED_DATE.Value)+1 <= 12 then
      begin
       v_month:=MonthOf(dm.ADO112POSTED_DATE.Value)+1;
       v_year:=YearOf(dm.ADO112POSTED_DATE.Value);
      end
     else
      begin
       v_month:=1;
       v_year:=YearOf(dm.ADO112POSTED_DATE.Value)+1;
      end;
     dm.ADO112net_pay.Value:=
     DaysBetween(EncodeDate(v_year,v_month,v_day),
                 dm.ADO112POSTED_DATE.Value)+form_sotool.Aqd64NET_PAY.Value;
    end
   else
    dm.ADO112net_pay.Value := v_day-dayof(dm.ADO112POSTED_DATE.Value)+
                               form_sotool.Aqd64NET_PAY.Value;
  dm.ADO112DUE_DATE.Value := dm.ADO112POSTED_DATE.Value+dm.ADO112net_pay.Value;//到期日  8
  dm.ado112CSI_USER_PTR.AsString := rkey73;   //系统用户                        9
  dm.ado112EMPL_PTR.AsString := common.user_ptr;       //员工                           10
  dm.ADO112ship_tax.Value := form_sotool.Aqd64tax_2.Value;
  dm.Ado112invoice_type.Value:=2;
  form_sotool.aqd62.First;
  while not form_sotool.aqd62.Eof do
   begin
    if form_sotool.aqd64tax_in_price.Value='N' then  //(价格中不含税)
     begin
      ship_price := ship_price+
        strtocurr(floattostrf(form_sotool.Aqd62AMOUNT.Value,ffFixed,10,4));
      if form_sotool.Aqd62TAX_FLAG.Value='Y' then
        tax_single := tax_single+strtocurr(floattostrf(
                      form_sotool.Aqd62AMOUNT.Value*
                      dm.ADO112ship_tax.Value*0.01,ffFixed,10,4)); //增值税
     end
    else                                             //(价格中含税)
     begin
      if form_sotool.Aqd62TAX_FLAG.Value='Y' then
       begin
        ship_price :=ship_price+strtocurr(floattostrf(
                     form_sotool.Aqd62AMOUNT.Value/
                     (1+dm.ADO112ship_tax.Value*0.01),ffFixed,10,4));
        tax_single:=tax_single+strtocurr(floattostrf(
            form_sotool.Aqd62AMOUNT.Value*dm.ADO112ship_tax.Value*0.01/
                       (1+dm.ADO112ship_tax.Value*0.01),ffFixed,10,4));
       end
      else
       ship_price := ship_price+ strtocurr(floattostrf(
                           form_sotool.Aqd62AMOUNT.Value,ffFixed,10,4));
     end;  //不含税工具费用

    for i:=1 to form4.SGrid3.RowCount-1 do
     if (form_sotool.Aqd62ADDL_CAT_PTR.Value=strtoint(form4.sgrid3.Cells[4,i])) then
      begin
       form4.SGrid3.Cells[2,i]:=formatfloat('0.0000',form_sotool.Aqd62FREE_AMOUNT.Value);
       form4.SGrid3.Cells[3,i]:=formatfloat('0.0000',form_sotool.Aqd62AMOUNT.Value);
       form4.sgrid3.Cells[1,i]:=form_sotool.Aqd62TAX_FLAG.Value;
       break;
      end;

    form_sotool.aqd62.Next;
   end;

   dm.ADO112TOOLING_CHARGES.Value := roundto(ship_price,-2);     //工具费用 11
   dm.ADO112ship_tax_amount.Value := roundto(tax_single,-2);     //增值税   15
   dm.ado112INVOICE_TOTAL.Value:=roundto(dm.ADO112TOOLING_CHARGES.Value+
                               dm.ADO112ship_tax_amount.Value,-2);    //总计金额 16
end;}

function TForm1.get_vouchernumber(inv_date: tdatetime): string;
var
 voucher:string;
 pr_req:integer;
begin
 voucher:='TA'+copy(inttostr(yearof(inv_date)),3,2);  //年度
 if length(inttostr(monthof(inv_date))) < 2 then
  voucher := voucher+'0'+inttostr(monthof(inv_date))
 else
  voucher := voucher+inttostr(monthof(inv_date));      //月份
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select top 1 VOUCHER from data0105');
   sql.Add('where VOUCHER like '''+voucher+'%''');
   sql.Add('order by voucher desc');
   open;
  end;
 if dm.ADOQuery1.IsEmpty then
  begin
   voucher:= voucher+'00001';
  end
 else
  begin
   pr_req := strtoint(copy(dm.ADOQuery1.fieldvalues['VOUCHER'],
   length(trim(voucher))+1,5));
   pr_req := 100000+pr_req+1;
   voucher := voucher+copy(inttostr(pr_req),2,5);
  end;
 result:=voucher;
end;

{procedure TForm1.append_toolvoucher(var mt_error:boolean);
var
 ys_total,ys_single:currency;
begin
 if not dm.Aqd508.Active then dm.Aqd508.Open;
 form4.Edit11.Text:=dm.ADO112POSTED_DATE.AsString;
 form4.edit8.Text := self.get_vouchernumber(dm.ADO112POSTED_DATE.Value);  //凭证编号
 form4.Edit13.Text:=inttostr(yearof(dm.ADO112POSTED_DATE.Value));   //会计年度
 form4.Edit14.Text:=inttostr(monthof(dm.ADO112POSTED_DATE.Value));  //会计期间
 form4.Edit15.Text := empl_name.Caption;  //制作人员
 dm.ADO104.Close;
 dm.ADO104.Open;           //打开会计分录定义
  with dm.ADOQuery1 do     //处理应收帐款净价格发票总价格不能为零
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
    sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
    sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
    sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
    if form_sotool.aqd64ACC_REC_PTR.Value>0 then
     sql.Add('where Data0103.rkey='+form_sotool.aqd64ACC_REC_PTR.AsString)
    else
     sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_01.AsString);
    open;

    case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       form4.sgrid1.Cells[2,form4.sgrid1.RowCount-1]:= curr_code.Caption;         //货币
       form4.sgrid1.Cells[3,form4.sgrid1.RowCount-1]:='1' ;          //汇率
       form4.sgrid1.Cells[4,form4.sgrid1.RowCount-1]:=               //原币金额
         Formatfloat('0.00',dm.ADO112INVOICE_TOTAL.Value*
                            dm.ADO112EXCHANGE_RATE.Value);
       form4.sgrid2.Cells[1,form4.sgrid2.RowCount-1]:='1';
      end;

      2:             //核算单一外币
       begin
       if fieldbyname('curr_ptr').AsInteger=dm.ADO112CURRENCY_PTR.Value then
        begin
         form4.sgrid1.Cells[2,form4.sgrid1.RowCount-1]:=               //货币
                           form_sotool.aqd64CURR_CODE.Value;
         form4.sgrid1.Cells[3,form4.sgrid1.RowCount-1]:=               //汇率
                           form_sotool.Aqd64base_to_other.AsString;
         form4.sgrid1.Cells[4,form4.sgrid1.RowCount-1]:=               //原币金额
                           formatfloat('0.00',dm.ADO112INVOICE_TOTAL.Value);
         form4.sgrid2.Cells[1,form4.sgrid2.RowCount-1]:=
                         dm.ADO112CURRENCY_PTR.AsString;
        end
       else
        begin
         mt_error:=false;
        end;
       end;
      end;

      form4.sgrid1.Cells[0,form4.sgrid1.RowCount-1]:=              //摘要
                         form_sotool.aqd64sales_order.Value+ '['+
                         form_sotool.aqd64CUST_CODE.Value+
                          form_sotool.aqd64ABBR_NAME.Value+']';
      form4.sgrid1.Cells[1,form4.sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);

      form4.sgrid1.Cells[5,form4.sgrid1.RowCount-1]:=        //借方本币金额
                        formatfloat('0.00',dm.ADO112INVOICE_TOTAL.Value*
                        dm.ADO112EXCHANGE_RATE.Value);
      if form_sotool.aqd64ACC_REC_PTR.Value>0 then
       form4.sgrid2.Cells[0,form4.sgrid2.RowCount-1]:=form_sotool.aqd64ACC_REC_PTR.AsString
      else
       form4.sgrid2.Cells[0,form4.sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_01.AsString;
      form4.sgrid1.RowCount:=form4.sgrid1.RowCount+1;
      form4.sgrid2.RowCount:=form4.sgrid2.RowCount+1;
   end;
//=============以上为借方====下面为货方=====================================
 ys_total:=0;            //记录多少金额是没有在工具费用类别中定义科目的

 form_sotool.Aqd62.First;
 while not form_sotool.Aqd62.Eof do
  begin
   if (form_sotool.Aqd62PTR_TO_GL_ACCT.Value>0) and
      (form_sotool.Aqd62AMOUNT.Value>0) then //类别中定义了会计科目
    begin
     if (form_sotool.Aqd64tax_in_price.Value='Y') and
        (form_sotool.Aqd62TAX_FLAG.Value='Y') then
      ys_single :=form_sotool.Aqd62AMOUNT.Value/(1+dm.ADO112ship_tax.Value*0.01)
     else
      ys_single:=form_sotool.Aqd62AMOUNT.Value;
    with dm.ADOQuery1 do
     begin
      close;
      sql.Clear;
      sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
      sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
      sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
      sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
      sql.Add('where Data0103.rkey='+form_sotool.Aqd62PTR_TO_GL_ACCT.AsString);
      open;

      case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       form4.sgrid1.Cells[2,form4.sgrid1.RowCount-1]:= curr_code.Caption;   //货币
       form4.sgrid1.Cells[3,form4.sgrid1.RowCount-1]:='1' ;          //汇率
       form4.sgrid1.Cells[4,form4.sgrid1.RowCount-1]:=               //原币金额
                        formatfloat('0.00',ys_single*dm.ADO112EXCHANGE_RATE.Value);
       form4.sgrid2.Cells[1,form4.sgrid2.RowCount-1]:='1';
      end;

      2:             //核算单一外币
      begin
       if fieldbyname('curr_ptr').AsInteger=form_sotool.aqd64currency_ptr.Value then
        begin
         form4.sgrid1.Cells[2,form4.sgrid1.RowCount-1]:=               //货币
                           form_sotool.aqd64CURR_CODE.Value;
         form4.sgrid1.Cells[3,form4.sgrid1.RowCount-1]:=               //汇率
                           form_sotool.Aqd64base_to_other.AsString;
         form4.sgrid1.Cells[4,form4.sgrid1.RowCount-1]:=               //原币金额
                           formatfloat('0.00',ys_single);
         form4.sgrid2.Cells[1,form4.sgrid2.RowCount-1]:=
                         form_sotool.aqd64currency_ptr.AsString;
        end
       else
        begin
         mt_error:=false;
        end;
      end;
      end;
      form4.sgrid1.Cells[0,form4.sgrid1.RowCount-1]:=              //摘要
                         form_sotool.aqd64sales_order.Value+'['+
                         form_sotool.aqd64CUST_CODE.Value+
                         form_sotool.aqd64ABBR_NAME.Value+']';
      form4.sgrid1.Cells[1,form4.sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
      form4.sgrid1.Cells[6,form4.sgrid1.RowCount-1]:=     //贷方本币金额
                        formatfloat('0.00',ys_single*dm.ADO112EXCHANGE_RATE.Value);
      form4.sgrid2.Cells[0,form4.sgrid2.RowCount-1]:=form_sotool.Aqd62PTR_TO_GL_ACCT.AsString;
      form4.sgrid1.RowCount:=form4.sgrid1.RowCount+1;
      form4.sgrid2.RowCount:=form4.sgrid2.RowCount+1;
     end;
    end
   else
    begin
     if (form_sotool.Aqd64tax_in_price.Value='Y') and
        (form_sotool.Aqd62TAX_FLAG.Value='Y') then         //类型需征税
      ys_total :=ys_total+form_sotool.Aqd62AMOUNT.Value/
                        (1+dm.ADO112ship_tax.Value*0.01)
     else                                                  //价格中不含税
      ys_total:=ys_total+form_sotool.Aqd62AMOUNT.Value;
    end;
   form_sotool.Aqd62.Next;
  end;
//=========================工具类型中定义科目，与基本定义科目分开做帐=======
  if ys_total>0 then
    with dm.ADOQuery1 do
     begin
      close;
      sql.Clear;
      sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
      sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
      sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
      sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
      sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_03.AsString);
      open;

      case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       form4.sgrid1.Cells[2,form4.sgrid1.RowCount-1]:= curr_code.Caption;   //货币
       form4.sgrid1.Cells[3,form4.sgrid1.RowCount-1]:='1' ;          //汇率
       form4.sgrid1.Cells[4,form4.sgrid1.RowCount-1]:=               //原币金额
                        formatfloat('0.00',ys_total*dm.ADO112EXCHANGE_RATE.Value);
       form4.sgrid2.Cells[1,form4.sgrid2.RowCount-1]:='1';
      end;

      2:             //核算单一外币
      begin
       if fieldbyname('curr_ptr').AsInteger=form_sotool.aqd64currency_ptr.Value then
        begin
         form4.sgrid1.Cells[2,form4.sgrid1.RowCount-1]:=               //货币
                           form_sotool.aqd64CURR_CODE.Value;
         form4.sgrid1.Cells[3,form4.sgrid1.RowCount-1]:=               //汇率
                           form_sotool.Aqd64base_to_other.AsString;
         form4.sgrid1.Cells[4,form4.sgrid1.RowCount-1]:=               //原币金额
                           formatfloat('0.00',ys_total);
         form4.sgrid2.Cells[1,form4.sgrid2.RowCount-1]:=
                         form_sotool.aqd64currency_ptr.AsString;
        end
       else
        begin
         mt_error:=false;
        end;
      end;
      end;
      form4.sgrid1.Cells[0,form4.sgrid1.RowCount-1]:=              //摘要
                         form_sotool.aqd64sales_order.Value+'['+
                         form_sotool.aqd64CUST_CODE.Value+
                         form_sotool.aqd64ABBR_NAME.Value+']';
      form4.sgrid1.Cells[1,form4.sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
      form4.sgrid1.Cells[6,form4.sgrid1.RowCount-1]:=     //贷方本币金额
                        formatfloat('0.00',ys_total*dm.ADO112EXCHANGE_RATE.Value);
      form4.sgrid2.Cells[0,form4.sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_03.AsString;
      form4.sgrid1.RowCount:=form4.sgrid1.RowCount+1;
      form4.sgrid2.RowCount:=form4.sgrid2.RowCount+1;
     end;
   //===============处理税金====================================================
  if dm.ADO112ship_tax_amount.Value>0 then
    with dm.ADOQuery1 do
     begin
      close;
      sql.Clear;
      sql.Add('SELECT Data0103.GL_ACC_NUMBER, Data0103_1.GL_DESCRIPTION,');
      sql.Add('Data0103.GL_DESCRIPTION AS DESCRIPTION,data0103.curr_tp,data0103.curr_ptr');
      sql.Add('FROM dbo.Data0103 LEFT OUTER JOIN');
      sql.Add('Data0103 Data0103_1 ON Data0103.PARENT_PTR = Data0103_1.RKEY');
      sql.Add('where Data0103.rkey='+dm.ADO104DFLT_ACCT_06.AsString);
      open;

      case fieldbyname('curr_tp').AsInteger of
      0:                 //不核算外币
      begin
       form4.sgrid1.Cells[2,form4.sgrid1.RowCount-1]:= curr_code.Caption;   //货币
       form4.sgrid1.Cells[3,form4.sgrid1.RowCount-1]:='1' ;          //汇率
       form4.sgrid1.Cells[4,form4.sgrid1.RowCount-1]:=               //原币金额
                        formatfloat('0.00',dm.ADO112ship_tax_amount.Value*
                        dm.ADO112EXCHANGE_RATE.Value);
       form4.sgrid2.Cells[1,form4.sgrid2.RowCount-1]:='1';
      end;
      2:             //核算单一外币
      begin
       if fieldbyname('curr_ptr').AsInteger=form_sotool.aqd64currency_ptr.Value then
        begin
         form4.sgrid1.Cells[2,form4.sgrid1.RowCount-1]:=               //货币
                           form_sotool.aqd64CURR_CODE.Value;
         form4.sgrid1.Cells[3,form4.sgrid1.RowCount-1]:=               //汇率
                           form_sotool.Aqd64base_to_other.AsString;
         form4.sgrid1.Cells[4,form4.sgrid1.RowCount-1]:=               //原币金额
                           formatfloat('0.00',dm.ADO112ship_tax_amount.Value);
         form4.sgrid2.Cells[1,form4.sgrid2.RowCount-1]:=
                         form_sotool.aqd64currency_ptr.AsString;
        end
       else
        begin
         mt_error:=false;
        end;
      end;
     end;
      form4.sgrid1.Cells[0,form4.sgrid1.RowCount-1]:=              //摘要
                         form_sotool.aqd64sales_order.Value+'['+
                         form_sotool.aqd64CUST_CODE.Value+
                         form_sotool.aqd64ABBR_NAME.Value+']';
      form4.sgrid1.Cells[1,form4.sgrid1.RowCount-1]:=              //科目
                         trim(FieldValues['gl_acc_number'])+'-'+
                         trim(Fieldbyname('GL_DESCRIPTION').AsString)+'-'+
                         trim(FieldValues['DESCRIPTION']);
      form4.sgrid1.Cells[6,form4.sgrid1.RowCount-1]:=     //贷方本币金额
                        formatfloat('0.00',dm.ADO112ship_tax_amount.Value*
                        dm.ADO112EXCHANGE_RATE.Value);
      form4.sgrid2.Cells[0,form4.sgrid2.RowCount-1]:=dm.ADO104DFLT_ACCT_06.AsString;
      form4.sgrid1.RowCount:=form4.sgrid1.RowCount+1;
      form4.sgrid2.RowCount:=form4.sgrid2.RowCount+1;
     end;
end;}

{function TForm1.if_toolsamount(var so:string): boolean;
var
 i:integer;
 result_falg:boolean;
begin
result:=false;
result_falg:=false;
with  form_packlist do
begin
 for i:=1 to DBGrid1.SelectedRows.Count do
  begin
   dbgrid1.DataSource.DataSet.Bookmark :=
                       dbgrid1.SelectedRows.Items[i-1];

   aqd64.Close;
   aqd64.Parameters.ParamByName('rkey').Value:=aqd439rkey.Value;
   aqd64.Open;
   aqd64.First;
   while not aqd64.Eof do
   begin
    if aqd64tools_amount.Value>0 then
     begin
      result:=true;
      result_falg:=true;
      so:= form_packlist.aqd64SALES_ORDER.Value;
      break;
     end
    else
     aqd64.Next;
   end;
   if result_falg then break;
  end;
end;
end;}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure Tform1.CopyDbDataToExcel(Args:array of const);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
 I: Integer;
begin
 Screen.Cursor := crHourGlass;
 if not VarIsEmpty(XLApp) then
 begin
   XLApp.DisplayAlerts := False;
   XLApp.Quit;
   VarClear(XLApp);
 end;
 try
   XLApp := CreateOleObject('Excel.Application');
 except
   Screen.Cursor := crDefault;
   Exit;
 end;
 XLApp.WorkBooks.Add;
 XLApp.SheetsInNewWorkbook := High(Args) + 1;

 for I := Low(Args) to High(Args) do
 begin
   XLApp.WorkBooks[1].WorkSheets[I+1].Name := self.Caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
   if not TDBGrid(Args[I].VObject).DataSource.DataSet.Active then
    begin
     Screen.Cursor := crDefault;
     Exit;
    end;
   TDBGrid(Args[I].VObject).DataSource.DataSet.DisableControls;
   TDBGrid(Args[I].VObject).DataSource.DataSet.first;

   v_cloumn:=0;
   for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
    if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
     Sheet.Cells[1, iCount + 1 - v_cloumn] :=
     TDBGrid(Args[I].VObject).Columns.Items[iCount].Title.Caption
    else
     inc(v_cloumn);

   jCount := 1;
   while not TDBGrid(Args[I].VObject).DataSource.DataSet.Eof do
   begin
     v_cloumn:=0;
     for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
      if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
       Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
       TDBGrid(Args[I].VObject).Columns.Items[iCount].Field.AsString
      else
       inc(v_cloumn);
     Inc(jCount);
     TDBGrid(Args[I].VObject).DataSource.DataSet.Next;
   end;

   XlApp.Visible := True;
   TDBGrid(Args[I].VObject).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);

begin
 CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
 rkey112:integer;
begin
rkey112:=dm.AqD112RKEY.Value;
dm.AqD112.Close;
dm.AqD112.Open;
if rkey112>0 then dm.AqD112.Locate('rkey',rkey112,[]);
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm1.N9Click(Sender: TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to dbgrid1.FieldCount-1 do
  if dbgrid1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    dbgrid1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;

procedure TForm1.N26Click(Sender: TObject);
begin
 form_voucherreport:=Tform_voucherreport.Create(application);
 form_voucherreport.AQD105.Close;
 form_voucherreport.AQD105.Parameters[0].Value:=dm.AqD112rkey105.Value;
 form_voucherreport.AQD105.open;
 form_voucherreport.AQD106.Open;
 form_voucherreport.AQD493.Open;
 IF not form_voucherreport.AQD105.IsEmpty THEN
 form_voucherreport.ppReport1.Print;
 form_voucherreport.Free;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.AqD112.CommandText);
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.FieldName<>dm.AqD112.IndexFieldNames) and
   (column.FieldName<>'TYPE') and
   (column.FieldName<>'v_status') then
 dm.AqD112.IndexFieldNames:=column.FieldName;

if (column.ReadOnly) and (field_name<>column.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;
 end
else
 edit1.SetFocus;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
if dm.ADOConnection1.Connected then
 begin
  field_name:='invoice_number';
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select data0073.employee_ptr,data0005.employee_name');
    sql.Add('from data0073 inner join data0005');
    sql.Add('on data0073.employee_ptr=data0005.rkey');
    sql.Add('where data0073.rkey='+rkey73);
    open;
    common.user_ptr:=fieldbyname('employee_ptr').AsString;
    empl_name.Caption:=fieldbyname('employee_name').AsString;
   end;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select curr_code from data0001 where rkey=1');
    open;
    self.curr_code.Caption:=fieldvalues['curr_code'];
   end;
   with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select getdate() as sys_date');
    open;
    self.sys_sortdate:=strtodate(datetostr(fieldvalues['sys_date']));
   end;
  with dm.adoquery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select fin_control1 from data0192');
   open;
   dm.fincontrol1 := fieldbyname('fin_control1').AsString;
  end;
  dm.AqD112.Close;
  dm.AqD112.Parameters.ParamByName('dtpk1').Value:=self.sys_sortdate-dayof(self.sys_sortdate)+1;
  dm.AqD112.Parameters.ParamByName('dtpk2').Value:=self.sys_sortdate;
  dm.AqD112.Prepared;
  dm.AqD112.Open;
  aqd112_sql:=TStringList.Create;
  aqd112_sql.Text:=dm.AqD112.CommandText;
end;

end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  dm.AqD112.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  dm.AqD112.filter := '';
 dm.AqD112AfterOpen(dm.AqD112);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var
 i:byte;
begin
form_condition:=tform_condition.Create(application);
form_condition.dtpk1.Date:=dm.AqD112.Parameters.ParamValues['dtpk1'];
form_condition.dtpk2.Date:=dm.AqD112.Parameters.ParamValues['dtpk2'];
if form_condition.ShowModal=mrok then
 begin
  aqd112_sql.Delete(aqd112_sql.Count-2);
  aqd112_sql.Delete(aqd112_sql.Count-1);
  if Form_condition.RadioGroup1.ItemIndex=0 then
  begin
   aqd112_sql.Insert(aqd112_sql.Count,'data0112.posted_date>=:dtpk1 and');
   aqd112_sql.Insert(aqd112_sql.Count,'data0112.posted_date<=:dtpk2');
  end
  else
   begin
   aqd112_sql.Insert(aqd112_sql.Count,'data0112.INVOICE_DATE>=:dtpk1 and');
   aqd112_sql.Insert(aqd112_sql.Count,'data0112.INVOICE_DATE<=:dtpk2');
   end;

  dm.AqD112.Close;
  dm.AqD112.CommandText:=self.aqd112_sql.Text;

  for i:=1 to form_condition.SGrid1.RowCount-2 do
   dm.AqD112.CommandText:=dm.AqD112.CommandText+
   form_condition.SGrid1.Cells[2,i]+#13;

  dm.AqD112.Parameters.ParamByName('dtpk1').Value:=form_condition.dtpk1.Date;
  dm.AqD112.Parameters.ParamByName('dtpk2').Value:=form_condition.dtpk2.Date;
  dm.AqD112.Prepared;
  dm.AqD112.Open;
 end;
form_condition.Free;
end;

procedure TForm1.N6Click(Sender: TObject);
var
 append_flag:boolean;
 so:string;
begin
append_flag:=true;
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0)
ELSE
try
form_packlist:=tform_packlist.Create(application);
repeat
if form_packlist.ShowModal=mrok then
 begin
  so:='';
  {if self.if_toolsamount(so) then     //变参调用
   begin
    if messagedlg('订单'+so+'未先开工具费用发票,现在是否新开工具费用发票',mtconfirmation,[mbyes,mbno],0)=mryes then
    append_toolsiv(so);   
   end
  else}
  try
   form2:=tform2.Create(application);
   with form2 do
    begin
     edit1.text:=form_packlist.aqd439CUST_CODE.Value;   //客户
     label19.Caption:=form_packlist.aqd439customer_name.Value;
     edit5.Text:=form_packlist.aqd439curr_code.Value;
     label20.Caption:=form_packlist.aqd439curr_name.Value;
     ACC_REC_PTR:=form_packlist.aqd439ACC_REC_PTR.Value;
     abbr_name.Caption:=Form_packlist.aqd439ABBR_NAME.Value;
     //Edit2.Text := Form_packlist.aqd439abbr_name15.Value;
     dm.ADOD04.Open;
     if dm.ADOD04SEED_FLAG.Value<>1 then
      begin
       MaskEdit1.Text:=dm.ADOD04SEED_VALUE.Value;
       if dm.ADOD04SEED_FLAG.Value=4 then
        maskedit1.ReadOnly:=true;
      end;
    end;
   dm.ADO112.Close;
   dm.ADO112.Parameters[0].Value:=null;
   dm.ADO112.Open;
   self.append_invoice;
   if form2.ShowModal=mrok then
    begin
     dm.AqD112.Close;
     dm.AqD112.Open;
     dm.AqD112.Locate('rkey',dm.ADO112RKEY.Value,[]);
     dm.ADO112.Close;
     dm.ADO105.Close;
     dm.ADO106.Close;
     dm.ADOD64.Close;
    end
    else
     begin
      dm.ADO112.Close;
      dm.ADO105.Close;
      dm.ADO106.Close;
      dm.ADOD64.Close;
     end;
  finally
   form2.Free;
  end;
 end
else
 append_flag:=false;
until not append_flag

finally
 form_packlist.Free;
end;
end;


procedure TForm1.N2Click(Sender: TObject);
var
 voucher:string;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0);
  exit;
 end;

 dm.ADO112.Close;
 dm.ADO112.Parameters[0].Value := dm.AqD112RKEY.Value;
 dm.ADO112.Open;
 voucher:=self.return_VOUCHER(dm.ADO112RKEY.Value);
if voucher<>'' then
 begin
  messagedlg('应收帐龄已经有总帐凭证!请先作废总帐凭证：'+voucher,mtinformation,[mbok],0);
  dm.ADO112.Close;
  exit;
 end;

if dm.AqD112STATUS.Value<>0 then
 messagedlg('凭证已处理不能再编辑',mterror,[mbcancel],0)
else
if dm.AqD112invoice_type.Value=1 then
 begin
  try
   form2 := tform2.Create(application);

   dm.ADO112.Edit;
   with form2 do
    begin
     MaskEdit1.Text:=dm.ADO112invoice_number.Value;
     dm.ADOD04.Close;
     dm.ADOD04.Open;
     if dm.ADOD04SEED_FLAG.Value=4 then
      maskedit1.ReadOnly:=true;
     edit1.Text:=dm.AqD112CUST_CODE.Value;
     label19.Caption:=dm.AqD112CUSTOMER_NAME.Value;
     edit5.Text:=dm.AqD112CURR_CODE.Value;
     label20.Caption:=dm.AqD112CURR_NAME.Value;
     abbr_name.Caption:=dm.AqD112ABBR_NAME.Value;
     acc_rec_ptr:=dm.AqD112ACC_REC_PTR.Value;
     Edit2.Text:=dm.AqD112abbrname15.Value;
     if dm.AqD112DSDesigner.Value>0 then //已付金额大于零
     begin
      dbedit6.ReadOnly:=true;
      n1.Enabled:=false;
      stringgrid1.PopupMenu:=nil;
     end;
    end;
   if form2.ShowModal=mrok then
    begin
     dm.AqD112.Close;
     dm.AqD112.Open;
     dm.AqD112.Locate('rkey',dm.ADO112RKEY.Value,[]);
     dm.ADO112.Close;
     dm.ADO105.Close;
     dm.ADO106.Close;
     dm.ADOD64.Close;
    end;
  finally
   form2.Free;
  end;
 end
else
 if dm.AqD112invoice_type.Value=2 then
  try
   {form4:=Tform4.Create(application);
   dm.ADO112.Edit;
    with dm.ADOquery1 do   
     begin
      close;
      sql.Clear;
      sql.Add('SELECT Data0060.ENT_DATE,Data0060.SCH_DATE,Data0097.PO_NUMBER,');
      sql.Add('dbo.Data0097.PO_DATE, dbo.Data0025.MANU_PART_NUMBER, ');
      sql.Add('Data0025.MANU_PART_DESC, ');
      sql.Add('Data0060.tax_in_price');
      sql.Add('FROM dbo.Data0060 INNER JOIN');
      sql.Add('dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN');
      sql.Add('dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY');
      sql.Add('where data0060.rkey='+dm.ADO112sales_order_ptr.AsString);
      open;
     end;
   with form4 do
    begin
     MaskEdit1.Text:=dm.ADO112invoice_number.Value;
     dm.ADOD04.Close;
     dm.ADOD04.Open;
     if dm.ADOD04SEED_FLAG.Value=4 then
      maskedit1.ReadOnly:=true;
     edit1.Text:=dm.AqD112CUST_CODE.Value;
     label19.Caption:=dm.AqD112CUSTOMER_NAME.Value;
     edit2.Text:=dm.AqD112SALES_ORDER.Value;
     edit5.Text:=dm.AqD112CURR_CODE.Value;
     label20.Caption:=dm.AqD112CURR_NAME.Value;
     edit7.Text:=dm.ADOQuery1.fieldbyname('ENT_DATE').AsString;
     edit9.Text:=dm.ADOQuery1.fieldbyname('SCH_DATE').AsString;
     edit6.Text:=dm.ADOQuery1.fieldbyname('PO_NUMBER').AsString;
     edit10.Text:=dm.ADOQuery1.fieldbyname('PO_DATE').AsString;
     checkbox2.Checked:=dm.ADOQuery1.fieldbyname('tax_in_price').AsString='Y';
     edit3.Text:=dm.ADOQuery1.fieldbyname('MANU_PART_NUMBER').AsString;
     edit4.Text:=dm.AqD112abbrname15.Value;
     label8.Caption:=dm.ADOQuery1.fieldbyname('MANU_PART_DESC').AsString;
     if dm.AqD112DSDesigner.Value>0 then
     begin
      dbedit7.ReadOnly:=true;
     end;
    end;

   if form4.ShowModal=mrok then
    begin
     dm.AqD112.Close;
     dm.AqD112.Open;
     dm.AqD112.Locate('rkey',dm.ADO112RKEY.Value,[]);
     dm.ADO112.Close;
     dm.ADO105.Close;
     dm.ADO106.Close;
    end;}
  finally
   form4.Free;
  end
else
try
 form5:=tform5.Create(application);
 dm.ADO112.Edit;
 with form5 do
  begin
   MaskEdit1.Text:=dm.ADO112invoice_number.Value;
   dm.ADOD04.Close;
   dm.ADOD04.Open;
   if dm.ADOD04SEED_FLAG.Value=4 then
    maskedit1.ReadOnly:=true;
   edit1.Text:=dm.AqD112CUST_CODE.Value;
   label19.Caption:=dm.AqD112CUSTOMER_NAME.Value;
   edit5.Text:=dm.AqD112CURR_CODE.Value;
   label20.Caption:=dm.AqD112CURR_NAME.Value;
   Edit2.Text:=dm.AqD112WAREHOUSE_CODE.Value;
   Label13.Caption:=dm.AqD112abbrname15.Value;
   acc_gl_ptr:=dm.AqD112ACC_REC_PTR.Value;
   if dm.AqD112DSDesigner.Value>0 then
    dbedit8.ReadOnly:=true;
  end;
  
 if form5.ShowModal=mrok then
  begin
   dm.AqD112.Close;
   dm.AqD112.Open;
   dm.AqD112.Locate('rkey',dm.ADO112RKEY.Value,[]);
   dm.ADO112.Close;
   dm.ADO105.Close;
   dm.ADO106.Close;
  end
 else
  begin
   dm.ADO112.Close;
   dm.ADO105.Close;
   dm.ADO106.Close;
  end
finally
 form5.free;
end;

end;

procedure TForm1.N3Click(Sender: TObject);
begin
if dm.AqD112invoice_type.Value=1 then
  try
   form2:=tform2.Create(application);
   dm.ADO112.Close;
   dm.ADO112.Parameters[0].Value:=dm.AqD112RKEY.Value;
   dm.ADO112.Open;

   with form2 do
    begin
     MaskEdit1.Text:=dm.ADO112invoice_number.Value;
     edit1.Text:=dm.AqD112CUST_CODE.Value;
     label19.Caption:=dm.AqD112CUSTOMER_NAME.Value;

     edit5.Text:=dm.AqD112CURR_CODE.Value;
     label20.Caption:=dm.AqD112CURR_NAME.Value;

     Edit2.Text:=dm.AqD112abbrname15.Value;
     n1.Enabled:=false;
     bitbtn1.Enabled:=false;
     maskedit1.ReadOnly:=true;
     dbedit2.Enabled:=false;
     dbedit3.Enabled:=false;
     dbedit4.Enabled:=false;
     dbedit6.Enabled:=false;
     dbedit7.Enabled:=false;
     dbedit8.Enabled:=false;
     toolbar1.Enabled:=false;
     sgrid1.Enabled:=false;
     updown1.Enabled:=false;
     stringgrid1.PopupMenu:=nil;          
    end;
   if form2.ShowModal=mrok then
    begin

    end
   else
    begin
     dm.ADO112.Close;
     dm.ADOD64.Close;
    end
  finally
   form2.Free;
  end
else
 if dm.AqD112invoice_type.Value=2 then
  try
   {form4:=Tform4.Create(application);
   dm.ADO112.Close;
   dm.ADO112.Parameters[0].Value:=dm.AqD112RKEY.Value;
   dm.ADO112.Open;
  with dm.ADOquery1 do   //打开发票记事本(新增模式从客户信息里复制过来）
   begin
    close;
    sql.Clear;
    sql.Add('SELECT Data0060.ENT_DATE,Data0060.SCH_DATE,Data0097.PO_NUMBER,');
    sql.Add('dbo.Data0097.PO_DATE, dbo.Data0025.MANU_PART_NUMBER, ');
    sql.Add('Data0025.MANU_PART_DESC,');
    sql.Add('Data0060.tax_in_price');
    sql.Add('FROM dbo.Data0060 INNER JOIN');
    sql.Add('dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN');
    sql.Add('dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY');
    sql.Add('where data0060.rkey='+dm.ADO112sales_order_ptr.AsString);
    open;
   end;
   with form4 do
    begin
     MaskEdit1.Text:=dm.ADO112invoice_number.Value;
     edit1.Text:=dm.AqD112CUST_CODE.Value;
     label19.Caption:=dm.AqD112CUSTOMER_NAME.Value;
     edit2.Text:=dm.AqD112SALES_ORDER.Value;
     edit5.Text:=dm.AqD112CURR_CODE.Value;
     label20.Caption:=dm.AqD112CURR_NAME.Value;
     edit7.Text:=dm.ADOQuery1.fieldbyname('ENT_DATE').AsString;
     edit9.Text:=dm.ADOQuery1.fieldbyname('SCH_DATE').AsString;
     edit6.Text:=dm.ADOQuery1.fieldbyname('PO_NUMBER').AsString;
     edit10.Text:=dm.ADOQuery1.fieldbyname('PO_DATE').AsString;
     checkbox2.Checked:=dm.ADOQuery1.fieldbyname('tax_in_price').AsString='Y';
     edit3.Text:=dm.ADOQuery1.fieldbyname('MANU_PART_NUMBER').AsString;
     edit4.Text:=dm.AqD112abbrname15.Value;
     label8.Caption:=dm.ADOQuery1.fieldbyname('MANU_PART_DESC').AsString;
     toolbar1.Enabled:=false;
     sgrid1.Enabled:=false;
     maskedit1.Enabled:=false;
     dbedit2.Enabled:=false;
     dbedit3.Enabled:=false;
     dbedit4.Enabled:=false;
     dbedit5.Enabled:=false;
     dbedit6.Enabled:=false;
     dbedit7.Enabled:=false;
     bitbtn1.Enabled:=false;
     updown1.Enabled:=false;
    end;

   if form4.ShowModal=mrok then
    begin

    end
   else
    begin
     dm.ADO112.Close;
    end }
  finally
   form4.Free;
  end
else
try
 form5:=tform5.Create(application);
 dm.ADO112.Close;
 dm.ADO112.Parameters[0].Value:=dm.AqD112RKEY.Value;
 dm.ADO112.Open;
 with form5 do
  begin
   MaskEdit1.Text:=dm.ADO112invoice_number.Value;
   edit1.Text:=dm.AqD112CUST_CODE.Value;
   label19.Caption:=dm.AqD112CUSTOMER_NAME.Value;
   edit5.Text:=dm.AqD112CURR_CODE.Value;
   label20.Caption:=dm.AqD112CURR_NAME.Value;
   acc_gl_ptr:=dm.AqD112ACC_REC_PTR.Value;
   Edit2.Text:=dm.AqD112WAREHOUSE_CODE.Value;
   Label13.Caption:=dm.AqD112abbrname15.Value;

   maskedit1.Enabled:=false;
   bitbtn6.Enabled:=false;
   bitbtn4.Enabled:=false;
   BitBtn5.Enabled:=false;
   bitbtn1.Enabled:=false;
   updown1.Enabled:=false;
   toolbar1.Enabled:=false;
   sgrid1.Enabled:=false;
   dbedit1.Enabled:=false;
   dbedit3.Enabled:=false;
   dbedit4.Enabled:=false;
   dbedit5.Enabled:=false;
   dbedit8.Enabled:=false;
   dbedit7.Enabled:=false;
   dbedit9.Enabled:=false;
   dbedit10.Enabled:=false;  //税率
   dbedit6.ReadOnly:=true;
  end;
 if form5.ShowModal=mrok then
  begin

  end
 else
  begin
   dm.ADO112.Close;
  end
finally
 form5.free;
end;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
{if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0)
ELSE
 append_toolsiv('');}
end;


procedure TForm1.N8Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
  messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0)
ELSE
try
 form5:=tform5.Create(application);
 dm.ADO112.Close;
 dm.ADO112.Parameters[0].Value:=null;
 dm.ADO112.Open;
 dm.ADO112.Append;
 dm.ado112INVOICE_DATE.Value := self.sys_sortdate;     //帐龄日期
 dm.ADO112POSTED_DATE.Value := self.sys_sortdate;     //发票日期
 dm.ADO112DUE_DATE.Value:=self.sys_sortdate;
 dm.ado112CSI_USER_PTR.AsString := rkey73;   //系统用户                        9
 dm.ado112EMPL_PTR.AsString := common.user_ptr;       //员工
 dm.ADO112net_pay.Value:=0;
 dm.ADO112INVOICE_TOTAL.Value:=0;
 dm.Ado112invoice_type.Value:=3;
 dm.ADO112ship_amount.Value:=0;
 dm.ADO112FED_TAX_AMOUNT.Value:=0;
 dm.ADO112ship_tax.Value:=0;
 dm.ADOD04.Open;
 if dm.ADOD04SEED_FLAG.Value<>1 then
  begin
   form5.MaskEdit1.Text:=dm.ADOD04SEED_VALUE.Value;
   if dm.ADOD04SEED_FLAG.Value=4 then
    form5.MaskEdit1.ReadOnly:=true;
  end;
 if form5.ShowModal=mrok then
  begin
   dm.AqD112.Close;
   dm.AqD112.Open;
   dm.AqD112.Locate('rkey',dm.ADO112RKEY.Value,[]);
   dm.ADO112.Close;
   dm.ADO105.Close;
   dm.ADO106.Close;
  end
 else
  begin
   dm.ADO112.Close;
   dm.ADO105.Close;
   dm.ADO106.Close;
  end
finally
 form5.free;
end;
end;

procedure TForm1.N4Click(Sender: TObject);
var
 voucher:string;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您只有本程序的只读权限!',mtinformation,[mbok],0);
  exit;
 end;

if strtocurr(common.user_ptr)<>dm.AqD112empl_ptr.Value then
 begin
  messagedlg('对不起取消操作必须由创建人自己完成!',mtinformation,[mbok],0);
  exit;
 end;

 dm.ADO112.Close;
 dm.ADO112.Parameters[0].Value:=dm.AqD112rkey.Value;
 dm.ADo112.Open;

voucher := return_VOUCHER(dm.ADO112RKEY.Value);
if voucher <> '' then
 begin
  messagedlg('应收帐龄已经有总帐凭证!请先作废总帐凭证：'+voucher,mtinformation,[mbok],0);
  dm.ADO112.Close;
  exit;
 end;

if dm.ADO112amount_paid.Value+dm.ADO112CASH_DISC.Value>0 then
 begin
  messagedlg('发票发票已经有收款记录不能取消!',mtinformation,[mbok],0);
  dm.ADO112.Close;
  exit;
 end;
  
if dm.Aqd112INVOICE_STATUS.Value<>dm.ADO112INVOICE_STATUS.Value then
 begin
  messagedlg('发票状态发生变化不能取消!',mtinformation,[mbok],0);
  dm.ADO112.Close;
  exit;
 end;

 dm.ado105.Close;
 dm.ado105.Parameters[0].Value:=dm.Ado112rkey.Value;
 dm.ado105.Open;
 if dm.ado105STATUS.Value>0 then
  begin
   messagedlg('发票生成的会计凭证已被审核,无法取消!',mtinformation,[mbok],0);
   dm.ADO105.Close;
   exit;
  end;

 if messagedlg('请确认是否真的要取消该发票!取消将是不可逆操作',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
   dm.ADOConnection1.BeginTrans;
   try
   if (dm.AqD112invoice_type.Value=1)then  //标准发票
    begin
//   with dm.ADOQuery1 do
//   begin
//   close;                            //需汇总更新060803
//   sql.Clear;
//   sql.Add('update data0060');
//   sql.Add('set data0060.PARTS_INVOICED = data0060.PARTS_INVOICED-');
//   sql.Add('d1.quantity_total');
//   sql.Add('from data0060 inner join (');
//   sql.Add('SELECT Data0064.SO_PTR, SUM(dbo.Data0064.QUAN_SHIPPED)');
//   sql.Add('AS quantity_total');
//   sql.Add('FROM Data0064 INNER JOIN');
//   sql.Add('data0439 ON Data0064.packing_list_ptr = data0439.rkey');
//   sql.Add('WHERE data0439.invoice_ptr = '+dm.ADO112RKEY.AsString);
//   sql.Add('GROUP BY dbo.Data0064.SO_PTR) as d1');
//   sql.Add('on Data0060.rkey = d1.so_ptr');
//   ExecSQL;
//   end;

   with dm.ADOQuery1 do
   begin
   close;
   sql.Clear;
   sql.Add('update WZCP0060');
   sql.Add('set status=3, invoice_ptr=null');
   sql.Add('where invoice_ptr='+dm.ADO112RKEY.AsString);
   ExecSQL;
   end;

   if not dm.ado105.IsEmpty then  //删除计帐凭证
    begin
     dm.ADO105.Edit;
     dm.ADO105STATUS.Value:=5;    //被作废
     dm.ado105.Post;
    end;

    dm.ADO112.Edit;
    dm.ADO112INVOICE_STATUS.Value:=3;
    dm.ado112.Post;

    dm.AqD112.DisableControls;
    dm.Aqd112.Close;
    dm.Aqd112.Open;
    dm.AqD112.Locate('rkey',dm.ADO112RKEY.Value,[]);
    dm.AqD112.EnableControls;
    dm.ADO112.Close;
    dm.ADOQuery1.Close;
    dm.ado105.Close;
   end
  else
   if (dm.AqD112invoice_type.Value=2) then  //取消工具费用发票
   begin
    with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('update data0060');
     sql.Add('set data0060.INVD_ADD_L_PRICE=0');
     sql.Add('where rkey='+dm.ADO112sales_order_ptr.AsString);
     ExecSQL;
    end;

         //删除计帐凭证
   if not dm.ado105.IsEmpty then
    begin
     dm.ADO105.Edit;
     dm.ADO105STATUS.Value:=5;    //被作废
     dm.ado105.Post;
    end;

    dm.ADO112.Edit;
    dm.ADO112INVOICE_STATUS.Value:=3;
    dm.ado112.Post;

     dm.AqD112.DisableControls;
     dm.Aqd112.Close;
     dm.Aqd112.Open;
     dm.AqD112.Locate('rkey',dm.ADO112RKEY.Value,[]);
     dm.AqD112.EnableControls;
     dm.ADO112.Close;
     dm.ado105.Close;
     dm.ADO65.Close;
    end
   else    //取消其它费用发票
    begin
    
    if not dm.ado105.IsEmpty then
    begin
     dm.ADO105.Edit;
     dm.ADO105STATUS.Value:=5;    //被作废
     dm.ado105.Post;
    end;

    dm.ADO112.Edit;
    dm.ADO112INVOICE_STATUS.Value:=3;
    dm.ado112.Post;

     dm.AqD112.DisableControls;
     dm.Aqd112.Close;
     dm.Aqd112.Open;
     dm.AqD112.Locate('rkey',dm.ADO112RKEY.Value,[]);
     dm.AqD112.EnableControls;
     dm.ADO112.Close;
     dm.ado105.Close;
    end;
    dm.ADOConnection1.CommitTrans;
    messagedlg('取消操作成功!',mtinformation,[mbok],0);
   except
    dm.ADOConnection1.RollbackTrans;
    messagedlg('取消操作不成功请与管理员联系!',mterror,[mbok],0);
   end;
  end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
n2.Enabled:=true;
n3.Enabled:=true;
n4.Enabled:=true;
n26.Enabled:=true;
case dm.AqD112INVOICE_STATUS.Value of
1:
 begin

 end;
2:
 begin
  n2.Enabled:=false;
  n4.Enabled:=false;
 end;
3:
 begin
  n2.Enabled:=false;
  n4.Enabled:=false;
 end;
else
 begin
  n2.Enabled:=false;
  n3.Enabled:=false;
  n4.Enabled:=false;
  n26.Enabled:=false;
 end;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
{$IFDEF Release}
  if not app_init_2(dm.ADOConnection1) then
  begin
    showmsg('程序起动失败,请与管理员联系!',1);
    application.Terminate;
  end;
{$ENDIF}
{$IFDEF Debug}
  dm.ADOConnection1.Connected:= False;
  dm.ADOConnection1.Connected:= True;
  rkey73:='3';
  vprev:='4';
{$ENDIF}
  self.Caption:= application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

end.
