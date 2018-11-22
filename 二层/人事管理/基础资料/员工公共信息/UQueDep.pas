unit UQueDep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus, DB,ComObj, Excel97,
  ADODB, ppDB, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppEndUsr,
  ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppModule, raCodMod,
  ppStrtch, ppMemo, ppSubRpt, daDataModule, ComCtrls, ImgList;

type
  TQueDep_Form = class(TForm)
    TreeView1: TTreeView;
    ImageList1: TImageList;
    CancelBtn: TButton;
    OKBtn: TButton;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure OKBtnClick(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure CreateNode(ParentNode:TTreeNode;Query:TADOQuery);
    procedure CreateTree();
    { Private declarations }
  public
    dep_rkey:Integer;
    dep_name:string;
    { Public declarations }
  end;

var
  QueDep_Form: TQueDep_Form;

implementation

uses UDM;

{$R *.dfm}

procedure TQueDep_Form.FormCreate(Sender: TObject);
begin
 with dm.tmp do
 begin
       dm.employee_department.Close;
       dm.employee_department.Open;
       CreateTree;
       dm.employee_department.First;
 end;
 TreeView1.Items[0].Selected := True; 
end;

procedure TQueDep_Form.CreateTree();
var
BootNode:TTreeNode; //根结点
NodeInfo:^Integer; //rkey
begin
   TreeView1.Items.Clear;
      with DM.employee_department do
      begin
          Filtered:=False;
          Filter:= 'superior=0';
          Filtered:=True;
          First;
          while not Eof do
          begin
              New(NodeInfo);
              NodeInfo^:=FieldByName('rkey').AsInteger;
              BootNode:=TreeView1.Items.AddChildObject(nil,FieldByName('departmentname').AsString,NodeInfo); //添加根结点，并关联根结点信息
              CreateNode(BootNode,DM.employee_department);
              Next;
          end;
          First;
         { New(NodeInfo);
          NodeInfo^:=FieldByName('rkey').AsInteger;
          TreeView1.Items.Clear;
          BootNode:=TreeView1.Items.AddChildObject(nil,FieldByName('departmentname').AsString,NodeInfo); //添加根结点，并关联根结点信息
            }
      end;

    //创建树
    TreeView1.FullExpand; //展开所有树结点

    TreeView1.ReadOnly:=true;
    TreeView1.DragMode:=dmAutomatic;
end;

procedure TQueDep_Form.CreateNode(ParentNode: TTreeNode;Query: TADOQuery);
var
ChildNode:TTreeNode; //孩子结点
NodeInfo:^Integer; //rkey
QueryTmp:TADOQuery;
begin
    QueryTmp:=TADOQuery.Create(Self);
    QueryTmp.Clone(Query);
    with QueryTmp do
    begin
      Filtered:=False;
      Filter:= 'superior='+IntToStr(Integer(ParentNode.Data^));
      Filtered:=true;
      while not Eof do
      begin
       New(NodeInfo);
       NodeInfo^:=FieldByName('rkey').AsInteger;
       ChildNode:=TreeView1.Items.AddChildObject(ParentNode,FieldByName('departmentname').AsString,NodeInfo); //添加孩子结点，并关联孩子结点信息
       CreateNode(ChildNode,Query); //递归
       Next;
      end;
    end;
    QueryTmp.Free;
end;

procedure TQueDep_Form.TreeView1Click(Sender: TObject);
var
NodeSlt:TTreeNode;
begin
  //树的单击事件，得到rkey
  if TreeView1.Selected<>nil then   //showmodal返回后树将不存在选中结点，此时取根结点
      NodeSlt:=TreeView1.Selected
  else
      NodeSlt:=TreeView1.Items[0];
 // ShowMessage(IntToStr(Integer(NodeSlt.Data^)));
  with DM.employee_department do
  begin
    Filtered:=False;
    Filter:='superior='+IntToStr(Integer(NodeSlt.Data^));
    Filtered:=true;
  end;
  //de_rkey := Integer(NodeSlt.Data^);
  //dep_name :=  TreeView1.Selected.Text;

end;

procedure TQueDep_Form.TreeView1GetImageIndex(Sender: TObject;
  Node: TTreeNode);
begin
  if Node.HasChildren then Node.ImageIndex:=1 else Node.ImageIndex:=2
end;

procedure TQueDep_Form.OKBtnClick(Sender: TObject);
var
NodeSlt:TTreeNode;
begin
  if TreeView1.Selected<>nil then   //showmodal返回后树将不存在选中结点，此时取根结点
      NodeSlt:=TreeView1.Selected
  else
      NodeSlt:=TreeView1.Items[0];
  dep_rkey := Integer(NodeSlt.Data^);
  dep_name :=  TreeView1.Selected.Text;
end;

procedure TQueDep_Form.TreeView1DblClick(Sender: TObject);
begin
   Self.OKBtnClick(Sender);
   Self.ModalResult := mrOk;
end;

procedure TQueDep_Form.FormShow(Sender: TObject);
var
i: Integer;
begin
  if dep_name <> ''then
  begin
        for   i:=0   to   TreeView1.Items.Count-1   do
        begin
            if   Pos(trim(dep_name), TreeView1.Items[i].Text)> 0   then
            begin
                TreeView1.Items[i].Selected:=true;
                Break;
            end
        end;
  end;
end;

end.
