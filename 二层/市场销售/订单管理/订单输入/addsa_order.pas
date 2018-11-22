unit addsa_order;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Mask, Grids, Menus, DBGrids,
   ActnList, DBCtrls, DB, ADODB, ExtCtrls, DBGridEh;

type
  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    ComboBox1: TComboBox;
    MaskEdit1: TMaskEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Label22: TLabel;
    Label23: TLabel;
    Edit7: TEdit;
    Edit13: TEdit;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label24: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    lab_rkey10: TLabel;
    lab_rkey50: TLabel;
    Lab_rkey97: TLabel;
    Lab_rkey12: TLabel;
    Lab_rkey01: TLabel;
    Label36: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    StringGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    add_sin: TMenuItem;
    add_mul: TMenuItem;
    N3: TMenuItem;
    edit_so: TMenuItem;
    del_so: TMenuItem;
    Label44: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    so_note: TMenuItem;
    conf_note: TMenuItem;
    ship_note: TMenuItem;
    TabSheet4: TTabSheet;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    Label51: TLabel;
    BitBtn9: TBitBtn;
    Edit14: TEdit;
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    DBComboBox1: TDBComboBox;
    Label37: TLabel;
    Memo2: TMemo;
    Label52: TLabel;
    SpeedButton2: TSpeedButton;
    Edit15: TEdit;
    Label53: TLabel;
    Edit16: TEdit;
    Label54: TLabel;
    BitBtn10: TBitBtn;
    Label55: TLabel;
    RadioGroup1: TRadioGroup;
    Label56: TLabel;
    ComboBox2: TComboBox;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    ComboBox3: TComboBox;
    CheckBox1: TCheckBox;
    RadioGroup2: TRadioGroup;
    Label25: TLabel;
    Label45: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label13: TLabel;
    Label64: TLabel;
    Edit5: TEdit;
    BitBtn11: TBitBtn;
    lab_rkey15: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    BitBtn12: TBitBtn;
    Label67: TLabel;
    lblywy: TLabel;
    Label68: TLabel;
    Lab283: TLabel;
    Edit17: TEdit;
    BitBtn13: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Edit18: TEdit;
    BitBtn14: TBitBtn;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Edit10Exit(Sender: TObject);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure Edit9Exit(Sender: TObject);
    procedure add_sinClick(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit9Click(Sender: TObject);
    procedure edit_soClick(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure save_so();
    procedure save_so2();
    //procedure get_repname();
    procedure get_data0089(rkey50:integer);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure del_soClick(Sender: TObject);
   // procedure BitBtn2Click(Sender: TObject);
    procedure add_mulClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure so_noteClick(Sender: TObject);
   // procedure conf_noteClick(Sender: TObject);
    procedure ship_noteClick(Sender: TObject);
    function find_soerror():boolean;
    function find_parterror(rkey25:integer):boolean;
    function find_socongfu(rkey97,rkey50:integer;org_sch_date:string;PCSQTY:string):boolean;
    function find_spec_rkey(spec_rkey:string): string;
    procedure MaskEdit1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn9Click(Sender: TObject);
    procedure Edit14KeyPress(Sender: TObject; var Key: Char);
    procedure Edit14Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Edit15Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn10Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure  get_value(rkey278:integer);
    procedure Tab(Sender: TObject; var Key: Word;
     Shift: TShiftState);
    procedure BitBtn11Click(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit3Enter(Sender: TObject);
    procedure conf_noteClick(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure Edit17Exit(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
   // procedure conf_noteClick(Sender: TObject);
  private
    { Private declarations }
    sales_note,po_note:tstringlist; //评审记事本,销售订单记事本
    rkey25,rkey23:integer;
    ywy,FCust,AllVersion:string;
    tax_2:Currency;
    function quote_vflag(rkey25,ttype:integer):boolean;
    function getSO_OLDNEW(rkey25:integer):byte;
    function custinvoice_day(cust_ptr: integer;var invoice_number:string): boolean;
    function find_QUOTE_FACTOR1(cust_ptr: integer):boolean;
    function find_allqty_so(cust_ptr:integer;var sales_order:string):boolean;
    procedure findOldVersion(rkey25: string);
    function CheckCustCreditAmount:boolean;//检验客户信用额度
  public
    { Public declarations }
   credit_rating,v_part_num: byte; //量板,样板
   credit_limit,unit_sq,set_length,set_width: double;
   prod_rkey,shelf_life,set_qty: integer;
   quote_flag,customer_quote:boolean; //产品是否与报价单关联
   tax:string;
   OldGridWnd : TWndMethod;
   if213:Integer;//是否预处理选0本厂1预处理
   procedure NewGridWnd (var Message : TMessage);
   procedure form3init;
   function checkRFQContractNo(ContractNo: string):Boolean;
   procedure edit04;
  end;

type
 TMyDBGrid=class(TDBGrid);

var
  Form2: TForm2;
//  po_note:tstringlist;
implementation

uses damo,main, cust_search, part_search, purchase_search, shipmethod,
  address_search, append_so, note, multi_so, conf_note, curr_search,
  waif_supp,COMMON,Pick_Item_Single,ConstVar, AllOldVersion, FindBook,
  AllBook, PasShowStock;

{$R *.dfm}

procedure tform2.form3init;
begin
  form3:=tform3.Create(application);
  dm.AQ04.Close;
  dm.AQ04.Open;
  form3.MaskEdit2.Text := datetostr(getsystem_date(DM.ADOQuery5,1)+self.shelf_life); //计划装运
  form3.maskedit1.Text := datetostr(strtodate(form3.maskedit2.text)+strtoint(label49.caption));
  form3.MaskEdit3.Text :=form3.maskedit1.Text;
 if not quote_flag then       //不与报价单关联
  begin
   form3.edit3.Text := form3.label35.Caption;      //价格pcs
   form3.Edit18.Text:=formatfloat('0.00000000',strtofloat(form3.edit3.Text)*self.set_qty);  //价格set
  end;
//  get_repname();//得到销售代表及拥金比例
//------------------------------------------------------------------------------
  if trim(lab_rkey97.Caption) = '' then//如果本次销售定单为新开客户采购号
   begin
//   ShowMessage(dm.AQ04.FieldValues['seed_value']);                              //so从data0004中取值
    form3.edit1.text := trim(dm.AQ04.FieldValues['seed_value']);
    label50.Caption:='1';
    v_row := stringgrid1.RowCount-1;
    if v_row<10 then
     form3.edit1.text := form3.edit1.text+'-0'+inttostr(v_row)
    else
     form3.edit1.text := form3.edit1.text+'-'+inttostr(v_row);
   end
  else             //如果本次采购号为原来的老采购号
   begin
    with dm.ADOQuery3 do
    begin
     active:=false;
     sql.Clear;
     sql.Add('select sales_order,part_price from data0060');
     sql.Add('where cust_part_ptr='+lab_rkey50.Caption);
     sql.Add('and purchase_order_ptr='+lab_rkey97.Caption);
     sql.Add('order by sales_order');
     active:=true;
     if not IsEmpty then        //如果同一采购号同一部品以前卖过so从自身取值
     begin                     //上一次采购订单/部件价格
      Last;                     //得到最新so
      form3.Label36.Caption := formatfloat('0.00000',fieldvalues['part_price']);
//      form3.edit1.text:=copy(fieldvalues['sales_order'],1,pos('-',fieldvalues['sales_order'])-1);
      form3.edit1.text := trim(dm.AQ04.FieldValues['seed_value']);
      if stringgrid1.RowCount<=2 then   //开始单条新增
       begin
//        v_row := strtoint(trim(copy(fieldvalues['sales_order'],pos('-',fieldvalues['sales_order'])+1,2)))+1;
        v_row :=stringgrid1.RowCount-1;
        if v_row<10 then
         form3.edit1.text:=form3.edit1.text+'-0'+inttostr(v_row)
        else
         form3.edit1.text:=form3.edit1.text+'-'+inttostr(v_row);
       end
      else     //在原来已经新增的基础上新增
       begin
        v_row := strtoint(trim(copy(stringgrid1.Cells[0,stringgrid1.rowcount-2],
        pos('-',stringgrid1.Cells[0,stringgrid1.rowcount-2])+1,2)))+1;
        if v_row<10 then
         form3.edit1.text:=form3.edit1.text+'-0'+inttostr(v_row)
        else
         form3.edit1.text:=form3.edit1.text+'-'+inttostr(v_row);
       end;
     end
    else      //如果同一采购号同一部品以前没有卖过so也从data0004中取值
     begin
      form3.edit1.text := trim(dm.AQ04.FieldValues['seed_value']);
      label50.Caption:='1';
      v_row := stringgrid1.RowCount-1;
       if v_row<10 then
        form3.edit1.text:=form3.edit1.text+'-0'+inttostr(v_row)
       else
        form3.edit1.text:=form3.edit1.text+'-'+inttostr(v_row)
     end;
    end;
   end;
end;

function TForm2.custinvoice_day(cust_ptr: integer;var invoice_number:string): boolean;
var
 max_days:integer;
begin
with dm.ADOQuery5 do
 begin
  close;
  sql.Text:='select INVOICE_NOTE_PAD_PTR from data0010'+
           ' where rkey='+inttostr(cust_ptr);
  open;
  max_days:=fieldbyname('INVOICE_NOTE_PAD_PTR').AsInteger;
 end;

with dm.ADOQuery5 do
 begin
  close;
  sql.Clear;
  sql.Add('SELECT invoice_number,max(DATEDIFF(day,DUE_DATE,GETDATE())) AS days');
  sql.Add('FROM dbo.Data0112');
  sql.Add('where INVOICE_STATUS=1');
  SQL.add('and INVOICE_TOTAL > 0');
  sql.Add('and CUSTOMER_PTR='+inttostr(cust_ptr));
  sql.Add('group by invoice_number');
  sql.Add('ORDER BY MAX(DATEDIFF(day, due_date, GETDATE())) DESC');
  open;
  if not isempty then invoice_number:=fieldvalues['invoice_number'];
 end;
 if dm.ADOQuery5.FieldValues['days']=null then
  custinvoice_day:=false
 else
  if dm.ADOQuery5.FieldValues['days'] > max_days then
   custinvoice_day:=true
  else
   custinvoice_day:=false;
end;

function TForm2.getSO_OLDNEW(rkey25: integer): byte;
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

function TForm2.quote_vflag(rkey25, ttype: integer): boolean;
begin               //返回产品是否报价单关联
with dm.adoquery5 do
begin
 close;
 sql.Text:='SELECT Data0008.batch_flag, Data0008.former_flag'+#13+
      'FROM Data0008 INNER JOIN'+#13+
      'Data0025 ON dbo.Data0008.RKEY = dbo.Data0025.PROD_CODE_PTR'+#13+
      'WHERE Data0025.rkey='+inttostr(rkey25);
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

procedure TForm2.NewGridWnd(var Message: TMessage);
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

procedure Tform2.save_so();      //stringgri1第9,21列无效了
begin
 if trim(form3.Edit10.Text)<>'' then
  begin
   stringgrid1.Cells[1,stringgrid1.RowCount-1]:=form3.edit10.Text; //报价单号
   stringgrid1.Cells[13,stringgrid1.RowCount-1]:=form3.Label_qteptr.Caption; //报价单指针
  end;
 stringgrid1.Cells[2,stringgrid1.RowCount-1]:=form3.edit2.Text; //订单数量pcs
 stringgrid1.Cells[3,stringgrid1.RowCount-1]:=form3.edit3.Text; //订单价格pcs
 stringgrid1.Cells[4,stringgrid1.RowCount-1]:=form3.edit9.Text;  //订单参考
 stringgrid1.Cells[5,stringgrid1.RowCount-1]:=form3.edit5.Text;   //折扣
 //20161114tang修改优先从283取
 stringgrid1.Cells[6,stringgrid1.RowCount-1]:=form3.combobox2.Text;  //优先顺序
 stringgrid1.Cells[7,stringgrid1.RowCount-1]:=form3.maskedit1.Text;//客户交期
 stringgrid1.Cells[8,stringgrid1.RowCount-1]:=form3.maskedit2.Text;//计划交期

 stringgrid1.Cells[10,stringgrid1.RowCount-1]:= form3.maskedit3.Text;//客户原始交期
 stringgrid1.Cells[11,stringgrid1.RowCount-1]:=form3.edit4.Text;      //分析代码4
 stringgrid1.Cells[12,stringgrid1.RowCount-1]:=form3.edit7.Text;      //分析代码5
 {if form3.CheckBox1.Checked then                                 //预测耗费
  stringgrid1.Cells[10,stringgrid1.RowCount-1]:='1'
 else
  stringgrid1.Cells[10,stringgrid1.RowCount-1]:='0';
  stringgrid1.Cells[11,stringgrid1.RowCount-1]:=form3.edit7.Text;      //向前向后天数
  stringgrid1.Cells[12,stringgrid1.RowCount-1]:=form3.edit8.Text;
}
  stringgrid1.Cells[14,stringgrid1.RowCount-1]:=form3.edit11.text;     //分析代码1,2,3
  stringgrid1.Cells[15,stringgrid1.RowCount-1]:=form3.edit12.text;
  stringgrid1.Cells[16,stringgrid1.RowCount-1]:=form3.edit13.text;
  stringgrid1.Cells[17,stringgrid1.RowCount-1]:=form3.edit16.text;     //订单数量(set)
  stringgrid1.Cells[18,stringgrid1.RowCount-1]:=form3.edit18.text;     //订单价格(set)
  stringgrid1.Cells[19,stringgrid1.RowCount-1]:=form3.Label33.Caption; //工具费用
   //下面为不存入数据库的值
 stringgrid1.Cells[20,stringgrid1.RowCount-1]:=form3.Label30.Caption; //价格合计
 stringgrid1.Cells[21,stringgrid1.RowCount-1]:=form3.Label16.Caption; //税金
 stringgrid1.Cells[9,stringgrid1.RowCount-1]:=form3.Label31.Caption; //工具税金
 stringgrid1.Cells[22,stringgrid1.RowCount-1]:=form3.Label32.Caption; //折扣
 stringgrid1.Cells[23,stringgrid1.RowCount-1]:=form3.Label34.Caption; //总合计
 stringgrid1.Cells[24,stringgrid1.RowCount-1]:=form3.Label41.Caption; //面积
 if Form3.rkey213>0 then
 begin
  StringGrid1.Cells[25,StringGrid1.RowCount-1]:=IntToStr(Form3.rkey213);
//20161018tang修改
  StringGrid1.Cells[28,StringGrid1.RowCount-1]:=IntToStr(Form3.Edit2.Tag);//预处理已使用数量
  StringGrid1.Cells[29,StringGrid1.RowCount-1]:=IntToStr(Form3.BitBtn1.Tag);// 预处理数量
//end20161018
 end else
  StringGrid1.Cells[25,StringGrid1.RowCount-1]:='0';

  StringGrid1.Cells[26,StringGrid1.RowCount-1]:= Form3.FBp06_ptr;   //bom报价关联
  StringGrid1.Cells[27,StringGrid1.RowCount-1]:= Form3.FBomBuHanShuiJiaGe;   //bom不含税价格

   //下面为显示在本页的所有so合计内容
 label44.Caption:=formatfloat
 ('0.0000',strtofloat(label44.Caption)+strtofloat(stringgrid1.Cells[20,stringgrid1.RowCount-1]));
 label61.Caption:=formatfloat
 ('0.000',strtofloat(label61.Caption)+strtofloat(stringgrid1.Cells[21,stringgrid1.RowCount-1]));
 label46.Caption:=formatfloat
 ('0.000',strtofloat(label46.Caption)+strtofloat(stringgrid1.Cells[22,stringgrid1.RowCount-1]));
 label47.Caption:=formatfloat
 ('0.0000',strtofloat(label47.Caption)+strtofloat(stringgrid1.Cells[19,stringgrid1.RowCount-1]));
 label63.Caption:=formatfloat
 ('0.0000',strtofloat(label63.Caption)+strtofloat(stringgrid1.Cells[9,stringgrid1.RowCount-1]));
 label48.Caption:=formatfloat
 ('0.0000',strtofloat(label48.Caption)+strtofloat(stringgrid1.Cells[23,stringgrid1.RowCount-1]));
 label60.Caption:=formatfloat
 ('0.0000',strtofloat(label60.Caption)+strtofloat(stringgrid1.Cells[24,stringgrid1.RowCount-1]));
end;

procedure Tform2.save_so2();
begin
 stringgrid1.Cells[1,stringgrid1.RowCount-1]:=stringgrid1.Cells[1,stringgrid1.RowCount-2]; //报价单号
 stringgrid1.Cells[13,stringgrid1.RowCount-1]:=stringgrid1.Cells[13,stringgrid1.RowCount-2]; //报价单指针
 stringgrid1.Cells[2,stringgrid1.RowCount-1]:=form3.edit2.Text; //订单数量pcs
 stringgrid1.Cells[3,stringgrid1.RowCount-1]:=stringgrid1.Cells[3,stringgrid1.RowCount-2]; //订单价格pcs
 stringgrid1.Cells[4,stringgrid1.RowCount-1]:=form3.edit9.Text;  //订单参考
 stringgrid1.Cells[5,stringgrid1.RowCount-1]:=form3.edit5.Text;   //折扣
 //20161114tang修改优先从283取
 stringgrid1.Cells[6,stringgrid1.RowCount-1]:=form3.combobox2.Text;  //优先顺序
 stringgrid1.Cells[7,stringgrid1.RowCount-1]:=form3.maskedit1.Text;//客户交期
 stringgrid1.Cells[8,stringgrid1.RowCount-1]:=form3.maskedit2.Text;//计划交期

 stringgrid1.Cells[10,stringgrid1.RowCount-1]:= form3.maskedit3.Text; //客户原始交期
 stringgrid1.Cells[11,stringgrid1.RowCount-1]:=form3.edit4.Text;      //分析代码4
 stringgrid1.Cells[12,stringgrid1.RowCount-1]:=form3.edit7.Text;      //分析代码5
 {if form3.CheckBox1.Checked then                                 //预测耗费
  stringgrid1.Cells[10,stringgrid1.RowCount-1]:='1'
 else
  stringgrid1.Cells[10,stringgrid1.RowCount-1]:='0';
  stringgrid1.Cells[11,stringgrid1.RowCount-1]:=form3.edit7.Text;      //向前向后天数
  stringgrid1.Cells[12,stringgrid1.RowCount-1]:=form3.edit8.Text;
}
  stringgrid1.Cells[14,stringgrid1.RowCount-1]:=form3.edit11.text;     //分析代码1,2,3
  stringgrid1.Cells[15,stringgrid1.RowCount-1]:=form3.edit12.text;
  stringgrid1.Cells[16,stringgrid1.RowCount-1]:=form3.edit13.text;
  stringgrid1.Cells[17,stringgrid1.RowCount-1]:=form3.edit16.text;     //订单数量(set)
  stringgrid1.Cells[18,stringgrid1.RowCount-1]:=form3.edit18.text;     //订单价格(set)
  stringgrid1.Cells[19,stringgrid1.RowCount-1]:=form3.Label33.Caption; //工具费用
   //下面为不存入数据库的值
 stringgrid1.Cells[20,stringgrid1.RowCount-1]:=form3.Label30.Caption; //价格合计
 stringgrid1.Cells[21,stringgrid1.RowCount-1]:=form3.Label16.Caption; //税金
 stringgrid1.Cells[9,stringgrid1.RowCount-1]:=form3.Label31.Caption; //工具税金
 stringgrid1.Cells[22,stringgrid1.RowCount-1]:=form3.Label32.Caption; //折扣
 stringgrid1.Cells[23,stringgrid1.RowCount-1]:=form3.Label34.Caption; //总合计
 stringgrid1.Cells[24,stringgrid1.RowCount-1]:=form3.Label41.Caption; //面积
 if Form3.rkey213>0 then
 begin
  StringGrid1.Cells[25,StringGrid1.RowCount-1]:=IntToStr(Form3.rkey213);
//20161018tang修改
  StringGrid1.Cells[28,StringGrid1.RowCount-1]:=IntToStr(Form3.Edit2.Tag);//预处理已使用数量
  StringGrid1.Cells[29,StringGrid1.RowCount-1]:=IntToStr(Form3.BitBtn1.Tag);// 预处理数量
//end20161018
 end else
  StringGrid1.Cells[25,StringGrid1.RowCount-1]:='0';
   //下面为显示在本页的所有so合计内容
 label44.Caption:=formatfloat
 ('0.0000',strtofloat(label44.Caption)+strtofloat(stringgrid1.Cells[20,stringgrid1.RowCount-1]));
 label61.Caption:=formatfloat
 ('0.000',strtofloat(label61.Caption)+strtofloat(stringgrid1.Cells[21,stringgrid1.RowCount-1]));
 label46.Caption:=formatfloat
 ('0.000',strtofloat(label46.Caption)+strtofloat(stringgrid1.Cells[22,stringgrid1.RowCount-1]));
 label47.Caption:=formatfloat
 ('0.0000',strtofloat(label47.Caption)+strtofloat(stringgrid1.Cells[19,stringgrid1.RowCount-1]));
 label63.Caption:=formatfloat
 ('0.0000',strtofloat(label63.Caption)+strtofloat(stringgrid1.Cells[9,stringgrid1.RowCount-1]));
 label48.Caption:=formatfloat
 ('0.0000',strtofloat(label48.Caption)+strtofloat(stringgrid1.Cells[23,stringgrid1.RowCount-1]));
 label60.Caption:=formatfloat
 ('0.0000',strtofloat(label60.Caption)+strtofloat(stringgrid1.Cells[24,stringgrid1.RowCount-1]));
end;

procedure TForm2.get_data0089(rkey50:integer);
begin
  dm.ado89.DisableControls;
  dm.DataSource3.DataSet:=nil;
  dm.ado89.close;
  dm.ado89.Parameters[1].Value:=rkey50;
  dm.ado89.Open;

  dm.ado278.Close;
  dm.ado278.Parameters[1].Value:=rkey50;
  dm.ado278.Open;

//  if dm.ado89.IsEmpty then
//   begin
//    while not dm.ado278.Eof do
//     begin
//      dm.ado89.Append;
//      dm.ado89CUST_PART_PTR.Value := rkey50;
//      dm.ado89parameter_ptr.Value := dm.ado278PARAMETER_PTR.Value;
//      if trim(dm.ado89SPEC_RKEY.Value)='F' then
//       dm.ado89tvalue.Value:=floattostr(self.set_length);
//      if trim(dm.ado89SPEC_RKEY.Value)='G' then
//       dm.ado89tvalue.Value:=floattostr(self.set_width);
//      dm.ado89.Post;
//      dm.ado278.Next;
//     end;
//    dm.ado278.Close;
//    dm.ado89.First;
//   end
//  else
//   begin
//    while not dm.ado278.Eof do
//     begin
//      if not dm.ado89.Locate('parameter_ptr',dm.ado278PARAMETER_PTR.Value,[]) then
//       begin
//        dm.ado89.Append;
//        dm.ado89CUST_PART_PTR.Value:=rkey50;
//        dm.ado89parameter_ptr.Value:=dm.ado278parameter_ptr.Value;
//        if trim(dm.ado89SPEC_RKEY.Value)='F' then
//         dm.ado89tvalue.Value:=floattostr(self.set_length);
//        if trim(dm.ado89SPEC_RKEY.Value)='G' then
//         dm.ado89tvalue.Value:=floattostr(self.set_width);
//        dm.ado89.Post;
//       end;
//       dm.ado278.Next;
//     end;
//    dm.ado278.Close;
//    dm.ado89.First;
//   end;
  dbgrid1.SelectedIndex:=3;
  dm.ado89.EnableControls;
  dm.DataSource3.DataSet:=dm.ado89;
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
var
 v_message:byte;
begin
 if stringgrid1.rowcount>2 then
  begin
   v_message:=messagedlg('数据已修改,是否存盘?',mtConfirmation,[mbyes,mbno,mbcancel],0);
   if v_message=7 then//no取消对当前记录的修改包括新增
    begin
    dm.AQ62.CancelBatch();
    dm.AQ102.CancelBatch();
    dm.AQ6011.CancelBatch();
    dm.AQ106011.CancelBatch();
    dm.AQ179.CancelBatch();
    dm.ado89.CancelBatch();
    dm.ADOQuery1.Close;
    dm.ADOQuery1.Open;
    close;
    end
   else
   if v_message=6 then     //yes对修改的记录存盘
    BitBtn1Click(Sender)
   else                    //cancel不存盘也不保存
    exit;
  end
 else
  begin
   dm.ADOQuery1.Close;   //刷新首页数据
   dm.ADOQuery1.Open;
   close;
  end;
end;

procedure TForm2.BitBtn4Click(Sender: TObject);
var
i:byte;
begin
try
 frm_cust:=tfrm_cust.Create(application);
 frm_cust.ADOQuery1.Close;
 frm_cust.ADOQuery1.Parameters[0].Value:='%'+trim(edit3.Text)+'%';
 frm_cust.ADOQuery1.Open;
 if frm_cust.ADOQuery1.IsEmpty then
  begin
   messagedlg('请输入正确的客户代码!',mtinformation,[mbok],0);
   edit3.SetFocus;
   exit;
  end;
 if frm_cust.ShowModal=mrok then
  begin
   //显示订单的价格是否含税
   radiogroup2.ItemIndex:=frm_cust.ADOQuery1.FieldByName('EDI_FLAG_FOR_INVOICE').AsInteger;

   edit3.Text:=frm_cust.ADOQuery1.fieldbyname('cust_code').AsString;
   edit3.Font.Color := clwindowtext;
   with dm.aqTmp do
   begin
     close;
     sql.Clear;
     sql.Add('select t5.RKEY,t5.EMPLOYEE_NAME from data0010 t10 inner join data0005 t5 on t10.SALES_REP_PTR=t5.RKEY ');
     sql.Add('where t10.cust_code ='''+edit3.Text+'''');
     open;
   end;
   lblywy.Caption := dm.aqTmp.FieldByName('EMPLOYEE_NAME').AsString;
   ywy:= dm.aqTmp.FieldByName('RKEY').AsString;

   label33.Caption := frm_cust.ADOQuery1.fieldbyname('customer_name').AsString;
   label36.Caption := frm_cust.ADOQuery1.fieldbyname('cod_flag').AsString; //货到收款
   lab_rkey10.Caption := frm_cust.ADOQuery1.fieldbyname('rkey').AsString;
   lab_rkey01.Caption := frm_cust.ADOQuery1.fieldbyname('currency_ptr').AsString;
   label66.Caption := frm_cust.ADOQuery1.fieldbyname('FED_TAX_ID_NO').AsString; //付款方式
   credit_rating := frm_cust.ADOQuery1.fieldbyname('credit_rating').AsInteger; //信用等级
   credit_limit := frm_cust.ADOQuery1.fieldbyname('credit_limit').AsFloat;//信用限额
   customer_quote:=frm_cust.ADOQuery1.fieldbyname('quote_flag').AsBoolean; //客户报价关联
   edit6.enabled:=true;       //使采购定单可用        //赶工费用计算方法
   bitbtn6.Enabled:=true;
   edit10.Enabled:=true;      //使装运地点可用
   bitbtn7.Enabled:=true;
   bitbtn8.Enabled:=true;    //使装运方法可用
   Combobox1.Clear;
   for i:=1 to 6 do           //客户联络人
   if trim(frm_cust.adoQuery1.fieldbyname('contact_name_'+inttostr(i)).asstring)<>'' then
    combobox1.Items.Add(trim(frm_cust.adoQuery1.fieldbyname('contact_name_'+inttostr(i)).asstring));
   combobox1.ItemIndex:=0;
   with dm.ADOQuery2 do //货币
    begin
     if active=true then active:=false;
      sql.Clear;
      sql.Add('select curr_code,curr_name,exch_rate from data0001');
      sql.Add('where rkey='+lab_rkey01.Caption);
      active:=true;
      edit8.Text:=fieldbyname('curr_code').AsString;
      label35.Caption:=fieldbyname('curr_name').AsString;
      edit9.Text:=formatfloat('0.00000000',fieldvalues['exch_rate']);
      if lab_rkey01.Caption = '1' then
       edit9.Enabled := false
      else
       edit9.Enabled := true;
    end;
   if frm_cust.ADOQuery1.fieldbyname('EDI_FLAG_FOR_SOACK').AsInteger=1 then
    checkbox1.Checked := true
   else
    checkbox1.Checked := false;
   with dm.ADOQuery2 do     //查找装运地点;
    begin
     if active=true then active:=false;
      sql.Clear;
      sql.Add('select data0012.rkey,location,ship_to_address_1,state,zip,SHIP_CTAX_PTR,');
      sql.Add('SHIP_TO_CONTACT,SHIP_TO_PHONE,SHIP_SHIPPING_METHOD,SHIP_FOB,');
      sql.Add('STATE_SHIP_TAX_FLAG,STATE_PROD_TAX_FLAG,STATE_TOOL_TAX_FLAG,');
      sql.Add('ship_lead_time,state_id,state_tax');
      sql.Add('from data0012,data0189');
      sql.Add('where data0012.SHIP_CTAX_PTR=data0189.rkey and');
      sql.Add('customer_ptr='+lab_rkey10.Caption);
      sql.Add('and data0012.LANGUAGE_FLAG=''Y''');
      sql.Add('order by location');
      active:=true;
     if not IsEmpty then
      begin
       edit10.Text:=fieldbyname('location').AsString;
       edit10.Font.Color := clwindowtext;
       lab_rkey12.Caption:=fieldbyname('rkey').AsString;
       edit11.Text:=fieldbyname('ship_to_contact').AsString;
       edit12.Text:=fieldbyname('ship_shipping_method').AsString;
       edit13.Text:=fieldbyname('ship_to_phone').AsString;
       edit7.Text:=fieldbyname('ship_fob').AsString;
       label49.Caption:=fieldbyname('ship_lead_time').AsString;
       IF FieldValues['STATE_PROD_TAX_FLAG']='Y' then
        checkbox2.Checked:=true
       else
        checkbox2.Checked:=false;
       IF FieldValues['STATE_TOOL_TAX_FLAG']='Y' then
        checkbox3.Checked:=true
       else
        checkbox3.Checked:=false;
       edit1.Text:=fieldbyname('state_id').AsString;
       edit2.Text:=formatfloat('0.00',fieldvalues['state_tax']);
       tax:=fieldvalues['state_tax'];
      end
     else   //如果大于1个装运地点将以前的数据清掉
      begin
       lab_rkey12.Caption:='';
       edit10.Text:='';
       edit1.Text:='';
       edit2.Text:='';
      end;
    end;
                                              //工程更改指示
    if DM.aq192custcoTool.Value<>'Y' then   //产品与客户是否绑定 YYY 改2009/08/13
    begin                                   //=Y 一产品可对多客户
      edit4.Text:='';
      lab_rkey50.Caption:='';
      label34.Caption:='';
      Label1.Caption:='';
    end;
    edit6.Text:='';
    lab_rkey97.Caption:='';
    edit4.SetFocus;

  end;
finally
 frm_cust.free;
end;
end;

procedure TForm2.Edit3Click(Sender: TObject);
begin
if edit3.Font.Color=clwindowtext then
  begin
   edit3.SelectAll;
   edit3.Font.Color:=clblue;
  end;
end;

procedure TForm2.Edit3Exit(Sender: TObject);
var
i:byte;
begin
  with dm.ADOQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add('select 1 from data0010 where CUSTOMER_TYPE = 4 and cust_code = '''+Edit3.Text+'''');
    open;
  end;
  if dm.ADOQuery2.RecordCount<>0 then
  begin
    edit3.Text:='';
    Edit4.Text:='';
    label34.Caption := '';
    lab_rkey50.Caption := '';
    showmessage('该客户已停用,请联系市场部!');
    abort;
  end;
if (activecontrol.Name<>'BitBtn4') and (trim(edit3.Text)<>'') then
 try
  if Edit3.Text<>Fcust then
  begin
    if DM.aq192custcoTool.Value<>'Y' then   //产品与客户是否绑定 YYY 改2009/08/13
    begin                                   //=Y 一产品可对多客户
      edit4.Text:='';
      lab_rkey50.Caption:='';
      label34.Caption:='';
      Label1.Caption:='';
    end;
    edit6.Text:='';
    lab_rkey97.Caption:='';
  end;

  with dm.ADOQuery3 do
  begin
   Close;
   sql.Clear;
   SQL.Text:=
   'select rkey,cust_code,customer_name,currency_ptr,cod_flag,'+
   'CONTACT_NAME_1,CONTACT_NAME_2,CONTACT_NAME_3,'+
   'CONTACT_NAME_4,CONTACT_NAME_5,CONTACT_NAME_6,'+
   'INTERNAL_ECN_COUNT,EXTERNAL_ECN_COUNT, EDI_FLAG_FOR_INVOICE, quote_flag,'+
   'reg_tax_fixed_unused,credit_rating,credit_limit,'+
   'EDI_FLAG_FOR_SOACK,FED_TAX_ID_NO '+
   'from data0010 '+
   'where cust_code ='''+Edit3.Text+''''+
   ' and CUSTOMER_TYPE<>4';
   open;
  end;

 if not dm.ADOQuery3.IsEmpty then
  begin
   edit3.Font.Color:=clwindowtext;
   label33.Caption := dm.ADOQuery3.FieldValues['customer_name'];
   lab_rkey10.Caption := dm.ADOQuery3.Fieldbyname('rkey').asstring;
   lab_rkey01.Caption := dm.ADOQuery3.fieldbyname('currency_ptr').AsString;
   label36.Caption := dm.ADOQuery3.fieldbyname('cod_flag').AsString; //货到付款
   label66.Caption := dm.ADOQuery3.fieldbyname('FED_TAX_ID_NO').AsString; //付款方式
   credit_rating := dm.ADOQuery3.fieldbyname('credit_rating').AsInteger; //信用等级
   credit_limit := dm.ADOQuery3.fieldbyname('credit_limit').AsFloat; //信用限额
   customer_quote:=dm.ADOQuery3.fieldbyname('quote_flag').AsBoolean; //客户报价关联

   //显示订单的价格是否含税
   radiogroup2.ItemIndex:=dm.ADOQuery3.FieldByName('EDI_FLAG_FOR_INVOICE').AsInteger;

   edit6.enabled := true;      // 使采购定单可用
   bitbtn6.Enabled := true;    // 使采购定单可用
   edit10.Enabled := true;     // 使装运地点
   bitbtn7.Enabled := true;    // 使装运地点可选择
   bitbtn8.Enabled := true;    //使装运方法可用
   Combobox1.Clear;
  for i:=1 to 6 do
  if trim(dm.adoQuery3.fieldbyname('contact_name_'+inttostr(i)).asstring)<>'' then
   combobox1.Items.Add(dm.adoQuery3.fieldbyname('contact_name_'+inttostr(i)).asstring);
   combobox1.ItemIndex := 0;
   with dm.ADOQuery2 do
    begin
     if active=true then active := false;
     sql.Clear;                         //查找货币
     sql.Add('select curr_code,curr_name,exch_rate from data0001');
     sql.Add('where rkey='+lab_rkey01.Caption);
     active:=true;
     edit8.Text := fieldbyname('curr_code').AsString;
     label35.Caption := fieldbyname('curr_name').AsString;
     edit9.Text := formatfloat('0.00000000',fieldvalues['exch_rate']);
     if lab_rkey01.Caption = '1' then
      edit9.Enabled := false
     else
      edit9.Enabled := true;
    end;
   if dm.ADOQuery3.fieldbyname('EDI_FLAG_FOR_SOACK').AsInteger=1 then //出口
    checkbox1.Checked:=true
   else
    checkbox1.Checked:=false;

   with dm.aqTmp do
   begin
     close;
     sql.Clear;
     sql.Add('select t5.RKEY,t5.EMPLOYEE_NAME from data0010 t10 inner join data0005 t5 on t10.SALES_REP_PTR=t5.RKEY ');
     sql.Add('where t10.cust_code = '''+trim(edit3.text)+'''');
     open;
   end;
   lblywy.Caption := dm.aqTmp.FieldByName('EMPLOYEE_NAME').AsString;
   ywy:= dm.aqTmp.FieldByName('RKEY').AsString;
   

  with dm.ADOQuery2 do        //开始，查找装运地点
   begin
     if active=true then active:=false;
     sql.Clear;
     sql.Add('select data0012.rkey,location,ship_to_address_1,state,zip,SHIP_CTAX_PTR,');
     sql.Add('SHIP_TO_CONTACT,SHIP_TO_PHONE,SHIP_SHIPPING_METHOD,SHIP_FOB,');
     sql.Add('STATE_SHIP_TAX_FLAG,STATE_PROD_TAX_FLAG,STATE_TOOL_TAX_FLAG,');
     sql.Add('ship_lead_time,state_id,state_tax');
     sql.Add('from data0012,data0189');
     sql.Add('where data0012.SHIP_CTAX_PTR=data0189.rkey and');
     sql.Add('data0012.customer_ptr='+lab_rkey10.Caption);
     sql.Add('and data0012.LANGUAGE_FLAG=''Y''');
     sql.Add('order by location');
     active:=true;
     if not IsEmpty then
      begin
       edit10.Text:=fieldbyname('location').AsString;
       edit10.Font.Color := clwindowtext;
       lab_rkey12.Caption:=fieldbyname('rkey').AsString;
       edit11.Text:=fieldbyname('ship_to_contact').AsString;
       edit12.Text:=fieldbyname('ship_shipping_method').AsString;
       edit13.Text:=fieldbyname('ship_to_phone').AsString;
       edit7.Text:=fieldbyname('ship_fob').AsString;
       label49.Caption:=fieldbyname('ship_lead_time').AsString;
       IF FieldValues['STATE_PROD_TAX_FLAG']='Y' then
        checkbox2.Checked:=true
       else
        checkbox2.Checked:=false;
       IF FieldValues['STATE_TOOL_TAX_FLAG']='Y' then
        checkbox3.Checked:=true
       else
        checkbox3.Checked:=false;
       edit1.Text:=fieldbyname('state_id').AsString;
       edit2.Text:=formatfloat('0.00',fieldvalues['state_tax']);
       tax:=fieldvalues['state_tax'];
      end
     else //如果没有默认装运地点
      begin
       lab_rkey12.Caption:='0';
       edit10.Text := '';
       edit1.Text := '';
       edit2.Text := '';
      end;
   end;//结束,读取客户装运地址

  end
 else
  begin
   messagedlg('客户代码不正确,请重新输入或选择',mtinformation,[mbok],0);
   edit3.SetFocus;
   exit;
  end;
 finally
 // if Assigned(frm_cust) then frm_cust.free;
 end
else
 if (activecontrol.Name<>'BitBtn4') and (trim(edit3.Text)='') then
  begin
   label33.Caption := '';
   lab_rkey10.Caption := '';              //客户指针
   lab_rkey01.Caption := '';              //货币指针
   edit8.Text := '';
   edit9.Text := '0.00000000';
   label35.Caption := '';
   label36.Caption := '';                 //货到付款标记
   Combobox1.Clear;                       //取消客户联络人

   edit4.Text:='';                        //取消客户部品
   label34.Caption:='';
   Label1.Caption:='';
   lab_rkey50.Caption:='';
   edit6.Enabled:=false;                  //采购定单不可用
   bitbtn6.Enabled:=false;
   edit6.Text:='';
   lab_rkey97.Caption:='';
   edit10.Enabled:=false;                 //使装运地点不可用
   bitbtn7.Enabled:=false;
   bitbtn8.Enabled:=false;    //使装运方法可用   
   edit10.Text:='';
   lab_rkey12.Caption:='0';
  end;
end;

procedure TForm2.Edit4Click(Sender: TObject);
begin
if (sender as tedit).Font.Color=clwindowtext then
  begin
   (sender as tedit).SelectAll;
   (sender as tedit).Font.Color:=clblue;
  end;
end;

procedure TForm2.BitBtn5Click(Sender: TObject);
begin
try
 frmcustpart:=tfrmcustpart.Create(application);  //产品与客户是否绑定 YYY 改2009/08/13
 if (trim(edit3.Text)<>'') and (DM.aq192custcoTool.Value<>'Y') then  //如果先选择客户
  with frmcustpart.ADOQuery1 do
   begin
    close;
    //20161018tang取消存储过程，直接用ADO
    frmcustpart.ADOQuery1.SQL.Add(' and MANU_PART_NUMBER LIKE ''%'+Trim(edit4.Text)+'%'' and data0025.customer_ptr='+lab_rkey10.Caption+' ORDER BY MANU_PART_NUMBER');
//    Parameters[1].Value:=2;
//    Parameters[2].Value:=self.lab_rkey10.Caption;
//    Parameters[3].Value:=trim(edit4.Text);
    open;
   end
 else
  begin
   frmcustpart.ADOQuery1.Close;
    //20161018tang取消存储过程，直接用ADO
    frmcustpart.ADOQuery1.SQL.Add(' and MANU_PART_NUMBER LIKE ''%'+Trim(edit4.Text)+'%'' ORDER BY MANU_PART_NUMBER');
//   frmcustpart.ADOQuery1.Parameters[1].Value:=1;
//   frmcustpart.ADOQuery1.Parameters[2].Value:=0;
//   frmcustpart.ADOQuery1.Parameters[3].Value:=trim(edit4.Text);
   frmcustpart.ADOQuery1.Open;
  end;

  if frmcustpart.ADOQuery1.IsEmpty then
   begin
    messagedlg('请输入正确的产品型号!',mtinformation,[mbok],0);
    edit4.SetFocus;
   end
  else
  if frmcustpart.ShowModal=mrok then
   begin
    if213:=0;
    edit4.Text:=trim(frmcustpart.ADOQuery1MANU_PART_NUMBER.Value);
    edit4.Font.Color:=clwindowtext;
    label34.Caption:=frmcustpart.ADOQuery1MANU_PART_DESC.Value;
    Label1.Caption:=FrmCustPart.ADOQuery1ANALYSIS_CODE_2.Value;
    lab_rkey50.Caption:=frmcustpart.ADOQuery1rkey25.AsString;
    combobox3.ItemIndex:=self.getSO_OLDNEW(strtoint(lab_rkey50.Caption));
    self.set_length:=frmcustpart.ADOQuery1set_lngth.Value;
    self.set_width :=frmcustpart.ADOQuery1set_width.Value;
    self.get_data0089(frmcustpart.ADOQuery1rkey25.Value);
    edit14.Text:=frmcustpart.ADOQuery1.fieldbyname('qty_on_hand').AsString;
    label38.Caption:=frmcustpart.ADOQuery1.fieldbyname('qty_alloc').AsString;
    label39.Caption:= floattostr(frmcustpart.ADOQuery1QTY_ON_HAND.Value-
                                 frmcustpart.ADOQuery1qty_alloc.Value);
    v_part_num := frmcustpart.ADOQuery1.FieldValues['ttype'];//量产，样板
    self.prod_rkey:=frmcustpart.ADOQuery1.FieldValues['PROD_CODE_PTR'];
    self.shelf_life:=frmcustpart.ADOQuery1SHELF_LIFE.Value;
    self.set_qty:=frmcustpart.ADOQuery1set_qty.Value;

    self.unit_sq:=frmcustpart.ADOQuery1.fieldbyname('unit_sq').AsFloat;

    quote_flag:=self.quote_vflag(strtoint(lab_rkey50.Caption),v_part_num);
     if v_part_num=0 then //量板
      begin
       label51.Caption := dm.aq192aptaxontax.Value;//量板需要审批
        if dm.aq192custciship.Value='Y' then  bitbtn9.Enabled:=false; //不允许修改货币
      end
     else//样板
      begin
       label51.Caption := dm.aq192artaxontax.Value;//样板需要审批
       self.BitBtn9.Enabled:=true;//样板可以手工修改币别
      end;
     IF trim(edit3.Text)='' then
      with dm.ADOQuery2 do
       begin
        if active=true then active:=false;
        sql.Clear;
        sql.Add('select cust_code from  data0010');
        sql.Add('where rkey='+frmcustpart.ADOQuery1.fieldbyname('customer_ptr').AsString);
        active:=true;
        edit3.Text:=fieldbyname('cust_code').AsString;
        Fcust:=Edit3.Text;
        edit3exit(sender);
       end;
     IF (trim(edit5.Text)='') and
        (frmcustpart.ADOQuery1prod_route_ptr.Value>0)  then
      with dm.ADOQuery2 do
       begin
        active:=false;
        sql.Clear;
        sql.Add('select WAREHOUSE_CODE,WAREHOUSE_NAME from  data0015');
        sql.Add('where active_flag=''Y'' and rkey='+frmcustpart.ADOQuery1prod_route_ptr.AsString);
        active:=true;
        edit5.Text:=fieldbyname('WAREHOUSE_CODE').AsString;
        label64.Caption:= fieldbyname('WAREHOUSE_NAME').AsString;
        lab_rkey15.Caption:= frmcustpart.ADOQuery1prod_route_ptr.AsString;
        edit5.Font.Color:=clwindowtext;
       end;
      //20170322tang添关联原客户可选择
      if (if213=0) then
      begin
        with dm.ADOQuery5 do
        begin
          close;
          sql.Clear;
          sql.Add('select data0010.rkey,data0025.ORIG_CUSTOMER from data0025 inner join data0010 on data0025.ORIG_CUSTOMER=data0010.ABBR_NAME where MANU_PART_NUMBER='''+edit4.Text+'''');
          open;
        end;
        Edit17.Text:= dm.ADOQuery5.FieldByName('ORIG_CUSTOMER').AsString;
        if not dm.ADOQuery5.IsEmpty then Edit17.Tag:=dm.ADOQuery5.FieldByName('rkey').AsInteger;
      end;
       //end20170322tang
     rkey25:=frmcustpart.ADOQuery1.FieldValues['rkey25'];
     memo1.ReadOnly:=false;
     memo1.Text:=frmcustpart.ADOQuery1.fieldbyname('REMARK').AsString;
     memo2.ReadOnly:=false;
     memo2.Text:=frmcustpart.ADOQuery1.fieldbyname('ENG_NOTE').AsString;
     if bitbtn6.Enabled=false then bitbtn6.Enabled := true;
     if edit6.Enabled=false then   Edit6.Enabled:=true;
     edit6.SetFocus;
   end;
finally
 frmcustpart.free;
end;

end;

procedure TForm2.Edit4Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn5')and (trim(edit4.Text)<>'')then
try
 frmcustpart:=tfrmcustpart.Create(application);
 if (trim(edit3.Text)<>'') and (DM.aq192custcoTool.Value<>'Y') then  //如果先选择客户或一产品对多客户
  with frmcustpart.ADOQuery1 do
   begin
    close;
    //20161018tang取消存储过程，直接用ADO
    frmcustpart.ADOQuery1.SQL.Add(' and MANU_PART_NUMBER LIKE ''%'+Trim(edit4.Text)+'%'' and data0025.customer_ptr='+lab_rkey10.Caption+' ORDER BY MANU_PART_NUMBER');
//    Parameters[1].Value:=2;
//    Parameters[2].Value:=self.lab_rkey10.Caption;
//    Parameters[3].Value:=trim(edit4.Text);
    open;
   end
 else
  begin
   frmcustpart.ADOQuery1.Close;
    //20161018tang取消存储过程，直接用ADO
    frmcustpart.ADOQuery1.SQL.Add(' and MANU_PART_NUMBER LIKE ''%'+Trim(edit4.Text)+'%'' ORDER BY MANU_PART_NUMBER');
//   frmcustpart.ADOQuery1.Parameters[1].Value:=1;
//   frmcustpart.ADOQuery1.Parameters[2].Value:=0;
//   frmcustpart.ADOQuery1.Parameters[3].Value:=trim(edit4.Text);
   frmcustpart.ADOQuery1.Open;
  end;
 if comparetext(trim(edit4.text),trim(frmcustpart.ADOQuery1MANU_PART_NUMBER.Value))=0 then
  begin
   if frmcustpart.ADOQuery1ONHOLD_SALES_FLAG.Value=1 then
    begin
     messagedlg('此产品型号已暂缓销售!',mtwarning,[mbcancel],0);
     edit4.SetFocus;
     exit;
    end;
   if lab_rkey50.Caption<>'' then
    if strtoint(lab_rkey50.Caption)=frmcustpart.ADOQuery1rkey25.Value then
     exit;
   lab_rkey50.Caption:=frmcustpart.ADOQuery1rkey25.AsString;
   combobox3.ItemIndex:=self.getSO_OLDNEW(strtoint(lab_rkey50.Caption));
   edit4.Font.Color:=clwindowtext;
   label34.Caption:=frmcustpart.ADOQuery1MANU_PART_DESC.AsString;
   Label1.Caption:=FrmCustPart.ADOQuery1ANALYSIS_CODE_2.AsString;//20170505tang添客户物料号
   self.set_length:=frmcustpart.ADOQuery1.FieldValues['set_lngth'];
   self.set_width :=frmcustpart.ADOQuery1.FieldValues['set_width'];
   get_data0089(frmcustpart.ADOQuery1rkey25.Value);
   edit14.Text:=frmcustpart.ADOQuery1.fieldbyname('qty_on_hand').AsString;
   label38.Caption:=frmcustpart.ADOQuery1.fieldbyname('qty_alloc').AsString;
   label39.Caption:= floattostr(frmcustpart.ADOQuery1QTY_ON_HAND.Value-
                                frmcustpart.ADOQuery1qty_alloc.Value);
   v_part_num := frmcustpart.ADOQuery1.FieldValues['ttype'];
   self.prod_rkey:=frmcustpart.ADOQuery1.FieldValues['PROD_CODE_PTR'];//产品类型指针用于查找业务员佣金
   if frmcustpart.ADOQuery1.FieldByName('SHELF_LIFE').AsString='' then
   self.shelf_life:=frmcustpart.ADOQuery1.FieldValues['LEAD_TIME'] //产品周期
   else
   self.shelf_life:=frmcustpart.ADOQuery1.FieldValues['SHELF_LIFE']; //产品周期
   self.set_qty:=frmcustpart.ADOQuery1set_qty.Value;

   self.unit_sq:=frmcustpart.ADOQuery1.fieldbyname('unit_sq').AsFloat;
   quote_flag:=self.quote_vflag(strtoint(lab_rkey50.Caption),v_part_num);
   if v_part_num=0 then //量板
    begin
     label51.Caption := dm.aq192aptaxontax.Value;//量板需要审批
      if dm.aq192custciship.Value='Y' then  bitbtn9.Enabled:=false;
    end
   else//样板
    begin
    label51.Caption := dm.aq192artaxontax.Value;//样板需要审批
    self.BitBtn9.Enabled:=true;//样板可以手工修改币别
    end;
   if trim(edit3.Text)='' then
    with dm.ADOQuery2 do
     begin
      if active=true then active:=false;
      sql.Clear;
      sql.Add('select cust_code from  data0010');
      sql.Add('where rkey='+frmcustpart.ADOQuery1CUSTOMER_PTR.AsString);
      active:=true;
      edit3.Text:=fieldbyname('cust_code').AsString;
      Fcust:=Edit3.Text;
      edit3exit(sender);
     end;
   IF (trim(edit5.Text)='') and
      (frmcustpart.ADOQuery1prod_route_ptr.Value>0)  then
    with dm.ADOQuery2 do
     begin
      active:=false;
      sql.Clear;
      sql.Add('select WAREHOUSE_CODE,WAREHOUSE_NAME from  data0015');
      sql.Add('where active_flag=''Y'' and rkey='+frmcustpart.ADOQuery1prod_route_ptr.AsString);
      active:=true;
      edit5.Text:=fieldbyname('WAREHOUSE_CODE').AsString;
      label64.Caption:= fieldbyname('WAREHOUSE_NAME').AsString;
      lab_rkey15.Caption:= frmcustpart.ADOQuery1prod_route_ptr.AsString;
      edit5.Font.Color:=clwindowtext;
     end;
    //20170322tang添关联原客户可选择
    if (if213=0) then
    begin
      with dm.ADOQuery5 do
      begin
        close;
        sql.Clear;
        sql.Add('select data0010.rkey,data0025.ORIG_CUSTOMER from data0025 inner join data0010 on data0025.ORIG_CUSTOMER=data0010.ABBR_NAME where MANU_PART_NUMBER='''+edit4.Text+'''');
        open;
      end;
      Edit17.Text:= dm.ADOQuery5.FieldByName('ORIG_CUSTOMER').AsString;
      if not dm.ADOQuery5.IsEmpty then Edit17.Tag:=dm.ADOQuery5.FieldByName('rkey').AsInteger;
    end;
     //end20170322tang
   rkey25:=frmcustpart.ADOQuery1rkey25.Value;
   memo1.ReadOnly:=false;
   memo1.Text:=frmcustpart.ADOQuery1.fieldbyname('REMARK').AsString;
   memo2.ReadOnly:=false;
   memo2.Text:=frmcustpart.ADOQuery1.fieldbyname('ENG_NOTE').AsString;
   Edit6.Enabled:=true;
   bitbtn6.Enabled:=TRUE;
   Edit6.SetFocus;
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
 if (activecontrol.Name<>'BitBtn5') and (trim(edit4.Text)='') then
  begin
   label34.Caption := '';
   Label1.Caption:='';
   lab_rkey50.Caption := '';
   EDIT6.Enabled:=false;
   bitbtn6.Enabled:=false;
   memo1.Text:='';
   memo1.ReadOnly:=true;
   memo2.Text:='';
   memo2.ReadOnly:=true;
   dm.ado89.Close;
  end;
end;

procedure TForm2.BitBtn6Click(Sender: TObject);
begin
try
 form_po:=tform_po.Create(application);
 with form_po.ADOQuery1 do
  begin
   close;
   Parameters[1].Value:=lab_rkey10.Caption;
   open;
  end;
 form_po.Edit1.Text := trim(edit6.Text);
 if form_po.ADOQuery1.IsEmpty then
  begin
   messagedlg('没有找到记录!',mtinformation,[mbok],0);
   edit6.SetFocus;
  end
 else
 if form_po.ShowModal=mrok then
  begin
   edit6.Text := TRIM(form_po.ADOQuery1.fieldbyname('po_number').AsString);
   edit6.Font.Color := clwindowtext;
   lab_rkey97.Caption := form_po.ADOQuery1.fieldbyname('rkey').AsString;
   maskedit1.Text := form_po.ADOQuery1.fieldbyname('po_date').AsString;
   {bitbtn2.Enabled:=true;
   with dm.AQ9711 do
    begin
     if active=true then active:=false;
      sql.Clear;
      sql.Add('select * from data0011');
      sql.Add('where source_type=1060 and file_pointer='+lab_rkey97.Caption);
      //sql.Add('where source_type=97 and file_pointer='+lab_rkey97.Caption);
      active:=true;
     if not isempty then
      begin
       po_note.Clear;
       po_note.Text:=fieldvalues['memo_text'];
      end;
    end; }
    combobox1.SetFocus;
  end
 else
  edit6.SetFocus;
finally
 form_po.free;
end;
end;

procedure TForm2.Edit6Exit(Sender: TObject);
begin
if trim(edit6.Text)<>'' then
//try
begin
  with dm.aqTmp do
  begin
    close;
    sql.Clear;
    sql.Add('select rkey,po_number,po_date from data0097 where customer_ptr='+lab_rkey10.Caption);
    sql.Add('and po_number='''+trim(edit6.Text)+'''');
    open;
  end;
// form_po:=tform_po.Create(application);
// with form_po.ADOQuery1 do
//  begin
//   close;
//   Parameters[1].Value:=lab_rkey10.Caption;
//   open;
//  end;
// form_po.Edit1.Text:=trim(edit6.Text);

// if form_po.ADOQuery1.IsEmpty then  //为空,新合同
 if dm.aqTmp.RecordCount=0 then
  begin
   lab_rkey97.Caption := '';
   maskedit1.Text:=datetostr(getsystem_date(DM.ADOQuery5,1));
   maskedit1.Enabled:=True;
  end
 else  //不为空
//  if comparetext(trim(edit6.text),trim(form_po.ADOQuery1.Fieldbyname('po_number').AsString))=0 then
//  if comparetext(trim(edit6.text),trim(dm.aqTmp.Fieldbyname('po_number').AsString))=0 then
  begin          //使用原合同用
   edit6.Font.Color:=clwindowtext;
//   lab_rkey97.Caption:=form_po.ADOQuery1.fieldbyname('rkey').AsString;
//   maskedit1.Text:=form_po.ADOQuery1.fieldbyname('po_date').AsString;
   lab_rkey97.Caption:=dm.aqTmp.fieldbyname('rkey').AsString;
   maskedit1.Text:=dm.aqTmp.fieldbyname('po_date').AsString;
   maskedit1.Enabled:=False;
  end;
//  else  //使用新合同
//  begin
//   lab_rkey97.Caption := '';
//   maskedit1.Text:=datetostr(getsystem_date(DM.ADOQuery5,1));
//   maskedit1.Enabled:=True;
//  end;
//finally
// form_po.free;
end
else
 bitbtn2.Enabled:=false;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
 maskedit1.Text:=datetostr(getsystem_date(DM.ADOQuery5,1));
 stringgrid1.Cells[0,0]:='销售定单编号';
 stringgrid1.Cells[1,0]:='报价单号';
 stringgrid1.Cells[2,0]:='数量(pcs)';
 stringgrid1.Cells[3,0]:='价格(pcs)';
 stringgrid1.Cells[4,0]:='参考';
 stringgrid1.Cells[5,0]:='折扣%';
 stringgrid1.Cells[6,0]:='优先';
 stringgrid1.Cells[7,0]:='客户交货期';
 stringgrid1.Cells[8,0]:='计划装运期';
 stringgrid1.Cells[9,0]:='工具税';
 stringgrid1.Cells[10,0]:='CONSUME_FORECASTS';
 stringgrid1.Cells[11,0]:='BACKWARD_DAYS';
 stringgrid1.Cells[12,0]:='FORWARD_DAYS';
 stringgrid1.Cells[13,0]:='报价单指针';
 stringgrid1.Cells[14,0]:='ANALYSIS_CODE_1';
 stringgrid1.Cells[15,0]:='ANALYSIS_CODE_2';
 stringgrid1.Cells[16,0]:='ANALYSIS_CODE_3';
 stringgrid1.Cells[17,0]:='';
 stringgrid1.Cells[18,0]:='';
 stringgrid1.Cells[19,0]:='TOTAL_ADD_L_PRICE';
 stringgrid1.ColWidths[0]:=128;
 stringgrid1.ColWidths[1]:=60;
 stringgrid1.ColWidths[3]:=74;
 stringgrid1.ColWidths[7]:=126;
 stringgrid1.ColWidths[8]:=126;
 edit15.Text:=formatdatetime('yyyy-mm-dd HH:mm:ss',getsystem_date(DM.ADOQuery5,0));
 if213:=0;
// po_note:=tstringlist.Create;

 dm.aq192.Open; //控制开关
 dm.AQ102.Open;
 dm.AQ62.Open;
 dm.AQ6011.Open;
 dm.AQ106011.Open;
 dm.AQ179.Open;
                           //允许修改货币
 if dm.aq192custciship.Value='Y' then  bitbtn9.Enabled:=false;
end;

procedure TForm2.BitBtn8Click(Sender: TObject);
begin
 try
  shipmethod_form:=tshipmethod_form.Create(application);
 shipmethod_form.adoquery1.Close;
 shipmethod_form.adoquery1.Parameters[0].Value:=strtoint(form2.lab_rkey10.Caption);
 shipmethod_form.adoquery1.Open;
  if shipmethod_form.ADOQuery1.IsEmpty then
   begin
    messagedlg('对不起!没有找到数据!',mtinformation,[mbok],0);
    edit12.SetFocus;
    exit;
   end;
  if shipmethod_form.ShowModal=mrok then
   edit12.Text := trim(shipmethod_form.ADOQuery1.fieldvalues['description']);
 finally
  shipmethod_form.free;
 end;
end;

procedure TForm2.BitBtn7Click(Sender: TObject);
begin
 try
 form_address:=tform_address.Create(application);
 with form_address.ADOQuery1 do
  begin
   if active=true then active:=false;
   sql.Clear;
   sql.Add('select rkey,location,ship_to_address_1,state,zip,SHIP_CTAX_PTR,');
   sql.Add('SHIP_TO_CONTACT,SHIP_TO_PHONE,SHIP_SHIPPING_METHOD,SHIP_FOB,');
   sql.Add('STATE_SHIP_TAX_FLAG,STATE_PROD_TAX_FLAG,STATE_TOOL_TAX_FLAG,SHIP_LEAD_TIME');
   sql.Add('from data0012 where customer_ptr='+lab_rkey10.Caption);
   sql.Add('order by location');
   active:=true;
  end;
  form_address.Edit1.Text:=trim(edit10.Text);
  if form_address.ADOQuery1.IsEmpty then
   begin
    messagedlg('没有找到符合条件记录!',mtinformation,[mbok],0);
    edit10.SetFocus;
   end
  else
   if form_address.ShowModal=mrok then
    begin
     edit10.Text:=form_address.ADOQuery1.fieldbyname('location').AsString;
     edit10.Font.Color:=clwindowtext;
     lab_rkey12.Caption:=form_address.ADOQuery1.fieldbyname('rkey').AsString;
     edit11.Text:=form_address.ADOQuery1.fieldbyname('ship_to_contact').AsString;
     edit12.Text:=form_address.ADOQuery1.fieldbyname('ship_shipping_method').AsString;
     edit13.Text:=form_address.ADOQuery1.fieldbyname('ship_to_phone').AsString;
     label49.Caption:=form_address.ADOQuery1.fieldbyname('ship_lead_time').AsString;
      WITH DM.ADOQuery2 DO
       begin                  //查找增值税标识
         if active=true then active:=false;
         sql.Clear;
         sql.Add('select state_id,state_tax from data0189');
         sql.Add('where rkey='+form_address.ADOQuery1.fieldbyname('SHIP_CTAX_PTR').AsString);
         active:=true;
         edit1.Text:=fieldbyname('state_id').AsString;
         edit2.Text:=formatfloat('0.00',fieldvalues['state_tax']);
         tax:=fieldvalues['state_tax'];
       end;
     IF form_address.ADOQuery1.FieldValues['STATE_PROD_TAX_FLAG']='Y' then
      checkbox2.Checked:=true
     else
      checkbox2.Checked:=false;
     IF form_address.ADOQuery1.FieldValues['STATE_TOOL_TAX_FLAG']='Y' then
      checkbox3.Checked:=true
     else
      checkbox3.Checked:=false;
     EDIT11.SetFocus;
    end;
 finally
  form_address.free;
 end;
end;

procedure TForm2.Edit10Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn7') then
try
 form_address:=tform_address.Create(application);
 with form_address.ADOQuery1 do
  begin
   if active=true then active:=false;
   sql.Clear;
   sql.Add('select rkey,location,ship_to_address_1,state,zip,SHIP_CTAX_PTR,');
   sql.Add('SHIP_TO_CONTACT,SHIP_TO_PHONE,SHIP_SHIPPING_METHOD,SHIP_FOB,');
   sql.Add('STATE_SHIP_TAX_FLAG,STATE_PROD_TAX_FLAG,STATE_TOOL_TAX_FLAG,ship_lead_time');
   sql.Add('from data0012 where customer_ptr='+lab_rkey10.Caption);
   sql.Add('order by location');
   active:=true;
  end;
 form_address.Edit1.Text:=edit10.Text;
 if (comparetext(trim(edit10.Text),trim(form_address.ADOQuery1.Fieldbyname('location').AsString))=0) then
  begin
   if (lab_rkey12.Caption<>form_address.ADOQuery1.fieldbyname('rkey').AsString) then
   begin
   lab_rkey12.Caption:=form_address.ADOQuery1.fieldbyname('rkey').AsString;
   edit11.Text:=form_address.ADOQuery1.fieldbyname('ship_to_contact').AsString;
   edit12.Text:=form_address.ADOQuery1.fieldbyname('ship_shipping_method').AsString;
   edit13.Text:=form_address.ADOQuery1.fieldbyname('ship_to_phone').AsString;
   label49.Caption:=form_address.ADOQuery1.fieldbyname('ship_lead_time').AsString;
   IF form_address.ADOQuery1.FieldValues['STATE_PROD_TAX_FLAG']='Y' then
    checkbox2.Checked:=true
   else
    checkbox2.Checked:=false;
   IF form_address.ADOQuery1.FieldValues['STATE_TOOL_TAX_FLAG']='Y' then
    checkbox3.Checked:=true
   else
    checkbox3.Checked:=false;
   WITH DM.ADOQuery2 DO
    begin
     active:=false;
     sql.Clear;
     sql.Add('select state_id,state_tax from data0189');
     sql.Add('where rkey='+form_address.ADOQuery1.fieldbyname('SHIP_CTAX_PTR').AsString);
     active:=true;
     edit1.Text:=fieldbyname('state_id').AsString;
     edit2.Text:=formatfloat('0.00',fieldvalues['state_tax']);
     tax:=fieldvalues['state_tax'];
    end;
   end;
   edit10.Font.Color:=clwindowtext;
  end
 else
  begin
   messagedlg('装运地点不正确,请重新输入或选择',mtinformation,[mbok],0);
   edit10.SetFocus;
   exit;
  end;
 finally
  form_address.free;
 end;
end;

procedure TForm2.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',edit9.Text)>0  then abort;
end;

procedure TForm2.Edit9Exit(Sender: TObject);
begin
if edit9.Text = '' then edit9.Text := '0';
 edit9.Text := formatfloat('0.00000000',strtofloat(edit9.Text));
end;

procedure TForm2.add_sinClick(Sender: TObject);
var
 v_row:integer;
 i:word;
begin
try
  form3:=tform3.Create(application);
  dm.AQ04.Close;
  dm.AQ04.Open;
  form3.MaskEdit2.Text := datetostr(getsystem_date(DM.ADOQuery5,1)+self.shelf_life); //计划装运
  form3.maskedit1.Text := datetostr(strtodate(form3.maskedit2.text)+strtoint(label49.caption));
  form3.MaskEdit3.Text :=form3.maskedit1.Text;
 if not quote_flag then       //不与报价单关联
  begin
   form3.edit3.Text := form3.label35.Caption;      //价格pcs
   form3.Edit18.Text:=formatfloat('0.00000000',strtofloat(form3.edit3.Text)*self.set_qty);  //价格set
  end;
//  get_repname();//得到销售代表及拥金比例  (取消102表，取消该代码)
//------------------------------------------------------------------------------
  if trim(lab_rkey97.Caption) = '' then//如果本次销售定单为新开客户采购号
   begin                               //so从data0004中取值
    form3.edit1.text := trim(dm.AQ04.FieldValues['seed_value']);
    label50.Caption:='1';
    v_row := stringgrid1.RowCount-1;
    if v_row<10 then
     form3.edit1.text := form3.edit1.text+'-0'+inttostr(v_row)
    else
     form3.edit1.text := form3.edit1.text+'-'+inttostr(v_row);
   end
  else             //如果本次采购号为原来的老采购号
   begin
    with dm.ADOQuery3 do
    begin
     active:=false;
     sql.Clear;
     sql.Add('select sales_order,part_price from data0060');
     sql.Add('where cust_part_ptr='+lab_rkey50.Caption);
     sql.Add('and purchase_order_ptr='+lab_rkey97.Caption);
     sql.Add('order by sales_order');
     active:=true;
     if not IsEmpty then        //如果同一采购号同一部品以前卖过so从自身取值
     begin                     //上一次采购订单/部件价格
      Last;                     //得到最新so
      form3.Label36.Caption := formatfloat('0.00000',fieldvalues['part_price']);
      form3.edit1.text := trim(dm.AQ04.FieldValues['seed_value']);
      label50.Caption:='1';
 //     form3.edit1.text:=copy(fieldvalues['sales_order'],1,pos('-',fieldvalues['sales_order'])-1);
      if stringgrid1.RowCount<=2 then   //开始单条新增
       begin
        v_row :=stringgrid1.RowCount-1;  //strtoint(trim(copy(fieldvalues['sales_order'],pos('-',fieldvalues['sales_order'])+1,2)))+1;
        if v_row<10 then
         form3.edit1.text:=form3.edit1.text+'-0'+inttostr(v_row)
        else
         form3.edit1.text:=form3.edit1.text+'-'+inttostr(v_row);
       end
      else     //在原来已经新增的基础上新增
       begin
        v_row := strtoint(trim(copy(stringgrid1.Cells[0,stringgrid1.rowcount-2],
        pos('-',stringgrid1.Cells[0,stringgrid1.rowcount-2])+1,2)))+1;
        if v_row<10 then
         form3.edit1.text:=form3.edit1.text+'-0'+inttostr(v_row)
        else
         form3.edit1.text:=form3.edit1.text+'-'+inttostr(v_row);
       end;
     end
    else      //如果同一采购号同一部品以前没有卖过so也从data0004中取值
     begin
      form3.edit1.text := trim(dm.AQ04.FieldValues['seed_value']);
      label50.Caption:='1';
      v_row := stringgrid1.RowCount-1;
       if v_row<10 then
        form3.edit1.text:=form3.edit1.text+'-0'+inttostr(v_row)
       else
        form3.edit1.text:=form3.edit1.text+'-'+inttostr(v_row)
     end;
    end;
   end;

 if form3.ShowModal=mrok then
  begin
   stringgrid1.Cells[0,stringgrid1.RowCount-1]:=form3.edit1.text;
   save_so();     //保存数据
   for i:=1 to form3.StringGrid1.rowcount-2 do
    if (strtofloat(form3.StringGrid1.Cells[1,i])>0) or
       (strtofloat(form3.StringGrid1.Cells[2,i])>0) or
       (strtofloat(form3.StringGrid1.Cells[3,i])>0) then
     begin        //暂时保存新增定单工具费用
      dm.aQ62.Append;
      dm.aQ62.Fieldvalues['so_ptr'] := stringgrid1.RowCount-1;
      dm.aQ62.FieldByName('addl_cat_ptr').asstring := form3.StringGrid1.Cells[5,i];
      dm.AQ62.FieldByName('amount').asstring := form3.StringGrid1.Cells[1,i];
      dm.AQ62.FieldByName('free_amount').asstring := form3.StringGrid1.Cells[2,i];
      dm.AQ62.FieldByName('costfree_amount').asstring := form3.StringGrid1.Cells[3,i];
      dm.AQ62TAX_FLAG.Value:=form3.StringGrid1.Cells[4,i];
      dm.AQ62.post;
     end;

   stringgrid1.RowCount:=stringgrid1.RowCount+1;
   if stringgrid1.RowCount>2 then
    begin
     bitbtn1.Enabled:=true;
     edit3.Enabled:=false;
     edit4.Enabled:=false;
     edit6.Enabled:=false;
     edit10.Enabled:=false;
     bitbtn4.Enabled:=false;
     bitbtn5.Enabled:=false;
     bitbtn6.Enabled:=false;
     bitbtn7.Enabled:=false;
     combobox2.Enabled:=false;
     radiogroup1.Enabled:=false;
     checkbox1.Enabled:=false;
    end;
  end;
finally
 form3.free;
end;
end;

procedure TForm2.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
 if trim(edit3.Text)='' then
  begin
   messagedlg('请输入正确的客户!',mtwarning,[mbok],0);
   edit3.SetFocus;
   exit;
  end;
 if trim(edit4.Text)='' then
  begin
   messagedlg('请输入正确的板号!',mtwarning,[mbok],0);
   edit4.SetFocus;
   exit;
  end;
 if trim(edit6.text)=''  then
  begin
   messagedlg('请输入正确的采购定单号!',mtwarning,[mbok],0);
   edit6.SetFocus;
   exit;
  end;
 if trim(edit10.Text)='' then
  begin
   messagedlg('请输入正确的装运地点!',mtwarning,[mbok],0);
   edit10.SetFocus;
   exit;
  end;
  stringgrid1.MouseToCell(x,y,column,row);
  if row<>0 then stringgrid1.Row:=row;
 end;
end;

procedure TForm2.Edit9Click(Sender: TObject);
begin
 EDIT9.SelectAll;
end;

procedure TForm2.edit_soClick(Sender: TObject);
var
i:byte;
begin
 try
  form3:=Tform3.Create(Application);
//  if stringgrid1.Cells[25,stringgrid1.Row]<>'' then
//  begin
//    Form3.Edit2.ReadOnly:=True;
//  end;
  dm.AQ62.Filter:='so_ptr = '+inttostr(stringgrid1.Row);  //工具费用
  dm.AQ62.First;
  while not dm.AQ62.Eof do
   begin
    for i:=1 to form3.StringGrid1.RowCount-2 do
     if strtoint(form3.StringGrid1.Cells[5,i])=dm.aq62.fieldbyname('addl_cat_ptr').AsInteger then
      begin
       form3.stringgrid1.Cells[1,i]:=formatfloat('0.000',dm.AQ62.FieldValues['amount']);
       form3.stringgrid1.Cells[2,i]:=formatfloat('0.000',dm.AQ62.FieldValues['free_amount']);
       form3.stringgrid1.Cells[3,i]:=formatfloat('0.000',dm.AQ62.FieldValues['costfree_amount']);
       form3.stringgrid1.Cells[4,i]:=dm.AQ62TAX_FLAG.Value;
       break;
      end;
     dm.AQ62.Next;
   end;
  {dm.AQ102.Filter:='sales_order_ptr = '+inttostr(stringgrid1.Row);  //so跟进人员
   dm.AQ102.First;
   while not dm.AQ102.Eof do
    begin
     with dm.ADOQuery3 do
      begin           //定单跟进人员赋值
       if active=true then active:=false;
       sql.Clear;
       sql.Add('select rep_code,sales_rep_name from data0009');
       sql.Add('where rkey='+dm.AQ102.fieldbyname('sales_rep_ptr').AsString);
       active:=true;
       form3.StringGrid2.Cells[0,form3.StringGrid2.RowCount-1]:=fieldvalues['rep_code'];
       form3.StringGrid2.Cells[1,form3.StringGrid2.RowCount-1]:=fieldvalues['sales_rep_name'];
       form3.StringGrid2.Cells[2,form3.StringGrid2.RowCount-1]:=formatfloat('0.00',dm.AQ102.FieldValues['commission']);
       form3.StringGrid2.Cells[3,form3.StringGrid2.RowCount-1]:=formatfloat('0.00',dm.AQ102.FieldValues['credit']);
       form3.StringGrid2.Cells[4,form3.StringGrid2.RowCount-1]:=dm.AQ102.fieldbyname('sales_rep_ptr').AsString;
       form3.StringGrid2.RowCount:=form3.StringGrid2.RowCount+1;
      end;
      dm.AQ102.Next;
    end;  }
   form3.edit1.Text := stringgrid1.Cells[0,stringgrid1.Row];
  if trim(stringgrid1.Cells[1,stringgrid1.Row])<>'' then
   begin
    form3.edit10.Text := stringgrid1.Cells[1,stringgrid1.Row];
    form3.Label_qteptr.Caption := stringgrid1.Cells[13,stringgrid1.Row];
   end;
   form3.edit2.Text := stringgrid1.Cells[2,stringgrid1.Row];
   form3.edit3.Text := stringgrid1.Cells[3,stringgrid1.Row];
   form3.edit9.Text := stringgrid1.Cells[4,stringgrid1.Row];
   form3.edit5.Text := stringgrid1.Cells[5,stringgrid1.Row];
   form3.ComboBox2.Text :=stringgrid1.Cells[6,stringgrid1.Row];
   form3.maskedit1.Text := stringgrid1.Cells[7,stringgrid1.Row];
   form3.maskedit2.Text := stringgrid1.Cells[8,stringgrid1.Row];

   form3.maskedit3.Text := stringgrid1.Cells[10,stringgrid1.Row]; //客户原始交期
   form3.edit4.Text:=stringgrid1.Cells[11,stringgrid1.Row];      //分析代码4
   form3.edit7.Text:=stringgrid1.Cells[12,stringgrid1.Row];      //分析代码5


   { if stringgrid1.Cells[10,stringgrid1.Row]='1' then
    form3.CheckBox1.Checked:=true
   else
    form3.CheckBox1.Checked:=false;
   form3.edit7.Text := stringgrid1.Cells[11,stringgrid1.Row];
   form3.edit8.Text := stringgrid1.Cells[12,stringgrid1.Row];
}
   form3.edit11.text := stringgrid1.Cells[14,stringgrid1.Row];
   form3.edit12.text := stringgrid1.Cells[15,stringgrid1.Row];
   form3.edit13.text := stringgrid1.Cells[16,stringgrid1.Row];
   form3.edit16.text := stringgrid1.Cells[17,stringgrid1.Row]; //set数量
   form3.edit18.text := stringgrid1.Cells[18,stringgrid1.Row];  //set价格
   form3.Label33.Caption := stringgrid1.Cells[19,stringgrid1.Row]; //工具费用

   //下面为不存入数据库的值
   form3.Label30.Caption := stringgrid1.Cells[20,stringgrid1.Row]; //价格合计
   form3.Label16.Caption := stringgrid1.Cells[21,stringgrid1.Row]; //税金
   form3.Label31.Caption := stringgrid1.Cells[9,stringgrid1.Row]; //工具税金
   form3.Label32.Caption := stringgrid1.Cells[22,stringgrid1.Row]; //折哲
   form3.Label34.Caption := stringgrid1.Cells[23,stringgrid1.Row]; //总合计
   form3.Label41.Caption := stringgrid1.Cells[24,stringgrid1.Row]; //面积

   Form3.FBp06_ptr := stringgrid1.Cells[26,stringgrid1.Row]; //BOM报价单指针
   Form3.FBomBuHanShuiJiaGe := stringgrid1.Cells[27,stringgrid1.Row]; //BOM报价不含税价格

  if form3.ShowModal=mrok then
   begin
    bitbtn1.Enabled:=true;
    dm.AQ62.First;
    while not dm.AQ62.Eof do   dm.AQ62.Delete;
     dm.AQ102.First;
    while not dm.AQ102.Eof do  dm.AQ102.Delete;
   label44.Caption:=formatfloat
   ('0.0000',strtofloat(label44.Caption)-strtofloat(stringgrid1.Cells[20,stringgrid1.Row]));
   label61.Caption:=formatfloat
   ('0.000',strtofloat(label61.Caption)-strtofloat(stringgrid1.Cells[21,stringgrid1.Row]));
   label46.Caption:=formatfloat
   ('0.000',strtofloat(label46.Caption)-strtofloat(stringgrid1.Cells[22,stringgrid1.Row]));
   label47.Caption:=formatfloat
   ('0.0000',strtofloat(label47.Caption)-strtofloat(stringgrid1.Cells[19,stringgrid1.Row]));
   label63.Caption:=formatfloat
   ('0.0000',strtofloat(label63.Caption)-strtofloat(stringgrid1.Cells[9,stringgrid1.Row]));
   label48.Caption:=formatfloat
   ('0.0000',strtofloat(label48.Caption)-strtofloat(stringgrid1.Cells[23,stringgrid1.Row]));
   label60.Caption:=formatfloat
   ('0.0000',strtofloat(label60.Caption)-strtofloat(stringgrid1.Cells[24,stringgrid1.Row]));

   for i:=1 to form3.StringGrid1.rowcount-2 do
    if (strtofloat(form3.StringGrid1.Cells[1,i])>0) or
       (strtofloat(form3.StringGrid1.Cells[2,i])>0) or
       (strtofloat(form3.StringGrid1.Cells[3,i])>0) then
     begin          //暂时保存新增定单工具费用
      dm.aQ62.Append;
      dm.aQ62.Fieldvalues['so_ptr'] := stringgrid1.Row;
      dm.AQ62.FieldByName('amount').asstring := form3.StringGrid1.Cells[1,i];
      dm.AQ62.FieldByName('free_amount').asstring := form3.StringGrid1.Cells[2,i];
      dm.AQ62.FieldByName('costfree_amount').asstring := form3.StringGrid1.Cells[3,i];
      dm.aQ62.FieldByName('addl_cat_ptr').asstring := form3.StringGrid1.Cells[5,i];
      dm.AQ62TAX_FLAG.Value:=form3.StringGrid1.Cells[4,i];
      dm.AQ62.post;
     end;
   for i:=1 to form3.StringGrid2.RowCount-2 do
     begin           //暂时保存定单销售跟进人员
      dm.AQ102.Append;
      dm.AQ102.FieldByName('sales_rep_ptr').AsString := form3.StringGrid2.Cells[4,i];
      dm.AQ102.Fieldvalues['sales_order_ptr'] := stringgrid1.Row;
      dm.AQ102.FieldByName('commission').AsString := form3.StringGrid2.Cells[2,i];
      dm.AQ102.FieldByName('credit').AsString := form3.StringGrid2.Cells[3,i];
      dm.AQ102.Post;
     end;
   stringgrid1.Cells[0,stringgrid1.Row]:=form3.edit1.Text;
  if trim(form3.edit10.Text)<>'' then
   begin
    stringgrid1.Cells[1,stringgrid1.Row]:=form3.edit10.Text;
    stringgrid1.Cells[13,stringgrid1.Row]:=form3.Label_qteptr.Caption;
   end;
   stringgrid1.Cells[2,stringgrid1.Row]:=form3.edit2.Text;
   stringgrid1.Cells[3,stringgrid1.Row]:=form3.edit3.Text;
   stringgrid1.Cells[4,stringgrid1.Row]:=form3.edit9.Text;
   stringgrid1.Cells[5,stringgrid1.Row]:=form3.edit5.Text;
   stringgrid1.Cells[6,stringgrid1.Row]:=form3.ComboBox2.Text;
   stringgrid1.Cells[7,stringgrid1.Row]:=form3.maskedit1.Text;
   stringgrid1.Cells[8,stringgrid1.Row]:=form3.maskedit2.Text;

   stringgrid1.Cells[10,stringgrid1.Row]:= form3.maskedit3.Text; //客户原始交期
   stringgrid1.Cells[11,stringgrid1.Row]:= form3.edit4.Text;      //分析代码4
   stringgrid1.Cells[12,stringgrid1.Row]:= form3.edit7.Text;      //分析代码5

   { if form3.CheckBox1.Checked then
     stringgrid1.Cells[10,stringgrid1.Row]:='1'
   else
     stringgrid1.Cells[10,stringgrid1.Row]:='0';
   stringgrid1.Cells[11,stringgrid1.Row]:=form3.edit7.Text;
   stringgrid1.Cells[12,stringgrid1.Row]:=form3.edit8.Text;
   }
   stringgrid1.Cells[14,stringgrid1.Row]:=form3.edit11.text;
   stringgrid1.Cells[15,stringgrid1.Row]:=form3.edit12.text;
   stringgrid1.Cells[16,stringgrid1.Row]:=form3.edit13.text;
   stringgrid1.Cells[17,stringgrid1.Row]:=form3.edit16.text;    //set数量
   stringgrid1.Cells[18,stringgrid1.Row]:=form3.edit18.text;    //set价格
   stringgrid1.Cells[19,stringgrid1.Row]:=form3.Label33.Caption; //工具费用
   //下面为不存入数据库的值
   stringgrid1.Cells[20,stringgrid1.Row]:=form3.Label30.Caption; //价格合计
   stringgrid1.Cells[21,stringgrid1.Row]:=form3.Label16.Caption; //税金
   stringgrid1.Cells[9,stringgrid1.Row]:=form3.label31.caption; //工具税金
   stringgrid1.Cells[22,stringgrid1.Row]:=form3.Label32.Caption; //折扣
   stringgrid1.Cells[23,stringgrid1.Row]:=form3.Label34.Caption; //总合计
   stringgrid1.Cells[24,stringgrid1.Row]:=form3.Label41.Caption; //面积

  StringGrid1.Cells[26,StringGrid1.RowCount-1]:= Form3.FBp06_ptr;   //bom报价关联
  StringGrid1.Cells[27,StringGrid1.RowCount-1]:= Form3.FBomBuHanShuiJiaGe;   //bom不含税价格

   //下面为显示在本页的所有so合计内容
   label44.Caption:=formatfloat
   ('0.0000',strtofloat(label44.Caption)+strtofloat(stringgrid1.Cells[20,stringgrid1.Row]));
   label61.Caption:=formatfloat
   ('0.000',strtofloat(label61.Caption)+strtofloat(stringgrid1.Cells[21,stringgrid1.Row]));
   label46.Caption:=formatfloat
   ('0.000',strtofloat(label46.Caption)+strtofloat(stringgrid1.Cells[22,stringgrid1.Row]));
   label47.Caption:=formatfloat
   ('0.0000',strtofloat(label47.Caption)+strtofloat(stringgrid1.Cells[19,stringgrid1.Row]));
   label63.Caption:=formatfloat
   ('0.0000',strtofloat(label63.Caption)+strtofloat(stringgrid1.Cells[9,stringgrid1.Row]));
   label48.Caption:=formatfloat
   ('0.0000',strtofloat(label48.Caption)+strtofloat(stringgrid1.Cells[23,stringgrid1.Row]));
   label60.Caption:=formatfloat
   ('0.0000',strtofloat(label60.Caption)+strtofloat(stringgrid1.Cells[24,stringgrid1.Row]));
   end;
 finally
  form3.Free;
 end;
end;

procedure TForm2.StringGrid1DblClick(Sender: TObject);
begin
if stringgrid1.Cells[0,stringgrid1.Row]<>'' then
 edit_soclick(sender);
end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
 if stringgrid1.Row=stringgrid1.RowCount-1 then
  begin
   del_so.Enabled := false;
   edit_so.Enabled := false;
   so_note.Enabled := false;
   conf_note.Enabled := false;
   ship_note.Enabled := false;
  end
 else
  begin
   del_so.Enabled := true;
   edit_so.Enabled := true;
   so_note.Enabled := true;
   conf_note.Enabled := true;
   ship_note.Enabled := true;
  end;
end;

procedure TForm2.del_soClick(Sender: TObject);
var
 i:word;
 v_so:string;
begin
 dm.AQ62.Filter:='so_ptr = '+inttostr(stringgrid1.Row);  //删除对应工具费用
 dm.AQ62.First;
 while not dm.AQ62.Eof do dm.AQ62.Delete;

{ dm.AQ102.Filter:='sales_order_ptr = '+inttostr(stringgrid1.Row);  //删除对应so跟进人员
 dm.AQ102.First;
 while not dm.AQ102.Eof do dm.AQ102.Delete;  }

 dm.AQ6011.Filter:='file_pointer = '+inttostr(stringgrid1.row);   //删除对应销信定单记事本
 if not dm.AQ6011.IsEmpty then dm.AQ6011.Delete;

 dm.AQ106011.Filter:='file_pointer = '+inttostr(stringgrid1.row); //删除对应确认定单记事本
 if not dm.AQ106011.IsEmpty then dm.AQ106011.Delete;

 dm.AQ179.Filter:='so_ptr = '+inttostr(stringgrid1.row);  //删除对应装运记事本
 if not dm.AQ179.IsEmpty then dm.AQ179.Delete;

 label44.Caption:=formatfloat
 ('0.000',strtofloat(label44.Caption)-strtofloat(stringgrid1.Cells[20,stringgrid1.Row]));
 label61.Caption:=formatfloat
 ('0.000',strtofloat(label61.Caption)-strtofloat(stringgrid1.Cells[21,stringgrid1.Row]));
 label46.Caption:=formatfloat
 ('0.000',strtofloat(label46.Caption)-strtofloat(stringgrid1.Cells[22,stringgrid1.Row]));
 label47.Caption:=formatfloat
 ('0.000',strtofloat(label47.Caption)-strtofloat(stringgrid1.Cells[19,stringgrid1.Row]));
 label48.Caption:=formatfloat
 ('0.0000',strtofloat(label48.Caption)-strtofloat(stringgrid1.Cells[23,stringgrid1.Row]));
 label60.Caption:=formatfloat
 ('0.0000',strtofloat(label60.Caption)-strtofloat(stringgrid1.Cells[24,stringgrid1.Row]));

 if stringgrid1.Row=stringgrid1.RowCount-2 then //如果是最后一行
  stringgrid1.Rows[stringgrid1.row].Clear
 else                                          //如果删除中间行下面的so号要改
  for i:= stringgrid1.row to stringgrid1.RowCount-2 do
   begin
    v_so:=stringgrid1.Cells[0,i];
    stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
    if i<>stringgrid1.RowCount-2 then
     stringgrid1.Cells[0,i]:=v_so;
   end;
   dm.AQ62.Filter:='so_ptr >= '+inttostr(stringgrid1.Row);
   dm.AQ62.First;                //修改工具费用指针
   while not dm.AQ62.Eof do
    begin
     dm.AQ62.Edit;
     dm.aQ62.Fieldvalues['so_ptr'] :=dm.aQ62.Fieldvalues['so_ptr']-1;
     dm.AQ62.Post;
     dm.AQ62.Next;
    end;
   dm.AQ102.Filter:='sales_order_ptr >= '+inttostr(stringgrid1.Row);  //修改销售代表指针
   dm.AQ102.First;
   while not dm.AQ102.Eof do
    begin
     dm.AQ102.Edit;
     dm.aQ102.Fieldvalues['sales_order_ptr'] :=dm.aQ102.Fieldvalues['sales_order_ptr']-1;
     dm.AQ102.Post;
     dm.AQ102.Next;
    end;
   dm.AQ6011.Filter:='file_pointer >= '+inttostr(stringgrid1.row);   //修改对应销信定单记事本
   while not dm.AQ6011.Eof do
    begin
     dm.AQ6011.Edit;
     dm.AQ6011.FieldValues['file_pointer'] := dm.AQ6011.FieldValues['file_pointer']-1;
     dm.AQ6011.Post;
     dm.AQ6011.Next;
    end;
   dm.AQ106011.Filter:='file_pointer >= '+inttostr(stringgrid1.row); //修改对应确认定单记事本
   while not dm.AQ106011.Eof do
    begin
     dm.AQ106011.Edit;
     dm.AQ106011.FieldValues['file_pointer'] := dm.AQ106011.FieldValues['file_pointer']-1;
     dm.AQ106011.Post;
     dm.AQ106011.Next;
    end;
  dm.AQ179.Filter:='so_ptr >= '+inttostr(stringgrid1.row);  //修改对应装运记事本
   while not dm.AQ179.Eof do
    begin
     dm.AQ179.Edit;
     dm.AQ179.FieldValues['so_ptr'] := dm.AQ179.FieldValues['so_ptr']-1;
     dm.AQ179.Post;
     dm.AQ179.Next;
    end;
  stringgrid1.RowCount:=stringgrid1.RowCount-1;
  if stringgrid1.RowCount=2 then
   begin
    bitbtn1.Enabled:=false;
    edit3.Enabled:=true;
    edit4.Enabled:=true;
    edit6.Enabled:=true;
    edit10.Enabled:=true;
    bitbtn4.Enabled:=true;
    bitbtn5.Enabled:=true;
    bitbtn6.Enabled:=true;
    bitbtn7.Enabled:=true;
    combobox2.Enabled:=true;
    radiogroup1.Enabled:=true;
    checkbox1.Enabled:=true;    
   end;
end;

{procedure TForm2.BitBtn2Click(Sender: TObject);
begin
 try
  edit_note:=Tedit_note.Create(application);
  edit_note.Caption:='客户订单记事本:'+edit6.Text;
  edit_note.Memo1.Lines.Assign(po_note);
  if edit_note.ShowModal=mrok then
   po_note.Text:=edit_note.Memo1.Text;
 finally
  edit_note.free;
 end;
end;    }

procedure TForm2.add_mulClick(Sender: TObject);
var
 v_so:string;
 i,j,k,v_row:integer;
begin
 try
  form6:=Tform6.Create(application);
  dm.AQ04.Close;
  dm.AQ04.Open;
  form6.maskedit1.Text:=datetostr(getsystem_date(DM.ADOQuery5,1)+strtoint(label49.caption)+self.shelf_life);
  form6.label7.caption := '出货板方式: '+inttostr(self.set_qty);
 if form6.ShowModal=mrok then
  begin
   try
    form3:=tform3.Create(application);
    if not quote_flag then
    begin
     form3.edit3.Text:=form3.label35.Caption;      //价格pcs
     form3.Edit18.Text:=formatfloat('0.00000000',strtofloat(form3.edit3.Text)*self.set_qty);  //价格set
    end;
    form3.Edit16.Text:=form6.Edit3.Text;           //数量Set
    form3.Edit2.Text:=form6.Edit4.Text;//数量Pcs
    form3.label30.caption:=formatfloat('0.0000',strtofloat(form3.edit3.text)*
                                                strtofloat(form3.edit2.text));//价格合计
    form3.label41.Caption:=formatfloat('0.0000',strtofloat(form3.edit2.text)*form2.unit_sq);//面积
    form3.MaskEdit1.Text:=form6.MaskEdit1.Text;        //客户交期
    form3.maskedit2.Text:=datetostr(strtodate(form3.maskedit1.text)-strtoint(label49.caption));//计划交期
    form3.MaskEdit3.Text :=form3.maskedit1.Text;      //原始客户交期与计划交期一致
    form3.Edit2.Visible:=false;               //使数量不可见
    form3.Label2.Visible:=false;
    form3.MaskEdit1.Visible:=false;
    form3.MaskEdit2.Visible:=false;
    form3.Label7.Visible:=false;
    form3.Label8.Visible:=false;
    form3.Label1.Visible:=false;
    form3.Edit1.Visible:=false;
    form3.Edit16.Visible:=false;
    form3.Label26.Visible:=false;
//------------------------------------------------------------------------------
 //SELF.get_repname();//得到销售代表及拥金比例
//------------------------------------------------------------------------------
  if trim(lab_rkey97.Caption)='' then //如果本次销售定单为新开客户采购号
   begin                              //so从data0004中取值
    v_so := trim(dm.AQ04.FieldValues['seed_value']);
    label50.Caption:='1';
    v_row := stringgrid1.RowCount-1;
    if v_row<10 then
     v_so:=v_so+'-0'+inttostr(v_row)
    else
     v_so:=v_so+'-'+inttostr(v_row);
   end
   else             //如果本次采购号为原来的老采购号
   begin
    with dm.ADOQuery3 do
    begin
     if active=true then active:=false;
     sql.Clear;
     sql.Add('select sales_order,part_price from data0060');
     sql.Add('where cust_part_ptr='+lab_rkey50.Caption);
     sql.Add('and purchase_order_ptr='+lab_rkey97.Caption);
     sql.Add('order by sales_order');
     active:=true;
    if not IsEmpty then      //如果同一采购号同一部品以前卖过so从自身取值
     begin                                         //上一次采购订单/部件价格
      Last;
      form3.Label36.Caption:=formatfloat('0.0000',fieldvalues['part_price']);
      //v_so:=copy(fieldvalues['sales_order'],1,pos('-',fieldvalues['sales_order'])-1);
      v_so := trim(dm.AQ04.FieldValues['seed_value']);
      label50.Caption:='1';
      if stringgrid1.RowCount<=2 then //上语句取前缀
       begin
//        v_row := strtoint(trim(copy(fieldvalues['sales_order'],//取后缀
//              pos('-',fieldvalues['sales_order'])+1,2)))+1;
        v_row := stringgrid1.RowCount-1;
        if v_row<10 then
         v_so:=v_so+'-0'+inttostr(v_row)
        else
         v_so:=v_so+'-'+inttostr(v_row);
       end
      else
       begin
        v_row := strtoint(trim(copy(stringgrid1.Cells[0,stringgrid1.rowcount-2],
                 pos('-',stringgrid1.Cells[0,stringgrid1.rowcount-2])+1,2)))+1;
        if v_row<10 then        //取后缀
         v_so:=v_so+'-0'+inttostr(v_row)
        else
         v_so:=v_so+'-'+inttostr(v_row);
       end;
     end
    else          //如果同一采购号同一部品以前没有卖过so也从data0004中取值
     begin
      v_so := trim(dm.AQ04.FieldValues['seed_value']);
      label50.Caption:='1';
      v_row := stringgrid1.RowCount-1;
      if v_row<10 then
       v_so:=v_so+'-0'+inttostr(v_row)
      else
       v_so:=v_so+'-'+inttostr(v_row);
     end;
    end;
   end;
//------------------------------------------------------------------------------
 if form3.ShowModal=mrok then
  begin
   if strtoint(form6.Edit2.Text)>=1 then
    begin
     stringgrid1.Cells[0,stringgrid1.RowCount-1]:=v_so;
     for i:=1 to form3.StringGrid1.rowcount-2 do
     if (strtofloat(form3.StringGrid1.Cells[1,i])>0) or
        (strtofloat(form3.StringGrid1.Cells[2,i])>0) or
        (strtofloat(form3.StringGrid1.Cells[3,i])>0)  then
      begin          //暂时保存新增定单工具费用
       dm.aQ62.Append;
       dm.aQ62.Fieldvalues['so_ptr'] :=stringgrid1.RowCount-1;
       dm.AQ62.FieldByName('amount').asstring := form3.StringGrid1.Cells[1,i];
       dm.AQ62.FieldByName('free_amount').asstring := form3.StringGrid1.Cells[2,i];
       dm.AQ62.FieldByName('costfree_amount').asstring := form3.StringGrid1.Cells[3,i];
       dm.aQ62.FieldByName('addl_cat_ptr').asstring := form3.StringGrid1.Cells[5,i];
       dm.AQ62TAX_FLAG.Value:=form3.StringGrid1.Cells[4,i];
       dm.AQ62.post;
      end;
    end;

    for j:=1 to strtoint(form6.Edit2.text) do
     begin
      save_so();     //保存数据
       if j>1 then
        begin    //下语句取前缀
         v_so:=copy(stringgrid1.Cells[0,stringgrid1.RowCount-2],1,pos('-',stringgrid1.Cells[0,stringgrid1.RowCount-2])-1);
         v_row:=strtoint(copy(stringgrid1.Cells[0,stringgrid1.RowCount-2],pos('-',stringgrid1.Cells[0,stringgrid1.RowCount-2])+1,2))+1;
         if v_row<10 then  //上语句取后缀
          v_so:=v_so+'-0'+inttostr(v_row)
         else
           v_so:=v_so+'-'+inttostr(v_row);
         stringgrid1.Cells[0,stringgrid1.RowCount-1]:=v_so;
         stringgrid1.Cells[7,stringgrid1.RowCount-1]:=
           datetostr(strtodate(stringgrid1.Cells[7,stringgrid1.RowCount-2])+strtoint(form6.Edit1.Text));
         stringgrid1.Cells[8,stringgrid1.RowCount-1]:=
           datetostr(strtodate(stringgrid1.Cells[7,stringgrid1.RowCount-1])-strtoint(label49.Caption));
         label47.Caption:=formatfloat
         ('0.0000',strtofloat(label47.Caption)-strtofloat(stringgrid1.Cells[19,stringgrid1.RowCount-1]));

         label63.Caption:=formatfloat
         ('0.0000',strtofloat(label63.Caption)-strtofloat(stringgrid1.Cells[9,stringgrid1.RowCount-1]));

         if radiogroup2.ItemIndex=1 then//含税
          begin
           label48.Caption:=formatfloat
             ('0.0000',strtofloat(label48.Caption)-strtofloat(stringgrid1.Cells[19,stringgrid1.RowCount-1]));
           stringgrid1.Cells[23,stringgrid1.RowCount-1]:=formatfloat   //总计
             ('0.0000',strtofloat(stringgrid1.Cells[23,stringgrid1.RowCount-1])-
                       strtofloat(stringgrid1.Cells[19,stringgrid1.RowCount-1]));
          end
         else
          begin
           label48.Caption:=formatfloat
             ('0.0000',strtofloat(label48.Caption)-
                       strtofloat(stringgrid1.Cells[19,stringgrid1.RowCount-1])-
                       strtofloat(stringgrid1.Cells[9,stringgrid1.RowCount-1]));
           stringgrid1.Cells[23,stringgrid1.RowCount-1]:=formatfloat   //总计
             ('0.0000',strtofloat(stringgrid1.Cells[23,stringgrid1.RowCount-1])-
                       strtofloat(stringgrid1.Cells[19,stringgrid1.RowCount-1])-
                       strtofloat(stringgrid1.Cells[9,stringgrid1.RowCount-1]));
          end;
         stringgrid1.Cells[19,stringgrid1.RowCount-1]:='0.0000'; //工具费用
         stringgrid1.Cells[9,stringgrid1.RowCount-1]:='0.0000'; //工具税金
        end;
     { for k:=1 to form3.StringGrid2.RowCount-2 do
       begin           //暂时保存定单销售跟进人员
        dm.AQ102.Append;
        dm.AQ102.FieldByName('sales_rep_ptr').AsString := form3.StringGrid2.Cells[4,k];
        dm.AQ102.Fieldvalues['sales_order_ptr'] := stringgrid1.RowCount-1;
        dm.AQ102.FieldByName('commission').AsString := form3.StringGrid2.Cells[2,k];
        dm.AQ102.FieldByName('credit').AsString := form3.StringGrid2.Cells[3,k];
        dm.AQ102.Post;
       end; }
       stringgrid1.RowCount:=stringgrid1.RowCount+1;
     end;
      if  stringgrid1.RowCount>2 then
       begin
        bitbtn1.Enabled:=true;   //使保存按钮可用
        edit3.Enabled:=false;
        edit4.Enabled:=false;
        edit6.Enabled:=false;
        edit10.Enabled:=false;
        bitbtn4.Enabled:=false;
        bitbtn5.Enabled:=false;
        bitbtn6.Enabled:=false;
        bitbtn7.Enabled:=false;
        combobox2.Enabled:=false;
        radiogroup1.Enabled:=false;
        checkbox1.Enabled:=false;
       end;
      end;
    finally
     form3.Free;
    end;
   end;
 finally
  form6.free;
 end;
end;

function TForm2.find_QUOTE_FACTOR1(cust_ptr: integer): boolean;
begin
with dm.ADOQuery5 do
 begin
  close;
  sql.Text:='select QUOTE_FACTOR1 from data0010'+
           ' where rkey='+inttostr(cust_ptr);
  open;
  if fieldbyname('QUOTE_FACTOR1').AsInteger > 0 then
   result:=true        //允许连续下单
  else
   result:=false;      //不允许
 end;
end;

function TForm2.find_allqty_so(cust_ptr: integer;
  var sales_order: string): boolean;
begin
 result:=false;
 with dm.ADOQuery5 do
 begin
  close;
  sql.Text:=
  'SELECT  dbo.data0492.SO_NO'+#13+
  'FROM   dbo.Data0053 INNER JOIN'+#13+
  '  dbo.Data0006 ON dbo.Data0053.WORK_ORDER_PTR = dbo.Data0006.RKEY INNER JOIN'+#13+
  '  dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO INNER JOIN'+#13+
  '  dbo.Data0060 ON dbo.data0492.SO_NO = dbo.Data0060.SALES_ORDER'+#13+
  'WHERE   (dbo.Data0060.CUSTOMER_PTR = '+inttostr(cust_ptr)+') AND (dbo.Data0060.STATUS = 1) AND'+#13+
  '(data0060.PARTS_SHIPPED < data0060.PARTS_ORDERED) and '+#13+
  '(dbo.Data0060.so_style = 0) AND'+#13+
  '(data0060.SCH_DATE < getdate()-1) and'+#13+
  '(Data0053.QTY_ON_HAND - Data0053.QTY_ALLOC > 0)'+#13+
  'GROUP BY dbo.data0492.SO_NO'+#13+
  'union all'+#13+
  'SELECT     dbo.Data0060.SALES_ORDER as SO_NO'+#13+
  'FROM    dbo.Data0053 INNER JOIN'+#13+
  '  dbo.data0416 ON dbo.Data0053.NPAD_PTR = dbo.data0416.rkey INNER JOIN'+#13+
  '  dbo.Data0060 ON dbo.data0416.so_ptr = dbo.Data0060.RKEY'+#13+
  'WHERE     (dbo.Data0060.CUSTOMER_PTR = '+inttostr(cust_ptr)+') AND (dbo.Data0060.STATUS = 1) AND'+#13+
  '(data0060.PARTS_SHIPPED < data0060.PARTS_ORDERED) and '+#13+
  '(dbo.Data0060.so_style = 0) AND'+#13+
  '(data0060.SCH_DATE < getdate()-1) and'+#13+
  '(dbo.Data0053.QTY_ON_HAND - dbo.Data0053.QTY_ALLOC > 0)'+#13+
  'GROUP BY dbo.Data0060.SALES_ORDER';
  open;
 end;

  while not dm.ADOQuery5.Eof do
   begin
    sales_order:=dm.ADOQuery5.fieldbyname('SO_NO').AsString;

     with dm.ADOQuery2 do
      begin
       close;
       sql.Text:=
        'SELECT     dbo.Data0025.MANU_PART_NUMBER, dbo.Data0097.PO_NUMBER,'+#13+
        'SUM(dbo.Data0060.PARTS_ORDERED) AS parts_order_qty, derivedtbl_2.all_shipqty'+#13+
        'FROM         dbo.Data0060 INNER JOIN'+#13+
        '  dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN'+#13+
        '  dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER JOIN'+#13+
        '      (SELECT   CUST_PART_PTR, PURCHASE_ORDER_PTR'+#13+
        'FROM  dbo.Data0060 AS data0060_1 where SALES_ORDER='+quotedstr(sales_order)+') AS derivedtbl_1'+#13+
        '        ON dbo.Data0060.CUST_PART_PTR = derivedtbl_1.CUST_PART_PTR AND'+#13+
        '  dbo.Data0060.PURCHASE_ORDER_PTR = derivedtbl_1.PURCHASE_ORDER_PTR LEFT OUTER JOIN'+#13+
        '      (SELECT     PO_NUMBER, MANU_PART_NUMBER, SUM(all_shipqty) AS all_shipqty'+#13+
        '       FROM          dbo.Data0114'+#13+
        '        WHERE      (all_shipqty > 0) AND (TTYPE = 2)'+#13+
        '        GROUP BY PO_NUMBER, MANU_PART_NUMBER) AS derivedtbl_2'+#13+
        '        ON dbo.Data0097.PO_NUMBER = derivedtbl_2.PO_NUMBER AND'+#13+
        '  dbo.Data0025.MANU_PART_NUMBER = derivedtbl_2.MANU_PART_NUMBER'+#13+
        'WHERE     (dbo.Data0060.so_style = 0) AND (dbo.Data0060.PART_PRICE > 0)'+#13+
        'GROUP BY dbo.Data0025.MANU_PART_NUMBER, dbo.Data0097.PO_NUMBER, derivedtbl_2.all_shipqty';
       open;
       if fieldbyname('all_shipqty').AsInteger < fieldbyname('parts_order_qty').AsInteger then
        begin
         result:=true;
         break;
        end;
      end;
    dm.ADOQuery5.Next;
   end;

end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
 i:word;
 v_seed,v_last,new_seed,invoice:string;
 v_length,control_no:byte;
begin
 if trim(lab_rkey15.Caption)='0' then
  begin
   messagedlg('请输入正确的工厂代码!',mtwarning,[mbcancel],0);
   edit5.SetFocus;
   exit;
  end;
 if trim(lab_rkey50.Caption)='' then
  begin
   messagedlg('请输入正确的板号',mtwarning,[mbcancel],0);
   edit4.SetFocus;
   exit;
  end;
 if trim(edit6.Text) = '' then
  begin
   messagedlg('请输入采购定单号',mtwarning,[mbcancel],0);
   edit6.SetFocus;
   exit;
  end;
 if strtofloat(edit9.Text) = 0 then
  begin
   messagedlg('汇率输入有误!',mtwarning,[mbcancel],0);
   edit9.SetFocus;
   exit;
  end;
 if dm.aq192CUSTCOPROD.Value='Y' then
 if custinvoice_day(strtoint(self.lab_rkey10.Caption),invoice) then
  begin
   showmsg('该客户有未付款发票超过了最长延期付款天数!!!'+
   '发票编号: '+invoice,1);
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

 if find_soerror then//如果找到编号重复
  begin
   if messagedlg('销售订单编号重复,可能有多台计算机同时新增,是否自动更新编号?',mtConfirmation,
     [mbYes,mbNo],0)=mrYes  then
     edit04
   else
    exit;
  end;
  if not CheckCustCreditAmount then exit; //判断订单总金额是否超出信用额度
  
                                //款到发货，正式订单
if (label36.Caption='Y') and (combobox2.ItemIndex=0) and
   (not find_QUOTE_FACTOR1(strtoint(lab_rkey10.Caption))) then //不允许连续下单
 if find_allqty_so(strtoint(lab_rkey10.Caption),invoice) then
  begin
   showmsg('该客户有为款到发货,前期有订单已到交期有库存未交货,请让风控部解锁后下单!'+
   '订单编号: '+invoice,1);
   exit;
  end;
  AllVersion:= '';
  findOldVersion(lab_rkey50.Caption);
  if AllVersion<>'' then
  begin
    { TODO -oAdministrator -c : 显示旧版本作业单在线状况 2013-02-25 11:00:45 }
    dm.aqTmp.Close;
    dm.aqTmp.SQL.Clear;
    dm.aqTmp.SQL.Add('select Data0025.MANU_PART_NUMBER as ''本厂编号'',Data0006.WORK_ORDER_NUMBER as ''作业单号'',');
    dm.aqTmp.SQL.Add('Data0006.CUT_NO as ''配料单号'',Data0056.PO_NUMBER as ''客户订单号'',Data0034.DEPT_NAME as ''当前工序'',');
    dm.aqTmp.SQL.Add('Data0056.QTY_BACKLOG as ''在线PCS数'',Data0056.PANELS as ''在线PNL数''');
    dm.aqTmp.SQL.Add('from Data0056 inner join');
    dm.aqTmp.SQL.Add('Data0006 on Data0056.WO_PTR = Data0006.RKEY inner join');
    dm.aqTmp.SQL.Add('Data0025 on Data0006.BOM_PTR = Data0025.RKEY left join');
    dm.aqTmp.SQL.Add('Data0034 on Data0056.DEPT_PTR = Data0034.RKEY');
    dm.aqTmp.SQL.Add('where Data0025.RKEY in'+AllVersion);
    dm.aqTmp.Open;
    if dm.aqTmp.RecordCount<>0 then
    begin
      if MessageBox(Handle, 'ECN变更前旧版本有在线数量,需要查看明细吗?', '提示', MB_OKCANCEL +
        MB_ICONQUESTION) = IDOK then
      begin
        frmAllOldVersion := TfrmAllOldVersion.Create(Application);
        try
          frmAllOldVersion.ShowModal;
        finally
          frmAllOldVersion.Free;
        end;
      end;
    end;
  end;
//20170301tang判断订单在仓库中有库存并显示明细
//  with dm.aqTmp do
//  begin
//    Close;
//    SQL.Add('select t60.SALES_ORDER from data0060 t60');
//    SQL.Add('inner join data0025 t25 on t60.CUST_PART_PTR = t25.RKEY');
//    SQL.Add('inner join data0053 t53 on t53.CUST_PART_PTR = t25.RKEY');
//    SQL.Add('where t60.PARTS_ORDERED-t60.PARTS_SHIPPED>0');
//    SQL.Add('and t60.SCH_DATE<=getdate()');
//    SQL.Add('and t53.QTY_ON_HAND>0');
//    SQL.Add('and t53.barcode_ptr<>''''');
//    SQL.Add('and t25.MANU_PART_NUMBER='''+Edit4.Text+'''');
//    Open;
//  end;
  dm.Ado60_53.Close;
  dm.Ado60_53.Parameters.ParamByName('MANU_PART_NUMBER').Value:=Trim(Edit4.Text);
  dm.Ado60_53.Open;
  if dm.Ado60_53.RecordCount>0 then
  begin
    if MessageBox(Handle, '同型号订单在仓库中有库存,需要查看明细吗?', '提示', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
    begin
      frmShowStock := TfrmShowStock.Create(Application);
      try
        frmShowStock.ShowModal;
      finally
        frmShowStock.Free;
      end;
    end;
  end;
  if trim(lab_rkey97.Caption)<>'' then //使用了原有的采购订单号
  begin
    if (self.find_socongfu(strtoint(lab_rkey97.Caption),strtoint(lab_rkey50.Caption),stringgrid1.Cells[8,1],stringgrid1.Cells[2,1])) and
       (messagedlg('近30天内存在订单合同号,板号,订单数量一样的订单,有可能重复输入,是否继续?',mtconfirmation,[mbYes,mbNo],0) = mrNo) then
    begin
      pagecontrol1.ActivePage:=Tabsheet1;
      stringgrid1.SetFocus;
      exit;
    end;
  end;
//============================ 启动事物处理=====================================
 if not dm.ADOConnection1.InTransaction then dm.ADOConnection1.BeginTrans;
 if trim(lab_rkey97.Caption)<>'' then //使用了原有的采购订单号
  begin
   with dm.AQ97 do//采购定单
    begin
     if active=true then active:=false;
     sql.Clear;
     sql.Add('select rkey,open_sos,flag,dept_ptr,po_date');
     sql.Add('from data0097 where rkey='+lab_rkey97.Caption);
     active:=true;
     edit;
     fieldvalues['open_sos'] := fieldvalues['open_sos']+(stringgrid1.RowCount-2);
     fieldvalues['po_date'] := strtodate(maskedit1.Text);
     post;
    end;
  end
 else  //新增采购定单(新增合同)
  begin
   with dm.AQ97 do
    begin
     if active = true then active := false;
     sql.Clear;
     sql.Add('select * from data0097 where rkey is null');
     active:=true;
     append;
     fieldvalues['po_number'] := trim(edit6.Text);
     fieldbyname('customer_ptr').AsString := lab_rkey10.Caption;
     fieldvalues['po_date'] := strtodate(maskedit1.Text);
     fieldvalues['open_sos'] := stringgrid1.RowCount-2;
     FieldValues['dept_ptr']:=user_ptr;
     post;
     lab_rkey97.Caption := fieldbyname('rkey').asstring;
    end;
  end;
//*****************************************开始更新data0060及它的子表
  with dm.ADOQuery3 do
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select * from data0060');
    sql.Add('where cust_part_ptr='+lab_rkey50.Caption);
    sql.Add('and purchase_order_ptr='+lab_rkey97.Caption);
    sql.Add('order by ent_date desc');
    active:=true;
    for i:=1 to stringgrid1.RowCount-2 do
     begin
      append;
      fieldbyname('ship_reg_tax_id').AsString := lab_rkey15.Caption;        //工厂指针
      fieldbyname('customer_ptr').AsString := lab_rkey10.Caption;        //客户指针
      fieldbyname('cust_part_ptr').AsString := lab_rkey50.Caption;       //产品型号指针
      fieldbyname('purchase_order_ptr').AsString := lab_rkey97.Caption;  //采购定单指针
      fieldbyname('CUST_SHIP_ADDR_PTR').AsString := lab_rkey12.Caption;  //装运地址指针
      fieldbyname('CURRENCY_PTR').AsString := lab_rkey01.Caption;        //货币批针
      fieldbyname('CUSTOMER_CONTACT').AsString := combobox1.Text;        //客户联络人
      fieldbyname('EXCH_RATE').AsString := edit9.Text;                   //汇率
      fieldbyname('SHIPPING_CONTACT').AsString := edit11.Text;           //装运联络人
      fieldbyname('SHIP_CONTACT_PHONE').AsString := edit13.Text;         //装运联络人电话
      fieldbyname('SHIPPING_METHOD').AsString := edit12.Text;            //装运方法
      fieldbyname('FOB').AsString := edit7.Text;                         //离岸价格
      fieldbyname('COD_FLAG').AsString := label36.Caption;               //货到收款
      fieldbyname('reg_tax_fixed_unused').AsString := '0';   //赶工费用计算方法
      fieldbyname('CSI_USER_PTR').AsString := rkey73;      //系统用户指针
      fieldbyname('ENTERED_BY_EMPL_PTR').AsString := user_ptr; //输入人员指针
      fieldbyname('comm_assigned_by_e_p').AsString := user_ptr;//拥金指派人员
      fieldbyname('rush_charge_pct_used').AsString := label49.caption;//交货期与生产完工日期差额
      fieldbyname('so_style').AsInteger :=combobox2.ItemIndex;        //订单类别
      fieldvalues['so_tp'] := radiogroup1.ItemIndex;                  //加工形式
      fieldbyname('SO_OLDNEW').AsString :=combobox3.Text;     //订单新旧
      fieldbyname('RUSH_CHARGE').AsString := edit2.Text;     //增值税%;
      fieldbyname('COMM_ASSIGNED_BY_E_P').AsString := ywy;   //业务员
      if rkey23>0 then
       begin
        Fieldvalues['SUPPLIER_PTR']:=rkey23;  //外发指定供应商
        Fieldvalues['TAX_2']:=tax_2;  //外发供应商入库成本折率
       end;
      if checkbox2.Checked then
       fieldbyname('STATE_PROD_TAX_FLAG').AsString := 'Y'      //是否对产品征税
      else
       fieldbyname('STATE_PROD_TAX_FLAG').AsString := 'N';

      if checkbox3.Checked then
       fieldbyname('STATE_TOOL_TAX_FLAG').AsString := 'Y'      //是否对工具费用征税
      else
       fieldbyname('STATE_TOOL_TAX_FLAG').AsString := 'N';      //总合计43个字段已赋值

      if checkbox1.Checked then
       fieldbyname('COMMISION_ON_TOOLING').AsString := 'Y'      //订单是否转厂
      else
       fieldbyname('COMMISION_ON_TOOLING').AsString := 'N';

      if radiogroup2.ItemIndex = 0 then                         //价格是否含税
       fieldbyname('TAX_IN_PRICE').AsString:='N'
      else
       fieldbyname('TAX_IN_PRICE').asstring:='Y';

      fieldbyname('SALES_ORDER').AsString := stringgrid1.Cells[0,i];     //销售定单;
      fieldbyname('PARTS_ORDERED').AsString := stringgrid1.Cells[2,i];   //数量;
      FieldByName('to_be_planned').asstring := stringgrid1.Cells[2,i];   //用作计划
      FieldByName('to_be_confirmed').asstring := stringgrid1.Cells[2,i]; //用作确认
      fieldbyname('PART_PRICE').AsString := stringgrid1.Cells[3,i];      //价格;
      fieldbyname('REFERENCE_NUMBER').AsString := stringgrid1.Cells[4,i];      //参考附注
      fieldbyname('DISCOUNT').AsString := stringgrid1.Cells[5,i];        //折扣%;
      fieldbyname('P_CODE').AsString :=IntToStr(Lab283.Tag);          //优先;
      fieldbyname('ORIG_REQUEST_DATE').AsString := stringgrid1.Cells[7,i];  //客户交期
      fieldbyname('ORIG_SCHED_SHIP_DATE').AsString := stringgrid1.Cells[8,i];//计划交期
      fieldbyname('DUE_DATE').AsString := stringgrid1.Cells[10,i];         //原始客户交期
      fieldbyname('CONSUME_FORECASTS').AsString := '0';    //预测耗费
      fieldbyname('BACKWARD_DAYS').AsString := '0';        //向后天数
      fieldbyname('FORWARD_DAYS').AsString := '0';         //向前天数
      if stringgrid1.Cells[1,i]<>'' then
      fieldbyname('qte_ptr').AsString := stringgrid1.Cells[13,i];         //报价指针
      fieldbyname('ANALYSIS_CODE_1').AsString := stringgrid1.Cells[14,i];
      fieldbyname('ANALYSIS_CODE_2').AsString := stringgrid1.Cells[15,i];
      fieldbyname('ANALYSIS_CODE_3').AsString := stringgrid1.Cells[16,i];
      fieldbyname('ANALYSIS_CODE_4').AsString := stringgrid1.Cells[11,i];
      fieldbyname('ANALYSIS_CODE_5').AsString := stringgrid1.Cells[12,i];
      fieldbyname('set_ordered').AsString := stringgrid1.Cells[17,i];
      fieldbyname('set_price').AsString := stringgrid1.Cells[18,i];
      fieldbyname('TOTAL_ADD_L_PRICE').AsString := stringgrid1.Cells[19,i];    //工具费用总计
      fieldbyname('ent_date').AsString:=edit15.Text;//输入日期 系统服务器时间
      Fieldvalues['status']:=6;      //状态为未提交(040207修改)
      Fieldvalues['prod_rel']:='1';  //生产发放标记未确认的
      if StringGrid1.Cells[25,i]<>'0' then //订单预处指针保存并修改213表状态
      begin
       FieldByName('rkey213').Value:=StrToInt(StringGrid1.Cells[25,i]);
      //20161018tang修改预处理数量可以多次下单，下单数量之和=预处理数量把状态改为已下单。未下完成的单状态保持已审核
        if StringGrid1.Cells[28,i]='' then StringGrid1.Cells[28,i]:='0';
        if StringGrid1.Cells[29,i]='' then StringGrid1.Cells[29,i]:='0';
       if ((StrToInt(StringGrid1.Cells[28,i])+StrToInt(StringGrid1.Cells[2,i]))=StrToInt(StringGrid1.Cells[29,i])) then  //下单数量之和=预处理数量
       begin
         with dm.ADOQuery5 do
         begin
           Close;
           sql.Clear;
           sql.Add('update data0213 set status=2,UsedQuantity='+StringGrid1.Cells[29,i]+' where rkey='+stringgrid1.Cells[25,i]); //状态改为已下单,已使用数=预处理数量
           ExecSQL;
         end;
       end else
       begin
         with dm.ADOQuery5 do
         begin
           Close;
           sql.Clear;
           sql.Add('update data0213 set UsedQuantity='+inttostr(StrToInt(StringGrid1.Cells[28,i])+StrToInt(StringGrid1.Cells[2,i]))+' where rkey='+stringgrid1.Cells[25,i]);
           ExecSQL;
         end;
       end;
      //end 20161018-------
      end;

      FieldByName('bp06_ptr').AsString := stringgrid1.Cells[26,i];//BOM报价单关联

      if FieldByName('bp06_ptr').AsString = '' then //如果不是是BOM报价则计算不含税
      begin
        if radiogroup2.ItemIndex = 0 then                   //价格不含税
         fieldvalues['parts_alloc']:=fieldvalues['PART_PRICE']
        else
         fieldvalues['parts_alloc']:=fieldvalues['PART_PRICE']/
         (1+fieldvalues['RUSH_CHARGE']*0.01);
      end else
      //如果是BOM报价则直接取BOM报价的不含税价格
      begin
        FieldByName('parts_alloc').AsString := stringgrid1.Cells[27,i]; //BOM报价的不含税价格
      end;

      //20170614tang---添一价格
      FieldByName('PARTS_ALLOC1').AsString:=FieldByName('parts_alloc').AsString;
      fieldvalues['quote_price']:=0;      //表示so未审批(需要审批)
      fieldbyname('RemarkSO').asstring:=po_note.Text; //销售订单记事本
      fieldvalues['RemarkAudit']:=sales_note.Text; //评审记事本

      //20170322tang添60添加关联原客户字段
      if (Trim(Edit17.Text)<>'') then
      fieldbyname('ORIG_CUSTOMER').asstring:=Trim(Edit17.Text);
     //20171206tang添60添加二维码打印格式
      if (Edit18.Tag<>0) then
      fieldbyname('Print2DKey').Value:=Edit18.Tag;
       
     {//jacky zhong 2015-11-14 默认要提交
      if v_part_num=0 then //量板
       if dm.aq192aptaxontax.Value='Y' then//量板需要审批
        fieldvalues['quote_price']:=0      //表示so未审批(需要审批)
       else                                //量板不需审批
        begin
         fieldvalues['quote_price']:=3;    //表示SO已不需要评审
         Fieldvalues['status']:=1;         //无需提交
         fieldbyname('SCH_DATE').AsString := stringgrid1.Cells[8,i];//回复交期
        end
      else//样板
       if dm.aq192artaxontax.Value = 'Y' then //样板需要审批
        fieldvalues['quote_price']:=0         //表示SO未审批(需要审批）
       else
        begin
         fieldvalues['quote_price']:=3;     //表示SO不需评审
         Fieldvalues['status']:=1;          //无需提交
         fieldbyname('SCH_DATE').AsString := stringgrid1.Cells[8,i];//回复交期
        end;}
      try
       post;
      except
       on E: Exception do
        begin
          dm.ADOConnection1.RollbackTrans;
          messagedlg(E.Message,mterror,[mbcancel],0);
          exit;
        end;
//       messagedlg('数据保存失败,可能是有其它用户同时操作而且在你之前提交,请稍后再试!',mtwarning,[mbok],0);
//       exit;
      end;

      dm.AQ62.Filter:='so_ptr = '+inttostr(i); //修改对应so工具费用指针
      dm.AQ62.First;
      while not dm.AQ62.Eof do
       begin
        dm.AQ62.Edit;
        dm.AQ62.FieldValues['so_ptr']:=fieldvalues['rkey'];
        dm.AQ62.Post;
        if fieldvalues['rkey']=i then dm.AQ62.Next;
       end;

//      dm.AQ102.Filter:='sales_order_ptr = '+inttostr(i);  //修改对应so跟进人员指针
//      dm.AQ102.First;
//      while not dm.AQ102.Eof do
//       begin
//        dm.AQ102.Edit;
//        dm.AQ102.FieldValues['sales_order_ptr'] := fieldvalues['rkey'];
//        dm.AQ102.Post;
//        if fieldvalues['rkey']=i then dm.AQ102.Next;
//       end;

//       dm.AQ6011.Filter:='file_pointer = '+inttostr(i);   //修改对应销信定单记事本指针
//       if not dm.AQ6011.IsEmpty then
//        begin
//         dm.AQ6011.Edit;
//         dm.AQ6011.FieldValues['file_pointer'] := fieldvalues['rkey'];
//         dm.AQ6011.Post;
//        end;
//
//       dm.AQ106011.Filter:='file_pointer = '+inttostr(i); //修改对应评审订单记事本指针
//       if not dm.AQ106011.IsEmpty then
//        begin
//         dm.AQ106011.Edit;
//         dm.AQ106011.FieldValues['file_pointer'] := fieldvalues['rkey'];
//         dm.AQ106011.Post;
//        end;

       dm.AQ179.Filter:='so_ptr = '+inttostr(i);  //修改对应装运记事本指针
       dm.AQ179.First;
       if not dm.AQ179.IsEmpty then
        begin
         dm.AQ179.Edit;
         dm.AQ179.FieldValues['so_ptr'] := fieldvalues['rkey'];
         dm.AQ179.Post;
        end;

      dm.ADO360.Close;
      dm.ADO360.Parameters[0].Value:=fieldvalues['rkey'];
      dm.ADO360.Open;
      dm.ADO360.Append;
      dm.ADO360so_ptr.Value:=fieldvalues['rkey'];
      dm.ADO360quantity.Value:=fieldvalues['PARTS_ORDERED'];
      dm.ADO360sch_date.Value:=fieldvalues['ORIG_SCHED_SHIP_DATE'];
      dm.ADO360.Post;

     end;
   end;
//======================             //款到发票允许连续下单
if (label36.Caption='Y') and (find_QUOTE_FACTOR1(strtoint(lab_rkey10.Caption))) then
  with dm.ADOQuery5 do
   begin
     close;
     sql.Text:='update data0010 set QUOTE_FACTOR1=0 where rkey='+lab_rkey10.Caption;
     ExecSQL;
   end;
//==============================================================================
  //20161219tang改---
  with dm.Aupdate50 do
   begin
    close;
    Parameters[0].Value :=dm.ADOQuery3.FieldValues['CUST_PART_PTR'];
    open;
    edit;
    if ((dm.ADOQuery3.Fieldbyname('PART_PRICE').AsCurrency<>0) and (dm.ADOQuery3.FieldByName('so_style').AsInteger=0)) then 
     if radiogroup2.ItemIndex = 0 then
      dm.Aupdate50latest_price.AsString := formatfloat('0.0000', //价格
        dm.ADOQuery3.FieldValues['PART_PRICE']/dm.ADOQuery3.FieldValues['EXCH_RATE'])
     else
      dm.Aupdate50latest_price.AsString := formatfloat('0.0000', //价格
        dm.ADOQuery3.FieldValues['PART_PRICE']/dm.ADOQuery3.FieldValues['EXCH_RATE']/
        (1+dm.ADOQuery3.FieldValues['RUSH_CHARGE']*0.01));

    //dm.ADupdate50last_so_date.Value := dm.ADOQuery3.FieldValues['ent_date']; //最近日期

    if (dm.aq192custciprod.AsString='Y') and
       (find_parterror(strtoint(self.lab_rkey50.Caption))) then
     dm.Aupdate50onhold_sales_flag.Value:=1;  //如果销售的板号有最新的旧板，那么旧板锁定
    post;
   end;
  dm.ADOupdate25.Close;
  dm.ADOupdate25.Parameters[1].Value := memo1.Text;
  dm.ADOupdate25.Parameters[2].Value := memo2.Text;
  dm.ADOupdate25.Parameters[3].Value := rkey25;
  dm.ADOupdate25.ExecProc;
//==============================================================================
 if STRtoint(label50.Caption) = 1 then //如果是从04中读取订单号
  begin               //更新data0004
   dm.AQ04.Close;
   dm.AQ04.Open;
   v_seed := trim(dm.AQ04.FieldValues['seed_value']);
   v_length := length(trim(dm.AQ04.FieldValues['seed_value'])); //现有长度
   control_no := dm.AQ04CONTROL_NO_LENGTH.Value;  //控制最大长度
   for i := v_length downto 1 do         //更新data0004
   if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
    begin                               //后缀加1
     v_last := floattostr(100000000+strtofloat(copy(v_seed,i+1,v_length-i))+1);
     new_seed := copy(v_seed,1,i)+copy(v_last,control_no-(v_length-i)+1,v_length-i);
     dm.AQ04.Edit;            //使前缀不变后缀加1
     dm.AQ04.FieldValues['seed_value'] := new_seed;
     dm.AQ04.Post;
     break;
    end
   else
    if i=1 then //如果第一位仍然是数字
     begin
      v_last := floattostr(1000000000+strtofloat(v_seed)+1);
      new_seed := copy(v_last,control_no+1-v_length+1,v_length);
      dm.AQ04.Edit;
      dm.AQ04.FieldValues['seed_value'] := new_seed;
      dm.AQ04.Post;
     end;
  end;
//==============================================================================
 dm.AQ62.Filter := '';   //工具费用子表
 dm.AQ102.Filter := '';     //销售代表跟进人员子表
 dm.AQ6011.Filter := '';
 dm.AQ106011.Filter := '';
 dm.AQ179.Filter := '';      //三个记事本

 try
  dm.AQ62.UpdateBatch();
  //dm.AQ102.UpdateBatch();
  dm.AQ6011.UpdateBatch();
  dm.AQ106011.UpdateBatch();
  dm.AQ179.UpdateBatch();      //6个子表相继提交
  dm.ado89.UpdateBatch();     //合同评审内容子表

  dm.ADOConnection1.CommitTrans;   //事物提交
 except
  dm.ADOConnection1.RollbackTrans;
  messagedlg('数据保存失败,请速与管理员联系!',mtwarning,[mbok],0);
 end;
 for i:=1 to stringgrid1.RowCount-2 do
  stringgrid1.Rows[i].Clear;
 stringgrid1.RowCount:=2;
 edit3.Enabled:=true;
 edit4.Enabled:=true;
 edit4.Text:='';
 Edit17.Text:='';
 bitbtn4.Enabled:=true;
 bitbtn5.Enabled:=true;
 bitbtn6.Enabled := true;
 Edit6.Enabled:=true;     //合同号
 edit10.Enabled:=true;
 bitbtn7.Enabled:=true; //送货地址
 combobox2.Enabled:=true;
 radiogroup1.Enabled:=true;
 maskedit1.Text:=datetostr(getsystem_date(DM.ADOQuery5,1));    //当前日期
 label50.Caption := '0';      //开始时不从04中读取控制码
 lab_rkey50.Caption := '';
 lab_rkey10.Caption := '';
//2017-10-13tang保存之后清掉工厂代码，客户信息、货币等相关信息
 Edit5.Text:='';
 Edit3.Text:='';
 Label34.Caption:='';
 Edit6.Text:='';
 Edit8.Text:='';
 Edit9.Text:='';
 Edit10.Text:='';
 Edit12.Text:='';
 MaskEdit1.Text:='';
 lblywy.Caption:='';
 Edit17.Text:='';
 Edit7.Text:='';
 Label1.Caption:='';
//end 2017-10-13tang

 bitbtn2.Enabled := false;
 bitbtn1.Enabled:=false;
 label44.Caption := '0.000';
 label46.Caption := '0.000';
 label47.Caption := '0.000';
 label48.Caption := '0.0000';
 pagecontrol1.ActivePage:=tabsheet1;

 edit3.SetFocus;
 with dm.adoquery5 do
  begin
   close;
   sql.Clear;
   sql.Add('select getdate() as v_date');
   open;
   edit15.Text := formatdatetime('yyyy-mm-dd H:mm:ss',fieldvalues['v_date']);
  end;
 memo1.Lines.Clear;
 memo1.ReadOnly:=true;
 dm.ado89.Close;
 dm.ADO360.Close;
end;

procedure TForm2.so_noteClick(Sender: TObject);
begin
 try
//20160125修改记事本保存到60.RemarkSO
  edit_note:=Tedit_note.Create(application);
  edit_note.Caption:='销售定单记事本: '+stringgrid1.Cells[0,stringgrid1.row];
  edit_note.Memo1.Lines.Assign(po_note);
//  dm.ADOQuery4.Filter:='Rkey= '+dm.ADOQuery4.fieldbyname('rkey').AsString;
//  if not dm.ADOQuery4.IsEmpty then
//    edit_note.Memo1.Lines.Add(dm.ADOQuery4.fieldbyname('RemarkSO').AsString);
  if edit_note.ShowModal=mrok then
   begin
//     if (not dm.ADOQuery4.IsEmpty) then
//     begin
//      dm.ADOQuery4.Edit;
//      dm.ADOQuery4.fieldbyname('RemarkSO').AsString:=edit_note.Memo1.Text;
//      dm.ADOQuery4.Post;
//     end else
     if trim(edit_note.Memo1.Text)<>'' then
     begin
       po_note.Text:=trim(edit_note.Memo1.Text);
     end;
   end;
 finally
  edit_note.free;
 end;
end;

{procedure TForm2.conf_noteClick(Sender: TObject);
var
 i:byte;
begin
 try
  edit_note:=Tedit_note.Create(application);
  edit_note.Caption:='确认记事本: '+stringgrid1.Cells[0,stringgrid1.row];
  dm.AQ106011.Filter:='file_pointer = '+inttostr(stringgrid1.row);
  if not dm.AQ106011.IsEmpty then
     for i:=1 to 4 do
     edit_note.Memo1.Lines.Add(dm.AQ106011.fieldbyname('note_pad_line_'+inttostr(i)).AsString);
  if edit_note.ShowModal=mrok then
   begin
    if not dm.AQ106011.IsEmpty then
     begin
      dm.AQ106011.Edit;
      for i:=1 to 4 do
      dm.AQ106011.fieldbyname('note_pad_line_'+inttostr(i)).AsString := edit_note.Memo1.Lines[i-1];
     end
    else
      if trim(edit_note.Memo1.Text)<>'' then
      begin
       dm.AQ106011.Append;
       dm.AQ106011.FieldValues['file_pointer'] := stringgrid1.Row;
       dm.AQ106011.fieldvalues['source_type'] := 1060;
       for i := 1 to 4 do
       dm.AQ106011.fieldbyname('note_pad_line_'+inttostr(i)).AsString := edit_note.Memo1.Lines[i-1];
       dm.AQ106011.Post;
      end;
    end;
 finally
  edit_note.free;
 end;
end;     }

procedure TForm2.ship_noteClick(Sender: TObject);
var
 i:byte;
begin
 try
  form7 := Tform7.Create(application);
  form7.Caption:='装运记事本: '+stringgrid1.Cells[0,stringgrid1.row];
  dm.AQ179.Filter:='so_ptr = '+inttostr(stringgrid1.row);
  if not dm.AQ179.IsEmpty then
   for i:=1 to 10 do
    form7.Memo1.Lines.Add(dm.AQ179.fieldbyname('line_'+inttostr(i)).AsString);
  if form7.ShowModal=mrok then
   begin
    if not dm.AQ179.IsEmpty then
     begin
      dm.AQ179.Edit;
      for i:=1 to 10 do
      dm.AQ179.fieldbyname('line_'+inttostr(i)).AsString := form7.Memo1.Lines[i-1];
     end
    else
      if trim(form7.Memo1.Text)<>'' then
      begin
       dm.AQ179.Append;
       dm.AQ179.FieldValues['so_ptr'] := stringgrid1.Row;
       for i := 1 to 10 do
       dm.AQ179.fieldbyname('line_'+inttostr(i)).AsString := form7.Memo1.Lines[i-1];
       dm.AQ179.Post;
      end;
    end;
 finally
  form7.free;
 end;
end;

function tform2.find_soerror():boolean;
var
 i:word;
begin
 result:=false;
for i:=1 to stringgrid1.RowCount-2 do
 with dm.ADOQuery5 do
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0060');
   sql.Add('where sales_order='''+stringgrid1.Cells[0,i]+'''');
   open;
   if not IsEmpty then
    BEGIN
     result := true;
     break;
    END;
  end;
end;

procedure TForm2.MaskEdit1Exit(Sender: TObject);
begin
TRY
 strtodate(maskedit1.Text);
except
 messagedlg('日期格式输入有误!',mtinformation,[mbcancel],0);
 maskedit1.SetFocus;
end;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

if dm.ADOConnection1.InTransaction then dm.ADOConnection1.RollbackTrans;
if dm.ado89.Active = true then dm.ado89.Close;

end;

procedure TForm2.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=40) and             //如果是下箭头如果是最后一条记录
  (dm.ado89.RecNo=dm.ado89.RecordCount) then abort;
 if key=45 then abort; //insert键
// if (key=112) and (dbcombobox1.Visible) then
//  begin
//   dbcombobox1.SetFocus;
//   dbcombobox1.DroppedDown:=true;
//  end;
end;

procedure TForm2.DBGrid1CellClick(Column: TColumn);
begin
if column.Index<3 then dbgrid1.SelectedIndex:=3;
end;

{procedure TForm2.get_repname;
var
 i:byte;
begin
  with dm.ADOQuery2 do        //查找按客户及产品类型分类的佣金
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select *');
    sql.Add('from data0263 where CUSTOMER_PTR='+lab_rkey10.Caption);
    sql.Add('and PRODUCT_CODE_PTR='+inttostr(self.prod_rkey));
    active:=true;
   end;

   if not dm.ADOQuery2.IsEmpty then //如果按客户及产品类型分类的销售拥金已定义
    for i:=1 to 5 do
    if dm.adoquery2.fieldvalues['sales_rep_ptr'+inttostr(i)]<>null then
     with dm.ADOQuery3 do
      begin           //定单跟进人员赋值
       if active=true then active:=false;
       sql.Clear;
       sql.Add('select rep_code,sales_rep_name from data0009');
       sql.Add('where rkey='+dm.ADOQuery2.fieldbyname('sales_rep_ptr'+inttostr(i)).AsString);
       active:=true;
       form3.StringGrid2.Cells[0,i]:=fieldvalues['rep_code'];
       form3.StringGrid2.Cells[1,i]:=fieldvalues['sales_rep_name'];
       form3.StringGrid2.Cells[2,i]:=formatfloat('0.00',dm.ADOQuery2.FieldValues['PERCENT_COMMISSION'+inttostr(i)]);
       form3.StringGrid2.Cells[3,i]:=formatfloat('0.00',dm.ADOQuery2.FieldValues['SALES_CREDIT'+inttostr(i)]);
       form3.StringGrid2.Cells[4,i]:=dm.ADOQuery2.fieldbyname('sales_rep_ptr'+inttostr(i)).AsString;
       form3.StringGrid2.RowCount:=form3.StringGrid2.RowCount+1;
      end
    else
     break
   else         //如果按客户及产品类型分类的销售拥金     没有定义
  with dm.ADOQuery2 do        //查找装运地点销售代表跟进人员
   begin
    if active=true then active:=false;
    sql.Clear;
    sql.Add('select SREP_PTR_1,SREP_PTR_2,SREP_PTR_3,SREP_PTR_4,SREP_PTR_5,');
    sql.Add('SREP_1_COMM,SREP_2_COMM,SREP_3_COMM,SREP_4_COMM,SREP_5_COMM,');
    sql.Add('SREP_1_ALLOC,SREP_2_ALLOC,SREP_3_ALLOC,SREP_4_ALLOC,SREP_5_ALLOC');
    sql.Add('from data0012 where rkey='+lab_rkey12.Caption);
    active:=true;
    for i:=1 to 5 do
    if fieldvalues['srep_ptr_'+inttostr(i)]<>null then
     with dm.ADOQuery3 do
      begin           //定单跟进人员赋值
       if active=true then active:=false;
       sql.Clear;
       sql.Add('select rep_code,sales_rep_name from data0009');
       sql.Add('where rkey='+dm.ADOQuery2.fieldbyname('srep_ptr_'+inttostr(i)).AsString);
       active:=true;
       form3.StringGrid2.Cells[0,i]:=fieldvalues['rep_code'];
       form3.StringGrid2.Cells[1,i]:=fieldvalues['sales_rep_name'];
       form3.StringGrid2.Cells[2,i]:=formatfloat('0.00',dm.ADOQuery2.FieldValues['srep_'+inttostr(i)+'_comm']);
       form3.StringGrid2.Cells[3,i]:=formatfloat('0.00',dm.ADOQuery2.FieldValues['srep_'+inttostr(i)+'_alloc']);
       form3.StringGrid2.Cells[4,i]:=dm.ADOQuery2.fieldbyname('srep_ptr_'+inttostr(i)).AsString;
       form3.StringGrid2.RowCount:=form3.StringGrid2.RowCount+1;
      end
    else
     break;
   end;
end;    }

procedure TForm2.BitBtn9Click(Sender: TObject);
begin
 try
  curr_form := Tcurr_form.Create(Application);
  if curr_form.ADOQuery1.IsEmpty then
   messagedlg('请首先定义货币种类',mtinformation,[mbok],0)
  else
  IF curr_form.showmodal=mrok then
   begin
    edit8.Text:=curr_form.ADOQuery1.FieldValues['curr_code'];
    label35.Caption:=curr_form.ADOQuery1.FieldValues['curr_name'];
    lab_rkey01.Caption:=curr_form.ADOQuery1rkey.AsString;
    edit9.Text := formatfloat('0.00000000',curr_form.ADOQuery1exch_rate.Value);
   end
  else
   edit8.SetFocus;
 finally
  curr_form.free;
 end;
end;

procedure TForm2.Edit14KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  abort
end;

procedure TForm2.Edit14Exit(Sender: TObject);
begin
if trim(edit14.Text)='' then edit14.Text:='0';
label39.Caption:=inttostr(strtoint(edit14.Text)-strtoint(label38.Caption));
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrid1.WindowProc ;
 DBGrid1.WindowProc := NewGridWnd;
  po_note:=tstringlist.Create;
  sales_note:=tstringlist.Create;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
var
 i,j:integer;
 v_so:string;
 v_row:integer;
begin
 dm.AQ04.Close;
 dm.AQ04.Open;
// for i:=1 to stringgrid1.RowCount-2 do
//  if pos('-',stringgrid1.Cells[0,i])>0 then
//   stringgrid1.Cells[0,i]:=dm.AQ04SEED_VALUE.Value+
//   copy(stringgrid1.Cells[0,i],pos('-',stringgrid1.Cells[0,i]),3);
  for j:=1 to stringgrid1.RowCount-2 do
  begin
    if pos('-',stringgrid1.Cells[0,j])>0 then
    begin
//      ShowMessage(stringgrid1.Cells[0,j]);
      with dm.aqTmp do
      begin
        Close;
        SQL.Clear;
        SQL.Add('Select sales_order from data0060');
//        sql.Add('where cust_part_ptr='+lab_rkey50.Caption);
        SQL.Add('where  sales_order like '''+Copy(stringgrid1.Cells[0,j],1,Pos('-',stringgrid1.Cells[0,j]))+'%''');
        SQL.Add('order by sales_order desc');
        Open;
        if not IsEmpty then
        begin
          v_so:=copy(fieldvalues['sales_order'],1,pos('-',fieldvalues['sales_order'])-1);
          v_row:= StrToInt(trim(StringReplace(fieldvalues['sales_order'],v_so+'-','',[rfIgnoreCase])));  //取后缀
//          v_so:=
//          v_row:=0;
        end
        else
        begin
          v_so:=dm.AQ04SEED_VALUE.AsString;
          v_row:=0;
        end;
      end;
      Break;
    end;
  end;
  for i:=1 to stringgrid1.RowCount-2 do
  if Pos('-',stringgrid1.Cells[0,i])>0 then
  begin
    Inc(v_row);
    if v_row<10 then
      stringgrid1.Cells[0,i]:=v_so+'-0'+inttostr(v_row)
    else
      stringgrid1.Cells[0,i]:=v_so+'-'+inttostr(v_row);
  end;
end;

procedure TForm2.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
//if (gdFocused in State) then
// begin
//  if (column.FieldName = DBComboBox1.DataField ) then
//   begin
//    DBComboBox1.Left := Rect.Left+1;
//    DBComboBox1.Top := Rect.Top;
//    DBComboBox1.Width := Rect.Right - Rect.Left+3;
//    DBComboBox1.Height := Rect.Bottom - Rect.Top;
//    self.get_value(dm.ado89parameter_ptr.Value);
//    if dbcombobox1.Items.Count > 0 then
//     DBComboBox1.Visible := True
//    else
//     DBComboBox1.Visible := false;
//   end;
// end;

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

procedure TForm2.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
//if (key <> chr(9)) then
// begin
//  if (DBGrid1.SelectedField.FieldName =DBComboBox1.DataField) and
//     (dbcombobox1.Items.Count > 0) then
//   begin
//    DBComboBox1.SetFocus;
//    SendMessage(DBComboBox1.Handle,WM_Char,word(Key),0);
//   end;
// end;
end;

procedure TForm2.DBGrid1ColExit(Sender: TObject);
begin
//If DBGrid1.SelectedField.FieldName = DBComboBox1.DataField then
// DBComboBox1.Visible := false;
end;


procedure TForm2.DBComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//if key=112 then dbcombobox1.DroppedDown:=true;
if key=13 then dbgrid1.SetFocus;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
memo1.Text:=memo2.Text;
end;

procedure TForm2.Edit15Exit(Sender: TObject);
begin
TRY
 strtodatetime(edit15.Text);
except
 messagedlg('日期时间格式输入有误!',mtinformation,[mbcancel],0);
 edit15.SetFocus;
end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dm.AQ102.Filter:='';
 dm.AQ62.Filter:='';
 dm.AQ6011.Filter:='';
 dm.AQ106011.Filter:='';
 dm.AQ179.Filter:='';
 dm.AQ102.close;
 dm.AQ62.Close;
 dm.AQ6011.Close;
 dm.AQ106011.Close;
 dm.AQ179.Close;
 dm.aq192.Close;
end;

procedure TForm2.Tab(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Begin
  if (key=VK_Down) or (key=13) then
   SelectNext(ActiveControl,True,True);
  if key=VK_Up then
   SelectNext(ActiveControl,False,True);
  Key:=0;
end;

procedure TForm2.BitBtn10Click(Sender: TObject);
begin
f_supp:=tf_supp.Create(application);
if f_supp.ADOQuery1.IsEmpty then
 showmessage('对不起,没有找到外发供应商类型!')
else
 if f_supp.ShowModal=mrok then
  begin
   edit16.Text:=f_supp.ADOQuery1code.Value;
   label55.Caption:=f_supp.ADOQuery1SUPPLIER_NAME.Value;
   rkey23:=f_supp.ADOQuery1rkey.Value;
   tax_2:=F_supp.ADOQuery1TAX_2.Value;
  end;
f_supp.free;
end;

procedure TForm2.RadioGroup1Click(Sender: TObject);
begin
if radiogroup1.ItemIndex=1 then
 bitbtn10.Enabled:=true
else
 begin
  bitbtn10.Enabled:=false;
  self.rkey23:=0;
  edit16.Text:='';
  label55.Caption:='';
 end;
end;

function TForm2.find_parterror(rkey25:integer): boolean;
begin
 find_parterror:=false;
 with dm.ADOQuery5 do
  begin
   close;
   sql.Clear;
   sql.Add('SELECT rkey FROM Data0273');
   sql.Add('where  COPYFROMCUST_PTR='+inttostr(rkey25));
   open;
   if not isempty then find_parterror := true;
  end;
end;

function TForm2.find_socongfu(rkey97, rkey50: integer;
  org_sch_date: string;PCSQTY:string): boolean;
begin
find_socongfu:=false;
with dm.ADOQuery5 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0060');
  sql.Add('where PURCHASE_ORDER_PTR='+inttostr(rkey97));
  sql.Add('and CUST_PART_PTR='+inttostr(rkey50));
//  sql.Add('and ORIG_SCHED_SHIP_DATE='''+org_sch_date+'''');
  sql.Add('and PARTS_ORDERED='+PCSQTY);
  sql.Add('and ENT_DATE> DATEADD(DAY,-30,CAST(CONVERT(VARCHAR(10),GETDATE(),120) AS DATETIME))');  //30天以内
  open;
 end;
// Showmessage(dm.ADOQuery5.sql.Text);
if not dm.ADOQuery5.IsEmpty then find_socongfu:=true;
end;

procedure  TForm2.get_value(rkey278:integer);
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


function TForm2.find_spec_rkey(spec_rkey: string): string;
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

procedure TForm2.BitBtn11Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
try
 InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,WAREHOUSE_NAME/客户名称/277,ABBR_NAME/工厂简称/100';
 InputVar.Sqlstr := 'select RKEY,WAREHOUSE_CODE,WAREHOUSE_NAME,ABBR_NAME from data0015 where active_flag=''Y''';
 InputVar.AdoConn := DM.ADOConnection1 ;
 frmPick_Item_Single.InitForm_New(InputVar)  ;
if frmPick_Item_Single.ShowModal=mrok then
 begin
  lab_rkey15.Caption := frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsString;
  edit5.Text := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE'];
  Label64.Caption := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_NAME'];
  edit5.Font.Color:=clwindowtext;
 end;
finally
 frmPick_Item_Single.adsPick.Close;
 frmPick_Item_Single.Free ;
end;
end;

procedure TForm2.Edit5Exit(Sender: TObject);
begin
if trim(edit5.Text)='' then
 begin
  label64.Caption:='';
  self.lab_rkey15.Caption:='0';
 end
else
 if (activecontrol.Name<>'BitBtn11') and (activecontrol.Name<>'BitBtn3') then
 begin
  with dm.ADOQuery5 do
  begin
   close;
   sql.Text:=
    'SELECT data0015.rkey,dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.WAREHOUSE_NAME,'+#13+
    'data0015.abbr_name FROM dbo.Data0015'+#13+
     'where active_flag=''Y'' and WAREHOUSE_CODE='+quotedstr(trim(edit5.Text));
   open;
   if isempty then
    begin
     messagedlg('工厂代码输入错误!',mterror,[mbcancel],0);
     edit5.SetFocus;
    end
   else
    begin
     self.lab_rkey15.Caption:=fieldbyname('RKEY').AsString;
     label64.Caption:=fieldbyname('WAREHOUSE_NAME').AsString;
     edit5.Font.Color:=clwindowtext;
    end;
   close; 
  end;
 end;
end;

procedure TForm2.Edit3Enter(Sender: TObject);
begin
  FCust:=Edit3.Text;
end;

procedure TForm2.conf_noteClick(Sender: TObject);
begin
 try
//20160125修改记事本保存到60.RemarkAudit
  edit_note:=Tedit_note.Create(application);
  edit_note.Caption:='评审记事本: '+stringgrid1.Cells[0,stringgrid1.row];
  edit_note.Memo1.Lines.Assign(sales_note);
  if edit_note.ShowModal=mrok then
   begin
//     if (not dm.ADOQuery4.IsEmpty) then
//     begin
//      dm.ADOQuery4.Edit;
//      dm.ADOQuery4.fieldbyname('RemarkAudit').AsString:=edit_note.Memo1.Text;
//      dm.ADOQuery4.Post;
//     end else
     if trim(edit_note.Memo1.Text)<>'' then
     begin
       sales_note.Text:=trim(edit_note.Memo1.Text);
     end;
   end;
 finally
  edit_note.free;
 end;
end;

function TForm2.checkRFQContractNo(ContractNo: string): Boolean;
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

procedure TForm2.Edit7Change(Sender: TObject);
begin
  if checkRFQContractNo(Edit7.Text) then
    Edit7.Enabled:= False
  else
    Edit7.Enabled:= True;
end;

procedure TForm2.findOldVersion(rkey25: string);
begin
  dm.aqTmp.Close;
  dm.aqTmp.SQL.Clear;
  dm.aqTmp.SQL.Add('select COPYFROMCUST_PTR from Data0273 where CUSTOMER_PART_PTR='+rkey25);
  dm.aqTmp.Open;
  if dm.aqTmp.RecordCount<>0 then
  begin
    AllVersion:= AllVersion + dm.aqTmp.FieldByName('COPYFROMCUST_PTR').AsString+',';
    findOldVersion(dm.aqTmp.FieldByName('COPYFROMCUST_PTR').AsString);
  end
  else
  begin
    if AllVersion<>'' then
    AllVersion:= '('+Copy(AllVersion,1,Length(AllVersion)-1)+')';
  end;
end;

procedure TForm2.BitBtn12Click(Sender: TObject);
var
  i,j:Word;
  rkey:Integer;
  parts_ordered,parts_price,rkeylist:string;
  sBookMark:TBookmark;
begin
 Application.CreateForm(TForm_AllBook, Form_AllBook);
 try
  rkeylist:=form3.return_vifrkey(Form2.StringGrid1,25);
  with Form_AllBook.ADO213 do
  begin
   Close;
   if Edit4.Text<>'' then
   begin
    SQL.Text:=SQL.Text+'and data0213.MANU_PART_NUMBER='+quotedstr(Edit4.Text);
   end;
   if Edit6.Text<>'' then
   begin
    SQL.Text:=SQL.Text+'and data0213.PO_NUMBER='+quotedstr(Edit6.Text);
   end;
   if Edit5.Text<>'' then
   begin
    SQL.Text:=SQL.Text+'and data0015.WAREHOUSE_CODE='+quotedstr(Edit5.Text);
   end;
   if rkeylist<>'' then
   begin
    SQL.Text:=SQL.Text+' and data0213.rkey not in'+rkeylist;
   end;
    Open;
  end;
  if Form_AllBook.ShowModal = mrok then
  begin
    if213:=1;
   for i:=1 to Form_AllBook.DBGrid1.SelectedRows.Count do
   begin
   Form_AllBook.dbgrid1.DataSource.DataSet.Bookmark :=Form_AllBook.dbgrid1.SelectedRows.Items[i-1]; //定位标签
   sBookMark := Form_AllBook.dbgrid1.DataSource.DataSet.GetBookmark;//得到数据库中的记录位置标签
   Form_AllBook.dbgrid1.DataSource.DataSet.GotoBookmark(sBookMark);//转到该标签处
    if StringGrid1.RowCount=2 then
    begin
     with dm.aqTmp do
     begin
      Close;
      sql.Clear;
//20160308tang修改--从213中判断10
//      SQL.Add('select data0025.*,data0010.CUSTOMER_TYPE from data0025 inner join data0010 on data0025.CUSTOMER_PTR=data0010.rkey where manu_part_number='+quotedstr(form_allbook.ADO213MANU_PART_NUMBER.AsString));
      SQL.text:='select data0213.RKEY, data0213.MANU_PART_NUMBER, data0213.PO_NUMBER, data0213.ANALYSIS_CODE_2, data0213.MANU_PART_DESC, data0213.ORIG_SCHED_SHIP_DATE, data0213.ORIG_REQUEST_DATE, data0213.WAREHOUSE_CODE,'
              +' data0213.PARTS_ORDERED, data0213.PART_PRICE, data0213.CURR_CODE, data0213.PO_DATE, data0213.status, data0213.user_ptr, data0213.submit_date, data0213.audit_ptr, data0213.audit_date, data0213.so_oldnew, data0213.is_alter, data0213.Lis_num,'
              +' data0213.CUST_CODE, data0213.orig_customer,data0025.ONHOLD_SALES_FLAG,data0010.CUSTOMER_TYPE,data0010.Rkey as Rkey10 '
              +' from data0213 inner join data0010 on data0213.cust_code=data0010.CUST_CODE inner join data0025 on data0213.MANU_PART_NUMBER=data0025.MANU_PART_NUMBER '
              +' where data0213.manu_part_number='+quotedstr(form_allbook.ADO213MANU_PART_NUMBER.AsString)+' and data0213.CUST_CODE='+quotedstr(form_allbook.ADO213CUST_CODE.AsString);
      Open;
     end;
     if (dm.aqTmp.IsEmpty=False) and (dm.aqTmp.FieldByName('ONHOLD_SALES_FLAG').Value=0) and (dm.aqTmp.FieldByName('CUSTOMER_TYPE').Value<>4) then
     begin
      Edit4.Text:=Form_AllBook.ADO213MANU_PART_NUMBER.Value;
      Edit3.Text:=Form_AllBook.ADO213CUST_CODE.Value;
      Edit17.Text:=Form_AllBook.ADO213orig_customer.Value;
      Edit17.Tag:=dm.aqTmp.FieldBYName('Rkey10').AsInteger;
      Edit3Exit(Sender);
      Edit4Exit(Sender);
      Edit6.Text:=Form_AllBook.ADO213PO_NUMBER.Value;
      if Trim(Edit5.Text)='' then
      Edit5.Text:=Form_AllBook.ado213WAREHOUSE_CODE.Value;
     //20161025添
      ComboBox2.ItemIndex:=Form_AllBook.ADO213so_style.Value; 
      rkey:=Form_AllBook.ADO213RKEY.Value;
     //20161018tang允许修改预处理数量,默认显示数量-已使用数量
      parts_ordered:=IntToStr(Form_AllBook.ADO213PARTS_ORDERED.AsInteger-Form_AllBook.ADO213UsedQuantity.AsInteger);
//      BitBtn12.Tag:=Form_AllBook.ADO213PARTS_ORDERED.AsInteger;
//      BitBtn5.Tag:=Form_AllBook.ADO213UsedQuantity.AsInteger;
      if (form2.RadioGroup2.ItemIndex = 0) and (Form_AllBook.ADO213so_style.Value=0) then  //不含税
       begin
        if (StrToFloat(form2.Edit2.Text)>0) and (Form_AllBook.ADO213PART_PRICE.Value>0) then
        parts_price:= formatfloat('0.00000000',Form_AllBook.ADO213PART_PRICE.Value/(1+strtofloat(form2.Edit2.Text)*0.01))
        else
        parts_price:= formatfloat('0.00000000',Form_AllBook.ADO213PART_PRICE.Value);
       end
      else if (Form_AllBook.ADO213PART_PRICE.Value>0) and (Form_AllBook.ADO213so_style.Value=0) then
      begin                                           //含税
       parts_price:= formatfloat('0.00000000',Form_AllBook.ADO213PART_PRICE.Value);
      end;
//20160425tang添加，判断213价格是否含税，如果不含税，不管供应商是否含税，重算-----
      if Form_AllBook.ADO213EDI_FLAG_FOR_INVOICE.Value=1 then
      begin
       parts_price:= formatfloat('0.00000000',Form_AllBook.ADO213PART_PRICE.Value);
      end;
//20160425tang end---------------------------------------
      form3init;
      Form3.rkey213:=rkey;
      Form3.Edit2.Text:=parts_ordered;//数量
      Form3.Edit3.Text:=parts_price;//价格
      Form3.MaskEdit3.Text:=Form_AllBook.ADO213PO_DATE.AsString;// 原始客户交期
      Form3.MaskEdit1.Text:=Form_AllBook.ADO213ORIG_REQUEST_DATE.AsString;//客户交期
      Form3.MaskEdit2.Text:=Form_AllBook.ADO213ORIG_SCHED_SHIP_DATE.AsString;//计划交期
     //20160313添加默认参考附注由213导入--
      Form3.Edit9.Text:=Form_AllBook.ADO213REFERENCE_NUMBER.AsString;//参考附注
     //20161018tang修改允许修改预处理数量(修改的数量必须在预处理数量内），注释掉下面原有句
     // Form3.Edit2.ReadOnly:=True;
      Form3.Edit2.Tag:=Form_AllBook.ADO213UsedQuantity.AsInteger;//已使用数量
      Form3.BitBtn1.Tag:=Form_AllBook.ADO213PARTS_ORDERED.AsInteger;//预处理数量
      form3.BitBtn2.Tag:=1;
     //20161018end------------
      if form3.ShowModal=mrok then
      begin
        stringgrid1.Cells[0,stringgrid1.RowCount-1]:=form3.edit1.text;
        save_so();     //保存数据
        for j:=1 to form3.StringGrid1.rowcount-2 do
        if (strtofloat(form3.StringGrid1.Cells[1,j])>0) or
        (strtofloat(form3.StringGrid1.Cells[2,j])>0) or
        (strtofloat(form3.StringGrid1.Cells[3,j])>0) then
        begin        //暂时保存新增定单工具费用
        dm.aQ62.Append;
        dm.aQ62.Fieldvalues['so_ptr'] := stringgrid1.RowCount-1;
        dm.aQ62.FieldByName('addl_cat_ptr').asstring := form3.StringGrid1.Cells[5,j];
        dm.AQ62.FieldByName('amount').asstring := form3.StringGrid1.Cells[1,j];
        dm.AQ62.FieldByName('free_amount').asstring := form3.StringGrid1.Cells[2,j];
        dm.AQ62.FieldByName('costfree_amount').asstring := form3.StringGrid1.Cells[3,j];
        dm.AQ62TAX_FLAG.Value:=form3.StringGrid1.Cells[4,j];
        dm.AQ62.post;
        end;
        {for j:=1 to form3.StringGrid2.RowCount-2 do
        begin           //暂时保存定单销售跟进人员
        dm.AQ102.Append;
        dm.AQ102.FieldByName('sales_rep_ptr').AsString := form3.StringGrid2.Cells[4,j];
        dm.AQ102.Fieldvalues['sales_order_ptr'] := stringgrid1.RowCount-1;
        dm.AQ102.FieldByName('commission').AsString := form3.StringGrid2.Cells[2,j];
        dm.AQ102.FieldByName('credit').AsString := form3.StringGrid2.Cells[3,j];
        dm.AQ102.Post;
        end;}
        stringgrid1.RowCount:=stringgrid1.RowCount+1;
        Continue;
      end;
     end
     else
     begin
      ShowMessage(form_allbook.ADO213MANU_PART_NUMBER.AsString+'产品已停止销售或相关客户有停用,请联系市场部!');
      Continue;
     end;
    end;
    if StringGrid1.RowCount>2 then
    begin
     if (Form_AllBook.ADO213MANU_PART_NUMBER.Value=Edit4.Text) and (Form_AllBook.ADO213PO_NUMBER.Value=Edit6.Text) then
     begin
       rkey:=Form_AllBook.ADO213RKEY.Value;
       parts_ordered:=Form_AllBook.ADO213PARTS_ORDERED.AsString;
       if form2.RadioGroup2.ItemIndex = 0 then  //不含税
       begin
        if StrToFloat(form2.Edit2.Text)>0 then
        parts_price:= formatfloat('0.00000000',Form_AllBook.ADO213PART_PRICE.Value/(1+strtofloat(form2.Edit2.Text)*0.01))
        else
        parts_price:= formatfloat('0.00000000',Form_AllBook.ADO213PART_PRICE.Value);
       end
       else
       begin                                           //含税
        parts_price:= formatfloat('0.00000000',Form_AllBook.ADO213PART_PRICE.Value);
       end;
       form3init;
       Form3.rkey213:=rkey;
       Form3.Edit2.Text:=parts_ordered;//数量
       Form3.Edit3.Text:=parts_price;//价格
       Form3.MaskEdit3.Text:=Form_AllBook.ADO213PO_DATE.AsString;// 原始客户交期
       Form3.MaskEdit1.Text:=Form_AllBook.ADO213ORIG_REQUEST_DATE.AsString;//客户交期
       Form3.MaskEdit2.Text:=Form_AllBook.ADO213ORIG_SCHED_SHIP_DATE.AsString;//计划交期
       
//20170920添加默认参考附注由213导入--
      Form3.Edit9.Text:=Form_AllBook.ADO213REFERENCE_NUMBER.AsString;//参考附注
     //20161018tang修改允许修改预处理数量(修改的数量必须在预处理数量内），注释掉下面原有句
     // Form3.Edit2.ReadOnly:=True;
      Form3.Edit2.Tag:=Form_AllBook.ADO213UsedQuantity.AsInteger;//已使用数量
      Form3.BitBtn1.Tag:=Form_AllBook.ADO213PARTS_ORDERED.AsInteger;//预处理数量
      form3.BitBtn2.Tag:=1;

//       Form3.Edit2.ReadOnly:=True;
       stringgrid1.Cells[0,stringgrid1.RowCount-1]:=form3.edit1.text;
        save_so2();     //保存数据
        for j:=1 to form3.StringGrid1.rowcount-2 do
        if (strtofloat(form3.StringGrid1.Cells[1,j])>0) or
        (strtofloat(form3.StringGrid1.Cells[2,j])>0) or
        (strtofloat(form3.StringGrid1.Cells[3,j])>0) then
        begin        //暂时保存新增定单工具费用
        dm.aQ62.Append;
        dm.aQ62.Fieldvalues['so_ptr'] := stringgrid1.RowCount-1;
        dm.aQ62.FieldByName('addl_cat_ptr').asstring := form3.StringGrid1.Cells[5,j];
        dm.AQ62.FieldByName('amount').asstring := form3.StringGrid1.Cells[1,j];
        dm.AQ62.FieldByName('free_amount').asstring := form3.StringGrid1.Cells[2,j];
        dm.AQ62.FieldByName('costfree_amount').asstring := form3.StringGrid1.Cells[3,j];
        dm.AQ62TAX_FLAG.Value:=form3.StringGrid1.Cells[4,j];
        dm.AQ62.post;
        end;

        stringgrid1.RowCount:=stringgrid1.RowCount+1;
     end
     else
     begin
     ShowMessage(form_allbook.ADO213MANU_PART_NUMBER.AsString+'本厂编号或PO号与前面的不一样,下单失败!');
     Continue;
     end;
    end;
    end;
   if StringGrid1.RowCount>2 then
   begin
    bitbtn1.Enabled:=true;
    edit3.Enabled:=false;
    edit4.Enabled:=false;
    edit6.Enabled:=false;
    edit10.Enabled:=false;
    bitbtn4.Enabled:=false;
    bitbtn5.Enabled:=false;
    bitbtn6.Enabled:=false;
    bitbtn7.Enabled:=false;
    combobox2.Enabled:=false;
    radiogroup1.Enabled:=false;
    checkbox1.Enabled:=false;
   end;
  end;
 finally
 
  Form_AllBook.Free;
 end;
end;


procedure TForm2.Edit4Change(Sender: TObject);
begin
//20170322tang注
//  with dm.ADOQuery5 do
//  begin
//    close;
//    sql.Clear;
//    sql.Add('select ORIG_CUSTOMER from data0025 where MANU_PART_NUMBER='''+edit4.Text+'''');
//    open;
//  end;
//  Label68.Caption:= '关联原客户:'+dm.ADOQuery5.FieldByName('ORIG_CUSTOMER').AsString;
end;

function TForm2.CheckCustCreditAmount: boolean;
var
  TmpAmout:double;
  i:integer;
begin
  result:=true;
  with dm.aqTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT 1 FROM Data0192 WHERE CUSTSTAPROD=''Y''');
    Open;
  end;
  IF dm.aqTmp.RecordCount>0 then
  begin
    if self.credit_rating = 3 then
    begin
       messagedlg('客户:'+self.edit3.Text+'信用等级太差,订单无法继续!',mtwarning,[mbok],0);
       exit;
    end
    else
    begin
     //Jacky Zhong 2015-11-07
      TmpAmout:=0;
      for i:=1 to stringgrid1.RowCount-2 do //计算所有订单总金额
        TmpAmout:=TmpAmout+StrToFloat(stringgrid1.Cells[23,i]);

      if self.credit_rating = 1 then //信用等级为优，超过限额出现提示后仍然可以
      begin                               //开出订单
        if dm.cacl_deficiency(strtoint(self.lab_rkey10.Caption),
                  TmpAmout/StrtoCurr(self.Edit9.Text))>self.credit_limit+1 then
        if messagedlg('客户:'+form2.edit3.Text+'未付款金额大于了信用限额是否继续?',
        mtconfirmation,[mbyes,mbno],0)=mrno then
        begin
          result:=False;
          exit;
        end;
      end
      else //信用等级为良，只能在限额以内开出销售订单
      begin
        if dm.cacl_deficiency(strtoint(self.lab_rkey10.Caption),
                 TmpAmout/StrtoCurr(self.Edit9.Text))>self.credit_limit+1 then
        begin
          messagedlg('客户:'+form2.edit3.Text+'未付款金额大于了信用限额无法继续!',mtwarning,[mbok],0);
          result:=false;
          exit;
        end;
      end;
    end;
  end;
end;

procedure TForm2.BitBtn13Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'CUST_CODE/客户代码/100,CUSTOMER_NAME/客户名称/277,ABBR_NAME/客户简称/100';
    InputVar.Sqlstr := 'select Rkey,CUST_CODE,CUSTOMER_NAME,ABBR_NAME from Data0010 where CUSTOMER_TYPE<>4';
    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit17.Text := frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME'];
      Edit17.Tag:=frmPick_Item_Single.adsPick.FieldValues['Rkey'];
      Edit17.Font.Color:=clwindowtext;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TForm2.Edit17Exit(Sender: TObject);
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

procedure TForm2.edit04;
var
 i,v_row:word;
 v_seed,v_last,new_seed,invoice:string;
 v_length,control_no:byte;
begin
   dm.AQ04.Close;
   dm.AQ04.Open;
   v_seed := trim(dm.AQ04.FieldValues['seed_value']);
   v_length := length(trim(dm.AQ04.FieldValues['seed_value'])); //现有长度
   control_no := dm.AQ04CONTROL_NO_LENGTH.Value;  //控制最大长度
   for i := v_length downto 1 do         //更新data0004
   if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
    begin                               //后缀加1
     v_last := floattostr(100000000+strtofloat(copy(v_seed,i+1,v_length-i))+1);
     new_seed := copy(v_seed,1,i)+copy(v_last,control_no-(v_length-i)+1,v_length-i);
     dm.AQ04.Edit;            //使前缀不变后缀加1
     dm.AQ04.FieldValues['seed_value'] := new_seed;
     dm.AQ04.Post;
     break;
    end
   else
    if i=1 then //如果第一位仍然是数字
     begin
      v_last := floattostr(1000000000+strtofloat(v_seed)+1);
      new_seed := copy(v_last,control_no+1-v_length+1,v_length);
      dm.AQ04.Edit;
      dm.AQ04.FieldValues['seed_value'] := new_seed;
      dm.AQ04.Post;
     end;
  v_row:=0;
  for i:=1 to stringgrid1.RowCount-2 do
  if Pos('-',stringgrid1.Cells[0,i])>0 then
  begin
    Inc(v_row);
    if v_row<10 then
      stringgrid1.Cells[0,i]:=new_seed+'-0'+inttostr(v_row)
    else
      stringgrid1.Cells[0,i]:=new_seed+'-'+inttostr(v_row);
  end;
end;

procedure TForm2.BitBtn14Click(Sender: TObject);
var inputvar:PDlgInput;
    sRkey10:string;
begin
//20171205tang添加二维码打印格式，根据客户，如果存在关联客户以关联客户
 if (Trim(Edit17.Text)='') and (Edit17.Tag=0) then
 begin
   if (Trim(lab_rkey10.Caption)<>'')then
     sRkey10:=Trim(lab_rkey10.Caption)
   else
     sRkey10:='';
 end else
 begin
   if (Edit17.Tag <>0)then
     sRkey10:=IntToStr(Edit17.Tag)
   else
     sRkey10:='';
 end;
 if (Trim(sRkey10)<>'') then
 begin
   frmpick_item_single:=Tfrmpick_item_single.Create(application);
   try
     inputvar.Fields:='cust_code/客户代码/240,abbr_name/客户简称/240';
     inputvar.Sqlstr:='select * from Print2D_BarDef where D10_Ptr='+sRkey10;
     inputvar.KeyField:='Rkey';
     inputvar.AdoConn:=dm.ADOConnection1;
     frmpick_item_single.InitForm_New(inputvar);
     if frmpick_item_single.ShowModal=mrok then
     begin
       Edit18.Text:=trim(frmpick_item_single.adsPick.FieldValues['BarName']);
       Edit18.Tag:=frmpick_item_single.adsPick.FieldValues['rkey'];
     end;
   finally
     frmpick_item_single.adsPick.Close;
     frmpick_item_single.Free;
   end;
 end;
end;

end.
