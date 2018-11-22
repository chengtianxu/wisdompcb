unit rptDesign;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, DB, DBClient, Mask,
  RzEdit, RzDBEdit, ToolWin, ImgList, Menus;

type
  PTreeValue= ^TTreeValue; //定义指针
  TTreeValue = record      //存放记录值
    rptID,TopId:integer;
    rptName:string;
    Is_Group:boolean;
    bEditMode:byte;//0.浏览,1.新增,2.修改
//    IsNew:boolean;
  end;

  TfrmrptDesign = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    TreeView1: TTreeView;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    cdsMaster: TClientDataSet;
    dsMaster: TDataSource;
    cdsTreeData: TClientDataSet;
    Label2: TLabel;
    RzDBEdit2: TRzDBEdit;
    Label3: TLabel;
    RzDBEdit3: TRzDBEdit;
    Label4: TLabel;
    RzDBEdit4: TRzDBEdit;
    Panel4: TPanel;
    ImageList1: TImageList;
    ImageList2: TImageList;
    ToolBar1: TToolBar;
    btnNew: TToolButton;
    ToolButton2: TToolButton;
    btnDelete: TToolButton;
    ToolButton1: TToolButton;
    btnSave: TToolButton;
    btnCancel: TToolButton;
    btnExit: TToolButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    cdsGroupUpdate: TClientDataSet;
    PopupMenu2: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure btnExitClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure TreeView1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure TreeView1Changing(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
  private
    { Private declarations }
    function AddItem(rptName:string):boolean;//增加子项目
    function Update_rpt_Group(rptId:integer;rptName:string):boolean;//增加子项目
  public
    { Public declarations }
    procedure InitForm(pModId:integer);
  end;

var
  frmrptDesign: TfrmrptDesign;

implementation
uses rpt_Group_Edt,PUBFUNC,Client_FUnc,ConstDeclare;
{$R *.dfm}

function TfrmrptDesign.AddItem(rptName:string): boolean;
var
  ErrorMsg: widestring;
  vrkey:integer;
  Node,NodeNew:TTreeNode;
  ptrValue:PTreeValue;
  TopId,RptId:integer;
begin
  try
    Node:=Treeview1.Selected ;
    New(ptrValue);
//    cdsMaster.Append;
    if Node.parent<>nil then
      TopId:= PTreeValue(Node.data)^.rptID
    else
      TopId:=0;
    if not coMyQuery.Update_rpt_Group(TopId,RptName,ErrorMsg,RptId,1) then
    begin
      ShowMsg(ErrorMsg,1);
      result := false;
      exit;
    end;
    ptrValue.rptID := rptId;
    ptrValue.TopId := TopId;
    ptrValue.Is_Group := true;
    ptrValue.bEditMode := 1;
    ptrValue.rptName:=rptName;
{    cdsMaster.FieldByName('Rptid').Value := rptId;
    cdsMaster.FieldByName('Topid').Value := TopId;
    cdsMaster.FieldByName('rptName').Value := RptName;
    cdsMaster.FieldByName('Is_group').Value := true;
    cdsMaster.Post;}
    NodeNew:=Treeview1.items.AddChildObject(Node,rptName,ptrValue);
    result := true;
  except
    result := false;
  end;
end;

procedure TfrmrptDesign.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmrptDesign.N1Click(Sender: TObject);
var
  RptName:string;
begin
  with Tfrmrpt_Group_Edt.Create(Application) do
  try
    if ShowModal = mrok then
      rptName:= trim(edtRptName.Text)
    else
      rptName:= '';
  finally
    free;
  end;
  if rptName = '' then exit;
  AddItem(rptName);
end;

procedure TfrmrptDesign.TreeView1Click(Sender: TObject);
var
  rKey:integer;
  FieldName,FieldValue:string;
begin
  if TreeView1.Selected = nil then exit;
  if PTreeValue(TreeView1.Selected.Data)^.Is_Group then
  begin
    TreeView1.PopupMenu := PopupMenu1;
    exit;
  end
  else
  begin
    TreeView1.PopupMenu := PopupMenu2;
  end;
  FieldValue:=IntToStr(PTreeValue(TreeView1.Selected.Data)^.rptId);
//  if
  if not cdsMaster.Locate('RptId',FieldValue,[]) then
  begin
    ShowMsg('没有找到相应的报表'+TreeView1.Selected.Text,'提示',1);
    abort;
  end;
end;

procedure TfrmrptDesign.PopupMenu1Popup(Sender: TObject);
begin
//  if
end;

procedure TfrmrptDesign.N3Click(Sender: TObject);
var
  RptName:string;
begin
  with Tfrmrpt_Group_Edt.Create(Application) do
  try
    edtRptName.Text := Treeview1.Selected.Text;
    if ShowModal = mrok then
      rptName:= trim(edtRptName.Text)
    else
      rptName:= '';
  finally
    free;
  end;
  if rptName = '' then exit;
  Update_rpt_Group(PTreeValue(TreeView1.Selected.Data)^.rptID,rptName);
end;

function TfrmrptDesign.Update_rpt_Group(rptId: integer;
  rptName: string): boolean;
var
  ErrorMsg: widestring;
  Node,NodeNew:TTreeNode;
  ptrValue:PTreeValue;
begin
  try
    Node:=Treeview1.Selected ;
    if not coMyQuery.Update_rpt_Group(0,RptName,ErrorMsg,RptId,2) then
    begin
      ShowMsg(ErrorMsg,1);
      result := false;
      exit;
    end;
    Node.Text := RptName;
    result := true;
  except
    result := false;
  end;
end;

procedure TfrmrptDesign.N2Click(Sender: TObject);
var
  Node:TTreeNode;
  ErrorMsg:widestring;
begin
  Node:=Treeview1.Selected ;
  if Node.HasChildren then
  begin
    ShowMsg('该报表组包含有报表,不能删除','提示',1);
    exit;
  end;
  try
    if not coMyQuery.Update_rpt_Group(0,Node.Text,ErrorMsg,PTreeValue(Node.Data)^.rptId,3) then
    begin
      ShowMsg(ErrorMsg,1);
      exit;
    end;
    Dispose(PTreeValue(Node.Data));
    Node.Delete;
  except
  end;
end;

procedure TfrmrptDesign.N5Click(Sender: TObject);
var
  topId:integer;
begin
  if treeview1.Selected.Parent = nil then
    topId:=0
  else
    topId:= PTreeValue(treeview1.Selected.Data)^.TopId;
  cdsMaster.Append;
  cdsMaster.FieldByName('TopId').Value := TopId;
end;

procedure TfrmrptDesign.btnSaveClick(Sender: TObject);
var
  vData:olevariant;
  ErrorMsg:wideString;
begin
  if cdsMaster.State in dsEditModes then
    cdsMaster.Post;
  if cdsMaster.ChangeCount > 0 then
  begin
    vData:= cdsMaster.Delta;
    if not coMyQuery.Update_One_Table(rpt_Item_Set,vData,ErrorMsg,'') then
      ShowMsg(ErrorMsg,1);
  end;
end;

procedure TfrmrptDesign.TreeView1Changing(Sender: TObject; Node: TTreeNode;
  var AllowChange: Boolean);
var
  rKey:integer;
  FieldName,FieldValue:string;
begin
//  if PTreeValue(Node.Data)^.IsNew then //新增的站点
//  FieldValue:=IntToStr(PTreeValue(Node.Data)^.rKey);
{  if not adsData0505.Locate(FieldName,FieldValue,[]) then
  begin
    ShowMsg('没有找到相应的记录'+Node.Text,'提示',1);
    abort;
  end;}
end;

procedure TfrmrptDesign.InitForm(pModId:integer);
begin
{  ModId:=pModId;
  Mstrl_KeyField:=M_KeyField;
  Dtl_KeyField:=D_KeyField;
 }
//  BillNo:=pBillNO;
//  Update_Log(ModId,act_Enter,'');
{
  if coMyQuery.Get_Mult_Data(ModId,pBillNo,vData,ErrorMsg) then
  begin
    cdsMaster.Data := vData[0];
    cdsDetail.Data := vData[1];
  end
  else
    ShowMsg(ErrorMsg,'提示',1);}
//  OpenData(ModId,pBillNo,1);
//  Show;
end;

end.
