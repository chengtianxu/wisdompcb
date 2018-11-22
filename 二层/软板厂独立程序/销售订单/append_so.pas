unit append_so;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Mask, StdCtrls, ComCtrls, ExtCtrls, Grids, Menus, DB, ADODB;

type
  TContractInfo = record
    ContractNo: string;
    Qnty: Integer;
    EngAmount: Double;
    TestAmount: Double;
    AftDiscountAmount: Double;
  end;

  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit9: TEdit;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    StringGrid1: TStringGrid;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    StringGrid2: TStringGrid;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Label29: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    PopupMenu1: TPopupMenu;
    add_rep: TMenuItem;
    edit_rep: TMenuItem;
    del_rep: TMenuItem;
    Edit16: TEdit;
    Edit18: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label_qteptr: TLabel;
    Edit10: TEdit;
    SpeedButton1: TSpeedButton;
    Label22: TLabel;
    Label41: TLabel;
    Label4: TLabel;
    Label16: TLabel;
    ComboBox1: TComboBox;
    Label28: TLabel;
    Label31: TLabel;
    Label12: TLabel;
    MaskEdit3: TMaskEdit;
    Edit4: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    Edit7: TEdit;
    btnFindContract: TBitBtn;
    Bevel3: TBevel;
    Label37: TLabel;
    Label38: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    BitBtn3: TBitBtn;
    TabSheet4: TTabSheet;
    StringGrid3: TStringGrid;
    LabPrice: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5Exit(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure StringGrid2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure add_repClick(Sender: TObject);
    procedure edit_repClick(Sender: TObject);
    procedure StringGrid2DblClick(Sender: TObject);
    procedure del_repClick(Sender: TObject);
    procedure TabSheet2Exit(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6Exit(Sender: TObject);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit16KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit16Exit(Sender: TObject);
    procedure Edit18Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Change(Sender: TObject);
    procedure MaskEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure btnFindContractClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    function return_vifrkey(sgrid: tstringgrid;col: integer): string;
    procedure StringGrid3KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid3Exit(Sender: TObject);
    procedure StringGrid3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
   flag: Byte;
   ContractInfo: TContractInfo;
   function cacl_deficiency(rkey10:integer; nowAmount: currency):currency;//计算客户所欠金额

  public
    { Public declarations }
   rkey213:Integer;
  end;

var
  Form3: TForm3;
  v_row:byte;
implementation
uses damo, addsa_order, soprice_sea, edit_rep, main, quote_price,COMMON,
  FindContract, FindBook;
{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var dSum:Double;
 i:byte;
 v_credit:single;
begin
if ((strtoint(edit2.Text) mod form2.set_qty) <> 0) and
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

if (strtoint(edit2.Text)=0) then      //数量为0
 begin
 if messagedlg('订单数量为零,是否继续?',mtconfirmation,[mbYes,mbNo],0) = mrNo then
  begin
   edit2.SetFocus;
   exit;
  end;
 end;

if (dm.aq192suplcimat.Value<>'Y') and   //样板及备品订单以外的SO单价不可以为零
   (form2.v_part_num<>1) and            //不是样板
   (form2.ComboBox2.ItemIndex<>1) and   //不是备品
   (strtofloat(edit3.Text)=0) then      //单价为零
 begin
  showmessage('样板及备品订单以外的SO单价不可以为零');
  edit3.SetFocus;
  exit;
 end;

  if not ((ContractInfo.ContractNo<>'') or (Form2.checkRFQContractNo(form2.Edit7.Text))) then  //不存在RFQ合同号
  begin
    if (form2.quote_flag) and   //产品与报价单关联
       (label_qteptr.Caption='0') and      //没有报价单
       (form2.ComboBox2.ItemIndex=0) and    //正式
       (form2.RadioGroup1.ItemIndex=0) then //自制
    begin
      showmessage('订单已经与报价单强制关联,请选择一个报价单号');
      bitbtn2.SetFocus;
      exit;
    end;
  end;

 if form2.credit_rating = 3 then
  begin
   messagedlg('客户:'+form2.edit3.Text+'信用等级太差,订单无法继续!',mtwarning,[mbok],0);
   exit;
  end
 else
  if form2.credit_rating = 1 then //信用等级为优，超过限额出现提示后仍然可以
   begin                               //开出订单
    if cacl_deficiency(strtoint(form2.lab_rkey10.Caption),
                StrToCurr(Label34.Caption)/StrtoCurr(form2.Edit9.Text))>form2.credit_limit+1 then
    if messagedlg('客户:'+form2.edit3.Text+'未付款金额大于了信用限额是否继续?',
     mtconfirmation,[mbyes,mbno],0)=mrno then
     begin
      ModalResult:=mrcancel;
      exit;
     end;
   end
  else //信用等级为良，只能在限额以内开出销售订单
   begin
    if cacl_deficiency(strtoint(form2.lab_rkey10.Caption),
                StrToCurr(Label34.Caption)/StrtoCurr(form2.Edit9.Text))>form2.credit_limit+1 then
     begin
      messagedlg('客户:'+form2.edit3.Text+'未付款金额大于了信用限额无法继续!',mtwarning,[mbok],0);
      ModalResult:=mrcancel;
      exit;
     end;
   end;

//  if stringgrid2.RowCount>2 then
//   begin
//    v_credit:=0;
//    for i:=1 to stringgrid2.RowCount-2 do
//    v_credit:=v_credit+strtofloat(stringgrid2.Cells[3,i]);
//    if v_credit<>100 then  {判断条件原来是'<' 后经修改成'<>'   11.18}
//     if messagedlg('销售代表佣金分配合计应为100,要分配至相等的百分比吗?',
//                             mtConfirmation,[mbyes,mbno],0)=mryes then
//     for i:=1 to stringgrid2.RowCount-2 do
//      if (stringgrid2.RowCount=5) and (i=3) then
//       stringgrid2.Cells[3,i]:='33.34'
//      else
//       stringgrid2.Cells[3,i]:=formatfloat('0.00',100/(stringgrid2.RowCount-2))
//    else
//     exit;
//   end
//  else
//   begin
//    messagedlg('至少指派一名销售代表!',mterror,[mbcancel],0);
//    exit;
//   end;

 edit3exit(sender);     //重新计算'合计'页中所有数据
 if ((flag = 1) and Form2.checkRFQContractNo(Form2.Edit7.Text)) then
   Form2.Edit7.Text:= '';
 if flag = 2 then Form2.Edit7.Text:= ContractInfo.ContractNo;

   
//tang2013-10-16 修改添加订单价格明细-----
  dSum:=0;
  for i :=1  to StringGrid3.RowCount-2 do
  begin
    dSum:=dSum+StrToFloat(formatfloat('0.0000000',StrToFloat(StringGrid3.Cells[1,i])));
  end;
  if (dSum<>0) then
  begin
    if (Edit3.Text<>formatfloat('0.0000000',dSum)) then
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
//end tang2013-10-16 ----------------------

 ModalResult:=mrok;
end;

procedure TForm3.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
 abort;
end;

procedure TForm3.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
 if key = chr(46) then      //判断是否重复输入小数点'.'
  if pos('.',(sender as tedit).Text)>0 then
   abort;
end;

procedure TForm3.Edit3Exit(Sender: TObject);
begin
  if (form2.Edit2.text='') then form2.Edit2.text:='0';
     if edit2.Text='' then edit2.Text:='0';   //数量pcs
     if edit3.Text='' then edit3.Text:='0';  //价格pcs

     if (strtoint(edit2.Text) mod form2.set_qty) <> 0 then
         edit16.Text:=inttostr(round(strtoint(edit2.Text)/form2.set_qty))
     else
         edit16.Text:=floattostr(strtoint(edit2.Text)/form2.set_qty);

     edit3.Text :=formatfloat('0.0000000',strtofloat(edit3.Text));
     edit18.Text:=formatfloat('0.0000000',strtofloat(edit3.Text)*form2.set_qty);

     if form2.RadioGroup2.ItemIndex=0 then //价格不含税
          label30.caption:=formatfloat('0.0000',strtofloat(edit3.text)*strtofloat(edit2.text))
     else
          label30.caption:=formatfloat('0.0000',strtofloat(edit3.text)*strtofloat(edit2.text)
                                            /(1+strtofloat(form2.Edit2.text)*0.01));
         //税金
    label16.Caption:=formatfloat('0.000',strtofloat(label30.Caption)*strtofloat(form2.Edit2.text)*0.01);
         //折扣
    label32.caption:=formatfloat('0.000',strtofloat(label30.caption)*strtofloat(edit5.text)*0.01);
         //总计
    if form2.RadioGroup2.ItemIndex=0 then //价格不含税
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
        label41.Caption:=formatfloat('0.0000',strtofloat(edit2.text)*form2.unit_sq);//面积
end;

procedure TForm3.Edit5KeyPress(Sender: TObject; var Key: Char);
begin

 if edit5.Text<>'' then  //输入数字不能大于100
 if (strtofloat(edit5.Text)>=100) and (key <> chr(8)) then
   abort;
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
  if pos('.',edit5.Text)>0 then     //判断是否重复输入小数点'.'
   if key = chr(46)  then abort;

end;

procedure TForm3.Edit5Exit(Sender: TObject);
begin
if edit5.Text='' then edit5.Text:='0';
 edit5.Text:=formatfloat('0.00',strtofloat(edit5.Text));

label32.caption:=formatfloat('0.000',strtofloat(label30.caption)*strtofloat(edit5.text)*0.01);

if form2.RadioGroup2.ItemIndex=0 then //价格不含税
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

procedure TForm3.MaskEdit1Exit(Sender: TObject);
begin
try
 maskedit2.Text := datetostr(strtodate(maskedit1.text)-strtoint(form2.label49.caption));
 if strtodate(maskedit2.Text)<getsystem_date(DM.ADOQuery5,1)+form2.shelf_life then
  IF  messagedlg('计划装运日期要求在产品生产周期之前,可能导致不能按时交货,继续否?',
      mtConfirmation,[mbyes,mbcancel],0)=mrcancel then
   maskedit1.SetFocus;
except
 messagedlg('客户交期输入格式有误,请仔细检查!',mtwarning,[mbok],0);
 maskedit1.SetFocus;
end;
end;

procedure TForm3.MaskEdit2Exit(Sender: TObject);
begin
try
 if strtodate(maskedit2.Text) < getsystem_date(DM.ADOQuery5,1)+form2.shelf_life then
  IF  messagedlg('计划装运日期要求在产品生产周期之前,可能导致不能按时交货,继续否?',
      mtConfirmation,[mbyes,mbcancel],0)=mrcancel then
   maskedit2.SetFocus;
except
 messagedlg('计划的装运日期格式有误请仔细检查!',mtwarning,[mbok],0);
 maskedit2.SetFocus;
end;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
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
    sql.Add('where data0060.cust_part_ptr='+form2.lab_rkey50.Caption);
    sql.Add('and data0060.part_price<>0');
    sql.Add('order by ent_date desc');   //按时间降序排列
    active:=true;
   end;
  form4.ShowModal;
 finally
  form4.free;
 end;
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
PageControl1.ActivePageIndex:=0;
if edit16.Visible=true then
 edit16.SetFocus
else
 if edit2.Visible=true then
  edit2.SetFocus
 else
  edit3.SetFocus;

stringgrid1.Cells[0,0]:='工具费用类别';
stringgrid1.Cells[1,0]:='金额';
stringgrid1.Cells[2,0]:='挂帐金额';
stringgrid1.Cells[3,0]:='免收金额';
stringgrid1.Cells[4,0]:='征税';
stringgrid1.ColWidths[5]:=-1;

stringgrid2.Cells[0,0]:='代码';
stringgrid2.Cells[1,0]:='名称';
stringgrid2.Cells[2,0]:='佣金%';
stringgrid2.Cells[3,0]:='分配%';

//tang2013-10-16添加订单价格明细
  StringGrid3.Cells[0,0]:='订单价格类型定义';
  StringGrid3.Cells[1,0]:='价格';
  StringGrid3.ColWidths[2]:=-1;
  LabPrice.Tag:=0;
//end tang2013-10-16------------

label40.Caption:=inttostr(form2.set_qty);//出货板方式

end;

procedure TForm3.StringGrid1SelectCell(Sender: TObject; ACol,
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

procedure TForm3.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
  abort
 else
 if (pos('.',stringgrid1.Cells[stringgrid1.col,stringgrid1.row])>0)  then     //判断是否重复输入小数点'.'
  if key = chr(46)  then abort;

if (key <> chr(9)) then    //没有按tab键
 begin
  if (stringgrid1.Col=4) and (combobox1.Enabled) then
   begin
    ComboBox1.SetFocus;
    SendMessage(ComboBox1.Handle,WM_Char,word(Key),0);
   end;
 end;

end;

procedure TForm3.StringGrid1Exit(Sender: TObject);
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

procedure TForm3.FormCreate(Sender: TObject);
var tmpAdo:TADOQuery;
i:byte;
begin
dm.ADOSPprice.Close;
dm.ADOSPprice.Parameters[1].Value:=form2.lab_rkey50.Caption;
dm.ADOSPprice.Open;
if not dm.ADOSPprice.IsEmpty then  //查找最近一次产品销售价格
label35.Caption:=formatfloat('0.0000000',dm.ADOSPprice.FieldValues['part_price']);

if trim(form2.Lab_rkey97.Caption)<>'' then
begin
dm.ADOSPpoprice.Close;
dm.ADOSPpoprice.Parameters.ParamByName('@rkey50').Value:=form2.lab_rkey50.Caption;
dm.ADOSPpoprice.Parameters.ParamByName('@rkey97').Value:=form2.Lab_rkey97.Caption;
dm.ADOSPpoprice.Open;
if not dm.ADOSPpoprice.IsEmpty then
Label36.Caption:=formatfloat('0.0000000',dm.ADOSPpoprice.fieldvalues['part_price']);
end;

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
    stringgrid1.Cells[5,i]:=fieldbyname('rkey').AsString;
    next;
   end;
  end;

 if form2.quote_flag then             //与报价单关联
  begin
   if form2.RadioGroup1.ItemIndex=0 then  //加工形式自制
    begin
     edit3.ReadOnly := true;
     edit18.ReadOnly := true;
     edit3.Color := cl3dlight;
     edit18.Color := cl3dlight;
    end;
   if form2.ComboBox2.ItemIndex=1 then //备品订单
    bitbtn2.Enabled:=false;
  end;

 if dm.aq192custcitool.Value='Y' then //可以输入set数量
  begin
   label2.Visible:=true;
   label3.Visible:=true;
   edit16.Visible:=true;
   edit18.Visible:=true;
   label26.Left:=226;
   edit2.Left:=303
  end;
  flag:= 0;
//tang2013-10-16修改添加订单价格明细
  try
    try
      tmpAdo:=TADOQuery.Create(Application);
      tmpAdo.Connection:=dm.ADOConnection1;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:='select * from dbo.data0579';
      tmpAdo.Open;
      if not tmpAdo.IsEmpty then
      begin
        i:=1;
        while not tmpAdo.Eof do
        begin
          StringGrid3.RowCount:=StringGrid3.RowCount+1;
          StringGrid3.Cells[0,i]:=tmpAdo.fieldBYName('PriceName').AsString;
          StringGrid3.Cells[1,i]:='0.0000000';
          StringGrid3.Cells[2,i]:=tmpAdo.fieldBYName('Rkey').AsString;
          i:=i+1;
          tmpAdo.Next;
        end;
      end;
    except

    end;
  finally
    tmpAdo.Close;
    tmpAdo.Connection:=nil;
    tmpAdo.Free;
  end;
  StringGrid3.Cells[0,StringGrid3.RowCount-1]:='合计：';
//  StringGrid3.RowCount:=StringGrid3.RowCount-1;
//end tang2013-10-16------------
end;

procedure TForm3.PopupMenu1Popup(Sender: TObject);
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

procedure TForm3.StringGrid2MouseDown(Sender: TObject;
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

procedure TForm3.add_repClick(Sender: TObject);
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

procedure TForm3.edit_repClick(Sender: TObject);
var
i:byte;
begin
 try
  form5:=tform5.Create(application);
  form5.Edit1.Text:=stringgrid2.Cells[0,stringgrid2.row];
  form5.Edit2.Text:=stringgrid2.Cells[2,stringgrid2.row];
  form5.Edit3.Text:=stringgrid2.Cells[3,stringgrid2.row];
  form5.Label4.Caption:=stringgrid2.Cells[1,stringgrid2.row];
  form5.Label7.Caption:=stringgrid2.Cells[4,stringgrid2.row];
  if form5.ShowModal=mrok then
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

procedure TForm3.StringGrid2DblClick(Sender: TObject);
begin
 if trim(stringgrid2.Cells[0,stringgrid2.Row])<>'' then
    edit_repclick(sender);
end;

procedure TForm3.del_repClick(Sender: TObject);
var
 i:byte;
begin
 for i:=stringgrid2.Row to stringgrid2.RowCount-2 do
  stringgrid2.Rows[i].Text:=stringgrid2.Rows[i+1].Text;
  stringgrid2.RowCount:=stringgrid2.RowCount-1;
end;

procedure TForm3.TabSheet2Exit(Sender: TObject);
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
  if form2.RadioGroup2.ItemIndex=0 then //价格不含税
   if stringgrid1.Cells[4,i]='Y' then
    tax_amount:=tax_amount+strtocurr(floattostrf(
                           strtocurr(stringgrid1.Cells[1,i])*
                           strtocurr(form2.Edit2.text)*0.01,ffFixed,10,4))
   else
  else   //本身含税
   if stringgrid1.Cells[4,i]='Y' then
    tax_amount:=tax_amount+strtocurr(floattostrf(
            strtocurr(stringgrid1.Cells[1,i])*strtocurr(form2.Edit2.text)*0.01/
                       (1+strtocurr(form2.Edit2.text)*0.01),ffFixed,10,4));
 end;

 label33.Caption:=formatfloat('0.0000',tool);
 label31.Caption:=formatfloat('0.0000',tax_amount);

if form2.RadioGroup2.ItemIndex=0 then //价格不含税
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

procedure TForm3.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
     abort;
end;

procedure TForm3.Edit6Exit(Sender: TObject);
begin
 if trim(edit6.Text) = '' then edit6.Text := '0';
 if strtoint(trim(edit6.Text))>=10 then
  begin
   messagedlg('优先级别只是输入0-9单个数字!',mtwarning,[mbok],0);
   edit6.SetFocus;
  end;
end;

procedure TForm3.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then edit3.SetFocus;
end;

procedure TForm3.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then edit5.SetFocus;
end;

procedure TForm3.Edit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then edit6.SetFocus;
end;

procedure TForm3.Edit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=13) and (maskedit1.Visible) then MaskEdit1.SetFocus
else
 if key=13 then edit9.SetFocus;
end;

procedure TForm3.MaskEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then MaskEdit2.SetFocus;
end;

procedure TForm3.MaskEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then Edit9.SetFocus;
end;

procedure TForm3.Edit16KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then edit18.SetFocus;
end;

procedure TForm3.Edit16Exit(Sender: TObject);
begin
 if trim(edit16.Text)='' then edit16.Text := '0';
  edit2.Text:=inttostr(strtoint(edit16.Text)*form2.set_qty);
 edit3exit(sender);
end;

procedure TForm3.Edit18Exit(Sender: TObject);
begin
 if trim(edit18.Text)='' then edit18.Text := '0';
  edit18.Text :=formatfloat('0.0000000',strtofloat(edit18.Text));
  edit3.Text:=formatfloat('0.0000000',strtofloat(edit18.Text)/form2.set_qty);
 edit3exit(sender);
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
var //dcost:Double;
    i : Integer;
begin
    try
    form12:=tform12.Create(application);
    form12.Aq85.Close;
    form12.Aq85.Parameters[0].Value:=trim(form2.Label34.Caption);
//    form12.Aq85.Parameters[1].Value:=trim(form2.Label34.Caption);
    form12.Aq85.Open;

        if form12.ShowModal=mrok then
        begin
                if (trim(form12.aq85ref_part_no.Value)<>'') and
                   (comparetext(trim(form12.aq85ref_part_no.Value),trim(form2.Edit4.Text))<>0) then
                if messagedlg('报价单中本厂编号与销售订单中定义的不一致继续?',mtconfirmation,[mbyes,mbno],0)=mrno then
                begin
                    exit;
                end;

                if strtoint(form2.Lab_rkey01.Caption)<>form12.aq85CURR_PTR.Value then
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
                if form12.aq85VATAX.AsString  <> form2.tax then
                    showmessage('报价单与客户信息中定义的税率不一致不能继续'+form12.aq85VATAX.AsString+':'+form2.Edit3.text)
                else
                begin
//                   dcost:=0;
                     if ((form12.aq85Quote_type.Value=1) and (not form2.CheckBox1.Checked)) or
                        ((form12.aq85Quote_type.Value=0) and (form2.CheckBox1.Checked)) then
                          showmessage('报价单与客户信息中定义的是否转厂数据不一致不能继续')
                     else
                     begin //根据客户信息选择价格是否含税
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
//                         if form2.RadioGroup2.ItemIndex = 0 then  //不含税
//                         begin
//                            if form12.aq85QTE_UNIT_PTR.Value=1 then //以PCS报价
//                            begin
//                                edit3.Text := form12.aq85quote_price.AsString;
//                            end else
//                            begin
//                                edit3.Text := formatfloat('0.0000000',form12.aq85quote_price.Value/
//                                                                 form12.aq85TUNITS.Value);
//                            end;
//                         end else
//                         begin                                     //价格含税
//                           if form12.aq85QTE_UNIT_PTR.Value=1 then
//                           begin
//                                  edit3.Text := form12.aq85quote_taxprice.AsString;
//                           end else
//                           begin
//                                  edit3.Text := formatfloat('0.0000000',form12.aq85quote_taxprice.Value/
//                                                                   form12.Aq85TUNITS.Value);
//                           end;
//                         end;
                         edit3exit(sender);
                         edit10.Text := form12.Aq85TNUMBER.Value;
                         label_qteptr.Caption := form12.Aq85RKEY.AsString;
                         //20170105tang注释关联报价不带费用
                         //form1.get_quotetools(form12.Aq85RKEY.Value,stringgrid1);
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
                                if (StrToInt(StringGrid3.Cells[2,i])=dm.adoS578_85.FieldByName('d579_Ptr').AsInteger) then
                                begin
                                    StringGrid3.Cells[1,i]:=FormatFloat('0.0000000',dm.adoS578_85.FieldValues['Price']);
                                    break;
                                end;
                            end;
                            dm.adoS578_85.Next;
                          end;
                     end;
                end;
                flag:= 1;
                ContractInfo.ContractNo:= '';
        end;
    finally
     form12.Free;
    end;
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
edit10.Text:='';
label_qteptr.Caption:='0';
end;

procedure TForm3.Edit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then button1.SetFocus;
end;

procedure TForm3.FormDestroy(Sender: TObject);
begin
if dm.ADOSPprice.Active then dm.ADOSPprice.Close;
if dm.ADOSPpoprice.Active then dm.ADOSPpoprice.Close;
end;

function TForm3.cacl_deficiency(rkey10: integer; nowAmount: currency): currency;
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
    sql.Add('select Sum(t60.PARTS_ALLOC*t64.QUAN_SHIPPED*(1+t60.RUSH_CHARGE*0.01)/t60.EXCH_RATE) as total_amount ');
    sql.Add('from data0060 t60 inner join data0064 t64 on t64.SO_PTR = t60.RKEY ');
    sql.Add('left join data0439 t439 on t64.packing_list_ptr = t439.RKEY ');
    sql.Add('WHERE ((t64.packing_list_ptr is null) OR (t439.invoice_ptr is null)) ');
    sql.Add('and t60.STATUS in (1,2,4) ');
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

procedure TForm3.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
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

procedure TForm3.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then stringgrid1.SetFocus;
end;

procedure TForm3.ComboBox1Change(Sender: TObject);
begin
 stringgrid1.Cells[4,stringgrid1.Row]:=combobox1.Text;
end;

procedure TForm3.MaskEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then MaskEdit1.SetFocus;
end;

procedure TForm3.MaskEdit3Exit(Sender: TObject);
begin
try
{ if strtodate(maskedit3.Text) < getsystem_date(DM.ADOQuery5,1)+form2.shelf_life then
  IF  messagedlg('原始客户交期要求在产品生产周期之前,可能导致不能按时交货,继续否?',
      mtConfirmation,[mbyes,mbcancel],0)=mrcancel then
   maskedit3.SetFocus;
}
 strtodate(maskedit3.Text);
except
 messagedlg('原始客户交期输入格式有误,请仔细检查!',mtwarning,[mbok],0);
 maskedit3.SetFocus;
end;
end;

procedure TForm3.btnFindContractClick(Sender: TObject);
var
  i: Byte;
begin
  Application.CreateForm(TfrmFindContract, frmFindContract);
  try
    with dm.aqFindContract do
    begin
      Close;
      Parameters.Items[0].Value:= form2.Edit4.Text;
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
      Edit2.Text:= IntToStr(ContractInfo.Qnty);
      if form2.RadioGroup2.ItemIndex = 0 then  //不含税
        Edit3.Text:= formatfloat('0.0000000',
                    ((ContractInfo.AftDiscountAmount-ContractInfo.EngAmount-ContractInfo.TestAmount)
                    /(1+StrToFloat(form2.Edit2.text)*0.01))/ContractInfo.Qnty)
      else                                     //含税
        Edit3.Text:= formatfloat('0.0000000',
                    (ContractInfo.AftDiscountAmount-ContractInfo.EngAmount-ContractInfo.TestAmount)
                    /ContractInfo.Qnty);

      for i:= 0 to stringgrid1.RowCount-1 do
      begin
        if stringgrid1.Cells[0,i]= '工程费' then stringgrid1.Cells[1,i]:= formatfloat('0.0000',ContractInfo.EngAmount/(1+StrToFloat(form2.Edit2.text)*0.01));
        if stringgrid1.Cells[0,i]= '测试架费' then stringgrid1.Cells[1,i]:= formatfloat('0.0000',ContractInfo.TestAmount/(1+StrToFloat(form2.Edit2.text)*0.01));
      end;
      flag:= 2;
    end;
    edit3exit(sender);
    TabSheet2Exit(sender);
  finally
    frmFindContract.Free;
  end;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  if form2.credit_rating = 3 then
    Label43.Caption:= '差'
  else if form2.credit_rating = 1 then
    Label43.Caption:= '优'
  else
    Label43.Caption:= '良';
  Label44.Caption:= formatfloat('0.0000',form2.credit_limit);
  Label45.Caption:= formatfloat('0.0000',cacl_deficiency(strtoint(form2.lab_rkey10.Caption),0));
end;

procedure TForm3.BitBtn3Click(Sender: TObject);
var
  rkey213_list:string;
begin
  Application.CreateForm(TForm_FindBook, Form_FindBook);
  try
    rkey213_list:= return_vifrkey(Form2.StringGrid1,25);
    with Form_FindBook.ADS213 do
    begin
      Close;
      Parameters.Items[0].Value:= form2.Edit4.Text;
      Parameters.Items[1].Value:= Form2.Edit6.Text;
      if rkey213_list<>'' then
      CommandText:=CommandText+' and data0213.rkey not in'+rkey213_list;
      Open;
    end;
    if Form_FindBook.ShowModal = mrok then
    begin
      rkey213:=Form_FindBook.ADS213RKEY.Value;
      Edit2.Text:=Form_FindBook.ADS213PARTS_ORDERED.AsString;//数量
      Edit2.ReadOnly:=True;
      MaskEdit3.Text:=Form_FindBook.ADS213ORIG_REQUEST_DATE.AsString;
      MaskEdit1.Text:=Form_FindBook.ADS213ORIG_SCHED_SHIP_DATE.AsString;
      if form2.RadioGroup2.ItemIndex = 0 then  //不含税
      begin
       if StrToFloat(form2.Edit2.Text)>0 then
       Edit3.Text:= formatfloat('0.0000000',Form_FindBook.ADS213PART_PRICE.Value/(1+strtofloat(form2.Edit2.Text)*0.01))
       else
       Edit3.Text:= formatfloat('0.0000000',Form_FindBook.ADS213PART_PRICE.Value);
      end
      else
      begin                                           //含税
       Edit3.Text:= formatfloat('0.0000000',Form_FindBook.ADS213PART_PRICE.Value);
      end;
    end;
  finally
    Form_FindBook.Free;
  end;
end;

function TForm3.return_vifrkey(sgrid: tstringgrid;
  col: integer): string;
var
 i:integer;
 rkey_list:string;
begin
 result:='';
if sgrid.RowCount > 2 then
 begin
   rkey_list:='(';
   for i:=1 to sgrid.RowCount-2 do
     rkey_list:=rkey_list+ sgrid.Cols[col].Strings[i]+',';
   if length(rkey_list) > 1 then
    result:= copy(rkey_list,1,length(rkey_list)-1)+')'
   else
    result:='';
 end;
end;


procedure TForm3.StringGrid3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
    abort
  else
  if (pos('.',stringgrid3.Cells[stringgrid3.col,stringgrid3.row])>0)  then    //判断是否重复输入小数点'.'
  if key = chr(46)  then abort;
end;

procedure TForm3.StringGrid3Exit(Sender: TObject);
var i:Integer;
begin
  for i :=1  to StringGrid3.RowCount-2 do
  begin
    if (Trim(StringGrid3.Cells[1,i])='') then
    StringGrid3.Cells[1,i]:='0.0000000';
  end;
end;

procedure TForm3.StringGrid3MouseMove(Sender: TObject; Shift: TShiftState;
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

end.
