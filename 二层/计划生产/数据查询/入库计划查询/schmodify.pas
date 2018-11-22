unit schmodify;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, ADODB, DBCtrls, Grids, DBGrids, Menus,
  Mask;

type
  TForm4 = class(TForm)
    aq06: TADOQuery;
    ADO360: TADOQuery;
    ADO360so_ptr: TIntegerField;
    ADO360quantity: TIntegerField;
    ADO360sch_date: TDateTimeField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    aq06RKEY: TAutoIncField;
    aq06SALES_ORDER: TStringField;
    aq06CUST_CODE: TStringField;
    aq06ABBR_NAME: TStringField;
    aq06unit_sq: TFloatField;
    aq06PO_NUMBER: TStringField;
    aq06PARTS_ORDERED: TFloatField;
    aq06qty_qianhuo: TFloatField;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DataSource2: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit13: TDBEdit;
    Label10: TLabel;
    Edit1: TEdit;
    aq06MANU_PART_NUMBER: TStringField;
    aq06MANU_PART_DESC: TStringField;
    aq06QTY_ON_HAND: TIntegerField;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation


{$R *.dfm}


procedure TForm4.BitBtn4Click(Sender: TObject);
var
 req_qty,old_qty,future_qty:integer;

begin
 req_qty:=aq06qty_qianhuo.AsInteger-aq06QTY_ON_HAND.AsInteger; //当前需要入库的总数量
 if req_qty<=0 then exit;

 future_qty:=0;         //算出今天以后需要入库的数量
 self.ADO360.DisableControls;
 self.ADO360.First;
 while not self.ADO360.Eof do
  begin
   if self.ADO360sch_date.Value>strtodate(edit1.Text) then
    future_qty:=future_qty+self.ADO360quantity.Value;
   self.ADO360.Next;
  end;

 old_qty:=req_qty-future_qty;  //当天需要入库的数量

if old_qty<=0 then
 begin
  ADO360.EnableControls;
  exit;
 end;
 self.ADO360.First;

 while not self.ADO360.Eof do
 begin
  if self.ADO360sch_date.Value<=strtodate(edit1.Text) then
   self.ADO360.Delete
  else
   self.ADO360.Next;
 end;                        //删除入库日期少于当天的入库计划

 self.ADO360.First;

 self.ADO360.InsertRecord([self.aq06RKEY.Value,
                           edit1.Text,
                           old_qty]);

 if self.aq06PARTS_ORDERED.AsInteger-future_qty-old_qty>0 then
 self.ADO360.InsertRecord([self.aq06RKEY.Value,
                           strtodate(edit1.Text)-1,
                           aq06PARTS_ORDERED.AsInteger-future_qty-old_qty]);
 self.ADO360.First;
 self.ADO360.EnableControls;
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
self.ADO360.CancelBatch();

end;

procedure TForm4.BitBtn1Click(Sender: TObject);
var
 sales_order:integer;
 qty_error:boolean;
begin
sales_order:=0;
qty_error:=false;
self.ADO360.DisableControls;
self.ADO360.First;
while not self.ADO360.Eof do
 begin
  if self.ADO360so_ptr.AsVariant=null then
   begin
    self.ADO360.Edit;
    self.ADO360so_ptr.Value:=self.aq06RKEY.Value;
   end;
  if ADO360quantity.Value<=0 then
   begin
    qty_error:=true;
    break;
   end;
  sales_order:=sales_order + ADO360quantity.Value;
  ADO360.Next;
 end;
self.ADO360.First;
self.ADO360.EnableControls;
if (qty_error) or (sales_order<>self.aq06PARTS_ORDERED.AsInteger) then
 messagedlg('计划入库的数量不能等于零,且合计数量要等于订单数量请检查!',mterror,[mbcancel],0)
else
 begin
  self.ADO360.UpdateBatch();
  messagedlg('数据保存成功!',mtinformation,[mbok],0);
  self.ModalResult:=mrok;
 end;
end;

end.
