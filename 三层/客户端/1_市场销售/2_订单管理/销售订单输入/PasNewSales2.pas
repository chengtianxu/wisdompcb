unit PasNewSales2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm,ucommfunc,uBaseSinglePickListFrm,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.Buttons, Vcl.Mask, RzEdit, RzBtnEdt, uRKeyBtnEdit, Data.DB,
  Datasnap.DBClient, PasShow213, PasAddSales, Vcl.Menus, PasAllOldVersion,
  PasShowStock, PasMulti_so,System.StrUtils;

type
  LgetRefreshClick=procedure (cds:TClientDataSet) of object;
  TfrmNewSales2 = class(TfrmBaseEdit)
    StringGrid1: TStringGrid;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label13: TLabel;
    Label11: TLabel;
    Label68: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label23: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label20: TLabel;
    Label58: TLabel;
    Label54: TLabel;
    Label57: TLabel;
    Label22: TLabel;
    Label56: TLabel;
    Label53: TLabel;
    Label67: TLabel;
    Label18: TLabel;
    Label55: TLabel;
    CheckBox1: TCheckBox;
    GroupBox4: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label36: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label7: TLabel;
    Label51: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Edit14: TEdit;
    GroupBox3: TGroupBox;
    Label24: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label44: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label45: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    RadioGroup1: TRadioGroup;
    ComboBox3: TComboBox;
    ComboBox2: TComboBox;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    Label10: TLabel;
    Label52: TLabel;
    Label37: TLabel;
    Edit18: TEdit;
    Edit19: TEdit;
    RadioGroup2: TRadioGroup;
    Memo2: TMemo;
    Memo1: TMemo;
    TabSheet3: TTabSheet;
    DBGridEh1: TDBGridEh;
    redt2: TRKeyRzBtnEdit;
    RKeyRzBtnEdit2: TRKeyRzBtnEdit;
    RKeyRzBtnEdit3: TRKeyRzBtnEdit;
    RKeyRzBtnEdit5: TRKeyRzBtnEdit;
    RKeyRzBtnEdit6: TRKeyRzBtnEdit;
    RKeyRzBtnEdit8: TRKeyRzBtnEdit;
    RKeyRzBtnEdit9: TRKeyRzBtnEdit;
    RKeyRzBtnEdit10: TRKeyRzBtnEdit;
    RKeyRzBtnEdit11: TRKeyRzBtnEdit;
    RKeyRzBtnEdit12: TRKeyRzBtnEdit;
    RKeyRzBtnEdit13: TRKeyRzBtnEdit;
    RKeyRzBtnEdit14: TRKeyRzBtnEdit;
    BitBtn12: TBitBtn;
    RKeyRzBtnEdit15: TRKeyRzBtnEdit;
    Label2: TLabel;
    RKeyRzBtnEdit16: TRKeyRzBtnEdit;
    RKeyRzBtnEdit17: TRKeyRzBtnEdit;
    RKeyRzBtnEdit18: TRKeyRzBtnEdit;
    RKeyRzBtnEdit19: TRKeyRzBtnEdit;
    ComboBox1: TComboBox;
    cds192: TClientDataSet;
    cds60: TClientDataSet;
    cds62: TClientDataSet;
    cds89: TClientDataSet;
    ds60: TDataSource;
    ds89: TDataSource;
    PopupMenu1: TPopupMenu;
    add_sin: TMenuItem;
    add_mul: TMenuItem;
    N3: TMenuItem;
    edit_so: TMenuItem;
    del_so: TMenuItem;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    Memo3: TMemo;
    cds360: TClientDataSet;
    cds213: TClientDataSet;
    Label3: TLabel;
    cds04: TClientDataSet;
    cds25: TClientDataSet;
    cds97: TClientDataSet;
    cds10: TClientDataSet;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    Label4: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure RKeyRzBtnEdit1ButtonClick(Sender: TObject);
    procedure RKeyRzBtnEdit10ButtonClick(Sender: TObject);
    procedure RKeyRzBtnEdit11ButtonClick(Sender: TObject);
    procedure RKeyRzBtnEdit16ButtonClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RKeyRzBtnEdit2ButtonClick(Sender: TObject);
    procedure RKeyRzBtnEdit8ButtonClick(Sender: TObject);
    procedure RKeyRzBtnEdit3ButtonClick(Sender: TObject);
    procedure RKeyRzBtnEdit1Change(Sender: TObject);
    procedure RKeyRzBtnEdit3Exit(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure RKeyRzBtnEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure add_sinClick(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edit_soClick(Sender: TObject);
    procedure del_soClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure add_mulClick(Sender: TObject);
    procedure RKeyRzBtnEdit15ButtonClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  //货到收款标志，付款方式,客户代码记录号, 是否需要评审标识
    COD_FLAG,FED_TAX_ID_NO,Fcust,aptaxontax:string;
  //，信用等级，    未付款最多超期, 装运交货提前天数,量板或样板 ,产品周期,交货单元数,允许连续下单
    CREDIT_RATING,INVOICE_NOTE_PAD_PTR,SHIP_LEAD_TIME,v_part_num,shelf_life,set_qty,QUOTE_FACTOR1:Integer;
  //信用限额,交货单只面积m2，交货set长，交货set宽
    CREDIT_LIMIT,unit_sq,set_length,set_width: double;
    if213:Integer;//是否预处理选0本厂1预处理
  //时间长，时间短
    dLongDate,dShortDate:TDateTime;
    //产品是否与报价单关联, 客户报价关联标志
    quote_flag,customer_quote:boolean;
    //BOMRkey,不含税价格(BOM报价),版本号
    FBp06_ptr,FBomBuHanShuiJiaGe,AllVersion:string;
    //判断97是否需要新增
    iNew97YN:Integer;
    { Private declarations }
    str_list:TStringList; //SG标题列表
    LGRName:string; //04更新号
    function Getso_oldnew(Arkey25:string):byte;//订单新旧
    function custinvoice_day(Arkey10:string;var invoice_number:string):byte; //有未付款发票超过了最长延期付款天数
    function CheckCustCreditAmount:Boolean;//判断订单总金额是否超出信用额度
    procedure findOldVersion(ARkey25:string);//获取变更之前的本厂编号
    function find_allqty_so(Arkey10:string;var sales_order: string):Boolean;//前期有订单已到交期有库存未交货
    function find_socongfu(Arkey97,Arkey25,PCSQTY:string):Boolean; //近30天内是否存在订单合同号,板号,订单数量一样的订单
    function update04(table_name: string; var LsName: string): string;
    function Power(x, y: extended): extended;
    function find_parterror(rkey25: integer): boolean;
  public
    refresh:LgetRefreshClick;
    { Public declarations }
    procedure GetData(ARkey60:string);
    procedure Get89(Arkey25:string);
    procedure init;
    function cacl_deficiency(Arkey10:string; nowAmount: currency): currency;
    procedure save_so();
    procedure TryEnabled(LBool:Boolean);
    procedure ClearEdit;
  end;

var
  frmNewSales2: TfrmNewSales2;

implementation

{$R *.dfm}
procedure TfrmNewSales2.ClearEdit;
begin
  Edit2.Text:='';
  Label4.Caption:='';
  redt2.Text:='';
  RKeyRzBtnEdit2.Text:='';
  RKeyRzBtnEdit3.Text:='';
  RKeyRzBtnEdit17.Text:='';
  RKeyRzBtnEdit18.Text:='';
  Edit1.Text:='';
  RKeyRzBtnEdit5.Text:='';
  RKeyRzBtnEdit19.Text:='';
  RKeyRzBtnEdit6.Text:='';
  ComboBox1.Items.Clear;
  RKeyRzBtnEdit8.Text:='';
  RKeyRzBtnEdit9.Text:='';
  RKeyRzBtnEdit10.Text:='';
  RKeyRzBtnEdit11.Text:='';
  RKeyRzBtnEdit12.Text:='';
  RKeyRzBtnEdit13.Text:='';
  RKeyRzBtnEdit14.Text:='';
  RKeyRzBtnEdit15.Text:='';
  RKeyRzBtnEdit16.Text:='';
  Edit14.Text:='';
  Edit18.Text:='';
  Edit19.Text:='';
  Memo2.Text:='';
  Memo1.Text:='';
  Memo3.Text:='';
end;

function TfrmNewSales2.find_parterror(rkey25:integer): boolean;
var Lcds:TClientDataSet;
begin
  find_parterror:=false;
  lcds:=TClientDataSet.Create(Application);
  try
    if not gSvrIntf.IntfGetDataBySql('SELECT rkey FROM Data0273 where COPYFROMCUST_PTR='+inttostr(rkey25),Lcds) then Exit;
    if not Lcds.IsEmpty then
      Result:=True;
  finally
    lcds.Free;
  end;
end;

function TfrmNewSales2.Power(x, y: extended): extended;
begin
  result := exp(y*ln(x));
end;

function TfrmNewSales2.update04(table_name: string; var LsName: string): string;
var
  i,v_length:integer;
  v_last,v_seed,new_seed:string;
begin
  if not gSvrIntf.IntfGetDataBySql('select * from data0004 where table_name='''+table_name+'''',cds04) then Exit;
  if not cds04.IsEmpty then
  begin
    v_seed:=cds04.FieldByName('SEED_VALUE').AsString;
    LsName:=v_seed;
    if cds04.FieldByName('SEED_FLAG').Value<>1 then
    begin
      v_length := length(v_seed);
      for i := v_length downto 1 do
      if (copy(v_seed,i,1)<'0') or (copy(v_seed,i,1)>'9') then  //如果不是数字
      begin
        v_last := floattostr(power(10,v_length)+strtofloat(copy(v_seed,i+1,v_length-i))+1); //后缀加1
        new_seed := copy(v_seed,1,i)+copy(v_last,i+2,v_length-i); //使前缀不变后缀加1
        break;
      end
      else
      if i=1 then //如果第一位仍然是数字
        begin
         v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
         new_seed := copy(v_last,2,v_length);
        end;
    end;
  end;
  result:=new_seed;
end;

procedure TfrmNewSales2.add_mulClick(Sender: TObject);
var LFrm: TfrmMulti_so;
    Lfrm2:TfrmAddSales;
    i,j,v_row,i_row:Integer;
    v_so:string;
begin
  inherited;
  LFrm:= TfrmMulti_so.Create(nil);
  try
    LFrm.maskedit1.Text:=datetostr(dShortDate+ship_lead_time+shelf_life);
    LFrm.label7.caption := '出货板方式: '+inttostr(set_qty);
    if (Trim(LFrm.label7.caption)='') or (set_qty=0) then LFrm.set_qty:=1 else LFrm.set_qty:=set_qty;
    if LFrm.ShowModal = mrOk then
    begin
      LFrm2:= TfrmAddSales.Create(nil);
      try
        if (Trim(Edit19.Text)='') then Lfrm2.RUSH_CHARGE:=0 else Lfrm2.RUSH_CHARGE:=StrToFloat(Trim(Edit19.Text));//税率
        if (unit_sq=0) then Lfrm2.unit_sq:=0 else Lfrm2.unit_sq:=unit_sq; //单只面积
        if (RadioGroup2.ItemIndex=0) then Lfrm2.ItemIndex:=0;//含税标识

        LFrm2.GetData(cds60.FieldByName('CUST_PART_PTR').AsString,cds60.FieldByName('PURCHASE_ORDER_PTR').AsString);
        if (credit_rating = 3) then  //信用等级
          Lfrm2.Label43.Caption:= '差'
        else if (credit_rating = 1) then
          Lfrm2.Label43.Caption:= '优'
        else
          Lfrm2.Label43.Caption:= '良';
        Lfrm2.CREDIT_RATING:=credit_rating; //信用等级
        Lfrm2.Label44.Caption:= formatfloat('0.0000',credit_limit); //信用限额
        Lfrm2.Label45.Caption:= formatfloat('0.0000',cacl_deficiency(cds60.FieldByName('CUSTOMER_PTR').AsString,0));//未结算总额
        Lfrm2.label47.Caption:=inttostr(set_qty);//出货板方式
        if (Trim(Label47.Caption)='') or (set_qty=0) then Lfrm2.set_qty:=1 else Lfrm2.set_qty:=set_qty;
        Lfrm2.quote_flag:=quote_flag; //与报价单关联
        Lfrm2.SHIP_LEAD_TIME:=SHIP_LEAD_TIME; //装运交货提前天数
        Lfrm2.shelf_life:=shelf_life;//产品周期
        Lfrm2.MANU_PART_DESC:=Trim(RKeyRzBtnEdit17.Text); //客户型号,,
        Lfrm2.manu_part_number:=Trim(RKeyRzBtnEdit3.Text); //本厂编号
        Lfrm2.CURRENCY_PTR:=cds60.FieldByName('CURRENCY_PTR').AsString;//01Rkey
        Lfrm2.init;
        if not quote_flag then
        begin
          Lfrm2.edit3.Text:=Lfrm2.label35.Caption;      //价格pcs
          Lfrm2.Edit18.Text:=formatfloat('0.00000000',strtofloat(Lfrm2.edit3.Text)*set_qty);  //价格set
        end;
        Lfrm2.Edit2.Text:=LFrm.Edit4.Text;;//数量
        Lfrm2.MaskEdit1.Text:=LFrm.maskedit1.Text;//客户交期
        Lfrm2.MaskEdit3.Text:=Lfrm2.MaskEdit1.Text;// 原始客户交期
        Lfrm2.MaskEdit2.Text:=datetostr(strtodate(Lfrm2.MaskEdit1.Text)-ship_lead_time);//计划交期
        Lfrm2.suplcimat192:=cds192.FieldByName('suplcimat').AsString;//192状态样板及备品订单以外的SO单价不可以为零
        Lfrm2.v_part_num:=v_part_num;//样板或量产
        Lfrm2.so_style:=ComboBox2.ItemIndex; //订单类型:正品/备品
        Lfrm2.so_tp:=RadioGroup1.ItemIndex;//订单类别自制外发半制程0,1,2
        Lfrm2.customer_quote:= customer_quote;  //客户报价关联标志
        Lfrm2.CUSTSTAPROD192:=cds192.FieldByName('CUSTSTAPROD').AsString;//192是否受信用控制
        Lfrm2.code10:=Trim(Edit2.Text);//客户代码
        Lfrm2.EXCH_RATE:=Trim(RKeyRzBtnEdit9.Text);//汇率
        Lfrm2.credit_limit:=credit_limit;//信用限额
        Lfrm2.rkey10:=cds60.FieldByName('CUSTOMER_PTR').Value;//data0010.Rkey
        LFrm2.custcitool192:=cds192.FieldByName('custcitool').AsString;//是否允许输入SET数
        //销售订单号
        Lfrm2.Edit1.Text:=gFunc.Get04SeedValue('data0060');
        Lfrm2.edit1.text:=Lfrm2.edit1.text+'-01'; //添加销售订单后缀
        LFrm2.Edit2.Visible:=false;               //使数量不可见
        LFrm2.Label2.Visible:=false;
        LFrm2.MaskEdit1.Visible:=false;
        LFrm2.MaskEdit2.Visible:=false;
        LFrm2.Label7.Visible:=false;
        LFrm2.Label8.Visible:=false;
        LFrm2.Label1.Visible:=false;
        LFrm2.Edit1.Visible:=false;
        LFrm2.Edit16.Visible:=false;
        LFrm2.Label26.Visible:=false;
        if Lfrm2.ShowModal = mrOk then
        begin
          if (Trim(Lfrm2.Edit10.Text)<>'') then
          begin
            FBp06_ptr:=Lfrm2.BP06IDkey;//BOM06Rkey
            FBomBuHanShuiJiaGe:=Trim(Lfrm2.Labele06.Caption);//不含税单价BOM报价
          end else
          begin
            FBp06_ptr:='';//BOM06Rkey
            FBomBuHanShuiJiaGe:=''; //不含税单价BOM报价
          end;
          for I := 1 to StrToInt(LFrm.Edit2.Text) do
          begin
            if (i=1) then
            begin

              i_row:=stringgrid1.RowCount-1;
              for j:=1 to Lfrm2.StringGrid1.rowcount-2 do    //暂时保存新增定单工具费用
              if (strtofloat(Lfrm2.StringGrid1.Cells[1,j])>0) or
              (strtofloat(Lfrm2.StringGrid1.Cells[2,j])>0) or
              (strtofloat(Lfrm2.StringGrid1.Cells[3,j])>0) then
              begin
                cds62.Append;
                cds62.Fieldvalues['so_ptr'] := stringgrid1.RowCount-1;
                cds62.FieldByName('addl_cat_ptr').asstring := Trim(Lfrm2.StringGrid1.Cells[5,j]);
                cds62.FieldByName('amount').asstring := Trim(Lfrm2.StringGrid1.Cells[1,j]);
                cds62.FieldByName('free_amount').asstring := Trim(Lfrm2.StringGrid1.Cells[2,j]);
                cds62.FieldByName('costfree_amount').asstring := Trim(Lfrm2.StringGrid1.Cells[3,j]);
                cds62.FieldByName('TAX_FLAG').Value:=Trim(Lfrm2.StringGrid1.Cells[4,j]);
                cds62.post;
              end;
              StringGrid1.Cells[str_list.IndexOf('工具税'),StringGrid1.RowCount-1]:=Trim(Lfrm2.Label31.Caption);
              StringGrid1.Cells[str_list.IndexOf('工具费用'),StringGrid1.RowCount-1]:=Trim(Lfrm2.Label33.Caption);
            end else
            if (i>1) then
            begin
              StringGrid1.Cells[str_list.IndexOf('工具税'),StringGrid1.RowCount-1]:='0.0000';
              StringGrid1.Cells[str_list.IndexOf('工具费用'),StringGrid1.RowCount-1]:='0.0000';
            end;
            StringGrid1.Cells[str_list.IndexOf('订单编号'),StringGrid1.RowCount-1]:=Trim(Lfrm2.Edit1.text);
            StringGrid1.Cells[str_list.IndexOf('报价单号'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit10.text);
            StringGrid1.Cells[str_list.IndexOf('pcs数量'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit2.Text);
            StringGrid1.Cells[str_list.IndexOf('pcs价格'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit3.Text);
            StringGrid1.Cells[str_list.IndexOf('参考附注'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit9.Text);
            StringGrid1.Cells[str_list.IndexOf('折扣'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit5.Text);
            StringGrid1.Cells[str_list.IndexOf('优先'),StringGrid1.RowCount-1]:= Trim(Lfrm2.combobox2.Text);
            StringGrid1.Cells[str_list.IndexOf('客户交货期'),StringGrid1.RowCount-1]:=Trim(Lfrm2.maskedit1.Text);
            StringGrid1.Cells[str_list.IndexOf('计划装运期'),StringGrid1.RowCount-1]:=Trim(Lfrm2.maskedit2.Text);
            StringGrid1.Cells[str_list.IndexOf('原始客户交期'),StringGrid1.RowCount-1]:=Trim(Lfrm2.maskedit3.Text);
            StringGrid1.Cells[str_list.IndexOf('分析代码4'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit4.Text);
            StringGrid1.Cells[str_list.IndexOf('分析代码5'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit7.Text);
            StringGrid1.Cells[str_list.IndexOf('分析代码1'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit11.text);
            StringGrid1.Cells[str_list.IndexOf('分析代码2'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit12.text);
            StringGrid1.Cells[str_list.IndexOf('分析代码3'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit13.text);
            StringGrid1.Cells[str_list.IndexOf('set数量'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit16.text);
            StringGrid1.Cells[str_list.IndexOf('set价格'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit18.text);
            StringGrid1.Cells[str_list.IndexOf('价格合计'),StringGrid1.RowCount-1]:=Trim(Lfrm2.Label30.Caption);
            StringGrid1.Cells[str_list.IndexOf('税金'),StringGrid1.RowCount-1]:=Trim(Lfrm2.Label16.Caption);
            StringGrid1.Cells[str_list.IndexOf('折扣'),StringGrid1.RowCount-1]:=Trim(Lfrm2.Label32.Caption);
            StringGrid1.Cells[str_list.IndexOf('总合计'),StringGrid1.RowCount-1]:= Trim(Lfrm2.Label34.Caption);
            StringGrid1.Cells[str_list.IndexOf('面积'),StringGrid1.RowCount-1]:=Trim(Lfrm2.Label41.Caption);
            StringGrid1.Cells[str_list.IndexOf('Rkey283'),StringGrid1.RowCount-1]:=IntToStr(Lfrm2.i283rkey);
            if (Trim(Lfrm2.Edit10.Text)='') then
            begin
              StringGrid1.Cells[str_list.IndexOf('BOM06rkey'),StringGrid1.RowCount-1]:='';
              StringGrid1.Cells[str_list.IndexOf('BOM不含税价格'),StringGrid1.RowCount-1]:='';
            end else
            begin
              StringGrid1.Cells[str_list.IndexOf('BOM06rkey'),StringGrid1.RowCount-1]:=FBp06_ptr;
              StringGrid1.Cells[str_list.IndexOf('BOM不含税价格'),StringGrid1.RowCount-1]:=FBomBuHanShuiJiaGe;
            end;
            label44.Caption:=formatfloat('0.0000',strtofloat(label44.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('价格合计'),stringgrid1.RowCount-1]));
            label61.Caption:=formatfloat('0.000',strtofloat(label61.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('税金'),stringgrid1.RowCount-1]));
            label46.Caption:=formatfloat('0.000',strtofloat(label46.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('折扣'),stringgrid1.RowCount-1]));
            label47.Caption:=formatfloat('0.0000',strtofloat(label47.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('工具费用'),stringgrid1.RowCount-1]));
            label63.Caption:=formatfloat('0.0000',strtofloat(label63.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('工具税'),stringgrid1.RowCount-1]));
            label48.Caption:=formatfloat('0.0000',strtofloat(label48.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('总合计'),stringgrid1.RowCount-1]));
            label60.Caption:=formatfloat('0.0000',strtofloat(label60.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('面积'),stringgrid1.RowCount-1]));
            if (i>1) then
            begin
              v_so:=copy(stringgrid1.Cells[str_list.IndexOf('订单编号'),stringgrid1.RowCount-2],1,pos('-',stringgrid1.Cells[str_list.IndexOf('订单编号'),stringgrid1.RowCount-2])-1);
              v_row:=strtoint(copy(stringgrid1.Cells[str_list.IndexOf('订单编号'),stringgrid1.RowCount-2],pos('-',stringgrid1.Cells[str_list.IndexOf('订单编号'),stringgrid1.RowCount-2])+1,2))+1;
              if v_row<10 then  //上语句取后缀
              v_so:=v_so+'-0'+inttostr(v_row)
              else
               v_so:=v_so+'-'+inttostr(v_row);
              stringgrid1.Cells[str_list.IndexOf('订单编号'),stringgrid1.RowCount-1]:=v_so;
              stringgrid1.Cells[str_list.IndexOf('客户交货期'),stringgrid1.RowCount-1]:=datetostr(strtodate(stringgrid1.Cells[str_list.IndexOf('客户交货期'),stringgrid1.RowCount-2])+strtoint(LFrm.Edit1.Text));
              stringgrid1.Cells[str_list.IndexOf('计划装运期'),stringgrid1.RowCount-1]:=datetostr(strtodate(stringgrid1.Cells[str_list.IndexOf('客户交货期'),stringgrid1.RowCount-1])-ship_lead_time);
              if (radiogroup2.ItemIndex=1) then//含税
              begin
                label48.Caption:=formatfloat('0.0000',strtofloat(label48.Caption)-strtofloat(stringgrid1.Cells[str_list.IndexOf('工具费用'),i_row]));
                stringgrid1.Cells[str_list.IndexOf('总合计'),stringgrid1.RowCount-1]:=formatfloat   //总计
                 ('0.0000',strtofloat(stringgrid1.Cells[str_list.IndexOf('总合计'),stringgrid1.RowCount-1])-
                           strtofloat(stringgrid1.Cells[str_list.IndexOf('工具费用'),i_row]));
              end
              else
              begin
                label48.Caption:=formatfloat('0.0000',strtofloat(label48.Caption)-strtofloat(stringgrid1.Cells[str_list.IndexOf('工具费用'),i_row])-strtofloat(stringgrid1.Cells[str_list.IndexOf('工具税'),i_row]));
                stringgrid1.Cells[str_list.IndexOf('总合计'),stringgrid1.RowCount-1]:=formatfloat   //总计
                 ('0.0000',strtofloat(stringgrid1.Cells[str_list.IndexOf('总合计'),stringgrid1.RowCount-1])-
                           strtofloat(stringgrid1.Cells[str_list.IndexOf('工具费用'),i_row])-
                           strtofloat(stringgrid1.Cells[str_list.IndexOf('工具税'),i_row]));
              end;
            end;
            StringGrid1.RowCount:=StringGrid1.RowCount+1;
          end;
          if (StringGrid1.RowCount>2) then
          begin
            TryEnabled(False);
            btnSave.Enabled:=True;
          end;
        end;
      finally
        LFrm2.Free;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmNewSales2.add_sinClick(Sender: TObject);
var Lfrm2:TfrmAddSales;
    j,v_row:Integer;
begin
  Lfrm2:= TfrmAddSales.Create(nil);
  try
    Lfrm2.FEditType:=0;//新增
    Lfrm2.if213:=0;
    if213:=0;
    if (Trim(Edit19.Text)='') then Lfrm2.RUSH_CHARGE:=0 else Lfrm2.RUSH_CHARGE:=StrToFloat(Trim(Edit19.Text));//税率
    if (unit_sq=0) then Lfrm2.unit_sq:=0 else Lfrm2.unit_sq:=unit_sq; //单只面积
    if (RadioGroup2.ItemIndex=0) then Lfrm2.ItemIndex:=0;//含税标识

    LFrm2.GetData(cds60.FieldByName('CUST_PART_PTR').AsString,cds60.FieldByName('PURCHASE_ORDER_PTR').AsString);
    if (credit_rating = 3) then
      Lfrm2.Label43.Caption:= '差'
    else if (credit_rating = 1) then
      Lfrm2.Label43.Caption:= '优'
    else
      Lfrm2.Label43.Caption:= '良';
    Lfrm2.CREDIT_RATING:=credit_rating; //信用等级
    Lfrm2.Label44.Caption:= formatfloat('0.0000',credit_limit); //信用限额
    Lfrm2.Label45.Caption:= formatfloat('0.0000',cacl_deficiency(cds60.FieldByName('CUSTOMER_PTR').AsString,0));//未结算总额
    Lfrm2.label47.Caption:=inttostr(set_qty);//出货板方式
    if (Trim(Label47.Caption)='') or (set_qty=0) then Lfrm2.set_qty:=1 else Lfrm2.set_qty:=set_qty;
    Lfrm2.quote_flag:=quote_flag; //与报价单关联
    Lfrm2.SHIP_LEAD_TIME:=SHIP_LEAD_TIME; //装运交货提前天数
    Lfrm2.shelf_life:=shelf_life;//产品周期
    Lfrm2.MANU_PART_DESC:=Trim(RKeyRzBtnEdit17.Text); //客户型号,,
    Lfrm2.manu_part_number:=Trim(RKeyRzBtnEdit3.Text); //本厂编号
    Lfrm2.CURRENCY_PTR:=cds60.FieldByName('CURRENCY_PTR').AsString;//01Rkey
    Lfrm2.init;
    if not quote_flag then
    begin
      Lfrm2.Edit3.Text:=Lfrm2.label35.Caption;
      Lfrm2.Edit18.Text:=formatfloat('0.00000000',strtofloat(Lfrm2.Edit3.Text)*self.set_qty);  //价格set
    end;
    LFrm2.MaskEdit2.Text := datetostr(gFunc.GetSvrDateTime+self.shelf_life); //计划交期=当前系统系统时间+ 产品周期
    LFrm2.maskedit1.Text := datetostr(strtodate(LFrm2.maskedit2.text)+SHIP_LEAD_TIME); //客户交期=计划交期+装运提前天数
    LFrm2.MaskEdit3.Text :=LFrm2.maskedit1.Text;  //原始客户交期=客户交期
    Lfrm2.suplcimat192:=cds192.FieldByName('suplcimat').AsString;//192状态样板及备品订单以外的SO单价不可以为零
    Lfrm2.v_part_num:=v_part_num;//样板或量产
    Lfrm2.so_style:=ComboBox2.ItemIndex; //订单类型:正品/备品
    Lfrm2.so_tp:=RadioGroup1.ItemIndex;//订单类别自制外发半制程0,1,2
    Lfrm2.customer_quote:= customer_quote;  //客户报价关联标志
    Lfrm2.CUSTSTAPROD192:=cds192.FieldByName('CUSTSTAPROD').AsString;//192是否受信用控制
    Lfrm2.code10:=Trim(Edit2.Text);//客户代码
    Lfrm2.EXCH_RATE:=Trim(RKeyRzBtnEdit9.Text);//汇率
    Lfrm2.credit_limit:=credit_limit;//信用限额
    Lfrm2.rkey10:=cds60.FieldByName('CUSTOMER_PTR').Value;//data0010.Rkey
    LFrm2.custcitool192:=cds192.FieldByName('custcitool').AsString;//是否允许输入SET数
    //销售订单号
    Lfrm2.Edit1.Text:=gFunc.Get04SeedValue('data0060');
    if (StringGrid1.RowCount<=2) and (Trim(StringGrid1.Cells[0,1])='') then //第一张订单号
    begin
      Lfrm2.edit1.text:=Lfrm2.edit1.text+'-01'; //添加销售订单后缀
    end else
    begin   //已存在订单号中增加
      v_row := pos('-',stringgrid1.Cells[0,stringgrid1.rowcount-2]);
      v_row := strtoint(copy(trim(stringgrid1.Cells[0,stringgrid1.rowcount-2]),v_row+1,2))+1;
      if v_row<10 then
        Lfrm2.edit1.text:=Trim(Lfrm2.edit1.text)+'-0'+inttostr(v_row)
      else
        Lfrm2.edit1.text:=Trim(Lfrm2.edit1.text)+'-'+inttostr(v_row);
    end;
    if LFrm2.ShowModal = mrOk then
    begin
      if (Trim(Lfrm2.Edit10.Text)<>'') then
      begin
        FBp06_ptr:=Lfrm2.BP06IDkey;//BOM06Rkey
        FBomBuHanShuiJiaGe:=Trim(Lfrm2.Labele06.Caption);//不含税单价BOM报价
      end else
      begin
        FBp06_ptr:='';//BOM06Rkey
        FBomBuHanShuiJiaGe:=''; //不含税单价BOM报价
      end;
      StringGrid1.Cells[str_list.IndexOf('订单编号'),StringGrid1.RowCount-1]:=Trim(Lfrm2.Edit1.text);
      StringGrid1.Cells[str_list.IndexOf('报价单号'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit10.text);
      StringGrid1.Cells[str_list.IndexOf('pcs数量'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit2.Text);
      StringGrid1.Cells[str_list.IndexOf('pcs价格'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit3.Text);
      StringGrid1.Cells[str_list.IndexOf('参考附注'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit9.Text);
      StringGrid1.Cells[str_list.IndexOf('折扣'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit5.Text);
      StringGrid1.Cells[str_list.IndexOf('优先'),StringGrid1.RowCount-1]:= Trim(Lfrm2.combobox2.Text);
      StringGrid1.Cells[str_list.IndexOf('客户交货期'),StringGrid1.RowCount-1]:=Trim(Lfrm2.maskedit1.Text);
      StringGrid1.Cells[str_list.IndexOf('计划装运期'),StringGrid1.RowCount-1]:=Trim(Lfrm2.maskedit2.Text);
      StringGrid1.Cells[str_list.IndexOf('原始客户交期'),StringGrid1.RowCount-1]:=Trim(Lfrm2.maskedit3.Text);
      StringGrid1.Cells[str_list.IndexOf('分析代码4'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit4.Text);
      StringGrid1.Cells[str_list.IndexOf('分析代码5'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit7.Text);
      StringGrid1.Cells[str_list.IndexOf('分析代码1'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit11.text);
      StringGrid1.Cells[str_list.IndexOf('分析代码2'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit12.text);
      StringGrid1.Cells[str_list.IndexOf('分析代码3'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit13.text);
      StringGrid1.Cells[str_list.IndexOf('set数量'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit16.text);
      StringGrid1.Cells[str_list.IndexOf('set价格'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit18.text);
      StringGrid1.Cells[str_list.IndexOf('工具税'),StringGrid1.RowCount-1]:=Trim(Lfrm2.Label31.Caption);
      StringGrid1.Cells[str_list.IndexOf('工具费用'),StringGrid1.RowCount-1]:=Trim(Lfrm2.Label33.Caption);
      StringGrid1.Cells[str_list.IndexOf('价格合计'),StringGrid1.RowCount-1]:=Trim(Lfrm2.Label30.Caption);
      StringGrid1.Cells[str_list.IndexOf('税金'),StringGrid1.RowCount-1]:=Trim(Lfrm2.Label16.Caption);
      StringGrid1.Cells[str_list.IndexOf('折扣'),StringGrid1.RowCount-1]:=Trim(Lfrm2.Label32.Caption);
      StringGrid1.Cells[str_list.IndexOf('总合计'),StringGrid1.RowCount-1]:= Trim(Lfrm2.Label34.Caption);
      StringGrid1.Cells[str_list.IndexOf('面积'),StringGrid1.RowCount-1]:=Trim(Lfrm2.Label41.Caption);
      StringGrid1.Cells[str_list.IndexOf('Rkey283'),StringGrid1.RowCount-1]:=IntToStr(Lfrm2.i283rkey);
      if (if213=0) then
      begin
        StringGrid1.Cells[str_list.IndexOf('rkey213'),StringGrid1.RowCount-1]:='';
        StringGrid1.Cells[str_list.IndexOf('已使用数量'),StringGrid1.RowCount-1]:='';
        StringGrid1.Cells[str_list.IndexOf('预处理数量'),StringGrid1.RowCount-1]:='';
      end else
      begin
        StringGrid1.Cells[str_list.IndexOf('rkey213'),StringGrid1.RowCount-1]:=cds60.FieldByName('rkey213').Value;
        StringGrid1.Cells[str_list.IndexOf('已使用数量'),StringGrid1.RowCount-1]:=IntToStr(Lfrm2.Edit2.Tag);
        StringGrid1.Cells[str_list.IndexOf('预处理数量'),StringGrid1.RowCount-1]:=IntToStr(Lfrm2.BitBtn1.Tag);
      end;
      if (Trim(Lfrm2.Edit10.Text)='') then
      begin
        StringGrid1.Cells[str_list.IndexOf('BOM06rkey'),StringGrid1.RowCount-1]:='';
        StringGrid1.Cells[str_list.IndexOf('BOM不含税价格'),StringGrid1.RowCount-1]:='';
      end else
      begin
        StringGrid1.Cells[str_list.IndexOf('BOM06rkey'),StringGrid1.RowCount-1]:=FBp06_ptr;
        StringGrid1.Cells[str_list.IndexOf('BOM不含税价格'),StringGrid1.RowCount-1]:=FBomBuHanShuiJiaGe;
      end;
      label44.Caption:=formatfloat('0.0000',strtofloat(label44.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('价格合计'),stringgrid1.RowCount-1]));
      label61.Caption:=formatfloat('0.000',strtofloat(label61.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('税金'),stringgrid1.RowCount-1]));
      label46.Caption:=formatfloat('0.000',strtofloat(label46.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('折扣'),stringgrid1.RowCount-1]));
      label47.Caption:=formatfloat('0.0000',strtofloat(label47.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('工具费用'),stringgrid1.RowCount-1]));
      label63.Caption:=formatfloat('0.0000',strtofloat(label63.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('工具税'),stringgrid1.RowCount-1]));
      label48.Caption:=formatfloat('0.0000',strtofloat(label48.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('总合计'),stringgrid1.RowCount-1]));
      label60.Caption:=formatfloat('0.0000',strtofloat(label60.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('面积'),stringgrid1.RowCount-1]));
      for j:=1 to Lfrm2.StringGrid1.rowcount-2 do    //暂时保存新增定单工具费用
      if (strtofloat(Lfrm2.StringGrid1.Cells[1,j])>0) or
      (strtofloat(Lfrm2.StringGrid1.Cells[2,j])>0) or
      (strtofloat(Lfrm2.StringGrid1.Cells[3,j])>0) then
      begin
        cds62.Append;
        cds62.Fieldvalues['so_ptr'] := stringgrid1.RowCount-1;;
        cds62.FieldByName('addl_cat_ptr').asstring := Trim(Lfrm2.StringGrid1.Cells[5,j]);
        cds62.FieldByName('amount').asstring := Trim(Lfrm2.StringGrid1.Cells[1,j]);
        cds62.FieldByName('free_amount').asstring := Trim(Lfrm2.StringGrid1.Cells[2,j]);
        cds62.FieldByName('costfree_amount').asstring := Trim(Lfrm2.StringGrid1.Cells[3,j]);
        cds62.FieldByName('TAX_FLAG').Value:=Trim(Lfrm2.StringGrid1.Cells[4,j]);
        cds62.post;
      end;
      StringGrid1.RowCount:=StringGrid1.RowCount+1;
      if (StringGrid1.RowCount>2) then
      begin
        TryEnabled(False);
        btnSave.Enabled:=True;
      end;
    end;
  finally
    LFrm2.Free;
  end;
end;

procedure TfrmNewSales2.BitBtn12Click(Sender: TObject);
var LFrm: TfrmShow213;
    parts_ordered,parts_price,strWhere,rkey213:string;
    i,j,v_row:Integer;
    sBookMark:TBookmark;
    Lfrm2:TfrmAddSales;
begin
  inherited;
  strWhere:='';
  LFrm:= TfrmShow213.Create(nil);
  try
    if (Trim(RKeyRzBtnEdit3.Text)<>'') then strWhere:=' and data0213.MANU_PART_NUMBER='+quotedstr(Trim(RKeyRzBtnEdit3.Text)) else strWhere:='';
    if (Trim(Edit1.Text)<>'') then strWhere:=strWhere+' and data0213.PO_NUMBER='+quotedstr(Trim(Edit1.Text)) else strWhere:='';
    if (Trim(redt2.Text)<>'') then strWhere:=strWhere+' and data0015.WAREHOUSE_CODE='+quotedstr(Trim(redt2.Text)) else strWhere:='';
    LFrm.GetData(strWhere);
    if LFrm.ShowModal = mrOk then
    begin
      if213:=1;
      for i :=1  to LFrm.DBGridEh1.SelectedRows.Count do
      begin
        LFrm.DBGridEh1.DataSource.DataSet.Bookmark :=LFrm.DBGridEh1.SelectedRows.Items[i-1]; //定位标签
        sBookMark := LFrm.DBGridEh1.DataSource.DataSet.GetBookmark;//得到数据库中的记录位置标签
        LFrm.DBGridEh1.DataSource.DataSet.GotoBookmark(sBookMark);//转到该标签处
        RKeyRzBtnEdit2.Enabled:=False;
        if (i=1) then
        begin
          cds60.Edit;
          cds60.FieldByName('CUST_PART_PTR').Value:=LFrm.cds213.FieldByName('rkey25').Value;// 本厂编号
          if (Trim(LFrm.cds213.FieldByName('orig_customer').AsString)<>'') then
          cds60.FieldByName('ORIG_CUSTOMER').Value:=LFrm.cds213.FieldByName('orig_customer').AsString;//关联原客户
          cds60.FieldByName('SHIP_REG_TAX_ID').Value:=LFrm.cds213.FieldByName('rkey15').Value;// 工厂
          cds60.FieldByName('CUSTOMER_PTR').Value:=LFrm.cds213.FieldByName('rkey10').Value;// 客户
          cds60.FieldByName('PURCHASE_ORDER_PTR').Value:=LFrm.cds213.FieldByName('rkey97').Value;//97rkey
          cds60.Post;
        end;
        edit2.Text:=LFrm.cds213.FieldByName('cust_code').AsString;
        Label4.Caption:=LFrm.cds213.FieldByName('customer_name').AsString;
        rkey213:=LFrm.cds213.FieldByName('rkey').AsString;//213rkey
        Edit2Exit(nil);
        RKeyRzBtnEdit3Exit(nil);
        Edit1.Text:=LFrm.cds213.FieldByName('PO_NUMBER').AsString;//客户订单号
        RKeyRzBtnEdit5.Text:=LFrm.cds213.FieldByName('PO_DATE').AsString;// PO日期
        ComboBox2.ItemIndex:=LFrm.cds213.FieldByName('so_style').Value; //订单类型
        parts_ordered:=IntToStr(LFrm.cds213.FieldByName('PARTS_ORDERED').AsInteger-LFrm.cds213.FieldByName('UsedQuantity').AsInteger);//预处理数量=默认显示数量-已使用数量
        if (LFrm.cds213.FieldByName('EDI_FLAG_FOR_INVOICE').Value=1) then //单价，判断213价格是否含税，如果不含税，不管供应商是否含税，以213为主
        begin
         parts_price:= formatfloat('0.00000000',LFrm.cds213.FieldByName('PART_PRICE').Value); //213含税标志
        end else
        begin
          if (frmNewSales2.RadioGroup2.ItemIndex = 0) and (LFrm.cds213.FieldByName('so_style').Value=0) then  //不含税
          begin
            if (StrToFloat(frmNewSales2.Edit19.Text)>0) and (LFrm.cds213.FieldByName('PART_PRICE').Value>0) then //含税
              parts_price:= formatfloat('0.00000000',LFrm.cds213.FieldByName('PART_PRICE').Value/(1+strtofloat(frmNewSales2.Edit19.Text)*0.01))
            else
              parts_price:= formatfloat('0.00000000',LFrm.cds213.FieldByName('PART_PRICE').Value);
          end
          else if (LFrm.cds213.FieldByName('PART_PRICE').Value>0) and (LFrm.cds213.FieldByName('so_style').Value=0) then
          begin
            parts_price:= formatfloat('0.00000000',LFrm.cds213.FieldByName('PART_PRICE').Value);
          end;
        end;
        LFrm2:= TfrmAddSales.Create(nil);
        try
          Lfrm2.if213:=if213;
          if (Trim(Edit19.Text)='') then Lfrm2.RUSH_CHARGE:=0 else Lfrm2.RUSH_CHARGE:=StrToFloat(Trim(Edit19.Text));//税率
          if (unit_sq=0) then Lfrm2.unit_sq:=0 else Lfrm2.unit_sq:=unit_sq; //单只面积
          if (RadioGroup2.ItemIndex=0) then Lfrm2.ItemIndex:=0;//含税标识

          LFrm2.GetData(cds60.FieldByName('CUST_PART_PTR').AsString,cds60.FieldByName('PURCHASE_ORDER_PTR').AsString);
          if (credit_rating = 3) then  //信用等级
            Lfrm2.Label43.Caption:= '差'
          else if (credit_rating = 1) then
            Lfrm2.Label43.Caption:= '优'
          else
            Lfrm2.Label43.Caption:= '良';
          Lfrm2.CREDIT_RATING:=credit_rating; //信用等级
          Lfrm2.Label44.Caption:= formatfloat('0.0000',credit_limit); //信用限额
          Lfrm2.Label45.Caption:= formatfloat('0.0000',cacl_deficiency(cds60.FieldByName('CUSTOMER_PTR').AsString,0));//未结算总额
          Lfrm2.label47.Caption:=inttostr(set_qty);//出货板方式
          if (Trim(Label47.Caption)='') or (set_qty=0) then Lfrm2.set_qty:=1 else Lfrm2.set_qty:=set_qty;
          Lfrm2.quote_flag:=quote_flag; //与报价单关联
          Lfrm2.SHIP_LEAD_TIME:=SHIP_LEAD_TIME; //装运交货提前天数
          Lfrm2.shelf_life:=shelf_life;//产品周期
          Lfrm2.MANU_PART_DESC:=Trim(RKeyRzBtnEdit17.Text); //客户型号,,
          Lfrm2.manu_part_number:=Trim(RKeyRzBtnEdit3.Text); //本厂编号
          Lfrm2.CURRENCY_PTR:=cds60.FieldByName('CURRENCY_PTR').AsString;//01Rkey
          Lfrm2.init;
          Lfrm2.Edit2.Text:=parts_ordered;//数量
          Lfrm2.Edit3.Text:=parts_price;//价格
          Lfrm2.MaskEdit3.Text:=LFrm.cds213.FieldByName('PO_DATE').AsString;// 原始客户交期
          Lfrm2.MaskEdit1.Text:=LFrm.cds213.FieldByName('ORIG_REQUEST_DATE').AsString;//客户交期
          Lfrm2.MaskEdit2.Text:=LFrm.cds213.FieldByName('ORIG_SCHED_SHIP_DATE').AsString;//计划交期
          Lfrm2.Edit9.Text:=LFrm.cds213.FieldByName('REFERENCE_NUMBER').AsString;//参考附注
          Lfrm2.Edit2.Tag:=LFrm.cds213.FieldByName('UsedQuantity').AsInteger;//已使用数量
          Lfrm2.BitBtn1.Tag:=LFrm.cds213.FieldByName('PARTS_ORDERED').AsInteger;//预处理数量
          ComboBox2.ItemIndex:=LFrm.cds213.FieldByName('so_style').Value;//正式或备品
          Lfrm2.suplcimat192:=cds192.FieldByName('suplcimat').AsString;//192状态样板及备品订单以外的SO单价不可以为零
          Lfrm2.v_part_num:=v_part_num;//样板或量产
          Lfrm2.so_style:=ComboBox2.ItemIndex; //订单类型:正品/备品
          Lfrm2.so_tp:=RadioGroup1.ItemIndex;//订单类别自制外发半制程0,1,2
          Lfrm2.customer_quote:= customer_quote;  //客户报价关联标志
          Lfrm2.CUSTSTAPROD192:=cds192.FieldByName('CUSTSTAPROD').AsString;//192是否受信用控制
          Lfrm2.code10:=Trim(Edit2.Text);//客户代码
          Lfrm2.EXCH_RATE:=Trim(RKeyRzBtnEdit9.Text);//汇率
          Lfrm2.credit_limit:=credit_limit;//信用限额
          Lfrm2.rkey10:=cds60.FieldByName('CUSTOMER_PTR').Value;//data0010.Rkey
          LFrm2.custcitool192:=cds192.FieldByName('custcitool').AsString;//是否允许输入SET数
          //销售订单号
          Lfrm2.Edit1.Text:=gFunc.Get04SeedValue('data0060');
          if (StringGrid1.RowCount<=2) and (Trim(StringGrid1.Cells[0,1])='') then //第一张订单号
          begin
            Lfrm2.edit1.text:=Lfrm2.edit1.text+'-01'; //添加销售订单后缀
          end else
          begin   //已存在订单号中增加
            v_row := pos('-',stringgrid1.Cells[0,stringgrid1.rowcount-2]);
            v_row := strtoint(copy(trim(stringgrid1.Cells[0,stringgrid1.rowcount-2]),v_row+1,2))+1;
            if v_row<10 then
              Lfrm2.edit1.text:=Trim(Lfrm2.edit1.text)+'-0'+inttostr(v_row)
            else
              Lfrm2.edit1.text:=Trim(Lfrm2.edit1.text)+'-'+inttostr(v_row);
          end;

          if Lfrm2.ShowModal = mrOk then
          begin
            v_row:=0;
            if (Trim(Lfrm2.Edit10.Text)<>'') then
            begin
              FBp06_ptr:=Lfrm2.BP06IDkey;//BOM06Rkey
              FBomBuHanShuiJiaGe:=Trim(Lfrm2.Labele06.Caption);//不含税单价BOM报价
            end else
            begin
              FBp06_ptr:='';//BOM06Rkey
              FBomBuHanShuiJiaGe:=''; //不含税单价BOM报价
            end;
            StringGrid1.Cells[str_list.IndexOf('订单编号'),StringGrid1.RowCount-1]:=Trim(Lfrm2.Edit1.text);
            StringGrid1.Cells[str_list.IndexOf('报价单号'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit10.text);
            StringGrid1.Cells[str_list.IndexOf('pcs数量'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit2.Text);
            StringGrid1.Cells[str_list.IndexOf('pcs价格'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit3.Text);
            StringGrid1.Cells[str_list.IndexOf('参考附注'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit9.Text);
            StringGrid1.Cells[str_list.IndexOf('折扣'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit5.Text);
            StringGrid1.Cells[str_list.IndexOf('优先'),StringGrid1.RowCount-1]:= Trim(Lfrm2.combobox2.Text);
            StringGrid1.Cells[str_list.IndexOf('客户交货期'),StringGrid1.RowCount-1]:=Trim(Lfrm2.maskedit1.Text);
            StringGrid1.Cells[str_list.IndexOf('计划装运期'),StringGrid1.RowCount-1]:=Trim(Lfrm2.maskedit2.Text);
            StringGrid1.Cells[str_list.IndexOf('原始客户交期'),StringGrid1.RowCount-1]:=Trim(Lfrm2.maskedit3.Text);
            StringGrid1.Cells[str_list.IndexOf('分析代码4'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit4.Text);
            StringGrid1.Cells[str_list.IndexOf('分析代码5'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit7.Text);
            StringGrid1.Cells[str_list.IndexOf('分析代码1'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit11.text);
            StringGrid1.Cells[str_list.IndexOf('分析代码2'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit12.text);
            StringGrid1.Cells[str_list.IndexOf('分析代码3'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit13.text);
            StringGrid1.Cells[str_list.IndexOf('set数量'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit16.text);
            StringGrid1.Cells[str_list.IndexOf('set价格'),StringGrid1.RowCount-1]:=Trim(Lfrm2.edit18.text);
            StringGrid1.Cells[str_list.IndexOf('工具税'),StringGrid1.RowCount-1]:=Trim(Lfrm2.Label31.Caption);
            StringGrid1.Cells[str_list.IndexOf('工具费用'),StringGrid1.RowCount-1]:=Trim(Lfrm2.Label33.Caption);
            StringGrid1.Cells[str_list.IndexOf('价格合计'),StringGrid1.RowCount-1]:=Trim(Lfrm2.Label30.Caption);
            StringGrid1.Cells[str_list.IndexOf('税金'),StringGrid1.RowCount-1]:=Trim(Lfrm2.Label16.Caption);
            StringGrid1.Cells[str_list.IndexOf('折扣'),StringGrid1.RowCount-1]:=Trim(Lfrm2.Label32.Caption);
            StringGrid1.Cells[str_list.IndexOf('总合计'),StringGrid1.RowCount-1]:= Trim(Lfrm2.Label34.Caption);
            StringGrid1.Cells[str_list.IndexOf('面积'),StringGrid1.RowCount-1]:=Trim(Lfrm2.Label41.Caption);
            StringGrid1.Cells[str_list.IndexOf('Rkey283'),StringGrid1.RowCount-1]:=IntToStr(Lfrm2.i283rkey);
            StringGrid1.Cells[str_list.IndexOf('rkey213'),StringGrid1.RowCount-1]:=rkey213;
            StringGrid1.Cells[str_list.IndexOf('已使用数量'),StringGrid1.RowCount-1]:=IntToStr(Lfrm2.Edit2.Tag);
            StringGrid1.Cells[str_list.IndexOf('预处理数量'),StringGrid1.RowCount-1]:=IntToStr(Lfrm2.BitBtn1.Tag);
            if (Trim(Lfrm2.Edit10.Text)='') then
            begin
              StringGrid1.Cells[str_list.IndexOf('BOM06rkey'),StringGrid1.RowCount-1]:='';
              StringGrid1.Cells[str_list.IndexOf('BOM不含税价格'),StringGrid1.RowCount-1]:='';
            end else
            begin
              StringGrid1.Cells[str_list.IndexOf('BOM06rkey'),StringGrid1.RowCount-1]:=FBp06_ptr;
              StringGrid1.Cells[str_list.IndexOf('BOM不含税价格'),StringGrid1.RowCount-1]:=FBomBuHanShuiJiaGe;
            end;
            label44.Caption:=formatfloat('0.0000',strtofloat(label44.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('价格合计'),stringgrid1.RowCount-1]));
            label61.Caption:=formatfloat('0.000',strtofloat(label61.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('税金'),stringgrid1.RowCount-1]));
            label46.Caption:=formatfloat('0.000',strtofloat(label46.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('折扣'),stringgrid1.RowCount-1]));
            label47.Caption:=formatfloat('0.0000',strtofloat(label47.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('工具费用'),stringgrid1.RowCount-1]));
            label63.Caption:=formatfloat('0.0000',strtofloat(label63.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('工具税'),stringgrid1.RowCount-1]));
            label48.Caption:=formatfloat('0.0000',strtofloat(label48.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('总合计'),stringgrid1.RowCount-1]));
            label60.Caption:=formatfloat('0.0000',strtofloat(label60.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('面积'),stringgrid1.RowCount-1]));

            for j:=1 to Lfrm2.StringGrid1.rowcount-2 do    //暂时保存新增定单工具费用
            if (strtofloat(Lfrm2.StringGrid1.Cells[1,j])>0) or
            (strtofloat(Lfrm2.StringGrid1.Cells[2,j])>0) or
            (strtofloat(Lfrm2.StringGrid1.Cells[3,j])>0) then
            begin
              cds62.Append;
              cds62.Fieldvalues['so_ptr'] := stringgrid1.RowCount-1;
              cds62.FieldByName('addl_cat_ptr').asstring := Trim(Lfrm2.StringGrid1.Cells[5,j]);
              cds62.FieldByName('amount').asstring := Trim(Lfrm2.StringGrid1.Cells[1,j]);
              cds62.FieldByName('free_amount').asstring := Trim(Lfrm2.StringGrid1.Cells[2,j]);
              cds62.FieldByName('costfree_amount').asstring := Trim(Lfrm2.StringGrid1.Cells[3,j]);
              cds62.FieldByName('TAX_FLAG').Value:=Trim(Lfrm2.StringGrid1.Cells[4,j]);
              cds62.post;
            end;
            StringGrid1.RowCount:=StringGrid1.RowCount+1;
          end;
        finally
          LFrm2.Free;
        end;
        if (StringGrid1.RowCount>2) then
        begin
          TryEnabled(False);
          btnSave.Enabled:=True;
        end;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmNewSales2.BitBtn1Click(Sender: TObject);
var LFrm: TfrmSinglePickList;
    i:Integer;
begin
  if (Trim(Edit2.Text)<>'') then Edit2.Text:='';
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(72,1,' order by cust_code');
    if LFrm.ShowModal = mrOk then
    begin
      cds60.Edit;
      cds60.FieldByName('CUSTOMER_PTR').Value:=LFrm.cdsPick.FieldByName('rkey').AsInteger; //客户Rkey10
      cds60.FieldByName('CURRENCY_PTR').Value:=LFrm.cdsPick.FieldByName('CURRENCY_PTR').AsInteger;//货币Rkey10
      cds60.FieldByName('EXCH_RATE').Value:=LFrm.cdsPick.FieldByName('EXCH_RATE').Value; //汇率
      cds60.FieldByName('COMM_ASSIGNED_BY_E_P').Value:=LFrm.cdsPick.FieldByName('SALES_REP_PTR').AsInteger; //业务员
      cds60.FieldByName('CUST_SHIP_ADDR_PTR').Value:=LFrm.cdsPick.FieldByName('Rkey12').AsInteger;//装运地址Rkey12
      cds60.FieldByName('COMMISION_ON_TOOLING').Value:=LFrm.cdsPick.FieldByName('EDI_FLAG_FOR_SOACK').Value;//是否转厂
      cds60.FieldByName('STATE_PROD_TAX_FLAG').Value:=LFrm.cdsPick.FieldByName('STATE_PROD_TAX_FLAG').Value;//增值税产品标识Y,N
      cds60.FieldByName('STATE_TOOL_TAX_FLAG').Value:=LFrm.cdsPick.FieldByName('STATE_TOOL_TAX_FLAG').Value;//增值税工具标识Y,N
      cds60.FieldByName('FOB').Value:=LFrm.cdsPick.FieldByName('SHIP_FOB').Value;//合同号
      cds60.FieldByName('SHIPPING_CONTACT').Value:=LFrm.cdsPick.FieldByName('ship_to_contact').Value;//装运联络人
      cds60.FieldByName('SHIPPING_METHOD').Value:=LFrm.cdsPick.FieldByName('ship_shipping_method').Value;//装运方法
      cds60.FieldByName('COD_FLAG').Value:=LFrm.cdsPick.FieldByName('cod_flag').Value;//货到收款(Y,N)
      cds60.FieldByName('SHIP_CONTACT_PHONE').Value:=LFrm.cdsPick.FieldByName('ship_to_phone').Value;//装运联络人电话
      cds60.FieldByName('RUSH_CHARGE').Value:=LFrm.cdsPick.FieldByName('state_tax').Value;//增值税率%
      cds60.FieldByName('COMMISION_ON_TOOLING').Value:=LFrm.cdsPick.FieldByName('EDI_FLAG_FOR_SOACK').Value;//是否出口
      if (LFrm.cdsPick.FieldByName('EDI_FLAG_FOR_INVOICE').AsInteger=0) then
        cds60.FieldByName('tax_in_price').Value:='N'//是否含税标示
      else
        cds60.FieldByName('tax_in_price').Value:='Y';//是否含税标示
      if (Trim(LFrm.cdsPick.FieldByName('SHIP_LEAD_TIME').AsString)='') then
        cds60.FieldByName('rush_charge_pct_used').Value:=0  //装运交货提前天数
      else
        cds60.FieldByName('rush_charge_pct_used').Value:=LFrm.cdsPick.FieldByName('SHIP_LEAD_TIME').AsInteger;  //装运交货提前天数
      cds60.Post;
      edit2.Text:=LFrm.cdsPick.FieldByName('CUST_CODE').AsString;
      Label4.Caption:=LFrm.cdsPick.FieldByName('CUSTOMER_NAME').AsString;
      Label36.Caption:=LFrm.cdsPick.FieldByName('cod_flag').AsString;//货到收款(Y,N)
      Label3.Caption:=LFrm.cdsPick.FieldByName('FED_TAX_ID_NO').AsString;//付款方式
      radiogroup2.ItemIndex:=LFrm.cdsPick.FieldByName('EDI_FLAG_FOR_INVOICE').AsInteger;//是否含税标示
      Edit18.Text:=LFrm.cdsPick.FieldByName('state_id').AsString;//税率代码
      Edit19.Text:=LFrm.cdsPick.FieldByName('state_tax').AsString;////增值税率%
      RKeyRzBtnEdit19.Text:=LFrm.cdsPick.FieldByName('EMPLOYEE_NAME').AsString; //业务员
      ComboBox1.Items.Clear;
      for i:=1 to 6 do           //客户联络人
      if trim(LFrm.cdsPick.FieldByName('contact_name_'+inttostr(i)).asstring)<>'' then
      combobox1.Items.Add(trim(LFrm.cdsPick.FieldByName('contact_name_'+inttostr(i)).asstring));
      combobox1.ItemIndex:=0;
      if LFrm.cdsPick.FieldByName('EDI_FLAG_FOR_SOACK').AsInteger=1 then //出口
        checkbox1.Checked:=true
       else
        checkbox1.Checked:=false;
      if (Trim(LFrm.cdsPick.FieldByName('curr_name').AsString)='人民币') then
      RKeyRzBtnEdit8.Enabled:=False
      else
      RKeyRzBtnEdit8.Enabled:=True;
      COD_FLAG:=LFrm.cdsPick.FieldByName('COD_FLAG').AsString; //货到收款标志
      FED_TAX_ID_NO:=LFrm.cdsPick.FieldByName('FED_TAX_ID_NO').AsString; //付款方式
      customer_quote:=LFrm.cdsPick.FieldByName('quote_flag').AsBoolean;//客户报价关联标志
      CREDIT_RATING:=LFrm.cdsPick.FieldByName('CREDIT_RATING').AsInteger;   //，信用等级
      INVOICE_NOTE_PAD_PTR:=LFrm.cdsPick.FieldByName('INVOICE_NOTE_PAD_PTR').AsInteger;  //未付款最多超期
      SHIP_LEAD_TIME:=LFrm.cdsPick.FieldByName('SHIP_LEAD_TIME').AsInteger;  //装运交货提前天数
      CREDIT_LIMIT:=LFrm.cdsPick.FieldByName('CREDIT_LIMIT').AsFloat;//信用限额
      QUOTE_FACTOR1:=LFrm.cdsPick.FieldByName('QUOTE_FACTOR1').AsInteger;  //允许连续下单

      Edit1.Enabled:=True;
      BitBtn3.Enabled:=True;
      RKeyRzBtnEdit10.Enabled:=True;
      RKeyRzBtnEdit11.Enabled:=True;
      RKeyRzBtnEdit16.Enabled:=True;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmNewSales2.BitBtn3Click(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  inherited;
  if (Trim(Edit2.Text)='') then
  begin
    Edit1.Enabled:=False;
    BitBtn3.Enabled:=False;
  end;
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(72,4,' where customer_ptr='+cds60.FieldByName('CUSTOMER_PTR').AsString+'  order by po_number');
    if LFrm.ShowModal = mrOk then
    begin
      if LFrm.cdsPick.RecordCount>0 then
      begin
        cds60.Edit;
        cds60.FieldByName('PURCHASE_ORDER_PTR').Value:=LFrm.cdsPick.FieldByName('rkey').AsString;//客户订单号rkey97
        cds60.Post;
        Edit1.Text:=LFrm.cdsPick.FieldByName('po_number').AsString;//客户订单号
        RKeyRzBtnEdit5.Text:=LFrm.cdsPick.FieldByName('PO_DATE').Value;//PO日期
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmNewSales2.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmNewSales2.btnSaveClick(Sender: TObject);
var invoice,LSQLtmp,Lstrtmp,LNo,Lerror:string;
    Lcds:TClientDataSet;
    i,j:Integer;
    LFrm:TfrmAllOldVersion;
    LFrm2:TfrmShowStock;
    Lcds60:TClientDataSet;
    LField:TField;
    Lstr213:string;
    Lsq04,Lsq213,Lsq10,Lsq25,Lsq97,Lsq360:string;
    LPostData: OleVariant;
begin
  if (Trim(redt2.Text)='') then
  begin
    messagedlg('请输入正确的工厂代码!',mtwarning,[mbcancel],0);
    redt2.SetFocus;
    exit;
  end;
  if (Trim(Edit2.Text)='') then
  begin
    messagedlg('请输入正确的客户!',mtwarning,[mbcancel],0);
    Edit2.SetFocus;
    exit;
  end;
  if (Trim(RKeyRzBtnEdit3.Text)='') then
  begin
    messagedlg('请输入正确的板号!',mtwarning,[mbcancel],0);
    RKeyRzBtnEdit3.SetFocus;
    exit;
  end;
  if (Trim(Edit1.Text)='') then
  begin
    messagedlg('请输入采购定单号!',mtwarning,[mbcancel],0);
    Edit1.SetFocus;
    exit;
  end;
  if strtofloat(RKeyRzBtnEdit9.Text) = 0 then
  begin
    messagedlg('汇率输入有误!',mtwarning,[mbcancel],0);
    RKeyRzBtnEdit9.SetFocus;
    exit;
  end;
  if (cds192.FieldByName('CUSTCOPROD').AsString='Y') and
    (custinvoice_day(cds60.FieldByName('CUSTOMER_PTR').AsString,invoice)=1)
  then
  begin
    ShowMessage('该客户有未付款发票超过了最长延期付款天数!!!发票编号: '+invoice);
    exit;
  end;
  lcds:=TClientDataSet.Create(Application);
  try
    if (Trim(RKeyRzBtnEdit2.Text)<>'') then
    begin
      LSQLtmp:='select ABBR_NAME from data0010 where ABBR_NAME like ''%'+Trim(RKeyRzBtnEdit2.Text)+'%'' and CUSTOMER_TYPE<>4';
      if not gSvrIntf.IntfGetDataBySql(LSQLtmp,lcds) then Exit;
      if Lcds.IsEmpty then
      begin
        ShowMessage('找不到该客户简称或是已被设置成无效。');
        RKeyRzBtnEdit2.SetFocus;
        Exit;
      end;
    end;
    //查找到销售编号是否重复
    Lstrtmp:='';
    for i := 1 to StringGrid1.RowCount-2 do
    begin
      if (Trim(stringgrid1.Cells[0,i])<>'') then
      Lstrtmp:=Lstrtmp+''''+Trim(stringgrid1.Cells[0,i])+''',';
    end;
    if (Lstrtmp<>'') then
    begin
      Lstrtmp:=Copy(Lstrtmp,0,length(Lstrtmp)-1);
      LSQLtmp:='select rkey from data0060 where sales_order in ('+Lstrtmp+')';
      if not gSvrIntf.IntfGetDataBySql(LSQLtmp,lcds) then Exit;
      if not Lcds.IsEmpty then
      begin
        if messagedlg('销售订单编号重复,可能有多台计算机同时新增,是否自动更新编号?',mtConfirmation,
          [mbYes,mbNo],0)=mrYes  then
        begin
          LGRName:=update04('data0060',LNo);
//          LNo:=gFunc.Get04SeedValue('data0060');
          if (StringGrid1.RowCount<=3) then //第一张订单号
          begin
            stringgrid1.Cells[0,1]:=LNo+'-01'; //添加销售订单后缀
          end else
          begin   //多张订单号中增加
            for i := 1 to StringGrid1.RowCount-2 do
            begin
              if i<10 then
                stringgrid1.Cells[0,i]:=LNo+'-0'+inttostr(i)
              else
                stringgrid1.Cells[0,i]:=LNo+'-'+inttostr(i);
            end;
          end;
        end else
          exit;
      end else LGRName:=update04('data0060',LNo);
    end;
    if not CheckCustCreditAmount then exit; //判断订单总金额是否超出信用额度
    if (COD_FLAG='Y') and (combobox2.ItemIndex=0) and (QUOTE_FACTOR1=0) then  //款到发货，正式订单,不允许连续下单
    if find_allqty_so(cds60.FieldByName('CUSTOMER_PTR').AsString,invoice) then
    begin
      ShowMessage('该客户有为款到发货,前期有订单已到交期有库存未交货,请让风控部解锁后下单!订单编号: '+invoice);
      exit;
    end;
    AllVersion:='';
    findOldVersion(cds60.FieldByName('CUST_PART_PTR').AsString);
    if AllVersion<>'' then  //显示旧版本作业单在线状况
    begin
      LFrm:= TfrmAllOldVersion.Create(nil);
      try
        LFrm.GetData(AllVersion);
        if not LFrm.cdsOldECN.IsEmpty then
        begin
          if MessageBox(Handle,'ECN变更前旧版本有在线数量,需要查看明细吗?', '提示', MB_OKCANCEL +MB_ICONQUESTION)=IDOK then
          LFrm.ShowModal;
        end;
      finally
        LFrm.Free;
      end;
    end;

    LFrm2:= TfrmShowStock.Create(nil);
    try
      LFrm2.GetData(Trim(RKeyRzBtnEdit3.Text));
      if not LFrm2.cds60_53.IsEmpty then
      begin
        if MessageBox(Handle,'同型号订单在仓库中有库存,需要查看明细吗?', '提示', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
        LFrm2.ShowModal;
      end;
    finally
      LFrm2.Free;
    end;

    if (Trim(cds60.FieldByName('PURCHASE_ORDER_PTR').AsString)<>'') then
    begin
      if (find_socongfu(cds60.FieldByName('PURCHASE_ORDER_PTR').AsString,cds60.FieldByName('CUST_PART_PTR').AsString,stringgrid1.Cells[2,1])) and
         (messagedlg('近30天内存在订单合同号,板号,订单数量一样的订单,有可能重复输入,是否继续?',mtconfirmation,[mbYes,mbNo],0) = mrNo) then
      begin
        pagecontrol1.ActivePage:=Tabsheet1;
        stringgrid1.SetFocus;
        exit;
      end;
    end;
    cds60.Edit;
    cds60.FieldByName('CUSTOMER_CONTACT').Value:=combobox1.Text;//客户联络人
    cds60.FieldByName('reg_tax_fixed_unused').AsString:='0';//赶工费用计算方法
    cds60.fieldbyname('CSI_USER_PTR').AsString :=gVar.rkey73;      //系统用户指针
    cds60.fieldbyname('ENTERED_BY_EMPL_PTR').AsString :=gVar.rkey05; //输入人员指针
//    cds60.FieldByName('comm_assigned_by_e_p').AsString:=gVar.rkey05; //拥金指派人员
    cds60.fieldbyname('so_style').AsInteger :=combobox2.ItemIndex;  //订单类别
    cds60.fieldvalues['so_tp'] := radiogroup1.ItemIndex;           //加工形式
    cds60.fieldbyname('SO_OLDNEW').AsString :=combobox3.Text;     //订单新旧
    cds60.fieldbyname('RemarkSO').asstring:=Memo3.Text; //销售订单记事本
    if (Trim(RKeyRzBtnEdit2.Text)='') then
    cds60.FieldByName('ORIG_CUSTOMER').Value:=null;
    cds60.Post;
    Lstr213:='';
    for I := 1 to StringGrid1.RowCount-2 do
    begin
      if (StringGrid1.Cells[str_list.IndexOf('rkey213'),i]<>'') then
      Lstr213:=Lstr213+StringGrid1.Cells[str_list.IndexOf('rkey213'),i]+',';
    end;
    Lsq04:='select * from data0004 where table_name=''data0060''';
    Lsq213:='select * from Data0213 where rkey in (' + Lstr213+'-1)';
    Lsq10:='select * from data0010 where rkey='+cds60.FieldByName('CUSTOMER_PTR').AsString;
    Lsq25:='select * from data0025 where Rkey='+cds60.FieldByName('CUST_PART_PTR').AsString;
    if (iNew97YN=1) then
      Lsq97:='select * from data0097 where 1=0'
    else
      Lsq97:='select * from data0097 where Rkey='+cds60.FieldByName('PURCHASE_ORDER_PTR').AsString;
    Lsq360:='select * from data0360 where 1=0';
    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsq04,Lsq213,Lsq10,Lsq25,Lsq97,Lsq360]),[cds04,cds213,cds10,cds25,cds97,cds360]) then Exit;

    //新增97
    if (iNew97YN=1) then
    begin
      cds97.Append;
      cds97.FieldByName('po_number').Value:=Trim(Edit1.Text);
      cds97.FieldByName('customer_ptr').Value:=cds60.FieldByName('CUSTOMER_PTR').AsInteger;
      cds97.FieldByName('po_date').Value:=strtodate(RKeyRzBtnEdit5.Text);
      cds97.FieldByName('open_sos').Value:=StringGrid1.RowCount-2;
      cds97.FieldByName('IDkey').Value:=gFunc.CreateIDKey;
      cds97.Post;
    end else
    if (iNew97YN=0) then
    begin
      cds97.Edit;
      cds97.FieldByName('open_sos').Value:=cds97.FieldByName('open_sos').AsInteger+stringgrid1.RowCount-2;
      cds97.FieldByName('po_date').Value:=strtodate(RKeyRzBtnEdit5.Text);
      if (cds97.FieldByName('idkey').IsNull) then
      cds97.FieldByName('Idkey').Value:=gFunc.CreateIDKey;//
      cds97.Post;
    end;

    Lcds60:=TClientDataSet.Create(nil);
    try
      LSQLtmp:='select * from data0060 where 1=0';
      if not gSvrIntf.IntfGetDataBySql(LSQLtmp,Lcds60) then Exit;
      for I := 1 to StringGrid1.RowCount-2 do
      begin
        Lcds60.Append;
        for LField in Lcds60.Fields do
        begin
          if (IndexText(LField.FieldName,['rkey']) <> -1) then Continue;      //-1表示没找到
          if (cds60.FindField(LField.FieldName) <> nil) then
          LField.Value := cds60.FieldByName(LField.FieldName).Value;
        end;
        Lcds60.fieldbyname('SALES_ORDER').AsString := stringgrid1.Cells[str_list.IndexOf('订单编号'),i];     //销售定单;
        Lcds60.fieldbyname('PARTS_ORDERED').AsString := stringgrid1.Cells[str_list.IndexOf('pcs数量'),i];   //数量;
        Lcds60.FieldByName('to_be_planned').asstring := stringgrid1.Cells[str_list.IndexOf('pcs数量'),i];   //用作计划
        Lcds60.FieldByName('to_be_confirmed').asstring := stringgrid1.Cells[str_list.IndexOf('pcs数量'),i]; //用作确认
        Lcds60.fieldbyname('PART_PRICE').AsString := stringgrid1.Cells[str_list.IndexOf('pcs价格'),i];      //价格;
        Lcds60.fieldbyname('REFERENCE_NUMBER').AsString := stringgrid1.Cells[str_list.IndexOf('参考附注'),i];      //参考附注
        Lcds60.fieldbyname('DISCOUNT').AsString := stringgrid1.Cells[str_list.IndexOf('折扣'),i];        //折扣%;
        Lcds60.fieldbyname('P_CODE').AsString :=stringgrid1.Cells[str_list.IndexOf('Rkey283'),i];         //优先;
        Lcds60.fieldbyname('ORIG_REQUEST_DATE').AsString := stringgrid1.Cells[str_list.IndexOf('客户交货期'),i];  //客户交期
        Lcds60.fieldbyname('ORIG_SCHED_SHIP_DATE').AsString := stringgrid1.Cells[str_list.IndexOf('计划装运期'),i];//计划交期
        Lcds60.fieldbyname('DUE_DATE').AsString := stringgrid1.Cells[str_list.IndexOf('原始客户交期'),i];         //原始客户交期
        Lcds60.fieldbyname('CONSUME_FORECASTS').AsString := '0';    //预测耗费
        Lcds60.fieldbyname('BACKWARD_DAYS').AsString := '0';        //向后天数
        Lcds60.fieldbyname('FORWARD_DAYS').AsString := '0';         //向前天数
//        if (stringgrid1.Cells[str_list.IndexOf('报价单号'),i]<>'') then
//        Lcds60.fieldbyname('bp06_ptr').AsString := stringgrid1.Cells[str_list.IndexOf('报价单号'),i];         //报价指针
        Lcds60.fieldbyname('ANALYSIS_CODE_1').AsString := stringgrid1.Cells[str_list.IndexOf('分析代码1'),i];
        Lcds60.fieldbyname('ANALYSIS_CODE_2').AsString := stringgrid1.Cells[str_list.IndexOf('分析代码2'),i];
        Lcds60.fieldbyname('ANALYSIS_CODE_3').AsString := stringgrid1.Cells[str_list.IndexOf('分析代码3'),i];
        Lcds60.fieldbyname('ANALYSIS_CODE_4').AsString := stringgrid1.Cells[str_list.IndexOf('分析代码4'),i];
        Lcds60.fieldbyname('ANALYSIS_CODE_5').AsString := stringgrid1.Cells[str_list.IndexOf('分析代码5'),i];
        Lcds60.fieldbyname('set_ordered').AsString := stringgrid1.Cells[str_list.IndexOf('set数量'),i];
        Lcds60.fieldbyname('set_price').AsString := stringgrid1.Cells[str_list.IndexOf('set价格'),i];
        Lcds60.fieldbyname('TOTAL_ADD_L_PRICE').AsString := stringgrid1.Cells[str_list.IndexOf('工具费用'),i];    //工具费用总计
        Lcds60.fieldbyname('ent_date').AsString:=RKeyRzBtnEdit14.Text;//输入日期 系统服务器时间
        Lcds60.Fieldvalues['status']:=6;      //状态为未提交(040207修改)
        Lcds60.Fieldvalues['prod_rel']:='1';  //生产发放标记未确认的
        if (Trim(StringGrid1.Cells[str_list.IndexOf('rkey213'),i])<>'') then //订单预处指针保存并修改213表状态
        begin //预处理数量可以多次下单，下单数量之和=预处理数量把状态改为已下单。未下完成的单状态保持已审核
          if cds213.Locate('rkey',Trim(StringGrid1.Cells[str_list.IndexOf('rkey213'),i]),[]) then
          begin
            Lcds60.FieldByName('rkey213').Value:=StrToInt(StringGrid1.Cells[str_list.IndexOf('rkey213'),i]);
            if StringGrid1.Cells[str_list.IndexOf('已使用数量'),i]='' then StringGrid1.Cells[str_list.IndexOf('已使用数量'),i]:='0';
            if StringGrid1.Cells[str_list.IndexOf('预处理数量'),i]='' then StringGrid1.Cells[str_list.IndexOf('预处理数量'),i]:='0';
            if ((StrToInt(StringGrid1.Cells[str_list.IndexOf('已使用数量'),i])+StrToInt(StringGrid1.Cells[str_list.IndexOf('pcs数量'),i]))=StrToInt(StringGrid1.Cells[str_list.IndexOf('预处理数量'),i])) then  //下单数量之和=预处理数量
            begin
              cds213.Edit;
              cds213.FieldByName('status').Value:=2;
              cds213.FieldByName('UsedQuantity').AsString:=StringGrid1.Cells[str_list.IndexOf('预处理数量'),i];
              cds213.Post;
            end else
            begin
              cds213.Edit;
              cds213.FieldByName('UsedQuantity').Value:=inttostr(StrToInt(StringGrid1.Cells[str_list.IndexOf('已使用数量'),i])+StrToInt(StringGrid1.Cells[str_list.IndexOf('pcs数量'),i]));
              cds213.Post;
            end;
          end;
        end;
        Lcds60.FieldByName('bp06_ptr').AsString := stringgrid1.Cells[str_list.IndexOf('BOM06rkey'),i];//BOM报价单关联
        if Lcds60.FieldByName('bp06_ptr').AsString = '' then //如果不是是BOM报价则计算不含税
        begin
          if (radiogroup2.ItemIndex = 0) then                   //价格不含税
           Lcds60.fieldvalues['parts_alloc']:=Lcds60.fieldvalues['PART_PRICE']
          else
           Lcds60.fieldvalues['parts_alloc']:=Lcds60.fieldvalues['PART_PRICE']/(1+Lcds60.fieldvalues['RUSH_CHARGE']*0.01);
        end else
        begin         //如果是BOM报价则直接取BOM报价的不含税价格
          Lcds60.FieldByName('parts_alloc').AsString := stringgrid1.Cells[str_list.IndexOf('BOM不含税价格'),i]; //BOM报价的不含税价格
        end;
        Lcds60.FieldByName('PARTS_ALLOC1').AsString:=Lcds60.FieldByName('parts_alloc').AsString;
        Lcds60.fieldvalues['quote_price']:=0;      //表示so未审批(需要审批)
        Lcds60.FieldByName('idkey').Value:= gFunc.CreateIDKey;//
        Lcds60.FieldByName('D97_IDKey').Value:=cds97.FieldByName('idkey').Value;
        Lcds60.FieldByName('INVD_ADD_L_PRICE').Value:=0;
        Lcds60.FieldByName('PARTS_SHIPPED').Value:=0;
        Lcds60.FieldByName('PARTS_RETURNED').Value:=0;
        Lcds60.FieldByName('PARTS_INVOICED').Value:=0;
        Lcds60.fieldBYName('CURR_SHIPMENT').Value:=0;
        Lcds60.fieldBYName('QTY_PLANNNED').Value:=0;
        Lcds60.fieldBYName('ISSUED_QTY').Value:=0;
        Lcds60.fieldBYName('RETURNED_SHIP').Value:=0;
        Lcds60.fieldBYName('SpellTogether').Value:=0;
        Lcds60.fieldBYName('mat_assign').Value:=0;
        Lcds60.Post;
        //新增360
        cds360.Append;
        cds360.FieldByName('quantity').Value:=Lcds60.FieldByName('PARTS_ORDERED').Value;
        cds360.FieldByName('sch_date').Value:=Lcds60.FieldByName('ORIG_SCHED_SHIP_DATE').Value;
        cds360.FieldByName('D60_IDKey').Value:=Lcds60.FieldByName('idkey').Value;
        cds360.Post;

        //更新IDKey
        cds62.Filtered:=False;
        cds62.Filter:='';
        cds62.Filter:='so_ptr='+inttostr(i);
        cds62.Filtered:=True;
        while not cds62.Eof do
        begin
          cds62.Edit;
          cds62.FieldByName('D60_IDKey').Value:=Lcds60.FieldByName('idkey').Value;
          cds62.FieldByName('so_ptr').Value:=null;
          cds62.Post;
        end;
        cds62.Filter:='';
        cds62.Filtered:=False;
      end;

      //更新04
      cds04.Edit;
      cds04.FieldByName('SEED_VALUE').Value:=LGRName;
      cds04.Post;
      //更新10
      if ((label36.Caption='Y') and (QUOTE_FACTOR1>0)) then
      begin
        cds10.Edit;
        cds10.FieldByName('QUOTE_FACTOR1').Value:=0;
        cds10.Post;
      end;
      //更新25
      if ((ComboBox2.ItemIndex=0) and (Lcds60.FieldByName('PART_PRICE').AsCurrency<>0)) then
      begin
        cds25.Edit;
        if (radiogroup2.ItemIndex = 0) then
        begin  //最后一次售价
          cds25.FieldByName('LATEST_PRICE').AsString:=formatfloat('0.0000',Lcds60.FieldValues['PART_PRICE']/Lcds60.FieldValues['EXCH_RATE'])
        end else
        begin
          cds25.FieldByName('LATEST_PRICE').AsString:=formatfloat('0.0000',Lcds60.FieldValues['PART_PRICE']/Lcds60.FieldValues['EXCH_RATE']/(1+Lcds60.FieldValues['RUSH_CHARGE']*0.01));
        end;
        if ((cds192.FieldByName('custciprod').AsString)='Y') and (find_parterror(cds60.FieldByName('CUST_PART_PTR').AsInteger)) then
        begin
          cds25.FieldByName('onhold_sales_flag').Value:=1;  //如果销售的板号有最新的旧板，那么旧板锁定
        end;
        cds25.FieldByName('REMARK').Value:=Memo1.Text;//加工指示
        cds25.FieldByName('ENG_NOTE').Value:=Memo2.Text;//工程备注
        cds25.Post;
      end;
      if cds97.State in [dsEdit,dsInsert] then cds97.Post;
      if Lcds60.State in [dsEdit,dsInsert] then Lcds60.Post;
      if cds62.State in [dsEdit,dsInsert] then cds62.Post;
      if cds213.State in [dsEdit,dsInsert] then cds213.Post;
      if cds360.State in [dsEdit,dsInsert] then cds360.Post;
      if cds25.State in [dsEdit,dsInsert] then cds25.Post;
      if cds10.State in [dsEdit,dsInsert] then cds10.Post;
      if cds04.State in [dsEdit,dsInsert] then cds04.Post;

      LPostData := VarArrayCreate([0,7],varVariant);
      if (cds97.ChangeCount > 0) then
        LPostData[0] := cds97.Delta;
      if (Lcds60.ChangeCount > 0) then
        LPostData[1] := Lcds60.Delta;
      if (cds62.ChangeCount > 0) then
        LPostData[2] := cds62.Delta;
      if (cds360.ChangeCount > 0) then
        LPostData[3] := cds360.Delta;
      if (cds213.ChangeCount > 0) then
        LPostData[4] := cds213.Delta;
      if (cds10.ChangeCount > 0) then
        LPostData[5] := cds10.Delta;
      if (cds25.ChangeCount > 0) then
        LPostData[6] := cds25.Delta;
      if (cds04.ChangeCount > 0) then
        LPostData[7] := cds04.Delta;
      if gSvrIntf.IntfPostModData('公共基础',72,LPostData,Lerror,gVar.SvrDB,0) then
      begin
        if (cds97.ChangeCount > 0) then cds97.MergeChangeLog;
        if (Lcds60.ChangeCount > 0) then Lcds60.MergeChangeLog;
        if (cds62.ChangeCount > 0) then cds62.MergeChangeLog;
        if (cds360.ChangeCount > 0) then cds360.MergeChangeLog;
        if (cds213.ChangeCount > 0) then cds213.MergeChangeLog;
        if (cds10.ChangeCount > 0) then cds10.MergeChangeLog;
        if (cds25.ChangeCount > 0) then cds25.MergeChangeLog;
        if (cds04.ChangeCount > 0) then cds04.MergeChangeLog;
        ShowMessage('保存成功');
        if Assigned(refresh) then
          refresh(nil);
        for j :=StringGrid1.RowCount-2  downto 1  do
        begin
          for i:=0 to StringGrid1.ColCount do
          begin
            StringGrid1.Cells[i,j]:='';
          end;
          StringGrid1.rowcount := StringGrid1.rowcount - 1;
        end;
        stringgrid1.RowCount:=2;
        Edit2.Enabled:=true;
        Edit2.Text:='';
        RKeyRzBtnEdit3.Enabled:=true;
        Edit1.Enabled:=true;
        bitbtn3.Enabled:=true;
        RKeyRzBtnEdit10.Enabled:=true;
        combobox2.Enabled:=true;
        radiogroup1.Enabled:=true;
        redt2.Text:='';
        Edit2.Text:='';
        RKeyRzBtnEdit2.Text:='';
        RKeyRzBtnEdit3.Text:='';
        Edit1.Text:='';
        RKeyRzBtnEdit5.Text:='';
        RKeyRzBtnEdit6.Text:='';
        ComboBox1.Items.Clear;
        RKeyRzBtnEdit8.Text:='';
        RKeyRzBtnEdit9.Text:='';
        RKeyRzBtnEdit10.Text:='';
        RKeyRzBtnEdit11.Text:='';
        RKeyRzBtnEdit12.Text:='';
        RKeyRzBtnEdit15.Text:='';
        RKeyRzBtnEdit16.Text:='';
        Memo2.Text:='';
        Memo3.Text:='';
        Label1.Caption:='';
        RKeyRzBtnEdit14.Text:=formatdatetime('yyyy-mm-dd HH:mm:ss',dLongDate);
        btnSave.Enabled:=false;
        Label61.Caption:='0.000';
        label44.Caption := '0.000';
        label46.Caption := '0.000';
        label47.Caption := '0.000';
        label48.Caption := '0.0000';
        Label63.Caption:= '0.0000';
        Label60.Caption:='0.0000';
        Label4.Caption:='';
        pagecontrol1.ActivePage:=tabsheet1;
        memo1.Lines.Clear;
        memo1.ReadOnly:=true;
        cds60.Delete;
        GetData('0');
        Get89('-1');
      end else
      begin
        messagedlg('数据保存失败,可能是有其它用户同时操作而且在你之前提交,请稍后再试!',mtwarning,[mbok],0);
        exit;
      end;
    finally
      Lcds60.Free;
    end;
  finally
    lcds.Free;
  end;

end;

function TfrmNewSales2.cacl_deficiency(Arkey10: string;
  nowAmount: currency): currency;
var V_defi:currency;
    Lsql1,Lsql2,Lsql3,Lsql4,Lsql5,Lsql6:string;
    cds1,cds2,cds3,cds4,cds5,cds6:TClientDataSet;
begin
  cds1:=TClientDataSet.Create(Application);
  cds2:=TClientDataSet.Create(Application);
  cds3:=TClientDataSet.Create(Application);
  cds4:=TClientDataSet.Create(Application);
  cds5:=TClientDataSet.Create(Application);
  cds6:=TClientDataSet.Create(Application);
  try
  //计算用户所开出发票的所欠金额 1
    Lsql1:='SELECT SUM((INVOICE_TOTAL - amount_paid - CASH_DISC)*EXCHANGE_RATE) AS total_amount1 FROM dbo.Data0112 where customer_ptr='+Arkey10+' and invoice_status=1 group by customer_ptr';
  //已指派未生成账龄 2  Add
    Lsql2:='select Sum(t60.PARTS_ALLOC*t64.QUAN_SHIPPED*(1+t60.RUSH_CHARGE*0.01)/t60.EXCH_RATE) as total_amount2 '
      +'from data0060 t60 inner join data0064 t64 on t64.SO_PTR = t60.RKEY left join data0439 t439 on t64.packing_list_ptr = t439.RKEY '
      +'WHERE ((t64.packing_list_ptr is null) OR (t439.invoice_ptr is null)) and t60.STATUS in (1,2,4) and t60.CUSTOMER_PTR = '+Arkey10;
  //未指派 Add 3
    Lsql3:='select Sum(t60.PARTS_ALLOC*(t60.PARTS_ORDERED-t60.PARTS_SHIPPED)*(1+t60.RUSH_CHARGE*0.01)/t60.EXCH_RATE) as total_amount3 from data0060 t60 Where t60.STATUS in (1,2,4,6) and t60.CUSTOMER_PTR = '+Arkey10;
  //工具费用 Add 4
    Lsql4:='select Sum((TOTAL_ADD_L_PRICE-INVD_ADD_L_PRICE)*(1+RUSH_CHARGE*0.01)/EXCH_RATE) as total_amount4 from data0060 where STATUS in (1,2,4,6) and TOTAL_ADD_L_PRICE <> 0 and INVD_ADD_L_PRICE = 0 and CUSTOMER_PTR = '+Arkey10;
  //计算用户贷项备忘 5
    Lsql5:='SELECT SUM(AVL_AMT * EX_RATE) AS total_amount5 FROM dbo.Data0116 where CUST_PTR='+Arkey10+' and memo_status=1 group by CUST_PTR';
  //已退货未生成贷项备忘 6
    Lsql6:='select Sum(t60.PARTS_ALLOC*t98.QTY_RECD*(1+t60.RUSH_CHARGE*0.01)/t60.EXCH_RATE) as total_amount6 from data0098 t98, data0060 t60 where t98.SO_PTR = t60.RKEY and t98.srce_ptr is null and t98.CUSTOMER_PTR = '+Arkey10;
    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsql1,Lsql2,Lsql3,Lsql4,Lsql5,Lsql6]),[cds1,cds2,cds3,cds4,cds5,cds6]) then Exit;
  //V_defi:=1+2+3+4-5-6
    V_defi:=cds1.FieldByName('total_amount1').AsCurrency+cds2.FieldByName('total_amount2').AsCurrency+cds3.FieldByName('total_amount3').AsCurrency+cds4.FieldByName('total_amount4').AsCurrency-cds5.FieldByName('total_amount5').AsCurrency-cds6.FieldByName('total_amount6').AsCurrency;
    result:= v_defi + nowAmount;  //本订单总额Add
  finally
    cds1.Free;
    cds2.Free;
    cds3.Free;
    cds4.Free;
    cds5.Free;
    cds6.Free;
  end;
end;

function TfrmNewSales2.CheckCustCreditAmount: Boolean; //判断订单总金额是否超出信用额度
var TmpAmout:double;
    i:integer;
begin
  CheckCustCreditAmount:=true;
  if (cds192.FieldByName('CUSTSTAPROD').AsString='Y') then
  begin
    if (CREDIT_RATING=3) then //信用等级'差'
    begin
      messagedlg('客户:'+Edit2.Text+'信用等级太差,订单无法继续!',mtwarning,[mbok],0);
      exit;
    end else
    begin
      TmpAmout:=0;
      for i:=1 to stringgrid1.RowCount-2 do //计算所有订单总金额
        TmpAmout:=TmpAmout+StrToFloat(stringgrid1.Cells[str_list.IndexOf('总合计'),i]);
      if  (CREDIT_RATING=1) then //信用等级'优'超过限额出现提示后仍然可以开出订单
      begin                                                                                                   //信用限额
        if (cacl_deficiency(cds60.FieldByName('CUSTOMER_PTR').AsString,TmpAmout/StrtoCurr(RKeyRzBtnEdit9.Text))>credit_limit+1) then
        if messagedlg('客户:'+Edit2.Text+'未付款金额大于了信用限额是否继续?',mtconfirmation,[mbyes,mbno],0)=mrno then
        begin
          result:=False;
          exit;
        end;
      end else
      begin   //=2信用等级'良' 只能在限额以内开出销售订单
        if (cacl_deficiency(cds60.FieldByName('CUSTOMER_PTR').AsString,TmpAmout/StrtoCurr(RKeyRzBtnEdit9.Text))>credit_limit+1) then
        begin
          messagedlg('客户:'+Edit2.Text+'未付款金额大于了信用限额无法继续!',mtwarning,[mbok],0);
          result:=false;
          exit;
        end;
      end;
    end;
  end;
end;


function TfrmNewSales2.custinvoice_day(Arkey10: string;
  var invoice_number: string):byte;
var Lsql25:string;
    Lcds:TClientDataSet;
begin
  lcds:=TClientDataSet.Create(Application);
  try
    Lsql25:='SELECT invoice_number,max(DATEDIFF(day,DUE_DATE,GETDATE())) AS days,DUE_DATE,INVOICE_NOTE_PAD_PTR '
           +' FROM dbo.Data0112 inner join Data0010 on Data0112.CUSTOMER_PTR=Data0010.RKEY '
           +' where INVOICE_STATUS=1 '
           +' and INVOICE_TOTAL > 0 '
           +' and CUSTOMER_PTR='+Arkey10+' '
           +' group by invoice_number,DUE_DATE,INVOICE_NOTE_PAD_PTR '
           +' having max(DATEDIFF(day,DUE_DATE,GETDATE()))>INVOICE_NOTE_PAD_PTR';
    if not gSvrIntf.IntfGetDataBySql(Lsql25,lcds) then Exit;
    if Lcds.IsEmpty then
      Result:=0 //没有
    else begin
      invoice_number:=Lcds.FieldByName('invoice_number').AsString;
      Result:=1; //有未付款发票超过了最长延期付款天数
    end;
  finally
    lcds.Free;
  end;
end;

procedure TfrmNewSales2.del_soClick(Sender: TObject);
var i:Integer;
    v_so:string;
begin
  cds62.Filter:='so_ptr = '+inttostr(stringgrid1.Row);  //删除对应工具费用
  cds62.First;
  while not cds62.Eof do
  begin
    cds62.Delete;
    cds62.Next;
  end;
  label44.Caption:=formatfloat('0.0000',strtofloat(label44.Caption)-strtofloat(stringgrid1.Cells[str_list.IndexOf('价格合计'),stringgrid1.Row]));
  label61.Caption:=formatfloat('0.000',strtofloat(label61.Caption)-strtofloat(stringgrid1.Cells[str_list.IndexOf('税金'),stringgrid1.Row]));
  label46.Caption:=formatfloat('0.000',strtofloat(label46.Caption)-strtofloat(stringgrid1.Cells[str_list.IndexOf('折扣'),stringgrid1.Row]));
  label47.Caption:=formatfloat('0.0000',strtofloat(label47.Caption)-strtofloat(stringgrid1.Cells[str_list.IndexOf('工具费用'),stringgrid1.Row]));
  label63.Caption:=formatfloat('0.0000',strtofloat(label63.Caption)-strtofloat(stringgrid1.Cells[str_list.IndexOf('工具税'),stringgrid1.Row]));
  label48.Caption:=formatfloat('0.0000',strtofloat(label48.Caption)-strtofloat(stringgrid1.Cells[str_list.IndexOf('总合计'),stringgrid1.Row]));
  label60.Caption:=formatfloat('0.0000',strtofloat(label60.Caption)-strtofloat(stringgrid1.Cells[str_list.IndexOf('面积'),stringgrid1.Row]));
  if stringgrid1.Row=stringgrid1.RowCount-2 then //如果是最后一行
    stringgrid1.Rows[stringgrid1.row].Clear
  else
  begin  //如果删除中间行下面的so号要改
    for i := StringGrid1.Row to StringGrid1.RowCount-2 do
    begin
      v_so:=stringgrid1.Cells[0,i];
      stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
      if i<>stringgrid1.RowCount-2 then
       stringgrid1.Cells[0,i]:=v_so;
    end;
    cds62.Filter:='so_ptr >= '+inttostr(stringgrid1.Row);
    cds62.First;                //修改工具费用指针
    while not cds62.Eof do
    begin
     cds62.Edit;
     cds62.Fieldvalues['so_ptr'] :=cds62.Fieldvalues['so_ptr']-1;
     cds62.Post;
     cds62.Next;
    end;
  end;
  stringgrid1.RowCount:=stringgrid1.RowCount-1;
  if (StringGrid1.RowCount=2) then
  begin
    TryEnabled(True);
    btnSave.Enabled:=False;
  end;
end;

procedure TfrmNewSales2.Edit1Exit(Sender: TObject);
var sSQL97,sTmp97:string;
    Lcds:TClientDataSet;
begin
  if (Trim(Edit2.Text)='') then
  begin
    Edit1.Enabled:=False;
    BitBtn3.Enabled:=False;
  end;
  if (Trim(Edit1.Text)<>'') then
  begin
    sTmp97:=Trim(Edit1.Text);
    Lcds:=TClientDataSet.Create(Self);
    try
      sSQL97:='select rkey,po_number,po_date from data0097 where customer_ptr='+cds60.FieldByName('CUSTOMER_PTR').AsString+' and po_number='''+Trim(Edit1.Text)+'''';
      gSvrIntf.IntfGetDataBySql(sSQL97,Lcds);
      if Lcds.IsEmpty then
      begin
        cds60.Edit;
        cds60.FieldByName('PURCHASE_ORDER_PTR').Value:=null;//客户订单号rkey97
        cds60.Post;
        iNew97YN:=1;
        RKeyRzBtnEdit5.Enabled:=True;
        RKeyRzBtnEdit5.Text:=FormatDateTime('yyyy-MM-dd',gFunc.GetSvrDateTime);//PO日期
        Edit1.Text:=sTmp97;
      end else
      begin
        cds60.Edit;
        cds60.FieldByName('PURCHASE_ORDER_PTR').Value:=Lcds.FieldByName('rkey').Value;;//客户订单号rkey97
        cds60.Post;
        iNew97YN:=0;
        RKeyRzBtnEdit5.Text:= Lcds.FieldByName('po_date').Value;//PO日期
        RKeyRzBtnEdit5.Enabled:=False;
      end;
    finally
      Lcds.Free;
    end;
  end;
end;

procedure TfrmNewSales2.Edit2Exit(Sender: TObject);
var Lcds:TClientDataSet;
    sSQL10:string;
    i:Integer;
begin
  if (Trim(Edit2.Text)='') then
  begin
    BitBtn3.Enabled:=False;
    Edit1.Enabled:=False;
    RKeyRzBtnEdit10.Enabled:=False;
    RKeyRzBtnEdit11.Enabled:=False;
    RKeyRzBtnEdit16.Enabled:=False;
  end else
  begin
    Lcds:=TClientDataSet.Create(Self);
    try
      gSvrIntf.IntfGetDataBySql('select Rkey from data0010 where CUSTOMER_TYPE = 4 and cust_code ='+QuotedStr(Trim(Edit2.Text)),Lcds);
      if not Lcds.IsEmpty then
      begin
        Edit2.Text:='';
        showmessage('该客户已停用,请联系市场部!');
        abort;
      end;
      sSQL10:='select data0010.RKEY,cust_code,customer_name,currency_ptr,cod_flag, CONTACT_NAME_1,CONTACT_NAME_2,CONTACT_NAME_3, CONTACT_NAME_4,CONTACT_NAME_5,CONTACT_NAME_6,'
             +'INTERNAL_ECN_COUNT,EXTERNAL_ECN_COUNT, EDI_FLAG_FOR_INVOICE, quote_flag, reg_tax_fixed_unused,credit_rating,credit_limit, EDI_FLAG_FOR_SOACK,'
             +'FED_TAX_ID_NO,data0005.EMPLOYEE_NAME,Data0001.CURR_CODE,Data0001.CURR_NAME,Data0001.EXCH_RATE,'
             +' rkey12,CUSTOMER_PTR,location,ship_to_address_1,state12,zip12,SHIP_CTAX_PTR,SHIP_TO_CONTACT,data0010.QUOTE_FACTOR1,'
             +' SHIP_TO_PHONE,SHIP_SHIPPING_METHOD,SHIP_FOB,STATE_SHIP_TAX_FLAG,STATE_PROD_TAX_FLAG,STATE_TOOL_TAX_FLAG,ship_lead_time,state_id,state_tax,SALES_REP_PTR,INVOICE_NOTE_PAD_PTR '
             +' from data0010 left join data0005 on data0010.SALES_REP_PTR=data0005.RKEY inner join Data0001 on Data0010.CURRENCY_PTR=Data0001.RKEY OUTER APPLY'
             +' (select top 1 data0012.rkey as rkey12,CUSTOMER_PTR,location,ship_to_address_1,data0012.state as state12,zip as zip12,SHIP_CTAX_PTR,SHIP_TO_CONTACT, '
             +' SHIP_TO_PHONE,SHIP_SHIPPING_METHOD,SHIP_FOB,STATE_SHIP_TAX_FLAG,STATE_PROD_TAX_FLAG,STATE_TOOL_TAX_FLAG,'
             +' ship_lead_time,state_id,state_tax from Data0012 inner join'
             +' data0189 on data0012.SHIP_CTAX_PTR=data0189.rkey where Data0012.CUSTOMER_PTR=data0010.RKEY order by location ) as a12'
             +' where CUSTOMER_TYPE<>4 and data0010.cust_code='+QuotedStr(Trim(Edit2.Text));
      gSvrIntf.IntfGetDataBySql(sSQL10,Lcds);
      if not Lcds.IsEmpty then
      begin
        cds60.Edit;
        cds60.FieldByName('CUSTOMER_PTR').Value:=Lcds.FieldByName('rkey').AsInteger; //客户Rkey10
        cds60.FieldByName('CURRENCY_PTR').Value:=Lcds.FieldByName('CURRENCY_PTR').AsInteger;//货币Rkey10
        cds60.FieldByName('EXCH_RATE').Value:=Lcds.FieldByName('EXCH_RATE').Value; //汇率
        cds60.FieldByName('COMM_ASSIGNED_BY_E_P').Value:=Lcds.FieldByName('SALES_REP_PTR').AsInteger; //业务员
        cds60.FieldByName('CUST_SHIP_ADDR_PTR').Value:=Lcds.FieldByName('Rkey12').AsInteger;//装运地址Rkey12
        cds60.FieldByName('COMMISION_ON_TOOLING').Value:=Lcds.FieldByName('EDI_FLAG_FOR_SOACK').Value;//是否转厂
        cds60.FieldByName('STATE_PROD_TAX_FLAG').Value:=Lcds.FieldByName('STATE_PROD_TAX_FLAG').Value;//增值税产品标识Y,N
        cds60.FieldByName('STATE_TOOL_TAX_FLAG').Value:=Lcds.FieldByName('STATE_TOOL_TAX_FLAG').Value;//增值税工具标识Y,N
        cds60.FieldByName('FOB').Value:=Lcds.FieldByName('SHIP_FOB').Value;//合同号
        cds60.FieldByName('SHIPPING_CONTACT').Value:=Lcds.FieldByName('ship_to_contact').Value;//装运联络人
        cds60.FieldByName('SHIPPING_METHOD').Value:=Lcds.FieldByName('ship_shipping_method').Value;//装运方法
        cds60.FieldByName('COD_FLAG').Value:=Lcds.FieldByName('cod_flag').Value;//货到收款(Y,N)
        cds60.FieldByName('SHIP_CONTACT_PHONE').Value:=Lcds.FieldByName('ship_to_phone').Value;//装运联络人电话
        cds60.FieldByName('RUSH_CHARGE').Value:=Lcds.FieldByName('state_tax').Value;//增值税率%
        cds60.FieldByName('COMMISION_ON_TOOLING').Value:=Lcds.FieldByName('EDI_FLAG_FOR_SOACK').Value;//是否出口
        if (Lcds.FieldByName('EDI_FLAG_FOR_INVOICE').AsInteger=0) then
          cds60.FieldByName('tax_in_price').Value:='N'//是否含税标示
        else
          cds60.FieldByName('tax_in_price').Value:='Y';//是否含税标示
        cds60.FieldByName('RUSH_CHARGE_PCT_USED').Value:=Lcds.FieldByName('SHIP_LEAD_TIME').AsInteger;  //装运交货提前天数
        cds60.Post;
        edit2.Text:=Lcds.FieldByName('cust_code').AsString;
        Label4.Caption:=Lcds.FieldByName('customer_name').AsString;
        Label36.Caption:=Lcds.FieldByName('cod_flag').AsString;//货到收款(Y,N)
        Label3.Caption:=Lcds.FieldByName('FED_TAX_ID_NO').AsString;//付款方式
        radiogroup2.ItemIndex:=Lcds.FieldByName('EDI_FLAG_FOR_INVOICE').AsInteger;//是否含税标示
        Edit18.Text:=Lcds.FieldByName('state_id').AsString;//税率代码
        Edit19.Text:=Lcds.FieldByName('state_tax').AsString;////增值税率%
        RKeyRzBtnEdit19.Text:=Lcds.FieldByName('EMPLOYEE_NAME').AsString; //业务员
        ComboBox1.Items.Clear;
        for i:=1 to 6 do           //客户联络人
        if trim(Lcds.FieldByName('contact_name_'+inttostr(i)).asstring)<>'' then
        combobox1.Items.Add(trim(Lcds.FieldByName('contact_name_'+inttostr(i)).asstring));
        combobox1.ItemIndex:=0;
        if (Lcds.FieldByName('EDI_FLAG_FOR_SOACK').AsInteger=1) then //出口
          checkbox1.Checked:=true
        else
          checkbox1.Checked:=false;
        if (Trim(Lcds.FieldByName('curr_name').AsString)='人民币') then
          RKeyRzBtnEdit8.Enabled:=False
        else
          RKeyRzBtnEdit8.Enabled:=True;
        COD_FLAG:=Lcds.FieldByName('COD_FLAG').AsString; //货到收款标志
        FED_TAX_ID_NO:=Lcds.FieldByName('FED_TAX_ID_NO').AsString; //付款方式
        customer_quote:=Lcds.FieldByName('quote_flag').AsBoolean;//客户报价关联标志
        CREDIT_RATING:=Lcds.FieldByName('CREDIT_RATING').AsInteger;   //，信用等级
        INVOICE_NOTE_PAD_PTR:=Lcds.FieldByName('INVOICE_NOTE_PAD_PTR').AsInteger;  //未付款最多超期
        SHIP_LEAD_TIME:=Lcds.FieldByName('SHIP_LEAD_TIME').AsInteger;  //装运交货提前天数
        CREDIT_LIMIT:=Lcds.FieldByName('CREDIT_LIMIT').AsFloat;//信用限额
        QUOTE_FACTOR1:=Lcds.FieldByName('QUOTE_FACTOR1').AsInteger;  //允许连续下单
        BitBtn3.Enabled:=True;
        Edit1.Enabled:=True;
        RKeyRzBtnEdit10.Enabled:=True;
        RKeyRzBtnEdit11.Enabled:=True;
        RKeyRzBtnEdit16.Enabled:=True;
      end else
      begin
        messagedlg('客户代码不正确,请重新输入或选择',mtinformation,[mbok],0);
        Edit2.SetFocus;
        Exit;
      end;
    finally
      Lcds.Free;
    end;
  end;
end;

procedure TfrmNewSales2.edit_soClick(Sender: TObject);
var Lfrm2:TfrmAddSales;
    i,j:Integer;
begin
  Lfrm2:= TfrmAddSales.Create(nil);
  try
    Lfrm2.FEditType:=1;//编辑
    LFrm2.GetData(cds60.FieldByName('CUST_PART_PTR').AsString,cds60.FieldByName('PURCHASE_ORDER_PTR').AsString);
    if (Trim(Edit19.Text)='') then Lfrm2.RUSH_CHARGE:=0 else Lfrm2.RUSH_CHARGE:=StrToFloat(Trim(Edit19.Text));//税率
    if (unit_sq=0) then Lfrm2.unit_sq:=0 else Lfrm2.unit_sq:=unit_sq; //单只面积
    if (RadioGroup2.ItemIndex=0) then Lfrm2.ItemIndex:=0;//含税标识

    if (credit_rating = 3) then
      Lfrm2.Label43.Caption:= '差'
    else if (credit_rating = 1) then
      Lfrm2.Label43.Caption:= '优'
    else
      Lfrm2.Label43.Caption:= '良';
    Lfrm2.CREDIT_RATING:=credit_rating; //信用等级
    Lfrm2.Label44.Caption:= formatfloat('0.0000',credit_limit); //信用限额
    Lfrm2.Label45.Caption:= formatfloat('0.0000',cacl_deficiency(cds60.FieldByName('CUSTOMER_PTR').AsString,0));//未结算总额
    Lfrm2.label47.Caption:=inttostr(set_qty);//出货板方式
    if (Trim(Label47.Caption)='') or (set_qty=0) then Lfrm2.set_qty:=1 else Lfrm2.set_qty:=set_qty;
    Lfrm2.quote_flag:=quote_flag; //与报价单关联
    Lfrm2.SHIP_LEAD_TIME:=SHIP_LEAD_TIME; //装运交货提前天数
    Lfrm2.shelf_life:=shelf_life;//产品周期
    Lfrm2.MANU_PART_DESC:=Trim(RKeyRzBtnEdit17.Text); //客户型号,,
    Lfrm2.manu_part_number:=Trim(RKeyRzBtnEdit3.Text); //本厂编号
    Lfrm2.CURRENCY_PTR:=cds60.FieldByName('CURRENCY_PTR').AsString;//01Rkey
    Lfrm2.suplcimat192:=cds192.FieldByName('suplcimat').AsString;//192状态样板及备品订单以外的SO单价不可以为零
    Lfrm2.v_part_num:=v_part_num;//样板或量产
    Lfrm2.so_style:=ComboBox2.ItemIndex; //订单类型:正品/备品
    Lfrm2.so_tp:=RadioGroup1.ItemIndex;//订单类别自制外发半制程0,1,2
    Lfrm2.customer_quote:= customer_quote;  //客户报价关联标志
    Lfrm2.CUSTSTAPROD192:=cds192.FieldByName('CUSTSTAPROD').AsString;//192是否受信用控制
    Lfrm2.code10:=Trim(Edit2.Text);//客户代码
    Lfrm2.EXCH_RATE:=Trim(RKeyRzBtnEdit9.Text);//汇率
    Lfrm2.credit_limit:=credit_limit;//信用限额
    Lfrm2.rkey10:=cds60.FieldByName('CUSTOMER_PTR').Value;//data0010.Rkey
    LFrm2.custcitool192:=cds192.FieldByName('custcitool').AsString;//是否允许输入SET数
    Lfrm2.init;

    Lfrm2.edit1.Text := stringgrid1.Cells[str_list.IndexOf('订单编号'),stringgrid1.Row];
    if trim(stringgrid1.Cells[str_list.IndexOf('报价单号'),stringgrid1.Row])<>'' then
    begin
      Lfrm2.edit10.Text := stringgrid1.Cells[str_list.IndexOf('报价单号'),stringgrid1.Row];
      Lfrm2.Edit10.Tag := StrToInt(stringgrid1.Cells[str_list.IndexOf('BOM06rkey'),stringgrid1.Row]); //BOM报价单指针
      Lfrm2.Labele06.Caption:=stringgrid1.Cells[str_list.IndexOf('BOM不含税价格'),stringgrid1.Row];//BOM报价不含税价格
    end;
    Lfrm2.edit2.Text := stringgrid1.Cells[str_list.IndexOf('pcs数量'),stringgrid1.Row];//
    Lfrm2.edit3.Text := stringgrid1.Cells[str_list.IndexOf('pcs价格'),stringgrid1.Row];//
    Lfrm2.edit9.Text := stringgrid1.Cells[str_list.IndexOf('参考附注'),stringgrid1.Row];//
    Lfrm2.edit5.Text := stringgrid1.Cells[str_list.IndexOf('折扣'),stringgrid1.Row];//
    Lfrm2.ComboBox2.Text :=stringgrid1.Cells[str_list.IndexOf('优先'),stringgrid1.Row];//
    Lfrm2.maskedit1.Text := stringgrid1.Cells[str_list.IndexOf('客户交货期'),stringgrid1.Row];//
    Lfrm2.maskedit2.Text := stringgrid1.Cells[str_list.IndexOf('计划装运期'),stringgrid1.Row];//
    Lfrm2.maskedit3.Text := stringgrid1.Cells[str_list.IndexOf('原始客户交期'),stringgrid1.Row];//
    Lfrm2.edit4.Text:=stringgrid1.Cells[str_list.IndexOf('分析代码4'),stringgrid1.Row];//
    Lfrm2.edit7.Text:=stringgrid1.Cells[str_list.IndexOf('分析代码5'),stringgrid1.Row];//
    Lfrm2.edit11.text := stringgrid1.Cells[str_list.IndexOf('分析代码1'),stringgrid1.Row];//
    Lfrm2.edit12.text := stringgrid1.Cells[str_list.IndexOf('分析代码2'),stringgrid1.Row];//
    Lfrm2.edit13.text := stringgrid1.Cells[str_list.IndexOf('分析代码3'),stringgrid1.Row];//
    Lfrm2.edit16.text := stringgrid1.Cells[str_list.IndexOf('set数量'),stringgrid1.Row];//set数量
    Lfrm2.edit18.text := stringgrid1.Cells[str_list.IndexOf('set价格'),stringgrid1.Row];//set价格
    Lfrm2.Label33.Caption := stringgrid1.Cells[str_list.IndexOf('工具费用'),stringgrid1.Row];//工具费用

    //下面为不存入数据库的值
    Lfrm2.Label30.Caption := stringgrid1.Cells[str_list.IndexOf('价格合计'),stringgrid1.Row]; //价格合计
    Lfrm2.Label16.Caption := stringgrid1.Cells[str_list.IndexOf('税金'),stringgrid1.Row]; //税金
    Lfrm2.Label31.Caption := stringgrid1.Cells[str_list.IndexOf('工具税'),stringgrid1.Row]; //工具税
    Lfrm2.Label32.Caption := stringgrid1.Cells[str_list.IndexOf('折扣'),stringgrid1.Row]; //折哲
    Lfrm2.Label34.Caption := stringgrid1.Cells[str_list.IndexOf('价格合计'),stringgrid1.Row]; //总合计
    Lfrm2.Label41.Caption := stringgrid1.Cells[str_list.IndexOf('面积'),stringgrid1.Row]; //面积
    cds62.Filter:='so_ptr = '+inttostr(stringgrid1.Row);  //工具费用
    cds62.Filtered:=True;
    cds62.First;
    while not cds62.Eof  do //工具费用显示
    begin
      for i:=1 to Lfrm2.StringGrid1.RowCount-2 do
      if strtoint(Lfrm2.StringGrid1.Cells[5,i])=cds62.fieldbyname('addl_cat_ptr').AsInteger then
      begin
        Lfrm2.stringgrid1.Cells[1,i]:=formatfloat('0.000',cds62.FieldValues['amount']);
        Lfrm2.stringgrid1.Cells[2,i]:=formatfloat('0.000',cds62.FieldValues['free_amount']);
        Lfrm2.stringgrid1.Cells[3,i]:=formatfloat('0.000',cds62.FieldValues['costfree_amount']);
        Lfrm2.stringgrid1.Cells[4,i]:=cds62.FieldByName('TAX_FLAG').Value;
        break;
      end;
      cds62.Next;
    end;
    if Lfrm2.ShowModal=mrok then
    begin
      btnSave.Enabled:=True;
      cds62.First;  //删除现有62
      while not cds62.Eof do
      begin
        cds62.Delete;
        cds62.Next;
      end;
      label44.Caption:=formatfloat('0.0000',strtofloat(label44.Caption)-strtofloat(stringgrid1.Cells[str_list.IndexOf('价格合计'),stringgrid1.Row]));
      label61.Caption:=formatfloat('0.000',strtofloat(label61.Caption)-strtofloat(stringgrid1.Cells[str_list.IndexOf('税金'),stringgrid1.Row]));
      label46.Caption:=formatfloat('0.000',strtofloat(label46.Caption)-strtofloat(stringgrid1.Cells[str_list.IndexOf('折扣'),stringgrid1.Row]));
      label47.Caption:=formatfloat('0.0000',strtofloat(label47.Caption)-strtofloat(stringgrid1.Cells[str_list.IndexOf('工具费用'),stringgrid1.Row]));
      label63.Caption:=formatfloat('0.0000',strtofloat(label63.Caption)-strtofloat(stringgrid1.Cells[str_list.IndexOf('工具税'),stringgrid1.Row]));
      label48.Caption:=formatfloat('0.0000',strtofloat(label48.Caption)-strtofloat(stringgrid1.Cells[str_list.IndexOf('总合计'),stringgrid1.Row]));
      label60.Caption:=formatfloat('0.0000',strtofloat(label60.Caption)-strtofloat(stringgrid1.Cells[str_list.IndexOf('面积'),stringgrid1.Row]));
      for j:=1 to Lfrm2.StringGrid1.rowcount-2 do    //暂时保存新增定单工具费用
      if (strtofloat(Lfrm2.StringGrid1.Cells[1,j])>0) or
      (strtofloat(Lfrm2.StringGrid1.Cells[2,j])>0) or
      (strtofloat(Lfrm2.StringGrid1.Cells[3,j])>0) then
      begin
        cds62.Append;
        cds62.Fieldvalues['so_ptr'] := stringgrid1.Row;
        cds62.FieldByName('addl_cat_ptr').asstring := Trim(Lfrm2.StringGrid1.Cells[5,j]);
        cds62.FieldByName('amount').asstring := Trim(Lfrm2.StringGrid1.Cells[1,j]);
        cds62.FieldByName('free_amount').asstring := Trim(Lfrm2.StringGrid1.Cells[2,j]);
        cds62.FieldByName('costfree_amount').asstring := Trim(Lfrm2.StringGrid1.Cells[3,j]);
        cds62.FieldByName('TAX_FLAG').Value:=Trim(Lfrm2.StringGrid1.Cells[4,j]);
        cds62.post;
      end;
      StringGrid1.Cells[str_list.IndexOf('订单编号'),stringgrid1.Row]:=Trim(Lfrm2.Edit1.text);
      StringGrid1.Cells[str_list.IndexOf('报价单号'),stringgrid1.Row]:=Trim(Lfrm2.edit10.text);
      StringGrid1.Cells[str_list.IndexOf('pcs数量'),stringgrid1.Row]:=Trim(Lfrm2.edit2.Text);
      StringGrid1.Cells[str_list.IndexOf('pcs价格'),stringgrid1.Row]:=Trim(Lfrm2.edit3.Text);
      StringGrid1.Cells[str_list.IndexOf('参考附注'),stringgrid1.Row]:=Trim(Lfrm2.edit9.Text);
      StringGrid1.Cells[str_list.IndexOf('折扣'),stringgrid1.Row]:=Trim(Lfrm2.edit5.Text);
      StringGrid1.Cells[str_list.IndexOf('优先'),stringgrid1.Row]:= Trim(Lfrm2.combobox2.Text);
      StringGrid1.Cells[str_list.IndexOf('客户交货期'),stringgrid1.Row]:=Trim(Lfrm2.maskedit1.Text);
      StringGrid1.Cells[str_list.IndexOf('计划装运期'),stringgrid1.Row]:=Trim(Lfrm2.maskedit2.Text);
      StringGrid1.Cells[str_list.IndexOf('原始客户交期'),stringgrid1.Row]:=Trim(Lfrm2.maskedit3.Text);
      StringGrid1.Cells[str_list.IndexOf('分析代码4'),stringgrid1.Row]:=Trim(Lfrm2.edit4.Text);
      StringGrid1.Cells[str_list.IndexOf('分析代码5'),stringgrid1.Row]:=Trim(Lfrm2.edit7.Text);
      StringGrid1.Cells[str_list.IndexOf('分析代码1'),stringgrid1.Row]:=Trim(Lfrm2.edit11.text);
      StringGrid1.Cells[str_list.IndexOf('分析代码2'),stringgrid1.Row]:=Trim(Lfrm2.edit12.text);
      StringGrid1.Cells[str_list.IndexOf('分析代码3'),stringgrid1.Row]:=Trim(Lfrm2.edit13.text);
      StringGrid1.Cells[str_list.IndexOf('set数量'),stringgrid1.Row]:=Trim(Lfrm2.edit16.text);
      StringGrid1.Cells[str_list.IndexOf('set价格'),stringgrid1.Row]:=Trim(Lfrm2.edit18.text);
      StringGrid1.Cells[str_list.IndexOf('工具税'),stringgrid1.Row]:=Trim(Lfrm2.Label31.Caption);
      StringGrid1.Cells[str_list.IndexOf('工具费用'),stringgrid1.Row]:=Trim(Lfrm2.Label33.Caption);
      StringGrid1.Cells[str_list.IndexOf('价格合计'),stringgrid1.Row]:=Trim(Lfrm2.Label30.Caption);
      StringGrid1.Cells[str_list.IndexOf('税金'),stringgrid1.Row]:=Trim(Lfrm2.Label16.Caption);
      StringGrid1.Cells[str_list.IndexOf('折扣'),stringgrid1.Row]:=Trim(Lfrm2.Label32.Caption);
      StringGrid1.Cells[str_list.IndexOf('总合计'),stringgrid1.Row]:= Trim(Lfrm2.Label34.Caption);
      StringGrid1.Cells[str_list.IndexOf('面积'),stringgrid1.Row]:=Trim(Lfrm2.Label41.Caption);
      StringGrid1.Cells[str_list.IndexOf('Rkey283'),stringgrid1.Row]:=IntToStr(Lfrm2.i283rkey);
      if (Trim(Lfrm2.Edit10.Text)='') then
      begin
        StringGrid1.Cells[str_list.IndexOf('BOM06rkey'),stringgrid1.Row]:='';
        StringGrid1.Cells[str_list.IndexOf('BOM不含税价格'),stringgrid1.Row]:='';
      end else
      begin
        StringGrid1.Cells[str_list.IndexOf('BOM06rkey'),stringgrid1.Row]:=FBp06_ptr;
        StringGrid1.Cells[str_list.IndexOf('BOM不含税价格'),stringgrid1.Row]:=FBomBuHanShuiJiaGe;
      end;
      label44.Caption:=formatfloat('0.0000',strtofloat(label44.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('价格合计'),stringgrid1.Row]));
      label61.Caption:=formatfloat('0.000',strtofloat(label61.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('税金'),stringgrid1.Row]));
      label46.Caption:=formatfloat('0.000',strtofloat(label46.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('折扣'),stringgrid1.Row]));
      label47.Caption:=formatfloat('0.0000',strtofloat(label47.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('工具费用'),stringgrid1.Row]));
      label63.Caption:=formatfloat('0.0000',strtofloat(label63.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('工具税'),stringgrid1.Row]));
      label48.Caption:=formatfloat('0.0000',strtofloat(label48.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('总合计'),stringgrid1.Row]));
      label60.Caption:=formatfloat('0.0000',strtofloat(label60.Caption)+strtofloat(stringgrid1.Cells[str_list.IndexOf('面积'),stringgrid1.Row]));
    end;
    if (StringGrid1.RowCount>2) then
    begin
      TryEnabled(False);
      btnSave.Enabled:=True;
    end;
  finally
    LFrm2.Free;
  end;
end;

procedure TfrmNewSales2.findOldVersion(ARkey25: string);
var Lsql25:string;
    Lcds:TClientDataSet;
begin
  lcds:=TClientDataSet.Create(Application);
  try
    Lsql25:='select COPYFROMCUST_PTR from Data0273 where CUSTOMER_PART_PTR='+ Arkey25;
    if not gSvrIntf.IntfGetDataBySql(Lsql25,lcds) then Exit;
    if lcds.RecordCount<>0 then
    begin
      AllVersion:= AllVersion + lcds.FieldByName('COPYFROMCUST_PTR').AsString+',';
      findOldVersion(lcds.FieldByName('COPYFROMCUST_PTR').AsString);
    end
    else
    begin
      if AllVersion<>'' then
      AllVersion:= '('+Copy(AllVersion,1,Length(AllVersion)-1)+')';
    end;
  finally
    lcds.Free;
  end;
end;

function TfrmNewSales2.find_allqty_so(Arkey10: string;var sales_order: string): Boolean;
var Lsq53:string;
    Lcds:TClientDataSet;
begin
  find_allqty_so:=False;
  lcds:=TClientDataSet.Create(Application);
  try
    Lsq53:=' ;with CTE AS '
           +'    ( '
           +'   SELECT  dbo.data0492.SO_NO,data0060.CUST_PART_PTR, data0060.PURCHASE_ORDER_PTR '
           +'     FROM   dbo.Data0053 INNER JOIN '
           +'       dbo.Data0006 ON dbo.Data0053.WORK_ORDER_PTR = dbo.Data0006.RKEY INNER JOIN '
           +'       dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO INNER JOIN '
           +'       dbo.Data0060 ON dbo.data0492.SO_NO = dbo.Data0060.SALES_ORDER '
           +'     WHERE   (dbo.Data0060.CUSTOMER_PTR ='+Arkey10+' AND (dbo.Data0060.STATUS = 1) AND '
           +'     (data0060.PARTS_SHIPPED < data0060.PARTS_ORDERED) and '
           +'     (dbo.Data0060.so_style = 0) AND '
           +'     (data0060.SCH_DATE < getdate()-1) and '
           +'     (Data0053.QTY_ON_HAND - Data0053.QTY_ALLOC > 0)) '
           +'     GROUP BY dbo.data0492.SO_NO,data0060.CUST_PART_PTR, data0060.PURCHASE_ORDER_PTR '
           +'     union all '
           +'     SELECT     dbo.Data0060.SALES_ORDER as SO_NO,data0060.CUST_PART_PTR, data0060.PURCHASE_ORDER_PTR '
           +'     FROM    dbo.Data0053 INNER JOIN  '
           +'       dbo.data0416 ON dbo.Data0053.NPAD_PTR = dbo.data0416.rkey INNER JOIN  '
           +'       dbo.Data0060 ON dbo.data0416.so_ptr = dbo.Data0060.RKEY '
           +'     WHERE     (dbo.Data0060.CUSTOMER_PTR ='+Arkey10+' AND (dbo.Data0060.STATUS = 1) AND '
           +'     (data0060.PARTS_SHIPPED < data0060.PARTS_ORDERED) and '
           +'     (dbo.Data0060.so_style = 0) AND '
           +'     (data0060.SCH_DATE < getdate()-1) and '
           +'     (dbo.Data0053.QTY_ON_HAND - dbo.Data0053.QTY_ALLOC > 0)) '
           +'     GROUP BY dbo.Data0060.SALES_ORDER,data0060.CUST_PART_PTR, data0060.PURCHASE_ORDER_PTR '
           +'     ) '
           +'   SELECT top 1 dbo.Data0025.MANU_PART_NUMBER, dbo.Data0097.PO_NUMBER,Data0060.SALES_ORDER, '
           +'           SUM(dbo.Data0060.PARTS_ORDERED) AS parts_order_qty, derivedtbl_2.all_shipqty '
           +'   FROM    dbo.Data0060 INNER JOIN '
           +'       dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN  '
           +'       dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY INNER JOIN '
           +'           CTE on Data0025.RKEY = CTE.CUST_PART_PTR and Data0097.RKEY = CTE.PURCHASE_ORDER_PTR '
           +'           LEFT OUTER JOIN '
           +'           ( SELECT PO_NUMBER, MANU_PART_NUMBER, SUM(ISNULL(all_shipqty,0)) AS all_shipqty '
           +'              FROM dbo.Data0114 '
           +'              WHERE (all_shipqty > 0) AND (TTYPE = 2) '
           +'              GROUP BY PO_NUMBER, MANU_PART_NUMBER ) AS derivedtbl_2 '
           +'              ON dbo.Data0097.PO_NUMBER = derivedtbl_2.PO_NUMBER AND '
           +'           dbo.Data0025.MANU_PART_NUMBER = derivedtbl_2.MANU_PART_NUMBER '
           +'   WHERE  (dbo.Data0060.so_style = 0) AND (dbo.Data0060.PART_PRICE > 0) '
           +'   GROUP BY dbo.Data0025.MANU_PART_NUMBER, dbo.Data0097.PO_NUMBER, derivedtbl_2.all_shipqty,Data0060.SALES_ORDER '
           +'   having all_shipqty< SUM(dbo.Data0060.PARTS_ORDERED)';
    if not gSvrIntf.IntfGetDataBySql(Lsq53,lcds) then Exit;
    if not Lcds.IsEmpty then
    begin
      sales_order:=Lcds.FieldByName('SALES_ORDER').AsString;
      Result:=True;
    end else
      Result:=False;
  finally
    lcds.Free;
  end;
end;

function TfrmNewSales2.find_socongfu(Arkey97, Arkey25, PCSQTY: string): Boolean;
var Lsq60:string;
    Lcds:TClientDataSet;
begin
  find_socongfu:=False;
  lcds:=TClientDataSet.Create(Application);
  try
    Lsq60:='select rkey from data0060 where PURCHASE_ORDER_PTR='+Arkey97+' and CUST_PART_PTR='+
    Arkey25+' and PARTS_ORDERED='+PCSQTY+' and ENT_DATE> DATEADD(DAY,-30,CAST(CONVERT(VARCHAR(10),GETDATE(),120) AS DATETIME))';
    if not gSvrIntf.IntfGetDataBySql(Lsq60,lcds) then Exit;
    if not Lcds.IsEmpty then
      Result:=True;
  finally
    lcds.Free;
  end;
end;

procedure TfrmNewSales2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmNewSales2 := nil;
end;

procedure TfrmNewSales2.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage:=TabSheet1;
  iNew97YN:=0;
end;

procedure TfrmNewSales2.Get89(Arkey25: string);
var Lsql89:string;
begin
  Lsql89:='select data0089.*,Data0278.RKEY,Data0278.PARAMETER_NAME,'
          +' Data0278.PARAMETER_DESC,Data0002.UNIT_NAME,Data0278.SPEC_RKEY'
          +' from data0089 inner join Data0278 on data0089.parameter_ptr=Data0278.rkey'
          +' INNER JOIN Data0002 ON Data0278.UNIT_PTR = Data0002.RKEY where data0089.cust_part_ptr='+ ARkey25;
  if not gSvrIntf.IntfGetDataBySql(Lsql89,cds89) then Exit;
end;

procedure TfrmNewSales2.GetData(ARkey60:string);
var LSQL60,Lsq192,Lsql62:string;
begin
  // data60
  LSQL60 := 'select data0060.*,data0025.MANU_PART_NUMBER,data0025.MANU_PART_DESC,data0025.ANALYSIS_CODE_2 '
           +'from data0060 inner join data0025 on data0060.CUST_PART_PTR=data0025.rkey where data0060.rkey = ' + ARkey60;
  Lsq192:='select artaxontax,aptaxontax,QTE_control2,ppc_control15,custcitool,'
          +'custciprod,suplcimat,custciship,CUSTCOPROD,CUSTSTAPROD,custcoTool from data0192';
  Lsql62:='select * from data0062 where rkey is null';
  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSQL60,Lsq192,Lsql62]),[cds60,cds192,cds62]) then Exit;
//  if (ARkey60='0') then
//  begin
//    cds60.Append;
//    cds60.FieldByName('IDKEY').AsString := gFunc.CreateIDKey;
//    cds60.Post;
//    cds62.DisableControls;
//    try
//      cds62.First;
//      while not cds62.Eof do
//      begin
//        cds62.Edit;
//        cds62.FieldByName('D60_IDKey').AsString := cds60.FieldByName('IDKEY').AsString;
//        cds62.Post;
//        cds62.Next;
//      end;
//      cds62.First;
//    finally
//      cds62.EnableControls;
//    end;
//  end;
end;

function TfrmNewSales2.Getso_oldnew(Arkey25: string): byte;
var Lsql25:string;
    Lcds:TClientDataSet;
begin
  lcds:=TClientDataSet.Create(Application);
  try
    Lsql25:='SELECT rkey FROM data0060 WHERE cust_part_ptr='+ Arkey25;
    if not gSvrIntf.IntfGetDataBySql(Lsql25,lcds) then Exit;
    if Lcds.IsEmpty then
      Result:=0 //新单
    else
      Result:=1; //旧单
  finally
    lcds.Free;
  end;
end;

procedure TfrmNewSales2.init;
var i,j:integer;
begin
  dLongDate:=gFunc.GetSvrDateTime;
  dShortDate:=StrToDate(FormatDateTime('yyyy-MM-dd',dLongDate));
  RKeyRzBtnEdit5.Text:=DateToStr(dShortDate);
  for j :=StringGrid1.RowCount  downto 0  do
  begin
    for i:=0 to StringGrid1.ColCount do
    begin
      StringGrid1.Cells[i,j]:='';
    end;
    stringgrid1.rowcount := stringgrid1.rowcount - 1;
  end;
  stringgrid1.rowcount :=2;
  str_list := TStringList.Create;
  str_list.Add('订单编号');
  str_list.Add('报价单号');
  str_list.Add('pcs数量');
  str_list.Add('pcs价格');
  str_list.Add('参考附注');
  str_list.Add('折扣');
  str_list.Add('优先');
  str_list.Add('客户交货期');
  str_list.Add('计划装运期');
  str_list.Add('原始客户交期');
  str_list.Add('分析代码4');
  str_list.Add('分析代码5');
  str_list.Add('分析代码1');
  str_list.Add('分析代码2');
  str_list.Add('分析代码3');
  str_list.Add('set数量');
  str_list.Add('set价格');
  str_list.Add('工具税');
  str_list.Add('工具费用');
  str_list.Add('价格合计');
  str_list.Add('税金');
  str_list.Add('折扣');
  str_list.Add('总合计');
  str_list.Add('面积');
  str_list.Add('rkey213');
  str_list.Add('BOM06rkey');
  str_list.Add('BOM不含税价格');
  str_list.Add('已使用数量');
  str_list.Add('预处理数量');
  str_list.Add('Rkey283');
  StringGrid1.ColCount:=str_list.Count;
  for j := 0 to str_list.Count-1  do    //SGrd添加第一行的字段名
  begin
    StringGrid1.Cells[j,0] := str_list[j];
  end;
  stringgrid1.ColWidths[0]:=128;
  stringgrid1.ColWidths[1]:=60;
  stringgrid1.ColWidths[3]:=74;
  stringgrid1.ColWidths[7]:=100;
  stringgrid1.ColWidths[8]:=100;
  StringGrid1.FixedRows:=1;
  RKeyRzBtnEdit14.Text:=formatdatetime('yyyy-mm-dd HH:mm:ss',dLongDate);
  if213:=0;
end;

procedure TfrmNewSales2.RadioGroup1Click(Sender: TObject);
begin
  inherited;
  if RadioGroup1.ItemIndex=1 then
    RKeyRzBtnEdit15.Enabled:=True
  else
  begin
    RKeyRzBtnEdit15.Enabled:=False;
    cds60.Edit;
    cds60.FieldByName('supplier_ptr').Value:=null;//装运地址Rkey12
    cds60.FieldByName('TAX_2').Value:=null;//委外入库成本折率%
    cds60.Post;
  end;
end;

procedure TfrmNewSales2.RKeyRzBtnEdit10ButtonClick(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(72,1,' and customer_ptr='+cds60.FieldByName('CUSTOMER_PTR').AsString+'  order by location');
    if LFrm.ShowModal = mrOk then
    begin
      cds60.Edit;
      cds60.FieldByName('CUST_SHIP_ADDR_PTR').Value:=LFrm.cdsPick.FieldByName('Rkey').AsInteger;//装运地址Rkey12
      cds60.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmNewSales2.RKeyRzBtnEdit11ButtonClick(Sender: TObject);
var LFrm2: TfrmSinglePickList;
begin
  inherited;
  LFrm2 := TfrmSinglePickList.Create(Self);
  try
    LFrm2.InitWithPickID(72,StrToInt(RKeyRzBtnEdit11.DisplayPickID));
    if LFrm2.ShowModal = mrOk then
    begin
      cds60.Edit;
      cds60.FieldByName('SHIPPING_METHOD').Value:=LFrm2.cdsPick.FieldByName('DESCRIPTION').AsString;//装运方法Rkey370
      cds60.Post;
    end;
  finally
    LFrm2.Free;
  end;
end;

procedure TfrmNewSales2.RKeyRzBtnEdit15ButtonClick(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  inherited;
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(72,StrToInt(RKeyRzBtnEdit15.DisplayPickID));
    if LFrm.ShowModal = mrOk then
    begin
      cds60.Edit;
      cds60.FieldByName('SUPPLIER_PTR').Value:=LFrm.cdsPick.FieldByName('rkey').AsString;//data0023Rkey
      cds60.FieldByName('TAX_2').Value:=LFrm.cdsPick.FieldByName('TAX_2').Value;//委外入库成本折率%
      cds60.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmNewSales2.RKeyRzBtnEdit16ButtonClick(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  inherited;
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(72,StrToInt(RKeyRzBtnEdit16.DisplayPickID),' where D10_Ptr='+cds60.FieldByName('CUSTOMER_PTR').AsString+'');
    if LFrm.ShowModal = mrOk then
    begin
      cds60.Edit;
      cds60.FieldByName('Print2DKey').Value:=LFrm.cdsPick.FieldByName('rkey').AsString;//二维码打印格式
      cds60.Post;
      RKeyRzBtnEdit16.Text:=LFrm.cdsPick.FieldByName('BarName').Value;//二维码打印格式名称
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmNewSales2.RKeyRzBtnEdit1ButtonClick(Sender: TObject);
var LFrm: TfrmSinglePickList;
    i:Integer;
begin
  if (Trim(Edit2.Text)<>'') then Edit2.Text:='';
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(72,1,' order by cust_code');
    if LFrm.ShowModal = mrOk then
    begin
      cds60.Edit;
      cds60.FieldByName('CUSTOMER_PTR').Value:=LFrm.cdsPick.FieldByName('rkey').AsInteger; //客户Rkey10
      cds60.FieldByName('CURRENCY_PTR').Value:=LFrm.cdsPick.FieldByName('CURRENCY_PTR').AsInteger;//货币Rkey10
      cds60.FieldByName('EXCH_RATE').Value:=LFrm.cdsPick.FieldByName('EXCH_RATE').Value; //汇率
      cds60.FieldByName('COMM_ASSIGNED_BY_E_P').Value:=LFrm.cdsPick.FieldByName('SALES_REP_PTR').AsInteger; //业务员
      cds60.FieldByName('CUST_SHIP_ADDR_PTR').Value:=LFrm.cdsPick.FieldByName('Rkey12').AsInteger;//装运地址Rkey12
      cds60.FieldByName('COMMISION_ON_TOOLING').Value:=LFrm.cdsPick.FieldByName('EDI_FLAG_FOR_SOACK').Value;//是否转厂
      cds60.FieldByName('STATE_PROD_TAX_FLAG').Value:=LFrm.cdsPick.FieldByName('STATE_PROD_TAX_FLAG').Value;//增值税产品标识Y,N
      cds60.FieldByName('STATE_TOOL_TAX_FLAG').Value:=LFrm.cdsPick.FieldByName('STATE_TOOL_TAX_FLAG').Value;//增值税工具标识Y,N
      cds60.FieldByName('FOB').Value:=LFrm.cdsPick.FieldByName('SHIP_FOB').Value;//合同号
      cds60.FieldByName('SHIPPING_CONTACT').Value:=LFrm.cdsPick.FieldByName('ship_to_contact').Value;//装运联络人
      cds60.FieldByName('SHIPPING_METHOD').Value:=LFrm.cdsPick.FieldByName('ship_shipping_method').Value;//装运方法
      cds60.FieldByName('COD_FLAG').Value:=LFrm.cdsPick.FieldByName('cod_flag').Value;//货到收款(Y,N)
      cds60.FieldByName('SHIP_CONTACT_PHONE').Value:=LFrm.cdsPick.FieldByName('ship_to_phone').Value;//装运联络人电话
      cds60.FieldByName('RUSH_CHARGE').Value:=LFrm.cdsPick.FieldByName('state_tax').Value;//增值税率%
      cds60.FieldByName('COMMISION_ON_TOOLING').Value:=LFrm.cdsPick.FieldByName('EDI_FLAG_FOR_SOACK').Value;//是否出口
      cds60.FieldByName('tax_in_price').Value:=LFrm.cdsPick.FieldByName('EDI_FLAG_FOR_INVOICE').Value;//是否含税标示
      if (Trim(LFrm.cdsPick.FieldByName('SHIP_LEAD_TIME').AsString)='') then
        cds60.FieldByName('rush_charge_pct_used').Value:=0  //装运交货提前天数
      else
        cds60.FieldByName('rush_charge_pct_used').Value:=LFrm.cdsPick.FieldByName('SHIP_LEAD_TIME').AsInteger;  //装运交货提前天数
      cds60.Post;
      Label36.Caption:=LFrm.cdsPick.FieldByName('cod_flag').AsString;//货到收款(Y,N)
      Label3.Caption:=LFrm.cdsPick.FieldByName('FED_TAX_ID_NO').AsString;//付款方式
      radiogroup2.ItemIndex:=LFrm.cdsPick.FieldByName('EDI_FLAG_FOR_INVOICE').AsInteger;//是否含税标示
      Edit18.Text:=LFrm.cdsPick.FieldByName('state_id').AsString;//税率代码
      Edit19.Text:=LFrm.cdsPick.FieldByName('state_tax').AsString;////增值税率%
      ComboBox1.Items.Clear;
      for i:=1 to 6 do           //客户联络人
      if trim(LFrm.cdsPick.FieldByName('contact_name_'+inttostr(i)).asstring)<>'' then
      combobox1.Items.Add(trim(LFrm.cdsPick.FieldByName('contact_name_'+inttostr(i)).asstring));
      combobox1.ItemIndex:=0;
      if LFrm.cdsPick.FieldByName('EDI_FLAG_FOR_SOACK').AsInteger=1 then //出口
        checkbox1.Checked:=true
       else
        checkbox1.Checked:=false;
      if (Trim(LFrm.cdsPick.FieldByName('curr_name').AsString)='人民币') then
      RKeyRzBtnEdit8.Enabled:=False
      else
      RKeyRzBtnEdit8.Enabled:=True;
      COD_FLAG:=LFrm.cdsPick.FieldByName('COD_FLAG').AsString; //货到收款标志
      FED_TAX_ID_NO:=LFrm.cdsPick.FieldByName('FED_TAX_ID_NO').AsString; //付款方式
      customer_quote:=LFrm.cdsPick.FieldByName('quote_flag').AsBoolean;//客户报价关联标志
      CREDIT_RATING:=LFrm.cdsPick.FieldByName('CREDIT_RATING').AsInteger;   //，信用等级
      INVOICE_NOTE_PAD_PTR:=LFrm.cdsPick.FieldByName('INVOICE_NOTE_PAD_PTR').AsInteger;  //未付款最多超期
      SHIP_LEAD_TIME:=LFrm.cdsPick.FieldByName('SHIP_LEAD_TIME').AsInteger;  //装运交货提前天数
      CREDIT_LIMIT:=LFrm.cdsPick.FieldByName('CREDIT_LIMIT').AsFloat;//信用限额
      QUOTE_FACTOR1:=LFrm.cdsPick.FieldByName('QUOTE_FACTOR1').AsInteger;  //允许连续下单

      Edit1.Enabled:=True;
      BitBtn3.Enabled:=True;
      RKeyRzBtnEdit10.Enabled:=True;
      RKeyRzBtnEdit11.Enabled:=True;
      RKeyRzBtnEdit16.Enabled:=True;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmNewSales2.RKeyRzBtnEdit1Change(Sender: TObject);
begin
  inherited;
  if (Trim(Edit2.Text)='') then
  begin
    cds60.Edit;
    cds60.FieldByName('CUSTOMER_PTR').Value:=null;
    if (cds192.FieldByName('custcoTool').AsString='Y') then
    begin
      cds60.FieldByName('CURRENCY_PTR').Value:=null;//货币Rkey01
      cds60.FieldByName('CUST_PART_PTR').Value:=null;
      cds60.FieldByName('EXCH_RATE').Value:=null; //汇率
      cds60.FieldByName('COMM_ASSIGNED_BY_E_P').Value:=null; //业务员
      cds60.FieldByName('CUST_SHIP_ADDR_PTR').Value:=null;//装运地址Rkey12
      cds60.FieldByName('COMMISION_ON_TOOLING').Value:=null;//是否转厂
      cds60.FieldByName('STATE_PROD_TAX_FLAG').Value:=null;//增值税产品标识Y,N
      cds60.FieldByName('STATE_TOOL_TAX_FLAG').Value:=null;//增值税工具标识Y,N
      cds60.FieldByName('FOB').Value:=null;//合同号
      cds60.FieldByName('SHIPPING_CONTACT').Value:=null;//装运联络人
      cds60.FieldByName('SHIPPING_METHOD').Value:=null;//装运方法
      cds60.FieldByName('COD_FLAG').Value:=null;//货到收款(Y,N)
      cds60.FieldByName('SHIP_CONTACT_PHONE').Value:=null;//装运联络人电话
      cds60.FieldByName('RUSH_CHARGE').Value:=null;//增值税率%
      cds60.FieldByName('COMMISION_ON_TOOLING').Value:=null;//是否出口
      cds60.FieldByName('PURCHASE_ORDER_PTR').Value:=null;//Rkey97
      BitBtn3.Enabled:=False;
      Edit1.Enabled:=False;
      RKeyRzBtnEdit10.Enabled:=False;
      RKeyRzBtnEdit11.Enabled:=False;
      RKeyRzBtnEdit16.Enabled:=False;
      ComboBox1.Items.Clear;
      Edit18.Text:='';
      Edit19.Text:='';
      Memo2.Text:='';
      Memo1.Text:='';
      RadioGroup2.ItemIndex:=-1;
    end;
    cds60.Post;
  end;
end;

procedure TfrmNewSales2.RKeyRzBtnEdit2ButtonClick(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(72,StrToInt(RKeyRzBtnEdit2.DisplayPickID));
    if LFrm.ShowModal = mrOk then
    begin
      cds60.Edit;
      cds60.FieldByName('ORIG_CUSTOMER').Value:=LFrm.cdsPick.FieldByName('ABBR_NAME').AsString;
      cds60.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmNewSales2.RKeyRzBtnEdit3ButtonClick(Sender: TObject);
var LFrm: TfrmSinglePickList;
    Lcds:TClientDataSet;
begin
  inherited;
  LFrm := TfrmSinglePickList.Create(Self);
  Lcds:=TClientDataSet.Create(Self);
  try
    if (Trim(cds60.FieldByName('CUSTOMER_PTR').AsString)<>'') and (cds192.FieldByName('custcoTool').AsString='N') then
      LFrm.InitWithPickID(72,StrToInt(RKeyRzBtnEdit3.DisplayPickID),' and MANU_PART_NUMBER LIKE ''%'+Trim(RKeyRzBtnEdit3.Text)+'%'' and CUSTOMER_PTR='+cds60.FieldByName('CUSTOMER_PTR').AsString+'  order by MANU_PART_NUMBER')
    else
      LFrm.InitWithPickID(72,StrToInt(RKeyRzBtnEdit3.DisplayPickID),' and MANU_PART_NUMBER LIKE ''%'+Trim(RKeyRzBtnEdit3.Text)+'%'' order by MANU_PART_NUMBER');
    if LFrm.ShowModal = mrOk then
    begin
      RKeyRzBtnEdit2.Enabled:=True;
      cds60.Edit;
      cds60.FieldByName('CUST_PART_PTR').Value:=LFrm.cdsPick.FieldByName('rkey').Value;// rkey25
      cds60.FieldByName('ORIG_CUSTOMER').Value:=LFrm.cdsPick.FieldByName('ORIG_CUSTOMER').AsString;//关联原客户
      cds60.Post;
      if (Trim(redt2.Text)='') and (LFrm.cdsPick.FieldByName('PROD_ROUTE_PTR').Value>0) then
      begin
        cds60.Edit;
        cds60.FieldByName('SHIP_REG_TAX_ID').Value:=LFrm.cdsPick.FieldByName('PROD_ROUTE_PTR').Value;// 工厂
        cds60.Post;
      end;
      if (Trim(Edit2.Text)='') then
      begin
        cds60.Edit;
        cds60.FieldByName('CUSTOMER_PTR').Value:=LFrm.cdsPick.FieldByName('CUSTOMER_PTR').Value;// 客户
        cds60.Post;
        edit2.Text:=LFrm.cdsPick.FieldByName('cust_code').AsString;
        Label4.Caption:=LFrm.cdsPick.FieldByName('customer_name').AsString;
        Fcust:=Edit2.Text;
        Edit2Exit(nil);
      end;
      memo1.Text:=LFrm.cdsPick.FieldByName('REMARK').AsString;//加工指示
      memo2.Text:=LFrm.cdsPick.FieldByName('ENG_NOTE').AsString; //工程备注
      Edit14.Text:=LFrm.cdsPick.FieldByName('qty_on_hand').AsString;//现持有数量
      label38.Caption:=LFrm.cdsPick.FieldByName('qty_alloc').AsString;
      label39.Caption:=floattostr(LFrm.cdsPick.FieldByName('qty_on_hand').Value-
                        LFrm.cdsPick.FieldByName('qty_alloc').Value);
      Get89(cds60.FieldByName('CUST_PART_PTR').AsString);//显示合同评审内容
      set_length:=LFrm.cdsPick.FieldByName('set_lngth').Value;//交货set长
      set_width :=LFrm.cdsPick.FieldByName('set_width').Value;// 交货set宽
      v_part_num := LFrm.cdsPick.FieldByName('ttype').Value;//量板，样板
      if LFrm.cdsPick.FieldByName('SHELF_LIFE').AsString='' then
        shelf_life:=LFrm.cdsPick.FieldByName('LEAD_TIME').Value //产品周期
      else
        shelf_life:=LFrm.cdsPick.FieldByName('SHELF_LIFE').Value; //产品周期
      set_qty:=LFrm.cdsPick.FieldByName('set_qty').Value;//交货单元数
      unit_sq:=LFrm.cdsPick.FieldByName('unit_sq').AsFloat;//交货单只面积m2
      if (LFrm.cdsPick.FieldByName('ttype').AsInteger=0) then //产品是否报价单关联
      quote_flag:=LFrm.cdsPick.FieldByName('batch_flag').AsBoolean
      else
      quote_flag:=LFrm.cdsPick.FieldByName('former_flag').AsBoolean;
      combobox3.ItemIndex:=Getso_oldnew(LFrm.cdsPick.FieldByName('rkey').AsString); //订单新旧
      if (v_part_num=0) then //量板
      begin
        label51.Caption := cds192.FieldByName('aptaxontax').AsString;//量板需要审批
        aptaxontax:=cds192.FieldByName('aptaxontax').AsString;

        if (Trim(cds192.FieldByName('custciship').AsString)='Y') then
        RKeyRzBtnEdit8.Enabled:=False;
      end else
      begin  //样板
        label51.Caption := cds192.FieldByName('artaxontax').AsString;//样板需要审批
        aptaxontax:=cds192.FieldByName('artaxontax').AsString;
        RKeyRzBtnEdit8.Enabled:=True;
      end;
      BitBtn3.Enabled:=True;
      Edit1.Enabled:=True;
      RKeyRzBtnEdit10.Enabled:=True;
      RKeyRzBtnEdit11.Enabled:=True;
      RKeyRzBtnEdit16.Enabled:=True;
    end;
  finally
    Lcds.Free;
    LFrm.Free;
  end;
end;

procedure TfrmNewSales2.RKeyRzBtnEdit3Exit(Sender: TObject);
var Lcds:TClientDataSet;
    sSQL25:string;
begin
  //inherited;
  if (Trim(RKeyRzBtnEdit3.Text)<>'') then
  begin
    Lcds:=TClientDataSet.Create(Self);
    try
      sSQL25:='SELECT TOP 100 PERCENT  data0025.rkey,  ENG_NOTE, PROD_CODE_PTR, data0025.REMARK,'
             +'data0025.RKEY AS rkey25,MANU_PART_NUMBER, MANU_PART_DESC, ttype, QTY_ON_HAND,Data0008.batch_flag, Data0008.former_flag,'
             +' CUSTOMER_PTR, SHELF_LIFE, ONHOLD_SALES_FLAG, ANALYSIS_CODE_2,set_lngth, set_width,'
             +' unit_sq, set_qty,qty_alloc,case data0025.ttype when 0 then ''量产'' when 1 then ''样板'' end as bachorfam,'
             +' data0008.product_name,data0025.prod_route_ptr,data0008.LEAD_TIME,Data0025.ORIG_CUSTOMER,'
             +' data0010.cust_code,Data0010.CUSTOMER_NAME,Data0015.WAREHOUSE_CODE,Data0015.WAREHOUSE_NAME'
             +' FROM Data0025 inner join data0008 on data0025.PROD_CODE_PTR=data0008.rkey'
             +' left join Data0010 on Data0025.CUSTOMER_PTR=Data0010.RKEY'
             +' left join Data0015 on Data0025.PROD_ROUTE_PTR=Data0015.RKEY'
             +' WHERE (PARENT_PTR IS NULL) AND (ONHOLD_SALES_FLAG <> 1) ';
      if (Trim(cds60.FieldByName('CUSTOMER_PTR').AsString)<>'') and (cds192.FieldByName('custcoTool').AsString='N') then
        sSQL25:=sSQL25+' and MANU_PART_NUMBER LIKE ''%'+Trim(RKeyRzBtnEdit3.Text)+'%'' and CUSTOMER_PTR='+cds60.FieldByName('CUSTOMER_PTR').AsString+'  order by MANU_PART_NUMBER'
      else
        sSQL25:=sSQL25+' and MANU_PART_NUMBER LIKE ''%'+Trim(RKeyRzBtnEdit3.Text)+'%'' order by MANU_PART_NUMBER';
      gSvrIntf.IntfGetDataBySql(sSQL25,Lcds);
      if not Lcds.IsEmpty then
      begin
        RKeyRzBtnEdit2.Enabled:=True;
        cds60.Edit;
        cds60.FieldByName('CUST_PART_PTR').Value:=Lcds.FieldByName('rkey').Value;// 本厂编号
        cds60.FieldByName('ORIG_CUSTOMER').Value:=Lcds.FieldByName('ORIG_CUSTOMER').AsString;//关联原客户
        cds60.Post;
        if (Trim(redt2.Text)='') and (Lcds.FieldByName('PROD_ROUTE_PTR').Value>0) then
        begin
          cds60.Edit;
          cds60.FieldByName('SHIP_REG_TAX_ID').Value:=Lcds.FieldByName('PROD_ROUTE_PTR').Value;// 工厂
          cds60.Post;
        end;
        if (Trim(Edit2.Text)='') then
        begin
          cds60.Edit;
          cds60.FieldByName('CUSTOMER_PTR').Value:=Lcds.FieldByName('CUSTOMER_PTR').Value;// 客户
          cds60.Post;
          edit2.Text:=Lcds.FieldByName('cust_code').AsString;
          Label4.Caption:=Lcds.FieldByName('customer_name').AsString;
          Fcust:=Edit2.Text;
          Edit2Exit(nil);
        end;
        memo1.Text:=Lcds.FieldByName('REMARK').AsString;//加工指示
        memo2.Text:=Lcds.FieldByName('ENG_NOTE').AsString; //工程备注
        Edit14.Text:=Lcds.FieldByName('qty_on_hand').AsString;//
        label38.Caption:=Lcds.FieldByName('qty_alloc').AsString;
        label39.Caption:=floattostr(Lcds.FieldByName('qty_on_hand').Value-
                          Lcds.FieldByName('qty_alloc').Value);
        Get89(cds60.FieldByName('CUST_PART_PTR').AsString);//显示合同评审内容
        set_length:=Lcds.FieldByName('set_lngth').Value;//交货set长
        set_width :=Lcds.FieldByName('set_width').Value;// 交货set宽
        v_part_num := Lcds.FieldByName('ttype').Value;//量板，样板
        if (v_part_num=0) then //量板
        begin
          label51.Caption := cds192.FieldByName('aptaxontax').AsString;//量板需要审批
          aptaxontax:=cds192.FieldByName('aptaxontax').AsString;

          if (Trim(cds192.FieldByName('custciship').AsString)='Y') then
          RKeyRzBtnEdit8.Enabled:=False;
        end else
        begin  //样板
          label51.Caption := cds192.FieldByName('artaxontax').AsString;//样板需要审批
          aptaxontax:=cds192.FieldByName('artaxontax').AsString;
          RKeyRzBtnEdit8.Enabled:=True;
        end;
        if Lcds.FieldByName('SHELF_LIFE').AsString='' then
          shelf_life:=Lcds.FieldByName('LEAD_TIME').Value //产品周期
        else
          shelf_life:=Lcds.FieldByName('SHELF_LIFE').Value; //产品周期
        set_qty:=Lcds.FieldByName('set_qty').Value;//交货单元数
        unit_sq:=Lcds.FieldByName('unit_sq').AsFloat;//交货单只面积m2
        if (Lcds.FieldByName('ttype').AsInteger=0) then //产品是否报价单关联
        quote_flag:=Lcds.FieldByName('batch_flag').AsBoolean
        else
        quote_flag:=Lcds.FieldByName('former_flag').AsBoolean;
        combobox3.ItemIndex:=Getso_oldnew(Lcds.FieldByName('rkey').AsString); //订单新旧
        BitBtn3.Enabled:=True;
        Edit1.Enabled:=True;
        RKeyRzBtnEdit10.Enabled:=True;
        RKeyRzBtnEdit11.Enabled:=True;
        RKeyRzBtnEdit16.Enabled:=True;
      end else
      begin
        messagedlg('产品型号不正确,请重新输入或选择',mtinformation,[mbok],0);
        RKeyRzBtnEdit3.SetFocus;
        exit;
      end;
    finally
      Lcds.Free;
    end;
  end else
  begin

  end;
end;

procedure TfrmNewSales2.RKeyRzBtnEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
    RKeyRzBtnEdit3Exit(nil);
end;

procedure TfrmNewSales2.RKeyRzBtnEdit8ButtonClick(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  inherited;
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(72,StrToInt(RKeyRzBtnEdit8.DisplayPickID));
    if LFrm.ShowModal = mrOk then
    begin
      cds60.Edit;
      cds60.FieldByName('CURRENCY_PTR').Value:=LFrm.cdsPick.FieldByName('rkey').AsString;//data0001Rkey
      cds60.FieldByName('EXCH_RATE').Value:=LFrm.cdsPick.FieldByName('EXCH_RATE').Value;//汇率
      cds60.Post;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmNewSales2.save_so;
begin
end;

procedure TfrmNewSales2.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var column,row:longint;//右键选择stringgrid控件的方法
begin
  if (button=mbright) then
  begin
    if trim(Edit2.Text)='' then
    begin
      messagedlg('请输入正确的客户!',mtwarning,[mbok],0);
      Edit2.SetFocus;
      exit;
    end;
    if trim(RKeyRzBtnEdit3.Text)='' then
    begin
      messagedlg('请输入正确的板号!',mtwarning,[mbok],0);
      RKeyRzBtnEdit3.SetFocus;
      exit;
    end;
    if trim(Edit1.text)=''  then
    begin
      messagedlg('请输入正确的采购定单号!',mtwarning,[mbok],0);
      Edit1.SetFocus;
      exit;
    end;
    if trim(RKeyRzBtnEdit10.Text)='' then
    begin
      messagedlg('请输入正确的装运地点!',mtwarning,[mbok],0);
      RKeyRzBtnEdit10.SetFocus;
      exit;
    end;
    stringgrid1.MouseToCell(x,y,column,row);
    if row<>0 then stringgrid1.Row:=row;
  end;
end;

procedure TfrmNewSales2.TryEnabled(LBool: Boolean);
begin
  Edit2.Enabled:=LBool;
  RKeyRzBtnEdit2.Enabled:=LBool;
  RKeyRzBtnEdit3.Enabled:=LBool;
  Edit1.Enabled:=LBool;
  RKeyRzBtnEdit5.Enabled:=LBool;
  RKeyRzBtnEdit6.Enabled:=LBool;
  RKeyRzBtnEdit9.Enabled:=LBool;
  RKeyRzBtnEdit8.Enabled:=LBool;
  RKeyRzBtnEdit10.Enabled:=LBool;
  RKeyRzBtnEdit11.Enabled:=LBool;
  RKeyRzBtnEdit12.Enabled:=LBool;
  RKeyRzBtnEdit13.Enabled:=LBool;
  RKeyRzBtnEdit14.Enabled:=LBool;
  ComboBox2.Enabled:=LBool;
  ComboBox3.Enabled:=LBool;
  RadioGroup1.Enabled:=LBool;
  CheckBox1.Enabled:=LBool;
  RKeyRzBtnEdit15.Enabled:=LBool;
  RKeyRzBtnEdit16.Enabled:=LBool;
  BitBtn3.Enabled:=LBool;
end;

end.
