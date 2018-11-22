unit salesorder_planned;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, DB,
  ADODB, Menus,math, ImgList, ComCtrls, RzEdit, RzSpnEdt;

type
  PTreeValue=^TTreeValue;

  TTreeValue=record
  rkey25:integer;
  shelf_life:integer;
  qty_bom:integer;   //压合比例
  QTY_PARENTBOM:integer;
  OPT_LOT_SIZE:integer;
  analysis_3:string;
 end;
type
  TQnty=record
  MANU_PART_NUMBER:String;
  SALES_ORDER:String;
  QTY_ON_HAND:Single;
 end;
   
type
  TForm_salesorder = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    Label21: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    Edit3: TEdit;
    Panel4: TPanel;
    StaticText1: TStaticText;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    ComboBox1: TComboBox;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label1: TLabel;
    Edit5: TEdit;
    Label5: TLabel;
    Edit9: TEdit;
    Label6: TLabel;
    Edit10: TEdit;
    Label7: TLabel;
    Edit11: TEdit;
    adq360: TADOQuery;
    adq360SALES_ORDER: TStringField;
    adq360sch_date: TDateTimeField;
    adq360so_ptr: TIntegerField;
    adq360quantity: TIntegerField;
    adq360planned_qty: TIntegerField;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    SG2: TStringGrid;
    PopupMenu1: TPopupMenu;
    N2: TMenuItem;
    TreeView1: TTreeView;
    ImageList1: TImageList;
    Label9: TLabel;
    Edit1: TEdit;
    Label10: TLabel;
    Edit2: TEdit;
    Label11: TLabel;
    Edit12: TEdit;
    Label13: TLabel;
    Edit13: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    SpeedButton1: TSpeedButton;
    RzSpinEdit1: TRzSpinEdit;
    RzSpinEdit2: TRzSpinEdit;
    RzNumericEdit1: TRzNumericEdit;
    Label19: TLabel;
    lbl1: TLabel;
    cbb1: TComboBox;
    procedure SG2DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure SG2SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SG2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure N2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RzSpinEdit1Changing(Sender: TObject; NewValue: Extended;
      var AllowChange: Boolean);
    procedure RzSpinEdit2Changing(Sender: TObject; NewValue: Extended;
      var AllowChange: Boolean);
    procedure RzSpinEdit1Change(Sender: TObject);
    procedure RzSpinEdit1Exit(Sender: TObject);
    procedure RzNumericEdit1Change(Sender: TObject);
  private
    { Private declarations }

   qq:array of TQnty;
   ct_perenct,ppc26:double; //样品超投率,量产超投面积
   ppc25,PPC_CONTROL6:integer;           //小订单PCS数量界定 ,允许合并投产
   function total_tobeplanned():integer;
   function total_planned: integer;
   function hypotaxis_so():boolean;
   function cacl_totalpcs(ttype:byte;tobe_planned:integer;var a_pan,b_pan:integer):integer;
   function cacl_bomqty(node:TTreeNode):Single;
   function wo_number(cutno:string;pana_or_b:byte;total_row,curr_row,pan_b_qty:integer):string;
   function find_hostct():boolean;
   function find_pcs_qty(spec_rkey:string): STRING;
   procedure RefreshEdit;
   function getschdate(var prodcount,pcs: Integer): string;
   function get_mainso(so_order: string): Integer;
  public
    { Public declarations }
 //  OPT_LOT_SIZE:integer; //最佳流转批量
   EST_SCRAP:double;    //报废率
//   total_pcb,pan_a,pan_b:integer;//每张大料总PCS,A拼版数,B拼版数

   d25_type:byte;   //量产OR样板
   whouseptr:integer;   //工厂指派
  end;

var
  Form_salesorder: TForm_salesorder;

implementation

uses damo, editplanned, putprod,common, uQnty;

{$R *.dfm}

function TForm_salesorder.find_pcs_qty(spec_rkey:string): STRING;

begin
 result:='0';
 dm.ADO279.First;
 while not dm.ADO279.Eof do
 begin
  if trim(dm.ADO279spec_rkey.Value)=spec_rkey then
   begin
    if trim(dm.ADO279PARAMETER_DESC.Value)<>'' then
     result:=trim(dm.ADO279PARAMETER_DESC.Value);
    break;
   end;
  dm.ADO279.Next;
 end;

end;

function TForm_salesorder.cacl_totalpcs(ttype: byte; tobe_planned: integer;
  var a_pan, b_pan: integer): integer;
var
 pcstotal,mix_pcs,first_a,first_b:integer;
 total_pcb,pan_a,pan_b,A_pcs,B_pcs:integer;
 a_pan_mix,b_pan_mix,
 a_pan_firsta,b_pan_firsta,
 a_pan_firstb,b_pan_firstb:integer;
begin
total_pcb:=0;
pan_a:=0;
A_pcs:=0;
pan_b:=0;
b_pcs:=0;

 dm.ADO279.First;
 while not dm.ADO279.Eof do
 begin
    if trim(dm.ADO279spec_rkey.Value)='P' then
     begin
      if trim(dm.ADO279PARAMETER_DESC.Value)='' then
        total_pcb:=0
      else
        total_pcb:=strtoint(trim(dm.ADO279PARAMETER_DESC.Value));
     end;
    if trim(dm.ADO279spec_rkey.Value)='1' then
     begin
      if trim(dm.ADO279PARAMETER_DESC.Value)='' then
        pan_a:=0
      else
        pan_a:=strtoint(trim(dm.ADO279PARAMETER_DESC.Value));
     end;
    if trim(dm.ADO279spec_rkey.Value)='2' then
     begin
      if trim(dm.ADO279PARAMETER_DESC.Value)='' then
        pan_b:=0
      else
        pan_b:=strtoint(trim(dm.ADO279PARAMETER_DESC.Value));
     end;
    if trim(dm.ADO279spec_rkey.Value)='3' then
     begin
      if trim(dm.ADO279PARAMETER_DESC.Value)='' then
        A_pcs:=0
      else
        A_pcs:=strtoint(trim(dm.ADO279PARAMETER_DESC.Value));
     end;
    if trim(dm.ADO279spec_rkey.Value)='4' then
     begin
      if trim(dm.ADO279PARAMETER_DESC.Value)='' then
        B_pcs:=0
      else
        B_pcs:=strtoint(trim(dm.ADO279PARAMETER_DESC.Value));
     end;
  dm.ADO279.Next;
 end;
 
if pan_b=0 then  //如果只开A板
 begin
  b_pan:=0;
  a_pan:=(tobe_planned div total_pcb) * pan_a;       //已投A板数
  a_pan:=a_pan+ceil((tobe_planned mod total_pcb) / A_pcs); //余数投A板
  pcstotal:=a_pan * A_pcs;
 end
else
if pan_a=0 then  //如果只开B板
 begin
  a_pan:=0;
  b_pan:=(tobe_planned div total_pcb) * pan_b;       //已投b板数
  b_pan:=b_pan+ceil((tobe_planned mod total_pcb) / b_pcs); //余数投b板
  pcstotal:=b_pan * b_pcs;
 end
else       //双拼版
 begin
  a_pan:=(tobe_planned div total_pcb) * pan_a;  //已投A板数
  b_pan:=(tobe_planned div total_pcb) * pan_b;  //已投b板数
  pcstotal:= a_pan*A_pcs + b_pan*B_pcs;
  if tobe_planned-pcstotal > 0 then
   begin
    case ttype of
     0:  //混合算化
      begin
       a_pan:=a_pan+ceil(((tobe_planned- pcstotal)/total_pcb)*pan_a);
       pcstotal:= a_pan * A_pcs+b_pan*B_pcs;
       if tobe_planned-pcstotal > 0 then
        begin
         b_pan:=b_pan+ceil((tobe_planned- pcstotal)/B_pcs);
         pcstotal:= a_pan * A_pcs+b_pan*B_pcs;
        end;
      end;
     1: //优先A板
      begin
       a_pan:=a_pan+ceil(((tobe_planned- pcstotal)/A_pcs));
       pcstotal:= a_pan * A_pcs+b_pan*B_pcs;
      end;
     2: //优先B板
      begin
       b_pan:=b_pan+ceil(((tobe_planned- pcstotal)/B_pcs));
       pcstotal:= a_pan * A_pcs+b_pan*B_pcs;
      end;
     3: //最优方案   {}
      begin
       a_pan_mix:=a_pan;
       b_pan_mix:=b_pan;
       a_pan_mix:=a_pan_mix+ceil(((tobe_planned- pcstotal)/total_pcb)*pan_a);
       pcstotal := a_pan_mix*A_pcs + b_pan_mix*b_pcs;
       if tobe_planned-pcstotal > 0 then
        begin
         b_pan_mix:=b_pan_mix+ceil((tobe_planned- pcstotal)/B_pcs);
         pcstotal:= a_pan_mix*A_pcs + b_pan_mix*b_pcs;
        end;
       mix_pcs:= pcstotal;       //混合

       a_pan_firsta:=a_pan;     //已投A板数
       b_pan_firsta:=b_pan;     //已投b板数
       pcstotal:= a_pan_firsta*A_pcs + b_pan_firsta*B_pcs;
       a_pan_firsta:=a_pan_firsta+ceil(((tobe_planned- pcstotal)/A_pcs));
       pcstotal:= a_pan_firsta*A_pcs + b_pan_firsta*B_pcs;
       first_a:= pcstotal;                //优先A

       a_pan_firstb:=a_pan;
       b_pan_firstb:=b_pan;
       pcstotal:= a_pan_firstb*A_pcs + b_pan_firstb*B_pcs;
       b_pan_firstb:=b_pan_firstb+ceil(((tobe_planned- pcstotal)/B_pcs));
       pcstotal:= a_pan_firstb*A_pcs + b_pan_firstb*B_pcs;
       first_b:= pcstotal;                 //优先B

       if mix_pcs < first_a then
        begin
         pcstotal:=mix_pcs;
         a_pan:=a_pan_mix;
         b_pan:=b_pan_mix;
        end
       else
        begin
         pcstotal:=first_a;
         a_pan:=a_pan_firsta;
         b_pan:=b_pan_firsta;
        end;

        if first_b < pcstotal then
        begin
         pcstotal:=first_b;
         a_pan:=a_pan_firstb;
         b_pan:=b_pan_firstb;
        end;
      end;
    end;  //end case
   end;
 end;

 result:=pcstotal;
end;

procedure TForm_salesorder.ComboBox1Change(Sender: TObject);
var
 a_pan,b_pan:integer;
begin
  a_pan:=0;
  b_pan:=0;
  treeview1.Items[0].Selected:=true;
  if strtoint(edit6.Text)>0 then
  edit9.Text:=inttostr(                           //投产数
  self.cacl_totalpcs(combobox1.ItemIndex,strtoint(edit6.Text),a_pan,b_pan));

  if strtoint(edit2.Text)>0 then
  edit12.Text:=Floattostrf(                          //超投率%
   (strtoint(edit9.Text)+RzNumericEdit1.IntValue-strtoint(edit2.Text))/
                    strtoint(edit2.Text)*100,ffFixed,8,2);
  edit13.Text:=Floattostrf(                          //超投面积
   (strtoint(edit9.Text)+RzNumericEdit1.IntValue-strtoint(edit2.Text))*dm.ADS60spell_sq.Value,ffFixed,8,3);

 // edit10.Text:=inttostr(a_pan);
//  edit11.Text:=inttostr(b_pan);
  RzSpinEdit1.IntValue:=a_pan;
  RzSpinEdit2.IntValue:=b_pan;
end;

function TForm_salesorder.cacl_bomqty(node: TTreeNode): Single;
var
 bomqty:Single;
begin
  bomqty:=PTreeValue(node.Data)^.qty_bom / PTreeValue(node.Data)^.QTY_PARENTBOM;
 if node.Parent<>nil then
 repeat
  node:=node.Parent;
  bomqty:=bomqty*PTreeValue(node.Data)^.qty_bom / PTreeValue(node.Data)^.QTY_PARENTBOM;
 until node.Parent=nil;
 result:= bomqty;
end;

function TForm_salesorder.wo_number(cutno: string; pana_or_b: byte;
  total_row, curr_row,pan_b_qty: integer): string;
var
 wo,zero:string;
 len:integer;
begin
len:=Length(inttostr(total_row));
zero:=StringofChar('0',Len-Length(IntToStr(curr_row)));
if pana_or_b=0 then       //A板作业单
 if pan_b_qty > 0 then    //有投B板
  wo:= cutno+'A'+'-'+inttostr(total_row)+'-'+zero+inttostr(curr_row)
 else
  wo:= cutno+'-'+inttostr(total_row)+'-'+zero+inttostr(curr_row)
else               //b板作业单
 wo:= cutno+'B'+'-'+inttostr(total_row)+'-'+zero+inttostr(curr_row);
result:=wo;
end;

function TForm_salesorder.total_tobeplanned: integer;
var
 i:integer;         //待计划数量
begin
result:=0;
for i:=1 to sg2.RowCount-1 do
 begin
  if strtoint(sg2.Cells[7,i])>0 then
  result:=result+strtoint(sg2.Cells[7,i]);
 end;
end;

function TForm_salesorder.total_planned: integer;
var
 i:integer;         //待计划数量
begin
result:=0;
for i:=1 to sg2.RowCount-1 do    //本次计划小于等于待计划
 begin
  if strtoint(sg2.Cells[7,i]) <= strtoint(sg2.Cells[6,i]) then
   result:=result+strtoint(sg2.Cells[7,i])
  else
   result:=result+strtoint(sg2.Cells[6,i]);
 end;
end;

function TForm_salesorder.hypotaxis_so: boolean;
var
 i:integer;     //任一从订单本次计划少于待计划数,且本次计划不等于零返回为TRUE
begin
result:=false;
 for i:=1 to sg2.RowCount-1 do
  begin
   if sg2.Cells[1,i]<>dm.ADS60SALES_ORDER.Value then
   if (strtoint(sg2.Cells[7,i]) < strtoint(sg2.Cells[6,i])) and
      (strtoint(sg2.Cells[7,i]) <> 0) then
    begin
     result:=true;
     break;
    end;
  end;
end;

procedure TForm_salesorder.SG2DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if (ACOL = 0) and (arow > 0) then
    (Sender as TStringGrid).Canvas.TextOut(Rect.Right -
    (Sender as TStringGrid).Canvas.TextWidth(inttostr(arow)) - 2,
     Rect.top + 2, inttostr(arow));
end;

procedure TForm_salesorder.FormActivate(Sender: TObject);
var
 rec_row,noten:integer;

begin
rec_row:=1;
noten:=0;
with Sg2 do
 begin
  cells[0, 0] := '顺序';
  cells[1, 0] := '订单编号';
  cells[2, 0] := '回复交期';
  cells[3, 0] := '订单数量';
  cells[4, 0] := '欠货数量';
  cells[5, 0] := '已计划数';
  cells[6, 0] := '待计划数';
  cells[7, 0] := '本次计划';
  cells[8, 0] := '优先';
  cells[9, 0] := '订单参考';
  cells[10, 0] := '客户订单号';
 end;

  with DM.ADOQuery1 do
   begin
    Close;
    SQL.Clear;
    SQL.Add('select sum(d56.qty_backlog) as qty_backlog  from data0025 d25 inner join data0006 d6 on d25.rkey=d6.bom_ptr');
    SQL.Add(' inner join data0056 d56 on d56.wo_ptr=d6.rkey where  d25.rkey='+dm.ADS60CUST_PART_PTR.AsString);
    Prepared;
    Open;
    edit3.Text := inttostr(FieldByName('qty_backlog').AsInteger);   //在制数
    Close;
   end;

  with DM.ADOQuery1 do
   begin
    Close;
    sql.Text:=
    'SELECT data0060.SALES_ORDER, data0060.SCH_DATE,'+#13+
    'data0060.PARTS_ORDERED,data0097.PO_NUMBER,'+#13+
    'PARTS_ORDERED + PARTS_RETURNED - PARTS_SHIPPED - RETURNED_SHIP AS notenough,'+#13+
    'data0060.QTY_PLANNNED, data0060.TO_BE_PLANNED,'+#13+
    'data0060.P_CODE, data0060.REFERENCE_NUMBER'+#13+
    'FROM  Data0060 inner join data0097'+#13+
    'on data0060.purchase_order_ptr=data0097.rkey'+#13+
    'where data0060.prod_rel=''2'' and'+#13+    //已确认
     'data0060.status=1 and '+#13+              //有效
     'data0060.CUST_PART_PTR='+dm.ADS60CUST_PART_PTR.AsString+#13+  //本厂编号
     'and data0060.so_tp='+inttostr(dm.ADS60.Parameters.ParamValues['sotp']) +#13+ //加工形式
     'and data0060.SpellTogether='+dm.ADS60SpellTogether.AsString+#13+
     'order by data0060.SCH_DATE';
    open;
    sg2.RowCount:=dm.ADOQuery1.RecordCount+1;
   end;

while not dm.ADOQuery1.Eof do
 begin
  sg2.Cells[1,dm.ADOQuery1.RecNo]:=dm.ADOQuery1.fieldbyname('SALES_ORDER').AsString;
  sg2.Cells[2,dm.ADOQuery1.RecNo]:=
  FormatDateTime('yyyy-MM-dd HH:mm:ss',dm.ADOQuery1.fieldbyname('SCH_DATE').AsDateTime);
 // dm.ADOQuery1.fieldbyname('SCH_DATE').AsString;
  sg2.Cells[3,dm.ADOQuery1.RecNo]:=dm.ADOQuery1.fieldbyname('PARTS_ORDERED').AsString;
  sg2.Cells[4,dm.ADOQuery1.RecNo]:=dm.ADOQuery1.fieldbyname('notenough').AsString;
  noten:=noten+dm.ADOQuery1.fieldbyname('notenough').AsInteger;
  sg2.Cells[5,dm.ADOQuery1.RecNo]:=dm.ADOQuery1.fieldbyname('QTY_PLANNNED').AsString;
  sg2.Cells[6,dm.ADOQuery1.RecNo]:=dm.ADOQuery1.fieldbyname('TO_BE_PLANNED').AsString;
  if dm.adoquery1.fieldbyname('SALES_ORDER').asstring=
     dm.ADS60SALES_ORDER.Value then //主订单
   begin
    sg2.Cells[7,dm.ADOQuery1.RecNo]:=dm.ADOQuery1.fieldbyname('TO_BE_PLANNED').AsString;
    rec_row:=dm.ADOQuery1.RecNo;
   end
  else
   sg2.Cells[7,dm.ADOQuery1.RecNo]:='0';  //从订单
  sg2.Cells[8,dm.ADOQuery1.RecNo]:=dm.ADOQuery1.fieldbyname('P_CODE').AsString;
  sg2.Cells[9,dm.ADOQuery1.RecNo]:=dm.ADOQuery1.fieldbyname('REFERENCE_NUMBER').AsString;
  sg2.Cells[10,dm.ADOQuery1.RecNo]:=dm.ADOQuery1.fieldbyname('PO_NUMBER').AsString;
  dm.ADOQuery1.Next;
 end;
 sg2.Row:=rec_row;

//edit4.Text:=inttostr(noten-dm.ADS60QTY_ON_HAND.Value-strtoint(edit3.Text));//订单差数
edit2.Text:=inttostr(self.total_planned());   //待计划数合计
edit5.Text:=inttostr(self.total_tobeplanned());   //本次计划数合计
edit6.Text:=inttostr(ceil(strtoint(edit5.Text)*(1+self.EST_SCRAP*0.01)));//计划数

self.ComboBox1Change(sender);    //计算投产数
adq360.Close;
adq360.Parameters[0].Value:=dm.ADS60SALES_ORDER.Value;
adq360.Open;

 if d25_type<>0 then    //样板
  with dm.ADOQuery1 do
  begin
   close;
   sql.Text:= 'SELECT BALA_DAYS,PPC_CONTROL6  FROM dbo.Data0192';
   open;
   ct_perenct:=fieldbyname('BALA_DAYS').AsFloat;       //样板超投百分比
   PPC_CONTROL6:=fieldbyname('PPC_CONTROL6').AsInteger; //允许合并投产1,Y 0,N
  end
 else
 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:= 'SELECT PPC_control25,PPC_control26,PPC_CONTROL6  FROM dbo.Data0192';
   open;
   ppc26:=fieldbyname('PPC_control26').AsFloat;//10:PPC_CONTROL26 小订单允许超投面积
   ppc25:=fieldbyname('PPC_control25').AsInteger;//  9:PPC_CONTROL25  小订单数面积界定
   PPC_CONTROL6:=fieldbyname('PPC_CONTROL6').AsInteger; //允许合并投产
  end;

  dm.ADOQuery1.Close;

  RefreshEdit;
end;

procedure TForm_salesorder.SG2SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
adq360.Close;
adq360.Parameters[0].Value:=sg2.Cells[1,arow];
adq360.Open;
end;

procedure TForm_salesorder.SG2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  column, row: longint; //右键选择stringgrid控件的方法
begin
 if button = mbright then
  begin
   SG2.MouseToCell(x, y, column, row);
   if row <> 0 then
    begin
     SG2.Row := row;
    end;
  end;
end;

procedure TForm_salesorder.TreeView1Change(Sender: TObject;
  Node: TTreeNode);
begin
 node.SelectedIndex:=4;
 dm.ADO279.Filter:='PRODUCTION_FLAG='+inttostr(PTreeValue(Node.data)^.rkey25);
end;

procedure TForm_salesorder.N2Click(Sender: TObject);
begin
if (PPC_CONTROL6=0) and
   (sg2.Cells[1,sg2.row]<>dm.ADS60SALES_ORDER.Value) then
 begin
  showmsg('程序禁止合并投产',1);
 end
else
 try
 application.CreateForm(TForm_editplanned,Form_editplanned);
 Form_editplanned.Edit3.Text:=sg2.Cells[1,sg2.row];
 Form_editplanned.Edit1.Text:=sg2.Cells[6,sg2.row];
 Form_editplanned.Edit2.Text:=sg2.Cells[7,sg2.row];
 if sg2.Cells[1,sg2.row]=dm.ADS60SALES_ORDER.Value then
  Form_editplanned.host_flag:=true       //主订单标识
 else
  Form_editplanned.host_flag:=false;
 if Form_editplanned.ShowModal=mrok then
  begin
   if (self.hypotaxis_so) and (Form_editplanned.host_flag) and
      (strtoint(Form_editplanned.Edit2.Text) >
       strtoint(Form_editplanned.Edit1.Text)) then
    begin
     showmessage('任一从订单本次计划少于待计划数且不为零,主订单不允许超投');
     exit;
    end;

   if (edit1.Text='超投') and (not Form_editplanned.host_flag) and
      (strtoint(Form_editplanned.Edit2.Text) <
       strtoint(Form_editplanned.Edit1.Text)) and
      (strtoint(Form_editplanned.Edit2.Text)<>0) then
    begin
     showmessage('主订单超投的情况下,从订单要么不计划,要么本次全部计划');
     exit;
    end;

    sg2.Cells[7,sg2.row]:=Form_editplanned.Edit2.Text; //本次计划数
    edit2.Text:=inttostr(self.total_planned);   //待计划数合计
    edit5.Text:=inttostr(self.total_tobeplanned);   //本次计划数合计
    edit6.Text:=inttostr(ceil(strtoint(edit5.Text)*(1+self.EST_SCRAP*0.01)));//计划数

    self.ComboBox1Change(sender);

   if (Form_editplanned.host_flag) and        //主订单
      (strtoint(Form_editplanned.Edit2.Text) >
       strtoint(Form_editplanned.Edit1.Text)) then
    begin
     if self.d25_type=0 then  //如果批量
      begin
       if (StrToFloat(edit2.Text)*dm.ADS60spell_sq.Value <= self.ppc25) and //小订单
          (strtofloat(edit13.Text) < self.ppc26) then   //超投面积小于0.5平米
        begin
         edit1.Text:='未超投';
         edit1.Color:=claqua;
        end
       else
        begin
         edit1.Text:='超投';
         edit1.Color:=clfuchsia;
        end;
      end
     else                     //如果样板
      if strtofloat(edit12.Text) > self.ct_perenct then
       begin
        edit1.Text:='超投';
        edit1.Color:=clfuchsia;
       end
      else
       begin
        edit1.Text:='未超投';
        edit1.Color:=claqua;
       end;
    end
   else
    if (Form_editplanned.host_flag) and
       (strtoint(Form_editplanned.Edit2.Text) <=
        strtoint(Form_editplanned.Edit1.Text)) then
     begin
      edit1.Text:='未超投';
      edit1.Color:=claqua;
     end
    else
     if (not Form_editplanned.host_flag) then
     begin
      if self.d25_type=0 then  //如果批量
       if (StrToFloat(edit2.Text)*dm.ADS60spell_sq.Value <= self.ppc25) and //小订单
          (strtofloat(edit13.Text) < self.ppc26) then   //超投面积小于0.5平米
        begin
         edit1.Text:='未超投';
         edit1.Color:=claqua;
        end
       else
        if self.find_hostct then
        begin
         edit1.Text:='超投';
         edit1.Color:=clfuchsia;
        end;
     end;
  end;
 finally
  Form_editplanned.Free;
 end;

end;

procedure TForm_salesorder.BitBtn1Click(Sender: TObject);
var
 i,i_j:integer;
 //a_pan_qty,b_pan_qty:integer;
 currently_date:tdatetime;
  pcs,prodcount:Integer;
begin
 try
 application.CreateForm(TForm_putprod,Form_putprod);
 dm.aqy04.close;
 dm.aqy04.Open;
 currently_date:=getsystem_date(dm.ADOQuery1,1);

 with Form_putprod do
  begin
   combobox1.ItemIndex:=0;       //订单投产
   edit1.Text:=self.Edit1.Text;  //超投标识
   whouseptr:=self.whouseptr;
   so_number:=dm.ADS60SALES_ORDER.Value;   //主订单
     ikey60:=DM.ADS60rkey.AsString;//Rkey60
     MANU_NUMBER:=DM.ADS60MANU_PART_NUMBER.AsString;//本厂编号   
   CUSTOMER_PTR:=dm.ADS60CUSTOMER_PTR.Value;
   begin_step:=1;
   parts_count:=TreeView1.Items.Count;
   stg1.RowCount:=self.TreeView1.Items.Count+1;

    adq360.Close;
    adq360.Parameters[0].Value:=DM.ADS60SALES_ORDER.AsString;
    adq360.Open;
//    up_qty:=0;



   for i:=1 to self.TreeView1.Items.Count do
    begin
     treeview1.Items[i-1].Selected:=true;
     pcs:=0;
     prodcount:=StrToInt(SG2.Cells[5,get_mainso(dm.ADS60SALES_ORDER.AsString)]);

     stg1.Cells[0,i]:=dm.aqy04SEED_VALUE.Value+'-'+inttostr(i-1);  //配料单号　
     stg1.Cells[1,i]:=treeview1.Items[i-1].Text;  //本厂编号

     stg1.Cells[2,i]:=FormatDateTime('yyyy-MM-dd HH:mm:ss',dm.ADS60compl_date.Value);  //完工日期

     stg1.Cells[3,i]:=inttostr(ceil(strtoint(edit2.Text)*        //待计划数
                               cacl_bomqty(treeview1.Items[i-1])));
     stg1.Cells[4,i]:=inttostr(ceil(strtoint(edit6.Text)*        //计划数
                               cacl_bomqty(treeview1.Items[i-1])));
     stg1.Cells[5,i]:=Edit9.Text;       //投产数
{    a_pan_qty:=0;
     b_pan_qty:=0;
     stg1.Cells[5,i]:=inttostr(   //投产数在循环中投产每一层都单独计算
     self.cacl_totalpcs(self.ComboBox1.ItemIndex,strtoint(stg1.Cells[4,i]),a_pan_qty,b_pan_qty));

     stg1.Cells[6,i]:=inttostr(a_pan_qty);     //投A板
     stg1.Cells[7,i]:=inttostr(b_pan_qty);     //投B板
 }
     stg1.Cells[6,i]:=RzSpinEdit1.Text;  //inttostr(a_pan_qty);  //投A板
     stg1.Cells[7,i]:=RzSpinEdit2.Text;  //inttostr(b_pan_qty);  //投B板

     stg1.Cells[8,i]:=Edit12.Text;       //超投率%

     //Floattostrf((strtoint(stg1.Cells[5,i])-strtoint(stg1.Cells[3,i]))/
                        //              strtoint(stg1.Cells[3,i])*100,ffFixed,8,2);   
     stg1.Cells[10,i]:=PTreeValue(treeview1.Items[i-1].data)^.analysis_3;  //大料规格
     stg1.Cells[11,i]:=inttostr(PTreeValue(treeview1.Items[i-1].data)^.rkey25);
     
     stg1.Cells[12,i]:=self.find_pcs_qty('3');;           //A板PCS数
     stg1.Cells[13,i]:=self.find_pcs_qty('4');;           //B板PCS数
     stg1.Cells[14,i]:=self.find_pcs_qty('6')+'mm * '+
                       self.find_pcs_qty('7')+'mm';       //A板尺寸

     stg1.Cells[15,i]:=self.find_pcs_qty('8')+'mm * '+
                       self.find_pcs_qty('9')+'mm';       //B板尺寸

     stg1.cells[16,i]:=IntToStr(RzNumericEdit1.IntValue);  //'引用库存';

     dm.ADOQuery1.close;
     dm.ADOQuery1.sql.Text:=
      'SELECT  TOP 100 PERCENT Data0034.DEPT_CODE,Data0017.INV_PART_NUMBER,'+#13+
      'Data0017.INV_NAME, Data0017.INV_DESCRIPTION,'+#13+
      'Data0026.ROUTE_STEP_NO, Data0026.QTY_BOM,'+#13+
      'Data0026.INVENTORY_PTR, Data0026.DEPT_PTR, Data0026.DOC_FLAG,'+#13+
      'Data0002.UNIT_NAME,data0017.quan_on_hand'+#13+
      'FROM         dbo.Data0026 INNER JOIN'+#13+
      'dbo.Data0017 ON dbo.Data0026.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'+#13+
      'dbo.Data0034 ON Data0026.DEPT_PTR = dbo.Data0034.RKEY INNER JOIN'+#13+
      'dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY'+#13+
      'where Data0026.MANU_BOM_PTR='+ stg1.Cells[11,i]+#13+
      'and Data0026.DOC_FLAG=''Y'''+#13+
      'order by  Data0026.ROUTE_STEP_NO';
     dm.ADOQuery1.open;

     while not dm.ADOQuery1.Eof do
      begin
       if dm.ADOQuery1.RecNo=1 then
        begin
         stg2.Cells[0,stg2.RowCount-1]:=stg1.Cells[0,i];
         stg2.Cells[1,stg2.RowCount-1]:=stg1.Cells[1,i];
        end;
       if stg2.Cells[14,stg2.RowCount-2]<>
          dm.ADOQuery1.fieldbyname('DEPT_PTR').AsString then
        stg2.Cells[2,stg2.RowCount-1]:=dm.ADOQuery1.fieldbyname('DEPT_CODE').AsString;
       stg2.Cells[3,stg2.RowCount-1]:=dm.ADOQuery1.fieldbyname('ROUTE_STEP_NO').AsString;

       stg2.Cells[4,stg2.RowCount-1]:=dm.ADOQuery1.fieldbyname('INV_PART_NUMBER').AsString;
       stg2.Cells[5,stg2.RowCount-1]:=dm.ADOQuery1.fieldbyname('INV_NAME').AsString;
       stg2.Cells[6,stg2.RowCount-1]:=dm.ADOQuery1.fieldbyname('INV_DESCRIPTION').AsString;
       stg2.Cells[7,stg2.RowCount-1]:=dm.ADOQuery1.fieldbyname('UNIT_NAME').AsString;
       stg2.Cells[8,stg2.RowCount-1]:= dm.ADOQuery1.fieldbyname('quan_on_hand').AsString;
       stg2.Cells[9,stg2.RowCount-1]:=
        format('%.8f',[strtofloat(stg1.Cells[5,i])*dm.ADOQuery1.fieldbyname('QTY_BOM').AsFloat]);
       stg2.Cells[10,stg2.RowCount-1]:='标准';
       if  dm.ADOQuery1.fieldbyname('DOC_FLAG').AsString='Y' then
        stg2.Cells[11,stg2.RowCount-1]:=dm.ADOQuery1.fieldbyname('DOC_FLAG').AsString
       else
        stg2.Cells[11,stg2.RowCount-1]:='N';

       stg2.Cells[13,stg2.RowCount-1]:=stg1.Cells[11,i];  //rkey25
       stg2.Cells[14,stg2.RowCount-1]:=dm.ADOQuery1.fieldbyname('DEPT_PTR').AsString;
       stg2.Cells[15,stg2.RowCount-1]:=dm.ADOQuery1.fieldbyname('INVENTORY_PTR').AsString;

       stg2.RowCount:=stg2.RowCount+1;
       dm.ADOQuery1.Next;
      end;  //end with dm.adoquery1 加载BOM

//     for i_j:=1 to ceil(a_pan_qty/PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE) do
    for i_j:=1 to ceil(RzSpinEdit1.IntValue/PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE) do
      begin
       stg3.Cells[10,stg3.RowCount-1]:= stg1.Cells[11,i];
       if stg3.Cells[10,stg3.RowCount-1]<> stg3.Cells[10,stg3.RowCount-2] then
        begin
         stg3.Cells[0,stg3.RowCount-1]:=stg1.Cells[0,i];
         stg3.Cells[1,stg3.RowCount-1]:=stg1.Cells[1,i];
        end;

       stg3.Cells[2,stg3.RowCount-1]:=wo_number(stg1.Cells[0,i],0,      //作业单号
          ceil(RzSpinEdit1.IntValue/PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE),i_j,RzSpinEdit2.IntValue);

       stg3.Cells[5,stg3.RowCount-1]:=stg1.Cells[12,i];  //A板PCS数
       if i_j < ceil(RzSpinEdit1.IntValue/PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE) then
        begin
         stg3.Cells[4,stg3.RowCount-1]:= inttostr(PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE);
         stg3.Cells[3,stg3.RowCount-1]:= inttostr(strtoint(stg3.Cells[4,stg3.RowCount-1])*
                                         strtoint(stg3.Cells[5,stg3.RowCount-1]));
        end
       else
        begin
          if RzSpinEdit1.IntValue mod PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE = 0 then
           stg3.Cells[4,stg3.RowCount-1]:= inttostr(PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE)
          else
           stg3.Cells[4,stg3.RowCount-1]:=
             inttostr(RzSpinEdit1.IntValue mod PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE);
           stg3.Cells[3,stg3.RowCount-1]:= inttostr(strtoint(stg3.Cells[4,stg3.RowCount-1])*
                                                    strtoint(stg3.Cells[5,stg3.RowCount-1]));
        end;
//       stg3.Cells[6,stg3.RowCount-1] := stg1.Cells[2,i];  //完工日期
          pcs:=pcs + strtoint(stg3.Cells[4,stg3.RowCount-1])*strtoint(stg3.Cells[5,stg3.RowCount-1]);
         stg3.Cells[6,stg3.RowCount-1] := getschdate(prodcount,pcs);
       stg3.Cells[7,stg3.RowCount-1] := self.find_pcs_qty('6');
       stg3.Cells[8,stg3.RowCount-1] := self.find_pcs_qty('7');
       stg3.Cells[9,stg3.RowCount-1] := stg1.Cells[14,i];  //APNL尺寸

       stg3.Cells[11,stg3.RowCount-1]:= '0';
         stg3.Cells[12,stg3.RowCount-1]:= cbb1.Items[cbb1.itemindex];
         stg3.Cells[13,stg3.RowCount-1]:= IntToStr(Integer(cbb1.Items.Objects[cbb1.ItemIndex]));
       stg3.RowCount:=stg3.RowCount+1;
      end;                         //加载a作业单

       adq360.First;
       pcs:=0;
       prodcount:=StrToInt(SG2.Cells[6,get_mainso(DM.ADS60SALES_ORDER.AsString)]);

     for i_j:=1 to  ceil(RzSpinEdit2.IntValue/PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE) do
      begin
       stg3.Cells[10,stg3.RowCount-1]:= stg1.Cells[11,i];  //rkey25
       if stg3.Cells[10,stg3.RowCount-1]<> stg3.Cells[10,stg3.RowCount-2] then
        begin
         stg3.Cells[0,stg3.RowCount-1]:=stg1.Cells[0,i];   //配料单号
         stg3.Cells[1,stg3.RowCount-1]:=stg1.Cells[1,i];   //本厂编号
        end;
       stg3.Cells[2,stg3.RowCount-1]:=self.wo_number(stg1.Cells[0,i],1, //作业单号
               ceil(RzSpinEdit2.IntValue/PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE),i_j,RzSpinEdit2.IntValue);

       stg3.Cells[5,stg3.RowCount-1]:=stg1.Cells[13,i];  //pcs/bpnl

       if i_j < ceil(RzSpinEdit2.IntValue/PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE) then
        begin
         stg3.Cells[4,stg3.RowCount-1]:= inttostr(PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE);
         stg3.Cells[3,stg3.RowCount-1]:= inttostr(strtoint(stg3.Cells[4,stg3.RowCount-1])*
                                         strtoint(stg3.Cells[5,stg3.RowCount-1]));
        end
       else
        begin
         if RzSpinEdit2.IntValue mod PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE=0 then
          stg3.Cells[4,stg3.RowCount-1]:= inttostr(PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE)
         else
          stg3.Cells[4,stg3.RowCount-1]:=
           inttostr(RzSpinEdit2.IntValue mod PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE);

         stg3.Cells[3,stg3.RowCount-1]:= inttostr(strtoint(stg3.Cells[4,stg3.RowCount-1])*
                                                  strtoint(stg3.Cells[5,stg3.RowCount-1]));
        end;
//       stg3.Cells[6,stg3.RowCount-1] := stg1.Cells[2,i];  //完工日期
          pcs:=pcs + strtoint(stg3.Cells[4,stg3.RowCount-1])*strtoint(stg3.Cells[5,stg3.RowCount-1]);
         stg3.Cells[6,stg3.RowCount-1] := getschdate(prodcount,pcs);
       stg3.Cells[7,stg3.RowCount-1] := self.find_pcs_qty('8');
       stg3.Cells[8,stg3.RowCount-1] := self.find_pcs_qty('9');
       stg3.Cells[9,stg3.RowCount-1] :=  stg1.Cells[15,i];  //BPNL尺寸
       stg3.Cells[11,stg3.RowCount-1]:= '1';
         stg3.Cells[12,stg3.RowCount-1]:= cbb1.Items[cbb1.itemindex];
         stg3.Cells[13,stg3.RowCount-1]:= IntToStr(Integer(cbb1.Items.Objects[cbb1.ItemIndex]));
       stg3.RowCount:=stg3.RowCount+1;
      end;        //end for i_j加载b作业单

    end; //end for i
  end;   //end with putprod

 if Form_putprod.ShowModal=mrok then
  begin
  try
   for i:=1 to  sg2.RowCount-1 do
    with dm.ADOQuery1 do
     begin
      close;
      sql.Text:='select prod_rel,to_be_planned,qty_plannned,issued_qty'+#13+
                 'from data0060 where sales_order='+quotedstr(sg2.Cells[1,i]);
      open;
      edit;
      if StrToIntDef(sg2.Cells[7,i],0)>0 then
       begin
        fieldbyname('to_be_planned').AsInteger:=fieldbyname('to_be_planned').AsInteger-
              strtoint(sg2.Cells[7,i]);
        if fieldbyname('to_be_planned').AsInteger<=0 then
         begin
          fieldbyname('to_be_planned').AsInteger:=0;
          fieldbyname('prod_rel').AsString:='3';
         end;

        with dm.ADOQuery2 do  // 记录投产的销售订单明细表535 13.01.07
         begin
          close;
          sql.Text:='SELECT  CUT_NO,SALES_ORDER,QTY_PLANNED '+
                    'FROM  Data0535 where CUT_NO is null';
          open;
          if strtoint(sg2.Cells[7,i])>strtoint(sg2.Cells[6,i]) then //本次超投
           dm.ADOQuery2.AppendRecord([Form_putprod.stg1.Cells[0,1],
                                    sg2.Cells[1,i],sg2.Cells[6,i]])
          else
           dm.ADOQuery2.AppendRecord([Form_putprod.stg1.Cells[0,1],
                                    sg2.Cells[1,i],sg2.Cells[7,i]]);
         end;
       end;

      if sg2.Cells[1,i]=dm.ADS60SALES_ORDER.Value then  //主订单
       begin
        fieldbyname('qty_plannned').AsInteger:=fieldbyname('qty_plannned').AsInteger+
                                                strtoint(edit6.Text);
        fieldbyname('issued_qty').AsInteger:=fieldbyname('issued_qty').AsInteger+
                                                strtoint(edit9.Text);
       end;
      post;
     end;

   dm.update_25lot(dm.ADS60CUST_PART_PTR.Value);
   if dm.ADOConnection1.InTransaction then
   dm.ADOConnection1.CommitTrans;
   self.ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
  end;
 finally
  Form_putprod.Free;
 end;

end;



function TForm_salesorder.find_hostct: boolean;
var
 i:integer;                 //判断主订单是否超投
begin
result:=false;
 for i:=1 to sg2.RowCount-1 do
 if sg2.Cells[1,i]=dm.ADS60SALES_ORDER.Value then
  begin
   if strtoint(sg2.Cells[7,i])>strtoint(sg2.Cells[6,i]) then
   result:=true;
   break;
  end;
end;

procedure TForm_salesorder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if not TreeView1.Items[0].Selected then
  TreeView1.Items[0].Selected:=true;
 if assigned(qq) then qq:= nil;
end;

procedure TForm_salesorder.SpeedButton1Click(Sender: TObject);
begin
  try
    dm.ADOConnection1.BeginTrans;
    Application.CreateForm(TfrmQnty,frmQnty);
    if frmQnty.ShowModal=mrok then
    begin
      RefreshEdit;
      if dm.ADS60parts_margin.AsFloat-qq[2].QTY_ON_HAND<0 then
      begin
        ShowMessage('绑定数不能大于本订单欠货数');
        if dm.ADOConnection1.InTransaction then dm.ADOConnection1.RollbackTrans;
        RefreshEdit;
      end
      else
      begin
        if dm.ADOConnection1.InTransaction then
          dm.ADOConnection1.CommitTrans;
      end;
    end
    else
    begin
      if dm.ADOConnection1.InTransaction then dm.ADOConnection1.RollbackTrans;
    end;
  finally
    frmQnty.Free;
  end;
end;

procedure TForm_salesorder.RefreshEdit;
  function calcQnty(PART_NUM, SALES_ORD: string): Boolean;  // 0已绑定订单数; 1未绑定订单数; 2本订单绑定数
  begin
    Result:= True;
    try
      SetLength(qq,3);
      qq[0].MANU_PART_NUMBER:= '';
      qq[1].MANU_PART_NUMBER:= '';
      qq[2].MANU_PART_NUMBER:= '';
      qq[0].SALES_ORDER:= '';
      qq[1].SALES_ORDER:= '';
      qq[2].SALES_ORDER:= '';
      qq[0].QTY_ON_HAND:= 0;
      qq[1].QTY_ON_HAND:= 0;
      qq[2].QTY_ON_HAND:= 0;
      if not dm.aqQnty.Active then Exit;
      dm.aqQnty.First;
      while not dm.aqQnty.Eof do
      begin
        if dm.aqQnty.FieldByName('MANU_PART_NUMBER').AsString = PART_NUM then
        begin
          qq[0].MANU_PART_NUMBER:= dm.aqQnty.FieldByName('MANU_PART_NUMBER').AsString;
          qq[1].MANU_PART_NUMBER:= dm.aqQnty.FieldByName('MANU_PART_NUMBER').AsString;
          qq[2].MANU_PART_NUMBER:= dm.aqQnty.FieldByName('MANU_PART_NUMBER').AsString;
          if Trim(dm.aqQnty.FieldByName('SALES_ORDER').AsString) <> SALES_ORD then
          begin
            if Trim(dm.aqQnty.FieldByName('SALES_ORDER').AsString) <> '' then
            begin
              qq[0].SALES_ORDER:= 'NOT_NULL';
              qq[0].QTY_ON_HAND:= qq[0].QTY_ON_HAND+dm.aqQnty.FieldByName('QTY_ON_HAND').AsFloat;  //已绑定订单数
            end
            else
            begin
              qq[1].SALES_ORDER:= 'NULL';
              qq[1].QTY_ON_HAND:= qq[1].QTY_ON_HAND+dm.aqQnty.FieldByName('QTY_ON_HAND').AsFloat;  //未绑定订单数
            end;
          end;
          if Trim(dm.aqQnty.FieldByName('SALES_ORDER').AsString) = SALES_ORD then
          begin
            qq[2].SALES_ORDER:= dm.aqQnty.FieldByName('SALES_ORDER').AsString;
            qq[2].QTY_ON_HAND:= qq[2].QTY_ON_HAND+dm.aqQnty.FieldByName('QTY_ON_HAND').AsFloat;  //本订单绑定数
            qq[0].QTY_ON_HAND:= qq[0].QTY_ON_HAND+dm.aqQnty.FieldByName('QTY_ON_HAND').AsFloat;  //已绑定订单数
          end;
        end;
        dm.aqQnty.Next;
      end;
    except
      Result:= False;
    end;
  end;
begin
  with dm.aqQnty do
  begin
    Close;
    Parameters.ParamByName('MANU_PART_NUMBER').Value:= dm.ADS60MANU_PART_NUMBER.AsString;
    Open;
  end;
  if calcQnty(dm.ADS60MANU_PART_NUMBER.AsString, dm.ADS60SALES_ORDER.AsString) then
  begin
    Edit14.Text:= FloattoStr(qq[0].QTY_ON_HAND);  //已绑定订单数
    Edit15.Text:= FloattoStr(qq[1].QTY_ON_HAND);  //未绑定订单数
    Edit16.Text:= FloattoStr(qq[2].QTY_ON_HAND);  //本订单绑定数
    Edit4.Text:= FloattoStr(dm.ADS60parts_margin.AsFloat-qq[2].QTY_ON_HAND);  //订单差数
  end;
end;

procedure TForm_salesorder.RzSpinEdit1Changing(Sender: TObject;
  NewValue: Extended; var AllowChange: Boolean);
begin
if StrToInt(Edit7.Text)=0 then AllowChange:=false;
end;

procedure TForm_salesorder.RzSpinEdit2Changing(Sender: TObject;
  NewValue: Extended; var AllowChange: Boolean);
begin
if StrToInt(Edit8.Text)=0 then AllowChange:=false;
end;

procedure TForm_salesorder.RzSpinEdit1Change(Sender: TObject);
begin
 Edit9.Text:=
 IntToStr(StrToInt(Edit7.Text)*RzSpinEdit1.IntValue+
 StrToInt(Edit8.Text)*RzSpinEdit2.IntValue);
  if strtoint(edit2.Text)>0 then
  edit12.Text:=Floattostrf(                          //超投率%
   (strtoint(edit9.Text)+RzNumericEdit1.IntValue-strtoint(edit2.Text))/
                    strtoint(edit2.Text)*100,ffFixed,8,2);
  edit13.Text:=Floattostrf(                          //超投面积
   (strtoint(edit9.Text)+RzNumericEdit1.IntValue-strtoint(edit2.Text))*
   dm.ADS60spell_sq.Value,ffFixed,8,3);

end;

procedure TForm_salesorder.RzSpinEdit1Exit(Sender: TObject);
begin
// if StrToInt(Edit9.Text)< StrToInt(Edit6.Text) then
 if (RzSpinEdit1.IntValue=0) and (RzSpinEdit2.IntValue=0) then
 begin
   (Sender as TRzSpinEdit).SetFocus;
   ShowMsg('投产数量不能为零!',1);
 end;
end;

procedure TForm_salesorder.RzNumericEdit1Change(Sender: TObject);
begin
  if strtoint(edit2.Text)>0 then
  edit12.Text:=Floattostrf(                          //超投率%
   (strtoint(edit9.Text)+RzNumericEdit1.IntValue-strtoint(edit2.Text))/
                    strtoint(edit2.Text)*100,ffFixed,8,2);
  edit13.Text:=Floattostrf(                          //超投面积
   (strtoint(edit9.Text)+RzNumericEdit1.IntValue-strtoint(edit2.Text))*
     dm.ADS60spell_sq.Value,ffFixed,8,3);
end;

function TForm_salesorder.getschdate(var prodcount, pcs: Integer): string;
var
  i:Integer;
begin
  if prodcount>0 then
  begin
    while prodcount > adq360quantity.AsInteger do
    begin
     prodcount:=prodcount - adq360quantity.AsInteger;
     if not adq360.eof then adq360.Next;
    end;
    if pcs + prodcount > adq360quantity.AsInteger then
    begin
      Result:=adq360sch_date.AsString;
      pcs:=pcs + prodcount - adq360quantity.AsInteger;
      prodcount:=0;
      if not adq360.eof then adq360.Next;
    end
    else  Result:= adq360sch_date.AsString;
  end
  else
  begin
    if pcs > adq360quantity.AsInteger then
    begin
      Result:=adq360sch_date.AsString;
      pcs:=pcs - adq360quantity.AsInteger;
      if not adq360.eof then adq360.Next;
//      while pcs > adq360quantity.AsInteger do
//      begin
//        pcs:=pcs - adq360quantity.AsInteger;
//        if not adq360.eof then adq360.Next;
//      end;
    end
    else Result:= adq360sch_date.AsString;
  end;
end;

function TForm_salesorder.get_mainso(so_order: string): Integer;
var
  i:Integer;
begin
  for i:=1 to SG2.RowCount-1 do
  begin
    if so_order = SG2.Cells[1,i]
    then Result:=i;
  end;
end;

end.
