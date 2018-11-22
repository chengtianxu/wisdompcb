unit vmidein;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, Menus, ComCtrls, ExtCtrls, Mask, DB,
  ADODB;

type
  TForm6 = class(TForm)
    Panel1: TPanel;
    BitBtn9: TBitBtn;
    BtnSave: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label12: TLabel;
    LBwh: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    lbsup: TLabel;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    Edit3: TEdit;
    Edit6: TEdit;
    BitBtn6: TBitBtn;
    Edit7: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Label5: TLabel;
    MaskEdit2: TMaskEdit;
    SGrid2: TStringGrid;
    Label6: TLabel;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Panel3: TPanel;
    Label7: TLabel;
    Edit8: TEdit;
    SGrid1: TStringGrid;
    Label8: TLabel;
    Edit9: TEdit;
    Label11: TLabel;
    Edit10: TEdit;
    ADO149: TADOQuery;
    ADO149rkey: TAutoIncField;
    ADO149quantity: TBCDField;
    ADO149tax_price: TBCDField;
    ADO149tax_2: TBCDField;
    ADO149quan_on_hand: TBCDField;
    SGrid3: TStringGrid;
    AQ149: TADOQuery;
    AQ149rkey: TAutoIncField;
    AQ149quantity: TBCDField;
    AQ149tax_price: TBCDField;
    AQ149tax_2: TBCDField;
    AQ149quan_on_hand: TBCDField;
    Label9: TLabel;
    Edit5: TEdit;
    Lbcurr: TLabel;
    ComboBox3: TComboBox;
    ADOQuery1: TADOQuery;
    ADOQuery1price_1: TFloatField;
    ADOQuery1TAX_2: TFloatField;
    ADOQuery1tax_flag: TStringField;
    ADO149d0134_ptr: TIntegerField;
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure getlocation();
    function location_over():boolean;
    function datecheck():Boolean;
    procedure CheckBox3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure SGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnSaveClick(Sender: TObject);
    procedure data0022_post(rkey456:integer);
    procedure BtnSaveEnter(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    function find_soerror724(number:string):boolean;
    function find_soerror(number:string):boolean;
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3DropDown(Sender: TObject);
  private
    { Private declarations }
    warehouse_ptr,supply_ptr,curr_ptr,vmi_ptr,po_ptr,Sptr:integer;
    function find_rkey134():boolean;
    procedure update_04_724(v_seed: string);
    procedure update_04(v_seed:string);
  public
    { Public declarations }
    aded_flag:byte;
  end;

var
  Form6: TForm6;
implementation

uses data_module, stocksearch, supplier_search, curr_search,
  warehouse_search,common,Pick_Item_Single,ConstVar, main, ADED_RECE,
   vmipo;//vmi_list, vmi_detail;

{$R *.dfm}

procedure TForm6.FormActivate(Sender: TObject);
var
i:integer;
begin
if self.aded_flag=1 then
begin
edit4.Text:=formatdatetime('yyyy-mm-dd HH:mm:ss',common.getsystem_date(dm.ADOQuery1,0));
 dm.ado04.Close;
 dm.ado04.Open;//打开材料入库自动编号
if dm.ado04SEED_FLAG.Value<>1 then
 maskedit1.Text:=dm.ado04SEED_VALUE.Value;
if dm.ado04SEED_FLAG.Value=4 then
 maskedit1.ReadOnly:=true;

 dm.ADO04_724.Close;
 dm.ado04_724.Open;//打开VMI出库自动编号
if dm.ado04_724SEED_FLAG.Value<>1 then
 maskedit2.Text:=dm.ado04_724SEED_VALUE.Value;
if dm.ado04_724SEED_FLAG.Value=4 then
 maskedit2.ReadOnly:=true;


self.getlocation;
end;
if (self.aded_flag=2) or (self.aded_flag=3) then//编辑与检查操作操作
  begin
   dm.ado04.Close;
   dm.ado04.Open;
   if dm.ado04SEED_FLAG.Value=4 then
   maskedit1.ReadOnly:=true;
  maskedit1.Text:=dm.Aqwz456GRN_NUMBER.Value;
  edit5.Text:=dm.Aqwz456DELIVER_NUMBER.Value;
  edit10.Text:=dm.Aqwz456PO_NUMBER.Value;
  maskedit2.Text:=dm.Aqwz456gon_number.Value;
  maskedit2.Enabled:=false;
  edit9.Text:=dm.Aqwz456ship_BY.Value;
  edit4.Text:=
  formatdatetime('yyyy-mm-dd HH:mm:ss',dm.Aqwz456ship_DATE.Value);
  edit1.Text:=dm.Aqwz456CODE.Value;
  lbsup.Caption:=dm.Aqwz456SUPPLIER_NAME.Value;
  edit3.Text:=dm.Aqwz456WAREHOUSE_CODE.Value;
  lbwh.Caption:=dm.Aqwz456WAREHOUSE_NAME.Value;
  edit2.Text:=dm.Aqwz456CURR_CODE.Value;
  lbcurr.Caption:=dm.Aqwz456CURR_NAME.Value;
  edit8.Text:=dm.Aqwz456EXCH_RATE.AsString;
  edit7.Text:=dm.Aqwz456REF_NUMBER.Value;
  self.warehouse_ptr:=dm.Aqwz456warehouse_ptr.Value;
  BitBtn6.Enabled:=false;
  CheckBox3.Checked:=true;
  self.getlocation;   //得到入仓位置
   sgrid1.Visible := true;
   combobox1.Visible := true;

  dm.Aqwz22.First;
  dm.Aqwz22.DisableControls;

  self.ADO149.Close;
  self.ADO149.Parameters[0].Value:=dm.Aqwz456rkey148.Value;
  self.ADO149.Open;
  sgrid1.RowCount:=dm.Aqwz22.RecordCount+1;
  sgrid2.RowCount:=dm.Aqwz22.RecordCount+1;
  sgrid3.RowCount:=self.ADO149.RecordCount+1;

  for i:=1 to self.ADO149.RecordCount do
  begin
    sgrid3.Cells[0,i]:=self.ADO149rkey.AsString;    //149.rkey
    sgrid3.Cells[1,i]:=self.ADO149quantity.AsString;//发放数量
    sgrid3.Cells[2,i]:=self.ADO149tax_price.AsString;//价格含税
    sgrid3.Cells[3,i]:=self.ADO149tax_2.AsString;      //税率
    sgrid3.Cells[4,i]:=self.ADO149quan_on_hand.AsString;//VMI库存数量

    sgrid1.Cells[5,i]:=self.ADO149quan_on_hand.AsString;

    sgrid2.Cells[1,i] := ADO149d0134_ptr.AsString;     //134.rkey

    ado149.Next;
  end;

  for i:=1 to dm.Aqwz22.RecordCount do
   begin
    sgrid1.Cells[0,i] := dm.Aqwz22INV_PART_NUMBER.Value;
    sgrid1.Cells[1,i] := dm.Aqwz22INV_NAME.Value;
    sgrid1.Cells[2,i] := dm.Aqwz22INV_DESCRIPTION.Value;
    sgrid1.Cells[3,i] := dm.Aqwz22rohs.Value;
    sgrid1.Cells[4,i] := dm.Aqwz22UNIT_NAME.Value;
    sgrid1.Cells[6,i] := dm.Aqwz22QUANTITY.AsString;
    sgrid1.Cells[7,i] := dm.Aqwz22PRICE.AsString;  //价格含税
    sgrid1.Cells[8,i] := dm.Aqwz22TAX_2.AsString;    //税率
    sgrid1.Cells[9,i] := dm.Aqwz22LOCATION.Value;   //仓库
    sgrid1.Cells[10,i]:= dm.Aqwz22spec_place.Value;//详细位置
    sgrid1.Cells[11,i]:= dm.Aqwz22EXPIRE_DATE.AsString;//有效期
    sgrid1.Cells[12,i]:= dm.Aqwz22Tdate.AsString; //制造日期
    sgrid1.Cells[13,i]:= dm.Aqwz22BARCODE_ID.Value;//备注(生产日期)
    sgrid1.Cells[14,i]:= dm.Aqwz22SHELF_LIFE.AsString;//保存期天数
    sgrid1.Cells[15,i]:= dm.Aqwz22QUAN_RTNED_FM_FACT.AsString;//VMI入库时的价格(含税)
    SGrid1.Cells[16,i]:=dm.Aqwz22rkey391.AsString;//rkey391
    SGrid1.Cells[17,i]:=dm.Aqwz22CONVERSION_FACTOR.AsString;//转换率
    SGrid1.Cells[18,i]:=dm.Aqwz22SUPPLIER2.AsString;//制造商批号
    SGrid1.Cells[19,i]:=dm.Aqwz22ORIG_ABBRNAME.AsString;//品牌供应商

    sgrid2.Cells[0,i] := dm.Aqwz22INVENTORY_PTR.AsString; //17
    sgrid2.Cells[2,i] := dm.Aqwz22LOCATION_PTR.AsString;//位置指针
    sgrid2.Cells[3,i] := dm.Aqwz22LOCATION_PTR_FROM.AsString;//存货单位
    sgrid2.Cells[4,i] := dm.Aqwz22STOCK_BASE.AsString; //材料单重KG
    sgrid2.Cells[5,i] := dm.Aqwz22QUANTITY.AsString;  //库存可用数量
    SGrid2.Cells[6,i] := dm.Aqwz22cust_decl.AsString;//报关单号
    SGrid2.Cells[7,i] := dm.Aqwz22source_ptr.AsString;//带po材料71指针
    dm.Aqwz22.Next;
   end;


   dm.Aqwz22.First;//刷新
   dm.Aqwz22.EnableControls;

   sgrid1.SetFocus;
   sgrid1.Col:=7;
   if maskedit1.Enabled then maskedit1.SetFocus;
end;
end;

procedure TForm6.SpeedButton3Click(Sender: TObject);
begin
try
Form_supp:=TForm_supp.Create(application);
form_supp.ADOQuery1.Filter:='EDI_OUT_NEW_PO=1 ';
if form_supp.ShowModal=mrok then
begin
edit1.Text:=form_supp.ADOQuery1CODE.Value;
lbsup.Caption:=form_supp.ADOQuery1SUPPLIER_NAME.Value;
self.supply_ptr:=form_supp.ADOQuery1rkey.Value;
with dm.tmp do
begin
close;
sql.Text:='select data0001.RKEY, data0001.CURR_CODE, data0001.CURR_NAME, data0001.BASE_TO_OTHER from data0001 inner join data0023 on data0023.CURRENCY_PTR=data0001.rkey where data0023.rkey=:rkey';
dm.tmp.Parameters[0].Value:=self.supply_ptr;
open;
edit2.Text:=trim(dm.tmp.FieldValues['curr_code']);
edit2.Tag:=dm.tmp.FieldValues['rkey'];
self.curr_ptr:=dm.tmp.FieldValues['rkey'];
end;
end;
finally
form_supp.Free;
end;
end;
procedure TForm6.SpeedButton4Click(Sender: TObject);
begin
try
form_curr:=tform_curr.Create(application);
if form_curr.ShowModal=mrok then
begin
edit2.Text:=form_curr.ADOQuery1CURR_CODE.Value;
edit2.Tag:=form_curr.ADOQuery1RKEY.Value;
self.curr_ptr:=form_curr.ADOQuery1RKEY.Value;
end;
finally
form_curr.Free;
end;
end;

procedure TForm6.SpeedButton1Click(Sender: TObject);
begin
try
form_wh:=tform_wh.Create(application);
if form_wh.ShowModal=mrok then
begin
edit3.Text:=form_wh.ADOQuery1WAREHOUSE_CODE.Value;
lbwh.Caption:=form_wh.ADOQuery1WAREHOUSE_NAME.Value;
edit3.Tag:=form_wh.ADOQuery1RKEY.Value;
self.warehouse_ptr:=form_wh.ADOQuery1RKEY.Value;
self.getlocation; //得到入仓位置
end;
finally
form_wh.Free;
end;
end;




procedure TForm6.ComboBox1Change(Sender: TObject);
begin
 dm.aq16.MoveBy(combobox1.ItemIndex+1-dm.aq16.RecNo);
 sgrid1.Cells[9,sgrid1.Row]:=combobox1.Text;
 sgrid2.Cells[2,sgrid1.Row]:=dm.aq16rkey.AsString;
end;

procedure TForm6.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=112 then combobox1.DroppedDown:=true;    //f2
if key=13 then sgrid1.SetFocus;
end;

procedure TForm6.SGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (gdSelected  in State) then
 begin
  if (ACol=9) then
   begin
    ComboBox1.Left :=Rect.Left;
    ComboBox1.Top := Rect.Top;
    ComboBox1.Width := Rect.Right - Rect.Left+3;
    ComboBox1.Height := Rect.Bottom - Rect.Top;
    ComboBox1.Visible := True;
    if sgrid1.Cells[acol,arow]<>'' then
     combobox1.ItemIndex:=combobox1.Items.IndexOf(sgrid1.Cells[acol,arow])
    else
     combobox1.ItemIndex:=-1;
   end
  else
    ComboBox1.Visible :=false;
end;
if (gdSelected  in State) then
 begin
  if (ACol=10) then
   begin
    ComboBox3.Left :=Rect.Left;
    ComboBox3.Top := Rect.Top;
    ComboBox3.Width := Rect.Right - Rect.Left+3;
    ComboBox3.Height := Rect.Bottom - Rect.Top;
    ComboBox3.Visible := True;
    if sgrid1.Cells[acol,arow]<>'' then
     ComboBox3.ItemIndex:=ComboBox3.Items.IndexOf(sgrid1.Cells[acol,arow])
    else
     ComboBox3.ItemIndex:=-1;
   end
  else
    ComboBox3.Visible :=false;
end;
end;

procedure TForm6.SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
if (self.aded_flag=3) or (sgrid1.RowCount<2) then
 sgrid1.Options:=sgrid1.Options-[goEditing]
else
 if (acol<3) or (acol in [4,5,7,8,15]) then
  sgrid1.Options:=sgrid1.Options-[goEditing]
 else
  sgrid1.Options:=sgrid1.Options+[goEditing];
end;

procedure tform6.getlocation();
begin
  dm.aq16.Close;
  if checkbox3.Checked then
  dm.aq16.SQL.Text:='select rkey,LOCATION from data0016 '+
    'where LOCATION_TYPE = 0 and '+
    'whouse_ptr='+inttostr(self.warehouse_ptr)+
    ' order by rkey'
  else
  dm.aq16.SQL.Text:='select rkey,LOCATION from data0016 '+
    'where LOCATION_TYPE=0 order by rkey';
  dm.aq16.Open;
  combobox1.Items.Clear;
  while not dm.aq16.Eof do
   begin
    combobox1.Items.Add(dm.aq16LOCATION.Value);
    dm.aq16.Next;
   end;
  dm.aq16.First;

  dm.aq176.Close;
  dm.aq176.Parameters[0].Value:= dm.aq16rkey.Value;
  dm.aq176.Open;
  dm.aq176.First;
  combobox3.Items.Clear;
  while not dm.aq176.Eof do
  begin
    combobox3.Items.Add(dm.aq176LOCATION.Value);
    dm.aq176.Next;
  end;  
end;
procedure TForm6.CheckBox3Click(Sender: TObject);
begin
self.getlocation;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
sgrid1.Cells[0,0]:='材料料编码';
sgrid1.Cells[1,0]:='材料名称';
sgrid1.Cells[2,0]:='材料规格';
sgrid1.Cells[3,0]:='环保标识';
sgrid1.Cells[4,0]:='库存单位';
sgrid1.Cells[5,0]:='VMI库存数';
sgrid1.Cells[6,0]:='当前接收';
sgrid1.Cells[7,0]:='价格含税';
sgrid1.Cells[8,0]:='税率';
sgrid1.Cells[9,0]:='仓库位置';
sgrid1.Cells[10,0]:='详细位置';
sgrid1.Cells[11,0]:='有效期';
sgrid1.Cells[12,0]:='制造日期';
sgrid1.Cells[13,0]:='备注';
sgrid1.Cells[14,0]:='保存期天数';
SGrid1.Cells[15,0]:='VMI入库价格(含税)';
SGrid1.Cells[16,0]:='rkey391';
SGrid1.Cells[17,0]:='转换率';
SGrid1.ColWidths[16] := -1;
SGrid1.ColWidths[17] := -1;
SGrid1.Cells[18,0] := '批号';
SGrid1.Cells[19,0] := '品牌供应商';

sgrid2.Cells[0,0]:='17.rkey';
sgrid2.Cells[1,0]:='134.rkey';
sgrid2.Cells[2,0]:='16.rkey';
sgrid2.Cells[3,0]:='存货单位';
sgrid2.Cells[4,0]:='材料单重KG';
sgrid2.cells[5,0]:='库存可用数量';
sgrid2.Cells[6,0]:='报关单号';
SGrid2.Cells[7,0]:='71.rkey';
end;

procedure TForm6.SGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if sgrid1.Col=6 then
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
   else
  if key = chr(46) then
  begin      //判断是否重复输入小数点'.'
   if pos('.',sgrid1.Cells[6,sgrid1.Row])>0  then abort;
  end;
end;
if sgrid1.Col=7 then
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字和小数点
  abort
 else
  if key = chr(46) then
  begin      //判断是否重复输入小数点'.'
   if pos('.',sgrid1.Cells[7,sgrid1.Row])>0  then abort;
  end;
end;
if sgrid1.Col=8 then
begin
 if not (key in ['0'..'9','.',#8,#13]) then
  abort
 else
  if key = chr(46) then
  begin      
   if pos('.',sgrid1.Cells[8,sgrid1.Row])>0  then abort;
  end;
end;
if (key <> chr(9)) then    //没有按tab键
 begin
  if (sgrid1.Col=9) and (combobox1.Enabled) then
   begin
    ComboBox1.SetFocus;
    SendMessage(ComboBox1.Handle,WM_Char,word(Key),0);
   end;
 end;
if (key <> chr(9)) then    //没有按tab键
 begin
  if (sgrid1.Col=10) and (combobox3.Enabled) then
   begin
    ComboBox3.SetFocus;
    SendMessage(ComboBox3.Handle,WM_Char,word(Key),0);
   end;
 end;
end;

procedure TForm6.SGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=112) and (combobox1.Visible) then
  begin
   if combobox1.Enabled then
   begin
   combobox1.SetFocus;
   combobox1.DroppedDown:=true;
   end;
  end;
//if (key=112) and (combobox3.Visible) then
//  begin
//   if combobox3.Enabled then
//   begin
//   combobox3.SetFocus;
//   combobox3.DroppedDown:=true;
//   end;
//  end;
end;

procedure TForm6.SGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if sgrid1.Col=6 then
begin
if sgrid1.Cells[6,sgrid1.Row]='' then sgrid1.Cells[6,sgrid1.Row]:='0';
if self.aded_flag=1 then//新增时用户输入数量控制
begin
if strtofloat(sgrid1.Cells[6,sgrid1.Row])-strtofloat(sgrid1.Cells[5,sgrid1.row])>0 then
sgrid1.Cells[6,sgrid1.Row]:=sgrid1.Cells[5,sgrid1.row];
end;
if self.aded_flag=2 then //编辑时用户输入数量控制
begin
if strtofloat(sgrid1.Cells[6,sgrid1.Row])-(strtofloat(sgrid1.Cells[5,sgrid1.Row])+strtofloat(sgrid2.Cells[5,sgrid1.Row]))>0 then
sgrid1.Cells[6,sgrid1.Row]:=floattostr((strtofloat(sgrid1.Cells[5,sgrid1.Row])+strtofloat(sgrid2.Cells[5,sgrid1.Row])));
end;
end;
end;
function tform6.find_rkey134():boolean;
var
 i :integer;
begin
 result:=false;
 for i:=1 to sgrid2.RowCount-2 do
 begin
  with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Text:='select rkey from data0134'+#13+
             'where rkey ='+sgrid2.Cells[1,i]+
             'and abs(QUAN_on_hand-'+sgrid1.Cells[5,i]+') < 0.01';
   open;
  end;
  if dm.ADOQuery1.IsEmpty then
   begin
    result:=true;
    break;
   end;
 end;
end;
procedure TForm6.BtnSaveClick(Sender: TObject);
var
i:integer;
begin
//2018-03-27tang添保存之前检测是否存在截数。
  dm.tmp1.close;
  dm.tmp1.sql.Text:='select * from data0171 where status=0';
  dm.tmp1.Open;
  if not dm.tmp1.IsEmpty then
  begin
    ShowMessage('正在盘点...不能保存！');
    Exit;
  end;
//end2018-3-27
if aded_flag=1 then//新增操作
begin
 if self.find_rkey134 then
 begin
   messagedlg('物料入仓不成功，库存记录发生变化!请重新选择库存发放',mterror,[mbcancel],0);
   exit;
 end;
if self.find_soerror724(trim(maskedit2.Text)) then   //检测VMI出库编号是否重复
  if messagedlg('出库编号重复,可能有多台计算机同时新增,是否自动更新编号?',
     mtConfirmation,[mbYes,mbNo],0)=mrYes  then
   begin
    dm.ado04_724.Close;
    dm.ado04_724.Open;
    maskedit2.Text:=dm.ado04_724SEED_VALUE.Value;
   end
  else
   begin
    maskedit2.SetFocus;
    exit;
   end;
if self.find_soerror(trim(maskedit1.Text)) then    //检测正常入仓编号是否重复
  if messagedlg('入仓编号重复,可能有多台计算机同时新增,是否自动更新编号?',
     mtConfirmation,[mbYes,mbNo],0)=mrYes  then
   begin
    dm.ado04.Close;
    dm.ado04.Open;
    maskedit1.Text:=dm.ado04SEED_VALUE.Value;
   end
  else
   begin
    maskedit1.SetFocus;
    exit;
   end;
 dm.ADOConnection1.BeginTrans;
 try
  dm.ADO148.Close;//先做VMI出库操作
  dm.ADO148.Open;
  dm.ADO148.Append;
  dm.ADO148GON_NUMBER.Value:=maskedit2.Text;
  dm.ADO148REF_NUMBER.Value:=edit7.Text;  //备注
  dm.ADO148warehouse_ptr.Value:=self.warehouse_ptr;
  dm.ado148TTYPE.Value:=1;
  dm.ado148CREATE_DATE.Value:=common.getsystem_date(dm.ADOQuery1,0);         //长格式
  dm.ADO148CREATE_BY.Value:=strtoint(user_ptr);
  dm.ADO148RECD_BY.Value:=strtoint(user_ptr);
  dm.ADO148supplier_ptr.Value:=self.supply_ptr;
  dm.ADO148status.Value:=1;
  dm.ado148.Post;
  vmi_ptr:=dm.ADO148rkey.Value;

  dm.ado04_724.Close;
  dm.ado04_724.Open;
  self.update_04_724(trim(dm.ado04_724SEED_VALUE.Value));             //更新控制码
 
  dm.ado149.close;
  dm.ado149.Open;

 for i:=1 to sgrid2.RowCount-1 do
  begin
   if strtocurr(sgrid1.Cells[6,i])>0 then
   dm.ado149.AppendRecord([strtoint(sgrid2.Cells[0,i]),    //材料17.rkey
                          vmi_ptr,            //724.rkey
                          strtoint(sgrid2.Cells[1,i]),    // 134.rkey
                          strtocurr(sgrid1.Cells[6,i]),   //数量
                          0,strtofloat(sgrid1.Cells[7,i]),strtofloat(sgrid1.Cells[8,i])]); //价格含税和税率
  end;

  dm.ADO456.Close; //开始正常发料入库操作
  dm.ADO456.Parameters[0].Value:=null;
  dm.ADO456.Open;
  dm.ADO456.Append;
  dm.ADO456GRN_NUMBER.Value:=maskedit1.Text;                //入库单号
  dm.ADO456ship_BY.Value:=edit9.Text;                   //送货人员
  dm.ADO456ship_DATE.Value:=strtodatetime(edit4.Text); //送货日期
  dm.ADO456DELIVER_NUMBER.Value:=edit5.Text; //送货单号
  dm.ADO456CREATE_BY.Value:=strtoint(user_ptr);           //收货员工
  dm.ADO456CREATE_DATE.Value:=common.getsystem_date(dm.ADOQuery1,0);     //收货日期
  dm.ADO456warehouse_ptr.Value:=self.warehouse_ptr;   //工厂
  dm.ADO456SUPP_PTR.Value:=self.supply_ptr;             //供应商
  dm.ADO456REF_NUMBER.Value:=edit7.Text;              //备注
  dm.ADO456STATUS.Value:=1;                           //状态
  dm.ADO456CURRENCY_PTR.Value:=self.curr_ptr;         //货币
  dm.ADO456EXCH_RATE.AsString:=edit8.Text;           //汇率
  dm.ADO456TTYPE.Value:=5;                   //类型
  if self.po_ptr<>0 then
   dm.ADO456PO_PTR.Value:=self.po_ptr;      //采购订单指针

  dm.ADO456VMIOUT_PTR.Value:=self.vmi_ptr; //vmi出仓单指针724

  if checkbox2.Checked then
   dm.ADO456PRINTED.Value:='Y'
  else
   dm.ADO456PRINTED.Value:='N';
   dm.ADO456.Post;
   
   dm.ado04.Close;
   dm.ado04.Open;
   self.update_04(trim(dm.ado04SEED_VALUE.Value));             //更新控制码

   self.data0022_post(dm.ADO456RKEY.Value);

 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:='select data0149.D0134_PTR from data0149'+#13+
             'inner join data0134 on'+#13+
             'data0149.D0134_PTR=data0134.rkey'+#13+
             'where Data0134.QUAN_ON_HAND < Data0149.QUANTITY'+#13+
             'and data0149.gon_ptr='+dm.ado148rkey.AsString;
   open;
  end;
 if not dm.ADOQuery1.IsEmpty then
  begin
   dm.ADOConnection1.RollbackTrans;
   messagedlg('入库失败,可能多用户同时入库了同一批物料且导致库存出现负数!请重发', mterror,[mbcancel],0);
  end
 else
  begin
   with dm.ADOQuery1 do //减去VMI库存134中的库存数量
   begin
    close;
    sql.Text:='update data0134'+#13+
             'set Data0134.QUAN_ON_HAND=Data0134.QUAN_ON_HAND-Data0149.QUANTITY'+#13+
             'from data0149 inner join data0134 on'+#13+
             'data0149.D0134_PTR=data0134.rkey'+#13+
             'where data0149.gon_ptr='+dm.ado148rkey.AsString;
    execsql;
    close;
   end;
  end;  //VMI出库操作完成

   dm.ADOConnection1.CommitTrans;

   if checkbox2.Checked then
   begin
    form2.print_ininvt(dm.ADO456RKEY.Value);
   end;
   self.ModalResult:=mrOk;
 except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
     maskedit1.SetFocus;
    end;
 end;
end
else//编辑操作
begin
  if form1.find_quanhang_error(dm.Aqwz456TTYPE.Value,dm.Aqwz456RKEY.Value) then
  begin
   showmsg('入库记录发生变化或已有发放,不能再编辑!',1);
   exit;
  end;

dm.ADOConnection1.BeginTrans;
try// 出库表724不需要修改，修改无意义
   dm.ADO456.Close;
   dm.ADO456.Parameters[0].Value:=dm.Aqwz456RKEY.Value;
   dm.ADO456.Open;
   dm.ADO456.Edit;
   dm.ADO456GRN_NUMBER.Value:=maskedit1.Text;
   dm.ADO456DELIVER_NUMBER.Value:=edit5.Text;
   dm.ADO456ship_DATE.Value:=strtodatetime(edit4.text);
   dm.ADO456ship_BY.Value:=edit9.Text;
   dm.ADO456REF_NUMBER.Value:=edit7.Text;
   dm.ADO456STATUS.Value:=1;
   dm.ADO456.Post;
   with dm.ADOQuery2 do         //更新17当前库存总数据
    begin
     close;
     sql.Clear;
     sql.Add('update data0017');
     sql.Add('set data0017.QUAN_ON_HAND=data0017.QUAN_ON_HAND-d1.qty');
     sql.Add('from data0017 inner join');
     sql.Add('(select inventory_ptr,sum(quan_on_hand) as qty');
     sql.Add('from data0022');
     sql.Add('where data0022.GRN_PTR='+dm.ADO456rkey.AsString);
     sql.Add('group by inventory_ptr) d1');
     sql.Add('on data0017.rkey=d1.INVENTORY_PTR');
     ExecSQL;
    end;

    with dm.ADOQuery2 do//先删除22库存明细
    begin
     close;
     sql.Clear;
     sql.Add('delete from data0022');
     sql.Add('where data0022.GRN_PTR='+dm.ADO456rkey.AsString);
     ExecSQL;
    end;
  sgrid1.RowCount:=dm.Aqwz22.RecordCount+1;
  sgrid2.RowCount:=dm.Aqwz22.RecordCount+1;
  self.data0022_post(dm.ADO456RKEY.Value); //重新增加22库存明细
for i:=1 to sgrid2.RowCount-1 do//修改材料VMI出仓表149和库存明细134里的库存数
 begin
   with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Text:='select data0134.quan_on_hand from data0134 '+
            'inner join data0149 on data0134.rkey=data0149.d0134_ptr where data0149.rkey=:rkey149';
    Parameters[0].Value:=strtocurr(SGrid3.Cells[0,i]);
    open;
   end;
   if dm.ADOQuery1.FieldByName('quan_on_hand').AsString<>SGrid1.Cells[5,i] then
   begin
    ShowMessage('有材料库存发生变化,请退出重新编辑!');
    dm.ADOConnection1.RollbackTrans;
    exit;
   end;
   aq149.Close;
   aq149.Parameters[0].Value:=strtocurr(sgrid3.Cells[0,i]);
   aq149.Open;
   aq149.Edit;
   self.aq149QUANTITY.Value:=strtocurr(sgrid1.Cells[6,i]);
   self.Aq149tax_price.Value:=strtofloat(sgrid1.Cells[7,i]);
   self.Aq149TAX_2.Value:=strtofloat(sgrid1.Cells[8,i]);
   self.Aq149quan_on_hand.Value:=strtocurr(sgrid2.Cells[5,i])+     //库存可用数量,第一次选择VMI明细的时候，sgrid2.Cells[5,i]：=dbo.Data0134.QUANTITY。
                                 strtocurr(sgrid1.Cells[5,i])-     //VMI库存数
                                 strtocurr(sgrid1.Cells[6,i]);     //当前接收数
   aq149.Post;
 end;

  dm.ADOConnection1.CommitTrans;
  dm.Aqwz456.Close;
  dm.Aqwz456.Open;
   if checkbox2.Checked then
   begin
    form2.print_ininvt(dm.ADO456RKEY.Value);
    end;
  self.ModalResult:=mrok;
except
  on E: Exception do
   begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
     maskedit1.SetFocus;
   end;
  end;
end;//编辑完成

end;

procedure tform6.data0022_post(rkey456:integer);
VAR
i:integer;
BEGIN
  dm.ADO22.Close;
  dm.ADO22.Parameters[0].Value:=rkey456;
  dm.ADO22.Open;
  for i:=1 to sgrid1.RowCount-1 do
   if strtofloat(sgrid1.Cells[6,i])>0 then
    begin
     dm.ADO22.Append;
     dm.ADO22GRN_PTR.Value:=rkey456;     //456.rkey
     dm.ADO22INVENTORY_PTR.Value:=strtoint(sgrid2.Cells[0,i]);   //17.rkey
     dm.ADO22LOCATION_PTR.Value:=strtoint(sgrid2.Cells[2,i]);    //16.rkey
     dm.ADO22LOCATION_PTR_FROM.Value:=strtoint(sgrid2.Cells[3,i]);//存货单位

     dm.ADO22tax_PRICE.AsString:=sgrid1.Cells[7,i];           //含税价格(最新价格)
     dm.ADO22TAX_2.AsString:=sgrid1.Cells[8,i];               //税率
     dm.ADO22PRICE.Value:=dm.ADO22tax_price.Value/(1+dm.ADO22TAX_2.Value*0.01);//不含税价

     if (Trim(SGrid1.Cells[17,i])='') then SGrid1.Cells[17,i]:='1';
     dm.ADO22QUANTITY.AsString:=FloatToStr(strtofloat(sgrid1.Cells[6,i])*strToFloat(SGrid1.Cells[17,i]));       //接收数量
     dm.ADO22QUAN_ON_HAND.Value:=dm.ADO22QUANTITY.Value;   //当前库存数量
     dm.ADO22spec_place.Value:=sgrid1.Cells[10,i];       //详细位置
     dm.ADO22rohs.Value:=sgrid1.Cells[3,i];            //环保标识
     dm.ADO22BARCODE_ID.Value:=sgrid1.Cells[13,i];      //备注批次
    //20170426tang有效期天数为0，不存储有效期
    if (Trim(sgrid1.Cells[11,i])<>'') and (Trim(sgrid1.Cells[11,i])<>'0') then
     dm.ADO22EXPIRE_DATE.Value:=strtodate(sgrid1.Cells[11,i]);//有效期
     dm.ADO22TDATE.AsString:=sgrid1.Cells[12,i]; //制造日期
     dm.ADO22TTYPE.Value:=3;
     dm.ADO22STOCK_BASE.AsString:= sgrid2.Cells[4,i];  //单批重量
     dm.ADO22cust_decl.Value:=SGrid2.Cells[6,i];//报关单号
     dm.ado22QUAN_RTNED_FM_FACT.AsString:=SGrid1.Cells[15,i];//VMI入库时的价格
     dm.ADO22SOURCE_PTR.AsString:=SGrid2.Cells[7,i];//带有pO材料的71指针
     dm.ADO22D0134_PTR.AsString:=SGrid2.Cells[1,i];//134指针
     if (Trim(SGrid1.Cells[16,i])<>'') then
     dm.ADO22rkey391.AsString:=SGrid1.Cells[16,i];//rkey391
     dm.ADO22SUPPLIER2.AsString:= SGrid1.Cells[18,i];
     if Trim(SGrid1.Cells[19,i]) <> '' then
     dm.ADO22ORIG_ABBRNAME.AsString:= SGrid1.Cells[19,i];      //品牌供应商

     dm.ADO22.Post;
    end;
    with dm.ADOQuery2 do         //更新17当前库存总数据
    begin
     close;
     sql.Clear;
     sql.Add('update data0017');
     sql.Add('set data0017.QUAN_ON_HAND=data0017.QUAN_ON_HAND+d1.qty');
     sql.Add('from data0017 inner join');
     sql.Add('(select inventory_ptr,sum(quan_on_hand) as qty');
     sql.Add('from data0022');
     sql.Add('where data0022.GRN_PTR='+inttostr(rkey456));
     sql.Add('group by inventory_ptr) d1');
     sql.Add('on data0017.rkey=d1.INVENTORY_PTR');
     ExecSQL;
    end;
END;

function tform6.datecheck:Boolean;
var
  i:Word;
begin
 datecheck:=False;
  for i:=1 to SGrid1.RowCount-1 do
  begin
   if  (sgrid1.Cells[12,i]<>'') and (strtofloat(sgrid1.Cells[6,i])>0) and (StrToDate(sgrid1.Cells[12,i])>common.getsystem_date(dm.tmp,1))  then
   begin                    //制造日期不能大于当前日期
   datecheck:=true;
   break;
   end;
  end;
end;

function tform6.location_over():boolean;
var
i:word;
begin
location_over:=false;

 for i:=1 to sgrid1.RowCount-1 do
  if (sgrid1.Cells[9,i]='') and (strtofloat(sgrid1.Cells[6,i])>0) then
  begin                    //必需输入入仓位置
   location_over:=true;
   break;
  end;

 for i:=1 to sgrid1.RowCount-1 do
  if (strtofloat(sgrid1.Cells[6,i])>0) then
   begin                   //必需有一个入仓数量
    break;
   end
  else
   if (i=sgrid1.RowCount-1) then
    location_over:=true;

end;


procedure TForm6.BtnSaveEnter(Sender: TObject);
begin
if trim(maskedit1.Text)='' then
 begin
  showmessage('入库单号不允许为空!');
  maskedit1.SetFocus;
  exit;
 end;
 if self.location_over then
 begin
  showmsg('至少需要一项入仓记录并输入入仓位置!',1);
  if self.aded_flag=1 then
  begin
   sgrid1.SetFocus;
   sgrid1.Col:=9;
  end;
  exit;
 end;
 if self.datecheck then
 begin
  showmsg('至少有一项入仓记录制造日期大于当前日期,不符合要求,请修改相关制造日期!',1);
  sgrid1.SetFocus;
  sgrid1.Col:=12;
  exit;
 end;
if not dm.Ado04.Active then dm.ado04.Open;
if (dm.ado04SEED_FLAG.Value<>1) and
  (not (maskedit1.Text[length(trim(maskedit1.Text))] in ['0'..'9'])) then
 begin
  messagedlg('入库编号最后一位必需是一个整数!',mtinformation,[mbok],0);
  maskedit1.SetFocus;
  exit;
 end;
 end;

procedure TForm6.BitBtn6Click(Sender: TObject);
var i:integer;
begin
form9:=tform9.Create(application);
if Form9.ShowModal=mrok then
 begin
 try
 self.po_ptr:=form9.ADS133po_ptr.Value;
 edit1.Text:=form9.ADS133CODE.Value;
 lbsup.Caption:=form9.ADS133SUPPLIER_NAME.Value;
 self.supply_ptr:=form9.ADS133supp_ptr.Value;
 edit2.Text:=form9.ADS133CURR_CODE.Value;
 lbcurr.Caption:=form9.ADS133CURR_NAME.Value;
 self.curr_ptr:=form9.ADS133CURRENCY_PTR.Value;
 Self.Sptr:=Form9.ADS133SECOND_WHSE_PTR.AsInteger;   //vmi采购订单中价格取值方法
 edit3.Text:=form9.ADS133WAREHOUSE_CODE.Value;
 self.warehouse_ptr:=form9.ADS133WAREHOUSE_PTR.Value;
 lbwh.Caption:=form9.ADS133WAREHOUSE_NAME.Value;
 edit9.Text:=form9.ADS133SHIP_BY.Value;
 edit10.Text:=form9.ADS133PO_NUMBER.Value;
 edit5.Text:=form9.ADS133deliver_number.Value;
 edit7.Text:=form9.ADS133REF_NUMBER.Value;
 edit8.Text:=form9.ADS133EXCH_RATE.AsString;
 form9.ADO134.First;
 SGrid1.RowCount:=form9.ADO134.RecordCount+1;
 SGrid2.RowCount:=form9.ADO134.RecordCount+1;
 i:=1;
 while not form9.ADO134.Eof do
  begin
   sgrid1.Cells[0,i]:=form9.ADO134INV_PART_NUMBER.Value;
   sgrid1.Cells[1,i]:=form9.ADO134INV_NAME.Value;
   sgrid1.Cells[2,i]:=form9.ADO134INV_DESCRIPTION.Value;
   sgrid1.Cells[3,i]:=form9.ADO134rohs.Value;
   sgrid1.Cells[4,i]:=form9.ADO134UNIT_NAME.Value;
   sgrid1.Cells[5,i]:=form9.ADO134QUAN_ON_HAND.AsString;
   sgrid1.Cells[6,i]:='0';
   with ADOQuery1 do
   begin
    Close;
    Parameters[0].Value:=Self.supply_ptr;
    Parameters[1].Value:=form9.ADO134inventory_ptr.Value;
    Open;
   end;
   if Self.Sptr=0 then    //从最新价格取值
   begin
   if ADOQuery1.IsEmpty then //交付排程没找到时
   begin
    sgrid1.Cells[7,i]:=form9.ADO134TAX_PRICE.AsString;
    sgrid1.Cells[8,i]:=form9.ADO134TAX_2.AsString;
   end
   else
   begin
    if ADOQuery1tax_flag.Value='N' then  //不含税
    begin
     sgrid1.Cells[7,i]:=floattostr(ADOQuery1PRICE_1.value*(1+ADOQuery1TAX_2.Value*0.01)); //转含税价
     sgrid1.Cells[8,i]:=ADOQuery1TAX_2.AsString;
    end
    else
    begin
     sgrid1.Cells[7,i]:=ADOQuery1PRICE_1.AsString;
     sgrid1.Cells[8,i]:=ADOQuery1TAX_2.AsString;
    end;
   end;
   end
   else
   begin
    sgrid1.Cells[7,i]:=form9.ADO134TAX_PRICE.AsString;
    sgrid1.Cells[8,i]:=form9.ADO134TAX_2.AsString;
   end;
   sgrid1.Cells[9,i]:='';
   sgrid1.Cells[10,i]:='';
   sgrid1.Cells[11,i]:=form9.ADO134EXPIRE_DATE.AsString;//有效期
   sgrid1.Cells[12,i]:=form9.ADO134MANU_DATE.AsString;
   SGrid1.Cells[13,i]:=form9.ADO134BARCODE_ID.Value;
   SGrid1.Cells[14,i]:=form9.ADO134SHELF_LIFE.AsString;
   SGrid1.Cells[15,i]:=form9.ADO134TAX_PRICE.AsString; //VMI当时入库的价格
   SGrid1.Cells[16,i]:=Form9.ADO134RKEY391.AsString;//391Rkey  20170427tang添
   SGrid1.Cells[17,i]:=Form9.ADO134CONVERSION_FACTOR.AsString;//转换率 20170512tang添
   SGrid1.Cells[18,i]:=Form9.ADO134SUPPLIER3.AsString;    //生产商 批号
   SGrid1.Cells[19,i]:=Form9.ADO134ORIG_ABBRNAME.AsString;  //品牌供应商

   sgrid2.Cells[0,i]:=form9.ADO134inventory_ptr.AsString;
   sgrid2.Cells[1,i]:=form9.ADO134RKEY.AsString;
   sgrid2.Cells[3,i]:=form9.ADO134unit_ptr.AsString;
   sgrid2.Cells[4,i]:=form9.ADO134STOCK_BASE.AsString; //标准单位重量(公斤)17表
   sgrid2.Cells[5,i]:=form9.ADO134QUAN_ON_HAND.AsString;

   SGrid2.Cells[6,i]:=Form9.ADO134cust_decl.AsString;
   SGrid2.Cells[7,i]:=Form9.ADO134SOURCE_PTR.AsString; //71.rkey采购明细字段
   inc(i);
   form9.ADO134.Next;
  end;
 finally
   form9.Free;
 end;
end;
end;

procedure tform6.update_04_724(v_seed:string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin
 if dm.ado04_724SEED_FLAG.Value<>1 then
 begin
 v_length := length(v_seed);
 for i := v_length downto 1 do
  if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.ado04_724.Edit; //使前缀不变后缀加1
    dm.ado04_724SEED_VALUE.Value := new_seed;
    dm.ado04_724.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     dm.ado04_724.Edit;
     dm.ado04_724SEED_VALUE.Value := new_seed;
     dm.ado04_724.Post;
    end;
 end;
end;

function tform6.find_soerror724(number:string):boolean;
begin
 result := false;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0724');
   sql.Add('where GON_NUMBER='''+number+'''');
   open;
   if not IsEmpty then result := true;
  end;
end;

function tform6.find_soerror(number:string):boolean;
begin
 result := false;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0456');
   sql.Add('where GRN_NUMBER='''+number+'''');
   open;
   if not IsEmpty then result := true;
  end;
end;

procedure TForm6.update_04(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin
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

procedure TForm6.ComboBox3Change(Sender: TObject);
begin
 sgrid1.Cells[10,sgrid1.Row]:=combobox3.Text;
end;

procedure TForm6.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=112 then combobox3.DroppedDown:=true;    //f2
if key=13 then sgrid1.SetFocus;
end;

procedure TForm6.ComboBox3DropDown(Sender: TObject);
begin
  dm.aq176.Close;
  dm.aq176.Parameters[0].Value:= dm.aq16rkey.Value;
  dm.aq176.Open;
  dm.aq176.First;
  combobox3.Items.Clear;
  while not dm.aq176.Eof do
  begin
    combobox3.Items.Add(dm.aq176LOCATION.Value);
    dm.aq176.Next;
  end;
end;

end.
