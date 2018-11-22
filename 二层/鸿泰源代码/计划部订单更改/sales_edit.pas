unit sales_edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Grids, Menus, DBGrids, ExtCtrls,
  ImgList;

type
 PTreeValue=^TTreeValue;
  TTreeValue=record
  rkey25:integer;
  manu_desc:string;
 end;
   
type
  TForm12 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label2: TLabel;
    Label11: TLabel;
    Edit2: TEdit;
    Label1: TLabel;
    Edit3: TEdit;
    Label12: TLabel;
    Label3: TLabel;
    Label19: TLabel;
    Edit10: TEdit;
    BitBtn7: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Label6: TLabel;
    TabSheet3: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    StringGrid1: TStringGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    TabSheet4: TTabSheet;
    TreeView1: TTreeView;
    TreeView2: TTreeView;
    ImageList1: TImageList;
    rkey25: TLabel;
    target_rkey25: TLabel;
    manu_desc: TLabel;
    target_desc: TLabel;
    TabSheet5: TTabSheet;
    DBGrid1: TDBGrid;
    StringGrid4: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    StringGrid3: TStringGrid;
    CheckBox1: TCheckBox;
    Label9: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure TreeView2Change(Sender: TObject; Node: TTreeNode);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
   function cacl_deficiency(rkey10: integer): currency;
   procedure get_treedate(rkey25: integer;treeview:Ttreeview);

   procedure update_wo();
   procedure update_tarwo();
   function find_tarrkey25(): boolean;
   function findall_tarrkey25(): boolean;
   function findall_tarr492key25(): boolean;
  public
    { Public declarations }
   rkey12:integer;
   function find_rkey25(rkey25: integer): integer;
  end;

var
  Form12: TForm12;

implementation

uses damo, partsearch, address_search, edit_rep;

{$R *.dfm}
procedure TForm12.update_tarwo;
var
 i:integer;
begin
dm.ado06.First;
for i:=1 to  stringgrid4.RowCount-2 do  stringgrid4.Rows[i].Clear;
 stringgrid4.RowCount:=dm.ado06.RecordCount+2;
for i:=1 to dm.ado06.RecordCount do
begin
 stringgrid4.Cells[0,i]:=dm.ado06WORK_ORDER_NUMBER.Value;
 stringgrid4.Cells[1,i]:=dm.ado06CUT_NO.Value;
 stringgrid4.Cells[2,i]:=dm.ado06MANU_PART_NUMBER.Value;
 stringgrid4.Cells[3,i]:=dm.ado06MANU_PART_DESC.Value;
 stringgrid4.Cells[4,i]:=dm.ado06QUAN_SCH.AsString;
 stringgrid4.Cells[5,i]:=dm.ado06QUAN_REJ.AsString;
 stringgrid4.Cells[6,i]:=dm.ado06QUAN_PROD.AsString;
 stringgrid4.Cells[7,i]:=dm.ado06wip_qty.AsString;
 stringgrid4.Cells[8,i]:=dm.ado06v_status.Value;
 stringgrid4.Cells[9,i]:=dm.ado06RKEY.AsString;
 stringgrid4.Cells[10,i]:=dm.ado06BOM_PTR.AsString;
 stringgrid4.Cells[11,i]:=inttostr(self.find_rkey25(dm.ado06BOM_PTR.Value));
 dm.ado06.Next;
end;
end;

procedure TForm12.update_wo;
var
 i:integer;
begin
dm.ado06.First;
for i:=1 to  stringgrid3.RowCount-2 do  stringgrid3.Rows[i].Clear;
stringgrid3.RowCount:=dm.ado06.RecordCount+2;
for i:=1 to dm.ado06.RecordCount do
begin
 stringgrid3.Cells[0,i]:=dm.ado06WORK_ORDER_NUMBER.Value;
 stringgrid3.Cells[1,i]:=dm.ado06CUT_NO.Value;
 stringgrid3.Cells[2,i]:=dm.ado06MANU_PART_NUMBER.Value;
 stringgrid3.Cells[3,i]:=dm.ado06MANU_PART_DESC.Value;
 stringgrid3.Cells[4,i]:=dm.ado06QUAN_SCH.AsString;
 stringgrid3.Cells[5,i]:=dm.ado06QUAN_REJ.AsString;
 stringgrid3.Cells[6,i]:=dm.ado06QUAN_PROD.AsString;
 stringgrid3.Cells[7,i]:=dm.ado06wip_qty.AsString;
 stringgrid3.Cells[8,i]:=dm.ado06v_status.Value;
 stringgrid3.Cells[9,i]:=dm.ado06RKEY.AsString;
 stringgrid3.Cells[10,i]:=dm.ado06BOM_PTR.AsString;
 dm.ado06.Next;
end;
end;

procedure TForm12.get_treedate(rkey25: integer;treeview:Ttreeview);
var
 node:ttreenode;   //treeview控件的节点变量
 rkey0025:PTreeValue;
 LNodeArr:array of TTreeNode;
 i,j:Integer;
begin

  with dm.ADOQuery1 do
  begin
    close;
    sql.Text:=' ;with CTE(rkey,PARENT_PTR,MANU_PART_NUMBER,manu_part_desc,lv) as    ' + #13+
              '(    ' + #13+
              '  select rkey,PARENT_PTR,MANU_PART_NUMBER,manu_part_desc,0  '+ #13+
              '  from data0025 where rkey='+inttostr(rkey25) + #13+
              '  UNION ALL  '+ #13+
              '  select d25.rkey,d25.PARENT_PTR,d25.MANU_PART_NUMBER,d25.manu_part_desc,cte.lv+1 ' + #13+
              '  from data0025 d25 INNER JOIN CTE on	d25.parent_ptr=CTE.rkey ' + #13+
              ')  ' + #13+
              ' select * from CTE order by lv ';
//    ShowMessage(SQL.Text);
       open;
    if not IsEmpty then
    begin
      j:=0;
      while not Eof do
      begin
        new(rkey0025);
        rkey0025.rkey25 := fieldvalues['rkey'];
        rkey0025.manu_desc:=fieldbyname('manu_part_desc').AsString;
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
        Next;
      end;
    end;
  end;


//
//with dm.ADOQuery1 do          //第一级
// begin
//  close;
//  sql.Text:='select rkey,MANU_PART_NUMBER,manu_part_desc from data0025 where rkey='+
//              inttostr(rkey25);
//  open;
//  new(rkey0025);
//  rkey0025.rkey25:=fieldvalues['rkey'];
//  rkey0025.manu_desc:=fieldbyname('manu_part_desc').AsString;
//  node:=treeview.Items.AddObject
//  (nil,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025); //增加顶层节点
//  node.ImageIndex:=0;  //为第一层节点定义图画
// end;
//
//with dm.ADOQuery1 do      //第二级
// begin
//  close;
//  sql.Text:='select rkey,MANU_PART_NUMBER,manu_part_desc from data0025 where parent_ptr='+
//              inttostr(rkey25);
//  open;
//  while not dm.ADOQuery1.Eof do
//  begin
//   new(rkey0025);
//   rkey0025.rkey25:= dm.ADOQuery1.fieldvalues['rkey'];
//   rkey0025.manu_desc:=dm.ADOQuery1.fieldbyname('manu_part_desc').AsString;
//   node:=treeview.Items.AddChildObject
//      (node,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
//   node.ImageIndex := 1;
//   with dm.ADOQuery2 do        //第三级
//    begin
//     close;
//     sql.Text:='select rkey,MANU_PART_NUMBER,manu_part_desc from data0025 where parent_ptr='+
//              dm.ADOQuery1.fieldbyname('rkey').AsString;
//     open;
//     while not dm.ADOQuery2.Eof do
//     begin
//      new(rkey0025);
//      rkey0025.rkey25:= dm.ADOQuery2.fieldvalues['rkey'];
//      rkey0025.manu_desc:=dm.ADOQuery2.fieldbyname('manu_part_desc').AsString;
//      node:=treeview.Items.AddChildObject
//       (node, dm.ADOQuery2.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
//      node.ImageIndex := 2;
//
//       with dm.ADOQuery4 do        //第四级
//        begin
//         close;
//         sql.Text:='select rkey,MANU_PART_NUMBER,manu_part_desc from data0025 where parent_ptr='+
//                  dm.ADOQuery2.fieldbyname('rkey').AsString;
//         open;
//         while not dm.ADOQuery4.Eof do
//         begin
//          new(rkey0025);
//          rkey0025.rkey25:= dm.ADOQuery4.fieldvalues['rkey'];
//          rkey0025.manu_desc:=dm.ADOQuery4.fieldbyname('manu_part_desc').AsString;
//          node:=treeview.Items.AddChildObject
//           (node, dm.ADOQuery4.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
//          node.ImageIndex := 3;
//          node:=node.Parent;
//          dm.ADOQuery4.Next;
//         end;
//        end;
//
//      node:=node.Parent;
//      dm.ADOQuery2.Next;
//     end;
//    end;
//   node:=node.Parent;         //节点指向其父节点值
//   dm.ADOQuery1.Next;
//  end;
// end;

 treeview.FullExpand;          //全部展开

end;

function TForm12.cacl_deficiency(rkey10: integer): currency;
var
 V_defi:currency;
begin
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('SELECT SUM((INVOICE_TOTAL - amount_paid - CASH_DISC)*EXCHANGE_RATE)');
   sql.Add('AS total_amount FROM dbo.Data0112');
   sql.Add('where customer_ptr='+inttostr(rkey10));
   sql.Add('and invoice_status=1');
   sql.Add('group by customer_ptr');
   open;
   if not isempty then
    v_defi:= fieldvalues['total_amount']
   else
    v_defi:=0;
  end;  //计算用户所开出发票的所欠金额

 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('SELECT SUM(AVL_AMT * EX_RATE)');
   sql.Add('AS total_amount FROM dbo.Data0116');
   sql.Add('where CUST_PTR='+inttostr(rkey10));
   sql.Add('and memo_status=1');
   sql.Add('group by CUST_PTR');
   open;
   if not isempty then
    result:=v_defi-fieldvalues['total_amount']
   else
    result:=v_defi;
  end;  //计算用户贷项备忘

end;

procedure TForm12.FormActivate(Sender: TObject);
var
 i:integer;
begin

  stringgrid1.Cells[0,0]:='替换前生产编号';
  stringgrid1.Cells[1,0]:='客户型号';
  stringgrid1.Cells[2,0]:='替换后生产编号';
  stringgrid1.Cells[3,0]:='客户型号';
  stringgrid1.Cells[4,0]:='原25.rkey';
  stringgrid1.Cells[5,0]:='新25.rkey';
  stringgrid1.ColWidths[4]:=-1;
  stringgrid1.ColWidths[5]:=-1;

  stringgrid3.Cells[0,0]:='作业单号';
  stringgrid3.Cells[1,0]:='配料单号';
  stringgrid3.Cells[2,0]:='本厂编号';
  stringgrid3.Cells[3,0]:='客户型号';
  stringgrid3.Cells[4,0]:='投产数量';
  stringgrid3.Cells[5,0]:='报废数量';
  stringgrid3.Cells[6,0]:='完工数量';
  stringgrid3.Cells[7,0]:='在线数量';
  stringgrid3.Cells[8,0]:='状态';
  stringgrid3.Cells[9,0]:='rkey06';
  stringgrid3.Cells[10,0]:='rkey25';
  stringgrid3.ColWidths[9]:=-1;
  stringgrid3.ColWidths[10]:=-1;

  stringgrid4.Cells[0,0]:='作业单号';
  stringgrid4.Cells[1,0]:='配料单号';
  stringgrid4.Cells[2,0]:='本厂编号';
  stringgrid4.Cells[3,0]:='客户型号';
  stringgrid4.Cells[4,0]:='投产数量';
  stringgrid4.Cells[5,0]:='报废数量';
  stringgrid4.Cells[6,0]:='完工数量';
  stringgrid4.Cells[7,0]:='在线数量';
  stringgrid4.Cells[8,0]:='状态';
  stringgrid4.Cells[9,0]:='rkey06';
  stringgrid4.Cells[10,0]:='rkey25';
  stringgrid4.Cells[11,0]:='tarrkey25';
  stringgrid4.ColWidths[9]:=0;
  stringgrid4.ColWidths[10]:=0;
  stringgrid4.ColWidths[11]:=0;

self.update_wo;   //查询出可以修改的作业单

 with dm.ADOQuery1 do        //开始，查找装运地点
  begin
   active:=false;
   sql.Clear;
   sql.Add('select data0012.rkey,location,ship_to_address_1,state,zip,SHIP_CTAX_PTR,');
   sql.Add('SHIP_TO_CONTACT,SHIP_TO_PHONE,SHIP_SHIPPING_METHOD,SHIP_FOB,');
   sql.Add('STATE_SHIP_TAX_FLAG,STATE_PROD_TAX_FLAG,STATE_TOOL_TAX_FLAG');
   sql.Add('from data0012');
   sql.Add('where data0012.rkey='+inttostr(self.rkey12));
   active:=true;
   if not IsEmpty then
    begin
     rkey12:=fieldvalues['rkey'];
     edit10.Text:=fieldbyname('location').AsString;
    end
   else
    rkey12:=0;
  end;


 case dm.ADO60CREDIT_RATING.Value of
  1:edit5.Text:='优';
  2:edit5.Text:='良';
  3:edit5.Text:='差';
 end;
 edit6.Text:= dm.ADO60credit_limit.AsString;
 //frmcustpart.ADOQuery1credit_limit.AsString;

 edit7.Text:=currtostr(cacl_deficiency(dm.ADO60CUSTOMER_PTR.Value));
  //计算用户所开出发票的所欠金额

 get_treedate(dm.ADO60CUST_PART_PTR.Value,treeview1);
 get_treedate(frmcustpart.ADOQuery1rkey.Value,treeview2);

 if treeview1.Items.Count=treeview2.Items.Count then
 begin
  for i:=0 to treeview1.Items.Count-1 do
  begin
   treeview1.Items[i].Selected:=true;
   treeview2.Items[i].Selected:=true;
   speedbutton1click(sender);
  end;
 end;
 
  treeview1.Items[0].Selected:=true;
  treeview2.Items[0].Selected:=true;

end;

procedure TForm12.BitBtn7Click(Sender: TObject);
begin
form_address:=tform_address.Create(application);
form_address.ADOQuery1.Close;
form_address.ADOQuery1.Parameters[0].Value:=frmcustpart.ADOQuery1customer_ptr.Value;
form_address.ADOQuery1.Open;
if form_address.ShowModal=mrok then
 begin
  rkey12:=form_address.ADOQuery1.fieldvalues['rkey'];
  edit10.Text:=form_address.ADOQuery1.fieldbyname('location').AsString;
 end;
form_address.Free;
end;

procedure TForm12.Button1Click(Sender: TObject);
var
 v_credit:double;
 i:integer;
begin
 if rkey12=0 then
  begin
   showmessage('请确认装运地点!');
   bitbtn7.SetFocus;
   exit;
  end;
                                        //没的找目标值
 if (CheckBox1.Checked) and (not findall_tarr492key25) then
 begin
  messagedlg('请首先进行线路层,本厂编号对应!',mterror,[mbcancel],0);
  Exit;
 end;
  
{ if treeview1.Items.Count<>treeview2.Items.Count then
  begin
   messagedlg('所选择的产品线路层与原订单线路层不一致无法进行!',mterror,[mbcancel],0);
   exit;
  end;
 }
 self.ModalResult:=mrok;
end;

procedure TForm12.SpeedButton2Click(Sender: TObject);
var
 i:word;
begin
if stringgrid1.Row<>stringgrid1.RowCount-1 then
begin
 for i:= stringgrid1.row to stringgrid1.RowCount-2 do
  stringgrid1.Rows[i].Text:=stringgrid1.Rows[i+1].Text;
 stringgrid1.RowCount:=stringgrid1.RowCount-1;
if stringgrid1.RowCount=2 then speedbutton2.Enabled:=false;
end;
end;

procedure TForm12.PopupMenu2Popup(Sender: TObject);
begin
if stringgrid1.Row=stringgrid1.RowCount-1 then
 begin
  n1.Enabled:=false;
 end
else
 begin
  n1.Enabled:=true;
 end;
end;

procedure TForm12.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  column,row:longint;
begin
if button=mbright then
 begin
   stringgrid1.MouseToCell(x,y,column,row);
   if row<>0 then stringgrid1.Row:=row;
 end;
end;

procedure TForm12.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='S') and (ssalt in shift) then
  showmessage(dm.ado06.SQL.Text);
end;

procedure TForm12.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
 rkey25.Caption:=inttostr(PTreeValue(Node.data)^.rkey25);
 manu_desc.Caption:= PTreeValue(Node.data)^.manu_desc;
 node.SelectedIndex:=4;
end;

procedure TForm12.TreeView2Change(Sender: TObject; Node: TTreeNode);
begin
 target_rkey25.Caption:=inttostr(PTreeValue(Node.data)^.rkey25);
  target_desc.Caption:= PTreeValue(Node.data)^.manu_desc;
 node.SelectedIndex:=4;
end;

function TForm12.find_rkey25(rkey25: integer): integer;
var
 i:word;
begin
 result:=0;
 for i:=1 to stringgrid1.RowCount-2 do
 if strtoint(stringgrid1.Cells[4,i])=rkey25 then
 begin
  result:=strtoint(stringgrid1.Cells[5,i]);
  break;
 end;
end;

procedure TForm12.SpeedButton1Click(Sender: TObject);
var
 node:ttreenode;   //treeview控件的节点变量
begin
 if find_rkey25(strtoint(rkey25.Caption))=0 then
 begin
   node:=treeview1.Selected;
   stringgrid1.Cells[0,stringgrid1.RowCount-1]:=node.Text;
   stringgrid1.Cells[1,stringgrid1.RowCount-1]:=manu_desc.Caption;
   stringgrid1.Cells[4,stringgrid1.RowCount-1]:=self.rkey25.Caption;     //原25.rkey
   node:=treeview2.Selected;
   stringgrid1.Cells[2,stringgrid1.RowCount-1]:=node.Text;
   stringgrid1.Cells[3,stringgrid1.RowCount-1]:=target_desc.Caption;
   stringgrid1.Cells[5,stringgrid1.RowCount-1]:=self.target_rkey25.Caption; //新25.rkey
   stringgrid1.RowCount:=stringgrid1.RowCount+1;
   speedbutton2.Enabled:=true;
 end
 else
  messagedlg('需要更换的线路层已经有对应目标线路层',MTERROR,[mbcancel],0);
end;

function TForm12.findall_tarr492key25(): boolean;
begin
result:=true;
dm.aq492.First;
 while not dm.aq492.Eof do
  begin
   if find_rkey25(dm.aq492BOM_PTR.Value)=0 then
   begin
    result:=false;
    break;
   end;
   dm.aq492.Next;
  end;
dm.aq492.First;  
end;

function TForm12.findall_tarrkey25(): boolean;
var
 i:integer;
begin
result:=true;
for i:=1 to stringgrid3.RowCount-2 do
  begin
   if find_rkey25(strtoint(stringgrid3.Cells[10,i]))=0 then
   begin
    result:=false;
    break;
   end;
  end;
end;

function TForm12.find_tarrkey25(): boolean;
var
 i:integer;
begin
result:=true;
for i:=stringgrid3.Selection.Top to stringgrid3.Selection.Bottom do
 if i<>stringgrid3.RowCount-1 then
  begin
   if find_rkey25(strtoint(stringgrid3.Cells[10,i]))=0 then
   begin
    result:=false;
    break;
   end;
  end;
end;

procedure TForm12.BitBtn4Click(Sender: TObject);
var
 i:integer;
begin
if stringgrid4.RowCount>2 then self.update_wo;

for i:=1 to  stringgrid4.RowCount-2 do
 stringgrid4.Rows[i].Clear;
 stringgrid4.RowCount:=2;
end;

procedure TForm12.BitBtn1Click(Sender: TObject);
var
 i,j:integer;
begin
if find_tarrkey25 then
begin
 for i:=stringgrid3.Selection.Top to stringgrid3.Selection.Bottom do
  if i<>stringgrid3.RowCount-1 then       //如果当前行不是最后一行
  begin
   stringgrid4.Rows[stringgrid4.RowCount-1].Text := stringgrid3.Rows[i].Text;
   stringgrid4.Cells[11,stringgrid4.RowCount-1]:=
    inttostr(self.find_rkey25(strtoint(stringgrid4.Cells[10,stringgrid4.RowCount-1])));
   stringgrid4.RowCount := stringgrid4.RowCount+1;
  end;

 for i:=stringgrid3.Selection.Top to stringgrid3.Selection.Bottom do
  begin                          //第二步实现stg3的删除
   for j:=stringgrid3.Selection.Top to stringgrid3.RowCount-2 do
    stringgrid3.Rows[j].Text:=stringgrid3.Rows[j+1].Text;

   if stringgrid3.Selection.Top<=stringgrid3.RowCount-2 then
    stringgrid3.RowCount:=stringgrid3.RowCount-1;
  end;
end
else
 messagedlg('请首先进行线路层,本厂编号对应!',mterror,[mbcancel],0);
end;



procedure TForm12.BitBtn2Click(Sender: TObject);
var
 i:integer;
begin
if findall_tarrkey25 then
 begin
  if stringgrid3.RowCount>2 then self.update_tarwo;
  for i:=1 to  stringgrid3.RowCount-2 do
   stringgrid3.Rows[i].Clear;
   stringgrid3.RowCount:=2;
 end
else
  messagedlg('请首先进行线路层,本厂编号对应!',mterror,[mbcancel],0);
end;

procedure TForm12.BitBtn3Click(Sender: TObject);
var
 i,j:integer;
begin
for i:=stringgrid4.Selection.Top to stringgrid4.Selection.Bottom do
 if i<>stringgrid4.RowCount-1 then       //如果当前行不是最后一行
  begin
   stringgrid3.Rows[stringgrid3.RowCount-1].Text := stringgrid4.Rows[i].Text;
   stringgrid3.RowCount := stringgrid3.RowCount+1;
  end;

 for i:=stringgrid4.Selection.Top to stringgrid4.Selection.Bottom do
  begin                          //第二步实现的删除
   for j:=stringgrid4.Selection.Top to stringgrid4.RowCount-2 do
    stringgrid4.Rows[j].Text:=stringgrid4.Rows[j+1].Text;

   if stringgrid4.Selection.Top<=stringgrid4.RowCount-2 then
    stringgrid4.RowCount:=stringgrid4.RowCount-1;
  end;
end;

end.
