unit edit_add_po;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, Grids, DBGrids, Mask,
  DBCtrls, Menus, DB, ADODB;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    TC1: TTabControl;
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Button2: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBText1: TDBText;
    Bevel1: TBevel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    BitBtn8: TBitBtn;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit15: TDBEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    Edit4: TEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit18: TDBEdit;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    DBGrid2: TDBGrid;
    PopupMenu3: TPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    DBEdit13: TDBEdit;
    Label17: TLabel;
    Edit7: TEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label20: TLabel;
    Label22: TLabel;
    Label27: TLabel;
    DBEdit14: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    Label29: TLabel;
    BitBtn6: TBitBtn;
    ComboBox1: TComboBox;
    Label28: TLabel;
    DBCheckBox2: TDBCheckBox;
    DBRadioGroup2: TDBRadioGroup;
    Label30: TLabel;
    dbchk_CP: TDBCheckBox;
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);

    procedure change_seed_value(po_number:string);
    procedure change_tax_total();
    procedure change_sim_tax_total();
    procedure change72_sim_tax_total();
    procedure change_data0070(rkey70:integer);
    procedure change_data0071(rkey70:integer);
    procedure change_data0072(rkey70:integer);
    procedure add_misc_visible();
    procedure update_data0028();
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    function find_supplier(supplier_name:string;curr_ptr:integer):boolean;
    function find_po_error():boolean;
    function find_pr_number():boolean;
    function invtory_type(invt_ptr:string):string;
    procedure save_cate_note(adoquery:TADOQuery;source_type:integer;var_caption:string);
    procedure TC1Change(Sender: TObject);
    procedure DBEdit9KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit9KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit9Click(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure DBEdit11Click(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DBEdit13Click(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
    procedure DBEdit12Click(Sender: TObject);
    procedure DBEdit15Exit(Sender: TObject);
    procedure DBEdit15Click(Sender: TObject);
    procedure BitBtn2Enter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEdit16Exit(Sender: TObject);
    procedure TC1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure BitBtn6Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBCheckBox2Click(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit1Exit(Sender: TObject);
    procedure dbchk_CPClick(Sender: TObject);
  private
    { Private declarations }
   v_close:byte;
   procedure get_approve_type(rkey15:Integer);
   procedure update_69_204(rkey:integer;v_type:Byte);
   procedure update_69_68(rkey70:Integer);
   procedure update_69_68_post(rkey70: Integer);
   procedure update_204_68(rkey70: Integer);
   procedure update_204_68_post(rkey70: Integer);
   procedure po_value();
   procedure add_0070(); //手工直接新增
   procedure add_0071();
   procedure add_0072();
   procedure append_0070();
   procedure append_0071();  //从PR导入新增
   procedure append_0072();

   procedure appendprlist_0070();
  public
    { Public declarations }
   po_type:char;      //手工新增的采购订单类型
   v_new_type:byte;   //进入该办面的类别0,1,9,10
  end;

var
  Form4: TForm4;
  function Power(x, y : extended) : extended;
implementation
uses damo, shipmeoth_search, ssadd_search, supplier, edit_misc,
  state_tax, edit_std_inv, add_po, main, supp_search, account_search,
  edit_misc_po, note, annotation, PR_search, dpment_search,common;
{$R *.dfm}

procedure TForm4.BitBtn5Click(Sender: TObject);
var
 v_message:byte;
begin
if tc1.Tabs.Count>0 then
 begin
  v_message:=messagedlg('是否对数据存盘?',mtConfirmation,[mbyes,mbno,mbcancel],0);
  if v_message=7 then   //NO 不存
   begin
    IF v_new_type<>10 THEN dm.AQ0015.CancelBatch();
     dm.ADO70.CancelBatch();
     dm.ADO7011.CancelBatch();
     dm.ADO107011.CancelBatch();
     dm.ADO200.CancelBatch();
     dm.ADO0450.CancelBatch();
    if dbgrid1.Visible=true then
     dm.ADO71.CancelBatch()
    else
     dm.ADO72.CancelBatch();
    v_close:=1; //正常退出
    close;
   end
  else
   if v_message=6 then     //yes对修改的记录存盘
    begin
     bitbtn2.SetFocus;
     bitbtn2click(sender);
    end
   else                    //cancel不存盘也不保存
    exit;
 end
else
 begin
  v_close:=1; //正常退出
  close;
 end;
end;

procedure TForm4.BitBtn9Click(Sender: TObject);
begin
 try
  form_shipmethod:=tform_shipmethod.Create(application);
 if form_shipmethod.ShowModal=mrok then
  begin
   dbedit4.Field.Value:=form_shipmethod.ADOQuery1.Fieldbyname('description').AsString;
   dbcheckbox1.SetFocus;
  end
 else
  dbedit4.SetFocus;
 finally
  form_shipmethod.free;
 end;
end;

procedure TForm4.BitBtn8Click(Sender: TObject);
begin
 try
  form_address:=tform_address.Create(application);
  form_address.ADOQuery1.Close;
  form_address.ADOQuery1.Parameters[1].Value := dm.ADO70SUPPLIER_POINTER.Value;
  form_address.ADOQuery1.Open;
  if form_address.ShowModal=mrok then
   begin
    dm.ADO70SUPP_FAC_ADD_PTR.Value := form_address.ADOQuery1.FieldValues['rkey'];
    dm.ADO70FEDERAL_TAX.Value := form_address.ADOQuery1.FieldValues['state_tax'];
    dm.ADO70STATE_SHIP_TAX_FLAG.Value := form_address.ADOQuery1.FieldValues['STATE_SHIP_TAX_FLAG'];
    dm.ADO70STATE_MISC_TAX_FLAG.Value := form_address.ADOQuery1.FieldValues['STATE_MISC_TAX_FLAG'];
    dbedit2.SetFocus;
   end
  else
   dbedit17.SetFocus;
 finally
  form_address.free;
 end;
end;



procedure TForm4.FormShow(Sender: TObject);
var
 i:byte;
 v_total,v_tax:real;
begin
  with dm.ADO200 do    //查找PO的杂项费用
   begin
    active:=false;
    Parameters[0].Value := dm.ADO70rkey.Value;
    active:=true;
   end;
  with dm.ado7011 do      //订单记事本
   begin
    active:=false;
    Parameters[0].Value := dm.ADO70rkey.Value;
    active:=true;
   end;
  with dm.ado107011 do       //交货记事本
   begin
    active:=false;
    Parameters[0].Value := dm.ADO70rkey.Value;
    active:=true;
   end;
  with dm.ado0450 do       //注解
   begin
    active:=false;
    Parameters[0].Value := dm.ADO70rkey.Value;
    active:=true;
   end;
if v_new_type = 10 then //编辑
 begin      //开始..1
  with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('select data0023.code,');
    sql.Add('CONTACT_NAME_1,CONTACT_NAME_2,CONTACT_NAME_3,');
    sql.Add('CONTACT_NAME_4,CONTACT_NAME_5,CONTACT_NAME_6');
    sql.Add('from data0070,data0023');
    sql.Add('where data0070.supplier_pointer=data0023.rkey and');
    sql.Add('data0070.rkey='+dm.ADO70RKEY.AsString);
    active:=true;
    tc1.Tabs.Add(fieldvalues['code']);             //查找供应商
    for i:=1 to 6 do     //客户联络人
     dbcombobox1.Items.Add(fieldbyname('contact_name_'+inttostr(i)).asstring);
   end;

  self.get_approve_type(DM.ADO70WAREHOUSE_POINTER.Value);
  ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(DM.ADO70PURCHASE_TYPE.Value);

  edit7.Text:=dm.AQ0070warehouse_name.Value;

  if (dm.ADO70PO_TYPE.Value = 'S')  then  //读取标准采购
   with dm.ADO71 do
   begin
    active:=false;
    sql.Clear;
    sql.Add('SELECT * FROM data0071');
    sql.Add('where po_ptr='+dm.ADO70RKEY.AsString);
    active:=true;
    if dm.ADO71.Filter <> '' then dm.ADO71.Filter := '';
    v_total := 0;
    v_tax := 0;
    while not eof do
     begin
      v_total := v_total+dm.ADO71taxprice_total.Value;
      v_tax := v_tax+dm.ADO71tax_total.Value;
      next;
     end;
    edit2.Text := formatfloat('0.00',v_total);
    edit3.Text := formatfloat('0.00',v_tax);
    first;
    dm.AQ71.Close;
    dm.AQ71.Parameters[1].Value:=dm.ADO70RKEY.Value;
    dm.AQ71.Open;
    DBRadioGroup2.Enabled:=DBCheckBox2.Checked;
   end
  else
  with dm.ADO72 do   //读取杂项采购
   begin
    active:=false;
    sql.Clear;
    sql.Add('SELECT * FROM data0072');
    sql.Add('where poptr='+dm.ADO70RKEY.AsString);
    active:=true;
    if dm.ADO72.Filter <> '' then dm.ADO72.Filter := '';
    v_total:=0;
    v_tax:=0;
    while not eof do
     begin
      v_total:=v_total+dm.ADO72taxprice_total.Value;
      v_tax:=v_tax+dm.ADO72tax_total.Value;
      next;
     end;
    edit2.Text := formatfloat('0.00',v_total);
    edit3.Text := formatfloat('0.00',v_tax);
    first;
    dm.AQ72.Close;
    dm.AQ72.Parameters[1].Value:=dm.ADO70RKEY.Value;
    dm.AQ72.Open;
    dbgrid1.Visible:=false;
    dbgrid2.Visible:=true;
    self.DBCheckBox2.Visible:=false; //杂项采购无VMI采购
    DBRadioGroup2.Visible:=false; //杂项采购VMI价格取向不用
   end;                  //如果货币为基准货币不能编辑汇率
   if dm.ADO70CURRENCY_PTR.Value =1 then
    begin
     dbedit5.ReadOnly:=true;
     dbedit5.Color := cl3dlight;
    end;
   change_tax_total;    //改变杂项费与运输费用税金合计
   if dm.ADO70PURCHASE_ORDER_TYPE.Value = 1 then
    begin
     dbedit1.Color := clwindow;  //手工新增时可以输入请购部门
     dbedit1.ReadOnly := false;
     dbedit3.Color := clwindow;  //手工新增时可以输入请购编号
     dbedit3.ReadOnly := false;
     bitbtn6.Enabled := true;
    end;
 end;     //编辑结束..1

end;

procedure TForm4.DBCheckBox1Click(Sender: TObject);
begin
 if dbcheckbox1.Checked then
  begin
   dbedit11.Enabled := false;
   dbedit12.Enabled := false;
   dbedit15.Enabled := false;
  end
 else
  begin
   dbedit11.Enabled := true;
   dbedit12.Enabled := true;
   dbedit15.Enabled := true;
  end;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
 try
  form6:=tform6.Create(application);//显示供应商信息
  form6.Caption := '供应商资料:'+tc1.Tabs[tc1.tabindex];
  form6.ShowModal;
 finally
  form6.free;
 end;
end;

procedure TForm4.BitBtn10Click(Sender: TObject);
var
 i:byte;
 search_option:tlocateoptions;
 mic_total:real;
 locatesuccess:boolean;
begin
 try
  search_option := [lopartialkey];
  form7:=tform7.Create(application);
  if v_new_type<>10 then         //新增PO
   dm.ADO200.Filter := 'poptr= '+inttostr(dm.ADO70.RecNo);
  dm.ADO200.First;
  while not dm.ADO200.Eof do   //查找杂项费用
   begin
    for i:=1 to form7.StringGrid1.RowCount-2 do
     if trim(form7.StringGrid1.Cells[4,i])=trim(dm.ADO200.fieldbyname('MISC_CHARGE_PTR').asstring) then
      begin
       form7.StringGrid1.Cells[3,i]:=formatfloat('0.00',dm.ADO200.FieldValues['amount']);
       break;
      end;
      dm.Ado200.Next;
   end;

  dm.ADO200.First;
  if form7.ShowModal=mrok then
   begin
    mic_total:=0;
     for i:=1 to form7.StringGrid1.RowCount-2 do
      begin
       if v_new_type<>10 then //新增
        locatesuccess:=dm.ado200.Locate('misc_charge_ptr;poptr',vararrayof([strtoint(form7.StringGrid1.Cells[4,i]),dm.ADO70.recno]),search_option)
       else                   //编辑
        locatesuccess:=dm.ado200.Locate('misc_charge_ptr;poptr',vararrayof([strtoint(form7.StringGrid1.Cells[4,i]),dm.ADO70RKEY.value]),search_option);
       if locatesuccess then
        begin               //如果原来有记录
         if strtofloat(form7.StringGrid1.Cells[3,i])>0 then
         begin
          dm.ADO200.Edit;
          dm.ADO200.FieldByName('amount').AsString := form7.StringGrid1.Cells[3,i];
          dm.ado200.post;
         end
         else
          dm.ADO200.Delete;
        end
       else //没有找到
        if strtofloat(form7.StringGrid1.Cells[3,i])>0 then
        begin
         dm.ADO200.Append;
         dm.ADO200.FieldByName('amount').AsString := form7.StringGrid1.Cells[3,i];
         if v_new_type=10 then
          dm.ADO200.Fieldvalues['poptr'] := dm.ADO70RKEY.Value
         else
          dm.ADO200.Fieldvalues['poptr'] := dm.ADO70.RecNo;
         dm.ADO200.FieldByName('misc_charge_ptr').AsString := form7.StringGrid1.Cells[4,i];
         dm.ADO200.Post;
        end;
        mic_total:=mic_total+strtofloat(form7.StringGrid1.Cells[3,i]);
      end;
    dbedit10.Field.Value := mic_total; //修改杂项费用子段
    self.change_tax_total;
   end;
 finally
  form7.free;
 end;
end;

procedure TForm4.update_69_204(rkey: integer; v_type: Byte);
begin
 with dm.ADOQuery2 do
 begin
   close;
   if v_type=0 then   //0更新编码物料请购，１更新非编码物料请购
    sql.Text:='update data0069 set status=1 where rkey='+inttostr(rkey)
   else
    sql.Text:='update data0204 set status=1 where rkey='+inttostr(rkey);
   ExecSQL;
 end;
end;

procedure TForm4.update_69_68(rkey70: Integer);
begin

 with dm.ADOQuery2 do
 begin
   close;
   sql.Text:='update data0069 set status=0 '+
   'from data0069 inner join data0071 on '+
   'data0069.rkey=data0071.rkey69 '+
   'where data0071.po_ptr='+inttostr(rkey70);
   ExecSQL;
 end;

 with dm.ADOQuery2 do
 begin
   close;
   sql.Text:='update data0068 set status=2 '+
   'where EXISTS(select data0069.PURCH_REQ_PTR '+
   'from data0069 inner join data0071 on '+
   'data0069.rkey=data0071.rkey69 '+
   'where data0071.po_ptr='+inttostr(rkey70)+
   'and data0069.PURCH_REQ_PTR=data0068.rkey '+
   'group by data0069.PURCH_REQ_PTR)';
   ExecSQL;
 end;

end;


procedure TForm4.update_69_68_post(rkey70: Integer);
begin

 with dm.ADOQuery2 do
 begin
   close;
   sql.Text:='update data0069 set status=1 '+
   'from data0069 inner join data0071 on '+
   'data0069.rkey=data0071.rkey69 '+
   'where data0071.po_ptr='+inttostr(rkey70);
   ExecSQL;
 end;

 with dm.ADOQuery2 do
  begin
   close;
   sql.Text:=
   'update data0068 set status=6'+#13+
   'where EXISTS(SELECT dbo.Data0069.PURCH_REQ_PTR'+#13+
       'FROM  dbo.Data0071 INNER JOIN'+#13+
       ' dbo.Data0069 ON dbo.Data0071.rkey69 = dbo.Data0069.RKEY'+#13+
       'where (data0071.po_ptr='+inttostr(rkey70)+')'+#13+
       'and (data0069.PURCH_REQ_PTR=data0068.rkey)'+#13+
       'GROUP BY dbo.Data0069.PURCH_REQ_PTR)'+#13+
   ' and not EXISTS('+#13+
   'SELECT  dbo.Data0069.PURCH_REQ_PTR'+#13+
   'FROM  dbo.Data0069 INNER JOIN'+#13+
   '(SELECT  Data0069_1.PURCH_REQ_PTR FROM dbo.Data0071 INNER JOIN'+#13+
   ' dbo.Data0069 AS Data0069_1 ON dbo.Data0071.rkey69 = Data0069_1.RKEY'+#13+
   'where (data0071.po_ptr='+inttostr(rkey70)+')'+#13+
   ' GROUP BY Data0069_1.PURCH_REQ_PTR) AS derivedtbl_1 ON'+#13+
   'dbo.Data0069.PURCH_REQ_PTR = derivedtbl_1.PURCH_REQ_PTR'+#13+
   'WHERE  (dbo.Data0069.status = 0)'+#13+
   'and (data0069.PURCH_REQ_PTR=data0068.rkey)'+#13+
   'GROUP BY dbo.Data0069.PURCH_REQ_PTR)';
   ExecSQL;
  end
end;

procedure TForm4.update_204_68(rkey70: Integer);
begin

 with dm.ADOQuery2 do
 begin
   close;
   sql.Text:='update data0204 set status=0 '+
   'from data0204 inner join data0072 on '+
   'data0204.rkey=data0072.rkey204 '+
   'where data0072.poptr='+inttostr(rkey70);
   ExecSQL;
 end;

 with dm.ADOQuery2 do
 begin
   close;
   sql.Text:='update data0068 set status=2 '+
   'where EXISTS(select data0204.PURCHASE_REQ_PTR '+
   'from data0204 inner join data0072 on '+
   'data0204.rkey=data0072.rkey204 '+
   'where data0072.poptr='+inttostr(rkey70)+
   'and data0204.PURCHASE_REQ_PTR=data0068.rkey '+
   'group by data0204.PURCHASE_REQ_PTR)';
   ExecSQL;
 end;

end;

procedure TForm4.update_204_68_post(rkey70: Integer);
begin
 with dm.ADOQuery2 do
 begin
   close;
   sql.Text:='update data0204 set status=1 '+
   'from data0204 inner join data0072 on '+
   'data0204.rkey=data0072.rkey204 '+
   'where data0072.poptr='+inttostr(rkey70);
   ExecSQL;
 end;

 with dm.ADOQuery2 do
  begin
   close;
   sql.Text:=
   'update data0068 set status=6'+#13+
   'where EXISTS(SELECT dbo.data0204.PURCHASE_REQ_PTR'+#13+
       'FROM  dbo.Data0072 INNER JOIN'+#13+
       ' dbo.data0204 ON dbo.Data0072.rkey204 = dbo.data0204.RKEY'+#13+
       'where (data0072.poptr='+inttostr(rkey70)+')'+#13+
       'and (data0204.PURCHASE_REQ_PTR=data0068.rkey)'+#13+
       'GROUP BY dbo.data0204.PURCHASE_REQ_PTR)'+#13+
   'and not EXISTS('+#13+
   'SELECT  dbo.data0204.PURCHASE_REQ_PTR'+#13+
   'FROM  dbo.data0204 INNER JOIN'+#13+
   '(SELECT  data0204_1.PURCHASE_REQ_PTR FROM dbo.Data0072 INNER JOIN'+#13+
   ' dbo.data0204 AS data0204_1 ON dbo.Data0072.rkey204 = data0204_1.RKEY'+#13+
   'where (data0072.poptr='+inttostr(rkey70)+')'+#13+
   ' GROUP BY data0204_1.PURCHASE_REQ_PTR) AS derivedtbl_1 ON'+#13+
   'dbo.data0204.PURCHASE_REQ_PTR = derivedtbl_1.PURCHASE_REQ_PTR'+#13+
   'WHERE  (dbo.data0204.status = 0)'+#13+
   'and (data0204.PURCHASE_REQ_PTR=data0068.rkey)'+#13+
   'GROUP BY dbo.data0204.PURCHASE_REQ_PTR)';
   ExecSQL;
  end
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
var
 sub_total:real;
begin
if v_new_type=10 then   //如果是编辑状态保存单条记录
 begin
   if trim(dbedit16.Text)='' then
   begin
    messagedlg('采购定单编号不能为空!',mtinformation,[mbcancel],0);
    dbedit16.SetFocus;
    exit;
   end;

  dm.ADOConnection1.BeginTrans; //起用事物处理
  dm.ADO70PRINT_DATE.AsVariant:=null;
  dm.ADO70EDIT_BY_EMPL_PTR.Value := StrToInt(user_ptr);  //编辑人员
  dm.ADO70EMPLOYEE_POINTER.Value := StrToInt(user_ptr); //最后编辑人员也发生改变050125

  if trim(dm.ADO70FOB.Value) = '' then dm.ADO70FOB.AsVariant := null;    //请购编号

 if (dm.ADO70STATUS.Value <> 8) then dm.ADO70STATUS.Value:=8;
  change_data0070(dm.ADO70RKEY.Value); //记录修改了记录的那些关键字段
  try
   dm.ADO70.UpdateBatch();
//   with dm.ADOQuery3 do  //更新供应商信息
//    begin
//     close;
//     Parameters.ParamByName('supp_ptr').Value := dm.ADO70SUPPLIER_POINTER.Value;
//     open;
//     edit;
//     dm.ADOQuery3tax_id_number.Value:= trim(dm.ADO70ANALYSIS_CODE_5.Value);  //付款方法
//     dm.ADOQuery3analysis_code1.Value := trim(dm.ADO70ANALYSIS_CODE_4.Value);//票据种类
//     post;
//    end;
  except
   dm.ADOConnection1.RollbackTrans;
   messagedlg('定单保存失败,请检查采购编号,请购编号,是否正确!',mtinformation,[mbcancel],0);
   dm.ADO70.Edit;
   dbedit16.SetFocus;
   exit;
  end;

  if dbgrid1.Visible=true then
   begin
    self.update_69_68(dm.ADO70RKEY.Value);
    dm.ADO71.UpdateBatch();
    change_data0071(dm.ADO70RKEY.Value); //记录修改了那些标准采购条目,同时更新交付排程
    self.update_69_68_post(dm.ADO70RKEY.Value);
   end
  else
   begin
    SELF.update_204_68(DM.ADO70RKEY.Value);
    dm.ADO72.UpdateBatch();
    change_data0072(dm.ADO70RKEY.Value);   //记录修改了那些杂项采购条目
    Self.update_204_68_post(dm.ADO70RKEY.Value);
   end;
  try
   dm.ADO200.UpdateBatch();
   dm.ADO7011.UpdateBatch();
   dm.ADO107011.UpdateBatch();
   dm.ADO0450.UpdateBatch();

   dm.ADOConnection1.CommitTrans;
   v_close:=1;   //表示正常退出
   ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;

 end
else//<>10为新增状态
 if not self.find_po_error() then //如果没有找到错误主要是新增的PO的编号是否重复
 begin
   dm.ADOConnection1.BeginTrans;
   try
    dm.ADO70.UpdateBatch();
   except
    dm.ADOConnection1.RollbackTrans;
    messagedlg('数据保存失败,请认真检查采购编号,请购编号,是否正确!',mtinformation,[mbcancel],0);
    dm.ADO70.Edit;
    exit;
   end;
  dm.ADO70.First;       //移动指针到第条记录准备保存相关子表
  sub_total:=0;         //准备记录采购订单的总金额(按本位币计算)
  while not dm.ADO70.Eof do //+++++++++++++++++++++++++++++++++++++++++++++
  begin
    dm.ADO200.Filter := 'poptr= '+inttostr(dm.ADO70.RecNo);
    dm.ADO200.First;              //更新杂项费用表
    while not dm.ADO200.Eof do
     begin
      dm.ADO200.Edit;
      dm.ADO200POPTR.Value :=dm.ADO70RKEY.Value;
      dm.ADO200.Post;
      if dm.ADO70RKEY.Value=dm.ADO70.RecNo then
       dm.ADO200.Next;
     end;
    dm.ADO7011.Filter := 'file_pointer= '+inttostr(dm.ADO70.RecNo);
    if not dm.ADO7011.IsEmpty then //更新记事本订单记事本
     begin
      dm.ADO7011.Edit;
      dm.ADO7011.FieldValues['file_pointer'] :=dm.ADO70RKEY.Value;
      dm.ADO7011.Post;
     end;
    dm.ADO107011.Filter := 'file_pointer= '+inttostr(dm.ADO70.RecNo);
    if not dm.ADO107011.IsEmpty then //更新记事本订单交货记事本
     begin
      dm.ADO107011.Edit;
      dm.ADO107011.FieldValues['file_pointer'] :=dm.ADO70RKEY.Value;
      dm.ADO107011.Post;
     end;
    dm.ADO0450.Filter := 'file_pointer= '+inttostr(dm.ADO70.RecNo);
    if not dm.ADO0450.IsEmpty then    //更新多行记事本
     begin
      dm.ADO0450.Edit;
      dm.ADO0450.FieldValues['file_pointer'] :=dm.ADO70RKEY.Value;
      dm.ADO0450.Post;
     end;

   if dbgrid1.Visible = true then
    begin              //该语句存在问题2003-12-04将导致dm.ado71两次赋值
     dm.ADO71.Filter := 'po_ptr= '+inttostr(dm.ADO70.RecNo);
     dm.ADO71.First;   //这种情况只在当70.rkey=dm.ADO70.RecNo时会发生
     while not dm.ADO71.Eof do
      begin
       dm.ADO71.Edit;
       dm.ADO71.FieldValues['po_ptr'] := dm.ADO70RKEY.Value;
       dm.ADO71.Post;          //使用filter过滤后post能自动移到下一条记录
       if dm.ADO70RKEY.Value = dm.ADO70.RecNo then dm.ADO71.Next;
      end;
    end
   else
    begin
     dm.ADO72.Filter := 'poptr= '+inttostr(dm.ADO70.RecNo);
     dm.ADO72.First;                           //更新杂项采购子表
     while not dm.ADO72.Eof do
      begin
       dm.ADO72.Edit;
       dm.ADO72.FieldValues['poptr'] := dm.ADO70RKEY.Value;
       dm.ADO72.Post;
       if dm.ADO70RKEY.Value = dm.ADO70.RecNo then dm.ADO72.Next;
      end;
    end;
   with dm.ADO0339 do             //记录新增了采购订单
    begin
     active:=false;
     Parameters.ParamValues['po_ptr'] := dm.ADO70RKEY.Value;
     Parameters.ParamValues['edit_empl_ptr'] := dm.ADO70EMPLOYEE_POINTER.Value;
     Parameters.ParamValues['tran_type'] := 10;
     Parameters.ParamValues['tran_desc'] := '新增采购订单';
     Parameters.ParamValues['tran_from'] := null;
     Parameters.ParamValues['tran_to'] := null;
     Parameters.ParamValues['data0071_ptr'] := null;
     Parameters.ParamValues['data0072_ptr'] := null;
     ExecSQL;
    end;
   sub_total:=sub_total+dm.ADO70SUB_TOTAL.Value*dm.ADO70EXCHANGE_RATE.Value;
//   with dm.ADOQuery3 do
//    begin
//     close;
//     Parameters.ParamByName('supp_ptr').Value := dm.ADO70SUPPLIER_POINTER.Value;
//     open;
//     edit;
//     dm.ADOQuery3tax_id_number.Value:= trim(dm.ADO70ANALYSIS_CODE_5.Value);
//     dm.ADOQuery3analysis_code1.Value := trim(dm.ADO70ANALYSIS_CODE_4.Value);
////     dm.ADOQuery3analysis_code2.Value := trim(dm.ADO70ANALYSIS_CODE_3.Value);
//     post;
//    end;
   dm.ADO70.Next;
  end;//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

   dm.ADO200.Filter := '';
   dm.ADO7011.Filter := '';
   dm.ADO107011.Filter := '';
   dm.ADO0450.Filter := '';
  if dbgrid1.Visible=true then
   dm.ADO71.Filter := ''
  else
   dm.ADO72.Filter := '';

 try
  dm.ADO200.UpdateBatch();
  dm.ADO7011.UpdateBatch();
  dm.ADO107011.UpdateBatch();
  dm.ADO0450.UpdateBatch();

  if dbgrid1.Visible=true then
   begin
    dm.ADO71.UpdateBatch();  //提交标准请购内容
    dm.ADO71.First;
    while not dm.ADO71.Eof do
     begin
      with dm.ADO0339 do
       begin
        active:=false;
        Parameters.ParamValues['po_ptr'] := dm.ADO71PO_PTR.Value;
        Parameters.ParamValues['edit_empl_ptr'] := dm.ADO70EMPLOYEE_POINTER.Value;
        Parameters.ParamValues['tran_type'] := 6;
        Parameters.ParamValues['tran_desc'] := '新增一个标准采购项目';
        Parameters.ParamValues['tran_from'] := null;
        Parameters.ParamValues['tran_to'] := null;
        Parameters.ParamValues['data0071_ptr'] := dm.ADO71RKEY.Value;
        Parameters.ParamValues['data0072_ptr'] := null;
        ExecSQL;
       end;
      Self.update_69_204(dm.ADO71rkey69.Value,0);
      dm.ADO71.Next;
     end;
   end
  else
   begin
    dm.ADO72.UpdateBatch();  //提效杂项请购内容
    dm.ADO72.First;
    while not dm.ADO72.Eof do
     begin
      with dm.ADO0339 do
       begin
        active:=false;
        Parameters.ParamValues['po_ptr'] := dm.ADO72POPTR.Value;
        Parameters.ParamValues['edit_empl_ptr'] := dm.ADO70EMPLOYEE_POINTER.Value;
        Parameters.ParamValues['tran_type'] := 6;
        Parameters.ParamValues['tran_desc'] := '新增一个杂项采购项目';
        Parameters.ParamValues['tran_from'] := null;
        Parameters.ParamValues['tran_to'] := null;
        Parameters.ParamValues['data0071_ptr'] := null;
        Parameters.ParamValues['data0072_ptr'] := dm.ADO72RKEY.Value;
        ExecSQL;
       end;
      Self.update_69_204(dm.ADO72rkey204.Value,1);
      dm.ADO72.Next;
     end;
   end;

  if (v_new_type=9) and (dm.ADO70FOB.Value='') then //如果是导入数据修改data0068采购请求的状态
  begin
   if dbgrid1.Visible=true then //编码采购
    with dm.ADOQuery2 do
    begin
     close;
     sql.Text:=
     'update data0068'+#13+
     'set status=6'+#13+      //更新请购已处理
     'where rkey in(SELECT dbo.Data0069.PURCH_REQ_PTR'+#13+
         'FROM  dbo.Data0071 INNER JOIN'+#13+
         ' dbo.Data0069 ON dbo.Data0071.rkey69 = dbo.Data0069.RKEY'+#13+
         'where (data0071.po_ptr='+dm.ADO70RKEY.AsString+')'+#13+
         'GROUP BY dbo.Data0069.PURCH_REQ_PTR)'+#13+
     ' and rkey not in('+#13+
     'SELECT  dbo.Data0069.PURCH_REQ_PTR'+#13+
     'FROM  dbo.Data0069 INNER JOIN'+#13+
     '(SELECT  Data0069_1.PURCH_REQ_PTR FROM dbo.Data0071 INNER JOIN'+#13+
     ' dbo.Data0069 AS Data0069_1 ON dbo.Data0071.rkey69 = Data0069_1.RKEY'+#13+
     'where (data0071.po_ptr='+dm.ADO70RKEY.AsString+')'+#13+
     ' GROUP BY Data0069_1.PURCH_REQ_PTR) AS derivedtbl_1 ON'+#13+
     'dbo.Data0069.PURCH_REQ_PTR = derivedtbl_1.PURCH_REQ_PTR'+#13+
     'WHERE  (dbo.Data0069.status = 0)'+#13+
     'GROUP BY dbo.Data0069.PURCH_REQ_PTR)';
     ExecSQL;
    end
   else
    with dm.ADOQuery2 do  //非编码采购
    begin
     close;
     sql.Text:=
     'update data0068'+#13+
     'set status=6'+#13+      //更新请购已处理
     'where rkey in(SELECT dbo.Data0204.PURCHASE_REQ_PTR'+#13+
         'FROM  dbo.Data0072 INNER JOIN'+#13+
         ' dbo.Data0204 ON dbo.Data0072.rkey204 = dbo.Data0204.RKEY'+#13+
         'where (data0072.poptr='+dm.ADO70RKEY.AsString+')'+#13+
         'GROUP BY dbo.Data0204.PURCHASE_REQ_PTR)'+#13+
     ' and rkey not in('+#13+
     'SELECT  Data0204.PURCHASE_REQ_PTR'+#13+
     'FROM  data0204 INNER JOIN'+#13+
     '(SELECT  Data0204_1.PURCHASE_REQ_PTR FROM dbo.Data0072 INNER JOIN'+#13+
     ' Data0204 AS Data0204_1 ON Data0072.rkey204 = Data0204_1.RKEY'+#13+
     'where (data0072.poptr='+dm.ADO70RKEY.AsString+')'+#13+
     ' GROUP BY Data0204_1.PURCHASE_REQ_PTR) AS derivedtbl_1 ON'+#13+
     'dbo.Data0204.PURCHASE_REQ_PTR = derivedtbl_1.PURCHASE_REQ_PTR'+#13+
     'WHERE  (dbo.Data0204.status = 0)'+#13+
     'GROUP BY dbo.Data0204.PURCHASE_REQ_PTR)';
     ExecSQL;
    end
  end
  else
   if (v_new_type=9) and (dm.ADO70FOB.Value<>'') then //如果是导入数据修改data0068采购请求的状态
   begin                //同时修改请购所对应的预算金额
    dm.asp362.Edit;     //这样预算的使用情况将与采购部门的实际采购为准。
    dm.asp362.fieldvalues['used_period_'+inttostr(dm.asp362v_month.Value)] :=
    formatfloat('0.00',dm.asp362.fieldvalues['used_period_'+inttostr(dm.asp362v_month.Value)]+
     (dm.asp362TOTAL.Value-sub_total));  //预算使用金额在授理时已修改了，这里只增加差额
    dm.asp362.Post;     //以上修改时间为030328需要重新修改

    if dbgrid1.Visible=true then //编码采购
    with dm.ADOQuery2 do
    begin
      close;
      sql.Text:='update data0068 set status=6 '+
      'where po_req_number='+quotedstr((dm.ADO70FOB.Value))+' and '+
      'not EXISTS(select rkey from data0069 where status=0 and data0069.purch_req_ptr=data0068.rkey)';
      ExecSQL;
    end
    else
    with dm.ADOQuery2 do
    begin
      close;
      sql.Text:='update data0068 set status=6 '+
      'where po_req_number='+quotedstr((dm.ADO70FOB.Value))+' and '+
      'not EXISTS(select rkey from data0204 where status=0 and data0204.purchase_req_ptr=data0068.rkey)';
      ExecSQL;
    end;
   end;

  if form1.if_suplst='Y' then
   dm.ADO04.UpdateBatch()
  else
   dm.aq0015.UpdateBatch(); //保存控制码

  dm.ADOConnection1.CommitTrans;
  v_close:=1; //正常退出
  ModalResult :=mrok;
 except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
 end;

 end;
end;

procedure TForm4.BitBtn11Click(Sender: TObject);
var
 ship_flag,misc_flag:string;
begin
try
 form8:=tform8.Create(application);
 ship_flag:=dm.ADO70STATE_SHIP_TAX_FLAG.Value;
 misc_flag:=dm.ADO70STATE_MISC_TAX_FLAG.Value;
  with dm.ADOQuery2 do
   begin
    active := false;
    sql.Clear;
    sql.Add('select data0189.state_id from data0189,data0024');
    sql.Add('where data0024.city_tax_ptr=data0189.rkey and');
    sql.Add('data0024.rkey='+dm.ADO70SUPP_FAC_ADD_PTR.AsString);
    active := true;
    form8.Edit1.Text := fieldvalues['state_id'];
   end;
 if form8.ShowModal=mrok then
  self.change_tax_total()
 else
  begin
   dm.ADO70STATE_SHIP_TAX_FLAG.Value:=ship_flag;
   dm.ADO70STATE_MISC_TAX_FLAG.Value:=misc_flag;
  end;
finally
 form8.free;
end;
end;

procedure TForm4.N3Click(Sender: TObject);
var
 v_total,v_tax:real;
begin
 try
  form9 := tform9.Create(application);
  v_total := dm.ADO71taxprice_total.Value;
  v_tax := dm.ADO71tax_total.Value;

  dm.ADO71.Edit;
  form9.MaskEdit1.Text := dm.ADO71REQ_DATE.AsString;

  if form9.ShowModal=mrok then
   begin
    dm.ADO71REQ_DATE.AsString:=form9.MaskEdit1.Text;

    edit2.text := formatfloat('0.00',strtofloat(edit2.Text)-v_total+dm.ADO71taxprice_total.Value);

    edit3.Text := formatfloat('0.00',strtofloat(edit3.Text)-v_tax+dm.ADO71tax_total.Value);

    dbedit7.Field.Value := dbedit7.Field.Value-v_total+dm.ADO71taxprice_total.Value;

    dm.ADO71.Post;
   end;
 finally
  form9.free;
 end;
end;

procedure TForm4.N1Click(Sender: TObject);
begin
try
 form2:=tform2.Create(application);
 form2.BitBtn2.Enabled := false;
 form2.BitBtn3.Enabled := false;
 form2.Edit3.Enabled := false;
 form2.RadioGroup1.Visible := false;
 with dm.ADOQuery1 do
  begin
   active := false;
   sql.Clear;
   sql.Add('select rkey,code,supplier_name from data0023');
   sql.Add('where rkey='+dm.ADO70SUPPLIER_POINTER.AsString);
   active := true;
   form2.edit2.Text := fieldvalues['code'];
   form2.Label5.Caption := fieldvalues['supplier_name'];
   form2.rkey23.Caption := dm.ADO70SUPPLIER_POINTER.AsString;
  end;
 with dm.ADOQuery1 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select rkey,warehouse_code,warehouse_name from data0015');
   sql.Add('where rkey='+dm.ADO70WAREHOUSE_POINTER.AsString);
   active:=true;
   form2.edit3.Text := fieldvalues['warehouse_code'];
   form2.Label6.Caption := fieldvalues['warehouse_name'];
   form2.rkey15.Caption := dm.ADO70WAREHOUSE_POINTER.AsString;
  end;
 if form2.ShowModal = mrok then
  begin
   with dm.ADOQuery1 do
    begin
     active:=false;
     sql.Clear;
     sql.Add('select currency_ptr from data0028');
     sql.Add('where inventory_ptr='+form2.rkey17.Caption);
     sql.Add('and supplier_ptr='+form2.rkey23.Caption);
     active:=true;
    end;
   if dm.ADOQuery1.FieldValues['currency_ptr']=dm.ADO70CURRENCY_PTR.Value then
    form4.add_0071                             //新增标准采购子表
   else
    messagedlg('同一采购订单中,不能有要求货币不同的采购!',mtinformation,[mbcancel],0);
  end;
finally
 form2.free;
end;
end;

procedure TForm4.N2Click(Sender: TObject);
begin
 edit2.Text := formatfloat('0.00',strtofloat(edit2.Text)-dm.ADO71taxprice_total.Value);
 edit3.Text := formatfloat('0.00',strtofloat(edit3.Text)-dm.ADO71tax_total.Value);
 dbedit7.Field.Value := dbedit7.Field.Value-dm.ADO71taxprice_total.Value;
    //总金额合计
 dm.ADO71.Delete;
end;

procedure TForm4.appendprlist_0070;
var
 i:byte;
begin
 with dm.ADO70 do
  begin                //70新增开始
   append;
  if form1.if_suplst='Y' then
   if dm.ADO04SEED_FLAG.Value<>1 then
    dm.ADO70PO_NUMBER.Value := dm.ADO04SEED_VALUE.Value
   else
  else
   if form_req.ClientDataSet1o_i_flag.value = 0 then   //格式一
    dm.ADO70PO_NUMBER.Value := dm.AQ0015purchase_order.Value
   else
    dm.ADO70PO_NUMBER.Value := dm.AQ0015o_purchase_order.Value;

   if form_req.ClientDataSet1o_i_flag.value = 0 then //格式一
    dm.ADO70SHIPTO_ADDRESS.Value := dm.AQ0015ADDRESS_LINE_3.Value
   else                                     //格式二
    dm.ADO70SHIPTO_ADDRESS.Value := dm.AQ0015o_address_3.Value;

   dm.ADO70EMPLOYEE_POINTER.AsString:= common.user_ptr;  //2员工
   dm.ADO70PO_TYPE.Value :=form_req.ClientDataSet1FLAG.value;  //标准或者杂项

   dm.ADO70SUPPLIER_POINTER.Value := Form_req.ClientDataSet1SUPP_PTR.Value;   //3供应商
   dm.ADO70CURRENCY_PTR.Value := Form_req.ClientDataSet1PO_LINK_PTR.Value;    //5货币
   dm.ADO70EXCHANGE_RATE.Value := Form_req.ClientDataSet1BASE_TO_OTHER.Value;//.20货币汇率
   dm.ADO70DISCOUNT2_DAYS.Value := Form_req.ClientDataSet1o_i_flag.Value;    //报表格式

   if (form_req.ADOQuery1FLAG.value = 'S')  then//物料类别
     dm.ADO70ANALYSIS_CODE_2.Value:= self.invtory_type(Form_req.ClientDataSet1INVT_PTR.AsString)
   else
    dm.ADO70ANALYSIS_CODE_2.Value:= Form_req.ClientDataSet1INV_DESCRIPTION.Value; //物料类别
   tc1.Tabs.Add(trim(Form_req.ClientDataSet1CODE.Value));

   with dm.ADOQuery1 do//给联络人,电话赋值,付款方法，票据种类，付款地点
    begin
     active:=false;
     sql.Clear;
     sql.Add('select CONTACT_NAME_1,CONTACT_NAME_2,CONTACT_NAME_3,');
     sql.Add('CONTACT_NAME_4,CONTACT_NAME_5,CONTACT_NAME_6,EDI_OUT_NEW_PO,');
     sql.Add('discount,discount2,discount_days,discount2_days,payment_terms,');
     sql.Add('PHONE,fax,TAX_ID_NUMBER,ANALYSIS_CODE1,ANALYSIS_CODE2,EDI_FLAG_FOR_PO');
     sql.Add('from data0023 where rkey='+dm.ADO70SUPPLIER_POINTER.AsString);
     active :=true;
     dbCombobox1.Clear;
     for i:=1 to 6 do     //联络人
      dbcombobox1.Items.Add(fieldbyname('contact_name_'+inttostr(i)).asstring);
     dm.ADO70SUPPIER_CONTACT.Value := fieldbyname('CONTACT_NAME_1').AsString; //5 客户联络人
     dm.ADO70CONTACT_PHONE.Value := trim(fieldbyname('PHONE').AsString)+'/'+
     trim(fieldbyname('fax').AsString); //4客户联络人电话
     dm.ADO70PAYMENT_TERMS.Value := fieldvalues['payment_terms'];     //13 净付款天数
     dm.ADO70CASH_DISCOUNT.Value := fieldvalues['discount'];      //14 付款条件
     dm.ADO70CASH_DISCOUNT2.Value := fieldvalues['discount2'];    //15 付款条件
     dm.ADO70DISCOUNT_DAYS.Value := fieldvalues['discount_days']; //16 付款条件
     dm.ADO70ANALYSIS_CODE_5.Value :=trim(fieldbyname('tax_id_number').AsString); //付款方法
     dm.ADO70ANALYSIS_CODE_4.Value :=trim(fieldbyname('ANALYSIS_CODE1').AsString);//票据种类
     dm.ADO70ANALYSIS_CODE_3.Value :=trim(fieldbyname('ANALYSIS_CODE2').AsString);//付款地点
     if dm.ADO70PO_TYPE.Value='S' then
     if fieldbyname('EDI_OUT_NEW_PO').AsInteger=0 then
      dm.ADO70STATE_INVT_TAX_FLAG.Value:='N'
     else
      dm.ADO70STATE_INVT_TAX_FLAG.Value:='Y';  //VMI采购
     dm.ADO70SECOND_WHSE_PTR.Value:=fieldbyname('EDI_FLAG_FOR_PO').AsInteger;
    end;
   with dm.ADOQuery1 do//复制装运地址中的值
    begin
     active:=false;
     sql.Clear;
     sql.Add('SELECT Data0024.RKEY,data0024.SHIPPING_LEAD_TIME,factory_location,');
     sql.Add('data0024.state_misc_tax_flag,data0024.state_ship_tax_flag,');
     sql.Add('data0189.state_tax,shipping_method');
     sql.Add('FROM Data0024,data0189');
     sql.Add('WHERE data0024.city_tax_ptr=data0189.rkey and');
     sql.Add('Data0024.SUPPLIER_PTR ='+dm.ADO70SUPPLIER_POINTER.AsString);
     active:=true;
     dm.ADO70SUPP_FAC_ADD_PTR.Value := FieldValues['rkey'];  //..6供应商装运地址
     dm.ADO70FEDERAL_TAX.Value := FieldValues['state_tax'];  //..7增值税率
     dm.ADO70STATE_SHIP_TAX_FLAG.Value := FieldValues['STATE_SHIP_TAX_FLAG']; //8装运记税
     dm.ADO70STATE_MISC_TAX_FLAG.Value := FieldValues['STATE_MISC_TAX_FLAG']; //9杂项记税
     dm.ADO70SHIPPING_METHOD.Value := fieldbyname('shipping_method').AsString;
    end;
     dm.ADO70WAREHOUSE_POINTER.value :=form_req.ClientDataSet1WHSE_PTR.Value; //10 工厂

     if ComboBox1.Items.Count=0 then
     Self.get_approve_type(dm.ADO70WAREHOUSE_POINTER.Value);  //得到审批类型

     dm.ADO70STATUS.Value := 8;                            //11  状态未审核
     dm.ADO70PO_DATE.Value := form1.sys_date;               //12  采购定单日期短格式
     dm.ADO70COLLECT_PREPAID.Value := 'C';                 //13  后付款
     if dm.ADO70CURRENCY_PTR.Value =1 then
      begin
       dbedit5.ReadOnly:=true;
       dbedit5.Color := cl3dlight;  //如果货币为基准货币不能编辑汇率
      end;

     dm.ADO70SHIPPING_COST.Value := 0;                          //.21装运费
     dm.ADO70MISC_CHARGE.Value := 0;                            //.22杂项费
     dm.ADO70SUB_TOTAL.Value := 0;                              //..24 金额合计
     dm.ADO70DISCOUNT_AMOUNT.Value := 0;                        //..25 价格折扣合计
//     dm.ADO70FOB.Value :=form_req.ClientDataSet1PO_REQ_NUMBER.Value; //..26请购编号030327修改
     dm.ADO70PO_REV_NO.Value := form_req.ClientDataSet1DEPARTMENT_NAME.Value; //27请购部门
     dm.ADO70ANALYSIS_CODE_1.Value := trim(form_req.ClientDataSet1EMPLOYEE_NAME.Value); //28请购人员
     dm.ADO70PURCHASE_ORDER_TYPE.Value :=0;             //29导入新增
     dm.ADO70.Post;
     if (dm.ADO70PO_TYPE.Value='S') then
      dm.ADO71.Filter := 'po_ptr= '+inttostr(dm.ADO70.RecNo)
     else
      dm.ADO72.Filter := 'poptr= '+inttostr(dm.ADO70.RecNo);

     dm.ADO70.Edit;

     self.change_seed_value(trim(dm.ADO70PO_NUMBER.Value));   //改变data0015或者04表中PO编号的初始值
     edit7.Text := form_req.ClientDataSet1warehouse_name.value+':'+
                   form_req.ClientDataSet1abbr_name15.value ;

  end;                    //70新增结束
end;

procedure TForm4.FormActivate(Sender: TObject);
begin
if (v_new_type=0) or (v_new_type=1) then //如果是新建标准采购或者杂项采购
 try

  form2:=tform2.Create(application);
  if v_new_type=0 then  //准备新增标准采购条目
   with dm.ADO71 do
    begin
     if active=true then active:=false;
     sql.Clear;
     sql.Add('select * from data0071 where rkey is null');
     active:=true;
    end
  else              //准备新增杂项采购条目
   with dm.ADO72 do
    begin
     if active=true then active:=false;
     sql.Clear;
     sql.Add('select * from data0072 where rkey is null');
     active:=true;
     dbgrid1.Visible:=false;
     dbgrid2.Visible:=true;
     self.add_misc_visible(); //使一些控件不可见
     self.DBCheckBox2.Visible:=false;
    end;

  dbedit1.Color := clwindow;  //手工新增时可以输入请购部门门
  dbedit1.ReadOnly := True;
  dbedit3.Color := clwindow;  //手工新增时可以输入请购编号
  dbedit3.ReadOnly := false;
  bitbtn6.Enabled := true;

 if form2.ShowModal=mrok then
  begin
   if form1.if_suplst='Y' then
    begin
     dm.ADO04.Close;
     dm.ADO04.Open;
    end;
   dm.AQ0015.Close;
   dm.AQ0015.Parameters[0].Value := strtoint(form2.rkey15.Caption);
   dm.AQ0015.Open;            //打开工厂采购订单初始值

   tc1.Visible := true;
   add_0070;
   edit7.Text := form2.label6.Caption;
   if v_new_type = 0 then
    add_0071  //第一次增加标准采购子表项
   else
    add_0072; //第一次增加杂项采购子表项
  end;
 finally
  form2.free;
 end
else
 if v_new_type=9 then //如果是导入数据
 try
  form_req:=tform_req.Create(application);
  if form_req.ADOQuery1.IsEmpty then
   messagedlg('此次搜索没有找到数据!',mtinformation,[mbcancel],0)
  else
 if form_req.ShowModal=mrok then
  begin
   if Form_req.PageControl1.ActivePageIndex=0 then
   begin
     tc1.Visible:=true;
     with dm.asp362 do   //采购所使用的预算表，准备重新修改预算
     begin
      active := false;
      Parameters[1].Value := form_req.ADOQuery1PO_REQ_NUMBER.Value;
      active := true;
     end;
     if form1.if_suplst='Y' then
     begin
      dm.ADO04.Close;
      dm.ADO04.Open;
     end;
     dm.AQ0015.Close;
     dm.AQ0015.Parameters[0].Value := form_req.ADOQuery1WHSE_PTR.Value;
     dm.AQ0015.Open;         //打开工厂采购订单初始值

     if (form_req.ADOQuery1FLAG.Value = 'S')  then //导入标准请购
      begin
       with dm.ADO71 do     //准备导入标准采购条目
        begin
         active:=false;
         sql.Clear;
         sql.Add('select * from data0071 where rkey is null');
         active:=true;
        end;
       dm.ADO0069.First;
       while not dm.ADO0069.Eof do
       begin
        if find_supplier(trim(dm.ADO0069.FieldValues['code']),dm.ADO0069PO_LINK_PTR.Value) then
         self.append_0071()
        else
         begin
          self.append_0070();
          self.append_0071();
          tc1.TabIndex := tc1.Tabs.Count-1;
          if dbedit16.Enabled=true then dbedit16.SetFocus;
          edit4.Text := '0.00';   //杂项运输税
         end;
        dm.ADO0069.Next;
       end;
      end
     else  //导入杂项请购flag='M'
     begin
      dbgrid1.Visible:=false;
      dbgrid2.Visible:=true;
      DBCheckBox2.Visible:=false;
      with dm.ADO72 do
      begin
       active:=false;
       sql.Clear;           //准备导入杂项采购条目
       sql.Add('select * from data0072 where rkey is null');
       active:=true;
      end;
      dm.ADO0204.First;
      while not dm.ADO0204.Eof do
       begin
       if find_supplier(trim(dm.ADO0204.FieldValues['code']),dm.ADO0204PO_LINK_PTR.Value) then
        self.append_0072()
       else
        begin
         self.append_0070();
         self.append_0072();
         tc1.TabIndex := tc1.Tabs.Count-1;
        end;
        dm.ADO0204.Next;
       end;
      if dbedit16.Enabled=true then dbedit16.SetFocus;
     end;
     edit7.Text := form_req.adoquery1warehouse_name.value;
   // end; //结束..2
   end
   else    //按请购明细导入
   begin
     tc1.Visible:=true;
     if form1.if_suplst='Y' then
     begin
      dm.ADO04.Close;
      dm.ADO04.Open;
     end;
     
     dm.AQ0015.Close;
     dm.AQ0015.Parameters[0].Value :=Form_req.ClientDataSet1WHSE_PTR.Value;
     dm.AQ0015.Open;         //打开工厂采购订单初始值

     self.appendprlist_0070();
  //
     if (form_req.ClientDataSet1FLAG.Value = 'S')  then //导入标准请购
      begin
       with dm.ADO71 do     //准备导入标准采购条目
        begin
         active:=false;
         sql.Clear;
         sql.Add('select * from data0071 where rkey is null');
         active:=true;
        end;
        Form_req.ClientDataSet1.First;
        while not Form_req.ClientDataSet1.Eof do
        begin
         dm.ADO71.Append;
         dm.ADO71PO_PTR.Value := dm.ADO70.RecNo;               //PO指针
         dm.ADO71INVT_PTR.Value := Form_req.ClientDataSet1INVT_PTR.Value;   //材料指针
         dm.ADO71QUAN_ORD.Value := Form_req.ClientDataSet1QUANTITY.Value;   //数量
         dm.ADO71REQ_DATE.Value := Form_req.ClientDataSet1reply_date.Value; //需求日期与装运日期
         dm.ADO71PURCHASE_UNIT_PTR.Value := Form_req.ClientDataSet1UNIT_PTR.Value; //采购单位
         dm.ADO71PRICE.Value := Form_req.ClientDataSet1UNIT_PRICE.Value;    //不含税价格
         dm.ADO71tax_price.Value := Form_req.ClientDataSet1tax_price.Value; //含税价
         dm.ADO71TAX_2.Value := Form_req.ClientDataSet1tax.Value;           //税率
         dm.ADO71CONVERSION_FACTOR.Value := Form_req.ClientDataSet1CONVERSION_FACTOR.Value; //转换率
         dm.ADO71reason.Value := Form_req.ClientDataSet1reason.Value;       //请购原因
         dm.ADO71extra_req.Value := Form_req.ClientDataSet1extra_req.Value; //特别要求
         dm.ado71avl_flag.value := Form_req.ClientDataSet1avl_flag.value;   //是否需要来料检查
         dm.ADO71rohs.Value:=Form_req.ClientDataSet1rohs.Value;             //环保标识
         dm.ADO71WO_PTR.Value:=Form_req.ClientDataSet1req_unit_ptr.Value;   //存货单位
         dm.ADO71IF_CAF.Value:=Form_req.ClientDataSet1IF_CAF.Value; //caf
         dm.ado71rkey69.Value:=Form_req.ClientDataSet1RKEY.Value;  //请购明细外健
         dm.ADO71IF_urgency.Value := Form_req.ClientDataSet1IF_urgency.Value; //是否紧急物料
         dm.ADO71ORIG_ABBRNAME.AsVariant :=  Form_req.ClientDataSet1ORIG_ABBRNAME.AsVariant;//品牌供应商
         dm.ADO71.Post;

         dm.ADO70SUB_TOTAL.AsString := formatfloat('0.00',
           dm.ADO70SUB_TOTAL.Value+dm.ADO71taxprice_total.Value);
         edit2.Text := formatfloat('0.00',StrToCurr(edit2.Text)+dm.ADO71taxprice_total.Value);
         edit3.Text := formatfloat('0.00',StrToCurr(edit3.Text)+dm.ADO71tax_total.Value);
         Form_req.ClientDataSet1.Next;
        end;
      end
     else  //导入非编码请购flag='M'
     begin
      dbgrid1.Visible:=false;
      dbgrid2.Visible:=true;
      DBCheckBox2.Visible:=false;  //非编码采购不能使用VMI
      with dm.ADO72 do
      begin
       active:=false;
       sql.Clear;           //准备导入杂项采购条目
       sql.Add('select * from data0072 where rkey is null');
       active:=true;
      end;
       Form_req.ClientDataSet1.First;
       while not Form_req.ClientDataSet1.Eof do
       begin
        dm.ADO72.Append;
        dm.ADO72POPTR.Value := dm.ADO70.RecNo;          //PO指针
        dm.ADO72DESCRIPTION.Value := Form_req.ClientDataSet1INV_PART_NUMBER.Value;   //物品名称
        dm.ADO72GUI_GE.Value := Form_req.ClientDataSet1INV_NAME.Value;               //物品规格
        dm.ADO72DESCRIPTION2.Value := Form_req.ClientDataSet1INV_DESCRIPTION.Value;  //类别
        dm.ADO72QUAN_ORD.Value := Form_req.ClientDataSet1QUANTITY.Value;  //数量
        dm.ADO72UNIT_PRICE.Value := Form_req.ClientDataSet1UNIT_PRICE.Value;       //不含价格
        dm.ADO72DEL_DATE.Value := Form_req.ClientDataSet1reply_date.Value;         //需求日期
        dm.ADO72UNIT_PTR.Value := Form_req.ClientDataSet1UNIT_PTR.value;            //采购单位
        dm.ADO72STATE_TAX.Value := Form_req.ClientDataSet1tax.Value;               //增值税
        DM.ADO72tax_price.Value :=Form_req.ClientDataSet1tax_price.Value;          //含税价
        dm.ADO72rohs.Value := Form_req.ClientDataSet1rohs.Value;  //环保标识
        dm.ADO72reason.Value := Form_req.ClientDataSet1reason.Value;
        dm.ADO72rkey204.Value:= Form_req.ClientDataSet1RKEY.Value; //请购明细外健
        dm.ADO72IF_urgency.Value := Form_req.ClientDataSet1IF_urgency.Value; //是否紧急物料        
        dm.ADO72.Post;

        dm.ADO70SUB_TOTAL.AsString := formatfloat('0.00',
        dm.ADO70SUB_TOTAL.Value+dm.ADO72taxprice_total.Value);
         edit2.Text := formatfloat('0.00',StrToCurr(edit2.Text)+dm.ADO72taxprice_total.Value);
         edit3.Text := formatfloat('0.00',StrToCurr(edit3.Text)+dm.ADO72tax_total.Value);
        Form_req.ClientDataSet1.Next;
       end;
     end;
     if dbedit16.Enabled=true then dbedit16.SetFocus;
  //
   end;
  end;
 finally
  form_req.Free;
 end;
end;

procedure TForm4.PopupMenu1Popup(Sender: TObject);
begin
 if dm.ADO71.IsEmpty then
  begin
   n2.Enabled := false;
   n3.Enabled := false;
  end
 else
  begin
   if dm.ADO71QUAN_RECD.Value>0 then
    n2.Enabled :=false
   else
   n2.Enabled := true;
   n3.Enabled := true;
  end;
end;

procedure tform4.po_value();
begin
  if form1.if_suplst='Y' then
   if dm.ADO04SEED_FLAG.Value<>1 then
    dm.ADO70PO_NUMBER.Value := dm.ADO04SEED_VALUE.Value
   else
  else
   if form_req.ADOQuery1FLAG.value = 'S' then
     if  dm.ADO0069o_i_flag.Value = 0 then
      dm.ADO70PO_NUMBER.Value := dm.AQ0015purchase_order.Value
     else
      dm.ADO70PO_NUMBER.Value := dm.AQ0015o_purchase_order.Value
   else
    if  dm.ADO0204o_i_flag.Value = 0 then
      dm.ADO70PO_NUMBER.Value := dm.AQ0015purchase_order.Value
    else
      dm.ADO70PO_NUMBER.Value := dm.AQ0015o_purchase_order.Value;


 if form_req.ADOQuery1FLAG.value = 'S' then //标准采购
  if dm.ADO0069o_i_flag.Value = 0 then     //国内采购
   begin
    dm.ADO70SHIPTO_ADDRESS.Value := dm.AQ0015ADDRESS_LINE_3.Value;
   end
  else                                     //国外采购
   begin
    dm.ADO70SHIPTO_ADDRESS.Value := dm.AQ0015o_address_3.Value;
   end
 else     //杂项采购
  if dm.ADO0204o_i_flag.Value = 0 then       //国内采购
   begin
    dm.ADO70SHIPTO_ADDRESS.Value := dm.AQ0015ADDRESS_LINE_3.Value;
   end
  else                                     //国外采购
   begin
    dm.ADO70SHIPTO_ADDRESS.Value := dm.AQ0015o_address_3.Value;
   end;
end;

procedure tform4.add_0071();
var
 i:word;
 v_sim_total,v_tax_total:single;
begin
for i:=1 to strtoint(form2.edit4.Text) do  //多次放记录建立
 begin
  dm.ADO71.Append;
  if v_new_type=10 then            //如果是编加辑状态下新增
   dm.ADO71PO_PTR.Value := dm.ADO70RKEY.Value
  else
   dm.ADO71PO_PTR.Value := dm.ADO70.RecNo;             //PO指针
  dm.ADO71INVT_PTR.AsString := form2.rkey17.caption;   //材料指针
  dm.ADO71QUAN_ORD.AsString := form2.Edit6.Text;       //数量
  dm.ADO71extra_req.AsString := form2.Edit12.Text;     //特别要求
  dm.ADO71REQ_DATE.Value := strtodatetime(form2.MaskEdit1.Text)+(i-1)*strtoint(form2.Edit5.text);
  if  Form2.CheckBox3.Checked then
   dm.ADO71avl_flag.Value :='Y'
  else
   dm.ADO71avl_flag.Value :='N';
 // dm.ADO71avl_flag.Value := form2.po_avlflag.Caption;  //是否需要来料检查

  dm.ADO71PRICE.Value := strtofloat(form2.Edit7.Text);              //不含税价
  dm.ADO71tax_price.Value := strtofloat(form2.Edit13.Text);          //含税价
  dm.ADO71TAX_2.Value := strtofloat(form2.Edit14.Text);              //增值税
  dm.ADO71PURCHASE_UNIT_PTR.Value := strtoint(form2.rkey02.Caption); //采购单位
  dm.ADO71CONVERSION_FACTOR.Value := strtofloat(form2.Edit15.Text);  //转换率
  dm.ADO71rohs.Value := form2.ComboBox1.Text;
  dm.ADO71IF_CAF.Value:=form2.Edit16.Text;
  dm.ADO71WO_PTR.Value:= strtoint(form2.req_unitptr.Caption);
  dm.ADO71IF_urgency.Value:=Form2.CheckBox2.Checked;  //是否紧急物料
  if Form2.Edit19.Text<>'' then
  dm.ADO71ORIG_ABBRNAME.Value := Form2.Edit19.Text;    //品牌供应商

  dm.ADO71.Post;

  dm.ADO70SUB_TOTAL.AsString := formatfloat('0.00',
  dm.ADO70SUB_TOTAL.Value+dm.ADO71taxprice_total.Value);
 end;  //结束多重发放的循环
  dm.ADO71.First;
  v_sim_total :=0;
  v_tax_total :=0;
 while not dm.ADO71.Eof do
  begin
   v_sim_total :=v_sim_total+dm.ADO71taxprice_total.Value;
   v_tax_total :=v_tax_total+dm.ADO71tax_total.Value;
   dm.ADO71.Next;
  end;
 edit2.Text := formatfloat('0.00',v_sim_total);
 edit3.Text := formatfloat('0.00',v_tax_total);
 dm.ADO71.First;                    //重新汇总金额合计和税金合计
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
try
 form2 := tform2.Create(application);
 if v_new_type=1 then  self.add_misc_visible();  //如果是新增杂项采购
 if form2.ShowModal=mrok then
  begin
   if find_supplier(trim(form2.Edit2.Text),strtoint(form2.rkey01.Caption)) then
    begin
     if strtoint(form2.rkey15.Caption)<>dm.ADO70WAREHOUSE_POINTER.Value then
      messagedlg('同一采购定单中,不能有供应商相同而工厂不同的采购!',mtinformation,[mbcancel],0)
     else
      if v_new_type = 0 then
       self.add_0071
      else
       self.add_0072;
    end
   else  //供应商以前没有新增过
    begin

     if (form1.if_suplst='Y') and (dm.ADO04.Active=false) then
      dm.ADO04.Open;

     if dm.AQ0015.Active=false then
      begin
       dm.AQ0015.Parameters[0].Value := strtoint(form2.rkey15.Caption);
       dm.AQ0015.Active:=true;            //打开工厂采购订单初始值
      end;

     if tc1.Visible=false then tc1.Visible := true;
      self.add_0070;                      //首先新增主表
     if v_new_type=0 then
      self.add_0071   //然后增加子表
     else
      self.add_0072;
     tc1.TabIndex := tc1.Tabs.Count-1;
     if dbedit16.Enabled=true then dbedit16.SetFocus;
     edit4.Text := '0.00';
    end;
  end;
finally
 form2.Free;
end;
end;

procedure TForm4.BitBtn3Click(Sender: TObject);
begin
 popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TForm4.BitBtn4Click(Sender: TObject);
begin
if tc1.Tabs.Count>0 then
 try
  form11:=tform11.Create(application);
  form11.Caption := '采购定单注释: '+dm.ADO70PO_NUMBER.Value;
  if v_new_type<>10 then      //不是编辑状态
   dm.ado0450.Filter := 'file_pointer= '+inttostr(dm.ADO70.RecNo);

  if not dm.ADO0450.IsEmpty then
   form11.Memo1.Text:=dm.ADO0450.FieldValues['memo_text'];

  if form11.ShowModal = mrok then
   begin
 if (dm.ADO0450.IsEmpty) and (trim(form11.Memo1.Text)<>'') then
  begin
   dm.ADO0450.append;
   if v_new_type=10 then
    dm.ADO0450.FieldValues['file_pointer'] := dm.ADO70RKEY.Value
   else
    dm.ADO0450.FieldValues['file_pointer'] := dm.ADO70.RecNo;
   dm.ADO0450.FieldValues['source_type'] := 2070;
   dm.ADO0450.FieldValues['memo_text'] := form11.Memo1.Text;
   dm.ADO0450.Post;
  end
 else
  if (not dm.ADO0450.IsEmpty) and (trim(form11.Memo1.Text)<>'') then
   begin
    dm.ADO0450.Edit;
    dm.ADO0450.FieldValues['memo_text']:=form11.Memo1.Text;
    dm.ADO0450.Post;
   end
  else
   if (not dm.ADO0450.IsEmpty) and (trim(form11.Memo1.Text)='') then
    dm.ADO0450.Delete;
   end;
 finally
  form11.free;
 end;
end;

function tform4.find_supplier(supplier_name:string;curr_ptr:integer):boolean;
var
 i:byte;
begin
 find_supplier := false;
 for i:=1 to tc1.Tabs.Count do
  if comparetext(supplier_name,tc1.Tabs[i-1])=0 then //如果供应商已经新增过
   begin
    dm.ADO70.MoveBy(i-dm.ADO70.RecNo);         //不但要求供应商相同而且要求
    tc1.TabIndex := i-1;
    if dm.ADO70CURRENCY_PTR.Value = curr_ptr then //货币相同
     begin
      dm.ADO70.Edit;
      if dm.ADO70PO_TYPE.Value = 'S' then
       dm.ADO71.Filter := 'po_ptr= '+inttostr(dm.ADO70.RecNo)
      else                    //杂项请购表0072
       dm.ADO72.Filter := 'poptr= '+inttostr(dm.ADO70.RecNo);
       find_supplier := true;
      break;
     end;
   end;
end;

procedure tform4.add_0070();   //手工直接新增PO
var
 i:byte;
begin
 with dm.ADO70 do
  begin    //70新增开始
   append;
   if form1.if_suplst='Y' then     //从控制码04中读取编号
    if dm.ADO04SEED_FLAG.Value<>1 then
     dm.ADO70PO_NUMBER.Value := dm.ADO04SEED_VALUE.Value;

   if form2.RadioGroup1.ItemIndex=0 then       //国内采购
    begin
     if form1.if_suplst='N' then     //不从控制码04中读取编号,从15中读取
      dm.ADO70PO_NUMBER.Value := dm.AQ0015purchase_order.Value; //给PO_number赋值
     dm.ADO70SHIPTO_ADDRESS.Value := dm.AQ0015ADDRESS_LINE_3.Value;
    end
   else                                                         //国外采购
    begin
     if form1.if_suplst='N' then
      dm.ADO70PO_NUMBER.Value := dm.AQ0015o_purchase_order.Value;
     dm.ADO70SHIPTO_ADDRESS.Value := dm.AQ0015o_address_3.Value;  //送货地址
    end;

   dm.ADO70STATE_INVT_TAX_FLAG.Value := form2.Label_vmi.caption;  //1VMI采购
   dm.ADO70EMPLOYEE_POINTER.Value := StrToInt(common.user_ptr);  //2采购人员
   dm.ADO70SUPPLIER_POINTER.AsString := form2.rkey23.Caption;     //3供应商
   dm.ADO70SECOND_WHSE_PTR.Value:=Form2.SECOND_WHSE_PTR; //VMI价格取向
   with dm.ADOQuery1 do
    begin
     active := false;
     sql.Clear;           //给联络人,电话赋值
     sql.Add('select CONTACT_NAME_1,CONTACT_NAME_2,CONTACT_NAME_3,');
     sql.Add('CONTACT_NAME_4,CONTACT_NAME_5,CONTACT_NAME_6,PHONE,');
     sql.Add('discount,discount2,discount_days,discount2_days,payment_terms,');
     sql.Add('tax_id_number,ANALYSIS_CODE1,ANALYSIS_CODE2,fax');
     sql.Add('from data0023 where rkey='+form2.rkey23.Caption);
     active :=true;
     dbCombobox1.Clear;
     for i:=1 to 6 do     //联络人
      dbcombobox1.Items.Add(fieldbyname('contact_name_'+inttostr(i)).asstring);
     dm.ADO70SUPPIER_CONTACT.Value := fieldbyname('CONTACT_NAME_1').AsString;  //5 客户联络人

     dm.ADO70CONTACT_PHONE.Value := trim(fieldbyname('PHONE').AsString)+'/'+
     trim(fieldbyname('fax').AsString); //4客户联络人电话

     dm.ADO70PAYMENT_TERMS.Value := fieldvalues['payment_terms'];  //13 净付款天数
     dm.ADO70CASH_DISCOUNT.Value := fieldvalues['discount'];      //14 付款条件
     dm.ADO70CASH_DISCOUNT2.Value := fieldvalues['discount2'];    //15 付款条件
     dm.ADO70DISCOUNT_DAYS.Value := fieldvalues['discount_days']; //16 付款条件
     dm.ADO70ANALYSIS_CODE_5.Value := trim(fieldbyname('tax_id_number').AsString);//付款方法
     dm.ADO70ANALYSIS_CODE_4.Value := trim(fieldbyname('ANALYSIS_CODE1').AsString);//票据种类
     dm.ADO70ANALYSIS_CODE_3.Value := trim(fieldbyname('ANALYSIS_CODE2').AsString);//付款地点
    end;

   with dm.ADOQuery1 do
    begin
     active:=false;
     sql.Clear;             //复制装运地址中的值
     sql.Add('SELECT Data0024.RKEY,data0024.SHIPPING_LEAD_TIME,factory_location,');
     sql.Add('data0024.state_misc_tax_flag,data0024.state_ship_tax_flag,');
     sql.Add('data0189.state_tax,data0024.shipping_method');
     sql.Add('FROM Data0024,data0189');
     sql.Add('WHERE data0024.city_tax_ptr=data0189.rkey and');
     sql.Add('Data0024.SUPPLIER_PTR ='+form2.rkey23.Caption);
      sql.Add('order by data0024.rkey');
     active:=true;
     dm.ADO70SUPP_FAC_ADD_PTR.Value := FieldValues['rkey'];  //..6供应商装运地址
     dm.ADO70FEDERAL_TAX.Value := FieldValues['state_tax'];  //..7增值税率
     dm.ADO70STATE_SHIP_TAX_FLAG.Value := FieldValues['STATE_SHIP_TAX_FLAG']; //8装运记税
     dm.ADO70STATE_MISC_TAX_FLAG.Value := FieldValues['STATE_MISC_TAX_FLAG']; //9杂项记税
     dm.ADO70SHIPPING_METHOD.Value := fieldbyname('shipping_method').AsString; //10装运方法
    end;
     dm.ADO70WAREHOUSE_POINTER.AsString := form2.rkey15.Caption; //11 工厂
     
     if ComboBox1.Items.Count=0 then
     Self.get_approve_type(dm.ADO70WAREHOUSE_POINTER.Value);

     dm.ADO70DISCOUNT2_DAYS.Value := form2.RadioGroup1.ItemIndex; //国内/国外采购
     dm.ADO70STATUS.Value := 8;                  //12 状态未审核
     dm.ADO70PO_DATE.Value := form1.sys_date;    //13 采购定单日期
     dm.ADO70COLLECT_PREPAID.Value := 'C';                       //18  后付款
     dm.ADO70CURRENCY_PTR.AsString := form2.rkey01.Caption;      //19  货币
     if dm.ADO70CURRENCY_PTR.Value =1 then //如果货币为基准货币不能编辑汇率
      begin
       dbedit5.ReadOnly:=true;
       dbedit5.Color := cl3dlight;
      end;
    with dm.ADOQuery1 do
     begin
      active:=false;
      sql.Clear;
      sql.Add('select exch_rate,BASE_TO_OTHER from data0001');
      sql.Add('where rkey='+form2.rkey01.Caption);
      active:=true;
      dm.ADO70EXCHANGE_RATE.Value := fieldvalues['BASE_TO_OTHER'];   //.20货币汇率
     end;
     dm.ADO70SHIPPING_COST.Value := 0;                           //.21装运费
     dm.ADO70MISC_CHARGE.Value := 0;                             //.22杂项费
     dm.ADO70PO_TYPE.Value := self.po_type;                      //23po类型
     if v_new_type=0 then
      dm.ADO70ANALYSIS_CODE_2.Value := form2.Label17.Caption  //27物料类别
     else
      dm.ADO70ANALYSIS_CODE_2.Value := trim(form2.edit9.Text);  //28物料类别
     dm.ADO70SUB_TOTAL.Value := 0;                               //..24 金额合计
     dm.ADO70DISCOUNT_AMOUNT.Value := 0;                         //..25 价格折扣合计
     dm.ADO70PURCHASE_ORDER_TYPE.Value :=1;                      //..26表示为手工新增
     dm.ADO70.Post;
     if v_new_type=0 then
      dm.ADO71.Filter := 'po_ptr= '+inttostr(dm.ADO70.RecNo)
     else
      dm.ADO72.Filter := 'poptr= '+inttostr(dm.ADO70.RecNo);
     self.change_seed_value(trim(dm.ADO70PO_NUMBER.Value));      //改变data0015中PO编号的初始值
     dm.ADO70.Edit;
     tc1.Tabs.Add(form2.Edit2.Text);
  end;//70新增结束
end;

procedure TForm4.TC1Change(Sender: TObject);
var
 i:word;
 v_supp_contact:string;
begin
 dm.ADO70.MoveBy(tc1.TabIndex+1-dm.ADO70.RecNo);   //移动主表主录
 v_supp_contact:=dm.ADO70SUPPIER_CONTACT.Value;
  with dm.ADOQuery1 do
   begin
    active:=false;
    sql.Clear;                      //给联络人,电话赋值
    sql.Add('select CONTACT_NAME_1,CONTACT_NAME_2,CONTACT_NAME_3,');
    sql.Add('CONTACT_NAME_4,CONTACT_NAME_5,CONTACT_NAME_6');
    sql.Add('from data0023 where rkey='+dm.ADO70SUPPLIER_POINTER.AsString);
    active :=true;
    dbCombobox1.Clear;
    for i:=1 to 6 do                //联络人
     dbcombobox1.Items.Add(fieldbyname('contact_name_'+inttostr(i)).asstring);
   end;
 if dm.ADO70.State<>dsedit then dm.ADO70.Edit;
  dbcombobox1.Field.Value := v_supp_contact;

  ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(DM.ADO70PURCHASE_TYPE.Value);

 if dbgrid1.Visible=true then       //标准采购
  change_sim_tax_total   //改变子表税表合计edit2,edit3
 else
  change72_sim_tax_total;     //改变杂项请购表0072金额合计与税金合计
  change_tax_total;           //改变杂项与运输税合计
end;                          //同时改变了总计字段的值

procedure tform4.change_seed_value(po_number:string);
var
 v_last,new_seed:string;
 i,control_no:word;
begin
  control_no := length(po_number);
if form1.if_suplst='Y' then
 begin
 if dm.ADO04SEED_FLAG.Value<>1 then
 begin
  for i := control_no downto 1 do
  if (copy(po_number,i,1)<'0') or (copy(po_number,i,1)>'9') then  //如果不是数字
   begin
    v_last := floattostr(power(10,control_no-1)+strtofloat(copy(po_number,i+1,control_no-i))+1); //后缀加1
    new_seed := copy(po_number,1,i)+copy(v_last,i+1,control_no-i);
    dm.Ado04.Edit; //使前缀不变后缀加1
    dm.ADO04SEED_VALUE.Value := new_seed;
    dm.Ado04.Post;
    break;
   end
  else
   if i=1 then //如果第一位仍然是数字
    begin
     v_last := floattostr(power(10,control_no)+strtofloat(po_number)+1);
     new_seed := copy(v_last,2,control_no);
     dm.ADO04.Edit;
     dm.ADO04SEED_VALUE.Value := new_seed;
     dm.Ado04.Post;
    end;
 end;
 end
else
  for i := control_no downto 1 do
   if (copy(po_number,i,1)<'0') or (copy(po_number,i,1)>'9') then
    begin
     v_last := floattostr(100000000000000+strtofloat(copy(PO_NUMBER,i+1,control_no-i))+1); //后缀加1
     new_seed := copy(PO_NUMBER,1,i)+copy(v_last,15-(control_no-i)+1,control_no-i);
     dm.AQ0015.edit;
     if dm.ADO70DISCOUNT2_DAYS.Value=0 then
      dm.AQ0015purchase_order.value := new_seed
     else
      dm.AQ0015o_purchase_order.value := new_seed;
     dm.AQ0015.Post;
     break;
    end
   else
    if i=1 then //如果第一位仍然是数字
     begin
      v_last := floattostr(1000000000000000+strtofloat(PO_NUMBER)+1);
      new_seed := copy(v_last,16-control_no+1,control_no);
      dm.AQ0015.edit;
      if dm.ADO70DISCOUNT2_DAYS.Value=0 then
       dm.AQ0015purchase_order.value := new_seed
      else
       dm.AQ0015o_purchase_order.value := new_seed;
      dm.AQ0015.Post;
     end;
end;

function Power(x, y : extended) : extended;
begin
 result := exp(y*ln(x));
end;

procedure TForm4.DBEdit9KeyPress(Sender: TObject; var Key: Char);
begin
 if (key = chr(46)) then
 if pos('.',dbedit9.Text)>0  //小数点不能重复
  then abort;
end;

procedure tform4.change_tax_total(); //改变杂项和运输费用的税计合计
var
 v_ship_tax,v_misc_tax,misc_base:single;
begin
 v_ship_tax:=0;
 v_misc_tax:=0;
 misc_base:=0;
if dm.ADO70STATE_SHIP_TAX_FLAG.Value='Y' then
 v_ship_tax :=strtofloat(dbedit9.Text)*dm.ADO70FEDERAL_TAX.Value*0.01;
if v_new_type<>10 then //为新增
 dm.ADO200.Filter := 'poptr= '+inttostr(dm.ADO70.RecNo);
if dm.ADO70STATE_MISC_TAX_FLAG.Value='Y' then
 begin
  dm.ado200.First;
  while not dm.ADO200.Eof do
   begin
    if dm.ADO200TAXABLE.Value='Y' then
     misc_base := misc_base+ dm.ADO200AMOUNT.Value;
    dm.ADO200.Next;
   end;
  v_misc_tax := misc_base*dm.ADO70FEDERAL_TAX.Value*0.01;
  dm.ADO200.First;
 end;
edit4.Text := formatfloat('0.00',v_ship_tax+v_misc_tax);

dm.ADO70SUB_TOTAL.AsString :=formatfloat('0.00',
                       strtofloat(edit2.Text)+
                       strtofloat(edit4.Text)+dbedit10.Field.Value+
                       strtofloat(dbedit9.Text));
end;

procedure TForm4.DBEdit9KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key<>9 then //不等于Tab键
 begin
  if trim(dbedit9.Text)='' then dbedit9.Field.Value:=0;
  change_tax_total;
 end;
end;

procedure TForm4.DBEdit9Click(Sender: TObject);
begin
if dbedit9.Font.Color=clwindowtext then
 begin
  dbedit9.Font.Color:=clblue;
  dbedit9.SelectAll;
 end;
end;

procedure TForm4.DBEdit9Exit(Sender: TObject);
begin
 dbedit9.Font.Color := clwindowtext;
end;

procedure tform4.change_sim_tax_total();
var
 v_sim_total,v_tax_total:single;
begin
 dm.ADO71.Filter := 'po_ptr= '+inttostr(dm.ADO70.RecNo);
 dm.ADO71.First;
 v_sim_total :=0;
 v_tax_total :=0;
 while not dm.ADO71.Eof do
  begin
   v_sim_total :=v_sim_total+dm.ADO71taxprice_total.Value;
   v_tax_total :=v_tax_total+dm.ADO71tax_total.Value;
   dm.ADO71.Next;
  end;
 edit2.Text := formatfloat('0.00',v_sim_total);
 edit3.Text := formatfloat('0.00',v_tax_total);
 dm.ADO71.First;
end;

procedure TForm4.PopupMenu2Popup(Sender: TObject);
begin
 if dm.ADO70.IsEmpty then
  begin
   n4.Enabled := false;
   n5.Enabled := false;
  end
 else
  begin
   n4.Enabled := true;
   n5.Enabled := true;
  end;
end;

procedure TForm4.DBGrid1DblClick(Sender: TObject);
begin
 if not dm.ADO71.IsEmpty then
  n3click(sender);
end;

procedure TForm4.PopupMenu3Popup(Sender: TObject);
begin
 if dm.ADO72.IsEmpty then
  begin
   n7.Enabled := false;
   n8.Enabled := false;
  end
 else
  begin
   n7.Enabled := true;
   if dm.ADO72QUANTITY_RECEIVED.Value>0 then
   n8.Enabled :=false
   else
   n8.Enabled := true;
  end;
end;

procedure tform4.add_0072();
var
 i:byte;
 v_sim_total,v_tax_total:single;
begin
 for i:=1 to strtoint(form2.edit4.Text) do  //多次放记录建立
  begin
   dm.ADO72.Append;
   if v_new_type=10 then            //如果是编辑状态下新增
    dm.ADO72POPTR.Value := dm.ADO70RKEY.Value
   else
    dm.ADO72POPTR.Value := dm.ADO70.RecNo;           //PO指针
   dm.ADO72DESCRIPTION.Value := form2.Edit8.Text;    //物品名称
   dm.ADO72DESCRIPTION2.Value := form2.Edit9.Text;   //类别
   dm.ADO72GUI_GE.Value := form2.Edit10.Text; //规格
   dm.ADO72QUAN_ORD.AsString := form2.Edit6.Text;   //数量
   dm.ADO72UNIT_PRICE.AsString := form2.Edit7.Text; //不含税价格
   dm.ADO72tax_price.AsString :=form2.Edit13.Text;  //含税价格
   dm.ADO72DEL_DATE.Value :=strtodatetime(form2.MaskEdit1.Text)+(i-1)*strtoint(form2.Edit5.text);
   dm.ADO72UNIT_PTR.Value := strtoint(form2.rkey02.Caption);        //单位
   dm.ADO72STATE_TAX.AsString := form2.Edit14.Text; //增值税
   dm.ADO72rohs.Value := form2.ComboBox1.Text;
   dm.ADO72IF_urgency.Value := Form2.CheckBox2.Checked; //是否紧急物料
   if  Form2.CheckBox3.Checked then   //需要IQC检查
    dm.ADO72avl_flag.Value :='Y'
   else
    dm.ADO72avl_flag.Value :='N';
   dm.ADO72.Post;
   dm.ADO70SUB_TOTAL.AsString := formatfloat('0.00',
    dm.ADO70SUB_TOTAL.Value+dm.ADO72taxprice_total.Value);
  end;
 dm.ADO72.First;
 v_sim_total :=0;
 v_tax_total :=0;
 while not dm.ADO72.Eof do
  begin
   v_sim_total :=v_sim_total+dm.ADO72taxprice_total.Value;
   v_tax_total :=v_tax_total+dm.ADO72tax_total.Value;
   dm.ADO72.Next;
  end;
 edit2.Text := formatfloat('0.00',v_sim_total);
 edit3.Text := formatfloat('0.00',v_tax_total);
 dm.ADO72.First;        //重新汇总金额合计和税金合计
end;

procedure TForm4.N6Click(Sender: TObject);
begin
try
 form2:=tform2.Create(application);
 self.add_misc_visible();
 form2.add_new_type:=1;
 form2.rkey01.Caption := dm.ADO70CURRENCY_PTR.AsString;
 form2.RadioGroup1.Visible := false;
 form2.edit14.Text:=dm.ADO70FEDERAL_TAX.AsString;
 with dm.ADOQuery1 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select rkey,code,supplier_name from data0023');
   sql.Add('where rkey='+dm.ADO70SUPPLIER_POINTER.AsString);
   active:=true;
   form2.edit2.Text := fieldvalues['code'];
   form2.Label5.Caption := fieldvalues['supplier_name'];
   form2.rkey23.Caption := dm.ADO70SUPPLIER_POINTER.AsString;
  end;
 with dm.ADOQuery1 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select rkey,warehouse_code,warehouse_name from data0015');
   sql.Add('where rkey='+dm.ADO70WAREHOUSE_POINTER.AsString);
   active:=true;
   form2.edit3.Text := fieldvalues['warehouse_code'];
   form2.Label6.Caption := fieldvalues['warehouse_name'];
   form2.rkey15.Caption := dm.ADO70WAREHOUSE_POINTER.AsString;
  end;
 if form2.ShowModal = mrok then
  begin
   form4.add_0072;                             //新增杂贡采购项目
  end;
finally
 form2.free;
end;
end;

procedure TForm4.N8Click(Sender: TObject);
begin
 edit2.Text := formatfloat('0.00',strtofloat(edit2.Text)-dm.ADO72taxprice_total.Value);
 edit3.Text := formatfloat('0.00',strtofloat(edit3.Text)-dm.ADO72tax_total.Value);
 dbedit7.Field.Value := dbedit7.Field.Value-dm.ADO72taxprice_total.Value;
 dm.ADO72.Delete;
end;

procedure tform4.change72_sim_tax_total();
var
 v_sim_total,v_tax_total:single;
begin
 dm.ADO72.Filter := 'poptr= '+inttostr(dm.ADO70.RecNo);
 dm.ADO72.First;
 v_sim_total :=0;
 v_tax_total :=0;
 while not dm.ADO72.Eof do
  begin
   v_sim_total :=v_sim_total+dm.ADO72taxprice_total.Value;
   v_tax_total :=v_tax_total+dm.ADO72tax_total.Value;
   dm.ADO72.Next;
  end;
 dm.ADO72.First;
 edit2.Text := formatfloat('0.00',v_sim_total);
 edit3.Text := formatfloat('0.00',v_tax_total);
end;

procedure TForm4.N7Click(Sender: TObject);   //编辑
 var
 v_total,v_tax:real;
begin
try
 form10:=tform10.Create(application);
 v_total := dm.ADO72taxprice_total.Value;
 v_tax := dm.ADO72tax_total.Value;
 form10.MaskEdit1.Text := dm.ADO72del_DATE.AsString;
 dm.ADO72.Edit;
 if form10.ShowModal=mrok then
  begin
   dm.ADO72del_DATE.AsString:=form10.MaskEdit1.Text;
   edit2.text := formatfloat('0.00',strtofloat(edit2.Text)-v_total+dm.ADO72taxprice_total.Value);
   edit3.Text := formatfloat('0.00',strtofloat(edit3.Text)-v_tax+dm.ADO72tax_total.Value);
   dbedit7.Field.Value := dbedit7.Field.Value-v_total+dm.ADO72taxprice_total.Value;
   dm.ADO72.Post;
  end;
finally
 form10.free;
end;
end;

procedure TForm4.N4Click(Sender: TObject);
begin
 save_cate_note(dm.ADO7011,70,'采购订单记事本: ');
end;

procedure TForm4.N5Click(Sender: TObject);
begin
 save_cate_note(dm.ADO107011,1070,'采购订单交货记事本: ');
end;

procedure TForm4.save_cate_note(adoquery:TADOQuery;source_type:integer;var_caption:string);
var
 i:word;
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption := var_caption+dm.ADO70PO_NUMBER.Value;
  if v_new_type<>10 then            //如果不是编辑状态  (新增或者导入数据)
   adoquery.Filter := 'file_pointer= '+inttostr(dm.ADO70.RecNo);
  if not adoquery.IsEmpty then
   for i:=1 to 4 do
    if adoquery.fieldbyname('note_pad_line_'+inttostr(i)).AsString <> '' then
    edit_note.Memo1.Lines.Add(adoquery.fieldbyname('note_pad_line_'+inttostr(i)).AsString);
 if edit_note.ShowModal=mrok then
  begin
   if (not adoquery.IsEmpty) and (trim(edit_note.Memo1.Text)<>'') then
    begin //原记录有记事本
     adoquery.Edit;
     for i:=1 to 4 do
      if edit_note.Memo1.Lines.Count>=i then
       ADOquery.fieldbyname('note_pad_line_'+inttostr(i)).asstring:=edit_note.Memo1.Lines[i-1]
      else
       ADOquery.fieldbyname('note_pad_line_'+inttostr(i)).asstring:='';
      ADOquery.Post;
    end
   else
    if (not ADOquery.IsEmpty) and (trim(edit_note.Memo1.Text)='') then
     ADOquery.Delete   //如果原记录有记事本但被删除了
    else
     if (ADOquery.IsEmpty) and (trim(edit_note.Memo1.Text)<>'') then
      begin    //如果原记录没有记事本，但新增了记事本
       ADOquery.Append;
       if v_new_type=10 then
        ADOquery.fieldvalues['file_pointer'] := dm.ADO70RKEY.Value
       else
        ADOquery.fieldvalues['file_pointer'] := dm.ADO70.RecNo;
       ADOquery.Fieldvalues['source_type']:=source_type;
       for i:=1 to edit_note.Memo1.Lines.Count do
       ADOquery.fieldbyname('note_pad_line_'+inttostr(i)).asstring:=edit_note.memo1.lines[i-1];
       ADOquery.Post;
      end;
  end;
 finally
  edit_note.free;
 end;
end;

procedure TForm4.DBEdit11Click(Sender: TObject);
begin
if dbedit11.Font.Color=clwindowtext then
 begin
  dbedit11.Font.Color:=clnone;
  dbedit11.SelectAll;
 end;
end;

procedure TForm4.DBEdit11Exit(Sender: TObject);
begin
if trim(dbedit11.Text)='' then dbedit11.Field.Value:='0';
 dbedit11.Font.Color := clwindowtext;
end;

procedure TForm4.DBEdit13Click(Sender: TObject);
begin
if dbedit13.Font.Color=clwindowtext then
 begin
  dbedit13.Font.Color:=clnone;
  dbedit13.SelectAll;
 end;
end;

procedure TForm4.DBEdit12Exit(Sender: TObject);
begin
if trim(dbedit12.Text)='' then dbedit12.Field.Value:='0';
 dbedit12.Font.Color := clwindowtext;
end;

procedure TForm4.DBEdit12Click(Sender: TObject);
begin
if dbedit12.Font.Color=clwindowtext then
 begin
  dbedit12.Font.Color:=clnone;
  dbedit12.SelectAll;
 end;
end;

procedure TForm4.DBEdit15Exit(Sender: TObject);
begin
if trim(dbedit15.Text)='' then dbedit15.Field.Value:='0';
 dbedit15.Font.Color := clwindowtext;
end;

procedure TForm4.DBEdit15Click(Sender: TObject);
begin
if dbedit15.Font.Color=clwindowtext then
 begin
  dbedit15.Font.Color:=clnone;
  dbedit15.SelectAll;
 end;
end;

procedure TForm4.BitBtn2Enter(Sender: TObject);
begin
 if tc1.Tabs.Count=0 then
  begin
   messagedlg('没有数据不能保存！',mterror,[mbcancel],0);
   bitbtn5.SetFocus;
   exit;
  end;
end;

function tform4.find_po_error():boolean;
var
 popo_number:array of string;
 bk:tbookmark;
 i,j:byte;
 v_error:boolean;
begin
 find_po_error:=false; //开始标识为没有错误
 v_error:=false;
 setlength(popo_number,dm.ADO70.RecordCount);//设置数组下标个数
 bk:=dm.ADO70.GetBookmark();
 dm.ADO70.First;
//==============================================================================
 while not dm.ADO70.Eof do
  begin
   if trim(dm.ADO70PURCHASE_TYPE.Value)='' then  //检查新建PO中审批类型是否为空
    begin
     messagedlg('第'+inttostr(dm.ADO70.RecNo)+'条采购订单审批类型不能为空',mterror,[mbcancel],0);
     dm.ADO70.GotoBookmark(bk);
     find_po_error := true;
     v_error := true;
     break;
    end;
   if trim(dm.ADO70PO_NUMBER.Value)='' then
    begin
     messagedlg('第'+inttostr(dm.ADO70.RecNo)+'条采购定单号码不能为空',mterror,[mbcancel],0);
     dm.ADO70.GotoBookmark(bk);
     find_po_error := true;
     v_error := true;
     break;
    end
   else
    with dm.ADOQuery1 do
     begin
      active:=false;
      sql.Clear;
      sql.Add('select rkey from data0070 where po_number='''+dm.ADO70PO_NUMBER.Value+'''');
      active:=true;
      if not isempty then
       begin
        messagedlg('第'+inttostr(dm.ADO70.RecNo)+'条采购定单号码重复',mterror,[mbcancel],0);
        dm.ADO70.GotoBookmark(bk);
        find_po_error := true;
        v_error := true;
        break;
       end
      else
       popo_number[dm.ado70.RecNo-1]:=dm.ADO70PO_NUMBER.Value;
     end;
   dm.ADO70.Next;
  end;
//=====================================================================================
 dm.ADO70.FreeBookmark(bk);
if (v_error = false) and (dm.ADO70.RecordCount>=2) then
for i:=0 to dm.ADO70.RecordCount-2 do  //检查内部新增是否重复
 for j:=i+1 to dm.ADO70.RecordCount-1 do
  if popo_number[i]=popo_number[j] then
   begin
    messagedlg('第'+inttostr(i+1)+'条采购定单号码与'+inttostr(j+1)+'条重复',mterror,[mbcancel],0);
    find_po_error:=true;
    break;
   end;
end;

procedure tform4.append_0070();  //导入数据时新增PO
var
 i:byte;
begin
 with dm.ADO70 do
  begin                //70新增开始
   append;
   po_value;           //给PO_number赋值
   dm.ADO70EMPLOYEE_POINTER.AsString:= common.user_ptr;  //2员工
   dm.ADO70PO_TYPE.Value :=form_req.ADOQuery1FLAG.value;  //标准或者杂项

   if (form_req.ADOQuery1FLAG.value = 'S')  then
    begin
     dm.ADO70SUPPLIER_POINTER.Value := dm.ADO0069SUPP_PTR.Value;   //3供应商
     dm.ADO70CURRENCY_PTR.Value := dm.ADO0069PO_LINK_PTR.Value;    //5货币
     dm.ADO70EXCHANGE_RATE.Value := dm.ado0069BASE_TO_OTHER.Value;//.20货币汇率
     dm.ADO70DISCOUNT2_DAYS.Value := dm.ADO0069o_i_flag.Value;    //国外国内采购
     dm.ADO70ANALYSIS_CODE_2.Value:= self.invtory_type(dm.ADO0069INVT_PTR.AsString);//物料类别
     tc1.Tabs.Add(trim(dm.ADO0069code.Value));
    end
   else
    begin
     dm.ADO70SUPPLIER_POINTER.Value := dm.ADO0204SUPPLIER_PTR.Value;  //供应商
     dm.ADO70CURRENCY_PTR.Value := dm.ADO0204PO_LINK_PTR.Value;      //19 货币
     dm.ADO70EXCHANGE_RATE.Value := dm.ADO0204BASE_TO_OTHER.Value;  //.20货币汇率
     dm.ADO70DISCOUNT2_DAYS.Value := dm.ADO0204o_i_flag.Value;      //国外国内采购
     dm.ADO70ANALYSIS_CODE_2.Value:= dm.ADO0204DESCRIPTION_2.Value; //物料类别
     tc1.Tabs.Add(trim(dm.ADO0204code.Value));
    end;
   with dm.ADOQuery1 do//给联络人,电话赋值,付款方法，票据种类，付款地点
    begin
     active:=false;
     sql.Clear;
     sql.Add('select CONTACT_NAME_1,CONTACT_NAME_2,CONTACT_NAME_3,');
     sql.Add('CONTACT_NAME_4,CONTACT_NAME_5,CONTACT_NAME_6,EDI_OUT_NEW_PO,');
     sql.Add('discount,discount2,discount_days,discount2_days,payment_terms,');
     sql.Add('PHONE,fax,TAX_ID_NUMBER,ANALYSIS_CODE1,ANALYSIS_CODE2,EDI_FLAG_FOR_PO');
     sql.Add('from data0023 where rkey='+dm.ADO70SUPPLIER_POINTER.AsString);
     active :=true;
     dbCombobox1.Clear;
     for i:=1 to 6 do     //联络人
      dbcombobox1.Items.Add(fieldbyname('contact_name_'+inttostr(i)).asstring);
     dm.ADO70SUPPIER_CONTACT.Value := fieldbyname('CONTACT_NAME_1').AsString; //5 客户联络人
     dm.ADO70CONTACT_PHONE.Value := trim(fieldbyname('PHONE').AsString)+'/'+
     trim(fieldbyname('fax').AsString); //4客户联络人电话
     dm.ADO70PAYMENT_TERMS.Value := fieldvalues['payment_terms'];         //13 净付款天数
     dm.ADO70CASH_DISCOUNT.Value := fieldvalues['discount'];      //14 付款条件
     dm.ADO70CASH_DISCOUNT2.Value := fieldvalues['discount2'];    //15 付款条件
     dm.ADO70DISCOUNT_DAYS.Value := fieldvalues['discount_days']; //16 付款条件
     dm.ADO70ANALYSIS_CODE_5.Value :=trim(fieldbyname('tax_id_number').AsString); //付款方法
     dm.ADO70ANALYSIS_CODE_4.Value :=trim(fieldbyname('ANALYSIS_CODE1').AsString);//票据种类
     dm.ADO70ANALYSIS_CODE_3.Value :=trim(fieldbyname('ANALYSIS_CODE2').AsString);//付款地点
     if dm.ADO70PO_TYPE.Value='S' then
     if fieldbyname('EDI_OUT_NEW_PO').AsInteger=0 then
      dm.ADO70STATE_INVT_TAX_FLAG.Value:='N'
     else
      dm.ADO70STATE_INVT_TAX_FLAG.Value:='Y';  //VMI采购  下行为VMI入库价格取向
     dm.ADO70SECOND_WHSE_PTR.Value:= fieldbyname('EDI_FLAG_FOR_PO').AsInteger;
    end;
   with dm.ADOQuery1 do//复制装运地址中的值
    begin
     active:=false;
     sql.Clear;
     sql.Add('SELECT Data0024.RKEY,data0024.SHIPPING_LEAD_TIME,factory_location,');
     sql.Add('data0024.state_misc_tax_flag,data0024.state_ship_tax_flag,');
     sql.Add('data0189.state_tax,shipping_method');
     sql.Add('FROM Data0024,data0189');
     sql.Add('WHERE data0024.city_tax_ptr=data0189.rkey and');
     sql.Add('Data0024.SUPPLIER_PTR ='+dm.ADO70SUPPLIER_POINTER.AsString);
     active:=true;
     dm.ADO70SUPP_FAC_ADD_PTR.Value := FieldValues['rkey'];  //..6供应商装运地址
     dm.ADO70FEDERAL_TAX.Value := FieldValues['state_tax'];  //..7增值税率
     dm.ADO70STATE_SHIP_TAX_FLAG.Value := FieldValues['STATE_SHIP_TAX_FLAG']; //8装运记税
     dm.ADO70STATE_MISC_TAX_FLAG.Value := FieldValues['STATE_MISC_TAX_FLAG']; //9杂项记税
     dm.ADO70SHIPPING_METHOD.Value := fieldbyname('shipping_method').AsString;
    end;
     dm.ADO70WAREHOUSE_POINTER.value :=form_req.adoquery1WHSE_PTR.Value; //10 工厂
     if ComboBox1.Items.Count=0 then
     Self.get_approve_type(dm.ADO70WAREHOUSE_POINTER.Value);  //得到审批类型
     dm.ADO70STATUS.Value := 8;                            //11  状态未审核
     dm.ADO70PO_DATE.Value := form1.sys_date;               //12  采购定单日期短格式
     dm.ADO70COLLECT_PREPAID.Value := 'C';                 //13  后付款
     if dm.ADO70CURRENCY_PTR.Value =1 then
      begin
       dbedit5.ReadOnly:=true;
       dbedit5.Color := cl3dlight;  //如果货币为基准货币不能编辑汇率
      end;
     dm.ADO70SHIPPING_COST.Value := 0;                          //.21装运费
     dm.ADO70MISC_CHARGE.Value := 0;                            //.22杂项费
     dm.ADO70SUB_TOTAL.Value := 0;                              //..24 金额合计
     dm.ADO70DISCOUNT_AMOUNT.Value := 0;                        //..25 价格折扣合计
     dm.ADO70FOB.Value :=form_req.ADOQuery1PO_REQ_NUMBER.Value; //..25请购编号030327修改
     dm.ADO70PO_REV_NO.Value := form_req.ADOQuery1DEPARTMENT_NAME.Value; //请购部门
     dm.ADO70ANALYSIS_CODE_1.Value := trim(form_req.ADOQuery1EMPLOYEE_NAME.Value);
     dm.ADO70PURCHASE_ORDER_TYPE.Value :=0;             //请购人员和导入新增
     dm.ADO70.Post;
     if (dm.ADO70PO_TYPE.Value='S') then
      dm.ADO71.Filter := 'po_ptr= '+inttostr(dm.ADO70.RecNo)
     else
      dm.ADO72.Filter := 'poptr= '+inttostr(dm.ADO70.RecNo);
      self.change_seed_value(trim(dm.ADO70PO_NUMBER.Value));   //改变data0015中PO编号的初始值
     dm.ADO70.Edit;

    with dm.ADOQuery2 do
     begin
      close;
      SQL.Clear;
      sql.Add('select * from data0011 where source_type=68');
      sql.Add('and FILE_POINTER='+form_req.ADOQuery1RKEY.AsString);
      open;
     end;
    if not dm.ADOQuery2.IsEmpty then
     with dm.ADO7011 do
      begin
       append;
       fieldvalues['file_pointer'] := dm.ADO70.RecNo;
       Fieldvalues['source_type']:=70;
       for i:=1 to 4 do
        fieldvalues['note_pad_line_'+inttostr(i)]:=dm.ADOQuery2.FieldValues['note_pad_line_'+inttostr(i)];
       Post;
      end;
   end;                    //70新增结束
end;

procedure tform4.append_0071(); //导入数据时新增标准采购条目
//var
// v_sim_total,v_tax_total:single;
begin
 dm.ADO71.Append;
 dm.ADO71PO_PTR.Value := dm.ADO70.RecNo;               //PO指针
 dm.ADO71INVT_PTR.Value := dm.ADO0069INVT_PTR.Value;   //材料指针
 dm.ADO71QUAN_ORD.Value := dm.ADO0069QUANTITY.Value;   //数量
 dm.ADO71REQ_DATE.Value := dm.ADO0069reply_date.Value; //需求日期与装运日期
 dm.ADO71PURCHASE_UNIT_PTR.Value := dm.ADO0069UNIT_PTR.Value; //采购单位
 dm.ADO71PRICE.Value := dm.ADO0069UNIT_PRICE.Value;    //不含税价格
 dm.ADO71tax_price.Value := dm.ADO0069tax_price.Value; //含税价
 dm.ADO71TAX_2.Value := dm.ADO0069tax.Value;           //税率
 dm.ADO71CONVERSION_FACTOR.Value := dm.ADO0069CONVERSION_FACTOR.Value; //转换率
 dm.ADO71reason.Value := dm.ADO0069reason.Value;       //请购原因
 dm.ADO71extra_req.Value := dm.ADO0069extra_req.Value; //特别要求
 dm.ado71avl_flag.value := dm.ado0069avl_flag.value;   //是否需要来料检查
 dm.ADO71rohs.Value:=dm.ADO0069rohs.Value;             //环保标识
 dm.ADO71WO_PTR.Value:=dm.ADO0069req_unit_ptr.Value;   //存货单位
 dm.ADO71IF_CAF.Value:=dm.ADO0069IF_CAF.Value; //caf
 dm.ado71rkey69.Value:=dm.ADO0069RKEY.Value;  //请购明细外健
 dm.ADO71IF_urgency.Value := dm.ADO0069IF_urgency.Value; //是否紧急物料
 dm.ADO71ORIG_ABBRNAME.AsVariant := dm.ADO0069ORIG_ABBRNAME.AsVariant; //品牌供应商
 dm.ADO71.Post;

 dm.ADO70SUB_TOTAL.AsString := formatfloat('0.00',
   dm.ADO70SUB_TOTAL.Value+dm.ADO71taxprice_total.Value);

{ dm.ADO71.First;
  v_sim_total :=0;
  v_tax_total :=0;
  while not dm.ADO71.Eof do
   begin
    v_sim_total :=v_sim_total+dm.ADO71taxprice_total.Value;
    v_tax_total :=v_tax_total+dm.ADO71tax_total.Value;
    dm.ADO71.Next;
   end; }
  edit2.Text := formatfloat('0.00',StrToCurr(edit2.Text)+dm.ADO71taxprice_total.Value);
  edit3.Text := formatfloat('0.00',StrToCurr(edit3.Text)+dm.ADO71tax_total.Value);
 // dm.ADO71.First;        //重新汇总金额合计和税金合计
end;

procedure tform4.append_0072(); //导入数据时新增杂项费用
//var
// v_sim_total,v_tax_total:single;
begin
   dm.ADO72.Append;
   dm.ADO72POPTR.Value := dm.ADO70.RecNo;                        //PO指针
   dm.ADO72DESCRIPTION.Value := dm.ADO0204DESCRIPTION_1.Value;   //物品名称
   dm.ADO72GUI_GE.Value := dm.ADO0204GUI_GE.Value;               //物品规格
   dm.ADO72DESCRIPTION2.Value := dm.ADO0204DESCRIPTION_2.Value;  //类别
   dm.ADO72QUAN_ORD.Value := dm.ADO0204QUANTITY_REQUIRED.Value;  //数量
   dm.ADO72UNIT_PRICE.Value := dm.ADO0204UNIT_PRICE.Value;       //价格
   dm.ADO72DEL_DATE.Value := dm.ADO0204reply_date.Value;         //出货日期
   dm.ADO72UNIT_PTR.Value := dm.ADO0204G_L_PTR.value;            //采购单位
   dm.ADO72STATE_TAX.Value := dm.ADO0204tax.Value;               //增值税
   DM.ADO72tax_price.Value :=DM.ADO0204tax_price.Value;          //含税价
   dm.ADO72rohs.Value := dm.ADO0204rohs.Value;  //环保标识
   dm.ADO72reason.Value := dm.ADO0204reason.Value;
   dm.ADO72rkey204.Value:= dm.ADO0204RKEY.Value; //请购明细外健
   dm.ADO72IF_urgency.Value := dm.ADO0204IF_urgency.Value; //是否紧急物料
   dm.ADO72.Post;

   dm.ADO70SUB_TOTAL.AsString := formatfloat('0.00',
    dm.ADO70SUB_TOTAL.Value+dm.ADO72taxprice_total.Value);
{ dm.ADO72.First;
 v_sim_total :=0;
 v_tax_total :=0;
 while not dm.ADO72.Eof do
  begin
   v_sim_total :=v_sim_total+dm.ADO72taxprice_total.Value;
   v_tax_total :=v_tax_total+dm.ADO72tax_total.Value;
   dm.ADO72.Next;
  end;
 edit2.Text := formatfloat('0.00',v_sim_total);
 edit3.Text := formatfloat('0.00',v_tax_total);
 dm.ADO72.First;        //重新汇总金额合计和税金合计
 }
  edit2.Text := formatfloat('0.00',StrToCurr(edit2.Text)+dm.ADO72taxprice_total.Value);
  edit3.Text := formatfloat('0.00',StrToCurr(edit3.Text)+dm.ADO72tax_total.Value);

end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dm.ADO200.Close;
 dm.ado7011.Close;
 dm.ado107011.Close;
 dm.ado0450.Close;
 if dm.AQ71.Active then dm.AQ71.Close;
 if dm.AQ72.Active then dm.AQ72.Close;
 if dm.AQ0015.Active = true then dm.AQ0015.Close;
 if dbgrid1.Visible = true then
  begin
   dm.ADO71.Filter := '';
   dm.ADO71.Close;
  end
 else
  begin
   if dm.AQ72.Active = true then
    begin
     dm.ADO72.Filter := '';
     dm.ADO72.Close;
    end; 
  end;
 if dm.ADOConnection1.InTransaction then dm.ADOConnection1.RollbackTrans; 
end;

procedure TForm4.DBGrid2DblClick(Sender: TObject);
begin
 if not dm.ADO72.IsEmpty then n7click(sender);
end;

procedure TForm4.change_data0070(rkey70:integer);
begin
 if dm.AQ0070PAYMENT_TERMS.Value<>dm.ADO70PAYMENT_TERMS.Value then
  with dm.ADO0339 do
   begin
    active:=false;
    Parameters.ParamValues['po_ptr'] := rkey70;
    Parameters.ParamValues['edit_empl_ptr'] := dm.ADO70EDIT_BY_EMPL_PTR.Value;
    Parameters.ParamValues['tran_type'] := 4;
    Parameters.ParamValues['tran_desc'] := '付款条件净付款天数已改';
    Parameters.ParamValues['tran_from'] := dm.AQ0070PAYMENT_TERMS.AsString;
    Parameters.ParamValues['tran_to'] := dm.ADO70PAYMENT_TERMS.AsString;
    Parameters.ParamValues['data0071_ptr'] := null;
    Parameters.ParamValues['data0072_ptr'] := null;
    ExecSQL;
   end;
 if dm.AQ0070SUPP_FAC_ADD_PTR.Value<>dm.ADO70SUPP_FAC_ADD_PTR.Value then
  with dm.ADO0339 do
   begin
    active:=false;
    Parameters.ParamValues['po_ptr'] := rkey70;
    Parameters.ParamValues['edit_empl_ptr'] := dm.ADO70EDIT_BY_EMPL_PTR.Value;
    Parameters.ParamValues['tran_type'] := 5;
    Parameters.ParamValues['tran_desc'] := '装运地点已改';
    Parameters.ParamValues['tran_from'] := dm.AQ0070SUPP_FAC_ADD_PTR.AsString;
    Parameters.ParamValues['tran_to'] := dm.ADO70SUPP_FAC_ADD_PTR.AsString;
    Parameters.ParamValues['data0071_ptr'] := null;
    Parameters.ParamValues['data0072_ptr'] := null;
    ExecSQL;
   end;
 if dm.AQ0070MISC_CHARGE.Value<>dm.ADO70MISC_CHARGE.Value then
  with dm.ADO0339 do
   begin
    active:=false;
    Parameters.ParamValues['po_ptr'] := rkey70;
    Parameters.ParamValues['edit_empl_ptr'] := dm.ADO70EDIT_BY_EMPL_PTR.Value;
    Parameters.ParamValues['tran_type'] := 8;
    Parameters.ParamValues['tran_desc'] := '杂项收费已改';
    Parameters.ParamValues['tran_from'] := dm.AQ0070MISC_CHARGE.AsString;
    Parameters.ParamValues['tran_to'] := dm.ADO70MISC_CHARGE.AsString;
    Parameters.ParamValues['data0071_ptr'] := null;
    Parameters.ParamValues['data0072_ptr'] := null;
    ExecSQL;
   end;
 if dm.AQ0070shipping_cost.Value<>dm.ADO70SHIPPING_COST.Value then
  with dm.ADO0339 do
   begin
    active:=false;
    Parameters.ParamValues['po_ptr'] := rkey70;
    Parameters.ParamValues['edit_empl_ptr'] := dm.ADO70EDIT_BY_EMPL_PTR.Value;
    Parameters.ParamValues['tran_type'] := 9;
    Parameters.ParamValues['tran_desc'] := '装运费用已改';
    Parameters.ParamValues['tran_from'] := dm.AQ0070shipping_cost.AsString;
    Parameters.ParamValues['tran_to'] := dm.ADO70SHIPPING_COST.AsString;
    Parameters.ParamValues['data0071_ptr'] := null;
    Parameters.ParamValues['data0072_ptr'] := null;
    ExecSQL;
   end;

 if dm.AQ0070sub_total.Value<>dm.ADO70sub_total.Value then
 with dm.ASP362 do
  begin
   close;
   Parameters[1].Value:=dm.aq0070fob.value;
   open;
   if not isempty then
    begin
     edit;
     fieldvalues['used_period_'+inttostr(dm.ASP362v_month.Value)]:=
     formatfloat('0.00',fieldvalues['used_period_'+inttostr(dm.ASP362v_month.Value)]+
     (dm.ADO70SUB_TOTAL.Value-dm.aq0070sub_total.value)*dm.Aq0070EXCHANGE_RATE.Value);
     post;
    end;
   Close;
  end;
end;

procedure TForm4.change_data0071(rkey70:integer);
var
 search_option:tlocateoptions;
begin
 search_option := [lopartialkey];
 dm.ADO71.First;
 while not dm.ADO71.Eof do
  begin
   if dm.aq71.Locate('rkey',dm.ADO71RKEY.value,search_option) then
    begin     //看那些字段被修改
     if dm.AQ71REQ_DATE.Value<>dm.ADO71REQ_DATE.Value then
      with dm.ADO0339 do
       begin
        active:=false;
        Parameters.ParamValues['po_ptr'] := rkey70;
        Parameters.ParamValues['edit_empl_ptr'] := dm.ADO70EDIT_BY_EMPL_PTR.Value;
        Parameters.ParamValues['tran_type'] := 1;
        Parameters.ParamValues['tran_desc'] := '采购项目要求到货日期已改';
        Parameters.ParamValues['tran_from'] := dm.AQ71REQ_DATE.AsString;
        Parameters.ParamValues['tran_to'] := dm.ADO71REQ_DATE.AsString;
        Parameters.ParamValues['data0071_ptr'] := dm.ADO71RKEY.Value;
        Parameters.ParamValues['data0072_ptr'] := null;
        ExecSQL;
       end;
     if dm.AQ71QUAN_ORD.Value<>dm.ADO71QUAN_ORD.Value then
      with dm.ADO0339 do
       begin
        active:=false;
        Parameters.ParamValues['po_ptr'] := rkey70;
        Parameters.ParamValues['edit_empl_ptr'] := dm.ADO70EDIT_BY_EMPL_PTR.Value;
        Parameters.ParamValues['tran_type'] := 2;
        Parameters.ParamValues['tran_desc'] := '采购项目订购数量已改';
        Parameters.ParamValues['tran_from'] := dm.AQ71quan_ord.AsString;
        Parameters.ParamValues['tran_to'] := dm.ADO71quan_ord.AsString;
        Parameters.ParamValues['data0071_ptr'] := dm.ADO71RKEY.Value;
        Parameters.ParamValues['data0072_ptr'] := null;
        ExecSQL;
       end;
     if dm.AQ71PRICE.Value<>dm.ADO71price.Value then
      with dm.ADO0339 do
       begin
        active:=false;
        Parameters.ParamValues['po_ptr'] := rkey70;
        Parameters.ParamValues['edit_empl_ptr'] := dm.ADO70EDIT_BY_EMPL_PTR.Value;
        Parameters.ParamValues['tran_type'] := 3;
        Parameters.ParamValues['tran_desc'] := '采购项目单价已改';
        Parameters.ParamValues['tran_from'] := dm.AQ71price.AsString;
        Parameters.ParamValues['tran_to'] := dm.ADO71price.AsString;
        Parameters.ParamValues['data0071_ptr'] := dm.ADO71RKEY.Value;
        Parameters.ParamValues['data0072_ptr'] := null;
        ExecSQL;
       end;
    end
   else //在原采购单中没有那幺就是新增的采购项目
    with dm.ADO0339 do
     begin
      active:=false;
      Parameters.ParamValues['po_ptr'] := rkey70;
      Parameters.ParamValues['edit_empl_ptr'] := dm.ADO70EDIT_BY_EMPL_PTR.Value;
      Parameters.ParamValues['tran_type'] := 6;
      Parameters.ParamValues['tran_desc'] := '插入一个标准采购项目';
      Parameters.ParamValues['tran_from'] := null;
      Parameters.ParamValues['tran_to'] := null;
      Parameters.ParamValues['data0071_ptr'] := dm.ADO71RKEY.Value;
      Parameters.ParamValues['data0072_ptr'] := null;
      ExecSQL;
     end;

   dm.ADO71.Next;
  end;

 dm.ADO71.First;
 dm.AQ71.First;
 while not dm.AQ71.Eof do
  begin
   if not dm.ADO71.Locate('rkey',dm.Aq71RKEY.value,search_option) then
    with dm.ADO0339 do
     begin
      active:=false;
      Parameters.ParamValues['po_ptr'] := rkey70;
      Parameters.ParamValues['edit_empl_ptr'] := dm.ADO70EDIT_BY_EMPL_PTR.Value;
      Parameters.ParamValues['tran_type'] := 7;
      Parameters.ParamValues['tran_desc'] := '删除了一个标准采购项目';
      Parameters.ParamValues['tran_from'] := null;
      Parameters.ParamValues['tran_to'] := null;
      Parameters.ParamValues['data0071_ptr'] := dm.aq71RKEY.Value;
      Parameters.ParamValues['data0072_ptr'] := null;
      ExecSQL;
     end;
   dm.AQ71.Next;
  end;
 dm.ADO71.First;
end;

procedure TForm4.change_data0072(rkey70:integer);
var
 search_option:tlocateoptions;
begin
 search_option := [lopartialkey];
 dm.ADO72.First;
 while not dm.ADO72.Eof do
  begin
   if dm.aq72.Locate('rkey',dm.ADO72RKEY.value,search_option) then
    begin     //看那些字段被修改
      if dm.AQ72DEL_DATE.Value <> dm.ADO72DEL_DATE.Value then
      with dm.ADO0339 do
       begin
        active:=false;
        Parameters.ParamValues['po_ptr'] := rkey70;
        Parameters.ParamValues['edit_empl_ptr'] := dm.ADO70EDIT_BY_EMPL_PTR.Value;
        Parameters.ParamValues['tran_type'] := 1;
        Parameters.ParamValues['tran_desc'] := '杂项采购条目要求到货日期已改';
        Parameters.ParamValues['tran_from'] := dm.AQ72del_DATE.AsString;
        Parameters.ParamValues['tran_to'] := dm.ADO72del_DATE.AsString;
        Parameters.ParamValues['data0071_ptr'] := null;
        Parameters.ParamValues['data0072_ptr'] := dm.ADO72RKEY.Value;
        ExecSQL;
       end;
     if dm.AQ72QUAN_ORD.Value<>dm.ADO72QUAN_ORD.Value then
      with dm.ADO0339 do
       begin
        active:=false;
        Parameters.ParamValues['po_ptr'] := rkey70;
        Parameters.ParamValues['edit_empl_ptr'] := dm.ADO70EDIT_BY_EMPL_PTR.Value;
        Parameters.ParamValues['tran_type'] := 2;
        Parameters.ParamValues['tran_desc'] := '杂项采购条目订购数量已改';
        Parameters.ParamValues['tran_from'] := dm.AQ72quan_ord.AsString;
        Parameters.ParamValues['tran_to'] := dm.ADO72quan_ord.AsString;
        Parameters.ParamValues['data0071_ptr'] := null;
        Parameters.ParamValues['data0072_ptr'] := dm.ADO72RKEY.Value;
        ExecSQL;
       end;
     if dm.AQ72UNIT_PRICE.value<>dm.ADO72UNIT_PRICE.Value then
      with dm.ADO0339 do
       begin
        active:=false;
        Parameters.ParamValues['po_ptr'] := rkey70;
        Parameters.ParamValues['edit_empl_ptr'] := dm.ADO70EDIT_BY_EMPL_PTR.Value;
        Parameters.ParamValues['tran_type'] := 3;
        Parameters.ParamValues['tran_desc'] := '杂项采购条目单价已改';
        Parameters.ParamValues['tran_from'] := dm.AQ72unit_price.AsString;
        Parameters.ParamValues['tran_to'] := dm.ADO72unit_price.AsString;
        Parameters.ParamValues['data0071_ptr'] := null;
        Parameters.ParamValues['data0072_ptr'] := dm.ADO72RKEY.Value;
        ExecSQL;
       end;
    end
   else //在原采购单中没有那幺就是新增的采购项目
    with dm.ADO0339 do
     begin
      active:=false;
      Parameters.ParamValues['po_ptr'] := rkey70;
      Parameters.ParamValues['edit_empl_ptr'] := dm.ADO70EDIT_BY_EMPL_PTR.Value;
      Parameters.ParamValues['tran_type'] := 6;
      Parameters.ParamValues['tran_desc'] := '插入一个杂项采购项目';
      Parameters.ParamValues['tran_from'] := null;
      Parameters.ParamValues['tran_to'] := null;
      Parameters.ParamValues['data0071_ptr'] := null;
      Parameters.ParamValues['data0072_ptr'] := dm.ADO72RKEY.Value;
      ExecSQL;
     end;
   dm.ADO72.Next;
  end;

 dm.ADO72.First;
 dm.AQ72.First;
 while not dm.AQ72.Eof do
  begin
   if not dm.ADO72.Locate('rkey',dm.Aq72RKEY.value,search_option) then
     with dm.ADO0339 do //经过编辑过后的杂项采购没有原来的采购条目
      begin             //那幺就删除了
       active:=false;
       Parameters.ParamValues['po_ptr'] := rkey70;
       Parameters.ParamValues['edit_empl_ptr'] := dm.ADO70EDIT_BY_EMPL_PTR.Value;
       Parameters.ParamValues['tran_type'] := 7;
       Parameters.ParamValues['tran_desc'] := '删除了一个杂项采购条目';
       Parameters.ParamValues['tran_from'] := null;
       Parameters.ParamValues['tran_to'] := null;
       Parameters.ParamValues['data0071_ptr'] := null;
       Parameters.ParamValues['data0072_ptr'] := dm.aq72RKEY.Value;
       ExecSQL;
      end;
   dm.AQ72.Next;
  end;
  dm.ADO72.First;
end;

procedure TForm4.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if v_close<>1 then  //表示非正常退出
  begin
   if dm.AQ0015.Active = true then dm.AQ0015.CancelBatch();
   if dm.ADO70.Active = true then dm.ADO70.CancelBatch();
   if dm.ADO7011.Active = true then dm.ADO7011.CancelBatch();
   if dm.ADO107011.Active = true then dm.ADO107011.CancelBatch();
   if dm.ADO200.Active = true then dm.ADO200.CancelBatch();
   if dm.ADO0450.Active = true then dm.ADO0450.CancelBatch();
  end;
end;


procedure tform4.add_misc_visible();
begin
 with form2 do
  begin
   label14.Visible := true;
   edit8.Visible := true;
   edit9.Visible := true;
   combobox1.Enabled := true;
   label15.Caption := '类别:';
   label16.Visible:=true;
   edit12.visible := false;
   label1.Visible := false;
   label2.Visible := false;
   edit1.Visible := false;
   bitbtn1.Visible := false;
   label11.Caption := '价格:';
   label1.Caption := '物品名称:';
   edit7.ReadOnly := false;
   edit7.Color := clwindow;
   edit10.Visible:=true;
   label18.Visible:=true;
   label19.Visible:=true;
   edit11.Visible:=true;
   bitbtn4.Visible:=true;
   button3.Visible:=false;
   edit14.Enabled:=true;   //税率
   edit7.Enabled:=false;  //不含税价
   CheckBox3.Enabled:=true; //需要IQC
   edit15.Visible:=false;
   label23.Visible:=false;
   Label30.Visible:=false;
   Edit19.Visible:=false;
   BitBtn5.Visible:=False;

   label21.Top:=340;
   edit14.Top:=336;
   label22.Top:=340;      
  end;
end;

procedure TForm4.DBEdit16Exit(Sender: TObject);
var
 v_end:string;
begin
   v_end:=copy(dbedit16.Text,length(trim(dbedit16.Text)),1);
   if (v_end<'0') or (v_end>'9') then
   begin
    application.MessageBox('最后一位必须是一个整数','控制号码',mb_ok);
    dbedit16.SetFocus;
   end;
end;

procedure TForm4.TC1Changing(Sender: TObject; var AllowChange: Boolean);
var
 v_end:string;
begin
 v_end:=copy(dbedit16.Text,length(trim(dbedit16.Text)),1);
 if (v_end<'0') or (v_end>'9') then
  begin
   application.MessageBox('最后一位必须是一个整数','控制号码',mb_ok);
   AllowChange:=false;
   dbedit16.SetFocus;
  end
 else
  allowchange:=true;
end;

function tform4.invtory_type(invt_ptr:string):string;
begin
 with dm.ADOQuery2 do
  begin
   close;
   sql.Clear;
   sql.Add('SELECT Data0019.inv_group_desc');
   sql.Add('FROM Data0019 INNER JOIN');
   sql.Add('Data0496 ON Data0019.rkey = Data0496.group_ptr INNER JOIN');
   sql.Add('Data0017 ON Data0496.RKEY = Data0017.GROUP_PTR');
   sql.Add('where data0017.rkey='+invt_ptr);
   open;
  end;
 invtory_type:=trim(dm.ADOQuery2.fieldbyname('inv_group_desc').AsString);
end;

function tform4.find_pr_number():boolean;
begin
 find_pr_number:=false;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey,PURCHASE_ORDER_TYPE from data0070');
   sql.Add('where fob='''+trim(form_req.ADOQuery1PO_REQ_NUMBER.Value)+'''');
   open;
  end;
 if not dm.ADOQuery1.IsEmpty then find_pr_number:=true;
end;

procedure TForm4.update_data0028;
begin
 dm.ADO28.Close;
 dm.ADO28.Parameters[0].Value:=dm.ADO70SUPPLIER_POINTER.Value;
 dm.ADO28.Parameters[1].Value:=dm.ADO71INVT_PTR.Value;
 dm.ADO28.Open;
 if dm.ADO71PRICE.Value<>dm.ADO28PRICE_1.Value then
  begin
   dm.ADO28.Edit;
   dm.ADO28PRICE_1.Value:=dm.ADO71PRICE.Value;
   dm.ADO28.Post;
  end;
end;

procedure TForm4.BitBtn6Click(Sender: TObject);
begin
 form_dept:=tform_dept.Create(application);
 if form_dept.ShowModal=mrok then
  begin
   dm.ADO70PO_REV_NO.Value:=form_dept.ADOQuery1dept_code.Value;
   Label30.Caption := Form_dept.ADOQuery1dept_name.Value;
  end;
 form_dept.Free;
end;

procedure TForm4.ComboBox1Change(Sender: TObject);
begin
if dm.ADO70.State<>dsEdit then  dm.ADO70.Edit;

 dm.ADO70PURCHASE_TYPE.Value:=ComboBox1.Text;

end;

procedure TForm4.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if dm.ADO71CRITICAL_MATL.Value='是' then
  DBGrid1.Canvas.Font.Color := clRed;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm4.get_approve_type(rkey15: Integer);
begin
  ComboBox1.Items.Clear;
  with dm.ADOQuery1 do
  begin
    Close;
    sql.Text:='select purchase_type from data0077 '+
     'where warehouse_ptr='+inttostr(rkey15)+
     ' group by purchase_type';
    open;
    while not Eof do
     begin
      ComboBox1.Items.Add(fieldbyname('purchase_type').AsString);
      Next;
     end;
  end;
end;

procedure TForm4.DBCheckBox2Click(Sender: TObject);
begin
DBRadioGroup2.Enabled:=DBCheckBox2.Checked;
end;

procedure TForm4.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in [#8]) then
  begin
    DBEdit1.ReadOnly:=True;
  end
  else
  begin
    DBEdit1.ReadOnly :=False;
  end;
end;

procedure TForm4.DBEdit1Exit(Sender: TObject);
begin
  if Trim(DBEdit1.Text)='' then
  begin
    Label30.Caption :='';
  end;
end;

procedure TForm4.dbchk_CPClick(Sender: TObject);
begin
if  (dbchk_CP.Checked) and (dm.ADO70.State in [dsedit,dsInsert]) then
 begin
  DBEdit15.Field.Value:=0;
  DBEdit13.Field.Value:='';
 end;
end;

end.
