unit PasAddSales;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseFrm,ucommfunc, Vcl.Grids,uBaseSinglePickListFrm,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB,
  Datasnap.DBClient, PasHistoryPrice;

type
  TfrmAddSales = class(TfrmBase)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    Label26: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Bevel2: TBevel;
    Label11: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label27: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    SpeedButton1: TSpeedButton;
    Label22: TLabel;
    Label41: TLabel;
    Label4: TLabel;
    Label16: TLabel;
    Label28: TLabel;
    Label31: TLabel;
    Label12: TLabel;
    Bevel3: TBevel;
    Label37: TLabel;
    Label38: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Edit16: TEdit;
    Edit2: TEdit;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit9: TEdit;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    Edit18: TEdit;
    Edit10: TEdit;
    MaskEdit3: TMaskEdit;
    btn1: TBitBtn;
    ComboBox2: TComboBox;
    TabSheet2: TTabSheet;
    StringGrid1: TStringGrid;
    ComboBox1: TComboBox;
    TabSheet3: TTabSheet;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit4: TEdit;
    Edit7: TEdit;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    cds60: TClientDataSet;
    cds61: TClientDataSet;
    cds283: TClientDataSet;
    cds04: TClientDataSet;
    Label47: TLabel;
    cds60_97: TClientDataSet;
    Labele06: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit18Exit(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ComboBox1Change(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1Exit(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure TabSheet2Exit(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
     gNDate,sRkey25:string;
    { Private declarations }
  public
    //产品是否与报价单关联, 客户报价关联标志
    quote_flag,customer_quote:boolean;
    //税率     ,面积      ,信用限额
    RUSH_CHARGE,unit_sq,credit_limit:Double;
    //信用等级，含税标识0不含,装运交货提前天数,产品周期
    CREDIT_RATING,ItemIndex,SHIP_LEAD_TIME,shelf_life,i283rkey:Integer;
    //出货板方式,是否是预处理,样板/量产,正品/备品,自制,
    set_qty,if213,v_part_num,so_style,so_tp:Integer;
    //客户型号,,   本厂编号 ,货币Rkey ,192样板及备品订单以外单价不可以为零,192是否受信用控制,客户代码，10Rkey,汇率
    MANU_PART_DESC,manu_part_number,CURRENCY_PTR,suplcimat192,CUSTSTAPROD192,code10,rkey10,EXCH_RATE,custcitool192:string;
    //菜单
    FEditType: Integer;
    BP06IDkey:string;//报价IDkey
    { Public declarations }
    procedure GetData(ARkey25,Arkey97:string);
    procedure init;
    function cacl_deficiency(Arkey10:string; nowAmount: currency): currency;
  end;

var
  frmAddSales: TfrmAddSales;

implementation

{$R *.dfm}
function TfrmAddSales.cacl_deficiency(Arkey10: string;
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

procedure TfrmAddSales.BitBtn1Click(Sender: TObject);
var
  LFrm:TfrmHistoryPrice;
begin
  LFrm:= TfrmHistoryPrice.Create(nil);
  LFrm.iEN:=0;
  LFrm.GetData(sRkey25);
  LFrm.ShowModal;
  LFrm.Free;
end;

procedure TfrmAddSales.btn1Click(Sender: TObject);
var LFrm: TfrmSinglePickList;
begin
  inherited;
  LFrm := TfrmSinglePickList.Create(Self);
  try
    if (MANU_PART_DESC='') then
      LFrm.InitWithPickID(72,10,' and d25.manu_part_number = ' + QuotedStr(manu_part_number)+' order by BPTime Desc')
    else
      LFrm.InitWithPickID(72,10,' and d25.MANU_PART_DESC = ' + QuotedStr(MANU_PART_DESC)+' order by BPTime Desc');
    if LFrm.ShowModal = mrOk then
    begin
      if (CURRENCY_PTR<>Trim(LFrm.cdsPick.FieldByName('d01_ptr').asString)) then
      begin
        ShowMessage('报价单中定义的货币与销售订单中定义的货币不一致!');
        Exit;
      end;
      if (ItemIndex=0) then //价格不含税
        Edit3.Text := LFrm.cdsPick.fieldbyname('buhanshuijiage_Pcs').AsString
      else                                     //含税
        Edit3.Text := LFrm.cdsPick.fieldbyname('hanshuijiage_Pcs').AsString;
      Edit10.Text:=LFrm.cdsPick.fieldbyname('BPNO').AsString;
      BP06IDkey:=LFrm.cdsPick.fieldbyname('idkey').AsString;//报价Rkey
      Labele06.Caption:=LFrm.cdsPick.fieldbyname('buhanshuijiage_Pcs').AsString;
      if (Trim(Edit10.Text)<>'') then Edit3.ReadOnly:=True else Edit3.ReadOnly:=False;
      Edit3Exit(Edit3);
      TabSheet2Exit(sender);
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TfrmAddSales.Button1Click(Sender: TObject);
begin
  PageControl1.ActivePage:=TabSheet1;
  if ((strtoint(edit2.Text) mod set_qty) <> 0) and
   (messagedlg('订单数量pcs不是出货板数set的倍数,是否继续?',mtconfirmation,[mbYes,mbNo],0)=mrno) then
  begin
    edit2.SetFocus;
    exit;
  end;
  if (edit1.Visible=true) and (trim(edit1.Text)='') then
  begin
    showmessage('销售订单编号不能为空');
    edit1.SetFocus;
    exit;
  end;

//选择预处理状态下修改的下单数量不能超过预处理数量之和
  if (if213>0) then
  if ((StrToInt(Edit2.Text)+edit2.Tag)>BitBtn1.Tag) then
  begin
    showmessage('订单数量之和不能大于预处理数量！');
    edit2.SetFocus;
    exit;
  end;
  if (strtoint(edit2.Text)=0) then      //数量为0
  begin
    showmessage('订单数量不能为零！');
    edit2.SetFocus;
    exit;
  end;
  if (suplcimat192<>'Y') and   //样板及备品订单以外的SO单价不可以为零
   (v_part_num<>1) and            //不是样板
   (so_style<>1) and   //不是备品
   (strtofloat(edit3.Text)=0) then      //单价为零
  begin
    showmessage('样板及备品订单以外的SO单价不可以为零');
    edit3.SetFocus;
    exit;
  end;
  if (Trim(edit10.Text) = '') then
  begin
    if (quote_flag) and   //产品与报价单关联
       (so_style=0) and    //正式
       (so_tp=0) and   //自制
       (customer_quote) then //客户价格强制关联报价单
    begin
      showmessage('订单已经与报价单强制关联,请选择一个报价单号');
      btn1.SetFocus;
      exit;
    end;
  end;
  IF (CUSTSTAPROD192='Y') then
  begin
    if credit_rating = 3 then
    begin
      messagedlg('客户:'+code10+'信用等级太差,订单无法继续!',mtwarning,[mbok],0);
      exit;
    end
    else
    if credit_rating = 1 then //信用等级为优，超过限额出现提示后仍然可以
    begin                               //开出订单
      if cacl_deficiency(rkey10,StrToCurr(Label34.Caption)/StrtoCurr(EXCH_RATE))>credit_limit+1 then
      if messagedlg('客户:'+code10+'未付款金额大于了信用限额是否继续?',
       mtconfirmation,[mbyes,mbno],0)=mrno then
       begin
        ModalResult:=mrcancel;
        exit;
       end;
    end
    else //信用等级为良，只能在限额以内开出销售订单
    begin
      if cacl_deficiency(rkey10,StrToCurr(Label34.Caption)/StrtoCurr(EXCH_RATE))>credit_limit+1 then
      begin
        messagedlg('客户:'+code10+'未付款金额大于了信用限额无法继续!',mtwarning,[mbok],0);
        ModalResult:=mrcancel;
        exit;
      end;
    end;
  end;
  Edit3Exit(sender);     //重新计算'合计'页中所有数据
  i283rkey:=integer(combobox2.items.objects[combobox2.itemindex]);//283RKey
  ModalResult:=mrok;
end;

procedure TfrmAddSales.ComboBox1Change(Sender: TObject);
begin
  stringgrid1.Cells[4,stringgrid1.Row]:=combobox1.Text;
end;

procedure TfrmAddSales.Edit18Exit(Sender: TObject);
begin
  if (trim(edit18.Text)='') then edit18.Text := '0';
  edit18.Text :=formatfloat('0.00000000',strtofloat(edit18.Text));
  edit3.Text:=formatfloat('0.00000000',strtofloat(edit18.Text)/set_qty);
  edit3exit(sender);
end;

procedure TfrmAddSales.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
   abort;
end;

procedure TfrmAddSales.Edit3Exit(Sender: TObject);
begin
//  inherited;
  if (Trim(edit2.Text)='') then edit2.Text:='0';   //数量pcs
  if (Trim(edit3.Text)='') then edit3.Text:='0';  //价格pcs
  if (strtoint(edit2.Text) mod set_qty) <> 0 then
   edit16.Text:=inttostr(round(strtoint(edit2.Text)/set_qty))
  else
   edit16.Text:=floattostr(strtoint(edit2.Text)/set_qty);

   edit3.Text :=formatfloat('0.00000000',strtofloat(edit3.Text));
   edit18.Text:=formatfloat('0.00000000',strtofloat(edit3.Text)*set_qty);

   if (ItemIndex=0) then //价格不含税
    label30.caption:=formatfloat('0.0000',strtofloat(edit3.text)*strtofloat(edit2.text))
   else
    label30.caption:=formatfloat('0.0000',strtofloat(edit3.text)*strtofloat(edit2.text)
                                          /(1+RUSH_CHARGE*0.01));
       //税金
  label16.Caption:=formatfloat('0.000',strtofloat(label30.Caption)*RUSH_CHARGE*0.01);
       //折扣
  label32.caption:=formatfloat('0.000',strtofloat(label30.caption)*strtofloat(edit5.text)*0.01);
       //总计
  if (ItemIndex=0) then //价格不含税
   label34.Caption:=formatfloat('0.0000',strtofloat(label30.Caption)+
                                        strtofloat(label16.Caption)+
                                        strtofloat(label33.Caption)+
                                        strtofloat(label31.Caption)-
                                        strtofloat(label32.Caption)) //折扣
  else
   label34.Caption:=formatfloat('0.0000',strtofloat(label30.Caption)+
                                        strtofloat(label33.Caption)+
                                        strtofloat(label16.Caption)-
                                        strtofloat(label32.Caption)); //折扣
  label41.Caption:=formatfloat('0.0000',strtofloat(edit2.text)*unit_sq);//面积
end;

procedure TfrmAddSales.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
    abort
  else
  if key = chr(46) then      //判断是否重复输入小数点'.'
  if pos('.',(sender as tedit).Text)>0 then
    abort;
end;

procedure TfrmAddSales.Edit5Exit(Sender: TObject);
begin
  if edit5.Text='' then edit5.Text:='0';
   edit5.Text:=formatfloat('0.00',strtofloat(edit5.Text));

  label32.caption:=formatfloat('0.000',strtofloat(label30.caption)*strtofloat(edit5.text)*0.01);

  if (ItemIndex=0) then //价格不含税
   label34.Caption:=formatfloat('0.0000',strtofloat(label30.Caption)+
                                        strtofloat(label16.Caption)+
                                        strtofloat(label33.Caption)+
                                        strtofloat(label31.Caption)-
                                        strtofloat(label32.Caption)) //折扣
  else
   label34.Caption:=formatfloat('0.0000',strtofloat(label30.Caption)+
                                        strtofloat(label33.Caption)+
                                        strtofloat(label16.Caption)-
                                        strtofloat(label32.Caption)); //折扣
end;

procedure TfrmAddSales.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if edit5.Text<>'' then  //输入数字不能大于100
  if (strtofloat(edit5.Text)>=100) and (key <> chr(8)) then
    abort;
  if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
    abort
  else
  if pos('.',edit5.Text)>0 then     //判断是否重复输入小数点'.'
   if key = chr(46)  then abort;
end;

procedure TfrmAddSales.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage:=TabSheet1;
  if edit16.Visible=true then
   edit16.SetFocus
  else
   if edit2.Visible=true then
    edit2.SetFocus
   else
    edit3.SetFocus;
  gNDate:=FormatDateTime('yyyy-MM-dd',gFunc.GetSvrDateTime);
end;

procedure TfrmAddSales.GetData(ARkey25,Arkey97:string);
var LSQL61,LSQL60,LSQL283,LSQL04,LSQL60_97:string;
begin
  sRkey25:=ARkey25;
  LSQL60:='select part_price from data0060 where cust_part_ptr='+ARkey25+' and part_price<>0';
  LSQL61:='select rkey,category,TAX_FLAG from data0061 order by rkey';
  LSQL283:='select * from data0283';
  LSQL04:='select * from data0004 where table_name=''data0060''';
  if (Trim(Arkey97)='') then  Arkey97:='-1';
  LSQL60_97:='select sales_order,part_price from data0060 where cust_part_ptr='+ARkey25+' and part_price<>0 and purchase_order_ptr='+ARkey97+' order by sales_order desc';
  if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSQL60,LSQL61,LSQL283,LSQL04,LSQL60_97]),[cds60,cds61,cds283,cds04,cds60_97]) then Exit;
end;

procedure TfrmAddSales.init;
var i:Integer;
begin
  PageControl1.ActivePageIndex:=0;
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
//优先顺序默认值
  ComboBox2.Items.Clear;
  if not cds283.IsEmpty then
  begin
    while not cds283.Eof do
    begin
      ComboBox2.Items.AddObject(cds283.fieldBYName('PRIORITY_name').AsString,Pointer(cds283.fieldBYName('PRIORITY_CODE').AsInteger));
      cds283.Next;
    end;
  end;
//  ComboBox2.ItemIndex:=ComboBox2.Items.IndexOf(cds283.fieldBYName('PRIORITY_name').AsString);
  ComboBox2.ItemIndex:=0;
  if not cds60.IsEmpty  then
    label35.Caption:=formatfloat('0.00000000',cds60.FieldByName('part_price').Value)//最近销售价格
  else
    label35.Caption:='0.00000000';
  if not cds60_97.IsEmpty  then
    Label36.Caption:=formatfloat('0.00000000',cds60_97.FieldByName('part_price').Value)//上一次采购定单/部件价格
  else
    Label36.Caption:='0.00000000';
  if (quote_flag) and (customer_quote) then //与报价单关联and客户报价关联标志
  begin
    if (so_tp=0) then
    begin
      edit3.ReadOnly := true;
      edit18.ReadOnly := true;
    end;
  end;
  if (custcitool192='Y') then //可以输入set数量
  begin
    label2.Visible:=true;
    label3.Visible:=true;
    edit16.Visible:=true;
    edit18.Visible:=true;
    label26.Left:=220;
    edit2.Left:=296;
  end;
end;

procedure TfrmAddSales.MaskEdit1Exit(Sender: TObject);
begin
  try
    maskedit2.Text := datetostr(strtodate(maskedit1.text)-SHIP_LEAD_TIME);
    if (strtodate(maskedit2.Text)<(StrToDate(gNDate)+shelf_life)) then
    IF  messagedlg('计划装运日期要求在产品生产周期之前,可能导致不能按时交货,继续否?',
        mtConfirmation,[mbyes,mbcancel],0)=mrcancel then
     maskedit1.SetFocus;
  except
    messagedlg('客户交期输入格式有误,请仔细检查!',mtwarning,[mbok],0);
    maskedit1.SetFocus;
  end;
end;

procedure TfrmAddSales.MaskEdit2Exit(Sender: TObject);
begin
  try
    if (strtodate(maskedit2.Text) <(StrToDate(gNDate)+shelf_life)) then
    IF  messagedlg('计划装运日期要求在产品生产周期之前,可能导致不能按时交货,继续否?',
        mtConfirmation,[mbyes,mbcancel],0)=mrcancel then
     maskedit2.SetFocus;
  except
    messagedlg('计划的装运日期格式有误请仔细检查!',mtwarning,[mbok],0);
    maskedit2.SetFocus;
  end;
end;

procedure TfrmAddSales.MaskEdit3Exit(Sender: TObject);
var TempDate:TDateTime;
begin
  if (TryStrToDate(Trim(MaskEdit3.Text),TempDate)=False) then
  begin
    messagedlg('原始客户交期输入格式有误,请仔细检查!',mtwarning,[mbok],0);
    maskedit3.SetFocus;
  end;
end;

procedure TfrmAddSales.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  edit10.Text:='';
end;

procedure TfrmAddSales.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
//  inherited;
  if (gdSelected  in State) then
  begin
    if (ACol = 4) then
    begin
      ComboBox1.Left := Rect.Left;
      ComboBox1.Top := Rect.Top;
      ComboBox1.Width := Rect.Right - Rect.Left+3;
      ComboBox1.Height := Rect.Bottom - Rect.Top;
      ComboBox1.Visible := True;
      combobox1.ItemIndex:=combobox1.Items.IndexOf(StringGrid1.Cells[acol,arow])
    end
    else
      ComboBox1.Visible :=false;
  end;
end;

procedure TfrmAddSales.StringGrid1Exit(Sender: TObject);
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

procedure TfrmAddSales.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
    abort
  else
  if (pos('.',stringgrid1.Cells[stringgrid1.col,stringgrid1.row])>0)  then     //判断是否重复输入小数点'.'
  if key = chr(46)  then abort;
end;

procedure TfrmAddSales.StringGrid1SelectCell(Sender: TObject; ACol,
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

procedure TfrmAddSales.TabSheet2Exit(Sender: TObject);
var
tool,tax_amount:single;
i:byte;
begin
  tool:=0;
  tax_amount:=0;
  for i:=1 to stringgrid1.RowCount-2 do
  if strtocurr(stringgrid1.Cells[1,i])>0 then
  begin
    tool:=tool+strtocurr(stringgrid1.Cells[1,i]);
    if (ItemIndex=0) then //价格不含税
     if Trim(stringgrid1.Cells[4,i])='Y' then
      tax_amount:=tax_amount+strtocurr(floattostrf(
                             strtocurr(stringgrid1.Cells[1,i])*
                             RUSH_CHARGE*0.01,ffFixed,10,4))
     else
    else   //本身含税
     if Trim(stringgrid1.Cells[4,i])='Y' then
      tax_amount:=tax_amount+strtocurr(floattostrf(
              strtocurr(stringgrid1.Cells[1,i])*RUSH_CHARGE*0.01/
                         (1+RUSH_CHARGE*0.01),ffFixed,10,4));
  end;

  label33.Caption:=formatfloat('0.0000',tool);
  label31.Caption:=formatfloat('0.0000',tax_amount);

  if (ItemIndex=0) then //价格不含税
    label34.Caption:=formatfloat('0.0000',strtofloat(label30.Caption)+
                                      strtofloat(label16.Caption)+
                                      strtofloat(label33.Caption)+
                                      strtofloat(label31.Caption)-
                                      strtofloat(label32.Caption)) //折扣
  else
    label34.Caption:=formatfloat('0.0000',strtofloat(label30.Caption)+
                                       strtofloat(label16.Caption)+
                                      strtofloat(label33.Caption)-
                                      strtofloat(label32.Caption)); //折扣
end;

end.
