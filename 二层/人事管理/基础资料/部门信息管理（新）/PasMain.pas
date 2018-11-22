unit PasMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls,ADODB, Grids, DBGridEh,
  Menus, ImgList;

type
  TfrmMain = class(TForm)
    Panel2: TPanel;
    tvTree: TTreeView;
    PopupMenu1: TPopupMenu;
    pmAdd: TMenuItem;
    pmEdit: TMenuItem;
    pmDelete: TMenuItem;
    Panel1: TPanel;
    Panel6: TPanel;
    btnShadow: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    dgShowChild: TDBGridEh;
    Panel5: TPanel;
    lbFilter: TLabel;
    btnExit: TBitBtn;
    btnExport: TBitBtn;
    edtFilter: TEdit;
    btnRefresh: TBitBtn;
    btnSearch: TBitBtn;
    btnField: TBitBtn;
    Panel7: TPanel;
    rgState: TRadioGroup;
    PopupMenu2: TPopupMenu;
    btnUpdate: TBitBtn;
    ImageList1: TImageList;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    btn_Qry: TButton;
    spl1: TSplitter;
    pnl1: TPanel;
    procedure tvTreeClick(Sender: TObject);
    procedure dgShowChildKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFilterChange(Sender: TObject);
    procedure dgShowChildTitleClick(Column: TColumnEh);
    procedure pmAddClick(Sender: TObject);
    procedure pmEditClick(Sender: TObject);
    procedure pmDeleteClick(Sender: TObject);
    procedure btnShadowClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure rgStateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnFieldClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure tvTreeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tvTreeDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tvTreeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn_QryClick(Sender: TObject);
    procedure dgShowChildDblClick(Sender: TObject);

  private
    { Private declarations }
  preColumn:TColumnEh;
  searchSQL:string;
  checkState:string;
  mainSQL:string;
  rKeys:string;
  key:string;
  oldNode:TTreeNode;
  procedure CreateNode(ParNode:TTreeNode;Query:TADOQuery);
  procedure CreateTree();
  procedure getState();
  procedure getRkey();
  procedure itemClick(sender:TObject);
  function isChild(desNode:TTreeNode;SourNod:TTreeNode):Boolean;

  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses PasDM,DB, PasDepart, PasSearch,common, UQryCount;


{$R *.dfm}

procedure TfrmMain.CreateNode(ParNode: TTreeNode; Query: TADOQuery);
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
    Filter:='superior = ' + IntToStr(Integer(ParNode.Data^));
    Filtered:=True;
    sort:= 'departmentcode';

    while not Eof do
    begin
      New(NodeKey);
      NodeKey^:= FieldByName('rkey').AsInteger;
      ChildNode.ImageIndex:=0;
      ChildNode:=tvTree.Items.AddChildObject(ParNode,FieldByName('departmentname').AsString,NodeKey);
      CreateNode(ChildNode,Query);     //递归。遍历这个节点以及它子节点，直到所有节点没有子节点
      Next;
    end;
    Free;
  end;
end;

procedure TfrmMain.CreateTree;
var
  RootNode:TTreeNode;
  RootKey:^Integer;
begin
  with DM.ADODepart do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select rkey,departmentcode,departmentname,superior from datadepartment');
    open;

    Filtered:=False;
    Filter:='superior = 0';
    Filtered:=True;

    New(RootKey);
    RootKey^:= FieldByName('rkey').AsInteger;
    RootNode:=tvTree.Items.AddChildObject(nil,FieldByName('departmentname').AsString,RootKey);
    RootNode.ImageIndex:=0;
    Self.CreateNode(RootNode,DM.ADODepart);
    tvTree.Items[0].Selected:=True;
  end;
end;

procedure TfrmMain.getRkey;
begin
  with DM.ADOAddorEdit do
  begin
    Close;
    sql.Clear;
    SQL.Add('select rkey,superior from datadepartment where superior in ('+ key +')');
    Open;

    if not IsEmpty then
    begin
      key:='';
      First;
      while not Eof do
      begin
        key:= fieldbyname('rkey').AsString + ',' + key;
        Next;
      end;
      rKeys:= key + rKeys ;
      key:=Copy(key,0,Length(key)-1);
      Self.getRkey;
    end;
  end;

end;

procedure TfrmMain.tvTreeClick(Sender: TObject);
begin
  rKeys:=IntToStr(Integer(tvTree.Selected.data^));      //第一种方法：利用递归去找子子孙孙
  key:=rKeys;            //key用来存放子KEY
  Self.getRkey;
  rkeys:=' and rkey in (' + rKeys + ')';
  Self.getState;
  DM.ADOShowChild.Close;
  dm.ADOShowChild.SQL.Clear;
  DM.ADOShowChild.SQL.Text:=mainSQL+#13+ rkeys +#13+ checkState +#13+ searchSQL;
  DM.ADOShowChild.Open;
  DM.ADOShowChild.sort:='departmentcode';

                                                     //第二种方法：利用下面一条SQL语句找子子孙孙
//    ;WITH CTE(RKEY,departmentcode,departmentname,superior,invalid,departmentration, departmentcount,scarcity, overproofcount, max_overproof_percent,
//
//  pre_outduty, dept_totalration, dept_totalcount, dept_total_outduty ) AS
//  (
//  SELECT RKEY,departmentcode,departmentname,superior,invalid,departmentration, departmentcount,scarcity, overproofcount, max_overproof_percent,
//
//  pre_outduty, dept_totalration, dept_totalcount, dept_total_outduty FROM datadepartment
//  WHERE superior=:selectRkey
//    UNION ALL
//  SELECT depart.RKEY,depart.departmentcode,depart.departmentname,depart.superior,depart.invalid,depart.departmentration,
//
//  depart.departmentcount,depart.scarcity, depart.overproofcount, depart.max_overproof_percent, depart.pre_outduty, depart.dept_totalration,
//
//  depart.dept_totalcount, depart.dept_total_outduty
//  FROM datadepartment as depart
//  INNER JOIN CTE ON depart.superior=CTE.RKEY
//  )
//  select RKEY,departmentcode,departmentname,superior,invalid,departmentration, departmentcount,scarcity,
//      convert(varchar,cast(100*cast(overproofcount as decimal(8,2))/departmentration as decimal(8,2))) +'%'  as outofrate,
//           overproofcount, max_overproof_percent, pre_outduty, dept_totalration, dept_totalcount, dept_total_outduty from CTE
//  where 1=1

//  Self.getState;
//  DM.ADOShowChild.Close;
//  dm.ADOShowChild.SQL.Clear;
//  DM.ADOShowChild.SQL.Text:=mainSQL+#13+ checkState +#13+ searchSQL;
//  DM.ADOShowChild.Parameters.ParamByName('selectRkey').Value:=Integer(tvTree.Selected.Data^);
//  DM.ADOShowChild.Parameters.ParamByName('sRkey').Value:=Integer(tvTree.Selected.Data^);
//  DM.ADOShowChild.Open;
//  DM.ADOShowChild.sort:='superior';

end;

procedure TfrmMain.dgShowChildKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Chr(Key)='V') and  (ssalt in Shift) then
  ShowMessage(DM.ADOShowChild.SQL.Text);
end;

procedure TfrmMain.edtFilterChange(Sender: TObject);
begin
  DM.ADOShowChild.Filtered:=True;
  if Trim(edtFilter.Text)='' then
    DM.ADOShowChild.Filter:=''
  else
    DM.ADOShowChild.Filter:= preColumn.FieldName + ' like %' + Trim(edtFilter.Text) + '%';

end;

procedure TfrmMain.dgShowChildTitleClick(Column: TColumnEh);
begin
  if (Column.FieldName <> preColumn.FieldName) and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    lbFilter.Caption:=Column.Title.Caption;
    Column.Title.Color:=clRed;
    preColumn.Title.Color:=clBtnFace;
    edtFilter.SetFocus;
    preColumn:=Column;
  end;

  edtFilter.SetFocus;
  if Column.Title.SortMarker= smUpEh then
  begin
    Column.Title.SortMarker:=smDownEh;
    DM.ADOShowChild.Sort:= Column.FieldName + ' DESC ';
  end
  else
  begin
    Column.Title.SortMarker:=smUpEh;
    DM.ADOShowChild.sort:=Column.FieldName ;
  end;
end;

procedure TfrmMain.pmAddClick(Sender: TObject);
var
  frmAddDepart:TfrmDepart;
begin
  try
    frmAddDepart:=TfrmDepart.Create(Application);
    frmAddDepart.ParKey:= Integer(tvTree.Selected.Data^);
    frmAddDepart.edState:=1;    //1代表新建
    if frmAddDepart.ShowModal = mrok then
    begin
      btnRefreshClick(nil);
    end;
  finally
    frmAddDepart.Free;
  end;

end;

procedure TfrmMain.pmEditClick(Sender: TObject);
var
  frmEditDepart:TfrmDepart;
begin
  try
    frmEditDepart:=TfrmDepart.Create(Application);
    frmEditDepart.ParKey:= Integer(tvTree.Selected.Data^);
    frmEditDepart.edState:=2;   //2代表编辑
    if frmEditDepart.ShowModal = mrok then
    begin
      btnRefreshClick(nil);
    end;
  finally
    frmEditDepart.Free;
  end;
end;

procedure TfrmMain.pmDeleteClick(Sender: TObject);
var
  strNode:string;
  i,empCount:Integer;
begin
  with DM.ADOAddorEdit do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select rkey,departmentname from datadepartment where rkey in (select superior from datadepartment as depart where rkey = ' + IntToStr(Integer(tvTree.Selected.Data^)) + ')');
    Open;
    strNode:=FieldByName('departmentname').AsString;

    Close;
    SQL.Clear;
    SQL.Add('select count(rkey) as empCount from employeemsg where departmentid = ' + IntToStr(Integer(tvTree.Selected.Data^)));
    Open;
    empCount:=FieldByName('empCount').AsInteger;

    Close;
    SQL.Clear;
    SQL.Add('select rkey,departmentname,superior,departmentcount from datadepartment where superior = ' + IntToStr(Integer(tvTree.Selected.Data^)));
    Open;

    if not IsEmpty then
    begin
      ShowMessage('下级部门不为空，不能删除！');
      Exit;
    end
    else
    begin
      if (FieldByName('departmentcount').AsInteger=0) or (empCount = 0)  then
      begin
        Close;
        SQL.Clear;
        SQL.Add('delete from datadepartment where rkey = ' + IntToStr(Integer(tvTree.Selected.Data^)));
        ExecSQL;
      end
      else
      begin
        ShowMessage('该部门中还有员工，请勿删除');
        Exit;
      end;
    end;
  end;

  tvTree.Items.Clear;
  CreateTree;

  for i:=0 to tvTree.Items.Count-1 do
  begin
    if strNode=Trim(tvTree.Items[i].Text) then
    begin
      tvTree.Items[i].Selected:=True;
      Break;
    end;
  end;
  tvTreeClick(tvTree);
end;

procedure TfrmMain.btnShadowClick(Sender: TObject);
begin
  if Panel1.Left=0 then
  begin
    Panel1.Left:=225;
    Panel2.Visible:=True;
    btnShadow.Caption:='<<';
  end
  else
  begin
    Panel2.Visible:=False;
    Panel1.Left:=0;
    btnShadow.Caption:='>>';
  end;

end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  btnShadow.Top:=0;
  btnShadow.Height:=Panel6.Height;
end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Close;
  Application.Terminate;
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
var
  secRec,sNode:Integer;
  i:Integer;

begin
  secRec:=DM.ADOShowChildrkey.Value;

  if tvTree.Selected<>nil then
    sNode:=Integer(tvTree.Selected.Data^)
  else
    sNode:=Integer(tvTree.Items[0].Data^);

  tvTree.Items.Clear;
  CreateTree;

  for i:=0 to tvTree.Items.Count-1 do
  begin
    if sNode=Integer(tvTree.Items[i].Data^) then
    begin
      tvTree.Items[i].Selected:=True;
//      tvTree.Items[i].Expanded:=True;
      Break;
    end;
  end;
  tvTreeClick(tvTree);
  DM.ADOShowChild.Locate('rkey',secRec,[]);
end;

procedure TfrmMain.btnSearchClick(Sender: TObject);
var
  i:Integer;
begin
  searchSQL:='';
  if frmSearch=nil then frmSearch:=TfrmSearch.Create(nil);
  if frmSearch.ShowModal =mrok then
  begin
    if frmSearch.sgList.RowCount<>2 then
    begin
      for i:=1 to frmSearch.sgList.RowCount-2 do
      begin
        searchSQL:=searchSQL+ frmSearch.sgList.Cells[2,i]+#13;
      end;
    end;
    tvTreeClick(tvTree);
  end;
end;

procedure TfrmMain.rgStateClick(Sender: TObject);
begin
  Self.tvTreeClick(nil);
end;

procedure TfrmMain.getState;      //获得状态信息
begin
    checkState:='';
  if rgState.ItemIndex=0 then checkState:='and invalid = 0';
  if rgState.ItemIndex=1 then checkState:='and invalid = 1';
  if rgState.ItemIndex=2 then checkState:='and invalid in (0,1)';
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  item:TMenuItem;
  i:Integer;
begin
  if not App_Init(dm.ADOConnection1) then
  begin
    ShowMessage('程序起动失败,请与管理员联系!');
    application.Terminate;
  end;

//    vprev:='2';

    preColumn:= dgShowChild.Columns[1];
    Self.CreateTree;
    mainSQL:=DM.ADOShowChild.SQL.Text;
    tvTree.Items[0].Selected:=True;
    tvTree.Items[0].Expanded:=True;
    oldNode:=tvTree.Selected;
    Self.tvTreeClick(nil);
    if (vprev='1') or (vprev='3') then tvTree.DragMode:=dmManual
    else tvTree.DragMode:=dmAutomatic;
    
    for i:=0 to dgShowChild.Columns.Count-1 do                //给右键菜单添加字段
    begin
      item:=TMenuItem.Create(self);
      item.Caption:=dgShowChild.Columns[i].Title.Caption;
      item.Checked:=dgShowChild.Columns[i].Visible;
      item.OnClick:=itemClick;
      PopupMenu2.Items.Add(item);
    end;
end;

procedure TfrmMain.itemClick(sender:TObject);
var
  i:Integer;
begin
  (sender as TMenuItem).Checked := not (sender as TMenuItem).Checked;
  for i:=0 to dgShowChild.Columns.Count-1 do
  if (sender as TMenuItem).Caption=dgShowChild.Columns[i].title.caption then
  begin
    dgShowChild.Columns[i].Visible:=(sender as TmenuItem).checked;
    Break;
  end;
end;

procedure TfrmMain.btnExportClick(Sender: TObject);
begin
  if not DM.ADOShowChild.IsEmpty then
  if MessageDlg('您确认导出数据到Excel吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
    Export_dbGridEH_to_Excel(self.dgShowChild,self.Caption);
end;

procedure TfrmMain.btnFieldClick(Sender: TObject);
begin
  PopupMenu2.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmMain.btnUpdateClick(Sender: TObject);
begin
  if (StrToInt(vprev)=1) or (StrToInt(vprev)=3) then
  begin
    ShowMessage('你没有权限执行此操作');
    Abort;
  end;
  btnUpdate.Enabled:=False;
  try
    DM.ADOAddorEdit.Close;
    DM.ADOAddorEdit.SQL.Clear;
    DM.ADOAddorEdit.SQL.Add('exec dbo.hrsp_update_datadepartment_empcount');
    DM.ADOAddorEdit.ExecSQL;
    ShowMessage('部门人数信息统计已经更新');
  except
    on E:Exception do
    begin
      MessageDlg(E.Message,mtError,[mbCancel],0);
    end;
  end;
  btnUpdate.Enabled:=True;
end;

procedure TfrmMain.PopupMenu1Popup(Sender: TObject);
begin
  if (StrToInt(vprev)=1) or (StrToInt(vprev)=3) then
  begin
    pmAdd.Enabled:=False;
    pmEdit.Enabled:=False;
    pmDelete.Enabled:=False;
  end;
end;

function TfrmMain.isChild(desNode, SourNod: TTreeNode):Boolean;
begin
  while desNode.Parent <> nil do
  begin
    if (Integer(desNode.Parent.Data^) = Integer(SourNod.data^))
       or (Integer(desNode.Data^) = Integer(SourNod.data^)) then
    begin
      Result:=True;
      Exit;
    end;
    desNode:=desNode.Parent;
  end;
  Result:=False;
end;

procedure TfrmMain.tvTreeDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept:=False;
  if (tvTree.GetNodeAt(x,y)<>nil) and (tvTree.Selected.Level<>0) then
    Accept:=True;
end;

procedure TfrmMain.tvTreeDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  desNode:TTreeNode;
begin
  if tvTree.GetNodeAt(x,y)<>nil then
  begin
    desNode:=tvTree.GetNodeAt(x,y);
    if isChild(desNode,tvTree.Selected) then
    begin
      ShowMessage('不能移到本身或子部门');
      exit;
    end;
    if MessageDlg('你确定要把'+ tvTree.Selected.Text +'移动到'+ desNode.Text + '吗？',mtWarning,[mbYes,mbNo],0)<>mryes then Exit;
    tvTree.Selected.MoveTo(desNode,naAddChild);
    with DM.ADOAddorEdit do
    begin
      Close;
      SQL.Clear;
      sql.Add('update datadepartment set superior = ' + IntToStr(Integer(desNode.data^)) +
              ' where rkey = ' + IntToStr(Integer(tvTree.Selected.Data^)));
      ExecSQL;
    end;
  end;
  btnRefreshClick(nil);
end;

procedure TfrmMain.tvTreeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  tvTree.Selected:=tvTree.GetNodeAt(x,y);
  if tvTree.Selected=nil then tvTree.Selected:=tvTree.Items[0];
end;

procedure TfrmMain.btn_QryClick(Sender: TObject);
begin
  try
  if frmQryCount=nil then frmQryCount:=TfrmQryCount.Create(nil);
     FrmQryCount.ShowModal;
  finally
  frmQryCount.free;
  end;
end;

procedure TfrmMain.dgShowChildDblClick(Sender: TObject);
var
  LNode:TTreeNode;
  i:Integer;
begin
  for i:= 0 to tvTree.Items.Count-1 do
  begin
    if Integer(tvTree.Items[i].Data^) = DM.ADOShowChild.FieldByName('rkey').AsInteger then
    begin
      LNode:= tvTree.Items[i];
      while LNode.Parent <> nil do
      begin
        LNode.Parent.Expanded:= True;
        LNode:=LNode.Parent;
      end;
      tvTree.Items[i].Selected:= True;
      Break;
    end;
  end;
end;

end.
