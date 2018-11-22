unit vmi_detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons;

type
  TForm6 = class(TForm)
    Edit6: TEdit;
    Label8: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Label12: TLabel;
    Edit3: TEdit;
    Edit10: TEdit;
    Label14: TLabel;
    Edit5: TEdit;
    Edit1: TEdit;
    Label1: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Edit11: TEdit;
    Label9: TLabel;
    Edit8: TEdit;
    Label3: TLabel;
    Edit9: TEdit;
    Label7: TLabel;
    Edit7: TEdit;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    StrGrid1: TStringGrid;
    StrGrid2: TStringGrid;
    Label13: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
  aded_flag,ttype:byte;//1按po新增,2直接新增,3编辑,4检查,5vmi新增
  po_ptr,supp_ptr,warehouse_ptr,curr_ptr,vmi_ptr:integer;
  exch_rate:double;
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses main, data_module;

{$R *.dfm}

procedure TForm6.FormCreate(Sender: TObject);
begin
 strgrid1.Cells[0,0] := '材料编码';
 strgrid1.Cells[1,0] := '材料名称';
 strgrid1.Cells[2,0] := '材料规格';
 strgrid1.Cells[3,0] := '存货单位';
 strgrid1.Cells[4,0] := '当前接收';
 strgrid1.Cells[5,0] := '仓库位置';
 strgrid1.Cells[6,0] := '详细位置';
 strgrid1.Cells[7,0] := '备注';
 strgrid1.Cells[8,0] := '有效期';
 strgrid1.Cells[9,0] := '环保标识';

 strgrid2.Cells[0,0] := '149rkey';
 strgrid2.Cells[1,0] := '17rkey';
 strgrid2.Cells[2,0] := '含税价格';
 strgrid2.Cells[3,0] := '税率';
 strgrid2.Cells[4,0] := '存货单位';
 strgrid2.Cells[5,0] := '有效期';
 strgrid2.Cells[6,0] :=  '16rkey';
 strgrid2.Cells[7,0] := '材料单重KG';
end;


procedure TForm6.FormActivate(Sender: TObject);
var
 i:word;
begin
if aded_flag=1 then //VMI新增入库
 begin
  edit11.Text:=formatdatetime('yyyy-mm-dd HH:mm:ss',form1.sys_longdate);
  dm.ado04.Open;
  if dm.ado04SEED_FLAG.Value<>1 then
   edit6.Text:=dm.ado04SEED_VALUE.Value;
  if dm.ado04SEED_FLAG.Value=4 then
   edit6.ReadOnly:=true;
  dm.ado04.Close;
end
else     //编辑检查
 begin
   dm.ado04.Close;
   dm.ado04.Open;
   if dm.ado04SEED_FLAG.Value=4 then
   edit6.ReadOnly:=true;

  edit6.Text:=dm.Aqwz456GRN_NUMBER.Value;
  edit1.Text:=dm.Aqwz456DELIVER_NUMBER.Value;
  edit2.Text:=dm.Aqwz456gon_number.Value;
  edit5.Text:=dm.Aqwz456ship_BY.Value;
  edit11.Text:=
  formatdatetime('yyyy-mm-dd HH:mm:ss',dm.Aqwz456ship_DATE.Value);
  edit9.Text:=dm.Aqwz456CODE.Value;
  label11.Caption:=dm.Aqwz456SUPPLIER_NAME.Value;
  edit8.Text:=dm.Aqwz456WAREHOUSE_CODE.Value;
  label10.Caption:=dm.Aqwz456WAREHOUSE_NAME.Value;
  edit3.Text:=dm.Aqwz456CURR_CODE.Value;
  label13.Caption:=dm.Aqwz456CURR_NAME.Value;
  edit10.Text:=dm.Aqwz456EXCH_RATE.AsString;
  curr_ptr:=dm.Aqwz456CURRENCY_PTR.Value;
  vmi_ptr:=dm.Aqwz456rkey148.Value;//VMI出仓148.rkey
  warehouse_ptr := dm.Aqwz456warehouse_ptr.Value; //工厂15.rkey
  supp_ptr := dm.Aqwz456SUPP_PTR.value;    //供应商23.rkey
  edit7.Text:=dm.Aqwz456REF_NUMBER.Value;
   strgrid1.Visible := true;
   strgrid2.Visible := false;
  dm.Aqwz22.Open;
  strgrid1.RowCount:=dm.Aqwz22.RecordCount+1;
  strgrid2.RowCount:=dm.Aqwz22.RecordCount+1;
  for i:=1 to dm.Aqwz22.RecordCount do
   begin
    strgrid1.Cells[0,i] := dm.Aqwz22INV_PART_NUMBER.Value;
    strgrid1.Cells[1,i] := dm.Aqwz22INV_NAME.Value;
    strgrid1.Cells[2,i] := dm.Aqwz22INV_DESCRIPTION.Value;
    strgrid1.Cells[3,i] := dm.Aqwz22UNIT_NAME.Value;
    strgrid1.Cells[4,i] := dm.Aqwz22QUANTITY.AsString;

    strgrid1.Cells[6,i] := dm.Aqwz22spec_place.Value;
    strgrid1.Cells[5,i] := dm.Aqwz22LOCATION.Value;
    strgrid2.Cells[4,i] := dm.Aqwz22LOCATION_PTR_FROM.AsString; //存货单位
    strgrid1.Cells[7,i] := dm.Aqwz22BARCODE_ID.Value;  //备注
    strgrid1.Cells[8,i] := dm.Aqwz22EXPIRE_DATE.AsString;    //有效期
    strgrid1.Cells[9,i] := dm.Aqwz22rohs.Value;   //环保标识
    //strgrid2.Cells[0,i] := ;     //149
    strgrid2.Cells[1,i] := dm.Aqwz22INVENTORY_PTR.AsString; //17
    strgrid2.Cells[2,i] := dm.Aqwz22PRICE.AsString;   //价格
    strgrid2.Cells[3,i] := dm.Aqwz22TAX_2.AsString;       //税率%
    strgrid2.Cells[5,i] := dm.Aqwz22EXPIRE_DATE.AsString;//有效期
    strgrid2.Cells[6,i] := dm.Aqwz22LOCATION_PTR.AsString; //位置指针
    strgrid2.Cells[7,i] := dm.Aqwz22STOCK_BASE.AsString;  //单位重量KG

    dm.Aqwz22.Next;
    dm.Aqwz22.EnableControls;
   end;
   strgrid1.SetFocus;
   strgrid1.Col:=7;
   if edit6.Enabled then edit6.SetFocus;
 end;
 end;

end.
