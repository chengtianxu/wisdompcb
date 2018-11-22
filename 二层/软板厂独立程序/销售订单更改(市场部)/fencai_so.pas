unit fencai_so;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, Menus, Grids, DBGridEh;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label22: TLabel;
    DBEdit20: TDBEdit;
    Label23: TLabel;
    DBEdit21: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label15: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    SGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Label10: TLabel;
    Edit3: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit3: TDBEdit;
    DBGridEh1: TDBGridEh;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    function get_sonumber(part_ptr,po_ptr:integer; bef:string=''; isException:Boolean=False):string;
    procedure N3Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure SGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
  private
    { Private declarations }
    qty:Integer;
    function checkQty(qty: integer): Boolean;
  public
    { Public declarations }
   set_qty:integer;
  end;

var
  Form6: TForm6;

implementation

uses damo, apend_so;

{$R *.dfm}

procedure TForm6.FormActivate(Sender: TObject);
begin
 SGRID1.Cells[0,0]:='订单编号';
 sgrid1.Cells[1,0]:='订单数量SET';
 sgrid1.Cells[2,0]:='订单数量PCS';
 sgrid1.Cells[3,0]:='客户交期';
 sgrid1.Cells[4,0]:='装运交期';
 set_qty:=dm.ADOQuery3set_qty.Value;
 qty:=0;
 with DM.aq360 do
 begin
   Close;
   Parameters.ParamByName('rkey60').Value:= dm.ADO60RKEY.Value;
   Open;
 end;
end;

function TForm6.get_sonumber(part_ptr, po_ptr: integer; bef:string=''; isException:Boolean=False): string;
var
 v_so:string;
 v_row:integer;
begin
  with dm.ADOQuery2 do
   begin
     if active=true then active:=false;
     sql.Clear;
     sql.Add('select sales_order from data0060');
     sql.Add('where cust_part_ptr='+inttostr(part_ptr));
     if isException then
       sql.Add('and sales_order like '''+bef+'%''')
     else
       sql.Add('and purchase_order_ptr='+inttostr(po_ptr));
     sql.Add('order by sales_order desc');
     active:=true;
  if not IsEmpty then      //如果同一采购号同一部品以前卖过so从自身取值
   begin                                         //上一次采购订单/部件价格
    v_so:=copy(fieldvalues['sales_order'],1,pos('-',fieldvalues['sales_order'])-1);
    if sgrid1.RowCount=2 then
     begin
      v_row := strtoint(trim(copy(fieldvalues['sales_order'],//取后缀
             pos('-',fieldvalues['sales_order'])+1,2)))+1;
      if v_row<10 then
       get_sonumber:=v_so+'-0'+inttostr(v_row)
      else
       get_sonumber:=v_so+'-'+inttostr(v_row);
     end
    else
     begin
      v_row := strtoint(trim(copy(sgrid1.Cells[0,sgrid1.rowcount-2],//取后缀
               pos('-',sgrid1.Cells[0,sgrid1.rowcount-2])+1,2)))+1;
      if v_row<10 then
       get_sonumber:=v_so+'-0'+inttostr(v_row)
      else
       get_sonumber:=v_so+'-'+inttostr(v_row);
     end;
   end
  else
   get_sonumber:='';
   end;
end;

procedure TForm6.N1Click(Sender: TObject);
begin
  form7:=tform7.Create(application);
  form7.MaskEdit1.Text := dm.ADOQuery3ORIG_REQUEST_DATE.AsString;
  form7.MaskEdit2.Text := dm.ADOQuery3ORIG_SCHED_SHIP_DATE.AsString;
  form7.Edit1.Text :=
  get_sonumber(dm.ADOQuery3CUST_PART_PTR.Value,dm.ADOQuery3PURCHASE_ORDER_PTR.Value);
  with dm.ADOtemp60 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select SALES_ORDER from data0060 where SALES_ORDER = '''+form7.Edit1.Text+'''');
    Open;
    if RecordCount<>0 then
    begin
      //ShowMessage('存在相同的订单号');
      form7.Edit1.Text:= get_sonumber(dm.ADOQuery3CUST_PART_PTR.Value,dm.ADOQuery3PURCHASE_ORDER_PTR.Value,
                                      Copy(form7.Edit1.Text,1,Pos('-',form7.Edit1.Text)),True);
    end
  end;
  if SGrid1.RowCount-2>0 then
  begin
    qty:=qty+strtoint(sgrid1.Cells[2,sgrid1.RowCount-2]);
  end;
  Form7.qty:=DM.ADOQuery3ISSUED_QTY.AsInteger-qty;
  if form7.ShowModal = mrok then
  begin
    sgrid1.Cells[0,sgrid1.RowCount-1] := form7.Edit1.Text;
    sgrid1.Cells[1,sgrid1.RowCount-1] := form7.Edit2.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1] := form7.Edit3.Text;
    sgrid1.Cells[3,sgrid1.RowCount-1] := form7.maskEdit1.Text;
    sgrid1.Cells[4,sgrid1.RowCount-1] := form7.maskEdit2.Text;
    sgrid1.RowCount := sgrid1.RowCount+1;
    edit2.Text := inttostr(strtoint(edit2.Text)-strtoint(form7.Edit2.Text));
    edit1.Text := inttostr(strtoint(edit1.Text)-strtoint(form7.Edit3.Text));
    if not bitbtn1.Enabled then bitbtn1.Enabled := not bitbtn1.Enabled;
  end;
  form7.Free;
end;

procedure TForm6.N3Click(Sender: TObject);
var
 i:byte;
 v_so:string;
begin
  edit2.Text :=inttostr(strtoint(edit2.Text)+strtoint(sgrid1.Cells[1,sgrid1.row]));
  edit1.Text :=inttostr(strtoint(edit1.Text)+strtoint(sgrid1.Cells[2,sgrid1.row]));
 if sgrid1.Row=sgrid1.RowCount-2 then //如果是最后一行
  sgrid1.Rows[sgrid1.row].Clear
 else                                          //如果删除中间行下面的so号要改
  for i:= sgrid1.row to sgrid1.RowCount-2 do
   begin
    v_so:=sgrid1.Cells[0,i];
    sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
    if i<>sgrid1.RowCount-2 then sgrid1.Cells[0,i]:=v_so;
   end;
  sgrid1.RowCount:=sgrid1.RowCount-1;
  if sgrid1.RowCount=2 then bitbtn1.Enabled:=not bitbtn1.Enabled;
end;

procedure TForm6.PopupMenu1Popup(Sender: TObject);
begin
 if sgrid1.Row=sgrid1.RowCount-1 then
  begin
   n2.Enabled:=false;
   n3.Enabled:=false;
  end
 else
  begin
   n2.Enabled:=true;
   n3.Enabled:=true;
  end;
end;

procedure TForm6.N2Click(Sender: TObject);
var
 set_qty,pcs_qty:integer;
begin
form7 := tform7.Create(application);
form7.Edit1.Text := sgrid1.Cells[0,sgrid1.row];
form7.Edit2.Text := sgrid1.Cells[1,sgrid1.Row];
form7.Edit3.Text := sgrid1.Cells[2,sgrid1.Row];
form7.MaskEdit1.Text := sgrid1.Cells[3,sgrid1.row];
form7.MaskEdit2.Text := sgrid1.Cells[4,sgrid1.row];
set_qty := strtoint(sgrid1.Cells[1,sgrid1.Row]);
pcs_qty := strtoint(sgrid1.Cells[2,sgrid1.Row]);
if form7.ShowModal = mrok then
 begin
  sgrid1.Cells[0,sgrid1.Row] := form7.Edit1.Text;
  sgrid1.Cells[1,sgrid1.Row] := form7.Edit2.Text;
  sgrid1.Cells[2,sgrid1.Row] := form7.Edit3.Text;
  sgrid1.Cells[3,sgrid1.Row] := form7.maskEdit1.Text;
  sgrid1.Cells[4,sgrid1.Row] := form7.maskEdit2.Text;
  edit2.Text := inttostr(strtoint(edit2.Text)-strtoint(form7.Edit2.Text)+set_qty);
  edit1.Text := inttostr(strtoint(edit1.Text)-strtoint(form7.Edit3.Text)+pcs_qty);
 end;
form7.Free;
end;

procedure TForm6.SGrid1DblClick(Sender: TObject);
begin
if sgrid1.Row<>sgrid1.RowCount-1 then n2click(sender);
end;

procedure TForm6.BitBtn1Click(Sender: TObject);
begin
  with dm.ADOQuery1 do
   begin
     Close;
     sql.Text:='select PARTS_SHIPPED,RETURNED_SHIP,ISSUED_QTY from data0060'+
               ' where rkey='+dm.ADO60RKEY.AsString;
     open;
   end;
  if (dm.ADOQuery1.FieldByName('PARTS_SHIPPED').AsInteger<>dm.ADO60PARTS_SHIPPED.Value) or
     (dm.ADOQuery1.FieldByName('RETURNED_SHIP').AsInteger<>dm.ADO60RETURNED_SHIP.Value) or
     (dm.ADOQuery1.FieldByName('ISSUED_QTY').AsInteger<>dm.ADO60ISSUED_QTY.Value) then
   begin
    showmessage('原订单送货数量,投产数量发生变化不能拆分,请刷新数据!');
    sgrid1.SetFocus;
   end
  else
  if strtoint(edit1.Text)<dm.ADOQuery3PARTS_SHIPPED.AsInteger then
   begin
    showmessage('原订单数量PCS不能小于已装运数量!');
    sgrid1.SetFocus;
   end
  else if checkQty(StrToInt(Edit1.Text)) then
  begin
   showmessage('原订单数量PCS与完工数量不一致');
   DBGridEh1.SetFocus;
  end
  else IF messagedlg('订单拆分将会是不可逆操作你确定吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
    form6.ModalResult:=mrok;
end;

function TForm6.checkQty(qty: integer): Boolean;
var
  n:Integer;
begin
  n:= 0;
  if ((dm.aq360.Active) and (dm.aq360.RecordCount > 0)) then
  with dm.aq360 do
  begin
    DisableControls;
    try
      First;
      while not Eof do
      begin
        n:= n + FieldByName('quantity').AsInteger;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;
  if qty <> n then Result:= True
  else Result:= False;
end;

procedure TForm6.MenuItem1Click(Sender: TObject);
begin
  dm.aq360.Delete;
end;

end.
