unit PasEdit_so;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseEditFrm,ucommfunc,uBaseSinglePickListFrm,
  Vcl.DBGrids, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls,System.StrUtils,
  Vcl.Mask, Vcl.ComCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, RzEdit, RzBtnEdt,
  uRKeyBtnEdit, Data.DB, Datasnap.DBClient, PasHistoryPrice, PasFind213,
  PasPreInquire, PasShowStock;

type
  LgetRefreshClick=procedure (cds:TClientDataSet) of object;
  TfrmEdit_so = class(TfrmBaseEdit)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
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
    Label80: TLabel;
    Label3: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label91: TLabel;
    Label13: TLabel;
    Label75: TLabel;
    Label93: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label105: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBComboBox2: TDBComboBox;
    DBCheckBox1: TDBCheckBox;
    TabSheet2: TTabSheet;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    TabSheet3: TTabSheet;
    Label4: TLabel;
    Label79: TLabel;
    SpeedButton1: TSpeedButton;
    Label84: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    TabSheet4: TTabSheet;
    Bevel1: TBevel;
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
    Label69: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label9: TLabel;
    Label_qteptr: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label40: TLabel;
    Label47: TLabel;
    Label68: TLabel;
    Label74: TLabel;
    Label94: TLabel;
    Label49: TLabel;
    GroupBox3: TGroupBox;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    BitBtn5: TBitBtn;
    Edit10: TEdit;
    MaskEdit4: TMaskEdit;
    BitBtn13: TBitBtn;
    ComboBox3: TComboBox;
    TabSheet5: TTabSheet;
    ComboBox2: TComboBox;
    TabSheet6: TTabSheet;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    StringGrid2: TStringGrid;
    DBGrid6: TDBGrid;
    TabSheet7: TTabSheet;
    Label88: TLabel;
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
    Memo4: TMemo;
    TabSheet8: TTabSheet;
    Label5: TLabel;
    Label10: TLabel;
    DBGridEh1: TDBGridEh;
    RKeyRzBtnEdit1: TRKeyRzBtnEdit;
    RKeyRzBtnEdit2: TRKeyRzBtnEdit;
    RKeyRzBtnEdit4: TRKeyRzBtnEdit;
    Edit1: TEdit;
    BitBtn3: TBitBtn;
    RKeyRzBtnEdit5: TRKeyRzBtnEdit;
    RKeyRzBtnEdit6: TRKeyRzBtnEdit;
    ComboBox1: TComboBox;
    RKeyRzBtnEdit7: TRKeyRzBtnEdit;
    RKeyRzBtnEdit8: TRKeyRzBtnEdit;
    RKeyRzBtnEdit9: TRKeyRzBtnEdit;
    RKeyRzBtnEdit10: TRKeyRzBtnEdit;
    RKeyRzBtnEdit11: TRKeyRzBtnEdit;
    RKeyRzBtnEdit12: TRKeyRzBtnEdit;
    RKeyRzBtnEdit13: TRKeyRzBtnEdit;
    RKeyRzBtnEdit14: TRKeyRzBtnEdit;
    RKeyRzBtnEdit15: TRKeyRzBtnEdit;
    RKeyRzBtnEdit16: TRKeyRzBtnEdit;
    RKeyRzBtnEdit19: TRKeyRzBtnEdit;
    RKeyRzBtnEdit20: TRKeyRzBtnEdit;
    RKeyRzBtnEdit21: TRKeyRzBtnEdit;
    RKeyRzBtnEdit22: TRKeyRzBtnEdit;
    RKeyRzBtnEdit23: TRKeyRzBtnEdit;
    RKeyRzBtnEdit24: TRKeyRzBtnEdit;
    RKeyRzBtnEdit25: TRKeyRzBtnEdit;
    RKeyRzBtnEdit26: TRKeyRzBtnEdit;
    RKeyRzBtnEdit27: TRKeyRzBtnEdit;
    RKeyRzBtnEdit28: TRKeyRzBtnEdit;
    Label6: TLabel;
    RKeyRzBtnEdit29: TRKeyRzBtnEdit;
    RKeyRzBtnEdit30: TRKeyRzBtnEdit;
    RKeyRzBtnEdit31: TRKeyRzBtnEdit;
    RKeyRzBtnEdit32: TRKeyRzBtnEdit;
    RKeyRzBtnEdit33: TRKeyRzBtnEdit;
    RKeyRzBtnEdit34: TRKeyRzBtnEdit;
    RKeyRzBtnEdit35: TRKeyRzBtnEdit;
    RKeyRzBtnEdit36: TRKeyRzBtnEdit;
    RKeyRzBtnEdit37: TRKeyRzBtnEdit;
    RKeyRzBtnEdit38: TRKeyRzBtnEdit;
    RKeyRzBtnEdit39: TRKeyRzBtnEdit;
    RKeyRzBtnEdit40: TRKeyRzBtnEdit;
    cds60: TClientDataSet;
    ds60: TDataSource;
    ds89: TDataSource;
    cds89: TClientDataSet;
    cds192: TClientDataSet;
    cds62: TClientDataSet;
    ds360: TDataSource;
    cds360: TClientDataSet;
    cds61: TClientDataSet;
    StringGrid1: TStringGrid;
    DBMemo1: TDBMemo;
    RKeyRzBtnEdit41: TRKeyRzBtnEdit;
    RKeyRzBtnEdit42: TRKeyRzBtnEdit;
    DBMemo2: TDBMemo;
    Label7: TLabel;
    BitBtn12: TBitBtn;
    DBRadioGroup3: TDBRadioGroup;
    cds97: TClientDataSet;
    cds25: TClientDataSet;
    cds213: TClientDataSet;
    cds318: TClientDataSet;
    cds97_ole: TClientDataSet;
    cds62_Save: TClientDataSet;
    cds213_New: TClientDataSet;
    cds60_ole: TClientDataSet;
    cds360_Save: TClientDataSet;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure RKeyRzBtnEdit29ButtonClick(Sender: TObject);
    procedure RKeyRzBtnEdit32ButtonClick(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ComboBox2Change(Sender: TObject);
    procedure StringGrid1Exit(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure RKeyRzBtnEdit35Exit(Sender: TObject);
    procedure RKeyRzBtnEdit34Exit(Sender: TObject);
    procedure RKeyRzBtnEdit34KeyPress(Sender: TObject; var Key: Char);
    procedure RKeyRzBtnEdit37KeyPress(Sender: TObject; var Key: Char);
    procedure RKeyRzBtnEdit36Exit(Sender: TObject);
    procedure RKeyRzBtnEdit38Exit(Sender: TObject);
    procedure TabSheet5Exit(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure RKeyRzBtnEdit4ButtonClick(Sender: TObject);
    procedure RKeyRzBtnEdit19ButtonClick(Sender: TObject);
    procedure RKeyRzBtnEdit14ButtonClick(Sender: TObject);
    procedure DBRadioGroup1Click(Sender: TObject);
    procedure RKeyRzBtnEdit3Exit(Sender: TObject);
    procedure RKeyRzBtnEdit7ButtonClick(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  //，信用等级，    未付款最多超期, 装运交货提前天数,量板或样板 ,产品周期,交货单元数,允许连续下单
    CREDIT_RATING,INVOICE_NOTE_PAD_PTR,SHIP_LEAD_TIME,v_part_num,shelf_life,set_qty,QUOTE_FACTOR1:Integer;
  //信用限额,交货单只面积m2，交货set长，交货set宽
    CREDIT_LIMIT,unit_sq,set_length,set_width: double;
  //时间长，时间短
    dLongDate,dShortDate:TDateTime;
    //产品是否与报价单关联, 客户报价关联标志
    quote_flag,customer_quote:boolean;
    //BOMRkey,不含税价格(BOM报价),版本号
    FBp06_ptr,FBomBuHanShuiJiaGe,AllVersion:string;
    str_list:TStringList;
     //记录修改前的总金额
     OrigSum: Currency;
     //记录修改前的输入日期
     OrigEntDate: string;
     rkey97New,rkey97ole,old_ponumber:string;//97rkey新旧标识,旧PO号
    //判断97是否需要新增,213数量
    iNew97YN,old213Num:Integer;
    //判断213是否修改
    rkey213_old,rkey213_new:string;

    function cacl_deficiency(Arkey10: string; nowAmount: currency): currency;
    procedure note_information(v_type: integer);
    function Getso_oldnew(Arkey25: string): byte;
  public
    refresh:LgetRefreshClick;
    { Public declarations }
    procedure init; //SG标题列表
    procedure GetData(ARkey60,ARkey25:string);
  end;

var
  frmEdit_so: TfrmEdit_so;

implementation

{$R *.dfm}

{ TfrmEdit_so }
function TfrmEdit_so.Getso_oldnew(Arkey25: string): byte;
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

procedure TfrmEdit_so.note_information(v_type:integer);
var Lsql318:string;
    Lcds:TClientDataSet;
begin
  lcds:=TClientDataSet.Create(Application);
  try
    Lsql318:='select user_login_name as USER_ID,USER_FULL_NAME,TRANS_DATE,TRANS_DESCRIPTION, '
           +' FROM_STRING,TO_STRING,file_number '
           +' from data0318 inner join data0073 on'
           +' data0318.user_ptr=data0073.rkey '
           +' where sales_ORDER_PTR='+inttostr(v_type);
    if not gSvrIntf.IntfGetDataBySql(Lsql318,lcds) then Exit;
    while not Lcds.Eof do
    begin
      Memo4.Lines.Add(Lcds.fieldbyname('trans_date').AsString+
      ' 系统用户:'+Lcds.fieldbyname('user_id').AsString+' '+
      Lcds.fieldbyname('user_full_name').AsString+
      Lcds.fieldbyname('TRANS_DESCRIPTION').AsString);
      Memo4.Lines.Add(' 原值: '+Lcds.fieldbyname('from_string').AsString+
      ' 变更后: '+Lcds.fieldbyname('to_string').AsString+
      '   关联文件号:'+Lcds.fieldbyname('file_number').AsString);
      Lcds.Next;
    end;
  finally
    lcds.Free;
  end;
end;

function TfrmEdit_so.cacl_deficiency(Arkey10: string;nowAmount: currency): currency;
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
      +'from data0060 t60 inner join data0064 t64 on t64.SO_PTR = t60.RKEY inner join data0439 t439 on t64.packing_list_ptr = t439.RKEY '
      +'WHERE t439.invoice_ptr is null and t60.STATUS in (1,2,4) and t60.CUSTOMER_PTR = '+Arkey10;
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

procedure TfrmEdit_so.init;
var i,j:Integer;
    Lcds,Lcds2:TClientDataSet;
    Lsql,Lsql2:string;
begin
  Lcds:=TClientDataSet.Create(Application);
  Lcds2:=TClientDataSet.Create(Application);
  try
    for j :=StringGrid1.RowCount-2  downto 1  do
    begin
      for i:=0 to StringGrid1.ColCount do
      begin
        StringGrid1.Cells[i,j]:='';
      end;
      StringGrid1.rowcount := StringGrid1.rowcount - 1;
    end;
    stringgrid1.RowCount:=2;
    dLongDate:=gFunc.GetSvrDateTime;
    dShortDate:=StrToDate(FormatDateTime('yyyy-MM-dd',dLongDate));
  //生产工具费用
    stringgrid1.Cells[0,0]:='工具费用类别';
    stringgrid1.Cells[1,0]:='金额';
    stringgrid1.Cells[2,0]:='挂帐金额';
    stringgrid1.Cells[3,0]:='免收金额';
    stringgrid1.Cells[4,0]:='征税';
    stringgrid1.ColWidths[5]:=-1;
    if not cds61.IsEmpty then
    begin
      cds61.First;
      i:=1;
      while not cds61.Eof do
      begin
        stringgrid1.Cells[0,i]:=cds61.fieldbyname('category').AsString;
        StringGrid1.Cells[1,i]:='0.0000';
        StringGrid1.Cells[2,i]:='0.0000';
        StringGrid1.Cells[3,i]:='0.0000';
        StringGrid1.Cells[4,i]:=cds61.fieldbyname('TAX_FLAG').AsString;
        stringgrid1.Cells[5,i]:=cds61.fieldbyname('rkey').AsString;
        i:=i+1;
        StringGrid1.RowCount:=StringGrid1.RowCount+1;
        cds61.next;
      end;
    end;
    while not cds62.Eof  do //工具费用显示
    begin
      for i:=1 to StringGrid1.RowCount-2 do
      if strtoint(StringGrid1.Cells[5,i])=cds62.fieldbyname('addl_cat_ptr').AsInteger then
      begin
        stringgrid1.Cells[1,i]:=formatfloat('0.000',cds62.FieldValues['amount']);
        stringgrid1.Cells[2,i]:=formatfloat('0.000',cds62.FieldValues['free_amount']);
        stringgrid1.Cells[3,i]:=formatfloat('0.000',cds62.FieldValues['costfree_amount']);
        stringgrid1.Cells[4,i]:=cds62.FieldByName('TAX_FLAG').Value;
        break;
      end;
      cds62.Next;
    end;
    maskedit1.Text := cds60.fieldbyname('ORIG_REQUEST_DATE').AsString;    //市场部交货期
    maskedit2.Text := cds60.fieldbyname('ORIG_SCHED_SHIP_DATE').AsString; //市场部装运期
    maskedit4.Text := cds60.fieldbyname('DUE_DATE').AsString;    //原始客户交期
    Edit1.Text:=cds60.FieldByName('PO_NUMBER').AsString;
    Edit2.Text:=cds60.FieldByName('MANU_PART_NUMBER').AsString;
    Edit3.Text:=cds60.FieldByName('MANU_PART_DESC').AsString;
    Edit4.Text:=cds60.FieldByName('ANALYSIS_CODE_2_25').AsString;
    RKeyRzBtnEdit21.Text:=formatdatetime('yyyy-mm-dd HH:mm:ss',cds60.FieldByName('ENT_DATE').AsDateTime);
    Label60.Caption:=cds60.FieldByName('INTERNAL_ECN_COUNT').AsString;
    Label61.Caption:=cds60.FieldByName('EXTERNAL_ECN_COUNT').AsString;
    ComboBox1.Items.Clear;
    for i:=1 to 6 do           //客户联络人
    if trim(cds60.FieldByName('contact_name_'+inttostr(i)).asstring)<>'' then
    combobox1.Items.Add(trim(cds60.FieldByName('contact_name_'+inttostr(i)).asstring));
    combobox1.ItemIndex:=0;
    if cds60.fieldbyname('credit_rating').AsInteger = 3 then
      Label98.Caption:= '差'
    else
    if cds60.fieldbyname('credit_rating').AsInteger = 1 then
      Label98.Caption:= '优'
    else
      Label98.Caption:= '良';
    memo1.Text:=cds60.fieldbyname('Remark25').AsString;  //加工指示
    MEMO2.Text:=cds60.fieldbyname('eng_note25').AsString;  //工程备注
    label90.Caption:=formatfloat('0.0000',cds60.FieldByName('PARTS_ORDERED').Value*cds60.fieldbyname('unit_sq').AsFloat);  //面积
    note_information(cds60.FieldByName('rkey').AsInteger);  //显示日志

    set_length:=cds60.FieldByName('set_lngth').Value;//交货set长
    set_width :=cds60.FieldByName('set_width').Value;// 交货set宽
    v_part_num := cds60.FieldByName('ttype').Value;//量板，样板
    if (v_part_num=0) then RKeyRzBtnEdit7.Enabled:=False else RKeyRzBtnEdit7.Enabled:=True;
    if cds60.FieldByName('SHELF_LIFE').AsString='' then
      shelf_life:=cds60.FieldByName('LEAD_TIME').Value //产品周期
    else
      shelf_life:=cds60.FieldByName('SHELF_LIFE').Value; //产品周期
    if (Trim(cds60.FieldByName('set_qty').AsString)='') then
      set_qty:=0
    else
      set_qty:=cds60.FieldByName('set_qty').Value;//交货单元数
    label83.Caption := IntToStr(set_qty);

    unit_sq:=cds60.FieldByName('unit_sq').AsFloat;//交货单只面积m2
    if (cds60.FieldByName('ttype').AsInteger=0) then //产品是否报价单关联
    quote_flag:=cds60.FieldByName('batch_flag').AsBoolean
    else
    quote_flag:=cds60.FieldByName('former_flag').AsBoolean;
    combobox3.ItemIndex:=Getso_oldnew(cds60.FieldByName('rkey').AsString); //订单新旧
    rkey97New:=cds60.FieldByName('PURCHASE_ORDER_PTR').AsString; //97rkey
    rkey97ole:=cds60.FieldByName('PURCHASE_ORDER_PTR').AsString;
    old_ponumber:=cds60.FieldByName('PO_NUMBER').AsString;//97PO号

    if (quote_flag) and
      (dbradiogroup2.ItemIndex=0) and
      (dbradiogroup1.ItemIndex=0) and
      (cds60.FieldByName('quote_flag').AsBoolean) then
    begin                              //订单已经强制关联
      RKeyRzBtnEdit37.ReadOnly:=true;
      RKeyRzBtnEdit36.ReadOnly:=true;
    end;

    if (Trim(cds192.FieldByName('custcitool').AsString)='Y') then//可以输入set数
    begin
      Label26.Visible:=true;
      label81.Visible:=true;
      RKeyRzBtnEdit34.Visible:=true;
      RKeyRzBtnEdit36.Visible:=true;
      label27.Left:=230;
      RKeyRzBtnEdit35.Left:=308;
    end;
    if (Trim(cds192.FieldByName('custciship').AsString)='Y') then  RKeyRzBtnEdit7.Enabled:=false;//订单不允许修改币别
    label93.Visible:=cds60.FieldByName('COD_FLAG').Value='Y'; //可出货数量可见
    RKeyRzBtnEdit12.Visible:=cds60.FieldByName('COD_FLAG').Value='Y'; //可出货数量可见
    bitbtn12.Visible:=cds60.FieldByName('COD_FLAG').Value='Y'; //可出货数量查询

    if RKeyRzBtnEdit12.Visible then
    begin
      Lsql:=
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
      'and Data0060.CUST_PART_PTR='+cds60.FieldByName('CUST_PART_PTR').AsString+#13+
      'and Data0060.PURCHASE_ORDER_PTR='+cds60.FieldByName('PURCHASE_ORDER_PTR').AsString+#13+
      'GROUP BY dbo.Data0097.PO_NUMBER, dbo.Data0025.MANU_PART_NUMBER, derivedtbl_1.qty';
      if not gSvrIntf.IntfGetDataBySql(Lsql,lcds) then Exit;
      RKeyRzBtnEdit12.Text:=lcds.fieldbyname('all_qty').AsString;
    end;

    Lsql:='select * from data0283';
    Lsql2:='SELECT dbo.Data0060.SALES_ORDER,sum(ISNull(dbo.Data0060.PARTS_ORDERED,0)) as SumPARTS_ORDERED'
          +' FROM dbo.Data0060 INNER JOIN'
          +'        dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY INNER JOIN'
          +'  dbo.Data0001 ON dbo.Data0060.CURRENCY_PTR = dbo.Data0001.RKEY'
          +' where data0060.purchase_order_ptr ='+cds60.FieldByName('PURCHASE_ORDER_PTR').AsString
          +' and data0060.cust_part_ptr ='+cds60.FieldByName('CUST_PART_PTR').AsString+' '
          +' group by SALES_ORDER';
    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsql,Lsql2]),[Lcds,Lcds2]) then Exit;
    ComboBox3.Items.Clear;
    if not lcds.IsEmpty then
    begin
      while not lcds.Eof do
      begin
        ComboBox3.Items.AddObject(lcds.fieldBYName('PRIORITY_name').AsString,Pointer(lcds.fieldBYName('PRIORITY_CODE').AsInteger));
        lcds.Next;
      end;
    end;
    ComboBox3.ItemIndex:=cds60.FieldByName('P_CODE').AsInteger;
    label77.Caption := formatfloat('0',Lcds2.FieldByName('SumPARTS_ORDERED').Value);
    label45.Caption := formatfloat('0.0000',cds60.FieldByName('TOTAL_ADD_L_PRICE').Value); //工具费用

    if (dbradiogroup3.ItemIndex=0) then
      label48.caption:=formatfloat('0.0000',cds60.FieldByName('PARTS_ORDERED').Value*cds60.FieldByName('PART_PRICE').Value)  //价格合计
    else
      label48.caption:=formatfloat('0.0000',cds60.FieldByName('PARTS_ORDERED').Value*cds60.FieldByName('PART_PRICE').Value/
                                           (1+cds60.FieldByName('RUSH_CHARGE').Value*0.01));
           //税金
    label47.Caption:=formatfloat('0.000',strtofloat(label48.Caption)*cds60.FieldByName('RUSH_CHARGE').Value*0.01);

                  //折扣
    label46.caption := formatfloat('0.000',strtofloat(label48.caption)*cds60.FieldByName('DISCOUNT').Value*0.01);
    OrigEntDate:=RKeyRzBtnEdit21.Text; //记录输入时间
    rkey213_old:=cds60.FieldByName('rkey213').AsString;//rkey213
    rkey213_new:=rkey213_old;
    old213Num:=cds60.FieldByName('PARTS_ORDERED').Value;//订单数量
    credit_limit:=cds60.fieldbyname('credit_limit').AsFloat;

    TabSheet5Exit(nil);
    Label99.Caption:=formatfloat('0.0000',cds60.fieldbyname('credit_limit').AsFloat);
    Label100.Caption:=formatfloat('0.0000',cacl_deficiency(cds60.fieldbyname('customer_ptr').AsString,
                                           (-1)*StrToCurr(Label44.Caption)/StrtoCurr(RKeyRzBtnEdit8.Text)));
    OrigSum:= StrtoCurr(Label44.Caption)*StrtoCurr(RKeyRzBtnEdit8.Text);//记录修改前的总金额
    pagecontrol1.ActivePageIndex:=0;
    iNew97YN:=0;
  finally
    Lcds.Free;
    Lcds2.Free;
  end;
end;

procedure TfrmEdit_so.RKeyRzBtnEdit14ButtonClick(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  inherited;
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(72,StrToInt(RKeyRzBtnEdit14.DisplayPickID));
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

procedure TfrmEdit_so.RKeyRzBtnEdit19ButtonClick(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  inherited;
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(72,StrToInt(RKeyRzBtnEdit19.DisplayPickID),' where D10_Ptr='+cds60.FieldByName('CUSTOMER_PTR').AsString+'');
    if LFrm.ShowModal = mrOk then
    begin
      cds60.Edit;
      cds60.FieldByName('Print2DKey').Value:=LFrm.cdsPick.FieldByName('rkey').AsString;//二维码打印格式
      cds60.Post;
      RKeyRzBtnEdit19.Text:=LFrm.cdsPick.FieldByName('BarName').Value;//二维码打印格式名称
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEdit_so.RKeyRzBtnEdit29ButtonClick(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(72,StrToInt(RKeyRzBtnEdit29.DisplayPickID),' and customer_ptr='+cds60.FieldByName('CUSTOMER_PTR').AsString+'  order by location');
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

procedure TfrmEdit_so.RKeyRzBtnEdit32ButtonClick(Sender: TObject);
var LFrm2: TfrmSinglePickList;
begin
  inherited;
  LFrm2 := TfrmSinglePickList.Create(Self);
  try
    LFrm2.InitWithPickID(72,StrToInt(RKeyRzBtnEdit32.DisplayPickID));
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

procedure TfrmEdit_so.RKeyRzBtnEdit34Exit(Sender: TObject);
begin
  if maskedit1.Enabled= true then
  begin
    if trim(RKeyRzBtnEdit34.Text)='' then RKeyRzBtnEdit34.Text := '0';
    RKeyRzBtnEdit35.Text:=cds60.FieldByName('SET_ORDERED').Value*set_qty;
    RKeyRzBtnEdit35exit(sender);
  end;
end;

procedure TfrmEdit_so.RKeyRzBtnEdit34KeyPress(Sender: TObject; var Key: Char);
begin
  if key = chr(46) then abort;
  if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
   abort;
end;

procedure TfrmEdit_so.RKeyRzBtnEdit35Exit(Sender: TObject);
begin
  if maskedit1.Enabled= true then
  begin
    if Trim(RKeyRzBtnEdit35.text)='' then RKeyRzBtnEdit35.Text:='0';
    if Trim(RKeyRzBtnEdit34.Text)='' then RKeyRzBtnEdit34.Text:='0';

    if (cds60.FieldByName('PARTS_ORDERED').Value mod cds60.FieldByName('set_qty').Value)<>0 then
      RKeyRzBtnEdit34.Text:=IntToStr(round(cds60.FieldByName('PARTS_ORDERED').Value/cds60.FieldByName('set_qty').Value))
    else
      RKeyRzBtnEdit34.Text := IntToStr(cds60.FieldByName('PARTS_ORDERED').Value / cds60.FieldByName('set_qty').Value);

    RKeyRzBtnEdit37.Text := formatfloat('0.00000000',cds60.FieldByName('PART_PRICE').Value);
    RKeyRzBtnEdit36.Text := formatfloat('0.00000000',cds60.FieldByName('PART_PRICE').Value * cds60.FieldByName('set_qty').Value);

    if dbradiogroup3.ItemIndex=0 then
      label48.caption:=formatfloat('0.0000',cds60.FieldByName('PARTS_ORDERED').Value*cds60.FieldByName('PART_PRICE').Value)  //价格合计
    else
      label48.caption:=formatfloat('0.0000',cds60.FieldByName('PARTS_ORDERED').Value*cds60.FieldByName('PART_PRICE').Value/
                                         (1+cds60.FieldByName('RUSH_CHARGE').Value*0.01));
           //税金
    label47.Caption:=formatfloat('0.000',strtofloat(label48.Caption)*
                                       cds60.FieldByName('RUSH_CHARGE').Value*0.01);
                  //折扣
    label46.caption := formatfloat('0.000',strtofloat(label48.caption)*cds60.FieldByName('DISCOUNT').Value*0.01);

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

     label90.Caption:=formatfloat('0.0000',cds60.FieldByName('PARTS_ORDERED').Value*cds60.FieldByName('unit_sq').Value);  //面积
  end;
end;

procedure TfrmEdit_so.RKeyRzBtnEdit36Exit(Sender: TObject);
begin
  if maskedit1.Enabled= true then
  begin
    if trim(RKeyRzBtnEdit36.Text)='' then RKeyRzBtnEdit36.Text := '0';
    RKeyRzBtnEdit37.Text := formatfloat('0.00000000',cds60.FieldByName('SET_PRICE').Value / set_qty);
    RKeyRzBtnEdit35exit(sender);
  end;
end;

procedure TfrmEdit_so.RKeyRzBtnEdit37KeyPress(Sender: TObject; var Key: Char);
begin
  if key = chr(46) then      //判断是否重复输入小数点'.'
  if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
   abort;
  if pos('.',RKeyRzBtnEdit37.Text)>0  then abort;
end;

procedure TfrmEdit_so.RKeyRzBtnEdit38Exit(Sender: TObject);
begin
  if RKeyRzBtnEdit38.Text='' then RKeyRzBtnEdit38.Text:='0';
  label46.caption:=formatfloat('0.000',(strtofloat(label48.caption)*cds60.FieldByName('DISCOUNT').Value)*0.01);
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

procedure TfrmEdit_so.RKeyRzBtnEdit3Exit(Sender: TObject);
var Lcds:TClientDataSet;
    sSQL25,Lsql89:string;
begin
  if (activecontrol.Name<>'BitBtn5')and (trim(Edit2.Text)<>'')then
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
      sSQL25:=sSQL25+' and MANU_PART_NUMBER LIKE ''%'+Trim(Edit2.Text)+'%'' and CUSTOMER_PTR='+cds60.FieldByName('CUSTOMER_PTR').AsString+'  order by MANU_PART_NUMBER';
      gSvrIntf.IntfGetDataBySql(sSQL25,Lcds);
      if not Lcds.IsEmpty then
      begin
        if (comparetext(trim(Edit2.text),trim(Lcds.Fieldbyname('manu_part_number').AsString))=0) then
        begin
          cds60.Edit;
          cds60.FieldByName('CUST_PART_PTR').Value:=Lcds.Fieldbyname('rkey').Value; //25rkey
          dbcombobox2.ItemIndex:=self.getSO_OLDNEW(Lcds.Fieldbyname('rkey').Value);
          Lsql89:='select data0089.*,Data0278.RKEY,Data0278.PARAMETER_NAME,'
          +' Data0278.PARAMETER_DESC,Data0002.UNIT_NAME,Data0278.SPEC_RKEY'
          +' from data0089 inner join Data0278 on data0089.parameter_ptr=Data0278.rkey'
          +' INNER JOIN Data0002 ON Data0278.UNIT_PTR = Data0002.RKEY where data0089.cust_part_ptr='+ Lcds.Fieldbyname('rkey').AsString;
          gSvrIntf.IntfGetDataBySql(Lsql89,cds89);
          cds60.FieldByName('qty_on_hand').Value:=Lcds.Fieldbyname('qty_on_hand').Value;
          cds60.FieldByName('qty_alloc').Value:=Lcds.FieldByName('qty_alloc').Value;
          cds60.FieldByName('CanSL').Value:=Lcds.Fieldbyname('qty_on_hand').Value-Lcds.FieldByName('qty_alloc').Value;
          memo1.Text:=Lcds.Fieldbyname('remark').AsString;
          memo2.Text:=Lcds.Fieldbyname('eng_note').AsString;
          set_qty := Lcds.Fieldbyname('set_qty').Value;
          label83.Caption := inttostr(set_qty);
          v_part_num:=Lcds.fieldvalues['ttype'];  //样板还是生产板
          if (v_part_num=0) then RKeyRzBtnEdit7.Enabled:=false;//生产板订单不允许修改币别
        end;
      end else
      begin
        messagedlg('产品型号不正确,请重新输入或选择',mtinformation,[mbok],0);
        Edit2.SetFocus;
        exit;
      end;
    finally
      Lcds.Free;
    end;
  end;
end;

procedure TfrmEdit_so.RKeyRzBtnEdit4ButtonClick(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(72,StrToInt(RKeyRzBtnEdit4.DisplayPickID));
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

procedure TfrmEdit_so.RKeyRzBtnEdit7ButtonClick(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  inherited;
  LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(72,StrToInt(RKeyRzBtnEdit7.DisplayPickID));
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

procedure TfrmEdit_so.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TfrmEdit_so.StringGrid1Exit(Sender: TObject);
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

procedure TfrmEdit_so.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
    abort
  else
  if (pos('.',stringgrid1.Cells[stringgrid1.col,stringgrid1.row])>0)  then     //判断是否重复输入小数点'.'
  if key = chr(46)  then abort;
end;

procedure TfrmEdit_so.StringGrid1SelectCell(Sender: TObject; ACol,
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
    stringgrid1.Cells[1,stringgrid1.Row]:=
    formatfloat('0.0000',strtofloat(stringgrid1.Cells[1,stringgrid1.Row]));
    stringgrid1.Cells[2,stringgrid1.Row]:=
    formatfloat('0.0000',strtofloat(stringgrid1.Cells[2,stringgrid1.Row]));
  end;
end;

procedure TfrmEdit_so.TabSheet5Exit(Sender: TObject);
var tool,tax_amount:single;
    i:byte;
begin
  tool := 0;
  tax_amount := 0;
  for i:=1 to stringgrid1.RowCount-2 do
  begin
    if (strtocurr(Trim(stringgrid1.Cells[1,i]))>0) then
    begin
      tool:=tool+strtocurr(stringgrid1.Cells[1,i]);
      if dbRadioGroup3.ItemIndex=0 then //价格不含税
       if stringgrid1.Cells[4,i]='Y' then
        tax_amount:=tax_amount+strtocurr(floattostrf(
                               strtocurr(stringgrid1.Cells[1,i])*
                               cds60.FieldByName('RUSH_CHARGE').Value*0.01,ffFixed,10,4))
       else
      else   //本身含税
       if stringgrid1.Cells[4,i]='Y' then
        tax_amount:=tax_amount+strtocurr(floattostrf(
                strtocurr(stringgrid1.Cells[1,i])*cds60.FieldByName('RUSH_CHARGE').Value*0.01/
                           (1+cds60.FieldByName('RUSH_CHARGE').Value*0.01),ffFixed,10,4));
    end;
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

procedure TfrmEdit_so.BitBtn12Click(Sender: TObject);
var LFrm:TfrmPreInquire;
    Lcds,lcds2:TClientDataSet;
    Lsql,Lsql2:string;
begin
  lcds:=TClientDataSet.Create(Application);
  lcds2:=TClientDataSet.Create(Application);
  try
    LFrm:= TfrmPreInquire.Create(nil);
    Lsql:=
    'SELECT dbo.Data0005.EMPLOYEE_NAME, dbo.Data0114.ENTER_DATE,'+#13+
    'dbo.Data0114.AMOUNT * dbo.Data0114.EXCHANGE_RATE AS amount, dbo.Data0114.all_shipqty'+#13+
    'FROM         dbo.Data0114 INNER JOIN'+#13+
    'dbo.Data0005 ON dbo.Data0114.EMPL_PTR = dbo.Data0005.RKEY'+#13+
    'WHERE     (dbo.Data0114.all_shipqty >= 0) AND (dbo.Data0114.TTYPE = 2)'+#13+
    'and data0114.PO_NUMBER='+quotedstr(Edit1.Text)+#13+
    'and Data0114.MANU_PART_NUMBER='+quotedstr(Edit2.Text);

    Lsql2:='SELECT dbo.Data0060.SALES_ORDER, dbo.Data0005.EMPLOYEE_NAME,'+#13+
    ' dbo.Data0064.DATE_ASSIGN, dbo.Data0064.QUAN_SHIPPED'+#13+
    ' FROM   dbo.Data0005 INNER JOIN'+#13+
    ' dbo.Data0064 ON dbo.Data0005.RKEY = dbo.Data0064.ENT_EMPL_PTR INNER JOIN'+#13+
    ' dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY'+#13+
    ' WHERE (dbo.Data0064.assign_type = 0)'+#13+
    'and Data0060.CUST_PART_PTR='+cds60.FieldByName('CUST_PART_PTR').AsString+#13+
    'and Data0060.PURCHASE_ORDER_PTR='+cds60.FieldByName('PURCHASE_ORDER_PTR').AsString;
    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsql,Lsql2]),[Lcds,Lcds2]) then Exit;
    if not Lcds.IsEmpty then
    begin
      LFrm.Memo1.Lines.Add('员工  :  输入日期  :  预收金额 :  可出货数量');
      while not Lcds.Eof do
      begin
        LFrm.Memo1.Lines.Add(Lcds.fieldbyname('EMPLOYEE_NAME').AsString+':   '+
                         Lcds.fieldbyname('ENTER_DATE').AsString+':   '+
                         Lcds.fieldbyname('amount').AsString+':   '+
                         Lcds.fieldbyname('all_shipqty').AsString);
        Lcds.Next;
      end;
    end;
    if not Lcds2.IsEmpty then
    begin
      LFrm.Memo1.Lines.Add('销售订单:          员工  :      指派日期  :   出货数量');
      while not lcds2.Eof do
      begin
        LFrm.Memo1.Lines.Add(Lcds2.fieldbyname('SALES_ORDER').AsString+': '+
                         Lcds2.fieldbyname('EMPLOYEE_NAME').AsString+':  '+
                         Lcds2.fieldbyname('DATE_ASSIGN').AsString+':   '+
                         Lcds2.fieldbyname('QUAN_SHIPPED').AsString);
        Lcds2.Next;
      end;
    end;
    LFrm.ShowModal;
    LFrm.Free;
  finally
    lcds.Free;
    lcds2.Free;
  end;
end;

procedure TfrmEdit_so.BitBtn13Click(Sender: TObject);
var LFrm: TfrmFind213;
    strWhere:string;
begin
  strWhere:='';
  LFrm:= TfrmFind213.Create(nil);
  try
    strWhere:=' and MANU_PART_NUMBER='''+Trim(cds60.FieldByName('MANU_PART_NUMBER').AsString)+''' and  PO_NUMBER='''+Trim(cds60.FieldByName('PO_NUMBER').AsString)+'''';
    LFrm.GetData(strWhere);
    if not LFrm.cds213.IsEmpty then
    begin
      if LFrm.ShowModal = mrOk then
      begin
        rkey213_new:=LFrm.cds213.FieldByName('rkey').Value;
//        cds60.Edit;
//        cds60.FieldByName('rkey213').Value:=LFrm.cds213.FieldByName('rkey').Value;
//        cds60.Post;
        RKeyRzBtnEdit35.Text:=LFrm.cds213.FieldByName('PARTS_ORDERED').AsString;//数量
        RKeyRzBtnEdit35.ReadOnly:=True;
        MaskEdit4.Text:=LFrm.cds213.FieldByName('ORIG_REQUEST_DATE').AsString;
        MaskEdit1.Text:=LFrm.cds213.FieldByName('ORIG_SCHED_SHIP_DATE').AsString;
        if DBRadioGroup3.ItemIndex = 0 then  //不含税
        begin
         if StrToFloat(RKeyRzBtnEdit42.Text)>0 then
         RKeyRzBtnEdit37.Text:= formatfloat('0.00000000',LFrm.cds213.FieldByName('PART_PRICE').Value/(1+strtofloat(RKeyRzBtnEdit42.Text)*0.001))
         else
         RKeyRzBtnEdit37.Text:= formatfloat('0.00000000',LFrm.cds213.FieldByName('PART_PRICE').Value);
        end
        else
        begin                                           //含税
         RKeyRzBtnEdit37.Text:= formatfloat('0.00000000',LFrm.cds213.FieldByName('PART_PRICE').Value);
        end;
      end;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmEdit_so.BitBtn5Click(Sender: TObject);
var
  LFrm:TfrmHistoryPrice;
begin
  LFrm:= TfrmHistoryPrice.Create(nil);
  LFrm.iEN:=1;
  LFrm.GetData(cds60.FieldByName('CUST_PART_PTR').AsString);
  LFrm.ShowModal;
  LFrm.Free;
end;

procedure TfrmEdit_so.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmEdit_so.btnSaveClick(Sender: TObject);
var LFrm2:TfrmShowStock;
    LSQLtmp:string;
    lcds,Lcds2:TClientDataSet;
    Lsq213,Lsq213_New,Lsq25,Lsq97,Lsq318,Lsq97_ole,Lsql62_Save,Lsql360_Save:string;
    LPostData: OleVariant;
    i:integer;
    LField:TField;
begin
 if ((cds60.FieldByName('PARTS_ORDERED').Value mod set_qty)<>0) and
    (messagedlg('订单数量pcs不是出货板数set的倍数,是否继续?',mtconfirmation,[mbYes,mbNo],0)=mrno) then
  begin
   pagecontrol1.ActivePageIndex:=3;
   RKeyRzBtnEdit35.SetFocus;
   exit;
  end;
  lcds:=TClientDataSet.Create(Application);
  lcds2:=TClientDataSet.Create(Application);
  try
    if (Trim(RKeyRzBtnEdit4.Text)<>'') then
    begin
      LSQLtmp:='select ABBR_NAME from data0010 where ABBR_NAME like ''%'+Trim(RKeyRzBtnEdit4.Text)+'%'' and CUSTOMER_TYPE<>4';
      if not gSvrIntf.IntfGetDataBySql(LSQLtmp,lcds) then Exit;
      if Lcds.IsEmpty then
      begin
        ShowMessage('找不到该客户简称或是已被设置成无效。');
        pagecontrol1.ActivePageIndex:=0;
        RKeyRzBtnEdit4.SetFocus;
        Exit;
      end;
    end;

    if (Trim(cds192.FieldByName('suplcimat').AsString)<>'Y') and   //样板及备品订单以外的SO单价不可以为零
     (v_part_num<>1) and            //不是样板
     (DBRadioGroup2.ItemIndex<>1) and   //不是备品
     (strtofloat(RKeyRzBtnEdit37.Text)=0) then      //单价为零
    begin
      showmessage('样板及备品订单以外的SO单价不可以为零');
      pagecontrol1.ActivePageIndex:=3;
      RKeyRzBtnEdit37.SetFocus;
      exit;
    end;
    IF (Trim(cds192.FieldByName('CUSTSTAPROD').AsString)='Y') then
    begin
      if (cds60.FieldByName('CREDIT_RATING').Value = 3) then
      begin
        messagedlg('客户:'+RKeyRzBtnEdit2.Text+'信用等级太差,订单无法继续!',mtwarning,[mbok],0);
        exit;
      end
      else
      if (cds60.FieldByName('CREDIT_RATING').Value =1) then //信用等级为优，超过限额出现提示后仍然可以
      begin                               //开出订单
        if cacl_deficiency(cds60.FieldByName('CUSTOMER_PTR').Value,StrToCurr(Label44.Caption)/StrtoCurr(RKeyRzBtnEdit8.Text)-OrigSum)> cds60.fieldbyname('credit_limit').AsCurrency+1 then
        if messagedlg('客户:'+RKeyRzBtnEdit2.Text+'未付款金额大于了信用限额是否继续?',mtconfirmation,[mbyes,mbno],0)=mrno then
         begin
          ModalResult:=mrcancel;
          exit;
         end;
      end
      else //信用等级为良，只能在限额以内开出销售订单
      begin
      if cacl_deficiency(cds60.FieldByName('CUSTOMER_PTR').Value,StrToCurr(Label44.Caption)/StrtoCurr(RKeyRzBtnEdit8.Text)-OrigSum)> cds60.fieldbyname('credit_limit').AsCurrency+1 then
        begin
          messagedlg('客户:'+RKeyRzBtnEdit2.Text+'未付款金额大于了信用限额无法继续!',mtwarning,[mbok],0);
          ModalResult:=mrcancel;
          exit;
        end;
      end;
    end;
    LFrm2:= TfrmShowStock.Create(nil);
    try
      LFrm2.GetData(Trim(Edit2.Text));
      if not LFrm2.cds60_53.IsEmpty then
      begin
        if MessageBox(Handle,'同型号订单在仓库中有库存,需要查看明细吗?', '提示', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
        LFrm2.ShowModal;
      end;
    finally
      LFrm2.Free;
    end;
    dLongDate:=gFunc.GetSvrDateTime();
    if (rkey213_old='') then rkey213_old:='-1';
    if (rkey213_New='') then rkey213_New:='-1';
    Lsq213:='select * from Data0213 where rkey=' + rkey213_old;
    Lsq213_New:='select * from Data0213 where rkey=' +rkey213_New;
    Lsq25:='select * from data0025 where Rkey='+cds60.FieldByName('CUST_PART_PTR').AsString;
    if (iNew97YN=1) then
    begin
      Lsq97:='select * from data0097 where 1=0';
      Lsq97_ole:='select * from data0097 where Rkey='+rkey97ole;
    end else
    begin
      if (rkey97New='') then rkey97New:='-1';
      Lsq97:='select * from data0097 where Rkey='+rkey97New;
      Lsq97_ole:='select * from data0097 where Rkey='+rkey97ole;
    end;
    Lsq318:='select * from data0318 where 1=0';
    Lsql62_Save:='select * from data0062 where 1=0';
    Lsql360_Save:='select * from data0360 where 1=0';

    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([Lsq213,Lsq213_New,Lsq25,Lsq97,Lsq97_ole,Lsql62_Save,Lsql360_Save,Lsq318]),[cds213,cds213_New,cds25,cds97,cds97_ole,cds62_Save,cds360_Save,cds318]) then Exit;

    //新增97
    if (iNew97YN=1) then
    begin
      cds97.Append;
      cds97.FieldByName('po_number').Value:=Trim(Edit1.Text);
      cds97.FieldByName('customer_ptr').Value:=cds60.FieldByName('CUSTOMER_PTR').AsInteger;
      cds97.FieldByName('po_date').Value:=strtodate(RKeyRzBtnEdit16.Text);
      cds97.FieldByName('open_sos').Value:=1;
      cds97.FieldByName('IDkey').Value:=gFunc.CreateIDKey;
      cds97.Post;
      cds318.Append;
      cds318.FieldByName('SALES_ORDER_PTR').value:=cds60.FieldByName('rkey').Value;
      cds318.FieldByName('TRANS_TYPE').value:=1;
      cds318.FieldByName('TRANS_DESCRIPTION').value:='更改客户订单号';
      cds318.FieldByName('FROM_STRING').value:= old_ponumber;
      cds318.FieldByName('TO_STRING').value:=Edit1.Text;
      cds318.FieldByName('USER_PTR').value:=gVar.rkey73;
      cds318.FieldByName('TRANS_DATE').value:=dLongDate;
      cds318.FieldByName('PROGRAM_SOURCE').value:=32;
      cds318.Post;
      cds97_ole.Edit;
      cds97_ole.FieldByName('open_sos').Value:=cds97_ole.FieldByName('open_sos').AsInteger-1;
      if (cds97_ole.FieldByName('idkey').IsNull) then
      cds97_ole.FieldByName('Idkey').Value:=gFunc.CreateIDKey;//
      cds97_ole.Post;
    end else
    if (iNew97YN=0) then
    begin
      if (rkey97New<>rkey97ole) then
      begin
        cds97_ole.Edit;
        cds97_ole.FieldByName('open_sos').Value:=cds97_ole.FieldByName('open_sos').AsInteger-1;
        if (cds97_ole.FieldByName('idkey').IsNull) then
        cds97_ole.FieldByName('Idkey').Value:=gFunc.CreateIDKey;//
        cds97_ole.Post;
        cds97.Edit;
        cds97.FieldByName('open_sos').Value:=cds97.FieldByName('open_sos').AsInteger+1;
        cds97.FieldByName('po_date').Value:=strtodate(RKeyRzBtnEdit16.Text);
        if (cds97.FieldByName('idkey').IsNull) then
        cds97.FieldByName('Idkey').Value:=gFunc.CreateIDKey;//
        cds97.Post;
      end;
    end;
    //新增97
    if (iNew97YN=1) then
    begin
      if (cds97.ChangeCount>0) then
      if gSvrIntf.IntfPostDataByTable('data0097',cds97.delta) then
      begin
        if (cds97.ChangeCount>0) then cds97.MergeChangeLog;
        gSvrIntf.IntfGetDataBySql('select Top 1 * from data0097 order by rkey desc',lcds2);
      end;
    end;

    cds60.Edit;
    cds60.Fieldbyname('P_CODE').Value:=integer(combobox3.items.objects[combobox3.itemindex]);
    cds60.FieldByName('MODF_DATE').AsString:=FormatDateTime('yyyy-MM-dd',dLongDate);
    cds60.FieldByName('MODIFIED_BY_EMPL_PTR').AsString:=gVar.rkey05;
    cds60.fieldbyname('CUSTOMER_CONTACT').AsString := combobox1.Text;    //客户联络人
    cds60.fieldbyname('ORIG_REQUEST_DATE').AsString := maskedit1.Text;   //市场部请求日期;
    cds60.fieldbyname('ORIG_SCHED_SHIP_DATE').AsString := maskedit2.Text;//市场部装运日期;
    cds60.fieldbyname('TOTAL_ADD_L_PRICE').AsString := label45.Caption;  //更新工具费用总计
    cds60.FieldByName('DUE_DATE').AsString:=maskedit4.Text;  //原始客户交期
    cds60.FieldByName('ENT_DATE').Value:=RKeyRzBtnEdit21.Text;//订单输入时间
    if (iNew97YN=1) then
    begin
      cds60.FieldByName('PURCHASE_ORDER_PTR').Value:=lcds2.FieldByName('rkey').Value;
      cds60.FieldByName('D97_IDKey').Value:=lcds2.FieldByName('idkey').Value;
    end;

    if (cds60.FieldByName('PROD_REL').AsInteger=2) then
    begin
      cds60.FieldByName('conf_date').Value := null;
      cds60.FieldByName('prod_rel').AsString := '1';   //使成为未确认
      cds60.FieldByName('conf_by_empl_ptr').Value := null;
    end;
    if (RKeyRzBtnEdit21.Text<>OrigEntDate) then
    begin
      cds318.Append;
      cds318.FieldByName('SALES_ORDER_PTR').value:=cds60.FieldByName('rkey').Value;
      cds318.FieldByName('TRANS_TYPE').value:=13;
      cds318.FieldByName('TRANS_DESCRIPTION').value:='更改销售订单输入日期';
      cds318.FieldByName('FROM_STRING').value:= OrigEntDate;
      cds318.FieldByName('TO_STRING').value:=RKeyRzBtnEdit21.Text;
      cds318.FieldByName('USER_PTR').value:=gVar.rkey73;
      cds318.FieldByName('TRANS_DATE').value:=dLongDate;
      cds318.FieldByName('PROGRAM_SOURCE').value:=32;
      cds318.Post;
    end;
    if (rkey213_old<>'') and (rkey213_old<>rkey213_new) then//编辑时改变了原来从预处理下的正式订单信息
    begin
      cds213.Edit;
      cds213.FieldByName('status').Value:=3;
      cds213.FieldByName('UsedQuantity').Value:=cds213.FieldByName('UsedQuantity').Value-old213Num;
      cds213.Post;
      cds213_New.Edit;
      cds213_New.FieldByName('status').Value:=2;
      cds213_New.FieldByName('UsedQuantity').AsString:=RKeyRzBtnEdit35.Text;
      cds213_New.Post;
      cds60.FieldByName('rkey213').Value:=rkey213_new;
    end;
    cds60.FieldByName('status').Value:= 6; //未提交,编辑保存后需重新提交
    cds60.FieldByName('to_be_planned').Value:=cds60.FieldByName('PARTS_ORDERED').Value-cds60.FieldByName('QTY_PLANNNED').Value;//待计划数=订单数 -已计划数
    if (cds60.FieldByName('to_be_planned').Value<=0) then
    begin
      cds60.FieldByName('PROD_REL').Value:=3;
    end;
    cds60.FieldByName('to_be_confirmed').Value:=cds60.FieldByName('PARTS_ORDERED').Value;

    if (cds60.FieldByName('tax_in_price').AsString='N') then
      cds60.FieldByName('PARTS_ALLOC').Value:=cds60.FieldByName('PART_PRICE').Value
    else
      cds60.FieldByName('PARTS_ALLOC').Value:=cds60.FieldByName('PART_PRICE').Value/(1+cds60.FieldByName('RUSH_CHARGE').Value*0.01);
    cds60.FieldByName('PARTS_ALLOC1').Value:=cds60.FieldByName('PARTS_ALLOC').Value;
    cds60.FieldByName('quote_price').Value:= 0; //表示so未审批(需要审批)
    cds60.FieldByName('SCH_DATE').Value:=null;
    cds60.Post;
    //处理62
      cds62.First;
      while not cds62.Eof do cds62.Delete; //首先将其全部删除
      for i:=1 to StringGrid1.rowcount-2 do
      if (strtofloat(StringGrid1.Cells[1,i])>0) or
         (strtofloat(StringGrid1.Cells[2,i])>0) or
         (strtofloat(StringGrid1.Cells[3,i])>0) then
      begin
        cds62_Save.Append;
        cds62_Save.FieldByName('so_ptr').AsString := cds60.FieldByName('rkey').AsString;
        cds62_Save.FieldByName('amount').AsString := StringGrid1.Cells[1,i];
        cds62_Save.FieldByName('free_amount').AsString := StringGrid1.Cells[2,i];
        cds62_Save.FieldByName('costfree_amount').AsString := StringGrid1.Cells[3,i];
        cds62_Save.FieldByName('TAX_FLAG').Value := StringGrid1.Cells[4,i];
        cds62_Save.FieldByName('addl_cat_ptr').AsString := StringGrid1.Cells[5,i];
        cds62_save.FieldByName('D60_IDKey').AsString:=cds60.FieldByName('idkey').Value;
        cds62_Save.post;
      end;
      //处理25
      if ((cds60.FieldByName('so_style').Value=0) and (cds60.FieldByName('PART_PRICE').AsCurrency<>0)) then
      begin
        cds25.Edit;
        if (cds60.FieldByName('TAX_IN_PRICE').AsString ='N') then
        begin  //最后一次售价
          cds25.FieldByName('LATEST_PRICE').AsString:=formatfloat('0.0000',cds60.FieldValues['PART_PRICE']/cds60.FieldValues['EXCH_RATE'])
        end else
        begin
          cds25.FieldByName('LATEST_PRICE').AsString:=formatfloat('0.0000',cds60.FieldValues['PART_PRICE']/cds60.FieldValues['EXCH_RATE']/(1+cds60.FieldValues['RUSH_CHARGE']*0.01));
        end;
        cds25.FieldByName('REMARK').Value:=Memo1.Text;//加工指示
        cds25.FieldByName('ENG_NOTE').Value:=Memo2.Text;//工程备注
        cds25.Post;
      end;
      //处理360
      cds360.First;
      while not cds360.Eof do cds360.Delete;
      cds360_Save.Append;
      cds360_Save.FieldByName('so_ptr').Value:= cds60.FieldByName('rkey').AsString;
      cds360_Save.FieldByName('quantity').Value:=cds60.FieldByName('PARTS_ORDERED').Value;
      cds360_Save.FieldByName('sch_date').Value:=cds60.FieldByName('ORIG_SCHED_SHIP_DATE').Value;
      cds360_Save.FieldByName('D60_IDKey').AsString:=cds60.FieldByName('idkey').Value;
      cds360_Save.Post;
      //处理日志
      if (cds60_ole.FieldByName('PART_PRICE').Value<>cds60.FieldByName('PART_PRICE').Value) then//记录销售订单价格更改情况(日志文件)
      begin
        cds318.Append;
        cds318.FieldByName('SALES_ORDER_PTR').value:=cds60.FieldByName('rkey').Value;
        cds318.FieldByName('TRANS_TYPE').value:=3;
        cds318.FieldByName('TRANS_DESCRIPTION').value:='更改销售订单价格';
        cds318.FieldByName('FROM_STRING').value:= cds60_ole.FieldByName('PART_PRICE').AsString;
        cds318.FieldByName('TO_STRING').value:=cds60.FieldByName('PART_PRICE').AsString;
        cds318.FieldByName('USER_PTR').value:=gVar.rkey73;
        cds318.FieldByName('TRANS_DATE').value:=dLongDate;
        cds318.FieldByName('PROGRAM_SOURCE').value:=32;
        cds318.Post;
      end;
      if (cds60_ole.FieldByName('PARTS_ORDERED').Value<>cds60.FieldByName('PARTS_ORDERED').Value) then //记录销售订单数量更改情况(日志文件)
      begin
        cds318.Append;
        cds318.FieldByName('SALES_ORDER_PTR').value:=cds60.FieldByName('rkey').Value;
        cds318.FieldByName('TRANS_TYPE').value:=2;
        cds318.FieldByName('TRANS_DESCRIPTION').value:='更改销售订单数量';
        cds318.FieldByName('FROM_STRING').value:= cds60_ole.FieldByName('PARTS_ORDERED').AsString;
        cds318.FieldByName('TO_STRING').value:=cds60.FieldByName('PARTS_ORDERED').AsString;
        cds318.FieldByName('USER_PTR').value:=gVar.rkey73;
        cds318.FieldByName('TRANS_DATE').value:=dLongDate;
        cds318.FieldByName('PROGRAM_SOURCE').value:=32;
        cds318.Post;
      end;
      if (cds60_ole.FieldByName('ORIG_REQUEST_DATE').Value<>cds60.FieldByName('ORIG_REQUEST_DATE').Value) then//记录销售订单客户交期更改情况(日志文件)
      begin
        cds318.Append;
        cds318.FieldByName('SALES_ORDER_PTR').value:=cds60.FieldByName('rkey').Value;
        cds318.FieldByName('TRANS_TYPE').value:=4;
        cds318.FieldByName('TRANS_DESCRIPTION').value:='更改销售订单客户交期';
        cds318.FieldByName('FROM_STRING').value:= cds60_ole.FieldByName('ORIG_REQUEST_DATE').AsString;
        cds318.FieldByName('TO_STRING').value:=cds60.FieldByName('ORIG_REQUEST_DATE').AsString;
        cds318.FieldByName('USER_PTR').value:=gVar.rkey73;
        cds318.FieldByName('TRANS_DATE').value:=dLongDate;
        cds318.FieldByName('PROGRAM_SOURCE').value:=32;
        cds318.Post;
      end;
      if (cds60_ole.FieldByName('ORIG_SCHED_SHIP_DATE').Value<>cds60.FieldByName('ORIG_SCHED_SHIP_DATE').Value) then //记录销售订单客户交期更改情况(日志文件)
      begin
        cds318.Append;
        cds318.FieldByName('SALES_ORDER_PTR').value:=cds60.FieldByName('rkey').Value;
        cds318.FieldByName('TRANS_TYPE').value:=4;
        cds318.FieldByName('TRANS_DESCRIPTION').value:='更改销售订单计划交期';
        cds318.FieldByName('FROM_STRING').value:= cds60_ole.FieldByName('ORIG_SCHED_SHIP_DATE').AsString;
        cds318.FieldByName('TO_STRING').value:=cds60.FieldByName('ORIG_SCHED_SHIP_DATE').AsString;
        cds318.FieldByName('USER_PTR').value:=gVar.rkey73;
        cds318.FieldByName('TRANS_DATE').value:=dLongDate;
        cds318.FieldByName('PROGRAM_SOURCE').value:=32;
        cds318.Post;
      end;
      if (comparetext(Trim(cds60_ole.FieldByName('sales_order').AsString),Trim(cds60.FieldByName('sales_order').AsString))<>0) then //记录客户订单编号情况(日志文件)
      begin
        cds318.Append;
        cds318.FieldByName('SALES_ORDER_PTR').value:=cds60.FieldByName('rkey').Value;
        cds318.FieldByName('TRANS_TYPE').value:=8;
        cds318.FieldByName('TRANS_DESCRIPTION').value:='更改销售订单编号';
        cds318.FieldByName('FROM_STRING').value:= cds60_ole.FieldByName('sales_order').AsString;
        cds318.FieldByName('TO_STRING').value:=cds60.FieldByName('sales_order').AsString;
        cds318.FieldByName('USER_PTR').value:=gVar.rkey73;
        cds318.FieldByName('TRANS_DATE').value:=dLongDate;
        cds318.FieldByName('PROGRAM_SOURCE').value:=32;
        cds318.Post;
      end;

      if cds97.State in [dsEdit,dsInsert] then cds97.Post;
      if cds97_ole.State in [dsEdit,dsInsert] then cds97_ole.Post;
      if cds60.State in [dsEdit,dsInsert] then cds60.Post;
      if cds213.State in [dsEdit,dsInsert] then cds213.Post;
      if cds213_New.State in [dsEdit,dsInsert] then cds213_New.Post;
      if cds62.State in [dsEdit,dsInsert] then cds62.Post;
      if cds62_Save.State in [dsEdit,dsInsert] then cds62_Save.Post;
      if cds360.State in [dsEdit,dsInsert] then cds360.Post;
      if cds360_Save.State in [dsEdit,dsInsert] then cds360_Save.Post;
      if cds25.State in [dsEdit,dsInsert] then cds25.Post;
      if cds318.State in [dsEdit,dsInsert] then cds318.Post;

      LPostData := VarArrayCreate([0,10],varVariant);
      if (cds97.ChangeCount > 0) then
        LPostData[0] := cds97.Delta;
      if (cds97_ole.ChangeCount > 0) then
        LPostData[1] := cds97_ole.Delta;
      if (cds60.ChangeCount > 0) then
        LPostData[2] := cds60.Delta;
      if (cds213.ChangeCount > 0) then
        LPostData[3] := cds213.Delta;
      if (cds213_New.ChangeCount > 0) then
        LPostData[4] := cds213_New.Delta;
      if (cds62.ChangeCount > 0) then
        LPostData[5] := cds62.Delta;
      if (cds62_Save.ChangeCount > 0) then
        LPostData[6] := cds62_Save.Delta;
      if (cds360.ChangeCount > 0) then
        LPostData[7] := cds360.Delta;
      if (cds360_Save.ChangeCount > 0) then
        LPostData[8] := cds360_Save.Delta;
      if (cds25.ChangeCount > 0) then
        LPostData[9] := cds25.Delta;
      if (cds318.ChangeCount > 0) then
        LPostData[10] := cds318.Delta;
      if gSvrIntf.IntfPostModData('公共基础',72,LPostData,1) then
      begin
        if (cds97.ChangeCount > 0) then cds97.MergeChangeLog;
        if (cds97_ole.ChangeCount > 0) then cds97_ole.MergeChangeLog;
        if (cds60.ChangeCount > 0) then cds60.MergeChangeLog;
        if (cds213.ChangeCount > 0) then cds213.MergeChangeLog;
        if (cds213_New.ChangeCount > 0) then cds213_New.MergeChangeLog;
        if (cds62.ChangeCount > 0) then cds62.MergeChangeLog;
        if (cds62_Save.ChangeCount > 0) then cds62_Save.MergeChangeLog;
        if (cds360.ChangeCount > 0) then cds360.MergeChangeLog;
        if (cds360_Save.ChangeCount > 0) then cds360_Save.MergeChangeLog;
        if (cds25.ChangeCount > 0) then cds25.MergeChangeLog;
        if (cds318.ChangeCount > 0) then cds318.MergeChangeLog;
        ShowMessage('保存成功');
        if Assigned(refresh) then
          refresh(nil);
        close;
      end;
  finally
    lcds.Free;
    lcds2.Free;
  end;

end;

procedure TfrmEdit_so.ComboBox2Change(Sender: TObject);
begin
  stringgrid1.Cells[4,stringgrid1.Row]:=combobox2.Text;
end;

procedure TfrmEdit_so.DBRadioGroup1Click(Sender: TObject);
begin
  if (DBRadioGroup1.ItemIndex=1) then
  begin
    RKeyRzBtnEdit14.Enabled:=True;
  end else
  begin
    RKeyRzBtnEdit14.Enabled:=False;
    cds60.Edit;
    cds60.FieldByName('supplier_ptr').Value:=null;//装运地址Rkey12
    cds60.FieldByName('TAX_2').Value:=null;//委外入库成本折率%
    cds60.FieldByName('so_tp').Value:=DBRadioGroup1.ItemIndex;
    cds60.Post;
  end;
end;

procedure TfrmEdit_so.Edit1Exit(Sender: TObject);
var sSQL97,sTmp97:string;
    Lcds:TClientDataSet;
begin
  if ((activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'btnClose') and (trim(Edit1.Text)<>'')) then
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
        rkey97New:=Lcds.FieldByName('rkey').AsString;
        iNew97YN:=0;
        RKeyRzBtnEdit5.Text:= Lcds.FieldByName('po_date').Value;//PO日期
        RKeyRzBtnEdit5.Enabled:=False;
      end;
    finally
      Lcds.Free;
    end;
  end;
end;

procedure TfrmEdit_so.Edit2Exit(Sender: TObject);
var Lcds:TClientDataSet;
    sSQL25,Lsql89:string;
begin
  if (activecontrol.Name<>'BitBtn5')and (comparetext(edit2.Text,cds60_ole.FieldByName('MANU_PART_NUMBER').AsString)<>0) then
  begin
    Lcds:=TClientDataSet.Create(Self);
    try
      sSQL25:='SELECT TOP 100 PERCENT  data0025.rkey,  ENG_NOTE, PROD_CODE_PTR, data0025.REMARK,'
             +'data0025.RKEY AS rkey25,MANU_PART_NUMBER, MANU_PART_DESC, ttype, QTY_ON_HAND,Data0008.batch_flag, Data0008.former_flag,'
             +' CUSTOMER_PTR, SHELF_LIFE, ONHOLD_SALES_FLAG, ANALYSIS_CODE_2,set_lngth, set_width,'
             +' unit_sq, set_qty,qty_alloc,case data0025.ttype when 0 then ''量产'' when 1 then ''样板'' end as bachorfam,'
             +' data0008.product_name,data0025.prod_route_ptr,data0008.LEAD_TIME,Data0025.ORIG_CUSTOMER'
             +' FROM Data0025 inner join data0008 on data0025.PROD_CODE_PTR=data0008.rkey'
             +' WHERE (PARENT_PTR IS NULL) AND (ONHOLD_SALES_FLAG <> 1) ';
      sSQL25:=sSQL25+' and MANU_PART_NUMBER LIKE ''%'+Trim(Edit2.Text)+'%'' and CUSTOMER_PTR='+cds60.FieldByName('CUSTOMER_PTR').AsString+'  order by MANU_PART_NUMBER';
      gSvrIntf.IntfGetDataBySql(sSQL25,Lcds);
      if (comparetext(trim(Edit2.text),trim(Lcds.Fieldbyname('manu_part_number').AsString))=0) then
      begin
        cds60.Edit;
        cds60.FieldByName('CUST_PART_PTR').Value:=Lcds.Fieldbyname('rkey').Value; //25rkey
        dbcombobox2.ItemIndex:=self.getSO_OLDNEW(Lcds.Fieldbyname('rkey').Value);
        Lsql89:='select data0089.*,Data0278.RKEY,Data0278.PARAMETER_NAME,'
        +' Data0278.PARAMETER_DESC,Data0002.UNIT_NAME,Data0278.SPEC_RKEY'
        +' from data0089 inner join Data0278 on data0089.parameter_ptr=Data0278.rkey'
        +' INNER JOIN Data0002 ON Data0278.UNIT_PTR = Data0002.RKEY where data0089.cust_part_ptr='+ Lcds.Fieldbyname('rkey').AsString;
        gSvrIntf.IntfGetDataBySql(Lsql89,cds89);
        cds60.FieldByName('qty_on_hand').Value:=Lcds.Fieldbyname('qty_on_hand').Value;
        cds60.FieldByName('qty_alloc').Value:=Lcds.FieldByName('qty_alloc').Value;
        cds60.FieldByName('CanSL').Value:=Lcds.Fieldbyname('qty_on_hand').Value-Lcds.FieldByName('qty_alloc').Value;
        memo1.Text:=Lcds.Fieldbyname('remark').AsString;
        memo2.Text:=Lcds.Fieldbyname('eng_note').AsString;
        set_qty := Lcds.Fieldbyname('set_qty').Value;
        label83.Caption := inttostr(set_qty);
        v_part_num:=Lcds.fieldvalues['ttype'];  //样板还是生产板
        if (v_part_num=0) then RKeyRzBtnEdit7.Enabled:=false;//生产板订单不允许修改币别
        Edit2.Text:=lcds.FieldByName('MANU_PART_NUMBER').AsString;
        Edit3.Text:=lcds.FieldByName('MANU_PART_DESC').AsString;
        Edit4.Text:=lcds.FieldByName('ANALYSIS_CODE_2').AsString;
      end else
      begin
        messagedlg('产品型号不正确,请重新输入或选择',mtinformation,[mbok],0);
        Edit2.SetFocus;
        exit;
      end;
    finally
      Lcds.Free;
    end;
  end;
end;

procedure TfrmEdit_so.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmEdit_so := nil;
end;

procedure TfrmEdit_so.GetData(ARkey60,ARkey25: string);
var LSQL60,Lsq192,Lsql62,Lsql89,lsq360,LSQL61,Lsql60_ole:string;
begin
  // data60
  LSQL60 := cds60.CommandText +' and data0060.rkey='+ ARkey60;
  Lsq192:='select artaxontax,aptaxontax,QTE_control2,ppc_control15,custcitool,'
          +'custciprod,suplcimat,custciship,CUSTCOPROD,CUSTSTAPROD,custcoTool from data0192';
  Lsql62:='select * from data0062 where SO_PTR=' + ARkey60;
  Lsql89:='select data0089.*,Data0278.RKEY,Data0278.PARAMETER_NAME,'
          +' Data0278.PARAMETER_DESC,Data0002.UNIT_NAME,Data0278.SPEC_RKEY'
          +' from data0089 inner join Data0278 on data0089.parameter_ptr=Data0278.rkey'
          +' INNER JOIN Data0002 ON Data0278.UNIT_PTR = Data0002.RKEY where data0089.cust_part_ptr='+ ARkey25;
  lsq360:='select * from data0360 where so_ptr=' + ARkey60;
  LSQL61:='select rkey,category,TAX_FLAG from data0061 order by rkey';
  Lsql60_ole:=cds60.CommandText +' and data0060.rkey='+ ARkey60;
  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSQL60,Lsq192,Lsql62,lsq360,LSQL61,Lsql89,Lsql60_ole]),[cds60,cds192,cds62,cds360,cds61,cds89,cds60_ole]) then Exit;
  if not cds60.IsEmpty then
  begin
    if (cds60.FieldByName('IDKey').IsNull) then
    begin
      cds60.Edit;
      cds60.FieldByName('IDKey').Value:=gFunc.CreateIDKey;//
      cds60.Post;
    end;
  end;
end;

end.
