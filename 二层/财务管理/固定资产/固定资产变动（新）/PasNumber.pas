unit PasNumber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls,ADODB;

type
  TfrmNumber = class(TForm)
    tvTree: TTreeView;
    procedure FormShow(Sender: TObject);
    procedure tvTreeDblClick(Sender: TObject);
  private
      procedure CreateNode(ParNode:TTreeNode;Query:TADOQuery);
      procedure CreateTree();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNumber: TfrmNumber;

implementation

uses DAMO;

{$R *.dfm}

procedure TfrmNumber.FormShow(Sender: TObject);
begin
  Self.CreateTree;
  tvTree.Selected.Expanded:=True;
end;

procedure TfrmNumber.CreateNode(ParNode: TTreeNode; Query: TADOQuery);
var
  ChildNode:TTreeNode;
  NodeKey:^Integer;
  ADOTmp:TADOQuery;
begin
  ADOTmp:=TADOQuery.Create(Self);  //实例化一个ADO
  ADOTmp.Clone(Query);

  with ADOTmp do
  begin
    Filtered:=False;
    Filter:='PARENT_PTR = ' + IntToStr(Integer(ParNode.Data^));
    Filtered:=True;
    sort:= 'GL_ACC_NUMBER';

    while not Eof do
    begin
      New(NodeKey);
      NodeKey^:= FieldByName('rkey').AsInteger;
      ChildNode:=tvTree.Items.AddChildObject(ParNode,FieldByName('GL_ACC_NUMBER').AsString + ' ' + FieldByName('GL_DESCRIPTION').AsString,NodeKey);
      CreateNode(ChildNode,Query);    
      Next;
    end;
    Free;
  end;
end;

procedure TfrmNumber.CreateTree;
var
  RootNode:TTreeNode;
  RootKey:^Integer;
begin
  with DM.adoTmp do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select RKEY,ISNULL(PARENT_PTR,9999) AS PARENT_PTR,GL_ACC_NUMBER,GL_DESCRIPTION from data0103 where acc_Tp=1 order by rkey');
    open;

    New(RootKey);
    RootKey^:= 9999;
    RootNode:=tvTree.Items.AddChildObject(nil,'所有资产类科目',RootKey);
    Self.CreateNode(RootNode,DM.adoTmp);
    tvTree.Items[0].Selected:=True;
  end;
end;

procedure TfrmNumber.tvTreeDblClick(Sender: TObject);
begin
  if (tvTree.Selected<>nil) and (tvTree.Selected.Level> 0) then
     if not tvTree.Selected.HasChildren then
        ModalResult:= mrYes;
end;

end.
