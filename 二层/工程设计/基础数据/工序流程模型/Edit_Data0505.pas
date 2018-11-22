unit Edit_Data0505;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Buttons, ADODB, DB, StdCtrls, DBCtrls, Mask,
  ImgList, Menus, Grids, DBGrids;

type

  PTreeValue= ^TTreeValue; //定义指针
  TTreeValue = record      //存放记录值
    rKey,dept_ptr,
    ttype:integer; //ttype:0站点,1工序
    bEditMode:byte;//0.浏览,1.新增,2.修改 
//    IsNew:boolean;
  end;
  {数型记录定位处理方法:
   TreeValue.rKey:主键
   如果新增站点,那么需要给TreeValue.rKey设置一个临时的数值,以区分站点(可能有同名的站点,
   但此时未保存到数据库,还没有rKey数值,可以用data0505的Supervisor_ptr字段来临时存放,保存前都要清空).
  }
  TfrmEdit_Data0505 = class(TForm)
    Panel1: TPanel;
    TreeView1: TTreeView;
    Panel2: TPanel;
    btnExpand: TSpeedButton;
    btnCollapse: TSpeedButton;
    Panel3: TPanel;
    adsData0505: TADODataSet;
    aqTmp: TADOQuery;
    Panel4: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    Label6: TLabel;
    SpeedButton17: TSpeedButton;
    Combobox3: TComboBox;
    Memo1: TDBMemo;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    spbtnSave: TSpeedButton;
    SpeedButton22: TSpeedButton;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    dsData050: TDataSource;
    adsTreeData: TADODataSet;
    ImageList: TImageList;
    PopupMenu1: TPopupMenu;
    N11: TMenuItem;
    N3: TMenuItem;
    N15: TMenuItem;
    N5: TMenuItem;
    N12: TMenuItem;
    N4: TMenuItem;
    N7: TMenuItem;
    N13: TMenuItem;
    N8: TMenuItem;
    N14: TMenuItem;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    ADOQuery1: TADOQuery;
    adsUpdate_Sub: TADODataSet;
    checkboxNew: TCheckBox;
    dsParameters: TDataSource;
    adsParameters: TADODataSet;
    procedure btnExpandClick(Sender: TObject);
    procedure btnCollapseClick(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure TreeView1Collapsed(Sender: TObject; Node: TTreeNode);
    procedure TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure TreeView1GetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure spbtnSaveClick(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure TreeView1Changing(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N14Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure Combobox3Change(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure adsData0505BeforeEdit(DataSet: TDataSet);
    procedure adsData0505BeforeInsert(DataSet: TDataSet);
    procedure adsData0505BeforeDelete(DataSet: TDataSet);
    procedure DBEdit2Change(Sender: TObject);
  private
    { Private declarations }
    KeyValue,EnterMode:integer;
//    procedure On
    MaxrKey,StepIncNum:integer;//IncNum:progressbar增长步长
    procedure ExpandTree;
    procedure CreateTreeView(NodeName:string;Node:TTreeNode;level:integer);//这个函数会耗用很多DataSet资源,不使用
    function Check_Before_Post:boolean;
    function UpdateDetail:boolean;//更新工序的顺序
    function LocateDataSetItem(TreeNode:TTreeNode):boolean;//定位记录
    function AddItem(ItemType:byte;AddType:byte):boolean;//增加子项目
    procedure ReleaseTreeValue;//释放指针内存
    function DeleteNodeData(Node:TTreeNode;ChildNode:boolean):boolean;//删除节点并释放单个节点指针占用的内存
    function Update_Eng_Param:boolean;
    procedure FieldOnChange(Sender: TField);
  public
    { Public declarations }
    procedure InitForm(pEnterMode:byte;pValue:integer);//窗口初始化
  end;

var
  frmEdit_Data0505: TfrmEdit_Data0505;

implementation
uses Main_097,Common,MYClass,ConstVar,processShow;
{$R *.dfm}

procedure TfrmEdit_Data0505.btnExpandClick(Sender: TObject);
begin
  TreeView1.FullExpand;
end;

procedure TfrmEdit_Data0505.btnCollapseClick(Sender: TObject);
begin
  TreeView1.FullCollapse;
end;

procedure TfrmEdit_Data0505.SpeedButton22Click(Sender: TObject);
begin
  close;
end;

procedure TfrmEdit_Data0505.InitForm(pEnterMode:byte;pValue:integer);
var
  aqQuery:TAdoQuery;
begin
//  BtnCancel.Enabled:= BtnSave.Enabled;
  spbtnSave.Enabled := false;
  EnterMode:=pEnterMode;
  KeyValue:= pValue;
  try
    aqQuery:= TadoQuery.Create(self);
    aqQuery.Connection := frmMain_097.ADOConnection1;
    Get_Eng_Table_Formula_List(aqQuery);
    aqQuery.First;
    while not aqQuery.Eof do begin
      Combobox3.Items.Add(aqQuery.fieldbyName('FXY').AsString);
      aqQuery.next;
    end;
  finally
    aqQuery.close;
    aqQuery.free;
  end;
  if EnterMode = em_Add then //1.浏览 2.新增 3.编辑
  begin
    frmMain_097.adsMaster.Append;
    adsData0505.close;
    adsData0505.Parameters[0].Value := -100; //空
    adsData0505.open;
    caption := caption + ' [新增]';
  end
  else
  begin
    adsData0505.close;
    adsData0505.Parameters[0].Value := frmMain_097.adsMaster.FieldByName('rKey').Value;
    adsData0505.open;
    ExpandTree;
//    CreateTreeView('0',nil,1);
    MyDataClass.OpenDataSetByPara(frmMain_097.adsMaster.fieldbyName('rkey').Value,adsParameters);    
  end;
  if EnterMode =em_Browse  then //浏览
  begin
    caption := caption + ' [浏览]';
  end else if enterMode=em_edit then
    caption := caption + ' [修改]';
  Memo1.ReadOnly := (EnterMode = em_browse);
  DBEdit1.ReadOnly := Memo1.ReadOnly;
  DBEdit2.ReadOnly := Memo1.ReadOnly;
  adsData0505.FieldByName('formula').OnChange:= FieldOnChange;
  ShowModal;
end;

procedure TfrmEdit_Data0505.SpeedButton17Click(Sender: TObject);
var
  tmp_value:string;
  sp1,sp2:string;
  i,j:integer;
begin
  if EnterMode= em_Browse then exit;
  tmp_value:= Pick_Eng_Param('',frmMain_097.ADOConnection1,2);
  if tmp_value <> '' then
  begin
    adsData0505.Edit;
    sp1:=' ';
    sp2:=' ';
    i:=Memo1.SelStart ;
    j:=Memo1.CaretPos.y;
    if copy(Memo1.Text,i,1)=' ' then sp1:='';
    if copy(Memo1.Text,i+1,1)=' ' then sp2:='';
    memo1.Lines[j]:=copy(memo1.Lines[j],1,i)+sp1+trim(tmp_value)+sp2+copy(memo1.Lines[j],i+1,length(memo1.Lines[j])-i);
    Memo1.SelStart:=i+length(sp1)+length(trim(tmp_value))+length(sp2);
    Memo1.SetFocus ;
  end;
end;

procedure TfrmEdit_Data0505.TreeView1Collapsed(Sender: TObject;
  Node: TTreeNode);
begin
  if Node.HasChildren then
    if Node.Expanded then
      Node.ImageIndex := 1
    else
      Node.ImageIndex := 0;
  TreeView1.Repaint;
end;

procedure TfrmEdit_Data0505.TreeView1GetImageIndex(Sender: TObject;
  Node: TTreeNode);
begin
  if Node.HasChildren then
    if Node.Expanded then
      Node.ImageIndex := 1
    else
      Node.ImageIndex := 0;
end;

procedure TfrmEdit_Data0505.ExpandTree;
VAR
  level:integer;
  mynode:Array [0..9] of Ttreenode;
  nodeTxt:string;
  ptrValue: PTreeValue; //记录每个成员的信息,
begin

  adsTreeData.Close;
  adsTreeData.CommandText:=' exec Eng_Flow_Expand '+IntToStr(KeyValue);
  adsTreeData.Open;
  Treeview1.Enabled:=True;
  Treeview1.Items.Clear;   
//设置根节点
//  mynode[level]:=Treeview.items.add(nil,RootText);
//  mynode[level].ImageIndex:=0;
  with adsTreeData do  begin
    try                                            
      while not Eof do
      begin
        level:=FieldByName('LevelId').asinteger;
        if fieldbyname('ttype').Asinteger=0 then //站点
          nodeTxt:=trim(FieldByName('node_name').AsString)
        else
        begin
          if level > 1 then
            nodeTxt:=trim(FieldByName('Dept_Name').AsString)+'['+trim(fieldvalues['Dept_code'])+']'
          else
            nodeTxt:=trim(FieldByName('Dept_Name').AsString);
        end;
        if level>0 then
        begin
          New(ptrValue);
          ptrValue.rKey := FieldByName('rKey').asinteger;
          ptrValue.ttype := FieldByName('ttype').asinteger;
          ptrValue.dept_ptr := FieldByName('Dept_ptr').asinteger; //属于工序
//          ptrValue.IsNew := false;
          ptrValue.bEditMode := 0;
          if Level= 1 then
            mynode[level]:=Treeview1.items.AddObject(nil,nodeTxt,ptrValue)
          else
            mynode[level]:=Treeview1.items.AddChildObject(mynode[level-1],nodeTxt,ptrValue);
          if FieldByName('ttype').asinteger = 0 then
            mynode[level].ImageIndex:=0
          else
            mynode[level].ImageIndex:=2;
        end;
        next;//下一条记录
      end;
    finally;
      close;
    End;
  end;
//  TreeView1.FullExpand;
{  TreeView1.Items.Clear ;
  adsTreeData.First;
  with adsTreeData do begin
    while not eof do begin
    if fieldbyname('parent').asinteger>0 then
    begin
        for i:=0 to TreeView1.items.count-1 do
        begin
          if Pinteger(TreeView1.items[i].data)^=fieldbyname('parent').asinteger then
            node:= TreeView1.items[i];
        end;

        if fieldbyname('ttype').asstring='0' then //根接点
        begin
           NODE:=TreeView1.Items.Addchild(node,copy(fieldvalues['node_name'],1,10));
           Node.ImageIndex := 0;
        end else
        begin
           NODE:=TreeView1.Items.Addchild(node,fieldvalues['dept_name']+'['+fieldvalues['dept_code']+']');
           Node.ImageIndex := 2;
        end;
    end else
    begin
        if fieldbyname('ttype').asinteger=0 then
          NODE:=TreeView1.Items.Addchild(nil,copy(fieldvalues['node_name'],1,10))
        else
          NODE:=TreeView1.Items.Addchild(nil,fieldvalues['dept_name']);

        if fieldbyname('ttype').asstring='0' then //根接点
           Node.ImageIndex := 0 else
             Node.ImageIndex := 2;
    end;

    next;
  end;
  if adsTreeData.IsEmpty then
  begin
    Node:=TreeView1.Items.Add(nil,'空白');
    Node.ImageIndex := 0;
  end;
  end;}
end;

procedure TfrmEdit_Data0505.TreeView1GetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;
end;

procedure TfrmEdit_Data0505.spbtnSaveClick(Sender: TObject);
begin
  if adsdata0505.RecordCount > 0 then
  begin
    if adsdata0505.RecordCount > 30 then //30:100中有3个30的循环增长量,所以步长大致为30的整除
      StepIncNum := 1
    else
      StepIncNum := 30 div adsdata0505.RecordCount;
  end
  else
      StepIncNum := 1;
  if not Assigned(frmProcessShow) then
  try
    frmProcessShow := TfrmProcessShow.Create(Application);
    frmProcessShow.Show;
    if Check_Before_Post then
    begin
      if not frmMain_097.ADOConnection1.InTransaction then
         frmMain_097.ADOConnection1.BeginTrans;
      try
  //1.保存主表,如果是新增记录,即可得到一个主表的rkey
        frmMain_097.adsMaster.UpdateBatch(arAll);
  //2.更新子表data0505的eng_flow_ptr值
        if not MyDataClass.UpdateValueToField(adsData0505,frmMain_097.adsMaster.fieldByName('rKey').Value,'Eng_Flow_ptr') then
        //if not UpdateDetail then
          abort;
        frmProcessShow.IncStep(StepIncNum,'正在处理数据...');
  //3.保存子表data0505
        adsData0505.UpdateBatch(arAll);

        if not Update_Eng_Param then    //处理工程参数
          abort;
  //4.子表如有新增的记录,就会产生一个rekey数值,继续更新子表的parent数值和step数值
        if not UpdateDetail then
          abort;

        if not MyDataClass.ExecSql('update data0505 set Supervisor_ptr=NULL where eng_flow_ptr='+frmMain_097.adsMaster.fieldByName('rKey').Asstring) then
          abort;
        frmMain_097.ADOConnection1.CommitTrans;
        frmProcessShow.IncStep(StepIncNum,'数据处理完成');
        spbtnSave.Enabled := false;
      except
        frmMain_097.ADOConnection1.RollbackTrans;
        begin
          ShowMsg('保存数据失败，请检查!','警告',1);
          abort;
        end;
      end;
    end
    else
      abort;
    close;
  finally
    frmProcessShow.hide;
    frmProcessShow.Free;
    frmProcessShow:= nil;
  end;
end;

function TfrmEdit_Data0505.Check_Before_Post: boolean;
var
  i:integer;
  sExpr:string;
begin
  frmProcessShow.IncStep(StepIncNum,'正在检验各项内容...');
  result := true;
  if trim(DBEdit1.Text)='' then
  begin
    ShowMsg('模型名称不能为空','提示',1);
    result := false;
    exit;
  end;
  frmProcessShow.IncStep(StepIncNum,'正在检验模型名称是否重复...');
  if EnterMode= em_Add then
  if MyDataClass.IsExists('select rKey from data0504 where Eng_Flow_Name='+QuotedStr(trim(DBEdit1.Text))) then
  begin
    ShowMsg('当前模型名称已经存在,不能重复,请重新输入','提示',1);
    result := false;
    exit;
  end;
  //验证所有公式正确性
  if adsdata0505.IsEmpty then
  begin
    ShowMsg('流程明细不能为空','提示',1);
    result := false;
    exit;
  end;
  frmProcessShow.IncStep(StepIncNum,'正在检验站点和工序...');
  for i:= 0 to TreeView1.Items.Count-1 do
  begin
    frmProcessShow.IncStep(StepIncNum,'正在检验'+TreeView1.Items[i].text+'公式是否正确...');
    if LocateDataSetItem(Treeview1.Items[i]) then
//      if not (checkboxNew.Checked and ( not PTreeValue(TreeView1.Items[i].Data)^.IsNew)) then //只需要处理新记录
//      if not (checkboxNew.Checked and ( PTreeValue(TreeView1.Items[i].Data)^.bEditMode=0)) then //只需要处理新记录
        if not Logic_Formula_Check(adsData0505.FieldByName('FORMULA').Asstring,frmMain_097.ADOConnection1,sExpr) then
        begin
          result := false;
          break;
        end;
  end;
end;

function TfrmEdit_Data0505.UpdateDetail: boolean;
var
  i,rKey:integer;
  ParentNo:integer;
begin
//更新子表的step和parent
  frmProcessShow.IncStep(StepIncNum,'正在处理数据...');
  try
    for i:= 0 to TreeView1.Items.Count-1 do
    begin
      frmProcessShow.IncStep(StepIncNum,'正在处理数据...');
      if LocateDataSetItem(Treeview1.Items[i]) then
      begin
        adsData0505.Edit;
        adsData0505.FieldByName('Step').AsInteger := i+1;
        adsData0505.Post;
        if adsData0505.FieldByName('parent').AsInteger= -9999 then //没有定义父编号,那么要把父编号找到
        begin
          if LocateDataSetItem(Treeview1.Items[i].Parent) then
            ParentNo:= adsData0505.FieldByName('rKey').Value
          else
          begin
            ShowMsg('数据表中未找到父编号记录:'+Treeview1.Items[i].Parent.Text,'提示',1);
            result := false;
            break;
          end;
          if LocateDataSetItem(Treeview1.Items[i]) then
          begin
            adsData0505.Edit;
            adsData0505.FieldByName('parent').Value :=ParentNo;
            adsData0505.Post;
          end;
        end;
      end
      else
      begin
        ShowMsg('没有找到相应的站点记录'+TreeView1.items[i].Text,'提示',1);
        result := false;
        exit;
      end;
    end;
    adsData0505.UpdateBatch(arAll);
    result := true;
  except
    result := false;
  end;
end;

procedure TfrmEdit_Data0505.TreeView1Click(Sender: TObject);
var
  rKey:integer;
  FieldName,FieldValue:string;
begin
  if TreeView1.Selected = nil then exit;
//  if PTreeValue(TreeView1.Selected.Data)^.IsNew then //新增的站点
  if PTreeValue(TreeView1.Selected.Data)^.bEditMode = 1 then //新增的站点
    FieldName:='Supervisor_ptr'  //临时存放一个rKey值,用来区分站点(未保存到数据库,无实际的rKey)
  else
    FieldName:='rKey';
  FieldValue:=IntToStr(PTreeValue(TreeView1.Selected.Data)^.rKey);
  if not adsData0505.Locate(FieldName,FieldValue,[]) then
  begin
    ShowMsg('没有找到相应的记录'+TreeView1.Selected.Text,'提示',1);
    abort;
  end;
end;

procedure TfrmEdit_Data0505.TreeView1Changing(Sender: TObject;
  Node: TTreeNode; var AllowChange: Boolean);
var
  rKey:integer;
  FieldName,FieldValue:string;
begin
//  if PTreeValue(Node.Data)^.IsNew then //新增的站点
  if PTreeValue(Node.Data)^.bEditMode = 1 then //新增的站点
    FieldName:='Supervisor_ptr'  //临时存放一个rKey值,用来区分站点(未保存到数据库,无实际的rKey)
  else
    FieldName:='rKey';
  FieldValue:=IntToStr(PTreeValue(Node.Data)^.rKey);
  if not adsData0505.Locate(FieldName,FieldValue,[]) then
  begin
    ShowMsg('没有找到相应的记录'+Node.Text,'提示',1);
    abort;
  end;

end;

procedure TfrmEdit_Data0505.PopupMenu1Popup(Sender: TObject);
begin
  if EnterMode = em_Browse then abort;
  if Assigned(TreeView1.Selected) then //未选择到Node
  begin
    N15.Visible := TreeView1.Selected.ImageIndex <> 2 ;//工序
    N7.Visible := TreeView1.Selected.ImageIndex <> 2 ;//工序
    N8.Visible := TreeView1.Selected.ImageIndex <> 2 ;//工序
  end;
end;

procedure TfrmEdit_Data0505.N11Click(Sender: TObject);
begin
  if not AddItem(1,1) then
    ShowMsg('添加站点失败','提示',1);
end;

function TfrmEdit_Data0505.LocateDataSetItem(TreeNode: TTreeNode): boolean;
var
  FieldName,FieldValue:string;
begin
//  if PTreeValue(TreeNode.data)^.IsNew then//新增的Item,无论是站点还是工序,需要用Supervisor_ptr'查找定位到DataSet
  if PTreeValue(TreeNode.data)^.bEditMode = 1 then//新增的Item,无论是站点还是工序,需要用Supervisor_ptr'查找定位到DataSet
    FieldName:= 'Supervisor_ptr'
  else
    FieldName:= 'rKey';
  FieldValue:= IntToStr(PTreeValue(TreeNode.data)^.rKey);
  result := adsData0505.Locate(FieldName,FieldValue,[])
end;

function TfrmEdit_Data0505.AddItem(ItemType, AddType: byte): boolean;
var
  InputString: string;
  vrkey:integer;
  Node,NodeNew:TTreeNode;
  ptrValue:PTreeValue;
begin
  result := true;
  try
    MaxrKey := Get_Max_SeqNo(adsData0505,'Supervisor_ptr');
    Node:=Treeview1.Selected ;
    with adsData0505 do begin
      if ItemType = 1 then //1.站点,2.工序
      begin
        InputString:= InputBox('新增站点', '站点名称:', '');
        if trim(InputString)='' then exit;
        append;
        fieldbyname('ttype').asstring:='0';
        fieldbyname('node_name').asstring:=Inputstring;
      end
      else
      begin  //工序
        InputString:= VarAsType(Pick_Eng_Flow('',frmMain_097.ADOConnection1,1),varString);
        if trim(InputString)='' then exit;
        append;
        fieldbyname('ttype').asstring:='1';
        fieldbyname('Dept_ptr').asstring:=Inputstring;
        InputString:= MyDataClass.Get_Sql_Value('select rtrim(Dept_Name)+''[''+rtrim(Dept_Code)+'']'' as F01 from data0034 where rKey='+Inputstring);
      end;
      if copy(IntToStr(MaxrKey),1,3) <> '911' then
        fieldbyname('Supervisor_ptr').Asstring := '911'+IntToStr(MaxrKey+1)
      else
        fieldbyname('Supervisor_ptr').Asstring := IntToStr(MaxrKey+1);
      New(ptrValue);
      ptrValue.rKey := fieldbyname('Supervisor_ptr').Asinteger;
      ptrValue.ttype := FieldByName('ttype').asinteger;
//      ptrValue.IsNew := true;
      ptrValue.bEditMode := 1;
      if AddType = 1 then //添加平级站点
        NodeNew:=Treeview1.items.AddObject(Node,Inputstring,ptrValue)
      else if AddType = 2 then //插入站点
        NodeNew:=Treeview1.items.InsertObject(Node,Inputstring,ptrValue)
      else if AddType = 3 then //添加子站点
        NodeNew:=Treeview1.items.AddChildObject(Node,Inputstring,ptrValue);
      if FieldByName('ttype').asinteger = 0 then
        NodeNew.ImageIndex:=0
      else
        NodeNew.ImageIndex:=2;
      if NodeNew.parent<>nil then
      begin
        if not PTreeValue(NodeNew.parent.data)^.bEditMode = 1 then
//        if not PTreeValue(NodeNew.parent.data)^.IsNew then
          fieldbyname('parent').asinteger:=PTreeValue(NodeNew.parent.data)^.rKey
        else
          fieldbyname('parent').asinteger:=-9999 //-9999标记是新增的,需要更新父编号
      end
      else
        fieldbyname('parent').asinteger:=0;
    end;
    result := true;
  except
    result := false;
  end;
  spbtnSave.Enabled := result;
end;

procedure TfrmEdit_Data0505.ReleaseTreeValue;
var
  i:integer;
  pNode: PTreeValue;
  Node : TTreeNode;
begin
  if Treeview1.Items.Count = 0 then
    exit;
  Node := Treeview1.Items.GetFirstNode;
  for i := 0 to Treeview1.Items.Count-1 do
  begin
    pNode := Treeview1.Items.Item[i].Data;
    if (pNode <> nil) and (Node.Level>0) then
    begin
      Dispose(pNode);
      pNode:=nil;
    end;
    Node:=Node.GetNext;
  end;
end;

procedure TfrmEdit_Data0505.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ReleaseTreeValue;//释放指针内存
end;

procedure TfrmEdit_Data0505.N14Click(Sender: TObject);
var
  i:integer;
  Node,node1:TtreeNode;
begin
  IF Treeview1.Items.Count =1 then
  begin
    ShowMsg('不能删除该节点，子项不能为空！','提示', 1);
    exit;
  end;
  Node:=Treeview1.selected;
  IF Treeview1.Selected.HasChildren then
  begin
    if not Msg_Dlg_Ask('你要将其子项全部删除吗?','提示',1) then exit;
    for i:=0 to Treeview1.Selected.count-1 do //删除子接点记录
    begin
      node1:=Treeview1.Selected.Item[i];
      if not DeleteNodeData(Node1,true) then  //
      begin
        ShowMsg('删除失败','提示',1);
        exit;
      end;
    end;
//    if Treeview1.Selected.parent<>nil then
//      Treeview1.Selected.parent.Selected := true;
  end;
  if not DeleteNodeData(Node,false) then //删除根节点
  begin
    ShowMsg('删除失败','提示',1);
    exit;
  end;
  Treeview1.Items.Delete(Node);
  if Treeview1.Selected.parent<>nil then
    Treeview1.Selected.parent.Selected := true;
  spbtnSave.Enabled := true;
end;

function TfrmEdit_Data0505.DeleteNodeData(Node: TTreeNode;ChildNode:boolean):boolean;
var
  PValue:PTreeValue;
  i:integer; 
begin
  result := false;
  if Node.HasChildren and ChildNode then
  begin
    for i := 0 to Node.Count - 1 do
      result := DeleteNodeData(Node.Item[i],true);
    result:= DeleteNodeData(Node,false);
  end
  else
  begin
    PValue:= Node.Data;
    if LocateDataSetItem(Node) then
    begin
      adsData0505.delete;                          //删除数据记录
      if (pValue <> nil) then
      begin
        Dispose(pValue);  //释放指针内存
        pValue:= nil;
      end;
      result := true;
    end
    else
    begin
      result := false;
      ShowMsg('没有找到相关的记录,删除失败!','提示',1);
    end;
  end;
  
end;

procedure TfrmEdit_Data0505.N3Click(Sender: TObject);
begin
  if not AddItem(1,2) then
    ShowMsg('插入站点失败','提示',1);
end;

procedure TfrmEdit_Data0505.N15Click(Sender: TObject);
begin
  if not AddItem(1,3) then
    ShowMsg('添加子站点失败','提示',1);
end;

procedure TfrmEdit_Data0505.N12Click(Sender: TObject);
begin
  if not AddItem(2,1) then
    ShowMsg('添加工序失败','提示',1);
end;

procedure TfrmEdit_Data0505.N4Click(Sender: TObject);
begin
  if not AddItem(2,2) then
    ShowMsg('插入工序失败','提示',1);
end;

procedure TfrmEdit_Data0505.N7Click(Sender: TObject);
begin
  if not AddItem(2,3) then
    ShowMsg('添加子工序失败','提示',1);
end;

procedure TfrmEdit_Data0505.N8Click(Sender: TObject);
var
  InputString: string;
  node:TTreeNode;
  ClickedOK:boolean;
begin
  node:=Treeview1.Selected;
  Inputstring:= Node.Text;
  ClickedOK := InputQuery('新的站点名称', '新站点名称:', Inputstring);
  if ClickedOK then
  begin
    if trim(InputString)='' then exit;
      if CompareStr(Node.Text,trim(Inputstring))<>0 then
        if LocateDataSetItem(Node) then
        begin
          adsData0505.edit;
          adsData0505.fieldbyname('node_name').asstring:=Inputstring;
          adsData0505.Post ;
          node.Text :=Inputstring;
          spbtnSave.Enabled := true;
        end;
  end;
end;


procedure TfrmEdit_Data0505.Combobox3Change(Sender: TObject);
var
  sp1,sp2:string;
  i,j:integer;
begin
  if EnterMode= em_browse then exit;
  adsData0505.Edit;
  sp1:=' ';
  sp2:=' ';
  i:=Memo1.SelStart ;
  j:=Memo1.CaretPos.y;
  if copy(Memo1.Text,i,1)=' ' then sp1:='';
  if copy(Memo1.Text,i+1,1)=' ' then sp2:='';
  memo1.Lines[j]:=copy(memo1.Lines[j],1,i)+sp1+trim(Combobox3.Text)+sp2+copy(memo1.Lines[j],i+1,length(memo1.Lines[j])-i);
  Memo1.SelStart:=i+1+length(sp1)+pos('(',trim(Combobox3.Text));
  Memo1.SelLength:=3;
  Memo1.SetFocus ;
end;

procedure TfrmEdit_Data0505.SpeedButton15Click(Sender: TObject);
begin
  if EnterMode= em_browse then exit;
  Memo1.clear
end;

procedure TfrmEdit_Data0505.SpeedButton3Click(Sender: TObject);
var
  sp1,sp2:string;
  i,j:integer;
  symbol_txt:string;
begin
  if EnterMode= em_browse then exit;
  adsData0505.Edit;
  symbol_txt:=(Sender as TSpeedButton).Caption;
  if symbol_txt = 'IF' then
    symbol_txt := 'IF( , , )';
  sp1:=' ';
  sp2:=' ';
  i:=Memo1.SelStart ;
  j:=Memo1.CaretPos.y;
  if copy(Memo1.Text,i,1)=' ' then sp1:='';
  if copy(Memo1.Text,i+1,1)=' ' then sp2:='';
  memo1.Lines[j]:=copy(memo1.Lines[j],1,i)+sp1+trim(symbol_txt)+sp2+copy(memo1.Lines[j],i+1,length(memo1.Lines[j])-i);
  Memo1.SelStart:=i+1+length(sp1)+pos('(',trim(symbol_txt));
  Memo1.SelLength:=3;
  Memo1.SetFocus ;
end;

procedure TfrmEdit_Data0505.SpeedButton16Click(Sender: TObject);
var tmp:string;
begin
  tmp:='';
  if not Logic_Formula_Check(Memo1.text,frmMain_097.ADOConnection1,tmp) then
    abort;
  ShowMsg('验证通过','提示',1);
end;

function TfrmEdit_Data0505.Update_Eng_Param: boolean;
var
  vstring,vstring1:string;
begin
  frmProcessShow.IncStep(StepIncNum,'正在更新工程参数...');
  result := true;
  try
    MyDataClass.OpenDataSetByPara(frmMain_097.adsMaster.fieldbyName('rkey').Value,adsUpdate_sub);
    MyDataClass.DeleteTable(adsUpdate_Sub);
    Adoquery1.close;
    Adoquery1.open;
    adsData0505.First;
    while not adsData0505.Eof do begin //循环项目表
      if trim(Memo1.text)<>'' then
      begin
        //如果旧的记录, 就不处理
//        if not (checkboxNew.Checked and (copy(adsData0505.FieldByName('Supervisor_ptr').AsString,1,3)<>'911'))then //只需要处理新记录
        begin
          vstring := AnsiUpperCase(' '+ Memo1.Text+' ');
          Adoquery1.first;
          with Adoquery1 do
          while not eof do                             //对参数表循环
          begin
            vstring1:=' '+AnsiUpperCase(trim(fieldbyname('Parameter_name').AsString))+' ';
            if pos(vstring1,vstring)>0 then
            begin
              frmProcessShow.IncStep(StepIncNum,'正在更新工程参数...');
              if not adsUpdate_Sub.Locate('Parameter_ptr', AdoQuery1.fieldbyname('rkey').asstring,[]) then
              begin
                adsUpdate_Sub.Append;
                adsUpdate_Sub.FieldByName('Parameter_ptr').asstring:= AdoQuery1.fieldbyname('rkey').asstring;
                adsUpdate_Sub.FieldByName('Source_ptr').asstring:= frmMain_097.adsMaster.fieldbyName('rkey').Value;
                adsUpdate_Sub.FieldByName('ttype').asstring:= '1';
                adsUpdate_Sub.Post;
              end;
            end;
            next;
          end;
        end;
      end;
      adsData0505.next;
    end;
    Adoquery1.close;
//    if adsUpdate_sub.Modified then
    adsUpdate_sub.UpdateBatch(arAll);
//    MyDataClass.OpenDataSetByPara(frmMain_167.adsMaster.fieldbyName('rkey').Asstring,adsParamList);
  except
    result := false;
  end;
end;

procedure TfrmEdit_Data0505.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if spbtnSave.Enabled then
  begin
    canclose:= Msg_Dlg_Ask('当前修改没有被保存,您确定放弃修改并退出吗?','提示',1);
    if canclose then
      if  frmMain_097.adsMaster.State in dsEditModes then
         frmMain_097.adsMaster.CancelUpdates;
  end
  else
    if frmMain_097.adsMaster.State in dsEditModes then
      frmMain_097.adsMaster.CancelUpdates;
end;

procedure TfrmEdit_Data0505.adsData0505BeforeEdit(DataSet: TDataSet);
begin
  frmMain_097.adsMaster.edit;
  spbtnSave.Enabled := true;
  if treeview1.Selected <> nil then
  begin
    if PTreeValue(treeview1.Selected.data)^.bEditMode = 0 then
    begin
      PTreeValue(treeview1.Selected.data)^.bEditMode := 2;
    end;
  end
  else
  begin
    ShowMsg('没有找到相应的项目!','提示',1);
    abort;
  end;
end;

procedure TfrmEdit_Data0505.adsData0505BeforeInsert(DataSet: TDataSet);
begin
  frmMain_097.adsMaster.edit;
  spbtnSave.Enabled := true;
end;

procedure TfrmEdit_Data0505.adsData0505BeforeDelete(DataSet: TDataSet);
begin
  frmMain_097.adsMaster.edit;
  spbtnSave.Enabled := true;
end;

procedure TfrmEdit_Data0505.FieldOnChange(Sender: TField);
var
  tmpstr:string;
begin
{  if copy(IntToStr(MaxrKey),1,3)='911' then
    tmpstr:= IntToStr(MaxrKey+2)
  else
    tmpstr:= '911'+IntToStr(MaxrKey+2);
//如果当前记录不是新增的,那么就要在临时的字段Supervisor_ptr中给一个'9110001'做标记,在更新工程参数的时候,就能识别该公式是否被修改过.
  if uppercase(sender.FieldName) = 'FORMULA' then
  begin
//    if Sender.IsNull then exit;
    if treeview1.Selected <> nil then
    begin
      if PTreeValue(treeview1.Selected.data)^.bEditMode <> 1 then
      begin
        adsData0505.FieldByName('Supervisor_ptr').Asstring := tmpstr;
      end;
    end
    else
    begin
      ShowMsg('没有找到相应的项目!','提示',1);
      abort;
    end;
  end;}
end;

procedure TfrmEdit_Data0505.DBEdit2Change(Sender: TObject);
begin
  if EnterMode= em_browse then abort;
  frmMain_097.adsMaster.Edit;
  spbtnSave.Enabled := true;
end;

procedure TfrmEdit_Data0505.CreateTreeView(NodeName: string;
  Node: TTreeNode;level:integer);
var  mLocalName: string;  TreeNode: TTreeNode;
     Ads_Tmp: TADODataSet;
     nodeTxt:string;
  ptrValue: PTreeValue; //记录每个成员的信息,
begin
  ADS_Tmp := TADODataSet.Create(Self);
  ADS_Tmp.Connection := frmMain_097.ADOConnection1;
  ADS_Tmp.LockType := ltBatchOptimistic;
  with ADS_Tmp do  begin
    Close;
    CommandText := //' select * from data0505 P where eng_flow_ptr=12 and IsNULL(parent,0)='+NodeName+' order by step';
                   ' select P.rkey, p.tType, p.Parent, p.Dept_ptr,P.Node_Name,P.step from data0505 P '+
                   ' where Eng_Flow_ptr='+IntTostr(KeyValue)+' and IsNULL(parent,0)='+NodeName+' order by step';
    Open;
    First;
    while not Eof do begin
      if fieldbyname('ttype').Asinteger=0 then //站点
        nodeTxt:=trim(FieldByName('node_name').AsString)
      else
      begin
        if level > 1 then
          nodeTxt:=trim(FieldByName('Dept_Name').AsString)+'['+trim(fieldvalues['Dept_code'])+']'
        else
          nodeTxt:=trim(FieldByName('Dept_Name').AsString);
      end;
      if level>0 then
      begin
        New(ptrValue);
        ptrValue.rKey := FieldByName('rKey').asinteger;
        ptrValue.ttype := FieldByName('ttype').asinteger;
        ptrValue.dept_ptr := FieldByName('Dept_ptr').asinteger; //属于工序
//          ptrValue.IsNew := false;
        ptrValue.bEditMode := 0;
        if Level= 1 then
          TreeNode:=Treeview1.items.AddObject(nil,nodeTxt,ptrValue)
        else
          TreeNode:=Treeview1.items.AddChildObject(node,nodeTxt,ptrValue);
        if FieldByName('ttype').asinteger = 0 then
          TreeNode.ImageIndex:=0
        else
          TreeNode.ImageIndex:=2;
      end;
      Inc(Level);
      mLocalName := FieldbyName('rKey').Asstring;
      CreateTreeView(mLocalName, TreeNode,Level);
      Next;
    end;
  end;
end;

end.
