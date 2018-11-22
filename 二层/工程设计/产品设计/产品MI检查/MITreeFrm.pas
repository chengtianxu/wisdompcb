unit MITreeFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, damo, DB, ADODB, ExtCtrls, DBCtrls;

type
  TNodeArr = record
    Node: TTreeNode;
    d25rkey: Integer;
    lockedcheck: integer;//-1:可以选，0：不能选；1；必须选
    d25status: Integer;
  end;

  TfrmMITree = class(TForm)
    tvMiTree: TTreeView;
    btn1: TButton;
    btn2: TButton;
    adsMiTree: TADODataSet;
    cbxyxbj: TCheckBox;
    cbxgdfczh: TCheckBox;
    cbxtczh: TCheckBox;
    rgxgyx: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure tvMiTreeClick(Sender: TObject);
  private
    { Private declarations }
    procedure CheckAllChilds(ANode: TTreeNode; bCheck: Boolean);
    function AllChildHasChecked(ANode: TTreeNode): Boolean;
  public
    { Public declarations }
    FNodeArr: array of TNodeArr;
    procedure CreateTreeWithTopMiRkey25(ARkey25: Integer);
    function GetCheckRkey25: string;
    procedure SetDefaultCheck;
    function IsNodeChecked(ATreeNode: TTreeNode): Boolean;
  end;




implementation

uses
  CommCtrl;

{$R *.dfm}

function TfrmMITree.IsNodeChecked(ATreeNode: TTreeNode): Boolean;
const
  TVIS_CHECKED = $2000;
var
  LWinNode: TTVItem;
begin
  Result := False;
  LWinNode.mask := TVIF_STATE;
  LWinNode.hItem := ATreeNode.ItemId;
  if not TreeView_GetItem(ATreeNode.TreeView.Handle,LWinNode) then Exit;
  Result := (LWinNode.State and TVIS_CHECKED) = TVIS_CHECKED;
end;

{ TfrmMITree }


procedure TfrmMITree.CreateTreeWithTopMiRkey25(ARkey25: Integer);
var
  LNode: TTreeNode;
  I: Integer;
begin
  LNode := nil;
  SetLength(FNodeArr,0);
  tvMiTree.Items.Clear;

  adsMiTree.Close;
  adsMiTree.Parameters[0].Value := ARkey25;
  adsMiTree.Open;
  adsMiTree.First;
  while not adsMiTree.Eof do
  begin
    if adsMiTree.FieldByName('PARENT_PTR').AsInteger = 0 then
      LNode := nil
    else
    begin
      for I := 0 to Length(FNodeArr) - 1 do
      begin
        if FNodeArr[I].d25rkey = adsMiTree.FieldByName('PARENT_PTR').AsInteger then
          LNode := FNodeArr[I].Node;
      end;
    end;
    SetLength(FNodeArr,Length(FNodeArr)+1);
    FNodeArr[High(FNodeArr)].Node := tvMiTree.Items.AddChildObject(LNode,adsMiTree.fieldbyname('manu_part_number').AsString,Pointer(adsMiTree.FieldByName('rkey').asinteger));
    FNodeArr[High(FNodeArr)].d25rkey := adsMiTree.FieldByName('rkey').asinteger ;
    FNodeArr[High(FNodeArr)].d25status := adsMiTree.FieldByName('TSTATUS').AsInteger ;
    FNodeArr[High(FNodeArr)].lockedcheck := -1;
    adsMiTree.Next;
  end;

  tvMiTree.Items[0].Expand(True);
end;

procedure TfrmMITree.FormShow(Sender: TObject);
begin
  SetWindowLong(tvMiTree.Handle, GWL_STYLE, GetWindowLong(tvMiTree.Handle, GWL_STYLE) or $00000100);
  SetDefaultCheck;
end;

procedure TfrmMITree.btn1Click(Sender: TObject);
var
  I: Integer;
  LCheckCount: Integer;
  bAllChildHasChecked: Boolean;
begin
  LCheckCount := 0;
  GetCheckRkey25;
  for I := 0 to Length(FNodeArr) - 1 do
  begin
    if IsNodeChecked(fnodearr[I].Node) then
      Inc(LCheckCount);
  end;
  if LCheckCount = 0 then
  begin
    ShowMessage('请选择一个层次');
    Exit;
  end;

  bAllChildHasChecked := True;
  for I := 0 to Length(FNodeArr) - 1 do
  begin
    if IsNodeChecked(fnodearr[I].Node) then
    begin
      bAllChildHasChecked := bAllChildHasChecked and AllChildHasChecked(fnodearr[I].Node);
      if not bAllChildHasChecked then Break;
    end;
  end;
  if not bAllChildHasChecked then
  begin
    ShowMessage('相应的内层还没有选择，请先选择内层');
    Exit;
  end;
  ModalResult := mrOk;
end;

procedure TfrmMITree.btn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TfrmMITree.GetCheckRkey25: string;
var
  I: Integer;
begin
  Result := '(';
  for I := 0 to Length(FNodeArr) - 1 do
  begin
    if IsNodeChecked(FNodeArr[I].Node) then
    begin
      Result := Result + IntToStr(fnodearr[I].d25rkey) + ',';
    end;
  end;
  Result := Result + '0)';
end;

function TreeNodeSetChecked(mTreeNode: TTreeNode; mChecked: Boolean): Boolean;
var
 vTVItem: TTVItem;
begin
  Result := False;
  if not Assigned(mTreeNode) or not Assigned(mTreeNode.TreeView) then Exit;
  vTVItem.mask   :=   TVIF_STATE;
  vTVItem.hItem   :=   mTreeNode.ItemId;
  TreeView_GetItem(mTreeNode.TreeView.Handle,   vTVItem);
  if   not   TreeView_GetItem(mTreeNode.TreeView.Handle,   vTVItem)   then   Exit;
  vTVItem.stateMask   :=   TVIS_STATEIMAGEMASK;
  vTVItem.state   :=   IndexToStateImageMask(Succ(Ord(mChecked)));
  Result   :=   TreeView_SetItem(mTreeNode.TreeView.Handle,   vTVItem);
end;   {   TreeNodeSetChecked   }

procedure TfrmMITree.tvMiTreeClick(Sender: TObject);
var
  I: Integer;
  P:TPoint;
  LCheckNode :TTreeNode;
begin
  LCheckNode := nil;
  GetCursorPos(P);
  P := tvMiTree.ScreenToClient(P);
  if (htOnStateIcon in tvMiTree.GetHitTestInfoAt(P.X,P.Y)) then
  begin
    LCheckNode := tvMiTree.GetNodeAt(P.X,P.Y);
  end;

  if LCheckNode <> nil then
  begin
    for I := 0 to Length(FNodeArr) - 1 do
    begin
      if FNodeArr[I].Node = LCheckNode then
      begin
        case FNodeArr[I].lockedcheck of
          -1:
          begin
            if IsNodeChecked(LCheckNode) then
              CheckAllChilds(LCheckNode,True);
          end;
          0:
          begin
            TreeNodeSetChecked(LCheckNode,False);
          end;
          1:
          begin
            TreeNodeSetChecked(LCheckNode,True);
          end;

        end;
      end;
    end;
  end;
end;

procedure TfrmMITree.CheckAllChilds(ANode: TTreeNode; bCheck: Boolean);
var
  I,J: Integer;
begin
  if ANode.HasChildren then
  begin
    for I := 0 to ANode.Count - 1 do
    begin
      for J := 0 to Length(FNodeArr) -1 do
      begin
        if FNodeArr[J].Node = ANode then
        begin
          if FNodeArr[J].lockedcheck = -1 then
          begin
            TreeNodeSetChecked(ANode.Item[I],bCheck);
          end;
        end;
      end;
      CheckAllChilds(ANode.Item[I],bCheck);
    end;
  end;

end;

procedure TfrmMITree.SetDefaultCheck;
var
  I: Integer;
begin
  for I := 0 to Length(FNodeArr) - 1 do
  begin
    if FNodeArr[I].lockedcheck = 0 then
      TreeNodeSetChecked(fnodeArr[I].Node,False)
    else
    if FNodeArr[I].lockedcheck = 1 then
      TreeNodeSetChecked(FNodeArr[I].Node,True);
  end;
end;


function TfrmMITree.AllChildHasChecked(ANode: TTreeNode): Boolean;
var
  I: Integer;
begin
  Result := IsNodeChecked(ANode);
  if ANode.HasChildren then
  begin
    for I := 0 to ANode.Count - 1 do
    begin
      Result := Result and AllChildHasChecked(ANode.Item[I]);
    end;
  end;
end;

end.
