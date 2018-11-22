unit bomview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, ExtCtrls, StdCtrls, Buttons, ImgList, DB, ADODB,
  math, Menus, DBGrids;

type
  PTreeValue=^TTreeValue;

  TTreeValue=record
  rkey25:integer;
  shelf_life:integer;
  qty_bom:integer;
  QTY_PARENTBOM:integer;
  OPT_LOT_SIZE:integer;
  analysis_3:string;
//  PARENT_PTR:Integer;
 end;


type
  TForm_bomview = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    TreeView1: TTreeView;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    Label11: TLabel;
    Label13: TLabel;
    Label18: TLabel;
    Label12: TLabel;
    ImageList1: TImageList;
    stg1: TStringGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label2: TLabel;
    Edit6: TEdit;
    BitBtn3: TBitBtn;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    rkey15: TLabel;
    SpeedButton1: TSpeedButton;
    Panel4: TPanel;
    Label5: TLabel;
    dtpk1: TDateTimePicker;
    Label6: TLabel;
    ComboBox2: TComboBox;
    Label8: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    ComboBox3: TComboBox;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Label4: TLabel;
    Edit12: TEdit;
    Label16: TLabel;
    Edit5: TEdit;
    Label17: TLabel;
    Edit11: TEdit;
    Label15: TLabel;
    Edit13: TEdit;
    rkey0034: TLabel;
    SpeedButton2: TSpeedButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Lal_sostatus: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    spell_sq: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Edit14: TEdit;
    Label25: TLabel;
    btn3: TBitBtn;
    Label26: TLabel;
    Label27: TLabel;
    cbb1: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure stg1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure stg1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure stg1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox2Change(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure TreeView1Changing(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure BitBtn1Enter(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    ct_perenct:double;  //样品超投率%
    EST_SCRAP:double;   //产品报废率%
    d25_type:byte;  //量产/样板
    rkey34:Tstringlist;
    procedure get_treedate(rkey25: integer;treeview:Ttreeview);
    procedure add_deptcode(rkey25:integer);
    function wo_number(cutno: string; pana_or_b: byte;
     total_row, curr_row,pan_b_qty: integer): string;
    function cacl_totalpcs(ttype: byte; tobe_planned: integer;
     var a_pan, b_pan: integer): integer;
    function cacl_bomqty(node: TTreeNode): Single;
    procedure append_279(rkey25:integer);
    function find_error():boolean;
    function find_pcs_qty(spec_rkey:string):string;
    function get_EST_SCRAP_lmt(rkey25,rkey15:integer):Double;
    function Calc_pcs_sq(Arkey25:Integer):Double;

  public
    { Public declarations }
   rkey25,rkey0015,rkey414,CUSTOMER_PTR:integer;    //本厂编号 ,工厂代码,mrb代码,客户代码
   sales_order:string;
    procedure LoadPri();
  end;

var
  Form_bomview: TForm_bomview;

implementation

uses damo,common, salesorder_planned, putprod,
  warehouse,Pick_Item_Single ,ConstVar, MIStepFrm;

{$R *.dfm}
procedure TForm_bomview.append_279(rkey25:integer);
begin
with dm.ADOQuery4 do
 begin
  close;
  sql.Text:=
  'SELECT TOP 100 PERCENT Data0278.SPEC_RKEY,'+#13+
  'Data0279.SOURCE_PTR,Data0279.PARAMETER_VALUE'+#13+
  'FROM   dbo.Data0278 INNER JOIN'+#13+
  'dbo.Data0279 ON dbo.Data0278.RKEY = dbo.Data0279.PARAMETER_PTR'+#13+
  'WHERE (dbo.Data0278.SPEC_RKEY IN (''1'', ''2'', ''3'', ''4'','+#13+
  '''5'', ''6'', ''7'', ''8'', ''9'', ''P'')) AND'+#13+
  '(dbo.Data0279.SOURCE_PTR ='+inttostr(rkey25) +') AND'+#13+
  '(dbo.Data0279.IES_PROD = 1)'+#13+
  'ORDER BY dbo.Data0279.IES_CRP';       //'P'为大料PCS总数
  open;
 end;
 while not dm.ADOQuery4.Eof do   //加载全局开料参数
 begin
  dm.ADO279.AppendRecord([dm.ADOQuery4.fieldbyname('PARAMETER_VALUE').AsString,
                          dm.ADOQuery4.fieldbyname('SOURCE_PTR').AsInteger,
                          trim(dm.ADOQuery4.fieldbyname('SPEC_RKEY').AsString)]);
  dm.ADOQuery4.Next;
 end;
end;

function TForm_bomview.cacl_bomqty(node: TTreeNode): Single;
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

function TForm_bomview.wo_number(cutno: string; pana_or_b: byte;
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

procedure TForm_bomview.get_treedate(rkey25: integer;treeview:Ttreeview);
var
 node:ttreenode;   //treeview控件的节点变量
 rkey0025:PTreeValue;
 LNodeArr:array of TTreeNode;
 i,j:Integer;
begin
  dm.ADO279.Filter:='';
  DM.ADO279.First;
  WHILE not dm.ADO279.Eof do dm.ADO279.Delete;

  with dm.ADOQuery1 do
  begin
    close;
    sql.Text:=' ;with CTE(rkey,PARENT_PTR,MANU_PART_NUMBER,qty_bom,shelf_life,analysis_code_3,ttype,QTY_PARENTBOM,OPT_LOT_SIZE,lv) as    ' + #13+
              '(    ' + #13+
              '  select rkey,PARENT_PTR,MANU_PART_NUMBER,qty_bom,shelf_life,analysis_code_3,ttype,QTY_PARENTBOM,OPT_LOT_SIZE,0  '+ #13+
              '  from data0025 where rkey='+inttostr(rkey25) + #13+
              '  UNION ALL  '+ #13+
              '  select d25.rkey,d25.PARENT_PTR,d25.MANU_PART_NUMBER,d25.qty_bom,d25.shelf_life,d25.analysis_code_3,d25.ttype,d25.QTY_PARENTBOM,d25.OPT_LOT_SIZE,cte.lv+1 ' + #13+
              '  from data0025 d25 INNER JOIN CTE on	d25.parent_ptr=CTE.rkey ' + #13+
              ')  ' + #13+
              ' select * from CTE order by lv ';
       open;
    if not IsEmpty then
    begin
      j:=0;
      d25_type := fieldbyname('ttype').AsInteger;        // PTreeValue(Node.data)^.rkey25
      while not Eof do
      begin
        new(rkey0025);
        rkey0025.rkey25 := fieldvalues['rkey'];
        rkey0025.shelf_life := fieldbyname('shelf_life').AsInteger;     //生产周期
        rkey0025.qty_bom := fieldbyname('qty_bom').AsInteger;           //压合比例分子内层PCS
        rkey0025.QTY_PARENTBOM:=fieldbyname('QTY_PARENTBOM').AsInteger;  //相当于压合比例分母外层PCS数
        rkey0025.analysis_3 := fieldbyname('analysis_code_3').AsString; //大料规格
        rkey0025.OPT_LOT_SIZE := fieldbyname('OPT_LOT_SIZE').AsInteger;  //最佳流转批量
//        rkey0025.PARENT_PTR:= fieldbyname('PARENT_PTR').AsInteger;   //父亲
        if fieldbyname('PARENT_PTR').AsInteger = 0 then
          node := treeview.Items.AddObject
          (nil,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025) //增加顶层节点
        else
        begin
          for i:=0 to Length(LNodeArr)-1 do
          begin
            if PTreeValue(LNodeArr[i].data)^.rkey25 = fieldbyname('PARENT_PTR').AsInteger  then
            begin
              node := treeview.Items.AddChildObject
              (LNodeArr[i],fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
              Break;
            end;
          end;
        end;
        SetLength(LNodeArr,Length(LNodeArr) + 1);
        LNodeArr[j]:= node;
        j:=j + 1;
        node.ImageIndex:= fieldbyname('lv').AsInteger;  //为节点定义图画
        self.append_279(rkey0025.rkey25);
        Next;
      end;
    end;
  end;



////
////with dm.ADOQuery1 do
//// begin
////  close;
////  sql.Text:=
////  'select rkey,MANU_PART_NUMBER,qty_bom,shelf_life,analysis_code_3,ttype,QTY_PARENTBOM,'+
////   'OPT_LOT_SIZE from data0025 where rkey='+inttostr(rkey25);
////  open;
////  new(rkey0025);
////  d25_type := fieldbyname('ttype').AsInteger;
////  rkey0025.rkey25 := fieldvalues['rkey'];
////  rkey0025.shelf_life := fieldbyname('shelf_life').AsInteger;     //生产周期
////  rkey0025.qty_bom := fieldbyname('qty_bom').AsInteger;           //压合比例分子内层PCS
////  rkey0025.QTY_PARENTBOM:=fieldbyname('QTY_PARENTBOM').AsInteger;  //相当于压合比例分母外层PCS数
////  rkey0025.analysis_3 := fieldbyname('analysis_code_3').AsString; //大料规格
////  rkey0025.OPT_LOT_SIZE := fieldbyname('OPT_LOT_SIZE').AsInteger;  //最佳流转批量
////  node := treeview.Items.AddObject
////  (nil,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025); //增加顶层节点
////  node.ImageIndex:=0;  //为第一层节点定义图画
////  self.append_279(rkey25);
//// end;
//////
//////with dm.ADOQuery1 do
////// begin
//////  close;
//////  sql.Text:=
//////  'select rkey,MANU_PART_NUMBER,qty_bom,shelf_life,analysis_code_3,QTY_PARENTBOM,'+
//////   'OPT_LOT_SIZE from data0025 where parent_ptr='+ inttostr(rkey25);
//////  open;
//////  while not dm.ADOQuery1.Eof do
//////  begin
//////   new(rkey0025);
//////   rkey0025.rkey25:= fieldvalues['rkey'];
//////   rkey0025.shelf_life:=fieldbyname('shelf_life').AsInteger;
//////   rkey0025.qty_bom:= fieldbyname('qty_bom').AsInteger;
//////   rkey0025.QTY_PARENTBOM:=fieldbyname('QTY_PARENTBOM').AsInteger;
//////   rkey0025.analysis_3:=fieldbyname('analysis_code_3').AsString;
//////   rkey0025.OPT_LOT_SIZE := fieldbyname('OPT_LOT_SIZE').AsInteger;  //最佳流转批量
//////   node:=treeview.Items.AddChildObject
//////      (node,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
//////   node.ImageIndex := 1;
//////   self.append_279(rkey0025.rkey25);
//////   with dm.ADOQuery2 do
//////    begin
//////     close;
//////     sql.Text:=
//////     'select rkey,MANU_PART_NUMBER,qty_bom,shelf_life,analysis_code_3,QTY_PARENTBOM,'+
//////     'OPT_LOT_SIZE from data0025 where parent_ptr='+dm.ADOQuery1.fieldbyname('rkey').AsString;
//////     open;
//////     while not dm.ADOQuery2.Eof do
//////     begin
//////      new(rkey0025);
//////      rkey0025.rkey25:= fieldvalues['rkey'];
//////      rkey0025.shelf_life:=fieldbyname('shelf_life').AsInteger;
//////      rkey0025.qty_bom:= fieldbyname('qty_bom').AsInteger;
//////      rkey0025.QTY_PARENTBOM:=fieldbyname('QTY_PARENTBOM').AsInteger;
//////      rkey0025.analysis_3:=fieldbyname('analysis_code_3').AsString;
//////      rkey0025.OPT_LOT_SIZE := fieldbyname('OPT_LOT_SIZE').AsInteger;  //最佳流转批量
//////      node:=treeview.Items.AddChildObject
//////       (node, dm.ADOQuery2.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
//////      node.ImageIndex := 2;
//////      self.append_279(rkey0025.rkey25);
////       with dm.ADOQuery3 do
////        begin
////         close;
////         sql.Text:=
////         'select rkey,MANU_PART_NUMBER,qty_bom,shelf_life,analysis_code_3,QTY_PARENTBOM,'+
////         'OPT_LOT_SIZE from data0025 where parent_ptr='+dm.ADOQuery2.fieldbyname('rkey').AsString;
////         open;
////         while not dm.ADOQuery3.Eof do
////         begin
////          new(rkey0025);
////          rkey0025.rkey25:= fieldvalues['rkey'];
////          rkey0025.shelf_life:=fieldbyname('shelf_life').AsInteger;
////          rkey0025.qty_bom:= fieldbyname('qty_bom').AsInteger;
////          rkey0025.QTY_PARENTBOM:=fieldbyname('QTY_PARENTBOM').AsInteger;
////          rkey0025.analysis_3:=fieldbyname('analysis_code_3').AsString;
////          rkey0025.OPT_LOT_SIZE := fieldbyname('OPT_LOT_SIZE').AsInteger;  //最佳流转批量
////          node:=treeview.Items.AddChildObject
////           (node, dm.ADOQuery3.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
////          node.ImageIndex := 3;
////          self.append_279(rkey0025.rkey25);
////          node:=node.Parent;
////          dm.ADOQuery3.Next;
////         end;
////        end;
//////
//////      node:=node.Parent;
//////      dm.ADOQuery2.Next;
//////     end;
//////    end;
//////   node:=node.Parent; //节点指向其父节点值
//////   dm.ADOQuery1.Next;
//////  end;
////// end;
//
////
////with dm.ADOQuery1 do
//// begin
////  close;
////  sql.Text:=
////  'select rkey,MANU_PART_NUMBER,qty_bom,shelf_life,analysis_code_3,ttype,QTY_PARENTBOM,'+
////   'OPT_LOT_SIZE from data0025 where rkey='+inttostr(rkey25);
////  open;
////  new(rkey0025);
////  d25_type := fieldbyname('ttype').AsInteger;
////  rkey0025.rkey25 := fieldvalues['rkey'];
////  rkey0025.shelf_life := fieldbyname('shelf_life').AsInteger;     //生产周期
////  rkey0025.qty_bom := fieldbyname('qty_bom').AsInteger;           //压合比例分子内层PCS
////  rkey0025.QTY_PARENTBOM:=fieldbyname('QTY_PARENTBOM').AsInteger;  //相当于压合比例分母外层PCS数
////  rkey0025.analysis_3 := fieldbyname('analysis_code_3').AsString; //大料规格
////  rkey0025.OPT_LOT_SIZE := fieldbyname('OPT_LOT_SIZE').AsInteger;  //最佳流转批量
////  node := treeview.Items.AddObject
////  (nil,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025); //增加顶层节点
////  node.ImageIndex:=0;  //为第一层节点定义图画
////  self.append_279(rkey25);
//// end;
////
////with dm.ADOQuery1 do
//// begin
////  close;
////  sql.Text:=
////  'select rkey,MANU_PART_NUMBER,qty_bom,shelf_life,analysis_code_3,QTY_PARENTBOM,'+
////   'OPT_LOT_SIZE from data0025 where parent_ptr='+ inttostr(rkey25);
////  open;
////  while not dm.ADOQuery1.Eof do
////  begin
////   new(rkey0025);
////   rkey0025.rkey25:= fieldvalues['rkey'];
////   rkey0025.shelf_life:=fieldbyname('shelf_life').AsInteger;
////   rkey0025.qty_bom:= fieldbyname('qty_bom').AsInteger;
////   rkey0025.QTY_PARENTBOM:=fieldbyname('QTY_PARENTBOM').AsInteger;
////   rkey0025.analysis_3:=fieldbyname('analysis_code_3').AsString;
////   rkey0025.OPT_LOT_SIZE := fieldbyname('OPT_LOT_SIZE').AsInteger;  //最佳流转批量
////   node:=treeview.Items.AddChildObject
////      (node,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
////   node.ImageIndex := 1;
////   self.append_279(rkey0025.rkey25);
////   with dm.ADOQuery2 do
////    begin
////     close;
////     sql.Text:=
////     'select rkey,MANU_PART_NUMBER,qty_bom,shelf_life,analysis_code_3,QTY_PARENTBOM,'+
////     'OPT_LOT_SIZE from data0025 where parent_ptr='+dm.ADOQuery1.fieldbyname('rkey').AsString;
////     open;
////     while not dm.ADOQuery2.Eof do
////     begin
////      new(rkey0025);
////      rkey0025.rkey25:= fieldvalues['rkey'];
////      rkey0025.shelf_life:=fieldbyname('shelf_life').AsInteger;
////      rkey0025.qty_bom:= fieldbyname('qty_bom').AsInteger;
////      rkey0025.QTY_PARENTBOM:=fieldbyname('QTY_PARENTBOM').AsInteger;
////      rkey0025.analysis_3:=fieldbyname('analysis_code_3').AsString;
////      rkey0025.OPT_LOT_SIZE := fieldbyname('OPT_LOT_SIZE').AsInteger;  //最佳流转批量
////      node:=treeview.Items.AddChildObject
////       (node, dm.ADOQuery2.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
////      node.ImageIndex := 2;
////      self.append_279(rkey0025.rkey25);
//       with dm.ADOQuery3 do
//        begin
//         close;
//         sql.Text:=
//         'select rkey,MANU_PART_NUMBER,qty_bom,shelf_life,analysis_code_3,QTY_PARENTBOM,'+
//         'OPT_LOT_SIZE from data0025 where parent_ptr='+dm.ADOQuery2.fieldbyname('rkey').AsString;
//         open;
//         while not dm.ADOQuery3.Eof do
//         begin
//          new(rkey0025);
//          rkey0025.rkey25:= fieldvalues['rkey'];
//          rkey0025.shelf_life:=fieldbyname('shelf_life').AsInteger;
//          rkey0025.qty_bom:= fieldbyname('qty_bom').AsInteger;
//          rkey0025.QTY_PARENTBOM:=fieldbyname('QTY_PARENTBOM').AsInteger;
//          rkey0025.analysis_3:=fieldbyname('analysis_code_3').AsString;
//          rkey0025.OPT_LOT_SIZE := fieldbyname('OPT_LOT_SIZE').AsInteger;  //最佳流转批量
//          node:=treeview.Items.AddChildObject
//           (node, dm.ADOQuery3.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
//          node.ImageIndex := 3;
//          self.append_279(rkey0025.rkey25);
//          node:=node.Parent;
//          dm.ADOQuery3.Next;
//         end;
//        end;
////
////      node:=node.Parent;
////      dm.ADOQuery2.Next;
////     end;
////    end;
////   node:=node.Parent; //节点指向其父节点值
////   dm.ADOQuery1.Next;
////  end;
//// end;
 treeview.FullExpand; //全部展开
 treeview.Items[0].Selected:=true;
 dm.ADOQuery1.Close;
 dm.ADOQuery2.Close;
end;

procedure TForm_bomview.add_deptcode(rkey25: integer);
var
 sql_str:string;
begin
sql_str:=
    'SELECT TOP 100 PERCENT Data0034.DEPT_CODE,'+#13+
    'Data0038.STEP_NUMBER, Data0034.RKEY'+#13+
    'FROM   Data0038 INNER JOIN'+#13+
    'Data0034 ON Data0038.DEPT_PTR = Data0034.RKEY'+#13+
    'WHERE  (Data0034.BARCODE_ENTRY_FLAG = ''Y'') and'+#13+
    '(Data0038.SOURCE_PTR ='+inttostr(rkey25)+')'+#13+
    'ORDER BY dbo.Data0038.STEP_NUMBER';
openquery(dm.ADOQuery1,sql_str);
combobox2.Items.Clear;
rkey34.Clear;
while not dm.ADOQuery1.Eof do
 begin
  combobox2.Items.Add(dm.ADOQuery1.fieldbyname('STEP_NUMBER').AsString+'; '+
                      dm.ADOQuery1.fieldbyname('DEPT_CODE').AsString);
  rkey34.Add(dm.ADOQuery1.fieldbyname('RKEY').AsString);
  dm.ADOQuery1.Next;
 end;
combobox2.ItemIndex:=combobox2.Items.Count-1;
ComboBox2Change(nil);
dm.ADOQuery1.Close;
end;

function TForm_bomview.get_EST_SCRAP_lmt(rkey25: integer;rkey15: Integer): Double;
begin
  with dm.ADOQuery1 do
  begin
    close;
    sql.Text:='select case isnull(Data0620.est_scrap_ltm,-1) when -1 then  '+
              ' data0008.est_scrap_ltm else isnull(Data0620.est_scrap_ltm,0) end as est_scrap_top  '+
              'from data0025 inner join data0008 on data0025.PROD_CODE_PTR=data0008.rkey '+
              ' left join Data0620 on Data0620.PROD_CODE = Data0008.PROD_CODE ' +
              ' and data0620.warehouse_ptr = '+IntToStr(rkey15) +#13+
              'where data0025.rkey='+inttostr(rkey25);
    open;
    Result:=fieldbyname('est_scrap_top').AsCurrency;
  end;
end;

procedure TForm_bomview.FormActivate(Sender: TObject);
var
 a_pcs:integer;
begin
 stg1.Cells[0,0]:='参数代码';
 stg1.Cells[1,0]:='参数名称';
 stg1.Cells[2,0]:='参数值';
 stg1.ColWidths[3]:=-1;
 dm.ADO279.Open;
 Self.get_treedate(self.rkey25,treeview1);
 self.EST_SCRAP:=get_EST_SCRAP_lmt(self.rkey25,Self.rkey0015);  //产品类型最高报废率
 Label26.Caption:=Label26.Caption+FloatToStr(self.EST_SCRAP)+'%';
 a_pcs:=0;
with dm.ADOQuery1 do
 begin
  close;
  sql.Text:=
  'SELECT TOP 100 PERCENT dbo.Data0278.PARAMETER_NAME,'+#13+
  'Data0278.PARAMETER_DESC, Data0278.SPEC_RKEY,'+#13+
  'Data0279.SOURCE_PTR,Data0279.PARAMETER_VALUE'+#13+
  'FROM         dbo.Data0278 INNER JOIN'+#13+
  'dbo.Data0279 ON dbo.Data0278.RKEY = dbo.Data0279.PARAMETER_PTR'+#13+
  'WHERE (dbo.Data0278.SPEC_RKEY IN (''1'', ''2'', ''3'', ''4'','+#13+
  '''5'', ''6'', ''7'', ''8'', ''9'', ''P'')) AND'+#13+
  '(dbo.Data0279.SOURCE_PTR ='+inttostr(rkey25) +') AND'+#13+
  '(dbo.Data0279.IES_PROD = 1)'+#13+
  'ORDER BY dbo.Data0279.IES_CRP';       //'P'为大料PCS总数
  open;
 end;
 stg1.RowCount:=dm.ADOQuery1.RecordCount+1;
while not dm.ADOQuery1.Eof do   //加载全局开料参数
 begin
  stg1.Cells[0,dm.ADOQuery1.RecNo]:=dm.ADOQuery1.fieldbyname('PARAMETER_NAME').AsString;
  stg1.Cells[1,dm.ADOQuery1.RecNo]:=dm.ADOQuery1.fieldbyname('PARAMETER_DESC').AsString;
  stg1.Cells[2,dm.ADOQuery1.RecNo]:=dm.ADOQuery1.fieldbyname('PARAMETER_VALUE').AsString;
  stg1.Cells[3,dm.ADOQuery1.RecNo]:=trim(dm.ADOQuery1.fieldbyname('SPEC_RKEY').AsString);
  if (trim(stg1.Cells[3,dm.ADOQuery1.RecNo])='3') and
     (trim(stg1.Cells[2,dm.ADOQuery1.RecNo])<>'') then
  try
   a_pcs:= strtoint(stg1.Cells[2,dm.ADOQuery1.RecNo]);
  except
  end;
  dm.ADOQuery1.Next;
 end;
 
if self.rkey0015>0 then
 with dm.adoquery1 do
  begin
   close;
   sql.Text:=
    'SELECT data0015.rkey,dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.WAREHOUSE_NAME,'+#13+
    'data0015.abbr_name FROM dbo.Data0015'+#13+
     'where rkey='+inttostr(rkey0015);
   open;
   rkey15.Caption:= inttostr(rkey0015);
   label3.Caption:=fieldbyname('abbr_name').AsString;
   edit6.Text:=fieldbyname('WAREHOUSE_CODE').AsString;
  end;
  
 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:=
    'SELECT BALA_DAYS '+#13+
    'FROM dbo.Data0192';
   open;
   if d25_type<>0 then                     //样品允许超投率
    ct_perenct:=fieldbyname('BALA_DAYS').AsFloat;
  end;

 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:= 'SELECT ANALYSIS_CODE_4,spell_qty,spell_sq FROM Data0025 '+#13+
    'where rkey='+inttostr(rkey25);
   open;
   spell_sq.Caption:=fieldbyname('spell_sq').AsString;   //拼版面积
   label22.Caption:=fieldbyname('ANALYSIS_CODE_4').AsString;   //拼版尺寸
   label23.Caption:=fieldbyname('spell_qty').AsString;   //拼板个数
  end;

if combobox1.ItemIndex=0 then   //正常投产
begin
 panel4.Visible:=false;
end
else
 begin
  if combobox1.ItemIndex=3 then    //按mrb返修
   begin
    combobox3.Enabled := false;        //不可以方案选择
    combobox2.Enabled := true;        //返工工序
    self.add_deptcode(self.rkey25);  //加载返工工序
    edit8.Text := edit7.Text;
    edit9.Text := edit7.Text;
    dtpk1.Date := getsystem_date(dm.ADOQuery1,1);
    if a_pcs>0 then
    edit5.Text := inttostr(ceil(strtoint(edit9.Text)/a_pcs));
    edit2.Enabled:=false;
   end
  else
   begin
    combobox2.Visible:=false;   //无返工工序
    speedbutton2.Visible:=false;
// dtpk1.Visible:=false;
// label5.Visible:=false;
    dtpk1.Date:=  getsystem_date(dm.ADOQuery1,1)+strtoint(edit3.Text);
    label6.Visible:=false;
    edit7.ReadOnly:=false;
    edit7.Color:=clwindow;
    edit8.Text:=inttostr(ceil(strtoint(edit7.Text)*
                 (1+strtofloat(self.edit2.text)*0.01)));//计划数
    if combobox1.ItemIndex=2 then  //按MRB重投
    combobox3.OnChange(sender);
    if combobox1.ItemIndex<>2 then
    begin
     edit10.Text:='超投';
     edit10.Color:=clfuchsia;
    end;
   end;
  panel4.Visible:=true;
 end;
dm.ADOQuery1.Close;
end;

procedure TForm_bomview.TreeView1Change(Sender: TObject; Node: TTreeNode);
VAR
 i:integer;
begin
 edit1.Text:=inttostr(PTreeValue(Node.data)^.OPT_LOT_SIZE);
 edit3.Text:=inttostr(PTreeValue(Node.data)^.shelf_life);
 edit4.Text:= inttostr(PTreeValue(Node.data)^.qty_bom);
 edit14.Text:= inttostr(PTreeValue(Node.data)^.QTY_PARENTBOM);
 node.SelectedIndex:=4;
 dm.ADO279.Filter:='PRODUCTION_FLAG = '+inttostr(PTreeValue(Node.data)^.rkey25);

 for i:=1 to stg1.RowCount-1  do
 begin
  dm.ADO279.First;
  while not dm.ADO279.Eof do
   begin
    if trim(dm.ADO279SPEC_RKEY.Value)=trim(stg1.Cells[3,i]) then
     begin
      stg1.Cells[2,i]:=dm.ADO279PARAMETER_DESC.Value;
      break;
     end;
    dm.ADO279.Next;
   end;
 end;
 
end;

procedure TForm_bomview.stg1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if acol < 2 then
   begin
    stg1.Canvas.Brush.Color:= clscrollbar;
    stg1.Canvas.FillRect(rect);
    stg1.Canvas.TextRect(rect,rect.left,rect.Top, stg1.Cells[acol,aRow]);
   end;

if (acol=2) then
 stg1.Canvas.TextRect(rect,
        rect.right-stg1.Canvas.TextWidth(stg1.Cells[acol,arow])-2,
        rect.Top+2,
        stg1.Cells[acol,aRow]);
end;

procedure TForm_bomview.stg1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
if (acol=2) then
 stg1.Options:=stg1.Options+[goEditing]
else
 stg1.Options:=stg1.Options-[goEditing];
end;

procedure TForm_bomview.stg1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#13,#8]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
  if (trim(stg1.Cells[3,stg1.Row])='P') or
     (trim(stg1.Cells[3,stg1.Row])='1') or
     (trim(stg1.Cells[3,stg1.Row])='2') or
     (trim(stg1.Cells[3,stg1.Row])='3') or
     (trim(stg1.Cells[3,stg1.Row])='4') then abort
  else
   if pos('.',stg1.Cells[stg1.col,stg1.row])>0  then abort;
end;

procedure TForm_bomview.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#13,#8]) then  //判断是否输入数字
  abort;
end;

procedure TForm_bomview.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#13,#8]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',edit2.Text)>0  then abort;
end;

procedure TForm_bomview.BitBtn3Click(Sender: TObject);

begin
  try
    Form_warehouse := TForm_warehouse.Create(application) ;

    if Form_warehouse.ShowModal=mrok then
     begin
      rkey15.Caption:= Form_warehouse.ADOQuery1.Fieldbyname('rkey').AsString;
      edit6.Text := trim(Form_warehouse.ADOQuery1.FieldValues['WAREHOUSE_CODE']);
      label3.Caption:=Form_warehouse.ADOQuery1.FieldValues['abbr_name'];
       self.EST_SCRAP:=get_EST_SCRAP_lmt(self.rkey25,Form_warehouse.ADOQuery1.Fieldbyname('rkey').AsInteger);  //产品类型最高报废率
       Label26.Caption:=Copy(Label26.Caption,1,Pos(':',Label26.Caption)) + FloatToStr(self.EST_SCRAP)+'%';
      if StrToFloat(Trim(Edit2.Text)) > Self.EST_SCRAP then Edit2.Text:= FloatToStr(EST_SCRAP);

      bitbtn1.SetFocus;
     end
    else
     edit6.SetFocus;
  finally
      Form_warehouse.Free ;
  end;
end;

procedure TForm_bomview.Edit6Exit(Sender: TObject);
begin
if trim(edit6.Text)='' then
 begin
  label3.Caption:='';
  rkey15.Caption:='0';
 end
else
 if (activecontrol.Name<>'BitBtn3') and (activecontrol.Name<>'BitBtn2') then
 begin
  with dm.adoquery2 do
  begin
   close;
   sql.Text:=
    'SELECT data0015.rkey,dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.WAREHOUSE_NAME,'+#13+
    'data0015.abbr_name FROM dbo.Data0015'+#13+
     'where WAREHOUSE_CODE='+quotedstr(trim(edit6.Text));
   open;
   if isempty then
    begin
     messagedlg('工厂代码输入错误!',mterror,[mbcancel],0);
     edit6.SetFocus;
    end
   else
    begin
     rkey15.Caption:=fieldbyname('RKEY').AsString;
     label3.Caption:=fieldbyname('WAREHOUSE_NAME').AsString;
    end;
   close; 
  end;
 end;
end;

procedure TForm_bomview.SpeedButton1Click(Sender: TObject);
var
 node:TTreeNode;
begin
node:=treeview1.Selected;
edit3.Enabled:= not edit3.Enabled;
edit1.Enabled:= not edit1.Enabled;
if edit3.Enabled then
 begin
  speedbutton1.Caption := '保存';
  edit1.SetFocus;
 end
else
 begin
  speedbutton1.Caption := '修改';
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('update data0025');
    sql.Add('set shelf_life='+trim(edit3.Text));
    sql.Add(',OPT_LOT_SIZE='+trim(edit1.Text));
    sql.Add(',EST_SCRAP='+trim(edit2.Text));
    sql.Add('where rkey='+inttostr(self.rkey25));
    ExecSQL;
   end;
   PTreeValue(Node.data)^.OPT_LOT_SIZE:=strtoint(edit1.Text);
   PTreeValue(Node.data)^.shelf_life:=strtoint(edit3.Text);
 end;
end;

procedure TForm_bomview.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim((sender as tedit).Text)='' then
 (sender as tedit).Text:='0';
end;

function TForm_bomview.find_error: boolean;
var
 i,i_j:integer;
 total_pcb,pan_a,pan_b,A_pcs,B_pcs:integer;
 apnl_len,apnl_wth,bpnl_len,bpnl_wth,PCS_sq:double;
begin
  result:=false;
  total_pcb:=0;
  pan_a:=0;
  A_pcs:=0;
  pan_b:=0;
  b_pcs:=0;
  apnl_len:=0;
  apnl_wth:=0;
  bpnl_len:=0;
  bpnl_wth:=0;
 for i_j:=0 to treeview1.Items.Count-1 do
  begin
   treeview1.Items[i_j].Selected:=true;

   try
    for i:=1 to stg1.RowCount-1 do
     begin
      if trim(stg1.Cells[3,i])='P' then   //大料总PCS数
       begin
        if trim(stg1.Cells[2,i])='' then
         total_pcb:=0
        else
         total_pcb:=strtoint(trim(stg1.Cells[2,i]));
       end;
      if trim(stg1.Cells[3,i])='1' then         //大料APNL数
       begin
        if trim(stg1.Cells[2,i])='' then
         pan_a:=0
        else
         pan_a:=strtoint(trim(stg1.Cells[2,i]));
       end;
      if trim(stg1.Cells[3,i])='2' then        //大料BPNL数
       begin
        if trim(stg1.Cells[2,i])='' then
         pan_b:=0
        else
         pan_b:=strtoint(trim(stg1.Cells[2,i]));
       end;
      if trim(stg1.Cells[3,i])='3' then      //Apnl 单元数
       begin
        if trim(stg1.Cells[2,i])='' then
         A_pcs:=0
        else
         A_pcs:=strtoint(trim(stg1.Cells[2,i]));
       end;
      if trim(stg1.Cells[3,i])='4' then       //Bpnl 单元数
       begin
        if trim(stg1.Cells[2,i])='' then
         B_pcs:=0
        else
         B_pcs:=strtoint(trim(stg1.Cells[2,i]));
       end;

      if trim(stg1.Cells[3,i])='6' then
       begin
        if trim(stg1.Cells[2,i])='' then
         apnl_len:=0
        else
         apnl_len:=strtofloat(trim(stg1.Cells[2,i]));
       end;

      if trim(stg1.Cells[3,i])='7' then
       begin
        if trim(stg1.Cells[2,i])='' then
         apnl_wth:=0
        else
         apnl_wth:=strtofloat(trim(stg1.Cells[2,i]));
       end;

      if trim(stg1.Cells[3,i])='8' then
       begin
        if trim(stg1.Cells[2,i])='' then
         bpnl_len:=0
        else
         bpnl_len:=strtofloat(trim(stg1.Cells[2,i]));
       end;

      if trim(stg1.Cells[3,i])='9' then
       begin
        if trim(stg1.Cells[2,i])='' then
         bpnl_wth:=0
        else
         bpnl_wth:=strtofloat(trim(stg1.Cells[2,i]));
       end;

     end;

    except
     showmsg('大料拼版参数或者尺寸有误:'+treeview1.Items[i_j].Text,1);
     stg1.SetFocus;
     result:=true;
     break;
    end;

    if total_pcb <= 0 then
     begin
      showmsg('大料PCS数量有误:'+treeview1.Items[i_j].Text,1);
      stg1.SetFocus;
      result:=true;
      break;
     end;

    if total_pcb <> pan_a*A_pcs+pan_b*b_pcs then
     begin
      showmsg('大料拼PCS总数不正确:'+treeview1.Items[i_j].Text,1);
      stg1.SetFocus;
      result:=true;
      break;
     end;

     if a_pcs > 0 then
     begin
      PCS_sq:=(apnl_len*apnl_wth)/a_pcs/100;  //以APNL计算单PCS的面积平米厘米
      if PCS_sq > 0 then
       if (PCS_sq-strtofloat(spell_sq.Caption)*10000)/PCS_sq * 100 > 30 then
        begin
         if messagedlg(treeview1.Items[i_j].Text+':A板拼每PCS面积低过大料利用率70%,是否继续?',
            mterror,[mbNo,mbYes],0)=mrNO then
          begin
           stg1.SetFocus;
           result:=true;
           break;
          end;
        end
       else
      else
       begin
        showmsg('A板尺寸不正确:'+treeview1.Items[i_j].Text,1);
        stg1.SetFocus;
        result:=true;
        break;
       end;
     end;

    if b_pcs > 0 then
     begin
      PCS_sq:=(bpnl_len*bpnl_wth)/b_pcs/100;  //以BPNL计算单PCS的面积
      if PCS_sq > 0 then
      if (PCS_sq-strtofloat(spell_sq.Caption)*10000)/PCS_sq * 100 > 30 then
       begin
        if messagedlg(treeview1.Items[i_j].Text+':B板拼每PCS面积低过大料利用率70%,是否继续?',
            mterror,[mbNo,mbYes],0)=mrNO then
        begin
         stg1.SetFocus;
         result:=true;
         break;
        end;
       end
       else
       else
         begin
          showmsg('B板尺寸不正确:'+treeview1.Items[i_j].Text,1);
          stg1.SetFocus;
          result:=true;
          break;
         end;
     end;

  end;
end;

function TForm_bomview.cacl_totalpcs(ttype: byte; tobe_planned: integer;
  var a_pan, b_pan: integer): integer;
var
 i:integer;
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

try
  for i:=1 to stg1.RowCount-1 do
   begin
    if trim(stg1.Cells[3,i])='P' then
     begin
      if trim(stg1.Cells[2,i])='' then
        total_pcb:=0
      else
        total_pcb:=strtoint(trim(stg1.Cells[2,i]));
     end;
    if trim(stg1.Cells[3,i])='1' then
     begin
      if trim(stg1.Cells[2,i])='' then
        pan_a:=0
      else
        pan_a:=strtoint(trim(stg1.Cells[2,i]));
     end;
    if trim(stg1.Cells[3,i])='2' then
     begin
      if trim(stg1.Cells[2,i])='' then
        pan_b:=0
      else
        pan_b:=strtoint(trim(stg1.Cells[2,i]));
     end;
    if trim(stg1.Cells[3,i])='3' then
     begin
      if trim(stg1.Cells[2,i])='' then
        A_pcs:=0
      else
        A_pcs:=strtoint(trim(stg1.Cells[2,i]));
     end;
    if trim(stg1.Cells[3,i])='4' then
     begin
      if trim(stg1.Cells[2,i])='' then
        B_pcs:=0
      else
        B_pcs:=strtoint(trim(stg1.Cells[2,i]));
     end;
   end;
except
 showmsg('大料拼版参数有误',1);
 stg1.SetFocus;
 result:=0;
 exit;
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
else
 begin              //双拼版
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

function TForm_bomview.find_pcs_qty(spec_rkey:string): STRING;
var
 i:integer;
begin
 result:='0';
 for i:=1 to stg1.RowCount-1 do
  if trim(stg1.Cells[3,i])=spec_rkey then
   begin
    if trim(stg1.Cells[2,i])<>'' then
     result:=trim(stg1.Cells[2,i]);
    break;
   end;
end;

procedure TForm_bomview.BitBtn1Click(Sender: TObject);
var
 i,i_j:integer;
 a_pan_qty,b_pan_qty:integer;
 currently_date:tdatetime;
 up_qty:Integer;
 pcs_sq:Double;
begin
if self.find_error then  exit;

  pcs_sq:= Calc_pcs_sq(Self.rkey25);
  if  pcs_sq = 0 then
  begin
    ShowMessage('计算出的PCS面积等于0,请检查PNL长、PNL宽、PNL单元数是否正确');
    Exit;
  end;

if strtoint(edit1.Text) <= 0 then
 begin
  showmsg('最佳流转批量输入有误',1);
  edit1.SetFocus;
  exit;
 end;

 if cbb1.ItemIndex = -1 then
 begin
   ShowMsg('紧急程度不能为空',1);
   cbb1.SetFocus;
   exit;
 end;

if trim(edit6.Text)='' then
 begin
  showmsg('请确定投料工厂!',1);
  edit6.SetFocus;
  exit;
 end;

if Lal_sostatus.Caption <> '是' then
 begin
  showmsg('请重选允许投产的产品!',1);
  treeview1.SetFocus;
  exit;
 end;

currently_date:=getsystem_date(dm.ADOQuery1,1);
case combobox1.ItemIndex of
0:             //正常投产
 try
   TreeView1.Items[0].Selected:=true;
   application.CreateForm(TForm_salesorder,Form_salesorder);

   form_salesorder.EST_SCRAP:=strtofloat(edit2.Text);

   form_salesorder.TreeView1.Items.Assign(self.TreeView1.Items);

   Form_salesorder.cbb1.Items.Assign(cbb1.Items);      //    增加于2016-11-14 ZSP
   Form_salesorder.cbb1.ItemIndex:= cbb1.ItemIndex;
   Form_salesorder.pcs_sq:= pcs_sq;
   form_salesorder.TreeView1.FullExpand;
   form_salesorder.TreeView1.Items[0].Selected:=true;

   form_salesorder.Edit7.Text := self.find_pcs_qty('3');//inttostr(A_pcs); //A板PCS数
   form_salesorder.Edit8.Text := self.find_pcs_qty('4');//inttostr(B_pcs); //B板PCS数


   form_salesorder.d25_type:=self.d25_type;
   form_salesorder.whouseptr:=strtoint(self.rkey15.caption);
   if Form_salesorder.ShowModal=mrok then
    self.ModalResult:=mrok;
 finally
  Form_salesorder.Free;
 end;

1,2,4:         //补料,按MRB重投,按板号投
begin
if strtoint(edit7.Text)=0 then
 begin
  showmsg('本次计划数量不能为零',1);
  edit7.SetFocus;
  exit;
 end;
try
 application.CreateForm(TForm_putprod,Form_putprod);
 dm.aqy04.close;
 dm.aqy04.Open;
 with Form_putprod do
  begin
   combobox1.ItemIndex:=self.ComboBox1.ItemIndex;//投产类型
   edit1.Text:=self.Edit10.Text;                 //超投标识
   mrbptr:=self.rkey414;
   d25type_ptr := Self.d25_type;//样品或量产


   out_sq := FloatToStrf((strtoint(edit9.Text)) * pcs_sq,ffFixed,8,3);

//   out_sq := Floattostrf(                          //超投面积 补料投产超投面积不用减计划数
//     (strtoint(edit9.Text)) * strtofloat(spell_sq.Caption));
   whouseptr:=strtoint(self.rkey15.caption);
   CUSTOMER_PTR:=self.CUSTOMER_PTR;
   if self.ComboBox1.ItemIndex=1 then
    so_number:=self.sales_order        //补料的订单号
   else
    so_number:='';
   begin_step:=1;
   deptptr:=0;
   parts_count:=TreeView1.Items.Count;
   stg1.RowCount:=self.TreeView1.Items.Count+1;

   for i:=1 to self.TreeView1.Items.Count do
   begin
     treeview1.Items[i-1].Selected:=true;
     stg1.Cells[0,i]:=dm.aqy04SEED_VALUE.Value+'-'+inttostr(i-1);;  //配料单
     stg1.Cells[1,i]:=self.TreeView1.Items[i-1].Text;  //本厂编号

     stg1.Cells[2,i]:= datetostr(self.dtpk1.Date); //完工日期

     stg1.Cells[3,i]:=inttostr(ceil(strtoint(self.Edit13.Text)*      //待计划数(市场订单数)
                              cacl_bomqty(treeview1.Items[i-1])));

     stg1.Cells[4,i]:=inttostr(ceil(strtoint(self.edit8.Text)*       //计划数 （加上报废率）
                              cacl_bomqty(treeview1.Items[i-1])));

     a_pan_qty:=0;
     b_pan_qty:=0;

     //zsp于2016-05-12修改开始

     if i=1 then
     begin
       stg1.Cells[5,i]:=inttostr(   //投产数在循环中投产每一层都单独计算
       self.cacl_totalpcs(self.ComboBox3.ItemIndex,strtoint(stg1.Cells[4,i]),a_pan_qty,b_pan_qty));

       up_qty:=StrToInt(stg1.Cells[5,i]);

       stg1.Cells[6,i]:=inttostr(a_pan_qty);     //投A板
       stg1.Cells[7,i]:=inttostr(b_pan_qty);     //投B板
     end
     else
     begin
       stg1.Cells[5,i]:= inttostr(   //投产数在循环中投产每一层都单独计算
       self.cacl_totalpcs(self.ComboBox3.ItemIndex,Ceil(up_qty*cacl_bomqty(treeview1.Items[i-1])),a_pan_qty,b_pan_qty));
       stg1.Cells[6,i]:=inttostr(a_pan_qty);     //投A板
       stg1.Cells[7,i]:=inttostr(b_pan_qty);     //投B板
     end;

     //修改结束

//     stg1.Cells[5,i]:=inttostr(     //在循环中投产每一层都单独计算
//     self.cacl_totalpcs(self.ComboBox3.ItemIndex,strtoint(stg1.Cells[4,i]),a_pan_qty,b_pan_qty));
//
//
//     stg1.Cells[6,i]:=inttostr(a_pan_qty);
//     stg1.Cells[7,i]:=inttostr(b_pan_qty);

//     if  ComboBox1.ItemIndex=1 then stg1.Cells[8,i]:= '100'
//     else


     stg1.Cells[8,i]:= Floattostrf((strtoint(stg1.Cells[5,i])-strtoint(stg1.Cells[3,i]))/         
                                      strtoint(stg1.Cells[3,i])*100,ffFixed,8,2);   //超投率%
     stg1.Cells[10,i]:=PTreeValue(self.TreeView1.Items[i-1].data)^.analysis_3;  //大料规格
     stg1.Cells[11,i]:=inttostr(PTreeValue(self.TreeView1.Items[i-1].data)^.rkey25); //rkey25

     stg1.Cells[12,i]:=self.find_pcs_qty('3');       //A板PCS数
     stg1.Cells[13,i]:=self.find_pcs_qty('4');       //B板PCS数

     stg1.Cells[14,i]:=self.find_pcs_qty('6')+'mm * '+
                       self.find_pcs_qty('7')+'mm';       //A板尺寸

     stg1.Cells[15,i]:=self.find_pcs_qty('8')+'mm * '+
                       self.find_pcs_qty('9')+'mm';       //B板尺寸
     stg1.Cells[16,i]:='0';   //引用库存

     stg1.Cells[17,i]:= cbb1.Items[cbb1.itemindex];        //    增加于20180502 ZSP
     stg1.Cells[18,i]:= IntToStr(Integer(cbb1.Items.Objects[cbb1.ItemIndex]));

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
       if (stg2.Cells[14,stg2.RowCount-2]<>
          dm.ADOQuery1.fieldbyname('DEPT_PTR').AsString) and (dm.ADOQuery1.RecNo=1) then
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
       stg2.Cells[17,stg2.RowCount-1]:='0';
       stg2.RowCount:=stg2.RowCount+1;
       dm.ADOQuery1.Next;
      end;  //end with dm.adoquery1 加载BOM

    for i_j:=1 to ceil(strtoint(stg1.Cells[6,i])/PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE) do
    begin
     stg3.Cells[10,stg3.RowCount-1]:= stg1.Cells[11,i];     //25.rkey
     if stg3.Cells[10,stg3.RowCount-1]<> stg3.Cells[10,stg3.RowCount-2] then
      begin
       stg3.Cells[0,stg3.RowCount-1]:=stg1.Cells[0,i];  //配料单号
       stg3.Cells[1,stg3.RowCount-1]:=stg1.Cells[1,i];  //本厂编号
      end;

     stg3.Cells[2,stg3.RowCount-1]:=wo_number(stg1.Cells[0,i],0,      //作业单号
         ceil(strtoint(stg1.Cells[6,i])/PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE),i_j,b_pan_qty);

     stg3.Cells[5,stg3.RowCount-1]:=stg1.Cells[12,i];  //A板PCS数

     if i_j < ceil(strtoint(stg1.Cells[6,i])/PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE) then
      begin
       stg3.Cells[4,stg3.RowCount-1]:= inttostr(PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE);
       stg3.Cells[3,stg3.RowCount-1]:= inttostr(strtoint(stg3.Cells[4,stg3.RowCount-1])*
                                                strtoint(stg3.Cells[5,stg3.RowCount-1]));
      end
     else
      begin
       if strtoint(stg1.Cells[6,i]) mod PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE=0 then
        stg3.Cells[4,stg3.RowCount-1]:= inttostr(PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE)
       else
        stg3.Cells[4,stg3.RowCount-1]:=
             inttostr(strtoint(stg1.Cells[6,i]) mod PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE);

       stg3.Cells[3,stg3.RowCount-1]:=inttostr(strtoint(stg3.Cells[4,stg3.RowCount-1])*
                                               strtoint(stg3.Cells[5,stg3.RowCount-1]));
      end;
     stg3.Cells[6,stg3.RowCount-1] := stg1.Cells[2,i];  //完工日期
     stg3.Cells[7,stg3.RowCount-1] := self.find_pcs_qty('6');
     stg3.Cells[8,stg3.RowCount-1] := self.find_pcs_qty('7');
     stg3.Cells[9,stg3.RowCount-1] :=  stg1.Cells[14,i];  //APNL尺寸

     stg3.Cells[11,stg3.RowCount-1]:= '0';
//      ShowMessage(cbb1.Items[cbb1.itemindex]);
     stg3.Cells[12,stg3.RowCount-1]:= cbb1.Items[cbb1.itemindex];        //    增加于20180502 ZSP
     stg3.Cells[13,stg3.RowCount-1]:= IntToStr(Integer(cbb1.Items.Objects[cbb1.ItemIndex]));
     stg3.RowCount:=stg3.RowCount+1;
    end;  //end for i_j 加载a作业单

     for i_j:=1 to ceil(strtoint(stg1.Cells[7,i])/PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE) do
      begin
       stg3.Cells[10,stg3.RowCount-1]:= stg1.Cells[11,i];  //rkey25
       if stg3.Cells[10,stg3.RowCount-1]<> stg3.Cells[10,stg3.RowCount-2] then
        begin
         stg3.Cells[0,stg3.RowCount-1]:=stg1.Cells[0,i];   //配料单号
         stg3.Cells[1,stg3.RowCount-1]:=stg1.Cells[1,i];   //本厂编号
        end;
       stg3.Cells[2,stg3.RowCount-1]:=self.wo_number(stg1.Cells[0,i],1, //作业单号
            ceil(strtoint(stg1.Cells[7,i])/PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE),i_j,b_pan_qty);

       stg3.Cells[5,stg3.RowCount-1]:=stg1.Cells[13,i];  //pcs/bpnl

       if i_j < ceil(strtoint(stg1.Cells[7,i])/PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE) then
        begin
         stg3.Cells[4,stg3.RowCount-1]:= inttostr(PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE);
         stg3.Cells[3,stg3.RowCount-1]:= inttostr(strtoint(stg3.Cells[4,stg3.RowCount-1])*
                                                  strtoint(stg3.Cells[5,stg3.RowCount-1]));
        end
       else
        begin
         if strtoint(stg1.Cells[7,i]) mod PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE=0 then
          stg3.Cells[4,stg3.RowCount-1]:= inttostr(PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE)
         else
          stg3.Cells[4,stg3.RowCount-1]:=
           inttostr(strtoint(stg1.Cells[7,i]) mod PTreeValue(self.TreeView1.Items[i-1].data)^.OPT_LOT_SIZE);

         stg3.Cells[3,stg3.RowCount-1]:= inttostr(strtoint(stg3.Cells[4,stg3.RowCount-1])*
                                                  strtoint(stg3.Cells[5,stg3.RowCount-1]));
        end;
       stg3.Cells[6,stg3.RowCount-1] := stg1.Cells[2,i];  //完工日期
       stg3.Cells[7,stg3.RowCount-1] := self.find_pcs_qty('8');
       stg3.Cells[8,stg3.RowCount-1] := self.find_pcs_qty('9');
       stg3.Cells[9,stg3.RowCount-1] :=  stg1.Cells[15,i];  //BPNL尺寸
       stg3.Cells[11,stg3.RowCount-1]:= '1';

       stg3.Cells[12,stg3.RowCount-1]:= cbb1.Items[cbb1.itemindex];     //    增加于20180502 ZSP
       stg3.Cells[13,stg3.RowCount-1]:= IntToStr(Integer(cbb1.Items.Objects[cbb1.ItemIndex]));
       stg3.RowCount:=stg3.RowCount+1;
      end;        //end for i_j加载b作业单

   end; //end for i
  end;    //end with

 if Form_putprod.ShowModal=mrok then
  try
   if self.ComboBox1.ItemIndex=2 then //按MRB重投
    with dm.ADOQuery1 do
     begin
      close;
      sql.Text:='select qty_to_be_reworked,qty_reworked,'+#13+
                'qty_to_be_remaked,qty_remaked,status'+#13+
                'from data0414 where rkey='+inttostr(self.rkey414);
      open;
      edit;
      fieldbyname('qty_remaked').AsInteger:=fieldbyname('qty_remaked').AsInteger+
                                             strtoint(self.Edit13.Text);

      if  (fieldbyname('qty_reworked').AsInteger >=
           fieldbyname('qty_to_be_reworked').AsInteger) and
          (fieldbyname('qty_remaked').AsInteger >=
           fieldbyname('qty_to_be_remaked').AsInteger) then
       fieldbyname('status').AsInteger:=3;
      post;
     end
   else
    if self.ComboBox1.ItemIndex=1 then  //补料投产
     with dm.ADOQuery1 do
     begin
      close;
      sql.Text:='select to_be_planned,qty_plannned,issued_qty'+#13+
                 'from data0060 where sales_order='+quotedstr(self.sales_order);
      open;
      edit;
      fieldbyname('qty_plannned').AsInteger:=fieldbyname('qty_plannned').AsInteger+
                                                strtoint(edit8.Text);
      fieldbyname('issued_qty').AsInteger:=fieldbyname('issued_qty').AsInteger+
                                                strtoint(edit9.Text);
      post;
     end;
   dm.update_25lot(self.rkey25);    //更新产品投产后当前在线的作业单批次
   if dm.ADOConnection1.InTransaction then
   dm.ADOConnection1.CommitTrans;
   self.ModalResult:=mrok;
  except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;  //end try

finally
  Form_putprod.Free;
end;

end;

3:        //返工投产
begin
 treeview1.Items[0].Selected:=true;
 if strtoint(self.Edit5.Text) <> ceil(strtoint(self.edit9.Text)/strtoint(find_pcs_qty('3'))) then
 begin
  showmsg('A板PCS数输入有误',1);
  stg1.SetFocus;
  exit;
 end;

 try
 application.CreateForm(TForm_putprod,Form_putprod);
 dm.aqy04.close;
 dm.aqy04.Open;
 with Form_putprod do
  begin
   combobox1.ItemIndex:=self.ComboBox1.ItemIndex;//投产类型
   edit1.Text:=self.Edit10.Text;                 //超投标识
   mrbptr:=self.rkey414;
   whouseptr:=strtoint(self.rkey15.caption);
   so_number:= Self.sales_order;
   begin_step:=strtoint(copy(combobox2.Text,1,pos(';',combobox2.Text)-1));
   deptptr:=strtoint(self.rkey0034.Caption);
   CUSTOMER_PTR:=self.CUSTOMER_PTR;

   stg1.Cells[0,1]:=dm.aqy04SEED_VALUE.Value+'-0';
   stg1.Cells[1,1]:=treeview1.Items[0].Text;   //本厂编号
   stg1.Cells[2,1]:=datetostr(self.dtpk1.Date); //完工日期
   stg1.Cells[3,1]:=self.Edit13.Text;           //待计划数
   stg1.Cells[4,1]:=self.edit8.Text;            //计划数
   stg1.Cells[5,1]:=self.edit9.Text;            //投产数
   stg1.Cells[6,1]:=self.edit5.Text;            //投A板
   stg1.Cells[7,1]:=self.edit11.Text;           //投B板
   stg1.Cells[8,1]:=self.edit12.Text;           //超投率%
   stg1.Cells[10,1]:=PTreeValue(treeview1.Items[0].data)^.analysis_3;  //大料规格
   stg1.Cells[11,1]:=inttostr(self.rkey25);

   stg1.Cells[12,1]:=self.find_pcs_qty('3');       //A板PCS数
   stg1.Cells[13,1]:=self.find_pcs_qty('4');       //B板PCS数
   stg1.Cells[14,1]:=self.find_pcs_qty('6')+'mm * '+
                       self.find_pcs_qty('7')+'mm';     //A板尺寸
   stg1.Cells[15,1]:=self.find_pcs_qty('8')+'mm * '+
                       self.find_pcs_qty('9')+'mm';     //B板尺寸
   stg1.cells[16,1]:='0';  //'引用库存';

   stg1.Cells[17,1]:= cbb1.Items[cbb1.itemindex];     //    增加于2018-08-10 wsp
   stg1.Cells[18,1]:= IntToStr(Integer(cbb1.Items.Objects[cbb1.ItemIndex]));

   for i_j:=1 to  ceil(strtoint(stg1.Cells[6,1])/strtoint(self.Edit1.Text)) do
    begin
     stg3.Cells[10,stg3.RowCount-1]:= stg1.Cells[11,1];
     if stg3.Cells[10,stg3.RowCount-1]<> stg3.Cells[10,stg3.RowCount-2] then
      begin
       stg3.Cells[0,stg3.RowCount-1]:=stg1.Cells[0,1];
       stg3.Cells[1,stg3.RowCount-1]:=stg1.Cells[1,1];
      end;

     stg3.Cells[2,stg3.RowCount-1]:='W-'+wo_number(stg1.Cells[0,1],0,
                 ceil(strtoint(stg1.Cells[6,1])/strtoint(self.Edit1.Text)),i_j,0);

     stg3.Cells[5,stg3.RowCount-1]:=stg1.Cells[12,1];  //pcs/apnl

     if i_j < ceil(strtoint(stg1.Cells[6,1])/strtoint(self.Edit1.Text)) then
      begin
       stg3.Cells[4,stg3.RowCount-1]:= inttostr(strtoint(self.Edit1.Text));
       stg3.Cells[3,stg3.RowCount-1]:= inttostr(strtoint(stg3.Cells[4,stg3.RowCount-1])*
                                                strtoint(stg3.Cells[5,stg3.RowCount-1]));
      end
     else
      begin
       if strtoint(stg1.Cells[6,1]) mod strtoint(self.Edit1.Text)=0 then
        stg3.Cells[4,stg3.RowCount-1]:= inttostr(strtoint(self.Edit1.Text))
       else
        stg3.Cells[4,stg3.RowCount-1]:=
             inttostr(strtoint(stg1.Cells[6,1]) mod strtoint(self.Edit1.Text));

       stg3.Cells[3,stg3.RowCount-1]:=inttostr(
                             strtoint(self.edit9.Text)-
                            ((i_j-1)*strtoint(self.Edit1.Text)*strtoint(find_pcs_qty('3'))));
      end;
     stg3.Cells[6,stg3.RowCount-1] := stg1.Cells[2,1];  //完工日期

     stg3.Cells[7,stg3.RowCount-1] := self.find_pcs_qty('6');
     stg3.Cells[8,stg3.RowCount-1] := self.find_pcs_qty('7');
     stg3.Cells[9,stg3.RowCount-1] :=  stg1.Cells[14,1];  //APNL尺寸

     stg3.Cells[11,stg3.RowCount-1]:= '0';
     stg3.Cells[12,stg3.RowCount-1]:= cbb1.Items[cbb1.itemindex];     //    增加于2016-11-14 ZSP
     stg3.Cells[13,stg3.RowCount-1]:= IntToStr(Integer(cbb1.Items.Objects[cbb1.ItemIndex]));
     stg3.RowCount:=stg3.RowCount+1;    //加载a作业单
    end;

  end;
 if Form_putprod.ShowModal=mrok then
  begin
  try
    with dm.ADOQuery1 do
     begin
      close;
      sql.Text:='select qty_to_be_reworked,qty_reworked,'+#13+
                'qty_to_be_remaked,qty_remaked,status'+#13+
                'from data0414 where rkey='+inttostr(self.rkey414);
      open;
      edit;
      fieldbyname('qty_reworked').AsInteger:=fieldbyname('qty_reworked').AsInteger+
                                             strtoint(self.Edit9.Text);
       {
      if  (fieldbyname('qty_reworked').AsInteger >=
           fieldbyname('qty_to_be_reworked').AsInteger) and
          (fieldbyname('qty_remaked').AsInteger >=
           fieldbyname('qty_to_be_remaked').AsInteger) then     }
       fieldbyname('status').AsInteger:=3;
      post;
     end;

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


end;

end;

procedure TForm_bomview.Edit2Exit(Sender: TObject);
begin
// if self.PPC_CONTROL18=1 then
 if roundto(strtofloat(edit2.Text),-2) > roundto(self.EST_SCRAP,-2)  then
  begin
   showmsg('报废率不允许调高!',1);
//   edit2.Text:=floattostr(EST_SCRAP);
   edit2.SetFocus;
   exit;
  end;

if (combobox1.ItemIndex=1) or
   (combobox1.ItemIndex=2) or
   (combobox1.ItemIndex=4) then
 begin
   edit8.Text:=inttostr(ceil(strtoint(edit7.Text)*
                   (1+strtofloat(self.edit2.text)*0.01)));//计划数
   self.ComboBox3Change(sender);
 end;
  
end;


procedure TForm_bomview.FormCreate(Sender: TObject);
begin
  rkey34:=tstringlist.Create;
  Self.LoadPri;         //加载优先级
end;

procedure TForm_bomview.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
rkey34.Free;
end;

procedure TForm_bomview.ComboBox2Change(Sender: TObject);
begin
rkey0034.Caption:=rkey34.Strings[combobox2.itemindex];
end;

procedure TForm_bomview.SpeedButton2Click(Sender: TObject);
var
 i,a_pcs:integer;
begin
a_pcs:=0;
try
for i:=1 to stg1.RowCount-1 do
 begin
  if trim(stg1.Cells[3,i])='3' then
   begin
    if trim(stg1.Cells[2,i])='' then
      A_pcs:=0
    else
      A_pcs:=strtoint(trim(stg1.Cells[2,i]));
    break;
   end;
 end;
except
 showmsg('大料拼版参数有误',1);
 stg1.SetFocus;
end;
if a_pcs>0 then
self.Edit5.Text:= inttostr(ceil(strtoint(self.edit9.Text)/A_pcs));

end;



procedure TForm_bomview.ComboBox3Change(Sender: TObject);
var
 a_pan,b_pan:integer;
begin
a_pan:=0;
b_pan:=0;
treeview1.Items[0].Selected:=true;
if strtoint(edit8.Text)>0 then
edit9.Text:=inttostr(                           
self.cacl_totalpcs(combobox3.ItemIndex,strtoint(edit8.Text),a_pan,b_pan)); //投产数

if strtoint(edit13.Text)>0 then
edit12.Text:=Floattostrf(                          //超投率%
 (strtoint(edit9.Text)-strtoint(edit13.Text))/
                  strtoint(edit13.Text)*100,ffFixed,8,2);

edit5.Text:=inttostr(a_pan);
edit11.Text:=inttostr(b_pan);
end;

procedure TForm_bomview.Edit7Exit(Sender: TObject);
begin
{
0:订单投产
1:补料投产
2:按MRB重投
3:按MRB返修
4:按板号投产
}

 if combobox1.ItemIndex<>3 then    //不按返修投产
  begin
   edit8.Text:=inttostr(ceil(strtoint(edit7.Text)*
                   (1+strtofloat(self.edit2.text)*0.01)));//计划数
   if (combobox1.ItemIndex=1) or (combobox1.ItemIndex=4) then
    edit13.Text:=edit7.Text;
//      Edit13.Text:= '0';
   self.ComboBox3Change(sender);
  end;
  
  if combobox1.ItemIndex=2 then
   if (strtoint(self.Edit7.Text) >
       strtoint(self.Edit13.Text)) then
    begin
     if self.d25_type=0 then  //如果批量
      begin
       edit10.Text:='超投';
       edit10.Color:=clfuchsia;
      end
     else                     //如果样板
      if strtofloat(edit12.Text) > self.ct_perenct then
       begin
        edit10.Text:='超投';
        edit10.Color:=clfuchsia;
       end
      else
       begin
        edit10.Text:='未超投';
        edit10.Color:=claqua;
       end;
    end
   else
     begin
      edit10.Text:='未超投';
      edit10.Color:=claqua;
     end
  else
   if (combobox1.ItemIndex=1) or (combobox1.ItemIndex=4) then
   begin
    edit10.Text:='超投';
    edit10.Color:=clfuchsia;
   end;

end;

procedure TForm_bomview.TreeView1Changing(Sender: TObject; Node: TTreeNode;
  var AllowChange: Boolean);
var
   i:integer;
begin
 for i:=1 to stg1.RowCount-1  do
 begin
  dm.ADO279.First;
  while not dm.ADO279.Eof do
   begin
    if trim(dm.ADO279SPEC_RKEY.Value)=trim(stg1.Cells[3,i]) then
     begin
      if trim(dm.ADO279PARAMETER_DESC.Value)<>trim(stg1.Cells[2,i]) then
       begin
        dm.ADO279.Edit;
        dm.ADO279PARAMETER_DESC.Value:=stg1.Cells[2,i];
        dm.ADO279.Post;
       end;
      break;
     end;
    dm.ADO279.Next;
   end;
 end;
end;

procedure TForm_bomview.BitBtn1Enter(Sender: TObject);
var AllowChange: Boolean;
begin
  TreeView1Changing(sender,treeview1.Selected,AllowChange);
end;

procedure TForm_bomview.btn1Click(Sender: TObject);
begin
  if Assigned(frmMIStep) then frmMIStep.Free;
  frmMIStep := TfrmMIStep.Create(Self);
  try
    frmMIStep.rkey25:= IntToStr(rkey25);
    frmMIStep.ShowModal;
  finally
    FreeAndNil(frmMIStep);
  end;
end;


procedure TForm_bomview.LoadPri;
begin
 with dm.ADOQuery1 do
  begin
   close;
   sql.Text:=
    'SELECT PRIORITY_CODE,PRIORITY_name FROM DATA0283 ORDER BY PRIORITY_CODE';
   open;
   IF NOT IsEmpty then
   begin
     First;
     while not Eof do
     begin
       cbb1.Items.AddObject(FieldByName('PRIORITY_name').AsString,Pointer(FieldByName('PRIORITY_CODE').AsInteger));
       Next;
     end;
     cbb1.ItemIndex:= 0;
   end;
  end;
end;

function TForm_bomview.Calc_pcs_sq(Arkey25: Integer): Double;
var
  filestr:string;
  Lqty,Len,wid: string;
//  FLqty,FLen,Fwid :Double;
begin
  Result:= 0;
  filestr:= DM.ADO279.Filter;
  try
    dm.ADO279.Filter:='PRODUCTION_FLAG = ' + IntToStr(Arkey25);
    DM.ADO279.First;
    while not dm.ADO279.Eof do
    begin
      if Trim(DM.ADO279spec_rkey.AsString) = '3' then  LQty := Trim(dm.ADO279PARAMETER_DESC.AsString)
      else if Trim(DM.ADO279spec_rkey.AsString) = '6' then  Len := Trim(dm.ADO279PARAMETER_DESC.AsString)
      else if Trim(DM.ADO279spec_rkey.AsString) = '7' then  wid := Trim(dm.ADO279PARAMETER_DESC.AsString);
      dm.ADO279.Next;
    end;
//    ShowMessage(Lqty);
//    ShowMessage(Len);
//    ShowMessage(wid);
    Result:= StrToFloatDef(Len,0) * StrToFloatDef(wid,0) / StrToFloatDef(Lqty,0)/1000000;
  finally
    dm.ADO279.Filter:=  filestr;
  end;
end;

end.
