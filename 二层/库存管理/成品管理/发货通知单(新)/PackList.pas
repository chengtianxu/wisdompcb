unit PackList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Menus, Grids, ExtCtrls, Mask, DBCtrls,math,DB,
  DBGrids, ADODB;

type
  TForm_PackList = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    Edit16: TEdit;
    Edit17: TEdit;
    Panel1: TPanel;
    BtnClose: TBitBtn;
    BtnSave: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Label18: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    MaskEdit1: TMaskEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Label8: TLabel;
    Edit9: TEdit;
    ComboBox1: TComboBox;
    Label15: TLabel;
    Edit10: TEdit;
    BitBtn3: TBitBtn;
    Label14: TLabel;
    Label19: TLabel;
    Edit11: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    function find_soerror(number:string):boolean;
    procedure MaskEdit1Exit(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Edit17Enter(Sender: TObject);
    procedure Edit17Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function return_vifrkey(sgrid: tstringgrid;col: integer): string;
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  procedure add_pack_list(i,j:integer);
  procedure re_calculate_qty;
  public
    { Public declarations }
    ade_flag,rkey10,rkey12,rkey01,rkey15,rkey529:integer;
    po_number:string;
    procedure update04(table_name:string);
  end;

var
  Form_PackList: TForm_PackList;

implementation

uses Customer, ShipAddress, Demo, PackSearch, EditNote,common,Pick_Item_Single ,ConstVar;


{$R *.dfm}
function TForm_PackList.find_soerror(number:string):boolean;
begin
 result := false;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0529');
   sql.Add('where shipadvice_no='''+number+'''');
   open;
   if not IsEmpty then result := true;
  end;
end;

procedure TForm_PackList.update04(table_name:string);
var
 i,v_length:integer;
 v_last,v_seed,new_seed:string;
begin
 dm.ado04.Close;
 dm.ado04.Parameters[0].Value:=table_name;
 dm.ado04.Open;
 v_seed:=dm.ado04SEED_VALUE.Value;
 if dm.ado04SEED_FLAG.Value<>1 then
 begin
 v_length := length(v_seed);
 for i := v_length downto 1 do
  if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.ado04.Edit; //使前缀不变后缀加1
    dm.ado04SEED_VALUE.Value := new_seed;
    dm.ado04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.ado04.Edit;
     dm.ado04SEED_VALUE.Value := new_seed;
     dm.ado04.Post;
    end;
 end;
end;

procedure TForm_PackList.add_pack_list(i,j:integer);
begin
 dm.AQ64.Close;
 dm.AQ64.Parameters[0].Value:=j;
 dm.AQ64.Open;
 DM.AQ530.Close;
 DM.AQ530.Open;
 dm.AQ530.Append;
 dm.AQ530rkey529_ptr.Value:=dm.ADO529RKEY.Value;
 dm.AQ530rkey64_PTR.Value:=j;
 dm.AQ530cartons_no.Value:=StrToInt(stringgrid1.Cells[9,i]);
 //DM.AQ530weight.Value:=StrToInt(stringgrid1.Cells[7,i])*dm.AQ64report_unit_value1.Value*0.001+0.5*StrToInt(stringgrid1.Cells[9,i]);
 DM.AQ530weight.Value:=StrToFloat(StringGrid1.Cells[5,i]);//毛重
 DM.AQ530quan_declare.Value:=StrToInt(stringgrid1.Cells[7,i]);
 DM.AQ530total_amount.Value:=StrToFloat(StringGrid1.Cells[11,i]);//报关总工具费用
 dm.AQ530nweight.Value:=StrToFloat(StringGrid1.Cells[4,i]);//净重
 dm.AQ530cust_decl.AsString:=FloatToStr(StrToInt(StringGrid1.Cells[7,i])*strtofloat(StringGrid2.Cells[3,i]));//报关金额
 if DM.AQ64reference_number.Value<>null then
  DM.AQ530reference_number.Value:=dm.AQ64reference_number.Value
 else
 dm.AQ530reference_number.Value:='';
 dm.AQ530remark1.Value:=StringGrid1.Cells[2,i];
 dm.AQ530remark2.Value:='';
 dm.AQ530remark3.Value:='';
 dm.AQ530remark4.Value:='';
 dm.AQ530.Post;
 dm.AQ64.Edit;
 dm.AQ64rkey529_ptr.Value:=DM.AQ64rkey529_ptr.Value+StrToInt(StringGrid1.Cells[7,i]);
 if dm.AQ64cartons_no.Value-StrToInt(stringgrid1.Cells[9,i])>=0 then
 begin
   dm.AQ64cartons_no.Value:=dm.AQ64cartons_no.Value-StrToInt(stringgrid1.Cells[9,i]);
 end
 else
 begin
   dm.AQ64cartons_no.Value:=0;
 end;
 dm.AQ64.Post;
end;

procedure TForm_PackList.BitBtn1Click(Sender: TObject);
begin
try
Form_Customer:=TForm_Customer.Create(Application);
Form_Customer.MaskEdit1.Text:=Trim(Edit17.Text);
if Form_Customer.ADOQuery1.IsEmpty then
begin
MessageDlg('没有找到相关数据!',mtInformation,[mbok],0);
Edit17.SetFocus;
end
else
if Form_Customer.ShowModal=mrok then
 begin
 edit17.Text:=trim(Form_Customer.ADOQuery1cust_code.Value);
 edit17.Font.Color:=clWindowText;
 Label18.Caption:=trim(Form_Customer.ADOQuery1customer_name.Value);
 rkey10:=Form_Customer.ADOQuery1rkey.Value;
 Edit9.Text:=Form_Customer.ADOQuery1curr_code.Value;
 Edit9.Tag:=Form_Customer.ADOQuery1rkey01.Value;
 Label14.Caption:=Form_Customer.ADOQuery1curr_name.Value;
   with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select *');
    sql.Add('from data0012');
    sql.Add('where customer_ptr='+IntToStr(rkey10));
    sql.Add('and LANGUAGE_FLAG=''Y''');
    sql.Add('order by rkey');
    open;
   if not IsEmpty then
   begin
   Edit16.Text:=fieldvalues['location'];
   if dm.ADOQuery1.FieldByName('LOCNAME_FOR_FORM').AsVariant<>null then
   Edit2.Text:=FieldValues['LOCNAME_FOR_FORM'];
   if dm.ADOQuery1.FieldByName('MISC_BARCODE_LABLE').AsVariant<>null then
   Edit3.Text:=FieldValues['MISC_BARCODE_LABLE'];
   if dm.ADOQuery1.FieldByName('SHP_ADDR1_FOR_FORM').AsVariant<>null then
   Edit4.Text:=FieldValues['SHP_ADDR1_FOR_FORM'];
   if dm.ADOQuery1.FieldByName('COFC_FORMAT_FILENAME').AsVariant<>null then
   Edit5.Text:=FieldValues['COFC_FORMAT_FILENAME'];
   if dm.ADOQuery1.FieldByName('S3_BARCODE_LABLE').AsVariant<>null then
   Edit6.Text:=FieldValues['S3_BARCODE_LABLE'];
   if dm.ADOQuery1.FieldByName('S4_BARCODE_LABLE').AsVariant<>null then
   Edit7.Text:=FieldValues['S4_BARCODE_LABLE'];
   if dm.ADOQuery1.FieldByName('PACKGE_BARCODE_LABLE').AsVariant<>null then
   Edit8.Text:=FieldValues['PACKGE_BARCODE_LABLE'];
   rkey12:=fieldvalues['rkey'];
   end;
   end;
 end;
finally
Form_Customer.Free;
end;
end;

procedure TForm_PackList.BitBtn2Click(Sender: TObject);
begin
try
Form_ShipAddress:=TForm_ShipAddress.Create(Application);
if trim(Edit17.Text)<>'' then
with Form_ShipAddress.ADOQuery1 do
begin
close;
sql.Clear;
sql.Add('select * from data0012');
sql.Add('where customer_ptr='+IntToStr(rkey10));
open;
end;
if Form_ShipAddress.ShowModal=mrok then
begin
Edit16.Text:=Form_ShipAddress.ADOQuery1location.Value;
edit2.Text:=Form_ShipAddress.ADOQuery1LOCNAME_FOR_FORM.Value;//收货公司中文名
Edit3.Text:=Form_ShipAddress.ADOQuery1MISC_BARCODE_LABLE.Value;//收货公司英文名
Edit4.Text:=Form_ShipAddress.ADOQuery1SHP_ADDR1_FOR_FORM.Value;//收货地址中文名
Edit5.Text:=Form_ShipAddress.ADOQuery1COFC_FORMAT_FILENAME.Value;//收货地址英文名
Edit6.Text:=Form_ShipAddress.ADOQuery1S3_BARCODE_LABLE.Value;//收货联系人
Edit7.Text:=Form_ShipAddress.ADOQuery1S4_BARCODE_LABLE.Value;//收货联系人电话
Edit8.Text:=Form_ShipAddress.ADOQuery1PACKGE_BARCODE_LABLE.Value;//收货联系人传真
rkey12:=Form_ShipAddress.ADOQuery1rkey.Value;
if trim(edit17.Text)='' then
with dm.ADOQuery1 do
begin
close;
sql.Clear;
sql.Add('select data0010.cust_code,data0010.customer_name,data0010.DO_SMOOTHING,');
SQL.Add('data0010.currency_ptr,data0001.curr_code,data0001.curr_name,');
SQL.add('data0010.cod_flag,data0010.CUSTOMER_TYPE from data0010');
SQL.Add('inner join data0001 on data0010.CURRENCY_PTR=data0001.rkey');
sql.Add('where data0010.rkey='+Form_ShipAddress.ADOQuery1CUSTOMER_PTR.AsString);
open;
Edit17.Text:=fieldvalues['cust_code'];
Edit17.Font.Color:=clwindowtext;
Label18.Caption:=fieldbyname('customer_name').AsString;
rkey10:=Form_ShipAddress.ADOQuery1CUSTOMER_PTR.Value;
edit9.Text:=FieldValues['curr_code'];
Label14.Caption:=FieldValues['curr_name'];
Edit9.Tag:=FieldValues['CURRENCY_PTR'];
end;
end
else
Edit16.SetFocus;
finally
Form_ShipAddress.Free;
end;
end;

procedure TForm_PackList.N1Click(Sender: TObject);
var
 i,j:integer;
 rkey64_list:string;
 po_issame:Boolean;
begin
  po_issame:=False;
  if Trim(Edit17.Text)='' then
  begin
   MessageDlg('请先选择客户!',mtInformation,[mbok],1);
   Exit;
  end;
 try
  Form_PackSearch:= TForm_PackSearch.Create(application);
  rkey64_list:= return_vifrkey(stringgrid2,0);
  with  Form_PackSearch.ads64 do
   begin
    close;
    Parameters[0].Value:=rkey10;
    Parameters[1].Value:=common.getsystem_date(dm.ADOQuery1,1)-1;
    Parameters[2].Value:=common.getsystem_date(dm.ADOQuery1,1);
    CommandText:=CommandText+' and (data0060.CURRENCY_PTR='+inttostr(edit9.Tag)+')';
    if rkey64_list<>'' then
      CommandText:=CommandText+' and data0064.rkey not in'+rkey64_list;
    Prepared;
    open;
   end;
  if Form_PackSearch.ShowModal=mrok then
  begin
   for i:=1 to Form_PackSearch.DBGrid1.SelectedRows.Count do
    begin
     Form_PackSearch.dbgrid1.DataSource.DataSet.Bookmark :=
                         Form_PackSearch.dbgrid1.SelectedRows.Items[i-1];
     if (i=1) and (trim(Edit11.Text)='') and (StringGrid1.RowCount=2) then
     Edit11.Text:=Form_PackSearch.ads64ORIG_CUSTOMER.AsString
     else
     begin
       if Edit11.Text<>Form_PackSearch.ads64ORIG_CUSTOMER.AsString then
       begin
        if messagedlg('此指派关联原客户与前面的不一致你确定也要一起报关吗??'+Form_PackSearch.ads64MANU_PART_NUMBER.Value,mtconfirmation,[mbyes,mbno],0)=mrno then
        begin
         continue;
        end;
       end;
     end;
     stringgrid1.Cells[0,stringgrid1.RowCount-1]:=Form_PackSearch.ads64SALES_ORDER.Value;
     stringgrid1.Cells[1,stringgrid1.RowCount-1]:=Form_PackSearch.ads64MANU_PART_NUMBER.Value;
     stringgrid1.Cells[2,stringgrid1.RowCount-1]:=Form_PackSearch.ads64MANU_PART_DESC.Value;
     stringgrid1.Cells[3,stringgrid1.RowCount-1]:=Form_PackSearch.ads64PO_NUMBER.Value;
     stringgrid1.Cells[4,stringgrid1.RowCount-1]:=Form_PackSearch.ads64weigth.asstring;//净重
     stringgrid1.Cells[5,stringgrid1.RowCount-1]:=FloatToStr(Form_PackSearch.ads64weigth.Value+Form_PackSearch.ads64cartons_no.Value*0.5);//毛重
     stringgrid1.Cells[6,stringgrid1.RowCount-1]:=Form_PackSearch.ads64EMPLOYEE_NAME.Value;
     stringgrid1.Cells[7,stringgrid1.RowCount-1]:=Form_PackSearch.ads64DSDesigner.AsString;
     StringGrid1.Cells[8,StringGrid1.RowCount-1]:=Form_PackSearch.ads64ANALYSIS_CODE_2.Value;
     StringGrid1.Cells[9,StringGrid1.RowCount-1]:=Form_PackSearch.ads64cartons_no.AsString;
     StringGrid1.Cells[10,StringGrid1.RowCount-1]:=Form_PackSearch.ads64cust_decl.AsString;//报关单号
     if StringGrid1.RowCount=2 then //销售订单工具费用生成
     begin
      with DM.ADOQuery1 do
      begin
       Close;
       sql.Clear;
       SQL.Add('select isnull(sum(data0530.total_amount),0) as total_amount');
       SQL.Add('from data0064 inner join data0530 on data0064.rkey=data0530.rkey64_ptr');
       SQL.Add('where data0064.so_ptr='+Form_PackSearch.ads64rkey60.AsString);
       Open;
      end;
      if dm.ADOQuery1.FieldByName('total_amount').Value>0 then
      //已有出货记录且生成过工具费用不用增加工具费用
      begin
       StringGrid1.Cells[11,StringGrid1.RowCount-1]:='0';//工具费用
      end
      else
      begin //如果没有生成过工具费用
       with dm.ADOQuery2 do
       begin
         Close;
         sql.Clear;
         sql.Add('select isnull(sum(amount),0) as total_amount from data0062 where addl_cat_ptr in (select rkey from data0061)');
         sql.Add('and so_ptr='+Form_PackSearch.ads64rkey60.AsString);
         Open;
       end;
        if dm.ADOQuery2.IsEmpty=false then
        begin
          StringGrid1.Cells[11,StringGrid1.RowCount-1]:=dm.ADOQuery2.Fieldbyname('total_amount').AsString;
        end
        else
        begin
          StringGrid1.Cells[11,StringGrid1.RowCount-1]:='0';//工具费用
        end;
      end;
     end
     else
     begin
      with DM.ADOQuery1 do
      begin
       Close;
       sql.Clear;
       SQL.Add('select isnull(sum(data0530.total_amount),0) as total_amount');
       SQL.Add('from data0064 inner join data0530 on data0064.rkey=data0530.rkey64_ptr');
       SQL.Add('where data0064.so_ptr='+Form_PackSearch.ads64rkey60.AsString);
       Open;
      end;
      if dm.ADOQuery1.FieldByName('total_amount').Value>0 then
      begin
       StringGrid1.Cells[11,StringGrid1.RowCount-1]:='0';//工具费用
      end
      else
      begin //如果没有生成过工具费用
       for j:=1 to StringGrid1.RowCount-2 do//排除相同订单
       begin
        if (StringGrid1.Cells[0,j]=StringGrid1.Cells[0,StringGrid1.RowCount-1]) and (StrToFloat(StringGrid1.Cells[11,j])>0) then
        begin
          po_issame:=True;
          Break;
        end;
       end;
       if po_issame=False then
       begin
        with dm.ADOQuery2 do
        begin
         Close;
         sql.Clear;
         sql.Add('select isnull(sum(amount),0) as total_amount from data0062 where addl_cat_ptr in (select rkey from data0061)');
         sql.Add('and so_ptr='+Form_PackSearch.ads64rkey60.AsString);
         Open;
        end;
        if dm.ADOQuery2.IsEmpty=false then
          StringGrid1.Cells[11,StringGrid1.RowCount-1]:=dm.ADOQuery2.Fieldbyname('total_amount').AsString
        else
        StringGrid1.Cells[11,StringGrid1.RowCount-1]:='0';//工具费用
       end
       else
       begin
         StringGrid1.Cells[11,StringGrid1.RowCount-1]:='0';//工具费用
       end;
      end;
     end;
     stringgrid2.Cells[0,stringgrid2.RowCount-1]:=Form_PackSearch.ADs64rkey64.AsString;
     stringgrid2.Cells[2,stringgrid2.RowCount-1]:=form_packsearch.ads64pcs_weight.AsString;
     StringGrid2.Cells[1,StringGrid2.RowCount-1]:=Form_PackSearch.ads64DSDesigner.AsString;
     StringGrid2.Cells[3,StringGrid2.RowCount-1]:=Form_PackSearch.ads64PART_PRICE.AsString;
     StringGrid1.RowCount:=StringGrid1.RowCount+1;
     stringgrid2.RowCount:=stringgrid2.RowCount+1;
    end;
    if StringGrid1.RowCount>2 then
    begin
      BitBtn1.Enabled:=False;
      BitBtn3.Enabled:=False;
    end;
    re_calculate_qty;
  end;
 finally
  Form_PackSearch.Free;
 end;
end;

procedure TForm_PackList.FormActivate(Sender: TObject);
begin
 stringgrid1.Cells[0,0]:='销售订单';
 stringgrid1.Cells[1,0]:='本厂编号';
 stringgrid1.Cells[2,0]:='客户型号';
 stringgrid1.Cells[3,0]:='客户订单号';
 stringgrid1.Cells[4,0]:='净重(KG)';
 stringgrid1.Cells[5,0]:='毛重(KG)';
 stringgrid1.Cells[6,0]:='指派人员';
 stringgrid1.Cells[7,0]:='报关数量';
 StringGrid1.Cells[8,0]:='客户物料号';
 StringGrid1.Cells[9,0]:='箱数';
 //StringGrid1.Cells[10,0]:='报关单号';
 stringgrid1.Cells[11,0]:='工具费用';
 StringGrid1.colwidths[10]:=-1;
 if Self.ade_flag=1 then   //新增
 begin
  dm.ado04.Close;
  dm.ado04.Parameters[0].Value:='data0529';
  dm.ado04.Open;
  if dm.ado04SEED_FLAG.Value<>1 then
  Edit1.Text:=dm.ado04SEED_VALUE.Value;
  if dm.ado04SEED_FLAG.Value=4 then
  Edit1.ReadOnly:=True;
  MaskEdit1.Text:=datetostr(getsystem_date(dm.ADOQuery1,1));
  DM.ado04.Close;
 end;
  if Self.ade_flag<>1 then    //编辑或检查
  begin
   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('select data0010.rkey as rkey10,data0010.cust_code,data0010.customer_name,data0012.location,data0529.curr_ptr,');
     sql.Add('data0529.shipadvice_no,data0529.attn,data0529.attn1,data0529.attn_cc,isnull(data0529.invoice_no,'''') as invoice_no,');
     sql.Add('data0529.adv_from,data0529.adv_from_cc,data0529.ship_from,data0529.to_port,data0529.ORIG_CUSTOMER,');
     sql.Add('data0529.fax_no,data0529.ship_to_phone,data0529.fax_to,');
     sql.Add('data0529.mawb_no,data0529.hawb_no,isnull(data0529.flight_no,'''') as flight_no');
     sql.Add('from data0010,data0012,data0529'); //查找客户及地址
     sql.Add('where data0529.ship_addr_ptr=data0012.rkey and');
     sql.Add('data0012.customer_ptr=data0010.rkey and');
     sql.Add('data0529.rkey='+dm.ADO529RKEY.AsString);
     open;
     edit1.Text:=fieldvalues['shipadvice_no'];
     Edit1.ReadOnly:=True;
     label18.Caption:=fieldvalues['customer_name'];
     edit17.Text:=fieldvalues['cust_code'];
     rkey10:=FieldValues['rkey10'];
     Edit9.Tag:=FieldValues['CURR_PTR'];
     with dm.ADOQuery2 do
     begin
       Close;
       SQL.Clear;
       sql.Text:='select * from data0001 where rkey='+IntToStr(Edit9.Tag);
       Open;
     end;
     Edit9.Text:=dm.ADOQuery2.FieldValues['curr_code'];
     Label14.Caption:=dm.ADOQuery2.FieldValues['curr_name'];
     edit16.Text:=fieldvalues['location'];
     Edit2.Text:=FieldValues['ATTN'];
     Edit3.Text:=FieldValues['ATTN1'];
     Edit4.Text:=FieldValues['ATTN_CC'];
     Edit5.Text:=FieldValues['ADV_FROM'];
     Edit6.Text:=FieldValues['ADV_FROM_CC'];
     Edit7.Text:=FieldValues['SHIP_FROM'];
     Edit8.Text:=FieldValues['FAX_NO'];
     Edit10.Text:=FieldValues['invoice_no'];
     if DM.ADOQuery1.FieldByName('ORIG_CUSTOMER').Value<>null then
     Edit11.Text:=FieldValues['ORIG_CUSTOMER'];
     ComboBox1.Text:=FieldValues['flight_no'];
     rkey12:=dm.ADS529SHIP_ADDR_PTR.Value;
    end;
   with dm.qry64 do     //查找指派
    begin
     close;
     Parameters[0].Value:=dm.ADO529RKEY.Value;
     open;
    end;
    dm.QRY64.First;
     while not dm.QRY64.Eof do
      begin
       stringgrid1.Cells[0,stringgrid1.RowCount-1]:=dm.QRY64SALES_ORDER.Value;
       stringgrid1.Cells[1,stringgrid1.RowCount-1]:=dm.qry64MANU_PART_NUMBER.Value;
       stringgrid1.Cells[2,stringgrid1.RowCount-1]:=dm.QRY64MANU_PART_DESC.Value;
       stringgrid1.Cells[3,stringgrid1.RowCount-1]:=DM.QRY64PO_NUMBER.Value;
       stringgrid1.Cells[4,stringgrid1.RowCount-1]:=dm.QRY64nweight.AsString;
       stringgrid1.Cells[5,stringgrid1.RowCount-1]:=dm.QRY64weight.AsString;
       stringgrid1.Cells[6,stringgrid1.RowCount-1]:=DM.QRY64EMPLOYEE_NAME.Value;
       stringgrid1.Cells[7,stringgrid1.RowCount-1]:=dm.QRY64quan_declare.AsString;
       StringGrid1.Cells[8,StringGrid1.RowCount-1]:=dm.QRY64ANALYSIS_CODE_2.Value;
       StringGrid1.Cells[9,StringGrid1.RowCount-1]:=dm.QRY64cartons_no.AsString;
       //StringGrid1.Cells[10,StringGrid1.RowCount-1]:=dm.QRY64cust_decl.AsString;
       StringGrid1.Cells[11,StringGrid1.RowCount-1]:=dm.QRY64total_amount.AsString;
       stringgrid2.Cells[0,stringgrid2.RowCount-1]:=dm.QRY64RKEY.AsString;
       stringgrid2.Cells[1,stringgrid2.RowCount-1]:=dm.QRY64quan_declare.AsString;
       StringGrid2.Cells[2,StringGrid2.RowCount-1]:=DM.QRY64pcs_weight.AsString;
       StringGrid2.Cells[3,StringGrid2.RowCount-1]:=dm.qry64part_price.asstring;
       stringgrid1.RowCount:=stringgrid1.RowCount+1;
       stringgrid2.RowCount:=stringgrid2.RowCount+1;
       dm.QRY64.Next;
      end;
      re_calculate_qty;
    if StringGrid2.RowCount>2 then
    begin
     with dm.ADOQuery1 do
     begin
      Close;
      sql.Clear;
      sql.Add('select data0060.SHIP_REG_TAX_ID from data0064');
      SQL.Add('inner join data0060 on data0064.so_ptr=data0060.rkey');
      SQL.Add('where data0064.rkey='+StringGrid2.Cells[0,1]);
      Open;
     end;
     rkey15:=dm.ADOQuery1.FieldValues['SHIP_REG_TAX_ID'];
    end;
    MaskEdit1.Text:=DateToStr(dm.ADO529DEPA_DATE.Value);
  end;
end;



procedure TForm_PackList.N2Click(Sender: TObject);
var
 i:byte;
begin
  if StrToFloat(StringGrid1.Cells[11,StringGrid1.Row])>0 then
  begin
   if messagedlg('此记录已生成工具费用,确定此次报关此订单不报工具费用吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
   begin
    for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
    begin
     stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
     stringgrid2.Rows[i].Text:=stringgrid2.Rows[i+1].Text;
    end;
     stringgrid1.RowCount:=stringgrid1.RowCount-1;
     stringgrid2.RowCount:=stringgrid2.RowCount-1;
   end
   else
   begin
     Exit;
   end;
  end;
  for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
  begin
   stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
   stringgrid2.Rows[i].Text:=stringgrid2.Rows[i+1].Text;
  end;
 stringgrid1.RowCount:=stringgrid1.RowCount-1;
 stringgrid2.RowCount:=stringgrid2.RowCount-1;
 if stringgrid1.RowCount=2 then
 begin
  edit17.Enabled:=true;
  bitbtn1.Enabled:=true;
  bitbtn2.Enabled:=true;
  BitBtn3.Enabled:=True;
 end;
end;

procedure TForm_PackList.BtnCloseClick(Sender: TObject);
begin
 //dm.ADO529.Cancel;
 Close;
end;

procedure TForm_PackList.BtnSaveClick(Sender: TObject);
var
i:word;
begin
 if not (edit1.Text[length(trim(edit1.Text))] in ['0'..'9']) then
  begin
   messagedlg('发货通知单编号是最后一位必需是一个整数!',mtinformation,[mbok],0);
   exit;
  end;

 if stringgrid1.RowCount=2 then
  begin
   messagedlg('至少需要一个装运指派!',mtinformation,[mbok],0);
   exit;
  end;
  
 if Self.ade_flag=1 then //新增的话要判断编号是否重复
   begin
    if self.find_soerror(trim(edit1.Text)) then
    if messagedlg('发货通知单编号重复,可能有多台计算机同时新增,是否自动更新编号?',
      mtConfirmation,[mbYes,mbNo],0)=mrYes  then
      begin
       dm.ado04.Close;
       dm.ado04.Parameters[0].Value:='data0529';
       dm.ado04.Open;
       edit1.Text:=dm.ado04SEED_VALUE.Value;
      end
    else
    begin
     edit1.SetFocus;
     exit;
    end;
   end;

 dm.ADOConnection1.BeginTrans;

if dm.ADO529.State=dsinsert then  //如果新增装箱单
 begin
  try
   dm.ADO529shipadvice_no.Value:=Edit1.Text;
   dm.ADO529TDATE.Value:=getsystem_date(dm.ADOQuery1,0); //创建日期赋值(长格式)
   DM.ADO529DEPA_DATE.Value:=StrToDate(MaskEdit1.Text);//发货日期赋值(短格式)
   DM.ADO529empl_ptr.AsString:=user_ptr;
   dm.ADO529SHIP_ADDR_PTR.Value:=rkey12;
   dm.ADO529ATTN.Value:=Edit2.Text;
   dm.ADO529ATTN1.Value:=Edit3.Text;
   dm.ADO529ATTN_CC.Value:=Edit4.Text;
   dm.ADO529ADV_FROM.Value:=Edit5.Text;
   dm.ADO529ADV_FROM_CC.Value:=Edit6.Text;
   dm.ADO529SHIP_FROM.Value:=Edit7.Text;
   dm.ADO529FAX_NO.Value:=Edit8.Text;
   dm.ADO529FLIGHT_NO.Value:=ComboBox1.Text;
   dm.ADO529curr_ptr.Value:=Edit9.Tag;
   dm.ADO529invoice_no.Value:=Edit10.Text;
   DM.ADO529ORIG_CUSTOMER.Value:=Edit11.Text;
   dm.ADO529.Post;
   update04('data0529');//更新控制码

   for i:=1 to stringgrid2.RowCount-2 do
   begin
    add_pack_list(i,strtoint(stringgrid2.Cells[0,i])); //增加发货单明细表
   end;
   dm.ADOConnection1.CommitTrans;
   rkey529:=dm.ADO529RKEY.Value;
   dm.ADS529.Close;
   dm.ADS529.Open;
   dm.ADS529.Locate('rkey',rkey529,[]);
   ModalResult:=mrOk;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     screen.Cursor:=crdefault;
     messagedlg(E.Message,mterror,[mbcancel],0);
     exit;
    end;
  end;
 end
else   //如果是编辑以前的装箱单
 begin
  try
   DM.ADO529SHIP_ADDR_PTR.Value:=rkey12;
   dm.ADO529ATTN.Value:=Edit2.Text;
   dm.ADO529ATTN1.Value:=Edit3.Text;
   dm.ADO529ATTN_CC.Value:=Edit4.Text;
   dm.ADO529ADV_FROM.Value:=Edit5.Text;
   dm.ADO529ADV_FROM_CC.Value:=Edit6.Text;
   dm.ADO529SHIP_FROM.Value:=Edit7.Text;
   dm.ADO529FAX_NO.Value:=Edit8.Text;
   dm.ADO529DEPA_DATE.Value:=StrToDate(MaskEdit1.Text);
   dm.ADO529FLIGHT_NO.Value:=ComboBox1.Text;
   dm.ADO529curr_ptr.Value:=Edit9.Tag;
   dm.ADO529invoice_no.Value:=Edit10.Text;
   dm.ADO529ORIG_CUSTOMER.Value:=Edit11.Text;
   dm.ADO529.Post;
   with DM.ADOQuery1 do
   begin
     Close;
     SQL.Clear;
     sql.Add('select rkey64_ptr,quan_declare,cartons_no from data0530 where rkey529_ptr='+dm.ADS529RKEY.AsString);
     Open;
     First;
     while not Eof do//修改64表已报关数量和总箱数
     begin
       with dm.ADOQuery2 do
       begin
         Close;
         SQL.Clear;
         sql.Add('update data0064 set rkey529_ptr=rkey529_ptr-');
         SQL.Add(IntToStr(dm.ADOQuery1.FieldValues['quan_declare']));
         SQL.Add(',cartons_no=cartons_no+');
         SQL.Add(IntToStr(dm.ADOQuery1.FieldValues['cartons_no']));
         SQL.Add('where rkey='+IntToStr(dm.ADOQuery1.FieldValues['rkey64_ptr']));
         ExecSQL;
       end;
       Next;
     end;
   end;
   with DM.ADOQuery1 do //删除相关530记录
   begin
    Close;
    sql.Clear;
    SQL.Add('delete from data0530 where rkey529_ptr='+dm.ADS529RKEY.AsString);
    ExecSQL;
   end;
   for i:=1 to stringgrid2.RowCount-2 do//重新增加相关530记录
   begin
     add_pack_list(i,strtoint(stringgrid2.Cells[0,i]));
   end;
   rkey529:=dm.ADS529RKEY.Value;
   dm.ADOConnection1.CommitTrans;
   dm.ADS529.Close;
   dm.ADS529.Open;
   dm.ADS529.Locate('rkey',rkey529,[]);
   ModalResult:=mrOk;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     screen.Cursor:=crdefault;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;

 end;
end;



procedure TForm_PackList.MaskEdit1Exit(Sender: TObject);
begin
try
 strtodate(maskedit1.Text);
except
 messagedlg('输入的日期有误,请检查',mtinformation,[mbcancel],0);
 maskedit1.SetFocus;
end;
end;

procedure TForm_PackList.PopupMenu1Popup(Sender: TObject);
begin
  if BtnSave.Enabled=false then
 begin
  n1.Enabled:=false;
  n2.Enabled:=false;
 end
else
 if stringgrid1.Row=stringgrid1.RowCount-1 then
  begin
   n2.Enabled:=false;
  end
 else
  begin
   n2.Enabled:=true;
  end;
end;

procedure TForm_PackList.Edit17Enter(Sender: TObject);
begin
 (Sender as TEdit).Font.Color:=Clblue; //得到输入焦点
end;

procedure TForm_PackList.Edit17Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BtnClose') and (activecontrol.Name<>'BitBtn1') and
   (trim(Edit17.Text)<>'') then
 try
  Form_Customer:=TForm_Customer.Create(application);
  Form_Customer.MaskEdit1.Text := trim(edit17.Text);
 if Comparetext(trim(edit17.Text),trim(Form_Customer.ADOQuery1.Fieldbyname('cust_code').AsString))=0 then
   begin
    Edit17.Text := trim(Form_Customer.ADOQuery1.FieldValues['cust_code']);
    edit17.Font.Color := clwindowtext;
    Label18.Caption := Form_Customer.ADOQuery1.FieldValues['customer_name'];
    rkey10:=Form_Customer.ADOQuery1.fieldvalues['rkey'];
    Edit9.Text:=Form_Customer.ADOQuery1curr_code.Value;
    Edit9.Tag:=Form_Customer.ADOQuery1rkey01.Value;
    Label14.Caption:=Form_Customer.ADOQuery1curr_name.Value;
    with dm.ADOQuery1 do
     begin
      close;
      sql.Clear;
      sql.Add('select *');
      sql.Add('from data0012');
      sql.Add('where customer_ptr='+IntToStr(rkey10));
      sql.Add('and LANGUAGE_FLAG=''Y''');
      sql.Add('order by rkey');
      open;
      if not IsEmpty then
      begin
       Edit16.Text:=fieldvalues['location'];
       if dm.ADOQuery1.FieldByName('LOCNAME_FOR_FORM').AsVariant<>null then
       Edit2.Text:=FieldValues['LOCNAME_FOR_FORM'];
       if dm.ADOQuery1.FieldByName('MISC_BARCODE_LABLE').AsVariant<>null then
       Edit3.Text:=FieldValues['MISC_BARCODE_LABLE'];
       if dm.ADOQuery1.FieldByName('SHP_ADDR1_FOR_FORM').AsVariant<>null then
       Edit4.Text:=FieldValues['SHP_ADDR1_FOR_FORM'];
       if dm.ADOQuery1.FieldByName('COFC_FORMAT_FILENAME').AsVariant<>null then
       Edit5.Text:=FieldValues['COFC_FORMAT_FILENAME'];
       if dm.ADOQuery1.FieldByName('S3_BARCODE_LABLE').AsVariant<>null then
       Edit6.Text:=FieldValues['S3_BARCODE_LABLE'];
       if dm.ADOQuery1.FieldByName('S4_BARCODE_LABLE').AsVariant<>null then
       Edit7.Text:=FieldValues['S4_BARCODE_LABLE'];
       if dm.ADOQuery1.FieldByName('PACKGE_BARCODE_LABLE').AsVariant<>null then
       Edit8.Text:=FieldValues['PACKGE_BARCODE_LABLE'];
       rkey12:=fieldvalues['rkey'];
      end;
     end;
   end
 else
   begin
    messagedlg('请输入正确的客户代码!',mtinformation,[mbcancel],0);
    edit17.SetFocus;
   end;
 finally
  Form_Customer.free;
 end
else
if (activecontrol.Name<>'BtnClose') and (activecontrol.Name<>'BitBtn1') and
   (trim(Edit17.Text)='') then
 begin
  Label18.Caption:='';
  Edit16.Text:= '';
 end;
end;

procedure TForm_PackList.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 dm.ADO529.Cancel;
end;

procedure TForm_PackList.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if (self.ade_flag=3) or (ARow=StringGrid1.RowCount-1)then
  begin
   StringGrid1.Options:=StringGrid1.Options-[goEditing];
  end
  else
  begin
   if (acol in [4,5,7,9]) then
    StringGrid1.Options:=StringGrid1.Options+[goEditing]
   else
    StringGrid1.Options:=StringGrid1.Options-[goEditing];
  end ;
   re_calculate_qty;
   StringGrid1.Refresh;
end;

procedure TForm_PackList.StringGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (StringGrid1.Col=7) or (StringGrid1.Col=9) then
  if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort;
  if StringGrid1.Col=4 then   //修改净重
  if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
   abort
  else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',StringGrid1.Cells[4,StringGrid1.Row])>0  then abort;
  if StringGrid1.Col=5 then  //修改毛重
  if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
   abort
  else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',StringGrid1.Cells[5,StringGrid1.Row])>0  then abort;

end;

procedure TForm_PackList.StringGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (StringGrid1.col=4) and (StringGrid1.Row<>StringGrid1.RowCount-1) then
 begin
   if StringGrid1.Cells[4,StringGrid1.Row]='' then StringGrid1.Cells[4,StringGrid1.Row]:='0';
   StringGrid1.Cells[5,StringGrid1.Row]:=FloatToStr(StrToFloat(StringGrid1.Cells[4,StringGrid1.Row])+strtoint(StringGrid1.Cells[9,StringGrid1.Row])*0.5);
 end;
 if (StringGrid1.Col=7) and (StringGrid1.Row<>StringGrid1.RowCount-1) then
 begin
  if StringGrid1.Cells[7,StringGrid1.Row]='' then StringGrid1.Cells[7,StringGrid1.Row]:='0';
  if (StrToInt(StringGrid1.Cells[7,StringGrid1.row])=0) or (StrToInt(StringGrid1.Cells[7,StringGrid1.row])>StrToInt(StringGrid2.Cells[1,StringGrid1.row])) then
  StringGrid1.Cells[7,StringGrid1.row]:=StringGrid2.Cells[1,StringGrid1.row];
  StringGrid1.Cells[4,StringGrid1.Row]:=FloatToStr(StrToInt(StringGrid1.Cells[7,StringGrid1.Row])*strtofloat(StringGrid2.Cells[2,StringGrid1.Row]));
  StringGrid1.Cells[5,StringGrid1.Row]:=FloatToStr(StrToFloat(StringGrid1.Cells[4,StringGrid1.Row])+strtoint(StringGrid1.Cells[9,StringGrid1.Row])*0.5);
 end;
 if (StringGrid1.Col=9) and (StringGrid1.Row<>StringGrid1.RowCount-1) then
 begin
  if StringGrid1.Cells[9,StringGrid1.Row]='' then StringGrid1.Cells[9,StringGrid1.Row]:='0';
  StringGrid1.Cells[5,StringGrid1.Row]:=FloatToStr(StrToFloat(StringGrid1.Cells[4,StringGrid1.Row])+strtoint(StringGrid1.Cells[9,StringGrid1.Row])*0.5);
 end;
end;
function TForm_PackList.return_vifrkey(sgrid: tstringgrid;
  col: integer): string;
var
 i:integer;
 rkey_list:string;
begin
 result:='';
if sgrid.RowCount > 2 then
 begin
   rkey_list:='(';
   for i:=1 to sgrid.RowCount-2 do
     rkey_list:=rkey_list+ sgrid.Cols[col].Strings[i]+',';
   if length(rkey_list) > 1 then
    result:= copy(rkey_list,1,length(rkey_list)-1)+')'
   else
    result:='';
 end;
end;

procedure TForm_PackList.BitBtn3Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
 try
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(application);
  InputVar.Fields:='CURR_CODE/货币代码/110,CURR_NAME/货币名称/251,base_to_other/汇率/125';
  InputVar.Sqlstr:='SELECT data0001.rkey,data0001.CURR_CODE,data0001.CURR_NAME,'+#13+
  'data0001.base_to_other'+#13+
  'FROM data0001';
  InputVar.Sqlstr:=InputVar.Sqlstr+#13+
                   'order by data0001.curr_code';
  inputvar.KeyField:='CUrr_CODE';
  inputvar.InPut_value:=edit9.Text;
  InputVar.AdoConn := dm.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
   edit9.Text:=frmPick_Item_Single.adsPick.Fieldbyname('CURR_CODE').AsString;
   Label14.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('CURR_NAME').AsString;
   edit9.Tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
   rkey01:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
   stringgrid1.SetFocus;
  end
  else
   begin
    edit9.SetFocus;
   end;
  finally
   frmPick_Item_Single.adsPick.Close;
   frmPick_Item_Single.Free ;
 end; 
end;

procedure TForm_PackList.re_calculate_qty;
var
 i,quan_qty,cartons_qty:integer;
 nweight_amount,weight_amount:Extended;
begin
 nweight_amount:=0;
 weight_amount:=0;
 quan_qty:=0;
 cartons_qty:=0;

 for i:=1 to stringgrid1.RowCount-2 do
  begin
   weight_amount:=weight_amount+
              strtofloat(stringgrid1.Cells[4,i]);
   nweight_amount:=nweight_amount+strtofloat(stringgrid1.Cells[5,i]);
   quan_qty:=quan_qty+ strtoint(stringgrid1.Cells[7,i]);
   cartons_qty:=cartons_qty+ strtoint(stringgrid1.Cells[9,i]);
  end;
  StringGrid1.Cells[0,StringGrid1.RowCount-1 ] :='合计:';
  stringgrid1.Cells[4,StringGrid1.RowCount-1 ] :=FloatToStr(weight_amount) ;
  stringgrid1.Cells[5,StringGrid1.RowCount-1 ] :=FloatToStr(nweight_amount) ;
  stringgrid1.Cells[7,StringGrid1.RowCount-1 ] :=IntToStr(quan_qty) ;
  stringgrid1.Cells[9,StringGrid1.RowCount-1 ] :=IntToStr(cartons_qty) ;
end;

end.
