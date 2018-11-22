unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB, Menus;

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
    ADO53WHSE_PTR: TIntegerField;
    ADO53LOC_PTR: TIntegerField;
    ADO53WORK_ORDER_PTR: TIntegerField;
    ADO53CUST_PART_PTR: TIntegerField;
    ADO53QUANTITY: TFloatField;
    ADO53QTY_ON_HAND: TFloatField;
    ADO53QTY_ALLOC: TFloatField;
    ADO53MFG_DATE: TDateTimeField;
    ADO53RMA_PTR: TIntegerField;
    ADO53NPAD_PTR: TIntegerField;
    ADO53REFERENCE_NUMBER: TStringField;
    ADO53USER_DATE: TDateTimeField;
    ADO53barcode_ptr: TIntegerField;
    ADO53WAREHOUSE_CODE: TStringField;
    ADO53LOCATION: TStringField;
    ADO53WAREHOUSE_NAME: TStringField;
    ADO53CODE: TStringField;
    ADO53CUSTOMER_PART_NUMBER: TStringField;
    ADO53CUSTOMER_PART_DESC: TStringField;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    PopupMenu2: TPopupMenu;
    Edit9: TEdit;
    Label6: TLabel;
    CheckBox1: TCheckBox;
    Label5: TLabel;
    Label11: TLabel;
    Edit8: TEdit;
    ADO53PO_NUMBER: TStringField;
    Edit10: TEdit;
    Label12: TLabel;
    Edit11: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    ADO53cost_pcs: TFloatField;
    Label15: TLabel;
    Edit12: TEdit;
    Label_so: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Enter(Sender: TObject);
    procedure update_04(v_seed: string);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
   rkey98,rkey60,rkey50,qty_auth,qty_ship:integer;
   cost_pcs:Extended;
   function find_rmaerror(rmarkey,rmastatus:integer):boolean;
  // function find_yiqin_recdqty(so_ptr:integer):integer;
  public
    { Public declarations }
  end;
var
  Form1: TForm1;
  function Power(x, y : extended) : extended;

implementation
uses customer_search, custpart_search, edad_fg, damo, main_one, rma_search,
  sales_search,common,MyClass;

{$R *.dfm}
function TForm1.find_rmaerror(rmarkey,rmastatus: integer): boolean;
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='select rkey from data0098 WHERE Data0098.RMA_STATUS = '+inttostr(rmastatus)+
            ' and rkey='+inttostr(rmarkey);
  open;
  if not IsEmpty then      //找到退货RMA状态,表示没有错误
   result:=false
  else
   result:=true;
 end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
    if IS_FG_counting then
     ShowMsg('产成品正在盘点,操作不能进行',1)
    else

    if dm.ADO416.State = Dsinsert then
     begin
        ADO04.Close;
        ADO04.Open;

       if ADO04SEED_FLAG.Value<>1 then
        begin
           if  Edit4.Text<>ADO04SEED_VALUE.Value then
              begin
                if messagedlg('入仓单号已过期可能多人同时新增,是否自动更新编号为:'+
                  ADO04SEED_VALUE.Value,mtconfirmation,[mbyes,mbno],0)=mryes then
                  Edit4.Text:=ADO04SEED_VALUE.Value
              else
                begin
                  edit4.SetFocus;
                  exit;
                end;
              end;
        end
       else
        begin
         DM.qrytmp.SQL.Clear;
         dm.qrytmp.SQL.Text :=' select * from data0416 where number='+
                                #39+trim(edit4.Text)+#39;
         DM.qrytmp.Open;
         if not dm.qrytmp.Eof then
         begin
            messagedlg('入仓单号重复!请手工重新输入',mterror,[mbok],0);
            edit4.SetFocus;
            DM.qrytmp.Close;
            exit;
         end;
        
        end;
                                                                       //RMA待入库为2
      if (rkey98>0) and (find_rmaerror(rkey98,2)) then //新增后退货RMA状态变成3
      begin
       showmsg('保存操作失败,可能多人同时入库!',1);
       exit;
      end;
      //检查入库单号是否最新，如不是最新，获取最新


      dm.ADOConnection1.BeginTrans;
      try
      dm.ADO416number.Value := trim(edit4.Text);  //此处获取入库单号
      if edit9.Visible=true then   //退货
       dm.ADO416quantity.AsString := edit9.Text
      else
       dm.ADO416quantity.AsString := edit7.Text;
      dm.ADO416reference.Value := edit6.Text;
      if dm.ADO416type.Value = 3 then  //委外入仓
       begin
        dm.ADO416so_ptr.Value:=self.rkey60;
         with dm.ADOQuery1 do     //增加60中的提交入库数量
         begin
          close;
          sql.Text:='update data0060'+#13+
          'set REPUT_APPR_BY=isnull(REPUT_APPR_BY,0)+'+edit7.Text+#13+
          'where rkey='+inttostr(self.rkey60);
          execsql;
         end;
       end
      else
       if dm.ADO416type.Value=4 then   //退货入仓
       begin
        dm.ADO416rma_ptr.Value:=self.rkey98;
        with adoquery2 do
         begin
          close;
          sql.Clear;
          sql.Add('select rma_status,qty_recd,qty_auth,Putaway_date from data0098');
          sql.Add('where rkey='+inttostr(rkey98));
          open;
          edit;
          FieldValues['qty_recd']:=FieldValues['qty_recd']+ strtoint(trim(edit9.Text));
          FieldValues['Putaway_date']:=dm.ADO416sys_date.Value;
          if FieldValues['qty_recd'] = FieldValues['qty_auth'] then
           FieldValues['rma_status'] := 3;
          post;
         end;
        if rkey60>0 then //如果按销售订单退货
        WITH ADOQuery2 do    //更新data0060 退货数量及状态
         begin
          active:=false;
          sql.Clear;
          sql.Add('select STATUS,PARTS_returned,PARTS_ORDERED,parts_shipped,RETURNED_SHIP');
          sql.Add(' from data0060');
          sql.Add('where rkey='+inttostr(rkey60));
          active:=true;
          edit;
          fieldvalues['parts_returned'] := fieldvalues['parts_returned']+self.qty_ship; //strtofloat(edit9.Text);//修改退货数量
          if FieldValues['parts_ordered']+fieldvalues['parts_returned']>
             fieldvalues['parts_shipped']+fieldvalues['RETURNED_SHIP'] then
          if FieldValues['status']=4 then
           FieldValues['status']:=1;
           //订单为有效状态没有完成交货//由完成变成有效
          post;
          dm.ADO416so_ptr.Value:=self.rkey60;
         end;
       end;
       dm.ADO416.Post;
       self.update_04(ADO04SEED_VALUE.Value); //更新控制码 ,已04表值为准
      self.ADO53.First;
      while not ado53.Eof do
       begin
        ado53.Edit;
        ADO53NPAD_PTR.Value := dm.ADO416rkey.Value;
        if (dm.ADO416type.Value=3) and (checkbox1.Checked=true) then
         ADO53RMA_PTR.Value:=5         //委外加工退货入仓
        else
         if (dm.ADO416type.Value=3) and (checkbox1.Checked=false) then
          ADO53RMA_PTR.Value:=4;       //委外加工入仓
        ado53.Post;
        ado53.Next;
       end;
       self.ADO53.UpdateBatch();
       with dm.ADOQuery1 do     //增加25中的库数量
       begin
        close;
        sql.Text:='update data0025'+#13+
        'set Data0025.QTY_ON_HAND=Data0025.QTY_ON_HAND+d1.total_QUANTITY'+#13+
        'from data0025 inner join (select CUST_PART_PTR,sum(QTY_ON_HAND) as total_QUANTITY'+#13+
        'from data0053' +#13+
        'where data0053.NPAD_PTR='+dm.ADO416rkey.AsString +#13+
        'group by CUST_PART_PTR ) as d1 on' +#13+
        'data0025.rkey=d1.CUST_PART_PTR';
        execsql;
       end;

       if dm.ADO416type.Value = 3 then  //委外入仓
       with DM.ADOQuery1 do
       begin
         Close;
         SQL.Text :=' update data0025 set tot_accu_matl_per_sqft= '+
         '(case when data0025.unit_sq<>0 then '+FloatToStr(self.cost_pcs)+'/unit_sq  else 0 end )'+
         ' from data0416'+
         ' inner join Data0060 ON dbo.data0416.so_ptr = dbo.Data0060.RKEY '+
         ' inner join dbo.data0025 ON dbo.data0060.CUST_PART_PTR = dbo.data0025.RKEY '+
         ' where (isnull(tot_accu_matl_per_sqft,0)=0 ) and data0416.rkey= '+dm.ADO416rkey.AsString ;
         ExecSQL;
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
    else //编辑保存
     begin

      if dm.ADO416type.Value=4 then
      if find_rmaerror(dm.ADO416rma_ptr.Value,3) then
      begin
       messagedlg('不允许编辑,财务已经将退货做扣款处理!',mterror,[mbok],0);
       exit;
      end;

      if dm.find_qtyerror(dm.ADO416rkey.Value) then //库存发生变化
      begin
       showmsg('库存发生变化,不允许编辑',1);
       exit;
      end;

      dm.ADOConnection1.BeginTrans;
      try
      dm.ADO416number.Value := trim(edit4.Text);
      if edit9.Visible=true then
       dm.ADO416quantity.AsString := edit9.Text
      else
       dm.ADO416quantity.AsString := edit7.Text;
      dm.ADO416reference.Value := edit6.Text;

      if dm.ADO416type.Value=4 then  //退货入仓
       begin
        with adoquery2 do
         begin
          close;
          sql.Clear;
          sql.Add('select rma_status,qty_recd,qty_auth from data0098');
          sql.Add('where rkey='+inttostr(rkey98));
          open;
          edit;
          FieldValues['qty_recd']:=FieldValues['qty_recd'] + strtoint(trim(edit9.Text))-
          dm.AQ416quantity.Value;
          if FieldValues['qty_recd'] = FieldValues['qty_auth'] then
           FieldValues['rma_status'] := 3;
          post;
         end;
       end
      else
      if dm.ADO416type.Value=3 then  //委外加工入仓
       begin
         with dm.ADOQuery1 do     //增加60中的入库数量
         begin
          close;
          sql.Text:='update data0060'+#13+
          'set REPUT_APPR_BY=isnull(REPUT_APPR_BY,0)+'+edit7.Text+#13+
          '-'+dm.AQ416quantity.AsString+#13+
          'where rkey='+inttostr(self.rkey60);
          execsql;
         end;
       end;

       dm.ado416.Post;

       with dm.ADOQuery1 do     //减小25中的库数量
       begin
        close;
        sql.Text:='update data0025'+#13+
        'set Data0025.QTY_ON_HAND=Data0025.QTY_ON_HAND-d1.total_QUANTITY'+#13+
        'from data0025 inner join (select CUST_PART_PTR,sum(QTY_ON_HAND) as total_QUANTITY'+#13+
        'from data0053' +#13+
        'where data0053.NPAD_PTR='+dm.ADO416rkey.AsString +#13+
        'group by CUST_PART_PTR ) as d1 on' +#13+
        'data0025.rkey=d1.CUST_PART_PTR';
        execsql;
       end;
       ado53.UpdateBatch();
       with dm.ADOQuery1 do     //增加25中的库数量
       begin
        close;
        sql.Text:='update data0025'+#13+
        'set Data0025.QTY_ON_HAND=Data0025.QTY_ON_HAND+d1.total_QUANTITY'+#13+
        'from data0025 inner join (select CUST_PART_PTR,sum(QTY_ON_HAND) as total_QUANTITY'+#13+
        'from data0053' +#13+
        'where data0053.NPAD_PTR='+dm.ADO416rkey.AsString +#13+
        'group by CUST_PART_PTR ) as d1 on' +#13+
        'data0025.rkey=d1.CUST_PART_PTR';
        execsql;
       end;

      if dm.ADO416type.Value = 3 then  //委外入仓
       with DM.ADOQuery1 do
       begin
         Close;
         SQL.Text :=' update data0025 set tot_accu_matl_per_sqft= '+
         '(case when data0025.unit_sq<>0  then '+FloatToStr(self.cost_pcs)+'/unit_sq  else 0 end )'+
         ' from data0416'+
         ' inner join Data0060 ON dbo.data0416.so_ptr = dbo.Data0060.RKEY '+
         ' inner join dbo.data0025 ON dbo.data0060.CUST_PART_PTR = dbo.data0025.RKEY '+
         ' where (isnull(tot_accu_matl_per_sqft,0)=0 ) and data0416.rkey= '+dm.ADO416rkey.AsString ;
         ExecSQL;
       end;
       dm.ADOConnection1.CommitTrans;
       ModalResult := mrok;
      except
       dm.ADOConnection1.RollbackTrans;
       showmessage('数据保存失败,请检查编号是否重复,或者入仓记录删除不成功');
       edit4.SetFocus;
      end;
     end;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
 try
  form2:=tform2.Create(application);
  form2.v_type := 1;                  //表示新增
  form2.Edit9.Text := Edit11.Text;
  form2.Label12.Caption := self.Label13.Caption;
  Form2.rkey15.Caption := IntToStr(Edit11.Tag);
  if dm.ADO416type.Value=4 then     //退货入仓
   begin
    if self.rkey50>0 then
     begin
      form2.rkey50.Caption := inttostr(rkey50);
      form2.Edit2.Text := edit3.Text;
      form2.Label5.Caption := label4.Caption;

      form2.Edit2.Enabled:=false;
      form2.BitBtn5.Enabled:=false;
      form2.Edit11.Text :=edit9.Text;
      form2.Edit11.ReadOnly:=true;
     end
    else
     begin
      showmessage('请先选择退货单号RMA号吗!');
      bitbtn2.SetFocus;
      exit;
     end;
   end
  else
   if dm.ADO416type.Value=3 then    //委外加工入仓
    begin
     if self.rkey50>0 then
      begin
      form2.rkey50.Caption := inttostr(rkey50);
      form2.Edit2.Text :=edit3.Text;
      form2.Label5.Caption := label4.Caption;

      form2.Edit2.Enabled:=false;
      form2.BitBtn5.Enabled:=false;

       if
        strtoint(Edit12.Text)-strtoint(edit10.Text)-strtoint(edit7.Text)>0 then
      form2.Edit11.Text :=IntToStr(strtoint(Edit12.Text)-
                                   strtoint(edit10.Text)-
                                   strtoint(edit7.Text));
      end
     else
      begin
      showmessage('请先选择外发加工订单号!');
      bitbtn3.SetFocus;
      exit;
      end;
    end;
  if form2.ShowModal=mrok then
   begin
     if dm.ADO416type.Value=3 then
     if
      strtoint(form2.Edit11.Text)+
      strtoint(edit7.Text)+strtoint(edit10.Text)>strtoint(Edit12.Text)  then
     begin
      if Msg_Dlg_Ask('入库数量大于订单加退货数量,是否继续?','提醒',1) then
      else
      exit;
     end;

    self.ADO53.Append;
    self.ADO53WHSE_PTR.Value := strtoint(form2.rkey15.Caption);
    self.ADO53LOC_PTR.Value := strtoint(form2.rkey16.Caption);
    self.ADO53CUST_PART_PTR.Value := strtoint(form2.rkey50.Caption);
    self.ADO53QUANTITY.AsString := form2.Edit11.Text;
    self.ADO53QTY_ON_HAND.AsString :=form2.Edit11.Text;
    self.ADO53MFG_DATE.AsString := edit5.Text;
    self.ADO53NPAD_PTR.Value := dm.Ado416rkey.Value;  //主表data0416指针
    self.ADO53REFERENCE_NUMBER.Value:= form2.Edit12.Text;
    self.ADO53PO_NUMBER.Value:=edit8.Text;  //客户订单号
    Self.ADO53barcode_ptr.Value:=rkey60;      //指定的订单
    if (dm.ADO416type.Value=3) and (checkbox1.Checked=true) then
     begin
      ADO53RMA_PTR.Value:=5;         //委外加工退货入仓
      Self.ADO53cost_pcs.Value:=Self.cost_pcs;
     end
    else
     if (dm.ADO416type.Value=3) and (checkbox1.Checked=false) then
     begin
      ADO53RMA_PTR.Value:=4;       //委外加工入仓
      Self.ADO53cost_pcs.Value:=Self.cost_pcs;
     end;
    if dm.ADO416type.Value=1 then
     self.ADO53RMA_PTR.Value:=3      //3-直接入库
    else
     if dm.ADO416type.Value=4 then     //6-销售退货入仓
      self.ADO53RMA_PTR.Value:=6;

    self.ADO53.Post;

    if dm.ADO416type.Value<>4 then
     begin
      edit7.Text := inttostr(strtoint(edit7.Text)+strtoint(form2.Edit11.Text));
      if dm.ADO416type.Value=3 then bitbtn3.Enabled:=false;
     end
    else
     begin
      bitbtn2.Enabled:=false;
     end;

   end;
 finally
  form2.free;
 end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 if ADO53.IsEmpty then
  begin
   n1.Enabled := true;
   n2.Enabled := false;
   n4.Enabled := false;
  end
 else
  begin
   if dm.ADO416type.Value=4 then //如果是退货入仓
    n1.Enabled := false;

   n2.Enabled := true;
   n4.Enabled := true;
  end
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 try
  form2:=tform2.Create(application);
  form2.Edit9.Text := self.ADO53WAREHOUSE_CODE.Value;
  form2.Label12.Caption := self.ADO53WAREHOUSE_NAME.Value;
  form2.Edit10.Text := self.ADO53CODE.Value;
  form2.Label13.Caption := self.ADO53LOCATION.Value;
  form2.Edit11.Text := self.ADO53QUANTITY.AsString;
  form2.Edit12.Text := self.ADO53REFERENCE_NUMBER.Value;
  form2.rkey15.Caption := self.ADO53WHSE_PTR.AsString;
  form2.rkey16.Caption := self.ADO53LOC_PTR.AsString;
  form2.rkey50.Caption := self.ADO53CUST_PART_PTR.AsString;
  form2.Edit2.Text := self.ADO53CUSTOMER_PART_NUMBER.Value;
  form2.Label5.Caption := self.ADO53CUSTOMER_PART_DESC.Value;

  form2.edit2.Font.Color:=clwindowtext;
  form2.edit9.Font.Color:=clwindowtext;
  form2.edit10.Font.Color:=clwindowtext;
  form2.v_type:=2;
  if dm.ADO416type.Value=4 then
   begin
    form2.Edit2.Enabled:=false;
    form2.BitBtn5.Enabled:=false;
    form2.Edit11.ReadOnly:=true;
   end
  else
  if dm.ADO416type.Value=3 then
   begin
    form2.Edit2.Enabled:=false;
    form2.BitBtn5.Enabled:=false;
   end;
  if form2.ShowModal=mrok then
   begin
     if dm.ADO416type.Value=3 then
     if strtoint(edit7.Text)-ADO53QUANTITY.AsInteger+ strtoint(form2.Edit11.Text)
        +strtoint(edit10.Text)>strtoint(Edit12.Text)  then
     begin
      if Msg_Dlg_Ask('入库数量大于订单加退货数量,是否继续?','提醒',1) then
      else
       exit;
     end;

    edit7.Text := inttostr(strtoint(edit7.Text)-ADO53QUANTITY.AsInteger+
                           strtoint(form2.Edit11.Text));
    self.ADO53.Edit;
    self.ADO53WHSE_PTR.Value := strtoint(form2.rkey15.Caption);
    self.ADO53LOC_PTR.Value := strtoint(form2.rkey16.Caption);
    self.ADO53CUST_PART_PTR.Value:=strtoint(form2.rkey50.Caption);
    ADO53QTY_ON_HAND.Value :=ADO53QTY_ON_HAND.Value+strtofloat(form2.Edit11.Text)-
    self.ADO53QUANTITY.Value;
    self.ADO53QUANTITY.AsString := form2.Edit11.Text;
    self.ADO53REFERENCE_NUMBER.Value:= form2.Edit12.Text;
    self.ADO53.Post;
   end;
 finally
  form2.free;
 end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
if (messagedlg('您确定要删除该条入仓记录吗?',mtconfirmation,[mbyes,mbno],0)=mryes) and
   (self.ADO53QUANTITY.Value=self.ADO53QTY_ON_HAND.Value) then
 begin
  if dm.ADO416type.Value = 3 then
   begin
    edit7.Text := inttostr(strtoint(edit7.Text)-ADO53QUANTITY.AsInteger);
   end;
  ADO53.Delete;
  if ADO53.IsEmpty then
   if dm.ADO416type.Value=3  then  //委外入库
    BitBtn3.Enabled:=True
   else
     bitbtn2.Enabled:=true;
 end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
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
  if self.ADO04SEED_FLAG.Value=4 then
  edit4.ReadOnly:=true;

 end
else    //编辑 or检查
 begin
  edit4.Text := dm.ADO416number.Value;
  edit6.Text := dm.ADO416reference.Value;
  edit5.Text := dm.ADO416sys_date.AsString;
  if edit9.Visible=true then
   edit9.Text:= dm.ADO416quantity.AsString
  else
   edit7.Text :=dm.ADO416quantity.AsString;

  if dm.ADO416type.Value=4 then //退货
   begin
    edit1.Text := dm.AQ416RMA_NUMBER.Value;
    self.rkey98 := dm.ADO416rma_ptr.Value;
    self.rkey60 := dm.ADO416so_ptr.Value;
    self.rkey50 := self.ADO53CUST_PART_PTR.Value;
    
    edit3.Text := self.ADO53CUSTOMER_PART_NUMBER.Value;
    label4.Caption := self.ADO53CUSTOMER_PART_DESC.Value;

    edit7.Text := inttostr(dm.AQ416qty_recd.Value-dm.AQ416quantity.Value);
    self.qty_auth:=dm.AQ416qty_auth.Value-dm.AQ416qty_recd.Value+dm.AQ416quantity.Value;

    edit8.Text := dm.AQ416po_number.Value;
    Edit11.Text :=self.ADO53WAREHOUSE_CODE.Value;
    Label13.Caption:= self.ADO53WAREHOUSE_NAME.Value;
    Label_so.Caption:= dm.AQ416SALES_ORDER.Value;
     with dm.ADOQuery1 do
      begin
       close;
       sql.Text:='select data0023.abbr_name from data0060 inner join data0023 '+
                 'on Data0060.supplier_ptr = Data0023.RKEY '+
                 'where Data0060.SALES_ORDER='+quotedstr(Label_so.Caption);
       open;
       if not IsEmpty then
        label5.Caption:=fieldbyname('abbr_name').AsString;
      end;
   end
  else
   if dm.ADO416type.Value=3 then    //委外
    begin
     edit2.Text := dm.AQ416SALES_ORDER.Value;
     edit8.Text := dm.AQ416po_number.Value;
     with dm.ADOQuery1 do
      begin
       close;
       sql.Text:='select data0023.abbr_name from data0060 inner join data0023 '+
                 'on Data0060.supplier_ptr = Data0023.RKEY '+
                 'where Data0060.SALES_ORDER='+quotedstr(edit2.Text);
       open;
       if not IsEmpty then
        label5.Caption:=fieldbyname('abbr_name').AsString;
      end;
     self.rkey60 := dm.ADO416so_ptr.Value;
     self.rkey50 := self.ADO53CUST_PART_PTR.Value;
     Self.cost_pcs:=Self.ADO53cost_pcs.Value;
     edit3.Text := self.ADO53CUSTOMER_PART_NUMBER.Value;
     label4.Caption := self.ADO53CUSTOMER_PART_DESC.Value;
     Edit11.Text := self.ADO53WAREHOUSE_CODE.Value;
     Label13.Caption := self.ADO53WAREHOUSE_NAME.Value;
     if dm.ADO416.State=Dsedit then //如果是编辑
      edit10.Text:= inttostr(dm.AQ416REPUT_APPR_BY.Value-strtoint(edit7.Text))
     else
      edit10.Text:= inttostr(dm.AQ416REPUT_APPR_BY.Value);
     Edit12.Text:= dm.AQ416parts_order.AsString; 
     checkbox1.Visible:=true;
     if self.ADO53RMA_PTR.Value=5 then checkbox1.Checked:=true;
    end
   else
    begin
      Edit11.Text :=self.ADO53WAREHOUSE_CODE.Value;
      Label13.Caption:= self.ADO53WAREHOUSE_NAME.Value;
    end;
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

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
form3:=tform3.Create(application);
if form3.ADOQuery1.IsEmpty then
 showmessage('没有等待入仓的退货单!')
else
if form3.ShowModal=mrok then
 begin
  edit1.Text := form3.ADOQuery1rma_number.Value;
  edit3.Text := form3.ADOQuery1manu_part_number.Value;
  Edit8.Text:=form3.ADOQuery1PO_NUMBER.Value;
  label4.Caption := form3.ADOQuery1manu_PART_DESC.Value;
  self.rkey98 := form3.ADOQuery1rkey.Value;
  self.rkey60 := form3.ADOQuery1so_ptr.Value;
  self.rkey50 := form3.ADOQuery1customer_part_ptr.Value;
  edit7.Text := form3.ADOQuery1qty_recd.AsString;
  edit9.Text := inttostr(form3.ADOQuery1QTY_AUTH.Value-form3.ADOQuery1qty_recd.Value);
  qty_ship := form3.ADOQuery1qty_ship.Value;   //需补交数量
  qty_auth := form3.ADOQuery1QTY_AUTH.Value-form3.ADOQuery1qty_recd.Value;
  Edit11.Tag:= Form3.ADOQuery1rkey15.Value;
  Edit11.Text:= Form3.ADOQuery1ware_code.Value;
  label13.Caption:= Form3.ADOQuery1abbrname.Value;
  Label_so.Caption:=Form3.ADOQuery1sales_order.Value;
  Label5.Caption:=Form3.ADOQuery1abbr_23name.Value;
 end;
form3.Free;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
form4:=tform4.Create(application);
if form4.ADOQuery1.IsEmpty then
 showmessage('对不起没有找到可以入仓的外发订单!')
else
 if form4.ShowModal=mrok then
  begin

   Self.cost_pcs:=Form4.ADOQuery1cost_pcs.Value;

   edit2.Text := form4.ADOQuery1SALES_ORDER.Value;
   self.rkey50 := form4.ADOQuery1CUST_PART_PTR.Value;
   edit3.Text := form4.ADOQuery1MANU_PART_NUMBER.Value;
   label4.Caption := form4.ADOQuery1MANU_PART_DESC.Value;
   label5.Caption := form4.ADOQuery1supp_ABBRNAME.Value;
   self.rkey60 := form4.ADOQuery1RKEY.Value;
   Edit8.Text:=form4.ADOQuery1PO_NUMBER.Value;
   edit10.Text:=Form4.ADOQuery1REPUT_APPR_BY.AsString;
     //inttostr(self.find_yiqin_recdqty(rkey60));
   Edit12.Text := IntToStr(Form4.ADOQuery1PARTS_ORDERED.AsInteger+
                           Form4.ADOQuery1PARTS_RETURNED.AsInteger);
   Edit11.Tag:= Form4.ADOQuery1rkey15.Value;
   Edit11.Text:= Form4.ADOQuery1WAREHOUSE_CODE.Value;
   label13.Caption:= Form4.ADOQuery1abbrname.Value;
  end;
form4.Free;
end;

procedure TForm1.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,#13]) then abort;
end;

procedure TForm1.Edit9KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if strtoint(trim(edit9.Text))>qty_auth then
 edit9.Text := inttostr(qty_auth);
end;





end.
