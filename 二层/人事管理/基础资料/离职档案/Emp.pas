unit Emp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Menus, StdCtrls,StrUtils, Buttons, ComCtrls,common,
  ExtCtrls, Mask, DBCtrls, ComObj, ADODB, DB, ImgList;

type
  Tfm_emp = class(TForm)
    bbt_save: TBitBtn;
    bbt_exit: TBitBtn;
    pnl_temp: TPanel;
    dg_msg: TDBGrid;
    img_dept: TImageList;
    pm_msg: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    tv_dept: TTreeView;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    procedure CreateTree;
    procedure CreateNode(ParentNode: TTreeNode;Query: TADOQuery);
    procedure bbt_saveClick(Sender: TObject);
    procedure bbt_exitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tv_deptClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure dg_msgTitleClick(Column: TColumn);
  private
    { Private declarations }
    field_name, ss:string;

  public
    { Public declarations }
  end;

var
  fm_emp: Tfm_emp;
implementation
  uses damo, Madd;
{$R *.dfm}

procedure Tfm_Emp.CreateNode(ParentNode: TTreeNode;Query: TADOQuery);
var
  ChildNode:TTreeNode; //子结点
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
       ChildNode:=tv_dept.Items.AddChildObject(ParentNode,FieldByName('departmentname').AsString,NodeInfo); //添加孩结点，并关联子结点信息
       childnode.ImageIndex:=0;
       CreateNode(ChildNode,Query); //递归
       Next;
      end;
      childnode.ImageIndex:=1;
      Free; //释放无用的query
    end;
end;

procedure Tfm_Emp.CreateTree;
var
BootNode:TTreeNode; //根结点
NodeInfo:^Integer; //rkey
begin
with dm.qry_dept do
  begin
    Filtered:=False;
    Filter:= 'superior=0';
    Filtered:=True;

    New(NodeInfo);
    NodeInfo^:=FieldByName('rkey').AsInteger;
    tv_dept.Items.Clear;
    BootNode:=tv_dept.Items.AddChildObject(nil,FieldByName('departmentname').AsString,NodeInfo); //添加根结点，并关联根结点信息
  end;

CreateNode(BootNode,dm.qry_dept); //创建子树
//tv_dept.FullExpand;
tv_dept.AutoExpand:=true;
tv_dept.SetFocus;
tv_dept.ReadOnly:=true;
end;

procedure Tfm_emp.bbt_saveClick(Sender: TObject);
var
  i :integer;
  str1:string;
begin 
    if dg_msg.SelectedRows.Count <=0 then
  begin
    ShowMessage('当前没有选中任何记录，请选中一行进行操作！');
    Exit;
  end;
      if (dg_msg.SelectedRows.Count >1) and  (dm.AUTag = 1) then
  begin
    ShowMessage('请选其中中一行进行操作！');
    Exit;
  end;

  for i:=0 to fm_madd.sg_mtadd.RowCount do
  begin
    str1:=fm_madd.sg_mtadd.Cells[2,i];
    if str1 = DM.qry_msg.FieldValues['employeecode'] then
    begin
      application.MessageBox('有重复记录，请查证！','提示',64);
      exit;
    end;
  end;
  ModalResult:=mrOk;
end;

procedure Tfm_emp.bbt_exitClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure Tfm_emp.FormShow(Sender: TObject);
begin
  //CreateTree;
  dm.qry_dept.Filtered:=false;
  dm.qry_msg.Filtered := True;
    Label1.Visible := False;
    ComboBox1.Visible := true;
    combobox1.ItemIndex := dm.AUTag;
    Label2.Left := Label1.Left;
    Edit1.Left := ComboBox1.Left;
    ComboBox1Change(ComboBox1);
  field_name := dg_msg.Columns[0].FieldName;
  {if dm.AUTag = 0 then
  dg_msg.Options := dg_msg.Options + [dgMUltiSelect]+[dgrowselect]
  else   dg_msg.Options := dg_msg.Options - [dgMUltiSelect]+[dgrowselect];}
end;

procedure Tfm_emp.tv_deptClick(Sender: TObject);
var
temp:integer;
begin
  if tv_dept.Selected=nil then exit;
  if ComboBox1.ItemIndex = 0 then DM.qry_msg.Filter := ' status = 1';
  if ComboBox1.ItemIndex = 1 then DM.qry_msg.Filter := ' status = 2';
  temp:=Integer(tv_dept.Selected.Data^);
  dm.qry_msg.filter:=DM.qry_msg.Filter + ' and departmentid='+inttostr(temp);
end;

procedure Tfm_emp.N1Click(Sender: TObject);
var
i:integer;
begin
//全选
with dg_msg.DataSource.DataSet do
  begin
    disablecontrols;
    for i:=1 to RecordCount do
      begin
        RecNo:=i;
        dg_msg.SelectedRows.CurrentRowSelected:=true;
      end;
    enablecontrols;
  end;
end;

procedure Tfm_emp.N2Click(Sender: TObject);
var
i:integer;
begin
//反选
  with dg_msg.DataSource.DataSet do
  begin
    DisableControls;
    for i:=1 to RecordCount do
      begin
        RecNo:=i;
        dg_msg.SelectedRows.CurrentRowSelected:=Not dg_msg.SelectedRows.CurrentRowSelected;
      end;
    EnableControls;
  end;
end;

procedure Tfm_emp.ComboBox1Change(Sender: TObject);
begin
  dg_msg.DataSource.DataSet.Filtered := True;
  if ComboBox1.ItemIndex = 0 then
  begin
    dg_msg.DataSource.DataSet.Filter := ' status=1';
  end;
  if ComboBox1.ItemIndex = 1 then
  begin
    dg_msg.DataSource.DataSet.Filter := ' status=2';
  end;
end;

procedure Tfm_emp.Edit1Change(Sender: TObject);
begin
  dg_msg.DataSource.DataSet.Filtered := True;
  if trim(Edit1.text) <> '' then
    begin
      dg_msg.DataSource.DataSet.Filter :=  ' (' +  field_name + ' like ''%' + trim(Edit1.text) + '%'')';
      if ComboBox1.ItemIndex = 0 then dg_msg.DataSource.DataSet.Filter := dg_msg.DataSource.DataSet.Filter + ' and status=1';
      if ComboBox1.ItemIndex = 1 then dg_msg.DataSource.DataSet.Filter := dg_msg.DataSource.DataSet.Filter + ' and status=2';
    end
  else
    begin
      dg_msg.DataSource.DataSet.Filter := '';
      if ComboBox1.ItemIndex = 0 then dg_msg.DataSource.DataSet.Filter := dg_msg.DataSource.DataSet.Filter + ' status=1';
      if ComboBox1.ItemIndex = 1 then dg_msg.DataSource.DataSet.Filter := dg_msg.DataSource.DataSet.Filter + ' status=2';
    end;
end;

procedure Tfm_emp.dg_msgTitleClick(Column: TColumn);
var
    I,ii:Integer;
    cStr:string;
    c:TColumn;
begin
  Label2.Caption := Column.Title.Caption;
  field_name := Column.FieldName;
  Label2.Left := Edit1.Left - Label2.Width - 2;
  edit1.SetFocus;
   for ii:=0 to TDBGrid(Column.Grid).Columns.Count-1 do
    begin
        c:=TDBGrid(Column.Grid).Columns[ii];
        cStr:=c.Title.Caption;
        if (pos('▲',cStr)=1) or (pos('▼',cStr)=1) then
        begin
           Delete(cStr,1,2);
           c.Title.Caption:=cStr;
        end;
    end;

    for i:= 1 to dg_msg.Columns.Count do
    begin
        //恢复所有标题字体为默认
        dg_msg.Columns[i-1].Title.Font.Color := clWindowText;
        dg_msg.Columns[i-1].Title.Font.Style := [];
    end;
    if DM.qry_msg.Sort<>(Column.FieldName+' ASC') then //判断原排序方式
    begin
        DM.qry_msg.Sort := Column.FieldName+' ASC';
        Column.Title.Font.Color := clRed; //改变标题行字体为红色，表示当前的排序方式为升序
        Column.Title.Font.Style := [fsBold];
        Column.Title.Caption:='▲'+Column.Title.Caption; //标题加上三角形表示当前排序方式为升序;
    end
    else
    begin
        DM.qry_msg.Sort := Column.FieldName+' DESC';
        Column.Title.Font.Color := clBlue; //改变标题行字体为蓝色，表示当前的排序方式为降序
        Column.Title.Font.Style := [fsBold];
        Column.Title.Caption:='▼'+Column.Title.Caption; //标题加上倒三角形表示当前排序方式为降序;
    end;




end;

end.
