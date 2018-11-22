unit layersdata_select;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, ImgList;

type
  TForm_layersdata = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    TreeView1: TTreeView;
    rkey25: TLabel;
    ImageList1: TImageList;
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
   procedure get_treedate(rkey25: integer;treeview:Ttreeview);
  public
    { Public declarations }
  end;

var
  Form_layersdata: TForm_layersdata;

implementation

uses damo;

{$R *.dfm}

procedure TForm_layersdata.get_treedate(rkey25: integer;treeview:Ttreeview);
var
 node:ttreenode;   //treeview控件的节点变量
 rkey0025:^integer;
 LNodeArr:array of TTreeNode;
 i,j:Integer;
begin

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
//    ShowMessage(SQL.Text);
       open;
    if not IsEmpty then
    begin
      j:=0;
      while not Eof do
      begin
        new(rkey0025);
        rkey0025^ := fieldvalues['rkey'];
        if fieldbyname('PARENT_PTR').AsInteger = 0 then
          node := treeview.Items.AddObject
          (nil,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025) //增加顶层节点
        else
        begin
          for i:=0 to Length(LNodeArr)-1 do
          begin
            if Integer(LNodeArr[i].data^) = fieldbyname('PARENT_PTR').AsInteger  then
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

//with dm.ADOQuery1 do
// begin
//  close;
//  sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where rkey='+
//              inttostr(rkey25);
//  open;
//  new(rkey0025);
//  rkey0025^:=fieldvalues['rkey'];
//  node:=treeview.Items.AddObject
//  (nil,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025); //增加顶层节点
//  node.ImageIndex:=0;  //为第一层节点定义图画
// end;
//
//with dm.ADOQuery1 do
// begin
//  close;
//  sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
//              inttostr(rkey25);
//  open;
//  while not dm.ADOQuery1.Eof do
//  begin
//   new(rkey0025);
//   rkey0025^:= dm.ADOQuery1.fieldvalues['rkey'];
//   node:=treeview.Items.AddChildObject
//      (node,fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
//   node.ImageIndex := 1;
//   with dm.ADOQuery2 do
//    begin
//     close;
//     sql.Text:='select rkey,MANU_PART_NUMBER from data0025 where parent_ptr='+
//              dm.ADOQuery1.fieldbyname('rkey').AsString;
//     open;
//     while not dm.ADOQuery2.Eof do
//     begin
//      new(rkey0025);
//      rkey0025^:= dm.ADOQuery2.fieldvalues['rkey'];
//      node:=treeview.Items.AddChildObject
//       (node, dm.ADOQuery2.fieldbyname('MANU_PART_NUMBER').AsString,rkey0025);
//
//      node.ImageIndex := 2;
//      node:=node.Parent;
//      dm.ADOQuery2.Next;
//     end;
//    end;
//   node:=node.Parent; //节点指向其父节点值
//   dm.ADOQuery1.Next;
//  end;
// end;

 treeview.FullExpand; //全部展开
 treeview.Items[0].Selected:=true;
end;

procedure TForm_layersdata.TreeView1Change(Sender: TObject;
  Node: TTreeNode);
begin
 rkey25.Caption:=inttostr(Pinteger(Node.data)^);
 node.SelectedIndex:=4;
end;

procedure TForm_layersdata.FormActivate(Sender: TObject);
begin
self.get_treedate(dm.ads273CUSTOMER_PART_PTR.Value,treeview1);
end;

end.
