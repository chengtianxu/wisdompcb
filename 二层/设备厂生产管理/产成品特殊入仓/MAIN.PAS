unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB, Menus,math,common,ExtCtrls;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    ADO53: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    ADO04: TADOQuery;
    ADO04SEED_VALUE: TStringField;
    ADO04SEED_FLAG: TWordField;
    Edit4: TEdit;
    Label7: TLabel;
    BitBtn4: TBitBtn;
    Edit5: TEdit;
    Label8: TLabel;
    Edit6: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Edit7: TEdit;
    ADO53RKEY: TIntegerField;
    ADO53LOC_PTR: TIntegerField;
    ADO53CUST_PART_PTR: TIntegerField;
    ADO53NPAD_PTR: TIntegerField;
    ADO53REFERENCE_NUMBER: TStringField;
    ADO53LOCATION: TStringField;
    ADO53CODE: TStringField;
    ADO53CUSTOMER_PART_NUMBER: TStringField;
    ADO53CUSTOMER_PART_DESC: TStringField;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn3: TBitBtn;
    PopupMenu2: TPopupMenu;
    Label3: TLabel;
    ADO53unit_name: TStringField;
    ADO53QUANTITY: TBCDField;
    Edit1: TEdit;
    ADO53PRODUCT_DESC: TStringField;
    Label4: TLabel;
    Edit3: TEdit;
    BitBtn5: TBitBtn;
    Label5: TLabel;
    ADO53price: TBCDField;
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure update_04(v_seed: string);
    procedure BitBtn3Click(Sender: TObject);
    function find_error(location_ptr,proc_ptr:integer):boolean;
    function find_avlqty(so_ptr,proc_ptr,loca_ptr:integer):string;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  function Power(x, y : extended) : extended;
implementation
uses  custpart_search, edad_fg, damo, main_one,
  sales_search, warehouse_search,Pick_Item_Single,ConstVar;

{$R *.dfm}
function TForm1.find_avlqty(so_ptr, proc_ptr, loca_ptr: integer): string;
begin
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select WZCP0063.quantity - WZCP0063.returen_qty AS qvl_qty');
   sql.Add('from WZCP0063');
   sql.Add('where so_ptr='+inttostr(so_ptr));
   sql.Add('and prod_ptr='+inttostr(proc_ptr));
   sql.Add('and location_ptr='+inttostr(loca_ptr));
   open;
  end;
 result:=dm.ADOQuery1.fieldbyname('qvl_qty').AsString;
end;

function TForm1.find_error(location_ptr, proc_ptr: integer): boolean;
begin
 Result:=false;
 if self.ADO53.Locate('LOC_PTR;CUST_PART_PTR',
 vararrayof([location_ptr,proc_ptr]),[]) then
 Result:=true;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if dm.ADO416type.Value=4 then //退货
  begin
    with dm.qry98_1 do
    begin
      close;
      DM.qry98_1.Parameters[0].Value:= Edit1.Text;
      Open;
      if RecordCount = 0 then
      begin
        ShowMessage('退货单状态有变化,请检查!');
        Exit;
      end;
    end;
    if ((Edit3.Text <> dm.qry98_1.FieldByName('dept_code').AsString) or
        (Edit7.Text <> dm.qry98_1.FieldByName('QTY_AUTH').AsString)) then
    begin
      ShowMessage('退货单有变化,请检查!');
      Exit;
    end;
  end;

  if  F_main .ExistInventory(Self.Handle,DM.ADOQuery1) then
    Exit;

  if dm.ADO416.State = Dsinsert then
  begin
    dm.ADOConnection1.BeginTrans;
    try
      if dm.ADO416type.Value=4 then
      begin
        DM.ADO416.FieldByName('dept_ptr').Value := dm.qry98rkey34.Value;
        DM.ADO416.FieldByName('so_ptr').Value := dm.qry98rkey70.Value;
        DM.ADO416.FieldByName('rma_ptr').Value := dm.qry98rkey.Value;
      end;
      dm.ADO416number.Value := trim(edit4.Text);
      dm.ADO416quantity.AsString := edit7.Text;
      dm.ADO416reference.Value := edit6.Text;
      dm.ADO416sys_date.Value:=common.getsystem_date(dm.ADOQuery1,0);
      dm.ADO416.Post;
      self.update_04(dm.ADO416number.Value); //更新控制码

      self.ADO53.First;
      while not ado53.Eof do
      begin
        ado53.Edit;
        ADO53NPAD_PTR.Value := dm.ADO416rkey.Value;
        ado53.Post;
        dm.ADOSupdate.Close;
        dm.ADOSupdate.Parameters.ParamByName('@PROC_PTR').Value:=self.ADO53CUST_PART_PTR.Value;
        dm.ADOSupdate.Parameters.ParamByName('@LOCATION_PTR').Value:=self.ADO53LOC_PTR.Value;
        dm.ADOSupdate.Parameters.ParamByName('@IN_QTY').Value:=self.ADO53QUANTITY.Value;
        dm.ADOSupdate.Parameters.ParamByName('@price').Value:=self.ADO53price.Value;
        dm.ADOSupdate.ExecProc;
        ado53.Next;
      end;
      self.ADO53.UpdateBatch();

      {if dm.ADO416type.Value=4 then
      with dm.ADOQuery1  do
      begin
        close;
        sql.Clear;
        sql.Add('update wzcp0063 ');
        sql.Add('set wzcp0063.returen_qty=wzcp0063.returen_qty+data0053.QUANTITY ');
        sql.Add('FROM Data0053 INNER JOIN ');
        sql.Add('wzcp0063 ON Data0053.CUST_PART_PTR = wzcp0063.prod_ptr AND ');
        sql.add('Data0053.LOC_PTR = wzcp0063.location_ptr ');
        sql.Add('where wzcp0063.so_ptr='+dm.Ado416so_ptr.AsString);
        sql.Add(' and data0053.NPAD_PTR='+dm.ADO416rkey.AsString);
        ExecSQL;
      end; ;}

      if dm.ADO416type.Value=4 then
      with dm.ADOQuery1  do
      begin
        //更改data0098表 已接收的数量QTY_RECD为本次退货数量， 退货状态为3已入仓
        Close;
        SQL.Clear;
        SQL.Text := 'update data0098 set QTY_RECD = ' + Edit7.Text + ', RMA_STATUS=3 where rkey = ' + IntToStr(dm.qry98RKEY.Value);
        ExecSQL;

        //更改wzcp0071表 退货数量returen_qty
        Close;
        SQL.Clear;
        SQL.Text := 'update wzcp0071 set wzcp0071.returen_qty = ' + Edit7.Text + ' from wzcp0071 , wzcp0063 '
          + 'where wzcp0071.rkey=wzcp0063.cp71_ptr and wzcp0063.rkey = ' + IntToStr(dm.qry98SO_SHIP_PTR.Value);
        ExecSQL;

        // wzcp0070表  订单状态 status : 1未提交, 2待确认, 3已确认, 4已投产, 5已完成, 6被退回
       // ShowMessage(DM.qry98TNOTE_PAD_PTR.Value);
        if DM.qry98TNOTE_PAD_PTR.Value = '是' then  //允许再出货
        begin
          if DM.qry98status70.Value = 5 then        //如果销售订单状态 = 5已完成
          begin
            with DM.ADOQuery1 do     //查找订单否已投产
            begin
              Close;
              SQL.Clear;
              SQL.Text := 'select * from data0492 where SO_NO = ' + QuotedStr(DM.qry98sales_order70.value);
              Open;
              if DM.ADOQuery1.RecordCount > 0 then      //如果已投产，修改wzcp0070表 订单状态为4已投产
              begin
                Close;
                SQL.Clear;
                SQL.Text := 'update wzcp0070 set status = 4 where rkey = ' + IntToStr(DM.qry98rkey70.Value) ;
                ExecSQL;
              end
              else     //否则， 修改wzcp0070表 订单状态为3已确认
              begin
                Close;
                SQL.Clear;
                SQL.Text := 'update wzcp0070 set status = 3 where rkey = ' + IntToStr(DM.qry98rkey70.Value) ;
                ExecSQL;
              end;
            end;
          end;
        end;
      end;
      dm.ADOConnection1.CommitTrans;
      ModalResult := mrok;
    except
      on E: Exception do
      begin
        dm.ADOConnection1.RollbackTrans;
        messagedlg(E.Message,mterror,[mbcancel],0);
        edit4.SetFocus;
      end;
    end;
  end
  else //编辑
  begin
    dm.ADOConnection1.BeginTrans;
    try
      dm.ADO416number.Value := trim(edit4.Text);
      dm.ADO416quantity.AsString := edit7.Text;
      dm.ADO416reference.Value := edit6.Text;
      dm.ado416.Post;
    with dm.ADOQuery1  do
    begin
      close;
      sql.Clear;
      sql.Add('update data0008');
      sql.Add('set data0008.qty_onhand=data0008.qty_onhand-d1.total_qty');
      sql.Add('from data0008 inner join ');
      sql.Add('(select data0053.cust_part_ptr,sum(QUANTITY) as total_qty');
      sql.Add('from data0053');
      sql.Add('where data0053.NPAD_PTR='+dm.Ado416rkey.AsString);
      sql.Add('GROUP BY cust_part_ptr) d1');
      sql.Add('on data0008.rkey=d1.cust_part_ptr');
      ExecSQL;
    end;
    with dm.ADOQuery1  do
    begin
      close;
      sql.Clear;
      sql.Add('update WZCP0001');
      sql.Add('set WZCP0001.qty_on_hand=WZCP0001.qty_on_hand-data0053.QUANTITY');
      sql.Add('FROM dbo.Data0053 INNER JOIN');
      sql.Add('dbo.WZCP0001 ON dbo.Data0053.CUST_PART_PTR = dbo.WZCP0001.proc_ptr AND');
      sql.add('dbo.Data0053.LOC_PTR = dbo.WZCP0001.location_ptr');
      sql.Add('where data0053.NPAD_PTR='+dm.Ado416rkey.AsString);
      ExecSQL;
    end;
    with self.ADOQuery2 do
    begin
      close;
      sql.Clear;
      sql.Add('delete from data0053');
      sql.Add('where NPAD_PTR='+dm.ADO416rkey.AsString);
      ExecSQL;
    end;
    with self.ADOQuery2 do
    begin
      close;
      sql.Clear;
      sql.Add('select NPAD_PTR,LOC_PTR,CUST_PART_PTR,QUANTITY,REFERENCE_NUMBER,price');
      sql.Add('from data0053');
      sql.Add('where rkey is null');
      open;
    end;
    ADO53.First;
    while not ado53.Eof do
    begin
      self.ADOQuery2.AppendRecord([dm.ADO416rkey.Value,
                     self.ADO53LOC_PTR.Value,
                     self.ADO53CUST_PART_PTR.Value,
                     self.ADO53QUANTITY.Value,
                     self.ADO53REFERENCE_NUMBER.Value,
                     Self.ADO53price.Value
                     ]);

      dm.ADOSupdate.Close;
      dm.ADOSupdate.Parameters.ParamByName('@PROC_PTR').Value:=self.ADO53CUST_PART_PTR.Value;
      dm.ADOSupdate.Parameters.ParamByName('@LOCATION_PTR').Value:=self.ADO53LOC_PTR.Value;
      dm.ADOSupdate.Parameters.ParamByName('@IN_QTY').Value:=self.ADO53QUANTITY.Value;
      dm.ADOSupdate.Parameters.ParamByName('@price').Value:=self.ADO53price.Value;
      dm.ADOSupdate.ExecProc;
      ado53.Next;
    end;
      ado53.CancelBatch();  //取消绑定的修改
    with dm.ADOQuery1  do
    begin
      close;
      sql.Clear;
      sql.Add('select rkey from  WZCP0001');
      sql.Add('where qty_on_hand < 0');
      open;
    end;
    if not dm.ADOQuery1.IsEmpty then
    begin
      dm.ADOConnection1.RollbackTrans;
      showmessage('数据保存失败,编辑入库导致库存出现负数！');
      edit4.SetFocus;
      exit;
    end;
     {TODO : 编辑入库修改检查是否导致库存为负数 }
    {if dm.ADO416type.Value=4 then
    with dm.ADOQuery1  do
    begin
      close;
      sql.Clear;
      sql.Add('update wzcp0063');
      sql.Add('set wzcp0063.returen_qty=wzcp0063.returen_qty+data0053.QUANTITY');
      sql.Add('FROM Data0053 INNER JOIN');
      sql.Add('wzcp0063 ON Data0053.CUST_PART_PTR = wzcp0063.prod_ptr AND');
      sql.add('Data0053.LOC_PTR = wzcp0063.location_ptr');
      sql.Add('where wzcp0063.so_ptr='+dm.Ado416so_ptr.AsString);
      sql.Add('and data0053.NPAD_PTR='+dm.ADO416rkey.AsString);
      ExecSQL;
    end; }
    dm.ADOConnection1.CommitTrans;
    ModalResult := mrok;
    except
    on E: Exception do
    begin
      dm.ADOConnection1.RollbackTrans;
      messagedlg(E.Message,mterror,[mbcancel],0);
      edit4.SetFocus;
    end;
    end;
  end;
end;

{
type	入仓类型
	1直接入库
	2生产过数入库
	3委外加工入库
	4退货入库
	5转换入库
	6盘点入库

status	入库状态
	0:未提交
	1:待审核
	2:已入库
	3:被退回
}
procedure TForm1.N1Click(Sender: TObject);
begin
  //if (dm.ADO416warehouse_ptr.Value>0) and (dm.ADO416dept_ptr.Value>0) then //工厂和部门
  if (Trim(Edit2.Text) <> '') and (Trim(Edit3.Text) <> '')then
  begin
    if (dm.ADO416type.Value=4) and (trim(edit1.Text)='') then //退货
    begin
      messagedlg('请首先输入退货单号!!!',mtconfirmation,[mbcancel],0);
      exit;
    end;
    try
      form2:=tform2.Create(application);
      form2.v_type:=1;                  //表示新增
    if dm.ADO416type.Value=4 then
    begin
      with dm.qry98_1 do
      begin
        close;
        DM.qry98_1.Parameters[0].Value:= Edit1.Text;
        Open;
        if RecordCount = 0 then
        begin
          ShowMessage('退货单状态有变化,请检查!');
          Abort;
        end;
      end;
      form2.Edit2.ReadOnly := true;    //产品编号
      form2.Edit2.Color := cl3DLight;
      form2.BitBtn5.Visible := False;
      form2.Edit11.ReadOnly := true;
      form2.Edit11.Color := cl3DLight;
      form2.Edit4.ReadOnly := true;
      form2.Edit4.Color := cl3DLight;
      form2.label10.Caption:='退货总数:';
      form2.Edit2.Text := dm.qry98_1.FieldByName('prod_code').AsString;
      form2.Label5.Caption := dm.qry98_1.FieldByName('product_name').AsString;
      form2.Label6.Caption := dm.qry98_1.FieldByName('product_desc').AsString;
      form2.Edit1.Text := dm.qry98_1.FieldByName('unit_name').AsString;
      form2.Edit11.Text := dm.qry98_1.FieldByName('QTY_AUTH').AsString;
      form2.Edit4.Text := dm.qry98_1.FieldByName('price').AsString;
      Form2.rkey50.Caption := dm.qry98_1.FieldByName('rkey08').AsString;

      //重新赋值,避免脏读
      Edit3.Text := dm.qry98_1.FieldByName('dept_code').AsString;
      Edit3.Tag := dm.qry98_1.FieldByName('rkey34').AsInteger;
      Label5.Caption := dm.qry98_1.FieldByName('dept_name').AsString;
      Edit7.Text := dm.qry98_1.FieldByName('QTY_AUTH').AsString;
    end;
    
    if form2.ShowModal=mrok then
    begin
      if not find_error(strtoint(form2.rkey16.Caption),strtoint(form2.rkey50.Caption)) then
      begin
        self.ADO53.Append;
        self.ADO53LOC_PTR.Value := strtoint(form2.rkey16.Caption);
        self.ADO53CUST_PART_PTR.Value := strtoint(form2.rkey50.Caption);
        self.ADO53QUANTITY.AsString := form2.Edit11.Text;
        self.ADO53NPAD_PTR.Value := dm.Ado416rkey.Value;  //主表data0416指针
        self.ADO53REFERENCE_NUMBER.Value:= form2.Edit12.Text;
        self.ADO53.FieldValues['price'] := formatfloat('0.00',strtofloat(trim(form2.edit4.Text)));
        self.ADO53.Post;
        if dm.ADO416type.Value <> 4 then edit7.Text :=currtostr(strtocurr(edit7.Text)+strtocurr(form2.Edit11.Text));
        bitbtn3.Enabled:=false;
        bitbtn2.Enabled:=false;
        bitbtn5.Enabled:=false;
      end
      else
        messagedlg('同一产品同一仓库不能同时多批入仓!!',mtconfirmation,[mbcancel],0);
    end;
    finally
      form2.free;
    end;
  end
  else
    messagedlg('请首先输入工厂代码和制造部门!',mtconfirmation,[mbcancel],0);
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
  if ADO53.IsEmpty then
  begin
    n2.Enabled := false;
    n4.Enabled := false;
  end
  else
  begin
    n2.Enabled := true;
    n4.Enabled := true;
  end;
  if dm.ADO416type.Value = 4 then   //退货入仓
  begin
    if DBGrid1.DataSource.DataSet.RecordCount <= 0 then N1.Enabled := True
    else  N1.Enabled := False;
  end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 try
  form2:=tform2.Create(application);

  form2.Edit10.Text := self.ADO53CODE.Value;
  form2.Label13.Caption := self.ADO53LOCATION.Value;
  form2.Edit11.Text := self.ADO53QUANTITY.AsString;
  form2.Edit12.Text := self.ADO53REFERENCE_NUMBER.Value;
  Form2.Edit4.Text :=   self.ADO53price.AsString;

  form2.rkey16.Caption := self.ADO53LOC_PTR.AsString;
  form2.rkey50.Caption := self.ADO53CUST_PART_PTR.AsString;
  form2.Edit2.Text := self.ADO53CUSTOMER_PART_NUMBER.Value;
  form2.Label5.Caption := self.ADO53CUSTOMER_PART_DESC.Value;
  form2.Label6.Caption := self.ADO53PRODUCT_DESC.Value;
  Form2.Edit1.Text :=   self.ADO53unit_name.AsString;
  form2.edit2.Font.Color:=clwindowtext;
  form2.edit10.Font.Color:=clwindowtext;

  if dm.ADO416type.Value=4 then   //退货入仓
   begin
    form2.Edit11.Enabled:=false;
    form2.Edit11.Color:=cl3DLight;
    form2.Edit4.Enabled:=false;
    form2.Edit4.Color:=cl3DLight;
    form2.Edit2.ReadOnly:=true;
    form2.label10.Caption:='退货数量';
    form2.Edit2.ReadOnly := true;   
    form2.Edit2.Color := cl3DLight;
    form2.BitBtn5.Visible := False;
   end;
  form2.v_type:=2;  //编辑
  if form2.ShowModal=mrok then
   begin
    self.ADO53.Edit;
    self.ADO53LOC_PTR.Value := strtoint(form2.rkey16.Caption);
    self.ADO53CUST_PART_PTR.Value:=strtoint(form2.rkey50.Caption);
    edit7.Text := currtostr(strtocurr(edit7.Text)
                           -ADO53QUANTITY.value+
                           strtocurr(form2.Edit11.Text));
    self.ADO53QUANTITY.AsString := form2.Edit11.Text;
    self.ADO53REFERENCE_NUMBER.Value:= form2.Edit12.Text;
    self.ADO53price.Value := strtofloat(trim(form2.edit4.Text));
    self.ADO53.Post;
   end;
 finally
  form2.free;
 end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
if (messagedlg('您确定要删除该条入仓记录吗?',mtconfirmation,[mbyes,mbno],0)=mryes) then
 begin
  edit7.Text := currtostr(strtocurr(edit7.Text)-ADO53QUANTITY.Value);
  ADO53.Delete;
  if self.ADO53.IsEmpty then
   begin
    bitbtn3.Enabled:=true;
    bitbtn2.Enabled:=true;
    bitbtn5.Enabled:=true;
   end;
 end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
dm.aq50.Close;
dm.aq50.Open;
self.ADO53.Close;
self.ADO53.Parameters[0].Value:=dm.ADO416rkey.Value;
self.ADO53.Open;
if dm.ADO416.State=Dsinsert then //如果是新增
 begin
  ado04.Close;
  ado04.Open;
  if self.ADO04SEED_FLAG.Value<>1 then
   begin
    edit4.Text:=self.ADO04SEED_VALUE.Value;
    edit6.SetFocus;
   end;
 end
else    //编辑 or检查
 begin
  edit4.Text := dm.ADO416number.Value;
  edit6.Text := dm.ADO416reference.Value;
  //ShowMessage(dm.ADO416sys_date.AsString);
  edit5.Text := dm.ADO416sys_date.AsString;
  edit7.Text :=dm.ADO416quantity.AsString;
 end;
end;

procedure TForm1.BitBtn1Enter(Sender: TObject);
begin
if (trim(edit4.Text)='') then
 begin
  showmessage('入仓单号不能为空!');
  edit4.SetFocus;
  exit;
 end;
ado04.Close;
ado04.Open;
if (self.ADO04SEED_FLAG.Value<>1) and (not (edit4.Text[length(trim(edit4.Text))] in ['0'..'9'])) then
 begin
  messagedlg('入仓单号最后一位必需是一个整数!',mtinformation,[mbok],0);
  edit4.SetFocus;
  exit;
 end;
if self.ADO53.IsEmpty then
 begin
  messagedlg('入仓记录不能为空!',mtinformation,[mbok],0);
  dbgrid1.SetFocus;
  exit;
 end;

end;

procedure TForm1.update_04(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin
 ado04.Close;
 ado04.Open;
 if self.ADO04SEED_FLAG.Value<>1 then
 begin
 v_length := length(v_seed);
 for i := v_length downto 1 do
  if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    Ado04.Edit; //使前缀不变后缀加1
    self.ADO04SEED_VALUE.Value := new_seed;
    Ado04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
     new_seed := copy(v_last,2,v_length);
     Ado04.Edit;
     self.ADO04SEED_VALUE.Value := new_seed;
     Ado04.Post;
    end;
 end;
end;

function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
TRY
 form_wh:=tform_wh.Create(application);
 if form_wh.ADOQuery1.IsEmpty then
  begin
   Messagedlg('没有找到相关的记录!',mtinformation,[mbok],0);
  end
 else
 if form_wh.ShowModal=mrok then
  begin
   edit2.Text := form_wh.ADOQuery1.FieldValues['warehouse_code'];
   label3.Caption := form_wh.ADOQuery1.FieldValues['warehouse_name'];
   dm.ADO416warehouse_ptr.Value:=form_wh.ADOQuery1.FieldValues['rkey'];
   edit6.SetFocus;
  end;
FINALLY
 form_wh.free;
END;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
form_so:=tform_so.Create(application);
if form_so.ShowModal=mrok then
 begin
   Edit1.Text := dm.qry98.FieldValues['RMA_NUMBER'];
   Edit1.Tag := DM.qry98.FieldValues['rkey'];
   Edit3.Text := dm.qry98.FieldValues['dept_code'];
   Edit3.Tag := dm.qry98.FieldValues['rkey34'];
   Label5.Caption := dm.qry98.FieldValues['dept_name'];
   Edit7.Text := dm.qry98.FieldValues['QTY_AUTH'];   
 end;
form_so.Free;
end;



procedure TForm1.BitBtn5Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
 try
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  InputVar.Fields := 'dept_code/部门代码/200,dept_name/部门名称/250';
  InputVar.Sqlstr := 'select rkey,dept_code,dept_name from data0034 where ttype in (4,5) order by dept_code';
    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar) ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
     edit3.Text := frmPick_Item_Single.adsPick.FieldValues['dept_code'];
     Label5.Caption:=frmPick_Item_Single.adsPick.Fieldbyname('dept_name').AsString;
     dm.ADO416dept_ptr.Value:=frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      if (chr(key)='S') and (ssalt in shift) then showmessage(ADO53.SQL.Text);
end;

end.
