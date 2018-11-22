unit detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, Menus, Mask,Math, ExtCtrls;

type
  Tfm_detail = class(TForm)
    Label6: TLabel;
    Label7: TLabel;
    Edit2: TEdit;
    Label1: TLabel;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    Label2: TLabel;
    Edit4: TEdit;
    BitBtn2: TBitBtn;
    Label8: TLabel;
    Edit16: TEdit;
    SG1: TStringGrid;
    Label5: TLabel;
    btsave: TBitBtn;
    btcancel: TBitBtn;
    PM1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Label3: TLabel;
    assign_type: TComboBox;
    bt_note: TBitBtn;
    PM2: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Edit5: TEdit;
    BitBtn3: TBitBtn;
    Label18: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    bt_autoassign: TSpeedButton;
    Label19: TLabel;
    Edit15: TEdit;
    Label20: TLabel;
    Edit1: TEdit;
    Label21: TLabel;
    Edit17: TEdit;
    Label22: TLabel;
    Edit18: TEdit;
    Label23: TLabel;
    Edit19: TEdit;
    Label24: TLabel;
    Edit20: TEdit;
    Label25: TLabel;
    Edit21: TEdit;
    Label26: TLabel;
    Edit22: TEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label27: TLabel;
    Edit23: TEdit;
    Edit8: TEdit;
    Label11: TLabel;
    Edit24: TEdit;
    Label28: TLabel;
    Edit25: TEdit;
    Label29: TLabel;
    Edit26: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    Edit27: TEdit;
    Label32: TLabel;
    Edit28: TEdit;
    Label33: TLabel;
    Edit29: TEdit;
    Label34: TLabel;
    Edit30: TEdit;
    lbl1: TLabel;
    edtcustshipno: TEdit;
    btn1: TButton;
    cbx1: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit4Exit(Sender: TObject);
    procedure SG1KeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure PM1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure SG1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btsaveClick(Sender: TObject);
    procedure bt_noteClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bt_autoassignClick(Sender: TObject);
    procedure assign_typeChange(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit5KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit15KeyPress(Sender: TObject; var Key: Char);
    procedure PM2Popup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit15KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit29KeyPress(Sender: TObject; var Key: Char);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    re_number:string;  //重新编号时存储新编号
    find_so:string;   //输入的销售订单存储变量，供查找时加条件
    cust_ship:string;  //未付款发票超期不允许装运

    FsQty:string ;
    procedure get_ship_no;  //获取装运批号
    procedure re_count; //统计总出仓数量
    procedure assign_add(margin:integer);  //增加指派明细
    procedure save_new_data;  //保存新的指派信息
    function find_topso(rkey25,rkey60:integer):boolean;
    function check_error():boolean;
    procedure get_planrej_qty(rkey25:integer;so_no:string);
    function custinvoice_day(var in_number:string;cust_ptr: integer): boolean;
  public
    { Public declarations }
    v_modal:byte;  //v_modal模式:1新加/2编辑/3检查
//    user_ptr:string;//05指针
    rkey10,rkey25,rkey60:integer;
    normal_margin,return_margin,margin:integer; //正常欠数,退货欠数,最终欠数的变量
    orig_unit_weight:Double ;//原始单重
    procedure del_old_data;  //删除旧的指派信息
    procedure enter_detail;
    procedure get_qty_cust_order(rkey25,rkey97:integer);  //获取采购单合计数量
//    function check_stock(rkey25:integer):boolean;   //搜索盘点明细
  end;

var
  fm_detail: Tfm_detail;
  ship_note: tstringlist;

implementation
uses constvar,pick_item_single, damo,common, note, DB, stock_search, ADODB, ShowShipNoInfo;

{$R *.dfm}

procedure Tfm_detail.FormCreate(Sender: TObject);
begin
 ship_note:=tstringlist.Create;
 FsQty:='0';
end;

procedure Tfm_detail.FormShow(Sender: TObject);
begin
 sg1.Cells[0,0]:='工单号码';
 sg1.Cells[1,0]:='工厂';
 sg1.Cells[2,0]:='仓库';
 sg1.Cells[3,0]:='备注信息';
 sg1.Cells[4,0]:='可用数量';
 sg1.Cells[5,0]:='外协厂家';
 sg1.Cells[6,0]:='指派数量';
 sg1.Cells[7,0]:='库存53指针';
 sg1.Cells[8,0]:='原始出仓数量';
 sg1.ColWidths[7]:=-1;   //隐藏此指针列
 sg1.ColWidths[8]:=-1;   //隐藏此指针列
 find_so:='';
 ShowScrollBar(SG1.Handle,SB_VERT,true); //始终显示垂直滚动条
  with dm.aqtmp do
   begin
    close;
    sql.Text:='select top 1 custcoship from data0192';
    open;
    self.cust_ship:= trim(fieldbyname('custcoship').AsString);
   end;
   cbx1.Enabled := vprev = '4';
end;

procedure Tfm_detail.FormDestroy(Sender: TObject);
begin
 ship_note.Free;
end; 

procedure Tfm_detail.get_ship_no;
begin
 dm.aqtmp.Close;
 dm.aqtmp.SQL.Text:='select max(SHIPMENT_NO) as max_no from data0064 where so_ptr='+inttostr(rkey60);
 dm.aqtmp.Open;
 edit1.Text:=inttostr(dm.aqtmp.fieldbyname('max_no').AsInteger+1);
end;

procedure Tfm_detail.enter_detail;
var i:integer;
    old_ship:integer;
begin
 Edit1.Text:=dm.ADS64shipment_no.AsString;
 Edit2.Text:=dm.ADS64.fieldbyname('date_assign').AsString;
 Edit3.Text:=dm.ADS64cust_code.Value;
 label4.Caption:=dm.ADS64customer_name.Value;
 Edit4.Text:=dm.ADS64manu_part_number.Value;
 label5.Caption:=dm.ADS64manu_part_desc.Value;
 Edit5.Text:=dm.ADS64sales_order.Value;
 Edit6.Text:=dm.ADS64po_number.Value;
 Edit7.Text:=dm.ADS64ent_date.AsString;
 Edit9.Text:=dm.ADS64sch_date.AsString;
 Edit17.Text:=dm.ADS64po_date.AsString;
 Edit19.Text:=dm.ADS64shipping_method.Value;
 Edit23.Text:=dm.ADS64v_kind.Value;
 edit8.Text:=dm.ADS64v_type.Value;
 Edit28.Text:=dm.ADS64reference_number.Value;
 if dm.ADS64abbrname23.Value<>'' then
 edit8.Text:=edit8.Text+':'+dm.ADS64abbrname23.Value;
 Edit18.Text:=dm.ADS64location.Value;
 Edit16.Text:=dm.ADS64remark.Value;

 orig_unit_weight:=dm.ADS64report_unit_value1.AsFloat;
 Edit10.Text:=dm.ADS64parts_ordered.AsString;
 Edit13.Text:=dm.ADS64qty_on_hand.AsString;
 Edit14.Text:=dm.ADS64quan_shipped.AsString;
 FsQty:=Edit14.Text;
 edit26.Text:=dm.ADS64abbr_name.Value;
 edit27.Text:=dm.ads64set_qty.asstring;
 assign_type.ItemIndex:=dm.ads64assign_type.value;
 normal_margin:=dm.ADS64.fieldbyname('parts_ordered').AsInteger-dm.ADS64.fieldbyname('parts_shipped').AsInteger;
 return_margin:=dm.ADS64.fieldbyname('parts_returned').AsInteger-dm.ADS64.fieldbyname('returned_ship').AsInteger;
 Edit15.Text:=dm.ADS64REPORT_UNIT_VALUE1_1.asstring;
 Edit29.Text:=dm.ADS64cartons_no.AsString;
 Edit30.Text:=dm.ADS64REPUT_APPR_BY.AsString;//订单已提交入库数量
 assign_typeChange(assign_type);
 rkey10:=dm.ADS64CUSTOMER_PTR.Value;
 rkey25:=dm.ADS64rkey25.Value;
 rkey60:=dm.ADS64rkey60.Value;
 self.get_planrej_qty(rkey25,trim(edit5.Text));  //更新投产报废数量
 edtcustshipno.Text := dm.ADS64.fieldbyname('custshipno').AsString;

 Edit3.Enabled:=false;
 Edit4.Enabled:=false;
 Edit5.Enabled:=false;
 BitBtn1.Enabled:=false;
 BitBtn2.Enabled:=false;
 BitBtn3.Enabled:=false;
 assign_type.Enabled:=false;
// old_ship:=0;
 with dm.aqtmp do
 begin
  close;
  sql.Text:='SELECT D06.WORK_ORDER_NUMBER as wo_number,D15.ABBR_NAME as whouse,'+
   'd16.location,D53.REFERENCE_NUMBER as place,D53.qty_on_hand-D53.qty_alloc as qty_aval,'+
   'd52.quan_shp,d53.RKEY,D23.ABBR_NAME '+
   'FROM Data0052 d52 inner join Data0053 d53 on d52.data0053_ptr=d53.rkey '+
   'inner join Data0015 d15 on D53.WHSE_PTR=D15.RKEY '+
   'inner join Data0016 d16 on D53.LOC_PTR=D16.RKEY '+
   'left outer join Data0006 d06 on D53.WORK_ORDER_PTR=D06.RKEY '+
   'left outer join Data0060 d60 on D53.barcode_ptr=D60.RKEY '+
   'left outer join Data0023 d23 on D60.supplier_ptr=D23.RKEY '+
   'WHERE D52.so_shp_ptr='+dm.ADS64rkey.AsString+
   ' Order by D52.rkey ';
  open;
  while not Eof do
  begin
   sg1.Cells[0,sg1.RowCount-1]:=Fieldbyname('wo_number').AsString;
   sg1.Cells[1,sg1.RowCount-1]:=FieldValues['whouse'];
   sg1.Cells[2,sg1.RowCount-1]:=FieldValues['location'];
   sg1.Cells[3,sg1.RowCount-1]:=FieldValues['place'];
   if dm.aqtmp.FieldByName('abbr_name').Value<>null then
   sg1.Cells[5,sg1.RowCount-1]:=FieldValues['ABBR_NAME'];
   sg1.Cells[6,sg1.RowCount-1]:=Fieldbyname('quan_shp').AsString;
   sg1.Cells[7,sg1.RowCount-1]:=Fieldbyname('RKEY').AsString; //库存rkey53
   sg1.Cells[8,sg1.RowCount-1]:=Fieldbyname('quan_shp').AsString;
   //填入库存待分配仓数量
   sg1.Cells[4,sg1.RowCount-1]:=inttostr(FieldValues['qty_aval']+fieldvalues['quan_shp']);
   sg1.RowCount:=sg1.RowCount+1;
   next;
  end;   //插入指派明细到表格里

  sql.Text:='select * from data0011 where source_type=64 and file_pointer='+dm.ADS64rkey.AsString;
  open;
  if not isempty then //插入记事本
   for i:=1 to 4 do
    ship_note.Add(fieldbyname('note_pad_line_'+inttostr(i)).AsString);
 end;
 old_ship:=dm.ADS64quan_shipped.Value;      //本次指派数量
 Edit11.Text:=inttostr(dm.ADS64total_shipped.AsInteger-old_ship);
 Edit12.Text:=inttostr(dm.ADS64parts_margin.AsInteger+old_ship);
 get_qty_cust_order(dm.ADS64rkey25.Value,dm.ADS64rkey97.Value);
 Edit21.Text:=inttostr(strtoint(Edit21.Text)-old_ship);
 Edit22.Text:=inttostr(strtoint(Edit22.Text)+old_ship);
 margin:=margin+old_ship;

end;

procedure Tfm_detail.get_qty_cust_order(rkey25,rkey97:integer);
begin
 dm.aqtmp.Close;
 dm.aqtmp.SQL.Text:='select sum(parts_ordered) as parts_total,'+
   'sum(parts_shipped-parts_returned+returned_ship) as ship_total from data0060 '+
   'where cust_part_ptr='+inttostr(rkey25)+' and purchase_order_ptr='+inttostr(rkey97);
 dm.aqtmp.Open;
 edit20.Text:=inttostr(dm.aqtmp.FieldValues['parts_total']);
 edit21.Text:=inttostr(dm.aqtmp.FieldValues['ship_total']);
 edit22.Text:=inttostr(dm.aqtmp.FieldValues['parts_total']-dm.aqtmp.FieldValues['ship_total']);
end;

procedure tfm_detail.re_count; //统计总出仓数量
var sum:integer;
    i:integer;
begin
 sum:=0;
 for i:=1 to sg1.RowCount-2 do
  if trim(sg1.Cells[6,i])<>'' then
   sum:=sum+strtoint(sg1.Cells[6,i]);
 edit14.Text:=inttostr(sum);
end;

procedure Tfm_detail.assign_add(margin:integer);
begin
 with dm.aqtmp do
 begin
  sg1.Cells[0,sg1.RowCount-1]:=Fieldbyname('wo_number').AsString;
  sg1.Cells[1,sg1.RowCount-1]:=FieldValues['whouse'];
  sg1.Cells[2,sg1.RowCount-1]:=FieldValues['location'];
  sg1.Cells[3,sg1.RowCount-1]:=FieldValues['place'];
  sg1.Cells[4,sg1.RowCount-1]:=Fieldbyname('QTY_AVAL').AsString;
  sg1.Cells[5,sg1.RowCount-1]:=Fieldbyname('ABBR_NAME').AsString;
  sg1.Cells[7,sg1.RowCount-1]:=Fieldbyname('RKEY').AsString; //库存rkey53
  sg1.Cells[8,sg1.RowCount-1]:='0';  //原始分配数量
  if fieldvalues['qty_aval']>margin-strtoint(edit14.Text) then
   sg1.Cells[6,sg1.RowCount-1]:=inttostr(margin-strtoint(edit14.Text))
  else sg1.Cells[6,sg1.RowCount-1]:=Fieldbyname('QTY_AVAL').AsString;
  sg1.RowCount:=sg1.RowCount+1;
  re_count;
  if edit5.Enabled=true then
  begin
   edit3.Enabled:=false;
   edit4.Enabled:=false;
   edit5.Enabled:=false;
   bitbtn1.Enabled:=false;
   bitbtn2.Enabled:=false;
   bitbtn3.Enabled:=false;
  end;
  if assign_type.Enabled=true then assign_type.Enabled:=false;
 end;
end;

procedure Tfm_detail.del_old_data;
begin
 with dm.aqtmp do
 begin
  close;
  sql.Text:='delete data0011 where source_type=64 and file_pointer='+dm.ADS64rkey.AsString;
  ExecSQL;  //删除装运记事本

  sql.Text:='update data0053 set qty_on_hand=qty_on_hand+data0052.quan_shp '+
    'from data0052 inner join data0053 on data0052.data0053_ptr=data0053.rkey '+
    'where data0052.so_shp_ptr='+dm.ADS64rkey.AsString;
  ExecSQL; //更新成品库存数量

  sql.Text:='update data0025 set qty_on_hand=qty_on_hand+Data0064.QUAN_SHIPPED '+
    'FROM Data0064 INNER JOIN Data0060 ON Data0064.SO_PTR = Data0060.RKEY '+
    'INNER JOIN Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY '+
    'where data0064.rkey='+dm.ADS64rkey.AsString;
  Execsql;  //更新产品表内的库存数量

  if dm.ADS64assign_type.Value=0 then
   sql.Text:='update data0060 set parts_shipped=parts_shipped-'+dm.ADS64quan_shipped.AsString+
     ' where rkey='+dm.ADS64rkey60.AsString
  else
   sql.Text:='update data0060 set returned_ship=returned_ship-'+dm.ADS64quan_shipped.AsString+
     ' where rkey='+dm.ADS64rkey60.AsString;
  execsql; //更新订单表内的已装运数量

  sql.Text:='update data0060 set STATUS=1,SO_ACK_PRINT_DATE=null where rkey='+dm.ADS64rkey60.AsString;
  execsql;  // 更新订单状态

  sql.Text:='delete data0052 where so_shp_ptr='+dm.ADS64rkey.AsString;
  execsql; //删除装运指派明细
 end;
end;

procedure Tfm_detail.save_new_data;
var i:integer;
begin
 with dm.aqtmp do
 begin
  for i:=1 to sg1.RowCount-2 do  //更新产品库存信息53表,并插入指派明细数量d52表
  begin
   close;
   sql.Text:='update data0053 set qty_on_hand=qty_on_hand-'+sg1.Cells[6,i]+' where rkey='+sg1.Cells[7,i];
   execsql;
   sql.Text:='insert data0052(data0053_ptr,so_shp_ptr,quan_shp) '+
     'values('+sg1.Cells[7,i]+','+dm.AQ64rkey.AsString+','+sg1.Cells[6,i]+')';
   execsql;
  end;

  if trim(ship_note.Text)<>'' then //新增装运备注信息11
  begin
   for i:=ship_note.Count+1 to 4 do ship_note.Add('');
   sql.Text:='insert data0011(file_pointer,source_type,NOTE_PAD_LINE_1,NOTE_PAD_LINE_2,'+
     'NOTE_PAD_LINE_3,NOTE_PAD_LINE_4) values('+dm.AQ64RKEY.AsString+',64,'+
     ''''+ship_note.Strings[0]+''','''+ship_note.Strings[1]+''','''+ship_note.Strings[2]+''','+
     ''''+ship_note.Strings[3]+''')';
   execsql;
  end;

  sql.Text:='update data0025 set qty_on_hand=qty_on_hand-'+edit14.Text+' where rkey='+inttostr(rkey25);
  execsql;  //更新产品库存数量25表

  if assign_type.ItemIndex=0 then  //更新订单已装运数量60表
   sql.Text:='update data0060 set parts_shipped=parts_shipped+'+edit14.Text+' where rkey='+inttostr(rkey60)
  else
   sql.Text:='update data0060 set returned_ship=returned_ship+'+edit14.Text+' where rkey='+inttostr(rkey60);
  execsql;

  sql.Text:='select PARTS_ORDERED+parts_returned-parts_shipped-returned_ship as parts_marjin '+
            'from data0060 where rkey='+inttostr(rkey60);
  open;
  if dm.aqtmp.FieldValues['parts_marjin'] <= 0 then     //订单指派完成,更新完成指派时间
   begin
    sql.Text:='update data0060 set STATUS=4,SO_ACK_PRINT_DATE='+quotedstr(formatdatetime('yyyy-mm-dd HH:mm:ss',dm.AQ64DATE_ASSIGN.Value))+
              ' where rkey='+inttostr(rkey60);
    execsql;
   end;

//更新产品的单位重量25表
  //ShowMessage(FloatToStr(orig_unit_weight)+' '+edit15.Text);
  if Abs(StrToFloat(edit15.text)-orig_unit_weight)>0.000001 then
  begin
    sql.Text:='update data0025 set report_unit_value1='+edit15.Text+' where rkey='+inttostr(rkey25);
    execsql;
    dm.aqtmp.SQL.Text:='INSERT INTO Data0318 '+#13+
                         '       (CUSTOMER_PART_PTR, TRANS_TYPE, TRANS_DESCRIPTION, FROM_STRING, '+
                         '        TO_STRING, USER_PTR, TRANS_DATE, PROGRAM_SOURCE) '+#13+
                         'VALUES ('+inttostr(rkey25)+', 25, ''变更产品单重'','''+
                         floattostr(Orig_Unit_Weight)+''', '''+edit15.Text+''', '+rkey73+', GETDATE(), 22)';
    execsql;
  end;
 end;
end;

function Tfm_detail.find_topso(rkey25,rkey60: integer): boolean;
begin
 with dm.aqtmp do
 begin
  close;
  sql.Text:='SELECT TOP 1 rkey FROM Data0060 WHERE STATUS = 1 '+
    'AND data0060.PROD_REL <> ''1'''+' and CUST_PART_PTR='+inttostr(rkey25)+
    ' AND PARTS_ORDERED-parts_shipped+PARTS_RETURNED-RETURNED_SHIP > 0 ORDER BY SCH_DATE,SALES_ORDER';
  open;
  if not IsEmpty then
   if fieldvalues['rkey']=rkey60 then
    result:=false
   else
    result:=true
  else
  result:=false;
 end;
end;



procedure Tfm_detail.BitBtn1Click(Sender: TObject);
var inputvar: PDlgInput; //搜索
begin
 frmpick_item_single:=Tfrmpick_item_single.Create(application);
 try
  case (sender as Tbitbtn).Tag of
  1:
  begin
   inputvar.Fields:='cust_code/客户代码/130,customer_name/客户名称/240';
   inputvar.Sqlstr:='select rkey,cust_code,customer_name from data0010 order by cust_code';
   inputvar.KeyField:='cust_code';
   inputvar.InPut_value:=edit3.Text;
  end;
  2:
  begin
   inputvar.Fields:='manu_part_number/本厂编号/130,manu_part_desc/客户型号/240,set_qty/交货单元数/50';
   if rkey10=0 then
    inputvar.Sqlstr:='select d25.rkey,d25.manu_part_number,d25.manu_part_desc,d25.set_qty, '+
      'd10.rkey as rkey10,d10.cust_code,d10.customer_name,d25.REPORT_UNIT_VALUE1 '+
      'from data0025 d25 inner join data0010 d10 on d25.customer_ptr=d10.rkey '+
      'where parent_ptr is null order by manu_part_number'
   else inputvar.Sqlstr:='select rkey,manu_part_number,manu_part_desc,REPORT_UNIT_VALUE1,set_qty from data0025 '+
    'where parent_ptr is null and customer_ptr='+inttostr(rkey10)+' order by manu_part_number';
   inputvar.KeyField:='manu_part_number';
   inputvar.InPut_value:=edit4.Text;
  end;
  3:
  begin
   inputvar.Fields:='sales_order/销售订单/70,sch_date/回复交期/80,cust_code/客户代码/50,manu_part_number/本厂编号/80,'+
     'manu_part_desc/客户型号/90,parts_margin/订单欠数/60,po_number/客户订单号/120,ANALYSIS_CODE_2/客户物料号/90,set_qty/交货单元数/70,parts_ordered/订单数量/60,total_shipped/装运数量/60,'+
     'REPUT_APPR_BY/提交入库/60,v_type/加工形式/40,abbrname23/供应商/50,'+
     'reference_number/订单参考/120,ABBR_NAME/工厂/50,STATUS60/订单状态/60';

   inputvar.Sqlstr:='select d25.rkey,d25.manu_part_number,d25.manu_part_desc,d25.report_unit_value1,'+
     'd25.qty_on_hand,d97.po_number,d97.po_date,d12.location,d60.rkey as rkey60,d60.purchase_order_ptr,'+
     'd60.shipping_method,d60.sales_order,d60.ent_date,d60.sch_date,d60.reference_number,'+
     'case d60.commision_on_tooling when ''Y'' then ''转厂'' else ''内销'' end as v_kind,'+
     'case D60.so_tp WHEN 0 THEN ''自制'' WHEN 1 THEN ''外发'' WHEN 2 THEN ''半制程'' end as v_type,'+
     'D60.PARTS_ALLOC as part_price,D60.state_prod_tax_flag,D60.state_tool_tax_flag,D60.discount,D60.rush_charge,'+
     'd60.parts_ordered,d60.parts_shipped,d60.parts_returned,d60.returned_ship,d60.REPUT_APPR_BY,'+
     'D60.parts_shipped+D60.returned_ship-D60.parts_returned as total_shipped,'+
     'D60.parts_ordered-D60.parts_shipped+D60.parts_returned-D60.returned_ship as parts_margin,'+
     'd10.rkey as rkey10,d10.cust_code,d10.customer_name,d15.ABBR_NAME,d25.set_qty, '+
     'data0023.abbr_name as abbrname23 , case d60.STATUS when 1 then ''有效'' '+
     'when 2 then ''暂缓'' when 3 then ''关闭'' end as STATUS60  ,d25.ANALYSIS_CODE_2 '+
     'from data0060 d60 inner join data0025 d25 on d60.cust_part_ptr=d25.rkey '+
     'inner join data0010 d10 on d60.customer_ptr=d10.rkey '+
     'inner join data0097 d97 on d60.purchase_order_ptr=d97.rkey '+
     'inner join data0012 d12 on d60.cust_ship_addr_ptr=d12.rkey '+
     'inner join data0015 d15 on d60.SHIP_REG_TAX_ID=d15.rkey '+
     'LEFT OUTER JOIN Data0023 ON d60.supplier_ptr = Data0023.RKEY '+
     'where d60.status in (1 , 2) and d60.prod_rel<>1 ';   //后补的订单不允许指派出货
   if rkey25<>0 then
    inputvar.Sqlstr:=inputvar.Sqlstr+' and d60.cust_part_ptr='+inttostr(rkey25)
   else
    if rkey10<>0 then
     inputvar.Sqlstr:=inputvar.Sqlstr+' and d60.customer_ptr='+inttostr(rkey10);
   if find_so<>'' then
     inputvar.Sqlstr:=inputvar.Sqlstr+' and d60.sales_order='''+find_so+'''';
   inputvar.Sqlstr:=inputvar.Sqlstr+' order by d60.sales_order ';
   //showmessage(inputvar.Sqlstr);
   inputvar.KeyField:='sales_order';
   inputvar.InPut_value:=edit5.Text;
  end;
  end; //end case
  inputvar.AdoConn:=dm.ADOConnection1;
  frmpick_item_single.InitForm_New(inputvar);
  if (find_so<>'') and (frmpick_item_single.adsPick.IsEmpty) then
  begin
   showmessage('您输入的销售订单不存在，请重新输入！');
   edit5.SetFocus;
   exit;
  end;
  if find_so='' then
   frmpick_item_single.ShowModal
  else
   frmpick_item_single.ModalResult:=mrok;
  if (frmpick_item_single.ModalResult=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
  with frmpick_item_single.adsPick do
   case (sender as Tbitbtn).Tag of
   1:
   begin
    edit3.Text:=trim(FieldValues['cust_code']);
    label4.Caption:=trim(FieldValues['customer_name']);
    rkey10:=FieldValues['rkey'];
   end;
  2:
  begin
   edit4.Text:=trim(FieldValues['manu_part_number']);
   label5.Caption:=trim(FieldValues['manu_part_desc']);
   edit15.Text:=fieldbyname('REPORT_UNIT_VALUE1').AsString;
   edit27.Text:=fieldbyname('set_qty').AsString;
   rkey25:=FieldValues['rkey'];
   if rkey10=0 then
   begin
    edit3.Text:=trim(FieldValues['cust_code']);
    label4.Caption:=trim(FieldValues['customer_name']);
    rkey10:=FieldValues['rkey10'];
   end;
  end;
  3:
  begin

   if pos('后补',Fieldbyname('po_number').AsString)>0 then
    begin
      showmsg('后补客户订单号不允许出货,请与市场部联系!',1);
      edit5.SetFocus;
      exit;
    end;

    if  (Fieldbyname('STATUS60').AsString = '暂缓') then
    begin
      showmsg('订单为暂缓状态,不可以选择,请与市场部联系!',1);
      edit5.SetFocus;
      exit
    end;

    if   (Fieldbyname('STATUS60').AsString = '关闭') then
    begin
       showmsg('订单为关闭状态,不可以选择,请与市场部联系!',1);
       edit5.SetFocus;
       exit
    end;

   if find_topso(FieldValues['rkey'],FieldValues['rkey60']) then
    if messagedlg('指派出货未按订单交期的先后顺序，是否继续？',mtconfirmation,[mbyes,mbno],0)=mrno then
     begin
      edit5.SetFocus;
      exit;
     end;

   normal_margin:=FieldValues['parts_ordered']-FieldValues['parts_shipped'];
   return_margin:=FieldValues['parts_returned']-FieldValues['returned_ship'];
   edit5.Text:=fieldbyname('sales_order').asstring;
   edit6.Text:=fieldbyname('po_number').asstring;
   edit7.Text:=fieldbyname('ent_date').asstring;
   edit9.Text:=fieldbyname('sch_date').asstring;
   edit10.Text:=fieldbyname('parts_ordered').asstring;
   edit11.Text:=fieldbyname('total_shipped').asstring;//总共装运数
   edit12.Text:=fieldbyname('parts_margin').asstring;//总欠数
   edit13.Text:=fieldbyname('qty_on_hand').asstring;
   edit15.Text:=fieldbyname('report_unit_value1').asstring;
   orig_unit_weight:=fieldbyname('report_unit_value1').AsFloat;
   edit17.Text:=fieldbyname('po_date').asstring;
   edit19.Text:=fieldbyname('shipping_method').asstring;
   edit18.Text:=fieldbyname('location').asstring;
   edit23.Text:=fieldbyname('v_kind').asstring;     //内销,转厂
   edit8.Text:= fieldbyname('v_type').asstring;     //加工形式
   Edit28.Text:=fieldbyname('reference_number').asstring;
   if fieldbyname('abbrname23').AsString<>'' then
    edit8.Text:=edit8.Text+':'+fieldbyname('abbrname23').asstring;

   edit26.Text:=fieldbyname('abbr_name').asstring;  //工厂
   edit27.Text:=fieldbyname('set_qty').AsString;
   Edit30.Text:=fieldbyname('REPUT_APPR_BY').AsString;    //已提交入库
   rkey60:=fieldbyname('rkey60').AsInteger;
   dm.AQ64part_price.Value:=fieldbyname('part_price').AsFloat;              //不含税价格
   dm.AQ64prod_tax_flag.Value :=fieldbyname('state_prod_tax_flag').asstring; //产品征税
   dm.AQ64tool_tax_flag.Value :=fieldbyname('state_tool_tax_flag').asstring; //工具征税
   dm.AQ64discount.Value :=fieldbyname('discount').AsFloat;                 //折扣
   dm.AQ64TAX_2.Value:=fieldbyname('rush_charge').AsFloat;                  //增值税

   if rkey25=0 then
   begin
    edit4.Text:=trim(fieldbyname('manu_part_number').asstring);
    label5.Caption:=trim(fieldbyname('manu_part_desc').asstring);
    rkey25:=fieldbyname('rkey').AsInteger;
   end;
   if rkey10=0 then
   begin
    edit3.Text:=trim(fieldbyname('cust_code').asstring);
    label4.Caption:=trim(fieldbyname('customer_name').asstring);
    rkey10:=fieldbyname('rkey10').AsInteger;
   end;
   get_ship_no;
   get_qty_cust_order(rkey25,fieldbyname('purchase_order_ptr').AsInteger);
   if normal_margin<=0 then  //正常欠数小于等于零则自动选择为退货欠数
   begin
    assign_type.ItemIndex:=1;
    assign_type.Enabled:=false;
   end
   else
   if return_margin<=0 then  //退货欠数小于等于零则自动选择为正常欠数
    begin
     assign_type.ItemIndex:=0;
     assign_type.Enabled:=false;
    end
   else
    assign_type.Enabled:=true; //正常欠数,退货欠数都大于零则手工选择
    
   assign_typeChange(sender);
   self.get_planrej_qty(rkey25,trim(edit5.Text));
   bt_autoassign.Enabled:=true;
  end;
  end; //end case
 finally
  find_so:='';
  frmpick_item_single.adsPick.Close;
  frmpick_item_single.Free;
 end;  //end try
end;

procedure Tfm_detail.Edit3Exit(Sender: TObject);
begin
 if (trim(edit3.Text)<>'') then  //(activecontrol.Name<>'BitBtn1') and
 begin
  dm.aqtmp.Close;
  dm.aqtmp.SQL.Text:='select rkey,customer_name from data0010 where cust_code='''+edit3.Text+'''';
  dm.aqtmp.Open;
  if not dm.aqtmp.IsEmpty then
  begin
   if rkey10<>dm.aqtmp.FieldValues['rkey'] then
   begin
    label4.Caption:=dm.aqtmp.FieldValues['customer_name'];
    rkey10:=dm.aqtmp.FieldValues['rkey'];
    edit4.Text:='';
    label5.Caption:='';
    rkey25:=0;
   end;
  end
  else begin
   showmessage('您输入的客户代码不存在，请重新输入！');
   edit3.SetFocus;
  end;
 end
 else begin
  label4.Caption:='';
  rkey10:=0;
  edit4.Text:='';
  label5.Caption:='';
  rkey25:=0;
  edit4Exit(sender);
 end;
end;

procedure Tfm_detail.Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if key=13 then edit4.SetFocus;
end;

procedure Tfm_detail.Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if key=13 then edit5.SetFocus;
end;

procedure Tfm_detail.Edit5KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if key=13 then edit16.SetFocus;
end;

procedure Tfm_detail.Edit4Exit(Sender: TObject);
begin
 if (trim(edit4.Text)<>'') then   //(activecontrol.Name<>'BitBtn2') and
 begin
  dm.aqtmp.Close;
  if rkey10=0 then
   dm.aqtmp.SQL.Text:='select d25.rkey,d25.manu_part_number,d25.manu_part_desc,'+
     'd10.rkey as rkey10,d10.cust_code,d10.customer_name,d25.REPORT_UNIT_VALUE1 '+
     'from data0025 d25 inner join data0010 d10 on d25.customer_ptr=d10.rkey '+
     'where parent_ptr is null  and manu_part_number='''+edit4.Text+''''
  else dm.aqtmp.SQL.Text:='select rkey,manu_part_desc,REPORT_UNIT_VALUE1 from data0025 '+
    'where parent_ptr is null and customer_ptr='+inttostr(rkey10)+
    ' and manu_part_number='''+edit4.Text+'''';
  dm.aqtmp.Open;
  if not dm.aqtmp.IsEmpty then
  begin
   if rkey25<>dm.aqtmp.FieldValues['rkey'] then
   begin
    label5.Caption:=dm.aqtmp.FieldValues['manu_part_desc'];
    Edit15.Text:=dm.aqtmp.Fieldbyname('REPORT_UNIT_VALUE1').AsString;
    rkey25:=dm.aqtmp.FieldValues['rkey'];
    edit5.Text:='';
    edit5Exit(sender);
    if rkey10=0 then
    begin
     edit3.Text:=trim(dm.aqtmp.FieldValues['cust_code']);
     label4.Caption:=trim(dm.aqtmp.FieldValues['customer_name']);
     Edit15.Text:=dm.aqtmp.Fieldbyname('REPORT_UNIT_VALUE1').AsString;
     rkey10:=dm.aqtmp.FieldValues['rkey10'];
    end;
   end;
  end
  else begin
   showmessage('您输入的本厂编号不存在，请重新输入！');
   edit4.SetFocus;
  end;
 end
 else begin
  edit4.Text:='';
  label5.Caption:='';
  rkey25:=0;
  edit5.Text:='';
  edit5Exit(sender);
 end;
end;

procedure Tfm_detail.Edit5Exit(Sender: TObject);
begin     
 find_so:=edit5.Text;
 if (edit5.Text<>'') and (activecontrol.Name<>'btcancel') then  //and (activecontrol.Name<>'BitBtn3')
  bitbtn1Click(BitBtn3)
 else
 if edit5.Text='' then
  begin
   normal_margin:=0;
   return_margin:=0;
   edit1.Text:='';
   edit5.Text:='';
   edit6.Text:='';
   edit7.Text:='';
   edit9.Text:='';
   edit10.Text:='';
   edit11.Text:='';//总共装运数
   edit12.Text:='';//总欠数
   edit15.Text:='';
   edit17.Text:='';
   edit19.Text:='';
   edit18.Text:='';
   edit13.Text:='';
   edit20.Text:='';
   edit21.Text:='';
   edit22.Text:='';
   edit23.Text:='';
   edit28.Text:='';
   rkey60:=0;
   bt_autoassign.Enabled:=false;
  end;
end;

procedure Tfm_detail.PM1Popup(Sender: TObject);
begin
 if (sg1.Row=0) or (sg1.Row=sg1.RowCount-1) then n2.Enabled:=false
 else n2.Enabled:=true;  
 if (rkey25<=0) or (rkey60<=0) or (margin-strtoint(edit14.Text)<=0) then
   n1.Enabled:=false
 else n1.Enabled:=true;
end;

procedure Tfm_detail.N1Click(Sender: TObject);
var //inputvar: PDlgInput; //搜索
    s1:string;  //s1为要排除的库存，s2为删除了的要显示的库存
    i:integer;
begin
 s1:='';
 if sg1.RowCount>2 then
 begin
  for i:=1 to sg1.RowCount-2 do
   s1:=s1+sg1.Cells[7,i]+',';
  delete(s1,length(s1),1); //删除最后一位','
  s1:=' and d53.rkey not in ('+s1+') ';
 end;
 Form_Stock:=TForm_Stock.Create(Application);
  try
   Form_Stock.aqInvent.Close;
   Form_Stock.aqInvent.SQL.Clear;
   Form_Stock.aqInvent.SQL.Text:='SELECT Cast(0 as tinyint) as IsSelected,d53.RKEY,D15.ABBR_NAME as whouse,d16.location,'+
    'D06.WORK_ORDER_NUMBER as wo_number,D53.REFERENCE_NUMBER as place,D53.MFG_DATE,'+
    'D53.QTY_ON_HAND-D53.QTY_ALLOC as QTY_AVAIL,D06.RKEY as D06RKEY,d53.NPAD_PTR,D23.ABBR_NAME AS abbr23 '+
    'FROM Data0053 d53 inner join Data0015 d15 on D53.WHSE_PTR=D15.RKEY '+
    'inner join Data0016 d16 on D53.LOC_PTR=D16.RKEY '+
    'left outer join Data0006 d06 on D53.WORK_ORDER_PTR=D06.RKEY '+
    'inner join Data0025 d25 on D53.CUST_PART_PTR=D25.rkey '+
    'inner join Data0416 D416 on D53.NPAD_PTR=D416.rkey '+
    'left outer join Data0060 D60 on D416.so_ptr=D60.rkey '+
    'left outer join Data0023 D23 on D60.supplier_ptr=D23.rkey '+
    'WHERE (D53.QTY_ON_HAND - D53.QTY_ALLOC > 0) and d16.allow_putout=1'+
    ' and D53.CUST_PART_PTR='+inttostr(rkey25)+s1+
    ' Order by D53.MFG_DATE ';
    Form_Stock.aqInvent.Open;
   if (Form_Stock.ShowModal=mrok) and (not Form_Stock.cdsInvent.IsEmpty) then
    begin
     with Form_Stock do
     begin
       cdsInvent.First;
      while not cdsInvent.Eof do
      begin
       if cdsInventIsSelected.Value=1 then
       begin
       sg1.Cells[0,sg1.RowCount-1]:=cdsInventwo_number.AsString;
       sg1.Cells[1,sg1.RowCount-1]:=cdsInventwhouse.AsString;
       sg1.Cells[2,sg1.RowCount-1]:=cdsInventlocation.AsString;
       sg1.Cells[3,sg1.RowCount-1]:=cdsInventplace.AsString;
       sg1.Cells[4,sg1.RowCount-1]:=cdsInventQTY_AVAIL.AsString;
       sg1.Cells[5,sg1.RowCount-1]:=cdsInventabbr23.AsString;
       sg1.Cells[7,sg1.RowCount-1]:=cdsInventRKEY.AsString; //库存rkey53
       sg1.Cells[8,sg1.RowCount-1]:='0';
        if cdsInventQTY_AVAIL.AsInteger>margin-strtoint(edit14.Text) then
        sg1.Cells[6,sg1.RowCount-1]:=inttostr(margin-strtoint(edit14.Text))
        else sg1.Cells[6,sg1.RowCount-1]:=cdsInventQTY_AVAIL.AsString;
        sg1.RowCount:=sg1.RowCount+1;
        sg1.Row:=sg1.RowCount-2;
        re_count;
        if StrToInt(Edit14.Text)=StrToInt(Edit12.Text) then
        Break;
       end;
       cdsInvent.Next;
      end;
     end;
     if edit5.Enabled=true then
     begin
      edit3.Enabled:=false;
      edit4.Enabled:=false;
      edit5.Enabled:=false;
      bitbtn1.Enabled:=false;
      bitbtn2.Enabled:=false;
      bitbtn3.Enabled:=false;
     end;
    end;
  finally
    Form_Stock.cdsInvent.Close;
    Form_Stock.Free;
  end;
 {
 frmpick_item_single:=Tfrmpick_item_single.Create(application);
 try
  inputvar.Fields:='whouse/工厂/80,location/仓库/80,wo_number/工单号码/135,'+
    'place/备注信息/80,MFG_DATE/制造日期/140,QTY_AVAIL/数量/80';
  inputvar.Sqlstr:='SELECT d53.RKEY,D15.ABBR_NAME as whouse,d16.location,'+
    'D06.WORK_ORDER_NUMBER as wo_number,D53.REFERENCE_NUMBER as place,D53.MFG_DATE,'+
    'D53.QTY_ON_HAND-D53.QTY_ALLOC as QTY_AVAIL '+    //,D06.RKEY as D06RKEY
    'FROM Data0053 d53 inner join Data0015 d15 on D53.WHSE_PTR=D15.RKEY '+
    'inner join Data0016 d16 on D53.LOC_PTR=D16.RKEY '+
    'left outer join Data0006 d06 on D53.WORK_ORDER_PTR=D06.RKEY '+
    'WHERE (D53.QTY_ON_HAND - D53.QTY_ALLOC > 0)'+
    ' and D53.CUST_PART_PTR='+inttostr(rkey25)+s1+
    ' Order by D53.MFG_DATE ';
  inputvar.AdoConn:=dm.ADOConnection1;
  frmpick_item_single.InitForm_New(inputvar);
  if (frmpick_item_single.ShowModal=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
  with frmpick_item_single.adsPick do
  begin
   sg1.Cells[0,sg1.RowCount-1]:=Fieldbyname('wo_number').AsString;
   sg1.Cells[1,sg1.RowCount-1]:=FieldValues['whouse'];
   sg1.Cells[2,sg1.RowCount-1]:=FieldValues['location'];
   sg1.Cells[3,sg1.RowCount-1]:=FieldValues['place'];
   sg1.Cells[4,sg1.RowCount-1]:=Fieldbyname('QTY_AVAIL').AsString;
   sg1.Cells[6,sg1.RowCount-1]:=Fieldbyname('RKEY').AsString; //库存rkey53
   sg1.Cells[7,sg1.RowCount-1]:='0';
   if Fieldbyname('QTY_AVAIL').AsInteger>margin-strtoint(edit14.Text) then
    sg1.Cells[5,sg1.RowCount-1]:=inttostr(margin-strtoint(edit14.Text))
   else sg1.Cells[5,sg1.RowCount-1]:=Fieldbyname('QTY_AVAIL').AsString;
   sg1.RowCount:=sg1.RowCount+1;
   sg1.Row:=sg1.RowCount-2;
   re_count;
   if edit5.Enabled=true then
   begin
    edit3.Enabled:=false;
    edit4.Enabled:=false;
    edit5.Enabled:=false;
    bitbtn1.Enabled:=false;
    bitbtn2.Enabled:=false;
    bitbtn3.Enabled:=false;
   end;
   if assign_type.Enabled=true then assign_type.Enabled:=false;
  end;
 finally
  frmpick_item_single.adsPick.Close;
  frmpick_item_single.Free;
 end; }
end;

procedure Tfm_detail.N2Click(Sender: TObject);
var i,j:integer;
begin
 for i:=sg1.Row to sg1.RowCount-3 do
  for j:=0 to 8 do
   sg1.Cells[j,i]:=sg1.Cells[j,i+1];
 sg1.Rows[sg1.RowCount-2].Clear;
 sg1.RowCount:=sg1.RowCount-1;
 re_count;
 if (sg1.RowCount=2) and (v_modal=1) then //如果是新增模式且全部明细被删除
 begin
  edit3.Enabled:=true;
  edit4.Enabled:=true;
  edit5.Enabled:=true;
  bitbtn1.Enabled:=true;
  bitbtn2.Enabled:=true;
  bitbtn3.Enabled:=true;
  if (normal_margin>0) and (return_margin>0) then
   assign_type.Enabled:=true;
 end;
end;

procedure Tfm_detail.SG1KeyPress(Sender: TObject; var Key: Char);
begin //只有出仓数量和备注列允许输入，数量只允许输入数字
 if ((sg1.Col<>6) and (sg1.Col<>7)) or (sg1.RowCount<=2) or (sg1.Row>=sg1.RowCount-1) then abort;
 if (sg1.col=6) and (not (key in ['0'..'9',#8])) then abort;
end;

procedure Tfm_detail.SG1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (sg1.Row<=sg1.RowCount-2) and (sg1.Cells[6,sg1.row]='') then sg1.Cells[6,sg1.row]:='0';
 if (sg1.Row<=sg1.RowCount-2) and (strtoint(sg1.Cells[6,sg1.row])>strtoint(sg1.Cells[4,sg1.row])) then
  sg1.Cells[6,sg1.row]:=sg1.Cells[4,sg1.row];
 re_count;
end; 

procedure Tfm_detail.bt_noteClick(Sender: TObject);
begin
 pm2.Popup(mouse.CursorPos.X,mouse.CursorPos.Y);
end;

procedure Tfm_detail.N3Click(Sender: TObject);
var i:integer;
begin
 try
  fm_note := tfm_note.Create(application);
  with dm.aqtmp do
  begin
   close;
   case (sender as Tmenuitem).Tag of
   1:
   begin
    fm_note.Caption := '销售订单记事本:'+edit5.Text;
    SQL.Text:='select RemarkSO from data0060 where Rkey='+inttostr(rkey60);
//    sql.Text:='select memo_text from data0011 where source_type=60 and file_pointer='+inttostr(rkey60);
    open;
//    if not isempty then fm_note.Memo1.Text:=FieldValues['memo_text'];
    if not IsEmpty then fm_note.Memo1.Text:=FieldValues['RemarkSO'];
   end;
   2:
   begin
    fm_note.Caption := '销售订单确认记事本:'+edit5.Text;
    sql.Text:='select RemarkAudit from data0060 where  Rkey='+inttostr(rkey60);
//    sql.Text:='select * from data0011 where source_type=1060 and file_pointer='+inttostr(rkey60);
    open;
    if not IsEmpty then fm_note.Memo1.Text:=FieldValues['RemarkAudit'];
//     for i:=1 to 4 do
//      fm_note.Memo1.Lines.Add(fieldbyname('note_pad_line_'+inttostr(i)).AsString);
   end;
   3:
   begin
    fm_note.Caption := '销售订单装运记事本'+edit5.Text;
    sql.Text:='select * from data0179 where so_ptr='+inttostr(rkey60);
    open;
    if not isempty then
     for i:=1 to 10 do
      fm_note.Memo1.Lines.Add(fieldbyname('line_'+inttostr(i)).AsString);
   end;
   4:
   begin
    fm_note.Caption := '销售订单装运指派记事本'+edit5.Text;
    if v_modal<>3 then
    begin
     fm_note.Button1.Visible:=true;
     fm_note.Button2.Visible:=true;
     fm_note.Button3.Visible:=false;
     fm_note.Memo1.ReadOnly:=false;
     fm_note.Memo1.Color := clwindow;
    end;
    fm_note.Memo1.Lines.Assign(ship_note);
   end;
   end; //end case
  end;  //end with do
  if fm_note.ShowModal=mrok then
   if (sender as Tmenuitem).Tag=4 then
    ship_note.Text:=fm_note.Memo1.Text;
 finally
  fm_note.free;
 end; //end try
end;

procedure Tfm_detail.bt_autoassignClick(Sender: TObject);
var s1:string;
    i:integer;
    server_date:Tdatetime;
    InputVar: PDlgInput ;
begin
 if strtoint(edit13.Text)=0 then
 begin
  showmessage('产品当前库存为0，不能指派！');
  exit;
 end;
 try
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
  InputVar.Fields:='CODE/仓库代码/110,LOCATION/仓库名称/351';
  InputVar.Sqlstr:='SELECT RKEY,CODE,LOCATION FROM Data0016 where location_type=1'+
  ' and allow_putout=1 order by code';
  inputvar.KeyField:='CODE';
  InputVar.AdoConn := dm.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    s1:='';
    if sg1.RowCount>2 then
    begin
     for i:=1 to sg1.RowCount-2 do
      s1:=s1+sg1.Cells[7,i]+',';
     delete(s1,length(s1),1); //删除最后一位','
     s1:=' and d53.rkey not in ('+s1+') ';
    end;

    s1:= s1+'and D53.LOC_PTR='+
              frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsString;

     server_date:=getsystem_date(dm.aqtmp,1);
     with dm.aqtmp do
     begin
      close;
      sql.Text:='SELECT d53.RKEY,D15.ABBR_NAME as whouse,d16.location,D23.ABBR_NAME,'+
        'D06.WORK_ORDER_NUMBER as wo_number,D53.REFERENCE_NUMBER as place,D53.MFG_DATE,'+
        'D53.QTY_ON_HAND-D53.QTY_ALLOC as QTY_AVAL,D25.review_days '+
        'FROM Data0053 d53 inner join Data0015 d15 on D53.WHSE_PTR=D15.RKEY '+
        'inner join Data0016 d16 on D53.LOC_PTR=D16.RKEY '+
        'left outer join Data0006 d06 on D53.WORK_ORDER_PTR=D06.RKEY '+
        'inner join Data0025 d25 on D53.CUST_PART_PTR=D25.rkey '+
        'left outer join Data0060 D60 on D53.barcode_ptr=D60.rkey '+
        'left outer join Data0023 D23 on D60.supplier_ptr=D23.rkey '+
        'WHERE (D53.QTY_ON_HAND - D53.QTY_ALLOC > 0)'+
        ' and D53.CUST_PART_PTR='+inttostr(rkey25)+s1+
        ' Order by D53.MFG_DATE ';
      open;
      while not eof do
      begin
       if margin-strtoint(edit14.Text)>0 then
        if fieldvalues['mfg_date']>=server_date-fieldvalues['review_days'] then
         assign_add(margin)
        else
        begin
         if messagedlg('库存产品过期！(工单:'+fieldbyname('wo_number').AsString+')，是否继续？',mtwarning,[mbyes,mbno],0)=mrno then
          break
         else
          assign_add(margin);
        end;
       next;
      end;
     end;

  end;
 finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end; //end try

end;

procedure Tfm_detail.assign_typeChange(Sender: TObject);
begin
 if assign_type.ItemIndex=0 then
  margin:=normal_margin
 else
  margin:=return_margin;
end;

procedure Tfm_detail.Edit15KeyPress(Sender: TObject; var Key: Char);
begin
 if (not (key in ['0'..'9','.',#8])) then abort;
end;

procedure Tfm_detail.Edit15KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if (Sender as TEdit).Text='' then (Sender as TEdit).Text:='0';
end;

function Tfm_detail.check_error():boolean; //检查数据的准确性
var
  check_number:boolean;  //是否编号重复
  i:integer;
  new_margin:integer;
  invoice_number:string;
  lqry: TADODataSet;
  ltmpno: Integer;
begin
  re_number:='';
  check_number:=false;
  result:=true;

  //关联标签匹配记录 -----华为终端
  //---chengtx 2017-10-31
  //if Edit4.Text <> 'TD103613-HFA0' then//古芬华取消，游先灿签字18.3.28
  if cbx1.Checked then
  begin
  if Pos('华为终端',Label4.Caption) > 0 then
  begin
    if edtcustshipno.Text = '' then
    begin
      Result := False;
      ShowMessage('华为终端出货必须 匹配客户货单号，请填写客户货单');
      Exit;
    end;
  end;

  lqry := TADODataSet.Create(Self);
  try
    lqry.Connection := dm.ADOConnection1;
    lqry.Close;
    lqry.CommandText := ' SELECT count(*) as no FROM Data0737 ' +
                        ' inner JOIN Data0736 on HWBarCode = Barcode ' +
                        ' WHERE cmpret =1 and ShipNo = ' + QuotedStr(edtcustshipno.Text);
    lqry.Open;
    ltmpno := lqry.fieldbyname('no').AsInteger;


    lqry.Close;
    lqry.CommandText := ' SELECT count(*) as no from Data0736 ' +
                        ' WHERE ShipNo = ' + QuotedStr(edtcustshipno.Text);
    lqry.Open;

    if ltmpno < lqry.FieldByName('no').AsInteger then
    begin
      Result := False;
      ShowMessage('客户货单' + edtcustshipno.Text +  ' 中存在没有进行匹配操作的箱子, 禁止保存');
      Exit;
    end;
  finally
    lqry.Free;
  end;
  end;
  //-----

 
  if strtoint(edit14.Text)=0 then
  begin
    messagedlg('不能保存！指派数量不允许为零。',mtinformation,[mbok],0);
    result:=false;
    exit;
  end;

  for i:=1 to sg1.RowCount-2 do
    if (trim(sg1.Cells[6,i])='') or (strtoint(sg1.Cells[6,i])=0) then
    begin
      messagedlg('不能保存！指派明细数量不允许为零。',mtinformation,[mbok],0);
      result:=false;
      exit;
    end;

{ if (assign_type.ItemIndex=0) and (margin<strtoint(edit14.Text)) then
 begin
  showmessage('正常指派－－数量不能大于订单正常欠数('+inttostr(margin)+')！');
  result:=false;
  exit;
 end;
}
// if (assign_type.ItemIndex=1) and (margin<strtoint(edit14.Text)) then
  if (strtoint(edit14.Text)>margin) then
  begin
    showmessage('指派数量不能大于订单欠数数量:('+inttostr(margin)+')');
    result:=false;
    exit;
  end;

  if (edit23.Text='转厂') and (strtofloat(edit15.Text)<=0) then
  begin
    showmessage('转厂订单的单位重量不允许为零！');
    edit15.SetFocus;
    result:=false;
    exit;
  end;

  if IS_FG_counting then
  begin
    showmessage('装运指派对应的部件处于盘点状态，暂时不能新增！');
    result:=false;
    exit;
  end;

  if v_modal=1 then  //新增才检查编号是否重复
    while not check_number do  //循环检查批号是否重复
      with dm.aqtmp do
      begin
        close;
        sql.Text:='select shipment_no from data0064 '+
         'where so_ptr='+inttostr(rkey60)+' and shipment_no='+edit1.Text;
        open;
        if not isempty then  //批号重复
        begin
          edit1.Text:=inttostr(fieldvalues['shipment_no']+1);
          re_number:=edit1.Text;
        end
        else check_number:=true;  //批号未重复
      end;

  for i:=1 to sg1.RowCount-2 do //--保存前检查库存数据是否发生变化。
    with dm.aqtmp do
    begin
      close;
      sql.Text:='select qty_on_hand-qty_alloc as qty_aval from data0053 where rkey='+sg1.Cells[7,i];
      open;
      if (fieldvalues['qty_aval']+strtoint(sg1.Cells[8,i]))<strtoint(sg1.Cells[6,i]) then
      begin
        messagedlg('不能保存！第'+inttostr(i)+'条指派明细的库存数量发生变化，不够本次指派。',mtwarning,[mbok],0);
        sg1.SetFocus;
        result:=false;
        exit;
      end;
    end;

  with dm.aqtmp do  //--保存前检查订单需求数量是否发生变化。
  begin
    close;
    if assign_type.ItemIndex=0 then
      sql.Text:='select parts_ordered-parts_shipped as margin from data0060 where rkey='+inttostr(rkey60)
    else
      sql.Text:='select parts_returned-returned_ship as margin from data0060 where rkey='+inttostr(rkey60);
    open;
    if v_modal=1 then
      new_margin:= fieldvalues['margin']
    else
      new_margin:=fieldvalues['margin']+dm.ADS64quan_shipped.Value;

    if new_margin<>self.margin then
    begin
      showmessage('不能保存!指派数量大于需求数，可能同步操作导致订单需求数发生变化。');
      result:=false;
      exit;
    end;
  end;

  with dm.aqtmp do  //--保存前检查订单客户代码,本厂编号是否变化。
  begin
    close;
    sql.Text:='select CUSTOMER_PTR,CUST_PART_PTR from data0060 where rkey='+inttostr(rkey60)+
              ' and CUSTOMER_PTR='+inttostr(rkey10)+' and CUST_PART_PTR='+inttostr(rkey25);
    open;

    if IsEmpty then
    begin
      showmessage('不能保存!订单客户代码,或者本厂编号发生变化!');
      result:=false;
      exit;
    end;
  end;

  with dm.aqtmp do
  begin
    Close;
    SQL.Text:= 'select PARTS_ALLOC from data0060 where RKEY = '+inttostr(rkey60);
    Open;
  end;
  if Abs(dm.aqtmp.FieldByName('PARTS_ALLOC').AsFloat - dm.AQ64.FieldByName('part_price').AsFloat)>0.01 then
  begin
    ShowMessage('销售订单价格可能已发生变更，请退出程序重新指派或者联系管理员！');
    result:=false;
    Exit;
  end;

  if v_modal=2 then  //编辑
    with dm.aqtmp do  //保存前检查出指派主表数据是否发生变化。
    begin
      close;
      sql.Text:='select * from data0064 where rkey='+dm.AQ64.fieldbyname('rkey').AsString;
      open;
      for i:=0 to 23 do
        if fields[i].Value<>dm.AQ64.Fields[i].Value then
        begin
         messagedlg('不能保存！出仓单可能被其它用户同步修改。',mtwarning,[mbok],0);
         result:=false;
         exit;
        end;
    end;

  with dm.aqtmp do
  begin
    close;
    sql.Text:='select cod_flag from data0010 where cust_code='''+Edit3.Text+'''';
    open;
    if fieldbyname('cod_flag').AsString='Y' then
    begin
      close;                                                     //编辑之前数量
      dm.aqtmp.sql.Text:='select B.PARTS_SHIPPED+'+Edit14.Text+'-'+FsQty+'-isnull(A.Qty,0) from '+
               '(select sum(Data0152.all_shipqty) Qty,Data0152.PO_NUMBER from Data0152 INNER JOIN Data0114 '+
               'ON Data0152.srce_ptr=Data0114.rkey where Data0152.PO_NUMBER='''+Edit6.Text+
               ''' and Data0152.manu_part_number='''+Edit4.Text+''' and Data0114.ttype=2 group by Data0152.PO_NUMBER) A '+
               'right join '+
               '(select sum(PARTS_SHIPPED) PARTS_SHIPPED,D97.PO_NUMBER  from data0060 d60 inner join data0097 d97 '+
               'on d60.PURCHASE_ORDER_PTR=d97.rkey inner join data0025 d25 on d60.CUST_PART_PTR=d25.rkey where d25.MANU_PART_NUMBER='''+Edit4.Text+''' and d97.PO_NUMBER='''+Edit6.Text+''' group by d97.PO_NUMBER) B '+
               'on A.PO_NUMBER=B.PO_NUMBER';
      open;
      if (fields[0].AsInteger>0) and (messagedlg('该客户本次送货数量已出超了:'+fields[0].AsString+',是否继续?',mtConfirmation,[mbYes,mbNo],0)<>mrYes) then
      begin
        result:=false;
        exit;
      end;
    end;
  end;

  if (self.cust_ship='Y') and  (custinvoice_day(invoice_number,self.rkey10)) and
        (messagedlg('该客户有未付款发票:'+invoice_number+'超过了最长延期付款天数,是否继续?', mtConfirmation,[mbYes,mbNo],0)<>mrYes) then
  begin
    result:=false;
    exit;
  end;
end;

procedure Tfm_detail.btsaveClick(Sender: TObject);
begin
  if check_error then //如果检测数据无误
  begin
    dm.ADOConnection1.BeginTrans;
    if v_modal=1 then //新增
    begin
      dm.AQ64SO_PTR.Value:=rkey60;    //销售订单指针
      dm.AQ64ENT_CSI_USER_PTR.Value:=StrToInt(rkey73);     //指派员工
      dm.AQ64ENT_EMPL_PTR.Value:=strtoint(user_ptr);  //系统用户
      dm.AQ64DATE_ASSIGN.Value := getsystem_date(dm.aqtmp,0); //指派长格式日期
      dm.AQ64SHIPMENT_NO.AsString := edit1.Text;      //装运批次号
      dm.AQ64QUAN_SHIPPED.Value := strtoint(edit14.Text);      //指派数量
      dm.AQ64REMARK.Value:=edit16.Text;
      dm.AQ64assign_type.Value:=assign_type.ItemIndex;
      dm.AQ64REPORT_UNIT_VALUE1.asfloat:=strtofloat(edit15.Text);
      //--程天旭
      //--增加客户货单号 2017-10-31
      dm.AQ64.FieldByName('custshipno').AsString := edtcustshipno.Text; //客户货单号

      //------



        if edit29.text=''  then   //箱数无定义则补为0
        begin
         edit29.Text:='0';
        end;
      dm.AQ64cartons_no.Value:=StrToInt(Edit29.Text);
      try
        dm.AQ64.Post;
        save_new_data;
      except
        if dm.ADOConnection1.InTransaction then
          dm.ADOConnection1.RollbackTrans;
        Abort;
      end;
    end
    else
    begin  //编辑
      del_old_data;  //删除旧数据
      dm.AQ64.close;
      dm.AQ64.parameters[0].Value:=dm.ADS64rkey.Value;
      dm.AQ64.open;
      dm.AQ64.Edit;
      dm.AQ64ENT_CSI_USER_PTR.Value:=StrToInt(rkey73);     //指派员工
      dm.AQ64ENT_EMPL_PTR.Value:=strtoint(user_ptr);  //系统用户
      dm.AQ64DATE_ASSIGN.Value := getsystem_date(dm.aqtmp,0); //指派长格式日期
      dm.AQ64QUAN_SHIPPED.Value := strtoint(edit14.Text);      //指派数量
      dm.AQ64REMARK.Value:=edit16.Text;
      dm.AQ64REPORT_UNIT_VALUE1.asfloat:=strtofloat(edit15.Text);
      dm.AQ64.FieldByName('custshipno').AsString := edtcustshipno.Text;
       if edit29.text=''  then  //箱数无定义则补为0
        begin
         edit29.Text:='0';
        end;
      dm.AQ64cartons_no.Value:=StrToInt(Edit29.Text);
      try
        dm.AQ64.Post;
        save_new_data;
      except
        if dm.ADOConnection1.InTransaction then
          dm.ADOConnection1.RollbackTrans;
        showmessage('数据保存失败！请退出程序重新指派或者联系管理员。');
        Abort;
      end;
    end;
    dm.ADOConnection1.CommitTrans;
    ModalResult:=mrok;
    if re_number<>'' then
      showmessage('多用户同步操作造成指派批号重复，系统已自动重编为：'+re_number);
  end;
end;

procedure Tfm_detail.PM2Popup(Sender: TObject);
begin
 if rkey60<=0 then
 begin
  n3.Enabled:=false;
  n4.Enabled:=false;
  n5.Enabled:=false;
  n6.Enabled:=false;
 end
 else begin
  n3.Enabled:=true;
  n4.Enabled:=true;
  n5.Enabled:=true;
  n6.Enabled:=true;
 end;
end;

procedure Tfm_detail.get_planrej_qty(rkey25: integer; so_no: string);
begin
dm.aqtmp.Close;
dm.aqtmp.SQL.Text:='SELECT sum(ISSUED_QTY) as iss_qty, sum(QTY_REJECT) as rej_qty '+
'FROM dbo.data0492 where BOM_PTR='+inttostr(rkey25)+
' and  SO_NO='+quotedstr(so_no);
dm.aqtmp.Open;
edit24.Text:=dm.aqtmp.fieldbyname('iss_qty').AsString;
edit25.Text:=dm.aqtmp.fieldbyname('rej_qty').AsString;
dm.aqtmp.Close;
end;

function Tfm_detail.custinvoice_day(var in_number:string;cust_ptr: integer): boolean;
var
   max_days:integer;
begin
  with dm.aqtmp do
   begin
    close;
    sql.Text:='select INVOICE_NOTE_PAD_PTR from data0010 '+  //允许客户延期最长天数
              'where rkey='+inttostr(cust_ptr);
    open;
    max_days:= fieldbyname('INVOICE_NOTE_PAD_PTR').AsInteger;
   end;
with dm.aqtmp do
 begin
  close;
  sql.Clear;
  sql.Add('SELECT invoice_number,max(DATEDIFF(day,DUE_DATE,GETDATE())) AS days');
  sql.Add('FROM dbo.Data0112');
  sql.Add('where INVOICE_STATUS=1');
  SQL.add('and INVOICE_TOTAL-amount_paid-CASH_DISC > 1');
  sql.Add('and CUSTOMER_PTR='+inttostr(cust_ptr));
  sql.Add('group by invoice_number');
  sql.Add('ORDER BY MAX(DATEDIFF(day, due_date, GETDATE())) DESC');
  open;
  if not isempty then in_number:=fieldvalues['invoice_number'];
 end;
 if dm.aqtmp.FieldValues['days']=null then
  custinvoice_day:=false
 else
  if dm.aqtmp.FieldValues['days'] > max_days then
   custinvoice_day:=true
  else
   custinvoice_day:=false;
end;

procedure Tfm_detail.Edit29KeyPress(Sender: TObject; var Key: Char);
begin
 if (not (key in ['0'..'9',#8])) then abort;
end;

procedure Tfm_detail.btn1Click(Sender: TObject);
var
  LFrm: TfrmShowShipNoInfo;
begin
  LFrm := TfrmShowShipNoInfo.Create(Self);
  try
    LFrm.GetData(edtcustshipno.Text);
    LFrm.ShowModal;
  finally
    LFrm.free;
  end;
end;

end.
