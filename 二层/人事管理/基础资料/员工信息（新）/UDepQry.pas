unit UDepQry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls,common,UDetailFrm, DB, ADODB,Mainfrm;

type
  TFrmDepQry = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    tv1: TTreeView;
    btnCancel: TButton;
    btnOK: TButton;
    qryDep: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure tv1DblClick(Sender: TObject);
    procedure tv1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
    procedure CreateTree(tv:TTreeView; qry:TAdoQuery; fn:string ; fv:string;rkey:string;DisplayFieldName:string);
    procedure CreateNode(tv: TTreeView;ParentNode: TTreeNode;qry: TADOQuery; fn:string ; fv:string;rkey:string;DisplayFieldName:string);

  public
    { Public declarations }

    Prkey :integer;
    PDepName: string;
  end;

var
  FrmDepQry: TFrmDepQry;

implementation
             uses  udm;
{$R *.dfm}

// add by  lisa
procedure TFrmDepQry.CreateTree(tv:TTreeView; qry:TAdoQuery; fn:string ; fv:string;rkey:string;DisplayFieldName:string);
var
  BootNode: TTreeNode; //根结点
  NodeInfo: ^Integer; //rkey
begin
  tv.Items.Clear;
  with qry do
  begin
    Filtered := False;
    Filter :=' '+FN+'= '''+fv+''' ';
    Filtered := True;
    First;
    while not Eof do
    begin
      New(NodeInfo);
      NodeInfo^ := FieldByName(rkey).AsInteger;
      BootNode := tv.Items.AddChildObject(nil,FieldByName(DisplayFieldName).AsString,NodeInfo); //添加根结点，并关联根结点信息
      CreateNode(tv,BootNode,qry,fn,fv,rkey,DisplayFieldName); 
      Next;
    end;
    First;
  end;
  tv.ReadOnly := true;
  tv.DragMode := dmAutomatic;
end;

// add by lisa 
procedure TFrmDepQry.CreateNode(tv: TTreeView;ParentNode: TTreeNode;qry: TADOQuery; fn:string ; fv:string;rkey:string;DisplayFieldName:string);
var
  ChildNode:TTreeNode; //孩子结点
  NodeInfo:^Integer; //rkey
  QueryTmp:TADOQuery;
begin
    QueryTmp := TADOQuery.Create(nil);
    QueryTmp.Clone(qry);
    with QueryTmp do
    begin
      Filtered := False;
      Filter := ''+fn+' ='+IntToStr(Integer(ParentNode.Data^));
      Filtered := true;
      while not Eof do
      begin
       New(NodeInfo);
       NodeInfo^:=FieldByName(rkey).value;
       ChildNode:=tv.Items.AddChildObject(ParentNode,FieldByName(DisplayFieldName).AsString,NodeInfo); //添加孩子结点，并关联孩子结点信息
       CreateNode(tv,ChildNode,qry,fn,fv,rkey,DisplayFieldName); //递归
       Next;
      end;
      Free; //释放无用的query
    end;
end;



procedure TFrmDepQry.FormShow(Sender: TObject);
 var
i: Integer;
begin

    //加载部门：
    //procedure CreateTree(tv:TTreeView; qry:TAdoQuery; fn:string ; fv:string;rkey:string;DisplayFieldName:string);



         //初始化状态：

               tv1.Items[1].Selected:=true;
         {
         for   i:=0   to   tv1.Items.Count-1   do
        begin

                tv1.Items[i].Selected:=true;
            end;

  if PDepName <> ''then
  begin
        for   i:=0   to   tv1.Items.Count-1   do
        begin
            if   Pos(trim(PDepName), tv1.Items[i].Text)> 0   then
            begin
                tv1.Items[i].Selected:=true;
                Break;
            end
        end;
  end;

         }



end;

procedure TFrmDepQry.btnOKClick(Sender: TObject);
var
NodeSlt:TTreeNode;
begin
  if tv1.Selected<>nil then   //showmodal返回后树将不存在选中结点，此时取根结点
      NodeSlt:=tv1.Selected
  else
      NodeSlt:=tv1.Items[0];

    Prkey := integer(NodeSlt.data^);
    PDepName:= NodeSlt.Text;

end;

procedure TFrmDepQry.tv1DblClick(Sender: TObject);
begin
 // modalresult:=mrok;
 // Prkey:=integer(tv1.selected.data^);
 // PDepName:= tv1.selected.text;

     Self.btnOKClick(Sender);
    Self.ModalResult := mrOk;

end;

procedure TFrmDepQry.tv1Click(Sender: TObject);
var
NodeSlt:TTreeNode;
begin
  //树的单击事件，得到rkey
  if tv1.Selected<>nil then   //showmodal返回后树将不存在选中结点，此时取根结点
      NodeSlt:=tv1.Selected
  else
      NodeSlt:=tv1.Items[0];
 // ShowMessage(IntToStr(Integer(NodeSlt.Data^)));
  with FrmMain.qryDep do
  begin
    Filtered:=False;
    Filter:='superior='+IntToStr(Integer(NodeSlt.Data^));
    Filtered:=true;
  end;
end;

procedure TFrmDepQry.FormCreate(Sender: TObject);
begin
      if not self.qryDep.Active  then  self.qryDep.open;

         //CreateTree(tv1,qryDep,'superior','0','rkey','departmentname')  ;
         CreateTree(tv1,qryDep,'superior','0','rkey','departmentname')  ;
           tv1.Items[0].Selected := True;

end;

procedure TFrmDepQry.btnCancelClick(Sender: TObject);
begin
close;
end;

end.
