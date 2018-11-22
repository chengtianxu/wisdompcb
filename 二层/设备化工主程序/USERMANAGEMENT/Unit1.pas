unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, ComCtrls, ImgList,
  Grids, DBGrids, DB;

type
  TForm1 = class(TForm)
    TV: TTreeView;
    DataSource1: TDataSource;
    ImageList: TImageList;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    ttype: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure TVCustomDraw(Sender: TCustomTreeView; const ARect: TRect;
      var DefaultDraw: Boolean);
    procedure TVCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure TVGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure TVGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure CheckBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure TVCollapsed(Sender: TObject; Node: TTreeNode);
    procedure TVExpanded(Sender: TObject; Node: TTreeNode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FButtonSize: Integer;
    FDefaultDraw,
    FDefaultDrawItem: Boolean;
    FBackgroundColor: TColor;
    FBrushStyle: TBrushStyle;
    procedure DrawButton(ARect: TRect; Node: TTreeNode);
    procedure DrawImage(NodeRect: TRect; ImageIndex: Integer);
    procedure UpdateParentNodes(node:ttreenode);
    procedure UpdatechildNodes(Node: TTreeNode;vstring:string;vval:integer);
    procedure updateThisNode(Node: TTreeNode);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ArrayCheck:array[0..2] of array of Tcheckbox;
  Form1: TForm1;

implementation
uses Datamodule, Employee_search,grp_search;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
VAR
  i:integer;
  p:^Integer;
  NODE:TTreenode;
  vstr:string;
begin
  FBackgroundColor := clWindow;
  FDefaultDraw := True;
  FBrushStyle := bsSolid;
  FButtonSize := 5;
  TV.RowSelect :=true;
  FDefaultDrawItem := false;
  TV.Items.Clear ;
  vstr:='                        ';
  vstr:=vstr;
  DM.AdoData0419.First ;
  with DM.AdoData0419 do
  while not eof do begin
    if Fieldbyname('ttype').asinteger=1 then // 主菜单
    begin
        new(p);{为指针p分配内存}
        P^:=fieldbyname('rkey').asinteger;

        NODE:=TV.Items.AddchildObject(NIL,fieldvalues['description']+vstr,P);
        Node.ImageIndex := 0 ;
    end else
    begin
        for i:=0 to TV.items.count-1 do
        begin
          if Pinteger(TV.items[i].data)^=fieldbyname('parent_ptr').asinteger then
            node:= TV.items[i];
        end;

        new(p);{为指针p分配内存}
        P^:=fieldbyname('rkey').asinteger;

        NODE:=TV.Items.AddchildObject(node,fieldvalues['description']+vstr,P);
        Node.ImageIndex := 1 ;
    end;

    next;
  end;

  Setlength(ArrayCheck[0],DM.AdoData0419.RecordCount );
  Setlength(ArrayCheck[1],DM.AdoData0419.RecordCount );
  Setlength(ArrayCheck[2],DM.AdoData0419.RecordCount );
  i:=0;
  DM.AdoData0419.First ;
  with DM.AdoData0419 do
  while not eof do
  begin
    Arraycheck[0,RecNo-1]:=TCheckbox.Create(self);
    Arraycheck[0,RecNo-1].parent :=TV;
    Arraycheck[0,RecNo-1].Name :='ACheckbox'+inttostr(i);
    Arraycheck[0,RecNo-1].caption :='';
    Arraycheck[0,RecNo-1].width :=15;
    Arraycheck[0,RecNo-1].onmousedown:=CheckBox1MouseDown;
    Arraycheck[1,RecNo-1]:=TCheckbox.Create(self);
    Arraycheck[1,RecNo-1].parent :=TV;
    Arraycheck[1,RecNo-1].Name :='BCheckbox'+inttostr(i);
    Arraycheck[1,RecNo-1].caption :='';
    Arraycheck[1,RecNo-1].width :=15;
    Arraycheck[1,RecNo-1].onmousedown:=CheckBox1MouseDown;
    Arraycheck[2,RecNo-1]:=TCheckbox.Create(self);
    Arraycheck[2,RecNo-1].parent :=TV;
    Arraycheck[2,RecNo-1].Name :='CCheckbox'+inttostr(i);
    Arraycheck[2,RecNo-1].caption :='';
    Arraycheck[2,RecNo-1].width :=15;
    Arraycheck[2,RecNo-1].onmousedown:=CheckBox1MouseDown;
    Arraycheck[0,RecNo-1].visible:=false;
    Arraycheck[1,RecNo-1].visible:=false;
    Arraycheck[2,RecNo-1].visible:=false;
    next;
    i:=i+1;
  end;
  for i:=0 to tv.Items.Count-1 do
  begin
    updateThisNode(TV.Items[i]);
    next;
  end;
end;

procedure TForm1.TVCustomDraw(Sender: TCustomTreeView; const ARect: TRect;
  var DefaultDraw: Boolean);
begin
  with TV.Canvas do
  begin
      Brush.Color := clWindow;
      Brush.Style := FBrushStyle;
      FillRect(ARect);
  end;
  DefaultDraw := FDefaultDraw;
end;

procedure TForm1.TVCustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
  State: TCustomDrawState; var DefaultDraw: Boolean);
var
  NodeRect: TRect;
begin
  with TV.Canvas do
  begin
    if cdsSelected in State then
    begin
      Brush.Color := clHighlight;
    end;

    DefaultDraw := FDefaultDrawItem;
    //DefaultDraw = False means you have to handle all the item drawing yourself,
    //including the buttons, lines, images, and text.
    if not DefaultDraw then
    begin
      //draw the selection rect.
      if cdsSelected in State then
      begin
        NodeRect := Node.DisplayRect(True);
        FillRect(NodeRect);
      end;
      NodeRect := Node.DisplayRect(False);

      begin
        Brush.Color := clWindow;
        Brush.Style := FBrushStyle;
        FillRect(NodeRect);
      end;

      NodeRect.Left := NodeRect.Left + (Node.Level * TV.Indent);
      //NodeRect.Left now represents the left-most portion of the expand button
      DrawButton(NodeRect, Node);

      NodeRect.Left := NodeRect.Left + TV.Indent + FButtonSize;
      //NodeRect.Left is now the leftmost portion of the image.
      DrawImage(NodeRect, Node.ImageIndex);

      NodeRect.Left := NodeRect.Left + ImageList.Width;
      //Now we are finally in a position to draw the text.

      with DM.ADOData0419 do
      begin
        locate('rkey',Pinteger(Node.data)^,[]);
        TextRect(noderect,NodeRect.Left+5, NodeRect.Top, trim(node.Text));
        TextOut(350, NodeRect.Top, fieldbyname('PREV_TP').asstring);
        Arraycheck[0,RecNo-1].Left :=400;
        Arraycheck[0,RecNo-1].Top :=NodeRect.Top;
        Arraycheck[0,RecNo-1].visible:=true ;
        Arraycheck[0,RecNo-1].Show ;
        Arraycheck[1,RecNo-1].Left :=450;
        Arraycheck[1,RecNo-1].Top :=NodeRect.top;
        Arraycheck[1,RecNo-1].visible:=true ;
        Arraycheck[1,RecNo-1].Show ;
        Arraycheck[2,RecNo-1].Left :=500;
        Arraycheck[2,RecNo-1].Top :=NodeRect.Top;
        Arraycheck[2,RecNo-1].visible:=true ;
        Arraycheck[2,RecNo-1].Show ;
        if not Node.HasChildren then
        if dm.ADOData0074.Locate('function_id',Pinteger(Node.data)^,[]) then
        begin
          case dm.ADOData0074.FieldByName('user_rights').AsInteger of
          0: begin
              Arraycheck[0,RecNo-1].checked:=false;
              Arraycheck[1,RecNo-1].checked:=false;
              Arraycheck[2,RecNo-1].checked:=false;
             end;
          1: begin
              Arraycheck[0,RecNo-1].checked:=true;
              Arraycheck[1,RecNo-1].checked:=false;
              Arraycheck[2,RecNo-1].checked:=false;
             end;
          2: begin
              Arraycheck[0,RecNo-1].checked:=false;
              Arraycheck[1,RecNo-1].checked:=true;
              Arraycheck[2,RecNo-1].checked:=false;
             end;
          3: begin
              Arraycheck[0,RecNo-1].checked:=true;
              Arraycheck[1,RecNo-1].checked:=false;
              Arraycheck[2,RecNo-1].checked:=true;
             end;
          4: begin
              Arraycheck[0,RecNo-1].checked:=false;
              Arraycheck[1,RecNo-1].checked:=true;
              Arraycheck[2,RecNo-1].checked:=true;
             end;
          end;
        end else
        begin
          Arraycheck[0,RecNo-1].checked:=false;
          Arraycheck[1,RecNo-1].checked:=false;
          Arraycheck[2,RecNo-1].checked:=false;
        end;
      end;
    end;
  end;

  if node.Parent <>nil then //刷新当前节点的父节点的显示
     UpdateParentNodes(node);
end;

procedure TForm1.updateThisNode(Node: TTreeNode);
var
  NodeRect: TRect;
begin
  with TV.Canvas do
  begin
    NodeRect := Node.DisplayRect(False);

    with DM.ADOData0419 do
    begin
      locate('rkey',Pinteger(Node.data)^,[]);
      if not Node.HasChildren then
      if dm.ADOData0074.Locate('function_id',Pinteger(Node.data)^,[]) then
      begin
        case dm.ADOData0074.FieldByName('user_rights').AsInteger of
        0: begin
            Arraycheck[0,RecNo-1].checked:=false;
            Arraycheck[1,RecNo-1].checked:=false;
            Arraycheck[2,RecNo-1].checked:=false;
           end;
        1: begin
            Arraycheck[0,RecNo-1].checked:=true;
            Arraycheck[1,RecNo-1].checked:=false;
            Arraycheck[2,RecNo-1].checked:=false;
           end;
        2: begin
            Arraycheck[0,RecNo-1].checked:=false;
            Arraycheck[1,RecNo-1].checked:=true;
            Arraycheck[2,RecNo-1].checked:=false;
           end;
        3: begin
            Arraycheck[0,RecNo-1].checked:=true;
            Arraycheck[1,RecNo-1].checked:=false;
            Arraycheck[2,RecNo-1].checked:=true;
           end;
        4: begin
            Arraycheck[0,RecNo-1].checked:=false;
            Arraycheck[1,RecNo-1].checked:=true;
            Arraycheck[2,RecNo-1].checked:=true;
           end;
        end;
      end else
      begin
        Arraycheck[0,RecNo-1].checked:=false;
        Arraycheck[1,RecNo-1].checked:=false;
        Arraycheck[2,RecNo-1].checked:=false;
      end;
    end;
  end;
  if node.Parent <>nil then //刷新当前节点的父节点的显示
     UpdateParentNodes(node);
end;

procedure TForm1.TVGetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  if Node.HasChildren then
    if Node.Expanded then
      Node.ImageIndex := 3
    else
      Node.ImageIndex := 0
  else
    Node.ImageIndex := 1;
end;

procedure TForm1.TVGetSelectedIndex(Sender: TObject; Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TForm1.CheckBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Node:Ttreenode;
  vpstr:string;
  vpval:integer;
begin
  node:=TV.GetNodeAt((sender as Tcheckbox).left,(sender as Tcheckbox).top);
  DM.ADOData0419.locate('rkey',inttostr(Pinteger(Node.data)^),[]);

  //更新当前节点
  if (sender as Tcheckbox).Checked
    then (sender as Tcheckbox).Checked :=false else
    begin
      (sender as Tcheckbox).Checked :=true;
      if copy((sender as tcheckbox).Name,1,1)='A' then
        Arraycheck[1,DM.ADOData0419.RecNo-1].Checked:=false
      else
        if copy((sender as tcheckbox).Name,1,1)='B' then
          Arraycheck[0,DM.ADOData0419.RecNo-1].Checked:=false;
    end;

  if dm.ADOData0419.Fieldbyname('exe_flag').asinteger=1 then
  if not dm.ADOData0074.Locate('function_id',pinteger(node.Data)^,[]) then
  begin
    dm.ADOData0074.append;
    dm.ADOData0074.FieldByName('user_ptr').AsInteger :=dm.ADOData0073.fieldbyname('rkey').asinteger;
    dm.ADOData0074.FieldByName('function_id').AsInteger :=pinteger(node.Data)^;
  end;

  if dm.ADOData0419.FieldByName('exe_flag').asinteger=1 then
  begin
    DM.ADOData0419.locate('rkey',inttostr(Pinteger(Node.data)^),[]); //更新当前菜单的权限
    with DM.ADOData0419 do
    begin
      if (not Arraycheck[0,RecNo-1].Checked) and (not Arraycheck[1,RecNo-1].Checked) then
      begin
        dm.ADOData0074.edit;
        dm.ADOData0074.FieldByName('user_rights').AsInteger :=0;
      end else
      if (Arraycheck[0,RecNo-1].Checked) and (not Arraycheck[1,RecNo-1].Checked) then
      begin
        if (not Arraycheck[2,RecNo-1].Checked) then
        begin
          dm.ADOData0074.edit;
          dm.ADOData0074.FieldByName('user_rights').AsInteger :=1;
        end else
        begin
          dm.ADOData0074.edit;
          dm.ADOData0074.FieldByName('user_rights').AsInteger :=3;
        end;
      end else
      begin
        if (not Arraycheck[2,RecNo-1].Checked) then
        begin
          dm.ADOData0074.edit;
          dm.ADOData0074.FieldByName('user_rights').AsInteger :=2;
        end else
        begin
          dm.ADOData0074.edit;
          dm.ADOData0074.FieldByName('user_rights').AsInteger :=4;
        end;
      end;
    end;
  end else
  begin //为母菜单，应更新当前节点的所有子菜单的权限
    vpstr:=copy((sender as tcheckbox).Name,1,1);
    if (sender as Tcheckbox).Checked=false then
      vpval:=0 else vpval:=1;
    if node.HasChildren then
      UpdatechildNodes(node,vpstr,vpval);
  end;

  TV.Refresh ;
  Node.Selected:=true;
  TV.SetFocus ;
end;

procedure TForm1.DrawButton(ARect: TRect; Node: TTreeNode);
var
  cx, cy: Integer;
begin
  cx := ARect.Left + TV.Indent div 2;
  cy := ARect.Top + (ARect.Bottom - ARect.Top) div 2;
  with TV.Canvas do
  begin
    Pen.Color := clBlack;
    //draw horizontal line.
    if Node.HasChildren then
    begin
      PenPos := Point(cx+FButtonSize, cy);
      LineTo(ARect.Left + TV.Indent + FButtonSize, cy);
    end else
    begin
      PenPos := Point(cx, cy);
      LineTo(ARect.Left + TV.Indent + FButtonSize, cy);
    end;

    //draw half vertical line, top portion.
    Pen.Style :=psSolid;
    PenPos := Point(cx, cy);
    LineTo(cx, ARect.Top-1);

    if ((Node.GetNextVisible <> nil) and (Node.GetNextVisible.Level = Node.Level))
    or (Node.GetNextSibling <> nil) then
    //draw bottom portion of half vertical line.
    begin
      PenPos := Point(cx, cy);
      LineTo(cx, ARect.Bottom+1);
    end;

    if Node.HasChildren then
    begin
      Rectangle(cx-FButtonSize, cy-FButtonSize, cx+FButtonSize, cy+FButtonSize);

      //draw the horizontal indicator.
      PenPos := Point(cx-FButtonSize+2, cy);
      LineTo(cx+FButtonSize-2, cy);
      //draw the vertical indicator if the node is collapsed
      if not Node.Expanded then
      begin
        PenPos := Point(cx, cy-FButtonSize+2);
        LineTo(cx, cy+FButtonSize-2);
      end;
    end;
    Pen.width:=1;
        //now connect vertical lines of higher level nodes.
    Node := Node.Parent;
    while Node <> nil do
    begin
      cx := cx - TV.Indent;
      if Node.GetNextSibling <> nil then
      begin
        PenPos := Point(cx, ARect.Top);
        LineTo(cx, ARect.Bottom);
      end;
      Node := Node.Parent;
    end;
  end;
end;

procedure TForm1.DrawImage(NodeRect: TRect; ImageIndex: Integer);
var
  cy: Integer;
begin
  cy := NodeRect.Top + (NodeRect.Bottom - NodeRect.Top) div 2;
  //center image in NodeRect.
  ImageList.Draw(TV.Canvas, NodeRect.Left, cy - TV.Images.Height div 2,
                 ImageIndex, True);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  if trim(dm.ADOData0073.FieldByName('user_id').asstring)='' then
  begin
    messagedlg('代号不能为空!',mtinformation,[mbok],0);
    exit;
  end;
  if trim(dm.ADOData0073.FieldByName('user_full_name').asstring)='' then
  begin
    messagedlg('组名不能为空!',mtinformation,[mbok],0);
    exit;
  end;
  dm.adodata0073.edit;
  dm.adodata0073.Fieldbyname('user_login_name').asstring:=
    dm.adodata0073.Fieldbyname('user_id').asstring;
  IF (DM.ADOData0073.State =dsInsert)
    or (DM.ADOData0073.Modified) then
  begin
    try
      dm.adodata0073.post;
    except
      MESSAGEDLG('保存不成功！请检查是否代号重复！',mtinformation,[mbok],0);
      exit;
    end;
      IF ttype.Caption ='0' then
      begin
        dm.ADOdata0074.First;
        with Dm.ADOData0074 do
        while not eof do
        begin
          edit;
          Fieldbyname('user_ptr').asinteger:=Dm.ADOData0073.fieldbyname('rkey').asinteger;
          next;
        end;
      end;
      dm.adodata0074.UpdateBatch();
  end;
  dm.adodata0074.close;
  close;
end;

procedure TForm1.TVCollapsed(Sender: TObject; Node: TTreeNode);
var
  i:integer;
begin
  for i:=0 to node.Count-1 do
  begin
    dm.ADOData0419.Locate('rkey',Pinteger(node.Item[i].Data)^,[]);
    Arraycheck[0,dm.ADOData0419.RecNo-1].Visible :=false;
    Arraycheck[1,dm.ADOData0419.RecNo-1].Visible :=false;
    Arraycheck[2,dm.ADOData0419.RecNo-1].Visible :=false;
    if node.Item[i].HasChildren then
       TVCollapsed(Sender, Node.Item[i]);
  end;
  tv.Refresh ;
end;

procedure TForm1.TVExpanded(Sender: TObject; Node: TTreeNode);
begin
  tv.Refresh ;
end;

procedure TForm1.UpdateParentNodes(node:ttreenode);
var
  i,i0,j0,k0,i1,j1,k1,i2,j2,k2:integer;
  vnode:ttreenode;
begin
  j0:=0;
  k0:=0;
  j1:=0;
  k1:=0;
  j2:=0;
  k2:=0;
  i0:=0;
  i1:=0;
  i2:=0;
  if node.Parent <>nil then //刷新当前节点的父节点的显示
  begin
    for i:=0 to node.parent.Count-1 do
    begin
      DM.ADOData0419.locate('rkey',inttostr(Pinteger(Node.parent.Item[i].Data)^),[]);
      if  Arraycheck[0,DM.ADOData0419.RecNo-1].state=cbchecked then
        j0:=j0+1 else
          if Arraycheck[0,DM.ADOData0419.RecNo-1].state=cbUnchecked then
            k0:=K0+1 else i0:=i0+1;
      if Arraycheck[1,DM.ADOData0419.RecNo-1].state=cbchecked then
        j1:=j1+1 else
          if Arraycheck[1,DM.ADOData0419.RecNo-1].state=cbUnchecked then
            k1:=K1+1 else i1:=i1+1;
      if Arraycheck[2,DM.ADOData0419.RecNo-1].state=cbchecked then
        j2:=j2+1 else
          if Arraycheck[2,DM.ADOData0419.RecNo-1].state=cbUnchecked then
            k2:=K2+1 else i2:=i2+1;
    end;
    DM.ADOData0419.locate('rkey',inttostr(Pinteger(Node.parent.Data)^),[]);
    begin
      if i0>0 then
        Arraycheck[0,DM.ADOData0419.RecNo-1].State:=cbGrayed
      else if (j0>0) and (k0>0) then
        Arraycheck[0,DM.ADOData0419.RecNo-1].State:=cbGrayed
      else if (j0>0) and (k0=0) then
        Arraycheck[0,DM.ADOData0419.RecNo-1].State:=cbchecked
      else if (j0=0) and (k0>0) then
        Arraycheck[0,DM.ADOData0419.RecNo-1].State:=cbunchecked;

      if i1>0 then
        Arraycheck[1,DM.ADOData0419.RecNo-1].State:=cbGrayed
      else if (j1>0) and (k1>0) then
        Arraycheck[1,DM.ADOData0419.RecNo-1].State:=cbGrayed
      else if (j1>0) and (k1=0) then
        Arraycheck[1,DM.ADOData0419.RecNo-1].State:=cbchecked
      else if (j1=0) and (k1>0) then
        Arraycheck[1,DM.ADOData0419.RecNo-1].State:=cbunchecked;

      if i2>0 then
        Arraycheck[2,DM.ADOData0419.RecNo-1].State:=cbGrayed
      else if (j2>0) and (k2>0) then
        Arraycheck[2,DM.ADOData0419.RecNo-1].State:=cbGrayed
      else if (j2>0) and (k2=0) then
        Arraycheck[2,DM.ADOData0419.RecNo-1].State:=cbchecked
      else if (j2=0) and (k2>0) then
        Arraycheck[2,DM.ADOData0419.RecNo-1].State:=cbunchecked;
    end;
  end;
  vnode:=node.parent;
  if vnode.Parent <>nil then //刷新当前节点的父节点的显示
    UpdateParentNodes(vnode);
end;

procedure TForm1.UpdatechildNodes(Node: TTreeNode;vstring:string;vval:integer);
var vnode:TTreenode;
    i:integer;
    vpval:integer;
    vPstr:string;
begin
  vPstr:=vstring;
  vPval:=vval;
  vnode:=node;
  for i:=0 to vnode.Count-1 do
  begin
    dm.ADOData0419.Locate('rkey',pinteger(vnode.Item[i].data)^,[]);
    if dm.ADOData0419.FieldByName('exe_flag').asinteger=1 then
    begin

      //先刷新CHECKBOX
      if vPstr='A' then
      begin
        if vPval=0 then
        begin
          Arraycheck[0,DM.ADOData0419.RecNo-1].Checked:=false;
        end else
        begin
          Arraycheck[0,DM.ADOData0419.RecNo-1].Checked:=true;
          Arraycheck[1,DM.ADOData0419.RecNo-1].Checked:=false;
        end;
      end else
      if vPstr='B' then
      begin
        if vPval=0 then
        begin
          Arraycheck[1,DM.ADOData0419.RecNo-1].Checked:=false;
        end else
        begin
          Arraycheck[1,DM.ADOData0419.RecNo-1].Checked:=true;
          Arraycheck[0,DM.ADOData0419.RecNo-1].Checked:=false;
        end;
      end else
      begin
        if vPval=0 then
          Arraycheck[2,DM.ADOData0419.RecNo-1].Checked:=false
        else
          Arraycheck[2,DM.ADOData0419.RecNo-1].Checked:=true;
      end;

      //根据刷新后的CHECKBOX更新表DATA0074
      if not dm.ADOData0074.Locate('function_id',pinteger(node.Item[i].Data)^,[]) then
      begin
        dm.ADOData0074.append;
        dm.ADOData0074.FieldByName('user_ptr').AsInteger :=dm.ADOData0073.fieldbyname('rkey').asinteger;
        dm.ADOData0074.FieldByName('function_id').AsInteger :=pinteger(node.Item[i].Data)^;
      end;
      with DM.ADOData0419 do
      begin
        if (not Arraycheck[0,RecNo-1].Checked) and (not Arraycheck[1,RecNo-1].Checked) then
        begin
          dm.ADOData0074.edit;
          dm.ADOData0074.FieldByName('user_rights').AsInteger :=0;
        end else
        if (Arraycheck[0,RecNo-1].Checked) and (not Arraycheck[1,RecNo-1].Checked) then
        begin
          if (not Arraycheck[2,RecNo-1].Checked) then
          begin
            dm.ADOData0074.edit;
            dm.ADOData0074.FieldByName('user_rights').AsInteger :=1;
          end else
          begin
            dm.ADOData0074.edit;
            dm.ADOData0074.FieldByName('user_rights').AsInteger :=3;
          end;
        end else
        begin
          if (not Arraycheck[2,RecNo-1].Checked) then
          begin
            dm.ADOData0074.edit;
            dm.ADOData0074.FieldByName('user_rights').AsInteger :=2;
          end else
          begin
            dm.ADOData0074.edit;
            dm.ADOData0074.FieldByName('user_rights').AsInteger :=4;
          end;
        end;
      end;
      updateThisNode(vNode.Item[i]);
    end else
    begin
      if vnode.Item[i].HasChildren then
        UpdateChildNodes(vnode.Item[i],vPstr,vPval);
    end;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IF (DM.ADOData0073.State =dsInsert)
    or (DM.ADOData0073.Modified) then
      DM.ADOData0073.Cancel;
  DM.ADOData0074.Close ;
end;

end.

