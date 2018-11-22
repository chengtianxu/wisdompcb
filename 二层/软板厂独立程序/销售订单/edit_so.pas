unit edit_so;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, Menus, ExtCtrls, Mask, DBCtrls,
  Grids, DBGrids,DB, ADODB;

type
  TContractInfo = record
    ContractNo: string;
    Qnty: Integer;
    EngAmount: Double;
    TestAmount: Double;
    AftDiscountAmount: Double;
  end;
  TForm8 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label2: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Bevel2: TBevel;
    Label38: TLabel;
    Label39: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label48: TLabel;
    Bevel3: TBevel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    GroupBox1: TGroupBox;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    GroupBox2: TGroupBox;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Edit1: TEdit;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    BitBtn2: TBitBtn;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBCheckBox4: TDBCheckBox;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    DBEdit21: TDBEdit;
    Edit3: TEdit;
    Label66: TLabel;
    Edit4: TEdit;
    BitBtn3: TBitBtn;
    Label67: TLabel;
    Edit6: TEdit;
    BitBtn4: TBitBtn;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label69: TLabel;
    BitBtn5: TBitBtn;
    MaskEdit3: TMaskEdit;
    ComboBox1: TComboBox;
    Edit7: TEdit;
    Label70: TLabel;
    DBText1: TDBText;
    Edit8: TEdit;
    BitBtn6: TBitBtn;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    PopupMenu2: TPopupMenu;
    add_rep: TMenuItem;
    edit_rep: TMenuItem;
    del_rep: TMenuItem;
    Button3: TButton;
    TabSheet8: TTabSheet;
    DBGrid1: TDBGrid;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Label76: TLabel;
    Bevel1: TBevel;
    Label77: TLabel;
    Label78: TLabel;
    Edit9: TEdit;
    Memo1: TMemo;
    DBComboBox1: TDBComboBox;
    Label4: TLabel;
    Memo2: TMemo;
    Label79: TLabel;
    SpeedButton1: TSpeedButton;
    DBEdit24: TDBEdit;
    Label80: TLabel;
    DBEdit25: TDBEdit;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label9: TLabel;
    DBEdit23: TDBEdit;
    BitBtn9: TBitBtn;
    Edit10: TEdit;
    SpeedButton2: TSpeedButton;
    Label_qteptr: TLabel;
    Label84: TLabel;
    Memo3: TMemo;
    DBRadioGroup1: TDBRadioGroup;
    Label3: TLabel;
    Edit11: TEdit;
    BitBtn10: TBitBtn;
    Label85: TLabel;
    Edit12: TEdit;
    Edit13: TEdit;
    Label86: TLabel;
    Label87: TLabel;
    DBRadioGroup2: TDBRadioGroup;
    Memo4: TMemo;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    DBComboBox2: TDBComboBox;
    Label91: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBRadioGroup3: TDBRadioGroup;
    DBEdit15: TDBEdit;
    Label32: TLabel;
    Label40: TLabel;
    Label47: TLabel;
    Label68: TLabel;
    Label74: TLabel;
    ComboBox2: TComboBox;
    Label13: TLabel;
    Edit2: TEdit;
    BitBtn11: TBitBtn;
    Label52: TLabel;
    Label75: TLabel;
    Label92: TLabel;
    DBGrid6: TDBGrid;
    Label93: TLabel;
    Edit5: TEdit;
    BitBtn12: TBitBtn;
    Label94: TLabel;
    MaskEdit4: TMaskEdit;
    btnFindContract: TBitBtn;
    GroupBox3: TGroupBox;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    ADOQuery1: TADOStoredProc;
    BitBtn13: TBitBtn;
    TabSheet9: TTabSheet;
    StringGrid3: TStringGrid;
    LabPrice: TLabel;
    Label101: TLabel;
    lblywy: TLabel;
    Label102: TLabel;
    Edit17: TEdit;
    BitBtn14: TBitBtn;
    Label103: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit11KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit13KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit14KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit16KeyPress(Sender: TObject; var Key: Char);
    procedure DBCheckBox4Click(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit4Click(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit6Click(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit8Exit(Sender: TObject);
    procedure Edit8Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBEdit13Exit(Sender: TObject);
    procedure DBEdit16Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1Exit(Sender: TObject);
    procedure StringGrid2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure add_repClick(Sender: TObject);
    procedure edit_repClick(Sender: TObject);
    procedure del_repClick(Sender: TObject);
    procedure StringGrid2DblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure savepo_note();  //准备增加合同审批的部门子表
    procedure update_note(); //更新日志记录过程序
    procedure note_information(v_type:integer);    
    procedure get_data0089(rkey50:integer);
    function note_number(number:integer):integer;
    function find_spec_rkey(spec_rkey: string): string;
    procedure TabSheet5Exit(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BitBtn4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Enter(Sender: TObject);
    procedure BitBtn4Exit(Sender: TObject);
    procedure DBEdit17Exit(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit25KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit12Exit(Sender: TObject);
    procedure DBEdit25Exit(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure DBRadioGroup1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure get_value(rkey278:integer);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn11Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure btnFindContractClick(Sender: TObject);
    procedure DBEdit10Change(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure StringGrid3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitBtn14Click(Sender: TObject);
    procedure Edit17Click(Sender: TObject);
    procedure Edit17DblClick(Sender: TObject);
    procedure Edit17Exit(Sender: TObject);
  private  { Private declarations }
    ContractInfo: TContractInfo;
    rkey25,SHELF_LIFE,set_qty:integer;
    v_part_num: byte;
    unit_sq: double;
    OrigSum: Currency;  //记录修改前的总金额
    ywy: string;
    function quote_vflag(rkey50, ttype: integer): boolean;
    function getSO_OLDNEW(rkey25: integer): byte;
    function checkRFQContractNo(ContractNo: string):Boolean;
    function cacl_deficiency(rkey10:integer; nowAmount: currency):currency;//计算客户所欠金额
  public   { Public declarations }
   rkey213_old,rkey213_new:Integer;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  end;

type
 TMyDBGrid=class(TDBGrid);

var
  Form8: TForm8;
  v_row: byte;
  sales_note,po_note,ship_note:tstringlist;

implementation  {$R *.dfm}
 uses damo, part_search, purchase_search, address_search, shipmethod,
      soprice_sea, edit_rep, note, conf_note, main, curr_search,
  quote_price, waif_supp,common,Pick_Item_Single,ConstVar, FindContract,
  addsa_order, FindBook;

function TForm8.getSO_OLDNEW(rkey25: integer): byte;
begin
with dm.adoquery5 do
begin
 close;
 sql.Text:='SELECT rkey FROM data0060'+#13+
      'WHERE cust_part_ptr='+inttostr(rkey25);
 open;
 if not isempty then  //返单
   result:=1
 else
  result:=0;   //新单
end;
end;

procedure TForm8.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

function TForm8.quote_vflag(rkey50, ttype: integer): boolean;
begin               //返回产品是否报价单关联
with dm.adoquery5 do
begin
 close;
 sql.Text:='SELECT Data0008.batch_flag, Data0008.former_flag'+#13+
      'FROM Data0008 INNER JOIN'+#13+
      'Data0025 ON dbo.Data0008.RKEY = dbo.Data0025.PROD_CODE_PTR'+#13+
      'where Data0025.rkey='+inttostr(rkey50);
 open;
 if not isempty then
  if ttype=0 then
   result:=fieldvalues['batch_flag']
  else
   result:=fieldvalues['former_flag']
 else
  result:=false;
end;
end;

procedure TForm8.update_note;
var
 curr_date:string;
begin
curr_date:=datetostr(getsystem_date(DM.ADOQuery5,1));
if dm.Aq0060PART_PRICE.Value<>dm.ADOQuery4.FieldValues['PART_PRICE'] then
 begin
  with dm.ADOQuery5 do
   begin
    close;                  //记录销售订单价格更改情况(日志文件)
    sql.Clear;
    sql.Add('insert into data0318 (SALES_ORDER_PTR,TRANS_TYPE,TRANS_DESCRIPTION,');
    sql.Add('FROM_string,TO_string,USER_PTR,TRANS_DATE,PROGRAM_SOURCE)');
    sql.Add('values ('+dm.ADOQuery4.Fieldbyname('rkey').AsString+',3,''更改销售订单价格'',');
    sql.Add(''+dm.Aq0060PART_PRICE.AsString+','+dm.ADOQuery4.Fieldbyname('PART_PRICE').AsString+','+rkey73+',');
    sql.add(''''+curr_date+''',32)');
    ExecSQL;
   end;
 end;

if dm.Aq0060PARTS_ORDERED.Value<>dm.ADOQuery4.FieldValues['PARTs_ORDERED']  THEN
 begin
  with dm.ADOQuery5 do
   begin
    close;                  //记录销售订单数量更改情况(日志文件)
    sql.Clear;
    sql.Add('insert into data0318 (SALES_ORDER_PTR,TRANS_TYPE,TRANS_DESCRIPTION,');
    sql.Add('FROM_string,TO_string,USER_PTR,TRANS_DATE,PROGRAM_SOURCE)');
    sql.Add('values ('+dm.ADOQuery4.Fieldbyname('rkey').AsString+',2,''更改销售订单数量'',');
    sql.Add(''+dm.Aq0060PARTs_ordered.AsString+','+dm.ADOQuery4.Fieldbyname('PARTs_ordered').AsString+','+rkey73+',');
    sql.add(''''+curr_date+''',32)');
    ExecSQL;
   end;
  dm.ADO360.Close;
  dm.ADO360.Parameters[0].Value:=dm.ADOQuery4.fieldvalues['rkey'];
  dm.ADO360.Open;
  while not dm.ADO360.Eof do dm.ADO360.Delete;
  dm.ADO360.Append;
  dm.ADO360so_ptr.Value:= dm.ADOQuery4.fieldvalues['rkey'];
  dm.ADO360quantity.Value:=dm.ADOQuery4.fieldvalues['PARTS_ORDERED'];
  dm.ADO360sch_date.Value:=dm.ADOQuery4.fieldvalues['ORIG_SCHED_SHIP_DATE'];
  dm.ADO360.Post;
 end;

 if dm.Aq0060ORIG_REQUEST_DATE.Value<>dm.ADOQuery4.FieldValues['ORIG_REQUEST_DATE'] then
  with dm.ADOQuery5 do
   begin
    close;                  //记录销售订单客户交期更改情况(日志文件)
    sql.Clear;
    sql.Add('insert into data0318 (SALES_ORDER_PTR,TRANS_TYPE,TRANS_DESCRIPTION,');
    sql.Add('FROM_string,TO_string,USER_PTR,TRANS_DATE,PROGRAM_SOURCE)');
    sql.Add('values ('+dm.ADOQuery4.Fieldbyname('rkey').AsString+',4,''更改销售订单客户交期'',');
    sql.Add(''''+dm.Aq0060ORIG_REQUEST_DATE.AsString+''','''+dm.ADOQuery4.Fieldbyname('ORIG_REQUEST_DATE').AsString+''','+rkey73+',');
    sql.add(''''+curr_date+''',32)');
    ExecSQL;
   end;

 if dm.Aq0060ORIG_SCHED_SHIP_DATE.Value<>dm.ADOQuery4.FieldValues['ORIG_SCHED_SHIP_DATE'] then
  with dm.ADOQuery5 do
   begin
    close;                  //记录销售订单客户交期更改情况(日志文件)
    sql.Clear;
    sql.Add('insert into data0318 (SALES_ORDER_PTR,TRANS_TYPE,TRANS_DESCRIPTION,');
    sql.Add('FROM_string,TO_string,USER_PTR,TRANS_DATE,PROGRAM_SOURCE)');
    sql.Add('values ('+dm.ADOQuery4.Fieldbyname('rkey').AsString+',4,''更改销售订单计划交期'',');
    sql.Add(''''+dm.Aq0060ORIG_SCHED_SHIP_DATE.AsString+''','''+dm.ADOQuery4.Fieldbyname('ORIG_SCHED_SHIP_DATE').AsString+''','+rkey73+',');
    sql.add(''''+curr_date+''',32)');
    ExecSQL;
   end;

 if comparetext(trim(dm.Aq0060SALES_ORDER.Value),trim(dm.ADOQuery4.Fieldbyname('sales_order').AsString))<>0 then
  with dm.ADOQuery5 do
   begin
    close;                  //记录客户订单编号情况(日志文件)
    sql.Clear;
    sql.Add('insert into data0318 (SALES_ORDER_PTR,TRANS_TYPE,TRANS_DESCRIPTION,');
    sql.Add('FROM_STRING,TO_STRING,USER_PTR,TRANS_DATE,PROGRAM_SOURCE)');
    sql.Add('values ('+dm.ADOQuery4.Fieldbyname('rkey').AsString+',8,''更改销售订单编号'',');
    sql.Add(''''+dm.Aq0060SALES_ORDER.Value+''','''+dm.ADOQuery4.Fieldbyname('sales_order').AsString+''','+rkey73+',');
    sql.add(''''+curr_date+''',32)');
    ExecSQL;
   end;
end;

procedure TForm8.BitBtn1Click(Sender: TObject);
var
 i:byte;
begin
 try
  form7 := Tform7.Create(application);
  form7.Caption:='装运记事本: '+dbedit21.Field.Value;
  form7.Memo1.Lines.Assign(ship_note);
  if form7.ShowModal=mrok then
   begin
    if form7.Memo1.Lines.Count>10 then
     begin
      ship_note.Clear;
      for i:=1 to 10 do ship_note.Add(form7.Memo1.Lines[i-1]);
     end
    else
     ship_note.Text:=form7.Memo1.Text;
   end;
 finally
  form7.free;
 end;
end;


procedure TForm8.Button2Click(Sender: TObject);
begin
 dm.ADOQuery4.Cancel;
 if dm.ado89.Active=true then
  dm.ado89.CancelBatch();
 close;
end;

procedure TForm8.FormActivate(Sender: TObject);
var dcost:Double;
 i:byte;
begin
 if dbcheckbox4.Checked then   //预测耗费
  begin
   dbedit19.Enabled := true;
   dbedit20.Enabled := true;
   label50.Font.Color := clwindowtext;
   label51.Font.Color := clwindowtext;
  end;
 maskedit1.Text := dm.ADOQuery4.fieldbyname('ORIG_REQUEST_DATE').AsString;    //市场部交货期
 maskedit2.Text := dm.ADOQuery4.fieldbyname('ORIG_SCHED_SHIP_DATE').AsString; //市场部装运期
 maskedit4.Text := dm.ADOQuery4DUE_DATE.AsString;
 stringgrid1.Cells[0,0] := '工具费用类别';
 stringgrid1.Cells[1,0] := '金额';
 stringgrid1.Cells[2,0] := '挂帐金额';
 stringgrid1.Cells[3,0] := '免费金额';
 StringGrid1.Cells[4,0] := '征税';
 StringGrid1.ColWidths[5]:=-1;

 stringgrid2.Cells[0,0] := '代码';
 stringgrid2.Cells[1,0] := '名称';
 stringgrid2.Cells[2,0] := '佣金%';
 stringgrid2.Cells[3,0] := '分配%';
//tang2013-10-16添加订单价格明细
  StringGrid3.Cells[0,0]:='订单价格类型定义';
  StringGrid3.Cells[1,0]:='价格';
  StringGrid3.ColWidths[2]:=-1;
  LabPrice.Tag:=0;
//end tang2013-10-16------------

 with dm.ADOsp2 do
  begin
   close;
   Parameters[0].Value:=dm.ADOQuery4.FieldValues['rkey'];
   open;
   edit3.Text := fieldvalues['cust_code'];
   label66.Caption := fieldbyname('customer_name').AsString;
   label92.Caption := fieldbyname('FED_TAX_ID_NO').AsString; //付款方式   
   label60.Caption:=Fieldbyname('INTERNAL_ECN_COUNT').AsString;
   label61.Caption:=Fieldbyname('EXTERNAL_ECN_COUNT').AsString;
   for i:=1 to 6 do
    if trim(fieldbyname('contact_name_'+inttostr(i)).asstring)<>'' then
    combobox1.Items.Add(fieldbyname('contact_name_'+inttostr(i)).asstring);
   combobox1.Text := dm.ADOQuery4.fieldbyname('CUSTOMER_CONTACT').AsString;
   SHELF_LIFE := fieldvalues['SHELF_LIFE'];
    edit4.Text := trim(fieldvalues['MANU_PART_number']);
    edit4.Font.Color:=clwindowtext;
    label71.Caption :=edit4.Text;

    label67.Caption := fieldbyname('MANU_PART_DESC').AsString;
    set_qty :=  fieldvalues['set_qty'];
    label83.Caption := inttostr(set_qty);
    edit9.Text := fieldbyname('qty_on_hand').AsString;
    label5.Caption := fieldbyname('qty_alloc').AsString;
    label6.Caption := floattostr(FieldValues['qty_on_hand']-FieldValues['qty_alloc']);

    edit6.Text := trim(fieldvalues['po_number']);
    edit6.Font.Color:=clwindowtext;
    maskedit3.Text := fieldbyname('po_date').AsString;
    label72.Caption := fieldbyname('rkey').AsString;//60中合同97指针
    label73.Caption := fieldbyname('rkey').AsString;
    edit7.Text := fieldvalues['curr_code'];
    label70.Caption := fieldbyname('curr_name').AsString;
    v_part_num:=fieldvalues['ttype'];  //样板还是生产板
    if dm.ADOQuery4.fieldvalues['CURRENCY_PTR'] = 1 then
    dbedit11.Enabled := false;
    unit_sq:=fieldbyname('unit_sq').AsFloat;
    label90.Caption:=formatfloat('0.0000',dbedit13.Field.Value*unit_sq);  //面积
    //20170322tang注60添加新字段关联原客户
    Edit17.Text:=FieldByName('ORIG_CUSTOMER').AsString;
  end;

   with dm.aqTmp do
   begin
     close;
     sql.Clear;
//     sql.Add('select t5.RKEY,t5.EMPLOYEE_NAME from data0010 t10 inner join data0005 t5 on t10.SALES_REP_PTR=t5.RKEY ');
//     sql.Add('where t10.cust_code = '''+trim(edit3.text)+'''');
     sql.Add('select RKEY,EMPLOYEE_NAME from Data0005 where RKEY = '+dm.ADOQuery4.FieldByName('COMM_ASSIGNED_BY_E_P').AsString);
     open;
   end;
//   showmessage(dm.ADOQuery4.FieldByName('COMM_ASSIGNED_BY_E_P').AsString);
   lblywy.Caption := dm.aqTmp.FieldByName('EMPLOYEE_NAME').AsString;
   ywy:= dm.aqTmp.FieldByName('RKEY').AsString;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  with dm.ADOQuery3 do
   begin                                    //查找装运地点
    if active=true then active:=false;      //及装运地点的增值税标识
    sql.Clear;
    sql.Add('select location,SHIP_CTAX_PTR,ship_lead_time,');
    sql.Add('state_id,state_tax');
    sql.Add('from data0012,data0189');
    sql.Add('where data0012.SHIP_CTAX_PTR=data0189.rkey and');
    sql.Add('data0012.rkey='+dm.ADOQuery4.fieldbyname('CUST_SHIP_ADDR_PTR').AsString);
    active := true;
    edit8.Text := fieldvalues['location'];
    edit1.Text:=fieldbyname('state_id').AsString;
   end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  with dm.ADOQuery3 do                     //查找销售定单记事本
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select memo_text from data0011');
    sql.Add('where source_type=60 and');
    sql.add('file_pointer='+dm.ADOQuery4.fieldbyname('rkey').AsString);
    active := true;
    if not isempty then  memo3.Text:= Fieldbyname('memo_text').AsString;
   end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 with dm.ADOQuery3 do                     //查找销售订单评审记事本
  begin
   if active=true then active:=false;
   sql.Clear;
   sql.Add('select * from data0011');
   sql.Add('where source_type=1060 and');
   sql.add('file_pointer='+dm.ADOQuery4.fieldbyname('rkey').AsString);
   active := true;
   if not isempty then  po_note.Text:=fieldvalues['memo_text'];
  end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  with dm.ADOQuery3 do                     //查找销售定单装运记事本
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select * from data0179');
    sql.Add('where so_ptr='+dm.ADOQuery4.fieldbyname('rkey').AsString);
    active := true;
    if not isempty then
    for i:=1 to 10 do
     ship_note.Add(Fieldbyname('LINE_'+inttostr(i)).AsString);
   end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  with dm.ADOQuery3 do                     //查找加工指示
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select rkey,remark,eng_note from data0025');
    sql.add('Where rkey='+dm.ADOQuery4.fieldbyname('cust_part_ptr').AsString);
    active := true;
    rkey25:=fieldvalues['rkey'];
    memo1.Text:=fieldbyname('remark').AsString;  //加工指示
    MEMO2.Text:=fieldbyname('eng_note').AsString;  //工程备注
   end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
self.note_information(dm.ADOQuery4.FieldValues['rkey']);  //更新日志
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
dcost:=0;
if dm.ADOQuery4.FieldValues['qte_ptr']<>null then
with dm.ADOQuery3 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey,TNUMBER from data0085');
  sql.Add('where rkey='+dm.ADOQuery4.fieldbyname('qte_ptr').AsString);
  open;
  if not isempty then
   begin
    edit10.Text:=fieldvalues['TNUMBER'];
    self.Label_qteptr.Caption:= dm.ADOQuery4.fieldbyname('qte_ptr').AsString;
   end;
 end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
if dm.ADOQuery4.FieldValues['supplier_ptr']<>null then
with dm.ADOQuery3 do
 begin
  close;
  sql.Clear;
  sql.Add('select code,supplier_name from data0023');
  sql.Add('where rkey='+dm.ADOQuery4.fieldbyname('supplier_ptr').AsString);
  open;
  if not isempty then
   begin
    edit11.Text := fieldvalues['code'];
    Label85.Caption := fieldbyname('supplier_name').AsString;
   end;
  bitbtn10.Enabled := true;
 end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
with dm.ADOQuery5 do
 begin
  close;
  sql.Clear;
  sql.Add('SELECT Data0005.EMPLOYEE_NAME AS 输入人员,');
  sql.Add('Data0005_1.EMPLOYEE_NAME AS 确认人员');
  sql.Add('FROM Data0005 INNER JOIN Data0060 ON');
  sql.Add('Data0005.RKEY = Data0060.ENTERED_BY_EMPL_PTR LEFT OUTER JOIN');
  sql.Add('Data0005 Data0005_1 ON Data0060.CONF_BY_EMPL_PTR = Data0005_1.RKEY');
  sql.Add('where data0060.rkey='+dm.ADOQuery4.FieldByName('rkey').AsString);
  open;
  edit12.Text:=fieldvalues['输入人员'];
  edit13.Text:=fieldbyname('确认人员').AsString;
end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
if dm.ADOQuery4SHIP_REG_TAX_ID.Value>0  then   //查找工厂
with dm.ADOQuery3 do
 begin
  close;
  sql.Clear;
  sql.Add('select Data0015.WAREHOUSE_CODE, dbo.Data0015.WAREHOUSE_NAME from data0015');
  sql.Add('where rkey='+dm.ADOQuery4SHIP_REG_TAX_ID.AsString);
  open;
  if not isempty then
   begin
    edit2.Text:=fieldbyname('WAREHOUSE_CODE').AsString;
    label52.Caption:= fieldbyname('WAREHOUSE_NAME').AsString;
   end;
 end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  dm.aq192.Open;
  get_data0089(Dm.ADOQuery4.FieldValues['CUST_PART_PTR']);

 if (quote_vflag(Dm.ADOQuery4CUST_PART_PTR.Value,v_part_num)) and
    (dbradiogroup2.ItemIndex=0) and
    (dbradiogroup1.ItemIndex=0) then
  begin                              //订单已经强制关联
   dbedit25.ReadOnly:=true;
   dbedit14.ReadOnly:=true;
   dbedit25.Color:=cl3dlight;
   dbedit14.Color:=cl3dlight;
  end;

 if dm.aq192custcitool.Value='Y' then//可以输入set数
  begin
   label26.Visible:=true;
   label81.Visible:=true;
   dbedit12.Visible:=true;
   dbedit25.Visible:=true;
   label27.Left:=230;
   dbedit13.Left:=308;
  end;
 if dm.aq192custciship.Value='Y' then  bitbtn8.Enabled:=false;//订单不允许修改币别

 label93.Visible:=dm.ADOQuery4COD_FLAG.Value='Y';
 edit5.Visible:=dm.ADOQuery4COD_FLAG.Value='Y';
 bitbtn12.Visible:=dm.ADOQuery4COD_FLAG.Value='Y';
if edit5.Visible then
 with dm.ADOQuery5 do
  begin
   close;
   sql.Text:=
 'SELECT   isnull(derivedtbl_1.qty,0) - SUM(dbo.Data0060.PARTS_SHIPPED) AS all_qty'+#13+
 'FROM         dbo.Data0060 INNER JOIN'+#13+
 '   dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN'+#13+
 '   dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER JOIN'+#13+
 '   dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.RKEY LEFT OUTER JOIN'+#13+
 '       (SELECT  PO_NUMBER, MANU_PART_NUMBER,SUM(all_shipqty) AS qty'+#13+
 '         FROM          dbo.Data0114'+#13+
 '         WHERE      (all_shipqty > 0) AND (TTYPE = 2)'+#13+
 '         GROUP BY PO_NUMBER, MANU_PART_NUMBER) AS derivedtbl_1 ON'+#13+
 '         dbo.Data0097.PO_NUMBER = derivedtbl_1.PO_NUMBER AND'+#13+
 '   dbo.Data0025.MANU_PART_NUMBER = derivedtbl_1.MANU_PART_NUMBER'+#13+
 'WHERE  (dbo.Data0010.COD_FLAG = ''Y'')'+#13+
  'and Data0060.CUST_PART_PTR='+dm.ADOQuery4CUST_PART_PTR.AsString+#13+
  'and Data0060.PURCHASE_ORDER_PTR='+dm.ADOQuery4PURCHASE_ORDER_PTR.AsString+#13+
 'GROUP BY dbo.Data0097.PO_NUMBER, dbo.Data0025.MANU_PART_NUMBER, derivedtbl_1.qty';
   open;
   edit5.Text:=fieldbyname('all_qty').AsString;
  end;

//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  ADOQuery1.Close;
  ADOQuery1.Parameters[1].Value:=trim(Edit3.Text);
  ADOQuery1.Open;
  if ADOQuery1.fieldbyname('credit_rating').AsInteger = 3 then
    Label98.Caption:= '差'
  else if ADOQuery1.fieldbyname('credit_rating').AsInteger = 1 then
    Label98.Caption:= '优'
  else
    Label98.Caption:= '良';
  Label99.Caption:=formatfloat('0.0000',ADOQuery1.fieldbyname('credit_limit').AsFloat);
  Label100.Caption:=formatfloat('0.0000',cacl_deficiency(ADOQuery1.fieldbyname('rkey').AsInteger,
                                         (-1)*StrToCurr(Label44.Caption)/StrtoCurr(DBEdit11.Text)));
  OrigSum:= StrtoCurr(Label44.Caption)*StrtoCurr(DBEdit11.Text);

 pagecontrol1.ActivePageIndex:=0;
  with dm.ADOQuery5 do
  begin
    close;
    sql.Clear;
    sql.Add('select ORIG_CUSTOMER from data0025 where MANU_PART_NUMBER='''+edit4.Text+'''');
    open;
  end;
  Label102.Caption:= '关联原客户： '+dm.ADOQuery5.FieldByName('ORIG_CUSTOMER').AsString;
end;

procedure TForm8.FormShow(Sender: TObject);
var
  total_order:double;
begin
  dbedit11.Field.Alignment := taleftjustify;
  dbedit13.Field.Alignment := taleftjustify;
  dbedit14.Field.Alignment := taleftjustify;
  dbedit15.Field.Alignment := taleftjustify;
  dbedit16.Field.Alignment := taleftjustify;
  dbedit19.Field.Alignment := taleftjustify;
  dbedit20.Field.Alignment := taleftjustify;
  dbedit12.Field.Alignment := taleftjustify;
  dbedit25.Field.Alignment := taleftjustify;
  label45.Caption := formatfloat('0.0000',dm.ADOQuery4.FieldValues['TOTAL_ADD_L_PRICE']); //工具费用

  if dbradiogroup3.ItemIndex=0 then
    label48.caption:=formatfloat('0.0000',dbedit13.Field.Value*dbedit14.Field.Value)  //价格合计
  else
    label48.caption:=formatfloat('0.0000',dbedit13.Field.Value*dbedit14.Field.Value/
                                         (1+dbedit15.Field.Value*0.01));
         //税金
  label47.Caption:=formatfloat('0.000',strtofloat(label48.Caption)*dbedit15.Field.Value*0.01);

                //折扣
  label46.caption := formatfloat('0.000',strtofloat(label48.caption)*dbedit16.Field.Value*0.01);

  TabSheet5Exit(sender);

  total_order:=0;
  dm.ado60.Close;
  dm.ado60.Parameters.ParamByName('@purchase_order_ptr').Value:=dm.ADOQuery1PURCHASE_ORDER_PTR.Value;
  dm.ado60.Parameters.ParamByName('@cust_part_ptr').Value:=dm.ADOQuery1CUST_PART_PTR.Value;
  dm.ado60.Open;
  while not dm.ado60.Eof do
  begin
    total_order:=total_order+dm.ado60PARTS_ORDERED.Value;
    dm.ado60.Next;
  end;
  label77.Caption := formatfloat('0',total_order);
  dm.ado60.Close;
end;

procedure TForm8.DBEdit11KeyPress(Sender: TObject; var Key: Char);
begin
 if key = chr(46) then      //判断是否重复输入小数点'.'
 if pos('.',dbedit11.Text)>0  then abort;
end;

procedure TForm8.DBEdit13KeyPress(Sender: TObject; var Key: Char);
begin
 if key = chr(46) then abort;
end;

procedure TForm8.DBEdit14KeyPress(Sender: TObject; var Key: Char);
begin
 if key = chr(46) then      //判断是否重复输入小数点'.'
 if pos('.',dbedit14.Text)>0  then abort;
end;

procedure TForm8.DBEdit16KeyPress(Sender: TObject; var Key: Char);
begin
 if key = chr(46) then      //判断是否重复输入小数点'.'
 if pos('.',dbedit16.Text)>0  then abort;
end;

procedure TForm8.DBCheckBox4Click(Sender: TObject);
begin
 dbedit19.Enabled:=not dbedit19.Enabled;
 dbedit20.Enabled:=not dbedit20.Enabled;
if dbcheckbox4.Checked then
 begin
  label50.Font.Color:=clwindowtext;
  label51.Font.Color:=clwindowtext;
 end
else
 begin
  label50.Font.Color:=clmedgray;
  label51.Font.Color:=clmedgray;
 end;
end;

procedure TForm8.MaskEdit1Exit(Sender: TObject);
begin
try
 maskedit2.Text := datetostr(strtodate(maskedit1.text)-dm.ADOQuery4.FieldValues['rush_charge_pct_used']);
 if strtodate(maskedit2.Text)<getsystem_date(DM.ADOQuery5,1)+shelf_life then
  IF  messagedlg('计划交期要求在产品生产周期之前,可能导致不能按时交货,继续否?',
      mtConfirmation,[mbyes,mbcancel],0)=mrcancel then
   maskedit1.SetFocus;
except
 messagedlg('客户交期输入格式有误,请仔细检查!',mtwarning,[mbok],0);
 maskedit1.SetFocus;
end;

end;

procedure TForm8.BitBtn3Click(Sender: TObject);
begin
try
 frmcustpart := tfrmcustpart.Create(application);
  with frmcustpart.ADOQuery1 do
   begin
    close;
    frmcustpart.ADOQuery1.SQL.Add(' and MANU_PART_NUMBER LIKE ''%'+Trim(edit4.Text)+'%'' and data0025.customer_ptr='+inttostr(dm.ADOQuery4.FieldValues['customer_ptr'])+' ORDER BY MANU_PART_NUMBER');
//    Parameters[1].Value:=2;
//    Parameters[2].Value:=dm.ADOQuery4.FieldValues['customer_ptr'];
//    Parameters[3].Value:=trim(edit4.Text);
    open;
   end;
  frmcustpart.Edit1.Text:=trim(edit4.Text);
 if frmcustpart.ADOQuery1.IsEmpty then
  begin
   messagedlg('请输入正确的产品型号!',mtinformation,[mbok],0);
   edit4.SetFocus;
  end
 else
 if frmcustpart.ShowModal=mrok then
  if frmcustpart.ADOQuery1.FieldByName('onhold_sales_flag').AsString='1' then
    messagedlg('此产品型号已暂缓销售!',mtwarning,[mbcancel],0)
  else
  if Dm.ADOQuery4.FieldValues['CUST_PART_PTR'] <> frmcustpart.ADOQuery1rkey25.Value then
   begin
    Dm.ADOQuery4CUST_PART_PTR.Value := frmcustpart.ADOQuery1rkey25.Value;
    dbcombobox2.ItemIndex:=self.getSO_OLDNEW(dm.ADOQuery4CUST_PART_PTR.Value);
    get_data0089(frmcustpart.ADOQuery1rkey25.Value);
    edit4.Text := trim(frmcustpart.ADOQuery1.fieldvalues['manu_part_number']);
    label71.Caption:=edit4.Text;
    edit4.Font.Color := clwindowtext;
    label67.Caption := frmcustpart.ADOQuery1.fieldbyname('manu_part_desc').AsString;
    edit9.Text := frmcustpart.ADOQuery1.fieldbyname('qty_on_hand').AsString;
    label5.Caption := frmcustpart.ADOQuery1.fieldbyname('qty_alloc').AsString;
    label6.Caption := floattostr(frmcustpart.ADOQuery1.FieldValues['qty_on_hand']-frmcustpart.ADOQuery1.FieldValues['qty_alloc']);
    //20170322tang添关联原客户可选择
    with dm.ADOQuery5 do
    begin
      close;
      sql.Clear;
      sql.Add('select ORIG_CUSTOMER from data0025 where MANU_PART_NUMBER='''+edit4.Text+'''');
      open;
    end;
    Edit17.Text:= dm.ADOQuery5.FieldByName('ORIG_CUSTOMER').AsString;
    //end20170322tang
    rkey25:=frmcustpart.ADOQuery1.FieldValues['rkey25'];
    memo1.Text:=frmcustpart.ADOQuery1.Fieldbyname('remark').AsString;
    memo2.Text:=frmcustpart.ADOQuery1.Fieldbyname('eng_note').AsString;
    set_qty := frmcustpart.ADOQuery1set_qty.Value;
    label83.Caption := inttostr(set_qty);
    v_part_num:=frmcustpart.ADOQuery1.fieldvalues['ttype']; //样板还是生产板
    if v_part_num=0 then self.BitBtn8.Enabled:=false;       //订单不允许修改币别
    Edit6.SetFocus;
   end
  else
   edit6.SetFocus
 else
  edit4.SetFocus;
finally
 frmcustpart.free;
end;

end;

procedure TForm8.Edit4Click(Sender: TObject);
begin
if edit4.Font.Color=clwindowtext then
  begin
   edit4.SelectAll;
   edit4.Font.Color:=clblue;
  end;
end;

procedure TForm8.Edit4Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn3') and (comparetext(edit4.Text,label71.Caption)<>0) then
try
 frmcustpart:=tfrmcustpart.Create(application);
  with frmcustpart.ADOQuery1 do
   begin
    close;
    Parameters[1].Value:=2;
    Parameters[2].Value:=dm.ADOQuery4.FieldValues['customer_ptr'];
    Parameters[3].Value:=trim(edit4.Text);
    open;
   end;
 frmcustpart.Edit1.Text:=edit4.Text;
 if comparetext(trim(edit4.text),trim(frmcustpart.ADOQuery1.Fieldbyname('manu_part_number').AsString))=0 then
  begin
   if frmcustpart.ADOQuery1.FieldByName('onhold_sales_flag').AsString='1' then
    begin
     messagedlg('此产品型号已暂缓销售!',mtwarning,[mbcancel],0);
     edit4.SetFocus;
     exit;
    end;
   Dm.ADOQuery4CUST_PART_PTR.Value := frmcustpart.ADOQuery1.FieldValues['rkey'];
   dbcombobox2.ItemIndex:=self.getSO_OLDNEW(dm.ADOQuery4CUST_PART_PTR.Value);
   get_data0089(frmcustpart.ADOQuery1.FieldValues['rkey']);
   edit4.Text := trim(frmcustpart.ADOQuery1.fieldvalues['manu_part_number']);
   edit4.Font.Color := clwindowtext;
   label71.Caption:=edit4.Text;

   label67.Caption := frmcustpart.ADOQuery1.fieldbyname('manu_part_desc').AsString;
   edit9.Text := frmcustpart.ADOQuery1.fieldbyname('qty_on_hand').AsString;
   label5.Caption := frmcustpart.ADOQuery1.fieldbyname('qty_alloc').AsString;
   label6.Caption := floattostr(frmcustpart.ADOQuery1.FieldValues['qty_on_hand']-frmcustpart.ADOQuery1.FieldValues['qty_alloc']);

   rkey25:=frmcustpart.ADOQuery1.FieldValues['rkey25'];
   memo1.Text:=frmcustpart.ADOQuery1.Fieldbyname('remark').AsString;
   memo2.Text:=frmcustpart.ADOQuery1.Fieldbyname('eng_note').AsString;
   set_qty := frmcustpart.ADOQuery1set_qty.Value;
   label83.Caption := inttostr(set_qty);
   v_part_num:=frmcustpart.ADOQuery1.fieldvalues['ttype'];  //样板还是生产板
   if v_part_num=0 then self.BitBtn8.Enabled:=false;//订单不允许修改币别
  end
 else
  begin
   messagedlg('产品型号不正确,请重新输入或选择',mtinformation,[mbok],0);
   edit4.SetFocus;
   exit;
  end;
finally
 frmcustpart.free;
end
else
 edit4.Font.Color := clwindowtext;
end;

procedure TForm8.Edit6Click(Sender: TObject);
begin
 if edit6.Font.Color=clwindowtext then
  begin
   edit6.SelectAll;
   edit6.Font.Color:=clblue;
  end;
end;

procedure TForm8.Edit6Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn4') and (activecontrol.Name<>'Buttton2') and (trim(edit6.Text)<>'') then
//try
begin
  with dm.aqTmp do
  begin
    close;
    sql.Clear;
    sql.Add('select rkey,po_number,po_date from data0097 where customer_ptr='+dm.ADOQuery4.FieldByName('customer_ptr').AsString);
    sql.Add('and po_number='''+trim(edit6.Text)+'''');
    open;
  end;

// form_po:=tform_po.Create(application);
// with form_po.ADOQuery1 do
//  begin
//   close;
//   Parameters[1].Value:=dm.ADOQuery4.FieldValues['customer_ptr'];
//   open;
//  end;
// form_po.Edit1.Text:=edit6.Text;
// if comparetext(trim(edit6.text),trim(form_po.ADOQuery1.Fieldbyname('po_number').AsString))=0 then
 if comparetext(trim(edit6.text),trim(dm.aqTmp.Fieldbyname('po_number').AsString))=0 then
  begin  //开始...1       //输入了原有旧合同号
//   label73.Caption := form_po.ADOQuery1.fieldbyname('rkey').AsString;
   label73.Caption := dm.aqTmp.fieldbyname('rkey').AsString;
   edit6.Font.Color := clwindowtext;
//   maskedit3.Text := form_po.ADOQuery1.fieldbyname('po_date').AsString;
   maskedit3.Text := dm.aqTmp.fieldbyname('po_date').AsString;
   maskedit3.Enabled:=False;
  end   //结束..1
 else     //编辑旧的合同
  begin
//   showmessage('请输入正确的采购订单号码!');
//   Edit6.Text:='';
   label73.Caption:=''; //根椐 label73.cpation是否为空来判断编辑还是更来合同指针
   maskedit3.Text := datetostr(getsystem_date(DM.ADOQuery5,1));
   maskedit3.Enabled:=True;   
  end;
//finally
// form_po.free;
end
else             //合同为空
if (activecontrol.Name<>'BitBtn4') and (activecontrol.Name<>'Buttton2') and (trim(edit6.Text)='') then
 begin
  label73.Caption:='';
  maskedit3.Text := datetostr(getsystem_date(DM.ADOQuery5,1));
  maskedit3.Enabled:=True;
 end;
end;

procedure TForm8.BitBtn6Click(Sender: TObject);
begin
try
 form_address:=tform_address.Create(application);
 with form_address.ADOQuery1 do
  begin
   if active=true then active:=false;
   sql.Clear;
   sql.Add('select rkey,location,ship_to_address_1,state,zip,SHIP_CTAX_PTR,');
   sql.Add('SHIP_TO_CONTACT,SHIP_TO_PHONE,SHIP_SHIPPING_METHOD,SHIP_FOB,SHIP_LEAD_TIME');
   sql.Add('from data0012 where customer_ptr='+dm.ADOQuery4.fieldbyname('customer_ptr').AsString);
   sql.Add('order by location');
   active:=true;
  end;
 form_address.Edit1.Text:=trim(edit8.Text);
 if form_address.ADOQuery1.IsEmpty then
  begin
   messagedlg('没有找到符合条件记录!',mtinformation,[mbok],0);
   edit8.SetFocus;
  end
 else
 if form_address.ShowModal=mrok then
  begin
   edit8.Text:=form_address.ADOQuery1.fieldbyname('location').AsString;
   edit8.Font.Color:=clwindowtext;
   dm.ADOQuery4.FieldValues['CUST_SHIP_ADDR_PTR'] := form_address.ADOQuery1.FieldValues['rkey'];
   dm.ADOQuery4.FieldValues['rush_charge_pct_used'] :=form_address.ADOQuery1.FieldValues['SHIP_LEAD_TIME'];
   if trim(dbedit7.Text)='' then
    dbedit7.Field.Value := form_address.ADOQuery1.fieldbyname('ship_to_contact').AsString;
   if trim(dbedit8.Text)='' then
    dbedit8.Field.Value := form_address.ADOQuery1.fieldbyname('ship_to_phone').AsString;
   if trim(dbedit9.Text)='' then
    dbedit9.Field.Value := form_address.ADOQuery1.fieldbyname('ship_shipping_method').AsString;
   WITH DM.ADOQuery2 DO
    begin                  //查找增值税标识
     if active=true then active:=false;
     sql.Clear;
     sql.Add('select state_id,state_tax from data0189');
     sql.Add('where rkey='+form_address.ADOQuery1.fieldbyname('SHIP_CTAX_PTR').AsString);
     active:=true;
     edit1.Text:=fieldbyname('state_id').AsString;
     dm.ADOQuery4.FieldValues['RUSH_CHARGE']:=fieldvalues['state_tax'];
    end;
  end;
 finally
  form_address.free;
 end;
end;

procedure TForm8.Edit8Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn6') then
 try
 form_address:=tform_address.Create(application);
 with form_address.ADOQuery1 do
  begin
   if active=true then active:=false;
   sql.Clear;
   sql.Add('select rkey,location,ship_to_address_1,state,zip,SHIP_CTAX_PTR,');
   sql.Add('SHIP_TO_CONTACT,SHIP_TO_PHONE,SHIP_SHIPPING_METHOD,SHIP_FOB,ship_lead_time');
   sql.Add('from data0012 where customer_ptr='+dm.ADOQuery4.fieldbyname('customer_ptr').AsString);
   sql.Add('order by location');
   active:=true;
  end;
 form_address.Edit1.Text:=edit8.Text;
 if comparetext(trim(edit8.Text),trim(form_address.ADOQuery1.Fieldbyname('location').AsString))=0 then
    begin
     dm.ADOQuery4.FieldValues['CUST_SHIP_ADDR_PTR'] := form_address.ADOQuery1.FieldValues['rkey'];
     edit8.Font.Color:=clwindowtext;
     if trim(dbedit7.Text)='' then
      dbedit7.Field.Value := form_address.ADOQuery1.fieldbyname('ship_to_contact').AsString;
     if trim(dbedit8.Text)='' then
      dbedit8.Field.Value := form_address.ADOQuery1.fieldbyname('ship_to_phone').AsString;
     if trim(dbedit9.Text)='' then
      dbedit9.Field.Value := form_address.ADOQuery1.fieldbyname('ship_shipping_method').AsString;
     WITH DM.ADOQuery2 DO
       begin
         if active=true then active:=false;
         sql.Clear;
         sql.Add('select state_id,state_tax from data0189');
         sql.Add('where rkey='+form_address.ADOQuery1.fieldbyname('SHIP_CTAX_PTR').AsString);
         active:=true;
         edit1.Text:=fieldbyname('state_id').AsString;
         dm.ADOQuery4.FieldValues['RUSH_CHARGE']:=fieldvalues['state_tax'];
       end;
    end
 else
    begin
     messagedlg('装运地点不正确,请重新输入或选择',mtinformation,[mbok],0);
     edit8.SetFocus;
     exit;
    end;
 finally
  form_address.free;
 end;

end;

procedure TForm8.Edit8Click(Sender: TObject);
begin
if edit8.Font.Color=clwindowtext then
  begin
   edit8.SelectAll;
   edit8.Font.Color:=clblue;
  end;
end;

procedure TForm8.BitBtn2Click(Sender: TObject);
begin
 try
  shipmethod_form:=tshipmethod_form.Create(application);
 shipmethod_form.adoquery1.Close;
 shipmethod_form.adoquery1.Parameters[0].Value:=dm.ADOQuery4.FieldValues['customer_ptr'];
 shipmethod_form.adoquery1.Open;
  if shipmethod_form.ADOQuery1.IsEmpty then
    begin
     messagedlg('对不起!没有找到数据!',mtinformation,[mbok],0);
     dbedit9.SetFocus;
    end
 else
  if shipmethod_form.ShowModal=mrok then
    dbedit9.Field.Value := trim(shipmethod_form.ADOQuery1.fieldbyname('description').AsString);
 finally
  shipmethod_form.free;
 end;

end;

procedure TForm8.DBEdit13Exit(Sender: TObject);
begin
if maskedit1.Enabled= true then
 begin
 if dbedit13.text='' then dbedit13.Field.Value:=0;
 if dbedit14.Text='' then dbedit14.Field.Value:=0;

 if (dbedit13.Field.Value mod set_qty)<>0 then
  dbedit12.Field.Value:=round(dbedit13.Field.Value/set_qty)
 else
  dbedit12.Field.Value := dbedit13.Field.Value / self.set_qty;

 dbedit14.field.Value := strtofloat(formatfloat('0.0000000',dbedit14.Field.Value));
 dbedit25.field.Value := strtofloat(formatfloat('0.0000000',dbedit14.Field.Value * self.set_qty));

if dbradiogroup3.ItemIndex=0 then
 label48.caption:=formatfloat('0.0000',dbedit13.Field.Value*dbedit14.Field.Value)  //价格合计
else
 label48.caption:=formatfloat('0.0000',dbedit13.Field.Value*dbedit14.Field.Value/
                                       (1+dbedit15.Field.Value*0.01));
         //税金
label47.Caption:=formatfloat('0.000',strtofloat(label48.Caption)*
                                     dbedit15.Field.Value*0.01);
                //折扣
label46.caption := formatfloat('0.000',strtofloat(label48.caption)*dbedit16.Field.Value*0.01);

if dbRadioGroup3.ItemIndex=1 then
 label44.Caption := formatfloat('0.0000',strtofloat(label48.Caption)-
                                         strtofloat(label46.Caption)+
                                         strtofloat(label45.Caption)+
                                         strtofloat(label47.Caption))
else
 label44.Caption := formatfloat('0.0000',strtofloat(label48.Caption)-
                                         strtofloat(label46.Caption)+
                                         strtofloat(label45.Caption)+
                                         strtofloat(label47.Caption)+
                                         strtofloat(label74.Caption));

 label90.Caption:=formatfloat('0.0000',dbedit13.Field.Value*unit_sq);  //面积
end;
end;

procedure TForm8.DBEdit16Exit(Sender: TObject);
begin
if dbedit16.Text='' then dbedit16.Field.Value:=0;

label46.caption:=formatfloat('0.000',(strtofloat(label48.caption)*dbedit16.Field.Value)*0.01);

if dbRadioGroup3.ItemIndex=1 then
 label44.Caption := formatfloat('0.0000',strtofloat(label48.Caption)-
                                         strtofloat(label46.Caption)+
                                         strtofloat(label45.Caption)+
                                         strtofloat(label47.Caption))
else
 label44.Caption := formatfloat('0.0000',strtofloat(label48.Caption)-
                                         strtofloat(label46.Caption)+
                                         strtofloat(label45.Caption)+
                                         strtofloat(label47.Caption)+
                                         strtofloat(label74.Caption));
end;

procedure TForm8.BitBtn5Click(Sender: TObject);
begin
 try
  form4:=tform4.Create(application);
   with dm.ADOQuery2 do
    begin
    if active=true then active:=false;
       sql.Clear;
       sql.Add('select sales_order,ent_date,po_number,parts_ordered,part_price,');
       sql.Add('case data0060.so_tp when 0 then ''自制'' when 1 then ''外发'' when 2 then ''半制程'' end as sotp,data0023.code');
       sql.Add('from data0060 inner join data0097 on data0060.purchase_order_ptr=data0097.rkey ');
       sql.Add('left outer join data0023 on Data0060.supplier_ptr = data0023.RKEY');
       sql.Add('where cust_part_ptr='+dm.ADOQuery4.fieldbyname('cust_part_ptr').AsString);
       sql.Add('order by ent_date desc');   //按时间降序排列
       active:=true;
     end;
form4.ShowModal;
 finally
  form4.free;
 end;

end;

procedure TForm8.FormCreate(Sender: TObject);
var
 i:byte;
begin
 WITH dm.ADOQuery3 DO
  begin
   active:=false;
   sql.Clear;            //查找工具费用类别
   sql.Add('select rkey,category,TAX_FLAG from data0061 order by rkey');
   active:=true;
   stringgrid1.RowCount:=recordcount+2;
   for i:=1 to RecordCount do
   begin
    stringgrid1.Cells[0,i]:=fieldbyname('category').AsString;
    StringGrid1.Cells[1,i]:='0.0000';
    StringGrid1.Cells[2,i]:='0.0000';
    StringGrid1.Cells[3,i]:='0.0000';
    StringGrid1.Cells[4,i]:=fieldbyname('TAX_FLAG').AsString;
    StringGrid1.Cells[5,i]:=fieldbyname('rkey').AsString;
    next;
   end;
  end;

 with dm.ADOq62 do
  begin
   close;
   Parameters.ParamByName('@rkey').Value:=dm.ADOQuery4.FieldValues['rkey'];
   open;
  end;

  while not dm.Adoq62.Eof do   //查找SO工具费用
   begin
    for i:=1 to StringGrid1.RowCount-2 do
     if strtoint(StringGrid1.Cells[5,i])=dm.adoq62.fieldbyname('addl_cat_ptr').AsInteger then
      begin
       stringgrid1.Cells[1,i]:=formatfloat('0.0000',dm.AdoQ62.FieldValues['amount']);
       stringgrid1.Cells[2,i]:=formatfloat('0.0000',dm.AdoQ62.FieldValues['free_amount']);
       stringgrid1.Cells[3,i]:=formatfloat('0.0000',dm.AdoQ62.FieldValues['costfree_amount']);
       stringgrid1.Cells[4,i]:=dm.ADOq62TAX_FLAG.Value;
       break;
      end;
    dm.AdoQ62.Next;
   end;
//tang2013-10-16添加订单价格明细------
  with dm.ADOQuery3 do
  begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select * from data0579');
    active:=true;
    if not dm.ADOQuery3.IsEmpty then
    begin
      i:=1;
      dm.ADOQuery3.First;
      while not dm.ADOQuery3.Eof do
      begin
        StringGrid3.RowCount:=StringGrid3.RowCount+1;
        StringGrid3.Cells[0,i]:=dm.ADOQuery3.fieldBYName('PriceName').AsString;
        StringGrid3.Cells[1,i]:='0.0000000';
        StringGrid3.Cells[2,i]:=dm.ADOQuery3.fieldBYName('Rkey').AsString;
        i:=i+1;
        dm.ADOQuery3.Next;
      end;
    end;
  end;
  StringGrid3.Cells[0,StringGrid3.RowCount-1]:='合计：';
//  StringGrid3.RowCount:=StringGrid3.RowCount-1;
  with dm.adoS578 do
  begin
    Close;
    Parameters.ParamByName('rkey').Value:=dm.ADOQuery4.FieldValues['rkey'];
    Open;
  end;
  dm.adoS578.First;
  while not dm.adoS578.Eof do
  begin
    LabPrice.Tag:=0;
    for i :=1 to StringGrid3.RowCount-2 do
    begin
     if (StrToInt(StringGrid3.Cells[2,i])=dm.adoS578.FieldByName('d579_Ptr').AsInteger) then
     begin
       StringGrid3.Cells[1,i]:=FormatFloat('0.0000000',dm.adoS578.FieldValues['Price']);
       break;
     end;
    end;
    dm.adoS578.Next;
  end;
//end tang2013-10-16------------------
  with dm.ADOq102 do
   begin
    close;
    dm.ADOQ102.Parameters.ParamByName('@rkey').Value:=dm.ADOQuery4.FieldValues['rkey'];
    open;
   end;

  while not dm.AdoQ102.Eof do    //查找销售代表
   begin
    with dm.ADOQuery3 do
     begin           //定单跟进人员赋值
      if active=true then active:=false;
      sql.Clear;
      sql.Add('select rep_code,sales_rep_name from data0009');
      sql.Add('where rkey='+dm.AdoQ102.fieldbyname('sales_rep_ptr').AsString);
      active:=true;
      StringGrid2.Cells[0,StringGrid2.RowCount-1]:=fieldvalues['rep_code'];
      StringGrid2.Cells[1,StringGrid2.RowCount-1]:=fieldvalues['sales_rep_name'];
      StringGrid2.Cells[2,StringGrid2.RowCount-1]:=formatfloat('0.00',dm.AdoQ102.FieldValues['commission']);
      StringGrid2.Cells[3,stringGrid2.RowCount-1]:=formatfloat('0.00',dm.AdoQ102.FieldValues['credit']);
      StringGrid2.Cells[4,StringGrid2.RowCount-1]:=dm.AdoQ102.fieldbyname('sales_rep_ptr').AsString;
      StringGrid2.RowCount := StringGrid2.RowCount+1;
     end;
      dm.AdoQ102.Next;
   end;
  po_note:=tstringlist.Create;
  ship_note:=tstringlist.Create;
  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
  dm.ADO360.Open;
end;

procedure TForm8.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
if (ARow=stringgrid1.RowCount-1) then
 CanSelect:=false
else
 CanSelect:=true;

 if stringgrid1.Row<>stringgrid1.RowCount-1 then
  begin
   if stringgrid1.Cells[1,stringgrid1.Row]='' then
    stringgrid1.Cells[1,stringgrid1.Row]:='0';
   if stringgrid1.Cells[2,stringgrid1.Row]='' then
    stringgrid1.Cells[2,stringgrid1.Row]:='0';
   if stringgrid1.Cells[3,stringgrid1.Row]='' then
    stringgrid1.Cells[3,stringgrid1.Row]:='0';

   stringgrid1.Cells[1,stringgrid1.Row]:=
   formatfloat('0.0000',strtofloat(stringgrid1.Cells[1,stringgrid1.Row]));
   stringgrid1.Cells[2,stringgrid1.Row]:=
   formatfloat('0.0000',strtofloat(stringgrid1.Cells[2,stringgrid1.Row]));
   stringgrid1.Cells[3,stringgrid1.Row]:=
   formatfloat('0.0000',strtofloat(stringgrid1.Cells[3,stringgrid1.Row]));
  end;

end;

procedure TForm8.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
 if (pos('.',stringgrid1.Cells[stringgrid1.col,stringgrid1.row])>0)  then     //判断是否重复输入小数点'.'
  if key = chr(46)  then abort;

if (key <> chr(9)) then    //没有按tab键
 begin
  if (stringgrid1.Col=4) and (combobox2.Enabled) then
   begin
    ComboBox2.SetFocus;
    SendMessage(ComboBox2.Handle,WM_Char,word(Key),0);
   end;
 end;

end;

procedure TForm8.StringGrid1Exit(Sender: TObject);
begin
 if stringgrid1.Row<>stringgrid1.RowCount-1 then
  begin
   if stringgrid1.Cells[1,stringgrid1.Row]='' then
    stringgrid1.Cells[1,stringgrid1.Row]:='0';
   if stringgrid1.Cells[2,stringgrid1.Row]='' then
    stringgrid1.Cells[2,stringgrid1.Row]:='0';
   if stringgrid1.Cells[3,stringgrid1.Row]='' then
    stringgrid1.Cells[3,stringgrid1.Row]:='0';

    stringgrid1.Cells[1,stringgrid1.Row]:=
     formatfloat('0.0000',strtofloat(stringgrid1.Cells[1,stringgrid1.Row]));
    stringgrid1.Cells[2,stringgrid1.Row]:=
     formatfloat('0.0000',strtofloat(stringgrid1.Cells[2,stringgrid1.Row]));
    stringgrid1.Cells[3,stringgrid1.Row]:=
     formatfloat('0.0000',strtofloat(stringgrid1.Cells[3,stringgrid1.Row]));
  end;
end;

procedure TForm8.StringGrid2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  column,row:integer;
begin
if button=mbright then
 begin
  stringgrid2.MouseToCell(x,y,column,row);
   if row<>0 then
  stringgrid2.Row:=row;
 end;
end;

procedure TForm8.PopupMenu2Popup(Sender: TObject);
begin
 if stringgrid2.RowCount=7 then
  add_rep.Enabled:=false
 else
  add_rep.Enabled:=true;
 if stringgrid2.Row=stringgrid2.RowCount-1 then
  begin
   edit_rep.Enabled:=false;
   del_rep.Enabled:=false;
  end
 else
  begin
   edit_rep.Enabled:=TRUE;
   del_rep.Enabled:=TRUE;
  end;
end;

procedure TForm8.add_repClick(Sender: TObject);
var
 i:byte;
begin
 try
  form5:=tform5.Create(application);
  if form5.ShowModal=mrok  then
    begin
     for i := 1 to stringgrid2.RowCount-2 do //比较是否重复
      if comparetext(stringgrid2.Cells[0,i],form5.Edit1.Text)=0 then
         begin
          messagedlg('销售代表重复!',mtwarning,[mbok],0);
          exit;
         end;
     stringgrid2.Cells[0,stringgrid2.RowCount-1]:=form5.Edit1.Text;
     stringgrid2.Cells[1,stringgrid2.RowCount-1]:=form5.Label4.Caption;
     stringgrid2.Cells[2,stringgrid2.RowCount-1]:=form5.Edit2.Text;
     stringgrid2.Cells[3,stringgrid2.RowCount-1]:=form5.Edit3.Text;
     stringgrid2.Cells[4,stringgrid2.RowCount-1]:=form5.Label7.Caption;
     stringgrid2.RowCount:=stringgrid2.RowCount+1;
    end;
 finally
  form5.Free;
 end;
end;

procedure TForm8.edit_repClick(Sender: TObject);
var
 i:byte;
begin
 try
  form5 := tform5.Create(application);
  form5.Edit1.Text := stringgrid2.Cells[0,stringgrid2.row];
  form5.Edit2.Text := stringgrid2.Cells[2,stringgrid2.row];
  form5.Edit3.Text := stringgrid2.Cells[3,stringgrid2.row];
  form5.Label4.Caption := stringgrid2.Cells[1,stringgrid2.row];
  form5.Label7.Caption := stringgrid2.Cells[4,stringgrid2.row];
  if form5.ShowModal = mrok then
   begin
    for i := 1 to stringgrid2.RowCount-2 do //比较是否重复
     if i <> stringgrid2.Row then
      if comparetext(stringgrid2.Cells[0,i],form5.Edit1.Text)=0 then
       begin
        messagedlg('销售代表重复!',mtwarning,[mbok],0);
        exit;
       end;
    stringgrid2.Cells[0,stringgrid2.row]:=form5.Edit1.Text;
    stringgrid2.Cells[2,stringgrid2.row]:=form5.Edit2.Text;
    stringgrid2.Cells[3,stringgrid2.row]:=form5.Edit3.Text;
    stringgrid2.Cells[1,stringgrid2.row]:=form5.Label4.Caption;
    stringgrid2.Cells[4,stringgrid2.row]:=form5.Label7.Caption;
   end;
 finally
  form5.free;
 end;
end;

procedure TForm8.del_repClick(Sender: TObject);
var
 i:byte;
begin
 for i:=stringgrid2.Row to stringgrid2.RowCount-2 do
  stringgrid2.Rows[i].Text:=stringgrid2.Rows[i+1].Text;
  stringgrid2.RowCount:=stringgrid2.RowCount-1;
end;

procedure TForm8.StringGrid2DblClick(Sender: TObject);
begin
 if trim(stringgrid2.Cells[0,stringgrid2.Row])<>'' then
    edit_repclick(sender);
end;

procedure TForm8.FormDestroy(Sender: TObject);
begin
  sales_note.Free;
//  saconf_note.Free;
  po_note.Free;
  ship_note.Free;
end;

procedure TForm8.Button1Click(Sender: TObject);
var dSum:Double;
 v_credit: single;
 i: byte;
 v_rkey: integer;
 old_ponumber: string;
begin
 if ((dbedit13.Field.Value mod set_qty)<>0) and
    (messagedlg('订单数量pcs不是出货板数set的倍数,是否继续?',mtconfirmation,[mbYes,mbNo],0)=mrno) then
  begin
   pagecontrol1.ActivePageIndex:=3;
   dbedit13.SetFocus;
   exit;
  end;

 if form1.v_con=1 then
 if messagedlg('该订单的合同已有评审人员，如果保存将需要重新审批',mtconfirmation,[mbok,mbcancel],0)=mrcancel then
  begin
   button2.SetFocus;
   exit;
  end;
//******************************************************************************
// if stringgrid2.RowCount>2 then  //销售代表
//  begin
//   v_credit:=0;
//   for i:=1 to stringgrid2.RowCount-2 do
//   v_credit:=v_credit+strtofloat(stringgrid2.Cells[3,i]);
//   if v_credit<>100 then {判断条件原来是'<'后经修改成'<>'       11.18}
//    if messagedlg('销售代表佣金分配合计应为100,要分配至相等的百分比吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
//     for i:=1 to stringgrid2.RowCount-2 do
//      if (stringgrid2.RowCount=5) and (i=3) then
//       stringgrid2.Cells[3,i]:='33.34'
//      else
//       stringgrid2.Cells[3,i]:=formatfloat('0.00',100/(stringgrid2.RowCount-2))
//    else
//     exit;
//  end
// else
//  begin
//   messagedlg('至少指派一名销售代表!',mterror,[mbcancel],0);
//   exit;
//  end;
//******************************************************************************
if (dm.aq192suplcimat.Value<>'Y') and     //样板及备品订单以外的SO单价不可以为零
   (form8.v_part_num<>1) and              //不是样板
   (form8.DBRadioGroup2.ItemIndex<>1) and //不是备品
   (dbedit14.Field.Value=0) then          //单价为零
 begin
  showmessage('样板及备品订单以外的SO单价不可以为零');
  dbedit14.SetFocus;
  exit;
 end;

  if (Trim(Edit17.Text)<>'') then
  begin
    //20170322tang添关联原客户可选择
    with dm.ADOQuery5 do
    begin
      close;
      sql.Clear;
      sql.Add('select ABBR_NAME from data0010 where ABBR_NAME like ''%'+Trim(Edit17.Text)+'%'' and CUSTOMER_TYPE<>4');
      open;
    end;
    if dm.ADOQuery5.IsEmpty then
    begin
      ShowMessage('找不到该客户简称或是已被设置成无效。');
      Edit17.SetFocus;
      Exit;
    end;
    //end20170322tang
  end;
//******************************************************************************
 if not ((ContractInfo.ContractNo<>'') or (checkRFQContractNo(DBEdit10.Text))) then  //不存在RFQ合同号
 begin
   if (quote_vflag(Dm.ADOQuery4CUST_PART_PTR.Value,v_part_num)) and
      (label_qteptr.Caption='0') and
      (dbradiogroup2.ItemIndex=0) and
      (dbradiogroup1.ItemIndex=0) then
   begin
    showmessage('订单已经与报价单强制关联,请选择一个报价单号');
    pagecontrol1.ActivePageIndex:=3;
    bitbtn9.SetFocus;
    exit;
   end;
 end;
//******************************************************************************
  ADOQuery1.Close;
  ADOQuery1.Parameters[1].Value:=trim(Edit3.Text);
  ADOQuery1.Open;
  if ADOQuery1.fieldbyname('credit_rating').AsInteger = 3 then
  begin
    messagedlg('客户:'+Edit3.Text+'信用等级太差,订单无法继续!',mtwarning,[mbok],0);
    exit;
  end
  else if ADOQuery1.fieldbyname('credit_rating').AsInteger = 1 then //信用等级为优，超过限额出现提示后仍然可以
  begin                               //开出订单
    if cacl_deficiency(ADOQuery1.fieldbyname('rkey').AsInteger,
                       StrToCurr(Label44.Caption)/StrtoCurr(DBEdit11.Text)-OrigSum)
                > ADOQuery1.fieldbyname('credit_limit').AsCurrency+1 then
    if messagedlg('客户:'+Edit3.Text+'未付款金额大于了信用限额是否继续?',
     mtconfirmation,[mbyes,mbno],0)=mrno then exit;
  end
  else //信用等级为良，只能在限额以内开出销售订单
  begin
    if cacl_deficiency(ADOQuery1.fieldbyname('rkey').AsInteger,
                       StrToCurr(Label44.Caption)/StrtoCurr(DBEdit11.Text)-OrigSum)
                > ADOQuery1.fieldbyname('credit_limit').AsCurrency+1 then
    begin
      messagedlg('客户:'+Edit3.Text+'未付款金额大于了信用限额无法继续!',mtwarning,[mbok],0);
      exit;
    end;
  end;

//tang2013-10-16添加订单价格明细-----
  dSum:=0;
  for i :=1  to StringGrid3.RowCount-2 do
  begin
    dSum:=dSum+StrToFloat(formatfloat('0.0000000',StrToFloat(StringGrid3.Cells[1,i])));
  end;
  if (dSum<>0) then
  begin
    if (formatfloat('0.0000000',dm.ADOQuery4PART_PRICE.AsFloat)<>formatfloat('0.0000000',dSum)) then
    begin
      messagedlg('订单明细价格之和不等于订单总价格,无法继续!',mtwarning,[mbok],0);
      ModalResult:=mrcancel;
      exit;
    end;
    LabPrice.Tag:=0;
  end else
  begin
    if messagedlg('不设置订单价格明细，将无法计算业务员提成,是否继续?',
     mtconfirmation,[mbyes,mbno],0)=mrno then
    begin
      ModalResult:=mrcancel;
      exit;
    end;
    LabPrice.Tag:=1;
  end;
//end tang2013-10-16-----------------

//2017-7-17tang外发状态必须指定外发供应商
  if (dm.ADOQuery4.FieldByName('so_tp').Value=1) and (Edit11.Tag=0) then
  begin
    showmsg('加工形式为外发，必须指定外发供应商！',1);
    exit;
  end;
  if (Edit11.Tag>0) and (StrToInt(Trim(Label103.Caption))=0) then
  begin
    if messagedlg('外发供应商委外发入库成本折率为零，是否继续??',mtconfirmation,[mbYes,mbNo],0) = mrNo then Exit;
  end;
//end 2017-07-17

//******************************************************************************
 dm.ADOConnection1.BeginTrans;  //幵始事物处理

if trim(label73.Caption)<>'' then    //选择了旧合同号
 begin
  if label73.Caption<>label72.Caption then  //用户更更改了合同指针
   begin
    with dm.AQ97 do
     begin
      if active=true then active:=false;
      sql.Clear;
      sql.Add('select * from data0097 where rkey='+label72.Caption);
      active:=true;
      edit;
      fieldvalues['open_sos'] := fieldvalues['open_sos']-1;
      post;
     end;
    with dm.AQ97 do
     begin
      if active=true then active:=false;
      sql.Clear;
      sql.Add('select * from data0097 where rkey='+label73.Caption);
      active:=true;
      edit;
      fieldvalues['open_sos'] := fieldvalues['open_sos']+1;
      fieldvalues['po_date'] := strtodate(maskedit3.Text);
      post;
     end;
   end
  else                 //没有对客户订单做修改
   with dm.AQ97 do
    begin
     active:=false;
     sql.Clear;
     sql.Add('select * from data0097 where rkey='+label73.Caption);
     active:=true;
     edit;            //记录客户订单日期的修改
     fieldvalues['po_date'] := strtodate(maskedit3.Text);
     post;
    end;
 end
else    //如果是新增合号
 begin
  with dm.AQ97 do
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select * from data0097 where rkey='+label72.Caption);
    active:=true;
    old_ponumber:=fieldvalues['po_number'];
   end;

  with dm.AQ97 do
   begin
    if active = true then active := false;
    sql.Clear;
    sql.Add('select * from data0097 where rkey is null');
    active:=true;
    append;
    fieldvalues['po_number'] := trim(edit6.Text);
    fieldbyname('customer_ptr').AsString := dm.ADOQuery4.FieldValues['CUSTOMER_PTR'];
    fieldvalues['po_date'] := strtodate(maskedit3.Text);
    fieldvalues['open_sos'] := 1;
    post;
    label73.Caption := fieldbyname('rkey').asstring;
   end;
  with dm.ADOQuery5 do
   begin
    close;            //记录客户订单更改情况(日志文件)
    sql.Clear;
    sql.Add('insert into data0318 (SALES_ORDER_PTR,TRANS_TYPE,TRANS_DESCRIPTION,');
    sql.Add('FROM_STRING,TO_STRING,USER_PTR,TRANS_DATE,PROGRAM_SOURCE)');
    sql.Add('values ('+dm.ADOQuery4.Fieldbyname('rkey').AsString+',1,''更改客户订单号'',');
    sql.Add(''''+old_ponumber+''','''+edit6.Text+''','+rkey73+',');
    sql.add(''''+datetostr(getsystem_date(DM.ADOQuery2,1))+''',32)');
    ExecSQL;
   end;
 end;

//**************************************************************开始更新工具费用
 dm.ADOq62.First;
 while not dm.ADOq62.Eof do dm.ADOq62.Delete; //首先将其全部删除
 for i:=1 to StringGrid1.rowcount-2 do
  if (strtofloat(StringGrid1.Cells[1,i])>0) or
     (strtofloat(StringGrid1.Cells[2,i])>0) or
     (strtofloat(StringGrid1.Cells[3,i])>0) then
   begin
    dm.adoQ62.Append;
    dm.adoQ62.Fieldvalues['so_ptr'] := dm.ADOQuery4.FieldValues['rkey'];
    dm.AdoQ62.FieldByName('amount').asstring := StringGrid1.Cells[1,i];
    dm.AdoQ62.FieldByName('free_amount').asstring := StringGrid1.Cells[2,i];
    dm.AdoQ62.FieldByName('costfree_amount').asstring := StringGrid1.Cells[3,i];
    dm.ADOq62TAX_FLAG.Value := StringGrid1.Cells[4,i];
    dm.adoQ62.FieldByName('addl_cat_ptr').asstring := StringGrid1.Cells[5,i];
    dm.AdoQ62.post;
   end;
//tang2013-10-16添加订单价格明细----------
//**************************************************************开始更新订单价格明细
  if (LabPrice.Tag<>1) then
  begin
    dm.adoS578.First;
    while not dm.adoS578.Eof do dm.ados578.Delete;
    for i := 1 to StringGrid3.RowCount-2 do
    begin
      if (StrToFloat(StringGrid3.Cells[1,i])>0) then
      begin
        dm.adoS578.Append;
        dm.adoS578.FieldByName('d579_Ptr').AsString:=StringGrid3.Cells[2,i];
        dm.adoS578.Fieldvalues['d60_Ptr']:=dm.ADOQuery4.FieldValues['rkey'];
        dm.adoS578.FieldByName('Price').AsString:=StringGrid3.Cells[1,i];
        dm.adoS578.Post;
      end;
    end;
  end;
//end tang2013-10-16----------------------
//**************************************************************开始更新销售代表
// dm.ADOq102.First;
// while not dm.ADOq102.Eof do dm.ADOq102.Delete;
//
// for i:=1 to StringGrid2.RowCount-2 do
//  begin
//   dm.AdoQ102.Append;
//   dm.AdoQ102.Fieldvalues['sales_order_ptr'] := dm.ADOQuery4.FieldValues['rkey'];
//   dm.AdoQ102.FieldByName('sales_rep_ptr').AsString := StringGrid2.Cells[4,i];
//   dm.AdoQ102.FieldByName('commission').AsString := StringGrid2.Cells[2,i];
//   dm.AdoQ102.FieldByName('credit').AsString := StringGrid2.Cells[3,i];
//   dm.AdoQ102.Post;
//  end;
//**********************************************开始更新四个记事本包括采购记事本
 savepo_note;
//***********************************************开始更dta0060自身
 dm.ADOQuery4.Fieldbyname('PURCHASE_ORDER_PTR').AsString := label73.Caption; //采购定单指针
 dm.ADOQuery4.fieldbyname('CUSTOMER_CONTACT').AsString := combobox1.Text;    //客户联络人
 dm.ADOQuery4.fieldbyname('ORIG_REQUEST_DATE').AsString := maskedit1.Text;   //市场部请求日期;
 dm.ADOQuery4.fieldbyname('ORIG_SCHED_SHIP_DATE').AsString := maskedit2.Text;//市场部装运日期;
 dm.ADOQuery4.fieldbyname('TOTAL_ADD_L_PRICE').AsString := label45.Caption;  //更新工具费用总计
 dm.ADOQuery4.FieldByName('MODIFIED_BY_EMPL_PTR').AsString := form1.enter_empl_ptr.Caption;
 dm.ADOQuery4.FieldByName('COMM_ASSIGNED_BY_E_P').AsString := ywy;  //业务员 
 dm.ADOQuery4.FieldValues['MODF_DATE'] := getsystem_date(DM.ADOQuery5,1);     //修改人员及日期
 dm.ADOQuery4DUE_DATE.AsString:= maskedit4.Text;  //原始客户交期
 if dm.ADOQuery4.FieldValues['PROD_REL']='2' then //如果已确认
  begin
   dm.ADOQuery4.fieldvalues['conf_date'] := null;
   dm.ADOQuery4.fieldvalues['prod_rel'] := '1';   //使成为未确认
   dm.ADOQuery4.fieldvalues['conf_by_empl_ptr'] := null;
  end;
 if rkey213_old>0 then//编辑时改变了原来从预处理下的正式订单信息
 begin
  begin
   with dm.ADOQuery5 do
   begin
     close;
     sql.Clear;
     sql.Add('update data0213 set status=3 where rkey='+inttostr(rkey213_old));
     ExecSQL;
   end;
  end;
 end;
  with dm.ADOQuery5 do
  begin
   Close;
   sql.Clear;
   SQL.Add('update data0213 set status=2 where rkey='+inttostr(rkey213_new));
   ExecSQL;
  end;
  with dm.ADOQuery5 do
  begin
   Close;
   sql.Clear;
   sql.Add('update data0060 set rkey213='+inttostr(rkey213_new)+'where rkey='+dm.ADOQuery1D60RKEY.AsString);
  end;

 if strtoint(Label_qteptr.Caption)>0  then
 dm.ADOQuery4.FieldValues['qte_ptr'] := strtoint(Label_qteptr.Caption);
 dm.ADOQuery4.FieldValues['status'] := 6; //未提交,编辑保存后需重新提交040209
 dm.ADOQuery4.FieldValues['to_be_planned'] :=
 dm.ADOQuery4.FieldValues['parts_ordered']-dm.ADOQuery4.FieldValues['QTY_PLANNNED'];
 dm.ADOQuery4.fieldvalues['to_be_confirmed'] :=dm.ADOQuery4.fieldvalues['to_be_planned'];

 if dm.ADOQuery4.FieldValues['to_be_planned']<=0 then
  dm.ADOQuery4.FieldValues['PROD_REL']:='3';

 dm.ADOQuery4.FieldValues['to_be_confirmed']:=dm.ADOQuery4.FieldValues['parts_ordered'];

 if dm.ADOQuery4TAX_IN_PRICE.Value='N' then                  //价格不含税
  dm.ADOQuery4PARTS_ALLOC.Value:=dm.ADOQuery4PART_PRICE.Value
 else
 dm.ADOQuery4PARTS_ALLOC.Value:=dm.ADOQuery4PART_PRICE.Value/
     (1+dm.ADOQuery4RUSH_CHARGE.Value*0.01);

//20170227tang编辑时评审统一返回未审状态
  dm.adoquery4.fieldvalues['quote_price'] := 0; //表示so未审批(需要审批)
  dm.ADOQuery4.FieldValues['SCH_DATE'] := null;
//20170322tang60添加新字段关联原客户
  if (Trim(Edit17.Text)<>'') then
  dm.ADOQuery4.FieldValues['ORIG_CUSTOMER'] :=Trim(Edit17.Text);
//******************************************************************************
//20161219tang注释，所有订单必须提交订单
// if v_part_num = 0 then //量板
//  if dm.aq192aptaxontax.Value='Y' then //量板需要审批
//   begin
//    dm.adoquery4.fieldvalues['quote_price'] := 0; //表示so未审批(需要审批)
//    dm.ADOQuery4.FieldValues['SCH_DATE'] := null;
//   end
//  else                                 //量板不需审批
//   begin
//    dm.adoquery4.fieldvalues['quote_price'] := 3;   //表示SO不需评审
//    dm.ADOQuery4.FieldValues['status']:=1;
//    dm.ADOQuery4.FieldValues['SCH_DATE'] := dm.ADOQuery4.FieldValues['ORIG_SCHED_SHIP_DATE'];
//   end
// else                //样板
//  if dm.aq192artaxontax.Value = 'Y' then          //样板需要审批
//   begin
//    dm.adoquery4.fieldvalues['quote_price']:=0;     //表示SO未审批(需要审批）
//    dm.ADOQuery4.FieldValues['SCH_DATE'] := null;
//   end
//  else
//   begin
//    dm.adoquery4.fieldvalues['quote_price']:=3;   //表示SO不需评审
//    dm.ADOQuery4.FieldValues['status']:=1;
//    dm.ADOQuery4.FieldValues['SCH_DATE'] := dm.ADOQuery4.FieldValues['ORIG_SCHED_SHIP_DATE'];
//   end;
//******************************************************************************
try
 dm.ADOQuery4.Post;
except
 on E: Exception do
  begin
   dm.ADOConnection1.RollbackTrans;
   messagedlg(E.Message,mterror,[mbcancel],0);
   exit;
  end;
end;
//**********************************************************开始更新板号资料
  //20161219tang改---
  with dm.Aupdate50 do
  begin
   close;
   Parameters[0].Value :=dm.ADOQuery4.FieldValues['CUST_PART_PTR'];
   open;
   edit;
   if ((dm.ADOQuery4.Fieldbyname('PART_PRICE').AsCurrency<>0) and (dm.ADOQuery4.FieldByName('so_style').AsInteger=0)) then
   if dm.ADOQuery4TAX_IN_PRICE.Value='N' then
    dm.Aupdate50latest_price.AsString := formatfloat('0.0000', //价格
     dm.ADOQuery4.FieldValues['PART_PRICE']/dm.ADOQuery4.FieldValues['EXCH_RATE'])
   else
    dm.Aupdate50latest_price.AsString := formatfloat('0.0000', //价格
     dm.ADOQuery4.FieldValues['PART_PRICE']/dm.ADOQuery4.FieldValues['EXCH_RATE']/
     (1+dm.ADOQuery4RUSH_CHARGE.Value*0.01));
   post;
  end;
//============================================================开始更新加工指示
  dm.ADOupdate25.Close;
  dm.ADOupdate25.Parameters[1].Value:=memo1.Text;  //加工指示
  dm.ADOupdate25.Parameters[2].Value:=memo2.Text;  //工程备注
  dm.ADOupdate25.Parameters[3].Value:=rkey25;
  dm.ADOupdate25.ExecProc;
//**********************************************************开始更新订单评审部门
//if dm.adoquery4.fieldvalues['quote_price'] = 0 then self.aq97update();
//******************************************************************************
 self.update_note;//更新的日志记录
//******************************************************************************
try
 dm.ado89.UpdateBatch();
 dm.ADOConnection1.CommitTrans;
except
 dm.ADOConnection1.RollbackTrans;
 messagedlg('因意外导致数据保存失败，请退出重试',mterror,[mbcancel],0);
 exit;
end;

 v_rkey:=dm.ADOQuery1D60RKEY.Value;
 dm.ADOQuery1.Close;
 dm.ADOQuery1.Open;
 dm.ADOQuery1.Locate('d60rkey',v_rkey,[]);
 self.Close;
end;

procedure Tform8.savepo_note();
var
 i:byte;
begin

  with dm.ADOQuery3 do      // 更新销售定单记事本
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select * from data0011 where  source_type=60');
    sql.Add('and file_pointer='+dm.ADOQuery4.fieldbyname('rkey').AsString);
    active:=true;
    if (not IsEmpty) and (trim(memo3.Text)<>'') then
     begin             //原记录有记事本而且修改了
      Edit;
      fieldbyname('memo_text').asstring:=memo3.Text;
      Post;
     end
    else
     if (not IsEmpty) and (trim(memo3.Text)='') then   //如果原记录有记事本但被删除了
       Delete
     else
      if (IsEmpty) and  (trim(memo3.Text)<>'') then    //如果原记录没有记事本，但新增了记事本
       begin
        Append;
        FieldByName('file_pointer').AsString:=dm.ADOQuery4.fieldbyname('rkey').AsString;
        Fieldvalues['source_type']:=60;
        fieldbyname('memo_text').asstring:=memo3.Text;
        post;
       end;
   end;

  with dm.ADOQuery3 do      // 更新销售订单评审记事本
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select * from data0011 where  source_type=1060');
    sql.Add('and file_pointer='+dm.ADOQuery4.fieldbyname('rkey').AsString);
    active:=true;
    if (not IsEmpty) and (trim(po_note.Text)<>'') then
     begin             //原记录有记事本而且修改了
      Edit;
      fieldvalues['memo_text']:=po_note.Text;
      Post;
     end
    else
     if (not IsEmpty) and (trim(po_note.Text)='') then   //如果原记录有记事本但被删除了
       Delete
     else
      if (IsEmpty) and  (trim(po_note.Text)<>'') then    //如果原记录没有记事本，但新增了记事本
       begin
        Append;
        FieldByName('file_pointer').AsString:=dm.ADOQuery4.fieldbyname('rkey').AsString;
        Fieldvalues['source_type']:=1060;
        fieldvalues['memo_text']:=po_note.Text;
        post;
       end;
   end;

  with dm.ADOQuery3 do      // 更新销售定单装运记事本
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select * from data0179');
    sql.Add('where so_ptr='+dm.ADOQuery4.fieldbyname('rkey').AsString);
    active:=true;
    if (not IsEmpty) and (trim(ship_note.Text)<>'') then
     begin             //原记录有记事本而且修改了
      Edit;
      for i:=1 to ship_note.count do
      fieldbyname('line_'+inttostr(i)).asstring := ship_note.Strings[i-1];
      Post;
     end
    else
     if (not IsEmpty) and (trim(ship_note.Text)='') then
       Delete         //如果原记录有记事本但被删除了
     else
      if (IsEmpty) and  (trim(ship_note.Text)<>'') then
       begin           //如果原记录没有记事本，但新增了记事本
        Append;
        FieldByName('so_ptr').AsString:=dm.ADOQuery4.fieldbyname('rkey').AsString;
        for i:=1 to ship_note.Count do
        fieldbyname('line_'+inttostr(i)).asstring := ship_note.Strings[i-1];
        post;
       end;
   end;
end;

procedure TForm8.TabSheet5Exit(Sender: TObject);
var
 tool,tax_amount:single;
 i:byte;
begin
 tool := 0;
 tax_amount := 0;
 for i:=1 to stringgrid1.RowCount-2 do
if strtocurr(stringgrid1.Cells[1,i])>0 then
 begin
  tool:=tool+strtocurr(stringgrid1.Cells[1,i]);
  if dbRadioGroup3.ItemIndex=0 then //价格不含税
   if stringgrid1.Cells[4,i]='Y' then
    tax_amount:=tax_amount+strtocurr(floattostrf(
                           strtocurr(stringgrid1.Cells[1,i])*
                           dm.ADOQuery4RUSH_CHARGE.Value*0.01,ffFixed,10,4))
   else
  else   //本身含税
   if stringgrid1.Cells[4,i]='Y' then
    tax_amount:=tax_amount+strtocurr(floattostrf(
            strtocurr(stringgrid1.Cells[1,i])*dm.ADOQuery4RUSH_CHARGE.Value*0.01/
                       (1+dm.ADOQuery4RUSH_CHARGE.Value*0.01),ffFixed,10,4));
 end;

 label45.Caption := formatfloat('0.0000',tool);
 label74.Caption := formatfloat('0.0000',tax_amount);

if dbRadioGroup3.ItemIndex=1 then
 label44.Caption := formatfloat('0.0000',strtofloat(label48.Caption)-
                                         strtofloat(label46.Caption)+
                                         strtofloat(label45.Caption)+
                                         strtofloat(label47.Caption))
else
 label44.Caption := formatfloat('0.0000',strtofloat(label48.Caption)-
                                         strtofloat(label46.Caption)+
                                         strtofloat(label45.Caption)+
                                         strtofloat(label47.Caption)+
                                         strtofloat(label74.Caption));
end;

procedure TForm8.Button3Click(Sender: TObject);
begin
 self.savepo_note;
 close;
end;

procedure TForm8.BitBtn4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

begin
 form_po:=tform_po.Create(application);
 with form_po.ADOQuery1 do
  begin
   close;
   Parameters[1].Value:=dm.ADOQuery4.FieldValues['customer_ptr'];
   open;
  end;
 form_po.Edit1.Text:=trim(edit6.Text);
 if form_po.ADOQuery1.IsEmpty then
  begin
   messagedlg('没有找到记录!',mtinformation,[mbok],0);
   edit6.SetFocus;
  end
 else
 if form_po.ShowModal=mrok then
  begin
   label73.Caption := form_po.ADOQuery1.fieldbyname('rkey').AsString;
   edit6.Text := TRIM(form_po.ADOQuery1.fieldbyname('po_number').AsString);
   edit6.Font.Color := clwindowtext;
   maskedit3.Text := form_po.ADOQuery1.fieldbyname('po_date').AsString;
   maskedit3.Enabled:= False;
   if strtoint(label73.Caption)<>strtoint(label72.Caption) then //如果是新选择的合同号
   begin
    with dm.ADOQuery3 do                     //查找采购定单记事本
     begin
     if active=true then active:=false;
     sql.Clear;
     sql.Add('select * from data0011');
     sql.Add('where source_type=1060 and');
                      //sql.Add('where source_type=97 and');
     sql.add('file_pointer='+label73.Caption);
     active := true;
     if not isempty then
      po_note.Text:=fieldvalues['memo_text']
     else
      po_note.Clear;
     end;
   end;
//   maskedit3.SetFocus;
  end
 else//没有重新选择合同号
  edit6.SetFocus;
end;

procedure TForm8.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and             //如果是下箭头如果是最后一条记录
    (dm.ado89.RecNo=dm.ado89.RecordCount) then abort;
 if key=45 then abort; //insert键
 if (key=112) and (dbcombobox1.Visible)then
  begin
   dbcombobox1.SetFocus;
   dbcombobox1.DroppedDown:=true;
  end;
end;

procedure TForm8.DBGrid1CellClick(Column: TColumn);
begin
if column.Index<=2 then
 dbgrid1.SelectedIndex:=3;
end;

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dm.aq192.close;
 dm.ado278.Close;
 dm.ado89.Close;
 dm.ADO360.Close;
end;

procedure TForm8.Button1Enter(Sender: TObject);
begin

if trim(dbedit21.Field.Value)='' then
 begin
  messagedlg('请输入正确的订单号码!',mtinformation,[mbok],0);
  pagecontrol1.ActivePageIndex:=0;
  dbedit21.SetFocus;
  exit;
 end;

 if trim(edit6.Text)='' then
  begin
   messagedlg('请输入正确的采购订单号码!',mtinformation,[mbok],0);
   pagecontrol1.ActivePageIndex:=0;
   edit6.SetFocus;
   exit;
  end;
 if trim(edit4.Text)='' then
  begin
   messagedlg('请输入正确的本厂编号!',mtinformation,[mbok],0);
   pagecontrol1.ActivePageIndex:=0;
   edit4.SetFocus;
   exit;
  end;
 if trim(edit2.Text)='' then
  begin
   messagedlg('请输入正确的工厂代码!',mtinformation,[mbok],0);
   pagecontrol1.ActivePageIndex:=0;
   edit2.SetFocus;
   exit;
  end;
end;

procedure TForm8.BitBtn4Exit(Sender: TObject);
begin
 form_po.free;
end;

procedure TForm8.DBEdit17Exit(Sender: TObject);
begin
 if trim(dbedit17.Text) = '' then dbedit17.Field.Value := 0;
 if dbedit17.Field.Value >= 10 then
  begin
   messagedlg('优先级别只是输入0-9单个数字!',mtwarning,[mbok],0);
   dbedit17.SetFocus;
  end;
end;

procedure TForm8.BitBtn8Click(Sender: TObject);
begin
 try
  curr_form := Tcurr_form.Create(Application);
  if curr_form.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件的记录',mtinformation,[mbok],0);
    button2.SetFocus;
   end
  else
  IF curr_form.showmodal=mrok then
  begin
   edit7.Text:=curr_form.ADOQuery1.FieldValues['curr_code'];
   label70.Caption:=curr_form.ADOQuery1.FieldValues['curr_name'];
   Dm.ADOQuery4.FieldValues['CURRENCY_PTR'] :=curr_form.ADOQuery1rkey.Value;
   Dm.ADOQuery4.FieldValues['exch_rate'] :=curr_form.ADOQuery1exch_rate.Value;
  end
  else
   edit7.SetFocus;
 finally
  curr_form.free;
 end;

end;


function  tform8.note_number(number:integer):integer;
begin
 if number>=4 then
  note_number:=4
 else
  note_number:=number;
end;

procedure TForm8.BitBtn7Click(Sender: TObject);
begin
 try
  edit_note:=Tedit_note.Create(application);
  edit_note.Caption:='订单评审记事本: '+dbedit21.Text;
  edit_note.Memo1.Lines.Assign(po_note);
  if edit_note.ShowModal=mrok then
    po_note.Text:=edit_note.Memo1.Text;
 finally
  edit_note.free;
 end;
end;

procedure TForm8.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm8.Edit9Exit(Sender: TObject);
begin
if trim(edit9.Text)='' then edit9.Text:='0';
label6.Caption:=inttostr(strtoint(edit9.Text)-strtoint(label5.Caption));
end;

procedure TForm8.MaskEdit2Exit(Sender: TObject);
begin
try
 if strtodate(maskedit2.Text)<getsystem_date(DM.ADOQuery5,1)+shelf_life then
  IF messagedlg('计划装交期要求在产品生产周期之前,可能导致不能按时交货,继续否?',
   mtConfirmation,[mbyes,mbcancel],0)=mrcancel then
   maskedit2.SetFocus;
except
 messagedlg('计划的装运日期格式有误请仔细检查!',mtwarning,[mbok],0);
 maskedit2.SetFocus;
end;
end;

procedure TForm8.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if (gdFocused in State) then
 begin
  if (column.FieldName = DBComboBox1.DataField ) then
   begin
     DBComboBox1.Left := Rect.Left+1;
     DBComboBox1.Top := Rect.Top;
     DBComboBox1.Width := Rect.Right - Rect.Left+3;
     DBComboBox1.Height := Rect.Bottom - Rect.Top;
     self.get_value(dm.ado89parameter_ptr.Value);
     if dbcombobox1.Items.Count > 0 then
      DBComboBox1.Visible := True
     else
      DBComboBox1.Visible := false;
   end;
 end;

with TMyDBGrid(Sender) do
 begin
  if DataLink.ActiveRecord=Row-1 then
   begin
    Canvas.Font.Color:=clWhite;
    Canvas.Brush.Color:=$00800040;
   end
  else
   begin
    Canvas.Brush.Color:=Color;
    Canvas.Font.Color:=Font.Color;
   end;
  DefaultDrawColumnCell(Rect,DataCol,Column,State);
 end;

end;

procedure TForm8.DBGrid1ColExit(Sender: TObject);
begin
If DBGrid1.SelectedField.FieldName = DBComboBox1.DataField then
 DBComboBox1.Visible := false;
end;

procedure TForm8.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if (key <> chr(9)) then
 begin
  if (DBGrid1.SelectedField.FieldName =DBComboBox1.DataField) and
     (dbcombobox1.Items.Count > 0) then
   begin
    DBComboBox1.SetFocus;
    SendMessage(DBComboBox1.Handle,WM_Char,word(Key),0);
   end;
 end;
end;

procedure TForm8.get_data0089(rkey50:integer);
begin
  dm.ado89.DisableControls;
  dm.DataSource3.DataSet:=nil;
  dm.ado89.close;
  dm.ado89.Parameters[1].Value := rkey50;
  dm.ado89.Open;
  dm.ado278.Close;
  dm.ado278.Parameters[1].Value:=rkey50;
  dm.ado278.Open;
   if dm.ado89.IsEmpty then
    begin
     while not dm.ado278.Eof do
      begin
       dm.ado89.Append;
       dm.ado89CUST_PART_PTR.Value:=rkey50;
       dm.ado89parameter_ptr.Value:=dm.ado278parameter_ptr.Value;
       dm.ado89.Post;
       dm.ado278.Next;
      end;
     dm.ado278.Close;
     dm.ado89.First;
    end
   else
    begin
     while not dm.ado278.Eof do
      begin
       if not dm.ado89.Locate('parameter_ptr',dm.ado278PARAMETER_PTR.Value,[]) then
       begin
        dm.ado89.Append;
        dm.ado89CUST_PART_PTR.Value:=rkey50;
        dm.ado89parameter_ptr.Value:=dm.ado278parameter_ptr.Value;
        dm.ado89.Post;
       end;
       dm.ado278.Next;
      end;
     dm.ado278.Close;
     dm.ado89.First;
    end;
   dbgrid1.SelectedIndex:=3;
   dm.ado89.EnableControls;
   dm.DataSource3.DataSet:=dm.ado89;
end;

procedure TForm8.DBComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=112 then dbcombobox1.DroppedDown:=true;
if key=13 then dbgrid1.SetFocus;
end;

procedure TForm8.SpeedButton1Click(Sender: TObject);
begin
memo1.Text:=memo2.Text;
end;

procedure TForm8.DBEdit25KeyPress(Sender: TObject; var Key: Char);
begin
 if key = chr(46) then      //判断是否重复输入小数点'.'
 if pos('.',dbedit25.Text)>0  then abort;
end;

procedure TForm8.DBEdit12Exit(Sender: TObject);
begin
if maskedit1.Enabled= true then
 begin
 if trim(dbedit12.Text)='' then dbedit12.Field.Value := 0;
  dbedit13.Field.Value:=dbedit12.Field.Value*self.set_qty;
  dbedit13exit(sender);
 end;
end;

procedure TForm8.DBEdit25Exit(Sender: TObject);
begin
if maskedit1.Enabled= true then
 begin
if trim(dbedit25.Text)='' then dbedit25.Field.Value := 0;
 dbedit14.Field.Value := strtofloat(formatfloat('0.0000000',dbedit25.Field.Value / self.set_qty));
 dbedit13exit(sender);
end;
end;

procedure TForm8.BitBtn9Click(Sender: TObject);
var dcost:Double;
  i: Integer;
begin
    form12:=tform12.Create(application);
    form12.Aq85.Close;
    form12.Aq85.Parameters[0].Value:=trim(Label67.Caption);
//    form12.Aq85.Parameters[1].Value:=trim(Label67.Caption);
    form12.Aq85.Open;
        if form12.ShowModal=mrok then
         begin
              if (trim(form12.aq85ref_part_no.Value)<>'') and
                 (comparetext(trim(form12.aq85ref_part_no.Value),trim(Edit4.Text))<>0) then
              if messagedlg('报价单中本厂编号与销售订单中定义的不一致继续?',mtconfirmation,[mbyes,mbno],0)=mrno then
              begin
                    exit;
              end;


              if dm.ADOQuery4CURRENCY_PTR.Value <> form12.aq85CURR_PTR.Value then
              begin
                  messagedlg('报价单中定义的货币与销售订单中定义的货币不一致!',mterror,[mbcancel],0);
                  exit;
              end;

              with dm.ADOQuery5 do
              begin
                   close;
                   sql.Clear;
                   sql.Add('SELECT Data0253.RKEY');
                   sql.Add('FROM Data0028 INNER JOIN');
                   sql.Add('Data0253 ON Data0028.RKEY = Data0253.d0028_ptr ');
                   sql.Add('where Data0028.qte_price - Data0253.d0028_price > 0.01');
                   sql.Add('and data0253.quote_ptr='+form12.Aq85RKEY.AsString);
                   open;
              end;
              if not dm.ADOQuery5.IsEmpty then
                  showmessage('报价单价格有变动，请重新选择或是重新报价后输入！')
              else
              begin
                  if ((form12.aq85Quote_type.Value=1) and (not dbCheckBox1.Checked)) or
                      ((form12.aq85Quote_type.Value=0) and (dbCheckBox1.Checked)) then
                        showmessage('报价单与客户信息中定义的是否转厂数据不一致不能继续')
                  else
                  begin
                   //20170106tang添报价价格包括手工输入data008501里的单价之和
                      if form2.RadioGroup2.ItemIndex = 0 then  //不含税
                      begin
                        if (Trim(Form12.aq85V_tax.AsString)='') then
                          Edit3.Text:=form12.aq85quote_price.AsString
                        else
                          Edit3.Text:=Form12.aq85V_tax.AsString;
                      end else
                      begin
                        if (Trim(Form12.aq85V_tax.AsString)='') then
                          Edit3.Text:=form12.aq85quote_taxprice.AsString
                        else
                          Edit3.Text:=Form12.aq85V_tax.AsString;
                      end;
                   //end 20170106tang-----------
//                       dcost:=0;
//                       if dbRadioGroup3.ItemIndex = 0 then  //不含税
//                       begin
//                            if form12.aq85QTE_UNIT_PTR.Value=1 then   //以PCS报价
//                            begin
//                                dm.ADOQuery4PART_PRICE.Value := form12.aq85quote_price.Value;
//                            end else
//                            begin                                       //以SET报价
//                                dm.ADOQuery4PART_PRICE.AsString :=
//                                formatfloat('0.0000000',form12.aq85quote_price.Value/
//                                                               form12.aq85TUNITS.Value);
//                            end;
//                       end else
//                       begin                                     //价格含税
//                         if form12.aq85QTE_UNIT_PTR.Value=1 then
//                         begin
//                              dm.ADOQuery4PART_PRICE.Value := form12.aq85quote_taxprice.Value;
//                         end else
//                         begin
//                              dm.ADOQuery4PART_PRICE.AsString :=
//                                  formatfloat('0.0000000',form12.aq85quote_taxprice.Value/
//                                                                 form12.Aq85TUNITS.Value);
//                         end;
//                       end;
                       with dm.adoS578_85 do
                       begin
                              Close;
                              Parameters.ParamByName('rkey').Value:= form12.aq85RKEY.Value;
                              Open;
                       end;
                       dm.adoS578_85.First;
                       while not dm.adoS578_85.Eof do
                       begin
                            LabPrice.Tag:=0;
                            for i :=1 to StringGrid3.RowCount-2 do
                            begin
                               { if (StrToInt(StringGrid3.Cells[2,i])=dm.adoS578_85.FieldByName('d579_Ptr').AsInteger) then
                                begin }
                                    StringGrid3.Cells[1,i]:=FormatFloat('0.0000000',dm.adoS578_85.FieldValues['Price']);
                                    ShowMessage(dm.adoS578_85.FieldValues['Price'].asstring);
                                 //   break;
                               // end;
                            end;
                            dm.adoS578_85.Next;
                       end;
                      dbedit13exit(sender);
                      edit10.Text:=form12.Aq85TNUMBER.Value;
                      label_qteptr.Caption:=form12.Aq85RKEY.AsString;
                      //20170105tang注释关联报价不带费用
                      //form1.get_quotetools(form12.Aq85RKEY.Value,stringgrid1);
                  end;
              end;
              ContractInfo.ContractNo:= '';
              if checkRFQContractNo(DBEdit10.Text) then  //如果是RFQ合同,则清空
                dm.ADOQuery4FOB.Value:= '';
         end;
    form12.Free;
end;

procedure TForm8.SpeedButton2Click(Sender: TObject);
begin
 edit10.Text:='';
 label_qteptr.Caption:='0';
end;

procedure TForm8.BitBtn10Click(Sender: TObject);
begin
f_supp:=tf_supp.Create(application);
if f_supp.ADOQuery1.IsEmpty then
 showmessage('对不起,没有找到外发供应商类型!')
else
 if f_supp.ShowModal=mrok then
  begin
   edit11.Text:=f_supp.ADOQuery1code.Value;
   label85.Caption:=f_supp.ADOQuery1SUPPLIER_NAME.Value;
   dm.ADOQuery4.FieldValues['supplier_ptr']:=f_supp.ADOQuery1rkey.Value;
   Edit11.Tag:=f_supp.ADOQuery1rkey.Value;
   Label103.Caption:=F_supp.ADOQuery1TAX_2.AsString;
  end;
f_supp.free;
end;

procedure TForm8.DBRadioGroup1Click(Sender: TObject);
begin
if dbradiogroup1.ItemIndex=1 then
 begin
  bitbtn10.Enabled:=true;
 end
else
 begin
  bitbtn10.Enabled:=false;
  dm.ADOQuery4.FieldValues['supplier_ptr']:=null;
  edit11.Text:='';
  label85.Caption:='';
 end;
end;

procedure TForm8.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if dm.ADOConnection1.InTransaction then dm.ADOConnection1.RollbackTrans;
end;


procedure tform8.note_information(v_type:integer);
begin

with dm.ADOQuery5 do
 begin
  close;
  sql.Clear;
  sql.Add('select user_login_name as USER_ID,USER_FULL_NAME,TRANS_DATE,TRANS_DESCRIPTION, ');
  sql.Add('FROM_STRING,TO_STRING,file_number');
  sql.Add('from data0318 inner join data0073 on');
  sql.Add('data0318.user_ptr=data0073.rkey');
  sql.Add('where sales_ORDER_PTR='+inttostr(v_type));
  open;
 end;

while not dm.ADOQuery5.Eof do
 begin
  Memo4.Lines.Add(dm.ADOQuery5.fieldbyname('trans_date').AsString+
  ' 系统用户:'+dm.ADOQuery5.fieldbyname('user_id').AsString+' '+
  dm.ADOQuery5.fieldbyname('user_full_name').AsString+
  dm.ADOQuery5.fieldbyname('TRANS_DESCRIPTION').AsString);
  Memo4.Lines.Add(' 原值: '+dm.ADOQuery5.fieldbyname('from_string').AsString+
  ' 变更后: '+dm.ADOQuery5.fieldbyname('to_string').AsString+
  '   关联文件号:'+dm.ADOQuery5.fieldbyname('file_number').AsString);

  dm.ADOQuery5.Next;
 end;

end;

procedure  TForm8.get_value(rkey278:integer);
begin
  with dm.ADOQuery5 do
   begin
    close;
    sql.Clear;
    sql.Add('select tvalue from data0338 where parameter_ptr='+inttostr(rkey278));
    open;
   end;
  if not dm.adoquery5.IsEmpty then
   begin
    DBComboBox1.Items.Clear;
    while not dm.adoquery5.eof do
     begin
      DBComboBox1.Items.Add(trim(dm.adoquery5.FieldValues['tvalue']));
      dm.adoquery5.Next;
     end;
   end
  else
   DBComboBox1.Items.Clear;
end;

function TForm8.find_spec_rkey(spec_rkey: string): string;
begin
result:='0';
dm.ado89.DisableControls;
dm.ado89.First;
while not dm.ado89.Eof do
 begin
  if trim(dm.ado89SPEC_RKEY.Value)=spec_rkey then
   begin
    if trim(dm.ado89tvalue.Value)='' then
     result:='0'
    else
     result:=dm.ado89tvalue.Value;
    break;
   end
  else
   dm.ado89.Next;
 end;
dm.ado89.EnableControls;
end;

procedure TForm8.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if (gdSelected  in State) then
 begin
  if (ACol = 4) then
   begin
    ComboBox2.Left := Rect.Left;
    ComboBox2.Top := Rect.Top;
    ComboBox2.Width := Rect.Right - Rect.Left+3;
    ComboBox2.Height := Rect.Bottom - Rect.Top;
    ComboBox2.Visible := True;
    combobox2.ItemIndex:=combobox2.Items.IndexOf(StringGrid1.Cells[acol,arow])
   end
  else
    ComboBox2.Visible :=false;
 end;
end;

procedure TForm8.ComboBox2Change(Sender: TObject);
begin
 stringgrid1.Cells[4,stringgrid1.Row]:=combobox2.Text;
end;

procedure TForm8.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then stringgrid1.SetFocus;
end;

procedure TForm8.BitBtn11Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
try
 InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,WAREHOUSE_NAME/客户名称/277,ABBR_NAME/工厂简称/100';
 InputVar.Sqlstr := 'select RKEY,WAREHOUSE_CODE,WAREHOUSE_NAME,ABBR_NAME from data0015';
 InputVar.AdoConn := DM.ADOConnection1 ;
 frmPick_Item_Single.InitForm_New(InputVar)  ;
if frmPick_Item_Single.ShowModal=mrok then
 begin
  dm.ADOQuery4SHIP_REG_TAX_ID.Value := frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsInteger;
  edit2.Text := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE'];
  Label52.Caption := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_NAME'];
 end;
finally
 frmPick_Item_Single.adsPick.Close;
 frmPick_Item_Single.Free ;
end;
end;

procedure TForm8.Edit2Exit(Sender: TObject);
begin
if trim(edit2.Text)='' then
 begin
  label52.Caption:='';
 end
else
 if (activecontrol.Name<>'BitBtn11') and (activecontrol.Name<>'Button2') then
 begin
  with dm.ADOQuery5 do
  begin
   close;
   sql.Text:=
    'SELECT data0015.rkey,dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.WAREHOUSE_NAME,'+#13+
    'data0015.abbr_name FROM dbo.Data0015'+#13+
     'where WAREHOUSE_CODE='+quotedstr(trim(edit2.Text));
   open;
   if isempty then
    begin
     messagedlg('工厂代码输入错误!',mterror,[mbcancel],0);
     edit2.SetFocus;
    end
   else
    begin
     dm.ADOQuery4SHIP_REG_TAX_ID.Value:=fieldbyname('RKEY').Value;
     label52.Caption:=fieldbyname('WAREHOUSE_NAME').AsString;
    end;
   close; 
  end;
 end;
end;

procedure TForm8.BitBtn12Click(Sender: TObject);
begin
 try
  form7 := Tform7.Create(application);
  form7.Caption:='预收款查询:'+edit3.Text;
  form7.Memo1.ReadOnly:=true;
 with dm.ADOQuery5 do
  begin
   close;
   sql.Text:=
    'SELECT dbo.Data0005.EMPLOYEE_NAME, dbo.Data0114.ENTER_DATE,'+#13+
    'dbo.Data0114.AMOUNT * dbo.Data0114.EXCHANGE_RATE AS amount, dbo.Data0114.all_shipqty'+#13+
    'FROM         dbo.Data0114 INNER JOIN'+#13+
    '                      dbo.Data0005 ON dbo.Data0114.EMPL_PTR = dbo.Data0005.RKEY'+#13+
    'WHERE     (dbo.Data0114.all_shipqty >= 0) AND (dbo.Data0114.TTYPE = 2)'+#13+
    'and data0114.PO_NUMBER='+quotedstr(edit6.Text)+#13+
    'and Data0114.MANU_PART_NUMBER='+quotedstr(edit4.Text);
   open;
   if not IsEmpty then
     form7.Memo1.Lines.Add('员工  :  输入日期  :  预收金额 :  可出货数量');
   while not eof do
    begin
    form7.Memo1.Lines.Add(fieldbyname('EMPLOYEE_NAME').AsString+':   '+
                       fieldbyname('ENTER_DATE').AsString+':   '+
                       fieldbyname('amount').AsString+':   '+
                       fieldbyname('all_shipqty').AsString);
     next;
    end;
  end;

 with dm.ADOQuery5 do
  begin
   close;
   sql.Text:='SELECT dbo.Data0060.SALES_ORDER, dbo.Data0005.EMPLOYEE_NAME,'+#13+
    ' dbo.Data0064.DATE_ASSIGN, dbo.Data0064.QUAN_SHIPPED'+#13+
    ' FROM   dbo.Data0005 INNER JOIN'+#13+
    ' dbo.Data0064 ON dbo.Data0005.RKEY = dbo.Data0064.ENT_EMPL_PTR INNER JOIN'+#13+
    ' dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY'+#13+
    ' WHERE   (dbo.Data0064.assign_type = 0)'+#13+
    'and Data0060.CUST_PART_PTR='+dm.ADOQuery4CUST_PART_PTR.AsString+#13+
    'and Data0060.PURCHASE_ORDER_PTR='+dm.ADOQuery4PURCHASE_ORDER_PTR.AsString;
   open;
   if not IsEmpty then
     form7.Memo1.Lines.Add('销售订单:          员工  :      指派日期  :   出货数量');
   while not eof do
    begin
    form7.Memo1.Lines.Add(fieldbyname('SALES_ORDER').AsString+': '+
                       fieldbyname('EMPLOYEE_NAME').AsString+':  '+
                       fieldbyname('DATE_ASSIGN').AsString+':   '+
                       fieldbyname('QUAN_SHIPPED').AsString);
     next;
    end;
  end;

  if form7.ShowModal=mrok then
   begin

   end;
 finally
  form7.free;
 end;
end;

procedure TForm8.MaskEdit4Exit(Sender: TObject);
begin
try
{ if strtodate(maskedit4.Text)<getsystem_date(DM.ADOQuery5,1)+shelf_life then
  IF messagedlg('原始客户交期要求在产品生产周期之前,可能导致不能按时交货,继续否?',
   mtConfirmation,[mbyes,mbcancel],0)=mrcancel then
   maskedit4.SetFocus;
}
strtodate(maskedit4.Text);
except
 messagedlg('日期格式有误请仔细检查!',mtwarning,[mbok],0);
 maskedit4.SetFocus;
end;
end;

procedure TForm8.btnFindContractClick(Sender: TObject);
var
  i: Byte;
begin
  Application.CreateForm(TfrmFindContract, frmFindContract);
  try
    with dm.aqFindContract do
    begin
      Close;
      Parameters.Items[0].Value:= Edit4.Text;
      Open;
    end;
    if frmFindContract.ShowModal = mrok then
    begin
      with ContractInfo do
      begin
        ContractNo:= dm.aqFindContract.FieldValues['ContractNo'];
        Qnty:= dm.aqFindContract.FieldValues['Qnty'];
        EngAmount:= dm.aqFindContract.FieldValues['EngAmount'];
        TestAmount:= dm.aqFindContract.FieldValues['TestAmount'];
        AftDiscountAmount:= dm.aqFindContract.FieldValues['AftDiscountAmount'];
      end;
      dm.ADOQuery4FOB.Value:= ContractInfo.ContractNo;
      dm.ADOQuery4PARTS_ORDERED.Value:= ContractInfo.Qnty;
      if DBRadioGroup3.ItemIndex = 0 then  //不含税
        dm.ADOQuery4PART_PRICE.Value:= StrToFloat(formatfloat('0.0000000',
                    ((ContractInfo.AftDiscountAmount-ContractInfo.EngAmount-ContractInfo.TestAmount)
                    /(1+StrToFloat(DBEdit15.text)*0.01))/ContractInfo.Qnty))
      else                                     //含税
        dm.ADOQuery4PART_PRICE.Value:= StrToFloat(formatfloat('0.0000000',
                    (ContractInfo.AftDiscountAmount-ContractInfo.EngAmount-ContractInfo.TestAmount)
                    /ContractInfo.Qnty));

      for i:= 0 to stringgrid1.RowCount-1 do
      begin
        if stringgrid1.Cells[0,i]= '工程费' then stringgrid1.Cells[1,i]:= formatfloat('0.0000',ContractInfo.EngAmount/(1+StrToFloat(DBEdit15.text)*0.01));
        if stringgrid1.Cells[0,i]= '测试架费' then stringgrid1.Cells[1,i]:= formatfloat('0.0000',ContractInfo.TestAmount/(1+StrToFloat(DBEdit15.text)*0.01));
      end;
    end;
    dbedit13exit(sender);
    TabSheet5Exit(sender);
  finally
    frmFindContract.Free;
  end;
end;

function TForm8.checkRFQContractNo(ContractNo: string): Boolean;
begin
  with dm.aqTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select ContractNo from data0167 where ContractNo = :ContractNo ');
    Parameters[0].Value:= ContractNo;
    Open;
  end;
  if dm.aqTmp.RecordCount = 0 then
    Result:= False
  else
    Result:= True;
end;

function TForm8.cacl_deficiency(rkey10: integer; nowAmount: currency): currency;
var
  V_defi:currency;
begin
  with dm.ADOQuery5 do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM((INVOICE_TOTAL - amount_paid - CASH_DISC)*EXCHANGE_RATE)');
    sql.Add('AS total_amount FROM dbo.Data0112');
    sql.Add('where customer_ptr='+inttostr(rkey10));
    sql.Add('and invoice_status=1');
    sql.Add('group by customer_ptr');
    open;
    v_defi:= FieldByName('total_amount').AsCurrency;
  end;  //计算用户所开出发票的所欠金额

  with dm.ADOQuery5 do
  begin
    close;
    sql.Clear;
    sql.Add('select Sum(t60.PARTS_ALLOC*t64.QUAN_SHIPPED*(1+t60.RUSH_CHARGE*0.01)/t60.EXCH_RATE) as total_amount');
    sql.Add('from data0064 t64, data0060 t60, data0439 t439');
    sql.Add('where t64.SO_PTR = t60.RKEY');
    sql.Add('and t64.packing_list_ptr = t439.RKEY');
    sql.Add('and t439.invoice_ptr is null');
    sql.Add('and t60.STATUS in (1,2,4)');
    sql.Add('and t60.CUSTOMER_PTR = '+inttostr(rkey10));
    open;
    v_defi:= v_defi+FieldByName('total_amount').AsCurrency;
  end;  //已指派未生成账龄 Add

  with dm.ADOQuery5 do
  begin
    close;
    sql.Clear;
    sql.Add('select Sum(t60.PARTS_ALLOC*(t60.PARTS_ORDERED-t60.PARTS_SHIPPED)*(1+t60.RUSH_CHARGE*0.01)/t60.EXCH_RATE)');
    sql.Add('as total_amount from data0060 t60');
    //sql.Add('where not exists(select 1 from data0064 t64 where t64.SO_PTR = t60.RKEY)');
    sql.Add('Where t60.STATUS in (1,2,4,6)');
    sql.Add('and t60.CUSTOMER_PTR = '+inttostr(rkey10));
    open;
    v_defi:= v_defi+FieldByName('total_amount').AsCurrency;
  end;  //未指派 Add

  with dm.ADOQuery5 do
  begin
    close;
    sql.Clear;
    sql.Add('select Sum((TOTAL_ADD_L_PRICE-INVD_ADD_L_PRICE)*(1+RUSH_CHARGE*0.01)/EXCH_RATE)');
    sql.Add('as total_amount from data0060');
    sql.Add('Where STATUS in (1,2,4,6)');
    sql.Add('and TOTAL_ADD_L_PRICE <> 0');
    sql.Add('and INVD_ADD_L_PRICE = 0');
    sql.Add('and CUSTOMER_PTR = '+inttostr(rkey10));
    open;
    v_defi:= v_defi+FieldByName('total_amount').AsCurrency;
  end;  //工具费用 Add

  with dm.ADOQuery5 do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT SUM(AVL_AMT * EX_RATE)');
    sql.Add('AS total_amount FROM dbo.Data0116');
    sql.Add('where CUST_PTR='+inttostr(rkey10));
    sql.Add('and memo_status=1');
    sql.Add('group by CUST_PTR');
    open;
    v_defi:= v_defi-FieldByName('total_amount').AsCurrency;
  end;  //计算用户贷项备忘

  with dm.ADOQuery5 do
  begin
    close;
    sql.Clear;
    sql.Add('select Sum(t60.PARTS_ALLOC*t98.QTY_RECD*(1+t60.RUSH_CHARGE*0.01)/t60.EXCH_RATE)');
    sql.Add('as total_amount from data0098 t98, data0060 t60');
    sql.Add('where t98.SO_PTR = t60.RKEY');
    sql.Add('and t98.srce_ptr is null');
    sql.Add('and t98.CUSTOMER_PTR = '+inttostr(rkey10));
    open;
    v_defi:= v_defi-FieldByName('total_amount').AsCurrency;
  end;  //已退货未生成贷项备忘 Add

  result:= v_defi + nowAmount;  //本订单总额Add
end;

procedure TForm8.DBEdit10Change(Sender: TObject);
begin
  if checkRFQContractNo(DBEdit10.Text) then
    DBEdit10.Enabled:= False
  else
    DBEdit10.Enabled:= True;
end;

procedure TForm8.BitBtn13Click(Sender: TObject);
begin
 Application.CreateForm(TForm_FindBook, Form_FindBook);
  try
    with Form_FindBook.ADS213 do
    begin
      Close;
      Parameters.Items[0].Value:= form8.Edit4.Text;
      Parameters.Items[1].Value:= Form8.Edit6.Text;
      Open;
    end;
    if Form_FindBook.ShowModal = mrok then
    begin
      rkey213_new:=Form_FindBook.ADS213RKEY.Value;
      DBEdit13.Text:=Form_FindBook.ADS213PARTS_ORDERED.AsString;//数量
      DBEdit13.ReadOnly:=True;
      MaskEdit4.Text:=Form_FindBook.ADS213ORIG_REQUEST_DATE.AsString;
      MaskEdit1.Text:=Form_FindBook.ADS213ORIG_SCHED_SHIP_DATE.AsString;
      if DBRadioGroup3.ItemIndex = 0 then  //不含税
      begin
       if StrToFloat(DBEdit15.Text)>0 then
       DBEdit14.Text:= formatfloat('0.0000000',Form_FindBook.ADS213PART_PRICE.Value/(1+strtofloat(DBEdit15.Text)*0.001))
       else
       DBEdit14.Text:= formatfloat('0.0000000',Form_FindBook.ADS213PART_PRICE.Value);
      end
      else
      begin                                           //含税
       DBEdit14.Text:= formatfloat('0.0000000',Form_FindBook.ADS213PART_PRICE.Value);
      end;
    end;
  finally
    Form_FindBook.Free;
  end;
end;

procedure TForm8.Edit4Change(Sender: TObject);
begin
  with dm.ADOQuery5 do
  begin
    close;
    sql.Clear;
    sql.Add('select ORIG_CUSTOMER from data0025 where MANU_PART_NUMBER='''+edit4.Text+'''');
    open;
  end;
  Label102.Caption:= '关联原客户： '+dm.ADOQuery5.FieldByName('ORIG_CUSTOMER').AsString;
end;

procedure TForm8.StringGrid3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var dSum,dValue:Double;
    i:Integer;
begin
  dSum:=0;
  for i :=1  to StringGrid3.RowCount-2 do
  begin
    if TryStrToFloat(StringGrid3.Cells[1,i],dValue) then
    dSum:=dSum+StrToFloat(formatfloat('0.0000000',dValue));
  end;
  StringGrid3.Cells[1,StringGrid3.RowCount-1]:=formatfloat('0.0000000',dSum);
end;

procedure TForm8.BitBtn14Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'CUST_CODE/客户代码/100,CUSTOMER_NAME/客户名称/277,ABBR_NAME/客户简称/100';
    InputVar.Sqlstr := 'select CUST_CODE,CUSTOMER_NAME,ABBR_NAME from Data0010 where CUSTOMER_TYPE<>4';
    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit17.Text := frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME'];
      Edit17.Font.Color:=clwindowtext;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TForm8.Edit17Click(Sender: TObject);
begin
   Edit17.SelectAll;
end;

procedure TForm8.Edit17DblClick(Sender: TObject);
begin
  Edit17.Text:='';
end;

procedure TForm8.Edit17Exit(Sender: TObject);
begin
  if (Trim(Edit17.Text)<>'') then
  begin
    //20170322tang添关联原客户可选择
    with dm.ADOQuery5 do
    begin
      close;
      sql.Clear;
      sql.Add('select ABBR_NAME from data0010 where ABBR_NAME like ''%'+Trim(Edit17.Text)+'%'' and CUSTOMER_TYPE<>4');
      open;
    end;
    if dm.ADOQuery5.IsEmpty then
    begin
      ShowMessage('找不到该客户简称或是已被设置成无效。');
      Edit17.SetFocus;
      Exit;
    end;
    //end20170322tang
  end;
end;

end.
