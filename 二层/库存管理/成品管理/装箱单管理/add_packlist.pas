unit add_packlist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  qDialogs, StdCtrls, Buttons, Mask, DBCtrls, Grids, Menus, DB, ADODB,
  ExtCtrls,math,DateUtils;

type
  TForm5 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Edit2: TEdit;
    BitBtn5: TBitBtn;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    BitBtn6: TBitBtn;
    Label7: TLabel;
    Edit3: TEdit;
    BitBtn7: TBitBtn;
    Label8: TLabel;
    Label9: TLabel;
    MaskEdit1: TMaskEdit;
    StringGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    StringGrid2: TStringGrid;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    Edit4: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    Edit5: TEdit;
    Label19: TLabel;
    DBEdit9: TDBEdit;
    Label20: TLabel;
    DBEdit10: TDBEdit;
    N3: TMenuItem;
    DBEdit11: TDBEdit;
    Label21: TLabel;
    po_number: TLabel;
    N4: TMenuItem;
    Label22: TLabel;
    DBEdit12: TDBEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Label23: TLabel;
    Edit6: TEdit;
    BitBtn8: TBitBtn;
    Label24: TLabel;
    dbcbbreference_number: TDBComboBox;
    BitBtn9: TBitBtn;
    Label25: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure save_note();
    procedure save6411_note();
    procedure get_info(rkey10:integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MaskEdit1Exit(Sender: TObject);
    function v_houzui(v_leng:byte):string;
    function custinvoice_day(cust_ptr:integer):boolean;
    procedure N3Click(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N4Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
  private
    { Private declarations }
   v_close:byte;
   max_days,CUSTOMER_TYPE:Integer;
   invoice_number:string;
   procedure credit_sales(rkey439:integer);
   function find_trustsaleserror(rkey:integer):boolean;
   function return_rkey(sgrid: tstringgrid;
    col: integer): string;
   function find_numbererror(number: string): boolean;
   procedure update_04(v_seed: string);
   function find_error(rkey439:Integer;rkey64: string): boolean;
   function CheckIsChanged: Boolean;
  public
    { Public declarations }
   v_post:boolean;
   rkey439:Integer;
  end;

var
  Form5: TForm5;
  pack_note: tstringlist;
implementation
uses damo, customer_search, shipaddress, Unit_search, shipmeoth, main, note,
     pack_list,  assign_split,common,Pick_Item_Single,ConstVar;
{$R *.dfm}

function TForm5.find_error(rkey439:Integer;rkey64: string): boolean;
 begin

  result:=False;

   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('select rkey from data0064');
     sql.Add('where rkey in'+rkey64);
     sql.Add('and packing_slip_flag=''1''');
     if rkey439 > 0 then
     SQL.Add('and packing_list_ptr<>'+inttostr(rkey439));
     open;
     if not IsEmpty then result := true;
    end;

 end;

function TForm5.find_numbererror(number: string): boolean;
begin
 result := false;
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0439');
   sql.Add('where delivery_no='''+number+'''');
   open;
   if not IsEmpty then result := true;
  end;
end;

procedure TForm5.update_04(v_seed: string);
var
 i,v_length:integer;
 v_last,new_seed:string;
begin

 v_length := length(v_seed);
 for i := v_length downto 1 do
  if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
   begin
    v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
    new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
    dm.ADO04.Edit; //使前缀不变后缀加1
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
     dm.ADO04.Post;
    end;

end;

function TForm5.custinvoice_day(cust_ptr: integer): boolean;
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('SELECT invoice_number,max(DATEDIFF(day,DUE_DATE,GETDATE())) AS days');
  sql.Add('FROM dbo.Data0112');
  sql.Add('where INVOICE_STATUS=1');
  SQL.add('and INVOICE_TOTAL-amount_paid-CASH_DISC > 1');  //欠款大于1元
  sql.Add('and CUSTOMER_PTR='+inttostr(cust_ptr));
  sql.Add('group by invoice_number');
  sql.Add('ORDER BY MAX(DATEDIFF(day, due_date, GETDATE())) DESC');
  open;
  if not isempty then invoice_number:=fieldvalues['invoice_number'];
 end;
 if dm.ADOQuery1.FieldValues['days']=null then
  custinvoice_day:=false
 else
  if dm.ADOQuery1.FieldValues['days']>self.max_days then
   custinvoice_day:=true
  else
   custinvoice_day:=false; 
end;

procedure TForm5.BitBtn3Click(Sender: TObject);
begin
 v_close:=1;
 dm.ADO0439.Cancel;
 dm.ADO0439.Close;
 dm.ADO0439.Open;
 close;
end;

procedure TForm5.BitBtn4Click(Sender: TObject);
begin
 try
  frmcustsearch:=Tfrmcustsearch.Create(application);
  frmcustsearch.MaskEdit1.Text := trim(edit1.Text);
  if frmcustsearch.ADOQuery1.IsEmpty then
   begin
    Messagedlg('没有找到相关的记录!',mtinformation,[mbok],0);
    edit1.SetFocus;
   end
  else
  if frmcustsearch.ShowModal=mrok then
   begin
    EDIT1.Text := trim(frmcustsearch.ADOQuery1.FieldValues['cust_code']);
    edit1.Font.Color := clwindowtext;
    edit2.Text:='';
    bitbtn5.SetFocus;
    label3.Caption := frmcustsearch.ADOQuery1.FieldValues['customer_name'];
    dm.ADO0439customer_ptr.Value := frmcustsearch.ADOQuery1.fieldvalues['rkey'];
    self.get_info(dm.ADO0439customer_ptr.Value);//得到装箱单记事本
    self.max_days:= frmcustsearch.ADOQuery1.fieldbyname('INVOICE_NOTE_PAD_PTR').AsInteger;
    self.CheckBox2.Checked:=frmcustsearch.ADOQuery1.fieldbyname('DO_SMOOTHING').AsInteger=1;
    self.CheckBox3.Checked:=frmcustsearch.ADOQuery1.fieldbyname('cod_flag').AsString='Y';
    self.CUSTOMER_TYPE:=FrmCustSearch.ADOQuery1CUSTOMER_TYPE.Value;
    with dm.ADOQuery1 do
     begin
      close;
      sql.Clear;
      sql.Add('select rkey,location,SHIP_SHIPPING_METHOD');
      sql.Add('from data0012');
      sql.Add('where customer_ptr='+dm.ADO0439customer_ptr.AsString);
      sql.Add('and LANGUAGE_FLAG=''Y''');
      sql.Add('order by rkey');
      open;
      if not IsEmpty then
      begin
       edit2.Text:=fieldvalues['location'];
       dm.ADO0439ship_addr_ptr.Value:=fieldvalues['rkey'];
       dm.ADO0439shipping_method.AsVariant:=fieldvalues['SHIP_SHIPPING_METHOD'];
      end;
     end;
   end
  else
   edit1.SetFocus;
 finally
  frmcustsearch.free;
 end;
end;

procedure TForm5.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'BitBtn4') and
   (trim(edit1.Text)<>'') then
 try
  frmcustsearch:=Tfrmcustsearch.Create(application);
  frmcustsearch.MaskEdit1.Text := trim(edit1.Text);
 if Comparetext(trim(edit1.Text),trim(frmcustsearch.ADOQuery1.Fieldbyname('cust_code').AsString))=0 then
   begin
    EDIT1.Text := trim(frmcustsearch.ADOQuery1.FieldValues['cust_code']);
    edit1.Font.Color := clwindowtext;
    label3.Caption := frmcustsearch.ADOQuery1.FieldValues['customer_name'];
    dm.ADO0439customer_ptr.Value := frmcustsearch.ADOQuery1.fieldvalues['rkey'];
    self.get_info(dm.ADO0439customer_ptr.Value);  //得到装箱单记事本
    self.max_days := frmcustsearch.ADOQuery1.fieldbyname('INVOICE_NOTE_PAD_PTR').AsInteger;
    self.CheckBox2.Checked := frmcustsearch.ADOQuery1.fieldbyname('DO_SMOOTHING').AsInteger=1;
    self.CheckBox3.Checked := frmcustsearch.ADOQuery1.fieldbyname('cod_flag').AsString='Y';
    self.CUSTOMER_TYPE := FrmCustSearch.ADOQuery1CUSTOMER_TYPE.Value;
    with dm.ADOQuery1 do
     begin
      close;
      sql.Clear;
      sql.Add('select rkey,location,SHIP_SHIPPING_METHOD');
      sql.Add('from data0012');
      sql.Add('where customer_ptr='+dm.ADO0439customer_ptr.AsString);
      sql.Add('and LANGUAGE_FLAG=''Y''');
      sql.Add('order by rkey');
      open;
      if not IsEmpty then
      begin
       edit2.Text:=fieldvalues['location'];
       dm.ADO0439ship_addr_ptr.Value:=fieldvalues['rkey'];
       dm.ADO0439shipping_method.AsVariant:=fieldvalues['SHIP_SHIPPING_METHOD'];
      end;
     end;
   end
 else
   begin
    messagedlg('请输入正确的客户代码!',mtinformation,[mbcancel],0);
    edit1.SetFocus;
   end;
 finally
  frmcustsearch.free;
 end
else
if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'BitBtn4') and
   (trim(edit1.Text)='') then
 begin
  label3.Caption:='';
  edit2.Text:= '';
 end;
end;

procedure TForm5.BitBtn5Click(Sender: TObject);
begin
 try
  form_address:=tform_address.Create(application);
  if trim(edit1.Text)<>'' then
   with form_address.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('select rkey,location,ship_to_address_1,CUSTOMER_PTR,');
     sql.Add('state,zip,SHIP_SHIPPING_METHOD from data0012');
     sql.Add('where customer_ptr='+dm.ADO0439customer_ptr.AsString);
     open;
    end;
   if form_address.ShowModal=mrok then
    begin
     edit2.Text:=form_address.ADOQuery1location.Value;
     dm.ADO0439ship_addr_ptr.Value:=form_address.ADOQuery1rkey.Value;
     if trim(edit1.Text)='' then
      with dm.ADOQuery1 do
       begin
        close;
        sql.Clear;
        sql.Add('select cust_code,customer_name,DO_SMOOTHING,cod_flag,CUSTOMER_TYPE from data0010');
        sql.Add('where rkey='+form_address.ADOQuery1CUSTOMER_PTR.AsString);
        open;
        edit1.Text:=fieldvalues['cust_code'];
        edit1.Font.Color:=clwindowtext;
        label3.Caption:=fieldbyname('customer_name').AsString;
        dm.ADO0439customer_ptr.Value:=form_address.ADOQuery1CUSTOMER_PTR.Value;
        checkbox2.Checked:=fieldbyname('DO_SMOOTHING').AsInteger=1;
        checkbox3.Checked:=fieldbyname('cod_flag').AsString='Y';
        CUSTOMER_TYPE:=fieldbyname('CUSTOMER_TYPE').AsInteger;
       end;
     dm.ADO0439shipping_method.Value:=form_address.ADOQuery1SHIP_SHIPPING_METHOD.Value;
     dbedit4.SetFocus;
    end
   else
    edit2.SetFocus;
 finally
  form_address.Free;
 end;
end;

procedure TForm5.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'EMPL_CODE/雇员代码/100,EMPLOYEE_NAME/雇员姓名/100,PHONE/电话号码/200';
    InputVar.Sqlstr := 'select rkey,EMPL_CODE,EMPLOYEE_NAME from data0005  order by EMPL_CODE ';
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      DBEdit3.Text := frmPick_Item_Single.adsPick.FieldValues['EMPLOYEE_NAME'];
      DBEdit3.Tag := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;

end;

procedure TForm5.BitBtn6Click(Sender: TObject);
begin
try
 form_shipmethod:=tform_shipmethod.Create(application);
 if form_shipmethod.ShowModal=mrok then
  begin
   dbedit2.Field.Value:=form_shipmethod.ADOQuery1.Fieldbyname('description').AsString;
   dbcbbreference_number.SetFocus;
  end
 else
  dbedit2.SetFocus;
finally
 form_shipmethod.free;
end;
end;

function TForm5.return_rkey(sgrid: tstringgrid;
  col: integer): string;
var
 i:integer;
 rkey_list:string;
begin
 result:='';
 rkey_list:='(0';
 for i:=1 to sgrid.RowCount-2 do
   rkey_list:=rkey_list+','+ sgrid.Cols[col].Strings[i];
 rkey_list:=rkey_list+')';
 result:= rkey_list;
end;

procedure TForm5.N1Click(Sender: TObject);
begin
try
 form1:=tform1.Create(application);
  with dm.ADOTa64 do
  begin
    Close;
    sql.Strings[SQL.count-5]:=Format(' and data0064.rkey not in %s ',[self.return_rkey(StringGrid2,0)]);
    if edit6.Text = '' then
    sql.Strings[SQL.count-4]:=''
    else
    sql.Strings[SQL.count-4]:=Format(' and data0015.WAREHOUSE_CODE = ''%s'' ',[edit6.Text]);
    if edit1.Text='' then
    sql.Strings[SQL.count-3]:=' and Data0060.CUSTOMER_PTR > 0 '
    else
    sql.Strings[SQL.count-3]:=Format(' and Data0060.CUSTOMER_PTR = %s ',[dm.ADO0439customer_ptr.AsString]);
    Open;
  end; 
 if dm.ADOTa64.IsEmpty then
  messagedlg('对不起该客户暂时没有装运指派!',mtinformation,[mbok],0)
 else
 if form1.ShowModal=mrok then
  begin

   if stringgrid1.RowCount=2 then
    begin
     Edit6.Tag:=dm.ADOTa64rkey15.Value;
     Edit6.Text:=dm.ADOTa64WAREHOUSE_CODE.Value;
     Label24.Caption:=dm.ADOTa64abbr_name.Value;
     if Trim(DBEdit12.Text)='' then
     DBEdit12.Text:= dm.ADOTa64ORIG_CUSTOMER.AsString
     else
     begin
      if (dm.ADOTa64ORIG_CUSTOMER.Value<>DBEdit12.Text) and
      (messagebox(handle,pchar('与首条记录关联原客户不一致,是否继续!'),pchar('提示'),MB_YESNO+MB_ICONINFORMATION+MB_DEFBUTTON2)=IDNO) then
       Exit;
     end;
     dm.ADO0439currency_ptr.Value:=dm.ADOTa64CURRENCY_PTR.Value;
     edit4.Text:=dm.ADOTa64CURR_CODE.Value;
     dm.ADO0439shipping_method.Value:=dm.ADOTa64SHIPPING_METHOD.Value;
     label17.Caption:=dm.ADOTa64CURR_NAME.Value;
     self.po_number.Caption:=dm.ADOTa64PO_NUMBER.Value;  //将客户订单号记录下来
     if trim(edit2.Text)='' then  //如是之前没有选择客户
      begin
       edit1.Text := dm.ADOTa64CUST_CODE.Value;
       edit1.Font.Color := clwindowtext;
       label3.Caption := dm.ADOTa64CUSTOMER_NAME.Value;
       dm.ADO0439customer_ptr.Value := dm.adota64customer_ptr.Value;
       self.get_info(dm.ADO0439customer_ptr.Value); //得到装箱单记事本
       self.max_days:=dm.ADOTa64INVOICE_NOTE_PAD_PTR.Value;
       edit2.Text := dm.ADOTa64LOCATION.Value;
       dm.ADO0439ship_addr_ptr.Value := dm.ADOTa64CUST_SHIP_ADDR_PTR.Value;
       self.CheckBox2.Checked:=dm.ADOTa64DO_SMOOTHING.Value=1;
       self.CheckBox3.Checked:=dm.ADOTa64COD_FLAG.Value='Y';
       self.CUSTOMER_TYPE:=dm.ADOTa64CUSTOMER_TYPE.Value;
      end;
    end
   else
    begin
     if dm.ADO0439currency_ptr.Value<>dm.ADOTa64CURRENCY_PTR.Value then
      begin
       messagedlg('对不起由于销售定单所定义的货币不同,不能在同一个装装箱单中!',mtinformation,[mbok],0);
       exit;
      end;
     if (Edit6.Tag<>dm.ADOTa64rkey15.Value) and
       (messagebox(handle,pchar('与首条记录装运工厂不一致,是否继续!'),pchar('提示'),MB_YESNO+MB_ICONINFORMATION+MB_DEFBUTTON2)=IDNO)	then
      exit;
     if (dm.ADOTa64ORIG_CUSTOMER.Value<>DBEdit12.Text) and
       (messagebox(handle,pchar('与首条记录关联原客户不一致,是否继续!'),pchar('提示'),MB_YESNO+MB_ICONINFORMATION+MB_DEFBUTTON2)=IDNO) then
       Exit;
    end;
   stringgrid1.Cells[0,stringgrid1.RowCount-1]:=dm.ADOTa64SALES_ORDER.Value;
   stringgrid1.Cells[1,stringgrid1.RowCount-1]:=dm.ADOTa64Manu_PART_NUMBER.Value;
   stringgrid1.Cells[2,stringgrid1.RowCount-1]:=dm.ADOTa64manu_PART_DESC.Value;
   stringgrid1.Cells[3,stringgrid1.RowCount-1]:=dm.ADOTa64assigntype.Value;
   stringgrid1.Cells[4,stringgrid1.RowCount-1]:=dm.ADOTa64PO_NUMBER.Value;
   stringgrid1.Cells[5,stringgrid1.RowCount-1]:=dm.ADOTa64weigth.asstring;
   stringgrid1.Cells[6,stringgrid1.RowCount-1]:=dm.ADOTa64EMPLOYEE_NAME.Value;
   stringgrid1.Cells[7,stringgrid1.RowCount-1]:=DM.ADOTa64QUAN_SHIPPED.AsString;

   stringgrid2.Cells[0,stringgrid2.RowCount-1]:=dm.ADOTa64rkey64.AsString;

   stringgrid1.RowCount:=stringgrid1.RowCount+1;
   stringgrid2.RowCount:=stringgrid2.RowCount+1;
   if stringgrid1.RowCount>2 then
    begin
     edit1.Enabled:=false;
     bitbtn4.Enabled:=false;
     bitbtn5.Enabled:=false;
     Edit6.Enabled:=False;
     BitBtn8.Enabled:=False;
    end;

  end;
finally
 form1.free;
end;

end;

procedure TForm5.FormActivate(Sender: TObject);
var
 i:byte;
begin
 stringgrid1.Cells[0,0]:='销售订单';
 stringgrid1.Cells[1,0]:='本厂编号';
 stringgrid1.Cells[2,0]:='客户型号';
 stringgrid1.Cells[3,0]:='指派';
 stringgrid1.Cells[4,0]:='客户订单号';
 stringgrid1.Cells[5,0]:='装运重量KG';
 stringgrid1.Cells[6,0]:='指派人员';
 stringgrid1.Cells[7,0]:='装运数量';

 with dm.Aq43911 do
  begin
   close;
   Parameters[2].Value:=dm.ADO0439rkey.Value;
   open;
   if not isempty then pack_note.Text:=fieldbyname('memo_text').AsString;
  end;
 if dm.ADO0439.State<>dsinsert then    //编辑或检查
  begin
    v_post:=False;
    dm.ADO04.Close;
    dm.ADO04.Open;
    if dm.ADO04seed_flag.Value=4 then
      DBEdit1.ReadOnly:=True;
   with dm.ADOQuery3 do
    begin
     close;
     sql.Clear;
     sql.Add('select cust_code,customer_name,location,unit_code,unit_name,');
     sql.Add('curr_code,curr_name,data0010.INVOICE_NOTE_PAD_PTR,data0010.DO_SMOOTHING,');
     sql.Add('data0010.cod_flag');
     sql.Add('from data0010,data0012,data0002,data0439,data0001'); //查找客户及地址
     sql.Add('where data0439.customer_ptr=data0010.rkey and');
     sql.Add('data0439.ship_addr_ptr=data0012.rkey and');
     sql.Add('data0439.unit_ptr=data0002.rkey and');
     sql.Add('data0439.currency_ptr=data0001.rkey and');
     sql.Add('data0439.rkey='+dm.ADO0439rkey.AsString);
     open;
     edit1.Text:=fieldvalues['cust_code'];
     label3.Caption:=fieldvalues['customer_name'];
     self.max_days:=fieldbyname('INVOICE_NOTE_PAD_PTR').AsInteger;
     edit2.Text:=fieldvalues['location'];
     edit3.Text:=fieldvalues['unit_code'];
     label8.Caption:=fieldvalues['unit_name'];
     edit4.Text:=fieldvalues['curr_code'];
     label17.Caption:=fieldvalues['curr_name'];
     checkbox2.Checked:=fieldbyname('DO_SMOOTHING').AsInteger=1;
     checkbox3.Checked:=fieldbyname('cod_flag').AsString='Y';

      Label24.Caption:=dm.ADO0439.fieldbyname('ABBR_NAME').AsString;
      Edit6.Text := dm.ADO0439.fieldbyname('warehouse_CODE').AsString;
      Edit6.Tag := dm.ADO0439.fieldbyname('warehouse_ptr').AsInteger;
    end;
   with dm.ADOQuery4 do     //查找指派
    begin
     close;
     Parameters[1].Value:=dm.ADO0439rkey.Value;
     open;
     po_number.Caption:=dm.ADOQuery4po_number.Value;
     for i:=1 to dm.ADOQuery4.RecordCount do
      begin
       stringgrid1.Cells[0,stringgrid1.RowCount-1]:=fieldvalues['SALES_ORDER'];
       stringgrid1.Cells[1,stringgrid1.RowCount-1]:=dm.ADOQuery4MANU_PART_NUMBER.Value;
       stringgrid1.Cells[2,stringgrid1.RowCount-1]:=dm.ADOQuery4Manu_PART_DESC.Value;
       stringgrid1.Cells[3,stringgrid1.RowCount-1]:=dm.ADOQuery4assigntype.Value;
       stringgrid1.Cells[4,stringgrid1.RowCount-1]:=fieldvalues['PO_NUMBER'];
       stringgrid1.Cells[5,stringgrid1.RowCount-1]:=fieldbyname('weigth').AsString;
       stringgrid1.Cells[6,stringgrid1.RowCount-1]:=fieldvalues['EMPLOYEE_NAME'];
       stringgrid1.Cells[7,stringgrid1.RowCount-1]:=dm.ADOQuery4QUAN_SHIPPED.AsString;
       stringgrid2.Cells[0,stringgrid2.RowCount-1] := fieldbyname('rkey').AsString;
       stringgrid1.RowCount:=stringgrid1.RowCount+1;
       stringgrid2.RowCount:=stringgrid2.RowCount+1;
       next;
      end;
    end;
   maskedit1.Text:=datetostr(dm.ADO0439date_sailing.Value);
  end;
end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption:='装箱单记事本:'+dbedit1.Field.Value;
  if bitbtn1.Enabled = false then
   with edit_note do
    begin
     bitbtn1.Enabled:=false;
     button1.Visible:=false;
     button2.Visible:=false;
     button3.Visible:=true;
     memo1.ReadOnly:=true;
     memo1.Color:=cl3dlight;
    end;
  edit_note.Memo1.Lines.Assign(pack_note);
 if edit_note.ShowModal=mrok then
   pack_note.Text:=edit_note.Memo1.Text;
 finally
  edit_note.free;
 end;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
 pack_note:=tstringlist.Create;
end;

procedure TForm5.FormDestroy(Sender: TObject);
begin
 pack_note.Free;
end;

procedure TForm5.save_note();
begin
 if (not dm.aq43911.IsEmpty) and (trim(pack_note.Text)<>'') then
  begin //原记录有记事本
   dm.aq43911.Edit;
   dm.aq43911.fieldbyname('memo_text').asstring:=pack_note.Text;
   dm.aq43911.Post;
  end
 else
  if (not dm.aq43911.IsEmpty) and (trim(pack_note.Text)='') then
   dm.aq43911.Delete   //如果原记录有记事本但被删除了
  else
   if (dm.aq43911.IsEmpty) and (trim(pack_note.Text)<>'') then
    begin           //如果原记录没有记事本，但新增了记事本
     dm.aq43911.Append;
     dm.aq43911.FieldByName('file_pointer').AsString:=IntToStr(rkey439);
     dm.aq43911.Fieldvalues['source_type']:=439;
     dm.aq43911.fieldbyname('memo_text').asstring:=pack_note.Text;
     dm.aq43911.Post;
    end;
end;

function TForm5.find_trustsaleserror(rkey: integer): boolean;
begin
   with dm.ADOQuery1 do
    begin
    close;
    sql.Text:=
    'select data0153.rkey'+#13+
    'FROM  dbo.DATA0153 INNER JOIN'+#13+
    'dbo.Data0064 ON dbo.DATA0153.SHIP_PTR = dbo.Data0064.RKEY'+#13+
    'where data0153.quantity<>data0153.qty_on_hand'+#13+
    'and Data0064.packing_list_ptr='+inttostr(rkey);
    open;
    if dm.ADOQuery1.IsEmpty then
     result:=false
    else
     result:=true
    end;
end;

procedure TForm5.credit_sales(rkey439: integer);
begin

 with dm.ADOQuery1 do
 begin
  close;
  sql.Text:='INSERT INTO DATA0153'+#13+
    '(SHIP_PTR, CUSTPART_PTR, QUANTITY, QTY_ON_HAND, PO_NUMBER, EMPL_PTR,'+#13+
    'MFG_DATE, REMARK, PRICE, TAX_RATE, CUSTOMER_PTR,CURRENCY_PTR, EXCH_RATE)'+#13+
 'SELECT  Data0064.RKEY, Data0060.CUST_PART_PTR, Data0064.QUAN_SHIPPED,'+#13+
 'Data0064.QUAN_SHIPPED AS qty_on_hand, Data0097.PO_NUMBER,'+#13+
 'data0439.employee_ptr, data0439.date_sailing, Data0064.REMARK,'+#13+
 'Data0060.PARTS_ALLOC,Data0064.TAX_2, data0439.customer_ptr,'+#13+
 'data0439.currency_ptr, Data0001.BASE_TO_OTHER'+#13+
 'FROM         Data0064 INNER JOIN'+#13+
 '  Data0060 ON Data0064.SO_PTR = Data0060.RKEY INNER JOIN'+#13+
 '  Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN'+#13+
 '  data0439 ON Data0064.packing_list_ptr = data0439.rkey INNER JOIN'+#13+
 '  Data0001 ON data0439.currency_ptr = Data0001.RKEY'+#13+
 'where data0439.rkey='+inttostr(rkey439);
  ExecSQL;
 end;
end;

procedure TForm5.BitBtn1Click(Sender: TObject);
var
 i:word;

begin
  if not (dbedit1.Text[length(trim(dbedit1.Text))] in ['0'..'9']) then
  begin
    messagedlg('装箱单编号最后一位必需是一个整数!',mtinformation,[mbok],0);
    exit;
  end;

  if stringgrid1.RowCount<=2 then
  begin
    messagedlg('至少需要一个装运指派!',mtinformation,[mbok],0);
    exit;
  end;

   if self.CUSTOMER_TYPE=4 then
  begin
    showmsg('装箱单无法进行,该客户状态为停止,请与财务或市场联系!!!',1);
    exit;
  end;

  if dm.ADO192custcoship.Value='Y' then
  if custinvoice_day(dm.ADO0439customer_ptr.Value) then
  begin
    showmessage('装箱单无法进行,该客户有未付款发票超过了最长延期付款天数!!!'+
    '发票编号: '+self.invoice_number);
    exit;
  end;

  if (dm.ADO0439.State=dsEdit) and (self.find_trustsaleserror(dm.ADO0439rkey.Value))  then  //如果编辑装箱单
  begin
    messagedlg('寄售入库,库存发生变化不能编辑!',mtinformation,[mbok],0);
    exit;
  end;

  if dm.ADO0439.State=dsinsert then  //如果新增装箱单
  begin
   if find_error(0,return_rkey(StringGrid2,0)) then
    begin
     messagedlg('指派记录状态发现变化请认真检查,是否已被其它人装运!',mterror,[mbok],0);
     DBEdit1.SetFocus;
     exit;
    end;

   if self.find_numbererror(trim(DBEdit1.Text)) then
    begin
     dm.ado04.Close;
     dm.ado04.Open;
     if dm.ado04SEED_FLAG.Value<>1 then
      begin
        DBEdit1.Field.Value:=dm.ado04SEED_VALUE.Value;
        messagedlg('编号重复可能多人同时新增,是否自动更新编号为:'+
        dm.ado04SEED_VALUE.Value,mtInformation,[mbok],0);
      end
     else
      begin
       messagedlg('发票编号重复重复!请手工重新输入',mterror,[mbok],0);
       DBEdit1.SetFocus;
       exit;
      end;
    end;

    try
      dm.ADOConnection1.BeginTrans;
      dm.ADO0439date_ent.Value:=getsystem_date(dm.ADOQuery1,0); //给建立日期赋值(长格式)
      dm.ADO0439date_sailing.AsString:=maskedit1.Text;
      dm.ADO0439warehouse_ptr.Value:=Edit6.Tag;
      dm.ADO0439.Post;
      save_note(); //保存记事本


    





    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     dm.ADO04.Close;
     dm.ADO04.Open;
     if dm.ADO04SEED_FLAG.Value<>1 then
      update_04(trim(dm.ADO04SEED_VALUE.Value)); //更新04控制码
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


     with dm.ADOQuery1 do
      begin
       close;
       sql.Clear;
       sql.Text:='update data0064 '+
        'set packing_list_ptr='+dm.ADO0439rkey.AsString+
        ',packing_slip_flag=''1'',date_shipped='+quotedstr(dm.ADO0439date_sailing.AsString)+
        ' where rkey in'+return_rkey(StringGrid2,0);
       ExecSQL;
      end;


     if (CheckBox3.Checked) and (dm.sql_codflag(dm.ADO0439rkey.Value)) then   //(V_pk - V_defi > 0.1) then
     begin
       dm.ADOConnection1.RollbackTrans;
       screen.Cursor:=crdefault;

       showmsg('客户为款到发货标识,PO号:'+dm.ADOQuery1.fieldbyname('PO_NUMBER').AsString+
              ':可出货总数:'+dm.ADOQuery1.fieldbyname('qty').AsString+'少于已出货总数:'+
       dm.ADOQuery1.fieldbyname('qtyed').AsString,1);
       DBEdit1.SetFocus;
       Exit;
     end;


 //  for i:=1 to stringgrid2.RowCount-2 do
 //   add_pack_list(strtoint(stringgrid2.Cells[0,i]));//将指派增加到packlist中

      if self.CheckBox2.Checked then
       self.credit_sales(dm.ADO0439rkey.Value);

      dm.ADOConnection1.CommitTrans;
     if not v_post then self.v_post:=true;
    except
      on E: Exception do
      begin
        dm.ADOConnection1.RollbackTrans;
        screen.Cursor:=crdefault;
        messagedlg(E.Message,mterror,[mbcancel],0);
        exit;
      end;
    end;
    //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    if not checkbox1.Checked then
    begin
      v_close:=1;
      ModalResult:=mrok;
    end
    else
     begin
      dm.ADO0439.Append;
      dm.ADO0439weight.Value:=0;            //毛重
      dm.ADO0439net_weight.Value:=0;        //净重
      dm.ADO0439cartons_no.Value:=0;        //箱数
      dm.ADO0439charge.Value:=0;            //装运费用
      dm.ado0439unit_ptr.value := dm.ADO192unit_ptr.Value;
      edit3.Text:=dm.ADO192unit_code.Value;
      Label8.Caption := dm.ADO192unit_name.Value;

      if dm.ADO04SEED_FLAG.Value<>1 then
      dm.ADO0439delivery_no.Value:=dm.ADO04.FieldValues['seed_value']; //计计算机自动同SO一样

      MaskEdit1.Text:=datetostr(getsystem_date(dm.ADOQuery1,1));
      dm.ADO0439employee_ptr.Value:=StrToInt(user_ptr); //建立员工
      dm.ADO0439warehouse_ptr.Value:=Edit6.Tag;

      edit1.Text:='';
      Edit1.Enabled:=True;
      edit1.Font.Color:=clwindowtext;
      Edit6.Enabled:=True;
      Edit6.Text:='';

      edit2.Text:='';
      edit4.Text:='';
      label17.Caption:='';
      self.po_number.Caption:='';

      for i:=1 to stringgrid2.RowCount-2 do
      begin
        stringgrid1.Rows[i].Clear;
        stringgrid2.Rows[i].Clear;
      end;
      stringgrid1.RowCount:=2;
      stringgrid2.RowCount:=2;

      bitbtn4.Enabled:=true;
      bitbtn8.Enabled:=true;
      bitbtn5.Enabled:=true;
      dbedit1.SetFocus;
     end;
  end
  else   //如果是编辑以前的装箱单
  begin
    with DM.ADOQuery1 do
    begin
     Close;
     sql.Clear;
     sql.Add('select data0064.* from data0064 inner join data0439');
     SQL.Add('on data0439.rkey=data0064.packing_list_ptr');
     sql.Add('where data0064.rkey529_ptr>0');
     SQL.Add('and data0439.rkey='+dm.ADO0439rkey.AsString);
     Open;
    end;
    if dm.ADOQuery1.IsEmpty=False then
    begin
     MessageDlg('此装箱单已有报关记录,不能再编辑!',mtInformation,[mbOK],1);
     Exit;
    end;
    if find_error(dm.ADO0439rkey.Value,return_rkey(StringGrid2,0)) then
     begin
       messagedlg('指派记录状态发现变化请认真检查,是否已被其它人装运!',mterror,[mbok],0);
       DBEdit1.SetFocus;
       exit;
     end;
    if MonthOf(dm.ADO0439date_ent.Value)<>MonthOf(StrToDate(MaskEdit1.Text)) then
     begin
       messagedlg('出货日期与保存时的创建日期必须是同一个月份!',mterror,[mbok],0);
       MaskEdit1.SetFocus;
       exit;
     end;
    Form5.rkey439:=dm.ADO0439rkey.Value;      //修改编号，使用了Filter有可保存后可能变动记录
    try
      dm.ADOConnection1.BeginTrans;
      dm.ADO0439date_sailing.AsString:=maskedit1.Text;
      dm.ADO0439warehouse_ptr.Value:=Edit6.Tag;
      dm.ADO0439employee_ptr.Value:=StrToInt(user_ptr); //建立员工
      dm.ADO0439.Post;
      with dm.ADOQuery1 do
       begin
        close;
        sql.Text:='delete data0153'+#13+
                  'FROM  dbo.DATA0153 INNER JOIN'+#13+
                  'dbo.Data0064 ON dbo.DATA0153.SHIP_PTR = dbo.Data0064.RKEY'+#13+
                  'where Data0064.packing_list_ptr='+inttostr(rkey439);
        ExecSQL;
       end;
      save_note();                 //保存记事本
     with dm.ADOQuery1 do
      begin
       close;
       sql.Clear;
       sql.Text:='update data0064 '+
        'set packing_list_ptr=null'+
        ',packing_slip_flag=''0'',date_shipped=null'+
        ' where packing_list_ptr ='+inttostr(self.rkey439);
       ExecSQL;
      end;

     with dm.ADOQuery1 do
      begin
       close;
       sql.Clear;
       sql.Text:='update data0064 '+
        'set packing_list_ptr='+inttostr(self.rkey439)+
        ',packing_slip_flag=''1'',date_shipped='+quotedstr(maskedit1.Text)+
        ' where rkey in'+return_rkey(StringGrid2,0);
       ExecSQL;
      end;

      if self.CheckBox2.Checked then
      self.credit_sales(rkey439);

      if (not dm.ADO0439print_date.IsNull) then
      if (CheckIsChanged) then
      begin
        DM.ADO0439.Edit;
        dm.ADO0439print_date.AsVariant := null;
        DM.ADO0439.Post;
      end;
      dm.ADOConnection1.CommitTrans;
      v_close:=1;
      ModalResult:=mrok;
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

procedure TForm5.PopupMenu1Popup(Sender: TObject);
begin
if bitbtn1.Enabled=false then
 begin
  n1.Enabled:=false;
  n2.Enabled:=false;
  n3.Enabled:=false;
  n4.Enabled:=false;
 end
else
 if stringgrid1.Row=stringgrid1.RowCount-1 then
  begin
   n2.Enabled:=false;
   n3.Enabled:=false;
   n4.Enabled:=false;
  end
 else
  begin
   n2.Enabled:=true;
   n3.Enabled:=true;
   n4.Enabled:=true;
  end;
end;

procedure TForm5.N2Click(Sender: TObject);
var
 i:byte;
begin
 for i:=stringgrid1.Row to stringgrid1.RowCount-2 do
  begin
   stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
   stringgrid2.Rows[i].Text:=stringgrid2.Rows[i+1].Text;
  end;
  stringgrid1.RowCount:=stringgrid1.RowCount-1;
  stringgrid2.RowCount:=stringgrid2.RowCount-1;
 if stringgrid1.RowCount=2 then
 begin
  edit1.Enabled:=true;
  bitbtn4.Enabled:=true;
  bitbtn5.Enabled:=true;
  edit4.Text := ''; //货币
  Edit2.Text := ''; //装运地址
  dm.ADO0439currency_ptr.AsVariant:=null;
  dm.ADO0439ship_addr_ptr.AsVariant:=null;
  Edit6.Text:='';
  Edit1.Text:='';
  Label3.Caption:='';
  BitBtn8.Enabled:=True;
  Label24.Caption:='';
  self.po_number.Caption:='';
 end;
end;

procedure TForm5.DBEdit4Exit(Sender: TObject);
begin
 if trim(dbedit4.Text)='' then
  dbedit4.Field.Value:=0;
end;

procedure TForm5.DBEdit5Exit(Sender: TObject);
begin
 if trim(dbedit5.Text)='' then
  dbedit5.Field.Value:=0;
end;

procedure TForm5.DBEdit6Exit(Sender: TObject);
begin
 if trim(dbedit6.Text)='' then
  dbedit6.Field.Value:=0;
end;

procedure TForm5.DBEdit8Exit(Sender: TObject);
begin
 if trim(dbedit8.Text)='' then
  dbedit8.Field.Value:=0;
end;

procedure TForm5.Edit1Enter(Sender: TObject);
begin
(Sender as TEdit).Font.Color:=Clblue; //得到输入焦点
end;

procedure TForm5.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if v_close<>1 then dm.ADO0439.Cancel;
end;

procedure TForm5.MaskEdit1Exit(Sender: TObject);
begin
try
 strtodate(maskedit1.Text);
except
 messagedlg('输入的日期有误,请检查',mtinformation,[mbcancel],0);
 maskedit1.SetFocus;
end;
end;

function TForm5.v_houzui(v_leng:byte):string;
begin
 case v_leng of
 1:v_houzui:='-1';
 2:v_houzui:='-01';
 3:v_houzui:='-001';
 4:v_houzui:='-0001';
 5:v_houzui:='-00001';
 6:v_houzui:='-000001'
 else
  v_houzui:='-001';
 end;
end;


procedure TForm5.N3Click(Sender: TObject);
begin
 try
  edit_note:=tedit_note.Create(application);
  edit_note.Caption:='装运指派记事本:'+stringgrid1.Cells[0,stringgrid1.row];
  dm.ADOup64.Close;
  dm.ADOup64.Parameters[0].Value:=strtoint(stringgrid2.Cells[0,stringgrid1.row]);
  dm.ADOup64.Open;
  edit_note.Label1.Visible:=true;
  edit_note.Edit1.Visible:=true;
  edit_note.Edit1.Text:=dm.ADOup64remark.Value;
  edit_note.Label2.Visible:=true;
  edit_note.Label3.Visible:=true;
  edit_note.Label4.Visible:=true;
  edit_note.Label5.Visible:=true;

  edit_note.Edit2.Visible:=true;
  edit_note.Edit3.Visible:=true;
  edit_note.Edit4.Visible:=true;
  edit_note.Edit5.Visible:=true;

  edit_note.Memo1.Visible:=false;

  dm.ADO6411.Close;
  dm.ADO6411.Parameters[2].Value:=strtoint(stringgrid2.Cells[0,stringgrid1.row]);
  dm.ADO6411.Open;
  if not dm.ADO6411.IsEmpty then
   begin
    edit_note.edit2.Text:=dm.ado6411.fieldbyname('note_pad_line_1').AsString;
    edit_note.edit3.Text:=dm.ado6411.fieldbyname('note_pad_line_2').AsString;
    edit_note.edit4.Text:=dm.ado6411.fieldbyname('note_pad_line_3').AsString;
    edit_note.edit5.Text:=dm.ado6411.fieldbyname('note_pad_line_4').AsString;
   end;

 if edit_note.ShowModal=mrok then
  begin
   dm.ADOup64.Edit;
   dm.ADOup64remark.Value:=trim(edit_note.Edit1.Text);
   dm.ADOup64.Post;
   self.save6411_note();
  end;
 finally
  edit_note.free;
 end;
end;

procedure TForm5.save6411_note();
begin
 if (not dm.ado6411.IsEmpty) then
  begin //原记录有记事本
   dm.ado6411.Edit;
   dm.ado6411.fieldbyname('note_pad_line_1').asstring:=edit_note.Edit2.Text;
   dm.ado6411.fieldbyname('note_pad_line_2').asstring:=edit_note.Edit3.Text;
   dm.ado6411.fieldbyname('note_pad_line_3').asstring:=edit_note.Edit4.Text;
   dm.ado6411.fieldbyname('note_pad_line_4').asstring:=edit_note.Edit5.Text;
   dm.ADO6411.Post;
  end
 else
  begin           //如果原记录没有记事本，但新增了记事本
   dm.ado6411.Append;
   dm.ado6411.FieldByName('file_pointer').AsString:=stringgrid2.Cells[0,stringgrid1.row];
   dm.ado6411.Fieldvalues['source_type']:=64;
   dm.ado6411.fieldbyname('note_pad_line_1').asstring:=edit_note.Edit2.Text;
   dm.ado6411.fieldbyname('note_pad_line_2').asstring:=edit_note.Edit3.Text;
   dm.ado6411.fieldbyname('note_pad_line_3').asstring:=edit_note.Edit4.Text;
   dm.ado6411.fieldbyname('note_pad_line_4').asstring:=edit_note.Edit5.Text;
   dm.ado6411.Post;
  end;
end;

procedure TForm5.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
  stringgrid1.MouseToCell(x,y,column,row);
  if row<>0 then stringgrid1.Row:=row;
 end;
end;

procedure TForm5.get_info(rkey10: integer);
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select memo_text from data0011');
  sql.Add('where SOURCE_TYPE = 3010 and');
  sql.Add('FILE_POINTER= '+inttostr(rkey10));
  open;
 end;
if not dm.ADOQuery1.IsEmpty then pack_note.Text := dm.ADOQuery1.FieldValues['memo_text'];
end;

procedure TForm5.N4Click(Sender: TObject);
begin
 with DM.ADOQuery1 do
 begin
  Close;
  sql.Clear;
  sql.Add('select data0064.* from data0064 inner join data0439');
  SQL.Add('on data0439.rkey=data0064.packing_list_ptr');
  sql.Add('where data0064.rkey529_ptr>0');
  SQL.Add('and data0439.rkey='+dm.ADO0439rkey.AsString);
  Open;
 end;
 if dm.ADOQuery1.IsEmpty=False then
 begin
  MessageDlg('此装箱单已有报关记录,不能再拆分!',mtInformation,[mbOK],1);
  Exit;
 end;
form11:=tform11.Create(application);
with form11 do
 begin
  edit1.Text:=form5.Edit1.Text;
  label6.Caption:=form5.Label3.Caption;
  edit2.Text:=form5.StringGrid1.Cells[4,form5.StringGrid1.row];
  edit3.Text:=form5.StringGrid1.Cells[1,form5.StringGrid1.row];
  edit4.Text:=form5.StringGrid1.Cells[2,form5.StringGrid1.row];
  edit6.Text:=form5.StringGrid1.Cells[7,form5.StringGrid1.row];
 end;
 
if form11.ShowModal=mrok then
 begin
  form5.StringGrid1.Cells[7,form5.StringGrid1.row]:=form11.edit6.Text;
 end;
form11.Free;
end;

procedure TForm5.BitBtn8Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'warehouse_CODE/工厂代码/100,ABBR_NAME/工厂简称/100,warehouse_NAME/工厂名称/200';
    InputVar.Sqlstr := 'select rkey,warehouse_CODE,ABBR_NAME,warehouse_NAME from data0015';
    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Label24.Caption:=frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME'];
      Edit6.Text := frmPick_Item_Single.adsPick.FieldValues['warehouse_CODE'];
      Edit6.Tag := frmPick_Item_Single.adsPick.FieldValues['rkey'];
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;

end;

function TForm5.CheckIsChanged: Boolean;
var
  I: Integer;
begin
  DM.qrytmp.Close;
  DM.qrytmp.SQL.Clear;
  DM.qrytmp.SQL.Add('select * from data0439 where rkey = ' + DM.ADO0439.fieldbyname('rkey').AsString);
  DM.qrytmp.Open;
  DM.dspcmp.DataSet := DM.qrytmp;
  DM.cds439cmpnow.Data := DM.dspcmp.Data;
  
  DM.qrytmp.Close;
  DM.qrytmp.SQL.Clear;
  DM.qrytmp.SQL.Add('select rkey from data0064 where packing_list_ptr = ' + DM.ADO0439.fieldbyname('rkey').AsString);
  dm.qrytmp.Open;
  DM.dspcmp.DataSet := DM.qrytmp;
  DM.cds64cmpnow.Data := DM.dspcmp.Data;

  
  Result := False;
  for I := 0 to DM.cds439cmpold.FieldCount -1 do
  begin
    if DM.cds439cmpold.Fields[I].Value <> DM.cds439cmpnow.Fields[I].Value then
    begin
      Result := True;
      Exit;
    end;
  end;
  if dm.cds64cmpold.RecordCount <> DM.cds64cmpnow.RecordCount then
  begin
    Result := True;
    Exit;
  end;
  DM.cds64cmpold.First;
  DM.cds64cmpnow.First;
  while (not DM.cds64cmpold.Eof) and (not DM.cds64cmpnow.Eof) do
  begin
    if DM.cds64cmpold.FieldByName('rkey').Value <> DM.cds64cmpnow.FieldByName('rkey').Value then
    begin
      Result := True;
      Exit;
    end;
    DM.cds64cmpold.Next;
    DM.cds64cmpnow.Next;
  end;

end;

end.
